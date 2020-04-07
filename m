Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E921E1A0E8B
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2020 15:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728956AbgDGNlz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 7 Apr 2020 09:41:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:59518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728573AbgDGNly (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Apr 2020 09:41:54 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207147] USB errors: uhci_hcd 0000:01:00.4: swiotlb buffer is
 full (sz: 8 bytes) ; iommu=off
Date:   Tue, 07 Apr 2020 13:41:54 +0000
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
Message-ID: <bug-207147-208809-QNHEsqWibm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207147-208809@https.bugzilla.kernel.org/>
References: <bug-207147-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207147

--- Comment #2 from Alan Stern (stern@rowland.harvard.edu) ---
So you if you care about the virtual keyboard and mouse then you should always
use iommu=on.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
