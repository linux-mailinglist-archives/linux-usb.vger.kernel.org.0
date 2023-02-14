Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDDF8696E3A
	for <lists+linux-usb@lfdr.de>; Tue, 14 Feb 2023 21:01:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbjBNUBt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Feb 2023 15:01:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjBNUBs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Feb 2023 15:01:48 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7C982D173
        for <linux-usb@vger.kernel.org>; Tue, 14 Feb 2023 12:01:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iv4k0vv9Qtqh7eRorgHMksDMZgwbW7ODXtoGSaoH4XoKkhcAfnEIhPdU+ygY4iB+PqBFviMNF07G9+eGuDTwt9gdhVSkXGOsMgKDFCp4XX+zn6XNk1u2CSJ1OLCuV2MpKvnqccrPb2M5K7cNEgvDsLxsRqvhSbI/Ny4RzjkSFIuDZRjn1gh4hg80+q8TRTdYnIn2s6QWMkEz8b1iuitHmEZykMxzN+s5Y0/ymid+GWFxqbGHekdQTGG4yQS6sp6CHIzfrDyxcdJ3pHxPZx7biqUiObWK7YGQ6KvzALHbrIJb4Q8Fqb4r4aYGYgHkMw06AUkWMQjguZQTIJ7gU4najg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dmd+ByTSbVE66I5V+8HIMoNtN/38E/4k8eHeFH1gs8=;
 b=ShW96qkiLIKAS5DbLlstqjOrE5Sv+mnKwlH4NEvzK8DoC2Y/oCLGdUfhKKQu4YlyQ8f7bnggjtyBGWVuCyOVKWt72oh1fwlPZgl4DguhQz7ajmzOPoj4VfG5T6K29xYxUMP1Bd6dOFARI/EA3wvy+7OJWArwhGIgFtOkXY0oDT5+24VCoyHOLRwe0lBysCXwQAUjoHQlajYmY03jO1Jy1vf14QU6sZb6uf8LvJuwwyYeYKrjFjKG5DBY5KpolYI0dnkcbr9XhTrPfVGTZEXQV+lIKLVvjMSQUUVFREbhrqMVevIXUJYRD4qB3ORG5Bd9EyNkwFAAtRz/NxqSJMfvNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dmd+ByTSbVE66I5V+8HIMoNtN/38E/4k8eHeFH1gs8=;
 b=glgeQza7niMy3hvL8ydt4Pt02fSlYeIgcmGxsd0ds+uxOcmD17VpVKWQOY5axkA479KhnumDFSS6X6kSScvGMdWzpoeBUJVKfWUchOZVyWkdSiqUuUpnwSs6n9TGEeHMwQtwyyT6K0V4/6faSmdxk4VYDCn7RfhhgYM/wbc/A54=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6326.namprd12.prod.outlook.com (2603:10b6:8:a3::15) by
 IA0PR12MB7723.namprd12.prod.outlook.com (2603:10b6:208:431::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 20:01:44 +0000
Received: from DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::266c:5cb8:8f57:1dc8]) by DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::266c:5cb8:8f57:1dc8%9]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 20:01:44 +0000
Message-ID: <e4a7fe7e-75ca-a817-4d11-12942eea4216@amd.com>
Date:   Wed, 15 Feb 2023 01:31:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3] thunderbolt: Add quirk to disable CLx
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
        linux-usb@vger.kernel.org
References: <1676311911-1952-1-git-send-email-Sanju.Mehta@amd.com>
 <Y+sfZbVjjFiSf9BU@black.fi.intel.com>
