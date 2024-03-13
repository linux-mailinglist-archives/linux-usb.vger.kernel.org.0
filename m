Return-Path: <linux-usb+bounces-7919-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBC587A4C5
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 10:19:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 504DFB21C2A
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 09:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27591CA8F;
	Wed, 13 Mar 2024 09:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="tliXNBbx";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="a7kZA+P6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kZievUVL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0AD18EB2
	for <linux-usb@vger.kernel.org>; Wed, 13 Mar 2024 09:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710321581; cv=fail; b=uY/4sWgJ5l59lzc8fj9W2ZhurP55mZzbKspguZ+kQo4oHp2fGNlevZpPhF9Se3ipqx/4vdDnhinYJYUGuIXVaNQrxoXSfTizsOKYrZ+LbOqEfKCLFLF18WPHig+TU4COdCorZtipepLITNATyZbtIysRhWmOTb1CFUjmbbEWsUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710321581; c=relaxed/simple;
	bh=YbxTA26ZYyEP3CGieMFeGFKTSmNqHb03eKmkV77nIr0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=K/0z/GklRXcAyROCKAp9xdzSgt547p5jvCBEV8VrMYLAUK1X2ty5CCDIfUFE1ELk/rPqUUASxfBNxg1t0PaqijAxpTQsQlooK3J8D8vsJ7xCoSzhzPmLoSZo7uupS2ICk06SqnZHYeJCwlPqDUm3QGKSn9VCSUjBBL1cSb+kvR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=tliXNBbx; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=a7kZA+P6; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kZievUVL reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42D8KYcX030567;
	Wed, 13 Mar 2024 02:19:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	pfptdkimsnps; bh=EXB3E4C486fI6Dxq76hi4eSVZ6DhOCjQRLDMIMHGGRM=; b=
	tliXNBbxsv7EJkED0FzaeL6IEQ9T5qGTwpegvAjBEGFefwST3qkAdOf5xgZHqHBC
	tNPZPx6mUHmFPquI6M0Vp/AErAzr9U3E3cQkn29nTeAvFUWlFwn6vNj9gAdpPAoQ
	JHZkWzNTp051Hqpj/a0CqONYAx/yAiKcJfJAXaaD38b6en4htjcfsjA+NbeCy8gz
	eIJME40shICMM2GOMSN4L/wwZ5j72wMkZjb12LBXQKIphNy0IuuS3YonU4PHq8Pq
	X/tUkCODYbnrUtsBjGJbkNCW5yNrW9xhdA/VkYHUnnb7fyYuY4xWRoJMneSj+xDv
	Uhh3UyeJT7oN8eJdDhjZ3g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3wtugxuhsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 02:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1710321575; bh=YbxTA26ZYyEP3CGieMFeGFKTSmNqHb03eKmkV77nIr0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=a7kZA+P64bwqZ0+8lzHYO4DzTsrVtghwj0DfkrYi/97g3lp5TKWK2xNUKrEExbPLC
	 c7Z2o1j6jlJkQliYKzgxbLtQ8ElrUMrKUfcfxjV3wqEr0j0xakHMc3Y8V2ufy67gkN
	 EVTgoaO763OzzK1I3jm9/heep2UUc8pNSNZr/ns6AgISE6nExNGAckAXfW4iRrhBho
	 rjeNngULV2VMG3LAiBfrtLa0SHqSKqyj6xn8ALHQrO5iUdWmLNb3eexXNcAsEmoLPs
	 QKym6yAyeuyEcP9PmL4HeM+MkMqJZYxqOqTAwoOeqO8bU3/HlriAgyZ+99RgFr9Pns
	 V2fYNVl39ZD3Q==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 58D264035E;
	Wed, 13 Mar 2024 09:19:35 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 256CEA005F;
	Wed, 13 Mar 2024 09:19:35 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=kZievUVL;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C5205401F3;
	Wed, 13 Mar 2024 09:19:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMUWLY9UvkkOYojTaGKk/bShlkc4HuGjkc8iNVRxOMItRaB8hcWGJXeMjhP9z/XK7vgrs84Tjm7g4wDJu6/M88+xZXx3qfqluqyzSL/Sy4KnEXhFol25+sv1of4NDDMdwV9CzDXEZfRgKVjG2hnMXuu25xGYjBQQlC8tKSUrVruEiNyEhxtnk74n9/8yf6PKiJYUxezLHANHNqWztg8bMtnLV08w93mErl/g70qXAIuu4niiyVmxcI6PbM9qsSejgnQFcujuwXqTDmnYAS6R/lZEuOYFZQSMdcFp4MV5Gd/IjhbFExelrL++K8YBKvOkngMCDLjLD3PMEK3FimTj8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXB3E4C486fI6Dxq76hi4eSVZ6DhOCjQRLDMIMHGGRM=;
 b=Hl5JKku0jEjRMGMYcpIlg8cwdn/3UJlhKQ4ZxCiC1Mu7Rd2c353QwbWP5iH/CEJn4S0Udz99gTtGKna91EYNav3ikT7cnIl/KsoNtJ/24z+fUdvltqi+ZQSDMLx76VNhOQKTmyi6hNuhL2c1vjQqdl5NkW74F+8P6LZ3RwsQu0tFkGwWTbLQ8abv+D/ID6vs0QbraH49dCR2Ss/dLo8ETFDcQcG6WmwrGZuNxw8ZIKQc6nMoElu5EmZ5bc5HFAcqVoFP+cynwomw5g1rqB6/5/jAAmBOgP5NaNzRjA1z9Mue5+4LZgbIe8/iYqYQSb/3E06o4+OYt6X5zofht0We3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXB3E4C486fI6Dxq76hi4eSVZ6DhOCjQRLDMIMHGGRM=;
 b=kZievUVLWzpnqqdVJ4k4e3k85FErFj4ywrM7igVh0FmOpU4Tgk8NSaUBX+0Jhq0GAXDNTu1xAU3MTqIRTJ0npwH7Bh+PEArh6cXFTq2G6gKa/lsQRyWoVuMcZPFr/WgnBLP9lRL0LfkanZWiFzA89cV7dyO3NAkI3ZVouEAxM5o=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by SN7PR12MB6910.namprd12.prod.outlook.com (2603:10b6:806:262::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Wed, 13 Mar
 2024 09:19:32 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b%6]) with mapi id 15.20.7362.036; Wed, 13 Mar 2024
 09:19:32 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: John Youn <John.Youn@synopsys.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH 3/7] usb: dwc2: Add new parameter eusb2_disc
