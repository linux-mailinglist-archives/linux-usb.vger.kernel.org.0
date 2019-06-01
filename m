Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D30F31FED
	for <lists+linux-usb@lfdr.de>; Sat,  1 Jun 2019 18:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbfFAQUX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Jun 2019 12:20:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:59062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726149AbfFAQUX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 1 Jun 2019 12:20:23 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1F8842768D;
        Sat,  1 Jun 2019 16:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559406022;
        bh=ApUXvK2vgTtg+pFg8DnnyY+yk2n6GtdSfxBtVXovyVI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zzTXRcD50QhPEy8oEfNfEQblnsr8rXjkIaHaAW8gjredtWjSfs+El/WRz/BQAEuTb
         Buxbe2fKw6YrXhR6UIzKcFRCF+u/PNI9gvTrpnvD7StSOvx363gSXkui3IX4Sh1Wna
         TEN4HlWSj5aW/Xy/4zwkNQZ9e9b9913hSZESq8v0=
Date:   Sat, 1 Jun 2019 04:45:49 -0700
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Marco Zatta <marco@zatta.me>
Cc:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] Fix chipmunk-like voice when using Logitech C270 for
 recording audio.
Message-ID: <20190601114549.GA18500@kroah.com>
References: <20190601075257.GA24550@jimmy.localdomain>
 <e77aaee7-ddcb-58ff-2dcf-d1fff21a9e07@cogentembedded.com>
 <20190601101137.GA1988@jimmy.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190601101137.GA1988@jimmy.localdomain>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jun 01, 2019 at 12:11:37PM +0200, Marco Zatta wrote:
> Hi!
> On Sat, Jun 01, 2019 at 12:33:06PM +0300, Sergei Shtylyov wrote:
> > Hello!
> > 
> > On 01.06.2019 10:52, Marco Zatta wrote:
> > 
> > > This patch fixes the chipmunk-like voice that manifets randomly when
> > > using the integrated mic of the Logitech Webcam HD C270.
> > > 
> > > The issue was solved initially for this device by commit
> > > 2394d67e446bf616a0885167d5f0d397bdacfdfc but it was then reintroduced by
> > > e387ef5c47ddeaeaa3cbdc54424cdb7a28dae2c0. This patch is to have the fix
> > 
> >    It's not how you should cite the commits, see below:
> > 
> > <12-digit SHA1> ("<summary>")
> > 
> 
> You are right, I am sorry about that. The commits are
> 2394d67e446bf616a0885167d5f0d397bdacfdfc ("USB: add RESET_RESUME for
> webcams shown to be quirky") and
> e387ef5c47ddeaeaa3cbdc54424cdb7a28dae2c0 ("usb: Add
> USB_QUIRK_RESET_RESUME for all Logitech UVC webcams")

No problem, I'll fix this up when applying the patch next week, thanks!

greg k-h
