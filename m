Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3F1F547675
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jun 2022 18:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233365AbiFKQ3i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Jun 2022 12:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233120AbiFKQ3g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 Jun 2022 12:29:36 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A684F47B
        for <linux-usb@vger.kernel.org>; Sat, 11 Jun 2022 09:29:33 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id l18so2052713lje.13
        for <linux-usb@vger.kernel.org>; Sat, 11 Jun 2022 09:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=X1nDz0NffzQJOCQZW1tF8EhKqJz6ggp/Xyqs7aWNBlc=;
        b=NvM77AsQW8matgf0LTMDXu9/46wijoq/BAfost7cjwmgTl2QgySxu38WoHMAuRJBG7
         dZlkAzVEZPvX4fWdyLgKzkzA/A5Hbw29XZRuskAyVW9JguMuo/3GK020ipfdZDQbyrMh
         4wgXdrIPOQ0j3awVSfjVbfZboQ9CVP7bqFj55t4bSy2gJt+PYy3EYJBAKbXyRBS1CaDY
         W1HFEvgOG50VjHt9yu4FUYJygEK7UDComnzUUTiCsxK/3d3ZDiPhGB05FLtaSv4H8ox4
         B+Q/l7igTYpcjGDH/yPM640q5RalB1v5XqjE5HWO0/FpuJTSebpwVqo3R+OmwUgSc1Vn
         CZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=X1nDz0NffzQJOCQZW1tF8EhKqJz6ggp/Xyqs7aWNBlc=;
        b=6o9oUD7pkmE355S2aCs/LIiy7Fsu03Wy1NLI8z204pBaSaEgssU2EbzpoSN1LtYuMd
         IkkMX443FJvXCfWcLeuV55Fko4iS8KLxjmq4JTvM5svzSi6ntXVpyz8ecgYSol9LP3Xg
         ckOR68TFAIdbT+EEVNMzq74MuSzku3ib4IZZpCF5jfJrt99ryCJlmF2XLxVs/2R7yW2J
         OeWag/Dztoyie40cjpLdMAlnC1yANEl7DiJt87K1lrnKnaKYiYcyfjNMId9Z/cJpfZgt
         fmG4MuhizSxEoyBzY3FdMrVzpaPYnV17I9fB6+rHBBaqcUuuDjoT/0fmEUdRQKLRyT3F
         kD9Q==
X-Gm-Message-State: AOAM532pzX0KNubmwNgpdw3B2oqtplF0rJlWTk4yw7VvyeqRv8M4J3hN
        jDeGNn5s6Wroff32t0p2rlfF0rdWoJ/6SA==
X-Google-Smtp-Source: ABdhPJzWDP7B/p4xGpsR9mEouM+YH2T9TotJ+yVFq/J1djQCVrecRkpvkgEPvDAIt+LrVoppqQHgLQ==
X-Received: by 2002:a05:651c:4c9:b0:255:aeac:91e0 with SMTP id e9-20020a05651c04c900b00255aeac91e0mr12480663lji.449.1654964971805;
        Sat, 11 Jun 2022 09:29:31 -0700 (PDT)
Received: from [192.168.1.168] (078088109026.wroclaw.vectranet.pl. [78.88.109.26])
        by smtp.gmail.com with ESMTPSA id m4-20020a056512114400b00478e9b28fe4sm310348lfg.80.2022.06.11.09.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jun 2022 09:29:30 -0700 (PDT)
Message-ID: <494c3280c58455b2439559f1b48858caf22b8c8f.camel@gmail.com>
Subject: Re: Thunderbolt: One missing DisplayPort?
From:   Tomasz =?UTF-8?Q?Mo=C5=84?= <desowin@gmail.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Stefan Hoffmeister <stefan.hoffmeister@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Date:   Sat, 11 Jun 2022 18:29:28 +0200
In-Reply-To: <cf0dbecff8e70d15c7121bfdee16d945ba52b55c.camel@gmail.com>
References: <CALhB_QNhzHkf4Yw6TqZAbCisMK6TBy8ecw0M_Sq=EQXPN728fg@mail.gmail.com>
         <Yoy5m3Aa6QwVcFhf@kuha.fi.intel.com> <Yoy7oXpMugFFmfBP@lahna>
         <CALhB_QM9SHJt+15pEVHEH_kourb-1Xbd68O1p_XLxOmWB4HAfw@mail.gmail.com>
         <YpCVc6eYkpmjP9AF@lahna>
         <CALhB_QP8SPqubq-eBNa1BTMuy3kCA65OuajOeJGt5DB9jDRKKg@mail.gmail.com>
         <ce969e3b4a6ed04584fdecd3234578bd87d52594.camel@gmail.com>
         <YpSUSk9u5z3ueufa@lahna>
         <92ab08fe65c12d6159966bdd7d2c4215044a00ff.camel@gmail.com>
         <YpmWXl5Y/VToYFvJ@lahna>
         <cf0dbecff8e70d15c7121bfdee16d945ba52b55c.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2022-06-08 at 16:27 +0200, Tomasz Mo=C5=84 wrote:
> On Fri, 2022-06-03 at 08:04 +0300, Mika Westerberg wrote:
> > On Thu, Jun 02, 2022 at 09:34:27PM +0200, Tomasz Mo=C5=84 wrote:
> > > How do I determine that the cable is non-Thunderbolt Type-C?
> >=20
> > It does not have that "lightning" logo on the connector.
>=20
> I got two more (to a total of 4) cables without lightning logo and all
> seem to enter Thunderbolt mode.

I managed to get an active 3 meters long USB Type-C cable. It is both a
directional cable (meaning the host end has to be plugged into laptop
and sink into dock) and appear to have working display port only when
connected with correct plug orientation. That is, rotating USB-C plug
180 degrees switches between working DP altmode and non-working.

The active cable I have features retimer in the middle of the cable.
The retimer is definitely noticeable (it is bulky) and does get warm
when in use.

This cable indeed does inhibit Thunderbolt operation and dock status in
boltctl is disconnected.

The EMCA information for the active cable is below. Even though the
cable is 3 meters long it claims to be 2 meters.


Type     Active Cable
Vendor   Unknown (0x0bda)
Specs    [ <20ns (~2m) ] [ 20V ] [ 3A ] [ USB3 10Gbps ]
VER      HW:0001 FW:0002 VDO:0 v:2
Vdo object hex
IdHeader 0x24000bda
CertStat 0x00000000
Product  0x00000209
Cable    0x120851b2
SVISD    0x0bdaff01
TBT3/4   0x00000000
