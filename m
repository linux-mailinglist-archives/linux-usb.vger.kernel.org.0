Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87CEA589990
	for <lists+linux-usb@lfdr.de>; Thu,  4 Aug 2022 10:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbiHDI5s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Aug 2022 04:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237429AbiHDI5i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Aug 2022 04:57:38 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA24B3206C
        for <linux-usb@vger.kernel.org>; Thu,  4 Aug 2022 01:57:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmJ7ZXN5/QPlfIzDZ0gL75JAEcxmGgiNpbmrCmmMKfFCPqcKDou6KFmpg+U3wk+ValVB5PxmEV9r6NAeONumbo03XYHOH8CQ7zLHFCHwpUMXhteC/viDNUak4wYca2VK/bJHE7b++n6h5qAwolR+W1q0OkEsEB6UMH6QGDc94axQDBvMhA0WdvnRf0qfrVBnQ6WSBcUSfCh0TmSKQomQdhEHMk9dqDnQ0MrsnuTdw0jCume2jE2BzMJWFGAlJFQpdb7hEC/RVDu6jex3BETkZqewgHHBLHSMuQiGslx5KMxkibaHXlfXwfzGjZQctDc8vOy0G6BgVhXAOw/7zoAE+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zvhm18CdS/1VVLZjeLh3mPypam9SGz3nclVudEPJEzc=;
 b=Le93TWjYDFrWbYjnZQWR9EoNlGXq0cTXi1npaiZWghnklYiriRUaHnrQHYDwSnXMWPNDmdPXFS0qRaCz5eSCDRRgbwHEfsJWHkEQQ6ko+KN3FejytJ/WmqiKU547jdYy1OB0ndcj+Gb5tKL00XxZzaywZ82hRG/+aGCLCBl56iJwFwPe6y3zqVVDiO783dYDde3cZ99uEXDvKLi8rhdLiE1+1H5/fR5nerasY593s4onuvlK2Blz+fN/2dj4J5rnJmYlKnwnbVcJIt4eBArCOOjAKTw2Byb0TNUj2VNqfIukWJzde/xZMCnh4Gc0habUqe/g2pIMkNY5tr7s5sxtRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zvhm18CdS/1VVLZjeLh3mPypam9SGz3nclVudEPJEzc=;
 b=FKJZwipFEwFd0u+SVhscXjgV2qH/7Wq7CAg+hprUt1ucVtwuASaL5HqzSu4ovDcfhMecOi+HtTRdvEIuNc0nSrrIe8HOGXUetLWYYgc2Fv/H/kbsAOfmarne5kPsovE99LYsFCFJHILo/0jxKibadNx23XKG9lKtCyIdgDNpIFQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6326.namprd12.prod.outlook.com (2603:10b6:8:a3::15) by
 BY5PR12MB3747.namprd12.prod.outlook.com (2603:10b6:a03:1ac::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 08:57:35 +0000
Received: from DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::71da:a1dc:7ef7:f733]) by DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::71da:a1dc:7ef7:f733%8]) with mapi id 15.20.5504.014; Thu, 4 Aug 2022
 08:57:35 +0000
Message-ID: <1bdd4947-0343-d907-48c3-e33c9063fa77@amd.com>
Date:   Thu, 4 Aug 2022 14:27:22 +0530
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
 <YutwWI8xENDkAtg9@lahna> <5ba4e184-d9cb-a120-8044-e200b6e47812@amd.com>
 <YuuDxU59ud2LhFbl@lahna>
