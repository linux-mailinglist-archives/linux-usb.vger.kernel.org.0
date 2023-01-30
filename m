Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A65C3680E88
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 14:09:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235938AbjA3NI6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 08:08:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236159AbjA3NIy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 08:08:54 -0500
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2044.outbound.protection.outlook.com [40.107.22.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 614B4366AC
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 05:08:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAkF6OQsHQzQZjddHE2Mh1sCNL+F5cdyJpNiQXjcjObg5H8wxEhOiV3cLT+ADbCdj1Lt6rPCvBRXrwSJKSWEmWTgvU6enql4BaTiqVPFrcW/rlO+Hx/8jdt/lQRSYOmmJxIAgWkPIVRij8OFfyD++jDGBZN20pFwbahZWKqSp/NVce3lYxHoc1ZdH/JxJuggOPvBZbRtHolmDQYovEZprLA+uSxPpKgP7aUvlA0mJMINHZbjPae8uT8x2RaAKv1xwoJlwmFZQCkys4l6UFwdqPmuBQUuQjVR0Csv/eYW34iBhAHtDWaAClirO1VzUvpsZpxs3BLgDQEstaoKifJa1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KN2uFLScp/2MBy4BP05ISB9FGVurhYTOy0h6xQfwKxg=;
 b=kNrOkLSQ+jXw3NKQoIkkUb41Ktfw5lIvZjwMnhWP9hSiTp/PT6ArwK9NJIOzcffxAjX9caMnpDYW+xPq156aLpsiH0afhsH+DZTEMz+iltTxjPrSpmqziWmUH0roXLbExlPxaTMjJq8szVGy1mo2a2KlEaI4F0y62BsKOrIanr5DTo3XHQCl2S37EHbvwFzbx5m9qBSilhUEl/oy0bLcOJVPOpcjx590a4A0xcTIq2TLRMvL2WR8RFfTXPpUNHIrbPftWoMaGr/BZWkNfFW0x6Qx2Itot7WHxdCXSD41sUP9Vr1qXkYYk2zi9y9PE1+/BRaLM4Wp+KmQuj2aJNMRKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KN2uFLScp/2MBy4BP05ISB9FGVurhYTOy0h6xQfwKxg=;
 b=YQN7vacMUAEm7ggEhSIi1auTaKzMC6CObnAPc4kyMfAZqc7txRW/mDEj++Ckhp/6SKpvDk0dXfCb6YBwAv49m+wd6Cn9+jMRxEv5AS5yR8EdatLkWueS7l2Iki05z6HU4H0ZVtpNtwwZz8hETORrWpriVixLSLSizEcFku7+SqLayaV9+rRZuaMhZdyQcC16l+XEOpGe1TG1GgfhFqv46X+1ThGIGuvDYfVFcQMdCygSfNEugavgVMotUjQuZM96tTGxj0vVxmeDLZoSoxxigMW09PQs5Tz1p3T4cOzLYbozeF/vQpNgeiQo9l11NaIVlDQPGEl2czg5bPMibx6baQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by AS4PR04MB9460.eurprd04.prod.outlook.com (2603:10a6:20b:4ec::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Mon, 30 Jan
 2023 13:08:43 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::2191:53f7:4a90:c7cc]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::2191:53f7:4a90:c7cc%4]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 13:08:43 +0000
Message-ID: <0db2a0a4-6ed4-fe06-217a-cb564f1d4a8c@suse.com>
Date:   Mon, 30 Jan 2023 14:08:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Cypress CDC ACM serial port not working correctly with
 autosuspend
Content-Language: en-US
To:     =?UTF-8?Q?Michael_La=c3=9f?= <bevan@bi-co.net>,
        linux-usb@vger.kernel.org
