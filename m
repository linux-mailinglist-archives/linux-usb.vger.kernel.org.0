Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7018C569FFF
	for <lists+linux-usb@lfdr.de>; Thu,  7 Jul 2022 12:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234977AbiGGKbe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Jul 2022 06:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235318AbiGGKbb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Jul 2022 06:31:31 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2070.outbound.protection.outlook.com [40.107.95.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 961F05720F
        for <linux-usb@vger.kernel.org>; Thu,  7 Jul 2022 03:31:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GN0eaErrVy4inzfElWNoeyJ7L1XYORTjNa4EKfaIYvMos+CzZSMv/DUeAW27Koe6HRJRzMTZKLaj6piExfrbc82K/0DId6b5PwexR7CjtFZkNndcEtSc3zr+QzJ3R/lFJEKRPqfNv0gtz2CJPICGlcXQ0j89rphGVR64MktAowJ4pi766p0RGo4zi4gBpg8c1nQxeDHOSKhR6Vb+jVAIoOyHSiX6ljNhABhuuVXDmvXmw8ywfPgpZ/oVXVY5QL+RpCv3n+zYl4VtDCrIJzx4RLZHSmhSokWMy+mmaYWSmLUm20sKuj1eaguVKa44Uq/TxMI3+tQ4v3VLF+w1qeQq5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+rb94WC0vAND9MCmlh3dpXrqw6aVAR5jAk/eEafcdo=;
 b=lQhymO8LZ+xK9rxgIqyw5ls2GXhKaDsW7MATHzFLmBBKxv1PQJxTuod/unLJ0ERlYVjH5Wf7avAv9+LIueU73RYCIPc+nygqhygXBVBMzmyRzCcDX9ezccmeOU1UCSkn8GolZvu8tnHqUehvWYBSLDpA6+4jejtXaGfeswAZg0Jdf9aPUMARIEr+TeGFz7JCeuKjW1F19Jxq0Oi0+8wO9nZ0X2mxGH5rWmuNIr+jnOepmcLJMklxxy79zblyUomSKRsRFNfedy5xh+BanRrJWPvZBJOHSm5sCg8mx3peY761WoFvPir1WjxwHMsXh5DESpoXT03hAYKYsyglaDXeNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+rb94WC0vAND9MCmlh3dpXrqw6aVAR5jAk/eEafcdo=;
 b=NMnH1P6ShLFiGG9SGh3fgiwUZpG/MfJoevJs2becJ0XaQVOmVi+HGtBffiMmIqC8t52NKeuG//GILvePkXIN2ogb1O2iM/1IHnTdLSjrz5l3EtXFDsadU7cjvbyzU5yiwcEKP+nmjXdyD3OhVI0z4stJr0DlfOp2jYhoMmmf3TE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6326.namprd12.prod.outlook.com (2603:10b6:8:a3::15) by
 LV2PR12MB5848.namprd12.prod.outlook.com (2603:10b6:408:173::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 10:31:24 +0000
Received: from DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::80db:b311:9abb:61e1]) by DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::80db:b311:9abb:61e1%5]) with mapi id 15.20.5395.021; Thu, 7 Jul 2022
 10:31:24 +0000
Message-ID: <0b9f2b04-7734-4d05-f027-cd3d7f49064e@amd.com>
Date:   Thu, 7 Jul 2022 16:01:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] thunderbolt: Add DP out resource when DP tunnel is
 discovered.
Content-Language: en-US
From:   Sanjay R Mehta <sanmehta@amd.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     mika.westerberg@linux.intel.com, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        Basavaraj.Natikar@amd.com, mario.limonciello@amd.com,
        linux-usb@vger.kernel.org
References: <1657085978-130560-1-git-send-email-Sanju.Mehta@amd.com>
 <YsUq80qWepLR2mZ9@kroah.com> <8c913bc1-1ebc-d536-433e-bf3e2cc1f9c1@amd.com>
