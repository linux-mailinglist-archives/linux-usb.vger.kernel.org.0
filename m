Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D91956A3DA
	for <lists+linux-usb@lfdr.de>; Thu,  7 Jul 2022 15:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236012AbiGGNjM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Jul 2022 09:39:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236008AbiGGNjL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Jul 2022 09:39:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4B39517E06
        for <linux-usb@vger.kernel.org>; Thu,  7 Jul 2022 06:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657201149;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DQU1Mm0tfkiOVObsi+2CfhCELbvXlun5JOUv56uX35A=;
        b=HByZJY+J0wX+xFsqxJU5JNR1UCuyTwDaL9J4nxudwFxKMt0R087mel2vVMwTipYE3fdFfa
        YqRCdnbui3G86W0DYno9Idfc0jyOI5sje0fLvKuikXEP2Mnz4zLYQW7YoHRY+UHJcS3pXA
        B7blynyuqE9ue7kg/tVS2OAEfRHhiss=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-mLCsjqTxOKePm-jF6ddvzw-1; Thu, 07 Jul 2022 09:39:02 -0400
X-MC-Unique: mLCsjqTxOKePm-jF6ddvzw-1
Received: by mail-qt1-f198.google.com with SMTP id d4-20020ac86144000000b00319586f86fcso15441785qtm.16
        for <linux-usb@vger.kernel.org>; Thu, 07 Jul 2022 06:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=DQU1Mm0tfkiOVObsi+2CfhCELbvXlun5JOUv56uX35A=;
        b=6ODJQ5gVoF9WBdp6zq7DoHujiOwjIjQZMqA4ZDr5UofyK0aqwJ/QlU2k/qnv7tIOD7
         BceXIIke/fe/9P3O0SgMWuVZu/GbxEgd1+76XHwto4RXsGR/m07pxF4ALwR2hwuEWGfa
         1I98YS0gbCsvvJovRGKV/gfzDJgBUqu9SHaNgoWtgmXWUwk2U8fmqirvd6K30XLeChP8
         /VJ7NuGb8VGdG7gDrqGloNoTmk/5Gw26i7vGShfA4PlmSujQokS0cbFn1CICSdq2ZwjJ
         20mCHHlWF0v5xTz2EqissiPCmjxcepgmPgYFFXVEIAgbaQG/nbhOlIi++N20fKdhZ944
         9SSQ==
X-Gm-Message-State: AJIora9KNoLmfI+WSv9E3Bp5yEqrkTouqqW5S3hW9IaPZFZks0xY8KwW
        v5Gq9AD9mq23NAclQ2m7KtKzqdL4jofDvmyHs9EsfTWrME2U2KqAOGqkedkcGwDQnLxq1oSSMwG
        +x7OcnZ13bqCHyJJD/xwS
X-Received: by 2002:a05:622a:1186:b0:31a:2cda:b5ba with SMTP id m6-20020a05622a118600b0031a2cdab5bamr37324778qtk.203.1657201142036;
        Thu, 07 Jul 2022 06:39:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vyA9jRRyQ2EzjVUjKAaIsVggJqF0GM7HZ5o84MWKSP9+6ifnr+uDpmzTruyKB1FCeIY3ByYg==
X-Received: by 2002:a05:622a:1186:b0:31a:2cda:b5ba with SMTP id m6-20020a05622a118600b0031a2cdab5bamr37324757qtk.203.1657201141761;
        Thu, 07 Jul 2022 06:39:01 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-106-148.dyn.eolo.it. [146.241.106.148])
        by smtp.gmail.com with ESMTPSA id u9-20020a05622a17c900b0031d3d0b2a04sm12043982qtk.9.2022.07.07.06.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 06:39:01 -0700 (PDT)
Message-ID: <496c06361f98dcce32117b6ee938cfff716d4f82.camel@redhat.com>
Subject: Re: [PATCH] usbnet: modern method to get random MAC
From:   Paolo Abeni <pabeni@redhat.com>
To:     Oliver Neukum <oneukum@suse.com>, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org
Date:   Thu, 07 Jul 2022 15:38:58 +0200
In-Reply-To: <20220706091504.15306-1-oneukum@suse.com>
References: <20220706091504.15306-1-oneukum@suse.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2022-07-06 at 11:15 +0200, Oliver Neukum wrote:
> The old method had the bug of issuing the same
> random MAC over and over even to two devices at the
> same time. Instead of fixing that, this does as
> Jakub suggested and moves to the modern method.
> 
> This bug is as old as the driver.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/net/usb/usbnet.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
> index c70def1a87ca..715cc8b66776 100644
> --- a/drivers/net/usb/usbnet.c
> +++ b/drivers/net/usb/usbnet.c
> @@ -61,9 +61,6 @@
>  
>  /*-------------------------------------------------------------------------*/
>  
> -// randomly generated ethernet address
> -static u8	node_id [ETH_ALEN];
> -
>  /* use ethtool to change the level for any given device */
>  static int msg_level = -1;
>  module_param (msg_level, int, 0);
> @@ -1725,7 +1722,6 @@ usbnet_probe (struct usb_interface *udev, const struct usb_device_id *prod)
>  
>  	dev->net = net;
>  	strscpy(net->name, "usb%d", sizeof(net->name));
> -	eth_hw_addr_set(net, node_id);
>  
>  	/* rx and tx sides can use different message sizes;
>  	 * bind() should set rx_urb_size in that case.
> @@ -1793,9 +1789,13 @@ usbnet_probe (struct usb_interface *udev, const struct usb_device_id *prod)
>  		goto out4;
>  	}
>  
> -	/* let userspace know we have a random address */
> -	if (ether_addr_equal(net->dev_addr, node_id))
> -		net->addr_assign_type = NET_ADDR_RANDOM;
> +	/*
> +	 * if the device does not come with a MAC
> +	 * we ask the network core to generate us one
> +	 * and flag the device accordingly
> +	 */

Minir nit: even if usbnet uses a mixed style for comments, I think it's
better to stick to netdev format for new code.

	/* if the device does not come with a MAC
...
	 */

Thanks!

/P

> +	if (!is_valid_ether_addr(net->dev_addr))
> +		eth_hw_addr_random(net);
>  
>  	if ((dev->driver_info->flags & FLAG_WLAN) != 0)
>  		SET_NETDEV_DEVTYPE(net, &wlan_type);
> @@ -2205,7 +2205,6 @@ static int __init usbnet_init(void)
>  	BUILD_BUG_ON(
>  		sizeof_field(struct sk_buff, cb) < sizeof(struct skb_data));
>  
> -	eth_random_addr(node_id);
>  	return 0;
>  }
>  module_init(usbnet_init);

