Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F29A70ED81
	for <lists+linux-usb@lfdr.de>; Wed, 24 May 2023 08:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239439AbjEXGDT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 May 2023 02:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232365AbjEXGDS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 May 2023 02:03:18 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7240132
        for <linux-usb@vger.kernel.org>; Tue, 23 May 2023 23:03:16 -0700 (PDT)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34NN1joj009311;
        Wed, 24 May 2023 08:03:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=LP+sVdifbW0WyJKgLeIpp8ORhYwTStNCA1crV093VnY=;
 b=hrtoPVqEA9w6t2vSrndyDzp78BEvM0ay6eEWFx27RbAafSoa9kTBE4Tk5+Qj0iM2Ib0l
 fBglnAGYQ8N7DY1broaZsxtD5P76xhI2cne2QbrU8qMhEws8ofnl3bxsVcpifYLoHQJP
 oznud54uOWB97xLwShrNU4yaWhp8Wp6VAQs1EHSe9b+23BBtThFhfRJGueIo4/MMR3uE
 q42fT2p//j7446pkijKBUzphX9a9yKRJMuxu5tgcfefr+pCMde+bfsi0yU1IsPyff9kW
 /ZQlkyFABRZL1c2auaHLdcYWjgZLVvBOSnzbV2Kzb2WzIYdc0wg/yQmUJSkJ18b099+7 3Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qru86dd91-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 24 May 2023 08:03:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D3D5410002A;
        Wed, 24 May 2023 08:03:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EF3BC2115ED;
        Wed, 24 May 2023 08:03:00 +0200 (CEST)
Received: from [10.201.20.56] (10.201.20.56) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 24 May
 2023 08:03:00 +0200
Message-ID: <e9ca1c02-04e8-a48d-1825-e6f38137d097@foss.st.com>
Date:   Wed, 24 May 2023 08:02:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 58/97] usb: ehci-st: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <kernel@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-59-u.kleine-koenig@pengutronix.de>
From:   Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230517230239.187727-59-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.201.20.56]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_02,2023-05-23_02,2023-05-22_02
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 5/18/23 01:02, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart from
> emitting a warning) and this typically results in resource leaks. To improve
> here there is a quest to make the remove callback return void. In the first
> step of this quest all drivers are converted to .remove_new() which already
> returns void. Eventually after all drivers are converted, .remove_new() is
> renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/usb/host/ehci-st.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-st.c b/drivers/usb/host/ehci-st.c
> index f731dc98c533..ee0976b815b4 100644
> --- a/drivers/usb/host/ehci-st.c
> +++ b/drivers/usb/host/ehci-st.c
> @@ -252,7 +252,7 @@ static int st_ehci_platform_probe(struct platform_device *dev)
>  	return err;
>  }
>  
> -static int st_ehci_platform_remove(struct platform_device *dev)
> +static void st_ehci_platform_remove(struct platform_device *dev)
>  {
>  	struct usb_hcd *hcd = platform_get_drvdata(dev);
>  	struct usb_ehci_pdata *pdata = dev_get_platdata(&dev->dev);
> @@ -271,8 +271,6 @@ static int st_ehci_platform_remove(struct platform_device *dev)
>  
>  	if (pdata == &ehci_platform_defaults)
>  		dev->dev.platform_data = NULL;
> -
> -	return 0;
>  }
>  
>  #ifdef CONFIG_PM_SLEEP
> @@ -328,7 +326,7 @@ MODULE_DEVICE_TABLE(of, st_ehci_ids);
>  
>  static struct platform_driver ehci_platform_driver = {
>  	.probe		= st_ehci_platform_probe,
> -	.remove		= st_ehci_platform_remove,
> +	.remove_new	= st_ehci_platform_remove,
>  	.shutdown	= usb_hcd_platform_shutdown,
>  	.driver		= {
>  		.name	= "st-ehci",

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
