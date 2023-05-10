Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 010226FE723
	for <lists+linux-usb@lfdr.de>; Thu, 11 May 2023 00:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231562AbjEJWXh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 May 2023 18:23:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbjEJWXg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 May 2023 18:23:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90ABD2D53
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 15:23:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2C5CF636DE
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 22:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79C2CC433D2
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 22:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683757414;
        bh=1ODa2eF5x/wbUeqJhtXd59ibM9PlJMpQL90dpVPsNVk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=V3IJqrZNpUoCH8lUoFzsY444B6XRN4dLLbTyLkB4TPYkQ1uHHt/uEMhVn6r0KwbS5
         mOz8iorSl+934TXtaRjbq5nL5EQIeOtPuqd/LSs6PW2KUsSXskmcqFz919qzXgETtB
         a1O1Ayiyu9A07ITIYJDemN2nS1hioZcO8tA/cG/ACe39TOO5aCzLyBw5Z5wgVcvULJ
         N/z/ki8Ei0yadOTH1XN7qWjffIVVGGDBV2bVU66WKUqwAxSwKnQeMzNM9/9td0eZJP
         NifoSdjB6UJM6RRD7zUZ1RA01HUMPWg2zMA0J809fcjI2xujoFWSzc2fxL24yTP8lc
         XTlEhXy40u7Lw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 61C7FC43141; Wed, 10 May 2023 22:23:34 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Wed, 10 May 2023 22:23:34 +0000
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
Message-ID: <bug-217122-208809-9ioUM0W8K8@https.bugzilla.kernel.org/>
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

--- Comment #19 from J=C3=BCrgen Herrmann (t-5@t-5.eu) ---
6.1.0 (previously faulty) is running now with TPM disabled in the BIOS. If =
that
"fixes" the bug, do you want me to still apply f1324bbc4011 ("tpm: disable
hwrng for
 fTPM on some AMD designs")" and retest it with TPM re-enabled?

Or is this fix in newer kernels already?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
