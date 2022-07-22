Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C68A57DB25
	for <lists+linux-usb@lfdr.de>; Fri, 22 Jul 2022 09:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234587AbiGVHRL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Jul 2022 03:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234612AbiGVHQ7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Jul 2022 03:16:59 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2097.outbound.protection.outlook.com [40.107.243.97])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D1FE30F4F;
        Fri, 22 Jul 2022 00:15:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ib1oVOBeQVMvV+ZXk6kSRRH1K7Swp1sHMTLEFyHWjfkRwE0HbClpKh7wv2/xnQFCj5EAcJN7XDSFfeV+D0LGGfR7Zo/z5BIuJPb1U/h1zUygqr24RrgGEATiM0BzzcJ5S+F81JR/jRF8bsDQBNAlyKzRF+o8Q5BD6XedOzsEFyPmrZz4O0rWv7P1pogAVlL9HYYiy4QeMhRGZ0P6kR69Ki1NWirnEpQMMgwsmfg/33lRTiGiY2esw+9qIzQocecNoPz903A/+bw9pIeBDIC2UgbQx0B3uOVHt2YGcRT6hMgfloXN39QyC7Qo6MXZy5nlkIWPg9N6jyi2AVFew/Fp5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EHc2B1Ci57DmkghA4NiRu/G3AsMC/+NKO12V9TFuVM=;
 b=ARewLZm9Cxqh8+o90rD/j3KVmHMgVTMVB8y338xgBi9Ed2B4c9OQ1BPK+cN0D8G/XnQHPBZxZagXqeRa/9n70dToKKBMMSVoqjQDvRD2C5ToJjGKbLvz32zVK31g0ReHrqkqpxF4dfZtNkXZuUlztBEtkDU8B7qXLEYkKzWNGKNwnjYEPaVz9h33zVVoDn76hJbOxjwLXb9AwR9Cr6fnCUTIjlgJEoGnWw1Nr2Rz+zsHu7n6I3vSUfEyfryK8BemdR/R+1pcOFSXFkNZv1g2cDcqtESfFtlTwGM/vunPR03HDHo5ZCgKAUGNhKWOfpPN1nAKUzSB+NhQpnv9FBqRmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8EHc2B1Ci57DmkghA4NiRu/G3AsMC/+NKO12V9TFuVM=;
 b=Stk5m8Bl2ZIo08Lodl6twN3eouHej2lbFCcZZKCUsnZUUDwMNSS5kkZY1hbidAOBtCpjfsO/zKnmjM23nMAZao8OTMW/OUy+3Z1ZF/xUjspXZUvL7w36VOqdh/bJd9RdTNCwtCitRl+vAzPnUjGXB+nwqMDnO502b845GxsRTWI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by DM5PR04MB0218.namprd04.prod.outlook.com (2603:10b6:3:77::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.21; Fri, 22 Jul 2022 07:15:11 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::f02d:f2e:cba9:223b]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::f02d:f2e:cba9:223b%6]) with mapi id 15.20.5458.018; Fri, 22 Jul 2022
 07:15:10 +0000
