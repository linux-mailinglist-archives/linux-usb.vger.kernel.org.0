Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFA1482749
	for <lists+linux-usb@lfdr.de>; Sat,  1 Jan 2022 11:38:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232245AbiAAKiW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Jan 2022 05:38:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiAAKiV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Jan 2022 05:38:21 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A943CC061574
        for <linux-usb@vger.kernel.org>; Sat,  1 Jan 2022 02:38:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 74BB2B81DE5
        for <linux-usb@vger.kernel.org>; Sat,  1 Jan 2022 10:38:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4DB29C36AEC
        for <linux-usb@vger.kernel.org>; Sat,  1 Jan 2022 10:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641033499;
        bh=53T6EGR+35G8IEy0lGrmugCIOJkY1ZliTbyTPsJO8Jo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=JQ+b+mtD302C458+cBbgGyTEXWJt7Xee7BRnzz0ILnKdvzt4iT5AzxbtOPQ4wsut/
         s4+FeDbzng6UT/T2+V6853QKnrDl8Warp1D3nvRrZgKmeNb0Ixd9TNfYcHgU0gg78/
         ioS0AzTqim/OVP9GpsqiNOBxEmyTJyDHIqvZdishMOe+bXew4ol9VPhBOJbPT6Syci
         z5Kf9UuIIHUV/tedOCJ90Pfeu3nQjQNasqGNety0buPFdd9EziCi9MBRprj+paQU5x
         6lN7Vt28piJDXibcz+jd9TGO3ZizPUpJhCRNuM7fuuukD+U5NLjuwyx8yjIIRhexKv
         rLScd3ZNQyRcQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3749BCBF85D; Sat,  1 Jan 2022 10:38:19 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213839] XHCI 7 port usb hub does not work correctly
Date:   Sat, 01 Jan 2022 10:38:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: noodles@earth.li
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213839-208809-jiQSBDCvnn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213839-208809@https.bugzilla.kernel.org/>
References: <bug-213839-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213839

--- Comment #13 from Jonathan McDowell (noodles@earth.li) ---
Created attachment 300194
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300194&action=3Dedit
dmesg, usb autosuspend, usb_snoop, hub not working

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
