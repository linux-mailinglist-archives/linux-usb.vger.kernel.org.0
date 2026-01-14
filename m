Return-Path: <linux-usb+bounces-32360-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBD7D21CDA
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 00:55:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F61930222E1
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 23:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0F535E546;
	Wed, 14 Jan 2026 23:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZiKylHBn";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cpXiCKU8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="aB4PmTIc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BAC1C3BEB;
	Wed, 14 Jan 2026 23:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768434942; cv=fail; b=pgWj/+fBvZx3neYmKOUEXiSF5TM2jocUggDJwnLKHG7W6PPz5cr0JT93DyKAVI7neDeaWlQsExIO+O/493QAhLe6ni9/EsuPPIkAP1U0gyTW/G3nahrlTbCoNAuVgAm1ylKVd0xgo6t/kIC/6gV9IV2t9SGHxI9pta26T16CkSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768434942; c=relaxed/simple;
	bh=NASTrCPKJW2aeEL0G/k+P+akJATcePJpUnGZMaOI5Dw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AhfcQzF36+k9My7ugnzoF9wKbKMlOAQA3HjQI+GCPfMAufzmW2s72mDDQP9B7Zz/ymVpT956F9IY+uF3DeqWrJnF+IPUFdAhKyIlQqCYt2cXAKTzifGa9WyIHjRzltJ4r1U1T4/ZhkVIumjAvQwojxMk4ujjQJ3TrJyJUZIaGQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ZiKylHBn; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cpXiCKU8; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=aB4PmTIc reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EN1YvO2537301;
	Wed, 14 Jan 2026 15:54:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=NASTrCPKJW2aeEL0G/k+P+akJATcePJpUnGZMaOI5Dw=; b=
	ZiKylHBnMaQOxnycm9kbKPHkP1ozd85WRpjk34QqsUiMv7RPRjrgi666X6fXzuIU
	XJAlK9DGk6fX8h98i2eBeE4yacNSlVON1E5WSrOH3GzAJFrD6EvHE7SQx8Eksh73
	0Wgpdj4cDSq2JzEw0v2BiU1+oTqxGI+l0JAf3YfnZr45GdTDmxTc0g6cGVMSe/ng
	8K+BjmJDuYMp5rsZK7s8TJOSaZGfiHstwu5+UOgOGoilV9Cy6KTg3Ntr2o60i1b2
	9GoEv5AfLjhhMCcy6rcXXbuIJsRL4/ax9o47m3TNmRLxnph5z+bb8TotdRnF8hiW
	DZyWX8RMt4GdkTHUj1++tg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4bny096ks7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 15:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1768434853; bh=NASTrCPKJW2aeEL0G/k+P+akJATcePJpUnGZMaOI5Dw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=cpXiCKU8KttThA8cBmg/ZZmPmibPQlU81kRFwv4pRrFg8yYFCHJ8PzL+0/LN5D1xB
	 W7dm24XZTwHkCfuArFvnWlbE58xVNAV33IN/gvv4qwDIhWsN6yy4Xf7QXKx5QCnwtt
	 czcf+TAfppDRur4is/I249VyRGHvk6lnIib6o09nnxCpNM98fCrwj/KvWcRg9PxsJM
	 6HHDhInP9kIJBcqu9Xv21NBX/INDvIEXuHbkWbGMgjRkwiL53rKHlN70WkvkQ/jkhs
	 R6yRMMLoswZr1JxNrEa+gqgXLfn7JLiFE/s4jWYG2POUOUzVm5UhKUIvaPmYmq4AOD
	 EJDjtoD9dXxgw==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5A5B9402B2;
	Wed, 14 Jan 2026 23:54:12 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 71F29A0070;
	Wed, 14 Jan 2026 23:54:12 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=aB4PmTIc;
	dkim-atps=neutral
