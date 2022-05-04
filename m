Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01E77519CC5
	for <lists+linux-usb@lfdr.de>; Wed,  4 May 2022 12:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238047AbiEDKVI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 May 2022 06:21:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348003AbiEDKVH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 May 2022 06:21:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04D3D26AFD
        for <linux-usb@vger.kernel.org>; Wed,  4 May 2022 03:17:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BCCD8B824C9
        for <linux-usb@vger.kernel.org>; Wed,  4 May 2022 10:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BAE9C385A4
        for <linux-usb@vger.kernel.org>; Wed,  4 May 2022 10:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651659449;
        bh=VQbjsKT39ttLgXf7k9ejyJ7Qw2ldl/pBFwqmXCGodDA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=p8tokpPDI4CtGvzSkjF81nXgLgmeNOpZZgOv6nmRDLHid4QkDBbX65c6R83X6yYsz
         od3MR1eLZ5cbLuCk4YTGsxlTMy6ApBD7Jq93e8xWlqgd4wRjv3WW7hASPHleKNje9a
         f3jEYetLXVxk53vw1r+bTTZSI1goCtR0r2KBm7Xm9mqjDR9LCsJo1TQYGdPqJVhwfA
         RFrF980xAA3VUs2/FHHnOGpZTxhk3FVWa6tQPF8id/vwtpoO4VeDGgcZGs0UvNC6rV
         Yv0Xdx9Tg0/DHhuas8Vw8m5HbMe6HdiKjjja5NbNW0ycfi/MOvmgrZrVvYUjdjFNwB
         0Tb/vFj8RSE4g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7C85DCAC6E2; Wed,  4 May 2022 10:17:29 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date:   Wed, 04 May 2022 10:17:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ferry.toth@elsinga.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215740-208809-sHCkfchoAF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215740-208809@https.bugzilla.kernel.org/>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

Ferry Toth (ferry.toth@elsinga.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ferry.toth@elsinga.info

--- Comment #7 from Ferry Toth (ferry.toth@elsinga.info) ---
In my case it is EVM9514, a 4p USB hub + 10/100 ethernet:
https://www.microchip.com/en-us/development-tool/EVB9514

So, indeed it seems like to warning originates from hub code shared between=
 at
least VL812 and LAN9514.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
