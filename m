Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E89F59D113
	for <lists+linux-usb@lfdr.de>; Tue, 23 Aug 2022 08:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240538AbiHWGNW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 02:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240533AbiHWGNT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 02:13:19 -0400
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00097.outbound.protection.outlook.com [40.107.0.97])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E7915FF5D;
        Mon, 22 Aug 2022 23:13:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6vE31Da/z2e++rmvtflVZVuexBX8A7A2lpdjQHsbmGY/Pi1zlUHWZZKxg1jYcHnLkxA3xfcCUogQQNsa6Ew7Al+E2jAffPcTQK18/FiI9+4i/VQJ0L6Hwp+aGqaP8iZmfMm891fLV/4Zp971HaBcdJ/A6bozTr6mX16QFT+Mpqy0UGRRWWAA0N/9N3Qrj48tSfZV8ckJBtlp+h++HxO+kw7Zt7n3dNxfyRIYx+tEoWkPCFa/xIP3i6Mq1Cke54bSeW4BItZj81bwPVWaVC0qEo/yxoiDq/a8/6yIgItUpWxVbLnr41fgq5zzRJgSUv21TVt03IvZLpwDdDEUllcWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3haPff+4nr4met2r2GpLMDKU9J5sx2AR/4cg1n2KzrE=;
 b=QSZB6Wjq3LyZMy2sd9LpB6/obbl/ElokpU2YzlUqU8WymymvekhTUnCMpRwTx21E2qwgJAu0FzmnPsSfIaWzH279uBcALWFMGQISGHw/WA+qdC8PL2KNGnhEn9ZZc5xQuaZQ1EyxKV7uEyHSn21uVn02MuQm/4lNxvmv3vKfizpyaKtgLv/pxLAyyr3txzb2/U+taQ8HHijEE1DyVfypC8AuSjibYumdh2YTtEVq7hu2s5cwp2Qf4o+MEy1Y8cS2BfnWxSdMkHVzqU/jOterS/ylY2hBkhVh7A3rWkwfEy+FV2G+YCgc839p/BizXgm/GNvxdyRsC+yufstj9qTsjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3haPff+4nr4met2r2GpLMDKU9J5sx2AR/4cg1n2KzrE=;
 b=ZOW/jhgFjnQatZL8A0z0Lt9dyRF6qiHGjtRtTvbSKLWF1Z1c58vrN//aW/d4xjDaNHeyTYavZIEEZ/JB67lHCuNy/P8Xtlc/e3JkCFIW311TsQd/hITHEGNXx4tD5+vpQ0DnFqsmglJSIM08p8ndMJgrms6ziLLL85765zPGXm8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by VI1PR02MB5950.eurprd02.prod.outlook.com (2603:10a6:803:138::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.24; Tue, 23 Aug
 2022 06:13:08 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::1d88:3306:c280:3179]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::1d88:3306:c280:3179%6]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 06:13:08 +0000
Message-ID: <c2261f2b-fa47-f988-bf5a-aaa3169c8c7e@axentia.se>
Date:   Tue, 23 Aug 2022 08:13:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/4] usb: typec: mux: add typec orientation switch support
 via mux controller
Content-Language: en-US
To:     Xu Yang <xu.yang_2@nxp.com>, heikki.krogerus@linux.intel.com,
        robh+dt@kernel.org, shawnguo@kernel.org
Cc:     gregkh@linuxfoundation.org, linux@roeck-us.net, jun.li@nxp.com,
        linux-usb@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220822153517.3747679-1-xu.yang_2@nxp.com>
 <20220822153517.3747679-4-xu.yang_2@nxp.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20220822153517.3747679-4-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0093.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::16) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81ec4256-0108-418f-66f9-08da84ce8c9f
