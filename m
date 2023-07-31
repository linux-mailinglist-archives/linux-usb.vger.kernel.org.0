Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 442A3769731
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jul 2023 15:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232860AbjGaNId (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jul 2023 09:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233061AbjGaNII (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jul 2023 09:08:08 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEB282112
        for <linux-usb@vger.kernel.org>; Mon, 31 Jul 2023 06:07:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRpbqDkFMD2R6zQq6ErADww9gkXVzaqeuzLgLXue8SMZqJFdVXag3LnBuXpNGxnJHyyNfUPx02KQF1gymPFZpuak8FPdzluzyv3VLsDMcOMKDQrJ4ijAF4YMwQ8gUtVfr2/zhvEK8KvekWNEzUJC+ak/dNT5lk1PPiZl+fv3xj74+0V7VvprCu086KSk6KaxUN5yCTwSiVqpHqjISDtVb4uLLvzqyfndXqhTjf6ek0zwrkp1wJTrNSOo4Ot0jymjJYte1qZB2sPqtehbCWgHkuJAWRnZ6GFXl9A95Y+Jy2plNdgmXwUxAwYKvlt0T/4qEoC552hKjsuVlWiOiIHDYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUe9Hz1pEl78njYY2zZ6C1+b/aQgdoiahE82kc+2dmA=;
 b=WzzfERAXBFfl63Sja+erp6eicW2F1IfsfLdHcuSSch73ngL7jYkFdznkLIjAfmu1Isnpjo1j1A+dSloykKULkUd6bCt9YAfq9qUb4xvxNjB4j6s3puoArqndHnnuWheTqpHuYQkMlCbFTGF4ULIV/SStI//gxPuJoVofIzFLFv5wI8TYBn+rwEfKnprMjrTpJX6du1t5QuHide4LlyWXxfI5eKvGhtvom2Sk46QUbYSLbAYRIWoekh5S0HchmjqQtIuLRa0DKAYWtLxhuj2YyeNsfezwm8OSQuVo/ctlErqUoZXTtdqlrBw8TNoD4JwbSDd7qGNWRGYRJ2kyDYhOOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUe9Hz1pEl78njYY2zZ6C1+b/aQgdoiahE82kc+2dmA=;
 b=JJD8tEos1EdDKj2jgcvZEA28gibUixvs5pABEH5dPjQZOIyUT5LgKMzG3kt5Dhivdch+IW/rstVPVnLJt23vCjLcm4OATzrIsYNOX4xY9ikz+fhgm/xR3TBZwGIlN6GZ05oRKS+rHuaZuTie0RZU6rM4JfWUpIMSUvCr6RRhRCg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6326.namprd12.prod.outlook.com (2603:10b6:8:a3::15) by
 CH3PR12MB7497.namprd12.prod.outlook.com (2603:10b6:610:153::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 13:07:31 +0000
Received: from DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::56a2:c9a6:ab3a:36f1]) by DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::56a2:c9a6:ab3a:36f1%4]) with mapi id 15.20.6631.042; Mon, 31 Jul 2023
 13:07:30 +0000
Message-ID: <16994867-0b94-5ec7-f467-6f9fd6261a96@amd.com>
Date:   Mon, 31 Jul 2023 18:37:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH V2] thunderbolt: Fix Thunderbolt 3 display flickering
 issue on 2nd hot plug onwards
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Sanjay R Mehta <sanju.mehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
        Sanath S <Sanath.S@amd.com>
References: <1689185779-25648-1-git-send-email-sanju.mehta@amd.com>
 <20230731111530.GI14638@black.fi.intel.com>
