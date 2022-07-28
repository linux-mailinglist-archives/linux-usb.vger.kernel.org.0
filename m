Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8CD584748
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jul 2022 22:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232341AbiG1U4f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jul 2022 16:56:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbiG1U4e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jul 2022 16:56:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E636774CCC
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 13:56:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 87B1960F1B
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 20:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7724C43470
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 20:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659041792;
        bh=ebQV5hvun1DHpDiaLFlM9vAh7huIVWvketOBthMowWs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=pWaS4BsmCMUPno4QUveozF0WL3vf1Jz+5Gw5Pr1RiR1My/R25GOASR9WtEYc1cZ5x
         53JENJEOGnZtErQxvq+uwKHbr+YBofDx3DfKU5lyRel0hGaKCqUAe1JMQRFYAOziba
         k9E2iCZ28SvN/k9WYN8nzmY4FUmpf11YzRoaJ2FmJVoTz3IZtkdj9FhS25a85uVgvP
         TXgE+Ch29cIboD6iIROOrdTn83wGrPhMrBnrZ688oy2XloqvuWEQCxfVx5zvkG6zE9
         i4Xr52Vykg3+ycjCgVAqehEt04928HjOE+pOn70ybYHlcZtscDW/DN+nD/zm4ryA8h
         ZrFxr/rHB3PQw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CC4B6C433E7; Thu, 28 Jul 2022 20:56:32 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Thu, 28 Jul 2022 20:56:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kjhambrick@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214259-208809-dTE6cQW7JP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214259-208809@https.bugzilla.kernel.org/>
References: <bug-214259-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214259

--- Comment #24 from Konrad J Hambrick (kjhambrick@gmail.com) ---
Thanks for the info and the tip, wse !

-- kjh

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
