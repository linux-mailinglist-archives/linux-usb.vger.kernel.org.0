Return-Path: <linux-usb+bounces-33460-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BbVJdpnlmleewIAu9opvQ
	(envelope-from <linux-usb+bounces-33460-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 02:31:06 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6EF15B5FD
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 02:31:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C287D301BA58
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 01:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08AC41E8342;
	Thu, 19 Feb 2026 01:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="wBm04aZD";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RJhdvPYw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KNbieDdQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B473774C14;
	Thu, 19 Feb 2026 01:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771464663; cv=fail; b=OFAtq1xXu8DlSurh3J9c7dFHOuf9ug7ck8n3qCuH7WqclhJN1sj5mvg3pquANLovGsL4swE3x8PmBijzhCPKPsOF55EmQAPCAIc940gXavttnLyjs3qnc9Ujp0VmDwR93eK2so0rimrPVLVMAmMIuYGuobG4iP8XBbo1ari3PXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771464663; c=relaxed/simple;
	bh=bXZTFqkx5kPQObpOu0PyKHN4rkPXTF/joyEXiyVL0cE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Th0tAtPXpT+IapEfBPWJ8Z9ADJ178OMH5xwH0sGrtKk5eK+uH7OknoIeFZv7pFsDamFRfKsKcs2AMyUE1nG/JI2dIgIoABv7coxx/pD8+eirl8fpBkJxwMDq2peAuV3lsshtsStum/+hnVhbNoGYHN/2KnJ5VpBdaWHnjL1quys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=wBm04aZD; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=RJhdvPYw; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=KNbieDdQ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J1BEJb958327;
	Wed, 18 Feb 2026 17:30:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=bXZTFqkx5kPQObpOu0PyKHN4rkPXTF/joyEXiyVL0cE=; b=
	wBm04aZDQbCQeGnYUucWL6/rNp3N5f2pHm7pX8vrjAf40kdiIZmUGplKINsoHyTM
	l+sSuN6kON2o7ZLGAgZNW7gfjJyjkKBbuamefxlVsZoaCWIMo0IBgBxISubUJHba
	pi3XQfmZ8k0E6AyVro6PG9KlAvcQAgReDia/ipCkKCBeKnZxkH9YvWRj6orV/Uxy
	Y6OkvaBP3RlHJJ4mJlvCNbg+skDTj0/8WEvBmOzi/9C2UYPhkfalQ/bvnrSpE3Bf
	21UgH9nl6lWkgKxPhCvtz2yRnfApO2WfEVumbtGLKsC8g9AeQEREAslGqvWjeO2P
	p+YCsRSgABMUEiO5A4suhw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4cdh9kjefn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Feb 2026 17:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1771464627; bh=bXZTFqkx5kPQObpOu0PyKHN4rkPXTF/joyEXiyVL0cE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=RJhdvPYweQ7GPbR7LeU6ZlzxuJmkh4FfXxrQ2V3FYWvP9iAKWCtoJ3ntAqW1/zX9J
	 iOeiSyJDmmI8giDvHcLgGVdTc+pZOKN7V35ItqUhPMQ4Ehd2Pss9J7KFEQY8j2hfji
	 CHNyfi+fJLz/w2b79sM67TnorE6A9sjTgPqqNSBmNxmhGJ26yiY3y3VDv/Beb8IqP7
	 QWJqI/Zny6gO5GpIYSJev4gzYr/eXlH6Zai62uwRVe2ZSfgLX3NKxgZHY2z4khf1bo
	 /v/0jdb77Gsy7btLvJj0Lb5WpSCstrnXP9X2lGYNkqHOTPqmh/+SIi2H5lTXuMjUsJ
	 dYGPsx5HKav+g==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 142DA40364;
	Thu, 19 Feb 2026 01:30:26 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 2B31AA005A;
	Thu, 19 Feb 2026 01:30:24 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=KNbieDdQ;
	dkim-atps=neutral
Received: from CO1PR07CU001.outbound.protection.outlook.com (mail-co1pr07cu00100.outbound.protection.outlook.com [40.93.10.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A1CB240834;
	Thu, 19 Feb 2026 01:30:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w7p8wo+QrmPxmBcCerTtLA7ev7iw+Fe2ki1jZJQv3dg0WAiAnmhHYouPX1q7cCkWEA073blMAFGkezzWXFz8ne8aDinFPJ1HnvBLOpBhLRCPmz3EI2IwDqGyehhx4QiBNsboLdRbsGTC/c8xS+eZWYdk/wGTujrlpPsNkcao+JX19iJycQHVIW1WcI3zyNyOH2KPgrz8E183hD50pbpyXTKY1Z3aPDiFXv6Fq6FUY+98FHKOu//ZODew7h5F4aYv2sT735CxaJIE23P6YHrof3bR2DSXIvek/kBMdKuE+nV8f2wVdFu2xtPLqfGOGaI0H83+7q3Spj8cSTucL3/J5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXZTFqkx5kPQObpOu0PyKHN4rkPXTF/joyEXiyVL0cE=;
 b=lhXOU8iZ6zfOqH+TYRf1KxL9tloj4wJ7e9RHjgzYZ+PXY4hAHDHGYa/ndNtVBn6gvB4uKjtx2hFEJKYroBQjJgY4lN/cavxf1B75tT7cxCDuOF2UgZ0i5GMpZ5Kvg38jtV3pJnTNRObLM/Ww+AuZR4yKqZbqkW6oRLn8Hhfdo9pMLgC11kv6UmGLzPioJ6/1Ko6mquEnm8ciIY4JnPKfx1KhqueMT8ZwjTdxdG2RRqvvIiHOwrzW2+cksZAEPXIJ589BBUt/wgyB9SmdMA4zFN9hzMSzuBkdLWhyI0VPDTw5AKWdzpb081WCSHiUHT184/SCotDlNG8wSbk5n5Lw5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXZTFqkx5kPQObpOu0PyKHN4rkPXTF/joyEXiyVL0cE=;
 b=KNbieDdQlt6lJeHRxF8+rsG2asPQUCSAg9gq8Qns70x5XdEINJ+NmzT2MMFHozsW85zX6x8jtvYfYQ2QeDIMJccFTAEM7q/GBnjGJpsegflBSTTgVBkM+dv/0uA5uvKEUbdealXskA19gIYqgECzVTfpFoflu5SOwjNshJj8Htw=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH3PR12MB8971.namprd12.prod.outlook.com (2603:10b6:610:177::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 01:30:17 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 01:30:16 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Jiasheng Jiang <jiashengjiangcool@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen Yufeng <chenyufeng@iie.ac.cn>,
        Nicholas Bellinger <nab@linux-iscsi.org>,
        Andrzej Pietrasiewicz <andrzej.p@samsung.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: f_tcm: Fix NULL pointer dereferences in
 nexus handling
Thread-Topic: [PATCH] usb: gadget: f_tcm: Fix NULL pointer dereferences in
 nexus handling
Thread-Index: AQHcn4Wvu8qf06pbZEWeYsPWKDmbZbWH7g+AgAAjfwCAAS35AA==
Date: Thu, 19 Feb 2026 01:30:16 +0000
Message-ID: <20260219012929.u6btnnmqvbyujz5f@synopsys.com>
References: <20260216204848.10748-1-jiashengjiangcool@gmail.com>
 <20260218052219.l7gfndrn5e4h3qe4@synopsys.com>
 <20260218072922.C08qI5s1@linutronix.de>
In-Reply-To: <20260218072922.C08qI5s1@linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH3PR12MB8971:EE_
x-ms-office365-filtering-correlation-id: d0e31cbd-fc5c-4d09-e602-08de6f566f94
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RDRnU1h1RlRuck1TRGJObUNIZ0hrbkJGbDVxTlYzM1BZdzJWdWdqZ2JuRjZB?=
 =?utf-8?B?QnlxTW1CV2xaUmtMSjBWbHRkUExUOWtFeTQ5bjdjaFRJK3pkK09pUlVqZnNS?=
 =?utf-8?B?VFJnQ09LOGNEK2JlR2FYQlFKeGJWNjBFWlJ1V3QzdjFsZEw5L2VXZTE1UkRv?=
 =?utf-8?B?OXViYXdHNzVkMTZzZC91ejU0ak1NV3hCd1JJVUVFbGJ5UXZkTkxrc2dta1B3?=
 =?utf-8?B?YmNsYlZoQ20vaCtaUnBleVljbnl5MVNEWkVyREh5Q20yNmdyVk1GekQwbHJu?=
 =?utf-8?B?ZVcyZTFya1dkdkp1cU9Ca1M2RUdyelk2OHZBcCs2bUgrVkx1WjhxUGhhdExz?=
 =?utf-8?B?TXoxQmZRc1BHNkJIbWVFRFN5NityaWV5V0xCbHh6cGROTDltQWV3SHA3d3Js?=
 =?utf-8?B?Mnltb2tkbDdXK1VaSkFkQVhpR0VPNTl2Z2ZpL2lDTTFGTE50V2MyaTQ3RXZx?=
 =?utf-8?B?c1Arekk2TFQ4WG5UVGYwWWx3cUxBYWk0TitWZjFjSE1lTE5jL2RQK01tMWlk?=
 =?utf-8?B?WTNISjJvU201YTZNS2IyRnIrRXhYbWpaOWg2QTEvdTArMERFTDMyZGh6QmhP?=
 =?utf-8?B?NXpvd0t6eWtESTF0c1ZWN3E2NHdabnJNdzFKZDNud0Z6SysxZS9hMktvakdq?=
 =?utf-8?B?NzlvbndSakM1WVBYazFDazV1QXRrZGdTZSthRmpTNkpmZmZsd2tndHJBL0NY?=
 =?utf-8?B?OUZRV3pmMkM1cjY1U05QaDRjMGI4QngrY3VJMi8rZW9tN0Y3WGhnOXB5NUtF?=
 =?utf-8?B?L0w2eHVQL2hzZkNRMHI5Z0UxYjBxVTYwb1E2VUc1Um5Pd1NENm1KZWY5R3VG?=
 =?utf-8?B?SDZocndlR1dnVjQzSXl4WTZJNTA5RkovRDFuV3RiZ3p3amRTazdoTDJPZWxR?=
 =?utf-8?B?Sm51UnpVL1BaOEJaUk9LSnBObzQvMzhCZSs0bGh3aHh6NXpiNFNFdUdKVHlx?=
 =?utf-8?B?UTRzRE14S2QvKzdKK2diK08xQjlBT3p5bi9qZlNFL1Q4YkNYeTN4aGNIQlNH?=
 =?utf-8?B?LzVUdnJ6enRaUEw5Zk0wUEcxME0zUDZRVUJsOW5IeXBVR1N2bG51eUpOU3lL?=
 =?utf-8?B?TnNsN0U3UmFJSENjNXgvTjJPTEpMQ1JENWtuSFJHUEdFc0o3VzhhNkxuUUlP?=
 =?utf-8?B?VzR3VVFZTS83b3oyejNuTEw3aDRxNW9qRlFVM2pOVjVwWTVvZ1FZblVnSDJZ?=
 =?utf-8?B?UGpBZytrbWE3N1l0ck9tamRRUTBFbm9JOTY3SXhXd1owZTVWdHpkVjJQeldI?=
 =?utf-8?B?NDVHMTJpM2hCR0Rwanp1V0wrWUExQmsxQWN4bUFzcVpHbDBtUjdiUUdhb1Zy?=
 =?utf-8?B?MWorU1VkSXN6amNRcy9RLzNYUWJKL2x3VW1tQlNuWEpGVDNuL2pRMjJyTFFP?=
 =?utf-8?B?NGgvblBQdUpoRFhWbmtRQVduZzBiUkZGU2Q3MDV1cU1JVVFWUXRGMVZ2Tzlr?=
 =?utf-8?B?WXNsSHNlTEx6d2lETzh6UkJpU3FpT2xSeTc2bGZVT05qTVNpVm4zeit0UFRu?=
 =?utf-8?B?bjJmYzF5Uks4S1I2cWZ6WTVCVzlMZWlqaVdLYWdoeDMyUnpxTlROU3lUZkYw?=
 =?utf-8?B?bWpCd0JvZEh3Ky90b3R5UlJDQ3JFam1XYm5neExjY29DTk5lbjIzMk9XZ1h0?=
 =?utf-8?B?bVJBclk1T2xmUzVpOTFFb2o1ZktkYVRoNlF4akVoMXNnc1pLQ2RkRG5YaFJM?=
 =?utf-8?B?aWlwZmZPeHdOM2hEM0dLYXNiNTF5RTgxdFNpUXBmLzBlNUp4a01oMkNaT0Vu?=
 =?utf-8?B?c2lRalVsZVp0cTkrVXhTbXNWbGpSV3oxMUNmaHpWM1p0akRYenlkcG1ibkVZ?=
 =?utf-8?B?c21XWHE1WVdWQi9qckRaK3NDR3o4WERYVDY1QnROemowMkFydDRubFBESkVo?=
 =?utf-8?B?SmFDUzlPWFVoS2FuOU5tR2dNbkRVZFI1R3N1bGRhcTdjN3IzV3l4VmxXRlZN?=
 =?utf-8?B?OE13UXkxVXJMY3lic1pVQ3QzZ1VQMTFSblY1UUw4K0t5VWxlcTFtdlhCZjdp?=
 =?utf-8?B?K1ErK3laV2RkOE5lQmtNT2hrNDBSV1V5bk4rNDdxNEVXNXdaTDIxaG1QaWFa?=
 =?utf-8?B?Y3dSSzJ1VVVoVjlvZzhDQUdBNUYwY0dJSGJ6S0Q0d0hiRFZhS2tVcjU5RjhO?=
 =?utf-8?B?eGVJQzVPRDdZNlc3MFdWNkZNZWJEUHlEUkpvcGIvR1QzSlVzWE9YNis2dGxH?=
 =?utf-8?Q?FZyT3mEn5AfUaWsBU8u0DHQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Slpua2w1eXJmQUVNZUNIRWQxVEtKazhZdXZ6d2tidVJGTTFyVk9CcTR3QzBx?=
 =?utf-8?B?T1dCUndMcytxemxFYnpxOE0yQi9NQUFzS216VUdVdVFJZ0xZZ055V05rclVk?=
 =?utf-8?B?Q0w5MENsRnhOYi9IZ0x3RGFaSUFlTFVvV1ZBNGNNcXNuNktyRDQ0Znlna3FK?=
 =?utf-8?B?OTZTOWJkeDBoQTJDZXYvYWV3SDRNVTJoT3FDczJzSWswMTYwWWZqaXU4YlM4?=
 =?utf-8?B?dkgzZjd1ay81WVV5TEF5WDR1YksycUQzRjRFaUF4QVo3VmR2MEMvNDBkSjhH?=
 =?utf-8?B?SGFLdjFqTmM0QW1QdisyR0xyeXJzZlkzZ2NkcGluK0hKQkRyZ0FqemFlYXMz?=
 =?utf-8?B?azNHbUpaV3ZmWThvejVUT2kyK3RoZ1dxMWxxcTRTUmpoYXM4bE5ZbFNaT25J?=
 =?utf-8?B?eGpzNUxjOFFET0t1Z0pNLzMyVXQzZ2hhYjh1N0w5a3B6ZllOUWpWN3RJeitZ?=
 =?utf-8?B?L3pFYlhDOEU2Uko4K2FWYWlFMDBsSS9LeEV1emdvOFFHYitzT3k5ZzBzNExs?=
 =?utf-8?B?NlM1UmNYaENSMWVtSVNtbWQzbU5LMW0xY0J1MnBReU9PTURFRm5yaG9Bc1Jv?=
 =?utf-8?B?QktFZGRkTjlmamM0QjByMGpYUlpERzNlbFpia3N2NWgvSGF2Z3VwMTBRZ1cz?=
 =?utf-8?B?SS9pcHRjU08wTnhMTDIrN21wOXd4RzFnVitmTEhUY2ZJSWlZeDVRQnRVcDdJ?=
 =?utf-8?B?NC9IYmVHWk9kRkYxM1RZUEU0UTVDdkc3NHYyS1ZVMGNZdlU4YlJNZ1Y2MU1C?=
 =?utf-8?B?RWZ3emErZDJyOHBSbVBRY2YyQlZvbFFPeG94RDFySjk4NW5XYk5WVzRaeFdl?=
 =?utf-8?B?S0JJQjNSWkJHa1hmeVpHSFdwZ01rQXE3NUhQc0owbHBZUldkSzBZNEd0Qkpw?=
 =?utf-8?B?M3NSaHJmZStLalExQnJ0QTZleFVaaVhSdkxFaXZCVkk3d3pnUDI2NVllOERS?=
 =?utf-8?B?dFBJeUZvMXpRa01RUGppd0lBbVJEWk53b2FtRjBrNkw0MGhIQ0VrMThSUGtp?=
 =?utf-8?B?eXhYNGFYSUdaenovV2xBQTExcVJ5blo5eGZRRGVzc1NIeFpFT0owSE1sTm8r?=
 =?utf-8?B?dFgvZUNwLzNMUmVMeXB1R1BwMUFaUjNKZVlFWkI4dWMwV2ltMU1OZlRwWVMz?=
 =?utf-8?B?SCs0cmN6WG1LSUZHWEJJNUF3NStrSFU2YitTYTRZVjRWN0pZOXJqeUx2b1lp?=
 =?utf-8?B?ajFxaW1Oem51WUdLSTZVUFpOdnoyLy83VkF0SHVDYWJHb1N5RmJnRTVBdnEx?=
 =?utf-8?B?STNOQkJWSUtXa3VuWVQyQU1yYVJNd2cxbCtzZDVDbW5XVkFLRS9XSjlnbWly?=
 =?utf-8?B?T0hlNmRWWklkK0FTL2x4L3BMV0szMytHTEZwdVZJYmJDT0dud0pnQUtiRTNh?=
 =?utf-8?B?MUZnQmxRcU1SQkR5WlU2c3FWV0JQVWNHcFNOc1FuTTNhZk9wZWM2TXZ5S1hN?=
 =?utf-8?B?bUcrUGJaRGZCcS9UQ0tEYTY0dW1pRTQyaW1hNWFiUVozOExwdEphZHFOb2d1?=
 =?utf-8?B?OGtDOTV4RUhZc2ZveE5xM3RJbmRFblA5QjRvT3RnNitJc3htZnZSd2xPaUZ3?=
 =?utf-8?B?K3N1c216MEVoclpKUkZuclpDSGRHaWtSZ2lXTG5vVDhWTS9PeHI3Q0tZTURC?=
 =?utf-8?B?cE1GU2l0ck80WURSbWZibHZRMXF5cjRtWlZHU0N5M2pCUktualBKdnVGaHlL?=
 =?utf-8?B?MGtSTGFiMExJMFFNbXF6bklFWEd6d2xBWUdkMUlyUEk0Y0R5UDR2MEZ3NDc2?=
 =?utf-8?B?NHhadGI5TmFpU2ZYcHVEeWZjM2JrTW5mMUlWV1NMRGRrRDZpNHJCWG5Ja3Y3?=
 =?utf-8?B?YWViRXpuc3g1dGZzL3N2SDdYaWVPQzQrLzNydVpieWZTSTBTaGFoNTk0Z3Mz?=
 =?utf-8?B?emN5d0RaQVgyUmErbFdsaEs5ZUpSc243TE5lS3VnNDd4RCtMM2RtaU5RbTRC?=
 =?utf-8?B?L2o1U3pPZ2FJYVYvdWx4RHRGYXUrQ09FeFFkUEFEeDNId1NkdzBkM1UxczB1?=
 =?utf-8?B?VzAxNk0raG16OHBPRCtpTFRaRzNzNDBkTkdiVXdQbklIeWpYTU0rZmw0aUxk?=
 =?utf-8?B?dFlTUVk3SjZ1WGkvQStnVUxQQ2NGSlVDekw3a05GTnNUR0s5QVZwc2lNelJq?=
 =?utf-8?B?MzZmWHBjenU3V2QwZ1NucDJ6ZjF3enI3QlpKNTdmYkUzOUp4VGhCajNHNWFk?=
 =?utf-8?B?UUlIWk5QZm54d1JrcVZ2YVBHRFc1NGZxdDZiby9VbmxQNkpCdUJhcTE3QkdB?=
 =?utf-8?B?UStEQkQxN25uZ2lQZ2t3Y3h5SkhtWVV3WXdQZTBWVDg5R2x4cFdUQVRRbkxs?=
 =?utf-8?B?a2p0SlZFT3NlY1MvTE9Nd01meGxVTkYyQk5Ia3dWR0d2bjBBY0h0Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B7CC219AB073C48872A915AB4D4887C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hGqu4jaWo3Y0ctu0AxIZW2QWTihaUXlC7uOwWeXrWlL9Nr/MqtpN0qQB+9MpoV0mgz/t6EF8joQPnB/Z8I1udNwtaQ+L4cZIzD1mN6V+wow9SwxbEV82doRWw+mRZiDv4w7arlhl5756FGZ7GddYxJaDryxCUyBH6vq7lwFE3ThqaWq97Dd8eQ7i1JdGMQaCwzcuZWqQSZlfFUxXeHZH31Ah1eLnxJAyededlm2PKQafj854pMnTVu747rEYjGlWJrVoAuYSeONfimF7FjN8yf7IbuSylXbMv8j+vwxUMexZt16wbx08U7rwXX6E3xmqKljPdnUBBk1X4moUkFo3vo2uNBb0O3OlTYOMV4WZa0GCoo50FoUxItnTt23OkSx+YGdHovn81QT3/diWu5o9NY9X/1lNS7q/tQMnX2x+l1bEK2tZ2sgJ3cfD+6Z23Dd2airBzaQVeNObtduoCh+cPtN/ZKvyfUqSHNPzbL+leBLhks2XvC2bghV9w6o144b47asHu6y93UhSqtqIQ7XNFfSUCmrgLjKhxyTPofYo6267lqJQZpaL0BAAvjG1x54sN2lvChFaLZNegISyzVxJ6kLV+JNOyEivq9gJ+rrcuCY+TN1Vs+VhT/UZVeGo3AxP0twtreOV1ZdIxdnLfJg5QA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e31cbd-fc5c-4d09-e602-08de6f566f94
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2026 01:30:16.2592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1RoE1RE7hMkwnQ0f6RSgh2bi3AIHT5G8DqcaPmYJ8FGwK7+QSNG0fxuJNd+Tlyq3TWi5tkcZOzbRP+l6vaIUeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8971
X-Authority-Analysis: v=2.4 cv=U4KfzOru c=1 sm=1 tr=0 ts=699667b4 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=X7I-REWb3NltmJlRQQwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: ZfHjBlryOx8U8cBvAvDoug96fh5xxQPJ
X-Proofpoint-GUID: ZfHjBlryOx8U8cBvAvDoug96fh5xxQPJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDAxMSBTYWx0ZWRfX0RxRhjEldD2x
 Ae7k+mkeE4uyabdVn6M4N49RCnAXvKicj2lpC1zA/S4rV21OM3wRLCSDerFO4bTEj7GRWlPhCeC
 QcfZ/UKZCdIGyjxBiBPeM2oWJ2DX0/LKmxNm7A+/l6fSuoj/NMhSgnYZmUm6FAoB/nL0jkIqr8p
 U0ktiU/Y2hd+m/LEcabTEltP6NTFCS0/xAJymSjZMkcNrK+Ig1tj554Nf4LpaT9vVJWHleVBuyl
 pF4mUFYhiyb62VHOH+pnYeZV+EStpnzmSLMaIAS8AEAz6kJVk1/hM2hNoDNSt8pr+DdTa5PNUFY
 IIF4dBL3O8p/L/yw7GJ6hN2Mjchhno6OfGtIQNvCOFgp+PpPypvxwOS0QvN49hudXWdY9woThFl
 Wvq7agpH0fsteSVtEV8yFF+PoWMhGd1X5waFHPe6/3nhbMvvJLg0V/5NQ7NobyXuOukdn4P9VV6
 p0v/8OqdxUqWBO10f+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_05,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2601150000 definitions=main-2602190011
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TAGGED_FROM(0.00)[bounces-33460-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,synopsys.com:mid,synopsys.com:dkim];
	FREEMAIL_CC(0.00)[synopsys.com,gmail.com,linuxfoundation.org,iie.ac.cn,linux-iscsi.org,samsung.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0E6EF15B5FD
X-Rspamd-Action: no action

T24gV2VkLCBGZWIgMTgsIDIwMjYsIFNlYmFzdGlhbiBBbmRyemVqIFNpZXdpb3Igd3JvdGU6DQo+
IE9uIDIwMjYtMDItMTggMDU6MjI6MjEgWyswMDAwXSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+
ID4gRml4ZXM6IDA4YTFjYjBmNjVmZCAoInVzYjogZ2FkZ2V0OiB0Y206IGZhY3RvciBvdXQgZl90
Y20iKQ0KPiA+ID4gU2lnbmVkLW9mZi1ieTogSmlhc2hlbmcgSmlhbmcgPGppYXNoZW5namlhbmdj
b29sQGdtYWlsLmNvbT4NCj4g4oCmDQo+ID4gV2hpbGUgdGhlIHBhdGNoIGl0c2VsZiBpcyBmaW5l
LCB3ZSBzaG91bGQgcHJldmVudCB0aGlzIHNpdHVhdGlvbiBmcm9tDQo+ID4gb2NjdXJyaW5nIGlu
IHRoZSBmaXJzdCBwbGFjZS4gVGhhdCBpcywgd2Ugc2hvdWxkIGVuZm9yY2UgdGhlIGNvbmZpZw0K
PiA+IGRlcGVuZGVuY3kgYW5kIHByZXZlbnQgdGhlIHVzZXJzIGZyb20gcmVtb3ZpbmcgdGhlIG5l
eHVzIGlmIHRoZSBnYWRnZXQNCj4gPiBkcml2ZXIgaXMgYm91bmQuIExpa2V3aXNlLCB3ZSBzaG91
bGQgcHJldmVudCB0aGUgZ2FkZ2V0IGRyaXZlciBmcm9tDQo+ID4gYmluZGluZyBpZiBubyBuZXh1
cyBpcyBlc3RhYmxpc2hlZC4NCj4gDQo+IElzIHRoaXMgYW4gYWN0dWFsIHByb2JsZW0gb3IganVz
dCBzb21ldGhpbmcgdGhhdCBsb29rcyBsaWtlIGl0IGNvdWxkDQo+IGhhcHBlbj8gTXkgbWVtb3J5
IGlzIHRoYXQgdGhlIHRjbSBob2xkcyBhIHJlZmVyZW5jZSBvbiBpdCBhbmQgdGhlDQo+IHJlZmVy
ZW5jZWQgY29tbWl0IGp1c3Qgc3BsaXQvbW92ZWQgIHRoZSBjb2RlLiBTbyBpZiBpdCBpcyBhIHBy
b2JsZW0gdGhlbg0KPiBpdCBzaG91bGQgaGF2ZSBiZWVuIHRoZXJlIGxvbmdlciB0aGFuIHRoYXQu
DQo+IA0KDQpMb29rcyBsaWtlIHdlIG9ubHkgaG9sZCB0aGUgcmVmZXJlbmNlIHRvIHRoZSBzZXNz
aW9uIGNtZHMsIGFuZCB3ZSB0cmFjaw0KdGhlIHRwZ19wb3J0X2NvdW50IGlmIHRoZXJlJ3MgYW4g
ZXN0YWJsaXNoZWQgbGluay4gQnV0IHdlIGRvbid0IGd1YXJkIG9yDQpkZWFjdGl2YXRlIHRoZSBm
X3RjbSB1c2IgZnVuY3Rpb24gd2hlbiB3ZSB1bnJlZ2lzdGVyIHRoZSB0Y20gYW5kIHJlbW92ZQ0K
dGhlIG5leHVzLiBBcyBmYXIgYXMgdGhlIGhvc3QgY2FuIHRlbGwsIHRoZSBkZXZpY2UgaXMgc3Rp
bGwgY29ubmVjdGVkDQphbmQgdGhlIGZ1bmN0aW9uIGlzIHN0aWxsIGFjdGl2ZS4NCg0KVGhpcyBl
eGlzdHMgc2luY2UgdGhlIGJlZ2lubmluZy4gVGhlIEZpeGVzIHRhZyBzaG91bGQgaGF2ZSBwb2lu
dGVkIHRvDQpjNTI2NjFkNjBmNjMgKCJ1c2ItZ2FkZ2V0OiBJbml0aWFsIG1lcmdlIG9mIHRhcmdl
dCBtb2R1bGUgZm9yIFVBU1AgKyBCT1QiKQ0KDQpXZSBjYW4gZ3VhcmQgYWdhaW5zdCB1bmxpbmtp
bmcgdGhlIHBvcnQgd2hpbGUgdGhlIGdhZGdldF9kcml2ZXIgaXMgYm91bmQNCm9yIHdlIGNhbiBq
dXN0IGRlYWN0aXZhdGUgdGhlIHVzYiBmdW5jdGlvbiB3aGVuIHRoYXQgaGFwcGVucy4gVGhlIGxh
dHRlcg0KaXMgcHJvYmFibHkgYSBiZXR0ZXIgb3B0aW9uLg0KDQpCUiwNClRoaW5o

