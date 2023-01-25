Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4167C67B2C2
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jan 2023 13:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235313AbjAYMvU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Jan 2023 07:51:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbjAYMvT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Jan 2023 07:51:19 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14170577D3
        for <linux-usb@vger.kernel.org>; Wed, 25 Jan 2023 04:51:19 -0800 (PST)
Received: from [192.168.0.192] (unknown [194.146.248.75])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 567526602E4D;
        Wed, 25 Jan 2023 12:51:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1674651077;
        bh=qlVifLrYyGYH6SPmRmLmHNiY05C4/Zlelt4l8cTLs7E=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=FIQlWd8kFcRPwfC08+YzlwsWOgppeZVWVcdPAAB/78IcQ6n1z4gpgRKsZjDYPB+jq
         1GqJP3V3e3/pgxfvX1ymVw+XagUadUMavgP5/pWsUiSUeHhkPNDY4Yv48/38+rjSPZ
         yamVvNPzlOySu1ZwDm8E3pLDKOfAsdbsYytVi+nj+LSDejnYkETaoRhpdAcsWJ35/J
         6ZgsdPCSNh1IEdXTc3gi9Zu6f3xUK2aiY7FeYK5Nxu1rSZK7CklXQcKydqkeSfDEO4
         YaVTQxN7GzqCznn4CUSM58im0/g7jQmmPvnoO0yKzyRnJraqmoGv9mORZpYc+g9wYu
         O/2Bb0pzF9ROw==
Message-ID: <87361f5e-f0af-6bb9-ada1-db0f2aabd400@collabora.com>
Date:   Wed, 25 Jan 2023 13:51:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [v2] usb: gadget: configfs: Restrict symlink creation is UDC
 already binded
To:     Udipto Goswami <quic_ugoswami@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frank Li <frank.li@nxp.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>, linux-usb@vger.kernel.org
References: <20230125072138.21925-1-quic_ugoswami@quicinc.com>
Content-Language: en-US
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20230125072138.21925-1-quic_ugoswami@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Udipto,

W dniu 25.01.2023 o 08:21, Udipto Goswami pisze:
> During enumeration or composition switch,a userspace process
> agnostic of the conventions of configs can try to create function
> symlinks even after the UDC is bound to current config which is
> not correct. Potentially it can create duplicates within the
> current config.
> 
> Prevent this by adding a check if udc_name already exists then bail
> out of cfg_link.
> 
> Fixes: 88af8bbe4ef7 ("usb: gadget: the start of the configfs interface")
> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> ---
> v2: Fixed spelling mistakes in commit text.
> 
>   drivers/usb/gadget/configfs.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> index 78e7353e397b..434e49d29c50 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -455,6 +455,11 @@ static int config_usb_cfg_link(
>   		}
>   	}
>   
> +	if (gi->composite.gadget_driver.udc_name) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +

If we want to introduce this kind of check, I'd say it should be done
as the very first thing in this function - in particular before
traversing two linked lists (&gi->available_func, &cfg->func_list).

And, you probably want to keep the word "PATCH" in the title, like this:

[PATCH v2] usb: gadget: configfs: .....

Regards,

Andrzej

>   	f = usb_get_function(fi);
>   	if (IS_ERR(f)) {
>   		ret = PTR_ERR(f);

