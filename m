Return-Path: <linux-usb+bounces-33870-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEJxMHNvpWlXAgYAu9opvQ
	(envelope-from <linux-usb+bounces-33870-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 12:07:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EAB1D7300
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 12:07:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEF2B304743B
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2026 11:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B010F35F61A;
	Mon,  2 Mar 2026 11:04:51 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023132.outbound.protection.outlook.com [52.101.127.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C346735AC3E;
	Mon,  2 Mar 2026 11:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449491; cv=fail; b=ZKsnk1qPvvLASveQZ36Zi8kA9gDnbySTKu5ynHwXbsPsVUDiLkybux+ABQrtWsqM4u7oduQ4eQdC3VoRBrlPfI1X570dTq24TRcIXFJNe5VlR8OHdWZohxSVKODKTVf4jnF+AAidjmWRj2AI9/6F8smLO3Bu3+lSPBs33RAihGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449491; c=relaxed/simple;
	bh=qPNNPVy8+109vvzct1TCRFo1b0LctwvTY1m2P5n3Hu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0m3dPuQmBBp4GT7fTObY+7Y4e1DT/LQZJIDDWvkTDHXSPuWiqKz//kywA5bZWU/izAkI+pMMYD0Ur6ZNXMwSrVsfB6og8t5nqVLnRLtx240Dcpnpwca3H/sxlmomPh59GZQRvoazYm9SFevbHHe0tmZrjHmSpMOl7myl4xAnH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R11grtQmmn5zq6FK/ajChCIx9OggvX/v3YCJHhIym9el6nyY5OyC5Z0wvooJ5FbHQTNNox6cqG/N0hv53Dd2vaEjT7nSTp7z290ofZY08y7glWNYkCIWPdzb6SZuSg6k4PJTpVUV1/k788zlD5SUIkapvMq/l8v+XNq26vYOmIeiE+jC90jMGbIuihGN7pIZ1DtgKH4qZpcyW8EXlLE3mTo+9G1k2O2is4SaaptJt5dOivb//KDChnykuTZBf+BcChqNBjnvKxHsRuQOdsYZNxmFIAzlC75STiIJWyj4v7fHXhTb9pNTJRLSfjYSPrX9MJX2xif8MGw/oXkl6MnDXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ECIIqB/4aI8HnKatGXA4V5vZWMqKqEayEOJX/MEBBE=;
 b=Dzk9CJpnYIzuhGL0pQFExDypr1+c1+fzvJ7PL2PAZCSuTTBmVL9IZ4Xvpk/46IVJyIsAZsxiDVt4EHO8fOAoHCKNA76kUyboIfXrSPYASJSvIXXbAlCm/i+cdz3q+bR89C/d5M3Pwl8BPJwvXwnBAsmeqdcVtvrRD3EUfvKHAR1YQV+iBu0NWq1hM1wTJJUqSR3XXetk7/6EM6NYvE12eoLKk5RUGW32E4yeLwv8efNWzYph9/pIm2/ZfcqrPQKtVJCqfI/28uf2uO3IisulzhZNSbolDd+0pp7nKltthn0YHIb9JxpSJrfYi4WNOV0y7af6ImJSB77uix8OgIw4uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0012.apcprd02.prod.outlook.com (2603:1096:4:1f7::8) by
 KL1PR06MB6591.apcprd06.prod.outlook.com (2603:1096:820:f8::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.21; Mon, 2 Mar 2026 11:04:45 +0000
Received: from OSA0EPF000000CC.apcprd02.prod.outlook.com
 (2603:1096:4:1f7:cafe::28) by SI1PR02CA0012.outlook.office365.com
 (2603:1096:4:1f7::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 11:04:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CC.mail.protection.outlook.com (10.167.240.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 11:04:44 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 32E024350703;
	Mon,  2 Mar 2026 19:04:43 +0800 (CST)
Date: Mon, 2 Mar 2026 19:04:42 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Pawel Laszczak <pawell@cadence.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"rogerq@kernel.org" <rogerq@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"cix-kernel-upstream@cixtech.com" <cix-kernel-upstream@cixtech.com>
Subject: Re: [PATCH 2/2] dt-bindings: usb: cdns,usb3: Add support for USBSSP
Message-ID: <aaVuyjkVT8rJnBJf@nchen-desktop>
References: <20260302030339.324196-1-peter.chen@cixtech.com>
 <20260302030339.324196-3-peter.chen@cixtech.com>
 <PH7PR07MB9538B9EE0077B16E40097A6CDD7EA@PH7PR07MB9538.namprd07.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <PH7PR07MB9538B9EE0077B16E40097A6CDD7EA@PH7PR07MB9538.namprd07.prod.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CC:EE_|KL1PR06MB6591:EE_
X-MS-Office365-Filtering-Correlation-Id: e1bb88f4-c15a-45af-2f0d-08de784b82b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	0yO+FKPJsX1FX3XDyWSMRq+Nm2eOTHFDRrBaxnLpXv62+SkF5JHsDwAxRf6swruwhZSjPToFwpCfszLXSJmjoKwQ8Kdh9kSetmGPr1hFFyZuq3mHYLhcx4d2Ljw30iUIKGkw/FL3YF4N56z0sAyjOo6gsoja1/DtPaj0aHtCaW5FCNowAw/PaFGhJJXjX68Bc6R+Qius2YXW1NRTGRnz4COVQwQDI+ZcV2gEKFm504WsXMZt6XJXNAZTFVfnY0KW3Ux1aYT1cJZBJN8fUOHH0W7c8ESrvZp+boh81nMWEjcQboN2qUvWOkeBs5NDOGykvh/VvYX36A0rmUNQNn0E1OLHlD7H8n+v9qMSxpS+b5AFZij4uKmE7tQvUGSqZp+1sRTBMMPKtdRcqaDLsg8e4QIySRwcr1wl4K9GWaY+NXtPyLLuzrjKe7kTBtzp2vV9zsWO9TYXES6vH3Vyf1j1/Y9WCMr2qcxF9Lt2vxP+yTy2qRt5HOtVFQcpWCskryOn2fzR7dDOIk+FW5eJFyzh1+twxZHkBxYgXIhaGKDeDRwV0U50XEWOV0/hPgW9X6ZHbbmegJdYzXZA/2SrEBIwaNOymYj05/HxUjBnTCYDykZeQxBITkAE7V2zW6pozqKATLjKPnhAYHk9dsEQonbQ+2r6nCFQJbPZbDa3Tf+KqG11x0ut2mk5WY+oy7zgoY5CsxaAXRMTHjv0ch6eKgGoxmAVFta1mWwTQmsMV7i9zorhtm7xKXNxAq8oqEYgid2Rzo8BW8lVCZbDvcJY+ouHmZazMXrNN7rCMsqucJlW2P3nH8welgwO8qp63NJh+jyP9MCqdq4o8exLs3Od1bVHpw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	D8S3yXaUm4Kky1oUQpbWfZYnGYVIV/1lLtB4bojfSCZAnJL4EhF89ZUJnQpzl10L00cqclBa6j7KYUmjC3zXNiiIU1K0iHJOZEx18klMxNYWY51AZHYg9mdwKdYgqxbGIR4DgCmSHwH+f2ZEYZ+K8iTPpSg09VOfLTSLnnH9NS8+59Fxi2ZMWq9fCMJ8Ck+Wt1bPrTETtj3WXr/GHFztOQi9Mei96COxXbtI3jgbA/pm95GXTw2w6xmr3h2Hkk5ZGkJNOR/WnjRjaF+fC1CSzHBi51ZjzTRx0NdoImtfJMpkEuC/vaKQLzaTnNMvh64yXUJntiFAhdE1ydkLo1FdFHFfsmzfsTevD68Z01RC9Y3oRHYHdLEN690xG9jWKhgAim9QAuOXjtdj3HAka17qTcPjntEN88Am6RC2It0c6vBIbtlTBJHMwaX+IXIQ//pg
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 11:04:44.1610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1bb88f4-c15a-45af-2f0d-08de784b82b1
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CC.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6591
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_FROM(0.00)[bounces-33870-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[cixtech.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@cixtech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.926];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 28EAB1D7300
X-Rspamd-Action: no action

On 26-03-02 09:03:25, Pawel Laszczak wrote:
> EXTERNAL EMAIL
> 
> Hi Peter,
> 
> >
> >The USBSSP is the next-generation Cadence USB controller IP. It adds SuperSpeed
> >Plus (USB 3.1 gen2x1, 10 Gbps) support and uses an XHCI-based device
> >controller. The register layout and resource model (otg/xhci/dev memory
> >regions; host/peripheral/otg interrupts) are identical to the USBSS, so both
> >controllers share the same binding and the same platform driver (cdns3-plat.c).
> >
> 
> Include the change for the wakeup interrupt in the next version.
> Unlike the legacy USBSS, the USBSSP IP handles device-mode wakeup events
> natively through the xHCI-based Event Ring via TRBs, rather than using a
> dedicated sideband interrupt line. This integration aligns the wakeup mechanism
> with the standard xHCI event processing, making the separate "wakeup"
> interrupt property unnecessary for this variant.
> 

Thanks for your suggestion. This "wakeup" interrupt is not related to
controller, it is the glue layer logic that detecting dp/dm/id/vbus or
rx changes.

-- 

Best regards,
Peter