Thread-Topic: [PATCH 3/7] usb: dwc2: Add new parameter eusb2_disc
Thread-Index: AQHadSeOhekvow7sok+PVADviXz93A==
Date: Wed, 13 Mar 2024 09:19:32 +0000
Message-ID: 
 <e77cc4312bda797d1ddaa4351d86c65a69c8b926.1708948356.git.Minas.Harutyunyan@synopsys.com>
References: <cover.1708948356.git.Minas.Harutyunyan@synopsys.com>
In-Reply-To: <cover.1708948356.git.Minas.Harutyunyan@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|SN7PR12MB6910:EE_
x-ms-office365-filtering-correlation-id: dfb594ec-c8ff-4fb4-28f6-08dc433eb15c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 baqjUv/ZpyYOlLXohuKm5s2kYv8/ipdIeKflFJMLKw08c1zvqK4xU9yj+Zu7cq0d4QDhL6nKqFJ8e6HOyJgPkH28Nq7PAw4QavBN74cLlXj5lJQOtWTRpbSvMUTRKjHaqFXBcJVOntHiezRtpUfNj8TMXm+ibG13KcSB/1y3XS2urW7dUEAxhQCJBX0KffGF0NNmbdWfCBTwPfQwh0IHB68Yt26K+oPjA0MyAVwQHMaSnQ0euAslJw3S+xbD/ZlIPSmh5et08rcSjNgCGJ5wbL2/r4U8TzcV7mJoH9hJwXvspU3ziMu+LyMm/2IOv0jmsKymNX8lRyY8VJTKdBloLXyLkMKBeNPEdAV1uQdX9X1XUTEzSvtY7tldV1jyJjG8eB4YeW17ndY1Pl51nZ6JcJ7idM36djAYCWeHecP2eYNjTPWsJJYqNy9VTFtF3AYky5n55ZLbqZ5IOiKibrb9vqA3JjWfWltKMGFIH6ofqTVNbojm4mkIja6dq2TzlMkixBYIOE8XNzaUdggV6wCubG+u0x6zbyrr3esiYkDnQ/neHfNVo6uw1QcH25UO9YwLo/Rmy5yDDmb/JtLkdnd+urhvEAJ9WrW+pvUt1bfcgZQwZ00FflQAY7CB2WOcGP37UqyFghZW7yEpBinOPlakIlqtRo0wBa1sl6J9gCXGzAr0CFpIjto6E7+79OBKoD4B1AT1NoAikUNUFZISN+NQ7vkPnuYOpEll2TxQO81FAIE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?grUxR+XWWRD0X3FL75cfL1bPP49eXIXT2/T2gVCdMsISd56w5iwSqr9J4e?=
 =?iso-8859-1?Q?rDfjgUANEQAGoDoo579AmwEe+gKKHBnScbztpwbrS4ADyNinJoDZM4R4MG?=
 =?iso-8859-1?Q?iXHesnajOp16+mLVEyZVwjv1kiL7KJXc4+s2loy0oYZbmpSvtibQeGh8Gm?=
 =?iso-8859-1?Q?cCzmUo5B8TnyRAplx12uj6OVaiFSEYojSv2SgcXuR1vLWQ0b1gaPT5sBfU?=
 =?iso-8859-1?Q?GfGzBcWt92oT3J62hmnUbXZ/hdIT7XX6srzXZXyhR++La3NCrQm2O2rNL+?=
 =?iso-8859-1?Q?wQIMq5ZHJ7EE7+n36ZrG/Bg+mGbhNRlYF3ZGzq0pMzW7pvN49NtJJvaoQ6?=
 =?iso-8859-1?Q?FxheOAjulPrPZl1BHoNDRWhjRVbT7HyNwi4AYWYs4hTxA1yE81iLt2CrRv?=
 =?iso-8859-1?Q?OoFwPdNvqwpYLm6o350OHzWdMGNhdSwADupNR+0eihtiVyM3kxOMf+6wxv?=
 =?iso-8859-1?Q?QYUp+hqWUGk7VDRH+NcgMXBbX/QP/mtvnBi3aedoGHmUxz76BPhfRAUVwF?=
 =?iso-8859-1?Q?JOFwAEbnSU2shbkam4OP84u4++UupHDbpv3PSsHgCfp1XQ2uaE2gcgIOHt?=
 =?iso-8859-1?Q?HXYO44bHR0Lzk/JDr8OTwhdPrj5VaeYJ18gT2qU/5suqP/rfHOGEomTUEf?=
 =?iso-8859-1?Q?0sa2D792KJ3f4CYwc3J8HFPm12yywhsyv36QdlVM2flyb/PX3ZkRaN2qa/?=
 =?iso-8859-1?Q?MsAm98uuCTECEepzqb4xEVO6aA7jYOcUm/1EaXShmGyu4zjEX+5rGveGr3?=
 =?iso-8859-1?Q?QYUAcRjuo17FjXEq1X2FW+6BOuTvzBTONOnxvbZ2YCsBpUt6jgY+DIVWX5?=
 =?iso-8859-1?Q?AaSxxAlovcPhyVnZX55zhg+YixttdyXHfJRa5qW1O30BzkvSxsU55NVnge?=
 =?iso-8859-1?Q?d3lw+7hipbIrn418jBSZ3OeFlyKD3iDfJKABq56CvTLCN+EzFvkVkpUSV0?=
 =?iso-8859-1?Q?VV7UCTUsj/xsPAzuASW8z+KXnxIfzspHwWyENdF5Er//MWGyYc6ssYKeW/?=
 =?iso-8859-1?Q?NtxzrnQpDfJ3YdH5c4u11C01C6tBHVzYiT8KDLCrByUDIn0qAng1Wm/Oz4?=
 =?iso-8859-1?Q?sQH/Uos5NUD/gqKetbNgUPuzIt1LiJ+rq0kgi3CsnNJuOzhrh3MhsgpY4m?=
 =?iso-8859-1?Q?1fbcMkrKzQc+/Iv0YVOTkQK/fX6Z0fl/YNWbkIvaAIwLU3h3RT9VcVCFjA?=
 =?iso-8859-1?Q?KJNbLBW9R4qS1KlumTNWr0731cFQrILctZWcf/DaDoOtd+AGrQ1TcHKNL9?=
 =?iso-8859-1?Q?MfONX/Dcd/1a+kWbRkgo1OK0R5V9keKOaEP22QTktRitLcRXA+pcL3iOvM?=
 =?iso-8859-1?Q?wN5SoNH35ZuioN/DG5Sub6pZMF8oxP8tiVtjtR5tWM479IfU39LZl33m07?=
 =?iso-8859-1?Q?REDemVov0nEwBf/WtYYdg1HRmC003ocehGic4TzjfPxA70f5vg2aLGlyv5?=
 =?iso-8859-1?Q?8SStRN/ENJaaP/iq2oNWW9gPcj+ZM9lZagU/b5Q0+Lxenzo5z0/joW3foM?=
 =?iso-8859-1?Q?4rKiil0poRVezwW7YoSAFpPsd0F2o+dAmkdtW2VIHekCgn9mSE72Zl6SJP?=
 =?iso-8859-1?Q?imR1ltHW69ACiZ6pR8KsmA6Y7l5rlha4CcNhxSE3caOXvz6t0YQfzAzbU6?=
 =?iso-8859-1?Q?DLQ1jDXYiRtm1soGMQLUzAmH23KZfykb0M?=
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
	/SgIh8+A2zQickmLXaiDETrcOy0rYVI68Feeb4vX2wDveISjV/a4OrJW04N7/GDVmEizTJ1MtzIC56H8QXKfnUNXXHQBs8FmSO2QCxzNUJz+QQ7IRq8y7AEDJws3tZaVw29bPWX4bi+6fDvOCt9kfp9KXZ1ae4uGLBPuZtQ6xR8+WTUI8i1vpQzsDAOVJlIoDejlO5PLUkpNg449+nQ/yi6Iizd8C+1DQM5YU4hmxKuZ5gqDzSd/scyubnomLpeWQz2sKs6+c4f6+e/EGjBn6UJG336fYSCqwuKne6okDL7TC5nFPTbblA22LzOAvDbj0tkuJz4COrXbYbEO7IyWAqL/6Rh45QiJy7KAmqoSTDWbUMBLyi8vU6l6dYol0YM5h8ZX2hTf3Uvis1ZCXw057w7rp2TP5MboRn9a4do1XEwTEUhlEN/KAcU8NcGp6VjDxeKlRJ8qXj2VxUDgtHc4oOAQLpOuFijGtnm1VUd5Ck2yqp0g9WxbB5aXIxoysa3DXcYY+Hhi+9MFGTIyDIWZ8d5OdH8Dog0uWq8kYb91tGs9DUroiX0j+ui2vrRokmqfffVZLB9+hJoJncTfT/bJ/VYVHNyXf510Jv1qQ5j8LkvPQff2K0WO5RQ22dFAp9i5U84B2dchffsRpnGVe1foxg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb594ec-c8ff-4fb4-28f6-08dc433eb15c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 09:19:32.2291
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9o57hBH8kOB9/sRUnwoVsuuL0pF9631cF8W8MC5I/2/AS4Qz3tjtO9NGdEPwraSyMKDfvEgx0mvK92LpTGPXkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6910
X-Proofpoint-GUID: 9h90OmofSoCwPeSZMxmTrq22pMImxskG
X-Proofpoint-ORIG-GUID: 9h90OmofSoCwPeSZMxmTrq22pMImxskG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_07,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2403130068

