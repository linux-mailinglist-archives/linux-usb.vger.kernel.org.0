Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 771E0528400
	for <lists+linux-usb@lfdr.de>; Mon, 16 May 2022 14:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241183AbiEPMSE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 May 2022 08:18:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbiEPMSD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 May 2022 08:18:03 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0E6D2BB20
        for <linux-usb@vger.kernel.org>; Mon, 16 May 2022 05:18:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AE9A6B80E87
        for <linux-usb@vger.kernel.org>; Mon, 16 May 2022 12:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7BFC8C385B8
        for <linux-usb@vger.kernel.org>; Mon, 16 May 2022 12:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652703479;
        bh=1Il1sTL8Pw5YGNBpIwAqHWOkpLsTC6VchCusRwI9Ikk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jfK+AsW89iPsL+QRWU507EBb/6kDaNIfKNOnyPKoHMICGpwaLmJ855bX4iVsbrdZT
         mLwECPFtRy4ZXkR4+NIjQfg92tVEbcj9iAb96oEJ//BXf6kB0XxuhSG4C2ZCFW+6kg
         igMQ+bcO+V/JoBVn0e4HTSwCJFjt53qV1hAkS09Ta1c7mzXPj+lgQD2/LmejT1/tMo
         sBS5dQLpFC7UUa/oyitUYozgw3oAkxR0DPjlj4F6E/J9Ybyi++k4/zg2lZDnTOrWlU
         fiSvnY/ONmO6iZJJWBIvHFxSLFYWMguL8xvQob7bWzHloOYUGUbt1WUaALnPA+quqy
         hpvoO9bS+uIuw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6B33DC05FD2; Mon, 16 May 2022 12:17:59 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215890] Regression in 5.18: bcm5974 trackpad causes error:
 xhci_hcd rejecting DMA map of vmalloc memory
Date:   Mon, 16 May 2022 12:17:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: satadru@umich.edu
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215890-208809-K3LOnodIrO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215890-208809@https.bugzilla.kernel.org/>
References: <bug-215890-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215890

--- Comment #20 from Satadru Pramanik (satadru@umich.edu) ---
sudo libinput list-devices also shows the correct information:

Device:           bcm5974
Kernel:           /dev/input/event9
Group:            6
Seat:             seat0, default
Size:             107x75mm
Capabilities:     pointer gesture
Tap-to-click:     disabled
Tap-and-drag:     enabled
Tap drag lock:    disabled
Left-handed:      disabled
Nat.scrolling:    disabled
Middle emulation: disabled
Calibration:      n/a
Scroll methods:   *two-finger edge=20
Click methods:    button-areas *clickfinger=20
Disable-w-typing: enabled
Accel profiles:   flat *adaptive
Rotation:         n/a

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
