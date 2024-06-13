Return-Path: <linux-usb+bounces-11280-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 42716907316
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 15:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FF29B246BE
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 13:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14CD4142E81;
	Thu, 13 Jun 2024 13:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sd8E+wDK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9383FA957
	for <linux-usb@vger.kernel.org>; Thu, 13 Jun 2024 13:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718283678; cv=none; b=akuLjZWZIQF3iKTO1sV3ZrTr8QKWCyEOlI8rLdRkB7kLg4cekSp8BmInUbq5nWSgrlhQJhATSo42OWRxm9gTfGkL5RIBunyRd5OLqO1D6cxJKqLjDpKn2h2XsJvG7Bich+3ALgC9KV0kD7cB4jmm8srkLksQvgcOM0t4n/E7gX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718283678; c=relaxed/simple;
	bh=UZyavOZG0fBS6aCH2weklaigTtI1PzqspQK9GEjGZFM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H3nMp9JynPDoOOa5684X7Ns/O+CXA+uhlxzwKjrd4yWVBxsLz5tbEPUg8HjogpOT7vLkHMFSzYofbxjPAdWe76bFG6/EOYdrua1ZrH7CmFocwdTjm4Rv5JuLGXrRDYYO7t7FxKYcSoij3i8jimlQnfkRJq37nS3Si+mlqSY2HCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sd8E+wDK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32CC7C2BBFC
	for <linux-usb@vger.kernel.org>; Thu, 13 Jun 2024 13:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718283678;
	bh=UZyavOZG0fBS6aCH2weklaigTtI1PzqspQK9GEjGZFM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Sd8E+wDKvE8EhI9wNqTgajYHRjFJ30fySySC9kS6r1SrbPOiXLbuKvBVdk4LsK51R
	 DOUer8naFwSZ2n8F9MWxLyMOairy8mn8/NiBWrmSQoScmOM3ukGLxnFCtNR8tpWjQ1
	 RL3BriRc1ghl0R73fMHojCPyfbmTIbVbkpH+++RBzC8rgxSB7Y9HIL51peh7MzTCfY
	 V3oSC9JXMYh8lGryDP8LKJl108Xvm0hJSHYAkM+9UuvW6by/wAh1i9xIgIuargUA7/
	 OGILlXOoDlRyq7nrdV9fI9XWP+WACMRHBmE+uNH8BIQ1rRMzKXCqDegaSIk5wT78fs
	 XWs2pQBcJWdBA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 23AF3C53B50; Thu, 13 Jun 2024 13:01:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Thu, 13 Jun 2024 13:01:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jarrard@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218943-208809-iSyIwQwnRU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218943-208809@https.bugzilla.kernel.org/>
References: <bug-218943-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218943

--- Comment #22 from Jarrard (jarrard@proton.me) ---
I applied the patch the LQX under Arch and I think it fixed the USB3.2 hub =
to
now report 10Gbps but Live Gamer Ultra 2.1 device is still hand shaking at
5Gbps sadly.=20=20

Might just need to go back to Windows OBS for this one.=20=20

I don't understand how this can happen after watching YT videos of other pe=
ople
getting 10Gbps under Linux with this device.  Very annoying issue. Maybe one
day, must be a issue with combination of AM4/AM5 with Via-USB controllers or
something.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

