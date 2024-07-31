Return-Path: <linux-usb+bounces-12705-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4EB942D10
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 13:18:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D7A11C23216
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 11:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D45E1AC433;
	Wed, 31 Jul 2024 11:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1PIjlJk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75141A4B34
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 11:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722424709; cv=none; b=UHRucXm0mI/LMTnUixQ5UP1TN93u+xYhTQ/U+brE1zAzYmjHy5XDcjGhHawe0V6ITajAKYf2cuZXU/SudbqO7zQEGM1GyUqO18Nyjvko119uoNkfnV5ZPzCaQvu1DRENNz+/mhcXk6uadIn2k9wAnbBIyoP6+CfnxH0KdZBNeGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722424709; c=relaxed/simple;
	bh=nf3gVQ9JIIYBLNcrjnmExMes0nCoUEG10BQcsL1LFio=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DN8/ou9du0lhWiTaUL+LotMz/SzEZOZMEkMsGopXWgdMLSI4D76lkJHYIhgMgITn2ZAil7BtsRySj9Gghn2R+BIMJc6Dh966aHuZ5UVCYwWX44oRgw3XFGZ8wcVDkJZVtvt71Y1kIWhaUJqCz2ePveb3F7w1U14BmIahh3QU4Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U1PIjlJk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 758FBC116B1
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 11:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722424709;
	bh=nf3gVQ9JIIYBLNcrjnmExMes0nCoUEG10BQcsL1LFio=;
	h=From:To:Subject:Date:From;
	b=U1PIjlJkTOZhpNB3yPhu0ZCIOsglx21Du2E/5BS29JPvSXRvuTaal1U0C0k5l9Wo/
	 vuAGmExwlmI6QOmFhrwFgZvr9es1FqMCoxq7hOcseOq3MZlDSINxhb247VwEgL/4zY
	 ZRWTXALRBJMbElim40KU766g/MnSMi6PNGPL+nRAw3/Vtlxx6rsSTO1u9wMUyr8iBe
	 dSVsJIOPHpMbs75beB2LxozG51i12VYGwm0bUpxf0VJY1ipICir00WVB37gsyFIyd6
	 FKdb+0oEXRTq1SFQRtnW59rTkGuwxpSX3Z9xCLZHDYyeXlw9U0E7s+JGgD7hqr65vt
	 dfyCBUNMOU+hQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 60D08C433E5; Wed, 31 Jul 2024 11:18:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219113] New: mysterious disk I/O-errors which freeze the system
Date: Wed, 31 Jul 2024 11:18:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ijaaskelainen@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-219113-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219113

            Bug ID: 219113
           Summary: mysterious disk I/O-errors which freeze the system
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: ijaaskelainen@outlook.com
        Regression: No

Created attachment 306644
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306644&action=3Dedit
dmesg

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

