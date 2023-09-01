Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E520578FDC7
	for <lists+linux-usb@lfdr.de>; Fri,  1 Sep 2023 14:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245065AbjIAMxr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Sep 2023 08:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244160AbjIAMxq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Sep 2023 08:53:46 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BC86E7F
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 05:53:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 78413B823C7
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 12:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2DF76C433C9
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 12:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693572821;
        bh=WYZrI1VtnmTBWoaqwvQyvujKoyfdSfeuwuH7ReTWL+Y=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=PsTkzzhxlXF43G6A59ds8H6VBwgvA0WAb53McWgMzMU4XrjPWL1y3bGUp2+/BgtUE
         3XA/5Fx+hTkcf3DjmXPv/J5a/2/1sgsoghw4TUWmEEGjjBbi0ElGI52nxMecEW/Etp
         zLzdogIC+iij8ScIecWJahQBI56tSYPoITAf+K/Ez12hsJjI+L2hSOatJHLc82dmdC
         slcYCNaa9kMeSDlOa47ZZdM5CA8N8rDRtGfNWVH6IjvRbdC/qvvVZNovoFeLuZIV90
         a3bXARrRBxcff7omFiESGxXuzBNvdX6A4p4Jnmt5aYPdgTOFnl2LDJn4I9VWW9TD5M
         R9mlJ+P0M8UkA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1EB52C4332E; Fri,  1 Sep 2023 12:53:41 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217670] dwc3: regression in USB DWC3 driver in kernel 5.15
 branch
Date:   Fri, 01 Sep 2023 12:53:40 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217670-208809-cq8gA7Whsy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217670-208809@https.bugzilla.kernel.org/>
References: <bug-217670-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217670

--- Comment #16 from Tomasz Rostanski (tomasz.rostanski@thalesgroup.com) ---
Created attachment 305005
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305005&action=3Dedit
0003-usb-dwc3-Calculate-REFCLKPER-based-on-reference-cloc.patch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
