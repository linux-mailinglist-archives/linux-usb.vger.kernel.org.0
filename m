Return-Path: <linux-usb+bounces-13163-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7B8949C39
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2024 01:15:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9C2A285580
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 23:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912B1176227;
	Tue,  6 Aug 2024 23:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="APGE7RKw";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Q38H7tCL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cDgn40AI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF3A175D56;
	Tue,  6 Aug 2024 23:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722986112; cv=fail; b=TWyS/x2m/mQVcIpt1/FljJ2kxab3xt22G9wV3q3V5142zfyX5UNzJczFuIq16CbR05U+231r5drky85nNMOdd4qmKGQ5LJ2BuxNAHqkNMCWzu9t5AIMr/m0HOq/kEhGr2mQsVGuPkpM5vfgU9O87Xfcti+Q9LJGUdUCyB87OeiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722986112; c=relaxed/simple;
	bh=EGrQpUS1QSd4wEWTJU9H9986hH6utZy0g36DWHvlGjg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gWRghLduh8rgpZGIgzebuHLzKm88bPpLZWelt12ZAqkXcYMwmnBy/IMYiPDThoGy5EtYSXuHUQRwuoWpyUNbgBBbOBcrqpIO9U1ZK54WRbsv2xqiDDt7h+1jpr3znFlx64UYwJZmA5u6A0l85wUAHbAiBAtJU2scXUCHX1yrn4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=APGE7RKw; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Q38H7tCL; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cDgn40AI reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 476MJdCK005100;
	Tue, 6 Aug 2024 15:42:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=EGrQpUS1QSd4wEWTJU9H9986hH6utZy0g36DWHvlGjg=; b=
	APGE7RKwmDx6Vj8AfnndtW/MEObMYW/hkg3sYtItR15NcMVI05g8x71boUtvTMbS
	Yp3PFKK4QioGMqe/iVjuI1tcNVu0YaZ9GmIwFiCU8ZWmaNQLmsrkdx1OJEKYvoej
	Pvx6qYMk01LWJNiyVad84zBq2xU+3DwCvo1WN3YEOXO0mH1uMenjUYWDiI+ZtiU+
	vgSW0OIxtkCkJ4fzIM/k9q6wjhnvdb63tDnCSHbFNUibZ4IYERYmloP1hZhPgbmF
	vZrp8zoFw/LsdVNCthz5/Dc6CrUaK8wypRc9jyw5BgSCRHqfX/pXBB2zhZeZLClY
	Ji6q5d7Q0O8sYPZAZGl4cQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 40uuj5r9m0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Aug 2024 15:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1722984160; bh=EGrQpUS1QSd4wEWTJU9H9986hH6utZy0g36DWHvlGjg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Q38H7tCLFoxoaBnoStu5ud2nZwYhDR+YzLqaw+OmRe6Ri1f4jSfdDJWchslRd/w0Z
	 Awp7tBOkcsJn2a5MLOZZGrxTA1gtDO1ZhuA+Rj6ke6AskHilAcnQ7Q5rp3lr7u2hIY
	 nkSbCWdEx2e3GSKH4ooskOLgVeAwVKDZZBnliEVQMX0GfkmXcmN4n4WXTqoxV0teeT
	 ZQGfwn9VhqCJ3MRpgpoZh5eyjOiN91z41r0ZpHJooQJgFANeQIPGd49zsKIV+qkm/I
	 Nkfd5xHpNSWPUl3LyXDd/XzbYPZGAQ6AMUC31ST0oGpcBzYWqnjCny530b5YYR4hrh
	 wlVcU1ovVUa6A==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 09B1440361;
	Tue,  6 Aug 2024 22:42:39 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 2288CA0090;
	Tue,  6 Aug 2024 22:42:39 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=cDgn40AI;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 11CF840582;
	Tue,  6 Aug 2024 22:42:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZuKC9m1Ou3EBt/GKzSFcNHZJQJg9DUJDpsNseCjha8ygFgTqFFGFaKbIbawbAkCoulc97hfnV/dl5woAnXLXg9xfS3FPPdjTHJu3M2yrhC8OMcr3azGRgwzoaOb2eMRwkN3XoBCq7plY4d5935JBPwCq2W0LI4bf9bxLLFwVCZdmNyS1rSc2LcTFZIdc3T7NWKPZTwQFyxtwwW/hjJ+DzOISKQKETx4PeaXlCsd25Xw54IU1t/KPtSL3XcrtcNXDTeWqj+F2GKlEWHLhnkG69dRrBZHdY4HVNxgl2Wk9k2ehCn1+2zWFpxhHTY5x1RrRY+aSZhuvgMUOWNanFe8/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGrQpUS1QSd4wEWTJU9H9986hH6utZy0g36DWHvlGjg=;
 b=GlXo65AThe2jgzVFi0nrUsoXLwklMZhoHfiK2xKk8xpOXvVlgbNCaTXAn7DwXGxp3nARB5MkE8V7cLv99JlUAFAJY43HHaUSxoqWN4LC5wpKjchg6LkY4idCWmxZbFH83Mu6aHYSPPeok+m1RfUV/k49szDfRu4FaqSwdWYW1eZ1lyCT8PoWRJ5n/0yzeIWuTVeqJigwZVpGCvZSNr6QTNltAMmchiM+ZJlZLNKhtJFiruhbmTllSAvSV2pWNGUU3G4DldQ30VXVOWHiZ2ZHPjzaC6An5krrSnuvjzCUGcKell8oqXYLE6SBQbIH7Z8w70592/z2l2IeVvVCTXCrUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGrQpUS1QSd4wEWTJU9H9986hH6utZy0g36DWHvlGjg=;
 b=cDgn40AI2sIo6uBSmd+/1ZsUJARQPWTNkVrU+J7ALdcqVMEIdd556p1hz0/exk5DIoj6CLslRuZchi08cGXrw2ni0FwSHGLNNcNs18B8o0wU6nOhgGlUeGN39fs7miiYirY1PXRzR1XqQj2jT4koRndBbCEVer3JNkBkU7Psd8s=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH7PR12MB7282.namprd12.prod.outlook.com (2603:10b6:510:209::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Tue, 6 Aug
 2024 22:42:33 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 22:42:32 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Fabio Estevam <festevam@gmail.com>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] usb: dwc3: imx8mp: Switch to
 RUNTIME/SYSTEM_SLEEP_PM_OPS()
