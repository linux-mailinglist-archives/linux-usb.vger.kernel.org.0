Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 237DE1496F
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 14:19:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbfEFMTm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 08:19:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:47712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725852AbfEFMTm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 May 2019 08:19:42 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3BABE206BF;
        Mon,  6 May 2019 12:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557145181;
        bh=IkkCvKdj1m9CLTpnezAYAtEi1RM8qREObEZYOlTgd+M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Tvj+TVWseg4oYD4zo69YIRXoh3ESMDB7NbJOzRJyTZlYEV0EW5vJeHmr9xq1wciNh
         tPTmnjtVhGytM+vGhBcShuOdA/GXGkuAfPghg4c3GAWhZwu8iiw0jN9V8zp8EgYlHy
         RcApQyQnNLtY6ZCM9DxIXvSzuoTlcAeKGEpFiNh0=
Date:   Mon, 6 May 2019 14:19:38 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mantas =?utf-8?Q?Mikul=C4=97nas?= <grawity@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 05/34] lsusb.py: remove -w (warn if usb.ids not sorted)
 option
Message-ID: <20190506121938.GA24340@kroah.com>
References: <20190506090241.169665-1-grawity@gmail.com>
 <20190506090241.169665-6-grawity@gmail.com>
 <20190506111257.GA20756@kroah.com>
 <CAPWNY8WCOdx4CjiSM2W+EN5DSLuFKNxj=4fncRGZUoadem_0_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPWNY8WCOdx4CjiSM2W+EN5DSLuFKNxj=4fncRGZUoadem_0_w@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 06, 2019 at 02:21:17PM +0300, Mantas Mikulėnas wrote:
> On Mon, May 6, 2019 at 2:13 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, May 06, 2019 at 12:02:12PM +0300, Mantas Mikulėnas wrote:
> > > Signed-off-by: Mantas Mikulėnas <grawity@gmail.com>
> > > ---
> > >  lsusb.py.in | 45 ++-------------------------------------------
> > >  1 file changed, 2 insertions(+), 43 deletions(-)
> >
> > Why remove this?  What's wrong with this option for people who want to
> > work on usb.ids?
> 
> 
> Hmm, I was under the impression that its purpose was just for
> debugging the lookup code and becomes unnecessary when said lookup
> code is outright removed (the next commit removes the binary-search
> lookup). Did I misunderstand the code?
> 
> (Although in any case, a dedicated "lint-usb.ids" script seems like a
> more fitting place for this feature than a lsusb option...)

Yes, lint-usb.ids does make much more sense.  I'll apply this one now,
thanks.

greg k-h
