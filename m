Return-Path: <linux-usb+bounces-16094-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6BB99A5B6
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 16:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EAF31C21081
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 14:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21099215015;
	Fri, 11 Oct 2024 14:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zg38HXPn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A57BD517
	for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 14:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728655482; cv=none; b=GtjBlgx86LOW+Rf5Jp6ghpxzURo6glasw8xD0dJ1t93aZBi5ah2MDjUo+1uteR2caSnXQLlBptGg8Yb4nX3d19hV0suCzRV4I9g7zpmZSE6q61A3fYLq0IVJ4VfuvNUgMSxWzhqoHuoNBmMFJx1BGJpbHIwLedp7EYXW7Tivzv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728655482; c=relaxed/simple;
	bh=lAfZiRIhx2junYYJErUxSUyJavrfABzzoJxJ7STgUE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LRHKrlscFpAuoOevYvFJM2vHvkbS62HDQRVDX2LSwBvBRvGWi9S5H7ppNRcdrCPj/CVPKicq8b9+5rnFaKPm7dBMgN07iywHeEFKK9N0OecdbUdTMuAxJI1+Rjyi7Rlmuf+F6/3TsLAMcYS4gpisZRv0M6X/ol8Jhq3v9X1i1GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zg38HXPn; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728655481; x=1760191481;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lAfZiRIhx2junYYJErUxSUyJavrfABzzoJxJ7STgUE0=;
  b=Zg38HXPnoldBdDPgEpWC+Q8i3oHpFVY37Xy+4P+eFKJhZxJ0wCtx/8Di
   5hCs13r6+8wOhEeplZXIp3ACudRP4s1RvDwl2j6yS86nu+KLWJsobGQMs
   0XrpHrGqRzjJLlY+60NAphdTJem47DbhvgX0c48d4Nzfz2J2b4c9PNBmQ
   Nlw9bCckKIuyBCfpdX2caWYXtYA4U/VnPNlKqlR+Bm0iVupCejMCWU6TO
   bOrMP3pCOO6kNrbnKsy9rZQyLlv1Cb1I1VP9JypMaK0k2eeT3eUAKsDj/
   PXiMlUR703Yeh96z9Wss0ly0BUJNRTCF/irUQ72/92sZjKpELLbvJAy03
   g==;
X-CSE-ConnectionGUID: eyttckluQOCTqRt2zWUcqQ==
X-CSE-MsgGUID: zWTfuv3SSIeyBUi6hXTlNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31963625"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="31963625"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 07:04:39 -0700
X-CSE-ConnectionGUID: CjwT5sTyT5ekX6N0LGG1TA==
X-CSE-MsgGUID: 3OOeu7VCS8u8JcGzXSmDKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="100243388"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa002.fm.intel.com with SMTP; 11 Oct 2024 07:04:36 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 11 Oct 2024 17:04:35 +0300
Date: Fri, 11 Oct 2024 17:04:35 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 4/4] usb: typec: ucsi: Add support for the partner USB
 Modes
Message-ID: <ZwkwcxdOAIAacjn9@kuha.fi.intel.com>
References: <20241011124402.3306994-1-heikki.krogerus@linux.intel.com>
 <20241011124402.3306994-5-heikki.krogerus@linux.intel.com>
 <2024101142-pastrami-sedan-7dbd@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024101142-pastrami-sedan-7dbd@gregkh>

On Fri, Oct 11, 2024 at 03:11:01PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Oct 11, 2024 at 03:44:02PM +0300, Heikki Krogerus wrote:
> > UCSI does not share the contents of the Enter_USB Message
> > that was used, so the active mode still has to be always
> > determined from the enumerated USB device. However, after
> > UCSI v2.0 it is possible to check separately is USB4 the
> > active mode.
> > 
> > So with USB2 and USB3 the mode is always determined from the
> > result of the USB enumeration, and when USB4 USB Mode is
> > active, UCSI driver can assign the mode directly.
> > 
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> >  drivers/usb/typec/ucsi/ucsi.c | 8 ++++++++
> >  drivers/usb/typec/ucsi/ucsi.h | 2 ++
> >  2 files changed, 10 insertions(+)
> > 
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> > index 13c739d334c4..804f7f9b35ea 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -1057,6 +1057,14 @@ static int ucsi_register_partner(struct ucsi_connector *con)
> >  
> >  	con->partner = partner;
> >  
> > +	if (con->ucsi->version >= UCSI_VERSION_3_0)
> > +		if (UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) &
> > +		    UCSI_CONSTAT_PARTNER_FLAG_USB4_GEN4)
> > +			typec_partner_set_usb_mode(partner, USB_MODE_USB4);
> > +	if (con->ucsi->version >= UCSI_VERSION_2_0)
> > +		if (UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) &
> > +		    UCSI_CONSTAT_PARTNER_FLAG_USB4_GEN3)
> > +			typec_partner_set_usb_mode(partner, USB_MODE_USB4);
> 
> Will this cause multiple set mode uevents to go out if both of these are
> true?

That should not be possible, but I'll change it to if else.

thanks,

-- 
heikki

