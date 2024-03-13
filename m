Return-Path: <linux-usb+bounces-7926-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBF787A4DC
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 10:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13FC21F22B34
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 09:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C85E1D6A5;
	Wed, 13 Mar 2024 09:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="oBvhQVO5";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NKyqScYC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="l3tfCHf9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689E9225DC
	for <linux-usb@vger.kernel.org>; Wed, 13 Mar 2024 09:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710321702; cv=fail; b=nClNYF7bbQXMAX8IstYOM8iU9R0FL2kZi4B2HFhYVpEDX6PRYeEfXvbI9HXwUi3V0BVo1Od/gDTInbmvmYZsJVC5cthboX39pTEzfq1/OzlCg0oJn5fLWKf8Oh8huQ1dLXkHVWzrj2SinPbXtRaihOXDSNis6cbnvP1Fyp5S7b4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710321702; c=relaxed/simple;
	bh=YMO3a1QhvABtES2C8KN10tAq3kC+msrhreYM2UmkCfM=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hHNaVaUH5V6o32w+LYZifa7xUAWf8V0DoBUIlA4kmR3/z3psg1qHrbnrQOgbpvhnDSDvJNNcpdbi+o6g25mMWcRL5suqeVjMBNOo0gAVfiitAjhM8QlkpSptGCE65i6p2q8uhOem3k78CqIg61rntqUzLKJZB1fuQe2mrqPdlec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=oBvhQVO5; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NKyqScYC; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=l3tfCHf9 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42D8KYfc030566;
	Wed, 13 Mar 2024 02:21:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=pfptdkimsnps; bh=VicO
	gNkG6Asof9Yb0j1Apbyl9LmLB78cKc4rqM2j2w4=; b=oBvhQVO5J7NzwY14yHv1
	DdZdzMuYvsIG48i/rmDF2rrrbv6wogcq6sNjiueIt3QVe+pH3oURi8CKGDRuNSPr
	bB+wRNMeK4psszPsfUeGf0gdR13jaaaHpxBdsnGi7WV7gAg6dTw1WvsMA5M0W9g8
	J6Qfaz+hDoMYplKwxMSx462X//IFTV0jOaGlwgf/CoV7uAmF9I6brb7v1xAhoNLj
	NsjLuB0XYw5xoGF9gSXIgtyRuM/3gZSj96qcXQ3ZD0zMviMZ+VOivxDdBON1R84p
	iFZqTx55J9LR0rV1oa/eLI9WXbD4P9jwSmX4GWm7gn5+D75y03aSAdyaa3/adv2/
	Yg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3wtugxuj3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 02:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1710321696; bh=YMO3a1QhvABtES2C8KN10tAq3kC+msrhreYM2UmkCfM=;
	h=From:To:CC:Subject:Date:From;
	b=NKyqScYCiExkURvIm20PhRUFyo2JIWEbzTmqUYhUxu4fYhvLZGeDX5sIcSnBRmntd
	 7WdJwHYIynfbKTnsUGqlqAhIllcyDAl66TkocW0xl9gqvh128klcUDUVNbccc5xfuu
	 JWBM6lM8DEKA6DNDJwFQeek5jr+RT6RhYWqk/sXWnmzJZd8yKLt111kJx/M0Be7AVY
	 fcEmAPIunv/JE8nXN/gIVXPmsnvWwFxyN4cV3ZqV9PV9wZZ+4E3gtVMTD/VlQLDcdl
	 1KMXtY0ZpIu129uB8DA+ghmgA2lvF3SqTB/s30PQRirEy8X5LcJdrob5hOMesST4hO
	 Wkn6IIgdvql/g==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E0B144035C;
	Wed, 13 Mar 2024 09:21:35 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 5644AA00A8;
	Wed, 13 Mar 2024 09:21:35 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=l3tfCHf9;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 297FB401CB;
	Wed, 13 Mar 2024 09:21:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5bx5CXyt65zffRQOmAbz1+9r8rIr3j6kQTs2c4O9VDAu5R/T/BIYfu4RllrJFafzseBGzFUk2NEJFwiKl7SjcaPzf0P/41+bXsCvlmPNX/ArlQh1/I/q6f+5+IP/QcnkxEKxf+QEXKiE9yqH0SFLoyGKs2+6TZ0fNXtkbtlgToeyQsqTvNcCjdGr0nmTF576Pyp29hmzuxp1ptSqa2Y925x9Tt/yNJnYuNju0oDSeuCDEu3F8TZSiErx+pSm/TKTD0bqJvj/QoJTkZScaG4iH/udcbgRdT/nz6pwL7G8XSLnb3qwicFe4N8aqPHlHF5Dpid1fOo/0b+XaMUKIXknQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VicOgNkG6Asof9Yb0j1Apbyl9LmLB78cKc4rqM2j2w4=;
 b=exiDxhbcBCM6FvuwrZjTapSf50oxd05f8siaTOfcu38N+y49q3sea89pDmdOHZF2ypnar35VEUGA8af3xBxMF+kZ3nXXfDi2soMBdENkg52ttdwvUyQP22ooHUUXdAkT1U0A1eulXHPdGEm5maSHRvOeNMjFUOcXxI/xJNuFeu69PDbsbuXsAK9WsAeLFr/N00VOeK2WGbBgxzf9FXmgwxoc+TU3p6uFWc7FOWc7xeQ2Lh3EJ0gVUXJANg56MhqruPTEPQkbSeLEV3bBC2pXMdWC7YFv42legz/BdMK7G35pLMjtapJ5RDNdkGr8IfS9MetdZNcVH+ECibrc1UqEmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VicOgNkG6Asof9Yb0j1Apbyl9LmLB78cKc4rqM2j2w4=;
 b=l3tfCHf9lyct/pZ0deVHRuO9lNPuNtLAo+1oiCsvH1wXG6VJB5lvxNO7kbk4DRdTsRj2F0wS6LwsHie394MQNj0rdPqNrGAVbELki2rGVe3BSkl4vH76FlVd0NyEkqJMm07zbCwh4QU9Rl931jWIJPnT4H2YJB6UapRza8K5Kxs=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by SN7PR12MB6910.namprd12.prod.outlook.com (2603:10b6:806:262::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Wed, 13 Mar
 2024 09:21:32 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b%6]) with mapi id 15.20.7362.036; Wed, 13 Mar 2024
 09:21:32 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Dom Cobley <popcornmix@gmail.com>,
        Gregory Herrero <gregory.herrero@intel.com>
