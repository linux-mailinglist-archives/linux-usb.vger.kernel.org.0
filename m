Return-Path: <linux-usb+bounces-32910-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAIkCipte2mMEgIAu9opvQ
	(envelope-from <linux-usb+bounces-32910-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 15:22:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9144BB0DF3
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 15:22:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F10B3011A76
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 14:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4C7288515;
	Thu, 29 Jan 2026 14:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFzBJAGx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D83A1C3C08
	for <linux-usb@vger.kernel.org>; Thu, 29 Jan 2026 14:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769696550; cv=none; b=V287Mjr8Cxl/vZNTvFcc8fS5LEBCzb/X+6L9xWKTgNu5ey5GqmW9YWx2WT7DPa+ypSI4pBfsxMLcLI8AHp9HWObXuI0uN5pz/N24NGz97hcvRWVyB3EArwQ0nL3pFEDDjLqlhq/UWSzrMaiNzSRZbz++RKjhaIf0+lVuqrIR2U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769696550; c=relaxed/simple;
	bh=WXqGeokpjn0gwQUxTdpATEwlD2d4jPGvvQC91tt7onI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jNbofZO6Noc/y1qqfmf0r7c4kfChtV5npPgxDkp98NzTed5/v3ozV68ZA0do44X6EWCw9uaBcxstORAMCCSalVWAHn/zfX+MvSkWwyq7aCyc48lHJu3BluCQnM6XpbgWrlaj/jrlJcjGiI3xMxRxmGBv9C65VCBb44ayOYudO3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFzBJAGx; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59de77e2e30so1264531e87.2
        for <linux-usb@vger.kernel.org>; Thu, 29 Jan 2026 06:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769696547; x=1770301347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXqGeokpjn0gwQUxTdpATEwlD2d4jPGvvQC91tt7onI=;
        b=lFzBJAGxQAzQlPVUzyFgHHzdW+g8YXRHYX2MOqFBoNo/mhXwT55qvlMc9DLaJe7B1o
         jrZ3W155tpmh0HT6cAyIoPPFVB99shZbj95ethrGAApyo4k8S+nQta9TiFEgCM0Y/aCq
         Pu+ZN1we2HVzaZlbLlAnddiDa7PsiKhMRQpMbnzEsDwiaZQ5nyKv8b8hUR0hneFXdo2w
         UoqdbirUkqGvsYRl2g3pGQzOJoX/NOEnQZ/XzHMgcUgWQ41zp6hDY81VyrUkMfpf6bWK
         qiQyh+M30+A1zgopkRIiS5MwaxL1HjlVnMxQmv1qEBfzFYQ/pxtCrKI4oHA7acY1FBkP
         ZL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769696547; x=1770301347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WXqGeokpjn0gwQUxTdpATEwlD2d4jPGvvQC91tt7onI=;
        b=Vix83BkoMMQ/CPmiJCEAJNlhETslffuO4yWXB4mgo8SrdArghoBKlZomqAjpGkXQ4z
         qXOsFN0ArVtmTiva48eDRUbuDr2EoyKKMWXTjhX0clfzfR77XaypcYUY+y+A7uNroR4Y
         HjtaJrK046gqHylRFxxsZCGVS26avVaa9nXOnjsg1f9KPgj59DuOwYXPC5VXQQVFcKFY
         EGYT8rjMu9UnPbzUUb4BC3wySJx8v88q0ddk2wNo+2Bt8EHnlI/xxqVFRdXw5HQs44c+
         vPvJwENQqEfhKtlutErCQQxbVlxgzNJyVzEYNNE9aDzYMnShR/cOZCgNpmY4OrHKFyFX
         o09A==
X-Forwarded-Encrypted: i=1; AJvYcCVKxvG7Krk9CW/4JZNuRuDKutgvl+bgRaCG2WdWgbJ+W5cz0R5B6lfVY0XkdU5Qyg3/ycIW6rkBSiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzV2TqhtXGXmTiZUze5EUG723H803r/qsiVM5DiqgHw2ygllM8
	qhrRCEVVs75EZZD/npo29xGzg3Mzkdqfx8B6YmbDKe3yBG9OfUyWdIJib4yZlw==
X-Gm-Gg: AZuq6aJf0kyL9xnr0xUUL9iCZ9C1FGfX0ZrcVsSjmtksjL9rIo8xzKCEz2Bnl9/QJe/
	be9yddOAKm84fRPW7fFmKtgBTUpQlX69xWXixvqHVi5R+yzMA3ERzVxsvUy8cePSckD1BCT5lAO
	6bW6EjCoT0sC7Fb8/KUvOfglnrwnXY56cTF/tXM4LaOsoRydOFaNmrOmXsHkE4xK7sMYSIdcI/A
	k4llavyiiMZJG/QqrjdQNQ2Ov1ks1A6BZFlrDozZd6foleeCQwXDmNrtx2H+XtoFz8fuBFMQS46
	60aWl6d36WySPF7+g+45nzKcGsu0RAL97GTO+5jdX+t6uUWRK73l/kntxjjZ60Ej4b7t0tMdUuy
	PCaBtOgyfjFWENme80tgR0GZ8xipz+dRrIo72XLuQsYBzmYyYDmeCklJEqanQg4mwMksTzS+cOC
	TV6hHaZ6npJL4pV0OgxKwU+gtOUjMhU/z1LQ==
X-Received: by 2002:a05:6512:1282:b0:59e:3cd:f1dd with SMTP id 2adb3069b0e04-59e0401a884mr3549551e87.18.1769696547176;
        Thu, 29 Jan 2026 06:22:27 -0800 (PST)
Received: from foxbook (bgw148.neoplus.adsl.tpnet.pl. [83.28.86.148])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b2d89sm1147543e87.49.2026.01.29.06.22.26
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 29 Jan 2026 06:22:26 -0800 (PST)
Date: Thu, 29 Jan 2026 15:22:22 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: raoxu <raoxu@uniontech.com>
Cc: gregkh@linuxfoundation.org, kenny@panix.com, linux-usb@vger.kernel.org,
 mathias.nyman@linux.intel.com, niklas.neronin@linux.intel.com,
 zhanjun@uniontech.com
Subject: Re: [PATCH v11 2/2] usb: xhci: enable secondary interrupters and
 route transfers per slot
Message-ID: <20260129152222.79c1252b.michal.pecio@gmail.com>
In-Reply-To: <ED3E9F8EEA089A35+20260128080939.1145420-1-raoxu@uniontech.com>
References: <2026012754-ferocity-operator-e3b2@gregkh>
	<ED3E9F8EEA089A35+20260128080939.1145420-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32910-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9144BB0DF3
X-Rspamd-Action: no action

On Wed, 28 Jan 2026 16:09:39 +0800, raoxu wrote:
> By "hot spot" I do not mean a CPU cache problem. I mean a
> software-side serialization point: all devices share a single event
> ring and a single IRQ handler which processes completions under the
> global xhci->lock. That centralizes the work into one place
> regardless of cache locality.
> [...]
> Even if USB link latency is high, the IRQ/event path is still a
> CPU-side serialization point: all completions land in one event ring
> and are drained by one handler under xhci->lock. Under mixed
> workloads (e.g. isoc video plus periodic audio/bulk), events from
> unrelated devices can queue behind the same lock/handler and increase
> jitter/tail latency, even if the bus is not saturated.

But this patch doesn't address such contetion. It's still one big lock
per xHCI chip and a few CPUs take turns to do all work sequentially.

I find Greg's counterargument convincing. This change seems to only
harm xhci_hcd performance, and if your bottleneck truly were in this
driver, it's hard to imagine how anything could improve.

I suspect it's somewhere else, and considering the results you report,
quite likely in URB completion handlers. They used to be called from
this IRQ handler, but nowadays it's delegated to USB core.

Core uses BH workqueues. AFAIU this means completions run later on the
same CPU which handled the IRQ. So if you spread IRQs, you also spread
completions. It's easy to see how this could increase throughput or
remedy latency spikes caused by sluggish class drivers, because unlike
this IRQ, completions can usually run in parallel on multiple CPUs.

If that's the real problem here then no xHCI driver surgery should be
necessary to work around it, only updating the core.

> the upstream xhci-sideband work has already exercised and validated
> the core multi-interrupter/event-ring plumbing in the driver. So
> using additional interrupters is a proven in-tree mechanism, not an
> experimental path unique to this series.

I'm afraid the only driver functionality exercised by xhci-sideband is
allocation and freeing of extra event rings. Handling those rings in SW
and solving race conditions is new, as is having no way to tell which
order some events were generated in when things go wrong.

Regards,
Michal

