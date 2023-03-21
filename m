Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F89C6C2F61
	for <lists+linux-usb@lfdr.de>; Tue, 21 Mar 2023 11:47:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbjCUKrW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Mar 2023 06:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbjCUKrU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Mar 2023 06:47:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5D367291
        for <linux-usb@vger.kernel.org>; Tue, 21 Mar 2023 03:47:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 83D92B80D5C
        for <linux-usb@vger.kernel.org>; Tue, 21 Mar 2023 10:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8FF8C433D2;
        Tue, 21 Mar 2023 10:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1679395636;
        bh=0KkAEIVFWPD9uoMtAWbTtUx6Qy2mnlSEqQHYD+Z93cM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f1QYYTdZatgHcwjg41+c4VH4FPcVRcl/wA9ezdRX6ovkXIqoB7dKfjkef8jx5Spmn
         t3mOULwPO+VnZ69s8eDkyPKEr07vuwRpij4FcEZNrcZCYRmZr7Vrh1R7drLqgXHqP/
         mh52VZW4viS8jaktiXwgkGepjGowT8joos1//Dh4=
Date:   Tue, 21 Mar 2023 11:47:13 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Ard Biesheuvel <ardb@kernel.org>, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] usb: host: u132-hcd: Delete driver
Message-ID: <ZBmLMXBuO8bdwos9@kroah.com>
References: <20230321103638.343886-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230321103638.343886-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 21, 2023 at 11:36:38AM +0100, Uwe Kleine-König wrote:
> This driver got its last actual change in 2006 and is probably unused as
> nowbody should use a cardbus to USB adapter any more.
> 
> If it were still used, the driver was in urgent need for maintainer
> love. (Explicit kref handling, underdocumented locking, .remove() can
> return errors ...)
> 
> Also the link in the (now removed) help text doesn't look actively
> maintained. According to archive.org it forwarded to
> http://www.copenhagen-hotel.net/ already back in 2018.
> 
> So don't waste more time on this driver and just delete it.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  arch/mips/configs/mtx1_defconfig      |    1 -
>  arch/powerpc/configs/ppc6xx_defconfig |    1 -
>  drivers/usb/Makefile                  |    1 -
>  drivers/usb/host/Kconfig              |   27 -
>  drivers/usb/host/Makefile             |    1 -
>  drivers/usb/host/u132-hcd.c           | 3239 -------------------------
>  drivers/usb/misc/Kconfig              |    2 -
>  7 files changed, 3272 deletions(-)
>  delete mode 100644 drivers/usb/host/u132-hcd.c
> 
> diff --git a/arch/mips/configs/mtx1_defconfig b/arch/mips/configs/mtx1_defconfig
> index 89a1511d2ee4..7b6a2a9daa10 100644
> --- a/arch/mips/configs/mtx1_defconfig
> +++ b/arch/mips/configs/mtx1_defconfig
> @@ -497,7 +497,6 @@ CONFIG_USB_EHCI_ROOT_HUB_TT=y
>  CONFIG_USB_OHCI_HCD=m
>  CONFIG_USB_OHCI_HCD_PLATFORM=m
>  CONFIG_USB_UHCI_HCD=m
> -CONFIG_USB_U132_HCD=m
>  CONFIG_USB_SL811_HCD=m
>  CONFIG_USB_SL811_CS=m
>  CONFIG_USB_ACM=m
> diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
> index 110258277959..fd5cc93c4a99 100644
> --- a/arch/powerpc/configs/ppc6xx_defconfig
> +++ b/arch/powerpc/configs/ppc6xx_defconfig
> @@ -845,7 +845,6 @@ CONFIG_USB_OHCI_HCD=m
>  CONFIG_USB_OHCI_HCD_PPC_OF_BE=y
>  CONFIG_USB_OHCI_HCD_PPC_OF_LE=y
>  CONFIG_USB_UHCI_HCD=m
> -CONFIG_USB_U132_HCD=m
>  CONFIG_USB_SL811_HCD=m
>  CONFIG_USB_ACM=m
>  CONFIG_USB_PRINTER=m
> diff --git a/drivers/usb/Makefile b/drivers/usb/Makefile
> index a81e6ef293af..3a9a0dd4be70 100644
> --- a/drivers/usb/Makefile
> +++ b/drivers/usb/Makefile
> @@ -31,7 +31,6 @@ obj-$(CONFIG_USB_FHCI_HCD)	+= host/
>  obj-$(CONFIG_USB_XHCI_HCD)	+= host/
>  obj-$(CONFIG_USB_SL811_HCD)	+= host/
>  obj-$(CONFIG_USB_ISP1362_HCD)	+= host/
> -obj-$(CONFIG_USB_U132_HCD)	+= host/
>  obj-$(CONFIG_USB_R8A66597_HCD)	+= host/
>  obj-$(CONFIG_USB_FSL_USB2)	+= host/
>  obj-$(CONFIG_USB_FOTG210_HCD)	+= host/
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index eacb603ad1b2..c170672f847e 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -622,33 +622,6 @@ config FHCI_DEBUG
>  	  Say "y" to see some FHCI debug information and statistics
>  	  through debugfs.
>  
> -config USB_U132_HCD
> -	tristate "Elan U132 Adapter Host Controller"
> -	depends on USB_FTDI_ELAN

I think you can also delete this driver (drivers/usb/misc/ftdi-elan.c)
as well as it is the same expired domain and came in at the same time.

thanks,

greg k-h
