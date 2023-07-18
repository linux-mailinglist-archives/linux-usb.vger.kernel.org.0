Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0051757320
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jul 2023 07:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbjGRFZW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jul 2023 01:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbjGRFZU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jul 2023 01:25:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC329E52
        for <linux-usb@vger.kernel.org>; Mon, 17 Jul 2023 22:25:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6D7AE612B3
        for <linux-usb@vger.kernel.org>; Tue, 18 Jul 2023 05:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CAB74C433C7
        for <linux-usb@vger.kernel.org>; Tue, 18 Jul 2023 05:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689657918;
        bh=6ef/+8wEMRsP1NT+5zjqxi5osR72fVEQe1XcY6XwEls=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Qbt/q+pucTCw/nmN/GYOAvLrr/CBrxFe8zXSdV92FYc+35v/bKiiHYndozgkr4m+2
         LYYNiOH7p2xZmOB65QVEsYB2iz1VRPUwz0CP1GjEVkrNqCABzjfpIpXljN0dCt+myI
         PEIwnhJKDsCKSIUK9oUB3lmCVyoWE3LOSNKISIxfrdJZN19dJeEM/ktgR83PNRUdIR
         qKBSVZv6iLDt7ufW1BoYx6to+vETGUDItpWCePMNQMUaCA6mCe7wN3saWj68vKIxSi
         ulmeuOVJ3OPrPiSDaH4pZMmQeqEbT+HgMPtiZasOqWgiVnFfor8e+Lh3UnCFjfAOxl
         eZTw3WTJcoVtg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A3C7FC4332E; Tue, 18 Jul 2023 05:25:18 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217670] dwc3: regression in USB DWC3 driver in kernel 5.15
 branch
Date:   Tue, 18 Jul 2023 05:25:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tomasz.rostanski@thalesgroup.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217670-208809-YrjMSZDwXN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217670-208809@https.bugzilla.kernel.org/>
References: <bug-217670-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217670

--- Comment #8 from Tomasz Rostanski (tomasz.rostanski@thalesgroup.com) ---
I confirm. It works for me.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