Thread-Topic: [PATCH] usb: dwc3: imx8mp: Switch to
 RUNTIME/SYSTEM_SLEEP_PM_OPS()
Thread-Index: AQHa5/XU0UN2Xh98Pkyqw6lbJ18gNbIa0+mA
Date: Tue, 6 Aug 2024 22:42:32 +0000
Message-ID: <20240806224229.idg2hlvajlm3rkjx@synopsys.com>
References: <20240806114231.2603055-1-festevam@gmail.com>
In-Reply-To: <20240806114231.2603055-1-festevam@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH7PR12MB7282:EE_
x-ms-office365-filtering-correlation-id: d70a2579-4b16-474a-7fb1-08dcb6690f77
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SUlrVks2dUdDeE9Ucmd4S0xaRldjQUpIUUlYeGhHNjIwMUNvSDVEVWIvaCt6?=
 =?utf-8?B?Z1dSOXFqck90WWMweHJrZExuNjVLcEx4T2p6bUYrOFp5bVRmTjJOaVhqNE9t?=
 =?utf-8?B?eWx6WndTYk1BU1FOVWU2dE9RQXVpZXZ6RTRzYVk2eHFDK3JidkkwWlhyRVN4?=
 =?utf-8?B?QXpPNWNqSzVyMk1vNUZCaE5rNXZjSTZ4bk1TWGN6Tll5SnRIaWlwaU1Ta3dj?=
 =?utf-8?B?enkybGdsUUduck10TDVMU2Q2SVJkZkFlREsxVEYxMzNOajFmcXNVSm5hRkU1?=
 =?utf-8?B?N0FxUnhITVBxNFRMMzhRNjlxT24vSzdkTVQrb0lRS1lnQ3FUWExpbXB6U0I4?=
 =?utf-8?B?UDF1MTZpSVY4RGFOcEFrcVlGREVjbkhLNWZCTzRDcGVzUTlrd0ZHS3VhUjNZ?=
 =?utf-8?B?cWdFVDZISUZQZlJwNnZwQ1dxTUtkbXVYNFc5b09jWUZHS0NQOVlQNGVUNHZj?=
 =?utf-8?B?V0pQU2JSVXNRRGZxZ3R6b0o5d1laTmhtL0wwL2lOR2kwZGM1NWJEWUN2ejVJ?=
 =?utf-8?B?VFJ6VnQ2RmllRy96QjIzSzhFMEtUcWZvVVdaVytHMzUxVVZQN1dtMnFRRXlB?=
 =?utf-8?B?REx0cTRSRjZrTWRyNHF4elpjbGRKNkVUZDB6YVlhY1Raa1pES0t4emczZ1gx?=
 =?utf-8?B?a1hxTDU3UlRCV3g2ekZFajVUbXhwNS9MaDA3WGxNSWxsRUljQS8zYUtoeXhG?=
 =?utf-8?B?cm1QTjIrVTBkZzB6Y3hIQnhqSk1aM05LOWpSRVNwVHoybDVzeENlYk5yeTZP?=
 =?utf-8?B?QUNkUTE5RlUwVlFqL2pRaS9ITFdXVXFRTnpnZ1huR0ZDdzF3ekhUMitNQThE?=
 =?utf-8?B?VGtnSFZHejBWekVHVFNNWEdvWTNLZC82SnY3WjNzempBbEExSktlbU5YR1Ev?=
 =?utf-8?B?ODhXOHdZc0RjSGNJYkh1NWYwWUJNcWpWUGs5M0xsUDJSalh5WWVmOTE4eWUz?=
 =?utf-8?B?WnhoZmlVRXAwQ01qRkpkVnVwNld0c2NLYm5hanFYdW5rTjdMSzk0allwVGpB?=
 =?utf-8?B?S25mMTc1QzZrclYydk5kZU5ZdzN2WC93OHByWTIxVWIrS0VuQnlsOGduMVNC?=
 =?utf-8?B?d3ZHZk50VE5TMDZQNFFnYkIyTUFiTGNHaTNJczhZMEc2a0Myc3lvSTI3bVVZ?=
 =?utf-8?B?TnlkVVNmWHRKbDFBMHNPMG5sR28zc0JwbzhleHBNWGxBcCs5UkcvYVVoUzl1?=
 =?utf-8?B?VzllZThuVkhMbk42NkZjZkFIbTVOUldVeHhJbW5LMTBuWGZSYlhvMCtUMkVZ?=
 =?utf-8?B?L0Y3RDJtVERacVVPTExzQzM2Qk1OUlhPc0Z5TUVIWnhrdTFicm1zeklzSHd1?=
 =?utf-8?B?cjNmOWRheGFvVHlpU0F2YUN2K0dNUkhuc0dFSVlELzI1eitkTm85YjdLc3ZT?=
 =?utf-8?B?OTU2Qm1ZVnBKZ2dVTVlzb0ZFcEwra3d6T2VDUkc3cm9XMCtWOTVhQnN6NTht?=
 =?utf-8?B?MFEyQkQyWjRVWU1NWDRSODdCNDBLU3A4YXJlZVNibVRzMENxd2Q3RVdLaHJO?=
 =?utf-8?B?QWFnWENGaGxZdWwwSU9KeWErcW1VS3Fac3pscGcremhDY0NzTU9SdklockFM?=
 =?utf-8?B?WFAwSmxMMEFlWjF5SldVQkI1aSs0aGRsWWd4bUN5ZGNWWWRQbUIvekxEemtS?=
 =?utf-8?B?WFp0WDlhY2dhM253R0VyUDBkMFRuM0p0eGk5cU9hWWxUYXhNR1V4aGllbmQ2?=
 =?utf-8?B?bjMwTW5ZRW9IZ0U5VzVEV25sTHF1ZVJFeHRQWE5rVjJjQ1pwL1FIUE9NL1BC?=
 =?utf-8?B?a2k3VmVReEVVbWVBT1BqNUw1N1ErenNubUxycVdlN1g4T1FsZ1FINW10dm9k?=
 =?utf-8?B?VzB4MXNKa3hQcHZpMHBxSGtpTnAxdXpvdXFrWDhBV3lzRW5XQjIyZkN6Y3Vu?=
 =?utf-8?B?SnZMdFFvdU1ucUFwQWQvMXVZZ1YzT2Y0RDgzbE0wcWZSYVE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YlFpOTYxV2EvaElnNjFpOE1Ba3lUME5mQ0p0clRpNWdDOVlGS0R1WWNHVExk?=
 =?utf-8?B?bHR6VFRXdnJOeldKcUtzUXdVUDNJU01JSGtISHRGei9rQjlRdC8rUys1dFMy?=
 =?utf-8?B?aWZuUnE3VTNNeFp3STBSdjkwblZaeWVhUGxIVnlsdFkxWUQ5akV0eHR1blNl?=
 =?utf-8?B?RnlycE5idHVSL0hycmtNbUhPNGE0ZEN3dnY0OW9zb0RiUzRZcjdkaTgyekhK?=
 =?utf-8?B?eHN5TkNxNlRmQ3BRdmlud0RaZ0xBR3ZEWTNkY2ZUN0JpUEZJSlFxOE5reHhX?=
 =?utf-8?B?TzlpQmphMmNUL241djduRUMrQy9WR2VlbWQvS2FrZ0Fldm01OGZhQTBuUnJS?=
 =?utf-8?B?aXFmbFJSdS9WTzAvQThaYVR5OW40SFJjUmpnZHFxblhzdk5xTXRlMXBEU21u?=
 =?utf-8?B?bDQ4Y2o5MnlOTThiSDV0RUFHY1dyVk9Kbk1pU2N4TUlJV2lqOFJqenlJbksz?=
 =?utf-8?B?cUNZRDQwODdIbG1YYjlkUlpvZVFFQTBhVDlQUlEwWGp3dVFvUCtaZmN3WDl4?=
 =?utf-8?B?cDNHZEtwa2tuci82Q0xvQnMrN1Q5Z2NhUWNLa2RtRTJsQmhJRk1HZnFyNkht?=
 =?utf-8?B?T2NsTTlzZm5jTnhuRnYrbVhsbTE1YWRqTXduWVM2WXptQWlXL2VUSTNJWFdz?=
 =?utf-8?B?UWJ2MUw2NWs2MC9jMHBIWjRQWm9Oa1JkRmRoVHpTRlZPVWxPUHZrVGZWZGoz?=
 =?utf-8?B?RHh1M25IZlJuNmZiOHJ1aThwdVgzU1BnNVNUTWl1SngweVdyUHozbzJjSTdq?=
 =?utf-8?B?MzdrVEV5SCtOQ3dwOG9YSkFxVldwZnhmalpFYnhwd1hDMit3OUhFRUxCSW8r?=
 =?utf-8?B?QUpyZXBoVHFOL0xBVDZ6L2NCSUV0UWxRR2pJa1ZNd0NVOHczcTVBeGhTb1Jw?=
 =?utf-8?B?bWhrY2Joc2FFMTlmd1NUeW5aUk92QUgyVGs4WTZqSG1zTTNmei9zRjBCYWxs?=
 =?utf-8?B?U3RMY0dzTWtEQXI2V0pxaFhnVjJ6MGs0eGpzeTZFTGlCclNlSXg0MXdmV2Vi?=
 =?utf-8?B?d3cveGpNS25jdzBHNkRvVjFSeGRGd09XemJoY1hZclFnZE16anRlbmovbW5o?=
 =?utf-8?B?SXNxK0d6QWQrbjIzSkRTVUtpMW44UWhOaldIck9Kc0Y0cHlOcEcvZ29mWWRF?=
 =?utf-8?B?RlVmRVNiUXVMREo1M1JSU29qK2I1bCttOHhveThIZWhoQ2syVDBEWGt0R0Z1?=
 =?utf-8?B?Q2l4ZTJWZ0ZKVHNGenlwdERCOGZiUEg4Z1hsWnNUNGZGMUhIUWkxSlBFS2sw?=
 =?utf-8?B?SzhWUUpKRXpCVkNuTEd4YmhCOXJBYTZreDhkdW1JbkhNVHBxbHg5SW9FcUhI?=
 =?utf-8?B?N25rbnpaVzIyUThpUk9adEszWXdRR0FHYmZzQXJuWDRSVFUyMXFJeHMrNEFX?=
 =?utf-8?B?WHF0Qy9xUnBYbjNPM1dPdVFlTUtmZFp5SDYzc0VJSGtrVmZ1Nk0ra211Nzlu?=
 =?utf-8?B?eVZDRSsyTm9iN2dkbDg2U0lUVFEwV0dCblMyOEhqeDRlTG9jWndtSXhDUHlr?=
 =?utf-8?B?Ukd6YkdsTm1vcXFoWGJBL1RlWDh0a0ljT1dTdXd3S3Y4ZmNsMGZPcGVsSlN0?=
 =?utf-8?B?VEZKWkt4OTR3QXhacEFkTHM4OUtCM1AwbFV6QitxQ1g1cGs4bC9XYnBlUDRJ?=
 =?utf-8?B?UjJVMjB4WnZvcHBIeWV0dElWRXVBclBFUW42OWZTT1ZVaVl0VEJXOC9JeWpE?=
 =?utf-8?B?N2gwNEg4YTBhaXc5Z3prUG5WeEptSmtPMEdVWGxIWDB0SHIzUWxlc3JrY3Bi?=
 =?utf-8?B?TW9sNTFiLzVNVWdYclBMdEJGSkVvelB6b3JQejFQdW1HV1JNK3ZKeUdaUDB3?=
 =?utf-8?B?ckQzaXNEakYwZHM2T0t4ekhUWG92QWZBR2IyQ2ZFUm9UUkNPQ01JK0FrMm1p?=
 =?utf-8?B?dFk1TFE2UjRGdUdkaFAxWEQ4TzNJNXlvVTVGN2VRQTJWSm90QU5yVFc3Yktq?=
 =?utf-8?B?b0prVnJLY3VmSnVxT0dGaVpSS2VkdlVRc09hZzllczNjREs4KzhmbUUyOG0x?=
 =?utf-8?B?Nmh1WnBhdmpuMXQvSlZreGIwNmFsQjRDR2h0WE1vdEJKdWcwNkJDUHNyeEVC?=
 =?utf-8?B?bS9PQ3YyY1BPdXcwRjRNSWF3U005RXB1NzAwU2xwYktvRFZzTEw0M0QvTGtG?=
 =?utf-8?Q?mJyB6WSKz61275P3HnRssUc/t?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BDD9FBBE03D0784297EBE59F0D55615E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	D5TM9Be8NhmIjy0pA758iwCycQl+4/U9bAlJaxT76hcg/pwNoj3l/vIUerMcFznocywzYm1PcyISfmWLWxyiPz+5YU2FM/lWMqStnScO3phCOI3pfzqMzBF1IrLJSwtt7GViTikEjVpUtrXswoBA+8Rumc7LcMPnZJEvvMfER2brJsAmbYMsQD1qLOpT9iIIo1CDAl0Tx1RFFHVerMRROJGTtIhq5CYHa/jYrv+r73mjd+wcgZNJYNsDjVemWWjVeUMfoU8CReU15lJDMSK8PrPXKyhZf23tE0sLyEYe8lfRsYa7kup2WFFP71mlmMdslylbGWMz1q+B0vQI+h8a7uko0Zq+zj/7zaA7rYWdqZujwYQt52h0TCuD9rtnDiW9DHL2MBmL+mTs+KQLCpgpJXRt1eVfm6XpwLrfHsMgIv0SyrVnVzRohJjf7kFU3pJsSUbOLejttf6S/2IGZ4mereu7Oh+fZ2B/1DZqpzwCpwALao1xKN06hPwHthyj8CYUI9LQiqt0gixCX5GswW1h/h6iUP8P/ibHuBjVaLMvqKhGQIlzdjJIrM44EXwTRYi3WWtD+0ZW8bPfikHrGvH/IBGJrTMFGs4tu7TP6gI35faDqpYIZVI07MhRCvQ1H9luQjc/f/QLXDhf+FfEaOpEPQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d70a2579-4b16-474a-7fb1-08dcb6690f77
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2024 22:42:32.6837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r9o1YHVvVfR0LUcZSYHY396MhyG+GF1S6QGMY4/1kszmcEy9/bR6+rSvQ38JBJgjnJybOh6mts2t7ZiPHVJhoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7282
X-Proofpoint-ORIG-GUID: mqkMuS5V-MCAK0ZnPZVBSsfB1JPgMTfj
X-Proofpoint-GUID: mqkMuS5V-MCAK0ZnPZVBSsfB1JPgMTfj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-06_18,2024-08-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxscore=0 phishscore=0 mlxlogscore=967 clxscore=1011 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408060160