In-Reply-To: <8c913bc1-1ebc-d536-433e-bf3e2cc1f9c1@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXP287CA0019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::31) To DM4PR12MB6326.namprd12.prod.outlook.com
 (2603:10b6:8:a3::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 972f6688-0aa0-4e23-6f1b-08da6003d747
X-MS-TrafficTypeDiagnostic: LV2PR12MB5848:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xRkdo359YHDIZ8w4DSV1xyGxycDQUJSWjcH1mLMXets3M1OMGe8Ql83vur3tZcvF7SaeJCQ6WmB2dJArAhzvY7nMG4TvfvaIkyrNxh+wtNOjyEa7u50sATiebxa+iZVF+km2VAEfSmCE6/9tKafFqxekc9Kkb7YyB/qPeYSwzyAPdr9dgblv0NTwroNcc6aaQOOqvfrpfRDb10/BkYx4ajvNqZBpQdWswB1/pefv6YunYAWLfk/QqbeX2lqarDgqizB0iH1z1FtFwuq8L4tDPh+PLqsZRAtW2YJHzYXGdKq+A6YXb3d88Rp+QJjQIutqdyHo1hiJ1tsdiMmUxIk/h7AQ3DHF+YnVsLO8f7jMxG9NNgHP16Kmbn+kJbNlZkxBPH4g1scbfpgIlhY4kAxTE/7Y1J/jZ4SuVzN64+DY+dw9qamj4MN/re+YG884UsM7L5BFweUtuEId9vU91u55QOg3ns8JB+tLLL3iLOjOGhVF4OQSSE/QVJh68ia2ZLlIxnxXt49lvu7wBM4dbrK6Gnc9I4Jd48niOXfTtdrIb3gK2/zCaYZBEQZAVgElnOzwEpqG4pCcNdxNdEoQx/GUxa730U6K4CdcCUsOO8J3TY84jd9ZNQ44Bhso16G+CCtUv5W+VNBCWYG9qTQWW7qcWMjQ3u2i3iBBxNVyYGYbxUvQXGLcRdY8dl1JPQJU9PklDBDtJpR0Ch+TpcN+OOcqaAGXXUmnslOthxCuJ6E0TeZGp2K5pc8jg+z4tVY37Ab0lVTRVp2GvyLeMXmv4fNLx/HCSh1mXD9omlxeJxr2eUELzPx4fQMFZtuFCGRwp3avx6ItDbdx3w6r3fGNUrkH2iGsi5nRL/T72QlnhF2hKGI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(39860400002)(396003)(346002)(366004)(66476007)(8676002)(186003)(66556008)(2616005)(36756003)(66946007)(31686004)(6506007)(6512007)(53546011)(110136005)(26005)(4326008)(6636002)(5660300002)(6666004)(478600001)(31696002)(41300700001)(38100700002)(316002)(2906002)(6486002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1NBcWt0WDRBdUZqK0N6ZjNtWG9EVElvNndqNjhBaTBaYTc0NlNKVnpybW1U?=
 =?utf-8?B?M0pIcVN1ckF5Ty82UUNhU0RnbUM4NEJYbVdJSG9vV2ovelBRVE1pNkE3NWp3?=
 =?utf-8?B?dmtHaC9hSGhIbzZHbHVVdEpPNUhMNkdoS1VKUFE0NEVUalJpbG54aWV6d0lY?=
 =?utf-8?B?aitkVDNIQUI0bUJXa2JDaE9OdTJhSFJDYmluL3ViTE5LamhGU2JIL3EvbXpW?=
 =?utf-8?B?NU5KOFdKQ2NJZ29JSW1FUHZCYVB0SlpseEp4Q0J5YS9RMkxZRzNBNGhZSGZn?=
 =?utf-8?B?eTEvdnNWNjVNYWJNT1JBcWtuMm1scHpKM1o0N0J0YktQZGRhZjNwOStIUk5G?=
 =?utf-8?B?R29XeldNai8wR2NQUmROSVZpZDJzYjdnSVZJbmdWOFhYSlZnTnU3Y2hTL2dq?=
 =?utf-8?B?cElPTFQzdlE0WnJ2emM0dkQ0S1d0MTRtWFEwTURpWWhweG1hazlhR1dNUDRF?=
 =?utf-8?B?V3Zjby9pcVNrN0Z3ZldTN0ExbEhoU0MvdEV4ZC9CUndEcDJTa1Y1Q1JQaHF6?=
 =?utf-8?B?V0YraGJTVmdPa2ZlYno1UkJYMTRqZDF1Snd1cFBEc1p3RzkvbnAySjR1enF1?=
 =?utf-8?B?ZEJPUnd6ZkZXczVVOG1wZWlmYlQ1WVVTNzJ2SXIyb2c2RmRncG12NnVJYUhY?=
 =?utf-8?B?eTR1YjNKZTFVeDM1ZnFCL2o2QytFUUdXWUYrbERRNUJJd1Z3Z2RSMFYrZ3Bn?=
 =?utf-8?B?NHBsSHpHdjl1ZWxSQ1N6K01aRUtLQnFZakQySURudmg0LzRXVU5OTlBrbkRW?=
 =?utf-8?B?bk1FVERqdkpEZmc2bWEzL285Ui8xNUEwc1FMeGJVUDQ0Y05YYk1xZVRwR0ZQ?=
 =?utf-8?B?K3JDTDhEQXBLRHdkQ09IVlRlQzh4emkyUjB2aDNVdmtCM2k3VTVHMUsyT2NS?=
 =?utf-8?B?NWlLc3ZSY0p5dXRUU09ab2NLV3BzZWloYUsyREU2ZjUyZ3I3QVFuZXFuT0dF?=
 =?utf-8?B?aDVnT3o5bnBwSnhXam1uMnQ4RDN0ZEtiSHJCZjZEN1ZQako5bklTbklheXZ5?=
 =?utf-8?B?ZG8xanQxNHdQeUU5YUNucFlpR20xaFY1WUt1ekZ4eVpVTHkvbGRZUlMzeWlI?=
 =?utf-8?B?ZzVRclNXQjMwMmZUZHhCdEtYdTA1ek5mem5RSDRJNFZRaStjdGtncXFqZTRN?=
 =?utf-8?B?RE82Tzd3Q3RoVVNYMUxaclJSUm5NbjR6YTV4eHAxeWRXQTdnSWZ5NHdiK2hu?=
 =?utf-8?B?TGYxamZZVjRZc3JOWnBDZGFweFpuTC8xWWN5UUdFaVZsVWFRZ1FDbUZsWHFZ?=
 =?utf-8?B?N2tLdWZhVTZVam45bFkxV2c1NzNkS3JvVjIyY2Y4aTdXbm02bGVoMWpnRzdQ?=
 =?utf-8?B?TFVhQ2NUMi9pSmozZHZuZWxkRklhbkVmYUJCbGU4bllBUmJKdE1vTUZDc0gz?=
 =?utf-8?B?cW1qeG85ZU05SllmbHNtUVY3RStsTlhQcDh0MG5KNXEwb0VUaU0vVnV0N3BS?=
 =?utf-8?B?RUlOOXZXUU0ranpCSTFvV2NxcVQwdGdSZTI4WHRhSGpIbDNKM2FsUXNpS2tp?=
 =?utf-8?B?TFBsWFFKenZoRVJzVjdBLzV1MDhlcHBHbG40NEtGUVh1ckdXUHVUUFFZSll2?=
 =?utf-8?B?U1J2dm14WlAxUTJzUUdValNzNHpUcXRHemh1bDNRWWk3MjNabE4xanpVZWww?=
 =?utf-8?B?VjMxRnk1azhqRTZYckhCS0tpMDMvaHR2SXJsUkxqN0J2eDdTYVhWdTlSM0Mr?=
 =?utf-8?B?YzJFUytDVXNENS84M3RRTlpFRGxoenViOWtoRXhadWM5RGl1V1RtbTFnK0lQ?=
 =?utf-8?B?a0dvQ2VHQkM5QjV1SUhza0lzM25meHNMNDh1L25NeUJnbHFVbG1sYXQ2UDgr?=
 =?utf-8?B?TW91T0k0b1Y1VkcxWTUzUUFYN1paemhERmtuQ2R6L1JxWXIrRlFLaklJUEM5?=
 =?utf-8?B?eWdPSWNwZGVDOVhFOW1ra1lrRjFIZU13RzlnelZYNStxaVBkY0hKb3A3YWRk?=
 =?utf-8?B?TXd3cCtyeWRIVkU3RG5nZ3pWWUp6MGQ4WnNHR09YTmtPMmVwTmdJemtCWk9h?=
 =?utf-8?B?NW5EbEwyK3lwL3pVc1Y3dktqTlhSZ2pNeVNkNG9lV0lhWlcvUldaRlVqUGl3?=
 =?utf-8?B?U2JkditNZkdzUTI3SjdIeWpHUXpvNjlvQ0ZTZ2ZIZ3JlaUxsZVpOalU3b25I?=
 =?utf-8?Q?Ia6AejKvNnDMjmALhI26NQuwr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 972f6688-0aa0-4e23-6f1b-08da6003d747
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 10:31:24.2747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MU5LFB6Pw/UFnOT5Tiew1Ji3ucxai1UzCTOoz37W6DjDXJo4r3hxL9CaR4Ek0gBMHIZ2n+1NrcaZZGzhoprOqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5848
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 7/6/2022 5:30 PM, Sanjay R Mehta wrote:
> 
> 
> On 7/6/2022 11:55 AM, Greg KH wrote:
>> On Wed, Jul 06, 2022 at 12:39:38AM -0500, Sanjay R Mehta wrote:
>>> From: Sanjay R Mehta <sanju.mehta@amd.com>
>>>
>>> If the boot firmware implements a connection manager of its
>>> own it may create a DP tunnel and will be handed off to Linux
>>> CM, but the DP out resource is not saved in the dp_resource
>>> list.
>>>
>>> This patch adds tunnelled DP out port to the dp_resource list
>>> once the DP tunnel is discovered.
>>>
>>> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
>>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>>> ---
>>>  drivers/thunderbolt/tb.c     | 15 +++++++++++++++
>>>  drivers/thunderbolt/tb.h     |  1 +
>>>  drivers/thunderbolt/tunnel.c |  2 ++
>>>  3 files changed, 18 insertions(+)
>>>
>>> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
>>> index 9a3214f..dcd0c3e 100644
>>> --- a/drivers/thunderbolt/tb.c
>>> +++ b/drivers/thunderbolt/tb.c
>>> @@ -1006,6 +1006,21 @@ static void tb_dp_resource_unavailable(struct tb *tb, struct tb_port *port)
>>>  	tb_tunnel_dp(tb);
>>>  }
>>>  
>>> +void tb_dp_resource_available_discovered(struct tb *tb, struct tb_port *port)
>>> +{
>>> +	struct tb_cm *tcm = tb_priv(tb);
>>> +	struct tb_port *p;
>>> +
>>> +	list_for_each_entry(p, &tcm->dp_resources, list) {
>>> +		if (p == port)
>>> +			return;
>>> +	}
>>> +
>>> +	tb_port_dbg(port, "DP %s resource available discovered\n",
>>> +		    tb_port_is_dpin(port) ? "IN" : "OUT");
>>> +	list_add_tail(&port->list, &tcm->dp_resources);
>>> +}
>>> +
>>>  static void tb_dp_resource_available(struct tb *tb, struct tb_port *port)
>>>  {
>>>  	struct tb_cm *tcm = tb_priv(tb);
>>> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
>>> index 4602c69..cef2fe3 100644
>>> --- a/drivers/thunderbolt/tb.h
>>> +++ b/drivers/thunderbolt/tb.h
>>> @@ -1222,6 +1222,7 @@ struct usb4_port *usb4_port_device_add(struct tb_port *port);
>>>  void usb4_port_device_remove(struct usb4_port *usb4);
>>>  int usb4_port_device_resume(struct usb4_port *usb4);
>>>  
>>> +void tb_dp_resource_available_discovered(struct tb *tb, struct tb_port *port);
>>
>> Why not put this in the .h file next to the other tb_* calls?
>>
> 
Hi Greg,

I forgot to explain that in this function, I have used a structure
"struct tb_cm" which is defined and used only in tb.c file. Hence have
to keep this function in tb.c file.

- Sanjay

> Sure Greg. Will make this change.
> 
> - Sanjay
> 
>> thanks,
>>
>> greg k-h
