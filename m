Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6E7B389895
	for <lists+linux-usb@lfdr.de>; Wed, 19 May 2021 23:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbhESV0D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 May 2021 17:26:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:47458 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229465AbhESV0D (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 May 2021 17:26:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E4C7A61007
        for <linux-usb@vger.kernel.org>; Wed, 19 May 2021 21:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621459482;
        bh=MMTrebkyNJdKtYUXD0ww1sGk71POsrg1S3VFnxnxUJc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=EeAWQ+iGiBVl9eb7B6xvbgFZnnM3JdQmT+Dm8SrlRm3myFLf14iN9Sg8umXenXUd5
         pxuR+kYdR8riEouBponExMjhBrckKLT92Qbn/oTI/6iOCpahBof6RpwbTG+cmtFL5J
         dlRGN+VEaCvb892V3IR95lrpiQDqPAgNy8/gSQfiGZu9BfR6/Be+Y2tWYCzExe4a4f
         cIRp0T6jgM2CeJRnmeFtQMfaNMROwF4hm9QiHudcIwtyg/U5k7ocQdWRtXw9mhcQXH
         8HWy/YdPOMk1YMRdtpTJwuufyl9BCNsV8WRQO/YjK9+bB8o0NQNsGHRLMrCvVKMbxX
         8Yx9csY2j0JsA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id DD021611F2; Wed, 19 May 2021 21:24:42 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Wed, 19 May 2021 21:24:42 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-213081-208809-ifGrYd4a0U@https.bugzilla.kernel.org/>
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
 Attachment #296879|0                           |1
        is obsolete|                            |

--- Comment #22 from Peter Ganzhorn (peter.ganzhorn@googlemail.com) ---
Created attachment 296881
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296881&action=3Dedit
dmesg 5.12.5+patch (2)

I actually forgot to insert the card into the reader.
Rebooted and re-collected the data (start trace, plug in reader, insert card
and wait for usb reset in dmesg).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
