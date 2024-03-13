Return-Path: <linux-usb+bounces-7917-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF7E87A4C2
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 10:19:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C598A282E2D
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 09:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B6E31C68E;
	Wed, 13 Mar 2024 09:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="oZC9QcPe";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ir/iUdxF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="p+Ljam7o"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD531B967
	for <linux-usb@vger.kernel.org>; Wed, 13 Mar 2024 09:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710321552; cv=fail; b=M9cvbKh7T04aSVTzt5fC9Znp2fmCNClufUBHJAnOb4wBulZ6KDWbvV+83CdIBIblTuzSs1a3NEjIuBZXiRLogB5ktrEAyNMLtsir1we7rD86aGUj0DBP3f7Th4M5MeSsm+QXmqtm/Nm47ZuWlxS2E0IlOr4DxWnK9FJW0kPaDkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710321552; c=relaxed/simple;
	bh=qAqjNzBJsGPDSOASLY6X1azC3AgUJbH1zziiR9pdcMY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VdXEMjXtWcLiseXRnVKESuuYDBjYhlTZrvL8+zeIQ8mYPMCRG0N2wWI2/QC1fKp6V0hoaFpewMC3haYk+bEPcRBQbZUusOSwT9ZLWoFflFHgur3Ls2Oimmzw5lgpmkevhL9o07IQB7wL5l0fmEQaLe4ReQLaK9oI3SKVreSXYtw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=oZC9QcPe; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Ir/iUdxF; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=p+Ljam7o reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42D8Kb74020219;
	Wed, 13 Mar 2024 02:19:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	pfptdkimsnps; bh=GwtV1jwN9/3nr0BALljlDuYY7ApuJtau+y4TaE4gcH4=; b=
	oZC9QcPeoV68vOF+wUBxnNEvFJtykvAAWUaG8PF08IgtpWANNkHWtlXh//UlEMnO
	Fb3gv9G5TAOrlGXKJEZVbk/5lRI593XewVek94ZhBtlDBllCf8gwJpTXyYIEBVoR
	gfjPSO5jQHrShyhK2xRPEZuqwcZvBQnwLEK3jyQr9Tt4V3uNnGTn2J5wo0QTolYK
	gdGGWTsB8nv8cWbu7Y+F586ajDXmmhA0N0PhQAoHW+549IWEJpQ6HEXqnL0aGJ8Y
	1bxQZspT5FRIAJU+SXQddjWansxQsx9uwjLvaD3F9hJ08je/4NPzFfYy5AQIc7uS
	Nae48/le9VFBGK00LTcIlQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3wtugwkg2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 02:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1710321546; bh=qAqjNzBJsGPDSOASLY6X1azC3AgUJbH1zziiR9pdcMY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Ir/iUdxFXwAdG0kx2pxcRGClmIx2sSakgpsgmgzkZF0LMW/IIbFiPA5LBwuA/X5kb
	 gmLGN8V/w3sldoa5BpHLby+7rsxTJl/NBouFFd4oM8jh4qIqZft+f6YzInoQf08CR/
	 H9r1QOXetNKaVxC1y/qN4TGW5vM/RsMPZHubl565cB0P1Nw8nn689fAgxw6dVyMokG
	 Xs4N17BHIDh/Swz2T+aLwkBpom65h9vLmGh3CxeyMw20vD9FV3+vreAhV6WA70gOOc
	 XB2fizr6MXyEganzRq2O+5II2kOVCCPKXSuspXY40bQ6pl23tjlhKF34TK5vMQZ0yU
	 aJpxhuhn+lrzg==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 97F4A40453;
	Wed, 13 Mar 2024 09:19:06 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 691C3A006D;
	Wed, 13 Mar 2024 09:19:06 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=p+Ljam7o;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7EFEB4024D;
	Wed, 13 Mar 2024 09:19:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUwDm39YFvsgvcpPaEUtb3mz1PmcauXuFVnWKQkzxIjMmmcgOquWPBl7hZlgxuvlIvNEVX7F9dmf+m2u71UvOITvcWRiSgC5cIGZvbI3OWJfA32VXvTX00bI761RRTZu/0GN1DufREEq/DVACRypom6ubMYV/yHHNhkPN6bkDWhJpgCt+qtAo9SEHi1D79oTVLBLx08Av99cpW//5IZmvm1NA15OI3gZ0hCfXpuTJEJ/aerI03KN8NQa4++lFccxgQeTJ0fSiKh3GG1UK1ieXGdyjKNezxHUDuiYaRCZnUD9pDtO/ljyIdbKvsrtHLlmFWApAJuTnuh5WPA2BS3RsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwtV1jwN9/3nr0BALljlDuYY7ApuJtau+y4TaE4gcH4=;
 b=AcY4zoflNLpT5BZ9vu1AjnbH8GVSN+Xsy2VEnSl6RF9/HVoBI2BmZQTWQuyJEzMCshQFmDwWvaE+PSXAumWq1MDI5SihaqfOq9kIT0DD3SiH/XvASgXpwkQ5JQSGSyhtrPiXH5Ir2kUNz7tyJ9EYKoWLg3q9GiZ52GV9C6t1ENAmdjiC4jw415vfkVZT94Njd0cfOcURe8FcoApFhWucn9IjRGmxNk3FLHu7FAT+bNmRYxUeEGj2UQHStNIbDW74p9Y1bpTza8wzcLxzgCpsuR/mn/vVQ0eYvC3CA4J1ogEnuSZSNsPjtxBag4pQiV03qLcOjIE5+GOGxh/ML81YNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwtV1jwN9/3nr0BALljlDuYY7ApuJtau+y4TaE4gcH4=;
 b=p+Ljam7o8ef1aHwqiMHGgclFllxJrvKDAYO4dsEEiEu5YaQMHKemcTY/b1AcFUkWxxMq1pLsKGkrgJzIyPHVGZGHsQYb0IHyclFuQ1FQmqCiYg2e3ZkHcRWLlUwNcvYmFdE9uEgVJQFfSKY/c4BU7ZNZsqvf160NTIaOk/II+bE=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by SN7PR12MB6910.namprd12.prod.outlook.com (2603:10b6:806:262::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Wed, 13 Mar
 2024 09:19:02 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b%6]) with mapi id 15.20.7362.036; Wed, 13 Mar 2024
 09:19:02 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: John Youn <John.Youn@synopsys.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH 1/7] usb: dwc2: Add core new versions definition
