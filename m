Return-Path: <linux-usb+bounces-7924-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F47D87A4D5
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 10:21:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30BAAB21FEB
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 09:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49009210E8;
	Wed, 13 Mar 2024 09:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XiMD1+bf";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="T/2FqGTE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="oXNoCGJn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E596225B2
	for <linux-usb@vger.kernel.org>; Wed, 13 Mar 2024 09:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710321683; cv=fail; b=DyglrxgXyvmz8rENErQQoGqS2WVFFURarZFoCkpDAbsGkiXa/ldXA+KRQFlIRDvUD58oA+RXDM7MYw8VQqKn2NeAamtVVCsQxpAuwmrapszTLvxi2VuH3Dd8gD9FDumeZgKrwlT0rChJ1YIRxVsgENvR4AZR8MPf9yC6sQtpuk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710321683; c=relaxed/simple;
	bh=RbdnixxA/B2Qsd1HiJ16EKAhsUdsg4/FHjaWFJFshHI=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=rxtnR0hiY2ul9fxWsUGOvfmgf4q4u9J/NDTq5R8V3WJJuVjkkTA0AZATdwfX/PlYum4EWKyFzx+o5uPOBbuCNXbEu1lXWGCahOSWai5rbv4/659a6MA6yt+RxIcqKEj/wnk/W7XRZUAmx/yEk+iSUmD15XpG0POBgL8upS/VUOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=XiMD1+bf; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=T/2FqGTE; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=oXNoCGJn reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42D8Kb69020236;
	Wed, 13 Mar 2024 02:21:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=pfptdkimsnps; bh=VwSo
	5JLfXuiMSdgFaaoUc9xN3BmZSYwCeW5ouA0AJAM=; b=XiMD1+bf3SVp42E4sQED
	57lhfC+NnvANSbgCWex3mX4r+M96a+1FA61ntOSldS5jVFYviJ8DsQ5rHDNd6Bzi
	ahX6HhIHr7WLDVznwRVqPdhsTqGPyGvKs28+Gx9HYsPODpxCiWhiUlfToMN05/cu
	DgRzmxCC3KdOKyuFCAe23R2NPAjNPWrTTQNLFNdGl1IztuK62x0ZiFa5moIJ6DhN
	PYm5CzX0cyA0hnwLEZngqthvdwW5Sm4Eo7OHu++0sRhO+AxHfpgIx5oQsqC0W3a3
	4W3EPlagHoNK4M+ORk5h1qqKjDUcm6say16r01xUE2jJs+AuSLi8QIjUmWPJHIYn
	wg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3wtugwkgg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 02:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1710321675; bh=RbdnixxA/B2Qsd1HiJ16EKAhsUdsg4/FHjaWFJFshHI=;
	h=From:To:CC:Subject:Date:From;
	b=T/2FqGTET0/SLSbu8LkEO9Ye1lK0kLXtXlfxdfFbHhpDwai+E0cPe52NIlhbwXxxP
	 TPEqVUemo938bs9zc3aaVQEqlNkBITF2j6Om9vnnTq0Pw30YOoqqNDc+nhcQt/ZZaF
	 pTyCsCBZvr9DqhcFAM5hRQVS01xBeS4srvxvna+czDTQIpcP+VCfTKVGJZR5fc2PoO
	 tCB0Secr4E7kIMVfgTtidS9/jg/86H8cqZvfdjv2MTtRvkZxL8JIBWWXzqL7MubNgX
	 huvO4tcAo8SfVwhNXkzHQKLWf6YhnkfbEfuci7L8CCjUd5GHSuGnLDKumPWFlZSvbZ
	 LdGhBCltRbs1Q==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8181D40349;
	Wed, 13 Mar 2024 09:21:15 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 34D22A0073;
	Wed, 13 Mar 2024 09:21:15 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=oXNoCGJn;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C395C4071E;
	Wed, 13 Mar 2024 09:21:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FrqDEtFPBq+lxNP08LbCI9tqccl6je1W/Kpqs4tz/rUQrMdtx60L3lWoIrVcYCF/WLuF3+n96sGDScwY8t8V3u/pKwNpFTiWVShVif3OVtumGpcFvgQJD+5dNY2UWznZWeRCZ/Vlfhr9st/5jvbb31fVFnCodjks8GtQlU1wzxPuYtmL9+xJXKDiK+MrD+pQdDlxvIt5YFgvZFNQ4KDtdtvCP3YdS1hb2pKJ0zsl8bJUszQlzishItfhxcOYcLGQ4gSFOJYUZoAcodC+Ynno9YxcZWXiQT7WQWmxn0fgkFjHjR2qb73q/SQwLPuVIQ8y8sGHLpdiiJeA0QuRZ8ITpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwSo5JLfXuiMSdgFaaoUc9xN3BmZSYwCeW5ouA0AJAM=;
 b=dBkISCn2GhIsMzu1AUzQ/plclvylcDouHNOUTGMH4ewJYsgjIrjh5PeitZE/kABgQTMKS4xVkEwXB0fw0OjuSjzwJasjqnqboJUfye3qXNaf3roEqBeiCgCzh9a9ze5caUNXZm6jKVgSRGbHzl5sJAVc7OdvFh6bJG1zR7ROumjgvpbxia6OUs/PTx2zCOwqmfQEQFpqfceGN1BUxEAbGopHAWPqGQXrnN342xPnDgkVDgF/SNPhsIPYJWDCrABFoN+lvGyBfAwS8kayshg1YiMtAoO4uN0kIVDLNCE29ovjN+1ijuf0VNPVEz8Lsp2MrCLxXUs2cNkDOw4NAeVyNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwSo5JLfXuiMSdgFaaoUc9xN3BmZSYwCeW5ouA0AJAM=;
 b=oXNoCGJnZ7biwphxzmLxtK+WHlPU7d/LJqrF1YpqvOwndLDpM865tqQYMarMcxKLsbaVzzPjKLJBH9aYk24sgGamw8/30rIFrYVprWd7PwFk4JlUoggbwFdE83TBb7rW1wdE3BTeylZ/+o0dwM/YH0ZZvPH0DF43Mb6d4CK5gmo=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by SN7PR12MB6910.namprd12.prod.outlook.com (2603:10b6:806:262::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Wed, 13 Mar
 2024 09:21:11 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b%6]) with mapi id 15.20.7362.036; Wed, 13 Mar 2024
 09:21:11 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Gregory Herrero <gregory.herrero@intel.com>,
        Douglas Anderson <dianders@chromium.org>
