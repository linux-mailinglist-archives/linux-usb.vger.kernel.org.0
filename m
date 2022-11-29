Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 868D663B8B9
	for <lists+linux-usb@lfdr.de>; Tue, 29 Nov 2022 04:26:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235473AbiK2D04 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Nov 2022 22:26:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235471AbiK2D0z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Nov 2022 22:26:55 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 295564A052
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 19:26:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CD4FFB8110B
        for <linux-usb@vger.kernel.org>; Tue, 29 Nov 2022 03:26:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9684BC433C1
        for <linux-usb@vger.kernel.org>; Tue, 29 Nov 2022 03:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669692411;
        bh=MYZG7ihPRJL48+wPduhRL8Qxm7N3H+HIieLEXy/VJK4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=O/FsuIZI0YoBZpSei5uE2ehwWVMneMHeciJRTytQsnvu3Q8HOom9RjgwAB2kmmcp6
         tACxsoOK59WvePsafLIBE/92Bd216wQ9IiItvGTkOw035i7yg/7lVPc7Fnc8ZOyanI
         KYSs1qoPmfGt9ZTK5xmn62vn9qIetevDUIDNzeY3WzjbKkbvfU5qm/J5nPQJzIMAZ9
         37ieKeNYsv5BThq4EqjU7zBvv4ickwcrVs+SlE0SlQK33RBdfMNSiuxfEWcQBhWepV
         HCdeV9GiVh8M2S/sQhawhp3u7Fx1VgIFbROF8lEKOsDdmeJ824RJXW1Lk+kCtrGlb1
         haFJkDcn2wpMg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 83B20C433E7; Tue, 29 Nov 2022 03:26:51 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Tue, 29 Nov 2022 03:26:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: chris.chiu@canonical.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216728-208809-zd2zdDhkfl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

--- Comment #11 from Chris Chiu (chris.chiu@canonical.com) ---
Created attachment 303316
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303316&action=3Dedit
dmesg with PCI_DEBUG

[   35.907673] pcieport 0000:03:02.0: waiting 100 ms for downstream link, a=
fter
activation
[   35.907687] pcieport 0000:03:00.0: waiting 100 ms for downstream link, a=
fter
activation
[   37.038857] xhci_hcd 0000:38:00.0: waiting additional 100 ms to become
accessible
[   37.039165] thunderbolt 0000:04:00.0: restoring config space at offset 0=
x14
(was 0x0, writing 0x9df40000)
[   37.039181] thunderbolt 0000:04:00.0: restoring config space at offset 0=
x10
(was 0x0, writing 0x9df00000)
[   37.039196] thunderbolt 0000:04:00.0: restoring config space at offset 0=
x4
(was 0x100000, writing 0x100406)
[   37.146904] xhci_hcd 0000:38:00.0: Unable to change power state from D3c=
old
to D0, device inaccessible
[   37.148017] pcieport 0000:03:02.0: re-enabling LTR

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
