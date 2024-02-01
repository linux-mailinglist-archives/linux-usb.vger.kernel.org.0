Return-Path: <linux-usb+bounces-5718-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D29844F2D
	for <lists+linux-usb@lfdr.de>; Thu,  1 Feb 2024 03:27:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 345801C27ED0
	for <lists+linux-usb@lfdr.de>; Thu,  1 Feb 2024 02:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C036618C2A;
	Thu,  1 Feb 2024 02:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NgegRQVE";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KddJ/OYt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GButxk/y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642D9210F6
	for <linux-usb@vger.kernel.org>; Thu,  1 Feb 2024 02:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706754425; cv=fail; b=UUIIm7vncMxmUYq3A4ob/Rr1gHgfAa+GI2HJCIf+mjKPoLXNjwybYJWZ1L2wGGgyTpenekH7V70jbJXcY1mtuSDA2zmzJpt7DEgIndIoUvAuHYkTPciGHm0t1c96RmbkBOM9bRJ9uAJLP45R570cLmXT5sxsFdYUof0cQwEGou4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706754425; c=relaxed/simple;
	bh=brQJXEwrQQ6wTsUXMgFP7sDBwKRQJZ9PG8bmU76P0D4=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Davd1Aaz3ik2y2H/cni91Vs9BM54NZ7htPGnb3IpT1JUdQNYWP1nHsyk8CT1Jrit/CW+KKsHbHVMb1XRlutaFB7Wcmnc4MluLaKc6eL5y3bWKJ2iKmRcfV4+C2NbTBetPLUMcAKJndmdNW/+oSHxjs5l/+4k5Ofq2WYvZ9eMSkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NgegRQVE; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=KddJ/OYt; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=GButxk/y reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40VKLkDi005076;
	Wed, 31 Jan 2024 18:26:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=pfptdkimsnps; bh=dPKY
	Bhqtwu23DLindRPgpVLBxABmNezuN/QwIVJMreQ=; b=NgegRQVEfMcYQyklyKhT
	iBePEoWD5GeyIsKKCkuSMrRQXEsMKVHZBT+8yhb/xrBNJ8eYpaLvZPLGZFCG3mCC
	LJwfiZUT280Nx6S85Pkm+RcyvgDUrBGHqIWCrNjiRCKw/JcoyrRRwgdU5txeoFce
	E9uQHvZYq4IHC5Xekoj9kxmnQ3XF4YxBHhPZQKsfcExDm9E4/nhzqzpu2pJ29tVY
	mboPC8odPDfgY4k950Ar2HqGf/EscyTlZd4Q+5ubii9u4wGMDvh3kot0OV86m/7h
	FDFBYsCCzQN3CdTDm6/4nnLkFzxYt88IbmwRfp5Of4VvWtcg9bsx4j4HdOt9QThd
	JA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3vw1bgmubg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 18:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1706754418; bh=brQJXEwrQQ6wTsUXMgFP7sDBwKRQJZ9PG8bmU76P0D4=;
	h=From:To:CC:Subject:Date:From;
	b=KddJ/OYtfEE3UfLqbiRN6MBsy2mj3FUm8lXbf3/9zkiGCz02TJKctFA3XeGRH7Jsw
	 tCAA0ci+Gn3nEmsOcYa8xBxZYf7z+2pO4IzJYkN25u6II11QiZ6WF2qePwP40+xMCk
	 zHJ3AuOqg5ZcxVtshQT/oqsLBnMTrcfyEVFvPW7tUVbmHIu2rta/3ZJApv2ecZqUVM
	 JwSY+4knwlombzZy029DpUgMnIKtNu45V+zeSlG5fGyBXoLG98UW++dxTY0ac8yQYf
	 WnFz/A5ArjO2tw81IMJDlDzwZzW12fO6VutNeZuMLeZWZSzMI2iK21Z8wVcpXTRguW
	 68O/s09AIcWBA==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BCC8240528;
	Thu,  1 Feb 2024 02:26:57 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 5CE22A0072;
	Thu,  1 Feb 2024 02:26:57 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=GButxk/y;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0116F4035F;
	Thu,  1 Feb 2024 02:26:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/Ak/QU0chQqeQClklxh8yOvvIuCFUkq7SLkX82nM2Fv1TvFV+FPkWumehPF2ADQTRkDDOs9s5wZaLEGcd01pElJHydr7CCCn9bFW9DCPEAHhi6TXA715JSGIOzRRsypEZmm6EN0LYKCBz0snzklebXlaAmZ1vQSdXxW7AWIniiYiY5PDxZdtuQprgjC5VicSXa3xJMt+3GzyZTaE4pHRY9TTvH6c7YhuGaUmIJp+wdJ1vEFCnwjhPITqFnaE+uKI5VS6xTui3rIAbhb3Q5Ucm5zMbM6maXB0TI48wllcgaWj0GoZrTf7eiNJGubdb92wdCsMLnItsxjK5kaGc34NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPKYBhqtwu23DLindRPgpVLBxABmNezuN/QwIVJMreQ=;
 b=CCTL5fbU2oe7UwLfirzyRF/7XTzDpqIcUaE07N+72hTk+knOr6RTvzdvvExyL2cGje9pXJe+JGTymj2qRB//NmHPXk7dUs/fOHZkVMujt7k0JOAjxu6+i/zFuZmXwpRZJyyECvaPe4ciAaWITIWojiggFrJNmvQnRPgfbqCw/3s6jinVa4CGEPfrvlTe71SqA3VXpK/f1shkyPeJ76b/svxAYpFEuhoZ5DL71eyK1p/OLKcuzgGOfZ4VRZmJqc+FtQhZOqyC+aYU1lDhfuitksOO8vWU7E+RRZeWWSUx6TzJw8VabM63Gq4kiRtgGcvl83aMpj6UVE9+J7b9rPRqMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPKYBhqtwu23DLindRPgpVLBxABmNezuN/QwIVJMreQ=;
 b=GButxk/yAjUPDCIqP2QPm4BndKOuri9p1tXqtCEMBroxg7Ql1jY/LsBRGWcGp/JIBX2gwyoaq3+mT+HikPDgrdtdXa4bi9V+I7d6BjD81US4c/4zxgEskQiF9MPSoSDLaBBc5BP7CP7I5WlPewWnJuuP2bLjVZUyNhxBbPaQxs0=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH3PR12MB8185.namprd12.prod.outlook.com (2603:10b6:610:123::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.35; Thu, 1 Feb
 2024 02:26:53 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::a6b8:3d34:4250:8ae3]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::a6b8:3d34:4250:8ae3%3]) with mapi id 15.20.7270.009; Thu, 1 Feb 2024
 02:26:53 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC: John Youn <John.Youn@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [PATCH] usb: dwc3: gadget: Rewrite endpoint allocation flow
