Return-Path: <linux-usb+bounces-36274-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNneIjG34GlYlAAAu9opvQ
	(envelope-from <linux-usb+bounces-36274-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2026 12:17:21 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D7240CCF4
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2026 12:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C592E30EA2A8
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2026 10:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B773F39EF3D;
	Thu, 16 Apr 2026 10:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LS4+ZobD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4635939EF11
	for <linux-usb@vger.kernel.org>; Thu, 16 Apr 2026 10:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776334514; cv=none; b=anONzQ6+RaQRdF3t2rgJ+7EpfbM8VlQVZVpf4hzgncyUYbgY4sRkIAlV9qf37knIvPcWcE5QwFp4LdqF7DUYH2GyWg4Y6dI0tfco7fPBfrCHks2g4ddGrEn2dE+Row4tpOvOULzdzK+kkoO/Cok1giqRZPqmicHnU4D66xvqF9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776334514; c=relaxed/simple;
	bh=DQSqAN5M9myvQOCt0gVtQxqw9Cpc8NaL22CoBBaY8mo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oVb9gEaXYUclZBc3YtH7NcKtIZAcvDZIDM+dBIPSfEFNDKrr+8+ZyNlCzJG3tkuNh2FDWjQRwVFZ7I0RXNaDOt54Z/n1YSlYSRXEW66Cqqr0K9ouZzk/wkVYdTezmyNgkj20A18PrnEhvomJXImTPYgou/EKpqMjoIoEXPjPzTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LS4+ZobD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1321EC2BCB3
	for <linux-usb@vger.kernel.org>; Thu, 16 Apr 2026 10:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776334514;
	bh=DQSqAN5M9myvQOCt0gVtQxqw9Cpc8NaL22CoBBaY8mo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LS4+ZobDyXZeUjxO/yYAPEiEpntrqJdEiWHOAAwJGE7UcfCdB8zw6S+M8jVn7Ch15
	 h2VzOkwjmcqphP2Vp+pO3RkOAj98JvV66d8/vvTpH3QirO9HG/tIdA8QfSt4QguFMk
	 sQ2j2+iytywX7os8moBZIOBb+SMFiGl2oAXYXwnRtO/LKF0QLN0hLMOOXzJO1bm5oj
	 Hmt32ivVpqK2vPOnpL3zgyOzdkCJ8eA/vsxD8dkdJsSRPv17vlaIbyQ2h82ioRN5Si
	 DVaW68LwSb3P+mu2XLxytjeVmh/htdOFYYt1BQ7GinPntJUq4rMR5oC4Z9uauN248/
	 Z7IKBFikF6GSw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0B89DC433E1; Thu, 16 Apr 2026 10:15:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221359] Regression/Warning: typec_altmode_update_active+0x101
 triggered by UCSI poll worker when negotiating Alt Mode on DisplayLink device
Date: Thu, 16 Apr 2026 10:15:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: REJECTED
X-Bugzilla-Resolution: DISTRO_KERNEL
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-221359-208809-DM4GjjGS13@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221359-208809@https.bugzilla.kernel.org/>
References: <bug-221359-208809@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36274-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 09D7240CCF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221359

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |REJECTED
         Resolution|---                         |DISTRO_KERNEL

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

