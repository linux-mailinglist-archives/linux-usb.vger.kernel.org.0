Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 255145687A1
	for <lists+linux-usb@lfdr.de>; Wed,  6 Jul 2022 14:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233056AbiGFMAl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Jul 2022 08:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232499AbiGFMAk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Jul 2022 08:00:40 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2046.outbound.protection.outlook.com [40.107.100.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBDA69FE1
        for <linux-usb@vger.kernel.org>; Wed,  6 Jul 2022 05:00:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GkogW0VS7rE25ijmqwCb8SNoPQemnUhmKIqyhTB8x0h7CcnTdq3+n+CWv0xb1kyye0cpSmseeJb7Nx9Okd88D4VZtTfGst2pvDaMWwBm7wzpWMwpP+ApD3pLdXF3iofbuCG+Oh15I+CqKnTBxGSMbhXBqvOaXmGUz/PofOnu44Ry+ZkxzzDcATIzOgr5oyGSIdXK0zEvcP2zg6XmSUFRV9yu2zTNPTx2/RBv/J3KpyuC4+r8G7uuFVdsj+znlj2t3yisP0T66izYf8oJ9g/PJK4qwa+DG8REFC8AerMIY1Hre3bZujSb1DW1zTiTgZ8IDLIBB0Zw+UCmw51s1vSpeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmc9vntXNvMYWklTct7Dc1NQc6PXFJMjbvNqX7J2DzM=;
 b=EbpfxnZ478eMmB2Lk1yKyUv6dB6yj/jUE8EYjb0PDYmhI0GUr6qN1D5Lihr3HLUO6k69ptQYTKwufCB3VQMUxH+dC53B+VAQs6oZ0rkKo22osNO1ePtkoVj6iPsBIz2cmfh8DoJDxISbTLXXC4JK5VCnves8koT7QdB1mX1QOK494oTS6MD59019Yz5ZalTAV9P8to+xt1oMOm63sV+fU0Ccg21Io2dz4aH2WAOxcg51frjCzFEVUH1+GBXgfeVkLXi2c8HDBDrItunW1of38UrcU/MudTcpQGfcNKkcrX0ih2av2AwjWdRBoZxu2aIzI9FHvmQpQGLm1Tum9cUPqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmc9vntXNvMYWklTct7Dc1NQc6PXFJMjbvNqX7J2DzM=;
 b=lm0nmW+dKa60J2fUZCG4WLIqwJvE0H6gvbzIPtZndHGx3T6dyrt/YjW71Y+ltq7Rg3mUVRjZF45l5TZBXGka8WmScKP87d/ganKY/vQ86C7WcRSqovhuef+SVs1J/Hra5DKxbXrsZeD0PygE1rCfY+QEdLxj6+logthC91fEsIk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6326.namprd12.prod.outlook.com (2603:10b6:8:a3::15) by
 MW5PR12MB5600.namprd12.prod.outlook.com (2603:10b6:303:195::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 6 Jul
 2022 12:00:37 +0000
Received: from DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::80db:b311:9abb:61e1]) by DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::80db:b311:9abb:61e1%5]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 12:00:37 +0000
Message-ID: <8c913bc1-1ebc-d536-433e-bf3e2cc1f9c1@amd.com>
Date:   Wed, 6 Jul 2022 17:30:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] thunderbolt: Add DP out resource when DP tunnel is
 discovered.
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>,
        Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     mika.westerberg@linux.intel.com, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        Basavaraj.Natikar@amd.com, mario.limonciello@amd.com,
        linux-usb@vger.kernel.org
References: <1657085978-130560-1-git-send-email-Sanju.Mehta@amd.com>
 <YsUq80qWepLR2mZ9@kroah.com>
