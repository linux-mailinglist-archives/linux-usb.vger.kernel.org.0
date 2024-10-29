Return-Path: <linux-usb+bounces-16812-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B50DA9B41EA
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 06:50:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60F901F23506
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 05:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817D1201007;
	Tue, 29 Oct 2024 05:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IS9Krt3D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031671FBF7E
	for <linux-usb@vger.kernel.org>; Tue, 29 Oct 2024 05:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730181051; cv=none; b=O8nAnTWbCd+QxBp9zkF9XqgnESq7Hdgj+26wlU+HDmzAEF4ebiwyPZOBAheQqg8n9n/STnXBiLcmcmPNntk6wAMTCF8IZfmpGRgqXATwSwtLQone9v5BWz72oPDWDqKjZfMBpgkY/a0njBt1+nnYb625OWvqQyrj/mcmtw85IWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730181051; c=relaxed/simple;
	bh=NTiEe0P457euHXuIa/8nMbsYVN08W1UL6WBT0dInLoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+ubsoX8yADUwdOWpYDc67EspdHn+rxbw1nTuY3Y92BYWMrxObQW67V4eZ5WlqvPzhzSNqsKGp6ols97XS2iIfqvsEq6ASTuO8qtvsx2HhHuZOINj9KRNx9MnhwmPYmwwSGH0LyX4JZi9aRmG33aDI5VvtD//MRvpwNF/uVv6wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IS9Krt3D; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730181049; x=1761717049;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NTiEe0P457euHXuIa/8nMbsYVN08W1UL6WBT0dInLoo=;
  b=IS9Krt3DeBObjdKCTJb3qIXkP6dE9AfixT32duU1/th1COx3eU8BnY7e
   gIK85CGP7Bsp7v7cgE3DjITkj6UiWvQXz+MuNjbkXbScCYs6Rqv2U35XS
   OwmReumVPDQkRRkV8l6le7BvACjMzZFMnwMqJMJubGjQlMmuWnz3xTN6W
   wJiAGpt+qaHRsXET51IAzB3XNPZu4D0w9Rt7UUaGzVqMW5cXecgpbpVrG
   wlPtk7lp9CTWkIc10wBIh2OQ9U1+rzKuku8M9472o28GWTiwfA/WnJZeB
   kN9R4lx4j4GqVGHj2Mv5Q2lB771K9XhFq5+LyibEtsHNl/Rcam0H11iXb
   A==;
X-CSE-ConnectionGUID: a8XUQypbSY+LOUaXB2jkjw==
X-CSE-MsgGUID: w22ix2DCQlaX0cFZc8fCzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="33727736"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="33727736"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 22:50:48 -0700
X-CSE-ConnectionGUID: NSbynKFuRzC1VvfHfgS/rQ==
X-CSE-MsgGUID: fGO4YwZ0RtCzeVxq49grGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="112660720"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 28 Oct 2024 22:50:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 5DA9C26B; Tue, 29 Oct 2024 07:50:45 +0200 (EET)
Date: Tue, 29 Oct 2024 07:50:45 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH] thunderbolt: Add only on-board retimers when
 !CONFIG_USB4_DEBUGFS_MARGINING
Message-ID: <20241029055045.GQ275077@black.fi.intel.com>
References: <20241028105121.894978-1-mika.westerberg@linux.intel.com>
 <5iy6z4wdx52zca4whxeq7u2ub3rv3lbppvimlvy36hojj5f7rz@mm5mni4qzo76>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5iy6z4wdx52zca4whxeq7u2ub3rv3lbppvimlvy36hojj5f7rz@mm5mni4qzo76>

On Mon, Oct 28, 2024 at 07:12:51PM +0800, Chia-Lin Kao (AceLan) wrote:
> On Mon, Oct 28, 2024 at 12:51:21PM +0200, Mika Westerberg wrote:
> > Normally there is no need to enumerate retimers on the other side of the
> > cable. This is only needed in special cases where user wants to run
> > receiver lane margining against the downstream facing port of a retimer.
> > Furthermore this might confuse the userspace tools such as fwupd because
> > it cannot read the information it expects from these retimers.
> > 
> > Fix this by changing the retimer enumeration code to add only on-board
> > retimers when CONFIG_USB4_DEBUGFS_MARGINING is not enabled.
> > 
> > Reported-by: AceLan Kao <acelan.kao@canonical.com>
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219420
> > Cc: stable@vger.kernel.org
> > Fixes: ff6ab055e070 ("thunderbolt: Add receiver lane margining support for retimers")
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> > Hi AceLan,
> > 
> > I changed the patch slightly. I wonder if you could try it again?
> Yes, this revision also fixes the issue.
> Thanks.
> 
> Tested-by: AceLan Kao <acelan.kao@canonical.com>

Thanks for testing!

Applied to thunderbolt.git/fixes.

