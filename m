Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6A68613BE6
	for <lists+linux-usb@lfdr.de>; Mon, 31 Oct 2022 18:09:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231629AbiJaRJS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Oct 2022 13:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231574AbiJaRJQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Oct 2022 13:09:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE7B612D19
        for <linux-usb@vger.kernel.org>; Mon, 31 Oct 2022 10:09:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 59CD56133A
        for <linux-usb@vger.kernel.org>; Mon, 31 Oct 2022 17:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB6DCC43147
        for <linux-usb@vger.kernel.org>; Mon, 31 Oct 2022 17:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667236154;
        bh=24Fk0AsCTHyW+FKKiLaL0Xdi3m3s2LrMMJBs2uFqvF8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=VgIR4CujE1raY9sMG52fGhaim712CHmUMMt9UEVsqmPOwzFDD/DUcN9rm+4pqSCSI
         EKWoqj7YG5TdE7tLUijv2OFoEYPon/QplYeLIFtFu3YAGsHNWtfxtCh2nfAFv2Rg0v
         V5ho9vVI6lizQ3QSCL64Ey7OkxPFAVmrA1ct5JJ3g5XLXb3tkn7ZB6IT26k2cGVWqR
         mBv4cvAgQ9CRoEn4OprgGiV17TQCTaUnn/HlW+aQMJdy1Tf5Ip0/3lW7Zn8C9urdWB
         FMrbw0rBZiJmT0RynwOecOygcjDddV3vGrVyw1KfiPfEYPIYV3zcz3FIp2aFtqU2iY
         et1Fm1gXT7x+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A5416C433EA; Mon, 31 Oct 2022 17:09:14 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 203419] Logitech Group USB audio stopped working in 5.1-rc6
Date:   Mon, 31 Oct 2022 17:09:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: petenewcomb@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203419-208809-IG9Wfv6hl7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203419-208809@https.bugzilla.kernel.org/>
References: <bug-203419-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D203419

--- Comment #53 from Peter Newcomb (petenewcomb@gmail.com) ---
FWIW, I eventually discovered that after I updated the firmware of the devi=
ce I
no longer needed the patch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
