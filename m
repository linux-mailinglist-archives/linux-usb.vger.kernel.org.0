Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09616613E03
	for <lists+linux-usb@lfdr.de>; Mon, 31 Oct 2022 20:06:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbiJaTGt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Oct 2022 15:06:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiJaTGs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Oct 2022 15:06:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2F06958F
        for <linux-usb@vger.kernel.org>; Mon, 31 Oct 2022 12:06:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6BD2A61422
        for <linux-usb@vger.kernel.org>; Mon, 31 Oct 2022 19:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8DFCC43146
        for <linux-usb@vger.kernel.org>; Mon, 31 Oct 2022 19:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667243206;
        bh=80ozU/B7ZQCamoOs+3S2OdIltow0JxWiChHT6kd4N94=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=M+l9IXm8cIuiQ9Ask0dqiosNwHLA7UnDIhxNNFcX5+zfV2MmgfnJ6+nH95mRP+u2i
         YNEUdPnYc1Pri8730KTgeXEJ2oThhPbstztiB0+5qFTZCQsomMVkQ2wE0g4yKUbDYh
         aZ6s0dQ9aILCGR1gYg4AZRdSTcrJTbHrdWfjdNMSWp7muz0W9vBsbsjCH+KnTzsGFs
         sZ/MVSxy/rq56IFgPUDj7dEvYhF1loKeeecT2mx9M0Y3A8cpXqVgYGX21E2skyhXKJ
         9zvpfWB7ACrpvQ+SEFY8yGBXsSaYak/PcY88C+L/BGzShX3PoQ4WL+RUXkTaQMnfUb
         JIirYi7+SlPDQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B76E5C433E7; Mon, 31 Oct 2022 19:06:46 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Mon, 31 Oct 2022 19:06:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bmarwell@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210425-208809-LVQeUASWV4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--- Comment #42 from Ben M (bmarwell@gmail.com) ---
(In reply to Heikki Krogerus from comment #40)

> Once it get's applied - presumable withing the next couple of weeks - I'm
> expecting there to be a bot that reacts by changing the status of this bu=
g.
> We shall see.

I can confirm it is not in 6.0.2-2 on Manjaro.
Using a Lenovo L15, 1st Gen.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
