Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5DA690C81
	for <lists+linux-usb@lfdr.de>; Thu,  9 Feb 2023 16:12:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbjBIPMb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Feb 2023 10:12:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbjBIPMa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Feb 2023 10:12:30 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91409BB8E
        for <linux-usb@vger.kernel.org>; Thu,  9 Feb 2023 07:12:27 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id rp23so7260948ejb.7
        for <linux-usb@vger.kernel.org>; Thu, 09 Feb 2023 07:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NCv1Mu+p+yYwWQ/gt/1Wy0fKjttCDxpodcC19GCmro8=;
        b=fVZbPZytjkIP27sLlIh/v97JNL2Exdde7Gn89440vvYniQmM2+kE1Jt9btbIrRAJfI
         4wSb56RfPXVjV8o+G8dkxetBoDJhY3W/Kj0gUWYOJgprlFrEB9bm0qLzmzpw2T4CS1dh
         EWcoXErTEC9q/7iOGYajO4Tuj/DNr9YiS+QMWC45B0WxOSMAagIwXvbEi0c+nWZyLJ6R
         EbBke+A4ibiXwrtNOwCG9E+mQzOW7qSAmgQ12fhXrH70zPhKgNvfXgPC4RGWGzikbnZK
         5lQO9628Ukl0joCUJGPgDaVMmvV3xZrFHkX/KS5BaB0KxwQzEzRp6LtHTT4EcwKoScKO
         FaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NCv1Mu+p+yYwWQ/gt/1Wy0fKjttCDxpodcC19GCmro8=;
        b=FA381jgNM4epZf/TwTcPXUr+dOi1lyOUc7dExPPxu5dUNP6izSb2ufeu8iXvLTODPZ
         jJfqQuxgdUtHpBaa8OQSpvZxj9jkmqpsT7gKTfIjdta1UJJZWFGZiq9YYmlgZ6zxfOl+
         tNPuNDp+RofxJoO5367hTq9dJdFOF8mrGtvTt5RXgUb5wFv4SLHFTEWJ5X+ME9VwNk3A
         AmYpPN2bSpfII335C03AenO18NOy4LCPbYXmMBH6igTVv4ecCr/cl0k2qqU7bRyLAjas
         LhiWGsmrL71y3iOwV2EKSXB9iLCediUllJ5kQdAAHK7TaywVldfv6Zg11mCF3KA3zea+
         E9jQ==
X-Gm-Message-State: AO0yUKV6u811E+xjpIpbPBVUiNYzK/DH2yW+cOqOcOHq0HZcv4YFaooD
        UZrc2vyVWmhq/ZU1/nuLEE/o3Q==
X-Google-Smtp-Source: AK7set+W1ai2HA75DkhrOZnxD6WCcCmjuLOieQg1KjI11RTcEMPbWm1aALIiVdjQVubjVjzuk6hazQ==
X-Received: by 2002:a17:906:d28e:b0:878:7449:429f with SMTP id ay14-20020a170906d28e00b008787449429fmr11720161ejb.16.1675955546084;
        Thu, 09 Feb 2023 07:12:26 -0800 (PST)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id e20-20020a170906c01400b008ae3324c8adsm974949ejz.214.2023.02.09.07.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 07:12:25 -0800 (PST)
Date:   Thu, 9 Feb 2023 16:12:23 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     Miko Larsson <mikoxyzzz@gmail.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] net/usb: kalmia: Fix uninit-value in
 kalmia_send_init_packet
Message-ID: <Y+UNV9xp/U+56Tlx@nanopsycho>
References: <7266fe67c835f90e5c257129014a63e79e849ef9.camel@gmail.com>
 <f0b62f38c042d2dcb8b8e83c827d76db2ac5d7ad.camel@gmail.com>
 <Y9pY61y1nwTuzMOa@nanopsycho>
 <23e899f83c4f05a18deb2f86047d57d941205374.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23e899f83c4f05a18deb2f86047d57d941205374.camel@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thu, Feb 09, 2023 at 03:47:12PM CET, mikoxyzzz@gmail.com wrote:
>On Wed, 2023-02-01 at 13:19 +0100, Jiri Pirko wrote:
>> Tue, Jan 31, 2023 at 03:20:33PM CET, mikoxyzzz@gmail.com wrote:
>> > syzbot reports that act_len in kalmia_send_init_packet() is
>> > uninitialized. Fix this by initializing it to 0.
>> > 
>> > Fixes: d40261236e8e ("net/usb: Add Samsung Kalmia driver for
>> > Samsung GT-B3730")
>> > Reported-and-tested-by:
>> > syzbot+cd80c5ef5121bfe85b55@syzkaller.appspotmail.com
>> > Signed-off-by: Miko Larsson <mikoxyzzz@gmail.com>
>> > ---
>> > v1 -> v2
>> > * Minor alteration of commit message.
>> > * Added 'reported-and-tested-by' which is attributed to syzbot.
>> > 
>> > drivers/net/usb/kalmia.c | 2 +-
>> > 1 file changed, 1 insertion(+), 1 deletion(-)
>> > 
>> > diff --git a/drivers/net/usb/kalmia.c b/drivers/net/usb/kalmia.c
>> > index 9f2b70ef39aa..b158fb7bf66a 100644
>> > --- a/drivers/net/usb/kalmia.c
>> > +++ b/drivers/net/usb/kalmia.c
>> > @@ -56,7 +56,7 @@ static int
>> > kalmia_send_init_packet(struct usbnet *dev, u8 *init_msg, u8
>> > init_msg_len,
>> >         u8 *buffer, u8 expected_len)
>> > {
>> > -       int act_len;
>> > +       int act_len = 0;
>> >         int status;
>> > 
>> >         netdev_dbg(dev->net, "Sending init packet");
>> 
>> Hmm, this is not the right fix.
>> 
>> If the second call of usb_bulk_msg() in this function returns != 0,
>> the
>> act_len printed out contains the value from previous usb_bulk_msg()
>> call,
>> which does not make sense.
>> 
>> Printing act_len on error path is pointless, so rather remove it from
>> the error message entirely for both usb_bulk_msg() calls.
>
>Something like this, then?

Yes.

>
>diff --git a/drivers/net/usb/kalmia.c b/drivers/net/usb/kalmia.c
>index 9f2b70ef39aa..613fc6910f14 100644
>--- a/drivers/net/usb/kalmia.c
>+++ b/drivers/net/usb/kalmia.c
>@@ -65,8 +65,8 @@ kalmia_send_init_packet(struct usbnet *dev, u8 *init_msg, u8 init_msg_len,
> 		init_msg, init_msg_len, &act_len, KALMIA_USB_TIMEOUT);
> 	if (status != 0) {
> 		netdev_err(dev->net,
>-			"Error sending init packet. Status %i, length %i\n",
>-			status, act_len);
>+			"Error sending init packet. Status %i\n",
>+			status);
> 		return status;
> 	}
> 	else if (act_len != init_msg_len) {
>@@ -83,8 +83,8 @@ kalmia_send_init_packet(struct usbnet *dev, u8 *init_msg, u8 init_msg_len,
> 
> 	if (status != 0)
> 		netdev_err(dev->net,
>-			"Error receiving init result. Status %i, length %i\n",
>-			status, act_len);
>+			"Error receiving init result. Status %i\n",
>+			status);
> 	else if (act_len != expected_len)
> 		netdev_err(dev->net, "Unexpected init result length: %i\n",
> 			act_len);
>
>-- 
>~miko
