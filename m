Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5415759D12D
	for <lists+linux-usb@lfdr.de>; Tue, 23 Aug 2022 08:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240564AbiHWGXR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 02:23:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239682AbiHWGXP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 02:23:15 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80122.outbound.protection.outlook.com [40.107.8.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A8F060524;
        Mon, 22 Aug 2022 23:23:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1BjXoeKxSNgWFhBwdv80Q749SKe102YGJa0q8rxBFXdc5ludisO53coFZo2GTTBxye70avBDjU46k9PhnbVase0cdTEK7zD60lvIEN783hITi5YjlBTlfStIPWqqVMqUbmmxzvCs8KxNof56q01BgDsHVGw+o6UeriyAcQdbbJB+ngW0lPqpERrfrpMhlJ6tkubcS+ErY5bT3pp9kJ789vtrxr7AVRCxyrtYOlmSODi70gn2DDHvCp7Njqumqhot6KbQFu6/MV/GsodA9A8p8Lvw6iLkGnFGoC0EUDiBIEzdUJQOgxyUxF/0AHWA0eH1MTOYj+GrNmgUWniKe8/5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6zd/yvFOGoXoTSZ50OJbyrqKKkseZPthdnZyra+F60=;
 b=bjt79/ksSEcTSoCkEAiXfU1WveovjCjt9xRibC5qRn7pp02Gr16uBpDc0373KHcRJEyHTGY/MWLli1KK/wxSeQgrCywJFfrR2NUU7gwgJOGhvdIqksFn4aNIRZYgpkdPjLOEdmE+LYRe1GQ6oNx7JhfZ0+GrlIWIwiS6n93HqzQiKp8fGU4ciUeUF+WpJAGmns3l0ljnzNpPEyltIPIHOYKlRNCzPTPDKlUlGg0SQtYEu5bDPDfAKlYnf9Lj1j7bXMR2idpWCwgnSwf/AlpKc1VlwAVDzCQnxGQemql05e0W6DxYmIvw4hX/wulrZFnuVmoVdc/jmuy3oAMXtIQm7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6zd/yvFOGoXoTSZ50OJbyrqKKkseZPthdnZyra+F60=;
 b=kZS26Ws09Nj2iWNB0maw08p0iSi+25/a8vcNM+Hul4Acrg/dG3REoF73YMEXnSrSLpMevOIpDKJ5t15RUlqsPnDjH7TDXNrKY0pEx7LgfuYs+spChJE05Xtk7F/0Uaffn50PvVUKjwuU4o/hkt1+cdcNbHpoVj/PK24nGubqg64=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by DB6PR0202MB2552.eurprd02.prod.outlook.com (2603:10a6:4:1a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Tue, 23 Aug
 2022 06:23:09 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::1d88:3306:c280:3179]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::1d88:3306:c280:3179%6]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 06:23:08 +0000
Message-ID: <6a3838dc-e979-2ef6-b332-92d5007fd41c@axentia.se>
Date:   Tue, 23 Aug 2022 08:23:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/4] mux: allow get mux_control from fwnode if of_node is
 NULL
Content-Language: en-US
To:     Xu Yang <xu.yang_2@nxp.com>, heikki.krogerus@linux.intel.com,
        robh+dt@kernel.org, shawnguo@kernel.org
Cc:     gregkh@linuxfoundation.org, linux@roeck-us.net, jun.li@nxp.com,
        linux-usb@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220822153517.3747679-1-xu.yang_2@nxp.com>
 <20220822153517.3747679-3-xu.yang_2@nxp.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20220822153517.3747679-3-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE0P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::18) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8ad29f5-0e8a-4c0f-79dc-08da84cff280
