Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 339866DA269
	for <lists+linux-usb@lfdr.de>; Thu,  6 Apr 2023 22:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237787AbjDFUPs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Apr 2023 16:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237338AbjDFUPq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Apr 2023 16:15:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 478A54493
        for <linux-usb@vger.kernel.org>; Thu,  6 Apr 2023 13:15:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BB72C64357
        for <linux-usb@vger.kernel.org>; Thu,  6 Apr 2023 20:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B5D5C433D2
        for <linux-usb@vger.kernel.org>; Thu,  6 Apr 2023 20:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680812145;
        bh=8q23AnyziXuoDIT+IO31uksp9TdBV0atCmRRFjiwkGM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=R6yCrGzZmmO1tEgm7IRVwVd6M5s/txgBA466q6ItO00jXyvPNmwsKMD30f4BTfjHn
         5X1hmN9gAi2Zi9FwDYVeilz7gAJ2ifetAZsyJIFtKCv/7plIkLFXsKCbIeaC9RCGY8
         ae4vL8A9RYXjfDNneapF4UpR1jaIAnjEg+eYa3qRVTJd5eNKS0y0Aibc/vysntfMoL
         H5U5+UdoOKQpiXDyZ+uppc3ZeacmKVyS9WP6a2MN54Z87XhUyjRWnoa8IqhmVceCot
         fZ6jCbd0SXfezMyLlWSgZr/gzRA9MujHu/r4JfpAg11I93AyHUs/Hoxm/SQu8XfivP
         wSfO8S1uOv+JQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 19A6DC43143; Thu,  6 Apr 2023 20:15:45 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Thu, 06 Apr 2023 20:15:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: miller.hunterc@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217242-208809-Lk8dyfo9Hd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #10 from Hunter M (miller.hunterc@gmail.com) ---
Created attachment 304094
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304094&action=3Dedit
computer 1 dmesg CPU lockup

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
