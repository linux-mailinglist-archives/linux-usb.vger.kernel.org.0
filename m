Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA9852F64F0
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jan 2021 16:44:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbhANPlx convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 14 Jan 2021 10:41:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:39804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726259AbhANPlx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 14 Jan 2021 10:41:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id A2D9A23B27
        for <linux-usb@vger.kernel.org>; Thu, 14 Jan 2021 15:41:12 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9AC1A816A9; Thu, 14 Jan 2021 15:41:12 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210801] TopSeed Technology Corp. eHome Infrared Transceiver
 spams log with Error: urb status = -71
Date:   Thu, 14 Jan 2021 15:41:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hpj@urpla.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210801-208809-MEJMeNodUW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210801-208809@https.bugzilla.kernel.org/>
References: <bug-210801-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210801

--- Comment #8 from Hans-Peter Jansen (hpj@urpla.net) ---
Sorry Sean, was distracted from day job(s) the last couple of days. 

I hereby promise to do my homework soon...

Device: Hewlett Packard TSGI-IR01

https://paste.opensuse.org/19971413

There are two similar models, this one is easily distinguished from the other
by the cable attachment on the rear side, our's is asymmetric. 

Send me your post address and I'm happy to send you one! (I bought a bundle due
to a couple of my friends operate similar VDR setups, based on my packages on
OBS). While the device is somewhat chunky, it does support RC06 well, as being
used by the most common Hauppauge IR remote, that we all accumulated over time:

https://hauppauge.co.uk/site/webstore/webstore_product.html?prod=7

Cheers,
Pete

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
