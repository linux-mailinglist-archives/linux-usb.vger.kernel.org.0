Return-Path: <linux-usb+bounces-10994-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7C88FF85D
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 02:01:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AE76283BB1
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 00:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4A2A48;
	Fri,  7 Jun 2024 00:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fwmfw6QY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C95363
	for <linux-usb@vger.kernel.org>; Fri,  7 Jun 2024 00:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717718486; cv=none; b=YxQ7EUo9/zgyrgYCfZbmdGAQrM3pYm5YnJTVrU+mYSkOxh/tD2Fu9hWGFzmIe80h1tzHTYcaGu+nGdut53SO/5c5MosfED51AGw18gK5GyptppvLvmiT86T6pjo1cwLXpJpepLvl/fdkOnAvF7esZqW5Fe9Nh++bYRKsri42JPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717718486; c=relaxed/simple;
	bh=+l3AdUbOxmm/gkE4u2/97ypeNNaDcCvTfwY+0gJtquw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YrEOoXXtFIiHL30iyC2Ud+GBNev2mVK3oxOcEBAyG52/FTSEJAZzJ7G5QemJeO/u32YKpg8LKlareJtz5c8Y6Bl83BJe/Hq0mxJPZ1yIMlXX8jTiPSjB0KmjgbcRAa2DQEH6wdBOntj8SlKKNS8hCwv+zJn+st+uEhJQ8vnZBTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fwmfw6QY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34F03C2BD10
	for <linux-usb@vger.kernel.org>; Fri,  7 Jun 2024 00:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717718486;
	bh=+l3AdUbOxmm/gkE4u2/97ypeNNaDcCvTfwY+0gJtquw=;
	h=From:To:Subject:Date:From;
	b=Fwmfw6QYxZpazCOSn33oxM0YuKCjpnbgK8ZYDm46UjZ45k/GGQOH1Ue8KLwxzWdm0
	 VpFltvUYLuK4Ay655gM81QC56d7UlFPk+X1HJYSGq/GnQ/WCpRY6a2jsJu6nDRlH4a
	 TH88nEf5CTWLtaGQGA3mm+JbgrrInfwtPSJ8ots592lP8p8G3wHS+jQmFZBCBRHiPT
	 +kXfTpNi9YOsF3NVbiwt8MwTPgwE/X2ajFcawRqKaqv45th9Io2r8vO9PRZqDNSEZb
	 QF8EPH3Kz6HxsLIHQ1ETLWkFcHZtdQcssJlaZlY4Cxkm5lzP7Qzhq8NbVQFRdIgvjq
	 bOVk5IWi30Ceg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 25C7BC53B73; Fri,  7 Jun 2024 00:01:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] New: No SuperSpeedPlus on AM4/5 Hubs
Date: Fri, 07 Jun 2024 00:01:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-218943-208809@https.bugzilla.kernel.org/>
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

            Bug ID: 218943
           Summary: No SuperSpeedPlus on AM4/5 Hubs
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: jarrard@proton.me
        Regression: No

Created attachment 306432
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306432&action=3Dedit
lsusb verbose list of devices and hubs

Having major problem getting my USB capture card and any usb device that is
rated at 10Gbps working under Linux at 10Gbps.  They all default to 5Gbps.

Things done:=20
Checked systems on Windows, 10Gbps confirmed
Checked devices on Windows ""
Checked multiple 10Gbps+ cables under Windows, all works.
Checked Linux kernel to ensure superspeedplus

Linux system won't use superspeedplus on devices and via usb hubs, all are
forced to 5Gbps.  I have tested on Arch and Ubuntu with multiple cables and
systems.

Device in question is USB Live Gamer 2.1 Capture Card from AsMedia. It works
flawlessly under Windows at 10Gbps!=20

I've added a lsusb list and as can be showned the root hub supports
superspeedplus but all devices are 5000M however the very last one is AsMed=
ia
device should should be 10000M

I've tried many ports, I can't figure out what is wrong.=20=20

There is a youtube video showing this device works at 10Gbps under Linux but
this system can't.=20

If I can't fix this I will need to abandon Linux and move back to Windows f=
or
the streaming due to this bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

