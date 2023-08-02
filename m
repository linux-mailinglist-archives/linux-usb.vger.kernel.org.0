Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D9CD76C24B
	for <lists+linux-usb@lfdr.de>; Wed,  2 Aug 2023 03:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230470AbjHBBhM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Aug 2023 21:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjHBBhL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Aug 2023 21:37:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95BB21B7
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 18:37:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1387861783
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 01:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74474C433C7
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 01:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690940229;
        bh=QRFQI+pzM/65TYgLsPcc3mGbFuFf1Ai/FCnBHONvevA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=g4+6Z9vW8Wds3zIldCgS/nwsvvjdBtmgHP3MHEfTfPbpXo1AfUACslQfqXwq58Gn1
         x4lkPVS93CHNStzvqzp7lGTXQ3kqcxXeMZSWRGflXQ9p83p87W+lbv4UiTBMnJORNi
         HV6eIpYlr0Pp6Tz110haFrZ4FQfuLkoTN3U3bLg4JbE5ioTqu2xCB5+qB3yMrB9NIj
         2k6x5VNdZK5Ukrs/Y/n3qTqjrQtsGLq1msQ1/Ui7ViHv5xcP8qtdpCVEcLZwxo3les
         gFFnSxVvZ3QJVgJ1PPHN8InCHyJY1wuSUjonGqR7UjvoudlM/CbL1vK4oyKreG9ygV
         1vfVCAz/ZtW5g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5708CC4332E; Wed,  2 Aug 2023 01:37:09 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217632] 3 more broken Zaurii - SL-5600, A300, C700
Date:   Wed, 02 Aug 2023 01:37:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bids.7405@bigpond.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217632-208809-OcZgj87nz4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217632-208809@https.bugzilla.kernel.org/>
References: <bug-217632-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217632

Ross Maynard (bids.7405@bigpond.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
