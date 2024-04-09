Return-Path: <linux-usb+bounces-9128-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BD789D93A
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 14:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 326BD1C21B3B
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 12:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43CAF12D746;
	Tue,  9 Apr 2024 12:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="twej0Sf5";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="eJuuqkqE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QoSwAw/h"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D82812AAC3
	for <linux-usb@vger.kernel.org>; Tue,  9 Apr 2024 12:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712665683; cv=fail; b=id7kKZaAME0YpqDI+7QFwZer6Y9hUF+KYmXORnFgwUK/5byvJ2eRJXbMHV4m4P08qF8PmhCU6UFUrOpl6+sBZft/bHgv9INPfSBVRXo2Xt04ZEKcJP8u0dKFcXjlNBetq2AAvhJrGT1mrNHjcZLTsPuFUq/dLCZc1jFMQqE/R2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712665683; c=relaxed/simple;
	bh=hm2MGgnYZcceNf2NW0sijGzuIuZclCObvw0ruh57Aas=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gVyf/A8upkz6ZcLNi9XiD0FQVgVsMFpSH5/Wz1FlCRDKw2q8NMeP2hV78tXU5mQEaBR85SqDE0VNlP7SPbtyuqgxSEPw9HmfyZjhPUO7wz7UC/1TbC6lVJtctMyikvEqenH6Z5WfxwCLqlAlC4OKH0iMfCbk2FwFTgUQsfyESAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=twej0Sf5; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=eJuuqkqE; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=QoSwAw/h reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 439CGDiI006396;
	Tue, 9 Apr 2024 05:28:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=pfptdkimsnps; bh=kfI0
	eJGuH3aPzareQtR/XeJ8RaYBWbkm3x4Qj7JbhkQ=; b=twej0Sf5JLQGviY0gu7i
	uodzxkY0y/FWgI0UFFcrYqj3vY7ZQO07EKnAj6SEyWBj0YCE89aFSeaW/ErnPpNT
	10iRfgbTiGy24PSUmy9ntEpwkwaLX9OD/He73dYn9shTr88pG6b2gu7crgjMHcIF
	SoxILNuMqn1EPrKWMYPpEjmaMATT87FeiwzgTG61P4iK/i2P2Lg2ym4JXdO5mSLf
	yvNiZ7HEqNF2Pkh1h8lWaHqf++Muu34GRp5NvdT4XeO3OBfoHcEV2zWKNEp67679
	z0ndiK+uNFiJUkilq/Vt1IyWUv0NzBqpnDsoBr4PFEabXXN21s0m/sdWT69kZmK/
	JA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3xb5ashcu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Apr 2024 05:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1712665678; bh=hm2MGgnYZcceNf2NW0sijGzuIuZclCObvw0ruh57Aas=;
	h=From:To:CC:Subject:Date:From;
	b=eJuuqkqE8OreZbdFwEII+YQ5ljDE94kTXANjMwQ0Kk0fD3XKV1sbXOpPLH2813IPf
	 MhtPWoQ6p1sSeggGNzHSiRjGpvsDHyHw0oFC4hlSF+YtGHXabusswJF3AJaL92q4h0
	 3wP4+MfaKes9EXwqI3uEn9W1XvuuBRTEk1LXP5rSukDFZR1b4RotdlPnXU64NGhjhc
	 2D+J3cXPU2ONygh90M5gn6fcuhBk0arX0UiLyQ0GPofERYCtAbGfsm+dhYAfffCy1Z
	 7JXeEWSwwXpoFW6VQVqMATgpyT1eMYj11kIwH61QvVbYlrf1yOqeqBElV3fK1HRnAL
	 JDVFJl55HD5yg==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6F1D140349;
	Tue,  9 Apr 2024 12:27:58 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 3568AA005E;
	Tue,  9 Apr 2024 12:27:58 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=QoSwAw/h;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C45DD40362;
	Tue,  9 Apr 2024 12:27:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UW0hCcSOpMVxD9tz9RBXvsiT6ipu19U2MPe8yGomgUAU+k7huxvBiTxX5QF/1oHRNBzHfxdtmFSp6lgU5B36hnSAR56mPB7EeIhGpbcNrsSYYzni8AQpfdh/DcOGbtGsQux4n5pbgd+S4ETw0XeG1vfDWV6PKI/3nq+dFh3ZdUJQVVzXZlIUQ7RDDnHxBV5edXTc6nfsZsJK4nzdnolnd408/U21uLIHwyChf4A3BhvanHrOVXhwngSlqrxJ8y4k5HWtHbEiMUTbvnguuBJ8zjgyd2QkqJe/nB6f0YhGE7GrUO9FvT9S2SNwg2ROe3x1bcm7UilRo3NQ6EBgU1aeqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfI0eJGuH3aPzareQtR/XeJ8RaYBWbkm3x4Qj7JbhkQ=;
 b=DdVh/6/oDWntz7HRgNHaZ7S+j4PP9OHAP+9oQ7KZqMhZ+RXiKCjCOsyW6A5UoyMzF7TKdIfT/IV+xh2U7pWOXFanEIy8hJVwLcIXgY0UdwT7NVjInzZGqSrVywiFZna/Jl6vOQEMxKOKMUTrlcH+kYake8GRm1NghLbl/g/WWB5vKs5tljX2CgWi6BVc1r00RGidm9FrngRTKJkRU5vlvhFTlJRJ84Ho+0EFJuwef1Az9SlKps8QZtrTMama6IZVZ3REHLBByjawVT5FBOhAMLiXuqgju6Pw2bvwV4WNAERex5cW1Gur1TIfP/g5MI/YEporr5SwXHDlsh6My/hSRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfI0eJGuH3aPzareQtR/XeJ8RaYBWbkm3x4Qj7JbhkQ=;
 b=QoSwAw/hA8mSrrByFU2iydfaqVCHEffTcSznSJhm6qifMLpwb5uNAeLp0oyAinfsr/Y8hxJoTeO1jImcy3tOvPtdWjYSOUKBnWLBq1DhkCPaC22/sHdFaBEbKSThCq0674VVtq7V5UV7YRr2bjTV3EynI/bySj9N5rFWedseusY=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by SJ2PR12MB7961.namprd12.prod.outlook.com (2603:10b6:a03:4c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 9 Apr
 2024 12:27:54 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b%6]) with mapi id 15.20.7409.042; Tue, 9 Apr 2024
 12:27:54 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: John Youn <John.Youn@synopsys.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH v2] usb: dwc2: host: Fix dereference issue in DDMA completion
 flow.
