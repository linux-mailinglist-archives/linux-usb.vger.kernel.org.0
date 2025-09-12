Return-Path: <linux-usb+bounces-27987-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7186CB54211
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 07:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BD657B9F67
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 05:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027F027702B;
	Fri, 12 Sep 2025 05:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DoIMktPF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD166275B03
	for <linux-usb@vger.kernel.org>; Fri, 12 Sep 2025 05:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757654940; cv=none; b=DxD8XM/hKkAxgHmgVot5zQ0ZQ+Zq2gHyD8iMiizDotKz8gtFD7YWVKxtjEqid0ACN8QfUJg+UWctEtvtllPM30l77U4DQj7zfC0gjYgD759xaxZJGH7G2eaCXZYVtUdXxZ7ak2zXHQ7Obw4Bl3FKu5/dVfZ2pDtQpK9KJ0mKdxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757654940; c=relaxed/simple;
	bh=Pb/Ou1i+dOJzLcajuoueqOMrxtksPQfdilOR2sB2znw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6n22Qs5LrxXAEY3g6K9mwt5I7Bff9OFYcfS1U20Z5HerjPOjR+ulrrU+YDcK/hQIA3fD2pMufiA9gcky0+NIJPRswdXWACOtns35MtmRPnzq+/U/8PQdyZdTgoI9VNcN0888iehzKC++u0vCGSa9NnZspRu1tWnuTi6fiWAVNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DoIMktPF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757654938; x=1789190938;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pb/Ou1i+dOJzLcajuoueqOMrxtksPQfdilOR2sB2znw=;
  b=DoIMktPFmb82QYMhWH56HzEZKU1VABZiRJKBSWT+7Zx+ZEPnGfxpkWGG
   lWnsXUlfJ4MHg7ZQT4GzUBQ8v4ghguEIQmYaxnbvxBJk9Z61OQhTYZwLL
   mWSrXqlMe16eRY9XPqkjNrhc7NkV1HecuVLDorzjCBjEUI3KptAXUyVuI
   dbb2LwkhHy5Ros8PfJNrs88wqY9adrJeyVIZVTPZgEzyxOtmIIrc//Txu
   +uVa+wZtQ5KnxorNv2Jz1xax8vWrmsf8W/ZTOgKfmZHEDud/Xl3Ni81BL
   eiU5cExFYA2DGeIy7aUkg2qx4Mg3pM+feWw9xsNfOkvntwmEVMIbq3PSh
   A==;
X-CSE-ConnectionGUID: Aeqdqw1LR5+tKmPLnL8q8A==
X-CSE-MsgGUID: lS2WMs3fQs+SPPekiM3oXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="70250705"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="70250705"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 22:28:57 -0700
X-CSE-ConnectionGUID: CYCaoxaBQjqT8HwRxDN3pw==
X-CSE-MsgGUID: 4nnl2nlGTsadFg36BjnlCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="174264229"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 11 Sep 2025 22:28:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 4E6CF94; Fri, 12 Sep 2025 07:28:54 +0200 (CEST)
Date: Fri, 12 Sep 2025 07:28:54 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <jametm@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update Michael Jamet's maintainer entries
Message-ID: <20250912052854.GZ476609@black.igk.intel.com>
References: <20250908145501.2612218-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250908145501.2612218-1-mika.westerberg@linux.intel.com>

On Mon, Sep 08, 2025 at 04:55:01PM +0200, Mika Westerberg wrote:
> Michael Jamet is about to continue his professional journey outside of
> Intel and is stepping down as maintainer of Thunderbolt/USB4 subsystem,
> and the networking driver. Move him from MAINTAINERS to CREDITS.
> 
> Thank you, Michael!
> 
> Cc: Michael Jamet <jametm@gmail.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/next.

