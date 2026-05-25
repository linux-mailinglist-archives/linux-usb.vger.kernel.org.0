Return-Path: <linux-usb+bounces-37997-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOAMCrHTE2rPGQcAu9opvQ
	(envelope-from <linux-usb+bounces-37997-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 06:44:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8D85C5BD0
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 06:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9A0A300B9ED
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 04:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 342A530C17E;
	Mon, 25 May 2026 04:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Foyit35T"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6FA2772D
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 04:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779684267; cv=none; b=F4rGmZlU9QqAmj36yinKJMXGkQ5enej0/lfUOun7zKUahrIleNSphNF7sb1R3xdK2NxvNMcSr0e+iqQ9lEevgkJyPNuU70R3aNT/V3TbyIrkJEtijFUzkJZ9T98mtrat33Qz7ctmiNoX6QKkaEoIKxsyateVgSFsZXd7klPxVvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779684267; c=relaxed/simple;
	bh=c+R3xmh8woI0z0uNEorhzdFMnNpNk76OjFilG31kZ+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vtb9FBPF4iIvyo3bYl3MFbJA6lt2IUan8/kdtp0t42wAnjLzIEWFm7c/S/mH/I2fL6adjYOtXTi1tNq76ST4eHJeOdeLNYFnqJunXVb4Ifa+Y966RX/UNQlKixr0Pr82f1/ktFaXLBw0VwbNdhZWvFz7Gc9z8Keg6JUv31toRJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Foyit35T; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779684265; x=1811220265;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c+R3xmh8woI0z0uNEorhzdFMnNpNk76OjFilG31kZ+M=;
  b=Foyit35T22SGfjhSKMjx/GM5SQ68zdHZGHYLEH8gMDkrEqSuupHItZCl
   /zCUxCchB+zA6UnowItICAFAS/7rHftcMpJOzsQayBuUYhlqb/v7cXfNC
   57Np96tou5baej/ArRWq+ZKGtSZCR3mL8AcGS4gpR+9YdQMs4oubDRDBA
   2o8I8vQS0LBldAz0CjlIWJolvHKxlTmxOwTSUKGZl9tlxyTC/1alFmvQo
   4HsShcHUCjnJjEs1srSMu2Mz2DiR3DVyivS+CkAFNnop17J39C1q0lKEL
   4ZWLsaDnYLCSY2Dm4/UJwiGF9Mwua6gFqU95QhCNBx/5M/v3uwBaxbvGM
   A==;
X-CSE-ConnectionGUID: nrQGQ8XkSka0+P8RKM/9yg==
X-CSE-MsgGUID: Qy58D2CRTAi4W+DWeMJywQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="90802524"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="90802524"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 21:44:24 -0700
X-CSE-ConnectionGUID: HLp/SfPlQCCAnKY4QIv0qg==
X-CSE-MsgGUID: mF/5S3DkRs+BxSU7VxkyAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="240462454"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 24 May 2026 21:44:23 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 81BE995; Mon, 25 May 2026 06:44:21 +0200 (CEST)
Date: Mon, 25 May 2026 06:44:21 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sebastian Loscher <krang@krang.de>
Cc: linux-usb@vger.kernel.org, andreas.noever@gmail.com,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [BUG] thunderbolt: USB4 v2 TBGAA tunnel creation crash in TMU
 enhanced uni-directional mode
Message-ID: <20260525044421.GI8580@black.igk.intel.com>
References: <13787e02-75d9-8000-65d5-41434a0e817c@krang.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <13787e02-75d9-8000-65d5-41434a0e817c@krang.de>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,amd.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37997-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: 4E8D85C5BD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

+Mario

Hi,

On Sat, May 23, 2026 at 06:43:06PM +0200, Sebastian Loscher wrote:
> Hi Mika and the Linux USB team,
> 
> I hope you are well. I am testing a new Thunderbolt 5 setup on a brand-new AMD
> Strix Halo system, and I have run into a reproducible hardware panic during the
> initial connection handshake.
> 
> I have gathered full dynamic debug traces and would appreciate your insight on
> whether this requires a specific hardware quirk.
> 
> This is my first report in such format ever, maybe big for me but please bare
> with me.
> 
> Hardware:
> 
> Host: Minisforum MS-S1 Max (AMD Strix Halo USB4 v2 controller)
> 
> Dock: Minisforum eGPU dock (Vendor 0x41f, Device 0xd002, TBGAA controller)
> 
> Kernel: CachyOS (state your exact kernel version, e.g., 6.12-rcX)
> 
> The Issue:
> When plugging in the Thunderbolt 5 dock, the connection fails during USB3
> tunnel creation and drops entirely.
> 
> Using dyndbg="file drivers/thunderbolt/* +p", the trace shows the AMD host
> successfully shifting the dock into TB5 asymmetric routing (TMU: mode set to:
> enhanced uni-directional, MedRes). However, immediately after querying the NVM
> authentication status of the retimers (reading NVM authentication status of
> retimers), the dock suffers a hardware panic and physically drops the link
> (acking hot unplug event on 0:1).
> 
> The subsequent -107 and -71 PCIe/USB errors appear to be the Linux driver
> attempting to route through a connection the dock has already severed.
> 
> Attached:
> Full dynamic debug dmesg trace of the hotplug event.
> 
> I deeply hope this contribution can help the community. Let me know if there is
> anything else I can help with. And keep up the great work.

Thanks for the report.

Can you enable tracing and provide both full dmesg and the trace output?

Tracing can be enabled using tbtools [1].

# tbtrace enable

Then repro and run

# tbtrace disable
# tbtrace dump -vv > trace.out

[1] https://github.com/intel/tbtools

> 
> Kind regards
> 
> Sebastian
> 

> [  332.894110] [UFW BLOCK] IN=enp98s0 OUT= MAC= SRC=fe80:0000:0000:0000:ee0c:b911:402c:55a2 DST=ff02:0000:0000:0000:0000:0000:0001:0003 LEN=76 TC=0 HOPLIMIT=255 FLOWLBL=319052 PROTO=UDP SPT=5355 DPT=5355 LEN=36 
> [  335.894390] [UFW BLOCK] IN=enp97s0 OUT= MAC= SRC=10.23.1.207 DST=224.0.0.252 LEN=56 TOS=0x00 PREC=0x00 TTL=255 ID=13896 PROTO=UDP SPT=5355 DPT=5355 LEN=36 
> [  352.890811] [UFW BLOCK] IN=enp98s0 OUT= MAC= SRC=fe80:0000:0000:0000:ee0c:b911:402c:55a2 DST=ff02:0000:0000:0000:0000:0000:0001:0003 LEN=76 TC=0 HOPLIMIT=255 FLOWLBL=319052 PROTO=UDP SPT=5355 DPT=5355 LEN=36 
> [  355.893947] [UFW BLOCK] IN=enp98s0 OUT= MAC= SRC=10.23.107.208 DST=224.0.0.252 LEN=56 TOS=0x00 PREC=0x00 TTL=255 ID=8056 PROTO=UDP SPT=5355 DPT=5355 LEN=36 
> [  370.697051] thunderbolt 0000:67:00.0: acking hot plug event on 0:1
> [  370.697152] thunderbolt 0000:67:00.0: 0:1: hotplug: scanning
> [  370.697256] thunderbolt 0000:67:00.0: 0:1: is connected, link is up (state: 2)
> [  370.697795] thunderbolt 0000:67:00.0: current switch config:
> [  370.697803] thunderbolt 0000:67:00.0:  USB4 Switch: 8087:5786 (Revision: 133, TB Version: 64)
> [  370.697807] thunderbolt 0000:67:00.0:   Max Port Number: 23
> [  370.697810] thunderbolt 0000:67:00.0:   Config:
> [  370.697812] thunderbolt 0000:67:00.0:    Upstream Port Number: 1 Depth: 0 Route String: 0x0 Enabled: 0, PlugEventsDelay: 10ms
> [  370.697815] thunderbolt 0000:67:00.0:    unknown1: 0x0 unknown4: 0x0
> [  370.700819] thunderbolt 0000:67:00.0: initializing Switch at 0x1 (depth: 1, up port: 1)
> [  370.701184] thunderbolt 0000:67:00.0: 1: link: USB4
> [  370.701185] thunderbolt 0000:67:00.0: 1: TBT3 support: yes, xHCI: yes
> [  370.702464] thunderbolt 0000:67:00.0: 1: credit allocation parameters:
> [  370.702465] thunderbolt 0000:67:00.0: 1:  USB3: 20
> [  370.702466] thunderbolt 0000:67:00.0: 1:  DP AUX: 1
> [  370.702466] thunderbolt 0000:67:00.0: 1:  DP main: 6
> [  370.702467] thunderbolt 0000:67:00.0: 1:  PCIe: 76
> [  370.702468] thunderbolt 0000:67:00.0: 1:  unknown credit allocation index 0x0, skipping
> [  370.706433] thunderbolt 0000:67:00.0: 1: DROM version: 1
> [  370.708353] thunderbolt 0000:67:00.0: 1: uid: 0x1bce40080871534
> [  370.709632] thunderbolt 0000:67:00.0:  Port 1: 0:5780 (Revision: 0, TB Version: 1, Type: Port (0x1))
> [  370.709634] thunderbolt 0000:67:00.0:   Max hop id (in/out): 31/31
> [  370.709635] thunderbolt 0000:67:00.0:   Max counters: 4
> [  370.709635] thunderbolt 0000:67:00.0:   NFC Credits: 0x4a000000
> [  370.709636] thunderbolt 0000:67:00.0:   Credits (total/control): 160/2
> [  370.710784] thunderbolt 0000:67:00.0:  Port 2: 0:5780 (Revision: 0, TB Version: 1, Type: Port (0x1))
> [  370.710785] thunderbolt 0000:67:00.0:   Max hop id (in/out): 31/31
> [  370.710785] thunderbolt 0000:67:00.0:   Max counters: 0
> [  370.710786] thunderbolt 0000:67:00.0:   NFC Credits: 0xca000000
> [  370.710786] thunderbolt 0000:67:00.0:   Credits (total/control): 160/2
> [  370.711929] thunderbolt 0000:67:00.0: acking hot plug event on 1:13
> [  370.712061] thunderbolt 0000:67:00.0: acking hot plug event on 1:14
> [  370.712066] thunderbolt 0000:67:00.0:  Port 3: 0:5780 (Revision: 0, TB Version: 1, Type: Port (0x1))
> [  370.712067] thunderbolt 0000:67:00.0:   Max hop id (in/out): 31/31
> [  370.712068] thunderbolt 0000:67:00.0:   Max counters: 4
> [  370.712068] thunderbolt 0000:67:00.0:   NFC Credits: 0x8a000000
> [  370.712069] thunderbolt 0000:67:00.0:   Credits (total/control): 160/2
> [  370.712189] thunderbolt 0000:67:00.0: acking hot plug event on 1:16
> [  370.713215] thunderbolt 0000:67:00.0:  Port 4: 0:5780 (Revision: 0, TB Version: 1, Type: Port (0x1))
> [  370.713216] thunderbolt 0000:67:00.0:   Max hop id (in/out): 31/31
> [  370.713217] thunderbolt 0000:67:00.0:   Max counters: 0
> [  370.713217] thunderbolt 0000:67:00.0:   NFC Credits: 0x8a000000
> [  370.713217] thunderbolt 0000:67:00.0:   Credits (total/control): 160/2
> [  370.714495] thunderbolt 0000:67:00.0:  Port 5: 0:5780 (Revision: 0, TB Version: 1, Type: Port (0x1))
> [  370.714496] thunderbolt 0000:67:00.0:   Max hop id (in/out): 31/31
> [  370.714497] thunderbolt 0000:67:00.0:   Max counters: 4
> [  370.714497] thunderbolt 0000:67:00.0:   NFC Credits: 0x8a000000
> [  370.714497] thunderbolt 0000:67:00.0:   Credits (total/control): 160/2
> [  370.715647] thunderbolt 0000:67:00.0:  Port 6: 0:5780 (Revision: 0, TB Version: 1, Type: Port (0x1))
> [  370.715648] thunderbolt 0000:67:00.0:   Max hop id (in/out): 31/31
> [  370.715649] thunderbolt 0000:67:00.0:   Max counters: 0
> [  370.715649] thunderbolt 0000:67:00.0:   NFC Credits: 0x8a000000
> [  370.715649] thunderbolt 0000:67:00.0:   Credits (total/control): 160/2
> [  370.716928] thunderbolt 0000:67:00.0:  Port 7: 0:5780 (Revision: 0, TB Version: 1, Type: Port (0x1))
> [  370.716929] thunderbolt 0000:67:00.0:   Max hop id (in/out): 31/31
> [  370.716929] thunderbolt 0000:67:00.0:   Max counters: 4
> [  370.716930] thunderbolt 0000:67:00.0:   NFC Credits: 0x8a000000
> [  370.716930] thunderbolt 0000:67:00.0:   Credits (total/control): 160/2
> [  370.718079] thunderbolt 0000:67:00.0:  Port 8: 0:5780 (Revision: 0, TB Version: 1, Type: Port (0x1))
> [  370.718080] thunderbolt 0000:67:00.0:   Max hop id (in/out): 31/31
> [  370.718081] thunderbolt 0000:67:00.0:   Max counters: 0
> [  370.718081] thunderbolt 0000:67:00.0:   NFC Credits: 0x8a000000
> [  370.718082] thunderbolt 0000:67:00.0:   Credits (total/control): 160/2
> [  370.718336] thunderbolt 0000:67:00.0:  Port 9: 0:5780 (Revision: 0, TB Version: 1, Type: PCIe (0x100102))
> [  370.718337] thunderbolt 0000:67:00.0:   Max hop id (in/out): 8/8
> [  370.718337] thunderbolt 0000:67:00.0:   Max counters: 2
> [  370.718338] thunderbolt 0000:67:00.0:   NFC Credits: 0x40800000
> [  370.718338] thunderbolt 0000:67:00.0:   Credits (total/control): 8/0
> [  370.718591] thunderbolt 0000:67:00.0:  Port 10: 0:5780 (Revision: 0, TB Version: 1, Type: PCIe (0x100101))
> [  370.718592] thunderbolt 0000:67:00.0:   Max hop id (in/out): 8/8
> [  370.718593] thunderbolt 0000:67:00.0:   Max counters: 2
> [  370.718593] thunderbolt 0000:67:00.0:   NFC Credits: 0x40800000
> [  370.718593] thunderbolt 0000:67:00.0:   Credits (total/control): 8/0
> [  370.719103] thunderbolt 0000:67:00.0:  Port 11: 0:5780 (Revision: 0, TB Version: 1, Type: DP/HDMI (0xe0102))
> [  370.719105] thunderbolt 0000:67:00.0:   Max hop id (in/out): 9/9
> [  370.719105] thunderbolt 0000:67:00.0:   Max counters: 2
> [  370.719105] thunderbolt 0000:67:00.0:   NFC Credits: 0x800000
> [  370.719106] thunderbolt 0000:67:00.0:   Credits (total/control): 8/0
> [  370.719615] thunderbolt 0000:67:00.0:  Port 12: 0:5780 (Revision: 0, TB Version: 1, Type: DP/HDMI (0xe0102))
> [  370.719616] thunderbolt 0000:67:00.0:   Max hop id (in/out): 9/9
> [  370.719617] thunderbolt 0000:67:00.0:   Max counters: 2
> [  370.719617] thunderbolt 0000:67:00.0:   NFC Credits: 0x800000
> [  370.719618] thunderbolt 0000:67:00.0:   Credits (total/control): 8/0
> [  370.719618] thunderbolt 0000:67:00.0: 1:13: disabled by eeprom
> [  370.719619] thunderbolt 0000:67:00.0: 1:14: disabled by eeprom
> [  370.719746] thunderbolt 0000:67:00.0:  Port 15: not implemented
> [  370.719746] thunderbolt 0000:67:00.0: 1:16: disabled by eeprom
> [  370.719999] thunderbolt 0000:67:00.0:  Port 17: 0:5780 (Revision: 0, TB Version: 1, Type: PCIe (0x100101))
> [  370.720000] thunderbolt 0000:67:00.0:   Max hop id (in/out): 8/8
> [  370.720001] thunderbolt 0000:67:00.0:   Max counters: 2
> [  370.720001] thunderbolt 0000:67:00.0:   NFC Credits: 0x40800000
> [  370.720002] thunderbolt 0000:67:00.0:   Credits (total/control): 8/0
> [  370.720255] thunderbolt 0000:67:00.0:  Port 18: 0:5780 (Revision: 0, TB Version: 1, Type: PCIe (0x100101))
> [  370.720256] thunderbolt 0000:67:00.0:   Max hop id (in/out): 8/8
> [  370.720257] thunderbolt 0000:67:00.0:   Max counters: 2
> [  370.720257] thunderbolt 0000:67:00.0:   NFC Credits: 0x40800000
> [  370.720258] thunderbolt 0000:67:00.0:   Credits (total/control): 8/0
> [  370.720768] thunderbolt 0000:67:00.0:  Port 19: 0:5780 (Revision: 0, TB Version: 1, Type: DP/HDMI (0xe0102))
> [  370.720769] thunderbolt 0000:67:00.0:   Max hop id (in/out): 9/9
> [  370.720769] thunderbolt 0000:67:00.0:   Max counters: 2
> [  370.720770] thunderbolt 0000:67:00.0:   NFC Credits: 0x800000
> [  370.720770] thunderbolt 0000:67:00.0:   Credits (total/control): 8/0
> [  370.721023] thunderbolt 0000:67:00.0:  Port 20: 0:5780 (Revision: 0, TB Version: 1, Type: USB (0x200102))
> [  370.721024] thunderbolt 0000:67:00.0:   Max hop id (in/out): 8/8
> [  370.721025] thunderbolt 0000:67:00.0:   Max counters: 1
> [  370.721025] thunderbolt 0000:67:00.0:   NFC Credits: 0x800000
> [  370.721026] thunderbolt 0000:67:00.0:   Credits (total/control): 8/0
> [  370.721279] thunderbolt 0000:67:00.0:  Port 21: 0:5780 (Revision: 0, TB Version: 1, Type: USB (0x200101))
> [  370.721280] thunderbolt 0000:67:00.0:   Max hop id (in/out): 8/8
> [  370.721281] thunderbolt 0000:67:00.0:   Max counters: 1
> [  370.721281] thunderbolt 0000:67:00.0:   NFC Credits: 0x800000
> [  370.721282] thunderbolt 0000:67:00.0:   Credits (total/control): 8/0
> [  370.721535] thunderbolt 0000:67:00.0:  Port 22: 0:5780 (Revision: 0, TB Version: 1, Type: USB (0x200101))
> [  370.721536] thunderbolt 0000:67:00.0:   Max hop id (in/out): 8/8
> [  370.721537] thunderbolt 0000:67:00.0:   Max counters: 1
> [  370.721537] thunderbolt 0000:67:00.0:   NFC Credits: 0x800000
> [  370.721537] thunderbolt 0000:67:00.0:   Credits (total/control): 8/0
> [  370.721791] thunderbolt 0000:67:00.0:  Port 23: 0:5780 (Revision: 0, TB Version: 1, Type: USB (0x200101))
> [  370.721792] thunderbolt 0000:67:00.0:   Max hop id (in/out): 8/8
> [  370.721793] thunderbolt 0000:67:00.0:   Max counters: 1
> [  370.721793] thunderbolt 0000:67:00.0:   NFC Credits: 0x800000
> [  370.721793] thunderbolt 0000:67:00.0:   Credits (total/control): 8/0
> [  370.721794] thunderbolt 0000:67:00.0: 1: running quirk_usb3_maximum_bandwidth [thunderbolt]
> [  370.721818] thunderbolt 0000:67:00.0: 1:21: USB3 maximum bandwidth limited to 16376 Mb/s
> [  370.721819] thunderbolt 0000:67:00.0: 1:22: USB3 maximum bandwidth limited to 16376 Mb/s
> [  370.721820] thunderbolt 0000:67:00.0: 1:23: USB3 maximum bandwidth limited to 16376 Mb/s
> [  370.722047] thunderbolt 0000:67:00.0: 1: current link speed 40.0 Gb/s
> [  370.722048] thunderbolt 0000:67:00.0: 1: current link width symmetric, dual lanes
> [  370.722687] thunderbolt 0000:67:00.0: 1: preferred link width symmetric, dual lanes
> [  370.723455] thunderbolt 0000:67:00.0: 1: CLx: current mode: disabled
> [  370.730752] thunderbolt 0000:67:00.0: 1: TMU: supports uni-directional mode
> [  370.730753] thunderbolt 0000:67:00.0: 1: TMU: supports enhanced uni-directional mode
> [  370.731136] thunderbolt 0000:67:00.0: 1: TMU: current mode: off
> [  370.733484] thunderbolt 0-1: new device found, vendor=0x41f device=0xd002
> [  370.733486] thunderbolt 0-1: Micro Computer (HK) Tech. Ltd. TBGAA
> [  370.735631] thunderbolt 0000:67:00.0: 1: NVM version 62.42
> [  370.737726] thunderbolt 0000:67:00.0: 0:1: reading NVM authentication status of retimers
> [  370.940313] thunderbolt 0000:67:00.0: 0:1: disabling sideband transactions
> [  371.042092] thunderbolt 0000:67:00.0: 1:1: CLx: CL0s/CL1/CL2 supported
> [  371.042099] thunderbolt 0000:67:00.0: 0:1: CLx: CL0s/CL1/CL2 supported
> [  371.042594] thunderbolt 0000:67:00.0: 1: CLx: CL0s/CL1/CL2 enabled
> [  371.042598] thunderbolt 0000:67:00.0: 1: TMU: mode change off -> enhanced uni-directional, MedRes requested
> [  371.042718] thunderbolt 0000:67:00.0: 0: TMU: local_time[0]=0x5a400000
> [  371.042721] thunderbolt 0000:67:00.0: 0: TMU: local_time[1]=0x005523e1
> [  371.042723] thunderbolt 0000:67:00.0: 0: TMU: local_time[2]=0x03e80000
> [  371.043821] thunderbolt 0000:67:00.0: 1: TMU: updated local time to 0x5523e15a40
> [  371.048099] thunderbolt 0000:67:00.0: 1: TMU: mode set to: enhanced uni-directional, MedRes
> [  371.050527] thunderbolt 0000:67:00.0: 1:1: reading NVM authentication status of retimers
> [  371.201482] thunderbolt 0000:67:00.0: acking hot unplug event on 0:1
> [  371.301780] thunderbolt 0000:67:00.0: 1:1: disabling sideband transactions
> [  371.302412] thunderbolt 0000:67:00.0: 0:1: link maximum bandwidth 9000/9000 Mb/s
> [  371.302655] thunderbolt 0000:67:00.0: 1:1: link maximum bandwidth 72000/72000 Mb/s
> [  371.302782] thunderbolt 0000:67:00.0: 1:20: available bandwidth for new USB3 tunnel 9000/9000 Mb/s
> [  371.303024] thunderbolt 0000:67:00.0: 1: USB3 tunnel creation failed
> [  371.303922] thunderbolt 0000:67:00.0: 0:9 <-> 1:9 (PCI): activating
> [  371.303925] thunderbolt 0000:67:00.0: activating PCIe Down path from 0:9 to 1:9
> [  371.304046] thunderbolt 0000:67:00.0: 1:1: Writing hop 1
> [  371.304047] thunderbolt 0000:67:00.0: 1:1:  In HopID: 8 => Out port: 9 Out HopID: 8
> [  371.304048] thunderbolt 0000:67:00.0: 1:1:   Weight: 1 Priority: 3 Credits: 76 Drop: 0 PM: 0
> [  371.304049] thunderbolt 0000:67:00.0: 1:1:    Counter enabled: 0 Counter index: 2047
> [  371.304050] thunderbolt 0000:67:00.0: 1:1:   Flow Control (In/Eg): 1/0 Shared Buffer (In/Eg): 0/0
> [  371.304051] thunderbolt 0000:67:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
> [  371.304302] thunderbolt 0000:67:00.0: 1:1: hop deactivation failed for hop 1, index 8
> [  371.304303] thunderbolt 0000:67:00.0: PCIe Down path activation failed: -107
> [  371.304304] thunderbolt 0000:67:00.0: 0:9 <-> 1:9 (PCI): activation failed
> [  371.304305] thunderbolt 0000:67:00.0: 0:9 <-> 1:9 (PCI): deactivating
> [  371.304948] thunderbolt 0000:67:00.0: 1:9: PCIe tunnel activation failed, aborting
> [  371.304981] thunderbolt 0000:67:00.0: 0:1: switch unplugged
> [  371.305759] thunderbolt 0-1: device disconnected
> [  371.306674] thunderbolt 0000:67:00.0: bandwidth consumption changed, re-calculating estimated bandwidth
> [  371.306677] thunderbolt 0000:67:00.0: bandwidth re-calculation done
> [  371.306678] thunderbolt 0000:67:00.0: looking for DP IN <-> DP OUT pairs:
> [  371.306705] thunderbolt 0000:67:00.0: 0:13: DP IN available
> [  371.306706] thunderbolt 0000:67:00.0: 0:13: no suitable DP OUT adapter available, not tunneling
> [  371.306833] thunderbolt 0000:67:00.0: 0:14: DP IN available
> [  371.306834] thunderbolt 0000:67:00.0: 0:14: no suitable DP OUT adapter available, not tunneling
> [  371.421827] usb 5-1: new high-speed USB device number 8 using xhci_hcd
> [  371.549027] usb 5-1: New USB device found, idVendor=1d5c, idProduct=5801, bcdDevice= 1.01
> [  371.549043] usb 5-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [  371.549044] usb 5-1: Product: USB2.0 Hub
> [  371.549047] usb 5-1: Manufacturer: Fresco Logic, Inc.
> [  371.588232] hub 5-1:1.0: USB hub found
> [  371.588621] hub 5-1:1.0: 6 ports detected
> [  372.195131] usb 5-1.2: new high-speed USB device number 9 using xhci_hcd
> [  372.292245] usb 5-1.2: New USB device found, idVendor=0bda, idProduct=5420, bcdDevice= 1.80
> [  372.292256] usb 5-1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [  372.292259] usb 5-1.2: Product: 4-Port USB 2.0 Hub
> [  372.292260] usb 5-1.2: Manufacturer: Generic
> [  372.356618] hub 5-1.2:1.0: USB hub found
> [  372.357272] hub 5-1.2:1.0: 4 ports detected
> [  372.894153] [UFW BLOCK] IN=enp98s0 OUT= MAC= SRC=fe80:0000:0000:0000:ee0c:b911:402c:55a2 DST=ff02:0000:0000:0000:0000:0000:0001:0003 LEN=76 TC=0 HOPLIMIT=255 FLOWLBL=319052 PROTO=UDP SPT=5355 DPT=5355 LEN=36 
> [  373.106976] usb 5-1.2.3: new high-speed USB device number 10 using xhci_hcd
> [  373.206451] usb 5-1.2.3: New USB device found, idVendor=0bda, idProduct=8156, bcdDevice=31.04
> [  373.206463] usb 5-1.2.3: New USB device strings: Mfr=1, Product=2, SerialNumber=6
> [  373.206465] usb 5-1.2.3: Product: USB 10/100/1G/2.5G LAN
> [  373.206467] usb 5-1.2.3: Manufacturer: Realtek
> [  373.206469] usb 5-1.2.3: SerialNumber: 4013000001
> [  373.347588] r8152-cfgselector 5-1.2.3: reset high-speed USB device number 10 using xhci_hcd
> [  373.728871] usb 5-1.2.4: new high-speed USB device number 11 using xhci_hcd
> [  373.852519] usb 5-1.2.4: New USB device found, idVendor=152d, idProduct=0583, bcdDevice= 2.14
> [  373.852545] usb 5-1.2.4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [  373.852548] usb 5-1.2.4: Product: USB to PCIE Bridge
> [  373.852550] usb 5-1.2.4: Manufacturer: JMicron
> [  373.852552] usb 5-1.2.4: SerialNumber: 0123456789ABCDEF
> [  373.854075] scsi host0: uas
> [  373.854542] scsi 0:0:0:0: Direct-Access     JMicron  Generic          0214 PQ: 0 ANSI: 6
> [  373.898145] usb 5-1.2.4: stat urb: status -71
> [  375.893793] [UFW BLOCK] IN=enp97s0 OUT= MAC= SRC=10.23.1.207 DST=224.0.0.252 LEN=56 TOS=0x00 PREC=0x00 TTL=255 ID=34161 PROTO=UDP SPT=5355 DPT=5355 LEN=36 
> [  392.894057] [UFW BLOCK] IN=enp98s0 OUT= MAC= SRC=fe80:0000:0000:0000:ee0c:b911:402c:55a2 DST=ff02:0000:0000:0000:0000:0000:0001:0003 LEN=76 TC=0 HOPLIMIT=255 FLOWLBL=319052 PROTO=UDP SPT=5355 DPT=5355 LEN=36 
> 


