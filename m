Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1EC40A923
	for <lists+linux-usb@lfdr.de>; Tue, 14 Sep 2021 10:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbhINI3J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Sep 2021 04:29:09 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:24124 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229570AbhINI3I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Sep 2021 04:29:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1631608070;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=krmCVJZjPQ8Dq27dpi6VIbHRzpD4GHD8hO8m4U1pLLc=;
        b=RZMya5eRfCSFm7ccBZgJgDzPen0JeB7oCg0ckWOO1ijOueB3A6v1AYRzNjR014S5s1t830
        ZpPFSz7gOdRNJkKeLvp4FDG19g3oOWMaEWhTj0nDI6rYyY6jHF4dHqUonypZOJ2HnLhTPx
        8JbBev5kP/d+z3g5l7tT7OxEqfpPOwg=
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-ndbRk2T2PSaju7ruEQMfdg-1;
 Tue, 14 Sep 2021 10:27:49 +0200
X-MC-Unique: ndbRk2T2PSaju7ruEQMfdg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wju+LIm7fqvsRglwPjAch0pBauCdkQVcAxTmG1SqEQ63EkcwNdlbG1D2t3MZZBsK8R7K4xRTf+PXg+MCq4UfkVpNlALeyt58mMRyfUiwJa0x6EEojkUQ3QiXZxVe6WbLB/eP6gynT+tdgO2RVcXSU/xJpGv11bUxnP9lBYJ1nbnr1e+uQkgzcUkT5Ennl34rT5KPtUmrF7YiV59qUpu7jnFSjnPN1HehD0conIPsT/rxmBPElVLkH4YaATqxOAtkI+Ut71nhST9460OxuQ5r4+Rvfx+Ln0ZBFc5A+8gRe+jnyL6tPNzKdqzBE59KQxy2Dt8Kx8DF6J/ONfIryq6rtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=krmCVJZjPQ8Dq27dpi6VIbHRzpD4GHD8hO8m4U1pLLc=;
 b=SLPjI2wKjhoX+FIZk44iLq7WaVgeovLWzpgLjWu/2w5AosBvEgs4vMVVXXZUV7qrK/WYdLuUw/eXWUEX42BRIDi5TG6VueXx77L6uZZvtYFQ5yqVc3Qig09rtCwgyf1XqmKe+fENOkhLHazGzISjfJu6fThWxOdv3E+OT4b1u4Kq0X41NfG823CoBlc9RKZqsr74XyquYwkfdpTvFerLm3KqeySsCq8HgCBne89VLrDnAkHV6XdGtAf5G32CtpP1QmrNfNMCZzjNEhrfD4ouZVr1DDgQxVYZxBgqMUULtdABp6X2BQBRMg2vInBi7pSKThSKZ72i0uGgALAXI7YxfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DB7PR04MB3978.eurprd04.prod.outlook.com (2603:10a6:5:1a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Tue, 14 Sep
 2021 08:27:47 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::4cc0:191d:5c04:8ede]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::4cc0:191d:5c04:8ede%7]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 08:27:47 +0000
Subject: Re: [PATCH] Re-enable UAS for LaCie Rugged USB3-FW with fk quirk
To:     Julian Sikorski <belegdol@gmail.com>, linux-usb@vger.kernel.org
Cc:     oneukum@suse.com, hdegoede@redhat.com,
        Julian Sikorski <belegdol+github@gmail.com>
