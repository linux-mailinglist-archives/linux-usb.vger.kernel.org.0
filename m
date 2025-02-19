Return-Path: <linux-usb+bounces-20835-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88567A3C6F1
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 19:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1864D1896769
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 18:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647B62147F2;
	Wed, 19 Feb 2025 18:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="B7jpXTFv"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2081.outbound.protection.outlook.com [40.107.104.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1849F1B6CF1;
	Wed, 19 Feb 2025 18:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739988103; cv=fail; b=Ik4F6ginO7drGliSjKG3hxOHLdgo4pI3FK/KQoUWSJyZsgYqogfUi6296f1jzyO96hrKq6n/+K3Kpd6iVzrPa1bwqP7d6W546XRdXf3b/4XRhjJRlE9XCciyjZPK7S3jXJhdsMxcFj6wuod53BKpk8/hN4hPwrFBQ892zt8dBFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739988103; c=relaxed/simple;
	bh=ZaU8ZY+KLx8MCx5qG4Rm+U4jLfPgeolcgH7UL4Zhtg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EEy5nNh/u1UyuavKXEyGSSoF+J8sw5Qbm6SIO/si1QOv/p4VYe6xj3+q9/SsnPc5L/D7RBpWjMCVQTwU4T3oMoC8YXSUpY8zHN1xXFXG2dA8guRteTOmiyJ9zhXc5UUjAkbRWlU5UZgZ9o1EkeKO+lrVqfifzHp/jHpAE7BeyXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=B7jpXTFv; arc=fail smtp.client-ip=40.107.104.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+lh4QvenMbTa3eckOZJOqDA6CH4W4FPCmqq5d20K0UPwG44NHDTPRUA5gwHz6EpQcZyDFy7cxQnpn3S3dnq+U2oEiyBefnqFRryQnT2iNXMqbjSqwUrIG/Cbj6QhFXvYeuH6kq+yHFzrSDh/yX9Ss7nneK5VNXqANRSuOSdD/93zG0hX7rljDpnGtKpIwinp+cyLC9aNqsmxm5I6ohRa+V/8/rj48UN0Wn0mTO0Dk54Esyf1T4pWAGDbiJ2gwEUdSKOZAC9XEWu7EprUL1sDuoWgIOjg15RIBljqbIZZJq3/F8FpcUwpSSvK5NE2asmT51p5YOs7qLttJEmPVVTOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6kpF4Po8qPX6bKqsJBha6X68UOfoIpZHBpf1rNA4Yc=;
 b=wivYYBN5mzs00M7DPi2ZzgVmhuVHJ6LzpyEjsKmU9x5EZlonQQKIHkWY6s1Tb6+OlXFoH6lRuVquabmD501W0ooqsH9pXwrWB1x9NfY69/GliELI1ox/PTYKwLDwJ+I9QwwydRnh9ZNDaBMjilGCypm7Uz4GtjjTXYnPg1/0ASZbtjGynUsPTJFi7Ip/wqcK0U06lAQaTC3FTV5SduvvAWgK5hLXLoXzmOus3Lj+vHM0Wah46pIPbDLrl8fn9heXZWo68qxe+Wxkur7omzj0+MI2gVulNdg3VC8C22NwOWynVFdsW3gnpBLT5okhYHc/laUf/NCrBrhBtAirp8r9yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6kpF4Po8qPX6bKqsJBha6X68UOfoIpZHBpf1rNA4Yc=;
 b=B7jpXTFvyMxjQ7kIQcMLrtLsUuLVfaOyylgCaq45R9HReFmIrHgHGPzmYzlAD/EiN8/thWMCwtJ5jkaaiyKdQYc1FLhBiXQXwzTKkpgU6RI3rgbaP/G6JT6ohikwh1Apcx1RC0bxubwXokujJ+eSrUCNpJJ8PR+BBvK+L12Ln5Z9RWe4FjTGWMTudBM4KiBmd1ZMtTrosGJSn2HI08Be/MFOu3ve4fPTTGE9/8RCr429lW4y+b6rqqSmM1YfL9JUrTvivPQneD+J3M+8fDg7AhYeWCvj6ApR5Y4F/fSp+fQ1mLCIbj148t8DkljPhsoF896CBEsW/MQy/2ckfGe95g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10662.eurprd04.prod.outlook.com (2603:10a6:800:26c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Wed, 19 Feb
 2025 18:01:38 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 18:01:38 +0000
Date: Wed, 19 Feb 2025 13:01:30 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 2/6] dt-bindings: usb: usbmisc-imx: add compatible for
 i.MX95 platform
Message-ID: <Z7Ycev436gWc/4Bn@lizhi-Precision-Tower-5810>
References: <20250219093104.2589449-1-xu.yang_2@nxp.com>
 <20250219093104.2589449-3-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219093104.2589449-3-xu.yang_2@nxp.com>
X-ClientProxiedBy: BYAPR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10662:EE_
X-MS-Office365-Filtering-Correlation-Id: a9fb5385-09e1-48b4-5154-08dd510f74cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yU8MuUdx+SPay7Z5aU8pC3vtDgIeleI07utQbx9UIRlzKfS4Vgx0YXQS2Vp5?=
 =?us-ascii?Q?XGhL+ncYSq5HZH1B7SsB/wgH9y7tCwdQomc1SMDbmlyKL/z4pXrJHrWoAcTV?=
 =?us-ascii?Q?j21iea4ZxlMUlQqimuVouz7gAxzkgi70SYVd2U5lRhkZ97wVnedSZwIINO4l?=
 =?us-ascii?Q?HIKSx3jAOMcFWgR8OxQioANSMOE6pB66kmNlR0o475h9nEN9q+pf/ZNr0jsP?=
 =?us-ascii?Q?B6J6wFnfjdcNHsffjKxVHmz2PxZxBYzKx3mxJZCkydQMBHfBlea5aXT3e9mK?=
 =?us-ascii?Q?EJ2CDBhjY4xv2OLhRUmQmdupNqFSxphSSMCcGu1cG4vL3gQ0K2gRxT8YQiqw?=
 =?us-ascii?Q?ZEvgHOr9SsrD5feBTCBSWCtTkEL76DSqfayecJB/45swMtU2/b7oJ78yaT++?=
 =?us-ascii?Q?oLjyDMN4T2eFFXJpkYDkzfZb9CPqIBysdF83yCpU5nhdULd7+mduDN36AP5U?=
 =?us-ascii?Q?LOV3/3K3w+Pa502QFMDUo1JUMrRTzqLcOFGSCVE6RPUu8Qhs7s5gouXPr1Xa?=
 =?us-ascii?Q?vZiNIcbXDEqYvMjQoEXl5UHXVpOFNQS7SyiRN8QQoniS/iIWGluF674habwz?=
 =?us-ascii?Q?OtVH7SOnwQBv23JYgfSR6br+875unJmSbsE9h80CfUq8P0cVmxsRhAmbZ3Tp?=
 =?us-ascii?Q?fja2bjT4rYfA9xnSsHeXEaPhkyE8o/LR0T3cSvlosxqthEWVki/wsAwGeaml?=
 =?us-ascii?Q?UK2bWXIl8gvjPLhZQt2civsios2sfG0XeA8mPjHmORZYzUJpc4vhhTg419rb?=
 =?us-ascii?Q?zJAOlYMywiAGcee7BG/UodYwgif0t9RMSUQu7wYEEsiX93UQ5HW8FUtNmtVh?=
 =?us-ascii?Q?kz5R/zGJiV4Am9SEqwb5kqGn0MXXQS3XiMwsLeZSuMQkeBTY6mLxa2oMik5+?=
 =?us-ascii?Q?hGn2W1QnENjZ9oDiegebffQp2L6Uhwtpc6PyTyMEZkKcGywVr5tr4EHXC1gi?=
 =?us-ascii?Q?4mVqr/sJey7RL45oy8XEExepOJ+2qp/cVTMk0MYDAmFcjUckqG/UYYjCmsCI?=
 =?us-ascii?Q?s+gFMrNncmdV+uVz8vzmakfIqf/CRS6UlXUqgsI2IGN2g+4lxWtxbBSY9KjP?=
 =?us-ascii?Q?ekuLDIGcmadsWCeC4lCdnOId1AF8BSSQmdIP3Im3SdyNDNjTTehRqbIzvzgH?=
 =?us-ascii?Q?3AS4eAwl7+dSc1JkE5XBLWH1AKKY1PHnicbvhSme35LKpW5JNMQoM/oaf0A/?=
 =?us-ascii?Q?V3Kqr55tmqhLE+RnsgSpjjuaUFWdRVx8G7VUcCn46Yun9NKF/b/mboFt9DDU?=
 =?us-ascii?Q?mu1o6qjHHE3sgd28NYFWRNtL+erqUuhjY/OK8Jzz4Z/D13WdyvGbJgaJ2U5H?=
 =?us-ascii?Q?6KO7Y7joi7dHeTxa0Y0vDuhHFyo5Buv6Sk/qkYIoD2QV4YSXrZGBy9yvhJjI?=
 =?us-ascii?Q?tCLHYt0UAYTGi1YVJSIBoe+x7QrI/DoubZMOkJmZ2UEF2GjZOwtCQ7r/wCH1?=
 =?us-ascii?Q?aJHk4FgvRKJHbX1dOBHMDO1jZfgEshjl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?awd0M5AG6AsQ2vkEJH7nqs/UV4sHoK/LQNsHltEp3qj2TKEwq/I7wKg94uHz?=
 =?us-ascii?Q?gH77DxmqCIsM56oJVyX/Br6IZT/WE7YGPEODrv5NCk184JZLAa1BDv++PIiy?=
 =?us-ascii?Q?QK2twhcFuc9LzVIjEHMIoFCx9zHxvQW45bl2qT0YsIW7Cymm1oPOOLLNhGIC?=
 =?us-ascii?Q?EAeTdXEMQgDKMHunEZzj9ZBm33hQ1zJdL1i0UJT+8CSvcJNDBbcQl05yhVT+?=
 =?us-ascii?Q?wa4gd3R2KUF8GGDMkA3S0nirMv2D4Q3tHM5dW4WyWWidhtr2AVuQzqMpJm5O?=
 =?us-ascii?Q?72qQjuZsVVoFSO27Ex7g3M6/xFr9Ntg0nQdtGvZR1yBTUwp9Nzm1OAJjYiY5?=
 =?us-ascii?Q?6uJiLTtpFNGY8cFcTRxtEu1PP8LpMcWrrbiiFPdJ4T9XmnNgR5eGsBHRh12J?=
 =?us-ascii?Q?cSwTkrKYf5yHpR3WyRfTeZq+Mr0MSr7cg+oXFlK+s7cGLTicahrw5m4OlXwz?=
 =?us-ascii?Q?jfJ5oWgcTEi9pzUqstgslXxU1jtB5rMQp8Bib+hSTnhGOxzQ1aClyjeasI2j?=
 =?us-ascii?Q?eOiM2nqLAyb438fXy8ZUMoabZhy9JqeydqwBWNZyVfeR4H3F+muGOCt6WVVY?=
 =?us-ascii?Q?bGNJCBEoAFd8HP7aIP6KgG+VKg5F/svDJl6ULcDtqVfg8Yi89hNI19w6Ixmj?=
 =?us-ascii?Q?4KSwPR2TizuDkiFxG0YivRmkNK60c1EHy8ixGU32QowUOg8wupiWU8cr7fSf?=
 =?us-ascii?Q?7/1WbQESm8+TS+oiBRjvcvkecwU4kXPbv+bb+gfKSmB3XUjfZWz3w/vMYyU9?=
 =?us-ascii?Q?LRHw8oIQCWbsw1vB1BY+hWaDXjxKHnMyegrQoks7UavMXpbgntM7bAm9ETE1?=
 =?us-ascii?Q?BMX3xAX4bJvRTc8tPqVPI13pAh/tsM250ynW5f7CI9pUusG5/BIixfmomMCw?=
 =?us-ascii?Q?VSZFN656bphiN2bIOVeZQr12HYzBUww/6mSCjSgngsTRR6Rpkr8WYSqZWfnA?=
 =?us-ascii?Q?Exkat8rsIw2SP9j52t87amG0nV7PY5eQcRNruOEgzMhl+ffEaQQoEBYJNHiv?=
 =?us-ascii?Q?fcmr8BSzI0E3Hogrse+MxiWL/0kqgux0+ThH62q1IvfdvLn30zmPreNbgwC8?=
 =?us-ascii?Q?iM4UuK3uIr0h9EowbvzhTkDW22soyhNtz6acOa4p+Gfbd/oQeU19ad+ZwHk/?=
 =?us-ascii?Q?kKiUoURn9oLIHXkdprFXWmFN0qE35eYi1AiJPxbHCMz7dzgbMKFr8yVhZGlK?=
 =?us-ascii?Q?wkB3UddJk4pEX0RvVSNLTgme31IFEIbEJQ5tgv2d15pumxaEwRtJmcb71KnP?=
 =?us-ascii?Q?8GMm5EdxWobXjWinx7B0WsJyXxTZdmJB7LBlNBSGIJHqgTbJ5+cm0XVZ6DPm?=
 =?us-ascii?Q?yLTCiT/PClQhSjs6RFBriU/tMT0bpepQ9vBBUjEejnMRLXpjD7d24os1FCwQ?=
 =?us-ascii?Q?/IrWBFDl/wQUqk/mVmAVM0GfRHSAkmg33vnOdQiX8WBYITJHeABitSvpyfOM?=
 =?us-ascii?Q?kWe6q53v7DwetBQDCOWYZ5/0MPt2Ht6ay80dusiYTHvttfo13rgQgDe2kJpg?=
 =?us-ascii?Q?Jx8oH7lmWeBfSXOfqBwGd524oJymj42l6pgxB2P68XWF8Af2ewHVho2FpHVN?=
 =?us-ascii?Q?AsRw4vls4hkdS09A9KuYrrlSojVTe+aCKcq8MBUF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9fb5385-09e1-48b4-5154-08dd510f74cf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 18:01:38.3914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wwp5WR8ZbZlxPz6HP/STV9tS75PRC9g/E8D+WEnnUeK01sa2Jbqv3muyyREJbKFKgEl/yiZ/MVqJRwPNFhSzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10662

On Wed, Feb 19, 2025 at 05:31:00PM +0800, Xu Yang wrote:
> The i.MX95 USB2.0 controller is basically compatible with i.MX7D,
> except it needs use hsio block control for wakeup setting. This will
> add compatible for i.MX95 platform and restriciton on reg property.

Nit: Simple said
Add compatible ...

Better mention "fsl,imx95-usbmisc" at subject.
add compatible string "fsl,imx95-usbmisc" for ...

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  .../devicetree/bindings/usb/fsl,usbmisc.yaml  | 23 ++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml b/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
> index 0a6e7ac1b37e..019435540df0 100644
> --- a/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
> +++ b/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
> @@ -34,6 +34,7 @@ properties:
>                - fsl,imx8mm-usbmisc
>                - fsl,imx8mn-usbmisc
>                - fsl,imx8ulp-usbmisc
> +              - fsl,imx95-usbmisc
>            - const: fsl,imx7d-usbmisc
>            - const: fsl,imx6q-usbmisc
>        - items:
> @@ -45,7 +46,10 @@ properties:
>      maxItems: 1
>
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Base and length of the Wrapper module register
> +      - description: Base and length of the HSIO Block Control register
>
>    '#index-cells':
>      const: 1
> @@ -56,6 +60,23 @@ required:
>    - compatible
>    - reg
>
> +allOf:
> +  # imx95 soc needs use HSIO Block Control
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx95-usbmisc
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +    else:
> +      properties:
> +        reg:
> +          maxItems: 1
> +
>  additionalProperties: false
>
>  examples:
> --
> 2.34.1
>

