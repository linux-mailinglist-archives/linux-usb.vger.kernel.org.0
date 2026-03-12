Return-Path: <linux-usb+bounces-34701-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDf7K6H5smmLRAAAu9opvQ
	(envelope-from <linux-usb+bounces-34701-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 18:36:33 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B212769EF
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 18:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B325030299C6
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 17:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5063FE35E;
	Thu, 12 Mar 2026 17:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RchY9fAG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0373C3FE35D
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 17:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773336988; cv=none; b=lXBj+vldQiA/pwsRpqcr6wGUxXUbh1ZQ5B9kYsldI7hlNDBKceG624DgiorysG2Wrt38XzTi4DStavJ7ZThSBmUo2pVhdfDrzRGhrWpzbR6RkEJfL9ePBZaJ+PEZdIm5Uy1kEgRaDcDIklEE7v6RYBNhhIVN5uIWbcTiTetdLLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773336988; c=relaxed/simple;
	bh=Qc/LEVJZ6WZS6ZVbf8EoScusrGLf4SGaypzTOx2WBkE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qaiy+MSbNjeMztxkMswO9OfNoqCyQE6I03ETd+CQhCsLd/2bMbQAOMWIquFPsp8QWZehyKHmpU4G/gN7o/Tg+EqrC41nG4PFNkgziX3vZrR60r8+avrDLySN3YKhIi7O4pLpKvQRKnNQLP6oOmRA5xtZ9bmzuDSmPZGFs1L0ORY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RchY9fAG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7DA54C4CEF7
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 17:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773336987;
	bh=Qc/LEVJZ6WZS6ZVbf8EoScusrGLf4SGaypzTOx2WBkE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RchY9fAGpt+xTxxgKHGVOlWzCylV6d5qv434g2r9WswZY5UucQWbguEcexRu+TGum
	 KVqnbmYzSwsIUR/heVS1i1IzThueHSVO8eeGJnjzsizP9UznINpWgKwgTbzzGEvKkA
	 JXAN3nffe5Fbunjo2WMSkYpqhpOP1wYWPAuKvlDqrXmDj7kuHQ9ls4Iuc/EXFD5tPo
	 qnonYrnEJOKuFjEETlSfrdtdogIJ1DlszKReTSg2I4SQzWB8bRtxr8X8w22P87rYUZ
	 r3Z/XD2ZeQM/7h57QrLxCkbz7IhUXEjGMm8XKQtNnpj7Mrln2LcCrt+8PqYgjTEk7b
	 QB4qlJFzgxeoQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 76FB4C4160E; Thu, 12 Mar 2026 17:36:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221216] ezcap401 needs USB_QUIRK_NO_BOS to function on 10gbs
 usb speed
Date: Thu, 12 Mar 2026 17:36:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vahnenko2003@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221216-208809-jEtkjEvhdA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221216-208809@https.bugzilla.kernel.org/>
References: <bug-221216-208809@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34701-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B6B212769EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221216

--- Comment #3 from Vyacheslav (vahnenko2003@gmail.com) ---
Created attachment 309633
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309633&action=3Dedit
edited file

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

