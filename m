Return-Path: <linux-usb+bounces-18359-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BBF9EC0E9
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 01:34:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BDB7282FC0
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 00:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504161E535;
	Wed, 11 Dec 2024 00:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lHwzgcEk";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="maSa7Iin";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="A2iVHweC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B55CCA4E
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 00:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877258; cv=fail; b=crHWWa2aFNBR03MuyvDx/12mJWLRBrHAzsnDRUKB5vqY/gB3OAlMEkGqtuy+LcdYHV4uNdh5954KWWFlSxyK5usZFoCRgwjT0FwbjtODiuJe0Kt9ScXIR4TO6qJnSxyBRkPEg/xB/kzKu/yGyHS1+f7kMyDXC2WGvdYyYXXt4qQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877258; c=relaxed/simple;
	bh=9L2IAuCjH/PEhYIKdck9J+rJoEsVBY/N7sMUVS34im8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jY5TCmcOCjroDVpT7q4IofuS8hwEHaZEpJJb6bLxZriz1RyHwufqGZR7txzLA5LuWuIOSNe0MN13Drsbi7BWa927OwheJRXZVTRL/94IT0ctm3IjqooKo8yKdPxvsAm9g4QXnuGd05nAqXcmMhf1GwlgrVxnKZdM+Cznplo/5bY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=lHwzgcEk; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=maSa7Iin; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=A2iVHweC reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAMb3X4010915;
	Tue, 10 Dec 2024 16:34:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfptdkimsnps;
	 bh=COZSMrh7Ppa1IKffqRR2qjKczBoB1qStFDrYh/Z+TkQ=; b=lHwzgcEkoFiK
	+MjF5sUlM3btMC1CaXohQci+q2DthaRfHDkVpyq4I+Kip9MRR6PUBUnbrJAzRjvY
	Ys0PCjdEv6X5xbtP2LP7mWgyGktPI/WnFvC0NfA7bpU+ej4XFTryxNMV2RVyMDuF
	LkBG1o1YR+emU6muXqub7wM6Dfxkc9NeXq0NoWbIUqoKtdYTgd7GS9NedF9/hxS8
	31WagbMoSzA5h3pE0dBO8mgjpU6leEyp+OTqa9G5vfJAr4ibTpqHqW0rQqLcin3V
	yfZ9xa0y4IRDxys3jLsUnMltq+/hWiQE61tWMy6sQTYaSp5gcQ/LtfSRTdgAotVS
	Dbgvpj0BrA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 43cpgb9q6x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 16:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1733877252; bh=9L2IAuCjH/PEhYIKdck9J+rJoEsVBY/N7sMUVS34im8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=maSa7IineQabjLCt9yCcrliTxfhpxHJjTnBci+Z1ZsW1VXZZXvoc0VmstMADeM/WO
	 B7l5Api6qZzgVHk9DejZFa43Xp1NyJfysCQDeqhA2rFxq5hAUh3t+OH1nvLLJ86trs
	 6kIW3xWm5dXfv8HvoiPVvMDy6tT2GlOZ0wpDfj/V0WxBFaW2zbgeyJTxnFZPrnw6Cw
	 a5zcOOZSqvlZrJwfW2kjgQoi3mmytajtUWZAtuiqCOFiD2t3U6vI90t1n+t5PQnggH
	 efqakiuhVJwtJ/MtMpYm3/NJGs46xcjqP4VtUVntC9Oi/GDA94g+V1S6ZZEmEZ8nHR
	 Dt6BPxhWTGdEw==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1C1D24012B;
	Wed, 11 Dec 2024 00:34:12 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id EE142A008F;
	Wed, 11 Dec 2024 00:34:11 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=A2iVHweC;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2048.outbound.protection.outlook.com [104.47.51.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 941D6401E9;
	Wed, 11 Dec 2024 00:34:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIpSDlv9Ptg+aphtbSMsy7KZSLkwMVHDLlapVTVEzyP9LElFhAxYa2MVm/OsbXd3Yh1RT7jN3mxqBas/r3rengUFSmpgU0Vn+2fADzI0Beme93cFziT0jY/mvTilkE20ORQ1xuJytn06EXowR/44RaeJFGiVfnO/xkgNPi8c1sSutgvEDurQh1Rf5ocAL7MlVkRQonSEWBCg6G1gK+45s4oTGkZWuVJQatWFq+IcDds4bTpREgDVO3pdhbGWqj2yPhpSioUahHLeoncas39pZYYQBWHSyWNTAu7vaT7fCpx/wyC7llyuJWFuEbTy+boA4Ej6Pez2ANMMVaTBsfzNYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COZSMrh7Ppa1IKffqRR2qjKczBoB1qStFDrYh/Z+TkQ=;
 b=Al+XEFy4vBDqrxyDHqVAGC6QWXrK2GhcY3c+CqSOEkLe0dS0QeFpZaH/DXmJdso1N1at7gJaxwwXGdXVwsnpc3kucUIbLiqsu/PW/sAMqEC/1Wo9t4WQrMlMk1VJDPbGHeyRyVlZfKM9uec/QbkYRU8Rz99dE/BGVJYAU+5XCCNWrYe087oaM6uasWbzeJSMqDfXaaK2ZJn4Gaap3wJGANnWR04bRZKQBU9aaBwFeOU4ddU+x3zFmcDaCGb029aokhB5qhepfqRs1Nov5B62xDWrPjH6fFPDw8T+eapc57V+6lKf6UVkw9h0jgIK2Wl7tyV1GyPEbw7DFkYBjLHoeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COZSMrh7Ppa1IKffqRR2qjKczBoB1qStFDrYh/Z+TkQ=;
 b=A2iVHweCz1SIWdGUk8lSntXdSzAHUCtjZeCwPIR+mm0nXHctCd52uioTg9K3ci1ZHXSJY5Ug2bg14PC0NuunmLU8+8nUipMsujAvz4YJrlJq3JnIb8kGgKm0uxe1LHYu4FwQ80xN35cC3CVxmRD41yvbM6Uhe2SSZTSu1F+NgTc=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY8PR12MB7635.namprd12.prod.outlook.com (2603:10b6:930:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 00:34:09 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 00:34:09 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Homura Akemi
	<a1134123566@gmail.com>
Subject: [PATCH v3 26/28] usb: gadget: f_tcm: Requeue command request on error
Thread-Topic: [PATCH v3 26/28] usb: gadget: f_tcm: Requeue command request on
 error
Thread-Index: AQHbS2Rkq59gyV7T7EKgSHPIgOy4XA==
Date: Wed, 11 Dec 2024 00:34:09 +0000
Message-ID:
 <d4e55c13be8f83f99ee55f7b979a99e2c14fc4c8.1733876548.git.Thinh.Nguyen@synopsys.com>
References: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY8PR12MB7635:EE_
x-ms-office365-filtering-correlation-id: f9e4dec9-c342-4d08-41f2-08dd197b86df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?lbD4nf8HRMET/rY9+ze9TTthMsOdfy+GB6QPcAqzFJFkuR/XUAvEIjM2JE?=
 =?iso-8859-1?Q?agqygKKzNQen0kIuPTtjSqq9L2dznFLPhSeHVFEyk+ghwLB+VtPE8Eqyk1?=
 =?iso-8859-1?Q?S0+JfUEYR8INmKbojJrJUjgByPQQtt5WbMItekaPjhNKNWgYU4+huQnp5j?=
 =?iso-8859-1?Q?o1O9ceCi5psD6BJyMYU1P9UoYsVjCVNMGaKrp1v30Wmse2vV6S97nq+WYp?=
 =?iso-8859-1?Q?3YNBodEdcu45HojfNjS+3J8KaYOKYwcJx8Ks+tUNSoZ73e6fhj/lazLM5m?=
 =?iso-8859-1?Q?DiwO4VqDprtH99WI9sCpIXL8sWykw1vrTXq56ykMW1Ng9azJYjTwSJhyzR?=
 =?iso-8859-1?Q?VYn0ZYN6rskQA7RqTLgHFt1QxizormBZiws1RC/DMUz/gu4XE3gRWp6ASp?=
 =?iso-8859-1?Q?yKBX2twGp1fLX+KMAya6ERqNN+5q3hPPIdn3LPbaQ3xRCuIKOAwNp+OtCK?=
 =?iso-8859-1?Q?X7oX6nuye0fkWXTLHIf2GF7NVwTNO7aMu94tf6Br9ijM4OZr7X5fEpZu/e?=
 =?iso-8859-1?Q?wZ72+a+d6CUeQKk0MCJe53Lewg7UIOCKtZwsqIYNcpegnJbEjVNlu3/9Ms?=
 =?iso-8859-1?Q?bIwsmOG1asDUsH4GHVYjtieePDIRHy4vbWjozBFpZjqKarQbnRj+lvm79V?=
 =?iso-8859-1?Q?I4pCQDqEI0z+/N7u7yzwqx+pgS0bbipFs1vdFnxKkU68qgZyEIogXM9650?=
 =?iso-8859-1?Q?mn8L9r7S1VdJtGrj+MdeWjJvBi6jdBfCXCyqCqa+BSnHoMsTGx48Gmjr7K?=
 =?iso-8859-1?Q?a9ZYmFy42xZDx7oxZ1KbPc/5LP6NQn+m5f6zSnVriLyZ0ryVd1RPCS9SIL?=
 =?iso-8859-1?Q?C5f8dYp71bbzm5/IyCwq0G9kDDdgZrffjM9imIk+vDvy+gSSwnRZYt1Mri?=
 =?iso-8859-1?Q?4whtX2XYHBcK08q3J8pOUAHyKibk1D3GcjUwn4NQTB4iUTAVmJXvfTCDH0?=
 =?iso-8859-1?Q?cO9LC0N62eXnvMPxCW2C0oDCkSFEzKk6Vu25tu6qaKgixBu3lvB8WOC9G1?=
 =?iso-8859-1?Q?2aE4KA7bNn1VuPrcrVQxwrEjKGsH/cnajS5JcM1AAfNZ/uW4wPgFL5XHLN?=
 =?iso-8859-1?Q?ifB3EaIuzxBROEETdqa7YJtKH+F2TDzzhJ69yadwINUaCA2j/LUrCZP47q?=
 =?iso-8859-1?Q?V6fdFR9hZNTqZSgdKCHcHYEOisfqTev4b6aQUTRrN6/K9XNLJf8s3vldr/?=
 =?iso-8859-1?Q?EbETVajb710gY9kBMJStR9JnJ6nbprFgN/TGONyj+WoOknyNjDFKr7PLS4?=
 =?iso-8859-1?Q?krB6EpILzgAiyiWHC1SfL3F5rYg0g9VtSXeFmqNWC0kdCwwPzwLHq9R05o?=
 =?iso-8859-1?Q?n8MlJeepOJ6QQ+ytLFxXIx4qsk0AEVVWhBdI2dTCMGgDatxWMbsDUGQpjf?=
 =?iso-8859-1?Q?a2FhbRJkkIMeXAJ6vfAakAGnqn+fp3WCnaz82Tkb3+jYEN7MMZsWz6xCeD?=
 =?iso-8859-1?Q?/1jTUjyyPMCN/Kf6bBXDl+hExFLUaOuIC8I9Tg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?jCVyOrSz2W75z5Tq7CT57wPWClUyikMCQk4Rv0HvvuG+22uozAQJMChDB5?=
 =?iso-8859-1?Q?JGJTEBRI4H/DacuNeyr+7FKEVaOVIBefoMF1tY//tg7xDjWjCqfxUBCcAL?=
 =?iso-8859-1?Q?Pb2GtQXPSTMZzs/6a+9oQoXFgK1KppXBH4cxe6Pdx1gCCPclR5gJ1OCkO0?=
 =?iso-8859-1?Q?3JAmYitZkTZwuDdfxIZTaIdv/nzWrMh6mx7ldw2mtWdoJlTMd6VE6rxHQx?=
 =?iso-8859-1?Q?NLU2yPzKTJ1ZSwvXI/5PXxIvzqDFoBX8fn8wgj9JQ657ENXOrOo0RJvq4r?=
 =?iso-8859-1?Q?GkswrcOWIthT0LRfUFiQW9D9Qq5e+aKXewDSVA7g9aeIrs+JXXoW+/SD+a?=
 =?iso-8859-1?Q?Pq5833oA4HRhjA1/4zrj5nuHpKM4UzgvqsV3iR6n++P8sw1+n1Rm0IuXem?=
 =?iso-8859-1?Q?haDwvc3m7ixzDJ5iBqNmBI3h+++9o/+qMo/S8n2kgDRgNWMBwM1xNHM+pw?=
 =?iso-8859-1?Q?i2LsK6gpe3wtiT6xfbfwfhEM58ax5kmMvDhSrvX8uPb69zMZjXXofYWnrv?=
 =?iso-8859-1?Q?a69TQpgIcbVatBNh6atbpCdN2A8p5VSvp3zs+JmwhKxqubMihkFf2QuPHa?=
 =?iso-8859-1?Q?a22VRYupWrl7Ya6TxgYmZOL/q6opnthemDiVt4qU8TRl3g/NV2lBmfUTia?=
 =?iso-8859-1?Q?5DH7YC+tGIW1mjwqwJTWCAk2Kl1HPG4V7aSs7TzxVeor3Y678Tk0B6f+la?=
 =?iso-8859-1?Q?wxc2Sa8G+PSqLq098UHd9cYqwk+KUIlrEw0ES4xDSkIOt275a6RI4Onncu?=
 =?iso-8859-1?Q?Y9b68gHqcT7t77G1TpkBM2uStMSUVlF+62SXDat/GuT/7qY5roqnxoH1F3?=
 =?iso-8859-1?Q?3vCVzC9ZcWW4zbvPjNyKM2Gd6YKaHFmZYfxqU4hrrPF4GkZe+lcWg26+d/?=
 =?iso-8859-1?Q?mU/VO+c7zWzg5X9M2mXuE4q0bmca4ix58ujjK/QoWEIPOWUVX1aTljbC2t?=
 =?iso-8859-1?Q?tlEJNYkfmGKSR9spQ+Vd6rh17/XCBotF+WO0fycdpwtoXZTwF2vv/UyQK3?=
 =?iso-8859-1?Q?E+725z8GjnvKeqX7v+K1Z8H5yti6L5KE2DUPP3mjvcIxWYWAyO1H3bNKxW?=
 =?iso-8859-1?Q?0VLgn68A6AKXqD59p40FImCD0MZiXVmx52jCy830vXGyLGGeoNjd+wKEBv?=
 =?iso-8859-1?Q?FYnBuyYzk081n1OYVQohgH/AWVZxB6R7stjAvCIua6yFrLNQIYTnZHjLoZ?=
 =?iso-8859-1?Q?CWqyW8adzC4sM+o/t2Yvw/ZtiHCT8eyyeVVE8stgOcg83bKLj3Swnxiznj?=
 =?iso-8859-1?Q?hr6P/f+HdLzzKuknW7cfgh5J3Y9HPeRkg3oX5bRxyf1fGMwpnfnU7RIjeO?=
 =?iso-8859-1?Q?A6+l/zdhCn7wrM3i0I8ENqWnqNI+MQDL+9XpQP3O0OP64FlrNQOyH7cmHg?=
 =?iso-8859-1?Q?UyHjpZQ/aq4oKY6PR/cD4pX3eNj0a+HMxPoyuxRMXzYcV5zixUFMsUigfi?=
 =?iso-8859-1?Q?ToVeDG/o3Z4h6CGnuGOFDK7xUDUwFNsjS5EdpiU0gh8hoCLQz4xNAVXd99?=
 =?iso-8859-1?Q?Wm51P/rsBJWQPyXHADysRrScOSuWw4eS713/HLPOej0fZs/kuUwU/Z8V+0?=
 =?iso-8859-1?Q?iVpWmK0rAdS8FN7fL/krlTVoG+0twL1KywXzLQKFntukgQ0cFKIarYAjEV?=
 =?iso-8859-1?Q?9MqYOl8UVe5Y7ujsYpJ9/gngNm6a5KLvlXc0no4iXN/jU3eIEYBhDDQg?=
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
	G2Np1HJgK7hEXOMhc/m+xN8qZ7c+0aGvDYmxohw6SVP2GByCDuMToisLIQ7dBcDOsvwg0w2EMjaEjzutjVcDJYTto/0xnKiQWi25bBu42Eii2wiq/1s5CdhwCnYDifMkYoiUFqkNsTH8n4DrLZhPebIWJczUCA7UTZoUQhrEswN4EFXJdhIZ3qoZz6gk9ePV3lN2034iW9vAdTiwjwoYVUqkNEfN7uyYR+7c1sszRf2mwwlvESRdFmjPaJJGS/hb4Q/vinhmCWXgMfY9KmDgYsNmkWITYqUSvYVbb/HcK6ID/JMFHeDeH+1yV/0vdtuyo6cHqop2wDkhZ956NrdrAXOGzxJqRafcx9f7A5h9PpwzPvEArqwxE7j5Q7IJxGtgBsEWP+7xvku6ZtkUfYs0oJgM/VeCK7/2F4Hok7seghmnYQVFoMiMfCWhRIuo4jMzXAFCSR+IrMqmgo29Xda3uboenKoB4zQHSgIZ7Te43BRZpqqXBbCb3d13SvEYbUKMv0fjs+fj6ul27hSIqfg9H1pr4XdWIO2X3R9vLQLCKuAv+8oe+7+nZn9mW2EEg6fI9Or1IAmCnGtkmYQI5ibxjgJpspl31HzvSSK6QQflPMySW0RYjx7GWJFayMQiCcDF2L8Mj+kkCHQYKx062OWIeQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e4dec9-c342-4d08-41f2-08dd197b86df
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 00:34:09.0824
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LLpNu14j9JtjuFpGBfE8ZNP89e//oijstrSGyk0dw1g7O9g1MCSxWst2FQ8//dhkY7xERl57H0XR4jvMF79dyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7635
X-Authority-Analysis: v=2.4 cv=d+8PyQjE c=1 sm=1 tr=0 ts=6758de04 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RZcAm9yDv7YA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=1q4YP0GZM9u6_G6hc2UA:9 a=wPNLvfGTeEIA:10 a=4SauJWYdb0nqdwkJk2DW:22 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-GUID: LdmOkPlTiIEkBSIpR6Ez8XSykFPMElEC
X-Proofpoint-ORIG-GUID: LdmOkPlTiIEkBSIpR6Ez8XSykFPMElEC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412110002

If there's error on command request, make sure to requeue to receive the
next one.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/gadget/function/f_tcm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/funct=
ion/f_tcm.c
index 7ea48845f8c3..be7d8df360d9 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -283,8 +283,13 @@ static void bot_cmd_complete(struct usb_ep *ep, struct=
 usb_request *req)
=20
 	fu->flags &=3D ~USBG_BOT_CMD_PEND;
=20
-	if (req->status < 0)
+	if (req->status < 0) {
+		struct usb_gadget *gadget =3D fuas_to_gadget(fu);
+
+		dev_err(&gadget->dev, "BOT command req err (%d)\n", req->status);
+		bot_enqueue_cmd_cbw(fu);
 		return;
+	}
=20
 	ret =3D bot_submit_command(fu, req->buf, req->actual);
 	if (ret) {
--=20
2.28.0

