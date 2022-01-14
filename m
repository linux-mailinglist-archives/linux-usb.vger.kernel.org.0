Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD50D48EFA1
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jan 2022 19:05:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244064AbiANSF5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Jan 2022 13:05:57 -0500
Received: from mail-eopbgr70089.outbound.protection.outlook.com ([40.107.7.89]:3302
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244061AbiANSF4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 Jan 2022 13:05:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DEsjqGMv4NHDJ11dgfRAptlUrT6W+UKLeEl0STP/3ArhWm5ZNCRTvLULFwE0SZdiHrNk+WhG1Vz2DLSQ2W3ECdd91XhLx3d4D8KQ31gkF75bvCsgI1nVaEvHelVQBlD0oxPzwjCjfwcmEDXGow2xavU8/DjvxMrQA5zCNygDlHBk8cizHYQPT/idstxdJw9vZSXRbwF3EkRbw8VurkZ+mN2B0sbQ+HD8lNmSTRXlRo+Ul4bcV2PRieaiZLwt8FY2L+m0ATXkxT3DaUH5gj7zDb50k4rZXFB3qGAJncKLfDwFL9jnj/3WjXAeEPoT305XeMwyAaEN0UHzsndSg3E+Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CgjAqxHRCjcYLl83DJXfRRB1LQ3oQBlQ0x3mhicQON8=;
 b=nyaIBlSeMmKAdzGYDAahmWR6UGYtCC5UT9u4fXLowYOV8fpagD8lBqBqadTr9okd8aZA+WW5MR4kfoC4+mTn8h3PYKHod2AJF44Uc6LxmEv1OyI2xiTGw4LQzJh+P8SttRB1oetMToAR5YvQ88SPJXP0b+WyDreoUyHMJA/9Tid2FdJLOrBD/P2YGY95+RXKiv8K52CQr0Nn6ynoM08yU6xoZsZ6xVI0MgnBJXMW9utz4pS7UAgyaBUPI2/4eVPF6fyn1C4o0PFEWLt4z3EvhI/lRLqglDqfM7aaLq1ODlI2SeJi2lHYjA4RuhgataHVITR8JtmdP012vZDR2edBiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgjAqxHRCjcYLl83DJXfRRB1LQ3oQBlQ0x3mhicQON8=;
 b=Jdpa7YD7fSoDO5cf1ME3ftoImDNkByfr6fMqJ3zC3yjeYUQYR6JmpYvrIwjP29fBTuVmBHbLRKfcD7LPi0ZcjMFrM1Qg+nwGAFYmch7OLLq0nHwInxgU4zWjhimzysvRjfpUvbdcQppfq9OOIPLjF5JfnOwXOENoXIokMqYCoeM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by AM6PR03MB4501.eurprd03.prod.outlook.com (2603:10a6:20b:d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Fri, 14 Jan
 2022 18:05:53 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::d47e:81b0:256:3005]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::d47e:81b0:256:3005%4]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 18:05:53 +0000
From:   Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v4 4/5] usb: dwc3: add reference clock FLADJ configuration
To:     Robert Hancock <robert.hancock@calian.com>,
        linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, michal.simek@xilinx.com,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        mounika.grace.akula@xilinx.com, manish.narani@xilinx.com
References: <20220114044230.2677283-1-robert.hancock@calian.com>
 <20220114044230.2677283-5-robert.hancock@calian.com>
