Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45F3D438555
	for <lists+linux-usb@lfdr.de>; Sat, 23 Oct 2021 22:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbhJWUln (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 Oct 2021 16:41:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:49436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229954AbhJWUlm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 23 Oct 2021 16:41:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 16F7B60F23
        for <linux-usb@vger.kernel.org>; Sat, 23 Oct 2021 20:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635021563;
        bh=joKCuuQuPoWFY/KmQNszm4infqan93YMffIRz3AmKVA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lwc3HceYBk9eebOvYUjq3F0TPThYAxgVp205HSrLMhozDFAkhh4LS3B9o/WX9uZyW
         qqQsyrfBePVSM2kD3l0XBJP25ImA53sZ8z/IXIVv7tEDhpJjFKBX8U2caiBIRYpbjZ
         I9lirH35V0lG0lNdgKo3k3VhEih4CltCFaHs9NeUbBVG7u07y8D0DfYQ+YnFSKCLoO
         aZQywD4lWiBtHufIW7t9i/Srvy2sDkBcVOVCIF2Qi2qYwPb7yOw6+AlNFk8Wz7a3kJ
         yWXrce8T8mxH2iXRNBl2nOF/5gkYrpvW7YbtNuI+6UjFu349DLPHmbHnNMiDWho7w6
         fPC3sFaLxeaTA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 02FDC60F43; Sat, 23 Oct 2021 20:39:22 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214797] ehci-pci: unable to enumerate Sony NW-WS623 Device
Date:   Sat, 23 Oct 2021 20:39:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214797-208809-GtxcqQ6KzQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214797-208809@https.bugzilla.kernel.org/>
References: <bug-214797-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214797

--- Comment #2 from Alan Stern (stern@rowland.harvard.edu) ---
The most likely explanation is that the USB device, the cable, or the host
controller hardware isn't working properly.  Does the device work on other
computers?  Do other devices work when plugged into that USB port?

You cannot work around the issue by specifying details manually.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
