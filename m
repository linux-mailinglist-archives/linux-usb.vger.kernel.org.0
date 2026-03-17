Return-Path: <linux-usb+bounces-34962-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFgDBNOUuWk2KwIAu9opvQ
	(envelope-from <linux-usb+bounces-34962-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 18:52:19 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2E42B0474
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 18:52:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 20120302447F
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 17:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA42E37C928;
	Tue, 17 Mar 2026 17:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aXcxVDL8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7745837C0E0
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 17:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773769916; cv=none; b=JrhVSfzGQ7chwlc3H/i2pibl4SNM/s1u7DwIub61k+Uw8XRWmruUEAb1mkHQL/YwZzpsvAujzsZ/JzkYcw9Ab/rE/BUyiUx4YZBZjp5xUwBZWZK3JRJLMquhNrUEvFXAHMI5+BLYo6yzsucFzRxvwFMB3Zr1tVAcTIJZ0iYpqY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773769916; c=relaxed/simple;
	bh=I+ilDtclnidfy6Tj4YDEkBOaP9GK+LCEdVvaSh6TSLM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FDGkTmb7JNiAzrN+IzDIRQINtOeZYXPGLTef9RfuMfF2/pOtuXlSj4LcIKC4yUzpBPC7RZ7j5ob6QqkkbHLEfQkif60ZYKFhO7WGT0hoGoIm8sQHBC9Tipap2yJ1Y8mqFph7l07ABgSq7a6rx4He1yZzXapgXVmUMhU3wggSAZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aXcxVDL8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 377A7C19424
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 17:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773769916;
	bh=I+ilDtclnidfy6Tj4YDEkBOaP9GK+LCEdVvaSh6TSLM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aXcxVDL85pCEmFGKgzymuSWxQL5b1uUtw3lcL/3Ms087TYE7zNXwI3L0Bx4S3y/g4
	 xmA+Vs7GEGD5mf775TYGskNU11KiF1+feWpbofwDRP6oyBYxYIRFnY7LuUzCW7WZ6z
	 2dkkeYU6FDBBvFKZdw0CPItUqTP9iWMk3EVVbjICL883ry7fI17OX4mkyUNE2LDgp/
	 SxpXtIGD6M8SFatiIKA94/vkSj/+Uu8w+DDEVKtG9acduoyfMiV4TuxwYcjjbMn/Xu
	 qlvrwPEKph9JQVPsq/HNGnarZ8qcGRVA+dmd0GE6KXzx/BrEnHOdLMWzb3XdrU1WHW
	 4oigSQH5kJOUA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 320AFC53BC7; Tue, 17 Mar 2026 17:51:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Tue, 17 Mar 2026 17:51:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215740-208809-P8MwolXrth@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215740-208809@https.bugzilla.kernel.org/>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34962-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9F2E42B0474
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

--- Comment #50 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
Thanks, Alan. Guenter, can you submit a formal patch perhaps? It seems you =
have
a good justification for it as stated in the comment #47.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

