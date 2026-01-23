Return-Path: <linux-usb+bounces-32645-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEPwDipjc2mivQAAu9opvQ
	(envelope-from <linux-usb+bounces-32645-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 13:01:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A219B757FC
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 13:01:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FAB33028B25
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 12:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75CB931AABF;
	Fri, 23 Jan 2026 12:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D/XnVz3S"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DBF1487F6;
	Fri, 23 Jan 2026 12:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769169678; cv=none; b=Rb90Kry+oY9vKFREPC/0gWT6KPfIa4HwJQ7rAulXhu776v+uQfQ00I4DJnZnyXq/U8eBvMRsVoS133xwNWNkxucr+hdcy5DLwUgnHkdjli7oL0RQWqOyvO4TFB8au2qbTKTi3sfZbgzCVRtK896PSBgXKTscPP1Uf349yP1leTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769169678; c=relaxed/simple;
	bh=ppdXhpszDqU7oDEokp3wK1Mk2J0NUUwXZ400mMcamoU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETlK6wzH2IBVj4np3iiyrdN7M8jwAmw5ZeUIsQvWL4INx7RtgDnEFiJaaRdKChErbAbdv0yYs7vECVt4+H71FDkbNmBevcKeV9Bh/qeoIlfqQgdmNncQzo8uoqBoLq08KZgfwVbrhbltKYIFiv2DHWJMOnMFEiE65ZnOeR0ZcxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D/XnVz3S; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769169677; x=1800705677;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=ppdXhpszDqU7oDEokp3wK1Mk2J0NUUwXZ400mMcamoU=;
  b=D/XnVz3SGDyrvzf3rkHhSqUdwfzbJtC5XXOd9I/Y+4TvEpSVd2v8LIrK
   Dmv0fyv23lb9ANDjSTY7qkJtfoyx0QL6IPfDEX92LLsqflNZCku3QTNL4
   zdpBLWeUPoPcyCyFA5Bbn0u5sUmhiVanDw1GVoRhZ1fZoN7kwDTD1IVbr
   +T6ZZ3KJKTnBZRolYbAFKS86FnSgdAaZXUswGEk6D7usqHSJHtebqhosh
   e1uPtBrUi4Vzr7y3CJmtfoqG1uaFLnZi5ARnkFTHJht80hu6UiF75yVQL
   53bQ/auFMEizYe+74geOpMitp8iF0JXGzMn379jbqBYcr7oNPGlnz/Fm4
   Q==;
X-CSE-ConnectionGUID: BTQwLylyQoeFz7Ls118EaQ==
X-CSE-MsgGUID: 6uKD/X6UR1qtHw8L1n90XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81534106"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="81534106"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 04:01:16 -0800
X-CSE-ConnectionGUID: olvj1KHIS6iC6aXfRqinOw==
X-CSE-MsgGUID: 41IVTotsRU+IJUigqvVMBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="211471452"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jan 2026 04:01:14 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A78DF98; Fri, 23 Jan 2026 13:01:12 +0100 (CET)
Date: Fri, 23 Jan 2026 13:01:12 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Fix PCIe device enumeration with delayed
 rescan
Message-ID: <20260123120112.GQ2275908@black.igk.intel.com>
References: <20260121052744.233517-1-acelan.kao@canonical.com>
 <20260121060142.GJ2275908@black.igk.intel.com>
 <aXLM5vk0gDNjLPyY@acelan-Precision-5480>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aXLM5vk0gDNjLPyY@acelan-Precision-5480>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32645-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[canonical.com,gmail.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: A219B757FC
X-Rspamd-Action: no action

Hi,

On Fri, Jan 23, 2026 at 10:04:11AM +0800, Chia-Lin Kao (AceLan) wrote:
> > Can you comment out call to tb_switch_xhci_connect() and see if that
> > changes anything?
>
> Here is what I modified, and the problem becomes a little bit complicated.

Okay I see it did not change anything (well this is kind of what I
expected). Thanks for trying.

I see in your log that the PCIe tunnel is established just fine. It's just
that there is no PCIe hotplug happening or it is happening but the PCIe
Downstream Port is not waking up.

I figured you have following USB4/TB topology, right?

  AMD Host <-> GR Hub <-> TB3 Hub
                  ^
                  |
                TB3 Hub

What if you run 'lspci' after the issue reproduces? Does that bring the
missing PCIe devices? I suspect that this is due to older TB3 devices that
they may need bit more time to get the PCIe link (going over the tunnel) up
and running.

