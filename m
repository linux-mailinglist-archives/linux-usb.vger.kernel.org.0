Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C535861FBC1
	for <lists+linux-usb@lfdr.de>; Mon,  7 Nov 2022 18:45:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232008AbiKGRpR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Nov 2022 12:45:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232973AbiKGRo4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Nov 2022 12:44:56 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99E0717A97
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 09:44:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3889D611DA
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 17:44:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9816FC43470
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 17:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667843094;
        bh=TCJCcIU+JZ+tcNnalswcLrHeh8eFmwiPFM5zhaS0t7I=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jDgk1x+69VnM2Mnxgq88oz6z8Be65jhOI/w0QsJNle0Cd71MygoZX3LN0HrjwYios
         2oaoM+FQ45IFxOB5rtIxEYLLa2IBBoYepENpXSfRNgjLQrXj2EA67C00t5LfOxOcgY
         CrPpKKHcSrPNvisPTTRcissbluxi3JuN0oxX/ODJ0ovCINm44NwENL2HQdJNh+RURh
         98G/Qjc5DuLdl9ty4ZgFn/1PAQe8oWRvJAiI+dsXutSFSv5BSugZ+SK4yFFHZM/eoq
         dzpEeoKG8jQkVaKXa7iTqL61jHA3TgeLYZMR8jp9Vo8FZTIXMm1xORQEmV0JX/UUFG
         fY8MuVgyWvl9w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7EACAC433E9; Mon,  7 Nov 2022 17:44:54 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Mon, 07 Nov 2022 17:44:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wse@tuxedocomputers.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214259-208809-0oxVFyC3NG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214259-208809@https.bugzilla.kernel.org/>
References: <bug-214259-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214259

--- Comment #42 from wse@tuxedocomputers.com ---
Created attachment 303144
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303144&action=3Dedit
dmesg after boot (gui did not load but that seems an unrelated bug because =
rc)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
