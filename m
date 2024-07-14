Return-Path: <linux-usb+bounces-12203-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52285930A9D
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jul 2024 17:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F03191F21494
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jul 2024 15:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463BA139D05;
	Sun, 14 Jul 2024 15:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ouUxh/+Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41F963C8
	for <linux-usb@vger.kernel.org>; Sun, 14 Jul 2024 15:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720972219; cv=none; b=qTJV1OlreQHnbNbJVwr0bvbnFpTuOX1pbzamMLMxnUy2pJt1w1fkWDvUHvcyV/OxLFFaccZ3N+Pc/ruNbu5Nrl7XLc3yc/YgqtBgwfmaLetVIdhfwsfSF2YpfPTb2PrmDe8viH1NFr2sdcsVWKJoTunxsfqJezRKmX4D5MW3pPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720972219; c=relaxed/simple;
	bh=RNBnbcxBUHTgrTvBuBlt3DL+HaCRrPcbMGmHwvXsEfE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WX6J7oVh6xGqa2EPXh3SYR0SGAwzOn08zRIRWyyP1+2AQp+1la+GKfj4FrkWwpqm4E4x2xtdiaN8PyGPr8aERhWByqJZdHtcyMkpzw2WL5jJQsLUgUNnCVM3P8svPgv3shHRI3Mug9EUYAOMOGPCT0Ns+/lV4Jy27RFD8B+uPzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ouUxh/+Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46498C32782
	for <linux-usb@vger.kernel.org>; Sun, 14 Jul 2024 15:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720972219;
	bh=RNBnbcxBUHTgrTvBuBlt3DL+HaCRrPcbMGmHwvXsEfE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ouUxh/+ZKk+P5/WKRwRjWYhP5ZIbP+lWiZIhD0wLg7ogGMeCC+qKsl1O8MtHEYt+i
	 MckwmTtoegoPsWHVsvn9ZGyuQZZjVx251/if0TOjHQMBLU7aur3JFBaXVyVXFsFNJz
	 SOO9UkpqZ3TYYPbjc7sNzSzHeXJXYuzL4p5b8wa7uT+hp0dBCNSeBbu1G95e/9Eh+6
	 PTvjGW21Y6s+tu8vWKAiasADItuxANe7uHIipKW4nkjK2fwMDNRiJsUsKcrsGR6r/z
	 bWNAib3cN/Xgq23z+3gDxFuxSKC7nN4WquiKgSoUuorN3Lc46qsXg1ZImM73Hksuto
	 lGYTeddLpu7gQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 28611C53B73; Sun, 14 Jul 2024 15:50:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219039] kernel 6.6.39 freezes with QNAP TL-D800C usb case
Date: Sun, 14 Jul 2024 15:50:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: matthias@bodenbinder.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219039-208809-OY2Dgoy0rJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219039-208809@https.bugzilla.kernel.org/>
References: <bug-219039-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219039

--- Comment #4 from matthias@bodenbinder.de ---
Does your proposed solution explain why the bug does not show in 6.9.9 alth=
ough
it contains the same commit?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

