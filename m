Return-Path: <linux-usb+bounces-14137-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 572EA95FAB1
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 22:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A3C91C22346
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 20:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF8D13AA26;
	Mon, 26 Aug 2024 20:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="euZdbUBJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B6874C1B
	for <linux-usb@vger.kernel.org>; Mon, 26 Aug 2024 20:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724704358; cv=none; b=WFKHqt55+SAqyWD6oDIWiUlDSYLHpdrOGUf8TSrFS6/ZapzpWjyuMXOoiceQrVBTO2IiDKvVlvY0YG+k4lx8iOH6Em0hRygJRQqBhwC/e0jMAcBN0z0L7tjuoh82vSo9eG19svKrIY1IzxEqhBJjvaoyjgh1UDvq5ra9quqEbpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724704358; c=relaxed/simple;
	bh=hsk7ARp4WN6jcyP5H76m97kFeITzsMDZCRulDTeSajQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FITzIhIgBduRuCtT9IwswUCX6zq1nN6KJ5TAThPk5Qi3z1jl/YDUGZBO/qKo3uJ2eB207eA77SZm0/S9aJBOaFl+dr590cC+Hax0MyN7INtvXPrQKMjqHf1aRLrdn0dhyk8hJnubZdbxWszsRufaBD5hklBBUjXZJ7hpTuKozTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=euZdbUBJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7AFDBC8B7B7
	for <linux-usb@vger.kernel.org>; Mon, 26 Aug 2024 20:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724704357;
	bh=hsk7ARp4WN6jcyP5H76m97kFeITzsMDZCRulDTeSajQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=euZdbUBJFRq8CnMm3sbcPHQQRSvL22w7oUZiDfOsBIAJjeMozXos1X3VmW6gMavcL
	 OX+34QeSD3Jo/aR1IjH6lKR/jPVr/1YVnlI1LXAhmPg+hYaEJto+1JU9MNrH4g3IBU
	 J501eutZ2p8A/hzpGBj7TSq/TUzhCHVQvfhktSsEfP3LRz3IFH/3ypVZAKqdnzt5oj
	 CpHeeOUHhT8NhykQBsd4kErvJTbatUPCyX6BpPCle3sjznp8tcW1Z1S3Gp9RbESY7J
	 oupAuyG8XAJ2SSYbdZn+1ZE0uysPKm9FPucwueyYCdoFWYxaas4MZWOcNaDyujQVmv
	 WolnXKSe4GoBA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7348DC53B7E; Mon, 26 Aug 2024 20:32:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Mon, 26 Aug 2024 20:32:37 +0000
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
Message-ID: <bug-219198-208809-G1md1NIjxq@https.bugzilla.kernel.org/>
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

--- Comment #8 from Markus Rathgeb (maggu2810@gmail.com) ---
Created attachment 306784
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306784&action=3Dedit
kernel log 6.11.0-rc1

I build a vanilla kernel 6.11.0-rc1 with the configuration based on the Fed=
ora
kernel.
Replugging the dock result into non working dock USB ports, too.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

