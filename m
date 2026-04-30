Return-Path: <linux-usb+bounces-36726-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GI8FTO+8mlbtwEAu9opvQ
	(envelope-from <linux-usb+bounces-36726-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 04:28:03 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BD44049C553
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 04:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1CA3300D178
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 02:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F081C282F3C;
	Thu, 30 Apr 2026 02:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="e+chPlmE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C8D1A9FA0
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 02:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777516080; cv=none; b=ufEpwN2KblhA3Sq30mkgIRC7gNetK3rUXN51xxSlcIyXpVNjrYV8joy0PuxgT7izPEF1ELpo4QQWmcb6X6YpnpvgY/MRw7pU/GXS/217kBKdHlCSCSC+5bywpbiBrtDOlwZN97OTwgbbXVjXx2ys+kRDx6A3+pjXCRGpe/fUv9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777516080; c=relaxed/simple;
	bh=EbEO5+FfZdzoeA5f4yQxaqn5kquB/Hak0dnT/M49Jy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=quhURdru+9ZLGFh+vTU4d8Liulw6+F4iwAX//763o6NBUAtbPaWGLf/6QqwVe96wUejG5OssJAqm70ZkTd6RpAPrfUzm0EW3xidUQKiCsS7OIz0Q5aZblb3O2hCu3bWjxF7l1P5Zpqgl7BcXqP7moGIiNDbGDWdUA8sutGgLjiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=e+chPlmE; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-89f1e767f92so4564566d6.2
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 19:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1777516078; x=1778120878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9RycsSD/UM7/WxXcuZermmSbJDl3rAokz3y+Bl5hWuM=;
        b=e+chPlmEL1/dsXI8Io5GIT5JeK/J6htS2gIQvKmLjf7Kc031kzpXLOuWWYkWECdJaM
         3esQroU9k39d62ZycxWZ5UKiK4Ky4Rb+jG5at74cageCw/H9XsAjK0EZnhlW1mLngb1/
         LDbbJw1ct3a6mRKrLpuQpRGPO6f73wBzCU5WXc/lukTkGtFuq5yPAC+7PNLPFeN39nm6
         VF88C5UElNMmMc1hZ5dNNHo0vq3TJo471pmtq3LJnZzcJNs2rWMMRCzYX/asAtG1cA0G
         bqZqpdZW5F1vs0t/U4853jK3n8gmObfr2fqBayNvaWIFEBw/ZtNi1IKnegEVF3bDZe+R
         gZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777516078; x=1778120878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RycsSD/UM7/WxXcuZermmSbJDl3rAokz3y+Bl5hWuM=;
        b=P+R7m8AYU3z7os/m1x7+RUxoFr7cxub6+9yLQctwjiWTzFjKQp95a+mJnDOPe+maGp
         hksOZJlxmbOwozoeTta/0hbCh2r9Y1E0YuFgh3osfFRWjbn1+UqqxD8KeB7uyCIx02rY
         h22/mm7jHUPZRyf/3t3m6GiF/KbHs4Xck/gj5FikmP1ymEfPZpWR0/9wdSghAmRaRzaz
         wxaViBobBXR+VKn00OMKirxK/eWJUBgqPi0xHZzQFj6j1idvssXesM2y4Ty3Ms3Y0tUy
         QFEpmFqZw9b9Wm/jhI9Zv3imPT21WUW54ZFDAq6fQpIdTV4jDRz2DwcI+B+7E+BlK7tQ
         3o1g==
X-Forwarded-Encrypted: i=1; AFNElJ+4hPPJGMZqrrWzusslCkc5j5SSFM1HmVxm4XMlo5O2ncvH6nId2u6Isif0HMRsPlpnUOzHKEHIET4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz/8as+VcEi0VRKLYdQbf1MPst0KVFkpcML9jY1MJLdVFVccTn
	Ja3BY/GWSKelOLljFx6GPdEGLcNp853bnP9Nc+Oj/OIkLnQS6whM4BComv/PdA7Njw==
X-Gm-Gg: AeBDieux3eOLWo/dBGPo3ulEYKXs65Ffo3nVrq+zsQm7oGS/pLRaCFh5FvR1Ci1ctTR
	R7cZZAr3dCk4zWse5TpMOFB8FK4J9eOrJWgivrEmuCHXrdNLRbbUoWOAU89YYLznIS6e9nLGmx7
	Cb/ulcJynn+vLSNqPIb1rHolUbfxSrreHdV4sGr6tf+yaDLukLjMMR59Z55hnfV96we8n//t2pE
	N3fuqp3pWATK4u6M1MwVLCpubxLkjo26wbOQv6U8/DR3uw4hl2zZ8156j2PpT4IJTO+0rN632eh
	07ZxdpO7D1bHIFWVuDxf4AOdcXl8IvfFUexe/0+J7Rn4nLq3VNxrQcrLOAbVlcnfzpdjfEeLu9A
	6TmKgMsnDh7YwQ7NqJwUk/XH+aIdBVt5eYKJ/Vg6m9Y6AqTc/zCCsC+NAOavwI3dHW282o4i8yn
	rmMvYbXxc+LymggqGxnP4tSMFufpOiOaNreXM=
X-Received: by 2002:a05:6214:27e4:b0:8ac:a5bc:a6b4 with SMTP id 6a1803df08f44-8b3fe7daaadmr15788196d6.36.1777516078002;
        Wed, 29 Apr 2026 19:27:58 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::a0bd])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ff4696b8sm5780846d6.37.2026.04.29.19.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 19:27:57 -0700 (PDT)
