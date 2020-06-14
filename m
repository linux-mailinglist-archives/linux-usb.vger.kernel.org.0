Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5A21F882A
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jun 2020 11:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgFNJha (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 14 Jun 2020 05:37:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:47830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725265AbgFNJh2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 14 Jun 2020 05:37:28 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2AA7A206D7;
        Sun, 14 Jun 2020 09:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592127447;
        bh=8orjLDhUBAN0bDGjYDrNUtEfzaCypd2crAEAdk7OEw8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WpU5K18LydSLpSqdLi9zJTVT/SUblg6LUYMb2is826Z1Cy59+YfQKylpnR01b+j1l
         gMtUKyxN7/LbH4No7L8CiFyoBXo3TJ92tWCKAxVm9qb0iDZw/GFzj1QT3Gof+gjttk
         OH53siWBCtGT3otCwEYqJA038R/058uS3u8Fmeos=
Date:   Sun, 14 Jun 2020 11:37:25 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Changming Liu <liu.changm@northeastern.edu>
Cc:     "thomas@winischhofer.net" <thomas@winischhofer.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: sisusbvga: Fix left shifting a possible negative
 value
Message-ID: <20200614093725.GB2641815@kroah.com>
References: <BL0PR06MB45483EF82A54B8751524A2E7E5B60@BL0PR06MB4548.namprd06.prod.outlook.com>
 <20200521073627.GB2579717@kroah.com>
 <BL0PR06MB45480E2A734DEC31AB3F5CBBE5B70@BL0PR06MB4548.namprd06.prod.outlook.com>
 <20200522072401.GA847030@kroah.com>
 <BL0PR06MB4548FDD13144603AFAA92BEAE5B40@BL0PR06MB4548.namprd06.prod.outlook.com>
 <20200523061343.GA3156699@kroah.com>
 <BN6PR06MB25321BBE3DE153B8D7D424A5E5860@BN6PR06MB2532.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN6PR06MB25321BBE3DE153B8D7D424A5E5860@BN6PR06MB2532.namprd06.prod.outlook.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 05, 2020 at 10:13:13PM +0000, Changming Liu wrote:
> 
> 
> > -----Original Message-----
> > From: Greg KH <gregkh@linuxfoundation.org>
> > Sent: Saturday, May 23, 2020 2:14 AM
> > To: Changming Liu <liu.changm@northeastern.edu>
> > Cc: thomas@winischhofer.net; linux-usb@vger.kernel.org
> > Subject: Re: [PATCH] USB: sisusbvga: Fix left shifting a possible negative value
> > 
> > On Fri, May 22, 2020 at 07:14:32PM +0000, Changming Liu wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Greg KH <gregkh@linuxfoundation.org>
> > > > Sent: Friday, May 22, 2020 3:24 AM
> > > > To: Changming Liu <liu.changm@northeastern.edu>
> > > > Cc: thomas@winischhofer.net; linux-usb@vger.kernel.org
> > > > Subject: Re: [PATCH] USB: sisusbvga: Fix left shifting a possible negative
> > value
> > > >
> > > > On Thu, May 21, 2020 at 05:56:44PM +0000, Changming Liu wrote:
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Greg KH <gregkh@linuxfoundation.org>
> > > > > > Sent: Thursday, May 21, 2020 3:36 AM
> > > > > > To: Changming Liu <liu.changm@northeastern.edu>
> > > > > > Cc: thomas@winischhofer.net; linux-usb@vger.kernel.org
> > > > > > Subject: Re: [PATCH] USB: sisusbvga: Fix left shifting a possible negative
> > > > value
> > > > > >
> > > > > > On Wed, May 20, 2020 at 06:06:50PM +0000, Changming Liu wrote:
> > > > > > > The char buffer buf, accepts user data which might be negative value
> > and
> > > > > > > the content is left shifted to form an unsigned integer.
> > > > > > >
> > > > > > > Since left shifting a negative value is undefined behavior, thus change
> > > > > > > the char to u8 to fix this
> > > > > > >
> > > > > > > Signed-off-by: Changming Liu <liu.changm@northeastern.edu>
> > > > > > > ---
> > > > > > >  drivers/usb/misc/sisusbvga/sisusb.c | 2 +-
> > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/drivers/usb/misc/sisusbvga/sisusb.c
> > > > > > b/drivers/usb/misc/sisusbvga/sisusb.c
> > > > > > > index fc8a5da4a07c..0734e6dd9386 100644
> > > > > > > --- a/drivers/usb/misc/sisusbvga/sisusb.c
> > > > > > > +++ b/drivers/usb/misc/sisusbvga/sisusb.c
> > > > > > > @@ -761,7 +761,7 @@ static int sisusb_write_mem_bulk(struct
> > > > > > sisusb_usb_data *sisusb, u32 addr,
> > > > > > >         u8   swap8, fromkern = kernbuffer ? 1 : 0;
> > > > > > >         u16  swap16;
> > > > > > >         u32  swap32, flag = (length >> 28) & 1;
> > > > > > > -       char buf[4];
> > > > > > > +       u8 buf[4];
> > > > > >
> > > > > > Do we also need to change the kernbuffer variable from char* to be u8*
> > > > > > as the same time to solve the same potential issue?
> > > > > >
> > > > >
> > > > > This is a very good point, sorry I didn't notice this.
> > > > > Indeed, according to the caller of sisusb_copy_memory, the wrapper of
> > > > current function
> > > > > there is no guarantee that each char in kernbuffer is positive.
> > > > >
> > > > > However, it seems if we change the function argument type directly from
> > > > char* to u8*,
> > > > > Other parts that call this function e.g. in sisusb_copy_memory
> > > > > or uses this pointer e.g. line 770,line 883 must change accordingly.
> > > > > Looks like many force casts which doesn't look too necessary.
> > > > >
> > > > > I wonder how about just force casting the content of kernbuffer when it's
> > > > read in line 823 to line 829
> > > > > from char to u8? This seems explicitly fix this bug.
> > > >
> > > > That will work, but how about just changing all instances of char to u8
> > > > throughout this driver to make sure everything is working properly that
> > > > way.  char should not be used as a type when copying around "raw" data
> > > > like this from user-to-device for these reasons.
> > > >
> > >
> > > This is a clean sweep, from the perspective of security I find no reason against
> > it.
> > > Indeed, u8 is strictly better than char when there is no need for any value to
> > be negative.
> > > I'd be very honored to see this through.
> > >
> > > I wonder, by this driver, you mean this sisusbvga module or something else?
> > > Forgive me for my limited understanding of the module since I've only read
> > the code related to this bug.
> > > Please let me know on what files do you want to apply this change.
> > 
> > The sisusbvga module, all of the files that make it up, in
> > drivers/usb/misc/sisusbvga/ are what I am referring to here.
> > 
> > > Or if you feel like doing this yourself please go ahead,
> > > I'm still a bit daunted by the scale of changes that need to be made frankly :p
> > 
> > Nope, you can do this, it shouldn't be that hard.  Might take a few
> > patches, do it as a patch series, doing one logical change per patch.
> > 
> > If you have specific questions, please let us know!
> > 
> Hi Greg,
> Sorry for following up so late, I have been traveling for the past
>  a few days.
> 
> I've received the emails from kbuild test robot about the 
> sisbus_write and sisbus_read's declaration being incompilable
>  with struct file_operations because I changed the buffer
> from char* to u8* in my last patch.
> 
> Sorry I didn't know this would fail the test. Is there anything I 
> could do to fix this? Should I submit another patch?

Fix up the series and resend it.

thanks,

greg k-h
