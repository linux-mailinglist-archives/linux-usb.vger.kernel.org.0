Return-Path: <linux-usb+bounces-7923-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F7287A4CC
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 10:20:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22441B221CE
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 09:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1F91CAA6;
	Wed, 13 Mar 2024 09:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="V5k702L1";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LUup6doH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="i3gs4xLB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A983A20B33
	for <linux-usb@vger.kernel.org>; Wed, 13 Mar 2024 09:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710321622; cv=fail; b=lmqjw8d5pTJd9fpaftF0NMCzbPljBvydIDk/ZtSuf0EB9lIAAOM6upUGwObS4dQLAm7nuliDCbudqRgFcTwBrC0FD3KmdzAfJYtf+Fcq9IIqSPzJ0z+XEMKM4u9KrZt0N4D0DMyAUDMxZZ4IoNZMNorXrhs2nQHgieopZ/DmhSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710321622; c=relaxed/simple;
	bh=JOFtkf3kl/dgnqJGw9lZrdBmOQCM8uUCQkvust1LLvQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LGIaUwQggoVBx+cpUbD4JjIyO7kd/F4TLCFpQ1yuG8ShtME8qZaS977ZE3gB8x3DasTnnaRI17HqvIv4N2drX7zB+xDv28M3EcliKEtOmwZzJrcOBiodf94iL0DhyuG0CZMvIs3ovAlEvpbBVTUixs/TyVLqPpdzZyVOO26TCZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=V5k702L1; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=LUup6doH; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=i3gs4xLB reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42D8Kevo028818;
	Wed, 13 Mar 2024 02:20:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	pfptdkimsnps; bh=Mwf2jeZv5sx0+nmzR5aNz3HldP0NUmG0aW1sxMmqI8g=; b=
	V5k702L1z/VsLTZXtGMeOJXMPCJpo5+cADYIhHRnX96eOZT5CP+J1NshrxWc6JZj
	ENTxSbAcpgLiaKCgqLN5zBgFSTRdDxNUmUG8c+bkJFP6k2iCD9wloLdXnyVx9Rnc
	JAE74kFgTZoG07l6l22hdeZAvLCnSO4T5Ch1WXGNlPqmgB+VpaFvuHxxYjhq/DaJ
	yDMKRzp2tl3Hlu0e/FeuFGfOoeaOanSA4y8oDFHPKVHLi2wXiI4nVp+OA9gUoTwV
	VtW6n1BWmivPY6Ubtm4tPNiuv0JDk8UoW43Z1GPHv9puHK55N3HRodEz7pWQv/6Q
	rbJWBVfiahVgDzDQn/QR8Q==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3wtugwkgr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 02:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1710321615; bh=JOFtkf3kl/dgnqJGw9lZrdBmOQCM8uUCQkvust1LLvQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=LUup6doHZzpLnWvLoWexQpRTRGnI4vD6ou/RI1XhyStpVoqDCcpfMw60MiFjB5gjm
	 BFUIFfD3UBCCWXYuV+Bs19oAGzuUyjDU8zbK+IzUfAdBRX8c15n6KAEKOEC5ztUNl4
	 usvUEYRU50IU//Ml9HZXPt7wbnkBcy6gahq+nfWZDX7kF1+Bazu0Xs2zpf9j2WPb3D
	 Zzm0E641cKwgkNCle5tGH1UJpwhTchIAxi9mJDjPthhaEuUMEtWLWJY2LkGlqxLYpw
	 T8IBdKKXu2JGVTLecMsUoPutXOWn+D9BzFhU3Yw8XWW+waoe1rcqEp7pl79YVO6Yqh
	 DG+eiog4FT4rQ==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5E9CA4035E;
	Wed, 13 Mar 2024 09:20:15 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 31D2FA00A8;
	Wed, 13 Mar 2024 09:20:15 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=i3gs4xLB;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 020B1401CB;
	Wed, 13 Mar 2024 09:20:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVcCivq00DaEKWjIxaFQy2iggTIAl6KClVhdIWm/d5PkyecopWjb5hJNzOfqui006BHOLN/xfJz+4if5wv4zwlxGG8DcsNnENZq4A2X4hNL+oc/LpoyGK4fE3iOcC5WTZowAZY0IxdLQe3Kh65HEj/U/NdIlrAUtjIKA4xSh42Vx8hGCyU+CmrlIsIyCxObsE2o7ontDwEj6EN3eOMJ6OEMhRNoJDzZQiYLvtGaorAyy7Py0956SioM2hiZ79HxfA9AmEw1CrNV+DqBEoarbUbsg9gA2ydykj+Krcbaq32vFlHTImt6QF9q5bvWxgemRdTpkz328rENxD7bD6yOL8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mwf2jeZv5sx0+nmzR5aNz3HldP0NUmG0aW1sxMmqI8g=;
 b=Kj2vkLNF9DVRX+4oZDFNtzpK+iu5GfEnM6UdPX0daz6ZFx7nrYPgsPQ5eY2nPUsHwG1ZLG8TrW8uc7aqzPYTfl/lipOR6z/B1JDdm62v53l63ScwL0ahMQtMj6DgsMUWRYB04/4/Ur61tN2vZXIt6iJEmyBgEnNgJW9toYeBsLkpmuJE1WZnqRC/Y7kENVYHSUtunfD3rM+AIO4BEFTEvi2Y+BoTvGHk3T/I78MLZHpmDqQhViFLh0Mh8e/DbsV5ZN3MRtttlYl6roz57ST/wmyE/4BCy91xgTH+SkzQuZ9GSLFIo1JJUcD11BZklSSKI1CvJKVxn53ESYKfpOdi0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mwf2jeZv5sx0+nmzR5aNz3HldP0NUmG0aW1sxMmqI8g=;
 b=i3gs4xLBgmh+FZscBS4wSt0lszTD83EOCduACv2T3Px35V/UBOwB37Yf+FBN93+14Jtfu4pmlRqIMb8tsp+ZYAPH39A9mTe/iKj8pudR4MU1XMKefrRCvMz78Qh/a6zwnDGEQcda0ic+D88V4FbyolvFxBJiHGFfygoPc0NoCkw=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by SN7PR12MB6910.namprd12.prod.outlook.com (2603:10b6:806:262::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Wed, 13 Mar
 2024 09:20:12 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b%6]) with mapi id 15.20.7362.036; Wed, 13 Mar 2024
 09:20:12 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: John Youn <John.Youn@synopsys.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH 7/7] usb: dwc2: New bitfield definition and programming in
 GRSTCTL
