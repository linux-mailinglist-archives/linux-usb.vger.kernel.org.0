Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F04C5A8735
	for <lists+linux-usb@lfdr.de>; Wed, 31 Aug 2022 22:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbiHaUHL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 Aug 2022 16:07:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbiHaUHJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 Aug 2022 16:07:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5EA9C6E93
        for <linux-usb@vger.kernel.org>; Wed, 31 Aug 2022 13:07:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7C8BCB822A8
        for <linux-usb@vger.kernel.org>; Wed, 31 Aug 2022 20:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24B3EC43142
        for <linux-usb@vger.kernel.org>; Wed, 31 Aug 2022 20:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661976426;
        bh=rJyId5TAF7G9Kc6PyCbkG5hjjuaGZFFUac+uDG8DnpY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mVJIn6MuZeukbzICUBSi8JWf8YlgJWUgbQqIFyMz99P4ds2sSyrCWb6O1Ghuk/sWH
         y2gHIFTnKacJ4jY7jYb4/hQ1KPIOza5fNGkAK8nc0zYyTMNyN0j4P+6MW0Q7vBuNv4
         OmzxyGjKZCqAoHLjKNpvBy1rWBzg79u98RmpdE/Z6H4P4vq9QdM6asFpu4CNVSqhUc
         I2dwAgCxQI2tDkHDLT0emmogGcNiIN3hSlE2HoMOtn1WUzp8Djud29GirnZwu9PU7/
         Mqw4FnOArQFNxAuXknBMS/DLtOl333f5g4Q8n89xGlVT+gsBF0awURX0pGQRECCRrY
         AW20U+PbI7NaQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0CF88C433E4; Wed, 31 Aug 2022 20:07:06 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Wed, 31 Aug 2022 20:07:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: grzegorz.alibozek@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210425-208809-nSDRONw3mL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--- Comment #22 from grzegorz.alibozek@gmail.com ---
currently the problem occurs even when I plug and unplug the charger on a
working laptop.

arch linux, 5.19.5-arch1-1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
