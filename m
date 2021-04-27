Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF8E36BFE2
	for <lists+linux-usb@lfdr.de>; Tue, 27 Apr 2021 09:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237360AbhD0HLk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Apr 2021 03:11:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:40432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234935AbhD0HLR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 27 Apr 2021 03:11:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C0981601FC;
        Tue, 27 Apr 2021 07:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619507434;
        bh=PS53Gpu/1d0UzbzeA6E+pf6pgTHFckgmKwr+rR1FtDA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TADD7yPotKktskvaEKB9+4Or3WNCSyKMWJPW/rq1z37Mh8aecDwdxuN1lulUrRO4Q
         Z7JEHh05sxPzydqqQN3NfF7BIFN3pSXNfMbHU1GPfIryBSDMfSh1PEa+TPJ8rJ1Mf0
         z9fTdeGL7mVpmVJ7I5fWCNKWjUiKJhYgceH1hF/EMe+89maYA3YDY6mbqyXrseO5MY
         LEfvFzf6hrgtw4TewuBcJsFZBBCCcWLB1+XMmNVhZiAEkZbDKTUlBMBqXJ7Lx7iUXh
         Edotjzpvt5oRHMb9r9qDWgA4V1nRlteR9xMWrRGvu+dC6TMMlvePDhl2owZd+sahQO
         Gv2CwQt1AhUfA==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lbHrs-0001JR-0h; Tue, 27 Apr 2021 09:10:48 +0200
Date:   Tue, 27 Apr 2021 09:10:48 +0200
From:   Johan Hovold <johan@kernel.org>
To:     =?utf-8?Q?Niccol=C3=B2?= Belli <darkbasic@linuxsystems.it>
Cc:     linux-usb@vger.kernel.org
Subject: Re: cdc_acm 2-2:1.0: acm_port_activate - usb_submit_urb(ctrl irq)
 failed
Message-ID: <YIe4+PSWak6BFpUq@hovoldconsulting.com>
References: <2fd1819252485b07e38f5154592dad43@linuxsystems.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2fd1819252485b07e38f5154592dad43@linuxsystems.it>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 26, 2021 at 09:55:06PM +0200, Niccolò Belli wrote:
> My Aeon Labs ZWave USB stick doesn't work anymore since 5.11.12-arch1-1:
> [ 193.677337] usb 2-2: new full-speed USB device number 5 using xhci_hcd
> [ 193.818112] usb 2-2: New USB device found, idVendor=0658, 
> idProduct=0200, bcdDevice= 0.00
> [ 193.818117] usb 2-2: New USB device strings: Mfr=0, Product=0, 
> SerialNumber=0
> [ 194.372999] cdc_acm 2-2:1.0: ttyACM0: USB ACM device
> [ 194.373197] usbcore: registered new interface driver cdc_acm
> [ 194.373199] cdc_acm: USB Abstract Control Model driver for USB modems 
> and ISDN adapters
> [ 200.173616] cdc_acm 2-2:1.0: acm_port_activate - usb_submit_urb(ctrl 
> irq) failed
> 
> It works fine on 5.11.11-arch1-1 and on a Fedora 34 Live USB with kernel 
> 5.11.16.
> Arch's 5.11.16 doesn't work and latest Arch's linux-lts doesn't work 
> either.

I'm afraid this is a known regression due to a buggy stable backport.
The fix is now in Linus's tree:

	 a8b3b519618f ("USB: CDC-ACM: fix poison/unpoison imbalance")

and should be backported very soon.

Johan
