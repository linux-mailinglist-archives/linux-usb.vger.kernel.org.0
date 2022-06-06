Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0CC53EA99
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jun 2022 19:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240863AbiFFPc5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jun 2022 11:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240912AbiFFPbD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jun 2022 11:31:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 983A736146
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 08:30:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7FA2061568
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 15:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3A25C385A9
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 15:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654529439;
        bh=1C171aCffjPOVG/I9iFOkyZrXTRqj+mxI+yDE21wTv0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=baaVl9f6JEE+Sv4E4h1r8yKZ/K5Wx8CNXW8vsMjMdiZu6zWyqqKefspJobtyMP037
         Nhzzz9eHfIIDGBfLy581DBqG9H+xKYHnhynB5JdUAmMDR8RyqLOjLD8iS7AFtXLHSu
         tzuhJHYrfwrvXMKH9k5IbLbR6wzxjIJJUgmgtvFu07NfwTcktctLkwAI+xbSt3SZO5
         Zzb4QnL4C8RJAxJiNk8NRDADlz4N4IAr9avT9n2IGUyP2el5lr68F50J8+NQXQNe88
         aMGBQl5J7Eg/BF8Ug1n8ojBtlhLn5OJSSRFIXfMxNiWLGN0qavTO4797Ve1tN2bnAY
         ZkC3e6wJf/B8Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CA1A4CAC6E2; Mon,  6 Jun 2022 15:30:39 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216085] MCS9990 not maximum speed USB 2.0
Date:   Mon, 06 Jun 2022 15:30:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216085-208809-ezcQj8nUgg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216085-208809@https.bugzilla.kernel.org/>
References: <bug-216085-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216085

--- Comment #2 from Greg Kroah-Hartman (greg@kroah.com) ---
On Mon, Jun 06, 2022 at 03:20:20PM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D216085
>=20
>             Bug ID: 216085
>            Summary: MCS9990 not maximum speed USB 2.0
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: All
>           Hardware: All
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: khseal@yandex.ru
>         Regression: No
>=20
> Created attachment 301107
>   --> https://bugzilla.kernel.org/attachment.cgi?id=3D301107&action=3Dedit
> Ubuntu low speed.

Please contact Ubuntu for support with their kernel releases.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
