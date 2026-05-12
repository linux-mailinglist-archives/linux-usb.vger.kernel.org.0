Return-Path: <linux-usb+bounces-37338-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2C86Nr0/A2rO2AEAu9opvQ
	(envelope-from <linux-usb+bounces-37338-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 16:57:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F62152316C
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 16:57:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D03503201629
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 14:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC85A3A7192;
	Tue, 12 May 2026 14:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kTGzg6Xq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CB43A59B7;
	Tue, 12 May 2026 14:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778594534; cv=none; b=SMt3PWu4BwrQQIANv2VjeGkiOh2EX3qMNGjh21djphxiXRrBuXkFbiysXvMWwAFTf4Ag/mNZi0YtWfpA8oSmbAr0ApIMCGZnjQLcNl2+nxEY/ma9pvJ/AfZbxalsWqCdcuOf3JP9qsy8e8cCJCQrZRr6geEKr+bv8bd7vebvGNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778594534; c=relaxed/simple;
	bh=sAD+JEWo3FCqfAWaC6f6Qa6Mg2qjA4rWTa25pm+Acwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nzu71HCvatECumDiLBF/KDC3Y1Nl9ndaYq+0tNEPVm4AURB0egWV9vMtIlE2q35QbZghANLu/AzjXMcrhsIdQCJbNtTlA62By2K02BNVqL6W9iwfuYCCv8L56QUh3Q3AvS+vW+YmiFc5GYq+p5U3++RTaQuLas6dtlix/1T3dJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kTGzg6Xq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778594533; x=1810130533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sAD+JEWo3FCqfAWaC6f6Qa6Mg2qjA4rWTa25pm+Acwc=;
  b=kTGzg6XqFcPCRQIbCTIzHSeO22HlZr35xnESQ74rV4aQR8pd/GrUOX8q
   /lA1ViAbQ9Mmo5JLjOMoLWtfWaFywbhR32wyMn5JSvE0NIadHzTSFmhWc
   guYbP+b+QArmZCYvi0nolXhDY4mIj3aq8J21xzHwjyW5rkklb1Zgvv0h/
   xdzS0geVT/ZX8Ncxa/Upw6UVyy1pHQfVdhMtrdg8J29UpdW1cg9B3kjnC
   IS3KV9k7MA4/bplwf0RGzfH8U5qejXhMvgEu5/xr+Me8hI/p1cWnNrd9X
   iuG+0oImxtjCOSuNxJaU966ue8dHzwCXRdfOTYgmWfhzmN3PGzg59lw5b
   Q==;
X-CSE-ConnectionGUID: HHgWwndPTSCYkQ2QQshNvQ==
X-CSE-MsgGUID: I1zFR2tVQJmZdb+y+3jiBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="82069827"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="82069827"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 07:02:12 -0700
X-CSE-ConnectionGUID: i85guJCwQOKSQTkyBj0MfA==
X-CSE-MsgGUID: hUlFft3ITWONubIPkj/5TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="237864181"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 12 May 2026 07:02:10 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1308898; Tue, 12 May 2026 16:02:09 +0200 (CEST)
Date: Tue, 12 May 2026 16:02:09 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	usb4-upstream@oss.qualcomm.com,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>
Subject: Re: [PATCH v2 2/4] thunderbolt: Separate out common NHI bits
Message-ID: <20260512140209.GE84797@black.igk.intel.com>
References: <20260428-topic-usb4_nonpcie_prepwork-v2-0-452fb9d63f77@oss.qualcomm.com>
 <20260428-topic-usb4_nonpcie_prepwork-v2-2-452fb9d63f77@oss.qualcomm.com>
 <20260504065402.GB6785@black.igk.intel.com>
 <7aab3f25-7609-499a-b701-8301719b9a82@oss.qualcomm.com>
 <20260512132008.GC84797@black.igk.intel.com>
 <80e0bd64-c99d-4dee-9417-3036f72658f2@oss.qualcomm.com>
 <20260512135433.GD84797@black.igk.intel.com>
 <253ad0dc-1fc3-4e6f-841b-c7e9fd7320c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <253ad0dc-1fc3-4e6f-841b-c7e9fd7320c7@oss.qualcomm.com>
X-Rspamd-Queue-Id: 4F62152316C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37338-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,black.igk.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 03:58:34PM +0200, Konrad Dybcio wrote:
> On 5/12/26 3:54 PM, Mika Westerberg wrote:
> > On Tue, May 12, 2026 at 03:43:12PM +0200, Konrad Dybcio wrote:
> >> On 5/12/26 3:20 PM, Mika Westerberg wrote:
> >>> On Tue, May 12, 2026 at 03:06:58PM +0200, Konrad Dybcio wrote:
> >>>> On 5/4/26 8:54 AM, Mika Westerberg wrote:
> >>>>> Hi,
> >>
> >> [...]
> >>
> >>>>>> +/*
> >>>>>> + * During suspend the Thunderbolt controller is reset and all PCIe
> >>>>>> + * tunnels are lost. The NHI driver will try to reestablish all tunnels
> >>>>>> + * during resume. This adds device links between the tunneled PCIe
> >>>>>> + * downstream ports and the NHI so that the device core will make sure
> >>>>>> + * NHI is resumed first before the rest.
> >>>>>> + */
> >>>>>> +bool tb_apple_add_links(struct tb_nhi *nhi)
> >>>>>
> >>>>> Okay you moved it here good. I think we can call it in nhi_pci_probe()
> >>>>> directly so no need to expose outside.
> >>>>
> >>>> Yeah that seems like a good idea. It's already there, behind N calls
> >>>> in the software CM case.
> >>>>
> >>>> Do we have to check the CM type though, or do you think it'd be fine
> >>>> to just call it unconditionally? (either because there are presumably
> >>>> no Apple machines with ICM or because these devlinks would be harmless?)
> >>>
> >>> I think you can call it unconditionally. It only does something for TB1-2
> >>> Apple systems.
> >>>
> >>> For Apple TB3 we used to start ICM firmware but this was changed as the
> >>> driver learned SW CM. However, we never setup any device links so this
> >>> would not change anything.
> >>
> >> OK. I'm keeping tb_acpi_add_link() as-is, since that's both bus- and
> >> arch-independent.
> >>
> >> However, doing just something like:
> >>
> >> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> >> index cb5d028de3bc..f5ddc8ddb8bb 100644
> >> --- a/drivers/thunderbolt/tb.c
> >> +++ b/drivers/thunderbolt/tb.c
> >> @@ -3327,7 +3327,7 @@ struct tb *tb_probe(struct tb_nhi *nhi)
> >>          * before the PCIe/USB stack is resumed so complain here if we
> >>          * found them missing.
> >>          */
> >> -       if (!tb_apple_add_links(nhi) && !tb_acpi_add_links(nhi))
> >> +       if (!tb_acpi_add_links(nhi))
> >>                 tb_warn(tb, "device links to tunneled native ports are missing!\n");
> >>
> >>
> >> diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
> >> index ca50e3584cac..e0abd1d503c5 100644
> >> --- a/drivers/thunderbolt/pci.c
> >> +++ b/drivers/thunderbolt/pci.c
> >> @@ -294,6 +294,8 @@ static int nhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >>  
> >>         pci_set_master(pdev);
> >>  
> >> +       tb_apple_add_links(nhi)
> >> +
> >>         return nhi_probe(&nhi_pci->nhi);
> >>  }
> >>
> >>
> >> Will cause the warning to show up. And adding something like
> >> `nhi->device_links_done` is a little ugly.. Ideas?
> > 
> > Ah in Qualcomm case? We are going to add tb_of_add_links() as well, right (or
> > something along thoese lines)? Then tb.c does:
> > 
> >        if (!tb_acpi_add_links(nhi) && !tb_of_add_links(nhi))
> >                  tb_warn(tb, "device links to tunneled native ports are missing!\n");
> > 
> > In the meantime it is okay to have that warn because we really do want to
> > have those links in place :)
> 
> No no, I meant that with the diff above, tb_apple_add_links() failing
> would not lead to any warning messages, and it would always hit the
> warning in tb.c

Got it. Right. Let's then keep it as is for now (e.g don't move it from
tb.c).