Thread-Topic: [PATCH 7/7] usb: dwc2: New bitfield definition and programming
 in GRSTCTL
Thread-Index: AQHadSemNXvvPDzScEmwwYmgJXYRfQ==
Date: Wed, 13 Mar 2024 09:20:12 +0000
Message-ID: 
 <0616838cfee958774c9321c6eeeda4be92f900d8.1708948356.git.Minas.Harutyunyan@synopsys.com>
References: <cover.1708948356.git.Minas.Harutyunyan@synopsys.com>
In-Reply-To: <cover.1708948356.git.Minas.Harutyunyan@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|SN7PR12MB6910:EE_
x-ms-office365-filtering-correlation-id: 3ff71d0f-47ae-44d2-cb81-08dc433ec965
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 mel006p4gbttobvHfCe579A2kK+ay3FV1AwCKOdKchRiuM5rVEBH15qVlG94Etd4PejT9t1rgW5bMIFgkETCJ96+xZAtAXXUMU+BPYBAb/92HJ5dlzQg7V4uAQ5W4pgTKUTPU1I/CS5buqDM8bfdDmSINLVBB0Odd3Nauklfgkva/pAfgc68T3eQxHz2hjUXR/PXTZ3yVqBGth3ARLENcXa6GAMxWPQkY5LOIQmQX42XdGV3YBeHXk/TaMNOWDeKcEzH+TxsJwQTg65mq+A27fRotbtNf6QDipaWxblsKxtD/jdhzP/XBzplwtYP0uE2Tb9w3tpt5gLBtz8kq5RlSQ7Y0I3mKGu5g7VVXu5Ea7blBNRfO++pxXi+3TAL7vOoN+BFW6qkZzfCP7/P+znbPunaEPEfCfbTmewebrI/NdMoZu9us4tZtmhDmhp9cmGyv5tBlONx2IOoYbJlE7El6sC4AhtZT87m8A4ddQq4yMQPp9DMtHMGl7NvPcxzrsLNIfoImZkuHUHvKnjhe5EBf8D8WXrfi202bhQkqCrLO3x6v9p4I2HPAFtMxRxZnJXtXyTg5Se0ZWAX3HTsWTpVqz3bcyPl6s/G+GBcFYkIFnvFVZtiVZ4Zmu+Ka8Lk6EXwKWOH1ej7EpNB3TweBj9od7Cp0u7dx1BpqvYVhFVT2L+DOJuvK+3gt5Hl1cupPvUlpXtm8R7w8608Dvuxm9CsjxZZ5zqosekl9Xv0e4KhHrQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?in42/WSHLBzegwIF/+A2EyE0xGMQn0j5b4xITvlMVO7fng0U5msLtHwe9m?=
 =?iso-8859-1?Q?XrJ5B7jGuIbsR5B1dcav61JK84+P0PuXRP3Fxt+MywLtVh7P1nJEAt2dGN?=
 =?iso-8859-1?Q?w0gm+xlOTaBYpMP4X/h1VIko/OQGig1zm86Pg0Z+PrBrLx3xejmhSskh+S?=
 =?iso-8859-1?Q?FLgUFqm5zq9GoJq2y5Y+bfpxJ2qYkwBy2JsWF5Ol2corDHD6JGdSDBEWcp?=
 =?iso-8859-1?Q?WKZMVQd3CVNMJ/wyU4vvjjZEMoJUDpijVNOY6E+6uqSedhtz7yKoLcQzgZ?=
 =?iso-8859-1?Q?TakGYt8+oo8GyLA00oR6sEE4IfMxn1sesV+VAAiGwK+OVR34VDMKiZtaeZ?=
 =?iso-8859-1?Q?0QDQIp38R4Ej1pbBgksen8c3vhf7nE0qBImMDxLUahpZjOkTJshPtoMjnG?=
 =?iso-8859-1?Q?R5NjFk0CfgQCHHz1O2+dxngYxPq0W6kuCaP33vGXNhZP8NdiRgks9UoU6J?=
 =?iso-8859-1?Q?zS8dwCuitpq026luIfUq9HOnNDuOgwMo2L3FRjatrn+ZH7QfCjeQJZ9m/I?=
 =?iso-8859-1?Q?kBN4ioRcMKpBFW5aQx+86JUO8pnJFl1F3+fFl337hOWCBlMLmpf7DrheoJ?=
 =?iso-8859-1?Q?MRZ57wvHpeRU9zLk1gezDAO8SDlHZgPxLZj8jLrkQI2hJ9Pc81Ql8YJ3m5?=
 =?iso-8859-1?Q?KtWpnnWPChYURza2HpvFSrtBVTIp/2fTwmKeBiY8h92ptr2zYv7yVsnbQJ?=
 =?iso-8859-1?Q?HjNWWbddFfng13myXWHFtD4e/lLFJLrLG1uag2fB+Yk6AGkOT1fI2/DWCG?=
 =?iso-8859-1?Q?3iJC98JmfbVG872FfrxQsLe7N/8gSGdMAlh5n6WGLP/8XNFhRwaBjyk1Py?=
 =?iso-8859-1?Q?5srB9X4eyDkJSGJYGCUPCpyoQSXzBTr1MBU3Yu6VjdcxucPGH810p4Tcuw?=
 =?iso-8859-1?Q?8WarinyWu9MqzMNumF8VVLyJ8+Y/dOjltxnLQ+OI9Gvas6oTI6Q2IPUagv?=
 =?iso-8859-1?Q?nAoEMi9kB+EX7IxlGqoivpUiE+BHdtlixvqG/wHNWIelQHTpocGVu2XdHc?=
 =?iso-8859-1?Q?WRFS9ffbZ44HNnt7lrYTfHlf85/YfVpSuZ0Gbo1pG7LOXuhZsRyZzHp7fn?=
 =?iso-8859-1?Q?WRorYvG02HqL7LXJPRKiK+WHOlSfgwDg/+rcCCt5Gz0jYaYzcGjPxMT4V2?=
 =?iso-8859-1?Q?9PKTZ9Mxuada8KdAv/iXcBix5Zb//VAKof9lHC/91tPYkqWzCuCfJFy+DN?=
 =?iso-8859-1?Q?6zdVUYlq9WwjOIwPFZJ5ByeKT3tlLy0Dq9jZBJXp4wWDbX2nfKBRE7gXRJ?=
 =?iso-8859-1?Q?8tGoFg/yMYp3wXp/crKm7wbBe8FRvMHbKMmgAPrn6UzQXRlQOoo4O874Be?=
 =?iso-8859-1?Q?faXm+LJN1MF6ai597tFF3pA2sFAmW5bDDunMbGqxaDttija55EvKfqH2kQ?=
 =?iso-8859-1?Q?fzU58pO4YttpQ+oYO/P5rRzDzZbNbVeQAwNJ80RD/dviT9P9Bv2ZC2dGhf?=
 =?iso-8859-1?Q?yVPO6xLcM7aCubMcKcISrPF/e0RXEyd12yaw4+YeluHc25yB+FjywBhCPW?=
 =?iso-8859-1?Q?2a4y2mGmJedElN9D0/iHKaUnm7TjQMex/RIaWB2F97Rtq0QZqqlRwLvh8L?=
 =?iso-8859-1?Q?goE2pL62TAX1T2Vt0ku/vU4YtipVEJ5JYML9qG1ihdQFoLgQ3lIToVJBVY?=
 =?iso-8859-1?Q?YU2dj3f01JzkrkhiK7GlYQErmuwK8Uhw1tJMAZHglCsK1dEM2RDHUkcg?=
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
	vsNM4WDOLLRqdcQY/n4oEFj5tE71r5fezEEoXqpJ72k77mgsk++rdc/OoMQTA5C6+VjHfZYfYzU5deV6/gnfPe0ylAJGmz4UWo+GCG0wq7W5hESL3akZ3rGIZbC1xWV8Tseb5TVukUqW36KhzG3RsIq1F4DXe3+NoSOW714eiNvZiw3AzS5LVWjLXWB0FHxilQS2j4o0PCFX93LfIxWMujIzQIZv0scP1CEsfwgE/g2pIQCLK0N/GQIPSYmoZgOQJvn8StXDxkJO8JcFEa1wTK54uOR1kdJWCMrx8+unNZAPxZKix1iXIlo8I8yve0HFP2LtxJrVaUTZl2b5HwAKxru+Ygnq0K3EKcYzA83++PCbENp744vgTvctb9F5e1gcZu8GYV4E2KNTPl9DI4+0TnYCtc8UtlPEI7+VxLseLY3M99hieX8xulUPGFo2uYu6mWGNK8CaSkEz5tyN9hVYZ+kkkD5i2qPvOaDRK3fmMSO9ofdoqYalk0YwhlmGL3l0A8hnim0ZFfb1qGHGH2eJ1AX5wFrIzhZzPPi+1vweAd3bdOvHwLUKIp7vAvVb6KjZVg83/V8VXFd4DPpGBmJZ7JZG73x8E55SkUHjp5+nq5HH4U4m2ihLBtN6zc+4Gf2+rzYQhtjUlObZsufgf7CVCA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff71d0f-47ae-44d2-cb81-08dc433ec965
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 09:20:12.5527
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a9IieEyVKUaFrNHzLrVcyjASg5bGeqqtKrz84O316Q0JHSUiurGFeUt49fg3Tyl2nPMM57RCWCVGQ8rkX2oaDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6910
X-Proofpoint-GUID: Umk5-sGzbPJ8FdVBvaB4iQn1HOP5EK32
X-Proofpoint-ORIG-GUID: Umk5-sGzbPJ8FdVBvaB4iQn1HOP5EK32
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_07,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403130067

