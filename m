Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 077D321A660
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jul 2020 19:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728467AbgGIR5s convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 9 Jul 2020 13:57:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:58394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727091AbgGIR5r (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Jul 2020 13:57:47 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208357] snd-usb-audio broken for 06f8:b000 since 4.9.189
Date:   Thu, 09 Jul 2020 17:57:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: bugzilla.kernel.org@mrtoasted.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208357-208809-2CLZFFbREF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208357-208809@https.bugzilla.kernel.org/>
References: <bug-208357-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208357

--- Comment #5 from Alexander Chalikiopoulos (bugzilla.kernel.org@mrtoasted.com) ---
In the current kernel, in /sys/kernel/debug/usb/devices, I see for this device:

T:  Bus=01 Lev=01 Prnt=01 Port=02 Cnt=01 Dev#=  6 Spd=12   MxCh= 0
D:  Ver= 1.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 8 #Cfgs=  1
P:  Vendor=06f8 ProdID=b000 Rev= 1.00
S:  Manufacturer=Hercules
S:  Product=Hercules DJ Console
C:* #Ifs= 9 Cfg#= 1 Atr=80 MxPwr=300mA
I:* If#= 0 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=00 Prot=00 Driver=(none)
E:  Ad=07(O) Atr=02(Bulk) MxPS=  16 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 1 Cls=03(HID  ) Sub=00 Prot=00 Driver=usbhid
E:  Ad=83(I) Atr=03(Int.) MxPS=  20 Ivl=10ms
I:* If#= 2 Alt= 0 #EPs= 1 Cls=03(HID  ) Sub=00 Prot=00 Driver=usbhid
E:  Ad=84(I) Atr=03(Int.) MxPS=   4 Ivl=10ms
I:* If#= 3 Alt= 0 #EPs= 1 Cls=03(HID  ) Sub=00 Prot=00 Driver=usbhid
E:  Ad=85(I) Atr=03(Int.) MxPS=   8 Ivl=10ms
I:* If#= 4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=snd-usb-audio
E:  Ad=06(O) Atr=02(Bulk) MxPS=   8 Ivl=0ms
E:  Ad=86(I) Atr=02(Bulk) MxPS=   8 Ivl=0ms
I:* If#= 5 Alt= 0 #EPs= 0 Cls=ff(vend.) Sub=00 Prot=00 Driver=(none)
I:  If#= 5 Alt= 1 #EPs= 1 Cls=ff(vend.) Sub=00 Prot=00 Driver=(none)
E:  Ad=01(O) Atr=09(Isoc) MxPS= 576 Ivl=1ms
I:  If#= 5 Alt= 2 #EPs= 1 Cls=ff(vend.) Sub=00 Prot=00 Driver=(none)
E:  Ad=81(I) Atr=0d(Isoc) MxPS= 288 Ivl=1ms
I:  If#= 5 Alt= 3 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=(none)
E:  Ad=01(O) Atr=09(Isoc) MxPS= 576 Ivl=1ms
E:  Ad=81(I) Atr=0d(Isoc) MxPS= 288 Ivl=1ms
I:* If#= 6 Alt= 0 #EPs= 0 Cls=01(audio) Sub=01 Prot=00 Driver=snd-usb-audio
I:* If#= 7 Alt= 0 #EPs= 0 Cls=01(audio) Sub=02 Prot=00 Driver=snd-usb-audio
I:  If#= 7 Alt= 1 #EPs= 0 Cls=01(audio) Sub=02 Prot=00 Driver=snd-usb-audio
I:* If#= 8 Alt= 0 #EPs= 0 Cls=01(audio) Sub=02 Prot=00 Driver=snd-usb-audio
I:  If#= 8 Alt= 1 #EPs= 0 Cls=01(audio) Sub=02 Prot=00 Driver=snd-usb-audio

I will try to find (or build) a kernel where this device works and document the
same.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
