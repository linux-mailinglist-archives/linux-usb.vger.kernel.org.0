Return-Path: <linux-usb+bounces-36303-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NVeN2XR4mlY+wAAu9opvQ
	(envelope-from <linux-usb+bounces-36303-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 02:33:41 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B4D41F760
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 02:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C9053058DFD
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 00:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774F6229B12;
	Sat, 18 Apr 2026 00:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Y4Kt5G4L";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dQCAIjYc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="vmhT8tsI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D264175A5;
	Sat, 18 Apr 2026 00:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776472396; cv=fail; b=Ajl47pijhPfVXFjZS+BbtWK7qCyLcu6yNrxWLFWd+liMa8ynWLhQcAEINw0r53NPGHZ40whEfcraL04R2Wiu4eTxay7+qANrleZxrrYoFEX1DD/P8zqV0H7iLKI/K2DgpQCd/h1xRMEqqIQXCTSgd4bixc/AjaIcmxTFvhjv8c8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776472396; c=relaxed/simple;
	bh=sZdFL+vVyiBgiIyIESlKvt+dg3hMaJdU/EVBUP+xBrg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WUjtTafJ/sEX1Uf7j3feqYDIB+sLnZDlS+yJL6I0D2edTcmaIaHAdun150BdzvqZdmSX/KIf5raUq6sD/wUvAL87N2GnqgG8PSmQfV8q8OGl0OBtOt7wZskCm6wSoOeOjeY0OEFlVpqNQ+ReXKdjhes0H8DAVs36DEZuB0ulMSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Y4Kt5G4L; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dQCAIjYc; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=vmhT8tsI reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HLfbE14139857;
	Fri, 17 Apr 2026 17:32:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=sZdFL+vVyiBgiIyIESlKvt+dg3hMaJdU/EVBUP+xBrg=; b=
	Y4Kt5G4LYAOFMobpiRphg/90S25oFevG4V86LYSqGNTIo1cufGiM05ido/yr+/i5
	P4rV4MEucnGOJXhAFOHTHt0Z6bOlvA8+cOVlZwqXt3MvlpnaqFMVFAzZ1gFL6GuF
	WBk7VulL0u1qU3jkKMDsP81uLqki6g+pAlhaF52EdxdjU7zdF92gwSSLMG0EjUxR
	TMDrFF+05EwwQmhyp1YDRveOO4MuDRl4op+KONR5Ceq7nx9/omzokP/d5thdPCTx
	pVnzTlNPVpr89Bqsb9vAQR0qO2qMpKBnMgF2V60zMox19PD2X9/N757urdMl9cIe
	X3LbO7k7w31n0y/1h9+O6Q==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4dkks43ucq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Apr 2026 17:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1776472370; bh=sZdFL+vVyiBgiIyIESlKvt+dg3hMaJdU/EVBUP+xBrg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=dQCAIjYcxsjsFbGwVtj5r7Gl3yEyAshszhY2RR1BjoTCRgi7rLpQmKBJ9Z6SJnw+4
	 RkLGNQjROTR0lNDiGV+IHXYk63vRrBCFETnyITtbR3vhb4mU4KR9XSu5X98Nt1YbO2
	 beNXF9jCfWhDPGP6FO4uNK4XaPLC16zYBHBYyPGHyMzIfIHkcuXp3koeZZ7/6KNCzv
	 KQQJvN5f25+q6U01mgGcU44VC5D7Na1Pr0sZpdi+Y1QedqKY78f+5tz9VTL7hj0ur9
	 7baIdIY3IoJT28/O/3lbtC2bw7IEZXpWK7XI4Z4e82KOljebF28fIv2GnZLsgqNPR8
	 salLtYhfDpDaQ==
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6ECF2401EF;
	Sat, 18 Apr 2026 00:32:48 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id ECCBCA00A1;
	Sat, 18 Apr 2026 00:32:47 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=vmhT8tsI;
	dkim-atps=neutral
Received: from BN1PR07CU003.outbound.protection.outlook.com (mail-bn1pr07cu00300.outbound.protection.outlook.com [40.93.12.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 938DA40818;
	Sat, 18 Apr 2026 00:32:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YWeuNkZYECj8bdXK4iELAm/3saWObvEDzHMaIXAYEY8Ugc14NZDoXd9TrBH4MG5sM+S9QZKivPyvNXM/kqoAYlhFS4v3WaDxowx2MYe50djFAjUFFYKbQJhhJizWS9mUT9eYN8iHyOQ8f4If4FyIJz3Y+kya1ERroGX1Wlojbn6dYtIRiyBcUaU+ZTyCK/hARdoiJOvRRIEH7XDAUS9KmksFBdQCm4p/r6EL4THfa4vujjqT/OaGL25WW8jDl0bQelx4UVTV3bQKoQnPYRZ73N5zwXDUedrwWPp0davAuxkTib6RzkynL6498mtuIcPj/nOtBIJa3OHh/xBY7FB0IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZdFL+vVyiBgiIyIESlKvt+dg3hMaJdU/EVBUP+xBrg=;
 b=y5tfK25iNEBetK6dA63Fpac0jsqDXGZBMoA4H0XCAzeTXh+UZh0X2D2+GpzFN2Ma4m4/V/82sidk2oXU0M+uZcdUYzFBYo0Zh0VnZhp8MBTdzqMTdgKDq/80AmjLDkN8gry6/ChsXhUGjBSNYHlWGtW0gb0Cna3DSHzWxFPmF/lHFUjgfsch85LMrw/RV0++JTIh2Pu8tVw05O6BDz5UsIInlQ8tEyR5ImUvCeRkn9ugiF9lathBgQLPpWxQ1nj3pkp8zBk3Ezx7BiA9S637IWSGIn/0EhlV6ngrkds3iAL8/IbLplKxbNNka7ZuqHeAWlMBnJrEymr7TpJFJjlVPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZdFL+vVyiBgiIyIESlKvt+dg3hMaJdU/EVBUP+xBrg=;
 b=vmhT8tsIdkDPWMl6sSz9LmnJ3mEp1HrBavqsbM1SeDixMsn9sHaFSei1seEDQ1HdnlZFbV0Sh2JXocj80cRaG/tTMhwyOIEGMHsSP/UT8G7PACLzga1/CV/GMM3snWwm77L5vGbURWxoJjxKoxDm0jA/hqH/TWszi0HrSpkdlZ4=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH7PR12MB5760.namprd12.prod.outlook.com (2603:10b6:510:1d3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Sat, 18 Apr
 2026 00:32:40 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9818.023; Sat, 18 Apr 2026
 00:32:40 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "michal.simek@amd.com" <michal.simek@amd.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "git@amd.com" <git@amd.com>
Subject: Re: [PATCH v2 2/4] usb: dwc3: xilinx: Introduce dwc3_xlnx_config for
 per-platform data
Thread-Topic: [PATCH v2 2/4] usb: dwc3: xilinx: Introduce dwc3_xlnx_config for
 per-platform data
Thread-Index: AQHcwHfqLpB+tX1wa0mPFx31xBA6vbXkFMIA
Date: Sat, 18 Apr 2026 00:32:40 +0000
Message-ID: <20260418003234.vmr5lc67jvovlsmo@synopsys.com>
References: <20260330190304.1841593-1-radhey.shyam.pandey@amd.com>
 <20260330190304.1841593-3-radhey.shyam.pandey@amd.com>
In-Reply-To: <20260330190304.1841593-3-radhey.shyam.pandey@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH7PR12MB5760:EE_
x-ms-office365-filtering-correlation-id: 97a25227-7c1a-486d-bc14-08de9ce1ffdc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 1qj2VdmERmX8izgUYZXe+3EVMar9UceeJ6mcwELDrWPtGvX1f3zYE/01CNiTUFliJjkSq+N8GbnUwsBcrAKWNkz6z8RzyFh/hzkMqzePK2LfLOsMEjqfGIifLli/7ilRqm2l+grU5SFh2h8ug/uhrG4GQbfmvlRQzttd68BljwIzweQyTi/mzVSctlFjFpfWUA1s9D5ZJmWKjbCbCAWuvh3g00mfAxwz3/j/3h3GNQqtXaECdWBpzbxxc06pXCV8xRWrt6Y/xRcLmiuv6Dfu1ir7N0TwoOq8CXlpNAhskebHMmJhYfxZH0t1mOT5+izYud4wCz1oZPKsdCVFWAqL49G5KgeAVS3GBimYnTp6IAscNvhJwJwNNLMqVHzI6AcH8nH2/3+OH23FfU8aP1W58HK6GExJyZ35eTD3qJU1mDg9mNXEha63flNfMrDE6ueZyNd3Dx6juw7C8ilM00x64vsTDDwrLKzBsiPYcBLg4nQfaruVBwAdV+tMY0ht59cGMxaDWxrUAbMIu0pmffQKOhfo7Yauas758bEQuN6WYjrTpncJKdN5XjDfoC35jFb2TybZ8ft/q03VoMUo0Dp9qg0V9hQph5llN590RnE6Zm3IFFSfGfL+9RuyGpcWz/pCBXjn9Kl55J+FsYa2ZZzEKZL4oRFpX6ew2LB8gyXDPZUPQuqRAzRl7ipJG4VFVOkut+OIJA/amM/cAQ02NBHx0XEiKENrKPkJRss1wQGpGO2/A1A/DUsW/6PMHYcV8fJS+QdZNiiV+XvSB/vTj9+ZtJixi44V2WYuwYIEhdku7yU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WWNnVGhza0tDbmNCY2NyN2I5UW11a1Q5VVhFZHZKcHBMSHBTbG1KeGFSdURC?=
 =?utf-8?B?c3dBaG5obDBOQncxT2dKbHhOQjl4eUkydy9Ec0l6ZU41K0JsWElxZGFMRlE1?=
 =?utf-8?B?L1p3MW5vWW8vamlZbGFvQUJnOVFFMkpSQThuWGMvK01QTGptRXJ1bnMrS3Rk?=
 =?utf-8?B?Rk9JNEh0cWZIY21JRzJhZGZmbDM4Tm5XQ3pkS0owU2JZZVZTbnpFVnY4ckZm?=
 =?utf-8?B?TGx1RTljQ2JES215bVQ3TTg1L1pwaXI0NGd3S1g0VExycnNDbjE1STQzZ3Ni?=
 =?utf-8?B?UGs1YkdNbGtMREhjb1RjVHd4L1preTE3OUlScGc3T01ySUpzUUpyQTRaN3FN?=
 =?utf-8?B?eUxrc05QT1oyTXlmOXJvaERiUDl1aHFRQU9kaGh4V0Nra09iN2VnNm9XRmY1?=
 =?utf-8?B?Mm5FMFdhSTE2MTExL21FbDR6d2VVL3hUeUpHSFFFWTJzM1Ewb2RNWG9HTXcr?=
 =?utf-8?B?bVdZRU5tWWZsdWFzNzZqQ01scmlMdk5rbU5pRU5wSVNkNkowSWM3bXRWbXRH?=
 =?utf-8?B?Y3FWQzdVOGJJWURMZEwyeVVpV3hLZklEZDQwMlYrOHpjb2pqZm55M3dKTTkr?=
 =?utf-8?B?UG9JZzMzb3dteS9oSFFnWlVZMzIrRzQ2cTg0RmpwajY0c0Z2UjBSdDlnaDZ2?=
 =?utf-8?B?ZFRGY3hnZUtLMll3bW1MaEVsQzhVUERMd3dYUVUwWkNuNUNESnYyR1RJUnVS?=
 =?utf-8?B?Q0prNnh2ZU44VFhqQXZmL0JQTWhvQ3JIOVpqVkEwVmg3eWlhZkdFKzZ4NTFE?=
 =?utf-8?B?cmwyaUNCdGRsVU95TnVOQUxDZzF5L09xOEJZWmg2ZnRkSTNLTmFLMFBYU2xW?=
 =?utf-8?B?blVDMHo4UHAvVkg5WXVvcHU5SElJdDE5L1V3am83RUh2TE5LTnRPOFMzcFM0?=
 =?utf-8?B?bUR3d296bG5NcWJsUjFoNnozSC9vcU5rL3Z2Zm5BNnBuenNtRkFNMFd3eHRM?=
 =?utf-8?B?dlkvZksxRWRWZzc5WjFYdU5kTTgzbEVyV2MweW5kSDRIYjJ3T1laR1N0bS96?=
 =?utf-8?B?SStMQzk3WFhlenhzLzN5V2dCL1ZlaW1NOEN0RnRTMFRjU2NVazhYYkZzeENF?=
 =?utf-8?B?d1JqWkJYNHQ5bTZVOG5XVHFFYTIvUHMwcWZUS1JSZnV6OVNUK2xHcmtwZ1Fr?=
 =?utf-8?B?a1NuRDVNUUw0OWxRU05iOG5qZnpwTm45d1VORFMvU2NnM2xLMHJ4d3BEMzgy?=
 =?utf-8?B?ZWpXblk4R1FiL3UvY0c1eUtSZE1FaHJuLzRVY0RrTWd6Z2ptanVWM3JKbEp6?=
 =?utf-8?B?ZU1IZHdPU0FQWlRndzlOTVhCTHBjc2ZmbFVncEIreXFDTDhZcjh4cmZYQnAz?=
 =?utf-8?B?YWswMVRWcThkdmRuSEdGZ1Y0anZXTkRTcDhqamJlaStzS1VPYlpQaWJBL2tH?=
 =?utf-8?B?WkFUVCtwM3hockdVYmthbTNLSitIdUJlY3I1L09lM1BraHhvdHptOE4zLzJ0?=
 =?utf-8?B?am04eGE5MXNlM2lUQlhMcFdMMFhZdGVMU1FTOUllaGtTcER0QnVpT0s5aUNL?=
 =?utf-8?B?YW11YWJsSk9ycDZERUc3d3BHUGRhZ21vc052MEdHVElSOEZnRnAvdGNGUEsx?=
 =?utf-8?B?bEl0TEVnWmFxZ1l2U2tUb0xXUkFwRHQwMzd2ZEJjNFRoT3FBMlVRc1BJV0NI?=
 =?utf-8?B?cWgzeXQxcWV6b0x3cGxxYVJYL0hlR25IekE3TERuUkJOVXh6VnMrZ0p1RDdK?=
 =?utf-8?B?MzdReEJsdkpqeWxMeXI2QUtPSXp5ZUc3eEFqRFJzUWFud1BueUdVZ0ppTkhT?=
 =?utf-8?B?NFNSeS9lQUxGeUhtVGZEYmVsY2ZyU3p4YUVUUmJuYk5DYTlGakxGYXRadktC?=
 =?utf-8?B?Nkh4R3huUnJ5OEd2NG5pajFYVmRDbHNJT1h2SXJBY2ZDcVhLZGhJMmI1N1Q2?=
 =?utf-8?B?STU3RVE4aGR5dENZTWNCcDNwSk1tZlhnTzZPRlVaL0cwcnhvcE1RNzFZa2lG?=
 =?utf-8?B?WFI2Wmp5bjAyWGJaZ2VOUTY1L0Z1Q0hlSC9qZUd3QWdEYUlkR3RuQWsrdlA3?=
 =?utf-8?B?RENNQUdUWnZicjlYYjNxcW9KVjRUVTIvajYrRUhzc2NPK3VsODJQcm1mQnVG?=
 =?utf-8?B?TGFXZFV3MnZlTjFGbEgwdVpEQkVCRjN6RW1mTUJZOEI2T204MEJvSkRJWXBy?=
 =?utf-8?B?UUF2dm4xbTZjRGpBRnVVQUlLQmpzVUlJNFFVTTF1TkdFZWR4MVBJL3BtNmw0?=
 =?utf-8?B?NmVFQTh5c1dvQURuTjNTaUQyaEE0ckl6bDFOT0luSS9HRThSR1FpK3NPNVRO?=
 =?utf-8?B?MkVCM2NCMkY3WHpaRXBGbXo3WFVqbjBNTGlqVjJlVlIxVWhoTnpiTDNBcWRV?=
 =?utf-8?B?cHhtdUJKNlpmVGs5Y1FidFExVm4veU1EMVZJenNXSUVUQnpQK3pHZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A6A3D09D26D5C54E8CFE88FDCCBB0033@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	juTTZYIdtKNDWxpp9kJBZ9txkKD3Tsyo7yZDEAykQ5Ne0kmu/c0X4mAltgVFK2eRtPutAV7S6zpDI4vOpcxyzfr7Lf/9322JFTjXDOxBLQkT856rFii+W3YAoyu9ZSP9uDUa3aaPIG0/LsSspl+OTQXDKIVSObkH7NDdaWO7Y15+jqAehNuOM9jSroXHKgwsKBGnqoTrukjJUMeC7Ek84FpVNRjScrc2TspTVtJQRt8KxDG5CT4jrhbqcm4+SpIb1wdSPJrFCnRBWYu9bDhRmvoA+qtKN9ykMCkRJD7eUY8b74dI9Ewd88fT+B5ZiYsRNuOQYUR4OSceiuUQrygidw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pS/rj96Kg8U/37Wn2rwrhDkOEOTdRy4FJOyozAErtBYfdrtyJuUySeZiMj/sJFz7tjUDrhdoK7OsQj5QoZvgl3KqoxMBxiUy/No8S17Kenci4WBS7mm/K/in34VvVoJxspLtXVz9bAOwg5tU24+YHvdVB88yvbK29t+qtkYtfa31MNDtTHS4HjJHk2RkOfwGlPc65Yu5IqcJgrpwVeeFKL3yLtdtn6kVYDixAX0rJLLJtZShDacKGbHG4yihapBczcwnlPuBIU6x7AWtKshZvLunPIFCewr2cPjcvCwzJAOqP5sztoiVcAay4t3G/Hj80PkxjLn0nHxEFRcHN0kBV3yshn4hDQB2MX7Xpto3S+ntVwdhWny+nrLyXofT2I04acs4xeaLkOnY3KP6ITsPtNotivoIfUj8wP6LsI0DruBJAuxi5llKNfo4swdtYJjD/DOSLANjwUUGbYwUWEE7D0QuZ+zuTmyGWsVwUF4XKqIeMFaiD0N1J6nKqQwxx0nZXLcPlignZ46IhTwYQeejfzrVARPFIz+xM2ULq0BXe21r6ozwa1Qb66ot7eTaOvhRniYiMxU2hcSuAtpQ3+9aBTIrJSHOuNTd4puCIWk3YiY4G1ER/3WJolzPCpDhXfW58p1dDM6u0RTHp2wXQOa3hA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a25227-7c1a-486d-bc14-08de9ce1ffdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2026 00:32:40.7389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bj5G2FUSvZdUX4lAXBDjuf5NzYd6XXg4HAmcK7BQeEY2i84R4/WJ2Mch/VM7sAUHea0P89Lt+NZxzDXGqKHkbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5760
X-Proofpoint-ORIG-GUID: MzeLhywNTXmfw5qqoRUvqa4EmyPBdiem
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDAwMyBTYWx0ZWRfXwWD9bssRj2sj
 m8y2omnaJ8jZnaSOq6HxPE511Ezw0vtXzaWm5Lkt1CnJM2WxpInRt4madwCXgEs9E0+59IZf7q9
 f22fGkc19tQW2vtHe+tspQ1RO4f+v+rzYY14nrWnW7kPF64aSbuKY5BMxWDTFNijwahBA2SiHtb
 aBRwfSzvuzDcl7+RvrDoBSQnI2NENxiMDzXw/3v62BT48TlKKbXqg+vl8IWy4rr9vq5vF+mQtuq
 71dxAxqxfAAM7YufN8qPj8XEYxGvz8jrHo3gJmqBlMB3/3CaomHbiTJIlHw6ac/gBOZJcKKShku
 moK6MucNnJKIzjM36Wx1BmQt1IzPJJojpH6clv95/fN6c6B845NNbNUMVDOmj+YipO500MjB/rM
 A7oswj9KzgQAth9S5r0NbUaTboU7fW/1XdDZSEfoynfMVZVrrUsc5b049BiP+tg6Li62vG1man0
 aI97jZ0cALFP6H7f6CQ==
X-Proofpoint-GUID: MzeLhywNTXmfw5qqoRUvqa4EmyPBdiem
X-Authority-Analysis: v=2.4 cv=JZyMa0KV c=1 sm=1 tr=0 ts=69e2d132 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=zd2uoN0lAAAA:8 a=H-CxsIZ2ZyNGKywilQEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 malwarescore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2604070000 definitions=main-2604180003
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36303-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,synopsys.com:dkim,synopsys.com:mid];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 42B4D41F760
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCBNYXIgMzEsIDIwMjYsIFJhZGhleSBTaHlhbSBQYW5kZXkgd3JvdGU6DQo+IFJlcGxh
Y2UgdGhlIGRpcmVjdCBwbHRmbV9pbml0IGZ1bmN0aW9uIHBvaW50ZXIgaW4gc3RydWN0IGR3YzNf
eGxueCB3aXRoDQo+IGEgY29uc3QgcG9pbnRlciB0byBhIG5ldyBzdHJ1Y3QgZHdjM194bG54X2Nv
bmZpZy4gVGhpcyBncm91cHMNCj4gcGVyLXBsYXRmb3JtIGNvbmZpZ3VyYXRpb24gaW4gb25lIHBs
YWNlIGFuZCBhbGxvd3MgZnV0dXJlIHBhdGNoZXMgdG8gYWRkDQo+IHBsYXRmb3JtLXNwZWNpZmlj
IGZpZWxkcyAoZS5nLiB0eF9kZWVtcGgpIHdpdGhvdXQgZ3Jvd2luZyBkd2MzX3hsbnguDQo+IA0K
PiBXaGlsZSBhdCBpdCwgc3dpdGNoIGZyb20gb2ZfbWF0Y2hfbm9kZSgpIHRvIGRldmljZV9nZXRf
bWF0Y2hfZGF0YSgpIHRvDQo+IHNpbXBsaWZ5IHRoZSBtYXRjaCBkYXRhIGxvb2t1cC4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IFJhZGhleSBTaHlhbSBQYW5kZXkgPHJhZGhleS5zaHlhbS5wYW5kZXlA
YW1kLmNvbT4NCj4gLS0tDQo+IENoYW5nZXMgZm9yIHYyOg0KPiAtIE5ldyBwYXRjaCwgc3BsaXQg
ZnJvbSAiQWRkIFZlcnNhbDIgTU1JIFVTQiAzLjIgY29udHJvbGxlciBzdXBwb3J0Ii4NCj4gLSBV
c2UgZGV2aWNlX2dldF9tYXRjaF9kYXRhKCkgaW5zdGVhZCBvZiBvZl9tYXRjaF9ub2RlKCkuDQo+
IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jIHwgMjggKysrKysrKysrKysr
KysrKysrKystLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDgg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXhp
bGlueC5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jDQo+IGluZGV4IGY0MWIwZGE1
ZTg5ZC4uYmI1OWI1NjcyNmU3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMt
eGlsaW54LmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jDQo+IEBAIC0x
Miw2ICsxMiw3IEBADQo+ICAjaW5jbHVkZSA8bGludXgvY2xrLmg+DQo+ICAjaW5jbHVkZSA8bGlu
dXgvb2YuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4gKyNpbmNs
dWRlIDxsaW51eC9wcm9wZXJ0eS5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L2RtYS1tYXBwaW5nLmg+
DQo+ICAjaW5jbHVkZSA8bGludXgvZ3Bpby9jb25zdW1lci5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4
L29mX3BsYXRmb3JtLmg+DQo+IEBAIC00MSwxMiArNDIsMTggQEANCj4gICNkZWZpbmUgWExOWF9V
U0JfRlBEX1BPV0VSX1BSU05UCQkweDgwDQo+ICAjZGVmaW5lIEZQRF9QT1dFUl9QUlNOVF9PUFRJ
T04JCQlCSVQoMCkNCj4gIA0KPiArc3RydWN0IGR3YzNfeGxueDsNCj4gKw0KPiArc3RydWN0IGR3
YzNfeGxueF9jb25maWcgew0KPiArCWludAkJCQkoKnBsdGZtX2luaXQpKHN0cnVjdCBkd2MzX3hs
bnggKmRhdGEpOw0KPiArfTsNCj4gKw0KPiAgc3RydWN0IGR3YzNfeGxueCB7DQo+ICAJaW50CQkJ
CW51bV9jbG9ja3M7DQo+ICAJc3RydWN0IGNsa19idWxrX2RhdGEJCSpjbGtzOw0KPiAgCXN0cnVj
dCBkZXZpY2UJCQkqZGV2Ow0KPiAgCXZvaWQgX19pb21lbQkJCSpyZWdzOw0KPiAtCWludAkJCQko
KnBsdGZtX2luaXQpKHN0cnVjdCBkd2MzX3hsbnggKmRhdGEpOw0KPiArCWNvbnN0IHN0cnVjdCBk
d2MzX3hsbnhfY29uZmlnCSpkd2MzX2NvbmZpZzsNCj4gIAlzdHJ1Y3QgcGh5CQkJKnVzYjNfcGh5
Ow0KPiAgfTsNCj4gIA0KPiBAQCAtMjQxLDE0ICsyNDgsMjIgQEAgc3RhdGljIGludCBkd2MzX3hs
bnhfaW5pdF96eW5xbXAoc3RydWN0IGR3YzNfeGxueCAqcHJpdl9kYXRhKQ0KPiAgCXJldHVybiBy
ZXQ7DQo+ICB9DQo+ICANCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHdjM194bG54X2NvbmZpZyB6
eW5xbXBfY29uZmlnID0gew0KPiArCS5wbHRmbV9pbml0ID0gZHdjM194bG54X2luaXRfenlucW1w
LA0KPiArfTsNCj4gKw0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBkd2MzX3hsbnhfY29uZmlnIHZl
cnNhbF9jb25maWcgPSB7DQo+ICsJLnBsdGZtX2luaXQgPSBkd2MzX3hsbnhfaW5pdF92ZXJzYWws
DQo+ICt9Ow0KPiArDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBkd2MzX3hs
bnhfb2ZfbWF0Y2hbXSA9IHsNCj4gIAl7DQo+ICAJCS5jb21wYXRpYmxlID0gInhsbngsenlucW1w
LWR3YzMiLA0KPiAtCQkuZGF0YSA9ICZkd2MzX3hsbnhfaW5pdF96eW5xbXAsDQo+ICsJCS5kYXRh
ID0gJnp5bnFtcF9jb25maWcsDQo+ICAJfSwNCj4gIAl7DQo+ICAJCS5jb21wYXRpYmxlID0gInhs
bngsdmVyc2FsLWR3YzMiLA0KPiAtCQkuZGF0YSA9ICZkd2MzX3hsbnhfaW5pdF92ZXJzYWwsDQo+
ICsJCS5kYXRhID0gJnZlcnNhbF9jb25maWcsDQo+ICAJfSwNCj4gIAl7IC8qIFNlbnRpbmVsICov
IH0NCj4gIH07DQo+IEBAIC0yODQsNyArMjk5LDYgQEAgc3RhdGljIGludCBkd2MzX3hsbnhfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlzdHJ1Y3QgZHdjM194bG54CQkq
cHJpdl9kYXRhOw0KPiAgCXN0cnVjdCBkZXZpY2UJCQkqZGV2ID0gJnBkZXYtPmRldjsNCj4gIAlz
dHJ1Y3QgZGV2aWNlX25vZGUJCSpucCA9IGRldi0+b2Zfbm9kZTsNCj4gLQljb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkCSptYXRjaDsNCj4gIAl2b2lkIF9faW9tZW0JCQkqcmVnczsNCj4gIAlpbnQJ
CQkJcmV0Ow0KPiAgDQo+IEBAIC0yOTYsOSArMzEwLDcgQEAgc3RhdGljIGludCBkd2MzX3hsbnhf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlpZiAoSVNfRVJSKHJlZ3Mp
KQ0KPiAgCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIocmVncyksICJmYWlsZWQg
dG8gbWFwIHJlZ2lzdGVyc1xuIik7DQo+ICANCj4gLQltYXRjaCA9IG9mX21hdGNoX25vZGUoZHdj
M194bG54X29mX21hdGNoLCBwZGV2LT5kZXYub2Zfbm9kZSk7DQo+IC0NCj4gLQlwcml2X2RhdGEt
PnBsdGZtX2luaXQgPSBtYXRjaC0+ZGF0YTsNCj4gKwlwcml2X2RhdGEtPmR3YzNfY29uZmlnID0g
ZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRldik7DQo+ICAJcHJpdl9kYXRhLT5yZWdzID0gcmVnczsN
Cj4gIAlwcml2X2RhdGEtPmRldiA9IGRldjsNCj4gIA0KPiBAQCAtMzE0LDcgKzMyNiw3IEBAIHN0
YXRpYyBpbnQgZHdjM194bG54X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+
ICAJaWYgKHJldCkNCj4gIAkJcmV0dXJuIHJldDsNCj4gIA0KPiAtCXJldCA9IHByaXZfZGF0YS0+
cGx0Zm1faW5pdChwcml2X2RhdGEpOw0KPiArCXJldCA9IHByaXZfZGF0YS0+ZHdjM19jb25maWct
PnBsdGZtX2luaXQocHJpdl9kYXRhKTsNCg0KVGhvdWdoIHRoaXMgd29uJ3QgaGl0IG5vdywgYnV0
IHdlIHNob3VsZCBjaGVjayBpZiBkd2MzX2NvbmZpZyBleGlzdHMNCmJlZm9yZSBhY2Nlc3Npbmcg
aXQuDQoNCkJSLA0KVGhpbmgNCg0KPiAgCWlmIChyZXQpDQo+ICAJCWdvdG8gZXJyX2Nsa19wdXQ7
DQo+ICANCj4gLS0gDQo+IDIuNDMuMA0KPiA=

