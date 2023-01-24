Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41490679681
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jan 2023 12:21:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233386AbjAXLVi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Jan 2023 06:21:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbjAXLVg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Jan 2023 06:21:36 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD9BA113D7
        for <linux-usb@vger.kernel.org>; Tue, 24 Jan 2023 03:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674559295; x=1706095295;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jlat4bdeS7ISD371Rqya7Ynky4YfEOwoiu/tqiTTE00=;
  b=jBg35NOVMBS+14aBldYQVn1EtbjPpYpuGiaU79tzraUpHtZBzjfTnah5
   jbjBYYhqijO7KPrwaWsRljcbo3I0PNgDSXUwHpiwgd/ouNRVV/0sSKnZF
   xgMAquL2/rBtNiPWVVo+ddyvujbNgmWuEL7UAbSa9pff0lUYyXys3nwgG
   lIRabvytTKCo5mal4iffooadG2K1Yfj05ABEv1omYlulFJmL04AFcOK6a
   7L7ieB6T9i2iiPi/vRU0y4krnXCyf4HwN4efsCe8XYoGkOnh3A1ADHxXK
   q9jpuD9O1Nk3dgI5v4CeBD3LM41S1LHe0z6o8bW6nAbA5g0QnGDQ8fHh1
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="314173247"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="314173247"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 03:21:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="804559947"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="804559947"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 24 Jan 2023 03:21:19 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 24 Jan 2023 13:21:18 +0200
Date:   Tue, 24 Jan 2023 13:21:18 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: introduce read_explicit operation
Message-ID: <Y8+/Lgp7fWaxFsri@kuha.fi.intel.com>
References: <20230120233920.752245-1-samuel@cavoj.net>
 <Y8uRnc3Cxb1ADad6@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y8uRnc3Cxb1ADad6@kroah.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Sat, Jan 21, 2023 at 08:17:49AM +0100, Greg KH wrote:
> On Sat, Jan 21, 2023 at 12:39:21AM +0100, Samuel Čavoj wrote:
> > On some ACPI platforms (namely the ASUS Zenbook UM325) the _DSM method must
> > not be called after a notification is received but instead the mailbox
> > should be read immediately from RAM. This is because the ACPI interrupt
> > handler destroys the CCI in ERAM after copying to system memory, and when
> > _DSM is later called to perform a second copy, it retrieves a garbage
> > value.
> > 
> > Instead, the _DSM(read) method should only be called when necessary, i.e.
> > for polling the state after reset and for retrieving the version. Other
> > reads should not call _DSM and only peek into the RAM region.
> > 
> > For platforms other than ACPI, the read_explicit op uses the same
> > implementation as read.
> > 
> > Link: https://lore.kernel.org/linux-usb/20210823180626.tb6m7h5tp6adhvt2@fastboi.localdomain/
> > Signed-off-by: Samuel Čavoj <samuel@cavoj.net>
> > ---
> >  drivers/usb/typec/ucsi/ucsi.c         |  9 +++++----
> >  drivers/usb/typec/ucsi/ucsi.h         |  3 +++
> >  drivers/usb/typec/ucsi/ucsi_acpi.c    | 11 +++++++++++
> >  drivers/usb/typec/ucsi/ucsi_ccg.c     |  1 +
> >  drivers/usb/typec/ucsi/ucsi_stm32g0.c |  1 +
> >  5 files changed, 21 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> > index eabe519013e7..39ee3b63d07d 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -883,7 +883,7 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
> >  			goto out;
> >  		}
> >  
> > -		ret = ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci));
> > +		ret = ucsi->ops->read_explicit(ucsi, UCSI_CCI, &cci, sizeof(cci));
> >  		if (ret)
> >  			goto out;
> >  
> > @@ -1347,7 +1347,8 @@ struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops)
> >  {
> >  	struct ucsi *ucsi;
> >  
> > -	if (!ops || !ops->read || !ops->sync_write || !ops->async_write)
> > +	if (!ops || !ops->read || !ops->read_explicit || !ops->sync_write ||
> > +	    !ops->async_write)
> >  		return ERR_PTR(-EINVAL);
> >  
> >  	ucsi = kzalloc(sizeof(*ucsi), GFP_KERNEL);
> > @@ -1382,8 +1383,8 @@ int ucsi_register(struct ucsi *ucsi)
> >  {
> >  	int ret;
> >  
> > -	ret = ucsi->ops->read(ucsi, UCSI_VERSION, &ucsi->version,
> > -			      sizeof(ucsi->version));
> > +	ret = ucsi->ops->read_explicit(ucsi, UCSI_VERSION, &ucsi->version,
> > +				       sizeof(ucsi->version));
> >  	if (ret)
> >  		return ret;
> >  
> > diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> > index c968474ee547..8361e1cfc8eb 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.h
> > +++ b/drivers/usb/typec/ucsi/ucsi.h
> > @@ -37,6 +37,7 @@ struct ucsi_altmode;
> >  /**
> >   * struct ucsi_operations - UCSI I/O operations
> >   * @read: Read operation
> > + * @read_explicit: Read operation with explicit poll if applicable
> 
> I do not understand what "explicit poll" means here, you are going to
> have to make it much more obvious.
> 
> But why should this need to be in the usci core?  Shouldn't the
> individual driver know what needs to be done here or not?  That's it's
> job, you are forcing the usci core to know about specific hardware
> problems here, which feels wrong.
> 
> 
> >   * @sync_write: Blocking write operation
> >   * @async_write: Non-blocking write operation
> >   * @update_altmodes: Squashes duplicate DP altmodes
> > @@ -48,6 +49,8 @@ struct ucsi_altmode;
> >  struct ucsi_operations {
> >  	int (*read)(struct ucsi *ucsi, unsigned int offset,
> >  		    void *val, size_t val_len);
> > +	int (*read_explicit)(struct ucsi *ucsi, unsigned int offset,
> > +			     void *val, size_t val_len);
> >  	int (*sync_write)(struct ucsi *ucsi, unsigned int offset,
> >  			  const void *val, size_t val_len);
> >  	int (*async_write)(struct ucsi *ucsi, unsigned int offset,
> > diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
> > index ce0c8ef80c04..6b3475ed4874 100644
> > --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> > @@ -45,6 +45,16 @@ static int ucsi_acpi_read(struct ucsi *ucsi, unsigned int offset,
> >  			  void *val, size_t val_len)
> >  {
> >  	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
> > +
> > +	memcpy(val, ua->base + offset, val_len);
> 
> How can you copy directly from ram?  Isn't this i/o memory?  Are you
> sure this works on all platforms?
> And you just switched the default read to do so, shouldn't you only do
> this for the "special" types instead?

It's not i/o memory, it's just a mailbox in ram - it's mapped with
memremap() in this driver.

I asked that Samuel to share this here, but perhaps we should consider
it still as an RFC. I have tested this with some of my platforms, but
I want to test more.

I would also like to see if it's possible to take care of this problem
in ucsi_acpi.c so we don't have to touch the ucsi core.

thanks,

-- 
heikki
