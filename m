Return-Path: <linux-usb+bounces-31908-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EC8CF33EE
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 12:28:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11CE4303A947
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 11:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F40534216B;
	Mon,  5 Jan 2026 11:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HK50Lc86"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020EE341649;
	Mon,  5 Jan 2026 11:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767611981; cv=none; b=Xdi/Mj2m/EaPLithDKctdqHehUm2ZA4rt+bioW3c/J/w0rWFS0B3HEeuGrwEWKolffLBLL9b6uV3LC1Qt1qvpGsxLwoqZCvxNtKYuIKMfFi5+f5q1vPCez9zdFp7cIvK4nTDdIA544IJ5moMeqgpN3w5+CiDsg0i1VRhsJr+UTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767611981; c=relaxed/simple;
	bh=eDe/Wsp6h5jAODIem5skI8YFYYSm1LfKln4/J1hHY0s=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egPSsZWhGJd07st5rCfWrpaqf7fUcDWQdwym65iwQbd870AKsSBCZiVpgdAsN3FKv9IFzbRABadn2b2CfJP3AkuEKT5J6qucQEu9JQ0Oz2zVyqnatptHWmyhlt/H3kktuuPMWCZHcIVCcqbBhnnduIhws4usr6IxrMiVdlNJls4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HK50Lc86; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767611980; x=1799147980;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=eDe/Wsp6h5jAODIem5skI8YFYYSm1LfKln4/J1hHY0s=;
  b=HK50Lc86W4u5Wydyjq9Jajlpwf8jJetaBZ61N41ggz+3BzkkZ/ZDSokE
   7SLL9k3DbIkuitS3poeW+Sw7cwQpcux5NVfUBEgWzakCYUt/iwORZ6rkm
   xWy30U745zXIFjDoN7OlznxjQ0V/XClIfn3ABZmd7rNw0baQHlxFkK/Kh
   ysFe6yUZa35aun7JyL3os55FPBZJZibmOOhXCv7Bgqmf48b5k+rOx60NS
   fchFc3CfSN4FF8k9j1mWo6Xgumf4PK+WJf1s8AwiYxVPjSasvx2Swu9fY
   4Al4CBQduidarzWBF6Tig66nmTbzGk3+V7gEQ7xljJx4/BPjoPDt6qR9h
   Q==;
X-CSE-ConnectionGUID: g8/CdkZfS92ram7VZP2Quw==
X-CSE-MsgGUID: Mdhhi87aQv6GqibhcJeOMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68956322"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="68956322"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 03:19:39 -0800
X-CSE-ConnectionGUID: angFW0sKTLGhlMQ2jMBppg==
X-CSE-MsgGUID: FRy2L2MxRyaH0+XV65BXKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="202384903"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 05 Jan 2026 03:19:38 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id C98B395; Mon, 05 Jan 2026 12:19:35 +0100 (CET)
Date: Mon, 5 Jan 2026 12:19:35 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sanath.S@amd.com,
	"Lin, Wayne" <Wayne.Lin@amd.com>
Subject: Re: [PATCH] [RFC] thunderbolt: Add delay for Dell U2725QE link width
Message-ID: <20260105111935.GM2275908@black.igk.intel.com>
References: <5d7f2661-f02b-4985-b438-196b48c10237@amd.com>
 <CAFv23QknLmZkC9Fc0FTFKCofngRUQipw4hGVG_P2k+TUb=KOeA@mail.gmail.com>
 <20251218072125.GU2275908@black.igk.intel.com>
 <6inne3luvw4ot3wqnsaw3gzhlxtd4756i465oto6so5ox3syxp@kibuv4vhvexx>
 <20251218102021.GV2275908@black.igk.intel.com>
 <wqc6xvaeebqb5skiba3gpekdpmf3yz2zk3maeqprdtdpglvhww@za2efpacwhzo>
 <20251230073011.GD2275908@black.igk.intel.com>
 <7u6z5gp5ma2jg5zzxniupu4zuipjgxgnjydltx5cntikjtf3ww@qb62nuy7jsfk>
 <20251231060333.GK2275908@black.igk.intel.com>
 <xgreoxrfzdgeupv4q7ge7ivjwz7dll7khohm4wetjjm3waztwo@lrr2kjdjpdba>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <xgreoxrfzdgeupv4q7ge7ivjwz7dll7khohm4wetjjm3waztwo@lrr2kjdjpdba>

On Fri, Jan 02, 2026 at 10:03:12AM +0800, Chia-Lin Kao (AceLan) wrote:
> > You only have one of those monitors? It would be good to check with another
> > if it has the same issue. I have GR reference device here which is what
> > this monitor is based on but I don't see any unplugs or link issues. I will
> > ask around if we have somewhere this monitor.
>
> Here is another BenQ 5k thunderbolt 4 monitor, and I can't reproduce
> the issue with this monitor, even with the AMD machine.
> 
> https://people.canonical.com/~acelan/bugs/tbt_call_trace/intel/merged_6.18.0-d358e5254674+.benq.out

Okay thanks! We have one Dell GR based monitor here (not the same as yours)
and a Lenovo GR based one. I asked the folks to try to repro the issue and
will share the results once I get them.

