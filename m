Return-Path: <linux-usb+bounces-9079-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF2E89C98B
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 18:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56A10B228FC
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 16:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A73914262C;
	Mon,  8 Apr 2024 16:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HdtKM9c5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116E23BBD4
	for <linux-usb@vger.kernel.org>; Mon,  8 Apr 2024 16:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712593907; cv=none; b=N7WifmJeYegTI9LcY+XTpk6uyjvp7aqkGzm0ErPO8gINFujJn1oK9XSWjUSu1ybjhc36LiFX6B1klgbngRh/pRDKSWZCAepQyckyokhEqzsITIgLb3ci8wIcjmD7deN/xtBk+z62ayO6uboRyp7fw0cPuLMnV4ZusZQZLqWdNxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712593907; c=relaxed/simple;
	bh=Hr09Y0lEkDl5SmR1w6aAAhNejFxfKxpVq+/iKy/Bqo4=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=XVR947e/e7GIeZE/WxG0SdeV16OowSrsaAJTP56TdC/Wl4V95S+6v0RoMWv6qZNT0KQp1Ajhj0DoJKGqVDWZrN7riCArTgYL+6Q4j7ifzsurlnCq9OSM2IgqAfmHiwUP4simO7lP7m0VzwBRrU+sZ7+S8393iA0vmDvoQuko6dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HdtKM9c5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94596C433F1
	for <linux-usb@vger.kernel.org>; Mon,  8 Apr 2024 16:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712593905;
	bh=Hr09Y0lEkDl5SmR1w6aAAhNejFxfKxpVq+/iKy/Bqo4=;
	h=From:To:Subject:Date:From;
	b=HdtKM9c5/F+fqb1vEjqndk2pkv0JoixUkboGnzZFWVB03U+7eQZW8zgh7JMcNRlcP
	 4JDr1VXvNBQK98cJrhdaj94glM2xw/zPLmwE8kmCo0h7OTmtI5/yJbSfMdGFstuiFZ
	 Hn3/Qeze57yXtRoQGnlO0AoJb/ijCHJQFqqsINk+lqynv4ifUY4BXk+S3Z320Afr5b
	 xe5sJBkaWg2ahzfPr5acieSURT+cCCvNrZymHH9Ub80JtzmBOFrlt7ARhKRWLyirhp
	 6Vk+Q7I6tMX3vntWi2wDPf7tZtZwD8Vwmq5OidrabRqnMZUe+bd3pxrtwuSZd2B0jx
	 lCBan0sMCQ6DQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7AEEDC53BD9; Mon,  8 Apr 2024 16:31:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218695] New: Datadump for error `ERROR Transfer event TRB DMA
 ptr not part of current TD ep_index 1 comp_code 1`
Date: Mon, 08 Apr 2024 16:31:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-218695-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218695

            Bug ID: 218695
           Summary: Datadump for error `ERROR Transfer event TRB DMA ptr
                    not part of current TD ep_index 1 comp_code 1`
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: pmenzel+bugzilla.kernel.org@molgen.mpg.de
        Regression: No

Created attachment 306106
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306106&action=3Dedit
Linux 6.9-rc2+ messages debug v2 patch (output of `dmesg`)

https://lore.kernel.org/linux-usb/1f64af9a-0618-a7da-4acc-f043b6580308@linu=
x.intel.com/T/#t

This is just for attaching trace files and Linux messages.

```
echo 'module xhci_hcd =3Dp' >/sys/kernel/debug/dynamic_debug/control
echo 'module xhci_hcd =3Dp' | sudo tee /sys/kernel/debug/dynamic_debug/cont=
rol
echo 'module usbcore =3Dp' | sudo tee /sys/kernel/debug/dynamic_debug/contr=
ol=20
echo 81920 | sudo tee /sys/kernel/debug/tracing/buffer_size_kb
echo 1 | sudo tee /sys/kernel/debug/tracing/events/xhci-hcd/enable=20
echo 1 | sudo tee /sys/kernel/debug/tracing/tracing_on
echo 0 | sudo tee /sys/kernel/debug/tracing/tracing_on
echo 'module usbcore -p' | sudo tee /sys/kernel/debug/dynamic_debug/control
echo 0 | sudo tee /sys/kernel/debug/tracing/events/xhci-hcd/enable
echo 'module xhci_hcd -p' | sudo tee /sys/kernel/debug/dynamic_debug/control
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

