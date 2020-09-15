Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7176326ABBE
	for <lists+linux-usb@lfdr.de>; Tue, 15 Sep 2020 20:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727982AbgIOSYs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Sep 2020 14:24:48 -0400
Received: from netrider.rowland.org ([192.131.102.5]:36603 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727804AbgIOSYg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Sep 2020 14:24:36 -0400
Received: (qmail 1012504 invoked by uid 1000); 15 Sep 2020 14:24:14 -0400
Date:   Tue, 15 Sep 2020 14:24:14 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Patrik Nilsson <nipatriknilsson@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: high speed data to usb disk makes the kernel think that is has
 been unmounted
Message-ID: <20200915182414.GB1010655@rowland.harvard.edu>
References: <20200811175655.GB828356@kroah.com>
 <47a5804c-835a-f1a2-abce-50b3531f2556@gmail.com>
 <20200811193150.GA344152@rowland.harvard.edu>
 <ef2937d6-f8a8-fbc6-decd-eeb4af94e863@gmail.com>
 <20200812061451.GE1299081@kroah.com>
 <95be674d-ee98-b904-6856-2f662ac7838f@gmail.com>
 <20200818085502.GB28036@kroah.com>
 <83a5be3e-9f93-e601-5161-cbb5d1957c5a@gmail.com>
 <20200818183420.GB152667@rowland.harvard.edu>
 <0975cb43-5520-543c-987c-57de5e7b258b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0975cb43-5520-543c-987c-57de5e7b258b@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 15, 2020 at 06:43:49PM +0200, Patrik Nilsson wrote:
> Hi Alan,
> 
> Unfortunately the options you suggested didn't help.
> 
> The patch below works and is tested with Ubuntu kernel 5.4.0.47.50.
> 
> I have stress tested the usb system. To the USB is now seven mechanical hard
> disks and two ssd disks connected. Six processes are at the same time
> writing random data to the disks. One of them is to the ssd disk I couldn't
> write data to before without it failed. Also the other usb-ssd disk is my
> root partition.
> 
> Before I applied the patch, my root partition sometimes failed to be kept
> mounted. Now I have not had any crashes.
> 
> This is a quick fix for hard disks, but working. It continued to work when I
> started three virtualbox guests and let them also do work. The guests' hard
> disks is on my usb-root partition.
> 
> It doesn't work if I also use my usb2ethernet adapter (ID 2001:4a00 D-Link
> Corp.), although my root partition and two randomize tests survived. Maybe a
> much larger timeout in this case will help? But this I don't find as a good
> solution.
> 
> The behavior is the same on the other (much slower) computer with a
> different usb hub. I have also tested it with exactly the same setup as
> earlier, with no mechanical hard disks, and it works with the patch and not
> without it.

Is there any way you can capture a usbmon trace that shows the problem?

> Any suggestion on how to solve this? In a good way.
> 
> Best regards,
> Patrik
> 
> ---start of diff---
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 5b768b80d1ee..3c550934815c 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -105,7 +105,7 @@ MODULE_PARM_DESC(use_both_schemes,
>  DECLARE_RWSEM(ehci_cf_port_reset_rwsem);
>  EXPORT_SYMBOL_GPL(ehci_cf_port_reset_rwsem);
> 
> -#define HUB_DEBOUNCE_TIMEOUT    2000
> +#define HUB_DEBOUNCE_TIMEOUT    10000
>  #define HUB_DEBOUNCE_STEP      25
>  #define HUB_DEBOUNCE_STABLE     100
> 
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index 20c555db4621..e64d441bb78f 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -1841,8 +1841,8 @@ extern int usb_set_configuration(struct usb_device
> *dev, int configuration);
>   * USB identifies 5 second timeouts, maybe more in a few cases, and a few
>   * slow devices (like some MGE Ellipse UPSes) actually push that limit.
>   */
> -#define USB_CTRL_GET_TIMEOUT    5000
> -#define USB_CTRL_SET_TIMEOUT    5000
> +#define USB_CTRL_GET_TIMEOUT    10000
> +#define USB_CTRL_SET_TIMEOUT    10000

What happens if you leave these two lines unchanged and increase only 
the HUB_DEBOUNCE_TIMEOUT value?

Alan Stern
