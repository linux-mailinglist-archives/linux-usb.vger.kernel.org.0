Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB82E78FE21
	for <lists+linux-usb@lfdr.de>; Fri,  1 Sep 2023 15:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241640AbjIANOq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Sep 2023 09:14:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjIANOp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Sep 2023 09:14:45 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC50510E0
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 06:14:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 1ED0ECE22C9
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 13:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A3EFC433C8
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 13:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693574079;
        bh=Ze9Zgdt/JiwDYRICzTyW769isPCBhEg+cDf9kPm66FU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cY35NYLvlnBcTgbiUxMNrcx92CdzD9cVgle/0OzvhTycUgDyeKGc2ylOWpvzFxfUz
         BlxPTpyylGy3EcaDd1Ob6MYqY/vdMw2vucL4sozAdNQJ0FoRvVN+/YA8cigPwgewQz
         /UTNqLCCYFL70Pd7jlseHLLOob12XJtrgZWLuG0Cw51iGEgmlPpypfAMH94hm9KGu0
         N/c8V2kdNEIHpJi8CTAWfNJFeQyCSx6aN5ltNp9gmSQyPcQcZip0zmB6NCyQOkDI8Q
         4QKg+I7qAoow2CKv2tuJd0sGiTqoj4V6aW1+LwtHK0LHj+DJmgqjXfTGlTm3CSTbHU
         XFwaF82vpao6Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6958DC53BCD; Fri,  1 Sep 2023 13:14:39 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217670] dwc3: regression in USB DWC3 driver in kernel 5.15
 branch
Date:   Fri, 01 Sep 2023 13:14:39 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217670-208809-3rjQQUH8Ey@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217670-208809@https.bugzilla.kernel.org/>
References: <bug-217670-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217670

--- Comment #26 from Greg Kroah-Hartman (greg@kroah.com) ---
On Fri, Sep 01, 2023 at 12:57:47PM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D217670
>=20
> --- Comment #24 from Tomasz Rostanski (tomasz.rostanski@thalesgroup.com) =
---
> I have attached rebased patches against 5.15.129:
> 0001-usb-dwc3-reference-clock-period-configuration.patch
> 0002-usb-dwc3-Get-clocks-individually.patch
> 0003-usb-dwc3-Calculate-REFCLKPER-based-on-reference-cloc.patch
> 0004-usb-dwc3-Program-GFLADJ.patch
> 0005-usb-dwc3-core-add-gfladj_refclk_lpm_sel-quirk.patch
> apply with git am.

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
