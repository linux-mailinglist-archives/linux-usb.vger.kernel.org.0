Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 091EC4FE4DF
	for <lists+linux-usb@lfdr.de>; Tue, 12 Apr 2022 17:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357130AbiDLPjm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Apr 2022 11:39:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354966AbiDLPjl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Apr 2022 11:39:41 -0400
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 153F457B38
        for <linux-usb@vger.kernel.org>; Tue, 12 Apr 2022 08:37:23 -0700 (PDT)
Received: by mail-vk1-xa31.google.com with SMTP id bc42so9218943vkb.12
        for <linux-usb@vger.kernel.org>; Tue, 12 Apr 2022 08:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wEotUkSgv2wWdU4gicQSxgdHhAYJK3Hz6SwZFhk6ap0=;
        b=PdB322TzL+XRMbaobBMHXILthQxKFmd4cPSwjQMMpV0W2glUjRFW+VaGkUZZpm+N+H
         VGMl5oHe6KPqBODAYD3jf39wJXOBTIYD5hoAem8dx7f9VbE9vl6VEqt5+yiV509/vteO
         1axUH0vef5C5ZNBze6ONrbmd9mi1bS0Thj2P8OsgFQaaTZrjWcxFQcHe0z5CdlOtIDUU
         EwkNjjPy59e62RIXML9TC/ZtbC/zrGlkTmBzWctiS+A8cYozR2oJcok6/X+WUeU5jEKV
         Wmt6Gq7Q7708asAyKO73OEcf6KDuzZIOa78/Qk+efQebJfjdPVoJvCMgq6FptSG5eSc+
         bhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wEotUkSgv2wWdU4gicQSxgdHhAYJK3Hz6SwZFhk6ap0=;
        b=RJV8TkH98uOLiAT/4pphdItB3HgIeGPhz5gwHNtvYYPnZJC29zUTGerjWyiXk3+1gR
         u+3CKRu55BEm4gpRbc0r4Ks4wA3RDLId48dfTWfisjZlOTnit7YYFwnhemVKQMV4p8XM
         59r+itMeZmhaR9x7SEn3Rshd3lgX4C72Ph0yY4AVGvQenWDZy+a5Y42MBvFKRbgwQ0wi
         5xiLLzdFjRu5tL9wowWxG+wqG0vZ8nqNOBnJz4gA0K56WcOkHgQzGQkQEWgQM/72LVDT
         1p+q2oeOAkKJLZ7Jhos5GJQ9rlSUay9gJo2Vp4yyIpmeyQZYWe6P1VvMpLPg+a4Fjla/
         WjcA==
X-Gm-Message-State: AOAM532XIY5Os7HPDmsj0221ga6b0z311eNamYsBKlcMatVEslNXEgby
        plrFOO12S4wUTVsSt8KBg7+uEZ8mMZKm0lxHv8s=
X-Google-Smtp-Source: ABdhPJzOMeXvdS3R1+MpR5cpH5k/zdHRSJ65MN31ua7qE1xONBLCSeATi5aitDgB60yy/A00xwM5c8s0XIG/bfzhXIg=
X-Received: by 2002:ac5:c3d0:0:b0:344:44f4:25c3 with SMTP id
 t16-20020ac5c3d0000000b0034444f425c3mr12419124vkk.23.1649777841094; Tue, 12
 Apr 2022 08:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xK9sZGXruaLzbam+t2REqvKiTrWbZ-GdA3gXux=9B-2Lw@mail.gmail.com>
In-Reply-To: <CAHCN7xK9sZGXruaLzbam+t2REqvKiTrWbZ-GdA3gXux=9B-2Lw@mail.gmail.com>
From:   Jun Li <lijun.kernel@gmail.com>
Date:   Tue, 12 Apr 2022 23:37:10 +0800
Message-ID: <CAKgpwJXD-fju1=zHZY2vOxcKMY6gLOfCi+Cp543NoC9sa_3=oA@mail.gmail.com>
Subject: Re: Using PTN5110 w/ USB Hub
To:     Adam Ford <aford173@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        USB list <linux-usb@vger.kernel.org>, Li Jun <jun.li@nxp.com>,
        xu.yang_2@nxp.com
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

Adam Ford <aford173@gmail.com> =E4=BA=8E2022=E5=B9=B44=E6=9C=8812=E6=97=A5=
=E5=91=A8=E4=BA=8C 08:24=E5=86=99=E9=81=93=EF=BC=9A
>
> I have a board with a dual role USB conttroller connected to a dual
> role hub

Could you please explain more about what's "a dual role hub"?

> connected to a PTN5110 for enabing power to the USB-C.
>
> SoC -> Hub -> PTN-> USB-C

What signals of Hub chip connect to PTN5110 chip?

>
> The hope was the PTN5110 would enable/disable the src_en pin when I
> connect a device that needs power.  Unfortunately, most of the
> examples I can see for the device trees on a PTN5110 show some sort of
> connection to a USB controller, but  I am going through a hub, not a
> controller.
>
> Is it possible to configure the PTN5110 to either not require
> connection to a USB controller or plumb it to a USB hub?

My understanding PTN5110(TCPCI controller with PD PHY) is independent
with USB data path, for USB data path, I think it should be:
SoC -> Hub -> USB-C
PTN5110 should not care or know if there is a Hub between type-C connector
and USB controller.
If the type-C connector connects to a Hub, then it's a DFP only on data,
and from power point view, you also only power source role, right?

thanks
Li Jun
>
> thanks
>
> adam
