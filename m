Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75559375ECA
	for <lists+linux-usb@lfdr.de>; Fri,  7 May 2021 04:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233483AbhEGCWH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 22:22:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:37534 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229909AbhEGCWG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 May 2021 22:22:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 701F36113D
        for <linux-usb@vger.kernel.org>; Fri,  7 May 2021 02:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620354067;
        bh=TWusb5WAg1MQen+BcQIy7kltmlhL4XuyNNbC4XlKzbA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=BwnG3D4iJNmCXr4XYIH6UuAbOOYWmf63Ae23oolUBYc+bDJA3YtpFC2CkSjJ67pmD
         NbxHf24vXtsPnkLL+IY76xr00WvJleb2V5dQBonRJ5QuyEemWbAyNKzC43jNyulre+
         /QyLKtzI7OgEJEcOYrbE+HB0jqOVAk14Q0gaOXd3tO+/ZqB0du5YaKFmoaOaV4i5/D
         UkoiMU785jTNMaL3ArS32d+2/L+g71XD7Xs/Z11rl06jKwqPhP17rP4KH9Gp5tzDQf
         4P+8VjR+XaimdP+iA2EaFDwBhIgS1ppi3KadrVq5cLyZvr7Rln8fUrSurBBXp28+la
         cX8Dp2hAkr0YA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 633EE6129D; Fri,  7 May 2021 02:21:07 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212955] Possible kernel regression USB2 (not USB3) port EDIROL
 UA-101 (in USB 1.1 mode, not USB2) error -110
Date:   Fri, 07 May 2021 02:21:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jaffa225man@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212955-208809-2YmDFlHpAd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212955-208809@https.bugzilla.kernel.org/>
References: <bug-212955-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212955

--- Comment #8 from Lucas Endres (jaffa225man@gmail.com) ---
Created attachment 296683
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296683&action=3Dedit
dmesg USB 2 port working on 5.9.0

Here is the dmesg output from the same USB2 port, but working on the older
5.9.0 kernel.

Thanks for the tip about "--shallow-exclude=3D".  I used it so far to limit=
 it to
5.11 (since I think it had been working on it), like so:
git clone --shallow-exclude=3Dv5.11
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

It was much smaller, being only 332.27 MiB in total.  Now I just have to re=
ad
up about how to use bisect.  Hopefully I'll be able to easily "make uninsta=
ll"
when all through testing, as I prefer using debian's package management, and
don't want leftover pieces taking up space.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
