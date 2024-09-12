Return-Path: <linux-usb+bounces-14968-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 122D7975FC7
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 05:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C94672867A9
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 03:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FDC11684A5;
	Thu, 12 Sep 2024 03:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jluQUyKL"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2045.outbound.protection.outlook.com [40.107.20.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F9A155A2F
	for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 03:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726112104; cv=fail; b=VjY/MC16YP0tnMTJEpkMQREugtTsB6qQ04hzaw5PTofUnqiHx3+c6dtpG6HddgiEmZ4zPNog/p5khEe3cOSmBR+knWjXL1Bb8J5bOD3/pUOtC0HoftRztULXz687zRoUhI9rHzG9CLxdqfKiE1Do6QsOy6D9rBch8x9yG1aTTuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726112104; c=relaxed/simple;
	bh=t9AInFr91FjWEB8V754C8w5Tg/5D5f9TBxLi/syHsbQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Mvpe9WD09EmLSU+Or86f09KnNt6izIxGRBjxZLLd3HaPZZUhLERTVT5NNVVe2Snm2am5mwOCdl4+EK2Y9uhw5y98irH3YqHY7OoMmc4OGJQcBOfWusQ9Hw275croMoDQZzpkdoGV8zUluZEdGntG1SJlHb2ExWxABwd9W6oFrqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jluQUyKL; arc=fail smtp.client-ip=40.107.20.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BHR1OVdFWIP/CsOzdfixWZiOXHKY+teO6rncGFAXyeLG23hE3VbEVK6UhVr15HFWV8q+o+HUzwTgSUW4JBQgW2VujdlLXB2GSAWJ10O19bPtMZk+sz5t77poUQdLhFR78zzdwFM/AKrcVr8y5Xy7yhtUUVLny+4AHLPJisH2bFZRMrgRik2ZVTuWO5MAyeHh2UXGfVKWkxPN6rb2fML+WFBYo1O4mMtvZ9VdJtF0lonPxv00MUUp6mN45Op4yFfHkl5pHgx+901qfm5NyDyMe56/dBzAImU8fF3DpVUkMIXi1Cawdt8b87aMgY9ubSpuCjD8zNnKL75Dt9GGWmlTuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kiGVfhcHylTJHVkfsZhZdatHpJw/Zk8U7gSVAgBCHLE=;
 b=uALd7y9bXZc8fKtAWjzArAUGfn5u6GWUfK1oAxaA+k4zS+IOBDuBgk3LfVLGBFubwNMwY3WWnI92f5ebmrMBqGnZiOCPw8JG9zBqRtvbv4jbcLHd+3wWUEWwx8RAa9PW7L/7inmxM5TLS4Wxch/CSkclYFyG2EiLax38DlQXJ0qgd08d+C0ajOqJP2t7HLXBna6dUiWz3jCHOXs4MGl3TUFEYo+RVoQUKx7UVEfYcO85HE8AVpj3kqWZUz6+6IXHnifDG/AZuAgyh4n3S3L++4XaQx1qPqy1KdyqungqqYbYKZaq7VkuxDVUroVa7h/iec+3wzwVyze6tSDRpW4t2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kiGVfhcHylTJHVkfsZhZdatHpJw/Zk8U7gSVAgBCHLE=;
 b=jluQUyKLVzBrX2n93bkymY3GzPIzV9/EeHgcZyZLg0Lx2Yubdb1F3w0pWZ9TP/8J6auT0Y1fjczdU5Nz5oRjmgWcsCJfweU2sQh47IE3QatQ0dcFbXJhUy+uYihMDSbwyJPOl1z4hAzzZbWrPIWXpKVw4os5YduyVrVeNo2Une62jrNJeS/YCsGpigsS8rBI50Z4gp6NQwvG/NuUKEyrJ6Iv9K6PKBKhQrPA8gzLHEsD6+OhgqCs7Cvg7h4lsrQpH422EEaIGMeHDheIbRA3yn7OJtONRLhJZD6BKn74dTpOWE09bB+XY+t45V2Xw2HpzlNyf8+PuO7l135RVk7XXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI2PR04MB10953.eurprd04.prod.outlook.com (2603:10a6:800:271::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Thu, 12 Sep
 2024 03:34:58 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Thu, 12 Sep 2024
 03:34:57 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH 1/3] usb: chipidea: udc: handle USB Error Interrupt if IOC not set
