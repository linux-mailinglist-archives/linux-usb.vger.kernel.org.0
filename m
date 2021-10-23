Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1BFE4385E7
	for <lists+linux-usb@lfdr.de>; Sun, 24 Oct 2021 01:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbhJWXVp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 Oct 2021 19:21:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:55864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230284AbhJWXVo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 23 Oct 2021 19:21:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0277860F12
        for <linux-usb@vger.kernel.org>; Sat, 23 Oct 2021 23:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635031165;
        bh=SuwWiJ8JyIoTC9DBIjAMAeNooKkrijFht9ftbD83W8o=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cIuq/5kqV+JSBR0KSfhDbsCfXG7ujuxD2Ydv3dxuPw51o+WqxEb1iVDjiE0yo5eHY
         uU9qcVdeIuQtWUMimWKU8++RseE9S4CJlY0s79AmpeipFkzNnd93aei81oQovU51gK
         7dqiUwsOmWQike/+40FBfM18i2X9hI1OD9bq2I9UoFmdL8HvejJwr9Km/CfWbuX5yP
         ztycUj6gl6dNuRTg/4XyNApioAvNYmuZsfDWgmzjtU1nNm7iGg2Eb6MV3zzqTvFosj
         x8y7jQBQxGvXlI3nIHYoLZNfLTeoAHwUZpAK1h+21jiSmwgjmhpx7Cl5VAzQVNvwzC
         D4t82Gd5D4hUQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id E9D3D60F4D; Sat, 23 Oct 2021 23:19:24 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214797] ehci-pci: unable to enumerate Sony NW-WS623 Device
Date:   Sat, 23 Oct 2021 23:19:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: Stefan.Lauterwasser@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214797-208809-iOim8dq9td@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214797-208809@https.bugzilla.kernel.org/>
References: <bug-214797-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214797

--- Comment #4 from Stefan.Lauterwasser@gmail.com ---
I am able to force "full-speed" instead of "high-speed"?

What is called "device number" here - it will be increased more often in ca=
se
of failure? Just to avoid USB "index"/"name" conflicts?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
