Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0856E381A3B
	for <lists+linux-usb@lfdr.de>; Sat, 15 May 2021 19:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233030AbhEORpv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 May 2021 13:45:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:40430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231480AbhEORpu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 15 May 2021 13:45:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1A39B610A0
        for <linux-usb@vger.kernel.org>; Sat, 15 May 2021 17:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621100677;
        bh=E1y9T3bdIO5oXZub1qYMmSFffLwBufGLkVlmntDL/Q4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=kCNPJFYcU8PshuIjlwmIwCEiK+sMlzsiEEyar0BG2ha1AN48wOs8bKkuKzPldQuBl
         Ziu7zXEYBDdJWezrvbShBvrWiauz15Y6hq18Vug9WnkOyQq4suQLT5wAA4BzPUwVyf
         8NC+GgJFjTVX93F1uFPEm9xcBxpqc/Prttnjjcd56U1f7nLqlsVerICG/Cd8lfwOAd
         PGS9LH5cfvNnJzJJry9B6wJx8J9hhUdPIRpdigZ0CTJz5jj2x0gVSn1I1iTGxY4CFv
         UUqr6vShPeHdvvL7o3kEsrvtsnq7xoSxrzs7oVDaQFQR0mHG1ABvFZDeZ0XdTc0dom
         4kd3Klq7zEsqQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 07053610A4; Sat, 15 May 2021 17:44:37 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Sat, 15 May 2021 17:44:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: peter.ganzhorn@googlemail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213081-208809-QSki9nqueU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213081-208809@https.bugzilla.kernel.org/>
References: <bug-213081-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213081

--- Comment #2 from Peter Ganzhorn (peter.ganzhorn@googlemail.com) ---
Created attachment 296781
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296781&action=3Dedit
usbmon trace 5.12 bus 6

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
