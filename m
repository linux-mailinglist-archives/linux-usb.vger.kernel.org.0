Return-Path: <linux-usb+bounces-32099-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 334E6D078E5
	for <lists+linux-usb@lfdr.de>; Fri, 09 Jan 2026 08:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D26A30464E2
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jan 2026 07:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3212EC562;
	Fri,  9 Jan 2026 07:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l1ijlRWn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A8F2367CF;
	Fri,  9 Jan 2026 07:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767943403; cv=none; b=gN3S2aNMoL1CdwgeXKDSsQVbR7oht3xQa7N0fMmwTdwdvg1WIeXBOTHTOOY44YtECQEITrYtW2fr4vkMkM3ODPqbXyc/I3hPzd42joXIi2An5I9Kc1PIJveyDsQ9ia4iyuk0pCbwngkEJzkCcuZKFnWwDIPGT1OWCZRh3llyHsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767943403; c=relaxed/simple;
	bh=bf8ZcgeEjpKmLqVz1N+HioqUbjhdnrXyhiGFSpwSbwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NRnp0L1rvV8SYW2M34KpWRyeHK3EG82FGP1vtgj0GBsQvyX5+Zzzc/PlirlDZZNtdZUhRy0QbgWPY80zZby5MUGv4w4li05JJACjli4VywmFVVrEBPAllRS0lobBHTcmcxEgEinc8FwZKdsuoURVBruuGSlLYhrYmelZHTo7sPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l1ijlRWn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767943402; x=1799479402;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bf8ZcgeEjpKmLqVz1N+HioqUbjhdnrXyhiGFSpwSbwk=;
  b=l1ijlRWnTWeEZN7qRT7zFIqSy5aTTTdFUR1aoHhroEh2r1OwSsHwPgC7
   aRHyFL5f0EM5GENbTXzIJmqz1rCHQ5dy/5ui60DU5H7kv7QEmcEDTZ3Wt
   jefz/npdP88LlKIxwHo50Ac9xR9HV34Y5jTMMJz9T0Abakt8nJmi/9Why
   AHAO93UfbxntQXIwxFmB3cSAz6zOXDbLizib9Mtx71pu73r42d9wxlnac
   MkfDZptdjWyK2RMnsGDW73TG2Kk4yGlwuEafskz7ii1TQZ0/co6um7tIT
   E4z6tDh4tndiFvCmDnZdlxwD7e7ZszcWUWP/W+7EauXvqZ8WAvMW7elKS
   Q==;
X-CSE-ConnectionGUID: etJaulfAQPC5pvg7AofHpQ==
X-CSE-MsgGUID: obpIoXI1S+CosLYy0ygrgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="79620784"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="79620784"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 23:23:22 -0800
X-CSE-ConnectionGUID: 51aIpcNTSyum0MXfnZDbaA==
X-CSE-MsgGUID: 6toyWCMVRsexq7ju9/I4ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="203830032"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 08 Jan 2026 23:23:19 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 91DBB94; Fri, 09 Jan 2026 08:23:18 +0100 (CET)
Date: Fri, 9 Jan 2026 08:23:18 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
	linux-kernel@vger.kernel.org,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>
Subject: Re: [PATCH v2 0/2] thunderbolt: Fix S4 resume incongruities
Message-ID: <20260109072318.GU2275908@black.igk.intel.com>
References: <20260106053749.61440-1-superm1@kernel.org>
 <20260107093353.GO2275908@black.igk.intel.com>
 <158442b3-28c2-4f8c-ba42-0b9c6661c650@kernel.org>
 <20260108114205.GS2275908@black.igk.intel.com>
 <ad8cf89d-a171-4e72-996e-8b09d16f9017@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ad8cf89d-a171-4e72-996e-8b09d16f9017@kernel.org>

