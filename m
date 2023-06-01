Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B726719514
	for <lists+linux-usb@lfdr.de>; Thu,  1 Jun 2023 10:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232006AbjFAIK2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Jun 2023 04:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231513AbjFAIK1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Jun 2023 04:10:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE1B3C0
        for <linux-usb@vger.kernel.org>; Thu,  1 Jun 2023 01:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685606981;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pDVmBRHQleLMTi+Z7D0Zv8qBsfmNlFbYk+Fn+QOciuw=;
        b=IiZnc8l8nOXzpB/9iNLa+RE2IM5odJf4CJSVf4o+ahz4w08Dys+QQJVpyucaHQXvCVa8pA
        TUDY6SkFzjxl4+PhFf8yD6DGzj6sd6io2O9E8ZRGPxaM7xdu9ioXK1w4LHvjEWNwCU0LJZ
        lf81hglpmizbWMRW3RKVzmAGPJqcTLE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-8N12GIZ5OMmscBJrBrDvYA-1; Thu, 01 Jun 2023 04:09:33 -0400
X-MC-Unique: 8N12GIZ5OMmscBJrBrDvYA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3f08900caadso918525e9.0
        for <linux-usb@vger.kernel.org>; Thu, 01 Jun 2023 01:09:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685606972; x=1688198972;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pDVmBRHQleLMTi+Z7D0Zv8qBsfmNlFbYk+Fn+QOciuw=;
        b=l5/6nPLOHnVlUkTBIS3lVOBJVlSKPZ3OPA4LgGfCRiidOLRj5aF3LZt8aGAOLx0Z+E
         mW4NvpUqRYA2A1KzaRL4L7N/2S8OEqJm/gKpuNhSb2r2jjgsFsMDgZXB7t2UnM+3vAfg
         I/z9zoZ75mD1cxJc/eSBtZxyHhKrhbRkcblg3rqA9jNcKV7nWkjs+ejzsXI6+aQwDGwO
         yy03eP1w1P9Y/P+kwzBZUZKTszK58/d1Hfz12nkfJ2kaZWgOPzIo+8KkdzHuaT4EjQJe
         cn+MqIEep0XwLab8qKkJzNV8uOEqNm9oBR4eQ3k4jrL4HrUPXWjZdBPlEYzzXOsIzTEH
         oovA==
X-Gm-Message-State: AC+VfDz3qNiAMn8B9KHmjj2XLii0KdG+jz6He051Re3puZEpYFMYv5gS
        jToxr31PCTgo1th2QEfGKwgL6y71b8HgWYa5N9Y7mbnTU2Vo83tiEf8CWXjpQ+uvdohn5XH+b2w
        B6GOTFWS74rVLu6UVFanM
X-Received: by 2002:adf:f34d:0:b0:2fa:b265:a010 with SMTP id e13-20020adff34d000000b002fab265a010mr5589752wrp.7.1685606972183;
        Thu, 01 Jun 2023 01:09:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7btuoTXIuS7dg9++Dm3sJtRubRCgOMM0uvp8Ej1HQa7dk1CnCAUxdL2fUJIdPo3clHT5D+vg==
X-Received: by 2002:adf:f34d:0:b0:2fa:b265:a010 with SMTP id e13-20020adff34d000000b002fab265a010mr5589733wrp.7.1685606971861;
        Thu, 01 Jun 2023 01:09:31 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-242-89.dyn.eolo.it. [146.241.242.89])
        by smtp.gmail.com with ESMTPSA id u6-20020adfeb46000000b0030ae53550f5sm9259931wrn.51.2023.06.01.01.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 01:09:31 -0700 (PDT)
Message-ID: <d7820e8eb82ca1cca93678c88da002e6bee0ca7f.camel@redhat.com>
Subject: Re: [PATCH net-next v3 2/2] usbnet: ipheth: add CDC NCM support
From:   Paolo Abeni <pabeni@redhat.com>
To:     Foster Snowhill <forst@pen.gy>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     Georgi Valkov <gvalkov@gmail.com>,
        Simon Horman <simon.horman@corigine.com>,
        Jan Kiszka <jan.kiszka@siemens.com>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
Date:   Thu, 01 Jun 2023 10:09:30 +0200
In-Reply-To: <581e4f2e-c6e3-026b-7a51-968afb616a7e@pen.gy>
References: <20230527130309.34090-1-forst@pen.gy>
         <20230527130309.34090-2-forst@pen.gy>
         <Hpg7Nwtv7aepWNQuwyGiCoXT2ScF0xBHsfvNBP7ytjXH6O-UIgpz_V7NoHsO00bS5bzlq_W5LUeEOhRO4eZd6w==@protonmail.internalid>
         <e7159f2e39e79e51da123d09cfbcc21411dad544.camel@redhat.com>
         <581e4f2e-c6e3-026b-7a51-968afb616a7e@pen.gy>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2023-05-31 at 17:10 +0200, Foster Snowhill wrote:
> >=20
> > > 	memcpy(dev->tx_buf, skb->data, skb->len);
> > > -	if (skb->len < IPHETH_BUF_SIZE)
> > > -		memset(dev->tx_buf + skb->len, 0, IPHETH_BUF_SIZE - skb->len);
> > >=20
> > >  	usb_fill_bulk_urb(dev->tx_urb, udev,
> > >  			  usb_sndbulkpipe(udev, dev->bulk_out),
> > > -			  dev->tx_buf, IPHETH_BUF_SIZE,
> > > +			  dev->tx_buf, skb->len,
> > >  			  ipheth_sndbulk_callback,
> > >  			  dev);
> > >  	dev->tx_urb->transfer_flags |=3D URB_NO_TRANSFER_DMA_MAP;
> >=20
> > This chunk looks unrelated from NCM support, and unconditionally
> > changes the established behaviour even with legacy mode, why?
> >=20
> > Does that works even with old(er) devices?
>=20
> I see Georgi Valkov said he tested v3 of the patch on older iOS devices
> and confirmed it working. I'll chat with him to get some USB traffic
> captures, to check what is macOS' behaviour with such devices (to make
> sure we behave the same way as the official driver). I also wanted to
> investigate a bit, when was NCM support even added to iOS.
>=20
> Personally I remember testing this in legacy mode a while ago, before
> I implemented NCM. I will re-test it again in legacy mode in addition
> to Georgi's efforts.
>=20
> From my side, I think it's reasonable to split this out into a separate
> patch, since it technically applies to the legacy mode as well, and
> doesn't (directly) relate to NCM support, as you pointed out.

I think that would be the best option, so we have a clear separation
between what is needed for NCM support and other improvements.

Thanks!

Paolo

