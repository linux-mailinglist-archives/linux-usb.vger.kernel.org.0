Return-Path: <linux-usb+bounces-26905-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACF6B27DF2
	for <lists+linux-usb@lfdr.de>; Fri, 15 Aug 2025 12:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8003C1BC710C
	for <lists+linux-usb@lfdr.de>; Fri, 15 Aug 2025 10:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA332FE07A;
	Fri, 15 Aug 2025 10:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GCLPkC57"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF692FD7AF
	for <linux-usb@vger.kernel.org>; Fri, 15 Aug 2025 10:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755252379; cv=none; b=iFn5S3d4ekbsJ3P5Og6DRxodS7iSRrWnAUE2BZ0GgkeaH4V3Fn8yEvetfN+F0p7XqlYoStdMFkgkvGAc7cPR6YH7Xlp4SgqcydeHOY6cuGC65j0eH8ntjvDKSTJvB/bhhaQdkFghr1m+GrdqRcmX2VD+PY9d5tD2MZT/JKusZB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755252379; c=relaxed/simple;
	bh=ppzpO+Uceda6ngV+hzq9dNSVDT4+ZTextc+UKiymXO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxJdb5O0bqBCT3Of3QFtWSH1uMcjadI+Gigo2jEU4E7aHrjRlQgh1WdwAhCSKvUwn6ttxb8dsYoZOJochaUVfIXVeofvAt23T7/BP9HSJUg2pqyvkr9fq7K+TMG/eez/78A8zRpLUzOKHAF6IcWwlIJP0wK1omCnxEV4nOnBaTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GCLPkC57; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755252379; x=1786788379;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ppzpO+Uceda6ngV+hzq9dNSVDT4+ZTextc+UKiymXO4=;
  b=GCLPkC57DTQw3WmWaqruKKuWZuG+YuY1hBqxBZKLN4LU5yl8LRB0wp/M
   m7RMcQk2XnoxW2+737fEG+DGH6gZHdHzf2KLPy2ecaM9aJ/3TUGcT9/YY
   zPT3beaORT9ItYckES/Q+L79TuNfEb6eHxfjNcLMJfGcxbaei5TxJ/Nug
   1kMOD9v6O8/9VQp/XWPuv6OWrQ40n6P6wC42Jgt2j3ylJWm4tlJVEARxQ
   qk8oyB5e+5E3i5t/eDTNq8ijeX+lXTggpA4H/huCgiKu0ykqgc/M1VPDi
   MavDUhj+JertsBIunE1mjnhjwyHGx8M60fdT00YBOGzgCMJbrFamSe3Qc
   A==;
X-CSE-ConnectionGUID: vZyHs9LKSVC/bbW4eOa5EA==
X-CSE-MsgGUID: 1u2Uly4JTEeo8s+HXVTlSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68661725"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="68661725"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 03:06:18 -0700
X-CSE-ConnectionGUID: EtIao2rEQBCObp/FCxOG2Q==
X-CSE-MsgGUID: Rhv/6iPjRo+OtWecYxTkMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="204164656"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 03:06:17 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E1B3B11FA65;
	Fri, 15 Aug 2025 13:06:13 +0300 (EEST)
Date: Fri, 15 Aug 2025 10:06:13 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>,
	Oliver Neukum <oneukum@suse.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 1/1] USB: Check no positive return values from
 pm_runtime_resume_and_get()
Message-ID: <aJ8GlTon-wfFzsry@kekkonen.localdomain>
References: <20250811062403.2116464-1-sakari.ailus@linux.intel.com>
 <2025081330-droplet-napping-6843@gregkh>
 <aJ7_CMzCVwPEMSOj@kekkonen.localdomain>
 <2025081502-opacity-rewire-447b@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025081502-opacity-rewire-447b@gregkh>

On Fri, Aug 15, 2025 at 11:38:28AM +0200, Greg Kroah-Hartman wrote:
> On Fri, Aug 15, 2025 at 09:34:00AM +0000, Sakari Ailus wrote:
> > Hi Greg,
> > 
> > On Wed, Aug 13, 2025 at 04:43:05PM +0200, Greg Kroah-Hartman wrote:
> > > On Mon, Aug 11, 2025 at 09:24:03AM +0300, Sakari Ailus wrote:
> > > > pm_runtime_resume_and_get() always returns a negative error code or zero;
> > > > there's no need to check for positive values such as returned by
> > > > pm_runtime_get_sync(). Simply drop the check.
> > > > 
> > > > Fixes: 7626c52b6b46 ("usb: usb_autopm_get_interface use modern helper")
> > > > Cc: stable@vger.kernel.org
> > > 
> > > If there is no need for this check, why does this need to be backported
> > > to stable kernels?
> > 
> > It's not necessary IMO.
> > 
> > The practice lately has been to add Cc: stable if the Fixes: tag is there.
> 
> If it actually fixes a bug.
> 
> > But there was no actual bug in this case, just that this change ideally
> > would have been part of the original patch.
> 
> Then it's not really a "fix" so that tag does not need to be there
> either :)

I agree, both should be removed. Can you drop them or should I send v2?

-- 
Sakari Ailus

