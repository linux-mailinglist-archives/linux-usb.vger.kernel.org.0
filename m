Return-Path: <linux-usb+bounces-19767-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB7AA1C7CD
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jan 2025 14:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21145164C0A
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jan 2025 13:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADDC317588;
	Sun, 26 Jan 2025 13:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1Tvt2uU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F62825A642
	for <linux-usb@vger.kernel.org>; Sun, 26 Jan 2025 13:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737896611; cv=none; b=GzZIyMCMeOGuWkyK28/VBAx7BVmk9VlMTQxW5CaJ1iI6szCIaxQresX6PL3uoqEy03mtpgWoed3Zle5jjoTO+iIq0ZIK3JzMnuCzvlF6LYefPyrQ7yp0Rgk5Pl1xNrMDC/nYRwkuQuE1elhQPYF49YLhjOsiBIULfh/Xg/QPtHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737896611; c=relaxed/simple;
	bh=wPUUSZXp3Bhdt3Z/QitLMkGBmx19eMpDV+J4IgCLaVU=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=iEgMq0KQnDLqeHDjJ7fuY2uXY/tgtQQFyEc+suNkWTkK7iiSfPIEg0u6j9sc5rCP4u6HfqiXMq5Sjhgiy4b6wS5Yjew59stTCSbHnLQd4iEWwMAkTvyE3j+jLpjm71VU9xeEJTEzpmZjN7WHkMvr8QDU8/4myKr3FfdwPMT3VZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1Tvt2uU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 875C6C4CED3
	for <linux-usb@vger.kernel.org>; Sun, 26 Jan 2025 13:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737896610;
	bh=wPUUSZXp3Bhdt3Z/QitLMkGBmx19eMpDV+J4IgCLaVU=;
	h=From:To:Subject:Date:From;
	b=o1Tvt2uUsQXdWFWVuyADx/n4HJvlbcitxJ/I7XU1wpfxv7Fli8LXV9Nr+WhiitJzd
	 7XabwV+pkXWDjRlSWeHNDNMTM0jyGcFp+dNnl4oEdawC6PHo9eevs67PrqQG5utJ06
	 icFMuIzOLWrVcH/xsmjqVCyfxohMrfgN0oGAdoCpSEzyph8weuQP+fJ9hVQI/1ynry
	 m2oSMl4FeV1R4fkkZ300vKs9sPx4l0l8iA1UCIEf6Bh5dZO1Y7+NArZMUGMKZMNEx/
	 CGTN7otTRG8B8B1y7rlYwOrhFrS1Jn9UNAJsqlndNYI9TL/QSRGNkt0hQ1UzaP6a/F
	 VvZ5CsWHTxNkg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 74C4FC3279E; Sun, 26 Jan 2025 13:03:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219726] New: USB devices fail to show up when upgrading to
 6.12.11
Date: Sun, 26 Jan 2025 13:03:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: marcel.c.vasilache@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-219726-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219726

            Bug ID: 219726
           Summary: USB devices fail to show up when upgrading to 6.12.11
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.12.11
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: marcel.c.vasilache@gmail.com
        Regression: No

Created attachment 307537
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307537&action=3Dedit
Kernel config files

After upgrading to 6.12.11 from kernel 6.11.11 some USB devices fail to show
up.

With 6.11.11 lsusb output is:

>Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>Bus 001 Device 002: ID 04b3:301a IBM Corp. 2-port low-power hub
>Bus 001 Device 003: ID 04b3:301b IBM Corp. SK-8815 Keyboard
>Bus 001 Device 004: ID 046d:c066 Logitech, Inc. G9x Laser Mouse
>Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
>Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>Bus 003 Device 002: ID 152a:8750 Thesycon Systemsoftware & Consulting GmbH=
 D90
>MQA
>Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub

While with 6.12.11 it is:

>Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>Bus 001 Device 003: ID 04b3:301a IBM Corp. 2-port low-power hub
>Bus 001 Device 004: ID 04b3:301b IBM Corp. SK-8815 Keyboard
>Bus 001 Device 005: ID 046d:c066 Logitech, Inc. G9x Laser Mouse
>Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub

I have also attached kernel config files.

I tried to find USB related patches but got lost in git logs. Hopefully
somebody more experienced can find the reason for this problem.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

