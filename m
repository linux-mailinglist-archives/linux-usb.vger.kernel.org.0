Return-Path: <linux-usb+bounces-4883-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6737828267
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jan 2024 09:47:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48DE4B274E9
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jan 2024 08:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C6835F0E;
	Tue,  9 Jan 2024 08:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fOYdnsKv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B37F360A8
	for <linux-usb@vger.kernel.org>; Tue,  9 Jan 2024 08:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE078C433F1
	for <linux-usb@vger.kernel.org>; Tue,  9 Jan 2024 08:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704789870;
	bh=bKafO/At4FQv8bem7SEc9YfJ290EPpLO1OPlPk0MusI=;
	h=From:To:Subject:Date:From;
	b=fOYdnsKvNmkA4oJ9U/FZUgYm9ANxkAEq0oozzkIXdGAt8VZ13BKSfGTUaZHLf/Ook
	 vl3/yWkCBG+LzIN6VpL5WLVAY0LZ3TDeqrmCIkQ30aUAyDbIK9C5jzQEp+JbjW7s6U
	 MIQGuL782aRka1qmTcyk3ljgIiCcxwY7fIin5x8RpOp2q7i40ZpNkJhJ1N0it7/h6P
	 IHlEG9DRb2kZZ0XOIVtpALQyRje0FDNTXSmnm3gDC4191XmNTNv5htiw6DHt22jA7I
	 E+XBlxbTzQtu7Q5xplBCTEDSKdfpewd6+jwk5USOJf74kQQjppHZJzihn0l48v0p0m
	 Dptl+UDpBjt4g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C1585C4332E; Tue,  9 Jan 2024 08:44:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218356] New: NETDEV WATCHDOG: wwan0 (cdc_ncm): transmit queue 0
 timed out
Date: Tue, 09 Jan 2024 08:44:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: 1016309222@qq.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-218356-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218356

            Bug ID: 218356
           Summary: NETDEV WATCHDOG: wwan0 (cdc_ncm): transmit queue 0
                    timed out
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: 1016309222@qq.com
        Regression: No

Created attachment 305689
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305689&action=3Dedit
usb3.0 usbnet crash log

I am using Linux kernel version 5.10.110 and the USB 3.0 interface. During =
the
USB device packet filling test, after running for a period of time, an error
message NETDEV WATCHLOG: wwan0 (cdc-ncm): transmit queue 0 timed out was
reported. The analysis shows that the print log exceeds the threshold dev
->txq.qlen>=3DTX_ QLEN (dev), how to solve this problem

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

