Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21B75589901
	for <lists+linux-usb@lfdr.de>; Thu,  4 Aug 2022 10:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236184AbiHDIJ7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Aug 2022 04:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbiHDIJ5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Aug 2022 04:09:57 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2066.outbound.protection.outlook.com [40.107.102.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC48C61DB7
        for <linux-usb@vger.kernel.org>; Thu,  4 Aug 2022 01:09:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PfyZf5NRBOKVU1BDnfD66HUiAlQFc/XQNFozXLm9kGslH4LYf3FaIJYYOjNo1ql38PBT+04QWnW8gybcVf3T7wQ7fEka2K0Y6bBs85NDOarCIjzB40EdWaYYbb99xPCT1oIi0GHdxzMseAY2bP+o5CBmX+cbpcNyxKWr55xU+jnjKbP1Rfv5jadt2jo1TdyhVRJORNkDwOqxxRgZQMBL5ifS3cro1mUgx3gOUPOicskyoJYYtdWG39ACcyujlQMcLXSTFO1AfCdrb4JLPC1y52qBTGcwHPp/KU0Zflf1qYs16GBJDXKJTlKskD38Ce2XZkqC4fgyIUkg6GwjISywDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T39gIrC3rkJrFaHq+Hs1eJ2h2b8CsCFnOGMTKJLJz5Y=;
 b=j0HrgfmKscBM4JrRpnL3XgpLgbnmpXUfdehCoa2/ZVHgd4mavitubAMB90XByjETLQbba8x0968RsmkgGsqocKTcmzEqG5+KBXIhFdzfND6Wd0LaQVFeWavIpUFVBnf5Of1hEk3EHhbCZPlWoVah3natMrQLONbhuhkeqzKi9PMuyRGzY3Oms+u9WjuxdYqB1VD4ObcIQ6x/1p2LBY6l5fPHCNNHqENBQ3oiuCQNOde3kgSSYkG6M0JehTcp1d/PfaiAe0yCV7MktuvYQ1kDQLE0MUtDum8e+uk1qv1JkEypIMdH76nfQNj8vZ+RlxN4JKqbfYROH4uzNQDSohD2dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T39gIrC3rkJrFaHq+Hs1eJ2h2b8CsCFnOGMTKJLJz5Y=;
 b=ZFvWSyJSjLDNi17gH4vdIi/xJ7Ecgu0XDy8Xkfg0j6+jqkyQxfEG9k2ZvrEs9S7qdA+sQSdW/6E3IABDxOGYDk33X58TDRTKKIibmfm1GJkC6MbuhEoImvzHyUare5RJ8PvTxWU6sP4NhIuEcvHLuGJhW5iswvPE+5MAYUdWNnM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6326.namprd12.prod.outlook.com (2603:10b6:8:a3::15) by
 SN7PR12MB6816.namprd12.prod.outlook.com (2603:10b6:806:264::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14; Thu, 4 Aug
 2022 08:09:55 +0000
Received: from DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::71da:a1dc:7ef7:f733]) by DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::71da:a1dc:7ef7:f733%8]) with mapi id 15.20.5504.014; Thu, 4 Aug 2022
 08:09:55 +0000
Message-ID: <5ba4e184-d9cb-a120-8044-e200b6e47812@amd.com>
Date:   Thu, 4 Aug 2022 13:39:44 +0530
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
 <Yutnjq64OO07QbAR@lahna> <a5b6e0a1-a334-1bc5-46fa-b9ee5f53688f@amd.com>
 <YutwWI8xENDkAtg9@lahna>
