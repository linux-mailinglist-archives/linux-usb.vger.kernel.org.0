Return-Path: <linux-usb+bounces-7918-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3937087A4C3
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 10:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1D36282BB5
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 09:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672061C2AE;
	Wed, 13 Mar 2024 09:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RwbGyiNY";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LPIWDjYi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JKGzT9U6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5B518EB2
	for <linux-usb@vger.kernel.org>; Wed, 13 Mar 2024 09:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710321566; cv=fail; b=VPSKoOE1MS3arqhIr8f1FQPs4T6fsHPbDBhGl4f5+z79d7p5zeLI/UvzhlpSfzZwR/JCdkXovVzlYKwVOXXzMH7P9KAT2KnztAl6sKHNXDLd2ihw4GeibOWgDDLmwj7ZjM2SuhxpOdhFkjIGhOMfJx+87Gf54WHWabY+VssKzkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710321566; c=relaxed/simple;
	bh=0HoxpzlD+kWDvVlUkYa4F69ngn4GYmIY5+G4aLh5wRY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mBj3cSUjmatLv/WLwbutwb1M348tlPJNC2QtmCe5wq+6R15SkbmZFwc9JVouShm+JSdStnerAFluzE/Bpzin+AjVH5L01f+d4+t9MNERCofbhfHCId5penfUwgeg0cZFXJt0wVovpVzaRawb6vRebmK66hcuPRaZcBCZZYJyBQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=RwbGyiNY; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=LPIWDjYi; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JKGzT9U6 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42D8KYt5030579;
	Wed, 13 Mar 2024 02:19:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	pfptdkimsnps; bh=tqlwe2G9+DPHI/jA4kjejosuhzY3wfywuemNoLXewbw=; b=
	RwbGyiNYvK+NAzbYCxLKOs7ywprsnChkTFxiJdzzuugfOoliphtUzknK93hEA+5d
	qE5HRfRAUpGwU2b/5z7THSlYywBqRZx7/bVvHygvfFkzP7eKJDyOKYdCQVhrQ4CM
	JPH0hfsZuceDbO+Ma8Tou82YJb7a9CxOkKyIp/xdyYwi2QQvlKE7wwyb+ze3ynrq
	cFforgcAF7nwkwUI1F+2mQVjwhkNoca4Aw7BMWJ1Lbb4fY/fQbdcvKCYyNjC3eOh
	cxeg8XuY7JoY+/mjkSqnqIYFIKBMQl0Zi6mm6JWAeJ01Y7wK4miLIv/T7aTbv45d
	JKukXzNnN1MIa80V8MKL6g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3wtugxuhpx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 02:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1710321561; bh=0HoxpzlD+kWDvVlUkYa4F69ngn4GYmIY5+G4aLh5wRY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=LPIWDjYitkJ7wlYn1tKeU6vWpuiOCO3JlKGsV1BjdTxmtpr+7Opp9/2WLS4DO8EG+
	 SOPl66dkm9VYAa+ShpidY4XOnEZxLOwK0mV3vFdzIOSm/EuRv4+x6seQkB3w6dp+SU
	 YMyXGtr9njgnbtU75/mwSf33OX5riFENGQAwW6/ERBch2oPlosMricSKGOz2GyFQyu
	 TwrOVrU4hZ6J9eYMRqoaCd4eih+ulVxURCJ+JInGQqXxL0cw4eDsAqclGTAv4lzgoM
	 9z6ZvWDP+owI9VKyUoJ2RWUHed5g5T64XttH1rXUwdrpQZicczpcr7j6MgJYBp2P5r
	 kCluKckb+RcWA==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4B59440540;
	Wed, 13 Mar 2024 09:19:21 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 1CB65A009C;
	Wed, 13 Mar 2024 09:19:21 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=JKGzT9U6;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C7C7B4024D;
	Wed, 13 Mar 2024 09:19:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwfF66E87NlW/qzJ3vquzMfPbKDK4tCssMTJ0+pIPtEpkkID+wMGnda+D2n9BqkOrJvws5L4/XuQyou+NoDMdEgOScOm6LiZkXbn+RCb1tJPTdA0OcvxJZtsvYAngYt2zu6dWYvU848hVPBcWjrjXp5+I8yWaCeKAFcoFnUo5tMBdGb5r01WWoi+Nj6NYEqYVYhWlzrqC4fnoOk6/ePBXIwwqX4qwohYsDlgua8s1TCJUlacJ6SxJ1xZHwUEXHpLOfRBTR93kaJ65XQwGs5n5T+EPvfqRETtzP/rH2UDEmkCzCjGwNC6QIPfj2ONqYmj9csiTP5Rem3qqsxr1/qMQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqlwe2G9+DPHI/jA4kjejosuhzY3wfywuemNoLXewbw=;
 b=AnUa5q/XmQ4TQ3KIS70zr/g272nXeE27dKLeE/ElLfMm8BGcAXkBF+IkbcfqpcWwXd0ta88MnelUG9UCyrkf+XXBRD4BABk3gHAkm0hzs+OQ9wgVLflhWWK+bIPlPKokm12iTmYiw0i7pN1vmRC2ZQ1kIdROaF8OmLM+ZOPCYaUOqFpBTBohbXN/P+TaqwZbTlCYgO6sCxl+0CMSyJpzZhjpaI813f/wIgDFgPhc0Zco0ZIdZ9N89841KSWL0kxlyPozoD61ntnPsYSQmlwv+uJw/twhix5VbLFF50w1MSREPR+sqreXlTTQUf7aSAAwdngA0Zt8X8hbE7cCnbBCdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqlwe2G9+DPHI/jA4kjejosuhzY3wfywuemNoLXewbw=;
 b=JKGzT9U6ub5qJBcxwaoN6MEGtl+oX51KSfVnGfTIhKk1GYKtLbf6BwPudRby2WbHOPt0JzE4TehJGJLnE0VRc9zCt8/UFd+uU5rYzc78lZth2jCafeB5a24UjkiHfsBa+dTMJPpr3MtV1RTY3BkUwQyx4gmad2DI2z8AmJrTjP8=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by SN7PR12MB6910.namprd12.prod.outlook.com (2603:10b6:806:262::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Wed, 13 Mar
 2024 09:19:18 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b%6]) with mapi id 15.20.7362.036; Wed, 13 Mar 2024
 09:19:18 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: John Youn <John.Youn@synopsys.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH 2/7] usb: dwc2: New bit definition in GOTGCTL register
