Return-Path: <linux-usb+bounces-36302-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDZaIITQ4mkN+wAAu9opvQ
	(envelope-from <linux-usb+bounces-36302-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 02:29:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 204A941F738
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 02:29:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A9403083FEE
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 00:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B58223339;
	Sat, 18 Apr 2026 00:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="sKX3T5s7";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MR3CW1Kv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YeEAFfVe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DECA1F4C8C;
	Sat, 18 Apr 2026 00:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776472154; cv=fail; b=O4c0AJHYTPaXPMsTIaqGbDyRZW19S0L8CBOLukafxpLm8PjvjIEYAbkgppPm2pxpxHFcs9fOCNaKjVoBPo25G5BN56FQPGTZPQQTi91GSRFWaVTnXDY8FYinm7qCTthr2Egjkgi0xnidPYNBg36JjnlGa7z5thoS9nXRoU2LtJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776472154; c=relaxed/simple;
	bh=RpwUVID6SpkO3IsmnEnDBYcyp2Gv/YpT+QjoGbZCdF4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hOgwOnRIK2kLCyUpOITPAe/AJZluwNKUKRg2W2NeXE98kddKDZCVp9bJJAF1H60sTNuFHTc0UphCE8Bae6fiPoxZAKbPOMVi4I+xQjwp4czOITuWdS7pIqkf2fd9AICMSmBvnYv6WBr7useMf+CHrCB2asxSuQPY4MXG5ecBqSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=sKX3T5s7; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=MR3CW1Kv; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=YeEAFfVe reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HLfFLn1585196;
	Fri, 17 Apr 2026 17:28:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=RpwUVID6SpkO3IsmnEnDBYcyp2Gv/YpT+QjoGbZCdF4=; b=
	sKX3T5s7P1qaWRsmHF3ruP9mIYPfmmuoKQYSS2IS+OYdKB1TuDhYYDZQCxprzBGG
	4zWzCIq8QzyZZuHh5KTSRxOD1OflZ4CVK+h10UOoBcC40VPR5eZEt1agB4hXgZxG
	ltKfBPlTqDCe1k29RKUI4G2JJDJdEXm5WBQx01F6ccng+Ot3M0nTqQ/I0TJslXcY
	YmAtXpI+QekOR63XwWTW7gvapS7Qk18in2I+NrJXsT4c3vRChdkHYmCHuh1H1xfw
	kytIv5RDjYLXnfwPJArAI0gn+lIyONwYpiBe9FT+9a3EGxmKm1GrbTJo/2CUk2zv
	Hpi/h47DeBCK/R4GtkKnew==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4dkrdgj06n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Apr 2026 17:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1776472111; bh=RpwUVID6SpkO3IsmnEnDBYcyp2Gv/YpT+QjoGbZCdF4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=MR3CW1KvkuMU8IZ3mPh21oza4oSx/vrEdfb+y9J9Hx5+mxL3UpwTQihtCWbJSkPLc
	 F4fFmSLnuwirTwowtEbUy7TbKDHVwAExy5mI+GurRbCF7RfcjzSHqOVPMAL1v+Ltq7
	 C24ssNgTWgKYpgotXEfWEu/wAN3rmjo303O8TyKWaqPXmpg2KjSDscJlwE+DukG6j7
	 8y4/A/YboxhIB2YHnZVmifLJ9fXJU63s35BzL0qNXcJmXd/F4JFbUvUuSGeJKsqMzN
	 mSakk36YMmZhP4FTuiru24rvQ/+mCbXW5rLVJIckKYjUpiH9+JomPe1HWcDqRygpUp
	 R0E73dd256GkQ==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 05E7040346;
	Sat, 18 Apr 2026 00:28:31 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 9D509A00A9;
	Sat, 18 Apr 2026 00:28:30 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=YeEAFfVe;
	dkim-atps=neutral
Received: from DM5PR08CU004.outbound.protection.outlook.com (mail-dm5pr08cu00402.outbound.protection.outlook.com [40.93.13.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5104940818;
	Sat, 18 Apr 2026 00:28:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mG7VTK6R2jwu4S/oqsF4aLDh+NJOkVnEPgiToo1yyod0CnlbzANyhUxqfSIxf99gpLyMOznUc3odfmmddmoTJxNqVcei7KA+3T9ZUuT81kpE+bmh28kAMwvxtCK5+B2ySBV7y/yDWsKV1Ownkm1iAWEKPXrUkQBFqk+Mk/d7kdrQIk2LV101I5ik8P+IJxOOjvKvYye8yNGYIT5kYfQCdzmV9YnCSvdcRWdvHts2LTWsiKpIt8MbpsxSjU2XmoqC7CTKNqgAbOW1EmJHBu4ArLocijbhFrwyMM3uzZbzM5LKOv0urK8BsYHq8qcAu4oWk0VFZBHJDLj4xXq1rmHikg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpwUVID6SpkO3IsmnEnDBYcyp2Gv/YpT+QjoGbZCdF4=;
 b=T4egLWadVvFxMsBsrliTcwCSWJdTdd/Y9cT0wozaWWXh1gr3MpZSS9XxxcygU0G8OSffBK4dTuGKrheP8vwcEaEnC62UoZel1S15FJxcmCmOKZYllSeQi4ZLqgsKFXMH8Sh5CmzS6R+O+Cu6Qhxg6jC9K7dj2xq0UbabHOfAUBhExdMkmyxiVTGdBFwVbPGfLSIl+PJ8Bj6wTuHuMYsg0bhrh6E4D6GSMkfQZphjjBPW0rv4HFpdRouUbXrX3P8c0qOZfHbORkbNVfYvY0+6kvuA44juZoT+TLWJLEVtbg/F48zHS0mDGdx9tZoXjgUSCFelvP7+ph9xCDYXxzNK7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpwUVID6SpkO3IsmnEnDBYcyp2Gv/YpT+QjoGbZCdF4=;
 b=YeEAFfVek+bTbWteHs/uiG44L+Zn+nROkMsUqGH+ZifY3xO50r7FG2fogh4sEXCmMoEyV3FvDobb/C7BUo+mau7Zn3Tn98aSCik8sF65xHbhEPuM1o3Os09psmlq43HzPZSnen+KQHAoma00it9R+4yi03S51wV1sBOCcAFgpEk=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS5PPF8B1E59479.namprd12.prod.outlook.com (2603:10b6:f:fc00::659) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.41; Sat, 18 Apr
 2026 00:28:26 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9818.023; Sat, 18 Apr 2026
 00:28:26 +0000
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
Subject: Re: [PATCH v2 4/4] usb: dwc3: xilinx: Add support to program MMI USB
 TX deemphasis
Thread-Topic: [PATCH v2 4/4] usb: dwc3: xilinx: Add support to program MMI USB
 TX deemphasis
Thread-Index: AQHcwHfyHWUlWe9p8Um3cCUXqDWygLXkE5KA
Date: Sat, 18 Apr 2026 00:28:26 +0000
Message-ID: <20260418002819.noh6sd4smuierrf5@synopsys.com>
References: <20260330190304.1841593-1-radhey.shyam.pandey@amd.com>
 <20260330190304.1841593-5-radhey.shyam.pandey@amd.com>
In-Reply-To: <20260330190304.1841593-5-radhey.shyam.pandey@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS5PPF8B1E59479:EE_
x-ms-office365-filtering-correlation-id: aa189c67-f012-4a96-d3b3-08de9ce1683f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 ljONYKgD+YAN0yMnwP7dyVHcz+6u6iaUQTdbjwG1uax3tuZtmBU/7xiS7EeJFCCUokJA7s6S8bXDSbSejmKBefL/YKZ78n6qKDjIwREV+gGR+67HCj13mXxgDqWk3njh2XSf7aIGoAcTi3O1ibPKxA8zg7gPquAkc8haeFYjSxIDCjeH2yvWyJJCtFnp7571upxgFKhU982J+NTkRxidYcVgvVUddzvbZEaid94Lgw+5cVMMKTrf7aJxR9x3ltW/I8bdBaMu17uQuassMqnR9H7i/oSyFsJh/wX6gznJFKrSbBmD+VhvmZ14/uuEaGHErW8/idBRYnxCwFUSvdtXv6MePxFl7Ihm1l4PfzHRGPl1+2cLnEBYWfBiypEr0922xDCXhAfQuKChnQNhkTjAkeimNFfoQU5id6rMajrdOxL3HwWIa1AwxmFCCJHBdCQO04uyz2Vk2Fr1xFfYLwb6dOm3hznTHm7NWuopiQlYoVvemRQfR2CqIQTZshA2iaErfW6tnXAKBY34KRb98iB6WlpvJAzsDLjytAJxGvRfO9Yzwn8HGtSbLjYhJExkguXnEuz3yP1MaXtPpzeI3HFhe/hCbgkReBvXogCnEaZuy5ROOL8aQrgNrQqVYMmyS5uhOHm+1sbxVd3XHJvqGD1fIIoP019U98t4I3yzbWSfOQT7fIf7pptuo2ePmg1wiG/78We59xMy1BKBkhJB5dgR03BDAqwVCGW1PTYo4sTGZTkIWXGq3xb2MTOH+1nxKFbccq8IKfHgk1jUsaQ6XSoCIDjK9CJqeQCBHXJdIlzM+eA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VzY1eFA1NHN6Z2MyOWVEK3k3bnRxaWNHQnZyaFJndHlTRmVXdVNLdjZPZnJ4?=
 =?utf-8?B?QS9SNDVrOTVRaVI1L1dTN3NxRHZEVGdNRmNicHJDNGllK3RhYzZIbStyd0Ny?=
 =?utf-8?B?MzNUY2FtK3lKK01VZFJnODNVdUJkL2tOT0RZNS9iRUZzcEJqTklJcDlSNW53?=
 =?utf-8?B?YlVsTmF4UEExWnMxc2dURGROWUJ2T2M2Y0VYbFZmd0p0SVBjN0h2VzF1Z2th?=
 =?utf-8?B?a1JPanQvVm1tSkdvSU1xczQ3ZVZtSUQ4c2duODNQWWdjcTdUYTQwWlhqNHgx?=
 =?utf-8?B?N2hHTXh4L1kwYmZMVU55cU9zT1JaVjI3NU1CUHg3anNERlRuRm81RGtMWHlp?=
 =?utf-8?B?aXpOYzZlUEt1ODNtMnVSSlZESSszM2ozZUUvV3lmTklYQzNadVZoZ3Q2Ly9S?=
 =?utf-8?B?eUc1ZUJTa0NPQUlOWHdQZG9kOS9uWnNNODFmbFdKelRGWTExMTM1MVRESEVz?=
 =?utf-8?B?UU5DelQrSHg2eTdTTll6NnViNzNLQWFoNUtzMXpJcjVYYWRuYVprYTBQTGhL?=
 =?utf-8?B?UGRvdHcvLzVUVUNSTFZ1TGJxTjJNRW41SG5SZkw2QVhyU0V0Zm9scTZnZnUx?=
 =?utf-8?B?YWlyYjllQ1VuMmtXUWhZYmthVG9OYmhIbWg0U0JXZG5xN2Uyb1l2T003eHNk?=
 =?utf-8?B?cTdNOGRJekhVQW1ieXpzMnNkMG1QSW4zd0hpMmY2Y0Z6ZnZKUFIvem9wRlF1?=
 =?utf-8?B?RlVlUmIwL1QzcDZsMVBQVUdKeGw3Y3IxTkJOWURVQXMwMEg5R3pnaWxWL1Y4?=
 =?utf-8?B?QURUaXo2ZHpsT0d4UUNLVktsMFJRa2p4TlEya25ZUjhHZ1RKK1h5ZStSaVRp?=
 =?utf-8?B?NXd6d1dINVgxVUg0THVQREhRWWw3bVN6RGI4aSszaXZyd0ExSkIwamw4MGxK?=
 =?utf-8?B?RkFRWitmdnZFUnJ6VEREMXF2clFyVjFwWjVXK0FuUmZnNVZOczAvL0RnUXZl?=
 =?utf-8?B?Zy92U1hzMjMvaUU3SDVhNWxoQWFNdmJrU08rMjMvUXhORy9DdGJDdW8rWmZZ?=
 =?utf-8?B?K21qVmgxVVR0OXNRMXU2dm1HK0s3SzV0cWNOeUN2L0FJTFRIKzMxYW9vemJS?=
 =?utf-8?B?QXlLMGZ3UU5TVmNnWE5HcmhKdU4ydXF4TU5WTnBvZU9XbGpKVXBuUzJmbGZM?=
 =?utf-8?B?eVh5cVFjem44WUZ5MG9TM0dJd3YyV0tnbWkrbFJKMXFPYTQxL2JBV3U3RjNF?=
 =?utf-8?B?N3YyM0V0cnM3YTBnNjlJZnVtQ2JYVjVmVVlJMDh4M2p2S0tRMGo4NDRpYkpS?=
 =?utf-8?B?L0piMW9Qdm1OcFE5M3VSZ0ZvaWRDUTQ0eG9CblI5SE5RYzJicU5wU2ZQTU4x?=
 =?utf-8?B?eGlLeU52MXk0WTJvMVlCUFMzYmpveGoyQk4yT3k2eWdDeDc0ckloZldiOFB1?=
 =?utf-8?B?NEF0YkM5U1FvRU5OV2ZZL3BNYzN0WUJuWlNyYmVnaWlkVFpzWWxoYTZscy9s?=
 =?utf-8?B?ZUVKSUtNU21SeGpxaUd5WUs1Wmh3aVpsWU54bm5uaWVwb1FLZHkvZWFVYjcz?=
 =?utf-8?B?YWI3WEc1TGNXZWJsdHVuUlM5Skw5U3JncjlHWDVlM043SDRYcTZGNGFtK0Zy?=
 =?utf-8?B?ZGpacURmenYycVU4RW5yTXU1WEt1Y3lvSDkwU2lxSUtmSVVpWWsyMDJCWm0r?=
 =?utf-8?B?amRYcTdJTUpieDNDb2dHejBqcStYbUpkNmt3eURCMVc1WTcxTStJSkdKWXNU?=
 =?utf-8?B?MS9QK2JjQTJVOXdIMHduSTVuQUoyeUtNTENTdEt4SkNrV0w1SDMydnU3ZGtK?=
 =?utf-8?B?WGZhem05WHJZSG9SdHNNdE5EMXgrUWZyUUxMTW5La1FkYmNzMzJWZEU2VkpG?=
 =?utf-8?B?Sjh3ZFRUQWh0WlpJUk4rZXNxd2N3SUd4Mm9VZStNNElLNVlkOGpnbnhROWFC?=
 =?utf-8?B?TzQvZjBlK1ZuV2c1b3RuNXR2QmxkbWFRY0ZhM1QvNWNWRkhOMlNIa0x1SlZw?=
 =?utf-8?B?LzhyTkViOFdaM0VaRUtrVndUbEJDUk9KWi9EajJYMWlEMjZmT1h6Q0NiZTVM?=
 =?utf-8?B?VytVdDM2TFBOdnp1S0MvaWJqY0dwQ1hqMFJobXBubnhYRXBpSDZGNDZJMktD?=
 =?utf-8?B?cDJwREdxZUh4dVA3ZU5sSWc0VkN5M20vMnJCenh1N092WklaZi9GZTlUV3Jq?=
 =?utf-8?B?ZlpLdXhNeGhIMmxjY0lBclZZczBiSk9Db080ZHNQeTU4cDd0cGtKOUdEWm83?=
 =?utf-8?B?ZU1ZZ3dUQUgzTTlMN3Y3Q2ltSHBVVThzdlhnSnpiKzF6dUlwSUY3ZlpGckl5?=
 =?utf-8?B?czl3RFd1R3hqa000bWwzZllSdEJ2K2c3T1RralBZQlBHb0lleE5waEd3cDkz?=
 =?utf-8?B?OXRiS01uTnZDc3F6S3Rjd0tiQTdzNFFweGtlQUJQL3FHaml6eXJnQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1BB597DCA4DC93448F6F7AE7F0920740@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	qiRPXXunso73NtYsJcZ+00ODu23Ab1DolUYcQVf3etBlK+gdWbRpmvMrllPPPeybpH6LbNRmXrqXnwzOjOaBonALQKzUnzkq+qTDnc9/q4h1HVF4kDljV80iG83JxrYj1FRBiQOQubl+Mu0kTTUB+dKwoxDOf0VW+f1dOd3XafdRRB/x/PNIjPIbUxlz6Q8Qw8wItgnN7s2omb3wpWlAVBsac333INC0Xgi3GK85pPXB/u1VnCvv6a+gxiLTyVQVWwlerOBBpoDD8yrSDaDqGx/z3AuKcXwgXLzW5nHA42aEboF8NVS/ZMrS+OH1q+a/Qn+MW4NP139x8BdFxu3QUg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hL+weIUSflGT2OTRZHK5xW5jle/fEKUBMRAzb/4+nsaXNMsqwhX6f/WsEHa6h7cd0HGJriO+lKX/x/+NIsZlcACCmbkdDNzAim6B/ricrjPEMJYpipTXm8bQewP0jYqAwnz6jJmzJ1P6DxsoheT4IUVBl8T4u8SUQU7UzGKmC537OxtkAvdUmzsDI0fsj+x5uqO3022+TJhNQxAEQBN8IH6hoUBG4ys63yesHCZtZpvkffYtsBoSomJ0amZEpns637V20MHF/uBMHXp0tJBhO4Xa/ClkRoTB7A7gKMiTsATgoIa8trbrdcZ0pNEN2/eAacfPGMa3/j5WHboAPBmQhth9Jnwu8bwRyc34sqmeLTuo2akuCAG51sQ1m87O1TEdXQJNGhOS80meSS1nMSE2j+PnuNJq6Z2tb74CQiw1Lp1yt6Q7HQqqrqrOCCMlorr4v4RiA+oXU4mPE+TvopllWTdCqmkxgxNJxjx0DPjdRRtDf92jAROdhFVLUCnJgaUkmCkTgwqQovTI39s/cc0NILKWbGWtBklfb6wDkyO6DRk6ZzYJoY1vDVb+Vp+qyjViMJOJwtvDjN2KSlqK7DwCk0V6YGtKhGdXDO+Ovmgh0C7DL9MVaAGblZdc7AUWZSp49jn5I1mCpd4+1Nv2bRmb9A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa189c67-f012-4a96-d3b3-08de9ce1683f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2026 00:28:26.3437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FMnShbh0xKrLhCTLrISREsLFOMIIXRxdWUknJgr+PWf9trPuFXEk1urV8bJGYbrC6WY6zf2V7naSRpHDfRaU3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF8B1E59479
X-Authority-Analysis: v=2.4 cv=GptyPE1C c=1 sm=1 tr=0 ts=69e2d02f cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=zd2uoN0lAAAA:8 a=L2fQkmWq4GwRT8lHDsMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: NNQJWqpmTlq9V79SvRRU-CyJZ5YrEf5x
X-Proofpoint-GUID: NNQJWqpmTlq9V79SvRRU-CyJZ5YrEf5x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDAwMyBTYWx0ZWRfX1WKg7O9L+C++
 wdocxfhlkJhsYSjatuRq/WcXLLaM6V/Al9cbOTbDzlgr8m5yZmX9un4KYiU7oNKmlgqf1uP6DzV
 AKcfp//iDRYDpjygH+vEWn8MigktihIJXreVgPGNFMLzML82cciJ2//FvB2udQ7L7xepOG/RhQD
 T5g8ppCovJxAoTNYa6mPIEu0iX9igZNAD6l2pqWKrPzsdnww9yQ2Mytq3cuqEb3EiFrknDH4Kqh
 W+K7AU8j8D3+Qgkf1rwZQq2HnvQUbKf9k85xBqPPMQbQYPkPV39cxfVly/sz3XH+iU4sqrojb8s
 ARfTYHPC/v/O4cmrplpGBED6E66E35XkF+0oHpCKv00VXJrWSm2mJkyLg6kMj0/eP4CP6+zWyXq
 rf4MDKOSbOv4GaCiY63qExj9hyp0RrnE+7IIY1112Wk/GVV1zy7D/24FVP5lbNXGN/RhkmCVgpl
 5bOKsRDAXvyVnQDObJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 classifier=typeunknown
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
	TAGGED_FROM(0.00)[bounces-36302-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[synopsys.com:dkim,synopsys.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 204A941F738
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCBNYXIgMzEsIDIwMjYsIFJhZGhleSBTaHlhbSBQYW5kZXkgd3JvdGU6DQo+IEludHJv
ZHVjZXMgc3VwcG9ydCBmb3IgcHJvZ3JhbW1pbmcgdGhlIDE4LWJpdCBUWCBEZWVtcGhhc2lzIHZh
bHVlIHRoYXQNCj4gZHJpdmVzIHRoZSBwaXBlX1R4RGVlbXBoIHNpZ25hbCwgYXMgZGVmaW5lZCBp
biB0aGUgUElQRTQgc3BlY2lmaWNhdGlvbi4NCj4gDQo+IFRoZSBjb25maWd1cmVkIHZhbHVlIGlz
IHJlY29tbWVuZGVkIGJ5IFN5bm9wc3lzIGFuZCBpcyBpbnRlbmRlZCBmb3INCj4gc3RhbmRhcmQg
KG5vbi1jb21wbGlhbmNlKSBvcGVyYXRpb24uIFRoZXNlIEdlbjIgZXF1YWxpemF0aW9uIHNldHRp
bmdzDQo+IGhhdmUgYmVlbiB2YWxpZGF0ZWQgdGhyb3VnaCBib3RoIGludGVybmFsIGFuZCBleHRl
cm5hbCBjb21wbGlhbmNlDQo+IHRlc3RpbmcuIEJ5IGFwcGx5aW5nIHRoaXMgc2V0dGluZywgdGhl
IHN0YWJpbGl0eSBvZiBVU0IgMy4yIGVudW1lcmF0aW9uDQo+IGlzIGltcHJvdmVkIGFuZCBub3cg
U3VwZXJTcGVlZFBsdXMgZGV2aWNlcyBhcmUgY29uc2lzdGVudGx5IHJlY29nbml6ZWQgYXMNCj4g
VVNCIDMuMiBHZW4gMiBieSB0aGUgTU1JIFVTQiBIb3N0IGNvbnRyb2xsZXIuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBSYWRoZXkgU2h5YW0gUGFuZGV5IDxyYWRoZXkuc2h5YW0ucGFuZGV5QGFtZC5j
b20+DQo+IC0tLQ0KPiBDaGFuZ2VzIGZvciB2MjoNCj4gLSBEb24ndCB1c2UgY29tcGF0aWJsZSBj
aGVjayBmb3IgZGVlbXBoYXNpcyBwcm9ncmFtbWluZy4NCj4gLSBSZW5hbWUgcHJvcGVydHkgInNu
cHMsbGNzcl90eF9kZWVtcGgiIHRvICJzbnBzLGxjc3ItdHgtZGVlbXBoIg0KPiAgIChoeXBoZW5z
IHBlciBrZXJuZWwgY29udmVudGlvbikuDQo+IC0gRml4IGRvdWJsZSBzcGFjZSBpbiBMQ1NSX1RY
X0RFRU1QSCByZWdpc3RlciBjb21tZW50Lg0KPiAtIEFkZCBibGFuayBsaW5lIGJldHdlZW4gcmVn
aXN0ZXIgb2Zmc2V0IGRlZmluZSBhbmQgIkJpdCBmaWVsZHMiIHNlY3Rpb24uDQo+IC0tLQ0KPiAg
ZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgICAgICAgIHwgMTcgKysrKysrKysrKysrKysrKysNCj4g
IGRyaXZlcnMvdXNiL2R3YzMvY29yZS5oICAgICAgICB8ICA4ICsrKysrKysrDQo+ICBkcml2ZXJz
L3VzYi9kd2MzL2R3YzMteGlsaW54LmMgfCAxNSArKysrKysrKysrKystLS0NCj4gIDMgZmlsZXMg
Y2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+
IGluZGV4IDE2MWE0ZDU4YjJjZS4uZTY3OGE1M2E5MGIzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L3VzYi9kd2MzL2NvcmUuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiBAQCAt
NjQ2LDYgKzY0NiwxNSBAQCBzdGF0aWMgdm9pZCBkd2MzX2NvbmZpZ19zb2NfYnVzKHN0cnVjdCBk
d2MzICpkd2MpDQo+ICAJCXJlZyB8PSBEV0MzX0dTQlVTQ0ZHMF9SRVFJTkZPKGR3Yy0+Z3NidXNj
ZmcwX3JlcWluZm8pOw0KPiAgCQlkd2MzX3dyaXRlbChkd2MsIERXQzNfR1NCVVNDRkcwLCByZWcp
Ow0KPiAgCX0NCj4gKw0KPiArCWlmIChkd2MtPmNzcl90eF9kZWVtcGhfZmllbGRfMSAhPSBEV0Mz
X0xDU1JfVFhfREVFTVBIX1VOU1BFQ0lGSUVEKSB7DQo+ICsJCXUzMiByZWc7DQo+ICsNCj4gKwkJ
cmVnID0gZHdjM19yZWFkbChkd2MsIERXQzNfTENTUl9UWF9ERUVNUEgpOw0KPiArCQlyZWcgJj0g
fkRXQzNfTENTUl9UWF9ERUVNUEhfTUFTSyh+MCk7DQo+ICsJCXJlZyB8PSBEV0MzX0xDU1JfVFhf
REVFTVBIX01BU0soZHdjLT5jc3JfdHhfZGVlbXBoX2ZpZWxkXzEpOw0KPiArCQlkd2MzX3dyaXRl
bChkd2MsIERXQzNfTENTUl9UWF9ERUVNUEgsIHJlZyk7DQo+ICsJfQ0KPiAgfQ0KPiAgDQo+ICBz
dGF0aWMgaW50IGR3YzNfY29yZV91bHBpX2luaXQoc3RydWN0IGR3YzMgKmR3YykNCj4gQEAgLTE2
NzEsMTEgKzE2ODAsMTMgQEAgc3RhdGljIHZvaWQgZHdjM19jb3JlX2V4aXRfbW9kZShzdHJ1Y3Qg
ZHdjMyAqZHdjKQ0KPiAgc3RhdGljIHZvaWQgZHdjM19nZXRfc29mdHdhcmVfcHJvcGVydGllcyhz
dHJ1Y3QgZHdjMyAqZHdjLA0KPiAgCQkJCQkgY29uc3Qgc3RydWN0IGR3YzNfcHJvcGVydGllcyAq
cHJvcGVydGllcykNCj4gIHsNCj4gKwl1MzIgY3NyX3R4X2RlZW1waF9maWVsZF8xOw0KPiAgCXN0
cnVjdCBkZXZpY2UgKnRtcGRldjsNCj4gIAl1MTYgZ3NidXNjZmcwX3JlcWluZm87DQo+ICAJaW50
IHJldDsNCj4gIA0KPiAgCWR3Yy0+Z3NidXNjZmcwX3JlcWluZm8gPSBEV0MzX0dTQlVTQ0ZHMF9S
RVFJTkZPX1VOU1BFQ0lGSUVEOw0KPiArCWR3Yy0+Y3NyX3R4X2RlZW1waF9maWVsZF8xID0gRFdD
M19MQ1NSX1RYX0RFRU1QSF9VTlNQRUNJRklFRDsNCj4gIA0KPiAgCWlmIChwcm9wZXJ0aWVzLT5n
c2J1c2NmZzBfcmVxaW5mbyAhPQ0KPiAgCSAgICBEV0MzX0dTQlVTQ0ZHMF9SRVFJTkZPX1VOU1BF
Q0lGSUVEKSB7DQo+IEBAIC0xNjkzLDYgKzE3MDQsMTIgQEAgc3RhdGljIHZvaWQgZHdjM19nZXRf
c29mdHdhcmVfcHJvcGVydGllcyhzdHJ1Y3QgZHdjMyAqZHdjLA0KPiAgCQkJCQkgICAgICAgJmdz
YnVzY2ZnMF9yZXFpbmZvKTsNCj4gIAkJaWYgKCFyZXQpDQo+ICAJCQlkd2MtPmdzYnVzY2ZnMF9y
ZXFpbmZvID0gZ3NidXNjZmcwX3JlcWluZm87DQo+ICsNCj4gKwkJcmV0ID0gZGV2aWNlX3Byb3Bl
cnR5X3JlYWRfdTMyKHRtcGRldiwNCj4gKwkJCQkJICAgICAgICJzbnBzLGxjc3ItdHgtZGVlbXBo
IiwNCj4gKwkJCQkJICAgICAgICZjc3JfdHhfZGVlbXBoX2ZpZWxkXzEpOw0KPiArCQlpZiAoIXJl
dCkNCj4gKwkJCWR3Yy0+Y3NyX3R4X2RlZW1waF9maWVsZF8xID0gY3NyX3R4X2RlZW1waF9maWVs
ZF8xOw0KPiAgCX0NCj4gIH0NCj4gIA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9j
b3JlLmggYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiBpbmRleCBhMzViM2RiMWY5ZjMuLjk5
ODc0YWQwOTczMCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gKysr
IGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gQEAgLTE4MSw2ICsxODEsOCBAQA0KPiAgDQo+
ICAjZGVmaW5lIERXQzNfTExVQ1RMKG4pCQkoMHhkMDI0ICsgKChuKSAqIDB4ODApKQ0KPiAgDQo+
ICsjZGVmaW5lIERXQzNfTENTUl9UWF9ERUVNUEgJMHhkMDYwDQo+ICsNCg0KVGhpcyBzaG91bGQg
YmUgRFdDM19MQ1NSX1RYX0RFRU1QSChuKSB3aGVyZSBuIGlzIHRoZSBVU0IzIHBvcnQgbnVtYmVy
DQoNCj4gIC8qIEJpdCBmaWVsZHMgKi8NCj4gIA0KPiAgLyogR2xvYmFsIFNvQyBCdXMgQ29uZmln
dXJhdGlvbiBJTkNSeCBSZWdpc3RlciAwICovDQo+IEBAIC0xOTgsNiArMjAwLDEwIEBADQo+ICAj
ZGVmaW5lIERXQzNfR1NCVVNDRkcwX1JFUUlORk8obikJKCgobikgJiAweGZmZmYpIDw8IDE2KQ0K
PiAgI2RlZmluZSBEV0MzX0dTQlVTQ0ZHMF9SRVFJTkZPX1VOU1BFQ0lGSUVECTB4ZmZmZmZmZmYN
Cj4gIA0KPiArLyogTENTUl9UWF9ERUVNUEggUmVnaXN0ZXI6IHNldHRpbmcgVFggZGVlbXBoYXNp
cyB1c2VkIGluIG5vcm1hbCBvcGVyYXRpb24gaW4gZ2VuMiAqLw0KPiArI2RlZmluZSBEV0MzX0xD
U1JfVFhfREVFTVBIX01BU0sobikJCSgobikgJiAweDNmZmZmKQ0KPiArI2RlZmluZSBEV0MzX0xD
U1JfVFhfREVFTVBIX1VOU1BFQ0lGSUVECQkweGZmZmZmZmZmDQo+ICsNCj4gIC8qIEdsb2JhbCBE
ZWJ1ZyBMU1AgTVVYIFNlbGVjdCAqLw0KPiAgI2RlZmluZSBEV0MzX0dEQkdMU1BNVVhfRU5EQkMJ
CUJJVCgxNSkJLyogSG9zdCBvbmx5ICovDQo+ICAjZGVmaW5lIERXQzNfR0RCR0xTUE1VWF9IT1NU
U0VMRUNUKG4pCSgobikgJiAweDNmZmYpDQo+IEBAIC0xMTgwLDYgKzExODYsNyBAQCBzdHJ1Y3Qg
ZHdjM19nbHVlX29wcyB7DQo+ICAgKiBAd2FrZXVwX3BlbmRpbmdfZnVuY3M6IEluZGljYXRlcyB3
aGV0aGVyIGFueSBpbnRlcmZhY2UgaGFzIHJlcXVlc3RlZCBmb3INCj4gICAqCQkJIGZ1bmN0aW9u
IHdha2V1cCBpbiBiaXRtYXAgZm9ybWF0IHdoZXJlIGJpdCBwb3NpdGlvbg0KPiAgICoJCQkgcmVw
cmVzZW50cyBpbnRlcmZhY2VfaWQuDQo+ICsgKiBAY3NyX3R4X2RlZW1waF9maWVsZF8xOiBzdG9y
ZXMgVFggZGVlbXBoYXNpcyB1c2VkIGluIEdlbjIgb3BlcmF0aW9uLg0KDQpIb3cgZG8geW91IHBs
YW4gdG8gYXBwbHkgdGhpcyBmb3IgdGhlIGNhc2Ugb2YgbXVsdGlwbGUgVVNCMyBwb3J0cy4gT25s
eQ0KdG8gdGhlIGZpcnN0IFVTQjMgcG9ydDAgb3IgYWxsIG9mIHRoZW0/IERvY3VtZW50IGhvdyB5
b3Ugd2FudCB0byBoYW5kbGUNCnRoaXMuDQoNCj4gICAqLw0KPiAgc3RydWN0IGR3YzMgew0KPiAg
CXN0cnVjdCB3b3JrX3N0cnVjdAlkcmRfd29yazsNCj4gQEAgLTE0MTcsNiArMTQyNCw3IEBAIHN0
cnVjdCBkd2MzIHsNCj4gIAlzdHJ1Y3QgZGVudHJ5CQkqZGVidWdfcm9vdDsNCj4gIAl1MzIJCQln
c2J1c2NmZzBfcmVxaW5mbzsNCj4gIAl1MzIJCQl3YWtldXBfcGVuZGluZ19mdW5jczsNCj4gKwl1
MzIJCQljc3JfdHhfZGVlbXBoX2ZpZWxkXzE7DQo+ICB9Ow0KPiAgDQo+ICAjZGVmaW5lIElOQ1JY
X0JVUlNUX01PREUgMA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlu
eC5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jDQo+IGluZGV4IGYyZGVlMjhiZGM2
NS4uNDQwMDg4NTZlZTczIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMteGls
aW54LmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jDQo+IEBAIC00MSwx
MSArNDEsMTMgQEANCj4gICNkZWZpbmUgUElQRV9DTEtfU0VMRUNUCQkJCTANCj4gICNkZWZpbmUg
WExOWF9VU0JfRlBEX1BPV0VSX1BSU05UCQkweDgwDQo+ICAjZGVmaW5lIEZQRF9QT1dFUl9QUlNO
VF9PUFRJT04JCQlCSVQoMCkNCj4gKyNkZWZpbmUgWExOWF9NTUlfVVNCX1RYX0RFRU1QSF9ERUYJ
CTB4OGM0NQ0KPiAgDQo+ICBzdHJ1Y3QgZHdjM194bG54Ow0KPiAgDQo+ICBzdHJ1Y3QgZHdjM194
bG54X2NvbmZpZyB7DQo+ICAJaW50CQkJCSgqcGx0Zm1faW5pdCkoc3RydWN0IGR3YzNfeGxueCAq
ZGF0YSk7DQo+ICsJdTMyCQkJCXR4X2RlZW1waDsNCj4gIAlib29sCQkJCW1hcF9yZXNvdXJjZTsN
Cj4gIH07DQo+ICANCj4gQEAgLTI4NCw2ICsyODYsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGR3
YzNfeGxueF9jb25maWcgdmVyc2FsX2NvbmZpZyA9IHsNCj4gIA0KPiAgc3RhdGljIGNvbnN0IHN0
cnVjdCBkd2MzX3hsbnhfY29uZmlnIHZlcnNhbDJfY29uZmlnID0gew0KPiAgCS5wbHRmbV9pbml0
ID0gZHdjM194bG54X2luaXRfdmVyc2FsMiwNCj4gKwkudHhfZGVlbXBoID0gWExOWF9NTUlfVVNC
X1RYX0RFRU1QSF9ERUYsDQo+ICB9Ow0KPiAgDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCBkd2MzX3hsbnhfb2ZfbWF0Y2hbXSA9IHsNCj4gQEAgLTMwMywxMCArMzA2LDEyIEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGR3YzNfeGxueF9vZl9tYXRjaFtdID0g
ew0KPiAgfTsNCj4gIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIGR3YzNfeGxueF9vZl9tYXRjaCk7
DQo+ICANCj4gLXN0YXRpYyBpbnQgZHdjM19zZXRfc3dub2RlKHN0cnVjdCBkZXZpY2UgKmRldikN
Cj4gK3N0YXRpYyBpbnQgZHdjM19zZXRfc3dub2RlKHN0cnVjdCBkd2MzX3hsbnggKnByaXZfZGF0
YSkNCj4gIHsNCj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBwcml2X2RhdGEtPmRldjsNCj4gKwlj
b25zdCBzdHJ1Y3QgZHdjM194bG54X2NvbmZpZyAqY29uZmlnID0gcHJpdl9kYXRhLT5kd2MzX2Nv
bmZpZzsNCj4gIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gZGV2LT5vZl9ub2RlLCAqZHdjM19u
cDsNCj4gLQlzdHJ1Y3QgcHJvcGVydHlfZW50cnkgcHJvcHNbMl07DQo+ICsJc3RydWN0IHByb3Bl
cnR5X2VudHJ5IHByb3BzWzNdOw0KPiAgCWludCBwcm9wX2lkeCA9IDAsIHJldCA9IDA7DQo+ICAN
Cj4gIAlkd2MzX25wID0gb2ZfZ2V0X2NvbXBhdGlibGVfY2hpbGQobnAsICJzbnBzLGR3YzMiKTsN
Cj4gQEAgLTMyMCw2ICszMjUsMTAgQEAgc3RhdGljIGludCBkd2MzX3NldF9zd25vZGUoc3RydWN0
IGRldmljZSAqZGV2KQ0KPiAgCWlmIChvZl9kbWFfaXNfY29oZXJlbnQoZHdjM19ucCkpDQo+ICAJ
CXByb3BzW3Byb3BfaWR4KytdID0gUFJPUEVSVFlfRU5UUllfVTE2KCJzbnBzLGdzYnVzY2ZnMC1y
ZXFpbmZvIiwNCj4gIAkJCQkJCSAgICAgICAweGZmZmYpOw0KPiArCWlmIChjb25maWctPnR4X2Rl
ZW1waCkNCg0KV2Ugc2hvdWxkIHNldCB0aGUgdHhfZGVlbXBoIHRvIHRoZSBEV0MzX0xDU1JfVFhf
REVFTVBIX1VOU1BFQ0lGSUVEIGJ5DQpkZWZhdWx0IGFuZCBjaGVjayBhZ2FpbnN0IHRoYXQgaW5z
dGVhZC4NCg0KPiArCQlwcm9wc1twcm9wX2lkeCsrXSA9IFBST1BFUlRZX0VOVFJZX1UzMigic25w
cyxsY3NyLXR4LWRlZW1waCIsDQo+ICsJCQkJCQkgICAgICAgY29uZmlnLT50eF9kZWVtcGgpOw0K
PiArDQo+ICAJb2Zfbm9kZV9wdXQoZHdjM19ucCk7DQo+ICANCj4gIAlpZiAocHJvcF9pZHgpDQo+
IEBAIC0zNjgsNyArMzc3LDcgQEAgc3RhdGljIGludCBkd2MzX3hsbnhfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlpZiAocmV0KQ0KPiAgCQlnb3RvIGVycl9jbGtfcHV0
Ow0KPiAgDQo+IC0JcmV0ID0gZHdjM19zZXRfc3dub2RlKGRldik7DQo+ICsJcmV0ID0gZHdjM19z
ZXRfc3dub2RlKHByaXZfZGF0YSk7DQo+ICAJaWYgKHJldCkNCj4gIAkJZ290byBlcnJfY2xrX3B1
dDsNCj4gIA0KPiAtLSANCj4gMi40My4wDQo+IA0KDQpCUiwNClRoaW5o

