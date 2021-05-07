Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED0F375EBE
	for <lists+linux-usb@lfdr.de>; Fri,  7 May 2021 04:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233612AbhEGCNR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 22:13:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:57766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230019AbhEGCNR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 May 2021 22:13:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 72F116113D
        for <linux-usb@vger.kernel.org>; Fri,  7 May 2021 02:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620353538;
        bh=UvX9oYftiLDMKjwwuxiAL4meNpes6S0yEi2I0dlxxM4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=oaMceYq96vjgq9ig018fKILtpMZzvm4Uw1jwWU9WsxV3B4W38yKcHQdM/Gt0pbMmM
         nh6gD3JVsDxCaP8TnxnlGBDjyWLMTnV5TQSlGXWYbG79dkkTdZXuY7ICHdK/7XZfSX
         90JXIHGNZ1ZNMbI+ba9Ll2MzkYXDcw4asUoUuXJTLt2oj9umAlF8PZgp0qC/9p0mER
         LhUfk6Medfc4TImatf7kGHEVuaxJkpBbJNPzLedMLgirzrIjDIMNbGOmegC9gCA3cT
         EJmo8M1uE/Jd26WgScjolgkGRuA6mKxBU+Pye/MQTnKBI/NiRWL/FCUP6q8G/nSIrv
         fCoLiTZ7phfqQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 5D9FB6129D; Fri,  7 May 2021 02:12:18 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212955] Possible kernel regression USB2 (not USB3) port EDIROL
 UA-101 (in USB 1.1 mode, not USB2) error -110
Date:   Fri, 07 May 2021 02:12:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jaffa225man@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212955-208809-iO8Pcj7a8E@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212955-208809@https.bugzilla.kernel.org/>
References: <bug-212955-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212955

--- Comment #7 from Lucas Endres (jaffa225man@gmail.com) ---
Created attachment 296681
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296681&action=3Dedit
usbmon USB 2 port working on 5.9.0

Here is the usbmon output from the same USB2 port, but working on the older
5.9.0 kernel.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
