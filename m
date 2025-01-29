Return-Path: <linux-usb+bounces-19846-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F86A21CEB
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2025 13:05:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F3A6166F83
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2025 12:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 003D11B87FD;
	Wed, 29 Jan 2025 12:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nsX07QRM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3CB16EB4C;
	Wed, 29 Jan 2025 12:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738152296; cv=none; b=ne6Uxw/teqKB1FyOZv1e8dzsTqGp8DG15KWl9L6GzyL9YmdwD1Wg6UoNwhFf1UiSCHfdqPl72DMVtITibD5egHknajNWHwybyUOgfLtcJxxuuMCQJJ5fayJ5oVeRMmemBhrm2ycy9QVgs6Z5fZBJ40bY09HxKlwEohHJrhtTwp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738152296; c=relaxed/simple;
	bh=3PWqHNcbpOX8KQgttOS8Aue2cg6u7/DPVe9+Qr5liAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k44jif9VfdL6J8znzr+BTyzL9yvLo5K820J4UXuMaTC0EeqTXO8TISmX8e3FrnCnMXgUFB3nqbpB+tE/jJIUFg3SUsnvXVi87EE8wYJzliEZk7h89crwFSzil4O1MIs0dcaz9nmeX0vSnC9O03oL7drYHEL51G6hgkxkJDnYaxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nsX07QRM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738152295; x=1769688295;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3PWqHNcbpOX8KQgttOS8Aue2cg6u7/DPVe9+Qr5liAs=;
  b=nsX07QRMdr/+vpCnhQkT3ykyewjKqlsD57ppISW6oAJdPz4ituZzYkNs
   6qgF1drGX+vJCAyKTppxHwaQeLkdV4h+jthlorIW8zv3P4M/+8FQznm74
   A2cC3nRiPK3RxO/5kcQmDsr+Gg76M2U9lUPC4ygydmgeC2yWU0ufzNZG5
   gblot48UuYDt0uoLGLkoepaTHWmT1+h4bT2y4/vsfrLIfBo61S8mEVM6g
   fIH4xoBdIfGlVIesvAzHQjjDColMwxeHbW+Znv26/yzgII9VX2W8e8Lpe
   qSYKhL/z7dx+8f/eYj38qdJ9wPt4wmhiKS+gsXqwfidPGM/6e1aDmAvDY
   w==;
X-CSE-ConnectionGUID: HKpRunisSiyddGK1anBFeA==
X-CSE-MsgGUID: dhQI1mE0TnSEtz5sjWQTEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38828556"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="38828556"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 04:04:54 -0800
X-CSE-ConnectionGUID: QpK9LTg7RgqgRXWV+ZBAXw==
X-CSE-MsgGUID: Yo7pukXDRJ20iiAqEkfnFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113632438"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 29 Jan 2025 04:04:52 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id D25DB2A7; Wed, 29 Jan 2025 14:04:50 +0200 (EET)
Date: Wed, 29 Jan 2025 14:04:50 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com,
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Disable Gen 4 Recovery on Asymmetric
 Transitions
Message-ID: <20250129120450.GV3713119@black.fi.intel.com>
References: <20250128163605.19222-1-rahimi.mhmmd@gmail.com>
 <20250129063148.GT3713119@black.fi.intel.com>
 <tycnnkwktd4iryegey2xysib3przadada5o7xuqrt5qfxqdtdc@22gg5ssed6sc>
 <20250129114804.GU3713119@black.fi.intel.com>
 <hx3zlixeshc4cghfthcbo33nlstst7mxxnqpdl5pj653pvk4it@s4cyqkbkwug2>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hx3zlixeshc4cghfthcbo33nlstst7mxxnqpdl5pj653pvk4it@s4cyqkbkwug2>

On Wed, Jan 29, 2025 at 11:41:58AM +0000, Mohammad Rahimi wrote:
> > > I should have mentioned this in my first email, unfortunately,
> > > I don’t have access to any Gen 4 hosts or devices for testing.
> > 
> > I think this needs to get some testing on real hardware. I have here some
> > so I can try the next version.
> 
> Great! Could you let me know what you are using for testing?

I have Intel reference USB4 v2 host and device (Barlow Ridge) that I use.

