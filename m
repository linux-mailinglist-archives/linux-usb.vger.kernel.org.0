Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D477D799C53
	for <lists+linux-usb@lfdr.de>; Sun, 10 Sep 2023 04:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241649AbjIJCdU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 Sep 2023 22:33:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233350AbjIJCdU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 Sep 2023 22:33:20 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EAC91A5
        for <linux-usb@vger.kernel.org>; Sat,  9 Sep 2023 19:33:16 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D215C433C7
        for <linux-usb@vger.kernel.org>; Sun, 10 Sep 2023 02:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694313195;
        bh=f/40HjwokGKBZ3k7olSdWJQU/TC8biUr2s/wmHBOils=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=hvTjA5+YYH7zEcoJguLgdLP62xQVSptaQ2VOL/HJz0LDdt29CcvcM6vSliJAE6fEe
         6wRSpsug5QbhEAFIsiUGZWI5m4omm1ZR8VXjRzyK4CXKXwwbTDw+B3eOsYW9tlFA3k
         9at/4WiY3+BmBtkMvuQi1Sa+X4ZHCKHUGSCH/A5WjD7s9yvWEgr4J4r57T+hHswVSJ
         1qzNHZqcEOL4IQu0NPm24relR4imZzO0Ftm6SSptr0ObxLePCJJm7QD/JfHkX3ecgQ
         Mim7WNHgGDV5EYyBrhXbx1kS2spj8UW6heVSLoAlE94dhg4PtxKWSCKWRKYm0T5JAq
         PvWgIuZuQM0ZQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 67364C53BC6; Sun, 10 Sep 2023 02:33:15 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217862] [BUG] Alauda driver causes oops when inserted with card
 in with transfer buffer is on stack, throws errors if card is inserted
 afterwards.
Date:   Sun, 10 Sep 2023 02:33:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217862-208809-MsuaNzwl8W@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217862-208809@https.bugzilla.kernel.org/>
References: <bug-217862-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217862

--- Comment #17 from Alan Stern (stern@rowland.harvard.edu) ---
What do you mean by "it still doesn't work"?  What does it do wrong?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
