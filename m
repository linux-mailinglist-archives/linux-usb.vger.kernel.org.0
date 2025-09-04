Return-Path: <linux-usb+bounces-27532-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 413A5B43005
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 04:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8F963B5C0F
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 02:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B39B81F8691;
	Thu,  4 Sep 2025 02:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CopUoU4V"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA983A8F7
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 02:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756954170; cv=none; b=KJMsrslOBvg3IAip2dw8YQCG0NBRI1IRsv1s0hgHes0U0eEfUJ3f6VQCokGoadXjjD9Zg0JGwltw59KE/nQ4VorxKf2fvRF/AkV4b+Ww8xZqg7xxYs1HAK2sG/FM8mQ+qe6DrTGCGw8fFW5dDaKvW7WC033MoU4UMjo/bzM6ndA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756954170; c=relaxed/simple;
	bh=91vF5Q4Mc/gIa06QBPUs7ktKs/z/M3Yj+odxnokMjG0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iP9A8AfnkynuPdgt3mtEFMRkZx6azSnD0AbGPWMFVOBYHbEejWCRlneuox6hFJF1226QZkjklv4uNtU0WDTf8lP4xr2vS1kG4HMEvl7v18E9dUylkbAqMGKbjeWQAb9PzldyDf56/HgcB1xT5nF2kDnPfO3HbA3Iy+jSWIXNRWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CopUoU4V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2F30C4CEF0
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 02:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756954169;
	bh=91vF5Q4Mc/gIa06QBPUs7ktKs/z/M3Yj+odxnokMjG0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CopUoU4VrOPZwtejpyJB8VWHnTtFTDC9103KYkaH0cPMqqNOHe+96RsE+0o3Xl2BT
	 gLpRbzhc2rnP/SM+v/DZGiGpiZOdr91VX7aIZiTHoML3FsGKUs/MK6n/iWJJAJLnza
	 plN2tqZpIazQPtplJdSNWRply0bm4kpGhMfacAElg3v114Cwfhk7Cz5/sU6ardUIdo
	 O0RvC6YM1HODDIRtom8on5glU/Gfb44rfUBYmniuUP2GZ2jrnNYu+ZQ8CgGoWf7nPZ
	 xIggoAuPy6OQwb56F1DG2uxnS+w3dl+axlspzfIagwlpDmwf74v/0sBFxQ1qxKvNPn
	 +zjXPW2DXxcAg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 93788C4160E; Thu,  4 Sep 2025 02:49:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Thu, 04 Sep 2025 02:49:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220491-208809-RQWC5YuSF6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #37 from Alan Stern (stern@rowland.harvard.edu) ---
The usbmon trace in comment #35 does contain a disconnect/reconnect.  And it
did propagate up to the usbcore level, which is where the usb-persist mecha=
nism
lives.  usb-persist is what keeps it from going any farther, in particular,
from showing up in the dmesg log.

In case you're curious, in that trace:

ffff9bb60d581f00 127168165 S Ci:3:001:0 s a3 00 0000 0004 0004 4 <
ffff9bb60d581f00 127168171 C Ci:3:001:0 0 4 =3D 03020100
ffff9bb60d581f00 127168174 S Co:3:001:0 s 23 01 0010 0004 0000 0
ffff9bb60d581f00 127168181 C Co:3:001:0 0 0

The first two lines are Get-Port-Status for port 4 (the port the card reade=
r is
plugged into) near the start of the resume, with the returned status showin=
g a
connect-change.  The next two lines are a command to clear the port's
connect-change status bit.  The fact that these lines are present is proof =
that
usbcore was aware of the disconnection, because usbcore is the component th=
at
ordered the status bit to be cleared.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

