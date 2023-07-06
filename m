Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 028C7749E1D
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jul 2023 15:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbjGFNtB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jul 2023 09:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjGFNs6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jul 2023 09:48:58 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2054.outbound.protection.outlook.com [40.107.96.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37F2E1990
        for <linux-usb@vger.kernel.org>; Thu,  6 Jul 2023 06:48:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=apZe5dqNknjIpZH0gmmn0iT70TlyrO7Nh9JXcTNJ3S447rogHW+EgBuJymCIviDeginC36ut+VgmPIFYKedO2L4npo3CIoXOLvFQ4xZWSaGEVjbXUfBNnqOZQfcZtH9kKeXhkeF3UQG779SVjNrLGWMealmL+nXRt4LHNLhaVvLSMGIRNLuAccVwuRBp+kh6ypxtRB5a8VjiejUScfEwCC0pNaO4lze5C5GxwoQIuMoiL/hJdk9udg41J3GDFzT3BJNC0zSxe6VPlD0iOV+7CtssFW5MpSOUH1NNf4JlRNofCs0y/CQxOmcxIs98VJia13ukzV+E45QKi4ktuztFvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKkuBiuiNMf+dAGWa5wjdh8InZyUXt5LHSYzu6kP7Dk=;
 b=GrSUAzg36TfwTHyFY2tRd+vaXFA2b/opF94kVh6ozzZqoNHDhaUHA9CLOeGQ+ZZlfS4YZrHKlNaNkjHJ1IzkAfXAwLSrtL8JtRkecejoj6P8nd36BCsUFHtcYNECCa2VBrctz0FUmmVYYnUfSXRVA1V+oC7tDDJvgLBrFK5TZXwSu1jURoOeW4RGDSxe/CoaaruJdqM7Cd6j90rcf1PMqDM8oj0WxwmxU0/26NA9J/CjwRlc4x4g6RRKuyPqA/k17GUvVuffTWP0k7NIFx4Emfa746/qp1nhS8vUeGSFDtsBf2nVRdc6bVeOiSqmBDxcjUptWgxjAGXEBsV/Php43w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKkuBiuiNMf+dAGWa5wjdh8InZyUXt5LHSYzu6kP7Dk=;
 b=BHsgGSscv7t/A/QlX/lFXUfP6eNNugadLZRDH3tqEIzz/lF5gb9WMuempjA3Q+KElUs2U6s8qaH27ita4zNOvqivg2tdkMxJndDEPnx+JFZGsqGM3+8Ig6JDvKWNP58YIQABv52SZbCNwD753T+kmpbjY8erRBN7coiQoOTBoSY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6326.namprd12.prod.outlook.com (2603:10b6:8:a3::15) by
 CH2PR12MB4168.namprd12.prod.outlook.com (2603:10b6:610:a8::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.24; Thu, 6 Jul 2023 13:48:53 +0000
Received: from DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::9e88:305c:5d24:2f0]) by DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::9e88:305c:5d24:2f0%6]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 13:48:53 +0000
Message-ID: <c1be3001-0df6-68e8-a024-3f0d6d8c37dc@amd.com>
Date:   Thu, 6 Jul 2023 19:18:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH Internal] thunderbolt: Remove enabling/disabling TMU based
 on CLx
Content-Language: en-US
From:   Sanjay R Mehta <sanmehta@amd.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Sanjay R Mehta <Sanju.Mehta@amd.com>, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, Sanath S <Sanath.S@amd.com>
References: <1687343842-17881-1-git-send-email-Sanju.Mehta@amd.com>
 <20230621111525.GL45886@black.fi.intel.com>
 <5fe10a65-4538-cdbd-a0a6-827f9445cee4@amd.com>
 <20230621125406.GM45886@black.fi.intel.com>
 <a1959444-9f9d-5a3e-65cf-abb681d8bc74@amd.com>