CC: John Youn <John.Youn@synopsys.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: [PATCH] usb: dwc2: host: Fix hibernation flow
Thread-Topic: [PATCH] usb: dwc2: host: Fix hibernation flow
Thread-Index: AQHadSfJAvHYzRBqG0Sbu6FcbES+7w==
Date: Wed, 13 Mar 2024 09:21:11 +0000
Message-ID: 
 <c2d10ee6098b9b009a8e94191e046004747d3bdd.1708945444.git.Minas.Harutyunyan@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|SN7PR12MB6910:EE_
x-ms-office365-filtering-correlation-id: 89318ffe-9e66-40cb-d7dd-08dc433eec4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 GmmVQKUdZ3I82UoxZJ9okfMl6LNC3YeA1SZYu7GVbe8v9ywl3CkvgcBjGf/xhq4G4ATxnfOwUOo8novq1xwCPFT+04gUratdzxw6hVjtmKHhvT8wm+RGisOcos6ngcRGRBcFcAXDbUty1cxIEcj+aMXrOkphUMaRrYoyQcJ88DDLB7+le+PrjdZutoXZ+uswiuVq5ScneNJNHg1KYc+SSlIIQ4TaTbYYqEZzY1jSyWVlm0C+dbTbacQkLRstQw2ZrAkeeZSegxYIt+YpEEYMmzSnt6Sq4fkkTror3UMxx+eB6l3OvaQV/wyFbA50bfhfYXWfXf5GPGK4E/HEyc05wrhq9V7CjzCKeIkmqWATYq3ZsuIIvzHBA2sqYJedlk1xBM5armuY9HceqRWlwrqyrcxVFQM4RgHXDNw2hwFGwLCidtuRGSh0hCLLAaSaUN5uj/NXO87Kw74PSoSqeKrWu4fxbSKx0jUB1u1dJIzbb+lLgEhxvo/s2XtJjUtPJ6ymSZjvD0BpP1Isuxb7g7nvwUwqOYSO5erACgMXsVNrD9rfEz9971TMQXNUOXtJFi2bx8IYYxdYknchqv8wfAvXOLGubhhSZNuY2ygeqryY7JKrGRk71WjsSe6jOKeKN8ldpCoi4tWvy6688OmMpuEs9sdFTRa59vzfhIvbxb/IBfamwWoe2PmhlHWii85IDuOdB6rJJ4uZiwe4yiKM9xYu2WapxdfI/pzpLB04zsBqrxA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?+m8NWf4AfRnTSodekyzUfngodWXMvjSSfE7TYHWKnc7WTzK5ZT7oKS/19/?=
 =?iso-8859-1?Q?GJOlsDt6iZ0cs99AC6ym7H7KetXLl/bmcly9lDAqXuL6lTxSfzRQ4H6Xv0?=
 =?iso-8859-1?Q?o7LfvpsT1zDsrN1OKwRrD3Hpv4OOFQ/CG6Tqv3F4QOehJcCuqVUXSEKu1A?=
 =?iso-8859-1?Q?pMCFFhdEUGL5jsUpnRwGI1tTuMK/dqbxn01BDWOQxpdOw2B4Y6H7+OD/CT?=
 =?iso-8859-1?Q?oss3ps37rUc4nOyvoiM3pmf1F5sra1RNirQZnqQKSJBFiiDxF258MGYMRf?=
 =?iso-8859-1?Q?/rWJRyV8jXEpvPy02S1t7ezn8Vj5i+lolWnIEyJU5I9fgG7aKrPG+CZVmW?=
 =?iso-8859-1?Q?9xdwmFfEIOk+mywGFuBQlD2SEjobJ/IpVL6RbAaEuDQtkSJ7YqStHBY5m9?=
 =?iso-8859-1?Q?ZpUja9mSkWgSOmmRADFFNdHY+p47gytjDUDb0PXsPpB5Mj1JleQY4mnZo4?=
 =?iso-8859-1?Q?UADPMebakF6471MYoRXHsKvE9MEwQLMc3xfKLvmau7Gp6hn4fqFUlGwSNM?=
 =?iso-8859-1?Q?zAFjtlIiDfU2RPUysrc/uTpGFnm/WHtw3v+b3dvd0eJc8SpRBQ24/sC/m4?=
 =?iso-8859-1?Q?3h0itTTeB2VZxW2crd/vnV7CQsY2e3w+hrLtKBTq+XMgipGk5vgZZJgdB7?=
 =?iso-8859-1?Q?HZo02D/tbgalS/+SKP8Dr86BTdo1EUUG+0kdOU01+scQqg8PeoZoxvqmoN?=
 =?iso-8859-1?Q?wnPoHu7qzRKawbSTgs1ogANg2tIotdv7kI/C2fMnOEjTJXw5OeK90RHJ3a?=
 =?iso-8859-1?Q?Ro0CPkLt8eOToks7S83zJ/y4Ci3VAMfIiswKnx4+nzY8LtmgkNR7IJ+RVY?=
 =?iso-8859-1?Q?LLKbiZP1+jZ0F6tED1GB549me3NLv3j5lYRRf+ACBJ2YhR7jc1vG1q+drV?=
 =?iso-8859-1?Q?IX29JiZIcFeA3VHf0y8yXtBHYp4UrU+UC8/Nf3A+SOps3Zi0P7yezd+Cw1?=
 =?iso-8859-1?Q?h5r+6bnVZ5BBVDjfUbE9y0anjUYWpY9XEZuEnLaJKmRqbT9QDSxARFQQxv?=
 =?iso-8859-1?Q?Y2dGB9HR4gEeJHcpFLcTuXH8JKKs6TNtjEXzc5HrH0DQzxAlzzJktNBfNW?=
 =?iso-8859-1?Q?9xBGwaFMy0gQsRTIGaZPsQDgCrzYBXDhCLer5AGGLBN3J7W4EbfcqWexyZ?=
 =?iso-8859-1?Q?9oermWcGF57wAzbbK1iDHgBjmpESdgPNp7Je+3L4X5KZqiar0lTUelwTdf?=
 =?iso-8859-1?Q?6RR45/pqS7WGgIn20l6emyh3ESBzMuJ/UagEd2QS8p2Zkh0HDjyoIrPtdz?=
 =?iso-8859-1?Q?Wn4XON+w4OgOJQeqBatviqnlXC9NH0b/8bCeH7QMtQ/wFB7kTklwh+cpfg?=
 =?iso-8859-1?Q?yP/8UlkZyAK6kMcNPs/Kd4GgT7LxWkGuMFT0nv1dbRhO9lNxlZVOsvPYvp?=
 =?iso-8859-1?Q?aCzANl8hoRpTn6CEsrHNMb0Ku0WkpUhcmTF4c9U3dQ+LlA7PxBbXLvR+tZ?=
 =?iso-8859-1?Q?yAtpjq6/VUcUYcz2VB4/BEcMLDOpaf3bWtt7V5j1J+PLxjGJX2v+BElFQk?=
 =?iso-8859-1?Q?a0lpqez7TPtXpAucdlrlEhalKAEkkz566r8ctDrPw27V/SnrimD9w/T+fQ?=
 =?iso-8859-1?Q?9a3ejqPrIoF/lhglMQ6wxfKPe8oEZT3MkAoguWExEZ9qLbaKus7tZuIfb7?=
 =?iso-8859-1?Q?DTLpoHWX/oj7AwZzq94KzYVFUVNlSNhaV1cHvzsbME7CY/LX5VBYEd8g?=
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
	GO+MWKU/CY4fjzWiNWT7q8e3drmdqUmDS937t4G5UE+E2RhV5FgmdOjO50k5o4FaUA4MLHbNPLaMtYBV5QHPe26k//GkbAs4hme84Woz4bNXVdj8MG8e2XfzB1k9TQUv4srd2EtbYye8CIT4R4KteOsYJ4+G7159wJ+OhTn7ZuDgRSNtHRyQoMHXxRVrjuxLRmRLw9y/chFt0KRg8cjBT0NmJh9lv0zbjp4VOs2xqBWLFA2WaVXbGKJq6FUULj7SJc+JUixqEir+w0xFskr9FyUIq6dgJWMKZAezToXGkKVSjp+TJs4/9Gps7q5AWXz7fYGCWiXjp4fAw5HHH+v7hazulheKUq4FpBlThTqagGHNEG6Xr97JuQqkC5IaBLqLKj55+/amIgFmJQbXSco1AebwkUSvtlxB1R+T9HXdRjmudfKHwmDUJHn8BivpE+ciGiit29xAyxxikE+qQKrGXNZg9jCKOorQMiJupx3gcQ4nZCoS95ExU3Mh3p++8yxYrp/QSXBjm7MmW/WnuedmVnnz4L4TMU156R/MHnVt3GVq/ewGmWnFrFZraOLbAHCjspShnxefqng2B/VEoupGFcJ3rLRw3O/Fbob4N/zL3uoHYn9ta6446XpH5CecAO6o8h/IDAoaG9AFk2eREU0onA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89318ffe-9e66-40cb-d7dd-08dc433eec4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 09:21:11.0979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CedVl0esX3IABhIkoaWeDYwCEi44vGjBV+lPsGymBu75v/3x/r3f2rN8Op7CZmY671R3XV1JMtn4zbUP+FEuQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6910