Date:   Fri, 22 Jul 2022 15:15:02 +0800
From:   Xin Ji <xji@analogixsemi.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: typec: anx7411: Fix an array out of bounds
Message-ID: <20220722071502.GA2853704@anxtwsw-Precision-3640-Tower>
References: <YtpC5s4/AD8vFz+X@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtpC5s4/AD8vFz+X@kili>
X-ClientProxiedBy: TYCP286CA0099.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::17) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 534c7fdb-f9e0-4248-3114-08da6bb1e9f5
X-MS-TrafficTypeDiagnostic: DM5PR04MB0218:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZGmBEkG5sBu/XAew9Y/GsfaXzrbQIlc0tw/Ar2scr1a+hCizlwUdv1eycF70/HWQ/N+LbKzeYZ7RiOXHVcAAvc6aKoRZDuKp9pjN4Al2a0IIwNDNHmmCEeLflLu2i6QD78P5tShpq+QFW+U8kcIdi422+34wqIn7rtPR7035rjov9Fg9TfIg2FMeUuKwYg7J8lEWK8EY86OJx54X368xSiaDondzaivMSm1NDdTmglA04FQjuW95vwRQVr0P/FNaHs5cxBwFG1aQpijr8cTEvshGuEMT9ZKj0TKjT73bp8JmObIm6WHWtxGe33aIi4yYXswILijM3vFcPJC/7CFmZMHRltVHOjnGg79RErU2r6Q4isPRZhhbwGBALUTF6Pz3pAMLq1oH5hXwc59hyD/U9nOnSR1TwHZxbjSjyH77z4ic3HwNQCrcDIOVTCM3aLWbwjOmXeAb5y0Z/E/G2CC8QY4jIt+6dwH+dQ3igLk0eDcV8nNVkaIJqiGQYv/yofQYIbxgTvfp8s5iL0MsAROD3WenXV6MPI+zoYwJngACtVby+0Fd7WZ7pGLMNvWfrpgvC7NMIbEvwacna4g7gKDT7mXf+LoUkdI9W3hJtaaC9NalEhM1MigcEYtpTkuMCTVtpJsxD/cCGmGdEScFmzuYCtDUqBUsOlj3Gkh0ten/N94OI+VsYff2ZKzBE5V0Qk32E2FEs5OD3PEyNNOYVg0CTNps6xXlAq2+R581A2dOuwbLT8cTtppSh25Qeh6MZ7VYihgzSAVCcaYMFckMCKJljdPzxcSbkVMl1IGzQn2bGc4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR04MB6739.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(396003)(346002)(376002)(136003)(39850400004)(366004)(33656002)(6666004)(6916009)(5660300002)(8936002)(316002)(86362001)(66476007)(2906002)(38350700002)(38100700002)(41300700001)(33716001)(8676002)(6512007)(478600001)(66946007)(6486002)(9686003)(4326008)(6506007)(52116002)(186003)(54906003)(83380400001)(26005)(1076003)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a3rLRRxd6L0e7LsTmGZLltbK0Jui2vWnWmACTvaRkSMbfVzyo6RS1JHVhGPy?=
 =?us-ascii?Q?kp0EUKC4thLLK5656XIeyr/d3b4/lrQ1IoN4ZoH+3Rashwzp8vlzE/E7UNTM?=
 =?us-ascii?Q?g+rjCbKCs6UQggUAUHNmw2I7kCHmfwmKtpUurL7RF/S7Z3PWFmwJe310Gb2z?=
 =?us-ascii?Q?2sUdlV2V0LjhY4UKcH77Ov5c6BgvC4CPLjJ3/aRODDUjYe/os0jp0pg3xqe0?=
 =?us-ascii?Q?xqvcUSMpeVZEVXMpTlNsG+qQN0nWsvmfcRXhLzngcFQzyYOa7SXV3QarL85h?=
 =?us-ascii?Q?ApFFlkrj3zFxtZKg9tqmNQGZyFlZyPmRfDBrawaCGflRbRj03rZv6/evGnrs?=
 =?us-ascii?Q?u/h16MZbyK/W9rhehwaW0752CETHGbTCbzI0hWd76cLFhD7wq5o1nnIaER6z?=
 =?us-ascii?Q?tz/U2O1pU5I3QIA7onZs2FyUCkokY/8wrXQflYsdVDymbuVGAJ2lx/Oggqib?=
 =?us-ascii?Q?+tjlyRcRd5tSlw6+q4reM2hi9gI35E4mf3iH/Juf1S8RazZf6mh3p4rKbbGq?=
 =?us-ascii?Q?l4BQxLY+DegkkyD2D5L4V6A2OhKhkvXP8aC36/CsKs5+30asKXUvK2dkBlU3?=
 =?us-ascii?Q?f4brGV8SM1pkFg0eLO/ulsO/kqZfo2Hha9JIcIsB62IIVkUITVjY1rjOjRgb?=
 =?us-ascii?Q?4N5unXqOSmZTFSo0aEt0qUaU3KZPSoNDut0GucCdpsnOvAMlSLulffBULJwl?=
 =?us-ascii?Q?5rxPyJvV1CJJWQhVA+Tuz3u9lGyYS4jJWLDOnw3L8ojEHJuDz6DJ3J5dMrzw?=
 =?us-ascii?Q?qmhx6/2WP4Hpzsu20WYK7Ds+CVnOhlbC/lfKTDge+4naZv79mpNY1N/+9nsl?=
 =?us-ascii?Q?zYErTE96aq+ZYR2wDRrwfNfZneBjYwI8w5d9lJuCIxtKgDfNMw3zANOsYP3D?=
 =?us-ascii?Q?vxd0m67pEHHL7WdO/+sKpBEUU3cIv5GGDAEEfzjVO6aWa8I8FwgzLrjgp6+B?=
 =?us-ascii?Q?rwu2LUWtTgjoJH7601O6787nY3JcLpiH4hdr6+zLGhi6OKSN6+OF9MZFIHB8?=
 =?us-ascii?Q?myFQmBa67NcQ4RjI68Cnrgr8M3XKMDOV7yHWVUuX4fEVKH+yKjkutkLs07ch?=
 =?us-ascii?Q?F+DuXprmKHn5HJFhQbys8WpK54X+HS+VprwH32vOhcZN1EhTfiKl3kk8JF5V?=
 =?us-ascii?Q?4jfpd3ZmqV98PYbuRKc5fE/uO0OTkLVv6akCIqp9bs+oMR4o7cQhso+1U6ln?=
 =?us-ascii?Q?Q+Bl+ABKUQs4B07AVCe2BCj2PXR9/nW89mCLSPmsTa4skpE/fSj1oylVECsQ?=
 =?us-ascii?Q?0xmlPm2B6sQGCmNmROVPSdrRdBWTYOCqxDbJH8+TjPX2PUwwY/OcxT4KwW4G?=
 =?us-ascii?Q?kqk2LQygTqQycVdMA1Er/4tniEXxD9CxPf1eGZbdBEzgMUojhPjexk1tqDEy?=
 =?us-ascii?Q?OOB4JixiytdtNIGxTUbTVYS9i155VoiU7kT8ylDZniwn5cGfvNxFoX6snsre?=
 =?us-ascii?Q?PcMJy4oXyTOi/ejlfQ67ACnQt1WJBh6xjkzy0xjJqMrriuZHkKM0nbjX5et6?=
 =?us-ascii?Q?RMd/zBlJao0EqM7uNj3yIpt/ynNxLFHhZwstVmuBppUGK6vorLfVih8SYaAo?=
 =?us-ascii?Q?lE3DROKxetIKrwJB3mhuKvl3SFToAlIThJx2nU1u?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 534c7fdb-f9e0-4248-3114-08da6bb1e9f5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 07:15:10.7233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S3XyX1oT3viegxPIJVzMH3CIO7VfQhG0Jfjq2oajDhQgx2yf52a9+PXNww9aKGawstJkmwth178BBK2H/F7xDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0218
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 22, 2022 at 09:25:42AM +0300, Dan Carpenter wrote:
> This should be ARRAY_SIZE() instead of sizeof().  ARRAY_SIZE is
> 4 and  sizeof is 8.
Hi Dan Carpenter, thanks for your patch.

Reviewed-by: Xin Ji <xji@analogixsemi.com>

Thanks,
Xi
> 
> Fixes: fe6d8a9c8e64 ("usb: typec: anx7411: Add Analogix PD ANX7411 support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/usb/typec/anx7411.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
> index b990376991f8..4f7a5cc968d0 100644
> --- a/drivers/usb/typec/anx7411.c
> +++ b/drivers/usb/typec/anx7411.c
> @@ -992,7 +992,7 @@ static int anx7411_register_i2c_dummy_clients(struct anx7411_data *ctx,
>  	int i;
>  	u8 spi_addr;
>  
> -	for (i = 0; i < sizeof(anx7411_i2c_addr); i++) {
> +	for (i = 0; i < ARRAY_SIZE(anx7411_i2c_addr); i++) {
>  		if (client->addr == (anx7411_i2c_addr[i].tcpc_address >> 1)) {
>  			spi_addr = anx7411_i2c_addr[i].spi_address >> 1;
>  			ctx->spi_client = i2c_new_dummy_device(client->adapter,
> -- 
> 2.35.1
