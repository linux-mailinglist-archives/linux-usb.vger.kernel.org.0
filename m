Return-Path: <linux-usb+bounces-17223-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B1C9BEF34
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 14:38:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 498891F244F7
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 13:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED8B11DFE39;
	Wed,  6 Nov 2024 13:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jgkwvems"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E241F9ABA
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 13:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730900284; cv=none; b=u3hMUXchAqHTXDbLisvdEfQZErl0RWeSQOIk/oH6Df80ubWzEp5skJfU27xP/olJ+rFuOW3T+rWBEX5QnaRXzFk3M55LeVyG4q+8jse51NZ2WIromO/NpIwRQoHxtjvYxQ4znCSRhs0mLTc6GcYQkrFgFNSipMylVvYpxoii8/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730900284; c=relaxed/simple;
	bh=ylchiJaYSzzByTAqs/LY8coXR9n+8YqH+MLXSuG8Wzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUBno2sioZCjgq+9HQQQDwLt8qVyvvMttjCyQQWfcHjpU8k+Fr87+DqDOUFQ2E3HVKY9srqB4YUxy8jVAC9aC1ogWUa/QVJpmIJnUTMWuv0sKN1hSgkbDIP+wpEHCEFl8OEtBtIArNPXOyGdcBMT/6DOc5INwDn3T6SAcpCvBvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jgkwvems; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730900284; x=1762436284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ylchiJaYSzzByTAqs/LY8coXR9n+8YqH+MLXSuG8Wzs=;
  b=JgkwvemsN2DBt2mjjcOmdy5tiiLmVDjB11u9bNQu8+ev0BqEy4lQ4vKS
   mO+/SRlXjTb40ayLxoQnrh59pvh5HNUK9WhNc3wWBHyOmG8TPxGntkWjx
   fdyrjhH4JlNbXjTNMxoemOGAu58f2J/aCT0UYlSkxt7ASdjXz6rYrVtYP
   +TAHpL0KWtK7wBU1O9S2R+zTI00fmtAJbT2I0SaVsbpjfgiCuktKjGl4R
   t6TV4ZCJHhXeV/PXPa7XgvCvrCPcM1Do+1SdqYumv+hxlrZiC0gjDJnxB
   i6l+Fv+I5KHycAG1I4+rFILEeL7l3Xe91/6j4jj8/tpszsFTaZWO6R5ZE
   A==;
X-CSE-ConnectionGUID: xiQ2Xe5aRGmDMpWHAXeUlg==
X-CSE-MsgGUID: pcGbmepaS0i5p+5Nr/gPgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="42096998"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="42096998"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 05:38:03 -0800
X-CSE-ConnectionGUID: O1aZ2sa0T7+LFmVdGWcAlA==
X-CSE-MsgGUID: rGOKVeofTT2IEeODj5kx2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84901849"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 05:38:01 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C20D511F9C3;
	Wed,  6 Nov 2024 15:37:58 +0200 (EET)
Date: Wed, 6 Nov 2024 13:37:58 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	linux-usb@vger.kernel.org, Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v2 3/3] usb: misc: ljca: print firmware version
Message-ID: <ZytxNk1DEiwiXJ5b@kekkonen.localdomain>
References: <20241106123438.337117-1-stanislaw.gruszka@linux.intel.com>
 <20241106123438.337117-3-stanislaw.gruszka@linux.intel.com>
 <2024110620-dating-roman-f820@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024110620-dating-roman-f820@gregkh>

Hi Greg,

On Wed, Nov 06, 2024 at 01:42:33PM +0100, Greg KH wrote:
> On Wed, Nov 06, 2024 at 01:34:38PM +0100, Stanislaw Gruszka wrote:
> > For diagnostics purposes read firmware version from device
> > and print it to dmesg during initialization.
> 
> No, sorry, when drivers work properly, they are quiet.  Think about what
> your kernel log would look like if you did this for every single driver
> in the tree.
> 
> > 
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > Tested-by: Hans de Goede <hdegoede@redhat.com> # ThinkPad X1 Yoga Gen 8, ov2740
> > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > ---
> >  drivers/usb/misc/usb-ljca.c | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> > 
> > diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
> > index d9c21f783055..e698a1075a40 100644
> > --- a/drivers/usb/misc/usb-ljca.c
> > +++ b/drivers/usb/misc/usb-ljca.c
> > @@ -43,6 +43,7 @@ enum ljca_client_type {
> >  
> >  /* MNG client commands */
> >  enum ljca_mng_cmd {
> > +	LJCA_MNG_GET_VERSION = 1,
> >  	LJCA_MNG_RESET = 2,
> >  	LJCA_MNG_ENUM_GPIO = 4,
> >  	LJCA_MNG_ENUM_I2C = 5,
> > @@ -68,6 +69,13 @@ struct ljca_msg {
> >  	u8 data[] __counted_by(len);
> >  } __packed;
> >  
> > +struct ljca_fw_version {
> > +	u8 major;
> > +	u8 minor;
> > +	__le16 patch;
> > +	__le16 build;
> > +} __packed;
> > +
> >  struct ljca_i2c_ctr_info {
> >  	u8 id;
> >  	u8 capacity;
> > @@ -695,6 +703,25 @@ static int ljca_reset_handshake(struct ljca_adapter *adap)
> >  	return 0;
> >  }
> >  
> > +static void ljca_print_fw_version(struct ljca_adapter *adap)
> > +{
> > +	struct ljca_fw_version version = {};
> > +	int ret;
> > +
> > +	ret = ljca_send(adap, LJCA_CLIENT_MNG, LJCA_MNG_GET_VERSION, NULL, 0,
> > +			(u8 *)&version, sizeof(version), true,
> > +			LJCA_WRITE_ACK_TIMEOUT_MS);
> > +
> > +	if (ret != sizeof(version)) {
> > +		dev_err(adap->dev, "Get version failed, ret: %d\n", ret);
> > +		return;
> 
> Why not return the error?

An error here would indicate something is a little fishy but doesn't
prevent the device from working as such. I'd think it's fine as-is.

> 
> > +	}
> > +
> > +	dev_info(adap->dev, "Firmware version: %d.%d.%d.%d\n",
> > +		 version.major, version.minor,
> > +		 le16_to_cpu(version.patch), le16_to_cpu(version.build));
> 
> Again, sorry, but no.  Feel free to dump this in a sysfs file if you
> really want to get access to it, but not in the kernel log.

I guess dev_dbg() should do as well.

-- 
Regards,

Sakari Ailus

