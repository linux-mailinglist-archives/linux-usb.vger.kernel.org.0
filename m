Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26524212CCC
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 21:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbgGBTK1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 2 Jul 2020 15:10:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:57310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725862AbgGBTK1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 2 Jul 2020 15:10:27 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 203419] Logitech Group USB audio stopped working in 5.1-rc6
Date:   Thu, 02 Jul 2020 19:10:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dominique.archambault@univ-paris8.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203419-208809-tgl7jnFI1Y@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203419-208809@https.bugzilla.kernel.org/>
References: <bug-203419-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=203419

--- Comment #32 from Dominique Archambault (dominique.archambault@univ-paris8.fr) ---
same here
$ uname -a
Linux astrolabe11 5.7.0-1-amd64 #1 SMP Debian 5.7.6-1 (2020-06-24) x86_64
GNU/Linux

connecting the ConfCam connect ruins all audio (even other cards become
unavailable)



On Thu, 2 Jul 2020 at 16:15, <bugzilla-daemon@bugzilla.kernel.org> wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=203419
>
> --- Comment #31 from Marco S. (sofro1988@gmail.com) ---
> (In reply to Mathias Nyman from comment #30)
> > (In reply to Marco S. from comment #29)
> > > Hi, any news about it? when it's going to be implemented in stable
> kernel?
> > > Thanks
> >
> > it's in 5.4.36 stable kernel:
> > fceab238c534 xhci: Don't clear hub TT buffer on ep0 protocol stall
>
> I'm running 5.7.6 and still have the issue with Logic Group USB
>
> --
> You are receiving this mail because:
> You are on the CC list for the bug.
>

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
