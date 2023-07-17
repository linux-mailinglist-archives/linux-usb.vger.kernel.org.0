Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6DA755ADB
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jul 2023 07:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbjGQFUi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jul 2023 01:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbjGQFUh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jul 2023 01:20:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E193A1AC
        for <linux-usb@vger.kernel.org>; Sun, 16 Jul 2023 22:20:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 766EB60DFB
        for <linux-usb@vger.kernel.org>; Mon, 17 Jul 2023 05:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DABD1C433C7
        for <linux-usb@vger.kernel.org>; Mon, 17 Jul 2023 05:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689571235;
        bh=HtQlLQJNU43FVrnGop+qsYbIcxhkeMZ+iaNHyXc1CLk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=SYoqJ0AguDcp/+iwDmjL8ntLc4SPajBPVHgqKiZd8BJw2v947UwkVce4TMYiQLxlm
         hMqHnFjigT0+H3ck3UsddVp8oHsUw4WCY8lh24RSgc5PMjIsEzz6xFlPQ5nN+kSTxd
         Jz3zO3ldcWYaIhk85ijR81EjlpvJINQHfx08coVIVrbyOkpi8poi1jlVx696pcB9FO
         7V+fx6xRR3/9ayXmJnzZ+hB7ViKtCJvTj6Fde1Npqg5AkhSJzj/4UGM0VAp5JiSFrb
         MlfPvLI7eFET1NUlkPyJrC8WR8TZe76egxhWpfIyXLqmiTScfiiC1gtppPSpPcm7mT
         bLYXKQrBPcAUQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B04ECC4332E; Mon, 17 Jul 2023 05:20:35 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217670] dwc3: regression in USB DWC3 driver in kernel 5.15
 branch
Date:   Mon, 17 Jul 2023 05:20:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tomasz.rostanski@thalesgroup.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217670-208809-rkwh2VqExo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217670-208809@https.bugzilla.kernel.org/>
References: <bug-217670-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217670

--- Comment #5 from Tomasz Rostanski (tomasz.rostanski@thalesgroup.com) ---
I believe the missing commit is:

commit a6fc2f1b092787e9d7dbe472d720cede81680315
Author: Alexander Stein <alexander.stein@ew.tq-group.com>
Date:   Thu Sep 15 08:28:53 2022 +0200

    usb: dwc3: core: add gfladj_refclk_lpm_sel quirk

    This selects the SOF/ITP counter be running on ref_clk. As documented
    U2_FREECLK_EXISTS has to be set to 0 as well.

    Reviewed-by: Li Jun <jun.li@nxp.com>
    Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
    Link:
https://lore.kernel.org/r/20220915062855.751881-3-alexander.stein@ew.tq-gro=
up.com
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
