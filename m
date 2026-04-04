Return-Path: <linux-usb+bounces-35988-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uD+0JryQ0WlfLQcAu9opvQ
	(envelope-from <linux-usb+bounces-35988-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 05 Apr 2026 00:29:16 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DF96D39CC1A
	for <lists+linux-usb@lfdr.de>; Sun, 05 Apr 2026 00:29:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DBF4F300D9F9
	for <lists+linux-usb@lfdr.de>; Sat,  4 Apr 2026 22:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED5B359A8A;
	Sat,  4 Apr 2026 22:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DGXuCRYp";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fy3/2nL1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EJu5nzm+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDCA370D71
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 22:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775341730; cv=fail; b=ctTKZtWBbUmak68K1ToOEDTm0H9MoThPmu9oTSHgDVjGUwnDykJNYagfVZPsCuFG6TekYcQ/zTD2wKzM8k6qNHZ2n/VTVQ+SKs+JOiZ7vWx7Bf1F5g3ZfDGNNVNRD6i4BtVQyV8Yv1pMiYNstN1vDcaxblAA2Ni+GS2TqgPvkvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775341730; c=relaxed/simple;
	bh=TuedmRi5XvQnho0ONCY8rRSc86yN7TPqX6oTwQwa0ow=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dX3goGY5n42ZOh4xG6puaY89pJyaIIi82vvduTpVrAlBC3Ep9pSkIbhVAcdl1pYZ6wA1Rx+x3utvSi/3WxjkXY/BU+S9n2mzoQt2fMDZ8wEFcIWVUCJttgTw7GvS+gvMqJmTQqwGZ/k3ze6s6UoN6d2dE8jYpcg2oScQANty8Ig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=DGXuCRYp; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=fy3/2nL1; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=EJu5nzm+ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634BZVBj915105;
	Sat, 4 Apr 2026 15:28:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=TuedmRi5XvQnho0ONCY8rRSc86yN7TPqX6oTwQwa0ow=; b=
	DGXuCRYp+IU0S+C2ry7lv4sg7HGmAhp66ai7sMjaFNs+zehjkD+nb7uLmfelzWOg
	P31c4r9J+waJLdOoLJChF+J2DPB/XGxwjm0ADP9dF6ESIDzbrQwwRAc7Pfnfdt/F
	8PQc2ZfV6QEHpyhLJXKd1h3qSwy2249jmENU+c/zCiSEYZIWvV1S/40A4UTjxofv
	O0hyGzTnFM7upCyLd6h0mOdxx79/txC/7FUW2huetHCy0bAnufoUGyXmxhGv06zm
	G2vHQB5Q3qaZe9C9/heC7+uXhhemVKkLbEjxZYp40m05t/apGCXfMGsS0PUxkU1z
	NKKC8WtODnskdQFsi8NTmA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4db1w0sbk4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 04 Apr 2026 15:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1775341712; bh=TuedmRi5XvQnho0ONCY8rRSc86yN7TPqX6oTwQwa0ow=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=fy3/2nL1DPsRA9S0lYvtZCLI8NTKcBlxnr4fYQlsXZt65HAc5f22oecICEpwjgctY
	 2S0anRR+T7NoaXo+TC1C0jArcp4bhXbpCk9I2NciStEiIbdSNvGsKxeOsBIX3CmAxt
	 7PieP2IgMoKRZGAOQASJKoFUhrDV9iQo+TrhFgL1vomhTkemnT7di8/DMaVNTQhzxV
	 0bTswNJMnA+Yuzq4/4UWOllEJ23hnCMEkKqPmbYpLuDFiiDZV6houQkR4sHNH8UAOc
	 y46A5DailzAp/pnAlWV+f5E4+qH2pG551iIlWpA0TfPpXoGaabmGNc9HdI0qV49EGB
	 8OaGJnRr7iUbw==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5FD0A40136;
	Sat,  4 Apr 2026 22:28:32 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 35DD7A01FD;
	Sat,  4 Apr 2026 22:28:32 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=EJu5nzm+;
	dkim-atps=neutral
Received: from DM2PR04CU003.outbound.protection.outlook.com (mail-dm2pr04cu00302.outbound.protection.outlook.com [40.93.13.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "Microsoft TLS G2 RSA CA OCSP 16" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9A50D40362;
	Sat,  4 Apr 2026 22:28:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s6XIr17XWU0Ei4Gig3x8PObnb6JbspWjfQaaoFdXq0FZVeGsz6HLG3+zlL/yj/+m318ilylCt5WsgFnH8cSzhF1gAvqh4NU1w+d5RFoDy+fdJgOJ6Poa66XC+aIrnpjFZA5WI/x+h+gu9oHevopMfELVDD9U4gLlSRbso2MT83LC+6ESGX6Yp4Y0cl+Qxzn+4lsWPYDovoIt82ImJN/uomyDzSevMRwuQbY9eqE3KU52bCHBrdeI3hBZ2ltLJN03bBLXajD8lino46jJkx8/TnX8+DyzZO2qwjntYESvmxMTPyNGodlW11qZhfQ73gQqOhRVT7k83iSFtN/QepQKvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuedmRi5XvQnho0ONCY8rRSc86yN7TPqX6oTwQwa0ow=;
 b=YxYfwVwwEA4dkXSPjQ/6v+LcICj2W841QEDI/iw2jpZyN9UQuEpmTwGn8sDv2HX0mLeqas8TdSvfHeqss6fiQs9bmD0IyQ1ZFloAzk9s2lw7qYgiB0Jzh9f0sl9EobNTe0VdFtq58d6+6DqrSB0e9wknG8bZ+/75RmjW50NahbypE3Zu/ImJFUX9upyfsMmbhqvicTaBQ2dyRZSVqw0b4P4kNa8/+rBHshX724IdB5Ee7fPAgMAyOIkiydd5XnqpzkqOgeQmZbcpLTsRudQ/Bk9gQVl1wbDKjIwicdVbD7rT5fmko81RHYb4kO+lTCG0+yPKJVCyP6q4MWeStmIdzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuedmRi5XvQnho0ONCY8rRSc86yN7TPqX6oTwQwa0ow=;
 b=EJu5nzm+itB6dlM3OuE4RZE83xpoyNyVMXsveyZIn8g+AP9F5a8GKBXq7cH4HJl7dP0Pj0yY90lrLBCjU1kiJDIKeFHKWAcTH83gD4LOQJ1LabGpuvs7t4/tLrdTCnkVcZ/c2yXW5Kyeh/Wg4kw0GnmvnVCfZkda5+6QBQhykPk=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by MN0PR12MB6199.namprd12.prod.outlook.com (2603:10b6:208:3c4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Sat, 4 Apr
 2026 22:28:25 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9769.020; Sat, 4 Apr 2026
 22:28:25 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: Mathias Nyman <mathias.nyman@linux.intel.com>,
        "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>,
        "michal.pecio@gmail.com"
	<michal.pecio@gmail.com>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Thread-Topic: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Thread-Index:
 AQHcusCFdimQniQh+kKFqQp1mqfuYbW+fjMAgACCooCAAQbCAIAAqVYAgADI0gCABZiuAIAAGBMAgAFDQQCAAGOTgIACAVGAgABK5wCAAYgPAIAAC/aAgAF5+wCAAArwAIABOtuAgAAUdoCAAAXNgIAAA5AA
Date: Sat, 4 Apr 2026 22:28:24 +0000
Message-ID: <20260404222818.t5y52gnd2gvalvp5@synopsys.com>
References: <86876c62-01d2-45da-81f3-7d4499ffa0ad@rowland.harvard.edu>
 <50e61cf7-cce9-45b4-884e-ac65f5e771d7@linux.intel.com>
 <07351d72-5cdb-45e8-90af-311a0dc49718@rowland.harvard.edu>
 <20260403015950.lx4n4zdqki37dy27@synopsys.com>
 <28a00143-85fa-4043-93a0-c2b687ff1bcd@rowland.harvard.edu>
 <20260404011530.aukxllvizvmc3f3x@synopsys.com>
 <616e2a64-6feb-4ee6-bf39-a6284549f18f@rowland.harvard.edu>
 <20260404204133.3mcizeeokw3ln5r4@synopsys.com>
 <243af5f2-3925-4960-be7b-8d0c273ae629@rowland.harvard.edu>
 <20260404221533.woepax7jxwefy3fq@synopsys.com>
In-Reply-To: <20260404221533.woepax7jxwefy3fq@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|MN0PR12MB6199:EE_
x-ms-office365-filtering-correlation-id: 080edf45-8385-4a69-4a33-08de92997c93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 kU7KbTDBw5/SxKktmm7ncmydYu73suDIeb3eND+7UG15nd7inapOM0UhmRzyCtclpsFzkH35hc+WZCqxBrU25xZaKqTbzkIywhe1npJIe0nD+cmoUZd3iGSbOC5v3Cx11+rllFzlpmfeaboCt/IDtUaqgynzkoZxa+XEl2P9ldNl/gILkb8G3KZWvmYMRfuCqUru1rNYsnbJ9n4Moqkadl3bLUqK1LNYgPuoE3Lvj3ur7iF6ff6CCEtpJayBuy4KIs8PuiOFhScIssaBsPZSl/pXPTUKO4rUUnqFDHSsl+P9xAS+w7Cw7KsbW2C4D7BUFvaHxcuYlhadYaCA6ipPgf2OEqjWfeA65A4/uayh9x/rgOl5+oyOOeeFP+oxrphnnufef2bJq/ec9A+CTWlpeZLLZNZ6+R1de+NeC3sWWawub03iEjlYTAVrqlNaJpkGcl613ZNQwWI3sDt/d3aOqYZlolg2in9pUfl7RQLoQCAi9asAAthTvQXAVJyBhxIHrC6uSNtrOitPra+sKvbx9VtlYa949akACO7c4ruf0wsqPz0GfX+wvtXZSf/1NiaLrQm+HI2TUGtrCmsJzv+6b8x6njJ8vzqEgt6UjWsOOhccweGqJDCijc9diQkyCG/g5n+ZXlbn5t/lLbHpQmxmiL3HQAgelvnlOE4HJ3gwANZ3+0Bf2BqwViavdjHco0tRz2ZrltxPZlAa9b+gmNxw5WLS2afocenyv+qbGPZ9Su2L9IKFkeTIgleJTVq31OP3ANlrfxCvtJDJ6JtDlKvC3KEShH696ed7msEzrt16Mf4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZDZFelVSOFlIWElpQXRnajlVdEhFMVVxMWFtSDlxalpoQ3Y1dCt0QlNzY0tF?=
 =?utf-8?B?WWl5UnJsYkwxUkE5VVBRWFlVWHVEZVlYVXgrL3FkU2FyZEN3N0hwZGpFYm1K?=
 =?utf-8?B?TjV2R1dPUWYyN1hxU21STGNqMDZRWDFsYnJqelF3YWJPekRRSmJlV2RoaGtz?=
 =?utf-8?B?clc2bHZ0SmY2NU9IRWZXMit2S0ZTOWJtT2M0eXVINzBmdVNhVmFXanptQzk0?=
 =?utf-8?B?Z0pIVCtPdGJTeHo4WHA2TnNHYk9Jam5NbEVJdEp4RHVYSDdtWklBT0g0UzlD?=
 =?utf-8?B?MzhyMkVZYzAyMlRTbnpuVXlxNVhHTWZvc011eGxkd0UrTDVBcjNDMWpmd0F4?=
 =?utf-8?B?RDdIUUJvOVpwMWNobVFOZGM2MEY1dXNJYXVlaXJXYlJtQ0VCdHFhYWJSTzgw?=
 =?utf-8?B?djdwdU50RWFxVkQzaEorMzNmR2E5bHR6VnpoYmZrWWl1bkFrNlJOcUpBeXBU?=
 =?utf-8?B?RGtLSGhENUxCV2ZNeXhTM1I5QXVQRk9PZDZyTG1uNlN2M2FPbG0vaTU3Y25Q?=
 =?utf-8?B?Y0FMVkxCZnU0bmhlY2E0ZDZMdXZQY0JQOCtUV0Y4UkN5NTBRZjYzRlJqYjdr?=
 =?utf-8?B?R0wyM3JndjhvaG96RTVmb24vYUdBY1dINzZjQ2JmcnVmLy9HU0FBYXhXUVA0?=
 =?utf-8?B?YTUzSHZZQ1NMVWozZUFZMFJib3NQS1RHWmd4a1h5bVlQUDdYNHExeGpYaFdN?=
 =?utf-8?B?YUh4Q1AxZWNIMjlSTEw5MTJTVm5ra0xDczFaSW10Ukt4UU5NcUM0WXM4YmJP?=
 =?utf-8?B?T3B6V05TdXUvNjNTNzdRNzJjczRMQTN0MnBxdjNOWWtnQnR5a3Z6VmVBd2Z0?=
 =?utf-8?B?Rk8wNkxRU2dLTnJnd2xibitac0xqdWtqTjhJRE9hcVQ4b2gvR1N1ekNPOWZw?=
 =?utf-8?B?OHlpbVZQaGc3bGxiSGxOdkRPa2hrU1BFdWFKeTJYWGpOcVlQZndoT3Z3SGo0?=
 =?utf-8?B?VXhTakVVUGhjU2o5NVE5SjBLMmVqNDdMYWV6blNXTzdnUDFqZkZra25mQXpT?=
 =?utf-8?B?ZE9qWVVEM2tWSXF5RjJYeEg3QUJoSDdBbjhXWUpuZUpjMnlwTG1xMER4Q09S?=
 =?utf-8?B?Sk9vVldTOWFLL3lFUGo3NFFvZUd5SXcxb0JPUmN5ZlFKckN0eG9hTWJsVDlS?=
 =?utf-8?B?eXF0TjBYN1B1a2FTRGpuRVJPOXN5SStrNWFIMHMwNjdNdDROdFUyOVNlVEtm?=
 =?utf-8?B?NWpFV3RnNjZvZTdSbHNuQTVtRDRSZllHS3dhb0xuY0hWcFRabmROMlc1ZGhx?=
 =?utf-8?B?UFUyM3dZTytXc09BemVPS1dOV08xMjRWdDdROXhsaHcxOVVhSUpFQTBJK1Mx?=
 =?utf-8?B?ekF4TitheUJxaXRwTVM0TGtpMzE2MWJJak9qS2RSMUdKNS9vTDdRV3RsMU1y?=
 =?utf-8?B?bzFldWw5dW0wdkVXbHJiOWppeGwvN3pIRGFRV2ZoQXY5RHlMcEI5SVNqVjZ6?=
 =?utf-8?B?SHhpMzRnM3RvUDFxVzAxd2o2NnExaW0zTWdxM0l4ZEZJT1lsQ3FiZ1RVV1J5?=
 =?utf-8?B?VzM2cmNVTFlBa3N1dEdkOHVqT3FuaU9PZkVYRFEvQXNvVEEvU1c2MWdsT3hY?=
 =?utf-8?B?S0ZObTgwczBqL2gvQ1hKSlhUR3RWT3NKQmwxVVIwNThyQ1VWZzR1NE1IS3lS?=
 =?utf-8?B?RTR0MzNnMkxhM25LbmRqUHU1NHI5ZlZxc0tLeVAwWStYOXJteFB4T2YzMFdL?=
 =?utf-8?B?bkVtRHdwSG50cm9EcTUxU21oeU84eTFISHkwR1dhVVFGRTZRR0RRK1Bac1VJ?=
 =?utf-8?B?UEdTbVdFOTd6VCtOMTBUMHMrQ2QrQS9vUWQzYWsrRVBTem5oRG1kcVJHQ29w?=
 =?utf-8?B?Y3JRRTdYSkVyRWJWMzJuV1d4am92T3hGbThxZU5IT3FWVlI2ZkxBSTB5TW1S?=
 =?utf-8?B?cWNHYitTVkIzWjFMWWE1ZkFFMy9vRUJLaEFJN0syZmYra0YrU2x5V2dvNngr?=
 =?utf-8?B?VXhaa0NWMVVGeTZaVU1uaHh4cDBoM0Y3SGhqdFZVejdzL3FrK0ZzMnFVUk5x?=
 =?utf-8?B?ZHE0bGtENlBCTXc0YXpuTjlyOHlFTU1Pby91Qy81VmFsOHFaWE0yL2lRNE1p?=
 =?utf-8?B?L2ZPUW1IbEEzS2RrbU1od0NMTklhWG92VWsrYUNBMkIvZHoraWZVa2NlN2FP?=
 =?utf-8?B?d1BlMDRTUk1MQXh3WWJJMGRENm8raHlCeEFPZnB5QnQ3di9iREVsUS83L1I1?=
 =?utf-8?B?Y2hHL0dzMC9zVzBONGxIUUszaGlIWDJDa3NLWnV2RXJESC8ra0JnYzBaeVNs?=
 =?utf-8?B?MGVMOUkxaTgzeVZpS0tZRVE5WUxWV1plMzh0OFdNejNkSXo2cHNDQW9nNWdl?=
 =?utf-8?B?SFdCeXVDK3dmZ0pEKzZjYjZndTRTQ3puNkJVUG5jSjVRajNScm1OUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5024531E7E44444EAB9E5F11675DFA5E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	nV9Wy36MD7UMCGkErF8zHjPFR+cBPuO3LeDKYxEiIeyInlmUR+UM4tFEDxAZQ7+i6jH14GDtG+KqIFThliudWycEn6rYAzUjZvrGDELE554eaIQNlD3yuI2qHOg9ig2jMwjqnq7UPAUPTcjKHPDZExwnORHwGcNIrkWkNbLdtjm06o5yheP4nEyp2DtCVAnIdpOzgvKqfizzEUe3ZG/Fltg5oGY0dcrpt3EEmL1bpAdb+JgvqJyc4XGSOmNcdDwN0IXW9rPi6LrcQN4ehMIuTvdE9Kag62G10CDuIQM5l3uL43Hmi5LgsAREDRevsvqMOYnNidSUmtLB9SC/KU+q7A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eqDMkoiR+WsxiKHeJPlNg/tiN72QQc+ZVuO/W4TsdFZFS+B5whauE9z4N7FKyOYrbkSXSG7EeLX+ZXzdy5WnzXyp+nbaEdA/jwlGYXHLXnG3iOXvl7zX/NtQ+MGoJIYLSOQUwPfpOjSdsPqx+/SS0L43Kc1M35QemSgFMC8w/n0GX1WsvY8wMOHFKvJXHwKEtcV6i+t4OFnuR1FK01my6uFQhccdee2dqfgQsuuRGl6v6rrUlulYrGZg7P4Fff1iq6kd1FBB7YIVonw/nX3QyJvS0QBDZeXLDxXYTV082HUzHMgiLdi3bWL9/5j9XHwpuwkte/Rn7NvxGvJuLjw56BqA4ImcdUHOkHDkuWqx7K4St4u4oSpnNKXrx3meBGrREV6+f87EUZMIUuwBUTnw5hSw3UX0X9efqXygrCwAfbyqbTSbKh93fLFG3lAG1dWsYpwai758CX2vcUdoPDVzFUCF1dFSG5PFGPSuZaFn/SOzjv9PammUXq2C/XKLMzVCFvjXuoY5VI7iPLXwJKHLK7Bmq1PnW3MedOBFcL8v88Lxrv/mESTYGSnW8HQ+NhlRdqPwRQLh868KXKPOuqhhc9b9H6S55uVsYNVJWX0fZ8XzvncBaqCZRIGgHDpErknRWKoHm1bBI407LeIuwm/9yA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 080edf45-8385-4a69-4a33-08de92997c93
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2026 22:28:25.0788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CWhh6wFkqgYVfanFY3QQOjK2W3hcoPyuoZtsEksymNUE0okEuXYn5GdvCBmlpT2VByw6qwmFmuGb4v2XObe5Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6199
X-Proofpoint-ORIG-GUID: QDmaC1KkFUACUUzPrGAupxwix7O0vYT1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIxNSBTYWx0ZWRfX2hqPwW2n3/NP
 lNhdVZvZXbf3m+SwKquglNSbw4vCclTTeHSj/Ezsvf6aASjXs7NMyfi2qtQp0bsVtMH8RfsRJRk
 lQQtp/zctPIV0nHVnOflhQE4TNGQteLW2I/DF+OeT6iGuRYgIkGKiaRb72xeDtb6E6/bsJEHbDs
 7monUeEFhWPrnoqrF3sgudjNNA/QpL3+8eh0rLvQJqNsVuqiapU4VAiC51STml7A+YmPOQO2WlO
 24pXSQ5OeNJMNSUFDK1FsgWJ8cF3rx8NwLXO8LiBp+W3mF3Eq27eXAmJQ6NdqbqCxZCN2+Zfb7l
 cZslFI0AQlhxqjB81Zcyc32fPYQIF4cO758Zadt1Z0//8/vcvSxlNGf7Up57InR/d3dhlhSCEuT
 +wS6nsYnilzyF26bL17Y2XFxbwpdhnbCvkeZXLBQVtUTUD6xpC0MjM4tuSI4qCD/qNq/nuMHcU8
 cbZ3RGCfsO/UnjWXw3Q==
X-Proofpoint-GUID: QDmaC1KkFUACUUzPrGAupxwix7O0vYT1
X-Authority-Analysis: v=2.4 cv=GfwaXAXL c=1 sm=1 tr=0 ts=69d19090 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=d6R8zCEgG4uRRh7NIn8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2604040215
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35988-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,gmail.com,suse.com];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DF96D39CC1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gU2F0LCBBcHIgMDQsIDIwMjYsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gT24gU2F0LCBBcHIg
MDQsIDIwMjYsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+ID4gT24gU2F0LCBBcHIgMDQsIDIwMjYgYXQg
MDg6NDE6MzZQTSArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+ID4gT24gRnJpLCBBcHIg
MDMsIDIwMjYsIHN0ZXJuQHJvd2xhbmQuaGFydmFyZC5lZHUgd3JvdGU6DQo+ID4gPiA+IFN1bW1h
cml6aW5nOg0KPiA+ID4gPiANCj4gPiA+ID4gSWYgdGhlIGNsYXNzIGRyaXZlciB3YW50cyB0byB1
bmxpbmsgcXVldWVkIFVSQnMgd2hlbiBhIHRyYW5zYWN0aW9uIGVycm9yIA0KPiA+ID4gPiBvY2N1
cnMsIGl0IGhhcyB0byBkbyBzbyBpdHNlbGYgaW4gdGhlIGZhaWxlZCBVUkIncyBjb21wbGV0aW9u
IGhhbmRsZXIuICANCj4gPiA+ID4gV2UgY2FuIG1ha2UgdGhpcyBlYXNpZXIgYnkgYWRkaW5nIGEg
dXNiX2ZsdXNoX2VuZHBvaW50X3F1ZXVlKCkgcm91dGluZSANCj4gPiA+ID4gdG8gdGhlIGNvcmUu
ICBJbiB0aGUgbWVhbnRpbWUsIHRoZSBIQ0QgZW5zdXJlcyB0aGF0IHRoZSBxdWV1ZSBpcyBzdG9w
cGVkIA0KPiA+ID4gPiBiZWZvcmUgZ2l2aW5nIGJhY2sgdGhlIFVSQi4gIChOb3RlOiAtRVBJUEUs
IC1FTk9FTlQsIC1FQ09OTlJFU0VULCBhbmQgDQo+ID4gPiA+IC1FUkVNT1RFSU8gYXJlbid0IGNv
bnNpZGVyZWQgdG8gYmUgdHJhbnNhY3Rpb24gZXJyb3JzLikNCj4gPiA+ID4gDQo+ID4gPiA+IFdo
ZW4gdGhlIGNvbXBsZXRpb24gaGFuZGxlciByZXR1cm5zLCB0aGUgY29yZSB3aWxsIGF1dG9tYXRp
Y2FsbHkgY2FsbCANCj4gPiA+ID4gdXNiX2NsZWFyX2hhbHQoKSwgd2hpY2ggd2lsbCBhbHNvIHJl
c2V0IHRoZSBlbmRwb2ludCBvbiB0aGUgaG9zdCBzaWRlIA0KPiA+ID4gPiBhbmQgd2lsbCByZXN0
YXJ0IHRoZSBxdWV1ZS4gIFRoaXMgYWxzbyBoYXBwZW5zIGFmdGVyIFNldENvbmZpZ3VyYXRpb24g
DQo+ID4gPiA+IGFuZCBTZXRJbnRlcmZhY2UsIGVpdGhlciBleHBsaWNpdGx5IG9yIGltcGxpY2l0
bHkuDQo+ID4gPiANCj4gPiA+IEkgbGlrZSB0aGF0IHRoZSBjb3JlIHdpbGwgaGFuZGxlIHRoaXMg
YXV0b21hdGljYWxseS4gQnV0IG9uZSBjb25jZXJuOg0KPiA+ID4gSG93IHdpbGwgdGhlIGNsYXNz
IGRyaXZlciBrbm93IHdoZW4gdGhlIGNsZWFyLWhhbHQgY29tcGxldGUgc28gaXQgY2FuDQo+ID4g
PiBwZXJmb3JtIHRoZSByZWNvdmVyeT8gKGllLiBpdCBzaG91bGRuJ3QgcGVyZm9ybSByZWNvdmVy
eSBpbW1lZGlhdGVseQ0KPiA+ID4gYWZ0ZXIgc2VlaW5nIC1FUFJPVE8pDQo+ID4gDQo+ID4gSXQg
ZG9lc24ndCBrbm93LCBhbmQgaXQgZG9lc24ndCBuZWVkIHRvIGtub3cuICBBbnkgcmVjb3Zlcnkg
VVJCcyB0aGUgDQo+ID4gY2xhc3MgZHJpdmVyIHdhbnRzIHRvIHNlbmQgY2FuIGJlIHN1Ym1pdHRl
ZCBhcyB1c3VhbCwgYW5kIHRoZXkgd2lsbCBiZSANCj4gPiBhZGRlZCBvbnRvIHRoZSBxdWV1ZS4g
IFdoZW4gdGhlIGNvcmUgcmVzZXRzIHRoZSBlbmRwb2ludCwgdGhlIHF1ZXVlIHdpbGwgDQo+ID4g
c3RhcnQgZ29pbmcgYWdhaW4gYW5kIHRoZSBVUkJzIHdpbGwgcnVuLg0KPiA+IA0KPiA+IElmIHRo
ZSBjbGFzcyBkcml2ZXIgd2FudHMgdG8gdGFrZSBzb21lIG90aGVyIGFjdGlvbiAobGlrZSBzdWJt
aXR0aW5nIA0KPiA+IFVSQnMgdG8gYSBkaWZmZXJlbnQgZW5kcG9pbnQpIGJlZm9yZSB1c2luZyB0
aGUgZW5kcG9pbnQgdGhhdCBzdG9wcGVkLCANCj4gPiBpdCdzIGZyZWUgdG8gZG8gc28uICBJdCBv
bmx5IGhhcyB0byBtYWtlIHN1cmUgdGhhdCBpdCBkb2Vzbid0IHN1Ym1pdCBhbnkgDQo+ID4gVVJC
cyB0byB0aGUgc3RvcHBlZCBlbmRwb2ludCB1bnRpbCBhZnRlciB0aGUgb3RoZXIgYWN0aW9uIGlz
IGZpbmlzaGVkIC0tIA0KPiA+IHdoaWNoIGlzIHdoYXQgaXQgd291bGQgZG8gYW55d2F5LiAgKEFu
ZCBtYXliZSBpdCBoYXMgdG8gdW5saW5rIGFueSBVUkJzIA0KPiA+IHRoYXQgYXJlIGFscmVhZHkg
cXVldWVkLCB3aGljaCBjYW4gYmUgZG9uZSB3aXRoIGEgc2ltcGxlIGZ1bmN0aW9uIGNhbGwuKQ0K
PiA+IA0KPiANCj4gVGhlbiB0aGUgeGhjaSBtdXN0IG1ha2Ugc3VyZSB0aGF0IGl0IHNob3VsZCBu
b3QgcmluZyB0aGUgZG9vcmJlbGwgdG8NCj4gcmVzdGFydCB0aGUgZW5kcG9pbnQgd2hlbiBnaXZp
bmcgYmFjayB0aGUgY2FuY2VsZWQgVVJCcy4gSXQgc2hvdWxkIG9ubHkNCj4gZG8gc28gb24gbmV3
bHkgc3VibWl0dGVkIFVSQnMuDQoNCklnbm9yZSB0aGlzIGNvbW1lbnQsIGl0J3Mgbm90IHJlc3Rh
cnRpbmcgdGhlIGVuZHBvaW50IGluIHRoZSBjYXNlIG9mDQp1bmxpbmtpbmcuDQoNCj4gDQo+IFdl
IGNhbiBhZGQgYSByZXF1aXJlbWVudCBzdWNoIHRoYXQgaWYgdGhlIGNsYXNzIGRyaXZlciBzdWJt
aXR0ZWQgdGhlDQo+IHJlY292ZXJ5IFVSQnMgcHJpb3IgdG8gY29tcGxldGluZyB0aGUgdXNiX3Jl
c2V0X2VuZHBvaW50ICh3aGljaCBzaG91bGQNCj4gYmUgZG9uZSBhZnRlciBjbGVhci1oYWx0KSwg
dGhlbiB0aGUgSENEIG1heSBrZWVwIHRob3NlIFVSQnMgb24gYSBxdWV1ZQ0KPiBhbmQgb25seSBw
cm9jZXNzIHRob3NlIFVSQnMgYW5kIHJlc3RhcnQgdGhlIGVuZHBvaW50IGFmdGVyd2FyZC4NCj4g
DQoNCkFjdHVhbGx5LCBhZGRpbmcgdGhpcyBuZXcgcmVxdWlyZW1lbnQgd291bGQgYmUgdHJpY2t5
IGJlY2F1c2Ugd2UgZG9uJ3QNCmtub3cgd2hldGhlciBpdCdzIHJlY292ZXJ5IFVSQnMgb3Igbm90
Lg0KDQpCUiwNClRoaW5oDQo=

