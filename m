Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA7D59F8D6
	for <lists+linux-usb@lfdr.de>; Wed, 24 Aug 2022 13:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236867AbiHXLus (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Aug 2022 07:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236272AbiHXLuq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Aug 2022 07:50:46 -0400
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00100.outbound.protection.outlook.com [40.107.0.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AA9780B74;
        Wed, 24 Aug 2022 04:50:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGErF6qzySpM6spLWB3HcshdAeipFldbzUy80eztl9j8zRA6JBMpG8nxrx/G2xYfRFlPoB6Dfr6wc9e1sUPFcRkdHi8m32tyUkFD3InD9+Iih8XvZLdkinQBYoQmvTBNxP5j1XO4SPL4b6UVEFE4L6QfhMssFyaqurZ+THZhhZbM3pSbgZdpRZj32cPM/8YZ9BBMyLVX6fXUWB+/ve42fnuRRh5WCPt4o0ykcuFB1PwC4FdrrFMzuE+OFasUPgDqkZBBIo0gblKT9wfedQSgbe3vij7otHTuKIroEeC3bf9rDree4dQndEcE8QzqF8wsH/a04iu/tZVwvMbiqWtaaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJa0W/R+udM+MZz0HURQEdKiD/n4HyfRuwP2Qq8WI/I=;
 b=lZ3pVEeYstE0AhOV0VIg6gjINHBCV26iKoPNgEKZh3zMLcGqAq5dsCDPu7TcO1cbEjIDhywWjj29lQot8CmgYtA/6X8F88tiWBgD4hVguDBSVPSkeO5ZQRkzQE9XdAoa8ILkqwaaWt8+dbOLjYPJY8xlor6cjWEzWjDBRVOcus8c7SQbQioVPJrZVYmBUjhzK1poE6nb1BoKl7Yh4dJyp0VU6Uyv9apUr0x7J53N6M6zixrU819Y/ESOAXXZgrbGO8ZKEfb3oXQYABA1Q6kaY1Eh/s0u5M5fTp51rRwabro01dQPMWMvoueznqSa6ykOQ8ei865yYKL3CzZRlPIS6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJa0W/R+udM+MZz0HURQEdKiD/n4HyfRuwP2Qq8WI/I=;
 b=N73RToRa7bwLFCotBDwOHm6bcPu9ajgpL5qfXmivCMwfRObUZ82xad43lPJxKqqGSX+xEDAq2up7kYbeu1+0z64X9UEbxqtVxfrrCXmX3tpptcDOFOa6Xyh0uQBUBNrSJwjhj1uBb0Jja0jNQLRrmcbQn5ZRJdCr8UQa6EmBvTE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AM7PR02MB6067.eurprd02.prod.outlook.com (2603:10a6:20b:1ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 24 Aug
 2022 11:50:41 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::1d88:3306:c280:3179]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::1d88:3306:c280:3179%6]) with mapi id 15.20.5566.015; Wed, 24 Aug 2022
 11:50:41 +0000
Message-ID: <dca6b5a4-9865-2d93-1cb6-ceed024b484f@axentia.se>
Date:   Wed, 24 Aug 2022 13:50:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 3/4] usb: typec: mux: add typec orientation switch
 support via mux controller
Content-Language: en-US
To:     Xu Yang <xu.yang_2@nxp.com>, heikki.krogerus@linux.intel.com,
        robh+dt@kernel.org, shawnguo@kernel.org
Cc:     gregkh@linuxfoundation.org, linux@roeck-us.net, jun.li@nxp.com,
        linux-usb@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220823195429.1243516-1-xu.yang_2@nxp.com>
 <20220823195429.1243516-4-xu.yang_2@nxp.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20220823195429.1243516-4-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0103.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::17) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1daef090-8c1f-47a8-b584-08da85c6deb1
