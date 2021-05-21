Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 347F438CF28
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 22:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbhEUUkv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 16:40:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:54814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229457AbhEUUku (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 May 2021 16:40:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 47DE8613D0
        for <linux-usb@vger.kernel.org>; Fri, 21 May 2021 20:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621629566;
        bh=ZrggV4/Lcw49YRpujWS9LTl4j1J7Urcbhvr7Nk2Hwcg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Jz7PCUjGb/kxpZmu76o3Mg3BK+Ct3qTvUjulpTOB5C7gWlb96Ir3RF0CXy12wtwI1
         bD593kDVTcomi/fjBTBb0dgSrQZG3spwgNPVTwK4jOeUKqrmT1EF27j4utlRFVIgSe
         cLV+rcQGS7UHQVfuZp1BKdJR6DdEhFAJzV/aWCEJUejVQAqycXMPehieTfga7Xp7h9
         +XR8kGXLn7oE3y29USD+LTl6Ahg01zJE1Gt/oRFw2tUJocrPOkqSWiY/7qS57pWapo
         N5XxbW2Uby7rXdlcony0D32aiw9EVFSSlKf0RDv6+jkNh9AX1J87o5j8Pgjdk6Dcvu
         5nFcuGOmqfQ2A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 38A5F612A4; Fri, 21 May 2021 20:39:26 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Fri, 21 May 2021 20:39:25 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213081-208809-cmfXStMtka@https.bugzilla.kernel.org/>
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

--- Comment #30 from Peter Ganzhorn (peter.ganzhorn@googlemail.com) ---
You are welcome, Mathias.
Of course you can add my name in the tags.

Just out of curiosity:
Do you have an explanation why this bug seems to only affect some devices?
As I mentioned before, another card reader I own worked just perfectly and I
got the impression from your description in comment #25 that this issue may
theoretically affect just about any device which apparently is not the case.
Why would the hardware move past the stalled TRB with one device and not wi=
th
another?
My knowledge about the details of USB / xHCI is pretty vague, but I'd still
like to grasp what you just fixed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
