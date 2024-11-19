Return-Path: <linux-usb+bounces-17731-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1229D305D
	for <lists+linux-usb@lfdr.de>; Tue, 19 Nov 2024 23:20:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24EFC1F219B4
	for <lists+linux-usb@lfdr.de>; Tue, 19 Nov 2024 22:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA541C32FE;
	Tue, 19 Nov 2024 22:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="h6ziQv4P";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="K/X6WBo2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PXDcmF4j"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D141C1F30
	for <linux-usb@vger.kernel.org>; Tue, 19 Nov 2024 22:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732054800; cv=fail; b=i/GHR/BFJ92uKiV6T2JuV7RNB1QWNZEhHu+8zbqDUX2AR/4fKU0E8Qj9fcGOZdKRcc36sellobNvEUTSEheo9S14eF+RZ3K4/F83Jvp+NqKj8+IRIM8DW+juUFDXewkpNbxeJJcf/bLlzEkzyZmuY1uFGCC1rQEJusrHA2KpxPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732054800; c=relaxed/simple;
	bh=tap8eqQNgJNRnHHkFCdHozPRj5rpMdtKCjhiZ7aC9iw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j+JWTK32FUvhMU26pG2JJi+ww5Sk8OqXx/X7r1j9JJCDmZOTdjpciB7cBEAzSUTf7KrBTHZHdoblHlXbFCIxfo6GJ76UfsK8kc21aTGzAYkxfkj7NyQy63MQkyE1ccMHTXP8crwcO5Uqm3YDNbmD9XlOk1slgjuk1ESeys4057g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=h6ziQv4P; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=K/X6WBo2; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=PXDcmF4j reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJM46Dk031774;
	Tue, 19 Nov 2024 14:19:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=tap8eqQNgJNRnHHkFCdHozPRj5rpMdtKCjhiZ7aC9iw=; b=
	h6ziQv4P2GAoaJxT7TlGgqOkEIdoTsAd4ZuTAkNH3lhUTV9GJOe+QTOlQBJbB4k9
	UWjNvhXctdERGxd0X4Z6nxPTmWSXKY7EWQ6RDRVjLjQp+ZwjkanqXQpxJpQuzTO9
	4fBfbucmlKCYLq2vNb6Tsgh5nK7UKp+9sPC5SS9rYQ9mEEkaCal2MI/8X8DoeW1R
	dsi9SBg8tfnLPGWfyphd8paZAlEl7YnDiFP+Lo/yhnXLyd0X42A9qKLh8hgPuz5u
	+CGIdTgRAnL+29dncSByISFbI+JffuKjOpjFOXPm3ACTwPdT+NdmA5L71/PeCLcj
	GIt/AdTN0/GbyJ62miwx8w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 430ep9620h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 14:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1732054788; bh=tap8eqQNgJNRnHHkFCdHozPRj5rpMdtKCjhiZ7aC9iw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=K/X6WBo2pCYPtgOQCxSUQ4+zynIyipvYwuwdimKvyP9CRP7NKEtVbaUfwUXrNHBPf
	 fc8oi0QxGDwLKoUZNYkTHq5fCL20jGzrDO/Mhu42PikvwYNP+WOgdoqKedjQEKGuis
	 MKdqSkQSYBaKS4NQixXhF51qvZ8oqOiY5eXpCECmiXe6MpMgrCdV4cXmhLC8CszRDI
	 /wVXvgl+as9/PYzYsZTgRQ3lKsn57G+c4OJ7Bb2na5lyIKZvWflQcFxNxVEOyxU/8D
	 CIpXTX417gHV3JcdL3Gojtsuqx/eeZQE9hPtDHoSTjB5nBuiE2L4+RQdnwioFKJTAB
	 ISzQGtLPC69Nw==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6F32C401F2;
	Tue, 19 Nov 2024 22:19:48 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 4F053A0079;
	Tue, 19 Nov 2024 22:19:48 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=PXDcmF4j;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8B49F4045C;
	Tue, 19 Nov 2024 22:19:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x5WhaD5xQnAu19LRYBs35TFggrEWdNJ1bpsdh06sOMAiKUnUtMB0ANWAxka/RWev1VS0a6mv3Wplz+NuYsYEhhUEgVkrPzzlx2kXKwgPNG4kv9cBKWZjeWELcRfbHxZO0MdQImEhpsG2kLCxqx3yrt/xw8RsyA/ZRgmB19Aq3IYmlLyUlFejtHrLnUty+aPEFvQMPJIbiywLPrCD/3pwisPDwzy1bkx3GLRoAW1eGtNOX8F1yQzEyLm/3wlN4zS57FqwdlyhlM6c75QEu18U7LGOTVih+uwqD93LpQvHRhS9nZNUZyGDnzcuOT5is+pLM0cnNaQGbh07tuROhc26dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tap8eqQNgJNRnHHkFCdHozPRj5rpMdtKCjhiZ7aC9iw=;
 b=A7+IdXo+L17vyMAAfLD0DRZZgDibWBRASucWxvQQo0kJetTYGkEeIKv21hLcfDRRJBQZrNVW/QMAPsgU2LtxPdM70y4gh/QJyjhcvfj2iU08PPLnSanXf5foYzME/RMaTpWGpjSkKnNpc1ZbaXLSUvokMEX9GEmDWePdNBU5+sTq0rBsraR9Gnhjp5kbk/SWNkS7uQwXYnzsAEC6iXewp/t4ZD2/eQOdb7T/z6LJSRYoEI0kcC0TUbBvQO7y7Lh5r/GdLye/Vz2kvYuZUwb8HPMYTjxH5FbnVMDQQGgQRxSvO8wBg/e9rd+N0b/kjWYs2Pl15efk7zBphM4ue543Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tap8eqQNgJNRnHHkFCdHozPRj5rpMdtKCjhiZ7aC9iw=;
 b=PXDcmF4jGmiG754rstBaSNJcOWxmm1dnHfiYPu4ymK4wghYzXxpVoTjUAg7vkiV172clp0JnQ0eNEGpAdU5sxq/tMYMmSEu2tZHugAAPOShZntaUqNkLZ9eLvkveYFg8lsIS4QpxHXrpgdcIMLhGo/0NAmIKLVrI8Titnug3HrQ=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH8PR12MB6745.namprd12.prod.outlook.com (2603:10b6:510:1c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.14; Tue, 19 Nov
 2024 22:19:43 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.8182.013; Tue, 19 Nov 2024
 22:19:43 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Chris Morgan <macroalpha82@gmail.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Roger Quadros <rogerq@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/2] usb: dwc3: core: Prevent phy suspend during init
