Return-Path: <linux-usb+bounces-7928-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED4487A4E4
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 10:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 525511C21BFB
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 09:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623AD21109;
	Wed, 13 Mar 2024 09:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="h+8UCKpa";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ltPa/55+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dpKgg4Wl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346F1225AA
	for <linux-usb@vger.kernel.org>; Wed, 13 Mar 2024 09:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710321741; cv=fail; b=l/6uArsrcvd9eFm11d+etY17bcfwoR5Xt0vhWtkEtLBLuy69fmSN4d7W25lzuxrwThrLAFlAlQjOrCoDWfDvz4kRgZo9XrRFWmCRH+TZzTNJwngTIYxXqHy6gqIzST3A4qmjuPcvBONGyCi8hyV3MGdXxnpo/YiNnMurI6OGlfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710321741; c=relaxed/simple;
	bh=1ExuMoysePTq+3Hcf6a5MVVO9Gdz6cNdGF5LXr7Pw5o=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=I9t3uv5QkM5PvDw4lK/XZ9atDUO4tYuzKoAdcBlkmhcQDc61lH+zTtjl8Qi9bIhVVXeVsK+JdsyztRgVD5HPctxPnQPrLZWzYdLLHaR3cCwxrFoU9iUU4qEEwnRd60ZoukHvsgRMR287EKrVS1xvrxAZbxamAYRJ6vwxuTrXUyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=h+8UCKpa; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ltPa/55+; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dpKgg4Wl reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42D8Kc79020319;
	Wed, 13 Mar 2024 02:22:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=pfptdkimsnps; bh=rFdU
	V4HH/j3SOwmnsalxe81YlgyolBMnxZXEKEgvmJE=; b=h+8UCKpaFVuMo8GqUhEK
	AtZ+R8lCrSe3ZAzaH3mty+nRRnCv1ZX5T3aBsXtSLEp7AUEq5fetrr3JB4W7D+Dt
	zKjP+9CtFDMkCiCT9kRSOU9XOV/VVvcr12X08g6HlTzhwIVh0KxvulQlAcNUOS/L
	1tIEEAYDE2LAsGKPXH316/YBQw1oDsISNJZdm5wCArbEsNfPsdfxwLK8Evmx/CWt
	4fwn9bCWQbEBje33LZJMTfs++1Xq2NbazWtEKmDCjYbZ9B6J/mSXsTo2xH3Ju53J
	OozaS4owZPuwG6XkRJWHNMAKsHxVnXl0jHKVIHleAKEe2EaZdQHC9d8Gn+Leb20o
	EQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3wtugwkgp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 02:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1710321736; bh=1ExuMoysePTq+3Hcf6a5MVVO9Gdz6cNdGF5LXr7Pw5o=;
	h=From:To:CC:Subject:Date:From;
	b=ltPa/55+MPfUhyiA9FlxHHf/qkq5QY9UY1CHLYMZK0rin+EMtTOqxCqZ//5Jd6+3r
	 KCfDfm1BnxL+oFAuburVqz1+UvOIx4ssijb3B4HuEujEyZ2GKYuVgicO9OVOVjUyCp
	 uTIu8kTzrHxKunKBDqdqkQZ/6nDDli40O0w5/+aWODLaTdgPgSh1d9USvtBW93KXxR
	 VGWW9TMqKWK0bnyJczI7VfDSILxtNP8WCmfS9vThAkWngDZ6YqntCyp0OuWQv6aXog
	 Z7NQP6XMFIygretRHyjh/KZhpeVBSgZnUt8TE+zS7LMkosvHRg1AILdn976CiPwXSQ
	 +Jvnttem9F/AA==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 52CC64035C;
	Wed, 13 Mar 2024 09:22:16 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 283A4A005F;
	Wed, 13 Mar 2024 09:22:16 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=dpKgg4Wl;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id EC96340364;
	Wed, 13 Mar 2024 09:22:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SnytmgIusBZ2KXT8Dq8pqCCxdbjf87Q5uEEHLyXIlTZIxhWCNuv1kJGDwnpAl7gStu0Tt6Fs1PtVuwAJLZOwTm2oFStbxJPtgv7ce2Wkxy9hwzuOb4SdH/EvrzAToWPOOBxv2zRTkfROdzKwzRx0hdq0lHxwRxzCKQXB6iAv26W4/zdRl//6iA61z0JmwMHIwbQG1vTG1BBjCqm3NBPVXqG2gdMShfeRCZclN5qdRjiPK/Rb6nD4VEA5h8clGzv/YZ42Gvr8jp0zkadFro9g8uvBTcwmt6MhfuGI8bw1fvuzvgQhVqAS1oxiOHsRLEjxfifuA6IunwwI1SztEzTN/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFdUV4HH/j3SOwmnsalxe81YlgyolBMnxZXEKEgvmJE=;
 b=Bv08fmSGfc9A7rTTOQMeeSuuE6NFGhzTAIXMopWRXCRZvoYE+ayeHNFJE2pHvdGW1rUhcwA67wgTPw73CP5fPQU/j8NEcROaoa+QVVzE4dNxIVnKwfX1GB3qd+SZnyS6FehSzPC7BpkazgrHcBptNS6ytTfJFEAIbdEuuONJf3xYkegxWYyWjjHRBI6nfCe04F0SQxa4Q7gObZTbq+VSyAjgl6iXI2/OmZWcQE4PkFJD3XktETwUHG5pZQQec84h6WzuSyLrjpXRziGJSjEMCgacf2jHdHcBr8y59Rv3r0OyZL9NduUp1BRYQlW1WOs3qnD/krhijD9Z+LDm++Bf2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFdUV4HH/j3SOwmnsalxe81YlgyolBMnxZXEKEgvmJE=;
 b=dpKgg4WloJKCfk9P7jrlhzwZOQrsyeKcDaVb+YDQplZNZCK/h71UTBMjbCofaQRmPPhCLXGCvWYZkX/pwxXCTmH5hI8GOAnfft6rK2HdPm+DUVuToMFArG4GZ6r6IcOaYpEB+ugfpC/isrJQWlM6DCZ3rJxzzm+/70j0PzUP3gs=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by SN7PR12MB6910.namprd12.prod.outlook.com (2603:10b6:806:262::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Wed, 13 Mar
 2024 09:22:13 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b%6]) with mapi id 15.20.7362.036; Wed, 13 Mar 2024
 09:22:13 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: John Youn <John.Youn@synopsys.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: [PATCH] usb: dwc2: gadget: LPM flow fix
