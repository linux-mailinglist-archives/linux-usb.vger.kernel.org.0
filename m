Return-Path: <linux-usb+bounces-36304-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLNCNpXR4mlY+wAAu9opvQ
	(envelope-from <linux-usb+bounces-36304-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 02:34:29 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE5B41F776
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 02:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D5A203014FE0
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 00:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D789F245019;
	Sat, 18 Apr 2026 00:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GN3BNGSN";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dxd1uIEQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cwmIISkV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF871A3154;
	Sat, 18 Apr 2026 00:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776472464; cv=fail; b=BGzT5CO/3TAWhrfa2wl7Uyiuw3Mz8m3RcueNwbojvRCSWr67PhGYccKVinkhHt4Xt69NDy2+1lzK0cWQKKUGKpolUvVVbqG2a+Sw/rx04C2o0ZVdXnO5w0VbGFbGI5Cx+m+CMer0VnoBrrIZ2a0QVDudokBgTZ7zWOUfw/Di/wE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776472464; c=relaxed/simple;
	bh=F2nZBEuuRKYFOPWIj+AcqrrjBbq2ZeATvmppg3j/cbQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EHfzSiTYmySUHM/0hjTt7SXr2yc5YnmMyIPsq+lq1+RrJlGisHU8kFFCkIY4VbXf1aJIx7bwzJ4LzO3fApIm3k4J1JpHuiMBSedoY311A2rX5rEoASSpy/Ol8tTHzo20FFIkUgLdbRkOxLUtOSU7XizlfqcqpwNshkpX2rWwLh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=GN3BNGSN; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dxd1uIEQ; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cwmIISkV reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HLfAjH2471757;
	Fri, 17 Apr 2026 17:33:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=F2nZBEuuRKYFOPWIj+AcqrrjBbq2ZeATvmppg3j/cbQ=; b=
	GN3BNGSNeEbCvYshLGzJ7DBUEX53zpUR0shkxXvgOMvEojO/p4Ydj+VrNgXENZGa
	uuIUs1Nys6PieRr8wnEESAY4yB99/LZvr/IxZXoFTNza946hqDLezSuaWiOHmRXE
	jI2wkZe8dhIIO3ZqD2W0VEzkFhSHK7ZduwHNFOkI6VkmBHWIKd+M5ULnN9wobC9+
	2x3yvr8eps9TTbtc9DsKR0GIO/7tVtozRJr6h39LatWaEZ5BhTqYCxY49LmeCFa4
	atlRwuYGYgRPtPY2h4IzE+rXoHI5fAvwzFDAD62+Y4D2HnoXgThYy+VboSl+zqMg
	HVjmSXXjaUYolY7BJPsKRA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4dkr3ta5ex-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Apr 2026 17:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1776472432; bh=F2nZBEuuRKYFOPWIj+AcqrrjBbq2ZeATvmppg3j/cbQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=dxd1uIEQEQGoCvOwPY1E0U63LiHAYJSjoHYHyW6LSebOSWoTTtpp6CMYpfhY+LKbg
	 6Mj2qppuXwuwFAjsPkvnH9V3N0qgtLrh5OjYsD07LTiRgD9aOZzNJt+eXHJV5v4A6J
	 t/2giOemOxDEZUk5Bkm9zPEQ7OkTvXBsY24WukuhYgdazMs5Br9c4jJNtWuN1AfWmD
	 AGcwRP83WanV9F/8irLhEz1h3BI7dkHRG2dD0inJvFftftTjfrIHMJo03FeoLqUc6v
	 kbuWhgI2uGPQWIFlyfYR/7+tTcU509vm5UEQtbL0QeKu8W2+jqkr1bEyLTAqvZGKsl
	 w3sofg8A9JE+Q==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9F69F40653;
	Sat, 18 Apr 2026 00:33:52 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 0B568A0070;
	Sat, 18 Apr 2026 00:33:52 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=cwmIISkV;
	dkim-atps=neutral
Received: from CO1PR07CU001.outbound.protection.outlook.com (mail-co1pr07cu00103.outbound.protection.outlook.com [40.93.10.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C98F8401FA;
	Sat, 18 Apr 2026 00:33:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yf6HjQ9rPpUizfN7WBWG7/MSHxdML4FgEz4TL0PGkPh+C+JJiUZ/HQpFu0LiRhixga+ugG6mXFTumQ1sooMC556gaX5liDCzDI+jGuY0wLJ6KcNDwqVeHGE4vsgLcCYADBfsy6LZeNgWtPA2Bs1Khcw2WU3fTy9sa46tCEnqr9yiAkGfCBArSFF8p2P0Oqe5/AR1s4uAkITQqFGsROVNLe0C2dqJh/Fn40L3oRg/jfXqwCCuxzP46bQn5ePj4IKJHocnUWUaD/cdFo2xco5osLRCyR5PfRYguE27wMPS7kY6fwxJhy88ix+wWiG00uj+3MKYC9yxSnBhA60JaIyB8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2nZBEuuRKYFOPWIj+AcqrrjBbq2ZeATvmppg3j/cbQ=;
 b=cwtAxboGdXNIcIDOWodwC5DkKlsEeeFKL5jn5zPBJyTrsCpQ5UP99G3w5KFoI0H9EUoVGmz80T0chgZHw7u+K7JTGqhMjPUIXVjkvDzN+vP95dVeMXl55EV8ckAMx+9534tbMVoJqBHpgCAx23DXWY/veoh/jGSACVZ9hFXHW0MVD1UUUJys1VfdTkawf0hbvEf7EUBa5wOIlDMxdVCjagQN09NRUzsKMz7iwuRimaC39O5OizA6aAGLH1JPO8X5VjUJgpRQozQXGP3rdKbhdPJWqOOShPotgJrq6UtNXPL/Fd7MehQQKjSgK0wGqqavssnikjy0uhweR+eftdovwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2nZBEuuRKYFOPWIj+AcqrrjBbq2ZeATvmppg3j/cbQ=;
 b=cwmIISkV7oWZ3GyLmWv6TiktALfap/iIIqvWPLuA+k4fyW0KXPHkzoTQPFjtATgrvizyq+mIvi+MLAWA2u08YTDS1Xk+sG5pRkm2kslD48Ml8DM7med6+xEpTQ4yn7pmQXESGv07KQqt9yJahxnJixQX6YKglXt5FAahFfRB8HE=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH7PR12MB5760.namprd12.prod.outlook.com (2603:10b6:510:1d3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Sat, 18 Apr
 2026 00:33:48 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9818.023; Sat, 18 Apr 2026
 00:33:48 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: "Pandey, Radhey Shyam" <radheys@amd.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "michal.simek@amd.com" <michal.simek@amd.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "git@amd.com" <git@amd.com>
Subject: Re: [PATCH v2 0/4] usb: dwc3: xilinx: Add Versal2 MMI USB 3.2
 controller support
Thread-Topic: [PATCH v2 0/4] usb: dwc3: xilinx: Add Versal2 MMI USB 3.2
 controller support
Thread-Index: AQHcwHfo7FzGs9AZxUynlstD2BlPf7XK1riAgBIbF4CAByNFAA==
Date: Sat, 18 Apr 2026 00:33:48 +0000
Message-ID: <20260418003342.shu7awwwphikol4o@synopsys.com>
References: <20260330190304.1841593-1-radhey.shyam.pandey@amd.com>
 <20260401230401.w2si3gnqvzlszduh@synopsys.com>
 <faf2421e-0d12-424d-abf8-ad490f5421ff@amd.com>
In-Reply-To: <faf2421e-0d12-424d-abf8-ad490f5421ff@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH7PR12MB5760:EE_
x-ms-office365-filtering-correlation-id: 42d55c6f-dbd7-41bb-7216-08de9ce22835
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|22082099003|18002099003|38070700021|56012099003;
x-microsoft-antispam-message-info:
 UsIo3ipA/Qwrbp/i1KnIqYU9I64GNix0Zh0Bqa5VnbeMuf3DR9EINzzwG6IHN/qZgJ/QuXPtBNnOGOt5B6KKVAyQGRBX6ED5/n8NEg1vlg1nASugwl7FMTBw14h08FHzaKZRp0KEn0ow5whgLQidNfM5y6+EK2M6CMFrw7Xwkqsz+wZwIrZ3U4F8W+R4lAgDyF/HMzfIDRw4/K3Y+TXMXZQerj+5Lk63ZOE5YoNr3DIK3busECRMpdORj31n8z+kgZagB/OXNtce3rHnKmpIXzNZLjIKnqRX9vTMfU3B0+luSLrKc1F3s+4UZIjrbFSh/Bj8vVXgyy33HxUXvTWzrW0pP4moo978HG2sunrTPeKCKMLJn8ExwnOMLQD7pFY/MdjDG5NE6d6MnIIcIEU+AF+dqNNMraCu4dSWZmAZw3h0TZd74Oj9Vcgq28YU2gQphrzkJ5d8qCk6Flw1nNh8jhEDA9duHXTt6YEdKgj7vsWAAakNLTtUp4NqAtJRojtNH+JBX6VNMwxeiynDOqNXqlekjmLM9qAll7h2Bya9UNjeo4XlfgCqsnhHzGZ8MXAFf9ltcnaKrG0BTRKTqPkDTLDarx6xNogOF51b2kxEZ+omHXi8QSP8f5ynBB6Gt+aOa/CYhTD4ipYPJ1cpEH96yPTsyNAOidSD9V8e9rhnUSwEYrlC2510C+KVmtYLxLmGE7XLH+j0CLiE6u8sSyAnEffcua2/4M+9fkZDN25BHurdY7LQ3Qqy2UkAZMHnI6dIk0D+5lsNPLm/IOdoHbGnHWaqajjileEQWUu+qXsEXKs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(22082099003)(18002099003)(38070700021)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R1drVTNtbkVtdHlsMEdJRWp0czJRNFd3SzhycE1idDJpWXNSL1haSWN3LzFU?=
 =?utf-8?B?V3U5a0NoYWNKcDFoWitwczl0b2trOXBoUDU1c1g5dXV5RjZ1UXpsS2t2aW42?=
 =?utf-8?B?SGprMjJTVG40SE40TzZ1eEcwVmRxRVg4elowY0o3RjJvc3lYRHpkb3d1dVM1?=
 =?utf-8?B?SkRuSnZWa25Qdno1ZTJmSjhmd1VSMjErZDU3WFJ3bDA4bkI3bXFORjVWUlJN?=
 =?utf-8?B?cEJQZjQxa0hhdC9OMmZESWpxOTY1cGNtb2EvZkM4Sjk5bUNnQWUzVTIxOHdN?=
 =?utf-8?B?bG9BVm1tbFo1cWJtQ2ovL01xeDgrTG1tR0NXd2hTSnlNZFVlbnBlY3IraUxL?=
 =?utf-8?B?b3ZiWXNHeHg5cS9pZThYNDR4OWwrUFZER1NrUFFuZExEUHBWRGJubEswdW5x?=
 =?utf-8?B?SXRESmNhQ05veUVPZlJkeDA0KzB5VDUxSEtwN2lFOTRWVW9rN1B3WU1uL3BG?=
 =?utf-8?B?U083L0d5eHp5V1VvYUhRU0xIbitieDd6WXF3VFR6Y2Q3RWRWNWxQOVpFMGxz?=
 =?utf-8?B?eEhsNStVazd0ZW5odmRiWGhNUXdMVWl3OXVvdFpJS1Q5eHRYcCt1UTJUcFQz?=
 =?utf-8?B?TW8rdS90T1RXd01xK1BaUk82YnlpSUxUV1F1WHJ6THdRVi9JRG1EZzl2SzRh?=
 =?utf-8?B?OWNhcGJJaTlVVm11Nkg0VkxEQlhVdWZnN2FmL2FrZGE4bTlIallqczZ2Rm1i?=
 =?utf-8?B?YjFLVkl0NzhuK2Zublh4NkU3dDdtVUJuZkVJeVBHenJKZHgxMkV6MW5zYWQr?=
 =?utf-8?B?Tyt6Tkd1V1czVzRrbkRxK2tIckdkNFFkN3ltTUNqQmh3Qy9ueFlSODZGdzFM?=
 =?utf-8?B?Uk05OFZ6NWpacmtxZ21LSi96Y1dvbFJPY09sbkprRFF4d01CWG1sUzdFandK?=
 =?utf-8?B?aFFGcDU1Y1RJTDhhdDF6ZEhEOXNFY0ZkcXBxMEhVand2d3ZwK1ZndnQ3NXgz?=
 =?utf-8?B?cnplRFRNQk5WOVhMclFiTVZCYXRYNnAranh3dWZuTytiTGZzd2xDdjZLVnNo?=
 =?utf-8?B?NHhQUmVhSlIwWFU0SEgzcnBHQWhxc2lsakxQamxGME9paWFmSUJ3d201MExu?=
 =?utf-8?B?OFdDc0tlVkUvSXpJZ0N1WlRDVHFERStURk1xZSsvTzU2Q2diWTZSb3JMbzhl?=
 =?utf-8?B?VHhMVHZFSmphRlMzRGtmVSt3UDdqbU5vdGV5RFZnVXBCR3c0RVYrL1ExS2U5?=
 =?utf-8?B?WHVqTDlFZHJLSk81aElmSTJub0pQVjBPdkcxQ0dXVmxlbGMwWkp4dDJnUHd2?=
 =?utf-8?B?aE1HL1gybjRJaERlMnEwVXJqUFRIbEcxeWc1NDFybWpLK0piUDNEWE9NbENH?=
 =?utf-8?B?d05nYUtTcWc0OEdVTlRNeHFaQTlaMy9xR3BmOGJmWm1Ma29FdjkrcThKYkJD?=
 =?utf-8?B?QjRFY2NZL0JKTkJwcUlMUy9HRVpJTFhLMUNTRFJ1UmlLQitHK3J0TzlpS1pQ?=
 =?utf-8?B?cTBxeTJETWNKWkUxTzlvamF4Y2tpYlFyZURsSHFjWUl1L1Y2eklPcUxrMEVs?=
 =?utf-8?B?SmVYRlZ4NThYNUFscEF5U2RlV04rQ3JUY0IyY3FmUDc1V0trV1NyN3N4MXhW?=
 =?utf-8?B?U0ZkNzBKYWZXWlRtcTk4UThXcGtOQ0VPY0ZhSjVWbWJlTll6Q09ncWx2dzBo?=
 =?utf-8?B?UXMyVC94MTZoTnVWWXZXQUl0VzVzRU55L0xHb0dFbk5XcWVSWHZXRnlYWGtN?=
 =?utf-8?B?eGdZVHdWNDd6dUcxYkZrUTRMQUhJeU5VRGd4c043ay9QTUhvZ2k0OHhjZVZY?=
 =?utf-8?B?NEVsZklMSHh5b256aWp0dDh4NzZpeUdZdnNYeUVRaGJPYjdLams5U0N3SEht?=
 =?utf-8?B?T3ZIb0ZEMWY3d3RNQ1cxSE5yTU5vRml3ZjNIMlgvbVhqM2N2OXpUaFMzUVYz?=
 =?utf-8?B?UWFSV2xHbTY2NWkwRTZTaGlKMjl3cmZ3YXoxejJoVSs3aEJ0dWtKYzdmaHlV?=
 =?utf-8?B?WnZ4Q2JVdHZsRiszU0hYVGYwSHVXWnlnZERRWFFnZUFkbE1yaWdyTjkwVnhF?=
 =?utf-8?B?cUw4SmNJMzVaSEpKSTRncjRGYThoU0lEK2swVlZoMmdlMVIyd3VFMk00SGpD?=
 =?utf-8?B?REwySmlpWXNyQVBnZjVhOU9vaEdXZHVtcEl4WXIvZnc0aHJNTjNYUW5UNjl2?=
 =?utf-8?B?dk1GZ2xTdGFJRkVIRXc1a0p1NEUxQ3Y4WW40ZTc1VFhmNWtWTUs4dmxqaFlY?=
 =?utf-8?B?bzI3bDJpZmJ2TmRwTWQ1RXN0UGhFdmoweTdWVXgvTWFFempCZWlGQWhucGZi?=
 =?utf-8?B?RmZZd3owK3pkakMxZjNhL2hUYXkyTkZ2S29MK083MHU3MmNBM1Y0UWJkSGhp?=
 =?utf-8?B?WVp5bzNIMXc4bXFRdXlvam92aWx5K1BJK0MwNDZyQWNaZHU0UTlnQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B0D3A79E73BF041AB2615ABFD8FC5B1@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	XrN0y+CbXQWpqbyJ9eBt5Nh/dmB668K5Mnf2L8WIt7kvO6MYS0hPAlGR+n2OysNNOOUqRWLa3XYkWAoBMQw2gxmwcR0vLApet9CL0wtiLeG6C9EjzLKOyaqMQ7kup5D5X7Pb30VxdwBUx3gnakwNsIO90yyOWSt2BNgc8m2BoQAU6nzGf+bdy0ZCuM8ryDlQg0C/g331EwDqsINunum3TorTMQBU2m/3ae0aaJhqd4a9Ja9e9xqogIDDjxuPqvGzF37zZCfwwVmYg8FB9oG7TTO4aJTkncyQp0iVuh13dnfki6KwleaO4+ThR3uFebxTk4DAVFJqfkmZH2wPoppMvw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Z10NchXHw0DmzLjSS2aeASE4m+CGUrIQUUBIzBaFR2Awr/P7iBQaHQvnF1fUDf8JoTKLGe2e+5B6gL/Vg+dZivzKVxsf1gQswN55iWe+Q0HUWNEVWbldWx8r55MDUaHu4/x4e9eubualemzvyZkzQF0wfgKBBb7d7Ky7piSD1DlUqvxRUKg/hqIuJyhMBhrMQqeHyxQYsoVVEyQ3x01jE+pHtANzed6Iaq6TCfrfCN9jZzD/2DCj+yeSJxNP5UPPldNQNLqjARuIVlTYDCB+f2XD9R6BeEsvhFpiTuxqfL2gxDV/rV91mLjW7ZPEZG2PzEMFW1lqJTZe0/ZPVdaEB0jl3zqog/MxuYsAjuov5+U32sYxf8DSuWt23RZ89svRA/6YzEEuoaB0BxFCHsbZHIZMIfa6vMoUtYpa/Ma/8M4SbUbO9rq4WvJ5imoT5u7hitmFbMXOfZf6emrdNIVXQ5DYbiuWu6AawJq5JAoFLOeoU8scT/TTdKgZLeyLNeUfR+8WK70GaUk8XyJc5YW2O9VmvS/FMD5mfGGO8nTnRXWxnw5ldrU+f+QYbfzIlUOHaeQfxp5eTPU71JulAzsBQ2yVA3PQImiu3Gnlo64357d12zlLEu5DIqSh4ETGyFqX3cb45b+iISOXO3bEJCzPSw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d55c6f-dbd7-41bb-7216-08de9ce22835
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2026 00:33:48.4039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ufP1vUgc+f6dx5/ZTzTZULTF8Ukf8r5lwIaEYMAkNhSt2yAm0CQehUoh7QCJkzGaCE0nk+ICsslOLHz/VH0d7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5760
X-Proofpoint-ORIG-GUID: kDNKVXrgpMoObPKe5N9ig267gXWzfxkp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDAwMyBTYWx0ZWRfX27dkwA0yBxav
 MPh/fAwXVPbNq7Hq1DLt5lMev8HtHUPFqYWX8CF19e2t2279Pze3yqkgyNBkQ/0ktGSBqgapAoK
 7b/JGLXsdFEqzgdyAXdZrDkN2jBQw2icBzEPBqp9Xt+aU7agGkr0bmN4xva4DzitnCmZr6hfUjB
 ZawF0Gi1rOAvGvb8yUtGhZJq8n2FdFpTVoyEq/Fj0ucBC5zNhpDM9PpFHVzveimktbG805XM431
 m8BjlBB54sDS6hfKbvITi3/AlM970iINaFM/Kh6V/ctrgTG6tJs4XkDl3YbFadOrS375N/iIYwc
 64oVF/ta54liCaHTYQIKTk25qD++k4hgxByB8YaG9xKRT0u0oTYq+eKa5YkgXIm2BP5MU5hcnPe
 foCy+h9TD0kjM7yUmDB6rpZCqy9sC6uV3J6r6d0qZvM8dx3eyQOSDWl/szzDKTBys5LqiBzbPW3
 lMWdGxAOlfjlNrMGcOg==
X-Proofpoint-GUID: kDNKVXrgpMoObPKe5N9ig267gXWzfxkp
X-Authority-Analysis: v=2.4 cv=aZFRWxot c=1 sm=1 tr=0 ts=69e2d171 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8 a=FhHlajqUvV0FnZ5quzQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1011 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2604070000 definitions=main-2604180003
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36304-lists,linux-usb=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[synopsys.com:dkim,synopsys.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,urldefense.com:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	REDIRECTOR_URL(0.00)[urldefense.com];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7CE5B41F776
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gTW9uLCBBcHIgMTMsIDIwMjYsIFBhbmRleSwgUmFkaGV5IFNoeWFtIHdyb3RlOg0KPiA+IE9u
IFR1ZSwgTWFyIDMxLCAyMDI2LCBSYWRoZXkgU2h5YW0gUGFuZGV5IHdyb3RlOg0KPiA+ID4gVGhp
cyBzZXJpZXMgaW50cm9kdWNlcyBzdXBwb3J0IGZvciB0aGUgTXVsdGktTWVkaWEgSW50ZWdyYXRl
ZCAoTU1JKSBVU0INCj4gPiA+IDMuMiBEdWFsLVJvbGUgRGV2aWNlIChEUkQpIGNvbnRyb2xsZXIg
b24gWGlsaW54IFZlcnNhbDIgcGxhdGZvcm1zLg0KPiA+ID4gDQo+ID4gPiBUaGUgY29udHJvbGxl
ciBzdXBwb3J0cyBTU1AoMTAtR2JwcyksIFN1cGVyU3BlZWQsIGhpZ2gtc3BlZWQsIGZ1bGwtc3Bl
ZWQNCj4gPiA+IGFuZCBsb3ctc3BlZWQgb3BlcmF0aW9uIG1vZGVzLg0KPiA+ID4gDQo+ID4gPiBV
U0IyIGFuZCBVU0IzIFBIWSBzdXBwb3J0IFBoeXNpY2FsIGNvbm5lY3Rpdml0eSB2aWEgdGhlIFR5
cGUtQw0KPiA+ID4gY29ubmVjdGl2aXR5LiBEV0MzIHdyYXBwZXIgSVAgSU8gc3BhY2UgaXMgaW4g
U0xDUiBzbyByZWcgaXMgbWFkZQ0KPiA+ID4gb3B0aW9uYWwuDQo+ID4gPiANCj4gPiA+IFRoZSBk
cml2ZXIgaXMgcmVxdWlyZWQgZm9yIHRoZSBjbG9jaywgcmVzZXQgYW5kIHBsYXRmb3JtIHNwZWNp
ZmljDQo+ID4gPiBpbml0aWFsaXphdGlvbiAoY29oZXJlbmN5L1RYX0RFRU1QSCBldGMpLiBJbiB0
aGlzIGluaXRpYWwgdmVyc2lvbiB0eXBlYw0KPiA+ID4gcmV2ZXJzaWJpbGl0eSBpcyBub3QgaW1w
bGVtZW50ZWQgYW5kIGl0IGlzIGFzc3VtZWQgdGhhdCBVU0IzIFBIWSBUQ0EgbXV4DQo+ID4gPiBw
cm9ncmFtbWluZyBpcyBkb25lIGJ5IE1NSSBjb25maWd1cmF0aW9uIGRhdGEgb2JqZWN0IChDRE9z
KSBhbmQgVEkgUEQNCj4gPiA+IGNvbnRyb2xsZXIgaXMgY29uZmlndXJlZCB1c2luZyBleHRlcm5h
bCB0aXZhIHByb2dyYW1tZXIgb24gVkVLMzg1DQo+ID4gPiBldmFsdWF0aW9uIGJvYXJkLg0KPiA+
ID4gDQo+ID4gPiBDaGFuZ2VzIGZvciB2MjoNCj4gPiA+IC0gRFQgYmluZGluZzogZml4IE1IeiBz
cGFjaW5nIChTSSBjb252ZW50aW9uKSwgcmVvcmRlciBkZXNjcmlwdGlvbg0KPiA+ID4gICAgYmVm
b3JlICRyZWYgaW4geGxueCx1c2Itc3lzY29uLCByZXN0b3JlIHp5bnFtcC1kd2MzIGV4YW1wbGUg
YW5kIGFkZA0KPiA+ID4gICAgdmVyc2FsMi1tbWktZHdjMyBleGFtcGxlLCBmaXggbm9kZSBuYW1l
IGZvciBuby1yZWcgY2FzZSwgdXNlIDEvMQ0KPiA+ID4gICAgYWRkcmVzcy9zaXplIGNvbmZpZ3Vy
YXRpb24gYW5kIGxvd2VyY2FzZSBoZXggaW4gc3lzY29uIG9mZnNldHMuDQo+ID4gPiAtIFNwbGl0
IGNvbmZpZyBzdHJ1Y3QgcmVmYWN0b3JpbmcgKGRldmljZV9nZXRfbWF0Y2hfZGF0YSxkd2MzX3hs
bnhfY29uZmlnKQ0KPiA+ID4gICAgaW50byBhIHNlcGFyYXRlIHByZXBhcmF0b3J5IHBhdGNoLg0K
PiA+ID4gLSBGaXggZXJyb3IgbWVzc2FnZSBjYXBpdGFsaXphdGlvbiB0byBsb3dlcmNhc2UgcGVy
IGtlcm5lbCBjb252ZW50aW9uLg0KPiA+ID4gLSBSZW5hbWUgcHJvcGVydHkgc25wcyxsY3NyX3R4
X2RlZW1waCB0byBzbnBzLGxjc3ItdHgtZGVlbXBoIChoeXBoZW5zKS4NCj4gPiA+IC0gRml4IGRv
dWJsZSBzcGFjZSBpbiBjb21tZW50IGFuZCBtaXNzaW5nIGJsYW5rIGxpbmUgaW4gY29yZS5oLg0K
PiA+ID4gLSBVc2UgcGxhdGZvcm0gZGF0YSBpbnN0ZWFkIG9mIG9mX2RldmljZV9pc19jb21wYXRp
YmxlKCkgY2hlY2sgZm9yDQo+ID4gPiAgICBkZWVtcGhhc2lzIHN1cHBvcnQuDQo+ID4gPiANCj4g
PiA+IExpbms6IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyNTExMTkxOTMwMzYuMjY2Njg3Ny0xLXJhZGhleS5zaHlhbS5wYW5kZXlAYW1k
LmNvbS9fXzshIUE0RjJSOUdfcGchWVNleVktYnBRck1McXN3QWMxY1dORDVDU0h2R0Z5Z1BHTUVN
cFI5YW1yUk1uUkZqWXJGWmt0emJMekV6VlpjUW1PVzM0SVVBZndSS0h3eTdCOHBfY2lVb3JXR0pz
QSQNCj4gPiA+IA0KPiA+ID4gUmFkaGV5IFNoeWFtIFBhbmRleSAoNCk6DQo+ID4gPiAgICBkdC1i
aW5kaW5nczogdXNiOiBkd2MzLXhpbGlueDogQWRkIE1NSSBVU0Igc3VwcG9ydCBvbiBWZXJzYWwg
R2VuMg0KPiA+ID4gICAgICBwbGF0Zm9ybQ0KPiA+ID4gICAgdXNiOiBkd2MzOiB4aWxpbng6IElu
dHJvZHVjZSBkd2MzX3hsbnhfY29uZmlnIGZvciBwZXItcGxhdGZvcm0gZGF0YQ0KPiA+ID4gICAg
dXNiOiBkd2MzOiB4aWxpbng6IEFkZCBWZXJzYWwyIE1NSSBVU0IgMy4yIGNvbnRyb2xsZXIgc3Vw
cG9ydA0KPiA+ID4gICAgdXNiOiBkd2MzOiB4aWxpbng6IEFkZCBzdXBwb3J0IHRvIHByb2dyYW0g
TU1JIFVTQiBUWCBkZWVtcGhhc2lzDQo+ID4gPiANCj4gPiA+ICAgLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdXNiL2R3YzMteGlsaW54LnlhbWwgIHwgNzAgKysrKysrKysrKysrKystDQo+ID4gPiAg
IGRyaXZlcnMvdXNiL2R3YzMvY29yZS5jICAgICAgICAgICAgICAgICAgICAgICB8IDE3ICsrKysN
Cj4gPiA+ICAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmggICAgICAgICAgICAgICAgICAgICAgIHwg
IDggKysNCj4gPiA+ICAgZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jICAgICAgICAgICAg
ICAgIHwgODkgKysrKysrKysrKysrKysrLS0tLQ0KPiA+ID4gICA0IGZpbGVzIGNoYW5nZWQsIDE2
NiBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkNCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiBi
YXNlLWNvbW1pdDogNDZiNTEzMjUwNDkxYTdiZmM5N2Q5ODc5MWRiZTZhMTBiY2M4MTI5ZA0KPiA+
ID4gLS0gDQo+ID4gPiAyLjQzLjANCj4gPiA+IA0KPiA+IEhpIFJhZGhleSwNCj4gPiANCj4gPiBE
byB5b3UgaGF2ZSBwbGFucyB0byBjb252ZXJ0IGR3YzMteGlsaW54IHRvIHVzaW5nIHRoZSBuZXcg
ZmxhdHRlbiBtb2RlbD8NCj4gPiBUaGUgY2hhbmdlIHlvdSBoYXZlIGhlcmUgZml0cyBiZXR0ZXIg
Zm9yIHRoZSBuZXcgZ2x1ZSBtb2RlbC4NCj4gVGhhbmtzIFRoaW5oIGZvciB0aGUgcmV2aWV3Lg0K
PiANCj4gSSBoYXZlIGxvb2tlZCBpbnRvIHRoZSBuZXdseSBpbnRyb2R1Y2VkIGZsYXR0ZW5lZCBt
b2RlbCBpbnRyb2R1Y2VkIGJ5DQo+IGNvbW1pdCA2MTNhMmU2NTVkNGQgKCJ1c2I6IGR3YzM6IGNv
cmU6IEV4cG9zZSBjb3JlIGRyaXZlciBhcyBsaWJyYXJ5IikuDQo+IE1vdmluZyB0byB0aGF0IGFw
cHJvYWNoIHdvdWxkIHJlcXVpcmUgc3dpdGNoaW5nIHRvIHRoZSBuZXcgRFQgYmluZGluZw0KPiBh
bmQgZG9pbmcgYSBsYXJnZSByZWZhY3Rvci4NCj4gDQo+IEdpdmVuIHRoaXMgc2VyaWVzIGlzIGFs
cmVhZHkgaW1wbGVtZW50ZWQgYW5kIHVuZGVyIHJldmlldywNCj4gSSBzdWdnZXN0IHdlIGdldCBp
dCBtZXJnZWQgZmlyc3QsIHRoZW4gZXZhbHVhdGUgdGhlIGZsYXR0ZW5lZCBtb2RlbHMNCj4gYmVu
ZWZpdHMgYW5kIGxpbWl0YXRpb25zIGFuZCBwbGFuIGEgZm9sbG934oCRdXAgbWlncmF0aW9uIGlm
IGl0IHN0aWxsDQo+IG1ha2VzIHNlbnNlLiBJZiB0aGVyZSBhcmUgbm8gb2JqZWN0aW9ucywgSSds
bCBzZW5kIG91dCB2My4NCj4gDQoNClNvcnJ5IGZvciB0aGUgZGVsYXkuIEkndmUgcHJvdmlkZWQg
c29tZSBmZWVkYmFja3MgdG8gdGhpcyBzZXJpZXMuDQoNClRoYW5rcywNClRoaW5o

