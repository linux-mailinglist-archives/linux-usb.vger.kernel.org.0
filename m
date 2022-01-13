Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0634F48DC07
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jan 2022 17:40:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236790AbiAMQki (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jan 2022 11:40:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232248AbiAMQki (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jan 2022 11:40:38 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD6A0C061574
        for <linux-usb@vger.kernel.org>; Thu, 13 Jan 2022 08:40:37 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 88F29B82304
        for <linux-usb@vger.kernel.org>; Thu, 13 Jan 2022 16:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E763C36AE9
        for <linux-usb@vger.kernel.org>; Thu, 13 Jan 2022 16:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642092035;
        bh=lC9GltI2hlUzu5PvBklV+NMkDFS7c10cCkvtrX/uQy4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jlP6zC7H8x8HUbLBRbhds6Mw0iF5Roz5fsYv/7eZrXBBiO3b6h4J5YVSEgfRVJVNU
         HCVmK8ryeJajKhycycGHhq6xkWm0xbvvrCIHw2nIRFOzzPaftsXySHCjC79/oK4oz5
         RhDy6gVqQd5e7G63YkbaALMCUkqTpBz/tBZi7JdpJln68KHwAJYQtlXTiqQiebqcoO
         EaXKCmgTlSdKHwkb4nuF05KI4tI1hIkK3iI0hUamaahSMuNH+R3bK63/P1qzymRHR9
         HkbgtV3ZC2d6dxIuDzUHFlnFn1NofDAVxrycbIb59yoAjJqCrjUj3o1yGMSFIXdpTU
         1TLTbKCCkZTyg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 26A01CC13AE; Thu, 13 Jan 2022 16:40:35 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215490] Logitech Brio doesn't initialise on USB 3.0 port of
 Asus M5A97 Evo R2.0
Date:   Thu, 13 Jan 2022 16:40:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nouveau@spliet.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215490-208809-0KQ12IhSiF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215490-208809@https.bugzilla.kernel.org/>
References: <bug-215490-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215490

--- Comment #1 from Roy (nouveau@spliet.org) ---
Created attachment 300261
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300261&action=3Dedit
Full kernel log.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
