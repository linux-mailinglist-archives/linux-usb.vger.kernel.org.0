Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C5CA49EC4A
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jan 2022 21:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343863AbiA0UKh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jan 2022 15:10:37 -0500
Received: from mail-vi1eur05on2072.outbound.protection.outlook.com ([40.107.21.72]:48929
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1343849AbiA0UKf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Jan 2022 15:10:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYkt2kTcgW7Igw3zYDj7yeh1h1tW35UA+pi8QkoGidh+5mgMj9QqAaP7dXi6CvXKhoMyXJz3bn6P+/lW8EIJZ6Qn7fCGUdRDogJnnlNpFRgm+s9BTiBhfsyNlS2VuW7vEmA7OlulJUUFWl3oW05+8r5B83XWyP6nG/d18xqss3GdlRiqFDoTEVWuzr9TBcRpp+lzl+Eht4BRJ3FFl1EmPdsPEZ8r8zB0+WorRQExqu6+lUwKUQPsNrDxvgnH+ZmfK4Pam8xyRkteNH0jvZr6AFfU/puAboQOVnCfrwuLaSDCs838wGQZZwsZXJssooWGy6hphWjwpQeYHW+EOZ9pGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+x0wJglgAiHT/JeedG5HPjaSK6Kcp5X0HFrY/92rwA=;
 b=aV5XYsFnT/WDJznz3x4nBANJSfvWemwvh2hLUCBLMfnzld7kvIy2A0jKD/RO+pLqSVBIuc/8GQUC3LOukwx1wDu6v/tADVWz5rpz5USc4eqblbqOJbLBTKKAQ0AVKDL7FzyMujFNLFBRNhtHQi/whQMRSS3Lv+kooUMjKmHgRrAvcbPe2zkXyWyEHcO3fAXnZQ35QF/UyXma5IiQiDGU/VdWBnZsaYtlwBojunU9AiLhZXCSAgiq20QW/TsGviabFaVPk6Wawv6cmnMljXC/DOaMteubyO4rhQ90ZF+VLfzSwGLyujY/20GECIsiIKH4qpVrn6yIszFdU8flJZevmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+x0wJglgAiHT/JeedG5HPjaSK6Kcp5X0HFrY/92rwA=;
 b=GFRc3uJ6yrLhqO9vlhwyL7rBPIcYx8UtX1UO7631278ygC2yJPgtccPULkJYdLdQAs8pKU/VZ2Sj7F+fQoREadW11ec6poV7irp+uKne3nYypBrvCXY/aoNfbDOyhOBENI9HsAsRKO/kgCWVonYx5SAnBIbMM7bwnd2GKNtzFOdrt48uXbrsuhvJk55ILIhmNEVQ2EPUbBqfuHmOmyiMKM07LkXPaMeThSwYf/CaBGzCCzDLLVVvdUic/q+MOgPHdTZv7M4IvyJh7MLEd3uboSk2u4kG9Ld3lwyd7+O1UTLB6KZQrgo1nICNaTxGLsARPtMYH7tNx9Sd7cUTc8DuvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by PA4PR03MB8158.eurprd03.prod.outlook.com (2603:10a6:102:2a1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Thu, 27 Jan
 2022 20:10:33 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::2d1f:654e:f946:1a95]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::2d1f:654e:f946:1a95%6]) with mapi id 15.20.4930.015; Thu, 27 Jan 2022
 20:10:33 +0000
Subject: Re: [PATCH v8 3/3] usb: dwc3: xilinx: Add ULPI PHY reset handling
To:     Robert Hancock <robert.hancock@calian.com>,
        linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        michal.simek@xilinx.com, manish.narani@xilinx.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        piyush.mehta@xilinx.com
References: <20220126234017.3619108-1-robert.hancock@calian.com>
 <20220126234017.3619108-4-robert.hancock@calian.com>