Date: Wed, 29 Apr 2026 22:27:55 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Brent Page <brentfpage@gmail.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: TT budgeting for EHCI; =?utf-8?Q?accom?=
 =?utf-8?Q?modate_1023-byte_full-speed_isochronous=E2=80=93in?= endpoints
Message-ID: <0a09202c-cc15-4fc9-9102-701348050a79@rowland.harvard.edu>
References: <B66AE752-B09C-49B3-A829-F7ABB36FB250@gmail.com>
 <32291bf6-0c9d-4fd9-9dd7-489f7e1c9f02@rowland.harvard.edu>
 <20260429113604.2204b646.michal.pecio@gmail.com>
 <a3176296-bf99-4486-9310-0b70f28c1ba7@rowland.harvard.edu>
 <20260429212408.299826a4.michal.pecio@gmail.com>
 <49a41b4c-34ac-4627-adcb-d0e989470610@rowland.harvard.edu>
 <229BBA08-3CF9-4E01-9621-1BD4A82BCD14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <229BBA08-3CF9-4E01-9621-1BD4A82BCD14@gmail.com>
X-Rspamd-Queue-Id: BD44049C553
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36726-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Wed, Apr 29, 2026 at 12:52:09PM -0700, Brent Page wrote:
> > BTW, does ehci-hcd support scheduling CSPLITs to Y0 of the next frame?
> > It's an edge case which likely won't occur with one 1023 byte endpoint,
> > but it may occur with more periodic endpoints and unlucky bit stuffing
> > or with periodic BW limit carefully increased for testing purposes.
> 
> Yes, I am also worried about edge cases that could potentially crop up
> as a result of my proposed patch.  With the patch, for one 1023-byte
> isochronous-in endpoint, the CSPLIT mask is 11111100 and the SSPLIT mask
> is 00000001.  I gleaned these from the debug log "ep 81: reserve iso @
> 0+8 (0.0+1) [1/21 us] mask fc01".  By all indications, the right-most
> bit is earliest in time in these masks.  Also, I'm nearly certain that
> these are in H-frame terms, as opposed to B-frame terms (illustrated in
> Fig 4-21 of the EHCI-1 spec).

Yes for both: little-endian bit order and H-frame terms.

>  This CSPLIT mask is consistent with the
> first sentence of 11.18.4.3.c in USB-2, "For isochronous IN full-speed
> transactions, for each microframe in which the full-speed transaction is
> budgeted, a complete-split must be scheduled for each following
> microframe. "  Ceil(1023/188)=6, so the transaction is budgeted to run
> in uframes 1-6 (0-indexed H_frame terms), and csplits are appropriately
> scheduled in uframes 2-7.  However, according to paragraph 3 of
> 11.18.4.3.c, an additional csplit should be scheduled in Y0 of the next
> frame - I'm guessing this is the sort of thing that would require an
> FSTN?

No; FSTNs are for interrupt transfers.  But it would require extra siTD 
nodes with backpointers, complicating the allocation and deallocation 
algorithms.  That wouldn't be so hard to add, but I have never felt the 
urge to do it.

>  And maybe not following this rule could lead to problems if there
> are other transactions in the pipeline?

Or if a lot of bit-stuffing is needed.

> There are a few other things that I'm trying to figure out.  The "case 2b"
> bullet point of 4.12.13.1 of the EHCI-1 spec says that "This case can
> only occur for a very large isochronous IN... Software must enforce this
> rule by scheduling the large transaction first. Large is defined to be
> anything larger than 579 byte maximum packet size."  Is this being
> enforced at the moment in ehci-sched.c?

I don't think so.  Bandwidth is allocated to endpoints as they are 
added, and the driver does not go back and try to rearrange the schedule 
if something doesn't fit right.  It most certainly does not try to 
change the allocation for endpoints that are currently in use.

>  I could see it possibly
> becoming relevant if ehci-sched.c becomes more permissive towards large
> transactions.  Tangentially, why are there no csplits scheduled for the
> 458-byte transaction enumerated in
> https://bugzilla.kernel.org/show_bug.cgi?id=218544  ?  Tracing through
> the ehci-sched.c code, I cannot figure out how you don't get at least
> 3=ceil(458 * 7/6 / 188) 1s in the csplit mask.

Was that an isochronous-OUT transaction?  Those things don't use CSPLITs 
at all.

Alan Stern

