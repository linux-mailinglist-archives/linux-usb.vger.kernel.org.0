Return-Path: <linux-usb+bounces-34149-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCf6CWS2qml9VgEAu9opvQ
	(envelope-from <linux-usb+bounces-34149-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 12:11:32 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B8221F760
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 12:11:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 29F1E3052ACB
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2026 11:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD1138229B;
	Fri,  6 Mar 2026 11:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jt6VBqjx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493052DC35C
	for <linux-usb@vger.kernel.org>; Fri,  6 Mar 2026 11:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772795488; cv=none; b=tYbBNe6aAgriFJZtBU5TLJWE9B4qRuVB5oWSjufq6RYN9tqS8igfgF8tJASEatPC35H8Apaer0vkx1QvOhy+E2KLDzfpWZRkdoCv9k6NCMpMscjGSiWwoeJBKcny6jHPOcaveqg2OkXYXErIjzUdi49JkK52WDUaHKXTKGvyQRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772795488; c=relaxed/simple;
	bh=Le+/ecd/hyn8U2NgzSB0975Wm9mVFXD64KqEjcnfpS8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BkPI7ZyzCDVRPPqMXTDrcFNMsN2GzE+EhYRB8NEzdrdMGhcz9IQviJMnFBJHx9lLsng+lwZ9jnFU5schSOPrDKo7Qm62dCps0bAppKduM+IdRL+RSffJZux8lkW8XbXxHwY4UUbtI/GafhRiS4l3tvfQD1rOv6TtdPTSVvV6k08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jt6VBqjx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01D53C2BCB0
	for <linux-usb@vger.kernel.org>; Fri,  6 Mar 2026 11:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772795488;
	bh=Le+/ecd/hyn8U2NgzSB0975Wm9mVFXD64KqEjcnfpS8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jt6VBqjxfj3RClGzGHFGxBs51F151j/JHUevyFslXztYcZDigkxPyh9E4JTHIG0zA
	 Zxsnu8DoKehAzSITUwjecB4Q4q8/iY3MqCH3l/jUZI4OFa9GZLER9DWtPL3DQxjvZ0
	 UVlL5La2m06fgANDAWw1mfq7Y5e7V6bqI9YG/if2nW4n6srojVmd2YcEewf14Gvry8
	 wDHy5duzLc63l2fFkyb26xJWnx8G6i6VDxd/4Ze1r6pL2megUY+ByPzI7JdfF3ZpY4
	 eq8IL5jBCFgFphn2bzOeLziPcl2jb1dVn2xMCXAW5Q/qi+5/myDAaaMOlo1ybyGPiY
	 Tp5U/YrAow2rg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EE822CAB780; Fri,  6 Mar 2026 11:11:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Fri, 06 Mar 2026 11:11:27 +0000
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
Message-ID: <bug-221073-208809-wyaGI2QRjy@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 87B8221F760
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34149-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.991];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #32 from Alexander F (superveridical@gmail.com) ---
I tried moving smp_affinity to the CPU0 -- it didn't help, and it failed on=
 the
6th resume. Verified by checking interrupts file again -- the CPU0 column h=
ad
acquired 15 interrupts during resumes after the change (before that only CP=
U16
had 79 interrupts)

I'll try to modify my kernel a bit later, if the other person won't respond.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

