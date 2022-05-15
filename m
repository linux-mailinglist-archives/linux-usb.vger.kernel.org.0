Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 972B9527A71
	for <lists+linux-usb@lfdr.de>; Sun, 15 May 2022 23:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232858AbiEOViq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 May 2022 17:38:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbiEOVip (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 May 2022 17:38:45 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2087E140A6
        for <linux-usb@vger.kernel.org>; Sun, 15 May 2022 14:38:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5D3FEB80E66
        for <linux-usb@vger.kernel.org>; Sun, 15 May 2022 21:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1524C34117
        for <linux-usb@vger.kernel.org>; Sun, 15 May 2022 21:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652650721;
        bh=YFezjrx6dZAaYPPormx0u6S86zdKVntGgyGGoz520Gs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=I69lDWLNIzO9qd6aZ92ZQ+Doqx+9/yCp2euvbdAaU56oZrKjYSQ5ENkW5ysZ57zaO
         aNzZ3hvyDqbYZ8TVxi9lj0pAYkFVfcmU9h766g8wwy3JYlWmkYiie2EaGcu150ajCS
         r0+5atRDJIblnhhaDUo9X+4rWhAVuYgkBjXhIlYnlGkk2uA14TGjpzg3Lb1/j9u8eF
         y0KE6+V4qECXsSifFUHVSgC97M5NllYjL00e1Mis3SjYVx9jSlL7BIEowPru0uAdqc
         2Q4VCrqxuLccZuZz4crMZcEXHO2lJpyz0/M7DjYDgjxEFCSKnHBsRJmCygb5BQCLtr
         8DgnNmxA4PyZA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C0063C05FD6; Sun, 15 May 2022 21:38:41 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215890] Regression in 5.18: bcm5974 trackpad causes error:
 xhci_hcd rejecting DMA map of vmalloc memory
Date:   Sun, 15 May 2022 21:38:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: satadru@umich.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215890-208809-bRodmT0aiB@https.bugzilla.kernel.org/>
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

--- Comment #15 from Satadru Pramanik (satadru@umich.edu) ---
(In reply to Mathias Nyman from comment #12)
> Created attachment 300952 [details]
> bcm5974_add_urb_flag
>=20
> quick testpatch that just adds the missing URB flags,
> Does it work? I don't have this hardware myself

Could we get that patch added to the driver for 5.18?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
