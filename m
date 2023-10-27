Return-Path: <linux-usb+bounces-2247-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 566A77D8F72
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 09:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 532F61C21052
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 07:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F77B66C;
	Fri, 27 Oct 2023 07:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QznlPtY7"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712AFBA26;
	Fri, 27 Oct 2023 07:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3976EC433C7;
	Fri, 27 Oct 2023 07:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698390944;
	bh=WRMtuzaQ5PUuBaVeb+CCbcTOs/PXWi9a2Kg5e5ysQ28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QznlPtY7/rsFqZerrMxGqhj07IDXB0gQ2kx78eV+o03hNDPhH//rDL5hgmB6epPUT
	 tMu2S+7Z+kkWF/PcWnO6/CVPNPAh6W7Aw6xbe9V2Vf8ZevqsLDkidBo9bhKsb7rgAj
	 CkwF3dS8o7zBxn/llqF6PwXM8xv5gGZz3CPb5KnY=
Date: Fri, 27 Oct 2023 09:15:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v2 2/2] samples: rust: Add USB sample bindings
Message-ID: <2023102737-juniper-trodden-afb4@gregkh>
References: <20231027003504.146703-1-yakoyoku@gmail.com>
 <20231027003504.146703-3-yakoyoku@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027003504.146703-3-yakoyoku@gmail.com>

On Thu, Oct 26, 2023 at 09:34:51PM -0300, Martin Rodriguez Reboredo wrote:
> This is a demonstration of the capabilities of doing bindings with
> subsystems that may or may not be statically linked.
> 
> Signed-off-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
> ---
>  drivers/usb/core/Kconfig        |  7 +++++++
>  drivers/usb/core/Makefile       |  3 +++
>  drivers/usb/core/usb.rs         | 13 +++++++++++++
>  samples/rust/Kconfig            | 10 ++++++++++
>  samples/rust/Makefile           |  3 +++
>  samples/rust/rust_usb_simple.rs | 22 ++++++++++++++++++++++
>  6 files changed, 58 insertions(+)
>  create mode 100644 drivers/usb/core/usb.rs
>  create mode 100644 samples/rust/rust_usb_simple.rs
> 
> diff --git a/drivers/usb/core/Kconfig b/drivers/usb/core/Kconfig
> index 351ede4b5de2..4b5604282129 100644
> --- a/drivers/usb/core/Kconfig
> +++ b/drivers/usb/core/Kconfig
> @@ -116,3 +116,10 @@ config USB_AUTOSUSPEND_DELAY
>  	  The default value Linux has always had is 2 seconds.  Change
>  	  this value if you want a different delay and cannot modify
>  	  the command line or module parameter.
> +
> +config USB_RUST
> +	bool "Rust USB bindings"
> +	depends on USB && RUST
> +	default n

Nit, "n" is the default, this line is not needed.

Also, if you want to get really picky, _which_ USB is this for, the
"host" apis (you plug a USB device into a Linux maching), or the
"gadget" apis (i.e. Linux is running in the device that you plug into a
USB host)?  Linux supports both :)

> +	help
> +	  Enables Rust bindings for USB.
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
> +
>  obj-$(CONFIG_USB_LEDS_TRIGGER_USBPORT)	+= ledtrig-usbport.o
> diff --git a/drivers/usb/core/usb.rs b/drivers/usb/core/usb.rs
> new file mode 100644
> index 000000000000..3f7ad02153f5
> --- /dev/null
> +++ b/drivers/usb/core/usb.rs
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! USB devices and drivers.
> +//!
> +//! C header: [`include/linux/usb.h`](../../../../include/linux/usb.h)
> +
> +use kernel::bindings;
> +
> +/// Check if USB is disabled.
> +pub fn disabled() -> bool {
> +    // SAFETY: FFI call.
> +    unsafe { bindings::usb_disabled() != 0 }
> +}
> diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
> index b0f74a81c8f9..12116f6fb526 100644
> --- a/samples/rust/Kconfig
> +++ b/samples/rust/Kconfig
> @@ -30,6 +30,16 @@ config SAMPLE_RUST_PRINT
>  
>  	  If unsure, say N.
>  
> +config SAMPLE_RUST_USB_SIMPLE
> +	tristate "USB simple device driver"
> +	help
> +	  This option builds the Rust USB simple driver sample.
> +
> +	  To compile this as a module, choose M here:
> +	  the module will be called rust_usb_simple.
> +
> +	  If unsure, say N.
> +
>  config SAMPLE_RUST_HOSTPROGS
>  	bool "Host programs"
>  	help
> diff --git a/samples/rust/Makefile b/samples/rust/Makefile
> index 03086dabbea4..f1ab58a9ecdd 100644
> --- a/samples/rust/Makefile
> +++ b/samples/rust/Makefile
> @@ -2,5 +2,8 @@
>  
>  obj-$(CONFIG_SAMPLE_RUST_MINIMAL)		+= rust_minimal.o
>  obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o
> +obj-$(CONFIG_SAMPLE_RUST_USB_SIMPLE)		+= rust_usb_simple.o
> +
> +rust-libs					:= ../../drivers/usb/core/usb
>  
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
> +    name: "rust_usb_simple",
> +    author: "Martin Rodriguez Reboredo",
> +    description: "Rust USB sample",
> +    license: "GPL v2",
> +}
> +
> +struct UsbSimple;

"USBSimple" please.

> +
> +impl kernel::Module for UsbSimple {
> +    fn init(_module: &'static ThisModule) -> Result<Self> {
> +        pr_info!("usb enabled: {}", !usb::disabled());
> +        Ok(UsbSimple)
> +    }
> +}

I know this is just a fake patch to test the bindings logic, so sorry
for the noise, just wanted to get terminology right :)

thanks,

greg k-h

