Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F59225DAB4
	for <lists+linux-usb@lfdr.de>; Fri,  4 Sep 2020 15:57:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730701AbgIDN5K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Sep 2020 09:57:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:51748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730534AbgIDN5A (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Sep 2020 09:57:00 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ABDBC2065E;
        Fri,  4 Sep 2020 13:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599227820;
        bh=2iZTMjJAf9QaoVGMuJs7cq21Dk7HyyqjCyXnvWCnIDM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CtpyBjpJASTV0+hw2qZcXQv2tah2h1hZnQj66L3t3agRpviksC+wxf/wzBmSLfWJ2
         R0vd5IUlCcvIQwmj442+FCv8Iu/unsxwcU71Ty9abGP2hCjEDkQHr6Mx+Z3uCvuW2p
         GaiKo7W8lD0Kih0SyzKNt51ZcSXU+30jvUGltY0w=
Date:   Fri, 4 Sep 2020 15:57:21 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Penghao <penghao@uniontech.com>
Cc:     johan@kernel.org, jonathan@jdcox.net, kai.heng.feng@canonical.com,
        gustavo.padovan@collabora.com, tomasz@meresinski.eu,
        hdegoede@redhat.com, kerneldev@karsmulder.nl,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: quirks: Add
 USB_QUIRK_DISCONNECT_SUSPEND quirk for Lenovo A630Z TIO built-in usb audio
 card
Message-ID: <20200904135721.GA3182607@kroah.com>
References: <20200904014516.12298-1-penghao@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200904014516.12298-1-penghao@uniontech.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 04, 2020 at 09:45:16AM +0800, Penghao wrote:
> Add a USB_QUIRK_DISCONNECT_SUSPEND quirk for the Lenovo TIO built-in
> usb-audio.when A630Z going into S3,the system immediately wakeup 7-8
> seconds later by usb-audio disconnect interrupt.to avoids the issue.
> 
> Seeking a better fix, we've tried a lot of things, including:
>  - Check that the device's power/wakeup is disabled
>  - Check that remote wakeup is off at the USB level
>  - All the quirks in drivers/usb/core/quirks.c e.g. USB_QUIRK_RESET_RESUME,
>    USB_QUIRK_RESET, USB_QUIRK_IGNORE_REMOTE_WAKEUP, USB_QUIRK_NO_LPM.
> 
> but none of that makes any difference.
> 
> There are no errors in the logs showing any suspend/resume-related issues.
> When the system wakes up due to the modem, log-wise it appears to be a
> normal resume.
> 
> Introduce a quirk to disable the port during suspend when the modem is
> detected.
> 
> Signed-off-by: Penghao <penghao@uniontech.com>
> ---
>  drivers/usb/core/quirks.c | 4 ++++
>  1 file changed, 4 insertions(+)

Odd subject line, this is not ALSA: or the usb-audio driver :(

Please fix up and properly order the entry.

thanks,

greg k-h
