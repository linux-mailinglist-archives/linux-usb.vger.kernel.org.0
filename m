Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8073E55C4D3
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jun 2022 14:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234534AbiF0M4i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jun 2022 08:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234738AbiF0M40 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jun 2022 08:56:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82417101F9
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 05:56:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 28AEA6111C
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 12:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E098C36AE2
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 12:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656334573;
        bh=3S0uB9G9k8MBbC7XnsUCg4y7RhFiZ6Yc8soH63wqshA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=N1z8zJTM5UGwNtIP1R3e5gS7gDpOnwxzbE5H9vAQi6R93pvQXHUxaqufEGcHvUf1V
         Lg6ib4cZ4+HLRrUkaVKsKj6am6b3MEDMmDNEpxFtzBRe7uLgByVgDWL3GthdIuDng5
         l0Qg0GHskc6CIj9jIpvWgBldyRHp7OouTQyz1NQqgRaXnBjDLrq+cL7MR8N5jCHTpE
         hWRYpLmHtjJ9nSkcsyMjESBZj4KCcaFRwtv/DGx21AyKgXTFPvBQGbYI2YBOhAMl/p
         k1ZHLljfoc20lQCRAUj5s1NG+kfMX3slfRlgJLN6LA5l251hz73H/21YZcVxpeiDFO
         F7Rat8Qi3el3g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 68FB8C05FD5; Mon, 27 Jun 2022 12:56:13 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216171] Hibernation not working because of xhci_hcd
Date:   Mon, 27 Jun 2022 12:56:13 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216171-208809-dzZnJrRf8D@https.bugzilla.kernel.org/>
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

--- Comment #2 from Przemyslaw Kopa (prz.kopa@gmail.com) ---
Created attachment 301288
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301288&action=3Dedit
Dmesg with dynamic debug enabled

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
