Return-Path: <linux-usb+bounces-7922-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F36B87A4CB
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 10:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B008F1F22BDA
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 09:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E09E51CD00;
	Wed, 13 Mar 2024 09:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="rz1BkTw0";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hNalvPrI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="sej7INO2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903911CA94
	for <linux-usb@vger.kernel.org>; Wed, 13 Mar 2024 09:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710321611; cv=fail; b=kpPWDhdpEoCvO0zw9EBoDImj4LDx28eZy2KV4SrX8hj3AvkWMWVaB2apQtVeB7fRmag9HT5qYdkaVbECNM88vAo5sjTK2sLhDBega2kGQF5graOQEecXH5389GtfcTIVR3xTIvACCUo8VPswYQLOHAVuUqT+2PPjJJ3WBn6+srA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710321611; c=relaxed/simple;
	bh=03iPqL9o55nJPKr9OqLm1Y7XcLQlJc2U2q3M6P9qRyc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NqdN2ZF7dPw62VfaxXmtkHegnp37Y+GRdXuRbS0WDKwfxr4dj/Q546k6NTyu1LzH1nJY+itAf6+3dCg1DqTxu/UxBgbaPpvHpqnzCG3c56IowtNvvx3WO0DE9jHwJmWX8eJtb2fwQV1x4zDYKgSSE9tHiS44OtgKc0nuHeRE2o8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=rz1BkTw0; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=hNalvPrI; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=sej7INO2 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42D8Kb32028669;
	Wed, 13 Mar 2024 02:20:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	pfptdkimsnps; bh=R5PdArfzbTaZ+x2ANEUN9lvUhPzzqqOUhRKnL0VBYZ0=; b=
	rz1BkTw0dB13VNFkVEr7fAYottpjg9WsRu/csMNtSZkk+cmcMjVV+yldBstT/1sF
	fKs6N1qCmtaw2hufACFTE9+eec0jmwBuwAXq2pB4L9XTxWeR56UMyoy2MczEn9CY
	JHqAijXDPRKCYnnVbt3Y6RCGZUS6M9+2iiaShgKXLNGBHSrhsuBDPwuFweyVIWOP
	3452p3gz7mmjy11cijDZDv73uYlYGNagKSb8U4zUQo07CBHGLgRUL78sOjcNtjr5
	UOPvnZ0mqv3FTkj+c/v6tA64+lQPED222a79OeJPLC89UZ/eorJjgtRYIdoIUIOm
	dzsvvtlN1v2DaLOIeagjDA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3wtugwkgqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 02:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1710321606; bh=03iPqL9o55nJPKr9OqLm1Y7XcLQlJc2U2q3M6P9qRyc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=hNalvPrIn/ZluSot/uenQCOyjSCwnwzj3DKbfq2tQ1Oq0OJni4R3Xpf4mCtLIUJEy
	 voJYVQjp7dubnWhvrxf0sIrbvD/uVoFoPIKkEqfRi68czTJANnX/NR9McHYpT0nJzZ
	 EBbTdQWGxlz6mwv/uuipFkczngbvLTTlT4f90edXRf/MaoznDmF/ld9y83k67TQSTD
	 pBsnVYZxXcw7V+9MvvHX31rwpV5KQYAF/GOE9p0OaCPSLIo9e8bFLgl6FyKFsUul3c
	 Dd7lk0IB3fYbh9Q5dCo3uj+ljG7yvmEuiGQ2t0DFd6myqkhWHdaLqvTfmtT66VFU60
	 YPL1NpgF5InZg==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 34E984035E;
	Wed, 13 Mar 2024 09:20:06 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 1A2EDA0090;
	Wed, 13 Mar 2024 09:20:06 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=sej7INO2;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C9626401F3;
	Wed, 13 Mar 2024 09:20:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hi1voV+9l9monntXpcE8Tc3MbL7f6MrI9O8yLC4V6TanL+Qh6GBai3mZMsa6vi6LpShdfntOQtN5pXALtFhwBU9bn1Nrj3u1FZ2Mat+/6bu11IIYXEPtgjZpiMr3BeUOoq2EyruPNOV+kxPfbUF/M0of7+hWTxfJ/86ouvOv9q1CdAEoJ83RQhX908Shwx6BMsZcnz7tp0b3v9j2SFkYT5C+7Lhlfc8h75pc1W23wWmFzr1Z+J8nWRnrtp1nwMRT9MPLJPdGowWSOo4m83wa2biFBU9L426+ZxjBqZqDT17hiJk5hFOUGGJKgZOV7M+TUyVObqPA/SdQVkIRyioZEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5PdArfzbTaZ+x2ANEUN9lvUhPzzqqOUhRKnL0VBYZ0=;
 b=mwNaPRpB9BPpOFUYT13g0nfVWpH+78PvXcG3A4XV1VbT2LZcYuuwTdfxYKThCv88Q0vb6PPUllvkT3aH0XLgmo+f5ybCL9zgFzKAmsU3yUBL+AJ5LTq0jcTwGwaWIlLfvC+W4Gl+LYwMPGdeNr4dwZ63bNnUuZA83YouRZK1ZqF8u3FAGVWiFDjYoaVY31ndnqh8PevyPjzk9vwlmHgiedB6kV+7Pi4GxQ911CsT0BITBOQhTp/7DcMxBuuBgi5lM1eO5p5bP5OanqB+m3/YbPNUHRyXllH/E80P5sT+I2eiQ9APTeEPI+lU4Y9dldH4Ok7xvJPNrioK+mWE1QNeOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5PdArfzbTaZ+x2ANEUN9lvUhPzzqqOUhRKnL0VBYZ0=;
 b=sej7INO2Otk71B3TgDaB8FQELazw+cTcN+NFX2yaI/TqApn6dllVmqNYqGsGqRt4npZOX9T40539GF7xr9EzaTwruzwT+4A+Q3pitlWJBaksaecG+dA/EYAQvZzEjCQOrxpOhf5r1b80F8/77q0GFiRhWuM1scFACIVicfDQYSQ=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by SN7PR12MB6910.namprd12.prod.outlook.com (2603:10b6:806:262::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Wed, 13 Mar
 2024 09:20:03 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b%6]) with mapi id 15.20.7362.036; Wed, 13 Mar 2024
 09:20:03 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: John Youn <John.Youn@synopsys.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH 6/7] usb: dwc2: Add hibernation updates for ULPI PHY
