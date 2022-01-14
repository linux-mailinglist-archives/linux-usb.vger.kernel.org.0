Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF7F48F0B3
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jan 2022 20:56:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233929AbiANT4e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Jan 2022 14:56:34 -0500
Received: from mail-vi1eur05on2077.outbound.protection.outlook.com ([40.107.21.77]:8544
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229471AbiANT4d (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 Jan 2022 14:56:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKvf58JHmKFeazOVlGaofZ+AjTMEZ0glu3+U+2+XmYyHF+NQu1YWigDeWLqnKGxmwHZ4t4Lk2VSGFx3Cmnj7mrIFPJQWm2/LfYzq0jMM+Dl/tOxtu8fuGKkzvWXNPkW116JJrF7GzW+WLn3LVhXSq8Fu4NDnSI5loiS/GqNtZnJzunQNtYUA0QtgYYEkkVnmEG6Q7crwiRLNZ9sZ5SLDoqD0NJNZ58ID519wraCLmbXTDLD8Oll0KAYHMHpLlBLgQoizWvzJGeneclkz1gvVI2y7mSKKBIULoNBMip519w4QWhZvEouw5eMmgEETxCrYzWOpjho5uw6Zn4P8J25AmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIFJMlXg2LMySGIhBjahTLqa2IZg7lL3W2oN9EflQFY=;
 b=fBk87ITrvBfAj8koJU6T/7r0BirfmCU2unZ8ivfQB1GsY261+TftBS//0Hirl+bP4o3VNP8mIkDwVKsL7cjK8BZTEiXy6/GQLXVPU2yJnBzdzBx6uCt/9d73Mv7E7kjEJazsgE88zA4HYaCahKeHsGUIBw1Yz5JAYfv13KEr3uc1anHEVhkty0OSfZ2WRqT6na21Pw2aElBDmChx7M1KQbR9A521eyIqqjdChgvE+LWPwxzEXXImRM6STWJ3qngFVOMbnwzZU024EQP0Z09AkTmAdMqGdKQKamvEa2bhkGoIlKYO/Il9tPEPfAL7ldSKokiNVk2dXJ/S559B1p4ckQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIFJMlXg2LMySGIhBjahTLqa2IZg7lL3W2oN9EflQFY=;
 b=gU3k8b6ZB3Uq0U1PV/Vy/+6+FNEZWRanF6157nIhRC7cqbB06SmtbO7QuI50AAsN60tJG7XY1PZd2N2zkG3wKRM07gmQ0cwl+CmFrbUniF+5/rlI34evPAUVKB4+WWVLX6zkdEOnTnZpPRAnLEu0Xse36CYVTONuBSZo9kXY/lg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by HE1PR0302MB2763.eurprd03.prod.outlook.com (2603:10a6:3:f3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Fri, 14 Jan
 2022 19:56:28 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::d47e:81b0:256:3005]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::d47e:81b0:256:3005%4]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 19:56:28 +0000
From:   Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v4 4/5] usb: dwc3: add reference clock FLADJ configuration
To:     Robert Hancock <robert.hancock@calian.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mounika.grace.akula@xilinx.com" <mounika.grace.akula@xilinx.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "Thinh.Nguyen@synopsys.com" <Thinh.Nguyen@synopsys.com>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "manish.narani@xilinx.com" <manish.narani@xilinx.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
References: <20220114044230.2677283-1-robert.hancock@calian.com>
 <20220114044230.2677283-5-robert.hancock@calian.com>
 <cf9ec164-7d9f-8209-5d2a-8e8c26a7be7e@seco.com>
 <d416c324097a4feab4fa38d64a770d2a099d36c8.camel@calian.com>
Message-ID: <40b11f02-676f-a707-f27a-113c3ee3919e@seco.com>
Date:   Fri, 14 Jan 2022 14:56:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <d416c324097a4feab4fa38d64a770d2a099d36c8.camel@calian.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR16CA0035.namprd16.prod.outlook.com
 (2603:10b6:208:134::48) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c93829a-f8c9-449d-becd-08d9d797f3d7
