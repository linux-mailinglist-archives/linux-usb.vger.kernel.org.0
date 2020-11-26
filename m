Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4702C5914
	for <lists+linux-usb@lfdr.de>; Thu, 26 Nov 2020 17:20:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391268AbgKZQSZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Nov 2020 11:18:25 -0500
Received: from mail-bn8nam11on2087.outbound.protection.outlook.com ([40.107.236.87]:26465
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390021AbgKZQSY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Nov 2020 11:18:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJ42OZKtga5DNTxFl5RwAH90kxt9skk+4uTI726lbXSA3jUpStacZ70hz6x0/cWpNr6RwmSzEAAhJNvTvUkvcR2mIPBrhAv9CpGAuKBNFlMYKza5qXkacOm4g3z0KaGSVIElaC9uqz6BWpCT5KZgoV/biqRwhmTg9MJZ7Rx2sbtGLVBY2q5KfDCwyAaEWTS/JZvgpTIm1KqxIQcQrbu7D5Lz7idCg+9ljt9xsr37NNf20E8MZ9kbgqV0OgOmwdSd1eub71vPwaaWc56O9ZuVYIGryzSDaG0KWam7ScvfLBr+e+7BIO8ZzFjhXCmG5KHGM6g+3djEhmAHn6oIE1Znfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Ugby92SxsRvO3tsMCagD8c4ZJu83SpmvFzZ29WRysc=;
 b=Dr0FYweSiBASslDrRkBQR9CyNiVzzo2Fbfvn8XFVTV9rlv7wePom3GnNcwAOXo/krfKYagwKYy4M0+WOE/q4ZKWckBUSlAKZqJ4GlD3jXrFt0WoPuAo4BI9Jmvm04k9Eil2R7p2BwNF0EeGQdn2IIYKW6HSsnOVRp/GlVYOnW9G/+tdnyc2giZWJi21luFgTE0t0gK0qUHWXLiN1V+t+lM1PuH9mVU2xiCtnDJOsrh8Hitfxbs1qP0hKi95Spev9ldPXIG6b+Yz+Y+H2MEY8BRIjN273p6wfc8B+Hkh7DJd9ae9c8OEcNRMNJd4AndMa9qXhZSOqn3ZuoTugeWpM7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Ugby92SxsRvO3tsMCagD8c4ZJu83SpmvFzZ29WRysc=;
 b=akUR25+0jXYWAutBle74BXK6rHwQOFUzdXOV9pmPi3EmAqzqBv6JR71VuLYiGiIQx75vuvsa8H8uqvwWMtsykg0RjdC/QgQPUqLmgq+uUlhI/CL+c53lPz8z1WxeocCEiqde1pK0ex3/uHeIUj0B45VoNMd5FlABrNM0gvrc6nU=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BN6PR1201MB2467.namprd12.prod.outlook.com (2603:10b6:404:a7::8)
 by BN6PR12MB1780.namprd12.prod.outlook.com (2603:10b6:404:107::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.29; Thu, 26 Nov
 2020 16:18:21 +0000
Received: from BN6PR1201MB2467.namprd12.prod.outlook.com
 ([fe80::9921:3410:274b:3d17]) by BN6PR1201MB2467.namprd12.prod.outlook.com
 ([fe80::9921:3410:274b:3d17%8]) with mapi id 15.20.3589.030; Thu, 26 Nov 2020
 16:18:21 +0000
Subject: Re: Display Alt mode with TPS6598x driver
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     harry.wentland@amd.com, linux-usb@vger.kernel.org,
        Sandeep Singh <Sandeep.Singh@amd.com>
References: <bf85cdbb-23a1-107d-4e7b-679506810248@amd.com>
 <20201126121713.GO1008337@kuha.fi.intel.com>
From:   "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Message-ID: <66455900-df95-5cc9-57a1-d601a5fa1cab@amd.com>
Date:   Thu, 26 Nov 2020 21:48:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
In-Reply-To: <20201126121713.GO1008337@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [165.204.159.242]
X-ClientProxiedBy: BM1PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1::29) To BN6PR1201MB2467.namprd12.prod.outlook.com
 (2603:10b6:404:a7::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.88.77] (165.204.159.242) by BM1PR01CA0089.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Thu, 26 Nov 2020 16:18:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 221858fb-ee34-47c5-7bd0-08d89226e455
X-MS-TrafficTypeDiagnostic: BN6PR12MB1780:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR12MB1780CCA4DEB48494037B4F0EA0F90@BN6PR12MB1780.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ITD6l5jt7kO/rkTW1cvBFrzPAX69jmahnArJZ1r4IX9hXJuxVeZMqoj8w34sj5YQYE4mNNX8AAqM9Dg3HQ3YW26OwLIzfzyoXOQduVZ8BHVSEl12Td/Yptmes0m8lRm/25jNSfTV8PRVGdK90JYLBZ3fg6M6D86NG3ak71sWZpWS3RTOenYxq1z1XrinR9K19Qgc/oWZzeM0ea3mM6Ti5RuzLONlasLUnzpKtdlPlfBpodIT+7Uvqd7GCCelVqLTnPpdJovR1izWF35cusEOYBKAEFVxEJPPvj/+8YLL/edpHySzeg4VYKltxW7n25+Ym/56IpguqDckSXGGE4vRRU5BcodUPyRxprSP1tcSEHSi8cj43FxwIr3e4P05qz3C
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR1201MB2467.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(316002)(6916009)(6486002)(36756003)(5660300002)(186003)(16576012)(26005)(16526019)(86362001)(52116002)(31696002)(4744005)(956004)(66946007)(2616005)(66556008)(31686004)(66476007)(6666004)(2906002)(53546011)(4326008)(8936002)(478600001)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WDkwSFRFWkhqRkZxeGlvMW04L3l3SXJHcmtZSnZ1NjNuS0FldWhhTzdSVzBv?=
 =?utf-8?B?YkhDRVUxdmNhQ1ArSFNhK1QzdnpQT0UrV2Y3RVRFamNJM1NEUGdOMVpPRDdU?=
 =?utf-8?B?bDdSYjRLTjgydmZwcUFqL3J2NmdlU0V5WmhwV1NRUzRINURRemRqRDFEL0gx?=
 =?utf-8?B?OWZycm55c3hmaXR2S2ZyS3RPc3NYbjZGdkcvUDR3QUpKd1NZZnRoMWZqUmdl?=
 =?utf-8?B?TDcrR1BESkNZZkNEK2N0aWxkSHNRWkVWUHFSRTdrZjEzaTdOdGRYT2E5Z1A4?=
 =?utf-8?B?NEpxaDVhWjQwUU0xa0g4M2IrUW1vSnNqY1RENExrbStkd0pENUUvczNFUUc4?=
 =?utf-8?B?WDBvMmpTUnJMTkhiMWZGcFVwR05xZElhRHNYaUhTeVhTQThFUVFER2RmQnRv?=
 =?utf-8?B?QVBqbkNsb1ExUlVqV2hsVXU1eDArQXRVVzkvcXcrajZkYjhyMlI2cmVGUmJ4?=
 =?utf-8?B?K1lWTUZ3R05zd2hMQ3AvS21oT1VRcjZKK3ZnZlA0Y0IyZlVJK3ZCdlVaMG5y?=
 =?utf-8?B?NlhCZXNZQTg2dmt1OHVDVmJ2TzZYZjlMMmZQdy9YZFFzN1lpSDVvdWFrSTZo?=
 =?utf-8?B?Y0kvYjBBeFFTcUdYZmJFM09zSTBGa3VBWk5nalYrckZNZ00vR09ncXc1OGVw?=
 =?utf-8?B?VUdzWlhwUHowSEVpQzFpSURTaUdpdUY0YTAvL1hCWGkyazB0aVAxeGY3QzJl?=
 =?utf-8?B?VytoWW1yZTVLZWdQejYyVHlrN3BJTW05WkxnN2txVWVLWVhSOWd6VVFkTHdO?=
 =?utf-8?B?MXBiVFlnYklxSHVibVRhaDZpRUxVSUlIbFJQSGVOSmRWMnFkTUtOMHJqMlFp?=
 =?utf-8?B?L29CMTAybU5rSXMzV3Z5QVRibjBWKzhkd2RiYUwrU0JwRUg5T010R1hZc01o?=
 =?utf-8?B?eE1TR0M2SGhJd1cxU1gxQWRybDdaaXZka3BwTTF0N01KR0RqSS9jbHFKRTFN?=
 =?utf-8?B?TXhnMTh2SFZHYXFtb3ZucmsxYkppYjdNRnZCelkyTXEwRnBPVlFIS1Y5MUo2?=
 =?utf-8?B?RkROempQaVJac0VQdmlZT3JQbTMySTFRNDNLS3hRWWdXQ0F5RDZ5SkJPbSsw?=
 =?utf-8?B?K2hWdWZ6a3ZaV1k4ZGg5ZTNyc1A0bXFiR2FXa20rNVVWcDd4bjlFTjloRy9T?=
 =?utf-8?B?RVlFK2dBaUg5WnV4UDNnL3pMM3JBYTIvQjF5dWFLemxjZnRLcEFlNFQ0b0Y5?=
 =?utf-8?B?d3BjblhkZUNYdkc5QnVxNUV2cHJhK1BibjgzOVJYaEpBL08xZWh3N1hSZzcr?=
 =?utf-8?B?K2hVeVpteDJPNG0rZGxhL0dSZ1JEcTNOUUJNbDliajNNdUIvVTBKTjJZZHhj?=
 =?utf-8?Q?x/L/mUFj8PXS6eA5lZQXcYCjbf4EHU9U9+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 221858fb-ee34-47c5-7bd0-08d89226e455
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1201MB2467.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2020 16:18:21.3963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0J70mlRk60iDP3WZMWYKaiJlsnWYO71PIapBR/AT2CN4pivEv9LsN0MDngfr3p7u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1780
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

On 11/26/2020 5:47 PM, Heikki Krogerus wrote:
> On Wed, Nov 25, 2020 at 08:51:24PM +0530, Shah, Nehal-bakulchandra wrote:
>> Hi Heikki,
>>
>> I am working on the project with PD controller as TPS6598x. The current
>> implementation of TPS6598x does not invoke display alt mode driver .
>>
>> Can you help me to understand how to achieve this?
> You should be able to get an idea how to achieve that for example by
> checking how we did it for UCSI: drivers/usb/typec/ucsi/displayport.c
>
> I think you should start by first only registering the alternate mode
> without any control. That way you should not need to deal with
> anything else except the DP SID Status register.
>
> After that we can add control as the next step.
>
> If you need more help, let me know.
>
> Br,

Thanks for the input. I will have a look.

regards

Nehal

