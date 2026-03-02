Return-Path: <linux-usb+bounces-33861-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IG9An1ZpWlp+AUAu9opvQ
	(envelope-from <linux-usb+bounces-33861-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 10:33:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A57841D59BE
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 10:33:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 69E533012D2B
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2026 09:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F4438F631;
	Mon,  2 Mar 2026 09:33:45 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023111.outbound.protection.outlook.com [40.107.44.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8EB30F934;
	Mon,  2 Mar 2026 09:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772444025; cv=fail; b=WmpKRUZ2PxfVlQ3MyB/+OtNLxMR2QvTk5qQyu+J4fQCtdPTRpYV4MV42Pgf/LO6ym71e6bZHZHxV1TfVs3RYLVKpK3V6c0SU5Vcoc5XB4vPst2y2stK8+xhCIH4IwkenXe2AWUFJ4PkZjGDhPZLBEsWLeu+WYYuQTop2L5bqXn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772444025; c=relaxed/simple;
	bh=pEg2Xa6QYACYazz6zVfstMsmwt7m3+DRt9+LEDIYnmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R0U8a4G3wQeYvoEbtwnE2aUopoofspLl/kR0FSJ8LWs7UrE6E2o1mZs8r9KfCzzh7Dt269BywavyJOPWaafwPWN27XITquqk/NqbCxVWzWiDR/gKh/7LoK+3suuMG15/CNl4dkF7ECSp6DGWEGNdxBAw2RQl2cpCOrVdf7m5SSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTI8KUfk2R2EwXYTeZ2p0VCYwXOxIR8CuQ0yJGdMoU9fFBgHFzS0I10BczLUHBEXxYC5OHzHr7msR+N+NcaLspNpwib+g4zmMMoIdCMe0oCtq5831oryiHLaWQHTqoR/yCTKBqnYkzvg8kriTCdSvsZotHC/ttjRh80p/rFPoTWDXetTOU4IWBud3eIhfVIsegUU8127Ks8HLnOPli/c6giiIqA/4LVZkUahFVrQhV4Xi+WQ2LqOneqUw1hoWVGACCQkpHPSxEMrZXioysWDRSoAOjfAU4q72NBNte+ZPxvqHKD1CvHQwr/baa6D5xhPmuUP9h114KGCdo8S4CwufQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbNfaXl3UJ3FaocfhPcPv5IBPHgF6yC9A03oIQjcHHY=;
 b=dRUKvhYdsRGY+eQaIwFaqAvuIAFA5rUnpDYpM2DSmZmusVVsI6huL+rAlXS9sWiUM2VnBgmkTMX4rcI2sR/20ElBDCk0qp2+7dWU8CKgBpS/T2TZ668rPyKHLsdcnAw0MsbQwcksni/FPRB/4JksL46Zh+Fed9SL0Xd6Fk88d5L+YjsPUPAIS7VTNfYCEjmgfC3shrQCi05L2yJLGEb67pIa/rfld7WFG0xzNWw45i9IvMvFYBNwp9rPvHJSgwSWwUf3xcPdJe5WgRGUtUufEB7bZdrntT88aa8yZxbZplZ8OzgCCLOBO5Eu+6ZL4fdl1hgUxkmp6NROnAcmKtlqFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SE2P216CA0150.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2c1::11)
 by KU2PPFD98FF5817.apcprd06.prod.outlook.com (2603:1096:d18::4af) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 09:33:40 +0000
Received: from TY2PEPF0000AB84.apcprd03.prod.outlook.com
 (2603:1096:101:2c1:cafe::c5) by SE2P216CA0150.outlook.office365.com
 (2603:1096:101:2c1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 09:33:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB84.mail.protection.outlook.com (10.167.253.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 09:33:38 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E9C7540A5BD7;
	Mon,  2 Mar 2026 17:33:37 +0800 (CST)
Date: Mon, 2 Mar 2026 17:33:36 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	gregkh@linuxfoundation.org, pawell@cadence.com, rogerq@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH 2/2] dt-bindings: usb: cdns,usb3: Add support for USBSSP
Message-ID: <aaVZcICRDPceoIot@nchen-desktop>
References: <20260302030339.324196-1-peter.chen@cixtech.com>
 <20260302030339.324196-3-peter.chen@cixtech.com>
 <20260302-sly-shrewd-wasp-fbda1d@quoll>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302-sly-shrewd-wasp-fbda1d@quoll>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB84:EE_|KU2PPFD98FF5817:EE_
X-MS-Office365-Filtering-Correlation-Id: a1b76c92-a8c0-4c38-da09-08de783ec908
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	U4Eyzk7pXYg3sTKZdqxRbDRxIb/GJJ22tvogYr8tUljXQShCYaw+hZenK/NYVBpo7tsH+zCs02dEQja5hstdE2o8Ps5he/+/fyKEffbNfO2ky/nkROR3PwBfh5T+n2br6ncVG8wWwtWSIDxT1md3H/+aqu1rolszVP8n0zW/pBQP+lOFMBc8DaMDbi6rqm4R0aQRxhdYiVbkukGesnXxMW+F5fkE2I/WVcrxnK4vxwoxZ/PHRA4F5MYlDvCFVHnScFyZzhJaSmByu55Ck+8+Yg3qp0mmXmOBg6RVBPivlVs6ddVMRt/YaMd6e3IWXRd6AfsCGvZodFS+q482h95l1O1BxN3hlPH8/YaIKi3fkPAzVH4JbgFmsgDZSQ0ryCCw6AGlecArXMqqtvi7BRGUVjYV7ODk6SnDHHyiuovBEmpc+Q9DB3InFDvlLsXDVW2+y5mHYg8u9R2aF2XiTJVeQbqu8cIVrcvDg+EyDhXZIrJD/8PBvckcEh3Zg42f7GncI8ODHMMprpd6CsakFOxwOxKf+DEd7wjEFCao5tBBRnTfb37smIdbLvshXxdyQQC8t9USOJlsxzdGf6+uZX5z8CDsD5rCEIis+fY4JOV2KUsAPzNS80MgurkKh/AAcAGWAScitBi4/nonoLowiAiYvI8LV7h/Le6h9I0PE+/p5MyrYS5ih3IZa1FxF9d+8/nCVFqRYLakb2FNnyMCCKp1D5CqR88MDIoXqYCiSHsV32OZ3JPgbYcENLmBbtCeFQgw/9aWUKOGruhXHfONzacTkGQcCpR1q6HE0L8NrKyqNMJBS+Tl5hu6+cin9ty2hVZQZgdfcj/KniB5iEYKbqa7yw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	47nL+U9+hAFPllDlux0wrkUoEt/9Uu6jQIcPV1h9WOJjiYXmOPVk4czu9SlodpQa6fAsCA/KbJ+/ZjUy/ia/3kO609nIBkBelctTp+yTvS06UUhoMDCXfTBmDBIgPluz83QF2Ph6C0BLoUE0dUwNQytrrm77tGCJnJrzRPet1hIPReo8739wIKhmIVd+VQ1vqa1UhKwc3KsvgvJqGS1c7lGNFp0LhhMj0eLQUMmpUkTfljQO7ebZddH02MJjFr0we1BzEd1bL1c7o/X1FKhM+pas/NkpU203cb6Ln41J6sXcraxSWF1sYhFMXTAgOS480hSX3c2++TKaLvDbqKJx7xeezQTsZDwjfY2kQGeCWM4egN9zDvLb/MoeFh9mEZvkmV1m3ceFvd2PMdjAbFP9zcgfg3OgR7YLjDmNk8+mEgMLqG0YRfcbytOdr++GG6Zh
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 09:33:38.7226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b76c92-a8c0-4c38-da09-08de783ec908
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB84.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPFD98FF5817
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33861-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	DMARC_NA(0.00)[cixtech.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@cixtech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.925];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A57841D59BE
X-Rspamd-Action: no action

On 26-03-02 08:29:40, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL
> 
> On Mon, Mar 02, 2026 at 11:03:34AM +0800, Peter Chen wrote:
> > Extend the Cadence USBSS DRD binding to also cover the USBSSP
> > controller by adding "cdns,usbssp" to the compatible enum.
> 
> So here you explan what you did
> 
> >
> > The USBSSP is the next-generation Cadence USB controller IP. It adds
> > SuperSpeed Plus (USB 3.1 gen2x1, 10 Gbps) support and uses an
> > XHCI-based device controller. The register layout and resource model
> > (otg/xhci/dev memory regions; host/peripheral/otg interrupts) are
> > identical to the USBSS, so both controllers share the same binding
> 
> Heh, identical but completely incompatible. If you are using Claude then
> at least read its feedback - what does it say when devices are 100%
> compatible?

You are right, that was a contradictory statement. I have added both
the same and differences at the last reply. I will rewrite the description
to be accurate.

> 
> > and the same platform driver (cdns3-plat.c).
> >
> > Changes to the binding:
> 
> And here. How many times more?
> 
> > - compatible: const -> enum with cdns,usb3 and cdns,usbssp
> > - maximum-speed: add super-speed-plus
> > - Add USBSSP example
> 
> Pointless. Explain WHY are you doing this, why do we even want this
> generic compatible, not paste here Claude microslop output.
> 

Fair point. Will rewrite the commit message for v2 to focus on WHY.
Thanks for the review.

-- 

Best regards,
Peter

