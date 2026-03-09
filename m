Return-Path: <linux-usb+bounces-34306-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEpyLpLVrmlhJAIAu9opvQ
	(envelope-from <linux-usb+bounces-34306-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 15:13:38 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6174623A550
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 15:13:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6FE9C301A2FC
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 14:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A623E3B9605;
	Mon,  9 Mar 2026 14:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jdHKtpa9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EA93CE4A0
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 14:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773065613; cv=none; b=Tmk8UiSp6arYMkK00TmMnD39512daOZmxj6m1RXLHgnuTbq2SCidRMIdjOGiT1UHW3fwfxpZvkjmVnV24ArD+vmFn6xoQmXqKhegNOxyJjyiwZ9UAMf1RzpoVLg2ew3tMCplieshKz1UM8df+LFiIQ3B5U8Qrgcz5d9hjmHAEZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773065613; c=relaxed/simple;
	bh=qGjTxq0Szvp4RLXuJU8HhFzUHHSoDPtCIn5Ns5q7BJU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=js90mjGL8s1ypShHquJoEO9jBmpG1BcD3MqJw0o4LuFAyhv0M5gTYNfRqnRe1bbRDZg2fDi6Vevax/p0wfF18NLN9DFd1MGwBIaBYqR7GijPchhqk4Z43umMJutMfMFJuRTZ/dawvfY0PP43p9Y6fDqpZGV+zHbWA+2SSgOh8p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jdHKtpa9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE0F6C2BC86
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 14:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773065612;
	bh=qGjTxq0Szvp4RLXuJU8HhFzUHHSoDPtCIn5Ns5q7BJU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jdHKtpa9pjmfvkMSwJroAYEH30EVcLfwLHXTYpJCB7+VLXV+OjR/QpSo3DnAG0mVy
	 7TgJDJK5YCeqH8JTiFnusmsFHcQXzYb0lb2Q2/YA8eKNITjVVq4UtNVpgy3qhA6/wQ
	 pYzaaIWrEMyt6jNhkamQY9Dz5Cirf+TyPO5j/zWGoS3dKUrzKv1bYeOUXUeLoKSv5z
	 LGTzAaaUDN0AkDUNm38gL/0Nkb6m7JHh6TgbRR73Dx++Brb+kPyjd2349roDYvknzo
	 LX1PagIOqBhmpPVy5unBWzQIxoS6y2BoUV1C0fsBHfn7CKh6ntIBHd2LolR53gcvnh
	 vErFpIYCNZrAg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B35B7C433E1; Mon,  9 Mar 2026 14:13:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Mon, 09 Mar 2026 14:13:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221184-208809-vuaXSklpql@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 6174623A550
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34306-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.988];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,harvard.edu:email]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #20 from Alan Stern (stern@rowland.harvard.edu) ---
Re comment #16: Consider what will happen when (token & QTD_STS_MMF) and
QTD_PID(token) =3D=3D PID_CODE_IN and QTD_CERR(token) are all true.  In thi=
s case
we want status to be set to -EPROTO, not -EPIPE.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

