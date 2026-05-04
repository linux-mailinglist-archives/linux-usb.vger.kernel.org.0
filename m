Return-Path: <linux-usb+bounces-36908-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DEMDbox+WkG6gIAu9opvQ
	(envelope-from <linux-usb+bounces-36908-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 01:54:34 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAA94C4FEB
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 01:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3238F3008CA3
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2026 23:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE433EF668;
	Mon,  4 May 2026 23:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t3L+Vwb2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D443DD501
	for <linux-usb@vger.kernel.org>; Mon,  4 May 2026 23:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777938868; cv=none; b=jCRaaewsEW8vRXuJ6hvATybsAFcbBAIP0YxoHWLgmCJC4kK+z7bkMkGuSGGbAIt/zJNO/I+2FHAz0j0SGHH5C0RMd8g/YZ1PXMIHCsjSEVDqAfUc73BzArjlONOBZ+LUHkUPyH9WWKhs7UwomuQkhw4A3oD0pkn5i8PkjLUeX2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777938868; c=relaxed/simple;
	bh=JTNU6YLjZMTEpFkkdTyLSvZGQsgAk900ylnpBwcf1KU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BCr9xrTbZ/McFYCh8YnwENn3tuEi1m/9boPdlRRs54LsdM4TXQpBH5YgICKLTbNopFYxR21Bn2iS+kD52Q+ZIcjdFkSzRZFaZPLjsx6jc4bWWYi6pxNRQm8B+Dza9i5q6Fd0tdYQMefNcSLDQMqOkHKPgwZfhQXeCdcaAW2hYIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t3L+Vwb2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50A63C2BCFA
	for <linux-usb@vger.kernel.org>; Mon,  4 May 2026 23:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777938868;
	bh=JTNU6YLjZMTEpFkkdTyLSvZGQsgAk900ylnpBwcf1KU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=t3L+Vwb23Hl1Ufgu58qiKrAOGCOfBb0yqZ1Wp+zG8BfQyWBY+XIAkWLT4RCVDNShh
	 4pu0Rj0JXKuc2seNVGKLXPDceYuSKIkDTgV93x8/yoysx0pWED8X/qON3ghJ/XfdCq
	 hQOtr0iqatikGFX3IFp1BCFGvsdpreYF6rD4jn3/XXsdlX7M8TcjJTQgVT7Q6y7KYu
	 iBTJT882i80GZF83GnDbu2gFinRyw2VXBHM35bDtjXlLGp7J2XpiOQtJUJWBw/6mIO
	 4cQI4nfUPtlP66aeVCodjjdKjZsUpqPeTdzHFDMUH+SRD203qW0rsNQnCQC6A18Z7L
	 HgPH+JLat7hzA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 480E6C53BBF; Mon,  4 May 2026 23:54:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Mon, 04 May 2026 23:54:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nick83ola@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220748-208809-7RP35836NJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220748-208809@https.bugzilla.kernel.org/>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 3CAA94C4FEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36908-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[kernel.org:+];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

https://bugzilla.kernel.org/show_bug.cgi?id=3D220748

--- Comment #19 from Nicola Lunghi (nick83ola@gmail.com) ---
Sorry better link

https://lore.kernel.org/linux-usb/20260504233143.10242-2-nick83ola@gmail.co=
m/T/#ma81ee2dadce78c645d1a4320e0f5f55b5b58ef8f

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

