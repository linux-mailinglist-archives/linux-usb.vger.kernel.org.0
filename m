Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B233477281
	for <lists+linux-usb@lfdr.de>; Thu, 16 Dec 2021 14:01:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237140AbhLPNBM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Dec 2021 08:01:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234499AbhLPNBL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Dec 2021 08:01:11 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EFAAC061574
        for <linux-usb@vger.kernel.org>; Thu, 16 Dec 2021 05:01:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2DF4D61961
        for <linux-usb@vger.kernel.org>; Thu, 16 Dec 2021 13:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94E98C36AE3
        for <linux-usb@vger.kernel.org>; Thu, 16 Dec 2021 13:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639659670;
        bh=1MudXpyeszvbjLiJkmtDuXJq5pw13Ofa37x82mALSuw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=uHLrLVo28dPpVq5HWv4xot5qQ/umsyuS7UlH92g9yHfvBrXRp8HFEjMYxdIU3TS7g
         JrC+HyEfIbPu6XiD8U+2jFRXvrfD0PGjOQxM/RJhohJbWqmq72dKVrFS0kJKdM/9bo
         FSRcYLjxgV+WAF4xazSD7Eu6nAsFqkaPjGVTSz860H3YEiIIremu6NLMZuL4SCoJML
         wShAVaQ0pHAJrpQEmgx/u/KxT3mNQoGa7tg/NLehWG8JaKMCLrTsZy2WXN1BiyML+l
         gDscgvhSwJKQIgty2CoKO9+Q+wa17oH0BHorB+jJsh3sIjM7xd0kOTRPh+o997N9TX
         4SSsgI9J6MsfQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 7B19160F47; Thu, 16 Dec 2021 13:01:10 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215117] ucsi_acpi: kernel NULL pointer dereference
Date:   Thu, 16 Dec 2021 13:01:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: linux-kernel-bugs@hixontech.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215117-208809-i8eqE8HnmW@https.bugzilla.kernel.org/>
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

--- Comment #7 from Chris Hixon (linux-kernel-bugs@hixontech.com) ---
That patch seems to fix the bug for me, applied to v5.16-rc5.

(patch attached to bug report as
https://bugzilla.kernel.org/attachment.cgi?id=3D300041 )

Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