References: <20210913181454.7365-1-belegdol+github@gmail.com>
From:   Oliver Neukum <oneukum@suse.com>
Message-ID: <5564c154-9283-b963-0ea5-b1c05d582db0@suse.com>
Date:   Tue, 14 Sep 2021 10:27:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210913181454.7365-1-belegdol+github@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PR3P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::16) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2001:a61:3b08:ea01:c97d:6ea4:dece:ad44) by PR3P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 08:27:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebe22369-97a2-45c8-d4a3-08d977598807
X-MS-TrafficTypeDiagnostic: DB7PR04MB3978:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB3978146B7B4118A19CAC1677C7DA9@DB7PR04MB3978.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:403;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7DXrXLH7ZB1unPN/en7vdLqWqU6jcyPH1zSmzid5HTxQtjslFK+ZwMSqOADox4kYYkwCQfIA6lm+efS+Rh2brDF0O2de2k8VKaTwBsvDOVMORQdmboXNXRKpBPF6X+KVl0hF/G6ofe6Ll82A2PYep2paZ1EfjMT1pPU1+agbE0QrM57NBNGaF7Mn6LpUruNvugXNm6zy0cXsOSrJQ7J68N7wUmcuI7aiN6OzAB11FOCCKqFqVaBKrPoqRcW2WF0cV2J+GAXgUikc5BvEg8nwFIGGfgrHflgv2o81zDdQB0s25e1+YRv5SXoYMfWkdOSQd/3HEqMwlTKXze0I9foJOWCYUfjjWbhQx07M+ekcXwP04dxij3GIkmkuhf7JKV8aFh6scw3xOrG4DI0X2dpOfaL14UXxgSJD/PsHGID65GjjhfMZLDOl0095SVmN2RgMfssJDvOf1K/HP+jmT5dKUvb0nmZ0E2GQEiEdQ+4c3QjT15iYhqibjNY8Z5OwlPbtqHcjMXYxACAjenH1xJ0AYghLLUwrXV7RmaUjmQe7Lfl7r+eJsukXsPR77Cf+mG4jt2FNYl1qrgkKKqzLBBI2+Dij5DNZprxoE8/gVaerMeujZMdtgCFDYQiv+X1f3maou9rWqFyCDYc3P9Mrw6L/012JWak5oU/Q+kxMd9QD90LMs4CuNl5ltcZ8DqPKwCSbOFGCBiflpbjCSBHvXaRYzPU4EpUAW4vLavM5LRuNWy9B5Dfi1dOEPc19qwW8xphYVAlyUjgFWonSxEW6xoT7d1K+nLwj6yf1/VaG4d0kOW17Hm8J6c8/Py3fT97T873B
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(39860400002)(396003)(376002)(366004)(136003)(346002)(31686004)(5660300002)(53546011)(66946007)(6506007)(6486002)(6512007)(36756003)(8936002)(66476007)(316002)(66556008)(86362001)(2906002)(8676002)(478600001)(186003)(38100700002)(4326008)(4744005)(2616005)(31696002)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjJiQm03SU40clQzNlZWMkdGS2ozM0ZNdWR6cWIwRWFYZ2d2YWFkWUh1VWFK?=
 =?utf-8?B?NXBjY1ZCcmRGNTlIR3NLWWNlclYvY2JDNlUvOUR5aTNBVlBUSW5oZDZFL2l1?=
 =?utf-8?B?dk50TngvK3dnOHlNWm9RckJhRThTY0xPRHhyNUNjTFBOclc1eEJVNHVidmVa?=
 =?utf-8?B?ME8zdnlvTkljWXcvdWVhbnIvdnBrSk0xODZHZ0xibEo0TFVUWi8zdHQ5WENw?=
 =?utf-8?B?UnB6ZlNkOTh1NklFbFdkQWlQNzMrZWg3R00yVlBRT1FES3V1TlUwQzZCeERE?=
 =?utf-8?B?WnlhVXFabXJRK0ovWWloN0ppSTlUSm9hTFZLcDBtbWE4eVphd2IwMS9CclFl?=
 =?utf-8?B?ZDZOeFcrMnUwWmwrL0JEQU9YWkx5UmZxSkUxR0FiTTF4UXQrcFJjd0dBcWdY?=
 =?utf-8?B?TytjOUVEMlVSYWpSbk1sSkxCUDU3T2JoTVNkdlczdzRJNzhPUE00aTl2VlNK?=
 =?utf-8?B?dVRGa0NDVWEvQmJtR3Nua3NEbWd5UVBvTGxnREFsdHBUdDZPc0lta21CL2lz?=
 =?utf-8?B?TGdCeVR0K24rRTJMN1h2SGtoWXUyUUNVTkRxUDBXSWJOTU93WWtacXh2RWND?=
 =?utf-8?B?TTJ4ZCtVS2U5MlFyTDFMMEFFT09yeTdzbVVMRFczMXV3M1VtY1QrWHg3eHpJ?=
 =?utf-8?B?dGlUc1NnNC9UY0pyYWJROFQwbjdPSENJN1dtdjVUVmlpcE5wZU1zV2NGdTVG?=
 =?utf-8?B?MkJyQ2hzdS9ZNU5GSVo3SmE4dCtWWmIxRmk3RjNKVHVwV282dTExR2xTNEFq?=
 =?utf-8?B?YlREblF0aXVobTBRelJacks3S3pkMVE3K3pvUXJHaS80YXZtUVJHWjZVSC9X?=
 =?utf-8?B?ZkVLM0VWYkJpb0hjem1uUTlGNCszRVVJNTJEN2lxN3hHMTduRmU4UzVLODF2?=
 =?utf-8?B?ZCtTOXFvbHNmY0Rtc284eE1uaVhEdmtWcFovZHhlVXdrOFVqK2tZT3h6Vmlq?=
 =?utf-8?B?RWZwREZTa3E2dG9aZ1RzeXBUN3V1Y012MmdhOVBoQWI5akJ4WDRTVWJBR1Z3?=
 =?utf-8?B?NTF5bWZDeEQybjRlcmpLWE5GMzV3QXZCMytOMDNyc2J3MDNZbjNCS0ZkM1Uv?=
 =?utf-8?B?RnREeUhXVVdtbmZ4b3hMOElwSDJlTVFsVzBGVnZYU0lMbzVzdytTRTNLb0Q4?=
 =?utf-8?B?c2E0SjBUcnlxMERNcEwxaU56SW1zaW9IQWNleFJnSStqWXZGVkxocUo4dWFs?=
 =?utf-8?B?MUlRK3U2ZUIvVzdJakdJdzhUYm01QlQ4WGZJaXJmaDZvVlZ0Vlo1QXFoOEY1?=
 =?utf-8?B?L2RVdEM4L0tHRE1PVzZiMVJaK2ZJcHBSRSthMWU0RTdWSkFlNDk2aDd4VDVY?=
 =?utf-8?B?K1pGQ3lqVEUwTEpLZzYrUTRIYzFiV3lvUTJMQU5xcldTSVZwa0VNcDNPMlFi?=
 =?utf-8?B?N2tvZEZLcXI5ek1pZENuRlExSW5mRC9FcFloRlZXbGZJZTBqTjRGNFUvemha?=
 =?utf-8?B?Zk50a0NZbnFKZUM5d1FkNUxiTmtEd3FiTk9YRU9OK1F0OWQwUjdFWUtWdEpK?=
 =?utf-8?B?Z0N4Ty9WbEdiOFZIR29JWTJwbFZJNmVyZTRwVXlmQTIyUFU1ZHczMjlmYjNV?=
 =?utf-8?B?U2ZzYkhZQjY5TWlGRDFZSFA0NE0rSGgzQXp0STZGZlhibmF3a1NacWJTY2JG?=
 =?utf-8?B?WU1DRC9xa24zMTFudjNVelBLK0hLZ0t6bTU1aE5RS0ZJZ1lLelIwNzhVZWFo?=
 =?utf-8?B?Yzh6ZHRNbFVnVDhZdDFmSzZsTFI3c1pYVE4zYkd0VUd1VEhpRGUzc0pmSDgr?=
 =?utf-8?B?dG42TnQwQzdoa2VvYmtuOFd1Zk15dEYxMHdGVENxT2Y1eGpVRmhKVTVDdEVo?=
 =?utf-8?B?VFZKcVhXV0pUZHV3dXZGc3RBU3p0bzYveVBxTnFubHlkMWRDN1UzVmJUU3pz?=
 =?utf-8?Q?GvqoGn2jLXVo0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe22369-97a2-45c8-d4a3-08d977598807
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 08:27:46.9284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d+FfAq7RXSiipNniDc4PE+n0j9WDriYxAWGqjrVykvcqyRvvLxi82udt0EbJ93W19vd6WO6TNoxMBZCDm3lDiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB3978
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 13.09.21 20:14, Julian Sikorski wrote:
> Further testing has revealed that LaCie Rugged USB3-FW does work with
> uas as long as US_FL_NO_REPORT_OPCODES and US_FL_NO_SAME are enabled.
>
> Signed-off-by: Julian Sikorski <belegdol+github@gmail.com>
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Link: https://lore.kernel.org/linux-usb/2167ea48-e273-a336-a4e0-10a4e883e75e@redhat.com/
Acked-by: Oliver Neukum <oneukum@suse.com>

