Return-Path: <linux-usb+bounces-36314-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fQUJKcIV5Gk1QgEAu9opvQ
	(envelope-from <linux-usb+bounces-36314-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 19 Apr 2026 01:37:38 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8878C422989
	for <lists+linux-usb@lfdr.de>; Sun, 19 Apr 2026 01:37:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7C7213008610
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 23:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1BD23A3E79;
	Sat, 18 Apr 2026 23:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h6eCYFRn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7278A233D9E
	for <linux-usb@vger.kernel.org>; Sat, 18 Apr 2026 23:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776555452; cv=none; b=aNht/g6X4Cw+y/GTLcY5oyI4JtAUU7xCeKwWakUTTnR5eZH2zmYL4ChlM9UV258pQLpdpUnk+ddNpilJeuip4roWIp9g1RrWZMv564QiUGxPLu3/p95PV3/msLDf6KjWlyFYxpvw5k1I9mP2p3TmBsYpEPuJ+piiTYIA8qvzXo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776555452; c=relaxed/simple;
	bh=9oGSI5qz4BapdIlXBmnCfj9Oi8BB83sMUNEbyNl3rzU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gztegaEfMLR33qsZByo7UXjRM7qzED3laqx5uKVVNgw8BtsHcpdUJnPZJ7/nudxkaFrCxqIeoxHwc0CERxfxtcWAG1WbnxQRnQ97RqqUzDm/5ZxZmICuDYcUiA+Pnce4Pn6zuoX8If+nbWIia69Iu6OAKRignA+2janQW3D4ltQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h6eCYFRn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08E3EC2BCB0
	for <linux-usb@vger.kernel.org>; Sat, 18 Apr 2026 23:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776555452;
	bh=9oGSI5qz4BapdIlXBmnCfj9Oi8BB83sMUNEbyNl3rzU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=h6eCYFRnyvmGjZrL1XSl3G5O9ObypZyvY1/OBoGifjZC4gvG7bE2s8uLxN+3OAPib
	 CEbAIssNQPvRedRsncSWiTyLfUB2wUbQjW/co5mxEct4seITcfYu7vWdDCr3xnzGyc
	 hOm0S/7GM5LRN/nU9t7fM/Q8MFxCwF2r7/AzX8zI1if0hI+JGExKDdyItKjtq/MJ8C
	 dA1vtQoZwREjj2BKM/bdUXR1gtlYKKwmCm70ZC7+3logf0Ht3dlNCHG3cncNRlcu0N
	 +nVlaH8kAA+6ExB1XFhaKuxY7YLoGohEs5eUq9IAbG8XsjXPLqAg4QkfuRlp1fk2He
	 oCoPgn5wYnTcg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id ED21BC3279F; Sat, 18 Apr 2026 23:37:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221340] uas driver hangs and causes usb reset
Date: Sat, 18 Apr 2026 23:37:31 +0000
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
Message-ID: <bug-221340-208809-VasuYAtjKi@https.bugzilla.kernel.org/>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36314-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,proton.me:email]
X-Rspamd-Queue-Id: 8878C422989
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221340

--- Comment #11 from DaisyTheFoxxo@proton.me ---
Nevermind, It happened again. It took longer this time though

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

