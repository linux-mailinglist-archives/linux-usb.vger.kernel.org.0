Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F82232FC25
	for <lists+linux-usb@lfdr.de>; Sat,  6 Mar 2021 18:03:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbhCFRDR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 Mar 2021 12:03:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:56822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231203AbhCFRCv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 6 Mar 2021 12:02:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B58376501A;
        Sat,  6 Mar 2021 17:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1615050171;
        bh=idKL/wWm3KEljDY3TbQJCLTWqZlfWVMst2zG/9vhyo0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tJ7LN/Uurt6YqQ3x4MITvU8oddQiCaJszJgOgkEEqTp8JghtmUwJyUwkSzst7Dk9j
         B8HhcnO5kJDkaauhUxZxyPhHR17U66FIQ8zPQtpvlFMuBCFzS35STWcO6u1w5Hj32+
         2W0g9/31XFsdps2xfF3seFLYXmf8MGUvy9mv4ihM=
Date:   Sat, 6 Mar 2021 18:02:47 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Aaron Dewes <aaron.dewes@web.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: A question about UAS
Message-ID: <YEO1t63SQw1Ui4ce@kroah.com>
References: <2ad0d2f9-0ef1-05b5-76db-b178107bfccb@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ad0d2f9-0ef1-05b5-76db-b178107bfccb@web.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Mar 06, 2021 at 05:34:32PM +0100, Aaron Dewes wrote:
> Hello!
> 
> Sorry if this suggestion/question sounds stupid, I don't have experience
> with the kernel code and this mailing list.
> 
> I'm a contributor to Umbrel (getumbrel.com), and we provide a software
> that allows to run a bitcoin node easily, and we've run into many people
> having UAS issues

What specific UAS issues?  And why not just fix those instead?

> , and we were manually adding quirks in this case. Now
> I'm wondering if it is possible to disable UAS for all devices in the
> kernel cmdline.

Sure, just blacklist the uas kernel module, that prevents it from being
loaded and hopefully the device will degrade to the
old-school-and-dirt-slow usb-storage protocol.

Have you tried that?

> This is my first question, but I also have another
> suggestion. We've developed the following bash script to check for UAS
> issues and automatically add quirks:
> 
> ------
> 
> get_uas_string () {
>   UDEVADM_DATA=$(sudo -u umbrel udevadm test /block/${block_device} 2> /dev/null) # Umbrel is the  main user on umbrel, and udevadm doesn't report the vendor id if running as root, which this script is
>   ID_VENDOR=$(echo "${UDEVADM_DATA}" | grep "ID_VENDOR_ID" | sed 's/ID_VENDOR_ID=//')
>   ID_MODEL=$(echo "${UDEVADM_DATA}" | grep "ID_MODEL_ID" | sed 's/ID_MODEL_ID=//')
>   echo "${ID_VENDOR}:${ID_MODEL}:u"
> }
> 
> if [[ $(dmesg) == *"uas_eh_abort_handler"* ]]; then
>   echo "External storage might have UAS issues"
>   UAS_STRING=$(get_uas_string)
>   if [[ $(cat /boot/cmdline.txt) == *"${UAS_STRING}"* ]]; then
>     sed "s/usb-storage.quirks=/usb-storage.quirks=$(get_uas_string),/g" -i /boot/cmdline.txt
>     echo "Rebooting"
>     sudo reboot
>   fi
> fi
> 
> -----
> 
> I was wondering if a check like this could be added to the kernel, so
> every time uas_eh_abort_handler gets logged, which AFAIK only happens if
> UAS has issues, a counter could be increased, so that, if it happens to
> often, UAS gets disabled for that drive.

How do you "know" the next time you boot you really have the same drive
or not?  That type of logic is best done in userspace, the kernel is
just reporting the issues, it's up to userspace to determine if it wants
to not mount the drive or not.

But back to your root problem, what is wrong with UAS?  I've been using
it for a build system for Android for years just fine.  And that
stresses the CPU and drive really hard.

thanks,

greg k-h
