Return-Path: <linux-usb+bounces-35522-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dExGMFPAxWlnBQUAu9opvQ
	(envelope-from <linux-usb+bounces-35522-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 00:25:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E18933D05F
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 00:25:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC48B304C964
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 23:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C49643A5E61;
	Thu, 26 Mar 2026 23:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EGTU1JKw";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ky1H0H33";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cYVex9LS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3543A2560
	for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 23:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774567501; cv=fail; b=ZIt4DrI+YvxHvQU/6+Cil+h1+woTnd5If6/6kH1zrSziZa3aKlzyqAx5eozByLrbwN2gfeus4hk24quPaqM4/znt4GjgV0FxqBVKIhumvoFjcPCnj4B7fkNMpWnbpXPNP0qfoycbApY8cfyHXalIWmloG8k186KzcD8UMqY3f74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774567501; c=relaxed/simple;
	bh=Dteh2Vyr0jfyzLs2Yf7Gog6/uRULOhMpzXfu0j2RL60=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YlKaj8b0WuQq7c+qfXt7IpnWmgAzpoWM43TPk506NTXlA4M5rz1XVAAsfjYv23mCBiZvAfhk5aNaEiCOHks1VQyEtrRn9rC17t1d1Bi5f/fmW/En8VnYIpCAPUoaGXmrqPxhZBR/XWYW8eyEyZHPvEe1+2PXQfn3ChH0W2YG1rA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=EGTU1JKw; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ky1H0H33; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cYVex9LS reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QNCVnJ3838110;
	Thu, 26 Mar 2026 16:24:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=Dteh2Vyr0jfyzLs2Yf7Gog6/uRULOhMpzXfu0j2RL60=; b=
	EGTU1JKwQdlnIuVXpChbUL9cFHZzhJ2G/jAQxHTgQQ/HRMakhV+tgJsGr+G9K+30
	vlht4DWnnvBEWvv2EbGg/D2a7IONBtGV+ZMowTdnbO3/VdpSl/tdHN5yeqZZInS2
	aFUzcz7ImaToJLxqcDOWML37jbKqxIcJFUIwV5YRVrbRtr3jyvJ458PwUjdDs0P6
	sAc38wPVIZjA0/3ZPpNBqj4iuJOIglgp2Kdd0p9ojjVCHpIQNCf61+jAF0F5/Qyg
	cd/jcfKD1nSFs8u0WtR+kqPJ0S9zcIpwAM3xYalk2q861MiSREvSoaDDi8I5n9Qz
	B/VnoOL9hOARUc4n5oR0wA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4d51r85c6p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Mar 2026 16:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1774567464; bh=Dteh2Vyr0jfyzLs2Yf7Gog6/uRULOhMpzXfu0j2RL60=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ky1H0H33N2qYcst50XKzKzc1pBUCv6v0YbqHn0+mcBVYwJIYiH2w20kpx16oFCLer
	 iL8BIEI038IyQlIv7JVtX8MCxybmuxsCdzei8Oh/iZPVMdgBUavCVsCO0oXXrzuQFG
	 mtWNeRLCeYZBOJv8+ZTXGNB7P3O3j+XXQC0E/JKi6lOawUNys1yCHFbyRN5vVZk5rW
	 mKp4etOZpUyxqK13q10MHX6xp2oNvZ1hjWYO6RbKi/h9Pm6vHyixDHg0Yp6nZzG1Jc
	 hilFcfaAszyYVdZKprmocApqPE/HnFrBxYHIemBQM4usxQyRCLMA0NWhsoJ1P+wlC4
	 ZyE7WJzWwUrPQ==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 78A83401F3;
	Thu, 26 Mar 2026 23:24:24 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 03A28A0087;
	Thu, 26 Mar 2026 23:24:24 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=cYVex9LS;
	dkim-atps=neutral
Received: from DM5PR08CU004.outbound.protection.outlook.com (mail-dm5pr08cu00404.outbound.protection.outlook.com [40.93.13.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 70232402B2;
	Thu, 26 Mar 2026 23:24:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCdlIkJpyueFDK833LkT/eVqoUvrp3lWS6czOyTjn1DWIidVrhwukXSVmEuObm8mSCFDpz0xvCAnx3HDUFQGN/KBO+ZOeO8jXv8T/MpE8vI3LEipvxtQbEMW4xMn4yOPuJLouxDdKTtPj/oQi1D3nSblhCzZVtGbABsmSER6d/2KXknZP9vb9Z1r/LUatEk15ekejoA6wfZu8O7gCdoqv4Ie65F31VCompHw6nwOSsF41HNh+Qh2usq/0GHg+Bd3J+giNI66tuNg3aEPK0IDPY6EvAZzXKyryEG4E7i2uZT2ibRya5nzytCyw24l27iBvwlKt5NL2gmUjCw4W5uIEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dteh2Vyr0jfyzLs2Yf7Gog6/uRULOhMpzXfu0j2RL60=;
 b=qMLcIsCXNR3ZyoGL8DY/Hl5X9oquI6KKwkjzI/VMLYFcSxj/q0HWQNwVo4mU7TR8rjtI66A6NOmVToApoSflP4K48aCEixekX/2uph0s1skOMDIlf9b2hGGYef4PeC+mujGCFm/Pqv43fHz8b3/7FibJS+WL80ABVtv5R7LlydcyOrKqLD2S/AmZyjeMg2Nzeg8ArT1j9SQs9LbO6+K5IYILspeCFWI3VPUtBS9EAWA6dy63QExCsDGg23Wqzzn27o+WHlNBQ6iGqE+x3U7lcjTQGHesztGDlq616U58t9MXa1KWwx2RKz4RuNXH/D3eH1yJnAmzsk2jt+rn0+1SJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dteh2Vyr0jfyzLs2Yf7Gog6/uRULOhMpzXfu0j2RL60=;
 b=cYVex9LSjeckPPH/jcbJcK5sBrxG7WbklPwwqCEKW/NpqRI80REa5dSE2IdIJNMwF52Khl5kdhVx7eEZPmWO7lGP9OAiuYdVH68foPw5lU6tIV5b/cjHxghtuCDoSoKLX35y/7yfMFKA6RLAx4dQS/PB0LomECNmfBeRyFjC7DE=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH0PR12MB8128.namprd12.prod.outlook.com (2603:10b6:510:294::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Thu, 26 Mar
 2026 23:24:16 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9769.006; Thu, 26 Mar 2026
 23:24:16 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "michal.pecio@gmail.com" <michal.pecio@gmail.com>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Thread-Topic: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Thread-Index: AQHcusCFdimQniQh+kKFqQp1mqfuYbW+fjMAgACCooCAAQbCAIAAqVYAgADI0gA=
Date: Thu, 26 Mar 2026 23:24:16 +0000
Message-ID: <20260326232400.zkplsxflhykhayyb@synopsys.com>
References: <20260323122512.2019893-1-mathias.nyman@linux.intel.com>
 <20260323122512.2019893-2-mathias.nyman@linux.intel.com>
 <20260325015110.v4r5smfvdd62fcua@synopsys.com>
 <0f38e10d-ecac-4beb-ad2c-3a42c2546c3c@linux.intel.com>
 <20260326011910.t7ijezht7g7ttrec@synopsys.com>
 <9cf4008e-2d12-4025-809a-8d9371f45dac@linux.intel.com>
In-Reply-To: <9cf4008e-2d12-4025-809a-8d9371f45dac@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH0PR12MB8128:EE_
x-ms-office365-filtering-correlation-id: cb69ff56-91a1-4b3c-e46a-08de8b8ecc5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info:
 j24hJPlNGgMh7AWhGZZHpn3njJhwJX3IJG9Xi1DGQ7wN40l2KaNq/B63aigerhdT6OAOyhVYGY4wTwwaD2aTCQLhEyMjyDRFNyWSS9CU6Q3cSo/BT6Nl4IhIO5tmtHY/8Lg8VceNBd+KFgis5aIen7tqbHtJAH4ZnYBRZhCac3kW71PhaxcIPIe0ngPzBqICuwGUIX+PZVfz6II7sMCwGdpGhE53K8gIi52yLVyB+hHo7Ia8BG63F+cbMzS8Qp/iQ+D3zvuly2W1C7GpO/v8L+7r7UG2Jjny7zlcOmvILjLcXiW0yXbSt8HmyL2amAu+ilD/0O6/OwD4+OSZy6JU4hQ1Qe2vLVV/aczkT7aLKOq3shdzkDLJGIFEobwhLxQQR8/D0oHMnysXwLMh2UKUUCHY8Ut6n5glJXbIKVZdDgberGsvA235weR9g3XBymXVqdX+/2T7SjlFQiEg75lO3w0fDOCuG2Tzmm/D0IvLmaOOmp7M8AENpJ7GTLcC6tt1j/2bkG0ZqLH+RkJK3omLTM1FyWFWuZ+jw+rYcdfbphH/GM9d/fU5sZsgcgWRw1ZbWjhLd5wipOdwmxN7ptnV6fYqIpS/Q8QAHSzsb7du2HUluaLsL+cox89o9ZnuhuAvuk3ckEFpuL8LwS1n2l9CtkJLGswBNBDU0o1LP0fmpYWdNIx4n2XAJVkYX90HRyVA0/V20HPb20b/K5zPIJPOe/sJ3BVeIvAl5XlXMQWNU541pYY/Mw/ebMy2iAlgpgpGZXCotmw9tKySqflwLzmPM+IsdsUu7kGtB0VfIvQu+9s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(38070700021)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RVRLYUt0b1VwbENYUHVCUnIxcWpsUWczbGNuZW9DQzltRk91c1RZREFFTUQx?=
 =?utf-8?B?b2MveHNvVnp1N3V2ZTFtQUZOeGNWN080Nm54dG9qMGw1aWEvMjl1QzFzL1Ry?=
 =?utf-8?B?TEN5eDVuampDSHFUcEdXYmNvT2FDMDUxRUtTcWszbzRpSXBxSU9XdXZzdUZH?=
 =?utf-8?B?dHZ1djFzM2w4amVyWEdRcnk0R0pKT2FPZlRhbEhBa2dwMHBDaTkyRnExb0Y1?=
 =?utf-8?B?eVlaTUxqMUl4YXB4dEloMkMrQ2hnZHpUVTJrL2pqbDRsY2lGUlQ4TjJXdGFU?=
 =?utf-8?B?R2d2b1JjMHFpUlVyRmVSQzhHajc1cyt6dzliaU9GcW8rdmFpZzdZVExhV0pC?=
 =?utf-8?B?cXhZUVV1d3pKSWorQTJ4TDAwTHIycGp4WEY5S0p2aUswc2lKdTdQV3BheUZn?=
 =?utf-8?B?M0FuMFc0dHBZLzh2VFBZOC9ZVzZxZnErQTdSalBWMFMrS1ZGWm9TQnFwZjZH?=
 =?utf-8?B?UURSYVE2UHJmbVRZY2hQQ0lpWWtwY2dFSkJkVXZSVFBUY3RVR1FpUnkwektw?=
 =?utf-8?B?VldCRW9rYm9taFhlV01KMS9aWk1mNE4wbVJhUkMzTkdjTVJvVlNPbVRlTGZG?=
 =?utf-8?B?akQrc2xHbE4rd3hWdEZJZUVGTEtEZnBBUVlqMk5Ed2JKUStFUUxmTzdXdzJn?=
 =?utf-8?B?cnNZNlU2RXBpT0xRVkV0NGhybFdoTTZpd091UkJMK245S0J4bjV6bzc3dnhC?=
 =?utf-8?B?MlRPVis2RjE1dkRnSmJGV3hsc2R5dVBxbjNBZDNCRzdwakdvUXVzS29KSXVv?=
 =?utf-8?B?QWVvMUNIclFYRWRXTHdwa215M1VOVWdYQXM4Z0pkNTExcE1aQjNoS2hpSzBV?=
 =?utf-8?B?dmpab25kRktyaExnRkR0N2R3TzRTdmhjU3g0aHV5RS84YjdReHZzQXQybkpP?=
 =?utf-8?B?a3djM0FjSTN2bW5qdE55dEV5THRudnNnMk9YeDZwc3lrSWxJek5YNzdpYlVB?=
 =?utf-8?B?OGVXZ0t4M0krRGZCcGNMRm9kWE5ON2VrS1JCd1RvaDhvZ0Q2dzFLdE5MTWVh?=
 =?utf-8?B?SCttVXFVS05zaTNsZGx1R0xoeXdUbDdUay9vWnpvN3g5aGVwRmc1a2RIeTlE?=
 =?utf-8?B?Rk53KzdzUmJLMml0OFBNTlBwN3c0ZzBHdGRVb0ZrbWRqMWtVSE93RmNXOHNi?=
 =?utf-8?B?bmQ3Z0VlY0hZYllYeTFZTld2blJ3TFpTcnBGNXlNcjE0VUFwajMvbTZYUXhE?=
 =?utf-8?B?Y2NscDdSdTlNNzFvK2hyZHNUemErVVRUdEhWZ29mMEFUMHdVZlMrNnRUMTRm?=
 =?utf-8?B?enZUaWpibDBtbTh0WUdpcFZOODIrNjArV3VHQzIyN2Q4MXh1L0NxUHlMWTFp?=
 =?utf-8?B?Y0RTRlpiRDhiTldZQWlNZDNxQ3AxYmFuVkRTVVpOODVGMDgyRVRmTFFrV0Za?=
 =?utf-8?B?bis4MC9zMXJ6L2xzRkxKNDJrN0JvSHlFYkg4b1B5cm44SGVNaEtERkVIWGxk?=
 =?utf-8?B?SGtHczhmNTUzQWg3VSsxMVN5TG10Z0tobUZZYWdjWG8wUFA0L0V6U09BcEtK?=
 =?utf-8?B?Z2pWSTVmY3pRdmdPTitoYy9BVzVQWktRVmZxS3RSRC9LR3F3eDlvRkZwMFhr?=
 =?utf-8?B?TDgzcTc2eE11cHM4dXBQZlYrSVBFVlFKVEU5ZHQzZXA2S2IxNU5qMktlTm52?=
 =?utf-8?B?OFBrU3BsdllqNmQ0TlpndE9ZSTZ0bHdneHM1cEVWZlJMajVwcTJmSVhUK2pq?=
 =?utf-8?B?THlYT2pnMU85MGlMMjA4S0dMaTZLRXZPY2VlaW10a1dRWUJpZExNRWZPSTRh?=
 =?utf-8?B?Ylh3cjdVS0k0Ty9UQkNvR0FIZzBTUWx3TWVTNTVsdkQ1WEtJc21VSnRFMWVm?=
 =?utf-8?B?Wjh3VVY1QnJPdFc4WGJ1ZGMxTkoyV3RzWk5PdGZYdE93bEg3RWlwZytDM2wx?=
 =?utf-8?B?TW41YTVrTkgrc2NTZXFqWGtlYSthYUI4SUxadXdWT08wdFVjLzBzdjdjVG1F?=
 =?utf-8?B?ODlTWncyNXJUQncvMmhCdXdwN3VYUlBGK1VTNlRWUWFiZDFyRlhYOGdVWCtq?=
 =?utf-8?B?T01GZVB3V1JpYVQvaUVVYXVlUVVDTVVyaGIrT2JQSUErL0FldDZIcU5ob2Q0?=
 =?utf-8?B?MU1sRmxtSTFwWnZwalYxT1Z0UnJMdHdiZlhVWHBwcTJZYm4rdGViSHB4MlRy?=
 =?utf-8?B?MG1ZNzYyUGJuZXM2N3dCaEhXWmhiZUNtb09Ja2M3WCtvSXM2bVFTU20wMjJ4?=
 =?utf-8?B?c0twRXRRQjdXSU9Rc0VvMmsvb3dYVnovYWlMbXJVNi9Mdno2T1VyTjZBa2ZS?=
 =?utf-8?B?WkwzY2pEdTI0Z2NsbHpmY3ljVnptWDBQVHVYVFhseC9kZjJ0eHRpUzZJVVc5?=
 =?utf-8?B?RzdOVTNDMzh3NGVNNWUvbjJicmhjelpMUFNWSVR6M25FSEsvZjV3Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AFF034052336EE43A717E2476DB7C2F4@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Du4vOlMVEUTjU9rHfscIbCvIM7SksSUIuM6jiffyEphEj7mI2ca7lAvnYuWvzio2nZicqXZQfa2YI4MrSTW/abYzpY4WuSiveYFVJPkooAuafsu0pH3m099Av3kRSKY9tzKZ1zYg4ZmdIHFVv5NCS4K/eOI42w7Kx42lQ9J6y+UEAIzI8I8kpZRyuKjBBuSlJSWKd03vzDuMOv6yPqmjQj8nDhlracAOJR+4MY6blh6TghHAbJ9PUWhZu4JNSsD+LHB+ntMrXlFTm2j1jOpLmXHhgFXWm+Z4EFouh0G4B6kY7IUR3NDpF2XUdyLc4pQerYrM5KEjRJm/jrr19iYZjw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aJ7Z9UoLs/Vy8KfRHsFpADracvAuDLiCDA2PDAqBhMZq7LxXK5GoIq1XyEyLb1fAb61Ygg0PwqbZAhLs7FIvtA9ZcCEVabb/IJLTp6jBaRn46cNc8I4F2eIrT7WXAyk0ykg6RcIJLPWMB4U2CLegFKHg0v9UjV+xbGTQPkxyP7ICMdAMjWWXDMP0Ku0BeElQABXNxchHCh4eWivHMAH1pF+oxWuImrZJQv3GjmB4EhxxENGuCtWe+m4OKXUGUFX2yhknXspFKXb1QZhZ4h1ERqEN48jkbYEJDcOH9B/Z9C7p0hEqQzSBy72P3vbv39WmlztgYwJy9EsiaQRuBqS4uqsjFer4vC0ZA5BLnipQG2Q3jaw3UGsRk1KRYSdo6inuJVGLuaoGyfTYBI1dB5x2H5PlAtY+ql+zBQeDA98CY805N29gqxRlGVjmPDlClEBKsC7rkPgcG1stCfi7FVcAfyuyXvd4VPAo++l3hl/k3Gqd/3VSxPSA21nwZkms1VezP1RqWrlX0o4Na8ZwwJH/5sEhxXZS26gIxek9O0bi0LduzZKVd17cq/jpONlCiShKZvUG5miyXnD5eYWy1yJboZwpj9aByaAsYB9zigESYZHVWJxFodcOgiwSg2TR6yrxMEt2mJvW0xoBU7W9wUO1Ig==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb69ff56-91a1-4b3c-e46a-08de8b8ecc5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 23:24:16.3249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rdl6NPrisY7mDjMChnbStkba9nB389Xy+YBIl4Ya3S+uu7CBfn1QIkKHm7G5xYl9VyowXPIytDCCX9E6hk3sEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8128
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDE2NiBTYWx0ZWRfX5QAVbXP37g70
 /zhOw0fSGJs2IiVTKl0zT0mqrHIZFfdKLEymT4Vol+FXMF/BDiuwUd5zytb5JzmIYLZBNCUD45n
 1PZDmFKkCM8oai0R6+P6AP6AslqUq3bpcdaOUprZlFsnTaJwFspaIHQO5E1wX7cf2WruD6s80IC
 Fv1QZ+q1DdHSpBFWY2XHRkklhIBGRbGXjvPaoV8xbSrp+/RXOyNzyhGvo+9+VGR0uhEUCtazoVd
 2eYkVa4YJX7RTL9o3/sfqi3wE03tXiHp0nWdYZDw8mt4nogyfsCsFe8wL4IvjRKFNEB7QYMHddv
 Xf+Pot2/soAcCxhGZ7GNZwZ7T4HRoeECcHliuZbGSJxcRzGAg3Um7HRCXoqIB9EFeX+seN4EIFc
 Ort9owIl9O56W7Hpc3k/TWDOm7IW+ksYE8K7zVR/rYuxgXxoZmWve9OkEXrKhYRuux0wf8fesxI
 iAfrCmZ8wJhyAYIH71w==
X-Authority-Analysis: v=2.4 cv=ft7RpV4f c=1 sm=1 tr=0 ts=69c5c029 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=xB1aG2Xg73lmyJeiR9oA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: nA8aomLkNpRinZDTZgf44uJ0lntQJYsr
X-Proofpoint-GUID: nA8aomLkNpRinZDTZgf44uJ0lntQJYsr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2603260166
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35522-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FREEMAIL_CC(0.00)[synopsys.com,vger.kernel.org,rowland.harvard.edu,gmail.com,suse.com,linux.intel.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1E18933D05F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVGh1LCBNYXIgMjYsIDIwMjYsIE1hdGhpYXMgTnltYW4gd3JvdGU6DQo+IE9uIDMvMjYvMjYg
MDM6MTksIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBXZWQsIE1hciAyNSwgMjAyNiwgTWF0
aGlhcyBOeW1hbiB3cm90ZToNCj4gPiA+IE9uIDMvMjUvMjYgMDM6NTIsIFRoaW5oIE5ndXllbiB3
cm90ZToNCj4gPiA+ID4gT24gTW9uLCBNYXIgMjMsIDIwMjYsIE1hdGhpYXMgTnltYW4gd3JvdGU6
DQo+ID4gPiA+ID4gQXZvaWQgYXV0b21hdGljYWxseSByZXN0YXJ0aW5nIGJ1bGsgb3IgaW50ZXJy
dXB0IHRyYW5zZmVycyBhZnRlciBhDQo+ID4gPiA+ID4gVVJCIGlzIGdpdmVuIGJhY2sgZHVlIHRv
IHN0YWxsIG9yIGVycm9yLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEludHJvZHVjZSBhICdURF9U
QUlOVEVEJyBzdGF0ZSBmb3IgcGVuZGluZyBURHMgcXVldWVkIG9uIGEgZW5kcG9pbnQgd2hlbg0K
PiA+ID4gPiA+IGl0IGhhbHRlZC4gVGhlIGFjdHVhbCBURCB0aGUgZW5kcG9pbnQgaGFsdGVkIG9u
IGlzIG1hcmtlZCBURF9IQUxURUQsDQo+ID4gPiA+ID4gYW5kIGl0cyBVUkIgaXMgZ2l2ZW4gYmFj
ayB3aXRoIHByb3BlciBFUFJPVE8gb3IgRVBJUEUgZXJyb3IgY29kZS4NCj4gPiA+ID4gPiANCj4g
PiA+ID4gPiBEb24ndCBhdXRvbWF0aWNhbGx5IHJlc3RhcnQgYW4gZW5kcG9pbnQgaWYgdGhlIG5l
eHQgcXVldWVkIFREIGFmdGVyDQo+ID4gPiA+ID4gdGhlIFREX0hBTFRFRCBvbmUgaXMgbWFya2Vk
IHRhaW50ZWQuDQo+ID4gPiA+IA0KPiA+ID4gPiBTb3VuZHMgZ29vZCBmb3IgLUVQUk9UTywgYnV0
IHdpbGwgYSBjbGVhci1oYWx0IHJpbmcgdGhlIGNvcnJlc3BvbmRpbmcNCj4gPiA+ID4gdGhlIGVu
ZHBvaW50J3MgZG9vcmJlbGwgZm9yIFNUQUxMIGVuZHBvaW50Pw0KPiA+ID4gPiANCj4gPiA+IA0K
PiA+ID4gV2l0aCB0aGlzIGNoYW5nZSB4aGNpIHdvdWxkIG5vdCByZXN0YXJ0IHRoZSBzdGFsbGVk
IGVuZHBvaW50IGFmdGVyIGEgY2xlYXItaGFsdA0KPiA+ID4gcmVxdWVzdC4gVGhlIGZpcnN0IHVz
Yl9lbnF1ZXVlKCkgY2FsbCBhZnRlciBjbGVhci1oYWx0IHdvdWxkIHN0YXJ0IGl0Lg0KPiA+ID4g
DQo+ID4gPiBDb3VsZCBtYWtlIHNlbnNlIHRvIHJlc3RhcnQgdGhlIGVuZHBvaW50IGFmdGVyIGEg
Y2xlYXItaGFsdCwgYW5kIGp1c3QgYWRkIGEgc21hbGwNCj4gPiA+IGRlYnVnIG1lc3NhZ2UgaWYg
dGhlIG5leHQgcXVldWVkIFVSQiBpcyBtYXJrZWQgJ3RhaW50ZWQnLg0KPiA+ID4gDQo+ID4gDQo+
ID4gVGhlIC1FUFJPVE8gc2hvdWxkIGJlIGhhbmRsZWQgZGlmZmVyZW50bHkgdGhhbiAtRVBJUEUu
IEEgU1RBTEwgZW5kcG9pbnQNCj4gPiBpcyBwYXJ0IG9mIGEgbm9ybWFsIHVzYiBmbG93LiBTaG91
bGQgdGhlIGNsYXNzIGRyaXZlciBzdWJtaXQgYSBuZXcgVVJCDQo+ID4gd2hpbGUgdGhlIGVuZHBv
aW50IGlzIFNUQUxMLCB3ZSB3b3VsZCBhbHdheXMgZXhwZWN0IGEgU1RBTEwgZXJyb3INCj4gPiBy
ZXNwb25zZSBhZnRlciB0aGUgZW5kcG9pbnQgaXMgcmVzdGFydGVkLiBUaGF0J3Mgbm90IHRoZSBj
YXNlIHdpdGgNCj4gPiAtRVBST1RPIHdoZXJlIHRoZSBkYXRhIG1heSBiZSBjb3JydXB0ZWQgYW5k
L29yIHRoZSBob3N0IGFuZCBkZXZpY2UgYXJlDQo+ID4gb3V0IG9mIHN5bmMuIFdlIHNob3VsZCBu
b3QgY29udGludWUgdW50aWwgdGhlIGNsYXNzIGRyaXZlciBkbyBzb21lDQo+ID4gcmVjb3Zlcnku
IElNSE8sIHdlIGNhbiBrZWVwIHRoZSBoYW5kbGluZyBvZiAtRVBJUEUgaG93IGl0IHdhcyBiZWZv
cmUuDQo+ID4gTGV0IHRoZSB4SEMgdGVsbCB3aGV0aGVyIHRoZSBTVEFMTCBlcnJvciBzdGlsbCBw
ZXJzaXN0cyBpbnN0ZWFkIG9mDQo+ID4gbWFuYWdpbmcgaXQgYnkgdGhlIHhoY2kgZHJpdmVyLg0K
PiA+IA0KPiBJIGFncmVlIHRoYXQgdGhhdCB3ZSBzaG91bGQgcmVzdGFydCB0aGUgZW5kcG9pbnQg
aWYgY2xhc3MvY29yZSBlbnF1ZXVlcyBhIG5ldw0KPiBVUkIgX2FmdGVyXyB4aGNpIGdhdmUgYmFj
ayBhbiBVUkIgd2l0aCBFUElQRSBhZnRlciBlbmRwb2ludCBTVEFMTC4NCj4gDQo+IEJ1dCBJIGRv
bid0IHRoaW5rIHdlIHNob3VsZCByZXN0YXJ0IHRoZSByaW5nIHRvIGNvbnRpbnVlIHByb2Nlc3Np
bmcgVVJCcyB0aGF0DQo+IHdlcmUgcXVldWVkIGJlZm9yZSB0aGUgZW5kcG9pbnQgc3RhbGxlZC4g
VGhpcyB3b3VsZCBwcmV2ZW50IHRoZSBjbGFzcy9jb3JlDQo+IGZyb20gZXZlbiBhdHRlbXB0aW5n
IHRvIHJldGlyZSB0aGUgcGVuZGluZyBVUkJzLCBzb21ldGhpbmcgVVNCMi4wIHNwZWMsDQo+ICc1
LjguNSBCdWxrIFRyYW5zZmVyIERhdGEgU2VxdWVuY2VzJyByZXF1aXJlczoNCj4gDQo+ICJJZiBh
IGhhbHQgY29uZGl0aW9uIGlzIGRldGVjdGVkIG9uIGEgYnVsayBwaXBlIGR1ZSB0byB0cmFuc21p
c3Npb24gZXJyb3JzIG9yDQo+ICBhIFNUQUxMIGhhbmRzaGFrZSBiZWluZyByZXR1cm5lZCBmcm9t
IHRoZSBlbmRwb2ludCwgYWxsIHBlbmRpbmcgSVJQcyBhcmUNCj4gIHJldGlyZWQuICBSZW1vdmFs
IG9mIHRoZSBoYWx0IGNvbmRpdGlvbiBpcyBhY2hpZXZlZCB2aWEgc29mdHdhcmUgaW50ZXJ2ZW50
aW9uDQo+ICB0aHJvdWdoIGEgc2VwYXJhdGUgY29udHJvbCBwaXBlLiINCj4gDQoNCkZhaXIgcG9p
bnQuIFRoZW4gdGhlIGNvcmUgd2lsbCBuZWVkIHRvIHRyYWNrIHRoZSBlbmRwb2ludCdzIFNUQUxM
IHN0YXRlDQphbmQgcGFyc2UgdGhlIGNsZWFyLWhhbHQgcmVxdWVzdCB0byBrbm93IHdoaWNoIGVu
ZHBvaW50IGFuZCB3aGVuIHRvDQpjbGVhciB0aGUgU1RBTEwgYmVmb3JlIGl0IGNhbiBhY2NlcHQg
bmV3IFVSQi4gU28gdGhlIGZpcnN0IHVzYl9lbnF1ZXVlKCkNCmNhbGwgYWZ0ZXIgY2xlYXItaGFs
dCBjYW4gc3RhcnQgdGhlIGVuZHBvaW50IGFnYWluLiBUaGUgeGhjaSB3aWxsIGFsc28NCm5lZWQg
dG8gaGF2ZSBhY2Nlc3MgdG8gdGhpcyBzdGF0ZS4NCg0KQ3VycmVudGx5IHlvdSBoYXZlIHRoZSB4
aGNpIGRyaXZlciB0byAicmV0aXJlIiB0aGUgaGFsdGVkIFVSQnMuIEhvd2V2ZXIsDQp5b3UgYWxz
byBub3RlZCB0aGF0IGNsYXNzL2NvcmUgbWF5IGF0dGVtcHQgdG8gcmV0aXJlIHRoZSBwZW5kaW5n
IFVSQnMuDQpXaG8ncyBleHBlY3RlZCB0byBoYW5kbGUgdGhlIHJldGlyZW1lbnQgaGVyZT8NCg0K
T24gYSBzZXBhcmF0ZSBub3RlLCB3aWxsIHlvdSBwbGFuIHRvIGltcGxlbWVudCB0aGUgY2xlYXIt
aGFsdCBmb3IgRVBST1RPDQppbiB4aGNpPw0KDQpUaGFua3MhDQpUaGluaA==

