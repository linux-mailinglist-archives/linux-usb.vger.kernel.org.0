Return-Path: <linux-usb+bounces-637-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C32297B03D4
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 14:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id DBB941C209AE
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 12:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E68286B3;
	Wed, 27 Sep 2023 12:19:14 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15433107BE
	for <linux-usb@vger.kernel.org>; Wed, 27 Sep 2023 12:19:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBD5612A
	for <linux-usb@vger.kernel.org>; Wed, 27 Sep 2023 05:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695817150; x=1727353150;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BioufM1BSEZYntrKHg1Rn+FI11MpXAnIhmNM5pHMtSo=;
  b=JcxgIXkncLcbWUgn3wiETvB7WbOQ/PkWauWRFoywcIleST4/4ljNvjQ6
   fzXkzgJEC9FdwkUz1rnIZy9vwwj4edlp7Q6G3h+Sa4FxU9KTR4jw7NZk0
   7zv9yHAsZ3FtsSUSkGCtPw6p/mqI1A0xJsK/dpZwF1dPJqXSnOK7bcPT7
   bhMD0kq03LK/jUwa1ShQS3wH5RjM99PDGcXniLgbQvvDShg+l4h5SzLCa
   V7AGXvMQmSlARTWYzNpgLEb04xWsiCpimuDgn0IkNUpTCsjzIQyV4gxnI
   UXX26i3hTyCKy8xTLtS1kAsAVG+PHufFC5akDYCYdWjNaO1RM7uFpTObR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="381711315"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="381711315"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 05:19:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="752551839"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="752551839"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga007.fm.intel.com with SMTP; 27 Sep 2023 05:19:07 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 27 Sep 2023 15:19:06 +0300
Date: Wed, 27 Sep 2023 15:19:06 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org,
	Douglas Gilbert <dgilbert@interlog.com>
Subject: Re: [PATCH] usb: pd: Exposing the Peak Current value of Fixed
 Supplies to user space
Message-ID: <ZRQduiDBDmcqXgw+@kuha.fi.intel.com>
References: <20230927111031.1059096-1-heikki.krogerus@linux.intel.com>
 <2023092721-barrier-geranium-ec0e@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023092721-barrier-geranium-ec0e@gregkh>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Wed, Sep 27, 2023 at 02:10:38PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Sep 27, 2023 at 02:10:31PM +0300, Heikki Krogerus wrote:
> > Exposing the value of the field as is.
> > 
> > The Peak Current value has to be interpreted as described
> > in Table 6-10 (Fixed Power Source Peak Current Capability)
> > of the USB Power Delivery Specification, but that
> > interpretation will be done in user space, not in kernel.
> > 
> > Suggested-by: Douglas Gilbert <dgilbert@interlog.com>
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> >  drivers/usb/typec/pd.c | 10 ++++------
> >  include/linux/usb/pd.h |  1 +
> >  2 files changed, 5 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/usb/typec/pd.c b/drivers/usb/typec/pd.c
> > index 8cc66e4467c4..85d015cdbe1f 100644
> > --- a/drivers/usb/typec/pd.c
> > +++ b/drivers/usb/typec/pd.c
> > @@ -83,14 +83,12 @@ unchunked_extended_messages_supported_show(struct device *dev,
> >  }
> >  static DEVICE_ATTR_RO(unchunked_extended_messages_supported);
> >  
> > -/*
> > - * REVISIT: Peak Current requires access also to the RDO.
> >  static ssize_t
> >  peak_current_show(struct device *dev, struct device_attribute *attr, char *buf)
> >  {
> > -	...
> > +	return sysfs_emit(buf, "%u\n", (to_pdo(dev)->pdo >> PDO_FIXED_PEAK_CURR_SHIFT) & 3);
> >  }
> > -*/
> > +static DEVICE_ATTR_RO(peak_current);
> 
> Don't you need to add a Documentation/ABI/ entry for this new field?

Yes. Sorry about that. I'll send v2.

thanks,

-- 
heikki

