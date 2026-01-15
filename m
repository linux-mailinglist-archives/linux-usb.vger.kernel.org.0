Return-Path: <linux-usb+bounces-32385-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDA0D23A8E
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 10:44:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2FEF330986C8
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 09:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA14235F8C9;
	Thu, 15 Jan 2026 09:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ELgM4b4A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8025C35F8BA;
	Thu, 15 Jan 2026 09:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768469286; cv=none; b=ijYQ6Lg+ZZAU5XzQlWQgkowuMH/AbybFUATHrPqd5RtsRWjtUuIrfhWT1CoQCMxixTipNXFnuOcYe+HtoNGpuN2A/mvo7R2Dh/OG1aF+s8xGAh2kwFAQksCyPCItpVSu2Ul56vISU0fbUxO7F/7zJLkFoOTjBc67Lspes64CdZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768469286; c=relaxed/simple;
	bh=lWjE+TmQ0HE8KCLXZK7I/w0i0HDpD/5vrwGx7aJ2ea8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTcAtQDbXYOgnRBDSufSd4EiIU4QlrKpe3Bxbs67Tto2dSA+3ol6AUyFqUGgMocI6ZOksinytzDC2ulSXpgvXgHBac6wqlpP00cL8PKA98jor2AFPuML/4GjZu+T/dv306di20yuQwjyReQc7Hav8r/ZavPvttfSH71Qv4N1s5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ELgM4b4A; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768469284; x=1800005284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lWjE+TmQ0HE8KCLXZK7I/w0i0HDpD/5vrwGx7aJ2ea8=;
  b=ELgM4b4AobjX7rnLipaBsKQWy+ncth9mEG2cSb4JXh7mjeqtgA2UDSq4
   40RjgjU/XtVxKxD6l/i/uZOoq4Crxg2VwI0XS8EYZltqvEefYWcECjxGr
   r0272sgPVpQQyrDS1op+umxs+iGQojyUo45t27nnMCrQb0uG6watwQhn3
   U1OV91iW47esUAVdi1YNAHzi9D7mN1RPnWFQl87ppEJHe08IhFmHZb+Jk
   WWVj6HJm7VOLKdE/MyZYZHVHavU18xWXFdD6rjm45YI2rngG5Lj7Al2/z
   US2o+GxPLQF7WZEfCCdu2f1HVL5v8k8jCx8zw+f78/htAy/yOJ+sPv5W0
   Q==;
X-CSE-ConnectionGUID: lRpuaaxzRYiVOEst6f0GOw==
X-CSE-MsgGUID: 0uqAoMvxR4eqcBYOLTNU7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69830384"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="69830384"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 01:28:03 -0800
X-CSE-ConnectionGUID: 8FBC41lOSNCoYm6NMZyLbw==
X-CSE-MsgGUID: s8rdMa6cRaKcDyeTv8cIBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="236162758"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO kuha) ([10.124.220.227])
  by fmviesa001.fm.intel.com with SMTP; 15 Jan 2026 01:28:00 -0800
Received: by kuha (sSMTP sendmail emulation); Thu, 15 Jan 2026 11:27:37 +0200
Date: Thu, 15 Jan 2026 11:27:37 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Salvatore Bonaccorso <carnil@debian.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, pdormeau@free.fr,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	1123987@bugs.debian.org
Subject: Re: UBSAN: array-index-out-of-bounds in
 [...]drivers/usb/typec/ucsi/ucsi.c:605:12: index 2 is out of range for type
 'ucsi_altmode [2]'
Message-ID: <aWizCe9um6ZrKfbT@kuha>
References: <176840984804.2144647.10736984532804520381@eldamar.lan>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176840984804.2144647.10736984532804520381@eldamar.lan>

Hi,

Wed, Jan 14, 2026 at 05:58:54PM +0100, Salvatore Bonaccorso kirjoitti:
> Control: forwarded -1 https://lore.kernel.org/lkml/176840984804.2144647.10736984532804520381@eldamar.lan
> Hi
> 
> Pascal reported in Debian in https://bugs.debian.org/1123987 a problem
> catched by UBSAN in drivers/usb/typec/ucsi/ucsi.c:
> 
> [  +1,022859] ------------[ cut here ]------------
> [  +0,000008] UBSAN: array-index-out-of-bounds in /build/reproducible-path/linux-6.17.13/drivers/usb/typec/ucsi/ucsi.c:605:12
> [  +0,001186] index 2 is out of range for type 'ucsi_altmode [2]'
> [  +0,000578] CPU: 10 UID: 0 PID: 275 Comm: kworker/10:1 Not tainted 6.17.13+deb14-amd64 #1 PREEMPT(lazy)  Debian 6.17.13-1
> [  +0,000005] Hardware name: LENOVO 83J3/LNVNB161216, BIOS PYCN30WW 11/17/2025

This is a firmware bug. The interface on this system is returning more
than the maximum of 12 bytes to the UCSI command GET_ALTERNATE_MODES.
You guys need to be reporte this to Lenovo.

I should point out that the driver in Linux requests only a single
alternate mode with the GET_ALTERNATE_MODE command by leaving the
"Number of Alternate Modes" to 0 (the actual number of alternate modes
is the value of that field plus 1 - Table 6-24: GET_ALTERNATE_MODES
Command in UCSI specification). That means the interface should only
return 6 bytes (that's the size of a single alt mode description in
UCSI).

Br,

-- 
heikki

