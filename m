Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92C2D28B4B7
	for <lists+linux-usb@lfdr.de>; Mon, 12 Oct 2020 14:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727037AbgJLMhJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 12 Oct 2020 08:37:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:44226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726348AbgJLMhJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Oct 2020 08:37:09 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 203419] Logitech Group USB audio stopped working in 5.1-rc6
Date:   Mon, 12 Oct 2020 12:37:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dirk.gajewski@uni-hamburg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203419-208809-H6jmDH4hFn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203419-208809@https.bugzilla.kernel.org/>
References: <bug-203419-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=203419

--- Comment #49 from Dirk Gajewski (dirk.gajewski@uni-hamburg.de) ---
Logitech conference cam (084b, 084c, 084e) is fully functional with kernel
5.9.0. 
cat /proc/asound/cards 
 0 [PCH            ]: HDA-Intel - HDA Intel PCH
                      HDA Intel PCH at 0xf7d10000 irq 33
 1 [Connect        ]: USB-Audio - ConferenceCam Connect
                      Logitech ConferenceCam Connect at usb-0000:00:1d.0-1.7.1,
full speed

lsusb
Bus 002 Device 003: ID 046d:c517 Logitech, Inc. LX710 Cordless Desktop Laser
Bus 002 Device 006: ID 046d:084b Logitech, Inc. 
Bus 002 Device 005: ID 046d:084c Logitech, Inc. 
Bus 002 Device 004: ID 046d:084e Logitech, Inc.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
