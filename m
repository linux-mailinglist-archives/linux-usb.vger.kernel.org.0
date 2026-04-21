Return-Path: <linux-usb+bounces-36395-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PB6LhSL52lY9wEAu9opvQ
	(envelope-from <linux-usb+bounces-36395-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 16:35:00 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A26543C1AB
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 16:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74F663053E15
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 14:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1893D88E7;
	Tue, 21 Apr 2026 14:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNTVhIfU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7883D649A
	for <linux-usb@vger.kernel.org>; Tue, 21 Apr 2026 14:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776781671; cv=none; b=sLlWrvjE+XFNQGz4S+eY0qNWyd8pGbTro4winvHYITjKgEwUMH1PJqZGYj+yKNsP/o7Z4ar5vn6unn+aCA+QKVT9bI1TcZTCf33ZqWhjpxx95a/+pI+OrYqqoxc3juX6CYeyJpiLF2HXv0ITNPUfMhb0tGatJ1BTqUA5jCsXRD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776781671; c=relaxed/simple;
	bh=Cwu0ca17jzV502/AqF0TJEkd7yZ+aJnoB+OCtToLY6c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q3VeIMnX55/aN7jDCEWMqs1acS5LZAOGsmAKtepkDymmMFLPrJGotBGuiR3Q3gDidB1b7Ae1oR1OiS/0CEB7mK7fpS0mIsBsOO2ZtCqE1jn2lhZpeXTWfKN+ICW6KOjFTCYoGbwS/ohCGfeP2m2ITMhIPrL8WK6OJE8c7REOFA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNTVhIfU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57EC6C2BCB3
	for <linux-usb@vger.kernel.org>; Tue, 21 Apr 2026 14:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776781671;
	bh=Cwu0ca17jzV502/AqF0TJEkd7yZ+aJnoB+OCtToLY6c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KNTVhIfUdC1w54xwiLWWW7IkuQb5l4u8M4/VweG4+8cWaluVeGmtf5qKks7zCn71V
	 of/dY5b1zrbKFzIzO2lC8dfInwnf+8czeEWkGtsRJu2667V+C72m1lKMgzhjYyj/L9
	 KycBQztJ0hXS9vEAcZ0rBiuhjrWibD/KUtlWtCiS1n7rO8n6Dj7jB2rMNw/rCp85YI
	 h6WEIteGW6mPv95wuS4NpwfsxuQcdep/PECmCxXSrvvffKo35DkzQh9xVnOiAbXmGJ
	 ywVF5hg2Qz8604Bjvm39voFJA+O9Jjsyz1i9gIpZyS+v6EEOrBWA5y8tjoEtwTUtpg
	 9kUwWrMutkzkw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 51F81C41612; Tue, 21 Apr 2026 14:27:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221340] uas driver hangs and causes usb reset
Date: Tue, 21 Apr 2026 14:27:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: DaisyTheFoxxo@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221340-208809-aGIoVYbqaR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221340-208809@https.bugzilla.kernel.org/>
References: <bug-221340-208809@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	TAGGED_FROM(0.00)[bounces-36395-lists,linux-usb=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 1A26543C1AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221340

--- Comment #15 from DaisyTheFoxxo@proton.me ---
Yes, I would very much like to try some patches
What version will the patches be for?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

