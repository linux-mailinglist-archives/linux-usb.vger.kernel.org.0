Return-Path: <linux-usb+bounces-14969-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD423975FC8
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 05:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D3C01F24A29
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 03:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7BC16EBE9;
	Thu, 12 Sep 2024 03:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EEG5P2VR"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2045.outbound.protection.outlook.com [40.107.20.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C1C15CD49
	for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 03:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726112106; cv=fail; b=KrO8D1+rH5Nk4JUdbDQthy81w25Jv/Aw3RtUwrOKpBc9na3rzc24iVisiXXYdwx4B6B5aJsSXycaJuWa1Gc+Cmad8Qyp7ZokGnKKw0TTdj7W5KqQ+uZPELxAnpsZHw4GO+s/zN8X7rSMB1AK2Kbe8hPwP6Z4PM5SNh4lmwMITtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726112106; c=relaxed/simple;
	bh=0p0GwEcZh7YKRYOkifejHRQ3e9UvYdXpUzBekV2hRr8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g3k7GITzISsIDOErOG5bQ65bQNfrrGNS9xps/EMRvzHUWPWZAo/ntjrLAtK1KsYMwBfW1wb8nKqHc8K6IkJ7PBragLahFa26vni6c8DA3qXVCxtqr+joyrlI42/od480NJB19oRwAJi80VLmhjB95ISaI5gvzRNesO6tGGSgQwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EEG5P2VR; arc=fail smtp.client-ip=40.107.20.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nsZZEyA+xK4UwJCbgDXnP+FoR/yncY2DfzTDUWQciT4jCvNfB3V9ZNTgk6Eium0O+YecojHpDTsIQiGZePp4bEJerL460IfkefkctVoa3SkCILup26QC0YepgAfwhpj8/VFHsC+9Web3afj/YREzUDIFJUA9x2TVjtiKli6yfz4r3eyNLZnf9HJyku3lHoRS6gXNiEzilKJWe2LIVK7XVUstQftb/8MzXCnlqluqFjwA752FOufwCVkdwI5k2xyHUZHV4DGLO+qaClO/R3EXAJUpH7LaMFDge1HOGLtMxGhX/mhtKAqZ+M52saa/P7dlxM3xU1QqBohYv987QAqJzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Yhmn4n/k7bL9VAKeERWEYA4KU+DmRo6gUIYyW29pqc=;
 b=v4JZkwqGVDbg06xuBHmZ7z9IhiyiYXgyquE2uVFfg2KYBeOSPRD6/87sDX11VaViWebwnCuOAa6+YHZlSM0wwQgQqBbB/5g378oX9xuH+ljNApKyeSP+kRudfHv3W2roLL+B61Kv3bTkIJWjqY9Dcpzz3a6Sz67U3TfvFsgN1H7FQ1J2irZxaZHel86lqfbGceHmEFGRH49tW/Mpq7SRGhpDPsSoekkPtn3V3vFjeFiqTwF+Ah6dk156ML2staXTI0xLDPEa5ubyPPS6pTFzwMaETi0GZwRhH9noraoODCGOdrbvTvgLC/M4eIrGc/nNugxgHYdbQLD9tK++0QRKxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Yhmn4n/k7bL9VAKeERWEYA4KU+DmRo6gUIYyW29pqc=;
 b=EEG5P2VRABe97rF1AvTP0DC2ErkWdStrpyKiZclo4GxxBFq3HMDdB+3i6omtEDgiEVFj+v9k5ENRzJKNGSWmspAvW5JttJy3nBXtzboN6qwuaBgUSgiQznyKxe/sBU0/vqI6O2QM9+6MZKGhbTiUqK0YwvSOQSNLquVM3ohFTNqKF8kXdcG8Kv9MocxEASCk7DJ+RhLtXeNctKTdq4JjLW3s7GdsBmZ+hHK649Ebjom+HZWy6z1p9wWNIPvocX9Z614OOTUTxBBG74YOIXbY9gxcrN7RuWZOWHRgFhueS6ZXfrE3lU/H5vMLouhO5FtqvSyD4ZCYl/KHRGa1oiB6cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI2PR04MB10953.eurprd04.prod.outlook.com (2603:10a6:800:271::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Thu, 12 Sep
 2024 03:35:00 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Thu, 12 Sep 2024
 03:34:59 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH 2/3] usb: chipidea: udc: improve dTD link logic