From:   Sanjay R Mehta <sanmehta@amd.com>
In-Reply-To: <YuuDxU59ud2LhFbl@lahna>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1P287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::25) To DM4PR12MB6326.namprd12.prod.outlook.com
 (2603:10b6:8:a3::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c808f33-9dd8-499b-2f68-08da75f75fbd
X-MS-TrafficTypeDiagnostic: BY5PR12MB3747:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DK2nDtvW19prr2lPyMEz7jikaeBSbHLDj3WFXnF9h6Ti5vMHYqgasM7S6c09CLB/mCAhQs9PRu21y5WQ6/Ms0tjL9+NlwFcA0/Y8CX4i0H4CPGJZarxTU82bCsx6dSeNaDkkfcPS3Z/ZqeMwavK1oxn3aoCz9RJiCObp7s8SWAV5jgO0jL3BXcAwgUCZ1L7FOoFY39ffLtqu7N5D0s+f86NXJXj7tuPZ4Egu9ncGu70h/NJVhXyk0UjPlyRuTZapQoPzirOjhbuJwcY/cmaTAeEX+8ffnlzvjpUkQxGtc3wxQ+1QPVqvDMjUeryklYxQmHuH1E0HsOewjO2oltabrr3fufJj3xIdpJV8upcESMNbZlv7Gq2ubDHqxZ7d3B+t1sFIPPlYuDTnpschNdpSl00qXOF5237JMD+WxbhYS0V6KD4Xlqwt/gbkEHEv10cU09DxtH5fXfiWmOTKTKoweJ5D2JtV35hWjgkfOTrcDl79CKnLAiVgX8ciXJSP7KedYampLA0JV9HsNjSrvuXCr2ngrTLWH+ugGWqIwjEwGegmko6iIfDJIA+WVrHVcZ4FQd1QJoczC13VCDgOJA0cyKthgiMr4IIToMkNGTP2nA6Gm0EwYKsR/jcF/sq6XpesAGk6IOK1o5mLITUT1wXe4vnKyT9MhfZkgr3iEybX/MipXKri7Yt4DDxOL5upJXkdk4TdjvWD1fWCu4sn3PzxtGRxVoExdwKjEGz+VJoR6nJkZOFNBGdj9x9GvfrfEzt7tn55DP5QEpG5L2D5fCA87vY5n2MLLhW6z7TbxbDn0x3/3/sNP1Yv6u9QICjDXIM7AL7XxouCuPZTxASw9Yr0bA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(6666004)(41300700001)(2906002)(6506007)(38100700002)(66476007)(8676002)(66556008)(4326008)(6512007)(26005)(66946007)(5660300002)(53546011)(31696002)(31686004)(478600001)(186003)(36756003)(66574015)(6486002)(8936002)(316002)(2616005)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0F5c0NIZ0RhQlBqZHd5Ym10WDl5Z1ZuUWR6dHdOejh1azQva3p3Y3dQNzd2?=
 =?utf-8?B?dGU3dE01TFZyT1g4dEVRUVloNS9ZckVVa2J0NnlSZWQxVzFDRU5za0p3M0NZ?=
 =?utf-8?B?SXE1TEUzSEorMURCdWlxNVQwaWhZbEpWcHFOZHZDbmltcHZmVk54ZFlXenNp?=
 =?utf-8?B?U09nNWJ0NE4yUk1uQUVqcjd1R0d3NUJ3TFZMQm40NW5MOVAyV1VEMGIrVlFl?=
 =?utf-8?B?V0hSdkpMSXpwVnoxd2w0dDZWOGJHWWVmNnIzQm1UaEtudU5RSmozRWcxeUM3?=
 =?utf-8?B?U2JCTTI4MkllZHEwTVhXbGZIYTljWHh0MXQ3VnFoMGg5aVIwcTV1eE1QeTZK?=
 =?utf-8?B?N2xpOGNMc1AyekFFaC80dVFuM3pnamFEMnFwTG1ONmVjSm8wT2l3MUozazlu?=
 =?utf-8?B?NGk2ckZGSEpJbDgrb2svR0dNb3daai85ZElZdmZNd0tPdHNCd2d3OU9FbUVt?=
 =?utf-8?B?VXJ2cS82M1UxZ3V5MTJ1YkJjb1REY0IvaXpyd1pRQ1A5WlRpZjViVDZtOFRM?=
 =?utf-8?B?SjBSckxYTXNNZlY4Y0lrdkNESGRxbGZEcHNsaGpvWHJsa1lFOU8weTdDVHQz?=
 =?utf-8?B?dVkxWlg1U2tCaW1BczNveFd6Q2l0Q3MwU0grcEFaTHJad3hxV1JrbkFxNUI4?=
 =?utf-8?B?NVd6QUNDZy9yWE1jeVIvdStscm9IVzJkZkNFR29OZWthYWdoOHd1QnBGR1Vn?=
 =?utf-8?B?WllScXZJT1JSelBGTG5KRmVqeGphUzlXZkUzTE5BU2lpc08yOTBZWm1jUlh0?=
 =?utf-8?B?c3VyNlRnaXN0NjVhai83Y2x5ZXZHaWltNjJON1ZJQk5NVXh1TUJCaHpzZ09s?=
 =?utf-8?B?K3FUOG1qRDhNblFnVGpOQ3B5RW00MGVIRUk1OExuQ2NBMGQyRW1iMGMzQk1G?=
 =?utf-8?B?L2pvQXdoN2c1WHNLK3JHaXM1NWxhT1FCZzMzOStQd2xPdXM1eWVLVVhzMWFH?=
 =?utf-8?B?clJRSTY0ZXFMZ3BTd0UvUzhBUVhTSldhQ0RpOUEwaWFjeFM5RWRrKzRNTS95?=
 =?utf-8?B?Nld1TG1LbCtlOVlhaW94RUJhbllTcTlmWUFwb1FYbE1TSTZBdEFkb2dOSEVl?=
 =?utf-8?B?MnBpR2x1OGUyQldBUEJrTUdSWnd5UjYyNzF0SjIzK2JTazZjaGRLNHY2bHp0?=
 =?utf-8?B?TG5nNEEzYktzekxqeUFCU3JVTHBGWlM0cDE0c2krM2xlVjBTeVJKaTczNUFO?=
 =?utf-8?B?aVo3MDgyZEhoNGJZOTFXRDVKYjlrWjN1Q3RWd3JVOHFvdGdjQzFzZmFORnR0?=
 =?utf-8?B?b0wwNFJPMVN2WHQreGQreHpSYUZXWHMyOWt4YnNSRllmZkdWVWVoZWFCOXVp?=
 =?utf-8?B?UUF1QTJKNlRBMEkwZVFoSVZnNEsxSllSaTJVQXdYcHA5OWVucmhBM09DVnF1?=
 =?utf-8?B?Vm92UGY0YzIxS1RTeDNSTEdBSzJhZnBKdXE2NnJxY21IQUlIUzdRczArWjZi?=
 =?utf-8?B?OWtUY0RwenN1T1pSd3lCSmpEd2NyWkhFcjY1VFpFY01YK0UwUFpqaHlJcDh4?=
 =?utf-8?B?bExFRUpiK3k0blVtYUdqaU9KOFR1U3pTUWZjM0pJeXN4clZSQi9PMWpvVkJ3?=
 =?utf-8?B?aC9rdm9yWEdjVTlPdEVoc0xBUndKNGIrVDBEZ1ZJVWpkZmlpSXF3OTNZTG03?=
 =?utf-8?B?MHk1YXExWWhORG1pd2JhYXE1SGFJYnhabEkzaGZmR1VlcERVRi9EaTZJTXZh?=
 =?utf-8?B?QzE3Y1crRHBGRnlBQkdPd0xUcFRmRk94TDBnTDdCcy8rZTl1YlpZSzFEK0gw?=
 =?utf-8?B?d3N6d0FYRlhSc29nekN4WXpNS05pYndVQm5KenpPSW9DMjNEY1E4MWx4c2Fa?=
 =?utf-8?B?cUNVWHVwSUFuNW9yRTFVSGN1ZlU5N2JMRU0ya2lmaG1pelJ1VUQ1VHBJRlJ6?=
 =?utf-8?B?UzRtd0VzVms3TVdiSzkwdEdJeDdNYVBlRGYvUDhpL25HRkVvQzJWclYrbmJi?=
 =?utf-8?B?ajZmdGlIMHdXdTZ0WEVlVXJINTdkbTJOZ3JFbFRuems5aFM1aFdkd0RzOWpR?=
 =?utf-8?B?dnh2WHllaHFjMWZ1aHpzcktnTU1FT1RWZ1U3RWlITkRaM3RkR0RPcEd5cFVi?=
 =?utf-8?B?L0ZDeUFJeGRNNE5YVnl2L3RuS2pOZGZEN2lHbnlPeUhReXd5Zml5QXNmKzhz?=
 =?utf-8?Q?/aoth2QooqXTZdQiLIMRJf5MH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c808f33-9dd8-499b-2f68-08da75f75fbd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 08:57:35.2763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HaGGcNhlHqM/SH09UrTtjekHru2szPEQMNEYagAca6EpHPbI8bM5EN5Z0CFIxMdSKebj6RITvpxsc3EBJdGudA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3747
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 8/4/2022 2:01 PM, Mika Westerberg wrote:
> On Thu, Aug 04, 2022 at 01:39:44PM +0530, Sanjay R Mehta wrote:
>>
>>
>> On 8/4/2022 12:38 PM, Mika Westerberg wrote:
>>> On Thu, Aug 04, 2022 at 12:34:09PM +0530, Sanjay R Mehta wrote:
>>>>>>  			tunnel = tb_tunnel_discover_dp(tb, port, alloc_hopids);
>>>>>
>>>>> Here tunnel can be NULL...
>>>>>
>>>>>> +			tb_dp_resource_available_discovered(tb, tunnel->dst_port);
>>>>>
>>>>> ... so this will crash and burn.
>>>>
>>>> Thanks. Agree, I will add check here and resend the patch.
>>>
>>> Please don't add the check here but move this to tb_start() as I
>>> suggested.
>>
>> Sure Mika.
>>
>> As you earlier suggested to move this function to either "tb_start() or
>> tb_discover_tunnels()".
>>
>>
>> Since adding of this DP OUT resource is required for each DP tunnel,
>> hence I felt it will be better if I move this function in
>> tb_discover_tunnels() where we can avoid extra for loop for tunnel.
>>
>> Below is the place how I am thinking of adding
>> "tb_discover_dp_resources()" function.
>>
>>
>> static void tb_discover_tunnels(struct tb *tb)
>> {
>>         struct tb_cm *tcm = tb_priv(tb);
>>         struct tb_tunnel *tunnel;
>>
>>         tb_switch_discover_tunnels(tb->root_switch, &tcm->tunnel_list,
>> true);
>>
>>         list_for_each_entry(tunnel, &tcm->tunnel_list, list) {
>>                 if (tb_tunnel_is_pci(tunnel)) {
>>                         struct tb_switch *parent = tunnel->dst_port->sw;
>>
>>                         while (parent != tunnel->src_port->sw) {
>>                                 parent->boot = true;
>>                                 parent = tb_switch_parent(parent);
>>                         }
>>                 } else if (tb_tunnel_is_dp(tunnel)) {
>>                         /* Keep the domain from powering down */
>>                         tb_discover_dp_resources(tb, tunnel->dst_port);
>>                         pm_runtime_get_sync(&tunnel->src_port->sw->dev);
>>                         pm_runtime_get_sync(&tunnel->dst_port->sw->dev);
>>                 }
>>         }
>> }
>>
>>
>> Does this make sense? Please suggest me if I have to do it other way.
>> Appreciate your help.
> 
> How about splitting this into tb_discover_dp_resources() that then calls
> tb_discover_dp_resource() for a single router? Whatever is the simplest ;-)

You mean something as below & call it into tb_start() after
tb_discover_tunnels() ?

static void tb_discover_dp_resources(struct tb *tb)
{
        struct tb_cm *tcm = tb_priv(tb);
        struct tb_tunnel *tunnel;


        list_for_each_entry(tunnel, &tcm->tunnel_list, list) {
                if (tb_tunnel_is_dp(tunnel))
			tb_discover_dp_resource(tb, tunnel->dst_port);
	}
}


