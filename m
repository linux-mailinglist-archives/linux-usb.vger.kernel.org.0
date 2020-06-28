Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BECF20CAFD
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jun 2020 00:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbgF1WsV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 28 Jun 2020 18:48:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:49014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726130AbgF1WsV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 28 Jun 2020 18:48:21 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208267] usbip broken with latest kernels?
Date:   Sun, 28 Jun 2020 22:48:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: m.v.b@runbox.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-208267-208809-dbkHiEnqWf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208267-208809@https.bugzilla.kernel.org/>
References: <bug-208267-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208267

M. Vefa Bicakci (m.v.b@runbox.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |m.v.b@runbox.com

--- Comment #5 from M. Vefa Bicakci (m.v.b@runbox.com) ---
Hello all,

I can confirm that reverting the following five commits resolves the reported
issue with usbip, at least on Qubes OS, which uses usbip to redirect/reattach
USB devices between VMs running on Xen.

* ef0f7d1877ac ("USB: Export generic USB device driver functions")
* c9d503370f24 ("USB: Make it possible to "subclass" usb_device_driver")
* aeebf2b54665 ("USB: Implement usb_device_match_id()")
* 88b7381a939d ("USB: Select better matching USB drivers when available")
* 77419aa403ca ("USB: Fallback to generic driver when specific driver fails")

Thank you,

Vefa

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
