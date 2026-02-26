Return-Path: <linux-usb+bounces-33713-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YB5XDIuzn2kpdQQAu9opvQ
	(envelope-from <linux-usb+bounces-33713-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 03:44:27 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 866B21A030B
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 03:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AC0130CA24C
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 02:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9FF374175;
	Thu, 26 Feb 2026 02:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="K2udEo0i";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="G1PTykXE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ap7Cr6zA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0BC17A2EA
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 02:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772073638; cv=fail; b=Ge6J5aycJtdPdGspDwvYcC0PtVR9MPZ4/tPFPWaAbi9X01f796hMFr2mFaETEEKv/Nhgju0O5/Q528w3gOQvxmexe+LJ9AkBhrbOuzqOXjxnyopUsOsGXSYig+dnhHxLrlXD57URJMd9QZD1JPmWnJAZNK8T1dI/13eUwUN0EMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772073638; c=relaxed/simple;
	bh=5saTY2qiEMUmPFZOHB8d7NlNimykqt7n3EnAT4Rl5M0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qhGnqGY8IK/4klil6Pgt2pz7etzssGhMu/pxLUA6m3VroBcy455S8FCwSM7FVsepBbAPC8Njyaww7pI1BWlSojr5O0iF0VNtvgn/HQP8u90kC1d9i2phBS9SSEqX4a4yG446IYourqlIaqY+N1a3JARXYYjvsTxeX3Ha01j3Iwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=K2udEo0i; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=G1PTykXE; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ap7Cr6zA reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q1BLng1771346;
	Wed, 25 Feb 2026 18:40:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=5saTY2qiEMUmPFZOHB8d7NlNimykqt7n3EnAT4Rl5M0=; b=
	K2udEo0iWWJwt/guTs+tE1dNobnVrpUwpEWWd+7SZxKXJN7+khOu51HL/G/7g6vu
	I+7bJX1VbdPcM7xhrZz/QfIrPhYuB9WoJePxbssutZ+4TJ8LKSyF5rx3eCYNrDyy
	I952rWGnRMJ9Ef/c7eMDGIGNNlP2YpZBr7zO95WgRDSUEvn/ih9Dbl+IUr7xclHH
	wAvlYW6OisF+QWfbtHcjMyNVSdQwC86nBec6zW2kDdCK+WrR4+wB4aSWWz5GLzyT
	+X4fRE4X1WXmmpSJh9KJk9rG5P96OQJ/dfjRrjIKa8lHqRWsXG74f+2sxjxpP6jE
	ZV6DiAPrns7ifF5gxYttGA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4cj38nm74r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 18:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1772073601; bh=5saTY2qiEMUmPFZOHB8d7NlNimykqt7n3EnAT4Rl5M0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=G1PTykXEiIBu9MKXV5E0n3j0/OsrmyGHBRxNuppcRriFQlFVEDLlVkozzjOXkdWLQ
	 NZEKW+H4+2S/c24WFbdeN4xGy3vPK8Is07JaHB5aksjx1tRBYPqUeLi6QJH+brzEqj
	 fwQpXVqW1F/09NWBxemMeNqQtfTockHFsfbYLyaXrCRFexMmKXYPG8vkMcVwspS7tJ
	 opQv6gbPwjuMlWZaFf2a0pFv71LTEB2u3TXIoNIVJd3l/Siz0SlIRnlqgAwTaM+HC5
	 DR+FLRPyMxDtbn1YlAA9lvkDQYN7FdC8Ztd7MeIMLfYaUxpoDEgd0gBaqJRNzERuul
	 Z9Y6Z+MxDY0Wg==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F3AF9402D6;
	Thu, 26 Feb 2026 02:40:00 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 62032A00E0;
	Thu, 26 Feb 2026 02:40:00 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ap7Cr6zA;
	dkim-atps=neutral
Received: from BL2PR08CU001.outbound.protection.outlook.com (mail-bl2pr08cu00100.outbound.protection.outlook.com [40.93.4.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id D38604029A;
	Thu, 26 Feb 2026 02:39:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oC7r33nQNiCcW1skQU/C0pIrPhfzr9L3rEC7TVY/QfiRLV1hxNJYJsVWVpqe5GhMzAbakz4yYbX6ZUwOZ/S7/2Zf9M+Bt0R/pFmeo7ePLufBDKCXzCM12LtGNeFr65jqd9x9OXG0M1Bak1LRUv5txCpxVZpMVdrvfi2GufPciXCP0Iw33TmeUo0iMy55HKQdFbjfyaMG+mKv7HSexfteJtuMJgnl4fuyJ0TPxlDoXylVkiaD/5BScKQ8xuEP1fHOp3v5iR2RDTBeO9gE/2uUHW3KeIFUZAlUl+2BSX1o0MbG5bpAAhHQdI+li8/juHt4oxKjTILs4gLM+nA3mH6WuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5saTY2qiEMUmPFZOHB8d7NlNimykqt7n3EnAT4Rl5M0=;
 b=gAb9dAulfy2G0CXi7RnnWhWt9wbdeqF/4mXvOuN1q0Cs9QH3draF7Tg+Sam3XqpkexOhfdANoLklPCfWZwc094wccOWAd6Fvszitv3AX1PHRpcEJM3niq+toZhjKH55CTfu6d7tKJS2Qpgb6TJ++KWz/PQG4V4e0rDs0sm3GHkcxUJz/Fp3mMQ6uS7O6VG3148PR+KasVzWjQI2F9AZ/KkpjgcEuQC1bTpN1rGqWOAAvEg9fZP2Fi+Not4uiRQKhCEpqHUitti9+XsaEf2hU9JSrBvlVBgZgwiRZOGDEnX6nJNqba7+waIcjBvnxh2iUaUUtalQWcf9P6qWEtneWfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5saTY2qiEMUmPFZOHB8d7NlNimykqt7n3EnAT4Rl5M0=;
 b=ap7Cr6zAKKwhThcJsuTNA7Z/8gNYhbHpriaZvq9rIY/urYgYBeApxWnZLTty9sD8F2T8gTse7VuGlNmCZfvCDr++RmsnCXQMsk2DPAMCzkY+hgIaOlvQp2PJtxlVdGr9UIrcnjP/K+K2bSbeRzKCk/bXAvB52rLdAGLTG1kRqi8=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY5PR12MB6201.namprd12.prod.outlook.com (2603:10b6:930:26::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 02:39:53 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 02:39:46 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Ingo Rohloff <ingo.rohloff@lauterbach.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: Support for USB3340x ULPI PHY, via
 "snps,enable_xcvrdly_quirk"
Thread-Topic: [PATCH] usb: dwc3: Support for USB3340x ULPI PHY, via
 "snps,enable_xcvrdly_quirk"
Thread-Index: AQHcpZf4208n0sWyuUS9s4MYOirBG7WSiaIAgADVroCAAOfJgA==
Date: Thu, 26 Feb 2026 02:39:46 +0000
Message-ID: <20260226023935.ge3vlasodrrnhq6o@synopsys.com>
References: <20260224141438.39524-1-ingo.rohloff@lauterbach.com>
 <20260225000512.tle2eu4gkd4ut6bf@synopsys.com>
 <20260225134959.39e775ff@ingpc2.intern.lauterbach.com>
In-Reply-To: <20260225134959.39e775ff@ingpc2.intern.lauterbach.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY5PR12MB6201:EE_
x-ms-office365-filtering-correlation-id: 1c708a1e-2f5c-47da-fe05-08de74e04e3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 T6cbkZC1uGPypUp0tINwJmH99nAJA/vi+7Iy2fQU1bHbHJvW6ch91rXXvn8tfWjqb8D09IDGOcimjYVKnSIOeqcT53HVqBIqSsBsspCTevKW4rKwNdCPUboVAtoYRq1lolW091DFm8CwI+SOUm8Kcj9X3pSOmhUDxhG8vDXFBXncFKvGbgdtFimL+PNd5obsaWw7vPE7gO3Xyn73Q/Jkqf9kaDqnfjTlT24BstgTbRQ50FkHwof4lp7oxsphpKrVOmZONhGN8KoU9Eiaco3oXWEOEimRNJPBAvVXjveGIJIF/eJr6yFxACiCdtNFHdjc9hJvTh/w8OT28JBm9CG0EO4ZHfUrhnFbehSdZBkahKIerW7UoF8AblNHH4lHR+ork9xkNbSgu2SKHopKKeWMyH8ghvndwdnHR0wceqKjlkFqA499AAiwGfypKPVyQZfsIthvBNJ8NP8bT2UenDN/Q9WvLo73pmgH+vqioxsfz2I45S9b9LClN+qZ7Eaw1yz+KWBKKm8cZ694W1PxCcpr4lBbEe/nzLp9C/kh8jgK4fGRlijAd2pcMgBeuhRlX+LBKu6hJqr4avj+JcwZAyG3YFeKIsghumHSPdzRbms0iwIp5ioNlI4n7Yx0Kfv9iZPiDQ33S93kYVhU9TH613rOpfPpiXsykh1daNHVJPCPE66HmHPs3JkZyFt6adkXML164X7gUDoIzjSYZWkNBNFa0uMu/nQtRjQbCqbSYt/na3LTVwRn0aziMTu55vkcXj6lmtMgR6gDm5Xw80wsT/pPqVeEircy4jr3YbapCoptekQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bTAwZUhza2UwdS8xNkJGWVp5ZkZTcld0eGZZWTc1aEFGZEhVZExkZ3E1dU1U?=
 =?utf-8?B?SmJ3Q25RQjRwb2dEMEMyR2MrZTRGSDNWUmc4Q0FsUlZzc3NIM3kxZTRVWEpw?=
 =?utf-8?B?UmhBM2llblJjVTRJZUhrZlRjVlY3Sks2OEZJYTZadnF0bGNLdGRjb3A0cGJN?=
 =?utf-8?B?ajg3NTkvSTB0a2dvZ09GS1RFK3NDejNNVitUSUVaZys4WkFXVFBLOGJ3ZXFX?=
 =?utf-8?B?bVRnVWxCaWVNR1VlR0VWbnIrUzVYc2xYOHpoZ3p4YlZyWFpweng4UzZsei8r?=
 =?utf-8?B?RUxPak5BZ1crZlIya01YQjNmZVpmZi9aVXNJMDkrS284Ny8wKytQN2JwRzVP?=
 =?utf-8?B?TGZZWXJMd3RWTDZSVk9PR3M5elZpdXpGRk9tNStOOWhLMnpCeTJDSkM5T1Zo?=
 =?utf-8?B?TFlqc1dIM2xUdng5dmdIYTFpSUF3SWdNNlhHTHNHSDZvWmVONGswaFdyamZW?=
 =?utf-8?B?QVcxWjNCTlcvQ09remc1MkEvV2xUaVB6YXJhU1B4ZlBKQUhZeGZScFBnWWVp?=
 =?utf-8?B?V215WEF2VWFXSXdsQUhPUnozRVg1dExkbm0wNCtCZmgrSFRjMDk1OTFvZi8x?=
 =?utf-8?B?NjlkdHZJL3pKbVVFakhQL3U5T1ZiaDFpYTB3V1dyckpDYlNpTllmWm9CczRl?=
 =?utf-8?B?dlNsbENzRGhYV1BHRGpUSGtMYjNSSVdzM0p0VnpzKys3eE1FTVVoVzY5TGNH?=
 =?utf-8?B?WHEwMWxRQ1U0SmREVmlNcVBqNUdFSW5rbmR2eDMyL3VTZVJVM1VjZS84bVVp?=
 =?utf-8?B?RnU0eUJnbWxYQVRvcDdkMHZkVVlQT0VjNEtEbU9nS1k4N1JWcWNXQ1VDS3RJ?=
 =?utf-8?B?WVR5ekVOcmhLNVJuRVN1SXpoYnVob3c2UzRyT0Y3MmNEVDRYdEVyVDhUbFNj?=
 =?utf-8?B?RngrZVR5OElIcVFtbTdNMXpOTE5ST21zMnc3S1FlRExpN1RPaDhXVGJNODdx?=
 =?utf-8?B?Y3Y5MitaeUxyRS9YZm5CTlJoVUVZdXBPU0NDWlZUTnp3aHROVUVBeUZsbE0w?=
 =?utf-8?B?NEtPVFhaK016OGNjYjl6aExCUzk4NWgzRjdOdVl2NE9tc2pwQ2prdFNwKzF3?=
 =?utf-8?B?dzlDNTZpdXI4d3hvS0ZFcWpScmkzSUlTNytkaEdKUTlhQmhZRzI3ZjBBdzQ2?=
 =?utf-8?B?dXRIWmdVcWs2cWZnTDhYTXBuSXM0dWk3VmQ4bU04cUMzK001VmkyV2N0N2F5?=
 =?utf-8?B?U1lEekh2WE1xTjByelNMOEVNMnVHZWd3TkNQRnFBRmM2bVpHcWhLRnpNRTZi?=
 =?utf-8?B?dUdNTW9oYzg2UHQ3UGphSVJHcEFqSzhwQ0t0aS9SdWxvQ29uUzlEOURxeTZY?=
 =?utf-8?B?RkQ3R3hPUTQ4aVlPN2JRcnlkbTBKVU95Z1QzUHpZb01WalFPZXcvTThkWW1I?=
 =?utf-8?B?bU9ybEtpUGNqK0FaTkQ5UzRmODh4OTdHMW1BUDEySnd6TSt0U2pqUXJRL1ZX?=
 =?utf-8?B?Y3hlNmJ0TXZWQTVzZUYvMnpjMHp1bktNeEdoZDdDb3V3YjQvWkVTbU9mMXJ1?=
 =?utf-8?B?WnFrakNLN1VVWkFhYTBpNzZEUERCcGlKeXpjZXVMZkZvT0VzdW5oaDNXU01T?=
 =?utf-8?B?cWxQcTg2eWdVSXpEWlcyQnhCUnlHM0g5YVFLcGhGd1E0MWhkZ2czTHJuVXQ2?=
 =?utf-8?B?dEFiSzVkTXQvTCtHSDBveDZjOVBzRndoOG1UcTllTmd2VXJ1V0hRL3orbzRi?=
 =?utf-8?B?aU1kUGFTY0JCaGY5bEN2Y3dWQ2JwY0FjenVJMkxRbXlOT015cFF2NERKQ2Ew?=
 =?utf-8?B?M1FCQ2tmVVZIdTErZHk0RG1QWm5iLzFDZC91Z1U3d3RZVXJKeVBxNTBaaHdp?=
 =?utf-8?B?RU5oYVlGZG4zRFN4bVdZWGlzUDNWTG9tSXZlN2p6VmIxWlVTbzlTVWVlSlIz?=
 =?utf-8?B?SU1sTFlNYWRtbFJnYUlJbHpFWXUxL0VBM1pvU3c0UzNSeXBPTmJlbmk4S1l1?=
 =?utf-8?B?REZ1Rm8zMyttWWNVdWFqeFh4NnUyKzNBNS9GdWlXM3RZVXVPR0E4TmtQUndX?=
 =?utf-8?B?VFRHOFNlQm5LRWQwanRJRzdjSHhwNTR1TUxZWFl1TFBVTzVrNE9SbHdDRElW?=
 =?utf-8?B?U1BJRThNK25hR0loaVZYV3RYMDFXYXZGa2EyZlZPWWZUeGUyYi9QMWNZT0pr?=
 =?utf-8?B?QmRXbldoZENEaFY0M0VwaWlseGNjbkpUQnpMY3V0OFpxQlQyTmdWYVorODcz?=
 =?utf-8?B?Z2N2ZytQVVovNC9PWDdES1NZeCt0MmpqK042Rys5cnNad2ZjU2VaRDhpb2Fv?=
 =?utf-8?B?bHdlem1RY1Fxa2t1K0VpZnRVUnczWUdSaTdTemU3RnMxai9lTjBONllTNTBz?=
 =?utf-8?B?SHgvYTArWUtzVjZMdnhibS8vdy9pMVM1RkF5TFVyM0hLN3pzQWFTUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D0EDC2CDECCBF48BC9860EF776082A1@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zK/Ug7MugRsi6DiMgxgQcdWx0JpjeTmoBb2n6+BbByTiSPychl2tN6pAoIbxSy/VYR1L5nmrp6AJ1A2b/Uw+bWR3YzSFIdmRL5ReD6lSIudL2vK1x6St8Efg8LmYvZir38vo8YNpV88lMHel4dAvYFW0xqmHpss+tPcefGxe8snT+6nKyAyKOAS60QkTNxvN14wJ4tymfBd8ZHt8qW4aGUt4NH6vRqPXtKw9qzDrb8OU8xZiiiMl0dCbxCGMic6+Mt9SDXW9OTSUIk1Tqi16fptNlLJ5ViT0mjy9BHXr500VwT5C4AMpmYFWcxY+rT3zuO5FHxt3Tspgas+XY7SELQAjetwKX2/luwFXn9siTlKQN8RwZ4tT6aLU8q2dtcjsNYBJIa9QOaNyhy3nb7B+49QhvzLgPMJetD8Vlj4X5zmY/IOvKqnKbLiGSnsmHQfBQ9IdVuCLVm9QRdLO7xmfAkplE3EaIKLYCTfmM3JuLUZBnYjRDOJ6c+l8W9F60uDcUehPo311UHRKYtjnk7B7GK4xOiWz7e4wH4zW0UTGArSAWDmUXgjl+nVuQxQO9w8ek9doxiP2mQg6SuabRNAj1wiivU3SmJoZhXFRnsOhWsBrKcolXs4Fow55MlhOG3O2y1ZBQv4UD8bATFwoI/dNGQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c708a1e-2f5c-47da-fe05-08de74e04e3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 02:39:46.6904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G/oG+6hA3/onuDZLFEN0Ya2DxAo12gCVGLwws8V7mP/1QN4HiET0r9CA/Q7ETwAbm7FeLn2y2jV1isvQi6tSiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6201
X-Proofpoint-ORIG-GUID: m5LJp9SRKfTtYcGq8hvTVsqKCQTNcsm4
X-Proofpoint-GUID: m5LJp9SRKfTtYcGq8hvTVsqKCQTNcsm4
X-Authority-Analysis: v=2.4 cv=eOAeTXp1 c=1 sm=1 tr=0 ts=699fb281 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=jIQo8A4GAAAA:8 a=-oou_w__SzVbaIw1E0IA:9 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAyMiBTYWx0ZWRfX/sAfpDCRjqmC
 zC4iEY+Q5wA4sqJsALuexJjhqWCInQph42wM6dZ+1JM5YO6EyWeRZcj0rPS2JLi14CbNZqz9P6w
 dIlVQrCxzFjypHSqSIZZc05uTkYw2klFfT88wvZzhZNzJD84/tBgDrUKo8ss7gxo1ejAqE3XSc2
 aSsWjNqH3LXnPX7eJbkZYZHd0srannKT090ItDUk17rYXmuJSvXUCweDg8pQ8hmunHBiX3TcOVu
 DGln2wuPN7Zs7BMwVABNve79WsoaZJr/R0teHKLAau5i2p7+H6Pq8goJRThODgSbiAPmXbuDnBm
 Qf0ve0rG+gF23/cXtd541VV0kJnelZ6R0GjeRTzaqmhurNWEzTul60uELBq+SavgavP8xQFTa7R
 1sholhLbKFn+aspTc7z95jMDIwteteUPe6YfWZHcmISUJ2VnZUjfUm0EClusI8MmksfJIvSeSzA
 czItD22MmmVaqL44W+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 phishscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260022
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33713-lists,linux-usb=lfdr.de];
	DKIM_MIXED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[synopsys.com:mid,synopsys.com:dkim,synopsys.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,urldefense.com:url];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[urldefense.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 866B21A030B
X-Rspamd-Action: no action

T24gV2VkLCBGZWIgMjUsIDIwMjYsIEluZ28gUm9obG9mZiB3cm90ZToNCj4gT24gV2VkLCAyNSBG
ZWIgMjAyNiAwMDowNToxNyArMDAwMA0KPiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5v
cHN5cy5jb20+IHdyb3RlOg0KPiANCj4gPiA+ICsJLyoNCj4gPiA+ICsJICogRml4ZXMgSGlnaC1z
cGVlZCBuZWdvdGlhdGlvbiBpc3N1ZSB3aXRoIFVTQjMzNDAsIHNlZToNCj4gPiA+ICsJICogaHR0
cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vLi4uLzgwMDAwNjQ1QS5wZGZfXzshIUE0
RjJSOUdfcGchWnBrc29ZTlRDb1Vsd0Eyb0ptWWk5ZGJGd2xRMzVtTUtiWmlFYmNBTkpyZU90b1BF
azgzR1RkOFh3d0tHd0hRTE1tSlZOY3RPTmktbkJEZ1ZUVFBZbHRVQTY2dDRBaFkkIA0KPiA+ID4g
KwkgKiAgICAiRGV2aWNlIEVudW1lcmF0aW9uIEZhaWx1cmUgd2l0aCBMaW5rIElQIFN5c3RlbXMi
ICANCj4gPiANCj4gPiBUaGlzIHBsYXRmb3JtIHNwZWNpZmljIGluZm8gYW5kIGhvdyBpdCB3YXMg
Zm91bmQgc2hvdWxkIGdvIGludG8gdGhlDQo+ID4gY29tbWl0IG1lc3NhZ2UgYW5kIG5vdCBoZXJl
Lg0KPiA+DQo+IA0KPiBEb25lLg0KPiANCj4gPiA+ICsJICogQWNjb3JkaW5nIHRvIGRvY3VtZW50
YXRpb24gb24gdGhlIEludGVybmV0LCAgDQo+ID4gDQo+ID4gV2Ugc2hvdWxkIG5vdCBqdXN0IHJl
ZmVyZW5jZSB0aGUgIkludGVybmV0Ii4gSWYgeW91IHdhbnQgdG8gcmVmZXJlbmNlDQo+ID4gc29t
ZSBkb2N1bWVudGF0aW9uLCBwbGVhc2UgcHJvdmlkZSB0aGUgRFdDX3VzYjN4IGRvY3VtZW50IHNl
Y3Rpb24gYW5kDQo+ID4gdmVyc2lvbi4NCj4gPg0KPiANCj4gSSB3b3VsZCBsb3ZlIHRvLCBidXQg
U3lub3BzeXMgd2FzIGNvbXBsZXRlbHkgdW53aWxsaW5nIHRvIHByb3ZpZGUNCj4gYSBwcm9ncmFt
bWluZyBtYW51YWwgdG8gbWUuDQo+IA0KPiBTeW5vcHN5cyB0b2xkIG1lIEkgc2hvdWxkIGNvbnRh
Y3QgWGlsaW54IChub3cgQU1EKSBmb3IgYWNjZXNzIHRvIHRoZQ0KPiBwcm9ncmFtbWluZyBtYW51
YWw7IGFuZCBvZiBjb3Vyc2UgWGlsaW54IHJlZnVzZWQsIGJlY2F1c2UgWGlsaW54DQo+IGhhcyBz
aWduZWQgYW4gTkRBLg0KPiANCj4gVGhlICJJbnRlcm5ldCIgd2FzIHRoZSBvbmx5IHNvdXJjZSwg
d2hlcmUgSSBmb3VuZCB0aGlzIGluZm9ybWF0aW9uLg0KPiBUaGUgZGVzY3JpcHRpb24gSSBwcm92
aWRlIGlzIGZyb20gdGhlIGZvcnVtIHBvc3QgSSBub3cgbWVudGlvbiBpbiB0aGUNCj4gY29tbWl0
IG1lc3NhZ2UuDQo+IEkgcHV0IHRoZSBkZXNjcmlwdGlvbiBpbiB0aGUgY29kZSwgYmVjYXVzZSBJ
IGFtIGFmcmFpZCwgdGhhdCB0aGUgZm9ydW0NCj4gcG9zdCB2YW5pc2hlcyBhbmQgdGhlbiB0aGlz
IGluZm9ybWF0aW9uIGlzIGxvc3QgdG8gdGhlIHB1YmxpYy4NCj4gDQo+IEkgZ3Vlc3MsIGlmIEkg
d2VyZSB0byBnYWluIGFjY2VzcyB0byB0aGUgb2ZmaWNpYWwgcHJvZ3JhbW1pbmcgbWFudWFsLA0K
PiBjaXRpbmcgaXQgbWlnaHQgYmUgYSB2aW9sYXRpb24gb2YgdGhlIE5EQSBJIGxpa2VseSB3b3Vs
ZCBoYXZlIHNpZ25lZCwNCj4gYnV0IEkgYW0gbm90IGEgbGF3eWVyLg0KDQpZb3UgY2FuIHNpbXBs
eSBub3RlIGluIHlvdXIgY29tbWl0IGxvZyB0aGF0IHlvdXIgcGxhdGZvcm0gcmVxdWlyZXMgdGhl
DQplbmFibGluZyBvZiB0aGlzIHNwZWNpZmljIGNvbmZpZ3VyYXRpb24sIGFuZCB0aGF0IHRoaXMg
c29sdXRpb24gd2FzDQpwcm92aWRlZCBieSB5b3VyIHZlbmRvciBYaWxpbnggKGlmIGFwcGxpY2Fi
bGUpLg0KDQo+IA0KPiA+IA0KPiA+ID4gKwkgKiBEV0MzX0dVU0IyUEhZQ0ZHX1hDVlJETFk6DQo+
ID4gPiArCSAqICAgIEFkZHMgYSBkZWxheSBiZXR3ZWVuIHRoZSBhc3NlcnRpb24gb2YgdGhlDQo+
ID4gPiArCSAqICAgIFVMUEkgVHJhbnNjZWl2ZXIgU2VsZWN0IHNpZ25hbCAoZm9yIEhTKSBhbmQg
IA0KDQpUaGlzIG5vdGUgaXMgbW9yZSByZWxldmFudCB0byB0aGUgaGFyZHdhcmUgZGVzaWduZXIu
IEl0IGRvZXNuJ3QgZXhwbGFpbg0Kd2h5IGl0IGlzIG5lZWRlZCBmb3IgeW91ciBwbGF0Zm9ybSBv
ciBhbnkgb3RoZXIgb25lLiBJIHByZWZlciB3ZSBkb24ndA0KY2l0ZSBmcm9tIHRoZSBmb3J1bS9J
bnRlcm5ldC4gUGxlYXNlIHJlbW92ZSBpdC4NCg0KPiA+IA0KPiA+IEl0IGNhbiBiZSBmb3IgYm90
aCBVTFBJIGFuZCBVVE1JLg0KPiA+IA0KPiANCj4gQWggb2YgY291cnNlIDotKQ0KPiBJIG5vdyBt
ZW50aW9uIGJvdGg6IFVMUEkvVVRNSS4NCj4gDQo+IA0KPiA+ID4gKwlkd2MtPmVuYWJsZV94Y3Zy
ZGx5X3F1aXJrID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYsDQo+ID4gPiArCQkJCSJz
bnBzLGVuYWJsZV94Y3ZyZGx5X3F1aXJrIik7ICANCj4gPiANCj4gPiBVc2UgIi0iIGluc3RlYWQg
b2YgIl8iIGZvciBwcm9wZXJ0eSBuYW1lLCBhbmQgY2hhbmdlIGl0IHRvDQo+ID4gInNucHMsZW5h
YmxlLXVzYjItdHJhbnNjZWl2ZXItZGVsYXkiDQo+ID4gDQo+ID4gLi4uDQo+ID4gPiArCXVuc2ln
bmVkCQllbmFibGVfeGN2cmRseV9xdWlyazoxOyAgDQo+ID4gDQo+ID4gRG9jdW1lbnQgdGhlIG5l
dyBmaWVsZC4gUmVuYW1lIHRvIGVuYWJsZV91c2IyX3RyYW5zY2VpdmVyX2RlbGF5Lg0KPiANCj4g
RG9uZS4NCj4gTm90ZTogSSB1c2VkICItIiBiZWZvcmUgdG8gYXZvaWQgaGF2aW5nIGRpZmZlcmVu
dCBzdHJpbmdzIGZvciB0aGUNCj4gbWVtYmVyIHZhcmlhYmxlIGFuZCB0aGUgcHJvcGVydHkgbmFt
ZSB0byBtYWtlIGl0IGVhc2llciB0byBncmVwDQo+IGZvciBib3RoIGF0IHRoZSBzYW1lIHRpbWUu
DQo+IA0KPiA+IEFsc28sIGhvdyBhcmUgeW91IHBhc3NpbmcgdGhpcyBxdWlyaz8gVGhyb3VnaCBk
ZXZpY2V0cmVlIG9yIHNvZnR3YXJlDQo+ID4gbm9kZT8gSSBkb24ndCBzZWUgdGhlIHVzZXIgb2Yg
dGhpcyBwcm9wZXJ0eS4NCj4gPiANCj4gDQo+IE9uIHRoZSBoYXJkd2FyZSBJIGhhdmUgZ290IChY
aWxpbnggVWx0cmFzY2FsZSsgWnlucU1QKSBJIHBhc3MgaXQgdmlhDQo+IGRldmljZXRyZWUuIEkg
bm93IGFkZGVkIGEgMm5kIGNvbW1pdCwgd2hpY2ggYWRkcyBkb2N1bWVudGF0aW9uIGZvciB0aGUN
Cj4gZGV2aWNldHJlZSBiaW5kaW5ncy4NCj4gDQoNCllvdSBzaG91bGQgcGFzcyB0aGlzIHZpYSBz
b2Z0d2FyZSBub2RlIHRocm91Z2ggdGhlIGdsdWUgZHJpdmVyLiBJIGRvbid0DQp0aGluayB0aGVy
ZSdzIGVub3VnaCBqdXN0aWZpY2F0aW9uIHRvIGNyZWF0ZSBhIG5ldyBkZXZpY2V0cmVlIHByb3Bl
cnR5DQpqdXN0IGZvciB0aGlzLg0KDQpCUiwNClRoaW5o

