Return-Path: <linux-usb+bounces-35705-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4mzcCaUUy2k1DwYAu9opvQ
	(envelope-from <linux-usb+bounces-35705-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 02:26:13 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 764F3362A2E
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 02:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BAFA3017003
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 00:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FC520E31C;
	Tue, 31 Mar 2026 00:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="c1C2DKzM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BCA19CD19
	for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 00:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774916604; cv=none; b=QDMHPRsOgMEKNaofT3nNGtHtdfaeDvl5oPOEBz7x59r9h0eHPRB6fqfLwCcJWsmfDi+boe94zjOuQBhhEg9NLMXKrv78Krz56RVO+o02svQ1pYm4amT09Nlo58npETCKHFRkcLnF4UVbtFcvW6v6EB83DADsRX3K4afNMVFPAkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774916604; c=relaxed/simple;
	bh=6wUl8Sz3m/KO5jdOLnEAnGGXTbE9en47y8rgN97XQGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O6E37Bv1rMbJYovk2sWvLGSOrbvDMXZaoHaj6Yj84yA8nvsIioHaeO/9LXX80ufsozIbhLiiKXCsvtUw5F6QutLzAWJ7TvViHMVGofSTqw/K3pGRXnPGckuyU7IBoAATaIUIGUiiGFUopdzrYy05CuBMs5U+XT/YBRTxYYAWnJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=c1C2DKzM; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a2bb0fe3bbso350539e87.3
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 17:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774916601; x=1775521401; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tir8tYzZsdvdQe2Y3Sf5wYOGCREjM5L09WG7qVnCWNg=;
        b=c1C2DKzMOUGtUifkcj+TNPlhYrhAEgqZ4vJFbutnhWlvyJbN/38BSdk7+1Y8aSU45R
         G9NuWZ1XjQx22GWrZvXfPsQeo8+jqXFokAArUrFW4mNt849UJzc5bODAAEF1SQrE1UGt
         iHGpB/bOLNq6/r+nnK3Z0mjIyqb2ioatg8H/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774916601; x=1775521401;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tir8tYzZsdvdQe2Y3Sf5wYOGCREjM5L09WG7qVnCWNg=;
        b=cd8E5uX3Li9Ll7HR65z30Sr5tKp2FAiaQQ4TRSekA/84Du0gv+I+U7E8z8BKYIVW4L
         fTon4E7K9U/viDTTbvaWK7I1YarvBWG+ijnqVv+UzPBuYugB5jZGQVYi0TfooJ89z+uu
         u3a0QRU8JMFe5pUi7srd5injYofSCEmwLBnahHEbQmJvSSdzDgwRHO5mQdq6yE8mQuSU
         J07D4cd5FUe9XnF2x6UxjKPogxQJcccBwmCGWX4Y86VRK4+gOICW0fDRPed3ya5XhnI8
         qjWozk9ck8hSuRQ7r8qoqzbFbfXo1FiIwIukXTglWnmM4taDGJEA07EVnEW6o49Al8yD
         zcQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlp6JpoP4xTN2zXmeDKUBa1kfwi9abp/cK6S+QnwwG3+BVRXCbloy3o8Pn77TDwtBZgV+3svJicJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwESPvLijqc6xCBIGYbNjDn7JrEzJ9ycc+Gtg1SdlIOOqMQyWdZ
	oKrp9VN/YIOZ5lXonZc3aIKEFmVOksalWFygK/ehfh39DzIt/+QXKjbJBb6cvdW4IFHnCuET4NU
	St6CB0NBewA==
X-Gm-Gg: ATEYQzxA1h/mZAINsHd+J3pFbkeX+RKrfQoRZj/wsC9gm84xuBNzmzHpU65+9gSE5NK
	2G9yfBJ3xEPN8PMrHqwPVbRSCrJcKIw6PrROmmkUTDXzuVJgzXipFu1ZONciWXjJSypon7tyoli
	x67D3/T8k00wsgH6x+yjAJ2WxPqHS7ixE16EWJYHYXdvKtPxppeaYXwqz4hFqXMvwP3bCtaxDn0
	HF5UUs0O5L4Xm7zh8Zi+984RZg3daJTd3OZGMlkHC53Blwti7WUQN/HfL2gAuKDypcu49Ly2AYc
	QE2dEhppgFU/4I5yhB1D2DhhiIHzXSqnRoYXl+OPqWpYKMwsY2JgGX12lFPPn/Vn7YrjOHGX0/P
	hWH+hCcLA5yTujBwxASWAy+lOjSqhdg2GHMBVdXU3UDq0qn5T69VqqV30SW2DW1EtgINmsSNNId
	9fu8sjC3ALWstyGVVtxPZhvQgusYQaV5eBntGlWeaegZyvprofIKigmFx9AvqCwMAkZ5w8hIlpf
	0LC
X-Received: by 2002:a05:6512:2393:b0:5a2:b487:b978 with SMTP id 2adb3069b0e04-5a2b487c032mr3037925e87.31.1774916600928;
        Mon, 30 Mar 2026 17:23:20 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b144f25csm2051165e87.58.2026.03.30.17.23.20
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 17:23:20 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38bd15d82bdso38460131fa.2
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 17:23:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVgzxEmbQH3wB/FNKNWnoRAe8zSI5AVo1dSW6L20YR7bLPf4JAacwosermMG+HDaQMrLPXOgCtzdio=@vger.kernel.org
X-Received: by 2002:a05:6402:4346:b0:66c:4366:3217 with SMTP id
 4fb4d7f45d1cf-66c4366346emr280074a12.7.1774916288569; Mon, 30 Mar 2026
 17:18:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326131838.634095-1-dhowells@redhat.com> <20260326131838.634095-5-dhowells@redhat.com>
 <20260329121208.6092419d@kernel.org> <CAHk-=wiJ6gEELLviexdmSHnyjVoG7MFo8Qwhd1zxs_tCnL-=gQ@mail.gmail.com>
 <1179840.1774867765@warthog.procyon.org.uk> <CAHk-=wjDKfhS5TvEfrsOgBgAvFMPfAd3wT=Um2AQb4txHq5sAQ@mail.gmail.com>
 <1317861.1774914607@warthog.procyon.org.uk>
In-Reply-To: <1317861.1774914607@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 30 Mar 2026 17:17:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wji+mTVj0vkSRJc2p38B5HaMp=oo+aUNA7CwuiguM+EUA@mail.gmail.com>
X-Gm-Features: AQROBzCw8GXLOeNuPbkp4sgcu_wDqPonncg2z7A4jKKak2u69PJv7yB-cJ3CIOI
Message-ID: <CAHk-=wji+mTVj0vkSRJc2p38B5HaMp=oo+aUNA7CwuiguM+EUA@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35705-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 764F3362A2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 30 Mar 2026 at 16:50, David Howells <dhowells@redhat.com> wrote:
>
> If I don't delete entries in rxrpc_destroy_all_calls(), then rxrpc_put_call()
> only needs list_empty() to guard against the call not having being queued yet.
> I could have a flag for that, but it would be superfluous.

So make *that* code use a creaful "delete with flag".

As far as I know, __list_del_clearprev() works fine for RCU walking
too, and that "prev is NULL" works as a "this is not on a list".

Admittedly I didn't think about it a lot.

So my point is more that this should not be some "generic list"
behavior, and I do *not* want people to think that they can just do
"is_on_list()" kind of crap in general.

This should be a "this user needs that particular behavior, and has
used this particular function to get it".

And yes, this pattern started out as a single performance-critical
networking user, and maybe we could rename and codify this pattern
better since we now have a couple of users (bpf and xdp) and another
apparently appearing. But I think that "rename and codify" should be a
separate thing (and done after ths particular issue is fixed).

              Linus

