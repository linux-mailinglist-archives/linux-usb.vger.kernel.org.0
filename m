Return-Path: <linux-usb+bounces-29438-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C02BBEEB8C
	for <lists+linux-usb@lfdr.de>; Sun, 19 Oct 2025 20:54:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3BF7D4E18C6
	for <lists+linux-usb@lfdr.de>; Sun, 19 Oct 2025 18:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 179B62EA178;
	Sun, 19 Oct 2025 18:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GdgmLnht"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0FE1F463E
	for <linux-usb@vger.kernel.org>; Sun, 19 Oct 2025 18:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760900072; cv=none; b=nqkQ/hdwZAe36TDB5zt8Ld1O9U7smM1xI8IunIIRpDuIqPV88tOcsRrzEdtzGXJIxEtlJt60+AeanXet6ICgsBcHXCz8Tv/9KOCB9oSESM2ixHEfCvjMgTCF0aVOXinimZ/11qZcGGkuHdN5LWWxAthvq8pMJVgOaTcbVtg1Znc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760900072; c=relaxed/simple;
	bh=PLkhnL4/Bs7aBOstRl2VvAeRKiBzgyA9LkdJMLjGgY0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gZGi74DPyAw5I2e01tMefeY6+qaM9+3DhGeacsKGPWLEUN7KfEmwW7N6tfamF4IuDzCt9xzu1UEWpjW/+oMi1TfAV9SBxRKN3Hqd23PWHS26f1xLuitznCNu8U3uGvbW68cfUMQFP3YYxJ/dxU0E3vHpCdQPvOZQrrEeQzk7zTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GdgmLnht; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0DEF3C4CEE7
	for <linux-usb@vger.kernel.org>; Sun, 19 Oct 2025 18:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760900071;
	bh=PLkhnL4/Bs7aBOstRl2VvAeRKiBzgyA9LkdJMLjGgY0=;
	h=From:To:Subject:Date:From;
	b=GdgmLnht3yQpKVyR9UlifQNhtuqQEwbqx8lOIFfrTpzF5obEM1yOW0J9PzktZo6r9
	 SaYtjYsTjfpTfu0oD+UK26zxXouwQYZikPkajV4Qjh5syqTu8oO60ALp0OCujwiMj1
	 0GVD5M591AqAWActEmWe7Q5djllUfIGzIDCY+rUvujU6jUT0W3Fdk/pkXfAtIvNWJ3
	 DYY5BM+O2WCp8qSvsz/JWwDXPhuYsWfmqwapm4GRVtVyh8Wd37H4od9IGNiqyAqAMA
	 ReLiNpWDstyYAW2aBR4N3LmCkQQIrRHLVenY1kc0LEwxjtW0HG/v4iuAY+9U9gKWOp
	 /EEs7RF6kJemA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EE307C41612; Sun, 19 Oct 2025 18:54:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220686] New: REGRESSION: USB devices not recognised when
 plugged to Thunderbolt 4 USB-C ports
Date: Sun, 19 Oct 2025 18:54:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: anonq@tutanota.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression
Message-ID: <bug-220686-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220686

            Bug ID: 220686
           Summary: REGRESSION: USB devices not recognised when plugged to
                    Thunderbolt 4 USB-C ports
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.16.12
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: blocking
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: anonq@tutanota.com
        Regression: Yes

I'm on Linux (Fedora 42)=20
Kernel 6.14.0-63.fc42.x86_64

USB controllers are detected:

$ lspci -nn | grep -i thunderbolt

00:07.0 PCI bridge [0604]: Intel Corporation Meteor Lake-P Thunderbolt 4 PCI
Express Root Port #0 [8086:7ec4] (rev 10)
00:07.2 PCI bridge [0604]: Intel Corporation Meteor Lake-P Thunderbolt 4 PCI
Express Root Port #2 [8086:7ec6] (rev 10)
00:0d.0 USB controller [0c03]: Intel Corporation Meteor Lake-P Thunderbolt 4
USB Controller [8086:7ec0] (rev 10)
00:0d.2 USB controller [0c03]: Intel Corporation Meteor Lake-P Thunderbolt 4
NHI #0 [8086:7ec2] (rev 10)
00:0d.3 USB controller [0c03]: Intel Corporation Meteor Lake-P Thunderbolt 4
NHI #1 [8086:7ec3] (rev 10)

All firmware is up-to-date, so is Fedora Linux

When I plug a device in the USB4 port, dmesg doesn't change and the device
isn't detected at all


Booting from kernel 6.14.0-63.fc42.x86_64 works fine

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

