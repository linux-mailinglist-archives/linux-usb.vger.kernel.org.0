Return-Path: <linux-usb+bounces-33602-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMwvFejznGk5MQQAu9opvQ
	(envelope-from <linux-usb+bounces-33602-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 01:42:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1811804A3
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 01:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61CCB30E6C86
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 00:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8267234966;
	Tue, 24 Feb 2026 00:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="wAcYGhRT";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YeL8KXym";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NQxGxrQ3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C920D21FF23;
	Tue, 24 Feb 2026 00:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771893726; cv=fail; b=DyTMPWlmjg4gwsTkMkNFTJbHBt6q8ZyBUsFpW8U1ARPLFyMKY8WVSndDotLjK59FBlU17cdpf7SFjuauRrTXcj98Bql9LXtN3av1OLmID4HreBRojRPgGVAx1fhesIffViMOArRtQ7gPSvr03qtRm9/BWPApyfFozTEx2zAsO1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771893726; c=relaxed/simple;
	bh=fOdqRuhh/Z0Lm0OFhEIk10FUc6QPjCJNiym+Yq38tWE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oQ+swhkADj+zWrY3K+PjcCXt1Ljhsnn6xVpdIlN0jVjuBCiy7Fyf6oDTF8uHnZfBFXmB/aCRYmu/1peZTUncYDkms9ErAV9eXIBgnAyUjCg8HfRC+VNdKEnMLbEUzVQArq2A73biL/NzXYGaEQIErJtdCmzomSB8c2TELFkoEmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=wAcYGhRT; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=YeL8KXym; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NQxGxrQ3 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O0QQe33200168;
	Mon, 23 Feb 2026 16:41:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=fOdqRuhh/Z0Lm0OFhEIk10FUc6QPjCJNiym+Yq38tWE=; b=
	wAcYGhRT6qA1i5WSJ3arG4t7i71de2P6X+QQp96IkRFwRkr7y4h7RzDABEwpy6d2
	ZsHek0yieqmQQ7VNRpuBd7f2SLRTK5VTAMjwq0TQEkpbc+QvuisYx1lMgsjVqhbE
	k7saPOR3AhO5qISAzUzFsINoMy3T/QpMx2uRHHx3YKXslX2cvoUCUa53IwwfDeiN
	+FjA/gRtIYpe0FrDe/h2KPYJN9Z1B5lI7Q4prpPlDKqwh3oZ0jq71RD07+JTEmSg
	2i48MipM3K3/L3MW5WD4UKQTL8UTMvwSpcI+abrj5WU3Sjyc/tG+bCFWlDKnm7sB
	Q/DGPTmhOS+nRw56+kw8oA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4cgr3fkr7r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 16:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1771893699; bh=fOdqRuhh/Z0Lm0OFhEIk10FUc6QPjCJNiym+Yq38tWE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=YeL8KXymKT+lFdPTc5kiKej4CK/HL+0e3YZ5gKv/13ATCMMcYRiKT2MdZBjaiRIrM
	 jv/IT4dpRHR+or/EXTZUKewI0zCfcNTps2lbBs3L/AjKUKwyoLRbkxjjNcBs3t8WZL
	 JwKyuOotaJZJXqJ2WGi1/C2ee4NTCG2uhqvHPyzoSMB0FPoiv0Gt7IrDMco+fXWm5+
	 IcxlpcQoP+ET119blSbJdO7lpxImztTQEz7Vzcxg1iE4pdSHO/Yrg53Dysaci8F+Ax
	 8h+KvA42etfvRNFNYJBdQ2UY4oL3QVlwWBReLrQXRa5j2id5Mljnia7Mbhi8WdL6ED
	 yvvSAdvgU6lzg==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9D0BE402B2;
	Tue, 24 Feb 2026 00:41:38 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 6CAF4A0085;
	Tue, 24 Feb 2026 00:41:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=NQxGxrQ3;
	dkim-atps=neutral
Received: from BN1PR07CU003.outbound.protection.outlook.com (mail-bn1pr07cu00305.outbound.protection.outlook.com [40.93.12.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C5E1F401C3;
	Tue, 24 Feb 2026 00:41:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=omMKbYGC8GDuA1R79iqFRVcekYkwbWGhH0wQLj79NwFZSiDYTF/vNUdwg1jyEff/Dg4S+ZPvpSzTuf0+1WyFDEYZs1RH7A3tGehYBgPQNEsd3B4nt1DbxVJtjp5s5Rps0xqtvgFPK+8vAdG/SbR29h0E00xy/S1nrJ0TBAdVdUhGpTUqa7XplmBXaEDZ4YluHLzKI2kDqDWz+tUvd8iVFIiyIg5uBB7RVn9rYNZRoPgWuXtnwS3kYypHrZ7mGliah9PYMqtkGxu2OA2x9DxlDLoEpjixhqQd3Y4DF42Gl0vfa53k0YweRo7DfEVmmk9mKT91JhIP2OYRKW9dbxfbag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOdqRuhh/Z0Lm0OFhEIk10FUc6QPjCJNiym+Yq38tWE=;
 b=RobSbQfvlUnUJr+QWZwOMnInLpiXKYbmPz9gsiPdngOrbZfsh5lr/7BsY+II15Y6+Qv4dQFYx1k80hKlP71r7jYMiAjWiAoKyG0OGd7dtbK/tbTd6toxZAmGcENJjg+LOnlu+mWI8xKmRS+t/gtdQrP3Jk31Dn/opriaAkULiwuIezPAIuJzHuszH8REizuR+NfghL6bsw6OhRJMprRemvT7vUsQQ878onO7/I3DZkqiwVjId9/xhsjyVzl6eJEfOfzVL2BGxKOs4Gb2xcWvFTEg8gNoTnjaU63ELkYFZI+PYV/ZL+IDXlGye/gck1OPwN9Z+igayBEhFTl5QTQASw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOdqRuhh/Z0Lm0OFhEIk10FUc6QPjCJNiym+Yq38tWE=;
 b=NQxGxrQ3x0E594XW/uveXRBeElt3reU0jutTs9XJx9VK2XPSm3qcaCV4071WtkG4q4Jxr2YeZ/S5+ab6oAt4OvSWopiqrmBYADAP6UqZ5DzEhoZQfh1pWFR0ZDy7Oq1n0Nl++srjF37bv5/sUAzsGOCz5t6Bp41Pv0QHE/1X9T8=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ0PR12MB6736.namprd12.prod.outlook.com (2603:10b6:a03:47a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 00:41:32 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 00:41:32 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Zeeshan Ahmad <zeeshanahmad022019@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: qcom: simplify error check in
 dwc3_qcom_find_num_ports()
Thread-Topic: [PATCH] usb: dwc3: qcom: simplify error check in
 dwc3_qcom_find_num_ports()
Thread-Index: AQHcoMX/Agr/25klTke/2w2+ee9zjrWKpCIAgACcggCABcptAA==
Date: Tue, 24 Feb 2026 00:41:32 +0000
Message-ID: <20260224004126.ue3nfgzlf66rayfz@synopsys.com>
References: <20260218110121.10185-1-zeeshanahmad022019@gmail.com>
 <20260219225528.m2gklrxtqqt5ztk6@synopsys.com>
 <aZgYKin2nP19CZyL@stanley.mountain>
In-Reply-To: <aZgYKin2nP19CZyL@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ0PR12MB6736:EE_
x-ms-office365-filtering-correlation-id: 56d3024a-98b8-4404-30ae-08de733d7509
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?UFdOUTh6VWlRSUJnNW9CNnMrZmFzN0ltUm5EYkYrSHp5T2ljNDcyWEJHOUtX?=
 =?utf-8?B?ZUVaaVhYNzdkY2Y2cHFxWjBkVzFuK2wzZnpKeFJ5YmZlNjNTTnVSVkRJNlYv?=
 =?utf-8?B?ZnFxS09XNkk3T2Z3Z0ZVQnE3aGx4U3R4NU5ZVGhDV3o1RnhYeEdwa01uMk5y?=
 =?utf-8?B?ZVRwb0lCK21RM2UyVTk1d2E4bE5XRE5sZnJZUnVnbnFxSVFxdGgyUHJ1RkFv?=
 =?utf-8?B?Q2p2bS80UUlaZTFNM0FsblJFNmtibzd5NGZsdTFMSllydGN3a1BCcGxCMHhB?=
 =?utf-8?B?dDFmTFlmdWlrOThlR3QyeTRPaHBzTG9CQzREZzdBK2JyYkZORWNxaE9mRXlt?=
 =?utf-8?B?T0hzNmowcmU0bHlvNDRlMllId1JoM1BFYjd3SzZsY2tHbUdaWTdzYS9MVEtY?=
 =?utf-8?B?SEJ1RUpudHdFd1JoMVhrOUlUUjM5QWVSVE8xWHZkOTl2Sm85d2FJV0MxaFhX?=
 =?utf-8?B?YnA3Z2I1WlRMR3phZ1hQYWcvQTJFSndiNlFFb3lmNlJlK05GTFFUMWpiamZV?=
 =?utf-8?B?Um9NN2dxTVNPcnBteU1CUWhsckRNMi92S05rMzNiZXFsVlJ4d0JsN2t5b2Nn?=
 =?utf-8?B?Z0RwQ1hnSDBBY3ZtQitnTHNRcnc4elRKZjdHemRKN0pIcDY2dEsyMEd5cnNh?=
 =?utf-8?B?eDloMU1aQTNGL2oydHpQekFINkp0RUQyN3RPWWlQMnIxeWpFRDlSUzBlVUFG?=
 =?utf-8?B?ZTJvNkxLVW8rRjQ3Z2hyS1JhQnRHWis1KytsZU9ONGl5WTNlSzdvZFBVVS9M?=
 =?utf-8?B?R1JGakg2MGV0OHBBVnVDZ3RWVWVOUXkwbklGNGVLOFJoZWRVdi90ZjFiQ1dW?=
 =?utf-8?B?aEJ3eEVzMEpGR3pTZDJ6c29kT29IYkFPNm0zTXp5SnBOUTlkeUlSWHNiaXBl?=
 =?utf-8?B?dXpxT2p4RUF2dkFCYUxpMFZ6cWtlVU43VXNSeVd6cWtwYXlBKzZtbDM3aktl?=
 =?utf-8?B?Mms5VGdldm1aMkZSKzJXU2lCVDgzSzlwc1VTVjllWEVaRzJmdUZwRk5DS2Vi?=
 =?utf-8?B?Nmk5WDN3M2twaHhjOXIrUEdST3ZHZlVROGVCN1lvSHZJc0xlNHQrUUdKZkdJ?=
 =?utf-8?B?S2ptcEVPM2tqSkZ2ZVN1NnBQSlBVa29qRUFIU3BwbW11WmxVWXc0enFINkx3?=
 =?utf-8?B?QzZEaWRIKzJnS1BmbVVkSjB6SEoxUkY1cDJTN2RndmhJQXlsZkJWSHlsMGpy?=
 =?utf-8?B?N1AxVE95VGxHS2ZBK2VHVmZHZVpGQUxrUGkwT3FpbFljZmJQUGF5NzNzSDBL?=
 =?utf-8?B?TmZkdEVJWmhkSUJmY0swa1ZublVxNHc5UlZqdEZ2dFFpM3NQNUU3dVlHRWVk?=
 =?utf-8?B?dHBtanNLUGlSa2s1SGIyK0NDTUprc1IzTEdMb2RqdUlSNkltbUFJN09vYlVC?=
 =?utf-8?B?cCs4SExEdmhLQ2Rwbm9DOUJHK1dwY3g1YktaNGpFVERHQ2F6SGN0dGZ4Rmo2?=
 =?utf-8?B?d1dJYXBMd2JwWE5FSEw5eXRZV2pVYW5JZEpQSElXSWYzN01SY3VtV3lsV0E5?=
 =?utf-8?B?UlNrbjZkYUE3bXNtWVN5WUc4SmtFYmZ6VW1JaWpvNVVMZ3l0YkR6UnhibklX?=
 =?utf-8?B?NFphbkdLSW5veG9VY1ZPdjJYWERNMzZZNitVSWFLZG9zYi95L0dvUDVxcXJZ?=
 =?utf-8?B?OEFJcDBSR0cwOW5NZUVyU2pQRTlCN0ZVSEVWTnpKMmMyY1FoOFpVaGMvWkRY?=
 =?utf-8?B?ZDhoWk1oOENLcnBPbXR1K3Y4V0xBRGRlOU9nSGFwY25kay9yOU9MWHpJRnln?=
 =?utf-8?B?TmRnS1FCODhPeUppcUhCaWZIZlFOL2Q2ZGYrSUs4RWVOZ3VlTFJmaHdJZzFR?=
 =?utf-8?B?dDh5ZnlJZkZhb25kb2N6R2pONXorUTZwNzIvTXViQlAzMUM3SnphdC85dlBI?=
 =?utf-8?B?SFlkZm9Fam1QcWFUenhKeEpPQzVrL3NKbU9MbVBXQjdYeklONWlTTmE2M3JY?=
 =?utf-8?B?QzdOaGZCVDJSNmFtUE5BbWJST0VCK1dJNjFVMXM0RjBwdnZVMHF6bVM0bkUy?=
 =?utf-8?B?MU5hSkNUaDdzdUgvbVUwME5QZUJYckRRRS9FYVMranZPOGVqUkdzQlpPdXFa?=
 =?utf-8?B?WDV5enZ2RGk2c1VOYk0wU1k2TzZ4d0lLV2R6K09tU2NmbVRrN1BCdHJtQWpq?=
 =?utf-8?B?QUtSNnk1YkF1cnZBMFBMa3NqRSt3djZsblcwWnZXTVR1UzR5R0JvNUlyOWwx?=
 =?utf-8?Q?GGvj4PrlvAWp5w5xd/y+cXE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L0F3SWlLT0QxQlR1YWVudjk4a25NbWRHcFBEZk1KeDgzekx1Z2FLRVhZRHpj?=
 =?utf-8?B?QzhtSnYySkVXTDFJMms0ZmU1THMwMGNqc3h0aUtMbllMM29BY2FhQnBUQWVs?=
 =?utf-8?B?Wk5oTTl5VDNjWFQybThUS1JjTW82SzUyQjNHNXp1Z0lxZHpWazh4cHphZmVr?=
 =?utf-8?B?YmZha1B0aWt6NTg4UGVHVGFGZ0VrSEFqeGtiRkhQRm1MWWk0SVF6V1J4dUoz?=
 =?utf-8?B?elRTck0rOXUyS29EYmIrUVNWa2prRFdXOENwOFZMZ2dtcHBkODdoK0NkOVk1?=
 =?utf-8?B?L0tYWUk3N3ZiVHhNMDZNYjZ1dmJhOGNMb1VaK090VVlMYWVDVXdxMWhEVUM0?=
 =?utf-8?B?amdqUjQ3ek1qczVhV0lwWlJZcWhybHUwZVFvZjB5SEs2eHNhck1OREovdXVQ?=
 =?utf-8?B?cWpOTFFOOFByVGdEOGRuY1lXN1BBNHJqOHRPVDRPcmdUc0owUndpRnBSREJ2?=
 =?utf-8?B?NkJIUENjWFh3VE9PTk1vZnNPUzdGeWt0ZTJya3JsV3pGMWtkcHZnTG85ekxu?=
 =?utf-8?B?dmdIdDV2a0hwN0ptWk92Z0pzUytnQVNtRjlWMzRKN0dBQ3Zyb3lOSGFJOEVM?=
 =?utf-8?B?QUJQWkpNZTRrTEVjSlJzQVVpdTVDejVadjhWTTFSMnlUbDdIU1RYQ0FlVWp2?=
 =?utf-8?B?d1djUDVpL3dtUlJpOTNLazJCYUtWQU8vTzVLRi9STGFhQmg0M1E0MzJabDJP?=
 =?utf-8?B?QTdVb0FacG9DWEdqby9EMW1lZUVJYVZJSlZWUkNodTlFa2MrY3dkcUdmVGlj?=
 =?utf-8?B?RndsejVmMHVsdnBCZGtJaW5TUjAwcWNpc1BwcFJaaXZGY2RPcWVGZnhMeFdN?=
 =?utf-8?B?dUNyRDFvNnlOZ0RLMGZubGczeVBmUDV3eHZ5WlZiUy9oWi9yWndKcjZwYzdX?=
 =?utf-8?B?enBMYi9YT0M0WlhzYTUxVmpnbHZLS2RNalJBVU0vc0xYUDNHWDRFTDA2RDlj?=
 =?utf-8?B?d3VKS3R1bzFKYnlBV0duT2FRdWhtR2pQK0VwTVI2ZW9KbjUxclRwbGEwK0hk?=
 =?utf-8?B?bll6VWlvNmFzQ08wVWF4UTI2SmdrdEVUdjhEOC9RUDVXOGlZbEI4Z3hSNGli?=
 =?utf-8?B?RTBOdEVuNFdwa3c4elYyaEVsdDRpRmFCeHM4d1RmQ0xjWld0SXlGanZmcEZ3?=
 =?utf-8?B?Ym5mM3pTTUh3ckNjT0dVamVNOHR4TXlPbzFDaVJtcEplb3dCejRMUDVndnBs?=
 =?utf-8?B?VUxBenFzQlZlOENXN0tydGNWcnlvSERHbWtsM1Z0dDBhSzdzNUJWc29OK3hY?=
 =?utf-8?B?MkRLcVdhMlNvWm9LTnBST0k1MHFVQXFNdllieUVTc081OXZQem40MjdYSFdQ?=
 =?utf-8?B?RGlFVFp6TEdwYTAzNVdPa2Y2VXJVcDBYSjlzS0NVL0xRS2owQ2s2QWVmaWNh?=
 =?utf-8?B?S1ZjOS9kb1FIQTJJOEJWTi9GOXVqcGVlV29vTTNSZ2ZxRVF1ZEJzNG5VL0gx?=
 =?utf-8?B?elhuSVNjQ0VrTVdLay9zNTFJUzlOQ1VEV2t6VkFhM0xvUzBlNDVGbXE4QTlC?=
 =?utf-8?B?ekp3amw2STV4dkdxWDlxZDdqQzZReHJzMWpaRERjam1SNFFpZkljN1FHcDdY?=
 =?utf-8?B?QXV1d1ExTllaNHZSOWZkQXRLUVpPQVdjVFlCc3JBNk10MVJFbDNwdHExazMr?=
 =?utf-8?B?aFhZeFFaamk0bVBHcitqZklIakZjQUJUSEdVUG9ueTdHd0FWODlEckVFS29G?=
 =?utf-8?B?d1YvNnRtZDNtUGlUUzAremw5a3huQ0RSaU51UXVxSDFkZE9pRWJVcTJrRkU0?=
 =?utf-8?B?dXhIRit0UENMaXhOZENvT09nUTcreXJpc2ppOTZKWTB1L3h5dW9VcHpVUm1a?=
 =?utf-8?B?TTdHYlAvYlFsdkV0NjdpUFVQMnNHVEJCcjBOclk0KzE3aklJTnl3OFd1YSs3?=
 =?utf-8?B?NEtiVHl2VlpXS0FNM0o1NVdkRkFNeElyK1IrNjA4OThQMm15N2JCQ044cjlV?=
 =?utf-8?B?SEVnK241YlJ6MG5DYW9PYVBaelBYbndPTzVVWTBJcjhHYW5tRTdENGQ0WGNQ?=
 =?utf-8?B?enBIYnBHLytKK1c4blB5dTJoRkFjZWtXVkhzZ3hzVUlqbm9Qc0lyTjMwRnBl?=
 =?utf-8?B?eEo3bDVGZWZoZi9jQ0Z4WjFWd0NRQnlCdzNsNDZUelNYVmpvT04xRCs0OVUx?=
 =?utf-8?B?TCtoNmpuazhEUXBPQktPcHRUbVdUNUFta2Nxd2VGOXZnekFBelhMUVgvRm44?=
 =?utf-8?B?TDcyTW9ENjVZRE40eUppY1V5S1g4cWY3T29TcG9JOTl6clJTcmx3WUxhL0Zp?=
 =?utf-8?B?Q3Q0SVRFOFQyOVlmWUljNEhPUTMxZzZ5ekl1Ykh0cjIrcnFuUzFPLzJ2bjh4?=
 =?utf-8?B?SE1EaDh5U0VSalBFVWR4WitTRkZpZ0ZtZU5lbkdtZWdrcHp1d0FNUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF5661230B40FA448B79A18D27C42F8F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MvtdmfwZPHHC6t+KtUyXrGlxQuFtQX3sjsCrHIqs02o8vdLRcpk5xS1/74QC7uBhD3aT+mc07K5FsnS7h7qClu2ZH/tjC91Bc2SH1sm+Nes+OTfT/wKS/VK8J98AXHY/YbLdtLXqfEIWFawbgrS7XbuiCDBawVd6crLtgVno5g+GFUVSSuHkwXhHehfVq9EHhFvAeQpcT5g4cgVyAmzWFuU2uwbYjwE2xzmS1HY4j5yvU3WekxIUDtYN5+6cT2a6bztWOa/4OIfqzThl209nW1ES6Y74e+tbXKt/dbS0SgqugIYqa7v6eTHWI3I/BqdsN2yxGU4kKA280AsdMWIn86ikkmBH0kY4FHh/wHi6GaECWYjkg5PAlL7lyZ4x7p76QKn4yihN34rnCpflxx4TdsTEUqlR51yMxFurk61xDh6OJ7YHaC0Y6ePA/vsf+G1PIX6WbSBi9nUvmdd/y14An7iN8UbKBDcukAEbsQXW2OcL7SKF8/oaUaLJW2l2UySw9aM/+J/X5pfmp/WrBWOdH+FsoqcclEK02C5HC9rnqAwWVAGlnVNsNZGltbMgegE5CwwPPRmvs37slrr2IdCZGM1l8PAwZe5plGUtG4cvdN2R97GhIc8RhfGU55EEsLVpMKfeYX8HruQgvdWJ/+drjg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d3024a-98b8-4404-30ae-08de733d7509
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 00:41:32.6760
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /nELJz89vZzLW0GL4J1GKfy1V2GlVidmdfucIgULTNUtlE1h6O2PirG9j/75YC6PFFClyzqfZ4h3TJnavQdoXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6736
X-Proofpoint-ORIG-GUID: 2LP9poPDnqKSOXoT44zejnaTxXjPcBf8
X-Authority-Analysis: v=2.4 cv=bPIb4f+Z c=1 sm=1 tr=0 ts=699cf3c8 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=1XWLr82KMH2RgsDkxH4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 2LP9poPDnqKSOXoT44zejnaTxXjPcBf8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAwMyBTYWx0ZWRfX3p6wGxu/MWFe
 Z+RA2/pxTD4yij72sxI7xYrHk+1kHlV6y+kKLmOGsTErH5T/mEh4vtcEj2uf+WaHIltF4SqqpIf
 0/UEz/gECAnfNwc/5nCATwGhy7R1jonMtv1oI2awI5IdBIsC70FipAKxh9rAlGBD9nxMMbyn0Ou
 GO75uDI5abo1xLfMZVJjFGyFt4wQ+JpUvZnM/Gp0MAppACuICUKGxAiase7kPDrABeXM33ykVrR
 kLreqpvWzMFELwyGNTIcY/nCxlWi9BoCgEWu6BQCI/ZfTiqOY7KaNvBs+5JRS++WBjH9QTTJdUd
 gv5ZAECDYXXctN0TquVzT9QaNUdEbk0BYS1jfXk0Qozub9Mm7Af/r9G3c+Z1/si9iRr/Eqt+nbh
 zSUal/wF9X58ZE0a0GQCMTtGHlS1fs7iX5vYfvHJX2Yc8aUJ4A7BTYlE005VCctK15pvhSNnmNF
 RqhxedcRnmgS+oDkTgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2602240003
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33602-lists,linux-usb=lfdr.de];
	DKIM_MIXED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[synopsys.com,gmail.com,linuxfoundation.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AA1811804A3
X-Rspamd-Action: no action

T24gRnJpLCBGZWIgMjAsIDIwMjYsIERhbiBDYXJwZW50ZXIgd3JvdGU6DQo+IE9uIFRodSwgRmVi
IDE5LCAyMDI2IGF0IDEwOjU1OjI5UE0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBP
biBXZWQsIEZlYiAxOCwgMjAyNiwgWmVlc2hhbiBBaG1hZCB3cm90ZToNCj4gPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS1sZWdhY3kuYyBiL2RyaXZlcnMvdXNiL2R3
YzMvZHdjMy1xY29tLWxlZ2FjeS5jDQo+ID4gPiBpbmRleCBkM2ZhZDBmY2ZkYWMuLjM0YzU3ODMw
OTgwMiAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLWxlZ2Fj
eS5jDQo+ID4gPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS1sZWdhY3kuYw0KPiA+
ID4gQEAgLTYyMCwxNCArNjIwLDE0IEBAIHN0YXRpYyBpbnQgZHdjM19xY29tX2ZpbmRfbnVtX3Bv
cnRzKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gPiAgCWludCBpcnE7DQo+ID4g
PiAgDQo+ID4gPiAgCWlycSA9IHBsYXRmb3JtX2dldF9pcnFfYnluYW1lX29wdGlvbmFsKHBkZXYs
ICJkcF9oc19waHlfMSIpOw0KPiA+ID4gLQlpZiAoaXJxIDw9IDApDQo+ID4gPiArCWlmIChpcnEg
PCAwKQ0KPiA+ID4gIAkJcmV0dXJuIDE7DQo+ID4gPiAgDQo+ID4gPiAgCWZvciAocG9ydF9udW0g
PSAyOyBwb3J0X251bSA8PSBEV0MzX1FDT01fTUFYX1BPUlRTOyBwb3J0X251bSsrKSB7DQo+ID4g
PiAgCQlzcHJpbnRmKGlycV9uYW1lLCAiZHBfaHNfcGh5XyVkIiwgcG9ydF9udW0pOw0KPiA+ID4g
IA0KPiA+ID4gIAkJaXJxID0gcGxhdGZvcm1fZ2V0X2lycV9ieW5hbWVfb3B0aW9uYWwocGRldiwg
aXJxX25hbWUpOw0KPiA+ID4gLQkJaWYgKGlycSA8PSAwKQ0KPiA+ID4gKwkJaWYgKGlycSA8IDAp
DQo+ID4gPiAgCQkJcmV0dXJuIHBvcnRfbnVtIC0gMTsNCj4gPiA+ICAJfQ0KPiA+ID4gIA0KPiA+
ID4gLS0gDQo+ID4gPiAyLjQzLjANCj4gPiA+IA0KPiA+IA0KPiA+IFNpbmNlIHRoaXMgaXMgbm90
IGEgZml4LCBJIHByZWZlciBuZXcgZGV2ZWxvcG1lbnQgdG8gYmUgb24gdGhlIGR3YzMtcWNvbQ0K
PiA+IGFuZCBub3QgdGhlIGR3YzMtcWNvbS1sZWdhY3kgZ2x1ZS4NCj4gDQo+IFRoZXJlIG1pZ2h0
IGJlIHNvbWUgc3RhdGljIGNoZWNrZXIgd2FybmluZ3MgZm9yIHRoZXNlPyAgU21hdGNoIG9ubHkN
Cj4gd2FybnMgaWYgcGVvcGxlIGRvIGFuIGV4cGxpY2l0IHplcm8gY2hlY2sgc2luY2UNCj4gcGxh
dGZvcm1fZ2V0X2lycV9ieW5hbWVfb3B0aW9uYWwoKSBjYW4gbmV2ZXIgcmV0dXJuIHplcm8uDQo+
IA0KDQpCdXQgdGhhdCBhc2lkZSwgc2luY2UgdGhpcyBpcyBuZXcgZGV2ZWxvcG1lbnQgcmF0aGVy
IHRoYW4gYSBmaXgsIEknZA0KcHJlZmVyIHRvIHNlZSBpdCBnbyBpbnRvIGR3YzMtcWNvbSBpbnN0
ZWFkIG9mIHRoZSBsZWdhY3kgZHJpdmVyLiBXZQ0Kc2hvdWxkIGJlIHB1c2hpbmcgbmV3IGZlYXR1
cmVzIHRvIHRoZSBtYWluIGRyaXZlciB0byBrZWVwIHRoaW5ncw0KY29uc29saWRhdGVkIGFuZCBl
bmNvdXJhZ2UgcGVvcGxlIHRvIG1pZ3JhdGUgYXdheSBmcm9tIHRoZSBsZWdhY3kgY29kZS4NCg0K
QlIsDQpUaGluaA==

