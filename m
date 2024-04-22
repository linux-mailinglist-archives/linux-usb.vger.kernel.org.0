Return-Path: <linux-usb+bounces-9584-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E01B8AD4EE
	for <lists+linux-usb@lfdr.de>; Mon, 22 Apr 2024 21:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DFF31F2139E
	for <lists+linux-usb@lfdr.de>; Mon, 22 Apr 2024 19:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02CC155331;
	Mon, 22 Apr 2024 19:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQ9galps"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79629153831
	for <linux-usb@vger.kernel.org>; Mon, 22 Apr 2024 19:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713814458; cv=none; b=VuzBMCLUuus9C9S6JrH0vTsPh9VONKpmTb65nw8lW8EazWwys2Lez8X1cVZW63QMx7AIpAxHA+0vw7a6LOsY0vkkMM+pxtDNYNQdIUZFDxiZ/ilooLH4COs3RYDWhBNDUHkcXpIPXaq2vAFGFuFh49dQA4PRfg4NvYAq0hLD0D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713814458; c=relaxed/simple;
	bh=Oa/zWSuPNK/HAuLl3vilEdIb3kXOcGTxGsPDxL8xjvA=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ex3pS1gR8n7OL8BnaejsO18jY0lh7VKZaqvzzqWZuLKUgBJ4OcKPRCFotznEeAbHPpCMGHNKs4CODWMrZjY5dm/bEXNGJSU4Yes+wK941TEXXf++gYNGL7UVqCmzwsTo9VGdkfIUg99YHU9E1UdNKtFC27APut5VyiAZ7vaCM4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQ9galps; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11E6AC113CC
	for <linux-usb@vger.kernel.org>; Mon, 22 Apr 2024 19:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713814458;
	bh=Oa/zWSuPNK/HAuLl3vilEdIb3kXOcGTxGsPDxL8xjvA=;
	h=From:To:Subject:Date:From;
	b=GQ9galpshShNubaRR3ESeZ5hIpEDB5gUwFRCGvIdIpI2KaMrIIpz38GEV15V9KMTf
	 gWh86unyYUBW1BTiAK2kvMib7vhYR91/IvCTWeOYydgB5vrGRHLfPizHsMbu3FwlJ4
	 HtlV6P5sfmiHIdm5e8azn8tLQDDbBpZ6qKSpCAsj7DoR2dphDAsmYgJphLP0S6GjDw
	 m0sUNf6wmcIMbnPeYPc///GJ9jNq+dYgK3UiRpG+6aCooyb3FQGaAXVB1NsoCSsJJh
	 IVnUDGoXFp0J09ej2z1CCxob8PBgN+nOTxVy1rqmX8tKNRnA+y+fZgkONUJKSKHr/x
	 q17nP5Z8nSpuQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EE005C433E2; Mon, 22 Apr 2024 19:34:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218762] New: USB string order in dmesg
Date: Mon, 22 Apr 2024 19:34:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: ddtpvtxm@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218762-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218762

            Bug ID: 218762
           Summary: USB string order in dmesg
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: enhancement
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: ddtpvtxm@gmail.com
        Regression: No

Hi,

Is there any good reason why the code
https://github.com/torvalds/linux/blob/c85af715cac0a951eea97393378e84bb4938=
4734/drivers/usb/core/hub.c#L2361
is declaring string (show_string) values in a different order than they are
specified in dev_info?

        dev_info(&udev->dev,
                "New USB device strings: Mfr=3D%d, Product=3D%d,
SerialNumber=3D%d\n",
                udev->descriptor.iManufacturer,
                udev->descriptor.iProduct,
                udev->descriptor.iSerialNumber);
        show_string(udev, "Product", udev->product);
        show_string(udev, "Manufacturer", udev->manufacturer);
        show_string(udev, "SerialNumber", udev->serial);


Now
usb 4-1: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3
usb 4-1: Product: BM5100ADW series
usb 4-1: Manufacturer: Pantum
usb 4-1: SerialNumber: CK1A8823765

Expected
usb 4-1: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3
usb 4-1: Manufacturer: Pantum
usb 4-1: Product: BM5100ADW series
usb 4-1: SerialNumber: CK1A8823765

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

