Return-Path: <linux-usb+bounces-9488-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD758AB617
	for <lists+linux-usb@lfdr.de>; Fri, 19 Apr 2024 22:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0827F281A6D
	for <lists+linux-usb@lfdr.de>; Fri, 19 Apr 2024 20:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D113729CFE;
	Fri, 19 Apr 2024 20:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b="gjd+8Rt3";
	dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b="Czjpa2y9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0068d901.pphosted.com (mx0b-0068d901.pphosted.com [205.220.180.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53998111A5
	for <linux-usb@vger.kernel.org>; Fri, 19 Apr 2024 20:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.180.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713559529; cv=fail; b=RQ4kzR3NPFMXpaFHYpvtI2LaMBHILo3TNvyUNNqB5OsJGucbfvAj+figS5Nxq9hXQvGjWPLL3SdrkiKVAfjJBo8jj15tmobgE0GALqETNmic29mopmhq+EG3oyKo3slzz9uEFKY5LfbpuIBIyU/0yxkkuMywT+M5y8IQJTXU8hc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713559529; c=relaxed/simple;
	bh=lDdEwrDdWzHz6glDgYxjfDrVJ4NP1s8IyZXFe4c+BO8=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=XJ8EwxgFuIoKhhFWuNk+RKG8sRlVeyyI6jguGOL3U1uxPovz6vgkx0qnXu4WbWfERI/pPfUDgpkpxWcCF+m4dXgN5eomzZHAnH1e6/Bv24L2bFWS8W5kda6cxU6PyPar8Z+cau5+CI/vjzdJexxbatorhevObPOqws+9HWZckx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=biamp.com; spf=pass smtp.mailfrom=biamp.com; dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b=gjd+8Rt3; dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b=Czjpa2y9; arc=fail smtp.client-ip=205.220.180.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=biamp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=biamp.com
Received: from pps.filterd (m0278265.ppops.net [127.0.0.1])
	by mx0b-0068d901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43JAe7FR019260
	for <linux-usb@vger.kernel.org>; Fri, 19 Apr 2024 13:45:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com; h=
	from:to:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=proofpoint; bh=4yT4ru
	8pAb5bLlQxzg1OK0cByC9gjuRMTuZuLgxa8mU=; b=gjd+8Rt3zf8t+To7F2VoY9
	NFJAAFF308PADbp2Ry4pVHlhuaSrGBbgkgjyV3ybsEOQ6NL+cNSB/sWdCzFshwk6
	3rGPSnxNqyf0LtYEO44i9EjAGCp1YmAQ9aS69CRYopKyeZE9DeeQqWcveXUqarc9
	dQe4CfDkgCf+n70mKW9BfuLDT6E8Wq7Q7brRUjdQSwcU1SifsNSFzn/Vc/nAKsRm
	fkFjSJYpiD0OKL9emEHLnH4EakNQz4kKMjeStfcz/JkSVselGRUfyNyfJZmrnqvO
	njV7QQKv6yrcyIyHI3jTGGD0qHi79SWVKCBXhcw0CoPvbw/BHa9eVDx3Z1ObK1cg
	==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0b-0068d901.pphosted.com (PPS) with ESMTPS id 3xg40v4b23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 19 Apr 2024 13:45:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TygEKAJwjvnzStcfS934OhOV+L3JGpPHcWHMLxEaK59AuQOalrcVKCtkgr9qaDF0sYny1hprqTpn4S/rTwdqdrNNMtXo+OGEHDoS1HWe5QZA30S6RFtH41yzlOhPhW2sPqGweijmh79Ll+0Lv8PZ7WRmo4hBqv2YMDfg7IxKDgMFmS9kLSmrGI9Bfzv8z2aNtQx2HldLvK7S0grQp7rAAcdx3X4pNzAfd54kgKk2hjwiqbDsndQJVcEB2SdGalZMzT10G4lnod1V0lQfLUAtLd4nESmS7lzJiK1IHleI4H13meFytilBin/4nR6IZeODL5OSAK3gLpAtbjjV8DQisg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yT4ru8pAb5bLlQxzg1OK0cByC9gjuRMTuZuLgxa8mU=;
 b=Hn4W0rqwjdmhRCPXuDp+uzk0DDw9lvUL1cNhRpSF7CmnfpgoqA1XuAKfqkmyOgZq1GfSk0uKw6VSqcaBQ/J4Z23A+NfLiXN2DPt7HaAv0rktFqKV1y1coRVKLI9NhMXxR6YIh6jg3iiiCvq5l/c5EraMRNyQk3PYcMIDohZK0xzGUuO16qJSMVmNyPdow4867eFrg0RJ38Cwdg5Le1r0J7MrMFkmIbSjozR3G44v82queasLDQDQ+RiDte2qy0ZLmFI4eX4eY//xMwNdK5+hBtC9oQbZRMjwS6izYsC+v7h04dOL/H1Le30srn4+jgo4uWK2fKnirToDuouv6KXhYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=biamp.com; dmarc=pass action=none header.from=biamp.com;
 dkim=pass header.d=biamp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yT4ru8pAb5bLlQxzg1OK0cByC9gjuRMTuZuLgxa8mU=;
 b=Czjpa2y9SOiMv1kdkOcehsq0nnYz7L8O4Yj2MW7U0AxXvtO91SBgAxFiCzx2R5brX236KeZOaYBVDePH6nEpShrcOzSYlNb+XsynsOtETgXifp2wL3Jy+6efhQ6QUKBepQxshF7ELMMZN4p1iLM/BJ4eKztJ5v4q+wFS2HpJSa6/WE9lyoNDmkkYEczJh7LnI+izvqqRRMCxl1v8+10eXkltMxDNCKlgZBeoCuBF3+oe6ZX0t7bdz6cZ3WrNTjq3vV7d5GJ4b7wf7LtvQd1FQx/0ewhMWRcn5kV88b77sQmSUAtupMY8bPZiYeRjdQAr25e/M5RH26RmfgJCN87sYg==
