Return-Path: <linux-usb+bounces-18351-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D0C9EC0DD
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 01:34:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73ACE163FDD
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 00:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E27F1C683;
	Wed, 11 Dec 2024 00:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="qFfyWaYE";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RStNcXY1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="pqZ93DqB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADCC8494
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 00:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877235; cv=fail; b=j1HxEmvU7y5lWX1Ou6WENybaYlifYqzIUQUxyY9wJdNeVYm7F4TvWlO070KO+iyyBrcd8+Fte4GJnPrHX0Arn+TTbybGT0sk76sGZjJyoOHC54EzDf8SkAq8gG064/c8sxTG2cA0K1JevXDv2rZwG6hbtH5qah3oo/bEVg8Jdl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877235; c=relaxed/simple;
	bh=K3yn4bl7Vm+aQH5AXRcpRd3WK0uzcUthnC8bl4anqA4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ye1qolnnc6OumBGudtZf9WlYKsvCnWZ8tLOycvXVGDHAahSOqxkO+mutnMDiV/lkBfc7kXg7Q/InNmH397bPQgK8OVS2ErRy4Ggz9v4Y2iHoxJxPIAe7U5Zxy78S8dMy3/OXt7XdZ4S/UWBorArN4SSGIYqsgCCm0VpZzFtv8Yw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=qFfyWaYE; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=RStNcXY1; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=pqZ93DqB reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAM4hrn010844;
	Tue, 10 Dec 2024 16:33:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfptdkimsnps;
	 bh=0oBiYzwvtCSuIZePvlIuhOaq2hACT7HFmKFR8MM0LI0=; b=qFfyWaYEYt3N
	prVu0vmYfO/xycpuMEH4prWpvyl9HqIrcGCh++RG2TSCeXC0RYKyHbj5uHEv2x+C
	C9RKPFKFss93CAmAhiGNDIAK4FQRNEIZRZxO++AprQKMynUmIzJYwKo0fEf6rbuA
	cFEAuLasHqw+2qmNKd3tfjLPyXAZLU+DgoNEiWOHrHbv1GcMV5QiQDk605jHVwfj
	FuWN8oEHaUlTHH9GbMUlVDNw+NArENCef0ap6Ck/bsRXDF9YJGB8bignvIn7M8zp
	4BUY563UKQtcCyu29Pg/qTRMlo1VEmT/CFfEY/o6/ZirwWt06GOk++9XPmzNpTZV
	cEHyrDPUpQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 43cpgb9q3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 16:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1733877228; bh=K3yn4bl7Vm+aQH5AXRcpRd3WK0uzcUthnC8bl4anqA4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=RStNcXY1ngcF3U/0aUe2Khk2YlDkSm80zOrEb8Zp8d3I/rYdXszKW0HTgxlL1O2/v
	 f0br20i25viD6KlZ8A3Dp36BIQVamqIbbmAl569ZaEgES6GPIvNgQd/ObktJYeTlfa
	 sEZB/MXBvzHQq8WZkJ6YfOyq3KyeeULPr4SBca+R17Lm/Gi+SKmQFelPaF8zljsLWi
	 Xff1DI4l3wOUSx9agOgRWOJuc9QZNb4bptVGf6Wbquw0qXpJRr+Eympc43oHgHLhdn
	 7GTq4U4rAs18aeYGgxCUnCEn+P0lbYVr6PfBzymytX2fm0PpVx+sORpV/jx8fjheXB
	 WhBP53QjT6U7w==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 80C0F4012B;
	Wed, 11 Dec 2024 00:33:48 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 60225A0082;
	Wed, 11 Dec 2024 00:33:48 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=pqZ93DqB;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1EA28401E9;
	Wed, 11 Dec 2024 00:33:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnVmDxoBWfwgnqhGD5enPBbRJ6KKxQdP9EkInjXuPLBegfFT7nhBHHfZNkR45SrvwsxKvMR1KuwYOm2DwpE/GSL+ifSuJOrBVzvBbta8XQUYaltS+1Pam+asJAxPq/c+iAGWB9ymWtpBVr2mZgOMCFVEgaNZqEmJ/KFDDAlfzyZ237XmhcFFLrsYS2MYh+vIYL5IjKTRw5MMKSWCLo4xq8ZRskDuEeY0zwEQONx4RHBnOdKTFlfonYp6naQpMGnl6cvUmL0fDybINV7Rw35iaJ9DVf6nPr2gvVWWmGBjOKRrKzfiaomaZk/AuurzyV3nQcJxbbV2HFspJeT3G15++g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0oBiYzwvtCSuIZePvlIuhOaq2hACT7HFmKFR8MM0LI0=;
 b=wH1sFro5006y88NCcXvpYnFehUKTBr8iK2cVoMuDPAZ61vUuSheyem+h8IWEPBFWWj9oBL7WwGuohx2EBxY96WAroOnv35ZWGGC6s/DnTavx6DwJD12HAA9ZNgAPKyC4npdq6a18Xjz2lpPUkyqDa888PEZHBRWnVRXPHDTgQ83+fN+0Gh09467a2BHreUIUCMjgzDJaDKir4uGR+Ytp9fKnXPtIDXaBHI710kkzLyk0RleTmC39zL0iML0ndiBOH+TSGcRQdeqmPWOAZoXXEJRqqcZm5R7R9Y4vZ/j/61Vu32AqNG8QujKUUpqSfujcR15vZnK0OYQIxtS8d8R/ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0oBiYzwvtCSuIZePvlIuhOaq2hACT7HFmKFR8MM0LI0=;
 b=pqZ93DqB0EQDo+gKsrV/rWWdXcE0OOn12pbHX/B2Slq/BI4VXhITKnjhL40ikXBlWAWaGe/fYR2GwbEKdtK0uIfiQqhSYjec/4D2svsVRrZd11DsiMMu/u/JB1xgC9U+GJ/euU9WKtmjxqSRYZTbaKoDu2jP86tjbwc6c6P+FsI=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY8PR12MB7635.namprd12.prod.outlook.com (2603:10b6:930:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 00:33:45 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 00:33:44 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Homura Akemi
	<a1134123566@gmail.com>
Subject: [PATCH v3 22/28] usb: gadget: f_tcm: Send sense on cancelled transfer
Thread-Topic: [PATCH v3 22/28] usb: gadget: f_tcm: Send sense on cancelled
 transfer
Thread-Index: AQHbS2RW9FPQmof2Ukqr4QKSb+VIqA==
Date: Wed, 11 Dec 2024 00:33:44 +0000
Message-ID:
 <f2ae293c1fc39df4d242a2f724584bf4ec105ece.1733876548.git.Thinh.Nguyen@synopsys.com>
References: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY8PR12MB7635:EE_
x-ms-office365-filtering-correlation-id: 5501b1da-e32d-4388-c733-08dd197b787d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?OzZ12lAHeYWrHz2NgUIqxHuFNSnKwzEuWq/FGY0Df7ntdpnGZtgcQ8Y7BU?=
 =?iso-8859-1?Q?vaMjumU4yFdxSM0uuSpp+Ba/9rtDs6S5bMH1e4LnFA+Xdbt3f6HCUQGQXn?=
 =?iso-8859-1?Q?7c8FqVA0QWpumQc4XqYQHxVkLBhtOCa+EDEZVHy5JD1sgT/uoBDQGEQDHt?=
 =?iso-8859-1?Q?Cc3oCcxL+AOtyw7ZnPpzSNvU0dDqbFMVSbyOKhDzWOgiAEzfCXjXVtzcHT?=
 =?iso-8859-1?Q?hvC8qlJfoZJDjn3DD3rV61a6Y8b4yuyMEs4e9cRGwHAQOQ0N9QudFGw+aK?=
 =?iso-8859-1?Q?WRHl9jc0wKgB0mkgdW562mkG5cQuS+f+Myb16ng+D/IJL3iPkfrkS46ZM/?=
 =?iso-8859-1?Q?N7o+0fvEksDaqBFwEOI/263Ft18k2vKZIUZnCn+IWc11DfOfEcvUJ9Pzzx?=
 =?iso-8859-1?Q?oUw+dc9g4vcGhgEiISp1qOXMnAVzrM/er64T1biwLi8Dt+Cq5mI2y0/o/F?=
 =?iso-8859-1?Q?7qn85oEoweSTzrl4dBstS7h0a774kppPN+4e1AkCXOVH26ep2EZoYL2+cN?=
 =?iso-8859-1?Q?od2ciKMmsSFuMojtPB624pcATjQyzsLSugFbYvSdz8edGc7wF26bxdLIHU?=
 =?iso-8859-1?Q?1vwJc99fO/Dt37jBWeEd4kjlUqGMvbrasaKh1hSZQNaARbiFjyOWtRj39K?=
 =?iso-8859-1?Q?/UyZj/Hzbf7gqVs2HFkWfvPQEVDC0sODNhDOlOeHm+5oJXPGVuYTHVx9fg?=
 =?iso-8859-1?Q?32Lr0IScW/eQ59hZiFlu+0jyRIa+5sClLJX07MgTFY5YF+VzybnkvxsXap?=
 =?iso-8859-1?Q?Z35vXSsAyPppCa3wQB+qmv1ZiTjETYiQ4FrsucJtXGJOrzusXjC1katddu?=
 =?iso-8859-1?Q?Nhsi2XickmiuyH4505lGgSC4wHH86QwBdH2/RSNgMyp4Tv85FI8MgGyX56?=
 =?iso-8859-1?Q?Vt53oQ0zTpav/MNSOGNeqkFOrI7DFc+Kd8MCmVSOlPJfq7XfKA52VaXf3s?=
 =?iso-8859-1?Q?bqT+7A3FNL/lShyfVI60KQNtCJggMzAYipOr4Z2aKYSw9bQLznwWx1k1OV?=
 =?iso-8859-1?Q?cI5MTmoUGQfbnXfw2zdAOLIAn7nieYV7LoCMaPzPQp+Pz427sciAUURe+t?=
 =?iso-8859-1?Q?5oX+/xBlw4YTlZ2+Q0pAJVERm4ENZmoIG8GD/WhNb+u94ds8IhmPSy0/wg?=
 =?iso-8859-1?Q?nvokcSDMUk7QK2Wc0lEWb8nzkr0GFZh8ERnY9sFHvRIW9l4ibxNtL70dtG?=
 =?iso-8859-1?Q?BSQhsTyMhBw8eyoCDqUiLc1GIBIulJs64jyqf9iP/I9oHa7sIahvAXLy0h?=
 =?iso-8859-1?Q?hsf7TNu0IoE+cPaa7YVC3qoDLx4Zyi0bxqySRumWDrwz8dmnBKwS29sbes?=
 =?iso-8859-1?Q?0HavV0G1gx19FElHUWzD5tM9vwz9dYh2pbw+mWZRSMx1DbgQqCN9J8cLok?=
 =?iso-8859-1?Q?CkaFtlwXxb62+8KXqjSHUU9TS/lI2wvOiqdfWM7H6iG7xELj72tfAf3ktL?=
 =?iso-8859-1?Q?+jT3kXQ9r/gCApBn2JNyA5PCOJmwxesF6qQbtA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?phUf50iMRBLJPr0OMznGs+fVJfg/k4/nqB0fZkcPnyq26kzxrWOufvK+Lh?=
 =?iso-8859-1?Q?pKRZmbChLYXg3iqbJ0iT2NQGO4Dg+D7SQUNQjQyrVtCpM4g/lXqh/KHrc0?=
 =?iso-8859-1?Q?wfPV+Yqr8tWT56E31FI0xMEjMHDajYPrpFVU7hF1OTUIjWYSywGYOcPIbN?=
 =?iso-8859-1?Q?6RYjUP+hl03xf1ui05DGPkhdNLvvurFmAqVlt48oEc9uOVqAaBbo2G59DB?=
 =?iso-8859-1?Q?e8NZ2IEF7KCz1kLBE3xIDPdvBJG05mBG6ROVDInE31tgl4166sK+dmBcuJ?=
 =?iso-8859-1?Q?wt7ckziiyd6pCFfQrInuE9p06197vHb+RG6AaHMQ/kl+Bezbpk2MmjFfQQ?=
 =?iso-8859-1?Q?XLRC1gF0U1BQ5dbrzAhT8+9ISzDMqa5Q9jVTRePQZRG2pG74taytVvS+iH?=
 =?iso-8859-1?Q?Z0XrQ/bMHQveyPulTuP4dSwtbtPIyUVmPRbCkaW1hbSMX/OZHlHSmTHDJt?=
 =?iso-8859-1?Q?wR9chCIBJQpKYcZLjmN6xckkNquDwzlpkF994hSpnX7xS09eCmHwRf2C2F?=
 =?iso-8859-1?Q?uSJTLdOSRcrxSsOzrfb24MoL/ZbntGqtfwVaUiH2Kde162G5Umr6LaV3RC?=
 =?iso-8859-1?Q?YRcm2oTCzv2VEqAuocXBF7a8NtbV1CSg6AjaLdu0WOUtOJVvMBByrq2iTr?=
 =?iso-8859-1?Q?jH4g4i0601As949hn2Soxn4dOBSM0JRdryoZoali1I4vCKkG6Mf0mM2Ld5?=
 =?iso-8859-1?Q?nnYnXzMvs+4zHMJUUCBn92byCCu2SQQ4/Td73FynVfemsZw8Mz0tca5TvS?=
 =?iso-8859-1?Q?o9sBOAZV9441BXJT/0aQs/woKwuHLSlTP9DReO0ll0hMTUwmgaEOs09n57?=
 =?iso-8859-1?Q?wVO6W5mRqPKHZW1gNCaBW7xyFN/88Qw+OybSI4MStz3gbCBDbs7zHcgk7f?=
 =?iso-8859-1?Q?VuTqjvSK7+THUQ6+AqrN8sLm79f8SwcTugh1GSI9oXV9nwA6TGseZJTbYJ?=
 =?iso-8859-1?Q?Vi7Yz+9vqVSE1Vtv7dK5xscu0Coxt4KqH0YVLxaAA08WD17q+mq1E3swzr?=
 =?iso-8859-1?Q?8GsbhVhzB5KzJMQlUMHP8UJJRhYjbfnFuwH+esO4CjWN2ny+vMkAFExy9y?=
 =?iso-8859-1?Q?MU1jZ8lvixRHzekZ0t39esHZKBJ+amk81k8pn1Uq9MCVisX8GNgg1Netiw?=
 =?iso-8859-1?Q?kEHOcIeyLFuycF3v6YkTW9WAM9d3Vy5/wkMzq0eGYctVvcAv7488NEkXs+?=
 =?iso-8859-1?Q?WMEOduEWZynkE3hqm2BSXjmr1r23WsX+GWDaFfuVTGsnCizomoU/C2VYBg?=
 =?iso-8859-1?Q?XwCm7jo3LjPWREvJLTEA+mKIHMvKy3qOAY5++LsavyK6vpYn0bn+36LXoV?=
 =?iso-8859-1?Q?AeFKxxjmBvw7XCB+HU75oZTWwU3lvGILeCSUvoWtTtfZqNusB/qiuXkR91?=
 =?iso-8859-1?Q?CpI/OcW3/xrJV7mUPLrNdO6Uf7SCUBxpGuJNGIqBLa66DGR4IwLSchj02B?=
 =?iso-8859-1?Q?hA3Rgx6sL4GhZLx69M6GnIE1l4KaBw96sQMsOrrZ6ZEIv0/UNAWAQ3kkcC?=
 =?iso-8859-1?Q?8hx3kBXB5F6V0MJrlnGV/DYlQ6PKW5f4TFUppoPr+hMz3nwrQ/elYBZWzX?=
 =?iso-8859-1?Q?KuCFJpaIv4iTqiGUXzFthuG74dC714CIT3gevVdy1eyUPsJGFS5B9iF6L7?=
 =?iso-8859-1?Q?EzIQqqxIP0TwOrxQPshhbgdPZlFqOfMXBL4AV/qwfdyKQ1Jttgb6mhFQ?=
 =?iso-8859-1?Q?=3D=3D?=
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
	chsLKoQm+X0olRpCWpQKMkXGMZL0s+SrdKSI4GUfr+QqhPtNnHXsdj7I0wsYxvC/yJjkJSIN6SX3Dd/D1y2c/rtr1Jkk7fwPY+80Bct1ZnXaQZDuC5kEyUwXs2/NS2QS2tZf430Ls86Bsw9VJN6wWl3v2QE7X//ugTbjwzUdF4ux9C1vKe5QB5Bdavty9q348+JCzt8EQ0vuGdhfSDJ0ifoZBQzPL6UzLaIG/+g5giRZM2xYYK5RAZka9XS69e+qzxP3n4a5tL0rrRw3jO/wDJRV9DywBMBUyWqpirSXFpz19g2qbgqPyYureDXdx6YM2mBJ+lHmLiiV3UVkZBaoto2OEJUxPBz1Lzj06eMwcoumweZ3XY4J6z9WjCT4inC8DI4r7F89Td7bX6i6KrBNuh976vOLK513d7ra7BXnpsfG1kQGpTaHKbqvgeW9ywCs75idJaQvmz7h6Cw8c2jwzvBXJHyTAjVcTXYR2KWtvWFYuXQtL+ngXR3SfOWuaGFaHRr3FSf1cqXrr03e7L5ZIgHYfuIsqlZGW6aHZlUueJR8w4YZfVcON9mJyrTFbzXlKEyulDOxof+o74DK372QMyi621WhV78e2i8FlITVLH2VRnSTO6cGRhgqmL2NhSzi/Je2hP5ddw/UJKCt4dT55A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5501b1da-e32d-4388-c733-08dd197b787d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 00:33:44.9602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Mlr7D4rc2Tty0ppT+YnsB1RM2EAy77MbBmnY73GdUo9j0WFPTojpDWn1NTWdoWE7wqJC6BgURHdxn5WqeXWpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7635
X-Authority-Analysis: v=2.4 cv=d+8PyQjE c=1 sm=1 tr=0 ts=6758dded cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RZcAm9yDv7YA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=qYIINIrsRnFWRYGy51QA:9 a=wPNLvfGTeEIA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-GUID: 5MK5wF19Kyd7-hyrksLvpvWNPfq0fs0F
X-Proofpoint-ORIG-GUID: 5MK5wF19Kyd7-hyrksLvpvWNPfq0fs0F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=824 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412110002

If the transfer is cancelled due to a disconnect or driver tear down
(error code -ESHUTDOWN), then just free the command. However, if it got
cancelled due to other reasons, then send a sense CHECK CONDITION status
with TCM_CHECK_CONDITION_ABORT_CMD status to host notifying the delivery
failure. Note that this is separate from TASK MANAGEMENT function abort
task command, which will require a separate response IU.

See UAS-r04 section 8.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/gadget/function/f_tcm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/funct=
ion/f_tcm.c
index da594767ba98..c6bdd6023588 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -948,7 +948,8 @@ static void usbg_data_write_cmpl(struct usb_ep *ep, str=
uct usb_request *req)
=20
 cleanup:
 	target_put_sess_cmd(se_cmd);
-	transport_generic_free_cmd(&cmd->se_cmd, 0);
+	transport_send_check_condition_and_sense(se_cmd,
+			TCM_CHECK_CONDITION_ABORT_CMD, 0);
 }
=20
 static int usbg_prepare_w_request(struct usbg_cmd *cmd, struct usb_request=
 *req)
--=20
2.28.0

