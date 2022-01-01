Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2A1482860
	for <lists+linux-usb@lfdr.de>; Sat,  1 Jan 2022 20:53:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232613AbiAATxq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Jan 2022 14:53:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232597AbiAATxq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Jan 2022 14:53:46 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBEE5C061574
        for <linux-usb@vger.kernel.org>; Sat,  1 Jan 2022 11:53:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 90290B80925
        for <linux-usb@vger.kernel.org>; Sat,  1 Jan 2022 19:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39B79C36AEC
        for <linux-usb@vger.kernel.org>; Sat,  1 Jan 2022 19:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641066823;
        bh=4Ir7wyr1OHIxWnhu2FJKIwiERQTWcata+BOTARRiSYQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MBddH/NBPUvmNIK7YEyZnhoYG/hbTV/BFUfdnEXHxst4r+5bPhbwuOiU+/7UAye00
         VP5049bIp3PEPr91LbPzL6RjjLsLnak5MhOWzZZXXz/LZEoEMveXmtYn8f1trqAXH4
         HqQq9ZMvz3XNmLPYQKyDbEj5XZIBjQ0/fiIpUPw4a07LfCPVwoSYhMJwVFUD5XSD04
         Q4LS0deZ4FmycL3S5jRaMevEd3ERa0yeAKedN4CieYrXGqC1FCa77++/+T89j1IbIS
         g2Z9d0Gjr8RFD+c2v6SZUXEs0ycMJdH3u96MY+VJ1H86wWi2QKSea73StkgIkvCpT2
         LN/PMXAwrM5Nw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1F0D6CBF85E; Sat,  1 Jan 2022 19:53:43 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213839] XHCI 7 port usb hub does not work correctly
Date:   Sat, 01 Jan 2022 19:53:42 +0000
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
Message-ID: <bug-213839-208809-0kkIhfvMkI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213839-208809@https.bugzilla.kernel.org/>
References: <bug-213839-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213839

--- Comment #18 from Alan Stern (stern@rowland.harvard.edu) ---
Good news!  I have posted the patch on the linux-usb mailing list; it should
get merged sometime in the next few weeks.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
