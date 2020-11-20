Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEC842BAEED
	for <lists+linux-usb@lfdr.de>; Fri, 20 Nov 2020 16:37:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728739AbgKTP03 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Nov 2020 10:26:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:33358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728628AbgKTP03 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 20 Nov 2020 10:26:29 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E4D4122252;
        Fri, 20 Nov 2020 15:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1605885989;
        bh=P0HBOCBl1RMU/HixCoEPMKQrzhCV59wwxizWcfylWLI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YjkzJDiU9qPIa+ZlXYviHuFH55jhHzssMDi2sQiyrSGdd7yRj1eL6rrJ57lA4PJ4f
         mnVQwNNIwtiJ8+4HqiZbZcxmcNSk7Seo8Ai+2SZFu8/Ow79q/hf7N5ZKonAGLVwBKj
         8/UNs1FsZvfYusp6HegC6xR9HpZQzYZWCduQQtSY=
Date:   Fri, 20 Nov 2020 16:27:11 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     manchette <manchette@free.fr>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Webcam not working , HD Web Camera (18d1:0002)
Message-ID: <X7fgT2+hqdCj7dyY@kroah.com>
References: <6affe2b1-1f99-14c6-7cde-f73ca18576b0@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6affe2b1-1f99-14c6-7cde-f73ca18576b0@free.fr>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 20, 2020 at 02:43:41PM +0100, manchette wrote:
> Hello,
> 
> A webcam is not working here :
> here is what i know of it :
> 
> System:    Host: linux-815u Kernel: 5.3.18-lp152.47-default x86_64 bits: 64
> Desktop: KDE Plasma 5.18.5
>            Distro: openSUSE Leap 15.2

That is a very old kernel version, you should at least upgrade to a
modern one.

> [19563.481204] usb 1-7: Product: HD Web Camera
> [19563.481207] usb 1-7: Manufacturer: Ingenic Semiconductor CO., LTD.
> [19563.481210] usb 1-7: SerialNumber: Ucamera001
> [19563.488049] uvcvideo: Found UVC 1.00 device HD Web Camera (18d1:0002)

Looks like the driver is bound properly to the device, are you sure this
device follows the correct UVC specification?

Try updating to a 5.9 kernel version, and if that doesn't work, send
your log message to the linux-media developers, they can help you out
better than we can.

good luck!

greg k-h
