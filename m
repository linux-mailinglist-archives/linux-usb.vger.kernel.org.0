Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D699575665A
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jul 2023 16:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbjGQOak (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jul 2023 10:30:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjGQOaj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jul 2023 10:30:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E621A8
        for <linux-usb@vger.kernel.org>; Mon, 17 Jul 2023 07:30:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F418C6105A
        for <linux-usb@vger.kernel.org>; Mon, 17 Jul 2023 14:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6235EC433C8
        for <linux-usb@vger.kernel.org>; Mon, 17 Jul 2023 14:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689604237;
        bh=7WlWTL1nVc2jqjaepytLwyFuz/xwscFKfjO/bUnlLHg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ryhZEoPzoPAxH6PMraRrRBdWfEznYucdEDuGmpq6DndnueUPu9d47tTAAi3xweCwu
         2UhLClLMnKC+DDKbUq9NzprbBHFIT7fzwVdx49uhxfno4Q5kp5DJ1lbdoDv5Q8KnwN
         Ukstl+pdgwu3kjA7QaG6DxypPemMAKm9L/DXz9hylbPz/M0eRPuDMoDmCVQqLgjPA8
         6YguiN1k5VIHuTNNp0aXy3a++h7N3+i/g13VgmLrA3PjUyPkxAuXxuMEXU1Q6lManD
         cFg844tjo9XZaVD4VDCmRM4A5My3J0+UYRsu7TZSv+nmgAt1XxCl9/xTv32OEHKVTc
         jHpW8wsn4mtKA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4A536C53BD0; Mon, 17 Jul 2023 14:30:37 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217670] dwc3: regression in USB DWC3 driver in kernel 5.15
 branch
Date:   Mon, 17 Jul 2023 14:30:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217670-208809-0ERmdrzR8c@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217670-208809@https.bugzilla.kernel.org/>
References: <bug-217670-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217670

--- Comment #7 from Greg Kroah-Hartman (greg@kroah.com) ---
On Mon, Jul 17, 2023 at 06:36:08AM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D217670
>=20
> --- Comment #6 from Tomasz Rostanski (tomasz.rostanski@thalesgroup.com) -=
--
> The commit a6fc2f1b092787e9d7dbe472d720cede81680315 has dependencies of
> previous commits, so at the minimum the following commits needs to be
> backported:
>=20
> 7bee318838890 usb: dwc3: reference clock period configuration
> a5ae3cbe9dfcc usb: dwc3: Get clocks individually
> 5114c3ee24875 usb: dwc3: Calculate REFCLKPER based on reference clock
> 596c87856e08d usb: dwc3: Program GFLADJ
> a6fc2f1b09278 usb: dwc3: core: add gfladj_refclk_lpm_sel quirk

Can you test this to verify that it does actually work for you?

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
