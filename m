Return-Path: <linux-usb+bounces-21512-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F03A5733D
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 22:02:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59FE73A6A7D
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 21:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C1119DF8B;
	Fri,  7 Mar 2025 21:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eHmAF17X"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D99A192B7F
	for <linux-usb@vger.kernel.org>; Fri,  7 Mar 2025 21:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741381337; cv=none; b=ld4mo0q66myfe0PwSC1q6y68zi9TJYVlRNu66qDYd3CxNH/5Ve6mgcO4wAZQ6H6n4xtqZ8V/OhcPjI2AC1UtveMbx+aXh3EIvQWzytEMc57B09RCC1Xgzzy3Ou0mva4uvyTHaV7K/PSkE03PM9TZpg9bHho7ucGit7Q1Y1s52dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741381337; c=relaxed/simple;
	bh=m8ypfytStsyDsRfNN4mFXcX40gvUGmCEEHrEbnMt/nU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fyTrNKD90Jb+W2e/QMeatWb/+5SlHgp/SyeIRvJkhf8+yWMei7OP8I3g+UIzGUgxfSXWmZ0WCr2Z+sQPMOKzVqScaYmEIqflFbnGsT/SjZ661GyDynRYJQR77OFyEgIaq2TYk/ASiHdm1zChkQgp+lECMSA230I9GJu4WwbXbFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eHmAF17X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD092C4CEE8
	for <linux-usb@vger.kernel.org>; Fri,  7 Mar 2025 21:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741381336;
	bh=m8ypfytStsyDsRfNN4mFXcX40gvUGmCEEHrEbnMt/nU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eHmAF17X7chB/N+D2xxTvMkZRNDt5d19oJNTueyq2RA4ZRGQUTeqprYveDjC9akjo
	 HX9rZavUi2LcHq917JyI8iGLlTK33+5WomLDz+I5e1a41lXL+wAPP2DEjqIm1qg60m
	 jVQRSg+sVxnLDPe2NF6BVBoHD8K9ChT9o3raAqUUoXkj8dDacp+EIAIApEUveCtnf5
	 Uzusm6kAlkZxCIuGA09nLn/Cx/DiJ7cSxrO4AjqcUFeiYcSQ38ShLkfp6aIXdcgBo+
	 hZX+XzvxalQYTdfT4XBLONb3S1PFRyKKkfH85qkRAQAhzitDqRp1jeLHerBjfoHHD/
	 mugmFYg7y67QA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BF057C53BBF; Fri,  7 Mar 2025 21:02:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Fri, 07 Mar 2025 21:02:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219748-208809-ClSOlKrsMY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219748-208809@https.bugzilla.kernel.org/>
References: <bug-219748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219748

--- Comment #33 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
OK considering that I think this patch is correct, I feel we shouldn't dig =
any
further from a CM perspective at this time.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

