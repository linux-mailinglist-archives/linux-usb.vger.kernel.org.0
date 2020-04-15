Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E39621AA979
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2020 16:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S370750AbgDOOIn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 15 Apr 2020 10:08:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:48978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2634083AbgDOOIj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 Apr 2020 10:08:39 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 205841] Lenovo USB-C dock audio NULL pointer
Date:   Wed, 15 Apr 2020 14:08:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: serg@podtynnyi.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205841-208809-XGstrzxYjN@https.bugzilla.kernel.org/>
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

--- Comment #12 from Serg Podtynnyi (serg@podtynnyi.com) ---
In Red Hat https://bugzilla.redhat.com/show_bug.cgi?id=1772806
and retrace https://retrace.fedoraproject.org/faf/reports/2662737/

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
