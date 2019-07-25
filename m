Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69C0074872
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2019 09:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388388AbfGYHuI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jul 2019 03:50:08 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.61.142]:33286 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387988AbfGYHuI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Jul 2019 03:50:08 -0400
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 94951C0AE6;
        Thu, 25 Jul 2019 07:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1564041007; bh=Q9XoYl4c4Fyjc8KGZ4LFQNYhsDGYZyt7qitsFimd5zA=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=B6LQxjFhCv8VFeVK4Mb+WJfnzRp6TE9lrymdMvwe1Wmg2G3dzKEbsZp89lajclE5z
         DH3sYlUbFxS1H3bBC9BoKqGByyrlPz7zQ8+S/ILTDBNpEmaGYGrrbx345ovl24RPT8
         6+ge/zq1lIhEIhSDTJudarjJJcPzkKljMMaoslR6EvrKWeywFdUHb9O7iWJJVG3GeW
         thWltFSU5lxpk7VQUjYN79t1Phy3N3D586R6PcLaVhSt2dMPOGQjY4tm4nhU5CKRo4
         x1DJxxEbz1jKEnQNsbRa4iTU+BLZZ3vm0VBTPliavsMoBfc1HFcbWmnb1Z5NwzFuAf
         Ot3Obztvg1lmg==
Received: from [10.116.70.206] (hminas-7480.internal.synopsys.com [10.116.70.206])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 6F00FA0057;
        Thu, 25 Jul 2019 07:50:05 +0000 (UTC)
Subject: Re: [PATCH v1] usb: dwc2: Switch to use device_property_count_u32()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20190723191639.67883-1-andriy.shevchenko@linux.intel.com>
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Message-ID: <7be5b50b-04d8-1878-317a-ad020348c92d@synopsys.com>
Date:   Thu, 25 Jul 2019 11:50:04 +0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723191639.67883-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/23/2019 11:17 PM, Andy Shevchenko wrote:
> Use use device_property_count_u32() directly, that makes code neater.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
Acked-by: Minas Harutyunyan <hminas@synopsys.com>

>   drivers/usb/dwc2/params.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
> index 55f841a54015..31e090ac9f1e 100644
> --- a/drivers/usb/dwc2/params.c
> +++ b/drivers/usb/dwc2/params.c
> @@ -404,10 +404,7 @@ static void dwc2_get_device_properties(struct dwc2_hsotg *hsotg)
>   		device_property_read_u32(hsotg->dev, "g-np-tx-fifo-size",
>   					 &p->g_np_tx_fifo_size);
>   
> -		num = device_property_read_u32_array(hsotg->dev,
> -						     "g-tx-fifo-size",
> -						     NULL, 0);
> -
> +		num = device_property_count_u32(hsotg->dev, "g-tx-fifo-size");
>   		if (num > 0) {
>   			num = min(num, 15);
>   			memset(p->g_tx_fifo_size, 0,
> 

