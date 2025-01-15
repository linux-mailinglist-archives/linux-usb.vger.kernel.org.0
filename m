Return-Path: <linux-usb+bounces-19377-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDB0A1270F
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2025 16:17:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F18581625C8
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2025 15:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D359413B787;
	Wed, 15 Jan 2025 15:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UuJaUMjS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5867D70801
	for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2025 15:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736954224; cv=none; b=sS0lQm0RCbG6Mz1bzVhef5JQEc7NVY2r1vrXk/l7ExJIuZrLUcVh+Q8v5ZT8nfcMglkwz5JkBUL7j7jAj4kHbjJaF7hH/cWloYFxrpFHcgLCkgb7Mu+mhZKLDqmu5ZJsrDlsV3QgJ/gXxJMvwVNqutMeHtcZRXE+utORN++WH58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736954224; c=relaxed/simple;
	bh=q2GvjNBYFuFkIo8wVIuzmmebT3UNaU05lIkYAbm0ddk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q+cOJbtosT5vO3G65RE0A/8GYCMy4jDDwLYJL7cMpEDJAjn00bzXvJmJ3cBugzEkDWoQwqVMW5tybVEb3aqVWzapRrR5XJ8t7nD8W+ICPrSYBDE/DBg0mzma6TWLHSMjRTWZWPUKgm35oHvm+I9QMeyESwbjeoTOqPyu0+PhWow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UuJaUMjS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0EFBC4CEE0
	for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2025 15:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736954223;
	bh=q2GvjNBYFuFkIo8wVIuzmmebT3UNaU05lIkYAbm0ddk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UuJaUMjS5GgeXdqaNM1SJXGm595tueaYC+as6b/1RvjwjqY8nB3FinRZEqBRH6ZZ2
	 sEmybGZfTaltIFOZ2lH0LCZVAe1Wr76Wx7OhUArD4QFrhWTDRpwj19dUs6ZhBqiKWg
	 jTmtcSR9Qoyttkvy951sMkw6FuVUuj20CSj1dY0yOb/VdR4z+U1dSdyA4BDasVRo3T
	 fCn2JL2VltwsfjX7CozPFMczYmtsW+pZt1ISrdHpzhr0OrOtDRZ6kOGPKuA7OIyCAH
	 fyC84UdcH/u6AgVKlmotAERvbgNty8xTDHuR/Vwr+KNM99Bb2mRjUiORLa/sOa0wVk
	 rAGkCxsvCDBZg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D826EC41606; Wed, 15 Jan 2025 15:17:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219681] ASUS Zenbook S 14 UX5406SA: Unstable USB connection on
 USB-A port under certain condition
Date: Wed, 15 Jan 2025 15:17:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dantmnf2@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219681-208809-8i9Yneju4b@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219681-208809@https.bugzilla.kernel.org/>
References: <bug-219681-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219681

--- Comment #3 from dantmnf2@gmail.com ---
Created attachment 307487
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307487&action=3Dedit
dmesg with dynamic debug

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

