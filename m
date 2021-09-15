Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB7540CFBB
	for <lists+linux-usb@lfdr.de>; Thu, 16 Sep 2021 00:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232674AbhIOWsE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Sep 2021 18:48:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:37238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232465AbhIOWsD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 Sep 2021 18:48:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 188CB60FED
        for <linux-usb@vger.kernel.org>; Wed, 15 Sep 2021 22:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631746004;
        bh=QYr3DTXYp01DayCO6VaEBBBM8aYosWOA4XSHOtkJXjg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=RM2S7yZ/4e1wSgKGJdoyR4PE0Qv4dpwdvP73LKKUrirDMt9NJKUkvWkX6ABQiev+1
         PfORYF3MXSv8tepiw4erpRICxdXulpfhc2/C4FMp5LZyyd4kGhVBNffr8HUJyvoy54
         3MiLON+Zzb6vIsWlf26C96ElWf9d7XWX51Xx1z/SQLv+zVYwDhMC7mvWw+OaemN+oL
         C7negJQbFh/ymVanBAchvygHFJcPc6CaNx61EOj6x2haqr8r0Qt2B1r4Nv53CjYvI7
         pL/Kd32FnffHsMSm0P5PHCf63umvUZWZw/ABeyouUHxtWv+Jy/OOxokvNWc5uJuWtG
         9zQVsyy94HkXw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 07D6F61001; Wed, 15 Sep 2021 22:46:44 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213839] XHCI 7 port usb hub does not work correctly
Date:   Wed, 15 Sep 2021 22:46:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stulluk@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213839-208809-BGA4wNFhpA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213839-208809@https.bugzilla.kernel.org/>
References: <bug-213839-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213839

ST (stulluk@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |stulluk@gmail.com

--- Comment #4 from ST (stulluk@gmail.com) ---
I have exactly the same device, it is sold as USB3.0, but I observe same
behaviour ( detected as USB2.0) on all my computers. Tomorrow I will find a
chance to try it on a Windows machine, and report back.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