Thread-Topic: [PATCH] usb: dwc2: gadget: LPM flow fix
Thread-Index: AQHadSfuJ7GuXUX1ik+WlnQqCuawAw==
Date: Wed, 13 Mar 2024 09:22:13 +0000
Message-ID: 
 <b4d9de5382375dddbf7ef6049d9a82066ad87d5d.1710166393.git.Minas.Harutyunyan@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|SN7PR12MB6910:EE_
x-ms-office365-filtering-correlation-id: f15f7b1b-955e-46df-8a57-08dc433f1149
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 H3A3rA9MQxPrm19qI7Jl5WyfXRx6bruR3AgqCyEwtIiuHk/2FZPW9mXYfle98spLMXV3iRTJYzdVCjkmIdyoQin0N7HVlJs52kpNZzVqwAdG6wqzmPvyX14zncT2ZlIl9NhTTNLIG6KBryp/0znx/UeyS7BdEJPjTs+pg6SXCJAo+c7md6gyI4mU2s/TzoZtI/RdD66Zi4PJBsq6PQINzRHL9CWW7Z/dHZM8uqVjl5JK96U8QWFPndDf3VMqvl6sA2g35Suu5Fn3hrMEc4G4ziHwQlqtRmB4Xvi3Z42T71s2chO0lJAOanq2fqRB/F0yijUgWsWpi4N2CCT/1zPQxvlkZ+ayKRKKC8SuBcIQ9/x+aEhRRd4xGCWTqU2LHhT8rxXC3o1FSYgjki54uWZaZyzy01s2LsRivrS4PHJReu1qCmXt/BBMfRfeyvp84Wmlu+rnd+MffVbijPIItaLeGZzynfnI/7slYYss9h1y7OYbKRHrRfz63DSQD/gisXj+U2Ie1nKSJeLPzT72kk6nIryeDmGPBIbE4ylH59OpLTFbS4nEDaRFL3AY3a+VOFvvpHFr0etN/+kaP2mosndJNuT/iVgvN3XxRBeolQiz/1XgGonvr56WfMOCRjb9TKd4v6O7Z14YxT0G8hAN9rBWMabqbmUV/SIEnQzs6O9MxNpD99VCsEb9gMdUnbahax50sNPLMtPfCZw5Z3wc8twAlgX13UzMlWkqtwo84nNJL3I=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?+35ntVPpKIlA+2PtqCKyEqzWVY4aGUBotb+K4rwEjSS8a5y9Umuj8t1SLP?=
 =?iso-8859-1?Q?1JiUklCP+p5h0/T7EifcF/+S1rKkaDFzCeFNMGJxfGm0WIIb588uHBbX2A?=
 =?iso-8859-1?Q?Iw+xm3WRnxNx5lt7plXpeCvO780S+65zB6MrSuMk2/4KHF1Tf0DwpSWy2F?=
 =?iso-8859-1?Q?iSl889m/4TyzurnqsNcVcvU4gaUVvq3821jjbwPLndscInRs/J+CszRORY?=
 =?iso-8859-1?Q?kgY9g/pHWMhoIv3YQhoF6i8oCTKCpFSv3Fd/D/v5o1GH9CLtsS9sbyMHoh?=
 =?iso-8859-1?Q?5lPQsRoZ4EtxKiu3D0v+Ptt7utvcUcp3fpTz/Tc2sDkQC1sdxJo0gVAZK9?=
 =?iso-8859-1?Q?I4I4sOn7j/VoUS8jiiafNYwHNSixV4g3X6NsaKbn/wSJZivAeeMkafptsS?=
 =?iso-8859-1?Q?teEjFysldubIW+Jr3fsSSLHgwhuRL+5AeoDO2JGt2Rd0r0wXlb0IslIWA4?=
 =?iso-8859-1?Q?7wUX9ruRHKaPo2mc1YY43lik6J1piPFqZ/e6Wd4lGmLsWYLDqWuajTEd7S?=
 =?iso-8859-1?Q?BjLYVo06QaUHG7aoEnng7xxEGCw5+lD1N6p6X5MP6pMnnLOYuLDlYx8umI?=
 =?iso-8859-1?Q?9le3HUQmRicM0pqoTKJxB4Zojsy3PE6gtXq9wuTOJnEYv8adbuOP6bKKsC?=
 =?iso-8859-1?Q?XTFuGLgcMTkvlv3/yeQuCD2mZU7idne91mp7SSSV3DGk9b14w+lNWFUiSD?=
 =?iso-8859-1?Q?lkhzseD2XME9D5uoUDhJBVfIzP0Sf5iPfb+NWGsZSd9PasSvM26pckAc+a?=
 =?iso-8859-1?Q?R9t7KnuV9dVA5CSfqVCaHjNYvcPocZ9VMWHNukg9YFPL3/plwIcCvGTAG/?=
 =?iso-8859-1?Q?b6iTRWiEpnuzxuLhxl4kCQqED2zcoLxusbkZIwJ4ZR229Ki6zl19Yk2rac?=
 =?iso-8859-1?Q?/pKmotnZSnQQ1a4lLvKuKMRC5WkX61tr6JuSIpJhtRpewRzOQN9EnJBhbd?=
 =?iso-8859-1?Q?FKZDos985dS+0ZrGCn6WpXCxB3IW54XUSYfrsiKyvARKIbFjTPe7sm/6Vs?=
 =?iso-8859-1?Q?R4cdnQ47mhfzEdzJ6eZIYmWIM3znOkUNIChlcKsfjBEKxxOF5CERZ7HeNu?=
 =?iso-8859-1?Q?arZVjnwFr7+WBYRV3dJumTpKkqxBx88qcTksc14Ayiuwn2SPxNy35Qmjpm?=
 =?iso-8859-1?Q?mzJ3NhFph3GgeNG/lJ4KEN5t9Jff26a2D/n5ZZci4UPL01J5EGM6GQiluO?=
 =?iso-8859-1?Q?EzbE7R/yz6noGobD2OzvrVbtbvMoRHqzadOiI3/Otji8Q6fVZ0ojqIDGFz?=
 =?iso-8859-1?Q?Pg1xz75wjJm++f0QbCZta7k31vRITlslsxQ9c/LJZ8EktfmlWXwxhX70af?=
 =?iso-8859-1?Q?D9cv5Iz8U1Yb2a3p1oKm6gQRoZpNCu1D65Vi+gxs8mExejqMU94bg9+S0E?=
 =?iso-8859-1?Q?7ZfEPmD8i0hLTS/7AhwebNftcF9LS1q+cxRmsVH3HHC40PBVpfv0CKmu76?=
 =?iso-8859-1?Q?a41QR6YS9jJyMTfWk0W6mAWjf8pmGLr57NXvyXcf31M56OIMo+Maw9Um4E?=
 =?iso-8859-1?Q?tRr/0VPkvOVDuJ43+8inHm3xyUGEMSQmB8p9g7j9oMsS1ddVHmNi/v42gA?=
 =?iso-8859-1?Q?Jbm/hXbwR2l+vKrmBzYUPODfghOg9zk0xLoG3V6BTf2iQFcJfifAwJK9Jk?=
 =?iso-8859-1?Q?n/jFqaNpwp8E8NgKl99NyJL2l/Tl3eRYW/388ve/UK1cb0vflDwSCHFA?=
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
	wLXuhvL3EzRpS7cdo3Keh7oQmfxttB8khcYgtIhg59CYpC+cW8cMw18IDOPlt+8q1oZynpIiLJLNekVMEvJzBQ5fUiq4K/xKIW0NZ9zaPPKf1/K1i2GxNs60NPGXpDuYr+UcUC6Q/nM4zJgP/a9GUcHljlQ2VWte6GgeaAKV4Y/E/nssSNPqZTKjwjVyVoqF2KD8eECY0D7zHutcjs+mDHjDxWM/gvVoYpZzh+IBQeMPBUlMyqnzic+a0uRzBtCnNnT7VyGEwjF825DeUQ7VoUOeip3ufvGYBCaKKCS2jnfgYwT65SA5XYMxWAhZ9QXsACITNqslznQjW3XsB1yNQDRuqHDRufQzEgaeHMSgTTQcUa5BuRSuHAkfw6pvTn3v8+fKc43LSUr4w7Z6ojh0uxzrH3vxjXyb7+a4QHV9GjHnoOTe3mjj5Zns00JbZrzxzNXyrx3TfIDUc1KXlwbDAmO/2odxNDn6Mmi5fzZNWe5Wjj8bzY8tm836kbuOYisDU/ZBW5ulzCZhgG/uEu7jUpCoAHfBSd6mE24EcXZ44WCyqTK3PwKkxNCLPObV1+gx7pafDH/jK6lyOlQ+rt+NROWGt+iZYHqD2YKYnA7qtcHZ73cp4F0CdgJykBS/ZMwxQIIj5Xi2f4yiymczAdZEKg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f15f7b1b-955e-46df-8a57-08dc433f1149
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 09:22:13.1568
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q0nT6RlXgDiD9oWRn7negMMTaPugFg4CmTskT3+9aZwINxTSVCjcQml0d/D/9TrilK7kF7Au/cY5jpDs+Xahfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6910
X-Proofpoint-GUID: r308Sx1XBZMf1Ie09XtQcLf0te1DIuH6
X-Proofpoint-ORIG-GUID: r308Sx1XBZMf1Ie09XtQcLf0te1DIuH6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_07,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403130068

