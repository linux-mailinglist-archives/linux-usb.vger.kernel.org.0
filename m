Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8F89658D05
	for <lists+linux-usb@lfdr.de>; Thu, 29 Dec 2022 14:10:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbiL2NKt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Dec 2022 08:10:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiL2NKr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Dec 2022 08:10:47 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FCC8C5E
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 05:10:46 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 22E0AB819C7
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 13:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4DB1C433D2
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 13:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672319443;
        bh=r2XiLlSXjnffha5AyoMArerQUitvL1KN3rJ02nJ6ou0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=oiX+bZdzdMcuFCKShG4Ck50yg1zQ3oGcvt5IvEyBHoC8kWGcdRxAkksICoS7vQ3P/
         lRzRhI4LYQZll5MYFP4VrXQzIOyQxRs6JzJSCEszCdbmdFQu5k15/rLHknT0L0pNY2
         yggFJP1h4kq5Mz5Su50t9Vn9P2lYVUkAXR/NOQRtE/s0Rj3Io7dK37BUg2ZS79cngB
         jTgSKQhQb2UrWR6j+d5GsxeB+e0etPt9DwRhy6PRMgkb89HXk/q39b1oB1wv3kmPQc
         sjMkBGC1RJkBhYwcHI1JS6xq2TUowvUT2GHG0rptFw9uIyxPN8lzCekLrVnSnyQ03r
         tJSgAh8N0i5xg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B18A4C43142; Thu, 29 Dec 2022 13:10:43 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216863] ThinkPad X1 Extreme Gen 5: PCIe Bus Error:
 severity=Corrected, type=Data Link Layer, (Transmitter ID) after resuming
 from sleep
Date:   Thu, 29 Dec 2022 13:10:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: frederick888@tsundere.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216863-208809-A1qvUujdju@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216863-208809@https.bugzilla.kernel.org/>
References: <bug-216863-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216863

--- Comment #1 from Frederick Zhang (frederick888@tsundere.moe) ---
Created attachment 303501
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303501&action=3Dedit
lspci -vv output with pcie_aspm=3Doff

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
