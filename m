Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6429A47AB0C
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 15:10:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233468AbhLTOKD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 09:10:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34700 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230116AbhLTOKC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Dec 2021 09:10:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640009402;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4SU/S7ImGGhUFPPtRruTF21SLhkjh6LbUDIj/NTEz5c=;
        b=X1i3auwrDbLBazHPVHoQAqnbTeczKLRwneAsxRAaOmHevabtWWo34XEBZYiimq3lQZZ9vB
        n5ZukFdsk6qvZwWgZF2CWUzws+/zdlGGlynC29Q6Zdeb2vnwuBWZpaIsRH6Mxq9t3HzStv
        PM86eEo9/oUhwNNyCHs0A5Oil0bu3EE=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-uJBOiUffNyOMd1FY2MjOUA-1; Mon, 20 Dec 2021 09:09:58 -0500
X-MC-Unique: uJBOiUffNyOMd1FY2MjOUA-1
Received: by mail-pf1-f197.google.com with SMTP id a23-20020a62bd17000000b004a3f6892612so3837656pff.22
        for <linux-usb@vger.kernel.org>; Mon, 20 Dec 2021 06:09:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4SU/S7ImGGhUFPPtRruTF21SLhkjh6LbUDIj/NTEz5c=;
        b=H1CaJYCNjuQxRi4N4uR2x6gvjusow3a5jjGD35hnhQDbnXcoWMMAgF7sNYtzRmnTYM
         mLIXrQGKq3gfusQC77CZh0p+AJ2XZ38dJ2l6oR654iAZGpMbfdkjLnwwAA29ONsCfIDx
         nf9+qG25G4s3eGOos3Wd7DUdBGni/QA+UmQCzlLmybhDkXR/Gh4OcnmNAAF/+zAtyCln
         GrHQruQTu4pBBJjihSJ+PJtiYIsVaXY8Qv0txkK/uc7bIwNRbHbv9JpCjsMQqwbCltXK
         GD6/6TpHOYXikz7dTy5hhPn5jU8yEMJn7KSlTRwkZ7CMtrg48/WMoorqjgF812sDfi25
         QBZQ==
X-Gm-Message-State: AOAM5334cOs6UCejFD5Glg71rY6cdmLqGBowqdoZHVRqbI3T55bzhfQK
        gwBj8RW+v21GQw7XMhiKVc+gXRvlqeh3G4zPM5Z5Dr2tlEMaKDGXkeK2NvSkgX1Mm7vacaDb5v6
        pDB+MviHr/EwQAimMYs6+rIxX5gsfG2wI3enP
X-Received: by 2002:a63:440b:: with SMTP id r11mr2295437pga.363.1640009396961;
        Mon, 20 Dec 2021 06:09:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5rkAwf2w09eVva9jeeoZoh76LzeD6iApghZd6M8xndWZiAYVOJ/zZCbpNG3YM3a7+VGljuYeg6Ajax/60ZmQ=
X-Received: by 2002:a63:440b:: with SMTP id r11mr2295417pga.363.1640009396682;
 Mon, 20 Dec 2021 06:09:56 -0800 (PST)
MIME-Version: 1.0
References: <e4efbf13-bd8d-0370-629b-6c80c0044b15@leemhuis.info>
 <42903605-7e8b-4e84-fcd6-1b23169b8639@redhat.com> <fc7e6040-b760-02f1-57ef-71aa4b88aea6@leemhuis.info>
 <4366861.LvFx2qVVIh@dell>
In-Reply-To: <4366861.LvFx2qVVIh@dell>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 20 Dec 2021 15:09:45 +0100
Message-ID: <CAO-hwJJxRETn3k0a_bXLMaD7rWNjWM8F9O0sv=jHtZuvJXa4aw@mail.gmail.com>
Subject: Re: FWD: Holtek mouse stopped working after kernel upgrade from
 5.15.7 to 5.15.8
To:     "Tomasz C." <tlinux@cebula.eu.org>
Cc:     "stable@vger.kernel.org" <stable@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Dec 18, 2021 at 9:39 PM Tomasz C. <tlinux@cebula.eu.org> wrote:
>
> Hello,
>
> I haven't had time to test it yet. But I see that another ArchLinux user =
has
> compiled kernel 5.15.10 with this patch and confirms that the mouse works=
.
> Details on:
> https://bugs.archlinux.org/task/73048#comment204441
>
> Is this enough for you as a test?

Yep, thanks a lot.

I have now pushed this to hid.git for-5.16/upstream-fixes with the
updated link, cc-ed stable and also added that archlinux bug.

Cheers,
Benjamin

>
> --
> Tomasz Cebula
> Dnia pi=C4=85tek, 17 grudnia 2021 09:37:11 CET Thorsten Leemhuis pisze:
>
> > Tomasz, could you give it a try please?
>
>
>

