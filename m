Return-Path: <linux-usb+bounces-38215-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YD1INjsNHWolVQkAu9opvQ
	(envelope-from <linux-usb+bounces-38215-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 06:40:27 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C03F36197BA
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 06:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E98E3010157
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 04:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 841CA306D3F;
	Mon,  1 Jun 2026 04:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kfu/OAae"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3CD2264D3
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 04:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780288822; cv=none; b=SVv6CF/0qpUjC5vAtQ5IKxMuovEnivEt+CzWxWkchjNCJE3obz3MBsTFASM8CcvKpXSN8mmo30zM/LBbVPWv8RDVXJTIjCfzrKAR0ACxgetvt0HZasmXnZMHSASOk/8AEIZCvyXlNFvvCvPdotFnz8zCP3TEsbayR8R103+gdkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780288822; c=relaxed/simple;
	bh=T9lIoGAF34czxXBJ08e/C0k2T0ySbV4e/ZlUoXtSG24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJ4F2UFpd+px0893EXISgZlegQII+bqRKMsFWdAa5rPafNUBf0mZRui3a1Fw07YiyxuFimxXQ7KBOpsmA11ZBCPDDIeu1aeUYq37Z7OEV3ULX6jHcbx8DCaFcWSU6g+FLYogHeWWHagImKNWrD06vNbTRJNSMsYV63d+A9m79as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kfu/OAae; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780288820; x=1811824820;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=T9lIoGAF34czxXBJ08e/C0k2T0ySbV4e/ZlUoXtSG24=;
  b=kfu/OAaebHL9i+RjUx42MtQajN5jenntAnjpHjYMDM00IgGopGWn5PKc
   Ei8c65AD9Kt4noDz9IAljjyT6f15KebbAdocg8AiA4dR8ruY0DYnYOkzZ
   kQQ4j2j6OyiujgXR5r4JssRmQXz4/Y6BdapKAvFM/pmk1Qamj+rj7lDeh
   yv7gPTj1hA85G8JYiU+emyFZL6Ear9JyJ0ayQ2FBd6WTNk/kLfud0Z00k
   quBLFvOO88Ea1dFDJJen2xlWW2Gf9tBIrDXOd0VPdksXsBlyjQZeQ1z+E
   5mMc4arNnXiyey+v/LYYgnJ28ea75B3rqRuwBjCQcXqzH6CuTv6ietVvj
   Q==;
X-CSE-ConnectionGUID: lHYfuMxASg6oFkP+DMRHAQ==
X-CSE-MsgGUID: ytbUsePsT5u0IwsL9dsQQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="81013308"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="81013308"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 21:40:19 -0700
X-CSE-ConnectionGUID: tKaNZrU1R3eP5JDdY6FX6w==
X-CSE-MsgGUID: NwwpYj7MR1WsqFFM8Mdicg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="245286519"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 31 May 2026 21:40:17 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 5DBBF95; Mon, 01 Jun 2026 06:40:16 +0200 (CEST)
Date: Mon, 1 Jun 2026 06:40:16 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sebastian Loscher <krang@krang.de>
Cc: Mario Limonciello <superm1@kernel.org>, linux-usb@vger.kernel.org,
	andreas.noever@gmail.com
Subject: Re: [BUG] thunderbolt: USB4 v2 TBGAA tunnel creation crash in TMU
 enhanced uni-directional mode
Message-ID: <20260601044016.GL3102@black.igk.intel.com>
References: <13787e02-75d9-8000-65d5-41434a0e817c@krang.de>
 <20260525044421.GI8580@black.igk.intel.com>
 <8c753210-e399-4ddf-8ca4-d250fd4af369@kernel.org>
 <20260526040732.GO8580@black.igk.intel.com>
 <523ddc3e-2047-c202-482a-02d76de17cd4@krang.de>
 <20260527122624.GC3102@black.igk.intel.com>
 <536cc913-8ae8-9000-69f9-02f604b7edfe@krang.de>
 <20260529063422.GJ3102@black.igk.intel.com>
 <d8147af2-41da-ad0d-4e67-d910cccbf32f@krang.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8147af2-41da-ad0d-4e67-d910cccbf32f@krang.de>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38215-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C03F36197BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Thanks for the logs!

There is not a single hotplug to any of the USB4 ports in the log. It means
the USB4 link never comes up properly. There is wakeup happening, though
but the link is not coming up. Also there is not even USB 2.x link as far
as I can tell (USB 2.x goes over its own wires and is completely
independent on USB 3.x and USB4).

If you are using proper cable then there are still two other things that
may affect this:

  - Power supply
  - PD firmware

If you use the power supply that came with the dock then that should be
okay which leaves the PD firmware. Have you checked whether there is
firmware upgrade for the laptop or the dock available?

On Fri, May 29, 2026 at 10:05:32PM +0200, Sebastian Loscher wrote:
> Hej Mika, Mario and team,
> 
> Another tbtrace and dmesg from me after enabling thunderbolt.dyndbg=+p (and
> removing pci_port_pm). Not a whole progress here but more info.
> A comment on dmesg/tbtrace: 95s-117s plugged in once and let it settle. Didn't
> touch it until 277s where I tried three replugs, middle one in the bottom
> (rear) usb4v2 port. I recognized not change in fan speed like I described
> before. dmesg seems different and does net seem to start recognizing the other
> devides on the dock?
> 
> Hope this helps again. Thanks for your engagement
> 
> Sebastian
> 
> 
> Am Freitag, Mai 29, 2026 08:34 CEST, schrieb Mika Westerberg
> <mika.westerberg@linux.intel.com>:
> 
>  
> 
>     Hi,
> 
>     On Wed, May 27, 2026 at 09:19:56PM +0200, Sebastian Loscher wrote:
>     > Hey Mika,
>     > 
>     > Please find attached some more tbtraces (and dmesg however I think they
>     tell
>     > you less of a story).
>     > 
>     > I have the previously used cable and repeated the usual boot, plugin.
>     Then I
>     > dumped the files and rebooted and repeated with a 2nd cable (it's from a
>     three
>     > months old Lenovo and it charges with 140W, says TB in the package; the
>     > original cable came with the dock and was only unpacked the day before I
>     > reached out to you). I attached two different dumps for the 2nd, no
>     reboot in
>     > between.
>     > You wondered about the initial couple of disconnects in the logs and
>     blamed the
>     > cable - rightfully so - but here are some more details, maybe not fully
>     obvious
>     > from the logs:
>     > Onbiously there is a GPU in the dock that runs at 100% fan speed,
>     expected of
>     > course no PC tells it to do otherwise. When I plug the USB cable in there
>     is
>     > 50% chance that the fans go down in speed for a second during the initial
>     > handshake (did so with tbtrace_cable1 and cable2_2 | but fails at speed
>     > negotiation) or it just keeps spinning high (tbtrace_cable2) which seems
>     like,
>     > at least when I watched dmesg, that it doesn't go beyond the initial
>     handshake
>     > and disconnects right away. That was, in the previous test, for me the
>     reason
>     > to plugin it in and out multiple times until I could ‘hear’ something
>     more was
>     > happening.
>     > 
>     > A bit adventurous description but maybe the extra info is worth it.
> 
>     I noticed in your dmesg you have pcie_port_pm=off, can you remove that from
>     the command line, and add "thunderbolt.dyndbg=+p" instead and try again?
>     Then provide full dmesg?
>      
> 
> 
> 
> 
>  
> 




