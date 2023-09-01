Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D914B78FDCF
	for <lists+linux-usb@lfdr.de>; Fri,  1 Sep 2023 14:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345871AbjIAMz4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Sep 2023 08:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231492AbjIAMz4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Sep 2023 08:55:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2F2DE0
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 05:55:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7291660DFA
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 12:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA439C433C7
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 12:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693572952;
        bh=uiDNx9FB22Yp7+YLINvKoC7GWHho2B8d4WIyD1XzrIA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lVYRHCDVyPINGfTbl0JENB1C/z9gV3IgEvSzBJFWETvFJqP51haLsATJiuxlJ5yPo
         FCwJhC+wsTEsAZOcaAMLHCR8xXYHxy3Swoa6lGAiCGjxTRlBdXQt7TGp0dhNPVQFQ8
         Cg753rbEk0qndbsMzmHo8jlX9wRHOxUcU08SQuBVDakcehOEyVfW0MB16HIoWF1mnI
         BHlyYw85FJkxDItJllc3CbN6UJxjIbDiIk8PAJDIKJ97Z2sVdWVBbN49lmXdnykkhJ
         vCFWCQrqC2MBVcQinPcsYvQjVPqLD7tbJkBFZyNb7g74SSUTlUQ7M7WreKhTCs69n1
         x1iS3PvrFYMTg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CA967C4332E; Fri,  1 Sep 2023 12:55:52 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217670] dwc3: regression in USB DWC3 driver in kernel 5.15
 branch
Date:   Fri, 01 Sep 2023 12:55:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tomasz.rostanski@thalesgroup.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-217670-208809-R8Ta6vxblY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217670-208809@https.bugzilla.kernel.org/>
References: <bug-217670-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217670

Tomasz Rostanski (tomasz.rostanski@thalesgroup.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #305005|0                           |1
        is obsolete|                            |

--- Comment #21 from Tomasz Rostanski (tomasz.rostanski@thalesgroup.com) ---
Created attachment 305010
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305010&action=3Dedit
0003-usb-dwc3-Calculate-REFCLKPER-based-on-reference-cloc.patch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
