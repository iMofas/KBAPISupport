//
//  UIKit+UIImageLoading.swift
//  KBAPISupport
//
//  Created by Kirill Bystrov on 8/3/18.
//  Copyright © 2018 Kirill byss Bystrov. All rights reserved.
//

import UIKit

extension UIImageView: UIImageLoading {}
extension UIImageView: UIImageLoadingImplementation {
	@usableFromInline
	internal func handleLoadedImage (_ image: UIImage) {
		self.image = image;
	}
}

extension UIButton: UIImageLoading {}
extension UIButton: UIImageLoadingImplementation {
	@usableFromInline
	internal func handleLoadedImage (_ image: UIImage) {
		self.setImage (image, for: .normal);
	}
}

extension UIBarButtonItem: UIImageLoading {}
extension UIBarButtonItem: UIImageLoadingImplementation {
	@usableFromInline
	internal func handleLoadedImage (_ image: UIImage) {
		self.image = image;
	}
}