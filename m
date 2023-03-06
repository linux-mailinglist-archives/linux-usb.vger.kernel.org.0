Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4E736ACFDE
	for <lists+linux-usb@lfdr.de>; Mon,  6 Mar 2023 22:10:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbjCFVKI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Mar 2023 16:10:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbjCFVKA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Mar 2023 16:10:00 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 666BA3CE14
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 13:09:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 297FCB81131
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 21:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C47EDC433D2
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 21:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678136996;
        bh=NDb8vvO7Xe3k8m4hmaXbsd0SwNNFBzq302mwoT9KtIo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=M9rfrHJaj42WT3WNXd5LV9Xsw9qREjabq/8FDuVmuoCpaD7L/s/BOLJJOkndtqfsR
         I17LXfPC7TPsXS+QRS8XllXd5S8sxrOhcYldLVRQRTYb8zavilyeCEdOJkNZoEo5kC
         e4eZdF7HNXcvRe+InvvgCs2k85u07Kdl50dLAcyteeNB+dCOSmmasSpCtL9WIiaUeD
         LyOPGfJqS10kKOqcvTwl3UgIINPiJIdSIIeZfEM6N+Lb35Pjioosjk/nnKw5/PU0Su
         HeMaHF1wQisWpoAsI5ufxmSzsMNrQdcsiZ06iuMgZk9o+8vCmCMSIWhqlcGt0c14Yd
         h/UFdexWFDzpw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AB386C43141; Mon,  6 Mar 2023 21:09:56 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Mon, 06 Mar 2023 21:09:56 +0000
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
Message-ID: <bug-217122-208809-iTRRfwygdE@https.bugzilla.kernel.org/>
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

--- Comment #6 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> So power management does not seem to be the root cause.

OK, good.

>reagrding bisect, should i mark 6.0 as good or 6.0.19?

6.0.19 might not strictly have everything that is in 6.1/6.2.  There are th=
ings
that could be there from 6.3-rc1 as well.

So it's best IMO to set 6.0 as good and 6.1 as bad.

>and I am willing to go throught the maybe lengthy process.

Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
