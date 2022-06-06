Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22C4E53EB05
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jun 2022 19:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238828AbiFFNWl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jun 2022 09:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238854AbiFFNWj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jun 2022 09:22:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 617E015FDB
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 06:22:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EFCC4611C5
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 13:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F21EC34115
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 13:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654521757;
        bh=Z0L2mULbDCR8bg8J24RS8cNMRaIm2cWOZjmXoZV/tBI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cYR+tYkR27ndtNzYx0+XB8heozKZEiLw8uEQt5tUYKhsiroJLnTXx4h+X1UmL8iZI
         9hnyHOZ0P0qwgugoVFfQkr71DTsWItVEe7QNPuIKuGSDR6wLV4tWpBMliLdo2aB/7o
         7wQRj/x5vhF7pdCvWdo0hkfp563ZnCgeoeMC7Z32/tYrq6OYlBI/CHtX0qBbC5XPTL
         Zyjl0xKFKXzWVCIWPZaazC5WuX00sGHOJAN2kJuDlyY82ArmhHF+ZD9b21quHWm96R
         dpFXwmS6XLIN4Lk4S1F8WVE7V/sswNnAi4Iz0jiViUz4jA5E429I6otzdm0HBwzCEe
         5i01Z1EZYQBjQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3890ACAC6E2; Mon,  6 Jun 2022 13:22:37 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215890] Regression in 5.18: bcm5974 trackpad causes error:
 xhci_hcd rejecting DMA map of vmalloc memory
Date:   Mon, 06 Jun 2022 13:22:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215890-208809-danNlp9TJ5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215890-208809@https.bugzilla.kernel.org/>
References: <bug-215890-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215890

--- Comment #24 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Patch sent to linux-input mailinglist

https://lore.kernel.org/linux-input/20220606113636.588955-1-mathias.nyman@l=
inux.intel.com/T/#u

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
