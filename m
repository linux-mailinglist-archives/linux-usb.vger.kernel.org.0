Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E57111936FD
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 04:30:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbgCZDaq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 25 Mar 2020 23:30:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:44794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727575AbgCZDap (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 25 Mar 2020 23:30:45 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 206901] Valve Index HMD breaks the USB controller it's
 connected into
Date:   Thu, 26 Mar 2020 03:30:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: carlo@alinoe.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206901-208809-XcpXSAf8hg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206901-208809@https.bugzilla.kernel.org/>
References: <bug-206901-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206901

--- Comment #3 from Carlo Wood (carlo@alinoe.com) ---
Not sure if what I said is correct. I was referring to:

From the "User's Manual: Hardware" of the μPD720202:

1. Overview

The μPD720201 and μPD720202 are Renesas’ third generation Universal Serial Bus
3.0 host controllers, which comply with Universal Serial Bus 3.0 Specification,
and Intel’s eXtensible Host Controller Interface (xHCI). These devices reduce
power consumption and offer a smaller package footprint making them ideal for
designers who wish to add the USB3.0 interface to mobile computing devices such
as laptops and notebook computers.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
