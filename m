Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD8530F835
	for <lists+linux-usb@lfdr.de>; Thu,  4 Feb 2021 17:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237171AbhBDQk7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Feb 2021 11:40:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:46392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237942AbhBDQ34 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 4 Feb 2021 11:29:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id E1BBE64F42
        for <linux-usb@vger.kernel.org>; Thu,  4 Feb 2021 16:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612456155;
        bh=Xcg9dX6mTY/dVTd/MjIDabE+jBfv6FbKxMVuoHS8920=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jnialAy3A9sEuURG8ykhIa2glplpexjkMlHH2FkYiOUptJDbtX71NgNZmvr936u17
         2KUmzQbZUYv8NXtPagw3kKB6lExzhYHEt3kPsTPoKNQ3kAdOUfHL01i8ZyGGrpg97m
         9zpys+y5Rw3ePW8R2FdiwoNCM/9syfod6UrKEKN8Bi1bYhLy3X975/0S4uirp9lmKb
         bro+pO/Lzmpg9dRZPN/i1qFyON82UFZkgRx3fVwlTw99wjNCHq/DyD1Ttk1z/dxOUR
         h2uoBp8y2s6yx66pGoVKjdbVxn+qak4JPl5v6gppwAFL46zyVrfgZleNLvHtQTdQKb
         UeGA7H6XuaeFg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id CA44665335; Thu,  4 Feb 2021 16:29:15 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 211143] HID: 258a:0001 SINO WEALTH USB KEYBOARD SCRLK/backlight
 button not work
Date:   Thu, 04 Feb 2021 16:29:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Input Devices
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: trivial
X-Bugzilla-Severity: normal
X-Bugzilla-Who: l0rdg3x@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211143-208809-4CcPVJesdo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211143-208809@https.bugzilla.kernel.org/>
References: <bug-211143-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211143

--- Comment #1 from Gennaro Cimmino (l0rdg3x@gmail.com) ---
if it can help,
this is the keyboard model: CM Storm Devastator
https://www.coolermaster.com/catalog/peripheral/keyboards/devastator/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
