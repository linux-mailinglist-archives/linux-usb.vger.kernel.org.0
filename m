Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA6A51F729
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 10:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbiEIItM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 04:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236495AbiEIIRw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 04:17:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B6191ECBA4
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 01:13:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C86626148F
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 08:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37484C385A8
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 08:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652083883;
        bh=iGAQEflcGGwuNHgsLLd3Eo/FXC987CRymiL4ofz1P0M=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=kawX0gq5VWNB776q35r+85FxW8lOp3lSoGtDPUCyhDqdjvxWUXyPAPDKn85DH2m/M
         RLvpfhuoO3j6OUPNTa2aeuYt5pLWSNtut+VKo8biAjAD+cgN0uy1RAnCWdZjXvoVNH
         pUJPXwSa+8JW9k10GCIstgTSJlfO5xHFIU78uU6d1WbJblUP6vNcPWOh0M7VX1llyJ
         +rignvgZ4sLG5dc/+iw+Ekf2axi2oKzefZtDt/Yh6f3OnA+hktUYhFpRNeR/7dbWvb
         UCImE/Yz0+3hw/IdSkT4m2MB61WRDQOSUMlCd5VbvmRgrju25rp/xQwEPWBj0s+fZe
         o8o6WKghHKo3Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E3C78C05FD0; Mon,  9 May 2022 08:11:22 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date:   Mon, 09 May 2022 08:11:22 +0000
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
Message-ID: <bug-215906-208809-PcnO6toeMQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215906-208809@https.bugzilla.kernel.org/>
References: <bug-215906-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215906

Mathias Nyman (mathias.nyman@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mathias.nyman@linux.intel.c
                   |                            |om

--- Comment #6 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
[  +0,229229] xhci_hcd 0000:04:00.0: WARNING: Host System Error

The xHC controller reports a catastrophic error, and sets HSE bit.

For PCI xHC controllers the spec lists possible causes as:
host controller PCI parity error, PCI Master Abort, PCI Target Abort.
But DMA issues also possible cause, especially as log shows  DMAR
problems right after this.

Any chance you could bisect this on upstream kernel?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
