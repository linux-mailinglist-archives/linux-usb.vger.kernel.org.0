Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDAC83095B6
	for <lists+linux-usb@lfdr.de>; Sat, 30 Jan 2021 15:08:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbhA3OGD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 30 Jan 2021 09:06:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:40246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229468AbhA3OGC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 30 Jan 2021 09:06:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id D504064DDF
        for <linux-usb@vger.kernel.org>; Sat, 30 Jan 2021 14:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612015521;
        bh=lMjcPeRXy81B/ni7chEefaLiJbM3s4CIr220KT1yNR0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WH6mq4LnjLsmB+BWVefvW58QTsCSEwZkVdQvCPikBmhMaZMVucwBx4bJ0vFkc5qEq
         MrXAmoj8kObnkDQbI4ShayfM1enW/0cDBiaMbs7hqM2PtYG9dKvANrsWBruz5wwZe+
         Nmc/50udWyr14X12YBc5oMWSgsnxfFvvX5uz7eb5m2cCjBnKyugSuLXwh3KF9Z1cU3
         beys1BL3IAhL6RpsJekq+ns69n35GXpRlp+QPHfERiCm2dRjRnehor+XJz5GfVC3GW
         SYfZpek29b8WelPzSuRlZFAklZXlHqqwooMJxVVHOwr4l6hpMsHLLR+p5l99BxSv6c
         iwrpdSYBmL9bw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id C1AF9652F9; Sat, 30 Jan 2021 14:05:21 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 211479] hid-generic: offset (0) exceeds report_count (0)
Date:   Sat, 30 Jan 2021 14:05:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andreas.thalhammer@linux.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-211479-208809-CDxxGVudtw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211479-208809@https.bugzilla.kernel.org/>
References: <bug-211479-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211479

--- Comment #2 from Andreas (andreas.thalhammer@linux.com) ---
Created attachment 295011
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D295011&action=3Dedit
output of "lsusb -d 03eb:ff02 -vv"

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