Added new parameter eusb2_disc to list of core parameters which specify
whether eUSB2 PHY disconnect support flow applicable or no.
Set to false as default value and checked core version if set to true.
This parameter applicable in device mode of HSOTG and HS IOT cores
v5.00 or higher.

Added print this parameter in show parameters of debugfs.

Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
 drivers/usb/dwc2/core.h    |  6 ++++++
 drivers/usb/dwc2/debugfs.c |  1 +
 drivers/usb/dwc2/params.c  | 22 ++++++++++++++++++++++
 3 files changed, 29 insertions(+)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 0c10bd0c32fd..16d6ac97f23b 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -288,6 +288,11 @@ enum dwc2_ep0_state {
  *                      core has been configured to work at either data pa=
th
  *                      width.
  *                       8 or 16 (default 16 if available)
+ * @eusb2_disc:         Specifies whether eUSB2 PHY disconnect support flo=
w
+ *                      applicable or no. Applicable in device mode of HSO=
TG
+ *                      and HS IOT cores v5.00 or higher.
+ *                       0 - eUSB2 PHY disconnect support flow not applica=
ble
+ *                       1 - eUSB2 PHY disconnect support flow applicable
  * @phy_ulpi_ddr:       Specifies whether the ULPI operates at double or s=
ingle
  *                      data rate. This parameter is only applicable if ph=
y_type
  *                      is ULPI.
@@ -442,6 +447,7 @@ struct dwc2_core_params {
 #define DWC2_SPEED_PARAM_LOW	2
=20
 	u8 phy_utmi_width;
+	bool eusb2_disc;
 	bool phy_ulpi_ddr;
 	bool phy_ulpi_ext_vbus;
 	bool enable_dynamic_fifo;
diff --git a/drivers/usb/dwc2/debugfs.c b/drivers/usb/dwc2/debugfs.c
index 1d72ece9cfe4..7c82ab590401 100644
--- a/drivers/usb/dwc2/debugfs.c
+++ b/drivers/usb/dwc2/debugfs.c
@@ -686,6 +686,7 @@ static int params_show(struct seq_file *seq, void *v)
 	print_param(seq, p, host_channels);
 	print_param(seq, p, phy_type);
 	print_param(seq, p, phy_utmi_width);
+	print_param(seq, p, eusb2_disc);
 	print_param(seq, p, phy_ulpi_ddr);
 	print_param(seq, p, phy_ulpi_ext_vbus);
 	print_param(seq, p, i2c_enable);
diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index eb677c3cfd0b..c47524483f48 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -475,6 +475,7 @@ static void dwc2_set_default_params(struct dwc2_hsotg *=
hsotg)
 	dwc2_set_param_lpm(hsotg);
 	p->phy_ulpi_ddr =3D false;
 	p->phy_ulpi_ext_vbus =3D false;
+	p->eusb2_disc =3D false;
=20
 	p->enable_dynamic_fifo =3D hw->enable_dynamic_fifo;
 	p->en_multiple_tx_fifo =3D hw->en_multiple_tx_fifo;
@@ -737,6 +738,25 @@ static void dwc2_check_param_tx_fifo_sizes(struct dwc2=
_hsotg *hsotg)
 	}
 }
