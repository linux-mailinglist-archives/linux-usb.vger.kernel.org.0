Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92DCC53E869
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jun 2022 19:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240937AbiFFPjd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jun 2022 11:39:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240974AbiFFPj3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jun 2022 11:39:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 967D92CCA0
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 08:39:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5251FB81A88
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 15:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01A2AC385A9
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 15:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654529965;
        bh=VDIZVCtTXWb9hEXquSQ274H0AAyHHEc6CYdIgB0ewm0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=A85sF0kRt+NIVND5YQ7O6JRXjgrnPAdT033xu/vU5tiSkwszAK6eZ/x7KW6wSg+Mh
         iHwaGHMqAj6LoGHIUWNnKRXN/k/D+Wf+O8mAe4qNrA0lraUUAOpjl6IU4bJcc+CYsv
         t8PPxePFIc2KseWKJICvez2gMVT0bCGeWLuToXRbwQUlmRlujgzFQyj6t+H20ZB4Zt
         nsInQQsyxBvOy53mosoM/tEx2UPDQvyoYaRBHPi8p1+aH04Zmgwg1qq+9NPtIZky97
         zpQQfvahwF7nrzRpcVVCbjqcjLWqlyv5Ofcu+75B147fwQz4o5I65Uxbzl87/MHZs9
         EYoWYbNz/fYYg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id DA77BC05FD5; Mon,  6 Jun 2022 15:39:24 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216085] MCS9990 not maximum speed USB 2.0
Date:   Mon, 06 Jun 2022 15:39:24 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216085-208809-j4n32BBBQj@https.bugzilla.kernel.org/>
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

--- Comment #3 from Sergey (khseal@yandex.ru) ---
I have used not only ubuntu. I tried other distributions and the problem is=
 the
same.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
