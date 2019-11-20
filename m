Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D160104486
	for <lists+linux-usb@lfdr.de>; Wed, 20 Nov 2019 20:47:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727800AbfKTTrN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Nov 2019 14:47:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:36426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727378AbfKTTrM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 20 Nov 2019 14:47:12 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 760AA20679;
        Wed, 20 Nov 2019 19:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574279232;
        bh=TzLV4YRhBI1Y8XGqiMff3E5PU+5yB3PhvAPoW8EqbA8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CjKyqllJtYcxJ15lmX7PN58w2H1GP0hRMOLcRA3QNnKTQnF76ZRooNTOkyJ14Vk3j
         f8Tyrzp9Eu/a09IaYcbg8tQxoNqOC9ICQb9SgGJyChNQyJ3lEiaETZA4WjEeIupcG4
         NKoa4aKasxYn2dRkKvsrT6GxVEUYmV/C+nVTHldM=
Date:   Wed, 20 Nov 2019 20:47:09 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Chen <hzpeterchen@gmail.com>
Cc:     Peter Chen <peter.chen@nxp.com>, Felipe Balbi <balbi@kernel.org>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH -next] usb: gadget: configfs: Fix missing spin_lock_init()
Message-ID: <20191120194709.GA3092233@kroah.com>
References: <20191030034046.188808-1-weiyongjun1@huawei.com>
 <20191030081101.GF26815@b29397-desktop>
 <CAL411-pVmtTr58YFmsotcY+w2KR3kR1hQ1bJOG9CNA-fmPQYGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL411-pVmtTr58YFmsotcY+w2KR3kR1hQ1bJOG9CNA-fmPQYGg@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 18, 2019 at 05:09:39PM +0800, Peter Chen wrote:
> BR,
> Peter Chen
> 
> On Wed, Oct 30, 2019 at 4:12 PM Peter Chen <peter.chen@nxp.com> wrote:
> >
> > On 19-10-30 03:40:46, Wei Yongjun wrote:
> > > The driver allocates the spinlock but not initialize it.
> > > Use spin_lock_init() on it to initialize it correctly.
> > >
> > > This is detected by Coccinelle semantic patch.
> > >
> > > Fixes: 1a1c851bbd70 ("usb: gadget: configfs: fix concurrent issue between composite APIs")
> > > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > > ---
> > >  drivers/usb/gadget/configfs.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> > > index 33852c2b29d1..ab9ac48a751a 100644
> > > --- a/drivers/usb/gadget/configfs.c
> > > +++ b/drivers/usb/gadget/configfs.c
> > > @@ -1544,6 +1544,7 @@ static struct config_group *gadgets_make(
> > >       gi->composite.resume = NULL;
> > >       gi->composite.max_speed = USB_SPEED_SUPER;
> > >
> > > +     spin_lock_init(&gi->spinlock);
> > >       mutex_init(&gi->lock);
> > >       INIT_LIST_HEAD(&gi->string_list);
> > >       INIT_LIST_HEAD(&gi->available_func);
> > >
> >
> > Reviewed-by: Peter Chen <peter.chen@nxp.com>
> 
> Hi Felipe & Greg,
> 
> We may need this patch for usb/next and usb/linus tree, otherwise, there will
> be kernel dump if enable lockdep:

Ok, now queued up.

thanks,

greg k-h
