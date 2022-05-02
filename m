Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0C751716E
	for <lists+linux-usb@lfdr.de>; Mon,  2 May 2022 16:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237238AbiEBOZl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 May 2022 10:25:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236614AbiEBOZl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 May 2022 10:25:41 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 75644F47
        for <linux-usb@vger.kernel.org>; Mon,  2 May 2022 07:22:11 -0700 (PDT)
Received: (qmail 1049165 invoked by uid 1000); 2 May 2022 10:22:10 -0400
Date:   Mon, 2 May 2022 10:22:10 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        marcel@holtmann.org
Subject: Re: [PATCH] Bluetooth: btusb: CSR chip hangs when unbound
Message-ID: <Ym/pEqY+F57YzFwl@rowland.harvard.edu>
References: <20220502070758.67396-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220502070758.67396-1-jtornosm@redhat.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
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
>  #include "usb.h"
>  
>  static inline const char *plural(int n)
> @@ -256,7 +257,7 @@ void usb_generic_driver_disconnect(struct usb_device *udev)
>  
>  	/* if this is only an unbind, not a physical disconnect, then
>  	 * unconfigure the device */
> -	if (udev->actconfig)
> +	if (!(udev->quirks & USB_QUIRK_SKIP_UNCONFIGURE) && udev->actconfig)

The usual programming convention is that when an "if" statement tests 
more than one condition, the test which is more likely to fail should 
come first.  In this case, it is more likely that udev->actconfig is 
non-NULL than that the USB_QUIRK_SKIP_UNCONFIGURE flag is set, because 
the quirk flag affects only one type of device whereas udev->actconfig 
can be non-NULL on any device.  So the test of udev->actconfig should 
come first.

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
> +
>  	{ }  /* terminating entry must be last */
>  };

Did you want people to be able to test this quirk interactively?  If you 
do, you should add a flag character for this quirk to quirks_param_set() 
and document it.  But if you don't think people will need to test the 
new quirk then you don't need to add anything else.

> diff --git a/include/linux/usb/quirks.h b/include/linux/usb/quirks.h
> index eeb7c2157c72..84ab0a369931 100644
> --- a/include/linux/usb/quirks.h
> +++ b/include/linux/usb/quirks.h
> @@ -72,4 +72,7 @@
>  /* device has endpoints that should be ignored */
>  #define USB_QUIRK_ENDPOINT_IGNORE		BIT(15)
>  
> +/* device doesn't support unconfigure when unbound. */
> +#define USB_QUIRK_SKIP_UNCONFIGURE		BIT(16)

The comment isn't right.  In fact, the device doesn't ever support 
unconfigure.  Whether it is bound or not makes no difference.

Alan Stern
