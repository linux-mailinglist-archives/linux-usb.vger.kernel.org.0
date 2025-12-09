Return-Path: <linux-usb+bounces-31309-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA681CAF08F
	for <lists+linux-usb@lfdr.de>; Tue, 09 Dec 2025 07:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5489A30D05C8
	for <lists+linux-usb@lfdr.de>; Tue,  9 Dec 2025 06:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50376320CBF;
	Tue,  9 Dec 2025 06:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="V7GTRApi"
X-Original-To: linux-usb@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010067.outbound.protection.outlook.com [52.101.201.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C19320CAE;
	Tue,  9 Dec 2025 06:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765261681; cv=fail; b=K/bIt6if5QXA+R3eaAX+OXHm7tAfz8BvBqhGmlZdBT2Elt4tTqE1N6iZmw2Pk0oeXm9K41uXjbvinUQjH8xLxxcP5vYpZ2UHHGoB0u84p+kFksyv07U+9p/IYcm3JotPz6+sii218jKBzLBFQsVx40Wm7ufT8VXmHtMtK8JkNHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765261681; c=relaxed/simple;
	bh=GmsIZHuSBbm5uht5EBgpMsoe0mEa7LDMEwRkfd52hCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IKNaaD+yz+9NIjh3BT0PJ82xRY2ifLf1hnX98g2WvvEjPNDgmynenDQYbwjrWoRdko1k1YA2xLNtzQfNOcVaWroSvvZ2x/wQepPXBDDs0fwlFHzrfJU0thR0p59gIasX7g32tf4dPMuZsDvbwsGQdfntxiOTnum82gYbpAum8Y0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=V7GTRApi; arc=fail smtp.client-ip=52.101.201.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sElsNdGFBVil91h3R0ZuPyzQy+hdyeyuGC6Yv4o+LQ9zSN1vxd/b3IBssXemYzlY/GoSJzrp3JMmDFtXfKY8LSuCdf4iKAqWD/jywHOspUDeAK8qD09RXQ/ABpeZxjKODXbUFlVeeXWCuSrFUJuxjTarndgCkZBKvzx2asNXbYLkrTML9UnWkLS9TUnhGjYGB/fq7KnBK8GMyDVCtdhGObe7pjoaPFf8KDhLQbkMWRFnIiyuG17LhEmElw8iIgX9hmOWyVN+vRq4tupHxY3NLGJX6PdgUZHsNzrrbEcs4bF8b89lv6aMQ6oGdUuKfjxRjoMIxPE1mPtRrcAWWfCX4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFpkO7AN/mIhw55v8J+HKiP6iAMpSo/mYVBFU9VFHM4=;
 b=cnka2ctiBgFA49PqeAEFtzT5es3uILhB40kTbebpR7gsZAnCIe3YgKpOC1sUoeVvmUIsarqfQLz/XalNbVjFQFPFTVb5ahnJhS/in3psI4RKzFqVw+7Ps5POCoIPv/eZBuja9MXfElL/fDrQXSn1dXx0SvWQTkXlzlcCub3G9LIiOwgHAc5yWBxqxFgely7iwt4mwFowpS6OmES8olU6T/z2YVvdkldZ1+xz64uJBZZHKL/9ItSNaNgw4iUSQzU4Sg/Mrvx2xXHTcqhQd0cCtVeWhQNcPYuu4f2C0+cwNCYgoVAbAebYiD1YobBGcmnfbmVOlin+id528g+0MwXw4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFpkO7AN/mIhw55v8J+HKiP6iAMpSo/mYVBFU9VFHM4=;
 b=V7GTRApiv/AWr2TKsCfiuCuTPax5dltlEfVlCPJwo0w7VIPY+OLCSpgwAJ1Jp+pfgxD2jX+1zk2YYcJ4QbYw45cyVTI+natdNu/NysjUY14L9+/78unoQ5aCE2irmGWKK/3MvtLkMaeGVtvt9aGI7Xo0L6jysbp8LZ2wZey2SzG41SJniHdEwFw2vLmWfWvUwPg+hH2IFKdSwn2ri5ZHtMZSND7OLNMVbvgQ0NaBljMa/6AznTaZQgy3Ac4kWg3DyCjtMMFPC7ZC4bDcwR8A35BFd3S0lsha0a3Krrm21/FQSBzP2Wydmf5SbO7lTtndmqIOYdA/GOyru+Ny95vGWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 CH3PR03MB7314.namprd03.prod.outlook.com (2603:10b6:610:1a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 06:27:57 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 06:27:57 +0000
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
Subject: [PATCH v2 2/4] arm64: dts: intel: agilex5: Add USB3.1 support for Agilex5 SoCDK
Date: Tue,  9 Dec 2025 14:25:09 +0800
Message-ID: <6cd24004aa13c44a7ad3277d79156451d7217a8a.1765249127.git.adrianhoyin.ng@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4342ca61-a4f7-4827-b51b-08de36ec1761
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CTXXrr8LAk0G5AXLOBs3493rFCw3D9xWcD57a1SHwvyQ5lFC+us3FG/HscKd?=
 =?us-ascii?Q?tGZof2nsb0yyuHeCWTI4PByAuARaZ9LEroRl5jjiRX7ZowFSqfMCJz1LQauA?=
 =?us-ascii?Q?9K+ytp7gWEMmscBgPOgCmAqrGUeWUn7CBm3iF7PepMc5FMHDhXSEKFTAcjkM?=
 =?us-ascii?Q?kKRR6BauPol5aaxDrkupegjT3qNZXxAu4meMdeuJXDlKVCEA6fcrdnBgHgSf?=
 =?us-ascii?Q?UOYM9UJNsv87tQdAaZWaZIFK1Uw5Re6ijoJ+zOsnySRFD1WnO/3FznD/AEwp?=
 =?us-ascii?Q?FUtgGSqyelK6EwYC9Jpjmga3RfWdilR0fY7YriXdURrmls2rLVkNWvFXooxd?=
 =?us-ascii?Q?6jR8m7LbMM27YFrmUC1+uTsiXWnp+RJ6NozVyEmZrB+LpiR9vsY4Mhy0os9i?=
 =?us-ascii?Q?L5vrA44hm22Mchc6aYZJt1XWyB7qD1Xo/54qXIg+MNKyKMTTv+FJSvgCmJWy?=
 =?us-ascii?Q?B1FzXame13W5kd6sgQT/db3IQQqOOPPH241N9eoHm/pQOxxATAGRoTqq7uqz?=
 =?us-ascii?Q?u4BTaa9Cn24TyU7ijjME4vwWlMEg14ga50ovl8s2FmqzdG1msamIDCMiknL5?=
 =?us-ascii?Q?G+aZGI7isGTpp94VCHX2XJZ88bL7pxnqJEm1HuMZ5nfmwI/u9PuSSIJOyzQ3?=
 =?us-ascii?Q?8nKv8eJR4EGkXr+UauZrnrRAmSmh2iPGPmXG1zkuVcl2YJUB+nm3beyQ+pAh?=
 =?us-ascii?Q?QFmYpY/CleBCrOuMleD8BkB68BCUjE5mOe7qbUv3pcP79S37M06XK/GBlPoy?=
 =?us-ascii?Q?yg+H8ndiIs3NujgjuUIwUPbMUulp6i/Zshfr2UrsMw/oL1bS6dNV92bLC2kx?=
 =?us-ascii?Q?KkAtpSJsfFn7/y9uFxOMhm/dI4HIRQAdwyAfxgwzWQXosTfZbOru2vrcD3y9?=
 =?us-ascii?Q?iHIoZIxKST8KIkWp0W0zFHPNudJKR8H2fPK45Thhpea9OxF23f6tXrRr5Ttw?=
 =?us-ascii?Q?2Z+D2uTM2Dh00VbmJSJZ7l+TTQ/VKJChlt1fMLzZzeMEWNKBC6BzpDuFflBO?=
 =?us-ascii?Q?hY/Av1AMXVdDem27rv/CPrG2yT4ANT7YFeu85ZNSREVNXDSb7/NqLn6Sd8hc?=
 =?us-ascii?Q?N9Ly/dVlhEZSd1BjmJwJ64ku2VjVsKMUTZ22BsyzWIeK9keXU+7n9kVYglRU?=
 =?us-ascii?Q?BciYwV7ywfdLcMth6MasSeJVPN78SAfcL0/ty+To7kdPuRxRxhvW7+FTPfFs?=
 =?us-ascii?Q?hV76czkAo3Y11GF36P5TC0txVxtCsPCYF3BVQI8+KvJZNPPU8hmzTkJRD9zh?=
 =?us-ascii?Q?QGATZVcIDhwv03L8SLlc3m98loOn3Nc2SSpSWoVjl9DwK/rlE94uKP6SZr4D?=
 =?us-ascii?Q?LcuFg2phTxl79yftL6PCWVsWmKl/0YZ6MVwNNs8wh9Vl1YqIlRNRybDdqo97?=
 =?us-ascii?Q?RLuQKmymT+LnjfrkdThYL9QDk8TrCPm8YqCRIWPEy7B/bP+CnIBsHv5VGIN9?=
 =?us-ascii?Q?1xnFP2UkJG4B3H1Ou9j5v9daXbCbJdIP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f6xv7ci0ZwxsagN6w59cGCl1bevIoh4pAWmkF5oAKVhJ+FLeIwMRUzxzYaCk?=
 =?us-ascii?Q?j1xWlCb56FgVKQosSckkkHq1iNpmonH0RFnvJpac6GrhcU5h7Y8u815V6KmH?=
 =?us-ascii?Q?aPC3cZQCBEGnAl0/muQ7R3P7fukOGm4uYHOf7b9MXddCb7ZqAiPPndnor64F?=
 =?us-ascii?Q?3cXezrx/NH6y7NZ8dPF/I3X3PKjBwYuSMRzk/iJ+a98q/cyzZcHydIbWrpGa?=
 =?us-ascii?Q?lHWVCS3yzM9edjzRN4D8N1OEu/h5evjpU00vGRAuThzEdN5V7RUWKjOURozy?=
 =?us-ascii?Q?gbnQLvXCsN9OyCP5ci1MLKZ11DZcGi+dwgoBNKx6nPXZJJ4hCr9JBCYoWZno?=
 =?us-ascii?Q?exODTLXcBxHXyayEQiLWXgqTHoWYve04PI+V+br90vf1r3QhRFdubF6R3HF4?=
 =?us-ascii?Q?uT4ft8NBU3dKIMu/LT/IIzV/UxHAKq5dA/aH8CcDk4UzJAGL3BFBGo45oMFm?=
 =?us-ascii?Q?H7Q5Ug3eG2Z/hyQJlB+e8x/vZt9Q4dYjFJBxNJW7k7jYuIKNFn5GH2NUvXde?=
 =?us-ascii?Q?w4taIT198hIceDuSni5lvIXtKCVqu3LoondgWA0uppo9jddN6SBSFm7S9keT?=
 =?us-ascii?Q?qgNZxNc2TyoUUid1G8OW8+vzwyRxcXx8ht4/YiH9TmgdaXwHmt5ahvgqdqze?=
 =?us-ascii?Q?kqHbvLRQ6LFBmtzL+jRmigQZAt0J/W6+1hQpe517Ftfi760cIVY0i7dRTENp?=
 =?us-ascii?Q?wAZDpYmVdf0SHYurjo805+T+9HAcOY4BE6QwwmoxFBfUANQaIzbTOyHVKjMA?=
 =?us-ascii?Q?QfgV6m+YMg0GQBFTdw0eHtwUEbqkXJcg71ZTOseEAKhNDGL9n3dQayyMoKaG?=
 =?us-ascii?Q?0n9jMVHPlo+XFEgbzBmrLApy+oQH33iMaklxCAiuy3arFXGyFKQfHMc9pvtI?=
 =?us-ascii?Q?ehcw0GbaenQJxMr2qYC9kI4tL9ImKG1rPoc5kSXd/rvpy+aUBnuFBP6svdv4?=
 =?us-ascii?Q?DM5dfltlRW5SEiN8zHjqu8ykTIPqwPuhhn8EfABYzF0iDgWMj/nCOFbmGxJ4?=
 =?us-ascii?Q?DZzua69A86UNZSyNvmZNAAGWi46lsL9qwMTo6PidK7WBLkJoeuBS2btxzpbH?=
 =?us-ascii?Q?C/BIpuzPwO4Sbike9uwdHwmnaeFwf0o53vv45oXon8SN07jS5QoSwjbbFdMh?=
 =?us-ascii?Q?T7Ph8FHcLwHrVImn4UOD4x4NlV0+NLchOHq88FAwop+yDcvpKHnuhJxz2Onb?=
 =?us-ascii?Q?PswFZypG4Gcz2ug2ZzuyDma8a91obopuv2+Owx8C0TwuCIayj4rrcyNZSvT4?=
 =?us-ascii?Q?nU729gDbh7IPWot80pQLXH7Ay1YTiuLh76sB3G4uOGkdykJh0LnXcBn7Suyg?=
 =?us-ascii?Q?i5AlusPIBy3KCkG6kZCNEmIxIa5ckrJ/3+QAevMcAHG05K3haHLH+iszdqJ5?=
 =?us-ascii?Q?8Isd3cNPX8wqHp4jcP4a0KWqbRr9jxcixDL6zMrZwD1ZcuX1nGl8Qy0HILHX?=
 =?us-ascii?Q?DtL3A4eZjKI8DKY6KcjApH6O9Q0QHHiing3TK01m22GFu9FizDe016v+9SoB?=
 =?us-ascii?Q?/WmDrN+Oo9cDtVGoBQU+bGjMXblgXwOZ2xlczEvX03D6w06BtWF+XQYTUxQk?=
 =?us-ascii?Q?0zXgnqroT7cB8gGXj2uQxtOJr3FfydWxNDPWPfHxY1o/NzhDC1EeVKrp1S+y?=
 =?us-ascii?Q?bA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4342ca61-a4f7-4827-b51b-08de36ec1761
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 06:27:57.0080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /dHVuF8+W4lhWoy7o+4uoi6oja4WSSuqU38vQWAdk3lbFGR0ptBDOCUSIslix7CF+3shMi9YyxMN+C1NE8yrOrNO+zM8yzdSOlv3eXbdkSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7314

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

Add usb3 node for the USB3.1 controller on the Agilex5 SoC and enable
it on the SoCDK board.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 18 ++++++++++++++++++
 .../boot/dts/intel/socfpga_agilex5_socdk.dts   |  5 +++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index a5c2025a616e..226e4f0a2439 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -483,6 +483,24 @@ usb0: usb@10b00000 {
 			status = "disabled";
 		};
 
+		usb31: usb1@11000000 {
+			compatible = "altr,agilex5-dwc3";
+			reg = <0x11000000 0x100000>;
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkmgr AGILEX5_USB31_SUSPEND_CLK>,
+				 <&clkmgr AGILEX5_USB31_BUS_CLK_EARLY>;
+			clock-names = "suspend_clk", "bus_clk";
+			resets = <&rst USB1_RESET>, <&rst USB1_OCP_RESET>;
+			reset-names = "dwc3", "dwc3-ecc";
+			iommus = <&smmu 7>;
+			phys = <&usbphy0>, <&usbphy0>;
+			phy-names = "usb2-phy", "usb3-phy";
+			maximum-speed = "super-speed";
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			status = "disabled";
+		};
+
 		watchdog0: watchdog@10d00200 {
 			compatible = "snps,dw-wdt";
 			reg = <0x10d00200 0x100>;
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
index 262bb3e8e5c7..3f5b116120fd 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
@@ -107,6 +107,11 @@ &usb0 {
 	disable-over-current;
 };
 
+&usb31 {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &watchdog0 {
 	status = "okay";
 };
-- 
2.49.GIT


