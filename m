Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E28751BF44
	for <lists+linux-usb@lfdr.de>; Thu,  5 May 2022 14:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349522AbiEEMeS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 May 2022 08:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234283AbiEEMeQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 May 2022 08:34:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B98A44B1C6
        for <linux-usb@vger.kernel.org>; Thu,  5 May 2022 05:30:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 628FB61D47
        for <linux-usb@vger.kernel.org>; Thu,  5 May 2022 12:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3054C385A8
        for <linux-usb@vger.kernel.org>; Thu,  5 May 2022 12:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651753834;
        bh=NHeud+jzScDdPDnx8QFSGCAdyqBZTnUJExwr24YcxKM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dprvxHKnmCQydIsl1ulRsZvWJJ1D1fT7Q5mfnc95m6rG7Xj2ZrT+SxMKvb46791h+
         uMWd1BUnLlV/tskYw9jYFlt4eBwejSzkO4xGsfEOPEcdf07veWVM7qTL/ptu25YwKZ
         ZkOKr+nil4NiAbWnWLEmlUsT/c+w9MsWXtCBVw7aB+uVC4mSAD0v5F9MLdYlBYIIt0
         feRAtlaK7jCGOrMDUeZ//PTNlJfv3bDamJu3to7DU+G0VU5IhigYuspPu22RRY2O4g
         3nlCDw6sKC/IfNGWrAFF1ltEyJKllx2VwEAB1nhHFNRHsJ2oxyXWJZGpsRoE3E2P0v
         T6sHhuXPMdwhg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A5B65C05FCE; Thu,  5 May 2022 12:30:34 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date:   Thu, 05 May 2022 12:30:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: qba100@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215906-208809-6M25bzMOmH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215906-208809@https.bugzilla.kernel.org/>
References: <bug-215906-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215906

--- Comment #3 from Piotr Pi=C3=B3rkowski (qba100@gmail.com) ---
I built myself this kernel 5.18-rc5 (with ubuntu default config), but the
problem still exists

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
