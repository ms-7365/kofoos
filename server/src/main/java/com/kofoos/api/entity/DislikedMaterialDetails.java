package com.kofoos.api.entity;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Table(name = "disliked_material_details")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class DislikedMaterialDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "disliked_material_details")
    private Long id;

    @Column(length = 15, name = "detail_name")
    private String detailName;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "material_id")
    private DislikedMaterial dislikedMaterial;

    @Builder
    public DislikedMaterialDetails(String detailName, DislikedMaterial dislikedMaterial) {
        this.detailName = detailName;
        setDislikedMaterial(dislikedMaterial);
    }

    private void setDislikedMaterial(DislikedMaterial dislikedMaterial){
        this.dislikedMaterial = dislikedMaterial;
        dislikedMaterial.getDislikedMaterialDetailsList().add(this);
    }
}