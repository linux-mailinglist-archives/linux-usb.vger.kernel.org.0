Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0F0A459D8F
	for <lists+linux-usb@lfdr.de>; Tue, 23 Nov 2021 09:13:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234724AbhKWIQf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Nov 2021 03:16:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:33038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234775AbhKWIQb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Nov 2021 03:16:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id F3CA061057;
        Tue, 23 Nov 2021 08:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637655204;
        bh=tjXbS6iXFdrCQk/2R78wesGbjxtCI97GUnMsQ9o3hgs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E44yfMrOojibR/pOAFwpSLfwzHH136lt2Ww6/pRCDmp+7HXcNU8RFZE4F+KtPKtZl
         WFWioe1y9gwSQni9J8blGmGjc3ha98lYeLwgKK0Gr8qWbW98FwZalCrvyy+s4QtRtY
         63XPEYRe5ISx5hxhPdWpsZhu6cEq7RYREbswyuReeBbzeZLwXShY28MEKkwNNbOdqP
         ytCKhMxIzYFAlaxeRPw7n4XZhgAkQt9zwF/f4ZkhzG2puCwT6wmcH4prrNCOIZl2XG
         0QwTQacgUddEndP3bbztJYVH1/D/1XIO9BNEHXwCyl2TVflEkBRL0hCv6ykQBOHAhq
         9Df0BOfPRndsQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mpQvG-0006F3-UZ; Tue, 23 Nov 2021 09:13:03 +0100
Date:   Tue, 23 Nov 2021 09:13:02 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Anton Lundin <glance@acc.umu.se>
Cc:     linux-usb@vger.kernel.org
Subject: Re: pl2303 converter detected, unknown device type
Message-ID: <YZyijnKD7dixoaV+@hovoldconsulting.com>
References: <20211123071613.GZ108031@montezuma.acc.umu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211123071613.GZ108031@montezuma.acc.umu.se>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 23, 2021 at 08:16:13AM +0100, Anton Lundin wrote:
> I just picked up a new usb-rs232 adapter and was met by the following on
> a modern kernel:
> 
> # uname -r
> 5.16.0-rc2
> 
> usb 3-7: new full-speed USB device number 5 using xhci_hcd
> usb 3-7: New USB device found, idVendor=067b, idProduct=23a3, bcdDevice= 1.05
> usb 3-7: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> usb 3-7: Product: ATEN USB to Serial Bridge
> usb 3-7: Manufacturer: Prolific Technology Inc.
> pl2303 3-7:1.0: pl2303 converter detected
> pl2303 3-7:1.0: unknown device type, please report to linux-usb@vger.kernel.org

> I'm guessing it just needs a case for this bcdDevice.

Indeed, and thanks for reporting this. I'll add the missing entry.

Do you know what kind of PL2303 this is (e.g. PL2303GC)?

Johan
