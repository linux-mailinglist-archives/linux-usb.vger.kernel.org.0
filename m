Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 059412C231B
	for <lists+linux-usb@lfdr.de>; Tue, 24 Nov 2020 11:41:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732021AbgKXKkY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 24 Nov 2020 05:40:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:55150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726744AbgKXKkY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Nov 2020 05:40:24 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 210345] xhci init fail
Date:   Tue, 24 Nov 2020 10:40:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gregkh@linuxfoundation.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210345-208809-YbUgzXyqPW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210345-208809@https.bugzilla.kernel.org/>
References: <bug-210345-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210345

--- Comment #1 from gregkh@linuxfoundation.org ---
On Tue, Nov 24, 2020 at 09:58:51AM +0000, bugzilla-daemon@bugzilla.kernel.org
wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=210345
> 
>             Bug ID: 210345
>            Summary: xhci init fail
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.4.0-53-generic #59-Ubuntu SMP

Please file this with Ubuntu as this is a very old kernel release and we
at kernel.org have no idea what is actually included in this kernel
release.

thanks,

greg k-h

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
