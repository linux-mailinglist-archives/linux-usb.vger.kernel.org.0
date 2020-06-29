Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 147FB20E51B
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jun 2020 00:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391167AbgF2Vcf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 29 Jun 2020 17:32:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:60668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728677AbgF2SlE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Jun 2020 14:41:04 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 206339] On v5.5.rc2 For "lsusb -v" it shows as "can't get
 device qualifier: Resource temporarily unavailable, can't get debug
 descriptor: Resource temporarily unavailable"
Date:   Mon, 29 Jun 2020 11:34:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rui.zhang@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc component assigned_to product
Message-ID: <bug-206339-208809-Mcr5XKJfw9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206339-208809@https.bugzilla.kernel.org/>
References: <bug-206339-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206339

Zhang Rui (rui.zhang@intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |rui.zhang@intel.com
          Component|ACPICA-Core                 |USB
           Assignee|acpi_acpica-core@kernel-bug |drivers_usb@kernel-bugs.ker
                   |s.osdl.org                  |nel.org
            Product|ACPI                        |Drivers

--- Comment #2 from Zhang Rui (rui.zhang@intel.com) ---
reassign to the USB experts

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
