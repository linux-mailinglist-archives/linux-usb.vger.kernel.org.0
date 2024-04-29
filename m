Return-Path: <linux-usb+bounces-9870-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 479358B5053
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 06:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F3AF1C219C9
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 04:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2AA5C2C8;
	Mon, 29 Apr 2024 04:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EkU5CNdR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFFC8BE2
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 04:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714366139; cv=none; b=EYjAazkW9j/BFbXRfad8UzI1tw1MbbC/l6rp2OZrL401ZHwNwOme10/nbi2F2t0gIw6QQ7DfLFVSj6XLp6VqiShfjBo2+jIcfykDQ1dZpcuW/sAyPqqk7Vm9WWmxGutPWEnQejaf6DF0kXkdXfZrRowiRjKTFFY4wY4YaGw8eXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714366139; c=relaxed/simple;
	bh=wsdd81o5ocBQzJNbQntk2WbkmhBLXC1yvj2R4H0upVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X1IndtU+ABUISc1fLycu+cBPip9Rr1xRSYUn3uFj3/8HZ3wCnu/uL3HDVcN8X3pm4NojDQwbkICDQp+5U1oAkQNloSPcGcy3XBHPt8Ayeb2V27crawD5J8sY01A/yZy3CaplAL4UhFkrWOQq7OUcX2o94qOMD/LRrSDWQHG3jp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EkU5CNdR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714366138; x=1745902138;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wsdd81o5ocBQzJNbQntk2WbkmhBLXC1yvj2R4H0upVE=;
  b=EkU5CNdRXQ9EQ5latQNnceiMkUvwQj4UreOWxzqGrjKw0YuHX/XlXBqb
   hJ2xJB43aZaPCiiNbSfdvKXrG6yZqkL1asMrDGRwaA/2d3TXO+nEZox65
   N/JFiEWQR+qZ8pfjSrhjDRyJAGRF+s4tp7Zm5JmGMn2vEyCRLb8QONZsH
   eBgdAu5/Q762E1KNmWW1wDjqO9A328rMBYQyOydcwetF6aBrc84e51sem
   U6x7BaF9CZyL2iR8qdVtTXpIRSAVCr73PBHfUNbxT1QbAcJVMUTCdb3n5
   i5JJMdfHFPTEBO+QpoZvEOnaPLjJcdsnjjuUsFS5R9ghQhWuZKfd/FO8v
   Q==;
X-CSE-ConnectionGUID: 6vSaN0wGQZC7az5XCQlkKg==
X-CSE-MsgGUID: 6ZtkTAo6Q6Ckf3PiliMI2Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="20631123"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="20631123"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 21:48:56 -0700
X-CSE-ConnectionGUID: zRPK5CxUQ8WNVXROT6XeGA==
X-CSE-MsgGUID: IpF4oO6bRiy0hKMp+6DS+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="30644473"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 28 Apr 2024 21:48:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id F31CA2A4; Mon, 29 Apr 2024 07:48:53 +0300 (EEST)
Date: Mon, 29 Apr 2024 07:48:53 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH] thunderbolt: Correct trace output of firmware connection
 manager packets
Message-ID: <20240429044853.GE3969176@black.fi.intel.com>
References: <20240426054300.3827052-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240426054300.3827052-1-mika.westerberg@linux.intel.com>

On Fri, Apr 26, 2024 at 08:42:59AM +0300, Mika Westerberg wrote:
> These are special packets that the drivers sends directly to the
> firmware connection manager (ICM). These do not have route string
> because they are always consumed by the firmware connection manager
> running on the host router, so hard-code that in the output accordingly.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/next.

