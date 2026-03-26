Return-Path: <linux-usb+bounces-35476-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDU9A/+JxGn50AQAu9opvQ
	(envelope-from <linux-usb+bounces-35476-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 02:21:03 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB6232DCC9
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 02:21:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F09930417BF
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 01:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE15346FD0;
	Thu, 26 Mar 2026 01:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cOYcNAFm";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OHPGaCGs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HdYSyIEl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED85A35B62F
	for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 01:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774487988; cv=fail; b=Q0url9Sy0HmqtZJ/xPP14B2rCsF4SFHomTFsOnlpy6fgZ9otrS3QwwWobvMINoSlqyZUT/IkDxw8LWj4w2H5mPGoBYJmuae861tfZq64nIoe+6WWw4/TMrjMooMhYPahhsNMenLTabAxMmAlNTW1lvvUhrBV+Vgnup7KJ+9CmXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774487988; c=relaxed/simple;
	bh=p9D6m25WPY8P5SeyUPPAbJqFeZ2KC8OmJVq7lDiDO2E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=e5BfNxqv547iNHJwZYoRXMvYPtQwomwK6vTvuHr20/dHlJKQdbhCpTmzVwYVgsHyj0i6WT3eT3bbruapHIOUyaJUV/GA3lMqf8QfYHYwuoohTv2Fn8NiBfyJOn6E2nsYO4XRzN9AMOpAjfm0Md8EWkCDgGWVO2wBpkfM+lXnECM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cOYcNAFm; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=OHPGaCGs; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=HdYSyIEl reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PLKTOA833486;
	Wed, 25 Mar 2026 18:19:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=p9D6m25WPY8P5SeyUPPAbJqFeZ2KC8OmJVq7lDiDO2E=; b=
	cOYcNAFmUySnhP//15Uxn+x8oxCrlSFUadAO0MKVDxv3AmEbKnuCmWmHZslVjg2R
	+t0HWjxKaRAA3kFj/15fdzmWmCvkmrMppgFnjkKe2uQzL0no+9iQPIqwkUi1HQvK
	I8wBJuXGMhrYopayHqVy8+SN+Cw6hbjSSxlN9lYgns1KqRbmRUwxLi2Zko8CLVta
	JqBIRrcsfW7fZflkM2C6a3AjpHVJMptnlfQO3HJV2fyVDMY1fK8oMkXbA/LTYaqC
	UuSqxiGByXz/+rpJb0bWTvCKTR1wLWfII0IBI7C+1KiggLlQAwjuBftcCTSFNNxr
	0jDCxoUbIxU0SRyXyPC6cQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4d4ppx1jfw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 18:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1774487969; bh=p9D6m25WPY8P5SeyUPPAbJqFeZ2KC8OmJVq7lDiDO2E=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=OHPGaCGsK0+0bJ3uGEo4Pk8IZw0oB1rNsoAUqBKUbLUlB+A7nvuaM9+MQFvmx+TzM
	 BtP8kw42Xuh34bqktWMTwhykxK8e8PlFd+NeJYY7ryEX+4W8SIcVpYqvALAOw4hDoS
	 jZBZG7RFsHsMz9DcFzzmG01IfRLRokwXSZ44kxsg6/NLUnfw9ePENmg7yyx7OS8xkL
	 8jx3e8SVtPodBPwbAFkvZ856pgRlGYcNbMtYkYLO28QDyilMFG4eGzcWSAax4JnrZz
	 4HbOjmiu6zFcxsTa0xG/dJBkqju0xT1hlR15z44bsWBJj0G1jGUtBidQTVKu0FnRnh
	 DzLbzurJ15Aog==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9E0BF4010F;
	Thu, 26 Mar 2026 01:19:28 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 470BCA00AE;
	Thu, 26 Mar 2026 01:19:28 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=HdYSyIEl;
	dkim-atps=neutral
Received: from BN1PR07CU003.outbound.protection.outlook.com (mail-bn1pr07cu00300.outbound.protection.outlook.com [40.93.12.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 91B0A401FA;
	Thu, 26 Mar 2026 01:19:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oBTsrnKPEv1LGTd7XU4JryhlKzx50rAdQrP+oDDEk+vIaI9WAoCKFT08WZyq/D/MJnX6Igy+JDXb/EfrDIDAUo5+3BWDMJR7HKtTm6cR0koETtrfZ2U8YnX6EnSDVnSrXeUDYOQfCUHif+51jTMc5PVLReVo0VQ8bF1qdvsYujFSOZRJTA6XDgs0NRop0+PND+TqjjhpWBH+fabhPP2w/hEAWfK7pqmyzey5WVVflDvYNC13Gec3Kk+MRNBqKwHGoYKXMIXFy5ddfh+1ksdI7z4ZGvOBLyLhaRh3pjej2KU7jAiNmr0zOLPT1Ra/dHDOoe5OYv9gs+y3UKiSCN19/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9D6m25WPY8P5SeyUPPAbJqFeZ2KC8OmJVq7lDiDO2E=;
 b=ixieGLwo1zAU0HknrslhoyAnbJelPqLXQCFpz9a9S4rtDknw9UVRvMjbdGdXSwyQui8DiUMRAH47km+lwP0E5hVzwElNQg5FE1zDAe+JpCt9hVaF+9/rwGxEJLSM+PhJJtpATs1PGzNrk8WbMJecMu4u/7FeiUuCl0v5TMF6g76JkclRYduycsE12wSbWMjDrHHmxdbNemHI48lm/a1iRx37bAMju+xq+yfjjQir0MnfMNzPaDksQeoMy6ffLA9vIWGpEFaDhBq3aXggSZ5MYrrSDZhOAUezAa5MWKLzTEcxkOuTynF/5Rt019GtA2kcxEbghEBY4ca99/5IYyKO+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9D6m25WPY8P5SeyUPPAbJqFeZ2KC8OmJVq7lDiDO2E=;
 b=HdYSyIElrg93F5ShuE4PmI2BLkV1z0WPB3QdFM3FoMHbAPidrMTdRtmfYwSg0697XEVHGd3XpeVxuLtxsMLKFMNwefLapsULC0F5G7B3qVXaoJaIyH8dEbRIyN4mJ2nZ+mOoD8fdhAEPTQNzve7JV6EpJEhjCzinTHGtbPAUyGQ=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Thu, 26 Mar
 2026 01:19:22 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:19:22 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "michal.pecio@gmail.com" <michal.pecio@gmail.com>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Thread-Topic: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Thread-Index: AQHcusCFdimQniQh+kKFqQp1mqfuYbW+fjMAgACCooCAAQbCAA==
Date: Thu, 26 Mar 2026 01:19:21 +0000
Message-ID: <20260326011910.t7ijezht7g7ttrec@synopsys.com>
References: <20260323122512.2019893-1-mathias.nyman@linux.intel.com>
 <20260323122512.2019893-2-mathias.nyman@linux.intel.com>
 <20260325015110.v4r5smfvdd62fcua@synopsys.com>
 <0f38e10d-ecac-4beb-ad2c-3a42c2546c3c@linux.intel.com>
In-Reply-To: <0f38e10d-ecac-4beb-ad2c-3a42c2546c3c@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|LV3PR12MB9265:EE_
x-ms-office365-filtering-correlation-id: 1bb974a6-79ca-4538-4bce-08de8ad5b606
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 +JFXLASKUSssK2XVi9GOcm1eaYilmsU3pWxF866tAWRBJitgfD5kkQJv9ucvvMBOzdMRoDQnhtS/xsQs8Od63gVoJGj8CTcdLmJuB7sWSuFwtcsW/SeUc9eo87Q9sxDyjqFW7oQLDDCFgIuIxNXrkoZYSyU0x8O2QW10P8JZWWZTe+Wi2jR5pVtzfUb3qOtX7MREQzdiWhGvp4lu3XBbdpEi+owCGdI/y9esF+/wsJP3VZ6sn8iZbIOGkwZsfuSSMj+DlRmJ91bwhz2TVj8KDyDf8DqRrSdwKCZNAsLbq9wBdGGsfZt9jS5B0NWrKlkcG6g4UjhvyC3bSjo9qr4nJmfBMmMYFNtmhnvhE2UcSZJvfi5iqxCr2dSMoOloniwrUQmXPgBf6luM/gAgpHprO6JBku038IQPpJm7RvcHJyaNypqOGdHfElcia3dprvPAlf7Yq8wEirh40zoLzK2rOgsoDx1H4o3/VbaC7Rl3AGm5C67NA1ypXhHTIxfUcLH9QUfWbxqruS/G4t6rTymmxUomEe0pX1L9MPiYoUz+7hxoalUZSFH0lWQKbJUzgTins1tNWiA3zuBnyyGraDrNSnXspzipIKmPlBmIhAmz6RNczpVBaIWitnD6Xc9dApOzV2SWi5QjGvbHiGVpq81FfoZ101HE8yn56qY3sNetQMuFQuDlufkjNgsgjRZ2mxUxSy2ijrKtSW6sIzhdblGBekHU102GF7ChQxmK+hNr+MzpQoJ6/C+C447EefBA3ryJ4Gnmh+5QkAsUmp5TQwWrWfYHrYuq1HCFqasC/u4j0/w=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UkoxcDlmaTRSc044UnZPUVAyN0pLR0lHczhxaisyblFhNURRTFh3QlU4RzJl?=
 =?utf-8?B?OEh1VFRMVXM5UmlkRjBSdTdRdVkwOFJ0Sk42Q2VpTEVCZ2ppamtuL0Vzay9x?=
 =?utf-8?B?SU1naWR6SmE0a3I2VmtTaStqMWhleHVIbWxoUHRNcGhqbTArTVZGODl2bHZt?=
 =?utf-8?B?QWtaNnkzcXhiNVp0WnV6QVl4SEF2QTkxSU9IYjlqRHF4Q2VyWThSV0dUVDhR?=
 =?utf-8?B?Q0FwNERYVDlSbnVaZGlBSXdpUEpYd0FLZjVKMVZaeHdGK2pCZ0ZRVDB6Skpy?=
 =?utf-8?B?ZWZpWTZRWUFCRW91a3RxUUtRY2pMRjQvbGJGcERtbDNsbU92ZjZ3YjVBdmJU?=
 =?utf-8?B?T2R5SXdUdWk4bkxNdVJDa09HQjVLUWFDajFkcXU1UW1kTmZZYXcvWEdRT25T?=
 =?utf-8?B?Yi9IeG9TTUZ0WFU0U01NSkxHWTR4MTZoQUE4a1M2SmR6dWFRcjEwVFZCU3N0?=
 =?utf-8?B?V3p4NjNkZnJGekFmWkhPUGU0anNQTFE1bUl1ZENYMmpKcGhQS3EwaUUrQlNi?=
 =?utf-8?B?TnVuUmI0dmJaODJTUkpWQllzMytBU0dtMEViOTFZYkNXOTFWSFhPMXpaNkp2?=
 =?utf-8?B?bzVTU3B6Y2xvZ3RGcUdLWGp1alNyWUl5ZmcwWmV4d1ZrSkU3dUErQk45MTU5?=
 =?utf-8?B?aDdSU3dXTXZrUk9TZkRVeElBWDBMTnFxZWsxMGRLUkV4aFYwem9TcmFaZjhj?=
 =?utf-8?B?aFJ1bk9HZGV5UmUvamZqWktLL081MTJhWGFYZTBjOGpheC9FTmo4RldOVzNy?=
 =?utf-8?B?dTVnT3FIa1ZtUnhTNjNaeGg4VFFRL0Y4cDB4QnQxdFJJYlBHa1hLbDNZckMy?=
 =?utf-8?B?Y2tQVWhMOXhjUW5FSVR1bG81TlBoTW1HMUFRSy9nWnI2QWtjczZSK3I5Y0NF?=
 =?utf-8?B?NmpheGtaNlNlMjZGdTBTKzRBa3hmbFc3UVd4RmxoUkMxdUROUGs5UUFXTm9u?=
 =?utf-8?B?NklSalRackEzQitxc1J4bThtUkJxbDVKejFESkNRUVZKNEpMTkF5Vi85NXhR?=
 =?utf-8?B?SkhGdERVeTBMUDNWeDd2YjhOWXUxeGpOUTdFVndPTTArMGwrUTQxUndlcE96?=
 =?utf-8?B?VWgydVY2MDlqWnY1UGZFVW1UZHBodkVReFlQYUhWa0xFajJjVW5CekRDWW5i?=
 =?utf-8?B?OWw3d1gvYllIL1pwY243TTYvb2JtWnBqTVV1OVgzSkNQUUdGMDN0Wms1alNt?=
 =?utf-8?B?RGdsVCtwYmQ1dFNGa3VCTXRLa3laajkvT1FGZG1CbGdvTDBweE1jNU8weklH?=
 =?utf-8?B?UndTazB1THc1cW8vajdEamJmNmQ3bGIwc25uVkZjdHRoMHBES0N5UWN5RDRG?=
 =?utf-8?B?NXpORDZzSk1RUkFKbUpwS0kvZkZENVR6S3MyQi80MFhLcStZdmZsWVlrc3pp?=
 =?utf-8?B?RVc1eXoySmU5anFWQmEwdWMvUTdRZGw4aiswM1RTK3hWVTJQeDVVcW9kRkg3?=
 =?utf-8?B?cWM4NnBOWk9tOU1YRWpjWnZHY1R2RGNKb094cUl3RDJIb3FTcnBBS21kOGpF?=
 =?utf-8?B?eUJoWVUrTFoyTkxSTlVMSkF4ZHROQmJzL3NGdXZ1N2pTT3pmSHdvbnhVUnVw?=
 =?utf-8?B?ZGZ6V3NnVDZqTGVSS2VSWjdhREE5K1o1Q01tL3NJQ3ZuY2ZjdC9kdC8rT1hk?=
 =?utf-8?B?Wm1pemkxc3I1L21LRjFJcmNzWGE4eWQ3QjRNWjRLSWdkVWkxR0Q5VUZuM20r?=
 =?utf-8?B?TzJqazJvc3Rxb05UVE9xQkdYK3pLYm9Zc1BvNkFnektGSi9vVlh0NUhVaFVE?=
 =?utf-8?B?ZldoYXQyZDZ3aHNBT0Y0ZU1jUk5OT25vOTdWd2JBQVdrRUE4bFlJbENnUk4w?=
 =?utf-8?B?UnZPNkg4OGQveXV6YTdrTXY2MEUwdWhydU44L3laWVBpdFJyeWExR0RxK3pI?=
 =?utf-8?B?bVVRc3lXdS9BMmUzYmRHaDJLTEhESEdVOE02ajMvVXFhRVVZeWtVSWpBWVR2?=
 =?utf-8?B?OFU4ZUdMN09SNDZOUmgzUHAxVlIzY2crSnlDNWpIZjhxUW1JTzdiTWZVQkJy?=
 =?utf-8?B?UGtJc05kRDZ4cE9wUHcya1JOdk9RYWVTZ1RkaFo5S0VFVGJSWG9sNmw1bmxP?=
 =?utf-8?B?NlVKcWlGZHJjaXZXR3czU3RGeklwNUdnKzUrWGNONGdmUVBZNUw1eVZVQ0s1?=
 =?utf-8?B?TVpwc2tlTFBXTm52eW1vcGZqMzJNYVAvU1l3UUVTWGFIQ3pHWk9WYzBaK3A0?=
 =?utf-8?B?TllxMmpyYkZhQWV0SjZOMEFEdStFV0FWLy9KejNPNyt3YkZUdUVWYVViSVd2?=
 =?utf-8?B?VGpBNHBydkVGdlplVlNtMjhMMUpWT1QwY3EvVzBva1pHMXN2SWpuNjJlTjUw?=
 =?utf-8?B?TmZ4Vkd4VEN0RHV4NC9TR29rdUUreGNQejBFbWkvWEJMTEEwUlI3QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C9555D616F35E48B1DB180F673ACF2B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Njs0OOCtnBWbIqIO7XRFrRGDunRbr2hoTRfcGSoiAJccVwxdwXhWMtKNd5GWkXDbh8I7qDZUpeJ08B6eFGmq5LzCVKSvW+FKqFOAHDpcnajVa221Tpvmlhn+p4OdJy5RPAYU3KyUTuB65VS/dLUAJFyc3PAei/0+ittYYHzi+NDjdSweejlrMaTC3DqnJENp/8zY1EaiWTK36Do+Y+Dl0UtymjzyxnED5mIc5pDWClaYV2lxwslJ7WZEYwbyxpO3Rm2YlaFy7t8tdN8LMo72Wts6PEYsXz0P31pRK/o+tODp0kqKeAgvgisjGwjtfhQH7XdFwgkgFUPljn1+O1Y2Kg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PjcIHf6yV0SolpykcttvAVnBcoDPTs3nmtiZfEvuFQEao+485QU8IOSjwp4A2NAJNqXPedWJQc0NJ3rpbvj/8IL0EsR5JxpSc9OqQp0AXW2Of//GGUs/haB3fO6FuXSDsYHaEl7mQOhFylOeTTvw19qzbB0dQQDorQ86q3tmkPrFktYznUvKK3TX1XCbbkNhVKX3c11JjRgKyUT1jlMy9d4m4WHuygdDb7FdikEAMwrcG/MJR3YGpnp0cC5GJMv3bKQi1E/97TSxAZ7Zu1g5cCW7l4JvSf4B9r8D69dxrolzp6VidYc5ATfqhAYswSVlUdqm2Z+vSC0EFyXvodg+g036QmIlPJzpb1BckJOSHHAIEehI+zVyiSi4Uy9TTFcnnnPLfSCQW79SB6maGtSMqqGIsVEY77s5BVgjNMRHhKmBe+uQEqrJVb2Rcq0ZSCPmcMYDdML2mVur/Fx6AIPgsIQkT065C+ou/3n1VXgJIrA8PqL2fdx7eidnZmPsftfsCb+Ts/+0fSxHwo/8jUW5DSsbLM+J6hz8RBxq9fOWX9OGzKgeCmNQa/8Y0tIErJoAUmkNQZU8Bwcxo39m4FNIwcnZBwwStgdHiis2hO6kq9/Yxr6JHJxUB2MqgET/DbCDcyfJZvxpW2p7S4uFYIqOYg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb974a6-79ca-4538-4bce-08de8ad5b606
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 01:19:21.8645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sZ7uk4wCoUiE+gwafXPK7kzt18WweqUfqSAfIKO2bRXhvV/f3vR6ZCPPGRWrfg7L+teKUnAuovCB9q2tvDHgdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9265
X-Proofpoint-ORIG-GUID: hIxgwKWViT5EXhwTN7woPWHH3GnGKVXl
X-Authority-Analysis: v=2.4 cv=Do9bOW/+ c=1 sm=1 tr=0 ts=69c489a2 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=1hM4Z_krA574TsCcQd4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: hIxgwKWViT5EXhwTN7woPWHH3GnGKVXl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAwOCBTYWx0ZWRfXwH+z17WYSGoa
 VmSzsc9YrHTdfOJSF3A5dMEvoRTmBzfgVaocDaETAUxCBI/FMOwl8DILWqEZLVfkD0mCoFvZX5u
 qwVIouvx4XtfOULs/pXbgq7qlQb9KDDLlLoCByWH2SEFds74zqEhW+mQy8DW9hoU1ojMGR39X8w
 hNHcXWY+e/JYnZrHRo/+EjIIdSkCxfUcMS0Ebd5Qb2fFx4rsaHW0y1LyOXtdi5SiBF6v6V19gxQ
 duoET0RJJCSmPSqH1boahJ4rGMB+66WTIC2E2ReupUH916TigTU1bRQzX5ebYtTGYf7+GASU9o0
 wmoVfE9cUyZ6/jbCX6BpFHa3vpZrGAQJ2K8pfX0bZEcuOecD6YfFzhmKcBhpNHMm5Ka7HOnIqBW
 b+NymBeh2IMcHuKOSY+9pnGYp98DGApheqEabXMyHMvBq3iVmYqPqOqwRCdekprJI3yVz7s1UkS
 Ef1CKU+fdPg8ziHoWGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_07,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2603260008
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35476-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,synopsys.com:dkim,synopsys.com:mid];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[synopsys.com,vger.kernel.org,rowland.harvard.edu,gmail.com,suse.com,linux.intel.com];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5FB6232DCC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gV2VkLCBNYXIgMjUsIDIwMjYsIE1hdGhpYXMgTnltYW4gd3JvdGU6DQo+IE9uIDMvMjUvMjYg
MDM6NTIsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBNb24sIE1hciAyMywgMjAyNiwgTWF0
aGlhcyBOeW1hbiB3cm90ZToNCj4gPiA+IEF2b2lkIGF1dG9tYXRpY2FsbHkgcmVzdGFydGluZyBi
dWxrIG9yIGludGVycnVwdCB0cmFuc2ZlcnMgYWZ0ZXIgYQ0KPiA+ID4gVVJCIGlzIGdpdmVuIGJh
Y2sgZHVlIHRvIHN0YWxsIG9yIGVycm9yLg0KPiA+ID4gDQo+ID4gPiBJbnRyb2R1Y2UgYSAnVERf
VEFJTlRFRCcgc3RhdGUgZm9yIHBlbmRpbmcgVERzIHF1ZXVlZCBvbiBhIGVuZHBvaW50IHdoZW4N
Cj4gPiA+IGl0IGhhbHRlZC4gVGhlIGFjdHVhbCBURCB0aGUgZW5kcG9pbnQgaGFsdGVkIG9uIGlz
IG1hcmtlZCBURF9IQUxURUQsDQo+ID4gPiBhbmQgaXRzIFVSQiBpcyBnaXZlbiBiYWNrIHdpdGgg
cHJvcGVyIEVQUk9UTyBvciBFUElQRSBlcnJvciBjb2RlLg0KPiA+ID4gDQo+ID4gPiBEb24ndCBh
dXRvbWF0aWNhbGx5IHJlc3RhcnQgYW4gZW5kcG9pbnQgaWYgdGhlIG5leHQgcXVldWVkIFREIGFm
dGVyDQo+ID4gPiB0aGUgVERfSEFMVEVEIG9uZSBpcyBtYXJrZWQgdGFpbnRlZC4NCj4gPiANCj4g
PiBTb3VuZHMgZ29vZCBmb3IgLUVQUk9UTywgYnV0IHdpbGwgYSBjbGVhci1oYWx0IHJpbmcgdGhl
IGNvcnJlc3BvbmRpbmcNCj4gPiB0aGUgZW5kcG9pbnQncyBkb29yYmVsbCBmb3IgU1RBTEwgZW5k
cG9pbnQ/DQo+ID4gDQo+IA0KPiBXaXRoIHRoaXMgY2hhbmdlIHhoY2kgd291bGQgbm90IHJlc3Rh
cnQgdGhlIHN0YWxsZWQgZW5kcG9pbnQgYWZ0ZXIgYSBjbGVhci1oYWx0DQo+IHJlcXVlc3QuIFRo
ZSBmaXJzdCB1c2JfZW5xdWV1ZSgpIGNhbGwgYWZ0ZXIgY2xlYXItaGFsdCB3b3VsZCBzdGFydCBp
dC4NCj4gDQo+IENvdWxkIG1ha2Ugc2Vuc2UgdG8gcmVzdGFydCB0aGUgZW5kcG9pbnQgYWZ0ZXIg
YSBjbGVhci1oYWx0LCBhbmQganVzdCBhZGQgYSBzbWFsbA0KPiBkZWJ1ZyBtZXNzYWdlIGlmIHRo
ZSBuZXh0IHF1ZXVlZCBVUkIgaXMgbWFya2VkICd0YWludGVkJy4NCj4gDQoNClRoZSAtRVBST1RP
IHNob3VsZCBiZSBoYW5kbGVkIGRpZmZlcmVudGx5IHRoYW4gLUVQSVBFLiBBIFNUQUxMIGVuZHBv
aW50DQppcyBwYXJ0IG9mIGEgbm9ybWFsIHVzYiBmbG93LiBTaG91bGQgdGhlIGNsYXNzIGRyaXZl
ciBzdWJtaXQgYSBuZXcgVVJCDQp3aGlsZSB0aGUgZW5kcG9pbnQgaXMgU1RBTEwsIHdlIHdvdWxk
IGFsd2F5cyBleHBlY3QgYSBTVEFMTCBlcnJvcg0KcmVzcG9uc2UgYWZ0ZXIgdGhlIGVuZHBvaW50
IGlzIHJlc3RhcnRlZC4gVGhhdCdzIG5vdCB0aGUgY2FzZSB3aXRoDQotRVBST1RPIHdoZXJlIHRo
ZSBkYXRhIG1heSBiZSBjb3JydXB0ZWQgYW5kL29yIHRoZSBob3N0IGFuZCBkZXZpY2UgYXJlDQpv
dXQgb2Ygc3luYy4gV2Ugc2hvdWxkIG5vdCBjb250aW51ZSB1bnRpbCB0aGUgY2xhc3MgZHJpdmVy
IGRvIHNvbWUNCnJlY292ZXJ5LiBJTUhPLCB3ZSBjYW4ga2VlcCB0aGUgaGFuZGxpbmcgb2YgLUVQ
SVBFIGhvdyBpdCB3YXMgYmVmb3JlLg0KTGV0IHRoZSB4SEMgdGVsbCB3aGV0aGVyIHRoZSBTVEFM
TCBlcnJvciBzdGlsbCBwZXJzaXN0cyBpbnN0ZWFkIG9mDQptYW5hZ2luZyBpdCBieSB0aGUgeGhj
aSBkcml2ZXIuDQoNClRoYW5rcywNClRoaW5o

