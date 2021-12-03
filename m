Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1E1466EA9
	for <lists+linux-usb@lfdr.de>; Fri,  3 Dec 2021 01:44:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243119AbhLCArV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Dec 2021 19:47:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238220AbhLCArU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Dec 2021 19:47:20 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B2F6C06174A
        for <linux-usb@vger.kernel.org>; Thu,  2 Dec 2021 16:43:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 26F48B8259B
        for <linux-usb@vger.kernel.org>; Fri,  3 Dec 2021 00:43:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC792C53FD0
        for <linux-usb@vger.kernel.org>; Fri,  3 Dec 2021 00:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638492234;
        bh=r51cqdZEzDEbVQu2SFuMMJDLMJ7fi24GlPVr3FE60cw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gAZ+dEo6bW8AaZI0dzUSnbqj2v5pibHEwTeq5+VQTUWyufT7r2YxSG+puPk2NHBWo
         TKQMYwGUYKrQI2ZITK+9uUdLuSUjbWH2Uq3RNySu3yJd/SB54SWapGAaTzJIaN3nVz
         kCDbehbzOOygTYyOQBnHMTSfIDmECEF/lEco9Ct00ZzuPDXCAthw57SYYmBJ3PpcGN
         PO7bX/v3qtzISPijeBH9N2BRvuI+HMl2S1qEZ0cNtkxcXRl6iUddgf09rWtf8XXKBF
         X+nQ0uAlf326VimcMnjgavbCYtDpsqg9bWoIV2ujajOGvcyP1j5/Pcm5V2DO1/ccck
         aow63RsXjA0ew==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id C8CB360F38; Fri,  3 Dec 2021 00:43:54 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209555] dwc2 driver stops working after sudden disconnect
Date:   Fri, 03 Dec 2021 00:43:54 +0000
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
Message-ID: <bug-209555-208809-qvDdyxdapK@https.bugzilla.kernel.org/>
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

--- Comment #27 from Yunhao Tian (t123yh@outlook.com) ---
You may refer to https://github.com/t123yh/linux/tree/for-rk3308 for a work=
ing
version of code. Meanwhile I hope that we might able to request some help f=
rom
@Minas?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
