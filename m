Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A273E6E258E
	for <lists+linux-usb@lfdr.de>; Fri, 14 Apr 2023 16:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbjDNOYQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Apr 2023 10:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjDNOYP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Apr 2023 10:24:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D73DC1709
        for <linux-usb@vger.kernel.org>; Fri, 14 Apr 2023 07:24:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7390E61048
        for <linux-usb@vger.kernel.org>; Fri, 14 Apr 2023 14:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD9CDC433D2
        for <linux-usb@vger.kernel.org>; Fri, 14 Apr 2023 14:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681482253;
        bh=HTTcozjvodqDvFcJ4JGTJvf6W8imdjEomRKr1QNvCzU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mDYzFQdNfjxsYnU6hzxGWQHdJ6sd0BgI6ouqA4t/5v6hjQ0FcXsT+3mwJ9qp2M3UM
         1blTlZbxj5jWeP1RcO3bbkMKqP0RMm+GtmltwbdS02OdGaVcUiX9Q4vAYpQu/uKbqq
         UCXGmiDX1D3/2Ph0hqi2V4enEe+mWbPUsXMFAg6Jsq+yokRG9djR8OPp2Cz/mGS00a
         m7ihj2Kqqx31Jx11tdn7gw86KVE9aNcY3fCDu61vdiLSBBs8QSKBIh2YQfKm0MSk0/
         1P+1PKBKF9675cVb/SSKZfVxPCkcRDzLPKQn7ybRsOCkj9PCqnwJ04eSFptAGZVfYv
         5y3gDfGMDGyQQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C40ADC43143; Fri, 14 Apr 2023 14:24:13 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Fri, 14 Apr 2023 14:24:13 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217242-208809-XlMqjDxTua@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #19 from Mathias Nyman (mathias.nyman@linux.intel.com) ---

I suspect the offending commit is:
55f6153d8cc8 xhci: remove extra loop in interrupt context

It changes how num_trbs_free is counted for a ring.=20

I'll attach a debug patch that will track both free trb and ring expansion

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
