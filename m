Return-Path: <linux-usb+bounces-7024-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC518625A8
	for <lists+linux-usb@lfdr.de>; Sat, 24 Feb 2024 15:48:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A4F91F21F67
	for <lists+linux-usb@lfdr.de>; Sat, 24 Feb 2024 14:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502191C13;
	Sat, 24 Feb 2024 14:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JUeL6xcr"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AB742043
	for <linux-usb@vger.kernel.org>; Sat, 24 Feb 2024 14:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708786087; cv=none; b=kuyLK6dpwmAj/jquiDxnATCfvMN3pZgZAKwm4eqkx9vroVNoZp9eMM7GCYRmkbStHYlMbDlhzNsHy+NwXsXGvFMmW1yN4hnBhYJvMgsJ9Fim4nvqLgpjdPK6DTN6aSCws2KRaoi1tXeBpqq26hh4ALdNDvrMqrYMw+GCClWPMAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708786087; c=relaxed/simple;
	bh=iI1nwc5vmbxH2h9zUSxLsO+rba3Qg4rDFwzEKOuM3DE=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hfdfyvbY6J6PPxCNMFi+YyD+dJx05OSQ3clLu+iAHTFbk1Py+Bg4zuR/4pDKyTtsW5pSHtKIDzjJiW06/XF+PYW/Vg0lGXed5DcIX7GourdMloLH99rLm06X3xzS8YJC8klfyru+YAJXxdffsUk6lsEgec2cT886ToeTubcAryE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JUeL6xcr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4961C433C7
	for <linux-usb@vger.kernel.org>; Sat, 24 Feb 2024 14:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708786086;
	bh=iI1nwc5vmbxH2h9zUSxLsO+rba3Qg4rDFwzEKOuM3DE=;
	h=From:To:Subject:Date:From;
	b=JUeL6xcr9wfNclfRrV2ad1tL6xJDY7lxGBIHMCJU4hFszxNvsApx1mco0xeaRcVt9
	 HStic6kokltaJCLBybBEO/POVCDQpPrcQPikuQNQBAACU1FzMrJb4h7o72WgVdt3G3
	 IYAlWDN4NF7xWdkN+3N+R2JoBhRySpoatK/jmOUlecpHR6IE3KsuHsAfM4HAigSMP9
	 ftMoAN+pdEViEeQzcffeOBUHm2kjo9W0zzEdrpMZ0jNk+3dqZWGmtdwd/5qamZ2/BC
	 WCUGAmTTbaJE1Nw6sag69BWjBEzntghrfz0bP5hNpBx8259FKTxvfw6Z//HFv7g0OM
	 EnZKyLU8wUCRA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C69E6C4332E; Sat, 24 Feb 2024 14:48:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218526] New: Unable to achieve 240hz on usb4 docking station
Date: Sat, 24 Feb 2024 14:48:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: samworlds123@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218526-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218526

            Bug ID: 218526
           Summary: Unable to achieve 240hz on usb4 docking station
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: samworlds123@gmail.com
        Regression: No

Kernel version used: 6.7.5

Using a display1.2 port to display1.4 port on the dock I'm not able to get
240hz on linux I max out at 165hz

On windows with the same dock and montior I get 240hz=20

I've tested 3 wayland compositors which all had the same results.


Cpu: 7940hs, usb4 port with 40gbs

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

