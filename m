Return-Path: <linux-usb+bounces-35960-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ey9PMIVm0GlC7QYAu9opvQ
	(envelope-from <linux-usb+bounces-35960-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 03:16:53 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FA53996CD
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 03:16:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0845303DD00
	for <lists+linux-usb@lfdr.de>; Sat,  4 Apr 2026 01:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 246F722D792;
	Sat,  4 Apr 2026 01:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="nCaLBw7F";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="eG3dWxxE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="na1imLnn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0891FE44A
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 01:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775265409; cv=fail; b=pFJLAAq0BY+VGY3kMmvjhGRYDws/rTZ9bMrumWhqJ9MHStWVgBubY6FF7Rq06f6aSr2mHG7P80N2+lZVjOw7SrG5sMoMUX2sXntJYgmQ5kLr4G/TOYU2aNRAkdDmchJ7O1L3LNhIJXjyg52Ro3vDed9ko2MURYqp0jNWuG0B3k8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775265409; c=relaxed/simple;
	bh=J9nfAsiBxHJcfN4i+xu0COWifclux9/ipT19y1ladNY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lY55pChF72keQFyQoKvbh9fG7/37ldC15EWmU8ECW612nt4+MLJaNhcpqIwlRt6BVBYfd1CZSBEFlgY1pPu/yEuVzAR4/Xvezm3aPKFAU+LFijJ57OLt1rVNQqb80U5MlYvyWuyam9X9XNsyIsLf7mpu/XE1aL4Hl2P58g+MDi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=nCaLBw7F; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=eG3dWxxE; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=na1imLnn reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633KvaN62876078;
	Fri, 3 Apr 2026 18:16:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=J9nfAsiBxHJcfN4i+xu0COWifclux9/ipT19y1ladNY=; b=
	nCaLBw7FFH/ZmXpzzayHaeW0AB7YXnyMsqaU2+ZxHGLOgjtHktb3ttAC9ewYSIae
	Z0H3z0jTD1Kb4Z27/f9+1759mLAdl78ET8vvgyUtcPr0C04zkBGhQoL912GslLcP
	1wK88P2x2a04opgLYJt/ak27veLL4QDBewXX0gVtEbF84Silx/IsRWoj3f6f96Vs
	LAX1j58uCLsAMiHwh8MoEBJZEuf7thJznVdklX3qQW7DTFGS6Xz+lAvyEhQKjOzD
	q9NqjjB3gp+MSdR+8nOtBOq8ZnK+uQ/vPtUHKoDLKACRpIi94zXctDj/3MizSqkp
	YLkAf9E3gnhWeAsGIqeTBw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4da7h3mmy8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 03 Apr 2026 18:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1775265362; bh=J9nfAsiBxHJcfN4i+xu0COWifclux9/ipT19y1ladNY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=eG3dWxxEXKculOid88zwbBJWIXUxp68ZW8cLhLBkxutJGvfjFF0AYyHXqTCo6sbt2
	 HRLMH9lagamE6oJl7pFcW7WhDQjTcpUUbRwTsiLFO/qEr7tAC3DdpucTl4Kn9AlOY1
	 SRBuPsyp8IYRbzoKSgX7e6fVlJzWA2QFlFogV2h5k8QAV3oX6YXb8QXg7dpjrWcKCk
	 BhSQipCvQ2gaA9xOWATqIwPqDvC+u14AkINc2RZXpVXAe/TpDDrUUQrL+XKaQz+xt4
	 V61nyVP7+xyJhmQ/+3Pj0pahFPHbiauPyLq1hPVihU+8i7qoPoteaQENDQqkR/21Wa
	 XBKk32vOPXF/A==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E341C401F3;
	Sat,  4 Apr 2026 01:16:01 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 8A4CCA02C3;
	Sat,  4 Apr 2026 01:16:01 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=na1imLnn;
	dkim-atps=neutral
Received: from DM2PR04CU003.outbound.protection.outlook.com (mail-dm2pr04cu00304.outbound.protection.outlook.com [40.93.13.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6F43640569;
	Sat,  4 Apr 2026 01:16:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fOp6S7WoVptObGZAviwgrWHzhZDnY5HS+RKqqW39urNemUCR6isgZEWLNStDrjbdhKwcKx18YumuDiqK6NQTLl3qbBh9sN2ZFPtvYCXlr6AnFDoGXjxmeGkroEzQmWUBz9KEuEyfI59IRTmci5DAXbreQUGj+5rx+nyYZ5I9B0MFbSS4PUcQ0D1BIqqlXKg1iTSRkOmJbTP6PNVokOcM/Cv/Og6sTthvmZPs2DcsflTx/nh1SbSNEgMolHDGxrtHs5xC8G4aM70AD++geTmEAwCyOV6QOoJXMcpnrs6k2QwSroiCOIo5QwFsWh+WsHU0wYb/gtNFPTMr9gXqNWNtbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9nfAsiBxHJcfN4i+xu0COWifclux9/ipT19y1ladNY=;
 b=M9AtVRMJ5CnKGXJcSUtcSosXeaGT2b19iNTFleWmeb/6fdDi52tOaLJaTfMG1O5S5hjQZ3/yU5Xy6JXZZXs5q4zqPFVT/yWf+hxyGm2O/JvzvI9bkUtXVLGzw3PENq7duRJzOHeD7aPB2+imGOrhSNS1UVnrZUe5qfS5H0e1duVGoYQDtfc+/V0dUQxkzFlfvcqU+TnDP6dp4m4O//DWfZMhFCOuaZduU7utAr7apdTavhq7ArTAU2nrCFUw1m2FzJFt5GJUQzh4x2iU2ibDIknTbjJgHYesTO3FAG3wCBTmxU1U0iRwtm5gwtH7xzICkbUbll8n9gNJUUnAkT7IpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9nfAsiBxHJcfN4i+xu0COWifclux9/ipT19y1ladNY=;
 b=na1imLnnwUP9sOO+0NOJs2ESeC5rLkWWkSoHtYjewgqE7E+o6LIXpjbwW30rjiaH3QxqzEElHKoqoEAE9pb7NHC7M6S7TuRdTe/yC+Zfdd+yenhUqzv0aWTSru1g0zIPlHtEB/tX+TYLi4eYA1vLzDBqziKFxdMjBwDwk85z/VI=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DM4PR12MB6640.namprd12.prod.outlook.com (2603:10b6:8:8f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Sat, 4 Apr
 2026 01:15:53 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9769.020; Sat, 4 Apr 2026
 01:15:52 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
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
 AQHcusCFdimQniQh+kKFqQp1mqfuYbW+fjMAgACCooCAAQbCAIAAqVYAgADI0gCABZiuAIAAGBMAgAFDQQCAAGOTgIACAVGAgABK5wCAAYgPAIAAC/aAgAF5+wA=
Date: Sat, 4 Apr 2026 01:15:52 +0000
Message-ID: <20260404011530.aukxllvizvmc3f3x@synopsys.com>
References: <9cf4008e-2d12-4025-809a-8d9371f45dac@linux.intel.com>
 <20260326232400.zkplsxflhykhayyb@synopsys.com>
 <2604e951-01e8-44d0-a11e-be63b0849c23@linux.intel.com>
 <9e62ef5a-5b31-4fca-891b-d028f5bbfc05@rowland.harvard.edu>
 <54121929-d775-45a0-b31d-09b783aada5d@linux.intel.com>
 <86876c62-01d2-45da-81f3-7d4499ffa0ad@rowland.harvard.edu>
 <50e61cf7-cce9-45b4-884e-ac65f5e771d7@linux.intel.com>
 <07351d72-5cdb-45e8-90af-311a0dc49718@rowland.harvard.edu>
 <20260403015950.lx4n4zdqki37dy27@synopsys.com>
 <28a00143-85fa-4043-93a0-c2b687ff1bcd@rowland.harvard.edu>
In-Reply-To: <28a00143-85fa-4043-93a0-c2b687ff1bcd@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DM4PR12MB6640:EE_
x-ms-office365-filtering-correlation-id: b6f39e5c-882d-42ff-9fcb-08de91e7b6ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 C20zYEybMa6DooHXu5BS9IX30mFqTNGeSeVTkOudM6YvWoZT6U1OCJXkw6Gora5ZjI3d7A58air79Rb5gD2RBiHlhENS9GFIEKbSQWlt7SFb+fx/Pj9Nd7SN6I+lDfqyfwG6m/NXbX4HsW1khjutSSBJ6+Vin6f3BqDf10/8VTLU91Q6slyRDA6x5GGG0Hx9wo1o+WgIOpwGMApGFQJAhHMEzxRG1IGVAIML2MwxZinjWOuLabD0EI0CwrCV+WYXn+d21sR/10qo9Z/FLWbAG7nPAgll8eDoLXFb5yRqF7wShg6U4jaAoC+foqqTXEjlx/n0rjhVNo/bZTydl75xzIzSv1YG5sa9C61ilihmQ9BiypEN0mucsoRh2gSM7eKLkM8WKgOxmpDRFHAjVLS2OhrKTh4hBlSNvnb5m9U5UsMmhl5eO8qq6Gj4Ap+Js75mta3U0gtoRhRI9I1ZNAKzQOE++bHHBLEiEUu6F824ALt7AA4cKRWTOMNe3FBCDo4lwPV/2pz/6kuT199xcfwhfzenJNngLilC+/f/gU6UFCNHghl+L2on6ftGpEwogPdvY1r40UgTTpGwdqnP6oFmxyK/1vXmf6oiD0N/wG0pHkO0dttPLRI7IpaIU8LO2C7fiPeDM0YIhlSulJvwCnu8aUt666K0mvJex+TAiDyf8G7K7mPYt7sKt2fhKGz0AetQDDm4l5g9pMkhtZbF3mR19RPbLg1pr+gaqAjZDVa60hyfK5uTFZMFytMWg6hjabT5+eoeo9DPoV++w8GT3dMR6shYaeopc5TGI3IL9l8edFo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UnBvd3NJS1J6WFdDQUMvL2ducEUralpBSEIxWmdGakZvcU9Ua3pQZ1p2Kzlx?=
 =?utf-8?B?WXdBNUxldm5QMUxlMmZHcmlkWGc2TVpxcjFXODBGMytHdUlTZ3NPaGJUVnd4?=
 =?utf-8?B?VFpoVFVJUGMxU25WM091RGVKRDdzQk4wblBsdmpNZVhaWDBJdXBzR3lnR1c4?=
 =?utf-8?B?OXFja1VVQnZFeTJGbHd4VHhqRFRpNHdmaHh2dTVDaWtSVHZ2OFE4SDBGUThj?=
 =?utf-8?B?N2dhbkhodnFRVHNSbUxkc1BpWnVTQ1NpeUxXOFdPWW1QVzNWeEYzUjFWL0Rv?=
 =?utf-8?B?MHJnSVBZWCs5SHFtY093SWdNN2U3YmRhYVBzaGdDbzhNMUhzK29GckhRYWla?=
 =?utf-8?B?a2ZEUTRFQzZiUEV4SEVhVG8yYVNCd0tuZzMzUW1MM1IramozRjhsRnA5aDhk?=
 =?utf-8?B?bVpPcmxKb2IzR0dVY0lOWjFERHlRYnVtNXpmWGFLUHU0ODVyVlBjbWZqcEov?=
 =?utf-8?B?QVJ6SmxHSEprc1JIVWJpRkhZaDFFcEliV0lGNXpON3VBZXEwY29XSnFNL1pz?=
 =?utf-8?B?bHBRY08zbzgwTDJRbTAvdVJ0d1NvSU1ScEhQWk5KY2M2VmJ6a2w3L0F2NXRC?=
 =?utf-8?B?ODNzMmx6QU40N3RSdDVKbm9XTnp1d1hqMHlXYlZabjR3Q0tPdkl2S1VUTW82?=
 =?utf-8?B?SnBmNDZ1Rmg5N3N1TkxPZS9RT3k4S0ZLd3hCUmx6bEFwRlNwZFY5ODdDcFND?=
 =?utf-8?B?RXNKMXhWSzhjcnNvalF2b0tudmt0T0FRdXRMZ2gyN3I5YWF6QklHNmFIcjYx?=
 =?utf-8?B?aThNZ0hEVWNkSEtzYjd4czZvbmtwbngrZUI0WnQyZlFoV0x5NkpMSTNHQk5v?=
 =?utf-8?B?R0lwUm5lT3F5RzAxMjRFWXlFWU1IT0hJb0pOVkR3S21JQ1VsMlFBei9KRXBC?=
 =?utf-8?B?WW5mdnVwaWEzNXZVVFBBb2pzdU8wNlVnbVZVTEc1STlwRXdDMHI5dzFVbDFr?=
 =?utf-8?B?Sm5WcllWQ3JKem9KeVBrS2NwbWJhZG16RTNFK2xyTGtmREwyYVMxTmhJdDN0?=
 =?utf-8?B?VkZGdS9YR1pBTXJVY21ySEE3ZE8xTEVMUUU5Z2xwbURNb2pYNmhNamtUa0ZL?=
 =?utf-8?B?c1JxYStWdjdKQlkxL1h0ZDRVb1p6cTBIbzRGVS90ay8ydU5NSEVQYWhETnhl?=
 =?utf-8?B?MXBUcWFIYUYyMXF6enpPZXV0VVlIM2pLT0hrT1N0eHREVWQxOU41VTM4Q20v?=
 =?utf-8?B?QlhqY2tkSzVtWTlqeVhRby9ZWXU3V3JZbm1KQmUzQVhjZFpaU0lhR3pEL2sv?=
 =?utf-8?B?QitoRnhzcS8xaVpHbkZZbDVBVURoUnhHUVFrQ2FvYmluMW14cXZSbzVWZU1k?=
 =?utf-8?B?V2tvaEtuVllhVXFXaEc3UWE5Z1VLZUxOQUZRMVlZc3dTS1FVMG5jbVVVWUhV?=
 =?utf-8?B?RktxMDdGOWtQT0dVK0dFSk1zNEhpMmNkZy90elZsUzFWcXZNOTlSTjZzN2ZR?=
 =?utf-8?B?d0UrMStpeDN6US9WblR2RjhGU0g5N3NvNlhjT2RDZ1lEV01aMy9XYUMxdWxI?=
 =?utf-8?B?cFAvWFN6NlhUTzRtbmt4Z0JKOVZHZk5GdzlJTWkyNWRXeGU3MDFSWkZveW1V?=
 =?utf-8?B?Rjd4TGtlOVVlY3VYV2QxamhUVzQvTjRpVHRYT21LZThVeWtuMXhUWEkxd2gr?=
 =?utf-8?B?cmIxd2tjcU1nWktXbENHNExtZ3VML05DYzNBM21YVmRLNFBXYi9FQlh1SEZm?=
 =?utf-8?B?L3JsaXB6TjZ4WkkwU2s5RTFNcUsxdlg4UDFVbmM1c2NrY2Y4bEhpcjlyaDEw?=
 =?utf-8?B?QWwwVjhWNjgvLzR4RW9aSFFwM2dzY0xtZGdFdW5qcVJNZWNrOTJZMEtHTkZD?=
 =?utf-8?B?Y2xwRlA4QTlJTUt6VFFrZExBK3crd05DNEJ4Z2dUYTdDK3ovT1VsdElESWdC?=
 =?utf-8?B?cHRHTlhkZGdNdVJmMmtvZmJET2IxSTNnMWRmNUtyYTdSZXU5Z2JRTzNsNGFi?=
 =?utf-8?B?ZHRiZEZHcllnMU51NU1YSmVnMTFrQUlGRmJyZEdieVhvM24rWG1GVUdsVGNl?=
 =?utf-8?B?K1MvdmsxUzRieGI4djM5L1NLVks1TU1nK29zRjZDb2M5VjRvNHZVVHliT25K?=
 =?utf-8?B?KytPOU1FcjZreXRaamNJR2RaZk9ZcmduS3N0aW1yRFZEUGpMYVd0K2FIS0hP?=
 =?utf-8?B?M1ZJOEtRK05CNFNiOTJNSWZGQm1uV0QzSzNQVmo0TE9jOUdmRWNXbHQxSlMr?=
 =?utf-8?B?WFY5SzBqQzI2dkc2UkJJM1lzRVY5MFRMeEhDbjRNMkUvNXZNOU1FcFphMGNu?=
 =?utf-8?B?RUJDMlhUb3lSc1g5ZlVzQUdsZWM5TnJGdzlBMWxvVmE0bnBuUGFxWlZWR2VD?=
 =?utf-8?B?UDkzUGh4M2JBa2YwWG96Mms0MFdaTTcxZkFnZ2RDQXluZ3R5YTV6Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E847B5265B238C49950905354233793F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	kdi+N+UJg8yQwJAEq81xqzddjOcsmYC0N6H8ATL5QeCcAQ+YnZ2xElvHuiz363pNdnisYEZIxRDS6bHeWnPSbwKvSxIugupIi6AubYNmOMehDqFK/5A8+EKwg5WGF1DBJVJK8QLt4G/QiPdhY+6aPcyKFpyYuIvPtukYUKY1S+Tpd2pjqkWAFnTqIseBUYmWjnsdvxzWRaD06F5efsfxEAYz8d+ErEiKsCJPvW7Yt6gKbeMPLMyFNslOkmRxNQT9QS1CIn8dANPhy8KlYp9/ZZ1VgjSLZ70P5X5y+63j4jViNMeyE2Xkmmf/BaUNbEkpW+0tDlYRvRQzktITblqZMw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0fr3oWjKumqbhcZ1pGpoVn+eOyKwAuEaAEQLCxq/gw/9fo5NrCiMfiYtRUTC9Y7aAPcSoLl05zPgghdeEGGwC0LIQBnYDKSSMTYfradXKxbl6pf+L/UtVE8iaom4uwaY77XnCkeR/rHz3qUOOihXDYP5l05QEM+ai9y5WZlW7JIecGBA+fZn/Ud7P28oDbccDJ9z2l5wXJjGUKFUYohiJSskBaqMJ2BadDo9PPKWG7CYcXdBWIXwhj7h+d/hsLKFUa1kgXplYP7wukqAl++K98AR1d/2BLlWUbFo2lbcYkY3rEgZLHr+rXmSFhG5MV0/03276eZO3+dzqsvZHpjCwIJR/RETM5J3Q9s4iqj08mkWcNlpvRis+nIRcF7iqU1UAzgDun+ubEfhMGHpUOnqOfcnJVRhpFo/eDifGewQseGo1+s227C/H6LCHGFSoCUCAsntnO0FdkSRs7HcNtod9UsDx00+2t9eaXr6AibznE+KsbfMXvk+ks7xBwceL8uKavYKjzutWnfq5HdDBr/nrQs8inWZcb51rlb7D1m/J/rIgmRd+C3FuqDQvZjXJIDJQFpB93P4qjQ5ktb05/nu8CZq/kA8iF91Owo3KJkDKN5vQBB0rdONrEXRXmFR67ZlUScy1cMwfHK4NJtz4eqjCg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f39e5c-882d-42ff-9fcb-08de91e7b6ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2026 01:15:52.5495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RDLTh1NzPzYEhXwGkSGU6m0gbob629eR3VapjGAtP3q8ykHZf/7/zFSgSd9YGSzqYY1e/PA7zLojnSZro6Folw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6640
X-Authority-Analysis: v=2.4 cv=fLE0HJae c=1 sm=1 tr=0 ts=69d06653 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=ikEaRZlyyUtjU8ChhgoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: zwCBGBONwarbLwDFKd1uKNh2XkATluqH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDAwOCBTYWx0ZWRfXx5SRxVO8ntQF
 lmAbEKoGPXkwNzWIXyig9DsFlRSleoF+e89AG7j9MRQ5P6PDz3ZwyXvfus2lZweZODY+ew6yfzF
 RqdLVQ+REJPJw3CTt5JoOFcUVugD4cEpucnuM0/IeN/0N0h9vI+kcrDkC//Gal0M/ycJDqlCQhE
 PgAdVVJlOcSoUXk1WjL+lfMK9tK4lRBuabTbEoI6eptGAkDCqZrDtgIbUgYxCPWk7bfyyXETBZX
 SL2tG+DOt1MyFxNuJ+vOkMs8/nSCsLxhspZDYnnz8mKcVP3b+nGfOaZ2MsHlpRDjIRmFnd0zO85
 5x7O9/l8/PMZM+3T0k2yM3qR78aj/jp4Y5Dfn5v65lsf5hzCQ1rw2Pnww6wNBIUoY+MvRlT5u4e
 9eD95DH2w+aiHpUTRdH9yyCjdsDAWLaxi8/3QHswznmN2bULVeGUxNse4Z2u3+DV+0ZOglXR0su
 90/GuXbsbjwl7+CECpA==
X-Proofpoint-GUID: zwCBGBONwarbLwDFKd1uKNh2XkATluqH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 suspectscore=0 clxscore=1015 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2604040008
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
	TAGGED_FROM(0.00)[bounces-35960-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: 16FA53996CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVGh1LCBBcHIgMDIsIDIwMjYsIHN0ZXJuQHJvd2xhbmQuaGFydmFyZC5lZHUgd3JvdGU6DQo+
IE9uIEZyaSwgQXByIDAzLCAyMDI2IGF0IDAxOjU5OjU4QU0gKzAwMDAsIFRoaW5oIE5ndXllbiB3
cm90ZToNCj4gPiBPbiBXZWQsIEFwciAwMSwgMjAyNiwgc3Rlcm5Acm93bGFuZC5oYXJ2YXJkLmVk
dSB3cm90ZToNCj4gPiA+IE9uIFRodSwgQXByIDAyLCAyMDI2IGF0IDAxOjA4OjMxQU0gKzAzMDAs
IE1hdGhpYXMgTnltYW4gd3JvdGU6DQo+ID4gPiA+IE9uIDMvMzEvMjYgMTg6MzEsIHN0ZXJuQHJv
d2xhbmQuaGFydmFyZC5lZHUgd3JvdGU6DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gSG93IGFib3V0
IHRoaXMgaW5zdGVhZD8gIFdlIGFkZCBhICJoYWx0ZWQiIGZsYWcgdG8gdGhlIHVzYl9ob3N0X2Vu
ZHBvaW50DQo+ID4gPiA+ID4gc3RydWN0dXJlLCBhbmQgdGhlIGNvcmUgd2lsbCBzZXQgdGhpcyBm
bGFnIHdoZW5ldmVyIGEgYnVsayBvciBpbnRlcnJ1cHQNCj4gPiA+ID4gPiBVUkIgZ2V0cyBhIHN0
YXR1cyBvdGhlciB0aGFuIDAgKGJlZm9yZSBwdXR0aW5nIHRoZSBVUkIgb24gdGhlIGJoIGxpc3Qp
Lg0KPiA+ID4gPiA+IElmIGFuIFVSQiBoYXMgb25lIG9mIHRoZXNlIHN0YXR1c2VzLCB3aGVuIGl0
cyBjb21wbGV0aW9uIGhhbmRsZXIgcmV0dXJucw0KPiA+ID4gPiA+IHRoZSBjb3JlIHdpbGwgdW5s
aW5rIGFsbCB0aGUgVVJCcyBxdWV1ZWQgdG8gdGhlIHNhbWUgZW5kcG9pbnQuICBGaW5hbGx5LA0K
PiA+ID4gPiA+IHRoZSAiaGFsdGVkIiBmbGFnIHNob3VsZCBiZSBjbGVhcmVkIGFmdGVyIGEgY29t
cGxldGlvbiBoYW5kbGVyIHJldHVybnMNCj4gPiA+ID4gPiBpZiB0aGVyZSBhcmUgbm8gbW9yZSB1
bmxpbmtlZCBVUkJzIHN0aWxsIGluIHRoZSBxdWV1ZSBvciBVUkJzIHdhaXRpbmcgb24NCj4gPiA+
ID4gPiB0aGUgYmggbGlzdCB0byBiZSBnaXZlbiBiYWNrLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+
IFRoZSByZXN1bHQgb2YgdGhpcyBpcyB0aGF0IGFueSBVUkIgcmVtYWluaW5nIGluIHRoZSBxdWV1
ZSB3aGVuIHRoZSBmbGFnDQo+ID4gPiA+ID4gaXMgY2xlYXJlZCBtdXN0IGhhdmUgYmVlbiBzdWJt
aXR0ZWQgYnkgdGhlIGNsYXNzIGRyaXZlciBfYWZ0ZXJfIHRoZQ0KPiA+ID4gPiA+IGZhaWxpbmcg
VVJCJ3MgY29tcGxldGlvbiBoYW5kbGVyIGhhcyBydW4uICBXZSBjYW4gYXNzdW1lIHRoZSBjbGFz
cw0KPiA+ID4gPiA+IGRyaXZlciBrbm93cyB3aGF0IGl0J3MgZG9pbmcgaW4gdGhpcyBjYXNlLg0K
PiA+ID4gPiA+IA0KPiA+ID4gPiA+IFRoZSBlbmRwb2ludCBxdWV1ZSBzaG91bGRuJ3QgYmUgcmVz
dGFydGVkIHVudGlsIHRoZSAiaGFsdGVkIiBmbGFnIGlzDQo+ID4gPiA+ID4gY2xlYXJlZC4gIEVp
dGhlciByaWdodCBhd2F5LCBpZiB0aGVyZSBhcmUgYW55IFVSQnMgaW4gdGhlIHF1ZXVlLCBvciBu
b3QNCj4gPiA+ID4gPiB1bnRpbCB0aGUgbmV4dCBVUkIgaXMgc3VibWl0dGVkLiAgRG9pbmcgdGhp
cyBtaWdodCByZXF1aXJlIGEgbmV3IEhDRA0KPiA+ID4gPiA+IGNhbGxiYWNrLiAgKEl0IHdvdWxk
IGFsc28gbWVhbiB0aGUga2VybmVsZG9jIGZvciB1c2JfdW5saW5rX3VyYigpIHdvdWxkDQo+ID4g
PiA+ID4gbmVlZCB0byBiZSB1cGRhdGVkLCBiZWNhdXNlIHRoZSBlbmRwb2ludCBtaWdodCByZXN0
YXJ0IGJlZm9yZSBhbGwgdGhlDQo+ID4gPiA+ID4gY29tcGxldGlvbiBoYW5kbGVycyBmb3IgdGhl
IHVubGlua2VkIFVSQnMgaGF2ZSBydW4uKQ0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFdoYXQgSSdt
IHRyeWluZyB0byBkbyBoZXJlIGlzIGNvbWUgdXAgd2l0aCBhIHNpbmdsZSwgY29uc2lzdGVudCBw
cm9wb3NhbA0KPiA+ID4gPiA+IGZvciBleGFjdGx5IHdoZW4gaGFsdGVkIGVuZHBvaW50IHF1ZXVl
cyBzaG91bGQgcmVzdGFydC4gIE1heWJlIHNvbWVvbmUNCj4gPiA+ID4gPiBlbHNlIGhhcyBhIGJl
dHRlciBzdWdnZXN0aW9uLg0KPiANCj4gPiBIb3cgYWJvdXQgdGhpczoNCj4gPiANCj4gPiBJbnRy
b2R1Y2UgYSBoYWx0ZWQgZmxhZyB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6DQo+ID4gDQo+ID4g
KiBJbnRyb2R1Y2UgdGhlIGhhbHRlZCBmbGFnIGluIHVzYl9ob3N0X2VuZHBvaW50DQo+ID4gKiBU
aGUgaGFsdGVkIGZsYWcgbXVzdCBiZSBpbXBsZW1lbnRlZCBhcyBhIGJpdCBpbiBhIHVuc2lnbmVk
IGxvbmcgc28NCj4gPiAgIHdlIGNhbiB1c2UgYXRvbWljIGJpdCBvcGVyYXRpb24NCj4gDQo+IEkg
ZG9uJ3Qgc2VlIHdoeSBpdCBuZWVkcyB0byB1c2UgYXRvbWljIG9wZXJhdGlvbnMuICBVbmxlc3Mg
eW91J3JlIA0KPiB0aGlua2luZyB0aGF0IHdlIG1pZ2h0IHdhbnQgdG8gYWRkIG90aGVyIGJpdGZs
YWdzIGludG8gdGhlIHNhbWUgdW5zaWduZWQgDQo+IGxvbmc/DQoNCk5vdyB0aGF0IEkgdGhpbmsg
YWJvdXQgaXQgYWdhaW4sIGl0J3Mgbm90IG5lZWRlZCBpZiB3ZSBoYXZlIHRoZQ0KcmVxdWlyZW1l
bnQgZm9yIGNsZWFyaW5nIHRoZSBmbGFnIG9ubHkgYWZ0ZXIgdXNiX3Jlc2V0X2VuZHBvaW50Lg0K
DQo+IA0KPiA+ICogT25seSB0aGUgSENEIG1heSBzZXQgdGhlIGhhbHRlZCBmbGFnLCBhbmQgb25s
eSB1cG9uIGNoZWNraW5nIHRoZQ0KPiA+ICAgZmlyc3QgVVJCIGNvbXBsZXRpbmcgd2l0aCBhIGhh
bHRlZCBzdGF0dXMNCj4gDQo+IEV2ZXJ5IHN0YXR1cyBvdGhlciB0aGFuIDAgc2hvdWxkIG1lYW4g
dGhhdCB0aGUgZW5kcG9pbnQncyBxdWV1ZSBpcyANCj4gaGFsdGVkLiAgQnV0IG5vdCBhbGwgc3Rh
dHVzZXMgcmVxdWlyZSBhIGNsZWFyLWhhbHQgb3IgcmVzZXQtZW5kcG9pbnQgdG8gDQo+IHJlY292
ZXIuICBGb3IgaW5zdGFuY2UsIGEgc2hvcnQgdHJhbnNmZXIgd2hlbiB0aGUgVVJCX1NIT1JUX05P
VF9PSyBmbGFnIA0KPiBpcyBzZXQuDQoNCkl0IHNlZW1zIHdlJ3JlIHVzaW5nIHRoZSAiaGFsdGVk
IiBmbGFnIGZvciBkaWZmZXJlbnQgdGhpbmdzLiBUaGUgaGFsdGVkDQpmbGFnIHRvIG1lIGlzIHRo
ZSBlbmRwb2ludCdzIHN0YXRlIGFuZCByYXRoZXIgdGhhbiB0aGUgZW5kcG9pbnQgcXVldWUNCnN0
YXRlLiBUaGF0IGlzLCBpZiB0aGUgZW5kcG9pbnQgaXMgaGFsdGVkLCB0aGVyZSdzIGFuIGVycm9y
IHRoYXQgd2FzDQpyZXBvcnRlZCBvbiB0aGUgcGlwZS4gU28sIGFuIC1FQ09OTlJFU0VUIHdvdWxk
IG5vdCBjYXVzZSBhIGhhbHRlZA0KZW5kcG9pbnQuDQoNCj4gDQo+IFdoeSBkbyB5b3Ugd2FudCB0
aGUgSENEIHRvIHNldCB0aGUgZmxhZyBpbnN0ZWFkIG9mIA0KPiB1c2JfaGNkX2dpdmViYWNrX3Vy
YigpPyAgSnVzdCBvbmUgY2VudHJhbCBwbGFjZSBpcyBzaW1wbGVyIHRoYW4gaW4gZXZlcnkgDQo+
IEhDRC4NCg0KSSdtIGp1c3QgdGhpbmtpbmcgaW4gdGVybSBvZiB3aG9zZSByb2xlIHRvIHJldHVy
biB0aGUgcGVuZGluZyBVUkJzLg0KVHlwaWNhbGx5IHRoZSBIQ0QgaGFuZGxlcyB3aGVuIHRvIGdp
dmUgYmFjayBVUkJzLiBJZiB0aGUgSENEIHdlcmUgdG8NCmhhbmRsZSBnaXZpbmcgYmFjayBwZW5k
aW5nIFVSQnMgZHVlIHRvIGhhbHRlZCBlbmRwb2ludCwgdGhlbiBpdCBzaG91bGQNCmJlIHRoZSBv
bmUgdG8gc2V0IHRoZSBoYWx0ZWQgZmxhZy4gSG93ZXZlciwgaWYgdGhlIGNvcmUgdHJhY2tzIGFu
ZCBkb2VzDQpib3RoIHNldHRpbmcgYW5kIGNsZWFyaW5nIG9mIHRoZSBoYWx0ZWQgZmxhZywgdGhl
biB0aGUgY29yZSBzaG91bGQNCmhhbmRsZSBjYW5jZWxpbmcgdGhlIFVSQnMuIEFzIHlvdSBzYWlk
LCBpZiB3ZSBjYW4gc2hpZnQgdGhlIGJ1cmRlbiB0bw0KdGhlIGNvcmUsIHRoYXQgd291bGQgaGVs
cCBrZWVwIHRoZSBmbG93IGNvbnNpc3RlbnQgYW5kIGNlbnRyYWxpemVkLg0KDQo+IA0KPiA+ICog
T25seSB0aGUgVVNCIGNvcmUgbWF5IGNsZWFyIHRoZSBoYWx0ZWQgZmxhZywgYW5kIG9ubHkgYWZ0
ZXINCj4gPiAgIHVzYl9yZXNldF9lbmRwb2ludCByZXR1cm5zICh0aGlzIG1ha2VzIHN1cmUgdGhl
IEhDRCBkcmFpbmVkIGFuZCByZXNldA0KPiA+ICAgdGhlIGVuZHBvaW50IGJlZm9yZSB0aGUgZmxh
ZyBpcyBjbGVhcmVkIGFuZCBuZXcgVVJCcyBhcmUgYWNjZXB0ZWQpDQo+ID4gKiBUaGUgdXNiX3Jl
c2V0X2VuZHBvaW50IG11c3QgYmUgY2FsbGVkIGFmdGVyIGNsZWFyLWhhbHQsIFNldEludGVyZmFj
ZSwNCj4gPiAgIGFuZCBTZXRDb25maWd1cmF0aW9uLg0KPiANCj4gVGhhdCdzIGVhc3kgdG8gZG8g
anVzdCBieSBhZGRpbmcgaXQgaW50byB0aGUgYXBwcm9wcmlhdGUgY29yZSByb3V0aW5lcy4NCg0K
WWVzLg0KDQo+IA0KPiA+ICogVGhlIFVTQiBjb3JlIHdpbGwgbm90IGF0dGVtcHQgdG8gdW5saW5r
IHBlbmRpbmcgVVJCcyBkdWUgdG8gaGFsdGVkDQo+ID4gICBjb25kaXRpb24NCj4gPiAqIFRoZSBI
Q0QgaXMgcmVzcG9uc2libGUgZm9yIGNvbXBsZXRpbmcgb3IgY2FuY2VsaW5nIHF1ZXVlZCBVUkJz
DQo+ID4gICB3aGVuIHRoZSBoYWx0ZWQgZmxhZyBpcyBzZXQuIENhbmNlbGxlZCBhbmQgbmV3bHkg
c3VibWl0dGVkIFVSQnMgd2lsbA0KPiA+ICAgYmUgcmV0dXJuZWQgd2l0aCAtRVBJUEUgYXMgbG9u
ZyBhcyB0aGUgaGFsdGVkIGZsYWcgaXMgc2V0DQo+IA0KPiBXaHkgbWFrZSB0aGUgSENEIHJlc3Bv
bnNpYmxlIGZvciBkcmFpbmluZyB0aGUgcXVldWU/ICBJdCdzIGxpa2Ugc2V0dGluZyANCj4gdGhl
IGhhbHRlZCBmbGFnOyBvbmUgY2VudHJhbCBwbGFjZSBpcyBzaW1wbGVyIGFuZCBsZXNzIGVycm9y
LXByb25lIHRoYW4gDQo+IGxvdHMgb2Ygc2VwYXJhdGUgcGxhY2VzLg0KPiANCj4gRm9yIG5ld2x5
IHN1Ym1pdHRlZCBVUkJzLCBzaG91bGQgdGhlIHN1Ym1pc3Npb24gZmFpbCB3aXRoIC1FUElQRSwg
b3IgDQo+IHNob3VsZCB0aGUgc3VibWlzc2lvbiBzdWNjZWVkIGFuZCB0aGVuIHRoZSBVUkIgY29t
cGxldGUgd2l0aCAtRVBJUEU/ICANCj4gVGhlIGZpcnN0IGlzIHNpbXBsZXIsIGJ1dCBkcml2ZXJz
IHByb2JhYmx5IGFyZW4ndCBwcmVwYXJlZCBmb3IgaXQgLS0gaXQgDQo+IHdvdWxkIG1lYW4gYWRk
aW5nIGVycm9yIGhhbmRsaW5nIHRvIHRoZSBzdWJtaXNzaW9uIGNvZGUgYXMgd2VsbCBhcyB0byAN
Cj4gdGhlIGNvbXBsZXRpb24gaGFuZGxlciBjb2RlLg0KPiANCj4gKEFjdHVhbGx5LCB0aGF0IHdv
dWxkbid0IG1hdHRlciB1bmxlc3MgdGhlIGRyaXZlciB3YXMgcXVldWluZyB1cCANCj4gbXVsdGlw
bGUgVVJCcywgaW4gd2hpY2ggY2FzZSBpdCBzaG91bGQgYmUgcHJlcGFyZWQgdG8gaGFuZGxlIHN1
Ym1pc3Npb24gDQo+IGVycm9ycyBpbiB0aGUgbWlkZGxlLikNCg0KSSBkaWRuJ3QgdGhpbmsgYWJv
dXQgZmFpbGluZyBpbW1lZGlhdGVseSBvbiBzdWJtaXNzaW9uIGJlY2F1c2Ugd2Ugd291bGQNCm5l
ZWQgdG8gYXVkaXQgZXZlcnkgY2xhc3MgZHJpdmVyIGZvciB0aGF0LiBQZXJoYXBzIHRoZSBjb3Jl
IGNhbg0KaW50ZXJjZXB0IHRoZSBVUkJzIGFuZCBpbW1lZGlhdGVseSBzY2hlZHVsZSBhIGNvbXBs
ZXRpb24gaGFuZGxlciB3aXRoDQp0aGUgdXBkYXRlZCBVUkIncyBzdGF0dXM/DQoNCj4gDQo+ID4g
KiBUaGUgY2xhc3MgZHJpdmVyIGlzIHJlc3BvbnNpYmxlIHRvIGNoZWNrIHRoZSBoYWx0ZWQgZmxh
ZyB0bw0KPiA+ICAgZGV0ZXJtaW5lIHdoZXRoZXIgdG8gaW5pdGlhdGUgZXJyb3IgcmVjb3Zlcnkg
dmlhIHVzYl9jbGVhcl9oYWx0DQo+ID4gDQo+ID4gSSdtIHRyeWluZyB0byBrZWVwIGEgY2xlYXIg
c2VwYXJhdGlvbiBvZiByZXNwb25zaWJpbGl0aWVzIGJldHdlZW4gSENEDQo+ID4gYW5kIHRoZSBV
U0IgY29yZS4gQWxzbywgSSB0cnkgdG8ga2VlcCB0aGUgaGFsdGVkIGZsYWcgbW9yZSBjbG9zZWx5
IG1hdGNoDQo+ID4gdGhlIHN0YXRlIG9mIHRoZSBlbmRwb2ludC4gDQo+ID4gDQo+ID4gTGV0IG1l
IGtub3cgd2hhdCB5b3UgdGhpbms/DQo+IA0KPiBNYWtpbmcgdGhlIGZsYWcgbWF0Y2ggdGhlIGVu
ZHBvaW50IHN0YXRlIGlzIGEgZ29vZCBpZGVhLiAgQnV0IHRoZXJlIGlzIA0KPiBzb21lIGFtYmln
dWl0eTogRG8geW91IG1lYW4gdGhlIHN0YXRlIGluIHRoZSBkZXZpY2UsIG9yIHRoZSBzdGF0ZSBp
biB0aGUgDQo+IEhDIGhhcmR3YXJlLCBvciB0aGUgc3RhdGUgaW4gdGhlIEhDRD8gIEFmdGVyIGFs
bCwgdGhlc2UgYXJlbid0IGFsd2F5cyANCj4gdGhlIHNhbWUuICBGb3IgaW5zdGFuY2UsIHVubGlu
a2luZyBhbiBVUkIgd29uJ3QgYWZmZWN0IHRoZSBkZXZpY2UncyANCj4gc3RhdGUgYnV0IGl0IHdp
bGwgYWZmZWN0IHRoZSBzdGF0ZSBvbiB0aGUgaG9zdCBzaWRlLg0KPiANCg0KVGhlIEhDRCBzdGF0
ZS4gSWYgd2UgY2FuIGxldCB0aGUgY29yZSBtYW5hZ2UgdGhlIGhhbHRlZCBzdGF0ZSwgdGhlbiBo
ZXJlDQphcmUgdGhlIHBvaW50cyB3aGVyZSB0aGUgaGFsdGVkIHN0YXRlIGlzIHVwZGF0ZWQgKGhv
cGVmdWxseSBJIGRpZG4ndA0KbWlzcyBhbnkgb3RoZXIgb25lcyk6DQoNCkVuZHBvaW50IGlzIGhh
bHRlZCAocmVwb3J0ZWQgYnkgSENEKToNCiogVVJCIHJldHVybmVkIHdpdGggLUVQUk9UTyBvciAt
RVBJUEUNCg0KRW5kcG9pbnQgaXMgYWN0aXZlICh1cGRhdGVkIGJ5IHRoZSBjb3JlKToNCiogU2V0
Q29uZmlndXJhdGlvbiwgU2V0SW50ZXJmYWNlLCBjbGVhci1oYWx0DQoNClRoYW5rcywNClRoaW5o
DQoNCnBzLiBJJ2xsIGJlIG91dCBvZiB0b3duIG5leHQgd2Vlay4gQXBvbG9naWVzIGlmIG15IHJl
c3BvbnNlIHdpbGwgYmUNCmRlbGF5ZWQuLi4=