Date: Thu, 12 Sep 2024 11:35:50 +0800
Message-Id: <20240912033551.910337-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912033551.910337-1-xu.yang_2@nxp.com>
References: <20240912033551.910337-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI2PR04MB10953:EE_
X-MS-Office365-Filtering-Correlation-Id: 48240f61-400b-4f15-2d38-08dcd2dbe126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LoClNDMtMTYlNVahWmsc9tV+dD9FKrWyxVguskxu3vLnYElTudKUXH/cJ0jR?=
 =?us-ascii?Q?NiEqylG8vUcUvF0SrdtmQWZVW/or+io2IKoO3/mmaiQdcfoJlNDVLR1QMRn9?=
 =?us-ascii?Q?gIVOb4ubXvvpNz8kbPgZWNXFwR/d1/qvGQp96fkjUnGOt+4UyuAfCpezxKRJ?=
 =?us-ascii?Q?K4FKCJJalQVaHhPknTPh19vYEMKuLCFeIkpcH3WsJApcTFtu+WO0aLsHeJfj?=
 =?us-ascii?Q?X+uhopdIE4ENxu2BqAaLab2a3Xyzmwu94/Wy2GlFddcaebybCMeQyQKZhWef?=
 =?us-ascii?Q?HDYBwokGI9ld/UIYYKOJl+s5bVgMLeXd6UnB74vlUhniuHIhAAGJ4GhDUaeo?=
 =?us-ascii?Q?Am3Ftc2BK/rGFfe+dDenb7MPWWzQVJ0D9PxhhrNXhuHHjKLpu95ShERc7u0P?=
 =?us-ascii?Q?fFjY4LYn0jxs3MWDwaOPJUNa2bOFWzgBScKJKJ3Xc8hG73mp+UcWn3SQYR07?=
 =?us-ascii?Q?BwQLDwHQ0M8J67RYbVw4pBw2CSQX0jEfW+jNum9+nj5dI5nuTp6K/pOFmzTV?=
 =?us-ascii?Q?YB5wl7ckCSHL3XaJ3apfM6OLg6p2gqkhoHqH4A81Y1wpwAmnjwaVe1goJNW9?=
 =?us-ascii?Q?x8VEL5YDsF1N0alrXhiQEhySgeYyf3WF5XH4NBmr8zoRG+b3iYKhspoRXgWC?=
 =?us-ascii?Q?L2zJP1Ys30G40RNOVJQLEQfrrWgYDZ8/PEcU6Th5wBYqlUmv+tmMDj9/2odr?=
 =?us-ascii?Q?1E47VzoP34ub5wffTvo7SrFaQPVDcu0yfb+V3WC85hOzKhUZzf6EZUV160vM?=
 =?us-ascii?Q?kc/Q5agBl4pb3buQ/VnUoFdiAlH0mCVB2V2/b7zhPTnvjQg0/FHDAd9gwmaN?=
 =?us-ascii?Q?9mryxz0StpSCFayOj/5e6+MTt+NwrMlL7a73XvL/zXyW6j4zgo/Sz88gcKw6?=
 =?us-ascii?Q?ldTWZNYuPEp/FmxZM6nl3VkaGNFHLX1UXWRW4iqd+U9Eb4BaSa1utUt9oFrD?=
 =?us-ascii?Q?XSdI5mVRnXlba+M9FRp0zwhPMh1x/DnrQq05KdhvdeqdH3m5d/ZP5uDIm4e4?=
 =?us-ascii?Q?IWEaM1FLcHcdJeRmZV84jiEx2mV78CCG40eVnbW6rhAhM1B0NWOGN4Rz/V12?=
 =?us-ascii?Q?7vHIEyKsJd5DpH6awsGZHnKOB/hbGAtskD/1bY4/RzM8vj5+PF5d4XDm5HPw?=
 =?us-ascii?Q?yVDb4yRDBx458qBVifZe75O+COuBvsZAg4ZPyNXt91ULa/RRb+5lY6OP431T?=
 =?us-ascii?Q?SP7CEwGyxOXn007B56G6jN8RSfaYNYcC15Wt7JabXUIhc4qYKg1nhiL97m0J?=
 =?us-ascii?Q?SWLcxA+hGBrWKxeDRNx9O6mac9+AkE95sfVM8o+vuzuLxDcau+vCjgzg3GaG?=
 =?us-ascii?Q?paaAmI4S4x855e60i4OoMsiirqvagkTodVnODM0qPn+UEntIUAkVc02S+zQ5?=
 =?us-ascii?Q?wbDgeJK2MKD7v+dvLy6Szuz88hEjjl+PVaTQXYdk1PUogwHwnQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZhwQUQ6TaOfS4v3jS8FTKKmoDJF/qNi0XLpavqjtXTpIypA2FdOH7S64SLmw?=
 =?us-ascii?Q?yGPCnGm0UpkNucabij/Efez1lxr/uaYvVeCpqIy/0Xqj5aqMNaLgVHJFoyHc?=
 =?us-ascii?Q?XOiBwRbZUva3qfYW0Yu1RQ7GxVnljZxZ96M8Gl3QNJYgy5Ly4JsrlyletEkm?=
 =?us-ascii?Q?lvliXyt0WcGdCgoXWSb9mEObuC9k4tPe6IS6FI3qhRkZ/dUg53BRwqe/6jOM?=
 =?us-ascii?Q?7g3HvkTShNKwwnYJ2oeQqlSDWDJ/KRRVwRcotDX3eeAbegI3WUPzwYHk9ujW?=
 =?us-ascii?Q?UQNkwD5f/LeuT0S3N+ZCWk61yFGvZd95iTLo+qmAfdeCdxLrnzpkIYnASDYK?=
 =?us-ascii?Q?ERwi290+DP0FZXZpZcvW5S+Rb87HMK78mXccuRKLRFiN9pnAKN2JO8MYtNey?=
 =?us-ascii?Q?DFFt9nrcK17vMJnoKrFgulJXCF4UJqLCELENLbTetjmZN2HH475lYN2IXb2B?=
 =?us-ascii?Q?K8CcsdGxpV+lOuEibfRWn6PgkwMC46LeIKEimJbcQCAWmnxCRglliqbyddjL?=
 =?us-ascii?Q?iRMCyUnhKfo8ebkQItDE4227XDIkmhd7AxhdIyxPsbykY3OKkpRPc8GdsrV3?=
 =?us-ascii?Q?LRYlJSG4vWXy2dlPMysF42uEXAFofSfpRXjVk2fdpdrCgEq9ztoRoxPLpHiP?=
 =?us-ascii?Q?Uq+Z7rWdqjp6aVN7xlO0Nwz9VywdeA+tVtoFlL10xUZvxuqJBxWKuq9qXVYI?=
 =?us-ascii?Q?DYqaaETL110LA3FEjtaI7P732AFrlgvYQOH5WAT1omcF6u3l19SXWwjympvN?=
 =?us-ascii?Q?zIHkFsDrb74Ss6uCD4tR15e+g99jQ44lkPJuKgCa6wZe0xzBxHpJ7tlArIQs?=
 =?us-ascii?Q?QKHIzrgDRp9Tx9BRy8nm7jY3KECEsysgIXfUb5p1CcEegeIGcH7LpLLMCAK3?=
 =?us-ascii?Q?1tnL2rZ6CoL87u1tqrYrB6Ke+onBky4etZOA2OtgxcYjwyv3C/cpk/feoI/I?=
 =?us-ascii?Q?g8CPF1Sz6RbgXaTNVQpWQEduMwTeTevj5yQSBs6+LNPFjjjqZGVC+D14kx6E?=
 =?us-ascii?Q?URF71NWfb3QJuhyDoLrHoOagp5ZvGYJWxMrFmUFvr80z4RpOAa3jglx2P2yL?=
 =?us-ascii?Q?Qgo2HPvlAha+OJhF+cbJGSdp8xFASBjOOQ54vHHYqygAZlHVAKlbc2uyp/P1?=
 =?us-ascii?Q?8r6Vgr5FgtZzw91RHzILOmIfxf6s6R5vt9BzQh8YaBB6gap638yp5iEor7g2?=
 =?us-ascii?Q?a+UUuY7GhyFqKuJlbesuiJ/gfSZ3QXe2gOrWhxiuGmyHxtWVEPZq77mpV+QP?=
 =?us-ascii?Q?gRZ8rlt8NyDZp54m/UkYTmA35r2lcl3rFGNwyDfFw6vWhoxiIrzZc+XvCS1K?=
 =?us-ascii?Q?VKolPi9zJ0uAYAaKBbQuWkvKgO4aBUzI8nVrX8hD9AyvTIcp00i1K4QGVg54?=
 =?us-ascii?Q?sz6f6nQEswJYgQM4gGnzuL/1g14uWZLFirYik9E0jM5oxoZb0FwCFq73kCVI?=
 =?us-ascii?Q?JJY8qDky3Uo/yNzCDjP2/7GM+Wj3l98BsP5fPI/THjxkDrzpsk0V5fFWnpaI?=
 =?us-ascii?Q?KOWKReSniutxwpq6Lwc6ux1tAgMXZrs2Motssp0P8TFvQOJPgzcktfqzejfg?=
 =?us-ascii?Q?Ga6sKVPPizdbxxI/ltdPHWAWlfbwKpCEycC4O6Od?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48240f61-400b-4f15-2d38-08dcd2dbe126
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 03:34:59.8756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: orr1bkRKZRxRyVkplOmHmAsH49x2KhXFiah06/FlzaHj9ne0CGVuDnZMj6jcPOJI3BLWWDbNO5y5B0kn8He5SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10953

