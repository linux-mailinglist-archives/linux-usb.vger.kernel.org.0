Return-Path: <linux-usb+bounces-33077-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2H+kMEbfgmnfdgMAu9opvQ
	(envelope-from <linux-usb+bounces-33077-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 06:55:18 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8EEE2246
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 06:55:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FEFD302BE03
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 05:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A183590BE;
	Wed,  4 Feb 2026 05:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aUimVhXs"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012044.outbound.protection.outlook.com [52.101.66.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310E33C0C;
	Wed,  4 Feb 2026 05:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770184510; cv=fail; b=S9Yi0Nc5KhUCHMscLy/b+nAVr6rwwEl+XUZYMkdGGlo2OqHnFoCdS8VPm4AcxymTB8ILnkqeXIEgT+k+pdWr/raMUT6ByoudD/fmy2K0SZDA+DxtWYpybiTkEWSdPVE+QAVDrVZk/taMk4rV64gIBx1owHC+JOVkPvU10O5RbrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770184510; c=relaxed/simple;
	bh=D2YWpjMUFBfcrFTSge71gN4Iacjfy5yyycrLjk6e05M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gp4uj1KdEBdn+nyPZAyAagtB011iGa30eJZzyVPnZXkOpBbTrEu9oaCpkL7qApnD5n1OaZG90cIUvOaJETe7lTnmmTCo16SwZ35bwRrytCO1LsATnVNzE6OvEM72EpGs/5NbZqJEUBWNjwt+9d3bknQXug3SBEH6JVmSMxftA2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aUimVhXs; arc=fail smtp.client-ip=52.101.66.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQg4j4IxDjh9cQ2ZIxL8paCIuJvhXVUesL9wBz29bexssBE02SVuFibQc4Nu7we+5dpbjv2W4N6E7lVrj/mI3SNffD/+DhsVNZUI1mxZHeNK1P+nhYhjKJX+Z8sf+7r3G6Vnq5ISE8dpCRCLutV1n6FJiqqkVhyV/ZenbcC6yujPtBD2Bbg6a4Ao/3VATdzPqZ/oTbnlT0HbjfMKlxPy3ugLRYSFcdlWJs+YrJitWfZPtxkTXvh8G0t4Fnf0/hMm9myj19MFkj9oqvLDjWXT31cNwjiYEsf8UBNQ25Ps+UlLLwDiXxqTsRwX37OZf8kmnS5RIBBHw8QOch1UegUnGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iB/cJb16pQK2nzG6zq2Lls/ec6ZmU8D17uBA88Wp4E0=;
 b=bU9rXna7SYnveerBno+CT3H4uHKQfxLPQS/HEP3XGnuXSdZ3DXQ3BaQcQrb+4UxHgp/80haSQm1L4+J1gvIoryfwfPLzDkWuZ8ubCvM/jyMtew0MvoBymqX02yEDyIupny26ZoscT69lm2+JJdaj8fwIeLpEK7n+QO9410RRkPPZwu9adWsU3RMe7EpQYh7qDD1r7BQRAob6uF1933/FZ585b/E2o8knRr3nejTZGu9H0Lsd5ZRzY7zY4M7uveTT+CejkWTPEwY3L73CNGbpboS1omPiJnA2/ZkpY7MfqERKtYLSq3vInmZFZOJg4FNxJ0/Ere4bQHzkUHK1HwHGAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iB/cJb16pQK2nzG6zq2Lls/ec6ZmU8D17uBA88Wp4E0=;
 b=aUimVhXshkBRv33dDII2hx6vsXbC3cMHsptGPtCayyLOEEE3id4DUXhFAhOtiV4K0S49uN1Kb4gJVNmWeQTV8CQ9JMezMyGDFk0SHegd85YyVZBZBUph1+FmTFoJe5zK3Zq85A53sGJEqqiu+2tCgBKVlIOWL5tJOAdEbysF/+K8hehjg92VVQXDaEQiNdg3OZ5NevHF1VAqCu7Rkp04I/LLbopfCPoVU+9IN8W1fM+6Pvf12gJWzUW5GYsV6pOai5mbKzp6gGVbRnSF7rPGvqcLIgHp5V4YMUEgW95kznrNwaf+CYRGqRp5PaeMbl1AHmYC9UTphnRmNbG0F9yuDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AM0PR04MB7187.eurprd04.prod.outlook.com (2603:10a6:208:196::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 05:55:07 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 05:55:07 +0000
Date: Wed, 4 Feb 2026 13:47:39 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, Li Jun <jun.li@nxp.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] usb: dwc3: add may_lose_power flag
Message-ID: <btmi4jypvq4qxe3inmex7zprgdjp4ug23kbirrllfeqc4662n6@uva5i26bfngs>
References: <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-0-c44a5e919380@nxp.com>
 <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-2-c44a5e919380@nxp.com>
 <20260203002405.5wxsceuc47m6hrud@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260203002405.5wxsceuc47m6hrud@synopsys.com>
X-ClientProxiedBy: SI2PR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:4:197::23) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AM0PR04MB7187:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a1ff0ae-ab82-40b9-60f3-08de63b1f349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T09TclptQXZkdmcyWWQ5OTduVTRTaFc5bFJuM1VrODROL3JGbmMxaG43dGpX?=
 =?utf-8?B?ME9qWXBTVitCTFVyUW45S21Hak9qVGdvbnpObFFKWi9OTS9BNmNKdkJGRnFB?=
 =?utf-8?B?U3YrOHAycjlpSU11OFFrM3E1VjZSa0xxQXJBVXptekUybVMxczVCVFc4eVN6?=
 =?utf-8?B?YmJSU1NSdDY0VGx6bXlhaUFaSGN1SDFJZXdRSHhCQ1BFQXRYQUkxOGwwZ0RY?=
 =?utf-8?B?dGN3Y09PNUZZVERNUEdDUVB0QUxiWVJFWmRkTzBETG5uYlZEYnZIY29QQlNq?=
 =?utf-8?B?bGZMY0hyeFRNd1orNkVFM21Tc2xwQVVQOVNaTXo1a3pvbUtkODJaSjE1dkZu?=
 =?utf-8?B?SW1zZGZ0bitKNUVDNzU3VVhZbEJqUDhsMU5rMll2SkNKM1QwUEdIbTVvbGg2?=
 =?utf-8?B?eFBKSWhOYk81OVpYRVpXRmIyenR4ellva1dCdnc0YnhYcFcxb1ZDUnJFbkZH?=
 =?utf-8?B?T0x1dlNmKy9NS1BCOXZPa2tyWEpybXpMTUJVcFI0V3B2ZjJjMmc4YjlWcUF3?=
 =?utf-8?B?dnRweHlDWFEzYjBLdEFXN3hPZHBSa2dkVkt1eXZuL2ZVWVlScmpPdHk2dGwz?=
 =?utf-8?B?R3lwT09tSk1rdHBvVzQrSThwckZrei9QbUtiMTNQdVY3cURFcit0OFhaZ3o3?=
 =?utf-8?B?YVhtMDVRa3VRbkJXVnNHTFUxVFRjalFUdnlsQmM0U0t6VXlvRU13LzNvYTRw?=
 =?utf-8?B?bjRIY1FkOWZzRXFGS3FwYnp5WWdoM1lTYlJmYStpWko0dEQ5MTBuTk5Edm1n?=
 =?utf-8?B?T2xsMk9QNGM5TGNXb3FZTUpYcms5TE5NekpUWDlJQnU3OVZpbnZ3TnBwdDNv?=
 =?utf-8?B?bGFxTmdOcGNqY0ZpT1NVZlp6UExKTFpuME84Ynp4SE5pQXpINWlhTW9vdWM0?=
 =?utf-8?B?WG9Gbm5RNDBnRmlrQzJkVW10UnBySjNhUnZSR28rMWw5S1BGZWdzVjJzM2c5?=
 =?utf-8?B?a3BzcUpIYlk4aGN4ZTNTaWxDRDRGQ000dTVGZFljZ0JFTkVpbTNpQllublFt?=
 =?utf-8?B?N2tXS0x3WmhpZ0dlT1dmcnJSYVNrMXRiTEJpeS83Z1NmNTdxWXR6VkVGMndj?=
 =?utf-8?B?WmpyNUVJUFhybHdyYjlJOHpaenRpWEFSVWdJSmlDdDNxTnpGMEVVWjZPc24z?=
 =?utf-8?B?NysrdkE3VVg4QU01eDF0b0l6SUZwQXVCYStDNVBidlBjaWYvWXc0bTNPZUg3?=
 =?utf-8?B?ekJ5ZENGU0U5aHFlTmg3K3VEZlBYOWZleEtnT21UWGtQT0dwSmRyNFUzSmxx?=
 =?utf-8?B?OVdRRU1LZlNPYXl0ejRKazIya1pESy9KZnhPL1ZQZE02KzVSbWJtS1VDN3p5?=
 =?utf-8?B?Ymh3MEU5cnFNS0s5clhpanppQXY1T1FPYWUzS1JwVXhmblNqdGtzYndRUXRm?=
 =?utf-8?B?alFyYnBrVHpMWmlMd2pMMXFvZjJDMHBCdnAvdzliamZFU29lcGZJdmJKQzgv?=
 =?utf-8?B?Mk5CTXlLNk4rZWRoSnhyZk9TU1Jxcm5wYVJTZHhWcW9ISGJrcGhCRlBmREY3?=
 =?utf-8?B?Y3BQS1orUEg1WlFYVlJqWmZMUWI3dExQTlFBT0YvNFVNVGh5Q0VLa3BPd1Fq?=
 =?utf-8?B?V0o1cS91K2NtU0pOUWZ6NzR5b3hxRTNEMW0rMEp3T1o4dSt4Q1Zqb25lc0RS?=
 =?utf-8?B?cnRONlc2OVdMTmNwVWg5ZEkwa29kRVNkNHFNUXVDVVRJZFd1SXlGSzJUS1cz?=
 =?utf-8?B?M3VVRGU3TXNOWVNCbFdLQUFKRGN3eHlwUkVCblB1NXNnOW4xTnNIcFVwVGZH?=
 =?utf-8?B?STBvMTdmNEpiT1hpMWhwLzFveTNnNDQwUzRadjZLTGhIS0drNXo0ZzB0RC9J?=
 =?utf-8?B?WE1vUHk4dCtXNVIzb2NtdnFlZHBYV3loVjJMOElTU3Y1bFNyZXBXNWxicldF?=
 =?utf-8?B?aGFsOVhFbkhQd2lhMlFSaDRqdFFUN2d2TVRyekE2cTBpZG4vTFFJWW5wS3l2?=
 =?utf-8?B?Wlc3YTRHWEQyenl6MEpTaE5yQlc2YjBFS2Y3NldtRkxJR0kxL1pnazU0S25U?=
 =?utf-8?B?WUpOdE1XZS96UkVCQU9XLzFibjV6TUI3RjZ4anZrYjh0UmMxcjZwVXZNNGJr?=
 =?utf-8?B?enhjZnZwd2lBVmU4aWF1dW9nYjB0YWNVVThaVGxXTjdMNENBQVJSV3lqdEFW?=
 =?utf-8?B?REJIRnpUNkdidFh3UlRLZm80NTFRcmdnVGxQcW10OVpuV1YrLzhEeDdWRFk1?=
 =?utf-8?Q?HBGdHsBX7MgTKAfQc6dOiAE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDhDT0I1R1FBWnFJQ0xHT2dDZm5CM085Wk14WnMrbG5DN2t2SFlSYUpzdTVx?=
 =?utf-8?B?SWYzMVF4MXN6TjVXc3IwV1dmYzRFQU90bzlLRWh3dnlUNFZJM2dqeCtYUlY5?=
 =?utf-8?B?Nk1pYng0enNMa2JHeWJuWjdnaXRvVkRXSUxJL3hnc2pPSVd0U3hucG5RRWdR?=
 =?utf-8?B?c2U5Ykp1SlhkOTJUQlF3Rmp5R1pkeFVDMWJJWVlvQk9ZZkRyNGZlRStPQjYz?=
 =?utf-8?B?SnVJQ0FQMEpVUWlIVkxqOG1JRnpiNGNySUdrUlg1OGRWR3ZpaFNLaTNZeTBO?=
 =?utf-8?B?UkVSWno3V01HY3ZvaE1nVStzZkFPd2MzT0VMYUFkQVcxMmZNUXRGOXZGYnFQ?=
 =?utf-8?B?R0lLZXZrVmdiaXpMV2ZML2VWN0RLL1RHOXkwQTRNc1dWQUxTcWtUSEd2UUlK?=
 =?utf-8?B?dGgzTklabVhoVEl0VUcyNTNUQ1htMWdvZE5naXNFaUhIaVB1Yi9NbVAreUFt?=
 =?utf-8?B?SDlHOXZ5QksrMTZmdDFaWGRHOHJSR2JQVWxTbHFsS1ZGNlRNNUVLdXg1SVRO?=
 =?utf-8?B?bFJteDhQc1Z2WGFmdmpKM1ZqRXdvN0NCL3Z6WWFYbi9taERoN0gvS002R0V4?=
 =?utf-8?B?clZlVERsdXprdnBkam1SYklnaXNWZ2RIN3pJRlpGcWRnYkp0NitzNlRZQ0Zy?=
 =?utf-8?B?WC9LS1UxSXVQd2R5LzIwRTBSeFRUSmxhMlUzdlY0clo5Qlhtbnh1TDlvd1RY?=
 =?utf-8?B?YkxyQXYzMHFMdjh3V1FGYVAvWHZ1YUhxUFFPR1hRREVzdERENlJrWHJXcHNs?=
 =?utf-8?B?Z3NtdFVUbGhaU0dTcWJDZW0raGYwc0Y3ZE1wWUNIblFYZDdwaGtiRFJpb2du?=
 =?utf-8?B?c3Uxbm1lcUc1cGdwZDJBNmZQZXQ5bkZic0hYUFM1OUVGYUlvQWdyWFQyL2c5?=
 =?utf-8?B?SXdPY2dIYmF3YmF1L3RDc01lK0NFOGovN3oyV0dIamlDM1JZUkxtUENiTlcw?=
 =?utf-8?B?NUhlVWtSbUc4UGNrdkgwSS9TUHczcElJYWhuL05Xelh3cDg2NFFRS3FRRkM5?=
 =?utf-8?B?Ulk3VCtvQ3R4TGd6dElLL0pGdUVYTkFkVjB1aFU4dVhlbHRYY3VpMm0xTEEz?=
 =?utf-8?B?eGl3bFVJK1QreEZ0VWY4Y0paNXZNcEVJMXUvWkQvSUtZaVQzNFNlL2JkVnZn?=
 =?utf-8?B?eVJLcTBEbktKcDM1aTc0dmgwRlN1OHpOaXUrbVlLSU9HMXJFUU91eXdzM0Jk?=
 =?utf-8?B?VHZhTkpYQUV2OXQ4TEphajdUZ1Z1TEFKSnFpcTBEclo3SnNBK1FVeW5aeHdq?=
 =?utf-8?B?aDRYVjB3U3ZyVmtoMkRVemNQMU5vYk1QckJ2d3J6OTcxRHlSU0lqSlEzQkdD?=
 =?utf-8?B?NnZnbUFqK0NWV0k1WmtFY2dKMkh0TTlJOTFYQXF2UHdNc3puSklEVDd4VkRG?=
 =?utf-8?B?MGdsMFozRGRGK1dmZFZuZHdhbVlaVlh1MXE2b2hHS3pqZmtnS2lHY2szWm1R?=
 =?utf-8?B?MDVMYk16UFo2eVNKY3pISkNqSyt3RlRlUDQwRjZJTjEvV3lMc0lFdjVRbGFM?=
 =?utf-8?B?bU5ISmh0bXlrbjBWSE5hSWtEQjhHSkFFZTZhRHNmRTRzaGVSeW50MHd6VVBt?=
 =?utf-8?B?TW5wdDVvS3Z3WUtSSWhCSFN4clliQk5WbU1DM1pyNFZmdEl3dlNxU1puSGhn?=
 =?utf-8?B?elFxWklvTS9SMWtqZlBmbUQycDJMM1F6Q1V1ZjdhZ1MwQnB1K29UVFBVWUpU?=
 =?utf-8?B?K1hwa0F4MzRQTU9lNUlzU1JUMGxLeVhwY0tMS1RDek0zNzBhQzEyczVHUkJv?=
 =?utf-8?B?MnBHdXhLZGpRekZOWEZ1bURNNkZJY2hmTTNQdldJQnduTmZRY1dwV0FXdkIx?=
 =?utf-8?B?K1B6WlF6di9WQU1aN0h4TFh3QVFTQzNrV2QvNkdUV09aSnhGZzN2N3plaUdI?=
 =?utf-8?B?ZW1la1BhT3RhMGhxRW5FNmY5VTFscjR4VHhSbThMY0l4b1d5dmRVeWRvS0c3?=
 =?utf-8?B?aHlCOVIvT0VrdnZ3R2VJK2xOVjIxMHdiWVZSbS9YMDROeVZVdmRYN0pTMmNL?=
 =?utf-8?B?ZVlWU0ZRVW0wb00wL0FvOVY0MC9qVlBuRjErS1R6dlRtdUlIdmFzNHI5RHgr?=
 =?utf-8?B?NHJJbnpNQk8wNGIzRG9FV3ZJQjM1cG1TcmpZaGVGOVB0SEdUMnBuRkM5ZXc2?=
 =?utf-8?B?V1AvbE84dHBFVUIvcVZ3T25MM3JETEN6SDVmK2tGUzdwSnNwVDZuYjlPVDY2?=
 =?utf-8?B?QnI5UlViQzRRbW51aHVIMUh4eDVsbU1IWWJjdCtJZFNBd3VpakEzVTRhZWFH?=
 =?utf-8?B?UUhJZlBMWWNkVklqVGk0VnZ5Q003aGR6TlpMQWtaNytTZVFXNHBCNVA4NGlv?=
 =?utf-8?B?djhXWWZ2OGViQXh1MGovekFoRXhES2c2b2ZJUTZyYWtIcW9uNnk2QT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a1ff0ae-ab82-40b9-60f3-08de63b1f349
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 05:55:07.7459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GSW6NgzwuvQf5Sad97Zuj/khWAXogpXUSZAhc+J3VMgHT2UOjKLLmdb6AYl6jSbtUNtErudCAlpc/pXDqVO5Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7187
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-33077-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim]
X-Rspamd-Queue-Id: 6F8EEE2246
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 12:24:08AM +0000, Thinh Nguyen wrote:
> On Mon, Feb 02, 2026, Xu Yang wrote:
> > The current design assumes that the controller remains powered
> > when wakeup is enabled. However, some SoCs provide wakeup
> > capability even when the controller itself is powered down, using
> > separate dedicated wakeup logic. This allows additional power
> > savings, but requires the controller to be fully re‑initialized
> > after system resume.
> > 
> > To support these SoCs, introduce a flag to track the controller’s
> > power state and use it throughout the suspend/resume flow.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/dwc3/core.c | 9 +++++++--
> >  drivers/usb/dwc3/core.h | 2 ++
> >  drivers/usb/dwc3/glue.h | 3 +++
> >  3 files changed, 12 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > index c07ffe82c85049364c38c7ba152aab0ff764d95e..9d4326da5ec7669fa714707fb24556723cab51b8 100644
> > --- a/drivers/usb/dwc3/core.c
> > +++ b/drivers/usb/dwc3/core.c
> > @@ -2314,6 +2314,9 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
> >  			goto err_exit_debugfs;
> >  	}
> >  
> > +	if (data->core_may_lose_power)
> 
> Can this be passed down as part of the dwc3_properties within the
> probe_data? I'm trying to consolidate all the dwc3 properties to one
> place.

