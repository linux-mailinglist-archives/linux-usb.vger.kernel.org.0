Return-Path: <linux-usb+bounces-18957-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C064A0074F
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jan 2025 10:56:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03CD23A37E7
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jan 2025 09:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95531D432F;
	Fri,  3 Jan 2025 09:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESXPCHpS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0DE1B87EC
	for <linux-usb@vger.kernel.org>; Fri,  3 Jan 2025 09:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735898176; cv=none; b=EcZiUMHd5B7gEOC5w2kl5AqDNCQoI313zTh5+zkHN1L9On5Ai82YVz330F+m0A+sdUyoBFzidTBkw0bQSh8bmUMgSOdOtVhi9iPfai+Qd9uo3QKqVd8++EE3Cs6TRMmBydCzrnXHcCmwZFGGyHd2SAWaAJjpQm0I7IQWJyJkrv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735898176; c=relaxed/simple;
	bh=XhGgNK/OVeHlninCWMReQJlVfh1WjHXbE2CHziIxxzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tli1/mAMr5aVadYqHqNYH7R3s9EE2Qlxu2tVtuDCTo6ExvBW8XqB+E1uW6uMurNhfHM3i4EvGd0XylZl+T/5ZsLL20xQK+ERvP/wGrba2C2Jsv/1RHzMwAbLe3baRXeGZ0L/4iUnyqVkOWC1cvms/4n5EKk4QA3BUZuRnbLTabI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESXPCHpS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735898174; x=1767434174;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XhGgNK/OVeHlninCWMReQJlVfh1WjHXbE2CHziIxxzQ=;
  b=ESXPCHpSwXsMQk/ox/M90ktTWU5ckq4bTmmVNlmZrPpDfuYDvCEkUQ+J
   JAjq77xFJiEWMKmDtCazhe+EF9Q4WFwfxIZ2WcWt7J5liYvrPgsc2bF+s
   2Q+qq0bJjBVHMKuHqqFchKwxmJj+zoFjP306HuZvZRnND1l3axe3YUOT2
   GzggkQ+hEeQ2aJHOOL6VOIZ31BTd6V66SVevuWZx77B2c1Kwx+1xwUtVC
   Sl4RacaUkk5/d+JXNKlT+qdse5cG8w/DVn9xnnHxiQJhBWX0GOELuGzhi
   ASWPXVyRDeGxT5WroGbWsGH+yoj5HjS9iSR2yTDhWRk9vdf5bEMvbJCIZ
   w==;
X-CSE-ConnectionGUID: U/ef+PV1SyS0odN0l9tkGg==
X-CSE-MsgGUID: hz14q5nbQZynWaxkjvZH7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="23746333"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="23746333"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 01:56:13 -0800
X-CSE-ConnectionGUID: uou+ITvXRY6vQly+8AJCXg==
X-CSE-MsgGUID: zRfzqaouShaR/7nzErNlgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101943577"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 03 Jan 2025 01:56:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 68C2DF4; Fri, 03 Jan 2025 11:56:10 +0200 (EET)
Date: Fri, 3 Jan 2025 11:56:10 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH 00/12] thunderbolt: Improve DisplayPort tunneling
Message-ID: <20250103095610.GQ3713119@black.fi.intel.com>
References: <20241217082222.528602-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217082222.528602-1-mika.westerberg@linux.intel.com>

On Tue, Dec 17, 2024 at 10:22:10AM +0200, Mika Westerberg wrote:
> Hi all,
> 
> This series provides cleanups and few improvements for DisplayPort
> tunneling. First of all we increase the DPRX capabilites read timeout to
> cope with the fact that graphics driver may be runtime suspended. Secondly
> we move the DPRX negotiation to happen in a separate worker to allow
> forward progress even if the graphics driver is not yet loaded (this is
> kind if rare case but common in Intel Graphics CI).
> 
> Mika Westerberg (12):
>   thunderbolt: Drop doubled empty line from ctl.h
>   thunderbolt: Log config space when invalid config space reply is received
>   thunderbolt: Debug log an invalid config space reply just once
>   thunderbolt: Increase DPRX capabilities read timeout
>   thunderbolt: Make tb_tunnel_one_dp() return void
>   thunderbolt: Show path name in debug log when path is deactivated
>   thunderbolt: Rework how tunnel->[init|deinit] hooks are called
>   thunderbolt: Drop tb_tunnel_restart()
>   thunderbolt: Pass reason to tb_dp_resource_unavailable()
>   thunderbolt: Move forward declarations in one place
>   thunderbolt: Rework tb_tunnel_consumed_bandwidth()
>   thunderbolt: Handle DisplayPort tunnel activation asynchronously

Applied to thunderbolt.git/next.