Currently, ATDTW semaphore is used to safety link new dTD to dQH. But this
code has a bug when the endpoint is already in error before polling ATDTW
or just met error during polling ATDTW. In that cases, ATDTW will never
turn to 1 and the cpu will busy loop there.

When the endpoint met error, ENDPTSTAT will be cleared by HW. Therefore,
ENDPTSTAT should also be considered during this process. In case of
endpoint error, the current dTD should not be pushed to the head of dQH
since some dTDs may be still not executed. Therefore, the link logic is
also improved accordingly.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/udc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index b9ccf62e0a50..0ab57b87b07b 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -612,10 +612,17 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 		do {
 			hw_write(ci, OP_USBCMD, USBCMD_ATDTW, USBCMD_ATDTW);
 			tmp_stat = hw_read(ci, OP_ENDPTSTAT, BIT(n));
-		} while (!hw_read(ci, OP_USBCMD, USBCMD_ATDTW));
+		} while (!hw_read(ci, OP_USBCMD, USBCMD_ATDTW) && tmp_stat);
 		hw_write(ci, OP_USBCMD, USBCMD_ATDTW, 0);
 		if (tmp_stat)
 			goto done;
+
+		/* In case of error, ENDPTSTAT will also turn into 0, then
+		 * don't push this dTD to dQH head if current dTD pointer
+		 * is not the last dTD in previous request.
+		 */
+		if (hwep->qh.ptr->curr != prevlastnode->dma)
+			goto done;
 	}
 
 	/*  QH configuration */
-- 
2.34.1


