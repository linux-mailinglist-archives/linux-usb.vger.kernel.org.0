Return-Path: <linux-usb+bounces-35987-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id W0lqIbmN0WnwLAcAu9opvQ
	(envelope-from <linux-usb+bounces-35987-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 05 Apr 2026 00:16:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B02E939CBD3
	for <lists+linux-usb@lfdr.de>; Sun, 05 Apr 2026 00:16:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5951300B9F8
	for <lists+linux-usb@lfdr.de>; Sat,  4 Apr 2026 22:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F5A369235;
	Sat,  4 Apr 2026 22:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EdPFPuT4";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RXSY9/kT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JPEgMo59"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8C22D8391
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 22:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775340980; cv=fail; b=D5LxDSDUxWBiHmTHvuDSqGwS9WzBWLNtuKJqDBNo2LW3xv6tjsy4D6KX3orxsctKFKi9ISTHwSh0CUXXhlT0RXYHTQPu2RgY4GjwqoBy3g0Wi1Uh8hk/6R4a+kItB9dvSPOIIzp+w1ynOUpy78aiE97comdrlJTm7tLJzWwT3Qc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775340980; c=relaxed/simple;
	bh=JdeCf8ikDo4/lgi8IVNbilYvtQFyJ3grG/wovqVI0+M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=niZ/ug/kZGQx6+H29sF+wLmol2L5mayjCyYorVZMbspT12iQ7BKMU3y2Gx/aPHY45QUnv7KXfMonc0wHSc1HyHE75fFHlop/nPHtKv7Br1Q/RKOZb1QAkRJHWG09rEteYHCuQFHXn2nzepvz58FwH1DlLCmY2GMdjg7XQw+8RTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=EdPFPuT4; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=RXSY9/kT; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JPEgMo59 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634BDt4k2631958;
	Sat, 4 Apr 2026 15:15:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=JdeCf8ikDo4/lgi8IVNbilYvtQFyJ3grG/wovqVI0+M=; b=
	EdPFPuT4PZu0t4B9AxdItUy5AMdwjh54eLHQhVcny02vVO/HSM7Wf+wRXhFWqoVx
	2SovikS8kYQRheXmV0kQmUVXfcfSQmUDGt6pR9O7hkyaFDoQsF1xWs8/EqxeYGEu
	cdEnb2BWEx5QxaAoP4Ol0k2TJayzm4RwVg3lwcwNL/J8Y/4wG8ACcubD8JBYGTbP
	XDjMj5zFhXW6OZSsVLQfeGx1/hUmZBtGdKFjvPQgehSBiOZyoKtrVKUAXgw90Bih
	sfsSLT7nbtnkLXTgH0YalGgWKimE8Sn/gkPl9DXlSUxlsCpXCkgFgjZmzhX/P3+s
	lQSH/41gP3QbW6ItogDeRQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4db1jr1eh0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 04 Apr 2026 15:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1775340947; bh=JdeCf8ikDo4/lgi8IVNbilYvtQFyJ3grG/wovqVI0+M=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=RXSY9/kTkiTtOkx5Dw/UBg93DvZDTo0KAFjsr+QkBIRBTsw486faHVMaCL1jdaCfA
	 zmsmNDSDnle8VCLRhMUEWPOGhPET6hfUP+LaS5zwqBhfv1cJ85ZWOTrA/LtrLwf94x
	 IgwBWrpiDOWUFu10sgOXTskOCwk32R40ge7CsWh6OGbpohjKzsKy6oveUsXOzRZyy7
	 y3j2mFBsPKOQrhl0/Bk/dxNFDfhuiBj4DuznIufVaaszCIzGKWLTJRyssqHXuqRAb3
	 OtW2BgSOb8GK+OVmrW2MaBpfPfmIgcuPGXh6gCy9sgREe5IH081gxxSdAP4596e/hO
	 PRNnkdVkUs03Q==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C35A9404D4;
	Sat,  4 Apr 2026 22:15:46 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 6C7AEA00B1;
	Sat,  4 Apr 2026 22:15:46 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=JPEgMo59;
	dkim-atps=neutral
Received: from SJ0PR08CU001.outbound.protection.outlook.com (mail-sj0pr08cu00100.outbound.protection.outlook.com [40.93.1.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9EDDE4034A;
	Sat,  4 Apr 2026 22:15:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SToSVwig+HtV1nsMANQ5m794aJvUkYEkvkRmP0sxxPRva4sUD3rQsHncq+pRDLS1vV9T8M/0MThEIuLOiXflcaWAoURWqkP5JFRC5C7sJMeItmma8KrsNDNe6uJK3QLN7I+Cq5PUz6siqVIMS5ERT4dEpyTUwq1QY3YbcWr04LRH8xyBS05uycTFif3W4afa5lP7vUzmkFQ+j43u49ceOxIrRyGlfLhqrwLhwh+cQIZ54WFTW2rAPBqlsDIuXAalNJxL1fjWHTsNe94nJyNL2N9QO+BsLSeYPzblYiK/xAQa07A91x3tJ9DDkabrdOF9A3zgPAIK5YrAsVX4dKlfbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdeCf8ikDo4/lgi8IVNbilYvtQFyJ3grG/wovqVI0+M=;
 b=VUWMjAc4qvcUAI9KsTjZL8q7oa07aLx7GxsP0AukKmM6fp5n2MVkuPElXBKHGBLeFVahwh4y/y3wxvtx5aY6eYu3TSr7mzi9P/rKdj3Xwx63tYxfPgXryWM37vfkl9I8I5idniPSk36NCS/NLacDjXAVj9OsSAyNWQiMkC4NdsKyT7ozfWVheMJ8JZWHozQeYzy4eNOZUGFr0a+umGxUeiByQXa//s2B/ForNqG4kaY5a96NbrEJQG5mbVGWX3g+lRL5+iZkpG4ArkO97INYl0/0P75UH9P6352m9GxN6UgdSof/BKEUlzfZt/UTN0M9yRRMfCoyp9U8LtthF3adrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdeCf8ikDo4/lgi8IVNbilYvtQFyJ3grG/wovqVI0+M=;
 b=JPEgMo59wT+aVgEg9aMxNtidDlPkay6z24S/OuJJp56ljQH/e+towfLeiFEw23kLf1ROtnZALME9xmHt7/gHBLtY7GAh/iMQKWOryyqWNcCla1MVTMacwwinR8NCqwWPOaw6O8MYX+sMkcp0vU3bqNC8XSRGEeFnxKDqZKzSWzY=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA1PR12MB6946.namprd12.prod.outlook.com (2603:10b6:806:24d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Sat, 4 Apr
 2026 22:15:39 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9769.020; Sat, 4 Apr 2026
 22:15:39 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "michal.pecio@gmail.com" <michal.pecio@gmail.com>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Thread-Topic: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Thread-Index:
 AQHcusCFdimQniQh+kKFqQp1mqfuYbW+fjMAgACCooCAAQbCAIAAqVYAgADI0gCABZiuAIAAGBMAgAFDQQCAAGOTgIACAVGAgABK5wCAAYgPAIAAC/aAgAF5+wCAAArwAIABOtuAgAAUdoCAAAXNgA==
Date: Sat, 4 Apr 2026 22:15:38 +0000
Message-ID: <20260404221533.woepax7jxwefy3fq@synopsys.com>
References: <54121929-d775-45a0-b31d-09b783aada5d@linux.intel.com>
 <86876c62-01d2-45da-81f3-7d4499ffa0ad@rowland.harvard.edu>
 <50e61cf7-cce9-45b4-884e-ac65f5e771d7@linux.intel.com>
 <07351d72-5cdb-45e8-90af-311a0dc49718@rowland.harvard.edu>
 <20260403015950.lx4n4zdqki37dy27@synopsys.com>
 <28a00143-85fa-4043-93a0-c2b687ff1bcd@rowland.harvard.edu>
 <20260404011530.aukxllvizvmc3f3x@synopsys.com>
 <616e2a64-6feb-4ee6-bf39-a6284549f18f@rowland.harvard.edu>
 <20260404204133.3mcizeeokw3ln5r4@synopsys.com>
 <243af5f2-3925-4960-be7b-8d0c273ae629@rowland.harvard.edu>
In-Reply-To: <243af5f2-3925-4960-be7b-8d0c273ae629@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA1PR12MB6946:EE_
x-ms-office365-filtering-correlation-id: dcf38ce6-9ce2-4471-36bd-08de9297b453
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 VryEYxpb58/J9rRZZWE+GQouuv2yGw4JhP3oQRf0MShs2lvP/aPOdx6/ypFmPB5mJd9oNtx07fxsC4zu2poGE4wpgcBtpVSPYsGo8SfRjQqZPD20TuIdpuXoQPSjGbgkCYLgA7Gf+SMfOAsdoXnxUrAOCFUEWk96Z7PdlrD3s7L1X3jpTut2/EziUriex9w5uB+oQIAAcUEZEx5w02rVuCsCMMsKsz/OeYs2aOGtpNk40pkXUOFOzc7qLIDajGGwRbyJNvJdT6GntsxTRUa/25WaLdioTNUIste7fWBVLEePQR8xSOb/CK3tlhOhf6P/VzDhj+HwtWwHVonncwRFjKHmSXzDmQOdxnlaYDtkygSgner+ReJvPrYFqmW4z1cdlcS//tZ3IiIWSxIpukTygDL67LeNtN+nU1fHRWbpOV0kmJFHECoClRaDpR7RdEYhYffzdQGiYK3Nrj7/KLoSRU/XQEIf9mlmMBaDqVtVVf1zn7LKIPhpww1aN1jSS15RrRm8yj1IVYKjceuwJVGEKDRkMnZw6mH59wno6RqLQi71PLKG0NaTqcrLaEZkS6LyLiBWwAPzxXhXtz9177lS8LbPQv3DCb1ybznUjfLuSphSH/I0wqm0x5r20Ij8kxPMrIEKkmVP3CCc8X3SXPrcIpBtvYzeoyNOAwYZdumHuSRBEHw2fF+DsvT/cGSwCSKNvkSrUEiLH0gYp3ZeHA2QEVBjB+hzArpSART8ggGL2Kzo8B6M+ADr+YkPbtMEuKcy2+FyaUEzhUIMUZEflkz0kbxFI8OVJzPAX7W09weEfRM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NXkxcXBSUzg3Y25LNnROZ0ZBOXhVaW84YmRobGliTHlPVG1UUXdJOU12K3BI?=
 =?utf-8?B?THZVREpZdEVZanhOb2gwc0ZTelFEbjkyalRMcmg3THk3S0FpbkNZMUxpcTNT?=
 =?utf-8?B?bWhLcVRUQkpwYmZiSEFNUnRQbWVQZHBNUzgxSTdBN3gzVlZuZEg0MUoyWnZi?=
 =?utf-8?B?dXc4TlV3TWhKS3JhYkg4RlB1OEFXUEVuanZnNjdkWlhsemZNeCtmWDE2eUt5?=
 =?utf-8?B?dmY0QVdJdVlDanI0cEtCL1kyZEZkek5FUCtRMDNhaXdWWmdudmxPV0k0dEdC?=
 =?utf-8?B?UWtMZGt3c0ZhUCsrUC9KQUxzUXVBRHVzZ0wwamg0U2FEQ2h0cXl3Ym1WaSts?=
 =?utf-8?B?MUdwSXprN1ZQNk4xM2FCa1hKemVjaktnM1podnE4WXI5WUNmMlkxOER5V0hZ?=
 =?utf-8?B?SDhRR2s2eDJabytxMWNRV0tMMTV2S0pkQTlvanF2ay9Nc2tJaTQvUkVjZ09V?=
 =?utf-8?B?OW02bXRTZmlpcjNmRnFsemJGVkxvS2pPVjB3TVdQa0tzTDNkbFJlVkVLNmlT?=
 =?utf-8?B?cTd3M2gxS2J5RlVpcHhuSm1lNUEzWkFmQjBveEh1UDZheVNtNlJQdmVndTZ5?=
 =?utf-8?B?RXRyb2hDOG0zT0k1T2dTZXBuS0EzNjFZdG1saHQveURWUnEzcTlLN3FCaUhS?=
 =?utf-8?B?SUJPWkVUWi9lTnZnWGR3NG15cS9TZVdrYVphNE15MHhjS2ZZR0JTeDNsdWNY?=
 =?utf-8?B?RE5GbnhIaVJJYk94ZitmV0NEaFpRSDUyWENHUGI0Uk0xb0Vybk9sUDZnL3hD?=
 =?utf-8?B?RnJRZDJ1QWZEVktLTngwZ21XWkl0WGtsZDRzSFp5UU5zKzU1VTVuS3RMQnpl?=
 =?utf-8?B?eko0U2xhSEIyWHhpSlF0T3FrRmpKelZoREc3NmVieHI4UG1HUVVvelgzelRF?=
 =?utf-8?B?L1BIMDFieVFvK0hSNERLdmh6cTE2aVE5eU5iV1RqM2RnbjVZb3ZhYXdZbTgw?=
 =?utf-8?B?MmJqYUlXUk04MzdHUDJRL0NHdDNTWWFzTjhWOGRFUDczRnVGNFJ1UDI4MlFD?=
 =?utf-8?B?MmJhVnQyaGM4M3JsN2VuVEpjOXVjYUdPMDFhMExGUGdnNlI1NFFFSzZRcWd4?=
 =?utf-8?B?eE9lTXYxdi8xc3c5R1FscmFZYksyeWpFZW1BbG9EQ3N4bFFvNXErNlNqQXA4?=
 =?utf-8?B?VUVoZTRXYzZJL2dvaGVZMHNFVjRHWUoyRFhkcEVocG05R2dCUXE4Ym40UVM1?=
 =?utf-8?B?WEI5bUIzV2JVeDFnODNJTi81RlhINCtqSy9JZjRkZmxBV3laWW94ckVIRzBG?=
 =?utf-8?B?VzVtaERtemgvek9WYVhzdlNrbGgzZEdoRllNQndGeDAwbzA1eHhCYTZDUGVs?=
 =?utf-8?B?SngyZllwei9abjZ1Sm55eW0ydDdjV2thUHF6T2prd3dMMjNSbTZ6WWJvenh2?=
 =?utf-8?B?U0hFRVRXTzlRZThhcDFyZnVkQTBUazFRVlFrdEdINmJNMlZETUliZzFZclJP?=
 =?utf-8?B?UFZHZDE3cFNNNEs4L0UvVE03RXpab210cG44Tm9teDlWbEFtd3Z6RGVyK0Iv?=
 =?utf-8?B?bGc1MkJtRGJmUitHQjd5VisvWGcxR2lOby9tdjBaVnpYdjdEcEVVcmprOS83?=
 =?utf-8?B?bU1hQjdWdzRnY2xDWXc0OTRETFl4bkVpcUJJSFV0ZzdtWFBlME13aTZDRG1z?=
 =?utf-8?B?VFRWYUVrRDdteGhYZjY1Zyt3ZWlzYUQ5ZGIxWGpwNXdvcW96MElGakhWdDkr?=
 =?utf-8?B?aUdFNWJNU3RRSiswczVCWWYwM0ZPYzVlWUFweWp5dHkrbjlJaVI1ZGVHc3FP?=
 =?utf-8?B?Vjhvd3JpcUo2c0U0RWhDWXZTeC9qSHpjVWVJNGV5SWtSWnhEWlRJTloreXdD?=
 =?utf-8?B?alM1OWJ0N1NNNXdWY25zS0RmK2VDU2ZpMTVjNGpCdkprUmlDZ0hNVnUwVm5y?=
 =?utf-8?B?eC9zNnU1TGdTVHRCU3R5MWZvSUhLQ3JMSEk0WUVEUE9pVzhidmMycDloaVE4?=
 =?utf-8?B?bXUwUWxiZWx4Q1ArUWUxdDRoNlJraFAzN1dtVTBmMHQwU2lKSTVsZlR0M0xJ?=
 =?utf-8?B?YTdHdzdiR0sxeWRtNzhwMm5yMXVlR0dlc0Z1UnJDbFE1Um1VM0Y2RXJwRTEx?=
 =?utf-8?B?QUZIWlhPck5lNnVEdWtJS2w1VUJ1WlBYaVpUdVQ0dGpTMk40a1VNc1hiOGQr?=
 =?utf-8?B?VWFQdUVLb3c4b0xtYkkrVzZhSHhCVFp6eVhUYVhTV1JYQ1NvbWs1VDZWNGhx?=
 =?utf-8?B?QkFsTXV6RW5meG55aU5nNDkrU2VLNW5rUzRYYlhJQTQzdmgxakZ5a1pKSVN1?=
 =?utf-8?B?WXI0bm94Ni8xcTVQMjZzbFJ4SHo2MHhObGl2RlQ2T0lSRk5sUGRxdUo3OE1z?=
 =?utf-8?B?QnQyam45VEl4K1NzNGlZWk1EMzN1MXBHZGJwVG0zN0Qvc01LNHhCdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <002144DE9520ED469F9CDEF9CF24FBDF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	ooB/GVJ+xPvtUeZ+EsfMMyZtNNmFQft+h+ITXV4fKEcc8hG8SdnNa1CYZYmRretBNQ7Yku1s6sgbstceYZ4gFJxeuH34CGa6k4JB5N/9sHYXW0eopkTDUvIEq2forH2hcBcUu3atA9S+3ZvbFiLlBkp3SPDwSQ73VSzd05D2U28oG8c0FXfRKetf3S11tUuY1hn/+iA3mIRhwePWhX3A2SsgkAmBYTZiQ36NfVWnftA6hOF8KkhAnxHaqKdz6u7wAnlx58M9hrecCv2TZnCsWH1fm9UZE308J2bN2u9JVD04WODFIdChCiC6vgNtyqNHtp1ZebA3PBagYBFaNFiAUA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YtRzeeYq37HiWpjVVTf4CXTD6CTLph8/wpohGBeCCLPrFholpdMTVAFcMPvU8QvDb9ysk8PPQ4SO1MAwhwpcNH6c90fjOQpryzSTNfv4ierdq2LQOgoVbB6kbrClcFT5WqeA/gzOF32I0tkb8QZSbo9cDswVWa3yd9PyUx9KNFz93tqzDh53XIl6LbWOo75mK9HY3nQk1ZFBAi6Bh+g26hphqvoQPv0JP5nxfSPnEKuiykOj7FJYl3EsSZO5LgSaj7PZ0TTxqfyn1jrLxxDeH8QvSIF/Xy8g6hEUZP+1cROAXVn1pnfPnizr9co3dFQNv0/NpL/EdfG8BNqpXvhVyX1hdl9Flf/uvI2M1BSH6enC/OcnyqodoLpRvoDNs/0++SKmorpXa2FEUA9GZWMN4ebxnP35ye089kEVEfLSYAgZQW5rEiyBMxUxEJMVfDzXN4c8Fg7biw7Hfmezxn5n/9n1VJX8LNcjoFgcXjyGh4C89rur3xOzwSTFqQmM/SPR/DzEK5fsBJeqvFz4+ywVCgj7Vxzey2QW7Mi2Q2AzOlUP94joYVBTu2KeqWrJFTHIBmmPfKCQXDSv/XXSznPeq5cN/0OcxCjZrV5jBeI+xD8NmKY5frq0pOw8WHKCGZGluO74wwXRtYXAatzaVOHlIQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf38ce6-9ce2-4471-36bd-08de9297b453
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2026 22:15:39.0701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: owWCg549QiD5ykLjkEHXOaEBc0z3221sG7790oMXpi/1D+vgpx9xRVmlR9Kt7wxeZ53yUFN4t67W0YIOw+m4Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6946
X-Proofpoint-ORIG-GUID: wU-ZT4O2wsHJ5mDOs_T8yq48E3xyGgOb
X-Proofpoint-GUID: wU-ZT4O2wsHJ5mDOs_T8yq48E3xyGgOb
X-Authority-Analysis: v=2.4 cv=ao+/yCZV c=1 sm=1 tr=0 ts=69d18d93 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=IrFixf8kqSRz3RFMXeYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIxMiBTYWx0ZWRfX382pa+aDtJj7
 YnOXN8XY1+hFS644X4s8Q0cIMelRYKB/j1sj9n+YRzYxmGZwIOMArR0pMZNOBNW9qbPGyP6YlLg
 BqQxgeT+P+q9oN0+izmyXcFyUvr/JWbnMYcJ1x2aHJ+pJh2OrHxQS/PUU6TNp4tvtQ2Q1NlMgpI
 TgKH0XCu0hKeJ4QccVTUoFoZRXQ5r5D/13Aeskgfef2f/GTtBMj9U8WIjGkXK/I/j8RLPJHcSKQ
 I91zmkoqUZLyH2yMfxoo/yxyfD3XkfiLCWbFOUPRm9ZsoKar2GrBh4S5Dd4iqY1nMeAkdRPGzw6
 jJrT4nE4EZ027+XnM9fYBUYlGaNwN7GU9Rdjpe0zMdY3BVyaf5CFBI5iv6z94exV++ehmvYQi6i
 fXt7vNmLjFgIUK2xOSg8FJx5c+haY2eV6o97U8tVSKU634cFZBOir89Qv0W2BAkqkFqSMM88OCk
 GPi0ibdSbytFheRGT3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040212
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35987-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[synopsys.com,linux.intel.com,vger.kernel.org,gmail.com,suse.com];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B02E939CBD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gU2F0LCBBcHIgMDQsIDIwMjYsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+IE9uIFNhdCwgQXByIDA0
LCAyMDI2IGF0IDA4OjQxOjM2UE0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBG
cmksIEFwciAwMywgMjAyNiwgc3Rlcm5Acm93bGFuZC5oYXJ2YXJkLmVkdSB3cm90ZToNCj4gPiA+
IFN1bW1hcml6aW5nOg0KPiA+ID4gDQo+ID4gPiBJZiB0aGUgY2xhc3MgZHJpdmVyIHdhbnRzIHRv
IHVubGluayBxdWV1ZWQgVVJCcyB3aGVuIGEgdHJhbnNhY3Rpb24gZXJyb3IgDQo+ID4gPiBvY2N1
cnMsIGl0IGhhcyB0byBkbyBzbyBpdHNlbGYgaW4gdGhlIGZhaWxlZCBVUkIncyBjb21wbGV0aW9u
IGhhbmRsZXIuICANCj4gPiA+IFdlIGNhbiBtYWtlIHRoaXMgZWFzaWVyIGJ5IGFkZGluZyBhIHVz
Yl9mbHVzaF9lbmRwb2ludF9xdWV1ZSgpIHJvdXRpbmUgDQo+ID4gPiB0byB0aGUgY29yZS4gIElu
IHRoZSBtZWFudGltZSwgdGhlIEhDRCBlbnN1cmVzIHRoYXQgdGhlIHF1ZXVlIGlzIHN0b3BwZWQg
DQo+ID4gPiBiZWZvcmUgZ2l2aW5nIGJhY2sgdGhlIFVSQi4gIChOb3RlOiAtRVBJUEUsIC1FTk9F
TlQsIC1FQ09OTlJFU0VULCBhbmQgDQo+ID4gPiAtRVJFTU9URUlPIGFyZW4ndCBjb25zaWRlcmVk
IHRvIGJlIHRyYW5zYWN0aW9uIGVycm9ycy4pDQo+ID4gPiANCj4gPiA+IFdoZW4gdGhlIGNvbXBs
ZXRpb24gaGFuZGxlciByZXR1cm5zLCB0aGUgY29yZSB3aWxsIGF1dG9tYXRpY2FsbHkgY2FsbCAN
Cj4gPiA+IHVzYl9jbGVhcl9oYWx0KCksIHdoaWNoIHdpbGwgYWxzbyByZXNldCB0aGUgZW5kcG9p
bnQgb24gdGhlIGhvc3Qgc2lkZSANCj4gPiA+IGFuZCB3aWxsIHJlc3RhcnQgdGhlIHF1ZXVlLiAg
VGhpcyBhbHNvIGhhcHBlbnMgYWZ0ZXIgU2V0Q29uZmlndXJhdGlvbiANCj4gPiA+IGFuZCBTZXRJ
bnRlcmZhY2UsIGVpdGhlciBleHBsaWNpdGx5IG9yIGltcGxpY2l0bHkuDQo+ID4gDQo+ID4gSSBs
aWtlIHRoYXQgdGhlIGNvcmUgd2lsbCBoYW5kbGUgdGhpcyBhdXRvbWF0aWNhbGx5LiBCdXQgb25l
IGNvbmNlcm46DQo+ID4gSG93IHdpbGwgdGhlIGNsYXNzIGRyaXZlciBrbm93IHdoZW4gdGhlIGNs
ZWFyLWhhbHQgY29tcGxldGUgc28gaXQgY2FuDQo+ID4gcGVyZm9ybSB0aGUgcmVjb3Zlcnk/IChp
ZS4gaXQgc2hvdWxkbid0IHBlcmZvcm0gcmVjb3ZlcnkgaW1tZWRpYXRlbHkNCj4gPiBhZnRlciBz
ZWVpbmcgLUVQUk9UTykNCj4gDQo+IEl0IGRvZXNuJ3Qga25vdywgYW5kIGl0IGRvZXNuJ3QgbmVl
ZCB0byBrbm93LiAgQW55IHJlY292ZXJ5IFVSQnMgdGhlIA0KPiBjbGFzcyBkcml2ZXIgd2FudHMg
dG8gc2VuZCBjYW4gYmUgc3VibWl0dGVkIGFzIHVzdWFsLCBhbmQgdGhleSB3aWxsIGJlIA0KPiBh
ZGRlZCBvbnRvIHRoZSBxdWV1ZS4gIFdoZW4gdGhlIGNvcmUgcmVzZXRzIHRoZSBlbmRwb2ludCwg
dGhlIHF1ZXVlIHdpbGwgDQo+IHN0YXJ0IGdvaW5nIGFnYWluIGFuZCB0aGUgVVJCcyB3aWxsIHJ1
bi4NCj4gDQo+IElmIHRoZSBjbGFzcyBkcml2ZXIgd2FudHMgdG8gdGFrZSBzb21lIG90aGVyIGFj
dGlvbiAobGlrZSBzdWJtaXR0aW5nIA0KPiBVUkJzIHRvIGEgZGlmZmVyZW50IGVuZHBvaW50KSBi
ZWZvcmUgdXNpbmcgdGhlIGVuZHBvaW50IHRoYXQgc3RvcHBlZCwgDQo+IGl0J3MgZnJlZSB0byBk
byBzby4gIEl0IG9ubHkgaGFzIHRvIG1ha2Ugc3VyZSB0aGF0IGl0IGRvZXNuJ3Qgc3VibWl0IGFu
eSANCj4gVVJCcyB0byB0aGUgc3RvcHBlZCBlbmRwb2ludCB1bnRpbCBhZnRlciB0aGUgb3RoZXIg
YWN0aW9uIGlzIGZpbmlzaGVkIC0tIA0KPiB3aGljaCBpcyB3aGF0IGl0IHdvdWxkIGRvIGFueXdh
eS4gIChBbmQgbWF5YmUgaXQgaGFzIHRvIHVubGluayBhbnkgVVJCcyANCj4gdGhhdCBhcmUgYWxy
ZWFkeSBxdWV1ZWQsIHdoaWNoIGNhbiBiZSBkb25lIHdpdGggYSBzaW1wbGUgZnVuY3Rpb24gY2Fs
bC4pDQo+IA0KDQpUaGVuIHRoZSB4aGNpIG11c3QgbWFrZSBzdXJlIHRoYXQgaXQgc2hvdWxkIG5v
dCByaW5nIHRoZSBkb29yYmVsbCB0bw0KcmVzdGFydCB0aGUgZW5kcG9pbnQgd2hlbiBnaXZpbmcg
YmFjayB0aGUgY2FuY2VsZWQgVVJCcy4gSXQgc2hvdWxkIG9ubHkNCmRvIHNvIG9uIG5ld2x5IHN1
Ym1pdHRlZCBVUkJzLg0KDQpXZSBjYW4gYWRkIGEgcmVxdWlyZW1lbnQgc3VjaCB0aGF0IGlmIHRo
ZSBjbGFzcyBkcml2ZXIgc3VibWl0dGVkIHRoZQ0KcmVjb3ZlcnkgVVJCcyBwcmlvciB0byBjb21w
bGV0aW5nIHRoZSB1c2JfcmVzZXRfZW5kcG9pbnQgKHdoaWNoIHNob3VsZA0KYmUgZG9uZSBhZnRl
ciBjbGVhci1oYWx0KSwgdGhlbiB0aGUgSENEIG1heSBrZWVwIHRob3NlIFVSQnMgb24gYSBxdWV1
ZQ0KYW5kIG9ubHkgcHJvY2VzcyB0aG9zZSBVUkJzIGFuZCByZXN0YXJ0IHRoZSBlbmRwb2ludCBh
ZnRlcndhcmQuDQoNCkJSLA0KVGhpbmgNCg0KPiA+ID4gRm9yIC1FUElQRSAoZGV2aWNlIHNlbnQg
YSBTVEFMTCB0b2tlbiksIHRoZSBjbGFzcyBkcml2ZXIgaGFzIHRvIGNsZWFyIA0KPiA+ID4gdGhl
IGhhbHQgaXRzZWxmLiAgVGhpcyBpcyBiZWNhdXNlIHN0YWxscyBhcmVuJ3QgZXJyb3JzOyB0aGV5
IGFyZSBhbiANCj4gPiA+IGludGVudGlvbmFsIHBhcnQgb2YgdGhlIFVTQiBwcm90b2NvbC4NCj4g
PiA+IA0KPiA+ID4gLUVOT0VOVCBhbmQgLUVDT05OUkVTRVQgKFVSQiB3YXMgdW5saW5rZWQpIGFu
ZCAtRVJFTU9URUlPIChzaG9ydCBwYWNrZXQgDQo+ID4gPiByZWNlaXZlZCB3aXRoIFVSQl9TSE9S
VF9OT1RfT0sgc2V0KSBhcmUgYSBsaXR0bGUgdHJpY2tpZXIuICBUaGUgSENEIG1heSANCj4gPiA+
IG9yIG1heSBub3QgbmVlZCB0byBzdG9wIHRoZSBxdWV1ZSBmb3IgYW4gdW5saW5rLCBwb3NzaWJs
eSBkZXBlbmRpbmcgb24gDQo+ID4gPiB3aGV0aGVyIHRoZSBVUkIgYmVpbmcgdW5saW5rZWQgaXMg
dGhlIGFjdGl2ZSBvbmUuICBXaGVuIGEgc2hvcnQgcGFja2V0IA0KPiA+ID4gaXMgcmVjZWl2ZWQs
IHRoZSBIQyBoYXJkd2FyZSBtYXkgb3IgbWF5IG5vdCBzdG9wIGl0cyBxdWV1ZS4gIEVpdGhlciB3
YXksIA0KPiA+ID4gdGhlIGNsYXNzIGRyaXZlciBzaG91bGRuJ3QgbmVlZCB0byB0YWtlIGFueSBz
cGVjaWFsIHJlY292ZXJ5IGFjdGlvbjsgYW55IA0KPiA+ID4gbmVjZXNzYXJ5IGFjdGlvbnMgc2hv
dWxkIGJlIHRha2VuIGF1dG9tYXRpY2FsbHkgYnkgdGhlIEhDRCBhbmQgdGhlIGNvcmUuDQo+ID4g
PiANCj4gPiA+IEFsbCBvZiB0aGlzIGFwcGxpZXMgb25seSB0byBidWxrIGFuZCBpbnRlcnJ1cHQg
ZW5kcG9pbnRzLiAgQ29udHJvbCANCj4gPiA+IGVuZHBvaW50cyBnZW5lcmFsbHkgbmVlZCBlcnJv
ciByZWNvdmVyeSBvbmx5IG9uIHRoZSBob3N0IHNpZGUsIGJlY2F1c2UgDQo+ID4gPiB0aGUgZGV2
aWNlIHJlc2V0cyBhdXRvbWF0aWNhbGx5IHdoZW4gaXQgZ2V0cyBhIG5ldyBTRVRVUCBwYWNrZXQs
IGFuZCBzbyANCj4gPiA+IHRoZSBIQ0Qgc2hvdWxkIGhhbmRsZSB3aGF0ZXZlciBpcyBuZWVkZWQu
ICBJc29jaHJvbm91cyBlbmRwb2ludHMgZG9uJ3QgDQo+ID4gPiBldmVyIGhhbHQgYW5kIHRoZXkg
c2hvdWxkbid0IG5lZWQgdG8gYmUgcmVzZXQgd2hlbiBhbiBlcnJvciBvY2N1cnMuDQo+ID4gPiAN
Cj4gPiA+IE92ZXJhbGwsIHRoaXMgc2VlbXMgc2ltcGxlciB0aGFuIGFueXRoaW5nIGVsc2Ugd2Ug
aGF2ZSBkaXNjdXNzZWQuDQo+ID4gPiANCj4gPiANCj4gPiBUaGUgcmVzdCBzb3VuZHMgZ29vZCB0
byBtZSENCj4gDQo+IEdvb2QhICBMZXQncyB3YWl0IHRvIGhlYXIgZnJvbSBNaWNoYWwsIE1hdGhp
YXMsIGFuZCBPbGl2ZXIuDQo+IA0KPiBBbGFu

