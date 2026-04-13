Return-Path: <linux-usb+bounces-36172-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBZmLFJz3Gn1RAkAu9opvQ
	(envelope-from <linux-usb+bounces-36172-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 06:38:42 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ED93E74F6
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 06:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28FF0300B54F
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 04:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E713637C911;
	Mon, 13 Apr 2026 04:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fvEabAN9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF50220F49;
	Mon, 13 Apr 2026 04:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776055118; cv=none; b=Um7dDcD3MH2N6/XX9PHG40+7z2CHs8DKsEg1nTPCWvFfoZXyRmSwqXRdBkL6vTBxFaxVypJZ3OdgP9BayNy6yQCwsVey6bU7n3z356NMdE28TI8Ps7Il8smyWk+LJ1DF0ZZTRnKsnHahfC+MGRgZILjSptYoK7FcdmdreSH+X6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776055118; c=relaxed/simple;
	bh=BbUT5P0ogpEuUHCthnUEl228oMGgMxT0Dyb+vQIEKYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOL2070Muht/QNXY5hQ3I+WfIvS1fZKS/bhioACOlraipD1Z1hWt464T5Xe9t1OGGdBrfj3a379IyaiTgtQJDYjQ+OawsfM7WoybuyuqlvKBPEsrROqzjCfbj7JpqksIWA07QCJs2d45xo23Ihe3nJ1h+iNae88QehjnNfIEQMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fvEabAN9; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776055117; x=1807591117;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BbUT5P0ogpEuUHCthnUEl228oMGgMxT0Dyb+vQIEKYg=;
  b=fvEabAN9/VnRtxnlULyx0xR1K0hJ/ViCNXe4+IxmaMWQQhf9K116PjPV
   kZplmctRgK9t7iDE0jyOlDrjbulF+bwkklzv4T+Uj5YZSJ/qtq0kCquex
   MBAcIuqwy4cmLS43yBjfKQiDpV9jmpj8tzakSOuIWLBGGVoslPJ1uQaD7
   KcK4gerYf60yP3C+mOip/Eg7oZEO5Rt2uol32M4mOcbNj/tZ2xfOZQhu8
   EoP5IN7itn2WJLLbO6vUV1/3in/lKynefBbE7waAZjcocChxBPsw3feQg
   MnCbM4Sy5Y8gAaMu5EgAa5g5xq9OM9/TBaR70vH08pA+G7b8fZSm0r6VB
   g==;
X-CSE-ConnectionGUID: p8EAsq0lR9eQaLt96t6knA==
X-CSE-MsgGUID: q2W6rfbpSSeWF9TPT77kXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="87685753"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="87685753"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 21:38:36 -0700
X-CSE-ConnectionGUID: Hp6f6+CcRLOCBaGJafLrmA==
X-CSE-MsgGUID: I7w1KE4ARoGDM+llbZgTRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="233708485"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 12 Apr 2026 21:38:34 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1489395; Mon, 13 Apr 2026 06:38:32 +0200 (CEST)
Date: Mon, 13 Apr 2026 06:38:32 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	usb4-upstream@oss.qualcomm.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: debugfs: Don't stop reading SB registers if
 just one fails
Message-ID: <20260413043832.GN3552@black.igk.intel.com>
References: <20260409-topic-tbt_sb_debugfs-v1-1-131540e0cc2b@oss.qualcomm.com>
 <20260409120457.GH3552@black.igk.intel.com>
 <75c962d1-7ade-483b-bbc9-a6c6140fc0e9@oss.qualcomm.com>
 <20260409143203.GI3552@black.igk.intel.com>
 <7d65539f-ece6-4e7c-a13e-6b12920346fa@oss.qualcomm.com>
 <f1af27b6-e166-46b9-91d3-5e293fd6d74b@oss.qualcomm.com>
 <20260410151007.GM3552@black.igk.intel.com>
 <1f774a46-3080-4541-8573-d2a7023bbb13@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1f774a46-3080-4541-8573-d2a7023bbb13@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,oss.qualcomm.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36172-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 15ED93E74F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 07:27:34PM +0200, Konrad Dybcio wrote:
> On 4/10/26 5:10 PM, Mika Westerberg wrote:
> > On Fri, Apr 10, 2026 at 04:43:54PM +0200, Konrad Dybcio wrote:
> >> On 4/10/26 4:29 PM, Konrad Dybcio wrote:
> >>> On 4/9/26 4:32 PM, Mika Westerberg wrote:
> >>>> On Thu, Apr 09, 2026 at 02:59:22PM +0200, Konrad Dybcio wrote:
> >>>>> On 4/9/26 2:04 PM, Mika Westerberg wrote:
> >>>
> >>> [...]
> >>>
> >>>>>> I assume you have tested this on a hardware that supports this too, right?
> >>>>>
> >>>>> Hardware that exposes that register this does not exercise the altered
> >>>>> code path.
> >>>>
> >>>> Well it may happen now that previously we got -EIO from some other register
> >>>> and we stopped there, now this changes and we actually continue reading so
> >>>> this definitely should be tested.
> >>>
> >>> The only register before USB4_SB_GEN4_TXFFE that isn't in-spec for
> >>> both retimers in v1.0 and v2.0 is USB4_SB_LRD_TUNING (0x07). The PS8830
> >>> interestingly reports all zeroes (not a bounce).
> >>>
> >>> The registers following USB4_SB_GEN4_TXFFE in the array are
> >>> USB4_SB_VERSION and USB4_SB_DATA. The former is not accessed anywhere
> >>> else in the code, at first glance. The latter is, during NVM r/w and
> >>> in margining ops, which have definitely been in use for a long time.
> >>>
> >>> Plus both of them are the v1.0 spec. The USB4_SB_GEN4_TXFFE specifically
> >>> isn't (the retimer supplement pdf lists it as Rsvd, the main spec pdf
> >>> omits it in the SB register table), as it wasn't previously useful (since
> >>> Gen4 came about in v2.0).
> >>>
> >>>
> >>> I don't think there's an easy way to limit the reading of this register
> >>> since the bit indicating Gen4 capability is in USB4_SB_LINK_CONF (0x0c),
> >>> which is Rsvd on retimers regardless of the spec revision. A connected
> >>> port could easily have higher/lower capabilities, too.
> >>
> >> Checked again, the USB4_SB_FW_VERSION (0x02) register's lowest 8 bytes
> >> are 0/1 for retimers implementing USB4v1 and 2 for v2, so we may go this
> >> path too
> > 
> > I also checked from Retimer 1.0 spec and there it is still "Reserved. May
> > have non-zero value". Probably not good to rely on that.
> 
> In Table 4-3 below that definition, it says:
> 
> """
> Shall be set to 00h or 01h
> 
> It is recommended that this field be set to 01h.
> """

Oh yeah missed that.

> But we can revisit limiting those reads another day

Agree.

