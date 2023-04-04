Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1D96D5D72
	for <lists+linux-usb@lfdr.de>; Tue,  4 Apr 2023 12:27:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233954AbjDDK1p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Apr 2023 06:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233184AbjDDK1o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Apr 2023 06:27:44 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2041.outbound.protection.outlook.com [40.107.21.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8C238F
        for <linux-usb@vger.kernel.org>; Tue,  4 Apr 2023 03:27:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ai1YXQORCq6zYtEV42zLl/ohpovQjaG7e38MjzxDbuJAoStkY4Kzq3A/1/PBkdr3nZ6GE/RY0OeoenbuaFMOkB/62hjCIgbJSTvbZZ635EZ9AbuTilNN98fS59PGPhkCnFJxPGKVdcAec11mL/p8jkw4ARXOOYxANCADqVpB5rkdlGpv6wKwlu5ck2MdG2l8WsIcCp+soC26OcsWdXmB9Pplt94EbWpQAzQjvndObMpx5h7BLExSoEgEinsoIB9yUTF9Q0myfM2umCls8k9gaqlihI7w1SeWNHYvqmNtiI6PXlAf8EHH5PsqiZPCA86wdB/2sH51IbsSHNLUHONGCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csO66lN4Df5v9swmF6Q8v1v+tQjai6flzyoXJ5rtndw=;
 b=TQnW2wpAIWC7v9WXyR2TGhpfAQdjexyw1Q7Fg8NOS9dQgCFAY+pV7t1qi8huunsGZ/3RDqte9OMOXHvytIbsgbOqh9yxSmZX2DjPUhlxxrWfOri4bQIQSrY9qe92/8xJy2KT+bRpra2Df5uOB/+sGdVKgga28AWckgtBQyNV6SDp6soL9EeJUVxCqyNQrQR6Tz7Lz67rwny+G8N/V5mjQlhMSrS3Rj+/oULFMhUZoEhd/cY/a4547A900w9LcHX1hNhvLXTeJilyuqlApgQ7Lfxgsoh3h+KJjYG87GlZMZl4aUz3+KFX30OxAwdU82vuAaGxIiLgolTV6ijkKMkFsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csO66lN4Df5v9swmF6Q8v1v+tQjai6flzyoXJ5rtndw=;
 b=e6B3oWcfm8ItL9V+Lwp6k5EOj1reAniAyk8wK4RJDWPaiheMi7MKo5MARLlbiYnNeswdeQvgvxIStU32Yf+fwYfOBuA0sQwnZn/+OlXuYrL2agHd5gxpUj+K+NMPV9E8LNLIXcYaaygjUIUkxm7boL/HACxjDJVfNP4sv9Uq2gUpy90qco09ebOO/FHDgxZ0wErtRDE4arZgcVDiPuTbaJYe+zWoQMTuPlqzLonqkK2vTmitV0SIvr2wUKThVAeTbjc/AW9I9sVJzq8qZ1rh5BEE6DE9rRde1dnyo5InGVngCHEyb4ZfCNeVIIil40KpR7oLIleopOFkoesw2tHsOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by AM9PR04MB8905.eurprd04.prod.outlook.com (2603:10a6:20b:408::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 10:27:39 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::74bd:991c:527d:aa61]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::74bd:991c:527d:aa61%9]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 10:27:38 +0000
Message-ID: <25479ae0-e3d0-3add-d25d-d32da46f807e@suse.com>
Date:   Tue, 4 Apr 2023 12:27:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4] usb: dwc3: debugfs: Prevent any register access when
 devices
Content-Language: en-US
To:     Udipto Goswami <quic_ugoswami@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>, linux-usb@vger.kernel.org,
        Oliver Neukum <oneukum@suse.com>
