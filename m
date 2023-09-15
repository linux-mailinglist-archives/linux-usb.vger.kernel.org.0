Return-Path: <linux-usb+bounces-109-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D62467A14D8
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 06:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06ECC1C2090F
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 04:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24AA1FCF;
	Fri, 15 Sep 2023 04:38:49 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF14364
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 04:38:47 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57CD82720
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 21:38:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIgr6WqBlSXFcq5nrawhzrw6QiIxxKB5ecRNmq1QSQhW72da+11Duwg7L3QgoNsIWvVTo0B5+aHJNiEtdkwPTv8Pe2r9dsSkLYu00DmOm8YU3m7VpxZ4NwlLGyWCJZLyGM3ONL1kI/oBjPGbu6TZz+88RzvdbLhaN/V7KHjys26S3l7NlrwlxmMUoUaHNj0I+Bdf3v5RtZ2ROUxW8ho5L9xaMaJ3wnoLSAVewhiW06Itf1J4jYCCDCu3Vm7gEnsvQy+yh8flUgbrZRB+FlBKRlNeKmGPHTXRCwgPkc4jvw8V+MlU8BlJxh1zQk5rgCvLQnLehh4IPbw7x9ci1Q93RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Oj5QfYITVPzegjCA/VLCtFiP0NBfzH80j1a9i+f3SM=;
 b=T4LZFtJ9a979EWLHZK+MnovLiGNdSyReMp181v+EMY1p58zjnZPaHx5zXWyFZ9FSZSyMY5Rku74bl0whijQAd58ZNIp3yLCatNzIONAVFuPuRpD9J++xUuPNiEHlxIvxVimU3QD8+QJsX0yf3Wrqu/YSGUYUnibMk3bOO2YRbo7+xCQahkeErksdbh72IEDEP41NAzp/+XE3gZYsuNR3UDuqgTF6gHs5kX+dzemfCn3A6gR1gYYpGoUYweKBHCGsTPJaHoxpL0PpsW18GX6OUcvYeITie8qX2xU47N1WkMx1TPKg1SAdm+6G6HNucWWA88yb1HG8zKEGujV+e6t8Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Oj5QfYITVPzegjCA/VLCtFiP0NBfzH80j1a9i+f3SM=;
 b=TqlLBvBmtzo8ZifLRiMHa54Yo4T2Z6gGGBMF0/6KTRi/Gt8URIG3ZR6alKrNNpgcCnQ9P8qimPDFCqVYL6tP9ASI+ngHOM0UG/rYxmaisnZZq2geimnVRpZ0L/HIBzr7/IE/VOT4FfXp8al6NhM5DGPEY0ad7nfKwI+iAWYX7jQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW3PR12MB4426.namprd12.prod.outlook.com (2603:10b6:303:58::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Fri, 15 Sep
 2023 04:38:38 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::36f9:ffa7:c770:d146]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::36f9:ffa7:c770:d146%7]) with mapi id 15.20.6768.029; Fri, 15 Sep 2023
 04:38:37 +0000
Message-ID: <00dff98e-a990-4b55-82d6-62d4b7866d71@amd.com>
Date: Thu, 14 Sep 2023 23:38:35 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Handle RPM for xhci-pci
Content-Language: en-US
To: mathias.nyman@intel.com
References: <20230821065742.2924681-1-Basavaraj.Natikar@amd.com>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 gregkh@linuxfoundation.org, mika.westerberg@linux.intel.com,
 linux-usb@vger.kernel.org
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20230821065742.2924681-1-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0236.namprd04.prod.outlook.com
 (2603:10b6:806:127::31) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW3PR12MB4426:EE_