Date: Thu, 12 Sep 2024 11:35:49 +0800
Message-Id: <20240912033551.910337-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-Office365-Filtering-Correlation-Id: 4285f1dc-cb8d-409b-c94a-08dcd2dbdfc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AeFckC9C6EHQTVvCpFJmn7BPKnqAjt91/578gjAkbKDlDyQdmFuebnRPjNWU?=
 =?us-ascii?Q?sLFjqx+hfs0/+j7yA7dR7tXz7CwDOyymncl3BN9PF6JG0Ko5i3rL1vrg0SJD?=
 =?us-ascii?Q?FR5ZCQMSCBsSVhe7SUQuGTSFS/n2/jNB3KXapBPEyfBQC8bROOFWRyrz7ZoI?=
 =?us-ascii?Q?/xgc+bewms3xHkYMl2SbGoda+MYbi6RvpHD4X4+/EVlJLV+QtUunCFW6j6n/?=
 =?us-ascii?Q?SsSPxZMtu731s0I8KeawqQII1l3tU47MkJbTNGWx+vqCo1yEJiS1fUaMxXy/?=
 =?us-ascii?Q?3kQ9Frqtz4s2poAsktuFAnKUNqH2zoXK3VvXKTTlmfQAgK8cRzoLzCexVFkE?=
 =?us-ascii?Q?xJ397FvrOipSDFWk4J3h+0DTQgY2DD/NEPiGypjxGQ3+I58X+VQoZsa3bYxv?=
 =?us-ascii?Q?6/QPUNjBTmwAt5KCkT4O12NeSXcNIYxLdWxFD1ElSiQgWUO364QD1PJHV68Z?=
 =?us-ascii?Q?i68mI4qp780s/RJt2YoxLMpJQmyYzKB9UAhF63uniB/yy1rvpaYG+NByGDzB?=
 =?us-ascii?Q?YXsZdYsjp85rYd7kdxQz4iDaJwdoebxsw/yNFt15Zx3pmbvFrjoVxKhIFjlh?=
 =?us-ascii?Q?eH6j82nuX+8JN2UabOhFJxNfLY1h25EXqChHkX4Exge+nuVoZce8ME0K9EZG?=
 =?us-ascii?Q?UWJaoP33wOpAtRsoSrfwz821mxA5iXOr0QysaiNlnrjxnJX7XFjzqYZVN1CR?=
 =?us-ascii?Q?6XmfW8RWUZ8sJRUQrREW5poQtyjqiiyO+yXUitdJrcWFsbmulsqm7CtO3eNU?=
 =?us-ascii?Q?Z+xEMHABDzgonjUb2ZOIJiLxozaP2Wtt4Nojc4fuxA7lotoLN/NTP645z602?=
 =?us-ascii?Q?j0B22NLv4VLLjr7jRfAsxzwWPcygSGRW/6XZn3OSdeI/32LnF5tEbXGsMyf6?=
 =?us-ascii?Q?KafpIxxFLPeHLTsbgpqXDmnr6fplTdrt0izuF11SVU5CRNs7dT1YHekp877c?=
 =?us-ascii?Q?VCbvJfvi2q5tqMlUQzgszXSqnZGX27qkhHZYqjEKr/Pw168BYKPvk2/sNBbx?=
 =?us-ascii?Q?Y7dX5g/Qr0P0LArSKSZ0jVczqKEs/39tWo2QFBoz4PrPOUlJsOxhH0Fwd+Dz?=
 =?us-ascii?Q?PPBO809nRTX33PEzZcUDExN1k//ynmyOWf4uvSPi8ha0QJHtW4SzcmxDZbzZ?=
 =?us-ascii?Q?ZzpJkGLY8mX/F22kxiPg9AvYYfOWAzcrf92gaUAoVp5p2XMjL79xd7ZqxLtQ?=
 =?us-ascii?Q?B07lPy0c6AoAH4ljnbeASlBbj33ewNAySnzaccJFsW3ZkaJEnBzt12QPorAv?=
 =?us-ascii?Q?QEAZM+WtLldeUNf1MefC79vqu5Uh1ScBM3E98/yYzKRG3OVyIH+Axht0ww0W?=
 =?us-ascii?Q?wUrDe6tOzuxCUsjRDHJiS46MYQPWuh6NCuFszPGURNkxjEorG1LQDEnoYTY3?=
 =?us-ascii?Q?ZpMNoT3vvJn+TNS8Pxy0wOywS0BFS1YnhDGQHRLK1YUk87YKag=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?21SgIwvnLk1qC0xk+JSqQWYHPRNxp25BXf23kTpUTxNOFvTJzwPXPQ9f+2em?=
 =?us-ascii?Q?XqvPIxDckMQYAAcZeb56BxUDqmg9OYB45Vh1DayFgBNktjv+/82v9FdCNeLC?=
 =?us-ascii?Q?2aeHQzvz99YQg30OSRY56oP0leYDBunDcOTb2LfNSR5NUsVjXERROKHJql9l?=
 =?us-ascii?Q?sE6cUiE52WQReEJoT5anpy8OkauSUoiE+1Vm+2+CqNA8eO44DxhPS+tZ1ti+?=
 =?us-ascii?Q?SiPBXEbHSnq6/jX4uHCHuL5LebalYXinlSvidzswzeahNg+bGNtfRtU+/W/t?=
 =?us-ascii?Q?xwD46Kof+3MHU/ISMSzd2iVUaYxAe3nRtVfr7AnNON6tBGz0J4Plg5TyGWNQ?=
 =?us-ascii?Q?J5zvhwlpKJVsf8CCracB/zR2ih+wCD/Qt9DEkUkv5RbdOKYpnrbppi67wBNb?=
 =?us-ascii?Q?CPL+EZMwscTrR5U1s8uoS3yaIP+sWYrJ3CK+XTmSlqFcVYApJ0gDEsIb7aj9?=
 =?us-ascii?Q?9/sfCG6hAAF9Ogr+SJLUGNlBOCQxHzVl0GOPGBnwbKB3LJHu5jTafxJ4SpBq?=
 =?us-ascii?Q?nCpQ3+Yk8hbVJ1kaRCSO0YtY8feQ6MGzCS9P929Ywg+zVaW0JIKYtUEO7nR+?=
 =?us-ascii?Q?xMAGC/aoKBe0w1cDxGX4wi0NHE3+cDI3b38MVGTvK/3+SkrWQYfcdXHVEJLS?=
 =?us-ascii?Q?3GJRvsaNliusmscDLTY1U1Y4SxC8ivSSCpfdwCGI4Fk6U1GeFpkk5xeCxj6C?=
 =?us-ascii?Q?Rrmv+5Bz437WNYyxN2MCq6IY9/aeNzHkHcNW0CEb2pB/7N0EvE4gQy+SAHrQ?=
 =?us-ascii?Q?iQVAfV3NAZAPutqmJahODjEdzEh8D+uj7PDUIOLVpAV2UpqJX0uZ1PGcZaWu?=
 =?us-ascii?Q?582VlZCJV+KGXPYqAUjp3MBZCu0xvRR5PpXCTqNAbayHS+smRbdNoz1++TwK?=
 =?us-ascii?Q?2QaBae+WNHPimC923YFFigrsi7VjMQ3Q11wTBo1RU7so+zB1SbEdMwo5dfqR?=
 =?us-ascii?Q?TERuTBvIRE+g5PC8oqXzguhVtnOb6reuvK4bRmK/bcxwRLeWxIzyQVNlzRvM?=
 =?us-ascii?Q?iHssquDy8bBfmTsQaCwCAWyLe60h+RjpPHTiHLPPnwdTzOiD5W4aqYHYNlJ/?=
 =?us-ascii?Q?3Cnz0EYuh+fLHPj93SFP2Cn2xVEPPY1kPBCvahP/QAZ7wcGWZ6grrkW1k9v1?=
 =?us-ascii?Q?uzK3Dwb13KADMWjyTpQLxToFa2tqAqYE+HoiwI38gPP1BrR/69RRczRz6MxO?=
 =?us-ascii?Q?FOtOXAHDQ0ax0DB/fJ1aR9hLbnUhV3oI75/meJU7b3FPQyobuCSwighqDnoH?=
 =?us-ascii?Q?Hwp9j+WLwjS2IjC7RhNKFW6PgzgyaNcYCUE/lPf+jX0tpNyaPj36qFN1JMVj?=
 =?us-ascii?Q?nUEoKdLG4pZVbkWaRXSKSvIhwUcFHKEszTD0HyTTXjF9iFPtZHsf/DVraA0u?=
 =?us-ascii?Q?G5GBlIh5OzDGAEZnzkwZ09YXkuOoc4bxZWNPXUR9FUVuFxgMI2oPrLJ9tmtS?=
 =?us-ascii?Q?iSja8/trGKO8LOsxaK4LEe9m7dz8fvCXduiBcu5gIsWSMtHVENFD6jQiWkkl?=
 =?us-ascii?Q?t2amkL8B4QSwpjlUeyZxdmQ0SUB7ApAL4FUxbxLRDmdf+c11hoGgX+c/Hs23?=
 =?us-ascii?Q?/66kITNpdBSxfsJAxQcbDtMK0oup3fjNA7NmDT4B?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4285f1dc-cb8d-409b-c94a-08dcd2dbdfc9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 03:34:57.6933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TT/caJzMWbklDaS+XZyXnxnmqJyYDBv8xWy+bmfzPZ5aVjWYCORbMv5YJVzsmFKvXo8cH2J63qkVAUBUh7nN5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10953

As per USBSTS register description about UEI:

  When completion of a USB transaction results in an error condition, this
  bit is set by the Host/Device Controller. This bit is set along with the
  USBINT bit, if the TD on which the error interrupt occurred also had its
  interrupt on complete (IOC) bit set.

Currently, device controller will do nothing when endpoints met transfer
error if IOC didn't set on that error dTD since UI didn't assert too. This
will also handle UEI event as same as USBSTS.UI for such cases.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 69ef3cd8d4f8..b9ccf62e0a50 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -2063,7 +2063,7 @@ static irqreturn_t udc_irq(struct ci_hdrc *ci)
 			}
 		}
 
-		if (USBi_UI  & intr)
+		if ((USBi_UI | USBi_UEI) & intr)
 			isr_tr_complete_handler(ci);
 
 		if ((USBi_SLI & intr) && !(ci->suspended)) {
-- 
2.34.1