Received: from CO1PR17MB5419.namprd17.prod.outlook.com (2603:10b6:303:ec::17)
 by CO6PR17MB4931.namprd17.prod.outlook.com (2603:10b6:5:354::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.41; Fri, 19 Apr
 2024 20:45:17 +0000
Received: from CO1PR17MB5419.namprd17.prod.outlook.com
 ([fe80::f48:ee61:a81b:d555]) by CO1PR17MB5419.namprd17.prod.outlook.com
 ([fe80::f48:ee61:a81b:d555%4]) with mapi id 15.20.7472.042; Fri, 19 Apr 2024
 20:45:17 +0000
From: Chris Wulff <Chris.Wulff@biamp.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [PATCH] usb: gadget: f_uac2: Expose all string descriptors through
 configfs.
Thread-Topic: [PATCH] usb: gadget: f_uac2: Expose all string descriptors
 through configfs.
Thread-Index: AQHakppr+TKXg8fd5U2C/E5C05j4Mw==
Date: Fri, 19 Apr 2024 20:45:17 +0000
Message-ID: 
 <CO1PR17MB5419B50F94A0014647542931E10D2@CO1PR17MB5419.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR17MB5419:EE_|CO6PR17MB4931:EE_
x-ms-office365-filtering-correlation-id: 8f126066-58c2-451b-2afb-08dc60b19eeb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?OS+KGe/0GMvw0s7OLDK1aUXgM3ZEpdNWKD+mckjmwKHjOkX3do8izP/qg/?=
 =?iso-8859-1?Q?C5rP+fHX1wjQ2GNzXQuJbwHoVpEelOnbw8JAZAChWLKBdPG8/XQRolodRo?=
 =?iso-8859-1?Q?K7y6Ck6fi+emZvX7aZ4sNl0hqotjWREiaqMNt0PWnCW+rV+dUd8I6KAPTP?=
 =?iso-8859-1?Q?6OM/EoIuzerjz3skSKbip+0mw3M1ff5uWqxl+htJ5ZRBY5nZxEJGZrABju?=
 =?iso-8859-1?Q?wpeD0TythaXAyiq+4GpLj9yZbF6Kkr/EGlMJ8CqhXpFDRDwVB6aGcKjG0x?=
 =?iso-8859-1?Q?OUTr91uQwI3mh9gk3B8wfV+3jMmWXXavG1wddj1/N8PqtwvCpVy4AL2FUV?=
 =?iso-8859-1?Q?Vlth9FNPN8f8zqlruAnk6+HnAv0fXqePNliMeQXSDo9icYu8Rda/ZkrvhE?=
 =?iso-8859-1?Q?ilh7N3TqkUYHWgUJyKKHsOTA1b0HmGLlg2Zk6losJ0ZRMXjSKnWGbmlfrP?=
 =?iso-8859-1?Q?4Bxe59Ptpg/V1FBM2Fea0jKdBBw9ZPlUpaeOGqLr4BdGOSctD39efx2PiW?=
 =?iso-8859-1?Q?uqKwrUofisy6SDmfsX96MT7WjGrMfdBTZUcuEM6a7aFPtwRytjrT2iMY40?=
 =?iso-8859-1?Q?WABdPURfF5OM/eCF+WncKvCf/9iaaFlgVTDmytOlb6ITW+ierb699mVQ7K?=
 =?iso-8859-1?Q?APoVGcFLzHq3MJIMP7r5j06+pb0DqMzzHYVnLI7+SWCePOUFRUw1h+ndmc?=
 =?iso-8859-1?Q?4ZTLEaMhtOu9Eh5rrcJ4vJ+kga7hU8XyPljJsQlAOhYBevShBmdWR0tY7V?=
 =?iso-8859-1?Q?/6mjw2JVgEmIgWeY6zOu4lcR8dqGq9Na7fCqhLDzJhrVlIUhxMj9e9zzLo?=
 =?iso-8859-1?Q?edGel+g5mDPsRHSFpp2Zs1bVYzqJySNtFMK7A8127VvsoDKYm1QWcAF+Ni?=
 =?iso-8859-1?Q?sMvWFqoI52rURvrIaWEw39fmmrTQuTcgK0XXsxd372HIysgWxzuP20iChn?=
 =?iso-8859-1?Q?/sxl21TY38AJKl4ADs/q0t8/C5Ws9qzRLjGst1QBIc3SfISLMG7wVYhYOv?=
 =?iso-8859-1?Q?AqyBypVI0/CO+g2dOLMBnmRMPOg0gMA+xYBzrRFL/x4+NlT/6maJh45OGN?=
 =?iso-8859-1?Q?kc/swlFO6Y6Dn9scfyu4Sf9VmUZBhvU0p3U4Xb0NhoqkMKrICa9XKcBcWD?=
 =?iso-8859-1?Q?0RX0HbI6J5srhtdGYtpHudC9OqKVhVUjlydNDwyotJlN+1+wFuc8la63gW?=
 =?iso-8859-1?Q?eyxzIbOqtB9qk12qT9woVAbGQjmlkv6vz+2UmK7JBS9v4QTrWn2y+rAKBY?=
 =?iso-8859-1?Q?rNIsyAQ6uL7wyJk6rXOX/CAO3Kb/QmByYqlztXno6OEL1pW9QhfJtMyw7k?=
 =?iso-8859-1?Q?s9gdKSXuyPa6CgIzHkvk98kbgIcdUjs0SCWT3xEc9caCmD9mEqr6fcvrYZ?=
 =?iso-8859-1?Q?GIs9AoxWeLOt3uQjOCX/mcWE/JXFm2Fg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR17MB5419.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?PK33mTDNPXvNRMjggovHxA0nfnu+J7r5kmRIVAxetWbOCSCQDrYZStZJ1+?=
 =?iso-8859-1?Q?xpKYQo3x3PDckDT31FdMMTCHVctsIRHc636JXNomvdtf4n1L+iTu5Sk6FJ?=
 =?iso-8859-1?Q?8BWKu8C2Wnph5TA8xS6jbahjBH18VeAR9Y7ExO2orR+LmwOUx1GIt4vTuI?=
 =?iso-8859-1?Q?iDQza5do4p2Zb5PklArZnPW80rz4vft7+OMiUEb5Foyo/pUoac9F0O8cEI?=
 =?iso-8859-1?Q?93TYQBbPT8EftbCsYi88fNLLg4MAa0SNCRwFfPPN2AUcHR8kP6tL8BwGKH?=
 =?iso-8859-1?Q?jga19e1T4kV4NwrRuGzwwKN+m1UIhfJm52jTbZfPYx6toeuzwLSJKlleJb?=
 =?iso-8859-1?Q?0XX4njre+hdB7ibi6j0nQoJa39GmE8FA8Ch36j3B3FJgNrJERsL5t3bbcn?=
 =?iso-8859-1?Q?7yq/q8TLFD/6AujMCb/gNuHCYmyRHkLdpwlnvHpk8ZE0M9QU3AT9kFWUs2?=
 =?iso-8859-1?Q?n9YronKkbAjOag82SiP31lj9RnB5r1L8ocn4zd0knV7drgGREWLF96TyE7?=
 =?iso-8859-1?Q?9VT/OCgjIE20RWOKymMiRUkEZ9Xe+Y4+XL1DQVGlMfDsfMv9e/XJypbFjK?=
 =?iso-8859-1?Q?qD2yEzn5YKz6cXXuVqxx++fTooFDPVZ6osLoOOx7LFm1qeqjuKBQO/nA4l?=
 =?iso-8859-1?Q?enl6SHIqAH6zO6w2muwGSOh8LgvK5Zzx9LQvu6l0EPYQ9ufjxM3CS2kR97?=
 =?iso-8859-1?Q?gV00Fv7GbhatEZG+beUjIPd795F7HdCdYfcO3xeur+4iZ9Dvc0KrwW7DIZ?=
 =?iso-8859-1?Q?jc4iPXFKJHhjWfff8CIL0m1xE56JIbeNZOa8kp7mXWygk2z6f9Fhltoo3k?=
 =?iso-8859-1?Q?yJDZaBAQ4i3+auUQvgUJhLiKDDtpYKD0vm2vG0HRcCCfWeYiDWqKlnrvoq?=
 =?iso-8859-1?Q?O+bKrrB1hQyxeEV0TzK9qswWddVymfVNpieEdhFf4/C5B8xD/hTboBr5w/?=
 =?iso-8859-1?Q?q8N4ksIkzd+R43VsSjs8sTBD7G8/Jk1V8zaD0UqQ7aCyg9oNbo+iyp01D+?=
 =?iso-8859-1?Q?4ypZcA6r9kIU+VAga6hLYcuMtqGBRbz+dGWCcwb6DHwLr3WFBfaZ21knqZ?=
 =?iso-8859-1?Q?clTO4kbV+O5DxBXIdJMvhIyUiDeP1Sdm6U3/EJNdYkDPdOlW3Mc4XouuzD?=
 =?iso-8859-1?Q?qpCIJ8S78EzwMQSZ2ExurXV3707ZcVs19qSOrv9PE8FkNd2uzSV8wzFLLM?=
 =?iso-8859-1?Q?od6aAGd8pW2aE+KaPubFb7yVF/zdQ1TyhbxFNtriWL9U6lo+MFK+nf5DNq?=
 =?iso-8859-1?Q?zxQeMDtJ0gALcBRPCyWwf0Gz8KvS6PahhkWnVJiQmeOTjrvqogRssBoHUu?=
 =?iso-8859-1?Q?L1PXKiwoWReHG41kWGf4k70QaFPtZAt9ITLtL14yQfFcdzVQ4GhkUDiGaf?=
 =?iso-8859-1?Q?M1wrl1ilirka3xRxpqNE5bbMuW7ohbFKM5+m5+0ZxMsZzoxHY1x/GpLjWe?=
 =?iso-8859-1?Q?3LIjTqv1AqHgy75oSwDQFDEn9TVQX8QSUTrYKS9US8KijpLPCsN5IKES2m?=
 =?iso-8859-1?Q?wzk5ayawrQDzhkD0vTdLvO6b5F2bFu8FpLOH5mrEJnX6ObwSbLdMfpbL83?=
 =?iso-8859-1?Q?L+yOtOm6S/j7NQVQ2DWL5AlwxqnAvZ2R5viT8PhPuM+0+V9DbMY3rpC6Dz?=
 =?iso-8859-1?Q?2O+nucMDhUQ8FLeZaX7dXJB3X107gSy0Ez?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: biamp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR17MB5419.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f126066-58c2-451b-2afb-08dc60b19eeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 20:45:17.1007
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 341ac572-066c-46f6-bf06-b2d0c7ddf1be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gHIu3igfyjgo+kCu0c/OolkWcs2kauXVvRZQ9joruL7mtTR8OmAXfAbdOkOg0H4OHK6CTR+yKiDmB0X4LCTFTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR17MB4931
X-Proofpoint-GUID: w-hk-kyXc7m7SYN71pkTVU_ynhPQ5gCF
X-Proofpoint-ORIG-GUID: w-hk-kyXc7m7SYN71pkTVU_ynhPQ5gCF

=0A=
This makes all string descriptors configurable for the UAC2 gadget=0A=
so the user can configure names of terminals/controls/alt modes.=0A=
=0A=
Signed-off-by: Chris Wulff <chris.wulff@biamp.com>=0A=
---=0A=
 drivers/usb/gadget/function/f_uac2.c | 72 +++++++++++++++++++++-------=0A=
 drivers/usb/gadget/function/u_uac2.h | 15 +++++-=0A=
 2 files changed, 69 insertions(+), 18 deletions(-)=0A=
=0A=
diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/func=
tion/f_uac2.c=0A=
index 383f6854cfec..7ee0ff67b515 100644=0A=
--- a/drivers/usb/gadget/function/f_uac2.c=0A=
+++ b/drivers/usb/gadget/function/f_uac2.c=0A=
@@ -104,25 +104,10 @@ enum {=0A=
 	STR_AS_OUT_ALT1,=0A=
 	STR_AS_IN_ALT0,=0A=
 	STR_AS_IN_ALT1,=0A=
+	NUM_STR_DESCRIPTORS,=0A=
 };=0A=
 =0A=
-static struct usb_string strings_fn[] =3D {=0A=
-	/* [STR_ASSOC].s =3D DYNAMIC, */=0A=
-	[STR_IF_CTRL].s =3D "Topology Control",=0A=
-	[STR_CLKSRC_IN].s =3D "Input Clock",=0A=
-	[STR_CLKSRC_OUT].s =3D "Output Clock",=0A=
-	[STR_USB_IT].s =3D "USBH Out",=0A=
-	[STR_IO_IT].s =3D "USBD Out",=0A=
-	[STR_USB_OT].s =3D "USBH In",=0A=
-	[STR_IO_OT].s =3D "USBD In",=0A=
-	[STR_FU_IN].s =3D "Capture Volume",=0A=
-	[STR_FU_OUT].s =3D "Playback Volume",=0A=
-	[STR_AS_OUT_ALT0].s =3D "Playback Inactive",=0A=
-	[STR_AS_OUT_ALT1].s =3D "Playback Active",=0A=
-	[STR_AS_IN_ALT0].s =3D "Capture Inactive",=0A=
-	[STR_AS_IN_ALT1].s =3D "Capture Active",=0A=
-	{ },=0A=
-};=0A=
+static struct usb_string strings_fn[NUM_STR_DESCRIPTORS + 1] =3D {};=0A=
 =0A=
 static const char *const speed_names[] =3D {=0A=
 	[USB_SPEED_UNKNOWN] =3D "UNKNOWN",=0A=
@@ -1049,6 +1034,19 @@ afunc_bind(struct usb_configuration *cfg, struct usb=
_function *fn)=0A=
 		return ret;=0A=
 =0A=
 	strings_fn[STR_ASSOC].s =3D uac2_opts->function_name;=0A=
+	strings_fn[STR_IF_CTRL].s =3D uac2_opts->if_ctrl_string;=0A=
+	strings_fn[STR_CLKSRC_IN].s =3D uac2_opts->clksrc_in_string;=0A=
+	strings_fn[STR_CLKSRC_OUT].s =3D uac2_opts->clksrc_out_string;=0A=
+	strings_fn[STR_USB_IT].s =3D uac2_opts->usb_it_string;=0A=
+	strings_fn[STR_IO_IT].s =3D uac2_opts->io_it_string;=0A=
+	strings_fn[STR_USB_OT].s =3D uac2_opts->usb_ot_string;=0A=
+	strings_fn[STR_IO_OT].s =3D uac2_opts->io_ot_string;=0A=
+	strings_fn[STR_FU_IN].s =3D uac2_opts->fu_in_string;=0A=
+	strings_fn[STR_FU_OUT].s =3D uac2_opts->fu_out_string;=0A=
+	strings_fn[STR_AS_OUT_ALT0].s =3D uac2_opts->as_out_alt0_string;=0A=
+	strings_fn[STR_AS_OUT_ALT1].s =3D uac2_opts->as_out_alt1_string;=0A=
+	strings_fn[STR_AS_IN_ALT0].s =3D uac2_opts->as_in_alt0_string;=0A=
+	strings_fn[STR_AS_IN_ALT1].s =3D uac2_opts->as_in_alt1_string;=0A=
 =0A=
 	us =3D usb_gstrings_attach(cdev, fn_strings, ARRAY_SIZE(strings_fn));=0A=
 	if (IS_ERR(us))=0A=
@@ -2097,10 +2095,24 @@ UAC2_ATTRIBUTE(s16, c_volume_max);=0A=
 UAC2_ATTRIBUTE(s16, c_volume_res);=0A=
 UAC2_ATTRIBUTE(u32, fb_max);=0A=
 UAC2_ATTRIBUTE_STRING(function_name);=0A=
+UAC2_ATTRIBUTE_STRING(if_ctrl_string);=0A=
+UAC2_ATTRIBUTE_STRING(clksrc_in_string);=0A=
+UAC2_ATTRIBUTE_STRING(clksrc_out_string);=0A=
+UAC2_ATTRIBUTE_STRING(usb_it_string);=0A=
+UAC2_ATTRIBUTE_STRING(io_it_string);=0A=
+UAC2_ATTRIBUTE_STRING(usb_ot_string);=0A=
+UAC2_ATTRIBUTE_STRING(io_ot_string);=0A=
+UAC2_ATTRIBUTE_STRING(fu_in_string);=0A=
+UAC2_ATTRIBUTE_STRING(fu_out_string);=0A=
+UAC2_ATTRIBUTE_STRING(as_out_alt0_string);=0A=
+UAC2_ATTRIBUTE_STRING(as_out_alt1_string);=0A=
+UAC2_ATTRIBUTE_STRING(as_in_alt0_string);=0A=
+UAC2_ATTRIBUTE_STRING(as_in_alt1_string);=0A=
 =0A=
 UAC2_ATTRIBUTE(s16, p_terminal_type);=0A=
 UAC2_ATTRIBUTE(s16, c_terminal_type);=0A=
 =0A=
+=0A=
 static struct configfs_attribute *f_uac2_attrs[] =3D {=0A=
 	&f_uac2_opts_attr_p_chmask,=0A=
 	&f_uac2_opts_attr_p_srate,=0A=
@@ -2127,6 +2139,19 @@ static struct configfs_attribute *f_uac2_attrs[] =3D=
 {=0A=
 	&f_uac2_opts_attr_c_volume_res,=0A=
 =0A=
 	&f_uac2_opts_attr_function_name,=0A=
+	&f_uac2_opts_attr_if_ctrl_string,=0A=
+	&f_uac2_opts_attr_clksrc_in_string,=0A=
+	&f_uac2_opts_attr_clksrc_out_string,=0A=
+	&f_uac2_opts_attr_usb_it_string,=0A=
+	&f_uac2_opts_attr_io_it_string,=0A=
+	&f_uac2_opts_attr_usb_ot_string,=0A=
+	&f_uac2_opts_attr_io_ot_string,=0A=
+	&f_uac2_opts_attr_fu_in_string,=0A=
+	&f_uac2_opts_attr_fu_out_string,=0A=
+	&f_uac2_opts_attr_as_out_alt0_string,=0A=
+	&f_uac2_opts_attr_as_out_alt1_string,=0A=
+	&f_uac2_opts_attr_as_in_alt0_string,=0A=
+	&f_uac2_opts_attr_as_in_alt1_string,=0A=
 =0A=
 	&f_uac2_opts_attr_p_terminal_type,=0A=
 	&f_uac2_opts_attr_c_terminal_type,=0A=
@@ -2188,6 +2213,19 @@ static struct usb_function_instance *afunc_alloc_ins=
t(void)=0A=
 	opts->fb_max =3D FBACK_FAST_MAX;=0A=
 =0A=
 	scnprintf(opts->function_name, sizeof(opts->function_name), "Source/Sink"=
);=0A=
+	scnprintf(opts->if_ctrl_string, sizeof(opts->if_ctrl_string), "Topology C=
ontrol");=0A=
+	scnprintf(opts->clksrc_in_string, sizeof(opts->clksrc_in_string), "Input =
Clock");=0A=
+	scnprintf(opts->clksrc_out_string, sizeof(opts->clksrc_out_string), "Outp=
ut Clock");=0A=
+	scnprintf(opts->usb_it_string, sizeof(opts->usb_it_string), "USBH Out");=
=0A=
+	scnprintf(opts->io_it_string, sizeof(opts->io_it_string), "USBD Out");=0A=
+	scnprintf(opts->usb_ot_string, sizeof(opts->usb_ot_string), "USBH In");=
=0A=
+	scnprintf(opts->io_ot_string, sizeof(opts->io_ot_string), "USBD In");=0A=
+	scnprintf(opts->fu_in_string, sizeof(opts->fu_in_string), "Capture Volume=
");=0A=
+	scnprintf(opts->fu_out_string, sizeof(opts->fu_out_string), "Playback Vol=
ume");=0A=
+	scnprintf(opts->as_out_alt0_string, sizeof(opts->as_out_alt0_string), "Pl=
ayback Inactive");=0A=
+	scnprintf(opts->as_out_alt1_string, sizeof(opts->as_out_alt1_string), "Pl=
ayback Active");=0A=
+	scnprintf(opts->as_in_alt0_string, sizeof(opts->as_in_alt0_string), "Capt=
ure Inactive");=0A=
+	scnprintf(opts->as_in_alt1_string, sizeof(opts->as_in_alt1_string), "Capt=
ure Active");=0A=
 =0A=
 	opts->p_terminal_type =3D UAC2_DEF_P_TERM_TYPE;=0A=
 	opts->c_terminal_type =3D UAC2_DEF_C_TERM_TYPE;=0A=
diff --git a/drivers/usb/gadget/function/u_uac2.h b/drivers/usb/gadget/func=
tion/u_uac2.h=0A=
index 5e81bdd6c5fb..9369f7e332d6 100644=0A=
--- a/drivers/usb/gadget/function/u_uac2.h=0A=
+++ b/drivers/usb/gadget/function/u_uac2.h=0A=
@@ -68,7 +68,20 @@ struct f_uac2_opts {=0A=
 	int				fb_max;=0A=
 	bool			bound;=0A=
 =0A=
-	char			function_name[32];=0A=
+	char			function_name[USB_MAX_STRING_LEN];=0A=
+	char			if_ctrl_string[USB_MAX_STRING_LEN];=0A=
+	char			clksrc_in_string[USB_MAX_STRING_LEN];=0A=
+	char			clksrc_out_string[USB_MAX_STRING_LEN];=0A=
+	char			usb_it_string[USB_MAX_STRING_LEN];=0A=
+	char			io_it_string[USB_MAX_STRING_LEN];=0A=
+	char			usb_ot_string[USB_MAX_STRING_LEN];=0A=
+	char			io_ot_string[USB_MAX_STRING_LEN];=0A=
+	char			fu_in_string[USB_MAX_STRING_LEN];=0A=
+	char			fu_out_string[USB_MAX_STRING_LEN];=0A=
+	char			as_out_alt0_string[USB_MAX_STRING_LEN];=0A=
+	char			as_out_alt1_string[USB_MAX_STRING_LEN];=0A=
+	char			as_in_alt0_string[USB_MAX_STRING_LEN];=0A=
+	char			as_in_alt1_string[USB_MAX_STRING_LEN];=0A=
 =0A=
 	s16				p_terminal_type;=0A=
 	s16				c_terminal_type;=0A=
-- =0A=
2.34.1=0A=
=0A=