X-Proofpoint-GUID: CT7ZNdPlmDWNVlEzL06CmlKfQLgc347D
X-Proofpoint-ORIG-GUID: CT7ZNdPlmDWNVlEzL06CmlKfQLgc347D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_07,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 phishscore=0 suspectscore=0 mlxlogscore=740 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403130068

Added to backup/restore registers HFLBADDR, HCCHARi, HCSPLTi,
HCTSIZi, HCDMAi and HCDMABi.

Fixes: 58e52ff6a6c3 ("usb: dwc2: Move register save and restore functions")
Fixes: d17ee77b3044 ("usb: dwc2: add controller hibernation support")
CC: stable@vger.kernel.org
Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
 drivers/usb/dwc2/core.h | 12 ++++++++++++
 drivers/usb/dwc2/hcd.c  | 18 ++++++++++++++++--
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index c92a1da46a01..40f0af171bac 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -729,8 +729,14 @@ struct dwc2_dregs_backup {
  * struct dwc2_hregs_backup - Holds host registers state before
  * entering partial power down
  * @hcfg:		Backup of HCFG register
+ * @hflbaddr:		Backup of HFLBADDR register
  * @haintmsk:		Backup of HAINTMSK register
+ * @hcchar:		Backup of HCCHAR register
+ * @hcsplt:		Backup of HCSPLT register
  * @hcintmsk:		Backup of HCINTMSK register
+ * @hctsiz:		Backup of HCTSIZ register
+ * @hdma:		Backup of HCDMA register
+ * @hcdmab:		Backup of HCDMAB register
  * @hprt0:		Backup of HPTR0 register
  * @hfir:		Backup of HFIR register
  * @hptxfsiz:		Backup of HPTXFSIZ register
@@ -738,8 +744,14 @@ struct dwc2_dregs_backup {
  */
 struct dwc2_hregs_backup {
 	u32 hcfg;
+	u32 hflbaddr;
 	u32 haintmsk;
+	u32 hcchar[MAX_EPS_CHANNELS];
+	u32 hcsplt[MAX_EPS_CHANNELS];
 	u32 hcintmsk[MAX_EPS_CHANNELS];
+	u32 hctsiz[MAX_EPS_CHANNELS];
+	u32 hcidma[MAX_EPS_CHANNELS];
+	u32 hcidmab[MAX_EPS_CHANNELS];
 	u32 hprt0;
 	u32 hfir;
 	u32 hptxfsiz;
diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index 35c7a4df8e71..83d5b2548f59 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -5406,9 +5406,16 @@ int dwc2_backup_host_registers(struct dwc2_hsotg *hs=
otg)
 	/* Backup Host regs */
 	hr =3D &hsotg->hr_backup;
 	hr->hcfg =3D dwc2_readl(hsotg, HCFG);
+	hr->hflbaddr =3D dwc2_readl(hsotg, HFLBADDR);
 	hr->haintmsk =3D dwc2_readl(hsotg, HAINTMSK);
-	for (i =3D 0; i < hsotg->params.host_channels; ++i)
+	for (i =3D 0; i < hsotg->params.host_channels; ++i) {
+		hr->hcchar[i] =3D dwc2_readl(hsotg, HCCHAR(i));
+		hr->hcsplt[i] =3D dwc2_readl(hsotg, HCSPLT(i));
 		hr->hcintmsk[i] =3D dwc2_readl(hsotg, HCINTMSK(i));
+		hr->hctsiz[i] =3D dwc2_readl(hsotg, HCTSIZ(i));
+		hr->hcidma[i] =3D dwc2_readl(hsotg, HCDMA(i));
+		hr->hcidmab[i] =3D dwc2_readl(hsotg, HCDMAB(i));
+	}
=20
 	hr->hprt0 =3D dwc2_read_hprt0(hsotg);
 	hr->hfir =3D dwc2_readl(hsotg, HFIR);
@@ -5442,10 +5449,17 @@ int dwc2_restore_host_registers(struct dwc2_hsotg *=
hsotg)
 	hr->valid =3D false;
=20
 	dwc2_writel(hsotg, hr->hcfg, HCFG);
+	dwc2_writel(hsotg, hr->hflbaddr, HFLBADDR);
 	dwc2_writel(hsotg, hr->haintmsk, HAINTMSK);
=20
-	for (i =3D 0; i < hsotg->params.host_channels; ++i)
+	for (i =3D 0; i < hsotg->params.host_channels; ++i) {
+		dwc2_writel(hsotg, hr->hcchar[i], HCCHAR(i));
+		dwc2_writel(hsotg, hr->hcsplt[i], HCSPLT(i));
 		dwc2_writel(hsotg, hr->hcintmsk[i], HCINTMSK(i));
+		dwc2_writel(hsotg, hr->hctsiz[i], HCTSIZ(i));
+		dwc2_writel(hsotg, hr->hcidma[i], HCDMA(i));
+		dwc2_writel(hsotg, hr->hcidmab[i], HCDMAB(i));
+	}
=20
 	dwc2_writel(hsotg, hr->hprt0, HPRT0);
 	dwc2_writel(hsotg, hr->hfir, HFIR);

base-commit: 539f317ea7321225be4508975fa6dfbe2281cff9
--=20
2.41.0

