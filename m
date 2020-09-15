Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EFD326B4D1
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 01:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727233AbgIOXcI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 15 Sep 2020 19:32:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:47680 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727163AbgIOOhi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 15 Sep 2020 10:37:38 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 209089] USB storage devices appear as SATA devices
Date:   Tue, 15 Sep 2020 14:27:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bourne.identity@hotmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209089-208809-Ahezwz46WG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209089-208809@https.bugzilla.kernel.org/>
References: <bug-209089-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209089

--- Comment #15 from Manish Jain (bourne.identity@hotmail.com) ---
Hi Alan,

Nice to see your response to the reopened PR.

1)
'mount /dev/uda<TAB>' : I think you are missing the point about USB disk
attachments. As I said earlier, there usually there will usually be only one of
those (I never had to attach 2 pen drives simultaneously). So there will
usually be only a /dev/uda in the ud* - or else nothing in the ud* series.

So you can start tabbing at 'd' : mount /dev/ud<TAB>.

So that definitely provides the adavantage of 1 character less to type at a
time when you want to type less.

2)
'it would be one more thing to remember, so worse in that respect'. Sir, my
humble intuition is this would be an advantage. So many changes (eth0 ->
enp9s0) happen with no real benefit to the end user. This one has an advantage:
one character less to type, plus the comfort of the knowledge that USB have
their own series. People will welcome this change, if it were permitted to
happen.

3)
'it would mean changing all the existing shell scripts and /etc/fstab files
that already use the /dev/sdb* names' :

find . -type f -name '*.sh' -exec sed 's/sdb/uda/g' {} \;;

Thanks again for your response.
Manish Jain

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
