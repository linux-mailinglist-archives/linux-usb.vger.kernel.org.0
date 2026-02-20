Return-Path: <linux-usb+bounces-33504-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAlhDIUomGlqBwMAu9opvQ
	(envelope-from <linux-usb+bounces-33504-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 10:25:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 823C3166302
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 10:25:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B16A305D1DE
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 09:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D7531ED68;
	Fri, 20 Feb 2026 09:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YHsj6d4A"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D11831BC8D
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 09:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771579444; cv=none; b=uEMtIiP0OCzu1IVgsfPx3eWMf4cuoVfo++KfwtRxdar9e1fRvcZC+3GHRYzGSPJRguOFFeeYwgykbi2wBriIg3mvWzrtT1ppGtyKvgxL3UfLlO0XvRlU7+TcLlB4g/ez3DqN+dtX6E7Wns0NBaTFunY3Oqz9hjg7YtOEQZpKGDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771579444; c=relaxed/simple;
	bh=V37mKVK7eyc/2tTF5yNO+Evv+jzEHYsC8sN0b6YBhSk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SCC7DzbSV6dIdG4pLxx62bYn0vrA8odTLwI8yjeEo8XgVcsakhGOwhPyx9gHHcC26A7ZmwyUwyBtDwGqdHp/iAhasAuNnyEFmO4GnNXiJ2luq++gTJsNz7FpFOBRunmYGdRmuFlmA9MakTZY2QBHNA6M1NDmzfQwB4Xzm9xaiF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YHsj6d4A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38FBCC19425
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 09:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771579444;
	bh=V37mKVK7eyc/2tTF5yNO+Evv+jzEHYsC8sN0b6YBhSk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YHsj6d4AoKfDwNLKtoUWqf8T0lDhVtAsFJgx2fPgUn6ijvBF+TQgzA79q+qpferLq
	 OPuTjgfWyPtSiov3/ekD8kUdRa4wTmaUbYTeAtbxwgNf6eN9Q65boXY0IZdTxspWTf
	 c85H3DcXxdIHqczTlqh+7uZX72H4pVV0XUHFT2D1oGkL3AkoA6noOVsb/yA7MDajN6
	 v7cJgTEkvNPdnaPwSIHFdEXutT+dzBafrCsKWYv8VUJNHGKHZm6SPamcIFLerJiOqG
	 rvNXI1/FYeafemXgLt61Lod+d6Am4dVwgoQ9YnVnNUJ07ha+DC/aaBC/5feKjEHHmS
	 LqwRbE0VOsGhg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 231B7C3279F; Fri, 20 Feb 2026 09:24:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Fri, 20 Feb 2026 09:24:03 +0000
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
Message-ID: <bug-221103-208809-Cvycv8MWBk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221103-208809@https.bugzilla.kernel.org/>
References: <bug-221103-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33504-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 823C3166302
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

--- Comment #5 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Actually, it may still be a problem with xhci_hcd because I found that simp=
ly
opening the USBFS file causes some xhci_hcd debug logs.

But this ioctl() looks like meaningless noise, the way you call it it's alw=
ays
supposed to fail, either with or without root.

Does your system still crash if you remove the ioctl() and simply open and
close the usbfs file?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