In-Reply-To: <a1959444-9f9d-5a3e-65cf-abb681d8bc74@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::13) To DM4PR12MB6326.namprd12.prod.outlook.com
 (2603:10b6:8:a3::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6326:EE_|CH2PR12MB4168:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e600ce4-566f-4719-b887-08db7e27bc15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mmpP+G1/txSJkrgZzRiunNOvf5Z1ooekGHVBKYECtlcg2thP2zyq+PH8Z5GTnNXJHB2WG3VE00Eh6WE5AQ/FPn1qOktk4+QOj3a/c5J4h1rt9vqgWmQ6IvS5PXbru3jf49v4wv/emtIISgN0lp1dFxVmLyihyiHhQPagnfqPc+nszvS/qMPrfHmmLXnuJQY6Ejl/7zBAwnavTW3KHHy8VFeGZgnWjVtD3rfLM4f3cWdeyK8nPLASD4V1RkMCHABrkEfD1pL/oQ0GEWbKS3a/D4y7s/sw/pDPLv9f7gfwI+mg5S2fRvesHtS2ueSXWJmlYfl5w2HEVekDYCgXg6yVx/F+GVhRXSEJwGhaUekKBy1gXWDVtbZZxufoKgamXFVXJSiTcxUfvleYfFsYGwG5htbW7+Eu/G8j5hDFnoWWKBwEpfi7mPQwH7AMbJYIVJJhAHEiym5CniaKIOWSahJcrziR4LDvyBvPO59hITBBXaGK5YoiIvNPzudn3894OwEchJXCVtE+nyoTWPrzBv5GSR7btBhkSTZ8UNXar4Q81lIcNdYw6yGPicoVWuZn8+0YSon8sVFvnqEg7C7i8fS5h7PoBYsuVE2EZq9ed/uZGXMA/v3rnD0KL0UaY9R3aBic32loieBxOW82LHanah+LPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(376002)(39860400002)(366004)(451199021)(8936002)(5660300002)(8676002)(66476007)(66556008)(66946007)(316002)(6916009)(4326008)(41300700001)(2906002)(54906003)(6486002)(6666004)(6512007)(2616005)(26005)(6506007)(186003)(53546011)(31686004)(478600001)(83380400001)(36756003)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU9zM0lKQ1RaQ21zRWl4WW1sQ2svVFVSeUhYTEZpWVZPZDlGRlluRkkzVU40?=
 =?utf-8?B?eXpma1c4QXRVZmI0U1JiWmlUOFBLTjdrdDU5OHExZG45QXhPanB3TDdUaDAv?=
 =?utf-8?B?UUlrbS82Y25CcloraUJLbTRyZTBZbXBUTjBwanllMjF2YkRqN012L01jcFE1?=
 =?utf-8?B?YnF5eFJSSUlvMHg0MFA1cGtESUxnMW1QRnFCekY0TXJpODlTZkR2bEQxTEps?=
 =?utf-8?B?eVNxQklCT3NRZVhBSjc5QjNKYXNTakQzWXhHNkdpSXBBcTR3ZEgzbHlocHlY?=
 =?utf-8?B?UHc1SVFyRHY2VDVIckhkeVdmQ3NMOGRIVVBWNlk4MVpwTVRzYUFydXhsbTkr?=
 =?utf-8?B?V0NWR3ZPN3RkazNKWkloekRnN1hXVjZTTG1wUkVPRUxPb0lNZVFmT2Q2OEhx?=
 =?utf-8?B?eWhaRG1manRGV0d5bkxlN0dlbUZqeE54SFpncmtoZEo3bUNFSjRXZVZqdlRq?=
 =?utf-8?B?N0NGVWhBbUxIWERxbHFYQ2Y4VUFHZ0t4dm5RZ2RnRWtDZVFjcDdkU29vQ0d1?=
 =?utf-8?B?ZVVvZjFtaFNXRkx3OGdGZWZZNTM1SllraGJOTE50MHAzWHlMOFBYMTcrVUJz?=
 =?utf-8?B?RzlIVWlVSmJ4TVFNZnhSSitKR2lLOGo0L2tFeTdYNnhkK1VKMDFCNUQ2SU41?=
 =?utf-8?B?L0l1KzVwR1pTa3M2RlovNC96NEsxcFI1ZktJVnZsYlhxTlBOMTQySEZKZlhj?=
 =?utf-8?B?STlBZDFhN0Y2dEpqZEliT0RhTFBicWtrVFNWb3V1NHlqR1JhVzZYWkU2dWI5?=
 =?utf-8?B?N0lqY1Z2R3NrNFh0THdrcFNzdTQwWXdYRXhYTndCUVdNaU9zOTNyZkoyd0lY?=
 =?utf-8?B?aFpJeDU2ODZPNzgxOWtVYjJ6VGVnVFlWSithZ3FEK0Q3aEY3eVQvRzliWmw1?=
 =?utf-8?B?UW92TEFPNVFSUDBpVlhZM3Rxb2Z3d3gyUjZ2UkgwVTI5OXB6S0ZhMU9vU2Mv?=
 =?utf-8?B?em5UV0ZMcUI0TzJWWG9oRmlqR0VHeDl3QjVWaEpHNlpGNGJpQXZkK1pjSWo2?=
 =?utf-8?B?M0hrQytWZVNpYWRGTEpkbFM2ZFlYY1JPU3Y1QjB2aHZHMm9HZ2VwSG94TXE2?=
 =?utf-8?B?NTNUZ1VJRHZGL3VQQmMwMEYrZHkyNkY4S1RJeTNhelVhWjVxSW5ISFpUaWU2?=
 =?utf-8?B?WFBMdGRRcUkzWnNwdE1zeHY3UStzMXg4QUxrWDZORkVlWFlGL2JINXI2bUlF?=
 =?utf-8?B?c0dVUk1zQjByb0U1cTcyUWtWSEJKYVRsNTk1VUNyQ2pnS1JBN2E0b3c2eXl2?=
 =?utf-8?B?RXRySlZLY1NSUFJ6aFhicFpMSkFLWm1FM1pZT0tnWElKcjJEakw1NG5KZ3ZN?=
 =?utf-8?B?bmFYNUNaUS9namxVbHQrZkExYnRFRlFkRVdkanpERU5oR3FPSzNlREhrQTBv?=
 =?utf-8?B?dlpDcGx2a0ZFN2t2ekluemVFNnNIeG41ZjNvR2FSTTloWTRIeGZEMnBYc2ov?=
 =?utf-8?B?WFgwajNGOE1pYnhuaWJXeDFVbGFrMG1XYjRKa2ZjWXZvdkxKZEtZb05oaldQ?=
 =?utf-8?B?L3YwRG5aNzEzQ2hMamFmR0NCSGVlbG43aUtXTUYyeWFwR0ppakNLc1FaOTF1?=
 =?utf-8?B?RDlucXhhZVlEYjRKclluWnYvcW1na0xjeEFlbHUvMzduSEsvUTJXV0YySnMy?=
 =?utf-8?B?ekZjcmltOXA0OW1DUHd2dkY4SUtMQmc2YlRiL0Zrc09raTNUc2c0ZWtmcGxG?=
 =?utf-8?B?R3k0dDl3dkE2WXhQQ0FNc1R3bWUwdWR3R0VqbjBveU9uSjlHMHNhcHE5N2NK?=
 =?utf-8?B?aGgxK2tiQ2VaSHUrSU5mMjEyMjkxYnBZMysybnl1MWprdmt1akJ2L3RJd0Vl?=
 =?utf-8?B?R0xXWWp2eWtpRGtVNGs5clRkWmFuWkYzWGo2Myt3RllqVDN3U1ZQTUdQaFdT?=
 =?utf-8?B?Tnh3K3JyWU9sNXhjRVYyZ0hhVm4wcjRNSjZteDh1UjQ4cWVIYkptczB2MTNJ?=
 =?utf-8?B?bC9RZ2xJV0V1Z1pwU1kweFZuMlNhZVgxQm11YTJPK3F3Um42aUp1bGVQR1hU?=
 =?utf-8?B?ajl2UW5rQ3prYlhwdFRVVkFOaDJraXdJSXIzVFc5S3dZRVZCSVJwakZuSlpV?=
 =?utf-8?B?dDAwdEFrVzc3UzBCU0kxNUJRYjV2RVBWbndVMjA4Q0owWXhQWTdBeFhaRndu?=
 =?utf-8?Q?/RDJcNOMJIHSxoBX6iKiKQUC+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e600ce4-566f-4719-b887-08db7e27bc15
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 13:48:53.1151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jpIM6/s8bLnvXFTbik3kX9bGIprILloxEa05yiWxBdImWIvcSHeAbCl7IUqwQJ3M70CLfEAroZdKaflGROpe1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4168
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 6/21/2023 9:37 PM, Sanjay R Mehta wrote:
> 
> 
> On 6/21/2023 6:24 PM, Mika Westerberg wrote:
>> On Wed, Jun 21, 2023 at 05:48:21PM +0530, Sanjay R Mehta wrote:
>>>
>>>
>>> On 6/21/2023 4:45 PM, Mika Westerberg wrote:
>>>> On Wed, Jun 21, 2023 at 05:37:22AM -0500, Sanjay R Mehta wrote:
>>>>> From: Sanath S <Sanath.S@amd.com>
>>>>>
>>>>> Since TMU is enabled by default on Intel SOCs for USB4 before Alpine
>>>>> Ridge, explicit enabling or disabling of TMU is not required.
>>>>>
>>>>> However, the current implementation of enabling or disabling TMU based
>>>>> on CLx state is inadequate as not all SOCs with CLx disabled have TMU
>>>>> enabled by default, such as AMD Yellow Carp and Pink Sardine.
>>>>>
>>>>> To address this, a quirk named "QUIRK_TMU_DEFAULT_ENABLED" is
>>>>> implemented to skip the enabling or disabling of TMU for SOCs where it
>>>>> is already enabled by default, such as Intel SOCs prior to Alpine Ridge.
>>>>
>>>> If it is enabled by default "enabling" it again should not be a problem.
>>>> Can you elaborate this more?
>>>
>>> Although that is correct, Mika, we are facing an issue of display
>>> flickering on Alpine Ridge and older device routers, from the second
>>> hotplug onwards. This issue arises as the TMU is enabled and disabled
>>> for each plug and unplug.
>>
>> Okay thanks for clarifying.
>>
>>> Upon reviewing the old code, it appears that this issue was already
>>> addressed with the following code block:
>>>
>>> /*
>>>  * No need to enable TMU on devices that don't support CLx since on
>>>  * these devices e.g. Alpine Ridge and earlier, the TMU mode HiFi
>>>  * bi-directional is enabled by default.
>>>  */
>>> if (!tb_switch_is_clx_supported(sw))
>>>         return 0;
>>>
>>>
>>> However, it seems that this code has been removed in recent changes, as
>>> the CLX-related code has been moved to a different file.
>>
>> Yes, I removed it because TMU code should not really be calling CLx
>> functions.
>>
>> However, we have in tb_enable_tmu() this:
>>
>> 	/* If it is already enabled in correct mode, don't touch it */
>> 	if (tb_switch_tmu_is_enabled(sw))
>> 		return 0;
>>
>> and tb_switch_tmu_init() reads the hardware state so this code should
>> basically leave TMU enabling untouched on Alpine Ridge for instance. I
>> wonder if you can try with the latest "next" branch and see if it works
>> there or you are already doing so?
>>
> Yes Mika, we have already verified with the latest thunderbolt/next
> branch. This patch is built on top of next branch.
> 
>>> Canonical has also reported this issue and has tested this patch that
>>> appears to resolve the issue..
>>
>> Right, however let's figure out if the problem is already solved with
>> the recent code as above or if not why it does not work as expected. I
>> don't really think we want to add any quirks for this because even in
>> the USB4 spec the TMU of TBT3 devices is expected to be enabled already
>> so this is expected functionality and the driver should be doing the
>> right thing here.
> 
> Agree. we will have to see what is going wrong in this case.

Hi Mika,

When an unplug event occurs, the TMU is disabled by configuring the
TSPacketInterval bits in TMU_RTR_CS_3 to 0 using the
tb_switch_tmu_rate_write() API, followed by disabling the Time
Synchronization Handshake using the DTS bit in TMU_ADP_CS_6. The code
snippet for this functionality is present in the tb_switch_tmu_disable()
function, as shown below:

```
tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_OFF);
tb_port_tmu_time_sync_disable(up);
ret = tb_port_tmu_time_sync_disable(down);
if (ret)
    return ret;
```

However, we have observed that the tb_switch_tmu_rate_write() function
fails to disable the TMU rate, and the code proceeds with disabling the
Time Synchronization Handshake. To address this issue, we have modified
the code to check the return value of the tb_switch_tmu_rate_write()
function and only proceed with disabling the Time Synchronization
Handshake if the TMU rate disabling succeeds. The updated code is as
follows:

```
ret = tb_switch_tmu_rate_write(sw, tmu_rates[TB_SWITCH_TMU_MODE_OFF]);
if (ret)
    return ret;
tb_port_tmu_time_sync_disable(up);
ret = tb_port_tmu_time_sync_disable(down);
if (ret)
    return ret;
```

Please let us know your thoughts on this solution.

- Sanjay
