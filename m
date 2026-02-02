Return-Path: <linux-usb+bounces-33003-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLstN9KjgGkgAAMAu9opvQ
	(envelope-from <linux-usb+bounces-33003-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 14:17:06 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 514C2CCA52
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 14:17:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0560730292C3
	for <lists+linux-usb@lfdr.de>; Mon,  2 Feb 2026 13:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABAA8367F2D;
	Mon,  2 Feb 2026 13:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="rXMfshOX"
X-Original-To: linux-usb@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11022125.outbound.protection.outlook.com [52.101.43.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41FC36683C;
	Mon,  2 Feb 2026 13:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770038218; cv=fail; b=mBxzqUGnCd8lgNRN9bUKC4J6chkPk0+N2TKlpTBDN0sdTU/rbf7iUu0TGODzgZWN6kcQrwITnwTxqv49djdHRZEYc3Y7DZdeYbiEZqgyBDxqos8UKn6fK+7jpRgQgW2TAQ54yxiwrtjWKAQ7/DBu4MOKpTVdrJHfn5IYRYSYOpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770038218; c=relaxed/simple;
	bh=i/vX6FTbEKgepWdxm4LiHJfG0DkQt3iPnVLC3/cNqPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UxbHmdkik7k70DDRbd7hVkUnTDS1YBRbmB7cVtZR4lSQfnSOqzoaPUhYfuLT4ebtBdd1uVla31g00KqHiq6FmpvR1nhifIkPcYoRh2CgNxY0uColSP2v/Hsio1OlssRe6Yy8ANIGzQu5iukPCP8HIbZd6ZDQczol6rty0Nc9M6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=rXMfshOX; arc=fail smtp.client-ip=52.101.43.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWVbQG2CZVQ9gBcjRmXLmfn4G36CBiFanlq8jWScgjPglKj4A2h5n2yDnq2JOSVyfpLM5RmKpdDuy0jV98i3cbnOi8ImAu+ZfQZnyl16JNRUwqv5fieASyfLgxiIj7vnUwJHmPASAoI+xKY0sB1n4+6cDSXWK1wXXdnpPCZ4hiaaQFWduIR+QNZ49w4Lo+toVymndsHjmVAuIhBq0sZAK6wG3L85fpFNoXz59fqrOA+Mm+KcQRXQrV6hqYPFP74TbaBhIVpJD00xsdtmDayX8b92JnEU7Fb7dr+hiFZj1n74GiqxUCNIv4dsncMxFELB9opk4Opp1f7j5MNeS9mKBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=doqVh+Zf3G+zZHM8G6ncXFd6FUzWtFUN22Z6fC3EDOU=;
 b=Y+TkswEvrvEnMoJrezcQNMcktC6SlhyfNzZtk3E8ww3zAyZ5V4o4p4EJc2IyOp3eQCcZVq95aiRxW3Z0HVF52M7ZCdR+7KzzsKB4wSeo/VQDUu/mbDJRoT46mlN46c/+S6zQEA8+xcLDJnNcgpOhd/gW5czSh90nVEPuRJMZzGUIZfZMlu+5va941aR0WxF7IMJal1d44r7q+aTVPyiym9ujtrrH7nAbnir0X2dwQs3nI5FgtFFhsmclVYcYudMkrrUUlWKpX0A/k55vhlnaxAkcL75rXn+aNFBZr7i+Ix3JTyttpgN7KA8TGr5FRHi3cbo6rsCHFYnejUqgBjU/Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 4.227.125.105) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doqVh+Zf3G+zZHM8G6ncXFd6FUzWtFUN22Z6fC3EDOU=;
 b=rXMfshOXHyI641a+pJhijMLr4l3d3Mo2BpUH+iHCMOrFwayr9CzvBGJbr/mk06grwLmyNmQmHR++8WbLt0ymvZJ+qI6pmJqZd95XHRSSx0IsS7pRPdhkOycDr0D04nXjauVM38gMRGP+apYBlM3NRINHuRfl2rdsNnwO7/3NK9YMh+khbQfu+2E1cNynGMlLgQ4HcvKXzrUuOb9vQRW2xw+Mp2ma1rfjaamt67OZKsRL7/haoHeRaZfaTy/SvxFg36pDTLQHtwTHgpfVe7OH9RqMgQgAG9ZkhOOqrQuP0Y92O/LJsn+orJCD0PXWNBbvNVWJMliBuXSBP0rIYBff+A==
Received: from SJ0PR13CA0215.namprd13.prod.outlook.com (2603:10b6:a03:2c1::10)
 by CO6PR18MB3857.namprd18.prod.outlook.com (2603:10b6:5:347::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Mon, 2 Feb
 2026 13:16:53 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::da) by SJ0PR13CA0215.outlook.office365.com
 (2603:10b6:a03:2c1::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Mon,
 2 Feb 2026 13:16:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.227.125.105)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 4.227.125.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.227.125.105; helo=[127.0.0.1];
Received: from [127.0.0.1] (4.227.125.105) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Mon, 2 Feb 2026 13:16:52 +0000
From: Vladimir Moravcevic <vmoravcevic@axiado.com>
Date: Mon, 02 Feb 2026 05:16:28 -0800
Subject: [PATCH 1/3] dt-bindings: usb: axiado,ax3000-udc: Add Axiado UDC
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-axiado-ax3000-usb-device-controller-v1-1-45ce0a8b014f@axiado.com>
References: <20260202-axiado-ax3000-usb-device-controller-v1-0-45ce0a8b014f@axiado.com>
In-Reply-To: <20260202-axiado-ax3000-usb-device-controller-v1-0-45ce0a8b014f@axiado.com>
To: Krutik Shah <krutikshah@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Vladimir Moravcevic <vmoravcevic@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770038210; l=2667;
 i=vmoravcevic@axiado.com; s=20250904; h=from:subject:message-id;
 bh=i/vX6FTbEKgepWdxm4LiHJfG0DkQt3iPnVLC3/cNqPw=;
 b=vF6FfSX8env/lDCGtxNyJBdffahWNmX/u4UX771IYEqokiEsgnDqNOFBZrHg4rLda3nC84lp9
 z0Aray+mk5lDl38dRTk62U49oHrC6sxuRg6LGnxIUPMWPxaUyGI98RV
X-Developer-Key: i=vmoravcevic@axiado.com; a=ed25519;
 pk=iiyhWhM1F4HlCbbW3I3qKZhPCE8JsCrDQMgCBRg4YMA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|CO6PR18MB3857:EE_
X-MS-Office365-Filtering-Correlation-Id: d2bf995c-436f-4632-f69b-08de625d54f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blRlOEJON2l3Y0VxcHN5alNWdFRiSUpPaDhmV0ZrM2ZhSTRJcjVQMVJFd0ZN?=
 =?utf-8?B?UmNIL1NBMkNKSFA0VDZoMlFJMGZNOHhRZDlDcWE5V3FvWjJZVWg5ZXpJZGJV?=
 =?utf-8?B?SWdwMGhGRkhmdjQyemZqUWdjRWI3L3k0RXhqcUFoM29aU1FCRm1WaEs2b1JJ?=
 =?utf-8?B?OXBheXFwY09rRk9yVTZaMjdLUHVVblhMdWJidHU5TDZ4VHE5M0FKMW9OTFgy?=
 =?utf-8?B?Y1UyeHBxdjlwREtuMVNkbFN1aTM4M1NOaDlsYW1PQTc0RkRxSjM0cHNYaFVJ?=
 =?utf-8?B?MDZGOHZCdTNuRElwQ0ZGdWFjdTVKM0JCVTNDcWc4ME5ZYjJabXcyODdVR012?=
 =?utf-8?B?ZU5NN0xZTGt4TjdvdmxtdHhISDBxZjlYL3BoeHd2U3hDaWI1ZXk5YVVJRDNQ?=
 =?utf-8?B?ODA3VThsVENUbEVGWHNwcllzUkVhK3pLU05YTmNxdWxCZEo3M1pxRzVZQlM1?=
 =?utf-8?B?WCtyS1RHYnhpa0trMXpHMXpHaytJMlF1UFhIRXpCNURWV3JZeDE3b3AxT3p3?=
 =?utf-8?B?RTFPakFxcTg3TlNjd1NtODBHQnRQSUtVaTE2OVdML1I1YXhKM2ZoeTJCN0lu?=
 =?utf-8?B?Mi8vdlZnWFo4OU1ZbFNESWpnaTNZRTA3YzkzUG5ORHp6SXpINnRpeE9SNG1X?=
 =?utf-8?B?UVFScGhOS2RBUnBJMGx2cnIrL3NKUGpQanRTaDFBNC9EMTM5QjBEK2NOdEN0?=
 =?utf-8?B?NWM1cWZwU3JZd2hrczd4WGthYzZKeUFrM211cnNhaEExRDNPaXQxYVoyTHBt?=
 =?utf-8?B?Zzl4ZlpoeW1nQ2N4U1o0QTlmbFgzbVJyLzVNQXU1cDIwTHlJU3prRkE0S0hR?=
 =?utf-8?B?WlRyc1FsYWpsNEwxNCtCNjk1SWZkbkJHKzdnN3ZxU2xhcVhFbXcxdDErZFFY?=
 =?utf-8?B?eHdWTC80MDBuSHpqMDR6V3B3TUdOWDJFNEJzQWRaREZhcDBpRlJFaDJGdXo1?=
 =?utf-8?B?RXRXSWp2M0NSSjRyRkc4MFpLYjB0NFJ4QktIZFZsd1V6WnJTYmNBQmMrUEgw?=
 =?utf-8?B?bDJ3VTExOHphOHF1ZG51dGlvWW5KVDdwUXRwem1hbWE4MDZEZEt1YndBTEZ4?=
 =?utf-8?B?RGFRaklXc2tnaEpTN1lwZ3RkS3plclNxTGExdURsSWtFMzBPaEFSRUU5Nnhh?=
 =?utf-8?B?ZGQ3eFdBUTVUZCtOSWtaSHBXTmxrbERsNVJGQTQwNGZQaVdwOG1oaHlqdW5S?=
 =?utf-8?B?S2dCTHNoWWdJZ0FrVStxa1IrRngrQkp0UXYxSnF2TjdGc0d2TzVGVGJ4Rzlo?=
 =?utf-8?B?VEZ0OE9wa2EySXRpQjdGdWJvcFZxWFNySFZ2MXk0d094S2R6N20zTStvMzJz?=
 =?utf-8?B?NUE3UjV1TE8zQlVSS21yNkRQWEJobldiT3JxNkFUV1lWQWtJVkpBNXkxelVL?=
 =?utf-8?B?cHhMK1J0dGZVSHova0tFUFRvVGhlSXIvZzhaSXFOejhWd3pxbGZnQTRCWUZT?=
 =?utf-8?B?MzREWmNUUEtYMkIyalRyNlZyaGJzNzdUcmk0ZEFTeXB1VDlTcWFRN0NuekRW?=
 =?utf-8?B?NytUaC8rQlU3UmxaYmtUQWlwRVJ6eExaK2h0MDI1MWZTKzhtVlBHVFpMM3dL?=
 =?utf-8?B?TFFMNDgwSExQdC8yQ0Y4OTlhaVB0cVRsbWl2bHlTNVMzMkkvWlZZeXVicy9P?=
 =?utf-8?B?dEN2bWZWdGRBR0N0UGZicmhzbHhnb1ZPODlaT01VTlhZRlliSGRHbHF5SnVH?=
 =?utf-8?B?WXU1WDBJSENEaDkzd1ZPdzk1ZGp1eTVQS0U4bWxtNVVETi93ZmhpWHBXcUxX?=
 =?utf-8?B?dkwyK0FYRWxxYlpPTk1rdmVCZHpXQ1c4SVp1TmNZVFZJWFdoM2ZEVitwaWh1?=
 =?utf-8?B?aXVIeUxsV25UOHAvanIxWStHMHo4eVdQb1hyLy9pc0FSejhxVWlXMTVaUlIy?=
 =?utf-8?B?Q2I0cTFSMDk5anBZNkY2dVI2QjVvaW1ZeVFrbGE1U2dVa3pFanlWcDQ5OWN4?=
 =?utf-8?B?SkNTZjFjbkFOb0djdnB5WkZhR1RtM0QvZEFGTXVOb0NBWHl3M2dGZUo0cHNV?=
 =?utf-8?B?M200dHpFaFB0bmR3ZFZaelJMM3g0RFJZcHNNYkowM3pWZVUrSkJTS3I1YThL?=
 =?utf-8?B?cStNM1dYTEIwem1EdStlM0hDNHlEbk0xc2huVDNZaFpNRWMzR1dySDlsWTdM?=
 =?utf-8?B?cE1La2YxUm8zdTgxYXZZQ29kNkQybVZmTTIyVE1RSXhnODdSWG5iOVpSRm9F?=
 =?utf-8?B?NXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:4.227.125.105;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fEpT+zpnvMM2hMwO7b91NUW29kURSJgF7ax6WQfYQhB+FwKTzCgvCG8D2IAqpcRV8gAsxjQ8Eux26tWN+2b3dfLLC7LZc3BcH/UHcASzT6DOZJ+W8us0D31Op1byyCFgSsIqSTTcuMiL6eaK+3yLJZHPs3WojbQeALZn5v2uJU9bOFOW9sdTn9Ga93/0jlzhk1qEGHybuLUR+6znyE1xr5f722Wx+1ZFdTOAUhUI6pZG0NkPnh1FuJCnUEcZ1qMcg+3H6VKBEdsluhDehMQq+FM4QhHtEfDmPs23Is9Sl5/S2nMUAepjjWLHiPZsDy3fAAjb82lUP3gdu5mjFFVA4ngS1p2DbAQFuMSFLmhGYz8obQTJ50/g6mwu8zQblB5oK8o5oeaOjxP2N0qU5zkxjA99lDtJv0Q5e83V93g9cceYLPYRKk4YOWKu8dCup2m7
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 13:16:52.5025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2bf995c-436f-4632-f69b-08de625d54f5
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[4.227.125.105];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR18MB3857
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[axiado.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[axiado.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-33003-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vmoravcevic@axiado.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[axiado.com:+];
	DBL_PROHIBIT(0.00)[4.215.3.128:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,axiado.com:email,axiado.com:dkim,axiado.com:mid]
X-Rspamd-Queue-Id: 514C2CCA52
X-Rspamd-Action: no action

Add Axiado ax3000-udc (for USB v2.0 ports) and
ax3000-udc-gen3 (for USB v3.0 ports)
compatible string for AX3000 SoC.

Co-developed-by: Krutik Shah <krutikshah@axiado.com>
Signed-off-by: Krutik Shah <krutikshah@axiado.com>
Co-developed-by: Prasad Bolisetty <pbolisetty@axiado.com>
Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
Signed-off-by: Vladimir Moravcevic <vmoravcevic@axiado.com>
---
 .../devicetree/bindings/usb/axiado,ax3000-udc.yaml | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml b/Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
new file mode 100644
index 000000000000..15658b5c924f
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/axiado,ax3000-udc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado AX3000 USB Device Controller (Corigine-based)
+
+maintainers:
+  - Krutik Shah <krutikshah@axiado.com>
+  - Prasad Bolisetty <pbolisetty@axiado.com>
+  - Vladimir Moravcevic <vmoravcevic@axiado.com>
+
+description: |
+  Axiado AX3000 USB Device Controller (UDC) is used on
+  AX3000 SoCs and evaluation boards. This controller is based on a
+  Corigine USB IP core and provides SuperSpeed (5 Gb/s), High-Speed
+  (480 Mb/s). It supports control, bulk, interrupt, and isochronous
+  transfer types across multiple configurable endpoints. The node
+  describes the memory-mapped register region, interrupt line, and
+  other required properties for the UDC hardware.
+
+properties:
+  compatible:
+    enum:
+      - axiado,ax3000-udc         # AX3000 UDC (USB 2.0/High-Speed)
+      - axiado,ax3000-udc-gen3    # AX3000 UDC (USB 3.0/SuperSpeed)
+
+  reg:
+    maxItems: 1
+    description: Base address and size of the UDC register space.
+
+  interrupts:
+    maxItems: 1
+    description: Interrupt line for the UDC.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        usb@81200000 {
+            compatible = "axiado,ax3000-udc";
+            reg = <0x0 0x81200000 0x0 0x00100000>;
+            interrupt-parent = <&gic500>;
+            interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };

-- 
2.34.1


