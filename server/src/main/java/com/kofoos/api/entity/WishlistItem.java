package com.kofoos.api.entity;

import jakarta.persistence.*;
import lombok.*;


@Entity
@Getter
@Table(name = "wishlist_item")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class WishlistItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private Integer bought;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id")
    private Product product;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id")
    private Image image;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id")
    private WishlistFolder wishlistFolder;

    @Builder
    public WishlistItem(Integer bought,Image image, Product product, WishlistFolder wishlistFolder) {
        this.bought = bought;
        setProduct(product);
        setImage(image);
        setWishlistFolder(wishlistFolder);
    }

    private void setProduct(Product product) {
        this.product = product;
        product.setWishlistItem(this);
    }

    private void setImage(Image image){
        this.image = image;
        image.setWishlistItem(this);
    }


    private void setWishlistFolder(WishlistFolder wishlistFolder) {
        this.wishlistFolder = wishlistFolder;
        wishlistFolder.getWishlistitems().add(this);
    }

    public void updatebought(int bought){
        this.bought = bought;
    }

}