Return-Path: <linux-usb+bounces-19180-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D35D9A08562
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2025 03:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCE5B167E43
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2025 02:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EBC81FE452;
	Fri, 10 Jan 2025 02:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="p3ykcJf6";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="FPkj+BAF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="E1eGIePz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BE31E2607;
	Fri, 10 Jan 2025 02:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736476661; cv=fail; b=TtSLiXnkCioSVl6zvPbkvtXjtWgvtpmvgK0JfX+Icgok2zVqVsWMO/41vmJTk8tOiXgTjcx+KZkw08ZER9LhyN6jiMV50Go1lgnabuHucYKdi9GX8X15LNycOEdCdW6++Uo7o+Q/ZhjZuxXQ8C0s6GtQpFFXZO8AT+zrfYL87W4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736476661; c=relaxed/simple;
	bh=ySDqDIdnv6ZmwgAjy4edrj3lkM7KA7rsYNL+OWbl0IE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TZObhdNixULlChM04QYPjibHQbuNCiA2+tWpW7uHVmTBhb7Tgdm3jw/sbVLjsi+O1+lXtaewaaHyjjb8eon1bbupiAjikAhMttvDTVYy4pvXXjWAFqp/s5gYJfOqd9efbabt88ziXz3xj3s3TCtURxCi0TkR2jhB/rmi0eT0dLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=p3ykcJf6; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=FPkj+BAF; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=E1eGIePz reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509MfJqB029745;
	Thu, 9 Jan 2025 18:37:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=ySDqDIdnv6ZmwgAjy4edrj3lkM7KA7rsYNL+OWbl0IE=; b=
	p3ykcJf6VL2YVmpXwqFFv9jb4a7F+yEu1YSXpy3PTVNCAgU6fxuIGFNdijdVnY4V
	OIurigHGy9Wp+vIEE2TkZGEOLyzbl1RMruqzZ5OYaGYhfgAjxKixUcfFLBva6qoJ
	HB43FzZSDi1nh6VJquA94Lfevt1AZqPVw74dwy9TlTgSJObgopxQRTNYRfAp6+aQ
	23Ql9Xifczud/opGzZM0QguPS19u4WhLdhA3O6zzlzK5Q8vJCH0CBfwGaSFhHDcw
	B2BPTRbYWzF6N/55NbSbi+21GDIilVBOTKjSheloMS15NLbo35R9L0mZxbQbUEIj
	X9HFa+CkWmXFzHrU6Rya4w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 442hrftkp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 18:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1736476643; bh=ySDqDIdnv6ZmwgAjy4edrj3lkM7KA7rsYNL+OWbl0IE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=FPkj+BAFjavdh2lqjbQFlIzBNaCcJSM+OME1j9TDzBcsTGYHpynnGcmeiWyzUrNsJ
	 aqHi/8QUQdnMW3wnYfUDwLbK7xjkZGl/vrMrg0QMyLyozxnjho7aU/uoUKBQzDSEi7
	 PjAV1QgTv5WcdfKweQf0u29Jce8lxiiNHIxLZCurkzfBbjr6pDMiL8GwQZ+aMT2TIL
	 y8M5ct99HZGNOduVL5fkwlAvD2im3zDIQQcrvqeTGQXJFdnKKI72ny/LV2qD570WRw
	 dqV17bh2ecI0SvNfqDoj7ANmNohdLs8fksO8syxTxE8Q7dFW8g1Ap4N5GjVQndeno8
	 nlDThuxKZ+PUw==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 32AA640136;
	Fri, 10 Jan 2025 02:37:18 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 0E45CA0077;
	Fri, 10 Jan 2025 02:37:17 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=E1eGIePz;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 81B6C40830;
	Fri, 10 Jan 2025 02:37:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VXvXhyJBvGPtPIF8mb2WfIU9kYTFjfVSfmshcZ8m8UoREoReCNSllJ7eBGAYXmWc+AMyUIeslDeKDWwv29SM2mRDZ4jLcdRtWtc/1wM/gJ3+znsMUQ6iK2DilId/tLbyi4WqMkQ+X9KzrtKCTbltOVyelnUitsTxqPf2MDOleOi7tcePHdr9ISkr/KcNwsJDfoU8mWJJKecBhttFiJ5WWgG5Hhl9hgEVA77C+qCagM5B04awkiRVznaG/8OD1MnbUsdfg+lMR+Ruw+2spoOi8A33tfHen/S6tGpewEurTpZRc9JY8ecK6Ux/eWWrWPnsb7XVDG5ocQnNHzoGI7E7Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ySDqDIdnv6ZmwgAjy4edrj3lkM7KA7rsYNL+OWbl0IE=;
 b=Xyc9/bFXMJazgLE3Ua8AdTH6q1kmg+DxCYgNsjVKgSuuvceFLTBSCa2Sx9WIZCBu3kxJyxn+dsbOmiQma/ELgDEfut5hbexp8b7z9sXT59EAGPSCauM1fwzMjYqlIw9QOBDpMvHosbmPSILMk49Fv9Olf7qQ8yd6cyvHrDZPEmLMe/HbA2q64a5l/3cuc24tAcb2Wlu5wgGzGvjY2guFis5SHqw8KL1VJYEPyI6JCdddej57OtM5Q14/TSGpzlYRCVZsDXEr7rB2DYZD5P8CztK1t2VJluyLYXzd9UbKG1SlvjeRe0QmG7HHep165wVS8vyGSbHLr0KrvMfs7yLIWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySDqDIdnv6ZmwgAjy4edrj3lkM7KA7rsYNL+OWbl0IE=;
 b=E1eGIePzwhXt8Bhl2JSjT2UXnQJ6v968oVJL1B7rHNsjnbaiPSY2JMFaRyVG+0Ad5N3j5zEq0EUnJ9xJ2uCzPfDDIOBGKKOnMlIIXDKBrzfKwucBpL09WTN7iN/uv1gWG5Ho5g3HdEY6DQpOzZU8hSDpgCdNx5yzvZa1Qnjh0a0=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH7PR12MB5783.namprd12.prod.outlook.com (2603:10b6:510:1d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Fri, 10 Jan
 2025 02:37:12 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 02:37:11 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
CC: Patrice Chotard <patrice.chotard@foss.st.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] usb: dwc3: st: Switch from CONFIG_PM_SLEEP guards to
 pm_sleep_ptr()
