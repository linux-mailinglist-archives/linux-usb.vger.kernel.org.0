Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7CD150DDA1
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 12:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232983AbiDYKLr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Apr 2022 06:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237219AbiDYKLo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 06:11:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD220BE18
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 03:08:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6AFE060C62
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 10:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C61BBC385B2
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 10:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650881312;
        bh=gjJywd6YA3a/GoRTAhKJU9drYZR8dhq4vNJn88m+aeI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=U2ojP1DEWfhnYgYFoUHJ6ikk96SYO57Y2QrEPLCThfFQBHl8jzHNNm3TzYEQgB9+a
         sIIRMpoSNI/LfCB95Wfts44/Ayau/nn9ZDydJQUNMs9sF7LBzoitKoT1WyBGQW9drl
         kk7jutbCX68pO7MLpsiT7N0lfR3b9C3vbCJ1tMguI76kHkJxqKlq3td+pexEBNQi0b
         4qJk2Bsy3Hf3tz+FLMzbtGoYyhIGWXq6nXsBz3NojbI3opbDLKNNlPYcUd8YArmHzI
         wwP1PIPgiQcehL8HOdxd1lbo/yKpgEbuI9odoOnk3tm4xoRLydSPcuKdk7ENvomGhM
         KM05wGx1Q6CwQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A6562CC13B0; Mon, 25 Apr 2022 10:08:32 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214021] The USB devices fail to be detected during boot
Date:   Mon, 25 Apr 2022 10:08:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214021-208809-Bq81OYVcy2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214021-208809@https.bugzilla.kernel.org/>
References: <bug-214021-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214021

--- Comment #24 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
(In reply to Hongyu Xie from comment #23)

> Reapplied on linux-next? Haven't seen this on linux-next.

As I said earlier, I'd like to get these patches tested and verified by som=
eone
who can trigger this issue before applying them.

Can you help me test them?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
