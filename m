Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73E27772A4C
	for <lists+linux-usb@lfdr.de>; Mon,  7 Aug 2023 18:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbjHGQPs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Aug 2023 12:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbjHGQPr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Aug 2023 12:15:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98A5F10FC
        for <linux-usb@vger.kernel.org>; Mon,  7 Aug 2023 09:15:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CEA9561EE5
        for <linux-usb@vger.kernel.org>; Mon,  7 Aug 2023 16:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37D61C433CA
        for <linux-usb@vger.kernel.org>; Mon,  7 Aug 2023 16:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691424942;
        bh=HS4qsRQho7VC2vuzoJNQcAMr5pPdLsoaLutfVf1ty3I=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=G6QoAxPBAuVW6MdaM6LzpAnhIYawrZrOE2+zOZqEWJscNwzB7DQLoNnm3zK1ExuiS
         zWO5BGJWtdG07xosa2Sax6hUhKimw3ditHdEoxhLMaB+dHRKit7xEi3UYXv0iGBKiU
         C+eKmwOPtt9Sz5GZLg/0rks/rRmwhB4Dljaua+JDG5j422copIK8MButZHyR6Ui8nf
         hSZBWwMhL0yDgAr2J2gIf6gTKoGiIdZGOK/p6Mc3R39SPrcyG0jaQyr2CbqoeXpbDH
         O+Nj1EkgYO2bK09SCFIPG+TereChTThZLidb6BBmbA/GM6v8i7cyVO+0cnpPiZLIDT
         hBSqqfQqxIZTA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1DE35C4332E; Mon,  7 Aug 2023 16:15:42 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Mon, 07 Aug 2023 16:15:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ZeroBeat@gmx.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217122-208809-LCreAwYOgb@https.bugzilla.kernel.org/>
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

--- Comment #34 from Michael (ZeroBeat@gmx.de) ---
Thanks.
I informed the user and advised him to join us here:
https://github.com/ZerBea/hcxdumptool/issues/334#issuecomment-1668171443

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
