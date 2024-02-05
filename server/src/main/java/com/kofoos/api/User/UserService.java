package com.kofoos.api.User;

import com.kofoos.api.User.Repository.HistoryRepository;
import com.kofoos.api.User.Repository.UserDislikesMaterialRepository;
import com.kofoos.api.common.dto.DislikedMaterialDto;
import com.kofoos.api.common.dto.HistoryDto;
import com.kofoos.api.User.dto.MyPageDto;
import com.kofoos.api.entity.DislikedMaterial;
import com.kofoos.api.entity.User;
import com.kofoos.api.entity.UserDislikesMaterial;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.kofoos.api.User.Repository.DislikedMaterialRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final UserDislikesMaterialRepository userDislikesMaterialsRepo;
    private final DislikedMaterialRepository dislikedMaterialRepository;
    private final HistoryRepository historyRepository;

    public void registerUser(User user){
        userRepository.save(user);
    }

    //유저 가입여부 확인용 메서드
    public boolean isUserAlreadyRegistered(String deviceId) {
        return userRepository.existsByDeviceId(deviceId);
    }

    //비선호 음식 추가
    // UserService.java
    public void addUserDislikedMaterials(int userId, List<Integer> materialIds) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        for (Integer materialId : materialIds) {
            DislikedMaterial material = dislikedMaterialRepository.findById(materialId)
                    .orElseThrow(() -> new RuntimeException("Disliked Material not found"));

            UserDislikesMaterial userDislikesMaterials = UserDislikesMaterial.builder()
                    .user(user)
                    .dislikedMaterial(material)
                    .build();
            userDislikesMaterialsRepo.save(userDislikesMaterials);
        }
    }


//    //유저의 비선호 음식 리스트 조회
//    public List<DislikedMaterial> getUserDislikedMaterials(int userId) {
//        List<UserDislikesMaterial> userDislikes = userDislikesMaterialsRepo.findByUserId(userId);
//        return userDislikes.stream()
//                .map(UserDislikesMaterial::getDislikedMaterial)
//                .collect(Collectors.toList());
//    }

    // 사용자 ID를 기반으로 비선호 식재료 ID 목록 조회
    public List<Integer> getUserDislikedMaterials(int userId) {
        return userDislikesMaterialsRepo.findByUserId(userId)
                .stream()
                .map(UserDislikesMaterial::getMaterialId) // getMaterialId()는 실제 식재료 ID를 반환하는 메소드 이름으로 가정
                .collect(Collectors.toList());
    }

    // 사용자의 비선호 식재료 목록을 새 목록으로 업데이트
    @Transactional
    public void updateUserDislikedMaterials(int userId, List<Integer> newDislikedMaterialsIds) {
        // 사용자 객체 조회
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        // 기존 비선호 식재료 목록 삭제
        userDislikesMaterialsRepo.deleteByUserId(userId);

        // 새로운 비선호 식재료 목록 삽입
        for (Integer materialId : newDislikedMaterialsIds) {
            DislikedMaterial material = dislikedMaterialRepository.findById(materialId)
                    .orElseThrow(() -> new RuntimeException("Disliked Material not found"));

            UserDislikesMaterial newUserDislikesMaterial = UserDislikesMaterial.builder()
                    .user(user)
                    .dislikedMaterial(material)
                    .build();
            userDislikesMaterialsRepo.save(newUserDislikesMaterial);
        }
    }



    //회원 삭제
    public void deleteUser(int userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        // 회원을 삭제하는 대신 여기에서 비활성화 상태로 설정하거나 특별한 플래그를 설정할 수 있습니다.
        // user.setDeleted(true);
        // userRepository.save(user);

        // 또는 실제로 삭제하려면 아래와 같이 사용할 수 있습니다.
        userRepository.delete(user);
    }

    //마이페이지 조회
    public MyPageDto getMyPageInfo(int userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
        String language = user.getLanguage();
        System.out.println("언어정보:"+language);
        // 정보 변환 로직 구현
        // 비선호 식재료 변환
        List<DislikedMaterialDto> dislikedMaterials = userDislikesMaterialsRepo.findByUserId(userId).stream()
                .map(udm -> DislikedMaterialDto.of(udm.getDislikedMaterial()))
                .collect(Collectors.toList());

        // 히스토리 변환 (최근 10개, 중복 제거)
        List<HistoryDto> histories = historyRepository.findTop10ByUserIdOrderByViewTimeDesc(userId).stream()
                .distinct()
                .map(history -> HistoryDto.fromEntity(history))
                .collect(Collectors.toList());

        return new MyPageDto(language, dislikedMaterials, histories);
    }


}