Thread-Topic: [PATCH 6/7] usb: dwc2: Add hibernation updates for ULPI PHY
Thread-Index: AQHadSeh8Z3E2M59NkOmXkMS9wXMog==
Date: Wed, 13 Mar 2024 09:20:03 +0000
Message-ID: 
 <e024cb39a7177ec201c873df25ca6365f2e55947.1708948356.git.Minas.Harutyunyan@synopsys.com>
References: <cover.1708948356.git.Minas.Harutyunyan@synopsys.com>
In-Reply-To: <cover.1708948356.git.Minas.Harutyunyan@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|SN7PR12MB6910:EE_
x-ms-office365-filtering-correlation-id: 4751291a-9cb2-48a7-f706-08dc433ec3c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 O+wGPrHumcZBUhrqhex4wLzNCiUH7CwIuZxx0aaFgGIWqyuzmOr05d2hIwVYfh/Ca/CHKl+pvtLYZxltZ4Ngek+LRGzLqKCRFDXCTBK7IoJI/LITWZ+xS3gHu6ZHA0Ld89ehYxqGBow1+S5Uwea9ZxZ53N5llsj1c2m3VRizMjjRLNBIrL0uyhbUl/1pTeI9naiNZb2FOBjTzRInzDbG0Up0/xOgEKcLPoP0O0ismUoJau8KOTqTw9TXFzsNrPoiTy9sFSwmPXCwkdI4W7Ig3Y8AFn7+ZuMV1PnMuKPzB4LqQiSep2HVLnQRqw3f2SDW2NNMxhtOBzej+UZvkS4r/z6/fyxirWO8WnUoZ06OeQGlWtX0COhK73t+OMMxo+WqIjGqlRBcZPUH26gwFgVdVfRWbDF11Tls37IsgkZl26su0UtkYn+YXW9exratOM0jahpENIFg4/goB3jRlqDFAxu1eV2z5iuwqzR3WNy06CdgMzB3C85V1sadxPMo0xs4+G2RjAA70MeQA2V8D7Gi1sdSBBE9De5n75XpM0tJg5xG3lbUp8u5eYqM7a1cTIgy4cm5LdbbYiu/qM6ryPJ0gqPdywhXIbUshpG/ysEFR89imJnQuCKtJtyLUkJQBb9AfdYCJJzJfeFtLnKRluhdywndYCtWkBu41Op1BwKr7OjoytcNQaf+C9mq5UYBl+IOFsVdDbBvR6LDgnGdmNK77pvcJangEATUuuLVfD0S2PY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?mIhiFO1xWPt0MiMQOuVZbL9voZzrRERGGbAy1olZb3lpw5HNLyWYc7tcZY?=
 =?iso-8859-1?Q?LpNPYUa+zELTHKnxBFzvCkfM13rMCOc00j4KeEpYSSho8g5EUZxQNuw1bw?=
 =?iso-8859-1?Q?C/EN0iIPlsbWRvFDs4kXzg1uW1c0N8oAOvKJ0cAI3O+QbHxfAsB/K6q9kJ?=
 =?iso-8859-1?Q?HH3bBvNmPNwMEbtFkkrJGipMaGE4e8+vCo3fKxlHHww2p0fuMBjVK+eWSb?=
 =?iso-8859-1?Q?p1wcFrO9Q94tg6wCFQPsDHgeyWSaKb7rDIpJGMcvetz3vePjXI7YsIgbK0?=
 =?iso-8859-1?Q?BNMpHAw6P2+dyXeYv2wPPEeTuwjylK9aKsJ89BtTQ1yTzXnh4HSXW6BgLM?=
 =?iso-8859-1?Q?NHyBCotHugDmIJZY9VGYBnyORwNxiRV7GONpuBikq9kh98Durnaw7flkpb?=
 =?iso-8859-1?Q?0RUs9XVlV8QJIN5HjFfUtX0G5+yYQkDHO0tR3EaLeOUMvNXJw2RCaW95Fm?=
 =?iso-8859-1?Q?3qa5VLWX731he7ggGiC6LC0IBAr7CL1GF6s9wu0z7vl5/AW1c0KqIgoSsb?=
 =?iso-8859-1?Q?tVAYEi2V7/urWenT9348iIz3U8d/uqHXTpGxc4xwv1HH5KyUNg8bHL0o9W?=
 =?iso-8859-1?Q?ae44IFEkLTWSjAB10l1+s6nUc/kIXWP/mSxtvQfM8lFgLZJr1RqLApH1UA?=
 =?iso-8859-1?Q?dQAv7KSx+yz6YczH+UrMpP65/NPwSduiKzCo3/WC6rNYTSLwf0sjSi2vfA?=
 =?iso-8859-1?Q?HTK2p3P9PQn73VedT3Kr34HxKbjktiOtNKOxKO8tgGHsUt1Q5XC3x1cWWu?=
 =?iso-8859-1?Q?VprDheMHjrnoYzJwOetv2ge7JgSPPt+17SJuypnnGHGoFDbjdOtMVO4+Te?=
 =?iso-8859-1?Q?9HwFqBo83WGdPA49Kft+bmT9xQV0cjEvQQpappKsfSjQcZUMIZ+UimKk9w?=
 =?iso-8859-1?Q?0iIU7TBNqz97NVExRJ+/muC0/uXnxnn+U1ZjqcJU5dF5QVVcPYi6smahrR?=
 =?iso-8859-1?Q?k6uln8IkkHTRivNCb7AJYK5Cs+PNWMvwheKF2jIilGwapnv1eOHX8zLpCU?=
 =?iso-8859-1?Q?cik31jUl15ur6uDS5qFN7ZCU5QFra+U8R2gysLixL1m1gLcLpu7h1WxeIp?=
 =?iso-8859-1?Q?36Imu7FAloMqCkDsg/ixRXQWNLFIgVKYYrV+KjHycflzpuHpYJKLdXGqGF?=
 =?iso-8859-1?Q?LCSxrj1ojf3t7lkiklrL+8eyo7QCQ4gVk4F0dorMOOXZsO70VwFluQXq9S?=
 =?iso-8859-1?Q?r5XmfdwBd2QiPff7OpOtKIYvQ2y3jBHkagH/eiPQTvx7Ybwjyn3KVBYMJu?=
 =?iso-8859-1?Q?qvvVq60mfE2pKKx+NfTQun2N+R3Opx/cMExp79hbzapPu9uMC9K/TMCAnS?=
 =?iso-8859-1?Q?rh3dA/C4yMa76ioORMON7Z16XmuYtogWbQV9MecqlaKkSvdvsdwcpedQIs?=
 =?iso-8859-1?Q?+Xrs19rr/sQx616iGAta7ESnl721gKlI9h0Zu6YLS4ixxR6KIDoTsvN4Jr?=
 =?iso-8859-1?Q?W3NjLxpSt48hzp/UW66F6w1j3JqkxZVaWz0SimQ5GXWQKmct8HHW5A6wIu?=
 =?iso-8859-1?Q?GxrDOw9wAiT1lcU14kBM2DfhTTBBhGD6BLQRyFXFzylSbOtgzE5MVKGme8?=
 =?iso-8859-1?Q?HoAfZK9Psr10Jq82N02A5xTk2/kZH4QJHOP31+VqtBE7PtLx4R4HlHH+FV?=
 =?iso-8859-1?Q?46tGFemGE9zXyBRMR9W2wFoTPF5xM2VZ/YnppufqtJD58YbMCUBaJrRQ?=
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
	FA+xjKk/VEvtAsY8ccHYUfXZs+tlJ1+qgn4cGCidq4wK5lDIS8QY6BGu06bCRduNMVbGhQvMhyNR5rK85AEbqZFfGSVrKLhzCjbzC0PRQsXB0YrfuGKTIqvdY+8m4BlR0IlrmyPRIJM5uDaJvj3y/4bQRmIWh2G1MtFv/mp76ymU60b5WhcNKq0dIm/m9NxavJoi89Lu8qMfkkwaHCCYpI0lWiQokbG2pS8lfN0VAyLXymeNZ4OeZ30wz3CLcVFBP4BDS7fYafaTO0KWyXIJgLgj8sCPvL6NG0vQ7eRkrr8lArvPwiFW+UlCiC84JW8xgOEVp9Y7/uoDuwMtVrQGYqYM98IZN7xGm6sT0qucw5Qt5ZMjnPYHYRWezEbhXILOrIFv3vJcbuZ7qg0AKjzvsBAPYo5s7WTi1FneYzf/OUPosYgS/BxcP0z/wewET0BM0SKVbjascWAvUrTa6XjX7/kt4Q93rROQhHos5LBHJCatsy2Ok+oMPgmuYdgPEvQRgmsEq2slPF/x+hpFwDg1SSfdO2A7pNfkL93CvEFmAsyJKeBilwA8Ts6ICXxkKjCQ1R95339wnqo1/DWg9cqeq3kcPBcWe5cUJOOsMtSi3v46pcCNU80UaCjQrE1xk3eGEpVONsziLHOs29U/6JETgQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4751291a-9cb2-48a7-f706-08dc433ec3c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 09:20:03.0400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z2MomJHIiQWD4D4Myx5ogbTRwFP88iBmwOFd3ZFBPXIIXNkhoxfV5YDOE3oMO/JVnV/5WBlukXwBzCD17+HYgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6910
