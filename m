Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 285332852FB
	for <lists+linux-usb@lfdr.de>; Tue,  6 Oct 2020 22:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbgJFURm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Oct 2020 16:17:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:42718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725962AbgJFURm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Oct 2020 16:17:42 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9D3A02083B;
        Tue,  6 Oct 2020 20:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602015460;
        bh=/xeiEwVIau/OQM9Ovo2zdAF2yIa3fokVBf5shjtFFt4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vO42SI5I6NbshVNtwj7Qi4xmUyUP0vM2HW913nAcbxruwZU9zD1X5NSY2zFFSZFaj
         axxZJc+nnpTon2yOpva+Aqm/9j7RFhHx+0dn6KpwcG/B09/DDNyOkzuZ2HZyFguDSK
         HoqwGQzJOzOL5tLAruf29trfMLXoTkTRIUVWlUto=
Date:   Tue, 6 Oct 2020 22:18:25 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     stable <stable@kernel.org>, balbi@kernel.org,
        linux-usb@vger.kernel.org,
        Ilja Van Sprundel <ivansprundel@ioactive.com>,
        Brooke Basile <brookebasile@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH] USB: gadget: f_ncm: Fix NDP16 datagram validation
Message-ID: <20201006201825.GA188912@kroah.com>
References: <20200920170158.1217068-1-bryan.odonoghue@linaro.org>
 <20201006182943.GA12648@lxhi-065.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201006182943.GA12648@lxhi-065.adit-jv.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 06, 2020 at 08:29:43PM +0200, Eugeniu Rosca wrote:
> Hello Greg,
> Hello stable maintainers,
> 
> On Sun, Sep 20, 2020 at 06:01:58PM +0100, Bryan O'Donoghue wrote:
> > commit 2b74b0a04d3e ("USB: gadget: f_ncm: add bounds checks to ncm_unwrap_ntb()")
> > adds important bounds checking however it unfortunately also introduces  a
> > bug with respect to section 3.3.1 of the NCM specification.
> > 
> > wDatagramIndex[1] : "Byte index, in little endian, of the second datagram
> > described by this NDP16. If zero, then this marks the end of the sequence
> > of datagrams in this NDP16."
> > 
> > wDatagramLength[1]: "Byte length, in little endian, of the second datagram
> > described by this NDP16. If zero, then this marks the end of the sequence
> > of datagrams in this NDP16."
> > 
> > wDatagramIndex[1] and wDatagramLength[1] respectively then may be zero but
> > that does not mean we should throw away the data referenced by
> > wDatagramIndex[0] and wDatagramLength[0] as is currently the case.
> > 
> > Breaking the loop on (index2 == 0 || dg_len2 == 0) should come at the end
> > as was previously the case and checks for index2 and dg_len2 should be
> > removed since zero is valid.
> > 
> > I'm not sure how much testing the above patch received but for me right now
> > after enumeration ping doesn't work. Reverting the commit restores ping,
> > scp, etc.
> > 
> > The extra validation associated with wDatagramIndex[0] and
> > wDatagramLength[0] appears to be valid so, this change removes the incorrect
> > restriction on wDatagramIndex[1] and wDatagramLength[1] restoring data
> > processing between host and device.
> > 
> > Fixes: 2b74b0a04d3e ("USB: gadget: f_ncm: add bounds checks to ncm_unwrap_ntb()")
> > Cc: Ilja Van Sprundel <ivansprundel@ioactive.com>
> > Cc: Brooke Basile <brookebasile@gmail.com>
> > Cc: stable <stable@kernel.org>
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
> >  drivers/usb/gadget/function/f_ncm.c | 30 ++---------------------------
> >  1 file changed, 2 insertions(+), 28 deletions(-)
> 
> This patch appears to be pushed to 4.19, 5.4 and 5.8 stable trees via:
> 
> https://lore.kernel.org/lkml/20201005142108.771915994@linuxfoundation.org/
> https://lore.kernel.org/lkml/20201005142109.966570222@linuxfoundation.org/
> https://lore.kernel.org/lkml/20201005142114.960807335@linuxfoundation.org/
> 
> Will you push this patch to v4.14.y, in order to fix v4.14.196 commit
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=b88ad6e714284b
> ("USB: gadget: f_ncm: add bounds checks to ncm_unwrap_ntb()") ?

It also need to go to 4.9.y, and is already queued up in the stable
queues for those trees for the next round of kernels that are released
for them.

thanks,

greg k-h
