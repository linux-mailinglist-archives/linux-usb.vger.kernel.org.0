Return-Path: <linux-usb+bounces-11613-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EDB915DE6
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 07:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EA4D2841A4
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 05:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF87144D21;
	Tue, 25 Jun 2024 05:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uw9pKTRK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C002748F
	for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 05:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719291761; cv=none; b=BwUOi2OHtc2DfVEs7Jf34ifR8zuN3IacDoowoqMPSvp0Tgd8zdTzftGXa6SZvdnQKCXogi0zkmMqhA6bb/FLII9Crn9COrk5WH9RAQ+WF0GX81VG2Mb2hZnLQQ9eBGS/G9Uqr0T5wTWmAxkTeQdKOhaOtllKoqDAZDmbsDkhjsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719291761; c=relaxed/simple;
	bh=+IxUrvH+Op9vQP5j6DXwCao85pSfAlWAehBTCQ1W+p4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ojV6M76OUPd04mp3yNb+Eyjf78wWST3IGiD83FEeSxp+vbYZudcabaA6UGPE4DLtCv7B+k6RO9CqVEgEwxpgn1b3TBbQJPB4EPg8h1NNuGlk7PIhQ/skZR00Uw9TKUg+GfQaGpsfcXnLq2Memui0s8dLHHZUInbL6ZXDlTQN7b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uw9pKTRK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719291760; x=1750827760;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+IxUrvH+Op9vQP5j6DXwCao85pSfAlWAehBTCQ1W+p4=;
  b=Uw9pKTRKNvzAJ7C/ILEiqoPhTJu63a2XSuI/e1Xy+pAXP4pvG2LeL4fs
   8oJAq7rhKsh5UmZ4kqQR4Z7HbjEvtXthLGwxZTgiB5JzyDDMdmE/PBaR8
   pgElqD5a7ZS4cxud6EaUI5hN64Owu0J84u2j8YQykDkNEdoh6omhqhAxp
   QD7tu4KhG4vmHRzbh8Foxcr6eUxjbiHmhI76Gyq4sJQ6PvKMeQ/obNaTk
   UmqgnSemZQIEeCM1tH1bDFZkxGqb2f55Qj596HYzpTSZiHkEIkQrYdBfO
   rlm/+YNj7xdA51vvu6sBbzzq6SBWm1V9c17zzeFFMELK99XswqM1+0RkF
   g==;
X-CSE-ConnectionGUID: 6qZuCnY8Quait7a1gv+IEg==
X-CSE-MsgGUID: qWnu2EzsQGKIKAvx9dq+ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16045352"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="16045352"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 22:02:38 -0700
X-CSE-ConnectionGUID: WHYAMdh7S6mVfM65ZiWT7g==
X-CSE-MsgGUID: 2mSC3EFuQPe0cyl/d1UA8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="44217357"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 24 Jun 2024 22:02:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 8FED1170; Tue, 25 Jun 2024 08:02:35 +0300 (EEST)
Date: Tue, 25 Jun 2024 08:02:35 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH 0/4] Add device links between tunneled USB3 devices and
 USB4 Host
Message-ID: <20240625050235.GS1532424@black.fi.intel.com>
References: <20240619130305.2617784-1-mathias.nyman@linux.intel.com>
 <20240620064115.GH1532424@black.fi.intel.com>
 <9ec62b68-7eef-4d33-bc47-1d13e8eec820@amd.com>
 <20240621061905.GI1532424@black.fi.intel.com>
 <844e3930-7b3d-46a1-ad90-bcecbb99c069@amd.com>
 <20240624045912.GJ1532424@black.fi.intel.com>
 <78a4acf4-4701-4d1c-8547-c8809761a452@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <78a4acf4-4701-4d1c-8547-c8809761a452@amd.com>

On Mon, Jun 24, 2024 at 01:41:09PM -0500, Mario Limonciello wrote:
> > > 
> > > So I think the problem is you will have an ordering dependency between the
> > > two drivers for when the link gets created.
> > > 
> > > Like if thunderbolt.ko loads you would end up with links to PCIe root port
> > > for tunneling as well as XHCI controller.
> > 
> > With this patch we only create links to PCIe Root/Downstream ports from
> > Thunderbolt side and the USB core will deal with the USB ones.
> > 
> > > Then xhci loads and you end up also adding links to individual ports.
> > > Would you remove the link to the controller?
> > 
> > See above.
> > 
> > > And if the order is the other way around you end up with a larger state
> > > machine.
> > > 
> > > How about PCIe core provides a helper to know whether or not a PCIe device
> > > will support the proprietary register?
> > 
> > I think the xHCI can be non-PCIe device too (Apple silicon for
> > instance). The links here are created dynamically and only if there is
> > need (and support from the hardware) so we can let the USB4 controller
> > enter D3hot if there is no USB 3.x tunnel needed.
> 
> When I replied I was under the presumption that the next version the link
> creation code for XHCI controller would stay in thunderbolt.ko and the XHCI
> port would be in xhci.ko.  But if you move both non-Intel and Intel cases to
> xhci.ko this should be totally fine.  If you can CC me on the next version
> of the series I'll get that tested for AMD case.

Sure, we will.