Thread-Topic: [PATCH 2/7] usb: dwc2: New bit definition in GOTGCTL register
Thread-Index: AQHadSeGz98tI0xjy0uHOpjoMhCQQA==
Date: Wed, 13 Mar 2024 09:19:18 +0000
Message-ID: 
 <21e4401895d586afa23c3fa3d3518bd4b7ebd4d5.1708948356.git.Minas.Harutyunyan@synopsys.com>
References: <cover.1708948356.git.Minas.Harutyunyan@synopsys.com>
In-Reply-To: <cover.1708948356.git.Minas.Harutyunyan@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|SN7PR12MB6910:EE_
x-ms-office365-filtering-correlation-id: 236775f3-675b-4e7c-2361-08dc433ea939
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 s6SFfh1iN3xNJ5n2JzFbz8FKke14qV0R4ipdBc3lxmidV/KRvCGdYK6uh371PzN2gPp+nLviexlgdx5KviZkRLlXoCI55UeJsJph+RM9hbxfWQpjtHJFjIkmTJ1rsEiL3fj3V8Bnt/JaHKDXwsxlrzD+EhievkyAc4/HAhaJ2BInVu5o/cMvJQ9NAj+0hUFkobMPIPJhk+AyNs3CCKBOI8U1fGInJO33HEOGdAsHv+i8TAJPXdEP7+lMdOBFRWx4X7E6Zajd2QXxvutM+sVciJDe1KL8MRWtLy9zXHB8BBFaiYpPVdEFgZDtLtxYgeJG7fFvj4pi7vvwhvJ503C/8ZRCD1hHT39kajswzyj1+/hrtdQ4UeSsBXNK4w6dUsToCKazJZ3nZv7Seg3rwjx/b/Y7CZe6rHrxiiwoVppHYKw1LCTi3vxQZPAN9fD9th5+A2N31e/jvzgBiEx/ncveaXmD7Se5lf0xeAG1ymaG5QlO1uVSsktRR/gxiB7vmfldt1x44XrA10FW62cIvAgdTO517yxH0YMqG2g7uac/3oSX/0YfItpDx5kXFfs+fPi+Dl8zLJ8FpvAzP12mO1pRfx3UNkqBHUV+JSSq1Yf/immb+9QIdggGaFHfA5+BN9D5yZqbkhJuRAAfReBUCQbHaT1dI7as7/6Zh4V0SH7slY84Muc6Krs5Sdq9JCVJP1TZ2HlelPPoNq8TCa2v86NgcA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?pjUUB0y3tfiZEjKRwX0fzPYHZiIjis60194w4DHfz2H0CGgEXrshhUfnGK?=
 =?iso-8859-1?Q?Mrc6wa+ASbPjK8W6DlVeqCmVuBML8wnX4ceJcDbGF2DHft9qWFAGF4uISk?=
 =?iso-8859-1?Q?vJ1G1P85k1F9NiqyQZueHynJUtLnlLblpsSw8lEw3o7H6bIExoabjjT2hS?=
 =?iso-8859-1?Q?X1dsvjCYk7R/6wjW1ebiwBYpek5qv2IuwInrlHz84olucSBfxey9YcZs5H?=
 =?iso-8859-1?Q?FC4JX4gn2YDSHTGI9mdVHCby0NdmUIi9Io5lvzD6YF4L44rGxEebDOVeZa?=
 =?iso-8859-1?Q?I3aosNpnK/PQCoKN9WSzAOIzlb+rmChOxiO115H2SzxuCpqvW2Da71Tl2C?=
 =?iso-8859-1?Q?Fo/nbfC5/w3EyncsRxGS2QdNg6FntASfLc1iY8CbL+1WRsDjTzy8ToFDfE?=
 =?iso-8859-1?Q?JuIB2QKXCW6KNm6HHpuKi8JaEurg0tJrYroRXpaTCrdcRvIzoxHp/rDrlM?=
 =?iso-8859-1?Q?mG4KTE/blMHqSgJro4Fchmo+UERtoMKy9ZLCENa/b5wzsdW0dXRSuZ9NXC?=
 =?iso-8859-1?Q?4u+BiQkSZmkgeY+gN801KN/upLH3/iw8p7dXAQJkUrfYWMKtGK8e1lVRTk?=
 =?iso-8859-1?Q?BjAtRLIsxyVQKPeUJOxUqa5PYzZ10XkX5I96mwjZKYGy+8HkAYQYcvya1L?=
 =?iso-8859-1?Q?mynuMF3PjqrIC10jgk/Zyq6Cr8mkK+DCmGeN77FLTUWOdFDfmAyEagKuYb?=
 =?iso-8859-1?Q?BSOfslLeE0fkvjA5BVXWX5jmI8UycmsVeW+7f2XoKeaTHmIkIcGALYMoD5?=
 =?iso-8859-1?Q?RpvDafjzEMrDGwO0Ht3p/NpG/bp0CFQUKvGH3TPMUfvEbDGe+lrX8EEphx?=
 =?iso-8859-1?Q?NMPvc+21H7bWGeFy2a5oyRHz3lZmIjLmc27kagtaJRF0pz1zQNKOuHcLL0?=
 =?iso-8859-1?Q?EPKnYhWgHo8wfzV5Id54rutVl68UXQa60yrwKF0mYWhMTCWxE7YYU+hTCY?=
 =?iso-8859-1?Q?PjAqbNoP6jcwAN040hZzkePzt5Y0RDNvgXTVArrE1HExG/uFYufuNRnXN5?=
 =?iso-8859-1?Q?THU+TFKrNGdTvXJTjeH06hh/KyGWQ9chqZEVOXqVPCoGK9SthY1U4jhMIt?=
 =?iso-8859-1?Q?vaDWtQvNjut/xDVCJ2qiEmOE6lpZy9zGC1aHy9IMF6tdBf9FMaPnn9VKw1?=
 =?iso-8859-1?Q?GW/fEbqDZ2y+Hmtyt1RIL+9QLMcmMrvp6/E058yEb5YcWGHzB1wTwcHr/E?=
 =?iso-8859-1?Q?Szflm0cTtgV1yIzHBoAmEA7bd1Q+2IZlUnJfeyrG+jmOsMhml9JtwNp3tZ?=
 =?iso-8859-1?Q?0aR0hyeaZhUY12N0L8u9BU00LmIx3yndlR7MaOM0YFRGAsy37bexCRNJgl?=
 =?iso-8859-1?Q?LCREyBVzoIATRVyzg8cwwFCLJHR5xs8W7JMWqLltUcEi4jz9SQ5OpijQtI?=
 =?iso-8859-1?Q?il3tnzofazj4tNf7dk2l82FkWAcsKNYMNNld7cxL04cn3MTAmrVa700XF2?=
 =?iso-8859-1?Q?NdJIxdt0XJn6jHPgDmEAAmcPPWB3AQUVPCOTFqCvtqPYvqAJhv1nz+kV56?=
 =?iso-8859-1?Q?T9LthrbtbBRtraRlcjg3zyDGdu4umALttq9CYz7Yp3k/pmRHJAzJz2kI47?=
 =?iso-8859-1?Q?OVCT0f8JnY56/ZfWYhsYyRE2k7K9UsVpnRsmRud/1Y+4nIJ39Ukx8HuvU/?=
 =?iso-8859-1?Q?8QcE7RoSHtk1ElVqbdhE1bypzpjPQzDyG4?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	7g5I+fw1Up0S9HW6JxyTbqmt+oNdYB07mwGPg+GBZ200Jw78F9JMgZstto9lxjdeDuCIYVSHFBGDDuzhHjubrderz6xMrCH0m7PVEWXzfUVp01fCX/bzMCz4Pueo4YINcT7HdWMtD1Sxlt1xnf2riVzRXuFCOhFmV8XgNGDG3seK5BJtHQ4yFuNSqyhnZd1nAbusySVdbxoEokJQt8g1JmWk0mZJU1Jm2wBEvTaXfo5DNZ/xZxJVXtYr9c2o/MgB6/w4fFHDWyKJTWTN+18BZltigJaVK2XKbDJpZ4ufEd6TMluWGeo6k1ijNfFeYUsiOVqYA3WPcZSV7IFCmIHVcRo9Y5VmrtGUy9PypADd4KX7KyRxyeto4C/VytsLW0Pt/P+gXIy3OX2Dl6aj/g7JqQfpvDVLzvS7xIlC4mBruk8JONgFU85t12VpNLORM1wMSJyu6fP3E5ULTQ6DNq83fSxHu8qcLoCX1iHxnOsTe6CZPhQXYqhECAYp3YzzMPBm9ErnVoKUT+aiMwRxAyWX1jlV7eKIsBNbwEtxZA/2ydcTLkt0wGJdEFy+0/aRtumRBkSVJQgh9kHtJjlP4yyR8x6El/wDr2IFP5whFU2y1TbnRCzLe09mKtauGvZLOVpmVSrceOyOzRTYpiMnMFNaSQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 236775f3-675b-4e7c-2361-08dc433ea939
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 09:19:18.5413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: imadJiRosLMlYO6CIdOodNUWSsYQ2pOdgZfqdoZ16rNGQJ0cwE5m5Dp4mqNw97ajUH9i7vcCPcr12mE0Ds+e6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6910
X-Proofpoint-GUID: 1y2x38jbNFdT1R4fcXAASGJV5NXkyYHZ
X-Proofpoint-ORIG-GUID: 1y2x38jbNFdT1R4fcXAASGJV5NXkyYHZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_07,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2403130068

Added new bit EUSB2_DISC_SUPP in GOTGCTL register.
This bit applicable in device mode of HSOTG and HS IOT cores
v5.00 or higher.
This bit used for Device Disconnect detection with eUSB2 PHY.

Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
 drivers/usb/dwc2/hw.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc2/hw.h b/drivers/usb/dwc2/hw.h
index 13abdd5f6752..c1d5d46c33e3 100644
--- a/drivers/usb/dwc2/hw.h
+++ b/drivers/usb/dwc2/hw.h
@@ -11,6 +11,7 @@
 #define HSOTG_REG(x)	(x)
=20
 #define GOTGCTL				HSOTG_REG(0x000)
+#define GOTGCTL_EUSB2_DISC_SUPP	BIT(28)
 #define GOTGCTL_CHIRPEN			BIT(27)
 #define GOTGCTL_MULT_VALID_BC_MASK	(0x1f << 22)
 #define GOTGCTL_MULT_VALID_BC_SHIFT	22
--=20
2.41.0