Thread-Topic: [PATCH 2/2] usb: dwc3: core: Prevent phy suspend during init
Thread-Index:
 AQHakFeioIjMhcyoIkClbCNPPNRvWLJpHmKAgC/myoCAADfOgIAF5FQAgABnfwCAAPC4AIAAdCSAgABbi4CADCIBgIAJ77MAgAj9TACAAClegA==
Date: Tue, 19 Nov 2024 22:19:43 +0000
Message-ID: <20241119221941.r4zu6f74cnj4we4w@synopsys.com>
References: <671bef75.050a0220.e4bcd.1821@mx.google.com>
 <20241025224003.yfujqurxhrgzgzld@synopsys.com>
 <CADcbR4KhWdXpynk2c-tryx1=Eg4LhC4t=C6zcVHAMcMz2hH-8Q@mail.gmail.com>
 <20241029224900.by3zglncf33izsgw@synopsys.com>
 <ca4daad3-9a34-4331-9faa-91b960924b9e@kernel.org>
 <672291b9.9d0a0220.1f040e.013f@mx.google.com>
 <20241031013353.cgxjqgboz6hcy4xx@synopsys.com>
 <672d0c05.050a0220.114196.1e8b@mx.google.com>
 <20241114023458.s2gf7gagiawhxn3r@synopsys.com>
 <CADcbR4Lqqoi5-MT5KyJtsNLpa-wEJxe2D7Lr0gHCqJRjSNbnig@mail.gmail.com>
