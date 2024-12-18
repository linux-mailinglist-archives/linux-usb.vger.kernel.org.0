Return-Path: <linux-usb+bounces-18615-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B01D9F5E4F
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 06:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B65BD16B338
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 05:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60113150980;
	Wed, 18 Dec 2024 05:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="joNoiU/U"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2061.outbound.protection.outlook.com [40.107.241.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E97014658C
	for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 05:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734500053; cv=fail; b=dcO6kqP3AmNLCcqhW1o4VFZ/NrDKdRU1mWSxaSxIvV25iEvTFcqh/MQ2eG9TTqi8cnK16GpFcMZeYB7c3p31Shb/Cg4P6hU8Pyz6n90JCaO7E5JHH8mJwJv88nnUG0DI6ADruip3bx0Vf5hNGBKxzE2JZKlO6MgxqxNiVVZhrxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734500053; c=relaxed/simple;
	bh=EjOasn0mS/M0F0T46VoRrJPvBKBO5xT53w+tXxzLEzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pNCmHlM6o4yNO5dn+h6FhFAZdTq/1RheQ7GFNUqx+KXQdGcU4TJ97zQX8w+eFQwlmTYIiIqTHgYg0F1zGzWW+3OPQD6lQjiLLYZf+BVYFBYaUbG/2B5PTNvnyTgLTOkUwLOAPiGKywwddW6avIhJ77+vjaq4CjpLDTcjWCOMy7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=joNoiU/U; arc=fail smtp.client-ip=40.107.241.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGoAc49KjdSPOxkSame9lM8RcIbXN4s3njmlWhxqL5Q1g0vQdiRIcV7hK5nP9vmOgEFnoGeYQ87AWDxGKA/Cw8xvr03S5ezyvDveVeiWYrUjZbF8o5LSWisk8UWHtnJ1AZ1IHDgWuVxFS+ND8ER4HUeZI7Wps/dPR+lGYf6yuu1iPvLiMifm6LjoJUEFBQy15rV5MPmYKShzgbSsCwTYM6A1M1j3Zb/HsLRxWMC4lZrUUID62cuYImwgvVuAXpDStW9VEdcQ7WzmKyn7qAUY4X0MiyG6DT9haRSyxY9zZxQSVkf7etOv6GR92sC0MmcCOFJDaYxuhEsopRRfr+EObA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ON9b3vNgd3pszhxnS8w6QuVYkx0pWN2ok3Fz78+hasI=;
 b=Ihvcv2QmKYhmL4cYORfw963FwNt50GidTuh6TrTCHl4eXPKjFodfYdzolfdTWUFjpe1vRW276PLuNc8B5Kf8O3BCAsMRZw4t5bPLtGeErU12oGDO32ldcBkqWz/tzR1LwIV5ZEhPhHZvSlyz6ejcSdEI9Jko+za0ErrW/QUG6AWWb9+6Xr/n7y2DaJG7YJ5RTea6utr9uC7HIv0UWvYgE9fKdVF+Nr5+NK/2r0jcwFkZawqRX+63H0C5jnS1yxWhitiEwZ/J3uuI4YD/v+YXBCLEUT3EgvSbIY4l1q/roFyhu4ZQ8Pex+QK2x22IUBoh4pZqE1bvKCIPd34TRxB68Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ON9b3vNgd3pszhxnS8w6QuVYkx0pWN2ok3Fz78+hasI=;
 b=joNoiU/U5HwHo8ys6C4s2ZJhI1zfddeTXUmETtqm0Vw2z2JINxsqgiFxHwLXRT4fbpZe5GYZKE/SlOr9z6oXGR3BuxPtdiIgwebdAQN9Jw/az3HfXF/l3w+dIOJeng/sz+cLbkw7QzHTuLf3Habz3+zuN73b6PPi+3zWJxS7YzRsLeONNDHt3XJbUb/Lz2L7aiPGZZNIWy/MA2pzrhPXeXo4F5sFgCEZBuemddSsSZRep4ocQgbubcQa8I1bK2a7OsBLNMzNFNU8ruYrjN0jFNgu22akdZrZI1ltRmpEfsspGl/D47YiweDVtsBRSXip+QKn/TMyA2TSL+EC1VjB6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU2PR04MB9212.eurprd04.prod.outlook.com (2603:10a6:10:2fb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Wed, 18 Dec
 2024 05:34:07 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 05:34:07 +0000
Date: Wed, 18 Dec 2024 13:31:20 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	andre.draszik@linaro.org, rdbabiera@google.com,
	m.felsch@pengutronix.de, dan.carpenter@linaro.org,
	emanuele.ghidoli@toradex.com, parth.pancholi@toradex.com,
	francesco.dolcini@toradex.com, u.kleine-koenig@baylibre.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v3 2/2] usb: typec: tcpci: set ALERT_MASK register after
 devm_request_threaded_irq()
Message-ID: <20241218053120.7r4ytd6bqzcmsbcm@hippo>
References: <20241217091208.2416971-1-xu.yang_2@nxp.com>
 <20241217091208.2416971-2-xu.yang_2@nxp.com>
 <20241217163506.GA80703@francesco-nb>
 <b378e1ab-5699-4369-8fed-fa6973d5aed7@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b378e1ab-5699-4369-8fed-fa6973d5aed7@gmail.com>
X-ClientProxiedBy: SI2PR06CA0008.apcprd06.prod.outlook.com
 (2603:1096:4:186::23) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU2PR04MB9212:EE_
X-MS-Office365-Filtering-Correlation-Id: e83d410d-c50d-4eb0-d539-08dd1f25976b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|1800799024|376014|366016|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?YP8NBS7E88g7AzxzQvTtlpAvXk8wzjqNQzBLLOO8uPoAOkXvrgNACZIaemzR?=
 =?us-ascii?Q?ah3UFqzhBgHo3jyU9kTWQsxv+Xoib3T1SsPzACTG0C4BYnH/VpnKcArfFDNc?=
 =?us-ascii?Q?o6sSbIm5oo9HFy9flLBnAzalirsfwnafD9U37eyngzvXIrVHmqvU3alMr6Qm?=
 =?us-ascii?Q?sU2AoD7nBcglhiZafr5Oj1O0BZnkqXkLYYvyR7gpj6zL9phP8rHSRWSmg9Un?=
 =?us-ascii?Q?eHQ9WvKH+OhySsojKbSPwcz9Ff062ktzCpEd/5/CB7KzpgWb991172zgdNqt?=
 =?us-ascii?Q?vFYE9f8yz0x8sRhSoT+pA/SlnWoQeDKiIgAFXI6tyP9Rk6xN0yw7CBlUzaGk?=
 =?us-ascii?Q?tqmERdg5eCT3pCIOmWDT29pO7mTFP49Cq0M1n/riAiY23UCX7MOn2IXYORHM?=
 =?us-ascii?Q?yWvPF8D5G7g9804xUW7mo3O1u7NpuW2pe1EmFcWmdZ/fF0H/ygWIEyUcVYPq?=
 =?us-ascii?Q?yh9kqisN80MirkbXEinSmbi5XbPoAb0gnC1408FAFpHCt6gxS0tog4Dk/0kY?=
 =?us-ascii?Q?M8llhRyx3xaV8LoFRDxP9MJho4ySMSzpRZqi9jUYKrm9MxO6Ga9jsmexcoys?=
 =?us-ascii?Q?Ak7D3rAosTvgVUPBKzbUUx16KT4StSOAcutrdmtpDIhoyYmWvh0hfZd/oAS0?=
 =?us-ascii?Q?seinrbx8bLrGiySkwB6XTQulzqG3Wk157Xjt96HeuC/5QbmGGV7K+JoQ47CF?=
 =?us-ascii?Q?5+sLIVsxakmWVL1s46spkaLGRNfuuZlwIGRDCJtz1bJin2anF95gNoHhvccP?=
 =?us-ascii?Q?e0JPKMdET8yUxyC5gX8VeBUzBCjg9rcBhcmSt67Ff4KqB1117aNQQ8Yt+WIY?=
 =?us-ascii?Q?n401JCjOjh/sO/pz073FXJe3tFOnQJv8NRSa/cwK0WeOp/LvJvAQmVRc5HiJ?=
 =?us-ascii?Q?Jd4Zat9GvyKCs+5lK7sDy3Cq5GfvC62FR+Veq8VczIcXzBwx9itJxDN9tVsp?=
 =?us-ascii?Q?2RJpZXG44tZiFBLQKgduF6gO9CMr+3SadIY47XXegO+5v63yIs7H9JBreOCJ?=
 =?us-ascii?Q?2F9kRV8qs/8v5cZ18RJXVwL1G2QotJxFJHY1k+mReMyH6YGjfqw+9Kcji71a?=
 =?us-ascii?Q?NjMRq0OrtO4pMXFlZ5/opfA5l1cdz4srxLu6vV+ppZT8iXDIIvDFysFjT90y?=
 =?us-ascii?Q?IQwEovJCg52uQmGnBEIS2Ggh0pyKaP5hb9aEx/U7b5Rg7SkHq59LITKehvRa?=
 =?us-ascii?Q?kyV2wvXNkZ9tLkBZ7r4oxkiW4WewrxtIPU69V5rHAUjavf5tKVFU0PTIO0Kx?=
 =?us-ascii?Q?k00+5XYqWfjqo64XMouQuYMW6RBeJoEd1XramLFS9gHBZbR40dpQJv4AfH0A?=
 =?us-ascii?Q?DuW/EcUqPPDeZaD/Z7ZdQkiYq2PBkqQJK2d21W+Ociryu2mAAcESNmAvxgyN?=
 =?us-ascii?Q?1ALgqkLGAFWnE41pJgEt6BciLeB8jicqKQIHuSwHIv5LY7rQdcXKMtY1uBgm?=
 =?us-ascii?Q?Or0HI7fqMohEeeWQWBMKqhw40M7YCR/i?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?UwMKpHMcmBHwvtTNDKJ/g6MruHhZcRyCO04LC2+uRWetqcr8HXiDfjGDve+J?=
 =?us-ascii?Q?qiNNlJQiynMA6pbDMrMSY2Kd9IZOJz87joxWZ1PljnBhl4+C7961ne/bo2Bn?=
 =?us-ascii?Q?s17zKRImeu89HJGWuofF8f5XSFssd3HwDoFjIPV+OpyBUwdIxUhGWwGjkyho?=
 =?us-ascii?Q?0U6We2SLqa3g5g1IEpTCnD0nYF3sjrE7xu3fBWVO+DLI0wEWZWqCMy3bXFvX?=
 =?us-ascii?Q?qzGtXtD9G0SQvF6CHuhTgTpfsmR2CcgPaJFE250yYcOgwDqiC9JkpOBiuDX5?=
 =?us-ascii?Q?0Zl5plI/Iu6DmD3HrlCNUi07UbOFPjLuO2+u4IAnVqOsRu3q7PqufDF+kDjO?=
 =?us-ascii?Q?NjFAU0MztLxv917ZgdGi40n4jUyNx5fMwQk6dhBfX2ULR2YICoL7j9+9nvp1?=
 =?us-ascii?Q?5QcGMRAQrssNnU9XBas+sxtNgsGpqL54CcaotwGcepvJNARjJOgizlB4H0nU?=
 =?us-ascii?Q?DIKBwKW76lvWxpXGCtJVgb6iBIeWmojGD8bqECENIJUt8QQ/ViCj5sp1TlpN?=
 =?us-ascii?Q?e0I8p3S3htnHYDzK2jKNi4TeVslJioYMui8wvhuEmSZxlfucT0YoI55DESWv?=
 =?us-ascii?Q?xjSeeesUFRyqmG8wkTVPqU+OacO2GsyjamAtVtysNIcnWLQq4y3ek6qOxkOR?=
 =?us-ascii?Q?tPMgL0gy3RdcrQKNMy7WXxB3g1/s0vyrXZW/dMIHbV1lLstkeiH+lB0SlN1d?=
 =?us-ascii?Q?0p8KjqIuzuGVnLUBRR86pCI3ozdjtNq+5cnT1dopCXNWUavrO1KuXpCs5ab+?=
 =?us-ascii?Q?4EpXFcMcYp4wt3eMyLf4t4jMylzrb2m7fJOJRQezGIIuW2xhx+uZddPveIIg?=
 =?us-ascii?Q?9xtumejn8xy2nP2joF1dPDu+fOkYHt+vOyEBXILt25K8g++1bkWmFfWYZYQg?=
 =?us-ascii?Q?9IHNazU6+whAz2IBRzfL4rCfJQezCpA57A4Z0VPg9lVpmOflpq5t/NxOU6ni?=
 =?us-ascii?Q?1LHXWiVw3BnggrUcVF2+yLTAEW8OziRN1K19HG5ZZHUZRT2UercFm8y2IjA/?=
 =?us-ascii?Q?sLvePE/E5JIXr8C7yOGP1PtZ7736ok0k2AsgS29Y+G/RizhF9k86VBQMKf6r?=
 =?us-ascii?Q?huXZUcm1AhYjCilC/2UPBqFPqOwvUYtB5t6mt/fkThj2XR0ItL9gbbj3+HMj?=
 =?us-ascii?Q?AWCWvZ+ay3UC4lpK4eAqyoERO2Py2r5ul64pr1949yTFN1vUIWywpCt0vDUG?=
 =?us-ascii?Q?yHYYnzWE5f237fOzUtOPL4VNe2KsGDerCzod6h33SWznRRo4WSlQNptMWTSV?=
 =?us-ascii?Q?LEFdL2q2MlPcvgJPB2/6ByNPJvTQ5XoTm+Qz+acZFXbr3t6yngOj+bVaZedK?=
 =?us-ascii?Q?zs9WwpeKQoHMrq+bBQsK1ZFuN9pncErPniPzkqxD/stkIAvdcHfR+JOYfCSd?=
 =?us-ascii?Q?+GPVNMJ2kIMedHTGE/F0qROi3ni34RWtateZ/nkRnbCGwvjTkithispUdK01?=
 =?us-ascii?Q?z4C6rClUHSZcbv4ERRQHQpl9FecbZc78CRkf1XlB3RlN8DzTm7rptL5HLXax?=
 =?us-ascii?Q?v9IX+fbxTo4nCy8nqZu3CJ9pWm0q3Lujv9A9didQnLh4zDeC8SC31EoXySNV?=
 =?us-ascii?Q?qtD/TmGxwZbg4fcUbWdE9nz44xAEMApA8CgLQxjz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e83d410d-c50d-4eb0-d539-08dd1f25976b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 05:34:07.3213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8dlc5cjawZbzHd5+Awpmu2B5lsMWHi7QTc9O4mq96jPNOJFncLj2HRim9mUYUOZdx4yt1auIfLjJB13rKjhr9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9212

On Tue, Dec 17, 2024 at 09:29:36PM +0100, Emanuele Ghidoli wrote:
> 
> 
> On 17/12/2024 17:35, Francesco Dolcini wrote:
> > On Tue, Dec 17, 2024 at 05:12:08PM +0800, Xu Yang wrote:
> >> With edge irq support, the ALERT event may be missed currently. The reason
> >> is that ALERT_MASK register is written before devm_request_threaded_irq().
> >> If ALERT event happens in this time gap, it will be missed and ALERT line
> >> will not recover to high level. However, we don't meet this issue with
> >> level irq. To avoid the issue, this will set ALERT_MASK register after
> >> devm_request_threaded_irq() return.
> >>
> >> Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > I had an offline chat with a Emanuele (in Cc:) that worked on this a few
> > weeks ago and he remember that he already tried a similar approach, but
> > for some reason he did not work.
> > 
> > He should be able to try this patch in a few days, but with the upcoming
> > winter holidays he might not be super responsive.
> > 
> > I wonder if we could wait a little before merging this to allow this
> > testing to happen. Or maybe you can just test if this is working on your
> > setup using edge interrupts (you would need to use only one TCPCI, for
> > the test).
> > 
> > Francesco
> > 
> 
> Hi all,
> 
> I was curious, so I tested the two patches. I can confirm that if both are applied, 
> edge interrupts still work correctly.
> However, with only the first patch applied, it does not work.

Yes. This is an expected results. So could this be regarded as a tested-by?
I have tested edge irq before sending out the patches too.

Thanks,
Xu Yang

