Return-Path: <linux-usb+bounces-22501-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E028A79E78
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 10:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDA96189402C
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 08:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88FB241CB2;
	Thu,  3 Apr 2025 08:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N7g1M9VC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0D91C860E
	for <linux-usb@vger.kernel.org>; Thu,  3 Apr 2025 08:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670174; cv=none; b=P9TQ4AUA/0Z/PJxkZb18MX9EV9xwywWBdfsC60ngpwf4KMgyVS3CJiyxt6eqA1ywQThsgWoKdgt74GPLIY5/IgS2zeklz20PEPB2lVVUebVXwcp7n4WEMbqhC83zRDJJ8v9fpHNOLS5GaeU02iNapHWPYdh04nQDnIz88YitPDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670174; c=relaxed/simple;
	bh=q2Zqo5vc1KjjaJwG1wprF0k0pq3WgGEb/w/5pJRciII=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=aT76n8VjzSzP3B+ocIo0pGPOX1HEMQ/j2tmbOig8W1vFD5rKYrESfvYHk8xKBlgTwdsNCSyWQcIJbehAuc77NKJFVcSZ+FHnKRndn45numaHKXKv19Y41xgNBJFA6L8ExqhRLB9SpddQJGO7oxoPbyNpu5+ZCVtmgEcgXiHTUkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N7g1M9VC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8FDDC4CEE3
	for <linux-usb@vger.kernel.org>; Thu,  3 Apr 2025 08:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743670173;
	bh=q2Zqo5vc1KjjaJwG1wprF0k0pq3WgGEb/w/5pJRciII=;
	h=From:To:Subject:Date:From;
	b=N7g1M9VCWskgv5lfq6kQrFFXn2twZZtTVbCNTY2RP2EymCHtrtePfhP/vAIbo6Uto
	 E6E1djSfyekNPRHU5cCiIWdFceE5sWQaDbMfuADXNaP/aDIJKH1LeBDGfAHXMwd9AE
	 vwstaUxR+wZeSCQkymdEVzKexT51WOoK5vajsoG6qFCE2l7OF/6mh9YIgPRLg/WG4Z
	 w8gFkyYXYVqxBDpjkCOr+Sd+RZUN7xBZUfYT5oTPq3082Vjh86qtkVqPpRYTLgtPuW
	 +7jZ7qZgN2Txy0B1PeoZchnxAKSz2NOBMWZDTlwXLZI/XUqdEss/yjhfHwQIeftezz
	 l+8y9ZSV+Nxow==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B1417C3279F; Thu,  3 Apr 2025 08:49:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219977] New: usb: dwc2: memory leak of hsotg->regset
Date: Thu, 03 Apr 2025 08:49:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kakapapa2@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219977-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219977

            Bug ID: 219977
           Summary: usb: dwc2: memory leak of hsotg->regset
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: kakapapa2@gmail.com
        Regression: No

Hi,

In drivers/usb/dwc2/debugfs.c line 790:
https://web.git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/d=
rivers/usb/dwc2/debugfs.c?h=3Dv6.13.9

790:
        hsotg->regset =3D devm_kzalloc(hsotg->dev, sizeof(*hsotg->regset),
                                                                GFP_KERNEL);

"hsotg->regset" is allocated but not be released in dwc2_debugfs_exit().

FYI.
dwc3 was fixed same issue in commit e6bdf8195b4a43ebff71f25fc7ca5e436e79161=
a.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

