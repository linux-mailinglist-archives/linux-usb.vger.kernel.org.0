Return-Path: <linux-usb+bounces-32088-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3ECD06A4A
	for <lists+linux-usb@lfdr.de>; Fri, 09 Jan 2026 01:49:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1316D300A996
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jan 2026 00:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D68C91B4F1F;
	Fri,  9 Jan 2026 00:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HdScuJ6c";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Gvbmipym";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BCDHuX+Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDEC54763;
	Fri,  9 Jan 2026 00:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767919784; cv=fail; b=BoE0h9v25Wrh1+FPasZd425bXfx+RKhuhxYNqZMPyG25VVB5BCfGSQDh8gvn1X6nf0tyj1WOMec/ROFiLd3l5Su2Gjg82q2J6bKM3BJy8EVUbCk79Tn9WnDndpm5HCxq9omssEop1n7bX9wXFe2Oo87fJSj2PNK7ZI7LWY6SbZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767919784; c=relaxed/simple;
	bh=nBsXTUXxitBXwTym5o2SrGh0Y3tEskBTom8/gHcnY9k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p+olrkPQXOaWW3flL8f8eQ2j1sPPJEz/CYKUUcDOt7vVOPPRjwEXRRiBC6r5F8yVJf35SEeZM7ZirsNgBdcHsjYEWXXETxDl23YosO0m/3aYMw0xxDHcrkN59K7fkIDMlh1fxsd/xWnQA/NRgdoKOox6Yf47XcbFqMuBQLrUKEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=HdScuJ6c; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Gvbmipym; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=BCDHuX+Y reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608MhY5v2334323;
	Thu, 8 Jan 2026 16:49:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=nBsXTUXxitBXwTym5o2SrGh0Y3tEskBTom8/gHcnY9k=; b=
	HdScuJ6cfa00uoQMqZ0T4sTg3ysaXGXjH/VFrl2c+pjuIbOXPtP5axo5DkVnEJJ8
	3PyUd3uH0YbjcefGHzNYmuHxlKVzbWFg0Qi4If7VlBdqULz02eRTya7wNqbDn4a6
	xMl6V91DQAeXhDpz9Lvv7q1HKBIISPREubocHcxOgZPv4UovqPBWcpO+rqh+qfdv
	+nz5sXqiTEz/w1/AU3XiWcNAFof0ut5l8gV31Eo9bAi0rKkabsF/D+CleS4qES4t
	KYFsB+D16Tvu4JMOObSMh+G8GIVeP+UpklD/9an1jf8wZ/EOA1oaSuuvURJqjjLi
	C8tFEn7RhqOniR2iB6glVw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4bjng08sm3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 16:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1767919754; bh=nBsXTUXxitBXwTym5o2SrGh0Y3tEskBTom8/gHcnY9k=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=GvbmipymI9o2nWbK1I7mIYN0h77G5dVreom5ctlM1ELmU4xYlsVT+pEo0RRzaku6V
	 o5gQrNsAVZZR5oFTEL3HfIAOhRzXG1pVQbezByWs05hTb5JlbUUzebGEApZtKdytEK
	 4PlBrjtFnw6YUzj69NkRKTbbN1uu6ceId2EKJCLcH6fKHFyE5gSpKqdNnZ2u2FU8uO
	 sSeUw+04Y2J2X8SCpJ9tAAaN9eyijUl8xuNgd0ixFzu4D00fRPjbtHFZB8T21wkMTB
	 o7yGTdZRLVYsgURkDMf2egdnnfN+Bm3iz/+XdK70yApj9U/MH1bOgCUJm94l3ln+pI
	 Q2J4aliOA3M4A==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0B37440087;
	Fri,  9 Jan 2026 00:49:12 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 91FB5A00AE;
	Fri,  9 Jan 2026 00:49:11 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=BCDHuX+Y;
	dkim-atps=neutral
