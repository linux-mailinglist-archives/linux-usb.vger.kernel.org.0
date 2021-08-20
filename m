Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE9743F2B46
	for <lists+linux-usb@lfdr.de>; Fri, 20 Aug 2021 13:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240043AbhHTLeX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Aug 2021 07:34:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:47562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240027AbhHTLeX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 20 Aug 2021 07:34:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id ADEAD61053
        for <linux-usb@vger.kernel.org>; Fri, 20 Aug 2021 11:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629459225;
        bh=X9UsktDgzlyngjLS8C1dPuZR6gef5Pm4R34qvEmgIfg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=PQsH7CTs5pxidGqUTCs/AWWlhCyRX0RFNZzH5zDkEkzDRygwMu4gKZa1aAqPFY+g8
         cvrRj7qjK5Q//ooYCGAeIAqAmgfS3nUnyusZ7r+GSqJgOQqMLuCr2fNXPeUI5mySzI
         Y6U7Wtn38bEecpAEyNxqLbP7Gf1cfn7TikUlxCSFIE2jHZ2/vR6x1X8yxVic/c1nED
         R8aSR65u8UUvRvnzriU36vaQajOAv973/0f25SV/mqIU40ZCHS3/sJ1LxjVTT+fTPW
         zc4K+C0py8KbQviREkmO8vS5Jvzpv4CVJTr0DahBbWyFudvbUYuHMMSTHzM5C0Xki9
         celWeyKKSpgZQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id A944A60ED3; Fri, 20 Aug 2021 11:33:45 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214021] The USB devices fail to be detected during boot
Date:   Fri, 20 Aug 2021 11:33:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214021-208809-DQJMqSnMpY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214021-208809@https.bugzilla.kernel.org/>
References: <bug-214021-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214021

Mathias Nyman (mathias.nyman@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mathias.nyman@linux.intel.c
                   |                            |om

--- Comment #9 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Kishon reported this same issue.
xhci_alloc_dev()->xhci_queue_slot_control()->queue_command() fails because
xhci->xhc_state still had a  XHCI_STATE_HALTED bit set.

This is possible because the xhci driver will first add the high-speed
hcd/roothub, then the super-speed hcd/roothub.
xHC controller is started and xhci->xhc_state cleared only when the second,
super-speed hcd is added.

So if we are unlucky the first hs hcd will create the hs roothub device,=20
hub driver binds to it, hub inits, and hub thread start enumerating devies
before xHC is running.

xHC port registers can be read when xHC is powered, before it's is running,=
 so
hub thread is able to see the connected devices early.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
