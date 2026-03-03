Return-Path: <linux-usb+bounces-33924-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGqYHeMVp2ncdQAAu9opvQ
	(envelope-from <linux-usb+bounces-33924-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 18:09:55 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A791F46BE
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 18:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7576302F72D
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2026 17:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B0A351C0A;
	Tue,  3 Mar 2026 17:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jaPXjxyB"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944F5351C1C
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 17:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772557553; cv=none; b=pzmkn6ANX0eOsIfeq5bBEnVQTcV99txh7k1WUMwrTIoHVMraOuWKdmqn17utIhZOD2NNIgp5PY1vg8HBKlcMFhAl1Vq4lJjGOLOSVEtNhn3CwrIgY8mmepkMAFENla39LN8j4Jm5t5yIUS5qdm32A0/rlp2iqXd+jO0Fy2SD964=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772557553; c=relaxed/simple;
	bh=5y5Kv76WSgEjU6A3D6PRAOFiohKC1hHlmzKJNsGmvGU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VfnybcYv8XMdYjlq8Vw44otRm03DTO6lKlo+O80B04ToNJiGXc9Yk4O/QCgYfb3iWa2RYNY8/SItdM6qRhN2M/1XisosaVzz75x1YPKws/7U0jTqnCvLLONT2AH2C8RDphP3mp88TwEEX1J6/ZTpi2i2+G+DnjJiP0wdwVFA50I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jaPXjxyB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40488C2BCB0
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 17:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772557553;
	bh=5y5Kv76WSgEjU6A3D6PRAOFiohKC1hHlmzKJNsGmvGU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jaPXjxyB2h2RWMB/SDiTp5oK71uNOO9pli3zUPwrkBaoT5mUIROq+5UHLNXjmRMbT
	 GTErKcWmqLV+Oy6wRT/+2LOgiZZUYe2KdxGRo5+51dTH0DQmhMN9P08+J0p8J8z+81
	 CAX990pGw1eyQyDVU14qvSExY4kWhCD0cR10mvmCWe0EYOWXvpwdgc5OfLtkcQl/os
	 e3Srfsosh9p1njY7uc74OVuuN5hr0nCR0Fl+Y0C8eieMNRipMIOshOvTbE0coS4z9t
	 3jCtZ/QdVbwwrdJb2pN+OkJsmobvc+dp8WhWkk+F/TMSKh9xiZypYJt+X6IkTmgiDk
	 Iv/Jc6ls+4dlg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 38B87C3279F; Tue,  3 Mar 2026 17:05:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Tue, 03 Mar 2026 17:05:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: david.c.hubbard@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-uU24yHA1w7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221073-208809@https.bugzilla.kernel.org/>
References: <bug-221073-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: B6A791F46BE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33924-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #28 from David Hubbard (david.c.hubbard@gmail.com) ---
>So it looks like it's your issue that could be a different bug.=20
>
>Have you tried the 0x40 quirk?

I'd like to help with this bug, it's fine if we decide not to resolve the
message "xhci_hcd 0000:c2:00.4: xHCI host controller not responding, assume
dead"

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

