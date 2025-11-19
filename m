Return-Path: <linux-usb+bounces-30734-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B88C70D34
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 20:33:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EC05B4E0261
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 19:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A0836C0C0;
	Wed, 19 Nov 2025 19:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5Kt+7rTk"
X-Original-To: linux-usb@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012068.outbound.protection.outlook.com [52.101.53.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888DE1A3166;
	Wed, 19 Nov 2025 19:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763580666; cv=fail; b=hDC3Lx4oMixKIKJPzhLDd+gagGxxv1Q3t+f8yiKp3KZJypcaB6oHcuzyjbpFiDoaXUEeXhUIrQwkrMt4Sssgwwe+x3DeH8s6mMjMi29sUULRKCDCgFzNdahlaQ6DFf4gYALoM8AejwLjR4aZKw7wPqduJW3eskMkQqNhHqDp78I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763580666; c=relaxed/simple;
	bh=QUD51/NQtlX5sxWxSvCTnsoatOgukXD14BrsjgErqVQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IYqLSneY5JzE+ZstXyKL7MNjx/l6Q8GU9KgJJpNbe52cxiLaoW7rEs3dZ24YW/vccIOvMmUX+iusdXJHoJxZvUaRQxdl1UM5nGRSnjrTL+J+HwHnZjy2SbxL3e90RN9e/QCjb7Ge02z2+Yj5NhhGIjDckRT1lmmhnRtIh2vUaUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5Kt+7rTk; arc=fail smtp.client-ip=52.101.53.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d82tN2wKjGCF6np6m0x/Et4qPyn1GxFCHDJstdA5xeJN5KcLpDqxeeJhFNM7mESmxI91kea/h8Q2qq7cE9uIUL1zRpGOxxSQiIWRMJky7f1n8Ayj0+zRsDwClOYf8cxzJTnYqqV89EvbGkgb8FMa8U98+49EZ0znRetVOOvLB7oeQzy9VGmNdFosBzsCRMr6vsWhNH36hwzKH+GGt5vl6AqvZrfmMyviaTz98HyoiI9J2CA9ILLNBDkaOBKcW55MbP0+BHU/a9o+2ricpX6n+GEhGVIjKutKhAnCZXqEFXYfdwCgX4LI8TkEoIfwrxd8Y/v0SmXLEHNLzZyjKy2L7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqfPUhBUuqScaSHMUq8QpF25Wph306SRwNzMegwm44w=;
 b=wr2baVab5UC0P1cnJunfD6Li1FkMXwUSSWqz+wsPFTgZUuJexnYMbVcfQ2vdQUAgR3nkdp2zG2bimhdr7xU3llat06v6mIN838SGR/h9oHOZWOdJZyYF9GMjMOWkhAJOCjQa1NwHEYlgqOYohNHBRurIiMJpmlbWuszVQFk5ihWKJTftrRN+x4UmTs/9cKZMgt/2VYLimoG2Hw/Zid9jU8Ykapsy7Tn7aNjgcdWh56K20yVrkOH5vB1S+e7tenp+FeroLl5Tub1IzC+Y6Id8OmDIu5N0tT5Q3QAkux6NAXk35cpM2JkGS4CajLLdWpgy0ePENDAYalwR4FQZNu/Bdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqfPUhBUuqScaSHMUq8QpF25Wph306SRwNzMegwm44w=;
 b=5Kt+7rTk7sMyUX0zDW4TtvAmpTACaZPfofijzJ2D3uo6sKuJvdFfHuaxWpuk0suTg3SA3NRSnmiW1R2MeM2ke8qHXqWjK7AR+DAvxbI120P3MVcZDErcX3ha6fIljjxLho0JpqSfDhcIVT7W1ubZxVoh36/CYbVzJTo//MdvUeQ=
Received: from SA1P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::12)
 by MW6PR12MB8735.namprd12.prod.outlook.com (2603:10b6:303:245::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 19:30:51 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:806:22c:cafe::97) by SA1P222CA0010.outlook.office365.com
 (2603:10b6:806:22c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 19:30:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 19:30:48 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 19 Nov
 2025 11:30:46 -0800
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Nov
 2025 13:30:45 -0600
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 19 Nov 2025 11:30:42 -0800
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>, <Thinh.Nguyen@synopsys.com>,
	<p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH 0/3] usb: dwc3: xilinx: Add Versal2 MMI USB 3.2 controller support