Sure. Will do.

> 
> > +		dwc->may_lose_power = true;
> > +
> >  	pm_runtime_put(dev);
> >  
> >  	dma_set_max_seg_size(dev, UINT_MAX);
> > @@ -2462,7 +2465,8 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
> >  		dwc3_core_exit(dwc);
> >  		break;
> >  	case DWC3_GCTL_PRTCAP_HOST:
> > -		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
> > +		if (!PMSG_IS_AUTO(msg) &&
> > +		    (!device_may_wakeup(dwc->dev) || dwc->may_lose_power)) {
> >  			dwc3_core_exit(dwc);
> >  			break;
> >  		}
> > @@ -2525,7 +2529,8 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
> >  		dwc3_gadget_resume(dwc);
> >  		break;
> >  	case DWC3_GCTL_PRTCAP_HOST:
> > -		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
> > +		if (!PMSG_IS_AUTO(msg) &&
> > +		    (!device_may_wakeup(dwc->dev) || dwc->may_lose_power)) {
> >  			ret = dwc3_core_init_for_resume(dwc);
> >  			if (ret)
> >  				return ret;
> > diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> > index 08cc6f2b5c23631a752c77fd7394e5876c929f0a..5b1358f36490a001bc9e68139224f7be70a57995 100644
> > --- a/drivers/usb/dwc3/core.h
> > +++ b/drivers/usb/dwc3/core.h
> > @@ -1117,6 +1117,7 @@ struct dwc3_glue_ops {
> >   * @usb3_lpm_capable: set if hadrware supports Link Power Management
> >   * @usb2_lpm_disable: set to disable usb2 lpm for host
> >   * @usb2_gadget_lpm_disable: set to disable usb2 lpm for gadget
> > + * @may_lose_power: set to indicate the core may lose power during pm suspend
> >   * @disable_scramble_quirk: set if we enable the disable scramble quirk
> >   * @u2exit_lfps_quirk: set if we enable u2exit lfps quirk
> >   * @u2ss_inp3_quirk: set if we enable P3 OK for U2/SS Inactive quirk
> > @@ -1369,6 +1370,7 @@ struct dwc3 {
> >  	unsigned		usb3_lpm_capable:1;
> >  	unsigned		usb2_lpm_disable:1;
> >  	unsigned		usb2_gadget_lpm_disable:1;
> > +	unsigned		may_lose_power:1;
> 
> This name sounds like a quirk of a broken SoC.
> 
> Perhaps rename this to something such as power_lost_on_suspend or
> needs_full_reinit?

OK. will use needs_full_reinit.

Thanks,
Xu Yang