=20
+static void dwc2_check_param_eusb2_disc(struct dwc2_hsotg *hsotg)
+{
+	u32 gsnpsid;
+
+	if (!hsotg->params.eusb2_disc)
+		return;
+	gsnpsid =3D dwc2_readl(hsotg, GSNPSID);
+	/*
+	 * eusb2_disc not supported by FS IOT devices.
+	 * For other cores, it supported starting from version 5.00a
+	 */
+	if ((gsnpsid & ~DWC2_CORE_REV_MASK) =3D=3D DWC2_FS_IOT_ID ||
+	    (gsnpsid & DWC2_CORE_REV_MASK) <
+	    (DWC2_CORE_REV_5_00a & DWC2_CORE_REV_MASK)) {
+		hsotg->params.eusb2_disc =3D false;
+		return;
+	}
+}
+
 #define CHECK_RANGE(_param, _min, _max, _def) do {			\
 		if ((int)(hsotg->params._param) < (_min) ||		\
 		    (hsotg->params._param) > (_max)) {			\
@@ -765,6 +785,8 @@ static void dwc2_check_params(struct dwc2_hsotg *hsotg)
 	dwc2_check_param_speed(hsotg);
 	dwc2_check_param_phy_utmi_width(hsotg);
 	dwc2_check_param_power_down(hsotg);
+	dwc2_check_param_eusb2_disc(hsotg);
+
 	CHECK_BOOL(enable_dynamic_fifo, hw->enable_dynamic_fifo);
 	CHECK_BOOL(en_multiple_tx_fifo, hw->en_multiple_tx_fifo);
 	CHECK_BOOL(i2c_enable, hw->i2c_enable);
--=20
2.41.0