From:   Sanjay R Mehta <sanmehta@amd.com>
In-Reply-To: <Y+sfZbVjjFiSf9BU@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::22) To DM4PR12MB6326.namprd12.prod.outlook.com
 (2603:10b6:8:a3::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6326:EE_|IA0PR12MB7723:EE_
X-MS-Office365-Filtering-Correlation-Id: bbaebbb9-d847-452b-4a6c-08db0ec64b9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eRxAVD2sYqlnKT4np5kEIYya6//NiyKUF1HQb4/Sar2Xc+/PWiEeM/zVEdk/0sJS3E6ZgKj9jFlo6hqYlT1d7VaQSG3xlYSNDTASnaLHzE5FWAHzwCnfSK4pN5Hrfm6G6LNIAz3VhLSWxxWJBHa87YyWRGPR/0lJPPcJF6UVaH/Be+tAx5xKe4pv/r6Dod3WvMJXZ5cS3/ztjy/ribtbHkwrtSfgl2MK4ka8MUTHmjt53R77DpmOdFL+ZVNP3M+5uGbYtghOp44ZCVZ+clAEAGa0MyNjq6yfuPqM9SDsOWGUp1loDMESIdWDEIKywd9iYw/ykX2j/ypUhjhwS0Ur4iG97rxi2VgFzfLNvoNmCcvNdkVV66OoxpJbdjSHUiPWb+iniRzTvuytV2mkHbdet2KNnzMZMebfzVGmgo8MHGunw/ZkP5f6frhBT4Y18Q34OLF0k9T1DLFzUHfOvSM5jNR5bUWK1LMk2rjKqH3VVQdck0PMFaN9Znrt4ow0tAoostuVyEhtCyX/mfY6g/e4VQT4jBiSIzIwAoXQn3v048/v9uOAYifEDALZmMw2B/IluE3arp9SkvhOxYNMCg7mUANUWkwIVhVU4HoK1d5598In5POLpbTsBWnsYSZ7X+vcoTlO5o0JBlaxnGFY4RIl1bkkq2/WHKCVObJ2hMwwGuWU1uzOx4wFiJZMh2KjXzIf+N4ndw1+ulap2zoTfIDWXr74zIA5MaLnq/k7crUVm44=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199018)(66574015)(66946007)(36756003)(2616005)(83380400001)(66476007)(38100700002)(2906002)(186003)(6506007)(41300700001)(8676002)(5660300002)(8936002)(31696002)(6666004)(53546011)(6512007)(110136005)(31686004)(6486002)(26005)(66556008)(4326008)(478600001)(6636002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UE1CTThrWVF3RHhDNG5CVkIrQW5PYmUyS0w3WlpJMjVZUmwyeElQNUZLM0Uz?=
 =?utf-8?B?eHhwNmRCVnZ0c3NIZmhoUG5NNThWUXNuM2N3MjJURWMrbjRXbnRValoxMHF4?=
 =?utf-8?B?clk4a0M0RFlrM1lzc29nTENkRFg0Ym93Z25zUWhpQUxFUUtqVDJmZW0xN3Jy?=
 =?utf-8?B?N3BJVStqbDBxUnpseUNSSFo3TE9iZTZGM2M2REl6bzh5OWN2eDY1SEZrVWh1?=
 =?utf-8?B?bU5VaXN6M3EvTzNDOGkyR2NWWVZValcyd2JNdUZ3VU1iZ0IvQy9pemI4S1Fq?=
 =?utf-8?B?U0RidXNybXJjWjRibDVCQ3l0YmRJVEFYZDBuaUJIMVdYRjVmYVUyZm1vQkhh?=
 =?utf-8?B?cFZRbjNUakJrSVpIQk1kY3lKRm9Wc2hZQ0hHNG04WktlUUxzTXRRcGdPbGZD?=
 =?utf-8?B?ODlFd1BVMlR6T3VUOVMrOWhuQjhFKzhSSkdSUVhaYzZuampjdVVqbHZlTTgy?=
 =?utf-8?B?RlBOZ05ONmhWZFpubWxNeDlxVlVLeEtoYzhQclZSWXpncjhhMTE2UGlvT3FR?=
 =?utf-8?B?cjRxc3p1WkVmQUtkZ3AwTldCemxpb2QzaktOeDNkYkY4MXJXOWNRZ3pXVlJq?=
 =?utf-8?B?TTIzWHlVY0ZUZWJMelVLWjVJMFo4MEZ5aE0yRVhFaEhFRFEvVzJEelNQRVFy?=
 =?utf-8?B?YTJnelRscURCLzIxMFBoeDRaLzBSdHpOeE9uZnJKSkV4ZlFlcXFRcXFpaGJw?=
 =?utf-8?B?RXd4UlV2dndZdUJEeEprRVVtKzRhTnVUeUlGRktFU01tZ3lUQTVxdjJpZW45?=
 =?utf-8?B?M25XYU5FTVlHZEJZT1pCTHFqMVFPZkhDQjlsWmhINmIzQm5RdFNPTHh5NWEz?=
 =?utf-8?B?L0kyZnNaSWR2Yk5SQkZoWWpnSjJaRTBVUDFKNWJNYVk4cEJmODZMcnIzdjJr?=
 =?utf-8?B?QWJTc3huMHBFbkFUUHVOb0JmZlBUbWdkblJaZkMyNkxUaFE1cDdSNkx3SmZP?=
 =?utf-8?B?WHZVY2xXanBXenlFSkJZTXRQTjVlcmhGUElOT1ZVZjUxdWQ3TjZLelM2ZmtF?=
 =?utf-8?B?UTZpdkRKSkRjVER4VlRFZXltQkF2YVdWTjJQVFpPUXJKUmtxTzM0bG40K2ZC?=
 =?utf-8?B?RnlZbUdTSHNaZHlFdU95ZHI2M3BnZU5iMFZmWGM0Q3NhclpCd1BUTFZydi95?=
 =?utf-8?B?UlhLQXNFRXhWdUxUUFFTOExaUERhaXpLeDlNZzRrT0hYd3NJbGFyOGdvaU9H?=
 =?utf-8?B?R3ZtNVp3S1BkOEhlZmZYb1I4ei9uWkpYenBJREVOcTJMZDE3UDdnZW03ZHda?=
 =?utf-8?B?VEFocGI3MlRCejlZTTJ1NWxVNUdxSFFwOVk3MGhPUzY1MEduY3hyWng2MjBy?=
 =?utf-8?B?VkxqODEwVE5KR3hjM2JkT0toMVBGd2tUVEM3bnhMaWlJVisrN09LR3RFMnR4?=
 =?utf-8?B?ZTM4cFJITHFWSm5sZHIwajNObzBmSS9zUCtKOUtNa2NZL2JIUUREUitCZmxn?=
 =?utf-8?B?YURxL2l6d3lOUDFITDYvZjRueTJoSSs3cjdQeE1TT2NtaGxTc3BYRHRNWnRj?=
 =?utf-8?B?VHFEc3dhc3BuN0hUcnRXRXBCUnZZd0JoaTR1V294RjVOR0tDMGJUdHlubnpn?=
 =?utf-8?B?QUZkRy9TZWVULzBsVVZNVDl4VVZhRUFUUnorU2wxdFJ5Mlo2ZVA5YnF2cTcz?=
 =?utf-8?B?TjRYa3ZVSGE0ajIvelBrVmczYm5BR2p6T2plUW9NL0c1MDMxWlZCVjhTcDBQ?=
 =?utf-8?B?eS9RQnNuR1g1MCtENVF2QXhRckJxbjlSQmVXdW5rQ21oMTZLZjVSRDluUUh0?=
 =?utf-8?B?YVBieFRSR2xlcGJlUEhsZnpqQ01ZVzd2NUMyZDVTcUJ2M0g5NlUySFZVUGM0?=
 =?utf-8?B?L3JpOCtReVFUV05TVWFSb2dsZ0hiTXVRREdYcjhTZTUwekNPSjdmNlhKU2Jr?=
 =?utf-8?B?YXZMOFRUaGJMb2x2V1RPQVNLZDhDQW9xU1p1cUdmN1MyM2lEVmZjVm5uVUF2?=
 =?utf-8?B?TnQ3ZWpzeU1SelZZZDZPTlBvdURRZmZLREMyY1hCWjVVa2lsT2ZJb0NnTU9I?=
 =?utf-8?B?R0VDcWJIM0lyZ2NpU3dXVlByRlRNUWFOc25GbzliZVc3TDVFVElvU09jOTVX?=
 =?utf-8?B?T05GL0ZWaVBISSsrbjlSdEVta29oTnhJRXUvMi90b3lEekUzWGhOcHJqbnpw?=
 =?utf-8?Q?LApVCnaPT8vSfRuuYnSSJNyE9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbaebbb9-d847-452b-4a6c-08db0ec64b9c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 20:01:44.1809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHIGbds+jzsbmWlemEm6lgnlPFENApQOesTksgS+Ieh6y82dyin/vl7hKG1+o6nuVXbl9QiqhHUhgY4Gav9DbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7723
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 2/14/2023 11:13 AM, Mika Westerberg wrote:
> Hi,
> 
> On Mon, Feb 13, 2023 at 12:11:51PM -0600, Sanjay R Mehta wrote:
>> From: Sanjay R Mehta <sanju.mehta@amd.com>
>>
>> Add QUIRK_NO_CLX to disable the CLx state for hardware which
>> doesn't supports it.
>>
>> AMD Yellow Carp and Pink Sardine don't support CLx state,
>> hence disabling it using QUIRK_NO_CLX.
>>
>> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> ---
>>  drivers/thunderbolt/quirks.c | 19 +++++++++++++++++--
>>  drivers/thunderbolt/tb.h     | 11 ++++++++---
>>  2 files changed, 25 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
>> index b5f2ec7..47ff4b8 100644
>> --- a/drivers/thunderbolt/quirks.c
>> +++ b/drivers/thunderbolt/quirks.c
>> @@ -20,6 +20,11 @@ static void quirk_dp_credit_allocation(struct tb_switch *sw)
>>  	}
>>  }
>>  
>> +static void quirk_clx_disable(struct tb_switch *sw)
>> +{
>> +	sw->quirks |= QUIRK_NO_CLX;
>> +}
>> +
>>  struct tb_quirk {
>>  	u16 hw_vendor_id;
>>  	u16 hw_device_id;
>> @@ -37,6 +42,13 @@ static const struct tb_quirk tb_quirks[] = {
>>  	 * DP buffers.
>>  	 */
>>  	{ 0x8087, 0x0b26, 0x0000, 0x0000, quirk_dp_credit_allocation },
>> +	/*
>> +	 * CLx is not supported on AMD USB4 Yellow Carp and Pink Sardine platforms.
>> +	 */
>> +	{ 0x0000, 0x0000, PCI_VENDOR_ID_AMD, 0x162e, quirk_clx_disable },
>> +	{ 0x0000, 0x0000, PCI_VENDOR_ID_AMD, 0x162f, quirk_clx_disable },
>> +	{ 0x0000, 0x0000, PCI_VENDOR_ID_AMD, 0x1668, quirk_clx_disable },
>> +	{ 0x0000, 0x0000, PCI_VENDOR_ID_AMD, 0x1669, quirk_clx_disable },
>>  };
>>  
>>  /**
>> @@ -47,6 +59,7 @@ static const struct tb_quirk tb_quirks[] = {
>>   */
>>  void tb_check_quirks(struct tb_switch *sw)
>>  {
>> +	struct tb_nhi *nhi = sw->tb->nhi;
>>  	int i;
>>  
>>  	for (i = 0; i < ARRAY_SIZE(tb_quirks); i++) {
>> @@ -56,9 +69,11 @@ void tb_check_quirks(struct tb_switch *sw)
>>  			continue;
>>  		if (q->hw_device_id && q->hw_device_id != sw->config.device_id)
>>  			continue;
>> -		if (q->vendor && q->vendor != sw->vendor)
>> +		if (q->vendor && (q->vendor != sw->vendor &&
>> +				  q->vendor != nhi->pdev->vendor))
> 
> Can't you use the router ID here not the NHI PCI ID?
> 
Thanks Mika. I have changed this as per your suggestion as part V5.

pls ignore v4 as it was sent incorrectly.
>>  			continue;
>> -		if (q->device && q->device != sw->device)
>> +		if (q->device && (q->device != sw->device &&
>> +				  q->device != nhi->pdev->device))
> 
> Ditto here.
