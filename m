Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56D5F526342
	for <lists+linux-usb@lfdr.de>; Fri, 13 May 2022 15:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380823AbiEMNjJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 May 2022 09:39:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381243AbiEMNdj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 May 2022 09:33:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C628A64C4
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 06:33:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 69AFE62046
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 13:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5ADAC34100
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 13:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652448816;
        bh=/aTfOhq1cx5BxG2R1EVu64i6aXT7bKmKuAW1q+nb3QA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gPp8tcx10RDYCwzTGKx+XPVuGt2C4jlfQoZKc0Z+QeQ4SS7ttw7knz017WyRDrDVP
         IzW14FHKswR39nW3JH7OgbtY01QZ7isGoJTC9/sqQEv0SBlDx7YVVy6wxPq/sE5ynV
         xZY8Vy7sZ14vY3FaJm3KkpPakmvENiEt8wqVaMXDDxiNmtZFPT9gkHtjlVS+6erWON
         iJvjfQzg4RhoRsrGovjBhREJX5b3OxeXfQKGrYP7tYJjdQQPRCfLBHd37U+cloQlT1
         o5L1UCUOluu+52ITiw//hSRrqusejwOjBQmzP0fHbCoW+a01SjLWWPG3Wl/vY3Lq4F
         i6jl0Mz8+Nomw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AD882CAC6E2; Fri, 13 May 2022 13:33:36 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215890] Regression in 5.18: bcm5974 trackpad causes error:
 xhci_hcd rejecting DMA map of vmalloc memory
Date:   Fri, 13 May 2022 13:33:36 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215890-208809-h4yaAGmWkV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215890-208809@https.bugzilla.kernel.org/>
References: <bug-215890-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215890

--- Comment #12 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Created attachment 300952
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300952&action=3Dedit
bcm5974_add_urb_flag

quick testpatch that just adds the missing URB flags,
Does it work? I don't have this hardware myself

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
