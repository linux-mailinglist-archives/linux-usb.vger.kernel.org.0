Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B94E646DDA9
	for <lists+linux-usb@lfdr.de>; Wed,  8 Dec 2021 22:36:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237265AbhLHVk3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Dec 2021 16:40:29 -0500
Received: from netrider.rowland.org ([192.131.102.5]:60031 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S234532AbhLHVk2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Dec 2021 16:40:28 -0500
Received: (qmail 588025 invoked by uid 1000); 8 Dec 2021 16:36:55 -0500
Date:   Wed, 8 Dec 2021 16:36:55 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Guo Zhengkui <guozhengkui@vivo.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Li Jun <jun.li@nxp.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Peter Chen <peter.chen@nxp.com>,
        "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        kernel <kernel@vivo.com>
Subject: Re: [PATCH] usb: core: hcd: fix bug: application of sizeof to pointer
Message-ID: <YbEldysG5XSfsp8o@rowland.harvard.edu>
References: <20211207135401.5507-1-guozhengkui@vivo.com>
 <Ya9yZX3JsuO8OcVJ@kroah.com>
 <AJkA6AAaE4s5AAqOmmsZjapb.9.1638915668969.Hmail.guozhengkui@vivo.com.@PFlhL2VVYmROMStBQkZWV2ZAcm93bGFuZC5oYXJ2YXJkLmVkdT4=>
 <14d2ddb6-4a4a-bb4d-48bf-4847445d6199@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14d2ddb6-4a4a-bb4d-48bf-4847445d6199@vivo.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 08, 2021 at 11:00:41AM +0800, Guo Zhengkui wrote:
> On 2021/12/8 6:21, Alan Stern wrote:
> > On Tue, Dec 07, 2021 at 03:40:37PM +0100, Greg Kroah-Hartman wrote:
> > > On Tue, Dec 07, 2021 at 09:53:47PM +0800, Guo Zhengkui wrote:
> > > > Fix following error:
> > > > ./drivers/usb/core/hcd.c:1284:38-44: ERROR:
> > > > application of sizeof to pointer.
> > > 
> > > What generated this error?
> > > 
> > > > 
> > > > Use sizeof(*vaddr) instead.
> > > > 
> > > > Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
> > > > ---
> > > >   drivers/usb/core/hcd.c | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> > > > index 4d326ee12c36..996d5273cf60 100644
> > > > --- a/drivers/usb/core/hcd.c
> > > > +++ b/drivers/usb/core/hcd.c
> > > > @@ -1281,7 +1281,7 @@ static int hcd_alloc_coherent(struct usb_bus *bus,
> > > >   		return -EFAULT;
> > > >   	}
> > > > -	vaddr = hcd_buffer_alloc(bus, size + sizeof(vaddr),
> > > > +	vaddr = hcd_buffer_alloc(bus, size + sizeof(*vaddr),
> > > 
> > > I think you just broke the code.
> > > 
> > > Look at this closer and see what the function is doing with this buffer
> > > and if you still think your patch is correct, please rewrite the
> > > changelog text to explain why it is so (hint, just using the output of
> > > coccinelle isn't ok.)
> > 
> 
> Sorry for my carelessness. It should be sizeof(vaddr).
> 
> > Although the patch is definitely wrong, the code could stand to be
> > improved.  The value stored at the end of the buffer is *vaddr_handle
> > converted to an unsigned long, but the space reserved for this value is
> > sizeof(vaddr) -- which doesn't make much sense since vaddr is a pointer
> > to unsigned char.  The code implicitly relies on the fact that unsigned
> > long takes up the same amount of space as a pointer.
> > 
> > Readers wouldn't have to stop and figure this out if the amount of
> > reserved space was simply set to sizeof(unsigned long) rather than
> > sizeof(vaddr).
> 
> OK, I will commit another patch to fix this problem. Do you mind I add a
> "Suggested-by" tag of your name (Alan Stern) in this new patch?

That's fine.

Alan Stern
