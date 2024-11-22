Return-Path: <linux-usb+bounces-17793-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F18479D5843
	for <lists+linux-usb@lfdr.de>; Fri, 22 Nov 2024 03:22:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 598C3B24279
	for <lists+linux-usb@lfdr.de>; Fri, 22 Nov 2024 02:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A905778685;
	Fri, 22 Nov 2024 02:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="pBKAufed";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dv8F0xcG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GR5STWjM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B885C3B1A1
	for <linux-usb@vger.kernel.org>; Fri, 22 Nov 2024 02:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732242132; cv=fail; b=WxhLm48iXwyi+w0Q7GZUsuFNmXYhhi3emTqI80WXhvcMEJHCpKMJZZkoGTmGGaGNFoiycZCO8dF/UkBsV8Q4+m50cCFEFQXn6tJDxdG9ZRbtfp4nD3bAsRiTocjlpdRDL/ocodzDvIR2oxnJRkznv0ygZRFt806rWYFTQO1apMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732242132; c=relaxed/simple;
	bh=EOaP+Itz0Wwpxp9GI2ZnevBQh4bktbKHUOI21SN4AI4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Tnd5zGLt/bNHA+ORBOZFwncdHqdnEGlFjOd8D+TNz4BvclbkjKBLCWwzw8PZP9D5ZvHio/IhKgQRCmAVOJ/8rp8ITMu+DGyAZGLgJw6/L1X5RtLA9cxpcYwjtOpqnkgTUixmlBiER8zJJPLWyBR2GURvLR7pOAZhc/GKwiONjZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=pBKAufed; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dv8F0xcG; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=GR5STWjM reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM1YkSJ008486;
	Thu, 21 Nov 2024 18:22:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=EOaP+Itz0Wwpxp9GI2ZnevBQh4bktbKHUOI21SN4AI4=; b=
	pBKAufedZV0QlmWjnaMj2JjwG8RBJtP0FUj3yB5MjmzgqsklD4IyJTztE41WAXfr
	IYE/JczQgHDXx3U1+eShrC6tN+OTiU97mfqeGnCUoJLvt9Hp7rNUVdIO1BlrJ1rd
	wEJOHjJzXQuLoCSaGMqH8bKxKNo98z/BG2UeyTcnghHC8we/s1yK+vjZpbE0niiL
	Lo0AemqXgKFoWOpkBH/j16occWSkc/wIuHsv0YB0H2FETb0QOTGypcj25SRvGTUe
	80xF4flRvih1ZUqQ+u7CSdqQj/b52anCKqBa1C6K51hZr/tD2MGHxa866EJ9GUOp
	v+IXhgtMTWXw1nYNC6zbzw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 43203hxcnr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 18:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1732242121; bh=EOaP+Itz0Wwpxp9GI2ZnevBQh4bktbKHUOI21SN4AI4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=dv8F0xcGukhxhDYeIZxySBw0kP3+nD4UmRcC4xdUSlce8OVjJAwFZUxYjC9CGv2OL
	 SfdBo1Wk9kRU0RY43NrHDXVBl/wTc19HM/ELNQ2JzhsNOUtAPhc6Z4myiIoO+dwi/D
	 H+HQwQLeHOI40ELGzw6z/Mg+PWE1vBHCh0mVvQl75lN9CzWFNHLLqHFDlOkyMRH+mm
	 N4T/UE3pVYPLaW1mQ1YdTPKNCbFKL/WqhGMdh4dXb6NEv8ziAuxbX7KghdmQFKk6rO
	 rcml41woF7ky4fbjl/J8NpMHXQcl1xcC4yj0A25gVczslOLmoSnKiHnFdnmG5mUYIu
	 UakW6JPLSJUog==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9B7C140136;
	Fri, 22 Nov 2024 02:22:01 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 38B94A0080;
	Fri, 22 Nov 2024 02:22:01 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=GR5STWjM;
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2043.outbound.protection.outlook.com [104.47.57.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9D4FB40110;
	Fri, 22 Nov 2024 02:22:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=weBTI8e5g9pzT0g8YHieorRBN7R9FgaJwGKXKsnmf2lUTTj93RumIgWxqgQYLFKaHKyD8+W+DAokK/Euy+n2i2gNeIqbQ1avUs5KY4cJXmyck4eCdJ/1XL2+jmOD3HzJddApewVtSzJXqGw8p5iK646CM0ejWhRhCsQQzhBzwD4JYgVHlSIG9ozoLPubmGygc7+rQwHZD0jEbK16NXkagcPwmQkS8JdvcdJE7jjhcjRlxQZrszf6jwA6tDRFIAKPiZs7MuytSA2g0ovdT8+OUWi3o72KU/kly15sITAiTkEi853S5TK6XRcdiv7HoR5nvSyJxtnLwIBw7M7OyhLq9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOaP+Itz0Wwpxp9GI2ZnevBQh4bktbKHUOI21SN4AI4=;
 b=UWl6a+Smrqok3mOXGDVHMAh6qmBodP/V2XZjceKcF8n9ThuqyYdvyHt/5PbO7rFZwCfi9nfHUQmDFQ5bEGs0eesBEvvUkSpYPB505zyF4KQbx3mTIUUzSc5H5b1/3qoVDy0+mfBZ2S0ZGYNYNo3OsgVLJ2ojZDNcCe7ibsI3oV6J/AoIRXyLYYrLcPwdYUL7NsBV8Uv3xp24mXqJKC5p+FPQr+rKqdzT8bAVcieDKznknLqvo12MoLk38QvkiztTWuWSLppSODxuCyy966I0XcHWkQAGE33tVs+KGC43ig2cmklvQqPA6eJyo5oAe9jLiqlGWJQ+hf/PbIa6N1UdMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOaP+Itz0Wwpxp9GI2ZnevBQh4bktbKHUOI21SN4AI4=;
 b=GR5STWjMlHiKSd42vJ8Mv24WXqed/XgSm98JR28ie47eZ17U7BDzTr1OChgj8TX6ouUTTA0Gh82oHJgWZ108+3sqYASAb04eDUBuYkHvPpr57IcArPGsU3i3MO0I5EjGHeIuxMtgfcIv8CxecBfLWCN8Kt2htyF3whCg9QInWZU=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH3PR12MB9147.namprd12.prod.outlook.com (2603:10b6:610:19a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Fri, 22 Nov
 2024 02:21:57 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.8182.014; Fri, 22 Nov 2024
 02:21:57 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Homura Akemi <a1134123566@gmail.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Inquiry about the f_tcm: Enhance UASP driver work
Thread-Topic: Inquiry about the f_tcm: Enhance UASP driver work
Thread-Index: AQHbO7xmD/jJAOa+EECV26D4vP1gsLLCkxUA
Date: Fri, 22 Nov 2024 02:21:57 +0000
Message-ID: <20241122022146.ykwhz4byhy645njg@synopsys.com>
References:
 <CAC7i41MN9LAxy7FZh7nbo9zQ_hvmkZtzpGpXatyCVLQTde=RZA@mail.gmail.com>
In-Reply-To:
 <CAC7i41MN9LAxy7FZh7nbo9zQ_hvmkZtzpGpXatyCVLQTde=RZA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH3PR12MB9147:EE_
x-ms-office365-filtering-correlation-id: bf1e16d6-d38f-4d35-e712-08dd0a9c709f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|3613699012|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UngyNjFXU2VFQytURnNWK0NBbmF3c0NEc254UlpjZ3QzRVQ3RGZ0RFRPVTRI?=
 =?utf-8?B?dDdjQ3BHVEpWZ1FBV2UzRDcyWENObHJ3cjlIOTN4VUJmRW9yV1d3T2hzaWEy?=
 =?utf-8?B?YitlK2tvK3p1Qk0wR2JmRmtQamhSSStLNXk4ZVgzU0FRQzJNbUJoOVdrVkZT?=
 =?utf-8?B?b2Z0clUzZTc2M3MvWlk2SUYvcmZyaFI2SXI5eXFqTDNucUpSN2czVXRiVjgw?=
 =?utf-8?B?T2owVlBHcUJJQXZyaTJuL0dlcUZoaGJlbU8zU0QvVVVmVVFEVWdWZFNpMlpl?=
 =?utf-8?B?NktlbHV0OEhBZHVQWVUyNld3NUJoWmZleWlJcjJ4U1l2S3hkNjM5U0tGemF0?=
 =?utf-8?B?VXZIdmllR3F4M3NHQmphdlNnc3VzYjJpRkgwQ2YwQUxBVTRnbnY3ckJ1VytQ?=
 =?utf-8?B?YzdOdTltZnRjbHlhbUtKL3RjZExkVnVBWUxKU3pGTjF0UG0yTmtQU1UrVytq?=
 =?utf-8?B?VXBhSVdQVW8wTWdhUXJ0aHAyZ0VIL0ljenF6QTFjektJenBqdkwzbGN4eU1Q?=
 =?utf-8?B?TytYRG1zLy9GQWR1NmZCYWI5ME1kZHBYM0VKOG9qSXFTRE13UkdVRnpzSzVX?=
 =?utf-8?B?d1NEWjBPMW5TN2FxR3VEWHRIZytTbGJ0SHZQNkR2bWZqeTV3QmFBS2l4YjNs?=
 =?utf-8?B?NG55MFh0Mzc3alNkT2IvU0RsL1pVRUVnNUs5Y1kxRC9Eem92cXl1S21JYVRt?=
 =?utf-8?B?ekhQSW82VUUrcnhYNkJuTGlzdVhLWitYN3RHVXNEYTBJeG1VaEpCbXNsT3Ax?=
 =?utf-8?B?Uzdtb2NINlNLVXZzNVJUdi95OXRYWTVFTGdLSW5rTHdLQTY4RTU0czR4Mmgz?=
 =?utf-8?B?c0lsYlg0RGhMalM4R3JyRW11bFQwb2UvSjRFdHM0ZXphaWg4NDYvcWplT0Ry?=
 =?utf-8?B?WndMaXgxR3JnVENOWFBlK28zNGdYejN0enpxU2tYWUNRTWFWVThXZHhBbm1W?=
 =?utf-8?B?cmczSk90ZUM3L25CQnhCWkxOWWV6bTZ0RUhaOTVrRjNkUG94bjN6UDA1V2xO?=
 =?utf-8?B?cFk5NUtPdTdzeVMvd2tpVURCT29ieG8va3h6K0hZMGJ3K3BVajF0SnlaRjBU?=
 =?utf-8?B?TENKODF6UmdSQkJPOEVCV0xvaXRyblhEZXlscnlkTHAwdm04NVlYd0RTL3hj?=
 =?utf-8?B?WGh1a1RLZUxSUE5pYithU1QvdGI5aS9mQjBRSmI4eTQrM29xRkh3V1dacXZD?=
 =?utf-8?B?emJaWi9PY1U1YytycGQxem0yTHpTZm9iZDJ5anppejQzN0VCeHZ2OXEyR1Er?=
 =?utf-8?B?OFAxdUdUdThWRFhKbnBJMWFxaTEya3Q3c2R0akxobzBzVUt3eFA2M1ltTVcy?=
 =?utf-8?B?SHFIVVJVUnU2M1p4T21FSkMxU3NRYVhkM3RMdFNKU1VJSVg5b2dNcGJKNnFk?=
 =?utf-8?B?L2tPVGJKZ1ZzV1JwQXd2cE1Da0lUOStyaEsxNFJrNXdoT2JxMWxvdUxnLzQv?=
 =?utf-8?B?U05keUlFa0dpTS9EbFE1MXEwTVZQV05CK3ZLS2FCdkZFelcrZmwyN2Fxdjl4?=
 =?utf-8?B?TmhaZVVSOHgvOGJURktkanRuZW85ck53RUFYaU81Y1R5WUNlM2I5MlVwRzJF?=
 =?utf-8?B?M3R5NVB5RUc3M3pNVUpOaGxLazJabGFnK1ZrRi81SGZuQ3h6RUwxV3JyK3FD?=
 =?utf-8?B?YUJ4eURtR3BMaWNjcnYrWHZHMkFRNFIreUxYeFJPeURWSkdZY1VvV01BeE5k?=
 =?utf-8?B?Y1VDYk1RUnJXRU1MOVlOUGhrSCtjd0dRT3JxUGZKcHpXVDF4eFlwNGJrWW9m?=
 =?utf-8?B?UUdxWWxpb1pDQVZhTG9BdTJhcmQwZlV2dnlRcXhCSEVib2VnTnUza1QzelRT?=
 =?utf-8?B?d2Y4REVnaTZqQlA1c2ZHVVdYTEs0R1ZVL3JQbDlKYjF1YzI5S1ZaOEl5bVph?=
 =?utf-8?B?SUV6QkdaYnFpbG9lc2tQRzVOQ00xMXpRbE5lVGVvMVEzR3c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(3613699012)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c1ROSjlMaGg4V0J4cndEZTZuNnVpZHUrUDNhUmJhYWU2emsrMVVEWW5VQmdj?=
 =?utf-8?B?L0Qydnh0a2lwVmdielFub2lnZzJZaGdZN05jMnB6VlI2cjhqUDVvNk1aaVZR?=
 =?utf-8?B?dlN3bnZ2U3lCbWZTaWtIM0FiS2kxcUVCUEZ3cGtVN2FITm9CNTBXRCt2Z2pY?=
 =?utf-8?B?RGlOQlI2MlRRa2RPd005OXB0b3kzUDZPMmhxRmxnQXRJRUc5RENKaCtReGMw?=
 =?utf-8?B?a0EzMFY1YTRDWDBmSlFFY1hrNFY5ekVleHNWejJQendsbFR4QitiK0NKSy9x?=
 =?utf-8?B?QjJJSG9CZUVGSzhTWGhQYUtEQnNHV01aQ0VYVDlRcnFNazZpbjN4YnYxN2ZC?=
 =?utf-8?B?eHAzUWtnd2oxNnZZUVJORGpleGludy8xcjR3em9EaWdLNTZuRDRCS0JiaHNQ?=
 =?utf-8?B?Y0gzbnJocmNnYXIxRGt3ZGwrMmxla01wSjVmN0lUM3BwMTlEb0ZDcGZza3dp?=
 =?utf-8?B?Ti9NaHpmMVpmbDI1bE1sTThwcW4yYlRWL0t6ajJhZXhwWFpxN0hudHBvdzNm?=
 =?utf-8?B?QlFqZ25oTldmbXh1Qm1Db2lNcXJmMW1uUlpDTlc5SjBWUXdWLzBJMlcrU3Rw?=
 =?utf-8?B?Wi9xdlpjaStJYXNXZnZiUXNOSXVvNjYyMHBLbGxIQ0thREpVd3o2ZTlxTXlq?=
 =?utf-8?B?UENIVENnT3V1WnpOZ29IVWZpa2NDK0hla0JYMHNETktJTkh5bUE1K3p3Z3FM?=
 =?utf-8?B?SG8wbUo5TktrNldscjFPK2hXNkM4cGlIc015bEpXV21Yb1hWL3g2Q0puSmNx?=
 =?utf-8?B?YW9CTEptNXYvS1NJZDRJRW1kSTc4R25VUFplZXhyZ24xMmJKZW1NT0Mycjdr?=
 =?utf-8?B?MGFUaFczWEVPZ3FiYzUySklMUXFRWHJOQTE2cXpWYlliNTBjS3N1OFg1U0JJ?=
 =?utf-8?B?Vm95WjV0NmF0WU1wbEYzS1FuSjBpVU5zMDBxOC84NWYvakZKa0I1Z1ZVQTli?=
 =?utf-8?B?ekFhU1ZnTitZMURiaFljMjBNeGowYXgxanBNRk1TQXA2R0NEY0R4eEhLNXNT?=
 =?utf-8?B?dEN4NUNFTFdSV1J5TUh6SzRJS0hERFRYcERlVlV4YjZQbUsrQjFBa0tDTkov?=
 =?utf-8?B?a29Xam5hVWVCVitIYy9NZWh2eGx2bXJVTW5maWY0eW1WV2tRL2hFTHh4ZVFn?=
 =?utf-8?B?bU1QMVBuOUhpdGNDaDJpcVlxVmFSMHA0Z3ZMUHE4YzFJS0VDZ2NsNTlaVlJK?=
 =?utf-8?B?R3YxNzJEQ0tpMEh5MUgxZExxTjNKc2FhV3p6dmg2clpRQk9waVpVWmdDYXJS?=
 =?utf-8?B?bGlQSFU0Yms0YjVtbVNWWkw4TFBRanliZDk5Y1NqSldORG1LWmg3RmJ3cGJ2?=
 =?utf-8?B?Ky9raEwvNjZPMksrczM5c0lQMEllRkFPSEh3YzdONzZNY2sraTdYZ2JUd2p3?=
 =?utf-8?B?bXA4N0tLdHc5empjT21KYWtlamd0M0lTbFVWWm8rOSs5TUtBZkZQQjFWRjJL?=
 =?utf-8?B?SXlGT0phSzRYZ09HOEZtN25wVWw1MGRvL3EydWhPNmdzL2RWM0VuaGlyQStl?=
 =?utf-8?B?Y0ZaZ3J2bTROa1RTb2xCOGxZVGxUd2tVTzJOZW5HUldoTEgyZzgxVlhlUFQw?=
 =?utf-8?B?b0s0UnBQZGZnRHJwZ0VpWGhqZmN5SXB1NG11dTdsSWswNC90SUlnZXU5K0V5?=
 =?utf-8?B?NXFZZVd1eW1BMnZGSm04WXh3YkJMaGRTeUNCU2tPWUZzYUNLenAxVDJMckFC?=
 =?utf-8?B?bnhPWFZhelhBaGkzTHhCOW1wK0dBTE9wNGNzZWxheWUrL1pVMy9obU1lK1Ry?=
 =?utf-8?B?VVpEWXVzZ24yOXU3ZSswUjBaQS9adnBkUFZuTkFodUF0SGNhSTEyR2R6UFJj?=
 =?utf-8?B?YTIrdFNrSnFLUGZRdTRRVmkydWtBTlZQMU02aGhXOStLTWxyKzZMbzZ2MlZP?=
 =?utf-8?B?TzR3dndlQnByOU9ESURxSGU2ZVVUT1RrUHA0VE04MzFHc1RnTlJ0L1lPY2I2?=
 =?utf-8?B?Ni9NdkNuSXowaWU5NC9Sa3c3Z25lOTlhQ0RPblNjbENwdjJXdEt1YzRqZE1r?=
 =?utf-8?B?bG5lbnNvWnllcGlMMEdHV2ZBUDU4dFpKMzF3eVJjZlY2T2FjUExEVmpmdWx0?=
 =?utf-8?B?bFYyczZhT1ladDhtREhoZnVkdXNGWXBOT1M3eE9ML2t0RUJmNVRuMkt3cVNE?=
 =?utf-8?Q?6Fq97L/NG2Lmr9mM1IKcLXPqM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <09B831B80997AC43961EE80DA65DD036@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	t2h7rg6hTnbFJP+tBlH3i90npod3ICGQ44gf8qY+thoMGHr6irh0z5pbmUHCS1qTc/L/bO5C0fhoWQzewUZLaXVHjfVXsde3jsPC4y8wnNDI3QrwQsIfhfg9vicnjo62zHrHvcDa8n3om5CLADg5YnFy8KNAM2E5EfZVttD0gfcANpeIYlzYgSeBzT/zj0ctivcvict2Q+wneG/ywclJVoVFuA6xr0hGf7VCIb2WrL1dMird9xK1xxQ+8I2yVH5unEgav/8R89ahU4yTyahuKRfEjfO8zPbvbog/uVSg3qt+XsUpw2dMRb9XT3zDziUKsEr27koLDgxxz45cT69p0sNWKzVPys/p+7aPLGVafCrdizkRJOZwq2hVk6sFdz52BDBO61cQTiemyIj7tZ9q7TgqKPBpASjzGSSUAju6fT+1p756OAUBrJIFXtzAxyDgI2dOSwFB0m3uvb6VIUWyoEYlRsTiR82zUrsxG5eVse+2PJps1Xk0bZAUnNfiwWSS1iSoyYwBlYL4baQel7uvivAPeGmjGIjjapscwsSDq+/szAnZTHteAYzv4C/f8tCqZp41YkTZlOI9lZJNvpUnM+CYHWqZD1ZTesxc7S/6HgDzZZvYAAKSdoQPD+/urb99cbJVco8aUQ5gCfFop+iXxA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1e16d6-d38f-4d35-e712-08dd0a9c709f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 02:21:57.6699
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KY0G+1idqoFEaIMx/mt8UGgXqfrvvVV3dsPNLUjSFzhj2mX9Qh5RywYrcL1AXXOY71E/bMJa3WjNjOUxubQmzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9147
X-Authority-Analysis: v=2.4 cv=Us4xNPwB c=1 sm=1 tr=0 ts=673feaca cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VlfZXiiP6vEA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=aWQC5PjzYS_HqbXDUl8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Qfv_LKF17WUsr_l7rzS3xrTrHbu8pBrB
X-Proofpoint-ORIG-GUID: Qfv_LKF17WUsr_l7rzS3xrTrHbu8pBrB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 clxscore=1011 phishscore=0 bulkscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411220019

KysgbGludXgtdXNiDQoNCkhpLA0KDQpPbiBUaHUsIE5vdiAyMSwgMjAyNCwgSG9tdXJhIEFrZW1p
IHdyb3RlOg0KPiBIZWxsbyBNci4gTmd1eWVuLA0KPiANCj4gV2hlbiBJIHdhbnQgdG8gYnJpbmd1
cCBhIFVTQiBtYXNzIHN0b3JhZ2UgZ2FkZ2V0IHdpdGggYmV0dGVyIHBlcmZvcm1hbmNlLCBJDQo+
IGNhbWUgYWNyb3NzIHlvdXIgImZfdGNtOiBFbmhhbmNlIFVBU1AgZHJpdmVyIiBQQVRDSCBzZXJp
ZXMgKGFuZCB0b2dldGhlciB3aXRoDQo+IHRoZSB0YXJnZXQgc2VyaWVzKS4NCj4gDQo+IEkgYW0g
dmVyeSBncmF0ZWZ1bCBmb3IgeW91ciB3b3JrLCB0aGUgc3RyZWFtIGZlYXR1cmUgc3Ryb25nbHkg
aW5jcmVhc2UgdGhlDQo+IHBlcmZvcm1hbmNlLiBZb3VyIHdvcmsgaXMgdmVyeSB1c2VmdWwgdG8g
dGhvc2Ugd2hvIG5lZWQgaXQuDQoNCkknbSBnbGFkIGl0IHdvcmtzIGZvciB5b3UuDQoNCj4gDQo+
IEl0IHNlZW1zIHN0aWxsIGFuIHVuZmluaXNoZWQgam9iIGFuZCBsb25nIHRpbWUgbm8gdXBkYXRl
cywgICBzbyBJIGVtYWlsZWQgdG8NCj4gY29uc3VsdCBpZiB0aGlzIHdvcmsgc3RpbGwgZ29pbmcg
b3IganVzdCBhYmFuZG9uZWQgPyANCg0KSXQncyBub3QgcmVhbGx5IGFiYW5kb25lZC4gSSBqdXN0
IGhhdmVuJ3QgcmVhbGx5IGhhZCB0aGUgdGltZSB0byBwdXNoDQp0aGUgbmV3IHJldmlzaW9uIG91
dCBhZ2Fpbi4NCg0KPiANCj4gSSB0cmllZCB0byB1c2UgaXQgb24gZHdjMywgdGhvdWdoIEkgZml4
IHNvbWUgb3RoZXIgcHJvYmxlbXMsIHRoZSBob3N0IHNpZGUgeGhjaQ0KPiAodWJ1bnR1IGNsaWVu
dCkgdXNpbmcgZmlvIGZvciBzdHJlc3MgdGVzdGluZywgYW5kIEkgZW5jb3VudGVyZWQgdGhlIGZv
bGxvd2luZw0KPiBlcnJvciBvbiBob3N0Og0KPiBbMTg4MzYuMDkyMTU5XSB4aGNpX2hjZCAwMDAw
OjAwOjBkLjA6IFRyYW5zZmVyIGVycm9yIGZvciBzbG90IDMgZXAgMSBvbg0KPiBlbmRwb2ludA0K
PiBbMTg4MzYuMDkyMjExXSBzZCAwOjA6MDowOiBbc2RhXSB0YWcjMTEgZGF0YSBjbXBsdCBlcnIg
LTcxIHVhcy10YWcgMSBpbmZsaWdodDoNCj4gQ01EDQo+IFsxODgzNi4wOTIyMTNdIHNkIDA6MDow
OjA6IFtzZGFdIHRhZyMxMSBDREI6IFdyaXRlKDEwKSAyYSAwMCAwMiA1ZSAzMSAwMCAwMCAwMQ0K
PiAwMCAwMA0KPiAuLi4uLm1vcmUgYW5kIG1vcmVzLi4uLg0KPiBbMTg4NjcuMzY5MTE4XSBzY3Np
IGhvc3QwOiB1YXNfZWhfZGV2aWNlX3Jlc2V0X2hhbmRsZXIgc3RhcnQgWzE4ODY3LjQ1Mzc5Nl0g
dXNiDQo+IDItMy4yOiByZXNldCBTdXBlclNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDQgdXNpbmcg
eGhjaV9oY2QNCj4gYW5kIHRoZSBnYWRnZXQgc2lkZSBpcyBrZWVwIHJlc2V0dGluZyBjb25maWdm
cyBhbmQgcHJpbnRpbmcgd2FpdF9mb3JfY29tcGxldGlvbg0KPiB0aW1lb3V0IChzaW5jZSBkd2Mz
IGhhdmUgKQ0KPiANCj4gSSBhbSBub3Qgc3VyZSB3aGV0aGVyIHRoaXMgaXMgZHVlIHRvIHRoZSBz
dHJlYW0gZXhjZXB0aW9uIG9mIGR3YzMgb3Igc29tZQ0KPiBsb2dpY2FsIGluIGZfdGNtIGFuZCB0
YXJnZXQuDQoNClRoZSBlcnJvciBpcyAtNzEuIFRoaXMgaXMgdHJhbnNhY3Rpb24gZXJyb3IgKGNv
dWxkIGJlIGEgQ1JDIGVycm9yKS4gSXQNCmNvdWxkIGJlIGR1ZSB0byB0aGUgaG9zdCwgZGV2aWNl
IGhhcmR3YXJlLCBlbGVjdHJpY2FsIGludGVyZmVyZW5jZSwgb3INCmV2ZW4gdGhlIGNhYmxlLiBO
byBsb2dpY2FsIGlzc3VlIGZyb20gc29mdHdhcmUuDQoNCj4gDQo+IEkgb25seSB3YW50IHRvIGtu
b3cgdGhlIHN0YXVzIG9mIHRoZSBqb2IsIG5vIGludGVuZCB0byBhc2sgZm9yIGhlbHAgb24gdGhl
DQo+IGRldGFpbGVkIGlzc3Vlcy4NCj4gDQo+IEkgYW0gbmV3IHRvIGtlcm5lbCBjb21tdW5pdHks
IGRpZG4ndCBlbWFpbGVkIHRvIHRoZSB0aHJlYWQgSSB3b3JyaWVkIHRoYXQgaXQncw0KPiBubyBs
b25nZXIgdmFsaWQuIA0KPiBNYXliZSBJIGNhbiBoZWxwIHdpdGggaXQgc29tZWhvdy4NCj4gDQo+
IElmIHlvdSBmZWVsIGJvdGhlcmVkLCBwbGVhc2UgZmVlbCBmcmVlIHRvIGlnbm9yZSBtZS4gVGhh
bmsgeW91IHZlcnkgbXVjaCENCj4gDQo+IFlvdXJzIHNpbmNlcmVseSwNCj4gSC4gQWtlbWkNCg0K
UGVyaGFwcyBJIGNhbiB0cnkgdG8gc2VuZCBhIG5ldyBhbmQgcmV2aXNlZCBzZXJpZXMgd2hlbiB0
aGUgbmV4dCBrZXJuZWwNCnJlbGVhc2UgY29tZSBvdXQuIFlvdSdyZSBub3QgdGhlIG9ubHkgb25l
IHdobyBwaW5nJ2VkIG1lIG9uIHRoaXMuDQpIb3BlZnVsbHkgeW91IGNhbiBhZGQgeW91ciBUZXN0
ZWQtYnkgdGFnIGJ5IHRoZW4uIEl0IHdvdWxkIGhlbHAgZ2V0IHRoZQ0Kc2VyaWVzIG1lcmdlZC4N
Cg0KQlIsDQpUaGluaA==

