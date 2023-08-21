Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D668B78311C
	for <lists+linux-usb@lfdr.de>; Mon, 21 Aug 2023 21:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbjHUTTb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Aug 2023 15:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjHUTTb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Aug 2023 15:19:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B0CC18D
        for <linux-usb@vger.kernel.org>; Mon, 21 Aug 2023 12:19:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DEFAA6433D
        for <linux-usb@vger.kernel.org>; Mon, 21 Aug 2023 19:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C9C7C433C8
        for <linux-usb@vger.kernel.org>; Mon, 21 Aug 2023 19:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692645558;
        bh=4M8i8Da2deQfEzDp1ureZCnSwqQQs/IqaDeoCrK7FcY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jshdIEjhVECGpjyu+xB2gS7PThJ0+mD+ht2CbR81Y/o6An2JoDUww1NlXfpAMQldt
         roO7IlUeJTQtgD/i8Q1mHtufa/nXzmApqfWAzlBLQSQXbp2JpKFmB94YFUFeDTrtSi
         XRW/VsCOh+KlykbUYoxIyAk+VsWZgOj2kNvJfXEjuacpVf46S0m7sDv/w1SghHE06j
         u9O5kzNiKwJPcK+F459fhJcOKMyNywS6pWODcVROpH01XrYGvkapxni89/DqtlQGGX
         euJZrBXMNWuX7/QyRZinFxVBSyMSF4g5979CKSVTsbsdIDO5K+HR0z30PZ4+I9jyKC
         L9TRkBIMvJ2MA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2978EC4332E; Mon, 21 Aug 2023 19:19:18 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217811] usbhid driver misses right-click event for Rapoo
 wireless mouse
Date:   Mon, 21 Aug 2023 19:19:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.byrecki@techniline.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217811-208809-QhfuvXIKKc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217811-208809@https.bugzilla.kernel.org/>
References: <bug-217811-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217811

--- Comment #3 from Michal Byrecki (michal.byrecki@techniline.com) ---
Today I workaround a bit of the problem.
I've tested the mouse microswitch using a multimeter, it is definitely ok (=
the
closed contact is less than one Ohm). Then I've attached the mouse to a lap=
top
with Windows 7, same problem - missing the right click.
Honestly, I have no idea where's the problem. It seems hardware related.
I think it's time to close my bug report, sorry for disrupting Your coding.
Brgds Mike

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
