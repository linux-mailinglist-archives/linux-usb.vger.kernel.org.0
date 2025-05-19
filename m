Return-Path: <linux-usb+bounces-24074-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C929ABB299
	for <lists+linux-usb@lfdr.de>; Mon, 19 May 2025 02:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E4FF173459
	for <lists+linux-usb@lfdr.de>; Mon, 19 May 2025 00:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA844B67F;
	Mon, 19 May 2025 00:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Na3qApM2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4107538B
	for <linux-usb@vger.kernel.org>; Mon, 19 May 2025 00:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747613594; cv=none; b=lJSYSb3LgS7R/31LXXlW92IMKqGYtDVyDrZn8oKOzTJcXpEghp4FMptr/jcF8Z6aQmVYXWdSk58MGghJtBDQAXBIZrOTDmc6pY7L/GltkKE+Jv6WbRZC/oqxC6LRtfZjXv0y8T02tmcslrEx1A08wdT34gvFOn8RBDClroQzB00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747613594; c=relaxed/simple;
	bh=OCvtR2wLdWAcP9A74S81kp01Bv76cTbs1s5plj0CJvo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=giZKdB/CrTUYeXPMqR4yhlBraoYUuSm609kO5kkvO0nPUHmhCiRgNLj/guJxce/1b7IcH87sc16dbkNuA5FeeahWmWMRXfc/tpQwdStLR6/xM9+WwSTG/6d0DIAlJK5b7WknB6ixxy9LyqRTx+QnRCwcQSgEXNIWtZePp161W84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Na3qApM2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A64BDC4CEEB
	for <linux-usb@vger.kernel.org>; Mon, 19 May 2025 00:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747613593;
	bh=OCvtR2wLdWAcP9A74S81kp01Bv76cTbs1s5plj0CJvo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Na3qApM22ksmWM4uiTaRBjdJdzolOzt1n/WiAv4MbL5D1On+R26O9U7IaVas6/QFY
	 rOyHgnNU/pxpbwurVJQYl6ZjkSMin8TUpYEVwv0I/IUveoRhL4b6VQ97dtzffI81Dk
	 1/SlSjSPlC/GRsDr0y6svBrkuQlmlMG6TfmTkJOD5KMTecUk25voTTeGX3h/5fGADf
	 ZPt09zVyS3/xXwFaQVrZKrL10FzJneSJO9r3jX+RjNKt2LSWqjFzvXPTIyU2+O0t4a
	 SHyKbCheavAGxiay5ywfTY1Nmh9emvhG7VTR1U85Lv6qtqG18O4Ek7t6XuwE/nKjMq
	 hbsRvJcVUidnQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 969C2C53BBF; Mon, 19 May 2025 00:13:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Mon, 19 May 2025 00:13:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cwunder@gnome.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-FMfZrmHXDj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #56 from Claudio Wunder (cwunder@gnome.org) ---
I forgot to mention that with bootargs I was still able to reproduce the cr=
ash,
btw.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