From:   Sean Anderson <sean.anderson@seco.com>
Message-ID: <a0505ff0-093b-eb67-98b0-b2c93a2771ab@seco.com>
Date:   Thu, 27 Jan 2022 15:10:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20220126234017.3619108-4-robert.hancock@calian.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0045.namprd03.prod.outlook.com
 (2603:10b6:208:32d::20) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8536ebe4-a4ad-4740-bd7f-08d9e1d112d5
X-MS-TrafficTypeDiagnostic: PA4PR03MB8158:EE_
X-Microsoft-Antispam-PRVS: <PA4PR03MB815837785B640BC893738D4B96219@PA4PR03MB8158.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5hu5tT64sm0rOXDOTjtcO2IhCuQ9eaAb3lKeACkcsIDiKL7XS206l4rGb1fOu/YRIGBphiEtQZkyNlu3N0cMu4MyhmDfvoGJM586CzhmVFcKQ69+uLRbAovkFVhMyrm1+SkJcn1jBKOBEI1kAc07YUq2HbkUZenpeUJRwLNhyWtowV6VqGg4uOPscCHjAEqUb9GuDJ9KdAEPnW956hYNMM0Wb16bvuYk9hFWRYPIBtKzlcC6XzUlqLH1duS0mrRth251LGTmDrGRgSnxpHGW8BglslqKF2Y0d1NCTzitf4Uye+WlsHDsO4AXPGH1dC+7iYcYEduSZBNS5kvmYJIwprHsPwWqmiFG9WrBzAm2eNs0LWuiHJaD58T3Ze+/uQ2PaADwJXX+CPxe7vg4+pXqUqNp1YQD+8C80Jr6HUJooTmCfwOc+GQb5a31l9mlRhwY1yaQymhsGchK1SkBmFwZLwyzNj8r+VpVUMQusZA/tFg+zPxQVYpwYPuHWEw1qe5GqWc1VSK08P5FXem5EmQsyDnlXXlP8SKpm+lCyLqEeDsvqZC/eMB7XF7V5oOOAFma57KFQne87ypstxH3GFlru+kxB54wmT3oFawzhgIzJfXYTdHMq4bymVwf6gBLu7jp9ijEB45vBJphqYRS8gVmaZyaiC3NkN5qh7lvP69YNZ/HfwuH5hf1z0sE+4H9Xt4Odkb/BZgN3P0xAXBsRnRLVC5QbknfjsRNfRXDVN+Gii+T2WuaRh+rfW4mH6OVrYaHce5VGXIKEX1QLV5UAjZSWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(36756003)(31686004)(6512007)(86362001)(2906002)(31696002)(52116002)(8676002)(8936002)(6666004)(6506007)(53546011)(66556008)(66946007)(66476007)(44832011)(508600001)(2616005)(316002)(6486002)(4326008)(38100700002)(38350700002)(26005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEtxak9NU2Q4eFpYd1ZUT2IxbnZQa3dCR1dUdUY3bXJlUFE3RllLY0RNMjc1?=
 =?utf-8?B?a1NZbUFBM0ZHT2ZHOHpKNFAzZENtUEtlUlAvdGJxVzVaOVAzMFRPQXNHSDVa?=
 =?utf-8?B?UFFDVythbklWa05hVXpKSDB3aUVMaFhjeGVDbmcxOE9TSEdHV2NTOFgwTEZ1?=
 =?utf-8?B?dllxT20yY3VKeWkxK2hyenJVd0QyZU04K3BRSWozdWNkUVYzR3NkanByMFpt?=
 =?utf-8?B?NktjL1JiUnpjK2xKRGpVOFNuZjJ4Z09KZUNZYjgzSEJvQUZHS0JsVmJBYy9m?=
 =?utf-8?B?aURPelVNWDJ1Z3RIc2d6K3lDQkNaN2RsNURKcEJmTStucFltNVFXdS9KaDl0?=
 =?utf-8?B?YmJ4VW44Y1NLcklwajNJMDJFQzc2ZEwwVUhqZmNURnlTbSs2YWtjMUVmU3NV?=
 =?utf-8?B?amF5b3hScWZBY0U1MkhJejlnNlhyZ0xHYnYxTmt0bEU0eHltZmRMSEJsQnBh?=
 =?utf-8?B?NktQYmQrUzNIKy9KVVZrZE9GWVZQWkVJNDdrSnA4VnR4ZEFCK1FaRTJidlFz?=
 =?utf-8?B?NTlPL1Z5MVdzOHV6aitEMnpYOE1iNU1VaFBpQ1dWUWpONGk3NzliM1o0VVRn?=
 =?utf-8?B?MWo3bnNhaVJSTmM2ZzRjd1g2elJvbEI5NTlCdDMzOW8rMUoweFo1ZkMyZVJj?=
 =?utf-8?B?dVZKeEpNNG9ZTktZUDJQMkJ0TmhFZVZjc2x4eWdDRXZ0YXlhRkxyaDk0SjZ1?=
 =?utf-8?B?bVE4N1BmemNnamcyZUh4blBHaFpnNkJ4Tk5sVkJDK3RyUUQ0OTZzQjNLb2lH?=
 =?utf-8?B?YUM4a1dhWUNTeGZ0THM2eEc0QnJIMkdzSmJLenhhQndpU2VRNXMyblZVRlVo?=
 =?utf-8?B?WVRZaHowZm9qTEM2NXk4QkY0WWtieEFSZllBczlZQ2xobzFwaSs5T0FSZlJ6?=
 =?utf-8?B?ZnNvV01rZ3BzYmhNWHJlaDF5U21qOXdKNE1hRVVEZTMzZHlxQ25idXdaUHBT?=
 =?utf-8?B?WXp4QnNoVEVBS3YwR0FRU3hEclUvcExNYkxTLytNdFZCZVhUdFdYVFVCaVRE?=
 =?utf-8?B?SmNZZkZXT2NyOVE0OTE5SnI0K2ZLdzB6SmNqcjJXVHVGYXg2dytRdTJGN3Bn?=
 =?utf-8?B?L3FXK0pURVp4NHd1ZVdMejBTMml1Uk1nV2s1NTYvSWJQeGVOc0t0V0k4bnJB?=
 =?utf-8?B?Nk94dFd0djljdzdLUFgvUDBIQjliWGRIdzJhbjB0RFNvK3RZWURNVEV0WG10?=
 =?utf-8?B?cDVlaWNOVDdrWmNtN05HWHlPRk5BTHZoYnIra1M2WjNQMmtjbUFUR2daTHRm?=
 =?utf-8?B?Zjh3UitsZ0dyQTI3czRndzJPbDYwZWlZVTA3eW5zV3RxaTJuS0xFU296M2VP?=
 =?utf-8?B?ak9Lei9sV3pOM3VVYmtnNW12WWd0cXpsa2VFYk9hQXF6MG00V3VMOGpBaUFu?=
 =?utf-8?B?SlFvN2NmVzJMeFJqRFhBNUs0bFZwaWZjQVdzR0lJa1BCLzMyUEt3Njh4VzNU?=
 =?utf-8?B?RGFrZkdyK1BadTMwZ0dVSkpjVkM3RTdsMmNJdVBZUlN5OHo4NGd6dVR2cUlG?=
 =?utf-8?B?TlpLV3YvMndJMXNnQkxCQzJHVzR2TUxtVE5GS3pNMGdLUzk4ZHR2MmE4dXFU?=
 =?utf-8?B?SkNybkVaWUJxT2kvMXRuc1NqRG9LTmdRTmJNaUF6UU9LcC9qUHpHSE1QUE5N?=
 =?utf-8?B?Z1NzQXU5ZmF3TXFOSlRKcFFOU2FBbVMzcHJ6TXRyUnJqOTBRTmM1aE5JWXQz?=
 =?utf-8?B?SEhyWGYrRzlabmdBSlZaZmVDdUFpV0xIY2wzYmxCNzN5ZTd4cmxsRjJiSkEw?=
 =?utf-8?B?RjZZUUYvYXFHV0h2d3FabUZZOU5TVEtJWUlXVVBsMEMyRjI1QjVvcjByK01z?=
 =?utf-8?B?ZGtvcTZWUFZHNkFZaTFSZG1OZlhQRnZuOU16MlNvdnhhd1BwTSt5b1FpenQr?=
 =?utf-8?B?OXZKZWcxMVdBM0VIYjRsSWwrdTFvd2QyUkkwUDkzN2ZqQ3VXVjU3MlNGZTVB?=
 =?utf-8?B?djN6MXUxbnprWTBIcnA4OXlCK1pGSGhxYm9BQ0N6cG5uR0F4NlYyWVc3SmNC?=
 =?utf-8?B?cm9uR2owYlRTK0I2bEd5MGlNaE42YkZCVEtyYWVDUVd5TmVOL054b2pvQitK?=
 =?utf-8?B?WjgzaE0zaHZYNW1tbnZ6VlArdStuS2F4NWRlMSsxT2t0Nk1BeGRmZ2RtWGMr?=
 =?utf-8?B?Y1R4WTlmK1Uvb2JGV0lqZ2VaUGpTMlU4RzFvdTBVNlo1MExHN1pQbW1UTE5W?=
 =?utf-8?Q?TJkqUo0o7CB8orNGrk2X6gk=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8536ebe4-a4ad-4740-bd7f-08d9e1d112d5
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 20:10:33.1141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TIeuNEAAjWA9zwo7ty3hX4SnzbpI6ZdMbxsUQOKlGx4CuwEC8MIYPB9pL4r5et12r5KkGoVs2jihyQQVDnzmng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB8158
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Rob,

On 1/26/22 6:40 PM, Robert Hancock wrote:
> Hook up an optional GPIO-based reset for the connected USB ULPI PHY
> device. This is typically already done by the first-stage boot loader,
> however it can be more robust to ensure this reset is done prior to
> loading the driver in Linux.
> 
> Based on a patch "usb: dwc3: xilinx: Add gpio-reset support" in the
> Xilinx kernel tree by Piyush Mehta <piyush.mehta@xilinx.com>.
> 
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> ---
>  drivers/usb/dwc3/dwc3-xilinx.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
> index a6f3a9b38789..1ee6011ada44 100644
> --- a/drivers/usb/dwc3/dwc3-xilinx.c
> +++ b/drivers/usb/dwc3/dwc3-xilinx.c
> @@ -11,6 +11,7 @@
>  #include <linux/slab.h>
>  #include <linux/clk.h>
>  #include <linux/of.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/platform_device.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/of_platform.h>
> @@ -101,6 +102,7 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
>  	struct phy		*usb3_phy;
>  	int			ret = 0;
>  	u32			reg;
> +	struct gpio_desc        *reset_gpio;
>  
>  	usb3_phy = devm_phy_optional_get(dev, "usb3-phy");
>  	if (IS_ERR(usb3_phy)) {
> @@ -110,6 +112,14 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
>  		goto err;
>  	}
>  
> +	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(reset_gpio)) {
> +		ret = PTR_ERR(reset_gpio);
> +		dev_err_probe(dev, ret,
> +			      "Failed to get reset gpio\n");
> +		goto err;
> +	}
> +
>  	/*
>  	 * The following core resets are not required unless a USB3 PHY
>  	 * is used, and the subsequent register settings are not required
> @@ -201,6 +211,15 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
>  	}
>  
>  skip_usb3_phy:
> +	/* ulpi reset via gpio-modepin or gpio-framework driver */
> +	if (reset_gpio) {
> +		/* Toggle ulpi to reset the phy. */
> +		gpiod_set_value(reset_gpio, 0);
> +		usleep_range(5000, 10000); /* delay */
> +		gpiod_set_value(reset_gpio, 1);
> +		usleep_range(5000, 10000); /* delay */
> +	}
> +
>  	/*
>  	 * This routes the USB DMA traffic to go through FPD path instead
>  	 * of reaching DDR directly. This traffic routing is needed to
> 

Do we need to have this in dwc3? Why not just use the usb-nop-xceiv driver (aka usb_phy_generic)?

--Sean
