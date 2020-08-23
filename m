Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 731A424EB1D
	for <lists+linux-usb@lfdr.de>; Sun, 23 Aug 2020 06:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725648AbgHWEL0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Aug 2020 00:11:26 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:45053 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725139AbgHWELZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Aug 2020 00:11:25 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id B00E25C0095
        for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2020 00:11:24 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Sun, 23 Aug 2020 00:11:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:date:from:to:subject:content-type; s=
        fm2; bh=m9/vrGOPw7tTTCM+jL3PsYwJJsUOKobeftSnwR8NScA=; b=icrsqTAL
        Nlg356AuSqp51m6unJgOjWMubZErHlYunLsVoY/y5J6KvhsmtJ1lx2FHUQCPxJaf
        tmoaK45WR617D4A690VEraNkVLaKn8vq70zuHXQfwVL0Djj5i2SHijWuDRoVwPkp
        cA0pDfPGWbsqs0GYgF+sSkMloCmZxHrgUKeO4xp2I4W8G21N8AyPakGVM3wVIgfp
        jIvuft7qgUFcPb2p5BU0892nICHA1PFiwspWqUJ+pMbAkLNj+Yc0gZz4Cnkx0JmK
        DWdpPsBtK3V6Tne3YRQbEWW1EUnkXeG53vlHxivLxqs1GWsbWyLhzG69l8AXqAVE
        LRpnbknFWwZvRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm3; bh=m9/vrGOPw7tTTCM+jL3PsYwJJsUOK
        obeftSnwR8NScA=; b=pmzB/3zJ97or+4TE0pt9MeEEXvkhF+nGZtUedWRJSy6xG
        4IbxiG6D4/hsBriV/518OrJNCYGiLf7pBUoMidcquulzfUkFPSFfxxd3uTWPGtyP
        INCkSJJfdCEt049q//Oqk+PU5Vack/fPHssumispwRVQPGbqlolj5RqTpvg1doas
        3JB9d4bQuuX1U+l2++cIuDMkMn1SVJG1sjkt/jlyoOu5PS/VXRH7mhUtvQV01T5J
        +U8hTRcoCg2dzArFQ3OMYZOlODcq4k5wweaoX44R/bmz0gm0syrNpkfuMD3Edz6D
        ICPE4wAYIkvaRw+EQybPUs4ZqUd7dfF2fgogO4LjA==
X-ME-Sender: <xms:bOxBX8JE8OeK0echw8xU5mwKwiAEdd38yoLmylclfh8xDmq7yyJNDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudduhedgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
    erreejnecuhfhrohhmpedfufhiugcuufhprhihfdcuoehsihgusegrvggrmhdruhhsqeen
    ucggtffrrghtthgvrhhnpeekudeuueegudffjeejjeeiheellefhffejgefgvedvieevge
    fhjeehheeiiedtgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehsihgusegrvggrmhdruhhs
X-ME-Proxy: <xmx:bOxBX8Ku4YXExZiau2QHbYdU4lhsQ3Rqf1jOZU_U3ivZwfX5E2cCVQ>
    <xmx:bOxBX8sMUhLA5ja2j-KvRSngWhKsudtMSYxywi0WLooY22lvYttd-Q>
    <xmx:bOxBX5ZAdZ6EAI4jjbbaUT9yxnn9g2vzY_zPBFEHShkKyF7IRqBW5g>
    <xmx:bOxBX7qeted7Vhkx-r0dN-BVCdee1OZC5oiJ932HvqmuJ2QvHpLrnw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 0161666006F; Sun, 23 Aug 2020 00:11:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-214-g5a29d88-fm-20200818.002-g5a29d882
Mime-Version: 1.0
Message-Id: <508e531e-076d-4b02-8aac-783842346bc2@www.fastmail.com>
Date:   Sat, 22 Aug 2020 23:11:03 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     linux-usb@vger.kernel.org
Subject: =?UTF-8?Q?mkdir_acm.${name}_in_configfs_always_fails_with_"Device_or_res?=
 =?UTF-8?Q?ource_busy"?=
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

See title. I'm getting this even when using shell commands, so I don't think it is my program.
Creating anything else, like ncm.usb0, will work.