From:   Sanjay R Mehta <sanmehta@amd.com>
In-Reply-To: <20230731111530.GI14638@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0021.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::19) To DM4PR12MB6326.namprd12.prod.outlook.com
 (2603:10b6:8:a3::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6326:EE_|CH3PR12MB7497:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bde613d-25c2-4ff4-bc25-08db91c718aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nGd73TIBtzQsfbntBW4WZwnW4CkJHsnFrVrbDYYNovTiGrOHtFdsxQbAtfjb/T3xftJ/44gffJwnZt729t6hpb8yOpwZD3R5SV3e2Dg0CXB92ZZxpBaQf/y/Jeei7X31b74urm1uV2XHxoFXPWIwtKQcFW2dPoCqsuZ5CCSWyEtzYgzAWWsZc68m/2k+5JGImEGZBJqe4gSe4t84pDxdr0wq42dp5HywzlcrvIt2oy6IEpn7hWyu5N9Y59dRinJMt8F1XIU7HTflQkDh9L1u37ZW9/UO04bJWRFVzdmgIkenFNq1nhIN8mSkZDAn0EkOIkFsZ0K67zyYGxSVmlhBjcRxrxIqwuDHaY7a7V9cXsYQ7zx9dPlq3itcU/3bdfZ3qhRqwgRinBjqog/SoqWF0ISwAsqI0sugUIlYsMzM0fup9zvIGTvDur0wbfP+5Itr92xlQrMSkJ+UfgPkXl/MJuhxU7WZL88CJSbB9ge2gl0B9l2EHOEA7ldlV8A/pFtRfor8lULeY+87fhy01MMu9ECtf4dNvqg0QbOMbGGOxaklYPCNLWXXhZmRmvIb119FNkRPqs1cj68GetqnxxOm7BpFwWQoP6K8s6CGkA8fXYEinmp5D6+2wLwW46olL2CGfn+1miQwlCJeMHF2eqFQsw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(39860400002)(366004)(376002)(451199021)(38100700002)(36756003)(31696002)(6512007)(478600001)(6666004)(2616005)(6486002)(53546011)(186003)(26005)(6506007)(8936002)(8676002)(5660300002)(4326008)(6636002)(66556008)(66476007)(2906002)(66946007)(31686004)(110136005)(41300700001)(316002)(66574015)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2E5ckcwbFBMalQ4OHpOMStkYlJIYXgwRXVYTVozNDV6THZnUks5WHdqMCtq?=
 =?utf-8?B?TnkwUEtTV3U4SUg3WW8yVi9PakpOWExmaDVKUVphL3h5Qi81MnhwVVRBWm5V?=
 =?utf-8?B?ZXJQNWUvcEVJUm13M1NrZmxuTXRkUzlUdW4vK2N6V2tGOW1NNHRpbmZib1VC?=
 =?utf-8?B?VWw2bDNCcjFRTGI3dmRsRUZBWkZEY3NLZDFFWHV6NUFGdnBMLzd5RmRCcUM1?=
 =?utf-8?B?ZXpuZHIvb0xiWE01RllKRkxxN2NGdzJxTENLd2luL0hoc3g2SEVxaXBzUUh3?=
 =?utf-8?B?Mmxab0dzK2tlajlMZ0dXZWRlY0crUGZMRGhTamZEMzdQM0lOZHc2S0Z2Wkhk?=
 =?utf-8?B?VWdHNU1tRTY2d0pJR2VMbXFCSTdBZGxNNnh3a0JrYVdHeGxVbTZDUnR5WGk1?=
 =?utf-8?B?Uk1yeTA0cm50NTVrTUZ1K1FxNnhjbWNpRmo0QlBjRVdwaElPcFlpU3lFNU9J?=
 =?utf-8?B?UXIxdy9yNys1R0dYeUJmR2FNeHRnOXRiczE4c24wWWtiUXlNOVJLb3JuUnA4?=
 =?utf-8?B?MmdUNGF5RW16RmxpRGxDSi9VNWszczNSbU50Q2VuS2tOYkp5YzMzQ1p1Y2dv?=
 =?utf-8?B?N2wycFhsUnhGRHdOQXlTWFZqM2xsQWpMSm00V2ZTeHh2VFR2ZjlZeG5rVnpE?=
 =?utf-8?B?NXZzTmgyeWc2Ykxmb2V6MC91S2lOWS9LSklNS1VZbjhhZElObU1hYVVZR2Rk?=
 =?utf-8?B?UTc2QVRjMitlZnVPRHBDR0FNZmEva2t6SDlZS3BtLzBGdzJUNi9YVGM2MVJ3?=
 =?utf-8?B?YjZnVTk5QWV5VXRJdUtyZEJTMmFmeVNpWTdDeGtyVEFBdDlzOVh4clNWb1o4?=
 =?utf-8?B?U0RBVm9jdGwzQ2ZqK2tVVitIeHZXUHlhc3dzbUVoMzhPRFJtendMYXBkSC96?=
 =?utf-8?B?SGxhQ0dHUEU5NnJRWllZdU1EVWZBVVdRbEloVEE3d1YrZ3RsZmcwN3A2Z1Vj?=
 =?utf-8?B?RjlZU1IwbSt0QUtYcWFobk5KalFQMEFhY3lmbzNNOG9DT3JBUERsSnhFbDNi?=
 =?utf-8?B?QkRGL2Y2a21ZbU1uSGlVenpoaFBpUjluRWNNTVdSZ01aYSswRXN5UnNJcUZU?=
 =?utf-8?B?Z1VSbmJoa3ZBb1RWRU40eFNDWkJwNjNVcTBwUmtBWVYyNEJUT01kMGdJUjgy?=
 =?utf-8?B?MTF4bTcrSUJwV1hnRmNiQmE2NHBBdk5pMGlGYXdVTVErTXNoWmx1ZFY2Yyty?=
 =?utf-8?B?ZG9zY01EbWRxTUhjU1hoMFFyMEdyRjljbDFxR1hmdmdpU3ZuWWEwSFFsNHpt?=
 =?utf-8?B?cGNiSVdCWGU3QmlaLzhiOVFrNHpUMnRHOHF1bWY0ajdsb01QVW9yTkpiajF6?=
 =?utf-8?B?OFhBajlxdUhUTUNRQlEwU1NvQWRlcVUxS3A0ZUswWnZweW4yZjFHTFZNS0NY?=
 =?utf-8?B?VmVlQXBDOU9OVkpLcy93MkJqRjNJenJhcHBiT0RYSWhONC9SM1pMRWJwR29p?=
 =?utf-8?B?SHl2YWxpcGtmVUcyZFNaMElvUmpULzJpR1ROKzdoQ3RvL1dqalV2cFByNzlQ?=
 =?utf-8?B?amJadVZhSWpqOSt6ZFF4WHplWjJZejhwK0U0VXZIdFV5dWtoUm5USDJoRXVh?=
 =?utf-8?B?UWJvT3Rmb3Z5cFQyb040Q3NKc3dsTlZCWG5Wc3RtM2o0ejRLYmtOQ2g1Yms4?=
 =?utf-8?B?SGFuZm5wUWFuQjRwc243cXpMKytKUFpkczNKTlpmb1FZVEptYTBydUJXa0ZU?=
 =?utf-8?B?Nm4rZ3ZZK3JiZGozaUlBT2tkVTh2clhOaVdvMkpCSldvODNxd0xWRHMvU2or?=
 =?utf-8?B?RDhYQmxBcm0xdWFBRGw0UXJZbFFlL3hWNWpMbWdwdFMrNTJsMUEwRkY3YW55?=
 =?utf-8?B?cmVqbmFoRzFjNFU2S25SQU9DRjhjSG02VDJhZ2wwR2ZBSXRJRFBwK1ZpRC9m?=
 =?utf-8?B?c0lJS3p4Y3B4VWQ4Wk45QVNmQ0xtTFFNZHBEcmE1cld6SDM3eW1GQTI1L2pN?=
 =?utf-8?B?dm43b3E2dUsyQ2dmMzJ6Z0JWVy9FbzM1TUVYWEVRME5RdjhQY1crOUFsZXUz?=
 =?utf-8?B?R1JveXQ4TXJqNk1HUWRrN0lZL3N3NHp3TXJNRDZNUjFXTUU0SWJKdWZGOGdk?=
 =?utf-8?B?OW40QUw2VTBHcy9ianREeHZZYml0NVJLU1BUOUhPN0dBZm5pT2F5WWh4RGRZ?=
 =?utf-8?Q?92EU7vXqy6CeuZa12RNShg1uQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bde613d-25c2-4ff4-bc25-08db91c718aa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 13:07:30.6275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 31ho5S/N4MGAKrXk98aYz7gwkmnsUzOdlqOoYOwYk936x3qBhTZ8MXHUVlheg318TNW4+p8IfnzyuAjWiYxsOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7497
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 7/31/2023 4:45 PM, Mika Westerberg wrote:
> On Wed, Jul 12, 2023 at 01:16:19PM -0500, Sanjay R Mehta wrote:
>> Previously, on unplug events, the TMU mode was disabled first
>> followed by the Time Synchronization Handshake, irrespective of
>> whether the tb_switch_tmu_rate_write() API was successful or not.
>>
>> However, this caused a problem with Thunderbolt 3 (TBT3)
>> devices, as the TSPacketInterval bits were always enabled by default,
>> leading the host router to assume that the device router's TMU was
>> already enabled and preventing it from initiating the Time
>> Synchronization Handshake. As a result, TBT3 monitors experienced
>> display flickering from the second hot plug onwards.
>>
>> To address this issue, we have modified the code to only disable the
>> Time Synchronization Handshake during TMU disable if the
>> tb_switch_tmu_rate_write() function is successful. This ensures that
>> the TBT3 devices function correctly and eliminates the display
>> flickering issue.
>>
>> Co-developed-by: Sanath S <Sanath.S@amd.com>
>> Signed-off-by: Sanath S <Sanath.S@amd.com>
>> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
> 
> Looks good.
> 
> I suppose you want this in -stable too, right?

Thanks. Yes Mika.

- Sanjay