X-MS-TrafficTypeDiagnostic: HE1PR0302MB2763:EE_
X-Microsoft-Antispam-PRVS: <HE1PR0302MB27630453452854A5ED3263C096549@HE1PR0302MB2763.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r1UGyDUwGnNw9Qp3q8G2R+bkdEFHDMMsoylbrcDJt3VoMXzPqC5oZcGFtznuAUl5m+D6vjkwhYAH02L9o9EkcVhoIx9/sVrGghSqLnjDqTXgiwtrsIDGnLGGo/O1GO/Cax9pMdncd/C/qrQbeilqGcVqbF0HB41cjdETlQraQQkN6sFbCXfvlVq9UrSjIfdYRBPhLoORKuwR9rX1GzpitnKSjjX5rDAlr3OcjtnYLJrnxyMiRnyvJMA/NSYjwrGUz5oYWZjeGhAtwmH30TBY7izYAGAZZhvj+wRoy26DZj5XtGocI1Uwg6Z7wuvxuLxwkGoMYBD1G/Mf+gTl0C4Y3cEGKvEC9zPJONYTWOsACRBoXCAOQpeGx/eioc6N8rVCy/92Le46PLzUcHDgoisllPRlnHIOHJuhZjddwQp6fUo7kJfPwqMyfFyusE+dFNF+VMCSnHGSFgJ4eBpseAsPT77IWhWwpaLtcIgIdqonhHuciDP9d8+liP9MJRKVEwQosiiJgOGrvi17949/8GI7Xil2iGp/L+uvB4U8uIU3/uLwz3C7ih0uFAbt99IOQ+nva5eNDrVLWygbu18jLJ3bzyn01ZqexFWRa0LJvYOdLJlVCn0thzc4N22Dy6RrYJY6Rxl4xr+UPkkhz9dT/0X9311qGmL/4vL7zbXcL6IAuBRZZwYq1ajuN5/QdJFuO9vqOJ6MqODCfiYn8n8x2q+3of3TWtwtaOSQ6/S7mM6kAI/Rlas5ksq1cyfSpQhqJFShin48rtIXKwBr9h4VAB88Ag==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(86362001)(6666004)(54906003)(110136005)(186003)(66946007)(36756003)(26005)(4326008)(83380400001)(6506007)(53546011)(2616005)(31686004)(44832011)(5660300002)(52116002)(31696002)(38350700002)(8676002)(2906002)(38100700002)(7416002)(316002)(6486002)(508600001)(6512007)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHduZm9iOWdCS1ZVdEUvdndLTDZma3JwWWpTZVpFZ2pIUjQzNHJIZnR0QWts?=
 =?utf-8?B?ZCtIYWRhUjU4NUFoZ1JUQk95ZUpFYnk3djVEVmdFeGJYRVpldmdzeVBzK2Rl?=
 =?utf-8?B?SFBJOHNuQlZFQUpNWVM4WGtoekg4MG5kaUE2SzhvYnp4d0ZBRTZ2MDZ5dnp3?=
 =?utf-8?B?V3M1TXJzMVZoeDVJMGVMYXVWUDF1bGdMQ1JndmdPaFNoQkFWOGR6VjdwU1JE?=
 =?utf-8?B?TG91cXgxN2w2S1NqSitrNXp0MkpCdGx1RHZVY1BTOHNYd0pqckQ1cEdDNlpv?=
 =?utf-8?B?UzNtTWphWmRTNDlBb2JKUk9lRW5JeG5XUHgxQUlTUWUyajVaQmJ3a2RISFlL?=
 =?utf-8?B?a3hPUmhzU1BUOFdrZ21QS2NQeDVac2RwSnd1ZEV2eC9xVm5LVnliVWs0Q3Ju?=
 =?utf-8?B?dUYzVGdpMkk3akRPQ2Y0SVlCZXFNb1RCOUQ3SXFpekM3R0g4eUdMaVF2cnB3?=
 =?utf-8?B?RUdiSVNMaTFJbkk5dEJpTkxId3JjQnJTWkV5VmFMRWM0SHJLWU1YcEVMRWdI?=
 =?utf-8?B?S3E2NVZWZUJaaG15OE82N3ByWWRVaEJlTU9VTkJLZGt1UjFmNERGb2txeWRV?=
 =?utf-8?B?elpMMzRLamdCTzZZQnR1NDlxUG01bXBJU2JOR0xxa3NUUWd0UGJLcEROdG5s?=
 =?utf-8?B?QlBnQm5VeHNBQ3RUMnZPcEsrTXJvNVpXVUpXQ3A2VkxZcSs5STU3OVRZMUVa?=
 =?utf-8?B?Uk1yN2N5K0Z2S3cvNE80ZStaYXE1OWRkSnV0YXJWbDlMOVhBakkyOXRjVkZr?=
 =?utf-8?B?NjNibVE5RmRudnhvdklLTFpnVGx0WmZjM2VkWWNVYWUxMFMxSFVhWWtWd1FB?=
 =?utf-8?B?VHNzRTdrdmdtb1VXWG1WbHpPQUE3c1ZJcEhqMXpHT1gyU2xUc3UyOXVFQnVp?=
 =?utf-8?B?LzVXZHB4Q1ZoeGJRR2VTMVpPLzA1bW5GMHNlT2hub3czVE9BblRaR3BoRGdz?=
 =?utf-8?B?eWhyY2lVUVNlU1hIWXdCRW5KaXpSbExrWlpSVXRKUVNkY2IxWEMxaHZFSW5s?=
 =?utf-8?B?T3c3QjFSbWdkVG0xQ1hKazdkWWJnZlU2bUdOUTF1Zk9XYXVrdWFWZjdTMklo?=
 =?utf-8?B?MVlpVWQ2MWEyVGlEd211OG95VmVwdC96Rk10WExydmFyekJkaE5mYUVlYWFZ?=
 =?utf-8?B?cEwxcGdBZmNPT1NqZEM1azBqUEdRbjBkbWMwN0IvQmIrampqUlV2enN4U0tY?=
 =?utf-8?B?SHQyUkUyWXNma2tjQjltUjZQRmFwcnRtQXM1S09UMkxlbm5yMHh4U2lVZVlB?=
 =?utf-8?B?NE5kY2EzZUxacFd6TnZpTUU4UFMyUDRGSzhEQ0QrM0QwNGs2R2VzKzZZYnNr?=
 =?utf-8?B?WU1vTTdrZzdHSnZ4UHNkeURsYTRiMmJTaU9PUzVqZTYzSTQ0TG1ZUXdPT0RJ?=
 =?utf-8?B?ekxPRk9XUHZxM1hyZ3hjNll2RjFKTTNKZFE4bXE0bEVvWnJKdmJucDU1M2hB?=
 =?utf-8?B?TVpPaTVXL1U5OGgyU0tFMVVoNi9TWnJxRjFJNEo4Z2dack44enJ1MWg1ZXc2?=
 =?utf-8?B?eTBSYVpPd1dxVmhNMTJleVBMamJtOEI5emFLSFR5VVlxaEhMUnlDQVJmR2JK?=
 =?utf-8?B?N2N5VVBTbGpKVjFvUFVMVnBXMmlIcnNPeEZhWjV1ek9IKzNnRTVEVUI3UDNy?=
 =?utf-8?B?NW9uUUhPdXE3U1cwZHJpd1Q4SXc0NkU0N0ExQ21VcytWTjZzcFg3THlDQmVi?=
 =?utf-8?B?V1ZtZnF1M1NkclpsQS9oUkxQVGVkSlU3VVV5T0wvY0cvWnRYbFYxR3NPVDZy?=
 =?utf-8?B?RlFHT0NBeUFXV25KNHNtb0N2bzdKSm1TclVERFl5VHMyRnF0ZlBKcEhVSGZ6?=
 =?utf-8?B?dXFZa2RWeGl0aG1GNzgzM0IzMWxSRkpLYzhld0dHUkwwZHlaRm4vT1dpMXIr?=
 =?utf-8?B?NTNxT2k5TWs5ZTRuZDV5aExRQjd4YVRmYVVSS25jeUlvcHlnSVYrSXlrVDJR?=
 =?utf-8?B?ZUE5S1h0NkNESXFTVUJwNkM0dXp3V0R4ZWdkejc1WGxsbm10TElQN2o4UE5Y?=
 =?utf-8?B?OGhzU0U2OXM3cWorNFRhZklFWVpmUlNkMTd6clVaSzFuS05lWEcrcVp0RE56?=
 =?utf-8?B?ZkxPczZyQ29mRWRJUkh2U0JWT1JhMXpKVllOSFRjaTJVTWVkSjFXWTNrQnZy?=
 =?utf-8?B?aVhFNFJid2UzaTJVMkVOcm41aGkvdHVsWkVDU0tqV1B0S1Vxem5xUktYK3kz?=
 =?utf-8?Q?1o3TioYHmtzrg10P57hUMVA=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c93829a-f8c9-449d-becd-08d9d797f3d7
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 19:56:28.1765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: smqQyGP6ZkOz1jby8Bq/vFJhkO15y2RKLdY3qZ/5kvDsqHKJWya1lJQB5rKygVFvVpOQ/YntxHQgnK+oA32UHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0302MB2763
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 1/14/22 2:22 PM, Robert Hancock wrote:
> On Fri, 2022-01-14 at 13:05 -0500, Sean Anderson wrote:
>> Hi Robert,
>>
>> On 1/13/22 11:42 PM, Robert Hancock wrote:
>> > Previously a device tree property was added to allow overriding the
>> > reference clock period parameter if the default value used was incorrect.
>> > However, there is another register field, GFLADJ_REFCLK_FLADJ, which
>> > reflects the fractional nanosecond portion of the reference clock
>> > period. Add a snps,ref-clock-fladj property to allow configuring this
>> > as well.
>> >
>> > On the Xilinx ZynqMP platform, the reference clock appears to always
>> > be 20 MHz, giving a clock period of 50 ns. However, the default value
>> > of GFLADJ_REFCLK_FLADJ was 1008 rather than 0 as it should have been,
>> > which prevented many USB devices from functioning properly. The
>> > psu_init code run by the Xilinx first-stage boot loader sets this
>> > value to 0, however when the controller is reset by the dwc3-xilinx
>> > layer, the incorrect default value is restored. This configuration
>> > property allows ensuring that the correct value is always used.
>> >
>> > Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>> > Signed-off-by: Robert Hancock <robert.hancock@calian.com>
>> > ---
>> >   drivers/usb/dwc3/core.c | 35 +++++++++++++++++++++++++++++++++++
>> >   drivers/usb/dwc3/core.h |  5 +++++
>> >   2 files changed, 40 insertions(+)
>> >
>> > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> > index f4c09951b517..ad224fb8088e 100644
>> > --- a/drivers/usb/dwc3/core.c
>> > +++ b/drivers/usb/dwc3/core.c
>> > @@ -359,6 +359,37 @@ static void dwc3_ref_clk_period(struct dwc3 *dwc)
>> >   }
>> >
>> >
>> > +/**
>> > + * dwc3_ref_clk_fladj - Reference clock period adjustment configuration
>> > + * @dwc: Pointer to our controller context structure
>> > + *
>> > + * GFLADJ_REFCLK_FLADJ should be set based on the fractional portion of
>> > the
>> > + * reference clock period, where the integer portion is set in
>> > GUCTL_REFCLKPER.
>> > + * Calculated as: ((125000/ref_clk_period_integer)-
>> > (125000/ref_clk_period)) * ref_clk_period
>> > + * where ref_clk_period_integer is the period specified in GUCTL_REFCLKPER
>> > and
>> > + * ref_clk_period is the period including fractional value.
>> > + * This value can be specified in the device tree if the default value is
>> > incorrect.
>> > + * Note that 0 is a valid value.
>> > + */
>> > +static void dwc3_ref_clk_fladj(struct dwc3 *dwc)
>> > +{
>> > +	u32 reg;
>> > +	u32 reg_new;
>> > +
>> > +	if (DWC3_VER_IS_PRIOR(DWC3, 250A))
>> > +		return;
>> > +
>> > +	if (!dwc->ref_clk_fladj_set)
>> > +		return;
>> > +
>> > +	reg = dwc3_readl(dwc->regs, DWC3_GFLADJ);
>> > +	reg_new = reg & ~DWC3_GFLADJ_REFCLK_FLADJ_MASK;
>> > +	reg_new |= FIELD_PREP(DWC3_GFLADJ_REFCLK_FLADJ_MASK, dwc-
>> > >ref_clk_fladj);
>> > +	if (reg_new != reg)
>> > +		dwc3_writel(dwc->regs, DWC3_GFLADJ, reg_new);
>> > +}
>> > +
>> > +
>> >   /**
>> >    * dwc3_free_one_event_buffer - Frees one event buffer
>> >    * @dwc: Pointer to our controller context structure
>> > @@ -1033,6 +1064,7 @@ static int dwc3_core_init(struct dwc3 *dwc)
>> >
>> >   	/* Adjust Reference Clock Period */
>> >   	dwc3_ref_clk_period(dwc);
>> > +	dwc3_ref_clk_fladj(dwc);
>> >
>> >   	dwc3_set_incr_burst_type(dwc);
>> >
>> > @@ -1418,6 +1450,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>> >   				 &dwc->fladj);
>> >   	device_property_read_u32(dev, "snps,ref-clock-period-ns",
>> >   				 &dwc->ref_clk_per);
>> > +	if (!device_property_read_u32(dev, "snps,ref-clock-fladj",
>> > +				      &dwc->ref_clk_fladj))
>> > +		dwc->ref_clk_fladj_set = true;
>> >
>> >   	dwc->dis_metastability_quirk = device_property_read_bool(dev,
>> >   				"snps,dis_metastability_quirk");
>> > diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
>> > index e1cc3f7398fb..5011296786de 100644
>> > --- a/drivers/usb/dwc3/core.h
>> > +++ b/drivers/usb/dwc3/core.h
>> > @@ -388,6 +388,7 @@
>> >   /* Global Frame Length Adjustment Register */
>> >   #define DWC3_GFLADJ_30MHZ_SDBND_SEL		BIT(7)
>> >   #define DWC3_GFLADJ_30MHZ_MASK			0x3f
>> > +#define DWC3_GFLADJ_REFCLK_FLADJ_MASK		0x3fff00
>> >
>> >   /* Global User Control Register*/
>> >   #define DWC3_GUCTL_REFCLKPER_MASK		0xffc00000
>> > @@ -985,6 +986,8 @@ struct dwc3_scratchpad_array {
>> >    * @regs_size: address space size
>> >    * @fladj: frame length adjustment
>> >    * @ref_clk_per: reference clock period configuration
>> > + * @ref_clk_fladj_set: whether ref_clk_fladj value is set/valid
>> > + * @ref_clk_fladj: reference clock period fractional adjustment
>> >    * @irq_gadget: peripheral controller's IRQ number
>> >    * @otg_irq: IRQ number for OTG IRQs
>> >    * @current_otg_role: current role of operation while using the OTG block
>> > @@ -1166,6 +1169,8 @@ struct dwc3 {
>> >
>> >   	u32			fladj;
>> >   	u32			ref_clk_per;
>> > +	bool			ref_clk_fladj_set;
>> > +	u32			ref_clk_fladj;
>> >   	u32			irq_gadget;
>> >   	u32			otg_irq;
>> >   	u32			current_otg_role;
>> >
>>
>> Doesn't this property already exist as snps,quirk-frame-length-adjustment?
>
> No, it's actually a different setting, though it's a bit confusing (kind of
> reflecting that the actual register settings are a bit confusing):
>
> snps,ref-clock-period-ns and snps,ref-clock-fladj specify the reference clock
> period (the whole nanoseconds and the fractional portion respectively).
>
> snps,quirk-frame-length-adjustment is another setting which seems to reflect
> the frame length according to a 30 MHz clock, and which overrides another input
> value that's provided to the core in hardware. (That's my understanding anyway,
> just based on the register descriptions in the ZynqMP documentation. The
> Synopsys guys might have a better idea what this actually does.)

I think it does the same thing, but when GFLADJ_REFCLK_LPM_SEL=0. Its
description is

> This field indicates the value that is used for frame length
> adjustment instead of considering from the sideband input signal
> fladj_30mhz_reg

and the description for GFLADJ_REFCLK_FLADJ is

> This field indicates the frame length adjustment to be applied when
> SOF/ITP counter is running on the ref_clk. This register value is used
> to adjust the ITP interval when GCTL[SOFITPSYNC] is set to '1'; SOF
> and ITP interval when GLADJ.GFLADJ_REFCLK_LPM_SEL is set to '1'.

Although it's possible that these are different aspects (interval vs
length?).

