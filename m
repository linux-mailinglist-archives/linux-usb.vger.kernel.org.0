Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC3A516F38
	for <lists+linux-usb@lfdr.de>; Mon,  2 May 2022 14:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384853AbiEBMHe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 May 2022 08:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384852AbiEBMHc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 May 2022 08:07:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48C1812AFA
        for <linux-usb@vger.kernel.org>; Mon,  2 May 2022 05:04:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 08F08B816D6
        for <linux-usb@vger.kernel.org>; Mon,  2 May 2022 12:04:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F79C385A4;
        Mon,  2 May 2022 12:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1651493041;
        bh=Uv7zEFieoCbkp5+e/uDDBa5Pa14M+xMfNL1dpd3klvo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zEuAFesiZZlDpisqG1+PeHIjzQcdKXxzCNtBgGOmywh+thadhKM4rWNSmIxocKY7C
         a6/oxAk+8vlaTkpfo5S+TH1NXMjTTyyq46DsAAEj0Ko7rc4AAHw3dEd6jWKA5cEyni
         xoj4CjdqLxE1NxRGMdc2hKO6qgYEvN4mZL3PH00s=
Date:   Mon, 2 May 2022 14:04:00 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        marcel@holtmann.org
Subject: Re: [PATCH] Bluetooth: btusb: CSR chip hangs when unbound
Message-ID: <Ym/IsLbK89XAj309@kroah.com>
References: <20220502070758.67396-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220502070758.67396-1-jtornosm@redhat.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 02, 2022 at 09:07:58AM +0200, Jose Ignacio Tornos Martinez wrote:
> Bluetooth Dongles with CSR chip (i.e. USB Bluetooth V4.0 Dongle by
> Trust) hang when they are unbound from 'unbind' sysfs entry and
> can not be bound again.
> 
> The reason is CSR chip hangs when usb configuration command with
> index 0 (used to unconfigure) is sent during disconnection.
> 
> To avoid this unwanted result, it is necessary not to send this
> command for CSR chip when usb device is unbound, so a new quirk
> has been created for this device.
> 
> Athough device is not unconfigured, it is better to avoid device
> hanging to be able to operate. Even bluetooth can be previously
> turned off.
> On the other hand, this is not important if usb device is going to
> be bound again (normal behavior), i.e. with usbip.
> ---
>  drivers/usb/core/generic.c | 3 ++-
>  drivers/usb/core/quirks.c  | 3 +++
>  include/linux/usb/quirks.h | 3 +++
>  3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
> index 740342a2812a..ea770b83d876 100644
> --- a/drivers/usb/core/generic.c
> +++ b/drivers/usb/core/generic.c
> @@ -22,6 +22,7 @@
>  #include <linux/usb.h>
>  #include <linux/usb/hcd.h>
>  #include <uapi/linux/usb/audio.h>
> +#include <linux/usb/quirks.h>

Shouldn't that be above the uapi include?

>  #include "usb.h"
>  
>  static inline const char *plural(int n)
> @@ -256,7 +257,7 @@ void usb_generic_driver_disconnect(struct usb_device *udev)
>  
>  	/* if this is only an unbind, not a physical disconnect, then
>  	 * unconfigure the device */
> -	if (udev->actconfig)
> +	if (!(udev->quirks & USB_QUIRK_SKIP_UNCONFIGURE) && udev->actconfig)
>  		usb_set_configuration(udev, -1);
>  }
>  
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index d3c14b5ed4a1..13989629d743 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -510,6 +510,9 @@ static const struct usb_device_id usb_quirk_list[] = {
>  	/* INTEL VALUE SSD */
>  	{ USB_DEVICE(0x8086, 0xf1a5), .driver_info = USB_QUIRK_RESET_RESUME },
>  
> +	/* CSR Bluetooth */
> +	{ USB_DEVICE(0x0a12, 0x0001), .driver_info = USB_QUIRK_SKIP_UNCONFIGURE },

Please read the big comment at the top of this list of entries.  It says
it must be in sorder order, which this is not :(

thanks,

greg k-h
