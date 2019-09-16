Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAEDAB3E0D
	for <lists+linux-usb@lfdr.de>; Mon, 16 Sep 2019 17:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729426AbfIPPrY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Sep 2019 11:47:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:39846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728527AbfIPPrX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 16 Sep 2019 11:47:23 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3C7442184D;
        Mon, 16 Sep 2019 15:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568648842;
        bh=MYm2zxY/xoEKbCW9H6wOf0Sfh5t3xNGKEsSQnRVcsH4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=cHVGaHv8YCgHi6cn3H1obmAuK37C+VZAuzPfpZqRh/R2HzsdTvXNvw6UQgOGQNcFc
         RdSu+9uWR0SWTdHM3gJ2XzEH/Zqqtct1rT3EfNH9QKQG66p++TLOIa7oMsxa2Q2ART
         VARaL6FPeFZYCokDO2JDHvCt/rrArX2AwOpDxw7w=
Subject: Re: [PATCH v3] usbip: vhci_hcd indicate failed message
To:     Mao Wenan <maowenan@huawei.com>, valentina.manea.m@gmail.com,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, shuah <shuah@kernel.org>
References: <2743ad5b-9348-bd2b-4763-a2a199e6edad@kernel.org>
 <20190916150921.152977-1-maowenan@huawei.com>
From:   shuah <shuah@kernel.org>
Message-ID: <fb06edbf-e599-ada5-916d-405382cb6f6f@kernel.org>
Date:   Mon, 16 Sep 2019 09:47:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916150921.152977-1-maowenan@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 9/16/19 9:09 AM, Mao Wenan wrote:
> If the return value of vhci_init_attr_group and
> sysfs_create_group is non-zero, which mean they failed
> to init attr_group and create sysfs group, so it would
> better add 'failed' message to indicate that.
> This patch also change pr_err to dev_err to trace which
> device is failed.
> 
> Fixes: 0775a9cbc694 ("usbip: vhci extension: modifications to vhci driver")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>   v2: change pr_err to dev_err.
>   v3: add error code in failed messages.
>   drivers/usb/usbip/vhci_hcd.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
> index 000ab7225717..144507751eae 100644
> --- a/drivers/usb/usbip/vhci_hcd.c
> +++ b/drivers/usb/usbip/vhci_hcd.c
> @@ -1185,12 +1185,12 @@ static int vhci_start(struct usb_hcd *hcd)
>   	if (id == 0 && usb_hcd_is_primary_hcd(hcd)) {
>   		err = vhci_init_attr_group();
>   		if (err) {
> -			pr_err("init attr group\n");
> +			dev_err(hcd_dev(hcd), "init attr group failed, err = %d\n", err);
>   			return err;
>   		}
>   		err = sysfs_create_group(&hcd_dev(hcd)->kobj, &vhci_attr_group);
>   		if (err) {
> -			pr_err("create sysfs files\n");
> +			dev_err(hcd_dev(hcd), "create sysfs files failed, err = %d\n", err);
>   			vhci_finish_attr_group();
>   			return err;
>   		}
> 

Looks good to me.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
