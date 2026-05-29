Return-Path: <linux-usb+bounces-38147-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6C6hH3YzGWqDsggAu9opvQ
	(envelope-from <linux-usb+bounces-38147-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 08:34:30 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEB95FDF75
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 08:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E371F3045B1F
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 06:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91823A963A;
	Fri, 29 May 2026 06:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KFVDvYW2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100AC3A5435
	for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 06:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780036466; cv=none; b=MFtvOauyVVtRdRBzZ3USvGlAWvU18zn4HHBjWjSfP1/oqiKByzIHNZQf6bwAz/Ayb6sz9yTMFUxjJ4oaQFad66uYUFGhg42OZy2a3PFwsOJjTlf8uIhJfhsG3K7iZ5enaugyorSyJN81KV2xAo+niCgPOWdQ16XgbPYLS4ZYQDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780036466; c=relaxed/simple;
	bh=qSkOTjNhPBFBARr91j1h9z92DpGXRTnmpoZsTSzDj/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=prJsrNL0b2IQJm8FMEhs3/cLp3da11WJ3z90w0izGU3i3igGL29Cp+b78JbheOXKklp5hwuJbuPn26L4YzMuc+JQ4Ns3bllBz6GFkg3yDsfnd5UkpPM0cUHTCYHrvAfZR7IPJ5brC7CaA3c3/3wZwRhdh15Ic7UFy+r9HapeS+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KFVDvYW2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780036465; x=1811572465;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qSkOTjNhPBFBARr91j1h9z92DpGXRTnmpoZsTSzDj/I=;
  b=KFVDvYW2NJjtexMtYMEtI5QqgdOH5lMZKYADO8vu1zJ3nXtGGFjqA3/v
   dmSuMYflYMoMlnZ/oHhv/UIK1TeTB/UAUhunAjmelXqt3NOEMwOj2BMyH
   HWcb65bCO7N2GlqOYsMUkVSBpqT5Ht/H4TNuYQc+ZS2FsqxlmwLm3OqTA
   N67utw58urAaLsjYW/8PpV2kKu11xgP0YnljoCduLm2ThKHgG/Cv9biKu
   m27/2rB78GcwRRwzi79xczrVs4GCrFh4iwXxGd0QyUUtSSC+CDclPbc7D
   8xVQqAFZAFKFImmYJ4tusMNZupZ6KWLWsPZwgI7EYlFLZKu92+GYFTK1N
   Q==;
X-CSE-ConnectionGUID: 99w+omf/SvyaBZnU+vWSNg==
X-CSE-MsgGUID: lay2PjhuQfmz3hdJG1IW+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="106336059"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="106336059"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 23:34:25 -0700
X-CSE-ConnectionGUID: TvAorfpHT5OM3oD3FRrYxQ==
X-CSE-MsgGUID: NHOEmUySQJGL2g/z+Mf0Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="240215490"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 28 May 2026 23:34:23 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 7582495; Fri, 29 May 2026 08:34:22 +0200 (CEST)
Date: Fri, 29 May 2026 08:34:22 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sebastian Loscher <krang@krang.de>
Cc: Mario Limonciello <superm1@kernel.org>, linux-usb@vger.kernel.org,
	andreas.noever@gmail.com
Subject: Re: [BUG] thunderbolt: USB4 v2 TBGAA tunnel creation crash in TMU
 enhanced uni-directional mode
Message-ID: <20260529063422.GJ3102@black.igk.intel.com>
References: <13787e02-75d9-8000-65d5-41434a0e817c@krang.de>
 <20260525044421.GI8580@black.igk.intel.com>
 <8c753210-e399-4ddf-8ca4-d250fd4af369@kernel.org>
 <20260526040732.GO8580@black.igk.intel.com>
 <523ddc3e-2047-c202-482a-02d76de17cd4@krang.de>
 <20260527122624.GC3102@black.igk.intel.com>
 <536cc913-8ae8-9000-69f9-02f604b7edfe@krang.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <536cc913-8ae8-9000-69f9-02f604b7edfe@krang.de>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38147-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,black.igk.intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 7EEB95FDF75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Wed, May 27, 2026 at 09:19:56PM +0200, Sebastian Loscher wrote:
> Hey Mika,
> 
> Please find attached some more tbtraces (and dmesg however I think they tell
> you less of a story).
> 
> I have the previously used cable and repeated the usual boot, plugin. Then I
> dumped the files and rebooted and repeated with a 2nd cable (it's from a three
> months old Lenovo and it charges with 140W, says TB in the package; the
> original cable came with the dock and was only unpacked the day before I
> reached out to you). I attached two different dumps for the 2nd, no reboot in
> between.
> You wondered about the initial couple of disconnects in the logs and blamed the
> cable - rightfully so - but here are some more details, maybe not fully obvious
> from the logs:
> Onbiously there is a GPU in the dock that runs at 100% fan speed, expected of
> course no PC tells it to do otherwise. When I plug the USB cable in there is
> 50% chance that the fans go down in speed for a second during the initial
> handshake (did so with tbtrace_cable1 and cable2_2 | but fails at speed
> negotiation) or it just keeps spinning high (tbtrace_cable2) which seems like,
> at least when I watched dmesg, that it doesn't go beyond the initial handshake
> and disconnects right away. That was, in the previous test, for me the reason
> to plugin it in and out multiple times until I could ‘hear’ something more was
> happening.
> 
> A bit adventurous description but maybe the extra info is worth it.

I noticed in your dmesg you have pcie_port_pm=off, can you remove that from
the command line, and add "thunderbolt.dyndbg=+p" instead and try again?
Then provide full dmesg?

