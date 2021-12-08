Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4847D46DE02
	for <lists+linux-usb@lfdr.de>; Wed,  8 Dec 2021 23:07:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233375AbhLHWL0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Dec 2021 17:11:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbhLHWL0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Dec 2021 17:11:26 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6DFAC061746
        for <linux-usb@vger.kernel.org>; Wed,  8 Dec 2021 14:07:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id A4A24CE23E6
        for <linux-usb@vger.kernel.org>; Wed,  8 Dec 2021 22:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF944C341C3
        for <linux-usb@vger.kernel.org>; Wed,  8 Dec 2021 22:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639001269;
        bh=/8k0DkfKwy8ktrrc5H82Enz5sYFNVMDeQcEh1vFxugs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=E/MZlhkBvGhVuhPZdu/KgtCEWKz2m5EGF4TbpDxBMzteWKSd1Z7NYwi1qAc6CkjE6
         wNidPuV66bJCdhnIlbYQy2i5zDtvGM9wkNqYOCtPVSuG/2IHnqtbM7ICbQvaJoOdea
         8/j/hehCKaDyfIZmXlZZvEI8hVkzuBgdMFocAL3fAy81EU7vKyUpfbiyC3p+9fLDBc
         JmLu6m5uT57XW2H7F8js8ZFQZX8Z9og5IGIXRpkvw0d1Lmztp2KiZJXD8F/poNXGFe
         nfo9qL7S7sBa4qYM/ywhXU2nzw2AcCb7obKxbHOtxUqqb8dnSAHFtRnw3x6JkgHUkO
         Ks0wZkwFkj7Iw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id A6FBD60F41; Wed,  8 Dec 2021 22:07:49 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215241] "usbreset" tool causes hung task on kernel 5.15.3+ with
 Hauppauge WinTV dualHD
Date:   Wed, 08 Dec 2021 22:07:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215241-208809-5ltq1FwRKi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215241-208809@https.bugzilla.kernel.org/>
References: <bug-215241-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215241

--- Comment #5 from Alan Stern (stern@rowland.harvard.edu) ---
You should write to Paul Skripkin, telling him about this problem.  And CC:=
 all
the people listed on the Signed-off-by: lines, as well as the
linux-media@vger.kernel.org list.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
