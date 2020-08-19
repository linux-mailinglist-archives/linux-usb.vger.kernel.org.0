Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF1EB24A68C
	for <lists+linux-usb@lfdr.de>; Wed, 19 Aug 2020 21:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgHSTHr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Aug 2020 15:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbgHSTHp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Aug 2020 15:07:45 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28B32C061757
        for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2020 12:07:45 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id o18so27583389eje.7
        for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2020 12:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kBCjwt0/XhlY3JnKJsd+i1VFlwEYv8w9YXDHJU4epO8=;
        b=VAHPykFrTWgH9UBfve4745FZLnFuD8LT8bSoUnvwgWl2b2IZ7qWUfiMwnC++noyFIz
         NwZ6OdF5EDYB+OxAIPdLTiEzpFhPG46F8Adr2gGTgvp/LAvOGm5EcmAVdg4cibUPASBe
         f73pR/Zy226Ln/s5EeVRRh1HBPpwV9gYgRxsjhDPCJi5EWCYQLCSGJbw4Avguh+Kfw2s
         llSQMKHSVd13ZV30fYO5udOw02GXdgHIv3wSSNs5SpcGRCqYAOhs4ANA78Tj4+Qh//OV
         MDyyhMe00uSEBr6ytIEyg1WHzFlt1MS0iXR46Bats3Kjg2OOd+qjGFv1kcP33lKH/PZy
         cNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kBCjwt0/XhlY3JnKJsd+i1VFlwEYv8w9YXDHJU4epO8=;
        b=RsaLCFo6PrcrzCzcigEmpTNQe/GWVwFxTXHO/GwKJLiSOV5+4Qn1LO8awMsDlCzt7b
         RiVUvhESpsHBRLYOtRqYPyEI+pUXAEB4RQKRD6+QaFTGo3jSV5CqCQsNfZCgTBHC4Cp8
         kMn6QUFFlRLEBHpjhSErpB+9eHyHC3X1adKMLVDz1gOjfW5N8E/PEx6oYOXcqGlghhPF
         18YWOyVTe+bns9jXg/JuJYveURQBpwqFdOWcYvMz+3QBfkPvrU2WLDITIES6EYg1MI1k
         X+GKnFmvxeF96McgfE7cTTJlh5JeVC7QGk4X1cR8SG1/xO/NELCNGQ3FXILv9C9rZoHZ
         GTXQ==
X-Gm-Message-State: AOAM533iTXI5DvadWwiUMad+PY554ZXleoIBNktnloomUJ0AdQqKYeB8
        rmasP+Ze+rXOm26yw/wdvvO1v3U78dvzBsAbSL8=
X-Google-Smtp-Source: ABdhPJzYyUe3JqJcbOggVCwZdqWQDLqYeia1JH0bWhfTYxxfRFD+VtZRF7/a109vFSJGQcuaKxpH6VB2hmibjh5S3t8=
X-Received: by 2002:a17:906:5f84:: with SMTP id a4mr5707060eju.345.1597864063743;
 Wed, 19 Aug 2020 12:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200818165848.4117493-1-lorenzo@google.com> <CAHo-Oox6qcD-+FoB0d+s45e1i4q_zw07a1NZGYNrah=goT1nQA@mail.gmail.com>
 <CAKD1Yr1daQPFvZ5abGk4pgA779FsM-L+eRg_yjxgDcOL5N1QZw@mail.gmail.com>
In-Reply-To: <CAKD1Yr1daQPFvZ5abGk4pgA779FsM-L+eRg_yjxgDcOL5N1QZw@mail.gmail.com>
From:   =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <zenczykowski@gmail.com>
Date:   Wed, 19 Aug 2020 12:07:32 -0700
Message-ID: <CAHo-OowrfkTjdudmN02G5TbZQCBYUCPZVwtHB+48FK_FVj=yAQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] usb: gadget: f_ncm: fix ncm_bitrate for SuperSpeed
 and above.
To:     Lorenzo Colitti <lorenzo@google.com>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 19, 2020 at 6:56 AM Lorenzo Colitti <lorenzo@google.com> wrote:
>
> On Wed, Aug 19, 2020 at 6:39 AM Maciej =C5=BBenczykowski
> <zenczykowski@gmail.com> wrote:
> > > -       if (gadget_is_superspeed(g) && g->speed =3D=3D USB_SPEED_SUPE=
R)
> > > -               return 13 * 1024 * 8 * 1000 * 8;
> > > +       if (gadget_is_superspeed(g) && g->speed >=3D USB_SPEED_SUPER)
> > > +               return 4000000000;
>
> Will respin to change this to 4000000000U to address the warning
> reported by the kernel test robot.
>
> > Do you know what this actually affects besides the display?
> > My cursory investigation shows it gets printed to kernel log and sent
> > over some sort of ncm notification to the other side...
>
> Yes, it's sent in the ConnectionSpeedChange notifications which are
> intended to inform the host about how fast the link is. For a direct
> connection over a USB cable this does not make much sense, but for,
> say, a Gigabit Ethernet dongle that uses NCM, you'd probably want to
> inform the host of whether the connection is 10, 100, or 1000M. This
> is not what the code does now, obviously.
>
> > Is it better to underestimate or overestimate?
> > (ie. would it be better to report 3.5 gbps for super and max out at
> > 4.2 gbps for super plus instead?)
>
> I don't think it matters much. I'm happy to put 3860000000 for
> SuperSpeed and 4200000000 for SuperSpeed Plus, or whatever else we
> think makes sense. The speed is theoretical anyway. I suppose
> reporting different speeds might be useful to debug whether the
> connection is using 5G or >=3D 10G.
>
> Felipe, any opinions?

Oh reporting diff speeds to make it more obvious what happened and
whether SS+ is in use... that does seem like a win.
