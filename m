Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3250F38B8B4
	for <lists+linux-usb@lfdr.de>; Thu, 20 May 2021 23:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbhETVFf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 May 2021 17:05:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:39168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229788AbhETVFd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 May 2021 17:05:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id BE6996138C
        for <linux-usb@vger.kernel.org>; Thu, 20 May 2021 21:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621544650;
        bh=4jxIrhJLZBwxRTgDQwEBnheTvWmx64qhrr2yM6d4VXM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=GR/ps3LHXNAN5WQRFnbQYyHmrmrtCEPLicaKy5795oduP13dB+tiIoDE+KUxuf9Tp
         oRQBojf0SSUfYRJF1L/yJb4N2KCb+xcgOOM/RrIIR9369YScC6s3yG9llE8F+9z1Ch
         ZSCwEp7xQGV56DKiPG8s5KlGrdFIzt/PnoPVZiLQUg87iJzN4f2NW4BQF66+FAVxYd
         tHKmnu1dWqVmHavP8Z9twrobS2NKvQavpzgKE2oMIEA7nvfoa4OzCzf4Y1tDyYwJvj
         44EAWtBu/GqB6u9eYi0hQUvKT0pJ6ZBrAcX9l76OqB2fcI9H6rF6gYDHZGncVXnLEK
         cYoy+wthxJ5xQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id AF2FF6129B; Thu, 20 May 2021 21:04:10 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Thu, 20 May 2021 21:04:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213081-208809-1HfIaCo9EQ@https.bugzilla.kernel.org/>
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

--- Comment #26 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Created attachment 296903
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296903&action=3Dedit
Patch forcing a set TR deq command after halt due to stall

One more patch on top of the previous ones.
Does this help?=20
I don't have a simple way for trying this out myself.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
