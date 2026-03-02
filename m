Return-Path: <linux-usb+bounces-33869-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOXzKlBupWlXAgYAu9opvQ
	(envelope-from <linux-usb+bounces-33869-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 12:02:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1794D1D71B9
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 12:02:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 548D6305A433
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2026 10:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD77235DA6A;
	Mon,  2 Mar 2026 10:59:21 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022119.outbound.protection.outlook.com [52.101.126.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05E52E2663;
	Mon,  2 Mar 2026 10:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449161; cv=fail; b=CECE0+zqM9su+rSokuEoxOOGf1uT65Eb5RsD9USLJ0ZmwWratqlmFOmZZM55bXXLxtJNAJRhsYNr5GZRebhqYvOAz+DtHbck/x6brTgY4XEKf9alO40M5+iU+XD+Y2nFtbdEPf/iTV4t9CYyyz6s6H5zYuW2izdD9hOGqGotHts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449161; c=relaxed/simple;
	bh=OcZVWzqaFhohDRk3cePSqRXwmDPIwNVBKP6PK57UR38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sb3am2AJ6ibHjrEy0g05DliNO/maA3C4B5ilw735W/X7F8sJ7FtBQ9eXFjoWAArv290LNTv/wvRY7miZssxxfm+In0XzkWbsEc/5A1M9WXjZrV1vuVKXbFTQSYiViQq5UWvhMxoVadlxpA0zyhwA0ctfqSfblBxbMMcQ2Pa+om0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Whlsuk8yWFziFzbWepB+H0IpyiM1qs0Q4zzTyewFgyUMtA/gGf7FNyLaVWMSYhLmmIDaBkyUZaZ/SoWkcYNhyxrRl//ZheXaHRuiHK6fSO3bq0tTStlDy6I7NXOGz1N9bUgLe7bO6FVM2KJbo4liaoxVY5BWS1QPHgjXWRnRcQ6DRTLgPr5V2WuG9qlPmjtW7QWWfzWPrmNCscdYLQuOIvWb5IBNJtZGI3Eer7/cGgSoB935idyGERy1IN0j/tezQjrynHaNgghY/G3OrswOVPiym+ytCJZNiajZUvpBdXhvtRr+cLP+ZTjdb4b+kOVCPi22g61ZtxktMv6XBDKuSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aby51Z7q1+d8wbX+EzlhDyKdzN8/vz7UW5ilD6eAcxg=;
 b=j/PhyahpsYouWvmzQXUbzANFiDJIWeGE7JB92KwsLOVmd8bvJVs36ed4mj7lOM0K/3OYpVKgextnbx4o4Q+AcVtJcu0NJOi1C88Mj56lGu+YyEvp+buTR+IdXCKdOYYdjuDUGsZKe7FOuyvqofhh3LjmOVAKpqyxc0wln2Bcd9VFvfAoNzGoBBs9ReoVj1Qsd9bKBcD92uAg3CXGK40YpelfPOhyccJPiCpQBwIWO1jYTeLq5Ra/bWSr0yJIVSR23ES4acKt/jTKdZc8o6jOmD68XJcIOARfzvR9UOC2/lvAzngJK1lWm95mcWTBaY82TAetAsHMBKJyqzOMGU3NIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0035.apcprd01.prod.exchangelabs.com
 (2603:1096:300:58::23) by TY2PPF567CBE20E.apcprd06.prod.outlook.com
 (2603:1096:408::790) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Mon, 2 Mar
 2026 10:59:15 +0000
Received: from TY2PEPF0000AB89.apcprd03.prod.outlook.com
 (2603:1096:300:58:cafe::5d) by PS2PR01CA0035.outlook.office365.com
 (2603:1096:300:58::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.20 via Frontend Transport; Mon,
 2 Mar 2026 10:59:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB89.mail.protection.outlook.com (10.167.253.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 10:59:13 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 8786A4350708;
	Mon,  2 Mar 2026 18:59:11 +0800 (CST)
Date: Mon, 2 Mar 2026 18:59:10 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, pawell@cadence.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	gregkh@linuxfoundation.org, rogerq@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH 2/2] dt-bindings: usb: cdns,usb3: Add support for USBSSP
Message-ID: <aaVtfpY1waI8yQOf@nchen-desktop>
References: <20260302030339.324196-1-peter.chen@cixtech.com>
 <20260302030339.324196-3-peter.chen@cixtech.com>
 <20260302-vengeful-delicate-macaw-e8dc8c@quoll>
 <aaVWlfMPSZgy55Cc@nchen-desktop>
 <81c86ce7-0c55-4c2b-8956-cea4c63351cb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <81c86ce7-0c55-4c2b-8956-cea4c63351cb@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB89:EE_|TY2PPF567CBE20E:EE_
X-MS-Office365-Filtering-Correlation-Id: f312de9d-c15c-46be-9f91-08de784abdad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|1800799024|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	req8AFvSSITPEZBd3tnacV74Xhg9jxSpOidfkGGKbr1J/8fL8Bg+UFTkuBFHw7IiozC0RNU1UZIbY7sZ9tl7j2vJD/6wm0SljIl4gQgxQk+NEF8mratD7xJxJRM4I4z5kkHqJ0aN65aGbAMgi51i1wvx7/gt5SeDvXD56k2O0KXvLv7ik4+DE6XoDPcYWPS7PMRWh35GvAE2F77AowMkkxYbap90CO1zGEeF9q4zNRRlFzldXVSaPxF27b6d62YBUGAp5QBQQYiZOhjRCn6AfOPaR+llxo0El4P5Ze2wmiALQ6up4I/xW+LXc3JHyLb0KMqBwv+2FWF6Lt0JdEs/Tto+QbFacWgc+hqiKA9e3fVdPBWs1T3NxokPR2gsZwe4CWT2+5PJGJZOAAeDAu6VUiLuttT2L2aN/thyn6nWsJ9aJYL0xtPiaEyxe+8zEXd+dXvXfkq7aWmsqsrmm9tDsiqgc60yD7FRiWn1IyvUA5Ki+kWs5/aO2RzIqyBpoekaWnHAaBprS5i9xii21wQ/TrTmqqXWN79f62Ufdi1KLWuNYaHydBQENB5v5kbS4efyGqlKj0kZOg6kfU9FidFiAzGmqHYZgayxQaD52FuviliyafPK6E1lgOaSoU8L9WeSRyAFVILXGaDikMftKPNHG/2xm1YH0iweiYzLII1gx8MkQFFErojxR6eE36Zl9GjK/Q4dlbhu8HEnJZUbeAZNPC9+rXzGo4YtJDFzOvMDJZrm3mvjrJH0Dfo+mBvagK+ABGvK43x8pDmMzYedX3+dY4kd3n2i3ZeQJUD98PIMXHKR9I3Zl3+OiZS8od+TNq7SFCfD3RKl/MRbZkQG8ZjKqg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(1800799024)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JJ8oehQ01hvyQG7C2V8JQrQjFHPLLUiLpH0UmxNJ0fVbs2X0tWazeTH8y7Qzq+y4nQPAIxuYCZEv2C/JmTWb/xHI3x6C/lj+Bu37tb0Dzj9rgV8E6G1uNQbEI3z/UvbItK/teLFSONYEqdv13bxu1vyfcGFE3dhhseIcd05JCkJNUUqhZWPmm+nt/BiXpifEFX93eHOzV7yHHnhpkg2WVJDplX6t6d49+u9niwEIT02aPyqp0ZmtroWPMp5CSwpha/hmfn9Xa+nQFBwkBRewGzBlRB3bTQaOZrXRWcuWZbkV/c/r7nYC5M73xVFdUP6J0L9HqkmOItcBjDOAEmh68aRg3w4AqxCQGK7D6Mi5geAiJfk2+LBrzq4nOZpAKGLTcrEu4NN7c7OkJPxSxFZMmycHM3SuQ1BVKy4V1lt0nnKP//u7PwqWS2tnTKhQyOex
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 10:59:13.6290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f312de9d-c15c-46be-9f91-08de784abdad
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB89.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF567CBE20E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33869-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.917];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1794D1D71B9
X-Rspamd-Action: no action

On 26-03-02 10:27:11, Krzysztof Kozlowski wrote:
> >>>  maintainers:
> >>>    - Pawel Laszczak <pawell@cadence.com>
> >>>
> >>> +description:
> >>> +  Cadence USB dual-role controllers. USBSS (cdns,usb3) supports up to
> >>> +  SuperSpeed (USB 3.0). USBSSP (cdns,usbssp) is the next generation with
> >>> +  SuperSpeed Plus (USB 3.1 gen2x1) and XHCI-based device controller. Both
> >>> +  share the same register layout and resource model.
> >>
> >> So are compatible or not?
> >>
> >
> > Sorry for the misleading description. They are NOT fully compatible.
> > The register layout (OTG/XHCI/Device) and interrupts
> > (OTG/XHCI/Device/Wakeup) are the same, but register contents are
> 
> Layout cannot be the same if contents is different. Same layout means
> same register is at the same place. If you have different register with
> different contents at given place, how is it "same layout"?

Sorry. I mean the USBSS and USBSSP share the same resource model (three memory regions
for OTG, XHCI and Device, plus three to four interrupts). But in each region, eg
in OTG region, the layout for each register are different for both controllers.

Pawel, I think we could try Krzysztof's suggestion and differentiating
USBSS IP and USBSSP IP at runtime, we could use DID register (cdns->version)
to do that and avoid adding new IP general binding doc. What do you
think so?

Peter

> 
> > different, esp, the device (gadget) controllers are architecturally different:
> >
> > - USBSS uses a custom gadget controller (cdns3_gadget_init)
> > - USBSSP uses an XHCI-based gadget controller (cdnsp_gadget_init)
> 
> You just described drivers, so this does not convince me at all.
> 
> >
> > I will fix the description in v2 to clearly state this difference.
> >
> >>> +
> >>>  properties:
> >>>    compatible:
> >>> -    const: cdns,usb3
> >>> +    enum:
> >>> +      - cdns,usb3
> >>> +      - cdns,usbssp
> >>
> >> Why do we need another generic compatible?
> >>
> >> And why do you add it now to each of device schemas using this one?
> 
> You did not respond to this one. Look how this schema is used.
> 
> >
> > Like explain above, the USBSSP has a different device/gadget controller
> > architecture from USBSS. The platform driver uses the compatible string
> > to select the correct gadget init function:
> 
> Again, driver stuff.
> 
> >
> >   if (device_get_match_data(dev) == &cdnsp_plat)
> >       cdns->gadget_init = cdnsp_gadget_init;
> >   else
> >       cdns->gadget_init = cdns3_gadget_init;
> >
> > Without a distinct compatible, the driver cannot know which gadget
> > controller is present. This is a Cadence IP-level distinction (not
> > SoC-specific), so a generic compatible seems appropriate here. But
> > please let me know if you'd prefer a different approach.
> 
> Generic compatibles are almost never appropriate and driver code rarely
> convinces.
> 
> Best regards,
> Krzysztof

-- 

Best regards,
Peter

