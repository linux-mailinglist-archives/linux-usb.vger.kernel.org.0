Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F17B7273996
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 06:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgIVEFg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 22 Sep 2020 00:05:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:56258 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726098AbgIVEFg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 00:05:36 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208911] Renesas USB controller - FW has invalid version :8224
Date:   Tue, 22 Sep 2020 04:05:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vkoul@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208911-208809-p4nsEptvkp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208911-208809@https.bugzilla.kernel.org/>
References: <bug-208911-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208911

--- Comment #22 from Vinod Koul (vkoul@kernel.org) ---
(In reply to Greg Kroah-Hartman from comment #20)
> On Sun, Sep 20, 2020 at 09:38:10PM +0000,
> bugzilla-daemon@bugzilla.kernel.org wrote:
> > https://bugzilla.kernel.org/show_bug.cgi?id=208911
> > 
> > Max (kernel@maximilian-stieg.de) changed:
> > 
> >            What    |Removed                     |Added
> >
> ----------------------------------------------------------------------------
> >                  CC|                            |kernel@maximilian-stieg.de
> > 
> > --- Comment #19 from Max (kernel@maximilian-stieg.de) ---
> > Will this fix only came in 5.8 or also in 4.19 (LTS), which is used by
> Debian
> > 10?
> 
> Does it affect you on the latest 4.19.y kernel release?

Nope it does not affect 4.19 kernel. The change went 5.8 kernel, already has
been ported to 5.8 stable kernels

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
