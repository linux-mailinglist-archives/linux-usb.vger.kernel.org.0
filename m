Return-Path: <linux-usb+bounces-17416-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9AB9C3A6F
	for <lists+linux-usb@lfdr.de>; Mon, 11 Nov 2024 10:09:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 905382824CD
	for <lists+linux-usb@lfdr.de>; Mon, 11 Nov 2024 09:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FFD716C69F;
	Mon, 11 Nov 2024 09:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ieLAFnrr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8FB61FE9
	for <linux-usb@vger.kernel.org>; Mon, 11 Nov 2024 09:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731316151; cv=none; b=sEtOn8b1y/W7EUyyfbBJctaeoMlB1DdDoyltE1PCz8J36onnnedY/1Q4blkyLqrxu2HRhrdujICCYynrffhrfyV8QdBQzWzU7Fpb/RT/RPXTWeAHdb4fMVaWXSVADEqrxRadiRZhAEhVmx4F9YhANQ4Yf1OBT8HLEKLr4bWSC0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731316151; c=relaxed/simple;
	bh=/y3MnH9SX4BmRjWIm4SjRJonWJs0ESlHX1mJFaKzA5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iyq1epcuhucCMH2m96L9EbxHUeY2SKdclAcSkVaKp/3Fv5TElsxcQ4SQUAcgq3Z//z7Ds4CHqxTTQxjX+8UYb8foxVq1WvMkfdDKy4FlE7HvecekjgGCCScvcCVOTTt0di7qBsl+uSik2lHIU/uxpcFOCZgB6eCzYWLf2oH83XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ieLAFnrr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731316150; x=1762852150;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/y3MnH9SX4BmRjWIm4SjRJonWJs0ESlHX1mJFaKzA5U=;
  b=ieLAFnrrKYE9WsMw4AzKPovQ/N5dlmbqcV9/Inm7NnShjxXFB7ruYzh/
   19DRhwQizcGnkdvhPKinkQhKfhmXTMS1IaycDyIkTrM3yQ+FFHq1xfUrG
   Xvma4/nEVDg18ruZm9toepUbToyA3B66hHO+MUA7rKyFlaD0JJvRjfXhr
   NsZcZrAqsO1If6LX1i8aFpAn+CZGC+lYTPj3Qm0vw3NmHIOG7+o949hOj
   Rcm3HyiV3b7JtClrijARVPf+8qP0lIdYALQM6TGacs8F3MU/OCXpIXWLe
   9Jc1QrTHuyfBGszbWB1pM4jFZ2rJwuL050cFWDv3Ydp0nU/vjTvQMdYm+
   A==;
X-CSE-ConnectionGUID: V3g+UkYoSi6fU6PVVsctcQ==
X-CSE-MsgGUID: lqoijRaqQneGf3SF8m2u/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="31337112"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="31337112"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:09:09 -0800
X-CSE-ConnectionGUID: UHkPvUR3Tgq1tN62m7tRLQ==
X-CSE-MsgGUID: gj/Rh9BHTxi/FYI9xzKEpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="110079369"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa002.fm.intel.com with SMTP; 11 Nov 2024 01:09:06 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 11 Nov 2024 11:09:04 +0200
Date: Mon, 11 Nov 2024 11:09:04 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Bartosz Szpila <bszpila@google.com>,
	"Katiyar, Pooja" <pooja.katiyar@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: ucsi: Convert connector specific commands
 to bitmaps
Message-ID: <ZzHJsAco2VQw3R1i@kuha.fi.intel.com>
References: <20241106150605.1017744-1-heikki.krogerus@linux.intel.com>
 <Zy864W7sysWZbCTd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zy864W7sysWZbCTd@linaro.org>

On Sat, Nov 09, 2024 at 12:35:13PM +0200, Abel Vesa wrote:
> On 24-11-06 17:06:05, Heikki Krogerus wrote:
> > That allows the fields in those command data structures to
> > be easily validated. If an unsupported field is accessed, a
> > warning is generated.
> > 
> > This will not force UCSI version checks to be made in every
> > place where these data structures are accessed, but it will
> > make it easier to pinpoint issues that are caused by the
> > unconditional accesses to those fields, and perhaps more
> > importantly, allow those issues to be noticed immediately.
> > 
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> > 
> > Changed since v1:
> > - The CONCAP macro now reads the correct member.
> > 
> > I added the version to all the field definitions that need it instead
> > of adding a complete macro for each of those fields. I think that
> > should be enough to make the version clear to everybody during use as
> > well as review.
> > 
> > ---
> >  drivers/usb/typec/ucsi/psy.c       |  28 ++--
> >  drivers/usb/typec/ucsi/trace.h     |  28 ++--
> >  drivers/usb/typec/ucsi/ucsi.c      | 121 +++++++-------
> >  drivers/usb/typec/ucsi/ucsi.h      | 252 +++++++++++++++++------------
> >  drivers/usb/typec/ucsi/ucsi_acpi.c |   7 +-
> >  5 files changed, 240 insertions(+), 196 deletions(-)
> > 
> 
> [...]
> 
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> > index e430a0ca4a2b..974a441155e1 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> 
> [...]
> 
> > @@ -1778,7 +1775,7 @@ static int ucsi_init(struct ucsi *ucsi)
> >  
> >  	/* Get PPM capabilities */
> >  	command = UCSI_GET_CAPABILITY;
> > -	ret = ucsi_send_command(ucsi, command, &ucsi->cap, sizeof(ucsi->cap));
> > +	ret = ucsi_send_command(ucsi, command, &ucsi->cap, UCSI_GET_CAPABILITY_SIZE);
> 
> This fails for version < UCSI_VERSION_2_0. Size is wrong.

Thanks for catching that. I'll send the fix.

-- 
heikki

