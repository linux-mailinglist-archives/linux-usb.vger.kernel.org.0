Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5C8364D05
	for <lists+linux-usb@lfdr.de>; Mon, 19 Apr 2021 23:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbhDSV0g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Apr 2021 17:26:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:39400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229714AbhDSV0e (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 19 Apr 2021 17:26:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D1E5261369
        for <linux-usb@vger.kernel.org>; Mon, 19 Apr 2021 21:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618867563;
        bh=b1rKpLN/zS1HNoMqgHK1pEAUz7XZjQrn8VrolvGLr4g=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=tL6NOiKiCBeHfFBADaFFXZ4W5RXG4+EcKsZ4mazSEYBr1plJ3TGC1xDNN5bLWJuXs
         +AF9id4xTS6GUjGGVo/KzXgqzeKbWKFyyATwWpTpiOLHCajx6UFdCvN9fNqZ4R1FsJ
         dNkNvcSrTv2dx8AoIqX00MIB4AUeTUxj+Ozq5eoRWaPqC+X4NWxOVp+ht3ykYb2pj1
         2/+por1XMV9PES/BA4wbOTYqvs94WK/3YNyptEly2EA/PVggNbDlqLmJMhDa4B6CCY
         RE6e1YoA7HRmhh4lRIoH2hVLZ2oqCeYER26Zg8P/MuyBXBxUeRMyTDLGjpi3Wpn484
         8AjnvzLZiRH/Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id BA502610D1; Mon, 19 Apr 2021 21:26:03 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212725] USB CDC ACM device stop working
Date:   Mon, 19 Apr 2021 21:26:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: stefan@agner.ch
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212725-208809-ZGFqTimMVQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212725-208809@https.bugzilla.kernel.org/>
References: <bug-212725-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212725

--- Comment #1 from Stefan Agner (stefan@agner.ch) ---
I went back and installed some older LTS kernel I had at hand. It seems that
5.10.26 was still working and 5.10.29 is broken. I don't have kernels at ha=
nd
inbetween, but hopefully this narrows it down already sufficently.

This is on a AMD Ryzen 9 3900X platform using a AMD X570 motherboard. The U=
SB
2.0 devices are connected through USB 3.0 hub, but also connecting them
directly to the root port seems to exhibit the issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
