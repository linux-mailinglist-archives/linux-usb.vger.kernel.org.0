Return-Path: <linux-usb+bounces-23155-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B78A908BF
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 18:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAC535A090F
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 16:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133112080D2;
	Wed, 16 Apr 2025 16:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DVumFY59"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6BC20E31C
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 16:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744820605; cv=none; b=DkXBnHS0Dv8E122zuKWRNqn6/k557Q97cv258+UIDxlWiYDqAJzNfqkIx6FA6FK4IA5v2p+IY+5r5Org4TAcgSbBQeg4bnrXZQj0HpoJNz+C4dJ7G15Rct/Kdm/tAB4DxXHu8S9eLQc9zHyXBmimfG2E4kTYTTGAXSZO7lVIEGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744820605; c=relaxed/simple;
	bh=83KYxMGN9KZ0u7942fiBr1KlePlKhRl4prm1p4oN5p8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lWBAGb/fzRjJ+eTChVnKDaMXBD+q8aia+4T0KNGJj5wL8I64oowVw6mPxNnSDuIgvDwn+azgKSqAjI6xjBAWjY7C4+NWExyzuowLrJ61VjT+fU1YyDvVFQdgeDvUfz4GFBrJFQAyWGJMXLFqAybvrwA28mEIzb06z2vbRhFSnPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DVumFY59; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744820604; x=1776356604;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=83KYxMGN9KZ0u7942fiBr1KlePlKhRl4prm1p4oN5p8=;
  b=DVumFY59V0DvY008uyKL4Yp7T/bNRXxYUVQQXOA/8eyQyf8zP0rsG2sl
   l2fNXzMQ5JXvcozzf+1bzr1TSMJwQ75DYpK6Bv1ahIMALDMOGy7glcI97
   Qb/R32QYjCpEtObJ8WZYU2RUI2DIRvUEnh1rUcFCGEC1oqGXhN5lu+Kbj
   s9ch1flqm3W72XtE9LxftiuOgJgnBPLQpOpd4TVPWHYl5lC8XTb63GxmV
   9L3x9ov1PTBfErzN8f9e+XZpVqKvfqFMMFXMzfeIneGsCeZR/9NC6rml3
   QtIwUk7ZES+d6wPEB2JGRugv8BtLtUNvev1tYeLL5HodKwE+9jrhbPxQp
   w==;
X-CSE-ConnectionGUID: jT/aNpfJSfy8zs1SqtFvfg==
X-CSE-MsgGUID: cEYLbKvLSJO2Cr79rewMbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46263012"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="46263012"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 09:23:23 -0700
X-CSE-ConnectionGUID: LZZ5S5HUSI2rKGouH3P6yw==
X-CSE-MsgGUID: ijrwIgXjR2OjIypqeH+Lrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="130498690"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 16 Apr 2025 09:23:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 9C1AF1038; Wed, 16 Apr 2025 19:23:19 +0300 (EEST)
Date: Wed, 16 Apr 2025 19:23:19 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: mario.limonciello@amd.com, andreas.noever@gmail.com,
	michael.jamet@intel.com, westeri@kernel.org, YehezkelShB@gmail.com,
	rajat.khandelwal@intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Fix a logic error in wake on connect
Message-ID: <20250416162319.GA88033@black.fi.intel.com>
References: <20250411151446.4121877-1-superm1@kernel.org>
 <20250416123743.GH3152277@black.fi.intel.com>
 <962f6730-c61a-4d26-98cf-5051782da3e8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <962f6730-c61a-4d26-98cf-5051782da3e8@kernel.org>

On Wed, Apr 16, 2025 at 08:27:10AM -0500, Mario Limonciello wrote:
> On 4/16/2025 7:37 AM, Mika Westerberg wrote:
> > On Fri, Apr 11, 2025 at 10:14:44AM -0500, Mario Limonciello wrote:
> > > From: Mario Limonciello <mario.limonciello@amd.com>
> > > 
> > > commit a5cfc9d65879c ("thunderbolt: Add wake on connect/disconnect
> > > on USB4 ports") introduced a sysfs file to control wake up policy
> > > for a given USB4 port that defaulted to disabled.
> > > 
> > > However when testing commit 4bfeea6ec1c02 ("thunderbolt: Use wake
> > > on connect and disconnect over suspend") I found that it was working
> > > even without making changes to the power/wakeup file (which defaults
> > > to disabled). This is because of a logic error doing a bitwise or
> > > of the wake-on-connect flag with device_may_wakeup() which should
> > > have been a logical AND.
> > > 
> > > Adjust the logic so that policy is only applied when wakeup is
> > > actually enabled.
> > > 
> > > Fixes: a5cfc9d65879c ("thunderbolt: Add wake on connect/disconnect on USB4 ports")
> > > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > 
> > I guess the offending commit was never even tested :(
> > 
> 
> Yeah that is my only explanation too.  So now this begs the question do we
> do the 3rd step that we set all the ports to 'enabled' by default?

No we don't. That needs the userspace that can do dark resume and we cannot
assume it by default.

