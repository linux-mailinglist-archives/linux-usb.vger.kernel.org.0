Return-Path: <linux-usb+bounces-34493-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJJ9OvNmsGloigIAu9opvQ
	(envelope-from <linux-usb+bounces-34493-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 19:46:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AB62569E9
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 19:46:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 556E13048906
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 18:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79EDF3B6373;
	Tue, 10 Mar 2026 18:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bm31HsKw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831E43C342A
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 18:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773168166; cv=none; b=rX/F4Ji9SIQZnKqWjkIHCjgtNh/1PBJwPlG4gDxmzw4f/yF/sc5gaisDwRaslZ05RoBp2SVnBScDjF5jD4lfBUJufvb6ISYlELvtYfQK3gvFHoizJonizHz9b8x8IYGHYXLaj6AmMvyQ6lSfn9WkBT/3XdKZWzJb5yZp7QoPsv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773168166; c=relaxed/simple;
	bh=eccCeUdOUcR/ocVoNYEfOg4MmqLi+0hMJ5zD0xFd/7U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r8OjGXlSTJbXqHBUQjXNtfeOx4Z07iGRsarnd3l2B4q0vyh0uatoXsnhEO1k8hywGzBpRajbJg53mCyQ8vRogYzvJSoV2Pi0c1xeaNrrBKvOJXXYc+1wlz1Bdt3D0jvOk6RAzefovL0Ugs1K3pNDSWAcArTeWiqMPBN/MHcy5W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bm31HsKw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0872FC2BC87
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 18:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773168166;
	bh=eccCeUdOUcR/ocVoNYEfOg4MmqLi+0hMJ5zD0xFd/7U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Bm31HsKwbVTsHc3qrvl5/KeVx1CJdkPwP+WyQ2SjaWYiwBUI1CFr3MmFkfEm1B3U9
	 HvLk1vzA6X2Z1X3gmPAOrXIzjuQYDAeqZ/7XvBUy9QPF2h3W0wRWy0hHtjfTUeymY/
	 Z3BBI3j3IDKWxOEuf/JGG4iFfDdt1VGV5dDLYiD+l4MYb0yeRsLk1xceybDz7GZBs0
	 YbWgQq4O3vebFXeWFL1GT7AkeTpUVhMy+Aq/QXCzbHJ26ce+Eg7AfggLelZ18GH6GM
	 jVXmbautOfSWaQyXNM/fbZnzviQjJ82zdD35T+5w6zyvc7dxZHMgXhehKhyvQa6pC0
	 5/jOztLRnslBQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E6AC3C41614; Tue, 10 Mar 2026 18:42:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217475] Foxconn / Hon Hai Bluetooth adapter 0489:e0cd stops
 working on ThinkPad T14s AMD Gen1
Date: Tue, 10 Mar 2026 18:42:45 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217475-208809-UJv1QRv110@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217475-208809@https.bugzilla.kernel.org/>
References: <bug-217475-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 95AB62569E9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34493-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D217475

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #7 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Does it mean that with this patch you no longer need to disable autosuspend=
 and
all those problems are gone?

It makes some sense, as it seems that btusb_probe() only stores a pointer to
btusb_mtk_setup() and then enables autosuspend, so somebody else may later =
call
that function on a suspendend device. Other BT drivers may be affected too.

If you got this far, please email your findings to bluetooth maintainers
responsible for this driver (run ./scripts/get_maintainer on the buggy file=
).
If they find your solution acceptable you may be asked to email the patch t=
oo.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

