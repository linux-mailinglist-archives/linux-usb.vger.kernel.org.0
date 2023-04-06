Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFB676DA26B
	for <lists+linux-usb@lfdr.de>; Thu,  6 Apr 2023 22:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237835AbjDFUQP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Apr 2023 16:16:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237338AbjDFUQO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Apr 2023 16:16:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF0B1659A
        for <linux-usb@vger.kernel.org>; Thu,  6 Apr 2023 13:16:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7CE9664B50
        for <linux-usb@vger.kernel.org>; Thu,  6 Apr 2023 20:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6182C433EF
        for <linux-usb@vger.kernel.org>; Thu,  6 Apr 2023 20:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680812172;
        bh=jjCx9RaNjqPQ3TajLNRZh1uMAB7/yzyQdMdh4xYeHpE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=QDDIXcBjc104MtChUoAIZDEHHUk4Il5BnbBSzFukQBLIZZ3Kayg9Q3eYwH7Jt1vjC
         4mgHHo4lmPwaHmQgtrrpo7QMwgkCBY8oL+anHXJuPrgE5xhundTdKRGdYID+4v3cFB
         5v4cSUh13aRVyH3lnNxlvLCiznJ2uFL8bCoX4x94YfvI5qrWsiyyeQ1wjRggdD3UdN
         ZXIAFzY3JJMErcj/M6abStrQI6uPOSrvxzGWJDboX9d6rrlQltSFLSa+nmPL51dcO3
         WCik4cAnUOKAx73SdIe5mnqCgdEFTI1teScLmTbNLcXO082sb40p9emD8YrEp4u9G5
         WKAQS/bfwlTCQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D4852C43143; Thu,  6 Apr 2023 20:16:12 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Thu, 06 Apr 2023 20:16:12 +0000
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
Message-ID: <bug-217242-208809-EvZaMC9ga7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #11 from Hunter M (miller.hunterc@gmail.com) ---
Created attachment 304095
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304095&action=3Dedit
computer 2 dmesg CPU lockup

Update: DMA API debugging did not result in any warnings/errors from DMA. 2=
/6
computers have had CPU lockup occur.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