Thread-Topic: [PATCH] usb: dwc3: gadget: Rewrite endpoint allocation flow
Thread-Index: AQHaVLYedho+Ne8sA0Gx5m+CEKUM0A==
Date: Thu, 1 Feb 2024 02:26:53 +0000
Message-ID: 
 <c143583a5afb087deb8c3aa5eb227ee23515f272.1706754219.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH3PR12MB8185:EE_
x-ms-office365-filtering-correlation-id: eb4e477d-9e71-41a7-62a7-08dc22cd40dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 2Vi7Xsc1DY78e0qvu1xmuNuh5TcYZb/uacFA0JutFmqmCpuRyqLX8te0qyLSfLZxzcUic6DxAxcpgf4bkmhyTas97C+se6JCYzXFpxJCeBd69J1HGKm59dIvs0x4kSuIwk12+clxVNkn92xsEdH9RRtqUYNhSUNLyxynDO7ZtvW1qZFy+qO+lA3BpZZLBWxcRjEz5h4PCNVhm1yz8uww5GciwGzaUZac+yQmMbY8GBNzboWDsgRtq7Vy+dcNB0RI+XvNmTEFV8WMyN9gxfEE+LxMVMiBpH6KflqQ9F+8niVroUHoVndlAndrd7g6DDEaEpJx4UY5AKmcV91YJa8c7KnGEcySCflTZ4QgkGuMT2SnbSfIIkg7DIAa4F4yIZAHwXWCAnIsz7aOss3e3JbH9AtOIJYVMBP70ULSTpqIijxBg3azyMrGneCWxOKmSv9l51eGbjh4NJFWrHomKI7BGYu75e1TKWrdr1eGfzkYp9CxCvGOIf3EEqabFoQvZ6yfqfwnX608TwsGnpUeGog/7ALa89vXeTbGeBFQMgOc3oUAHrABKY/wnXMtLaMjQasS9zIz412dtmOkGK6gmpQXBXR5j0VvVdyd+AyfDW/eMCZ9ZL5Wptq5qpYp92fYoVnL
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(366004)(39860400002)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(8676002)(316002)(66446008)(66476007)(54906003)(64756008)(66556008)(66946007)(110136005)(76116006)(8936002)(4326008)(38070700009)(478600001)(86362001)(19627235002)(6486002)(5660300002)(2906002)(41300700001)(36756003)(83380400001)(26005)(2616005)(38100700002)(122000001)(71200400001)(6512007)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?T7Bl4eOqgJZ2In7mVtDy0eq7Xr7kL9xtDAAkZgEl4O5WSGK1XEOg+sEXPP?=
 =?iso-8859-1?Q?P25YPItsM7m0X3G10OyBECsSeExPga5gC2fxk9lIA/cIrPuzDadVay45ij?=
 =?iso-8859-1?Q?gz4a6cN3TcoiO6lu6Kb+AAr2Yj3fbUIOgBc6WXNeisv57d29c5Fs0ONKZh?=
 =?iso-8859-1?Q?W3OxErsMNEsG/0k3S1uorfKIQsslaeygQg3Tchm8NbkDEtfZKTvZRudQ2H?=
 =?iso-8859-1?Q?p/jw822/cWGvozaLopdCjY4ZtEBjmqA68nxKIaDofVJ81BYansyl2hVMO5?=
 =?iso-8859-1?Q?I2yapGahT7UN94jDqjM1vFk5/dqzhMpoE/jkwO00DjRaIsFyGallg5wYQR?=
 =?iso-8859-1?Q?FpPHyTslxNcQce/FYcv+hPq+IdDh8CMO7dij3PAprb6RJOBHq9gdvNQIjJ?=
 =?iso-8859-1?Q?O8N8lsmHtUI7thi39FANAp93niHWZ9i4CeQYidUnE6A0fHltID3knSMQq8?=
 =?iso-8859-1?Q?qWjpfch9fwadtfSkNBkqujsUigeqHD9GkjF1heS3Xvbmz0iGsLChcevc57?=
 =?iso-8859-1?Q?MLn5jJxg+hSS31GH7LTG2DlqW6vHyBoRuckR5wPVzLWwBD56ta2Tb7yTGN?=
 =?iso-8859-1?Q?jsra8JCDd8j8h9C7XitTB4gQNFK5YP2WYUeLdLHfGcuYOB3E8mUiD49yRc?=
 =?iso-8859-1?Q?qKsSHm0ApN+DyrKJMFibNRYyFxpsJA1+TRqb+jPcKFmo4vvoELT4wRrlHY?=
 =?iso-8859-1?Q?1nXibyTv6pqtlDVkvzDirO3bUjlJ5N1AkalkycWsbNk5t8sLxBSwfrp+6k?=
 =?iso-8859-1?Q?pKj4Oev9DLRlURY9Hv+cSBkKU6d90gVn0kE8ESlsio6g9AnC1QiZrDRcgo?=
 =?iso-8859-1?Q?DzWQPLXMnPNXSjJ5JXx5hx0T4Pyr8twO+dlOCYKsOdJKWbK/+YI2kXM+Qo?=
 =?iso-8859-1?Q?XebEGJ2rJiQtWtCcz3RT9pPKOUh0SE0+uOWbD/yJi5I7hv3AnXFsA7wCuq?=
 =?iso-8859-1?Q?+umf30PpCqhpot47iKY1oi1sjuqrp0d6OhlVshDS69jIP3sNWhdhPexp/K?=
 =?iso-8859-1?Q?z/O36Ho1B8v7SRNoXZSrKydyz0crjjR/CHameaT0kA0SnzG+9jNQlK/dOz?=
 =?iso-8859-1?Q?acEtARt+cde7tFnp8nP5z3sw+Cs1ri7fDMYt2O7gJeNYn/Qu7Y5ncrYFel?=
 =?iso-8859-1?Q?42lVmAg6zz3E0GkBUc2lybaaSSsquL1AiPgFXVh0tJeTKZphcl4Z1QQNKI?=
 =?iso-8859-1?Q?yuppQYmykNLNSQCFP3SG1/x6++qieT1CbwC4sd8DCAWRAAYobiY8VveXjI?=
 =?iso-8859-1?Q?0LtireXXDwWLcxzM1mMMSLf4OKk3llentHVUPifTHyO4+02ejRESX//Kmx?=
 =?iso-8859-1?Q?3IyIEifsPdyz6hPtgSmn4oxOUTYiJUyZLfDn1bFe0I7PNyO68bKqZz52Zy?=
 =?iso-8859-1?Q?6hEmKY3UIpJfO68dQCYwOKCRidqv1+acTWW7L7IrJZMd/4xu1ZC92AwiLP?=
 =?iso-8859-1?Q?TaavztevDR7ghXeP5R43kelCA+EEpD6su3aOlT3GPV5aLwWK3jJ+jiHhrU?=
 =?iso-8859-1?Q?eOr81++4Pmk3CTDcDlkNPO+FuorUNWjXzuVJZb8srbU8CzaJCapI5ND9cA?=
 =?iso-8859-1?Q?M3Tz1K9S0HdUx0VTUh8NjSLnYtRliTndWGPkn5v1lWqXPLqQ/GqUuNOgBK?=
 =?iso-8859-1?Q?yTPzUbNHJEFurQeR4ftIeqCS1NcnX3WTykjS4aiap0GE4tdXrXWNIFHg?=
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
	Oxc/YtqneG6RtL7IXdo/VKUi2q0k8psRMvyl+0sdzBBievTOXpBWHdHrm2/HGOZyGT8M1+CZbNL3c6JDzS0iao6FUq7WzOPFC4b4h/0L0MbHB5Gi7NjMLDvO1YGcBeEXgXQYtCwz3XiWVA48kyU/bX9/5srHzLw+0qrBTPBTO7RyOXj8MoefSRckbXckhlyxkS/9XqD0nGOfXhE8xC6mmAt0xUjulTTx2vIzmN/YsYoh18Dyy8OC+oi8d8tJff1iIZfMvFdUTLw0vSTb0BnXAMucDAYNzn57PPBqb3btz4E7b5qw5NsuoV+emh6DXbeTNl+Q6GN7gmhV0v+r++HemsttpOZqs17xoOoqh1QlwIWBxf/lSMgchW5MQ6h9ix39jUaBq8pZPRdGBvwCsjSOr3Ccf9C08y53HTCYyWkH7Qrp/DqONdaVicFus91KjwpdVPCAXSN79XjucqoJJoq/FVjbszbJXWDOfxFtJHQgXcE44AnawDrI+0ly6HEsgZJy9gdQu1v9y6PJ5Rv9/HirViNRti5WTwkSdMBxMMbHBI3W+13qh3urwfuvmr6xMJ37URFy3BytpbcQbefboAOKmvOx4WLc625vfyfIiUGEsc4n0GEvr3Yk34fCj6yXxP7QcSb3I1QYmz1IexS9Pnz1zg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4e477d-9e71-41a7-62a7-08dc22cd40dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2024 02:26:53.1301
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CP3C9bEPgAKZQ7IPMsRUMXMfZF2+YITFIEPVsqSWAgdUv9FB3kMNThODniciLReW7e2AXRjFWzT9CQujy3im9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8185
X-Proofpoint-GUID: B-XOOSf96ZtlfTxoFQOhVUb0mRL09DQY
X-Proofpoint-ORIG-GUID: B-XOOSf96ZtlfTxoFQOhVUb0mRL09DQY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401190000 definitions=main-2402010018

