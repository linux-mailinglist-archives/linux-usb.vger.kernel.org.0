Return-Path: <linux-usb+bounces-33803-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIpOBN8xomke0wQAu9opvQ
	(envelope-from <linux-usb+bounces-33803-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 01:07:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6383D1BF594
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 01:07:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F0A630977E8
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 00:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4D7B67E;
	Sat, 28 Feb 2026 00:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fDpmyzCN";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NFYYys4P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QW/gC0T9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAF538DF9;
	Sat, 28 Feb 2026 00:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772237217; cv=fail; b=ut0A4pNIPytk4YxGy7b1IuSMaqLeoNGtGHd15EGY1r+1ph6ydZs2zgES7Uc/aIFCFYKcdPscL8rRkjNHXxJCjWn0haeSASJJpDPL8g1OJ2pG72RsMA3AVJxOntfXB/bFk0yWc0hEMVssS8aRgO6Xny0RCKVClm9d73CB2laCoKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772237217; c=relaxed/simple;
	bh=mtfyub3M8Xpwr0OpfXnn00lz+CIG63mLE4p9HFQ9VLs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h28iBayDJeYrJ0PQQpHwLFwv8LBCfi8JWipjyRsfjzx1KDGINjRN0wtLstAQ7vZkSS6Qj06z7XoOj6g5NtTDSoL3MLDGq9KdgqaPoS9zqWDO9vPXkhM2swUe0C0eLaxFajLowicCfL8TlJzUAK0JQslZ5RR65LzN+icTHojanQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=fDpmyzCN; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NFYYys4P; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=QW/gC0T9 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RLBIgM2856640;
	Fri, 27 Feb 2026 16:06:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=mtfyub3M8Xpwr0OpfXnn00lz+CIG63mLE4p9HFQ9VLs=; b=
	fDpmyzCNcspAsVoWXHMYJO9uFNR5osJxaoydY6R5aLDfRRPukOX5Vkx0G514i7PW
	XFAxEaIgEhCnvCYjj9Rh8oK8RGp3Cmn6k3Ez2+eEmI5stHoC/f11Fk9eCifhBjAS
	ZafVuLVZKnsrKljAZQa938Tfetm8xatwqvLtLNEnJjQj9OCgFm06QcJxiYeZGoxI
	2Dl4pr16MqyOX87gehAKIe2dPrQkuSGgAPfwOLnIT6G2Q3wrEMCfGynj7lJTfm2e
	A/AaUUuORgKUcTuQ9SySbMvs7+2EvLAssHye6LFJ/CiVBX4v2etIJMi9P6DZpLuy
	m0pqYX05bW7RH6e2N+zMDA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4ckgyksc1k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 16:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1772237190; bh=mtfyub3M8Xpwr0OpfXnn00lz+CIG63mLE4p9HFQ9VLs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=NFYYys4PBORWIA1+UXzk4PAPQgNliUtVDZVh8IT7Hrc7BZY8QOoyvSyQeM5lR1ysY
	 Q1HibR6loHc05F3qjQmzyezkvkDe9cN6FGvLo6nXMKPv194iG8uYNts3451douVwX7
	 KD4TGlxphqxSVV//YLFYeaeKFj9bm6ZdUlkO5ESPZkV0wSKoC5FwOFYQHU5QAvZKXh
	 6n460f0QI3V0p1jDZGYDvMVNX/AgqdWjMl6GzcuA3wtrIozXiGX8xlLpOiBWtxk3Mf
	 hu0XuD7bZNXHtL1kiOeyfSjZ3YhCGcJQki3f77OX9a0YIC2zzFSWh2huPtlN/D38RR
	 nFuzUj88CBjrw==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0C15A40237;
	Sat, 28 Feb 2026 00:06:30 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 8D78EA006D;
	Sat, 28 Feb 2026 00:06:29 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=QW/gC0T9;
	dkim-atps=neutral
Received: from SN1PR07CU001.outbound.protection.outlook.com (mail-sn1pr07cu00104.outbound.protection.outlook.com [40.93.14.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 57C4922053D;
	Sat, 28 Feb 2026 00:06:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9IEBvwVyipmQVIeP2t1EDpNXYsEHgubGtxnlJt+8DdXY/589mey7O/lO1vuN2PuGe5OG2HFn8tIc/gN7YK1BEdBrn2aBgGKrJyRxzjuWwTtWXVlJu8S2ggt55WWzDNULxgS0LW0mg7sR1T2yrfqgHGqwQsvazSgoOtQxlVRJ3LWrKqItrgpeAenG/35ZU9ATBtUtGSAsGFovcFVGKU5JyGAmbZuy3jM904xPtI3p6WOFlmTO9t1EsBsmfh6U4izlAXsmGaZdx2qrkU2YCzRlUQGtakOqeZfls+SHBFfiezBbm5lMVUCZZE32oSINrKamvJOBHcLTvPMZjLR1V/j3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtfyub3M8Xpwr0OpfXnn00lz+CIG63mLE4p9HFQ9VLs=;
 b=gP8RYNh0ecmYzbP3Jpzk0Jc1U2gRAKfqixNzE2t/3MMb1812UZI7e5AuPtVKeYom8sIyvvvzj2zgdss51rMpEh2BWSGfyJyulY+2eCtEOEO7mltBoHfsok690I3ZdTgXrfSSpCYn4K0L+1PPfeG1BpMlNr22xjfYNDcz9DLj/ecYApbHhkiOCCOh409mQC7fmQ16mE0uqyTuHvHRshI8EJ6XUMAaDZ9fMXCBDln/wWuOAMuWTlbQl98FRfUmPWyTu6JZ50M0ErURJqs1+DXQnpOFWEaZrQxYmEW0Qds62gP2BXfeOLtAIakJ6/A9fIvC543gJN1R4sIlBfQF3M3LuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtfyub3M8Xpwr0OpfXnn00lz+CIG63mLE4p9HFQ9VLs=;
 b=QW/gC0T9gDbJ9O6v1iv/NE9L2j5pR71XKr/JSrcVFVoRKnJ4X6Zrx5EWXmHwmF03TJmHf4tUGLqlYATquXz0hNVy5bD8ENwKamPlLpwWgTDPX+3uQvqFAReUiJDD3DD+3xriua56GAxa7ab1Re9oLz2hueajqt0WVWKSiG4SBQM=
Received: from DS7PR12MB5984.namprd12.prod.outlook.com (2603:10b6:8:7f::18) by
 DS7PR12MB6072.namprd12.prod.outlook.com (2603:10b6:8:9c::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16; Sat, 28 Feb 2026 00:06:22 +0000
Received: from DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::2062:8c19:8492:2691]) by DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::2062:8c19:8492:2691%4]) with mapi id 15.20.9654.015; Sat, 28 Feb 2026
 00:06:21 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Michal Pecio <michal.pecio@gmail.com>
