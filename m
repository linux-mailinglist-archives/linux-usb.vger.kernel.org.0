Return-Path: <linux-usb+bounces-14976-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A419397604E
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 07:26:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1742A1F235A1
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 05:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65907188912;
	Thu, 12 Sep 2024 05:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IbO2Irjx"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2073.outbound.protection.outlook.com [40.107.22.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F5A184548
	for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 05:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726118783; cv=fail; b=NU8ZPNK30REmgr57JfVRLQTzcw/UxrPLfCnXFxYMG0jheyJqNy/aq9pyxvQ3YfHovksZta5eyLlMU1fdv7mu2lv5B/mZ+22snWYMhQdxSZyxVUBa/YX73UbfH1QYQR0et1CzUEaW9FFKeKWHurm9m83RwZvrE1alMGtjrvLdpT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726118783; c=relaxed/simple;
	bh=eMMgiDgy5rDm6HErgCTRQimed2Q/k58rgCkAdwrP8II=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iQidjLBzP9wUNL/ldSMWP3E8zNzOaUzj0uHwzrwv1OqAwHRR6bUM7dwq+HmdxBhZi0dtLFGwc4+rrlTmw7HSOPDEdwFrAflXwwk4zRgOq67r5i8RVHSdTJKY7I1nhHjXcmUiXLrB6H7FndGM7Zj9POGWQUY99Qn/ucEOlDkbRL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IbO2Irjx; arc=fail smtp.client-ip=40.107.22.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gDN+u0uzQTscukNHtKhmS7JKYBIeNfTGNMOUqxQLKcdPA/wgnsFewFs7wTKBBfA3ZuZsB3oTt2Y7L0fcD/+lbKYv0yflPZUAq8z9NHEFchGXgXVzZ6Wa8r/AQhzk+fBij2SdIGx7bczqvzXuQzocsCRimtIC5gJkLvQ/O5/0UygjnajctCNsT7W/DaiSTyqnv3pTploS4cFHfFyaga+h1ZE15NCJ46H9BIYUYnn+T5Ymlr5A2ZcS5BfFLlRj81M1tRL0luL7uidDoYqNHzjBmMT0voQMAgQFzEoeLBOH7TAUoml8Q/myL6Nn7qYL7ZgDugR5Yc3nnHBaaUEVrIlGpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvdGqTrPn523AzR3TYU8Si/XPL2id9VmrfkowX4Kz5k=;
 b=CHBbvsjBHzutqV4BcRi3/tKmhmUn6j7HNuvzwef8LVybeOc44qfGggyA9/jV7IkFfz9Qc2PC0sZywYMgnAA4y/FPYsIsknRZ6z51tl2saS16cb8UZDuX7B7bbyaoVQjFtdN0c9vBAeTnCmLqrf6MvhCbV1IZCvAtBWjbWBuU6sZ5uFTP8GFKJ044qEgCYhFgJNMbt/eB5jAsingNhcZBv61H6hkHNvlJ0NdRLy3jBbu8gFUNlAG4+ipyNd8lOe7Ww5+J1bH9TvWhakbHPjvt+QSZx75zR/JeZnO0KxLUsOUuk1EXXvvNYw5YiLfucN9RWR7wn6vkzRRu/CCt4mfACA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvdGqTrPn523AzR3TYU8Si/XPL2id9VmrfkowX4Kz5k=;
 b=IbO2IrjxzhbufioaJTGPeibxQ8277xnM2IROMN5CxTXCmeIduye49bsNH4LYYRhEY0H4wlfMT1VE7e9CMhlIY6v+73wBD9pBk2UrJZmrfDV5JbJRJqvrnsXpdUZr4wTrVKmtI08wYMZU9uWAq2/6PbLac0mnKwOGNtLy1dBaPoBOW87zDuR5QfkJ6LfehsS4faszoWIRBXtEUmCaeM8Vxok+WtUHngjoALrk4iwnt3Hhc3FWAs9RJwA498iXlhOPo5UICJANCVCyP3BcsMn7FO/J3wBd230tuQwx7dA9KeWpNSyseKoYX3DVOqGJSBx1bLTh7twHciTgydwoWnIbCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8925.eurprd04.prod.outlook.com (2603:10a6:102:20c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Thu, 12 Sep
 2024 05:26:19 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7939.022; Thu, 12 Sep 2024
 05:26:19 +0000
Date: Thu, 12 Sep 2024 01:26:12 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 1/3] usb: chipidea: udc: handle USB Error Interrupt if
 IOC not set
