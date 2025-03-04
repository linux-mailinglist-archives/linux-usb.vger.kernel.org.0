Return-Path: <linux-usb+bounces-21339-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 478F1A4DFBB
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 14:52:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13F857ABDAC
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 13:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510242046AD;
	Tue,  4 Mar 2025 13:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyuefeOr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3082868B
	for <linux-usb@vger.kernel.org>; Tue,  4 Mar 2025 13:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741096312; cv=none; b=gilD7epWJJQVETAg4nhcuXRSAa2HrNfXJY2aWVdEAU4OnhEswzthm8vW0PFd8J99Be+q5D8gAEMCToJwigrMs2GMp9/nqWyk/sRfdKeTnT4i/CvloEn1khZmkrGSFJYeztJDET4hA5dYAWl6i6O+CNP4CYUkVKGGYACaTXoqZss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741096312; c=relaxed/simple;
	bh=s925eKS8tZshzhJmPwOQ6qWR7gxnFUlWhpCUEoZU0A8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OH+WOJFsVpxrYOSH+eB0PStDhbgUIDvzBRkA47D8mNe+Lsq+9OMA+FjZl3FSBdKLzUeYoIC/OYwGGsm1aQG5J2Z9B8IbGaTnruVhp3M+2yzvBuyirt8oYXS1vPEHfEUhNqdPP5dxoRhKllrIxG3nzXbSepsZtAJf4BS7wQrYhNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cyuefeOr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741096311; x=1772632311;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s925eKS8tZshzhJmPwOQ6qWR7gxnFUlWhpCUEoZU0A8=;
  b=cyuefeOreuUsqcmh8a/QLisS3WF1s+6jAKhyT1xIKJf2X1bN2/LBUEXs
   Mg+UnJY3mBt6YZA1Ws6IG8pk+lecGTw7N8j7Lw53jy4DT6wv5EyaUHigV
   g9RGFFsVv0jFVaYtbbEJtpaq50RMdD3aatPckUikMa5jjtm9JM2RpG/Ej
   iQa6S5akzOIXki53ezkOoqWcEJt+crGvAI6lylfB2ByFFb7otTxyzD7/a
   MEujwJsRWe2rJ79SAxwv3Om4YwMf5LbNG13XFy3ChfpercY7dYHAZ3rnO
   ba6pykIkVb9qHLPtN89d5Y2hgdp2OCgnTLe6Jj1UVGed1+P10I0Gnoism
   Q==;
X-CSE-ConnectionGUID: nX+DTPWHS9yOJf3RBmqP5Q==
X-CSE-MsgGUID: pOxU2EbQTBG3SQ8QclZD7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59563273"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="59563273"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 05:51:51 -0800
X-CSE-ConnectionGUID: F/jzQ0U4RMaa98V+PLSP5w==
X-CSE-MsgGUID: CJA5h61MRgm0VntLYnvtvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118898919"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 04 Mar 2025 05:51:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 8F70F2EF; Tue, 04 Mar 2025 15:51:48 +0200 (EET)
Date: Tue, 4 Mar 2025 15:51:48 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kenneth Crudup <kenny@panix.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: So, I had to revert d6d458d42e1 ("Handle DisplayPort tunnel
 activation asynchronously") too, to stop my resume crashes
Message-ID: <20250304135148.GM3713119@black.fi.intel.com>
References: <567725a5-f984-4ea1-bd38-8815825c1211@panix.com>
 <20250303142058.GA3713119@black.fi.intel.com>
 <402bcee8-030a-45bf-834b-ea4baf5eed3c@panix.com>
 <20250303175818.GB3713119@black.fi.intel.com>
 <007b005f-a6d1-44a2-9795-036c8f397274@panix.com>
 <48ef4c14-55d5-4baa-b862-f9e7368ed950@panix.com>
 <20250304082731.GF3713119@black.fi.intel.com>
 <14351945-fcde-4088-b7b3-542c6e4b7d0e@panix.com>
 <20250304134017.GL3713119@black.fi.intel.com>
 <7c5ec580-9b1c-40b7-9a8d-64bc95c41432@panix.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7c5ec580-9b1c-40b7-9a8d-64bc95c41432@panix.com>

On Tue, Mar 04, 2025 at 05:48:12AM -0800, Kenneth Crudup wrote:
> 
> 
> On 3/4/25 05:40, Mika Westerberg wrote:
> 
> > On Tue, Mar 04, 2025 at 04:52:19AM -0800, Kenneth Crudup wrote:
> 
> > > But I have been doing a fair amount of testing of the kernel with your patch
> > > and Lucas' NVMe adaptor (etc.) patch and am concerned that you're still
> > > seeing his issue, as it (at least as of now) hasn't occurred here since
> > > applying it.
> 
> > It only happens if you have TBT dock and the NVMe connected and you
> > disconnect them while the system is suspended. I suggest trying that a
> > couple times and see if that happens. For me it
> > happened pretty much on first suspend cycle.
> 
> That's exactly the failure mode I was testing for, though ... I've run a few
> iterations with the fix (and about to do one more as I'm about to head to a
> clients' office) and so far, so good.
> 
> Is your patch from yesterday applied as well? It is here.

Yes it is.

I don't have display tunneled though, only PCIe (well and USB 3.x).

