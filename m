Return-Path: <linux-usb+bounces-31310-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEEACAF0A0
	for <lists+linux-usb@lfdr.de>; Tue, 09 Dec 2025 07:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8546030DCF43
	for <lists+linux-usb@lfdr.de>; Tue,  9 Dec 2025 06:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8961D321428;
	Tue,  9 Dec 2025 06:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="hMiwro/G"
X-Original-To: linux-usb@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012001.outbound.protection.outlook.com [52.101.53.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737BB322A1F;
	Tue,  9 Dec 2025 06:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765261685; cv=fail; b=WXEbNJahAp5Q5E5DQi8Mg2Ka552xTfdiJ0vUwVYQ3UUluzazhN+CzT1p+1kqEZ1NQyyGc9OtFaBACxqcSOhnVogAsIp+acj8IiJ0vUvS7u+J/p4lmdFdtJprHOsTePGacGjnFkIYqeQ48DrgXCzvjVSNPvj0IBxQ8Guq87UHJ4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765261685; c=relaxed/simple;
	bh=bz7JaWVkc5ns0mspfw9KcozGUAqJSbl/giS3XwN0vP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=egtg3RS3Cq/33gdqXAyLDU5I2TI5PNmlv+e8pGiod7vBoOFUfN4qbB21onrifqLsFJdpII/p06JlrSp11ZzE3wYF0Vt9u0Evq4Zo+IIDgeT+RJPZDgStqEKhJDnvJedscsuLc8ofNaTFTHI9kXZKUqDqThmh/nlMfCEtBMEG68g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=hMiwro/G; arc=fail smtp.client-ip=52.101.53.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZACOeSk56tfw6fnY8wsuPt/M/IvqNqjWtduaGiAd8Je0xMR7gil3nZXbQp/gwrg+tf1lAa87IK2vbcz0echQeu2UrfG2KbdB7BeUfhmE/Xnyjp5FSsgFR145eyaQbnFU/1li707PaQ27kD6aOxT1o890raEw3jPaE2zG69fkPW/JoiZf2IMy6m7qBsKwLjD5mbnEI0zSO0RxuWv0msiQgSDVAFspJGP6X0x2e6EOzRBdZ/2avHOGPPFamDL7v2LUEUrIjOe8sPP6fq9iFaXHo9Q3h9EC5IBadeQBJyfJBLHE3Xf2p0lV8HoiJCbxQWYHVsNSc/bl/6xL6PnXFlfxjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwqM50wlIA06eRoTMmTbCNqXBv1QENOl7TrC157dt5U=;
 b=pwDnqgJLS3Xmi5oq80JcXaMa6/RznFRQO4sDzqGe25aAXutGJF49VvqkIN9KC6j64/Dy15vnOQPSUEPwujTbF4hJ0UaQCjXq3DaX9yV1V1xG5UM+V4Oqc0MHHBNsIU5xBkkeNkybl4i92eIf8x+V03+/NtGQXLevp9+B5YKiqEC9NjrAdmoU4KQS5KjogIABHVoqr1JMl9OvgIxSTSMV33iVWmXnXUKUgHt/sv2N9fXM+fFhvOFkjVimgel75CWOcZhirR2dmW4XDwGiBAhGdLZZ1+upaKWtn82QuMekMktcVL8Jpd0GnHPwcaApM13xwA1rXjNWpnsPOl2X6Ci7Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mwqM50wlIA06eRoTMmTbCNqXBv1QENOl7TrC157dt5U=;
 b=hMiwro/GCdv8Jl7h+E0mTLW7YK/wcAgPI2+qZCkptb8A5BmdJfS3FUDHXrpE5eFr7bNaHBH3n7no13Zm3Gri4kdUGxUj6Z4iqMoeW1QuNv+dhBn1lvICS2CdVTf7aZw4j5p9NuiBfrOXd+nzH3PvBC8h1hs0ik0XrbkIv6zYzH7tyX0eKPPCMOMaMxxKnFIltaNl08FCK/SDO3/mKvIjIxMXUyt1IJiFA8u96BIS0921EweJuxT0gu8HCANQgbICRIy2dAdvSRnGGkxF/YGGe/BhyuGgZRb2RjI5wZsy3DeD9pC1SaCJJPCuTt1EWK4dwe+NRTFqTxRAokiOr+LQKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 CH3PR03MB7314.namprd03.prod.outlook.com (2603:10b6:610:1a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 06:28:01 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 06:28:01 +0000
From: adrianhoyin.ng@altera.com
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	Thinh.Nguyen@synopsys.com,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v2 3/4] arm64: dts: intel: agilex5: Remove usb0 in Agilex5 SoCDK
Date: Tue,  9 Dec 2025 14:25:10 +0800
Message-ID: <bde05c108287e5562b3d676f41dc260b7388aaff.1765249127.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1765249127.git.adrianhoyin.ng@altera.com>
References: <cover.1765249127.git.adrianhoyin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KU0P306CA0008.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:17::13) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|CH3PR03MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e325af9-7425-4a51-9520-08de36ec1997
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4sI6wQ4rPLm/bYtyPtb/N29CE1982vWYn/gx8Um5k/Drej+x5QLIb/vFk313?=
 =?us-ascii?Q?oM7rwVLapmsHn9njyNoszSpjBmbebZOwJMyPpDHKC49LMbyvFU6uSNRUPiWu?=
 =?us-ascii?Q?R3HRKhRzCGGCjnFNEAqOiljxSB/SC1f/ytxBjc6fkgRAsUI9Z4JsvqEdjkZk?=
 =?us-ascii?Q?67KrgX5pagPrvXiIhcbiRSV2sSdNh9YYPIiu+BSW/NQxpFcCevANnS09Z5I9?=
 =?us-ascii?Q?ZFqGtTfNJ5C/7kxSTLuuorR+kTCq/ejevtr3U2rRUJKk5K7+2JUuHFpczo5C?=
 =?us-ascii?Q?BMXu4IWM+/cedLYayo1V7aZ6JuSIDoewZia9ZQ035t+wB/xY6uVUTJ8Vam2A?=
 =?us-ascii?Q?4O9T1PbRZEDPrDfblKFiCaQKCMB+BDn7mtEBSkOw7JOdTSIRHSLatTh+ipSn?=
 =?us-ascii?Q?VHyVvP+bCiN2g/Q/EFA3/BBVYnuABSdlveTkG0LQ/IpX04tLVUFg//oswmgq?=
 =?us-ascii?Q?Ag+NDUCNo0bAppUyxqrdMKDY51yrP9u4BSb2L/rb6qEDjWBb9iHtp+eGmw38?=
 =?us-ascii?Q?qi8/Sm+vUufAEzJfuESR8ieNehKFD8GKwLmb1kp+icuP6muP3oNkOLfYySuC?=
 =?us-ascii?Q?G1GN1J3QP7aDiHMXjzsOzfY9DHuEXawJ8lj53qOsNvFFAEnEtTCEf67ldPrS?=
 =?us-ascii?Q?avwqni4uZljjrn0UcNzAn1v01G4zwaB8k5tanVEmyVZXZfpi9El1zwpGXouF?=
 =?us-ascii?Q?Q/jPZ0eXLFyeEguJZlPxJopaCfSCLUq1Yncq4kmPzpjPpu0fLD/k24Z+5kLj?=
 =?us-ascii?Q?HGltTZldixuAgYuRzEqhRsuDPkWK8NWpKQy/gxXnSKJDfwPwjoAObXoezkAS?=
 =?us-ascii?Q?YANYJrO+ldqUPR+DdzpOJhwyq6Vu4x7MvNbyt/JCWr0Dosty6wRHShC3FEd6?=
 =?us-ascii?Q?+h6tyWI75mKk2kn1XSQrOv7ukH9wDDGFxrkyPeXU5LCVBzLpSj3l0UZgpS8/?=
 =?us-ascii?Q?mslA992AFwI8MYIj392V7VMHAop/v59PTKLWrzDpwYEh6F4i7PcX5SkwdRIV?=
 =?us-ascii?Q?EM+tJyVYSJnl2DTDuDZFWot9EQ2y4uR4JOK0YWKQv5Cy1Wy/pnCnm4ul+9bR?=
 =?us-ascii?Q?fGx2KdAf5l5Nd4tK9fAnvw05w07FtKyJv4i3k+Ha2afkpErp0vPxfoxhl67D?=
 =?us-ascii?Q?yuZyxHGM/NQa842871b7IhEIgIP6ZK4Cubvlq0w+0My+q1ojtzdiKUeUM0su?=
 =?us-ascii?Q?Q0ls0tYDuDg41w63594PGbenpHzy2Z+ydW29dEAA2xqvCZGbI8iqbwPsNIFY?=
 =?us-ascii?Q?cW87CqQXMXMadU6tH58596ne68p2rKaCVPtFBTdFKLqswpRSEJk5yzAxHbxk?=
 =?us-ascii?Q?FdFhQhFiG4btbRx9ueQcaamSauUAaWsWENEO9nWsmD08BDV/eGeCSifhgc8d?=
 =?us-ascii?Q?Znqf1zqtYrdWM6vaeYkf+GDZXqw57GbIzcDGJH4vFJehlcc/KbmzvuvYsCed?=
 =?us-ascii?Q?MF1f50MTSXsT+zvzYKvcq0rlYEWScs+O?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WPX3hvjLxFlax9L89fiO1KpP7vcue2bmIwQ4d8ekDRQuoMsNy3ULM7QgqWiM?=
 =?us-ascii?Q?7c+7Yw1nmPpcl2NoBZY7lm1UU4XGPfss354SY0G2kBG0GxOtnlC/3QmZF6dm?=
 =?us-ascii?Q?PKWuBrWAiCY8BUt82u6h4gKxeKrdE+UIE3VFJneiBClJyMJMmNmEzApQ2PZ4?=
 =?us-ascii?Q?YYWPL1oJLWaX2PkVTxz1fKqqh/dt7QGnUAkdoMcB1HPNye7XOQwj71N3HuO7?=
 =?us-ascii?Q?OEyjqmhgCT0mFQF5EkFJeBYyqJ0FhexJcR4wChm9SwgFtCtGs2Vv1TK9lGlV?=
 =?us-ascii?Q?ot/WbiH7hZnBWm/ZK4+4RAmE88fRQBSaxzh3YCOtV7zuZA55vgQ622s+oRCe?=
 =?us-ascii?Q?4oac6bcAAZNNCinzWIMQidOl9ESkQ3XAwsyfj3z7GZH0fHcj33OIEs05rO7E?=
 =?us-ascii?Q?4PYhfS2FyK04vTA+QUuNZbToxgja4PqxiHQVcHk0pPJcSWkGSgNv0ofzVV+c?=
 =?us-ascii?Q?ICTgM1jgz7/Ymx9JE1BhpZOHjReqNsI2mPH+lxV05S5cTcDu6d0ZBuifTkI3?=
 =?us-ascii?Q?kQlQt2X3eR6DK/TYEpc3VEaktK1jMNXGDKgmdTaRSqz/0vA3r8j8R9Lb0CPn?=
 =?us-ascii?Q?2dtu0y9wVrMZZnOyWAN/2xAIwX5UrVwuQnMXcPyH8M5DPrcyKjIyWqTmsyla?=
 =?us-ascii?Q?UeI+/wwHgFcf2P4MxedLe/lB2D1MbBMkF/XYkhqExWhpav5qFhwB0mZp1yHp?=
 =?us-ascii?Q?VThebvophKoJMBe1o6iKAlynyM1obPYJb2t1xcsRJn9Aq5c5bMqSnz4CJCvY?=
 =?us-ascii?Q?tjM/lzlHxcdWOJgx4aGoTtpkOBamXf/jyzgB4qhG2RyRPd1wg+hAOdU5MRPd?=
 =?us-ascii?Q?vrFh30Hs8/ydzxe/rbKP6PFL96ZeQ71gDYJdKQzPvHMOopxg+S6JIkiG8kpb?=
 =?us-ascii?Q?VebJXRG+1eWqW35T9/rmHBXQwpkSa068Kuw8jWPeCESLfbT0urW2nFCMCO9b?=
 =?us-ascii?Q?slmn5BBzhhclYQnMzbb/6fu5OmSdyuklMPt1hjOmBkgxq+5gIE5B80C3og6S?=
 =?us-ascii?Q?ReGWogIrQ90F2rmn0Gd/LXIvMME1+gtaaAZjl6oHJItA14cUZFALLUoGrhf8?=
 =?us-ascii?Q?S4/w6Z4n6mH3M7hoCsbBrM2w5NjAmdWzZVJvUwenQtBndbm87sCuDE3udvM2?=
 =?us-ascii?Q?aJ/oJxJJM8CJ0rmjpxzQ5ImjR3d4KpTwEbrquHsk/kJzg1dR9oKuebVHqCuE?=
 =?us-ascii?Q?sp6hhGUKNavKepulORMkUnMZxngZmBIf3CcSERl/5O/rzQkuS3eDcBnLIwpn?=
 =?us-ascii?Q?3kTcK5cwVs8O6M0vZ/JDBoe0Qv15LZTr8sdHQcOw1r5C3hF+Gf6SiWoQmZgo?=
 =?us-ascii?Q?ZgnpqdYrnGmXrmK1oTGP90vAtNkDXjUsRhj7qXx2LflD5lfVRVOqhDStclJ3?=
 =?us-ascii?Q?b5HCwA4nHciukxqsYwaTpYCEyc0g0FvrwJBpjRctEeG07kh1mymZcUqEWzGd?=
 =?us-ascii?Q?yq0z7gfxpKTiIH2ABRZZB/9+HiZqi1Sp1keIMaPN8h9yXiRgzrAdTGTx498x?=
 =?us-ascii?Q?X0b+UxzaOV0nAnzSbpecjbbYPjgNu/AvLWTPh1agvdPncmabXVwpLaJqDseF?=
 =?us-ascii?Q?lwEgGREqobdCsQU6oPNi3zJ73eThGMWCXV4FsKeXxEW6DOqdLf86iZVRZLAb?=
 =?us-ascii?Q?Qw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e325af9-7425-4a51-9520-08de36ec1997
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 06:28:01.7107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IdjjUJHCqpwkQdnXQXe80vXopcED0+iRBpWO60mJ8Y2nAjRY+zGyMm+HQhO5Dz3alvnpv1esrr65qCdmFdf8I6jtdUF3QA2hcwRGrszAcIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7314

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

The Agilex5 SoCDK daughter card only provides a USB3.1 interface (USB1).
USB0 is not connected or used on this board. Removing the USB0 node to
avoid unnecessary initialization and potential resource conflicts.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
index 3f5b116120fd..e10bfda1a440 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
@@ -102,11 +102,6 @@ &uart0 {
 	status = "okay";
 };
 
-&usb0 {
-	status = "okay";
-	disable-over-current;
-};
-
 &usb31 {
 	dr_mode = "host";
 	status = "okay";
-- 
2.49.GIT


