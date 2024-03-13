Return-Path: <linux-usb+bounces-7916-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA1E87A4C1
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 10:19:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 444A9282B71
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 09:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407851BF3D;
	Wed, 13 Mar 2024 09:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="E41YKPGY";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hzd1cHp6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="P3QsjV4F"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D816D1B967
	for <linux-usb@vger.kernel.org>; Wed, 13 Mar 2024 09:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710321540; cv=fail; b=V5dJJSHuVlH9ugd4id+bv0YoFzNGEXymgdK28ZUol2QgbLqSn/xl0YXxn4np+VXsyJxoE+JaS06LcfnlmiLWa3YTpPOHYOyFr91bSEK39GmVhnWQFOJ++ggTeLvfJnSkNPza5ShtyXrb1/wVg+H9jhFKIn8J/JbAHOaQ21dNWq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710321540; c=relaxed/simple;
	bh=9L6XyGnY6UiFrtSYPaS55ZklrDr2LSuQnfMItTk7T0o=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OxwAoBKdzTRdsVSyB2/W2RdlIIPeFWDCE8Id9bs8iCLWbGdcWyDDBzJXZ9i2GMcW/5eW0b+xGGTmgxmXsNJlY/WU4zrSa2CF0/EYOen4geylJocJXeJGIe0R2rFbNTbCXDLmU9DwhEAqxaAF+h8X8JLs4+4AYUwl5sXYZqfbNXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=E41YKPGY; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=hzd1cHp6; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=P3QsjV4F reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42D8Kc2e020318;
	Wed, 13 Mar 2024 02:18:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=pfptdkimsnps; bh=cjZ6
	WyQKKGnnae/60OydciWQsE7BQHCr1bHb0SnTFPQ=; b=E41YKPGY4RnxHk/7191B
	IOFGBmGVMgA+QpuxMoegaT0179eufqxzFaWH/YUObKWkTOQT61Dsg9l2sLHOqnwO
	NZdTeLtgEApMvx31dpw3dWpzraCMBHi/l/xg+gO6KB5xcHAWDsItR8b9vwRcGMPo
	Gr/JPuXICrQIiel0P2g9T61KBPUD6Te9dfFQx6EshdIBYk14EIxFn55HnPqkCT/Z
	buqVX/xavn0NbZJjVeH91p/2yOV07xFLPilD+Tuh7OFYArh+763NagtSw/hrKzvA
	mbHD+eiGqHyUVijstKX1G2lklgkq79F6Il7leGbZMhL5/h9d/OHMINrOQ89fh453
	GA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3wtugwkg08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 02:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1710321527; bh=9L6XyGnY6UiFrtSYPaS55ZklrDr2LSuQnfMItTk7T0o=;
	h=From:To:CC:Subject:Date:From;
	b=hzd1cHp6V5q6N7XDFcJ5F2Nt9DU32fTi/q53dH4fMEjRgUJ1wqPhBQ1ebR4Pehdgb
	 3rw80kCn+x+NCh9hMYu8cPhti6Doo0QBt8ZWWNGogzh21lcxyaCvqZ5/MpCDozX/wA
	 NZHeEEso2EEhFbDHlEtpALgcvbLka6Nk52yoyoIn5Z8D4HMXsyYW0/8inMev6ChrPd
	 KoZ13O9+/kZXq0nVrhkbvWomog7sF8x1cp5g5aLOpUt0MgHLEUBEKMpxM6wAjfaR0x
	 JZ0O59/suI2t1JGn3SMl26VxRUHdI8xopDmcW5cWjb2SZYU0sMtjM/mgrCsJ/4TRQT
	 Prib4diAvOfEQ==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F2A8E40453;
	Wed, 13 Mar 2024 09:18:46 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id CAD08A0090;
	Wed, 13 Mar 2024 09:18:46 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=P3QsjV4F;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id DF37940549;
	Wed, 13 Mar 2024 09:18:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0S9lfnK8+75jCuKbeX6YSb2nJNC8qpt53Q1jYcgIRQtPp+8bNoeHkzr2JWNrgki81j7XEJMKQ2bIHImhNP+ZOj/jsPkiqIaZ1mWZJgw1yeC+U5SoSXoms+ZclbSHncuxe+HAtaBJRXq0mYlm9tLHz2uMM7kur5JowbElyYqeRz7DqkjJGu82+oT2l2V3eICdF7AuMZ3EX8FTEDnTkj882+fyNTf07kqOij67XmfjAmMafcWPyAQxKgLHdPA5JYUVBfzhDmkLBQ95CjWfgJQq1Oj7vCc15X70mOsLUqdegh3MPSGaLMQtRWQkVbeFCW9n8ABWRSECp8hS/RCdZ57og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjZ6WyQKKGnnae/60OydciWQsE7BQHCr1bHb0SnTFPQ=;
 b=g42CZ6FMU0lql3VD3uLjEhQMRbpMTE98OKV0H4NyCmWoX0Tjqu671J7cS8vq9xuOPL5vv1Opp4zXZN4c1deFXRAn52k96C7rRGdL+NjXj3IaracQH0MiEtULk2kuweQfeT2Mq3s6FJ/r0dsI2Wxb+eg/AhZlug10Ur4QoK7lQd+XjCuBCtfOkFyIUhFwpRcJ4DTQYQxuzUPlG/9gBEj5s6nJ43rxHz2xBKV+u+jCAOwLNDra3EPtd10AU+H92aUC+wPExZQKTyXidlnmWapqXMBXwljqCRtWS0//hZAX7BNncNCe3lJnFcmuZpHC++1w/eLk/vY0miQlbOQpqA7Bhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjZ6WyQKKGnnae/60OydciWQsE7BQHCr1bHb0SnTFPQ=;
 b=P3QsjV4FStQYo8fr1BZaYY8OmKGHtTxoxOJ3Sev0tkkbKZyfyZT9LOcz68hoeen01bUy3daoafEXxWp+TSa5UzEIGsBxxGgjig5NbajguON4m1WYP1lSooyDOqULbavOSeHR2aq+AW9PyrnSksXxiL15TVRi5VuDAKuqfqwVPN4=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by SN7PR12MB6910.namprd12.prod.outlook.com (2603:10b6:806:262::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Wed, 13 Mar
 2024 09:18:41 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b%6]) with mapi id 15.20.7362.036; Wed, 13 Mar 2024
 09:18:41 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: John Youn <John.Youn@synopsys.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH 0/7] usb: dwc2: Updates for new core v5.00a
