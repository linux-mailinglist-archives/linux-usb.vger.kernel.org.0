Return-Path: <linux-usb+bounces-17060-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8657F9BB804
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 15:38:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B4CC2810D5
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 14:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DFB1B1D65;
	Mon,  4 Nov 2024 14:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQGjh1y1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE9F137932
	for <linux-usb@vger.kernel.org>; Mon,  4 Nov 2024 14:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730731124; cv=none; b=IKkhugbm4w4Wf+MfkcjA7G70CpkIMC+rsgj2lhANA6fYwVxbSLpPVGIll2KR4azoizRjuyngANJiXLqUM+/zrRTTwHfZNjQbKguM+vf4gC6o9Got4p1UxHZQBH0qyctF4lkRm2D4JHeitGWCjue8mxnNLZwtB8vwET44umaH2YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730731124; c=relaxed/simple;
	bh=kLm4xpnG5qlZEXpW/v1vakY17RNfBI8G7ezWU7llaYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVYEHhL+tYL4RtTr1zTRNXQKWOh9/vk7CFFov/ngn9LZLVwq0MjeA0NPNqzBIrM7AGHLEroXriOqg4Z362Nrzjp0swkyINk6Tf6n2qAeK9ey8wYQfg0oE4/oYsPYC+gqJUvpZucJyTPCCxpdjrYWbUhDWPFninRoKlzX3fwg6z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQGjh1y1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730731123; x=1762267123;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kLm4xpnG5qlZEXpW/v1vakY17RNfBI8G7ezWU7llaYo=;
  b=IQGjh1y15XVkxRrpnd5buxxWv4A0yxFXs5fem+Iqyr2/24xaCqrBUJV2
   kMm3RSE4zl0ESWPkAJJvX8VT3GtC4Z8EuAgq6KfXF2DsRF4/plWGiurXX
   FtNzz0wJYPRvXmfugAc5tk9xn8RN4fyYSRt3K1ZnhmUqaGRMDGxkNMwvg
   dyfeS7Wpf0wZ4jh2magIQshP6kcxPtyrVU+xn+Xvo9m+GTsJNI3UWRRfg
   f6aY8Ud487yuBy7RCuC0AkQqA7SgQwcQh1PynlIU82b3Y2FZ+ijgtr/d/
   M4OnLcRLK9oRNK6n4x5tUJKJBKvWrK2YrHXhyJPRKNAHIhXXWEvZ6H85g
   w==;
X-CSE-ConnectionGUID: rGCg9DKWSi2ePeWMEb5mYA==
X-CSE-MsgGUID: Pt+M0W6HQN6yCCqgAXzU3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52997939"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52997939"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 06:37:14 -0800
X-CSE-ConnectionGUID: ntoRN7qSSSGJE6oBW/xKoQ==
X-CSE-MsgGUID: Zk9HYwb1ROexArXIq3HnpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="83769537"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.97.183])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 06:37:12 -0800
Date: Mon, 4 Nov 2024 15:37:10 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: linux-usb@vger.kernel.org, Wentong Wu <wentong.wu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 1/3] usb: misc: ljca: move usb_autopm_put_interface()
 after wait for response
Message-ID: <ZyjcFltIgCS/YqdZ@linux.intel.com>
References: <20241104085056.652294-1-stanislaw.gruszka@linux.intel.com>
 <0e0d4146-a083-4263-a06b-c6277e89ddc5@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e0d4146-a083-4263-a06b-c6277e89ddc5@redhat.com>

On Mon, Nov 04, 2024 at 02:39:57PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 4-Nov-24 9:50 AM, Stanislaw Gruszka wrote:
> > Do not mark interface as ready to suspend when we are still waiting
> > for response messages from the device.
> > 
> > Fixes: acd6199f195d ("usb: Add support for Intel LJCA device")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > ---
> >  drivers/usb/misc/usb-ljca.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
> > index 01ceafc4ab78..dcb3c5d248ac 100644
> > --- a/drivers/usb/misc/usb-ljca.c
> > +++ b/drivers/usb/misc/usb-ljca.c
> > @@ -332,9 +332,6 @@ static int ljca_send(struct ljca_adapter *adap, u8 type, u8 cmd,
> >  
> >  	ret = usb_bulk_msg(adap->usb_dev, adap->tx_pipe, header,
> >  			   msg_len, &transferred, LJCA_WRITE_TIMEOUT_MS);
> > -
> > -	usb_autopm_put_interface(adap->intf);
> > -
> >  	if (ret < 0)
> >  		goto out;
> >  	if (transferred != msg_len) {
> > @@ -353,6 +350,8 @@ static int ljca_send(struct ljca_adapter *adap, u8 type, u8 cmd,
> >  	ret = adap->actual_length;
> >  
> >  out:
> > +	usb_autopm_put_interface(adap->intf);
> > +
> 
> I'm afraid that this now does a double pm_runtime_put() on
> usb_autopm_get_interface() failures. usb_autopm_get_interface() uses
> pm_runtime_resume_and_get() which already does a pm_runtime_put()
> on failure.
> 
> So you need to add a second out label which skips the new
> location of the usb_autopm_put_interface(adap->intf); call
> and jump to this second label on usb_autopm_get_interface()
> failures.

Good point, thanks for catching this, I will fix and post v2.

Regards
Stanislaw


