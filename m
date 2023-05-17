Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D98D8707572
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 00:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbjEQWaj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 18:30:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjEQWai (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 18:30:38 -0400
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D80959EE
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 15:30:34 -0700 (PDT)
Date:   Wed, 17 May 2023 22:30:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pen.gy;
        s=protonmail2; t=1684362631; x=1684621831;
        bh=qk+Bpk79mjIP0qgSRVfyf0Z7+whgprOvwue3EctZ+AQ=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=qT2SwXMiQ5SSIiFpXFfQU5Y80cWsVHDXY5d4ByUHSUEaQWtGJwjslc2gxNrNTeUq3
         lvqtIxJVC3nRHy8gVPIWkGwk1J1Xa4L//PlOBsTSobZtTueMJ8DFVo4rbeN0ZjmDsv
         u/LaHlamw4cRQvRuPfCa9B2tKueh6OZAC+Isgo/lP+YdqipDbR4bzoLWok3Jdk7oDU
         MtD6YaxP58N/VcXS94qWhwSthbamb/3N8hk+GfGoXzgiFjIyIGpbHd5Bw0g6OtsYQg
         gTyKZ7ePKjavEmRe6EI68ltgklFycBCPojsV226SGtu5uVmHY1pIDw9m4fgqKpIuiW
         TwicHyAL3sGlw==
To:     Simon Horman <simon.horman@corigine.com>
From:   Forst <forst@pen.gy>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, Georgi Valkov <gvalkov@gmail.com>
Subject: Re: [PATCH] net: usb: ipheth: add CDC NCM support
Message-ID: <00275913-6b7c-9b91-4f5c-d8a425bd3e46@pen.gy>
In-Reply-To: <ZGSb4l8XcxclFsB1@corigine.com>
References: <20230516210127.35841-1-forst@pen.gy> <ZGSb4l8XcxclFsB1@corigine.com>
Feedback-ID: 31160380:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Simon,

Thank you for the speedy review.

> nit: The target tree for this patch is probably net-next.
>      As such it should be included in the Subject:

Ack, will label the next patch revision accordingly. The netdev workflow
doc has been very useful.

> nit: Looking at Git history, probably the patch prefix should be
>      'usbnet: ipheth: '

I looked at the commit log for drivers/net/usb, and saw "net: usb:"
prefix a lot more often than "usbnet:", that's why I chose the former.
As for ipheth, you're right, "usbnet:" is more frequent. Will change to
"usbnet:" in v2, unless there's a different opinion on this. Naming
things is difficult. :)

> I see that this patch applies  to current net-next, which is where> devel=
opment occurs. Has the patch been tested there?

I will make sure to test it on net-next before submitting v2, and make
an explicit note about that in the comments.

> I wonder if there are any issues with increasing the RX size
> from 1514 to 65536. Not that I have anything specific in mind.

The RX buffer increase was to accommodate for multiple Ethernet frames
encapsulated in a single URB. Per the USB NCM spec [1], an NTB-16 is
"shorter than 65,536 bytes", may include "up to forty 1514-byte
Ethernet frames". Frames themselves are still up to 1514 bytes each.

Somebody else may have to comment whether this has any other
implications from the kernel side of things.

> For networking code, please arrange local variables in reverse xmas tree
> order - longest line to shortest.

Ack

>> +=09ncmh =3D (struct usb_cdc_ncm_nth16 *)(urb->transfer_buffer);
> nit: There is no need to cast a void pointer.
>=20
>> +=09ncm0 =3D (struct usb_cdc_ncm_ndp16 *)(urb->transfer_buffer + le16_to=
_cpu(ncmh->wNdpIndex));
> Ditto.

Ack

> nit: Lines less than 80 columns wide a re a bit nicer IMHO

Ack

>> +=09if (retval =3D=3D 0)
> nit: if (!retval)

Ack

>> @@ -510,8 +628,8 @@ static int ipheth_probe(struct usb_interface *intf,
>>  =09ipheth_free_urbs(dev);
>>  err_alloc_urbs:
>>  err_get_macaddr:
>> -err_alloc_ctrl_buf:
>>  =09kfree(dev->ctrl_buf);
>> +err_alloc_ctrl_buf:
>>  err_endpoints:
>>  =09free_netdev(netdev);
>>  =09return retval;
>=20
> nit: this hunk seems unrelated to the rest of the patch

You're right, this should live in a separate patch. Would you suggest
making this a second patch in the same series, or submitting it
separately?


[1]: https://www.usb.org/document-library/network-control-model-devices-spe=
cification-v10-and-errata-and-adopters-agreement

