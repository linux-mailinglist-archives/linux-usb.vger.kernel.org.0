Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12A7D437891
	for <lists+linux-usb@lfdr.de>; Fri, 22 Oct 2021 15:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233226AbhJVOAm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Oct 2021 10:00:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:35470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233146AbhJVOA1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 22 Oct 2021 10:00:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C0CEB6120E
        for <linux-usb@vger.kernel.org>; Fri, 22 Oct 2021 13:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634911089;
        bh=kcwq/DsV8WmwFU1QjCeUuKhDNgV60T9M7l0nMD9RfQ4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=b4a/im57L1GAeURm78va2O/KgjeFydcYG0a53a1zyv/PkSbacOY+w38nO4mbeDkVm
         zjdx+MScAXLrJUhf9Jzqt6FMR89P72No1hpLKU+52I6c/ckGDkPPxU1K92OsR9ak4j
         VwHPgkMP0QTgpesC4eROWfPzVQzRDw7Y91BNaH4R9yKNz2cxKe3LjtTVEwsXZ96Xdm
         XjndHK1kf0TqojP+MfeFTTtUAP/VpIb0E3L8ITbRNQBayQSAitntPglsQLGxxeux8R
         2R9qFm4g37r8S3U2jY9SlkQPnU2aANRxspa/HlDymkboiSilnFR++4rreaBIu/78ir
         6ZNL05JXjoZ1Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id B3F4F60FEC; Fri, 22 Oct 2021 13:58:09 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214131] ch341 communication problem
Date:   Fri, 22 Oct 2021 13:58:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: johan@kernel.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: johan@kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution assigned_to
Message-ID: <bug-214131-208809-2be1J4hBuN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214131-208809@https.bugzilla.kernel.org/>
References: <bug-214131-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214131

Johan Hovold (johan@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |johan@kernel.org
         Resolution|---                         |CODE_FIX
           Assignee|drivers_usb@kernel-bugs.ker |johan@kernel.org
                   |nel.org                     |

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
