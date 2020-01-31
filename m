Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A964114E996
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jan 2020 09:30:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728124AbgAaIai convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 31 Jan 2020 03:30:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:34332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728145AbgAaIah (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 31 Jan 2020 03:30:37 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 206365] kernel NULL pointer dereference when charger is
 unplugged
Date:   Fri, 31 Jan 2020 08:30:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206365-208809-5XBGd70V87@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206365-208809@https.bugzilla.kernel.org/>
References: <bug-206365-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206365

--- Comment #3 from Greg Kroah-Hartman (greg@kroah.com) ---
On Fri, Jan 31, 2020 at 08:22:53AM +0000, bugzilla-daemon@bugzilla.kernel.org
wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=206365
> 
>             Bug ID: 206365
>            Summary: kernel NULL pointer dereference when charger is
>                     unplugged
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.3.4-300.fc31.x86_64

5.3 is quite old now, please try a 5.4 kernel or newer.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