Added new bitfield GRSTCTL_CLOCK_SWITH_TIMER in GRSTCTL register.
This bitfield applicable HSOTG cores v5.00 or higher and not
applicable to HS/FS IOT devices.
This bitfield must be programmed to 3'b010 if core will be
used in Low-speed and core configured for any HS/FS PHY interface.
This bitfield must be programmed to 3'b111 if core configured
to use either:
- HS PHY interface UTMI or ULPI
- FS PHY any interface

Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
 drivers/usb/dwc2/core.c | 37 +++++++++++++++++++++++++++++++++++++
 drivers/usb/dwc2/hw.h   | 11 +++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
index b7a76eb089c9..9919ab725d54 100644
--- a/drivers/usb/dwc2/core.c
+++ b/drivers/usb/dwc2/core.c
@@ -980,6 +980,41 @@ void dwc2_init_fs_ls_pclk_sel(struct dwc2_hsotg *hsotg=
)
 	dwc2_writel(hsotg, hcfg, HCFG);
 }
=20
+static void dwc2_set_clock_switch_timer(struct dwc2_hsotg *hsotg)
+{
+	u32 grstctl, gsnpsid, val =3D 0;
+
+	gsnpsid =3D dwc2_readl(hsotg, GSNPSID);
+
+	/*
+	 * Applicable only to HSOTG core v5.00a or higher.
+	 * Not applicable to HS/FS IOT devices.
+	 */
+	if ((gsnpsid & ~DWC2_CORE_REV_MASK) !=3D DWC2_OTG_ID ||
+	    gsnpsid < DWC2_CORE_REV_5_00a)
+		return;
+
+	if ((hsotg->hw_params.hs_phy_type =3D=3D GHWCFG2_HS_PHY_TYPE_UTMI &&
+	     hsotg->hw_params.fs_phy_type =3D=3D GHWCFG2_FS_PHY_TYPE_NOT_SUPPORTE=
D) ||
+	    (hsotg->hw_params.hs_phy_type =3D=3D GHWCFG2_HS_PHY_TYPE_ULPI &&
+	     hsotg->hw_params.fs_phy_type =3D=3D GHWCFG2_FS_PHY_TYPE_NOT_SUPPORTE=
D) ||
+	    (hsotg->hw_params.hs_phy_type =3D=3D GHWCFG2_HS_PHY_TYPE_NOT_SUPPORTE=
D &&
+	     hsotg->hw_params.fs_phy_type !=3D GHWCFG2_FS_PHY_TYPE_NOT_SUPPORTED)=
) {
+		val =3D GRSTCTL_CLOCK_SWITH_TIMER_VALUE_DIS;
+	}
+
+	if (hsotg->params.speed =3D=3D DWC2_SPEED_PARAM_LOW &&
+	    hsotg->hw_params.hs_phy_type !=3D GHWCFG2_HS_PHY_TYPE_NOT_SUPPORTED &=
&
+	    hsotg->hw_params.fs_phy_type !=3D GHWCFG2_FS_PHY_TYPE_NOT_SUPPORTED) =
{
+		val =3D GRSTCTL_CLOCK_SWITH_TIMER_VALUE_147;
+	}
+
+	grstctl =3D dwc2_readl(hsotg, GRSTCTL);
+	grstctl &=3D ~GRSTCTL_CLOCK_SWITH_TIMER_MASK;
+	grstctl |=3D GRSTCTL_CLOCK_SWITH_TIMER(val);
+	dwc2_writel(hsotg, grstctl, GRSTCTL);
+}
+
 static int dwc2_fs_phy_init(struct dwc2_hsotg *hsotg, bool select_phy)
 {
 	u32 usbcfg, ggpio, i2cctl;
@@ -997,6 +1032,8 @@ static int dwc2_fs_phy_init(struct dwc2_hsotg *hsotg, =
bool select_phy)
 			usbcfg |=3D GUSBCFG_PHYSEL;
 			dwc2_writel(hsotg, usbcfg, GUSBCFG);
=20
+			dwc2_set_clock_switch_timer(hsotg);
+
 			/* Reset after a PHY select */
 			retval =3D dwc2_core_reset(hsotg, false);
=20
diff --git a/drivers/usb/dwc2/hw.h b/drivers/usb/dwc2/hw.h
index 5e449393b0d7..48699caa8739 100644
--- a/drivers/usb/dwc2/hw.h
+++ b/drivers/usb/dwc2/hw.h
@@ -99,6 +99,17 @@
 #define GRSTCTL_AHBIDLE			BIT(31)
 #define GRSTCTL_DMAREQ			BIT(30)
 #define GRSTCTL_CSFTRST_DONE		BIT(29)
+#define GRSTCTL_CLOCK_SWITH_TIMER_MASK		(0x7 << 11)
+#define GRSTCTL_CLOCK_SWITH_TIMER_SHIFT		11
+#define GRSTCTL_CLOCK_SWITH_TIMER_VALUE_19		0x0
+#define GRSTCTL_CLOCK_SWITH_TIMER_VALUE_15		0x1
+#define GRSTCTL_CLOCK_SWITH_TIMER_VALUE_147		0x2
+#define GRSTCTL_CLOCK_SWITH_TIMER_VALUE_50		0x3
+#define GRSTCTL_CLOCK_SWITH_TIMER_VALUE_100		0x4
+#define GRSTCTL_CLOCK_SWITH_TIMER_VALUE_125		0x5
+#define GRSTCTL_CLOCK_SWITH_TIMER_VALUE_200		0x6
+#define GRSTCTL_CLOCK_SWITH_TIMER_VALUE_DIS		0x7
+#define GRSTCTL_CLOCK_SWITH_TIMER(_x)		((_x) << 11)
 #define GRSTCTL_TXFNUM_MASK		(0x1f << 6)
 #define GRSTCTL_TXFNUM_SHIFT		6
 #define GRSTCTL_TXFNUM_LIMIT		0x1f
--=20
2.41.0

