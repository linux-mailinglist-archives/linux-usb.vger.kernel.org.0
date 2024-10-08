Return-Path: <linux-usb+bounces-15840-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB1F994785
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 13:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19D79B29350
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 11:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8E51D2F58;
	Tue,  8 Oct 2024 11:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="khs4yEAY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076777603F
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 11:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728387783; cv=none; b=bJHwKeSihEjWNCJdmPEmOVLGIFa6VhYWSW2zdYYemngB6Oeo2TrtBPMM2SHOOXVa0nxZkSYPWPHopHDtSmk8zhUDWJytA3KaNWzHXU7JPMqnYpqMHdK8lXCGYrCdQY39dgFq5/Rryg5sNlIj1QXg6fVw28Z5moW4uum7KPNxsuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728387783; c=relaxed/simple;
	bh=vx6GjKAOECqkk1z9cZLwNaOQX+VIqEcewco+bf2Liyo=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jN8LLIU5ZnirU8FoszrXXnzyW0ixmV9AedyjB3ohAYb9YK6NiUD/VcC+eC6UbI4XQSS7D4rS7jCAwZixHV/w+I8g2w1BdlW6qUDdJrRmrFvtmeruc/uEaRo1XTtCoHJnLhK7k+bLXqnCJwhf5zD7YIJKtvtGW4bs085efFEgRFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=khs4yEAY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4679C4CECD
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 11:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728387782;
	bh=vx6GjKAOECqkk1z9cZLwNaOQX+VIqEcewco+bf2Liyo=;
	h=From:To:Subject:Date:From;
	b=khs4yEAYCPd+16xPY1iYBBzKpvbb2WXTBJkIg3uiXM07x/2ChW1w3xrfFfHH1EW8a
	 eXqxEOnoxmR0OfyuyhFZkcEUln2pPQBLmg4PMZt00S9T45WEptfbi+iCBuwY3Wsadr
	 RRyorWqmtECyUeFYmZbIIAmw364e+9/ObXk+lzHWqDk5RxjQkd+xhly3APnvwQFt93
	 jbyFRVNPkFew9sh82T6hgnBJoC+0CNo5CY3qt9AKmKStAWoh4vO1D8uyh0EvLc6MzH
	 +2gY3cCsyVDJawhVmaRARlJ1jLTar7RUnTbr7f9CvmEhO3R6r087HowKBALQYzwO/4
	 S7kASCxN9hXdQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 86BBCC53BC1; Tue,  8 Oct 2024 11:43:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219362] New: USB SATA does not correctly shutdown the SSD upon
 poweroff causing data loss
Date: Tue, 08 Oct 2024 11:43:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: harviecz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219362-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219362

            Bug ID: 219362
           Summary: USB SATA does not correctly shutdown the SSD upon
                    poweroff causing data loss
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: harviecz@gmail.com
        Regression: No

I have SATA SSD drive connected via TUSB9261 converter. Eventualy i experie=
nce
filesystem inconsistency when i repeatedly shutdown the device like this:

echo s > /proc/sysrq-trigger;
echo u > /proc/sysrq-trigger;
echo o > /proc/sysrq-trigger;

Same problem does not occur when i do this:

echo s > /proc/sysrq-trigger;
echo u > /proc/sysrq-trigger;
for i in /sys/block/*/device/delete; do echo 1 > "$i"; done;
echo o > /proc/sysrq-trigger;

This tells me, sysrq power(o)ff does not shutdown the devices in correct or=
der.
It shuts down the USB hub before it sends SATA shutdown to the SSD, therefo=
re
failing to notify SSD to write its internal caches before PMIC shuts down t=
he
power completely.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