CC: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Dayu Jiang <jiangdayu@xiaomi.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Longfang Liu <liulongfang@huawei.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        yudongbin <yudongbin@xiaomi.com>, guhuinan <guhuinan@xiaomi.com>,
        chenyu45 <chenyu45@xiaomi.com>, mahongwei3 <mahongwei3@xiaomi.com>,
        Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: Re: [PATCH] usb: xhci: add xhci_halt() for HCE Handling
Thread-Topic: [PATCH] usb: xhci: add xhci_halt() for HCE Handling
Thread-Index:
 AQHcj33Mdj9vpu0YaEml411T+NyHbbVl34MAgAFnWICAAAIXAIAtnDGAgAB6GgCAABoMgIABAtyAgAAW1wCAANofgA==
Date: Sat, 28 Feb 2026 00:06:21 +0000
Message-ID: <20260228000611.toaxcij4rnxubpjk@synopsys.com>
References: <20260127110422.306711-1-jiangdayu@xiaomi.com>
 <2026012708-liability-sincere-5ed4@gregkh>
 <aXnNcQa5Ooq2wIX2@oa-jiangdayu.localdomain>
 <2026012857-deprive-putdown-0ee8@gregkh>
 <aaAR5VOtnMhvoCem@oa-jiangdayu.localdomain>
 <871991ab-6c8f-47d4-a5b4-b65751750e71@linux.intel.com>
 <20260226181715.ofgjiq3iq7d7dx6y@synopsys.com>
 <9113319a-b82c-42c7-ba1a-19113a5edb80@linux.intel.com>
 <20260227120530.13395d2f.michal.pecio@gmail.com>
