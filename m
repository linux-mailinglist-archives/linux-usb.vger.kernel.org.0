Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0720A765375
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jul 2023 14:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233821AbjG0MUA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jul 2023 08:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232856AbjG0MT7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jul 2023 08:19:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7DC52D43
        for <linux-usb@vger.kernel.org>; Thu, 27 Jul 2023 05:19:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7C1B161E39
        for <linux-usb@vger.kernel.org>; Thu, 27 Jul 2023 12:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2E18C433C7
        for <linux-usb@vger.kernel.org>; Thu, 27 Jul 2023 12:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690460397;
        bh=k0aJGSu647TCNXip+QOPNDAb7CwqGZFYiL+kTL9eU5E=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=PNwG/h+IZDUKm4Uoz0iy+Y2BFUs1x9LLHFwZteUS28iLZ6/2mdAmOXR7Bjc7ChCtb
         H0Mf8iV+DKuFvhf6VSmM6CBj4zolB1VLO79xBPtFN0Z/Lt9lBJ36w9e+JyOp1zVNgd
         o1slt72Bp59i6ptmXQj8pRAlMcqXKG2TR+mbePBADka256xAR9GYSHd/DC+uhn10Na
         /GqHeOcTDTstHvThBslsr7XriKuMBOhm0wDiwu5BYWZVrLqeVZka/rN6pUc79qI362
         zStvl7mc/pzMEQc1amtHGmLVx+hLXNEe/Fevz7qCt+7HnkwTNyy0tKHUOr3YV/0Usk
         ku97kyyRbk00g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C6868C4332E; Thu, 27 Jul 2023 12:19:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217715] USB from Thunderbolt 2 dock disconnects (xHCI host not
 responding)
Date:   Thu, 27 Jul 2023 12:19:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: youp1one1@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217715-208809-9SjqRVM3pz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217715-208809@https.bugzilla.kernel.org/>
References: <bug-217715-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217715

--- Comment #4 from youp1one1@gmail.com ---
Thank you for your response.

I attached both files. Note that I only have USB audio attached to the dock=
 for
these files. The end of dmesg shows me replugging the TB3 cable.

I will test later with v6.5-rc3 and report.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
