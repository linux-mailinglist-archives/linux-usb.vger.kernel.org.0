Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3FC28C8AF
	for <lists+linux-usb@lfdr.de>; Tue, 13 Oct 2020 08:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389489AbgJMGhR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 13 Oct 2020 02:37:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:40818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389353AbgJMGhR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 13 Oct 2020 02:37:17 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 209411] When retrieving string descriptor from mobile device
 returns eproto error
Date:   Tue, 13 Oct 2020 06:37:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rachithas104@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209411-208809-zCXm4vc8dN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209411-208809@https.bugzilla.kernel.org/>
References: <bug-209411-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209411

--- Comment #46 from rachithas104@gmail.com ---
(In reply to Lars Melin from comment #44)
> (In reply to rachithas104 from comment #43)
>  
> > There is only one configuration
> 
> So why do you then select configuration when the configuration descriptor
> tells you that there is only one?
> 
> You have a 'user space driver' attached to the PTP interface, are you
> running under a virtual machine or what is that driver?

It works with this device having low kernel version
Bus=03 Lev=01 Prnt=01 Port=01 Cnt=01 Dev#=100 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=2717 ProdID=ff18 Rev= 3.10
S:  Manufacturer=Xiaomi
S:  Product=MI 
S:  SerialNumber=d553b4b6
C:* #Ifs= 2 Cfg#= 1 Atr=80 MxPwr=500mA
I:* If#= 0 Alt= 0 #EPs= 3 Cls=06(still) Sub=01 Prot=01 Driver=usbfs
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=82(I) Atr=03(Int.) MxPS=  28 Ivl=4ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