Added functionality to exit from L1 state by device initiation
using remote wakeup signaling, in case when function driver queuing
request while core in L1 state.

Fixes: 273d576c4d41 ("usb: dwc2: gadget: Add functionality to exit from LPM=
 L1 state")
Fixes: 88b02f2cb1e1 ("usb: dwc2: Add core state checking")
CC: stable@vger.kernel.org
Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
 drivers/usb/dwc2/core.h      |  1 +
 drivers/usb/dwc2/core_intr.c | 63 ++++++++++++++++++++++++------------
 drivers/usb/dwc2/gadget.c    |  4 +++
 3 files changed, 47 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index c92a1da46a01..747b69d390b2 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -1323,6 +1323,7 @@ int dwc2_backup_global_registers(struct dwc2_hsotg *h=
sotg);
 int dwc2_restore_global_registers(struct dwc2_hsotg *hsotg);
=20
 void dwc2_enable_acg(struct dwc2_hsotg *hsotg);
+void dwc2_wakeup_from_lpm_l1(struct dwc2_hsotg *hsotg, bool remotewakeup);
=20
 /* This function should be called on every hardware interrupt. */
 irqreturn_t dwc2_handle_common_intr(int irq, void *dev);
diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
index 158ede753854..6e67804eca6f 100644
--- a/drivers/usb/dwc2/core_intr.c
+++ b/drivers/usb/dwc2/core_intr.c
@@ -322,10 +322,11 @@ static void dwc2_handle_session_req_intr(struct dwc2_=
hsotg *hsotg)
  * @hsotg: Programming view of DWC_otg controller
  *
  */
-static void dwc2_wakeup_from_lpm_l1(struct dwc2_hsotg *hsotg)
+void dwc2_wakeup_from_lpm_l1(struct dwc2_hsotg *hsotg, bool remotewakeup)
 {
 	u32 glpmcfg;
-	u32 i =3D 0;
+	u32 pcgctl;
+	u32 dctl;
=20
 	if (hsotg->lx_state !=3D DWC2_L1) {
 		dev_err(hsotg->dev, "Core isn't in DWC2_L1 state\n");
@@ -334,37 +335,57 @@ static void dwc2_wakeup_from_lpm_l1(struct dwc2_hsotg=
 *hsotg)
=20
 	glpmcfg =3D dwc2_readl(hsotg, GLPMCFG);
 	if (dwc2_is_device_mode(hsotg)) {
-		dev_dbg(hsotg->dev, "Exit from L1 state\n");
+		dev_dbg(hsotg->dev, "Exit from L1 state, remotewakeup=3D%d\n", remotewak=
eup);
 		glpmcfg &=3D ~GLPMCFG_ENBLSLPM;
-		glpmcfg &=3D ~GLPMCFG_HIRD_THRES_EN;
+		glpmcfg &=3D ~GLPMCFG_HIRD_THRES_MASK;
 		dwc2_writel(hsotg, glpmcfg, GLPMCFG);
=20
-		do {
-			glpmcfg =3D dwc2_readl(hsotg, GLPMCFG);
+		pcgctl =3D dwc2_readl(hsotg, PCGCTL);
+		pcgctl &=3D ~PCGCTL_ENBL_SLEEP_GATING;
+		dwc2_writel(hsotg, pcgctl, PCGCTL);
=20
-			if (!(glpmcfg & (GLPMCFG_COREL1RES_MASK |
-					 GLPMCFG_L1RESUMEOK | GLPMCFG_SLPSTS)))
-				break;
+		glpmcfg =3D dwc2_readl(hsotg, GLPMCFG);
+		if (glpmcfg & GLPMCFG_ENBESL) {
+			glpmcfg |=3D GLPMCFG_RSTRSLPSTS;
+			dwc2_writel(hsotg, glpmcfg, GLPMCFG);
+		}
+
+		if (remotewakeup) {
+			if (dwc2_hsotg_wait_bit_set(hsotg, GLPMCFG, GLPMCFG_L1RESUMEOK, 1000)) =
{
+				dev_warn(hsotg->dev, "%s: timeout GLPMCFG_L1RESUMEOK\n", __func__);
+				goto fail;
+				return;
+			}
+
+			dctl =3D dwc2_readl(hsotg, DCTL);
+			dctl |=3D DCTL_RMTWKUPSIG;
+			dwc2_writel(hsotg, dctl, DCTL);
=20
-			udelay(1);
-		} while (++i < 200);
+			if (dwc2_hsotg_wait_bit_set(hsotg, GINTSTS, GINTSTS_WKUPINT, 1000)) {
+				dev_warn(hsotg->dev, "%s: timeout GINTSTS_WKUPINT\n", __func__);
+				goto fail;
+				return;
+			}
+		}
=20
-		if (i =3D=3D 200) {
-			dev_err(hsotg->dev, "Failed to exit L1 sleep state in 200us.\n");
+		glpmcfg =3D dwc2_readl(hsotg, GLPMCFG);
+		if (glpmcfg & GLPMCFG_COREL1RES_MASK || glpmcfg & GLPMCFG_SLPSTS ||
+		    glpmcfg & GLPMCFG_L1RESUMEOK) {
+			goto fail;
 			return;
 		}
-		dwc2_gadget_init_lpm(hsotg);
+
+		/* Inform gadget to exit from L1 */
+		call_gadget(hsotg, resume);
+		/* Change to L0 state */
+		hsotg->lx_state =3D DWC2_L0;
+		hsotg->bus_suspended =3D false;
+fail:		dwc2_gadget_init_lpm(hsotg);
 	} else {
 		/* TODO */
 		dev_err(hsotg->dev, "Host side LPM is not supported.\n");
 		return;
 	}
-
-	/* Change to L0 state */
-	hsotg->lx_state =3D DWC2_L0;
-
-	/* Inform gadget to exit from L1 */
-	call_gadget(hsotg, resume);
 }
=20
 /*
@@ -385,7 +406,7 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc=
2_hsotg *hsotg)
 	dev_dbg(hsotg->dev, "%s lxstate =3D %d\n", __func__, hsotg->lx_state);
=20
 	if (hsotg->lx_state =3D=3D DWC2_L1) {
-		dwc2_wakeup_from_lpm_l1(hsotg);
+		dwc2_wakeup_from_lpm_l1(hsotg, false);
 		return;
 	}
=20
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index b517a7216de2..38cd91bc29b4 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -1415,6 +1415,10 @@ static int dwc2_hsotg_ep_queue(struct usb_ep *ep, st=
ruct usb_request *req,
 		ep->name, req, req->length, req->buf, req->no_interrupt,
 		req->zero, req->short_not_ok);
=20
+	if (hs->lx_state =3D=3D DWC2_L1) {
+		dwc2_wakeup_from_lpm_l1(hs, true);
+	}
+
 	/* Prevent new request submission when controller is suspended */
 	if (hs->lx_state !=3D DWC2_L0) {
 		dev_dbg(hs->dev, "%s: submit request only in active state\n",

base-commit: 539f317ea7321225be4508975fa6dfbe2281cff9
--=20
2.41.0

