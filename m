Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97D677515AE
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jul 2023 03:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232263AbjGMBAi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jul 2023 21:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231836AbjGMBAg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jul 2023 21:00:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83D599E
        for <linux-usb@vger.kernel.org>; Wed, 12 Jul 2023 18:00:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B48C6618CF
        for <linux-usb@vger.kernel.org>; Thu, 13 Jul 2023 01:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14117C433C7
        for <linux-usb@vger.kernel.org>; Thu, 13 Jul 2023 01:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689210034;
        bh=56pkEqYGDVIyRU4efXMSBoVUmkn948dRdtpD7GV+4kk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=OYDK1SGeelktWdwPJDqIgtlQVCD61zfAa0y8+PFKBo0OzPghmMNg6o1HPbGEP7DxB
         yK/HZxPF8Q1NPaWXFIg7Ssj3rmP7d9Axg88IO+M78yb2JDv1raS/CNANtg3q03UXvE
         ULpe6eI16HsFxu78ZaIibiOTon+CYpb/DU/+g8IphkzzFEdszH2xoJto7CIHC3KlBc
         25FjpUGDvkOuPEuEYo9BQDh1OqhpV/U7kXrhLhPUXnZ+u44XZaVR8mZ0MNfnfPDoOu
         S4/SqznBTmQuaMoNb9wzoeIN9v7Z4peNS7zAQ1E3+jioB+81Xc12OgbtDNS1xa/Mn5
         3l87flJvjxGGQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id ED4B6C4332E; Thu, 13 Jul 2023 01:00:33 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217632] 3 more broken Zaurii - SL-5600, A300, C700
Date:   Thu, 13 Jul 2023 01:00:33 +0000
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
Message-ID: <bug-217632-208809-jiyzPlpFH4@https.bugzilla.kernel.org/>
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
 Attachment #304609|0                           |1
        is obsolete|                            |

--- Comment #5 from Ross Maynard (bids.7405@bigpond.com) ---
Created attachment 304621
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304621&action=3Dedit
Patch for 3 broken zaurus devices

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
