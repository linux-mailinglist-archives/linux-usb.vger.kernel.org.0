Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0154949B8A9
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jan 2022 17:35:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242606AbiAYQcc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jan 2022 11:32:32 -0500
Received: from mail-eopbgr70084.outbound.protection.outlook.com ([40.107.7.84]:62785
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236376AbiAYQ0f (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 25 Jan 2022 11:26:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYBJBaKlHSSENNR4Ac8u0oKjdIWN8UZaiPgDvUw3z9Z8HWD3KTWhn6CqEomF1m7PcmS+14c/OT/UgQmKIoM7/FLOe3F0IitxTrXQNQUIkISFZR8oAhPNnBGfJsxT+m2rWM/WWG2x1zpkOUm4Ua++kM7wDTOS+RaF6hnzPN81seESq/3aD/4BePSqCNHLryqIIdRjlhM9tRHm5Pa0zItozLHNUSv8t4u92GfByiJ7g/Ais066I+87F6UfVMv/X9eXmsaMWqijqctJ6Q7NPC+2+3wRfETC3BjAPfwMjHHBdxv6hmpjTF8Bcz6ePEXjtC3mGvYJPkMEbj1XH7aEilurWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+KLdbHVWDgB2UMnHGe6hccL5+eNTrWfWapRXSnXmqI=;
 b=MlmAxjzGtnvXm4ZRYM8EdNMzxaTLz4lzRTit6OKV00vHtGe4/07PnliG85GpkS1fMbyi59y7bBxJW3EMPkw8Cqec5pxe2afSAhm/urCWu177Gry1MzkesjtLdtBfLD+POjpzmwAEHGMWImYB3VEmXcaL0/hMV0WmjpI6WxyoduWhcArODX1O98PTJfHbEPlbGtknRmEy7akWJ9zobe4ay1A7WWfKfQ+ulTg9Bcej2boYL6/Ly56SDb8NcW/9vdrOwbqN5cZ1CeQ2NLcKvvTrcK5bK61XGxYMwYiuXTI1WHHWuRctR9WCULjjJnO7+QUsBbvWyqC+ZBjzZAdABsH7aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+KLdbHVWDgB2UMnHGe6hccL5+eNTrWfWapRXSnXmqI=;
 b=u0qp+5/HR90tc0w6v0LmopARgmyIMFPLwKt7sU8CKPnzlOi5GfeEfWPZ5EtvHMZb9lVgsBM9rvZ2cfGV+gZyRgw92qBmd1Uo4J4EvF5D3QX4UytRAW/i3OhEbMpqn82Y4HkH558UxjKLFXwtD6TV0XKxqyNWyOLHTRm7Q7VXNdSiKHARJGX21cKs/Vsi5cXZnrQaKso4ETz9qYAv8gcicMvoGtQTddX9AZ2TTEX0RJqUQezBBU/v0/aALTAC3bWQzl7Q3keiFCmYF0/mmjIDIaGfuVgyoVzfURjZLzcBfxXn1yDFDpR/8MqLicroNESCUxeaD/rjgfagR1R26Xfx5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by VI1PR03MB4222.eurprd03.prod.outlook.com (2603:10a6:803:57::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Tue, 25 Jan
 2022 16:26:22 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::2d1f:654e:f946:1a95]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::2d1f:654e:f946:1a95%6]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 16:26:22 +0000
Subject: Re: [PATCH v6 1/2] usb: dwc3: xilinx: Fix PIPE clock selection for
 USB2.0 mode
To:     Robert Hancock <robert.hancock@calian.com>,
        "MNARANI@xilinx.com" <MNARANI@xilinx.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     "michals@xilinx.com" <michals@xilinx.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>
References: <20220121181841.2331225-1-robert.hancock@calian.com>
 <20220121181841.2331225-2-robert.hancock@calian.com>
 <DM6PR02MB42352135D31E17ED63A95D64C15E9@DM6PR02MB4235.namprd02.prod.outlook.com>
 <cb7fc7b898f9468a416fb4e23104bb21006ef1cf.camel@calian.com>
 <DM6PR02MB4235FCE338017DB774213BF3C15F9@DM6PR02MB4235.namprd02.prod.outlook.com>
 <68ee1589e519ffc1d365c61ebe9190e33f60e6fd.camel@calian.com>
From:   Sean Anderson <sean.anderson@seco.com>
Message-ID: <d952d61f-90b8-e772-9151-01dbbba294ea@seco.com>
Date:   Tue, 25 Jan 2022 11:26:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <68ee1589e519ffc1d365c61ebe9190e33f60e6fd.camel@calian.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:208:32b::6) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7342d9b-91f9-40c5-36b4-08d9e01f6d0c
X-MS-TrafficTypeDiagnostic: VI1PR03MB4222:EE_
X-Microsoft-Antispam-PRVS: <VI1PR03MB422212A98420C16F8FC3E12F965F9@VI1PR03MB4222.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0nuV+h1xmnoPrPbRLVco60Y5og9sZ3KxnJxNEqAu6vnnz6iRIwnU5sEycQWoVRrLtuzNSUnQqPD5BMedkb8R3VB1yQtXFd9NaSoOrUmQafIQQmFIsiwWPgUeOryWMa106ecK+JJPNPstmteuBG31+c1OyU0+X8ygtLYKAVHaDuuFgAtKZfDUdPy4/9MIxyLY7uuQcWGHlrDTwFvxv1J3b6CX7KMmDgkQQJ4O8d14uO6Ht0KjVd68jnmx+j4S4Ly3eLsTMMZGPNMfpe35rfGpKPV0z4V4YKJZ7drNPVU+z2tqzoPT2OjTILgwKp//XHI/j3WCjZaLUF4ZEjLQ9eH39fJeZUb+dlHWvG5/eRsFr7RwxtggcXZAG5ulIaVlKrm4X2Cqywtu5XMPe25Mi5So0WyUJZbO8BGhDI3fp9hyO0z6PpBObhu7bnLD3jeO9SHNw0LFMrIfTCc+R5REo/kAr83K8rOe8hFJzrO5JN4QhbW0K53KkjAnHgA4hAiG2QtH9nNMp5Q52NJVFqbCWmJVS4xuJavOijiNewaSBK0YzUxgRtmlRC0b/O4xgsF1U+9FxIrsLET7ZRnESrQsO5cPFZ/NXSiJ+e6ej95PFn3XJn5SpTHlh2LWf6578jmakAJ+2iFTxXow7hqTjFpLVIiDlaRp4YZbUsprEL6kumFJENsfx4BEm6ukfyDecgPhDEVSuLT0ewSxbVDQhxU6GYJIOUN2WajU25/mkIjsiNcBQBP44m0enAoTp7n2t89FrZBDj3HpIk7FqWKwd0hieQixGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(186003)(66946007)(6666004)(5660300002)(2616005)(8676002)(83380400001)(6506007)(26005)(31686004)(316002)(66476007)(44832011)(54906003)(110136005)(66556008)(4326008)(36756003)(8936002)(508600001)(6512007)(6486002)(52116002)(2906002)(53546011)(31696002)(86362001)(38350700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0o0c1pQYThYVnVpNzk0UWtlU0RyMWZmZnRCcGVHK2dhY3NPNTJmNG5GRlo5?=
 =?utf-8?B?MVhKTjBlZHc5MjhwSThXUTM3UnI2c2NwWVdXQkFSVmlzRG1KOGdPQWUraDVi?=
 =?utf-8?B?MkN5TUUyWC9KczNzejd5c0lWcjdKV1dmSFdNY01McW04MmNHMElSaDExdDJN?=
 =?utf-8?B?R001MDJBWFFhczk3Znd1N3V1akEvYk1SR1N6T2x6eUE0MlQzM2Z3TzA3WmI0?=
 =?utf-8?B?VW51TmtpRFhGWWI5SGRTb0lLWWkyWGFpUlo1c0NHMlBMSXRVbHE3WXpKeUtZ?=
 =?utf-8?B?RDQzQXRSMkNHT09QNVBVb2RjTzZSeU5zSytXR05ZVG9uQUM5cUgzdUVFQW9T?=
 =?utf-8?B?cll2bTU1NlB5MDRONU5JZklIZnNJd01oNDIvMTU3MGxwdTVpK1BuQVJpZlRy?=
 =?utf-8?B?VFFKOVVYb2NUc1JYMUtJMTN3elA5SWxaamdLSXlubEc0OFA5NDk0MXJ4cHpz?=
 =?utf-8?B?RmhQcWVUYSs2bzlBUSsrQUpTTVNXVHNrUmFlckZ2cjVWWVM4eTlvM2NwOTl4?=
 =?utf-8?B?NXp2WlYzclIvcXJPQUJUZkF0emMvL2V3ZGxyUmV4ekRUcDhicmgrTk5ZbHhW?=
 =?utf-8?B?SFNzbVBIQ3R2WmVOOUdmckcxVmZ4ZnF1bE4vVURRUXE3c0VBMHVKb0FFVkxk?=
 =?utf-8?B?YWxkY2lxMS9IeEZWV1lGRWw2eWJFb0JvVjgwWUtkdXJUUTJXZVBrckx2RHVH?=
 =?utf-8?B?bmcyU0NzZjFmR3hQNnphVWhYV1lxcmVGR1dheEhWZS96T0ZKZGMwMkUrWmxa?=
 =?utf-8?B?ZjZhZWd2SW5uK1dJcGxiVW5Lb0MzWTJUUWxzKzN1bnJ0M1cwcW5CcmhCamk1?=
 =?utf-8?B?ZlNyTWEwTE81bThFNXJ5aG5HR00zWThYRFRaTXRHbENYL0xIWGtGWnZ6UzhS?=
 =?utf-8?B?TVZMV2xxOW1CbnhqYXBlQnJKaUtSOVBDUE1xc0VJKzBGTUs3MmUzbjRhWlFN?=
 =?utf-8?B?d3p3em1lZU1KakpQVmRleWxLNWFzc256V1JmRzBlOVFRb0gyUDFseEJFSU03?=
 =?utf-8?B?WTFwMm9RQW1TWDBnYldzVnBlRHdMMDVYWjY1YlhTZnFKeGE1Wkdkblg4Y1p4?=
 =?utf-8?B?YjZTK0N3SFVpOElRY3AzZlpHaEFmOGthK0U2WHNJRWxISGlNMk1kcGxNWk9N?=
 =?utf-8?B?K3k0dkVvMnpmcGIzTGFBYjBuL3VnYUNZRmxTTTlpSVAvL1dhZm1oTnNBQitF?=
 =?utf-8?B?WFNDOHZQMUY3a3hIYVFkaEd4U0VhTld4V2NYVlp1QkxhckQ2RUYzQkFXc1cw?=
 =?utf-8?B?ZGNhb1FDVThVY0FBU0xTRWtKT3ZMREdYVGpPWE9YclM0Vjk3YXlGVXpaOUNM?=
 =?utf-8?B?L1VaWUNkYXZZWUxvT1p5eTZuOUdxQktHb0t6RU5RaHFXMXVrOVVaaDB3c1px?=
 =?utf-8?B?VTgzeXR3TmN3SXJJL3R3KysrQllsODUvRXhLaSs5T3laaGdiblR5VFlnRlpC?=
 =?utf-8?B?aUJ2OTBoaGNhZXVGTVYzUEJVc2tRWjdqQ2RlV3ZXTXByemlrbzRLZ2l4Z2Jh?=
 =?utf-8?B?dUhBN2p6ajNzamdtTis3cWNDY0llYlNtN2Vzd2JXNGZyZkNLRks4ak5lNld3?=
 =?utf-8?B?Q0lScnhGRE92emRwOFoxODRqcldOWVBRQ2c2aTBpendCK2RoTWVVWTVhZ3lG?=
 =?utf-8?B?L3JWd2pXVk9FM2xNU2FGaVNJNmJRZlRQT2ZNTitBaVhtOHFQMldjOVhCeG92?=
 =?utf-8?B?anRoNXVKSW80bERtR3F6RXJNMmg2Mlo1RmYraDJPWDJRMlpWeERoTHZHM0hI?=
 =?utf-8?B?d2pvaDhMU3BiWXFzbjQ2L1hibWkwK3JHUmNUYW5TOTVuK1Z5RVV5UEtSd3Zs?=
 =?utf-8?B?RjBvbm5ycXBYclh2Ni9zQVA5Yy9wQ2pwbGV3bFpjUS8xN1Ezd1BUUjZ2VWNa?=
 =?utf-8?B?V096QVVyUmJPa1BqRFNlZ1BvckFLaUduZHJIRlZMRGxNK2IyNFFoUXY4QmVG?=
 =?utf-8?B?QjM0VUs3Wk5RYWNkNFdzakVuWnp6T1dOYTZGcmNBZlQyeURHNmVydDJva1BZ?=
 =?utf-8?B?dHZubW5ERll0Qlc2SXZGRUpOWkY5NVB3YkxxZWpxemdMTVB6d1Frcmd1ODh1?=
 =?utf-8?B?dHZocG9HNnBVeXJZVFlCUTFxWWZvanZ5SDVENDZTYk9OMlBnU0VzWkQ3TWRJ?=
 =?utf-8?B?UFU5Y1Y1RGlEYUZ3TFR4ODNSRWVDZDQ2L1lGR002MlRacm0ycWZ0aHlPTWJW?=
 =?utf-8?Q?VsPANOL2mB5t8OKOwYG94g0=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7342d9b-91f9-40c5-36b4-08d9e01f6d0c
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 16:26:22.8542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v2Exb6NKISHU+76qoLMDbWb+BPgokdcJHBDe47HrQgQSAJTmHMBuZoIZX/Vrj7e4X+y4tJYnoQHP7elOvkhKVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4222
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 1/25/22 11:19 AM, Robert Hancock wrote:
> On Tue, 2022-01-25 at 05:36 +0000, Manish Narani wrote:
>> Hi Robert,
>> 
>> > -----Original Message-----
>> > From: Robert Hancock <robert.hancock@calian.com>
>> > Sent: Tuesday, January 25, 2022 12:31 AM
>> > To: Manish Narani <MNARANI@xilinx.com>; linux-usb@vger.kernel.org
>> > Cc: Michal Simek <michals@xilinx.com>; sean.anderson@seco.com;
>> > gregkh@linuxfoundation.org; balbi@kernel.org
>> > Subject: Re: [PATCH v6 1/2] usb: dwc3: xilinx: Fix PIPE clock selection for
>> > USB2.0 mode
>> > 
>> > On Mon, 2022-01-24 at 06:55 +0000, Manish Narani wrote:
>> > > Hi Robert,
>> > > 
>> > > Thanks for the patch! Please see my comments below inline!
>> > > 
>> > > > -----Original Message-----
>> > > > From: Robert Hancock <robert.hancock@calian.com>
>> > > > Sent: Friday, January 21, 2022 11:49 PM
>> > > > To: linux-usb@vger.kernel.org
>> > > > Cc: balbi@kernel.org; gregkh@linuxfoundation.org; Michal Simek
>> > > > <michals@xilinx.com>; Manish Narani <MNARANI@xilinx.com>;
>> > > > sean.anderson@seco.com; Robert Hancock
>> > <robert.hancock@calian.com>
>> > > > Subject: [PATCH v6 1/2] usb: dwc3: xilinx: Fix PIPE clock selection for
>> > > > USB2.0
>> > > > mode
>> > > > 
>> > > > It appears that the PIPE clock should not be selected when only USB 2.0
>> > > > is being used in the design and no USB 3.0 reference clock is used. Fix
>> > > > to set the correct value depending on whether a USB3 PHY is present.
>> > > > 
>> > > > Fixes: 84770f028fab ("usb: dwc3: Add driver for Xilinx platforms")
>> > > > Signed-off-by: Robert Hancock <robert.hancock@calian.com>
>> > > > ---
>> > > >  drivers/usb/dwc3/dwc3-xilinx.c | 8 ++++++--
>> > > >  1 file changed, 6 insertions(+), 2 deletions(-)
>> > > > 
>> > > > diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-
>> > > > xilinx.c
>> > > > index 9cc3ad701a29..dd6218d05159 100644
>> > > > --- a/drivers/usb/dwc3/dwc3-xilinx.c
>> > > > +++ b/drivers/usb/dwc3/dwc3-xilinx.c
>> > > > @@ -167,8 +167,12 @@ static int dwc3_xlnx_init_zynqmp(struct
>> > dwc3_xlnx
>> > > > *priv_data)
>> > > >  	/* Set PIPE Power Present signal in FPD Power Present
>> > > > Register*/
>> > > >  	writel(FPD_POWER_PRSNT_OPTION, priv_data->regs +
>> > > > XLNX_USB_FPD_POWER_PRSNT);
>> > > > 
>> > > > -	/* Set the PIPE Clock Select bit in FPD PIPE Clock register */
>> > > > -	writel(PIPE_CLK_SELECT, priv_data->regs +
>> > > > XLNX_USB_FPD_PIPE_CLK);
>> > > > +	/*
>> > > > +	 * Set the PIPE Clock Select bit in FPD PIPE Clock register if
>> > > > a USB3
>> > > > +	 * PHY is in use, deselect otherwise
>> > > > +	 */
>> > > > +	writel(usb3_phy ? PIPE_CLK_SELECT : PIPE_CLK_DESELECT,
>> > > > +	       priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
>> > > 
>> > > When USB3.0 is enabled in the design, FSBL will set this bit to
>> > > PIPE_CLK_SELECT
>> > > And it's state will be persistent till Linux stage. When this driver
>> > > finds
>> > > the usb3-phy property
>> > > In the device tree, it will again set this bit.
>> > > But in case if the usb3-phy is not present in the device tree and design
>> > > has
>> > > USB3.0 enabled, then this will clear this bit and ultimately it will
>> > > fail.
>> > > 
>> > > It will be better to skip touching that bit in case the device tree does
>> > > not
>> > > have the usb3-phy property.
>> > > This will skip the whole sequence of PHY initialization (reset
>> > > assert/deassert are done in order to help initialize PHY).
>> > > Something like below should work.
>> > 
>> > So the original patch was tested against hardware that only had USB 2.0
>> > support
>> > and seemed to work fine. However, we've since found an issue with some
>> > other
>> > hardware supporting USB 3.0 where either it doesn't detect devices at all,
>> > or
>> > they get detected but then seem to drop off the bus very quickly, and we
>> > get
>> > this repeatedly:
>> > 
>> > [   99.858607] usb usb2-port1: Cannot enable. Maybe the USB cable is bad?
>> > 
>> > The same problem is reproducible on the Xilinx ZCU102 board with the same
>> > kernel build, where the USB works fine with the Xilinx kernel and a
>> > Petalinux
>> > 2021.2 pre-built ZCU102 image, so it's no hardware issue.
>> > 
>> > I've been trying to isolate any relevant differences between the Xilinx
>> > kernel
>> > and mainline in this respect but haven't had much success. One difference
>> > in
>> > this particular dwc3-xilinx code is that the Xilinx kernel has code to
>> > reset
>> > the ULPI PHY which is not in the mainline version yet. However, adding that
>> > in
>> > doesn't seem to fix the problem.
>> > 
>> > Have you (or anyone else on the CC list) done any testing of USB 3.0
>> > devices
>> > and USB 3.0 capable hardware on mainline with ZynqMP to know if this is a
>> > more
>> > general issue?
>> 
>> Yes, The USB fixes are work in progress and will be sent to mainline in near
>> future.
>> This fix is one of them. Your patch is solving the problem in case of USB
>> 2.0 
>> But not the USB 3.0 entirely. There is this corner case which I mentioned,
>> breaks
>> USB 3.0 functionality with your patch.
> 
> You mentioned the case where the design is using USB 3.0 but the usb3-phy is
> missing from the device tree

Do we even need to support that?

Either phy (with an appropriate phy-names) or usb3-phy should be present for
USB3. Mainline has had GTR support since 5.8(?) or so.

--Sean
