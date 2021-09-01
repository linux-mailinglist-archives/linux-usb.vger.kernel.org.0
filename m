Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB863FDD7B
	for <lists+linux-usb@lfdr.de>; Wed,  1 Sep 2021 15:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244344AbhIANxU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Sep 2021 09:53:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:45118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242394AbhIANxU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Sep 2021 09:53:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 42DAC61026
        for <linux-usb@vger.kernel.org>; Wed,  1 Sep 2021 13:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630504343;
        bh=4kCm8ZDDlQPXxB0Gfp/gfYGB9LIy0wfKfYolbP6itb0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=orLtjw2w1sasMPmJWTHG6GPmtVhQ4AlYl2HUGW1Hx+Vzeh4XMj/FdRYBeAhgi0Lgd
         TIq9MgAZe9xjHQHOWPbHVZ+L+jIg8ly4Mod/ZV8C0rah+1eeM31FD6HOwWg+6ceKJE
         WtWBt42VJgHAbKW/xfaDHnJRi9z3orZe81IlHVemKEmH4s5ZI2YqYA4xQgJV1s0bXD
         sELZPw0PCRbrOxdjweF9VAEXrjm5w5F3y3mYov/ZP257nNMtqTWnKuO0lR5cp6X0X4
         X4fu53zmHp1GOMkryxAm38d96u/5MJxXHWGjkVbA6wS+04BOOG1QyGJrNyuf8NiVd9
         DpdqkAIqc72dw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 3FA94610CD; Wed,  1 Sep 2021 13:52:23 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Wed, 01 Sep 2021 13:52:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wse@tuxedocomputers.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214259-208809-bPmVcv7vDy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214259-208809@https.bugzilla.kernel.org/>
References: <bug-214259-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214259

--- Comment #9 from wse@tuxedocomputers.com ---
Created attachment 298581
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298581&action=3Dedit
dmsg after connecting tb dock (5.13.12)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