X-MS-TrafficTypeDiagnostic: VI1PR02MB5950:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UnTLsuimeg6lgNhnUw0VYhZKlpUJH1R042CgdbTZ76hCyptuCdmdkroAJt36inmHIpxFqpk9G9NvzSY7xcluBilRU9E/CmZ8MG7CLsHe5Zol1/9z1PWCIIVLZUFskAeS8l9FCRd3NII0qp0SiKc7wKHzeCRhJAQzqHhwrGijXOSchr+ESHijlPoFWzJn6QblA0ekAhSi0hpLLulsqujIKYhWPE6YHwumgeJYTg6l9nRgRDJHqp5eR4G2/+MfPRfVd5ARpw9gG+4AKxea98Yk8eCQmeTi1d72cUxYrladOSzjmaoATOwCn2Fq477lOSB2Oo/nM6hhSookcn1uGW9/DbaK97p8vgqoRP6Yiq4vhtSqqyOWW9XZPGTdIDj1gvQxAUlJDHo34yZ45QDGM++lSaUbXjS+Dq9tvTWl9fJl5+Q43rc2zUhrXWlmV0EMl/NWDeYEBDpao+3jxPX4mt73mxqmRGLDatZsNgNoLly3TRi0ffAh8TyoZs74E68l5e1V1i/MooB2UHcBfDvekxPbHEltBdffeoSbEigihsIFLoeelnY8q37h19NX7UuOUCT3b4oqJywqmiEUer2o7SsKbEs3NjShYIyQ5uSirZloncxuUAPwOaRQMh8wAaKbM4aO83d+LW0rPlrpaJwd4haX1osAXG2dvj1rdN7Qgdqa9P0VhgEe7OY7DUPpzLy8Tw43nPNiiGZL37JAIWdZfQRbWVAq72jmegO61XWRgBh59LRc2t+8nTk8YbDoJhafq42XuTQ9vEE6QOaYqtIfk4V0yWx5kZdSQ5sfjFEW2dQ+T04=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39830400003)(346002)(366004)(376002)(396003)(136003)(66476007)(66946007)(4326008)(8676002)(66556008)(38100700002)(31696002)(86362001)(5660300002)(8936002)(2906002)(7416002)(41300700001)(6506007)(6512007)(26005)(478600001)(6486002)(316002)(83380400001)(186003)(2616005)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjlEeXhINDk5NjBVQ1JwT21YWGJFZzQ3dUNVSDd5SXMzY09hWWdWc1QrcFky?=
 =?utf-8?B?UlRLZTNyY0k3MmZPdlZxY0l1RlZjdjJ4YVRPYXdCRmZ3K0ZwUWxhK29JWWE5?=
 =?utf-8?B?R3ZrZ0thL3Q0c3NocEYwZC9rWGc5dWNhdm1EelUrdHpGdURhS0hMV1Z2QWF4?=
 =?utf-8?B?RVM5WTBEL0ZERHdPcUF6Ykc4VDRDeWNOVExIU0VRZ0NlK3BtVXd6cXg3OHpI?=
 =?utf-8?B?L2k3VmliaGRuYTBXb1hLOTRPbEh1SGppbXZlSVpZTXA3RkxqNHhQYzZYNDRO?=
 =?utf-8?B?NUQrS2xKVk12K2dmU2x0aG52clFkL1dnZU1hZnlteldTb2NFTDk5RDZpcXR1?=
 =?utf-8?B?KzhsL3VXNE5mY1lYZlV5b3VJQmg2SDZJMEhVczFKYWN6dVVkRll0dHJoZHZM?=
 =?utf-8?B?VGhPODBlMmhiYlVVQkphaWppWUlEdTJveG5tYStlRzdpYTJVNGU0K1RYM09O?=
 =?utf-8?B?QjMzUHJvL1JCT1F5UVE1VFBwTGlYWXlRUENrUzhEVDBuMjZ0UlZlcUFyUnAy?=
 =?utf-8?B?MVR0THozcTM1Wk5ialVnc3lQcThPMHZCd0UzaDJjaWVKTnoybjZMT045SVg3?=
 =?utf-8?B?WEI0TjhMa3RvWnlxazlydHBJZ3JyNGJ3MVNlNXlCUGl3NzIrSDRiSXFGbXhS?=
 =?utf-8?B?Vm5HTUc1R2loZUxNYWpZQ2U3MHB4M3NSRjFzZDBVUHhPK0VXVDRHV2t0MDU2?=
 =?utf-8?B?VkFkdWtvY0QwTWFYVUIxdmZOazVhMm9XOVk5c29LSmd1YndlT3BMWTRZNXYy?=
 =?utf-8?B?K29TVnpDQnNwa2FwbW90OGdjVlIwMlVaM2lZdlRXekhJU1JDME51alU0cEU2?=
 =?utf-8?B?Uy80MTMra2dYN0UxcHFycjlReTdHbGcrUmJzT1I1c1JuUjBTWllGK0ZoU2k4?=
 =?utf-8?B?OEhUMEhnOXB5OStxQi9jK2oyV2J5b21tdko4T2M0Qk1sWms1MDVSb1AvREty?=
 =?utf-8?B?aVluRVpyNGFoNU4wS1E3THNmSy9Hc3N0NFlPdjZDVTV4a3pTdTEyem5KNSsv?=
 =?utf-8?B?WUU3OWZJZDBEOGZaSjBtNzVQbVMxQVREWFJicFVDZzJWYzFFWnZJS2Q2ajlu?=
 =?utf-8?B?bWhGQ2FadmladTAxbGJIOWdRcTVyZTFWTUxCS21XemllZW9QY25iS0JKWWNI?=
 =?utf-8?B?VmR2S2l0Zjlza015UVJUeWFjT01HWmc5cUpreEVsbXFLVTZERGFGZmczek1y?=
 =?utf-8?B?aUFBTFZiV2M4a1FUZ0M2UXlCbFJ6U1J6eWxWSTFhOVRxOWFaZ0U3Yi92OTg1?=
 =?utf-8?B?UUhIQmlWQ1NpalgvcUEvdDRZWWNyRlhkQ3VabkxsRlhveUY4KzhReFJzZ203?=
 =?utf-8?B?bU45QUlia1pBSGJnZFYzeWhtQWVmSW5YYmNxT1FLTTZmMDh4emVpM0RaeG84?=
 =?utf-8?B?d2RGdjUyVUtJSUd6NVVoODdIUHpZd2RNYU1iRTdQYzQ0SkhSakUvc3NsZXNa?=
 =?utf-8?B?NHBMYThvaGxEcCtZVzNjZFo5UjFQTzV6NXQrM1U3OGoxSnVjbC9YWDNSc0VE?=
 =?utf-8?B?RTdYd1VhUTBUS3JwWjRsVjRaZDhMOTRneWZ3dmwxRE1GYXE2Vk52TUZua0FO?=
 =?utf-8?B?bFRlTFNySUhHc2ZRMDEzbWVVRS92Q01SNHVsdFdKZktzakNTNEpDZ0NPbmx1?=
 =?utf-8?B?bTE1eTZDSUJTV0JGTnlHTW5IWUZNd05qaEhZNldtNy9pY1hsVmxYMFZiMmlh?=
 =?utf-8?B?MnVkU3NOUkZFWnJ2T3VHRFZQbTRlUDVLOG5JekpnYUh0ckdzczdDb012VVA2?=
 =?utf-8?B?cXViM3BOS2VFN2dMcmxxaEpNYjVjTjlzZ1dxWkpqcjJrSUkxbVZhVUEyWFJq?=
 =?utf-8?B?RW16WjJsUmw3SzhNL3pWcUJNb3M0U21NL0ZvbHVlSlBqdkVnemthTGdXay91?=
 =?utf-8?B?dXFCUHh6N1lDSWlIbmlwcnJ6RUdpcERldGdVRlJTcmUvTjJXU1JTRGllMzJ3?=
 =?utf-8?B?YXJnb1pqQVJNK1drVzM2RzQyREd0Y3ZzUzFBSm1mU2VEN2xCbzlYeG5XUndS?=
 =?utf-8?B?WUxsS3VLZGVNTnRkaVVxT3pqdlhXdnQ0V1QySWdrRU9Xekxpays2KzNyUmFj?=
 =?utf-8?B?enI2MkRHN2RCMU83Y2l3K1hqTUhyQUM3K2pYZUNoQUF5K0tWeCtSYW9DVHlS?=
 =?utf-8?Q?ygmktFpnf/kFXTKB8rlUJWtli?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ec4256-0108-418f-66f9-08da84ce8c9f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 06:13:08.5138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mmLFnaE4B+M9lUtWcP21ufUSntgBjS4N3Hlez+a+BRocRd94mV0b3Sj4OxQCBIhv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5950
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi!

