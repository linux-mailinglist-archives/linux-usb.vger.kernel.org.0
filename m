Return-Path: <linux-usb+bounces-35699-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAUwG5v2ymmlBwYAu9opvQ
	(envelope-from <linux-usb+bounces-35699-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 00:18:03 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5D6361D74
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 00:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B12FD303422A
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 22:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC01839DBC5;
	Mon, 30 Mar 2026 22:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TN+vEPan"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B4E258EC1
	for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 22:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774908869; cv=none; b=nBDTXmp/yKD1TVh3IqOHIVxgeDRx5bqQW9c6a+INdAlX/giv6Jg8XLtr5Ve8a+HCzv80q17TbJN+6yLeHEw3BsgGXkxbBJx6A+JpC8vSGn8F7hDyreLxgH7YLqRPnsVy7QGN+O72rWLM+QpUlWcSjpja2vJSuNgrpyVWB+DizyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774908869; c=relaxed/simple;
	bh=13wssujQbIyLQCFM48Stg4nMkhMgvIXI0K6eqdMmGww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hVw8G8SYTP7yrYZvSCh2sNMqhsy776RE5jJlyjcw+KFH5NpHSqeHykoqKPUtkoXCdKULKWcJQrhEsL3TKYexYzU1FiLupfiziE3HDT4EPraX5vzNN8IDEPNROrtLhzTdKkT/1QvpnlfsHcX8RwtOzxg+7VoOHCI8kmyH4LZnoQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=TN+vEPan; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-66a4c6bb6ecso8943665a12.1
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 15:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774908866; x=1775513666; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sgxFsOJvZ8sXCMbDM96Xr96StQzCVgpxG8bopM7guow=;
        b=TN+vEPanlt0PxB3Mvg54x6W80CFGCmt/IozkLTKxlCtNfBjAYkKb+AsP/Fo/R4zMge
         t67/hlp1VLpovDo+7j8cI2RZ3qSpUnzBWJGNgN4gBOuo2UpwNI/31y8XW42eoklUVq0B
         Qi5rhG7KNQZLLEvtUXovdAw4GQYz9ljJN6Hmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774908866; x=1775513666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgxFsOJvZ8sXCMbDM96Xr96StQzCVgpxG8bopM7guow=;
        b=ncUs4DglHpKkaDh38z4p+nqL/B1SqrnMybf1nttchbfb1dZoOmC9kwrurcm4XPC/0B
         E4gOTuM+0HgzSlIHAUso7H0NEpqn7NPMplubLFKIkJt+yHRnUJqVJOzQv0cxEJsXOk/W
         /ZPCXqEO+J3CMn5DNvLD3Pg+sGXlQm9cFd6NocUqad4nv6YKC/K+PDfOlLHOG20RXZKF
         HuqK4J5IsA+e9BGjVF12qbha7N/pehZgdW8b0r3K4gnRuxUb6BnM6AI+lAb5EXxDEOn6
         hq11kSq2E/mRTsTRjOwJ+MpeqtP/3bF4W9P4Y+i8qfDGbEoi+KpujmA+xGcXaXM4Qdyk
         v56g==
X-Forwarded-Encrypted: i=1; AJvYcCUd76t9BfFSt3AffXEXvcacn/oPyn7d2k+99qENygjG23P+KcSatQ03VXxfsg9bx/yd5fwrDYUz6EI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6N/iJY6iAC9ckiht3eoFyArZtnC8PZzBuLFce2VpcDmnZNsQq
	SE2t6w51pwNyg3MQ/08N/miE/sUI5TLl1gQz2mAjd5rpod33/vvZ9p4SqZPAJLVncauZFtiy6IH
	s4Wd2hrE=
X-Gm-Gg: ATEYQzxXIpozq3zT961PEbgrjF705hihyAANAUvjZAJnITe/vBwtO9n6QfUJcqconF4
	N4/kt2oGU3IZx2ygM+4zmJkXPoU2CKHLER/u/aKXlRCRDpl7rIlDKQKuoGOYin4CXx4vgSpy9wd
	WhscoWbY9NjrO+2X3XuN0pDN1fTPIG/g6mGPG8H+S5hu4U4sugRXmy0FlQXyYiC/Ss2i4HjIP1e
	ChID0qRl4XdE6Huh1ES8hxi0UdQg7Yaa4aXrqSaNVznUZY84+Q2dYgZ8p+PIaarfEi0YccWKhuM
	w4DBPglJPZi9oUV3uhquaWWJjulMB/9RNTPxfpWX+zABU7ByOFcBwBYo8wLvL2q9LLOBKnAMOwR
	qCSBlHxGLuwJJ4So6RBkXFO/LNs/kSPIPsQsG5dS2g9P0H70NtztK6gXyku+7oFK3RKim7UV1tw
	MT/84UNG8R0TuvbVGDcVYKrW7VG4SoAhmFJyf6ahiWT8CdZg+2UfpwSXMUULo1eVFeXJR/Ggw3
X-Received: by 2002:a05:6402:51c6:b0:66c:9d2:b208 with SMTP id 4fb4d7f45d1cf-66c09d2b3f6mr1716886a12.25.1774908866058;
        Mon, 30 Mar 2026 15:14:26 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66beb2d044esm1757773a12.26.2026.03.30.15.14.25
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 15:14:25 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-66c05fb27e4so1882621a12.2
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 15:14:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU46gPdGs/3KZ4ZMLe+IGd6W5Iwx2BGgUVdZoKEOh6Ys9WADsyqDfXNsvbSpwy0ziwS9GURoTBceCA=@vger.kernel.org
X-Received: by 2002:a05:6402:52c7:b0:662:ab67:a560 with SMTP id
 4fb4d7f45d1cf-66b28c526dcmr6891247a12.24.1774908864935; Mon, 30 Mar 2026
 15:14:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326131838.634095-1-dhowells@redhat.com> <20260326131838.634095-5-dhowells@redhat.com>
 <20260329121208.6092419d@kernel.org> <CAHk-=wiJ6gEELLviexdmSHnyjVoG7MFo8Qwhd1zxs_tCnL-=gQ@mail.gmail.com>
 <1179840.1774867765@warthog.procyon.org.uk>
In-Reply-To: <1179840.1774867765@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 30 Mar 2026 15:14:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjDKfhS5TvEfrsOgBgAvFMPfAd3wT=Um2AQb4txHq5sAQ@mail.gmail.com>
X-Gm-Features: AQROBzC8ec9XUhg2CYF5IFXZ9-klR-Uxedhu4hxXRVBKoiRq4ZlNxeqrDUpLHRg
Message-ID: <CAHk-=wjDKfhS5TvEfrsOgBgAvFMPfAd3wT=Um2AQb4txHq5sAQ@mail.gmail.com>
Subject: Re: [PATCH net v3 04/11] list: Move on_list_rcu() to list.h and add
 on_list() also
To: David Howells <dhowells@redhat.com>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, 
	Marc Dionne <marc.dionne@auristor.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linux-afs@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	John Johansen <john.johansen@canonical.com>, Minas Harutyunyan <hminas@synopsys.com>, 
	Simon Horman <horms@kernel.org>, apparmor@lists.ubuntu.com, linux-usb@vger.kernel.org, 
	stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35699-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-foundation.org:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 0C5D6361D74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 30 Mar 2026 at 03:49, David Howells <dhowells@redhat.com> wrote:
>
> Anyway, I'll find a different way to do this, not involving checking the prev
> pointer.  What I don't want to do is hard code "prev == LIST_POISON2" into my
> stuff.  Anything like that really needs to be in list.h.

So i think the proper model is:

(a) normal and good list users should never *use* this kind of "is
this entry on a list or not".

Dammit, you should *KNOW* that already from core logic. Not with a
flag, not with a function to ask, but from how things work. The whole
"am I on a list or not" should not be a list issue, it should be
obvious.

(b) if the code in question really doesn't know what the ^%&%^ it did,
and has lost sight of what it has done to a list entry, and really
wants some kind of "did I remove this entry already" logic, I would
encourage such uses to either re-consider, or just use the
"__list_del_clearprev()" function when removing entries.

Because I really don't want the core list handling to cater to code
that doesn't know what the hell it has done.

                Linus

