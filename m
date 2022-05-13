Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52652526045
	for <lists+linux-usb@lfdr.de>; Fri, 13 May 2022 12:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379605AbiEMKsB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 May 2022 06:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379329AbiEMKsA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 May 2022 06:48:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE9BB23EB4B
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 03:47:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8811061682
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 10:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8865C34114
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 10:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652438876;
        bh=0mWejzq59YDnUkBH2t/V/aaUanAdBmX8E4mHPi0tPfI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=BoFtBS80LRjqtYU1LzATm/J5w3axbCESViA9sdzxFuH9Mc1h9ZlnI8+ULDKhjz70i
         lRkiZO0Z7wgtYAXVQe/zx/XGIjUChkfKPCFrrghJ8Ak+60XGsnDuBaZAkdBwSmfxBW
         HbWyEP0RaGp6gRMs5yvpwRa2+5otvcrFra10X6Kis2hhkvZrviXB/P6mcchPw37Q2v
         iPVMQSCfR01IwhkjFpk8WWISqDtZ6wIySGXNtY7r7A7GqYE7LEVzRzawNoGUDsqIkg
         qBDvXY3PVVmZRhVqbRnR6O6ecQ9trNJoTv/X32NOEDo07qELcJf3Kth0Y5+wafR2aA
         w97dqmsu7irYA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CF965CC13B1; Fri, 13 May 2022 10:47:56 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215890] Regression in 5.18: bcm5974 trackpad causes error:
 xhci_hcd rejecting DMA map of vmalloc memory
Date:   Fri, 13 May 2022 10:47:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hch@lst.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215890-208809-f1eSsAtl6y@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215890-208809@https.bugzilla.kernel.org/>
References: <bug-215890-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215890

--- Comment #10 from Christoph Hellwig (hch@lst.de) ---
On Fri, May 13, 2022 at 12:37:24PM +0200, Christoph Hellwig wrote:
> > #regzbot introduced: f5ff79fddf0efecca538046b5cc20fb3ded2
>=20
> Well, this just uncovered an existing bug in the driver.  You can not
> just dma map memory returned from dma_alloc_coherent, and this driver
> would already get vmalloc memory on arm/arm64 platforms anyway, we
> now just do the same on x86 as well.

From a quick look through the trace it seems somehow
usb_hcd_map_urb_for_dma tries to create another DMA mapping for a buffer
allocated from usb_alloc_coherent that uses a dma coherent allocation
below.  It really needs to use the dma address returned from
usb_alloc_coherent instead of trying to map the URB again.  But I don't
have the slightest idea of why that only happens for this particular
setup, and I really need some helpe from the usb folks to untangle it

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
