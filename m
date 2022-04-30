Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CBAD515984
	for <lists+linux-usb@lfdr.de>; Sat, 30 Apr 2022 03:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381978AbiD3BOp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Apr 2022 21:14:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376930AbiD3BOp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Apr 2022 21:14:45 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 9A59E5EDC5
        for <linux-usb@vger.kernel.org>; Fri, 29 Apr 2022 18:11:23 -0700 (PDT)
Received: (qmail 966237 invoked by uid 1000); 29 Apr 2022 21:11:22 -0400
Date:   Fri, 29 Apr 2022 21:11:22 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        marcel@holtmann.org
Subject: Re: [PATCH] Bluetooth: btusb: CSR chip hangs when unbound
Message-ID: <YmyMupSnd4X8LjXc@rowland.harvard.edu>
References: <20220429153138.935435-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220429153138.935435-1-jtornosm@redhat.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 29, 2022 at 05:31:38PM +0200, Jose Ignacio Tornos Martinez wrote:
> Bluetooth Dongles with CSR chip (i.e. USB Bluetooth V4.0 Dongle by
> Trust) hang when they are unbound from 'unbind' sysfs entry and
> can not be bound again.
> 
> The reason is CSR chip hangs when usb configuration command with
> index 0 (used to unconfigure) is sent during disconnection.
> 
> To avoid this unwanted result, it is necessary not to send this
> command for CSR chip when usb device is unbound.
> Besides, "skip_unconfigure" sysfs entry has been created for
> testing purposes with these or other devices.

I don't see any good reason for adding this sysfs entry.  Normal users 
won't want to do it, and developers can add their own quirks to their 
kernels.  Also, see below.

> Athough device is not unconfigured, it is better to avoid device
> hanging to be able to operate. Even bluetooth can be previously
> turned off.
> On the other hand, this is not important if usb device is going to
> be bound again (normal behavior), i.e. with usbip.
> 
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---
>  drivers/bluetooth/btusb.c  |  8 +++++++-
>  drivers/usb/core/generic.c |  2 +-
>  drivers/usb/core/sysfs.c   | 36 ++++++++++++++++++++++++++++++++++++
>  include/linux/usb.h        |  2 ++
>  4 files changed, 46 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index 86a73d834e38..55828cd0a0d1 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -618,6 +618,7 @@ struct usb3_lpm_parameters {
>   *	parent->hub_delay + wHubDelay + tTPTransmissionDelay (40ns)
>   *	Will be used as wValue for SetIsochDelay requests.
>   * @use_generic_driver: ask driver core to reprobe using the generic driver.
> + * @skip_unconfigure: disable unconfigure operation for devices without support.
>   *
>   * Notes:
>   * Usbcore drivers should not set usbdev->state directly.  Instead use
> @@ -704,6 +705,7 @@ struct usb_device {
>  
>  	u16 hub_delay;
>  	unsigned use_generic_driver:1;
> +	unsigned skip_unconfigure:1;
>  };
>  #define	to_usb_device(d) container_of(d, struct usb_device, dev)

This is not a good way to do it.  Instead you should create a new USB 
device quirk bit.  An advantage of this is that there is already a 
mechanism for users to manually set a quirk flag for a device (the 
"quirks" sysfs module file).

Alan Stern
