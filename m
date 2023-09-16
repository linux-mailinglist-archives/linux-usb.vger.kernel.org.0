Return-Path: <linux-usb+bounces-230-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC557A2D03
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 03:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 446311C216E8
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 01:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A4F1FA3;
	Sat, 16 Sep 2023 01:22:14 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07AF374
	for <linux-usb@vger.kernel.org>; Sat, 16 Sep 2023 01:22:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54523C433C7
	for <linux-usb@vger.kernel.org>; Sat, 16 Sep 2023 01:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694827333;
	bh=Dq66BSwN7+ecHxIDa3XPlZ0Ye5kLF9PIdijGkPv7Noo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Fmps/8HkmiWi1vFor41GQH99OOPWkMtFNrBPtSJtJ63WQURYMl2O5OOvoIpoaDWeY
	 z5YfneAv1K80WitIm7D/cRRVBaOY2qj8PpJ2tpVbUCtfd7tu8ezMHS96rNXfL3coz8
	 v5F6f+ZxbcO1DsLRWOJr+gamzdBjR5tzqeb5ZE7oH/qdoELqkYWKmnlc0PZcvbv9Fs
	 pONRsp2W68AlmLBIIa1s/bGZak0qMS7fYGjy4TDyIGQolqdE+hYj1Y4BekXZzr3Ryn
	 pte4/xkQlW1HDc5bVxP8aK+6sywA15BMZOUVKuLpKQqytWyPnUtAhFKa2nSHTAnccK
	 BoMbY0gRAntBw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4050CC53BD3; Sat, 16 Sep 2023 01:22:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217915] System fails to resume correctly after Thunderbolt dock
 disconnected while sleeping
Date: Sat, 16 Sep 2023 01:22:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mark.blakeney@bullet-systems.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217915-208809-cFEovTMbnf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217915-208809@https.bugzilla.kernel.org/>
References: <bug-217915-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217915

--- Comment #4 from Mark Blakeney (mark.blakeney@bullet-systems.net) ---
Created attachment 305118
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305118&action=3Dedit
dmesg output with CONFIG_PCI_DEBUG and thunderbolt.dyndbg=3D+p

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

