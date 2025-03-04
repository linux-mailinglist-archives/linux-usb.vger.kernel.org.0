Return-Path: <linux-usb+bounces-21334-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84754A4DF71
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 14:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1280189C0A8
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 13:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A072040BA;
	Tue,  4 Mar 2025 13:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lKaSflXH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C92726ACD
	for <linux-usb@vger.kernel.org>; Tue,  4 Mar 2025 13:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741095622; cv=none; b=fFrh2M/IcDLZA0o7Iqv6RxrRxIzblgvyFlEnzce8lub/U8EtMWoLEwjKA/BsCFw/yI7tY7/aYfTVyMlEoJ/ioI0obA62NHOoKmIfHWnLCfw3ZNH0ii/U/e1PdjcwVCwCP3BsW5YSU55tAKf0orBvUud1WYz1rqMMjUD/zJGyf1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741095622; c=relaxed/simple;
	bh=SeW+DdrcD4IGJYpVBRolAIeZSKWBDi9RldZkWXK2R/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dO0zLsXUQRHj7qYSzpKKDifBxjTSbxFwSaiDxrf3eYVchLepB+zUcNmZCY/rcD0Eqh7s/UrcbMsnZftuhp5d1gzMpcbmee5Pn53DmuecjQNwtV7ry5Hxe5VtrKvn3N57gtgjw1HB/HRI01WF4h4uGzy4kQOwtwhi4DxRlN0agLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lKaSflXH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741095620; x=1772631620;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SeW+DdrcD4IGJYpVBRolAIeZSKWBDi9RldZkWXK2R/U=;
  b=lKaSflXHR0qSFKOhuvtq1WOZB95WDX+AdHb9V/QIR7UZlzGbkvY91mfy
   QxRaPdpQzLxTT6p3YZ8evr/ph9/JGgZ/N3JHf1EGM4uJXwv9nS4gOOA86
   SJM/vJhO3JNVmWzDqqq05OZ++oPH/BaECwu+j7KJ0As/CeFjdlQ4CIe2e
   uPE69O7IczFxBUMp4gMcJuQJAwlg7KLayapxnvDNzM2Nmmrvai7okiUii
   cYvPQsOs/lExOrHY6nwM5UWS7J50UYn2KsQrnlTafJi5dPLU46J3FGV7N
   AOiJj0NtY49MzGhmT8RqM2EkazrekPCllrd4bXbiaaXUKY6m8fLYQhHse
   A==;
X-CSE-ConnectionGUID: fGF0UdgATU6N6ir4EDGmNg==
X-CSE-MsgGUID: 7ndHQdu/RXmzVRoQrul1cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52650005"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="52650005"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 05:40:19 -0800
X-CSE-ConnectionGUID: w9Gjv9MFTy6272LLkImTbQ==
X-CSE-MsgGUID: X4Vrd49kRzC59n5B9LFbLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="118384926"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 04 Mar 2025 05:40:19 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id B8B272EF; Tue, 04 Mar 2025 15:40:17 +0200 (EET)
Date: Tue, 4 Mar 2025 15:40:17 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kenneth Crudup <kenny@panix.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: So, I had to revert d6d458d42e1 ("Handle DisplayPort tunnel
 activation asynchronously") too, to stop my resume crashes
Message-ID: <20250304134017.GL3713119@black.fi.intel.com>
References: <24ef839c-8fa5-4a19-b9c6-0a267aab84f5@panix.com>
 <20250303140156.GY3713119@black.fi.intel.com>
 <567725a5-f984-4ea1-bd38-8815825c1211@panix.com>
 <20250303142058.GA3713119@black.fi.intel.com>
 <402bcee8-030a-45bf-834b-ea4baf5eed3c@panix.com>
 <20250303175818.GB3713119@black.fi.intel.com>
 <007b005f-a6d1-44a2-9795-036c8f397274@panix.com>
 <48ef4c14-55d5-4baa-b862-f9e7368ed950@panix.com>
 <20250304082731.GF3713119@black.fi.intel.com>
 <14351945-fcde-4088-b7b3-542c6e4b7d0e@panix.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <14351945-fcde-4088-b7b3-542c6e4b7d0e@panix.com>

On Tue, Mar 04, 2025 at 04:52:19AM -0800, Kenneth Crudup wrote:
> 
> On 3/4/25 00:27, Mika Westerberg wrote:
> 
> > If possible add "thunderbolt.dyndbg=+p" now to your kernel command line so
> > if this happens again, we hopefully have full dmesg to investigate.
> 
> I've not seen any further instances of weird behavior, but I've added that
> to the command line going further.

Okay thanks!

> But I have been doing a fair amount of testing of the kernel with your patch
> and Lucas' NVMe adaptor (etc.) patch and am concerned that you're still
> seeing his issue, as it (at least as of now) hasn't occurred here since
> applying it.

It only happens if you have TBT dock and the NVMe connected and you
disconnect them while the system is suspended.

I suggest trying that a couple times and see if that happens. For me it
happened pretty much on first suspend cycle.

