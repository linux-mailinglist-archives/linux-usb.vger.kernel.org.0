Return-Path: <linux-usb+bounces-36529-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNCcANIs72mb8wAAu9opvQ
	(envelope-from <linux-usb+bounces-36529-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 11:30:58 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAE046FF14
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 11:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1FF953003D36
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 09:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706673B2FE7;
	Mon, 27 Apr 2026 09:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pj117qms"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3523B2F12C6
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 09:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777282253; cv=none; b=POgZ1DijRmE6DeXi7m7o0Q6u6J4kUup8KpoAjv3+znaFxw6Hee7ZXevz7A4Q+ICsC1kyg29jcsOWkhdyILmyNmDTSCk2L9rmsGYErwQpXVirK2etOoke+xHmGG5Th9iG+u6olPL2f7jSRoyuyiDHNy1wKESOebxe4apnqHdePGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777282253; c=relaxed/simple;
	bh=c83iVeeBNDrqMecbmGxvaVuY/w25fMbRx/tLtGOO3Ak=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N0KwLozM0L5++xOBZWq07+LgmTrddHe5v8kSqjc3MRoRCG4apkc7DWcXU4Ot50IY7EI7N0RfvS+W26XMUzlNvs5oGrd3Z8KGdslRe/oxdoQRPCpRcaL3GYdrecyKDvv4JB7tbwxAveagFytbFhqAYuV5DemLYWscuJr7NAZH3gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pj117qms; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F4C6C19425
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 09:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777282252;
	bh=c83iVeeBNDrqMecbmGxvaVuY/w25fMbRx/tLtGOO3Ak=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pj117qms/SJKSeEhQT6CT8e4Lsn8M6wnyHaqt5O9RcwAWAmKA6inUP8LdftUTgj9A
	 q5J09fUrZNsHFMsB4KmszCXH/v3HB+zWFD7i/BPHlGCavrEFSWsj+o8EsDuhsdvel7
	 o8F5VJSQXAwE4MvOUZG0VF/l0mRrO0g0+NGSpqSJsn6oGuTNM4Xn52MghHjnVWGx9s
	 uNLr1lZmg7qllMmJolj1ZjtChubOejUaGJU3NjVZo9OnU2qL27Vwd8Kdg+e6En4Eka
	 duNCfZRTdDDwWSmmHCRsEwFjv4hth/1HSHYAtQ8RkvKWg50kL0F/f43XVLVwwbH/fE
	 JoLv7apqZ620g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8E27AC433E1; Mon, 27 Apr 2026 09:30:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221424] USB auto disconnection
Date: Mon, 27 Apr 2026 09:30:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221424-208809-eKQKdCGwEl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221424-208809@https.bugzilla.kernel.org/>
References: <bug-221424-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 8DAE046FF14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36529-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,gmx.com:email]

https://bugzilla.kernel.org/show_bug.cgi?id=3D221424

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
Can you test Windows on the same hardware?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