X-MS-TrafficTypeDiagnostic: AM7PR02MB6067:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YlKseXzUzfJSyECMBWdjCer4Ak1GcB8scDy4q6Oxkm7PgGKI932k1+cU6OVeFsJHy+n+NfUhThhC20uKmjGeD8C96gfZ2fWi6rw6KwmyiELQY3rP0Tpv3YwnKAXLlrz65ojX8s/32B0kuSl78jojYLNH+k3V65+xB6nuLLRbQY3AEhBy5JFajMvIqqGf79nwT39kS1NWnhOGVVJ7cmIaNNJwyEAnt0qxRxXbBK6DhEZJcqoeu+5aimyzojIJMZ2rT6DtjBZFlbWBNH7dEHTiA0Pcer9DGlV1cBE9r47qBK3QMdikpeiEyvje/hywuYKX/lvpXfDvqH8ODuz1zQxE2P7g6UrM4/aqc/f2jwJmn8N5oX3ZYL9i+/AcT20lg2l5IrWTea+bFIXXlMC85qiwXrHXGHlRps61vhRYkAWJH+vLLxsu26xEKHuMIBrtKNoMKBOFHtsI3efauDdbE6zwX87kiIfkPfg5piLsTmzSHX0BnlNbGSJnReH7pyWaHE0gRyojKcmQmSl1JqaMNgupkdpTsrXcmMamOP1dNrRWYLD6Lwo7zpt+Q2NNt8I26tFYdIEIf/lHUSFaCb91whwUCCYLbpIfPHmYYUrs7AograJoxtHeBAwQXTchjIoIqAjj/xWOWslB3IMrwg/qu30gbI7G/7pGwlinF0efCWtf+kh9CVFLcxpP0UFNdSScAtaNYlS4zdn2Vu9K/29SIaCzrh6H7RZxaiwEiQuNnP0FWZx+W/LVDacI8At0hCemv69iMqMktzK5fuZPxZttvfS1yIPK9Su2qzoxTEOaZ8K1Dpk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(136003)(346002)(39840400004)(396003)(38100700002)(186003)(316002)(2616005)(31696002)(66556008)(66946007)(66476007)(2906002)(41300700001)(8676002)(4326008)(6506007)(86362001)(31686004)(83380400001)(6486002)(5660300002)(6512007)(7416002)(26005)(8936002)(478600001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXhLajR2ZlNMbmg0WVVVcWI2YmZveEl1ZGpjOUJvbU9BNXF4ZGhKMzlUVUp4?=
 =?utf-8?B?UTd1MVJwZGVCWVhWVFkvak16VVVWNzFDb0lQUFlRS1d6NnZnWjBjbkxPd3M2?=
 =?utf-8?B?WUNCV1NpRi9sRm1rc3lsTG9xY3RZQ2lqRjlxZmpqWlBmUkFLZTJDNnZlR2t1?=
 =?utf-8?B?RnhqNUF0eXc3dDJjSXVvSG1zMmMrVWtxYUJzSVNCeXRDN3d6dE1oV0F6enlr?=
 =?utf-8?B?b1llQU4rY1dkeDN1eW00dlpCWjhHYTh2bXlsN0pTSi9rOXZOZFZ4SWU2Y2lo?=
 =?utf-8?B?dG5hbEs4dEV2aURHQzRyMnU4R0tiSFRJSTl1SUpZOWJjTGVsREsxYkJEWXBR?=
 =?utf-8?B?R2tEZjVpRk40b0pIMlNoWWdWU0lnaTBkQmRSOXI1RU80L2V3Sk9oSEV4ZzE2?=
 =?utf-8?B?QkFKVk1DdHQrRndqRCthbm9KbmxIb3hCRUh5UFpnZ09tV24wUGg1alBRZE9X?=
 =?utf-8?B?UjZHREdkNHFZWEZiMmptMHdVM2IxUjdTS1liQktpRVdvdDVOanczcUltblpO?=
 =?utf-8?B?ODZ6TndIRS8rc0VSZ2ZWR1dGQVRrZ3BsaFR2cnJjeVo2enIwbmRGY3g1cjNX?=
 =?utf-8?B?MjArbmw3SmdzUkRnZ1VSbk0xb2dTZ1V3aXRDdXl1akRqL0orRXFOVEttZitu?=
 =?utf-8?B?ZXlVTzNzRHhuUFVqelFzQ2diWEJvRWxKb0c5VFJDbUhRdGJIeXk1a1JVZ2Rt?=
 =?utf-8?B?ZzJnUjZ5dHBIZkRlOGU0ckY5NmM4RnQ1cTZqQTBFV0Q4VVExVk5UY29xZEdK?=
 =?utf-8?B?ZDk4emUrejBMSi9kaTVINWFpcCtCdlNKUm91b1dRZXRKZlhMclAxQUxEWDdC?=
 =?utf-8?B?bEhqalNXVTE1alFHVkk3UzQySlF2NGd1ZTNRdCtYR05sTHJRM0FKb21PdWU1?=
 =?utf-8?B?Y2ZPQXJxZzBoUUo2RHhhMGk3TVR5b0ZOUFB2ekhuVXFjeEFVT0hrS2YxVGJT?=
 =?utf-8?B?dS9oTks2YTlCSVgwOXpYemNwdHNka3RmQnFyVkhEVHgyL1BOM3dON1FYQ0FM?=
 =?utf-8?B?dXM2dStRTWFDUk9ZU25FNmJEeEpiYW9QamJIeEE0UU5zUjlBTnBtMnhZT3pJ?=
 =?utf-8?B?aERqVkdQRi93aXMzQzh5Q0RTdjF1akNCVVkxU2N1Vkp6SXEvSUdqNW8rL1la?=
 =?utf-8?B?cjAwYi85alA3UmtjR1NhQzVUN2ZSd1ViSy9KOUhGV09JVzBSNzlxMytKWWph?=
 =?utf-8?B?Mm9kclMzTjlLS05qU3BsMDBLZ0NqNXJLd2FNenBLaC95eHRCNFNXOEJ5Z0M3?=
 =?utf-8?B?ZTgyaysxY2FqSmNqVzh3UjRSNlJoV1RWUi9uMWhRK2F2d0FUQ2RIOUtOTWZD?=
 =?utf-8?B?VktEYmFWZkRvMVIzeGpOZXBleGFYNmF6QnBSSUZwWDBOQ2lUUHFHZlQwWDhY?=
 =?utf-8?B?eGRESHB0SXAzTnY0ZldqMDU0SUg5dWZqdVBxRVNDT0l0aXdMU1k3eUE1aWdI?=
 =?utf-8?B?ZkZFQkRUK0VhUmUwdGp6TVZwaWx3ZzhyTU4wcnliOTBBUmpGVjdXOFBBYzBZ?=
 =?utf-8?B?SUhWREhSMEIxTEExL2RPalBoSWdEbzA2cGYrTFZ0alZFTHoxOUIvYWVONzB4?=
 =?utf-8?B?SEl1MjUyOU5nS0JidTgrY2xJMjlUVHJBd2hBaW9Cdk5QZ3JSeHMzVnIwemJs?=
 =?utf-8?B?dndMMlUzYVdTOURibHNneWU0VVpHSWV0aFp2dHlWLzM1cXFFUWtjSy93M1Fr?=
 =?utf-8?B?R010ODdxZVBSYXIyTXlHWTlrUDhlL1lBeXZxTUttOGVFT2crZFV1TEVib3dB?=
 =?utf-8?B?QlkxWU1GZ0lOVDlFcWRiYlFadVNMVXZ1bU9vaHJHL2VtcUJVVWpQV2RlYUR4?=
 =?utf-8?B?a0lXNm9wL09GTXVaM3dJVHlhaitxUFdKajRIRTlwSDJyYjRHeVFsMkpUdWhK?=
 =?utf-8?B?TU5RTXVpeS9HTDZWSTJTZGlqRHRsRk03L1hKZHFKR1JJZVl5K1BHYjA3M1B2?=
 =?utf-8?B?THdybmdOc1JtcitVT2hidHlaVlVydkgrSjE2VWtnR0gzaHdiT0RHWld1N1FM?=
 =?utf-8?B?K0EwY3RLNjZFWG9GcldFWmczc3J5Rk1sbXc4SlNFMnlQR205NGcxUTFleEZV?=
 =?utf-8?B?bjRGeGxNSy9RaWJpT1ZmUzRXU3FxVERNMkV0V2puMy81VHQ1cEJ3THRPWjN1?=
 =?utf-8?Q?bipADUOZI/KyyOzkPCMipnUD5?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 1daef090-8c1f-47a8-b584-08da85c6deb1
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 11:50:41.4741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: haUZlBiPprixBHEUU6ny+HCIi3DZ8mj1xKkHYIDQi/IrZKYd+/Prdt9YYqarU6RR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6067
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi!

2022-08-23 at 21:54, Xu Yang wrote:
> Some dedicated mux block can use existing mux controller as a mux
> provider, typec port as a consumer to select channel for orientation
> switch, this can be an alternate way to control typec orientation switch.
> Also, one mux controller could cover highspeed, superspeed and sideband
> use case one time in this implementation.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes since v1:
> - add build dependence (select MULTIPLEXER)
> - improve Multiplexer control logic
> 
>  drivers/usb/typec/Kconfig     |  1 +
>  drivers/usb/typec/mux.c       | 76 ++++++++++++++++++++++++++++++++++-
>  include/linux/usb/typec_mux.h |  7 +---
>  3 files changed, 78 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
> index 5defdfead653..73d4976d8148 100644
> --- a/drivers/usb/typec/Kconfig
> +++ b/drivers/usb/typec/Kconfig
> @@ -2,6 +2,7 @@
>  
>  menuconfig TYPEC
>  	tristate "USB Type-C Support"
> +	select MULTIPLEXER
>  	help
>  	  USB Type-C Specification defines a cable and connector for USB where
>  	  only one type of plug is supported on both ends, i.e. there will not
> diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
> index 464330776cd6..05e6ed217620 100644
> --- a/drivers/usb/typec/mux.c
> +++ b/drivers/usb/typec/mux.c
> @@ -13,6 +13,7 @@
>  #include <linux/mutex.h>
>  #include <linux/property.h>
>  #include <linux/slab.h>
> +#include <linux/mux/consumer.h>
>  
>  #include "class.h"
>  #include "mux.h"
> @@ -22,6 +23,11 @@
>  struct typec_switch {
>  	struct typec_switch_dev *sw_devs[TYPEC_MUX_MAX_DEVS];
>  	unsigned int num_sw_devs;
> +
> +	/* Could handle HighSpeed, SuperSpeed, Sideband switch one time */
> +	struct mux_control *mux_switch;
> +	/* 3 state correspond to NONE, NORMAL, REVERSE for all switches */
> +	int mux_states[3];
>  };
>  
>  static int switch_fwnode_match(struct device *dev, const void *fwnode)
> @@ -117,6 +123,58 @@ struct typec_switch *fwnode_typec_switch_get(struct fwnode_handle *fwnode)
>  }
>  EXPORT_SYMBOL_GPL(fwnode_typec_switch_get);
>  
> +static struct typec_switch *mux_control_typec_switch_get(struct device *dev)
> +{
> +	struct typec_switch *sw;
> +	struct mux_control *mux;
> +	int ret;
> +
> +	if (!device_property_present(dev, "mux-controls"))
> +		return NULL;
> +
> +	sw = kzalloc(sizeof(*sw), GFP_KERNEL);
> +	if (!sw)
> +		return ERR_PTR(-ENOMEM);
> +
> +	mux = mux_control_get(dev, NULL);
> +	if (!IS_ERR(mux)) {
> +		sw->mux_switch = mux;
> +		ret = device_property_read_u32_array(dev,
> +			"typec-switch-states", sw->mux_states, 3);
> +		if (ret) {
> +			kfree(sw);
> +			return ERR_PTR(ret);
> +		}
> +	} else {
> +		kfree(sw);
> +		return ERR_CAST(mux);
> +	}
> +
> +	return sw;
> +}
> +
> +/**
> + * typec_switch_get - Find USB Type-C orientation switch
> + * @dev: The device using switch
> + *
> + * Finds a switch used by @dev. Returns a reference to the switch on
> + * success, NULL if no matching connection was found, or
> + * ERR_PTR(-EPROBE_DEFER) when a connection was found but the switch
> + * has not been enumerated yet, or ERR_PTR with a negative errno.
> + */
> +struct typec_switch *typec_switch_get(struct device *dev)
> +{
> +	struct typec_switch *sw;
> +
> +	sw = fwnode_typec_switch_get(dev_fwnode(dev));
> +	if (!sw)
> +		/* Try get switch based on mux control */
> +		sw = mux_control_typec_switch_get(dev);
> +
> +	return sw;
> +}
> +EXPORT_SYMBOL_GPL(typec_switch_get);
> +
>  /**
>   * typec_switch_put - Release USB Type-C orientation switch
>   * @sw: USB Type-C orientation switch
> @@ -137,6 +195,10 @@ void typec_switch_put(struct typec_switch *sw)
>  		module_put(sw_dev->dev.parent->driver->owner);
>  		put_device(&sw_dev->dev);
>  	}
> +
> +	if (sw->mux_switch)
> +		mux_control_put(sw->mux_switch);
> +
>  	kfree(sw);
>  }
>  EXPORT_SYMBOL_GPL(typec_switch_put);
> @@ -204,6 +266,7 @@ int typec_switch_set(struct typec_switch *sw,
>  		     enum typec_orientation orientation)
>  {
>  	struct typec_switch_dev *sw_dev;
> +	struct mux_control *mux;
>  	unsigned int i;
>  	int ret;
>  
> @@ -218,7 +281,18 @@ int typec_switch_set(struct typec_switch *sw,
>  			return ret;
>  	}
>  
> -	return 0;
> +	mux = sw->mux_switch;
> +	if (!mux)
> +		return 0;
> +
> +	ret = mux_control_select(mux, sw->mux_states[orientation]);
> +	if (ret)
> +		return ret;
> +
> +	/* Keep it as it is since idle_state is MUX_IDLE_AS_IS */
> +	ret = mux_control_deselect(mux);

