Return-Path: <linux-usb+bounces-25343-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00437AEF263
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 11:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 527414A2A1E
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 09:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E7DE26AAA3;
	Tue,  1 Jul 2025 09:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I3gEaRBN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC59C223716
	for <linux-usb@vger.kernel.org>; Tue,  1 Jul 2025 09:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751360602; cv=none; b=s4vYQlgyba3t8Ei7l5bIvTziQKhKH7jFhP1dilvNS0WMMrDtdrk0ymd1W5U8l4boRc84/GlWLO0GAIE6nKL1opwF9cFGv9NtZZzUdTmS13jOSyHAvphO2FN10x3jeuDdmF4tMqiL2/AfNh/LJRtNgpcsNDx6KgFjQHnxBCDvzWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751360602; c=relaxed/simple;
	bh=zh4O+gYbN10UVk6u7QntuzBiqzwZ/ODZ7ffVMtNEs6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e59SVWnxcLaU70fMJkCG/5WD0hETi1T/iEtp9m4jtl0fD0hcWhtPHyIcJD1XgCySxfWWTEEkCttkz/rPKS6sZmFo1Tq3AOdckvLHL1wkqVnrXxciBjaH1EentPq9B3Saf9S06IspInONFtDqm/WKhBNPuaM56j6NEb5X1rn4Rco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I3gEaRBN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751360601; x=1782896601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zh4O+gYbN10UVk6u7QntuzBiqzwZ/ODZ7ffVMtNEs6g=;
  b=I3gEaRBNH43R+5zIFkmdz8lYqucOGivBI73juGwqLI7WDO1+SsUNJ7gj
   4KiUjQoN3MvicqEOLeRLMiyjF7QdBRcLlzNOTrmmc0qtAMqlvzvk1Qbbk
   G6RGXUrqf9yyNjk0pPSSqfw6Sud4pXpi8ppd0oP+iVVwCpwE9m65uWNGM
   TeLXvHu2kpOXjLJWiFPHShIAM6Emxvs4RgcJ8p6zz33uf4FccQfVG20A0
   QcTZ3TEY/8V0kVPAdBIoJoPHPNyz4/N68YbRMjfQxxwy7PzyMlED4Ce/C
   Eji4y0JL+LwdSrpzFhO96oXFif3fM54b/m91P2qpny18Uo70UED8DtqHC
   g==;
X-CSE-ConnectionGUID: bFd23fhPR8Sow6WSRSxJLg==
X-CSE-MsgGUID: Es3SsnDbQCuHD/JGXgvi2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="57390288"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="57390288"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 02:03:09 -0700
X-CSE-ConnectionGUID: 9K6TwHKnTWeiAhWQE5cZJA==
X-CSE-MsgGUID: uD968DTbQZemlbLTq6h6BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153486233"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa009.jf.intel.com with SMTP; 01 Jul 2025 02:03:07 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 01 Jul 2025 12:03:05 +0300
Date: Tue, 1 Jul 2025 12:03:05 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Pooja Katiyar <pooja.katiyar@intel.com>, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 1/3] usb: typec: ucsi: Add support for message out
 data structure
Message-ID: <aGOkSVHxEGeAXFFV@kuha.fi.intel.com>
References: <cover.1751042810.git.pooja.katiyar@intel.com>
 <cc0b7701c4ea3d1001fefeb3df65caeb3e624722.1751042810.git.pooja.katiyar@intel.com>
 <da49edc4-4aa9-462f-94d4-a2f2c920619a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da49edc4-4aa9-462f-94d4-a2f2c920619a@oss.qualcomm.com>

Hi Dmitry,

Please check the comment from Greg. I think we need to revert
back to the original. Please let us know if you still disagree.

But I tend to agree with Greg. There are too many parameters for the
functions like this. Let's just supply a separate function that can be
used to fill the message_out like Pooja originally suggested.

> > diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
> > index 6b92f296e985..c0426bb1e81b 100644
> > --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> > @@ -86,6 +86,21 @@ static int ucsi_acpi_read_message_in(struct ucsi *ucsi, void *val, size_t val_le
> >   	return 0;
> >   }
> > +static int ucsi_acpi_write_message_out(struct ucsi *ucsi, void *data, size_t data_len)
> > +{
> > +	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
> > +
> > +	if (!data || !data_len)
> > +		return -EINVAL;
> > +
> > +	if (ucsi->version <= UCSI_VERSION_1_2)
> > +		memcpy(ua->base + UCSI_MESSAGE_OUT, data, data_len);
> > +	else
> > +		memcpy(ua->base + UCSIv2_MESSAGE_OUT, data, data_len);
> > +
> > +	return ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_WRITE);
> 
> Why do we need extra WRITE? Isn't the one performed by
> ucsi_acpi_async_control() not enough?

This is actually a good point!

Syncing the mailbox before there is a command will confuse at least
some of the EC firmwares. But more importantly, the previous command
may still be in the control field, no? So that write may actually
cause the previous command to be executed again.

So Pooja, please drop that write.

thanks,

-- 
heikki

