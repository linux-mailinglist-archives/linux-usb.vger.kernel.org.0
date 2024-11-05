Return-Path: <linux-usb+bounces-17126-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6612F9BD004
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 16:04:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AA452835E7
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 15:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F881D86F1;
	Tue,  5 Nov 2024 15:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YrioQjnS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC163D0D5
	for <linux-usb@vger.kernel.org>; Tue,  5 Nov 2024 15:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730819076; cv=none; b=lMw2jPJQlHJGPlKz7EPt3H2Mb7Rkxgm9IRphdog+/nEP/2hwcU9z6XIMKc8VKBdkfM0HczTqNcnQvcYvUIXy33mg0dHwVHtYgiNUwqSsEOnKsIO3bTcp0C8dXpyh2A1EKluFUbLA/zocnpDHjMepVk9LfOvHmbm8fN+BnFp6Zcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730819076; c=relaxed/simple;
	bh=vpseCmaE2xYchz5XZ1bLlB7b0IUrNJdCoblG+s4WEdg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=sTyiPg5JGZaR6JMkGTzxhupnKjiw/ftbek5TYu9iPUY4piiHpCBYuYAghNbAl9/SN14pL6qaXyDeo2iqufMiDLosObFD307QFMMPmSH8RGbFa1aeLUTz0qOrKRIvY3TY/I10zX/4mECqfxrc6GK5qmwPEI5yA0/ZVJapNuqvWGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YrioQjnS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29419C4CECF
	for <linux-usb@vger.kernel.org>; Tue,  5 Nov 2024 15:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730819076;
	bh=vpseCmaE2xYchz5XZ1bLlB7b0IUrNJdCoblG+s4WEdg=;
	h=From:To:Subject:Date:From;
	b=YrioQjnS3KKCmBrwjHHQp+dMorbTtZzXqrpvRNJQH+B2sOsUEKyZHLBquJrGMwDpi
	 9IkD+dAn9ZMJM7rtNAQRoEigCHdnh1ekM9QpVXIOF+Le24hsdA1npIFPip7eop3mHV
	 Qr2R+C2w9drbNNopET4/k8PQ051TgabbWWn6Y36A0rbpMUQVSqNbwrO3ykPkRoqAFz
	 aPw2F+sozPHyu97Bw758QXvy+hwLPSIWCCqVs7OmqnIVDiRMrtLaNg+V51nrTI9019
	 FDgNc2RuK/u+vzYJgtCYX0TjI4/LjpGw4+0fpRUsGg3HuYMgv3n6CPw4u0n6ybQRkX
	 /e9icdkUSZzEw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 11723C53BBF; Tue,  5 Nov 2024 15:04:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219470] New: Add support for Apple USB-C Magic Trackpad 2
Date: Tue, 05 Nov 2024 15:04:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: callahankovacs@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219470-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219470

            Bug ID: 219470
           Summary: Add support for Apple USB-C Magic Trackpad 2
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: enhancement
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: callahankovacs@gmail.com
        Regression: No

In October 2024, Apple released a USB-C model of the Magic Trackpad 2.

As far as I know, the design is identical to the Trackpad 2 except for:

1. USB-C connector replaces the lightning connector
2. New hardware ID of 0324


The new hardware ID prevents the hid-magicmouse driver from being used.  Th=
is
means the trackpad doesn't handle features such as scrolling and right
clicking.

I believe this requires adding the HID to drivers/hid/hid-ids.h and handlin=
g it
in drivers/hid/hid-magicmouse.c.

I'm happy to submit a patch, thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

