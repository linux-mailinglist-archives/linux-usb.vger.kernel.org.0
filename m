Return-Path: <linux-usb+bounces-31538-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE94CC7B5A
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 13:56:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 316423078A0A
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 12:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5732236FC;
	Wed, 17 Dec 2025 12:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jyQQ262A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAAF1F418F;
	Wed, 17 Dec 2025 12:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765976113; cv=none; b=RNjO1P3Q63rLMkBMv7bYFywIWecjfegVDJNqmyWsX29NJKLdIfrRBO+fXfhAwpqQ7SlCXeHti13YZNjvaBLi6AtBbEECXtBMEXmFlg3NESbqcDusvd/pyjuFRI9WbpAzdwuC+nti/uzvXmtpUCtXgIuyJIlD/6tNANmADQ/fXF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765976113; c=relaxed/simple;
	bh=93HhP303tk6I6p9oOgfW3UKvQxbm3sunPIrjdffkgnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I3WvQmJXWtcauzEbKb8IxUh/P59yb+IhxhiTi6cZVznb/btMLITc/FhB8zpkGK5e/oJSZrv3OSm5oDs1xLRxVkzIp2Qk5w5v87lPtOFU00LwSBSp3mGcAVI2kg9V764iWz/AtwbWGU8PAxrnOSNWge8QMbuOWZ6UMHNPZWwpvo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jyQQ262A; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765976112; x=1797512112;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=93HhP303tk6I6p9oOgfW3UKvQxbm3sunPIrjdffkgnk=;
  b=jyQQ262AATmd7wjFwsWiHySaSYQgmTlxhrmc6Q1Vra580dqnzJvfr06Q
   RKZLZLtJG+N5gU/gXQhqFpF85puAp/4XYYQlWwOBFROFmAKVlpQ+fU+s5
   9fKg1atioOPtJj4RY331VSK3SJhnCeD3swBioT0Y2EJtkPhUHsOu8k7if
   7WZMqRg1JV30hOege9k/FlO6ZV0QvGXsU50xp9g8lJIljeuoVGyBKM0WG
   ilIOrDziGEXPmwDPmBIi+qb5WGGCvKQ00UfROXrawJwxBLXL5RKeKELe5
   MdSTD4aZmgssQ5BcJGMPyyC+1UpN5bBjk/3/cyIbtU2ApKbop4NSyM0m+
   g==;
X-CSE-ConnectionGUID: AyGfdwUxSWCTMmP0pMLiUA==
X-CSE-MsgGUID: 0FOWg84STACIk12DmkETZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="85328847"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="85328847"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 04:55:11 -0800
X-CSE-ConnectionGUID: Pd8z6rUUTZSbs5GA9qFYRQ==
X-CSE-MsgGUID: 9XgqKcaSSNW8Tmpv2hcmEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="198056719"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 17 Dec 2025 04:55:09 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A0F2798; Wed, 17 Dec 2025 13:55:07 +0100 (CET)
Date: Wed, 17 Dec 2025 13:55:07 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sanath.S@amd.com,
	"Lin, Wayne" <Wayne.Lin@amd.com>
Subject: Re: [PATCH] [RFC] thunderbolt: Add delay for Dell U2725QE link width
Message-ID: <20251217125507.GR2275908@black.igk.intel.com>
References: <20251209054141.1975982-1-acelan.kao@canonical.com>
 <20251209070633.GA2275908@black.igk.intel.com>
 <pjn5d7oz433z4jph6whdalhowf652xknnk2fh5q7elffgb5ogo@7dtpvywxc6nw>
 <20251210074133.GE2275908@black.igk.intel.com>
 <4634177b-8ed1-4d65-9f3c-754d8c1eb828@amd.com>
 <coxrm5gishdztghznuvzafg2pbdk4qk3ttbkbq7t5whsfv2lk5@3gqepcs6h4uc>
 <20251212123941.GK2275908@black.igk.intel.com>
 <484ff606-ec10-477c-acfe-d4d781e2873d@amd.com>
 <CAFv23Q=bLCif750y8eDEP4J+KwVy8CknZawYOGZWWrBSiE8FNA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFv23Q=bLCif750y8eDEP4J+KwVy8CknZawYOGZWWrBSiE8FNA@mail.gmail.com>

Hi,

On Wed, Dec 17, 2025 at 11:06:52AM +0800, AceLan Kao wrote:
> > > By default it does not access retimers beyond the Type-C connector. I
> > > wonder if you have CONFIG_USB4_DEBUGFS_MARGINING set in your kernel
> > > .config? And if yes can you disable that and try again.
> Sorry, it looks like I got some troubles with my MTA, some emails are
> not sent out correctly.
> 
> I've rebuilt the kernel without CONFIG_USB4_DEBUGFS_MARGINING, and
> here is the log
> There is a tbt storage daisy-chained after the tbt monitor, it's
> easier to reproduce this issue.
> https://people.canonical.com/~acelan/bugs/tbt_call_trace/intel/merged_6.18.0-d358e5254674+.2.out
> 
> And this one is only the tbt monitor plugged.
> https://people.canonical.com/~acelan/bugs/tbt_call_trace/intel/merged_6.18.0-d358e5254674+.3.out

Okay from the first trace at least scanning of the retimer at index 2
(which does not exist) does not complete too fast and I suspect there is
some timeout on the device side that triggers. We had already similar with
Pluggable devices but perhaps this is implemented in the Dell version too?

I wonder it is enough if we set configuration valid and then scan the
downstream retimers? Can you try the attached patch? We do need to scan
them before DP tunnels are created to support ALPM (this is work in
progress).

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index d7f32a63fc1e..e23e0ee9c95f 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1380,14 +1380,6 @@ static void tb_scan_port(struct tb_port *port)
 	upstream_port = tb_upstream_port(sw);
 	tb_configure_link(port, upstream_port, sw);
 
-	/*
-	 * Scan for downstream retimers. We only scan them after the
-	 * router has been enumerated to avoid issues with certain
-	 * Pluggable devices that expect the host to enumerate them
-	 * within certain timeout.
-	 */
-	tb_retimer_scan(port, true);
-
 	/*
 	 * CL0s and CL1 are enabled and supported together.
 	 * Silently ignore CLx enabling in case CLx is not supported.
@@ -1406,6 +1398,13 @@ static void tb_scan_port(struct tb_port *port)
 	 */
 	tb_switch_configuration_valid(sw);
 
+	/*
+	 * Scan for downstream retimers. We only scan them after the
+	 * router has been enumerated to avoid issues with certain
+	 * Pluggable devices that expect the host to enumerate them
+	 * within certain timeout.
+	 */
+	tb_retimer_scan(port, true);
 	/* Scan upstream retimers */
 	tb_retimer_scan(upstream_port, true);
 

