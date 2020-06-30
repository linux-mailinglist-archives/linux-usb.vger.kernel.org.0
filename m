Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 589B820EADE
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jun 2020 03:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbgF3B1U convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 29 Jun 2020 21:27:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:49626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726443AbgF3B1U (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Jun 2020 21:27:20 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 206339] On v5.5.rc2 For "lsusb -v" it shows as "can't get
 device qualifier: Resource temporarily unavailable, can't get debug
 descriptor: Resource temporarily unavailable"
Date:   Tue, 30 Jun 2020 01:27:19 +0000
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
Message-ID: <bug-206339-208809-c4egfcXz5b@https.bugzilla.kernel.org/>
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

--- Comment #3 from Alan Stern (stern@rowland.harvard.edu) ---
Try running "sudo lsusb -v" instead.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