From:   Sanjay R Mehta <sanmehta@amd.com>
In-Reply-To: <YutwWI8xENDkAtg9@lahna>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0186.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::7) To DM4PR12MB6326.namprd12.prod.outlook.com
 (2603:10b6:8:a3::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68a651a5-91ac-4c84-2ed0-08da75f0b6d1
X-MS-TrafficTypeDiagnostic: SN7PR12MB6816:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fTTK0AH1DZrbfFbZOPnnunukl0mrZyXUiXMXyOoKPmzv2iVse/IDiHKEahN/uWq0ZJ/qM2AL/6SyaVGWGWpIS6fQHzBWHQtEatW4IZIuDfWKRgiUSTP2VPbAWvXBR6gj936QzUQuYhMgJNIIE2ZX0im1+XMf7ZnApaDyRbiYn7JyjKImKo/GDsQUXbtdnEVm0RiPrIOssnkKYkUDZ/AkgENvgNLVdis9+96/NE5ZRx9Ru2ZwikAjFDd81WuRq+MHDcl/4tBpRLy0Fj36kejxguhX4Ax9rWglGnjATHpuP28ParLUC7hXt6/HRoeUSRa7EVwk1fJ1zCNfET72y+cKv0BkQVKevrgqhKrCAb6lEnKOGBDQxXi724XJLRdFyTzmyJ7h/4Es6Q2z7hCG3yqgfWciFNeuX/6pwiY+WKxHBS/Qt68Cv1C+Ia2Pl7x2hWMHoqqfD2+EKPTnhLTrGidRGuic1F7oHkFXa7OD+1cFp8hvzESf2ne4WZC4qHWODwWW0cPiIxwc6C9+4VlnKtWXrPXHLqPLefVSnp9BGCES77XCS9MyKQHhKwajHrQ0Nf/48YjUTS3zCfsuYUc/2+jS8BWWJHrOp8AIRXkX2fc/1iMeW3ye5wawa0o9Kwjhftem16vZOshLTihLQfaP2VCAgH0U3vxeDg3RHQKxsDg0LPdJGsxvT9yT0RUhPWqf+M3NjKB1qTn1p9yD2jVqyVZKMO9fRkEpfQjzFHIgGUFd4a3NzGCrxvtU+5Qn2PjrgKt3y8X8PfPm1dfACVxC+Fgo5QqNkVgnWUfvAIaBNjAUMFjKMciDptB994aUvqjnlc2phJd3aQbR/4bUlRClrefvWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(31696002)(26005)(316002)(31686004)(6512007)(41300700001)(38100700002)(186003)(478600001)(2616005)(8936002)(6486002)(53546011)(36756003)(6506007)(6666004)(2906002)(6916009)(8676002)(66946007)(4326008)(66556008)(66476007)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXVkd1N0UUFVVEkvRTZSMVJPSGRUb21CZzNab0NMcjNaY1l2NlZrQ3FrVjFl?=
 =?utf-8?B?bExZdDE1cWR6dnh3Uisvc2o0SEN1eXRONnJIekVlR084c0tEaWdWVzJ2RjBw?=
 =?utf-8?B?aXpQcWhtd1NJcHJmTG53a05tcmhNQ2h2Vjk3cG9TVllqYzZ3M0Q2V3NKWHZR?=
 =?utf-8?B?dW95MmN3bjRHSkJNMVhJcHFtblZmUE1OdStQOC9kQ2dJUDNwaDRYZVIxb1RZ?=
 =?utf-8?B?bXZJVWN3a2xuZmtxMnRubWh4di9WNTBHVGpWZThYWjlWd2F4QVpWcklNbE80?=
 =?utf-8?B?TDZlbDlqTGU2QlM5d0dwTlNKNjZhM05jeitZZC9LangvcVFxdml3RTVCaVZw?=
 =?utf-8?B?bFdRSjlPcTluSW93Y1lzQmhheGlMamVXeU5QU2djWUN0bWFvM3RQa3loS0xE?=
 =?utf-8?B?QnRiQlVjUWsvdDgvNC9UbGRYTTRVQ1RvcE9tVXgzcE9kQ2pWRHgxNWNLR0gr?=
 =?utf-8?B?NGRVOXNQL1BZYVJsaFZxaXEyS21jTHdYSHYvRUFtTVNkSDNHUUtxSE5SV3U5?=
 =?utf-8?B?MC9aUjlseElYU2R2UFErNmlTZkE5TVc4YmhCZks1eW1PZGVwNFNXNERhRU4y?=
 =?utf-8?B?K1k1SGJQYUNOaWxDSzdvSE9HQ0RPem1ReUpObG04OFZpUk81RWk2TmVBUnNC?=
 =?utf-8?B?ZFNqNDBHZHlHMFJHcCt0em5DUmxjSDJOb24zNmpWMXp0NHJHRXRKQ3QzU2s2?=
 =?utf-8?B?YnZ2c2Zva0l6REhteUNtSWwyZmFEdzdTMzJwUVQ3NDhIakE4WUI0Ymp0WkU2?=
 =?utf-8?B?SW1ZTjRBaDhLK1BYYjFua2NZWWd0QXVaVVhHVnZuZ0tROUJBM2RmRDF3UTBX?=
 =?utf-8?B?TENCTWdoMFA5dU9GeE00ZGw4RXZBWjRvK1laMzIxdThLeno2NzdpeW0xSHBW?=
 =?utf-8?B?Yi9PTVVGOXBuaFJCS0t1MmdBQWNFdWhZOGFnUDY5ci9qUXZWcGpObjJFbmJN?=
 =?utf-8?B?WHVOL01rWWFEOVdrSlRVSTM4OHgwWUVnRFNjc1VPOXpGVFJBSzdyMWJqbENl?=
 =?utf-8?B?VmNYU2ZsOCtPSVVWVkNNU3JOUFJxS0xaOEdMSGZoeStRY1c0cCt4WE9qeGpR?=
 =?utf-8?B?dVJUV2dVNjVGSHhYR3VYNDdxeXV2enppQUhIMm9CdWord3J6WURUWlB6N0Vt?=
 =?utf-8?B?anRoaFRlbkxDSnZtYlM5T2M3MjQvN0V0RzhsNzVmaGpkTldCU3NaMkh1Kzl2?=
 =?utf-8?B?NHdsYzVKYVVoVE9PZ0hDVkNQMStzTWQrSVhNOXBRd0N5ZkZpeGdTcENQMmZT?=
 =?utf-8?B?QkpMT24vdHd6SDVOK0dVOWRDblpjMDFtYW1Xb0NSR3U3SUg5R2V2T0lEZ2Z3?=
 =?utf-8?B?WlgzU2xGdjFZcW5WZUtJVDgzdzBxekNFc1VzM0kzd3pLYWwxSElSL1VwRXVR?=
 =?utf-8?B?VlZ6SmtUNjNXcU9uYjlhQ2x4dUF6RUtzcTdiR1NXY2NCb0loNXpCVG4xMm9H?=
 =?utf-8?B?RzIwVWVUK2tlU3ZjMTF1RXdHLy9NQ2NNbDlzQ1QzaHpVUUFHWXJhSEFCWW8r?=
 =?utf-8?B?Z2x0S1V2Qk05QnQ5WllZQlBTdnRsMzdOWXF3bjc0TG1GVmY1aEYwcXk4RmUv?=
 =?utf-8?B?RFplYU1VTCtTdSs2ajVzZXpBUFBjelZBRENqRWZvSlVTODlXTTVmWFludmVo?=
 =?utf-8?B?UkFaaU1QSTVIOFpleG1BR3FFTlhTRTNiVjZvUEl0NGNXSlVpRG9rRUFjd3hD?=
 =?utf-8?B?Zm9sTUQ4MXIvbUdJbjhNdU95NzVrbGp1THBJUGEvV1EvclEwL29ITEpkRFhS?=
 =?utf-8?B?YUJOVTF0akg3UW9QdHFMWWRVTUEvQjdGaVVieHk2elc5UVZSK0JpczBYL0Fo?=
 =?utf-8?B?a0ZVc0gyb3NPSXdXVXQwSWtXZUdpeTBCeHlrWlpucHFyaklpNmZzVGk2WVFi?=
 =?utf-8?B?NGhlNTNIWXF1czdYd3g4bFk0ampYRStsd3hXb2EyeTRWY0xZT08zRElKTzQw?=
 =?utf-8?B?Q1dITGtveWR0cEtDRkp0QTUwTDZOSFZxZ2VJeDRZQ3pPWUZkY0pxWFFzbzNs?=
 =?utf-8?B?T3E5dkRWU21ZL29KTm45dTRjdkdXQXh2M2VRVm1qMmlTSHdKWVlxOFJGSnNn?=
 =?utf-8?B?QUxZczI5cktyRFVBYXFQNVJHWWlkRTM1aERObXRWblh4RThtLzNrLzhEc3VO?=
 =?utf-8?Q?WtdO8/6pEIyTBqi8Kt/SE23BI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a651a5-91ac-4c84-2ed0-08da75f0b6d1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 08:09:54.9077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: COs8pUa+CVUWAe4SlQp/EiGjaT7//Zl4D1YtEJjZGSXskjd/RWa4KLtAumz1xws0uDpc5QaFPWD4Yl29yanaqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6816
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 8/4/2022 12:38 PM, Mika Westerberg wrote:
> On Thu, Aug 04, 2022 at 12:34:09PM +0530, Sanjay R Mehta wrote:
>>>>  			tunnel = tb_tunnel_discover_dp(tb, port, alloc_hopids);
>>>
>>> Here tunnel can be NULL...
>>>
>>>> +			tb_dp_resource_available_discovered(tb, tunnel->dst_port);
>>>
>>> ... so this will crash and burn.
>>
>> Thanks. Agree, I will add check here and resend the patch.
> 
> Please don't add the check here but move this to tb_start() as I
> suggested.

Sure Mika.

As you earlier suggested to move this function to either "tb_start() or
tb_discover_tunnels()".


Since adding of this DP OUT resource is required for each DP tunnel,
hence I felt it will be better if I move this function in
tb_discover_tunnels() where we can avoid extra for loop for tunnel.

Below is the place how I am thinking of adding
"tb_discover_dp_resources()" function.


static void tb_discover_tunnels(struct tb *tb)
{
        struct tb_cm *tcm = tb_priv(tb);
        struct tb_tunnel *tunnel;

        tb_switch_discover_tunnels(tb->root_switch, &tcm->tunnel_list,
true);

        list_for_each_entry(tunnel, &tcm->tunnel_list, list) {
                if (tb_tunnel_is_pci(tunnel)) {
                        struct tb_switch *parent = tunnel->dst_port->sw;

                        while (parent != tunnel->src_port->sw) {
                                parent->boot = true;
                                parent = tb_switch_parent(parent);
                        }
                } else if (tb_tunnel_is_dp(tunnel)) {
                        /* Keep the domain from powering down */
                        tb_discover_dp_resources(tb, tunnel->dst_port);
                        pm_runtime_get_sync(&tunnel->src_port->sw->dev);
                        pm_runtime_get_sync(&tunnel->dst_port->sw->dev);
                }
        }
}


Does this make sense? Please suggest me if I have to do it other way.
Appreciate your help.