X-MS-TrafficTypeDiagnostic: DB6PR0202MB2552:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hwR57i5rUPtJr+yWi47ctCMC99RsjP/QtleWW1lu5ERvvMCLJs1iPdmM6mcqPiWkgbJghLD3dmIenVJ2HAMY96CiidxnU4t5bMRK38h76PghGifo7Gx00309ln1fEN/I5xLPIGKLyYpisOJNx4XGjG39FyJLMTASujBNmgbE1GzcLjQh5mVxdciS+PtNq5xX3Xuubjr0H92WsE8QqVWsECdQjvXzIASCYWEXGywRDuN/BkYx6SAPgv6FgVStt9JjD8GC/B6KAZGyrwbeEu1IdpgleJnq6JEhtyIj2lmQtxVaIQyI1I2BzX5tO0JR83Tv3y7zS/SL7Qc1ZtY8OiGgVGVTNExXQKxVO1D0RisYboCsbjDDVOpYYvBP9+4WhhV1EGT4YGLZAXiDpVg4jlkQjBwT02JWmDk3xSBl/lx/yNVnVmoz+OsXCSIhMimjv2wcDSbhqE8n65boZvZHb1OxtyFj4P6Egc11lzQ7tOC1ViNuaM4thzwjTj4+snTzPxg4542SP4TCNnvksTJyDZOz4VUE6GRugociagykPIjaVQNzHgCu3rTIDER5IHVhV+c2DUPARBSdp95fDGBIj2njNC7/BM+Q6m+1fwcf/1i/DJvmJfClRNJjf3a9OLpLVK1uffUg1rp9713alVyAV+Kro9IjR97ILjs+YnGHbgJM7Gke79HG2mKKuvhDAZX/WFGul3z/4l7aoHar3kjp/OokyReHe1/ARkTjxJdPdKMKp0k5vk9NrCZlNMrcL7+0GalF3L2pzTpvKnOamD92QijJr0MXRNCsKMQt7lw8Acix/HI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(376002)(366004)(39830400003)(396003)(26005)(4744005)(6506007)(5660300002)(6512007)(7416002)(2906002)(31696002)(8936002)(186003)(38100700002)(86362001)(2616005)(36756003)(66556008)(41300700001)(66946007)(66476007)(31686004)(8676002)(478600001)(4326008)(6486002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHFneEYrSHE0WlE5YTlVL29wc0o2dDZEWXlZK3hBV2NQMXArOUFUR0NEOUNk?=
 =?utf-8?B?UVFLWUk5UnhoWVBJS0dwWG9HN2NJYU5RRU1yeS84V2p6UlhkN3JNdVg5b25h?=
 =?utf-8?B?aEtsWWZxdHdTVTlWV2VvWlNLVmlVUW9Kd3VuRkJpcXBjeG1pNkNLVEhtSHBI?=
 =?utf-8?B?MmNzblRjZm92YmlCS1BsdmZoZ0RMRWVPb1hFemx3clRWTHdBd3JJM0JvS2Uv?=
 =?utf-8?B?VTFpY2RrQnJDQnFCT0xCNU9CYnNVZTNSdStWSWdZbnRoR3ZrMjJReDRQeERG?=
 =?utf-8?B?NEpnUFFKQnl1Y0gwVmozYnJpbzJzZzZQamN2RFlmNzY2ZTJJWVlRRlJaNmtz?=
 =?utf-8?B?QnFxL2M1TC9WemdCRW9OeTYxRnR0NXlKcmVpTUtuRkFpOGN1LzcwMEVRd0xt?=
 =?utf-8?B?c2Y3N2RWbkk0Ymo0c2JCTmZEeVlGQndlWm1ROGQrTzVKMWRoNUQ1VUdOMGJP?=
 =?utf-8?B?bzhOVlJWTTFoU2hpaGdYRE9Da2c4OERXaHNPWVYxVGVpVW5BVGh1K0RvUjdj?=
 =?utf-8?B?NkZHNDREQ0ZpRTlUcGgxd2NpaSswSjUzeTVCV1BxWUVReS9xekd6ME1LTngv?=
 =?utf-8?B?YWd1ZGJUR3ZpWkJOREgxdERyV0psVkQyc0YyejQrYkdFUUpzcG5wcmZ2YWlQ?=
 =?utf-8?B?QjJHWVd1dHpEVllZNEl2YVlSeHdKd3U5U2hyeDI0dnBCakdtci9EaFpGcGow?=
 =?utf-8?B?alBiTWp4NHdvbjB1NlVNaGE5b1N1TENHV0dmREhyMzBDVVRXeDM0QnJwTnl0?=
 =?utf-8?B?OEp5eFV5T05XRmFRWk51Z1JTQkZ5MXMyRkRSaTM3VVA3eEduUUVVTEl5Wk9k?=
 =?utf-8?B?K0JCZ3czNVg3M09CYjlHc3p1VmNwb3lPcG1pSUdxcW5VTUM4d0ZwMDltYmJ4?=
 =?utf-8?B?STBWQ0tUcjJEaEk4ZWZqQ1JzUFZrN1hXdHE3RXJJd3l6blllSGtqVkhJR0tO?=
 =?utf-8?B?MEZxTEd0ZXNkS1U3VG1YOUJYT3l3WmxLYmFwT3Y3VnRQcWs1VEovaERKY0FS?=
 =?utf-8?B?dXpyQnlkUDhxNEVkaEFvT09Eeks5RTlBa2l4Tk00VDJSWnpyT2VhV3grcVU3?=
 =?utf-8?B?UVVlZWR5YkY5MWJpTlVkdVp0MlRDZmhiRnBqWnFpM1ZaQW4xOXp4cjVvRlhq?=
 =?utf-8?B?aFZjY2E3WmxtaUpvRjEzc3hvKy9CSDJFRG85MExxV2plcEdVQWRxOEJtWEdw?=
 =?utf-8?B?OUJCcjNxc2ZLbVFxalhxUU14cHVpSElKSS9HeUk2TXQ4OFhlVXhjdTRtc1hq?=
 =?utf-8?B?dEFyZkRVbGxuYi9Fd2RaSTZETmZESHRZL2JzV2ZJWmNMQ2RKUlprTDhjY0di?=
 =?utf-8?B?VWlpQ0tZN254YTIvMS9NakJhL0w2Y2IrWGVHL203MDk3REwyWnF4cDF4cU05?=
 =?utf-8?B?RlZBR3ZDaTNoeFp2ZVpoNmZOcE5DN0YrS3g0OGJRSGp4RnRPUWs5SnpDNi9C?=
 =?utf-8?B?TXNBWUkzSW53eXhvWStWUlZTWjBKWkdKdTZLTyt5M1o3S3FLb1F6V0x6eUZv?=
 =?utf-8?B?dGVNc2RDWm1rVy9talRVSE95T3JpK3l0WUZrUXRSZXVhaWVCZC9IdmJ5T2Qv?=
 =?utf-8?B?d1hncnhkWWROM28vdURYMCtJRUZsWmFhV1JrRjRxUisxZ0MydXZvR3ZTbXNZ?=
 =?utf-8?B?Tmp0Sys5MU04cU50ZllRUytHWTIzdERlRGErUTZ4ellYVmtPVC9panRaK2g3?=
 =?utf-8?B?MG1iUE1vK3UyeUtIaHI1WHgrNXI2ejY5cFBWZGVYbXBmYURybG1PWUE4WVlV?=
 =?utf-8?B?MkdWNW9HMzhSN1FMODVCblp2T0I3emFSUk9kdnJaT3Z4VS9sRnMxdno1RWx5?=
 =?utf-8?B?NVJlbkQxMk5hSUV4WDVHYXpYTjRFZVdZYnBoL0dYUFlxUldDWUNFaFp2TGdZ?=
 =?utf-8?B?cThTSnUzeld0UXVDdXkrSFU1ZHlkZTAyejl6c0RyamlQMFNmZWhwVEtsSlhR?=
 =?utf-8?B?cGVQYjVVV2cyUWp5OE1JZkppd3ZPVDR3RTYyeS84RVVqS3pDU1NzL08rYndL?=
 =?utf-8?B?NUFLSExnTkN0bTZDWHljUkFIQVpLOHVBTWZXdlRxUlB0Kyt5WGtOTkZ6aHFs?=
 =?utf-8?B?MmRsWG8zVzNxMVNQR3l5QjFQeXMvU2REQWxhaXhqT3lQVUMrZ0RTSW9XZTlj?=
 =?utf-8?Q?7iVcCGNTiHuLf9HImtxUO+xmZ?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ad29f5-0e8a-4c0f-79dc-08da84cff280
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 06:23:08.9355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNI8+AuSEBbXr0lZsMFy2yk377JrOsJqEDeIhvBA3O+iUucOUt4Ln3PL4Y3G2e+X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0202MB2552
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
> Since some devices may link fwnode to dev but doesn't link of_node,
> so here we could get mux_control from fwnode again.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/mux/core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mux/core.c b/drivers/mux/core.c
> index 49bedbe6316c..06d4e232e056 100644
> --- a/drivers/mux/core.c
> +++ b/drivers/mux/core.c
> @@ -538,6 +538,9 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>  	int index = 0;
>  	int ret;
>  
> +	if (!np)
> +		np = to_of_node(dev_fwnode(dev));
> +
>  	if (mux_name) {
>  		if (state)
>  			index = of_property_match_string(np, "mux-state-names",

This feels like a band aid. Is it not possible to convert the whole thing to
the fwnode interface?

Cheers,
Peter
