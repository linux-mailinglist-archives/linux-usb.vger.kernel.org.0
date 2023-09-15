Return-Path: <linux-usb+bounces-183-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DAB7A2AFD
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 01:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C91A61C20ABD
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 23:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339CC1BDD5;
	Fri, 15 Sep 2023 23:29:14 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111A530D0D
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 23:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C1E1C433C8
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 23:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694820552;
	bh=TjG+Gab3XBADkn070Ird5U1RIeW33q4EBzmoA9I5bjo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ov/U4vK17dnYi4pZ3mrIMgb07ssAaPOmvqfwYrgXSXmxpM7nM7IjrGBFLEkTsDdnk
	 Yn7UQNwGG/swFkA5lhzVPIw+qP0fbqCHepqy9gztbEuCxjJ5xOKKuOnLdayMbr0aPa
	 wUsIj8B3PJQejTup9rtndvW5gMv37jVAuwigSERlLjObDUOo7tT8KLiBQ+WK8d017G
	 UY6YNHgOivDc6uaQ8rLTLHRe5G3pjZNIJNzWjrF0S/EfLdvsA3sPL/kTNJcmiNLM8O
	 E09J1QK5QFiWNjrxheCGIlNx5no72yjWHyXeC3JyhxxH72qI8YwKLGNz7T9LKWbh8Q
	 4X64Gz3DPGJSQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 53086C4332E; Fri, 15 Sep 2023 23:29:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217915] System fails to resume correctly after Thunderbolt dock
 disconnected while sleeping
Date: Fri, 15 Sep 2023 23:29:12 +0000
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
Message-ID: <bug-217915-208809-BxskHBEWGo@https.bugzilla.kernel.org/>
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

--- Comment #2 from Mark Blakeney (mark.blakeney@bullet-systems.net) ---
Created attachment 305117
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305117&action=3Dedit
dmesg output with thunderbolt.dyndbg=3D+p

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

