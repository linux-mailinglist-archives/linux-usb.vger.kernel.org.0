Return-Path: <linux-usb+bounces-32236-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D157ED17CA4
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 10:54:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4900B3029C2C
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 09:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7E838A72B;
	Tue, 13 Jan 2026 09:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="n6fz4Jke"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013029.outbound.protection.outlook.com [52.101.72.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6637389E0B;
	Tue, 13 Jan 2026 09:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768298034; cv=fail; b=X26J9bTEqIrXc21nIOsIfuUqB8YC+et7wsy5B9bJLxATDdn6JgVAXepvjJRRrKSZWhWTavLL/0xfYgxyJwWeSs/nUwSpsCA16Dwr6o0nH12c5siWSHntRw1xsMfg37PiMTMzqDJ21MAznrwrrPJJ1gJgwYdsJpXUR9BDt3GX9pQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768298034; c=relaxed/simple;
	bh=/xppMTszu8W+sHVD7VIxWFvFV3SeoGZ+c8GH6wJbO6Q=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Llf5Xujvb0+NUjDHZ3nW8+j7Pgt0kyfOpOx0KZsGiRhosWTRovCF9Rxnzg/o+RCyThWLBbusnQZNija4eiM5xkTznlMQh8BHajOfoLFlBE6kfSe5DeuphufHGU7q1Kpegc/XvgCol9iXBQ69dss+ieUINEx7a/tGFSmK5/wq2Fk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=n6fz4Jke; arc=fail smtp.client-ip=52.101.72.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ECnLz9zBD9+sEvHDTzyyEAVbvtKwuOWHtdhVbUGqtYKALQVgp1Mn4Cv+W+azPCUdSn/LpAPhggzfoGkvvhCMYDDT0KnIgI+9zxMTsR8m5ac6lPDa8n6oAWzWa83a7wERkvSo2LxaCK2oduRhhRLrLQSWnA3w6aOw9rtccX+eM3Y40+aUbyfCzRpdsbRrP5KhfWHmBjF3qpra4WLswy661d4eNwaA1k/pyUbx4fK9+8/lxO2PgsNe7tx0zrW0rsaNVsccleTbq0+ya/INMPv9F9Jeu5dfnJPBMfBxXgFzFqdVxQRtKWwrEWC9RoX8+jEXvn20Qfwg7Lt/qGIJgE7mfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Emt5nygwpweGWVW6KrNdiFBErTqtJBaZ1EjYO7zts7k=;
 b=eJTWt+4ktQJlWCsT32Of7ECG1G3g+NAGPNYHnvyytfexvZnqhKzgu8lVdtYuXsh5Gv2UzcWd0Zc98ohpoO30V1fChUBbm7JSUCDJO15ygFlGrgD3T59qrEtihdHAI/nkKP+4hi5nCiFkboBUU3MsGrny0TaXZT5dfdEYsjoQzjISd3RFRCEt93Y/lDa5+Prx54qTKqHSOMw46HCQ7Afbxy88XP+e14WOVEIt/AFvSUhbkcdzZ31EupBP89el4C1OH+MrSvZw/rd1ULSZTRDO+ky+nAboG/InxLOElr1Rn2TUnXwDjnOPhna0Q3JroxoP4FqmLd32i5nRmqpBpSIuBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Emt5nygwpweGWVW6KrNdiFBErTqtJBaZ1EjYO7zts7k=;
 b=n6fz4JkeDEjmyR9zKk3kv5PIa9P476HMkRVzJbHxrj6JJZ9TdlCtQsKU65JOM6yQ5+QzCTc23IRwhA1q2C9sJMqRUTPe+/9IaXbEgj2svUavXAEqZW9J+aTV50zFu4MkVqxz+Znm1MVQhu/JM8seeQ3B+PBBp6CfmOFZAmShWhekasFdzXIJLiaJFEAw4zHvDDrSGQxJqPUGhIkASXHdI7K9iXLSIiVMcmggfT4AOA7nIYIQU+uYB/xqUYghMqb/mgJe3T11SBTXYeNQLA6Bl+yDwW/BkMWMpRPAM42UIk9CTcg/x528+MVFiWBN3bmblv3gw1WMvnxLv7PB65csLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB7798.eurprd04.prod.outlook.com (2603:10a6:20b:2a3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 09:53:49 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Tue, 13 Jan 2026
 09:53:49 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Date: Tue, 13 Jan 2026 17:53:10 +0800
Subject: [PATCH v2 4/4] usb: gadget: uvc: retry vb2_reqbufs() with
 vb_vmalloc_memops if use_sg fail
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-uvc-gadget-fix-patch-v2-4-62950ef5bcb5@nxp.com>
References: <20260113-uvc-gadget-fix-patch-v2-0-62950ef5bcb5@nxp.com>
In-Reply-To: <20260113-uvc-gadget-fix-patch-v2-0-62950ef5bcb5@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: jun.li@nxp.com, imx@lists.linux.dev, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768298011; l=1989;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=/xppMTszu8W+sHVD7VIxWFvFV3SeoGZ+c8GH6wJbO6Q=;
 b=FbNhxDo4HFBlZ4AKTCOGeoMBzCrjDSy3x74+WHGyz9tfbjfhdMlTFi9Wl9R0N6ao4SypTFrB8
 Wc/LaxS+xWuDwg9WgtUJJTKXDNpFNpJuRR9dD9OUvlLFX7W8hYHR7+a
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SG3P274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::21)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: 758977ea-d520-4b4f-a5b3-08de5289a6b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rk0yandNRHZRVDhwbk9Tbi95d3RDZ2hnQ0VnRVl0VUIvazVNTzFOOWZpR3hF?=
 =?utf-8?B?N210Vm9LdHlrbjFKL08yN1NXbWRkRVMzbDVnbTBOc1U5NmY2Q0tpN0RxQVdp?=
 =?utf-8?B?R2NGM245YnJzbSt4MXdtZWJUaGhmL040QWEvUmRxOEJDcW9ySU1MeUZxcy9Y?=
 =?utf-8?B?TUs2Y2RlVE9xQjdsV09tZUdsbUZSUHh2bEJNM3R2ZjNwQVVlMFpNN2ZWTmdX?=
 =?utf-8?B?bmRRUkRCNmcxVTNHajlLVW45SUVjc1RKM0I1L003OGxoeUMwY01ybUNFSFh5?=
 =?utf-8?B?UFRDVDhSNm5CUkcrNFdHOVV5NnJnSFRlTzV2c1d1ZlIvNEtMUkRQSC95NVhk?=
 =?utf-8?B?bHoxdzFCN3pJcmx5c3dqTlJLaW1WNENGMlFGM2hzeExaWDBMODUxb2JrTEJi?=
 =?utf-8?B?QXNHU2E3c3hDeFduUUxBU2RicnFLVUlqK0ozZDFZZzN2SkxFeEFuZ0h5SEEy?=
 =?utf-8?B?dDdUaVlrNlMxVUxlSjJNWlJPMkFtNGZOSUNOcE95OUx5RjR1NSsvcXM3bzZ5?=
 =?utf-8?B?Q0F0T1NMeFlIMzVtaitzRTVBNyt6RkM2Tm5Wd1U4VVZHZ3J6bU1PRDQ5SWRV?=
 =?utf-8?B?WVF1WXg4UExKcVV4cko3ZXc1dHhLU1JSOVBRMENPWk5GVkJpSnBYd29FRFFs?=
 =?utf-8?B?VXp0cHpOSWZENDBzR0tXUmxjU2tLWEtpNE9FZVk5UjJIeE96MkJ2cG5yUFZm?=
 =?utf-8?B?ZFJOTzZpU0xqY2NDZ2tYaTJpcDRvYi9oeGZIRHNzZUtERU1ZQVorQjNxNW5y?=
 =?utf-8?B?RTJVTTdpbllMYk1URnN6YndOOTRBa1Q3RHNlTkd4em13T0tTYUFJbGRtVHRk?=
 =?utf-8?B?WjJDQ3FWTXFROXdOUHkzTUNLV0NENTNON210TFdTQkpIQ29UeXF0M3VXMmlU?=
 =?utf-8?B?alN1UitRQldZTUYzOUNRQkFGZkQzOGtaVGM5REpIQ2ZBUnk5NVJWamNZTjA1?=
 =?utf-8?B?dGdvVTNzUmNMYnVZcDZ4YmJEZ25ydTA5aUdiQUdUNWNIWG4vcEkzMnc2SGVI?=
 =?utf-8?B?UkxNSFNNMmgzRno3bTJLOFpHTE9sdExjQnVJTUNSRkR0bmppdGNqYVd3OVhq?=
 =?utf-8?B?Tkl3MUpQTlJmQ2doWndiQ0ZNMlQ3WjZmSzNlanE1VVcrcnc4MGRzajN4ck80?=
 =?utf-8?B?NGJpZU5BUjdxVTNIZ1pDNWhLUkFnN0cxZFJKN0VacEZ0U1dZakxGNnh5RHdR?=
 =?utf-8?B?KzVmRk16RXNPY3MycHVSNHgzRzVhaTdMRksydFZOblJUU0N2Q0FSa0ZGR3Zp?=
 =?utf-8?B?Z1RFOTdGT3lsSWczcnpGeC85Wm03SGZQckh4WCsrVWNuT3lrNFRydndZM1d6?=
 =?utf-8?B?eVE1TWhodmVtZTZEM3puUFNZdExuekVUWWxrYlhkM0JKQnpmL3hHR28zbnZH?=
 =?utf-8?B?a3VnbGFDUmV6M3J6Y3hZVjZMUDNrZE9Ua2hubG1adFVUK3ExVGJjdyt6cS9z?=
 =?utf-8?B?K21LN0xuSEdWWVNVSnZwc3ZNYkRjOFJkZW9QaDNCaXlnS1Fucks1WGcxcFRv?=
 =?utf-8?B?K0dvTURPYWsyN25CL0l6WGV6MEFBeEFIOE01N3hyMVZFZTA0MGlyYXNadHBO?=
 =?utf-8?B?bXA5anlMbGsxVFV1MlVyUVByNEtmMDhPN295aFQ3NmlERHVaMU9rWFBEYlph?=
 =?utf-8?B?ek41ZWp1bDBQWHprekNTSSsyTE82eWtISmRPZmNZUndtamNLUFJoNmthZmlW?=
 =?utf-8?B?SDR5VkMvczF0MzBLTHFQd1Fvck9jcExQNzl0YUVueWVjend1UkJuUTZTcXpW?=
 =?utf-8?B?TzdsSkJnWThvMG5VRkFiS3l5Z05oK2lCQm9wa0ZnSDRzN1BDV2xnTjlEUzlD?=
 =?utf-8?B?bjBNQk5OdGNzcFZaNmdCT1RVMnplZFJTZERnQzdRQjhBR2dXUU9SWGVxcnRV?=
 =?utf-8?B?UU53c3N5dU0yZTg2NDM5ZGNSdFZxNFBMdDVGVnJzM3IvQXlsMmkwNzk1ME5M?=
 =?utf-8?B?elF0TExGV2VVVDhpMzI4M2FXUGZnMitueG9iYTZmNDZ6ZHdUNEw3OHFVYW9z?=
 =?utf-8?B?cFJEcTgydDdHZmVkSVhpN0xpdGVKM0pGS3dVQkRoQ3hFNyszYjVDM0FydWha?=
 =?utf-8?Q?L+e3g6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emlhWFl5VU5ZYmVBK09JTEpiOFU4amlZUHEzVzFrcHhvNWpvSTVLQzMzbzZm?=
 =?utf-8?B?Q0lPTnJ3TUIydEhSSXhpbFk0Y1J1MnNjcjY0NUFUT05yaGl4SmhNOG1QSUxQ?=
 =?utf-8?B?R0NiUWdyRHp3MnpwUllBRTIzYXhmRk5aYXptSFRsdWZHOEVPdHZMajU1Y1pY?=
 =?utf-8?B?dVpScjcwSDcwK2xWWE1KWTZrK3pxUUpmUElNVlVEYVZXZXFNMWlrMXpyS1h2?=
 =?utf-8?B?RkcrY2FwVU5PNGFsOFkzeUw1MlRXT2F0bnR3b1NCSVZuQmkwYzdkNEZQdlNW?=
 =?utf-8?B?MTk2eXh5ZG1Wdy9FRDRjSVdubEpBYTQ1dkswUU5BSTBXR0I3d0tNSzgzU3ZH?=
 =?utf-8?B?aG8xb2lMWThDOVhvbHJnQjNtMmora2ZmL0MwV2lRaE9uN1FDOStFOEgvSGxO?=
 =?utf-8?B?djg3ODBRZnZFVVovU2U4Nkd1VjBZUnJUVnR6TEVOYWZzenJnSThnZ2NkUFhM?=
 =?utf-8?B?bUZqNzk0SWdvTUJac3U3RDV5OUhCSHA2SWJtZEZSeFJFL2hFdmhoUDNCbExa?=
 =?utf-8?B?SE1CanVsckVsMVREMmVWQksvWkh1bWFvVGdXTHcvaHdBN0pmU0xVcFRNYU1j?=
 =?utf-8?B?NkhKU0grejI3TmxKOE9TRkllbnNsdW5yQm9ycFBCYVhobDZTUVRzelZnUTY1?=
 =?utf-8?B?OVVkOXpvaGJJTmdVQTUyMWRyRFF6eEUxMzFsVHo1M3JlV3RiSDRteWtiTmU0?=
 =?utf-8?B?clB3bEswc3NndGF6bStrbnRwL1FWbXVoMXRncW90NHFTcVVUTEVmR0pUMVB0?=
 =?utf-8?B?ZWwwc3AwUUI0ZEtYVzFEcWI4dWxFRmpHWlk1TWZRanpuYXFPaURzZmtqRG9v?=
 =?utf-8?B?MGFxekdZRHc2enJ0UW0welFHekY5SStGQ09JQ1BRVnVPM3BnYnNJNHI2NDJV?=
 =?utf-8?B?YTNxYkltMUJqY2hKdThpUWpqdkZIU3diMDBUYVlkZzZpK3hUVDNqVXlYT0RZ?=
 =?utf-8?B?TDdjRHdVWjBTSnozTHlway9vWFdzZXdnSmozRUpzYVp5NCt6d2EvdTBwUkdS?=
 =?utf-8?B?NHhYSGxHMWhKZFRaZ0pOQjYwSGtmdUZUblRYVS9pcnRDOWNuZ05wTHJ1RWRy?=
 =?utf-8?B?NytkaTlzMXB4QmdyNngvdjJxcEk2M1ZTWGZYN3VBaUxlL3pBdTcxYjZNNzVu?=
 =?utf-8?B?bjRzUDF6K2JNSURBWUFObWxDUks4ZUd2Y0YxOVVlYWc1QTJoTldoVWhBbnlt?=
 =?utf-8?B?NmJkOGJPNE50bmYrOGhGYUt2dk94elhORWU1bWNHdXhkMWJldSt4MElWRFIw?=
 =?utf-8?B?ZkxSQ1BHMGdHbWVRQjRZUzlJK1NyYkZiMFM2SHRTWENqSXh5UVdnUHJVa2NR?=
 =?utf-8?B?WUQ3L0FCZ2F6d1VoWnIvejZydWZCdlVGQ3lBVklXc2dJSmR1WGtQeDhPUElK?=
 =?utf-8?B?eUU0dStMdVlCWklTK2t0MTJUb2N0bzhDOVdqTERHdlhRRitnV0lZaFZIUFRY?=
 =?utf-8?B?djFIM25rVGpSNUVtejJRRUhPRlFHLzZ6ZklNT2JwSk1lallEK3pUaXNtVUxO?=
 =?utf-8?B?VW1jYlRraXcrZDdtNlZ0dXRwaVlQbHpweUxoSEc1bENadEhydFovYlVqaDdk?=
 =?utf-8?B?MENyS2ZNL3dld3RRTlBRY2lCbGRtbTVZSUxsR3dzcFFXOU83QmRZQlA1eElx?=
 =?utf-8?B?cnpidUJMdXpsTXJIOGJvOFhvNDBmWldVMVljY1VPWEQ5RkZJV1h2N2hWRkN3?=
 =?utf-8?B?cHhmUXpudXNjbGFiVldtYUc3b0U2eGFSMWRMT2IzYmZwZUtkVG5KNVVJdnQr?=
 =?utf-8?B?eGd0UXpDMWdpYTBoS0trQlZ1WGhnWlVYMzNYMUVEWTFOQjBvV2kzbWFGdHNZ?=
 =?utf-8?B?aG55dk05Z0N2UzJRNHhRUzc1V29WcDdDbmE4MjgwcEJuYjlweUEwbVQ5bFJh?=
 =?utf-8?B?UUl4TExGY21pN1l2eDBKRGNkN2hiNUNOOThkKzRHbzhoUUpzaE43TVdYb3J4?=
 =?utf-8?B?VU5BdlJhNEVmeXNTYXd3a1RUdTJWY0VyMVM3bkc4SkZFWWtGclYzT2FhWkt1?=
 =?utf-8?B?ZHRDSHdiWDFmUGt0ek82L0FuSDg3L0Vvd2EvVG5uenZjVDB6MGxLdmQ2QWNz?=
 =?utf-8?B?dk1hQ3ZkeU1RRkI1dlNWdU5icE1VZ29COVhQakJvbDB3RHBIanA1NTdrSWRI?=
 =?utf-8?B?L0twaVVpZFFURDZGUTRrTlovNUUzY092T2dpS1VOVWRXeEhORUxLVnJadlpI?=
 =?utf-8?B?TlRJSS9aTHRmbEVZZEdmRmZQWHh0YXlScVJzZDNUaW5OUWxTU1BnbllHMTBu?=
 =?utf-8?B?UU5CNUcyQ2pUdkJqQjFNZEpJWm4yQ3pkWUN2aTBrUis0YmpFNTYvajkrUktE?=
 =?utf-8?B?ZStLaGU3cmJjQVhJUitVRHcrYmdSK3l3RUd4aHd2NmVsQzNDb24yUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 758977ea-d520-4b4f-a5b3-08de5289a6b5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 09:53:49.5076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9QaPNf0QObOKLhy24YU1qsRrTpnhQPBBhFma5qmvwev9LB7UOfQSZXhdV2OZwmMce5pypXaBC72YuCCoVu+H7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7798

Based on the reality[1][2] that vb2_dma_sg_alloc() can't alloc buffer with
device DMA limits, those device will always get below error: "swiotlb
buffer is full (sz: 393216 bytes), total 65536 (slots), used 2358 (slots)"
and the uvc gadget function can't work at all.

The videobuf2-dma-sg.c driver doesn't has a formal improve about this issue
till now. For UVC gadget, the videobuf2 subsystem doesn't do dma_map() on
vmalloc returned big buffer when allocate the video buffers, however, it do
it for dma_sg returned buffer. So the issue happens for vb2_dma_sg_alloc().

To workaround the issue, lets retry vb2_reqbufs() with
vb_vmalloc_memops if it fails to allocate buffer with vb2_dma_sg_memops.
If use vmalloced buffer, UVC gadget will allocate some small buffers for
each usb_request to do dma transfer, then uvc driver will memcopy data
from big buffer to small buffer.

Link[1]: https://lore.kernel.org/linux-media/20230828075420.2009568-1-anle.pan@nxp.com/
Link[2]: https://lore.kernel.org/linux-media/20230914145812.12851-1-hui.fang@nxp.com/
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - add more information in commit message
---
 drivers/usb/gadget/function/uvc_queue.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
index 21d80322cb6148ed87eb77f453a1f1644e4923ae..586e5524c171f115d98af5dda43fb800466f46d2 100644
--- a/drivers/usb/gadget/function/uvc_queue.c
+++ b/drivers/usb/gadget/function/uvc_queue.c
@@ -182,7 +182,15 @@ int uvcg_alloc_buffers(struct uvc_video_queue *queue,
 {
 	int ret;
 
+retry:
 	ret = vb2_reqbufs(&queue->queue, rb);
+	if (ret < 0 && queue->use_sg) {
+		uvc_trace(UVC_TRACE_IOCTL,
+			  "failed to alloc buffer with sg enabled, try non-sg mode\n");
+		queue->use_sg = 0;
+		queue->queue.mem_ops = &vb2_vmalloc_memops;
+		goto retry;
+	}
 
 	return ret ? ret : rb->count;
 }

-- 
2.34.1


