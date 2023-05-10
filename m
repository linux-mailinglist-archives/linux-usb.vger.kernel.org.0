Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 569836FE67B
	for <lists+linux-usb@lfdr.de>; Wed, 10 May 2023 23:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235540AbjEJVwy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 May 2023 17:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230016AbjEJVwx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 May 2023 17:52:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3B6846A5
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 14:52:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 635FD6134C
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 21:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBF00C433D2
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 21:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683755571;
        bh=OjtEjdP059egPw3IK/hLU1zUq1wdXjhSHeq6Uo0EWZ4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=JLBEWwPiS+9pDGngS5e7yJwn7tDAkJhpTMDQIo4Mb00fskCIrgbjaR6A08GtsDgJt
         NcvU6zkL8ZmUceoSxeeB7ksD9hk/RAU/d+EQ89FY1Ud1zOTqPC1QjzRY5VBJRcm2Qw
         x/Q6wibbTKfbXJ0ShDH1FiHFauCE1oHgJ3I3scBrlDzETrRqvcj1tXCF0hzGstMO4D
         7yR7c6QNnkKKdF3CufyGanqDF+OkiPf7edA3mXI+aiUjPU4QuVPHGeKaugJIKguz/k
         tjKMwl8RuHrcUXzA89iybvQfUScEyApmurF8cRLWuAfZYgsV7QVjarjOG+JdZ7G8j0
         6ifLkphrpMIKg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AC66AC43142; Wed, 10 May 2023 21:52:51 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Wed, 10 May 2023 21:52:51 +0000
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
Message-ID: <bug-217122-208809-3Qfo6Fwinq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217122-208809@https.bugzilla.kernel.org/>
References: <bug-217122-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217122

--- Comment #17 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> I found an option in the BIOS named "AMD security processor" - disabled it
> and I will test now...

If you disabled it and no longer have a /dev/tpm0 then yes that's the corre=
ct
option.

>  If that does still fail I will apply "f1324bbc4011 ("tpm: disable hwrng =
for
>  fTPM on some AMD designs")"

OK.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
