Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD4B58980A
	for <lists+linux-usb@lfdr.de>; Thu,  4 Aug 2022 09:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238527AbiHDHE0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Aug 2022 03:04:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238750AbiHDHEY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Aug 2022 03:04:24 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FD3C61D41
        for <linux-usb@vger.kernel.org>; Thu,  4 Aug 2022 00:04:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dl71YrYVeqQUVVBjmRvDLI2ci762waf+kax3UWMwVGcCeH4by+AasTmnH5zN9v6g/bSnBYfm4MYQMT1dat6guvviO1vpTA/6bImFFJVQPfB3zqMP2oRhEWmsfLenpEW/C5vP0UdFJN/qM1AvN+W4NUQiq3ND/VodnhpnScf6SYRSSKRs+kX7kS89WDRGrin5WiYROmMEEHMSwED6ZqN5JMHqlkxfXLLKdjuPxO5ja91GV9NXWCG6m8EikkKz5sCVRIqzJD2NDGQVGDjwoZHtBFmh/DUFyUMIcNBbS9yGIbtGPf4lm+7RZv5Cl+246eKdjCiPbQ/+Of3wU4Dzz6shjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SttQA/r1lsirVPivnIiUr0ZNEREnnSENdq82l1rx2z0=;
 b=I9SgENkOOV4GJp+QUy1DxGW6+by+qP9QTu3Yzr17YAzrEcBWHLBrqgSJuogIoZLFXpREX3cAJxbue9HS3SBJCbyDXsPoWHIus6inzK1sBNeiZg+2pVADcgqfcOMDgdTpxVQOD+9t4PsNmoBQICQyZwmESsIVH8VUENtuuNbCUFTg8Ck1BeTPYgV/UGRGScC11ora49pMfaRhVlgChVWgbn0qy9JfEABDfzb43m+ydnxzWcCz8z6sssruTKtnfeUsGYf5MC1cOlzSKA34TMCPaVYm1D+vRBL+kz8aNJ42q3WKhV8DJRUz5xvGRzpvKWtv37+vR8w74YxfOQjr9EEhgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SttQA/r1lsirVPivnIiUr0ZNEREnnSENdq82l1rx2z0=;
 b=agsUvuFboJFCcQcoxbiY4OxumDu5gK0njCoC7Wo/TZyLiDJRGbCToPgijn0Ztv5C2//Cq1Me0hBeCyxU4PW9yWrIscWUEbxgMLMUSCiaREBWMy6wE6V1ZybxjGUjHUq+uvnatkSwO4F+LWe8d7EyjHSTnWu7FrN6hxYnRWy8dLI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6326.namprd12.prod.outlook.com (2603:10b6:8:a3::15) by
 SN7PR12MB6669.namprd12.prod.outlook.com (2603:10b6:806:26f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14; Thu, 4 Aug
 2022 07:04:21 +0000
Received: from DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::71da:a1dc:7ef7:f733]) by DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::71da:a1dc:7ef7:f733%8]) with mapi id 15.20.5504.014; Thu, 4 Aug 2022
 07:04:20 +0000
Message-ID: <a5b6e0a1-a334-1bc5-46fa-b9ee5f53688f@amd.com>
Date:   Thu, 4 Aug 2022 12:34:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3] thunderbolt: Add DP out resource when DP tunnel is
 discovered.
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
        mario.limonciello@amd.com, linux-usb@vger.kernel.org
References: <1659587394-115256-1-git-send-email-Sanju.Mehta@amd.com>
 <Yutnjq64OO07QbAR@lahna>
