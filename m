Return-Path: <linux-usb+bounces-34546-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAbgBu9ZsWmGtwIAu9opvQ
	(envelope-from <linux-usb+bounces-34546-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 13:02:55 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDD32635B8
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 13:02:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3F0130315FE
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 12:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5453DE45B;
	Wed, 11 Mar 2026 12:02:43 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022110.outbound.protection.outlook.com [52.101.126.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726953DE45A;
	Wed, 11 Mar 2026 12:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773230563; cv=fail; b=l9ntcygUDsWy8yRT2+FOI+o2HW0JGAUeQmXDFEsfVqPKR9bQcOS5PHtFVtlx3bJKW9Dk1OcV+N/C5hQzRwRHzaW+X9HPJc8+l5djZ21AgckCwZvQYi8jsit2rtrNlnYNbtkRCMq7JqPLqlDWD9ZbYxRQLsp0v48rvknFhtCDPSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773230563; c=relaxed/simple;
	bh=TNjmvTIN+laI+x098phRoL6eIeQvW12m3keiDjci/qA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WARac5F0An0NaIUG5ooiB/cJQfIb2LvVQfpNVEZDJL8SAOPFod6p3oPR6J7AHNO+ap/LWrGoHrLRuj9cw9JcnX8diJq5J4nb5qCey3LN0ysdh4/L1D/U+ZlAVbKU0osfT1CWonJSWhEvWu9B3MCt61h9chcN8jIeKv1jJCWfQOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bAOBW/HGVaIQxmkHGYVYOimayuErkWEOSEcVwotU5uSSH3dKT6S8c50GDQgd6IdTBkAWfh9yXpdp63NdV21WyP2UID0+uHMivxHDbArRb4Wq/m8GlbczyO66POH+bRDKIyamXLPAkCkfoKJCXzbpbLlhzkIeXp0CTALLJIjFN+aG2c2iNzUVUoIO1QX9D2BQ/u3lYr62lx9f7edxfu7BUVxiG6rmsXAatBtuLYjLgTDg4QXQ5GR1/o7ELk2iRLpZItu3oXocMPiIBzeBhzQqgjJFOeGn+9spzMcLB1Ixc0ExutmLQHm+z56CNYXDVwRFn2fI1iJ9An2Zc34OzjNOHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abgzdvQr/j4OIZUuo49TxM/pILkwrJuv1RXzJy8+spM=;
 b=VOb6EV1HqnAKw5GZtjx02DVcKa6G+NU5KyvabboTx1q0D+bt0ItET5pZ9LSisOq6TUAJtIeqcgzJmQjGQr9jiGDuxizevH53K/KtgRuB2F0Cqq424ueOsAWT1XUiJmRHU+h+IsX+w8tWtxngNQowYpPhE3c9duI9zZNroRzO5l7buLcO9V3ydySsRT+6YSEKxq5xumeNnEQB5tJnilJHMtaaSIcfgWCtlutGwYlkqulC2WrZ/gsoiwd9yPMcSK6TGNY9JNKgU6EodMkvGvgb0vAUL6nn+NstFDQN5fJr7AgvNRS/uYWZ7GwLm6f/bANDKJkQ/bUDzWvaIjGT9fPrPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20) by
 SEZPR06MB7185.apcprd06.prod.outlook.com (2603:1096:101:22a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 12:02:37 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:0:cafe::74) by SG2PR04CA0158.outlook.office365.com
 (2603:1096:4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Wed,
 11 Mar 2026 12:02:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 12:02:35 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 76FED4350718;
	Wed, 11 Mar 2026 20:02:24 +0800 (CST)
Date: Wed, 11 Mar 2026 20:02:23 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Pawel Laszczak <pawell@cadence.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"rogerq@kernel.org" <rogerq@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"cix-kernel-upstream@cixtech.com" <cix-kernel-upstream@cixtech.com>
Subject: Re: [PATCH 2/2] dt-bindings: usb: cdns,usb3: Add support for USBSSP
Message-ID: <abFZz0Z4-VBhiYF7@nchen-desktop>
References: <20260302030339.324196-1-peter.chen@cixtech.com>
 <20260302030339.324196-3-peter.chen@cixtech.com>
 <20260302-vengeful-delicate-macaw-e8dc8c@quoll>
 <aaVWlfMPSZgy55Cc@nchen-desktop>
 <81c86ce7-0c55-4c2b-8956-cea4c63351cb@kernel.org>
 <aaVtfpY1waI8yQOf@nchen-desktop>
 <PH7PR07MB9538DCBF95C0C77D150E2D4BDD7CA@PH7PR07MB9538.namprd07.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <PH7PR07MB9538DCBF95C0C77D150E2D4BDD7CA@PH7PR07MB9538.namprd07.prod.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|SEZPR06MB7185:EE_
X-MS-Office365-Filtering-Correlation-Id: bcee0753-6045-4482-f3bf-08de7f6615c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|82310400026|36860700016|7053199007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sBsqqYsZaWvijz5Fbkc8FCVd98Tt/idirAYZY/7s12tDrwVi7R3CefZ/nAeqVu+ySmAUUw8HkvT07oNqBqP3gL4ffFrdx/1rTdtEO7HpkK2UBELqNo7lO0OiT+kISzBh8EaHt7TAvXVz5TTr/2TDDhycT0ogrLNmg+1bU5wo/AASSk125fWxNLWVh3fDl+3wl+WkAux6jTV+sVxgApydPsTjrkTfn2ax3UaFd3hgm1lKkEUXbOn0edFoEJpMijxaA+Rmd+sOeF34fPMPFwrKozIZCDFNN1fG/caq7pJkzpGYC9CNEJ6ZOvTHLr730IDUMqpX1VzU8Z9xUpdwquphTvqMQikpcFoV9M27apMz3A+68a4ls9WlGsZJZqPz3uu7SQgd2rDQs61Ad5spjLn3miCWQBQ/kmntd+vpW93re6bIGsqhweNjiXOdWPvY7NZZkQXlgb2NRsaibdp8VAFQegTSmhp/GuHvhjjb/pzaUqxuQJih6Q6oNdYr+ub4r+8+vMmAz7EybMEbPkIaUkwEhewqFYMFBNFUzClLW9oRzDG33pf0PoDYkW8vcPIC4oOWyADk/Djm5+NhCB3j5doTiEta7F/EKOTIRKNNSsl7qKk8/Qjqi+E6keaFlvmNfpdLW2il6Vx44Zufym4+mycZ7LWRhuOSu+L4eLURN1pUN7AuK2sykXNFivxe9Z65ywL4d8UnpWLGvoKADzEKdVvGRXAfUAo+0jMKg/v2J+fZaXKs9imMH1slJlgga/PGQb0xDOcaMQDkjr2lqBpaP0meZA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(82310400026)(36860700016)(7053199007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fGci8rwtmgQZTrJbYu7xwTmWl9nVYeMbyO4n+hOH3JA/FNhpQxh/+EuvYnEpqCZnK0Q19PLIkRCafD7qNcueb5+qtq8llTCf04gL3kA5m+RyXu08nXH6H6JMR6Fcw+Nmf9mcI7x0+AzV22D4GQz9FCWBSC5uj/KCiG0Hoq1gMkrLCUkrFW9MMj/Pw+CA/u6TQtn89L2vT5JiiaeiauVGpvR7CN6SfW/EW/QUi+0h2i7ldAoCewFC3U6McAYRXbZulH2RcnCLQe5IiLCb1Vi8tciWmaF+8aBs4xz1a/Fo2ztwtoT9fO0KBcrqFyO4eVafmOZxD7eXYd/TWKiiR/VoKlJJoibo4oeOtqLtAdN/MBpB+eJZXER8kN/j7ABjSZvubJAV92isXH2F1/2X/jVYBUjDxuIyt9G4nR6x44BAQhEctD0Y87B+0LxWFsUfFhCL
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 12:02:35.9637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcee0753-6045-4482-f3bf-08de7f6615c9
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7185
X-Rspamd-Queue-Id: AFDD32635B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34546-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cadence.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,aka.ms:url];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[cixtech.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@cixtech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.978];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-03-04 10:02:07, Pawel Laszczak wrote:
> [Some people who received this message don't often get email from pawell@cadence.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> >> >>>
> >> >>> +description:
> >> >>> +  Cadence USB dual-role controllers. USBSS (cdns,usb3) supports
> >> >>> +up to
> >> >>> +  SuperSpeed (USB 3.0). USBSSP (cdns,usbssp) is the next
> >> >>> +generation with
> >> >>> +  SuperSpeed Plus (USB 3.1 gen2x1) and XHCI-based device
> >> >>> +controller. Both
> >> >>> +  share the same register layout and resource model.
> >> >>
> >> >> So are compatible or not?
> >> >>
> >> >
> >> > Sorry for the misleading description. They are NOT fully compatible.
> >> > The register layout (OTG/XHCI/Device) and interrupts
> >> > (OTG/XHCI/Device/Wakeup) are the same, but register contents are
> >>
> >> Layout cannot be the same if contents is different. Same layout means
> >> same register is at the same place. If you have different register
> >> with different contents at given place, how is it "same layout"?
> >
> >Sorry. I mean the USBSS and USBSSP share the same resource model (three
> >memory regions for OTG, XHCI and Device, plus three to four interrupts). But in
> >each region, eg in OTG region, the layout for each register are different for both
> >controllers.
> >
> >Pawel, I think we could try Krzysztof's suggestion and differentiating USBSS IP and
> >USBSSP IP at runtime, we could use DID register (cdns->version) to do that and
> >avoid adding new IP general binding doc. What do you think so?
> >
> >> Again, driver stuff.
> >>
> >> >
> >> >   if (device_get_match_data(dev) == &cdnsp_plat)
> >> >       cdns->gadget_init = cdnsp_gadget_init;
> >> >   else
> >> >       cdns->gadget_init = cdns3_gadget_init;
> >> >
> >> > Without a distinct compatible, the driver cannot know which gadget
> >> > controller is present. This is a Cadence IP-level distinction (not
> >> > SoC-specific), so a generic compatible seems appropriate here. But
> >> > please let me know if you'd prefer a different approach.
> >>
> >> Generic compatibles are almost never appropriate and driver code
> >> rarely convinces.
> >>
> >> Best regards,
> >> Krzysztof
> 
> The Device (Peripheral) controller in USBSSP is not just an evolution
> of USBSS; it is a completely different IP core with a distinct register
> map.
> While the Host (XHCI) and OTG/DRD portions overlap significantly, the
> Device register space in USBSSP is architecturally incompatible with USBSS.
> They are different IP cores integrated into the same subsystem:
> 
> The register map for the Device controller in USBSSP is entirely
> different. Offsets that are valid for one controller point to different
> functions or reserved space in the other. Using a single compatible string
> would imply register-level compatibility that does not exist.
> USBSS uses a custom DMA-based peripheral controller, whereas USBSSP uses
> an entirely different XHCI-based architecture for the device side.
> 
> These two controllers do not provide a reliable way (e.g., via registers)
> to distinguish between them in every case.
> We should treat them as two separate controllers that happen to share
> some common code, rather than viewing USBSSP simply as a newer
> version of USBSS.
> 
> I believe Peter's intention was to use a common DT binding and a single
> platform driver, as the resource model and parts of the code are nearly
> identical.
> However, given the architectural differences on the device side,
> I believe having distinct compatible strings is the most accurate way to
> describe the hardware. It prevents the driver from making "blind" accesses
> to registers that have different meanings depending on the underlying IP.
> 
> Maybe to resolve this, we should have separate DT binding documentation
> and potentially separate platform drivers to reflect this architectural
> split?
> 

Pawel, currently, the OTG and host share the same code between USBSS
and USBSSP, the execution flow is decided by runtime already.
And for device mode, there are two different drivers for them, we could
decide which driver's initialization during the runtime, after the
initialization, the device driver (UDC)'s behaviour has already
decided per IP (USBSS vs USBSSP). Are there any examples the controller
would visit wrong register, eg, USBSS IP visits USBSSP registers?

Peter


-- 

Best regards,
Peter

