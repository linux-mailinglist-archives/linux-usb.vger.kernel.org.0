Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC127550106
	for <lists+linux-usb@lfdr.de>; Sat, 18 Jun 2022 01:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382658AbiFQX44 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jun 2022 19:56:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383613AbiFQX4h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Jun 2022 19:56:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 407EE64D30
        for <linux-usb@vger.kernel.org>; Fri, 17 Jun 2022 16:56:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C629361DFB
        for <linux-usb@vger.kernel.org>; Fri, 17 Jun 2022 23:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30BD6C341CA
        for <linux-usb@vger.kernel.org>; Fri, 17 Jun 2022 23:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655510195;
        bh=iD6AvW7iqVlHnEuQK7CSGVtOyxZHqOC/W30DdGY/AEU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=nWXDQiFus9T6rYEhqQnR60vhg/b8SqROTD9UbUFa/i6M1rx/8wueL93LXiHsagTKB
         6cn3SdV/ymaNGblV3djpVya/s/MRaQjOUF+/wlF+QmZAz3m+tGa8wIy285Yyr4QQX6
         VGB7VQ/2VC3A/OmMupnojm3Ncp9Zqy4sqmaY9rhOnuaBiIN0WHQXnxb1Xi1TsEPUwb
         TiIRKQo0Enunwy5uUinvE9hvkCCGh0y4pVLw2gdHcAZ+Xcl3M2u3WPRYRt1OZClY7F
         N90f/VSl6W0z0L5qL0ejJD4ftq7K3lXKLJKI0RurnUoNZAwIoEGGKkBgN8SCcprAu9
         JxvDtayODLP8w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1EB75CC13B3; Fri, 17 Jun 2022 23:56:35 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Fri, 17 Jun 2022 23:56:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jorge.cep.mart@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210425-208809-5f6QpgaxdI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

Jorge Cepeda (jorge.cep.mart@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jorge.cep.mart@gmail.com

--- Comment #17 from Jorge Cepeda (jorge.cep.mart@gmail.com) ---
Can confirm it happens using Feren OS and kernel 5.13.0-51-generic

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
