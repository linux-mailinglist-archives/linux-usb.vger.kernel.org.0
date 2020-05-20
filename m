Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA691DBA11
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 18:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbgETQrN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 12:47:13 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:48451 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726829AbgETQrN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 May 2020 12:47:13 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 571045C00FD;
        Wed, 20 May 2020 12:47:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 20 May 2020 12:47:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=557jQ7zL84dZsza/7jle+9uDh37
        jGJSG5L/jDMWZwbs=; b=jfDI4PjZcwvg4zKFTei6EbSixeEm3hdpQ9HhNsxheoh
        /R4ebz0ntmOAW2rzDf+UEfLdK9EZVVGradFLGiuFKyMlFscE9uZIyzXcBeRoyoyW
        KgxSM8cXjQIatbKXyzrsesmyXfBNm6X04jhDXxPvJbHHVRWGUpOj7VFC4KKo+0PU
        TUhwBwsCKjoQtl+dow77kvSJWh8XAptw8Ruixm7h6j8r4CqdBo2n39xM/KgY1kRB
        wScqzGmXC9kMMQEAhiEAuOpl1oJL0uNp8N5M1h3l5c1o7wqYVXF6ERGMZYl4VfpS
        YaMzjqdSvFZdyule+qTmMJ4cNwE51gNSf7SZyOUfs5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=557jQ7
        zL84dZsza/7jle+9uDh37jGJSG5L/jDMWZwbs=; b=qorH9hn87JbFOTKzt5QI+B
        sLfiTsvwG38BC/J+YKhMeh2kEuybwpuzK6eiILxhXVjJXMVuqDFH/SlnDL7V3mGb
        67Sr2WxQLvcwoI2qKKJ4vPA2gbxZwCTl72JVj5N3CI1MXYqK6NVH0Ij6dt8go8W3
        0jFRe0Z2THyWROX6tjMbtYxLWgeGTQ0M1BCtP4Fs4a3mIqqDxbmO6Jtf2ONSoRyE
        paTA7suJubFfrKjDHg8Z+45n4D6L2e5xHWVS7XNRwOrl55uxNm/Y/YDY647GZmeg
        b/deNNOJZJvq+WV0CoJ7iF9YQZyzljVzMKxZL3sMtKuBhogW+ZPtD3owf0mf5Y1g
        ==
X-ME-Sender: <xms:EF_FXjA8ifS3mC8G-uIndZ4HmpshyCZRje42Jx4YLNw8VgCZc5oWHQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtledguddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
    ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeek
    fedrkeeirdekledruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:EF_FXpjct867SZbsBfkXqZTLoiHBi2kY8ceXZyg1chn7au8tQUxhXw>
    <xmx:EF_FXunU-VcFO57dzuUaiaUdesENwbc_lNwFt8bGPUgktgO7BTvGJQ>
    <xmx:EF_FXlxpWISeoSO09rFD6bldbZJegUm8knR0vGtCm4bRGjL62UuG7Q>
    <xmx:EF_FXjLEeHLQnt-KPpCmuctuORegkLkOJtxHtVcag_ek4qQyb654jw>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id DBFA8328005A;
        Wed, 20 May 2020 12:47:11 -0400 (EDT)
Date:   Wed, 20 May 2020 18:47:07 +0200
From:   Greg KH <greg@kroah.com>
To:     Changming Liu <liu.changm@northeastern.edu>
Cc:     "thomas@winischhofer.net" <thomas@winischhofer.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Lu, Long" <l.lu@northeastern.edu>,
        "yaohway@gmail.com" <yaohway@gmail.com>
Subject: Re: [PATCH] USB: sisusbvga: Fix left shifting a possible negative
 value
Message-ID: <20200520164707.GB66231@kroah.com>
References: <BL0PR06MB4548B811CFD66D0AB61ACD89E5B60@BL0PR06MB4548.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL0PR06MB4548B811CFD66D0AB61ACD89E5B60@BL0PR06MB4548.namprd06.prod.outlook.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 20, 2020 at 04:37:50PM +0000, Changming Liu wrote:
> 
> 
> > -----Original Message-----
> > From: Greg KH <greg@kroah.com>
> > Sent: Wednesday, May 20, 2020 1:02 AM
> > To: Changming Liu <liu.changm@northeastern.edu>
> > Cc: thomas@winischhofer.net; linux-usb@vger.kernel.org; Lu, Long
> > <l.lu@northeastern.edu>; yaohway@gmail.com
> > Subject: Re: [Bug Report] drivers/usb/misc/sisusbvga: undefined result when
> > left shift a possible negative value in sisusb_write_mem_bulk
> > 
> > On Wed, May 20, 2020 at 03:51:04AM +0000, Changming Liu wrote:
> > > Hi Greg and Thomas,
> > > Greetings, I'm a first-year PhD student who is interested in the usage of
> > UBSan for linux. And after some experiments, I've found that in
> > drivers/usb/misc/sisusbvga/sisusb.c
> > > function sisusb_write_mem_bulk, there is an undefined behavior caused by
> > left shifting a possible negative number.
> > >
> > > More specifically, in the switch statement for case 3, after executing
> > copy_from_user, the the lower 3 bytes of char buf[4] are filled with data from
> > user space.
> > > And these 3 bytes are left shifted accordingly to form a 32bit unsigned
> > integer, swap32.
> > >
> > > The potential problem is, since the buf is declared as signed char buffer so
> > each byte might be a negative number while being left shifted. According to the
> > C standard, when the left-hand operand of the left shift operator is a negative
> > value, the result is undefined. So I guess change the buf declaration to unsigned
> > will help? Given that it's only used here.
> > 
> > Sounds like a good idea, patches are welcome to fix this.
> 
> Hi greg,
> Thank you for this recognition! This means a lot to me. 
> Here's the patch as we agreed.

Please resend this in a normal format where we can properly review it.

But:

> 
> Best,
> Changming
> 
> 
> >From 14ae7c67ea3fb96ed6bea0bc9919f3c597308813 Mon Sep 17 00:00:00 2001
> From: Changming Liu <liu.changm@northeastern.edu>
> Date: Wed, 20 May 2020 12:19:37 -0400
> Subject: [PATCH] USB: sisusbvga: Fix left shifting a possible negative value
> 
> the char buffer buf, accepts user data which might be negative value and the content is left shifted to form an unsigned integer.
> Since left shifting a negative value is undefined behavior, thus change the char to u8 to fix this

Properly line-wrap your changelog when you resend this.

thanks,

greg k-h