Message-ID: <cf9ec164-7d9f-8209-5d2a-8e8c26a7be7e@seco.com>
Date:   Fri, 14 Jan 2022 13:05:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20220114044230.2677283-5-robert.hancock@calian.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:208:c0::39) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bab5d97d-b639-4811-9a97-08d9d78880f2
X-MS-TrafficTypeDiagnostic: AM6PR03MB4501:EE_
X-Microsoft-Antispam-PRVS: <AM6PR03MB4501AC693B44781D84D0C18D96549@AM6PR03MB4501.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Wj4D03PmPcw9etnfigA4qNA3Xdh05db6eE2KcUsXhrI92lF4KIufEJCZfbeWiiLr0yoLLlBqMi87WhTE/Ho+Klte5wkD/K6uyOzf/1i3LPDL6pdUDsv2BWnjAiWv/LWfiSWmU7/VyHJqVI4eF6sAsNWCkd5vgUwsdc/2uX1QaJaAvC/birou9N4MaSH6zHAnXnuFfY9+5xPiTsZlNtVJX9DvLJNXx3aMQLqWZJhIoOgsv2t2BllylsP6N4UyTFFCvbqnzpppW5bdzTaR8Y/P7P8XHldLFfYOo0Js/iW4B+jfPvDAM+NEp0lrema+5sS5qzKGdcVwonH6Byi461nnRbQjSRmKNjxTGUSbKILy+oxzDJW+eashk7yBjYd7QENYZANWcAOK6jq5oTL6S/3uzAA/ng4QGI9RMghMz/WKZcIM/sAEtmGs94AsdidU6R7/fpCM+Kh/BBspHFEWd+DMB1k+o9NmKdpOzW8L+UjA7B2CyqG9w05tcgsPEbUIr1OUU0zZWc5rAN0TxNIU++XQO1NR80+PWl4ru4f6100wWhClRHDhjaYpFA5g0rIy2AXXVqSB6wp00nlv9UYsS6yFJEbt3TyzZtD9RF5/JZBuGsi4Wmlpzq9frcQxDIQ3o2gLZZjDRYS3FGXhwSRgwkVIbt9nuSXQkheNt4YElobbf82/XITgCQeXmUGTB1YXnbfXNe8ttAnAi/owlGmsS1q66iM9Uv0A2sBLMMLREpzwb8zT1Yu5LNA6qEAmY+yhDfGLGfqNSRq9RC8NesJd5ILogM2Dg46rLGKUnp4992ZzV/qCTQo8ngUWm002366fcTx2/jjFdQQCN6OtautuYYUIqoDSi0AjS0FQbDlc7niDR8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(26005)(86362001)(6666004)(186003)(36756003)(66946007)(4326008)(83380400001)(6506007)(53546011)(31686004)(2616005)(44832011)(52116002)(31696002)(8676002)(38350700002)(2906002)(966005)(38100700002)(7416002)(6486002)(508600001)(316002)(5660300002)(66476007)(6512007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1B2OE1WbGQ0QVY1RmtyOXZRRU5ZdmgzNzErYkdkVEgydW5kSTFPL1JTbnhx?=
 =?utf-8?B?SmZ6dlJiU3hESWU1TXlQVGIzWDZyRXVacFV2c0UrN0RFN0hGK2duQ1hJaE1N?=
 =?utf-8?B?RHByWkl4NWhKenRFRnY2T2JNMklEZW85RGUwbExrL21iMVovZkNSVnBWenNH?=
 =?utf-8?B?ekhoZkJ1SnVva2J0OGRBZnVMRW9BT0lzWWh2NDVtWW83UXdxQ0tUWXcwelpB?=
 =?utf-8?B?T0w3RWFmY05BR0NyeDE0UklMZk1SMHQ2b3BiaS9adXQzT3ZhYU93Z3NnbXhQ?=
 =?utf-8?B?NEh1MCtYZ0dtMFU5MlFQRW5yeEV1MlNqSmhwemp5ZEJGSndubFdDb3UzYzBj?=
 =?utf-8?B?RyszSXliS2phUWcxSFAxVFZXN3BHUkxuVk4vM0hXWmxGRnNpc0tHMzNKUC9l?=
 =?utf-8?B?dmo2MGxqekJIcTBWcXRBR2Zjd2EzQlQ5VlRuUXlUSm5OblhHV1pxenlVTm9W?=
 =?utf-8?B?c1c1M0EwOVFWM1hIZGpZTXA3KzlxRGRmSnUraDhUakl5TnZFOXFwSkZIdmRS?=
 =?utf-8?B?T05xcGFDdjNCN1NmdUx6N3FsSjk5ZldiWE9FbUQxVncxTExlRDAyTkpoS3ND?=
 =?utf-8?B?T2xwUHcwTVZtRnNoemV3ZEYyaGpoam85dC9pVCtMbmN1M3NEN24zdk4wZEE0?=
 =?utf-8?B?NkNOK1F6MjJTUW1objJtd1VvOHg0UHpuS1VLY1d5cGo4WkZicTVuaDhOdXFl?=
 =?utf-8?B?dEs0SFo5ZWJwMzVCN09OSHVUOGpjYWZjT050VzRyUW1VWkRWcldSbzFINjAw?=
 =?utf-8?B?cVZud2taeEoxQmtKNXd6NEJXTk52NkJEa0ozQ3RGVTdObVlzWHduakJZMEln?=
 =?utf-8?B?SnZuNzNVSXNpWmhFZ2ZTWnc4MGtBekRTcE1HNU1CS1FlN2FkNGpVUjk5aGVI?=
 =?utf-8?B?YWkvUExaczZjeHY2c2NzUUlkZERjMUE0ZUhhUXFGd01OR2dpS0t2ZStVYUl2?=
 =?utf-8?B?Nkd4MDdEemRCL240Tmc5VSt1TGQ3QkJsME16L3NXQzdxMkpkY3Q3UWtHSXNx?=
 =?utf-8?B?Uzl5dWR0VVRlYlMyMVNqMGlZL2dWTWZzUlErUFdiZnJKUmszQWk2b29rdS9v?=
 =?utf-8?B?b1E5alJJZG45cjVMdUpGMGdKOFRaT0RiQTl0TDVRa0hoNkpOZ1JwSVB3U3hv?=
 =?utf-8?B?d2xJTjNtQThmaFFiNlN5V3VHWVVZVFhZYW1veStXbWNNV09FZzRSZzJTZUJ3?=
 =?utf-8?B?M0k0Sm1DWXZndS9FemxnSURhVjQ2RzJlTjc3YlpDeVBYQ1czMFVFeVZkRUxO?=
 =?utf-8?B?WjRzZUlmMi9rTWhYaDZVaGlVWXV5cDZ0RFUyUnJMUDlMWTRidXR0RmlpWDl5?=
 =?utf-8?B?T29qd0hTZ3REOUFUOE5ueVoxZjlZNS9tV1hLSHFJYnNNWndwcVVyMEhqYnpH?=
 =?utf-8?B?cjZjcCtXaUs4c09aTWhtbVgvMlpYWmNFd1prd3JPMFBHREE0aExhWjlVem5O?=
 =?utf-8?B?bTBLMlNKenQyK2poNjN0U1drOWJmbnkzbVYrczdjN3BwMkdlbVE0MW9wZXJS?=
 =?utf-8?B?V3dlNWRJVXRXK3pETkF5L0V5UHpRSXlSclI3VnpoSzNXeiszYmxxaEhUYkVM?=
 =?utf-8?B?S0dDcWZZbjJCUXpHcWpOZFdnV0xsS2hmVG9MQ1FPb0tqMTdUK1VQdGk3aVpH?=
 =?utf-8?B?WHhmMlB3OGY2STgyc1IwZU5DelRRMGZ0NFBKNFlPQU9zNnZ2YStwaUNDaU5l?=
 =?utf-8?B?UVVPVXJITVMxeTdSYWFGRmxmM0tSODhYZVBkWWwwaTkxWk56OTlzQ0hIaWFm?=
 =?utf-8?B?d053aHdFL1JMLy9vNnZxRUVYa3kweTJtNHpLZVVCZGt1TWhQSTNCMmsyeGFm?=
 =?utf-8?B?RUlJWG9iRmxBdnU3WGZuVkpnV3Y2N2xhSFI2b2wvcXJoM0lXUjRONUozUFhL?=
 =?utf-8?B?VENhamZ4YnppSEVYZzNYQmR5NmpRbUpzV2QzWXJnVzBUU2oraTNaYmVDRDla?=
 =?utf-8?B?cGF2V2xobUlrS3VDUEFsS0xSR1Y1dVlYbmJrUk5XS2VIMXo1aERObDRiNlV3?=
 =?utf-8?B?UlNjYTkrRG51MHFxbzl6QmtPSWlDUTZENjZoMTFvWWl2ek5YejRETWFxQ0h6?=
 =?utf-8?B?WGZuVmgrcDI2M0g3ZlIzSDk3VEV5NE8yMTkrdTVuNm1HZnA1cGdmNHcvRS9Z?=
 =?utf-8?B?V0lZRTlzYm9oNWJySDJneTNaYjlucmE4dDdtbk5mUFZtOGtxdGtraFRvWEZV?=
 =?utf-8?Q?fM8bDZkFLxKX75pMVZVs6Zs=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bab5d97d-b639-4811-9a97-08d9d78880f2
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 18:05:52.9792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qaQxzvdNkTgKGa5EkmyxqX7eVMuUUQ3G2Abj/EgIkl5w96CTh0UC2SFTgKeqV3DrnQXoYOnV/cOTLJp7v+Lu2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4501
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Robert,

On 1/13/22 11:42 PM, Robert Hancock wrote:
> Previously a device tree property was added to allow overriding the
> reference clock period parameter if the default value used was incorrect.
> However, there is another register field, GFLADJ_REFCLK_FLADJ, which
> reflects the fractional nanosecond portion of the reference clock
> period. Add a snps,ref-clock-fladj property to allow configuring this
> as well.
>
> On the Xilinx ZynqMP platform, the reference clock appears to always
> be 20 MHz, giving a clock period of 50 ns. However, the default value
> of GFLADJ_REFCLK_FLADJ was 1008 rather than 0 as it should have been,
> which prevented many USB devices from functioning properly. The
> psu_init code run by the Xilinx first-stage boot loader sets this
> value to 0, however when the controller is reset by the dwc3-xilinx
> layer, the incorrect default value is restored. This configuration
> property allows ensuring that the correct value is always used.
>
> Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> ---
>   drivers/usb/dwc3/core.c | 35 +++++++++++++++++++++++++++++++++++
>   drivers/usb/dwc3/core.h |  5 +++++
>   2 files changed, 40 insertions(+)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index f4c09951b517..ad224fb8088e 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -359,6 +359,37 @@ static void dwc3_ref_clk_period(struct dwc3 *dwc)
>   }
>
>
> +/**
> + * dwc3_ref_clk_fladj - Reference clock period adjustment configuration
> + * @dwc: Pointer to our controller context structure
> + *
> + * GFLADJ_REFCLK_FLADJ should be set based on the fractional portion of the
> + * reference clock period, where the integer portion is set in GUCTL_REFCLKPER.
> + * Calculated as: ((125000/ref_clk_period_integer)-(125000/ref_clk_period)) * ref_clk_period
> + * where ref_clk_period_integer is the period specified in GUCTL_REFCLKPER and
> + * ref_clk_period is the period including fractional value.
> + * This value can be specified in the device tree if the default value is incorrect.
> + * Note that 0 is a valid value.
> + */
> +static void dwc3_ref_clk_fladj(struct dwc3 *dwc)
> +{
> +	u32 reg;
> +	u32 reg_new;
> +
> +	if (DWC3_VER_IS_PRIOR(DWC3, 250A))
> +		return;
> +
> +	if (!dwc->ref_clk_fladj_set)
> +		return;
> +
> +	reg = dwc3_readl(dwc->regs, DWC3_GFLADJ);
> +	reg_new = reg & ~DWC3_GFLADJ_REFCLK_FLADJ_MASK;
> +	reg_new |= FIELD_PREP(DWC3_GFLADJ_REFCLK_FLADJ_MASK, dwc->ref_clk_fladj);
> +	if (reg_new != reg)
> +		dwc3_writel(dwc->regs, DWC3_GFLADJ, reg_new);
> +}
> +
> +
>   /**
>    * dwc3_free_one_event_buffer - Frees one event buffer
>    * @dwc: Pointer to our controller context structure
> @@ -1033,6 +1064,7 @@ static int dwc3_core_init(struct dwc3 *dwc)
>
>   	/* Adjust Reference Clock Period */
>   	dwc3_ref_clk_period(dwc);
> +	dwc3_ref_clk_fladj(dwc);
>
>   	dwc3_set_incr_burst_type(dwc);
>
> @@ -1418,6 +1450,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>   				 &dwc->fladj);
>   	device_property_read_u32(dev, "snps,ref-clock-period-ns",
>   				 &dwc->ref_clk_per);
> +	if (!device_property_read_u32(dev, "snps,ref-clock-fladj",
> +				      &dwc->ref_clk_fladj))
> +		dwc->ref_clk_fladj_set = true;
>
>   	dwc->dis_metastability_quirk = device_property_read_bool(dev,
>   				"snps,dis_metastability_quirk");
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index e1cc3f7398fb..5011296786de 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -388,6 +388,7 @@
>   /* Global Frame Length Adjustment Register */
>   #define DWC3_GFLADJ_30MHZ_SDBND_SEL		BIT(7)
>   #define DWC3_GFLADJ_30MHZ_MASK			0x3f
> +#define DWC3_GFLADJ_REFCLK_FLADJ_MASK		0x3fff00
>
>   /* Global User Control Register*/
>   #define DWC3_GUCTL_REFCLKPER_MASK		0xffc00000
> @@ -985,6 +986,8 @@ struct dwc3_scratchpad_array {
>    * @regs_size: address space size
>    * @fladj: frame length adjustment
>    * @ref_clk_per: reference clock period configuration
> + * @ref_clk_fladj_set: whether ref_clk_fladj value is set/valid
> + * @ref_clk_fladj: reference clock period fractional adjustment
>    * @irq_gadget: peripheral controller's IRQ number
>    * @otg_irq: IRQ number for OTG IRQs
>    * @current_otg_role: current role of operation while using the OTG block
> @@ -1166,6 +1169,8 @@ struct dwc3 {
>
>   	u32			fladj;
>   	u32			ref_clk_per;
> +	bool			ref_clk_fladj_set;
> +	u32			ref_clk_fladj;
>   	u32			irq_gadget;
>   	u32			otg_irq;
>   	u32			current_otg_role;
>

Doesn't this property already exist as snps,quirk-frame-length-adjustment?

---

I realize the cat is already out of the bag, but this seems like
something which could be better modeled with a frequency property, or by
using a clock. With these bindings, the board maintainer has to
determine the reference clock frequency and then manually calculate the
fractional adjustment.  If the reference clock is ever changed (e.g. in
a new board revision), the maintainer must then update two properties.
However, Linux could calculate all this automatically.

We already have a clock input for the reference with which we can
determine the frequency (according to bindings/usb/snps,dwc3.yaml,
though I cannot see where it is implemented in the driver). Even on
platforms without a reference clock (such as USB over PCIe [1]), one can
just add a fixed-rate clock to act as the reference.

--Sean

[1] https://lore.kernel.org/all/9f399bdf1ff752e31ab7497e3d5ce19bbb3ff247.1630389452.git.baruch@tkos.co.il/