According to the xHCI standard section 5.2.4, "the default value
[of GFLADJ_30MHZ] is decimal 32 (20h), which gives a SOF cycle time of
60000." All in-tree bindings which set this property just set it to
0x20, so maybe we should just remove the binding and set it all the
time.

>>
>> ---
>>
>> I realize the cat is already out of the bag, but this seems like
>> something which could be better modeled with a frequency property, or by
>> using a clock. With these bindings, the board maintainer has to
>> determine the reference clock frequency and then manually calculate the
>> fractional adjustment.  If the reference clock is ever changed (e.g. in
>> a new board revision), the maintainer must then update two properties.
>> However, Linux could calculate all this automatically.
>>
>> We already have a clock input for the reference with which we can
>> determine the frequency (according to bindings/usb/snps,dwc3.yaml,
>> though I cannot see where it is implemented in the driver). Even on
>> platforms without a reference clock (such as USB over PCIe [1]), one can
>> just add a fixed-rate clock to act as the reference.
>
> That probably would make some sense.. the complication is that at least looking
> at the ZynqMP setup for this USB core, in the device tree the top-level zynqmp-
> dwc3 "wrapper" driver (drivers/usb/dwc3/dwc3-xilinx.c) is the one that has the
> clocks mapped to it right now, not the actual snps,dwc3 device that this driver
> is operating with. Other dwc3 variants like exynos, imx8mp, qcom etc. seem to
> be set up similarly.
>
> I'm not actually sure why it was setup this way with a parent and child device
> node with separate drivers, rather than just having device-specific extensions
> in the dwc3 driver for implementations that need it. But I'm guessing there's
> probably enough device tree references to that setup that we're stuck with it
> now.

