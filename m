Return-Path: <linux-usb+bounces-1313-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0B37BED8F
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 23:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDA861C20B52
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 21:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06BD42C1A;
	Mon,  9 Oct 2023 21:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1ZglGfb"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E85374E2;
	Mon,  9 Oct 2023 21:48:21 +0000 (UTC)
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5497C9D;
	Mon,  9 Oct 2023 14:48:20 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id 4fb4d7f45d1cf-536071e79deso10931129a12.1;
        Mon, 09 Oct 2023 14:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696888099; x=1697492899; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tCR5rXijoXzxvuw8QoAQRaj/pF5B8m/H14tPIFeeRBI=;
        b=k1ZglGfbtAcldLEaTP76L8vMCtgB662XBt6YXUsRwlT/r8RAVWp30WngvgJKVMAyG/
         93im1+MP0Itc4mB8QSShSFq71SR3h9j7rVuZPA55cStX5R5Qp+jsBvM9iigEUdZ7UoBc
         5xOoVONgLK7riSJ8LiYIRnF1AGs0sFEhLhKwTZK3qAzDeZQPbORkgw+q5IgdDEJt/qm9
         I9JCObCdkak2+3V703ZwMgcgNqR9hn3fl88YtHVeyZx+10piAZuUKYYdcGMiYe/EeCmx
         iLI6qLKVY7cE8dOlteUcrTI7Lu5jycoPQ1f2f1Iu0NBGlEYK7akQ9itWBoWe78bobgGI
         eGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696888099; x=1697492899;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tCR5rXijoXzxvuw8QoAQRaj/pF5B8m/H14tPIFeeRBI=;
        b=qkDXPeHdNqmX8cvb6gbl10nksCw/acmRdXrruUzXp4IXAFsZV1IXv6T9YIg4Nio6Fh
         NEiujU01B8cDQse2ZAmKRQhWwan6l81lqlRLrhuWBqD0hw3KmyC/hRrSatxzO+dDRMiY
         IvCIcf3zx9vEPSWVxwStp+wNNpEQqU5JSkNjx8E6xJduYIE2Wm0ZKmVUQZcOgTUliUJn
         FrdJVB0hhkY7nva5vXiwubeIcU3+uG0OkIslnUE2I7coyWeFfbcPeg9s2a8a+j+aL8Oj
         80NhJM8ss4nNVaaUz8g0uf+4Xl4GXoX9kyhAn01MqVxoELbFryU1pfN332pryj/U07Ok
         HElw==
X-Gm-Message-State: AOJu0Yw29TM6VvHiWZQPqOcybFzcKMwk2VNM7ox5OZVjDBvlA0H4Mfe+
	xe4nNniZfGtYcfJAVnqEnwgZJiBSJjX3L5Ae
X-Google-Smtp-Source: AGHT+IElpm6EEE84nokyOgm/3WpN9qAqFr2dPgiip7gVXUBUA3x9C3otDOHYdKYj42Pi6z11L4+bjA==
X-Received: by 2002:aa7:dcc7:0:b0:522:b876:9ef5 with SMTP id w7-20020aa7dcc7000000b00522b8769ef5mr12825159edu.8.1696888098359;
        Mon, 09 Oct 2023 14:48:18 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:d7c:652f:4e74:10b8? (2a02-8389-41cf-e200-0d7c-652f-4e74-10b8.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:d7c:652f:4e74:10b8])
        by smtp.gmail.com with ESMTPSA id f17-20020a056402161100b00537666d307csm6593345edv.32.2023.10.09.14.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 14:48:17 -0700 (PDT)
Message-ID: <e3ad2ed3-8859-4740-9126-9757f8d13a0e@gmail.com>
Date: Mon, 9 Oct 2023 23:48:16 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: usb: dm9601: fix uninitialized variable use in
 dm9601_mdio_read
Content-Language: en-US
To: Peter Korsgaard <peter@korsgaard.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 syzbot+1f53a30781af65d2c955@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231009-topic-dm9601_uninit_mdio_read-v1-1-d4d775e24e3b@gmail.com>
 <87zg0rcyjl.fsf@48ers.dk>
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <87zg0rcyjl.fsf@48ers.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi Peter,

On 09.10.23 22:48, Peter Korsgaard wrote:
> 
>  > syzbot has found an uninit-value bug triggered by the dm9601 driver [1].
>  > This error happens because the variable res is not updated if the call
>  > to dm_read_shared_word returns an error or if no data is read (see
>  > __usbnet_read_cmd()). In this particular case -EPROTO was returned and
>  > res stayed uninitialized.
> 
>  > This can be avoided by checking the return value of dm_read_shared_word
>  > and returning an error if the read operation failed or no data was read.
> 
>  > [1] https://syzkaller.appspot.com/bug?extid=1f53a30781af65d2c955
> 
>  > Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>  > Reported-and-tested-by: syzbot+1f53a30781af65d2c955@syzkaller.appspotmail.com
>  > ---
>  >  drivers/net/usb/dm9601.c | 9 ++++++++-
>  >  1 file changed, 8 insertions(+), 1 deletion(-)
> 
>  > diff --git a/drivers/net/usb/dm9601.c b/drivers/net/usb/dm9601.c
>  > index 48d7d278631e..e223daa93229 100644
>  > --- a/drivers/net/usb/dm9601.c
>  > +++ b/drivers/net/usb/dm9601.c
>  > @@ -222,13 +222,20 @@ static int dm9601_mdio_read(struct net_device *netdev, int phy_id, int loc) !
>  >  	struct usbnet *dev = netdev_priv(netdev);
>  
>  >  	__le16 res;
>  > +	int err;
>  
>  >  	if (phy_id) {
>  >  		netdev_dbg(dev->net, "Only internal phy supported\n");
>  >  		return 0;
>  >  	}
>  
>  > -	dm_read_shared_word(dev, 1, loc, &res);
>  > +	err = dm_read_shared_word(dev, 1, loc, &res);
>  > +	if (err <= 0) {
>  > +		if (err == 0)
>  > +			err = -ENODATA;
> 
> Looking at dm_read(), it doesn't look like we can end up here with err
> == 0, but OK.You are right, I just simulated the err = 0 value from
__usbnet_read_cmd() and in this case it is harmless because dm_read is
called with length != 0 (in dm_read_shared_word either 1 or 2) and
therefore it returns -EINVAL. A silly case where this would fail would
be if length == 0, which would be wrong anyways.

So I will remove the err == 0 case for v2.

Thanks a lot for your feedback.

> Acked-by: Peter Korsgaard <peter@korsgaard.com>
> 
Best regards,
Javier Carrasco

