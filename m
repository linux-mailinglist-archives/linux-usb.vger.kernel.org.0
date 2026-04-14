Return-Path: <linux-usb+bounces-36222-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDGUE/qR3WkLfwkAu9opvQ
	(envelope-from <linux-usb+bounces-36222-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 14 Apr 2026 03:01:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 530483F4B7C
	for <lists+linux-usb@lfdr.de>; Tue, 14 Apr 2026 03:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DC6E33012A85
	for <lists+linux-usb@lfdr.de>; Tue, 14 Apr 2026 01:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D64B285C8B;
	Tue, 14 Apr 2026 01:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Kj+Oru4K";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dMFeKIhG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GOu8D+ec"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEACF282F21;
	Tue, 14 Apr 2026 01:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776128459; cv=fail; b=onGvPLj+VbY0mQWKExzhqU9uMxjwf0IUv9k5EBEazyOYWbg1YcHK7dnwbnWb9FLS7PVzTkLV/oV6Ha+eLT5V8aI/BlS2grjpJY7xByMIAX7O2JUd0KlGg9Ud4Y8+tZU4uNWcddQuRlNxt43JzcNBMThmmGNH6D3TFmJrYQqz6mY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776128459; c=relaxed/simple;
	bh=OIWgdB9jmeImRw8UGN3Z8epInpiYGCNdAacbGAYQbjo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=P054J+fbkNvz2KS36nWHhObiWtVjoGbtTjqPjJUkhHwLJGe+W5WLY6pbeGIM1e7HUHetiPsmWyA1L3ujskP07MDBU1Am9/OVz4Sq+KG5y64eARA0To1VhHpTE+M8Pfx24pvbLZCjiO+1nkdnlH4vGvoNrfKIa0f9ORbqYcG/FBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Kj+Oru4K; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dMFeKIhG; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=GOu8D+ec reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DNgZdU2582488;
	Mon, 13 Apr 2026 18:00:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=OIWgdB9jmeImRw8UGN3Z8epInpiYGCNdAacbGAYQbjo=; b=
	Kj+Oru4KzRT3lQcG0J7qU+pg1l/KF882oFWYBz9ySPYkTdAQ4KUxwuluL3hjtgkm
	AwaitmC8NA1vTrY77PpxA91VFFxKOCCZiqrO2HR6+X1O1TXPnq682gPgZnw6rQFA
	ycbRc/FctyHGlVGfvaAiBuYtRxXufOzh7R6tG8mVT0cLtaE8i2Jq5omT/nZ+YUFE
	Bd307oM/eY0RM3Q1IbrBZlEEDjZ5pa8IeoehHLOJgNR1Eqf3Ymw3NcUgPnSK7miS
	RGjk7Hp+SFUPyKwh0TELD6jq77xmngsSKU0+yzcGWQ9ASxnVz0+At8URC+uoWxAa
	ZvfQabTJKvH5zsNjSclK+w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4dh85xrt77-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 18:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1776128437; bh=OIWgdB9jmeImRw8UGN3Z8epInpiYGCNdAacbGAYQbjo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=dMFeKIhG3IqVo8gROxRlG1nynECd2P67w7ZeIZ16onLMbo/tV7QH7OGfxBi9udlvc
	 tLdd3ETsryrId7oGXDCt4LZ/0qAlVTjNI3VcXvQRyPqYe+47p40X7zwMPW8/xHVjHK
	 syYfMqstKDLPHmBCMs9Jrd/Cfxzt7TaaNM8dVALab9VUnRkMVXf7NOemrpbWGdMPoB
	 n96KOhkhnyJFTt6Idn3SBJVGH5Q2hUn/+mfM8RFL2ff/2+lUyjGX86ByujkuK7cLCu
	 uDfKVnjLZqZWZqlvtBp3YDTEQcCIoUakGVJ+jdKJdLwbqZdN/8zKl9ZeNO3ETGh0wF
	 4IsHR0AFg/lCQ==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 424BC401F3;
	Tue, 14 Apr 2026 01:00:37 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 99949A00AC;
	Tue, 14 Apr 2026 01:00:36 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=GOu8D+ec;
	dkim-atps=neutral
Received: from PH0PR07CU006.outbound.protection.outlook.com (mail-ph0pr07cu00606.outbound.protection.outlook.com [40.93.23.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6DD9D401EF;
	Tue, 14 Apr 2026 01:00:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bW2rwJY3xkZW4FToXQs/jGHkM8ijm8YRPdsPQJMBrmuAf1hNXZb2Ez6cvne3PeTBcFQP3WDD/kzSly2hvm2+tb3JHkcYoMo+FgCOxdK9tTX3cVNNlmD9YHIGN5WyOKKC+Wd5AG8W8fKFC6appaPB4eTgiRsj+LlfmuGklxIpn/7Zy/+xmWyRj4nMYE+91ljfsq55Swsx4GgRlqOqr6yoUgfM+p6y8Rd49RWjbqI5QN0/5ea6qfWb3dYYrsvpIwnUIa9yw0ntrABV+aKfwvOlz6hikmwHnN8E0MPTd6bqefduRoIMDIFRKLrt+jTy+J0XlWXQ3UxOJcUHpd37i0l0KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIWgdB9jmeImRw8UGN3Z8epInpiYGCNdAacbGAYQbjo=;
 b=OGpLK8DuZGLD2YqeRQt2T0PkLo8xKjQC8epGtx2sVandsqxncNWLuKNUw9WQjpa7pq/pVrMtdBrLSb4cu+x/iE5zlnSJUUJwJn4kLoLpnQxlCMV3hOvQBK+iqWAt7QKMC3vwnTDjgfxLHE2Ji8wKE32QX0t5NTFQOLCYfOPWOAv2eGdMoPPcNgMy/qRE18/08uWICB8qr1sEhWfmW3/sYMmVBALzDnJdH4Y+Y6fMrcCL6kItDT528XilvlXrRNYmZSrR0i7r61HAK5L5XCm+hTBpbSTebyc8JvluJ5DBSDeknD0reL7YcTvYj1LdDEQgf0GFlgSva+oUF5y4CVGwXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIWgdB9jmeImRw8UGN3Z8epInpiYGCNdAacbGAYQbjo=;
 b=GOu8D+ecxDxp8A3Fg8mYqMcj0kyMBF99r9lVOo4HJXKpGPuRoYteXVC8Odu8GWzWbFVeiOerSkqU6PmW0JWzqF3UQR0kGJCxVV4rESTdLG85vycSMxRLf7f2RVxSqvUktfLvpcIltmy1vFz7YqE4wLltHxppbx+qxxFraaaZzYE=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DM6PR12MB4356.namprd12.prod.outlook.com (2603:10b6:5:2aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 01:00:32 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 01:00:32 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Minda Chen <minda.chen@starfivetech.com>
CC: Conor Dooley <conor@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: usb: dwc3: add support for StarFive
 JHB100
Thread-Topic: [PATCH v1 1/2] dt-bindings: usb: dwc3: add support for StarFive
 JHB100
Thread-Index: AQHcyAlvVN56EJm1IEeUuGdOeszzJLXW3XUAgAFMyYCABZnSAA==
Date: Tue, 14 Apr 2026 01:00:32 +0000
Message-ID: <20260414010022.kcnwkkwpyy4f5etm@synopsys.com>
References: <20260409101227.39417-1-minda.chen@starfivetech.com>
 <20260409101227.39417-2-minda.chen@starfivetech.com>
 <20260409-perish-speckled-1da7daabca31@spud>
 <SHXPR01MB08631832A55ABCB54FE77273E6592@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
In-Reply-To:
 <SHXPR01MB08631832A55ABCB54FE77273E6592@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DM6PR12MB4356:EE_
x-ms-office365-filtering-correlation-id: c80b39fd-5c35-41e8-a43e-08de99c13ac8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 eTo8Lhf//UnwYEMgb2LOCsSil0cKeQ0SZQdQuDJxuYYr+FLa/YRum5faUc7t3/ZhZcDxF/B/lDcLDMrcfxe4KfVjCQ8KI6T4xsiaXdF+tb/FhQ4nTYCsiCSVffL5GZYG2McD9RNeuu4ePcjdqyeCyphAFUiuEv8frURnAqY/QgYpLwzlYMRmbNMAe5EtuAMSfArG7qew+40nMoe4X9LeJx8Zj2ig5EukA8lVwsEacuI7CylF1JtilHkx+PlCka1JNwlfVEYd9P5UpZnmVG1b0/GjrgGImiLrss3hLgUWPf4LJWkEvsOm1h0NynqZWKLnukOeo2hR2AOzz5HaRAtJMjkNP/jAzdPp0RIp4iiy9Bq8YjvphlvB5vdebkF941KOsd2W7B1geAnwOHU/hIzyOVWW8X/o4rm6MobDvdibBanOExqpXCB2X+OXvoiotqd4jexggE5z0OEC4ixBpcvKc5eoHRgHa/kpimXe+rkBDELPKJAoZR4QZWcVES2kpFGTjKTxzEdhlHa8MpbX4JQoMzCf6AENx35fGpQyjSrhWGpgAAP7uG3NvkkY7R9NOi+W6c5QelBXEcAqi04wEI/SGSWaFCAK1XTgObtdnBAtUUWROid4JFbnNMkWxgjRTU+dWc6D3blnDi8K0FMGv5VzeCQXXyzDW50xUpGllF0D28nucVaBPW0/1fFxjNXaK+ByIgj6ibixQVqAqmiUUirkq/3wOprY+i/HxCOyxQJb0ioyLDCVo4mHtHUQdhcoQic/HTM2ibjxPZvMQEfyzIIvupH08yhUeRop3nl5zHqj4UQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SjhqYmtsT1RwbmxFb1dWaVBJM0ltYit6bzVySkg4VEtzY0M4YVdnajIxR011?=
 =?utf-8?B?V1lnNU5hVjlDVWIrNXhOWmRuZm9yd05JUk1tUndLcjdndEw3WmtQM1JOVG4v?=
 =?utf-8?B?OG52dmlOTjB6ZW4vcUxhZjNTNjV6SGY4YnZPMFZ1VzU5VFFHZHZVN1B6NktG?=
 =?utf-8?B?Nk42S3V5ZHpuZXhTN29LNDdGdnRVek9MS1kzbHhqVDVhVGpYVzg5ZXgySnZx?=
 =?utf-8?B?WjNXQW15YjVNSEZBaURJOGx3ejEvcTc3SjdvUDluQkhrY0xxV3FNSGVqZ01I?=
 =?utf-8?B?d0NqakNqdDNsWVpUVDFCYTJGSTBNZlA4ZnYxc0V6cTY1ajdEaS8xdytWNVM2?=
 =?utf-8?B?aTY5Umh6c1gwUHY3d0hoMVZ5LzVvY20zandwOTR4ZGwvRjRFUmJ3MkRPVFRH?=
 =?utf-8?B?ZnFOUE43aDRDUEZxR1l1WTVsQkE2VzN3bVZmbzZhRm1NZUJ1V3R2OFF6UEhn?=
 =?utf-8?B?TTZSZDFkelE4eE1CMVlYVUhvK2NScW1uTVloZDZ6S2EzczVYdVorS2M2eWF3?=
 =?utf-8?B?YjZhSm1oM0Jkd0hZa1NTY1Z1Rm9GakhhSjlLU2lpV2g0UHNvSUUvdWZlckw4?=
 =?utf-8?B?cENtZFJiYThLeHdBT2IwcktmbzVHVFdkZ0FwRmVvK2svWFNObW0rL2dzTUgv?=
 =?utf-8?B?Z0xOamlCcms5VTFQY3EyaTcxTkNlcjVoMEZFVTVNVVc5eEJQZVhtQmw1WEpv?=
 =?utf-8?B?UWljWGtDUFlCSDlpRnpyR0FQdHV4dkR2OW91REpVSVVqaE1aYXQzM3hINmhJ?=
 =?utf-8?B?d1Q2cW9uY2JRWXNGQkkwZGY2WGE4YStvNllGdTdQVWRCcTd0bXg0dXlVRG9R?=
 =?utf-8?B?M25VNXpkd0RnbVk0TmpUaTJYeWp3QWdkWm1UU2ZKeVJKUlk4bVFab2x6RzhK?=
 =?utf-8?B?YXl2M3RMc1pEN3FhT0M1eFo4b2dtdWVQOVpqWkVPd1lueGIzaUNHd3VNc3pp?=
 =?utf-8?B?Uy90WDYzWUwyMk9nWkJXY0NidVdleG9WVnNmVkdrTDZUK0wvckVJN29jYitE?=
 =?utf-8?B?WGY4MFYxcmNiSVZvVS9pd3FiUkxBWE9ya1ErMStTVHlNYit3WDQ2bkNjUjR5?=
 =?utf-8?B?R3cwbE5RdTRzN1hkRWJSc0dLVjUrQ0h2enp3RzdseGxXenN2c1BoVDUydkN1?=
 =?utf-8?B?UGYxZVQwcGtZd1E2Sy9lbW1qMHNmdkFmVVpKRjhUdHdBdExGY2hpZmhpN2Fn?=
 =?utf-8?B?NmFObFFHcTB6SmhXR0xhdTZrNlY1RW1OS3VkSndkeEZkbHZ5b09UUjdyUTNp?=
 =?utf-8?B?cXdGQWpBRXEwWE9LN2dNSDJBOTN3NmJFNVg5RGpUS09yNFFPeldHZUtKSFhu?=
 =?utf-8?B?N052ZGtjenB6VjJJSFg5N3VjM1JPZ0g3S0EyNEc0VTRyS3ZaaDU3Q3hOWWcz?=
 =?utf-8?B?VVNYS0NtK2hHWnJzY250Q3JQdVRCZE52VmNXVkNrRVlhRHhaZ05SV3lXSkdM?=
 =?utf-8?B?Q25jMVk5eENSVDAweVoramZDdkpISERsQStNNEt5cjJGbEd4Mnk3eVMvYVNP?=
 =?utf-8?B?N0xnZmVyeTlyL0JvUE5hNXQwV1NNOThNU1JrYUpnTVZWNHptRGVnOEJEbnpT?=
 =?utf-8?B?Y0kzdnc0NkZXOVRtTWFrdDZnMG9oM2xieHhYaDRNdFB4czNNTzdRcUhDck9W?=
 =?utf-8?B?YW1WWUp2RlM3eEZlaExWb1VocmZKcTJadGxReXhvb2xuanhKRFoyMHEvZmIy?=
 =?utf-8?B?QzJyMUczM0ZkQVhLL1M0bEpjOFNMakVEQ3RsSWtzM0NwMU0yU0pLblFhdngv?=
 =?utf-8?B?UUVESVZZYnRsVEIySkRrV0M3LzlicGEzK25xZVRVMkZ4Z2RMVlhHQUM0L0xW?=
 =?utf-8?B?K3Z6RWowanpKbkNMTnp4WVFEWlRXRU04MGZTK0lPRDNiZ0l0UlRpV2JJbkF3?=
 =?utf-8?B?dCtCWVpGK2RSMXBEaWZXRTQvRUZRMTFuK3BKWnRiKzJyUXdHUkoxQlFUOTM4?=
 =?utf-8?B?Q0U3MitaaTRWRmhCYTBaa0tNb3pYdWlHcDVnemVxSzFPMm9uSm81eEllUEJT?=
 =?utf-8?B?QnJQb1ZQcCthTW5yRllUUHhFNWdLZGxkeHJrS0dwc0FhSnBrbzMvcTZHdGIx?=
 =?utf-8?B?UVlCeGE4NkExRzJCZ21WVHNHZC9OT0hNemJGYmFCVmZYK1JnRGJtNlBYUUI4?=
 =?utf-8?B?ZzBIeldIQjZqTDJGNEZyVXZpS0dzcE53NGdHaXJpaUovaXZlQTYwQ2lRY3M5?=
 =?utf-8?B?Z1NOTG44OVF4eUtLREpneC96c3hOdGlFUFNiRUFwdm1IZDlJK1o5Tnp5MlVU?=
 =?utf-8?B?bTg2MHByUjRrMWVBSVdCdDVGZC9URkFQODJ6amRtelM4cTZtZHRNTzZ1RnhW?=
 =?utf-8?B?TVVUQ2N5aVo4MDI5ZkZnVnc0cEQ2WVllbVRuSHgrODdmOUtzSkkrdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C594789560CC440AD1D0EA2F7B42C37@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	jo5n30C5mO8VYiDu137LCbi3QWejHIwz1CY9l+tRAixnD3v3PyTZwrKjkH3XfexeMhghp/f6uWtWz1xchatCyyTEQVvnJOzwXAL4WtSrCLNWMnBIPJlI4LX3d9Agsy1WdVMQYFXvp8NHnBnMi+Ig1vy25OcX6ZoXzUagiVdU/6tlJ9B7pUWMi/z7dqfv0ezeJscwncst4bjaztSoNxPLc+2GxGJzisQeU4vGHrs3SPnNmqmtX4AhalbbWy8GRdBozgI0BdvtRQvJhhRVqb4BPXqwU/AcsyprtLhQnKUMD8o+xmaHnNRdo54ryKp/VYXpms657NYB5bm8xUgdsMh/DQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rvoITuVQGc5fBywT+HW2C0P4HFayWSAxGeDKdmTwHf5sjz4BhdMOAFytMaShNJWwzUJaH5lPbqHrpPLex6Kb5SGppKPx1uYIYfbvyOCYuVLLW1REwUgsRvOPrDMCQjcNMur8zf+yBgt3Jz+VX4lv9gBlTi0TE67aPveCoEgk30THtE4S00O0UqoOXEUHL3owANTv+vVXocInek40j/SwPQJpWT7Apz3Hx6VJwV1+IsGw1fS3t4mEAVeXjnXSI+l4Coda6zNGvX1x9jfMFzXMhwBmZGjgphdDE3q62u2FgtOGT7GIkytffvdXW8IbA+zv3Y27SEQrC6QUPD13Nf8+bYBdumWY/kup3QQQ9XwDMKx6v2m3cxwdxz3yVXSI5Hdf/zGy+rAcQzXt1GEFTsGeRm56IWVuteImh5YQ5QIrLc3ltzenjj2Bvi6DnNNbT7Mb9d7pd4gdlclWDyHZSqlTxyIs6Tp+OOWVMewOHNirGJC6uID08gru/mTGfAjU9eUFXgEDAk/V2HkDpQcGAXInc/7ZXqNMEm/+uqYtHXfQEecQVTXvi+j618Aa+MsfWPuCmNPeCnyFfNwjWCNTwreJ0uhZGEL7HKQIDMHlD8Nv8S5h47gNfJ6pXIWy23DvlZ7dE111P2lY69cAhvZEQwSrmQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c80b39fd-5c35-41e8-a43e-08de99c13ac8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 01:00:32.6548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nxuP6onILDMA0uA0DZCi53KHpA4KmzeHRkBHwMtMkFZTJVkGVmhYvp2BSXq3vC2dpbRiX1hUvVuQ3DY4mwgoHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4356
X-Proofpoint-ORIG-GUID: NXkL4vdFNhSnAVJYfiWcE9N7N3qAiZyK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDAwNiBTYWx0ZWRfXx1TXCnkgVHuO
 WTY7voapSXxULM0eN2WrwNpz2JcnHZEuQBmLkukRoWzzWpvostaz/FHxySK2jDZ4WUe5xPOlcyo
 ggJ/La++cJp9wI41m1vVRcGdiB1yLxlNpUH6TzR6XbUkDnthrdBntcfbyr/JXUw2w8pgMcusO0l
 iw4NjxpEz5xLUCEDvfP3gwoue9RBQp9MF4yuEWYJ0aqTm6GmarweO0Qvtpzn5aorV/2UJ7eaq45
 2hFNdbDJT3mCo+anaE0WNIWVMLS5FvPGrTGccHxdJmro6IeXKs4zQLeuu9rC7Oqc2E01D7QsKDy
 j2UPHvkxeJDU53PL3JuQFTxhaFrsQ5DV4JnZywrtqallblEp61GaX99bP8SdznJHzFuo0sx97VL
 BJgdPuqo4DjyjmJnHwpCtBs8vhWYgJQJJ269SK8jRE9GBtK4ouexyaLsId7A5dcuzrW3caS+PMx
 YXqfCI2HyPaMQg/mBcA==
X-Proofpoint-GUID: NXkL4vdFNhSnAVJYfiWcE9N7N3qAiZyK
X-Authority-Analysis: v=2.4 cv=dpfrzVg4 c=1 sm=1 tr=0 ts=69dd91b5 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=gRtOQU9UD9mjlhjzybMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1011 impostorscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2604070000 definitions=main-2604140006
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36222-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 530483F4B7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gRnJpLCBBcHIgMTAsIDIwMjYsIE1pbmRhIENoZW4gd3JvdGU6DQo+IEhpIFRoaW5oDQo+ICAg
IENvdWxkIHlvdSByZXZpZXcgcGF0Y2gyPyBKdXN0IGFkZCBhIGNvbXBhdGlibGUgdG8gZ2VuZXJp
YyBwbGF0Zm9ybSBkcml2ZXIuIFRoYW5rcw0KPiANCg0KRG9uZS4NCg0KQlIsDQpUaGluaA==

