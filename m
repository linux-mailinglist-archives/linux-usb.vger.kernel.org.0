Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15F95218B7B
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 17:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730196AbgGHPj2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 8 Jul 2020 11:39:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:46966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729022AbgGHPj1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 Jul 2020 11:39:27 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208353] Distorted Audio Output Through USB C Docking Station
Date:   Wed, 08 Jul 2020 15:39:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pnqkernelbugzilla@inkvizice.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-208353-208809-plSXsHL6IL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208353-208809@https.bugzilla.kernel.org/>
References: <bug-208353-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208353

pnqkernelbugzilla@inkvizice.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pnqkernelbugzilla@inkvizice
                   |                            |.org

--- Comment #12 from pnqkernelbugzilla@inkvizice.org ---
I have similar issue with audio output from Dell WD15 USB-C Dock. I decoded
notorious song "Never Gonna Give You Up" to raw audio and ran it throug aplay.
Before the commit it plays normally, since the commit it plays like this:
https://central.szn.cz/s/tr9otisNwiFEE2A

The first official release with the issue is 5.7.6, it is still present in
5.8-rc4. Bisecting found the following commit
d288dc74f8cf95cb7ae0aaf245b7128627a49bf3 (ALSA: usb-audio: Improve frames size
computation), which is based on upstream commit
f0bd62b64016508938df9babe47f65c2c727d25c.

Release 5.7.7 with the patch from comment #5 seems okay.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
