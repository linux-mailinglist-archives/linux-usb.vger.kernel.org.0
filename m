Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5D0953E792
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jun 2022 19:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240448AbiFFPVn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jun 2022 11:21:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240393AbiFFPVm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jun 2022 11:21:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA4F15EA65
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 08:21:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 721D4614F8
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 15:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D25F7C34115
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 15:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654528899;
        bh=zFZFBDXm1Ds4yjXLLRgF7aswPDnXq7XRGocazfwvjH0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=oWeXfGMgARidtQ0EeH5sD/dZb99bxBYQG9IZENeRoiIeAYiq/zaSRCCPyXcWBhsMI
         j0GN94TlKvneRZFKgdMyAv6QKSRxJ1Cbfy7rBMl2XR7SGdJw9W934hBBdHinzpR2/Z
         Vr4Tit0KRMNTDix8JqqOZY2pfd2jU3jtnxsLLiRTXOCD+xG68W+3KavrvwmDmQCS67
         XS6baVFKqUUrxPo2O5TVgG+5v7Yz7GML9KMuRi1B6s9UXL+BYshL6yonhmh5w45uTh
         doAXACVCmU3wzk9nRtZWAqhmz4X059yt+G+J79YeH0hNDWKl1bqWB3DOzAsyuCfsXD
         OppFQxuSzvVNQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BE4CEC05FD4; Mon,  6 Jun 2022 15:21:39 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216085] MCS9990 not maximum speed USB 2.0
Date:   Mon, 06 Jun 2022 15:21:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: khseal@yandex.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216085-208809-Gc1ikgfWxV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216085-208809@https.bugzilla.kernel.org/>
References: <bug-216085-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216085

--- Comment #1 from Sergey (khseal@yandex.ru) ---
Created attachment 301108
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301108&action=3Dedit
Windows ok speed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
