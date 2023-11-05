Return-Path: <linux-usb+bounces-2544-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E8D7E1271
	for <lists+linux-usb@lfdr.de>; Sun,  5 Nov 2023 08:26:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF0C32814ED
	for <lists+linux-usb@lfdr.de>; Sun,  5 Nov 2023 07:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0BFC613E;
	Sun,  5 Nov 2023 07:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GaXRtocQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F982CA7;
	Sun,  5 Nov 2023 07:26:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D73C433C8;
	Sun,  5 Nov 2023 07:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699169206;
	bh=6/RPGmtF74OYAOj5+K+VLy3tMMPqiKm7Xs8iyq0nqvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GaXRtocQAc1Paqxsn6eJGYeevFhJZtamePoCHs5x+2VpxyAkji8CIWA4de+DG3GbZ
	 P6iV5WitOwk+I8IrczfC9K7cn7AvJ39ND41w9YoNCUz6NLnXKckY43H+09VQSEph4i
	 8z5FIUVv+RdRC8FoG1GOk0Drz7As2tylEbJgLTtE=
Date: Sun, 5 Nov 2023 08:26:43 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wedson Almeida Filho <walmeida@microsoft.com>,
	linux-usb@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v3 2/2] samples: rust: Add USB sample bindings
Message-ID: <2023110544-nimble-routing-98b6@gregkh>
References: <20231104211213.225891-1-yakoyoku@gmail.com>
 <20231104211213.225891-3-yakoyoku@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231104211213.225891-3-yakoyoku@gmail.com>

On Sat, Nov 04, 2023 at 06:11:59PM -0300, Martin Rodriguez Reboredo wrote:
> This is a demonstration of the capabilities of doing bindings with
> subsystems that may or may not be statically linked.
> 
> Signed-off-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
> ---
> v2 -> v3:
> - Generate bindings for USB.
> v1 -> v2:
> - Added this patch.

I know you are just using this for an example, but here's some
USB-specific things that you might want to clean up for when you submit
this as a "real" binding sometime in the future:

> +config USB_RUST
> +	bool "Rust USB bindings"

This is a "USB Host" binding.  We have both USB host mode (when you plug
a USB device into a system running Linux), and USB gadget mode (when
Linux is running on the USB device you plug into any other USB system).

So please be specific here, this should be "USB_HOST_RUST" and then
later, "USB_GADGET_RUST".

> +	depends on USB && RUST
> +	default n

Again, "default n" is the default, never list it again.


> +	help
> +	  Enables Rust bindings for USB.

USB Host, not all of USB.

> diff --git a/drivers/usb/core/Makefile b/drivers/usb/core/Makefile
> index 7d338e9c0657..00e116913591 100644
> --- a/drivers/usb/core/Makefile
> +++ b/drivers/usb/core/Makefile
> @@ -11,6 +11,7 @@ usbcore-y += phy.o port.o
>  usbcore-$(CONFIG_OF)		+= of.o
>  usbcore-$(CONFIG_USB_PCI)		+= hcd-pci.o
>  usbcore-$(CONFIG_ACPI)		+= usb-acpi.o
> +usbcore-$(CONFIG_USB_RUST)		+= libusb.rlib
>  
>  ifdef CONFIG_USB_ONBOARD_HUB
>  usbcore-y			+= ../misc/onboard_usb_hub_pdevs.o
> @@ -18,4 +19,6 @@ endif
>  
>  obj-$(CONFIG_USB)		+= usbcore.o
>  
> +rust-libs			:= ./usb

Why the "./", why not just ":= usb" ?

> +config SAMPLE_RUST_USB_SIMPLE
> +	tristate "USB simple device driver"
> +	help
> +	  This option builds the Rust USB simple driver sample.

Rust USB simple host driver sample.

>  subdir-$(CONFIG_SAMPLE_RUST_HOSTPROGS)		+= hostprogs
> diff --git a/samples/rust/rust_usb_simple.rs b/samples/rust/rust_usb_simple.rs
> new file mode 100644
> index 000000000000..3523f81d5eb8
> --- /dev/null
> +++ b/samples/rust/rust_usb_simple.rs
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Rust USB sample.
> +
> +use kernel::prelude::*;
> +
> +module! {
> +    type: UsbSimple,

"USBSimple" please.  I thought I said that before.

thanks,

greg k-h

