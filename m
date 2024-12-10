Return-Path: <linux-usb+bounces-18279-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B0C9EA892
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2024 07:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D72D167CC4
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2024 06:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D6022ACF9;
	Tue, 10 Dec 2024 06:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FTJWsIdD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474D6227599
	for <linux-usb@vger.kernel.org>; Tue, 10 Dec 2024 06:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733811222; cv=none; b=sdBHAWBM2Pfpms5ah5SAZtUvOe5lfR0hO7rFHHUuqTZE1lx9GA7hz2s+N/69d2YA4/U9lv8Ege6bitqbhdDguYvWgy/gXNo+TWa8IUz1Jzd8AD3RqG4F9X/Lnynj+0e1zn1JTOuGbHtK2DYKi8/BlzmeIv3WwV81VuUFH6Nu2WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733811222; c=relaxed/simple;
	bh=1kessOnplRs/w+ECVpuZz5QrtMhmCrMgihh9BohsWEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7FQRB3DWquUTMI58qO4QVSS5m/+1Snj0XjXVG9UQZEs0SeNmDw1psCG2n/umuTqN/DmRCuwPiVfTjIGQP8SR4ocOCON4rJ9zdv3XfIl17yrO09CgLGvF0WiBQ0jpj4FhTa8ponqdoQW0JXGCqxK9Ge52KeTBmxd3pn+zYjbGG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FTJWsIdD; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733811220; x=1765347220;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1kessOnplRs/w+ECVpuZz5QrtMhmCrMgihh9BohsWEw=;
  b=FTJWsIdDPTUWqPagVK+cvcddbjMf6sj6YH4+6croxVk8hQh0muP2qNB3
   qLIHgWnZXKtLhrbcMETi7//1bMQxRTD9xkO/zVnAWVDayE4R+45hr350T
   zr+ybGFYdsIdEplA4TIkvqdCK6QJmlhqshCe8qGORIKYMCvFtN42SBQTV
   bs9FaNTQ99mcOUZgN/0AJ2Drz/EIvAAv/4609c3KOjPmnZpZOLtHLRJfi
   T39A9lQxp/lkmzveikzlJv0j5WSt+4b/mRUioUui7p6YB40ukcjX6RA4t
   CemE5m1uvZQytIcY+akC2jAkqwG5gX6NDJVl4/A2t/NW+lZPbA3tiacBa
   w==;
X-CSE-ConnectionGUID: jYn+PokETv+TU1eHd1toIg==
X-CSE-MsgGUID: e0D1PzecTam5vBR7VIEEDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="21724063"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="21724063"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 22:13:39 -0800
X-CSE-ConnectionGUID: eCV0xIS3RSyMtLy3FLNFNg==
X-CSE-MsgGUID: jSCJq925QXy81Ie2im/k8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="95499596"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 09 Dec 2024 22:13:38 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id D476A28E; Tue, 10 Dec 2024 08:13:36 +0200 (EET)
Date: Tue, 10 Dec 2024 08:13:36 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH] thunderbolt: Add support for Intel Panther Lake-M/P
Message-ID: <20241210061336.GN4955@black.fi.intel.com>
References: <20241204095636.1051165-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241204095636.1051165-1-mika.westerberg@linux.intel.com>

On Wed, Dec 04, 2024 at 11:56:36AM +0200, Mika Westerberg wrote:
> Intel Panther Lake-M/P has the same integrated Thunderbolt/USB4
> controller as Lunar Lake. Add these PCI IDs to the driver list of
> supported devices.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/fixes.