Thread-Topic: [PATCH 0/7] usb: dwc2: Updates for new core v5.00a
Thread-Index: AQHadSdwgSCk6guG402yfkmt8Ai+8Q==
Date: Wed, 13 Mar 2024 09:18:41 +0000
Message-ID: <cover.1708948356.git.Minas.Harutyunyan@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|SN7PR12MB6910:EE_
x-ms-office365-filtering-correlation-id: 9bfb4e2e-94a8-47b1-b974-08dc433e9350
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 a6tOn3GKXh7n9ol2vVOXr7kQcausg/zODz8wzLpzElW+MnspD4g3977QmgaZamHRbJwsmAGCG4mcF7YQJ2alS5DZetxO1tOu4pOkOlBnv3QvL1Rooca8cxTh7tJmnQktxuy4mY4V9d0c7bWXzVCCQ7yValzSSm6lWJ1sZLwwkMkFpbb0ChJQzI3CnwCYMqnWC+1aYaj1InlO76ClVedwCDXlf/qBTvFuLPhXFXHsuGJRA3NIBNVm2X6bba+wPdLfxJyOgrusoX9SipwGOFD0tlqUH/Mn+V+pDGI4kYZqz7A1HDsvggicyhi4AJ67jsRuL4uTENtpMiaEwn8GoqIz0nmuDiAUUfflsmdAXyRXod7K0BnvWk3ohH9Z1CkoorZWo/fF9IicvfBeZ555az/7BxMteBPOtMYK3rJHBpBrb+E94T50eT2lrfVN4/WaBBmO7N9I4ESzJ30VwBs3SfiSU63yrh6z3m4zFXT5j2hz+ZDOUtQatHrzoCc4TePygKgdBJFaEPzjL3KDaPPity48lajuCtjviRuSlePoOr4PGb8qBR+vLQYyZfad0IGI5bkGYSGVGOaMqVA+nNs2TmK+fhEIoz8IjXKUA3TU3wWY54zTOwrJv5dOiRMiVXRCIbs5753q+IrdVw0xuB2JCPaQIltZP0Khl21lOM8ERHVCjC11J/9Wzw/IgKJmSvmSRzLIU5vxaETgeObiKu0BtHBjpgTAM0OeaXK+3gdtmUP/VCI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?xDDNmYbRQvf6BkFZSAHMOx9OZ1yFYC1JgiZ81GpcPaCDwjYdtKtC7+5Zms?=
 =?iso-8859-1?Q?iwwi21gV7iGk+Z8vqI4kC9rD4CqwC1X9lq+EoCUj+yxau9ht6TrOpeFuZg?=
 =?iso-8859-1?Q?ZuGs1HV30wZJBDU5z0fO4GMVRy6gb0L0GdeL6oeCcWwFZS/Ur3mbw4PtFA?=
 =?iso-8859-1?Q?T4fFV6i4gnBp/2yBIGVpH89BzGpIz+z1RpRDIcnb6c20TErJbz1cvpbgw8?=
 =?iso-8859-1?Q?RM/ErCeov8hAiLOMESjj4Gjo/e2niC1pYn4jAhnZ0Rmr8dtrNQcZiqj20g?=
 =?iso-8859-1?Q?7HEFNg4gLno4dc1k1t7P5g9KFWeiuwXsnfBRBSJVHW4bg8tdVSV+g2zHld?=
 =?iso-8859-1?Q?lF0+TIHALt9q2cYDvzQat/kYYel0JSyjaBAeJ2glI739tuNKUzP8hYkb29?=
 =?iso-8859-1?Q?VqsZ51A38fJnhY8x632ZTTo0nczvwS5uzR8VQKkJ6xlgkBxXpfc/CiKPQI?=
 =?iso-8859-1?Q?XZjnEzF0GIYJuSgkxGhKbtZP5pYilAfrL9le2mCAHEiHD6v/QlXKweYFyL?=
 =?iso-8859-1?Q?DZlP2WG8vmwQAZfpmrNG5Cv48443K+KTOho8moHYG6HnaTJo/Ld4cnQBUh?=
 =?iso-8859-1?Q?dASdYf2i22VeSmZieqA2lv6FgDBT5rjRDJzRvuJFBZW99/06a5dPNZ9843?=
 =?iso-8859-1?Q?5g9scs9qT2xozH3okVPBBlTcS2Lo901agkQp7h+SO7D4Q0nwVEG3TBq4yL?=
 =?iso-8859-1?Q?wTatTBPF+Sqj9+ZZyo4wymYA5a33mb60YJxKlnreGEBeGhdlh9KHkhym03?=
 =?iso-8859-1?Q?QjFdKMzh+/wVdidVwFxkpkFy/Zx9AsZGqa/kj+SJUqays8TFBaAJjF7WvD?=
 =?iso-8859-1?Q?Ek2IubFZyzxUll59hf0onbySAEwbDYSPwkTZmsxfTh0x7GdXcMeHUqMKnO?=
 =?iso-8859-1?Q?BhA7tiEnlFGVmF5XKw9iO1kcqsQHHlRLbFNm8fEb3Q2xD3nihT35zAOySM?=
 =?iso-8859-1?Q?wPivXmTHixplkvCSelO+NI7/8IHqXiyDrZuy5nt6TBfjTLE+IrewhfmTMe?=
 =?iso-8859-1?Q?/zmlNnZ5IUi56OKleTaiF5VWbnm5gUHfQgfJYr2otKbKrcgw1byeIWv8tl?=
 =?iso-8859-1?Q?5bd5L/QkvG//AMJteQ5imnpz1RWX7JLZlRucVL00cAi6QNdNfabyyvmRzL?=
 =?iso-8859-1?Q?n7/3ISpduPlaBTAF5WwmWgmJvwmVGku/qo3w7ui3yji95gKqoeETJvUDlI?=
 =?iso-8859-1?Q?pyzJ14xiJb7Eo+adNRNrLctZKkIbBCqyVFMXDQfrtjy/q0BM3RXNqZtQBK?=
 =?iso-8859-1?Q?d5QWsAdgC5oRLBItzcuPDOh3Slsce1Yeny7e7sc5Ei5gsmfnUN0+rRt8hH?=
 =?iso-8859-1?Q?AtUwdN24e1KqvNDZOeyxBS0OL6n7qQR04to/of4fMIm9Nv7MLhpNCfhMQa?=
 =?iso-8859-1?Q?lGhkEMGS8A7o8W50qW0Bb2bMOTDtfAqWyVOTw+rbGnLlSU2djvGgIFTDrk?=
 =?iso-8859-1?Q?+7YNqpoMVbhXNo9W8Y7QPkeb8J4i3iPY8owBsQ5CFjGb+SKkcO3guejBWX?=
 =?iso-8859-1?Q?CXzKWUIoTzZQsX+JtCCr2C8xLT0aJQiurNCSN/SAhKLQOMvs1baK8wwGmI?=
 =?iso-8859-1?Q?g0JvjsoqokLZ4tD0I6/JmOo4PCma2TY5hf+HBfcVnwmOgLc4uAEu8FPSS1?=
 =?iso-8859-1?Q?V/zGHRWmsT64F2qIaAHvnQYhgVLIPwJORh?=
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
	TA0aPddXC6ffI3xRSnF8w5vDQ3nby28VSv1+3l9ZCSqZG2ycfHwnl2E+aNOA9FxdVg556OpwU5JuIIqZKLZcMNXz1UO5zYR1Mcdx5t/HyBabvmXuPYI0NwgIF5rRHQK4dcsjkc/p4YCUUyUkj1RYK+1Ydwd14Him4sQoXh9C818ho5D5JRNauPTr1Mu86Mk0FrPbp3DpYZxF8NOlh2WMvyY8HSaBFY3Unxbi1p432PUMzx/KEd+5HXQ3W/gHCi4MknuMFgjwsSMLIvHIhIBHS8YUi9G58wOG7VHGhnAuohCSAX9PC56HQsfFI3UBtT3+00hxtoZoadupMgTqmyk2cd453Rd4uaQE+Plf1qUjVaLsA+cV5TXwmnGR8cNUe1Walwhf5dytaVSAoDn8/1Yc2V3g9vgtpomkOxh9bS93xubtnSgrLfzv4912k8HGbZ/Jjgm21kyVoKVYss44MwBVDRCMr6mSME+4YjKH6nGVhP6PkU7FhWVb71cZu+6aDf3nAOOutSM8nhwt3pbkqk2LmSRVv93HrCV3vaG3CD9ckQq39zSYFo9gCpkPTcXHsLXGs3VTd3DshX4YzlvnaoLmoAQUTizritfsksEHI/JopoPANbl7r30i80YJZNFXYlOKm1wB+86wBqXW7tJlpF779Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bfb4e2e-94a8-47b1-b974-08dc433e9350
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 09:18:41.7771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HrZqmrC3gZxC15nf+ejA5TZ81vLONopcQ1im3004cNLTD2eT6LdPrRb34U0rhXmugfSbWg2LPH4DrL+3APG0OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6910
X-Proofpoint-GUID: j9_ABjWlGbQz47IDA3BCw_gN79SsPedn
X-Proofpoint-ORIG-GUID: j9_ABjWlGbQz47IDA3BCw_gN79SsPedn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_07,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 phishscore=0 suspectscore=0 mlxlogscore=972 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403130068