X-MS-Office365-Filtering-Correlation-Id: 67fa8f3d-9394-4a5e-c499-08dbb5a5a0bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y1HfUdFEaY4g8hwifu7U2bK1I39Mz1j8/n2LG5tLCvIYCExktVFkKhmBEqffHXvXiC65OHKjFyku9VT0+QPAmeQKTVdNt0BliAMYTgKXxj1bPL9ZJ301KB9wqvBF3MGPFpFQnb4ekmcJfzAPGE2o26i7SknFWWBNvVOFmhQUj56D4L9t1mJbe1hzzH8ZhnrQ9E1CUElkbsNd3PYO+VoZkGh/IE1M2yQY4+kFdtf4C7Y/MSWQjgLf+kv6uM7OabMZZxr5ZVUj6995EJWe+yTvwvfIKfaza2omqFiPhR6r9x/1/058q8nIlP4AvjwH8+dcVztXAMkLTCQUcFJ1mJLxkG28T2pYNWfhUpsPes0ZwsuJRnh9wafxoH9mETQULw4CMSt3QN6xS/X95iVc6QIVj0cauPrRq9xaKJpXQTBjsJe4nda8QJrljSfh1pcfX4qg9bE733gY9J2SWpkxM0ZATHgbshB7A95K/CmnJTQw2MxG5jR6RmK0JOtokoVPsqrbGIGntL6rTc76kZl3ybKUEtaMUxjeHUVw+zCJhGeunF43fZ1RsonDX8DRvdoKLAM5lGzVJoeYY4RUi/m6i+s57AkyKMGqVFjK3k3aVfif0pCSzy4uekFgWIbKMpXzGUC0tU7heBI1goEhnSJTonq9fA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(39860400002)(376002)(366004)(451199024)(1800799009)(186009)(6506007)(6486002)(36756003)(53546011)(31696002)(86362001)(26005)(66946007)(6512007)(2906002)(66556008)(83380400001)(38100700002)(478600001)(4744005)(2616005)(31686004)(44832011)(5660300002)(66476007)(316002)(6916009)(4326008)(8936002)(8676002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzVQTDFhQUpMeTkzNGgzZU9ycVpvUzZ6MWs3NWkxSTdIOGRCYnJkRUY5Qm1P?=
 =?utf-8?B?Uk5kbWVBTjJQOVVEcmNLRzlsaFBvTGVSSWFsNmxycXRXVDA2QU9ZK2VzdDNj?=
 =?utf-8?B?SHN6dDFIOC9VM2F5RXVqUi96dmE3TkF4WFlJOWNiZG1xdmY5OWV5Wm92VjZj?=
 =?utf-8?B?Y0oxVXlIb3FUc3lRVDJELzAvZEhiTjdNTWpmQXM4NDhmNGh5bUNOTG5NN2Zl?=
 =?utf-8?B?dmcxbURpNTRDcE9Dd2hCeWF5NWxBM2xLRjM3cERBaE4yZDYzQ1Jib0h5NVNG?=
 =?utf-8?B?Z05ZRjlaOWlvNWsveU9ycjhrUkM1ZjZkQldVOVp0N3lHRmZVT2ZJZVRRWlUw?=
 =?utf-8?B?ejQvMS9HVXREbEw3M2YzTXVuVjJNMG04WCtTMlZmazduRXZRUUZIS1hlZkZY?=
 =?utf-8?B?SERKV3VXUkYrdC91ZjdFb2k2RzJXUzIvRUkzYkhqQXJGNEdEYnVYMXFvU2Ir?=
 =?utf-8?B?VE9sVGh5WmpZNCtPd0RZWXR5UWdqOUpsaGVQUmZaY3poeEhLMTFzRm84UTBJ?=
 =?utf-8?B?R2dYWFBTaFR3cVdveDlJS0N4aVh3UEFxemY3UWFZZk52UUhxYmJ0aXVWVFdu?=
 =?utf-8?B?OEFoSFFkS2F2bjgwbm1xcXEzQk95RXlXeWFZUHMzZXNoMytFQldiQ3hGZ2VM?=
 =?utf-8?B?ZWZiMkZ3NHBpeVpjMnd5TTQ4OVlEdnhIelZxdDljVFNPQVRMUXNGZk1SbHZ2?=
 =?utf-8?B?UmVhZE1RY3lFTittaXdvR1VaRHo4ejd5bi9NU1RJK082TmREeEI0L1Q2K3d6?=
 =?utf-8?B?enJadkJrbHRCbXFvOUV3d25PTHJFYVdGRXVMRklFTkxSNEFnUmgrNVRzQnJP?=
 =?utf-8?B?aXNlTTJQUzF3SjdGZERjOVdVOU5vRHdEZEx1Z1VqdDUwV2ZyM2VLMlVRNnhT?=
 =?utf-8?B?dWVtMUFmNE8rUEZCSnZaS3JyZTVVQS9kWVYrZkFOMjJIMGV3a0xuNjhmamVO?=
 =?utf-8?B?aHZ5c0kwRW1WaVh5dWM5eWxGZkhtZ0xQZzR2TjdvZk10NkZJOE1XTDUxZUNU?=
 =?utf-8?B?aEQvMU52TVM2L1RHQ0gxUG94MmwvN1FrUTlkZmc1QUg3SWRRUWQ2cWw1VnNW?=
 =?utf-8?B?T0JQZndZNC9OV3c0ZjlWUy80QlFQMUUxNnJ6UXZOOTVFZWFxSlMwR2xSMTIv?=
 =?utf-8?B?NmdYdWhLc3dKUTRkZm54dVhsc0NUcHczaTJhc2hmc1ZrY0hrL3dhOTFQSnVR?=
 =?utf-8?B?UU1hbmtLQkRiZjF5V1Rqdjdad3dXbzU2d1RZTytkeStCM1VQczFyQ2pQVHZa?=
 =?utf-8?B?bU13d0lueDA2ekF5TEs1ekFXcWxzM1BIclhXTGlQWk5yblRMbzZrc3hHVVM2?=
 =?utf-8?B?SmJwajJVVkVvZkp5N0R2MHlKaGZyY2dGNGFZcnFMK2NsRGxoOXQxbmVSL0Zu?=
 =?utf-8?B?RzY5bC9xSTFlZkdieVBGNzNNYmRQVkRTSHFSZm05WjkzSE1HZmZTaHRweTB1?=
 =?utf-8?B?TENKMlJCNzdGMEg2N0xGSk9QZnBLQjErbkZ4V1FQRWdLVFhsNDQzRWZQcnNm?=
 =?utf-8?B?MkZFa2hybDFJcEJTbXAvMHJ1ZFFzZVNacWNhd0NQOG1SeWNQd2I2cm0veWNo?=
 =?utf-8?B?ZVkzVXZicFFUalA1YklYQS93ZTZIdnlnSkkvMUgrMysvdG1ENEFsN0NsVENM?=
 =?utf-8?B?cnRzQ01Sd3gxUGlqdzRpSHFqUFQ3TEw2NmJ2S21ibExWc285cms0WHVtWW5t?=
 =?utf-8?B?RWhxMGMwaVlzZzlwKzFvNWFxVjl1UUpGMDM3MDZXSWhMRlBPVEUyR05oZDdy?=
 =?utf-8?B?UDI2NFdMYWJqdk5PTXF6ME8vUUU0M0drYUJYME5pN2dtTEVETlZsaUxKZDNS?=
 =?utf-8?B?dmJKVTFGQ3dpYUxGbkpkRFlrcDFkTkkycXlaWk5VZFYyYjhjMzBacmV0dy92?=
 =?utf-8?B?bTlFVTQ4ak9oTE1sdHhtdE9IMis0bi9CSVNNRWM3dUgxdE5ReU0wQnNxSU9C?=
 =?utf-8?B?WVlXRGJ6Rlc4L0NHTmtxZFYrWjNXcVNndkxWMEtubHBCWS9DaWl4OXpJbFo3?=
 =?utf-8?B?djkwNGJ4OUN1MFZpNnBneXhzeGNraTdQd0tNOUp3d2g5b1ZHbEhISUZvUFV1?=
 =?utf-8?B?WU1na3dhVXRmOHpZZmd0MlNSM2haN2k4a3Z4YVA3M2V5RDF1dG9qRlI0Mkc2?=
 =?utf-8?Q?O9zfVTjXPFvrQSGCmL19bmrAM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67fa8f3d-9394-4a5e-c499-08dbb5a5a0bb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 04:38:37.5919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bsRVdG2JjtaoFKbkm925Nw5e4woIzXXqDZNjP3PE47FtXqJKOz/RR/NvUZSbOOowxcBTXQRBG2NMZlJCk9UZhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4426
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
	autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 8/21/2023 01:57, Basavaraj Natikar wrote:
> This series includes fixes for PCI USB controllers that use RPM as their
> default policy, including enabling RPM for controllers that support
> low-power states.
> 
> Basavaraj Natikar (2):
>    xhci: Loosen RPM as default policy to cover xHC 1.1 as well
>    xhci: Enable RPM on controllers that support low-power states
> 
>   drivers/usb/host/xhci-pci.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 

Hi Matthias,

Can you take a look at this series?  It's been on the list about a month.

Thanks,

