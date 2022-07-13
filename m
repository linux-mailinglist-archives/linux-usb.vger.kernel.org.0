Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD37573A0D
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jul 2022 17:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236478AbiGMPYm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jul 2022 11:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234650AbiGMPYl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jul 2022 11:24:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD921248EF
        for <linux-usb@vger.kernel.org>; Wed, 13 Jul 2022 08:24:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 574E761750
        for <linux-usb@vger.kernel.org>; Wed, 13 Jul 2022 15:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC289C341C6
        for <linux-usb@vger.kernel.org>; Wed, 13 Jul 2022 15:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657725879;
        bh=0RyZa8ECq950Se8EBs7p0jPZbfaqWMY0rPZoH0pqKcA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=RDLjB9eaK7MmGV23kc++MfXJ0n5joeHngUxTsrBnje6xjG67hzeAfg7Mtf9GQ9tv7
         ve/7SS5Sa6xv/5MnCfye3bh2ztpTubw4Re3XX/CZvWVJ73S7WH6wOsmAdNHuRF8PM4
         m4llKD1D9s22O/jRUAPj/PrxN9Gg9Vp1lMzg/pdmF0ZSmNfrp6LdY4a66wQnqkJXIQ
         C0BWFb4HO1e8t3NPJw5wI05LYB/ARaYGbWM8QU+P0c3Ha32taosvwS2FONmFafbJDW
         OHJsajhTyR3XAohHDsWs8ZNItDHlDoaIs9bFUdPnxULwY7NL9eVnnm3FO2/cbLTJy9
         H4a9UumJZhj0g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 928B1CC13B0; Wed, 13 Jul 2022 15:24:39 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216140] rtsx_usb causes error: xhci_hcd rejecting DMA map of
 vmalloc memory
Date:   Wed, 13 Jul 2022 15:24:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: buboleck@abv.bg
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216140-208809-bExEkoPH1a@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216140-208809@https.bugzilla.kernel.org/>
References: <bug-216140-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216140

Dimitar Kosev (buboleck@abv.bg) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |PATCH_ALREADY_AVAILABLE

--- Comment #4 from Dimitar Kosev (buboleck@abv.bg) ---
Fixed in 5.18.11/5.19-rc6 and later with commit
eb7f8e28420372787933eec079735c35034bda7d

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
