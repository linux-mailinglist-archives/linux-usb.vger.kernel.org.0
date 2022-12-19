Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 803666506DF
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 04:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231230AbiLSDnj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 18 Dec 2022 22:43:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231179AbiLSDnh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 18 Dec 2022 22:43:37 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2631DAE5F
        for <linux-usb@vger.kernel.org>; Sun, 18 Dec 2022 19:43:37 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B507B60E05
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 03:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A4A5C433EF
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 03:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671421416;
        bh=9D1GhRZuWhRYF/MbwhVzeLglMbSLs/hFVCJ4y7bFTDA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=nSyO9r9nI7q6VKAp3zlQFIkReh50oEzu5vleWrnCDbhKWdUvnMiGskHYKvx7YWsxA
         ETNOXfQrsFM7tRCUu7eDNhhvPeRWX0naaG8LN4L+mh57GBqBu6tiUzOeyX8ji0pm0I
         WVGaWNOtSwabyEstkkkEZwp2TWasqz3lLmxAeU4o2qvcAdNO94/jFXUD2blHHxwJvE
         B9GZ2LRHdgwl/wuguk7k1GkHbr9JRq2pjfY+7AwaC2ApVqezinJFT41NC5KSxsg4iI
         2Fn+/nxa/hr8Vjiyx2VDikcuJQbDVZ5stBvUEGP4zyMfTE2XYQrtS37v7DklghEdho
         pV0V2Sk/W+ahg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id F12C9C43141; Mon, 19 Dec 2022 03:43:35 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216822] Thunderbolt USB Controller (Maple Ridge) and its
 upstream pcie port fail to runtime resume
Date:   Mon, 19 Dec 2022 03:43:35 +0000
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
Message-ID: <bug-216822-208809-ZELR34mK6b@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216822-208809@https.bugzilla.kernel.org/>
References: <bug-216822-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216822

--- Comment #2 from Chris Chiu (chris.chiu@canonical.com) ---
Created attachment 303428
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303428&action=3Dedit
kernel log while booting with a usb storage connected to usb4

The usb-c storage can be detected during boot. But it can't be detected aft=
er
re-plug the same device.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
