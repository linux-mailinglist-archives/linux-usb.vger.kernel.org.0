Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2043F3FA13B
	for <lists+linux-usb@lfdr.de>; Fri, 27 Aug 2021 23:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232010AbhH0Vm5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Aug 2021 17:42:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:60326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231696AbhH0Vm5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Aug 2021 17:42:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id EE14D60FD9
        for <linux-usb@vger.kernel.org>; Fri, 27 Aug 2021 21:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630100528;
        bh=5Cae24qZt2N331JF4F+7DWdTesJYJtXjN57xfoWrlbo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Ok9lItOSDQZ2fnj2Zk/ivqLqfqMDFNBAVahP0n7un5pvxJuLMi045ow3Q04i2SxfA
         ort9YVVN0cO9bXcGABr6gUzzz8UGtCCWUtYk4H+yAW7Tezwz4qRU5KdLgx7HqZ4z6w
         E6PVIFcEd4XuJNpK6k3KLyiDyqsZksX2R8uHI9hV3MF3+tURsiW1Al6n/qfjM3pIFV
         gfd7BwhX9DRPK09JVrWcclkaMUWyl9H+eh429EZ51Wy0VmdIYDUMBdFl8zsLeIsFmX
         no/tHQ4BW5blAEYQMxW8yGrbhvtSrUcCFi01oDxFM1dyByIJIz97QvhVZpWs4gNvRb
         rWOAZFZoAbVAg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id D802960EBD; Fri, 27 Aug 2021 21:42:07 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214173] Built-in Renesas uPD720202 fails to initialize on
 Thinkpad T14 Gen 1 AMD
Date:   Fri, 27 Aug 2021 21:42:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: milan.plzik@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214173-208809-N9RscArnK6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214173-208809@https.bugzilla.kernel.org/>
References: <bug-214173-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214173

--- Comment #1 from Milan Plzik (milan.plzik@gmail.com) ---
After doing some more testing, it turns out that even the dual-boot windows
wasn't able to use the USB controller correctly -- apparently there was a
damage to the EEPROM of the USB controller (first 0x84 bytes of the firmware
were followed by zeroes). Using a [firmware upload
tool](https://github.com/markusj/upd72020x-load) I was able to test and
re-upload correct firmware.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