No, this is also broken. You cannot, in any client driver, rely on a
mux keeping its state unless you keep it selected. As soon as you
deselect it, it might be selected by some other driver. Sure, you
might know that there are no other users of the mux in question, and
you might also know that the idles state is "as-is". But the driver
does not see the bigger picture and has no way of knowing that. So,
it needs to keep the mux selected.

Cheers,
Peter

> +
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(typec_switch_set);
>  
> diff --git a/include/linux/usb/typec_mux.h b/include/linux/usb/typec_mux.h
> index 9292f0e07846..2287e5a5f591 100644
> --- a/include/linux/usb/typec_mux.h
> +++ b/include/linux/usb/typec_mux.h
> @@ -24,16 +24,13 @@ struct typec_switch_desc {
>  	void *drvdata;
>  };
>  
> +
> +struct typec_switch *typec_switch_get(struct device *dev);
>  struct typec_switch *fwnode_typec_switch_get(struct fwnode_handle *fwnode);
>  void typec_switch_put(struct typec_switch *sw);
>  int typec_switch_set(struct typec_switch *sw,
>  		     enum typec_orientation orientation);
>  
> -static inline struct typec_switch *typec_switch_get(struct device *dev)
> -{
> -	return fwnode_typec_switch_get(dev_fwnode(dev));
> -}
> -
>  struct typec_switch_dev *
>  typec_switch_register(struct device *parent,
>  		      const struct typec_switch_desc *desc);