CC: John Youn <John.Youn@synopsys.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH] usb: dwc2: host: Fix ISOC flow in DDMA mode
Thread-Topic: [PATCH] usb: dwc2: host: Fix ISOC flow in DDMA mode
Thread-Index: AQHadSfW4gZAomuTkkitS2//KRArgA==
Date: Wed, 13 Mar 2024 09:21:32 +0000
Message-ID: 
 <a8b1e1711cc6cabfb45d92ede12e35445c66f06c.1708944698.git.Minas.Harutyunyan@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|SN7PR12MB6910:EE_
x-ms-office365-filtering-correlation-id: 56e3fb56-f4a0-4cbb-3377-08dc433ef91c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hD8Bn8ovXbEli6bJZBFPNzV2NI+T7e9ZSzAXgf0vypJ/GY7ORDIRHlyecjyfeJt3f32q6gprIs6dAYmQaWKGMTV+TdH6chRo9VOasx+h35BKU1orxRF5Swa6GvXsTHhFrgzWz9ozHcFEXou4UIJOHlfNrfze6Aa0y5RSxHxISICrolWUn5qUlvvb5FLH1YNrC82Q20xEZZZ2uPpNKHuoYYi7F5KHgjxEbb67juTKBJEaFpKn/k0emMcFzjK+JVE9Mrbgpbc/xfinr0XVgIrIY8xOHm+9gjHPa2IOlxczwqNk4Ny65CtW27SHKVynX0zpV/E32b1BVkyNsUkqxbXImV8J7hv7izdLvIzE314qg4AvW07T+W5wfXtyLSOMI/G0ky6diAOuaSYcgLPrYE/3ltAGnf5giZU8njaxWV/rtMVIn09dNyXYyBbbw0Pmyc60rYl8H3fBuTTRb7weBLLbvnEFIxvx1JXZEyEVpvhr36qcXkhQM7w9sYQJsIMrSXt6enHiObrappelbZ0eitjvi2Qa9+/uwoW0HRywMv4dW5HSx6VXiJgga3NeStcTq6oiJ/O2L8es9Hs2ry+iTkJ4qnvuiIKFFfbD5OCUqGsErfV2+uKnrLHtv/xlCb5q9BTIsW9KWZOxJzpX1cPc6MZ+HPSRYQT2GihTSJpCjGELvNXl0MLpVIXYrFXtDaEfTDM0ZHsHnDoAQDtHu10XS+ERoM9mAsfBw5RyRWpw+pEetBo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?maVwMD1gPtckvb8ykT8CGkD8E7Q2j9VHpjfE+oawwo48WHFKotZ3K2i3Cp?=
 =?iso-8859-1?Q?ngz1rkK4aqAX6ltSlitDv1SQjOnSaSCtJ4igMYGpD7dPUmX+vX9tv3+B/0?=
 =?iso-8859-1?Q?Nf0pIoqx+52Fy3vlb6tUOR4qf8TdzpL8ggkIdu9+HM8JIKPLuzLGO+qkSj?=
 =?iso-8859-1?Q?Bnzr6qfJ89WLK4T1ZH/VpbwP6U4eOhnI+tysHwpi/AoXxwCnc6iCzSjtlF?=
 =?iso-8859-1?Q?bPYfCcc1DBdI8ZqzmQtDVVtRpfxy3ZRF3BYwtbCyFrWF59CRaI1bX9fg6R?=
 =?iso-8859-1?Q?hg5frOxtYQWhIyUElh1f68uq7GWWQ7Z9W4OuhZHL7mAX4rO/ZhJ17PNNWZ?=
 =?iso-8859-1?Q?XFsaLlB+ZeeeQGEnID9Ut97cCpY1kYHZrNVcu5TKB3gLo8OZHeajzVHmgz?=
 =?iso-8859-1?Q?hYLOuRV24tsmO/O4zwfnaK97ICE6vaqNWpFQB/fU18BhKu9He5nJpfBDUU?=
 =?iso-8859-1?Q?M2m7NWhxVDFJNpFa9DbAAKSi2PSwvbbpK1ACIqVqk47w0sAOtRH5ZnNv5H?=
 =?iso-8859-1?Q?ePFRVoESOJWLGxAYxuoUfhxed+7AF63xr+aRajO4gsU3F8mhp1M5EUkqPq?=
 =?iso-8859-1?Q?VO+9lx0v3cxA0TL/P/6wyGkZ5ulWuOY8tMAym+PVJeez4Wy+iMQHIE3B32?=
 =?iso-8859-1?Q?ytiHhT1QwGaaPzqfjoKEZXbwj4dMpatpsfezKaGWfXHqDI/Jmg1ydtWmH7?=
 =?iso-8859-1?Q?2oy91FVkMqyUY1ivTRdV673vEGu50r/pCBEatpEMISvukpkxF5U8JCKG0e?=
 =?iso-8859-1?Q?+JzZhjHG/H9Gqf1SoT1qsLzy7Med3yVNDbOFcWbvgBs+ZqKy1Gvz0IGCbT?=
 =?iso-8859-1?Q?pyDHbF31qsxc/R+mSRygqdUSeYLPanFgay9st/aFBZXAoEFpczRE0NwFPb?=
 =?iso-8859-1?Q?5+GvPSgy79lA48GuCSSg9Hk+ptqeS5+slV7LEAf8FxYzGkp3/AeoGUf0Ma?=
 =?iso-8859-1?Q?j5kJgz1wGYHHpD/CVnZp8cIrJ09FlSxKsjIx9eQFENHVKmBIJ+MDRCWgFM?=
 =?iso-8859-1?Q?iNkIDZthr7JBTtb93G/UW3xgHSB6e/rgyHvY5wTCd3g/Ms+EEIPBvn+DOx?=
 =?iso-8859-1?Q?YXhwko4NyQzbFCf6W9nsd1sxXC/QholKbeIKOfNH5UZb2X+yKZ9pRA5C9b?=
 =?iso-8859-1?Q?pnbxnAN2KNZBfnsSo6/7ttFVcwI2IcYA2BiBpYNyxoFMd6Px0xXvyKm/86?=
 =?iso-8859-1?Q?G5uDqGglYsgnrbUt73tigNvmoiV6+S+/pBa3uPpNXE1F0uUrx/RTUtSzmD?=
 =?iso-8859-1?Q?uicb1EHWWotMNsYUVZE05V6ADStNjHpuVyzuj68+Kby0avEmVuwLuLvGXv?=
 =?iso-8859-1?Q?6fjXhqBujWxoAkrVjpJF2x3TGc34ISzIVKxr8p+6IlBx4Bv94tWNYFqndI?=
 =?iso-8859-1?Q?Y6kR/VOkP9WVWMIPTMZT6RlJ2BKPEPFypwvG99XczVTf9fIzgHkbrAretv?=
 =?iso-8859-1?Q?b2kCrrWBPJhdMbQ2bVcSUeateIs3hO9QDnC5PovGnH6k7569bdkcwPQf2r?=
 =?iso-8859-1?Q?GWJAldCU6VtuqGivf5JyOEPYtUH5APyArfIXnqyzSFG+QxipV7J0yk5mdG?=
 =?iso-8859-1?Q?MdbTDT4vDpPiOYXb8WJj1qob17+CARX+y02wYAD/bbqfqmm4Fc2kOnerEm?=
 =?iso-8859-1?Q?JSdDSZa9e62fcEV+jAr8tXrbqtQCaWluK5KrfGqWdoOGPVZ0Bv+DCn6A?=
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
	YGWrNdUR2x9MhtrIqtiNgBYbEO6xh05FrCCtZVLMVeGN9pVwWOFKsIYRCn/dd9q0eZAkO6wtf82wRGZR8jqHZgXNqqsQrEj9Z2bANr3+LvVsv/1R+kIudaSysRlOvP83js4mu56kOXiLsz8uJCh2YVP5wRJcaNR4sy9RJ4GVG1swV23JhOZL4SdqBUQWqQfouireokWyndqKPjSBLkHYuFRN5K6zdPtmnuFCWgeYnNCZR+2sgh+/SPSV5QhNUhm2xYN5B6ZDTvkHTtxXFvh6TmU8vsT7iY0l+u24qak7Fum8iN2kdutCTsVQA5ptpgRm3YfBGxWkxaPr8y3c7JDsS3j+CRK4MnqumCggNoskUqjvoXRwO41tIGDPt5rM6NOkNd2Rj7i8SH/fRUU8N8/GaMHCqgMXxYyqPD2aswo1QaTilEjdVMMqKTjnJ3C0yHx4KBjoGJ1nRHm5EWIbiyM/LgBkU5ycuU+8E+nY17nrQZLwOU0DCkyitoTAfrb0dPCU0olvq6lu/vBoMWb/5t2+A0qNmiA8B50QNl4+EoqvgK2mHzvh+jyvS/A+5t9/8MIOfBqT606zY9hJaTn0vvkO/TEv8Eb0o1BBBhqfloOiqQosSl1PCqXNlrkFW0vgcqnNHxC6M4UcMacapEZwXAFtRw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e3fb56-f4a0-4cbb-3377-08dc433ef91c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 09:21:32.5759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dzjdlY7XdjFtGjc+mfb51ZIluktA5qH4QRPGtXFOV4+iYK29Ua8WNpnZEcqbPkbOV0IwSWDjNGs3DLHB600PIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6910
