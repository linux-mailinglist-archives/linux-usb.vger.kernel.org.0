Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 502C0527C56
	for <lists+linux-usb@lfdr.de>; Mon, 16 May 2022 05:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238735AbiEPD1v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 May 2022 23:27:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238087AbiEPD1t (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 May 2022 23:27:49 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D6BB1098
        for <linux-usb@vger.kernel.org>; Sun, 15 May 2022 20:27:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1FD58B80CEC
        for <linux-usb@vger.kernel.org>; Mon, 16 May 2022 03:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6259C385B8
        for <linux-usb@vger.kernel.org>; Mon, 16 May 2022 03:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652671665;
        bh=5eXBGIqvRStH6IkU85Qoa1FwrJdo3BUTipkwGmS0m7w=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=hbrcdvdRB6zVhP5utloQ8qAG4qHUHeHmAfc5jzarzpfC4rdVyNXm9vbQdUjKVpIMo
         YHjRftoUjQXZ/iRO1YTQ8cTLIiurr27UANMUQ0v4uHUwlc7RQK0EulAoHQng6IByop
         fs6jcIGHINCQu2C7C5zl0XEHg6J/hw+/kofva1itTvN2V8gwUk1HVhl+iTOTDCdL7b
         V3OioflTslZiuN6O9PEc9hHgXReCX3KpEmnHeWIH6c+tMPUh64+0o0uYOm7as3Dwgl
         teYLfBs19i20F5xIVXsJ1Id2xKi5WoShPjHI2szYZh4G5NfCifefylpXLtEaE9oH33
         RbfFGTGE45GOg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AE648C05FD5; Mon, 16 May 2022 03:27:45 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215890] Regression in 5.18: bcm5974 trackpad causes error:
 xhci_hcd rejecting DMA map of vmalloc memory
Date:   Mon, 16 May 2022 03:27:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: satadru@umich.edu
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215890-208809-SGIZBb6Yxh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215890-208809@https.bugzilla.kernel.org/>
References: <bug-215890-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215890

Satadru Pramanik (satadru@umich.edu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #16 from Satadru Pramanik (satadru@umich.edu) ---
This is resolved in 5.18-rc7.

Thanks, everyone!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