Thread-Topic: [PATCH 1/7] usb: dwc2: Add core new versions definition
Thread-Index: AQHadSd95s8W6rzuU0WD880kH7X0Sw==
Date: Wed, 13 Mar 2024 09:19:02 +0000
Message-ID: 
 <7fc17fe275a54c8a9e00cd00ffc19e62418c1f84.1708948356.git.Minas.Harutyunyan@synopsys.com>
References: <cover.1708948356.git.Minas.Harutyunyan@synopsys.com>
In-Reply-To: <cover.1708948356.git.Minas.Harutyunyan@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|SN7PR12MB6910:EE_
x-ms-office365-filtering-correlation-id: 4ff55ac8-c2d4-4926-33d0-08dc433e9fc9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 W7OFlXl/DJDlFnbM7CNG+IIkwzLpF4Phtt3uQlKSCJeqw5XEwYKFd6yI6c8k+eIHe99s1EivwUH60N8aRDIlOht3lQ/PhzR44bT/G5F525wtAhT50XltR4qGaCJpuRyOFgd1GmxFjAhx+oe/6Bsr7PRY6oGwQfOGxZspwRWICPB1xqP0SUQ1hzHK+DuLCsDQtD2xkYBpp6C8gUTZbs3gX0/84K9Cjau7LxVLAGSVPU6o3rACo1PYiy1/AfzGqLqFOzV200DHj3eYFEEJ0jOgyHgHHVz4D15bCQGRTJepPaOn/K3TYsIvw56Ds4VEIA417H7PE7dF7H7zpFyoKxGgPH3cE0vmZA3vVM0BoA57iUwgvtVuQLrY3WqAk166msbN7N9HyZTuqHIF9m7jvr+7beVCQyfrAGatdazpQhmpCnChRvh2UdLMoRSe7gf6Nx4My20UMW5CxeeL+zjuv2pbttvqz9O88UrrSVuzssrFOVkToUr/SeAroZ6hHaq7cxFthb42p7NS8/jgepDsc4l2kELfeJespRbfkjh6Kx6wVMQUY0WE5QTONQDbytM5swhAd8h5oDybe3cKapEA600OJrmS3/VRvvx/wk5rw75YqLU1//yQKdD5t5aNu+nBZytz0pzBp935AjYGo8f4Q0nu0Od0NbAzX9QXXbnKywsLhfQhtFU0y3xX2BsgPuXdh1aKcS+ED8Nwmh3Ovo8QkQ7jkee7c7JzGFgpgJiRSK7M4JE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?EjwLL8V80w7ao5ysN8jFNWPlSJ2re+rhpAh7P6TC/AyrXcm9L+BAB5kkyU?=
 =?iso-8859-1?Q?iII6NtHhOK57XQMLeydIkaFxSyAeKk2cd37dwkZFfyR7bkAqorJjTfNfVX?=
 =?iso-8859-1?Q?LGZHGlRUtut4fqHCzUx6y5C1Av5f0FtsqMfSm8orPe7XS876mzF80tbMv0?=
 =?iso-8859-1?Q?yB60zzTQS4DGw7x/a/kPOOHzwoz0r8iPoKu47M8V2m5Izezyl+Z5EnE/Js?=
 =?iso-8859-1?Q?VoYWN38H2l0a6VZ7iwXzOd4DcgiK/PTjoRtv3F/EQ20yz9cdL9Y72ZrhLX?=
 =?iso-8859-1?Q?8IKjRcXfcKvNga+kgYZJBZkL2gvBfp6Wv1T+4nCyARMzU0CnEhyXJZ8ln0?=
 =?iso-8859-1?Q?rOqNPe1GAYhg7FUfd267gZc1a7lRVUZEvccLkChVSnx8hpRpvxWGOAbiDP?=
 =?iso-8859-1?Q?AbPzUXGz8addvD4sNthBcBp39fI8Yqnr/Fo5faSYRHK6VQz9mDBXrLIu0N?=
 =?iso-8859-1?Q?K4JeyVX5JooOzUKMQjUH8KGdeFkOp1ux3mKKpUBjbS8osEGeF01aGxaao1?=
 =?iso-8859-1?Q?3E0nMAtbDjOZ8D7cHptSqpgCEBf2Ss5W2cVu2+gk2t/24e+P6tu5ndotdY?=
 =?iso-8859-1?Q?0g6fkcMUIpt44jgNTebFXureXWsE6jSYpdT0itoqYbFhMuaFwHTFAWb87q?=
 =?iso-8859-1?Q?lP1lRg4lem5L8e4BOhOJ0bbuPH+zoYifL1gScAHfB3JfBded5WDSrzmpA/?=
 =?iso-8859-1?Q?hyVw61k6H6QBWnv77BB2KrIhSWfYSKP2NSxW0dEgT1K4q4P3JghnX29NbU?=
 =?iso-8859-1?Q?h4iHTQq9Gz9/porn/GUpzIQ6UgHhtA8SCvmFXP7719v1VrBao0wXxwpvEp?=
 =?iso-8859-1?Q?4FRt4kV79mMGSr5zF264cgIJk0iplsmS51FtEzDkP0vIcdZIZKIRoDHbja?=
 =?iso-8859-1?Q?mHRZhMpd8FQSaixhNOtizdTd9iPYaS4zaX3NX3W8GOUjzgoC6nDBYF9mvq?=
 =?iso-8859-1?Q?4RSex0fsRvzVWeP8ZG2rzWoXGMr6/AA85yh3Vy0VQMKGfmjab05cwvU/nX?=
 =?iso-8859-1?Q?H7N0NVItNdd44ZjHpvLmucf+PqdR7rvsQXFVDq6CfpX8qg+slh02sXwJW+?=
 =?iso-8859-1?Q?WixfCadsVhirgJyGGc4kEG/0d4YsUYI+fKPkUXuKOd85ldjiIIDy9//RXF?=
 =?iso-8859-1?Q?sXgPMu1LbQC1hgFcdTz8Gv4X5lVNX7gjdyLtVxoSt2DZcqw/OWkL+gQXBC?=
 =?iso-8859-1?Q?R4/oojKs8NJVAGFjUkQeshW1dtTEC/BY2cUToolrbuP03I0TYGd1g0iYGL?=
 =?iso-8859-1?Q?Zi+PfLe5FH+a3MoQHpHjflBbNorMRm5ybr2BLvInQL7apr/Ec/ua76KxV5?=
 =?iso-8859-1?Q?dWC7PszZYJwmzXTdv0yWM+/GHbp2LAcvjBsSKdwoqg98rNAytnw/uBay9K?=
 =?iso-8859-1?Q?Z+DvvcZ0HwdnIw+fCiVWXEHzwCdJnYgzdjLIg8vso4SganX0mXyevE9lHx?=
 =?iso-8859-1?Q?V3NDJqs5RinGdPrKDGTL+ZhWlJ+yTQUXjkbEnV8KRwjuMCwIEXw8RCF0xG?=
 =?iso-8859-1?Q?+uGyDoTFA+rZ2lCkBg+oBNt8DasJ1OPamgU4UZ6gs9yME6J0ZAvyW38k1c?=
 =?iso-8859-1?Q?oNMCg90DlxUv1gE75SJCCgcJuoIwk8x6WqC6743PQXmgk/pQvMy9J3h8ep?=
 =?iso-8859-1?Q?kcGqehscT5oQdPiRTlnyK6DEjjseQitRF5?=
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
	JUy2lsKuP4qVTxT31v8xqUK7e2DtXsu83pUT4bwdO1lEZb3oTX3004qohKWRP0vrIk4hlOsIKhiQTwojjMB7kllu4U5mhM/0kvQTuPdl241F/0f3wp3ySw02ru2fty9P7ofDq6rcdmt+QBenW/hcrKr9ebQHLO5sA3J0Qkue/kZ6pJlxKlbkgqelv9PNdbB6YV53rxmzVMeJ8cgFPkEnnrjfeLCKGvIXwtYdvNshV4KB0c1W7aI06ZSUyLBoLBFXUwRZc9hizDdr5LleOSvfMAp+2loA6v8xvqnc2033rtkBE/RUFVx+Ns+/Y/T78MWIuwdUGFTQy3Q6qtZfY2wcY2EAe3pk0HGYoDVD0TfU/DuAj7Jfx3xINHMNiNd87WO5vsK1MtWacF/H6TQi/3KJSDGaJbMcf7JNM4FApJyeU+xC1S+dBSMuMHFhQ/pjf0rS2GBIVl+mEIdy1wf7m8DWjkl3ghlQFBuOqZT1v1UIGqU3JLzo1eAQK5I3nP3m5tGAmbWeuPZuG0Ha/AyhVaZmOLxb025ODNfk+cEGrxZSmvOpUYiRncb+7wN/A5+2MjxDLc0kkhBME6c8Tk3LwyOWfoQ6NZ5chqIryhS804EBiPTagwI5KqnKACrzRborhWCx6FQRNV15S5PJ2CHrirrwrw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff55ac8-c2d4-4926-33d0-08dc433e9fc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 09:19:02.7281
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B0CtDZ4ignWTV4VSHyNQKgt8s7p5FOL6QXCK7SFT600QR1E7PyoNaxjQHbXTHSoHxaXufqAWZP6Vgonm0BzVqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6910
X-Proofpoint-GUID: niVfoqG-vRVmq38f0XYqNoNkOYdIssn5
X-Proofpoint-ORIG-GUID: niVfoqG-vRVmq38f0XYqNoNkOYdIssn5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_07,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403130068

Added new versions definition for HSOTG core v5.00a and
IOT HS device core v5.00.

Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
 drivers/usb/dwc2/core.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index c92a1da46a01..0c10bd0c32fd 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -1097,8 +1097,10 @@ struct dwc2_hsotg {
 #define DWC2_CORE_REV_3_10a	0x4f54310a
 #define DWC2_CORE_REV_4_00a	0x4f54400a
 #define DWC2_CORE_REV_4_20a	0x4f54420a
+#define DWC2_CORE_REV_5_00a	0x4f54500a
 #define DWC2_FS_IOT_REV_1_00a	0x5531100a
 #define DWC2_HS_IOT_REV_1_00a	0x5532100a
+#define DWC2_HS_IOT_REV_5_00a	0x5532500a
 #define DWC2_CORE_REV_MASK	0x0000ffff
=20
 	/* DWC OTG HW Core ID */
--=20
2.41.0

