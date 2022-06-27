Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0748355E111
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jun 2022 15:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234554AbiF0M6Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jun 2022 08:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234616AbiF0M6M (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jun 2022 08:58:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D6771054F
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 05:57:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 516CF61240
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 12:57:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6A2DC3411D
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 12:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656334668;
        bh=s7ZSacN1KvYtxbhiNtULy7zUYz+gJDEe5hKUn0dKqjg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WP2p2w9bC8VZICWjUV08/6RjzIgZWGLh4AaZ+7t4u79Izislr7dunA1boGoviU3Q+
         BPMFH97clBfVP19oKQDt5DGwfG9EhHZXkcmQ1Ai3kdqkj/SDqIPML0JZazipBYnSpg
         7ry2gwimPoNpC6RUNCCmDamtwY7E53PWvGGuYnyNsrj+2LTuy6+b4P/nK6R1yhadJM
         AtkCPUi3lIMBdK2g6o1b1sCsMXihZ6guaoalit5Y+ZJAsf4utwj3BmiAMogTKiGH8i
         GK15p/AWNsvGzKABkvvpL6mL/5AsQhIDK+7l7ftd0o4Q9R0NYR7uTqo+u8qzToM+9K
         wgh4/PJFWDs0g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A3881C05FD5; Mon, 27 Jun 2022 12:57:48 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216171] Hibernation not working because of xhci_hcd
Date:   Mon, 27 Jun 2022 12:57:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: prz.kopa@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216171-208809-cCKRA9iJTj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216171-208809@https.bugzilla.kernel.org/>
References: <bug-216171-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216171

--- Comment #3 from Przemyslaw Kopa (prz.kopa@gmail.com) ---
(In reply to Mathias Nyman from comment #1)

> Guessing suspend_common() in hcd-pci.c retruns -EBUSY because
> HCD_WAKEUP_PENDING(hcd) flag is set.
>=20
> Does xhci dynamic debug show some port event before this?

There are a few "Port change events", I attached dmesg log with dynamic deb=
ug
enabled.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
