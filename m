Return-Path: <linux-usb+bounces-13294-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C578E94DC9A
	for <lists+linux-usb@lfdr.de>; Sat, 10 Aug 2024 13:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 628E9B21C35
	for <lists+linux-usb@lfdr.de>; Sat, 10 Aug 2024 11:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1AEB157E78;
	Sat, 10 Aug 2024 11:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XiadL2vw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A74E14A605
	for <linux-usb@vger.kernel.org>; Sat, 10 Aug 2024 11:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723290515; cv=none; b=XPm8Z2Fad9HXhvkGk+Bt6V1fxGZ2gf6d4wUBfHkTWDWdp2aidrDCB+7IBQNsDl283bklUbE9ZEQT82X8nZhzFK1h0m4HO1rj1/O4i/5Ye8gqI9cEljCXZv2ohu/KHjdmaz2E5+Vmkjw/cDUWPpPQnQjB0n8R97B58+oVY5xNGx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723290515; c=relaxed/simple;
	bh=KUo1SFpASIPZnQKwtdwvigcPNcAs3cUXjnIrt4Cg+s8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M9535w1G/SJ0ySk3rG44oQhqDCopgYTk8ABD2jlAkn2+aYUc6nLnSwqpGiZvYGPgoKPsT1Lf/q575bnI7bq763DGPIUQ8Xiz4Y+IXadEfuXXWJIYAlKjvT8OOD946uiTXnM1t3SeAThFe89G8JzWl5aLKD5UPyk4zKJvC3Tcte8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XiadL2vw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DED1EC32781
	for <linux-usb@vger.kernel.org>; Sat, 10 Aug 2024 11:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723290514;
	bh=KUo1SFpASIPZnQKwtdwvigcPNcAs3cUXjnIrt4Cg+s8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XiadL2vw3v4no9UoqhIyl/MqXDk2e4MtjKFVjHbAsdDdVn5c9WPum89hEPiepwTAU
	 oQdBfJAJDYZ0G+J2/VXF7DJUV6dIZCbMjSoKp6Va6T9b/uzaS8J3C4Vh4G1G9CIQaa
	 yLs6XV3eTe5KKReBaoCOgMgsjSO99RsfNjFdV5AKF0jr4g0MyXcjz/hwThN78XUopH
	 ga3vh+o4iKSgJf5nuLa65GOJXGu2BR5ol/iPV/8CMt1FgWkdWq3cG+rxZ30S+UH3mI
	 PXXD/6WiiurOr2cBFo9BbOW0XdwCQ9Dxmh8Zg5YcWW0LKpRg/iSz3a7oUSwMd6PAfR
	 6lnly5M2VLDDw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BF98EC53B73; Sat, 10 Aug 2024 11:48:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Sat, 10 Aug 2024 11:48:34 +0000
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
Message-ID: <bug-219111-208809-GAIwSpK7K9@https.bugzilla.kernel.org/>
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

--- Comment #51 from CH (com+bugzilla-kernel@c-henry.fr) ---
(Working means it detects the correct number of possible configurations with
new scheme but that code breaks the USB protocol on my computer)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

