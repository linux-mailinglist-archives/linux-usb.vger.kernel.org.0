Return-Path: <linux-usb+bounces-2772-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BCC7E7AC9
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 10:27:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BA3A28163E
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 09:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8673B125BA;
	Fri, 10 Nov 2023 09:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kbf+XTDn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31ED125A4
	for <linux-usb@vger.kernel.org>; Fri, 10 Nov 2023 09:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78B38C433C8
	for <linux-usb@vger.kernel.org>; Fri, 10 Nov 2023 09:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699608428;
	bh=rr+gsEEHuQPeygGrMhp0Pl3Kkafed+5eAHPihIecERo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Kbf+XTDnmHePMH9b8GwagN3JXbjDz3Q1RoqsFP9hSFnbFuZWX7OAdzcgAMtz5txnG
	 lSa5y7NvVS70uO+pC/vqB3BwpNgNCMxrfIma+eZnsKo3WjI30ctk2cbYfTMY4CDHu9
	 LjOCLEER1qILIQKtONcBY7z+6WAbIjxWhkYbbjWD6bJFPbr6xgk1tFu+/aKd8ewsYB
	 fwZ71S5Fwo0BcRXx+vP2zrSCaPiqKmniYeTjjPr5gqP3gXT2GA/hmWpjZoOLVHJg+Y
	 fXe/XFcCMYdTv+YRMetF4LMmjq2sdASs+HsfkCMSmHA/PvXDQj0ZJPTZGo4SKrZXSG
	 WCQJYLX4nWCfg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 66BFFC4332E; Fri, 10 Nov 2023 09:27:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218118] USB3 port does not work on Chromebook XE303C12 with
 Linux kernel 6.5.11
Date: Fri, 10 Nov 2023 09:27:08 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218118-208809-7xm3xs1WNt@https.bugzilla.kernel.org/>
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

--- Comment #7 from Andrew (quark@disroot.org) ---
I applied configpatch and rebuilt the kernel. With debugging enabled usb3 p=
ort
works fine. That was unexpected for me.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

