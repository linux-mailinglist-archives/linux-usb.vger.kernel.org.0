Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7125C2EF171
	for <lists+linux-usb@lfdr.de>; Fri,  8 Jan 2021 12:37:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725942AbhAHLhy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 8 Jan 2021 06:37:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:44180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725869AbhAHLhy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 8 Jan 2021 06:37:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id C821E22A99
        for <linux-usb@vger.kernel.org>; Fri,  8 Jan 2021 11:37:13 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AF4888162A; Fri,  8 Jan 2021 11:37:13 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210351] Wrong setting baudrate for FTDI chip FT230X
Date:   Fri, 08 Jan 2021 11:37:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: svv75@mail.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210351-208809-IMwW15niPF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210351-208809@https.bugzilla.kernel.org/>
References: <bug-210351-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210351

--- Comment #2 from Vladimir (svv75@mail.ru) ---
Hello, Johan.

Unfortunately, I don't have a device at hand right now. But I remember the
lsusb output was showing FT-X type. And under Windows, all three chips I
mentioned work correctly with all prescalers. I contacted FTDI tech support
with this problem. They advised me to have such a patch for ftdi_sio.c and it
solved the problem. Here's the patch:

static int change_speed (struct tty_struct * tty, struct usb_serial_port *
port)

...

      index_value = get_ftdi_divisor (tty, port);

      value = (u16) index_value;

      index = (u16) (index_value >> 16);

      if ((priv-> chip_type == FT2232C) || (priv-> chip_type == FT2232H) ||

            (priv-> chip_type == FT4232H) || (priv-> chip_type == FT232H)) {

            / * Probably the BM type needs the MSB of the encoded fractional

            * divider also moved like for the chips above. Any infos? * /

            index = (u16) ((index << 8) | priv-> interface);

      }



So, the high bit of the factional part is lost on the FT-X chips. To fix it in
the kernel try:



      if ((priv-> chip_type == FT2232C) || (priv-> chip_type == FT2232H) ||

            (priv-> chip_type == FT4232H) || (priv-> chip_type == FT232H) ||

(priv-> chip_type == FTX)) {

            / * Probably the BM type needs the MSB of the encoded fractional

            * divider also moved like for the chips above. Any infos? * /

            index = (u16) ((index << 8) | priv-> interface);

      }

But I don't know why the most significant bit of the prescaler is masked by
something. I have no information about the chip configuration registers. It
looks like this is confidential information. But they could provide it to you
as the driver developer.

Vladimir

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
