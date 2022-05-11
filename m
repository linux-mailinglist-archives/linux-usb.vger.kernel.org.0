Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E20D523758
	for <lists+linux-usb@lfdr.de>; Wed, 11 May 2022 17:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343731AbiEKPaf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 11:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343719AbiEKPab (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 11:30:31 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F80E230207
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 08:30:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1566BB82521
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 15:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBEEDC34113
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 15:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652283027;
        bh=WLrmLURRLsbUrfVsXEvq38PCl5Dp6wZ9MzyGM4bA1go=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=rJ9Nuqtdv/kuZrSErUoV/842bBXgjh0F3LRWxvvnwkqpt+xrlYPYgWsjQ5q99aHiu
         3sfo5VC8NOQPQQaToauV7TwOqbhrqdrV56a5wRoqXiszHgnNyNmdxTVvWzt0z/XRDN
         +glxVMyfUNFOWXu2EqhVPe22Qxk/uhXTmrngYYoaBbZ2z5YHxnfvFKVChlZpM2so7Y
         xOjzgRXcMxeCRIOOQVS+RjUlv2Qxno5m3Rg3hYo94rDypqyQPm4arqhEWUpFgqzLwx
         8uzatl73SW1FioGnnJwKhzwFs45AqQFe6Jk5kmJrXs+gXBPkaKUhyPWDUmnjhLGj9K
         L8Ljp/WzOut0g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AB3B4CC13B0; Wed, 11 May 2022 15:30:27 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215967] Kernel build fails if CONFIG_REGULATOR is unset
Date:   Wed, 11 May 2022 15:30:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bjorn@mork.no
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215967-208809-zzJpkg67XY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215967-208809@https.bugzilla.kernel.org/>
References: <bug-215967-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215967

--- Comment #2 from Bj=C3=B8rn Mork (bjorn@mork.no) ---
Greg KH <greg@kroah.com> writes:
> On Wed, May 11, 2022 at 07:44:39AM +0000, bugzilla-daemon@kernel.org wrot=
e:
>
>> Compilation of "drivers/usb/phy/phy-generic.c" fails reproducible if
>> CONFIG_REGULATOR is unset, because function "devm_regulator_get_exclusiv=
e"
>> is
>> undeclared but nevertheless used.
>> The offending patch propably is commit
>> 03e607cbb2931374db1825f371e9c7f28526d3f4
>> upstream
>
> Can you please send this information to the stable@vger.kernel.org
> mailing list and we will work on it there?

Please backport commit 51dfb6ca3728 ("regulator: consumer: Add missing
stubs to regulator/consumer.h") to v5.10 stable and older stable
releases where 03e607cbb2931374db1825f371e9c7f28526d3f4 is backported



Bj=C3=B8rn

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
