Return-Path: <linux-usb+bounces-35773-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKkNA2v5zGnRYgYAu9opvQ
	(envelope-from <linux-usb+bounces-35773-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 12:54:35 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 05760378D8C
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 12:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 11B4B30B5C09
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 10:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268233F54C5;
	Wed,  1 Apr 2026 10:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFIai6rs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A68F3D88ED
	for <linux-usb@vger.kernel.org>; Wed,  1 Apr 2026 10:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775039894; cv=none; b=g27xYV9q/dDrMzHUg+jt3fBCBjsS5ABxVaHeS+AhBHAXaNw2p8+JeiuKyoDy+Lzxs1+2Ml9Iqx6Ui6JZCY5fM5dHCMaGJ4g6feFQQsQrTiGwSoWRnPOjSfvxELjZtOLZJLdd957PMS/Qh+JM5tx2F0OxbbBMrNsALq9HEfSn0v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775039894; c=relaxed/simple;
	bh=4hJLtA0CDaOrq0pLTrdBb5/cA5mYKI4vxIw44iEROJs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eAP6FdvIADSBj/88KO6EPOdiKuGf2IJh8XExpUZmpv6Spd3MNijzGqi20cifOv6UTuuvoqXa3F/3c7PmwTsG1zSCiFRvLrBmOSgq1QaPmMc2uVsSFDBtR/NK71o4lzqqUeXMG/B1AG3vu6cEVpW3b5+dDEa59kzz6JGZXgT7WNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFIai6rs; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43b983bb07eso3548656f8f.0
        for <linux-usb@vger.kernel.org>; Wed, 01 Apr 2026 03:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775039892; x=1775644692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6k7LHQf7qSfTuXxgWlOgDTy8zVtBXRtcZog9x4R5F8=;
        b=KFIai6rsMng4dqcjOoP/agOE2oPo3zgb3gQ3wwheethGuabpbV5yzAS3Ttyu2DyWPQ
         djlBoQqPDVNirsPbIimlSemSiI2Uwy4Up1+VAuGk5VHXNHAsQ1D/OxQQtBgMYPxq3SxX
         sJIz9KzSC3O7yp90hgIiwlllziRO9mEEpeLMAGnr8Xso7rOC03xuLLJdg/oUph/R1+vD
         Nr9RFsfqIHAFYcBFdHltGxRGjLAhwgfOHt+aPOYfY3wqa0FAfiPjhe0LiGEKzO0+PYrs
         ajEaBjsHm9+SwKxWta8sFdbWkVz24eigEU7l/cVfgZsqANKD+8qJB5r0foOb8wrpyWVp
         I8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775039892; x=1775644692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M6k7LHQf7qSfTuXxgWlOgDTy8zVtBXRtcZog9x4R5F8=;
        b=bMlNybjil/Fjee0xVUGoDRvEO5Oqx3Pts40cHsjkeq7V8P43Q8Fuas1zmMZJZqzb7s
         5NuWvIeVStdGivjLiAwCCPvfxpzO5jf6L2J67n9tXNmN3zdPsN5qDnW8HvdzXyAYfdgT
         08QtFUTCW2q0RzC7UCbUP3dYJbWfGhbLotMdxneVSaW+VVCyGyLaa9HpYa6zqgtW7FYS
         QCKcKZGf6xXGiJ9UDYDFQF60xanhvCEqcRsLRQ/rpkBLNnuuGEqOS/YZSUyKdl5lA32f
         aTK0Cuv0bJyIaGV5yEOda2VbK3SLc9iHgjEmYXJ3JpcKHZCuoSWEYb+MKY6+rBZDLkGp
         /Uew==
X-Forwarded-Encrypted: i=1; AJvYcCXaUW0pL9Snvag3nwTQnQSBvkPLoFc2WC9THYAn0DNcnojINMkZnfZsV18MeKLsVm1Za8622T4oj4w=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl4Cndq2UBlH4+HFrsP2PIpEoJhWQ93pHnHZ6jDA3ctzsUADlK
	nvATusKP4n30DKUOGxo3IvckHYMkDcOWGDfOSI4xDsIo89u+22jgYlpWtLv+8w==
X-Gm-Gg: ATEYQzwvVJ8iy0ZaIYRdwBKCdIknN1aINBxV5aEFtJYok8PFjjkxJnGa8ZbQvPNg+gc
	54B3X9tUFkkCotyXpYlywasJrwuO6TSylC0tgJmjbYqC6quG01m/YKUUoo/JPauE7nO0QVEkD/z
	AyYEbALsqMVsGDk1oIyJZcIESy9Pgmof5oZnObvMPRdrTYBoTSipEf37boK0FyyGkJ8buJsvntU
	9GyMW3K6LKPaJx7WKjWs0HjfAIHOsR63ldr+KSt8q5p0okfyCcW8i0PnkK/p1e7m4FifTZqppYI
	4Z/bn5U3045EXa0ouY/ilqqykLuc74vnmQKJZO4wUbD6vyfnxPPbzzMs43MQj1ZhRi0WviE0khi
	r3CrJVO+Mgid9i1A/MLyiENoAy/pYOtLKB8iw5KNCku7Jun7lJmbDKF0vSokYaUAjeuQnCYaFAE
	ocDmhZClwvshyxG/ltdekjXIQPUL9pPOgn
X-Received: by 2002:a05:6000:18a6:b0:43b:45a0:9df8 with SMTP id ffacd0b85a97d-43d150d3d39mr6170303f8f.35.1775039891433;
        Wed, 01 Apr 2026 03:38:11 -0700 (PDT)
Received: from foxbook (bfi53.neoplus.adsl.tpnet.pl. [83.28.46.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e3602sm35729953f8f.4.2026.04.01.03.38.10
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 01 Apr 2026 03:38:10 -0700 (PDT)
Date: Wed, 1 Apr 2026 12:38:07 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
 raoxu@uniontech.com
Subject: Re: [PATCH 9/9] usb: xhci: optimize resuming from S4
 (suspend-to-disk)
Message-ID: <20260401123807.1719ff57.michal.pecio@gmail.com>
In-Reply-To: <b3a945bf-65e9-4a8e-9a88-341bc59f6c8d@linux.intel.com>
References: <20260327123441.806564-1-niklas.neronin@linux.intel.com>
	<20260327123441.806564-10-niklas.neronin@linux.intel.com>
	<20260330114510.2b1e5f05.michal.pecio@gmail.com>
	<b3a945bf-65e9-4a8e-9a88-341bc59f6c8d@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35773-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 05760378D8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 31 Mar 2026 12:59:50 +0300, Neronin, Niklas wrote:
> On 30/03/2026 12.45, Michal Pecio wrote:
> >   
> >>  
> >> -		xhci_dbg(xhci, "// Disabling event ring interrupts\n");
> >> -		temp = readl(&xhci->op_regs->status);
> >> -		writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
> >> -		xhci_disable_interrupter(xhci, xhci->interrupters[0]);
> >> +		cancel_delayed_work_sync(&xhci->cmd_timer);
> >> +
> >> +		/* Delete all remaining commands */
> >> +		xhci_cleanup_command_queue(xhci);  
> > 
> > Considering that xhci_suspend() clears the command ring anyway, it
> > could probably do this too so we don't need to.   
> 
> It makes more sense to have all clearing in one place, instead of
> spread out over suspend and resume. This will be addressed in the
> next patch set, i.e. remove clearing from suspend (if possible).

And this patch leaves command cleanup spread across suspend and resume.

If a future patch moves clearing the ring from suspend to resume then
it can also move completing and freeing stale commands with it.

> >> +		xhci_for_each_ring_seg(xhci->cmd_ring->first_seg, seg)
> >> +			memset(seg->trbs, 0, sizeof(union xhci_trb) * TRBS_PER_SEGMENT);  
> > 
> > This looks like a bug because it nukes link TRBs. I know that
> > xhci_init() will fix this up (unless somebody changes that without
> > updating here), but it looks confusing.  

And it's unnecessary because xhci_suspend() wiped the ring already.
Which means that xhci_init() calling ring_init() is unnecessary too.

> I would like to remove xhci_clear_command_ring() eventually,
> instead have:
> 
>    xhci_ring_reset()
>    ...
>    xhci_set_cmd_ring_deq()

Fair enough, in some cases one may be useful without the other.

> or
> 
>    xhci_ring_clear()
>    ...
>    xhci_ring_init()
>    xhci_set_cmd_ring_deq()

Not sure what ... would be, however?

If clear() doesn't include init(), is there ever a good reason to
maintain the ring in an invalid state? A state where forgetting
about ring_init() would cause the HC to escape the ring and IOMMU
fault or interpret random memory as commands?

Regards,
Michal

