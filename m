Return-Path: <linux-usb+bounces-34378-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJ9CIEOzr2kSbwIAu9opvQ
	(envelope-from <linux-usb+bounces-34378-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 06:59:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D567B245A43
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 06:59:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E91D306DF3C
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 05:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71F23B960D;
	Tue, 10 Mar 2026 05:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fENU1rfa"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E052D0606
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 05:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773122366; cv=none; b=fO1a32R3K26yx2XFQNAVzFQTCZKi16PqpXI1nffMW4b8HOmU66l5lzVkCkbV1xWITCk9mNreQ8MTb3NkZmWbsg4tAtvQURjKpU7WuFaGe2t4mmwsKpoLbPTnvDqzhhNi6LGFFUWf2giCBDzdInHGqegHIFxkQaY7Ir/LN6/XKRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773122366; c=relaxed/simple;
	bh=9LvQjrsx1r3xsDJro77n8gARbRJHZz0jm0MhZpPaGxs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lwTD7tSeIeCOwL3y9SehLvSNBJW7ph62pgLCM8kxoYW5ejpJqdpd3YRZjZbpG8exoV5s98f6pGTw9sF7iw9OHLAuYjHcAkpKxW9epijnr1ynmB38Hn3bpSk6ZzDZl35cS8mBJ8sxx7FStc5pio1DJElEGEn9hhvd6hLuAEL89CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fENU1rfa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4FC1CC2BCB6
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 05:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773122365;
	bh=9LvQjrsx1r3xsDJro77n8gARbRJHZz0jm0MhZpPaGxs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fENU1rfaF67KxUptNEk6DnP+j2zmEq/BVokvxZPGFIirz/iK6PDlVjqr4B3sAl0u/
	 MOcnyEup+mHQpl8l1wL2Ah2y8LmgUPv5dzbRUfoIBjU8ahSzOK0Tih6ZURo7xyG9LE
	 5UXB700wqakQyZtL7IpvI12POCW7upq+nhmePVFzwoc5TIwDBEug6O23rYPK73dDAR
	 7mcPH7YWjLjy7ONP1kV4NWcJk3Z/sTMv7/pO6qq3yPETfkgvsPdTwm0vb0XP6giKWb
	 SGsVsp9SwjmXigF+BIxipz8TYTARVb0tSgayDb8+8S0z5M1k810JpyoF7r8X0BnBer
	 uY9WnIuiji9Vg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 19749C41614; Tue, 10 Mar 2026 05:59:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Tue, 10 Mar 2026 05:59:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: roxmail@list.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221184-208809-y9ZGDADLKK@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: D567B245A43
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TAGGED_FROM(0.00)[bounces-34378-lists,linux-usb=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #30 from Roman Elshin (roxmail@list.ru) ---
> All of these are USB 3.0 and use xhci_hcd driver instead of ehci_hcd,=20

Ops, out of mind, this moment, i have a several pci cards (ali, nec and via
VT6212l), 2-port ali usb2 card was also tested and it similar original repo=
rt,
but in general ali looks very buggy (have a several ali cards).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

