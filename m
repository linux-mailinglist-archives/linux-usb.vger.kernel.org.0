Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0E076D2C2
	for <lists+linux-usb@lfdr.de>; Wed,  2 Aug 2023 17:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231377AbjHBPsj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Aug 2023 11:48:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232069AbjHBPsi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Aug 2023 11:48:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E83D1735
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 08:48:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2CCD6619F7
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 15:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92CB6C433C8
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 15:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690991316;
        bh=3G0vddTpX3jHuvi+FezKfW4GUBZpeeK2M/Olirb5UtE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=GOf+D8ib5Z4q931+WleAboWOP7hYsWVbWgR86fCbH8danGZtfnZbVcdPA0OmIjYUS
         MiRu/zuQJ3fd3LD16iNIe5VhtIoeyF0r49mIO4tfWXJQ0r13Jew+JQsNgn2DSYIRvr
         YvhFib7Jg79Nke4OKuFjNPpPt650w6EmX+l130Tfl33BKQeCZMC/RDVTz/r64GrjqK
         W3LKYWBDLCto375Qp0+JWT8liNN3Xsj4CWATdWy5ti69ZCEJHE+51hqZT/YO5jgU7h
         mHVQ8TzCBCEh+rWT9oc8TW544OA/poHsFjTN5G3g3eJOl1kVZ8zHwUFJuaic4JjuUc
         0EE6ynIJiAagg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 78254C4332E; Wed,  2 Aug 2023 15:48:36 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Wed, 02 Aug 2023 15:48:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ZeroBeat@gmx.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217122-208809-VfNTyJ2BHq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217122-208809@https.bugzilla.kernel.org/>
References: <bug-217122-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217122

Michael (ZeroBeat@gmx.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ZeroBeat@gmx.de

--- Comment #28 from Michael (ZeroBeat@gmx.de) ---
Is this regression fixed?

I'm asking because I got this issue report:
https://github.com/ZerBea/hcxdumptool/issues/334

dmesg showing something similar:
[  143.833329] xhci_hcd 0000:00:0c.0: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 8 comp_code 13
[  143.833865] xhci_hcd 0000:00:0c.0: Looking for event-dma 00000000010a0070
trb-start 00000000010a0080 trb-end 00000000010a00b0 seg-start 00000000010a0=
000
seg-end 00000000010a0ff0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
