Return-Path: <linux-usb+bounces-34534-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sO24OkA4sWkLswIAu9opvQ
	(envelope-from <linux-usb+bounces-34534-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 10:39:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 500FB260D06
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 10:39:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8646346DAAB
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 09:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90993C7DEA;
	Wed, 11 Mar 2026 09:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CFBiwqk1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0765B3B95EB
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 09:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773220999; cv=none; b=gZHA5wVQE+WYNVJTThhKfCQarRbAdjwrGJfL9yOSNfPRw4OOET4qhzMwurWH2IXciweThLR/EJV1m/szNAATdEarAN3xhXWu3qTLTguOIEYYK3n7U1xP11gt8TH5CvjYfGzeqNzMVoELOPONByEAVYm+A0AGRKxZR4B68yaVL48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773220999; c=relaxed/simple;
	bh=flCu8oESJVjEZ6MyLyLbF/TEmBmmVlnuHtexQzW+WlY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CTxjsUyVc6wdHsVaDfjN3pPIdJibioRjTJXzFkI3r2W3KdXfycQJ/J2QG1csa5RNGafn7aNYEsGhopFJM+Q6UwI6Mn0Aqu84S/gb25Cp8JqPeWUZ3zo3wKvQQNJvvD1+ovtCXCpJLGnjl2JtZzPeqZuEUWlUxi9PbnHKge6ipyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CFBiwqk1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 696E2C4CEF7
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 09:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773220998;
	bh=flCu8oESJVjEZ6MyLyLbF/TEmBmmVlnuHtexQzW+WlY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CFBiwqk1iQiOk/EtLzGp+fERGi9kl1VOzdx3Rnbjci2ooxwAFub8bIlsFK6pYwccz
	 PhnfvkXMYwOM1O0kpwDv1cdHy+dLm2Jc6aNOWuYFdvGbY22zS6pAy1A0PaI3fYQXtI
	 1BaEl5SXCqipT+2c80fwk63mMAPvE5KYvsd1T3dxkpPaVwBEuyM3e+jwNLZ6FrpM1M
	 AMdPtJD4LqTZNryCuHbwwyGCKA6WiD12aE6OjBgz6zONr+eky5FnYJCUP/VgGeLxpT
	 HqxoLT2uwoQolcKm24i/ot+PvoSePeRhedCrvCzlpnDzqrwIu5UkH+2D3Id+AGr99T
	 hOa5C3elI1pNg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5D1B0C3279F; Wed, 11 Mar 2026 09:23:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Wed, 11 Mar 2026 09:23:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221184-208809-MclyuKTjFQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221184-208809@https.bugzilla.kernel.org/>
References: <bug-221184-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 500FB260D06
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-34534-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #37 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
(In reply to Liam Mitchell from comment #34)
> In Documentation/driver-api/usb/error-codes.rst:

This documentation is quite old, not necessarily matches evolving landscape,
and nobody is updating it. It's not even entirely clear how to handle the m=
ess.

Discussion on linux-usb from 2024, nothing has changed since then.
https://lore.kernel.org/linux-usb/20241121001138.23a45f6c@foxbook/T/

You may need to read some USB 2.0 spec chapters to understand those things.
8.6: the toggle protocol and retries (usually done by HW)
11.14: the horrors of low/full speed devices behind high speed (also 3.x) h=
ubs
5.3.2: how host HW and SW were envisioned to work together
5.7.5: interrupt endpoint halts due to STALL or "transmission error"

Simple errors (corrupted packet) on bulk/int cause three retries in HW, and
then the HW halts and SW should intervene. USB 2.0 transaction translators
appear to introduce a new problem - the HC failing to fetch interrupt IN da=
ta
in time. AFAIU such packet is lost, but the device considers it delivered a=
nd
won't resend.

(Not sure how it could happen at all? Maybe DMA too slow? Perhaps Roman's
problem isn't really CPU load but RAM traffic? Not much difference, though.)

If I'm not mistaken, there is no sensible recovery from *this*. The idea was
that SW intervention would use class-specific control requests to learn true
state of the device and put things back in order. And reset toggle on both
ends, which is usb_clear_halt() in Linux.

I don't know how/if the HID spec recommends to deal with errors. Ideally, t=
here
would be a way to query the state of all keys, but maybe there isn't.


Retries are an option too (though AFAIU they can't help with a packet lost =
in
TT) and xHCI is very helpful and makes them easy, but only if we don't give
back the URB. Maybe we could have a flag to never give back on EPROTO and j=
ust
keep hammering until the URB is unlinked (due to disconnection or otherwise=
).

The alternative is to fully reset the endpoint and clear its toggle state, =
at
which point the device toggle should be cleared too or there is risk of
silently losing one more packet. That's what xhci-hcd does on every EPIPE *=
and*
EPROTO.

In theory we could do a "transfer state preserving" reset as if before a re=
try,
and instead of restarting the endpoint skip the failed URB and proceed to t=
he
next one submitted by the driver. This would match EHCI behavior AFAIU, but
it's gray area - not obviously forbidden, not discussed as an option. Chanc=
es
are some xHCI HW would get it wrong. Some HW can't even get basic retries
right. I thought about it but never really tried it.


So existing usbhid behavior seems to risk losing one more packet after EPRO=
TO
on xHCI. You could probably see it - when a key is stuck, it could be neces=
sary
to not only press but also release another key to fix it. Though I admit th=
at I
tried and failed to reproduce this case. It seems I'm still missing some
detail.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

