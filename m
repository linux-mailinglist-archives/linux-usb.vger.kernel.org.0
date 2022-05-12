Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13B455252BB
	for <lists+linux-usb@lfdr.de>; Thu, 12 May 2022 18:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352398AbiELQgv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 May 2022 12:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356559AbiELQgp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 May 2022 12:36:45 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB15C663E4
        for <linux-usb@vger.kernel.org>; Thu, 12 May 2022 09:36:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D68B2B82A04
        for <linux-usb@vger.kernel.org>; Thu, 12 May 2022 16:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9266CC385B8
        for <linux-usb@vger.kernel.org>; Thu, 12 May 2022 16:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652373400;
        bh=1eV1FJdRQYfq+96F43J+V9dHkRYmaAmSz5oQKJVberc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=nEmFYB40btodGQb9+BxmHhXzzD4vyPK6uuqtXVq0mBEXqeEg4WEONFUyY0F0ChASt
         YZnpGRX/th3DUbCFGDYNvIA3QmFQacGyGz9L8l2r9sOorSapUGvZrXOyeFMHh+rZS5
         ET7TrSqqevWnC2wIZ7LPt8DKVrFeO3ZxmsGdB24YOIcUVSbWVX6zcnpeA5dFeksaJe
         dlTFuyZJEmITM4AczXG8z8b5ikqVGVwaTuuYZjOSjVOHrYDLqAnd1v21N0OsxtBuc9
         eNbgFOaGqqKt/I2N/rGqNqJh88w0go9BAkpMmfzz6bx9bXSNJhaTdoxDuZyVoFQNDH
         w7fqkbQ+k99Ng==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7F6ACCAC6E2; Thu, 12 May 2022 16:36:40 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215890] Regression in 5.18: bcm5974 trackpad causes error:
 xhci_hcd rejecting DMA map of vmalloc memory
Date:   Thu, 12 May 2022 16:36:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: satadru@umich.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215890-208809-24z8MYRVTo@https.bugzilla.kernel.org/>
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

--- Comment #7 from Satadru Pramanik (satadru@umich.edu) ---
After bisection:
git bisect good
f5ff79fddf0efecca538046b5cc20fb3ded2ec4f is the first bad commit
commit f5ff79fddf0efecca538046b5cc20fb3ded2ec4f
Author: Christoph Hellwig <hch@lst.de>
Date:   Sat Feb 26 16:40:21 2022 +0100

    dma-mapping: remove CONFIG_DMA_REMAP

    CONFIG_DMA_REMAP is used to build a few helpers around the core
    vmalloc code, and to use them in case there is a highmem page in
    dma-direct, and to make dma coherent allocations be able to use
    non-contiguous pages allocations for DMA allocations in the dma-iommu
    layer.

    Right now it needs to be explicitly selected by architectures, and
    is only done so by architectures that require remapping to deal
    with devices that are not DMA coherent.  Make it unconditional for
    builds with CONFIG_MMU as it is very little extra code, but makes
    it much more likely that large DMA allocations succeed on x86.

    This fixes hot plugging a NVMe thunderbolt SSD for me, which tries
    to allocate a 1MB buffer that is otherwise hard to obtain due to
    memory fragmentation on a heavily used laptop.

    Signed-off-by: Christoph Hellwig <hch@lst.de>
    Reviewed-by: Robin Murphy <robin.murphy@arm.com>

 arch/arm/Kconfig          |  2 +-
 arch/xtensa/Kconfig       |  2 +-
 drivers/iommu/dma-iommu.c | 14 +++++---------
 kernel/dma/Kconfig        |  7 +------
 kernel/dma/Makefile       |  2 +-
 kernel/dma/direct.c       | 18 +++++++-----------
 6 files changed, 16 insertions(+), 29 deletions(-)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