Thread-Topic: [PATCH v2] usb: dwc3: st: Switch from CONFIG_PM_SLEEP guards to
 pm_sleep_ptr()
Thread-Index: AQHbYqof6LrXO0TGLESs2xz/OZTgt7MPS8KA
Date: Fri, 10 Jan 2025 02:37:11 +0000
Message-ID: <20250110023709.hizhtf7o7day7c64@synopsys.com>
References: <20250109152055.52931-1-rgallaispou@gmail.com>
In-Reply-To: <20250109152055.52931-1-rgallaispou@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH7PR12MB5783:EE_
x-ms-office365-filtering-correlation-id: ca268cf2-3110-45b5-8a15-08dd311fafbb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TDJoQUFONVNaa1N0ZFVzaUtOUzlNZHB5bCt0cWtYdXdva05VR0VOS2dWSUVX?=
 =?utf-8?B?Y1dUMmIzNmp3aUZtT2tsb3ZKeTNkV3dWTzJRT3hrR0ZxVTNWQTlDVUtwLzJI?=
 =?utf-8?B?WTZBa0UrTnM2ZXdWMU5wUHhXTXcvTUtmUDAvK2ZILzRHbkRqTlUyWW03RGpv?=
 =?utf-8?B?SENxdWtSeUZ1U2QrQkRzZWRIOVVEQzE3N3dnZ053ZFVXMTN6blhiQUpmOGND?=
 =?utf-8?B?VzVKc2NtZkRIUEFzVHkzcFBVNit4eVorYzhBU0xKeU9GQnZCYUxPbWQ0QWJi?=
 =?utf-8?B?U3VSdGxQei9YRVAzeHpVNm5PYnBhV1N2VjlzSjBNK2lTRWhnaGI5b1dua09q?=
 =?utf-8?B?NjZPT1dJUVFSQ0F1aHVUbzZ6N3ZWRVVlbXBKc1dON0FSNGZ1MjJkbjM4aGJt?=
 =?utf-8?B?b0JJc2UxanhkWWZiMVlnUWMxUzErRW9RNnY0VVNCSzZuWURQOXA3QlBmTUdU?=
 =?utf-8?B?SmtHaU9pV0k4Wk5kV2d4ZlErRGN3SElxekgveFhnSzVWa1Z4S3NHU05VQXBm?=
 =?utf-8?B?RHd5eml5emZzWVEyejJIRzFla0FIekhPQ0tPaHRKNDgzVXo5azhQSHBNUDJs?=
 =?utf-8?B?UnpUdFQ2UGlsVFFoN2ZOSnZWR1hHRGZpT2NEVm5qaHdXMjFNWC9BRC9BMEc4?=
 =?utf-8?B?M1lpZ0ltakQ4cVRmd0diZWZMOHhVTzFKYmd4U3k1cVVSYWptZWgrN0ZNdWxO?=
 =?utf-8?B?UUlreUJxS25XRnJ6TXh2RU1FMlhCOHdGMTB6WG9KcFppZnV5OTFiemVqYk9N?=
 =?utf-8?B?OHYrTlNBb3NEL0lPdS80UTlVYTNnQXI5dDNhVWZraFh2UEFSUHFxS3djVWxW?=
 =?utf-8?B?OFNHWFUzUnc0SHNGY0V5U0xyenhkamcvL2ZLMnlkaERGaXkxOFlaa0pQWUk5?=
 =?utf-8?B?RXRvSHQ3aEFJaURKTzBTWEhqNW8wUlo0TlI3UlE2SGRlSzJCWWZQS3l3UmEv?=
 =?utf-8?B?b1hGZ01NZlcwQkdKekhZdk5JSnF2dmF1RE1Ub29pSEdGcnhZNG5YTzlBME5R?=
 =?utf-8?B?ZThGbEJYVEdlZUhUZGplamVYai90Z1hNVWVhRzBsUmRoRlEwZERaL3FoRlFR?=
 =?utf-8?B?TS8wYkwyT2x2bHkwaDRtRzB1UmhVdVlTVDhybGFWZTZYMS83cjM1S01xZVV5?=
 =?utf-8?B?NFk4M3NFVXFNRnlzR3lYemxMRW82d3BCaFJjdUlwcDZ5R21tb2FkTUgzMlVN?=
 =?utf-8?B?Zm01dmUvU245eGJzL1NuM3V6aGhDKzhsY3pKWm41ZWsreGdCR3lLSi9sNm56?=
 =?utf-8?B?ck4vc3dETEQ1WjhhUVNSbWVYeUlXNk9zeHhrbHJDcWJmeUczUE5uT2ZoVGxS?=
 =?utf-8?B?TlhTMHNwUVVlMC9ybkRWOVVoSjM2U2dFTkZldmF0dnpMQjhib0lSa3NyNmlp?=
 =?utf-8?B?dUxudVIvcS9MVzIvcTNENDMzNzhNOFdnZlh3cHBCUVFNelBHcFRHNkl0ZnMv?=
 =?utf-8?B?N0NURUM4RGZVb1JuMVZlUW83bEJQdEFTOStPNitteks1N2N2VTY5ekJUWHk5?=
 =?utf-8?B?cnFqajh3RGloRXRHbzZZREF4eE5YQU1lcEJoOFlIRTdObE9VaWQyWkRjSVVG?=
 =?utf-8?B?V3RoYUhJNUtiS0ZGeTZDWWZDVDBvZFhzWDlnRjZiakNDZHUxRitLeGh1SkRW?=
 =?utf-8?B?THVqblRqMytHa2krbC9WZ296Z0k3QVIxZUtySnJJWWJJT3JkQzkzeEpOQkJC?=
 =?utf-8?B?ZzVYeW5Xb3ExUVNSSjJua1NubndiSkxlQ3hmTGhybDNydS9PRWNrMjR4TkZi?=
 =?utf-8?B?TDU2cEk0bVNnRjIvY2QrNW9SbitqZElhM1lRem9CQW9PTnptWnJ1TGZOcENw?=
 =?utf-8?B?WlQ0V0VMdHo5aVFRd3VFMWg4THpxeWF1akRRc3ZoMWxsZGJwTGdBTXVTNENa?=
 =?utf-8?B?V3YxdzlEaEJIZ2F3TlNKL2RWbFgxM0pVZVhYS1daZzhvSGFvRHlrWXJqdUdX?=
 =?utf-8?Q?kV0R7S9fwgtFVJ/ZLhBvUBmLv8iQEJ5Z?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cVQvZE1NbHp3M1Fnd2doYTM2bDRKemdVQWtCRGUreXZ5elp4UDZXd3pIOEZO?=
 =?utf-8?B?Q3pLWmp1cTF2cHozQnEyZnhPUm42OEFuazRURm5CRng2ckdIdEF1MTlvRFBr?=
 =?utf-8?B?dlhyYW9qSm5lS1hUU1ByK0ZBUlhVVXBleFpVS3FNcUZwaXUrMzVPeFJOcjFm?=
 =?utf-8?B?cFl2aVl6RzVLQm5sRlpRM1dKVHFnendXMkxMT01ydURsZTQxaTNCUWhKRHJR?=
 =?utf-8?B?SWd1SEZEK1NLM2RqWVFDcHFIUzU2RkdYMGVjcU5oMzhRQVNVYXNRRE8yY2N6?=
 =?utf-8?B?WG5XWW1hVzMzMmpnQ1ZWSkZlaVF0RFlHdWdXdDYyaDQ2NW1kZ1MxaS94QlRK?=
 =?utf-8?B?MHVvYXZMeVZtNFE4U1U1WWdCd28zay8xUzNuNzU3MkJtT1NJNmhqeWl4MFB3?=
 =?utf-8?B?Z2twM2pPRjh1TzVoZ24yR1kwUG5sRmZoMHkyVi90TnJicTdTUjB5VmRqU0Q0?=
 =?utf-8?B?ZHdzRm5aV2dOYUVNTWRYWEJ1eG9tYkFtdHVhNTl2Y3hrNk8rUCtybWMvbmM4?=
 =?utf-8?B?SUpJL3VRRlkxSGtWM0hoTjcwa0pJRnQ5cUdUbjF0bm1WTmhRZHNKNWo3cnBX?=
 =?utf-8?B?YWg4QUdyTHAwSnBwakhLVExDWE5GWnpXeXk4R1B3VGY0ZzcxRFgxZmQ3a0s3?=
 =?utf-8?B?SVZ1Qlo2ZVUwaURONXNKSEQzREwxaFV2aHc4bmxzL1NJL3ZZT09IczFGSFh1?=
 =?utf-8?B?cjFyU1ltbmYyYkhNKzFZdFFzY0pwbjZOUkdCSXdVbkpKMGkvZ3dTRE1kNVNm?=
 =?utf-8?B?S1JtZkUrZnRZNU9ldllpazJoYlRubVZwTDVBWGNXaFNTY2xZbUV3TjdETStU?=
 =?utf-8?B?eDhraXVJdW8zc0xtMUJqQm1YVnZLWnlaSlpUZnUzYW9CQ1FkNmd6b0VEQy9J?=
 =?utf-8?B?Ykt2clRhMjlTMko1RWVoT25nVmNsZGtNT0NwOVoxOFEwSTM2YWRpeGt0NjFW?=
 =?utf-8?B?N2NTaHliSkVRU3BDdVFhVHV1dzNPT2dURjZqTk13MGZvcWljUm5UNG4vTks0?=
 =?utf-8?B?Vmtvd0w3RHJBNy9EcVNpRE0zNXE4MmFFTWpBMEMzVGdOZHFsOHpqREpMSk5M?=
 =?utf-8?B?RWIxUmdzcVRMd0pyRUVXVEdkMlh4MmhtSkFsWUo5SnZ4cStMOU1FUEs4MkFZ?=
 =?utf-8?B?SUhac1J2bWhVSHp5RWNTMkU0RXAyWWxFUHFCUG5wNTROdHd6ZDdZN3lLTFZH?=
 =?utf-8?B?L0J1aVVLTWQxNHp2RlZDRCtFNDN0TndnOVB0YzNqK3B0bnpJeUlFS08rYlho?=
 =?utf-8?B?L2QwODJ4cGl5TVV3WXNYaTJJZXNlRTZ3dE9yU1Mycll1M2hSdkRRYzlQa0VH?=
 =?utf-8?B?OVRFVGQraWQ2c05RS1I4SEorTit4TFgvdVJxR3BMbk5EbWJnbmhrc3JIa0Ft?=
 =?utf-8?B?T3dhOEpwa1RCUWg0NU9UWGdTR3Voc3JnZzIwNS9jbWJZRUpoT2pqY3lJa29z?=
 =?utf-8?B?M0E5eHlFSFVCWW83Z0duaEtITzJxNkMrTVZGRmJVMzdQMlJRb3NqV0V5TFpu?=
 =?utf-8?B?NmFwUXR4RlZNWTN3YVBHTitRSUhsTFJET0hzQnB5LzZEOCthK09ZNVluSDdk?=
 =?utf-8?B?VldiaEhnRFM1WUREVUtWTkdPRyt4dy92UWFVK25NNElzdkRpYXB5RjJ4alho?=
 =?utf-8?B?SmZSUHAzc2sva0htM2VUdjVvTDlVTFo1MnF2K3VqRFZDaW8vWENHaVNmSWFs?=
 =?utf-8?B?Q0lMb3RGaVQvOGZsOWUzRDhscjN2L0x4NGszNzZPMnJQNlVHTlBMV256R3VC?=
 =?utf-8?B?czg3MjZ5aVpOVWR4ZmxEbVNJQTV3Z3BOTXhaME9UcS9yaU45dFl0dWZZNTZq?=
 =?utf-8?B?MXRrQm9jbE9TRC9sL05VSmRBbjgveCt6T1grdSsvcGgvRjBheEVoN3JvZHhz?=
 =?utf-8?B?azZNT0p1cWQ3OFZ4cTk3SVVJSGx1OXp6THVaMFRSbUszRitPUy9Gc1lYYi9G?=
 =?utf-8?B?TWgrbFY4dkhJb2Vjc2NyZG1DMXlFR09TRm9MZTYxVXJKSmUxQVo4M21KYjJF?=
 =?utf-8?B?V3ViK2drYVlRVkltWVdhcTdrei9TSWIrM1JxWXI5V0xYNHBuWHBrQjgwY25L?=
 =?utf-8?B?enM0OThSSWF6MmNsZVdBc0pKcXBjT1ZjTmpLTWFxVnBYY2RRRWRCNjZPNnBx?=
 =?utf-8?Q?7xHxyUUZtP/C6XH8UamfVZ+40?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C571C3CE5FBBC46BC73E45B4F79AC14@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5Gj5y7y+HcCDKO2FgFpS6uP24yzHN0XJNaTRtVmK6od9KWYvc3Lf1GtM2UjJrdM3BVdomLtyZsh+9Mx4fWStg2rSE83+R1AZT5qDePKTJCTglzrUSw6BozsauRgQ4pyQjz5RfdntlqtrDoANXb4N3Wcx1Gr3AtflOd30bBIBwBdbymtFGXXoBxb61SovcpcOzhW5KuMidJaBAElc3yzA29V0PsFPBEKwVzF/UEw/JsjGMqEKI4LwjAmCnTeoNcubMVO0+PR+NQN2AkOcdfrpfAf40RhdqmzDvu7iKPmGHJi9D8Bq96hDnskmBMfFe9tbbIcAeEwzJHc7Flsp767ikbhFqCmGKkHhvCLhWnnRFAtouKXstDYvsG6l2d5CRSmXBoC/5cPPMOm6USMqta+/zgDeQ6ZWGnmfVW5PCpq39uFqpRs1POQXVuKigbVf3BczbLKzq4vq2/G4cdnDKJ0Cuk/DchlrRFIUvF9F2Z0IZm844uJMdtFiRqKtm9IboJxFuGmVKPdbWM83pwLkMEbTu96v2QRsnWcVAAR5P56/BQb8UeA8aUtWvz8WMu/tMpqANcg+1hYVHRhLuMP4rVg8wFdq9HPtdoGSQFXSNGceg2Jxzv8MitQjIZ7Ti+aUdri0B850qOEN+NEepDlhs82J4Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca268cf2-3110-45b5-8a15-08dd311fafbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2025 02:37:11.7901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qFLZcd/zHvhf3gq/+8NZxN86h8Wl9PrUsqqx/0AB04JQmq4vvApgxzcrc6AjPyOvSf/Yqonlh7imgTNMh+8TcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5783
