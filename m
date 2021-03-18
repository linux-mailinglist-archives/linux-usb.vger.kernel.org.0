Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6463404FE
	for <lists+linux-usb@lfdr.de>; Thu, 18 Mar 2021 12:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbhCRLzi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Mar 2021 07:55:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:38504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229792AbhCRLzI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 18 Mar 2021 07:55:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1910164F38
        for <linux-usb@vger.kernel.org>; Thu, 18 Mar 2021 11:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616068508;
        bh=gTmmAGdeDCaRgPmS9Fg8WPFsWa1MQ3gKD3utF9h4A88=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=X8L7lJuKd3v+dl8EqcTSok8hKy7F9myKB4p5ockjVn/H+T/Ri9Pj5qsAVTCqP7LsU
         HfgPpfaiwml6YEOaS9x64nxmyT/lFl77oDr2T7patgb0oNEJMYwmDqDkn6TrPGTaEp
         IkD8g8dkl6sf9D8kG3L8oyNWCyUBrz4gbFLKJmMcNy6g6AKVMnoXB9vd39mUsY1EV7
         TpjvdHNIw5EgR6blVeUUGsO9zDojolS9Mup1f3s4xtti7fZN6PULNDmYeCAI5EpDG3
         7WAB8NTrWYfbRHTJ3u2Vfay/ZZbisulrQtb6W73Kd0Tz+Z6fqGu2yk50L2PV6Z+xe8
         5lvqEyAog4FUw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 0F0E7653CB; Thu, 18 Mar 2021 11:55:08 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 207887] USB keyboard (and other devices) connected to Thinkpad
 Dock hangs after a while
Date:   Thu, 18 Mar 2021 11:55:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: catchall-kernelbug@blubbbla.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207887-208809-DsB8p57rse@https.bugzilla.kernel.org/>
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

--- Comment #7 from Johannes Wegener (catchall-kernelbug@blubbbla.de) ---
And and I forget to mention that I use a different Hub. This is the informa=
tion
in lsusb: Bus 003 Device 004: ID 1a40:0201 Terminus Technology Inc. FE 2.1
7-port Hub

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
