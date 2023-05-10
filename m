Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5D2D6FE676
	for <lists+linux-usb@lfdr.de>; Wed, 10 May 2023 23:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236008AbjEJVvH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 May 2023 17:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232030AbjEJVvG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 May 2023 17:51:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B5C646A2
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 14:51:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 16C4063A0B
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 21:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EEF8C433D2
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 21:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683755464;
        bh=fBqdcTzdj4Q+ygtkoPglACUDYd8ddGO7pGTpfc5P890=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dVhjxYwIvVHvbBGsT1c/BEm2hwKy0NLok3N0p4cQOTTcMe7jXYud2YaRhvPt8RDgK
         vx80+BWBzSRFTlHt2CJijCsCJfS1gP0QJYoQtld3WVl4lwg/Wm4wI3nbuQH+yOxQ33
         39g5K2CAkhf2sPSYiBN/cW5SSwZVM3SXwpVUnsxeVWFHpmgY6tinBw+XLKKyDG/LaL
         kXaDkV1o4Sm6btQ8ZwJ48GrW+1e+OarpqllVXvHpZ34M/RVDsXC37PjAI8+Fh8SYiH
         DwFc1S/UyJi1vB/QSGm9GjlToWJxtibfCnjRGANvPU0ckQAdmsqBcF7vnjAiqBxm0y
         GVifM9v/xmvAg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 351CFC43142; Wed, 10 May 2023 21:51:04 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Wed, 10 May 2023 21:51:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t-5@t-5.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217122-208809-PUEsIilSuS@https.bugzilla.kernel.org/>
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

--- Comment #16 from J=C3=BCrgen Herrmann (t-5@t-5.eu) ---
I cannot find anything about TPM in the BIOS. It's a lenovo laptop, If you =
need
the actual model, tell me - I will have to flip it on it's back to read it's
model number.

I found an option in the BIOS named "AMD security processor" - disabled it =
and
I will test now... Maybe it's the correct option. If that does still fail I
will apply "f1324bbc4011 ("tpm: disable hwrng for fTPM on some AMD designs"=
)"

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
