Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 610E838CB79
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 19:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237030AbhEURDI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 13:03:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:43390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233990AbhEURDH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 May 2021 13:03:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D75586135B
        for <linux-usb@vger.kernel.org>; Fri, 21 May 2021 17:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621616503;
        bh=oJaqERPPStBlBHGIy8mzZh4dz0cg1lHg4zA0qLIHk8Q=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=n8b6aUwiuc3m+ooC0llsroxEzmJCaN7h8pokE6sG+2saHQeU8Sgoi5IWQabvRsbuV
         Gkw6yfaKZJkY9NPd9xFqyNWPO7EQMZB1abgPKzga8UCVuN2IBb7JehTyDuTYSMRyqu
         fEigF0VPex3cOPsOa9xFd1XVou9zEbgVNOeXnPhPnuu3Mvy8f9t2BrBV/0RP9P+4mO
         z0paFbO9a22KzW5pTI7E79FOBzh3k3Yoigcfksv/FWQb+WqQ8uxeSd7oWFMlxDlif/
         azkVZcBGWbxKnMsZCzF5OyL4Jywn2yfmJ1EPFxBXtldYQI/e2YxendLF1pbLMIZxPE
         ltqYmJSOxoBbQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id C9C89612A4; Fri, 21 May 2021 17:01:43 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Fri, 21 May 2021 17:01:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: peter.ganzhorn@googlemail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213081-208809-jC7Y8itdRo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213081-208809@https.bugzilla.kernel.org/>
References: <bug-213081-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213081

--- Comment #28 from Peter Ganzhorn (peter.ganzhorn@googlemail.com) ---
Created attachment 296917
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296917&action=3Dedit
detailed trace 5.12.5 + both patches

Mathias, with both of your patches applied to 5.12.5 everything seems to be
just perfect again!
My card reader is detected and seems to work like it did on 5.11 and before.

If you'd like to verify that everything is indeed fine, I've created another
detailed trace and dmesg. As usual, I recorded plugging in the device,
inserting a card and this time also running cfdisk.

Thank you Mathias and Alan for the great support and instructions, it was a
pleasure assisting you tracking down and fixing this bug! :-)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
