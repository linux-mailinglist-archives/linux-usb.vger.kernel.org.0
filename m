Return-Path: <linux-usb+bounces-34183-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBnELJISrGkujwEAu9opvQ
	(envelope-from <linux-usb+bounces-34183-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 12:57:06 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5291522B9E5
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 12:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 308213023339
	for <lists+linux-usb@lfdr.de>; Sat,  7 Mar 2026 11:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256CA358363;
	Sat,  7 Mar 2026 11:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="no/i9S+V"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A870D34F46F
	for <linux-usb@vger.kernel.org>; Sat,  7 Mar 2026 11:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772884565; cv=none; b=mIeh3JDg+fQwA0RG0U2f67ShJeVE9I1lpSFRfqsEFeR/g0mMtJ3mpJVBHUuHjuFJrz2WV6VFs9SGtiBhQ6ed3aaXrtR8zPjxteCWYFSqLL1SPfgzjpPVEa430NSIxNBRRaOIQuLG1lTkkcBkoUdll/RWTk+CWQSmV/6n97wwVjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772884565; c=relaxed/simple;
	bh=5pj7o/5fWl/hXZJcv7zohYfeUeIPwdqsTLUXiywzROQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ND1MWjakrDcvvE8ahyxKHvaKDRI6NGDHtR9EGs3kUOkC7KwEMxeBOAoSee3Ls6Lt1cwU6jaS0Yy4S7nw1/uegL1Fh9VpND/topzULPK9yDSKS0dIiaupOoBxI85Z+SenlFfgOl1H1759+y7c6yFQdlANDVI0IDmvdj0K8bAW6m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=no/i9S+V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56F01C19422
	for <linux-usb@vger.kernel.org>; Sat,  7 Mar 2026 11:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772884565;
	bh=5pj7o/5fWl/hXZJcv7zohYfeUeIPwdqsTLUXiywzROQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=no/i9S+VwG5eugjV3F3o1RhWeDZIiaHPDDkZQIKPkvTGeHeSwuoZmVe3F4Yi8xMx+
	 zwrJLIJKdM0YXjpx1jK2bQJUk7VlBoHpL1eH5SO1gxLBo358xkx1GuixGJUtV5H02v
	 FAPj7pEakI11TXYsxdPmcL1g9T/sLTKSs4hwHoLcnSq2YMgxYIN9CMyI96Of099Khq
	 5zzzaFj5XFbKLLxkC+SRUQ5hyRmsvhzOXHt1G2SQV1HhoXfdfwj/1yfrCrn3Yrr+C9
	 GlEwHsqZPWqx4ACxcQWMHKfphWYY2rdEvFe0RIbHaGCiE3Kw71jBbvHge+CjKbimjt
	 H7wUyIAzlE3zg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 512D7C3279F; Sat,  7 Mar 2026 11:56:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Sat, 07 Mar 2026 11:56:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: roxmail@list.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221184-208809-jcwUID6O9p@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221184-208809@https.bugzilla.kernel.org/>
References: <bug-221184-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 5291522B9E5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34183-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.986];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #1 from Roman Elshin (roxmail@list.ru) ---
Created attachment 309565
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309565&action=3Dedit
lsusb -tv

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

