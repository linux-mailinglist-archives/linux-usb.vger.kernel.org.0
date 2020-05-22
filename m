Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38CAA1DE0C2
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2020 09:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbgEVHYF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 May 2020 03:24:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:45598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726578AbgEVHYF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 22 May 2020 03:24:05 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B646720679;
        Fri, 22 May 2020 07:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590132243;
        bh=IaLC+RJkci1m2ErZRwVFgvrf7T+BlG7TSt7FZTNJjYI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NjbV/wiFfwHmd220PQMxbsFrMqaJFE/qi4fVwbFfhnNcQlN8BqkSrOQPfA8OxNQhJ
         I/TXzh05d3WERb+hO8X8y39dA4ayV+8qAa4sEGzRT0JbUFJM0etcJ8ItHc5GKEnwW9
         1TsmFHSUyeO7QtJtSYTHt4QD7Z8d35nkhalExKjc=
Date:   Fri, 22 May 2020 09:24:01 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Changming Liu <liu.changm@northeastern.edu>
Cc:     "thomas@winischhofer.net" <thomas@winischhofer.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: sisusbvga: Fix left shifting a possible negative
 value
Message-ID: <20200522072401.GA847030@kroah.com>
References: <BL0PR06MB45483EF82A54B8751524A2E7E5B60@BL0PR06MB4548.namprd06.prod.outlook.com>
 <20200521073627.GB2579717@kroah.com>
 <BL0PR06MB45480E2A734DEC31AB3F5CBBE5B70@BL0PR06MB4548.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL0PR06MB45480E2A734DEC31AB3F5CBBE5B70@BL0PR06MB4548.namprd06.prod.outlook.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 21, 2020 at 05:56:44PM +0000, Changming Liu wrote:
> 
> 
> > -----Original Message-----
> > From: Greg KH <gregkh@linuxfoundation.org>
> > Sent: Thursday, May 21, 2020 3:36 AM
> > To: Changming Liu <liu.changm@northeastern.edu>
> > Cc: thomas@winischhofer.net; linux-usb@vger.kernel.org
> > Subject: Re: [PATCH] USB: sisusbvga: Fix left shifting a possible negative value
> > 
> > On Wed, May 20, 2020 at 06:06:50PM +0000, Changming Liu wrote:
> > > The char buffer buf, accepts user data which might be negative value and
> > > the content is left shifted to form an unsigned integer.
> > >
> > > Since left shifting a negative value is undefined behavior, thus change
> > > the char to u8 to fix this
> > >
> > > Signed-off-by: Changming Liu <liu.changm@northeastern.edu>
> > > ---
> > >  drivers/usb/misc/sisusbvga/sisusb.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/usb/misc/sisusbvga/sisusb.c
> > b/drivers/usb/misc/sisusbvga/sisusb.c
> > > index fc8a5da4a07c..0734e6dd9386 100644
> > > --- a/drivers/usb/misc/sisusbvga/sisusb.c
> > > +++ b/drivers/usb/misc/sisusbvga/sisusb.c
> > > @@ -761,7 +761,7 @@ static int sisusb_write_mem_bulk(struct
> > sisusb_usb_data *sisusb, u32 addr,
> > >         u8   swap8, fromkern = kernbuffer ? 1 : 0;
> > >         u16  swap16;
> > >         u32  swap32, flag = (length >> 28) & 1;
> > > -       char buf[4];
> > > +       u8 buf[4];
> > 
> > Do we also need to change the kernbuffer variable from char* to be u8*
> > as the same time to solve the same potential issue?
> > 
> 
> This is a very good point, sorry I didn't notice this.
> Indeed, according to the caller of sisusb_copy_memory, the wrapper of current function
> there is no guarantee that each char in kernbuffer is positive.
> 
> However, it seems if we change the function argument type directly from char* to u8*, 
> Other parts that call this function e.g. in sisusb_copy_memory 
> or uses this pointer e.g. line 770,line 883 must change accordingly.
> Looks like many force casts which doesn't look too necessary.
> 
> I wonder how about just force casting the content of kernbuffer when it's read in line 823 to line 829
> from char to u8? This seems explicitly fix this bug.

That will work, but how about just changing all instances of char to u8
throughout this driver to make sure everything is working properly that
way.  char should not be used as a type when copying around "raw" data
like this from user-to-device for these reasons.

thanks,

greg k-h
