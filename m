Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0C8C2E418C
	for <lists+linux-usb@lfdr.de>; Mon, 28 Dec 2020 16:09:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440200AbgL1PIi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Dec 2020 10:08:38 -0500
Received: from mail-bn8nam11on2079.outbound.protection.outlook.com ([40.107.236.79]:12933
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2438632AbgL1OIR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 28 Dec 2020 09:08:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mVRuHCcweQDg3L8F6XpBfjsOngGrFb2vQkpiBOuFXBWbtBRZ7bX+LA2EGaHAf8/KUKL5FE6dqYp18xY4fMkZJuhe4xianDmHGD9XVQ3LR0bvvg04csdSvoB2qCZ6xfw+HHsxmAACR3EpspdIe9Wn/HLcDBr/XAGZjgU4XPdBwvaLZDWLZybJjjknctlrjY71JMm7LgDPRkdRss6VvCDuza5AIKv1pFz0fzpfz5br7Z24axN8bqpR6/wN1cyO8MkFK6LtvBtrnxI71y70SV2NdA0b6TEUtLPUnScSh8gZoALx/7HX8JT7HjMxN6DOaS+wF1zIyCfC1b6oygRaDmJIOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2GH0tEKg21aeK4frACZnkXsVqDcWI1DZ3q72Tt1XNw=;
 b=LHFqerjCumsQPUEslc3icH7JlMapMYLrdr4m/TzhpAC2xC0htKByOQRE8s8vfNgr+tYL2LPf9107boMu5rTbyJ6BDzAYIvNhBU83jEiKggwIeHzS7k2GM6xTAolfaljgKTdsehMhDyJbkRDyqMZXcsnm717E8fCWQMFJ0GawmyydIAi55bbTPm7tNmpxyp+UK2CKAmD0wTb5Town2b1cB4c8pZ54a5LZ/5McMsCX6zQfSCw+kzTz6wxEBgxgRPOYZzk/m9EgXWLJgQQnJn9vtqu+hBDZqh19mDkkkdVBtwnUnAmGmqF6QdMS8voBxOq66rTuypFDMQZcWOljaHXidA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2GH0tEKg21aeK4frACZnkXsVqDcWI1DZ3q72Tt1XNw=;
 b=AbBfRBuByRpVtva0fwTWIdGBw3qfjJyaB1MBhDH635HIEy+cmKs6+B+jof6hEhauilFgOGwVwcnXyHc43DdxTCFcrdFMGnX+EU97Kz/ngNFuPw6AUDv92g6FBIW0623qkQZ2Zrwab3lmjOX22gVTFo1/HxZZYUawDCW9fwVJfE4=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BN6PR1201MB2467.namprd12.prod.outlook.com (2603:10b6:404:a7::8)
 by BN8PR12MB2932.namprd12.prod.outlook.com (2603:10b6:408:96::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Mon, 28 Dec
 2020 14:07:23 +0000
Received: from BN6PR1201MB2467.namprd12.prod.outlook.com
 ([fe80::d942:b0a2:f2ad:a33d]) by BN6PR1201MB2467.namprd12.prod.outlook.com
 ([fe80::d942:b0a2:f2ad:a33d%5]) with mapi id 15.20.3700.031; Mon, 28 Dec 2020
 14:07:23 +0000
Subject: Re: Display Alt mode with TPS6598x driver
From:   "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     harry.wentland@amd.com, linux-usb@vger.kernel.org,
        Sandeep Singh <Sandeep.Singh@amd.com>
References: <bf85cdbb-23a1-107d-4e7b-679506810248@amd.com>
 <20201126121713.GO1008337@kuha.fi.intel.com>
 <66455900-df95-5cc9-57a1-d601a5fa1cab@amd.com>
Message-ID: <56bb0475-19a7-f31a-ff2d-23227e0c94ac@amd.com>
Date:   Mon, 28 Dec 2020 19:37:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <66455900-df95-5cc9-57a1-d601a5fa1cab@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [165.204.159.242]
X-ClientProxiedBy: MA1PR0101CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::26) To BN6PR1201MB2467.namprd12.prod.outlook.com
 (2603:10b6:404:a7::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.86.172] (165.204.159.242) by MA1PR0101CA0040.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:22::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend Transport; Mon, 28 Dec 2020 14:07:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ae72adc4-46db-46f2-479d-08d8ab39e618
X-MS-TrafficTypeDiagnostic: BN8PR12MB2932:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR12MB29326911680B7CD3A677B6EEA0D90@BN8PR12MB2932.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F8IHSM8UO9dB6ypzpvXfS7Xx5fjZoXbQtGHkG5EhFhwluRwOJLO7d/+RYGqnezbiEEDmUEBZz5p4rxVaAuyMdibyfnZbJJmu0VlMMn47ni2fAEI1v1NV5oOhdVEyqKJ15QixLsZBIBDuQSubsjexNO4aC9kbO9Q1CBQIyYmIuQymC+VTldfK2e5wNpIz9bNVdxiheNSV7LTgawze7HaWtI9Pp+77y8rP47+SaAWLQOs3lOfu26AMu9W4J3F+5zA5rYdF/6R5LHUiuQz0u+K4M6rqR9wM/kp568fv7mOMJu5JwMvoxZN3izVKpUr0JiYwE9AEz0vemimXMwIdRdbnbudcX2FVREFL/zgfn73Ns+wJzU3h/toTkkkO+B9Frv54gMhN2Iwr9SSFknlnyMQIO9O/Lf0Ql6eaSufSuu4sDcIW49SzFxe8wVP6UFKMgDdXGX//8PaWNin1AVznM53WG1xwXPPwgwD8Ex9lhrXc59c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR1201MB2467.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(366004)(136003)(39860400002)(16576012)(186003)(2616005)(6486002)(16526019)(26005)(31696002)(86362001)(66476007)(66946007)(5660300002)(956004)(2906002)(4326008)(6916009)(53546011)(8676002)(31686004)(66556008)(6666004)(478600001)(316002)(36756003)(8936002)(52116002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QkdscmNRUkFqaURhbk1ETHU3MGJpNXQxZ0Mxb29LeDFvekdwTXhpSFZ6VUNv?=
 =?utf-8?B?MzI0YkpQQStxQVllajFtTlVWT1NvOEFSbVA5cjVuejZKOEVTL1pGenpTS3Q5?=
 =?utf-8?B?eFJCdUJqd0w1K0FsQ1Y2QWV0TXVTaWNEaGFBZFVwVkdXK3RCa0d5VUplY0x2?=
 =?utf-8?B?dHNpb0JkUEhwcHgvaWtRNFZCV1lYRytLbVhxWkRDRGpJMGVpR0JtUHFPVW9t?=
 =?utf-8?B?UVdOVnFHWnNSVzhYdVEyM3dxK0U1dUEzY2ppMmxoUXVOWmhVcWI0TDl1bitF?=
 =?utf-8?B?Rmp1MUpjYjVKcGE4K1A4YzlkSFVCb01heTQ1SVR1VWJRZVlHMWlVcmVrbm1M?=
 =?utf-8?B?QmhGU0ZUbmxrd2dVWFk4eS8yQjc5cDFad1A1dzFXTUhGN2tjekx4ZXB2VlRu?=
 =?utf-8?B?MXBXeUJIYkYwZ0UxQlNIV3NqWjRaOEpqKzZFazNHWDYyVXRmU0NSTTdoeW5l?=
 =?utf-8?B?Z1FFSU1OMXRRb0QwUW41d09TNk9zMSt6Smx4VGYwU1Y2WXd5NkRUaG5yR29S?=
 =?utf-8?B?RVp6eEY2N29sZlNyNHorRE9ZS0V5SGorajlrV2I4cUpTZTg2M2x4ZkpaYXBG?=
 =?utf-8?B?Ump2TEdmSU9kUDN1cUJJSWVTZzFtbVlNU0tjUGNhYWJBbFNRcEpUQTJYTHRF?=
 =?utf-8?B?K292RS9Ua0wzMGZqekM4OEJqTkpkRHVQTGtFcG9Ud09OZ2FiT0xSM2Y2SmhE?=
 =?utf-8?B?aHRqaGN5RUZtTkp4KytlMnZzMU5iZFY4MGR4TU1jaGZnR3hWcy84LzlkN1FD?=
 =?utf-8?B?SFZQK1FqMzJqZnFZRDBqT2FtblY1clFjQjBoWmRGMmVLeDNzUnB6UDNocngz?=
 =?utf-8?B?U050RlpUUTZpQldxWEZEWHBrdWNzUmMyWlFkVVBnSFJsNkMvMjRsOGViR3dv?=
 =?utf-8?B?a2V6TTVjUzRvbmkxQVNOaUV6YVRMTUVad1FvVGlLekQ5bnVhU3M4cDU3Y0NL?=
 =?utf-8?B?TDJCMU1HTzEvZk11WFhneUxPUXAxK3VCYTR4MjAybkpZUmpHRm9ESGFRRWdY?=
 =?utf-8?B?b0lSRlJXeEc1TDdsOUdVR0ZNeUNhbmJUZFd0L1BUQ1Z6UmJPcXJkQXVPR2Fn?=
 =?utf-8?B?UGpEQkdJZlFWWkM0MEpuTnVGQjBEVzA3SVgrdEROemRxbEdXbjBxd3J2dmxF?=
 =?utf-8?B?Qk1XUTRMeTArNW9wOTY1czZRZEQ1dDVKREo2OHRDWnBMb2lnRlQ4UzBnS2Ny?=
 =?utf-8?B?ZmN4NE9sQTgrQVFVZU9sVm94SnF4TnRPYVRUV2tEbFlQTlFBL1dpZ3hjMTZB?=
 =?utf-8?B?c3Z1SEM0SVJnSExyd2ZrdWhicGRZR3djYmMxQkRyY3BTVWZoU2FQRzZoMldY?=
 =?utf-8?Q?hVbI6i0SN+RKhXE6m91Wj0DFWr/vne2T26?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1201MB2467.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2020 14:07:23.3392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: ae72adc4-46db-46f2-479d-08d8ab39e618
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cu5i9O8JIAEvlsBinjwuKlC/Sy9W9i77X/qaKjdF1CCn4n3hMyHCm57YU7ij6FG9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2932
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

On 11/26/2020 9:48 PM, Shah, Nehal-bakulchandra wrote:
> Hi Heikki,
>
> On 11/26/2020 5:47 PM, Heikki Krogerus wrote:
>> On Wed, Nov 25, 2020 at 08:51:24PM +0530, Shah, Nehal-bakulchandra wrote:
>>> Hi Heikki,
>>>
>>> I am working on the project with PD controller as TPS6598x. The current
>>> implementation of TPS6598x does not invoke display alt mode driver .
>>>
>>> Can you help me to understand how to achieve this?
>> You should be able to get an idea how to achieve that for example by
>> checking how we did it for UCSI: drivers/usb/typec/ucsi/displayport.c
>>
>> I think you should start by first only registering the alternate mode
>> without any control. That way you should not need to deal with
>> anything else except the DP SID Status register.
>>
>> After that we can add control as the next step.
>>
>> If you need more help, let me know.
>>
>> Br,
> Thanks for the input. I will have a look.
>
> regards
>
> Nehal

I am not able to understand who will trigger ucsi_displayport_exit ? for enter mode , i understood it goes through vdm statemachine. But how exit is getting triggered?.

Thanks

Nehal Shah

>
