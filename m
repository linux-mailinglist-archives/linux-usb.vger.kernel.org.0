Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E49766506DA
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 04:40:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231179AbiLSDkb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 18 Dec 2022 22:40:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbiLSDka (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 18 Dec 2022 22:40:30 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDBA8A475
        for <linux-usb@vger.kernel.org>; Sun, 18 Dec 2022 19:40:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 93C21B80990
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 03:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39F3FC433D2
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 03:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671421226;
        bh=yT4tXeilc3TsLa47XMJiDfTwizEGQWcdtcLc0LhslD8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cruWRwtX/Mogde3uO20+zL9LwnaROqHidPjk4XXZUaD7X/TB+ll4hgVR+gHCy8bfY
         xvhamW9bAqx0sFmrDqrnmrnn9nQeOiRa/4VhC4rukhunn5tNmYr2U8B7zH4cOjJfgw
         7pOXYTgHIvNVybrp63ZsFib3oJZ1PcDAtAsXqj3N1yWcIBIZ6ePU/z0hujrsxGIOR9
         4AhGrQshahZN7KScX9vt9dpLIo3OSxx8xENHarAgoi7k67yKn3iGeIfM8Ztr1PYNBR
         qsa7WqJNNiEhr/OWQkbQ5ali6F1tm8RyLHTObdOJe4A0M7HTzRZPRUYh1GNpmi4lMJ
         uTELD6TWaqAiQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2808DC43141; Mon, 19 Dec 2022 03:40:26 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216822] Thunderbolt USB Controller (Maple Ridge) and its
 upstream pcie port fail to runtime resume
Date:   Mon, 19 Dec 2022 03:40:25 +0000
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
Message-ID: <bug-216822-208809-oNu8oUsefq@https.bugzilla.kernel.org/>
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

--- Comment #1 from Chris Chiu (chris.chiu@canonical.com) ---
Created attachment 303427
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303427&action=3Dedit
output of lspci -vvv

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
