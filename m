Return-Path: <linux-usb+bounces-9938-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 884CA8B74AF
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2024 13:42:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46A751F22689
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2024 11:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F69D13D89B;
	Tue, 30 Apr 2024 11:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LPkVRh8X"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59BE13D605
	for <linux-usb@vger.kernel.org>; Tue, 30 Apr 2024 11:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714477315; cv=none; b=Sklw2z+EWeBgSSxTuwoBrw+6JuBtkDjeh6nUhZBPlCikSLNENXPUA/wbkxfhK8gbM0YzA2I5WKdvSpZ8nJih2euyTnHfGjYQJ+ZFX9dGb4hOOvMfeN1d4D0CnrhPLr2Swxb8IxGGqOovARbHm6podCCULvvan9VirBzTesV+yYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714477315; c=relaxed/simple;
	bh=dVOONXZvt37iTd/a9PMhWY/woAqWDTJx6Qc9lwj/dHQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GgQdq/5OyRnKtG8tavTaHmFiSDaFNbBdwoYxmsCZlCsEeclQRWORx1c8HcZt0ICeHfvmd0v0oPqoNkv9Iphh/+uH2h1dcgyB6R6r/oi4aTWZAciYPbF2nUKbliu0tQuzPC2McqG1vd1Esfd3JCKCUEmCmZqEPKskh/LxQfKDWzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LPkVRh8X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47A2DC4AF19
	for <linux-usb@vger.kernel.org>; Tue, 30 Apr 2024 11:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714477315;
	bh=dVOONXZvt37iTd/a9PMhWY/woAqWDTJx6Qc9lwj/dHQ=;
	h=From:To:Subject:Date:From;
	b=LPkVRh8XDuhaJhGEBCHDZnR3pIqdk6uQTSlURaXJjbMIjzN6fvLspCICtFizOwKSK
	 gdZxNC+l8Ep8UV2gWoylsWejjpvEDxcF/a5MYrut0loVYvO8mA2LVzEovZgvv/3QEj
	 4/XerBcyi127jSAguglCv2e2WHPVjPW6H91fPd9QdqeA18OXcF3M4FMD1J0F7onfR6
	 HkxWiPJxn7w/9IkRmvHwhaudoKcSzfuzQYAQMc7e28nsiR4o/xCTBNDg54TzXPKjBk
	 Nu4T+W7zNuoy3yzFxASGkJQm2LFraz2wXF2DdB16vZkLlAqMRx4CsBbc8CdVbeGjv2
	 XOsKRjWlW2l0w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3980DC433DE; Tue, 30 Apr 2024 11:41:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218795] New: USB4 / Thunderbolt + AMD: unstable and slow link
 (many uncorrectable errors)
Date: Tue, 30 Apr 2024 11:41:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: guilhem@lettron.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-218795-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218795

            Bug ID: 218795
           Summary: USB4 / Thunderbolt + AMD: unstable and slow link (many
                    uncorrectable errors)
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: guilhem@lettron.fr
        Regression: No

Created attachment 306247
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306247&action=3Dedit
logs with thunderbolt debug

Context
laptop : Asus UM5302TA
CPU : AMD Ryzen 7 6800U
egpu case : Razer Core X Chroma, thunderbolt 3
GPU : nvidia + opendriver 550.78
Ubuntu 24.04, kernel 6.7 / 6.8 / 6.9

when plugging thunderbolt cable:
```
[...]
pci 0000:35:00.0: 2.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s =
PCIe
x1 link at 0000:00:04.1 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)
[...]
```

```
nvidia 0000:35:00.0: PCIe Bus Error: severity=3DUncorrectable (Non-Fatal),
type=3DTransaction Layer, (Requester ID)
nvidia 0000:35:00.0:   device [10de:2504] error status/mask=3D00100000/0000=
0000
nvidia 0000:35:00.0:    [20] UnsupReq               (First)
nvidia 0000:35:00.0: AER:   TLP Header: 40001001 0000000c ad08000c f7f7f7f7
```

I tried many cables (tb3, tb4, etc).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

