Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 170D45EA6AB
	for <lists+linux-usb@lfdr.de>; Mon, 26 Sep 2022 14:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235073AbiIZM6W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Sep 2022 08:58:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235364AbiIZM6B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Sep 2022 08:58:01 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55B8C6C774
        for <linux-usb@vger.kernel.org>; Mon, 26 Sep 2022 04:31:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7ADE7B802C5
        for <linux-usb@vger.kernel.org>; Mon, 26 Sep 2022 11:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D267C43140
        for <linux-usb@vger.kernel.org>; Mon, 26 Sep 2022 11:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664190615;
        bh=Fp57B94U980/RijLgF9MWFlR1qwkAiwMc4/Cdf7iGDg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=bR0vbAc9YzLh3sGvkqdRdgBY7uoXFC4W4N91+6rHGHcEjdwSkjEZA2d8FabfkENKF
         dUt8B7z8UIJ6pJiyb05n86FuAZh+EwGFvTEal9RnEgCzUPkpB1/3gLGneSbyP9F3U3
         sSTZVlluOHr+qwfnvKvwt80zkYolMOcyFZuIUVrCwqeM7kv5pwrevXAjeDYkHb5Z+U
         vLFAqMpe4PYHPkQN4qkkJVIJM7rLzDuuRmIeTfgo/i5qX2UhWAPEhiIIGevDYkrXGh
         SbJDb/UJmDIf764YbDB3D4AyeRdN4SoA+9lKoxttETXXU27AQFgyUXPB2u5op1s01a
         3cmY4Bra7Eaeg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 15ECEC433E4; Mon, 26 Sep 2022 11:10:15 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216497] USB connections through thunderbolt dock broken
Date:   Mon, 26 Sep 2022 11:10:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jason@montleon.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216497-208809-6xFqCTdtmx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216497-208809@https.bugzilla.kernel.org/>
References: <bug-216497-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216497

--- Comment #13 from Jason M. (jason@montleon.com) ---
Likewise, kernel-5.19.11-200.fc36.x86_64 fixed my wireless problems. Thank =
you!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
