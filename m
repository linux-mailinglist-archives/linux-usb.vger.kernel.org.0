Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1E755E86EC
	for <lists+linux-usb@lfdr.de>; Sat, 24 Sep 2022 03:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232893AbiIXBHq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Sep 2022 21:07:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232824AbiIXBHg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Sep 2022 21:07:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49C321332FC
        for <linux-usb@vger.kernel.org>; Fri, 23 Sep 2022 18:07:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D36C8B8210D
        for <linux-usb@vger.kernel.org>; Sat, 24 Sep 2022 01:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6DE2AC433D7
        for <linux-usb@vger.kernel.org>; Sat, 24 Sep 2022 01:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663981650;
        bh=L82j8ak7Y+QnPOx6umcX0t5HIYRTJeVYgNpHfDCGHZI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=aQHuB13PJW9hO59YZkP3DNvKJZG5FgzZ/gvq5MPJJRJ2b9jBrZCZNnskOvUEJLWvF
         0BTjgD6oJVRVNTO5ODQlH01SEh/yBzpnRxmoH7cVCSD0WoigP81wRiS3CMQHkniIPA
         2b168TnvWL5ZG/8AbFUgpqIBoSmYnCu2imxdP/iGGqxrlGQhjzvUpTsVkS1bzwoX2q
         ehspZECsuMAnLeblOZyOezxLIOh8vrxXpfwlv2iTUGgsP4KwY4NaRtrsQ3i3qRwWN4
         ID0/M2l2mgq7++PiaA5gxLV4Ih0huFBYrHusvzcwkxfp64cUTC11Yl46emsskKIGvD
         7oUYZEM3VxjEQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 60651C433E4; Sat, 24 Sep 2022 01:07:30 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215490] Logitech Brio doesn't initialise on USB 3.0 port of
 Asus M5A97 Evo R2.0
Date:   Sat, 24 Sep 2022 01:07:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: collinm@laboiteaprog.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215490-208809-0EU1vCxYwP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215490-208809@https.bugzilla.kernel.org/>
References: <bug-215490-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215490

Marc Collin (collinm@laboiteaprog.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |collinm@laboiteaprog.com

--- Comment #4 from Marc Collin (collinm@laboiteaprog.com) ---
i have the same issue with kernel 5.19.8 with a lenovo mini5i

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
