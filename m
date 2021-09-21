Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55E4F412EC9
	for <lists+linux-usb@lfdr.de>; Tue, 21 Sep 2021 08:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbhIUGr6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Sep 2021 02:47:58 -0400
Received: from mail-eopbgr30135.outbound.protection.outlook.com ([40.107.3.135]:15490
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229862AbhIUGrt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Sep 2021 02:47:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TB+NQjBmL7jpnfx5JB5BBpAHQOf2NRmSxVWatOQfpJFYRyM2VbEnw/f167rqk7UW7k52bRWk5PTGqlzWGwYx+sF4IQ0fP3MaZRTYSf/V8THGxPO6aB9M61off5SaipoMgnXOqoL0mzZdxcoqPqV5r1fOzq1AKCGkko/ETA7NzMS1Z+6dSLYJdtPXyDYtWkpei3F1k4H5xyMdY53YUPpEwi9080kL21uBBD2kp77ro5VHWdqbJ/qDIiLlvV7+aVNHZKc6G5EFo7ksOSKHbbEvhlae1Onnuo6Dhv7UEJN2+xa3JbsD42ARJHIeiIVYvXymiXSulvCQ0+QJUr5mxHLiIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=dS9TTueMF9Wr78CWt2Ut1VtN4olTU31BWORo+OsCAoY=;
 b=SS8UT2viCofXZSBObPrBfp1NqWXYdaF9K3VQ48sS9yZExHkkJo2hrEnRg1OqvUUzA1wCsuD2vAC51mHr80L/mUob9LxpuOyRgUqfzIZrSUBQypv7ZFEduHcgKYwea0FM0XQxp3MBLM1VqTcKb9HQyajPbchUQ7ytmH0BssB1EeWtVvGCfyfeSW7ynQgCzX//1Ctouzqs4g6d+i+Z/rChlHfmLr5O2OYY8S+hKK1LQap1ERhg1yfYkaR5ExelSbxqFPa2kyeqOKmhm0kfQgSpFUS8pozP89r0KSCYTDKwlXORxDkBfAui3aSL36EQKuWsZH9OfAe76exwM0SwH2Xn6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dS9TTueMF9Wr78CWt2Ut1VtN4olTU31BWORo+OsCAoY=;
 b=AITeMPdEePN8mufkIoo2GYX77uhd7YVMvC+aTIoxYnX7eD/h4d6p/V9AANGj8AxhJRJhU0SIOnZL0Mhe4bgsLUUI363UuOCGlRCXRMQmyyEXbKSc+iJ88wGpf8qibYQ7strKPiG91uUTHeO7FFBr3wQ263amWKxmhwZMUrlGNT8=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM0PR10MB3521.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:159::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Tue, 21 Sep
 2021 06:46:20 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e51f:c969:4825:8fc5]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e51f:c969:4825:8fc5%7]) with mapi id 15.20.4544.013; Tue, 21 Sep 2021
 06:46:20 +0000
Message-ID: <941092b0-1a8c-d17a-8787-a545d73fe7da@kontron.de>
Date:   Tue, 21 Sep 2021 08:46:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v2] usb: chipidea: ci_hdrc_imx: Also search for 'phys'
 phandle
Content-Language: en-US
To:     Fabio Estevam <festevam@gmail.com>, peter.chen@kernel.org
Cc:     shawnguo@kernel.org, marex@denx.de, linux-usb@vger.kernel.org,
        heiko.thiery@gmail.com
