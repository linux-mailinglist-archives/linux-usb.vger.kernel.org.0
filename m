Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A23F36CD350
	for <lists+linux-usb@lfdr.de>; Wed, 29 Mar 2023 09:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbjC2HfA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Mar 2023 03:35:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbjC2Hef (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Mar 2023 03:34:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBD5E4C27
        for <linux-usb@vger.kernel.org>; Wed, 29 Mar 2023 00:32:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 97ECD61AD8
        for <linux-usb@vger.kernel.org>; Wed, 29 Mar 2023 07:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD08C433D2;
        Wed, 29 Mar 2023 07:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1680075120;
        bh=TZQ/rzqm9NRFOiMj/+dkn8t59KzfYYCy1uBwzhHrgaA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H1lRIfBGkti45acoETBp40FZ0CrF/XSu6NotHj+wiOq46F8f3pi3piNGI0cW3Egxs
         Wz2Di70YG65b+FBTz3CPWH27S+nEDZG6u2gHuFIeYn1sGnNs/hPqnlf3B6ksPdSrXk
         EfeMiMGzpPL1L+kiP/25EHn6TA0U1Xvt+DX9o3Bw=
Date:   Wed, 29 Mar 2023 09:31:58 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 4/6] usb: gadget: f_fs: add a device reference of
 usb_gadget->dev
Message-ID: <ZCPpbtcpo8TE23L5@kroah.com>
References: <1679911940-4727-1-git-send-email-quic_linyyuan@quicinc.com>
 <1679911940-4727-4-git-send-email-quic_linyyuan@quicinc.com>
 <ZCPgbqSLG4s9lSxv@kroah.com>
 <d82172a1-7f09-bb0f-fa04-d6151eb72f4f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d82172a1-7f09-bb0f-fa04-d6151eb72f4f@quicinc.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 29, 2023 at 03:00:54PM +0800, Linyu Yuan wrote:
> 
> On 3/29/2023 2:53 PM, Greg Kroah-Hartman wrote:
> > On Mon, Mar 27, 2023 at 06:12:18PM +0800, Linyu Yuan wrote:
> > > It is known that dev_vdbg() macro can accept NULL or non-NULL dev pointer.
> > > 
> > > Add a struct device *dev member in struct ffs_data, set it to NULL before
> > > binding or after unbinding to a usb_gadget, set it reference of usb_gadget
> > > ->dev when bind success.
> > > 
> > > Then it can help replace private pr_vdebug() to dev_vdbg() consistently.
> > > 
> > > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > > ---
> > > v3: new patch in this version
> > > 
> > >   drivers/usb/gadget/function/f_fs.c | 3 +++
> > >   drivers/usb/gadget/function/u_fs.h | 1 +
> > >   2 files changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> > > index a4051c8..25461f1 100644
> > > --- a/drivers/usb/gadget/function/f_fs.c
> > > +++ b/drivers/usb/gadget/function/f_fs.c
> > > @@ -1722,6 +1722,7 @@ static struct ffs_data *ffs_data_new(const char *dev_name)
> > >   		return NULL;
> > >   	}
> > > +	ffs->dev = NULL;
> > >   	refcount_set(&ffs->ref, 1);
> > >   	atomic_set(&ffs->opened, 0);
> > >   	ffs->state = FFS_READ_DESCRIPTORS;
> > > @@ -1831,6 +1832,7 @@ static int functionfs_bind(struct ffs_data *ffs, struct usb_composite_dev *cdev)
> > >   	}
> > >   	ffs->gadget = cdev->gadget;
> > > +	ffs->dev = &cdev->gadget->dev;
> > >   	ffs_data_get(ffs);
> > >   	return 0;
> > >   }
> > > @@ -1843,6 +1845,7 @@ static void functionfs_unbind(struct ffs_data *ffs)
> > >   		mutex_lock(&ffs->mutex);
> > >   		usb_ep_free_request(ffs->gadget->ep0, ffs->ep0req);
> > >   		ffs->ep0req = NULL;
> > > +		ffs->dev = NULL;
> > >   		ffs->gadget = NULL;
> > >   		clear_bit(FFS_FL_BOUND, &ffs->flags);
> > >   		mutex_unlock(&ffs->mutex);
> > > diff --git a/drivers/usb/gadget/function/u_fs.h b/drivers/usb/gadget/function/u_fs.h
> > > index 4b3365f..c5f6167 100644
> > > --- a/drivers/usb/gadget/function/u_fs.h
> > > +++ b/drivers/usb/gadget/function/u_fs.h
> > > @@ -146,6 +146,7 @@ enum ffs_setup_state {
> > >   struct ffs_data {
> > >   	struct usb_gadget		*gadget;
> > > +	struct device			*dev;
> > No, sorry, this is not correct.
> > 
> > You already have a struct device right there in the struct usb_gadget.
> > Use that one instead, as you are just setting this pointer to the same
> > value (see above where you set it.)
> 
> 
> just want to use consistent dev_(v)dbg() related macro, to avoid reference 
> usb_gadget->dev
> 
> when usb_gadget is NULL.

When will usb_gadget be NULL when you want to print out logging
messages?  You shouldn't be printing out anything during that time
anyway, right?

thanks,

greg k-h
