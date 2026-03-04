Return-Path: <linux-usb+bounces-33947-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOfSIUrup2mWlwAAu9opvQ
	(envelope-from <linux-usb+bounces-33947-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 09:33:14 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E14D91FCA94
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 09:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 575FD300D45F
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 08:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4515391821;
	Wed,  4 Mar 2026 08:31:29 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022077.outbound.protection.outlook.com [52.101.126.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9E8390CB9;
	Wed,  4 Mar 2026 08:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772613089; cv=fail; b=GdASWzvUWFXq3b19tj4ftO4d6vGolbQZMTFPM5ayORFIuEntwYfzfeDHRnSp9nqCVWKEiN7OgmwXR2FH+ijgmHIsQMszRsGlAJTtnh4FeOWLj7OKrPg+nV/AR+IU01HhGe8+Y++hz41ImPIb0U+DMVot+BnQ2S9jcUK034h0RSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772613089; c=relaxed/simple;
	bh=7IKylSchmvd9wISkXoV7zbPOGkB7jV1uY40n7D7ZCF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=obgOYrQhf7rvXWJfMgdYiz9qqv42Wm7esqT10mvaaRhgSME8FRA8sLZxNtG0X8h0GAlM7sTs7wrzlbg0QQpNw1cmIqgCvYVGOK7m8TNpobT3XrGZXi+1v1bHe/Tru0Uvm34NPcWSDA9WdnX/OmYkqCzT+YlBQ88eZHhnmyYUaTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ufdmGs4KzuBhSrDuQZGrF55+DSiJkL1oehsxuJPOB+myXzQvsM772FOyhD4UFDI6fY275mDCSOnUEYTxwat9xBAcEIPz+oaAmbRdKqGt223Px3KXo045ehd/o/GQEruyeDRs9KG0ng1DheIrJt0TgeuPI0cnZIXmF91qB3Y2VEtpBYanuXQaq6VH0f3TgBWIY3nid2QnXRccpq/IEFTA0DbxJs4UK+1tFu0wfyBa6391PWi8M46KPZmkvaq8+oFgFu3iJZkleP5OSAFoj+FWR5dOW5rshARvmA5gXX0p+3BKRIVnv7BWlUkHAe48TwzwvIT4ycl6RQcuxJo9SVBddw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9JVs4txQKBNlrq+osYv35SiPRGdH3cPfILIF/boUc0=;
 b=uNsWnq51YlDianSfav6F2+Yu7hbAeCZizFWPUVbX4UNPsf0M4oY4XbtiY7PqbcPci0QBhLxnoKxN6pzFxocthmw9uu9C0/6fWTGxNwz4xzDD2CIedSDdGNRl0daQfllO8nil5P8QMxZ4FmWUuxNtL+LH1JO0fK8MSzA+J8bemllx7gRXlQSKAiYod+wbbhgmRiukGziU42Q8YWBGGRa0T3DlJHHt3TE+SIH8ST3irQaXhX4Z32m/JEfnfZ3S3pv3dP26f1bu1N9kMSg7Rl3C3USM4+864wWc1wiVMAIvtxgvXXbaKNa0X6z+sKQz8FBlumrYVJ9InLcN0H2dq+QygA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCPR01CA0150.jpnprd01.prod.outlook.com (2603:1096:400:2b7::19)
 by JH0PR06MB6509.apcprd06.prod.outlook.com (2603:1096:990:32::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Wed, 4 Mar
 2026 08:31:20 +0000
Received: from TY2PEPF0000AB8A.apcprd03.prod.outlook.com
 (2603:1096:400:2b7:cafe::84) by TYCPR01CA0150.outlook.office365.com
 (2603:1096:400:2b7::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 08:31:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB8A.mail.protection.outlook.com (10.167.253.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 08:31:19 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D40AC40F0506;
	Wed,  4 Mar 2026 16:31:17 +0800 (CST)
Date: Wed, 4 Mar 2026 16:31:16 +0800
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
Message-ID: <aaft1E2wxdnQTGR5@nchen-desktop>
References: <20260302030339.324196-1-peter.chen@cixtech.com>
 <PH7PR07MB9538DF65B6E13761C630615ADD7FA@PH7PR07MB9538.namprd07.prod.outlook.com>
 <aaa97U38DByYYDcC@nchen-desktop>
 <PH7PR07MB95386226F5CA1AD596699C66DD7CA@PH7PR07MB9538.namprd07.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH7PR07MB95386226F5CA1AD596699C66DD7CA@PH7PR07MB9538.namprd07.prod.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB8A:EE_|JH0PR06MB6509:EE_
X-MS-Office365-Filtering-Correlation-Id: d31d606f-80f0-4bae-6926-08de79c86951
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	BrvoqLyKWkh/tFiLdVa6JyvtJjX+LXqyTA5mB0GoCL/rmNK9tE1sZ7VET1+xKm7PrzeHE3JE+kaRrjvSY1qUNplGkQAeUOzDwsjxC0vlFIoN4VrWPuixMJpbxczwCZJ8aWitqEL+uvs5t40hbylYB/XwyDXSagB7aRZ0dPdGChpkBT6KNEbLTx3WITcgkIqBRKbncfGYgzp1YFdnuHw3cxt90Hjg/f9eGbPKt7DHIR8gCCmenrgvmxq9qgNSKQQgrS8bhi2STKL41mViipQPBDdXIavIrZb5BU+i8cAQnsRxMBLIRsIAmpFaGfUgnpH4OfJOFZvXVyztg5K3P/FkNZA93lzT2PorXSedY8Acf3FcEwkJhJ7kqpYKrluPDOlzRa819qxiGichost5Tj2GBwl+bfi++53bVFLnBfodjhQDG/9JwGkivmCJnXtgJ2w2D4bANbvQuvA3vxVVIzg1ILLkkDllMqH1I8GKEGPX+0KL88FrvcJ4IQAc9ZszV3f4fUchwo+wzyk8XmqwiGFwM1nBCvbYzhTDO1092f0O+yfZu3IiWEZ9Qe1tFi4FveP33XbEqew2Qpy/8qKh70wITsqky13MEgjeMpM0iNaDOZk9LoRHsPbwlCpkKpGh+BOKjmHtNds9XqyrmhnPVjWhS5QzT6IawwNwDoVky7mv+BX3Y4vrMUky48zn3Z8hp3cBl6OxtxnW9ONqRzuK7bVfbw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0gNb5EVNb6IpAAUqIEeeMSBaV9jf5Uv7ywJco2uNpAAUf6VzaRJEcg+kROeCVfUJzc1k61UDa5nrixjkr83+pSRH+KW4q7hJa98gcYZdHbrUoBeq0yMg2C2CTPe8jHJCQVKBh0FGCn3TDno8z4X17+/pHuKpHS8wzNpO2MdKmhjxi11UX49YVhGyj9FD1jnhcAmEYvc658wi5gsNFuw+6BAlGeXG8AbB/F/WrqQeA24Ei+j3wYuaJf1rFm7tc7WUVaKwi2ODTshFvXnGcQ+kh+Cauw2nHVC92hHc9ITi3VzgqaqkUpsHGU7VemAVBow3jjOis0IIVPxgWewdS7iF6KXwEsdqUOFiD96k6wJmsC/YTI4H5ZPyY1+fL4SDle5viPUhXqTsII9wY9hGVuSpku/qrolzPrlp8Dib6P5odd6rHluhg4fZ6T0rPn4G9c4/
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 08:31:19.8113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d31d606f-80f0-4bae-6926-08de79c86951
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB8A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6509
X-Rspamd-Queue-Id: E14D91FCA94
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33947-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url,cadence.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,urldefense.com:url];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.990];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms,urldefense.com];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-03-04 08:22:25, Pawel Laszczak wrote:
> [Some people who received this message don't often get email from pawell@cadence.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL
> 
> >
> >On 26-03-03 07:34:54, Pawel Laszczak wrote:
> >> [Some people who received this message don't often get email from
> >pawell@cadence.com. Learn why this is important at
> >https://urldefense.com/v3/__https://aka.ms/LearnAboutSenderIdentification__;!
> >!EHscmS1ygiU1lA!AMXCokQopzhe7zk6kKPFeLLp-
> >yuh1is6xaU_qe56iXLYV9j5bEV_jUOV23iU07J2VMvUVf89LhR60AKPHeqB$  ]
> >>
> >> EXTERNAL EMAIL
> >>
> >> >
> >> >Hi Pawel,
> >> >
> >> >The Cadence USBSSP (CDNSP) controller was previously only accessible
> >> >through PCI, coupling the gadget driver with the PCI glue layer into a single
> >> >monolithic module (cdnsp-udc-pci). This prevented using the CDNSP IP on
> >> >SoC/platform designs that expose the controller through device tree, eg, CIX
> >> >Sky1 SoC.
> >> >
> >> >In this series, it restructures the driver to decouple the CDNSP gadget from
> >> >PCI, and refactor cdnsp-pci.c into a thin PCI-to-platform wrapper (similar to
> >> >cdns3-pci-wrap.c) that registers a platform device and passes PCI resources
> >> >and platform data to the common platform driver. So, please help test it in
> >> >your platform.
> >> >
> >> >The changes are tested with random configuration combination tests.
> >> >
> >> >============================================================
> >> >ALL TESTS COMPLETE. Summary:
> >> >============================================================
> >> >Starting cdns3 config combination tests...
> >> >Timestamp: 2026年 03月 02日 星期一 09:34:47 CST
> >> >
> >> >PASS: all-builtin (SUPPORT=y CDNS3=y GADGET=y HOST=y CDNSP=y
> >> >CDNSP_G=y CDNSP_H=y)
> >> >PASS: support-y_cdns3-m_gadget-y (SUPPORT=y CDNS3=m GADGET=y
> >> >HOST=y CDNSP=y CDNSP_G=y CDNSP_H=y)
> >> >PASS: support-y_cdns3-m_gadget-n (SUPPORT=y CDNS3=m GADGET=n
> >> >HOST=y CDNSP=y CDNSP_G=y CDNSP_H=y)
> >> >PASS: support-y_cdnsp-m_gadget-y (SUPPORT=y CDNS3=y GADGET=y HOST=y
> >> >CDNSP=m CDNSP_G=y CDNSP_H=y)
> >> >PASS: all-module (SUPPORT=m CDNS3=m GADGET=y HOST=y CDNSP=m
> >> >CDNSP_G=y CDNSP_H=y)
> >> >PASS: no-cdns3 (SUPPORT=y CDNS3=n GADGET=n HOST=n CDNSP=y
> >> >CDNSP_G=y CDNSP_H=y)
> >> >PASS: no-gadget (SUPPORT=y CDNS3=y GADGET=n HOST=y CDNSP=y
> >> >CDNSP_G=n CDNSP_H=y)
> >> >PASS: support-y_both-m_gadget-y (SUPPORT=y CDNS3=m GADGET=y HOST=y
> >> >CDNSP=m CDNSP_G=y CDNSP_H=y)
> >> >PASS: minimal-module (SUPPORT=m CDNS3=m GADGET=n HOST=n CDNSP=m
> >> >CDNSP_G=n CDNSP_H=n)
> >> >
> >> >This patch was developed with assistance from Anthropic Claude Opus 4.6.
> >> >
> >>
> >> I can compile the kernel but when I try to install modules with
> >> make modules_install I get error:
> >>
> >> DEPMOD  /lib/modules/7.0.0-rc1-new-pci-plat-support-next-20260227+
> >> depmod: ERROR: Cycle detected: cdns_usb_common -> cdnsp ->
> >cdns_usb_common
> >> depmod: ERROR: Cycle detected: udc_core
> >> depmod: ERROR: Found 2 modules in dependency cycles!
> >> make[2]: *** [scripts/Makefile.modinst:132: depmod] Error 1
> >>
> >> It occurs even with minimal configuration:
> >> CONFIG_USB_CDNS_SUPPORT=m
> >> # CONFIG_USB_CDNS3 is not set
> >> CONFIG_USB_CDNSP=m
> >> CONFIG_USB_CDNSP_GADGET=y
> >>
> >
> >Thanks for testing. It needs to let cdns3(p) platform driver as
> >standalone module to fix it. Would you please try below fix on top
> >of my patch set:
> >
> >diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
> >index 0e9b20e799d0..63484f145bb9 100644
> >--- a/drivers/usb/cdns3/Makefile
> >+++ b/drivers/usb/cdns3/Makefile
> >@@ -3,12 +3,14 @@
> > CFLAGS_cdns3-trace.o                          := -I$(src)
> > CFLAGS_cdnsp-trace.o                          := -I$(src)
> >
> >-cdns-usb-common-y                             := core.o drd.o cdns3-plat.o
> >+cdns-usb-common-y                             := core.o drd.o
> >
> > ifeq ($(CONFIG_USB),m)
> > obj-m                                         += cdns-usb-common.o
> >+obj-m                                         += cdns3-plat.o
> > else
> > obj-$(CONFIG_USB_CDNS_SUPPORT)                        += cdns-usb-common.o
> >+obj-$(CONFIG_USB_CDNS_SUPPORT)                        += cdns3-plat.o
> > endif
> >
> > cdns-usb-common-$(CONFIG_USB_CDNS_HOST)       += host.o
> >
> 
> With this fix, the modules installation works correctly.
> 
> I have an additional comment regarding the grouping of USBSSP and CDNS3
> options. Currently, they are not grouped together in menuconfig,
> which looks a bit untidy.
> It might be better to move some of the Kconfig configuration higher up
> to ensure they are properly grouped in the menu.
> 

Thanks for testing. Would you please comment below question, it depends
on how I do the v2 patch?

> Regards
> Pawel
> 
> >Besides, would you please comment [1], the key point is could we
> >keep one platform driver with one compatible string, and cdns3 or cdnsp
> >platform is decided at runtime?
> >
> >[1]
> >https://urldefense.com/v3/__https://www.spinics.net/lists/kernel/msg6072480.
> >html__;!!EHscmS1ygiU1lA!AMXCokQopzhe7zk6kKPFeLLp-
> >yuh1is6xaU_qe56iXLYV9j5bEV_jUOV23iU07J2VMvUVf89LhR60DCMbBxz$
> >
> >--
> >
> >Best regards,
> >Peter

-- 

Best regards,
Peter

