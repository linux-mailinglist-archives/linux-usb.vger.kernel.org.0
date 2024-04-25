Return-Path: <linux-usb+bounces-9751-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CC18B19D1
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 06:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 773BB1C20CA4
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 04:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDFCA2C69B;
	Thu, 25 Apr 2024 04:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rVdKZuEb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642992C19B
	for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2024 04:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714018341; cv=none; b=QSRbezjWPUcE6mRsoSjtMuQD4r3nDJ5P3Qc18nmEpfsbLwoiwbztlS1fKLCz3Cr2EiXX/vF7WcyH4t99hsqcS6vEYqjMAxceprcIGZAAUnH4zab9Hay7CJ44laCzunWLbPBRAh+RTe5WpM/xV7WkvbxBNYri1inq5ZRHa8HVRCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714018341; c=relaxed/simple;
	bh=n9m6Li/w7tQhp8I6MzBk2Pj7GWTNsaH4K9sjMMAHYfk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D9ZwKmZYkP21yeLlku7UcRTTm55vAXNOJwp3MXuSMTPx0t932yxAIQ07E6gcIeYmsPjoxhtWuvxdLUSrwJo57McNgnNFiF9lMX3yxPw2Qvc0uYQf1mPP7L6UhqhBhufl9zvZWVaJwctWPgsjLVaje36OcMYGbOnN3gSirfF2hJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rVdKZuEb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03F48C113CC
	for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2024 04:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714018340;
	bh=n9m6Li/w7tQhp8I6MzBk2Pj7GWTNsaH4K9sjMMAHYfk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rVdKZuEbV4kpAxdLO4SurAGuhOQ1oGDUZSgpcyIw6086+Xeapd4I2ca5n7X1Sii9X
	 IzEhwak8UCHWrSHVZIjEn4a/SrWT2Fy5Xr/3BELa/iJbi4Rh24wUifcV0aS+yrfbUw
	 1CjVazgxwbscMTBzlaeGpgrUG9JN1xyTa/S3smZ/Ezi+XZ3lABVDNnib7kXvZCoKap
	 kczxBBr7my06eC1tfK81sZOtVmMeG+2Fyb2sYNp16zEOiy4XrwjZ0rDxE+zb9Dz4nv
	 bNZ/RhJOVdXCC4cm45ptf4a/42TnGTUN0f+HU2x5ly0WQS7NHSCBcVtWx6YN/ZkEX2
	 8By/ij8MsVaAA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EFAF5C433DE; Thu, 25 Apr 2024 04:12:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218773] device not initialized
Date: Thu, 25 Apr 2024 04:12:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: roman.gruber@gmx.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218773-208809-nfIiQ98ydA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218773-208809@https.bugzilla.kernel.org/>
References: <bug-218773-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218773

--- Comment #1 from Roman Gruber (roman.gruber@gmx.at) ---
I am busy working on a job, last build kernel was on the 14th of april 2024.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

