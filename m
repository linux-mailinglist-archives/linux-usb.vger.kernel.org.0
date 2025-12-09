Return-Path: <linux-usb+bounces-31311-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A582ACAF0A9
	for <lists+linux-usb@lfdr.de>; Tue, 09 Dec 2025 07:32:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 937A630F1E89
	for <lists+linux-usb@lfdr.de>; Tue,  9 Dec 2025 06:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CA93218A6;
	Tue,  9 Dec 2025 06:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Wj0uYVGr"
X-Original-To: linux-usb@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013004.outbound.protection.outlook.com [40.107.201.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E42320A3C;
	Tue,  9 Dec 2025 06:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765261690; cv=fail; b=FI/LOx1HTwA2zWiqBFvP2Tj2/Q9uGBcRUYOnvyxL20WndGfgMWmyDzgu1vYytjNSd+ZkLbpWK/JO2YDjn1a4BCOMKOEDqkAimC20vvEYxRNm5a2E5+lqqZ02QdJosyffkxFUW9klE4zdD66NSDu9qqCUQ1WDbugqubD5g1r73vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765261690; c=relaxed/simple;
	bh=BWcJW9VIaaA5HKj80sKke/xB0Op/o8W38iT+jdwkRRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZR3j/vM+J1dOcfLWtvcG+s1NOs/WB4H0P4/hw9gVw2cUKxIF2BH6cNZ+5vqY53eKjxoEt4PkKjdb9Pd8PAFSu2ksYLDStdPHn+65GKH1TB0j/U5pQzohQSiB3bppqeMo0HdviaWnjvBBoR16+wT7Q6utaC7eCBBbGgXCOejUv58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Wj0uYVGr; arc=fail smtp.client-ip=40.107.201.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vT3dlOLsMVGRJ1A3DjlmQg3vfmYNIzdk0lolDtoteJ2gDU5rMS1rYXAYa80gBaAS0xVdjQwv9vwvmBmMVmH/0pr2k7ZuE6L2vOypOQaF13IF5c95D9ERF5uMVvxCnRQ7/cG4Y0KcI9b3waV/BxEETA6fW0zlICGPPJMXTCaaHl2+2BrMDQ4zUirvG0wqR0HuKehIXyLylZ9pyKtnbKcrIq8T64lVrJNPT+TQvDKW8nv8jhNjLsMmsSb5FxbUSdGF6IkAXs4iZW+OpjkJ3cMUimqMqbdY04X/amvz+tG0F8o2Qqd/cQxyKvCvnwBCcEWxMZIP08i6Ge0mMZ9w2GAzbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZjXoJzxOmU69gfj7wgOq6TwcTWvHWYJd5g1iiKjyio=;
 b=qNxDpM6QRuPn/b2R1JaDjvJTCfUo236w3jLrCLWnzW6QUUGGgN3xFQY0sSTXO8g2s6POrtKm6/8eAzWQyIJJxsSCEDLKuWQssePERJK8b+++TH4BOjMl+l8KlIn3Ecg23GWuE2h/BcCEuDVr+5I4gXGuTbT/1giZZAycx8OpaIN3HqYHKWYS1EW8qDLxPvoJCDieiN1Lgtg5B9Xw/RJkZVPd4dZnI1RDSsPHmBKB4XN5bu2LLPbjmPg1ruCruAKLV4sKutC+beTWPpyqQsMPfkEYkayeH1nNKQWeCYyulVKkx9Z0RcRKdrry6ILj31r0Gp6asIFRHGIopXhz9eucIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZjXoJzxOmU69gfj7wgOq6TwcTWvHWYJd5g1iiKjyio=;
 b=Wj0uYVGrFi4WORwnOuWmACQvLUYhTV2xf/nERNrMfRCJVgBMB/lEcL9Mb2NxHEi4BKG+t+M9YvXYVpYQ6IHppraCPQ46/W4FP2jqVVLnJ5TP5mEFo25PMY+9XlARP4vdsjutSthwsLtkrCC5ghskkpF21uMacDcZJsEcuoUo1fPyfAi9UBJEyX352HStC+t/LzvJDbqpcW8cxYmUEMP19qNDMCPctjRTfJy6h4JIxMTLr0e7q8pL5kCD0bTb0+yOgXhfG21+e9J01Dw3/jJzStAV7EpzXUOOlTV0r0Sw+eXCFPspIYWEZuXh9B6WcGKUxMVkAudmQTTRzt6QMsKfsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 CH3PR03MB7314.namprd03.prod.outlook.com (2603:10b6:610:1a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 06:28:05 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 06:28:04 +0000
From: adrianhoyin.ng@altera.com
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	Thinh.Nguyen@synopsys.com,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v2 4/4] usb: dwc3: Add support for Agilex5 in dwc3-generic-platform driver
Date: Tue,  9 Dec 2025 14:25:11 +0800
Message-ID: <a9db62422d39ac51cb26b73c5537ca2f8130f7a3.1765249127.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1765249127.git.adrianhoyin.ng@altera.com>
References: <cover.1765249127.git.adrianhoyin.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KU0P306CA0008.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:17::13) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|CH3PR03MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: a6db1425-a13e-42ca-0461-08de36ec1c33
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGJxVmlLT2tSOThDU1ZaWWpUcG92SVh3VTdrLzFzeWhZM2gyREQxdERyeTQy?=
 =?utf-8?B?MmhheU1OZGgyVm80VjdxK0M3QXJCNXlTTFRHaitlZGxHMU1XN2FFdFY0R21M?=
 =?utf-8?B?b3JWYldzNXl2Z2d5WElRZ1FMNkpQRGpWeEU5Y3RKVmVTbHZWSFlndFRZQ0JD?=
 =?utf-8?B?aCtBS1g5YjFSSm9HK2FUaTRhK2dQdjhEOW9KeWhCMnJsTCs4MWdXS29ORFVD?=
 =?utf-8?B?VUZWRzA1TmRZN1VTR0U2d09tSWpHS2pLS2tYWEQ0aDVhaXpiUmpUTzlPNGdx?=
 =?utf-8?B?OEV2ZnNHeXNkVU9Uekd1UXp2T0JZTzNIQmRnd1N4MHBkQThIaTlOcmRBSnAw?=
 =?utf-8?B?WkxoaDF3azVsZ2VCZmhTT3dDejZkeEloQ0g3Q3UyMFJtQ2tuV3ErOTRnNDRY?=
 =?utf-8?B?TnpZQ1JGU21NbldtWXVLSGt0NzdsR1haT041WUZZR2Q1ejN5MWV1TjBnYkRU?=
 =?utf-8?B?SkxnaEl5TnY5bkd3MjFBN2YxTVk2QWV6RE9QSmMrYTRxTkFGaHZYbjRySktj?=
 =?utf-8?B?RHhkM0lwaGp1eC9reFR0Mnh0anBSYlVJKzVkV25zNHNwbFc5UnBBZkVrZlNw?=
 =?utf-8?B?SkZQblQ5RWtsamhMRG9xbHFpWm56WHY3M00wVWI3SHphTEE1UXArbTJRTFla?=
 =?utf-8?B?QXViVTlxVlNkekI3VEpySnpnVWNzTkZVcTVoVVcwckltbHRWUWxHeERGby9o?=
 =?utf-8?B?SjN5Vi9vbHZYMnFiaFlhSTc4ZFhzaUFoMnFOSDZvMUQ4Z1hqMzNxcWZoUnE1?=
 =?utf-8?B?aEt3Rjh3b3FaU25XKzNTUkx6NUx6ZVh4a20rcXpjdS91V3dsMFI5bHBZYWRl?=
 =?utf-8?B?M3ovamgyYjR6SEQydDA5Z0RicERoZXZFZWFEZXdiUHA4cjFlUHQ5ZDIwWDhE?=
 =?utf-8?B?S0tQN3NnY0JlcjYybmQyL2JEZDJVR3laV0lNUXVsVzNEQ2NCNVNLZTR5Y2g5?=
 =?utf-8?B?U2xRbVFHeHJmRUpCL2dQUk1mMVJ5SC9weXNNeXJ5K05BV3poYXFmZXVOaUhK?=
 =?utf-8?B?YlV6UmRpdU1aZWovbmNqZnlBZVFuUVZrQTRyNjgrN0tXRWJaeGo0RFUyVFZ0?=
 =?utf-8?B?LzIrOXY2T2U5d0RGVjNjQzlDb3duU2FHdFBPbzNQc2luOWREekpORHE3Q2Jx?=
 =?utf-8?B?Tjdmeks5TGNuMnovQVdrUUZndTFBTiszMHA1VHhLeTYwUGFDMFdzYk1TQnU5?=
 =?utf-8?B?Ykx0NlMwOGN6U1NXeFpFcjVFV3JPcnMybFBzK0ZiM3JSMUZ6Uy9lbUs3TE5y?=
 =?utf-8?B?b09QQTd6YmwwUXZXZ1FZMHhjampnOGlMeVJETGVRVUt1Z040MVp1YW12WXZH?=
 =?utf-8?B?N2NIbEMzakRWR1BrNG1kTC9NR3ZBNmRpTHpYdmx0bDFRY1ArMDhDY3RnRmh0?=
 =?utf-8?B?aVpLeE9xeWc1RE44bzZtdXdoYUpyNzFBUlR1YkpnTjBEYU0yZjJIbWVLZFl3?=
 =?utf-8?B?dThPeVJycER4OU53bk1ia3FTU05HQUMzaXVLVmM0d1VncU5rcDFScUc3UEh3?=
 =?utf-8?B?NHRCOXlJcFNUMDJ4K0ZScUcvZWRsdFZLbytaSWVwRnRCTTYyNDQ0TmVBaW92?=
 =?utf-8?B?d25YcU1Tb3RDakg2YnNHZW15a3RCeldvK3VBSmRwVTgrUzFUVG5WNnBDcllS?=
 =?utf-8?B?RllZaG9HNzR5NlRYUXRXTllzT0cvTzcxVzV6aUV5STJmY3dSS3h5UnhSYmNI?=
 =?utf-8?B?U2tPSE1RKzFuWldJR2hmREk2K3hDTzZhcjFFS2xRMDJ0R01udDZha09Pdlkv?=
 =?utf-8?B?eU9SSktBdUQyQUZzVG1nbWJKTmZTV3Z2NGZ1SW1mU1pGZnZ0NCtCK0NlUmxP?=
 =?utf-8?B?Q1BQQ25INXJiMmw0WEZ6cEZ2WmZSTkNtaTRCcy9DTEtqTi9tUzNMdHRLVXE5?=
 =?utf-8?B?MFR5MDgrVndWem02UmRIOFFaZEhTTm9mTnhZa3lWV3FCNlF0UWRTV0h4Y21I?=
 =?utf-8?Q?Y49wp95EgyPS9qjw49UcmNCJUBb6DKYh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0E1Q0lDM21JNy9PVnJUUXE1SG9UVFNic0I0dFcweUttWTMzaElXUVJGcG42?=
 =?utf-8?B?MUpUZWx2cmJzVkhVcEZmSHoxT1Z0azIrbUoyc00xYzZiZGFRUGNrNktuOXZs?=
 =?utf-8?B?Wk5VVXEwQnJvclB5blR5OXVCMER5VDdOSk5BOGZTM09kbHlzR0RBL0hZdlVs?=
 =?utf-8?B?Y1NwdGRsUnkrcExjdk5HRXZIaHJBUDdFcHpIZmF6ZkVFbndUUFBPZWNUeDdU?=
 =?utf-8?B?dmJTU21rN2cza2ZqVnJldjlpWXQzZXNVTDNsblpGejNMb0R6bkwvL01GL2tL?=
 =?utf-8?B?ZUgrZ1VqMFBSQmxVSVpZNmhML2RtbHduaDVidDg0TTJ6bnZkWitHRktLRm05?=
 =?utf-8?B?ekprcGxYVVlNajlhakhrMlFEdXI1RDJ2M1BBMTQ0emgzZHdWOEVycDVkR3h5?=
 =?utf-8?B?eHh2RmQyZm9RTDZrbkZuOVkyU3VlMEsyNWVOcFNDdXA3Ky9WVEJsMmRtbTY0?=
 =?utf-8?B?eUZVU1J0VElCRDU4OTZvaXRnZ3NzaXNkVlhYbkh2cVM1ZkZTYUI3WGw3VjYv?=
 =?utf-8?B?U25JbVhOK3puNWFFbFd4ZmtBRHVRZ1cvSzRlUVJvU0s4eW9zWDE3UWlZZlQ1?=
 =?utf-8?B?RjRUdEk3NTVZWktETDB4VzFvRnovM2UvZkRHL0xlWU55Rll4cFl3aXdFTWhx?=
 =?utf-8?B?cnUreGpkQm9qeXh1cnQ5bW9PcUZ1eEkwMnBLcG5jU1pvM3hFOTJQWUVsTVdZ?=
 =?utf-8?B?eFF0U0dwazBiVnkreXZMVUN3Uk9kUlJtVjl6M0lFYTRJTUFpUzU5Q1ZrR3FO?=
 =?utf-8?B?MDlPckVzelVoZ0I5R2VVak9tMmJQWHBadlJIanA3cUdTODRFV2FpREpZMlZF?=
 =?utf-8?B?bTNsZXdGL2FCcWZkYVFDUkUvVkdER2ZSbTNOYXg1Mnp0T2dCWFlCNkRRODBN?=
 =?utf-8?B?M0c1VGRBV24zcUt6YVBUdjlPM29ZbVFGczZaRWkrb1grcVFoUU5jTXJCUVNW?=
 =?utf-8?B?MlRENGswZ2JrZTZHdkcwZEU0SWpKUGFlYU0vLytYaWRaWFA2VTF5Lzg3UkY0?=
 =?utf-8?B?UjBSTUFhWU1CbnNsU0Q2YnpxdDV6WWZpVDF5ZnVjNUhMSlRVOVduMzFsU2RB?=
 =?utf-8?B?L1Nwd1F1Sy95QzByd2h2VDYzamdNYnZUdUNtK2pCbXVTakRBWFF6T2hqWWdl?=
 =?utf-8?B?V3dtSU44TlFFdzdhYWxaOHN1bk9nVkNJd0JQUjZkSUtGOGd2dm4xS2h5eWQ3?=
 =?utf-8?B?TGhmM0x2S1NXakNJRENLOTAzd3dsR2J4a3VSNHloNVU1REdTbFRUNGh0Vnhz?=
 =?utf-8?B?QWpDdUtOMUZsNlVNajk4c05IQzcyNUg4N3o3eXNmMnVjaGlBVkdCWFN1bXlD?=
 =?utf-8?B?ZzhjVSs1YmJIeWN2U1lsbnZ2SitaZnRHWmxtOHRDYjREOEk1THRrM29udk1y?=
 =?utf-8?B?ak1KSUtNT3h0TGZLNzlneEtJaERpcFJ5SlU4MmM0MTE0cEZJRHFPUzFEcWVJ?=
 =?utf-8?B?WlVCUk1KRXp5d2ZUN013aTJHSU1sSzBVUElINlZJTWhSOFd5Vi83aXNVQytn?=
 =?utf-8?B?SWVOQzU4RXZpMEphU0VoRkduRW5lems2ZnNmMWZjYmxLVlB1UzJDWFVqOE5j?=
 =?utf-8?B?WExtSGRmSGdtY3lXV2tEYjFEeUNlbjhEcEVYRkVqRkdsQVJ0TGN3RjR2dy9h?=
 =?utf-8?B?NFMrYjBtUXN1dCtONVRiY3ZGTThScytWdkxjY1dpS1RHK2tzMWNnMFVGOTRr?=
 =?utf-8?B?VUhXU0N3NWEycG95QWxUTGJFY1k3dFdKRmI5QUo0SlV4RFpmWW9aclVKMVFv?=
 =?utf-8?B?NCtIbytWTmt5b1JSNzlmSW5GMFV4cGRzWHdMYlNVU25JQm9TcEhDckd1UHB3?=
 =?utf-8?B?a3FJWGJEYXJ2RnZaL0ZRSkZmVHc5TU1jYStJM1pBOVBOWWMvbUFPMmZLd2No?=
 =?utf-8?B?SVdyNHdmRjRaVTk3M1VLR01ZYVJ3UXl0aHUvWjVlNEdGYjQ4bG5MWkM5Y3NI?=
 =?utf-8?B?MEltaGNOZ3FuZmpMaXpVTnVpTHNHanFXcUo4TS9SR2lUbVZXZk1Hb1YvQWk4?=
 =?utf-8?B?NVJOMGdXL243R1dxemZGWU1RSGdCYStsakd0YUNzb29PV1VneXRSV0RHMGQv?=
 =?utf-8?B?RndLeVd1azI3cGpvYllWSFFpdWpvNjdYL3UrQ3lpM0pTMDhhckxEVDlkSVov?=
 =?utf-8?B?K3p3NzNnNkFIaFJhZXdpenhzTU1Ld21FUjUxT1MxOXNJdVZqVXlmdUovUVpQ?=
 =?utf-8?B?RXc9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6db1425-a13e-42ca-0461-08de36ec1c33
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 06:28:04.8230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pyICgQwqvJhY1MQsSo38faRl7vZ9eIa/ka6TtICmhS6T6rP21WFkRjRdDIZ3h6xJq/PA6HIV89U8lbSwb/MEhb/TjrB7dTLIEfndzIKGkpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7314

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

