Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85F3E19F883
	for <lists+linux-usb@lfdr.de>; Mon,  6 Apr 2020 17:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728886AbgDFPHX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 6 Apr 2020 11:07:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:53534 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728884AbgDFPHX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 Apr 2020 11:07:23 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207125] Possible null pointer dereference in  ohci_restart()
Date:   Mon, 06 Apr 2020 15:07:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: zhandy@hit.edu.cn
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207125-208809-lnAEmirFjp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207125-208809@https.bugzilla.kernel.org/>
References: <bug-207125-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207125

--- Comment #2 from Dongyang Zhan (zhandy@hit.edu.cn) ---
(In reply to Alan Stern from comment #1)
> This is not a bug.  When ohci_restart() calls ohci_init(), ohci->hcca
> has already been initialized to a non-NULL value.  Therefore the
> -ENOMEM return cannot happen.

ohci->hcca will be allocated again in the ohci_init()
Could it fail in that function?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
