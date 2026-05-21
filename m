Return-Path: <linux-usb+bounces-37876-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CRICVz9DmrrDwYAu9opvQ
	(envelope-from <linux-usb+bounces-37876-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 14:41:00 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B425A4F7E
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 14:40:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 803993027D9D
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 12:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114793D0907;
	Thu, 21 May 2026 12:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="US8d7gty"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F613CA49C;
	Thu, 21 May 2026 12:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779366865; cv=none; b=DKK4GtzE9YAytBogxFPl7aD/40EcYf7AGIEYGB1wWm3eAjT3BpX3MLkRbRdzyEvJO+oeL14+Pwgn+cKHYSPkZAWcDjWlDbljJygwWy36ej1wYcKdCw5cysMr3VWMJvSoWa8e23n1Ml/fxTGAC807vetJdsXVkfxs5WsegMpziYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779366865; c=relaxed/simple;
	bh=z/4N58a6oXIm00f3JVt8miIjNvtLxzzYqK2n83hetBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rv2b7hzmkr9t6oeb1V0JkT64pNkRP/pD61ThlEDYE7O5v1WeeKaj0U+kpua8zXu7skN0PCWkP+BdmcvdqmoJ0XVguKnzlhZ7qEK6alZDsvRAi3LABkthvE7pPP1sExjqdFF/rPILbA4+zSeXR5KZ6G+8QmsVcUwVxSCaipftdSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=US8d7gty; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779366864; x=1810902864;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z/4N58a6oXIm00f3JVt8miIjNvtLxzzYqK2n83hetBQ=;
  b=US8d7gtydNWCPFA+Mc0VPziGqdif9XCiwbxxxjFZF24Nx7uFcngdTdj4
   qoLYwGXca+T0bKoRDVpY5s1qahXfxW1br77cVmpww3cIXqYwEMFfFDf69
   +mvzyZmHWPYNCQfksndaLY8mSLC9zfJDdYIQ+Q9tLy2PywKUrcOVS6Qwv
   eqH6rJlxQ+xYEQ9cjb5zeU+UPfRXdywnyE0K8s5CR4I5/gUHtM2eFh3l8
   JXN+g+GTdjhu85LrJ+JC27ZC0r89bq7Uq43vy9gLyHKCP1vltPEdmYuaS
   T22vy/lDUdOPKQ7Ng5c7ZN0grufMMwGHX3b6NGu+GZlhbAknvIbEQMRt8
   Q==;
X-CSE-ConnectionGUID: kgLZ61p/RMqqLlSznh0sQA==
X-CSE-MsgGUID: aMFu1yijSyK0bZlOLC1+mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80012585"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="80012585"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 05:34:24 -0700
X-CSE-ConnectionGUID: DL79mygsRvC/pqeCZBv9+w==
X-CSE-MsgGUID: sCuWiXQrSzqo4U9G/GUmCA==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 21 May 2026 05:34:21 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 7A22395; Thu, 21 May 2026 14:34:20 +0200 (CEST)
Date: Thu, 21 May 2026 14:34:20 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	usb4-upstream@oss.qualcomm.com,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/4] Prepwork for non-PCIe NHI/TBT hosts
Message-ID: <20260521123420.GH8580@black.igk.intel.com>
References: <20260521-topic-usb4_nonpcie_prepwork-v5-0-b67dbe7508e8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521-topic-usb4_nonpcie_prepwork-v5-0-b67dbe7508e8@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-37876-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[black.igk.intel.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim]
X-Rspamd-Queue-Id: 90B425A4F7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Konrad,

On Thu, May 21, 2026 at 12:39:59PM +0200, Konrad Dybcio wrote:
> Konrad Dybcio (4):
>       thunderbolt: Move pci_device out of tb_nhi
>       thunderbolt: Separate out common NHI bits
>       thunderbolt: Require nhi->ops be valid
>       thunderbolt: Add some more descriptive probe error messages
> 
>  drivers/thunderbolt/Makefile    |   2 +-
>  drivers/thunderbolt/acpi.c      |  14 +-
>  drivers/thunderbolt/ctl.c       |  16 +-
>  drivers/thunderbolt/domain.c    |   2 +-
>  drivers/thunderbolt/eeprom.c    |   2 +-
>  drivers/thunderbolt/icm.c       |  24 +-
>  drivers/thunderbolt/nhi.c       | 520 ++++++---------------------------
>  drivers/thunderbolt/nhi.h       |  33 ++-
>  drivers/thunderbolt/nhi_ops.c   | 185 ------------
>  drivers/thunderbolt/pci.c       | 622 ++++++++++++++++++++++++++++++++++++++++
>  drivers/thunderbolt/switch.c    |  41 +--
>  drivers/thunderbolt/tb.c        |  18 +-
>  drivers/thunderbolt/tb.h        |  10 +-
>  drivers/thunderbolt/usb4_port.c |   2 +-
>  include/linux/thunderbolt.h     |   8 +-
>  15 files changed, 805 insertions(+), 694 deletions(-)

All applied to thunderbolt.git/next, thanks!

