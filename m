Return-Path: <linux-usb+bounces-27204-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC626B32B83
	for <lists+linux-usb@lfdr.de>; Sat, 23 Aug 2025 20:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DE5E5C3596
	for <lists+linux-usb@lfdr.de>; Sat, 23 Aug 2025 18:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2AC12E716D;
	Sat, 23 Aug 2025 18:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vDhd/Q3p"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA61212548
	for <linux-usb@vger.kernel.org>; Sat, 23 Aug 2025 18:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755975352; cv=none; b=pbCDoc4ClVIvXFMsBqQO7Zx5t7Z9p+bM1m5SuJYv5C2XASwSywuB5tNVH6tPCj7GVthurt8QLDPYr3EqYzq5n9ptRqfpTPu8InWYzbzDxs8FlrAvheEvzoxSrtVzkMAt3xEf0W5TSB57sN5FJqwVqrL2Tijo+9L4C24xJTYSHcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755975352; c=relaxed/simple;
	bh=8eulljiyeoquLaspUOsHQlWhKsNF9Cqrkk7X9liSU9A=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=X5tbw1e4Uc7Y7VLn0kTowB4+d/mKDfl6bZwS+TgTUqzSGCrNcNEJJI95A5CiRIoL01Yagx4oPGxw+dmacbURwnaaRy1oI1xM4071ZDZ6BulZpBzQ+nqHkziz5Y1hRiPyerigq8OYVuYVGEoMaV4uGp8BnkTeANOJjQLG3veNFnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vDhd/Q3p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4428C4CEE7
	for <linux-usb@vger.kernel.org>; Sat, 23 Aug 2025 18:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755975351;
	bh=8eulljiyeoquLaspUOsHQlWhKsNF9Cqrkk7X9liSU9A=;
	h=From:To:Subject:Date:From;
	b=vDhd/Q3pFWl0hwps1IlQp8dCep4BaJc1TKBYk/G/us/g9RI0k0dqE3eHpmsTpvQGF
	 uHDveIslOmwuFgOJcnHSE65LwxaZukjsz3k6vGXw1CA5OmW2zLwXbXsXRufj7lZfTE
	 TMcDtZCCJpKhv7BIBVSuP+zJ+mJ5QEwnk1k8Zhm62s0LfCCGEbbnEixz7qCLh64qDB
	 jVQDapuhHeihnhTrxZyitWY7S+m3N1mid4q5CtngK+36v6WAp3ouExk7wcRlDr8xlO
	 zRPbdl7Fqx/seAZPWpCMFeWDTXTW/fvlsceTX8v/TaxNM+r2xNR8k8oHXn/LfLY/S/
	 2yFePYTCDhpBw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D42A1C3279F; Sat, 23 Aug 2025 18:55:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220486] New: External monitor switches to lower refresh rate
 after resume from suspend
Date: Sat, 23 Aug 2025 18:55:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bghome@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-220486-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220486

            Bug ID: 220486
           Summary: External monitor switches to lower refresh rate after
                    resume from suspend
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: bghome@gmail.com
        Regression: No

Created attachment 308541
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308541&action=3Dedit
Kernel warning from drivers/usb/typec/class.c

An external monitor is connected to my laptop via USB-C port. Normally it w=
orks
in 3840x2160@30Hz mode. Sometimes after resuming from suspend, it falls bac=
k to
2048x1080@24Hz mode which is the highest available setting. This can be fix=
ed
by re-plugging the USB-C cable or reboot.

At the same time I see a kernel warning raised by the USB driver (see attac=
hed
log).

Kernel version: LTS 6.12.41

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

