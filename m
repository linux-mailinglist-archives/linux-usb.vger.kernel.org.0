Return-Path: <linux-usb+bounces-33871-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCF+GwFvpWlXAgYAu9opvQ
	(envelope-from <linux-usb+bounces-33871-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 12:05:37 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 152051D72AC
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 12:05:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7D94F300D4FB
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2026 11:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84D235FF5B;
	Mon,  2 Mar 2026 11:05:34 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022130.outbound.protection.outlook.com [40.107.75.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55726430BB8;
	Mon,  2 Mar 2026 11:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449534; cv=fail; b=CXzIpVwULsiHlUKB6IiVNAKZq75Xc00B9/gfF/Hgu+vr1NVQ/fdfpjRHDRYiL0CjCgpQcb/6bVYeg1+FVnvTAcW779Iy+r78xRnm9FdACj9lpz8/MtLnojkIv61C5PqooicQzidckIzVn1tHk+tF7kfoyg8wYakS8/NVcpDQfQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449534; c=relaxed/simple;
	bh=Vf75qTS4WOAjIkXEl2Gr/uv1KFEv9+e+4TQfM9BfZoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dRKYk0nUhsWsOIbNmtDDvHrFrf1agiHxOiz1dr+oEf3zLUwyk1WQwShrS5pgIq9xOqi+QL8GezPyFcY3j52Ene/elqq4c3W+UBaeRWdXfx3gZyvjgnSIj0A6JXEooFiNLy1FF7zxvILu6dYSRfVlc/TxEHucJ9x5a2R6xfKv13c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w2KZmrWaeIjITQzMpRcFcYMiIs1dZNRsk/bQtHUgcZBsSltsQZD30LRkj3CFlnM+GDyVKi5MmzUlP5ngTqhFj/mI9woaOD97MiUr5X50rcbVHmE8D+hpkc4ZT0PhBG97NWprpJpGpR+qdcdXLPz+ClC6Qch2JtPfoV8vKZOxYmSKAz+tbCy7RKHQ3vlcNT1gQRGsJ0Nly82cE+EvP+MXGPRkLGBRJ1Kiqcs/0DqgoRPNkxtlZshGbi1+gKPWsbCQvgXRhbVRHsw5a1bPf2HrO26TgGRR9z5eWMJxcLdFbRsKdLBklWQncgq93yeec0MWJXAOsDSUsBNOyBP+ONzVxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fGPc+q/oZul6zGRFqdqKnszP+kUiLirkKkJ/dfQoZ0=;
 b=sLwkCNac6koSguQ0yuq0Gd30qEoCYTC22b1gh3rDnUl+orjDTFb/yefTjonen1I9z2Qd01jD9W/Up6G0g6E+fjTh1+d+1sqYF0p+WlwZb/f6TzpWuGUgTLTQeTwjPQ2x4CAEt7EZ2Y3kk43cN2rln1QQLNnLRNxjtQhmscVvP2wPwyIK0h9KIjh1SRwzWXRsWCBGzJVB+Oe16L3IiHbFhfvKln2CblXVuAy1gePMosxuuq0eNh0sWqfYxcY2/uH+9Pvvum9VLYH6z/IVH0QMifFouNR83KQLxpZ9UN04bJybVStzQq4cunxkylkhdb6Wdl2k2q7QPOfL5T5wc8pFnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR02CA0083.apcprd02.prod.outlook.com (2603:1096:4:90::23) by
 SG2PR06MB5408.apcprd06.prod.outlook.com (2603:1096:4:1dc::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.20; Mon, 2 Mar 2026 11:05:29 +0000
Received: from OSA0EPF000000CA.apcprd02.prod.outlook.com
 (2603:1096:4:90:cafe::78) by SG2PR02CA0083.outlook.office365.com
 (2603:1096:4:90::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.20 via Frontend Transport; Mon,
 2 Mar 2026 11:05:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CA.mail.protection.outlook.com (10.167.240.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 11:05:27 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 84C0E4143A8B;
	Mon,  2 Mar 2026 19:05:26 +0800 (CST)
Date: Mon, 2 Mar 2026 19:05:25 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	gregkh@linuxfoundation.org, pawell@cadence.com, rogerq@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH 1/2] usb: cdns3: Add USBSSP platform driver support
Message-ID: <aaVu9VGSZmCcaCAB@nchen-desktop>
References: <20260302030339.324196-1-peter.chen@cixtech.com>
 <20260302030339.324196-2-peter.chen@cixtech.com>
 <20260302-brave-cockle-of-bliss-a8dde5@quoll>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302-brave-cockle-of-bliss-a8dde5@quoll>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CA:EE_|SG2PR06MB5408:EE_
X-MS-Office365-Filtering-Correlation-Id: ee5c6caf-1fc7-49f6-ee46-08de784b9cd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	64eEMRT9Rk49Nh4sirEhPefiAA8pO/ZF8vbkxJCkbEmNq1LwOMdvI+Kh9+nXZxaLWRMb5KAi0LMl/MXBkCbYxN2+LFQUpbA/gOF+izUNfvG+lBkCg3FvMJ+7yQVZt+Xms6z7+BCGyzlcjBwF4pQodXj78eu0gxfgOIV1Ob9zeicjRUG1v7yqvkztcVmenOfuRuDXIBTwr5IxpHHwqrDLaxB1H+U+t5nZpj5qTAgCjTVRtzfKbJWr8lsgbwLiqdyAd78lRv/o2mjdfcGo2OP+tBsqpjtWvuG8AQKUY27kf3m5VCbMX2zIru5RBbxNsaYTTmouPvQ5ITV3EDeWb3tqPXU/x0WeK/XJbkBMxXEsNz+uT7cWInR5pqkVoCj8Hyd9I/WyY99UiWec4+OOdIYBbqgp3vWkii2S/QwwcfzdQUFwLnggzhCxBUWHnhuK/Tc2mVStkBkoD/LSLmqAK7USMqQeaH3FbzmoZVW+rDuMY1gQdAH0LurN9awe4fWLLrevAprBdSiyJWcJVISFwgCmULGL6TwHf7mA5VoJqucGkd6bYqLC6REY0ph6/nQ+jfzlEAdIZusrb2jL0f68aVO7hP+klRJKjmnWmsre7r49rOFr4MBSYMn3L/YudsTmvoG7mSbw3tMYjXSIKP8cjJLSnSeYTTJp/4c2wTkIvkHmcen03WfLWVx9fNCjyYgqILaWBC0lN2uH4R2VP9C7TKJQ9KhqV/uR65IUBBxaXlJtrmIcKd4iVK0cGmMfwrcKyzqbKm9QdUKaqo5lD7saTURZgEn9nFnq1Dp1W5BHz5syeOqvgnkqb3/mdCJmxEWFFpQzE4ovmr5tFSB2ZTXW359LTA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	b7P9vykrkm+6QyOsacilutVLQBDVGa9M0USvdHQEiLoNqMQ/DIwGQTK6wOXzZD+RESZn26UgIiLa9z0qGlPaJaSJbgUFwWwka9V92rNnbIyl8TCHPy/5fDu9AOsYotEdnb+3x2vHjdUoCDS9xr2wadC9rdg1YdR5uHC5FfVn4cK+jtymBRrquEz7M8iwdXqrAYY4nac+OrvvKTHP0jHoaz1BBzY6ZWfhaXasUkW99bIMt5Jyte8dQAxFaFokDtJqF9eHP6MkggmrTopNryarulYWOsPYMuaowm5S1YPbc0lSDAZWBmc1HaMkNlUQjTRmHsN/Gv1zJ30h/rSeW0HBVdsa40kb1dr2X1QcAsV/4s9zp2Kb6jPCM5z7l3cszQ4Y1BJLFviPq/2EqIsTy0/awzPLKdBbrN1xvHuzJZZB9xWx9ulrkGVfjkGkMRrE3rg2
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 11:05:27.9831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5c6caf-1fc7-49f6-ee46-08de784b9cd1
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CA.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5408
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33871-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.938];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 152051D72AC
X-Rspamd-Action: no action

On 26-03-02 08:31:57, Krzysztof Kozlowski wrote:
> On Mon, Mar 02, 2026 at 11:03:33AM +0800, Peter Chen wrote:
> > -     cdns->gadget_init = cdns3_gadget_init;
> > +     if (device_get_match_data(dev) == &cdnsp_plat)
> > +             cdns->gadget_init = cdnsp_gadget_init;
> > +     else
> > +             cdns->gadget_init = cdns3_gadget_init;
> >
> >       ret = cdns_init(cdns);
> >       if (ret)
> > @@ -317,7 +325,8 @@ static const struct dev_pm_ops cdns3_pm_ops = {
> >
> >  #ifdef CONFIG_OF
> >  static const struct of_device_id of_cdns3_match[] = {
> > -     { .compatible = "cdns,usb3" },
> > +     { .compatible = "cdns,usb3", .data = &cdns3_plat },
> > +     { .compatible = "cdns,usbssp", .data = &cdnsp_plat },
> >       { },
> >  };
> >  MODULE_DEVICE_TABLE(of, of_cdns3_match);
> > @@ -336,6 +345,7 @@ static struct platform_driver cdns3_driver = {
> >  module_platform_driver(cdns3_driver);
> >
> >  MODULE_ALIAS("platform:cdns3");
> > +MODULE_ALIAS("platform:cdnsp");
> 
> You do not need this at all. Fix your DTS or platforms or this
> driver.

Yes, will fix it at v2.

-- 

Best regards,
Peter

