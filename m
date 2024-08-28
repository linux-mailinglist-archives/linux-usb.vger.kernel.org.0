Return-Path: <linux-usb+bounces-14246-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D5C962F1B
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 19:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75BE81F24046
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 17:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2121A7074;
	Wed, 28 Aug 2024 17:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4QgGaN0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89687149C53
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 17:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724867832; cv=none; b=K0bFYgWkSwZf89z7nM6kuEX97zhX0S4Pb7Q2W/4OqIVWiLyJZNPWMYV9171wgR7Xv2NOzJSJPsseT0qFNiIYARjr80jSFaMAInKeaF9mCmhX8RtleqHxI1kze/8u5tKec8NLAwf4is8dXSeibWb9CUFsjdm2L1NJwcdDv2Tc+1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724867832; c=relaxed/simple;
	bh=MfgErRpHHttocZwOC3Ty1diPExMFn5xLIVqDyhm1W1k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Udjz4RK5YzsD3LeOABV8gp1CfrhT5o11in+d23iLofW/k1bbtpDqfS+kA82bMH5nRASbduhwSP3Cwkrmzm1UFrNaX6L7CdkZZcvkFFJ4uqueOonlc6y3CVlzIorFddzEbtjqMA/bKCii/7tshjaWtoRWLPpqxJJJU6tKUUsM8bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4QgGaN0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10008C4CEC2
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 17:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724867832;
	bh=MfgErRpHHttocZwOC3Ty1diPExMFn5xLIVqDyhm1W1k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=g4QgGaN0cZcECm3YKlKJOxl25uzNIJTSVXgYddJhu9xMx0JZVRO3ksEHUqaheqdc2
	 Wu72fuJC/8fh3TiqYpaYpdeZkFgs39eU9OTeVFznVuD4H/AqS1Sukl/lduoaxv9XaG
	 XV3y9DMeFvD8+oMXLM41m0qITkcL/ayEkKeiutSQ6YHbzgsdUDToNcdWzwds+G75gm
	 NAg6JAeyaMZ6uFNJ1KjTcCydRGO//hF+9xcoeC52KisDIGy28rLghWAF1WYnsdRkQJ
	 Xv3hbExkaYwD8jPRU43AE2aNGjrWrVaqHsaHL75Ct6Qgc2jb1FIWuTIAWZ03jAdZol
	 wB5Rd1mjO7pCw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 04EACC53BC4; Wed, 28 Aug 2024 17:57:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Wed, 28 Aug 2024 17:57:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: maggu2810@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219198-208809-9YNvESGDA5@https.bugzilla.kernel.org/>
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

--- Comment #20 from Markus Rathgeb (maggu2810@gmail.com) ---
Created attachment 306785
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306785&action=3Dedit
kernel-6.10.0.804f98e224e4+.txt

Here the log of plug-in the dock, unplug it and plug it again for commit
804f98e224e41c16e3b70f97790f84894745a392

It is the commit before the problem occurs, so all fine here.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

