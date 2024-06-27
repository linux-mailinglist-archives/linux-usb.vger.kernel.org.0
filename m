Return-Path: <linux-usb+bounces-11728-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA83391A36C
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 12:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 708901F23692
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 10:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98C6313C801;
	Thu, 27 Jun 2024 10:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ETiyBmLT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D1026AF5
	for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 10:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719482687; cv=none; b=OFsafiNgCoM0/TJmlYUAJW4EbqfxKgrn7q5ieO49NzrVKZFgZ6+fDYjo3cbZqQguVB0vyABbxPMGd2sdkQTUXP5NQUo0l5uO37dcexWgYe0KUhZHUZk5fkQQuEau27WoB4zqoHBCHmSfWgz5yuHRsE/7ys5boT/lxxUwb8hxtoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719482687; c=relaxed/simple;
	bh=+FHdFlT4rpKhq413YrXcMQj5NWlurCmuIa8iZeW+tws=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=lUBJKn1ePJJx8clVCA9jg1Lz1niHY1Qx8h8THesOLZVjipSku0XyJQxtI2DvKmYq6eS92HaiBifmT1Idc32Y/6kHjaz88jQiqNzizvw0SXLHMswwpDVtrbtA+SemOi6Mm1lHJxpRszncN4PuB8KL/phi3vIUcP0ToidtVOQXwRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ETiyBmLT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4E24C2BBFC
	for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 10:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719482686;
	bh=+FHdFlT4rpKhq413YrXcMQj5NWlurCmuIa8iZeW+tws=;
	h=From:To:Subject:Date:From;
	b=ETiyBmLTaI4qP9U43KiFkrMFteLinBrK7ggEViteQ88uxRdTJtyb0dcW3F10iPEfs
	 QyXbYEuuZIoJUtS0yIZ15I08P4Gk7xNiqOWTMAHv99n2aXnVICk9tbuo6QP1QagV37
	 t+ELaRhULSiOpX7hFT0fwLbehwYvtiZ7xHyaOyxSBj1KOuv6PF7JLxMcPYS7/YCp+D
	 pMULUQ6I4Hj2b1FxEA+3aInKhl8To3K5hMu8NIHP1BXVhgqJincf9/nBTbJ18E5tvm
	 P9WmTOy8Im1AyV7bdz1yHcPHJQQsSP2TQ7n0suEfGxxC1fc/w0JkKKBIxGsXiZxotZ
	 zZndkhjV4l7UQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8FE15C433E5; Thu, 27 Jun 2024 10:04:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218992] New: headset
Date: Thu, 27 Jun 2024 10:04:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: quic_ugoswami@quicinc.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218992-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218992

            Bug ID: 218992
           Summary: headset
           Product: Drivers
           Version: 2.5
          Hardware: ARM
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: quic_ugoswami@quicinc.com
        Regression: No

I'm encountering an issue where the USB audio is transmitted in noise inste=
ad
of valid data. This was found on SM8650.

Steps to reproduce are as follows:
1. Start Connect USB type-c headset.
2. Start the Karaoke with USB-headset
Result:

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

