Return-Path: <linux-usb+bounces-19530-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6A7A1688F
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2025 10:00:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C34297A297A
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2025 09:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A74192589;
	Mon, 20 Jan 2025 09:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZidGc50q"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2044.outbound.protection.outlook.com [40.107.21.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D672167DAC
	for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2025 09:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737363620; cv=fail; b=DmydQ+lGtS3Msuk5+dRgeyH0aGASvSOMCmrqmAxN6okQH8XtHYsrrF414swgpzBfd6/M5Wl8IGrwpkCDSDUnKTHdyCLhOo6YxqI+JKnRAkQ2wX7ZR3tVhQf5jyN3JhXl520ZzTsi4UhQRD22Y5zZJLojc0tUDRfnd1vm+MlJRJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737363620; c=relaxed/simple;
	bh=LH6PFsseIk6O+Yka93ZBXUlaGB1zkZutM4e235PbmTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZstWuPWAlzxYSx2cPdpLDQoOr/JPx5caih56MBr9NLroL3rpRNRP32Ro4ekHbup9AdbPlQcxYrfMVkU/DCJ511wdRyRZm+wPtrgbVKn+3YvbAKFHnY4o87X+e+uaJvOfv556JPNta62I5jVGfAXUM0Lzvz0Wh5ZqMgMdojOPv4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZidGc50q; arc=fail smtp.client-ip=40.107.21.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uxn76wCT+XCmnmoESHVixleo+b5X9DP54raqVGVYITbLZOcpCqPPdLZ/657/6oQhB26CS8R3sYBj8+pIDoHGD1twP/0jtMfwHRe9DSYgg4XoNBJfZhXz19AJI6zS9x6v1k2YXC57go9/F9hy2bfGEpKBNTX/LYMAqm/4cyX116XGxBTmUjKCLTOmo1volU4inzqqdT3N3oS5eN8FeqL3/apaw2maqRiuU6SfZZyvAEJ2mx7N+Y+sVwUO1cny8iWdHhKK8itJQUDcvnIDOBL6O+M1C1b2iwYYfpAYaU6xP2tDgCLKbk1VPFXNZVpczXEytyklYK3d5rG/ZycciwyKag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onD1XkbnSSBcTFS05h7vYltUOuFWpvQkowOPyjEQboU=;
 b=s7OjbOlP1dpC5we4ePFy0lojE2DP+Avi4W7WleoMN2wxPjR8rnoopZ07m/Dqqv3Bh87twj3rnF5jny88pbP46LkaqrnnHzlfBNZtwmlYEAmhmb8vfGRgTfmb129WqxNrhXvEpGWGBqlNs4+58gyrwBT+M+xy6CkSanTA3O7mo4eoGFrWSvKFGRj//31qlfQQOnWgLZQ7anE0SW+dmI8DaPgqHErif1SEE3BtBn+lwOXhYtpPXxaU8SkvbRPnge8WBwiZkbfQqiwl9vmfAkIf2S129kXFQivl6AK0HxB2IaOzguTjLM+Vpuok6TAZ1eAiF14wiipBNjo+CZFKqWCIjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onD1XkbnSSBcTFS05h7vYltUOuFWpvQkowOPyjEQboU=;
 b=ZidGc50qKoEEKc+TvLggfIrESimmUfGRmKVXrCH1AfxWpPuxDLnf+iW5+jDpVAAUSc9pR/0OgF11q7WG76Dzkg/45BS70x8SW90k/Z8SECn5ZAxx40OjxqYwwEtr4Z+XSS/3AJpEahBM/hwcxZdJp7LSqyJVi2UlxsnsGG30DoDwoKDwg93T/Tt1k5thPBAPu1dkZ+go/4cxnx3XVu3DcLdqc9yV5xailUaCVPohI9E/eFoU/PEGFPzQQnbKrPUBPITJR59pzVbHYOHaS7928zzc8lDeRT/+lTZcJF8eAvF+LzkkzTjmLvHbaJ8Ukp+Gzg4zXOlTF+yKi1NKpFmHlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM8PR04MB7746.eurprd04.prod.outlook.com (2603:10a6:20b:235::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 09:00:13 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 09:00:13 +0000
Date: Mon, 20 Jan 2025 16:57:09 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: heikki.krogerus@linux.intel.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: chipidea: udc: initialize bounced_size to avoid
 coverity warning
Message-ID: <20250120085709.t2r2ufa5u5wzlt3w@hippo>
References: <20250114102815.2311956-1-xu.yang_2@nxp.com>
 <2025011707-sample-unifier-9204@gregkh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025011707-sample-unifier-9204@gregkh>
X-ClientProxiedBy: SG2PR06CA0181.apcprd06.prod.outlook.com (2603:1096:4:1::13)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM8PR04MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: 5faf6c5f-5023-421c-70ea-08dd3930d9a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RLYAmLCVOvnRN8wb+jhcTq1i9JLay6TSUv5mWUeSzxo8BqzoJUHosKrXxLgX?=
 =?us-ascii?Q?cZmN0mKnGtEexKH63Hl2axee3Lc94KXdjaoKSbeuh/LuBFrr2gThYWvwajxl?=
 =?us-ascii?Q?AQvhwmfYOcVnHYqNTNZgYEho6TRp3mFB/i21c512avkwU6VrV9Cl/mQMwLbZ?=
 =?us-ascii?Q?C5qSpJMdg1rpS7zcZMhMEQLkqBHMpRUSjfKfU2GU+VAzbMcuvRXrY9FLh5nl?=
 =?us-ascii?Q?1VVXaSO49wdGGOAP/6qn3d3dk+lqeMwZ/f0srIREV7UtG/BHg7hd2sSfHGaO?=
 =?us-ascii?Q?t/2XIh17tyMBqmAqiRiKzfSeBEGRDkd0Zokv+Uefy6tuAtdM+/ZrfK3cdV3h?=
 =?us-ascii?Q?+A5fMuHZLNBvZamqpPeQfACBgqX6z9EhGEEhL070C9mPo0kGSJcqQOC4Upb0?=
 =?us-ascii?Q?6ifxetEgfnh2jYWXApS5scUALsz0htZbXa1F6FgOKMNYOu3tuaaTA0FnB5sl?=
 =?us-ascii?Q?Vs0AYFTn/3ZyuJlkYErgeGUrIS/vcWeUM3iOb9Co3EKk/FoCYJxvhxRNAMUx?=
 =?us-ascii?Q?wpylknDl5dDNJaLnn1asakUUjOXmo6TLR3Ewuk8wbPJgdU199TK9pZ1geeWh?=
 =?us-ascii?Q?Epm/DeLSeJ8Tg79EFQMsVKfbVBPZ5M2t2nn782KMh8GftEE2SWgiyTuKTfgG?=
 =?us-ascii?Q?M5pJnpJt2DAjw2Ntdo+UZg9ahGMRK8tLuzr/0i2Clj0zyorNuVZWSvbKuuIv?=
 =?us-ascii?Q?dNSH130nvHo6m7Rjqfnph5afMGJ3/bOUCecHXAe3cj0xMDIgnNsFKB13N4Xb?=
 =?us-ascii?Q?I7usen8OVlG20PJevDunijyueb8WYY/m6WL7fV5KIUy8nV75sQFQSkc8v8E7?=
 =?us-ascii?Q?oSynkTnEK69EC82lKzYTJ6XfMqtt3oMX6ibIKkOQGc93DIxX2iuQSQpXSAa+?=
 =?us-ascii?Q?VKQQZzZdUp32U8zWL9bC0AmTEUX2mXvETlt0Y7BapzUWd4pBuY9Fk44efC3C?=
 =?us-ascii?Q?KOg/2GbtA88iw3ANPpUKJv/0Ez4G36z5ypYUtG8PDBAk0eDIYVTYOGG+c2cZ?=
 =?us-ascii?Q?JGdg9ca8EFnqO4HMWPbu9ZT5HpTfzm11hLC4qJFe+B8RkkXbZ6q0564OqEQF?=
 =?us-ascii?Q?aiyhmZStUKn6UkFQ418DoTAhemK7DSPnuOZXj4QgFTl8vy3aR9sMInqWnDa2?=
 =?us-ascii?Q?ska2PrIcuqVHWgJ+R0MyXoWqEizUZDxTRKGD8vekwfNIOwbaVm8lznMx+yAz?=
 =?us-ascii?Q?vzSL+EYnFnVvtNwACgbtPYfKhoIGus5Na5rsmGHlHffbkWvj6ZBCMuN/SWeG?=
 =?us-ascii?Q?o7b3bfreUxAQGsD0nYVGDSGQZxGZzXv1WHex4g6bESGkp/eNAoEdfKFoKLfB?=
 =?us-ascii?Q?8l/1yecvKD6KQa31+upaALuCR4FRnnGH19EiUymDPIssbLbzlxBTg3RDRtPm?=
 =?us-ascii?Q?/D4nsY6oRziv6mcNLiu9bZYdXt9IA3FW9TJYRYYeREo2lm2F77YA10Xa2IMP?=
 =?us-ascii?Q?zyxBCxVhAMjMqxtH2/0ZUMmwPV7l6QeA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hiG7Qe3eaolAsfX7Uq/xJ2IsZb6/S+4nsm2LlfjIxfZn6Bcslr6Eb/Q3K0O4?=
 =?us-ascii?Q?VrjrM4hBEdzjgP2AxOnIUyj3EHahI15fbEdg4++zFRbq3FHmW6uOM7S0zv5b?=
 =?us-ascii?Q?zm6YSPxgTr++u4Ngs8wElb3Hmm67DS15UrtrvTHbwiyHxurPV1fjzquw2mD0?=
 =?us-ascii?Q?yediLUJRU5EJ0/AE7Y5dyzPQ28hgcsOo2ffuTNvksEeFYQa/KNPF2QxHqrJ6?=
 =?us-ascii?Q?YH+9Ljm4TyBJqcTORIqldwXBNwfsWVS9g/6gDcjYHpjeKSUiI2fWRfD89Lnq?=
 =?us-ascii?Q?xJV8LvMzMjMkwJ9rqo5L/tIaLl/tDSv/3B0rn27GUfGTABdwufP0gmcmedsO?=
 =?us-ascii?Q?5tyr2Kyt6Y5t5BrxoecuL41eW19UZ8XCE/PcBlcXtt5p8jBGEcSJIW3lXVR/?=
 =?us-ascii?Q?mmFMxhqjJSinAllGlGIphvTBX9MLDQuFoJGrU6AnZGpo+mupnpJxArXxcDrQ?=
 =?us-ascii?Q?p70LWaAKwefchXikqXZ7WQmgg5NGtubZmbHnqHDGkJyVdSlYJ6R0FEC2Yfes?=
 =?us-ascii?Q?7f/AUP45uFavgp5A1y/TdiE3JvWOj0kpJTC1tGYWTLwB29+XD6zHXnK7It6a?=
 =?us-ascii?Q?9CIyvyZdfEv8hmc2MnGjQtVah+fz4i5QVG3oN0u9hX7vAuVDcnexKqrBYwwA?=
 =?us-ascii?Q?2D/RyDasQYknder0RAKyWqk9kljK9spH38Tul8TpSkVcf7x3yViB+VYvG/EA?=
 =?us-ascii?Q?0YKZx1/A3pLlYA9JxfX42c3gFgVHNyH8TUjPDq0VgRpwavLDgFhI2DW0DHH5?=
 =?us-ascii?Q?P0nC2kuNLsB8DUDVi474LKdnaInH32q8PeKfACyHVguP85AKQew4s/4jpbZ4?=
 =?us-ascii?Q?Nbk/L6emDULmjaeWGc8qDpirRsMtS79JmxwoAmrdsJ/bvCUTzwxak/zLc7yI?=
 =?us-ascii?Q?/x5AyVzRIIjWhblChR0/I56IjTOP8usB7SyzNtfS5WI44XrC2TUrEZBP3Ei9?=
 =?us-ascii?Q?lhnodNG4KZ02p7QAzDK//QGcNReQcfT7SNuwD8pWMzfY8Hz+Cq9JHzQAwhPu?=
 =?us-ascii?Q?CwvEAdUde+0yC980ndo/AEbv6ujrpMJVb7OqrIPMfT34tOUgHlmTvGCllwU7?=
 =?us-ascii?Q?fI6aKvKXP4zaUSJD9lD4sCYaN0dvEd4Hx8uY+iOJZIhhpppwKr4Qo7xJg7ug?=
 =?us-ascii?Q?+BQRBb0EThQWP+ujOfrozjAE0aEefMwzpurVyXir0nhfBxsH0GJEIj3+28Cq?=
 =?us-ascii?Q?KROlGwtrcqb68BtOcwG0HEcUh8aIVrP9xY1qLaocpLdKDGD/5LxhangoFV3o?=
 =?us-ascii?Q?KeEvDTv7pEP1e9BTdPh7lletB3dBjUrkuQVZgCG73WtlIQn3roH0SVTMJs7p?=
 =?us-ascii?Q?iB8P4KSsXy4sB3351AaThEsDFKuQxyX6C1IIezx9FQmZHA5ppI1q/GZBvE0o?=
 =?us-ascii?Q?ZJkyuGsTXrDgU0pYqhJXP2ePcmjDRV31uhntzGzfW+xVXfHj1vuYGgUYMOfO?=
 =?us-ascii?Q?dp4wrfpvdSecaSjuer1Ffixb9w1QC5YZIW3UcPXf+3J7XZ7W+VOVwYUdQZrp?=
 =?us-ascii?Q?vdBzEMv3yMLRANqWNdGaw+lrj6cfB/PFaBxFAWVBtFVUJNFQ4zM6PyxekNO5?=
 =?us-ascii?Q?7kMxBnViiHKcpduDINq9fj3dmKdKey0ad6db9w3f?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5faf6c5f-5023-421c-70ea-08dd3930d9a6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 09:00:13.1398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YjQttUYAb6dMnaau9jDh7mswSWYn1hiW0Cu3OsWvnp9kwk9bYsZlM5uI1fpC4TiQYLsG8SJrUDi9wM23e90GKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7746

On Fri, Jan 17, 2025 at 12:09:29PM +0100, Greg KH wrote:
> On Tue, Jan 14, 2025 at 06:28:15PM +0800, Xu Yang wrote:
> > The synopsys covertiy tool complains "Using uninitialized value
> > bounced_size." at some condition.
> > 
> >     sg_dma_len(sg) = min(sg_dma_len(sg), bounced_size);
> >                                          ^~~~~~~~~~~~
> > Although it can't happen, try remove the warning by initializing it.
> 
> No, we don't work around broken tools, fix the tool, don't abuse our
> code for that, sorry.

Okay. I see.

Thanks,
Xu Yang