T24gVHVlLCBBdWcgMDYsIDIwMjQsIEZhYmlvIEVzdGV2YW0gd3JvdGU6DQo+IEZyb206IEZhYmlv
IEVzdGV2YW0gPGZlc3RldmFtQGRlbnguZGU+DQo+IA0KPiBSZXBsYWNlIFNFVF9SVU5USU1FX1BN
X09QUygpL1NFVCBTWVNURU1fU0xFRVBfUE1fT1BTKCkgd2l0aCB0aGVpciBtb2Rlcm4NCj4gUlVO
VElNRV9QTV9PUFMoKSBhbmQgU1lTVEVNX1NMRUVQX1BNX09QUygpIGFsdGVybmF0aXZlcy4NCj4g
DQo+IFRoZSBjb21iaW5lZCB1c2FnZSBvZiBwbV9wdHIoKSBhbmQgUlVOVElNRV9QTV9PUFMvU1lT
VEVNX1NMRUVQX1BNX09QUygpDQo+IGFsbG93cyB0aGUgY29tcGlsZXIgdG8gZXZhbHVhdGUgaWYg
dGhlIHJ1bnRpbWUgc3VzcGVuZC9yZXN1bWUoKSBmdW5jdGlvbnMNCj4gYXJlIHVzZWQgYXQgYnVp
bGQgdGltZSBvciBhcmUgc2ltcGx5IGRlYWQgY29kZS4NCj4gDQo+IFRoaXMgYWxsb3dzIHJlbW92
aW5nIHRoZSBfX21heWJlX3VudXNlZCBub3RhdGlvbiBmcm9tIHRoZSBydW50aW1lDQo+IHN1c3Bl
bmQvcmVzdW1lKCkgZnVuY3Rpb25zLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRmFiaW8gRXN0ZXZh
bSA8ZmVzdGV2YW1AZGVueC5kZT4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtaW14
OG1wLmMgfCAyMiArKysrKysrKysrLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy91c2IvZHdjMy9kd2MzLWlteDhtcC5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLWlteDhtcC5j
DQo+IGluZGV4IDhlZTQ0ODA2ODUwMy4uYThiZDA4NTBhODczIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL3VzYi9kd2MzL2R3YzMtaW14OG1wLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2Mz
LWlteDhtcC5jDQo+IEBAIC0yODIsOCArMjgyLDcgQEAgc3RhdGljIHZvaWQgZHdjM19pbXg4bXBf
cmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJcG1fcnVudGltZV9wdXRf
bm9pZGxlKGRldik7DQo+ICB9DQo+ICANCj4gLXN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgZHdj
M19pbXg4bXBfc3VzcGVuZChzdHJ1Y3QgZHdjM19pbXg4bXAgKmR3YzNfaW14LA0KPiAtCQkJCQkg
ICAgICBwbV9tZXNzYWdlX3QgbXNnKQ0KPiArc3RhdGljIGludCBkd2MzX2lteDhtcF9zdXNwZW5k
KHN0cnVjdCBkd2MzX2lteDhtcCAqZHdjM19pbXgsIHBtX21lc3NhZ2VfdCBtc2cpDQo+ICB7DQo+
ICAJaWYgKGR3YzNfaW14LT5wbV9zdXNwZW5kZWQpDQo+ICAJCXJldHVybiAwOw0KPiBAQCAtMjk3
LDggKzI5Niw3IEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgZHdjM19pbXg4bXBfc3VzcGVu
ZChzdHJ1Y3QgZHdjM19pbXg4bXAgKmR3YzNfaW14LA0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiAg
DQo+IC1zdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGR3YzNfaW14OG1wX3Jlc3VtZShzdHJ1Y3Qg
ZHdjM19pbXg4bXAgKmR3YzNfaW14LA0KPiAtCQkJCQkgICAgIHBtX21lc3NhZ2VfdCBtc2cpDQo+
ICtzdGF0aWMgaW50IGR3YzNfaW14OG1wX3Jlc3VtZShzdHJ1Y3QgZHdjM19pbXg4bXAgKmR3YzNf
aW14LCBwbV9tZXNzYWdlX3QgbXNnKQ0KPiAgew0KPiAgCXN0cnVjdCBkd2MzCSpkd2MgPSBwbGF0
Zm9ybV9nZXRfZHJ2ZGF0YShkd2MzX2lteC0+ZHdjMyk7DQo+ICAJaW50IHJldCA9IDA7DQo+IEBA
IC0zMzEsNyArMzI5LDcgQEAgc3RhdGljIGludCBfX21heWJlX3VudXNlZCBkd2MzX2lteDhtcF9y
ZXN1bWUoc3RydWN0IGR3YzNfaW14OG1wICpkd2MzX2lteCwNCj4gIAlyZXR1cm4gcmV0Ow0KPiAg
fQ0KPiAgDQo+IC1zdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGR3YzNfaW14OG1wX3BtX3N1c3Bl
bmQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiArc3RhdGljIGludCBkd2MzX2lteDhtcF9wbV9zdXNw
ZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gIHsNCj4gIAlzdHJ1Y3QgZHdjM19pbXg4bXAgKmR3
YzNfaW14ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ICAJaW50IHJldDsNCj4gQEAgLTM0OSw3
ICszNDcsNyBAQCBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGR3YzNfaW14OG1wX3BtX3N1c3Bl
bmQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgCXJldHVybiByZXQ7DQo+ICB9DQo+ICANCj4gLXN0
YXRpYyBpbnQgX19tYXliZV91bnVzZWQgZHdjM19pbXg4bXBfcG1fcmVzdW1lKHN0cnVjdCBkZXZp
Y2UgKmRldikNCj4gK3N0YXRpYyBpbnQgZHdjM19pbXg4bXBfcG1fcmVzdW1lKHN0cnVjdCBkZXZp
Y2UgKmRldikNCj4gIHsNCj4gIAlzdHJ1Y3QgZHdjM19pbXg4bXAgKmR3YzNfaW14ID0gZGV2X2dl
dF9kcnZkYXRhKGRldik7DQo+ICAJaW50IHJldDsNCj4gQEAgLTM3OSw3ICszNzcsNyBAQCBzdGF0
aWMgaW50IF9fbWF5YmVfdW51c2VkIGR3YzNfaW14OG1wX3BtX3Jlc3VtZShzdHJ1Y3QgZGV2aWNl
ICpkZXYpDQo+ICAJcmV0dXJuIHJldDsNCj4gIH0NCj4gIA0KPiAtc3RhdGljIGludCBfX21heWJl
X3VudXNlZCBkd2MzX2lteDhtcF9ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0K
PiArc3RhdGljIGludCBkd2MzX2lteDhtcF9ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAq
ZGV2KQ0KPiAgew0KPiAgCXN0cnVjdCBkd2MzX2lteDhtcCAqZHdjM19pbXggPSBkZXZfZ2V0X2Ry
dmRhdGEoZGV2KTsNCj4gIA0KPiBAQCAtMzg4LDcgKzM4Niw3IEBAIHN0YXRpYyBpbnQgX19tYXli
ZV91bnVzZWQgZHdjM19pbXg4bXBfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikN
Cj4gIAlyZXR1cm4gZHdjM19pbXg4bXBfc3VzcGVuZChkd2MzX2lteCwgUE1TR19BVVRPX1NVU1BF
TkQpOw0KPiAgfQ0KPiAgDQo+IC1zdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGR3YzNfaW14OG1w
X3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gK3N0YXRpYyBpbnQgZHdjM19p
bXg4bXBfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgew0KPiAgCXN0cnVj
dCBkd2MzX2lteDhtcCAqZHdjM19pbXggPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gIA0KPiBA
QCAtMzk4LDkgKzM5Niw5IEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgZHdjM19pbXg4bXBf
cnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgfQ0KPiAgDQo+ICBzdGF0aWMg
Y29uc3Qgc3RydWN0IGRldl9wbV9vcHMgZHdjM19pbXg4bXBfZGV2X3BtX29wcyA9IHsNCj4gLQlT
RVRfU1lTVEVNX1NMRUVQX1BNX09QUyhkd2MzX2lteDhtcF9wbV9zdXNwZW5kLCBkd2MzX2lteDht
cF9wbV9yZXN1bWUpDQo+IC0JU0VUX1JVTlRJTUVfUE1fT1BTKGR3YzNfaW14OG1wX3J1bnRpbWVf
c3VzcGVuZCwNCj4gLQkJCSAgIGR3YzNfaW14OG1wX3J1bnRpbWVfcmVzdW1lLCBOVUxMKQ0KPiAr
CVNZU1RFTV9TTEVFUF9QTV9PUFMoZHdjM19pbXg4bXBfcG1fc3VzcGVuZCwgZHdjM19pbXg4bXBf
cG1fcmVzdW1lKQ0KPiArCVJVTlRJTUVfUE1fT1BTKGR3YzNfaW14OG1wX3J1bnRpbWVfc3VzcGVu
ZCwgZHdjM19pbXg4bXBfcnVudGltZV9yZXN1bWUsDQo+ICsJCSAgICAgICBOVUxMKQ0KPiAgfTsN
Cj4gIA0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZHdjM19pbXg4bXBfb2Zf
bWF0Y2hbXSA9IHsNCj4gQEAgLTQxNCw3ICs0MTIsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3Jt
X2RyaXZlciBkd2MzX2lteDhtcF9kcml2ZXIgPSB7DQo+ICAJLnJlbW92ZV9uZXcJPSBkd2MzX2lt
eDhtcF9yZW1vdmUsDQo+ICAJLmRyaXZlcgkJPSB7DQo+ICAJCS5uYW1lCT0gImlteDhtcC1kd2Mz
IiwNCj4gLQkJLnBtCT0gJmR3YzNfaW14OG1wX2Rldl9wbV9vcHMsDQo+ICsJCS5wbQk9IHBtX3B0
cigmZHdjM19pbXg4bXBfZGV2X3BtX29wcyksDQo+ICAJCS5vZl9tYXRjaF90YWJsZQk9IGR3YzNf
aW14OG1wX29mX21hdGNoLA0KPiAgCX0sDQo+ICB9Ow0KPiAtLSANCj4gMi4zNC4xDQo+IA0KDQpB
Y2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFu
a3MsDQpUaGluaA==

