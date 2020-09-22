Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55E1C273A54
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 07:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbgIVFno (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 01:43:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:48636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726790AbgIVFno (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 01:43:44 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 81DAE23A84;
        Tue, 22 Sep 2020 05:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600753423;
        bh=m+wxZExRfaNRmnoLtkU6TmdGqQtEbHa++fghcwKVqNE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oCpYLh0ps52P7s/zermV265Pj+RnsnUUdt/tyCq6zsHrVp5BQuN8PUnNGWMvzp2ol
         rvTHWcxez2PDr8DDx3P3OjhkWIYGZvrKinrCLRqKLBnY4xX5WUlxwELTnxR6ypi4bO
         wa1ij7twoDF7LFnhO1upGZ5mIsdrmNeSq/WyQoz8=
Date:   Tue, 22 Sep 2020 07:43:38 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     Ajay Gupta <ajaykuee@gmail.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: typec: ucsi_ccg: use dev_info for timeout error
Message-ID: <20200922054338.GA588161@kroah.com>
References: <20200921174216.2862-1-ajayg@nvidia.com>
 <20200921185432.GA1484407@kroah.com>
 <BY5PR12MB3953FD500F1F72A32A5BEC07DC3A0@BY5PR12MB3953.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY5PR12MB3953FD500F1F72A32A5BEC07DC3A0@BY5PR12MB3953.namprd12.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 21, 2020 at 08:50:04PM +0000, Ajay Gupta wrote:
> Hi Greg
> 
> > -----Original Message-----
> > From: Greg KH <gregkh@linuxfoundation.org>
> > Sent: Monday, September 21, 2020 11:55 AM
> > To: Ajay Gupta <ajaykuee@gmail.com>
> > Cc: heikki.krogerus@linux.intel.com; linux-usb@vger.kernel.org; Ajay Gupta
> > <ajayg@nvidia.com>
> > Subject: Re: [PATCH] usb: typec: ucsi_ccg: use dev_info for timeout error
> > 
> > External email: Use caution opening links or attachments
> > 
> > 
> > On Mon, Sep 21, 2020 at 10:42:16AM -0700, Ajay Gupta wrote:
> > > From: Ajay Gupta <ajayg@nvidia.com>
> > >
> > > Timeout error may be seen due to missing USB Type-C UCSI controller on
> > > some NVIDIA GPU card. Currently we don't have a correct way to
> > > identify these cards.
> > 
> > No unique id anywhere???  That feels like someone really messed up :(
> Yes, there is none.

Can you identify them by the failure of an i2c transfer?  Feels like
that would work :)

> > > Tools like Plymouth (splashscreen) doesn't like dev_err so changing
> > > timeout status log to dev_info.
> > >
> > > Bug information:
> > > https://bugzilla.kernel.org/show_bug.cgi?id=206653
> > >
> > > Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
> > > ---
> > >  drivers/usb/typec/ucsi/ucsi_ccg.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c
> > > b/drivers/usb/typec/ucsi/ucsi_ccg.c
> > > index bff96d64dddf..d69432df866e 100644
> > > --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> > > +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> > > @@ -252,7 +252,7 @@ static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8
> > *data, u32 len)
> > >               put_unaligned_le16(rab, buf);
> > >               status = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> > >               if (status < 0) {
> > > -                     dev_err(uc->dev, "i2c_transfer failed %d\n", status);
> > > +                     dev_info(uc->dev, "i2c_transfer failed %d\n",
> > > + status);
> > 
> > It's an error, leave it an error.
> > 
> > If it's not an error, don't log it.
> Looks like this is the best option we have.

It is an error, so we log it, that's fine.  We are correctly reporting
the fact that the hardware is broken and not working properly, don't
paper over that please.

thanks,

greg k-h
