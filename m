Return-Path: <linux-usb+bounces-31358-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4205CB24FC
	for <lists+linux-usb@lfdr.de>; Wed, 10 Dec 2025 08:43:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94D37312C9B0
	for <lists+linux-usb@lfdr.de>; Wed, 10 Dec 2025 07:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F6727FB2B;
	Wed, 10 Dec 2025 07:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fnB35sc7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB03C314B77;
	Wed, 10 Dec 2025 07:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765352501; cv=none; b=iEDmsyHlycQ0czr/8gub4tn0EzPFCtvBP3yTdUjXM60efiNn0CI/WuN/1b7Vlw1Np8gS8JkqpcT7Nq1XNy+WanmVQTB2LEPiwnE+/TNMtEZHnbnMNv4cyCHitWTwGOTPkjbXLLjEeCl/46TCMIXJu+YTx3KOvSH+3/rKxb6CQ38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765352501; c=relaxed/simple;
	bh=8WbAGgr48100T8ccLv9jAJJpJfhzxAtqbDDYnAN6wnY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZEYHA1t+htYguU4VkvnRlRfO4SJvvt+9eUZCLoTJdCuTEWvXyxXm9Xs9AxWSTJLu8p0QsBlOCVT3EaJSfvjuo1QBoT9O75dLpr7sfxnrMOYAMNQIdkEYUs2Q15s6E63cwaDBVTUZp68CylCkrR6KJOM/JUGulketJiqzcK9LMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fnB35sc7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765352499; x=1796888499;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=8WbAGgr48100T8ccLv9jAJJpJfhzxAtqbDDYnAN6wnY=;
  b=fnB35sc7ozzlDEqT5qwzSnFq5b2+08JxSCfipXCWfmPKFqpkt0dnmxwW
   3VURIFKf622fv6/5oSrVA9EZolERqjSQ7ExFtJR8C/5ofPHVdALMBMCci
   vq/W+DQiiEoUTeoDXTeK80VwtBbcRS3p3HqfbKtdtLMIRzAKYwZz6BZQK
   lwBv/3AuA4xK20gwSb4d57rouAM//gDU9yFI/iGPU7XcBneF8vC7RtFYs
   XdL8p62lDBHWfFPIrNwzvfqxrPprrmFQ7HqkMqgTa0fNMOBJvo6z1OkNr
   pxiqLATPI9/j6CaiILO5xZm9vWJ45Yxxp90dwDj7+ePQkK0z4PIfX6f0s
   Q==;
X-CSE-ConnectionGUID: lDe9Ht39QZqkf0OYQAbvoQ==
X-CSE-MsgGUID: 8QJyLyv7RPKpmhsbT1Hscw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="78786660"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="78786660"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 23:41:36 -0800
X-CSE-ConnectionGUID: OtEltwbFSju4zzU7wuMgwQ==
X-CSE-MsgGUID: NkPWW8rESiu6KrI7ZlcDvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="200868474"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 09 Dec 2025 23:41:34 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id E735293; Wed, 10 Dec 2025 08:41:33 +0100 (CET)
Date: Wed, 10 Dec 2025 08:41:33 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>, Sanath.S@amd.com
Subject: Re: [PATCH] [RFC] thunderbolt: Add delay for Dell U2725QE link width
Message-ID: <20251210074133.GE2275908@black.igk.intel.com>
References: <20251209054141.1975982-1-acelan.kao@canonical.com>
 <20251209070633.GA2275908@black.igk.intel.com>
 <pjn5d7oz433z4jph6whdalhowf652xknnk2fh5q7elffgb5ogo@7dtpvywxc6nw>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <pjn5d7oz433z4jph6whdalhowf652xknnk2fh5q7elffgb5ogo@7dtpvywxc6nw>

Hi,

On Wed, Dec 10, 2025 at 11:15:25AM +0800, Chia-Lin Kao (AceLan) wrote:
> > We should understand the issue better. This is Intel Goshen Ridge based
> > monitor which I'm pretty sure does not require additional quirks, at least
> > I have not heard any issues like this. I suspect this is combination of the
> > AMD and Intel hardware that is causing the issue.
> Actually, we encountered the same issue on Intel machine, too.
> Here is the log captured by my ex-colleague, and at that time he used
> 6.16-rc4 drmtip kernel and should have reported this issue somewhere.
> https://paste.ubuntu.com/p/bJkBTdYMp6/
> 
> The log combines with drm debug log, and becomes too large to be
> pasted on the pastebin, so I removed some unrelated lines between 44s
> ~ 335s.

Okay I see similar unplug there:

[  337.429646] [374] thunderbolt:tb_handle_dp_bandwidth_request:2752: thunderbolt 0000:00:0d.2: 0:5: handling bandwidth allocation request, retry 0
...
[  337.430291] [165] thunderbolt:tb_cfg_ack_plug:842: thunderbolt 0000:00:0d.2: acking hot unplug event on 0:1

We had an issue with MST monitors but that resulted unplug of the DP OUT
not link going down. That was fixed with:

  9cb15478916e ("drm/i915/dp_mst: Work around Thunderbolt sink disconnect after SINK_COUNT_ESI read")

If you have Intel hardware still there it would be good if you could try
and provide trace from that as well.

