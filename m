Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 984C53D4C25
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jul 2021 07:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbhGYFFI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Jul 2021 01:05:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:38202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229460AbhGYFFH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 25 Jul 2021 01:05:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 56FA8600D4
        for <linux-usb@vger.kernel.org>; Sun, 25 Jul 2021 05:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627191938;
        bh=dnPdjwoaI08A8ts++voYjlnkfGczAmjDD9GZ91E3wDQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=g8zQGyuDZNBrrJKSBHTdvr8RgBPQPiXN2Ts2lp4u29AItQMb97XcSuCn0e5JzxUWM
         zfschXn9hlZvyhaW3gUo+GYMJK6z16AA/1RjGCpKH0mdLjrvm8fYchXr9boSV9He2B
         xrWWrvU81r82KrmdxNJ/oQxFOgRlTWJOgHSLHlaP/d57mUwDuMtxu4Q7nMWZgq+Kow
         vuXbK/VebDoR+3Yji9vRGaICSQYt0txZXp6Y3p+uaBtlLlmtRvdU+Z81Bz2Kq1dpK0
         RSpavNeia/cxqFNRoYuzkuN5honhfsmXPIdpd6FxOztP2xk2imLWDcxRtyMXHMBeHM
         mtGIf2I+Buo1A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 4CEFB60E96; Sun, 25 Jul 2021 05:45:38 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209555] dwc2 driver stops working after sudden disconnect
Date:   Sun, 25 Jul 2021 05:45:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Minas.Harutyunyan@synopsys.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209555-208809-w127hdBmrK@https.bugzilla.kernel.org/>
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

--- Comment #7 from Minas Harutyunyan (Minas.Harutyunyan@synopsys.com) ---
Hi,

On 7/24/2021 8:42 PM, bugzilla-daemon@bugzilla.kernel.org wrote:
>
> https://urldefense.com/v3/__https://bugzilla.kernel.org/show_bug.cgi?id=
=3D209555__;!!A4F2R9G_pg!L1C5v0Y0uLaHYGYBeR8HcEuRxTDT44Q7Bw2YABG-ORqKdbDL0s=
ms340fBRmSSSH-Zo7r765Z$
>=20
> Yunhao Tian (t123yh@outlook.com) changed:
>=20
>             What    |Removed                     |Added
> -------------------------------------------------------------------------=
---
>                   CC|                            |t123yh@outlook.com
>=20
> --- Comment #6 from Yunhao Tian (t123yh@outlook.com) ---
> Hi,
>=20
> I'm using RK3308 Rock Pi S, and experiencing a similar issue (though not =
the
> same) on v5.14.0-rc2. The mentioned workaround doesn't work. The following
> testing is done with the workaround applied.

For 5.14-rc2 doesn't need to apply mentioned workaround because the=20
power issue related to 'rmmod dwc2' resolved.
>=20
> When the host is unplugged, the message buffer is bloated with the follow=
ing
> message repeatedly:
>=20
> # [   23.215674] dwc2 ff400000.usb: dwc2_flush_rx_fifo:  HANG! AHB Idle
> GRSCTL
> [   23.216448] configfs-gadget gadget: 220 Error!
> [   23.231677] dwc2 ff400000.usb: dwc2_flush_rx_fifo:  HANG! AHB Idle GRS=
CTL
> [   23.232382] configfs-gadget gadget: 220 Error!
> [   23.247524] dwc2 ff400000.usb: dwc2_flush_rx_fifo:  HANG! AHB Idle GRS=
CTL
> [   23.263000] dwc2 ff400000.usb: dwc2_flush_rx_fifo:  HANG! AHB Idle GRS=
CTL
> [   23.278459] dwc2 ff400000.usb: dwc2_flush_rx_fifo:  HANG! AHB Idle GRS=
CTL
>=20
> And if we plug the cable in again, the HANG message stops, followed by th=
ese
> messages:
>=20
> [   18.332489] dwc2 ff400000.usb: dwc2_hsotg_ep_stop_xfr: timeout
> GINTSTS.GOUTNAKEFF
> [   18.333378] dwc2 ff400000.usb: dwc2_hsotg_ep_stop_xfr: timeout
> DOEPCTL.EPDisable
> [   18.334265] dwc2 ff400000.usb: dwc2_hsotg_ep_stop_xfr: timeout
> GINTSTS.GOUTNAKEFF
>=20
> And then the kernel completely freezes, not able to even respond to a key
> stroke or network ping.
>=20
Could you please apply patch "[PATCH v2] usb: phy: Fix page fault from=20
usb_phy_uevent" from Artur Petrosyan and test again.


Thanks,
Minas

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