References: <8be9b56c6becd0981d1cd9c13742df6ba2975b56.camel@bi-co.net>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <8be9b56c6becd0981d1cd9c13742df6ba2975b56.camel@bi-co.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::19) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|AS4PR04MB9460:EE_
X-MS-Office365-Filtering-Correlation-Id: e9adad92-fddf-4ddc-5a88-08db02c31cc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DkTuasP6bpA2yf9TLaEPPAekTp5m+Son/+4M46TOFsVieQr48KzDoTTnE7/UUMJ7Oc7nkrp3kahxWInKg8v8Zm2W6LQFh3YhuurVuv0I/WxQ8IH1pu0b14S3mGVl2JOQ168AxWTzR3BxQMtENo8/dJOANyC4sAGkg6JjdFvANkCaq2ITmDjWaPAltzKBVuqDbdp/JFkJdJFb0M6MqV1meFAV7xEYh1LxnkQDicnOZeEMQPDwipTAeSoP8bsT3QEO34k/rvYB7ouKTKHrC8Ickdliewv/HCZXpzFyPPDstTtoTOt7Uk1xPOzNpF38+vokeDXJHmedylND13kcYwASucgThwKZY0Slhqskop6qGiQyMhqwZQMQB+QLX3HsaZPdYuGJY0l6LztbPAwo5B2S713n1F5Q8NLZUZCmUpAiSWgwIKSa/2tR/DrTvZDWUa3xmtGU7+NbNdXPrqEmFNA4kCJ0ydXXnOHurNWIX6vQ3QxB0O+kVKbhyGg+RSCZUhg+RTftIMTD7aOzbk8oucDKCk7ReHg358ry3dCM7e3HzAG3a48mL/6cxBi0g3c0XOFfvDBz1p684DwN/7g5p9qb3mKp2vtIQfKJsuiauvsItD6ERtvNxjwwIqifqbP2Rz++pdNJvFmu6ugMRYoAXanIVjZv5N5spn/km7QRQzgcBoMI1vwTV/FdrVwgUXveksig2y9BaFknwz1uEtuJg2B0QyEIcjMxen0oHuhzmMeC2is=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(136003)(376002)(346002)(396003)(451199018)(5660300002)(4744005)(8936002)(31686004)(41300700001)(2906002)(66946007)(66556008)(8676002)(316002)(66476007)(6486002)(478600001)(31696002)(6506007)(53546011)(6512007)(186003)(83380400001)(2616005)(86362001)(38100700002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjljY25seGo1b1FIRnBvWmY4WEZKY2p5QkJlNk9JMTc5UElSeWptS3Fsam1o?=
 =?utf-8?B?MTQvTkFqZCtmS3o3dEx2OVdYd0J0V1hmWTdPcXp0azFNQU5nNUdlZnVwek1o?=
 =?utf-8?B?NW56VnFEeE5DQ1ZLOTJET00wekNMMy9pRkdnTXljMWNZUHN6eGJIeUNxSUdw?=
 =?utf-8?B?Z1BVdlpxK1ZhL3V3NUtPMnp3Vk1PdkIwS1NOcTZPclovM3ZlY01ZNHcvUks3?=
 =?utf-8?B?RVVKaDNxY3dVMnQ5SHlaVEtURWVubGZKcFRlcUtkTGJGVnNLTG1rNVdlVUdQ?=
 =?utf-8?B?YUhtTmZMaGNGWTBjaFR6N2lBMXgvMW91Y25pTGxvbmc1RzhnMW5aZ0FqL0li?=
 =?utf-8?B?c1ZKbjdNd2twNVp5c0FDUjNISE9xbVZoaEpyeHJEMUxnZS82OC8vbWRUN1BL?=
 =?utf-8?B?R25ML3NMc2pUc3MvOWlFZ0tpUmhjRGtxdHhKSjdsUU9DcDAvNTBFdDFDaC9i?=
 =?utf-8?B?Rk9tSkVOQjBSNnhXaE1ybHFKS2VNZ1lORXAveSs3UHY4RGRyejBjdnpxaTZG?=
 =?utf-8?B?YlUrSElpcDZWb1Jja0RtQll2QWFrNUlLMkxZemRjbXRUc2M5Y3JQdUFYY0NV?=
 =?utf-8?B?QlVORlBhajl1UDMvK3h5ZnJ2V3ZiOXRYaW5qclc0dGlPNFJqdzJrc0srVlQy?=
 =?utf-8?B?Smh4bUZkdGtFQXQ3OHE1ZzhBaVVOU3c4VDF2UW94V3lKdjEreXdCVnk0NXZS?=
 =?utf-8?B?Z080YVQ1RTJjcmh4MzEyWG1QWThPbGppRkpFRmx2T0ppYy9icjZUUUJHcndR?=
 =?utf-8?B?QWQxeGw0d3V6YmN0eGZjRkVWbXFTNWFQeFBLZWFUei83Q3hSTEY0eDBTMGlv?=
 =?utf-8?B?SjlPMklYbEU5aUNPSVYva25DYlB5QWpZMlFzeDZHYUdmeUJRMmh5Kzg5SlFq?=
 =?utf-8?B?TDVLa0NWUVZYUlRPMWx6RkVCdmg2YmJWWE96aGVFaGUvcm9CUTZJUlo5eit5?=
 =?utf-8?B?aFl0WlNGZUM0WjhSV0drNEExbStKbVB6SHY5QUcxamx6NlVlTndDV1V5Z1ZD?=
 =?utf-8?B?emJPdEZuYmFya2tKTFl5R2g0bVRPaFhzN0JSSnk0aGFnNzAzSms5M0VITmkx?=
 =?utf-8?B?bGpPRW0xTnJZd0NJSjJuNlFGNlpna2djb1lGU090RlMxWThEdVpIWjNGWVEy?=
 =?utf-8?B?U0Q3TVlNSjZzUEEzeFNrYXZmMTJBQ3pmV1Vqb2cwRWdsRHhwenVjZFlQYnp4?=
 =?utf-8?B?MThVdUNNTXFGd1FwYm1kWmRxMmgrSzRhR0hMUnFRY2UzK1hBOW9xWDcxS29Z?=
 =?utf-8?B?Nkt2THBRVzlLOEx2VytvOGRCb2t4b0hPVlc2aEdTMzZEbVd4eFh2SFQ0ay9Q?=
 =?utf-8?B?ZkF6aTdNc0loU2gxWTA1cFV1UUJiaXdVREdiemFLbk43eG5UTlNZUUk3d0Zr?=
 =?utf-8?B?TjJHd01IanY1VkM1Vm1rbjhHQWRyNlpLVUgxUm5KT0VJcjI2YW1BUEo2UnF4?=
 =?utf-8?B?dkhrbE1SQmdvOXBIQ0dXc1lwWEFtZ1FxNnYzTlo0bFQvL0s1bTZwb1NDb2Nq?=
 =?utf-8?B?SXJBNE1TYmlVVEJhL0M1dEwyOXFkc0kzQncxLyszc1dwamtFR3kyTTQ3UVEr?=
 =?utf-8?B?dTRZV1EwVUw2b1ZveS9tOCsvempRRlE0ZTlMWHFlLzVidjR5QjFMVTk2NVdY?=
 =?utf-8?B?Z2FQaHA2VWJwbGRRRHBYOFh2ZlN4dEZWY09oWmhqb2FzcnQwWkUvWGZvTnpi?=
 =?utf-8?B?MFJITi9JUjlRSWlNTnNSR2hjRG1xVTlZd1ptaDRNMERVMENpUmRUbzJqR0w4?=
 =?utf-8?B?dFJyK3lLbDMxZFVpTDRORE1SNGNnUmZMRElFOHg2RHVKZ3NHM04zdnNVazRV?=
 =?utf-8?B?TjBWaXp2cDB2K0dKb0phNkpFa2gwK3ZvVE1iL3Y4M3lrTDBUREVIWmdrak0v?=
 =?utf-8?B?bFZ4MlBOZXhUdnIzV2NVb0FWbmhOT3RjZTNQK3BGL1hmWDNJckpHcnU1aWE0?=
 =?utf-8?B?cHNqNVMwNGhFeWxTVzZkZ3VCcFRFS3laSTRkdXRsZzI3YjNoRnJqQXpibDgy?=
 =?utf-8?B?Wkk5TlhmTmp1enNVWGpVZ2VVU2xtYzhCd3ltNlhGZExMeDE4SzhSVHhNWlE5?=
 =?utf-8?B?d01yS05nTlhwbjdHcFFPRnZhUU5zcG51ZVo3THZob1ZzMFlMa1BGVVRVZndk?=
 =?utf-8?B?cm1CQjJjVTdWYWpuYlVlUlR4VjJZYmdiQnphbWlxckhSeS9oREJoWjk3a3VJ?=
 =?utf-8?Q?IqTNmOywPDKSp2Hnt1QSua36cVK7jX8hQWwnPs1UP8h3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9adad92-fddf-4ddc-5a88-08db02c31cc2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 13:08:42.9465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQP3Qpdkxa00Q5uyrAUZYKX1rWksycZwhBtYXaPJFk6WyRYoTg1M2JyU4TBSJNhyl0/rbdHwRy/VMLhhtDdUtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9460
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 29.01.23 12:44, Michael Laß wrote:
> Hello,
> 
> I noticed an issue with the following USB to serial adapter when
> autosuspend is enabled for that device:
> 

Hi,

thinking about this further, it is possible that remote wakeup
is not properly processed. Could you test autosuspend with another
device, for example a mouse? It should wake up after an autosuspend
if you press a mouse button.

	Regards
		Oliver

