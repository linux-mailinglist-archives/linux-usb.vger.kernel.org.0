Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FCD058189E
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jul 2022 19:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239438AbiGZRjL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Jul 2022 13:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239600AbiGZRjB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Jul 2022 13:39:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BCCD2F023
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 10:38:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 10AD160FFB
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 17:38:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7218BC433D7
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 17:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658857133;
        bh=QBKEMq70VG15gDOIB66Uc7Hcx6smAZnOvip79DCb9r4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=iGpPJiJh/PPOVCQNYuojYgw+LXxAiCjWeH7si97LnCwnwJpi5YqZqzj+mXS6cOra4
         i4kCl3QiIkDrtk4ffogMMHE9hOOw5wGDWvsI68uHGgFMR79a8uNvrffNSEuxHshFVm
         uYDVQc+x1nJAKkpC8SXGgasAdAYDyBYZ2FUkY6Pv//eOEL6jG5rD8LLM9S0VD6eYY5
         lORA12QQnghJePzQEPjNFEZ90jwLGzvBhQZoBMQ0pfm5ZiYculkHdmg2UpiuD0Krdy
         8eqtz9NKalu9jEjqpxirDO4Lyc+UGpGSUtJB74cmLugyEf/2MU7ljCXPtfxtvPpn6Z
         xyM2DTEd/EN1w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 55670C433E4; Tue, 26 Jul 2022 17:38:53 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216282] usb-mass storage
Date:   Tue, 26 Jul 2022 17:38:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216282-208809-tOtAd0qdwc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216282-208809@https.bugzilla.kernel.org/>
References: <bug-216282-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216282

--- Comment #10 from Alan Stern (stern@rowland.harvard.edu) ---
Your system probably didn't mount debugfs for you.  You'll have to do:

   mount -t debugfs none /sys/kernel/debug

first.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
