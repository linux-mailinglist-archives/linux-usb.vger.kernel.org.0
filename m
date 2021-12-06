Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67AB646A380
	for <lists+linux-usb@lfdr.de>; Mon,  6 Dec 2021 18:56:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345254AbhLFR7p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Dec 2021 12:59:45 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:51870 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243468AbhLFR7p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Dec 2021 12:59:45 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 46FE2CE175C
        for <linux-usb@vger.kernel.org>; Mon,  6 Dec 2021 17:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77BA0C341C2
        for <linux-usb@vger.kernel.org>; Mon,  6 Dec 2021 17:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638813373;
        bh=Z5IwqOoyJ/oiuV/VDZ9gOOfe1TqkYqhF4JPaIHgHZMI=;
        h=From:To:Subject:Date:From;
        b=DU9t8F9Td6QNw9jLcJyug04wx1pPRho58ebuetmEIkPFo1WaWnQ+lbFMI0PXDxo6P
         hgBHZaZ1jMM6uydfRUnvJj583kIzoDm6nYxC4xqdaRjH2PyPzFJ/geprUazgBDE9iz
         2Jf/FZnJHK2Kax6QEL18B+281eSsg+Nq8x3yYCGDkG6I8IZcelKUNuSHJRwfhQP5tW
         oRu3aVS/viIXIPfUt2Q3dVHDYPLJCzsYJAIILBZG/IGKZsfiXgf3ZvIuKqqC1bOtlb
         ZCGWMHzOpBXygedJs2IIlIakr0lxEZ7PjMHkVojUGcHT4TXnrsq7HJvB8p7JE63qvd
         KGkrfMgkFPlbg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 56A3761158; Mon,  6 Dec 2021 17:56:13 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215241] New: "usbreset" tool causes hung task on kernel 5.15.3+
 with Hauppauge WinTV dualHD
Date:   Mon, 06 Dec 2021 17:56:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mabo@elbmurf.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215241-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215241

            Bug ID: 215241
           Summary: "usbreset" tool causes hung task on kernel 5.15.3+
                    with Hauppauge WinTV dualHD
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.15.3
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: mabo@elbmurf.de
        Regression: No

Created attachment 299917
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299917&action=3Dedit
Dmesg log

Hello, I have a Hauppauge WinTV dualHD DVB-T2 USB card and need to use the
nifty tool usbreset to reset its connection after each standby because else=
 it
won=E2=80=99t work. Recently, starting with Linux 5.15.3, usbreset started =
causing
severe hangs even to the point of my system being unable to do a proper reb=
oot
or shutdown. Same with 5.16.0-rc3. I=E2=80=99m now back on 5.13.2 without t=
his problem.
In the attachment you can read a dmesg log. Distro is Arch Linux.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
