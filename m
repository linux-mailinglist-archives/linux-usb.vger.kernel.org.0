Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC1F474688D
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jul 2023 06:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbjGDEzM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jul 2023 00:55:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbjGDEzL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Jul 2023 00:55:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D80D134
        for <linux-usb@vger.kernel.org>; Mon,  3 Jul 2023 21:55:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A558A61129
        for <linux-usb@vger.kernel.org>; Tue,  4 Jul 2023 04:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10452C433C8
        for <linux-usb@vger.kernel.org>; Tue,  4 Jul 2023 04:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688446498;
        bh=zv7dapXn//EIyO7fIPJPFsT674BDfaoWMk/oXKmTWJA=;
        h=From:To:Subject:Date:From;
        b=L9RgV1NIVOBvH8Vs66ztKqpLrn+GlkCJD4sTR8wwdejxzij6SirLE+31BCiM1YaHt
         Giw/bbryNY7S9pcXm/qQnVfyyiRflNZndLeIdvD+mGuZMDJm7pqR6pwwLGymlD0qK0
         Z9U7MWKjNRh++YcfSdlF0pt3VY1pMsEPXJIJPoP/iWyNhtTq2hZaEraxeIz+QLsgxo
         BnN4fo4cBwyFqp9eruEchVVibBtuW2A7FynXhH6gAuwr49Fc8xuEEUP5nhfJpfvUk/
         HvludEw+aefieib5ZM0veqXCvGkTxYnf1p4ZKnPJDVm1sYu6TyTDzp5KGE+/C6kJoe
         QEIcygrv/JiCQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id EA981C4332E; Tue,  4 Jul 2023 04:54:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217632] New: 3 more broken Zaurii - SL-5600, A300, C700
Date:   Tue, 04 Jul 2023 04:54:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bids.7405@bigpond.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-217632-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217632

            Bug ID: 217632
           Summary: 3 more broken Zaurii - SL-5600, A300, C700
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: bids.7405@bigpond.com
        Regression: No

Created attachment 304541
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304541&action=3Dedit
dmesg and lsusb output

The following patch broke support of 3 more Zaurus models: SL-5600, A300 and
C700

[16adf5d07987d93675945f3cecf0e33706566005] usbnet: Remove over-broad module
alias from zaurus

dmesg and lsusb output attached.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
