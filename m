Return-Path: <linux-usb+bounces-30109-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D47C3752C
	for <lists+linux-usb@lfdr.de>; Wed, 05 Nov 2025 19:33:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08BAF3BEE3D
	for <lists+linux-usb@lfdr.de>; Wed,  5 Nov 2025 18:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE4C2C0F95;
	Wed,  5 Nov 2025 18:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i2MeqRnX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC30F284880
	for <linux-usb@vger.kernel.org>; Wed,  5 Nov 2025 18:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762367413; cv=none; b=e+CSen72QDzqO9HOLw7B8GoZFcrjXHVsGQwRMJg2FD7mBQGAaNd5PPiKAVaSUehlqulO2sih3mzjnnJIZ+85qLLigJzLCa5H+bhAWAZQqw5KkI3Sbs2LIh+/JZ+LsjA+gNQ+jFRFuefl7kh8wn0V7W7G9iX5kKQD5TiKeQ7ocTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762367413; c=relaxed/simple;
	bh=+qYzFspYByXa/Po/8dDw9y93cicoWisKQwGPCFj9u9o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BDQlvl/FJ5xBXNn/hcVbbfcCu2NQ9PPoj7EvX6gQiBbaJ8sRQix9RiCmIipNxepKdsmVGxcxckGY1RsCA4vDgtlBa9JYaPN1VTOVzyBH6KOXNYgkVgdWF8orZxAfOuaI4s4eDr6DD3Yac1H+0w4T98PscMWgJBhJl4UGhF6O6nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i2MeqRnX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51391C19421
	for <linux-usb@vger.kernel.org>; Wed,  5 Nov 2025 18:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762367413;
	bh=+qYzFspYByXa/Po/8dDw9y93cicoWisKQwGPCFj9u9o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=i2MeqRnXr+wrvoisLx75VRXuI42u1WyOUKfVc3Imq6uYh85Hv2iGbBl7aceSPsChj
	 RjH4AnGJr32ifajxd7Yyxsujrv/AOvBf6OoSF5A7YIUbS1TUdLrMwmPRlzEo2Br1sl
	 IJCFixjk0oeLybvmkN2VjjxW/q4Y6b+xPFq7/N1v8dylCqWFU6iFy5Up87Y000AKlq
	 X/6hQO+1ZNfXPNtBbZEbXZ34g9Cr/GrYgoXbc/tgJ+vHZgmrpjpsOm37YYm+vRas3W
	 QFSkiTJDg9l1zfDZ9on3sVPZX9S5z+ieAuA0QWcCiVkmhgREjGsz2LNtbw8Rtis2sh
	 DaowZSulykIig==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4B9E7C53BC5; Wed,  5 Nov 2025 18:30:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Wed, 05 Nov 2025 18:30:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nick83ola@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220748-208809-jzTt4MzZDS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220748-208809@https.bugzilla.kernel.org/>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220748

--- Comment #7 from Nicola Lunghi (nick83ola@gmail.com) ---
Sorry just rereading Michael comments they are useful! I'll take a look thi=
s we
thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

