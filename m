Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A90094EE54D
	for <lists+linux-usb@lfdr.de>; Fri,  1 Apr 2022 02:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242912AbiDAAZK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 31 Mar 2022 20:25:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239649AbiDAAZJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 31 Mar 2022 20:25:09 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 3EB1815A2B
        for <linux-usb@vger.kernel.org>; Thu, 31 Mar 2022 17:23:21 -0700 (PDT)
Received: (qmail 17573 invoked by uid 1000); 31 Mar 2022 20:23:20 -0400
Date:   Thu, 31 Mar 2022 20:23:20 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Tasos Sahanidis <tasos@tasossah.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v3] usb: core: Don't hold the device lock while sleeping
 in do_proc_control()
Message-ID: <YkZF+Iepo7N1Xr0n@rowland.harvard.edu>
References: <3e299e2a-13b9-ddff-7fee-6845e868bc06@tasossah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e299e2a-13b9-ddff-7fee-6845e868bc06@tasossah.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 01, 2022 at 12:47:00AM +0300, Tasos Sahanidis wrote:
> Since commit ae8709b296d8 ("USB: core: Make do_proc_control() and
> do_proc_bulk() killable") if a device has the USB_QUIRK_DELAY_CTRL_MSG
> quirk set, it will temporarily block all other URBs (e.g. interrupts)
> while sleeping due to a control.
> 
> This results in noticeable delays when, for example, a userspace usbfs
> application is sending URB interrupts at a high rate to a keyboard and
> simultaneously updates the lock indicators using controls. Interrupts
> with direction set to IN are also affected by this, meaning that
> delivery of HID reports (containing scancodes) to the usbfs application
> is delayed as well.
> 
> This patch fixes the regression by calling msleep() while the device
> mutex is unlocked, as was the case originally with usb_control_msg().
> 
> Fixes: ae8709b296d8 ("USB: core: Make do_proc_control() and do_proc_bulk() killable")
> Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> v2: Resent as v1 got mangled
> v3: Renamed from: "usb: core: Don't block while sleeping in do_proc_control()"
> 
>  drivers/usb/core/devio.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index 6abb7294e919..b5b85bf80329 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -1209,12 +1209,16 @@ static int do_proc_control(struct usb_dev_state *ps,
>  
>  		usb_unlock_device(dev);
>  		i = usbfs_start_wait_urb(urb, tmo, &actlen);
> +
> +		/* Linger a bit, prior to the next control message. */
> +		if (dev->quirks & USB_QUIRK_DELAY_CTRL_MSG)
> +			msleep(200);
>  		usb_lock_device(dev);
>  		snoop_urb(dev, NULL, pipe, actlen, i, COMPLETE, tbuf, actlen);
>  		if (!i && actlen) {
>  			if (copy_to_user(ctrl->data, tbuf, actlen)) {
>  				ret = -EFAULT;
> -				goto recv_fault;
> +				goto done;
>  			}
>  		}
>  	} else {
> @@ -1231,6 +1235,10 @@ static int do_proc_control(struct usb_dev_state *ps,
>  
>  		usb_unlock_device(dev);
>  		i = usbfs_start_wait_urb(urb, tmo, &actlen);
> +
> +		/* Linger a bit, prior to the next control message. */
> +		if (dev->quirks & USB_QUIRK_DELAY_CTRL_MSG)
> +			msleep(200);
>  		usb_lock_device(dev);
>  		snoop_urb(dev, NULL, pipe, actlen, i, COMPLETE, NULL, 0);
>  	}
> @@ -1242,10 +1250,6 @@ static int do_proc_control(struct usb_dev_state *ps,
>  	}
>  	ret = (i < 0 ? i : actlen);
>  
> - recv_fault:
> -	/* Linger a bit, prior to the next control message. */
> -	if (dev->quirks & USB_QUIRK_DELAY_CTRL_MSG)
> -		msleep(200);
>   done:
>  	kfree(dr);
>  	usb_free_urb(urb);
> -- 
> 2.25.1
> 
