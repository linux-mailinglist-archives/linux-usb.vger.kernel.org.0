Return-Path: <linux-usb+bounces-13303-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C823E94DDBD
	for <lists+linux-usb@lfdr.de>; Sat, 10 Aug 2024 19:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E9B31C20C82
	for <lists+linux-usb@lfdr.de>; Sat, 10 Aug 2024 17:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724AD13213E;
	Sat, 10 Aug 2024 17:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ybl2hXWA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E997D1CAAC
	for <linux-usb@vger.kernel.org>; Sat, 10 Aug 2024 17:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723310378; cv=none; b=RK0Y5HtZEp+LtvascQgF3Ei1DsmUyBa+9tBI3zYJ/DkflS38LlMOfpcLz8/d+R95CU4WCQWgOubBT6bmzEQo0Egu8oc2VTcljSj4fLTq+8iau/uH542uGPuQR1W+Tz9dSbZegSn8gq74XAdsew5q5qRam9lSGfqkxSb5JjGk9FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723310378; c=relaxed/simple;
	bh=TFdUwH6v3yaRScRkj2MpHmr+y6tIVMSgSSL7ABU3Nhc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d+7afgU+3og3KHYklkHfp//H97mETv/BZoHGcP4JtJ/0zshzARang15Yk+UlUSEI8wbLWrENn64m+X2m+SHTxgueHzVAcP1uvR2P7OGnofjF+ANJRy+K3XljvZz+8O+ht0LFtLdvfxaSEtQu57TvOPJ6np6ZzEJA8VYPGdqBEUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ybl2hXWA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7266BC32781
	for <linux-usb@vger.kernel.org>; Sat, 10 Aug 2024 17:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723310377;
	bh=TFdUwH6v3yaRScRkj2MpHmr+y6tIVMSgSSL7ABU3Nhc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ybl2hXWA04LDA6csqOrfsZa26V6fPxJiW/niXYUfdbeDtOKlKDi9vhJSt58sZvPPQ
	 twtb8iJly51BfdTD7/g+EHqFHkdlGZlQzL7KZXORuWByxEGyoQEMHnLLUWbmMcyXkC
	 mtljJvlJEUUrFRY/f21bfEI8m25J1cyFxkwBcYhmlFV9kFzaV0UlgBmGxgXPEEM2ce
	 YGvzpHFJaKFv5CWUYw/SBnbRo2Lb3nXdsDW83vhkigeraBqzOrWZ0hBhAwLQdgfoUH
	 W+mjDEUMwOm8PlGRPY/6ydSQJEW4Dq15Bt7ucHOHs+HTrvVvTT4zy9NH5LqWHPzuPv
	 UiXpEoo69hrsQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6225EC53B73; Sat, 10 Aug 2024 17:19:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Sat, 10 Aug 2024 17:19:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: com+bugzilla-kernel@c-henry.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219111-208809-Yk8zRmvOw6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219111-208809@https.bugzilla.kernel.org/>
References: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

--- Comment #54 from CH (com+bugzilla-kernel@c-henry.fr) ---
I think I can see from this capture that it still declares
`bConfigurationValue` =3D=3D 1 but also declares several interfaces in the =
GET
DESCRIPTOR Response CONFIRURATION packet of size 322. What does it declare
here?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

