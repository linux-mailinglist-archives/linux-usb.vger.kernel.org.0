Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA31772FBC
	for <lists+linux-usb@lfdr.de>; Mon,  7 Aug 2023 21:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbjHGTqM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Aug 2023 15:46:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbjHGTqC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Aug 2023 15:46:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E4EE2113
        for <linux-usb@vger.kernel.org>; Mon,  7 Aug 2023 12:45:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D757C61A2B
        for <linux-usb@vger.kernel.org>; Mon,  7 Aug 2023 19:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E82FC433C7;
        Mon,  7 Aug 2023 19:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691437477;
        bh=q2Dkyv5r/ANau9tTEZorEIn6brm/q2rakyEFq7VorYc=;
        h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
        b=b4WEZ9xQYEhNltgAquGPnLG58pkOLwQx5uq7BUNG62c2BOVS6lPMiu024+y+Hc3YV
         f7C+p8kvQsz0Ee0ifc5BHJaiKJQNLnpgGb59DoJEw8NaOdMwCRU4I3K7+fuyaOdYe5
         8Op0gzf5xc9c4rBBg8wJx9FuQifLzyTVmOkugsz0T7CP/OQuGub1fh0SVOXG4g1Xxm
         yCLr/Bp518KAvh5UrcEQNfum2ZdFo2Snk74h9tMSYZXrAy7pis+OLANIODsodyJ9N3
         Kl6e6IlPH86B4I0RieaaPDKhpYV680ieW9FyWheUxKVLMcR/CAk/5Ib8ZdvldOZ8HX
         j2oNTVN5MTbAw==
Message-ID: <147947f7-7f03-f0d1-1b4a-e4774025ca44@kernel.org>
Date:   Mon, 7 Aug 2023 13:44:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] USB: usbip: Remove an unnecessary goto
Content-Language: en-US
To:     Ruan Jinjie <ruanjinjie@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Hongren Zheng <i@zenithal.me>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20230805045631.1858638-1-ruanjinjie@huawei.com>
Cc:     shuah <shuah@kernel.org>
From:   shuah <shuah@kernel.org>
In-Reply-To: <20230805045631.1858638-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/4/23 22:56, Ruan Jinjie wrote:
> When udc_dev = NULL, it is not necessary to goto out to return, just
> return NULL directly. And the out goto label can be removed.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>   drivers/usb/usbip/vudc_dev.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/usbip/vudc_dev.c b/drivers/usb/usbip/vudc_dev.c
> index 2bc428f2e261..bed21b83de68 100644
> --- a/drivers/usb/usbip/vudc_dev.c
> +++ b/drivers/usb/usbip/vudc_dev.c
> @@ -493,7 +493,7 @@ struct vudc_device *alloc_vudc_device(int devid)
>   
>   	udc_dev = kzalloc(sizeof(*udc_dev), GFP_KERNEL);
>   	if (!udc_dev)
> -		goto out;
> +		return NULL;
>   
>   	INIT_LIST_HEAD(&udc_dev->dev_entry);
>   
> @@ -503,7 +503,6 @@ struct vudc_device *alloc_vudc_device(int devid)
>   		udc_dev = NULL;
>   	}
>   
> -out:
>   	return udc_dev;
>   }
>   

Looks good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

Greg, Please pick this up.

thanks,
-- Shuah
