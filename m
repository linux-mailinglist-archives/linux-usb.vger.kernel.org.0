Return-Path: <linux-usb+bounces-17296-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A35C39C007F
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 09:55:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3714DB212EE
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 08:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05FD1DE885;
	Thu,  7 Nov 2024 08:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e7ItgAeR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2FE1DE4F8
	for <linux-usb@vger.kernel.org>; Thu,  7 Nov 2024 08:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730969707; cv=none; b=f0gTMtjuOxKoOzPLGchChJtGxCOHCfSCvLhZu4aOCeqNdW8bA8FbHCpzMy1UyUklCoQucg26UUigUwYE5v9nfLpucay7x+ziry0oYJ68Jr70CphT4p9H9Uq1gqfJitsfeNBbcsIu8DsMn8JbY/wIudhf5Nnwx5H5KzkSWTwA3g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730969707; c=relaxed/simple;
	bh=LBCUcEtRk003Xck+QxwPbgoAOnKAWb7dvTW+vcwEW6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s3smv/Uw7f3Ect2FE18wh0FsVhH+YCpNeMbDuhGtySHM4LX1hqB4z8Rc2Vd7+DIaKqb2bn218vSBhYd6AK7dbYp+ywN02OC8n6i1dQ2rPMvcxOfcHg63v0+chQ/HdKwHE+CFB2FUjrIBHFk0vZDSaR4yzLsYdZ1zkPwfayUyJRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e7ItgAeR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730969706; x=1762505706;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LBCUcEtRk003Xck+QxwPbgoAOnKAWb7dvTW+vcwEW6Y=;
  b=e7ItgAeRJG/+8MLz/+SCNPsEKMx/C03Nt1ZkVR0gcdjeMMseiDC0ZCIm
   pu2B6OFZ/1kr6I8x+bDHSb3+cSiiyfusyo567EKyKQKUeH2IbU77TOYYw
   2WQMycvZRDcmV/lefEyAbI1SF4nyfBX9M7eNxODR0Sn4knl3u9XEB2H4T
   DwAWPeC42mjXOXGWBqW2VmOqL+qkjITMKHioPULkR9idBoKEpTCb7yMb0
   VnAwXoLuT3CV+4nNQJ5a6cwX99LQ5czrjX9/MHudSzxpFKC7GLXjjjZFt
   qid4MLjpdMKqUG78yRowLDrlYzDG4UbHdflIb7f1EcIQP59nIDgvn0PF0
   g==;
X-CSE-ConnectionGUID: MHkNo2QzQruHkL2Cb+Bykg==
X-CSE-MsgGUID: x9qLFGYoSDmHPB1j8ZzbHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30760414"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30760414"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 00:55:05 -0800
X-CSE-ConnectionGUID: 8D1/8QD7SIKlqdss3eE0IQ==
X-CSE-MsgGUID: 88jjnW1iQVepsQ149MjLrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="122496781"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.83.36])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 00:55:04 -0800
Date: Thu, 7 Nov 2024 09:55:01 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Wentong Wu <wentong.wu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v3 1/3] usb: misc: ljca: move usb_autopm_put_interface()
 after wait for response
Message-ID: <ZyyAZaUNJ0kCEHG7@linux.intel.com>
References: <20241107073718.405208-1-stanislaw.gruszka@linux.intel.com>
 <2024110743-dragonish-jokingly-8459@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024110743-dragonish-jokingly-8459@gregkh>

On Thu, Nov 07, 2024 at 09:16:01AM +0100, Greg KH wrote:
> On Thu, Nov 07, 2024 at 08:37:16AM +0100, Stanislaw Gruszka wrote:
> > Do not mark interface as ready to suspend when we are still waiting
> > for response messages from the device.
> > 
> > Fixes: acd6199f195d ("usb: Add support for Intel LJCA device")
> > Cc: stable@vger.kernel.org
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > Tested-by: Hans de Goede <hdegoede@redhat.com> # ThinkPad X1 Yoga Gen 8, ov2740
> > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > ---
> > v2: fix handing error of usb_autopm_get_interface(),
> >     add R-b, T-b tags from Hans
> > v3: add A-b tag from Sakari
> > 
> >  drivers/usb/misc/usb-ljca.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> For some reason you aren't sending this to the usb maintainer to be
> applied, oh well...

Sorry, I thought sending patches to the mailing list is sufficient
to get them applied. 

Regards
Stanislaw

