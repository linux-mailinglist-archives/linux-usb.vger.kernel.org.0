Return-Path: <linux-usb+bounces-33325-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MG2VGBmrjWkK5wAAu9opvQ
	(envelope-from <linux-usb+bounces-33325-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 11:27:37 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A2A12C792
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 11:27:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 864AD305DBB6
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 10:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC5C27FD59;
	Thu, 12 Feb 2026 10:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kX+w3OYy"
X-Original-To: linux-usb@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011052.outbound.protection.outlook.com [40.107.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1385220298D;
	Thu, 12 Feb 2026 10:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770892021; cv=fail; b=H75KhGMz3UbBKsJ9KYoqsTmxw9Qi5auZsp0CMj0J0Uf09TOYWvwkX8S56ZonyTyig8dVe8dbDO2W4X3ejvcNKIszpqPNns8Q/KheHgwHMRXNi3uR13uh6SynU1KS3wZa+rvBTvpGK7Xfqq29EYJEDOntzBtwceoqTn0eKSqsQi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770892021; c=relaxed/simple;
	bh=TcIsKYkFgGjdU2PExlJsZmHHvIG+ja8cSC060HGFJUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hXCmsVSGAkAXh3diRAqhYnlKaXcNMYq4LEzGFSRivPqUKURyxPR4349vgBeM+zBKplJGE7kfYaPrNZMl10I+0yjZ/ti/YSIa7Vj4ruoE0btRV1UADcFYw8BSmXJsP6V415X7R1wCI0xsgUL/IT6FBP9WhxwxI4HkiMptcLGJOmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kX+w3OYy; arc=fail smtp.client-ip=40.107.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQlHXPDdvMoolcXpVjWwEzVD4rePpQZwskyTOY5HrnGlyc4cqkm7tlGXjQJ7sSorsvfwcRNXFW9PxKt6uvb1pIggdKK1k/CdfvLucgaEIZEK84fQBML6XUVdpokVUZfJ3yMrqcmXYLJcAT7fk13iERlQYR7xOwoVIp13nrGCONPA0J2qHIseHrmLTvDe0vk+WGvYBc1jCo5d5GkGT+KF+6FHILX3je0pQB9VmDYoEacJ818CrXVXrsFXAADT6teBQI/rB1E4VHBxTaVTS9sWAZAoarn6AP4mQ5nvfgdhXpkvWc7A0NAtBHiGu/l7FS42Ij3WNBVUurudj/0aJvEFbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86Zgk4HOLugT/plAHPCqWubMCngqRCzSb+D5jomKEco=;
 b=gypZDlkFiWd9U5k/OJRrLyzRz58G5QmwRdLuORdImwzZhTJYyBvgdd7Tfr+6c31+qZhmHWV+JMREPNilF/OQdrNYONuP8NrdROVbqOQb2PuU5HsIGXxo0IAHDUP/JU/fJIJwRSXE5AC3uGPXhA4inrPeMk0TgjyL2PxFdMzb4fIGKIYg+4LoKzGfGMdSIyNSUcVuCDqP6rcwWQRv+jEtdOlwvAORKP5ke3xnwv0n3ubuXzvAt+cS0jMcMg+yZ2PBrII30Gb2Jggr04BLOszfrle7DumyyO+FzMXQ5uEd2ZvNE+qyZhvROLIbx99zmW8Mx5rZevQTUyq9TqybFrW8gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86Zgk4HOLugT/plAHPCqWubMCngqRCzSb+D5jomKEco=;
 b=kX+w3OYyV7nkSW9dqUv88H7pbuCJ7jrOb4lRpljf+d6lrgHLxAKaJF/Lvmpg3rv3KQnhtmS/WvJdGJksr9xu3NOh7VssFcf+r+6XgVIGhl6dc2md3SqIxQkbthDp78hwYCP3vMOSjbfXfAkCfE/QWTgSJMcH/YrpJLoA9cQ60YB5BLteFG8slwT8nzfm30IqCulDdNIMmV5bTnzS8/H9cXv2TmiZC7bvxAO1jEi9Neb2eCZ8xTh0qd8kwAVGzxCM6mwkdq++IDqotMYScAHDOCGDLgVkoUr3f1Bn9Dad/hDrGHzqwNZcmvRD1tcVAZaAqLy7IGg74LVgupdeh+BN+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AMBPR04MB12206.eurprd04.prod.outlook.com (2603:10a6:20b:759::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 10:26:57 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 10:26:57 +0000
Date: Thu, 12 Feb 2026 18:19:26 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: m.grzeschik@pengutronix.de, stern@rowland.harvard.edu, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	jun.li@nxp.com
Subject: Re: [PATCH] usb: port: add delay after usb_hub_set_port_power()
Message-ID: <5jvckxqgwkqphwg5hp2cf4mzh6xrg4l6m6262q2afwlnhtuyeb@qymzpnirracl>
References: <20260211103628.3265850-1-xu.yang_2@nxp.com>
 <2026021130-seminar-comma-5a7d@gregkh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026021130-seminar-comma-5a7d@gregkh>
X-ClientProxiedBy: SG2PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:3:17::31) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AMBPR04MB12206:EE_
X-MS-Office365-Filtering-Correlation-Id: d9ef0e4c-ea59-4336-787d-08de6a213fb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Om4hfqiCd1AB170qB/r+byTJkj8LDViy+mF6luob+y7XhirlRBmbRcPnadMu?=
 =?us-ascii?Q?7abVmkTATCUYRuNli8XpRXWu4HgFrSYwoeN7R3Ye/KcDGiT2F1mjl13g2DHU?=
 =?us-ascii?Q?Io179pZceZqJhSBmRhuzEqjwvXzeqb55tndQu0A5OHD6zIX+sAm8qGkwqBwK?=
 =?us-ascii?Q?AHLf34i08ZpUcfEXDmwbabJR1RVXPuDBJz13i9vMBmNO7ID5vFXAEut5E/d3?=
 =?us-ascii?Q?CvMWxSE8mnR1RmpnnpUQ4xf6kiMDqFh77wBMJpWsuEXqevnE2s9EIAQTDmgz?=
 =?us-ascii?Q?h35YTFd7i5LN9VGB+G5JETecxrX/GiNEdCFaLnlxcUowgsffS9SBWdmbY6H9?=
 =?us-ascii?Q?VwdRBKTRQEjR/mr5hpz0aa9lcYHev7UFFSTeeriih2dTaadFRw5cvfjS+SnJ?=
 =?us-ascii?Q?dJzhZIEKx8+jxMSGlXDNO/F2vT+1+ghfKJkPhyG1HaNzPWjKekU1J9s+Hm0x?=
 =?us-ascii?Q?dTwfP4bv4SrH3WXMzTIsYvedCgxMM8t05TsTe3ZOtWDzT7qCc7wLGbyTOTsr?=
 =?us-ascii?Q?uZ3XpqOb1vQl6uapswLem5CbG+OWi0fVe6NRvDNbLiTLYje69aqE6KUnyVfl?=
 =?us-ascii?Q?X2ObJYbHagIpf45QT9ZCx1qFkznukY8bPU2r7J3EVjTdze4CblzKwx30pNUi?=
 =?us-ascii?Q?ljpzZAu+sJnWj7JDTGSxux6PXFMyUMNx8iazkXt0hrWnhqccJbri03WGRjCl?=
 =?us-ascii?Q?iDRJYKYPqi65NS3v9oeDwP1MfWthXtkF76ilguE7aOeLcpu9Vv25PTTE5qb8?=
 =?us-ascii?Q?wk975AjFPrs/nqiGnGf5FRb7VbECPXzR3Pnwf0z53bmm3nnbyAhKFiVkKxfC?=
 =?us-ascii?Q?A8APRCKfb93jZpbt4Z4qoyNQm7OA5lGigdaVRAu4tUChTM78jbyhxFMyaUKQ?=
 =?us-ascii?Q?wyO4V5X/jNbSjYrjqA7cXX8jkTirLqNfin+iUEMV5FdLKL7cpMb4W1h5pHzZ?=
 =?us-ascii?Q?SH/5nYp5pw8U+hSMwRU21vKxXWwboDDXh8GiekPoOcDS1W7oIHGDXrYADD1L?=
 =?us-ascii?Q?8B8vCn/uhtxve1w2EabsSPXSdMlTHQ7IPDGL6Fa6/jXIJom3P0kcpvXO9qOF?=
 =?us-ascii?Q?oq6sHnb4jpcEQ6urjJWjJ+LMZY2tmJCCOb6VUJCEVXcrFnFschxR+KG0m6yT?=
 =?us-ascii?Q?LoO59Zp07jllqHCj9rn7eik6lplrUXRUi5sxDRGVth3J7K+oN6dpJDAk7tEM?=
 =?us-ascii?Q?+R003alF8YT8i/DlRvJCKjEZyzOYAw7kwrDiihYzOdhSmXuS1OVMe/WUgavh?=
 =?us-ascii?Q?EShWXXI1CDRHEBSZaIpqcuRU1WJV/Ut1Xj/7Q3700/vxfy9zryv692QjgBL8?=
 =?us-ascii?Q?RBUEQ2Q3WLSI8otkbFSUsUxLNSViKnSTQo7wsDDPH1o+Sv123RGgkd3a63ad?=
 =?us-ascii?Q?r89FsGJzZH/o4gSm/wjXbfpSXc9Im03miFOkkoXqqh24nPfzQa0QavQiU/rK?=
 =?us-ascii?Q?2lfTzh8Tre3bIXfX02ETXbXLC6eJb6leJUsyezhDxCL5iNhFSg5d9+EhXREL?=
 =?us-ascii?Q?kRSXF3TkVmTMpWdqAZ45hbQT0cGD8bF/4+Y7fchnUbbmvWsI6e0o1Ds0nyXz?=
 =?us-ascii?Q?jldbkJVDVIEpJRL5zCymXGl8XRFhKzUJua7seJRkVI7StAYmNCLH+80B7UaM?=
 =?us-ascii?Q?ap+INv76qMPvXW195txd+gg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lz+Ll3y/4hKpKfd+9+iZ6uAIVXxjQk3d/j8C/NknoBG4xvkWgq4kaqmKFlgf?=
 =?us-ascii?Q?UarB8lZJh+J77iSRT/IZz7G5hW8aIVno0DXmI0Hdpt02Eald8vbxzLKHEG9T?=
 =?us-ascii?Q?Bs9tZZD4GQ9b5kLMmjVwwPhoRurnnmxOqteMeJO0vU2AMelB/SGy3x3KPOBl?=
 =?us-ascii?Q?F/fMYlY0fy53GKrHjCdhK/1VB52YmoZM9APHX8tj5OnXjhPrNVFB6YHMwRxR?=
 =?us-ascii?Q?l0IpM00BRLJ5jwPcYk01l5SEDYDyeCuxFshu5Vz2tnkCXkbPuFitqon6PEzf?=
 =?us-ascii?Q?Roud9YurmLFuyDTaxksT9YnNx3wXICJ/1Eo5CCuqUoasN4bfn3QfPKSV+SCI?=
 =?us-ascii?Q?tzJHb/sCYM5ZQBOsavb/zs3fg2nTIN+vq2FPCM2CREw1Ab/XCa5YY+w9RudR?=
 =?us-ascii?Q?1Jp0i97HqVePWEMTkIHdKun/2NoBTKL7RPebd3W5RtE9M/4JReZZ5r17BBBa?=
 =?us-ascii?Q?Tcv+c0MmxOvPjiPzOeWErOPrDZn0M9DbHdMYHXwF6GWb+8QrRxK7DlQlMdv7?=
 =?us-ascii?Q?+U4K5INPJOqeDRfCgW/HNYJJM8kfLxAr5yP9wwUbeFZpBtTSu0cMw+JwQj38?=
 =?us-ascii?Q?hTiLlBL8odcB7SFu6zpxZtDG2KZbE70yGxN8PsZZRPVwa+lRdAWb7Cq2eAyI?=
 =?us-ascii?Q?Xg+wod2WMq0iX7qt185zBolBAtC7R9vl7b87iOf2aR73nMpUkp1xXiEFNlsV?=
 =?us-ascii?Q?c0qdEVWyZ+/GfhzrfVVHPXK8o1SMCdxcFizplk8dSMhWHAW1h5lzsyFmvaxJ?=
 =?us-ascii?Q?jdv35Bif+XOur9UFWRXRNS5b1whiUCyRrFIzEAoIwhEyDq4e1CKYh0tnKW9+?=
 =?us-ascii?Q?cJ4roCGtRfoLp+vybBrHuR8l7jUTR+ktaK5VbhtAll5JWSVGUFMJRuTJ8D7G?=
 =?us-ascii?Q?MF7nggva0QrsVcqaSrk6A4qufZUepumNZTb/V1VHF7zeW/9Sy18trx2rNjpY?=
 =?us-ascii?Q?psh4ft6I2QubO57Z4CD1J4WTyvkdeLeVgkWo0WSXg6J/ZrBPK+qTBQhanjdw?=
 =?us-ascii?Q?T1UArfYfVLx3kBa9g3eYiwPwJg2fC37LTyiGorN8z+HXSMPzBuywKP/CHovz?=
 =?us-ascii?Q?R/AYqdKeDF1/rVJSBPyPJkDY5+pQIuHgT0mjW1GGY+uiux+4Fw3trmKktXL7?=
 =?us-ascii?Q?d1nIv0GkB11dQ1ibQXbfZJkKFE6Z++Ev8oozIutcRH/Xwq3QmXwa7KMAbtSC?=
 =?us-ascii?Q?/MGDdt53i7o3be7bAKM+YNX2Z/juTo1ZbJPLVFqCrSQonTalz3HY+uLYDMq1?=
 =?us-ascii?Q?AQw8w1vSAhKmZ5P4UGqs6mM4dG8DIxAfonSTY32fygC7eWyFdT4T7yhYLWrZ?=
 =?us-ascii?Q?OFCgfC5tDWkGV9PKKQ/DDA2ccFuNuyyv9etPbJl9SezuUXRU9GERUbdE16+y?=
 =?us-ascii?Q?scD/+8Gyd/QcRn6t0TCgBOkpF/BMqx/Vlw4fSQhVAejbz1oKEXZzP38jwUOP?=
 =?us-ascii?Q?AgbOTJNXJkqrvjaKAxpxsT1Nr3mtSI41CdJzKU/wvzz6HtdAy9Krd/RybU9r?=
 =?us-ascii?Q?v5bthbPs51LEfYD4NHJzcTFz9tuzGSW5wbrDnU2eQGFISky9bm7DVOIGoYF+?=
 =?us-ascii?Q?9+8bT6sPnvbCOTNyPU4+lDc8Wv+M/NUS/bOBfYVrT8s9Mq05f+C0FgjvEqlj?=
 =?us-ascii?Q?KxeLjDb+mgIbVkQ87OF2UGLbzbXRs7e77Kid3Rh13gC+qE/+gTl3zGU4OzLe?=
 =?us-ascii?Q?uzpZxDHKi5LY2HTLCBBJfDSdE0nJofwh5YdhqWDIXM/oyVeP8Mn8rFDQKWvy?=
 =?us-ascii?Q?7/UNfIZdbg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ef0e4c-ea59-4336-787d-08de6a213fb8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 10:26:57.0898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: trP31V13gxAJw9YM6ubHjSB9c98Cougq7v3oPKUUvlvoh/7RzyCbwkqe64vhJ/VobI7XClHMaLviXsCy48LeNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12206
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33325-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim]
X-Rspamd-Queue-Id: D9A2A12C792
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 12:19:38PM +0100, Greg KH wrote:
> On Wed, Feb 11, 2026 at 06:36:28PM +0800, Xu Yang wrote:
> > When disable the root hub port, somehow the device is disconnected and
> > re-connected again. This happens because usb_clear_port_feature() does not
> > clear a truly happened port change. That says, in fact, port change event
> > may happen after usb_clear_port_feature() is called. Then the subsequent
> > port change event will have impact on usb device suspend routine.
> > 
> > Below log shows what is happening:
> > 
> > $ echo 1 > usb1-port1/disable
> > [   37.958239] usb 1-1: USB disconnect, device number 2
> > [   37.964101] usb 1-1: unregistering device
> > [   37.970070] hub 1-0:1.0: hub_suspend
> > [   37.971305] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0002
> > [   37.974412] usb usb1: bus auto-suspend, wakeup 1
> > [   37.988175] usb usb1: suspend raced with wakeup event         <---
> > [   37.993947] usb usb1: usb auto-resume
> > [   37.998401] hub 1-0:1.0: hub_resume
> > [   38.105688] usb usb1-port1: status 0000, change 0000, 12 Mb/s
> > [   38.112399] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
> > [   38.118645] hub 1-0:1.0: hub_suspend
> > [   38.122963] usb usb1: bus auto-suspend, wakeup 1
> > [   38.200368] usb usb1: usb wakeup-resume
> > [   38.204982] usb usb1: usb auto-resume
> > [   38.209376] hub 1-0:1.0: hub_resume
> > [   38.213676] usb usb1-port1: status 0101 change 0001
> > [   38.321552] hub 1-0:1.0: state 7 ports 1 chg 0002 evt 0000
> > [   38.327978] usb usb1-port1: status 0101, change 0000, 12 Mb/s
> > [   38.457429] usb 1-1: new high-speed USB device number 3 using ci_hdrc
> > 
> > To fix the issue, add delay after usb_hub_set_port_power(). So port change
> > bit will be fixed to the final state and usb_clear_port_feature() can
> > correctly clear it after this period. This will also avoid usb runtime
> > suspend routine to run because usb_autopm_put_interface() not run yet.
> > 
> > Fixes: f061f43d7418 ("usb: hub: port: add sysfs entry to switch port power")
> > Cc: stable@kernel.org
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/core/port.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> > index f54198171b6a..a47df5d32f7c 100644
> > --- a/drivers/usb/core/port.c
> > +++ b/drivers/usb/core/port.c
> > @@ -141,6 +141,7 @@ static ssize_t disable_store(struct device *dev, struct device_attribute *attr,
> >  		usb_disconnect(&port_dev->child);
> >  
> >  	rc = usb_hub_set_port_power(hdev, hub, port1, !disabled);
> > +	msleep(2 * hub_power_on_good_delay(hub));
> 
> This feels like a hack, and you are just getting lucky.  Why this
> specific amount of time, what guarantees that this is ok?

The max time should be the period that VBUS from on to off. The port
change event will happen during this period. I refer to hub.c#n5608
using msleep(2 * hub_power_on_good_delay(hub)) for this case too. But
for root hub port, I agree with Alan the delay won't need too long since
the host controller will trigger an interrupt soon.

> 
> And why are you disabling a root hub port at all?  How is that even
> guaranteed to work?

Like a common hub port, when the "disable" interface is exposed to the
user, we can't prevent the user use it. The reason may be to power off
the VBUS, to avoid devices be recognized, to debug, etc.

Thanks,
Xu Yang