Thread-Topic: [PATCH v2] usb: dwc2: host: Fix dereference issue in DDMA
 completion flow.
Thread-Index: AQHainlYkmSTem2UdkCxYIWDijrueg==
Date: Tue, 9 Apr 2024 12:27:54 +0000
Message-ID: 
 <cc826d3ef53c934d8e6d98870f17f3cdc3d2755d.1712665387.git.Minas.Harutyunyan@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|SJ2PR12MB7961:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 uXLAoFRugRgkOrRCHpVOOrxFZvh0kSP75UM4s39YniUjKYv1vrxRYzxWHhU9xe7j9f+5bdxnLq5gQlhvBrZRf4xpEuEV+76KhF4LRhSStAcUXqSTYM9fr6DONsPMbipcolsBAD4PyyErp94RMGRwZ3lmMo/PqtPRJy0qODqAjlAhUAmDzFwr7dzn4lkI5mgPTYQjixNLNz9sfoh5IDz+o2j5naC3sKVui7SL27CATBXwNHGjgYF4wYijk9doR+NjPoisxeqSuLUe0i/DUqJU2ZwbRfyqTpdqlgf0Xi9oo+idPiWaMWn1v6vJUwYGL5aRLTINTl97wJlt5POVG10Vu08ou5CUyNlDUJdTDrH0BuccAkTD4CVOFR3k/juIvWknFZo+U6Ut/3M2/C3u812wYyHrmthfiizeJgRmNzpjM7rkswLD3Z7QhCqbVOQVvj6SwwysOmMytbQahIuXEwVaZNo4W3KNsfzp4nd6XHakFk90MO11RBImv080YvlsO9DipGlmpV7AYLGkhXZyKNkzV7k6Zf+65OKfS5Wps8huvYECfHU6d5TJAOsZtwo5XSqpZSAUaZzLLTgsH/ABUGNv5mfdx2iXAzZ2zBRFpp62Hrk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?oHtOMECwyedNe5rPoyRM25Ht8DNoyrm5sbhPtXmz+h34WpZbBVKoD7lTFp?=
 =?iso-8859-1?Q?B53rSnAl/ftYxYw20JVt518Kt+SEr6d93Y6/ejV/HMf9TtT9Tx4DJxAP3g?=
 =?iso-8859-1?Q?RZJLbFtVEIq2fQppueazJvQQH11H/oxnw5w31FSiQ0TxkWuw+LDmN/j5DT?=
 =?iso-8859-1?Q?2n0/FqT0XPbJv8Frx51WUOEbtD3LP7H3m8jeM3VyPGHvfgCZpnpTKohJ0S?=
 =?iso-8859-1?Q?Ms74emNSQwR5eFsfn2Blm5CmEWVk2pvWOSFXhtyDCAGOz01eGI/HNGUQ4h?=
 =?iso-8859-1?Q?BA4KB5Sf0PagcaNfyoN1YtyA3YuLyqQR3g5L8iB0Zl7GwGcnwdmAsvPYzh?=
 =?iso-8859-1?Q?Bfoj8cqdd5JTBEV4wBFzgD7XlnEZkabGK/k6u5V5OPmYanOtxaiycGo7LY?=
 =?iso-8859-1?Q?ufQPycfPi7pChU/20I1HuvD3pik58J5nTHfdfYerd360lETTlhjpyi3PQk?=
 =?iso-8859-1?Q?0Zqf4zA/1odS9P+rrpYpdxln0CXkGykMwjuJz9mmq6GxjBxsXLLPEIS7T6?=
 =?iso-8859-1?Q?HJ5ycBvnGRQJtvdVzKtkUhQaHGLjDz3Lx9oJu3b9lD8oWXX24co1Ck0eSE?=
 =?iso-8859-1?Q?KXCTWB9V7lpIasZ6LLLZcBgDmXE+shfWxY/uZtP77sjV6hM/H0DRwZZQIQ?=
 =?iso-8859-1?Q?CbRlL3UDfu4Ye9PaEYTXtgl9g/bLZimxqAAlnrISNFp12UhGg7Ik3HVr60?=
 =?iso-8859-1?Q?Bh9NHxukMyIZP5wZOE90LvwbsswLu2l2BT18qEwpkFcWA+WUY60R/3fVoh?=
 =?iso-8859-1?Q?jHWidT8N5I2lxqGVq/lwAPbbN7hi+iUQ12Z+gVOdgdGn8DrDIeoyRFYhOy?=
 =?iso-8859-1?Q?FQKm5rvqRBpFGc3DjvTMnKxzj/ZWIaO5lD3FboyUlhjnShEG10QtfzPNAi?=
 =?iso-8859-1?Q?hVUeh7oNjwsb0PlGIvMihFiQ/NPe+QvaLSnaICfDyhUUEJXSwGES98zFIA?=
 =?iso-8859-1?Q?mtGjLNJ+547R3UIVBKjBzCj3+aDOcn3x/N/SAeCF/T9bjSsOzCvjz8rmBn?=
 =?iso-8859-1?Q?RSytzcfEiUn1RGFfzcEKIr4snq5I+uBAR4ziyl7+zVYiRXWwMDirNN/YS4?=
 =?iso-8859-1?Q?azdv9/KMeFWWV0EetZYOcPquKK9Xbm5wgxgHj7dRkr81O7psJ/W9QRx7Iv?=
 =?iso-8859-1?Q?HFihv3dupyA99RNS/zhFO6dsNH2TTE8bGtwcVOu01BRFv7FcTckgrbJzKI?=
 =?iso-8859-1?Q?sinV9CnonZ5D8RzRHs0at2fXve7dW5QMyDOFC+ouJCpeqT6IAuA0F1836U?=
 =?iso-8859-1?Q?An/XDbmTrQv7gabk94MgC+uEWLMbU3E2XN2jOrcCk6ngjsy0dqYTO7AdBB?=
 =?iso-8859-1?Q?K6yCRBvoiRUonP74+OTlzDVT/+W/NchPBnu08CCuFfyL88FlSmLdDHzbJK?=
 =?iso-8859-1?Q?udYidX1lr1e/aKa3/3akHHziUBx4mxYV3Dv5hmqqZQ3TOvdz6vV0wk9/Kt?=
 =?iso-8859-1?Q?bbdQeFiIMtOYX1/Hyv2TgybyLBnBmoJL2LNF9sgz29b+/YRlw12pWhL439?=
 =?iso-8859-1?Q?j8vDP7KVSSN06mL9qR8Fjg0owUlgZBTyqjekK83TZWouGvsrQxyz+eETwJ?=
 =?iso-8859-1?Q?WNNuGAFYLfZQSHD9WFe+0DwcJDAPcHw90MWGlLqYtUqvUwvE5gUdn/0MEQ?=
 =?iso-8859-1?Q?aOwoRIJHyFAVE7g5qmH0qWypSkzZx6H5ge?=
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
	lT/grlmr0LGxzYXBfgjjF62onAa7DePJHwOhfVZpOgnriJ4NMNj5GtuRp0BcItQMwsb2f8dCNM1Unu2WRY7jwzrzX5ixoybgvpn8g5WKPcsZ2s1en6khmY4eEydDOyW7lQb6gEG7GDDaGS27T41mvQFAxvDJdKWd0wlgpo+CIXPixJZK1EyltXGoGtgo7Hnxd3e+DWf/g/7wIEtdCp9P3K6ABCbIl32ojRczDDUt1rq4U03z8s6i2wvU12eNhBJ1BuA4wD1n0rZ6MK48DsJxC45x6QYHBSpjjwcgpVhGwa1ZwE5SRimoWWGjzJ9XEpuqAsxeDQKPLY6CsG1I79cui3Q6xZS8MLZ+nwnz0uQKtuOIxdtPlLJtzYE+LafwxL9ljqcPXH0vQ4/aIgsdbJrFNZY8oaW592/zgYq9kT/Xd18SPretpK4ni26FBDRrVNjE+OlReijjO9qlZOe82M2mg0eWLeEXKtqQNfRayr1UY7SXSdwHH5u4ZFBkv9PgUpshLkiaODvj33sTpKaeNPCfWfR79eMjR4t2SHh0yTQyn6Tc/ii0tf3kwmOSfarOVQc5i1Nw8wMrIiLZSKDBzVRPJp4q+zJl94YeCA3VxFUIE7SSMIJ0nkfD1FquYqIE7MElu+jm0pAwZq+6+WI0iDCB1A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc96b72-af1a-4b5e-8e63-08dc58907afa
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2024 12:27:54.0964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 97qVqSALGoKN2xzKGCqqo5YAb0fPTV7MMF2dhxVvoAnhgn4YYcPPKWMV4G4powngDp59SxYkpsgmdkkbIsM+Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7961
X-Proofpoint-ORIG-GUID: j1A3HHY3SW3bhr6Nfsf60snfT148wRr5
X-Proofpoint-GUID: j1A3HHY3SW3bhr6Nfsf60snfT148wRr5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_08,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404090080

