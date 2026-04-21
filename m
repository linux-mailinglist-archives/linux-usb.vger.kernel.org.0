Return-Path: <linux-usb+bounces-36377-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UG1bNf4Y52nT3wEAu9opvQ
	(envelope-from <linux-usb+bounces-36377-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 08:28:14 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A49F436EF1
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 08:28:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4860930329B8
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 06:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A30B38551B;
	Tue, 21 Apr 2026 06:24:19 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023121.outbound.protection.outlook.com [52.101.127.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B2114BF97;
	Tue, 21 Apr 2026 06:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776752659; cv=fail; b=TlPKvG3E9XCst+aLCDZyEF6htNBaN83Qv55dv2A3dvRrzhVKZ5yRUGdzHZiUiBQRUoQxc73rQAnXrheeg4FbxghAXRA0uhsdu+n9qihDbFcJP2isf1NCgjPxaKNgl/gXFaMI40YKnEz81DnaAOE+q8QUNvGYm8oi3tHy1AjcM9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776752659; c=relaxed/simple;
	bh=2pqdp2YGm+HN51PF5RNC1EpwYkaQ4i8qKpTFKe6n8RE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=juvIaSlsnPmXl/733GbiaCSF5suwL4XAlNKssdL+G78iHLVQQkHfE0WAYJi3OrvLO+HWTUtrW8GtNujh5uLnEJEXYjjy1IrWD7ewe1G9MyGzS3hyoRoRX1ZTnYhMWhehVsG0TwFnJHtrqsJ6iXHVKGXVMBAzg4/FgGTKgCRzpxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y03OgOv/LzBcXWDlFTY3OUu1rXuWiiMW71twmi4uTiwl+w2cT2sr1bHtYgcEZ7AK2bCAMXyc0fk5brEbyOVI7XkuWKBR5kPJi1ZLN1tn39l9zBQmG7GDoEi+U9LFBAbequWDjy3Ux3gUKuWCq0dRCTetQ9+M9IatDGsOR0ZXbYbA7vHp/pxmkT+Ibc/g2s8Bgfqgi2mWSBHUF5yg8wdHL3noMsJwjrZUMM60A8T8mMzEQBcY6z8BYkhl24SLCANVrsduxTjuK6ayOlE++X2ZG5QnnmjtKA7c/W4rr9E4nqHihMHVG+W/PoqJXEWmYWaKtlxJn6EtbQ8mLOo/icCKsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndkaNkeNpYk4ZBnegT/79anoT+g2F94c2UerE+LttiA=;
 b=ABAP3eQzoY017MUUu62C1y5pVjEKXCg4qcMDXIWJYHYoffjoBX6FQKtBQgMvsP7ZfntHU0FpIvVHHk/ePdPcE2oglaAtgseusr3Sd9ha5ALZ7BDfGVIOoveTnkU8fq0g6q6kL/T/hiKREe79bt1ohvqiv81fEmit3GHpxeqyTvB846Do6XjCstvzOFwWnuiQkE5/qLdK39MIswIcbAHAg9X2mny2R2hNYAOFrQC4ICE2ZRDohJYcwwQn59kcgw2PTxXvQiRqwQiK8KrbJ5SXQphHcOvc1QF6qSlPFMeHLwfTVcRzSPvHVK/4FMzCymgRR9WjSKm+mJsCs6oSGaVhvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::21) by SI3PR06MB8611.apcprd06.prod.outlook.com
 (2603:1096:4:2a9::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 06:24:12 +0000
Received: from SG2PEPF000B66CF.apcprd03.prod.outlook.com
 (2603:1096:4:191:cafe::d3) by SI2PR01CA0002.outlook.office365.com
 (2603:1096:4:191::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 06:24:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CF.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Tue, 21 Apr 2026 06:24:12 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 0DF38446DB61;
	Tue, 21 Apr 2026 14:24:10 +0800 (CST)
Date: Tue, 21 Apr 2026 14:24:06 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh@kernel.org>, krzk+dt@kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v3 2/2] usb: cdns3: Add USBSSP platform driver support
Message-ID: <aecYBkkNTTOhaL8S@nchen-desktop>
References: <20260421023459.506145-1-peter.chen@cixtech.com>
 <20260421023459.506145-3-peter.chen@cixtech.com>
 <f21d5bab-c79d-4b7d-8aa4-e8188ee11aa8@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f21d5bab-c79d-4b7d-8aa4-e8188ee11aa8@app.fastmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CF:EE_|SI3PR06MB8611:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e97b180-f4d3-4286-067f-08de9f6e9ad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|7416014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Gha7DhZAhibz3L0aMSRy3gJrAW7y9MZ10w2g4lB6kYVJwhNyDTasDhaLhuYpd9euk6kr9BMiwdz8VAidQ5dmB/Vq2vgSGBp4bzUd8SPGiTVDJjT2JHsw8brHfEo5lJ4cyAxiT8H5PmziVHxjXyTH8smi8073Z7uc4fzQQ4e/GTe8Ovs+Y3aiAKKYXK1gCknS9CrSE4BNF6lqTiH3+UhP8z98uWpJ1kaUf7jVmtL3h1ISRp9WZmbDdFmW5bemsvikjPmHo+debW0OEexYGFcLm0cjVf7/WT4iVIhYbdhOCeMvexrx2RrXh5GaqgdVzO2AIwkqX6L2q121UdMBXkAXxhcFONzAetgCtl7MO/JURnnV71uZU67Va4kjjjYmzINId8MG7vDIt9h8dkUS4nGyTcI4y6OZYpcOF+AcfLkyYi5X+etmReykL1gWI3433DKhgMpYgaNhwKK4O5sZd3E2J/XxiUzl+3h+lGwI1/Bt5wGATgg4zNIc66txsKCnKu7TRcgdVRDC9RQNJ6uC0PjyWprCtNt3eVme7/J0tmEQ2hCIbnGKqSEPl0ftozYku9AaQ06DbZH54YMHr74mzfLGvU9l+h4bQlfmIkJ9h8usUAJQ+iW6JfnrTbJBgL8CNaK5Ty6epLauh4gGHnoFidkT65A1EXQEJy9JwxodyIzld+Bey6XCoak34gatQk6AxfjPRQMTi3aodQS8TtpuF3SkV7UwBSEoQPnkrQSZr13pyoTmjxS+/AK0Q+ad+M6oHMSkp4Odkgd90XYLr3rzd+usqw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(7416014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uXrh5MVkqrzrc8EqYHv0XhMA96pQ8/6ARKfE6nDcot9W2WBPTuX3K57/i5jobRIMvX+kwZqzzEsLz1qkEtZxWnk6iJdFkU8yHe8fnIQ5No5eFcJKHYe9fZz6bw7Zkw5hIx5UIMKuWHM1YLtqA9X9qu++MfV9SK45vsmhd4LvDm2oQQ14rY+gFgt/OM18DpI7MyjLsyTtZ7CFgqPVeuaUbG4HtE+/oIIxXShMCFCoqthB9cSosRSW5kvnp82iGU2cPyAobBnfxhu/KPaPdMnGKHAZnLpuo3fD1L5vtds+zCkqbNsbCRbCeU+BTz/nxCgcH72ggAmDPZc1rS6mMWRm/bwQgXusJTfRucgGLWVsmGu5vMOHyguD6KeO9uxNTPI09vfwSIs9RnONABFL2Ud3mhZuqFwF19xH8i8SykFknLUP1wh4BBSBYqI5S9tNwcE6
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 06:24:12.3876
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e97b180-f4d3-4286-067f-08de9f6e9ad0
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CF.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI3PR06MB8611
X-Spamd-Result: default: False [2.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36377-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arndb.de:email,cixtech.com:email]
X-Rspamd-Queue-Id: 6A49F436EF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-04-21 07:57:25, Arnd Bergmann wrote:
> > drivers/usb/Makefile: descend into drivers/usb/cdns3/ only when
> > CONFIG_USB_CDNS_SUPPORT is enabled.
> >
> > Assisted-by: Cursor:claude-4.6-opus
> > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> 
> This looks fine to me,
> 
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> 
> I've added the patch to my randconfig build setup now, to see if there
> are any corner cases left that I have missed where it may still
> get into a build time failure and will let you know if I find any.
> 

Thanks, Arnd.

-- 

Best regards,
Peter

