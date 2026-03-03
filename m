Return-Path: <linux-usb+bounces-33923-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCSlL3gTp2mfdQAAu9opvQ
	(envelope-from <linux-usb+bounces-33923-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 17:59:36 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3C31F43FF
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 17:59:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6D2730120D0
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2026 16:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F773E716C;
	Tue,  3 Mar 2026 16:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KGkTFRo7"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1200D34F46E
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 16:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772557151; cv=none; b=FFvWBoPWN1qxgnBZ78kOResvmuYqS4LNb4IlokcIIicLEONVMbTTUyZt23zOF4nSggAau6U+/qlpvzgK0AWiAtXVzxaWQdw2dN4Yp3m+SzqlLtcpL8vvt0CUoSo36x+EJAnCPxbwOm/AC/bpl35/Od8bwDzP6Q0tAT+mOgVJN4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772557151; c=relaxed/simple;
	bh=LPJK95eeqIgBDa2TPB72zFz846Bjui0lvWveSpoycnY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XrNZQKUbvylPi0J8d2bGNj05RaMhMLy3H+RiXtt3gRrqOlG1d/SZQVx5tsRifPXgAOjP4BRwzZlLMQPEI1k64PBb+QfCopk//SStB+hB8YojHhWNCimnQByUtq+GYNC6cY3x9y2BzKFyNR+p4WbAuBye3qfpQlugAQdghvAl++c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KGkTFRo7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8DC1C19425
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 16:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772557150;
	bh=LPJK95eeqIgBDa2TPB72zFz846Bjui0lvWveSpoycnY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KGkTFRo7vujsFSVzFC47t7KqkWuV1DO9briteCzzzVvHdMN+DUIXB2KmO6Rba9Y7K
	 dL1TDZu8G8ujuAiywjeXbeywOPmGkfH8UWW3ngmltE5J5g2eID//q27UHz9w9Bsfzr
	 b08whWhUbPL0so8CJSavTatdYqQxd1dj7J6ddEXxrGkg8pbtJ/W2N9ZBYnmWfYWHHb
	 18GpAzjEEKpcJb7mH8tS8DijIfUd9aU4++jdvPELzg7dd8IyXNuN3A6liYc775KHDs
	 BJ+mVre5vDD8zCjD8dmCBkCld5XnsLd8a+mXA1HHwJEPbho7aKna5kcNxiykZzmtfn
	 G5Zal+uIby0ig==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DEFA1C53BC7; Tue,  3 Mar 2026 16:59:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Tue, 03 Mar 2026 16:59:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: superveridical@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-2IDhRBesqC@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 3C3C31F43FF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33923-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.988];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #27 from Alexander F (superveridical@gmail.com) ---
>Maybe the issues with resume taking 10 seconds in comment #19 can be
>considered separately in a different bug?

The initial bug reporter's dmesg has it. My dmesg has it. User uioped1's dm=
esg
on github has it. User Neilson_Soult on the Framework forum has it. So it l=
ooks
like it's your issue that could be a different bug.=20

Have you tried the 0x40 quirk?

PS: I forgot to mention that I suspect that the instability I've mentioned =
in
my comment could have environmental nature, and my device could be perfectly
fine, just prone to ESD / static charge build up -- it's been cold here, the
air is unusually dry, with the resulting static build up. (I've been zapping
things)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