On Thu, Jan 08, 2026 at 01:18:58PM -0600, Mario Limonciello wrote:
> On 1/8/26 5:42 AM, Mika Westerberg wrote:
> > On Wed, Jan 07, 2026 at 02:50:54PM -0600, Mario Limonciello wrote:
> > > On 1/7/26 3:33 AM, Mika Westerberg wrote:
> > > > Hi,
> > > > 
> > > > On Mon, Jan 05, 2026 at 11:37:47PM -0600, Mario Limonciello (AMD) wrote:
> > > > > When a machine is restored from S4 if the firmware CM has created
> > > > > tunnels there can be an incongruity of expectation from the kernel
> > > > > when compared to booting from S5.  This series addresses those.
> > > > 
> > > > I suspect there is no Firmware CM in AMD platforms so this actually means
> > > > the BIOS CM, correct?
> > > 
> > > That's correct.
> > > 
> > > > 
> > > > However, on S4 we actually do reset host router when the "boot kernel" is
> > > > started before loading and jumping to the hibernation image.
> > > 
> > > That's only if thunderbolt.ko is built into the kernel or is included in the
> > > initramfs before it does the pivot to the hibernation image.
> > 
> > Ah good point.
> > 
> > > At least in the tests we were doing it's not part of the boot kernel.
> > > 
> > > > It might be
> > > > that this boot kernel tunnel configuration is causing the issues you are
> > > > seeing (can you elaborate on those?)
> > > 
> > > The issues manifest "downstream" in the GPU driver.  There are a bunch of
> > > aux failures and a non functional display.  Tracing it back the GPU driver
> > > isn't alive at the time that the tunnels are attempted to be reconstructed
> > > at the moment and so CM tears DP tunnel down and then when GPU driver does
> > > come up it is not functional.
> > > 
> > > DP tunnel constructed at:
> > > 
> > > [  486.007194] thunderbolt 0000:c6:00.6: AUX RX path activation complete
> > > 
> > > First DPRx timeout at:
> > > 
> > > [  486.135483] thunderbolt 0000:c6:00.6: 0:6 <-> 2:13 (DP): DPRX read
> > > timeout
> > > 
> > > DP tunnel deactivating at:
> > > 
> > >   [  486.331856] thunderbolt 0000:c6:00.6: 0:6 <-> 2:13 (DP): deactivating
> > 
> > Hmm, we have dprx_timeout by default 12 seconds. How come it tears down the
> > tunnel already?
> 
> *I believe* it's because of a hot unplug event that occurs from it not
> working.
> 
> > 
> > > 
> > > First DPRx DPCD reading starts at:
> > > 
> > > [  486.351765] amdgpu 0000:c4:00.0: amdgpu: [drm] DPIA AUX failed on
> > > 0xf0000(10), error 7
> > 
> > This would have maked it within the 12s if I read the timestamps right.
> 
> Let me just share the whole log so you can see the full context.
> 
> https://gist.github.com/superm1/6798fff44d0875b4ed0fe43d0794f81e

Thanks!

[Side note, you seem to have the link trained at Gen2 (20G) instead of Gen3
(40G).]

Looking at the dmesg I recalled that there is an internal report about
similar issue by Pooja and Rene (Cc'd) and it all boils down to this log
entry:

[  489.339148] thunderbolt 0000:c6:00.6: 2:13: could not allocate DP tunnel

They made a hack patch that works it around, see below. I wonder if you
could try that too? If that's the issue (not releasing HopIDs) then we need
to figure a way to fix it properly. One suggestion is to release DP
resources earlier, and of course doing full reset as done here. I would
prefer "smallest" possible change.

@Pooja, any updates on your side to this?

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 28c1e5c062f3..45f7ee940f10 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -1084,6 +1084,9 @@ static void tb_dp_dprx_work(struct work_struct *work)
 
 static int tb_dp_dprx_start(struct tb_tunnel *tunnel)
 {
+	if (tunnel->dprx_started)
+		return 0;
+
 	/*
 	 * Bump up the reference to keep the tunnel around. It will be
 	 * dropped in tb_dp_dprx_stop() once the tunnel is deactivated.
-- 
2.43.0


