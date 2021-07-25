Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB1C3D4CBA
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jul 2021 10:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhGYILx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Jul 2021 04:11:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:37116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229883AbhGYILw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 25 Jul 2021 04:11:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3550B60F23
        for <linux-usb@vger.kernel.org>; Sun, 25 Jul 2021 08:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627203143;
        bh=C6vQh4K/4hBf7YEs2GICDvMTBa5GBRNtp/NTMURKByY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jUah1Cf37KEeXWkWbiUutbCN8X2n6vSuaX1IjU3ORoBBE6k5v5eUG+OqFYOPrVy6L
         gqzc1rEmuuD/vZfOzOkyvZzVJBQ6G2RE6L+vmpt+r0tqJ6CdxzOdGyVYoJa37Uv9i+
         99Q7FnfEaiGg9mQse0ZBXwAgZjeVHIiyk8YYXSm9Ql23pwb5Up9vO9Qv/dkQx7uelO
         mygWlp1Gljo5/XdpCyd1kJy/a9vJ37ryrJzQXNJY38/t2fXFNjzQJf8x3Rbk7RmJUi
         C/HsoGy0Ru0t/8ooEoEJlz3lW9sAELfRydVm3z3lVU/gNNbCO4bvRR5sQQhxC6/YzS
         gUBhvtMamOjJw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 00FB260E9A; Sun, 25 Jul 2021 08:52:22 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209555] dwc2 driver stops working after sudden disconnect
Date:   Sun, 25 Jul 2021 08:52:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t123yh@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209555-208809-OoCjKSULwt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209555-208809@https.bugzilla.kernel.org/>
References: <bug-209555-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D209555

--- Comment #15 from Yunhao Tian (t123yh@outlook.com) ---
Hi Minas,

Params and regdump is sent as an attachment.

I'm unable to get regdump after detach, because the system freezes after
disconnecting USB now, with message dwc2_flush_rx_fifo:  HANG! AHB Idle GRS=
CTL
flooding.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
