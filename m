Return-Path: <linux-usb+bounces-34293-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEtkMwW0rmkSHwIAu9opvQ
	(envelope-from <linux-usb+bounces-34293-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 12:50:29 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA1923830A
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 12:50:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11A8830512BF
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 11:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EAD26FA5B;
	Mon,  9 Mar 2026 11:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BZNzfA5K"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4CC363C67;
	Mon,  9 Mar 2026 11:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773056993; cv=none; b=cumYdgt0Aor7Sp25anuvi0ED0pENxKMqgyLyCxIKEZsBiPR+678jlUT4lchhar2gulaTXQXZxtx0VVJPzDNWyU6Wvh0/urzSju6P4FKBaI8+nuyvsoiPjn9AWtRBoyB9gmNQoHCVlyxGd1WeXn8GVfxpsj6uTUsoPMHhnjvz5Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773056993; c=relaxed/simple;
	bh=mbqd05Mjwo/K0dlxLdJzlBnS2ntQNfu41ItR/zsLX1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=acc5pOB0YQ/CLti9YY3OtO2cQnlxwRhnw7r3LyjKDrKwBhAVN8JuXQqt0xrDIcMfZHt6mRr03p/mEQgCRUBB72BrwmkzdW2ZHI1QbOgOXqegKm7fPTebCRgN3Zk5JV14Riw4Lj3RtTA2BD4LBP5SbB7UdDIBkJE16gPB9+k1JXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BZNzfA5K; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773056993; x=1804592993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mbqd05Mjwo/K0dlxLdJzlBnS2ntQNfu41ItR/zsLX1Q=;
  b=BZNzfA5KaMXbNh9XgRDH6TVw3Q3XEBeNdshkibV01sHjf5Q3Q3JKm67i
   qTZL9+QtyCOsUan04PcRuxYDooQJQvBZjkRw17Mog/OeaWY5alzbjOIBX
   6cOvTcnPANv25+d4ooWKoIr+yRiYfTBjCt8YvNSzTAGAVIYvUQsGapgFh
   jadP6Xfr8EmBPEtgterfD/ybcLbTcwdmrn1UuG5mqnBMXLsmPyEdjv14z
   7hjpXyPvKD/xCCe/TDejpMVrPbO2xhIUaRuCyNkbqchlnTJkXFr71JRNV
   y2HvrnaH7K259Du1jAgzyYSyqeh+9WUkbjgE72yDav8bJmJlHQRB9ThWW
   Q==;
X-CSE-ConnectionGUID: ATZuM52pQk6JmADd4PB7Kw==
X-CSE-MsgGUID: J6qKBFP3TX+aqDZhQnjZSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="76678137"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="76678137"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 04:49:52 -0700
X-CSE-ConnectionGUID: uNTzsra3TLOSMKUmZNUqAw==
X-CSE-MsgGUID: UqjP1a3pR/Cub+kudEBP8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="217332667"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 09 Mar 2026 04:49:50 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id D79D898; Mon, 09 Mar 2026 12:49:48 +0100 (CET)
Date: Mon, 9 Mar 2026 12:49:48 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	usb4-upstream@oss.qualcomm.com,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC/RFT 1/3] thunderbolt: Move pci_device out of tb_nhi
Message-ID: <20260309114948.GM2275908@black.igk.intel.com>
References: <20260309-topic-usb4_nonpcie_prepwork-v1-0-d901d85fc794@oss.qualcomm.com>
 <20260309-topic-usb4_nonpcie_prepwork-v1-1-d901d85fc794@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309-topic-usb4_nonpcie_prepwork-v1-1-d901d85fc794@oss.qualcomm.com>
X-Rspamd-Queue-Id: 5AA1923830A
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
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34293-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.983];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,black.igk.intel.com:mid,intel.com:dkim]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 11:32:59AM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Not all USB4/TB implementations are based on a PCIe-attached
> controller. In order to make way for these, start off with moving the
> pci_device reference out of the main tb_nhi structure.
> 
> Encapsulate the existing struct in a new tb_nhi_pci, that shall also
> house all properties that relate to the parent bus. Similarly, any
> other type of controller will be expected to contain tb_nhi as a
> member.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/thunderbolt/acpi.c      |  14 +--
>  drivers/thunderbolt/ctl.c       |  14 +--
>  drivers/thunderbolt/domain.c    |   2 +-
>  drivers/thunderbolt/eeprom.c    |   2 +-
>  drivers/thunderbolt/icm.c       |  25 ++--
>  drivers/thunderbolt/nhi.c       | 247 ++++++++++++++++++++++++++++++----------
>  drivers/thunderbolt/nhi.h       |  11 ++
>  drivers/thunderbolt/nhi_ops.c   |  29 +++--
>  drivers/thunderbolt/nhi_pci.h   |  20 ++++

I think this patch should just make the nhi->pdev to be nhi->dev.

If there is a header needed it should be called pci.h and the corresponding
implementation pci.c (ditto for the non-PCI: platform.c).

Further more there is no need to keep the struct pci_dev anywhere we can
get that with to_pci_dev() and that allows both implementations share the
same struct nhi (no need a separate structs).

