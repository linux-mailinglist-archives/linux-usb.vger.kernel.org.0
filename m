Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0747651F90C
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 12:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbiEIJvj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 05:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235649AbiEIJbl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 05:31:41 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2106.outbound.protection.outlook.com [40.107.22.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FEC921088A
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 02:27:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRvLPQaudjzpa5e3pKmEJzRVTrUqpcbEgREsTAd32S2sBA/uZ6xH5P6HLyEg25S+FLw4JFkmC5z2ys3wUR6LNLV4tqLaRnHXtgQehC26xNv5b3PK6/p9Mo+tqla6DwaIFaIKCYd0iLyX/LsTHHWl5jlfFueBqC0QnvVTj6z0ty702fg9RTwkRvD1QvJ/iBPlfCYCkv5Je5+j5KdMVYAdHfcoPqeZnA3T9lUl9SPz/ZBkuCUQcTHoRWF/HuR5xrNKWhUwYXGtTVVRTfpSugPKMnVQd/UtupuZ7O9sbpPaSogq1E5IaykbAWeP4IfoSYNA9KbtAq9dCRMFUGelhg6s+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tAjAjaiGOCgWZuEADeXa8q2XD8qLswUhdVQ7dpz0wM=;
 b=DcQtHe425fXkSjWjWCp9EPQrcpCziqZnGlDKGomYNV/ShP4EGjocNFYoeSh3Fi6QaRWqF2pAXpbjdaf9MyLRFVKPqi+/71tzUa755/46fqFysvP70BV5dQ7Vzg7E0GPoJRdu3CPt7w3r2arQABL8YAs4AL4i3IFSoFkt74ioZr2N7IB9X/PdGFZxnWH1lFQla7DJfqP9Bo8t/xdjP/5zVFO/N/69KfNIRHJT371zL2vKzYP844wgxJlxymY54uRPMqGbSl2y0D2hfj0pXmDhwujkf5RO1BXXXob9vKnLFAjj/eiWfIXXnH+EOJ2XSQ1efSE3yXRrV+qKtmqtVae0Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tAjAjaiGOCgWZuEADeXa8q2XD8qLswUhdVQ7dpz0wM=;
 b=l8bLCgHglJhOnc4NCcInu2IHjFYcO2NnCQT4yL2g+b0WPQJoIIkwujgqn8fhwelqZt4k3OB95+quqKV7+K4O+ela/85xx8IOh3mDUkaF7udLGM79SHFrr/XJTf0wdo77f9Iqb5l1+UeAvf1v+JgHQQ8kGgsK8AJUGHQKbczIHLs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS8PR10MB4360.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:2ee::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Mon, 9 May
 2022 09:27:36 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c8f:a38e:4ca3:d480]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c8f:a38e:4ca3:d480%9]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 09:27:36 +0000
Message-ID: <760c5924-1eeb-2ffa-99e5-b24105fc118f@kontron.de>
Date:   Mon, 9 May 2022 11:27:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: (EXT) RE: (EXT) RE: (EXT) Re: [RFC 1/1] usb: chipidea:
 ci_hdrc_imx: disable runtime pm for HSIC interface