Fixed variable dereference issue in DDMA completion flow.

Fixes: b258e4268850 ("usb: dwc2: host: Fix ISOC flow in DDMA mode")
CC: stable@vger.kernel.org
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-usb/2024040834-ethically-rumble-701f@=
gregkh/T/#m4c4b83bef0ebb4b67fe2e0a7d6466cbb6f416e39
Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
 Changes in v2:
 - Added "Reported-by:" tag

 drivers/usb/dwc2/hcd_ddma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/hcd_ddma.c b/drivers/usb/dwc2/hcd_ddma.c
index 79582b102c7e..994a78ad084b 100644
--- a/drivers/usb/dwc2/hcd_ddma.c
+++ b/drivers/usb/dwc2/hcd_ddma.c
@@ -867,13 +867,15 @@ static int dwc2_cmpl_host_isoc_dma_desc(struct dwc2_h=
sotg *hsotg,
 	struct dwc2_dma_desc *dma_desc;
 	struct dwc2_hcd_iso_packet_desc *frame_desc;
 	u16 frame_desc_idx;
-	struct urb *usb_urb =3D qtd->urb->priv;
+	struct urb *usb_urb;
 	u16 remain =3D 0;
 	int rc =3D 0;
=20
 	if (!qtd->urb)
 		return -EINVAL;
=20
+	usb_urb =3D qtd->urb->priv;
+
 	dma_sync_single_for_cpu(hsotg->dev, qh->desc_list_dma + (idx *
 				sizeof(struct dwc2_dma_desc)),
 				sizeof(struct dwc2_dma_desc),

base-commit: d464dac47260a33add5a206fd3289ec1216e8435
--=20
2.41.0

