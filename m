Return-Path: <linux-usb+bounces-14973-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA7497602E
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 06:55:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCE621C22DBF
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 04:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8818C185B7A;
	Thu, 12 Sep 2024 04:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="coqW1C/1"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2082.outbound.protection.outlook.com [40.107.21.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415767DA81
	for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 04:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726116906; cv=fail; b=t64hM5ho/sKZWjAwoIwwdaVlS9XzWEwzbF+ylUi9vZ7cL2FtD3JzxO2TPoJv6GFq53rWufg0mlv72OhHKCTQwJGjfjdHguXvgskE4TP3yd0kdO6SZMMWnBAh4VmR/dA4V7fc+9+7yJhUzKtqh89PSFDhLZdq4kKHATQUITHI5/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726116906; c=relaxed/simple;
	bh=KbhFiGcsvplu/tbXu/cvtBv+Y3XQ0A6kePPP99Bi3Rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z/ZgtrSgjg2oEfLKdUqBpT6ke++/t3VD0uvueFt5jJFO+1C95tnT/8QAu7TnsBNSVQtQDiwVJ/Yakm+EDG5o0cxNw46Mf9U0Q3QkVf9oGrL75qwDBVUZh7OAgsNTEBtH9AN6hUxPiqCe2lI+Rjlp1Q4kel1bsRlLQ8J1awBjnqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=coqW1C/1; arc=fail smtp.client-ip=40.107.21.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AmLAQE6om3kZ9w04lqQqmtljdfyO7jqkMqF6H6kONP6rv/MWE9y1TSdm7oZkOQMRuOt7xSmWsnSYMo4xaFeJEGuGgoUfKKj0dyqNVOza4ADxuW4f9oV9yw2JZDzBOq3lqqjmLJiY6NeRCc5NG09rwS5U4j706UlIWObBg7x+1xWYazvOdXtAHAY3+Aq/LG0vfAB6gTnIjuEcX7mo3JQPTLePuVhesFUpUQLg/aVlXjJOwNQI2Bu6CgZxwe3A8QnpvEBLRPcQDnZmSlwCmPRcA2wxvS0V51m5riGw45mknPXGynmqeF3RY6l/E+gO9N72nvuvdNA9Fnc1oVJyRcMnhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70zk/dLmE8sRXX/bTF7/hkAHWDtsZX5g7uRzdmR2e+k=;
 b=iVZlcaM5C338TpUITKww7HkDfC6vXaEozUoeQs3C+Trv9dq09sPsMwTPYfg7nO+1V31MY4v8MFX55fDLidA7Zub+ucpiR8JDHuejZZtPnrLJZ2RNj5ojDSMZzHyTLkWwqpKB48GrCGPmvGWTtoqo6ZUSYwbN9XT7n7fyAdCoO4FhH5+h1S13IQXbfs+ED/1yLMHAbTVm381nH8MJB6ab7nRMww8nsEhehZILnOBbGemO9DXN98g02m5GdVGHnzOEJq3mqXIdCRg62TiJwy6qYTdjyZDyQSrskhsVoNTJCDrM7y7QnwjQ38DQbRu6EDVwn939JlLfLcJQpoJsW0Ijyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70zk/dLmE8sRXX/bTF7/hkAHWDtsZX5g7uRzdmR2e+k=;
 b=coqW1C/1HtkS0xtmUgVa4tFVinG1ZUEHMcxk5a+vp4sOFNPc4zHRRu3D5JZLz/zATcyseDVxEoda8lDZ4kM59iVb0FKC2A3+nCTGROK+2IR9T7zFJKYmp9B6gZo5z+aVeryEHC4V6DUSxrZbEUpL4iN23eITAupr8Qy6SSpQ9OPS5og4TbfkvjV8x7tHD0/kQFtWaTLPn7e0x9xjGpaq+i4BTCtSt7ElA4TB8YLJr5k5rsjJclGteFLNYLc4JydcGfJvSJDuqCnKrT6qJakhbIB+S5BejCbdekuzG8yJtBPLy3Amk1oCorTqdjEPVg/hEC2FxMyBsde5keUgyiKdIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBAPR04MB7461.eurprd04.prod.outlook.com (2603:10a6:10:1a6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Thu, 12 Sep
 2024 04:55:01 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7939.022; Thu, 12 Sep 2024
 04:55:00 +0000
Date: Thu, 12 Sep 2024 00:54:53 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 2/3] usb: chipidea: udc: improve dTD link logic
Message-ID: <ZuJ0Hft97VA21utl@lizhi-Precision-Tower-5810>
References: <20240912033551.910337-1-xu.yang_2@nxp.com>
 <20240912033551.910337-2-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912033551.910337-2-xu.yang_2@nxp.com>
X-ClientProxiedBy: BYAPR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBAPR04MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: 34b9ea9f-e998-41b5-6f80-08dcd2e70e7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MMdde0DDGk0Eyhpsp8kYbXpHgagG3GbEfwZ+q+8PqJGGaf9Ofe++OKabpmPv?=
 =?us-ascii?Q?Zq3GnxGM/PcD6goLtVRHpMpT2srGjk6Fq+7eaBlTH16jOpna/rFgizVa5ZzW?=
 =?us-ascii?Q?iM59WCx5+OqygxNX1b0bOw27kTOQlLw8TYO8U3aQqmJhljRCjIc7QHOhQ6IB?=
 =?us-ascii?Q?BVCtoIS9ClP8rXVWFzre9x0cDJ4VRNWoFlvE+lZnOLvUs6X3R3kK/JkNBPGc?=
 =?us-ascii?Q?FHoZomHi6lIGnJIutzgxD4i/GjZrsYyJKQwmGa0WAC0IYi19MaRXPEDru0iF?=
 =?us-ascii?Q?hn92r6wUGHWUK7nyfBMKJruvkvoHrFOawmh4qEAk5UHlJvdpBhnBCD99puy/?=
 =?us-ascii?Q?dX19ZE9vxQwVogdRH4RGIk1tb05Y8SUT9nzUA7IbdcbkCptap0N4VN+gD9HV?=
 =?us-ascii?Q?0ux7aay/YMqmS3ZyDmDajjRajBLvqEgY9odLxSo6l0GZF2kB0UYgAaX16n0Y?=
 =?us-ascii?Q?cnbdJqhM7tlmrYwQvdc1CLVUk1LOXp36XkhWf4NsFvVBTK6t9z64kqaNedNa?=
 =?us-ascii?Q?AaSL718dvHo+gPWK6iZRrgqNiTmfiB51j7eZ2Zikfc6ygrmD+5HJbFk7rINE?=
 =?us-ascii?Q?YfNOwMXse7rKLQc1fjiVsJCQyggNGXNaUvlnwwvzhEjT4comYnEbln7L/6MW?=
 =?us-ascii?Q?BF7q7+P+5AnRsa5I+B2l8vfkxFlXVL4FducuaP/cOhvP+cbGNKMhcR8MiEmZ?=
 =?us-ascii?Q?TN2RVDbssNclYMbxjdNZQVqCmodrV+aPlQ1zMMzm/w8tWKq3IfCRFYPZ696Z?=
 =?us-ascii?Q?8Iqj52Gs2l72XxizBc8HW/YrhtOwpu8QtJpO7CQhWbZhpYzBi0gvTuqKiKaE?=
 =?us-ascii?Q?HNJfg9MwC6qAQ5FL0njlpYWbhApA3vPjOPC90JpH0neCTJSmnz2cC6UchTZR?=
 =?us-ascii?Q?ui1KBKWjBCT+SDj+mHpM4y1hGteeczvD1chhhfQAsK05aZWb3LnC0M3gY0yl?=
 =?us-ascii?Q?rYIiqmYnPy8ceWoUh5wJCVKPOQiAMEVTjXscj+aMfEHMTlzfzCTToAb+chwL?=
 =?us-ascii?Q?rgTtuGPr6ZR8mQbnJtt6ye5PGI3MQhAzHgfM1m3UCQP7H+fgsg1NNgPKkc34?=
 =?us-ascii?Q?Kr2O08Cm16zhMyq6L0jGdQ1mMWqLKdTaezrq2U6AYoGAlMVhTnD0Wpsxf141?=
 =?us-ascii?Q?5v0jRxTTlPLtJ1X/Rfn4nXMp5mn04B1liIZsEFTbMKPLoypL1UZW+pTn7wGW?=
 =?us-ascii?Q?nwYEDo2jJEMFPAqLTV1eVUPPIRJUy/qjfoi0YSva1W3EgczIDHdnfwu5l8cJ?=
 =?us-ascii?Q?R4e0gHLbu5y8N0tw2eG1qz7BFkHRq4MSHf/FGztQ5XNqDXUALtCoVO5Ukryi?=
 =?us-ascii?Q?gY9SbKki7zVAfrgwsbGQcBOKvuaAwtELNxVc3UmDVrQlVLInbOTu2+g2FbYE?=
 =?us-ascii?Q?txK4JUJ3M++GxXKFHKIrUWDY3UVV2FvG/ZA25pGMnSpAdlxaYw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E23c1EJ2A7HttPT8WS44Oz+pUNwnxCOBA08VgQEb/GfibR0VFZFK5443tDOY?=
 =?us-ascii?Q?hOo4al/1MQYMUog6Vup7vby2jed4uv3T2KuehX/tC0KGdl1kHLVsqO/Tp0jQ?=
 =?us-ascii?Q?l4spF0A6mI0/22o1Eo+yUi6wv+/FZD3blO8t41ez5SXy+EfB3+t7m39bNQ3w?=
 =?us-ascii?Q?GOWiumVRj1m5TjlO1nFgMu5BVayCbF8CILDkwNAJKii4aSnxQKmfoWAYYIVM?=
 =?us-ascii?Q?2PMCCTZDQJA4OR+PMpyvQS6bp0gdNo6RumQ+LDPLWGYliGELhFNTC37zcac4?=
 =?us-ascii?Q?CA4/DmuOeDJGcY9uNbDv8pjIw/AkTI0Qjq8Hzo3vyClsJ9epx62yrXCSijqC?=
 =?us-ascii?Q?8Zgdy+/ReD43uLdw1U+YfBhSgxHW3wUHlynoycil8RDH6dSPtwYU2Fxlbw4c?=
 =?us-ascii?Q?A1Wmw6WnsK2IhJGo9Nytj7L5XUD8pSc42ccVMMch1cZjpGTIT5WVo9MorWEz?=
 =?us-ascii?Q?ADjAcoeLCtYThzqBMD0JcdEyFb+b1A8YRoLugjLMi4etMRcMyrLkHnHdjHgV?=
 =?us-ascii?Q?49BBSPwKWp1lTL0yeIpOIu3rYkNILyZEtzNcPtxvk7JptY037yPyjjLEjFT0?=
 =?us-ascii?Q?IN9bdl4Tlpw7LwPukaJZ36FBNRc6TT6tgBTABVHGW5ROmWp0dugDObU3UCKw?=
 =?us-ascii?Q?tNNDHwGLskNNVjwVdNjMYV1pP40qI19tIZt3vcRzue3/0Vs8BrA8japVaMcG?=
 =?us-ascii?Q?SRaJmOaJgpww+4DahGQNgBnSRPJK9V2ZZwEhRfa07M3ESGDQVYPvnsWMRaL+?=
 =?us-ascii?Q?MpK8Pd0fGh0WIUKc6uNgE5k12uEn8fXIiP95X9zv9R5ViRKESjg/XNeKUzBx?=
 =?us-ascii?Q?BTyUpBC6xMXVTeOij8udkICrb7LK/aWdqX2JI/vgiPeOD1D1jB5zeNSCaEIe?=
 =?us-ascii?Q?Oba7JXYtKCK2ShFDnRkVxQjXwjZTXzU4GTQ5WKUiNCeCMpW16cyXWBybVoVc?=
 =?us-ascii?Q?JVf60Kbh+B081lTMEf0F9AOqc4OEjXcEnoS6qzdWpsJI047B/YiRQfeG/uhr?=
 =?us-ascii?Q?yQ2jtQTDUH0JS9jFTWmrFUlZYvPhd6GN+rIjWUQ7JTi4reDQbXQagPVOKNZu?=
 =?us-ascii?Q?4l1n5j8ucTzoEsmfqq6SOeChNi0NGXFVbyA4RvZSYR+wbif+/849gaIXQMsc?=
 =?us-ascii?Q?bp7jncrMQkLjaeq1ggf5jWb6TiBJWeCeMdTxPqO+7Y+xf3SDZBsmVU4x6DHP?=
 =?us-ascii?Q?ojNa9ncNX6A7lbNPnqTBSItZOzLv05o0Uyj/s4ufiGUt1WyzaOcmebkhE+iF?=
 =?us-ascii?Q?kj7J/Sxbekw28yB94/OXxo1skbmYYU1Q7oTmw3ZJOgbR8MCpGQW0xDLJ0dta?=
 =?us-ascii?Q?Wij93xkIf+GtQ3gwdG+HY7kUOOn+2uDqMvZYGNWpgoOrohwRAwm0moB45N3F?=
 =?us-ascii?Q?9s3yUKo7BaEx1VpXzDbXgQjnUsxP7jXjcTYCvzBRaJpYBF29s1ICgLkxr64Y?=
 =?us-ascii?Q?BHszCMS0ijluyYAtbOt8snbKNda5AsRX2kOLaUU19JTf7odXJ5TURf9cnn1G?=
 =?us-ascii?Q?I4wE5XA6H0PM9a9t/kZz+P47AVbmNKaX+NkfwMSpignKsIT2sVJy1frMUFEG?=
 =?us-ascii?Q?mjhjgCd3TMTwqXSYQSw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b9ea9f-e998-41b5-6f80-08dcd2e70e7e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 04:55:00.4428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nU2OhfJNjN0CEiUScnLI6HtR3z4g7lCF2HuJdYkoONmIc0XlIMOS71B5AOAX67BE5AAXgEibeFyvtJkPVdyYNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7461

On Thu, Sep 12, 2024 at 11:35:50AM +0800, Xu Yang wrote:
> Currently, ATDTW semaphore is used to safety link new dTD to dQH. But this
> code has a bug when the endpoint is already in error before polling ATDTW
> or just met error during polling ATDTW. In that cases, ATDTW will never
> turn to 1 and the cpu will busy loop there.

It should be bug fixes, add fixes tag and cc stable.

>
> When the endpoint met error, ENDPTSTAT will be cleared by HW. Therefore,
> ENDPTSTAT should also be considered during this process. In case of
> endpoint error, the current dTD should not be pushed to the head of dQH
> since some dTDs may be still not executed. Therefore, the link logic is
> also improved accordingly.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/chipidea/udc.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index b9ccf62e0a50..0ab57b87b07b 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -612,10 +612,17 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
>  		do {
>  			hw_write(ci, OP_USBCMD, USBCMD_ATDTW, USBCMD_ATDTW);
>  			tmp_stat = hw_read(ci, OP_ENDPTSTAT, BIT(n));
> -		} while (!hw_read(ci, OP_USBCMD, USBCMD_ATDTW));
> +		} while (!hw_read(ci, OP_USBCMD, USBCMD_ATDTW) && tmp_stat);
>  		hw_write(ci, OP_USBCMD, USBCMD_ATDTW, 0);
>  		if (tmp_stat)
>  			goto done;
> +
> +		/* In case of error, ENDPTSTAT will also turn into 0, then
> +		 * don't push this dTD to dQH head if current dTD pointer
> +		 * is not the last dTD in previous request.
> +		 */

OP_ENDPTSTAT will be clear by HW when the endpoint met err. This dTD don't
push to dQH if current dTD point is not the last one in previous request.

> +		if (hwep->qh.ptr->curr != prevlastnode->dma)
> +			goto done;
>  	}
>
>  	/*  QH configuration */
> --
> 2.34.1
>