X-Proofpoint-ORIG-GUID: XXil2KTvmOn3r9UeBVoSI2RJHTImhnV9
X-Authority-Analysis: v=2.4 cv=CphFcm4D c=1 sm=1 tr=0 ts=678087e3 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdSt8ZQiCzkA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=jIQo8A4GAAAA:8 a=g4v9WotyKDYwkYY55k4A:9 a=QEXdDO2ut3YA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-GUID: XXil2KTvmOn3r9UeBVoSI2RJHTImhnV9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 clxscore=1011 spamscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501100019

T24gVGh1LCBKYW4gMDksIDIwMjUsIFJhcGhhZWwgR2FsbGFpcy1Qb3Ugd3JvdGU6DQo+IExldHRp
bmcgdGhlIGNvbXBpbGVyIHJlbW92ZSB0aGVzZSBmdW5jdGlvbnMgd2hlbiB0aGUga2VybmVsIGlz
IGJ1aWx0DQo+IHdpdGhvdXQgQ09ORklHX1BNX1NMRUVQIHN1cHBvcnQgaXMgc2ltcGxlciBhbmQg
bGVzcyBlcnJvciBwcm9uZSB0aGFuIHRoZQ0KPiB1c2Ugb2YgI2lmZGVmIGJhc2VkIGtlcm5lbCBj
b25maWd1cmF0aW9uIGd1YXJkcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJhcGhhZWwgR2FsbGFp
cy1Qb3UgPHJnYWxsYWlzcG91QGdtYWlsLmNvbT4NCj4gLS0tDQo+IENoYW5nZXMgaW4gdjI6DQo+
ICAgLSBTcGxpdCBzZXJpZSBpbiBzaW5nbGUgcGF0Y2hlcw0KPiAgIC0gUmVtb3ZlIGlycmVsZXZh
bnQgJ0xpbms6JyBmcm9tIGNvbW1pdCBsb2cNCj4gICAtIExpbmsgdG8gdjE6IGh0dHBzOi8vdXJs
ZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQxMjI5LXVwZGF0
ZV9wbV9tYWNyby12MS0xLWM3ZDRjNDg1NjMzNkBnbWFpbC5jb21fXzshIUE0RjJSOUdfcGchZThl
RDlwbEpUbEJmdjNGMlBJS285TV9pSmQ1RlM3NXc5WHVvelVFT3hqZFBZTGswOFEweDc4SHB3UGct
cUFnWUhtdEFpSHFJZUhaRW5OOUp0SjJvMExLODBRJCANCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9k
d2MzL2R3YzMtc3QuYyB8IDYgKystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMv
ZHdjMy1zdC5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXN0LmMNCj4gaW5kZXggZTE2YzMyMzcx
ODBlLi5lZjdjNDMwMDg5NDYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1z
dC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1zdC5jDQo+IEBAIC0zMDksNyArMzA5
LDYgQEAgc3RhdGljIHZvaWQgc3RfZHdjM19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCj4gIAlyZXNldF9jb250cm9sX2Fzc2VydChkd2MzX2RhdGEtPnJzdGNfcnN0KTsNCj4g
IH0NCj4gIA0KPiAtI2lmZGVmIENPTkZJR19QTV9TTEVFUA0KPiAgc3RhdGljIGludCBzdF9kd2Mz
X3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgew0KPiAgCXN0cnVjdCBzdF9kd2MzICpk
d2MzX2RhdGEgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gQEAgLTM0Myw5ICszNDIsOCBAQCBz
dGF0aWMgaW50IHN0X2R3YzNfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gIA0KPiAgCXJl
dHVybiAwOw0KPiAgfQ0KPiAtI2VuZGlmIC8qIENPTkZJR19QTV9TTEVFUCAqLw0KPiAgDQo+IC1z
dGF0aWMgU0lNUExFX0RFVl9QTV9PUFMoc3RfZHdjM19kZXZfcG1fb3BzLCBzdF9kd2MzX3N1c3Bl
bmQsIHN0X2R3YzNfcmVzdW1lKTsNCj4gK3N0YXRpYyBERUZJTkVfU0lNUExFX0RFVl9QTV9PUFMo
c3RfZHdjM19kZXZfcG1fb3BzLCBzdF9kd2MzX3N1c3BlbmQsIHN0X2R3YzNfcmVzdW1lKTsNCj4g
IA0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc3RfZHdjM19tYXRjaFtdID0g
ew0KPiAgCXsgLmNvbXBhdGlibGUgPSAic3Qsc3RpaDQwNy1kd2MzIiB9LA0KPiBAQCAtMzYwLDcg
KzM1OCw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHN0X2R3YzNfZHJpdmVyID0g
ew0KPiAgCS5kcml2ZXIgPSB7DQo+ICAJCS5uYW1lID0gInVzYi1zdC1kd2MzIiwNCj4gIAkJLm9m
X21hdGNoX3RhYmxlID0gc3RfZHdjM19tYXRjaCwNCj4gLQkJLnBtID0gJnN0X2R3YzNfZGV2X3Bt
X29wcywNCj4gKwkJLnBtID0gcG1fc2xlZXBfcHRyKCZzdF9kd2MzX2Rldl9wbV9vcHMpLA0KPiAg
CX0sDQo+ICB9Ow0KPiAgDQo+IC0tIA0KPiAyLjQ3LjENCj4gDQoNCkFja2VkLWJ5OiBUaGluaCBO
Z3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoNClRoYW5rcywNClRoaW5o

