Return-Path: <linux-usb+bounces-35641-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PZ1ODslymnX5gUAu9opvQ
	(envelope-from <linux-usb+bounces-35641-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 09:24:43 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E309B356684
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 09:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E63E93007AD7
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 07:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4153A0B1A;
	Mon, 30 Mar 2026 07:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="BMVNYfrT"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013004.outbound.protection.outlook.com [52.101.127.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A5F314D13;
	Mon, 30 Mar 2026 07:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774855456; cv=fail; b=n0Uu3JphnnX9lRfWJxonuQMoxuaaILcXCL/eUCPuUpmM6apHVGkvsJqs4wS0TOGaMPoGGuoA2YhUHi8orG3k8+Y1GSplCAbtkL2eRmPlN9gPzCJUEa4AnWAxHejvI/c1jXXetfC5vMq7/i2B4cl4r3Av3dS8TA5a/iw9sY2elys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774855456; c=relaxed/simple;
	bh=D2JDKXMwTECdHQdRah5ea2dcFPfyCyzeUwLt07bWtGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BgejsjoHFAMNApZ++15ajtYUOYevtpnI1RwCuXY6ezrQdtyUoNVb3dwHQhO3/ZSlOPl6MVo0+eTjQKD176kRfYzZ8/5nR+EkfPxDo5mM1lgfa9oc6t8Adl1YaaihUslyCvBkE6dPCi3OlC5Tb68y7keoaW8rXB6UKnDeE3wigWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=BMVNYfrT; arc=fail smtp.client-ip=52.101.127.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsddQkwJisdGpr87n5MJHADJdze9nmLXwZgTc6BTPnoR+YIetC7pF1TwVi7nN3Bfrqbz/6VMdDK3r7k6ib+Av1JDfZ2hMCBnQVoNrAFVCzCh4tvEoifp8wbXfKqic4MwqxfX+PmqmwxIr9xwvo2do5G2S2qtF3rV0j9PA5eJJhKGSE/khOdHOWy8c/j0C4oXl5lGvsLjSyg0qsnTK+kloJLENDdXmNeeaWcag0/frLOamrm8eNH6/NP8yisfes4izspZZKTDfaxpbLEnDcxquj7TDss0O+7mvGVJsFzLlR/KX8qeIMeVElMVVHJAgXFd7ETKYE+/1tRQkJP+dfx31g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2JDKXMwTECdHQdRah5ea2dcFPfyCyzeUwLt07bWtGs=;
 b=Qy2YhT4kiOXt40UuMeplNiVzwNaPAzH+p4r/sjGr4NB/xBv7kiBOOd4Py/EinIrO5boxvoYXV86u6+yk6ycomm24Mdw5M+IKxYTrq3Ql6Q3LzXYjZCQ0K+bAVaI1V+smT4LRWXDg0hCgQbLvZ4UK3q2xDgXzV13hxx8r9nEX46YjqA5+LW3zGrnGQOSqfOtZ0H+1ayk5OrUOwJ1YrwShJOp/JeqQKf74MQPMfZW3S58vsDJX7guxM47kQri+IwCbOrL5bM7dXiFn83YPf+dwMaSu8dq2OMQlcbcbHE6jHQKysbnI7qoKudnQQ+l2ExqPdHTpnLPV0PK9MTLuzeA63Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2JDKXMwTECdHQdRah5ea2dcFPfyCyzeUwLt07bWtGs=;
 b=BMVNYfrT55bBNO0N4IJUWNBx1ooE5Vj6Qh6/6N96V8JAo3oF/qUR4wgJCRahSMjHvJ6crs6gajYDLIXYQ9z3ZuW8Ucb4Hjes4uvh6Y/z4Kr+a3a/LgHAMw1NfhQSPfUxO73aSruJxCvlqMKJB5L+8xrAQctIgMZ4uOu79Fd/31o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by TYZPR01MB4848.apcprd01.prod.exchangelabs.com
 (2603:1096:400:284::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 07:24:11 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 07:24:09 +0000
Date: Mon, 30 Mar 2026 15:24:06 +0800
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/4] usb: serial: mxuport: extend MXU50U support and
 runtime controls
Message-ID: <acolFoqcYDuxwmPX@moxa-ThinkCentre-M90t>
References: <20260324035041.352190-1-crescentcy.hsieh@moxa.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324035041.352190-1-crescentcy.hsieh@moxa.com>
X-ClientProxiedBy: TPYP295CA0053.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::10) To PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR01MB5405:EE_|TYZPR01MB4848:EE_
X-MS-Office365-Filtering-Correlation-Id: 208b0593-77ee-4a79-47fc-08de8e2d5564
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	5izPX65EZD7uFHro9EZ5CdP5cPTnhSAfbikDa5Mevxat078Lx+6Q4tqIp/t4CQlXlLN5E6I0KpemsIVyXYxJoRZMmFwkfxpkG/TfG/c1QZYBa3pB/3Ff0wtQvfzmPn7HcweqtSR9jg4UclNcM7pTF+n31yZptZ8urLVMlGVBNox2anZ8lT8nd31hIulrvxAy/az36yW2gw+LJqVuaMGiPMHFngBT81oPveqztGcdgDLJvFQ6Z1BigyK+pq5RQktvs5VfNpvTBxmRMzHm0XbntqJE7pw7QWRpglmS7gKMaVAJiF9d0DwFMwbpaY5sxDXcU/EFnfapRdxCXyq7R9pl9Fs2XD2qWhEETqgwnhlOpe0jAdB1XsbFpaqtW5pwBntig9XousGTSEGefHNGwf0HpVBGlg+Gbg/CMw0o1gTX7SzADVuTprO2d3V/jKd8Rn9R2m898v2xAyBdY8Nk4rLo9pF0n28eJHchm9PG1iVO3W/LMRpaRAiG7it44PS3hsJXLdUXQebttvy/Dw6IOLiI093mxBvKStbeLjmkGCS+NAdeQWr/hXkV3zURWDNThWvrtrVJlCcwfSv4ZV08bnovATpn+xLp5OANgipgx7vXdIZVAIS+B9VSD5HN1gvbXzR+Ifb7Y/AQefDJjaH2sZcHCXo7Tu5MlYCEl7Q1IVkEUh9/iuF81z4PFABYePSX/eZvUu/0Eibh0UWJVqX6Oppij6GNelo3O+JMcaf46vo0GbB4eD1x/9TG+klvf2N5BxXisyfsVzd8L7KBiS9cfRHXV5QbdGrypn5swxSBF2G1B+k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mr+gPhn2umBrlWizEFuxti+ih0t/250dZcr5FlvVxO/1pc80H3zFMO27gxJ+?=
 =?us-ascii?Q?fdBsWS22yQtmQ2dW8wqKTYMY8R1D2aq/1kM7+ONBLk/T7RWUujCAlxN7Tdyl?=
 =?us-ascii?Q?ZHh7m/T0bI/Lpb8sRPmNE+qRFi6ZuvwnVyzYnhxZkIMnbNbjaY3b9Im9jBJJ?=
 =?us-ascii?Q?HJjOsO0E33vwRNFQo1/maxxC55u+RvR5QtNm7yXY97SUX1jEYp+EL18SW+/p?=
 =?us-ascii?Q?DZb46gfFYOXrwJ1GWK4H4fIGR2/SSbnNboJPTs1Ql31MIL9yiDRFdWa4VEXW?=
 =?us-ascii?Q?j+PWcOs/3akmGg1hDah/D4IAANN6T2CDAQSgwXMdjuMpWEfDdKpQlhVLizfi?=
 =?us-ascii?Q?n/eoa41QYAj1tA1R1t3ldDrZdNHbPWfq1vhQ+JPnwTxkkapKrA+KhBkj4+7M?=
 =?us-ascii?Q?GwMTCEYh7/Ar4rZWggmSAkJDNdRfPUirGcHetMORk2Z/y0SjPvCFccCNd5tz?=
 =?us-ascii?Q?9QQjV1mmqyp5oimAX0rpMhhPmYRkjGR3EI6NHe3/fA9mvVv+roIhANdEtppX?=
 =?us-ascii?Q?MXX8+srdpSK1jVZ/7gKKnlv9f0eKki8r4oCKYeKjXWiqTtTJ9tKnMM/BELcZ?=
 =?us-ascii?Q?s4uzch1abH25+NFkqlKx5dX6rC1FgyFrtFwBVud6TbvhYdsphbeTi/6fhUVC?=
 =?us-ascii?Q?f84fLSzpjzRv6ja3jQIa+Hza5unPEs9lbczJwqxf2LXqKcRghgnOL1OYGJy9?=
 =?us-ascii?Q?X+96Vm9Beljm3HMT1e0Hunlvj4O4dMVnJEEXlHf++3HIHrlA1iiIkGuzZvaB?=
 =?us-ascii?Q?b6MnQqg79Lkbp2XFNMLzC4hBK1PJWd1n5Rw5swGdSwez4KLnvT1eIla9LHes?=
 =?us-ascii?Q?EDDRzK4k2qD/vR48zpB5v7eBGDRAzPDcwPy05qzvfwrO27/PEf53eV/bTOiH?=
 =?us-ascii?Q?aU9buE/19edSziv9a2hKvkFtMKKJtzdrDq5KbFv9t1DOxPN3oBSj5zwllrZZ?=
 =?us-ascii?Q?b+We+jn738NDtCoE8c2C2edDznKh731bW/nRXXru8c+BXkSWktogbPGRincu?=
 =?us-ascii?Q?HJ8CPy5zAMgXHOm0Z+o+4vvYMv5gXwlGOq5wxe5vRDWu85Ehx/1pTy9F1rAw?=
 =?us-ascii?Q?VkQ8lMLbRH8574QnJ9V2fPIxiVui6sWaLlicbUUtNbjyYi9jxl+XRB4kqMTA?=
 =?us-ascii?Q?a+tTRd8svnojlCEFu6koYVeZPj9AnDRUJoXBHxd/E87vBT2v85D6r8airXVy?=
 =?us-ascii?Q?yx8Lt5OL1Q+nVBhdmnLBmThbdKlzuy6bn/cfzERtfdK3xN7LS9wOJGoFeQoy?=
 =?us-ascii?Q?YydKlvRbAL8UCuU5htCj1JC/lOtU9OwJBP5uD6dGP0QRuRJjT0RCcK/GLadw?=
 =?us-ascii?Q?kle0gQQIKrWwxWiyP2oVtfU+mQPHtIWoVmE9EPsRHxipfHw+XAHUW2I64KAm?=
 =?us-ascii?Q?pOXwc9e/Ymvk8EUqOyuiqf5Uplo1oeuk0gjz54I37+QaNGo/kzWjZm5VI6TF?=
 =?us-ascii?Q?VMC/x/cls7HZvxbv/jLL2QNV6iTupzhUGwI85Dz3E0O7vQimscdr3PH6l8oo?=
 =?us-ascii?Q?KUiq5E6szWZBfDp0DQfo3ANMiJTqr8jPyKGaRHiEnhb7WUJhqikFwh/igGts?=
 =?us-ascii?Q?xNa/C9BQSKK+kYk088wtkQLSwYZVdesuhOj5CCocF18Q+0udkifkhbFPDG0I?=
 =?us-ascii?Q?OALHUkmPcz/mhQygemAxRvTLAK76amDYKMXgiL3tbEmVgGS17T37pTNVghxH?=
 =?us-ascii?Q?aNPq/Aze0Qrfk4VZ5go2gXf+JdSmqQMZ6AYPX/ZcYQZ0C/dXxYqDLwsDSwcr?=
 =?us-ascii?Q?PrlSxFqdrEoZMUZ8wAX9+at7FwyflgE=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 208b0593-77ee-4a79-47fc-08de8e2d5564
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 07:24:09.3040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rHK7TlyheyMNysIfdw5uaiF1S3JNEnm+aySbYxqhRm8E30tOhmXp3dXWnGcoykpjBBLwNPmIZjrKaXEpxlGf0V1eTiqSbrHIpVc4GAJqOo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR01MB4848
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[moxa.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[moxa.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[moxa.com:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35641-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[crescentcy.hsieh@moxa.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,moxa.com:dkim]
X-Rspamd-Queue-Id: E309B356684
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Gentle ping on this series.
Please let me know if I should revise or split anything.

Related firmware patch:
https://lore.kernel.org/all/20260324024635.349522-1-crescentcy.hsieh@moxa.com/

Thanks,
Crescent Hsieh

