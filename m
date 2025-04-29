Return-Path: <linux-usb+bounces-23553-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA58AA0EBE
	for <lists+linux-usb@lfdr.de>; Tue, 29 Apr 2025 16:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 461A53A5319
	for <lists+linux-usb@lfdr.de>; Tue, 29 Apr 2025 14:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6368C2D3205;
	Tue, 29 Apr 2025 14:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jfqhmNo3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DED10942
	for <linux-usb@vger.kernel.org>; Tue, 29 Apr 2025 14:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745936889; cv=none; b=khSdkGcKXfy3KpA/pvTjTNHlAwaR/FQvKwS1FHpxhlOnI3Eu8Vfd548Pg87c72VLHCedgkYFv1ILbZimSPt3IWEfv3IVKPh9I8o2o0uG0ujDlqBBPd20vHMjwbQ5XUBOszY2+S5QJ91lE68Z+3hIx1iZcJA/XaZoRslLV6r1kdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745936889; c=relaxed/simple;
	bh=43Sgv+Zpz2ABjvncVJDGUYwbdYoQHbhhDnoWqcL00l8=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nxA7ww+GrRnyBiDZ7wyv68YRz+1YM2t6wAg6nhVxyDn00xt5Wk59Jg7FYR7P1D9XdtCkNFmL7KulsT3sR2uUm4V8wCPWK2k/L74dCGo5QjvwE+ZV2vbAO27+Yu2tWHgFAjtVaZEPesru4PLPE/V7YMl1N8iD9DLqlz5BGKhs76w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jfqhmNo3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C77EC4CEE9
	for <linux-usb@vger.kernel.org>; Tue, 29 Apr 2025 14:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745936888;
	bh=43Sgv+Zpz2ABjvncVJDGUYwbdYoQHbhhDnoWqcL00l8=;
	h=From:To:Subject:Date:From;
	b=jfqhmNo3ry6M2OsTqtbd+6A6CZajIF6QfWIvToGbr9/md8WcXOwuc9g8+0dPL+cEf
	 YUaiZyiaaTbj3d9P4/DWgF7Z1aQsgvWUh4MG4uSiLsRl8bcoWjm6cKCAncHzYoFpF8
	 Ja3EzZL9PkBZrt1UUZoSqbz5SCIUgMGry2Od29+ay3be5US7AdVtz+6QCNaDKO8nx0
	 WqeK+S29luKRZKlFioc3IkmGz2xWJe8W9HGqj8YwZ8QGheK+KXR1fmKyMKeZO5nDyM
	 G1hqjvIi8u+FbV5ao2nko2DBFNISWUL4f3a/0JubN+Bl+zMhNOXNY582E1AdMwt1On
	 MTLt15Sm5cQmQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 40D00C433E1; Tue, 29 Apr 2025 14:28:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] New: [6.13.9] regression USB controller dies
Date: Tue, 29 Apr 2025 14:28:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cwunder@gnome.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

            Bug ID: 220069
           Summary: [6.13.9] regression USB controller dies
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: cwunder@gnome.org
        Regression: No

This seems, at least to me, a regression after the apparent fix on 6.13.7; =
I've
tested on 6.13.9 and 6.14.3, and 6.13.7 seems to be working fine to me.

At random times (whether idle or with actual active usage), there is a high
chance that any of the xHCI controllers will fail.

```
Apr 28 =E2=80=876:54:28 PM kernel: usb 7-11: USB disconnect, device number =
11
Apr 28 =E2=80=876:54:28 PM kernel: usb 7-7: USB disconnect, device number 6
Apr 28 =E2=80=876:54:28 PM kernel: usb 7-5.2: USB disconnect, device number=
 9
Apr 28 =E2=80=876:54:28 PM kernel: usb 7-5: USB disconnect, device number 4
Apr 28 =E2=80=876:54:28 PM kernel: usb 7-3.5: USB disconnect, device number=
 15
Apr 28 =E2=80=876:54:28 PM kernel: usb 7-3.4: USB disconnect, device number=
 14
Apr 28 =E2=80=876:54:28 PM kernel: usb 7-3.3: USB disconnect, device number=
 12
Apr 28 =E2=80=876:54:28 PM kernel: usb 8-5: USB disconnect, device number 4
Apr 28 =E2=80=876:54:28 PM kernel: usb 8-2: USB disconnect, device number 2
Apr 28 =E2=80=876:54:28 PM kernel: usb 8-3.4: USB disconnect, device number=
 5
Apr 28 =E2=80=876:54:28 PM kernel: usb 8-3: USB disconnect, device number 3
Apr 28 =E2=80=876:54:28 PM kernel: usb 7-3.1: USB disconnect, device number=
 7
Apr 28 =E2=80=876:54:28 PM kernel: usb 7-3: USB disconnect, device number 3
Apr 28 =E2=80=876:54:28 PM kernel: usb 7-2.5: USB disconnect, device number=
 8
Apr 28 =E2=80=876:54:28 PM kernel: usb 7-2.3.2: USB disconnect, device numb=
er 13
Apr 28 =E2=80=876:54:28 PM kernel: usb 7-2.3.1: USB disconnect, device numb=
er 10
Apr 28 =E2=80=876:54:28 PM kernel: usb 7-2.3: USB disconnect, device number=
 5
Apr 28 =E2=80=876:54:28 PM kernel: usb 7-2: USB disconnect, device number 2
Apr 28 =E2=80=876:51:25 PM kernel: usb 7-3.4.2: USB disconnect, device numb=
er 18
Apr 28 11:23:44 AM kernel: usb 7-3.4.2: USB disconnect, device number 17
Apr 27 =E2=80=871:06:10 AM kernel: usb 7-3.4.2: USB disconnect, device numb=
er 16
```

Running (replace `??` for the actual guid)

```
echo -n "0000:??:00.0" | sudo tee /sys/bus/pci/drivers/xhci_hcd/unbind && e=
cho
-n "0000:??:00.0" | sudo tee /sys/bus/pci/drivers/xhci_hcd/bind
```

Reinitialises the controller.

----


uname:


```
6.13.9-103.bazzite.fc42.x86_64
```

rpm-ostree:

```
=E2=97=8F ostree-image-signed:docker://ghcr.io/ublue-os/bazzite:stable
                   Digest:
sha256:1a7ae28b95fde42b976cc9aa159219c0aaaa0611f7416f4b3b30284e292b0875
                  Version: 42.20250417 (2025-04-17T07:35:37Z)
          LayeredPackages: android-tools
            LocalPackages: 1password-8.10.70-1.x86_64
sublime-text-4192-1.x86_64
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

