Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3652B6ABF02
	for <lists+linux-usb@lfdr.de>; Mon,  6 Mar 2023 13:04:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbjCFMEM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Mar 2023 07:04:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbjCFMEG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Mar 2023 07:04:06 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA47E1E9E0
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 04:04:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 362B7B80DA0
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 12:04:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CAFD0C433D2
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 12:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678104238;
        bh=YK/dRu5aX8RGD8HMCyg2hmJW+XOk1UE6OCm5qbbCXJM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=b8zNHzth5+3xzhQi+9nxx7GhdvUP/GFjJwI8gJp3PFoFoLTiXLzdotqdbZVlUAFHH
         ErTzztG+dOdbQpPco8WwrYJFFt9evmQEgXPzuCBic/tGCC0HuUfpgdeLeVAXsFZ8BL
         ssZ8vMSX/mvLXe6u0KGOfd/ysmIgX5wBwF1U9MbklAS473/sjhOao/v6+QUJdOTBx5
         1e0v7DprZ02JyFaBFZSYnTkTlFP4CC+RqbAWtNEQ5E3ryyypbk3S5t2DOoGZs8Vkle
         LecknXutgu+gjbwZ79LoZS1HR/vzCasi1/xaBl+1jmJIDoszNZu3nGqNaOwL+2O8jX
         I5BNsQXm7/hIA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B0C3BC43143; Mon,  6 Mar 2023 12:03:58 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Mon, 06 Mar 2023 12:03:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216728-208809-ZdPqKMIAhY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

--- Comment #27 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Hi, can you try if this reproduces on v6.3-rc1? There are fixes from Lukas =
that
should handle this one too:

ac91e6980563 ("PCI: Unify delay handling for reset and resume")

and related. I will check tomorrow on that CML based system when I'm in the
office.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