Message-ID: <ZuJ7dMdQ2TydDAmI@lizhi-Precision-Tower-5810>
References: <20240912033551.910337-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912033551.910337-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0164.namprd05.prod.outlook.com
 (2603:10b6:a03:339::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8925:EE_
X-MS-Office365-Filtering-Correlation-Id: f0219854-c3f3-4836-41ab-08dcd2eb6e59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rNVOxQeX5QwjcZzNzZeQnX8F3gHPJe1E9qy24xDpBwU7sgyFrtUFCC3Ao5L6?=
 =?us-ascii?Q?K2La5Vr9KGm9jrx18BlPq7SdqPmKK9HmGcXqGYp8Y3AkG5OQlhG0nWsPpoje?=
 =?us-ascii?Q?lpw6xna+QFHNd8BysAGo0VNvnyo4U7wB8rkc0N60DZhyBxpqKBsTZsNg0ZAV?=
 =?us-ascii?Q?s2sImes/Zj1syPGtOX5ZAVhxavjMQypICDpu2bLgmtPDfcE2f/5gs1AY+4c8?=
 =?us-ascii?Q?itwP9K8EoPtoddVNKA4oY6PwPg7RXVHvYobSZ0VGuI328VefgTrK3avDF1wa?=
 =?us-ascii?Q?XOnBAEe0W0sDDaNP3b+D68NvMK8MJu66wnrMsAuHKY8dwbCUJKwFmD6rJyCz?=
 =?us-ascii?Q?GoFUXwgK+h1jDwvyPpFOBiZi9YgzKmq9WknfglzSjSudPOsht8g+D/bEAgrX?=
 =?us-ascii?Q?jFOOlj2eaIKZ0ETAcgpBiT16gL6JI3jrr5CaD0+tiWM7aW6yDVaER2dnJpcc?=
 =?us-ascii?Q?2uxLh7W+3U4dZI7uNc7p37LXM4/31zybQJcx9GMIAUueo+rd8joevZv0KseY?=
 =?us-ascii?Q?cI4W4gjQ4B41NexEAyVNyXcepcLxtrOm7oFwEVzI7TZr7YIcmtGts0V7BmEc?=
 =?us-ascii?Q?QKXZYCZQp5aGcKH/mAS0kYrA9D7D6I3JQUWD59Ebe0sZ2AjMkiguLyO4O7cu?=
 =?us-ascii?Q?GphgI9/g/EaU/Rs89IKg7Ei8YlguIwZTdflQFn1744CAO5vuUqv7pG7Z/lbV?=
 =?us-ascii?Q?/5zCEiTD65qsfBOWFs0eDezfmPJS4RvtvnbzN/fVI74W7Qg6XAef/TadmS+z?=
 =?us-ascii?Q?do7xErYWCbNNlxpk+pTsc8SDtSvRCYIaUsmn3giUB5uYzS8EizPnG5Da+PNI?=
 =?us-ascii?Q?Za+LmNoS+DfvXu6+EJBNqaCTq/T08YWugQVv40OYV6iwJ/G2X7wl250iDzWm?=
 =?us-ascii?Q?QbITXttCk1o2Z2zqsNsMvrpuuxiHm5F93cfX5ep2ef3JJ7hMDyE9zSEZfINg?=
 =?us-ascii?Q?Z/WglUMeGA54RyMByHuft/MZfUoRoVirwlZwEHwHu9+HzWSjFvp4rrreQjNU?=
 =?us-ascii?Q?3QCnSeZMbWJaq9ugTNe0406YPXdyz/ZxNYhDM1WJ9jqEWiZ44uWa+3HI/gX4?=
 =?us-ascii?Q?9T5CK5eldm396HyaZYeTVX6Ua4bfX1lqWZOO0jFLOF4OQpoj8J5eWGrmP29S?=
 =?us-ascii?Q?gdm7ZCKeH8vAuNaJ7Vc28IIhp2HTeP2TdAIJvm0+Kd/EAepBNfeXGJljUX3E?=
 =?us-ascii?Q?64T8Riq4bGFOlatXt6mGH9b1ikH4+9z86//DbKZRQCfuVEv/Agj8rJLueZm5?=
 =?us-ascii?Q?K1ZDVQ8pf4I3B2i/3zLcm/QqKMLDb4TRdycyW8CVkJQTWd1TPLYvKWLEjpMN?=
 =?us-ascii?Q?4/1h0RH/3seJdNLb5OANv4+nEkhAd7y77eQaBhivOhzMoxEy1mWB1aqrqhtv?=
 =?us-ascii?Q?lK0nCmMldpfFZiIYXtd+zgD2x6od3hgKZ5pLc2NMaX668Z+Aow=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lqDgb59lldsVKYMCze4P3MU0WCCgOGvx6g+fEeDlC0j2LNmbPR+zYFmJpsrE?=
 =?us-ascii?Q?O+jYpz5QOp42fmw3UthYe7B281ggbDc9kNGXrj7/nkLV6k/cuBuusroG5K8F?=
 =?us-ascii?Q?BnUnS/n72gxAQpDh/Rjl4PbWB0jgsOSfp2rDWbMUe0ja/nubDkcpN2o3kKYP?=
 =?us-ascii?Q?G5zJy1Yyvh4uJlhwiDAq3K/x0I9X68PTe2LKKWWs8jSppHrHc8/pbSyYoSx/?=
 =?us-ascii?Q?M7wbp36yEPbzlmbnd4Zng1LOcSKke5Az05Qf6ImHnxenn9hRp9o96lbC3pIC?=
 =?us-ascii?Q?CSGkJVrL2Pwy++paOcvr7Rzpc10oalkaSotLRXEK8YedyLIsdsOtb/GiM0KN?=
 =?us-ascii?Q?6jZCymeu1pHyXLATjrWOc+/y3IWe94l74Ed/2BhCKC1QH9ecqj/XYL5CDaV7?=
 =?us-ascii?Q?3jPLKssLQs72jWRuWQbaWOeXBqD1MMcy+14bWPQtwXyN6phCN0hl9wzkaBY8?=
 =?us-ascii?Q?dsfuwcKHDzAWSag2X1rDsUDIXA/Izr57Huifuw9l2psh+kNABy8MH3exNnZn?=
 =?us-ascii?Q?h1G7UdspjdpBxStTKqtFfDu+XIwpTGNwNNU2qPWiMq9xV0wXrx9Lm+fm7BIR?=
 =?us-ascii?Q?iIEjMONJE2upqGjtZUD3ZjCICr2Zdo65V7osjwLx8WWKB/OGHL9QKfjohGTs?=
 =?us-ascii?Q?ITyYLN85mC+bcTqm5B7NBlSonrZL/+GhyGnD8WzUy1zT/RWaFPu8cpQ8YPNs?=
 =?us-ascii?Q?esj5pS8G8dczu26issBs+71lRtovfERlRzv3850emD08w9h4nFyKNvYr58s0?=
 =?us-ascii?Q?5XHvZpIaI7OJXKRJycfyfAXrfpiu0ZeQHNcvHjXe1xgrsW5e4xuRxbGY1euz?=
 =?us-ascii?Q?7pfzu19gY1HhX9Y7v6XD7d4wAJ3Ywmm78HHNHlOGcuh1UBPv7FeU47XW9yqC?=
 =?us-ascii?Q?QMNFR2HZcEV0rg+AWZ6jX6FPEcsF8Tvqij9Hju5jpNavCDdVHSr0J0QTz8qQ?=
 =?us-ascii?Q?rrTogFWH57I4/tOazTpzpHffwc3ZCP1uWu4CIzQAWQh468yPTQ1TJrGKDIK4?=
 =?us-ascii?Q?LEyIUc5q9f4QPoZbQIK8qAtHB9PRq8lJM7IVKbvAwem3sIhhrxWCQuQpeiNK?=
 =?us-ascii?Q?KaH3O9m2l8j42L7efGiyPmzhmp84VA0ynNUAL+pyKe0ME5fmnH5QVftdMWDA?=
 =?us-ascii?Q?d3j3GGgu/ZpsGSk9S9NwqLdUU9kS3LygLj+hKqBeDUzJ/0dL+C1B2V8OHap8?=
 =?us-ascii?Q?i5Dykk42OCuj8y6sZOhcp4ZMNNCgM30Meq44T4kDBcPIx5IZMSmMT7cymgER?=
 =?us-ascii?Q?/H93Ee1qLSeD1p7TG51o9Rgd2cRcPXuyLVjZ2CGsYx+TnYMrOf+luALuKDW9?=
 =?us-ascii?Q?cQ23oDYGc1xohe5xAdsnk19eRj8urhoVmRzQes/EQYLoJvd5+QFTd8xwFBLl?=
 =?us-ascii?Q?14wpzFKlgURx7Ojo5xtSpnN0Os565Wk5ciT2MynhBQkSNdh5BvIMBhOpwZQz?=
 =?us-ascii?Q?9zLM56qqX5Wm3OPRetFNIX75rDW4VVJYD7qksaJaYLd96I6jWWOJXFfoPiUd?=
 =?us-ascii?Q?2XJ5ANH8CFvjTHcXFZRsSQCgoBGC8GMwtLie145El+PdUvq8iFi9uK6VpNh1?=
 =?us-ascii?Q?FKdzziIdu+LN9oQu872LG0t+sw5uQCV6yOPEPxI/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0219854-c3f3-4836-41ab-08dcd2eb6e59
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 05:26:19.1627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VRTT6amZdh31rsjqRQ6GX5FlbHHxM3JieAjnW2jKOImEkOPBR07+EBEA53tayP6JgJZL9TyN1SrFRRlknHMLkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8925

On Thu, Sep 12, 2024 at 11:35:49AM +0800, Xu Yang wrote:
> As per USBSTS register description about UEI:
>
>   When completion of a USB transaction results in an error condition, this
>   bit is set by the Host/Device Controller. This bit is set along with the
>   USBINT bit, if the TD on which the error interrupt occurred also had its
>   interrupt on complete (IOC) bit set.
>
> Currently, device controller will do nothing when endpoints met transfer
> error if IOC didn't set on that error dTD since UI didn't assert too. This
> will also handle UEI event as same as USBSTS.UI for such cases.

UI is set only when IOC set. Add checking UEI to fix miss call
isr_tr_complete_handler() when IOC have not set and transfer error happen.

If it is user visiable issue, add fix tag and cc stable.

>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/chipidea/udc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 69ef3cd8d4f8..b9ccf62e0a50 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -2063,7 +2063,7 @@ static irqreturn_t udc_irq(struct ci_hdrc *ci)
>  			}
>  		}
>
> -		if (USBi_UI  & intr)
> +		if ((USBi_UI | USBi_UEI) & intr)

Does it work if check UEI only?

Frank

>  			isr_tr_complete_handler(ci);
>
>  		if ((USBi_SLI & intr) && !(ci->suspended)) {
> --
> 2.34.1
>

