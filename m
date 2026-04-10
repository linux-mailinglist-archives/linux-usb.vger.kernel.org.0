Return-Path: <linux-usb+bounces-36125-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WP76EhWD2GkoeQgAu9opvQ
	(envelope-from <linux-usb+bounces-36125-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 06:56:53 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7963D22FD
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 06:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C0CA3014BF3
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 04:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7486D332614;
	Fri, 10 Apr 2026 04:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jQfq+Th4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02750330B14
	for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 04:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775797008; cv=none; b=kk4b8q51X0AcvzmRGLWvf5rlYlcKueEGLPt2lwu4niIWQuqPao1UZ6mQEhLgLa/GQ1dd2/YfscBcW8iFdBBZzYoOhFkgpNpHGClHYPYkOzkLfRWqgTRnn04DlIVMu0o0kSC+g+vC7MAuof/mS37oHTH/DRt0jwgvoJOyvUGZUYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775797008; c=relaxed/simple;
	bh=NG1fA0GXCZEKs7OLFnwmgSMjpQ9lx1kShOX4KSJs0HY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rg2XhLDzdddJ/6mLWIT+1FtEqFFWjKFQKQHV0MDLvfJhmsnCbiHFSBzLWIiQWG+urUEAvo1JjkMIEPdeb3kAt1qA+rraGP0vTPbg2Q8ZkL51j2YqTqPUoRjzXMpOhU6hyH5Kkf7CleUAxC4+yOPu6/9LrgHJvrRzb/Ln6yLJt8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jQfq+Th4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95A11C19421
	for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 04:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775797007;
	bh=NG1fA0GXCZEKs7OLFnwmgSMjpQ9lx1kShOX4KSJs0HY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jQfq+Th4j19fB1VDMpdnDDpgvOtprumwhXZ/eR+UzoLLqCQ8RQ6TNjlOob1mi7vmf
	 xFUujwfaqFUb5ZJO5E6nmHgGVC5DYoE8ePF/2KL5uPCIeJOQbB/PGh0pt3txGzAiGO
	 2e+aTmvR4cAD01hGDUtV7ukghb3eU2XaKU0JijQaHYlDJQodn5G8Jrbrnu9REbRXHa
	 XJPIDKSSxWfNGU5ONN/CGEnTs/PvCCfhrjO76PRlXGUX1pRFSn42xMl2izybcEhkQ7
	 k8I8VnjLt+eVQ4dwtmfGg+LTIIC70LbV+xD0qUH4rogFGn3vq6TqAZ9SF0Eua5PEfn
	 H88+HqityvtGA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8047EC433E1; Fri, 10 Apr 2026 04:56:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221340] uas driver hangs and causes usb reset
Date: Fri, 10 Apr 2026 04:56:47 +0000
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
Message-ID: <bug-221340-208809-qLxbitgZeE@https.bugzilla.kernel.org/>
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
	TAGGED_FROM(0.00)[bounces-36125-lists,linux-usb=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 9C7963D22FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221340

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #3 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
There is also Unmap/Read sub-channel in this log.

By "hang", do you mean that no I/O happens for 30 seconds or some other time
before these messages show up?

BTW, if you run (as root)
echo 'func handle_tx_event +p' >/proc/dynamic_debug/control

do you see anything new appear in dmesg at this time?

That would point to some "action" at xHCI layer, though I suppose it's also
possible that nothing interesting happens and the device simply never respo=
nds
to some commands under some circumstances.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

