Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9502F3B8E14
	for <lists+linux-usb@lfdr.de>; Thu,  1 Jul 2021 09:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234789AbhGAHQ7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Jul 2021 03:16:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:45400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234679AbhGAHQ7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 1 Jul 2021 03:16:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3E976141D;
        Thu,  1 Jul 2021 07:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625123669;
        bh=4aSuFLgrTgafr4Q/xwPKsrvZladm0FzQ747MTutgri8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Nl/SQ1f4/eJWxy4bSXRzFIzWk9UjXrrPBPWgEK/BlC345IJL1K3kZDeQeOtpt4tDw
         SbJIaZiV492qrGevhdEbarPHaGcDWvbyuIdt9WRGuNsILMlCBgM3BTqnFcOjY6g4x7
         tcdFwp8nbkWYYKu11XJ6Y6voPC5I5khXFUlGpnDyp8tt7+Oxpq1wXj82yWCGwHiFkN
         gVw2YOU5zSUhtvaOa81erjSmSq4ncuUJM256tBsuNaFSU5mXzP61hj05F13mQctVFt
         7y4FQpsY+In/jPqtkYdDPzMkkdhxMGxaBS26yqiLWyMO1kHCttnBT98BO5f6DdMmL3
         YkVvfQmEa3klA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lyqu1-0005c3-FT; Thu, 01 Jul 2021 09:14:26 +0200
Date:   Thu, 1 Jul 2021 09:14:25 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Marco De Marco <marco.demarco@posteo.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: Add support for u-blox LARA-R6 modules family
Message-ID: <YN1rUbJ9OKWMfwDp@hovoldconsulting.com>
References: <2644396.hb5XgcuobH@mars>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2644396.hb5XgcuobH@mars>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 30, 2021 at 07:09:20PM +0000, Marco De Marco wrote:
> Support for u-blox LARA-R6 modules family, usb serial interface.

Please include the interface layout here too (cf. commit 4205cb01f6e9
("USB: serial: option: adding support for ublox R410M")) and post the
output of usb-devices (or lsusb -v) for this device.

Isn't there an ADB interface that should be reserved as well for
example?

Please also use the common "USB: serial: option:" prefix in your commit
summary (Subject).

> Signed-off-by: Marco De Marco <marco.demarco@posteo.net>
> ---
> 
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index aeaa3756f..05d0379c9 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -238,6 +238,7 @@ static void option_instat_callback(struct urb *urb);
>  #define QUECTEL_PRODUCT_UC15			0x9090
>  /* These u-blox products use Qualcomm's vendor ID */
>  #define UBLOX_PRODUCT_R410M			0x90b2
> +#define UBLOX_PRODUCT_R6XX          0x90fa

Looks like the indentation for the value is off here, or in any case you
should be using tabs rather than spaces.

>  /* These Yuga products use Qualcomm's vendor ID */
>  #define YUGA_PRODUCT_CLM920_NC5			0x9625
>  
> @@ -1101,6 +1102,8 @@ static const struct usb_device_id option_ids[] = {
>  	/* u-blox products using Qualcomm vendor ID */
>  	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R410M),
>  	  .driver_info = RSVD(1) | RSVD(3) },
> +	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R6XX),
> +	  .driver_info = RSVD(3) },
>  	/* Quectel products using Quectel vendor ID */
>  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC21, 0xff, 0xff, 0xff),
>  	  .driver_info = NUMEP2 },

Johan