In-Reply-To: <20260227120530.13395d2f.michal.pecio@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB5984:EE_|DS7PR12MB6072:EE_
x-ms-office365-filtering-correlation-id: b5c79b74-cd2f-47fd-0969-08de765d348e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 Js2IWkPeGELyVDO0VSC6hSTM6no1gKwDRuJHWhfRVwpp9jmGDDbopid+CZsLiuqKY2kM6o0eu29dqSA795imgHX7/IXFgikROIzytsBa8RkGdw+Ju5MOXNsrXzXAzXA0GEO5VViqmEDaJbFdvmsi4GnLQ5ukVNOO9qI1Ab4MxQl5CfQ35JL3vTWrcvXbKCFE3Fvy8UB4A7BepiFJOR1OipnjIZhYnKLr3XEHWyCPtHqozCoLAxzuMiX7NW4/S5GDm/LTOfP2XLWcB44+QG1TOGLKl79p+4YCyxsrcn/bmwkIi8wCF8XauyZkK9fjkghIMc+j8Y9SF/Ox7OlwMZNU8cZxmoyhpy9B7EzMzoqxr35CZDW5dhW8m45wkWkoXVFPEEEUd5aCdVdG1nposMXv0pxgNOehWxVBx+ETCn9irQuXNcK252UVDY+TfIYchhMZG82G0Cub5gNkCNGn/yOr9UqNNGc8wXJK7reJvwbCdz5hPG87XyTugNIykyvyFlSAvtQX/pb4y2YiWjpRcKEbrVboZ6gTsZtMHfW0aL0Q4gkDgca5vwq7lcvwFTr8oHyhZwLQSX82an+pgFK1a+VKgt3Wx3n3eOgwgOvt6W/6XS4EXPHDD+CmZguFN9/sB+t3Dpb6W5Y6C2JKsZA2Faz9TXiW/164Piyhc/52bQ76BJTaMnGS/yim8oRQP9w9n/BVVQ7ay14BCuVKKE2bXc4rsGPRVDGpuTMIOyJF6PDNmPJ2VRPJVkvqra4wQnjv8oJPxIyqT1RHzBRSyUG73jJiRYQa2PrfO3O2AWXeyqsAdss=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5984.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZkJMWmc0VDd6VnI1alBiOHVoNDJhWUdYdWsrcnlNeGVUZlBlcnNjRFpSWDdZ?=
 =?utf-8?B?ZTMxK1J6VkZ1L09PTU45L3g2VFJhaVJDbGxaRDhtZHBHMEk2SVZPSnJFcG9H?=
 =?utf-8?B?RSt3ZmZMQ0RCY1ZFM2NoZnFnK0U2SWs4UnkrRFlMUUZwMlFYN3AydXJKalZ4?=
 =?utf-8?B?Y3NDUGdmdXVWR052WDJ5b2dUT0FQWlRwWlFEUi9oRDhTdG1aRXUrVEpvVStP?=
 =?utf-8?B?bGJrR1dIenJGRTZvcWw5S0VVOUMzTy9rYmJUUDJIWEtpNHBZa3NqYW5qOEtO?=
 =?utf-8?B?YXlnWlpya0plaVFkdVNwVGJJY2V6NkI1TDVPdEwxSEhnT1NVbHVNYzYzTmk0?=
 =?utf-8?B?Vmh3ZU5rRXZLRmMzZE05MDMxU09qTG5Pb240MlFuVmpDY1V0TXozZEl5R2xQ?=
 =?utf-8?B?U3Y2WHMwMWpmcEtlSXVnb3Q1dmROSFZpZDNuT3hpdnY5UnBobXgvZ3JwUC8v?=
 =?utf-8?B?SkFOdFhzeWt2VngrdFdEZXFLajF2MUVhZHBDM3VTN3JQcTZUMlEwQk5hUGxi?=
 =?utf-8?B?N211NzJMMXkyTlAyeGx2YXROL041VG00ZVFoeXlLT3NLNHk4RHNQMVJZRUhp?=
 =?utf-8?B?dThxRmR1Z2FtMnJGRmF2eVpLM3FjL2swaHU5aXh6RFQ5MFVwY0JVdHBWckpB?=
 =?utf-8?B?bWNvWnIxVDVwKzV2ZnFPSWVqVVhNZ0tZM3BZaW1lU1RFZmdMY29kTnkwVFBv?=
 =?utf-8?B?NHJvL3pJKzdUS1MwSlZlbTM3emd4YnJqQndST2gybDNWWmZpSVdERHZ4Smxs?=
 =?utf-8?B?cS9ZMjl0dlgzcGNKa2dmZ3hnZXFTdm8xU05la0UxamFlV0drWWRseTNLM1Er?=
 =?utf-8?B?bnYyMUQwM2NYdkgwUXV3S3NRRDRTcCszVkFtTm5qRTNnWmpoRXk3Zy9TeW9a?=
 =?utf-8?B?M3hrUDRyM1c2L1hZcGVRK3UzdWFnZW9xVHpydmNmR1dQdnY5U2p4OHpzckp3?=
 =?utf-8?B?SHFSdE9FLzNlNndvM3c1Mmd5eVlFbERUS0lrbTBCalcxMVdRSUpXYzk4Ti9D?=
 =?utf-8?B?VDVtS1lablhId0wxZmRoTUEydUVtbEpwdkpSdjk5aCtqa0tHNWQ4Vi92cFl0?=
 =?utf-8?B?cXYwbkpCRHZ3R0VaNGdmdWJHVXVzMkxwSHpHUTNBdThYbVh4T1BLVWJUQmEr?=
 =?utf-8?B?K0QyMzQzNENKOFlWREk1REVLTE1USE5JTU1Rdm1vU2xXNVpjQUpkeWRjVnNY?=
 =?utf-8?B?N2VrNG1jd1BDMmRiTElvSjg0TzN2dVY0dS9SajFxQXFqUUkvVmIzSDFMbVBC?=
 =?utf-8?B?OVluZjhtZzB5dlE5MlhHNVRqWG1hU0djRXh3TEgwL3oxdlZvUjRYQi9LZUFV?=
 =?utf-8?B?WGNzeDdieEhLOGg5SWppWmUwQWhmWnZ0SXY0cHVoWk52SjVOVHoySDBtdVFC?=
 =?utf-8?B?dVdvaTJibEZIcVpKS09Oc1BmTmVWTlBnVzhQYzhab2dZcG5DZXFpYytwVG9O?=
 =?utf-8?B?LzNSR0lsUExJZTRZUmZpaEJRUmljTkY3L1AyMWZwU0tQOEtuOXkreGsyQllB?=
 =?utf-8?B?alFPMnVMY0E1MDNOVHROZ29vbjBXS3ZaRnMzVHVHejE3M21FbTA0L05ncjBU?=
 =?utf-8?B?TTZTR0szQ09TRjZ1VW9GazZjWEFVdWJ3cTA5Ri8xREJwakVDZ0hRUzh4dU9E?=
 =?utf-8?B?YjNBY3M1SmYyZEh4V0RVRVkxTmNTYVlub0tVOE5HRlRVeDN0bFVUYllaOFN5?=
 =?utf-8?B?Q2FEc3ptNDRUQzVKaU9sWUxhcGdGNnpFMXBmME9WdFFuRmtYb1hXbnB3TGtQ?=
 =?utf-8?B?cS9tQzVGVVI1aXp4TWxvVXQxNis2Vk1tZDlPaExhSDJKSDB5aktBRDExTUFT?=
 =?utf-8?B?TkdIY1lsZVp6bHBSYVJMWEpCemxWME1mdCtrOXpSZU1Ed2w1NnFNRzZDSllL?=
 =?utf-8?B?RFhPV3RGQUxBRkw4QU1QeEVtelVrUjBKUmd0cFRaWmx5L2FlWXIxOUYvc2ZK?=
 =?utf-8?B?RHIzNnZ2aEF1ck9CeFY3M21CUkM3VFBZd1B5MXZwaENLOGhoYWo1MjlKTU9k?=
 =?utf-8?B?ZXZLL0ZEVTlxUlZraXNPSDIzM09mRDFJWWlVRUlHOWFMT3lLNG9PV245Z0lU?=
 =?utf-8?B?OXBLNS82TzVnVHZQdnZ2TXJZUE93RGVzZXR4dDIvTFhCVnJwWDNFcHpyQTht?=
 =?utf-8?B?cWNJZFlTSXJzL2FicDJ2bnVNclQxQ3k4OWV5MDlBTVB5blByMHdObzBPejFJ?=
 =?utf-8?B?Q1Z1aFRlYWUyQ3NxZDM4aDVMSzVPNUZ0b3NPUWNvVXJrVjJKRnJRNlVMM0pF?=
 =?utf-8?B?Tyt0MXBiMjJDeEQwQVNPMjZtT25qTkJQNkFuUEUwOUpVU3RYZEhpNFgwMlR0?=
 =?utf-8?B?MUVDa211TFdUTVJkaUsrRjl2MEROQWt4Wk5PbVZNVkJzMUs2V3daZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <14777CA7D4F843478B17FCD4A93EA2EC@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	waFUpmR23r9PSI33FSS1EA/nZzLTFPzM/OsoqtjZBqtR/Z6DP8oCWrZUzgMDo7cnAQ8I55ndkeqp/rWXgVT7GWOB9FhAa2qIT3qo4jj3s1GR6cvkogranTNJQ2UtQAvRoxXQFUEce3ijEz+IbreZWLbjzzqKFpbQSrVrIvlLxik3fQBPArFN2xlzQ6jYMm0ShYRPEGdVZfbl9YZVlJAcF6nIMw/i7KCkcEBLeKOVqsW/9AJrRT8J4n0RzK5vkVaKrq7K7VEUUVcDBc6jBmkTYfg1aAL2dr6+Oeqtc/yf9LPskYy7qSDPvJCrC9vgWtIPYCkXKyRRgjp4mQIoY3i0wg2ZgvQT7gPEn8EoaPSlgnKhM8NUQZqdkMajzj/ApC7G1EjZSCRmel0et5MhwLdyCOPfXuL5ZCeLiENANUOW22SYbzEoOTT998U2DrQPa1wOeqPRGJh9esNYjNoV7GQs6nczekz9xvtzKaL7FWaXz+8St6G2M3mpDhB0pAHd+GIpYUIwE2KWJBu06oni7qjgggi2uvXCrUrETjSLDewthdSTY2q6cT9t6+8CZXWV2Nnc/CzL+lu97CoFZE9l8qA8yCnln29L6MfqAhlNE8mqYqqxX+6NSruztpKXQOkLxYbB89BhDmp5gGfA3EU2CdNc+w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5984.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c79b74-cd2f-47fd-0969-08de765d348e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2026 00:06:21.7844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TptNnCfbEu5EPOK6Axcb3km9r4mUe4B/STF2ruhnU0/lD6dz40/QfqWabKrOWcCX+upj2/DaDGrAnTRtZgyocw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6072
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDIxNiBTYWx0ZWRfX1CdYGQoJu9kG
 v3MX3yb8eN6j3yqaEI5ehBWa7zhoObXd4wGe7brlW7XxUq8/hR7QnJvz5vXFvPXc24g4Jgj4ueb
 IQ8DXrB0y4dUqe2pDkg1e3ZX0nRIIsiuQCtXjvSzpXyVXNuFBVcsI4oi7+uxuTUeZF3dr2m7Nu6
 sJSLmKVrVJaGBBgS7aIRbhwpUWVjJGX37QURqppnI4VC1rQaET7iSt6mzkCMc0s59VWPnHBlxMA
 AxlbGjnn08yIvARPhRFFI+oDZfIh7ewDBKGdT5u5Yy7tYja7qf9gf9DeO8SgR/BGugYNy6zyMQG
 vaPUVLAvRn7oO10mYpXKOUiGh+C8c0J7rIHghkp/2MmRMznyvab0JaUjf/1o2+bHuWWachXOTeO
 3PbP4bqOu37/ZS0If3uc0jxvVLDYrYUhqxx9bG3LU3RkRt1U5L0Ybya3CrG7wJyT87HjduG8vAX
 s+HdRzHPjc8mEb+T5jg==
