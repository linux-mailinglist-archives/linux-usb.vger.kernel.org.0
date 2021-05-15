Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE479381A3D
	for <lists+linux-usb@lfdr.de>; Sat, 15 May 2021 19:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234112AbhEORqM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 May 2021 13:46:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:40470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231480AbhEORqK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 15 May 2021 13:46:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6078A613BE
        for <linux-usb@vger.kernel.org>; Sat, 15 May 2021 17:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621100697;
        bh=/nZfYMFDcZ87siw6I6wrNEcEmErkXq1LrJ0aKHMKpTQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=KM4Fz32z6saAy6t6iMS7RlpiU/Z4nmMXPXAd9atA5Q4BHB41YqBK/B6MBRXL4nWLF
         +WkaJ3QoKLUhtKZGg7rp1OYaakyfJILGx2kJoghywb19LFuJkjtUWsKGM/01x41Lns
         DHGZOp5WOeMZmDYlMm3wB/tEpXnlRLcUA/RTSVPa/lHxuyXonFtkIUHXYSjNYFX6zN
         bBUHqqnn8QjgMULUZ8eH6pLeDykxxb+f+oc2/gf9ecStqzMvy3uMe2dA6F5QTmpcaa
         LNlyfNhHWNfJIl5H5LFUpVo1NdR6TSJ/CWmskRQ3zH/MiUt6ogCBmCLixx6dcBzE/E
         yy77dlE5lAOjg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 5CB4D610A4; Sat, 15 May 2021 17:44:57 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Sat, 15 May 2021 17:44:57 +0000
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
Message-ID: <bug-213081-208809-Cuv7QLh1OM@https.bugzilla.kernel.org/>
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

--- Comment #3 from Peter Ganzhorn (peter.ganzhorn@googlemail.com) ---
Created attachment 296783
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296783&action=3Dedit
usbmon trace 5.11 bus 6

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
