Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA5D54F949F
	for <lists+linux-usb@lfdr.de>; Fri,  8 Apr 2022 13:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235249AbiDHL5K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Apr 2022 07:57:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233147AbiDHL5I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Apr 2022 07:57:08 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8090F7DA90
        for <linux-usb@vger.kernel.org>; Fri,  8 Apr 2022 04:55:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 401D0B82A8E
        for <linux-usb@vger.kernel.org>; Fri,  8 Apr 2022 11:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0377EC385AB
        for <linux-usb@vger.kernel.org>; Fri,  8 Apr 2022 11:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649418901;
        bh=ztnBtepE0WUw6Rvu39eIbGdHoX7rTqSgARtUsNlMPrI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=A7c4yVhazTCCGquevMDTIOum9VAqucj4KsmWKgjZkimZHaF+sbRPEhKG8q0dlRDn+
         Y5M/YYR5KX3pYkM96xM/G9llcO00UNLTovrndYYROooC4pOw6h1vH4QXbQTE09hA4O
         NO9g6c71pWoF4pnsj2Oba8r1zn8eaBYcSOZjDgfVgJ4x/NKlZ+8IeRs/MstUjFX4pw
         eyhJF+iw4C1HrLMHuuTOyQV/BwYOlh3WOWFX8jJIEhtRKZTPGbsmVqZWwdFMSTj7mf
         KULANbC9ernAHxzb4W+dTQ2mhG9s2c4tchAgFc/pl4yWOvfEFMP6hpD4O3s5ZTBSTs
         RJn8MgZvPQlvA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id DE450CC13B0; Fri,  8 Apr 2022 11:55:00 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214021] The USB devices fail to be detected during boot
Date:   Fri, 08 Apr 2022 11:55:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214021-208809-vEb6pxnCFH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214021-208809@https.bugzilla.kernel.org/>
References: <bug-214021-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214021

--- Comment #19 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
The roothub deferring patches fixing this triggered a race, and were revert=
ed.
That race should now be fixed in 5.16-rc3 and in stable kernels with patche=
s:

6ae6dc22d2d1 ("usb: hub: Fix usb enumeration issue due to address0 race")
6cca13de26ee ("usb: hub: Fix locking issues with address0_mutex")

I'm planning on reapplying the roothub deferring patches but would
need some help testing them, making sure they work and not trigger any
new issues.

Patches attached (based on 5.18-rc1).

0001-usb-core-hcd-Add-support-for-deferring-roothub-regis.patch
0002-xhci-Set-HCD-flag-to-defer-primary-roothub-registrat.patch

Thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