In-Reply-To:
 <CADcbR4Lqqoi5-MT5KyJtsNLpa-wEJxe2D7Lr0gHCqJRjSNbnig@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH8PR12MB6745:EE_
x-ms-office365-filtering-correlation-id: a97ca490-05f3-4907-ac7a-08dd08e844d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Um5mR2JXUk50b1dwRVVkazJrTUJ1VVFYRlVhb0N5elBieG8xdHo5Rmxrdi8r?=
 =?utf-8?B?VHNGajV4RTUvZjAvYzlycG1PWlFQWUVnWWJaQituY0hpUEl0aU9LQ0dJSktO?=
 =?utf-8?B?THNSS0dqZ2hpNngvTlF2MW9rQzgzWk0yZzZVeXBMQ3A2U2E3MlBiTlBFbEUz?=
 =?utf-8?B?dzhuVFRUaHNiNU5PN3BBcjVhUUx0d1hqSXJvRkZDM3NyTWVnUWxXK21abFVh?=
 =?utf-8?B?M2Q5R3liK2JrbWkyVGtJVU04VEwxS0tXNnY5Y0dBQlF1UzR1M0Nva1NEekJK?=
 =?utf-8?B?UjM5TzJqRUU0dTQ5ZFI2bXg2S29QNElMNEtMbGlNbTFRSXljUUZReVJUUFFt?=
 =?utf-8?B?RHJ6bE1Id2FweGdpRGFpc2ZwQjJCS1dJWkt4K252YXp1KzhDTzQ0SEJzb1Rp?=
 =?utf-8?B?R2xDNDI2Z0ZBZ2RvQTdISU1td01GSVUxN0FYeDRlaktWeWlDNGdDaEZBV1RY?=
 =?utf-8?B?T3V3am5wUVlWR3FJWmpYQ1BxUHkwcXFaQzJUUUIzSUlPekdlbHFhUVBuRmNQ?=
 =?utf-8?B?S0JUd2Z1ZjlNK3ZQNFBYcmJIKzhUeUw3SEQzTE9mN1p5RjNJdmt2UHIzWTJw?=
 =?utf-8?B?MHFBK0ZLSGdFejV5c2RqWStEUkhhYUVTTnc2K0w3cGdEMGg3ekRLWXA4YVJo?=
 =?utf-8?B?WjYvdHdWUWo2czRtOEE5R2NvZDJRRWc2SXl6YUkrUVQ4ZUtIdGprMXB6UXBr?=
 =?utf-8?B?NHpMZmxhWDRXdWVGVFlzVWtFVGtLYzZHZEs4K3lkcXMwTXZINE1XVnpyTU1X?=
 =?utf-8?B?cjVqL2h2WHVkWlFiTzBOblV0TERtc2pTZGwycmFGNWgxUlJ5Wm1taU5rTzdx?=
 =?utf-8?B?bVR5ZEphajg2QjlmVU8xa05wK0UrN2JaS0dhL00wekY3YnlJdk5QMExidUZz?=
 =?utf-8?B?RlZKS0ZPeEJTK3dpTXJtSDQ4T2RQdFd5ZUluN2VaVUNCUlAvRWVzRnp3ZnpB?=
 =?utf-8?B?ekRDcDlIZ05qamVtaUt3cXEzZlI1Y0RlUndvVDJMbG5XbC9DR1liN2Z6NS9S?=
 =?utf-8?B?YVlnT0ZUbHM4WHFXbmVHWHlhUXpMZUwzVnJwcmw0NmRuL0w5OVBmVU5LTHZk?=
 =?utf-8?B?RnhUTXJXQnhxR0xWd21XUkRnWXhDS3YraC9TSVhBbTUxZVNxWDU3QXF4dUE2?=
 =?utf-8?B?N0pvT3FrRWlabWVKZUt1MVN2S3gxYytaRVQvRFRuT0R5SGZuVWtWL1hheWMr?=
 =?utf-8?B?SEMxYlBhU2V6K1dPd3FxdW9uZEk3ZWlpaTVRSnpwUnNKcWFieTZpSjdhZXE0?=
 =?utf-8?B?NVNydFVaQXpNSjQ5aDNldkw0OG13VkJiaGhWNmNhWHU2MGowL0djVjAyRFZE?=
 =?utf-8?B?V2N6RVB2RUtSdWhrem5QVGowKzd0R0ZaU2ptdC9vcGFxdjBsV3RRSWRIVEpC?=
 =?utf-8?B?WkVjSzJvcXpuUCtaNjRQcUY0MUFLMnJpTm5kaGc1MkcyUDZGTWRkWUxjWW50?=
 =?utf-8?B?VmgranBudXZpc2dPQlpldzU3aHJMNHpsRksvMC9VVGpxNUdjZXhxV0VwNWlI?=
 =?utf-8?B?M0s2N2xIRUZCcWR3NnB5aXBqaTI4ZkZySmhzYjBrdW41cFExM2Y1NmlBc1d6?=
 =?utf-8?B?NXRVR1NuYVVzb1AxVEVneXVqcnYyM2ZKblN3STJZbGxPSlM5QjBvaGJjMkRC?=
 =?utf-8?B?ZWVheGR5aTN6ZXhQTEpiL0tVT3V2U3ZLMXB6bXRlaGtNRmthT1FGZkpGZHpm?=
 =?utf-8?B?QTZWbVVwNGJwQ0JLR0pqbnkvaCtkNlA4VVNud2xFMjFPUHA1WlpQenEwRUY0?=
 =?utf-8?B?ZUNPbzhsdEJtcFFaNGVFNk9iWFJrK0JOMSswMGljMm1YZE43VmIvUGtJL08w?=
 =?utf-8?Q?MEdmoOF88Tze4X6mw6wqkadg3cLi66qm/AyPE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VGRkSkN1YkV6eStMRXVtTytiRVhKWlhpdmxRSmh1SWhTaHowNkJHR25HVzgr?=
 =?utf-8?B?QVVibUpGa1NDcndiWXQ5YzRiNXBNRGE0bTR2ZlEvcGZPNjNpS29xYUE1eGNJ?=
 =?utf-8?B?a3dTNUEwY3NXRkwvOVhuUW5TVi8xR0tyWlYvOU5oWjJMdVRjZDhFSUg0cCtM?=
 =?utf-8?B?NHlaamViRlpSeUo2V1kvdm5mR0grU1BGSG5DaFZmQzlJSnQ5MlhET3FySEhB?=
 =?utf-8?B?Nys4d2xzd09IYnJiQWhrSWJ2Yy9NR3EzcGpBdmdmdVlqVlZGamp4RkZ1azRl?=
 =?utf-8?B?QTlnTzExQXF4aUpiVWlaTGt1VjZFb29jNFA2UG9YVExiY1Fsby94dnFYZjFT?=
 =?utf-8?B?Uk5zd0RydGdJNWpMUnV1VVZpZXlGdkhBVDBlNmFGRkdTcEZqelROWWY0QWpz?=
 =?utf-8?B?ZjVXL1ZaT0xZZHl3SmE5OUJ1OWk0OTlFZ2xpVFhSVytOaFFwWmF5VXRUY1dS?=
 =?utf-8?B?RjJTVkZQakt1KzNBME0zVXpsRkNKcnBTTDFTOXQ3a0NDNTNsbG5wbTBaRGhx?=
 =?utf-8?B?ejBpL0JFdGJOQ3NvdDJybGVQQVpqNDJiSjcxS1JyZVVjODljOWJjUCtXWGVw?=
 =?utf-8?B?Q2pCWkVvbE43WGtDblFvU2VkVGJ4cWpvL01paUdXa2xiNW44SnFmUGNiZVRQ?=
 =?utf-8?B?eFhLZGl5djdhVXRvdjdEUDRRWjlPNWhYVU9rMWtTL2RQZ1grbDlVaHhFek1I?=
 =?utf-8?B?VEtCRE9wdDBRanRoUURpdUh4Y0VhNzB4a0hIekVVY2QwV0pEZ2pHVUZ1Y3Bv?=
 =?utf-8?B?SG9SbTFjZFFya2Q2SG41YlFQTG9hZXkxUktUV21ndElqL3VKQkhEMHJwL0VB?=
 =?utf-8?B?VVJHRkpENVJRUWFONTVWU1AvR3BBNm5tVUZNS2ZrZEttWWw4Q1JHRGY4Nm8v?=
 =?utf-8?B?RkFSYUpzSXVMVkZWWlpIdytXdmFUWkh1bGRCYzY2Y1BDZkJacTFadHV1Kzc0?=
 =?utf-8?B?T0lkTXZmN3F1ZDRqa08wRkVRU0tSL3crKzVuKzVGeE5rdkVrbitzTGsvUEdR?=
 =?utf-8?B?dGRrZXZyWjFEL3BGTDYwem5lN3Jaa2svOEJqbDAweDh5ZHhyaHE3NnBRUEtK?=
 =?utf-8?B?SXhrUlpIYllvWW5rTmdkaGJlQmN2WCsrdEFXdmxFRWNLejVmZVBVRFNiWFVo?=
 =?utf-8?B?d0RUN1dCVlRwcDc5ckFWeDFWaStublZZeTVOUDNFVUxDL1VTY3JJVzF1Z010?=
 =?utf-8?B?TlFOeGFzV25GVlRzK3NPWTJQUTBwb3krck5QUmdBaVV6NFdBRDk4QzVMNno0?=
 =?utf-8?B?bXJ5ZW1SM0lHVkF0emsyUTkvS0xkN1hJYVlsM1RwOXZrWUNZb0VsK2tTSS9S?=
 =?utf-8?B?Z240blNVU2J5b0lqekZNcldKSElXeW9xbnVjTVNPSkRZUUFVaS9WdHgzTERG?=
 =?utf-8?B?REJzSTdzN0lmYTEwd2pZMEU4SjNnN1lHTzJMK2dRenFhU0RTcFAvSTZ5S0FO?=
 =?utf-8?B?aGNxendJM2cyK04xZlRlV3RPZmdrbmpjNFo4ZDRpR2pkM0tEZUxGY0tIWTJr?=
 =?utf-8?B?V2lxelJ3cVR3dXRhUGtEQXlJR1B5Ym0yN0Z5a2Q1MGkyOTlLeCs5ZEkvUzMr?=
 =?utf-8?B?NkdwcGlKblBMcnRQalFSQU5QVHF1V2NxSzB5TUdSdG90VENXWkNJdDhYa29R?=
 =?utf-8?B?ZzNLemV4VmZIenUxYlBrQlpmNWw2a3I0T3N4Tnc3VmRBd2lYQ3J1SS9ZZzli?=
 =?utf-8?B?dGpMTk5OTkVmaVFYYUlhWjBGTVBNQ3U2UE5aemFEZ0ttUVZMdVFCdVordXJY?=
 =?utf-8?B?K0RWUUNvdTEyZkdoY2g3YzNMN0xSOFNsMUVvajl1QVE1V2hwRE1qeFhVbXVl?=
 =?utf-8?B?dGtUWWJwSG1wYkhpcUh2K1hhNFNLR0NMWVczRExjZGNBQmtrYjRXcEZUNGYr?=
 =?utf-8?B?WXM0VnNKZktGZlVQNnJPaHd3bmIwdnZqdjR6Z2cxaGpuVmJlOTUyeUI0MmIz?=
 =?utf-8?B?T0JYZ0JnL21kbGh4UThMd3FvVXhucExaemFsZTNybVMvb3llby9peDdjWG9u?=
 =?utf-8?B?bVJmWlhtQ3Y4d2VHUVIvTlpUcDhib3dBdU1ISzVJdVdoZXlFNE0wdWVQVWda?=
 =?utf-8?B?MkFZNW9DRGdldHhzSkVJcm5yZGhSZ3lVM2tYeGQ4WUlXZ0JRVDc2ckdBcytH?=
 =?utf-8?Q?WhuTcvLQEYEF3b1HMH+IrV8Gp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0FA331FCAD435848AD50F072FC50DACB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jo5KUMVk82pUGQPlrIg21IXPD9k1MYWLAO2wwBRqiVQOkap93i76Z1O9wNUSMzQtE9xOxR8KlL64GycJ9+hFmBvntq5qswsgUVvN19utqoXmddlS0aTvO77ZRpKnbl5FuT60sjFK54Yf186/ppOb2MN6os5xZz+yw+EvYgA8HjrOZTwi3r0a8dmx9ZfkI6NuBD09Ufv9bNtZPs2YxTg8/DzgN0wLvzIp0+U8lQWjjx346pyI33jCmnGp3hKgxZXP73R2eZKN5OohE7KvioR4zTws+BO+1S53djVQaS7Pk2QKL9MHXLi8UdgfYqPdi6uxfRehMG4wxwnKjmxv0lWIiHBaF9LG9umi+2qsW67XPFT4kPjjXvEufQekpdJsY49bK1/+biWpAfdogQLh4QRpoJPbGgYzYC/pawGqXurxqRWYZ8pOmxX1yZB4uyPDYI5JsKGt8nb6p0J3/7i3/OtYzDlToj4VyIAHd/s4L+nutzUvoaftNzRIT10qwfxx8Flog4oZ5TP/YhwYiqRrm2oeCgxl5BdVQ0316ho7GwgT4p5IWE9p7jb0g5OFFJw4OHjp+WdK1d6muFo4Wj/RcmmN2uIKEFzlRPbIajSpggZrK2mPCzRlEIwm1YwCScS6Vfsrip2cUIPTnX+CpAvaUWDY8A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a97ca490-05f3-4907-ac7a-08dd08e844d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 22:19:43.6345
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LAaEXAlgcDo7+b9cC4H2lYLfHTXFmZDuJK6f8epdwZOilTzgkByom/aEDYmzLnjgDprXhFV2md5FHnEUKosRiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6745
X-Proofpoint-GUID: cEuTeuiPwRA00uC2SfxBjz_OIB7t_lfv
X-Proofpoint-ORIG-GUID: cEuTeuiPwRA00uC2SfxBjz_OIB7t_lfv
X-Authority-Analysis: v=2.4 cv=X/0AK3Te c=1 sm=1 tr=0 ts=673d0f04 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VlfZXiiP6vEA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=fpe0MYjromN3SISmEI0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 mlxlogscore=857 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411190162

T24gVHVlLCBOb3YgMTksIDIwMjQsIENocmlzIE1vcmdhbiB3cm90ZToNCj4gSSdtIG5vIGxvbmdl
ciBhYmxlIHRvIHJlcGxpY2F0ZSB0aGUgaXNzdWUsIHNvIEknbSBndWVzc2luZyBzb21lDQo+IHN1
YnNlcXVlbnQgZml4ZXMgc29sdmVkIGl0LiBJIHRob3VnaHQgSSB0ZXN0ZWQgdGhlbSBhbGwgYnV0
IG1heWJlIEkNCj4gbWlzc2VkIG9uZS4NCj4gDQo+IFRoYW5rIHlvdS4NCj4gDQoNCk9rLiBUaGFu
a3MgZm9yIHRlc3RpbmchDQoNCkJSLA0KVGhpbmg=