X-Proofpoint-GUID: 33t8cIGVl6IrF_OFdAeej-OnhO3foZtb
X-Proofpoint-ORIG-GUID: 33t8cIGVl6IrF_OFdAeej-OnhO3foZtb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_07,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 mlxscore=0 mlxlogscore=893
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403130067

Added programmming of ULPI_LATCH_EN_DURING_HIB_ENTRY bit in GPWRDN
register when using ULPI PHY during entry/exit to/from hibernation.
This bit set to 1 during entering to hibernation if ULPI PHY used.
On exiting from hibernation this bit reset to 0.
Applicable for both host and device modes.

Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
 drivers/usb/dwc2/core.c      |  5 +++++
 drivers/usb/dwc2/core_intr.c |  5 +++++
 drivers/usb/dwc2/gadget.c    | 23 +++++++++++++++++++++++
 drivers/usb/dwc2/hcd.c       | 10 ++++++++++
 4 files changed, 43 insertions(+)

diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
index 5635e4d7ec88..b7a76eb089c9 100644
--- a/drivers/usb/dwc2/core.c
+++ b/drivers/usb/dwc2/core.c
@@ -249,6 +249,11 @@ void dwc2_hib_restore_common(struct dwc2_hsotg *hsotg,=
 int rem_wakeup,
 	dwc2_writel(hsotg, gpwrdn, GPWRDN);
 	udelay(10);
=20
+	/* Reset ULPI latch */
+	gpwrdn =3D dwc2_readl(hsotg, GPWRDN);
+	gpwrdn &=3D ~GPWRDN_ULPI_LATCH_EN_DURING_HIB_ENTRY;
+	dwc2_writel(hsotg, gpwrdn, GPWRDN);
+
 	/* Disable PMU interrupt */
 	gpwrdn =3D dwc2_readl(hsotg, GPWRDN);
 	gpwrdn &=3D ~GPWRDN_PMUINTSEL;
diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
index bb6bb771375a..aee779898c06 100644
--- a/drivers/usb/dwc2/core_intr.c
+++ b/drivers/usb/dwc2/core_intr.c
@@ -705,6 +705,11 @@ static inline void dwc_handle_gpwrdn_disc_det(struct d=
wc2_hsotg *hsotg,
 	gpwrdn_tmp &=3D ~GPWRDN_PMUINTSEL;
 	dwc2_writel(hsotg, gpwrdn_tmp, GPWRDN);
=20
+	/* Reset ULPI latch */
+	gpwrdn =3D dwc2_readl(hsotg, GPWRDN);
+	gpwrdn &=3D ~GPWRDN_ULPI_LATCH_EN_DURING_HIB_ENTRY;
+	dwc2_writel(hsotg, gpwrdn, GPWRDN);
+
 	/* De-assert Wakeup Logic */
 	gpwrdn_tmp =3D dwc2_readl(hsotg, GPWRDN);
 	gpwrdn_tmp &=3D ~GPWRDN_PMUACTV;
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 680737d471c1..f67e69999e3e 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -5309,6 +5309,8 @@ void dwc2_gadget_program_ref_clk(struct dwc2_hsotg *h=
sotg)
 int dwc2_gadget_enter_hibernation(struct dwc2_hsotg *hsotg)
 {
 	u32 gpwrdn;
+	u32 gusbcfg;
+	u32 pcgcctl;
 	int ret =3D 0;
=20
 	/* Change to L2(suspend) state */
@@ -5328,6 +5330,22 @@ int dwc2_gadget_enter_hibernation(struct dwc2_hsotg =
*hsotg)
 	}
=20
 	gpwrdn =3D GPWRDN_PWRDNRSTN;
+	udelay(10);
+	gusbcfg =3D dwc2_readl(hsotg, GUSBCFG);
+	if (gusbcfg & GUSBCFG_ULPI_UTMI_SEL) {
+		/* ULPI interface */
+		gpwrdn |=3D GPWRDN_ULPI_LATCH_EN_DURING_HIB_ENTRY;
+	}
+	dwc2_writel(hsotg, gpwrdn, GPWRDN);
+	udelay(10);
+
+	/* Suspend the Phy Clock */
+	pcgcctl =3D dwc2_readl(hsotg, PCGCTL);
+	pcgcctl |=3D PCGCTL_STOPPCLK;
+	dwc2_writel(hsotg, pcgcctl, PCGCTL);
+	udelay(10);
+
+	gpwrdn =3D dwc2_readl(hsotg, GPWRDN);
 	gpwrdn |=3D GPWRDN_PMUACTV;
 	dwc2_writel(hsotg, gpwrdn, GPWRDN);
 	udelay(10);
@@ -5428,6 +5446,11 @@ int dwc2_gadget_exit_hibernation(struct dwc2_hsotg *=
hsotg,
 	if (reset)
 		dwc2_clear_bit(hsotg, DCFG, DCFG_DEVADDR_MASK);
=20
+	/* Reset ULPI latch */
+	gpwrdn =3D dwc2_readl(hsotg, GPWRDN);
+	gpwrdn &=3D ~GPWRDN_ULPI_LATCH_EN_DURING_HIB_ENTRY;
+	dwc2_writel(hsotg, gpwrdn, GPWRDN);
+
 	/* De-assert Wakeup Logic */
 	gpwrdn =3D dwc2_readl(hsotg, GPWRDN);
 	gpwrdn &=3D ~GPWRDN_PMUACTV;
diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index 35c7a4df8e71..cc75a7062910 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -5503,6 +5503,11 @@ int dwc2_host_enter_hibernation(struct dwc2_hsotg *h=
sotg)
 	gusbcfg =3D dwc2_readl(hsotg, GUSBCFG);
 	if (gusbcfg & GUSBCFG_ULPI_UTMI_SEL) {
 		/* ULPI interface */
+		udelay(10);
+		gpwrdn =3D dwc2_readl(hsotg, GPWRDN);
+		gpwrdn |=3D GPWRDN_ULPI_LATCH_EN_DURING_HIB_ENTRY;
+		dwc2_writel(hsotg, gpwrdn, GPWRDN);
+		udelay(10);
 		/* Suspend the Phy Clock */
 		pcgcctl =3D dwc2_readl(hsotg, PCGCTL);
 		pcgcctl |=3D PCGCTL_STOPPCLK;
@@ -5609,6 +5614,11 @@ int dwc2_host_exit_hibernation(struct dwc2_hsotg *hs=
otg, int rem_wakeup,
 	dwc2_writel(hsotg, gr->gusbcfg, GUSBCFG);
 	dwc2_writel(hsotg, hr->hcfg, HCFG);
=20
+	/* Reset ULPI latch */
+	gpwrdn =3D dwc2_readl(hsotg, GPWRDN);
+	gpwrdn &=3D ~GPWRDN_ULPI_LATCH_EN_DURING_HIB_ENTRY;
+	dwc2_writel(hsotg, gpwrdn, GPWRDN);
+
 	/* De-assert Wakeup Logic */
 	gpwrdn =3D dwc2_readl(hsotg, GPWRDN);
 	gpwrdn &=3D ~GPWRDN_PMUACTV;
--=20
2.41.0

