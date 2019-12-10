Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B745F1184F3
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2019 11:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbfLJKZ2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 05:25:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:59098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727016AbfLJKZ2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Dec 2019 05:25:28 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 92D5A2073B;
        Tue, 10 Dec 2019 10:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575973528;
        bh=3rf7cQniipAYw9brjqbHw2Sokt5wei38JAbb9i4ZiZg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GThKW2O5xEnZCbSZl0LxSbBw92/0APjbNS4dWS+AI7xlV68grQ+pG85pXKPOcxOn1
         RoH967OzOtzL4ahhE7BnsmvDjBe5tfJhQ9cKoOEbS3iix/eAurI1A/Kp5xujcBsYLq
         ASng1+Lu0lkCl4YiR6+w7WQBv4IJeL+GtNTVoW6E=
Date:   Tue, 10 Dec 2019 11:25:25 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Vadim Troshchinskiy <vtroshchinskiy@qindel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: usbip tools from 5.4 fail to build due to unaligned pointer
 value warning
Message-ID: <20191210102525.GB3698263@kroah.com>
References: <6296180.lmSoKh01SJ@gverdu.qindel.com>
 <2248932.DWrUWtNFSA@gverdu.qindel.com>
 <20191129141713.GA3706703@kroah.com>
 <6347931.BevlSF32Fy@gverdu.qindel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6347931.BevlSF32Fy@gverdu.qindel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 03, 2019 at 10:41:41AM +0100, Vadim Troshchinskiy wrote:
> В письме от пятница, 29 ноября 2019 г. 15:17:13 CET пользователь Greg KH написал:
> > On Fri, Nov 29, 2019 at 02:49:45PM +0100, Vadim Troshchinskiy wrote:
> > > В письме от пятница, 29 ноября 2019 г. 14:33:27 CET пользователь Greg KH
> > > 
> > > написал:
> > > > On Fri, Nov 29, 2019 at 01:24:30PM +0100, Vadim Troshchinskiy wrote:
> > > > > Hello,
> > > > > 
> > > > > Building the usbip tools from 4.15 is failing under Fedora 30, gcc
> > > > > version
> > > > 
> > > > > 9.2.1:
> > > > When 4.15 was released, there was no such gcc version :)
> > > > 
> > > > 4.15 is long end-of-life, please use a more modern kernel release with
> > > > newer versions of gcc.
> > > 
> > > Ah, my apologies, had a bit of a mix-up here. This compilation problem was
> > > on v5.4 as it says in the title, I'm working on porting something from
> > > 4.15 and accidentally put that there.
> > 
> > Ah, sorry about that.
> > 
> > Send patches on, odds are no one has tried this yet.
> 
> Okay, how does this look?
> 
> 
> >From db04ae3c88f605f900cf4e9d7a27a849bf6222a3 Mon Sep 17 00:00:00 2001
> From: Vadim Troshchinskiy <vtroshchinskiy@qindel.com>
> Date: Tue, 3 Dec 2019 10:31:25 +0100
> Subject: [PATCH] Remove unaligned pointer usage from usbip tools.
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> The usbip tools use packed structs for network communication. Taking the
> address of a packed member of a struct can crash the program with SIGBUS
> on architectures with strict alignment requirements.
> 
> Also, recent versions of GCC detect this situation and emit a warning that
> is fatal due to -Werror being used.
> 
> error: taking address of packed member of ‘struct
> usbip_usb_device’ may result in an unaligned pointer value [-Werror=address-
> of-packed-member]
> 
> Fix this by copying the data to an aligned location and operating there.
> ---
>  tools/usb/usbip/src/usbip_network.c | 30 +++++++++++++++--------------
>  tools/usb/usbip/src/usbip_network.h | 12 ++++++------
>  2 files changed, 22 insertions(+), 20 deletions(-)

Can you resend this in a format that I can apply it, with a correct
signed-off-by and copying the usbip maintainer as well?

thanks,

greg k-h
