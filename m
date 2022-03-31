Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 917144ED50D
	for <lists+linux-usb@lfdr.de>; Thu, 31 Mar 2022 09:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232040AbiCaH4T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 31 Mar 2022 03:56:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiCaH4R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 31 Mar 2022 03:56:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0889B188
        for <linux-usb@vger.kernel.org>; Thu, 31 Mar 2022 00:54:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5800861803
        for <linux-usb@vger.kernel.org>; Thu, 31 Mar 2022 07:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9AE1C340F2
        for <linux-usb@vger.kernel.org>; Thu, 31 Mar 2022 07:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648713267;
        bh=3KJ6j0DGPAJ30pn7wEUgHz8fRqNmJuPMEYqIVNfkntQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=u/IOrVM7POSnlnLSBIn055wQJsp6DBdJa2asWmKi22NdW8wnodLix8t4bcSC8mxHl
         Avh6kjpMvW5QZP4lCB8qYvSEi49Q/PYuwiik0DtfN0W0pV2FSPDAQH+9IReQcCU+gt
         eNKAFRrfdpsdGlSSFeV8xfDjWQyebqlwvc9Lkeqk/JxlGa76dmZYychYSwmfB4CrB7
         1WEkpj6IEb9ETYgEuD1iKVV8CQAA8c1Ea7Hehnejxac4IMElZIE/sFTAo0Y4oK6SKH
         SZ2bjG2zFJ/OmO/7V6sDCXZ/LmKF0T59mlwPX64GMDqGOTBdLIwc4cTeRbAyLkSGsH
         T5e3kKkR0hkIg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A9398C05F98; Thu, 31 Mar 2022 07:54:27 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date:   Thu, 31 Mar 2022 07:54:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215740-208809-WDpFfImX5Y@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215740-208809@https.bugzilla.kernel.org/>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

Mathias Nyman (mathias.nyman@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mathias.nyman@linux.intel.c
                   |                            |om

--- Comment #4 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
That warning was added in v5.14:
2b4bbc6231d7 dma-debug: report -EEXIST errors in add_dma_entry

Actual issue on usb side could be a lot older.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
