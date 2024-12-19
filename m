Return-Path: <linux-usb+bounces-18684-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE1B9F81E1
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 18:32:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA7A6161EA4
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 17:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A475A19CD13;
	Thu, 19 Dec 2024 17:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k2SQfQT2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A357D19AD5C
	for <linux-usb@vger.kernel.org>; Thu, 19 Dec 2024 17:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734629395; cv=none; b=d545T/t6I/F4HmMCvEN2DtBxoJzRvqwX4ryyaRvGrpRzpLbkk+AFyZ+joJ25e7YBtoxIwjC3Gsz03KFpGpHa9kp9TPoPWfhp/Hn5lzw/Ki+bk54UMv1qNijPowA2YXbqXuzyN6WWdqxKGE0lcDe/uFCMEGPvfV7theUd1U8l8z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734629395; c=relaxed/simple;
	bh=2R+srKn1py0I1RkZfdAjchPVCuA8e1u+h4iX3Valv00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OCqJ3Fr+lil603UWhWdd+L0giEzL0zvdF0wFe2XCPQ59tqk5XIg77BV1/KsKbjbyEusNVr0HkaA4EcM1U9fSePaPctqLZYwOsqs8Py7NLN/bzQlE1Gp2oyYhPqXZLDsyW0hnv/whRKD6WDYtIDNFSVxB7k2BD8EVkqcJfZgOfoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k2SQfQT2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734629393; x=1766165393;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2R+srKn1py0I1RkZfdAjchPVCuA8e1u+h4iX3Valv00=;
  b=k2SQfQT2cfO8dXW2QmM+hkE+zXWByRjGpSpQbLOmtnD/WV3tH/aSttYB
   5dEmFsCP91tWyowGVMRqXPAou3Ug2qV0f4B6F1m+hgE2rWTdeB5lr9hWf
   e6iggWt4XXp2X81pB8eMm1PVZNmwFtMmSr16JAk++aEcUtaEL943tl3bV
   X5sk8FZhiQBZbq7GW2HJnRimdhZCp8wNiy9xOb5dnD0fTkYOYAh76DNdg
   kZHrhvqs/94NH19fEFUh7f1kGjfUEuZflme4YVGXc8zlIyJKjFoKtpdLK
   K++UfD0J2rsY/xYYvCAe1pR1Q9BaewgDreuW7L6KQQdbmqV2SjEYKrBk1
   A==;
X-CSE-ConnectionGUID: o8BdrWpsTz6J6WVR1Yi92g==
X-CSE-MsgGUID: ievVsgbyTgiue0lcNg+Q9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35285114"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="35285114"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 09:29:53 -0800
X-CSE-ConnectionGUID: 8I+RUd6VTamPhievbdb/fQ==
X-CSE-MsgGUID: eyXJ9iYESriE8dr46fFrJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121527945"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 19 Dec 2024 09:29:51 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 69B05165; Thu, 19 Dec 2024 19:29:50 +0200 (EET)
Date: Thu, 19 Dec 2024 19:29:50 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH 12/12] thunderbolt: Handle DisplayPort tunnel activation
 asynchronously
Message-ID: <20241219172950.GI3713119@black.fi.intel.com>
References: <20241217082222.528602-1-mika.westerberg@linux.intel.com>
 <20241217082222.528602-13-mika.westerberg@linux.intel.com>
 <Z2RR_r_AjyluYNwW@wunner.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z2RR_r_AjyluYNwW@wunner.de>

On Thu, Dec 19, 2024 at 06:03:58PM +0100, Lukas Wunner wrote:
> On Tue, Dec 17, 2024 at 10:22:22AM +0200, Mika Westerberg wrote:
> > In typical cases there is always graphics driver loaded, and also all
> > the cables are connected but for instance in Intel graphics CI they only
> > load the graphics driver after the system is fully booted up. This
> > makes the driver to tear down the DisplayPort tunnel. To help this case
> > we allow passing bigger or indefinite timeout through a new module
> > parameter (dprx_timeout). To keep the driver bit more responsive during
> > that time we change the way DisplayPort tunnels get activated. We first
> > do the normal tunnel setup and then run the polling of DPRX capabilities
> > read completion in a separate worker. This also makes the driver to
> > accept bandwidth requests to already established DisplayPort tunnels
> > more responsive.
> 
> Does this mean one has to add that command line option unless i915
> is already loaded on boot (or built-in)?  I can easily see i915
> not being in the initrd for some reason but being loaded only
> after the root filesystem is mounted.  And that in turn may
> take a while if the user has to enter a password for disk encryption.
> If the user has to add a command line option in such cases I think
> that would be very inconvenient.

Typically no. We wait for the 12s now before tearing down the tunnel and
that should be enough for i915 to kick in and read the capabilities. At
least we did not see any problems during testing. But the command line
option is there as "escape hatch" if defaults don't work.

