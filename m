Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52B56771943
	for <lists+linux-usb@lfdr.de>; Mon,  7 Aug 2023 07:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbjHGFMO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Aug 2023 01:12:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjHGFMN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Aug 2023 01:12:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E74C10FD
        for <linux-usb@vger.kernel.org>; Sun,  6 Aug 2023 22:12:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C14EC61478
        for <linux-usb@vger.kernel.org>; Mon,  7 Aug 2023 05:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 213F9C433C7
        for <linux-usb@vger.kernel.org>; Mon,  7 Aug 2023 05:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691385131;
        bh=ZNfVX87P485U/8W45WSbqW3/s2QiZC/wtSgOzM+xuW0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=S6Eb45JM9RpRP473zyUCc4onGmYcCoQ3FBBJNFFXpWe8uRjGDyAkhw8+3gjv7X+xe
         WBTC/flisW0VPmTKwGXBNkj35bixOLRRWCsjMMFcRvqNVc9HYA8EWftmne71XnRFXJ
         KvhwLQFkdY52YxRrqSETY/1WefOX7aWOmXSiRaHTkiRIekoYPil2vdSKfg/2BNYrIm
         iDHTcpdHgVjtFxtPBRLVsiIb8DzawPxYsM9+Yqa0sbTuxXsd7BjBW0PT7ac9CgcCfX
         McJY8ZGkLapXo+zR59qJs9oCB9MZrISMjIJdoVp97/wqjXN7OJ7ryCsTrQm6D+DmHq
         yr3CJ3HmrjoTg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id F3C14C4332E; Mon,  7 Aug 2023 05:12:10 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Mon, 07 Aug 2023 05:12:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ZeroBeat@gmx.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217122-208809-HeN4hJT8tO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217122-208809@https.bugzilla.kernel.org/>
References: <bug-217122-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217122

--- Comment #31 from Michael (ZeroBeat@gmx.de) ---
Looks like the problem still exist after applying the patch:
https://github.com/ZerBea/hcxdumptool/issues/334#issuecomment-1667093519

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
