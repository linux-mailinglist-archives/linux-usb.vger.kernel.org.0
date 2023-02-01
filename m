Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A5E76865D0
	for <lists+linux-usb@lfdr.de>; Wed,  1 Feb 2023 13:20:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231854AbjBAMUE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Feb 2023 07:20:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231811AbjBAMUB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Feb 2023 07:20:01 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FA3F38EB7
        for <linux-usb@vger.kernel.org>; Wed,  1 Feb 2023 04:19:59 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id eq11so488213edb.6
        for <linux-usb@vger.kernel.org>; Wed, 01 Feb 2023 04:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gzdhhCYvzHiBhuGYmxPBCtZ5TtZFOM4jwBA4xo+x74s=;
        b=an4mkRsnuVd/w6+Rhiwnjnw46AVxTv6DY8FeyqUQof2IdZoUe3d84nDcRQoUZr262V
         IeKhQnw1ryGjSyOZdIxyBwAsnBa5dsJQBEY6BufakwEasnp8Ryk7tWpOUxShT9P1jBnd
         ZFqyIRHw1yIlANxRBJbsTs1E2+veE24VdxIZMQk+csE361r/4312V3QsFoWi35sc+zK6
         WT3YMIlxJl9MPKNe49V9/C6WQ20MuNfebBoxWmdrd8/WELhM/8l8KyajxA4THHPKpFr4
         Hbu8EWHOJIsFUsL65hNtxB5Rk+D37UAAvOHp/QNQpaEBaLLfsosYY357j6SlWNo0isrS
         rABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzdhhCYvzHiBhuGYmxPBCtZ5TtZFOM4jwBA4xo+x74s=;
        b=S5jpacbq7RZmjwjUHIl26UIoBHOeU8ZOT5RHhGiv1Rn5YKi1NaKz++Ks6dEjiD9m6A
         toW4uY8c+KtrYObPH1BHuh0ARooctx+ZfNzvfZZ/qMmj4W4uxSWopwUlK7laNLABEhdm
         GqAXEI9vfVt2HxyMMy9Oiqkg0egCdLBXt6sTLTXkux6D81rYbwX5KWQDJA+QwZuWEsjy
         kEy2LNBe54bhzda8AoyIxhKYEtIsvmluTKW97OVXGA2rMQS4hpckXHo5dqWrlkbRB4f6
         NexZfq3cJTNfBTyuu3X7rDuFCCepmKPgxkMtN/rbqwGhrNRnXHEJhLvdWTCjY+qBpjtz
         /7dA==
X-Gm-Message-State: AO0yUKX9aZI0mEnvPfUnbC+CJzR/1uzS1ZO6WdjPYiuBeTUT8iPSK5aZ
        HBU3UEJIa8LL62w5IWVhMQFjJS76SrVNptJ7RhY=
X-Google-Smtp-Source: AK7set8sEmkJMPX8jiT7EYwuYwfaFowGB/g0uC4lY0ah7wy/obx1qm0DtRP+YkdG+/dZF1PM0W8Y0A==
X-Received: by 2002:a05:6402:4012:b0:4a2:46f3:467e with SMTP id d18-20020a056402401200b004a246f3467emr1891029eda.30.1675253997706;
        Wed, 01 Feb 2023 04:19:57 -0800 (PST)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id z94-20020a509e67000000b0049df0f91b78sm9847217ede.78.2023.02.01.04.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 04:19:56 -0800 (PST)
Date:   Wed, 1 Feb 2023 13:19:55 +0100
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
Message-ID: <Y9pY61y1nwTuzMOa@nanopsycho>
References: <7266fe67c835f90e5c257129014a63e79e849ef9.camel@gmail.com>
 <f0b62f38c042d2dcb8b8e83c827d76db2ac5d7ad.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0b62f38c042d2dcb8b8e83c827d76db2ac5d7ad.camel@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Tue, Jan 31, 2023 at 03:20:33PM CET, mikoxyzzz@gmail.com wrote:
>syzbot reports that act_len in kalmia_send_init_packet() is
>uninitialized. Fix this by initializing it to 0.
>
>Fixes: d40261236e8e ("net/usb: Add Samsung Kalmia driver for Samsung GT-B3730")
>Reported-and-tested-by: syzbot+cd80c5ef5121bfe85b55@syzkaller.appspotmail.com
>Signed-off-by: Miko Larsson <mikoxyzzz@gmail.com>
>---
>v1 -> v2
>* Minor alteration of commit message.
>* Added 'reported-and-tested-by' which is attributed to syzbot.
>
> drivers/net/usb/kalmia.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/net/usb/kalmia.c b/drivers/net/usb/kalmia.c
>index 9f2b70ef39aa..b158fb7bf66a 100644
>--- a/drivers/net/usb/kalmia.c
>+++ b/drivers/net/usb/kalmia.c
>@@ -56,7 +56,7 @@ static int
> kalmia_send_init_packet(struct usbnet *dev, u8 *init_msg, u8 init_msg_len,
> 	u8 *buffer, u8 expected_len)
> {
>-	int act_len;
>+	int act_len = 0;
> 	int status;
> 
> 	netdev_dbg(dev->net, "Sending init packet");

Hmm, this is not the right fix.

If the second call of usb_bulk_msg() in this function returns != 0, the
act_len printed out contains the value from previous usb_bulk_msg() call,
which does not make sense.

Printing act_len on error path is pointless, so rather remove it from
the error message entirely for both usb_bulk_msg() calls.
