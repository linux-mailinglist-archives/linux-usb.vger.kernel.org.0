Return-Path: <linux-usb+bounces-6235-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BE085135F
	for <lists+linux-usb@lfdr.de>; Mon, 12 Feb 2024 13:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23843B26A37
	for <lists+linux-usb@lfdr.de>; Mon, 12 Feb 2024 12:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E1439AF6;
	Mon, 12 Feb 2024 12:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sgpi9m1A"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1959939AE6
	for <linux-usb@vger.kernel.org>; Mon, 12 Feb 2024 12:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707740181; cv=none; b=gAq3CBMZb5WhXPMmFB1Ga5lMFeLtDQYzsL7WepSYjlTEtr0ggLoirJR/Jhq0H+Fmi9DpcA//fzjAGTEWoASTOd1Mx93lhHKiJXu9kv5HC16Kiu+Ylc0xNrXFj72uBvmM23m9IaKCDWQQAft6QISSFkTFc9cXrUT4wPxGf9/9LqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707740181; c=relaxed/simple;
	bh=8j7BMALNkBPZPLzurvxA93M2LsoCMuhVN7J5qcqdreY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HslPWpFT1OZ44Apwvnz81Q1YDP1/XkYJxPhPGZjx/4Ho3M0UI7S91KZkdhCIUaJEgHK7TUu+vpraZr/gOUuYmQTtGdkNpd+wqg4M16BFEH+TIecuJgNpmTEy7e/vpe4+i2KF8SkSA179HylZZ+JFL+neZtCCvd2e9luDVU+OKOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sgpi9m1A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7DBC3C433C7
	for <linux-usb@vger.kernel.org>; Mon, 12 Feb 2024 12:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707740180;
	bh=8j7BMALNkBPZPLzurvxA93M2LsoCMuhVN7J5qcqdreY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Sgpi9m1AK7iI+yTdsjI/XetofzF0MC8C6YtrVf14MKpSSipw2z8SipfJNt7VKqPsJ
	 FQPTl7W3++ONkZHgyCw+gj7LTPIGBdUdVFb3gO6tcbiXg9xMeU1s7rbl/jA7+MpdLd
	 SlVT6NHTx3t78i04VzZZRF8pnOpQ8KC8wlcdNJyTcpBxWVaG75EtwFA3GcVFRBAg4g
	 Hqd3HWyNHDGSV5CcEuvYaMt0BRDn42CFO1IngiFRh8TaJLguZ8b9ls+Q/7wwvvVulD
	 81g3+FYDqjD450dWCsv854bZSAzS8h/3HThLsilmjXcQhJ82S8HaX60TyF0x3G4hlo
	 0AfVpQkNXUdfQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 69F65C53BC6; Mon, 12 Feb 2024 12:16:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218465] Linux warning `usb: port power management may be
 unreliable` on Dell XPS 13 9360
Date: Mon, 12 Feb 2024 12:16:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218465-208809-q6Z8Q2ZYgO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218465-208809@https.bugzilla.kernel.org/>
References: <bug-218465-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218465

--- Comment #3 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de)=
 ---
Thank you for the analysis. Excuse my ignorance, but does this mean it=E2=
=80=99s a
firmware issue, or Linux=E2=80=99 assumptions are incorrect?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

