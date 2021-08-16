Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B587B3ECF5A
	for <lists+linux-usb@lfdr.de>; Mon, 16 Aug 2021 09:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233936AbhHPHaE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Aug 2021 03:30:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:59028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233540AbhHPHaB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 16 Aug 2021 03:30:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2792861AA3
        for <linux-usb@vger.kernel.org>; Mon, 16 Aug 2021 07:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629098970;
        bh=/ZRa+MXlKnFsCFyMZPoeF0xIe/jEjSujk9O5n22dU8Q=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dnrY/bEBsb+aUjjRnM9Uj4ivEqZNHA8uyTLQkTp2ozFv+UmA46lm6rYzUkt361TVk
         /c/b71apm12ybb0e9R1T7JUq0if6zUjtmor0azPSoN26UhVcZJmCYrINlppIFR2aho
         yFaLs6nThVBoSHblROhRKUPhe5nKz1Sh9MAF33DazvxajWBdbvoMGxsJX/zJtY0/mO
         f/edYj9uQSZFQiL+u4hZ7rnUTFGXI2gAhy+SWqsXzrxxqj+UYEg0+Ru1llRw6/5VX0
         7z7zLajNSDYsp9KJRXEZXkJbs5+c4J/D6ws8Rg40MdTd6UKGI7F9+Xuwj/j3ZvLGQ8
         Ce0IGTB8lNULQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 15AF560FEC; Mon, 16 Aug 2021 07:29:30 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214021] The USB devices fail to be detected during boot
Date:   Mon, 16 Aug 2021 07:29:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: chunfeng.yun@mediatek.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214021-208809-NP5h6WAmDN@https.bugzilla.kernel.org/>
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

Chunfeng Yun (chunfeng.yun@mediatek.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |chunfeng.yun@mediatek.com

--- Comment #6 from Chunfeng Yun (chunfeng.yun@mediatek.com) ---
If the controller doesn't work, there will be log "xHCI dying or halted, ca=
n't
queue_command"? printed in queue_command()

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
