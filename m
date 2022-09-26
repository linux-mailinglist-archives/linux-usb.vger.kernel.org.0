Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 612125E98BE
	for <lists+linux-usb@lfdr.de>; Mon, 26 Sep 2022 07:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232664AbiIZFVd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Sep 2022 01:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbiIZFVc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Sep 2022 01:21:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E67C2A70E
        for <linux-usb@vger.kernel.org>; Sun, 25 Sep 2022 22:21:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0022561380
        for <linux-usb@vger.kernel.org>; Mon, 26 Sep 2022 05:21:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EC2EC43142
        for <linux-usb@vger.kernel.org>; Mon, 26 Sep 2022 05:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664169690;
        bh=K+W5wa+6vDtPWpNxtoYcTXaItpR+x/p4gItDWu8zG3c=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=eSZTZDoccrfjKekN4Uz5aKcD2tW2fV0ZgbaOXrDsSBeR0MmB6KG8okhK0xZzRVatm
         ZXTMBbzh2QibIi6X7dyg1Gqqz/f6WNQx3gbakzkV0KhdafPjFY89pUA5OgGqCXEwPN
         o2AD20JuFaX0ASS5GZNSO6SJTMGUK8P9gmucb5NiHD/WOudx1MlLlwrcnOqPhpS4jI
         R3qawAGTX9ajQOxXOoGif1BUePP3lN0kHBBNqOK+btZuDAPo8UJfUO2h+hh02m4+Ke
         C0rcGAGIgmgkv49hf2QL+zdz1w2fuiUKf4MaFImiBibdc1NLxDpOEb7pDeOy209tj/
         D20KPnPuKy2pw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 47AFFC433E7; Mon, 26 Sep 2022 05:21:30 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216497] USB connections through thunderbolt dock broken
Date:   Mon, 26 Sep 2022 05:21:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: filip.sund@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216497-208809-6Smdjy299O@https.bugzilla.kernel.org/>
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

--- Comment #12 from FSund (filip.sund@gmail.com) ---
Same here, fixed by updating to 5.19.11-arch1-1 today.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
