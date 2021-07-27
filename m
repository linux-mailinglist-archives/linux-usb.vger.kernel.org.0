Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E28E43D6F09
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jul 2021 08:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235477AbhG0GQR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jul 2021 02:16:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:42614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235041AbhG0GQQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 27 Jul 2021 02:16:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C7269610A0;
        Tue, 27 Jul 2021 06:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627366576;
        bh=PZMxm/DL9SMP/si509h/qfxGUBeOPBm0+/JvdCUykkA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LBJ7bIf3usrYDxZaEwSkeRS0aTV4EkSS8KAxXFFxV7E2wrhMIEAsDGGF7addSV+wQ
         N+yJX4Aq7x3+h5C7immGB7TSMt0d/pAqb7zawlidwxZgbeQZtf5PPD8Iqbx09sVmJa
         Ov8RdEqDGwP0H81BvdSicmaDS99NmYgN9OaSG2aA=
Date:   Tue, 27 Jul 2021 08:16:10 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Razgriz375 (Neil)" <razgriz.wilson6@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Fwd: Linux Kernel 5.12.10 Walkman USB DAC support issues
Message-ID: <YP+kqqimY1BYZAwL@kroah.com>
References: <QUKVWQ.1T8HV94AM5X6@gmail.com>
 <CAJpVOidqd+tpNNkHGvC6fUQ7g3Z+FLpiDJrmPWtQmiL-AsYsLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJpVOidqd+tpNNkHGvC6fUQ7g3Z+FLpiDJrmPWtQmiL-AsYsLw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 27, 2021 at 12:37:28AM +0100, Razgriz375 (Neil) wrote:
> Hello,
> 
> Since updating from 5.10.17, I have not been able to get my Walkman
> A55 to work as a USB DAC with my device. My system specs are as
> follows:
> 
> Surface Pro 4
> Pop_OS 21.04 x86_64
> Kernel 5.12.10-surface
> CPU Intel i5-6300U
> Mem 4GB
> 
> I can switch back to 5.10.17-surface which I have done and the USB DAC
> starts working again. This issue has also been reported in
> https://bbs.archlinux.org/viewtopic.php?id=264051&p=2
> 
> I'm pretty amateur at linux, but happy to help and provide more
> information if required. I guess this is a niche issue as it's not
> been reported as far as I can tell.
> 
> Desmg output is attached as your spam filter intercepted the raw
> information in the email.
> 
> Kind regards,
> 
> Neil

> [  109.668465] usb 1-1: USB disconnect, device number 2 
> [  110.084429] usb 1-1: new high-speed USB device number 5 using xhci_hcd 
> [  110.237963] usb 1-1: New USB device found, idVendor=054c, idProduct=0b8c, bcdDevice= 1.00 
> [  110.237989] usb 1-1: New USB device strings: Mfr=2, Product=3, SerialNumber=4 
> [  110.238002] usb 1-1: Product: WALKMAN 
> [  110.238011] usb 1-1: Manufacturer: Sony 
> [  110.238019] usb 1-1: SerialNumber: 10458B55477916 
> [  110.342104] usb 1-1: 1:7 : unsupported format bits 0x100000000 
> [  110.343953] usbcore: registered new interface driver snd-usb-audio
> 


Looks like you removed the device and then added it back?  And it says
the device is supported by the kernel now, what does not work properly?

thanks,

greg k-h
