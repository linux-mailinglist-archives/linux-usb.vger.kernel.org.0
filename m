Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 922E5580A12
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jul 2022 05:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236868AbiGZDla (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Jul 2022 23:41:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231458AbiGZDl3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Jul 2022 23:41:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 298D1286E1
        for <linux-usb@vger.kernel.org>; Mon, 25 Jul 2022 20:41:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C2DCF60B8F
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 03:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2FB29C341C0
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 03:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658806888;
        bh=/PJ0R/mXmx41K9LIY55cTER9GBzSO0aI3x838xMO9W0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=a8Hvf9uOZFBnJCUpRFLIFSaZZu8Emj+vXegh6dF2v6g3sdcFxNYh1kkmBWALtFFHU
         IZXhncLoee3/poraQYFyGcyIq7y7c5CFVovEs6iuwy71hT3/sp7vzzVN0x2h6CuHoz
         mXUoCYfBaHwlXvlMFy54brRZSxBmbd20x7QfODABbHwmem+s72mlDRlWc6kvc0Biwu
         Bjqqar4yVmAbwF8S16fu18ehs7uYP4aLpJWKG/suo8EaT/rybt0c0bAxwfNpxUBqpK
         wfKCZCtABmpxuV2bAlkDcC7/e155roKcyHwV1Km71PV1nYCeI7n1xbWSYfOLeZHOdR
         faAMsJ2a/0pfA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 109B3C05FD2; Tue, 26 Jul 2022 03:41:28 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216282] usb-mass storage
Date:   Tue, 26 Jul 2022 03:41:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: audioprof2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216282-208809-3eyAxVCr4P@https.bugzilla.kernel.org/>
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

--- Comment #5 from audioprof2001@yahoo.com ---
[110025.067097] usb 2-4: USB disconnect, device number 10

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
