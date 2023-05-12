Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5AF4700D84
	for <lists+linux-usb@lfdr.de>; Fri, 12 May 2023 19:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232730AbjELRAI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 May 2023 13:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbjELRAH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 May 2023 13:00:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 495F23C23
        for <linux-usb@vger.kernel.org>; Fri, 12 May 2023 10:00:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C80B8645D1
        for <linux-usb@vger.kernel.org>; Fri, 12 May 2023 17:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BD60C433EF
        for <linux-usb@vger.kernel.org>; Fri, 12 May 2023 17:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683910805;
        bh=MRTamIUp+M7dqYDg0LHS57sMtg7FJb9bBo84Z3/oDPQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=GBfU7LZJtMA4u9blzO9vHvF2STCumC/m2Szwj323FAwNvrv1qSXrtkB5eJJJDY1uC
         Ys+8h72Ael8hwekfdvaU2Gi6a9JVnpYUlK4aBiD9ZYRGob3nRN1vAMEkBaKNc1Fxuz
         oc1bXmQWeyJoO+tpuWS5fOegikhSUc1mgDwVpzTA9RX9PdDUisKkhvwggmRZm/NNC9
         rB468d8PB5Zhy+c1mQx3XogrrOF3V0vDHvq58PfgTMtVAwwpl/f/YfvVnXKu3VET2I
         cHY1oY5uksVxHcqlf17Lsi1wYdofSC7gLs8t00RTv5K0KNrA7CnOJVuBdRg0d5lM19
         1/FRXHA128row==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0E073C43141; Fri, 12 May 2023 17:00:05 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Fri, 12 May 2023 17:00:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: resolution
Message-ID: <bug-217122-208809-CnBztNPQMb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217122-208809@https.bugzilla.kernel.org/>
References: <bug-217122-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217122

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|PATCH_ALREADY_AVAILABLE     |DUPLICATE

--- Comment #27 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---


*** This bug has been marked as a duplicate of bug 216989 ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
