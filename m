Return-Path: <linux-usb+bounces-7381-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0707986DE65
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 10:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B00B1F21DB1
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 09:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ED546A8B6;
	Fri,  1 Mar 2024 09:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="di1yyarF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D60A6A8A8
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 09:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709285969; cv=none; b=n9Syl2soaBZAYalmoeUr9B1oEMHrak2nAeZ1u8EiyTF4v86IaexlfFjIMx5QsxEwfIyP8HKR90a+DOjqSUROJlymbeRn8b5oCgIq086T0yD2l4mGaUNWPMY9Wugmes+qNilM0tgOSymWpgCU9cM/twqIMhfrM/XL/kjnn0YlVYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709285969; c=relaxed/simple;
	bh=zx9ptW7DfUIMMNWyn1exrnX+ABjg6M2ftLZkp2lmqLI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gIMxRZQ6PwW663pxS85VgpVx9Bq59jMAL8byBwVRCwFp567DfWQxInjVxEPsZ7PmaI8KcwzYebs/5VolPWx5xDj8agJGbMJPDTnwmP37euLeIBUcTzjgP+zpA+8FApM9Yyq1hkc5BgzJzukdxcD3hKC2nX7EeUfe6Y4MGdg3ZPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=di1yyarF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16EB8C433F1
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 09:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709285969;
	bh=zx9ptW7DfUIMMNWyn1exrnX+ABjg6M2ftLZkp2lmqLI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=di1yyarFnCFwQN6wumfFtR6ebD4EbcM9xx3MaowZlimAi0/VGaqJnr5xL1ssyPQwG
	 +ySbQRBIkFeapp35QDnKnJKnzC0TyqLFYHxQaggvSxcng2y1wHa6I2+MA0l/o2NI7+
	 CJetkEnc1ZMQnJQgpOJ/Y/Hsla9tfo2O7WdsaETF/qoPoo3YVTabPxWYSNpf88eKFv
	 8LWKJwnDnOJOy0IImZWWH7kQJ2qodoCzj0NL1+7OLiqC0nZOrnvIyOU/1ox15M+PGq
	 j7KhhVl+Z/DXfr0ee6iTmNGxB8Zn919ALJ6EermnctJ82rImMFhJm+vvvpfCLuOxUj
	 y81yFQXFntm4Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 02F11C53BD0; Fri,  1 Mar 2024 09:39:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218525] Thunderbolt eGPU bad performance
Date: Fri, 01 Mar 2024 09:39:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218525-208809-zndmWtpgrY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218525-208809@https.bugzilla.kernel.org/>
References: <bug-218525-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218525

--- Comment #13 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Okay with this you have ASPM disabled:

                LnkCtl: ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
                        ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s (downgraded), Width x4 (downgraded)
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-

However, the link speed is now at gen 1 but I guess that gets adjusted then=
 as
you mentioned. I suggest to check that when you play some affected game tha=
t it
actually runs at the 8GT/s x 4.

One more thing comes to mind but you probably checked it already. The game =
may
not be using the eGPU and instead it is running on the internal one. With t=
he
Unigine benchmark it clearly used the eGPU.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

