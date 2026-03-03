Return-Path: <linux-usb+bounces-33906-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PgyHj+/pmlDTQAAu9opvQ
	(envelope-from <linux-usb+bounces-33906-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 12:00:15 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D20F41ED3CD
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 12:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A676C313B77E
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2026 10:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B96F3BA22D;
	Tue,  3 Mar 2026 10:54:51 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022103.outbound.protection.outlook.com [52.101.126.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A626F38228F;
	Tue,  3 Mar 2026 10:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772535291; cv=fail; b=Vm3y27m5JvHdp56xYt8m/XwHbynGJbH/6+e2uZ7DhXtkJj4StnG57VejvNgbeROJuDFmYoNz4t9mL1sRcymnLoRTa44XgbfNrhzmfqqJ3LUl+AG2cJ5MdepPTG62x2gMksk4wwXTDokIKIXieVUgOn2h5Tytx4RM8hBCcAGsGUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772535291; c=relaxed/simple;
	bh=I1AJdE0B7oCW54ReuhIbonoJjvrtZecZ/oNGkCaU3SA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KljeMGG3qD93uD0ZfNDjGaOe0Jlj0BRq0/vxB2xR4C2kNdPWW0V74/EmRZBCBteMwCLL8pv6VgSdbDyR1OxOxVE4vlms+V/Fc+3Wde0R7m1aI2S7atl76m3fsfnK60Nm68ClTKUiLIDjY6/+yHZpFdC0xs1hCUv/4tHJrGtK/G4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZcaLTki6su3MsQMedYWHYwSYbQ9QUH2D+2bHzBiDYUrbRNC8PHQlO8VJR9DYFxtnYjuinMkN2SfBAhPOYFiKPjQgb6x+Ty1voCfPuGQHc1jzATPBfTt5IOhbgCoLzOJzu1a0yOsubgr5gxvd8a68kDw4jSxovbxmajg7X1sB/nNu03obycA8kCuTYRpX99TnHvU7KcyVnD5YnW32K0EETBDdqMoJmOQ9Cb5HAitXeOY0X18dfQvdRZLglQQahOkOTKx09zMbZ7mwlsmFxqRmmrkHCfPVOFZxBh5DzWHl/JxV4Ksf2NZYIddtAKOKKPOw4fGbKOG0qy6NGsEm4E/qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtGPUvhiNX9L0SOr366rNxBEvsXo/dK58y8mc9MAvHU=;
 b=dxVO8CQOjkQRoz+kLXiPOQpuXzTRBurjacsIY/4+G7T2f+bwyuVW7UR9jn4oMOEYV7qJoLcJNL46y8gU/y9iuO6mggy7A4uOKFD7jVdVYBBgecl3QXV0eB4aW9pjy6w9XS3wzCzwUsN2g079k0Adk5dkF+mnjnrX3zLNKxufKbcFTh0XXJHBw+3wmkaJvn5Rk7VY9U4vM8C9mqYfotE6hELw9F5Xn5l7apvYAuF2w/hzhVJCfWblvCwhkGHes0JoTjUgvyEwVeL7bWfQb5ooA+gkbBCudGhZYJBzbiQ620ePFxBdDgiAyCUSc71at785WO50UwbngAYf0OrVz6FLKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2P153CA0035.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::22) by
 SEYPR06MB8004.apcprd06.prod.outlook.com (2603:1096:101:2d6::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.22; Tue, 3 Mar 2026 10:54:45 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:4:c7:cafe::6d) by SG2P153CA0035.outlook.office365.com
 (2603:1096:4:c7::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.9 via Frontend Transport; Tue, 3
 Mar 2026 10:54:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 10:54:43 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 6A1AE4350703;
	Tue,  3 Mar 2026 18:54:42 +0800 (CST)
Date: Tue, 3 Mar 2026 18:54:37 +0800
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
Subject: Re: [PATCH 0/2] usb: cdns3: USBSSP platform driver support
Message-ID: <aaa97U38DByYYDcC@nchen-desktop>
References: <20260302030339.324196-1-peter.chen@cixtech.com>
 <PH7PR07MB9538DF65B6E13761C630615ADD7FA@PH7PR07MB9538.namprd07.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH7PR07MB9538DF65B6E13761C630615ADD7FA@PH7PR07MB9538.namprd07.prod.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|SEYPR06MB8004:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e923da6-7fb6-4a92-8c0d-08de79134744
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	EwTvGo77qPL9fEAdZqzikWzlvM9yBQILeSUAGG3Dtb3Lh1wHYdeoEQP+74jsH1jEeWpYyHW0xjGGsychpYUKbP9mtPdJuFhReE54WmoyWJhqy8rvKGoyeaLPemuBecWQxjhh9BPQvl75DAYXY5iccyCTq3Te30yMuTxw1ebsU1iuaylRcQQpm49qZKaUhp6U1gjdhDxkUnvU25czOcHhmlqxSjImvQvzu5Ghbm2cldKWhqI1G7Ocgyhdy0p4O0M1VHpDaHH1nJAHZjbUomC2tJHTlMA3YNCWrKrtB51bblUcDP9ObCHFMMA/FnuRmWaVtJHgePBLlOkOGDIBNkpX6lpt6ADICcEVzVV2HqsyXb6In98IRAKD3rtmnk+FFxsOwJcnS2ryIaxlfpjTYMwmILPOcZs0EAznr9xGCJTnbzyl48ADUTp3AdZaSOw+6dhuANfaCBYmLp4BTq2aU78WTmy4g9MVK583wYEfG0xwXp5oz7F0D74YnCpVAHHVmsnJaUvHEHF2rpJtALRTwjBAU2gIrSfL2du8XNFW9dv0JMZ5wjBJ3MYtA69LKlUDdghJBR2liz6RY15rH9ujsquYb/V7nxt5wTutZo3EviQvctz7eWVtdChq9rVt7XcxNaTKm0KmzWrOT3DDx76QAhmZ5mEC1WCzAOD3vV2O4+W6D6Mo4IrYcfpbGMTVsAi2XPu6kXsHJGO+fSrvFChQrDlPgpR2Y9D0pwxLp1s0tLjPzgcUgaVwWaG/A+aHkp4kxM4cVDACQRppux6c/OFDgltf8A==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EW0XJozmNh1zRYOM4DDC1tTmMRDqdSoVj5Tr7BgGG+t4gJiqZ7l32lOckKcBHwPwiiJxqoidQcz24gHrwyHb6A2H34oMWroQJuGIvx7hwfPf9yiZ5lmmFFv11FVLQR/ps9VuvFcZQONQOAK6T9eAF1CTUGrDRHsCwOmPaS29kYwl8L+vkMix4BWUCJk8y61vK+KQoarcuPCE+4EkUF2QKbYYpQFJc1TlKvmrJxWi5eyTscWOZizG0+xNO/gsGSMOucAmmZRnvShdJEV3hJZAfe1dcBcbYKgVdQjaIwGGtaX4+GNVXsnZFd8uw2TYaTpi/uslGFVzWdipvGxorKq4oFpxKZGSkjCZEjetZg/3JrbV9YCnfubqd8NoFe9qqoyIX7shVZjDZQ8maft4A0WkSy0rMG16GUlpbYEO5MlLsDB1DysIVuVz5uk8IPwNAxQe
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 10:54:43.6160
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e923da6-7fb6-4a92-8c0d-08de79134744
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB8004
X-Rspamd-Queue-Id: D20F41ED3CD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33906-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url,spinics.net:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-03-03 07:34:54, Pawel Laszczak wrote:
> [Some people who received this message don't often get email from pawell@cadence.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL
> 
> >
> >Hi Pawel,
> >
> >The Cadence USBSSP (CDNSP) controller was previously only accessible
> >through PCI, coupling the gadget driver with the PCI glue layer into a single
> >monolithic module (cdnsp-udc-pci). This prevented using the CDNSP IP on
> >SoC/platform designs that expose the controller through device tree, eg, CIX
> >Sky1 SoC.
> >
> >In this series, it restructures the driver to decouple the CDNSP gadget from
> >PCI, and refactor cdnsp-pci.c into a thin PCI-to-platform wrapper (similar to
> >cdns3-pci-wrap.c) that registers a platform device and passes PCI resources
> >and platform data to the common platform driver. So, please help test it in
> >your platform.
> >
> >The changes are tested with random configuration combination tests.
> >
> >============================================================
> >ALL TESTS COMPLETE. Summary:
> >============================================================
> >Starting cdns3 config combination tests...
> >Timestamp: 2026年 03月 02日 星期一 09:34:47 CST
> >
> >PASS: all-builtin (SUPPORT=y CDNS3=y GADGET=y HOST=y CDNSP=y
> >CDNSP_G=y CDNSP_H=y)
> >PASS: support-y_cdns3-m_gadget-y (SUPPORT=y CDNS3=m GADGET=y
> >HOST=y CDNSP=y CDNSP_G=y CDNSP_H=y)
> >PASS: support-y_cdns3-m_gadget-n (SUPPORT=y CDNS3=m GADGET=n
> >HOST=y CDNSP=y CDNSP_G=y CDNSP_H=y)
> >PASS: support-y_cdnsp-m_gadget-y (SUPPORT=y CDNS3=y GADGET=y HOST=y
> >CDNSP=m CDNSP_G=y CDNSP_H=y)
> >PASS: all-module (SUPPORT=m CDNS3=m GADGET=y HOST=y CDNSP=m
> >CDNSP_G=y CDNSP_H=y)
> >PASS: no-cdns3 (SUPPORT=y CDNS3=n GADGET=n HOST=n CDNSP=y
> >CDNSP_G=y CDNSP_H=y)
> >PASS: no-gadget (SUPPORT=y CDNS3=y GADGET=n HOST=y CDNSP=y
> >CDNSP_G=n CDNSP_H=y)
> >PASS: support-y_both-m_gadget-y (SUPPORT=y CDNS3=m GADGET=y HOST=y
> >CDNSP=m CDNSP_G=y CDNSP_H=y)
> >PASS: minimal-module (SUPPORT=m CDNS3=m GADGET=n HOST=n CDNSP=m
> >CDNSP_G=n CDNSP_H=n)
> >
> >This patch was developed with assistance from Anthropic Claude Opus 4.6.
> >
> 
> I can compile the kernel but when I try to install modules with
> make modules_install I get error:
> 
> DEPMOD  /lib/modules/7.0.0-rc1-new-pci-plat-support-next-20260227+
> depmod: ERROR: Cycle detected: cdns_usb_common -> cdnsp -> cdns_usb_common
> depmod: ERROR: Cycle detected: udc_core
> depmod: ERROR: Found 2 modules in dependency cycles!
> make[2]: *** [scripts/Makefile.modinst:132: depmod] Error 1
> 
> It occurs even with minimal configuration:
> CONFIG_USB_CDNS_SUPPORT=m
> # CONFIG_USB_CDNS3 is not set
> CONFIG_USB_CDNSP=m
> CONFIG_USB_CDNSP_GADGET=y
> 

Thanks for testing. It needs to let cdns3(p) platform driver as
standalone module to fix it. Would you please try below fix on top
of my patch set:

diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
index 0e9b20e799d0..63484f145bb9 100644
--- a/drivers/usb/cdns3/Makefile
+++ b/drivers/usb/cdns3/Makefile
@@ -3,12 +3,14 @@
 CFLAGS_cdns3-trace.o				:= -I$(src)
 CFLAGS_cdnsp-trace.o				:= -I$(src)
 
-cdns-usb-common-y				:= core.o drd.o cdns3-plat.o
+cdns-usb-common-y				:= core.o drd.o
 
 ifeq ($(CONFIG_USB),m)
 obj-m						+= cdns-usb-common.o
+obj-m						+= cdns3-plat.o
 else
 obj-$(CONFIG_USB_CDNS_SUPPORT)			+= cdns-usb-common.o
+obj-$(CONFIG_USB_CDNS_SUPPORT)			+= cdns3-plat.o
 endif
 
 cdns-usb-common-$(CONFIG_USB_CDNS_HOST) 	+= host.o

Besides, would you please comment [1], the key point is could we
keep one platform driver with one compatible string, and cdns3 or cdnsp
platform is decided at runtime?

[1] https://www.spinics.net/lists/kernel/msg6072480.html

-- 

Best regards,
Peter

