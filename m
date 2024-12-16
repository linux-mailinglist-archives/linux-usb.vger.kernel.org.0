Return-Path: <linux-usb+bounces-18524-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1848E9F2B5F
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2024 09:02:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94925166A6A
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2024 08:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648A8203D40;
	Mon, 16 Dec 2024 07:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kH8PO1KX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4917D202C58
	for <linux-usb@vger.kernel.org>; Mon, 16 Dec 2024 07:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734335956; cv=none; b=EF2t59nR4zyDe4nANbQ1EbTxZmk6YsIs5bVRUJNBFkHFq+7Qwwc/uOh19EMZFcK/fcGpSSiHGM4vaoGQsd0IO+n/aKO4vSAK7Y2vsU+wvgVbG7AUe5PTURjyN9JQsP/zzsM6TDbBY5hkQ1L2kt5mPf/0r+MaAjL6q/swbqQl2+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734335956; c=relaxed/simple;
	bh=GGxesDnkjjhfJ1uGG0H7TiipRXbQTDhfXlzzMK4SQkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iT31YNwpqtJ+NjCqzLIXfrzzaMsA5I3pJ3uB14DV9d3ziPoACT9+rN+UO7WMR59YFa2tqx2SnIE42r7gjfc9SEpe4RD1ShQkzxLuzPw+tZW6zf2mVDn10AH0UGqKjw8A3Sk0Sv6gP/V+0TeiRraezAGpKqIv1MbLXN4anTxLlZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kH8PO1KX; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734335955; x=1765871955;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GGxesDnkjjhfJ1uGG0H7TiipRXbQTDhfXlzzMK4SQkA=;
  b=kH8PO1KX7mmWSA6gX7IEevkxjXeIrnq2PjiqfCoEJ0blEQ6JIwDN0TGY
   5lR6suNAD+ky/Pljs2bm0bbnWBIBITJ00P8UpQjB9KTZymk+wxOoP0vov
   PdoJm6gtwUO/CmxLyNB6lIwIjttKWb1PLFbFJWZ7VOJrzu11GGn4j/+jo
   /2kBuk1RCSHPfvzx8a86BQ/gsjqwEM/VdruZQvwyTUKOj1IRZi6oDNBya
   qYEyivEQGwiGFdcfcr+vbnqIFAMdywM0Wp3Gwm/KaTB4rZMb6uVn/gBiI
   6ubIOa4/XpGD5vipnc+I7R8bfni53iUruEG17YKz/3LqYJEjd32qGQm/T
   w==;
X-CSE-ConnectionGUID: HTyr1R/kTMaqTeDXKYT+Dw==
X-CSE-MsgGUID: ilSYM1jQSp2w4LhAMUsXLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="38392249"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="38392249"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 23:59:14 -0800
X-CSE-ConnectionGUID: fCycWhZMTl6+oyGpWB68OQ==
X-CSE-MsgGUID: Kz3e+x2tSNO2+Lkf/FPicg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="102147285"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 15 Dec 2024 23:59:13 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 21090329; Mon, 16 Dec 2024 09:59:12 +0200 (EET)
Date: Mon, 16 Dec 2024 09:59:12 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>
Subject: Re: [PATCH] thunderbolt: debugfs: Add write capability to path
 config space
Message-ID: <20241216075912.GC3713119@black.fi.intel.com>
References: <20241211082330.2294196-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241211082330.2294196-1-mika.westerberg@linux.intel.com>

On Wed, Dec 11, 2024 at 10:23:30AM +0200, Mika Westerberg wrote:
> From: Gil Fine <gil.fine@linux.intel.com>
> 
> Currently debugfs interface allows writing of router, adapter and
> counters config spaces but not for paths. However, it can be useful
> during debugging to modify path config space so for this reason add this
> support to the debugfs interface as well.
> 
> Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/next.

