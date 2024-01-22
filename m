Return-Path: <linux-usb+bounces-5359-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC778362BA
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 12:59:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6B2AB249FE
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 11:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C4BD3A8FE;
	Mon, 22 Jan 2024 11:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H600vho2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A333A8F5
	for <linux-usb@vger.kernel.org>; Mon, 22 Jan 2024 11:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705924734; cv=none; b=lVJp3HtNO3rHARYvBReKFtfWgBpaDAM4/Mkk6+CrloBA+JPJE0TK45u9JMUbP7YzXtlCpE9Hg3JR5YSVw6VO8Ol0By2DQJirLBA68JwK547/bbz3UDNm77UkMG+ZBQh/0OvVZYoI/iUYG5Jo/ubkaXt5YuoNDXDpebc99comDLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705924734; c=relaxed/simple;
	bh=gfN3cTbt3jijK2Gr7tyRnl1IIdCpBh7yI0nCcMuMvgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQWEepBRTOvaKrht+SB1xTZZdNewh0HATCcuw3+JR24PSB6tq/11gEoQza8wF6NQM/9PhelDaLJKNMEAWGVrE39WCNkaBOkLQ6YqJ+fJjKZymlN52wZoAI4FNRyWeKnAmFlGWrEltSe/BGekF9az6ymglQyQN8GFrwyTCzORFFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H600vho2; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705924733; x=1737460733;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gfN3cTbt3jijK2Gr7tyRnl1IIdCpBh7yI0nCcMuMvgQ=;
  b=H600vho2i0rizOcku1Y/+a5j/GRONo5+36Xg3TVvAD1vcf7QfskM5hIr
   XAhDGBiIOXP1/hIKo0DMtiLpn6qY+kCvqKuK9weHwEGmbqEnF5Ulg9y3M
   0B6F2uUtoKiAZwKzV4Be2WgA7aL3gY4Ae/sQeJ9eSF0NKIyfQ5kwTC121
   FGreSWtA+F97m3emsInlDDMjeuy3AAsQWL22GyaG9U1WP0Kjh/z6W+5s7
   RwtbA0Ed1y5ytpHbV3/VfTvWRUn5Zwv9cdp6srvUvSxNwIMQtfR6sX/Uv
   SvqsLR0OJyVwy1mAJ+gDLp2i//kACOowP3RW3fHssP+pF99GS16rC+kLG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="432350387"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="432350387"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 03:58:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="958717651"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="958717651"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 22 Jan 2024 03:58:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 9A89F24D; Mon, 22 Jan 2024 13:33:38 +0200 (EET)
Date: Mon, 22 Jan 2024 13:33:38 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com,
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Fix xdomain rx_lanes_show and tx_lanes_show
Message-ID: <20240122113338.GI2543524@black.fi.intel.com>
References: <20240114034054.28562-1-rahimi.mhmmd@gmail.com>
 <20240114034054.28562-2-rahimi.mhmmd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240114034054.28562-2-rahimi.mhmmd@gmail.com>

On Sun, Jan 14, 2024 at 11:40:54AM +0800, Mohammad Rahimi wrote:
> If the Inter-Domain link is operating in asymmetric TB_LINK_WIDTH_ASYM_TX
> mode, the rx_lanes_show should return 1 since there is only one receiver
> and tx_lanes_show should return 3 since there are 3 transmitters.
> 
> Signed-off-by: Mohammad Rahimi <rahimi.mhmmd@gmail.com>

Applied to thunderbolt.git/next, thanks!

This is kind of cosmetic thing because it is not allowed to have
asymmetric link over host-to-host connection according to the spec but
maybe somewhere in the future...