I believe the motivation is that several of these drivers have auxiliary
registers and rather than creating a second entry in `regs`, the
original authors created sub-nodes instead.

> Simplified example:
>
> usb0: usb@ff9d0000 {
>          compatible = "xlnx,zynqmp-dwc3";
>          clock-names
> = "bus_clk", "ref_clk";
> 	clocks = <&zynqmp_clk USB0_BUS_REF>, <&zynqmp_clk
> USB3_DUAL_REF>;
>
>          dwc3_0: usb@fe200000 {
>                  compatible = "snps,dwc3";
>                  snps,quirk-frame-length-adjustment = <0x20>;
>                  snps,ref-clock-period-ns = <50>;
>                  snps,ref-clock-fladj = <0>;
>          };
> };
>
>
> I'm pretty sure that the "ref_clk" clock on the zynqmp-dwc3 device is what
> snps,dwc3 calls the "ref" clock which these period settings are dealing with,
> and currently doesn't do anything with in its code if it's provided, other than
> enabling it. As you say, the driver could just pull out the rate of that clock
> and calculate the correct clock period values on its own.

I believe that's correct. On my system, ref_clk is set to usb3_dual_ref,
which is running at 20MHz.

> But given that properties need to be added to the device tree to support the
> current approach anyway, I guess the device tree should just add the ref clock
> into the child node as well..

I think that's a good idea. For existing bindings, we can create a
fixed-rate clock based on snps,ref-clock-period-ns (and mark that
property as deprecated).

--Sean
