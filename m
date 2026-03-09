Return-Path: <linux-usb+bounces-34294-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Cr0Aey0rmkSHwIAu9opvQ
	(envelope-from <linux-usb+bounces-34294-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 12:54:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 890932383F1
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 12:54:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 323EB3039699
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 11:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F52739B497;
	Mon,  9 Mar 2026 11:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2kG8kuB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF2B394478;
	Mon,  9 Mar 2026 11:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057106; cv=none; b=pF4cYWcpvoTNNwHrre4asanIH0fhoFOmElwkGy99oyePy87s8I4eKGC3PlqnMRNiVVjIfmeVvkudRPQdok/HsoZuXdpa2Rkr9Apje8ERm5P9X6qCOL8mwfFrWEqrg5PrjxE3RwlRPCfrZgsSSFlt2b8almyJwDHHbLw8V/MDh9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057106; c=relaxed/simple;
	bh=TGOWc4TIFMeQMoapHRrlFhoF1jLl9EGVUKua+WdQK2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0ZssfpxXbWUVh0OUuH7bLBCheRMf/vm/KdjHc/waSqGgDI/uS+M1pikDgnybAW2e7JN5zy6/1zkE+XIkZnfEINRqcMDohx1rANgYHGRGRhjcCP9poMaAEmnKWoLLhyFj2+azmP/NU2oYsqdgdijOsFeSF93IKJJu3oouX8GO5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2kG8kuB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773057106; x=1804593106;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TGOWc4TIFMeQMoapHRrlFhoF1jLl9EGVUKua+WdQK2A=;
  b=e2kG8kuB65kEIOKjbAdTY3Xv2fZcQ+BobeGaCF7AHzetEsHQ5ISnpW4K
   w4XzODqtCd/EFGnxO7A0f3Kr0+GVoF6sZONlo5YKCtyk5DPsq7fsoP8H2
   dKSAwzoIEEqcqceGrmqNzbrPl9Dof74C4C2YGrMNLvXBo4ESvq7uiyvAN
   58fEYcJTYB4Bacnk0GjZUhOqApsGZLCBrkRogunxHRllzaFUSeVaIUfcH
   DiKrjMsFaN8BsRb0/pyKZ3RZ8U3uvorV4Y8kr0MBI1xGuwzno/n1abgis
   hvs1hilpBs6ebNmF7oih6eh9Olj75HVyQWt9rD9vXaiX8PRJyxlpiI5gE
   w==;
X-CSE-ConnectionGUID: 7ALUp6ckRly4IRCctF6Rlg==
X-CSE-MsgGUID: Yn5TbohyRPioqKQnC7tGSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77927922"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="77927922"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 04:51:40 -0700
X-CSE-ConnectionGUID: hphUmWeuSiWXT1QZa/6zMg==
X-CSE-MsgGUID: SFgBFEyoSUmqjk5+wKLGVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="224654728"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 09 Mar 2026 04:51:37 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0229C98; Mon, 09 Mar 2026 12:51:35 +0100 (CET)
Date: Mon, 9 Mar 2026 12:51:35 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	usb4-upstream@oss.qualcomm.com,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC/RFT 2/3] thunderbolt: Separate out common NHI bits
Message-ID: <20260309115135.GN2275908@black.igk.intel.com>
References: <20260309-topic-usb4_nonpcie_prepwork-v1-0-d901d85fc794@oss.qualcomm.com>
 <20260309-topic-usb4_nonpcie_prepwork-v1-2-d901d85fc794@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309-topic-usb4_nonpcie_prepwork-v1-2-d901d85fc794@oss.qualcomm.com>
X-Rspamd-Queue-Id: 890932383F1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34294-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.981];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,qualcomm.com:email,black.igk.intel.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 11:33:00AM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Add a new file encapsulating most of the PCI NHI specifics
> (intentionally leaving some odd cookies behind to make the layering
> simpler). Most notably, separate out nhi_probe_common() to make it
> easier to register other types of NHIs.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/thunderbolt/Makefile  |   2 +-
>  drivers/thunderbolt/nhi.c     | 531 +++---------------------------------------
>  drivers/thunderbolt/nhi.h     |  21 ++
>  drivers/thunderbolt/nhi_ops.c |   2 +
>  drivers/thunderbolt/nhi_pci.c | 496 +++++++++++++++++++++++++++++++++++++++
>  drivers/thunderbolt/nhi_pci.h |   2 +

So pci.c and share the struct nhi with both. All the PCI specific stuff
there in pci.c.

