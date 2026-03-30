Return-Path: <linux-usb+bounces-35645-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NonHIY3ymlf6gUAu9opvQ
	(envelope-from <linux-usb+bounces-35645-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 10:42:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFDB357612
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 10:42:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3E852300A33C
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 08:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713573AE190;
	Mon, 30 Mar 2026 08:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TzlnI679"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B197C385522
	for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 08:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860134; cv=none; b=OPrnV0MBC1CBjTZ9hbmr1mNyhVDw008u9wqIMTwZitPQiN1y9SdGPC3s8ptc2/YsjM6iNk/AFlIyPILAMOK4kt/DRAyZzc81mduSjZf/YbW0BiYFl+Le5RFxUjPIycdYL8c3VhOS+xr1nQxXlnb8lm7mdIKb1YZJKBrLDeXJ0aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860134; c=relaxed/simple;
	bh=NHF1kl1CCeeGSv4ZQpqmgETIcnYab/4ETFf2bkr6mA8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s2/WCyXaoKjcRc4RekxS8G8kwCvcCnFvt7ADfIzVSr/22jf9K8zGpr19yR9u+TJ0hEIzbdfKUbS5zZUaCZeG78fur4VYdWDmg9xd1xgu6RAlUM1r4dZNf+KaDzS6inlQshyh3j9D8vXt4R/bG9LlMN9kjRlqLrr9PuUN3ThRFGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TzlnI679; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-661b16ac011so7817885a12.2
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 01:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774860131; x=1775464931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMVNxodyL+pPTo1MI2rCexbhfoCRP7pKUONGnLN92Tg=;
        b=TzlnI679uyT1tbWcUHf39R0n/KRGUMlwbwG7UDxSVcsRDb3bIZcDTMWz/bU/039hWQ
         wMKcQ613NORuH9JnV+8K1O0lxw2xoXW02siZlvHEN24cMxQdWsOkmyP3bKhGd3veOM8H
         nzljmQwwUsIVvO0CNlERYnRvEjfN7srz9TWTCQwCEXylIXI2ZjVm3QyFZMcyTW6qON90
         3L9Ik5MIp5XC6qcZ3A9RmnJpJIhLjtwtAX6TuaS7yaBTpyG2H5uVbhdYVPZVBvViTQGV
         QP6zUjWRu+v3TQFsVpHCyP/OzLTWO/A0BGhpXz8/t0vhEdJjJoHVjNdqBSBgeto1hTpD
         bKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774860131; x=1775464931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VMVNxodyL+pPTo1MI2rCexbhfoCRP7pKUONGnLN92Tg=;
        b=shtgYjUEzlHWKpYszQ9db11r36eWLEeuECVnRXqzw+ChmVkdO8Nm1TDYJN2PzO4Txz
         38sbEaOz4GN7GAPBYHp1O9ur+z0slK3kZTaaH8N3yjSnZmyVWFoWiKYBoPQ+dMhhxSw7
         cU+L+5jhk5YxRIJPkyAnCabr0aaNkSqW7S4aunlX1SsH/Y5yq+vj0bPSkMwCdqa33sW0
         X7dlRfDf7svzES41LZxm1ji4QOkpgJwDYAhe24EExwE6DlRHMkigCs8UbxzgzbAQKNUE
         SHsc2C/FJjNoV97uZwtW8BhdW1yIK7HutUWi1TTzMZTNs/LNcBh112pimp5KpHxKZvC9
         fsLw==
X-Forwarded-Encrypted: i=1; AJvYcCUhjR4XMYLyO4m3EWzriww4AWoUqoGkGD2xO5CxP6UusTvTG5rRtdlYWI3/Gr7sp58ma52RMjTAOkw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL628aRpFvRwrHuvnuFRXDeTOmS7RlT/fxWdflAid3iASKtrE9
	RX1TGk1lwxRvCkWnR1H0hbspZE/OYdeOc5jflr0RU0L5qiQ7xuMJ9ox9
X-Gm-Gg: ATEYQzwPAON3I4xNfUSDFZfO0aen5tSr9Pp4Gq0zH0dOPPXBr2bcnwExrRnjv2Crpu1
	QAREwHbEadnxnEL/Y8c/hqOR+Ut0kP1ej6ZFaP7mczVAHeWvhERmGX6zHsDm3dQ3pmBKdTjaN8K
	GtVM/BuyaOQGb4hHB43lvBYe0AAvbYQwXTvSmpsqJ7eaei0dvzG8vg16lu5h2i9p8Qy5T/bkoRu
	fSqxcLZLkYq6PkChN0C6f6weSZ/8toqtsW7HeaA2pBUzalsUK3NofOI5fMPI+ZoRiUoBn60dDYG
	Zd2vEa8eZtdv4CybXfsZ9nlvSXgIzJCjfAGcVj2MZo1PyOq8LcP3kpbK61rnBw88WcOunOTdWIG
	dbL3dPuFK1QAat1757val0Ev9sX0/iFC7wluBGIPs7GX2YTwoysvLY7uXSttdpLD66ffkp5oymZ
	cqi9y0toDa6pfItAWYD8Exua0GsunrYiDm
X-Received: by 2002:a17:907:ca84:b0:b97:cc05:61a7 with SMTP id a640c23a62f3a-b9b5098de17mr695918866b.51.1774860130768;
        Mon, 30 Mar 2026 01:42:10 -0700 (PDT)
Received: from foxbook (bfi53.neoplus.adsl.tpnet.pl. [83.28.46.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae24151sm258857566b.8.2026.03.30.01.42.10
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 30 Mar 2026 01:42:10 -0700 (PDT)
Date: Mon, 30 Mar 2026 10:42:07 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
 raoxu@uniontech.com
Subject: Re: [PATCH 5/9] usb: xhci: move ring initialization
Message-ID: <20260330104207.40c7500e.michal.pecio@gmail.com>
In-Reply-To: <20260327123441.806564-6-niklas.neronin@linux.intel.com>
References: <20260327123441.806564-1-niklas.neronin@linux.intel.com>
	<20260327123441.806564-6-niklas.neronin@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35645-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0DFDB357612
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 27 Mar 2026 13:34:36 +0100, Niklas Neronin wrote:
> Move ring initialization from xhci_ring_alloc() to xhci_ring_init().
> Call xhci_ring_init() after xhci_ring_alloc();

This adds more code and more opportunities for bugs.
Can't ring_alloc() just call ring_init() itself?

> in the future it can also be used to re-initialize the ring during
> resume.

Yes, but it seems we don't have the opposite problem: there is no
need to allocate rings but never initialize them.

> 
> Additionally, remove xhci_dbg_trace() from xhci_mem_init(). The
> command ring's first segment DMA address is now printed during the
> trace call in xhci_ring_init().
> 
> This refactoring lays also the groundwork for eventually replacing:
> * xhci_dbc_ring_init()
> * xhci_clear_command_ring()

Or xhci_clear_command_ring() could just call memset() and ring_init(),
instead of duplicating this sequence in every place which needs it.
 
> 
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>

