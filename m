Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72F6839C69C
	for <lists+linux-usb@lfdr.de>; Sat,  5 Jun 2021 09:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbhFEHbS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Jun 2021 03:31:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:44250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229892AbhFEHbS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 5 Jun 2021 03:31:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9F5F8613E7
        for <linux-usb@vger.kernel.org>; Sat,  5 Jun 2021 07:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622878170;
        bh=iYZclxkpDu/VucLguJxXqKLPjWDSIDBx/M0bhUaV+L8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WT/jEX4wv8b0m92xbu06faT6kYHL6K0JIqImmq94l/hpqd/VEoGFWJtQQ14Uonbdk
         valkYR6NgJsIsHJMRKUlbombpeMHpO7vlER9LlBHb6M1pDETxRag/ozKf8zZbS47tz
         PWkRL7+yYoNNvMqXWcJ1fGHqCkjGrrbVyh1ibnWS6hhVNVDdqkWOUOP+8aEdDY0WJ+
         M+6CGL38mp85kViVQkeVeJS9ocaSsl2B9hMDRI/nP1jh0PL075TcKIPvJdcw3wwXTZ
         mF4j/eAsa44wcy4LOsxcONi5VoulSkU1vzkdt29Jkk5FGnuF0HLAiPkvAV85/0SECv
         /7m9WBEoWS7Vw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 8FEA361287; Sat,  5 Jun 2021 07:29:30 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Sat, 05 Jun 2021 07:29:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: peter.ganzhorn@googlemail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-213081-208809-lL3mmGjRB2@https.bugzilla.kernel.org/>
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

Peter Ganzhorn (peter.ganzhorn@googlemail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #32 from Peter Ganzhorn (peter.ganzhorn@googlemail.com) ---
Everything has been working well with the patches for me so far and I just =
saw
Linux 5.12.9 has the patches included.
I'll just mark this as resolved.

Thanks again for the great support!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
