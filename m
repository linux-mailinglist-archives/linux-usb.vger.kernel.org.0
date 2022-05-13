Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5D25262F4
	for <lists+linux-usb@lfdr.de>; Fri, 13 May 2022 15:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380663AbiEMNVU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 May 2022 09:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380659AbiEMNVN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 May 2022 09:21:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 280633C4B6
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 06:21:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B0ABA62046
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 13:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24922C34114
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 13:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652448072;
        bh=HM1g2apgtx73y48H9boShiKwX9l++gaN7id6LBiCaJ0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mFDuJNblY0WjOuDnvQ2Fgp0QEnGOvCJTWisImF+iTt/A/sUjMyx2KmbI3PI07OuKW
         HTq8IGMLTVNdkn/f5kgi5H4orIJkEFSchIBKFosV4TNvKf1yn1f76TJ4XL200ggxCU
         chsxtT6GG6p1aZJGfsSyeNpjeMu7AoO1Uy1o5bmzllbY7YDyZna1K+cMu5s+yluUuW
         /oB1z4O5PyoDQIkno86UDhHNza3OxtJmy26bvD+K8+B3YB85dKzR5HwGobyRilBphn
         78Eq5SUsCnKqXdD23SLI8PmPLp/Jy/z/azFdsuADvwERpwibh2eBJr7PDuLYOX7Fu9
         pp8+rK5rPozhQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1131BC05FF5; Fri, 13 May 2022 13:21:12 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215890] Regression in 5.18: bcm5974 trackpad causes error:
 xhci_hcd rejecting DMA map of vmalloc memory
Date:   Fri, 13 May 2022 13:21:11 +0000
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
Message-ID: <bug-215890-208809-T3xPepZzC2@https.bugzilla.kernel.org/>
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

Mathias Nyman (mathias.nyman@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mathias.nyman@linux.intel.c
                   |                            |om

--- Comment #11 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Could it be that bcm5974 driver just forgot to set the URB_NO_TRANSFER_DMA_=
MAP
flag in urb transfer_flags?

If the usb driver does the allocation and dma mapping, and sets
urb->transfer_dma
then it should set that flag. Otherwise usbcore will map the DMA address.

Documentation/driver-api/usb/dma.rst:

- URBs have an additional "transfer_dma" field, as well as a transfer_flags
  bit saying if it's valid.  (Control requests also have "setup_dma", but
  drivers must not use it.)

- "usbcore" will map this DMA address, if a DMA-aware driver didn't do
  it first and set ``URB_NO_TRANSFER_DMA_MAP``.  HCDs
  don't manage dma mappings for URBs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
