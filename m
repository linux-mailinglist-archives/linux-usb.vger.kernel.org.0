Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB617658D08
	for <lists+linux-usb@lfdr.de>; Thu, 29 Dec 2022 14:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbiL2NNt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Dec 2022 08:13:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiL2NNs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Dec 2022 08:13:48 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AF59B84C
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 05:13:46 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C91E16171B
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 13:13:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 382C1C433D2
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 13:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672319625;
        bh=JJVINartdA4qDjx7Wt3VwNphs4mFy+1H0GpmQnbjFE0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LGTqy+KRtIoEU2cEfANs314hNsOvyFI+QUcm4zeVL26PUtrx4qVJgtOYIkqVy/PzM
         eNW1MTIL9dFtNFOhaMDSe/hg+/9/JRGzEvsbcrDN/hwXYLrErHz2I6i18GizTc+wIt
         ZlfEc1FmVc+aIRF+Na193rjJ4+zt10WkKQf2MqTwOleI5KNG2YfOfHCGXxEKSN2LdO
         NHSLBSexwBj/aPF/Pg2mFLA1BOGT3XquRg3N96K40zDsp/tyJx08bj76TkO0emQ2zk
         rnYD/mjM1LRH5zuJJZWTHB9jNQ9qooHwmrAqRQzDUhoaAHl0VzKKBpE2Pv4CX5bAwT
         gaR7OOYw4NL3Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0CD35C43142; Thu, 29 Dec 2022 13:13:45 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216474] Dell XPS 13 9360/Dell DA300: USB Type-C: PCIe Bus
 Error: severity=Corrected, type=Data Link Layer, (Receiver ID)
Date:   Thu, 29 Dec 2022 13:13:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: frederick888@tsundere.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216474-208809-yNUbCo6lO8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216474-208809@https.bugzilla.kernel.org/>
References: <bug-216474-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216474

--- Comment #5 from Frederick Zhang (frederick888@tsundere.moe) ---
(In reply to Paul Menzel from comment #3)
> As it=E2=80=99s another device, please create a separate bug report (and =
reference
> it here).

Sure thing: bug 216863

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
