Return-Path: <linux-usb+bounces-31840-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD5ACE96D7
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 11:38:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 472493032A9E
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 10:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A23E29D28A;
	Tue, 30 Dec 2025 10:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HXzITpZz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E04284662;
	Tue, 30 Dec 2025 10:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767090431; cv=none; b=SfTNv6xf4sJzffBsupzAWS3LahVdWha+pgFzX7A2agPsrdDTs/Ifa6mQlLEvNaolt6YVnZaBqzUfj6xP0Il7S8CarvffETV0TKXY/SDkg+hsFZZzgz2nvz+btxC6n6n5QyxGlrEHe9j4Q7ZWhPuBBNGhHzBBuA5Eqnvenyvn780=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767090431; c=relaxed/simple;
	bh=uToTT+aXx/L5R4j9zxPi/49J6OtPYw75o6nQYuuHba0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+V4r9RsoSxlbP02eeqLSLYheqo1NlajnxenOtxdahKEVC+YWukkozzqMA0cIJZe36vpUm1pkxvHsSaN/MrZOPJmT7/zhkWdIZQf7VyXxcM+4hrD/N+Y7QnBcGL6ljHhrxC3PUkv7riQ93ICmLwkd1gsmmK1QCoXZ1BTTDHrZeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HXzITpZz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767090428; x=1798626428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uToTT+aXx/L5R4j9zxPi/49J6OtPYw75o6nQYuuHba0=;
  b=HXzITpZzuSQL3Js3beAKaR2il7hdhvPAtXf5sxTS/3invdfuvirXVYn6
   CAWe+TefmxL3+hhoqDG+iaW2M1IxXmB3T6kNu7gxT2xC/T1lnFgHFTgvp
   Ry46u2bI/DFcg4cLYFuOWMqzQ6JKj0YmcTcDwW37YqgHy89sqWxfGITe+
   t0mK4hrI9W02Te2nCk9c8tv84gd3FaKOYIpVlfnZDpy6mOmQgdJfR4r2x
   4AKcxpLkaU+gpZtt794SsZsT95nge8YDHuz/s5Zf5nbGgo7f/SphCuxsB
   QnEQxUOjlEs2m+boiuvjCAN7VGVnvgzQsRza46bS0kb0bRKVikDBjRDe0
   A==;
X-CSE-ConnectionGUID: F3d4yE3kTb+PNlzUZC6QoQ==
X-CSE-MsgGUID: HTKmEnM4TFGP2J2I/1qXRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="91334591"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="91334591"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:27:07 -0800
X-CSE-ConnectionGUID: wQrF9vTpSJGGezS7N4xrPQ==
X-CSE-MsgGUID: bPUDnJFGQLy1fx9Lz1sJNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="232259641"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 30 Dec 2025 02:27:05 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 2192E8E; Tue, 30 Dec 2025 11:27:04 +0100 (CET)
Date: Tue, 30 Dec 2025 11:27:04 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Jaime Saguillo Revilla <jaime.saguillo@gmail.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] docs: admin-guide: thunderbolt: replace ifconfig with ip
Message-ID: <20251230102704.GE2275908@black.igk.intel.com>
References: <20251222152927.38101-1-jaime.saguillo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251222152927.38101-1-jaime.saguillo@gmail.com>

On Mon, Dec 22, 2025 at 04:29:26PM +0100, Jaime Saguillo Revilla wrote:
> ifconfig is a legacy tool and no longer installed by default on many
> modern distributions. Update the documentation to reference ip from
> iproute2 instead.
> 
> No functional change.
> 
> Signed-off-by: Jaime Saguillo Revilla <jaime.saguillo@gmail.com>

Applied to thunderbolt.git/next, thanks!

