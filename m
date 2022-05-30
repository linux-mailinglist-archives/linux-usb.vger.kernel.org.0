Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71B6F5386F7
	for <lists+linux-usb@lfdr.de>; Mon, 30 May 2022 20:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238334AbiE3SCi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 May 2022 14:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232840AbiE3SCh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 May 2022 14:02:37 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77D41A2049
        for <linux-usb@vger.kernel.org>; Mon, 30 May 2022 11:02:35 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id v19so7193370edd.4
        for <linux-usb@vger.kernel.org>; Mon, 30 May 2022 11:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1DXhStYiillvE4HfCLpclmo42laGHhWdYeKNbq2XZDI=;
        b=k9mvX94m1/GxgTlYolwVw8gECUgPGfPzzH7RdWe2Gh2oQQTc5tLMXHfGDJXYDQQFlD
         wTbbm7oGLA7yU85mXsqUisWJ9JZ82+Tc3O4eaXnOWVZH7xEVH6pKxziyzZv3ETse+/jh
         wN6J+aeETGUCppgXT8ADN4nP56feHaFY5D76BJDfUjJ2VGKDkdb5+/PvVg82cgQL7f//
         t8mG2lCBjXEcCm1DQCE16bfJCkgrhrS5fagKeq0tXkhYwUw5GYTRTUz/wZDHGw01Oj2L
         Rv34xN0Y0DEnv26MEpu39O+MeoglG6H2Br6x4p3CImEfu90srQ/2hqDi/m6mbqqBGYH6
         LyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1DXhStYiillvE4HfCLpclmo42laGHhWdYeKNbq2XZDI=;
        b=hQ7tpCr2cuW3DlPbHGv6mUHw6Qx0YQ9e0fiuR05h6k/uFuqY4mOp28K2yP6sEQLeeD
         rbyk+bcC5F3e1nVeuKSflLIaP0sa4rphrv5HOrxVErvBgPEHfoI2NTjXCs7PaRIQt71P
         g2gyov39Ny0YvjQ3UFZvPbDACzpqK9TUYg+Vq8Hm8zMLDwhc89IlfEMb9UQrS5nom3xB
         LUC43P5Cwo5Wr7TIY9toRVppukuWdPpPm32Ni+8rMfG6cXhInNdDn8ez7N9kP5AMMazE
         bTXMSNPjBUbpg/R2fDu9I09Ho9WkbWJMIKr3IYRw0+dhjiSeqOftEBiZE5i5mu4cLEYC
         AN0w==
X-Gm-Message-State: AOAM530hxLm/yKdk5Ehg5M3Gkl8lnceTrv2SZ0a0v57+e3Lj/SmqD/ok
        TbuqOGK+KG3fatRz0/jJJV4SNGiSOsxKBluhfcw=
X-Google-Smtp-Source: ABdhPJwXLNPv9AekalcZ7pGYA//i6Ta40+UM6ad3vgJgyLZ2z0MgBjQN6ncX8+BeW5vi6ydIwWvOPAwQNJSwJ3asHo4=
X-Received: by 2002:a05:6402:34d4:b0:42b:35e5:fc78 with SMTP id
 w20-20020a05640234d400b0042b35e5fc78mr50021614edc.372.1653933753849; Mon, 30
 May 2022 11:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <CALhB_QNhzHkf4Yw6TqZAbCisMK6TBy8ecw0M_Sq=EQXPN728fg@mail.gmail.com>
 <Yoy5m3Aa6QwVcFhf@kuha.fi.intel.com> <Yoy7oXpMugFFmfBP@lahna>
 <CALhB_QM9SHJt+15pEVHEH_kourb-1Xbd68O1p_XLxOmWB4HAfw@mail.gmail.com>
 <YpCVc6eYkpmjP9AF@lahna> <CALhB_QP8SPqubq-eBNa1BTMuy3kCA65OuajOeJGt5DB9jDRKKg@mail.gmail.com>
 <ce969e3b4a6ed04584fdecd3234578bd87d52594.camel@gmail.com>
In-Reply-To: <ce969e3b4a6ed04584fdecd3234578bd87d52594.camel@gmail.com>
From:   Stefan Hoffmeister <stefan.hoffmeister@gmail.com>
Date:   Mon, 30 May 2022 20:02:22 +0200
Message-ID: <CALhB_QPsVRDv2PdsyDXS8WYr_BVv4XQikp3OCqd8u+H00JkUgQ@mail.gmail.com>
Subject: Re: Thunderbolt: One missing DisplayPort?
To:     =?UTF-8?Q?Tomasz_Mo=C5=84?= <desowin@gmail.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 30, 2022 at 10:33 AM Tomasz Mo=C5=84 <desowin@gmail.com> wrote:
>
> On Sun, 2022-05-29 at 21:51 +0200, Stefan Hoffmeister wrote:
> > I have managed to wedge the system into a state where it does not
> > know about Thunderbolt, and now, on what I presume to be USB-C only

> Could you please tell how did you wedge the system into a state where
> it does not know about Thunderbolt?

I was thinking of going the "find a bad-enough good cable" route as
mentioned by Mika, but then I discovered that I possess only
* a Thunderbolt cable
* a 100W power delivery cable (which to my surprise still does what
appears to be USB 2.0)
and that it was the weekend.

Incidentally I had been poking at the "Dell Client Configuration
Toolkit" (hardly advertised) previously - which, at least in its
RedHat 8 incarnation, will destroy anything related to openssl (in
particular sudoers) through ldconfig on Fedora 36 in a native
installation, with much fun ensuing given a disabled root account. But
I digress.

The "Dell Client Configuration Toolkit" gives you command-line access
to the BIOS on modern (2018+) Dell boxes; this exposes a BIOS
configuration option (not visible / recognizable in the BIOS UI) to
set "ThunderboltPorts" to "Disabled". Setting that to "Enabled" didn't
make the laptop explode, so "Disabled" apparently reconfigured /
forced the onboard TB4 Intel controller to forget everything about
Thunderbolt, ending up with plain USB-C at revision 1.2 (pretty old).

Net observable effect: "only the first screen works on Thunderbolt" we go t=
o
* Windows 11 can do "2.5K@60 Hz + 4K @ 30 Hz", and
* Linux can do a slightly _flakey_"2.5K + 4K @ 60 Hz".

I like a stable 60 Hz screen refresh rate (enabled by native
Thunderbolt bandwidth)
