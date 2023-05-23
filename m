Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B84E770D958
	for <lists+linux-usb@lfdr.de>; Tue, 23 May 2023 11:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233067AbjEWJon (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 May 2023 05:44:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232887AbjEWJol (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 May 2023 05:44:41 -0400
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2069.outbound.protection.outlook.com [40.107.249.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 683C694
        for <linux-usb@vger.kernel.org>; Tue, 23 May 2023 02:44:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dM5Kpw03dMJiSOdHlK7XGKqZXF89IkjKUQLWIjS61GvLMcHCSf7eMcOFW8s5tXASs5WcVgHh9oG1OEmTPg2RGlHcR2j8ERFMWQMRWpfqk55wziMUPWYbX9Fbf3eJl3MGkGPtWRC9loFCxKe3by1X7AnziQA8h85QihaHnQSz0hqLeYDc8/rjP9MWMzj5i/k2cevMVrY9/RtiwkuvmbwN6Lq8yXhJuCI9bgRZkrqIi7Bhp6KHTf2lOfq/I87PFY5kxw07vwkUwc/I/V1RHvCtZubRs3FuZzVWmzCT1VJBQwhqvHsplv/h+gwGsEe8YMqhLlWwNsnar5F978pDQNZlSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqZhNiPjMQ9exFQprliwhL+k28JURfjpNcXwVQ8eS+k=;
 b=DDNEoWTbr1GJkdIs6B4/qIBHvWyNqrNQRIwe69Lsm7UlJLeOm5lqA9fTVAMJS7ai10st2syKqAc5GsmIWrM1mAXxHfo/1dnkEQggH/3VxuFmd2Dn5ge/9xVUbpjYhApCtxeraMqwUa2YFuhnr64Ep+yhWrklUkdr5N87MCC/rCH4Jn5yWxSisviMwMuaVXPtMKbNJA9rhSQXcTh3VHi0eN2/J7KZE9iPU2nuUacAoWZFTiE9XIaj8XSvWiPx11VQ7lksVHoOvRXn/G719vf7hZCXWfggxfZtjzv0w9bW7SOF82SJW1r10rQ+6ER9QPSxcRSPlmS42Fe6itaeSWHb7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqZhNiPjMQ9exFQprliwhL+k28JURfjpNcXwVQ8eS+k=;
 b=mHzmGst6MjysakfVoJR6+npuclIC9DEW1Qj52YXbgAY+wxwsm7inw152PNsSc+P0GitLe3u25Xv0E+6IUoYfc3T7AM3ZJ6QAKY8BLBMfk0oX7CwxlEJOehd+WjxAx8AeSoSY3p/nXenAMX6Rk8MjQMvhSYndFeKu/v2TJVrc+yfVfNpPHOtbOr27O4JL822Jut7kq5WcluHy6dwOuWF93YrUghg92nfaOeUQ72dbtrXr0eWOEMBy8UV16wmqy3dWoxk9JUBUFqELFZ/mh0n7a336tn9ZUBdujyF2LJpMpg3nDrjHHJR14JgOOoLE7Drjdio9ZWE2WKRfktSHoqcRzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by DUZPR04MB9794.eurprd04.prod.outlook.com (2603:10a6:10:4e0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 09:44:37 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::6c14:307b:6fd3:3bfc]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::6c14:307b:6fd3:3bfc%7]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 09:44:37 +0000
Message-ID: <0dc2e12d-052f-aa59-07df-5158b924ec12@suse.com>
Date:   Tue, 23 May 2023 11:44:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: USB 2.0 host controller for Thunderbolt 4
To:     =?UTF-8?Q?Tomasz_Mo=c5=84?= <tomasz.mon@nordicsemi.no>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        linux-usb@vger.kernel.org
References: <bd807b391dec726401e36a25f8c8987571d771be.camel@nordicsemi.no>
Content-Language: en-US
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <bd807b391dec726401e36a25f8c8987571d771be.camel@nordicsemi.no>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::27) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|DUZPR04MB9794:EE_
X-MS-Office365-Filtering-Correlation-Id: 853d9f5d-1b1e-4639-ee77-08db5b72522c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3VUVIRl5DLEZZ4i/6GQPKSYHJA7e6rRCe2VPljNrCd8abTpFJ9Ypbna+oY7tIu9vQAwlc3iyesYsTlcbdlpnm6t8mEi+vFEGIE0RioNCi4J0fiyErix1prst4VuFfCnItqWnYQvkhbGS/qe9banR5SE1pRoi2cQ5eytqvBrq4Hvq7vWtED/UX6XOultZeFvy8huWGv4Vzeoo41YLRTKg/DEu3E2iw3ES0zmsKAD0l+F3fKAW+h4sIto4aroWf8MYXW51PpZ6yRmfl+5wtrVfuLSVNZyWl1NrExnEAWvUODPxmUKZNSMe7lf+nDjVgiFSWQRUTOwCokKiuu/XoankpjoyuLaGFU+CwKGaf6hiSW1Ud/31NTfPiXHHD7ANu8Sfqe+cxKCSQbyMAbdXECd3LlETqlyzRCC5PYqLvo/hmflo08VVC6qEO4nqfvxT8J1sTb1BcNbQtjQxbUR0KS0Whbo0f+p1ENQoB40KRAM+Dsxd7MhN2xhR3/9yI3vMhTAW0lF4yLN/FSYtMi1XoM3pTCn+TdlW4gU3kOL5QyM9SVJAdESvMCibV8iMU12Ebj3B/SA6kp8ZhYFTzVxtBx1lzeuv9bu4Cd9SyvlUsMROhccDgqfFs7Td55W7P4BKO+r0ETwliq/B71SF4z2jqjnPUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(346002)(396003)(366004)(136003)(451199021)(186003)(4744005)(6512007)(6506007)(53546011)(38100700002)(2906002)(2616005)(36756003)(316002)(6666004)(86362001)(66946007)(66556008)(66476007)(41300700001)(6486002)(110136005)(31686004)(478600001)(31696002)(8936002)(8676002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1ZHMFlZVDlhNS9tcTljWGgwL1NQQVpJVnFPL3FlTHR6dGx0ZHVYMW5xRlJv?=
 =?utf-8?B?YmRXSHRLSkxDSUI1bDdzOGlNcHFJVDBJYnp6V0dsbmxzK2dtbW5XTldkWFo5?=
 =?utf-8?B?QSt2SmtjVHV3WHJ5WGUxMi9FcDdlYXhFM3dEOW9ycHhNQnRLNmFqN1RVdk9V?=
 =?utf-8?B?OEI0dkFPZ1pWQW5wTm5UZGZQNUhHbDAxTzVVMTFqTWJBc2IvMjlrakJ3aDFC?=
 =?utf-8?B?cFArYmlQbm4xdnEvWUN5NkxraEIvKzhnd3d2MkFwc2tScjlLRmphWGh5VDk0?=
 =?utf-8?B?Nk5mcVdXQjFyUXAweXYrb1FzZGc5aWpxTEkyTVE4M211ZFlWV0JtdlZhaExS?=
 =?utf-8?B?NFh5aTUzaVhBVFRtZU1hYjZxSzJiTHJmYUJWZHNMU3JOSmN0YllVUUphblN0?=
 =?utf-8?B?NlpwMXNiN1ZWdXZYbVNUMUJKYUdkQnpHaVZKS2tuM1VCOElQblhENzRDTytJ?=
 =?utf-8?B?cWV6cHlZWWJXYWhkbXk5WVRncFExQ0x3UTF2OWc5R2lhVkNqc0dWRHhEcGY5?=
 =?utf-8?B?cjA3cWpPd1ZxTUY2NE13OFk5a1dIK1JJSDNhbGdoemZBR2xWZ2NpVXdLa2hi?=
 =?utf-8?B?QUpZWll6NlJkRm9tbFJTUXhyRmdMWG9kM2dFc3RxcUtKMUp4SW9DNm4wSmd3?=
 =?utf-8?B?R0hwZEVqaFM0Q0F2anJzNGJkY09aanFpTUJMRDU2V0VKa3RTNm4zdXFzY3RC?=
 =?utf-8?B?ZWZaRXNSWndFejdpWEoxdWdLMjVkcmo3bzRWNlBOeUJOKzh0SnlWTEtIZEdM?=
 =?utf-8?B?ZzRsV2pQSG0yRTUxemQ4elZyemh4dTZVSEVKMWZxWnBhQklYQW0vRDIrRTBh?=
 =?utf-8?B?M2JBNnhDZjFXb3JmYTVUZWZlNmllcGpSQ20rV1MxOG9pMjAzUUhzRndGbms0?=
 =?utf-8?B?WlFYRFZUNGZ3dXBwWHowdmJxRmsycXpTQUp1dUpIT0loSlF2Y0ZMb1M2RUY2?=
 =?utf-8?B?UWtvRWRwQWo0TFJmSURxVWI0TVRPYzFtTFloZmJEZDlDTGV1WFhsWm5DOXhG?=
 =?utf-8?B?dG43VVNmeGt0KzBHVWFxZWo3djY1WndPV3RMUGp4eGIrKzFIZHVBbjdMUjBp?=
 =?utf-8?B?VTBuaWJRNHl2U1d3enYyTjQ4WDdESE1YSmJzMDhDTjlTTFB0VnJQRWV2UW9S?=
 =?utf-8?B?TFoxZklxVkR2N3RDbmhEVSszQlVsbGQvUEZXRFZrd1VLYTVQQ3JabHhaMkFC?=
 =?utf-8?B?NmRmN3F0Z3IrKzZwWlQxRytMajB1N0ZIVyt1Vm4xRVFmSm1UMHFRRjhWdGpt?=
 =?utf-8?B?UU5ISjhOb1hZcnA1WEJZVWJoenlyTUY0VWRuNTZZMmhCWjZraEUvbkpFUnB2?=
 =?utf-8?B?U2s2bmNmby9NcEF6M0N5NTFkQzh5ZjhRa3NVWE81bjZFRjlOa3Bkb3BnYklI?=
 =?utf-8?B?TW5OdExUVTdYUFBqOTJzai95UTc3WW0wL3R1dXNLekYzVE9hN2NWajJCdjZ0?=
 =?utf-8?B?aFFJUk4ycVJyNTZzMG9ENlhnaXQxdG5GS3ZwbE51aERPOU5RaFJsZ0hPVjE4?=
 =?utf-8?B?cmJKUzdLYUJUaFZPZXBCMzVrenNBLy9obnRDRmxyWTVOMGI3blZrZXYrRHNV?=
 =?utf-8?B?ZFdXUEk2RnBjZlNnNEw4WTR1Qk11TVVjL3c4UTZUZVprYStxeVltUG9PSTFj?=
 =?utf-8?B?MnprN2JXOTIrKzVlQUwxVE1jUDZCZll1Qy9nbEk0bm9YSnBBendVVlFIcXJF?=
 =?utf-8?B?OHhramtwVjNiZk9rNktqK0lqeHdOcUc4Y0NOVWN0aklYTmRjVE1xb2dTZ0Yr?=
 =?utf-8?B?Rm5TU1BVV3R4TjdwYXQyR1JEYkNRcnJ3RThacS94L2cyeEgxdndQZkg5VHBO?=
 =?utf-8?B?bmgvTG1VMWxPMFBGcFI0ZlF6M0FhaCtzNTdaajg2UXE0UTIvWlo1VE9DY3kv?=
 =?utf-8?B?aDhhaWQ3OSt2VGF4T3k0bFJ5Y3pVN1l2bU9zcnQyaXV5QU5tcWhmVUhvam9K?=
 =?utf-8?B?U1I0a1VaVDU2OWdsQ293SWIwWk5DdVpVTUpGenZUTVdpUm5DK1RlL3pLL2Nk?=
 =?utf-8?B?NUlqalZ1VzhjRFBKcnBpZC91Y1Joc0FHLzd0bUJCL2E0SUVrWDNWSUFGNDRt?=
 =?utf-8?B?V1RjYW5iSm5FS1I1T0ZxQzNuaHpNYnpTYU4rbEtXTUxtSkxweDVnZVlRRDUx?=
 =?utf-8?B?OG1XNlhhdkRhOTQrMjV6ZlM1enZUNElWdnZiRHNsQUpyVHY2RldqU2x0cGNF?=
 =?utf-8?Q?fuYRFmXdPTkW3lAS6gDrmyg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 853d9f5d-1b1e-4639-ee77-08db5b72522c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 09:44:36.8674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZevcrYu0cYA9HQSIj4eSbPZi/UbXeKAkzGr70jkf7LasJV0sftio5JG1OjSw6TFDI5zglX5wOnaACLU1Tu2OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9794
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23.05.23 10:53, Tomasz Moń wrote:
> Hello,
> 
> Dell Latitude 5330 with 12th Gen Intel(R) Core(TM) i7-1265U contains
> following PCI devices:
>    * 8086:461e - Alder Lake-P Thunderbolt 4 USB Controller
>    * 8086:51ed - Alder Lake PCH USB 3.2 xHCI Host Controller
> 
> Thunderbolt 4 USB Controller initializes first and therefore following
> usb host controllers are registered:
>    * usb1 - USB 2.0 High-Speed
>    * usb2 - USB 3.2 Enhanced SuperSpeed
>    * usb3 - USB 2.0 High-Speed
>    * usb4 - USB 3.1 Enhanced SuperSpeed
> 
> When I connect SuperSpeed device directly to the Dell Latitude, it ends
> up on usb4. Low/Full/High-Speed devices end up on usb3 as expected.
> 
> When I connect Thunderbolt 3 dock, two new host controllers show up:
>    * usb5 - USB 2.0 High-Speed
>    * usb6 - USB 3.0 SuperSpeed

Could you provide lspci in that state?
AFAICT there is nothing that would prevent a vendor from putting
a PCI HC into a TB3 docking station.

	Regards
		Oliver
