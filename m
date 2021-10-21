Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 347FA435A84
	for <lists+linux-usb@lfdr.de>; Thu, 21 Oct 2021 07:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbhJUF63 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Oct 2021 01:58:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:33852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229499AbhJUF63 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 Oct 2021 01:58:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 827E8611CC
        for <linux-usb@vger.kernel.org>; Thu, 21 Oct 2021 05:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634795773;
        bh=i44kMCNRktYUOIH+vAhjxVtfgRcjpkmt7Zc7igfRrmw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YorVhpkEy1q0S5a/UhFSjyCKaAHjGuIhbs8X1C85lHr/MiEQbZ75R3//xdQEG/Rk4
         pWyQ+m/puPp4qbX16YMoRVnmxE7KQ2ldWqiQMr9j8Y2iQjsC7GvaN5LJuHTyFeI4Tx
         r2C3wCYTPbnBxj9ZFI6FhWi2SsXTCtGzHuCiaofXiJR+hlZFA/w2rOmm5jYGGzwjvh
         ad2mKWXzDx9tKwpiJpYe6x/u3T9RjiWbi7t1DRYLPoECN5ZNvQPAPjUtH+goWN3wdn
         ImxE81e9TEYdOiF/qkuJftcCWvxoxXP0qbY4+uWGSCWSsLuIGEs2xviiQzG2qo3q1q
         IhQsb/mLSIUgA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 7984F60E75; Thu, 21 Oct 2021 05:56:13 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214789] ehci-hcd.c ISR
Date:   Thu, 21 Oct 2021 05:56:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214789-208809-l2TFkpdwQ5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214789-208809@https.bugzilla.kernel.org/>
References: <bug-214789-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214789

--- Comment #1 from Greg Kroah-Hartman (greg@kroah.com) ---
On Thu, Oct 21, 2021 at 04:29:42AM +0000, bugzilla-daemon@bugzilla.kernel.o=
rg
wrote:
>=20
> Change in ehci_irq from spin_lock_irqsave/irqrestore to spin_lock/unlock
> broke
> shared IRQ's

What shared irq broke exactly?  For what hardware platform?  And what
kernel version worked for you and now does not work?

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
