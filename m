Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA5A6FE727
	for <lists+linux-usb@lfdr.de>; Thu, 11 May 2023 00:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232395AbjEJWZy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 May 2023 18:25:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbjEJWZx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 May 2023 18:25:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACA6330C1
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 15:25:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4263563D15
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 22:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F4E9C433D2
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 22:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683757551;
        bh=vebIj9BP2lDdQF6Cx8zZvUI4N28Kwq+czp42/MCV/BY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=bDtwzFCUj0YRI88o7sD+4mdYykqnxAfzIDRHGshoisZZvXanqrUrh9VXkm32L7KlJ
         j0UDOWpGUEbiIc/AUQeEfyJxskwp2GvMyqdCpckRRapupK7GF4UkQNFj0ey+RQOmxz
         Ix32lrmgCrVtgKQZdFPAfJ+JIC+yQ+K+NQU3jnklH88I3Qju3WolPAGzdofHsm5fJP
         o799ZiTaK4z+/cb8qB4wSZWK4kQhimEqv+6wd4YMJOuzLSZqncM4VOPm7Htg8Vc5yk
         gqkKpUR3HoxbPVF00c7ntMSDY0fpcqQeN/iQ+hTfLph3maxQWKkA0cgQhRiIwLKlpa
         swCP0SvlrrOiA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7D736C43141; Wed, 10 May 2023 22:25:51 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Wed, 10 May 2023 22:25:51 +0000
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
Message-ID: <bug-217122-208809-wryLph8V3t@https.bugzilla.kernel.org/>
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

--- Comment #20 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
That commit has already gone to stable kernels.

But for completeness's sake I think it would be good to re-enable TPM on a
failing kernel and then try to apply that patch and confirm it's really fix=
ed
by that.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
