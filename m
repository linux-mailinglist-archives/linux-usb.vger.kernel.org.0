Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72B9711A6A9
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 10:20:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728404AbfLKJU6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 04:20:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:33742 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726983AbfLKJU6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Dec 2019 04:20:58 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C459E21556;
        Wed, 11 Dec 2019 09:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576056058;
        bh=e6526BjxSyBUT02dPmO0YyblFYd8Hoj+fF/a4KHodJo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Dez4W8cXOQvtYZbvsNvKwvY2W5/AMxT3qTvomZ3BngtfY/yZL9PZXeqKiexnMdK8n
         zrva1oo3xGqJ51MnhxxhjpL0APPT4254eSn+q6S0L0XVAvzSsmRqQ1lAEFueDW4GC1
         fbFf3Hy0rKUhXmbDoFvSMKzOMKsv4SaGmiyEcrEU=
Date:   Wed, 11 Dec 2019 10:20:55 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>
Cc:     Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: musb: Fix a possible null-pointer dereference
 in musb_handle_intr_connect()
Message-ID: <20191211092055.GA505396@kroah.com>
References: <20191210165454.13772-1-b-liu@ti.com>
 <20191210165454.13772-3-b-liu@ti.com>
 <20191211080910.GA426347@kroah.com>
 <dc1cbf76-a2c4-a861-0847-d3434b843fee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc1cbf76-a2c4-a861-0847-d3434b843fee@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 11, 2019 at 05:10:17PM +0800, Jia-Ju Bai wrote:
> 
> 
> On 2019/12/11 16:09, Greg Kroah-Hartman wrote:
> > On Tue, Dec 10, 2019 at 10:54:54AM -0600, Bin Liu wrote:
> > > From: Jia-Ju Bai <baijiaju1990@gmail.com>
> > > 
> > > In musb_handle_intr_connect(), there is an if statement on line 783 to
> > > check whether musb->hcd is NULL:
> > >      if (musb->hcd)
> > > 
> > > When musb->hcd is NULL, it is used on line 797:
> > >      musb_host_poke_root_hub(musb);
> > >          if (musb->hcd->status_urb)
> > > 
> > > Thus, a possible null-pointer dereference may occur.
> > Maybe, if musb->hcd really ever could be NULL.
> > 
> > In looking at the code, I don't see where that could happen, do you?
> > Why is that check there in the first place?
> > 
> > What sets musb->hcd to NULL in the first place?
> 
> In fact, my static analysis tool identifies an if check about musb->hcd, so
> it infers that musb->hcd could be NULL here.
> But it does not try to find any explicit place that set musb->hcd to NULL.

Can it do that?

> If musb->hcd is never NULL here, we can just delete the related if check.

I agree :)

thanks,

greg k-h
