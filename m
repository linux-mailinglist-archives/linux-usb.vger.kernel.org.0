Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B19B2388043
	for <lists+linux-usb@lfdr.de>; Tue, 18 May 2021 21:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241617AbhERTDB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 May 2021 15:03:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:49694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242665AbhERTDA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 May 2021 15:03:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 59D5B61261
        for <linux-usb@vger.kernel.org>; Tue, 18 May 2021 19:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621364502;
        bh=5qC6vPcQaHpQYeBaTFRhz/Eq2ZrbB6ngNscz0nCLaWA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=X+fCQLr5uxxMmjOfQe2Bu0UY5DIQ43mvmFLIXdo3gw0by7abf/L9K8RPlCLTPfjJw
         78OyzzAY1nmWvZy5BkV7QU9ptXbhDXfEqqY9paC2wzmhg8zu8gICxnIYR5l86chS00
         igHsF1gee+AC2tiFHO7dZAU/EXxS9VEWGir4IkGcBbhobATOEsORYh96WNzBZfbUSh
         CF0lyzhWmVPeBmWjiy9AuCA9t4NEwdbAJynx37FWqTECJuqSzFcL6vgKh/pdYaYdqZ
         CeVUn/wgxEAEZx3GLOHZ5rU0cFVsNg/einiYfcLx2G9wyVU/5wtdSHkSyqCRLeXwMo
         cldAXuK2KD47Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 512216124A; Tue, 18 May 2021 19:01:42 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Tue, 18 May 2021 19:01:42 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213081-208809-6dlvgrmuSM@https.bugzilla.kernel.org/>
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

--- Comment #13 from Peter Ganzhorn (peter.ganzhorn@googlemail.com) ---
I tried to revert the commit on 5.12.
Checking out 674f8438c121 and then reverting worked as you suggested, thanks
for the hint.

Results:
1) Kernel built at / with commit 674f8438c121 stops at the following output:

...
usb-storage 6-2.3.1:1.0: USB Mass Storage device detected
scsi host6: usb-storage 6-2.3.1:1.0
scsi 6:0:0:0: Direct-Access    Generic STORAGE DEVICE   1531 PQ: 0 ANSI: 6
sd 6:0:0:0: Attached scsi generic sg2 type 0

Which is clearly related to my card reader. After that, the boot process DO=
ES
NOT CONTINUE.

2) Kernel without commit 674f8438c121: Boots just fine and my card reader
works.

Seems like the commit git bisect found makes things a lot worse indeed.
I guess there were other changes involved since 5.12 at least continued to =
boot
with the device attached.

What else could I do to help you investigating this?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
