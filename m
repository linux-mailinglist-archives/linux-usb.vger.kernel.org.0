Return-Path: <linux-usb+bounces-33917-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kA7+IWwDp2k7bgAAu9opvQ
	(envelope-from <linux-usb+bounces-33917-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 16:51:08 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBAF1F2F20
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 16:51:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 548C130E14C8
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2026 15:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4662E47DFB6;
	Tue,  3 Mar 2026 15:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rPleRY1l"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB8737B039
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 15:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772552860; cv=none; b=JMcJDWjj67cQK9zli39tLgBVshJ54bKqXU5D9tBNmREyHwwORiFfnI67CrY5RFLcDBaNPZm1dn1tdLFUl2kDOPSc4VQki39t2jy5BEcxKCN5THmpEtPjq5CNlrB/ImybrsxhEndI/+jLNqk6FDAGQ7sTetHs+LfU+x87Aq0fAKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772552860; c=relaxed/simple;
	bh=Y+yxlSmkZdcZtdPVHSFQg4lKrDHQRxABvdo3Cj5BKI4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aJfi90QmDpl3p9huzjYvFZwGKCHElzvCWkdCl/VfayrCEuQdLBJxu/HvdRnMxjZj6RXBTwcUJGetNDB4y8OsQuLEwwpwvlHXfrSkhXaRZDWbZ5YMk7QoVDjM4s5Vd649CPqnRpmmWJFA/9Jad0/4FPP2aOrmLDouKOxxemo1fh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rPleRY1l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFEA1C2BCB1
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 15:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772552860;
	bh=Y+yxlSmkZdcZtdPVHSFQg4lKrDHQRxABvdo3Cj5BKI4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rPleRY1lpNtLYYXHmNPM4nbm1SD4Cen2yoE6Ej6iP/RbPb+kNB6K8baNLgptYAw40
	 2YAMUZpk43AS9iHWSB5cboFEKp/4/khX0nS9+XAWeqlfAm5McFNfLjLcIY+wRsfXqp
	 IV33+LhdWNHLVL/2RuwRHTwGBYdETjSHeTDpYvZhOmUw5F76owk8t4chwiKLJXaU1b
	 AVTisCWuQ34gMiTmdL30H8IdejXjW50psstrzEL7AEZr035rGADe/yLeaKgRABa7Cd
	 qRDwfbMiMFu6GinJVj1A4bnmXrrKc8bv2B6m5ISR5gFze8FJtwR6oviGF9rRd+OZCc
	 WaXyRvYhNp7uQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E876FC433E1; Tue,  3 Mar 2026 15:47:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Tue, 03 Mar 2026 15:47:39 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221073-208809-n83Ed9YMl1@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: DDBAF1F2F20
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
	NEURAL_HAM(-0.00)[-0.989];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TAGGED_FROM(0.00)[bounces-33917-lists,linux-usb=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #25 from David Hubbard (david.c.hubbard@gmail.com) ---
Created attachment 309531
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309531&action=3Dedit
comment26-dmesg03.gz

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

