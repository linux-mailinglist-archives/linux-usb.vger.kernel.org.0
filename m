Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 571AB700D26
	for <lists+linux-usb@lfdr.de>; Fri, 12 May 2023 18:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235698AbjELQiP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 May 2023 12:38:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236716AbjELQiN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 May 2023 12:38:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 374D08A7E
        for <linux-usb@vger.kernel.org>; Fri, 12 May 2023 09:38:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C79F763BBD
        for <linux-usb@vger.kernel.org>; Fri, 12 May 2023 16:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 272B4C433D2
        for <linux-usb@vger.kernel.org>; Fri, 12 May 2023 16:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683909491;
        bh=cJ/I9kiiw+1Xw3/UT+ncSmLoo2N0w+cvXeVqKSSQKy0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=D9V1DSDg43kTeBNh98YNnAS39t2xxRHRNuPUkY+kd5aNN6mcBDVugur2zKZ8Kmh4I
         s5cB7KGJusqmhRl7JQ8hGyFmuCH1uQCMV+rzpsUMCvM0R3CC5g2VmIZdbgsifMcjyd
         NNTwzC34vIQf8YG4i/3IBxR0Whonitbo/F1S8rjXnqpdkNMD3bp8OZDdJ4njVGf0KT
         /kLcWKEk2SfFax5D2bDuhGTRdVzU2JHrLSoZ3M4yURtX30CxKYGecTixM0nLa5T1Df
         V7sPckehrAYtWiV1A5NXhgNcUYZTn3u54zLzXXJJHxTjEYjlNr2A25RdqcdP4iCHLr
         /uwEdk7NHOt2g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 042FBC43141; Fri, 12 May 2023 16:38:10 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Fri, 12 May 2023 16:38:10 +0000
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
Message-ID: <bug-217122-208809-9396CKHfuL@https.bugzilla.kernel.org/>
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

--- Comment #24 from J=C3=BCrgen Herrmann (t-5@t-5.eu) ---
I re-enabled TPM (confirmed by having /dev/tpm0) and applied the patch. Bug=
 is
gone.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
