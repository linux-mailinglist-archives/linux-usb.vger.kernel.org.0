Return-Path: <linux-usb+bounces-34315-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNySC9ftrmkWKQIAu9opvQ
	(envelope-from <linux-usb+bounces-34315-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 16:57:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8F223C3E0
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 16:57:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3ED2D309F460
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 15:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A6732765ED;
	Mon,  9 Mar 2026 15:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dLYtNw4F"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD45722A1D4
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 15:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773071181; cv=none; b=ABeBTkeL+vvs2wAR83Qkynj1I6bUIWiodxCf2wiwaqXQh9NuloxHVMYiqkZsGXAnqXNjbWNOJwkkK4Z8fLSNPFQQgXZmHcgkP+CYq/qf1EHIx/hAu8wgvUKWa5GW4L+Cve4VwywAj5rQqkYkvFL3jlmJJS6hDv3Oaf1qKJEF+oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773071181; c=relaxed/simple;
	bh=8bJeZbTql2K7R+4izflzqn/RjMopo38sKDoJ3UgIhcc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eHi2+laF+yMlF1bnK+iAU8HeN7hH5DoVaYpU+ZtYnnczT8PrHMkZld3MpnEKJlkieDS/kVeB5hATsv2vEhJmZNoX9txn1npQa8r3MXLFXR3ZGHi8jL59jC/XJItDhctAIPGNzP+ThHD7K0vbvJNXtQFS9l3uBU3AN91/eY9eUbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dLYtNw4F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5AC13C4CEF7
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 15:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773071181;
	bh=8bJeZbTql2K7R+4izflzqn/RjMopo38sKDoJ3UgIhcc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dLYtNw4FFhKQ5GJGcau+te/uVfv7EtKfMHNWMni3G1qAUZEsQ8kQ9L8Bj3vhQJWtX
	 IIR387NL9XHhuvFke/rOCXY/YMTOj4ArFRHArIW/LnZe33C2ZkmvSdp05ZDv8W4zS2
	 njIsK8jKYvzKyza8StqdOj+KoHrdr6TTpRLJIn2BExPuWHSuH0KFj2e/UFuJ15AI8x
	 vXjP/F0HYxiJ8hWmtZXAQG/T+nnmBMVDv80E05EsyPu8vYSFhTf19rCqdzbqEBSmTH
	 ibq7igQvJsIH4cTk4ozb5gQLgNqFvngc51YTz11oF3roHQ6zCHuFhDs+6Cuaib5zRH
	 M/JgNJFpqV34A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4D651C3279F; Mon,  9 Mar 2026 15:46:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Mon, 09 Mar 2026 15:46:21 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221184-208809-tXUw42PCEW@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: BE8F223C3E0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34315-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.988];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #22 from Roman Elshin (roxmail@list.ru) ---
just made a quick test with several pci-e usb cards what i have:

1. Fresco logic FL1100 - always immediately after start test mouse stops wo=
rk,
hot plug stop work (silently, without usb resets) - unusable here.

2. Renesas uPD720201 - works flawlessly here.

3. ASMedia ASM1042A - mouse/keyboard suddenly stops to work without any spe=
cial
load (silently, without usb resets) - completely unusable here.

4. VIA VL805 - mouse stuttering, keyboard skips pressing and sometimes repe=
ats
pressing till next press without any special load, under load completely
unusable (silently, no usb resets).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

