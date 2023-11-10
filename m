Return-Path: <linux-usb+bounces-2771-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 859197E7AC5
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 10:26:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6D211C20D42
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 09:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A7E125BA;
	Fri, 10 Nov 2023 09:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S8K19OuQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FD511CA1
	for <linux-usb@vger.kernel.org>; Fri, 10 Nov 2023 09:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5CBF6C433C8
	for <linux-usb@vger.kernel.org>; Fri, 10 Nov 2023 09:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699608373;
	bh=fnMtVxrVjsknUcS88ytbcJt+DWR6II1KKnJtwtOzqbc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=S8K19OuQRiIkB6AC/6bsIVDYmOyHW5Be/v7ziV1a53fWmIBOGhHVDzmbM65QdrNS6
	 F586fPWIzRc/BaoM1XlexXT28StpA6N/FBw/vBEROVJc+H67enFgbTBi36mIkd4A3F
	 bZiDru40l+r58pmlbFY7O78yI0puB9KwpY5gilBYmc83uMuWj87rTQRGQPVySWFYJ7
	 r/xXCbCOVbYCEN6BBw7kQKECJRaNjWT0KrBs/ESsLSm7fB/wndhHj9dZtcIw/eUUaS
	 4e0C9c+XlZvhjuMPYSRxqWY6O6iv8OjshMlmraNqTLgf07+uKM6xBi0DTGCURhPUK/
	 w6Hqnxt2JNdTA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 40C97C4332E; Fri, 10 Nov 2023 09:26:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218118] USB3 port does not work on Chromebook XE303C12 with
 Linux kernel 6.5.11
Date: Fri, 10 Nov 2023 09:26:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: quark@disroot.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218118-208809-H8PV51ZUzU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218118-208809@https.bugzilla.kernel.org/>
References: <bug-218118-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218118

--- Comment #6 from Andrew (quark@disroot.org) ---
Created attachment 305392
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305392&action=3Dedit
dmesg

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

