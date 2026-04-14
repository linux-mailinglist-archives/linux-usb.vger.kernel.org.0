Return-Path: <linux-usb+bounces-36233-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8N8iNbU23mlxpQkAu9opvQ
	(envelope-from <linux-usb+bounces-36233-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 14 Apr 2026 14:44:37 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3073FA1C1
	for <lists+linux-usb@lfdr.de>; Tue, 14 Apr 2026 14:44:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8517F3096128
	for <lists+linux-usb@lfdr.de>; Tue, 14 Apr 2026 12:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E3D3E556D;
	Tue, 14 Apr 2026 12:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dCEkRF16"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1114E3E5ECE;
	Tue, 14 Apr 2026 12:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776170393; cv=none; b=GjLL0zs4SX11PE8APxdYK9PvONE6bpG/NBnz1jZgi3ZYUqQ6YWHs6fU7pr99bhod4mY+G3okRWPPKYJh6siG+UAtzxD4uJwuZFWBIC/D1BZDWCveBWUhku2V33XB3z0+IuLDzUpRQncykXTEonZFL2jt7eg8QyhYj81kgleUl8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776170393; c=relaxed/simple;
	bh=FNaDUpmHuSZWoiSHVvGXLyLouLYIWi3b34Km6GgwrdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFOw1iWnvD9S1bhy29E+GJaZXD93df4GYSgZYiKY8w/wyQf/zxvbYTUhVxiopWOGHnpKWfY5V/IkZmoy5dTQrNsL4Qh+FOqbx4ETuwwG3zgwHfzfFjuFgBTCIptCA2H1IRuKlg6xL8UKEaGSNtf8mnFxHQqJnX0Uotk/A/q4yjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dCEkRF16; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776170392; x=1807706392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FNaDUpmHuSZWoiSHVvGXLyLouLYIWi3b34Km6GgwrdM=;
  b=dCEkRF16y9EuquG8Qe1+t5jqiF3AEgiaT7aG0OaiXJjAAustSzpUTGYx
   jZpSJmxVBZPfH430Fcr6YgLz9SOgJb8FD5GwyXxhbYiTZ8ujYzyYtWYJ4
   9YEBnUmhT29Q34N78eduMvokgtOckDsV2Un1Cf4cBztaMTfyUmu8ubraS
   /xyuIxjt3WTvkXLGqApqoYrw7JAyi6OYKuYY7olW7BbFg5IdKYNezvGn2
   q0ur40oP9kPlYHXvoEOGKwJ2o2rfautT6LkXZ++hCpgFoQxBmQ0LHosDp
   jHB0n5BMH7RaHQVTTcqy/J6uWP7EqybozB/QVO2FrPeg1cY/sDEdCwprh
   w==;
X-CSE-ConnectionGUID: ixFHGLgwRJmrFd8rNMREqg==
X-CSE-MsgGUID: iDw8xyiQRrmXX5iTn6th5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="80988971"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="80988971"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 05:39:52 -0700
X-CSE-ConnectionGUID: U0JpRi5tSzak7LCdxDvRuw==
X-CSE-MsgGUID: 8W/t/WaHTSmvW69KHabRjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="230014489"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 14 Apr 2026 05:39:50 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 2792E95; Tue, 14 Apr 2026 14:39:49 +0200 (CEST)
Date: Tue, 14 Apr 2026 14:39:49 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Skip mapped PCIe down port when config read
 fails
Message-ID: <20260414123949.GQ3552@black.igk.intel.com>
References: <20260414113735.51730-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260414113735.51730-1-acelan.kao@canonical.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-36233-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 0B3073FA1C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Tue, Apr 14, 2026 at 07:37:35PM +0800, Chia-Lin Kao (AceLan) wrote:
> tb_find_pcie_down() uses tb_pci_port_is_enabled() to check whether a
> mapped downstream PCIe port is already in use before returning it for
> tunnel activation. tb_pci_port_is_enabled() returns false both when the
> port is genuinely disabled and when tb_port_read() fails (e.g. -EIO).
> 
> After resume on TBT5/PTL hardware the host router is not immediately
> accessible. A config read on the mapped port returns -EIO. This causes
> tb_pci_port_is_enabled() to return false, making tb_find_pcie_down()
> treat the still-mapped port as free. tb_tunnel_activate() is then
> called on this already-mapped port, fails with -EIO, and logs:
> 
>   "PCIe tunnel activation failed, aborting"
> 
> The display connected via the Thunderbolt dock is then lost until the
> dock is unplugged and replugged.
> 
> Fix this by inlining the config read in tb_find_pcie_down() and
> distinguishing three outcomes:
>   - Read succeeds, PE bit set   -> port in use, skip (goto out)
>   - Read succeeds, PE bit clear -> port free, return it
>   - Read fails                  -> hardware not ready, skip (goto out)

There should really be no "hardware not ready" when the host router is
enumerated. Lets try to figure out what is happening there.

Can you enable tracing, reproduce and send me full dmesg + trace?

You can do it like:

# tbtrace enable

Then repro, and then:

# tbtrace disable
# tbtrace dump -vv > trace.out

and send me that and full dmesg.

