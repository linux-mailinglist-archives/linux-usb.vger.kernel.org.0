Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E097454DFE8
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jun 2022 13:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376756AbiFPLVc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jun 2022 07:21:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376720AbiFPLVb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jun 2022 07:21:31 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E00E5E74B
        for <linux-usb@vger.kernel.org>; Thu, 16 Jun 2022 04:21:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E764EB8235E
        for <linux-usb@vger.kernel.org>; Thu, 16 Jun 2022 11:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80C1AC341C0
        for <linux-usb@vger.kernel.org>; Thu, 16 Jun 2022 11:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655378487;
        bh=J0LJVg9qca+roEvO480YV2ehT+k8lP/i1h4ACe7cRBE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jHZrRAg69DQrL69qqosGhD9W/FEXY4Jej3wfGpytaFTvyVTQWWGOsJsI2pmYT78KN
         obDU6g/CW1pXzD0ou/67wZxyBW+BySvZkNJUmqDtTu3gVM9mc1uRaoP0PT6G3IV0LG
         MGiysxgT5rQk8qsAV7VsOsHVv7DoW7fiCr8+030S1HSVFya9UsAT2vjbkUxxAHF/py
         WlCZb587uWnZPsYg4IW4L1LZxSNLVp2r+qVclHmALWKQReLrsqHbjy7+qaemTqSslr
         QBgBay2wEJOM7OURgmppV1wHtbIbQ/VNGhwcQ/0yjBxiLrdC8Sq5W2QfeEAgnU5iMG
         26ImXl3e3+eGg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6BE08C05FD2; Thu, 16 Jun 2022 11:21:27 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215890] Regression in 5.18: bcm5974 trackpad causes error:
 xhci_hcd rejecting DMA map of vmalloc memory
Date:   Thu, 16 Jun 2022 11:21:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: buboleck@abv.bg
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215890-208809-8WNeiRaG9B@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215890-208809@https.bugzilla.kernel.org/>
References: <bug-215890-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215890

--- Comment #27 from Dimitar Kosev (buboleck@abv.bg) ---
(In reply to The Linux kernel's regression tracker (Thorsten Leemhuis) from
comment #26)
> (In reply to Dimitar Kosev from comment #25)
> > I believe this is not fixed yet. I have the same issue with 5.18.x on
> > Gentoo, the difference is that the Realtek card reader is involved:
>=20
> Not my area of expertise, but I guess the driver for the realtek card rea=
der
> likely has the same underlying issue like the input driver this bug was
> about. Unless Mathias speaks up here to provide further info (or maybe ev=
en
> comes around with a fix) I suggest you report it separately (please drop a
> link to the report afterwards here).

Thanks, new bug logged https://bugzilla.kernel.org/show_bug.cgi?id=3D216140

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