X-Proofpoint-GUID: dBlLD_Af0szKGReo0DUd3aBWnsA9XSJp
X-Proofpoint-ORIG-GUID: dBlLD_Af0szKGReo0DUd3aBWnsA9XSJp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_07,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 clxscore=1011 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2403130068

Fixed ISOC completion flow in DDMA mode. Added isoc
descriptor actual length value and update urb's start_frame
value.
Fixed initialization of ISOC DMA descriptors flow.

Fixes: 56f5b1cff22a ("staging: Core files for the DWC2 driver")
Fixes: 20f2eb9c4cf8 ("staging: dwc2: add microframe scheduler from downstre=
am Pi kernel")
Fixes: c17b337c1ea4 ("usb: dwc2: host: program descriptor for next frame")
Fixes: dc4c76e7b22c ("staging: HCD descriptor DMA support for the DWC2 driv=
er")
Fixes: 762d3a1a9cd7 ("usb: dwc2: host: process all completed urbs")
CC: stable@vger.kernel.org
Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
 drivers/usb/dwc2/hcd.c      | 12 ++++++++++--
 drivers/usb/dwc2/hcd_ddma.c | 17 +++++++++++------
 drivers/usb/dwc2/hw.h       |  2 +-
 3 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index 35c7a4df8e71..c467f1a41e62 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -2701,8 +2701,11 @@ enum dwc2_transaction_type dwc2_hcd_select_transacti=
ons(
 			hsotg->available_host_channels--;
 		}
 		qh =3D list_entry(qh_ptr, struct dwc2_qh, qh_list_entry);
-		if (dwc2_assign_and_init_hc(hsotg, qh))
+		if (dwc2_assign_and_init_hc(hsotg, qh)) {
+			if (hsotg->params.uframe_sched)
+				hsotg->available_host_channels++;
 			break;
+		}
=20
 		/*
 		 * Move the QH from the periodic ready schedule to the
@@ -2735,8 +2738,11 @@ enum dwc2_transaction_type dwc2_hcd_select_transacti=
ons(
 			hsotg->available_host_channels--;
 		}
=20
-		if (dwc2_assign_and_init_hc(hsotg, qh))
+		if (dwc2_assign_and_init_hc(hsotg, qh)) {
+			if (hsotg->params.uframe_sched)
+				hsotg->available_host_channels++;
 			break;
+		}
=20
 		/*
 		 * Move the QH from the non-periodic inactive schedule to the
@@ -4143,6 +4149,8 @@ void dwc2_host_complete(struct dwc2_hsotg *hsotg, str=
uct dwc2_qtd *qtd,
 			 urb->actual_length);
=20
 	if (usb_pipetype(urb->pipe) =3D=3D PIPE_ISOCHRONOUS) {
+		if (!hsotg->params.dma_desc_enable)
+			urb->start_frame =3D qtd->qh->start_active_frame;
 		urb->error_count =3D dwc2_hcd_urb_get_error_count(qtd->urb);
 		for (i =3D 0; i < urb->number_of_packets; ++i) {
 			urb->iso_frame_desc[i].actual_length =3D
diff --git a/drivers/usb/dwc2/hcd_ddma.c b/drivers/usb/dwc2/hcd_ddma.c
index 6b4d825e97a2..79582b102c7e 100644
--- a/drivers/usb/dwc2/hcd_ddma.c
+++ b/drivers/usb/dwc2/hcd_ddma.c
@@ -559,7 +559,7 @@ static void dwc2_init_isoc_dma_desc(struct dwc2_hsotg *=
hsotg,
 	idx =3D qh->td_last;
 	inc =3D qh->host_interval;
 	hsotg->frame_number =3D dwc2_hcd_get_frame_number(hsotg);
-	cur_idx =3D dwc2_frame_list_idx(hsotg->frame_number);
+	cur_idx =3D idx;
 	next_idx =3D dwc2_desclist_idx_inc(qh->td_last, inc, qh->dev_speed);
=20
 	/*
@@ -866,6 +866,8 @@ static int dwc2_cmpl_host_isoc_dma_desc(struct dwc2_hso=
tg *hsotg,
 {
 	struct dwc2_dma_desc *dma_desc;
 	struct dwc2_hcd_iso_packet_desc *frame_desc;
+	u16 frame_desc_idx;
+	struct urb *usb_urb =3D qtd->urb->priv;
 	u16 remain =3D 0;
 	int rc =3D 0;
=20
@@ -878,8 +880,11 @@ static int dwc2_cmpl_host_isoc_dma_desc(struct dwc2_hs=
otg *hsotg,
 				DMA_FROM_DEVICE);
=20
 	dma_desc =3D &qh->desc_list[idx];
+	frame_desc_idx =3D (idx - qtd->isoc_td_first) & (usb_urb->number_of_packe=
ts - 1);
=20
-	frame_desc =3D &qtd->urb->iso_descs[qtd->isoc_frame_index_last];
+	frame_desc =3D &qtd->urb->iso_descs[frame_desc_idx];
+	if (idx =3D=3D qtd->isoc_td_first)
+		usb_urb->start_frame =3D dwc2_hcd_get_frame_number(hsotg);
 	dma_desc->buf =3D (u32)(qtd->urb->dma + frame_desc->offset);
 	if (chan->ep_is_in)
 		remain =3D (dma_desc->status & HOST_DMA_ISOC_NBYTES_MASK) >>
@@ -900,7 +905,7 @@ static int dwc2_cmpl_host_isoc_dma_desc(struct dwc2_hso=
tg *hsotg,
 		frame_desc->status =3D 0;
 	}
=20
-	if (++qtd->isoc_frame_index =3D=3D qtd->urb->packet_count) {
+	if (++qtd->isoc_frame_index =3D=3D usb_urb->number_of_packets) {
 		/*
 		 * urb->status is not used for isoc transfers here. The
 		 * individual frame_desc status are used instead.
@@ -1005,11 +1010,11 @@ static void dwc2_complete_isoc_xfer_ddma(struct dwc=
2_hsotg *hsotg,
 				return;
 			idx =3D dwc2_desclist_idx_inc(idx, qh->host_interval,
 						    chan->speed);
-			if (!rc)
+			if (rc =3D=3D 0)
 				continue;
=20
-			if (rc =3D=3D DWC2_CMPL_DONE)
-				break;
+			if (rc =3D=3D DWC2_CMPL_DONE || rc =3D=3D DWC2_CMPL_STOP)
+				goto stop_scan;
=20
 			/* rc =3D=3D DWC2_CMPL_STOP */
=20
diff --git a/drivers/usb/dwc2/hw.h b/drivers/usb/dwc2/hw.h
index 13abdd5f6752..12f8c7f86dc9 100644
--- a/drivers/usb/dwc2/hw.h
+++ b/drivers/usb/dwc2/hw.h
@@ -698,7 +698,7 @@
 #define TXSTS_QTOP_TOKEN_MASK		(0x3 << 25)
 #define TXSTS_QTOP_TOKEN_SHIFT		25
 #define TXSTS_QTOP_TERMINATE		BIT(24)
-#define TXSTS_QSPCAVAIL_MASK		(0xff << 16)
+#define TXSTS_QSPCAVAIL_MASK		(0x7f << 16)
 #define TXSTS_QSPCAVAIL_SHIFT		16
 #define TXSTS_FSPCAVAIL_MASK		(0xffff << 0)
 #define TXSTS_FSPCAVAIL_SHIFT		0

base-commit: 539f317ea7321225be4508975fa6dfbe2281cff9
--=20
2.41.0

