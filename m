Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88A687515B5
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jul 2023 03:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231758AbjGMBJV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jul 2023 21:09:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbjGMBJU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jul 2023 21:09:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F72B127
        for <linux-usb@vger.kernel.org>; Wed, 12 Jul 2023 18:09:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AE046618A6
        for <linux-usb@vger.kernel.org>; Thu, 13 Jul 2023 01:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0FC31C433C9
        for <linux-usb@vger.kernel.org>; Thu, 13 Jul 2023 01:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689210559;
        bh=JXwzsVN7wufAq7R9EoXJgvyrBHcFwdAWHhevXNSGbl0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ZfaMevqhMdfjMATCNyIIJMyuQAGZPMKKcDEHZCMetV4p6WbTj37q6LegMSPZ8a7HY
         Nae0d4YvNB7dpt2ZrUe6jytZOm3phijf2wFECqP/quQUBDwGW3mZ2GY+MyObp1jYs5
         DLoBfUVxCs8oa+s2y22mRvdC6ykGQ3TeU9Hauhgq/yehafun1lew9fM+GlT8Szd1Ug
         bjdp9i8QPiqU7T4SH+gADR91ypn/5aOv6qLQjfDpWm3TcCsk8opP+gaP4fZFoliaH5
         sTewIMkoqkwJJ4DCViWxCyZ7hSGO8CH0+Klb9YvS36u6gI7Wm0Id01dQOuX6OOK+39
         QMNhrkpDi6fMg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id DBAB3C4332E; Thu, 13 Jul 2023 01:09:18 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217632] 3 more broken Zaurii - SL-5600, A300, C700
Date:   Thu, 13 Jul 2023 01:09:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bids.7405@bigpond.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-217632-208809-7DSgqNkQgp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217632-208809@https.bugzilla.kernel.org/>
References: <bug-217632-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217632

Ross Maynard (bids.7405@bigpond.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #304621|0                           |1
        is obsolete|                            |

--- Comment #6 from Ross Maynard (bids.7405@bigpond.com) ---
Created attachment 304622
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304622&action=3Dedit
Patch for 3 broken zaurus devices

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
