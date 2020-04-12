Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8A261A5F67
	for <lists+linux-usb@lfdr.de>; Sun, 12 Apr 2020 18:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbgDLQuG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 12 Apr 2020 12:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:55560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726962AbgDLQuF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 12 Apr 2020 12:50:05 -0400
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBB74C02A1A2
        for <linux-usb@vger.kernel.org>; Sun, 12 Apr 2020 09:40:50 -0700 (PDT)
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207209] Regression: Lenovo T490s + UltraDock - USB3 failed to
 recover after disconnect
Date:   Sun, 12 Apr 2020 16:40:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alxchk@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207209-208809-sPkXM9rvsL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207209-208809@https.bugzilla.kernel.org/>
References: <bug-207209-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207209

--- Comment #5 from Oleksii Shevchuk (alxchk@gmail.com) ---
A bit more errors:

Apr 12 19:39:18 tachi kernel: usb 4-1.1: Failed to set U1 timeout to 0x0,error
code -19
Apr 12 19:39:18 tachi kernel: usb 4-1.1: Set SEL for device-initiated U1
failed.
Apr 12 19:39:18 tachi kernel: usb 4-1.1: Set SEL for device-initiated U2
failed.
Apr 12 19:39:18 tachi kernel: usb 4-1.1: usb_reset_and_verify_device Failed to
disable LPM
Apr 12 19:39:21 tachi kernel: usb usb4-port1: Cannot enable. Maybe the USB
cable is bad?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
