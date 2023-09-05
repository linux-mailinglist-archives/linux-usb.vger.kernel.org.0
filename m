Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 322E17925E0
	for <lists+linux-usb@lfdr.de>; Tue,  5 Sep 2023 18:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235936AbjIEQCl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Sep 2023 12:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354399AbjIELWA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Sep 2023 07:22:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F471AD
        for <linux-usb@vger.kernel.org>; Tue,  5 Sep 2023 04:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693912870;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CnmxN6wdOs0OTw/mMrxBK5I43rixoIsLKQZXA7I2EWc=;
        b=PPpsyO0NtBwpFjLtSDOT8vCLhiDGyUtJRahpdmAI6li0GjbN6bTggivk7/L06Mhj27IbDA
        RIh75ZzhcW2XeGYX3R004D7U1b9SEjsnN3lqr1GT4kA6QiJqWh/G6hR7gyJZ0eSbVqyD0k
        M1brf+eiWhrSeCzrWfyt0yUqgRB+Oyw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-E1LtRFqDP3Ciwd6gROgWAw-1; Tue, 05 Sep 2023 07:21:09 -0400
X-MC-Unique: E1LtRFqDP3Ciwd6gROgWAw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9a62b121c43so49671166b.0
        for <linux-usb@vger.kernel.org>; Tue, 05 Sep 2023 04:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693912868; x=1694517668;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CnmxN6wdOs0OTw/mMrxBK5I43rixoIsLKQZXA7I2EWc=;
        b=LQSfr5DBOqKvg9ndG0fB0ELX3K1e/j1YEHjNifunhGrQbijcF2Dtlqp4voZtGUGagR
         6J+/Rk9wu05SDwICTr9R4hjksq7QR/lcFb/bEVLwKFp0KT3kZ3sJ7QLi7jZYVgzt9lSy
         Os0ktLl3Dj2mFk94dkEskcbmLENWNoqg2CVJOEnANujD0t6cdDV9BaA8D7XKUh+gT/6n
         HTmRr6NunfTy2bFe8O3eVe+KmXQGN14lJ+p2ZV52t9/JqDCM1crAlPEyhU/9C8zdowzb
         BRCkvKDgnTaHwh0dqAHWOSWVB9ZCUJjCStLaEIDgZILlhuzbXJKEk+kmGhis7JwisMzj
         a8mA==
X-Gm-Message-State: AOJu0Yw/5AJJXkXvmkdWKD1QYJ7/Sqmc6LWN+f2Mj1nM7dsT23O1QTWI
        r7jhBGpMbaGF8L+RMWHmvh64YJK145BAInoDcnKnsXkl1nXGry8yi6em0RZhIyebmDuaSnZVLUJ
        tKGAFIXrGq+nqeYW4KsP7
X-Received: by 2002:a17:906:212:b0:9a1:d79a:4190 with SMTP id 18-20020a170906021200b009a1d79a4190mr9465382ejd.2.1693912868253;
        Tue, 05 Sep 2023 04:21:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/2JNpRm3ICUmbaI95oTYHDX/wRK2j5nb1uLhZMDTcx0zla0a42LuJEDAP+RUjDfkLj0lIyQ==
X-Received: by 2002:a17:906:212:b0:9a1:d79a:4190 with SMTP id 18-20020a170906021200b009a1d79a4190mr9465373ejd.2.1693912867909;
        Tue, 05 Sep 2023 04:21:07 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-254-194.dyn.eolo.it. [146.241.254.194])
        by smtp.gmail.com with ESMTPSA id a1-20020a170906684100b009920e9a3a73sm7453309ejs.115.2023.09.05.04.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 04:21:07 -0700 (PDT)
Message-ID: <223569649ad4ded66786fcc424156b2115b8ccd8.camel@redhat.com>
Subject: Re: [PATCH net] r8152: avoid the driver drops a lot of packets
From:   Paolo Abeni <pabeni@redhat.com>
To:     Hayes Wang <hayeswang@realtek.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "davem@davemloft.net" <davem@davemloft.net>
Cc:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        nic_swsd <nic_swsd@realtek.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Tue, 05 Sep 2023 13:21:06 +0200
In-Reply-To: <48d03f3134bf49c0b04b34464cd7487b@realtek.com>
References: <20230904121706.7132-420-nic_swsd@realtek.com>
         <32c71d3245127b4aa02b8abd75edcb8f5767e966.camel@redhat.com>
         <48d03f3134bf49c0b04b34464cd7487b@realtek.com>
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

On Tue, 2023-09-05 at 10:37 +0000, Hayes Wang wrote:
> Paolo Abeni <pabeni@redhat.com>
> > Sent: Tuesday, September 5, 2023 6:11 PM
> [...]
> > > -                     /* limit the skb numbers for rx_queue */
> > > -                     if (unlikely(skb_queue_len(&tp->rx_queue) >=3D
> > 1000))
> > > -                             break;
> > > -
> >=20
> > Dropping this check looks dangerous to me. What if pause frames are
> > disabled on the other end or dropped? It looks like this would cause
> > unlimited memory consumption?!?
>=20
> When the driver stops submitting rx, the driver wouldn't get any packet
> from the device after the previous urbs which have been submitted return.
> That is, skb_queue_len(&tp->rx_queue) wouldn't increase any more until
> the driver starts submitting rx again.
>=20
> Now, the driver stops submitting rx when the skb_queue_len more than 256,
> so the check becomes redundant. The skb_queue_len has been limited less
> than 1000.

I'm sorry, I have a very superficial knowledge of the USB layer, but it
looks like that when such condition is reached, in the worst condition
there could be up to urbs in flight. AFAICS each of them carries a 16K
buffer, can be up to 10 standard-mtu packets - or much more small ones.

Setting an upper limits to the rx_queue still looks like a reasonable
safeguard.

> Besides, if the flow control is disabled, the packets may be dropped by
> the hardware when the FIFO of the device is full, after the driver stops
> submitting rx.

If the incoming rate exceeds the H/W processing capacity, packets are
dropped: that is expected and unavoidable.

Possibly exposing the root cause for such drops to user space via
appropriate stats would be useful.

Cheers,

Paolo

