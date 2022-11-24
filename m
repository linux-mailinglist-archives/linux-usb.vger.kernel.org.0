Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF876374FA
	for <lists+linux-usb@lfdr.de>; Thu, 24 Nov 2022 10:19:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbiKXJTr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Nov 2022 04:19:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbiKXJTo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Nov 2022 04:19:44 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8EE6116AB5
        for <linux-usb@vger.kernel.org>; Thu, 24 Nov 2022 01:19:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 27B6262041
        for <linux-usb@vger.kernel.org>; Thu, 24 Nov 2022 09:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88075C433C1
        for <linux-usb@vger.kernel.org>; Thu, 24 Nov 2022 09:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669281582;
        bh=BDotHWwIXGEuVTclwIexQbACizQYkXYKW9kDHu8CySw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=EzFceZ+6bIK/Prfhvme1c1qWQXAFbJkduxXAOWTxWzNS052U86J6duubJwDTnv8nv
         RqI0WaICQwSTXlxWYsc8y7Q7FV2RxE4Xnjxc8COQmjNbD8fwb+Sc+3R78+BCmWPRw0
         Dni0vCMbGeMisZQFoT+XSjz6ZlQRremj53gQMD+fR9dIX8Nw6soB8mOeh/72BXdbgG
         XJ3WKbBmDk2VylAg4ndWsGMdoH8Y6FSEJhV5HTXhXowhBz2oQUjuk9TwX25YyOXpy0
         wjJCsC/bjRpEXe31p1Z7A6M1yp6GwmUon9mUnNePPnsjsax++WHIIFIj1nSaNW8nAI
         hzZPB21ffQa9w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6D394C433E4; Thu, 24 Nov 2022 09:19:42 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Thu, 24 Nov 2022 09:19:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216728-208809-JEXF71gGJ5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

Mika Westerberg (mika.westerberg@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mika.westerberg@linux.intel
                   |                            |.com

--- Comment #3 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Can you attach output of 'sudo lspci -vv' when this happens? This will show
more details on the PCIe side.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