From:   Sanjay R Mehta <sanmehta@amd.com>
In-Reply-To: <Yutnjq64OO07QbAR@lahna>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0139.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::9) To DM4PR12MB6326.namprd12.prod.outlook.com
 (2603:10b6:8:a3::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f0fe5b4-2561-4c19-fe80-08da75e78dfa
X-MS-TrafficTypeDiagnostic: SN7PR12MB6669:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 130NsRVLNCXxbf1kXwjbFt7VajGathYFcRzUB87ZpMvSTUx6rExr+gk0QRwaBryVECc1n6vQ8Zg3TjlgWKW16UpTuVZau3MEaPfYH8yNMZShCsR8tMF5qSnz9fXk4ILjarK43Gv/bi/T08sgJnX7il7NXp4PiqHdUqY+12ujzHju3FlFVCepM/g4o3M6yLeUaEnHXe5If+ThqgIvHn5w30+ESXGOY3jR5ny0ySnJ7q7Nvqm31EkTt5F/qldrJPtusU6fhPaklzDoQVIXz1tZ/ZH/yl8dvNUt89XqsbUmTrAYzQO0xhSskV1O5ilqUM1rtYVWDvAhg3/kjxDU4vCzxeeT/e8XqlhReIMc+bE3CJCQWD4DUeesPsInemf2GvUUjvZqSIc8Ff5ux6Lixb+pBREu85Fm/m9VK/UWVPeTI2lApqRS0sMIfOYPd3ncZH0rMIff/s4uD1/NWnVLMIUHalKGTebKXSfS+5pux/WbuuUAxyPXyEdSNYFYCidYt+XAcBN4MV/C/FkNOso1RXg2UVrQEU5SMJHrFAW6MzugnEoNYczgTXqcgSBmlqFOa249B9IgdcFHSX/cR+qYTRoRoS7AIHxwRkfpoBvYA+2NAZRLkiPCEMOV2u7pyKP9o77dLsLNI2Hkztn6VPhs5+uQ01mel9rYj8sswGsxlpR6McuNP717WsHlWaraobe57yYzoGHbXb4ylihYn0ppqkt3/SCvfTk4d70LYQLAiX/B02UTyGtEYvw1VS7brXo6nN7s7XI5bpQFr/CMIN8WAB2H0UtUSg9JLRwfqTnyJ7FQRp/oGY2pC1TqrpUwJtfw/i5pO7tZIRZOLF71iSA/DzgssQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(6916009)(6512007)(53546011)(26005)(6666004)(31696002)(6506007)(41300700001)(316002)(6486002)(478600001)(38100700002)(2616005)(186003)(83380400001)(5660300002)(2906002)(66556008)(36756003)(4326008)(66946007)(31686004)(8676002)(66476007)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTZnTUl6RE04UUFNRXAxWG95Yi9YdGhqLzZwTSt2RC9wTEp5cUlTbFpnb2gx?=
 =?utf-8?B?bWFxUEFvZzA1R0k1S05LUHhuWUVZd2VhbmZtRkl5SWljS0dSbS9WblZkMVJM?=
 =?utf-8?B?RFBRenRHcWN0M2V0UDBjRGx4TVg2dkgyOHExM2MxSGFVYVRSWUs2a01jTFFY?=
 =?utf-8?B?bFBRRGtXNDJyeUptY0dVd0ZTNzlKU2YvOGZ1dmhMZFJ4VUF0T0RiSkFKYUNq?=
 =?utf-8?B?TWJzeWZLTDhvajBjNTJ2TEEyODhGUTlrN3FqcURXWitxV1hraVFGeEMxc3U2?=
 =?utf-8?B?N1A3RE9TTkJVMkdVTVdqZ0RwR0VZcExFT1QzNjY4QU9HclNjQURvdERFRTc2?=
 =?utf-8?B?RVNVaTZNTGgrVmVWdk9rcllUUnMwcDI2c1UyT2RRYVRMQ1FPR0FlckdXcy8v?=
 =?utf-8?B?NG9tdWd0WDZicExQNURRVUdObkUwWFlRc0M1bzBJRzZUazlvODJncDZQMExS?=
 =?utf-8?B?UStiUXFOeDFuVzVIZFZpZjYxbXRGaDFaUWVUMWZYU0JIWXJOeXpIeUVJZUth?=
 =?utf-8?B?N1BGUEdrSFByVlFFQlpXYXJoYWp2MUg5anJzM0R3VWVEQm5OanlrbEtPTjJK?=
 =?utf-8?B?TFB6b0hrYWlUWlJhdjVCM2lqN0NwZnd5bVBubllnL2U1Qmw0cFNUdjJzQUtp?=
 =?utf-8?B?cDVuYThYNFR5ZzZRZkJFdHNpdHNTSlQ5ZnA1TnZVeExhWTJtdXdNcnBNMysy?=
 =?utf-8?B?NzFyZEQ0b00wZlJud0NUM0kwV0hqNWVUU3hSREpFUjJvY2VoRHEvNGNBZE1C?=
 =?utf-8?B?Wm9FZjBzVUQ1VXFaR3hqVm5XUFU1SjZvS1RSbUxrTEdiUUxOTTlrRkhra3VU?=
 =?utf-8?B?SEJVVWxkRnJjWWpOVjZCNUFYZzMzb0lOR3VjQ2ozN01xVStBaHMvOTdHOU9t?=
 =?utf-8?B?ZVlWQS94Qy9XTHU3YVA5bjZzdEFhVUN4d3QyOWsxMjVTeGozZnA2aUV0MjBF?=
 =?utf-8?B?UHg5MlpvVGFyRW85TzdraEtwTlFodFZQamZiTnFXWnZralc2Z1RIY3NvUXg1?=
 =?utf-8?B?OHNPU0tYQVBOWFQ1dnE0RWpOdFM5ZVV5NEFNN1NRUnVxNUVObFVLWVJlTDgv?=
 =?utf-8?B?ZmJNanJQMUl3WVRlMVlxa1J2ZlhoVHdqbjBJY3VsK3dLazQrWWZuWElpRUJi?=
 =?utf-8?B?amRYYmNidkZoY2tDUEZmQ3dXT2x2aFpHZDg1M0s5cjFlVWlnRDFQWlhpdnIz?=
 =?utf-8?B?aWFRQkVmbDREbk9XVEVPejFmd0gwTVRmcERpWngvRnduaTBUVDA1YStESGFF?=
 =?utf-8?B?TXpSVTkxK0o1ZllFWG9nczluN0MrektnMnU2RXdoTldtV2xzSmZ3bDkzVXFW?=
 =?utf-8?B?cHBvMWZ3OUhYN1hqVjU1OXJjK01zanllTE03NURraDBML0JjREVIbmZraXZP?=
 =?utf-8?B?eDY5eDVDaTEwWXdkRTBjRnVGa3VOMVh4QWtCZy9ycC9zTjdWUVdza0JEc2RN?=
 =?utf-8?B?Vzkra3FCbUoyd0Z2RmUzblZseVRXMGRrcTl3TEhodC9TQ2o1OGo5MHplTkpk?=
 =?utf-8?B?ZzBKVUEzUnpFQkIvVFJjWlluNkpMY2RIeUpvbU44UTJHUHhCVmxXMDZOZWJC?=
 =?utf-8?B?MWdTSkozYlZrYWh1K2xadGdkUk1DTFNSdkRCTldtWllqNmZ4Wk8ycFVsNm5z?=
 =?utf-8?B?dnM3QVpZSzB5YXhrbENtZURNTlRkTUd5SzBaTzZacTRYYkd0TUpkWFJDTVo3?=
 =?utf-8?B?N3hvZGNLbjdMWGdNa1Rlb2krbTVReUYrbFQ5TWVVblhqRVYvdHpRZFVRZnQ2?=
 =?utf-8?B?ZFpXQ1F0aktMSmpNWUE5am9RdVlCMkFITzdOeDZaanY4T0EzQTE1c0VPb2hB?=
 =?utf-8?B?QytWYXh5eUIwaDFBa1ZPYVU0dW5IYXh4bnRHTmtUYTZ1b2loUjBwTTZheVFY?=
 =?utf-8?B?WGxjUlNyR2FpT1laM0lqWkg1QkxTM1MyU29sU0tiMksyKzFDQWJEU0NlVWVK?=
 =?utf-8?B?YlNJTFBUVy9aUnFEdTIvcGUzSmE1bW5OVk1CYnQ0OFQxTTZxNzV3bDgyZTI5?=
 =?utf-8?B?QU9XY1FMWDhXQ0NKNTVqeVR1STNna2xTZnZ3dk9adlM0MzdRWnA4dG5HY0dI?=
 =?utf-8?B?endtRGFOUDBFRko3a2FEcjBGejNyUEdUSC9qbG9MbThmK0gySDg5N3NBalVQ?=
 =?utf-8?Q?IbTLnP+8nW5WVZsG+NQa6s0p0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f0fe5b4-2561-4c19-fe80-08da75e78dfa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 07:04:20.9090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: afGeyKG+9vKwTteojLPjEeH6rzFJ5IjNuEVXLv5+CSnjXKRhSgLLDODWiSAoEVs6RKQeQ4R2WCTW4uqq0K74PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6669
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 8/4/2022 12:00 PM, Mika Westerberg wrote:
> On Wed, Aug 03, 2022 at 11:29:54PM -0500, Sanjay R Mehta wrote:
>> From: Sanjay R Mehta <sanju.mehta@amd.com>
>>
>> If the boot firmware implements a connection manager of its
>> own it may create a DP tunnel and will be handed off to Linux
>> CM, but the DP out resource is not saved in the dp_resource
>> list.
>>
>> This patch adds tunnelled DP out port to the dp_resource list
>> once the DP tunnel is discovered.
>>
>> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>>
>> ---
>> v3: make tb_dp_resource_available_discovered as static function.
> 
> Hmm, I suggested this:
> 
>   Please call this tb_discover_dp_resources() make it static and call it
>   right after tb_discover_tunnels() in tb_start() or in
>   tb_discover_tunnels().      
> 
> Anything preventing you to do that? Or you missed my comment?
Sorry, I missed the comment of changing function name. I'll resend the
patch.
> 
>> v2: Re-ordering the function declaration as per Greg's comment.
>> ---
>>  drivers/thunderbolt/tb.c | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
>> index 9a3214f..53abce3 100644
>> --- a/drivers/thunderbolt/tb.c
>> +++ b/drivers/thunderbolt/tb.c
>> @@ -105,6 +105,21 @@ static void tb_remove_dp_resources(struct tb_switch *sw)
>>  	}
>>  }
>>  
>> +static void tb_dp_resource_available_discovered(struct tb *tb, struct tb_port *port)
>> +{
>> +	struct tb_cm *tcm = tb_priv(tb);
>> +	struct tb_port *p;
>> +
>> +	list_for_each_entry(p, &tcm->dp_resources, list) {
>> +		if (p == port)
>> +			return;
>> +	}
>> +
>> +	tb_port_dbg(port, "DP %s resource available discovered\n",
>> +		    tb_port_is_dpin(port) ? "IN" : "OUT");
>> +	list_add_tail(&port->list, &tcm->dp_resources);
>> +}
>> +
>>  static void tb_switch_discover_tunnels(struct tb_switch *sw,
>>  				       struct list_head *list,
>>  				       bool alloc_hopids)
>> @@ -118,6 +133,7 @@ static void tb_switch_discover_tunnels(struct tb_switch *sw,
>>  		switch (port->config.type) {
>>  		case TB_TYPE_DP_HDMI_IN:
>>  			tunnel = tb_tunnel_discover_dp(tb, port, alloc_hopids);
> 
> Here tunnel can be NULL...
> 
>> +			tb_dp_resource_available_discovered(tb, tunnel->dst_port);
> 
> ... so this will crash and burn.

Thanks. Agree, I will add check here and resend the patch.

