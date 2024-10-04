Return-Path: <linux-usb+bounces-15708-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F0699048F
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 15:37:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FD951F228DB
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 13:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC6A212EED;
	Fri,  4 Oct 2024 13:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XpfqaVrs"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819F32101B5;
	Fri,  4 Oct 2024 13:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728049044; cv=none; b=QzSubcMYLGObaU7f/nG5phTQ57vh++Z/gjvmXxefTw7ooR5Uvg+vBknkpiyc6PpxSq0WIa6fHQ8He85ch8RZqps0qZgkwiHPDxmOCrMJT5CTD43FAXqyQKxNvhkzPh6+HAMMOF/PJZsruoC7L4s8QQfHz3zo5kUv2VW3NvRlCrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728049044; c=relaxed/simple;
	bh=VCQYCMDeLbPZDcPRtkc1G603J37v7olth2VxaQVhvz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zo23umqdLHGERaSEVUI/XS/X1VK2WBQfb5sGrT+Yw8E2yTM/pUWEd+w20JUK1Ol+8yKjg8MJLi92WwWivZRC3k4l6wK4ycqTriCHuoV3IP7IaAhI1yQs/7XtOuhbV0Hkhc3iTxKc05clO4w/jv3vvVOGyKaqH0N3XKxLrRSevvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XpfqaVrs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427CFC4CEE9;
	Fri,  4 Oct 2024 13:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728049043;
	bh=VCQYCMDeLbPZDcPRtkc1G603J37v7olth2VxaQVhvz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XpfqaVrs9UxEMSduJFeoUmIKN/iVYISdJ2r0COgFTfBx+hqY0h80HLSFF9ZsWVl0e
	 /ZEeqjc+4ZA6777fFXNI+cMl4pf1arORMPZmAwiT4SeaVAzKx1rVhUD+2u0xkYXHEM
	 gjNi6vWGeAmvb3Fgb/rXQI2Raf+cvG4nf0YVPPxU=
Date: Fri, 4 Oct 2024 15:37:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: mka@chromium.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, wentong.wu@intel.com,
	sakari.ailus@linux.intel.com, javier.carrasco@wolfvision.net,
	matthias@kaehlcke.net, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	git@amd.com
Subject: Re: [PATCH v2] usb: misc: onboard_usb_dev: introduce new config
 symbol for usb5744 SMBus support
Message-ID: <2024100406-spyglass-roulette-761d@gregkh>
References: <1727529992-476088-1-git-send-email-radhey.shyam.pandey@amd.com>
 <2024100442-yoyo-fifth-2125@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024100442-yoyo-fifth-2125@gregkh>

On Fri, Oct 04, 2024 at 03:36:11PM +0200, Greg KH wrote:
> On Sat, Sep 28, 2024 at 06:56:32PM +0530, Radhey Shyam Pandey wrote:
> > Introduce new kernel config symbol for Microchip usb5744 SMBus programming
> > support. Since usb5744 i2c initialization routine uses i2c SMBus APIs these
> > APIs should only be invoked when kernel has I2C support. This new kernel
> > config describes the dependency on I2C kernel support and fix the below
> > build issues when USB_ONBOARD_DEV=y and CONFIG_I2C=m.
> > 
> > riscv64-linux-ld: drivers/usb/misc/onboard_usb_dev.o:
> > undefined reference to `i2c_find_device_by_fwnode'
> > drivers/usb/misc/onboard_usb_dev.c:408:(.text+0xb24): undefined
> > reference to `i2c_smbus_write_block_data'
> > <snip>
> > 
> > Parsing of the i2c-bus bus handle is not put under usb5744 kernel config
> > check as the intention is to report an error when DT is configured for
> > usb5744 SMBus support and kernel has USB_ONBOARD_DEV_USB5744 disabled.
> > 
> > Fixes: 6782311d04df ("usb: misc: onboard_usb_dev: add Microchip usb5744 SMBus programming support")
> > Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> > Suggested-by: Matthias Kaehlcke <matthias@kaehlcke.net>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202409140539.3Axwv38m-lkp@intel.com/
> > Acked-by: Matthias Kaehlcke <matthias@kaehlcke.net>
> > ---
> > Changes for v2:
> > - As suggested by Greg drop default 'y' and instead describe the
> >   constraints in the kconfig description.
> > ---
> >  drivers/usb/misc/Kconfig           | 12 ++++++++++++
> >  drivers/usb/misc/onboard_usb_dev.c |  6 ++++--
> >  2 files changed, 16 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
> > index 50b86d531701..6497c4e81e95 100644
> > --- a/drivers/usb/misc/Kconfig
> > +++ b/drivers/usb/misc/Kconfig
> > @@ -331,3 +331,15 @@ config USB_ONBOARD_DEV
> >  	  this config will enable the driver and it will automatically
> >  	  match the state of the USB subsystem. If this driver is a
> >  	  module it will be called onboard_usb_dev.
> > +
> > +config USB_ONBOARD_DEV_USB5744
> > +	bool "Onboard USB Microchip usb5744 hub with SMBus support"
> > +	depends on (USB_ONBOARD_DEV && I2C=y) || (USB_ONBOARD_DEV=m && I2C=m)
> > +	help
> > +	  Say Y here if you want to support onboard USB Microchip usb5744
> > +	  hub that requires SMBus initialization.
> > +
> > +	  This options enables usb5744 i2c default initialization sequence
> > +	  during hub start-up configuration stage. It is must to enable this
> > +	  option on AMD Kria KR260 Robotics Starter Kit as this hub is
> > +	  connected to USB-SD converter which mounts the root filesystem.
> 
> With this applied I get the following build warning:
> 
> 
> WARNING: unmet direct dependencies detected for MODVERSIONS
>   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
>   Selected by [y]:
>   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=n] || GCC_PLUGINS [=y]) && MODULES [=y]
> 
> WARNING: unmet direct dependencies detected for MODVERSIONS
>   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
>   Selected by [y]:
>   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=n] || GCC_PLUGINS [=y]) && MODULES [=y]
> 
> WARNING: unmet direct dependencies detected for MODVERSIONS
>   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
>   Selected by [y]:
>   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=n] || GCC_PLUGINS [=y]) && MODULES [=y]
> 
> 
> Which is odd.
> 
> It's one extra "unmet direct ..." message than normal for now, so
> something in this commit is not working properly.
> 
> Can you fix this up and send a new version?

Nevermind, it's not this patch's fault, I'll go take this now, sorry for
the noise...

greg k-h

