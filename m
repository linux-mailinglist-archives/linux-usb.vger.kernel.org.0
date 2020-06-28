Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 719CB20C965
	for <lists+linux-usb@lfdr.de>; Sun, 28 Jun 2020 19:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbgF1Ru1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 28 Jun 2020 13:50:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:44338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726059AbgF1Ru1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 28 Jun 2020 13:50:27 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208353] Distorted Audio Output Through USB C Docking Station
Date:   Sun, 28 Jun 2020 17:50:26 +0000
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
Message-ID: <bug-208353-208809-i6GXMsgU3V@https.bugzilla.kernel.org/>
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

--- Comment #1 from Alan Stern (stern@rowland.harvard.edu) ---
Bring this to the attention of the person who wrote the offending commit:

On Sun, Jun 28, 2020 at 03:19:06PM +0000, bugzilla-daemon@bugzilla.kernel.org
wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=208353
> 
>             Bug ID: 208353
>            Summary: Distorted Audio Output Through USB C Docking Station
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.4.49
>           Hardware: All
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: pbui@kernel.bx612.space
>         Regression: No
> 
> Created attachment 289909
>   --> https://bugzilla.kernel.org/attachment.cgi?id=289909&action=edit
> Output of alsa-info.sh
> 
> With kernel 5.4.49 the audio output through my Dell WD19 Docking station is
> now
> laggy and distorted (sounds like only bass frequencies are emitted). 
> Previously, audio output through the dock worked just fine with all versions
> of
> 4.19.x and 5.4.x.
> 
> After looking through the changelog for 5.4.49, I was able to locate the
> offending patch:
> 
>
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/patch/?id=aba41867dd66939d336fdf604e4d73b805d8039f

This is upstream commit f0bd62b64016 ("ALSA: usb-audio: Improve frames 
size computation").

Alan Stern

> Reverting this patch allows audio to play normally through my docking
> station.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
