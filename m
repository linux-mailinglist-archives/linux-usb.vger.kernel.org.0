Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 148F73F896D
	for <lists+linux-usb@lfdr.de>; Thu, 26 Aug 2021 15:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242749AbhHZNz0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Aug 2021 09:55:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:56410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229793AbhHZNzZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Aug 2021 09:55:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 29D5260F21
        for <linux-usb@vger.kernel.org>; Thu, 26 Aug 2021 13:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629986078;
        bh=1vzKsAxrrLnThgLY9mgp3NOkAyXSQpoaFWXHptucpps=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=sL/KGLuTKwbMZXysehT4/0x4ITGvkQMrgmCmZQkgS0MUiasLyo/Aa//INxRZ7q4y2
         rn3XqBUzLsSQw8NtS220ZlWXiZuJ5eolH7WDC3qcJxj3zJXAiEc+2+BQQxeH+ZTdez
         CGnLqjXi0GEeVVZ0JyKzJEsgnxMJfkjkaxeb+m03BYHNY/Gi98weurMuOfS2XOVWAj
         8AS3GtfHMfTCVdMyO1nRZqkVbIad1BIoiJygkkana1IKGJhwSnTB3UV7p2wRynwqxN
         4fu/D1VruP9LTgVN+FZ0vIt6flZ/HjUrhiiPHkp4bRFwSGvcVGbs1/kIf/oneOQ1uV
         49+NAv87tfyhw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 192AA60E17; Thu, 26 Aug 2021 13:54:38 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 207887] USB keyboard (and other devices) connected to Thinkpad
 Dock hangs after a while
Date:   Thu, 26 Aug 2021 13:54:37 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-207887-208809-erdN0Y0sNt@https.bugzilla.kernel.org/>
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

--- Comment #15 from Johannes Wegener (catchall-kernelbug@blubbbla.de) ---
Created attachment 298487
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298487&action=3Dedit
Kernel Log on 5.13.12

Hi Alan,

here is the full kernel log. The keybaord stopped working around 18:30. I
unplugged it and plugged it two times to another USB-Port of the computer. =
That
is the reason you're seeing the events at 18:30:43 and 18:32:06.

Cheers,
Johannes

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
