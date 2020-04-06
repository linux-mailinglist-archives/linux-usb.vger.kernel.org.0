Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1089D19F908
	for <lists+linux-usb@lfdr.de>; Mon,  6 Apr 2020 17:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728955AbgDFPlG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 6 Apr 2020 11:41:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:50064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728890AbgDFPlF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 Apr 2020 11:41:05 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207125] Possible null pointer dereference in  ohci_restart()
Date:   Mon, 06 Apr 2020 15:41:05 +0000
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
Message-ID: <bug-207125-208809-qK55DSAxHP@https.bugzilla.kernel.org/>
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

--- Comment #3 from Dongyang Zhan (zhandy@hit.edu.cn) ---
(In reply to Alan Stern from comment #1)
> This is not a bug.  When ohci_restart() calls ohci_init(), ohci->hcca
> has already been initialized to a non-NULL value.  Therefore the
> -ENOMEM return cannot happen.

I mean could you tell me where ohci->hcca is initialized before ohci_restart()?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
