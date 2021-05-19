Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F056C389896
	for <lists+linux-usb@lfdr.de>; Wed, 19 May 2021 23:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbhESV2C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 May 2021 17:28:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:47894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229454AbhESV2B (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 May 2021 17:28:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B04C261353
        for <linux-usb@vger.kernel.org>; Wed, 19 May 2021 21:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621459601;
        bh=Q7ZmhBdKOu4HdWBgCt4wyPWrOxiGdZoC+PMYgG2R4KQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=EzhWfy34KNrZF63jqtsQsFtWzWbxiMAc7LnBvZQWdnl8+m/K43D1ownZbGi16bnbI
         YQBxw/Q4DKnpffkMIeXpTarqpZ4GAq9i1N0/LmqiiQQgeFdt1KfcJTxbaBsZBSn4ZX
         XOktC5sY4mwxry6mHgHTyvmLZRRplWkcOLDwtjw+3Tc6zR4Ptzjl2zxXziycNApbsj
         vv25xm13PQReefsOACqxreZxPxgNNnlydR5QAY9SuEoUL+ZPEXh1q5x+9qYlXEM1Dr
         58Wtf5prbiHzq76NsHVvRHq1E8XfvaS5s0471Ys+H9lypZxeiYfPxJg93sypb1DXEc
         r3bh4LzSRTFrQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id AD15461260; Wed, 19 May 2021 21:26:41 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Wed, 19 May 2021 21:26:41 +0000
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
Message-ID: <bug-213081-208809-69eNbzIARo@https.bugzilla.kernel.org/>
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

--- Comment #23 from Peter Ganzhorn (peter.ganzhorn@googlemail.com) ---
Created attachment 296885
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296885&action=3Dedit
detailed trace 5.12.5+patch

Hi Mathias, I've also added the requested detailed trace.
I hope you find something helpful in there.

Thank you for your support, Mathias and Alan!
Peter

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
