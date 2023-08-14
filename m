Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B72677B8AF
	for <lists+linux-usb@lfdr.de>; Mon, 14 Aug 2023 14:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbjHNMdR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Aug 2023 08:33:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbjHNMdD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Aug 2023 08:33:03 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2050.outbound.protection.outlook.com [40.107.8.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D18AEE58
        for <linux-usb@vger.kernel.org>; Mon, 14 Aug 2023 05:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7R0Azqz8Fb4w2bE2f314UpggB/4YH1eptWzpbpjTLYA2zMqegaxA7/TOfMYX0LJXBr/ZaRxiejFjg3YNkjkXGPv31Aqk7s1sDqxJpf9O5Mqdpby+DTJtRBj3KjSdKwnpPXh89y4YNtEZr0M/xuTtCVwwVqlsq+hCpQocQy2e7DNqWVkM20mA4KlGFFzyxApKuuuUcmwAYcCWkCS1tzoj7Y9JAzb4BVNrEsFaZc1dAXNmmMpcQLDyyM8Tjbtdy04kxrXw3RssniGzaPEMVAOqYSHC2LLh3fHMjoM8jR46Ca6k1umcGVEcIzU3DPC/SC1s3oKu0jSr6TQqgu5IotHVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SfLpx4fQsGeySYDP3l3nL/s/cxSx3oSm1grY1bhvcc4=;
 b=K0Rbw0f9r+FBKXxS1n8oSGJ9oAwTrbu59GrjilGbmyuNvcgOPOLbrvaqGuNZji63J4LAIzJT5E9gCFyEeFC2jVVA+LDmNnlGP62nJoTrwIW52mPe7FBxi/zknfXzQaosxe/ywOUREHzNLjQ1gap9DVmNu+j5b7bD6lYXt20YpIZhbAURuJLip8g+SeNRK+CAE2g06EmK8InS/DbTTUtGMus+iQ1kqzF+PdygsQI2VxD77jWteLZVKydS7Nu1e7pxck92L7mz15ShOlAWEqCrUyQXxkgh5K9ea/p5ay9vfesY3Lo49zQE2IAYUo+TX3Z1TFGABNBSstsz6ws4Zpu6tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SfLpx4fQsGeySYDP3l3nL/s/cxSx3oSm1grY1bhvcc4=;
 b=nGGuD3hlPtFUfySAsbOZBxd3cA5Ww+WKxV+q+G7HqcfQ5P256xEeSeK5zv4eb8KuXyLC/0n1dPMQZU54sQvVcwI2M2MPujxTCqClWbpCf0hG2+TzRBxhfncOKpnr/3aRo19rNPdegFBMFenFwJbF8FWVTXtdibo1P0O13o7BEa2v3P+yhM6HcBu5s+OmwPePFudI26cW+ITpzMcW54jS9bWL0/ivANmotkH1Dq3h7OKQYMqrgtnm2O6C/sPAQlEpML+LTdMGgpNywPXvazT8TslWjxsvFWvS1dLhe3Pnq7Hci3RYiNRcy87OjROHjJ301vofbigEJa2hYGC1/t2sjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by AS8PR04MB8069.eurprd04.prod.outlook.com (2603:10a6:20b:3f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 12:32:59 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::51fc:914:29f5:a420]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::51fc:914:29f5:a420%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 12:32:59 +0000
Message-ID: <33cd7324-f2a7-1b85-f747-29aa6c4f4941@suse.com>
Date:   Mon, 14 Aug 2023 14:32:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] usb: cdc-acm: add PPS support
Content-Language: en-US
To:     Dan Drown <dan-netdev@drown.org>, linux-usb@vger.kernel.org
References: <ZM8ExV6bAvJtIA1d@vps3.drown.org>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <ZM8ExV6bAvJtIA1d@vps3.drown.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::18) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|AS8PR04MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c09e2b9-5348-4d4c-8134-08db9cc297e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EXBJksAil9q2sJSmCpopXcvU2AVWVu8xaWqeu8I0UGs9M3+WcOSVdFdHLdtKUub6CEmj/ecyp9AXiaoGiLRyq0K15nH2qzBtGPnZlbiyYKAPVasW6WZQ7IJLj6Px/0aABncRMZFnFgawmchXeLnmv8dv5tXP0HjNF9CW2IDlxrkWGEAkTCrLYl5AUOr4HUv2vwo9bg7/9b7MN1yALo2pHMeC3DPr4Vb9EAXdhPu4aHuRLUpV5G2FtN5j4UjMF3dfVO+EC0lZ+/Gkq7755S/V5HeMQ6+bECgqgS4Rc33l7SLXSGSMwj49q1P/D+QsA+nb6x6e/TmreDEl3e6V818uHKVA7jt6prAzWTiwJzUNsoHksRoKZxx3InUaVVHbZxpEiQVIuJnMjrguR8UgDi/FoIc67Hds1oOS6c06Zu8c6lR5qGf11zVsKWALHNUhgkm0jrw2iT6lZ547vah1aT9qcrlSp4KpQs6Vr3RvjvBqE/b57ILZwE+q0RSIu6mHKCROftUNWURtLwwz0rk9PmcnzPvmpsJdtUVMqyPU3c70CDKTPEo/3CWanwZtw7uzIpfsWWA7IevXX/tJhvjREpRgg9hS6ozPCa87uf6CnvcjeTDChHL+7VIyu2wHcB4qXdBMHxJhYNQGTMv1guyrKM3KHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(366004)(396003)(136003)(376002)(186006)(1800799006)(451199021)(31686004)(6512007)(6486002)(36756003)(558084003)(31696002)(86362001)(38100700002)(83380400001)(6506007)(2906002)(53546011)(478600001)(2616005)(66556008)(66476007)(8936002)(5660300002)(8676002)(66946007)(41300700001)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDloU3VrUWdiTlpzUjIzeS8xWnFJdkttaUxDTTNZdzRYdUF5bUUvVk1ocDlC?=
 =?utf-8?B?VWxGbGVRaytic2Q1K1U0eW1tYmR0ZjAvZEZhclVxbG1tcWplNzRSa2lHQXdE?=
 =?utf-8?B?Ly9mbnJubW5TWklYVGdCWExDK1VsQWt5eENyUkpWVTFKbEZxUEJOT25LRVU5?=
 =?utf-8?B?S2VjUDFsaC9ZWHpBOXZkclNYV05kTTdFWGFjYWM2YmFpQmZnVldROTNidXVL?=
 =?utf-8?B?RGp2aGV4Zmp1aDFQK0Iyek1KdER6KzJzbldZc3VrQXZVb3UyZ0lNc1BLN0Zm?=
 =?utf-8?B?STk5WldQVUNTSkdZcTEwUllxUG5EQzhrUmlkOCtBS1VETjhqTjJTSmF4WVpK?=
 =?utf-8?B?cG1sWkZIY25WcVYxeTJDTGc2cE93YzhiYlJPMEExb3B0NGZWV0JZaXMxVFM1?=
 =?utf-8?B?eTdodkNPUk9uY29nQnoyYVN5dVFHbVUyeGl1YUthbElFY0JOUjhGa29KRFlR?=
 =?utf-8?B?aFpiY3lubktkTWNMN2VmUGk1dm5VbGs1WXltWEYzMVp1NFpVRUI3R0VSWTJ2?=
 =?utf-8?B?TDJIbzF5c2tRczNQeTNodC8wZmJaUkxwdlovYzdtbEhxMEl6MHRDN0dlSVpQ?=
 =?utf-8?B?WitCWXMrK3hxOEl4ZHF6aVkyM2lPRE9SaGQzZTNlYUVNWjlPUVIzYkt1Nm4w?=
 =?utf-8?B?TU5wMkxNU0dieWp5WHRUUDM1ZXNlRnZERnd4QmhoUTdxY1RaVG5XUmMvRlo2?=
 =?utf-8?B?Rm04T0JXeE1uM1RBblRyRU1YNllBQlIwRnVQMmlsQk5xL0VkdDRZZDlxamNt?=
 =?utf-8?B?SVhQbjNZWWxTN2JNQXQ5SGdqQTVhamJISXBHUGIybTJYS2NvdmR4NDBtUDVN?=
 =?utf-8?B?eS9nbXFJbjNZZlVHTE1aWmY2SDZRdXV3ZmFPeTRsVDNOK2VRdG81TGNMdHIw?=
 =?utf-8?B?OFhZZWJ6dkN4WDlKa2xDempZbk8rWjhaVXMzZnUzODNEdlpMOFpKekFiWkxH?=
 =?utf-8?B?R0sxeGEwVEtqN3NKWDJQNGdoY29MeGpvN3RoYnBabVhUNUUvdXE5Y1BCUVMy?=
 =?utf-8?B?TlRpS0FYN1FhbjF5WStoeE81emE2TVZjdVlHN2ZtSWprdUhueXJrQ1lMa01q?=
 =?utf-8?B?SFNyaUNRVGl2dnk4ZnlYQnZaOGVwSXZQOW1VbUZROUg4VkRoWU5uYStydndD?=
 =?utf-8?B?bjI3VmRYTHNRbnpLSHlZQUV0OVpLMkpBVlUzV0ltbUFyVTcwVUJGU29QQ0dZ?=
 =?utf-8?B?QTNRMkd2WDFsQXZrR0xYakY1VmV2ZzRWVHFteTBONENQbk5BL01wNGx3d1Rx?=
 =?utf-8?B?eE54Rkx3M2hERytPZ1hBVUEwa2trZzIyY2tRdis3dzJ0UmZLdnlzS2QwWTJP?=
 =?utf-8?B?UDBCNmdZSUNyUVV6ampMNjJQelhXUE04TXE1WEM1QmZTekF0MmI1c0RWRW4y?=
 =?utf-8?B?QkFGbjFzUXFvbDV3ZDMvMXhRSDBIUW0ybElaeEk2cktGckcwNTREZ0JtVUQ3?=
 =?utf-8?B?L2RkdGtqZDkzMUhnMk0yUnM1U29qellZbTUxL0M3MmZQWjhhOFI5bHNzOVVS?=
 =?utf-8?B?b29nSldURmdkamwrUVFpODkvNi9tNGtyUlUzRHJKUFpoUiswc2UzWXpJTlli?=
 =?utf-8?B?QU13UHVIZTRZMVVuQ3JvUE5zOEVXMGZaS2hScnNtbFJHa3ViRVV5UVo2bWl4?=
 =?utf-8?B?dmVzNEV2Q1MxLy91N2k1SExtR0xmd0lIcG01bk5OQmRaUDN1cmp1N2NacDNk?=
 =?utf-8?B?dDBSeUF0SjJxaDBnUmpHMmRvcHlWT0o0L3pENkJPU2FSdlBOaHhsSGtnbWNG?=
 =?utf-8?B?QTVOcXA2dzhoMHl2UVBPdTN5M1hubW9ybHl1WFpXeGkrZDA5NHVpOHgvWitF?=
 =?utf-8?B?S29Sb0I3a0VXLyt2eGI1OHFxaVpkUnQwQWJqaVlIaUZRWWE0UU1neTVNd2JT?=
 =?utf-8?B?M0dycVphcjRjZ2FIdWVGQU5FdzRqWGNGSG1kQkJRbyt6R2NkcGYzcmp0S0Ew?=
 =?utf-8?B?L1JSR0JPeGxYMFk0ZUo0cXFmUFZ2b0daZ0JLTWhjUXNlMGx3N1NJcThZQWhM?=
 =?utf-8?B?K3dqQVVpb2RMWUtIenl1RXg2WU0vYUhSaHIwSzhRbUxjakxzQ3VFMmVDMGN1?=
 =?utf-8?B?cFMza0twb0RHdGx6V25HY2hudzhjbUxxdmxob3JXZi9pV1JJWnhuNjhhNTNZ?=
 =?utf-8?B?UE1wZ3NLR1I1elk0VTVmU1dTWkR6V2wwaEFjNkRPYlpYelFhSTB0c1Q1Q2hq?=
 =?utf-8?Q?tAC3iFp2BG9qs5OSYizqLxqGH3/3wc0rTyk8cg1BZE3K?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c09e2b9-5348-4d4c-8134-08db9cc297e2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 12:32:59.1615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qbi8LuncczghXdZ8RBSKlSXeqx91HNRypu01cBsZvrNDyYJWlz3mwRhM+X4ZveaXtcdWeeJQ/bRwEsIM/dvPGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8069
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 06.08.23 04:26, Dan Drown wrote:
> This patch adds support for PPS to CDC devices. Changes to the DCD pin
> are monitored and passed to the ldisc system, which is used by
> pps-ldisc.

Hi,

do we really want to do this with acm>read_lock held?

	Regards
		Oliver