Patch series includes updates for new core v5.00a

Minas Harutyunyan (7):
  usb: dwc2: Add core new versions definition
  usb: dwc2: New bit definition in GOTGCTL register
  usb: dwc2: Add new parameter eusb2_disc
  usb: dwc2: Add eUSB2 PHY disconnect flow support
  usb: dwc2: New bit definition in GPWRDN register
  usb: dwc2: Add hibernation updates for ULPI PHY
  usb: dwc2: New bitfield definition and programming in GRSTCTL

 drivers/usb/dwc2/core.c      | 42 ++++++++++++++++++++++++++++++++++++
 drivers/usb/dwc2/core.h      |  8 +++++++
 drivers/usb/dwc2/core_intr.c | 26 +++++++++++++++++++---
 drivers/usb/dwc2/debugfs.c   |  1 +
 drivers/usb/dwc2/gadget.c    | 28 +++++++++++++++++++++++-
 drivers/usb/dwc2/hcd.c       | 10 +++++++++
 drivers/usb/dwc2/hw.h        | 14 ++++++++++++
 drivers/usb/dwc2/params.c    | 22 +++++++++++++++++++
 8 files changed, 147 insertions(+), 4 deletions(-)


base-commit: 13bd5583e987e8bb0b95dd7607b17e5938bf42b3
--=20
2.41.0

