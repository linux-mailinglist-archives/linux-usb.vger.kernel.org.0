Return-Path: <linux-usb+bounces-26789-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7A0B243C8
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 10:10:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93DC916BC8E
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 08:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE602DE6E3;
	Wed, 13 Aug 2025 08:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IiehV5dE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727362D12F7
	for <linux-usb@vger.kernel.org>; Wed, 13 Aug 2025 08:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755072571; cv=none; b=TMIqV1fJj3gXx46wz/QWjDywRpqdodf5SMv8Vl/Cjq7YgdaOGJEiSGxFlJU1RiOxOzeKvbbsCECreTpiC7aA0m0WtanS0KRUPlYTb1qDyTxINk//OWdguRzZODoP1XikiyeUV88Tgao7q/54KhmOCek2QcnKTlh8PtSIk1meJts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755072571; c=relaxed/simple;
	bh=HGuGiN0JijFF8qWsK/N8qps7eBwpo4ESYxa8RzEmM8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hFmO5qkP+q/nq4/GkT81hb1MTOhwQn6poQlsx1yTIZVGwQ4mYnglr7DgIpbRT+e0Ra56YeSIdCpm9siETexkvC1LScquXX7WoHRUsn1t9736T5FZjf+cWKCOHYdp9z8LSSJH4YZKp2BF1jxDG/mLPV5BQOY7fz+E3vyz7A+khK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IiehV5dE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755072569; x=1786608569;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HGuGiN0JijFF8qWsK/N8qps7eBwpo4ESYxa8RzEmM8c=;
  b=IiehV5dEI1TDyhdsPBwcoK5SRGENICN35uVsvTxFs63NK9q2Jg12L5zz
   dQvKuzS0z+5uSa24RSKO+JJEza19rqsuToBwBChS2OC2PYvj3DBGurYJJ
   xvgu3RDpj4JU2DkvvAworMZNVoF5YXG09K3NiH9Y78DIIwroZxqxBXEkg
   MqgT+Lckf+xU+d9IiHlwoRhBVfbQYgnG5UZNTTbexSGXFO4LRNNLw27EA
   kdOZeP1zuXJK9jRTy0G4wkAagUSeOFCttTetPllEfEoYgQjV7bN0+rdy/
   KC0a9xs3z+7xTJH50BGEzyt9PPdypFxAuBwKHyEbgh6ezUKB3mQ+Ckoqy
   A==;
X-CSE-ConnectionGUID: lkPdjJsyQH2CusjpKFqN4Q==
X-CSE-MsgGUID: 1YguYbFcQAezwLBPSk59pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68734780"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="68734780"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 01:09:28 -0700
X-CSE-ConnectionGUID: QW1HO3C6TDasZFNYXDVd3A==
X-CSE-MsgGUID: pzTknjAHQ0Gqi/ptuZ/K7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="170617672"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 13 Aug 2025 01:09:27 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A8EBD95; Wed, 13 Aug 2025 10:09:25 +0200 (CEST)
Date: Wed, 13 Aug 2025 10:09:25 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Raju Rangoju <Raju.Rangoju@amd.com>,
	Mario Limonciello <superm1@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] thunderbolt: Use Linux Foundation IDs for XDomain
 discovery
Message-ID: <20250813080925.GY476609@black.igk.intel.com>
References: <20250812054710.2910816-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250812054710.2910816-1-mika.westerberg@linux.intel.com>

On Tue, Aug 12, 2025 at 07:47:09AM +0200, Mika Westerberg wrote:
> There are other vendors now that have their own USB4 host router
> hardware so using the Intel donated IDs may confuse users. For this
> reason switch to use USB IDs provided by the Linux Foundation for
> XDomain discovery.
> 
> Link: https://lore.kernel.org/linux-usb/20250722175026.1994846-1-Raju.Rangoju@amd.com/
> Cc: Raju Rangoju <Raju.Rangoju@amd.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/next.

