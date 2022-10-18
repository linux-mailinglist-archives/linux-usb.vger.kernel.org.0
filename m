Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 239E86023FB
	for <lists+linux-usb@lfdr.de>; Tue, 18 Oct 2022 07:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbiJRFnm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Oct 2022 01:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbiJRFnZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Oct 2022 01:43:25 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E99AA5720
        for <linux-usb@vger.kernel.org>; Mon, 17 Oct 2022 22:43:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5056FB81CF3
        for <linux-usb@vger.kernel.org>; Tue, 18 Oct 2022 05:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D3B2C433D6
        for <linux-usb@vger.kernel.org>; Tue, 18 Oct 2022 05:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666071786;
        bh=bBIKn8SM4/M2QrB7dybItG6i60yHNuChHR94VI6E5pg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=KgcjbK2iwACwScLUWhsbOPSViandQexbGaFuEb4aiydXRfKapVELiUw6i8H6i+oU6
         npsUsV4greDN9W7Jmf2BjrIklDYZklKVJQwmvgKBbUFXCnqf6tyPSd4QJPLffPTf56
         qu/0Pjdqxe+NFHiPsjygxY5gc0iAtfAXXUX2yZev+nqEAYndDdacn09cNwm+8y8YLS
         RU8wkMYVlfWimma+ZbAYQJqKlsI/k54Ej0t75FKE3IAxd81DVn8Wnz2Q1cbzWlkhlm
         DJRQrR9FQjwNxJecq/X9yaXydwhPNi1YBTjk2aONzNFEwYkfGziM3LNyb+E5TNlUeB
         nQn9mYkrHKLyg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id F12EBC433E4; Tue, 18 Oct 2022 05:43:05 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216601] pci_pm_suspend(): hcd_pci_suspend+0x0/0x40 returns -16
Date:   Tue, 18 Oct 2022 05:43:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: koba.ko@canonical.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216601-208809-sQIfn02WXX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216601-208809@https.bugzilla.kernel.org/>
References: <bug-216601-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216601

--- Comment #2 from KobaKo (koba.ko@canonical.com) ---
Created attachment 303025
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303025&action=3Dedit
lspci_nvvv_202210061524

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
