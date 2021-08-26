Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4C8E3F8B5A
	for <lists+linux-usb@lfdr.de>; Thu, 26 Aug 2021 17:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242926AbhHZPxG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Aug 2021 11:53:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:39686 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230203AbhHZPxG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Aug 2021 11:53:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0132F6103A
        for <linux-usb@vger.kernel.org>; Thu, 26 Aug 2021 15:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629993139;
        bh=Kc56jrV6zCLyqVyfoaIUAcboWJ21WQxkiuG6R0NUBK8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fFjTgC/IDKSzh2pfrv8UvSieoOTCgAXyU76xuhmdMTDTuR2xaEOadcgge7ehAR1aM
         kPeJKoWJuOtIQBXwJx5zhU0Uoj6RmAEm6xvi7SJo7fv9Rpq0L2U0MvkpxVP9OEZh3R
         ej3+mLQJ7eFrNmb6wwwwOwmRBC0JfEODSwVtBqP47rqjP6szYFzg72VFN47BgAtnPx
         D6Fh6ST3Kog9dqJqcSN1ZwQpM8yxe4C4OpHGpYHd1JdYqYaggoTxS4ReZ7Thb+56ho
         YEXiVOavfJX6FEzQLO1vHfgx4F59oaBx9vjhpShwaRVI1X/QV2diaYdSp4hWmPmEz+
         HqqIVDm5xc27Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id EA20960E18; Thu, 26 Aug 2021 15:52:18 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 207887] USB keyboard (and other devices) connected to Thinkpad
 Dock hangs after a while
Date:   Thu, 26 Aug 2021 15:52:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207887-208809-iARJThQLaA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207887-208809@https.bugzilla.kernel.org/>
References: <bug-207887-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D207887

--- Comment #16 from Alan Stern (stern@rowland.harvard.edu) ---
This looks like a problem with the xHCI host controller or driver.  You can=
 do
two things to help debug it:

Turn on dynamic debugging for the xhci-hcd driver:

   echo 'module xhci_hcd =3Dp' >/sys/kernel/debug/dynamic_debug/control

Collect a usbmon trace:

   cat /sys/kernel/debug/usb/usbmon/3u >mon3.txt &

Kill the cat process after an error occurs.  Let's see what the debugging
messages and usbmon trace reveal.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
