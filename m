Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EBBC597E5F
	for <lists+linux-usb@lfdr.de>; Thu, 18 Aug 2022 08:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241678AbiHRGHZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Aug 2022 02:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240278AbiHRGHX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Aug 2022 02:07:23 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 755818B994
        for <linux-usb@vger.kernel.org>; Wed, 17 Aug 2022 23:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660802842; x=1692338842;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=p32GihUaCWUxqEf2LC92qQvOB6bilYpCXWhhDe+ijco=;
  b=EIT5dCinDoPCkqY/1OwTovsUVvmOLi0EjBVIyr5hwm1DPHvHVPJyBrl3
   Ud5kREI7y8y+7BmTA5ALJONp8Q5NeIbwjGjCgU3xP0egaVazenrO22fI3
   Q2cH57u4ns1crpfMKG9o/gKOsMnJeZZDATgU3EdQLyz6mUA2aDRxOPQXX
   adNEyUHCr0/aRh/7V7wRzpJomHsFzatCmSzsOlgkqEWHm37nfl8kT+mHl
   TZ6jVigLlyagj0MO4EDdVrz/1dM/bNQTs1ULil7Aj0fKJIWpTA5wNRiak
   JLUOLoQLO8aEy6Fb28TkK6obTzqLiqHpOuGXpP++vMzuleZAyjY4Eu2BW
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="279640261"
X-IronPort-AV: E=Sophos;i="5.93,245,1654585200"; 
   d="scan'208";a="279640261"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2022 23:07:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,245,1654585200"; 
   d="scan'208";a="607706161"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga002.jf.intel.com with ESMTP; 17 Aug 2022 23:07:21 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 17 Aug 2022 23:07:20 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 17 Aug 2022 23:07:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 17 Aug 2022 23:07:19 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Wed, 17 Aug 2022 23:07:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aDU1KR7kCJKa8p+MFMUYnvNclawqoTB5IN2V1qeAaxcd724oulXpPm1UJoGp3k/IH13MZlY3KOEzXEUPlhNKe0fq/j3P8ofimMCh84XEQUFtyaGVUltJmF0uVSfwh80gKtnwXPe8a3/Y/IC4oZ6BXDCtTT+lXSwQg05e0fu9rBpmaC5kcV/9dgzJEMjfL9jIRu2WO+AyccxvYNXkjiWrKpLsbPzovacEmzvyot4bNwetLYAh/I4+CnIpfNYU/2y0dTzERoAq0Sa8eG3SnkUkr9H4MccoF52uy8a4Ca8xXzerXVyHGsscXuwpphQsQjwDPg9Yz1isYzXnCTzszY6+sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcghrIbY996z3Odo62WW26fR/B1dWEaOWP94WwmPbds=;
 b=LafJ8+BXU8Xd/4fohaFtHSIdQhLzmALVJgjxthN6LDgXUTug6kfldHEgR1pz77T7BVmJidrvihMcjhvU8tCamdD8ufxvfC3epkhYHPL7pgF1raUofpVrnH4Qyim/ssjgxp59dkFokXcgB7ONFTjlnHcjzYFmspFBXUJ8Av9/VkRsZPtUVV59eClRhqy+gsKXppuYBdKc1rSgl9/5zwWjkifYKY1YAsqO4qAKpIB1coIzh7E2DpEq70JM9fYLDgUXw9SBWZtchh1GIHIAUxl+yhocPXipuLJOyr4UpqYuxn8gCVyyUnK129aq6cj8kYT9qL+77Zi6Jzk7TSYaRNlskA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB5933.namprd11.prod.outlook.com (2603:10b6:303:16a::15)
 by BN6PR11MB1490.namprd11.prod.outlook.com (2603:10b6:405:d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 18 Aug
 2022 06:07:18 +0000
Received: from MW4PR11MB5933.namprd11.prod.outlook.com
 ([fe80::5d19:fbdf:562:ac80]) by MW4PR11MB5933.namprd11.prod.outlook.com
 ([fe80::5d19:fbdf:562:ac80%6]) with mapi id 15.20.5525.010; Thu, 18 Aug 2022
 06:07:17 +0000
Message-ID: <8f500c8c-c0a1-7825-a70d-3c2690fee18b@intel.com>
Date:   Thu, 18 Aug 2022 14:07:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
Subject: Re: [USB] 3a2b1036e8: WARNING:possible_recursive_locking_detected
Content-Language: en-US
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <lkp@lists.01.org>,
        kernel test robot <lkp@intel.com>
References: <20220817070712.GA78093@inn2.lkp.intel.com>
 <113d66dd-b2b5-fa2e-fbd3-53c5a5666867@intel.com>
 <Yv1jFcPocWBkgL4v@rowland.harvard.edu>
From:   Yujie Liu <yujie.liu@intel.com>
In-Reply-To: <Yv1jFcPocWBkgL4v@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0121.apcprd02.prod.outlook.com
 (2603:1096:4:188::21) To MW4PR11MB5933.namprd11.prod.outlook.com
 (2603:10b6:303:16a::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92dac957-5e01-4357-2805-08da80dfe748
X-MS-TrafficTypeDiagnostic: BN6PR11MB1490:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K5x7ZnQfsnq3vUB/rOABBKaYP6yAkslXlDuuB2JdL8bnXac58xcMio0cpSqstlcrDrxnCAbILlKWCb/BGGb+3kjwP1HfbRSFjnQbaA/OSOMsJDA7uOFbPhOPhyh4VrKer4drYk3EWb3OCIzh1/BmjbYK0AaBf/mBGz2ruGAThKISw4NpRCBw27cv9RVyvsBXBIvnyEsMYSZWz2GqCSw3lUdxuAHLgR5UXaovOcKF1q1XiueRvPrPbf4xPSEhwebDCu+oBYgs5H612AOqsFrN5qroNll05z/LmPdv2Oiv4UbRHNTcUxnlfp7PuIqHnoz/jNOUiSYUrAMb/6iyOtZGn7+808Agimn4VNtNbRl0UhQyvCyr9/I8oblRuD1Ma9PwCd3GksdKsaI4poO57/Ht4G9OhUhes3KHFqZtyCWRGOOolcq9TPqG3j+iHAUNVFY5x/2kE0GYTW9n3bB4nGSBdUgFRW2Ms3tLz1B3fwXQTZdqb+xwXr7S4UzsalGGkB0f6FGATcKNzKoMrZwut1S2O+7iWINZLZ7uTS9snbJBP1ki6hXR02lfQEVhLru0YIjLKJscCnvn+bESrO7i1DELxb3tRh7NQlZX4H0hiHLVMRwPWOuWsEByC+wcWxKvW3FfKwoA5G9CUuDjegeVXVPImWrhWSMZkTqMrbLJ9I63zyjEnmyuAxOuu8dAQL6DpBLPGQUEtubCz7Hi/hacd1RFYO7u72OW4H1FMV+CkGY1lkhO7wp+aALNZSGKXgTkhk7qxWBMyC5SS5U4FOyNyLkbZDjNxGCUGBhYPga7ysMd17SvMAyv5PwQ9q0i34vHYaFlw3lfh66j1Hcn2EpX1+zV7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5933.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(396003)(346002)(376002)(39860400002)(6666004)(316002)(31696002)(478600001)(83380400001)(41300700001)(82960400001)(66946007)(6486002)(86362001)(66556008)(66476007)(8676002)(6916009)(4326008)(966005)(31686004)(107886003)(186003)(6512007)(26005)(38100700002)(44832011)(54906003)(8936002)(2906002)(6506007)(36756003)(2616005)(53546011)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW4vUzl0VFhRNFBOK1Q4L3pqUGJjWEZVWkZpbGY2NCt5Sk5OQ1N3RzBCMGxm?=
 =?utf-8?B?eitvOUdPemp6bVVvdyszYloyZ1k3ZldkelU4NXA5N1N0dldtMG1lTVQyenJp?=
 =?utf-8?B?RGZhWDBUUlhsTEtDRTJsODdvMi94bG52MXU4RDVITzFicnFYT1FxZGQrWkxD?=
 =?utf-8?B?ZjBBNlMxRUM1Vy9EbHhUcVdDOVlsb09hSUhkNFo3WGI3V3F0bEVjMFpidVRr?=
 =?utf-8?B?YVZ3eVdtWUhpTUN2RDZlSDk0UzRIRGlVMFRPeFlnNERDdUt4cE9JRVNmUUNO?=
 =?utf-8?B?WDhuNWRIazZsRW51ci8yeDhsV1FXeVJUNitBOVkzZE9xQ2lvdWtaRzdacUJm?=
 =?utf-8?B?UWJkS0JLR2lnWmREbWcxTjdUbGJkZnpOTUxBVEt4NUFXd29hd04yRTVpMjFy?=
 =?utf-8?B?VEh2d01PUkwwWVhBNURtajJBdmlJWXJydEFuWEEvR0tSMjloWFJFZURsWS9p?=
 =?utf-8?B?U2tDRVF1MFdhd3IzMCtqSTg2WDZENzFNb2tIQkxYVWIzS1ZjNlpxVGJOYmZi?=
 =?utf-8?B?NGF2YzRhT2lZTlBUd0FDd0k5ditUNXcyUU1SSUFOMXhJbUx5QnB3c2Rldksz?=
 =?utf-8?B?NGNXZnpVckFacjczWG5XVGtCV3VhR2dKYTJValhwMnhnS2JvTE9TRkRBWjZH?=
 =?utf-8?B?RUVYaXo5VWhWUnNiek9hRFNDOUkwWENlVDQ5TXpzcnNNRkFtcjQ3VkIxZ3M2?=
 =?utf-8?B?MEQ4YmJuaHJKMnkvSTFWUFJ6Wm5Ld2FWTFRCQVFGZ0pxWGFodm1zUkhRb29R?=
 =?utf-8?B?WkVCNXRsdTlnbkNlMUxGTXkrdUU4NWlsVDdHTk1OQnBMN3ZMQm9MazB3cWFk?=
 =?utf-8?B?d2EwMS9pU0VVTXI3WVdIMGRIYXhQZUlCdXRKempBWkRXZU45cmtZeCtUenNM?=
 =?utf-8?B?WFFLa1pkNFdmYlZqeFM4SGRnZUhLNkZoWTY1VjdhcmhTV0NqMkgzaE00T0tM?=
 =?utf-8?B?a3Y0UnN4ci9mSDdxbXQ2c0QyVFJ0SDAzSC9yM2FUei9rMi9Zb2JCYkJwYlgz?=
 =?utf-8?B?QmtrMFZKR0ZXUmlCc3NPbmxXZmpZbUNpc05xSTRuUEIyai8zQ0t5Q3JVUlpN?=
 =?utf-8?B?eHpMSDJRQkZwTDI0VjBNVmtZQ2FJSGdkcS92S1NEeThnUFpBT2Y1eCtERi9v?=
 =?utf-8?B?U1lBODNpSFZDK1Q4N2VydlFDYWd1ZWs1aXNOV2NYb2tkK2JFRThLZWZpMzNs?=
 =?utf-8?B?UndjSTlkWUYxaGJWQTV5K2g5bjBkaEhMK0tMeTRkNGV4bHUrTmwraXNQaGFE?=
 =?utf-8?B?aS9JcU52T2Y0UnRHUHowTGN2NUhTZkJaNFFaNVpNSXM5aloxZjh3Q2w2VkNJ?=
 =?utf-8?B?aVk4cGN2RnFMVHFMNlZHekxvRWx4WEJ5SmE0Nk5nUmdVV3k3RnY4eFNtUFBP?=
 =?utf-8?B?YjI2cVUvTTBSV2pJTjg0bmY0bFJNdWlkNW5QUyszS1NnSUZjVlB0bS95VEdE?=
 =?utf-8?B?N0xmbExuT01MOUg2L0ZWT21IOW9NRVhUM205VlduMmx2R29QOGhzcWc4OXJG?=
 =?utf-8?B?ZDZ2cDZncVdyc01DdXNmOFg1T3VCRURGQlhMeTZQcjRqK091RGRiblRVbHVz?=
 =?utf-8?B?VXJBZWwvZG1zOWNVMHFJbWFFU0xoS014Zzk5ZnVDYUxQazg2cVJKa2NMNjBK?=
 =?utf-8?B?aithZlNxNlIxdW00TWVNUVhEVUhUTkFnWUZHdm1VVC95TzVSOE9iNkJXTTIz?=
 =?utf-8?B?ZWtCNXB2Ny8zWFdzSnZuVUxpYXNBNGxGRjJOZVpyeEJob1FzOFRNdWF3QW9h?=
 =?utf-8?B?bmVIU0FodnA1NS9ZekNidk9XOXBVOGtXa1R0ajJlNTlXaGVKZGJaa2tIRXpT?=
 =?utf-8?B?L0l1aTJ4eitGSkFPRndhZmFRUjkyNWNnQzlVa21QbTdXWURlMHozMlNuc2Qy?=
 =?utf-8?B?QTkvOGpMUWpBUkJDcGZrQ1U3em9qaDkvZ084VFV6ZFl0bEUzOGJWcHJiUGQ0?=
 =?utf-8?B?UFdCSlRhQW5Ra0NLZUkzelhlR25GL2NFQ1RqZG13VFZIM3ZUdmVBRVNRVkxn?=
 =?utf-8?B?Z0RaOWd3SHFONFBueTRzd1o3UEt5ZGw0MW5PNVAvWmFmWWhSWFZqM093eXBT?=
 =?utf-8?B?VzdDZWhSSzN5OGk1QmhxdlNONWdoL3NoSE5BSmovSEMwMktFZFVDQmc5SUwy?=
 =?utf-8?Q?trmmcfYuz8uzXpxf5oHqS5p37?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92dac957-5e01-4357-2805-08da80dfe748
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5933.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 06:07:17.8934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KYdvInrt407E9rfl+PIIdr/blQHX7F8PvD+TNgoFf7E+CZq2WCrqh5cgbEqnir/73HeQJ7zhi++9xME7FLvJmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1490
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/18/2022 05:52, Alan Stern wrote:
> On Wed, Aug 17, 2022 at 04:43:01PM +0800, kernel test robot wrote:
>> Greeting,
>>
>> FYI, we noticed the following commit (built with gcc-11):
>>
>> commit: 3a2b1036e8951328b7e59517408897c700a74871 ("USB: gadget: Fix use-after-free Read in usb_udc_uevent()")
>> https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
> 
> How did you come by that combination?  The "USB: gadget: Fix
> use-after-free Read in usb_udc_uevent()" patch is not supposed to be
> applied to the 5.4.y kernel series.  It is only supposed to be applied
> to kernels which have [a backported version of] commit fc274c1e9973
> ("USB: gadget: Add a new bus for gadgets").
> 
> It's not surprising that you found an issue, applying that patch to a
> kernel where it doesn't belong.

We happened to catch a v5.4.211-rc1 patch series yesterday, and it does
include the "USB: gadget: Fix use-after-free Read in usb_udc_uevent()" patch.
But now the head of linux-stable-rc/linux-5.4.y branch has been rebased to
v5.4.210.


da19aaf18f551 Linux 5.4.211-rc1
...
3a2b1036e8951 USB: gadget: Fix use-after-free Read in usb_udc_uevent()
...
de0cd3ea700d1 (tag: v5.4.210, linux-stable-rc/linux-5.4.y) Linux 5.4.210


Looks like we have some delay when updating the latest state of this tree.
Sorry for this false report, we'll update our workflow to avoid similar
cases in the future.

Best Regards,
Yujie
