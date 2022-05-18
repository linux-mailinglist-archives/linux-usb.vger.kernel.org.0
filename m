Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9998E52B3F6
	for <lists+linux-usb@lfdr.de>; Wed, 18 May 2022 09:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232421AbiERHsj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 May 2022 03:48:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232477AbiERHsi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 May 2022 03:48:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED51AF24
        for <linux-usb@vger.kernel.org>; Wed, 18 May 2022 00:48:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8968961445
        for <linux-usb@vger.kernel.org>; Wed, 18 May 2022 07:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9C97C385A5
        for <linux-usb@vger.kernel.org>; Wed, 18 May 2022 07:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652860116;
        bh=55RfrtidOLP6jbEcngkzL1FxIYmbbPIv/5uA7vPNk8M=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=pW9EMSGMWBc1yzOoynAfCyZ/nHJNzpOm6d1fmCZsMG4z23bN6TA71xx7kMRDQnIfm
         umMPRY0pLn1ZZQ/k2vCurQvZ0JamCNCTKBAeYggI7GXf/yfvzoA1X2hJSZEdNCS95k
         6Rp5uylNO+7Q6iP0V/+CpLIn8ukHLe7vkmgsAv8uHVMv0ZnJoiGHSgRfnrQ0I+wy/0
         nDVJDntVAGQy8l8kvljp4cnTp2b6zsPjroRKLZ+uebD82SYPNtqbnWqab5eIoSpUGR
         ptn4gwBLRYzD04ZMtYLirkAUHl07FmZEIJipoMSO9sU6BO24cAB/qS1yhmwP4yqbV/
         78NVS3TH/2KLg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C4A9ACC13AF; Wed, 18 May 2022 07:48:36 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215890] Regression in 5.18: bcm5974 trackpad causes error:
 xhci_hcd rejecting DMA map of vmalloc memory
Date:   Wed, 18 May 2022 07:48:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215890-208809-IwB2kBJte8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215890-208809@https.bugzilla.kernel.org/>
References: <bug-215890-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215890

--- Comment #21 from The Linux kernel's regression tracker (Thorsten Leemhu=
is) (regressions@leemhuis.info) ---
(In reply to Satadru Pramanik from comment #19)
> I'm not sure what changed, but it is working on the ubuntu mainline build=
 of
> 5.18-rc7.

Maybe I just missed a change to fix this; or some change fixed this
accidentally (which was odd, but well, we are dealing with computers here..=
.).

Guess the matter can be considered resolved then.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
