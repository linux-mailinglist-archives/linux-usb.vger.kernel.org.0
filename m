Return-Path: <linux-usb+bounces-14225-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F9C962454
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 12:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47E831F24B5C
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 10:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61F3167DB8;
	Wed, 28 Aug 2024 10:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e4kniJWu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3427F1662E7
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724839790; cv=none; b=cy6uFyzQFG8MLha+2vHZ1NDZb2A+JFlugcNZqL6DgdzMWwIYt6bvve5tl3ErIFAwLzWFUL4gvqvQFX7scdYjp0573wevW9Y/dpWM3ua6gL0zxC+etoyxU5FXKHSXrIzr5CXjsxRRmpD01/8BVnSDOEbQdICFhkOF5IBCKd5qMAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724839790; c=relaxed/simple;
	bh=SKVImIhaGc9n6hsKn0emXLj1tHB6EikDhg9GaxReWvc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M+dn39bJxtpQW/DEZAnlCXZXPfm5nQCyjucDl+RRv8YSVXZ88kFmKBoxKOz88+EYJUSqQe+kCmvAtqmfnT8/tc/8vTHEruXPLga1ohnnuoPyrdsWq4FEBWszhQHRDIAhum23WpnaThH5/lcJvFXcvfdd91moNvcr0gBAQeyuFWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e4kniJWu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCCD2C98EDD
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 10:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724839789;
	bh=SKVImIhaGc9n6hsKn0emXLj1tHB6EikDhg9GaxReWvc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=e4kniJWu4oFBc8lZIonZ1p+62n8/5qHqE4IlnLt/+kce9xOS7tLjqhpJVuVGDTVPq
	 9aaOgngVRwzkVhdT/LX2kb+4NfRcqX6at3YmbFyb1KANMbgj+AHM2PPVHEOcw5ZhXQ
	 6B9SAh1V0AqoLlc+tfnbYDjAAJGBr96vVyIbON2L9yUtsftvHMR+E6tgVAvqoLxLK5
	 EuwarSyr0EKGEAtMvYFAh/IzYXEi4QUAuGS32/ctA5w5cQtV/M3yUtOLC1b35bwkQM
	 r961bCUWMwI2Zls0MgO97U9dP48cWlwo7Xic9r7e5o5RGhubr4QxoHlIaBww4IDYXt
	 fH+NhRM7zfn0g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BCC68C53BC3; Wed, 28 Aug 2024 10:09:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Wed, 28 Aug 2024 10:09:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219198-208809-HuDmS5wfdw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219198-208809@https.bugzilla.kernel.org/>
References: <bug-219198-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219198

--- Comment #16 from The Linux kernel's regression tracker (Thorsten Leemhu=
is) (regressions@leemhuis.info) ---
Thx Markus. Can I CC you on a mail to the developers? This would expose your
email address to the public.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

