Return-Path: <linux-usb+bounces-38098-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOYZLdzkFmpIvAcAu9opvQ
	(envelope-from <linux-usb+bounces-38098-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 14:34:36 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ADF5E43DA
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 14:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 246BF302D0AC
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 12:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448A83FB07B;
	Wed, 27 May 2026 12:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="exrTDZzo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5F43F86E1
	for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 12:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779884789; cv=none; b=DVmKUk9HAhx1aZQnnhHbWa2vHnsEr/UHA917KG/4bIFjK/2ugLEaA9EQz+vZ0oGrP8MNKRP1o6Er+oiY00F463OC2oweK92IsHhO5NrswwsuqRDB5zPofnmk7hO9gokOBS+NFQj5tSrGW9UHqVpLKOm+inrYmWJP3RhjOOWR4ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779884789; c=relaxed/simple;
	bh=6x3J5o/HrP6mCkDUkisv8Kg1zJaivr5HjSv6rbJZv7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Me2+xTTnP19dgn38sZFs2O0FExRpt5zPDwHMmFtmVS2Izh40HEfETFwNOFtCVygIPk+hnu5CxVLY0Mp0oB2jx7ZgJxyzjsogpmi8WJmssdvm6GdsbnJC+0lKLBkFq15O/EssY1ErDcTQEJZfdbUf5ob71cCmfqJ8Jiqk5u8HTXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=exrTDZzo; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779884788; x=1811420788;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6x3J5o/HrP6mCkDUkisv8Kg1zJaivr5HjSv6rbJZv7M=;
  b=exrTDZzoEX4C3WPHhcczlhGrGrkMbdcONuIYuXhagB8si56fFF/CmZwL
   4Fv0pDje6H3FFp3mbZTNqTpPsS8WZE4NxKUKpIdsc2/QEsyArfZ3Qmrtc
   9L6ytvjyt3FKVE8/tGjbTixkX2cigXPDQJEzLfOhiEQHsEEfYi1c505gc
   A97r8FHvxuvXu215vsvRHm2+4waXDydNPBK4MALKO9F6+orHjCUR7NHEk
   cQMuWRIoasD2j/025lOnXFHQlOYYFzn8oBkOxbwQz7cBo0Bn0CphgQS/n
   UhBCdB5FfkegXSblfTWqROqGFobPmP+pYQT6bRy9EmgQBtdCPOCjGjGiR
   A==;
X-CSE-ConnectionGUID: wb+ZepOJT3WAq5xKGf7wpw==
X-CSE-MsgGUID: lyMRBVyWRleSMPVwvhRHdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80823424"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="80823424"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 05:26:26 -0700
X-CSE-ConnectionGUID: +dgZnQdlR1OJOoSvVZIBjQ==
X-CSE-MsgGUID: Pbu21HEARamkUM62Ke++1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="239632974"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 27 May 2026 05:26:25 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 5CBE495; Wed, 27 May 2026 14:26:24 +0200 (CEST)
Date: Wed, 27 May 2026 14:26:24 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sebastian Loscher <krang@krang.de>
Cc: Mario Limonciello <superm1@kernel.org>, linux-usb@vger.kernel.org,
	andreas.noever@gmail.com
Subject: Re: [BUG] thunderbolt: USB4 v2 TBGAA tunnel creation crash in TMU
 enhanced uni-directional mode
Message-ID: <20260527122624.GC3102@black.igk.intel.com>
References: <13787e02-75d9-8000-65d5-41434a0e817c@krang.de>
 <20260525044421.GI8580@black.igk.intel.com>
 <8c753210-e399-4ddf-8ca4-d250fd4af369@kernel.org>
 <20260526040732.GO8580@black.igk.intel.com>
 <523ddc3e-2047-c202-482a-02d76de17cd4@krang.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <523ddc3e-2047-c202-482a-02d76de17cd4@krang.de>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38098-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: 21ADF5E43DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Tue, May 26, 2026 at 06:03:39PM +0200, Sebastian Loscher wrote:
> Hey all,
> 
> Thanks for your reply. I finally managed to attach the tbtrace logfile and
> dmesg, done two times after fresh reboot: One set after connecting the dock to
> the designated USB4V2 labelled (back) ports - reconnected three times, one set
> to the standard usbc ports in the front (labelled -amd).
> With the latter, dock stays attached and shares onboard LAN chip, SSD port and
> additional usb ports.
> dmesg shows same behavior as reported before on the usb4v2 ports.
> 
> I believe vendor added the usb4v2 on some pci lanes where other vendors went an
> occulink connector, additional M.2 and/or more USB ports.
> 
> Hope this helps. Let me know if you need more.

Thanks for the logs! I can see that there is unplug in the middle of USB 3
path setup here:

[  148.157866] tb_rx Read Response Domain 0 Route 1 Adapter 1 
               0x00/---- 0x80000000 0b10000000 00000000 00000000 00000000 .... Route String High
               0x01/---- 0x00000001 0b00000000 00000000 00000000 00000001 .... Route String Low
               0x02/---- 0x020820c1 0b00000010 00001000 00100000 11000001 .... 
                 [00:12]       0xc1 Address
                 [13:18]        0x1 Read Size
                 [19:24]        0x1 Adapter Num
                 [25:26]        0x1 Configuration Space (CS) → Adapter Configuration Space
                 [27:28]        0x0 Sequence Number (SN)
               0x03/00c1 0x81120408 0b10000001 00010010 00000100 00001000 .... 
[  148.159120] tb_tx Read Request Domain 0 Route 1 Adapter 1 
               0x00/---- 0x00000000 0b00000000 00000000 00000000 00000000 .... Route String High
               0x01/---- 0x00000001 0b00000000 00000000 00000000 00000001 .... Route String Low
               0x02/---- 0x020820c1 0b00000010 00001000 00100000 11000001 .... 
                 [00:12]       0xc1 Address
                 [13:18]        0x1 Read Size
                 [19:24]        0x1 Adapter Num
                 [25:26]        0x1 Configuration Space (CS) → Adapter Configuration Space
                 [27:28]        0x0 Sequence Number (SN)
[  148.160517] tb_event Hot Plug Event Packet Domain 0 Route 0 Adapter 1 / Lane
               0x00/---- 0x80000000 0b10000000 00000000 00000000 00000000 .... Route String High
               0x01/---- 0x00000000 0b00000000 00000000 00000000 00000000 .... Route String Low
               0x02/---- 0x80000001 0b10000000 00000000 00000000 00000001 .... 
                 [00:05]        0x1 Adapter Num
                 [31:31]        0x1 UPG
[  148.160518] tb_tx Notification Packet Domain 0 Route 0 
               0x00/---- 0x00000000 0b00000000 00000000 00000000 00000000 .... Route String High
               0x01/---- 0x00000000 0b00000000 00000000 00000000 00000000 .... Route String Low
               0x02/---- 0xc0000107 0b11000000 00000000 00000001 00000111 .... 
                 [00:07]        0x7 Event Code → HP_ACK
                 [08:13]        0x1 Event Info
                 [14:14]        0x0 Sequence
                 [30:31]        0x3 PG
[  148.169868] usb 5-1.4: USB disconnect, device number 5

There is also USB 2.x disconnect which makes me suspect the cable. Are you
using Thunderbolt 4/5 cable or something else?

The other thing I noticed is that the host is USB4v2 as well (well
according to the TMU configuration). @Mario is that right? I was not sure
if AMD is v2.

