Return-Path: <linux-usb+bounces-37362-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOx8BaIPBGoMDAIAu9opvQ
	(envelope-from <linux-usb+bounces-37362-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 07:44:02 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0F252DA99
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 07:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8FD23035AAC
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 05:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C7A3A6B67;
	Wed, 13 May 2026 05:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tNCCfKpe"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888DF2030A
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 05:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778651037; cv=none; b=jqXldz6sSj6d5a5K1zXIX8LN2UDwOfEQstR1b0xYAmc/BR8hyvKLirmqyzTcU87iQIfrsUfIvOmWeHu6v/kuintMsOU5FXqyAozwFg21CCTgDfT1ghNBpdzdSso+90YDPwjW3vbTx1RsDLKPl2JM8O/BlWVgWdoIvlY573JAZGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778651037; c=relaxed/simple;
	bh=uOFeoXuz7s86Pn8lm0KbqiImuTccgT39H0ApySggVpY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VUaENOepz/KuM5uNXn5zSGMJ1L8s+cVtsgTy8QHOiTcZ3E4RqelLjUkgoqNZ2NTBGKFTY8CE6rGngJIMtoMUmvgRv48HqkmvXGtTKwV0QMZAlPjljoIqXpdK8rH4Y94eUpLW2/CcPQgwLMyAI3mF4IThQJle6xlYIL6uQcnlnQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tNCCfKpe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1DA34C2BCC6
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 05:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778651037;
	bh=uOFeoXuz7s86Pn8lm0KbqiImuTccgT39H0ApySggVpY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tNCCfKpedOOQTFpNzLaMMXKT1BknWg3vdGDRi3lOz9CtCfV0X5mAyigA2tD2hYY0t
	 3Z+4Y1GM8DJWMA1zqUW3lpO0DfxyBGmKHSUYRQ6YA4SgW6waT06XUvP1PODFQJWUu8
	 e7ZCWTnOFbQJEwTMAq5PUaBvpJoe3P+31DXAXGmGL8LjutlZpvbLJ1cd/cGL6flbd1
	 s5NwhVnIe5ei2RgFd1QKB7sbsmzCiv1Ce/aiGXlhpm3WtWraLNHVSF+faM77Kwmc/u
	 q6kyMKFu/jp6FcdJ0kIrKnD7n4+3BTnh1YyXdStMCMpWEh3MKMS56QMlZNTZvKAlPS
	 wGQbb9cbwV10Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 04179C4160E; Wed, 13 May 2026 05:43:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221510] CalDigit TS5+ Thunderbolt rear USB controller fails to
 enumerate on AMD Strix Point USB4 host
Date: Wed, 13 May 2026 05:43:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221510-208809-uF4OrZNsr0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221510-208809@https.bugzilla.kernel.org/>
References: <bug-221510-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 7E0F252DA99
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37362-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221510

Mika Westerberg (mika.westerberg@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mika.westerberg@linux.intel
                   |                            |.com

--- Comment #1 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Please remove "pcie_aspm=3Doff" in the kernel command line. That effectively
turns off native PCIe support so definitely has an effect on any TB devices.
After you have done that then try to repro again and if it does repro then
attach full dmesg with "thunderbolt.dyndbg=3D+p" added to the command line.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

