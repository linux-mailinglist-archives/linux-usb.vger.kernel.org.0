Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 680C73D1F50
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jul 2021 09:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbhGVHKc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Jul 2021 03:10:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:33824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230284AbhGVHKb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Jul 2021 03:10:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2383B60249
        for <linux-usb@vger.kernel.org>; Thu, 22 Jul 2021 07:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626940267;
        bh=qogvZo2NdofL1Rj1JlMKpXY1ouKb1vBPG8m/TchaFfI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=uzG3R8rnve7bsWlA28sXgAXFIRAT8eI9e/DhHt7al2CfkkNsrtnOlss5aFroPPVhp
         cBeFt7gB9TVQshztDo8Drkg0S+ybaNL/Rh8QkeZEt4cMwHNdKtfwHsjT6u43OVpKg2
         ax78pdcBLmTSyqs9wB5HpzaOpc1MuCOC8UJmEa9yiOP5/qQlQowpKX+B7N7+ZcAdYh
         6/DN/WcpalSvm9Kgh4aIMNLEbr3jor0MoDc/jSi+KSTdz3fM+hWP2lfXT57rIZ2kGS
         Aa+gEIRZS+zME1MdgkCuUFfC8528US0vqsUhGcTQ6+VMKonLS/zgv8SeIRhvLytwtT
         Z03XDsMt1QRuQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 16F8A61284; Thu, 22 Jul 2021 07:51:07 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213771] ch341 USB-Serial converter receives but does not send
Date:   Thu, 22 Jul 2021 07:51:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: johan@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213771-208809-Ryhs1x1mMf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213771-208809@https.bugzilla.kernel.org/>
References: <bug-213771-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213771

--- Comment #4 from Johan Hovold (johan@kernel.org) ---
On Wed, Jul 21, 2021 at 07:00:08PM +0000, bugzilla-daemon@bugzilla.kernel.o=
rg
wrote:

> On Ubuntu, Shorting pins 2 and 3 of DB9 connector does not give back
> characters
> sent (no echo), nor typed strings are sent to other RS232 devices, despit=
e of
> communication settings. Characters from remote devices are correctly
> received.
> Using a null modem cable to other RS232 terminal shows that the local
> terminal
> receives, but does not transmit.

What happens if you also short RTS and CTS?

And are you able to change the baud rate at all?

> Kernel:
> Linux host 5.4.0-66-generic #74-Ubuntu SMP Wed Jan 27 22:54:38 UTC 2021
> x86_64
> x86_64 x86_64 GNU/Linux

Please confirm using a recent mainline kernel (e.g. 5.13).

> Device ID:
> ID 4348:5523 WinChipHead USB->RS 232 adapter with Prolifec PL 2303 chipset

This looks strange. I don't think these devices are based on
(misspelled) Prolific PL2303 chips.

This is possibly some kind of counterfeit device. You could try using
the pl2303 driver.

Please also post the output of lsusb -v.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