Content-Language: en-US
To:     Jun Li <jun.li@nxp.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Peter Chen <peter.chen@kernel.org>
Cc:     Peter Chen <hzpeterchen@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        USB list <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <20220302094239.3075014-1-alexander.stein@ew.tq-group.com>
 <5566202.DvuYhMxLoT@steina-w>
 <PA4PR04MB9640971E2CFB506FF5ED221A89C59@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <1792784.atdPhlSkOF@steina-w>
 <PA4PR04MB96402FC5407EE75EE77D27BF89C69@PA4PR04MB9640.eurprd04.prod.outlook.com>
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <PA4PR04MB96402FC5407EE75EE77D27BF89C69@PA4PR04MB9640.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR08CA0045.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::33) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b72d8b28-c592-4b0d-e2bc-08da319e2788
X-MS-TrafficTypeDiagnostic: AS8PR10MB4360:EE_
X-Microsoft-Antispam-PRVS: <AS8PR10MB436002EF7CED9C95B24E3AFBE9C69@AS8PR10MB4360.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ELy2kcF3kQjzROk2CCjUIyPpoTUc9XhRbsfhYvSB2puFn+4VcldTWb83L2UWKwroYOKocgqAYxIcpviQOxztkWIV9jetokgqhrb27CW2TmlKoJSlQdeqn6GiPRe49q9oGU6tUdvJQXjXwO5Yt7gtu1UoJf0cA/lDE29007L4rrb13FxYPUHpzQp+rB3+x+gu5LWXWQVmv4IOKdvDfVo1m9c6f2ytcJAymPXMdw7byoKGCwhHdu6WkkkGPNAzIbSZibZtfa2/h2FWlRK49r3Zn0/GqWxuGMnlKcyHsImHTKAXcEEJdwHQLYohKTEgEqrY8udo58hwKLi/NEbwqSUowL4ltcbC64slJJpoO8dLPBR/R1qhJLy5AytTuG61Kwl0JOmjmvP70xaLshswHY2PXd4QWIzmaZFSFicczDgo3nbBNjkuxVVwszZxvV5uYKxghlG36LlwIqHMmxqPOCtHnHrgggTYQTnMDqbWnG7qFt2t08BBDQIqc7kcXbk7RmtEhe8Fz0vsSRlLsrEvDfim64UrTv5S2wW5RFXPOzVuOdPXecDSV/sByhEThj75c7P51ORExh13geO386L875UsYpAA2JKNItlsCNmV+36xYNiKw05IR7V4b5GbHGo8I/5hxvwOQLLz+a4FGwFmPK2coM7c+MhpDGqfcfFpJvcTzz+LWy5UH3hH/mge24P1ofKw4wKR5Skx21J4WZOolRkwlq3aXHpIN/WNj7Sh9lJ/6qC+HQuBMd8Us8l4hpVBufIcx+SnoGJ4Yvx/j5IvBzDtvDPBOMVB1cNYl1bhUcbo3fOllrXqosdtbhTNg5JXd8VRCx244TwlkWvMvVQ4PRk80g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(6512007)(2906002)(4326008)(8676002)(36756003)(5660300002)(86362001)(66476007)(44832011)(53546011)(66556008)(26005)(2616005)(31696002)(66946007)(31686004)(30864003)(6486002)(508600001)(966005)(84970400001)(38100700002)(54906003)(110136005)(186003)(316002)(83380400001)(66574015)(7416002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDVTL3B4NFpVOWQ1ZkNleWdCWldKdmlUOGNNV2ZhWTNGeFRUS2R1bnUwRU9q?=
 =?utf-8?B?NzAySUswbVRhSWZMV2JnZ1hYeUZ6QVZRMk5jeU0xT2VueGxwenBKSFA3R0Jt?=
 =?utf-8?B?YzArK1diYWpZK0ZYekRzU3lpM0FydTVPV1U3dEluYjBlQXh6VG5RU3Rkd1gy?=
 =?utf-8?B?c0tMQmJDbHlWcmIwZlJzSGZZNnA1cjNvMnJJamdMWGIxb3NvZnB5dTFQTWZP?=
 =?utf-8?B?MnNjd00vS1ZsRUJ1ZmNrY1Q4YUJIK0ZCSlgrcnFSb3djQUVndlk2VmhLZFZU?=
 =?utf-8?B?MW9wdkZMckVJci9BMFlqTmIxU3B2U1BZK2hyREM4c2FTUEYvRHlMRDhKUGdQ?=
 =?utf-8?B?MnQrRGNXUjJFUjN3dlc1c1AvaTZzOEIyQjhyVE9UY1p0NTQ1eGZ3ZWt0RVAx?=
 =?utf-8?B?cUNPQ1UrVzg2cWJyc0FIbHVJNkR1bXBPQWt4bDFrMmoxUkY2ZzcxK0NBL0Rv?=
 =?utf-8?B?TnJkSm05SWpvOFNHYjBIOElkeUlVNStaQWJMNndpaVZqMUgrbnVodXZ1SGRl?=
 =?utf-8?B?MnV0eUpzRFJ2TzlIZ1NTajFMRmZzMXFFYmhGUGgwdm9yM1Qrc3RoZzhyRmNM?=
 =?utf-8?B?UVQ2cG4xNkU2Ti9BMlJ5R0NKb25DYkVCcnp2aEV0SUMxcXljQU9LQkV5SXJP?=
 =?utf-8?B?WXI4emZKOFJJNk8wU3h3S2QyeDY5OEh6S3ZKVGdvenhwY0xsQWV2amtlVm9Z?=
 =?utf-8?B?VmY0Q2pIUm15WGs1blBwWUdMWHB3K1lhUXM5eTNHb045RmFLNXVZdVkvbEt6?=
 =?utf-8?B?QS9yTjk3N2NKcVBEeGhITGU4ZmlJMDJWeGFOQW5kcTNMOW5ObDNSZUI5NmZu?=
 =?utf-8?B?L3FoOHBhNkZ3SUppeU9yK2VyVG5sKzV6dEQ3aUh6UDR4aXQxbkZ4N1ZGblhF?=
 =?utf-8?B?QVJ3RnI5Vm1henRCeHBTQ3VOU0JMVEFCWjZnMi8wSDgvMFRXZDVWVldlR1VS?=
 =?utf-8?B?SnkrNzU4VkNNUm0zaGZqVWRTWEg4MkIydERTNmlxUlBkZ1N4V3BVb0Q1d0hW?=
 =?utf-8?B?MVFLVnd6QUNJOU9RM24zcCs1cnlqQ2NsR01rQVQ0WVlDeTlIcUVNYnh3aFh1?=
 =?utf-8?B?L01yeGN3OG9vVm1sME85SExnZ0FMbEVwb0V1djJGRS80NGRnS2QvaHh5OE14?=
 =?utf-8?B?SWhuOENHOFlaa0R4K3dVekRTMGVoL2xTRWEyQUxNNDYySjEvMUZpZS9CcDUy?=
 =?utf-8?B?S2N0akswZ05ka3IxK2lXWWJYTXhheFcxeXArQmRZRzlSekh2RHl1WVozcFY3?=
 =?utf-8?B?c0pjYjA2cFlXRTEwSnFZalRRckFObnJ2NG10NHJmT0VoVkVMdXF6TDVnUC9m?=
 =?utf-8?B?SExzaTNRV2Uvb0RyK1MvZWRwOEphUEExN2xpQTlBemQ5SThwV3docHpFL2Fp?=
 =?utf-8?B?anZuSkkzL3FJWTZSQWVhTTdRd2VBVUpHR3BVMWRPYXUwcUxvYUd5b2Uxa0VR?=
 =?utf-8?B?WDZwQTRScGtWbExNV3BzVHdTMlloaFR5S0Z5NnlDOHV1ajliL3hLTDdTUS92?=
 =?utf-8?B?QkZIVFdDbWhnVXI0bFVFTnZabENldEM3L1k0aTF6S0pWWkQwbE9oSStXMVhx?=
 =?utf-8?B?NnM1WWlEZXZLZ1VyUU5xcWJQTVA3bitMSURDM2d0S1FhWGtGdGg2SkJyUDJD?=
 =?utf-8?B?UTR2NVJ5RWhOaDVlVG1nTzV0Szgwckkxd0FIUlY2L0ZaZGxoT1Z4M0hQVVhH?=
 =?utf-8?B?Z0pQeWRjQ2R3c0RsNVFvMWdSeExJZFp3dWdqQWYxUVN0UDhHU09wRTluc0pF?=
 =?utf-8?B?MFMrMGYzSG9qNlU3RmpEVWdVL2J1YkVuamdISnNDVW4wVVR4TWxwZDJ0MWNw?=
 =?utf-8?B?UE5OQmd0dG13VU5nMzVqdWt2US9LQ0dpUzZsMVNMZXlBeW9CMnNJOVc3WG5G?=
 =?utf-8?B?eUNDN3c1WU0rUGpuWUZnWnBJQlhzblJxUTd5RXZGQ20rSDZXdnlGN1UzWjRs?=
 =?utf-8?B?Z25BV0cxTU5vSXlxSXp1ZzY2QldjRHUrUlBFajVLN05DSGdXV3ltYjE4U0Rt?=
 =?utf-8?B?RlROT2U2M0ZUT3JKazJjQlZSUDhYTTlnTy9BUjRDcEEzZ1UxZXN6SzVsRDAx?=
 =?utf-8?B?Ym0rMG1mT3BnK0dIQWtRQlIyNllqV0VKamhDU1pXTHBMWjNzMXZ2YTE0d0tP?=
 =?utf-8?B?NGxPT2YrV1hSMnVjVm5iOUgxQ2IvVGVKdHRRaHlMRENUTkhjdWhINUVvdGJ6?=
 =?utf-8?B?UlJMVlRoRXY5VWh4Sk5VQjZTajBZUVQyTk1IK2ZKK1JXM2hIbVNZMTVRUHg5?=
 =?utf-8?B?WWdvS3d2ekhIbHRPV1I4YTRBZ0hFK293OVNDZSs2NGRMZXBRN3BNczlxWmJi?=
 =?utf-8?B?SFBzdG9WVGJkY1d0bUsxRlAvT3QzYS9UbXBtVGdIV3E3dGtFL29EajZjZHV2?=
 =?utf-8?Q?v74oan7/u7mDhI3tI4VoCt+7FQ+ubcQYNozpu?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b72d8b28-c592-4b0d-e2bc-08da319e2788
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 09:27:36.5316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yTq7nafwULhmVMFlh1U96n4A2UVq9L5LI7zh1TRgVNpITPbZnjjf2VHK3rTq2hoYSrcrIgp4DHwh17v4PdIimLR+cOHYWhVKQ88q2URsSvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB4360
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URI_HEX autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am 09.05.22 um 10:16 schrieb Jun Li:
> 
> 
>> -----Original Message-----
>> From: Alexander Stein <alexander.stein@ew.tq-group.com>
>> Sent: Friday, May 6, 2022 3:38 PM
>> To: Peter Chen <peter.chen@kernel.org>; Jun Li <jun.li@nxp.com>
>> Cc: Peter Chen <hzpeterchen@gmail.com>; Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
>> Hauer <s.hauer@pengutronix.de>; Fabio Estevam <festevam@gmail.com>;
>> Pengutronix Kernel Team <kernel@pengutronix.de>; dl-linux-imx
>> <linux-imx@nxp.com>; USB list <linux-usb@vger.kernel.org>;
>> linux-arm-kernel@lists.infradead.org
>> Subject: Re: (EXT) RE: (EXT) RE: (EXT) Re: [RFC 1/1] usb: chipidea:
>> ci_hdrc_imx: disable runtime pm for HSIC interface
>>
>> Am Freitag, 6. Mai 2022, 09:09:22 CEST schrieb Jun Li:
>>>> -----Original Message-----
>>>> From: Alexander Stein <alexander.stein@ew.tq-group.com>
>>>> Sent: Wednesday, May 4, 2022 3:06 PM
>>>> To: Peter Chen <peter.chen@kernel.org>; Jun Li <jun.li@nxp.com>
>>>> Cc: Peter Chen <hzpeterchen@gmail.com>; Greg Kroah-Hartman
>>>> <gregkh@linuxfoundation.org>; Shawn Guo <shawnguo@kernel.org>;
>>>> Sascha Hauer <s.hauer@pengutronix.de>; Fabio Estevam
>>>> <festevam@gmail.com>; Pengutronix Kernel Team
>>>> <kernel@pengutronix.de>; dl-linux-imx <linux-imx@nxp.com>; USB list
>>>> <linux-usb@vger.kernel.org>; linux-arm-kernel@lists.infradead.org
>>>> Subject: Re: (EXT) RE: (EXT) Re: [RFC 1/1] usb: chipidea: ci_hdrc_imx:
>>>> disable runtime pm for HSIC interface
>>>>
>>>> Helllo,
>>>>
>>>> Am Dienstag, 12. April 2022, 13:36:55 CEST schrieb Jun Li:
>>>>>> -----Original Message-----
>>>>>> From: Alexander Stein <alexander.stein@ew.tq-group.com>
>>>>>> Sent: Monday, April 11, 2022 9:52 PM
>>>>>> To: Peter Chen <peter.chen@kernel.org>; Jun Li <jun.li@nxp.com>
>>>>>> Cc: Peter Chen <hzpeterchen@gmail.com>; Greg Kroah-Hartman
>>>>>> <gregkh@linuxfoundation.org>; Shawn Guo <shawnguo@kernel.org>;
>>>>>> Sascha Hauer <s.hauer@pengutronix.de>; Fabio Estevam
>>>>>> <festevam@gmail.com>; Pengutronix Kernel Team
>>>>>> <kernel@pengutronix.de>; dl-linux-imx <linux-imx@nxp.com>; USB
>>>>>> list <linux-usb@vger.kernel.org>;
>>>>>> linux-arm-kernel@lists.infradead.org
>>>>>> Subject: Re: (EXT) RE: (EXT) Re: [RFC 1/1] usb: chipidea: ci_hdrc_imx:
>>>>>> disable runtime pm for HSIC interface
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> Am Samstag, 9. April 2022, 06:49:54 CEST schrieb Jun Li:
>>>>>>>> -----Original Message-----
>>>>>>>> From: Peter Chen <peter.chen@kernel.org>
>>>>>>>> Sent: Saturday, April 9, 2022 10:20 AM
>>>>>>>> To: Alexander Stein <alexander.stein@ew.tq-group.com>
>>>>>>>> Cc: Peter Chen <hzpeterchen@gmail.com>; Greg Kroah-Hartman
>>>>>>>> <gregkh@linuxfoundation.org>; Shawn Guo
>>>>>>>> <shawnguo@kernel.org>; Sascha Hauer
>>>>>>>> <s.hauer@pengutronix.de>; Fabio Estevam
>>>>>>>> <festevam@gmail.com>; Pengutronix Kernel Team
>>>>>>>> <kernel@pengutronix.de>; dl-linux-imx <linux-imx@nxp.com>;
>>>>>>>> USB list <linux-usb@vger.kernel.org>;
>>>>>>>> linux-arm-kernel@lists.infradead.org
>>>>>>>> Subject: Re: (EXT) Re: [RFC 1/1] usb: chipidea: ci_hdrc_imx:
>>>>>>>> disable runtime pm for HSIC interface
>>>>>>>>
>>>>>>>> On 22-03-29 10:14:36, Alexander Stein wrote:
>>>>>>>>> Hello Peter,
>>>>>>>>>
>>>>>>>>> Am Dienstag, 15. März 2022, 02:23:23 CEST schrieb Peter Chen:
>>>>>>>>>> On Wed, Mar 2, 2022 at 5:42 PM Alexander Stein
>>>>>>>>>>
>>>>>>>>>> <alexander.stein@ew.tq-group.com> wrote:
>>>>>>>>>>> With the add of power-domain support in commit
>>>>>>>>>>> 02f8eb40ef7b
>>>>
>>>> ("ARM:
>>>>>>>> dts:
>>>>>>>>>>> imx7s: Add power domain for imx7d HSIC") runtime
>>>>>>>>>>> suspend will disable the power-domain. This prevents
>>>>>>>>>>> IRQs to occur when a new device is attached on a downstream
>> hub.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Alexander Stein
>>>>>>>>>>> <alexander.stein@ew.tq-group.com>
>>>>>>>>>>> ---
>>>>>>>>>>> Our board TQMa7x + MBa7x (i.MX7 based) uses a HSIC
>>>>>>>>>>> link to mounted
>>>>>>>>
>>>>>>>> USB HUB
>>>>>>>>
>>>>>>>>>>> on usbh device. Cold plugging an USB mass storage
>>>>>>>>>>> device is working
>>>>>>>>
>>>>>>>> fine.
>>>>>>>>
>>>>>>>>>>> But once the last non-HUB device is disconnected the
>>>>>>>>>>> ci_hdrc device
>>>>>>>>
>>>>>>>> goes
>>>>>>>>
>>>>>>>>>>> into runtime suspend.
>>>>>>>>>>
>>>>>>>>>> Would you please show the difference between cold boot
>>>>>>>>>> and runtime suspend after disconnecting the last USB device?
>>>>>>>>>>
>>>>>>>>>> - Power domain on/off status for HUB device
>>>>>>>>>> - Runtime suspend status at /sys entry for HUB device
>>>>>>>>>> - "/sys/..power/wakeup" /sys entry  for HUB device
>>>>>>>>>
>>>>>>>>> I hope I got all entries you requested.
>>>>>>>>>
>>>>>>>>> For reference this is the bus topology:
>>>>>>>>> lsusb -t
>>>>>>>>> /:  Bus 02.Port 1: Dev 1, Class=root_hub,
>>>>>>>>> Driver=ci_hdrc/1p, 480M
>>>>>>>>> /:  Bus 01.Port 1: Dev 1, Class=root_hub,
>>>>>>>>> Driver=ci_hdrc/1p, 480M
>>>>>>>>>
>>>>>>>>>     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
>>>>>>>>>     |
>>>>>>>>>         |__ Port 2: Dev 3, If 0, Class=Mass Storage,
>>>>>>>>>
>>>>>>>>> Driver=usb-storage,
>>>>>>>>
>>>>>>>> 480M
>>>>>>>>
>>>>>>>>> Bus 2 is a different connector and doesn't matter here.
>>>>>>>>> I'm disconnecting
>>>>>>>>
>>>>>>>> 'Dev
>>>>>>>>
>>>>>>>>> 3' in this scenario.
>>>>>>>>>
>>>>>>>>> After boot up with the bus as shown above:
>>>>>>>>> $ cat /sys/bus/usb/devices/1-1/power/wakeup
>>>>>>>>> disabled
>>>>>>>>> $ cat /sys/bus/usb/devices/1-1/power/runtime_status
>>>>>>>>> active
>>>>>>>>> $ cat
>>>>>>>>> /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
>>>>>>>>> on
>>>>>>>>>
>>>>>>>>> After disconnecting Dev 3 from the bus ('usb 1-1.2: USB
>>>>>>>>> disconnect, device number 3' in dmesg) the status changes
>>>>>>>>> as follows (without the patch):
>>>>>>>>> $ cat /sys/bus/usb/devices/1-1/power/wakeup
>>>>>>>>> disabled
>>>>>>>>> $ cat /sys/bus/usb/devices/1-1/power/runtime_status
>>>>>>>>> suspended
>>>>>>>>> $ cat
>>>>>>>>> /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
>>>>>>>>> off-0
>>>>>>>>>
>>>>>>>>> For the record, when applying the posted patch this
>>>>>>>>> changes
>>>>>>>>> into:
>>>>>>>>> $ cat /sys/bus/usb/devices/1-1/power/wakeup
>>>>>>>>> disabled
>>>>>>>>> $ cat /sys/bus/usb/devices/1-1/power/runtime_status
>>>>>>>>> suspended
>>>>>>>>> $ cat
>>>>>>>>> /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
>>>>>>>>> on
>>>>>>>>
>>>>>>>> Okay, I think the problem here is the power domain for USB
>>>>>>>> controller is off at runtime, but USB controller/PHY needs
>>>>>>>> to detect the USB wakeup signal at runtime, so the USB
>>>>>>>> controller/PHY's power domain should be not off. The proper
>>>>>>>> change may keep power domain on at runtime, and the power
>>>>>>>> domain
>>>>
>>>> could be off at system suspend.
>>>>
>>>>>>> Can this "hsic phy power domain off breaks wakeup" be confirmed?
>>>>>>> Like with some hack to move hsic phy power domain on some
>>>>>>> other device
>>>>>>> node:
>>>>>>>
>>>>>>> non-usb-node {
>>>>>>>
>>>>>>>         ...
>>>>>>>         power-domains = <&pgc_hsic_phy>;
>>>>>>>         status = "okay";
>>>>>>>
>>>>>>> };
>>>>>>>
>>>>>>> Just make sure this non-usb-node to be runtime active when do
>>>>>>> hsic hub test.
>>>>>>
>>>>>> Thanks for that suggestion. I apparently does work. Using the
>>>>>> this small patch
>>>>>>
>>>>>> --->8---
>>>>>> diff --git a/arch/arm/boot/dts/imx7-mba7.dtsi
>>>>>> b/arch/arm/boot/dts/imx7- mba7.dtsi index
>>>>>> b05f662aa87b..cba2f9efa17e
>>>>>> 100644
>>>>>> --- a/arch/arm/boot/dts/imx7-mba7.dtsi
>>>>>> +++ b/arch/arm/boot/dts/imx7-mba7.dtsi
>>>>>> @@ -580,6 +580,7 @@ &uart3 {
>>>>>>
>>>>>>         assigned-clocks = <&clks IMX7D_UART3_ROOT_SRC>;
>>>>>>         assigned-clock-parents = <&clks IMX7D_OSC_24M_CLK>;
>>>>>>         status = "okay";
>>>>>>
>>>>>> +       power-domains = <&pgc_hsic_phy>;
>>>>>>
>>>>>>  };
>>>>>>
>>>>>>  &uart4 {
>>>>>>
>>>>>> --->8---
>>>>>>
>>>>>> The HSIC power domain is also attached to to uart3.
>>>>>>
>>>>>> $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/devices
>>>>>> /devices/platform/soc/30800000.bus/30800000.spba-bus/30880000.se
>>>>>> rial /devices/platform/soc/30800000.bus/30b30000.usb
>>>>>> /devices/platform/soc/30800000.bus/30b30000.usb/ci_hdrc.1
>>>>>> $ cat /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
>>>>>> on
>>>>>> $ echo on >
>>>>>> /sys/devices/platform/soc/30800000.bus/30800000.spba-bus/
>>>>>> 30880000.serial/power/control
>>>>>> $ lsusb -t
>>>>>> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=ci_hdrc/1p,
>>>>>> 480M
>>>>>> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ci_hdrc/1p,
>>>>>> 480M
>>>>>>
>>>>>>     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
>>>>>>     |
>>>>>>         |__ Port 2: Dev 3, If 0, Class=Mass Storage, Driver=,
>>>>>> 480M
>>>>>>
>>>>>> [USB
>>>>>>
>>>>>> disconnect] $ cat
>>>>>> /sys/kernel/debug/pm_genpd/usb-hsic-phy/current_state
>>>>>> on
>>>>>
>>>>> Just want to be sure this was done with hdrc imx runtime PM enabled.
>>>>>
>>>>>> [USB reconnect]
>>>>>> $ lsusb -t
>>>>>> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=ci_hdrc/1p,
>>>>>> 480M
>>>>>> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ci_hdrc/1p,
>>>>>> 480M
>>>>>>
>>>>>>     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
>>>>>>     |
>>>>>>         |__ Port 2: Dev 4, If 0, Class=Mass Storage, Driver=,
>>>>>> 480M
>>>>>>
>>>>>> Hot plug detecting still works as you can see the USB device
>>>>>> number increased.
>>>>>>
>>>>>> For the records, there is no difference to this patch in
>>>>>> removing the power domain from USB HSIC device. I just wanted to
>>>>>> keep the diff small.
>>>>>
>>>>> This is good enough to confirm this, thanks.
>>>>>
>>>>> I don't have a HW with HSIC enabled for test, and I am not sure
>>>>> the initial state of power domain is on, can something like below
>>>>> deserve a
>>>>
>>>> try?
>>>>
>>>>> diff --git a/drivers/soc/imx/gpcv2.c b/drivers/soc/imx/gpcv2.c
>>>>> index
>>>>> 3cb123016b3e..f5467ef18e33 100644
>>>>> --- a/drivers/soc/imx/gpcv2.c
>>>>> +++ b/drivers/soc/imx/gpcv2.c
>>>>> @@ -416,6 +416,7 @@ static const struct imx_pgc_domain
>>>>> imx7_pgc_domains[] = { [IMX7_POWER_DOMAIN_USB_HSIC_PHY] = {
>>>>>
>>>>>                 .genpd = {
>>>>>
>>>>>                         .name      = "usb-hsic-phy",
>>>>>
>>>>> +                       .flags     = GENPD_FLAG_RPM_ALWAYS_ON,
>>>>>
>>>>>                 },
>>>>>                 .bits  = {
>>>>>
>>>>>                         .pxx = IMX7_USB_HSIC_PHY_SW_Pxx_REQ, @@
>>>>> -930,7
>>>>>
>>>>> +931,7 @@ static int imx_pgc_domain_probe(struct platform_device
>>>>> *pdev) regmap_update_bits(domain->regmap, GPC_PGC_CPU_MAPPING,
>>>>> domain->bits.map, domain->bits.map);
>>>>>
>>>>> -       ret = pm_genpd_init(&domain->genpd, NULL, true);
>>>>> +       ret = pm_genpd_init(&domain->genpd, NULL,
>>>>> + !(domain->genpd.flags &
>>>>> GENPD_FLAG_RPM_ALWAYS_ON)); if (ret) {
>>>>>
>>>>>                 dev_err(domain->dev, "Failed to init power domain\n");
>>>>>                 goto out_domain_unmap;
>>>>
>>>> This does indeed the trick. But AFAICS the downside is that the
>>>> powerdomain is enabled, even if USB is not used. Not sure if this is
>>>> acceptable though.
>>>
>>> I think GENPD_FLAG_RPM_ALWAYS_ON is the right thing to do if the HSIC
>>> port need the power domain on to detect remote wakeup, what's the
>>> exact meaning of "USB is not used"?
>>
>> Exactly, GENPD_FLAG_RPM_ALWAYS_ON is the right thing to to iff the HSIC port
>> needs the powerdomain. But what about the case when HSIC is not enabled at
>> all? That's what I meant by "USB is not used".
>> AFAICS setting GENPD_FLAG_RPM_ALWAYS_ON enables the powerdomain
>> unconditionally from any user.
> 
> If HSIC is not enabled at all, seems the power domain of it will not be touched
> by kernel, so there maybe mismatch between the actual HW state and the SW state,
> but this is another topic.
> 
> For this HSIC case, a second thought I think the better solution maybe
> correct the power domain to its right user, since this power domain
> is for phy, so:
> 
> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
> index 008e3da460f1..039eed79d2e7 100644
> --- a/arch/arm/boot/dts/imx7s.dtsi
> +++ b/arch/arm/boot/dts/imx7s.dtsi
> @@ -120,6 +120,7 @@ usbphynop3: usbphynop3 {
>                 compatible = "usb-nop-xceiv";
>                 clocks = <&clks IMX7D_USB_HSIC_ROOT_CLK>;
>                 clock-names = "main_clk";
> +               power-domains = <&pgc_hsic_phy>;
>                 #phy-cells = <0>;
>         };
>  
> @@ -1153,7 +1154,6 @@ usbh: usb@30b30000 {
>                                 compatible = "fsl,imx7d-usb", "fsl,imx27-usb";
>                                 reg = <0x30b30000 0x200>;
>                                 interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> -                               power-domains = <&pgc_hsic_phy>;
>                                 clocks = <&clks IMX7D_USB_CTRL_CLK>;
>                                 fsl,usbphy = <&usbphynop3>;
>                                 fsl,usbmisc = <&usbmisc3 0>;
> 
> Could you please try if this can work for you as well?
> 
> Li Jun  

I just want to point out, that on i.MX8MM I'm seeing a similar or even
the same issue for non-HSIC ports. See this thread for more information:
http://lists.infradead.org/pipermail/linux-arm-kernel/2022-April/733370.html.
