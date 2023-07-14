Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB1A753BCE
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jul 2023 15:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235481AbjGNN3C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Jul 2023 09:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234638AbjGNN3B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Jul 2023 09:29:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ECCE2690
        for <linux-usb@vger.kernel.org>; Fri, 14 Jul 2023 06:29:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E7D5361D0A
        for <linux-usb@vger.kernel.org>; Fri, 14 Jul 2023 13:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53475C433C7
        for <linux-usb@vger.kernel.org>; Fri, 14 Jul 2023 13:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689341339;
        bh=BtWOa07mQzCZu5ZCcWj4Q94IbmvVRk6T+Qjd4jeZzDw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=TiUlRW5Q4hoXBw3TBuckJtA0DBJRCU4H47W3GyoVLY6CbszFC8riwAmtUBJG/Czwi
         czexwJLJRlGu2EKNhGcMfjk8Zq7PTUzH00rucBUJCPD9wtw/IP8yDhiWogADd56LeZ
         +KMWd2Mgzu7qhKT/Frr27MdbWG44J8tWITd35ovw7GapatSW7L3zMo8Z7TQBicNZmr
         FBOj2gYLvn51Q5hDs8wjaVnq+QQYBrflZ5ivEZhrkCiCx/k7dpc51XjLeVQFtGEvay
         4krIY0QQw4ZVhVexCk6jDUvNKU4eID3/rrHTZAgVKuySToNMo+7lNTb1loYSv3z/N2
         kDej+7bTKDZ5w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 34C5DC4332E; Fri, 14 Jul 2023 13:28:59 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217670] dwc3: regression in USB DWC3 driver in kernel 5.15
 branch
Date:   Fri, 14 Jul 2023 13:28:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tomasz.rostanski@thalesgroup.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217670-208809-wXkjuAPOVY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217670-208809@https.bugzilla.kernel.org/>
References: <bug-217670-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217670

--- Comment #1 from Tomasz Rostanski (tomasz.rostanski@thalesgroup.com) ---
Created attachment 304637
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304637&action=3Dedit
dmesg with USB 3.2 stick inserted

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