Adds support for Agilex5 in the dwc3-generic-platform driver. Extends
generic driver to support configurable driver data to enable dwc3 core
property configuration from glue driver.

Agilex5 DWC3 wrapper has a 40-bit DMA address bus limitation. When SMMU
is enabled, using the default 64-bit DMA mask can cause DMA addresses to
be truncated, leading to translation faults.

This patch adds a `dma_addressable_bits` field in struct dwc3, allowing
the glue driver to set a 40-bit DMA mask during probe.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 drivers/usb/dwc3/core.c              |  6 +++++-
 drivers/usb/dwc3/core.h              |  5 +++++
 drivers/usb/dwc3/dwc3-generic-plat.c | 20 +++++++++++++++++++-
 3 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index ae140c356295..1fca55637844 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2243,7 +2243,11 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 
 	if (!dwc->sysdev_is_parent &&
 	    DWC3_GHWPARAMS0_AWIDTH(dwc->hwparams.hwparams0) == 64) {
-		ret = dma_set_mask_and_coherent(dwc->sysdev, DMA_BIT_MASK(64));
+		if (!dwc->dma_addressable_bits)
+			dwc->dma_addressable_bits = 64;
+
+		ret = dma_set_mask_and_coherent(dwc->sysdev,
+						DMA_BIT_MASK(dwc->dma_addressable_bits));
 		if (ret)
 			goto err_disable_clks;
 	}
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index a5fc92c4ffa3..a09800fe6577 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1180,6 +1180,10 @@ struct dwc3_glue_ops {
  * @wakeup_pending_funcs: Indicates whether any interface has requested for
  *			 function wakeup in bitmap format where bit position
  *			 represents interface_id.
+ * @dma_addressable_bits: The number of address bits the device can drive on
+ *			the DMA bus. The driver uses this value to program DMA masks and
+ *			ensure DMA buffers are allocated within the device’s reachable
+ *			address space.
  */
 struct dwc3 {
 	struct work_struct	drd_work;
@@ -1414,6 +1418,7 @@ struct dwc3 {
 	struct dentry		*debug_root;
 	u32			gsbuscfg0_reqinfo;
 	u32			wakeup_pending_funcs;
+	u32			dma_addressable_bits;
 };
 
 #define INCRX_BURST_MODE 0
diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index d96b20570002..e9650df6cf81 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -20,6 +20,11 @@ struct dwc3_generic {
 	struct reset_control	*resets;
 };
 
+struct dwc3_generic_config {
+	u32 flags;
+};
+
+#define DWC3_HAS_40BIT_DMA_QUIRK BIT(0)
 #define to_dwc3_generic(d) container_of((d), struct dwc3_generic, dwc)
 
 static void dwc3_generic_reset_control_assert(void *data)
@@ -34,6 +39,7 @@ static int dwc3_generic_probe(struct platform_device *pdev)
 	struct dwc3_generic *dwc3g;
 	struct resource *res;
 	int ret;
+	const struct dwc3_generic_config *drvdata;
 
 	dwc3g = devm_kzalloc(dev, sizeof(*dwc3g), GFP_KERNEL);
 	if (!dwc3g)
@@ -70,6 +76,10 @@ static int dwc3_generic_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "failed to get clocks\n");
 
+	drvdata = device_get_match_data(dev);
+	if (drvdata && (drvdata->flags & DWC3_HAS_40BIT_DMA_QUIRK))
+		dwc3g->dwc.dma_addressable_bits = 40;
+
 	dwc3g->num_clocks = ret;
 	dwc3g->dwc.dev = dev;
 	probe_data.dwc = &dwc3g->dwc;
@@ -145,8 +155,16 @@ static const struct dev_pm_ops dwc3_generic_dev_pm_ops = {
 		       dwc3_generic_runtime_idle)
 };
 
+static const struct dwc3_generic_config agilex5_config = {
+	.flags = DWC3_HAS_40BIT_DMA_QUIRK,
+};
+
 static const struct of_device_id dwc3_generic_of_match[] = {
-	{ .compatible = "spacemit,k1-dwc3", },
+	{	.compatible = "spacemit,k1-dwc3", },
+	{
+		.compatible = "altr,agilex5-dwc3",
+		.data = &agilex5_config,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);
-- 
2.49.GIT


