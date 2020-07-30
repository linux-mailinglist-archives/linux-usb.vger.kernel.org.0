Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7FD5232B4A
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jul 2020 07:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728631AbgG3FTT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jul 2020 01:19:19 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:60937 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728601AbgG3FTS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jul 2020 01:19:18 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 2F0085C00DB;
        Thu, 30 Jul 2020 01:19:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 30 Jul 2020 01:19:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=V8IC+nfLelaudIsEM1/87yyzKgk
        MV+LrIU0UJZj25rY=; b=LNr1hVGfWt4oLeWrvzg/jZPHTJwtOdPqOcOCobEapef
        cZVsZNr2n20V763KKnAK9j3G5ve+hkGicmXjtn5mVDwjtd9LsKWf6zdeCA9vJZ4I
        ZwPMn9swkJsXGL0mKqKbzXI/d6zreVcLov8kodNedsyfoarYn/km6Z3tICB71fk8
        5Dh9ruEQUBW08+MENo5OuPjd13s6y3k3BcowsmBC5NpMkxyCr0XVK9oolJ2xtJoA
        8m3cy8gdrDkeqkYYbjk4EP9KteHjbUzUkhgrFXdGBGOjD7wrjnwh9eThM5i0iW5j
        6nnRqpv+5Tcel06+68YB31P/tgysF+d/pgybBd83Cbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=V8IC+n
        fLelaudIsEM1/87yyzKgkMV+LrIU0UJZj25rY=; b=Wz081ze25z1pZMlf7fpLAD
        /PJ+vYUtbgQzFcP6FMop271nKC1OGObjEn2Uw6O6+C9iuE8lkyev/JcI0OXYi/0A
        J1wA34qMTtOEwyGg1OlrB/7sHDjZlSWlZb5TlAoubERFVt6c4JJQhST2EPHSlg5X
        FSl/RvcYXxLkWfsEtQHPTyr1oTJnMKFHKa233D3QRkyyqYzN+Jps28ke/VeqWt2D
        +gBZxsCzurtO4+uVP0LZpYH7yRJxrrm8hVRno9H8u+jIvR03trJ7+zy9gzrYY2ej
        q4BMqu7e4dppT5Vq+QkfVf7Ow9PcMGhSJGmuwHkCMSaRDrFvaGesRbz350R2kT3g
        ==
X-ME-Sender: <xms:U1giX648WnMTqE_0uzHcsLE0wQksPLo-76pPnjQ6UNkR8D3SCo83CA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrieehgdejlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeekfedr
    keeirdekledruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:U1giXz5GTkyCRm2UWqnZ6-i1S350R6Os5cBc8uIMcCvcm-mC84lNnA>
    <xmx:U1giX5f090xvnH6X_QGsszuJ8Pe2ATWrzlfBgHfluaQmUMczqzQIVw>
    <xmx:U1giX3I6aj1E159HQAl9fMN7sHP0fWgbrrg2XF-Fr-xW507xo5bp6w>
    <xmx:VVgiXzHwOpMyypkQp-rt99EVWPbtHYEjsQIBYQ2zEcLRZGBk2LSFxg>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0241E3060067;
        Thu, 30 Jul 2020 01:19:14 -0400 (EDT)
Date:   Thu, 30 Jul 2020 07:19:04 +0200
From:   Greg KH <greg@kroah.com>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Roger Quadros <rogerq@ti.com>,
        Anton Vasilyev <vasilyev@ispras.ru>,
        Evgeny Novikov <novikov@ispras.ru>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH RFC 1/4] USB: UDC: Don't wipe deallocated memory
Message-ID: <20200730051904.GA3859261@kroah.com>
References: <20200729202231.GB1584059@rowland.harvard.edu>
 <20200730032744.GC26224@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200730032744.GC26224@b29397-desktop>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 30, 2020 at 03:28:09AM +0000, Peter Chen wrote:
> On 20-07-29 16:22:31, Alan Stern wrote:
> > Abusing the kernel's device model, some UDC drivers (including
> > dwc3 and cdns3) register and unregister their gadget structures
> > multiple times.  This is strictly forbidden; device structures may not
> > be reused.
> 
> Register and unregister gadget structures multiple times should be
> allowed if we pass a clean (zeroed) gadget device structure. I checked
> the cdns3 code (cdns3_gadget_start), it always zeroed struct usb_gadget
> before calling usb_add_gadget_udc when start device mode.

How do you "know" that the structure really was properly freed/released
by the driver core at that point in time?

That's the issue, even if you do unregister it, the driver core, or any
other part of the kernel, can hold on to the memory for an unbounded
amount of time, due to the fact that this is a reference counted
pointer.

So please, never "recycle" memory structures like this.  The
documentation for the kernel explicitly says "do not do this!"

thanks,

greg k-h
