Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 531406AC08B
	for <lists+linux-usb@lfdr.de>; Mon,  6 Mar 2023 14:15:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbjCFNPn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Mar 2023 08:15:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbjCFNPm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Mar 2023 08:15:42 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 947EE2CC7E
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 05:15:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2893360EEE
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 13:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A521C4339B
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 13:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678108524;
        bh=lc+brChpp7eNN3Ex8kG/VEzTtU2iDBLEklCY80BpDvI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jCD14xYLzl/My9ZXuNbPVTGS9CqLXZlAEf1Rrwes67o0h3YKA0DhfcDq2/Kww4zyp
         xfG5f+Hp52efoa1Bk6gwpu3s5lHTxWZWrLgD8S2dMwOyHfrez/UR5uB85UZftKWYlG
         maCmIrV9ZBbosIt5gWad41hEH1yKNubps+GioG+40vTVH52t5Vy3z2rA7Dd65B9rqR
         8OdHeY45a5kHxarXYCKkac0Ay8SQuAF5s4WwMXyCinNR4DNn3hsYiV4Rxu+rMdLONK
         U/o8aSOoM6S1+mVrfFCQW/oLq1GjrlzT0ZVmLtHlqWyTMEhBrxckIYRKg03onfc8Lq
         dF9JthCmhRpCQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 69A29C43141; Mon,  6 Mar 2023 13:15:24 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Mon, 06 Mar 2023 13:15:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217122-208809-rpJ9eDDric@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217122-208809@https.bugzilla.kernel.org/>
References: <bug-217122-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217122

--- Comment #4 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> So I guess it is not runtime power management related? You say there was a
> policy change, how can I force the old policy on 6.2 to rule that out?

You can change /sys/bus/pci/drivers/${xhci_pci_device}/power/control from
"auto" to "on".

> And if a bisect is necessary can you point me to some information how to =
do
> it?

https://www.kernel.org/doc/html/next/admin-guide/bug-bisect.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
