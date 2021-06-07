Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC1C739E010
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 17:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbhFGPSl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 11:18:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:56338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230212AbhFGPSj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Jun 2021 11:18:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 76A4060C3D
        for <linux-usb@vger.kernel.org>; Mon,  7 Jun 2021 15:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623079008;
        bh=0dVRL0y64/o/YsdpkbD3Mb4dL3iTk1E4MF20pAAjeHo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=qBTRAhll7cz0+Mfy6lRH+NgFVgqGiWd5tn+ueloykGouNYFLhWOIV8BNIf5QxqzXP
         LcIwfysJX7kV1HOA5fG/OYoDdsfIwAtvwuScu6riKK78hqPJMDNyrbZcDyImT9uaYH
         k0BNwA5/w3G8ZcGdW6YikBln6be92xxXsOaRiEDamuG2VIJb/4AiNMZQxEzVVWS0QM
         Gso2OJmbnRYJWKoJmu7PFesUuAnMxErd8Kane63GLvbUfh81PIOEEusdmt2vMQssSp
         I4DWwDoQ5X8VmxZEGnVk8fWhC4vFnxxP5cbe3Uz4QgQJD1MfBnonfYr6ViExjold9d
         bgFPz19YYZCWg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 60EB46115A; Mon,  7 Jun 2021 15:16:48 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212955] Possible kernel regression USB2 (not USB3) port EDIROL
 UA-101 (in USB 1.1 mode, not USB2) error -110
Date:   Mon, 07 Jun 2021 15:16:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212955-208809-bFTjeg1wPf@https.bugzilla.kernel.org/>
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

--- Comment #22 from Alan Stern (stern@rowland.harvard.edu) ---
Using two different drivers would definitely explain the different patterns=
 of
communication with the device in your two usbmon traces.

But it doesn't explain why, with one of the drivers, the device seems to st=
op
responding when used with EHCI (and works okay with xHCI!).  Maybe this is
caused by a bug in the device's firmware.  It that's true, changing the
communication pattern might work around the problem.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
