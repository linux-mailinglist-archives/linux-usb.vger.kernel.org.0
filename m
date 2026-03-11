Return-Path: <linux-usb+bounces-34520-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJ/oIHomsWnJrQIAu9opvQ
	(envelope-from <linux-usb+bounces-34520-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 09:23:22 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E43B925F158
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 09:23:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 864D8328D491
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 08:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64BCB31714B;
	Wed, 11 Mar 2026 08:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lz+o0Jsc"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB6A21FF2E
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 08:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773216391; cv=none; b=cPpGD695RnXLaQ4rFE0xnj+mLZ9pL/ubBbIvpHAjZUMHznk0UGyZw6/peLZra3D9LBaSRYr7dqJoQrJZM7EGSZZNZdl9RWPRxOPxrQcORspOiSo0RVi/o/HXNXCA66G11umoB0WUbXp96D3uykIR6Tnpu3zQ+qNIbeorlXYmPO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773216391; c=relaxed/simple;
	bh=IzF1bgLvbL2CykG7VZAnX18WxPjLbE5JV720h0nKq2w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D485J3mV9Zq2iQ3M1iGTU5PWBwBQ0sKGWWKFaFqXEVvLPMgsGmcpk2EGHKrRxvVg7Zw+TcljdHHUv6e3V04MVz9/rPB/hYzzrOP3ptRqtZl8NxsYwPd1CsR8i6p0V/BjsF/U8WQ7jH7azl1mXU5SDvrZmltfYnebRO0za/ThpoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lz+o0Jsc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8DAF4C2BCB0
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 08:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773216391;
	bh=IzF1bgLvbL2CykG7VZAnX18WxPjLbE5JV720h0nKq2w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lz+o0Jsc3Yf5Ojuo28yaAKR6jXnu6N/d4AunvjEocDP6mzugvInNwn2e3BxikYE44
	 xX8trnlFCWI4sDnWAkJFP6E7R8p72Yi7cdvTKadFciMZSwfneCq7Qt5y54xGwtlEYb
	 LDoL+mtVulPUob8PqyMzd9Ava7J6iK4DGm+0hCIRYHc8k9yZB8OqdaE1pjyhXAO8t1
	 9JbUWuZzPelssOsdtEPH5rmaxxJrA0Y+6WJE89Cq1/+hUiNm1hBgkg39RhnAnijPx2
	 RZi3EvU9udLY1h7Q//SP8LS9Hxz2Rd2lO5S4E5ZyooN9LlGBC+AJZaGWlASZebY9yz
	 hYNpCquxBB51A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 67F5EC433E1; Wed, 11 Mar 2026 08:06:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Wed, 11 Mar 2026 08:06:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mitchell.liam@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221184-208809-IBwKN02Vqe@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: E43B925F158
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34520-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #36 from Liam Mitchell (mitchell.liam@gmail.com) ---
(In reply to Alan Stern from comment #35)
> Yes, EPROTO represents a communication failure.  However, it only means t=
hat
> the host thinks there was a failure; there's no way to know what the devi=
ce
> thinks.  Furthermore, xHCI controllers require an endpoint reset in order=
 to
> recover from the failure.
>=20
> As a result of these two facts, it is entirely possible that the endpoint
> state held in the host is no longer in agreement with the state held in t=
he
> device.  If it isn't, a retry would apparently succeed but in fact the
> device would ignore the data that was sent or repeat the data that it sent
> previously, or maybe not respond at all.
>=20
> The only way to make sure the two states are back in agreement is to reset
> them both.  That's what usb_clear_halt() does.

I see this comment in drivers/usb/host/xhci-ring.c:
>        * Proper error code is unknown here, it would be -EPIPE if device =
side
>        * of enadpoit halted (aka STALL), and -EPROTO if not (transaction
>error)
>        * We use -EPROTO, if device is stalled it should return a stall er=
ror
>on
>        * next transfer, which then will return -EPIPE, and device side st=
all
>is
>        * noted and cleared by class driver.

From this I understand:

1. xhci has the same understanding of error codes
EPIPE is a stall, driver should clear with usb_clear_halt()
EPROTO has no expectation of driver clearing halt

2. xhci clears non-stall halts automatically

3. stalled devices should continue to report stall even if first report was
missed

My understanding of usbhid is that it only listens to independent event
packets. There is no protocol state to keep in sync.

If that's correct, the optimal handling of EPROTO is to resubmit URB as soo=
n as
possible (with backoff on repeated errors) to reduce the chance of missed
events.

If the device is actually stalled, an EPIPE should come eventually and be f=
ixed
with usb_clear_halt().

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

