Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F00A388DA2
	for <lists+linux-usb@lfdr.de>; Wed, 19 May 2021 14:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239850AbhESMOZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 May 2021 08:14:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:44352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238273AbhESMOY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 May 2021 08:14:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3D10D6124C
        for <linux-usb@vger.kernel.org>; Wed, 19 May 2021 12:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621426385;
        bh=pOzRX7htID1LlIEr7wzF0jh40DBVQ/b6y6mRu0qTY7k=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=tyPpt+Fo0RiHp2xflRicheyFtgH8srMLRk9T/Y4Eiu6+gvTWYdcqSzB9QRzspxzMU
         yvIcaQGoKt5/lAQt/pytFMr1BndN5euX3B+DBcdwOfwv7NXVVb2zZZD1QkEexX4tsV
         cyJMjLg7EKkvVll5Yg4m8VXUWkhkeWX/hrHnEnOld/ECc6m5/oj6CVGn8jMLhfgohT
         IS91rBbwJOEx8XB9ut+bIB5WEKkOn4ZflM6pkaeO1Lz4KBbzrf0AQ1dFtRgR9IcdD4
         ViyxZ5DPsCxiTueLmrkOfqHHyRVYvEvSuTyK0MRiyXLtf9zIkcxrdKIc5AsydYkbw0
         JJkS3ULVl19Xw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 2B8BC611F2; Wed, 19 May 2021 12:13:05 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Wed, 19 May 2021 12:13:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213081-208809-nKTYSGQmLm@https.bugzilla.kernel.org/>
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

--- Comment #16 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Created attachment 296865
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296865&action=3Dedit
Patch fixing accidental clearing of URB status in xhci

Thanks for narrowing it down this far.

As Alan pointed out xhci is clearing the -EPIPE status of the a URB in some
STALL cases.

Attached a patch that should resove this. Does it help?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
