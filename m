Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 099B06E7E8A
	for <lists+linux-usb@lfdr.de>; Wed, 19 Apr 2023 17:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233158AbjDSPl6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Apr 2023 11:41:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233103AbjDSPl5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Apr 2023 11:41:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B46CC5FD2
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 08:41:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 51080637B8
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 15:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B567AC4339B
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 15:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681918915;
        bh=PMldeax6QANEEwK96LmV6Z+PTilCTtgoE8DpC2nXTQ0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=aydi214Agj6xn1U5geMvZzV+Cju0usFt2R9C2FBVgWp4OazZBgQ2TOwHsOEXI9xrw
         f5X0hPYLbbDHsvOXMwYuOCeXV3axUUE40BX177GhPWMhHr3dDh52gs+f9A1mKlvprZ
         v1BRvS0ihDnHcNqe6l721vt9sH1dxvBY4OXf8Q9wDc0X5/ggX18Rbo+bxp7mu0YJnZ
         J3uImdRaN2mhE7//Diifw/z9mUQbC31brDw1CoODWAHCoutLc0X2U58CezldUKLeWI
         UiJ+njmWMuYwgtxVRcwXDoODKOt3xNvmZq8YNiyURMSRHuHXuj05PteOvcx+Fivwnu
         A+fBDRX/kqylg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8C7FDC43143; Wed, 19 Apr 2023 15:41:55 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Wed, 19 Apr 2023 15:41:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217242-208809-EvD2K6CuuU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #24 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Thanks, I see whats going on now.

Some transfers that are further ahead on the ring can simply be turned to n=
o-op
trbs by driver when cancelled. These are not added back to num_trbs_free.=
=20=20

This is the case when several URBs are queued for an endpoint and then
cancelled in reverse order.

I have a untested fix for this that goes on top of previous debug patch.
Can you try it out?

I'm also reworking this whole thing, but we need a small fix like this for
older stable kernels.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
