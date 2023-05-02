Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86AF66F4229
	for <lists+linux-usb@lfdr.de>; Tue,  2 May 2023 13:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233858AbjEBLAu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 May 2023 07:00:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233855AbjEBLAs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 May 2023 07:00:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3424749C6
        for <linux-usb@vger.kernel.org>; Tue,  2 May 2023 04:00:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BEAA16230C
        for <linux-usb@vger.kernel.org>; Tue,  2 May 2023 11:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C1E8C4339B
        for <linux-usb@vger.kernel.org>; Tue,  2 May 2023 11:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683025245;
        bh=FgZJF4joJ9lheefs0c0bkrptL44rUJeMuHE/cGkCq2w=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ZrsDBF8xL651mSz5pSt0Eff+J3vdPrbwvgJxH3/Ozui737m4SQsnN/QN5rNluubqL
         T0LQj1Tn+gbfDuUpOf5SRJ8AgxBgUTeYSdk7dFg+COv+AByxqqk2v3lYY1RO6HLLS8
         qPMgHiqcA6ndQ1nK6i1gvtVLZ6cmB5LzaiwKjM1OjzyWT2Lr/YXEPRx0t/Y3Z8mHTP
         oIEXpntzoF/uhl4xRfIJyHp3OE1l3mGygtFIr1GeT7OYppHe134xNHEu+EdyIHvyRM
         Turx4Eeba627+FDZ5dMnHnass7xfcfjgITgczICItOldx+3/Q3yZT6+k5UED0ERiKI
         pzyvADcjtXDpw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1B61CC43145; Tue,  2 May 2023 11:00:45 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Tue, 02 May 2023 11:00:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: Liang.Xiao1@dell.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216728-208809-MLVqW9aQUr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

--- Comment #29 from Liang.Xiao1@dell.com ---
Hi Dear Sender,
I'm OoO for Labor Day Holiday during 4/29 ~ 5/5 without email access, please
expect my delay response.

Sorry for inconvinence.

Thanks
/Liang

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
