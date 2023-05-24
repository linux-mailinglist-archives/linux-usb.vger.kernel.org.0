Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB1170F1DC
	for <lists+linux-usb@lfdr.de>; Wed, 24 May 2023 11:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240548AbjEXJLx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 May 2023 05:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240568AbjEXJLt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 May 2023 05:11:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF2EC97
        for <linux-usb@vger.kernel.org>; Wed, 24 May 2023 02:11:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5A78E63085
        for <linux-usb@vger.kernel.org>; Wed, 24 May 2023 09:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2704C4339B
        for <linux-usb@vger.kernel.org>; Wed, 24 May 2023 09:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684919507;
        bh=aWJ+aX984aXxVMCDDyW44M8/veBJMTP6PxV6JAUVEH0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=PPDHA7gYfMOeAwvkPiK5lwN234rqkmMOj0pjMSbrQL+omwlTB7EryoUjSfkgCU55i
         MeK+dLGPHIn4BY39tzc66A08oqsybxFkuLWGCaSYe2svF/orUuuG5o2C2ANpnOjXWa
         yVF6fNXxeaZJHysFovOr5yJSisHFCuxJESnnkidyBfSr6gsHWybStzo9L9f1p/lZ5m
         paVGH1g1RhlOiiLDR09mAHOXFkiQWv1dAtGpkj0KpW7+3AglGC3aQ2qsgw+KcQJBya
         oPLi/XLR6QiSfCtFreq94mSZIt4vV3G9sNKfEKwmGhV7UhdPo8faaDxNzHmFIBLa0y
         Kg9YoOrrqXmJA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A21B8C43142; Wed, 24 May 2023 09:11:47 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217475] Foxconn / Hon Hai Bluetooth adapter 0489:e0cd stops
 working on ThinkPad T14s AMD Gen1
Date:   Wed, 24 May 2023 09:11:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: berto@igalia.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217475-208809-4OFNOn9PaF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217475-208809@https.bugzilla.kernel.org/>
References: <bug-217475-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217475

--- Comment #3 from Alberto Garcia (berto@igalia.com) ---
One more thing: when it's working on Linux it seems to be reliable, at leas=
t I
have never had the situation where I'm listening to music and it suddenly s=
tops
working.

In my experience the problem appears when the adapter is disabled and then
re-enabled, either when the laptop is suspended or with the RF kill switch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