Received: from BL0PR07CU001.outbound.protection.outlook.com (mail-bl0pr07cu00102.outbound.protection.outlook.com [40.93.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 29D1A220414;
	Wed, 14 Jan 2026 23:54:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/S7rNU5pGcltxywQ2u3jEfi1SHtBmlBWp2bfFUSJEvv9YLHN9sxoWarQ4gLEU7qP3rXykkS9Hp+lsjguaL2E8nMwKzdEqIRUFghbIObdbIaw2fKmvolyehVKu6DDMFtUrLDyFXbJXDo15gWed5ui1l7IjCO4pYjG9R9L8mkV19q4ZAz3iYyulGDdbxET7+01DLQIEVKpj047+QnrIBI+NE7aIj4v1m3ruxQezvFlSHhuwwoS4a2kYfplFzfzO84O8iZ24PZDxkVngPyPqUZbDyVKym0sZkSBoZdprwdTJInNmxJADKuNjqpbMcanZ4NvWrBV7LlKkBc4sHxAKDGWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NASTrCPKJW2aeEL0G/k+P+akJATcePJpUnGZMaOI5Dw=;
 b=TOwj6Mr3OR946Ur/tTZXfzp/R+BAujTV/6pOmVDMtIeC69pyHEF16gzExX5Jf1oE32R1FouuUAhVhY8+SLx6lJ4oECaksID/tDXEXAi03jPpnztusVMYHFHMFiJ59hlC/YvXPmEG1lVxs5kJWXHx5lvmRzsJsWiBsctJywT54DgCNdD+sqqUC108ezs5rh4R6B7aSVbRGaH9VI+gMZL/Nbka2l2Ax1kUvGEqKDmMWbAIAHwck3892VwNvv52C8Seslpr7R7T6lJctLBXftwaXIZwlodkL2acg4L1w1/pkp+yJOgw5yjSlGLp8V1SCMepsHlCXApo0WRQq44LV52TmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NASTrCPKJW2aeEL0G/k+P+akJATcePJpUnGZMaOI5Dw=;
 b=aB4PmTIcZyLzMlZ2aor4gdVRjo0phMSuTrVAV+2elwFNAnV47b8ZBogbgwbbbvZcWz5eNbY91Xhf57PYMSgEkzUgL4s7o6B7a55nU5cRCPqORSWGiYpE8nLeATsdn3OybdhTOKWKk/ngUm2lWWVGEOAXI2zIM8gcJsm72A2/EAk=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY5PR12MB6177.namprd12.prod.outlook.com (2603:10b6:930:26::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 23:54:03 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 23:54:03 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Prashanth K <prashanth.k@oss.qualcomm.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] usb: dwc3: Log dwc3 address in traces
Thread-Topic: [PATCH v4 3/3] usb: dwc3: Log dwc3 address in traces
Thread-Index: AQHchT2wbJQWlMamnk2JtLup9X7IcrVRio4AgAC8f4CAABCPgA==
Date: Wed, 14 Jan 2026 23:54:03 +0000
Message-ID: <20260114235357.zueeylekf4lfdq4g@synopsys.com>
References: <20260114100748.2950103-1-prashanth.k@oss.qualcomm.com>
 <20260114100748.2950103-4-prashanth.k@oss.qualcomm.com>
 <2026011400-monthly-commend-f89b@gregkh>
 <20260114225441.rn3affmwuhfl2z7x@synopsys.com>
In-Reply-To: <20260114225441.rn3affmwuhfl2z7x@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY5PR12MB6177:EE_
x-ms-office365-filtering-correlation-id: 40e1a83a-5343-45b2-317d-08de53c83253
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Q0ZaV2RKSmlKQlMzNmFSYzB6bmwxOGlHajIyeG4zYW02YkMrNWpUWWE2ekEr?=
 =?utf-8?B?azBxUGFkTnNsS3hXRis5R2hjT3gyMk1hSVNHcVV2MHpCK3Zhc2IzTmNIWXBy?=
 =?utf-8?B?c1Y4M0thV015bVVEMTNQU1NrVmRWbW5PYWZpRTJrOUkzZ3NVdTl1TlU4T3hU?=
 =?utf-8?B?aE5xNXR1QzZIeUg1L0p2UFViazd2bTVOSllGQjN6SFVRaFYwaXVQd0pwU0lN?=
 =?utf-8?B?VG41dWk3TWVpN1Q4NWNWSmhpWHhub0lkS1Z4WkQ3cVk2bmV4MEhjbDN3SEdx?=
 =?utf-8?B?WFJWTWowZ25LUkcyVlZsRGtwVE5oaVExeFVNUGRScnVTSVNNV3FXSSt1ZFVS?=
 =?utf-8?B?OHA4UStoNWVYby94ZnFLaHZJODdKSzdoWkFxeDYzcm9jNVlDSmRuYjVxc0or?=
 =?utf-8?B?VThLR3pYbW9sb2ZRV1VUcHlVV3d4dmlYajZ1S0N3VWpoUXNQdDVMZ21DWmFV?=
 =?utf-8?B?aEFYb2k5ODhZSHgxR202K0pmamZBNUs3ZWhqZ2l5NGRML0NERE8xOXpuUjJw?=
 =?utf-8?B?eEc2T29ZV3ZkOXhlaE9sdjN0NUxqRUJsTGJGVERaUFRJdjN2dGpzZ3JoRVB3?=
 =?utf-8?B?L1VVc0lnby95NjVBVENNcFBBQkNnWTdLbjFZNVMwUG5xK1haelcyemY2eWl0?=
 =?utf-8?B?MXdlcVNwYzVkeGs4VHFteHBQT0xNS3BTa2ZRZ25maHRDMXpleHlKU3pYODFQ?=
 =?utf-8?B?Vk5ibWVEWnNRa2hLcTl1cllUeHVOaGEvVnRpbWxXQ2VWSkNIeC85U0FOaDBZ?=
 =?utf-8?B?cTl2eVV0TlVUKytMdnlDNkYwV1hZckRUZ2xXd2JZOWxNS2dkUXlXRzg2bnRh?=
 =?utf-8?B?WDExdVJxSzJRMjl5c3l3R0VCN3BrVk91ZjNSMitFWVhUN0RTNnBCNGJKQkVE?=
 =?utf-8?B?WDdjdDNIanhWSHlpaVo4OUpHNW0rc2dlWVRPQmZ2NGpabGNKVmszZ3lxekxS?=
 =?utf-8?B?bmljVGVHK3ZGNlJEQXdmRDlGMUxPQTNnbGdoK0RWbllNcXUzUjRsL1RGRERC?=
 =?utf-8?B?aUJXSmdGci9pclNNcGMvM3oxdUgzb0VvZmRHTG4rK0ZReStEMHJsTUx4WnBZ?=
 =?utf-8?B?SHJlWEc2MEVDcGpYSFplKzBpZnNlL3BDblpGZUIzcjU2MGEyU2xyQTBxYVZa?=
 =?utf-8?B?ZXFyMCtDa1ZJZnRad2x2TkJRSGQ2aThDMTczRWFZd3VSbVp4d3hSUklNUTB2?=
 =?utf-8?B?dXZzM0Zna00yaEMvYkVUT01LZlE1SU5OZG9aV3BPVysrRDdQODBtcllEOG1o?=
 =?utf-8?B?cFhyam42TzlDNDd0c0dZMFVwVE1leEpXQ29oRkJQTy9wR3ZBbDlOemp2Vk4r?=
 =?utf-8?B?TER3eWEvWXk0SUFxVEQ5czdZTkRWek5qQzg1ajlNdmwxWFlyeGp1Y1NEZDRO?=
 =?utf-8?B?N3gzbjFrcTdaNitSQ3FmTTc2eEVxNzJqMElGbkk5VktXZWtiOUZGMHdjSUov?=
 =?utf-8?B?cXNsbzMweEgzTUhoTllQcDJSQXJMUmREVWwvOW9CbSszeVBNR3JQdElNZUJh?=
 =?utf-8?B?V2FEQko1azN0dDd0eEphOVpmWHEvNFRtby9iMjM1RzRIRCtRQnowWEl1K2I0?=
 =?utf-8?B?ZFVRTTdUUlpPaWNwdmRFUTZvK0NTSm1rdWlRSXc1WFExNUZQT05QUGRscDFP?=
 =?utf-8?B?clc5amMrZUdmV0plMVlVcUVKcXVhbmx1cGZ3aWUwWFlMbC85SU5NSTlSSDR1?=
 =?utf-8?B?N3pIRFU3ZjdXbkg0aitZSkYya2l4aGdKcXV2M0lGamZyS0VWdU9Xb05RdkpZ?=
 =?utf-8?B?MlNqM2NIVE10YlZCY2FoSUdSMk5nVnRwUGNhcUFJS2NDNHBDUUFHckdKUXRj?=
 =?utf-8?B?T2xOSUs4UDdRV3l6SHB2cVpNcGNyN0NhdlRNNjRJbTBEb2lYSnRXNHJUWFZF?=
 =?utf-8?B?S2ZDNWNQbmJXNE1vVDlyZC8vTy9lbGY2UUhLU29ER2I3dEVFOFpXVXJoN2dX?=
 =?utf-8?B?UVJVei8yenp4bllRdUsvQUVzbmVzVXFZcGN3K3dnQnNzOU91SFdzODVsamhM?=
 =?utf-8?B?N1VpYXJrbXM1UE9vZW1meUFzWFZVUDE4S0U4ZEFVNXhmUlJCczZ4OVhYVkIw?=
 =?utf-8?B?QytVVE5HSXoweTZzTjBHWmZXVmcvOVR0cllLMk9nRmRPMkVZaWgrYzNaNC9p?=
 =?utf-8?B?ZEc1UDdHSllhVFR2OHgwSllyZzNxSzBKdzBmVDBwY253b3R2R2dEdTVzakdW?=
 =?utf-8?Q?BtLkSdEAFTc8TZYmKYzs3/U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UEU0N3RmQ3NuSFdhQ3ByL2VSS1JBd0hTcG9QZjNFVXI5aHVCMG5PZy9ObGpI?=
 =?utf-8?B?blZ0aWtmeHBXRHRJc3ErYndGOTcrcWExd1A3OUQ4eDVPVFZOMUZnMld3bXJs?=
 =?utf-8?B?Z3hkdjhWcHptZ2J2djJIK3MzV3pkK2FvRURvSG4ycXFBdWQxWGw2K1lJSVk2?=
 =?utf-8?B?eURxZmVDQVYxMlE4MkpJZzVkS3pvbEpvb1NqcFo0NHpMcmhLZFA4amZXN0tR?=
 =?utf-8?B?cmFsSHdaTHZNdFhvTjFUSkRNUi95TzV4VEVjQW44cXZqM29LYnVFc0YyMGZO?=
 =?utf-8?B?bzIxSVJJUFNPcEc4ZGRSaG11NWQzOExQUFJMMVJ5TWdlSk9QbG5tUTFHYWRM?=
 =?utf-8?B?ZjFUZTRSL0RWbnluM0NJK2dmOVpSYzU2RmpSWWE1N203TDFLT1p5RDcvVWh6?=
 =?utf-8?B?V1dvY3BycmRJWlhndktCL3RFOEx1ZHZUb1ZsS0hYbG5WTW1ibDdFdDBlOStl?=
 =?utf-8?B?NTViVVh3VVVxYnhrVWVpbE1sTkRiemJkTWtUNk93d2gxaXBLTU84ZHUxc29s?=
 =?utf-8?B?anZpa1hySklKK2tFRmViNHErZW9yZWpnOUNzWVRiQXVJejVoRFEyc1VqcGNz?=
 =?utf-8?B?QzlUMlhuL3dEYmVjQTJYd00vblpQZ254T1dxZnY4Q2hhQTNWRGZYc1gycUVF?=
 =?utf-8?B?c1NDNEJwZWJlbUFzZkNuT1JXQnMvbnJNRTBjQ3VSdW9uRW9EWHZOUnVLZGVL?=
 =?utf-8?B?ZXo2bXNkMmdNVHJVTzBKdmpuRG80Y04vajdzNE8zcGV6cjRDQnh5Q1o0VjF6?=
 =?utf-8?B?ODFUM0VnUXdaTE54MXBIYTZvMXdwMkhIZjJIcG1ZRUpPRXhOOVA2bHhkWHV5?=
 =?utf-8?B?YkZoUlN6eHdTeWhwRXgrUCswZCtLNlNnZ0lxd2ZvVFFZbUthcHUzTmtOVDZa?=
 =?utf-8?B?Z2poQnBaU0hwcUhOQzhsQTlEdm5QU2J3ZzgvK20vak85L2gzSU9HR2JQaDFs?=
 =?utf-8?B?TW9RbmtLWDJBVDMzSSt5TkdyZWRnM21LYmRCUndoS3FPMkFPN1dKVzBXRVY4?=
 =?utf-8?B?NGRCYzVBc0pDaDgwR0NUZnpqNkxUU3dmM05zUVQvL0lxZW1mTlhLWGd1MGQ0?=
 =?utf-8?B?QTNRc3IyRkJUZzBSOUlKYkIwSkh2MXJQc2V0K2U1SGJnTEdZcE4wQ09RWUVD?=
 =?utf-8?B?TitKZEZBM1FHTWNZdTl2d2VZbDE2YU4vc0pwUGNUeWd1QytMaGRwVHV1c1h0?=
 =?utf-8?B?Y1YzdzRackxiSVRGL1h6WVorYk9CUG9YMDNDQXcxeXo2SDdndE9pZmVTMjF4?=
 =?utf-8?B?ZFlWL0dDSlBHeE9RaE1FejBVY050SkJISFZvWGIvVDR3dXVrck9uMmtLS3NC?=
 =?utf-8?B?d1p1R2lBdVNGVk5OcGVMdnBaNE9HVjAzT1VWaWdTdGNVMTFMTjRyUlhoV3lJ?=
 =?utf-8?B?ai9KZlcxR3YvVzdoU1JMUDFRNDlEVkVIT09tYWQwVkd1eitSYWhNdzFXc3pa?=
 =?utf-8?B?aGhLOFlLSlNNRG9ITVVaWWdSTmhsSzRjZWJoeUNFRGc5LzdBOFZpSVlvTVZR?=
 =?utf-8?B?WUxRQnhHWGhvcVBxR3hHSWtkbUR0RDBqSmFBNUpMOVJkd0VJOEJ1YnVtRFBM?=
 =?utf-8?B?R2lzRXhramllakFJVmlmemxub1hpNHAzZTZaVjY3YTRXWDUzK0xYZUh2Z3Rj?=
 =?utf-8?B?Q3NoQnA4NjNINmxtcmthZTBJUGtOa29oLzZNM0hOVWc0UldPWHpqVlQ2ME1j?=
 =?utf-8?B?VEVuSWtBWG9wd0RSUzFQYW5TV1FXVi93QjR6TUlKUXdjQkFhanNZRnRsL0s5?=
 =?utf-8?B?ZVBPc2pwQ1RHSytIWElJaWY1azNCUlRCRFJRazN3VEpiQ0ZNcWN1QkdycU9S?=
 =?utf-8?B?T3NNQnBsUmEwRm95SVF4SWpZTGhidk5GTG5SMWxPZEUvcVRLZjFUcEw3ZFcr?=
 =?utf-8?B?UTFiVENta0hLTjFJbkR2ZDl4d1lwRDhEUzNoTUlhSFlENXZHbDNVbGlsZ3Za?=
 =?utf-8?B?TEU4TFdyd0hBMlJLeVVuR1g1VjZTU1VGSi9rMHc2OStoQXdUNVZLeGJjb3pV?=
 =?utf-8?B?MVhpNkVtSHo2UkY3MFB5UUdQVVR5NFo3Mk5QWCtESjRwTHJlSXpDeDA5cEpC?=
 =?utf-8?B?bmlZUnlMTkxZcVA1aWhYdE50U2RGWm5yYStzb25DdmhZaUxhbDhTamYvcGNU?=
 =?utf-8?B?dEw2bmVNWDYyOEhoMU5BV0dlaExSeVdwZXZBYmc0anZkNWY4YTJUSFFMa3FU?=
 =?utf-8?B?MkR0eWI2V0tIcGs2OXRhb2JKcG50RGs5djU1TjVlMWFab1RxTlZqZmdROWhs?=
 =?utf-8?B?ZUxNaFFCWnRRUTRJWlIwc2V0d2tlRlJRZFVVZVZLTGU5V2thMnQ2MzRjSjRw?=
 =?utf-8?B?aEtZQ0QzV2Nqcmh1bnB4OTUwbVRpbERHa0puNUVFL241Yjg4MUhzQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C25194C6750F3F4D9FDD840617440CB4@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uKPfGkas+Qe9FLzJoIvF9+bbG9aImbpmGpmRoP6M/CnlDq/1icJs6FkRn8YdVDm8rC3f82orRK8w6F1wR/j+NLEIl1Y+oq6rGpwmF40wNmIp0Wv/H4QVJKwV+yAsc+3pCWd61uspH3cTj7Y6bXhnGNyeFJMwfuncCWHH4SOeZWhdIKkdHHUsLr0jYjKVddwQsdDEiyrIvqd7wZqzUoKAFFk80Imby5Ubnk2c0cjKywPJmjjjio7EdhRDtBC40gVmdat7kcMa1uUOy14gHOdApH0tfBzXlZrzX5cpg7rugfIG2ED+r4GT1qKZQ9aEXqb1w8wTtkr8w63DicxRDx+Ge7sm++wOwhyi/AfL0mZNhZX/oCxuejF8dE+4gUOodAFEjs5NCe5m+d8H8ONxOsL+aMXZlTFWQoqh0+g696+qaNYBrTMh+kUOKcouHEdlnC2UfKFI/FIB1rrVdGUVocdTpD432YC7W9g4k7gO5fZ+8wAHbYgtkvR/L9EpATOKLFH72AifgZgle91DhRfeBcFI6bK9MKnnsP67hAjKf1N8VyULYxodgmvt+l/cLOke4gcXOTr/ZWlmBYBbGYnBhU7YoQqMseoSLmWkVhzpiDMe1Q0TYlk1B2Mo3CEGEcQflVL4WHp3cGXwRa7NHXKMKd7WWA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e1a83a-5343-45b2-317d-08de53c83253
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 23:54:03.5550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: crY9ldlFL9a5589QlXJRIu3A1g5WxFJbE0zZDxUf/b6RUFDwDjUtEiw0biT0NzZYtf1wOUHN1dvN2GZrmOyq3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6177
X-Authority-Analysis: v=2.4 cv=CaUFJbrl c=1 sm=1 tr=0 ts=69682ca6 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=5ECAthonr6R7hZRRT-kA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 7OVU1l0QMTnrfRghcQGrgfkOxPlOFSs3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE5NyBTYWx0ZWRfX3jx03J5MH4DY
 Q+Y7h6Q3J7mE7MBCu6X66W3JjlgFdidyZOZIeb5dqKR+Jyh47eWb61Gh4bqqXZjzdd+YRKtuerz
 pQRJlgv9EbuWtIGpuM/heL5+Buj/vL05hcet03Oz5SWRkNX+TdAeJcpgIKmFcdjhWDmskiBey/a
 sj7t4ajg/AqPu3PuOPkeezjPx+z7koGDY4bBVF4frTILCAJ8Z+EpcFL/KhbOxE2HoH8sf7h6Lfa
 ORmJ2aVHL7jTWHh22uQmAmKlRr5XsfUYxxoK7yk/rrmN9V0Vco48mG1x+k2HG7cffvUpi5NWQt4
 /Fpk7HWpJDA9++HprIjiyIM1EOSe5ooEXj2SiApgMZ/qm5WopP8WvqV4AUUJ9s8dpH2LSpELXMe
 2u5Bs0BJNmUvMbUxf43IUsKwbaeBKWqb3uW7ooxA65vda1ZPllOw3Ru8EcoQAb7NDSFXlGiKed9
 AhhWIDqk18tQ7lH+/KA==
X-Proofpoint-GUID: 7OVU1l0QMTnrfRghcQGrgfkOxPlOFSs3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_07,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2512120000 definitions=main-2601140197

T24gV2VkLCBKYW4gMTQsIDIwMjYsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gT24gV2VkLCBKYW4g
MTQsIDIwMjYsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToNCj4gPiBPbiBXZWQsIEphbiAxNCwg
MjAyNiBhdCAwMzozNzo0OFBNICswNTMwLCBQcmFzaGFudGggSyB3cm90ZToNCj4gPiA+ICsgKiBA
YWRkcmVzczogQ2FjaGVkIGxvd2VyIDMyLWJpdCBiYXNlIGFkZHJlc3MgdG8gYmUgdXNlZCBmb3Ig
bG9nZ2luZy4NCj4gPiANCj4gPiBXaHkgYXJlIDMyYml0cyBlbm91Z2ggLyBvaz8gIFdoeSBub3Qg
dXNlIHRoZSBmdWxsIDY0IHRoYXQgeW91IHJlYWxseQ0KPiA+IGhhdmU/ICBXaGF0IGhhcHBlbnMg
aWYgeW91IGhhdmUgMiBkZXZpY2VzIHdpdGgganVzdCB0aGUgdXBwZXIgMzIgYml0cw0KPiA+IGRp
ZmZlcmVudD8NCj4gPiANCj4gPiBUaGlzIGlzIGEgcmVzb3VyY2UgdmFsdWUsIHNvIHdoeSBub3Qg
dXNlIHRoZSBwcm9wZXIgdHlwZSBmb3IgaXQ/DQo+ID4gDQo+IA0KPiBUaGlzIGlzIG9ubHkgaW50
ZW50ZWQgdG8gYmUgdXNlZCBmb3IgbG9nZ2luZywgc28gSSBzdWdnZXN0ZWQgdG8gdXNlIHUzMi4N
Cj4gSSB3YW50IHRvIGF2b2lkIHRyZWF0aW5nIHRoaXMgc3RydWN0IG1lbWJlciBhcyBhIHBoeXNf
YWRkcl90IHdoZXJlIGl0DQo+IG1heSBiZSBtaXN1c2VkLg0KPiANCj4gQXMgZm9yIHRoZSByZWFz
b24gdG8gY2FwdHVyZSBvbmx5IHRoZSBsb3dlciAzMi1iaXQsIGl0J3MganVzdCBiYXNlIG9uDQo+
IHdoYXQgSSd2ZSBzZWVuIHNvIGZhci4gVGhhdCBJIGhhdmUgbm90IHNlZW4gZGVzaWducyB3aGVy
ZSB0aGUgMiBvciBtb3JlDQo+IGluc3RhbmNlcyBhcmUgcGxhY2VkIHRoYXQgZmFyIGFwYXJ0IGFu
ZCBzaGFyZSB0aGUgc2FtZSBsb3dlciAzMi1iaXQuDQo+IEl0J3MgYSBiaXQgbmljZXIgdG8gc2hv
cnRlbiB0aGUgYWRkcmVzcyBwcmludCBhdCB0aGUgc3RhcnQgb2YgYQ0KPiB0cmFjZXBvaW50LiBC
dXQgaWYgaXQncyBpbnN1ZmZpY2llbnQsIHRoZXJlJ3Mgbm8gcHJvYmxlbSB3aXRoIHVzaW5nDQo+
IDY0LWJpdC4NCj4gDQoNCk9yIHdlIGNhbiBqdXN0IHJlbW92ZSB0aGlzIGFuZCBwcmludCB0aGUg
YWRkcmVzcyBmcm9tDQpkd2MtPnhoY2lfcmVzb3VyY2VzWzBdLnN0YXJ0Lg0KDQpCUiwNClRoaW5o

