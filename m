Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B852466F3D
	for <lists+linux-usb@lfdr.de>; Fri,  3 Dec 2021 02:47:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232474AbhLCBvA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Dec 2021 20:51:00 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:50256 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbhLCBu7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Dec 2021 20:50:59 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 04E376291E
        for <linux-usb@vger.kernel.org>; Fri,  3 Dec 2021 01:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51334C53FD0
        for <linux-usb@vger.kernel.org>; Fri,  3 Dec 2021 01:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638496055;
        bh=Z9kvbTnUetQ2ncERL7xbCRgFh+Xjm9v80Mlm33ZNXhE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=qC2KxSDUO7MmCA+bopM50i7oUJGNSImmN+7kQoqJXW6RKdqRexzPWFfoyfGC51lnP
         0r1iUv8KibQ8FNixr2z8w+WRbdNbwU+fcEZOTIpHLHZ/LncGi9mviZfl/GeaBw/WQW
         wGuoVDPLRVDXhU12nplo0lc36IBNH77aOpAxOUl9hCvFfXb6jE14DqvRUmJ/sBmQBQ
         YYQPqJkmLmVItkDhF6djp8wEYf++ueh2SR9rX0zaxCzfuQQTVB78Cmw/RfkbGrAkyR
         CAFvPd7mnaFiqp70TwbemxMjbLdBSl2mjdwstKMvxZhWxTDjfYTnIt729Domp5WLlo
         A1JLTWw4nRBPQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 3411D60FC4; Fri,  3 Dec 2021 01:47:35 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209555] dwc2 driver stops working after sudden disconnect
Date:   Fri, 03 Dec 2021 01:47:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: remyvarma@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209555-208809-1qr5HGsTlI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209555-208809@https.bugzilla.kernel.org/>
References: <bug-209555-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D209555

--- Comment #30 from remyvarma@gmail.com ---
I see this:
[    8.469658] dwc2 ff580000.usb: Core Release: 3.10a (snpsid=3D4f54310a)
[    8.482710] dwc2 ff580000.usb: dwc2_core_reset()
[    8.488584] dwc2 ff580000.usb: Forcing mode to device
[    8.502210] dwc2 ff580000.usb: Waiting for device mode
[    8.507962] dwc2 ff580000.usb: Device mode set
[    8.512932] dwc2 ff580000.usb: Forcing mode to device
[    8.518577] dwc2 ff580000.usb: Waiting for device mode
[    8.518584] dwc2 ff580000.usb: Device mode set
[    8.518611] dwc2 ff580000.usb: NonPeriodic TXFIFO size: 16
[    8.518615] dwc2 ff580000.usb: RXFIFO size: 275
[    8.546968] dwc2 ff580000.usb: EPs: 10, dedicated fifos, 972 entries in
SPRAM
[    8.557497] dwc2 ff580000.usb: DCFG=3D0x08100000, DCTL=3D0x00000002,
DIEPMSK=3D00000000
[    8.569534] dwc2 ff580000.usb: GAHBCFG=3D0x00000000, GHWCFG1=3D0x00006664
[    8.576754] dwc2 ff580000.usb: GRXFSIZ=3D0x00000400, GNPTXFSIZ=3D0x00100=
400
[    8.584152] dwc2 ff580000.usb: DPTx[1] FSize=3D256, StAddr=3D0x00000410
[    8.589476] systemd[1]: Started Journal Service.
[    8.591155] dwc2 ff580000.usb: DPTx[2] FSize=3D256, StAddr=3D0x00000900
[    8.603313] dwc2 ff580000.usb: DPTx[3] FSize=3D256, StAddr=3D0x00000a00
[    8.610314] dwc2 ff580000.usb: DPTx[4] FSize=3D256, StAddr=3D0x00000b00
[    8.617312] dwc2 ff580000.usb: DPTx[5] FSize=3D256, StAddr=3D0x00000c00
[    8.624311] dwc2 ff580000.usb: DPTx[6] FSize=3D256, StAddr=3D0x00000d00
[    8.636845] dwc2 ff580000.usb: DPTx[7] FSize=3D0, StAddr=3D0x00000e00
[    8.643840] dwc2 ff580000.usb: DPTx[8] FSize=3D0, StAddr=3D0x00000f00
[    8.650652] dwc2 ff580000.usb: DPTx[9] FSize=3D256, StAddr=3D0x00000410

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
