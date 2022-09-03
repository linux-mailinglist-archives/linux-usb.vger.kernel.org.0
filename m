Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69B825ABD7A
	for <lists+linux-usb@lfdr.de>; Sat,  3 Sep 2022 08:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232116AbiICGi5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 3 Sep 2022 02:38:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231520AbiICGi4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 3 Sep 2022 02:38:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4B5ED4779
        for <linux-usb@vger.kernel.org>; Fri,  2 Sep 2022 23:38:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 51EA460E01
        for <linux-usb@vger.kernel.org>; Sat,  3 Sep 2022 06:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B17B0C43142
        for <linux-usb@vger.kernel.org>; Sat,  3 Sep 2022 06:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662187134;
        bh=LfvDrm6PgyJO83cQN6C+EihN9fJwciH7L4BfLp+vQL8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Sp4xOdYiaRM8a8HowF+hpLTxIUUGCe9ql2Dm0IViSPJhONZA/blGmRybnb0ICIm+1
         T0I+W/RpOxKMsn6nxnkfGID3ksR3DCdVbR/NPsssjMYpfHGuXJxcdtPmewQA/eAReY
         t+F/Um7FZoXAEO+V11Pd8oG8lzzuKAs+khVOIt/zVwEUpwEQTeQDKiK+zTpISnwI9q
         NvChaAJsP9MIhNTjYcv9NS7bQRknRCOJpHnZkGRJOD5VpcxrkDCF58v5mJ+vBe91Wu
         hsHM/dRuWRKyt5hvxIwcZobMP7aCFUozRXbCS0hSQjXXwUaf9Q3X7kPx7dfrsZnW5H
         4Lfigw2dqpy4w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A1B24C433E7; Sat,  3 Sep 2022 06:38:54 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Sat, 03 Sep 2022 06:38:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: grzegorz.alibozek@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210425-208809-hFhBpbfZLw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--- Comment #26 from Grzegorz Alibo=C5=BCek (grzegorz.alibozek@gmail.com) -=
--
correcting the problem occurs on the dock: Lenovo Thinkpad Ultra Dock 40AJ,
in journalctl i see:
sep 03 08:33:25 kernel: ucsi_acpi USBC000:00: ucsi_handle_connector_change:
GET_CONNECTOR_STATUS failed (-110)

but the main problem seems to be resolved

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
