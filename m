Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8B8A4770D2
	for <lists+linux-usb@lfdr.de>; Thu, 16 Dec 2021 12:43:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233351AbhLPLnb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Dec 2021 06:43:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231406AbhLPLna (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Dec 2021 06:43:30 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9797FC061574
        for <linux-usb@vger.kernel.org>; Thu, 16 Dec 2021 03:43:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3FA1161A34
        for <linux-usb@vger.kernel.org>; Thu, 16 Dec 2021 11:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AADF7C36AE3
        for <linux-usb@vger.kernel.org>; Thu, 16 Dec 2021 11:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639655009;
        bh=Zh4YkBh904XN/q2URRfaM6arEfGVg3J2/IrvT7uN4qA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YYBmT2PP89X4/RcXFp4qY+4n+h2lBVbn/WxxPzjPzWuOJTrKvS/T6XcF1GepwHCFq
         GHgn65vi7WAIEVRblDiEmCGBv6N4Wu3qyoEZw5pwzDIBetZmk61BczBynfNDdxI7RM
         V2GBa8deiQYRIogynTvOlJ/HJcJ3UhurP3HNpZztW92udqAX9033fnoj7S2yKyyfhq
         WlZ6+hDloAlCvI63w6/IHErUOxw6rCveIlIRR2TgOmUnj5JJUb02x8Vl3BM3PIoc9x
         /2ZJIJf0HpzPHJ+JHsZJuSP1LYaDweOCvWDx0mJinwtZzO+LNR9IWyGI0i88vKyLnW
         7BUdzqWwU/qRw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 7CBBF60F14; Thu, 16 Dec 2021 11:43:29 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215117] ucsi_acpi: kernel NULL pointer dereference
Date:   Thu, 16 Dec 2021 11:43:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: heikki.krogerus@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-215117-208809-mCOoNXIoQj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215117-208809@https.bugzilla.kernel.org/>
References: <bug-215117-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215117

Heikki Krogerus (heikki.krogerus@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |heikki.krogerus@linux.intel
                   |                            |.com

--- Comment #5 from Heikki Krogerus (heikki.krogerus@linux.intel.com) ---
Created attachment 300041
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300041&action=3Dedit
fix proposal

Most likely regression from commit 6cbe4b2d5a3f ("usb: typec: ucsi: Check t=
he
partner alt modes always if there is PD contract").

Can you guys test the patch I attached?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
