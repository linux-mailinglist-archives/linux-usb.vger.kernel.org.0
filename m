Return-Path: <linux-usb+bounces-32574-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CljNNVrcGkVXwAAu9opvQ
	(envelope-from <linux-usb+bounces-32574-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 07:01:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F98B51D4C
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 07:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CAF933A77CA
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 06:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB82032ED28;
	Wed, 21 Jan 2026 06:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FxCjzgFM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670CC314D22;
	Wed, 21 Jan 2026 06:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768975307; cv=none; b=kp88xAxO6s1Q6FvjiSRry1gy+NmNcxLFyWIY2T+YzWHzEigsajSntJgpOzN5utm2YopQ6man1JYbjIzszQ+yA1GiHMw8OLZDkbLp/irP09enyQpInJIeQ8+qVqTKJEgha6kzi1/RtkbP270KYIAiz2XylbqY2cgm5oIrrC6f8Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768975307; c=relaxed/simple;
	bh=0zgr9M7Cf9Crj96eIxG66lBJm6FpmdGwAvmo8inyqCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ds1T1l2trvFi79+x9ThSOB6nr7vVps5gB/XW2hzmP9j8xd1IcTfk6Oo/o2L5YshwA0qmdNSWx6MdGzgYWxxS/QB3iioHsfgSd0Kdl2MroAvtXgEqlpk8tw6bUhEUyXDC2+a+oJPpWrCKWdW/0A0cu8Soit7vCuY0oxtq3vBt7QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FxCjzgFM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768975305; x=1800511305;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0zgr9M7Cf9Crj96eIxG66lBJm6FpmdGwAvmo8inyqCk=;
  b=FxCjzgFMelXMJWGUx8ret9zKv78B8MXj9COBePCMTAyYYVtiSvetK9LE
   SZwWRGPCWeyulFQ9pKHcyz6T81TN+DNYwNZPuw2KS3tz5rU+ucjMRGpan
   CPyymjw26ZzAktDBldex5C7Apa6OFU0OMttbumjn4BUQP84+t1GdEQWhN
   6FQpOtNcHHOs0XOQGZ0LGzMAPJgvkooFwnqZW/vAwB1YA9vz0Ybk+ajZ2
   uD4SzTiVidIVkTPJeeE5o3tNONtJhiBUZx7/wCGkwlljRixHjv+emJ1sZ
   hCIQUhIGywmWa6mK6TCA5JI7xn5tuEOWBV+xKpkszlSVKe/dZlxiZ259A
   A==;
X-CSE-ConnectionGUID: WDiE9Q+JRkC240EcUlJTIw==
X-CSE-MsgGUID: MdwZbfpcR7OlX6lQkWKyzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87609278"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="87609278"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 22:01:45 -0800
X-CSE-ConnectionGUID: qqAKnlQFQ6SNVXbliB6X1g==
X-CSE-MsgGUID: LdkNI9pdTG6YSLUf8wYyeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="205598612"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 20 Jan 2026 22:01:43 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 3A6A095; Wed, 21 Jan 2026 07:01:42 +0100 (CET)
Date: Wed, 21 Jan 2026 07:01:42 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Fix PCIe device enumeration with delayed
 rescan
Message-ID: <20260121060142.GJ2275908@black.igk.intel.com>
References: <20260121052744.233517-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260121052744.233517-1-acelan.kao@canonical.com>
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32574-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 7F98B51D4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Wed, Jan 21, 2026 at 01:27:44PM +0800, Chia-Lin Kao (AceLan) wrote:
> PCIe devices behind Thunderbolt tunnels may fail to enumerate when
> spurious hotplug events prevent pciehp from detecting link-up.
> 
> Root cause:
> 
> Spurious unplug events occur immediately after tunnel activation:
> 
>   [  932.438] thunderbolt: acking hot unplug event on 702:2
>   [  932.852] thunderbolt: PCIe Up path activation complete
>   [  932.855] thunderbolt: hotplug event for upstream port 702:2
>             (unplug: 0)
>   [  932.855] thunderbolt: hotplug event for upstream port 702:2
>             (unplug: 1)
> 
> These events disrupt pciehp timing, causing device enumeration to fail
> ~70% of the time on affected hardware. Manual PCI rescan succeeds,
> proving devices are present and functional on the bus.

Thanks for the report!

They are likely TB3 xHCI "plug" events or so but they should not affect
anything really.

It may be that there is something in the TB3 compatibility side that we are
not doing which needs to be investigated.

From your merged.out.bad:

CM does xHCI connect here:

[  152.905840] [182] thunderbolt 0000:c7:00.6: 702: xHCI connect request
[  152.906865] [182] thunderbolt 0000:c7:00.6: hotplug event for upstream port 702:2 (unplug: 0)
[  152.906869] [182] thunderbolt 0000:c7:00.6: 2:8: got plug event for connected port, ignoring
[  152.906872] [182] thunderbolt 0000:c7:00.6: hotplug event for upstream port 702:2 (unplug: 1)
[  152.906875] [182] thunderbolt 0000:c7:00.6: 2:8: got unplug event for disconnected port, ignoring

[  192.931373] [49] thunderbolt 0000:c7:00.6: acking hot unplug event on 2:7

Can you comment out call to tb_switch_xhci_connect() and see if that
changes anything?

> Solution:
> 
> Schedule delayed work (300ms) after tunnel activation to:
> 1. Check if pciehp successfully enumerated devices (device count increased)
> 2. If not, trigger pci_rescan_bus() to discover devices manually
> 3. Log results for observability
> 
> The delayed work approach is non-blocking and only rescans when actually
> needed, avoiding overhead on systems where pciehp works correctly.

There is no way we are going to call PCI functions from the tb.c.

