Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7558E5317C6
	for <lists+linux-usb@lfdr.de>; Mon, 23 May 2022 22:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238932AbiEWQdf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 May 2022 12:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238906AbiEWQdd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 May 2022 12:33:33 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E31B68FAF
        for <linux-usb@vger.kernel.org>; Mon, 23 May 2022 09:33:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id A7A3BCE16D2
        for <linux-usb@vger.kernel.org>; Mon, 23 May 2022 16:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12196C385A9
        for <linux-usb@vger.kernel.org>; Mon, 23 May 2022 16:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653323609;
        bh=fbYzEYccrOh8jg19Vs1GJjAq+shVgs+T5nOsHhYNjoo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=CXidcNu7y63qOW76jdVIY+1+qDFG2Ac/fV/CFAUtKZkgphyGK4VWK5ciHuDnGodUZ
         2ZBSfNWRWvoKUOzeC738Cxc3KKFfT0IJWiF4rZMaFvB2LRQTEEEdcryODZhj5tkiFW
         kWpBRSHdr8M3XPbz0Qrpiwy+GupOQlD6/hzF2Q2XbyNClw6LP46tXJlODgXhAygO+N
         DCLhBgyHOvObsmNF4qUYAIdyP1D0DdZSXaxtPvAIwRc9fDtyI88Kwdz/EqqY2RfrIU
         PK1PViKVd0fgGQ4GyJhLrYLYrhhigXUbE5TraAYRwNSz7BPPzmfzpYSHV1jWAJ63uA
         1SeS5OmzJ+yqw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id EFF5EC05FD6; Mon, 23 May 2022 16:33:28 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Mon, 23 May 2022 16:33:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wse@tuxedocomputers.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214259-208809-ZEzEVCxACS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214259-208809@https.bugzilla.kernel.org/>
References: <bug-214259-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214259

--- Comment #20 from wse@tuxedocomputers.com ---
Successfully tested the patchset: Works like a charm.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
