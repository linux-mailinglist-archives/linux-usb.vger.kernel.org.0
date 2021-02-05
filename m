Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13C45310F9E
	for <lists+linux-usb@lfdr.de>; Fri,  5 Feb 2021 19:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233642AbhBEQ3c (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Feb 2021 11:29:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:42420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232803AbhBEQ0u (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Feb 2021 11:26:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 44C2464E16
        for <linux-usb@vger.kernel.org>; Fri,  5 Feb 2021 18:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612548511;
        bh=vwJa11tg28R1LlPTjyW3JgJlMaClCl6kIrQmBpQDlzQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=kqzZJPPbSRNTw8F/3ZDtK9NmKzSEzbpq37B+sT1hC6OXsl1Fr0wKL9ndtaCSeWu3c
         mY/tPNuSd7KQwQBbUHW9PIqKh8FY07hgFPEEL2ZSVB1e0YeNmCf3cAPxPosRiJQ45b
         gqQFjQKqzqd7szCUD8UuDfDu79i4dqiNNtoYYDBeJpyE7+cdbBUwBQcVN6RWd/NokD
         ctJImBrj+VqI9Z928m9iz8uOOppNt574ghMkIovBAVQssj+EJd5z/Jkql/SysYxREb
         O0bxheYwIMoGmJqOR1xKXyJFkRmdkedRBMSg4fK1GYveJOI5wknanrM5OOKX+LUMSp
         MsF2q1PypzUjw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 2CB696533B; Fri,  5 Feb 2021 18:08:31 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210801] TopSeed Technology Corp. eHome Infrared Transceiver
 spams log with Error: urb status = -71
Date:   Fri, 05 Feb 2021 18:08:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hpj@urpla.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: IMPLEMENTED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-210801-208809-ZEJLR6ZmxC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210801-208809@https.bugzilla.kernel.org/>
References: <bug-210801-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210801

Hans-Peter Jansen (hpj@urpla.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |IMPLEMENTED

--- Comment #10 from Hans-Peter Jansen (hpj@urpla.net) ---
What should I say, with 5.10.13, all is well again!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