From:   Sanjay R Mehta <sanmehta@amd.com>
In-Reply-To: <YsUq80qWepLR2mZ9@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0155.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::25) To DM4PR12MB6326.namprd12.prod.outlook.com
 (2603:10b6:8:a3::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44c90f70-fc99-4fa9-0836-08da5f47236f
X-MS-TrafficTypeDiagnostic: MW5PR12MB5600:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9RlThnCV5K4YocxpehXr51343oK+TRVXE4a52pKjRA/5KY4d7+j/lCHicN6k/Dxb3ln855JDKXBIBpCnpReTaOyq8VgTrr8rPCunGnG7Xz/+49P3/YhajCkxT1xVac9K+FZSSoHin0Lj+fkeS0bBNjtKQXQWPw1Y0m7KRWqS5BI9arDAugWXBVnYvvrehjXJ5nE7n+qR2rA8QkLeENS+AF51NxBQHl9v7LLzI3xr8drQSdAE4WyOq+8BGsVHH9ruKI5MaNzY0VcT1cyWRB/yU9u28aBJ6ZgkS9GrxHtonbcDR9/tr11BbP9VUUqGBn0W6G4zZj9NDCE2PWURm39mjUSx5+YFCrKdgyyTczVHHNWYt+2t4PWYLAt6c+HUV4UHdC1Bwd5fgZSlaaammiK/yRBRQJAWfQSIr8qVsIMRSFEG5GJBrnfxEGfZGQG/IPhoLDTw12oHy7oje/VN/m+2weGJ+7K/Tvv0jbttL8SiyPgGjuQ+Zc4daa+KOdqyfurz5hjc4aaXQfw14X1ELH/PZM7goXDWlyCtYeS5JGZYgJpwYY7/nAATo7sQz2P91Jeb4ZfozzSAHlVk4THWDw1xaJyjRSZZvvgU3bDlgu2O6nvxxGvJr9cYuCqlzwYDFj/CqMY0WPLOTIQrn0ftMa10mGpjdvABH2Ap2Vp+ibYesO0xBtSgM+upxyEY1phd+iYejqLFp7XsKIf6Bb5i4tryf/9yL7ogvfaGoxWDr8708EAAqBtaV07Xz9H42176jhVE+ldBjn5jwhlL+0doQ9xGHQw+aP1o934Z3FBf69PF+GLYEjN9UP4z7Whz/R6KCYjipNLXWqZ5lma/gz9+SEbQpOi/x0Vt5v2rwDF2KRPRBic=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(2906002)(478600001)(6486002)(6636002)(110136005)(316002)(66946007)(66556008)(66476007)(8676002)(4326008)(38100700002)(31696002)(6666004)(31686004)(5660300002)(53546011)(186003)(6512007)(6506007)(26005)(8936002)(2616005)(41300700001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzlRejA4SytkeVJ1bmt4Sm8rSWc5bmg1bWpWbW9rN0NFZW5aTys3U3VpWitJ?=
 =?utf-8?B?U3o0b0RyRkZjbWt5ZUtyUklKTm1QdDhPNXFSeG9qdXJwSWJQTUJXUFZUa3ZF?=
 =?utf-8?B?TGRVY251c0k1QWFsS2Yya3Nydm1hR2paa2NsMEdEdkRuZlhqOUkwV2xQM1Zx?=
 =?utf-8?B?a0lVZEg0VGdNS2RZcWN3a05oUU5mVUUxeDRHMk9OTjJUNndyUnUzZVp1T011?=
 =?utf-8?B?VWJ6dUoyenJsanBGMm9xbERIU2V3bG9vckJvL24vcWhqV2kzMWF5cWY3OGJF?=
 =?utf-8?B?TWRrU3FMWVJxUk1Yc1BmRUs3ZTJFUEUyTGxZUG0xSzBNOUxVOXNnTElDVHh3?=
 =?utf-8?B?YmlQTmpaM1IrWFVkRGdIOXU4aHBYNE44TVR0ejhCaGJZZWNNSnZzc01iaitN?=
 =?utf-8?B?Vk1TbXRZSjZOV3BHSFdvZEdrMWFPWkZERjE3Z0RnRW52SDdId2t4Qis1ZnA2?=
 =?utf-8?B?RTNRVGJVMWIzQXFQTm1lbDZoaFNiaEZNeGl1RmE3MW5EeFF3cDNzSUJCRDBv?=
 =?utf-8?B?NGRxOWxUb0I0YnFYd201WitHTEFvWWs3ZTcrWVVGNDYxaGNKWUwrL2dYbEhZ?=
 =?utf-8?B?VmNOVUxIS3VCSEZLSHIzZmV3L1dFTkFXdkNEQWFhNlk0eS9uZWo4Q1FPc1Q3?=
 =?utf-8?B?dUl6em0yL3ZzUjZCUDdTMTljSjNTSWpPbVhIVVdzS2t6ZUNwN3ZWUHNNeUR6?=
 =?utf-8?B?d0x5YW9FdDcvcnllK25hQjY2ZkZhOC8vRVhPSUI0bU5sRHlXcnJvNGEyT3Js?=
 =?utf-8?B?R0wyK2g1QVJySytnRmlCb1dOWnpkN2lHa1hqZzFpdjkyVzBaNmQwV2JYaVc0?=
 =?utf-8?B?aC9jZHlVZ28rellrZjZvSUpHYWZOdEVuT29QOGRoekxRUEpjRjVCeGs1S0ll?=
 =?utf-8?B?dDZqb2tvRzIzd2FQNHgwdzJtRUtxdW9lMXZNekVrajA0L2d2YVJHdmtWNUti?=
 =?utf-8?B?bFBxaXpaTVNGTXA2UmdrdEpscDUvNFpnVDZwb3R0QnFhSDZFb0JlL3FSdXBx?=
 =?utf-8?B?SWlhUGZZeE5zNjhocTc4RTZac1R0bnhsU0dLc3NSOWtNNTRIams4emdPTVlP?=
 =?utf-8?B?UHdWUW85Q0hBaUlhWXJSTnRsUmtpZmJkR3ArUytwM0txNzZBT1NiY1p6NlJm?=
 =?utf-8?B?MDNXOXlyMENaUllBOEFQQU5WMmd4SzdiRW9jYXprYk9yeWxoTjAzQlZ2byt4?=
 =?utf-8?B?TDRMYnM4VHhML21jMjJjb1h2eHF5WUZYTDg5d1ZMY1NEcjVCVWZxZjlGdnQ4?=
 =?utf-8?B?cjVaV29jMndPQUZaZldkNU43d0FtVmhwaG1tdXpDNmtFUlMxUVVQemw1cG10?=
 =?utf-8?B?dVRMTWdDa1Vuc3RIRnVWYUpXUUNYR1RiQzE5aERHQTVwMDlHOFo0cWdxMFNy?=
 =?utf-8?B?Q0dFYzZ3QktUVkFrV1Bob3dja1gwaHV0ZkhyaFd1bTF6S0FNWlJuWmtWdjRa?=
 =?utf-8?B?aE5vV0hiTFhVQlk3UXRlbEpNNWNRNFZpVlc2T3dqSmVwWEpzTk0vQ09JNXpH?=
 =?utf-8?B?Sy9SamFpZGdNeEpPVVhCYXZLTkVZYW9Kamt0a2MzWnpmbzFvZkQvR2haTnhh?=
 =?utf-8?B?RUMwMDJ5OXdISHorYlREUjd4K2ZKeWJxQWFyRnU0Y1BudzNwTXV5TWFrUlh6?=
 =?utf-8?B?c01McTU3Y0t4ZkJ6bWN6MFVQd0pnRGdlS2RuRjBMRS9aMFE0VHBRL3JEc0Zn?=
 =?utf-8?B?dHlzUktlK0pUZ1BDZVdiaXEvUWFsSEFjbkNnTUpoaG1GWFRLYVFVK3h1blNm?=
 =?utf-8?B?eVZuc2pGVk1SNzdiZmVJZmgzWitQb0NDeFBpQ3hZeW5yZ1dkc1V1azdkUTVO?=
 =?utf-8?B?b2NISFBMUjBRNmhhV2MzSlVRaU80aG95ODQ3MENHV3ZHV05aYWN4byt0N2wz?=
 =?utf-8?B?aFlLOUN1b1hwK0swbld1S2hmb1NMeVoza2kwWlZXeUdadzF2eElFcWtHZWp5?=
 =?utf-8?B?ZlRMZTBEeGl6Z1pqSVhPOUZ4b1dncWZzT21JVzNwZWhOV2VRbzBTcjI0aFhm?=
 =?utf-8?B?NUJnVzQ1dmlXT1BPcVNXWUVlMmFRS3JBMStEWS9zdU5BdWRvc2tWd21lNCtx?=
 =?utf-8?B?MG1lVXRxa2hYY3hDclYwd1dCN2d1MVczZmlNMmpKQUxkQmVXNE1tRWRuZ1FE?=
 =?utf-8?Q?bk/nFlDIyDclhlsWhw/VpLrNU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c90f70-fc99-4fa9-0836-08da5f47236f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 12:00:37.1579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZ4rGhuCWZPITCqNJZUXoRrw51iJbqf77TSgnM0S9MxpH4PGLttmpNSPTeyFg7CuzqdBTFPRh8gtK4xiuq2aWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5600
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 7/6/2022 11:55 AM, Greg KH wrote:
> On Wed, Jul 06, 2022 at 12:39:38AM -0500, Sanjay R Mehta wrote:
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
>> ---
>>  drivers/thunderbolt/tb.c     | 15 +++++++++++++++
>>  drivers/thunderbolt/tb.h     |  1 +
>>  drivers/thunderbolt/tunnel.c |  2 ++
>>  3 files changed, 18 insertions(+)
>>
>> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
>> index 9a3214f..dcd0c3e 100644
>> --- a/drivers/thunderbolt/tb.c
>> +++ b/drivers/thunderbolt/tb.c
>> @@ -1006,6 +1006,21 @@ static void tb_dp_resource_unavailable(struct tb *tb, struct tb_port *port)
>>  	tb_tunnel_dp(tb);
>>  }
>>  
>> +void tb_dp_resource_available_discovered(struct tb *tb, struct tb_port *port)
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
>>  static void tb_dp_resource_available(struct tb *tb, struct tb_port *port)
>>  {
>>  	struct tb_cm *tcm = tb_priv(tb);
>> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
>> index 4602c69..cef2fe3 100644
>> --- a/drivers/thunderbolt/tb.h
>> +++ b/drivers/thunderbolt/tb.h
>> @@ -1222,6 +1222,7 @@ struct usb4_port *usb4_port_device_add(struct tb_port *port);
>>  void usb4_port_device_remove(struct usb4_port *usb4);
>>  int usb4_port_device_resume(struct usb4_port *usb4);
>>  
>> +void tb_dp_resource_available_discovered(struct tb *tb, struct tb_port *port);
> 
> Why not put this in the .h file next to the other tb_* calls?
> 

Sure Greg. Will make this change.

- Sanjay

> thanks,
> 
> greg k-h