References: <20230404100055.28100-1-quic_ugoswami@quicinc.com>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20230404100055.28100-1-quic_ugoswami@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::20) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|AM9PR04MB8905:EE_
X-MS-Office365-Filtering-Correlation-Id: c909abdc-f1e1-479c-34e2-08db34f736e2
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8pn0Pnhno9nbfVEXg6XPKqvlpKPpspiTQv0nqNCdCxybyMcb2IJ/1qVS4oETMl9P3U+K6Zl2ltWNsud7grFZ6SZJDm4Q7hYbuhMwPtCFI6RthzjnU8jvo4KsmxmPNmp+fAEyD/JVG/0bkEFBL+labD4BMA2HYjeYVlKCCnWomAxda/BKZ1tVq9wm+OLKvE1SS2j+xIa7mwVGqzTcJbUIrDMkE+9FuPGX3b6PeeDpWEq+FtD4L+43cLMHgi2YPK6MJFQ8KnmEmyK200lFY591mFk0nd77P0ByPwJNKpOmjKXrvffkenmtoPXycKPsd/QUtu7iXxXKNlOyFXzUFYYHZR8BRat8IO62QqYy4Q7OpvhEWdezq33o9gvMwXb3Bm6OsxIxzZ4K7E76acy8tb4SUYi6Uje5rILHDsG+nNeqqE4Co9GdMgpKzZKK4ffCzH9WbCXlDKZNN90lullOyXuNDlPe77rQ3h0ZIxTqAmtAnVNY+CzECqlhmuebYoQt7H/Jhx6Ch2irFVvx2aK+cfKlglwuZCOa8TX75FXod0JC6gHCXsoHH+uDrResIYJkM0rpO58md7R57/DhAyVUC6nyqDmupJQoN/8VcE0NNFIO0hnhmw8WyXOAIEyOYeUJew2h9WdgPqsYxpdQMMx29nMyTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(376002)(396003)(366004)(346002)(451199021)(66946007)(6486002)(6506007)(6512007)(6666004)(53546011)(107886003)(83380400001)(2616005)(66556008)(66476007)(38100700002)(41300700001)(31686004)(186003)(54906003)(110136005)(316002)(478600001)(2906002)(31696002)(86362001)(4744005)(4326008)(8676002)(5660300002)(36756003)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmFEcmtXbFVxUEFVYkRUVktINDF5K24zbUMxaERaN05KZ0ZHeStSakplbFR5?=
 =?utf-8?B?NXRpQzlFMTJkYUpTcDk3c2lkNTBxKzZ2d2x3bXppZFpYRi8vOEJ5VkVVNlZE?=
 =?utf-8?B?V2ZwUGtKWHFqQUNwY1ovd0ZCaEZNLy9saVVZS0JVSFNFTlRxRUVLNHVvWTdM?=
 =?utf-8?B?YjVRcUpZcndKVnJGeTBhb0QzZWZMc25JVEhzc0UxdkNJQVlMOVY1RCtVRUhh?=
 =?utf-8?B?UWM2UE55WHVUSXdFSm1adXhDTnVKQXQzRmliWXRDN2llL0hZdXdRdGZsV0Q0?=
 =?utf-8?B?VzJQV2ZFVktBSFBvSGxEaDYvc1dUS2UyM0FXLzI0eFNhdE14a2lqZHBZMWZS?=
 =?utf-8?B?YWxMWW9WZW1PZWxBcmg1UkpSMWVuT0dDUXZDNkxaeHVkSG5OOE1iNUFxZVpY?=
 =?utf-8?B?bWZzUGJBVi9nV29zbGQ1ZGpIQnpRU3NnNDdDVjdNV1EyaGtkM1hvODl6cHFl?=
 =?utf-8?B?aVNneXR6MnhOL3JKaElBclFXbFkxQWtzMWdWWkVLcFgxTkZiSWdRcnZlNnZG?=
 =?utf-8?B?Mi9RWUFMVC9XZitqTGh3MTd3eHFYa3N4US9UelBtRHBScXRZaGROeWVnc3JU?=
 =?utf-8?B?cXB5WERNeEQ5TVFacmhMbTdoMmxmdmRFRmRwZGZQeEpNd1NpMjFjUUZia0Z5?=
 =?utf-8?B?bjlmOEZndU1tMVBRZUh6cGVJc3poUG5Mb3pSZCtsQmtHWWN1UmZCMzRSV2d6?=
 =?utf-8?B?Tis3K1A4Rk4xZjBWWEJUbXE2ckZGcExZa2YyWlRPQXhTSUZVeTU0cFFkVzFN?=
 =?utf-8?B?SmV4a2htNWRWTUkvMFRVSG1ubXJsMEZJclFndmJyV250elFzWi9WckNqaXhO?=
 =?utf-8?B?bEVVck1ibUxBMXJLcTV4Y29OQ0UwYk95d2x3cXVxSjczbEhWY0FKZWd1R3ZT?=
 =?utf-8?B?WDZRcVp6bXVkOGptUkU5Y3d3Mi8wcmdDMk5jNFJlcSs4YjF2Tm5USDRWSnd5?=
 =?utf-8?B?NXJCL0d1QmVrL09GZnc2Qks5STJaM29PZS9EVmJhMFh4eTA3MUUyV2JSbGll?=
 =?utf-8?B?bXlKb0lyZ2FlOHR5ZWNYaUpIVUFadjk1dDNnZWlOYVdQWE0yblVwTDNNUTBx?=
 =?utf-8?B?NHZRZ09IeThJY0o1STZrR2x4SE9VRzBsaDlSWTBTWkFmbE9KL04zUU55TjVs?=
 =?utf-8?B?MjhJTHloVkU2RkJqNkZXYktpK3hleUQ3S1NVc3Q3Y2J4RE5LcTQxdE53N2s4?=
 =?utf-8?B?WFE4WEU4NUdGTjhHZzRpSlBFdXJBdXY5MmZHOEViY3FVN3lQS2h3cE92cXZq?=
 =?utf-8?B?WGc0dC9mVkZSeTZpMWxleHdlT1ZiRUxHZmJMTU16cmhwN3U3RXlxWWZaR0Fs?=
 =?utf-8?B?OXNvc2dLSmJmTVdLZkd5OElSOUI2RmZ5R3duanhpYVlJZVd3cW91cUJla0pO?=
 =?utf-8?B?YTA4emxJV1RWdFlkSk5VVVhEY1RNTW8xYWV4eGFxY08xa2gzS3Y3Y0hkSnNm?=
 =?utf-8?B?OFdPa201dFFqdEVya3VHdjBOekE0dnVncktvN2lFaHZ2NG0yb1ZJOEREUzh1?=
 =?utf-8?B?MzdrYUlYdDA0d1NOQW8xRjQvL3g3TWpSQjBGTGRlcDVQVFJ0ZDN2WGtlOVBE?=
 =?utf-8?B?ejVqZlgvM3FzS0paQ0Nsa1IyY3p1WVVXOHVmNDRkLzliZFo5MnlaMGYxVXZp?=
 =?utf-8?B?VWdCVVBHMzd4NlJZWFFYVERPQUt1Q1lKcmhGR1FzQ0pQdWNHOFArK2JNRGRI?=
 =?utf-8?B?K2NWK1dKemhuWUlyOEFod0Rsazd5Q0E0azI2K2J1alVXZm9MVWdBYVlSS04x?=
 =?utf-8?B?S0dQaXZpUEVsQnJkQ2ljVEdwQ1ViRVBmc1kyOHJyQVJWQlZzb1p3bkdIQ2ZX?=
 =?utf-8?B?YlVJT2taa1pTcDZSQ3NFb1VnRkcxdVNjcFh5YzJZNlp3aEI4Rm9rYzJqaDdr?=
 =?utf-8?B?MFZBSEVWMXgrVnIyMWdnZGNyTG1GYS94aGltbm1UVVVjZkFXZ2toelpucHU4?=
 =?utf-8?B?STdZaUYyWnFXNTh4UUd3SjdKMnVsUlZZeVZXVStDSUlRQ0t4Zk8wU2NFUWdB?=
 =?utf-8?B?WkdpN2hjSTE0bktvWGt5NDZzbS90SGM2WCsvbklKOFJSblZKT2tUa3UrUlRs?=
 =?utf-8?B?djNrcTJtRmRnV3N5MTFmbjBBUTlvbEx4UHVtcW9jZHJraEVpVElUUjlRbUk0?=
 =?utf-8?B?L3J2VDh0eTUvSUdZMDhLTzNTemJaQTJZZG9NUGRZL2t6U0lRdEplbXBIY2F3?=
 =?utf-8?Q?2Ft1rUnepQbro41NSgiQc7vdm1EVPLN8+ykyVtYtXELa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c909abdc-f1e1-479c-34e2-08db34f736e2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 10:27:38.7296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sMQwl6RFtiaGi+sYqmqFDp/G1iTzPozfthcwk6VOX2kqEUDLM1YEOCgdju3Lhoz4+cYm+y9jpLfiC2V+CDF9yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8905
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 04.04.23 12:00, Udipto Goswami wrote:
> When the dwc3 device is runtime suspended, various required clocks would
> get disabled and it is not guaranteed that access to any registers would
> work. Depending on the SoC glue, a register read could be as benign as
> returning 0 or be fatal enough to hang the system.
> 
> In order to prevent such scenarios of fatal errors, bail out of debugfs
> function is dwc3 is suspended.
> 

Hi,

those look nice, except that they are doing a lot of seq_printf() under
a spinlock that is not needed.

	Regards
		Oliver
