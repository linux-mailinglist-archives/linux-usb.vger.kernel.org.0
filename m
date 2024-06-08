Return-Path: <linux-usb+bounces-11039-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8661900F1C
	for <lists+linux-usb@lfdr.de>; Sat,  8 Jun 2024 03:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC3921C2155C
	for <lists+linux-usb@lfdr.de>; Sat,  8 Jun 2024 01:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714F96FDC;
	Sat,  8 Jun 2024 01:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jVDk1BG/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CE828F3
	for <linux-usb@vger.kernel.org>; Sat,  8 Jun 2024 01:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717810913; cv=none; b=gOfstDppm6fLPCjEFKbfdHSEbZPnoB41sWng0MHIg78N53cQbCz/zcPn5C3wA9Jrqez15tc9+Xywv6dvDvOSSQu0cTBEhC3rblYqbyiUVwGk+28YZaZiZkxM6TMkR/i2kfI/Td6tm99Snv3nwM1SjpT3UC3BVgZIf411WXUHTH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717810913; c=relaxed/simple;
	bh=cCTraywIqvN//93YCS6atBO4D8XHrfmxQ9x53vYzlEQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SzvKNin5MGMadYpw4IXoeYAOFvvoHd1Vhh1Ba18DW6YeP1SZTAt64TJrJ4bD3f9ExCS/kExRtytwMOpC40l0+Et8byTKaWe15Iqu8x5Vw0saeQjoxcQLmfFTvzBB30DQsun/8PpoP4dvj5o6eJ9+gxYtuyBBQ0ipjoJO27KZ+gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jVDk1BG/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67A42C32782
	for <linux-usb@vger.kernel.org>; Sat,  8 Jun 2024 01:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717810912;
	bh=cCTraywIqvN//93YCS6atBO4D8XHrfmxQ9x53vYzlEQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jVDk1BG/a9QvSZ2vSTf49+thRPXj8TWHTfih0tZP25K9uDvQ+i+DettuenGk76yVX
	 6NxD2jU0tUsGVYZycUP2ANCb80Wl056dvoXYRcDiiDoNjIsehlClVZ2KOtyoJS8foD
	 eGQo7N1nbeaaX4GuU7gN5KRKU0b9+rerhY136B/qPEPAG6RLxfC4qdwJ3XhWHI+cFg
	 yfSn5hb8HxAiRKyZz0HHR7vmEYqAOPxdEJTRpuS13mv/ymvmfDCbgdSbrarFJk9xFo
	 NqkT6ED7zX7CsI+ukWSvVzgU77vKKNN07zy3ucWhl/VVvY8iKQJ5QzTpyDHEulABI1
	 MRHYGo06wOCcA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4CF64C433E5; Sat,  8 Jun 2024 01:41:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Sat, 08 Jun 2024 01:41:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarrard@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218943-208809-P0cCsPqJNH@https.bugzilla.kernel.org/>
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

--- Comment #8 from Jarrard (jarrard@proton.me) ---
Created attachment 306441
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306441&action=3Dedit
debug bus speed

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

