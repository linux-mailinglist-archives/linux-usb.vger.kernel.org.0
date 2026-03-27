Return-Path: <linux-usb+bounces-35566-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHhcDf+XxmnrMQUAu9opvQ
	(envelope-from <linux-usb+bounces-35566-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 15:45:19 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD56A34646B
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 15:45:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 799E530A77CB
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 14:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8AF43F7A83;
	Fri, 27 Mar 2026 14:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="f9GADw8e"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A77F3F7A9A
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 14:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774622532; cv=none; b=nRt4CIyS2D9iew8TTasHGonVrVnf2Iq34Y6tGzaZDbsNc3Xe7wExuPj5y61C+nK7zqwm0ykNqozR1iA9eATvCqzJ+oDhZJ2HRZeCCysHegOYvMlc3/Zfj5ZNG1xXxT2Og+tWAimgFuNxVsmOhcqiBpgM5MhiWnkfg7smxgsGDjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774622532; c=relaxed/simple;
	bh=ylA7ih9c3zmN2K3V4NZ6Ra1Y0GHKDBSmQnTMK3iaQ9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=hVb0eB3nZbLcYf7g13w1yToX+RGCOsUDZi4FpXEMjbH7SQSXF6IdxYkKJ37e0SDsF/WTt4ntxNksvfAzYKC0x+E4sLxFbdle7CHPhtsknzUrp+t/w6sNH/zyaxJxTB9KymVEk9OrLsdELgvbTVxy/JPhnUUNFSRl7c29CHf/BjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=f9GADw8e; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260327144202euoutp02d190d18b4d65e071827245c353237c50~gucggT3uK3049430494euoutp02_
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 14:42:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260327144202euoutp02d190d18b4d65e071827245c353237c50~gucggT3uK3049430494euoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774622522;
	bh=7bk0dNR0zbUSNuzz8HU1AITn/eIsQuxRxjKTkb9qTHA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=f9GADw8exPA2pVqpc0qboQT+Sy/jnB8ErnC5Qxv0djC6GCim3q4etY2PpzH24UY8O
	 7Qep4pkrHEwLMs1ACeuzsMQ+fh0iZ+IbqDSH3iKHqqqJLg/2MCUB/uj6DQCJzOZpm3
	 rD07b3C5yrAHKWmF8/mfyXaa3FgFSCYIyPSQnJ8E=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260327144201eucas1p2fba2f0b4d62780ba545ca81d1e42397f~gucgC2W412070520705eucas1p2u;
	Fri, 27 Mar 2026 14:42:01 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260327144159eusmtip22ec2e6c7eb865005539396807c731900~guceHbtB72669926699eusmtip2n;
	Fri, 27 Mar 2026 14:41:59 +0000 (GMT)
Message-ID: <455f1419-77ed-419d-b53e-e787dbd638a8@samsung.com>
Date: Fri, 27 Mar 2026 15:41:59 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] mm/slab: align kmalloc to cacheline when DMA API
 debugging is active
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, "Vlastimil Babka
	(SUSE)" <vbabka@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, harry.yoo@oracle.com,
	akpm@linux-foundation.org, hao.li@linux.dev, cl@gentwo.org,
	rientjes@google.com, roman.gushchin@linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	stern@rowland.harvard.edu, linux@roeck-us.net, andy.shevchenko@gmail.com,
	hch@lst.de, Jeff.kirsher@gmail.com, Robin Murphy <robin.murphy@arm.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CABXGCsNDfuLQ64r=sMyJ0UYbzZT_j8xsH5h0gpAGTPwV64Qp2g@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260327144201eucas1p2fba2f0b4d62780ba545ca81d1e42397f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260327122625eucas1p10eabcb31aada4e11b5c2ebcff4cb3c39
X-EPHeader: CA
X-CMS-RootMailID: 20260327122625eucas1p10eabcb31aada4e11b5c2ebcff4cb3c39
References: <20260327055846.248829-1-mikhail.v.gavrilov@gmail.com>
	<CGME20260327122625eucas1p10eabcb31aada4e11b5c2ebcff4cb3c39@eucas1p1.samsung.com>
	<acZ3ZUXhFHpSXzYS@arm.com>
	<d2ed7315-72ff-43f3-bfaa-995025cb9419@samsung.com>
	<bfa5ff0a-8ef9-46cb-8881-396f71ed5be0@kernel.org>
	<CABXGCsNDfuLQ64r=sMyJ0UYbzZT_j8xsH5h0gpAGTPwV64Qp2g@mail.gmail.com>
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35566-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,oracle.com,linux-foundation.org,linux.dev,gentwo.org,google.com,kvack.org,vger.kernel.org,rowland.harvard.edu,roeck-us.net,gmail.com,lst.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[samsung.com:+];
	NEURAL_HAM(-0.00)[-0.514];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,samsung.com:dkim,samsung.com:mid]
X-Rspamd-Queue-Id: AD56A34646B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27.03.2026 15:37, Mikhail Gavrilov wrote:
> On Fri, Mar 27, 2026 at 7:30 PM Vlastimil Babka (SUSE)
> <vbabka@kernel.org> wrote:
>> So what about Harry's proposal [1]? Mikhail seems to be on board? [2]
>>
>> It seems it would achieve the goal that enabling DMA_API_DEBUG doesn't
>> change the kernel behavior? But I don't know this area too well so
>> maybe there's a catch.
>>
>> [1] https://lore.kernel.org/all/acYlxRBhSMcwBnja@hyeyoo/
>> [2] https://lore.kernel.org/all/CABXGCsO_C8%2B%2B4%2BoPfZ%2BbQyrBnEGy5JFpXHkGNpfy%2B8%3D5BvVNfg@mail.gmail.com/
> Hi Vlastimil,
>
> Yes, I've already sent v2 based on Harry's suggestion:
> https://lore.kernel.org/all/20260327124156.24820-1-mikhail.v.gavrilov@gmail.com/
>
> It adds a dma_get_cache_alignment() >= L1_CACHE_BYTES check in
> add_dma_entry() instead of changing ARCH_KMALLOC_MINALIGN, so
> enabling DMA_API_DEBUG no longer affects allocator behavior.

This looks like a good fix, but let me think a bit more about all 
possible cases.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


