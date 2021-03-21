Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1AB34331C
	for <lists+linux-usb@lfdr.de>; Sun, 21 Mar 2021 16:09:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbhCUPIw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Mar 2021 11:08:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:55614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229784AbhCUPI0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 21 Mar 2021 11:08:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 569746194C
        for <linux-usb@vger.kernel.org>; Sun, 21 Mar 2021 15:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616339306;
        bh=B8yeW8BJEePeTemUR0TW0nwxcuVJFXWguE+W17rdzRw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Q1m/6+v2IMnejsN+7LL1ctNyVrOLHSIUWSc25r3vfmGThGcy/mkFfQ/eWLfUuWxIh
         yPCp2E9PRNIUcyYOhfFgNlTFuXav11oENSjhpzivsg8k5KXUrVDV/klYzBcyNTr7b4
         NQW0MT75/QkibDDBnOt1i19XYdH6jcIzQSzb5QyIhIngMdFYZvMhRsX72L5x2KGijf
         kLMAW1uMPJiFj1oECsKkPtr2Y+JVHCXKAr+9CEmP2nkdqYv9yIVzHo4KFK8uYuJUNL
         o71Uh4Z8eSDKpLFhqoynGCxCfRDm8tmhZ9pdpYwzbh9J1Kc0wPYM1r2U8zb76Ro8c6
         yu222OAWHEFKg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 50E6962A3C; Sun, 21 Mar 2021 15:08:26 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209469] [bisected] usb_modeswitch is broken on Linux 5.9, at
 least with Snapdragon X12 LTE modem
Date:   Sun, 21 Mar 2021 15:08:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: rui.zhang@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc component assigned_to product
Message-ID: <bug-209469-208809-ps97WBwodY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209469-208809@https.bugzilla.kernel.org/>
References: <bug-209469-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D209469

Zhang Rui (rui.zhang@intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |rui.zhang@intel.com
          Component|Run-Time-PM                 |USB
           Assignee|rjw@rjwysocki.net           |drivers_usb@kernel-bugs.ker
                   |                            |nel.org
            Product|Power Management            |Drivers

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
