Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9638B58897A
	for <lists+linux-usb@lfdr.de>; Wed,  3 Aug 2022 11:30:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237463AbiHCJad (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Aug 2022 05:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237500AbiHCJaY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Aug 2022 05:30:24 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A85FE9FFA
        for <linux-usb@vger.kernel.org>; Wed,  3 Aug 2022 02:30:22 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id b96so10386813edf.0
        for <linux-usb@vger.kernel.org>; Wed, 03 Aug 2022 02:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KrnWA+m7eC5Vxxo7f+O2kCzvEbdewH6uC/C9Pi3LoXc=;
        b=cwD7M7z53QidxQGoctwZZalIRIW/QV2eCTPCbRsk4LTUepV6RXRsGI5xIlGcw7+mYh
         MANNckRS+YJlT7rWLV0YPCMgUyqs91AAz2Et2wpp/HcN70y08f9QCYoUcqCo1w1rP6gW
         kl+o4qp3Ojg+un0BX4Wb1NCf7i9YaC+1XJGDm1QJqbQVf5+j2zhizj5wNtU891pa2Enm
         OmlkVRVetPwNNlbE3NK7e69BVbmeZ6Ck0G0HH9DxdRG73l1FH+/LpS2oNllCqHIelu0w
         sgQ9Rr+R9nfCr+g+wmccJUxd72OlOPOTM14V9JeAnKmmPYEn1Rw7qMiOmqgoRC3JEyIG
         9DUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KrnWA+m7eC5Vxxo7f+O2kCzvEbdewH6uC/C9Pi3LoXc=;
        b=5I1wIs4+SsW0b32LW8/wtNWkTdYffPH6f7DXoEcRf6e6VEC0yMg8ZG6g6+u7+bN0cP
         GAZR7E4R/8EXnHNmA6NwIlZvK1pYw69K27BwWP4W+8ZbHprK61iUnlYyhoNwM1dN5Gaf
         u0mgjhvZTumZsQWpuMY6H+YLunuZh8VtN7O/F2jWL/MrLkbywR+GNxwAw6qiHyxEHXPw
         fZPZndv0pC26skEmHTa1Rr7LiyEAtk3d789iARcV02wLXN2vCe534ePqgm6XqMG3pigz
         we1LcDpJgoUw6NzLEiu6xVs2gVAn+EfuZB9ue+9qCtDvFf2D6dqbT8mHaqvifsfYOzRt
         7lKg==
X-Gm-Message-State: AJIora+z2YYFNL6ybRisBtJneEqzBZJFmH13PV/j43NFu5ABRWsrk9yN
        8U/dxCTdYVSQ0DpgCozd3TVNMlhoAyiQqkDEIGGgCV4G/Y48
X-Google-Smtp-Source: AGRyM1vouH4cGHk/eL3ZFGgkiGNjpwzaauG2zrOzUNoKyPe914spsCnXEB0quWUQcwz+vhJEC2T8BYjBAaZrtODLTec=
X-Received: by 2002:a05:6402:2405:b0:43a:86c6:862 with SMTP id
 t5-20020a056402240500b0043a86c60862mr25123172eda.210.1659519020865; Wed, 03
 Aug 2022 02:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220729094022.186496-1-lb@semihalf.com> <Yuep3lpI02gWiJY9@lahna>
 <CAK8ByeL4AJoXndO02Os0UPYZRiMeLmBjB-00VaEe-8KJF0tWzQ@mail.gmail.com>
 <YukhjOo4CteuM8q9@lahna> <CAK8ByeJ0=rbGr5+GZ_dDhMRnHjYxuCO9_cZONuXSz2tyL+QLzw@mail.gmail.com>
 <YuoyBf20gNLNqYdC@lahna>
In-Reply-To: <YuoyBf20gNLNqYdC@lahna>
From:   =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>
Date:   Wed, 3 Aug 2022 11:30:09 +0200
Message-ID: <CAK8ByeK=xOGshi9Yk2C3eVVNYprYFejX53OQzAztuxrKNK7F9A@mail.gmail.com>
Subject: Re: [PATCH v2] thunderbolt: fix PCI device class after powering up
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        linux-usb@vger.kernel.org, upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>
> Hi,
>
> On Tue, Aug 02, 2022 at 05:06:40PM +0200, =C5=81ukasz Bartosik wrote:
> > > Is this something available for purchase? I'm asking because I have A=
cer
> > > Tiger Lake based Chromebook (740 spin or something) here and the TBT
> > > controller class is "USB controller" all the time, and this is what i=
s
> > > expected. It should not change the class at any point.
> >
> > Sorry this platform is not available on the market.
>
> I don't think the mainline Linux needs to have this kind of a quirk for
> a device that is not available for general public.
>

The reference Chromebook platform is not available on the market now
however there will be Chromebooks based on that platform available for
purchase in the future.
We'd prefer not to carry a private patch for this issue.

Thanks,
Lukasz

> > I compared the platform where I see the issue with another platform
> > where thunderbolt is "usb controller" all the time
> > and I noticed one difference in function icl_nhi_force_power() in
> > drivers/thunderbolt/nhi_ops.c I observed the value of VS_CAP_22
> > after being read and before being written again with additional bits
> > set. And on the platform where thunderbolt is "usb controller" all the
> > time
> > this value was 0x22061002 after reading and 0x22061002 before being
> > written. The value has not changed
> > which suggest that thunderbolt was already powered up during probe.
>
> It is being set also if you boot with device connected but in any case
> the class code should not change ever. It may be that this is some older
> spin of the Tiger Lake silicon that still had the wrong class but it got
> fixed in later spins (or firmware, I don't remember which).
