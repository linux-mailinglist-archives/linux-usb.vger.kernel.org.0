Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63B3A11C8BF
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 09:59:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728269AbfLLI7H convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 12 Dec 2019 03:59:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:44288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728110AbfLLI7H (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Dec 2019 03:59:07 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 205841] Lenovo USB-C dock audio NULL pointer
Date:   Thu, 12 Dec 2019 08:59:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: owl@ow1.in
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-205841-208809-al0EWyg8Bm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205841-208809@https.bugzilla.kernel.org/>
References: <bug-205841-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=205841

--- Comment #7 from Ilia Pavlikhin (owl@ow1.in) ---
Created attachment 286263
  --> https://bugzilla.kernel.org/attachment.cgi?id=286263&action=edit
Full dmesg 5.4.2 wo UCSI

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
