Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7A674C2D6F
	for <lists+linux-usb@lfdr.de>; Thu, 24 Feb 2022 14:42:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235248AbiBXNnI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Feb 2022 08:43:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235193AbiBXNmq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Feb 2022 08:42:46 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1CEC13CEFB
        for <linux-usb@vger.kernel.org>; Thu, 24 Feb 2022 05:42:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4D62661B10
        for <linux-usb@vger.kernel.org>; Thu, 24 Feb 2022 13:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC14DC340EC
        for <linux-usb@vger.kernel.org>; Thu, 24 Feb 2022 13:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645710135;
        bh=v6aggMu1Mz119q4AGCqamx0JAr43TiADjRB2Ox4yuPU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gjDpkCAW1LfTar2z49nGgYsB3Pem4drmzFKwPdsr+66Kka3ACd/7Vdsp2dZrkRJjM
         vbmEqIF0Ds5Zsk72WepdssgyAs6nuVYPZTCE2wLqKNLNp4SwuTOztFOQVrsBo2g387
         T1oE3hoGJzfriiZGyP706QVlsD/OexdgSrF/PbPG0hV/YWH7ExeJ5xavaxnrfAlX4s
         nhQTfznRhPAqWfnasbBj9iicpdnPL8PVnisUoOZmfWbQCcRWqevEzBVfxuzVfw2cZn
         8pCkzzFMJWu2AYnZ3LuAzf1/zvzcuIsX48UxCTabpbQOKgK+HC+XyPJBCT282iRBfn
         PgCBNriVhqlJg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 91B95C05FD0; Thu, 24 Feb 2022 13:42:15 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215579] [usbserial] device 0421:069a is in fact supported,
 please add to the list of devices supported by `usbserial`.
Date:   Thu, 24 Feb 2022 13:42:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: johan@kernel.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: IMPLEMENTED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-215579-208809-uF2xuq8Ox9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215579-208809@https.bugzilla.kernel.org/>
References: <bug-215579-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215579

Johan Hovold (johan@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |johan@kernel.org
         Resolution|---                         |IMPLEMENTED

--- Comment #1 from Johan Hovold (johan@kernel.org) ---
Thanks for reporting. Adding a new "simple" driver to handle such phones:

https://lore.kernel.org/r/20220224133109.10523-1-johan@kernel.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
