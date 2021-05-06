Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11BB3374ECC
	for <lists+linux-usb@lfdr.de>; Thu,  6 May 2021 07:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbhEFFNk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 01:13:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:58084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229925AbhEFFNj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 May 2021 01:13:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C189D611ED
        for <linux-usb@vger.kernel.org>; Thu,  6 May 2021 05:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620277961;
        bh=XuOJeaNJEZ1R8pgnqEIVNfLDlDacSFmDJSpVp6n4FqQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=XzoC6CbCPmbQqsRc/ioHWoWFOVpgpOGaQFM2EpHqN1KGhyjq4xxfQp6ydXP8JBsf0
         B31eDEjMUzmwmkkQDb7R38wZaf7wd59beGJ41rD4CFSpVE5VwZjrtnaD1wQY70Q4fm
         2dd1RDyB6QrGqfDLq6WlO1D3biswU1lPR9D5Mhe+mtimfgUtbR9xvDYcyPNUIhslqu
         ZMHmDuX1LFGIxkN8ry/wSORJe9nGToAXsNgYaO7cfGtpN5f691KKxSCl31hZJa2k0Z
         3nsdrt4r8q9phLVFrqC08rlXMdb3dP0z4qLYQYz4LB8Q45tzA7ZGn/NTzWwomX8QOn
         9+/LVsqBoTm5A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id ADC4F6129D; Thu,  6 May 2021 05:12:41 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212955] Possible kernel regression USB2 (not USB3) port EDIROL
 UA-101 (in USB 1.1 mode, not USB2) error -110
Date:   Thu, 06 May 2021 05:12:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jaffa225man@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212955-208809-kHR8EpK8C7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212955-208809@https.bugzilla.kernel.org/>
References: <bug-212955-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212955

--- Comment #2 from Lucas Endres (jaffa225man@gmail.com) ---
Created attachment 296661
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296661&action=3Dedit
usbmon USB 3 port working

Sorry, I didn't know how to eliminate other bus/device entries (since the
non-working log would contain only seemingly nonsensical selections, if ":3=
:"
is grepped).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