Received: from BN1PR07CU003.outbound.protection.outlook.com (mail-bn1pr07cu00307.outbound.protection.outlook.com [40.93.12.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 811232201C7;
	Fri,  9 Jan 2026 00:49:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsnXOEIEE2y8KJwnQIHojzOEB0OrGe0JTZjMIDyhG5q/YsD27+tEf8FuX+0gvweOqLgQ9gBsBRrUGrxVgU5u/7ZM+j+QYbvYTWwMB4e/zJmQGTunK/1pS+ygkirNS4P8K0sMQ3zuiC1fEfC4a8oMk4tzdGY91sMjE0qFUHB7qNXNrhYezmQPMgXWMf80w50uLO1vPzWcj4QNdkCoJltKlQaMRrSB7BgsMUswioKCmQEgAFEloy6HCS4QiiFVQB/iAK9gbIsBZNqM4pi2JkDsc0OM7VUhMkfv4IZnPgZkFnVrtSAjz7uBmGuF6LEPl8tXHbeeQSvplQ0XGSFbFC1SrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nBsXTUXxitBXwTym5o2SrGh0Y3tEskBTom8/gHcnY9k=;
 b=RC4fnzgDQTVEPC+VWeruOnN6k91PjWPTB8dUr6/qfUqfK3Uu6dvv7eet+Cp4RKkkVOxJctw28dS+byiKUvwAka2kEYQczHzU2fgSLHdL+rLE6FvYAz4F/g9Swlyf88deno5cp6g3Vx3/o18FdVExrghMJ2YEOrD+4HGwMACS+GfMnKaC0Fk6xDB3OA0sBnvqNr68fGczGXwSJNIqS23yQ+xgLuwKzZulDsNBMntBpS0rvyDOrR8IvQGw2C2i1ephiOO/GtiHCBYr8G92AlGdYP2T6S/pL7RSwJ5Y4CDCe1gjs4Novtd76Y47dRDe3ChvGWBEUCVnkASROizTPWSyZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nBsXTUXxitBXwTym5o2SrGh0Y3tEskBTom8/gHcnY9k=;
 b=BCDHuX+YC9Xy96mc1E3fVhzBMw6+y1EZge2mlDcX0w3aVQG08hzfpMrBwQeaHiW2QwYi/Hr+2/MZ3FyTwLyYFhyBjLBPINjaOJvUM8nvWGDBFcGoU3Oz3F8FUPlAzAcJYA6q+7uzmvXMeiTIIVuzcbkDFVnRtIGXMNiBotGD8Y4=
Received: from MN0PR12MB5979.namprd12.prod.outlook.com (2603:10b6:208:37e::15)
 by BN7PPF521FFE181.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6d0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Fri, 9 Jan
 2026 00:49:03 +0000
Received: from MN0PR12MB5979.namprd12.prod.outlook.com
 ([fe80::39d3:f259:acf5:7f7a]) by MN0PR12MB5979.namprd12.prod.outlook.com
 ([fe80::39d3:f259:acf5:7f7a%4]) with mapi id 15.20.9499.002; Fri, 9 Jan 2026
 00:49:03 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Sean Anderson <sean.anderson@linux.dev>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "open list:DESIGNWARE USB3 DRD IP  DRIVER" <linux-usb@vger.kernel.org>,
        Neal Frager <neal.frager@amd.com>, Michal Simek <michal.simek@amd.com>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: dwc3: Always deassert xilinx resets
Thread-Topic: [PATCH] usb: dwc3: Always deassert xilinx resets
Thread-Index: AQHcfy9dgzbCYKtHtUStePNrj7tTSLVJBR6A
Date: Fri, 9 Jan 2026 00:49:03 +0000
Message-ID: <20260109004901.ygts6mmcxy4vs3y2@synopsys.com>
References: <20260106171018.501612-1-sean.anderson@linux.dev>
In-Reply-To: <20260106171018.501612-1-sean.anderson@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5979:EE_|BN7PPF521FFE181:EE_
x-ms-office365-filtering-correlation-id: f82a8319-9be0-4ef7-3d8e-08de4f18e293
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZWR5eFU1MzhYMUJBem5oZ0RtOFR6V0plV0loU2QvUTJtOEFCUFc2RVpGUzht?=
 =?utf-8?B?bWorVEE4UG82MWdRZzN3cHhrOVVwdDBzWG5pdWl1aG1vZkVvcjI3b1ptU2hG?=
 =?utf-8?B?VDVvVkZZU1RLd0lRRExaZkNnUW9aUkY5MkZ2OVBjTGhadHNISkFaeFNkdFVU?=
 =?utf-8?B?Nk9qb3dTTUFHQWcxSzJBU0xLd2NBSXZHaVd4NGpCZmlSQUdxN0FvbkVVZ1RT?=
 =?utf-8?B?T1ltK2REdnlWMjZ1UGVOSEgxS1pGM1lYeHEyWkZMOWpBVmlnNWdUTU42QTRm?=
 =?utf-8?B?VG1lcGdKc2w4clY5YThlT1JOdnJTY293SXRTSmlUUkwraXY4ejhZUDBqZTZ3?=
 =?utf-8?B?dHRyaG9GV0ZnN0l1d3IrQnFhQklyUmgrNDRpU0J5S1dnRVpaWVBZaTJBVFFI?=
 =?utf-8?B?RGowRW5PSi95c0dkckdXQitrak1xdWhRekZFdVZoMThpRmRVOUNiYU0wMFhy?=
 =?utf-8?B?RTR4RTJySmpkdXhRSzE0cTNQbTZNZGJJbmQ5LzFoM2pYa0thZG9rNTZoWDJ2?=
 =?utf-8?B?Qm84NzNnU3Y3TzJ6WkNzQ1pOUXpmdnB4dmpaNUJPbWxQNjQ3REFSWjhiMzkx?=
 =?utf-8?B?eHZTd015aVk5Z205OGFyTTNoM0I2UzU1L3ZkR2tBWFNXRExuQlhGVTJma2JO?=
 =?utf-8?B?WURSdXBLTzBMM2tiTkJWS1NBbWEzcUszWlBOaDdScklld3YvWnZsWHk1SlEz?=
 =?utf-8?B?eWtUcUwwRHZhdzFLZjAzeFBDa0M3K00yRUJNK2t2dStZdUNBTnh0TFFCdHpJ?=
 =?utf-8?B?YUtsZEwwSWRuNlVuNklHVVRLcDBUMCtnR2tJM0VZYmg2M3pUbU5TbmkvUDE3?=
 =?utf-8?B?SGNrbGNDL0VTYk4ya0hrekk2Wm9Pd3hic05QVTJUYTJIcEcvMXdzK1Jvd0pI?=
 =?utf-8?B?RXM4ZThndVphZTJ3RU9STlc1NUtadUxaelNtY2NuV3ErOWRFVHFLZWREajdV?=
 =?utf-8?B?di9yMzYrRkpNckV1VzY0VXlOZEZQNHRYanNOWDJiaTRZRENBbmMzTmNSTk9W?=
 =?utf-8?B?M1EyMitwYjZwMXg2SXJWTmNJckVwbzNoS0plSzJXcFlvTFdSK1NTdTd0VmJh?=
 =?utf-8?B?N2trb0tRd0dmUlNFVUQ4SDJLckpQZmZZTi8wM0g3MTZaU2lzcnNmeHVodFhJ?=
 =?utf-8?B?Myt1TjIxZnZlVmJWQldqQ2dsUHR3UEp2Y0hUUDUxMmVYbmxJdER5cEpWZmhQ?=
 =?utf-8?B?UGF2cU1RV0xKVGNPVDk5MVlsTC9wcStqZHB0UjM3UnR4aDhta2p5NlJ4Zmhm?=
 =?utf-8?B?OUpESktuZ1NSY1pnS0hzamVmdVNqa1VwRDVBTzhuY1VvV3ZVTEtZbmRxRFZv?=
 =?utf-8?B?UGU3R1BOVGowS2R1dHV5N1RLNE1qWjFqSHJxS3dmcUErWmM0SjJJbjZmS29Y?=
 =?utf-8?B?VTNwVU1ZYk81R243bFZXOHBwYjZHRURhbTRvZ1JYS0RjWHRCdEI1cGpVMkhh?=
 =?utf-8?B?NHZPekpRVlprUWNYZ1dLTzlybTYxMmhsMUpFRzJ2bzhsODRXL1pPaU9SOENH?=
 =?utf-8?B?UzBJbWlkTjg4alVBeWN1TXNseUU4T0EydEwyOUw1YXBvVW5GWSs1WUV5bVlH?=
 =?utf-8?B?T3NCUTJpUmJaL0ZrWi94TGU2czBHMUFrb0kzZnVBWDEvaGF1dWo2blZuem5w?=
 =?utf-8?B?TWdiUWprdTFucjh0dFJ3SkdUVHZPMFptVWFKbTFpbitMT21LbXBQYW9sMCtP?=
 =?utf-8?B?b2hpd1BNVG1kRmZwQXpoMU85bytLUVZic2RHSFczckhZSlZWMHNTVnlick0y?=
 =?utf-8?B?WXFvc0NwUXozcnpPdStwTXB5aFU0Q1k0cUFlUEk3TzhadDFPbjBJblQvajdU?=
 =?utf-8?B?QW9NR1BYMjUwVjJEUUVJQzNhREdmRENlTTlWU3ZyV3gvcXlSem9WbkRNV3BW?=
 =?utf-8?B?dFVWNDN0aUF4WnlKZXNLS2xDcFI1SGh5TlhwV1NzeS9DYUlOU0FUZGd6dHdt?=
 =?utf-8?B?R2VJejdlSDVnR0haRFhWYVVwZ2ZINGxFYUo1WmlRTVZmN3J6YnlZYjVmOUIr?=
 =?utf-8?B?RTlBeW80U3FvaWNQRmJrYUprVVFha1NyNXNmNHhNdU96ZkwweTRzRXZMVWNa?=
 =?utf-8?Q?nUO8j4?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5979.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UllPTjFiR2JDcFpURTlFYTkxTi81MDNORGN6LzY2MGI1NDgvbHhmUXd3QWlJ?=
 =?utf-8?B?bWUyckVWcVBJcHZEb1JDS3NEeXFsQkxnTG5QbnZVSk91aG1GUXpUNWczS095?=
 =?utf-8?B?K015NlRoODE4NlhoQU5GT1JEanRsWlk1NmFKQi84N1RodDBCQmNEZnNkMFBQ?=
 =?utf-8?B?ZmhPWTRKKy80bDJwbDRyTG1pQkcyOS9CcXErcEhSZ0ZFU1Bid0E5RE1YQ2VU?=
 =?utf-8?B?Wng5NmdXMy9ONlZ5NSs1Vk81WU5lMzJ4UnRtMGYxZ1U4WG5wK2xDRlZZN1pW?=
 =?utf-8?B?dkwvNmFDcXIrU291MWh3ekZ4MTRubTMwUFdYenhSbE54cGQzTjE2Z3lYbWhD?=
 =?utf-8?B?bi9qVU9tK0gzODRzVmowNVVTdUdKTTBXdjJPckZxZ0FjZTR6WG5jK3B2MnFu?=
 =?utf-8?B?MzBqakRaTkZTNkNpcmlMeHNzR2lYTkVWZVZENkI4SjAzNFJKR0ltOVN3Q1JM?=
 =?utf-8?B?Ymd6bkNxaUZDS296aWNyT2x0anV5OExuWlF4Y0NBd2dzK2NTcHB3aWx6SDlX?=
 =?utf-8?B?ME9tblkwdWo1UjZ5VllHNWUxRHhyVGdkM1Z3UUxUSkVBMzYyV1Q2cUdCRXYy?=
 =?utf-8?B?dWRETEgrdlUyQXhZZXQrdk5KUHNDanM3UTAwZDUxdTUxbTNEZHdVbklCN3U3?=
 =?utf-8?B?OUlaL3drT0dKZTVJU1V4Mk9DRG4rTVI0VnpCcW1rYlpZWi8vTUJNUlpkSU01?=
 =?utf-8?B?VXZHSDZuZEhLOEhmb3Q4SWJQeVczUkFJbjByY3dmR2V3d29aaEdmZ0lEL2VL?=
 =?utf-8?B?dDZ4Uk0xVDNsWTJFVTdlMXpaOWRKZENaN2U0V29YNit5eGhKS3pnbVd6d2Ix?=
 =?utf-8?B?eGJwWDRNdFphdERuMHFMTVdjWTU1Ynk0M1Y5QzRuTWlZMUdHeE5FRGZtYlQ2?=
 =?utf-8?B?SWN1SDlpQUFSOXk3R0NtTVo2Zk1zU21JVGozeXFSQTM4Zk9vYVg0UXMxbkhE?=
 =?utf-8?B?bCs5SUUyYkRHS2FSTEloa2xDS3REWVNHUUtody8rRE1kYWRpQ0NnY3Q5U2Jz?=
 =?utf-8?B?L3NJMFZuM0ZWVGZ4NHRMRDkvd1R2bHRFeE8zWVFBNHpjenZTbVJya0NVVzAr?=
 =?utf-8?B?TEVvaVdrOVlUVVVsckZBK3JrRS9uVXkveGVsZ3BZWUNseWc5M0FIRnFjcmZ3?=
 =?utf-8?B?RGllTU1wWnd2aXUzOVlvN3dJRFlRQ1U4RGFZYjhYM09tRXpmemNNTGNSQjdm?=
 =?utf-8?B?WXVWYmVPVlNqVmY5L0lxMmZjYWNoTlBYVnFBNTFtRjJsQmovaC9uNGEwQUFF?=
 =?utf-8?B?dlVwRERwam1Ob0pHZXV2a0VxSzVDSkgrNU5PdzZYNVRhVk5MbWpHUGZpV3hV?=
 =?utf-8?B?MG1pZGIvVS9qRkNYUXZ0d0s4SEZyTlFzV0JIS2VPTGJ4d01vbmlTZkNqQnNX?=
 =?utf-8?B?ekdPRWE1Z29uL2ZpaWRmMXJOb2k5Z3VpTVZKS1FlUHdKUnRzeTA5UCtkeXRT?=
 =?utf-8?B?ZUgvd3RxMHU2TGRpcGQ5V1RZeEw4eHBoU3VMVEE2Q0JTMG9vcHBieHNVOVND?=
 =?utf-8?B?SkFza0g2dlZLV2kwUDRramhYbmV4eVFtOThhNHlnaW9JbzYrRmdqZktTV21i?=
 =?utf-8?B?Z0dNUm5ZMktWQ3lqRWszVm1VS1NURklNQmM1WEFpNnRqbjEySGVSYWZ0R1Jw?=
 =?utf-8?B?QzhUYUlhNC9SM0VKTTNTbWxaQnorR3pEdUI2anZPUHlhRHBXNy9WUTRoa29r?=
 =?utf-8?B?ck9UR0lwRzdIcFcyVlVpUVkyTm0xM1dkc3lvNHBab28wZGpOYjFMN1huUVl4?=
 =?utf-8?B?Q2I1VGlzNy9ja0VScVU3eCs0b2prUlJnWC9iMFpaZlBWeG10RUxkdG5vSGpj?=
 =?utf-8?B?UExKa0FTRGpXOTZQcmYxcUpQNWFxTEw3QmlEczRPN00relR6UWlscnJ1dGpn?=
 =?utf-8?B?M0gvaDJPN3NNM2FWK1dGWDZtcGt3cnhnT1M3UEFsYTZCSGs0QTlCL2hFRURY?=
 =?utf-8?B?bm5XQk9EUUltb3hEUW9kQW92ckM1bXB6UGQxWWVBZjVReG8wWVhpeFlYMzEv?=
 =?utf-8?B?TlhPYVRPdUYxaERRUGJJdnF2V0RQZy9NbXFHUno4aGVObUFkaTN0M1NmcS9Y?=
 =?utf-8?B?U283aVFjQ3o2OVZSUTU0Tmh4b2xJcXZ3THhJT3MrWE9TdmZSWTN6cFYyRlI0?=
 =?utf-8?B?SXhpRnIwaURIN1pFWnlFa2h1NGw3TWpPY2NoOHU3RjFFTmFIOUNaeFZZcHZh?=
 =?utf-8?B?TW9ZTVhLc0hHa2dXNkVRVkhHUXdiNDlsbTlFd29na09DZzk5U3pXRVBpWlpv?=
 =?utf-8?B?STZ3Tm5FZDc0VlpiR2MrYlk2TldsMzJuZ1p4M1JlN3FMNUNkZVBMejBZdk5X?=
 =?utf-8?B?eUlkYTJjVWZNdnk3TmdCNG8xVW51ZE1sMHJmMWl0NzhlTjN4MTNPUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF02C0D49B977B4EA3B644FDCFF8A33F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZoSWaCSXyHDJFWVbQE/M8ryLu76AXcMQGE03B5VcPFcGwTxloN+6ZQFM4rBADdGUWqhQt8vcNI4HZsYEkm7/vr2ra3kFV+WE4AYoOjaanQy9s7JJsqEVLaDv3EVI6b7oUdVwXTxhOd4kcn7z/Is/ByOeGjuxCvfGNmhufoh1ROMsnMzDBlt5Z5LJxKhPNA2pwpCZWN5+pHl5aFyBnYjeBBj8UmwONpxCHIvNYC3ROa0UdOjR0tTj8tEGl2C5yRTVyGCYRLi5zy2kJm0inepHxGwC96zSPRMY83+jzrK6Wpq3+SnWZo2L/gUo2EXjqTi0BDUbOFR11lm2iWLVU4Si6QghJpO1DHw6C71rRd0CMpE5V+SMaAs0FDQnfbxO5AEcl76gIhrdxsTxRTAfotufha/+10Pq7LKZVhKLyM1bxNDn0m2Uhkq8qrKtim4InBRqxhfkTd05e3ydpOlKwV5mJWGRBpCfatuUq4BCOmAqv5ZqZ5oHl6awtPYoeGF4UnhpdDme7rWY6SPcMtij073Q0lLLVZKrE0oPtfa5fgpkrAnM1RBs9T2vEVjqhffIujNRTmyqCR5ZV9IfKOVnARxWopku6AGbppoz1zXQQQtC+z7Ue1YpatSmRPJV7x7n574A9F2Z3PX+wu9PwPIGckDn4Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5979.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f82a8319-9be0-4ef7-3d8e-08de4f18e293
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2026 00:49:03.2251
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /UlpKGtHtCaaS1isgxPSxKr59VzWByQEUFFCQe7ptxE/SpJz3SKZZy2UZ2O4S14r6SRb8kAl+PeEOKuDu9OyXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF521FFE181
X-Proofpoint-ORIG-GUID: ml2mxCjglDrukLXBV88LQSabIrcTH9pB
X-Authority-Analysis: v=2.4 cv=N7Ek1m9B c=1 sm=1 tr=0 ts=6960508a cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jIQo8A4GAAAA:8 a=qSFkb6UVmwQOIE8veu0A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAwNSBTYWx0ZWRfX2KIp5qqiY0C2
 S8m6XIr8Rn1QwrH1A9bmHMf2Gft2NpTFQnsSsVe3NDHl2ofeIorgo5qqZXC8aDvdLMUdJoXznxt
 diwDc1FHRxo6OLfA2EOoy80NC68NBVTVgd60Jk4TsNDsq0xts/qtg1W0tKVowLwKi4WXAu/Bm7J
 peSsacRt86qlyZP8GfDX1JeS2HfamyLEkwNpcjqqTzoj2r/NmUbXrwSsEjyUgmJsoomPtAeEkSq
 Z7C4hQAiewl4GPwWa2TQoM9ZwWXVxRLFH+ybOscUarvJ58ML+lMHcFlbcwsVcpcBEg8Xw3/cRPd
 3YT6qkTxBY/bxDerVWlN8jp4m0vPnV8aTxujSU0h7z1DQhLrrGJMFugeS8UsvPjNU38H87Kpwb1
 HFLdFGN3fkCdnzeKNsEb6oI8u1ZY3Wmro69yFYlo75bGt/ipyxsTy2eeNuAe6aFSeJTtfu2CX2U
 2qWBO1FveKEeXbqzvJw==
X-Proofpoint-GUID: ml2mxCjglDrukLXBV88LQSabIrcTH9pB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1011 spamscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2512120000 definitions=main-2601090005

T24gVHVlLCBKYW4gMDYsIDIwMjYsIFNlYW4gQW5kZXJzb24gd3JvdGU6DQo+IElmIHdlIGRvbid0
IGhhdmUgYSB1c2IzIHBoeSB3ZSBkb24ndCBuZWVkIHRvIGFzc2VydCB0aGUgY29yZSByZXNldHMu
DQo+IERlYXNzZXJ0IHRoZW0gZXZlbiBpZiB3ZSBkaWRuJ3QgYXNzZXJ0IHRoZW0gdG8gc3VwcG9y
dCBib290aW5nIHdoZW4gdGhlDQo+IGJvb3Rsb2FkZXIgbmV2ZXIgcmVsZWFzZWQgdGhlIGNvcmUg
ZnJvbSByZXNldC4NCj4gDQoNCj4gU2lnbmVkLW9mZi1ieTogU2VhbiBBbmRlcnNvbiA8c2Vhbi5h
bmRlcnNvbkBsaW51eC5kZXY+DQo+IC0tLQ0KPiANCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy14
aWxpbnguYyB8IDY3ICsrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0NCj4gIDEgZmls
ZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAzNSBkZWxldGlvbnMoLSkNCj4gDQoNClRoaXMg
c291bmRzIGxpa2UgYSBmaXguIERvZXMgaXQgbmVlZCB0byBiZSBDYyBTdGFibGUgYW5kIGJhY2tw
b3J0ZWQ/DQoNClJlZ2FyZGxlc3MsDQoNCkFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5n
dXllbkBzeW5vcHN5cy5jb20+DQoNClRoYW5rcywNClRoaW5oDQoNCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdXNiL2R3YzMvZHdjMy14aWxpbnguYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy14aWxp
bnguYw0KPiBpbmRleCAwYThjNDc4NzZmZjkuLmY0MWIwZGE1ZTg5ZCAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMv
ZHdjMy14aWxpbnguYw0KPiBAQCAtMTMyLDIxICsxMzIsNiBAQCBzdGF0aWMgaW50IGR3YzNfeGxu
eF9pbml0X3p5bnFtcChzdHJ1Y3QgZHdjM194bG54ICpwcml2X2RhdGEpDQo+ICAJCWdvdG8gZXJy
Ow0KPiAgCX0NCj4gIA0KPiAtCS8qDQo+IC0JICogVGhlIGZvbGxvd2luZyBjb3JlIHJlc2V0cyBh
cmUgbm90IHJlcXVpcmVkIHVubGVzcyBhIFVTQjMgUEhZDQo+IC0JICogaXMgdXNlZCwgYW5kIHRo
ZSBzdWJzZXF1ZW50IHJlZ2lzdGVyIHNldHRpbmdzIGFyZSBub3QgcmVxdWlyZWQNCj4gLQkgKiB1
bmxlc3MgYSBjb3JlIHJlc2V0IGlzIHBlcmZvcm1lZCAodGhleSBzaG91bGQgYmUgc2V0IHByb3Bl
cmx5DQo+IC0JICogYnkgdGhlIGZpcnN0LXN0YWdlIGJvb3QgbG9hZGVyLCBidXQgbWF5IGJlIHJl
dmVydGVkIGJ5IGEgY29yZQ0KPiAtCSAqIHJlc2V0KS4gVGhleSBtYXkgYWxzbyBicmVhayB0aGUg
Y29uZmlndXJhdGlvbiBpZiBVU0IzIGlzIGFjdHVhbGx5DQo+IC0JICogaW4gdXNlIGJ1dCB0aGUg
dXNiMy1waHkgZW50cnkgaXMgbWlzc2luZyBmcm9tIHRoZSBkZXZpY2UgdHJlZS4NCj4gLQkgKiBU
aGVyZWZvcmUsIHNraXAgdGhlc2Ugb3BlcmF0aW9ucyBpbiB0aGlzIGNhc2UuDQo+IC0JICovDQo+
IC0JaWYgKCFwcml2X2RhdGEtPnVzYjNfcGh5KSB7DQo+IC0JCS8qIERlc2VsZWN0IHRoZSBQSVBF
IENsb2NrIFNlbGVjdCBiaXQgaW4gRlBEIFBJUEUgQ2xvY2sgcmVnaXN0ZXIgKi8NCj4gLQkJd3Jp
dGVsKFBJUEVfQ0xLX0RFU0VMRUNULCBwcml2X2RhdGEtPnJlZ3MgKyBYTE5YX1VTQl9GUERfUElQ
RV9DTEspOw0KPiAtCQlnb3RvIHNraXBfdXNiM19waHk7DQo+IC0JfQ0KPiAtDQo+ICAJY3JzdCA9
IGRldm1fcmVzZXRfY29udHJvbF9nZXRfZXhjbHVzaXZlKGRldiwgInVzYl9jcnN0Iik7DQo+ICAJ
aWYgKElTX0VSUihjcnN0KSkgew0KPiAgCQlyZXQgPSBQVFJfRVJSKGNyc3QpOw0KPiBAQCAtMTcx
LDIyICsxNTYsMzEgQEAgc3RhdGljIGludCBkd2MzX3hsbnhfaW5pdF96eW5xbXAoc3RydWN0IGR3
YzNfeGxueCAqcHJpdl9kYXRhKQ0KPiAgCQlnb3RvIGVycjsNCj4gIAl9DQo+ICANCj4gLQlyZXQg
PSByZXNldF9jb250cm9sX2Fzc2VydChjcnN0KTsNCj4gLQlpZiAocmV0IDwgMCkgew0KPiAtCQlk
ZXZfZXJyKGRldiwgIkZhaWxlZCB0byBhc3NlcnQgY29yZSByZXNldFxuIik7DQo+IC0JCWdvdG8g
ZXJyOw0KPiAtCX0NCj4gKwkvKg0KPiArCSAqIEFzc2VydGluZyB0aGUgY29yZSByZXNldHMgaXMg
bm90IHJlcXVpcmVkIHVubGVzcyBhIFVTQjMgUEhZIGlzIHVzZWQuDQo+ICsJICogVGhleSBtYXkg
YWxzbyBicmVhayB0aGUgY29uZmlndXJhdGlvbiBpZiBVU0IzIGlzIGFjdHVhbGx5IGluIHVzZSBi
dXQNCj4gKwkgKiB0aGUgdXNiMy1waHkgZW50cnkgaXMgbWlzc2luZyBmcm9tIHRoZSBkZXZpY2Ug
dHJlZS4gVGhlcmVmb3JlLCBza2lwDQo+ICsJICogYSBmdWxsIHJlc2V0IGN5Y2xlIGFuZCBqdXN0
IGRlYXNzZXJ0IHRoZSByZXNldHMgaWYgdGhlIHBoeSBpcw0KPiArCSAqIGFic2VudC4NCj4gKwkg
Ki8NCj4gKwlpZiAocHJpdl9kYXRhLT51c2IzX3BoeSkgew0KPiArCQlyZXQgPSByZXNldF9jb250
cm9sX2Fzc2VydChjcnN0KTsNCj4gKwkJaWYgKHJldCA8IDApIHsNCj4gKwkJCWRldl9lcnIoZGV2
LCAiRmFpbGVkIHRvIGFzc2VydCBjb3JlIHJlc2V0XG4iKTsNCj4gKwkJCWdvdG8gZXJyOw0KPiAr
CQl9DQo+ICANCj4gLQlyZXQgPSByZXNldF9jb250cm9sX2Fzc2VydChoaWJyc3QpOw0KPiAtCWlm
IChyZXQgPCAwKSB7DQo+IC0JCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGFzc2VydCBoaWJlcm5h
dGlvbiByZXNldFxuIik7DQo+IC0JCWdvdG8gZXJyOw0KPiAtCX0NCj4gKwkJcmV0ID0gcmVzZXRf
Y29udHJvbF9hc3NlcnQoaGlicnN0KTsNCj4gKwkJaWYgKHJldCA8IDApIHsNCj4gKwkJCWRldl9l
cnIoZGV2LCAiRmFpbGVkIHRvIGFzc2VydCBoaWJlcm5hdGlvbiByZXNldFxuIik7DQo+ICsJCQln
b3RvIGVycjsNCj4gKwkJfQ0KPiAgDQo+IC0JcmV0ID0gcmVzZXRfY29udHJvbF9hc3NlcnQoYXBi
cnN0KTsNCj4gLQlpZiAocmV0IDwgMCkgew0KPiAtCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBh
c3NlcnQgQVBCIHJlc2V0XG4iKTsNCj4gLQkJZ290byBlcnI7DQo+ICsJCXJldCA9IHJlc2V0X2Nv
bnRyb2xfYXNzZXJ0KGFwYnJzdCk7DQo+ICsJCWlmIChyZXQgPCAwKSB7DQo+ICsJCQlkZXZfZXJy
KGRldiwgIkZhaWxlZCB0byBhc3NlcnQgQVBCIHJlc2V0XG4iKTsNCj4gKwkJCWdvdG8gZXJyOw0K
PiArCQl9DQo+ICAJfQ0KPiAgDQo+ICAJcmV0ID0gcGh5X2luaXQocHJpdl9kYXRhLT51c2IzX3Bo
eSk7DQo+IEBAIC0yMDEsMTEgKzE5NSwxNSBAQCBzdGF0aWMgaW50IGR3YzNfeGxueF9pbml0X3p5
bnFtcChzdHJ1Y3QgZHdjM194bG54ICpwcml2X2RhdGEpDQo+ICAJCWdvdG8gZXJyOw0KPiAgCX0N
Cj4gIA0KPiAtCS8qIFNldCBQSVBFIFBvd2VyIFByZXNlbnQgc2lnbmFsIGluIEZQRCBQb3dlciBQ
cmVzZW50IFJlZ2lzdGVyKi8NCj4gLQl3cml0ZWwoRlBEX1BPV0VSX1BSU05UX09QVElPTiwgcHJp
dl9kYXRhLT5yZWdzICsgWExOWF9VU0JfRlBEX1BPV0VSX1BSU05UKTsNCj4gLQ0KPiAtCS8qIFNl
dCB0aGUgUElQRSBDbG9jayBTZWxlY3QgYml0IGluIEZQRCBQSVBFIENsb2NrIHJlZ2lzdGVyICov
DQo+IC0Jd3JpdGVsKFBJUEVfQ0xLX1NFTEVDVCwgcHJpdl9kYXRhLT5yZWdzICsgWExOWF9VU0Jf
RlBEX1BJUEVfQ0xLKTsNCj4gKwlpZiAocHJpdl9kYXRhLT51c2IzX3BoeSkgew0KPiArCQkvKiBT
ZXQgUElQRSBQb3dlciBQcmVzZW50IHNpZ25hbCBpbiBGUEQgUG93ZXIgUHJlc2VudCBSZWdpc3Rl
ciovDQo+ICsJCXdyaXRlbChGUERfUE9XRVJfUFJTTlRfT1BUSU9OLCBwcml2X2RhdGEtPnJlZ3Mg
KyBYTE5YX1VTQl9GUERfUE9XRVJfUFJTTlQpOw0KPiArCQkvKiBTZXQgdGhlIFBJUEUgQ2xvY2sg
U2VsZWN0IGJpdCBpbiBGUEQgUElQRSBDbG9jayByZWdpc3RlciAqLw0KPiArCQl3cml0ZWwoUElQ
RV9DTEtfU0VMRUNULCBwcml2X2RhdGEtPnJlZ3MgKyBYTE5YX1VTQl9GUERfUElQRV9DTEspOw0K
PiArCX0gZWxzZSB7DQo+ICsJCS8qIERlc2VsZWN0IHRoZSBQSVBFIENsb2NrIFNlbGVjdCBiaXQg
aW4gRlBEIFBJUEUgQ2xvY2sgcmVnaXN0ZXIgKi8NCj4gKwkJd3JpdGVsKFBJUEVfQ0xLX0RFU0VM
RUNULCBwcml2X2RhdGEtPnJlZ3MgKyBYTE5YX1VTQl9GUERfUElQRV9DTEspOw0KPiArCX0NCj4g
IA0KPiAgCXJldCA9IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQoY3JzdCk7DQo+ICAJaWYgKHJldCA8
IDApIHsNCj4gQEAgLTIyNSw3ICsyMjMsNiBAQCBzdGF0aWMgaW50IGR3YzNfeGxueF9pbml0X3p5
bnFtcChzdHJ1Y3QgZHdjM194bG54ICpwcml2X2RhdGEpDQo+ICAJCWdvdG8gZXJyOw0KPiAgCX0N
Cj4gIA0KPiAtc2tpcF91c2IzX3BoeToNCj4gIAkvKiB1bHBpIHJlc2V0IHZpYSBncGlvLW1vZGVw
aW4gb3IgZ3Bpby1mcmFtZXdvcmsgZHJpdmVyICovDQo+ICAJcmVzZXRfZ3BpbyA9IGRldm1fZ3Bp
b2RfZ2V0X29wdGlvbmFsKGRldiwgInJlc2V0IiwgR1BJT0RfT1VUX0hJR0gpOw0KPiAgCWlmIChJ
U19FUlIocmVzZXRfZ3BpbykpIHsNCj4gLS0gDQo+IDIuMzUuMS4xMzIwLmdjNDUyNjk1Mzg3LmRp
cnR5DQo+IA0K