X-Proofpoint-GUID: 0Acx-AH2HGHLYNQwdENJWSUKzLUrGiQq
X-Proofpoint-ORIG-GUID: 0Acx-AH2HGHLYNQwdENJWSUKzLUrGiQq
X-Authority-Analysis: v=2.4 cv=fubRpV4f c=1 sm=1 tr=0 ts=69a23186 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=xazhGajYVdthSH1O_OsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1011 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2602270216
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-33803-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[usbcmd.run:url,synopsys.com:mid,synopsys.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6383D1BF594
X-Rspamd-Action: no action

T24gRnJpLCBGZWIgMjcsIDIwMjYsIE1pY2hhbCBQZWNpbyB3cm90ZToNCj4gT24gRnJpLCAyNyBG
ZWIgMjAyNiAxMTo0Mzo0NSArMDIwMCwgTWF0aGlhcyBOeW1hbiB3cm90ZToNCj4gPiBPbiAyLzI2
LzI2IDIwOjE3LCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gPiBUaGUgY29udHJvbGxlciBpcyBo
YWx0ZWQgaWYgdGhlcmUncyBhbiBlcnJvciBsaWtlIEhDRS4gSXQncyBvZGQgdG8NCj4gPiA+IHRy
eSB0byAiaGFsdCIgaXQgYWdhaW4uIE5vdCBzdXJlIGhvdyB0aGlzIHdpbGwgaW1wYWN0IGZvciBv
dGhlcg0KPiA+ID4gY29udHJvbGxlcnMuDQo+ID4gVGhlIGhvc3QgaXMgbWVzc2VkIHVwIGF0IHRo
aXMgcG9pbnQsIGFuZCB3ZSBhcmUgbm90IHJlY292ZXJpbmcgaXQuDQo+ID4gSSBkb24ndCB0aGlu
ayB0aGVyZSBpcyBhbnkgaGFybSBpbiBhIG1hbnVhbCBoYWx0IGF0IHRoaXMgc3RhZ2UuDQo+IA0K
PiBTcGVjaWZpY2FsbHksIGNhbGxpbmcgeGhjaV9oYWx0KCkgY2xlYXJzIHRoZSBVU0JDTUQuUnVu
IGZsYWcgYW5kDQo+IGFsbCBVU0JDTUQgaW50ZXJydXB0IGVuYWJsZSBmbGFncy4gU2VlbXMgcmVs
YXRpdmVseSBoYXJtbGVzcy4gQ2xlYXJpbmcNCj4gVVNCQ01ELlJ1biB3b3VsZCBiZSB0aGUgZmly
c3Qgc3RlcCBvZiByZXNldHRpbmcgdGhlIEhDIGFueXdheSwgc28gdGhlDQo+IEhXIHNob3VsZCBl
eHBlY3QgaXQgdG8gaGFwcGVuIGFmZXRyIHJlcG9ydGluZyBIQ0UuDQo+IA0KPiBJbiBjYXNlIG9m
IEhTRSB0aGUgSFcgc2hvdWxkIGNsZWFyIHRoZSBSdW4gYml0IGJ5IGl0c2VsZiAoNC4xMC4yLjYp
LA0KPiBidXQgbm8gc3VjaCByZXF1aXJlbWVudCBzZWVtcyB0byBleGlzdCBmb3IgSENFICg0LjI0
LjEpLg0KDQpDaGVjayA0LjIxLjIuIFRoZSBjb250cm9sbGVyIHNob3VsZCBjbGVhciB0aGUgUnVu
L1N0b3AgYml0IGZvciBib3RoDQpjYXNlcy4NCg0KPiANCj4gVGhlIGNhbGwgYWxzbyBzZXRzIFhI
Q0lfU1RBVEVfSEFMVEVEIGFuZCBDTURfUklOR19TVEFURV9TVE9QUEVEIGZsYWdzLA0KDQpQZXJo
YXBzIHdlIHVwZGF0ZSB0aGVzZSBkcml2ZXIgZmxhZ3MsIGJ1dCB3ZSBzaG91bGQgbm90IG5lZWQg
dG8gY2xlYXINCnRoZSBSdW4vU3RvcCBiaXQuIFRoYXQncyBub3QgdGhlIGZpcnN0IHRoaW5nIHdl
IHNob3VsZCBkby4NCg0KPiB3aGljaCBoZWxwcyB3aXRoIHJlY292ZXJpbmcgc3R1Y2sgVVJCcy4g
V2hlbiBjbGFzcyBkcml2ZXJzIHRpbWUgb3V0DQo+IGFuZCB1bmxpbmsgdGhlbSwgdGhlIFVSQnMg
YXJlIGdpdmVuIGJhY2sgaW5zdGFudGx5IHdpdGhvdXQgZHJhbWEuDQo+IA0KPiBJIGp1c3QgdGVz
dGVkIHRoZSBIU0UgY2FzZSB3aGVyZSB4aGNpX2hhbHQoKSBpcyBhbHJlYWR5IGJlaW5nIGNhbGxl
ZA0KPiBhbmQgaXQgd29ya2VkIGZvciBtZS4gSWYgSSByZW1vdmUgeGhjaV9oYWx0KCkgdGhlbiB0
aGUgZHJpdmVyIHRyaWVzIHRvDQo+IGlzc3VlIFN0b3AgRW5kcG9pbnQgY29tbWFuZHMsIHRpbWVz
IG91dCBhbmQgY2FsbHMgaGNfZGllZCgpLiBNZXNzeS4NCj4gSSBzdXNwZWN0IHRoYXQgdGhlIHNh
bWUgaGFwcGVuZWQgd2l0aCBIQ0UgYmVmb3JlIHRoaXMgcGF0Y2guDQo+IA0KDQpUaGF0J3MganVz
dCB0aGUgeGhjaSBkcml2ZXIgbmVlZGluZyB0byB1cGRhdGUgdGhlIHNvZnR3YXJlIHN0YXRlcyB0
bw0KcHJvcGVybHkgaGFuZGxlIHRoZSB0ZWFyZG93biBrbm93aW5nIHRoYXQgdGhlIHhIQyBpcyBo
YWx0ZWQuDQoNCkJSLA0KVGhpbmg=

