Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3BEB1A22C5
	for <lists+linux-usb@lfdr.de>; Wed,  8 Apr 2020 15:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728616AbgDHNPc convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 8 Apr 2020 09:15:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:53478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728570AbgDHNPc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 Apr 2020 09:15:32 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 206897] Huion tablet not recognized from kernel 5.3.1
Date:   Wed, 08 Apr 2020 13:15:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: henning@eiden.email
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-206897-208809-lPj0ugnb3M@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206897-208809@https.bugzilla.kernel.org/>
References: <bug-206897-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206897

Henning Eiden (henning@eiden.email) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |henning@eiden.email

--- Comment #5 from Henning Eiden (henning@eiden.email) ---
(In reply to Vincenzo Di Massa from comment #4)

Hello,

I am facing the same issue. Trace and dmesg uploaded.

Cheers,

Henning

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