Date: Thu, 20 Nov 2025 01:00:33 +0530
Message-ID: <20251119193036.2666877-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|MW6PR12MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: 761ccdb9-4ffb-4497-62b6-08de27a2245f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SZMcJUgF3KcDVA8pKyaq8xb95/EqqV/1rx1sucdnUbTt/4iJcpcIRZI+6TqC?=
 =?us-ascii?Q?U+JDUyKTx4sW/jx4Hx70BLSUX3tyNGxOKWBXZztl0rHkVT9N2Whq0B6XiJ41?=
 =?us-ascii?Q?DjQIJjFFHCapDik6vwKOZa4rkK8MO6FQ/uW2om5mrF5HbptLbMjXXUtW0pFf?=
 =?us-ascii?Q?WHCbUzCJFXXCeCUokO4+MaJqn1hnaaBJsqppvSXCP4sK+J8bU4ijiVzJK+3R?=
 =?us-ascii?Q?6xWY4upOFIUJViUhGMH70uhE97hBBC+1xNBJFxk81P8RZ/TqFfw939Vxe+HE?=
 =?us-ascii?Q?UUs/FyAB31p8QsOaX860dFPc45I4KgYNpyQ5kp8GmGZQkRgR7kcwLUsQ4LtC?=
 =?us-ascii?Q?TiUJuO6e8SyVoCG6bUcfsTrJGToXOCylRKHYWyjDuQq7WTGA16a53WgzZW/v?=
 =?us-ascii?Q?Ac7yKuCClNkYPGPjgFVALzgbZDixu3qnaxuL/7SfYyerNoMc0vim8TnLcqui?=
 =?us-ascii?Q?8a0FItxDL0DE/B6l5umtSUPHaF25fLJ4+daqICQBNUuNXpcddFwgSQBVl8/p?=
 =?us-ascii?Q?PXrq1V0EyFBRPgwzZ3/Q+SY6vWx4s+n35hjwg87+q1WaHreleSt3CCV2pfq0?=
 =?us-ascii?Q?WPXgcy0ZtxSuSu4Hq6R+/Jmgvv0jvufcXYK4wPFDARgNfhiZCYuwBM/y2ubC?=
 =?us-ascii?Q?DVwStcVUqvJrjYbf4rrOuij8Tm0jZ/FCKaDAuzJDYLud5nv+JKSeqJSErGLn?=
 =?us-ascii?Q?CQ9U4LkfqERov9lwgg8ZMxSxJLhD3n+JZp7XK2i7LRLT2bVj2hRU6cSSH4v3?=
 =?us-ascii?Q?DZ5Yp/rt1xku7L0vTU5kVlVtvCN8MAVEypT/0FbdVjHuWnI7niHZjCAr+Aaz?=
 =?us-ascii?Q?cdYTs8Go6F489Xdz9wNGWFiFK6rQtufe27I+gkOgX0ej1EUXZ1HKTQMv4hm8?=
 =?us-ascii?Q?cgNIK3Kpyd5/IlLPsIKrXPlT6W8cOgnoEqnnVU2o9vHC8jsjIJMOBHf1ZSma?=
 =?us-ascii?Q?mwFPbf3MeDjAGS9dyMU0FOmy9D/BoFRnf6Mu8qxKxE/k1Dr20C/iegdePIYy?=
 =?us-ascii?Q?bqbDTdODijxlUoDz77ru2myB5FrSIEWJCxJRX6X1UpbU9WKicAK4kPxNdW/3?=
 =?us-ascii?Q?tRWag1ENcEBoQyU/sW3pFAi7paYINGrYRwcGtJuxqZucDUsWfhZG8u0ZZ7Kg?=
 =?us-ascii?Q?fugRPhdR07xEDHnneStHgVstibA3vDZ2U9Ul+h77zOh9rj6E7xEtfb0C2ooK?=
 =?us-ascii?Q?ntVrwJkeipJNtblATX2+K2La7V8Ac6qEUbmM2DrJz+GlaaypmKvDo289KN1V?=
 =?us-ascii?Q?HNN1nFULoesdQvA1T64I2Iwq/2UqbdV8KXYkgk2Tgx1jybtyOmtStVBDop+I?=
 =?us-ascii?Q?h0O4zoL43WlaW787ssc5ygVWplHZJ6nKxyFv5TpIxcPzti6SZTsIJRNhSuha?=
 =?us-ascii?Q?GS/rPZPy+sPVmsfzhkUqqmCMQRNm92+PxxbJXO9+GNNCqWGN1qR4ZlWaIuoF?=
 =?us-ascii?Q?iqZsE+/YpwWsZDkzBARenDle0ytaegY0u4si2Mli3y3mWQq0N1rm0TrQTO9T?=
 =?us-ascii?Q?FQAG93u5R3Cwx8ha196BhZXuxS7aB1scuu55TQZ0i2xDDCimtmjxwQPM9qqs?=
 =?us-ascii?Q?/lDY5E08+3KEIiDiIlk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 19:30:48.0952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 761ccdb9-4ffb-4497-62b6-08de27a2245f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8735

usb: dwc3: xilinx: Add Versal2 MMI USB 3.2 controller support

This series introduces support for the Multi-Media Integrated (MMI) USB
3.2 Dual-Role Device (DRD) controller on Xilinx Versal2 platforms.

The controller supports SSP(10-Gbps), SuperSpeed, high-speed, full-speed
and low-speed operation modes.

USB2 and USB3 PHY support Physical connectivity via the Type-C
connectivity. DWC3 wrapper IP IO space is in SLCR so reg is made
optional.

The driver is required for the clock, reset and platform specific
initialization (coherency/TX_DEEMPH etc).  In this initial version
typec reversibility is not implemented and it is assumed that USB3
PHY TCA mux programming is done by MMI configuration data object
(CDOs) and TI PD controller is configured using external tiva
programmer on VEK385 evaluation board.

This patch series depend upon[1]
[1]: https://lore.kernel.org/all/20251114123239.1929255-1-radhey.shyam.pandey@amd.com

Radhey Shyam Pandey (3):
  dt-bindings: usb: dwc3-xilinx: Add MMI USB support on Versal Gen2
    platform
  usb: dwc3: xilinx: Add Versal2 MMI USB 3.2 controller support
  usb: dwc3: xilinx: Add support to program MMI USB TX deemphasis

 .../devicetree/bindings/usb/dwc3-xilinx.yaml  | 19 ++++-
 drivers/usb/dwc3/core.c                       | 17 ++++
 drivers/usb/dwc3/core.h                       |  7 ++
 drivers/usb/dwc3/dwc3-xilinx.c                | 77 ++++++++++++++++---
 4 files changed, 106 insertions(+), 14 deletions(-)

-- 
2.34.1


