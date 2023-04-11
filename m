Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3A4D6DDB48
	for <lists+linux-usb@lfdr.de>; Tue, 11 Apr 2023 14:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbjDKMyM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Apr 2023 08:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbjDKMyD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Apr 2023 08:54:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2CC540C1
        for <linux-usb@vger.kernel.org>; Tue, 11 Apr 2023 05:54:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4D70061E50
        for <linux-usb@vger.kernel.org>; Tue, 11 Apr 2023 12:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE479C433EF
        for <linux-usb@vger.kernel.org>; Tue, 11 Apr 2023 12:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681217641;
        bh=oRXOae3KhdRmOFQHUQdxIfwPEWJewHceQG3xVgYkJLo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=N6dw71en9ySCRNE9aSu3WGY9IZJ0SxXS980TiPxKVtlSeBJxbUJ7EoZ/gjLY1s1OT
         eD7W1Bt6NyOEVT4kH0fMXTft8i0wfoDF4JcCJkBVIPzdoXJpBLzd18oJiI3/TF+cCF
         1V4P1+vD11WNE4UWE2Qr8M+ZpaF2m4/5EqO31QxJaJRW7hQCa//txf4a1zh+ZoEc5s
         emxz4bV0mjDAucgNFKp3o9kkMjYuvsChqcIwvBQgUs8SsUuR3r20FduilHD/10LCY5
         y9f3+aXZurfN1jImLzXtGFHIfiybt6VadUu6jFOvGzMqGy3M4MpFb9CmqJWhbysAcR
         wNI+4uGI2fegw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9441FC43143; Tue, 11 Apr 2023 12:54:01 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Tue, 11 Apr 2023 12:54:01 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217242-208809-Pp0NbxSx1J@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

Mathias Nyman (mathias.nyman@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mathias.nyman@linux.intel.c
                   |                            |om

--- Comment #14 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Looks like it gets stuck during xhci ring expansion.

During ring expansion the xhci driver allocates memory with spinlock held u=
sing
dma_pool_zalloc(.., GFP_ATOMIC, ...)

This apparently never completes, so spinlock isn't released.
Any URBs queued for xhci after this will spin forever trying to take the lo=
ck,
lockin up that CPU.

The xhci ring expansion code looks broken, the calculation of new ring segm=
ents
needed is incorrect, may be huge.

Also I don't think we should need to expand the ring buffer in this case. T=
here
might be some bug in how driver keeps track on free trbs.

I'll write a debugging patch that that tracks free trbs and expansion value=
s.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