2022-08-22 at 17:35, Xu Yang wrote:
> Some dedicated mux block can use existing mux controller as a mux
> provider, typec port as a consumer to select channel for orientation
> switch, this can be an alternate way to control typec orientation switch.
> Also, one mux controller could cover highspeed, superspeed and sideband
> use case one time in this implementation.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/typec/mux.c       | 74 +++++++++++++++++++++++++++++++++++
>  include/linux/usb/typec_mux.h |  7 +---
>  2 files changed, 76 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
> index 464330776cd6..5ee960fb668d 100644
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
> @@ -218,6 +281,17 @@ int typec_switch_set(struct typec_switch *sw,
>  			return ret;
>  	}
>  
> +	mux = sw->mux_switch;
> +	if (mux) {
> +		ret = mux_control_deselect(mux);

This is broken. Please read the documentation for mux_control_select and
mux_control_deselect. Every call to mux_control_deselect *must* be paired
with a *successful* call to mux_control_select. Here, mux_control_deselect
is called unconditionally (as long as a mux is configured).

Yes, agreed, that is indeed awkward (and fragile). But those are the rules.
(the mux interface was not designed for long-time selects like this)

Cheers,
Peter

> +		if (ret)
> +			return ret;
> +
> +		ret = mux_control_select(mux, sw->mux_states[orientation]);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(typec_switch_set);
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