The driver dwc3 deviates from the programming guide in regard to
endpoint configuration. It does this command sequence:

DEPSTARTCFG -> DEPXFERCFG -> DEPCFG

Instead of the suggested flow:

DEPSTARTCFG -> DEPCFG -> DEPXFERCFG

The reasons for this deviation were as follow, quoted:

	1) The databook says to do %DWC3_DEPCMD_DEPSTARTCFG for every
	   %USB_REQ_SET_CONFIGURATION and %USB_REQ_SET_INTERFACE
	   (8.1.5). This is incorrect in the scenario of multiple
	   interfaces.

	2) The databook does not mention doing more
	   %DWC3_DEPCMD_DEPXFERCFG for new endpoint on alt setting
	   (8.1.6).

Regarding 1), DEPSTARTCFG resets the endpoints' resource and can be a
problem if used with SET_INTERFACE request of a multiple interface
configuration. But we can still satisfy the programming guide
requirement by assigning the endpoint resource as part of
usb_ep_enable(). We will only reset endpoint resources on controller
initialization and SET_CONFIGURATION request.

Regarding 2), the later versions of the programming guide were updated
to clarify this flow (see "Alternate Initialization on SetInterface
Request" of the programming guide). As long as the platform has enough
physical endpoints, we can assign resource to a new endpoint.

The order of the command sequence will not be a problem to most
platforms for the current implementation of the dwc3 driver. However,
this order is required in different scenarios (such as initialization
during controller's hibernation restore). Let's keep the flow consistent
and follow the programming guide.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/core.h   |  1 +
 drivers/usb/dwc3/ep0.c    |  1 +
 drivers/usb/dwc3/gadget.c | 89 +++++++++++++++++----------------------
 drivers/usb/dwc3/gadget.h |  1 +
 4 files changed, 41 insertions(+), 51 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index df544ec730d2..4e628a9a60a5 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -756,6 +756,7 @@ struct dwc3_ep {
 #define DWC3_EP_PENDING_CLEAR_STALL	BIT(11)
 #define DWC3_EP_TXFIFO_RESIZED		BIT(12)
 #define DWC3_EP_DELAY_STOP             BIT(13)
+#define DWC3_EP_RESOURCE_ALLOCATED	BIT(14)
=20
 	/* This last one is specific to EP0 */
 #define DWC3_EP0_DIR_IN			BIT(31)
diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
index 6ae8a36f21cf..72bb722da2f2 100644
--- a/drivers/usb/dwc3/ep0.c
+++ b/drivers/usb/dwc3/ep0.c
@@ -646,6 +646,7 @@ static int dwc3_ep0_set_config(struct dwc3 *dwc, struct=
 usb_ctrlrequest *ctrl)
 		return -EINVAL;
=20
 	case USB_STATE_ADDRESS:
+		dwc3_gadget_start_config(dwc, 2);
 		dwc3_gadget_clear_tx_fifos(dwc);
=20
 		ret =3D dwc3_ep0_delegate_req(dwc, ctrl);
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 019368f8e9c4..e9418e53a660 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -519,77 +519,56 @@ static void dwc3_free_trb_pool(struct dwc3_ep *dep)
 static int dwc3_gadget_set_xfer_resource(struct dwc3_ep *dep)
 {
 	struct dwc3_gadget_ep_cmd_params params;
+	int ret;
+
+	if (dep->flags & DWC3_EP_RESOURCE_ALLOCATED)
+		return 0;
=20
 	memset(&params, 0x00, sizeof(params));
=20
 	params.param0 =3D DWC3_DEPXFERCFG_NUM_XFER_RES(1);
=20
-	return dwc3_send_gadget_ep_cmd(dep, DWC3_DEPCMD_SETTRANSFRESOURCE,
+	ret =3D dwc3_send_gadget_ep_cmd(dep, DWC3_DEPCMD_SETTRANSFRESOURCE,
 			&params);
+	if (ret)
+		return ret;
+
+	dep->flags |=3D DWC3_EP_RESOURCE_ALLOCATED;
+	return 0;
 }
=20
 /**
- * dwc3_gadget_start_config - configure ep resources
- * @dep: endpoint that is being enabled
- *
- * Issue a %DWC3_DEPCMD_DEPSTARTCFG command to @dep. After the command's
- * completion, it will set Transfer Resource for all available endpoints.
- *
- * The assignment of transfer resources cannot perfectly follow the data b=
ook
- * due to the fact that the controller driver does not have all knowledge =
of the
- * configuration in advance. It is given this information piecemeal by the
- * composite gadget framework after every SET_CONFIGURATION and
- * SET_INTERFACE. Trying to follow the databook programming model in this
- * scenario can cause errors. For two reasons:
- *
- * 1) The databook says to do %DWC3_DEPCMD_DEPSTARTCFG for every
- * %USB_REQ_SET_CONFIGURATION and %USB_REQ_SET_INTERFACE (8.1.5). This is
- * incorrect in the scenario of multiple interfaces.
- *
- * 2) The databook does not mention doing more %DWC3_DEPCMD_DEPXFERCFG for=
 new
- * endpoint on alt setting (8.1.6).
- *
- * The following simplified method is used instead:
+ * dwc3_gadget_start_config - reset endpoint resources
+ * @dwc: pointer to the DWC3 context
+ * @resource_index: DEPSTARTCFG.XferRscIdx value (must be 0 or 2)
  *
- * All hardware endpoints can be assigned a transfer resource and this set=
ting
- * will stay persistent until either a core reset or hibernation. So whene=
ver we
- * do a %DWC3_DEPCMD_DEPSTARTCFG(0) we can go ahead and do
- * %DWC3_DEPCMD_DEPXFERCFG for every hardware endpoint as well. We are
- * guaranteed that there are as many transfer resources as endpoints.
+ * Set resource_index=3D0 to reset all endpoints' resources allocation. Do=
 this as
+ * part of the power-on/soft-reset initialization.
  *
- * This function is called for each endpoint when it is being enabled but =
is
- * triggered only when called for EP0-out, which always happens first, and=
 which
- * should only happen in one of the above conditions.
+ * Set resource_index=3D2 to reset only non-control endpoints' resources. =
Do this
+ * on receiving the SET_CONFIGURATION request or hibernation resume.
  */
-static int dwc3_gadget_start_config(struct dwc3_ep *dep)
+int dwc3_gadget_start_config(struct dwc3 *dwc, unsigned int resource_index=
)
 {
 	struct dwc3_gadget_ep_cmd_params params;
-	struct dwc3		*dwc;
 	u32			cmd;
 	int			i;
 	int			ret;
=20
-	if (dep->number)
-		return 0;
+	if (resource_index !=3D 0 && resource_index !=3D 2)
+		return -EINVAL;
=20
 	memset(&params, 0x00, sizeof(params));
 	cmd =3D DWC3_DEPCMD_DEPSTARTCFG;
-	dwc =3D dep->dwc;
+	cmd |=3D DWC3_DEPCMD_PARAM(resource_index);
=20
-	ret =3D dwc3_send_gadget_ep_cmd(dep, cmd, &params);
+	ret =3D dwc3_send_gadget_ep_cmd(dwc->eps[0], cmd, &params);
 	if (ret)
 		return ret;
=20
-	for (i =3D 0; i < DWC3_ENDPOINTS_NUM; i++) {
-		struct dwc3_ep *dep =3D dwc->eps[i];
-
-		if (!dep)
-			continue;
-
-		ret =3D dwc3_gadget_set_xfer_resource(dep);
-		if (ret)
-			return ret;
-	}
+	/* Reset resource allocation flags */
+	for (i =3D resource_index; i < dwc->num_eps && dwc->eps[i]; i++)
+		dwc->eps[i]->flags &=3D ~DWC3_EP_RESOURCE_ALLOCATED;
=20
 	return 0;
 }
@@ -890,16 +869,18 @@ static int __dwc3_gadget_ep_enable(struct dwc3_ep *de=
p, unsigned int action)
 		ret =3D dwc3_gadget_resize_tx_fifos(dep);
 		if (ret)
 			return ret;
-
-		ret =3D dwc3_gadget_start_config(dep);
-		if (ret)
-			return ret;
 	}
=20
 	ret =3D dwc3_gadget_set_ep_config(dep, action);
 	if (ret)
 		return ret;
=20
+	if (!(dep->flags & DWC3_EP_RESOURCE_ALLOCATED)) {
+		ret =3D dwc3_gadget_set_xfer_resource(dep);
+		if (ret)
+			return ret;
+	}
+
 	if (!(dep->flags & DWC3_EP_ENABLED)) {
 		struct dwc3_trb	*trb_st_hw;
 		struct dwc3_trb	*trb_link;
@@ -1053,7 +1034,7 @@ static int __dwc3_gadget_ep_disable(struct dwc3_ep *d=
ep)
=20
 	dep->stream_capable =3D false;
 	dep->type =3D 0;
-	mask =3D DWC3_EP_TXFIFO_RESIZED;
+	mask =3D DWC3_EP_TXFIFO_RESIZED | DWC3_EP_RESOURCE_ALLOCATED;
 	/*
 	 * dwc3_remove_requests() can exit early if DWC3 EP delayed stop is
 	 * set.  Do not clear DEP flags, so that the end transfer command will
@@ -2914,6 +2895,12 @@ static int __dwc3_gadget_start(struct dwc3 *dwc)
 	/* Start with SuperSpeed Default */
 	dwc3_gadget_ep0_desc.wMaxPacketSize =3D cpu_to_le16(512);
=20
+	ret =3D dwc3_gadget_start_config(dwc, 0);
+	if (ret) {
+		dev_err(dwc->dev, "failed to config endpoints\n");
+		return ret;
+	}
+
 	dep =3D dwc->eps[0];
 	dep->flags =3D 0;
 	ret =3D __dwc3_gadget_ep_enable(dep, DWC3_DEPCFG_ACTION_INIT);
diff --git a/drivers/usb/dwc3/gadget.h b/drivers/usb/dwc3/gadget.h
index fd7a4e94397e..6d91a3f22e38 100644
--- a/drivers/usb/dwc3/gadget.h
+++ b/drivers/usb/dwc3/gadget.h
@@ -121,6 +121,7 @@ int dwc3_gadget_ep0_queue(struct usb_ep *ep, struct usb=
_request *request,
 int __dwc3_gadget_ep_set_halt(struct dwc3_ep *dep, int value, int protocol=
);
 void dwc3_ep0_send_delayed_status(struct dwc3 *dwc);
 void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force, bool inter=
rupt);
+int dwc3_gadget_start_config(struct dwc3 *dwc, unsigned int resource_index=
);
=20
 /**
  * dwc3_gadget_ep_get_transfer_index - Gets transfer index from HW

base-commit: f1a27f081c1fa1eeebf38406e45f29636114470f
--=20
2.28.0

