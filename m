Return-Path: <linux-usb+bounces-29978-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 458B4C29088
	for <lists+linux-usb@lfdr.de>; Sun, 02 Nov 2025 15:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB3ED3A785F
	for <lists+linux-usb@lfdr.de>; Sun,  2 Nov 2025 14:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8971A1EEA54;
	Sun,  2 Nov 2025 14:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yll7PIIi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2D981ACA
	for <linux-usb@vger.kernel.org>; Sun,  2 Nov 2025 14:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762094927; cv=none; b=DCr++BD6qkSyge44IfSpp4EYo084WPXOIQfT1NN6oYLHw2S6aKTGDxosgrmcAeHg6eqncMZZN6gqFPeYvhuOy92ieSZgEtFdFqD+RuupfN43PAMl5B499MKSAZbtHZS34gZbiVF/mcFPDgpr0irGx1Wiern+AQDZMkQPM95BDmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762094927; c=relaxed/simple;
	bh=ZPgH+fiI9RdzLo7zxl3v9onj1gZpGssBjv8RAQK8K5k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a+cKNe9Lg4V8VMRdu3PATBXLUz0IcLaXpa3GuCgbFWWneflTjcCknYUxtiuXbuhYR466MCBEOOV1TPplM6P8ASCfSY96TC3h4HD2gYxMJm7lsQZ9FH1QwZRyDWQq5H8sFFAo5Dqjk9b1l83jxscZUhQRcfMwSSZZ8AEjUDNmUiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yll7PIIi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72D96C116B1
	for <linux-usb@vger.kernel.org>; Sun,  2 Nov 2025 14:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762094926;
	bh=ZPgH+fiI9RdzLo7zxl3v9onj1gZpGssBjv8RAQK8K5k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Yll7PIIi8jHHS1LnnYtxTZOs9A4cF5CFmLekZXQEkv7c7ky3tzk6F6YFGxABPw2UK
	 zOoPJqnOW+jBvRtE7eZsGe46GZkqpufaUscBmLsCufaUIQ3cVH3k2NWg4V/JpFxA5W
	 DwQgg4Q2SS1Y6hFduRe/FJekU+Gg8BQKmRObmVAoiQeAQ30YjGn1GospznER3GlaeD
	 H4LK9hHSXafyW3Uh/KWInv06oCIn6EDQWIhyq4zgS21FqnvkBD2UCnv0T61h5KJjY5
	 dKvupCUggyb7w2vCNoZtmhX9ropDWivlttg1/63yT3yWvs6UDDRN+rJ8A9kwDsuLqP
	 UlsKH6dKlnkKg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6644DC41613; Sun,  2 Nov 2025 14:48:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220284] USB4 / Thunderbolt not working after boot until
 thunderbolt module is reloaded
Date: Sun, 02 Nov 2025 14:48:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hi@alyssa.is
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220284-208809-8pz0HZKiE7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220284-208809@https.bugzilla.kernel.org/>
References: <bug-220284-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220284

Alyssa Ross (hi@alyssa.is) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |hi@alyssa.is

--- Comment #4 from Alyssa Ross (hi@alyssa.is) ---
I believe this was fixed.

#regzbot fix: 58d71d4242ce057955c783a14c82270c71f9e1e8

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