References: <20210920213224.646520-1-festevam@gmail.com>
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20210920213224.646520-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0060.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::37) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
Received: from [192.168.10.40] (89.244.183.176) by AM6P194CA0060.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 06:46:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84ee7b7b-8152-4a0f-019a-08d97ccb8504
X-MS-TrafficTypeDiagnostic: AM0PR10MB3521:
X-Microsoft-Antispam-PRVS: <AM0PR10MB3521062E4D030FDD0A1731C4E9A19@AM0PR10MB3521.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R8LjEVfk7OX8YMdKy0pBnokfkqW3EdLB0P7o6QBpeKmRcfxWfj6CATZBpR5/6zX6Gq5+gFibtWmhtk5ZCWmQEl8Mh5riitZE7pWe+qQfWTR4OuQdl4fh9m/FHqnX96LHPxO+eVwJkicOlp9s1EWmjh5hdMhNfZdsFJQOpotUOmxvRkjEk7EW70b0G2/NSx2R+mz5YtZ1xXNT0Vt+isCQDV0sLaxZsCIkYoes6wBUgGuCAIODd+PRM7j8xKHxkwiRdch9dyCvXyXaHq7/z6LR7Vgo0puNIvqacRgSVVurQjNuOYUs6UoopZkM4tkhn7b5b450lFalkHLrchDj2/d4voei7vQRs7bmptdgjnYiGLG17JIpyGN15ZdPVuF0lub+BJtNVYL2z4NKsYlhSdLozp4K4/Uq3IkR/IW3PAMRSHG7CP5OTbDiqK8bPw90a70HrBlIZllE2/edQSDQx4kOP7G6XXwu2/bEKW25pE0eX+ktPVlakbep1bza42DgtCupLN0m3X1cOfIqrHwCQF+ErJZN264rOGBSSm4FFQuVpii5Hq3vxZDA/KNDZirhemDjQXIwXeiAM1fslYr/gZDajXXdV3bbNpqi7udahdschgqoZZjncDUvtu6mKjJdBIeFFSFYaZR+zfKh1Xtxu39ksuvPQalZuXHuq+Gh4P6AvGmVJOfgl8Jg+Bwi48DpW2Zh0rFDo06u6grWlTTyc723azNLlwdy+QmNqkoW5x4GOZs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(53546011)(66476007)(2616005)(186003)(31686004)(5660300002)(86362001)(2906002)(8936002)(44832011)(66556008)(31696002)(38100700002)(6486002)(508600001)(956004)(83380400001)(26005)(4326008)(36756003)(16576012)(45080400002)(316002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2ZJUXA4U0Y4TGFROEFBYzNheWNoVmUyWE5zRlJCK1oxUEJsemRmVUJ4M2tC?=
 =?utf-8?B?WlUzWWhDRTRMM2NydllyVGdhdGlQQ0l2Q2wxVllmNnUrODBFWHhDRHVmRGtS?=
 =?utf-8?B?N3BYbUxWOU5acE03ZVFWenZ0R0xPUWQxSGlqSnU3cHVPNi9yKzlqM1ozTGE1?=
 =?utf-8?B?K3J1UjIvSTdmSFpYYVFPRzYvTU5MeTlvbExmKzlGdkc5dEs1SUdaTlhodE9I?=
 =?utf-8?B?ayt4NENZR2JFRHJvVXprMytMdEVXanRyeUVPQ3NxeVl6NFRGMUlQWXY3ODJY?=
 =?utf-8?B?Z0RIdi9IQkdIMkc0SzNDWk1nZDFWQkRIRmpWRUJZaEQ2czIxbDEwVTVHQ2tm?=
 =?utf-8?B?Vk5TRDRlYjk2YWErOGt3OWFMcTdiNEtENTUwWm5nUmlwUnhnbDZ2Tm5aWHVY?=
 =?utf-8?B?OWxrN0ZTamRxUWdvWXBNWXpSb3lFamxObzB5dnVaQXk2aDZObnRhQkVKTmt4?=
 =?utf-8?B?S1RGUmZNemtFNjgvcS9nbEJMQ1dMWHdnVE9GV2lRZXQ5a2FrczUxNmpNUjcy?=
 =?utf-8?B?c094dVQzMlFLYy9pSmd5Z1NoUmpjL0dJODhkdVF6Z3ZQSGJNU0dZZTBUeEtT?=
 =?utf-8?B?WUtDQjhNQllIbDE4MWFDK01zajBVcWpiSkI0SjlXWXZwbUNqWU82b0hvVDNK?=
 =?utf-8?B?S3IxWDRUY3NwRndsTXlCUWRraXVoeDZmZjdDZ3RoZnFpZSt4S1J3b1dSdnI2?=
 =?utf-8?B?NTJhOHM0cFJLenB0SmdDZzJPM1FNbEpSQ1E0RjZrSU5lV1lkWXZQVjhwT093?=
 =?utf-8?B?YzM1VDYzTWZFaFpDNzFkQmNZTC92VlNBKzduT0lmY3lnNjBMbDFuT0I3eFhy?=
 =?utf-8?B?L0xMMEMrTUU3QjFRZ0xmWjA2a1JJc3l2Ky9ZUkEzVExQSXJDZS85dmNNVDZq?=
 =?utf-8?B?MzlBelZISjNTYVhIMGhzRm1UenlBUmNEMFVxdm5mZ1V5M0hBOFRKT1F3VWFB?=
 =?utf-8?B?RGpGVjdzQ0NrUHlySktvRERSbVNzOXowc2xqMW1jK01SSk8xV3FzcWdzUjYw?=
 =?utf-8?B?YXppR0xFM25yWlJvNVZhSis5YzcvaXhJbC9lYUMxTzlxTGczMFViUGRyRkpx?=
 =?utf-8?B?M3BEL1VWQ3A2WEF4bUJESy93U1pGelMzWkwrZDdZVEY5RTIrZ1ZPT0RiRWF5?=
 =?utf-8?B?TElaK0phMGlDSlBLUjFFbFRndEprZGpkekFjRlVIWTkzOUlObTU4KytKQmxG?=
 =?utf-8?B?eXRENUNwQnN3blBEektIZjk4UVRxZXZBRGRHRWJKb0c5bzlCbTZMZmJHaXZm?=
 =?utf-8?B?QWNYVnlQS1Vsemd4ZnRTS0NWaElBbDZneEFPeG5sUVN0SnJkR1kxSlBhSGJ1?=
 =?utf-8?B?NWJvb2tDSlJCOU5IMVRnWit2WklrQzhpMkZ4K2I0S0V3YlJvbWE2QnBwK1hm?=
 =?utf-8?B?V0crdm9oeXNWVXNzbytRQVFTc2Zndi8zZjRvMTVuV2ZZQ25teUdISEs3QlY3?=
 =?utf-8?B?TmxIbWlUTlljVTdCZnYwdVByZ0pDOUtaNWlJcWx0bC9rQmpGTEJINVBLQXBJ?=
 =?utf-8?B?bzJJSU9vSGJaOUhzZjMrNWhmdStmQkM2b3hTVXZ5aFZGS2hSUzRoa0s2RzBr?=
 =?utf-8?B?MWNkOG44clBUME0yMEZySzc5Mzd5MVFJTVo3RitJUHF3b0JTTjVibzQzVGw3?=
 =?utf-8?B?eU5MYXg1STBGSXpGVXB0dFZqOGxOZUplYXB2WWRJeUFQUlJJUmFBV3VXQkpE?=
 =?utf-8?B?MFBDRnpyaFgrRnEwU3VrTUtIaFVRY1pBMzBrSFZUUUJ2RmZjb0lwUUYxelhK?=
 =?utf-8?Q?AKX6ARQ1iWXwYKtKMlJJYpOzqzRPcetsrBGvuSk?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ee7b7b-8152-4a0f-019a-08d97ccb8504
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 06:46:20.2462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ONiNbgW9GUEC7JRg0WxTdpqopcRbArkM8wgd6iqhvYv4Xd7mIkJkDQe16yPSWiKM6ikwxbT9CzdNgAfSV8tI2Yw64V8VY8D1Mpg96kvWyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3521
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20.09.21 23:32, Fabio Estevam wrote:
> When passing 'phys' in the devicetree to describe the USB PHY phandle, the
> following NULL pointer deference is observed on i.MX7 and i.MX8MM:
> 
> [    1.489344] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000098
> [    1.498170] Mem abort info:
> [    1.500966]   ESR = 0x96000044
> [    1.504030]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    1.509356]   SET = 0, FnV = 0
> [    1.512416]   EA = 0, S1PTW = 0
> [    1.515569]   FSC = 0x04: level 0 translation fault
> [    1.520458] Data abort info:
> [    1.523349]   ISV = 0, ISS = 0x00000044
> [    1.527196]   CM = 0, WnR = 1
> [    1.530176] [0000000000000098] user address but active_mm is swapper
> [    1.536544] Internal error: Oops: 96000044 [#1] PREEMPT SMP
> [    1.542125] Modules linked in:
> [    1.545190] CPU: 3 PID: 7 Comm: kworker/u8:0 Not tainted 5.14.0-dirty #3
> [    1.551901] Hardware name: Kontron i.MX8MM N801X S (DT)
> [    1.557133] Workqueue: events_unbound deferred_probe_work_func
> [    1.562984] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
> [    1.568998] pc : imx7d_charger_detection+0x3f0/0x510
> [    1.573973] lr : imx7d_charger_detection+0x22c/0x510
> 
> This happens because the charger functions check for the phy presence
> inside the imx_usbmisc_data structure, but the chipidea core populates
> the 'phys' inside 'struct ci_hdrc' instead.
> 
> Fix it by also searching for 'phys' in case 'fsl,usbphy' is not found.
> 
> Tested on a imx7s-warp board.
> 
> Fixes: 746f316b753a ("usb: chipidea: introduce imx7d USB charger detection")
> Reported-by: Heiko Thiery <heiko.thiery@gmail.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

> ---
> Changes since v1:
> - Changes the commit log and Fixes tag.
> 
> Hi,
> 
> We could probably change the signature of the charger functions to
> pass 'struct ci_hdrc *ci', but that would be a much more invasive
> change, which would probably not fit in the stable kernel criteria.
> 
>  drivers/usb/chipidea/ci_hdrc_imx.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 8b7bc10b6e8b..f1d100671ee6 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -420,11 +420,16 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  	data->phy = devm_usb_get_phy_by_phandle(dev, "fsl,usbphy", 0);
>  	if (IS_ERR(data->phy)) {
>  		ret = PTR_ERR(data->phy);
> -		/* Return -EINVAL if no usbphy is available */
> -		if (ret == -ENODEV)
> -			data->phy = NULL;
> -		else
> -			goto err_clk;
> +		if (ret == -ENODEV) {
> +			data->phy = devm_usb_get_phy_by_phandle(dev, "phys", 0);
> +			if (IS_ERR(data->phy)) {
> +				ret = PTR_ERR(data->phy);
> +				if (ret == -ENODEV)
> +					data->phy = NULL;
> +				else
> +					goto err_clk;
> +			}
> +		}
>  	}
>  
>  	pdata.usb_phy = data->phy;
> 
