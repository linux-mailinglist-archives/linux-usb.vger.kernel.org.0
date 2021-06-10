Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3328C3A2A46
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jun 2021 13:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbhFJLgH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Jun 2021 07:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230130AbhFJLgG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Jun 2021 07:36:06 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70870C061574
        for <linux-usb@vger.kernel.org>; Thu, 10 Jun 2021 04:33:54 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id b9so40262110ybg.10
        for <linux-usb@vger.kernel.org>; Thu, 10 Jun 2021 04:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KX2wSl2vs51YrloYX15vxn1pxG1FqSR60QOwRgo78Gw=;
        b=Wh/uYq5LY83ZdIMgEyzEASq8MOMF8qvX0ojafimLHTg+oAH4ovLHjhpDp4YNmv2f+0
         UyvRshoxQgGfjLohwjWz+ci0s6UTnPGuxE9cL7CZgOrjn1Jbsdn3PJ2tcfsUHqRIx+Ts
         4w8BpexV1pDMel0AfCHb8/JMwA2PHJSkVs/GIFFmhwpKMtg5/vRMoy4AyuD43L2ss7if
         SpD/nKP6KL/QN3EOegKmF2HzESns7ypzHFZMJElXNHdMWujy+FRl9IeiIytHrhO2xe8l
         vYYXU99tJCthaKhFxKnCT2NOXszGQk7D4dG62zcU4YlgGuCgfMT/55PPo+25ood2+DVN
         nLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KX2wSl2vs51YrloYX15vxn1pxG1FqSR60QOwRgo78Gw=;
        b=Agq4a4pLP9bjeoKJhfwESmVDa8DUSe+tqSzJbtTzUvMUwh48FDG3zSqeAdBAyV0zFx
         UBndp6e+9n1bcxcrPU6PdQByoWE+TxcMseSzVcHF6GqLX4AU3qCJemEq5/mDmSPCd+yx
         Bb4UVMvOzfBdAckj+6U26547FrQ2inPwoSSNC7Vpv8EOxBoIUpWJW6sNFN7SSKTipJYw
         m22ciYQmJS/EyvtBqArKTM+XzGaQD6Rzlsn6l5SZTzkQNv4/liK/YGI+7QntpmGf4/tV
         pdzoMyNFgA1D16pfby0C0pq0qRgkDt2JqElGnlPSHYNKut2pDxFIYccIfndZav/rSS3I
         LbVA==
X-Gm-Message-State: AOAM530LT7SC/MPQjnEgZvJpC80wNyN03xRKDxVRj2wQr0ah7yNlAZAW
        qOMqcQq2dOP0/J+ao8974awV/Fw/zhVBfoSKcdgAUjasodM=
X-Google-Smtp-Source: ABdhPJxPSVikSUDCuEsDUo3ezMwyQrUha1PvNO2SGqPoYwHp4J1vepzd4S64l+Ep6xwuxB0Hcs4I0oKbT9+9UQ1BMw0=
X-Received: by 2002:a5b:ac9:: with SMTP id a9mr7035104ybr.475.1623324833749;
 Thu, 10 Jun 2021 04:33:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAJa5FiHh3oWGt3qMRWTBRorENhsKNODTRd+0meK2qpYnMk6U8g@mail.gmail.com>
 <87v96m119n.fsf@kernel.org>
In-Reply-To: <87v96m119n.fsf@kernel.org>
From:   kun peng <kunpeng0891@gmail.com>
Date:   Thu, 10 Jun 2021 19:33:43 +0800
Message-ID: <CAJa5FiGTsM3+QS-+9P=8EZbNxZm+MqpPM3P4KU+=nD4KeA-qew@mail.gmail.com>
Subject: Re: usb3.0: dwc3: isoc: missisoc while setting the USB transfer UVC data
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 10, 2021 at 6:07 PM Felipe Balbi <balbi@kernel.org> wrote:
>
> Hi,
>
> kun peng <kunpeng0891@gmail.com> writes:
> > Hi =EF=BC=8C I'm using the 4*A53 with DWC3 USB controller, my hardware =
to work
> > like a USB camera and so make use of the USB 3.0 UVC gadget driver=E3=
=80=82
> > usb3.0 isoc transfer with  missisoc -18=EF=BC=8Clarger maxburst is set,=
 the
> > more -18 appears=E3=80=82
> > but from trace info, the trb has been put in advance=E3=80=82
> >
> > test setting:
> > dwc3 driver version=EF=BC=9A5.12
> > PC=EF=BC=9A potplayer
> >
> > maxpacket : 3072
> > maxburst : 15
> > interval : 1
> > UVC_NUM_REQUESTS: 8
>
> sorry, you're running 4.14.74 kernel. That's far too old for this forum
> to help you. Try reproducing with the latest v5.13-rc kernel.
>
> --
> balbi

thanks for your reply.

my kernel is 4.14, but usb and uvc related driver has been update to
5.12.0 linux main line.
The problem mentioned above is after the update.

best regards

kun
