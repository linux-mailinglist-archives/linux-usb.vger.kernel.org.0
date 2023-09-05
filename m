Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E13B179251C
	for <lists+linux-usb@lfdr.de>; Tue,  5 Sep 2023 18:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232740AbjIEQB0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Sep 2023 12:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354224AbjIEKLv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Sep 2023 06:11:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E4CE199
        for <linux-usb@vger.kernel.org>; Tue,  5 Sep 2023 03:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693908661;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GQdWO1HDrc5GSIvIHSQgMIQsBgppoW3wramLkpYKpHg=;
        b=eN3jc+hBb+Nu0AkQ82G8cz58B8vofRpza5wPFCal1jY9TS6hVTInVl28EuJr5Y4hbFZHG7
        mmhPW+60xgSpAd+6xv1YWL3G8ysobl5ILlnG0qf4oFa/x9MTOAD+GahI5l+4Dow4CY12gw
        G/Sd+rVOdSFTjWxax2n/Bp/Po2vUuek=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-x7tIPQi4MYC-RjISV4lSDw-1; Tue, 05 Sep 2023 06:11:00 -0400
X-MC-Unique: x7tIPQi4MYC-RjISV4lSDw-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-52c0134dfcdso432685a12.1
        for <linux-usb@vger.kernel.org>; Tue, 05 Sep 2023 03:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693908659; x=1694513459;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GQdWO1HDrc5GSIvIHSQgMIQsBgppoW3wramLkpYKpHg=;
        b=R8YLsl9BNMekMgzA3eDGFWFnK+en7sQHfLD8VQISc2OY+zQIY/sGXM6tJwfKcqVt7G
         32LaDaX6zJ5nrYVH7V2IlSRfiQ4gr5hDGhE7qJfhb+mVsQbcAUq91/BAdgawywBjemDP
         fz+/k0a7isBrGG7xB6ccdAsl/VDfmH6xn5Syps3ILKkW+nPffQIevmcRqIzND+e9Ttq8
         2ezXAv/0MX2veNgitSdVr1dgg18NVbSWGdMqajG8im/wIcXFdua6gxC38v+61k+aWqeF
         YhCfWf/42GF2C5ykMJlNUwll0yFwuxs/aVyZ3X5wxC9JLLzi4gJRT8i+seoiO/vmpXD5
         B4tQ==
X-Gm-Message-State: AOJu0YxREjd47ZVU8P+pBZ/nrg6mtRaVSn8Zwv5TRBHDQL0CTRri+q6U
        K9Egf5PBMqztAm6mWfG3sqnOQGa/NL1JxHyFAz1farnsbGPRiVNuSCgzUYe88oNenQoJz9wGS39
        53Cl1nWAVOjQ30IGaXjZu
X-Received: by 2002:a05:6402:50cf:b0:523:f69:9a0d with SMTP id h15-20020a05640250cf00b005230f699a0dmr9451054edb.4.1693908659094;
        Tue, 05 Sep 2023 03:10:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6aGBnhekg22nlCvU2kF5kNulTXZk+b95Z2pPwYKc4FHamoUqVIRjdWI3V8NiUNW153C9yzQ==
X-Received: by 2002:a05:6402:50cf:b0:523:f69:9a0d with SMTP id h15-20020a05640250cf00b005230f699a0dmr9451032edb.4.1693908658710;
        Tue, 05 Sep 2023 03:10:58 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-254-194.dyn.eolo.it. [146.241.254.194])
        by smtp.gmail.com with ESMTPSA id k22-20020a056402049600b0050488d1d376sm6940864edv.0.2023.09.05.03.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 03:10:58 -0700 (PDT)
Message-ID: <32c71d3245127b4aa02b8abd75edcb8f5767e966.camel@redhat.com>
Subject: Re: [PATCH net] r8152: avoid the driver drops a lot of packets
From:   Paolo Abeni <pabeni@redhat.com>
To:     Hayes Wang <hayeswang@realtek.com>, kuba@kernel.org,
        davem@davemloft.net
Cc:     netdev@vger.kernel.org, nic_swsd@realtek.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Date:   Tue, 05 Sep 2023 12:10:57 +0200
In-Reply-To: <20230904121706.7132-420-nic_swsd@realtek.com>
References: <20230904121706.7132-420-nic_swsd@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

On Mon, 2023-09-04 at 20:17 +0800, Hayes Wang wrote:
> Stop submitting rx, if the driver queue more than 256 packets.
>=20
> If the hardware is more fast than the software, the driver would start
> queuing the packets. And, the driver starts dropping the packets, if it
> queues more than 1000 packets.
>=20
> Increase the weight of NAPI could improve the situation. However, the
> weight has been changed to 64, so we have to stop submitting rx when the
> driver queues too many packets. Then,the device may send the pause frame
> to slow down the receiving, when the FIFO of the device is full.
>=20
> Fixes: cf74eb5a5bc8 ("eth: r8152: try to use a normal budget")
> Signed-off-by: Hayes Wang <hayeswang@realtek.com>
> ---
>  drivers/net/usb/r8152.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index 332c853ca99b..b5ed55938b1c 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -2484,10 +2484,6 @@ static int rx_bottom(struct r8152 *tp, int budget)
>  			unsigned int pkt_len, rx_frag_head_sz;
>  			struct sk_buff *skb;
> =20
> -			/* limit the skb numbers for rx_queue */
> -			if (unlikely(skb_queue_len(&tp->rx_queue) >=3D 1000))
> -				break;
> -

Dropping this check looks dangerous to me. What if pause frames are
disabled on the other end or dropped? It looks like this would cause
unlimited memory consumption?!?

If this limit is not supposed to be reached under normal conditions,
perhaps is worthy changing it into a WARN_ON_ONCE()?

Thanks!

Paolo

