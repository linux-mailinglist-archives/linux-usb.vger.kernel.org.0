Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B87F3D48A8
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jul 2021 18:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbhGXQCM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Jul 2021 12:02:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:47084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229461AbhGXQCL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 24 Jul 2021 12:02:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6C00E60E0C
        for <linux-usb@vger.kernel.org>; Sat, 24 Jul 2021 16:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627144963;
        bh=JhkGsxdL9Odpzv6k5g4iPzevz4fsj5H0vXBN7gA67eo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=QQEmwC0LdXIyPrCCVdCuqjT4cYrlZQpKShYQN4SWiOIDie6I/b98k6VdEUuiANok2
         sD+bF78CMwI/+vZPFV8h0Wuuw05YL//Z9xai5pz630wEiqtDFgebTOAyXFnxx+PKOZ
         qApN6biGHa4Y5Mb8dH6k05rSYPOjj8vvRbjFpegIheivb8SxYbjd0/v/sK6r6RZ8lG
         rbtLzYAMCjZoXVeI4LidC5JqoLGieSI3CbIqFGbeZzULqxi7XUwndS4MgCjXCUfuke
         0TuPQyKTDvCaPBEr0Fk4VlLgWfWdLeNOdqqWddzY0G1h3j8KSteWAM1hJLSXFNKIOb
         jaIEE7Ia4EZWA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 61FFF60E4F; Sat, 24 Jul 2021 16:42:43 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209555] dwc2 driver stops working after sudden disconnect
Date:   Sat, 24 Jul 2021 16:42:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t123yh@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-209555-208809-3WiVPMqWX9@https.bugzilla.kernel.org/>
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

Yunhao Tian (t123yh@outlook.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |t123yh@outlook.com

--- Comment #6 from Yunhao Tian (t123yh@outlook.com) ---
Hi,

I'm using RK3308 Rock Pi S, and experiencing a similar issue (though not the
same) on v5.14.0-rc2. The mentioned workaround doesn't work. The following
testing is done with the workaround applied.

When the host is unplugged, the message buffer is bloated with the following
message repeatedly:

# [   23.215674] dwc2 ff400000.usb: dwc2_flush_rx_fifo:  HANG! AHB Idle GRS=
CTL
[   23.216448] configfs-gadget gadget: 220 Error!
[   23.231677] dwc2 ff400000.usb: dwc2_flush_rx_fifo:  HANG! AHB Idle GRSCTL
[   23.232382] configfs-gadget gadget: 220 Error!
[   23.247524] dwc2 ff400000.usb: dwc2_flush_rx_fifo:  HANG! AHB Idle GRSCTL
[   23.263000] dwc2 ff400000.usb: dwc2_flush_rx_fifo:  HANG! AHB Idle GRSCTL
[   23.278459] dwc2 ff400000.usb: dwc2_flush_rx_fifo:  HANG! AHB Idle GRSCTL

And if we plug the cable in again, the HANG message stops, followed by these
messages:

[   18.332489] dwc2 ff400000.usb: dwc2_hsotg_ep_stop_xfr: timeout
GINTSTS.GOUTNAKEFF
[   18.333378] dwc2 ff400000.usb: dwc2_hsotg_ep_stop_xfr: timeout
DOEPCTL.EPDisable
[   18.334265] dwc2 ff400000.usb: dwc2_hsotg_ep_stop_xfr: timeout
GINTSTS.GOUTNAKEFF

And then the kernel completely freezes, not able to even respond to a key
stroke or network ping.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
