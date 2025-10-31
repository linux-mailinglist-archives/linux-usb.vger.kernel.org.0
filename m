Return-Path: <linux-usb+bounces-29948-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A86C252B6
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 14:06:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FB70462705
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 13:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDDC934B185;
	Fri, 31 Oct 2025 13:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L+E01aDM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E9434B189
	for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 13:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761915921; cv=none; b=dot8E5Q99CkngejExYxf1rKvvQiklt6kCAo9KBuBbqkmiRTd7kU3PIso3RP2wp+OR1HPLvb3/GNiIZK6rGs+BQN9ee5kiwKBMQ1WySR9nFn46tqqnrwMGbwoe03OZ+oNAomlSC3OHdY5Rb3TPd5kJbXilw8GwPLIr0yG7wcYh/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761915921; c=relaxed/simple;
	bh=2Tp5RxR/F7F9bWoE75Wec6Ej+TTl4wwdkzn/s9/qOQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cf+fRcSjbqgB1biIbQR6HOOKm8G4mpyq8ydNBscApQdZj9tP02MK13D9lx5yDR+RcAo6cf/iwMnTpWHOYDnwOetjx9jqFfvb497iN8WKVO0SPm9UbHyqtYeacs2UE9+ALO5+ByK0akgC1tw2Cgl7p3N0L03oRHrkRTOw0W91ado=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L+E01aDM; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761915919; x=1793451919;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=2Tp5RxR/F7F9bWoE75Wec6Ej+TTl4wwdkzn/s9/qOQ4=;
  b=L+E01aDMnXa0a0Vnrmf3pYE2vvVs63euScE0rklfzhn4zWPgkhhfcGZj
   t2F+6oFZgcVJ07NVs9AJwwhlaQdocAJXQb8ShJHw1wnMYr76jk2EeOgm3
   g4g/lZTRoKNbUjIOjwVq0gA15JXdaeeQYkU7sTRMgBYj9WzHVmXAG8Mrl
   tGD1nAy6ctrUa129PmU98R0DSCGO8HnxmpBXJqP/j67vdajY3xul9rXJs
   2rCALoLHPpcujDb2l2NWfrUrdqNmpzK+poVy2k3S28ueufGe++ULgML1e
   RDawGHdd8S1PiTe3++iWU3xxQcRkcIYKdVgKZa2UlG5UbHTCf6Yto0BvZ
   g==;
X-CSE-ConnectionGUID: xf6flVPQStCg/ABE69JKVA==
X-CSE-MsgGUID: uzoGHqI+Qne6GZXpHLW/NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63772101"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="63772101"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 06:05:18 -0700
X-CSE-ConnectionGUID: DGWqwBytQZuTJusegm10iw==
X-CSE-MsgGUID: dpnBhSsJR4mIrRpo811vkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="209798022"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 31 Oct 2025 06:05:16 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id EC91C95; Fri, 31 Oct 2025 14:05:15 +0100 (CET)
Date: Fri, 31 Oct 2025 14:05:15 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yanis Srairi <yanis.srairi@univ-lehavre.fr>
Cc: linux-usb@vger.kernel.org, andreas.noever@gmail.com, westeri@kernel.org,
	YehezkelShB@gmail.com
Subject: Re: [BUG] Dell Thunderbolt 4 dock not enumerated on cold boot -
 Intel Core Ultra 7 255H
Message-ID: <20251031130515.GC2912318@black.igk.intel.com>
References: <45a965a4-3b40-b808-5fde-0c9d78c8f492@univ-lehavre.fr>
 <20251031105946.GZ2912318@black.igk.intel.com>
 <926b30e9-00da-c404-53fd-2f7fb4731d5a@univ-lehavre.fr>
 <20251031113108.GA2912318@black.igk.intel.com>
 <45db8612-b893-9909-6ffb-9aee4256e471@univ-lehavre.fr>
 <20251031122743.GB2912318@black.igk.intel.com>
 <756cc72c-4c62-ac0c-78f5-e259dff68f80@univ-lehavre.fr>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <756cc72c-4c62-ac0c-78f5-e259dff68f80@univ-lehavre.fr>

Hi,

On Fri, Oct 31, 2025 at 01:58:56PM +0100, Yanis Srairi wrote:
> I've tested with "Enable Thunderbolt Boot Support" → Off (matching your 
> settings), but unfortunately the issue persists.

:(

> I compared the debug outputs before/after the BIOS change using diff, and
> they are byte-for-byte identical:
> - Lanes still show CLd (Link Down)
> - PORT_CS_18 still shows Router Detected = 0x0
> - Hotplug after boot still works fine
> 
> All other BIOS settings were already matching yours:
> - Enable External USB Ports → On
> - Enable USB Boot Support → On
> - Disable USB4 PCIE Tunneling → Off
> - Video/Power only on Type-C Ports → Off
> - Type-C Dock Override → On
> - Type C Dock Audio → On
> - Type C Dock Lan → On
> 
> I can attach the new debug files if needed, but they're identical to the
> previous ones.

No need then. At this point I don't have any other ideas other than
contacting Dell support. Did you BTW check whether it works in Windows or
your system came already with Linux installed? I would expect the same
issue is there too but in case you ever tested that.

