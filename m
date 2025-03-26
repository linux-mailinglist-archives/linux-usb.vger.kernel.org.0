Return-Path: <linux-usb+bounces-22146-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4637CA70EA7
	for <lists+linux-usb@lfdr.de>; Wed, 26 Mar 2025 02:51:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4568E3AEE37
	for <lists+linux-usb@lfdr.de>; Wed, 26 Mar 2025 01:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58C60433CB;
	Wed, 26 Mar 2025 01:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCO9YfUE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AA517E4
	for <linux-usb@vger.kernel.org>; Wed, 26 Mar 2025 01:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742953900; cv=none; b=K6d6SRecNtoKIaHvyLr0Gdjy7X/JHB/7Dl/yqeYIFUKkxmQ9HEJq5J8Zzepc4NLmRAMq1ixET3yoxXhpmvq46U5UnuRQgCzArSHSZ7f2qBaRFaVXd2MW1+AVr3p8RBfTVpMAVwKSIvjHI2TstxssU/x9PMLxxIZzduSUgeqvFmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742953900; c=relaxed/simple;
	bh=4njeKASASzuAleyLxewgvpaURVa34Ky3UhBJkCv8G04=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=JjCjEDBGPDjuKhYpWOdW0Q6EYxnUpPLKKNfkpWX7mGFTQds/ul5+lX7ausqmR+bczroFrSo2/Um/P+hn8eSqJ9GJN6AuSi89k97K8I0D0SygBK9nuM2lfROKfbwwGZeWQuiaaworgJqC/GAPB2OJhHgZDj+t2CTtWqA2x1LpE0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCO9YfUE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43B3FC4CEE4
	for <linux-usb@vger.kernel.org>; Wed, 26 Mar 2025 01:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742953899;
	bh=4njeKASASzuAleyLxewgvpaURVa34Ky3UhBJkCv8G04=;
	h=From:To:Subject:Date:From;
	b=WCO9YfUEDD25mDXgRhWIm413e39lIo9sFVmUIe/PufV4zl1k49n9D7NJ7iBUxyNKt
	 5R5qRR6LnPtENGoJITMYejLtuSEls1BALjGnGGk2mzToqwvWhS5kWdwxMjfNzG3hjc
	 thsv1Wm/EsCdE1J3rUTdft9xw+vJZ4kDRXcJu3lvRLw/OZn62CLKuW8zGdqU0CHJW7
	 2LK9btLI9mMkxC3/dMJM1xPaAUimdKAUaKkYWfpzal6mO2nwinMNFj5kXFyiX1XsZo
	 A0tmrpfPk5Jb7adxwFuOP+B95F9Gk4KbOXoeoHZIc5tdM/iBzIYtQqkNH2H7dVAmTI
	 EdX0MUds2RmFQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2D524C4160E; Wed, 26 Mar 2025 01:51:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219924] New: xhci_hcd TRB DMA error and device lockup with
 AKLOT 2i2 USB audio interface
Date: Wed, 26 Mar 2025 01:51:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernel@deimos.ca
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-219924-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219924

            Bug ID: 219924
           Summary: xhci_hcd TRB DMA error and device lockup with AKLOT
                    2i2 USB audio interface
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: kernel@deimos.ca
        Regression: No

Created attachment 307892
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307892&action=3Dedit
'dmesg' output while plugging device through a hub, lsusb -t, uname -a and
lspci | grep -i usb

My USB audio interface (AKLOT 2i2, Vendor 152a, Product 887e) causes a
reproducible failure in the Linux USB subsystem when unplugged during or af=
ter
audio activity. The issue is severe enough that the xHCI controller refuses=
 to
re-enumerate the device until a full reboot (or cold plug with hub reset). =
My
laptop is a Lenovo Slim 7,=20

In some cases, the AKLOT interface locks up internally, requiring power-cyc=
le
or connection to another host to recover.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

