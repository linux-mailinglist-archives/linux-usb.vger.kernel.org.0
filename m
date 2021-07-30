Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF3C3DB29A
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jul 2021 07:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbhG3FK7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Jul 2021 01:10:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:35194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229696AbhG3FK6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Jul 2021 01:10:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC58560F46;
        Fri, 30 Jul 2021 05:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627621853;
        bh=16a56qDx3920tpToRsmvoN82sfLMmvhiMeU7yI5vbbs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FzvEy3JRIqNYFsuEm6XlQ+2HU/Wt8qZUOLssR5MFUwO9etwy0h94H84RWMyCE6tyI
         wPAgqCuWuJfA85FxVD/YQOI38xK9Zl/4PR08lOLV01Nam7Wsbs/Ukcc5uQhEd/dlbn
         rQqZS9LKvdsQT3ECezPgWCzNhE8a9+JhTMa2MZ2E=
Date:   Fri, 30 Jul 2021 07:10:50 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     =?iso-8859-1?Q?S=E9bastien?= Rey-Coyrehourcq 
        <sebastien.rey-coyrehourcq@univ-rouen.fr>
Cc:     linux-usb@vger.kernel.org, hch@lst.de, stern@rowland.harvard.edu
Subject: Re: usb-storage & xhci_hcd & swiotlb buffer problem filling systemd
 with error during operation with SSD on USB3
Message-ID: <YQOJ2oW86EyV443A@kroah.com>
References: <20aaa89b-be31-6d30-2e27-47770bba328f@univ-rouen.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20aaa89b-be31-6d30-2e27-47770bba328f@univ-rouen.fr>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 29, 2021 at 05:32:57PM +0200, Sébastien Rey-Coyrehourcq wrote:
>  Hi,
> 
> This is my first bug report on kernel, first crossposted here (https://www.reddit.com/r/NixOS/comments/omctp3/rpi4_nixos_native_2105_and_ssd_by_usb3/)
> and here on nixos github (https://github.com/NixOS/nixpkgs/issues/130499) :
> 
> [1.] One line summary of the problem:
> 
> Using an usb sata adaptater from Startech (USB312SAT3CB 3.1 firmware
> upgraded) on my RPI4B 8gb with the kernel 5.13.4, during any dd=/ operation
> on SSD on USB 3 port, my systemd logs finish full of errors of type :
> 
> juil. 29 14:38:52 Nostromo-sd kernel: xhci_hcd 0000:01:00.0: swiotlb buffer
> is full (sz: 512 bytes), total 32768 (slots), used 32768 (slots)
> 
> and
> 
> juil. 29 09:25:07 Nostromo-sd kernel: ------------[ cut here ]------------
> juil. 29 09:25:07 Nostromo-sd kernel: WARNING: CPU: 1 PID: 180 at
> drivers/mmc/host/sdhci.c:1142 sdhci_prepare_data.isra.0+0x298/0x700

Your problem is in the sdhci code, not the usb controller.

But even with this, does the operation succeed properly?

The rpi hardware is HORRID when it comes to the USB controller, so those
xhci messages might just be normal given the lack of irq handling that
the platform was known to have in the past (note, might be better now,
no idea, sorry.)

But again, is the operation failing?  Is your sd card working properly?
Does the problem go away with a new/better sd card?

thanks,

greg k-h
