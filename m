Return-Path: <linux-usb+bounces-23826-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAD4AB1948
	for <lists+linux-usb@lfdr.de>; Fri,  9 May 2025 17:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 130891BC29AF
	for <lists+linux-usb@lfdr.de>; Fri,  9 May 2025 15:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5992C22F386;
	Fri,  9 May 2025 15:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=matrixspace.onmicrosoft.com header.i=@matrixspace.onmicrosoft.com header.b="qW+yNDSj"
X-Original-To: linux-usb@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11022130.outbound.protection.outlook.com [52.101.43.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4695821B9CE
	for <linux-usb@vger.kernel.org>; Fri,  9 May 2025 15:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746805850; cv=fail; b=NSZet1UVxVYl3Wm69mjWaXVk/Trg5yvwwUT5Gvzsn1qHrPb4z+jd1a/H4Xk0dZV6Dt5lVO8n/I+sBdOgDr6oSiDgigEcxPrcj859oDmukJ/AEvUaOT1ZxVUtDuKlM32cy9ggmN2sTG57Jxxk+A5AvA8EuYDjrefy+SiwS9knmD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746805850; c=relaxed/simple;
	bh=PiGSNr8+EklB5DVomWK1jqIYkzbdFhmXb9KuydNP4l4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lscysaCjECPD6NpYn5JxWuejn0Bu3CAkuCbWbdg+NRC+iLMK88FCpH/7w9bjl4avo6q9uLsI6sxJzbo2Zw037ZtfkZiAun5aL7IoRLcNJHH+gHjAWhWHCWyaQWGA9Y8LYitRw1Erbd5r/SezEn3ImJuo+WNqtVxhC4bHMDXX4yg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=matrixspace.com; spf=pass smtp.mailfrom=matrixspace.com; dkim=pass (1024-bit key) header.d=matrixspace.onmicrosoft.com header.i=@matrixspace.onmicrosoft.com header.b=qW+yNDSj; arc=fail smtp.client-ip=52.101.43.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=matrixspace.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matrixspace.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CdYTOAa0Gtda2gwpjnB5ChZRzX5gvLnQJPF4y7jwkKcFDIpCjf8tY3+z1Yld30MOZlxhnx3/Ao62nF/UCwNXG1YL/jX5vt9gJ3XAfZiKEMVFuC9P0ESgu9G6HCVN6cU27xQkXBzayKHT8W/BTaQMawwz49ykswwj2hI9uxEryirAx824Z3WfaUXQPmcZoZtP4Win88cqZJy3uonnxAjddQPsMGkZ5n91L0uytjydU66hxuHo5rPz4sKsXmwSbpMCqQhgdDEYllJGfROoOT4Wd+A3mL6kZlYo/930C4qu30uwk5DyFY/p4hBqrHSRWfA29h6BSfUjismS7zW6OPxh4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LLNrKhEKUgh9gyiU3H+GUXgA/08gSgLz2QaljivnXs=;
 b=bLJyPNsd1qirImbTcc8Emr2/kpOz0EBYjwkMkxv917m4TEwgbzTcYR7toE4NYQrFPUSs7r/MoDgHmrS6oY9ykrWd11soUrBmia6X/g4yxNOy45TkTH/bF5X3l+IP9kRTyWLsPd6l4uaVad1LBiOLXPo564RCSfpDDr23xYU5l2xVJAJLQmLxNZNVr19mkr10LA3hgM5nU8CfxP0LWT09IMlvprzY1pFvRJNr7xyBGNAlD1zxrDARd/Ok1HQkhNd+SpA2dVzLtpxuOVV6sOVrfvW9R/io4fMq5HxI3oHzXoJaLKXWW6QSGwdxO63yal0TAEOmT3ROAd2Wfjjm59Sepg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=matrixspace.com; dmarc=pass action=none
 header.from=matrixspace.com; dkim=pass header.d=matrixspace.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=matrixspace.onmicrosoft.com; s=selector1-matrixspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LLNrKhEKUgh9gyiU3H+GUXgA/08gSgLz2QaljivnXs=;
 b=qW+yNDSjUnGxoYm7Z0O0oEIoO1w6/pv4nZl8I3sffM39sAe6Fv+1lFNAJqb21OLALmVeIMOvFdbPTPPRKp2xlrGKuwfmECHQVpIgk1SzLXPpE4KqaO2kFD6n92Yw9JIesWEF/e9FX1OBch51a/BJRgnba2RE68iGQpUAD1uk47A=
Received: from PH0PR06MB7077.namprd06.prod.outlook.com (2603:10b6:510:24::11)
 by DM4PR06MB9052.namprd06.prod.outlook.com (2603:10b6:8:46::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Fri, 9 May
 2025 15:50:42 +0000
Received: from PH0PR06MB7077.namprd06.prod.outlook.com
 ([fe80::c339:8c0c:259:de9d]) by PH0PR06MB7077.namprd06.prod.outlook.com
 ([fe80::c339:8c0c:259:de9d%4]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 15:50:42 +0000
From: Jakob Trumpower <jakob.trumpower@matrixspace.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"balbi@kernel.org" <balbi@kernel.org>
Subject: Re: [BUG REPORT] usb: dwc3: Failure to enumerate from boot.
Thread-Topic: [BUG REPORT] usb: dwc3: Failure to enumerate from boot.
Thread-Index: AQHbtgHIe40KI1iUEEu1UTaSuuJEJrO87/qAgAjQYTuAAjUAAIACgqPD
Date: Fri, 9 May 2025 15:50:42 +0000
Message-ID:
 <PH0PR06MB70771B5C2F3FA38E0BC9E2F4E88AA@PH0PR06MB7077.namprd06.prod.outlook.com>
References:
 <PH0PR06MB7077FFC05705A02FD5CB94C2E8842@PH0PR06MB7077.namprd06.prod.outlook.com>
 <20250501001425.ijly3g2knjghvese@synopsys.com>
 <PH0PR06MB7077C939CDCF50DADE0A70F6E889A@PH0PR06MB7077.namprd06.prod.outlook.com>
 <20250508003232.t5bqoqvbmnohpeka@synopsys.com>
In-Reply-To: <20250508003232.t5bqoqvbmnohpeka@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=matrixspace.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR06MB7077:EE_|DM4PR06MB9052:EE_
x-ms-office365-filtering-correlation-id: 53718d2f-11c0-4d34-f67e-08dd8f11412d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?TIOPokM+T7IRZh+np1YdqsrtsAx6aepvNXJyUhCKEH8EDm9VbNdnhPlgAe?=
 =?iso-8859-1?Q?102heqNpptSUOaVog/Z2NM0LAWWgx9W6tH0ix45LLrVNkTsgojM0FkGfYU?=
 =?iso-8859-1?Q?xrmroe0vUQ47TYYd+KinqEa040bLYndudgQVIVZv/+RrPCm/NkivOijjRb?=
 =?iso-8859-1?Q?8PHvyrJT3GXDZvfhrnZmgfjd6zDNftqcjzkXvYijONVaz5iWFR0+uvluDE?=
 =?iso-8859-1?Q?Id9LGXQ3xfDL3eSZV7/WhlMjTE1UVE6A6818baag2a454Zdl22F46UYB3a?=
 =?iso-8859-1?Q?y7j9mqEMOMN2BZgCYCt46DKjNyM2IvIne9B2BxRu3Os4X+Bs4lTwejO2uE?=
 =?iso-8859-1?Q?YYqyxp6VwZcS9SvUOvsgYHiYjiucnr1qEc7LKDzm5lATylOgYBcLS6h4u/?=
 =?iso-8859-1?Q?/urxaianaqkYQw+sJDb6BfsJJtaKcbGaUr12MEv/08h766x5D69DVWSREj?=
 =?iso-8859-1?Q?HsoP3VGUrOxabr3hgwSc5manG6Bg1v7zsJUKdB5mFjgHF5a6NIBJ3H8jdb?=
 =?iso-8859-1?Q?Cc+O1TNp5VwuYd6L3MmmN1X/oLLchub7yc6Sw1yAB2S/5ZCGBRI1rjFHKU?=
 =?iso-8859-1?Q?xuK3q0/dZewMJv5QhZAcOX5OCpHs93IF0aFNYgPNBqEXjTCzCvOluTbeZe?=
 =?iso-8859-1?Q?Cn4pobMORPGxulBGCkwkCYKMV5SNrANlC+0znrLyGJttZRLf/VLQyQuoF9?=
 =?iso-8859-1?Q?eZ7gL2ELVBNOjBvaWWevKM7Qs97HJJ0nYzlZ0yHEHGmchZTfXlK6pp6sLB?=
 =?iso-8859-1?Q?TF4yHacEZCK4h6yRrIEk7c4XtDVNaL1x/CLy2uYxqRrSi/De9k3WvjVmAQ?=
 =?iso-8859-1?Q?/ef2hDExGSGinF39XsZgp9yp96krflrHQRw0UftGGXXGXn0IvnxIGAZfc8?=
 =?iso-8859-1?Q?IFtzpfY2+bDHSkiAAeyKnFe+nbHZd46HuRdUVMTfoAvc1Vx1WyU0i1aX+t?=
 =?iso-8859-1?Q?gYfhjJfX9XkBltAaLBBfcZ2dScm/Z5ZkAmrYCFjdwFqrKlKLc2wTLk62ib?=
 =?iso-8859-1?Q?Lxq7rhPImFSz0Ss0FHh1TiLKlw2GOM4IX5yrNyRxN+yJ17UrE0LdH/WsYM?=
 =?iso-8859-1?Q?69s+Y1iAe+LepCnrUw/5d02KZ6RRC2cIj+S3H5PZVMcFEpJzFWwDurqJCf?=
 =?iso-8859-1?Q?ClaWOsWVFSbllUQ26tMM0FloRn8jBggbjnInpqRJOWQ66Y5xHXMcQbmCru?=
 =?iso-8859-1?Q?JoSoNpv4yOru4zPELnn2vlIojydr4I2g6saLk3WHeuXkssTmV97Zfz3gxp?=
 =?iso-8859-1?Q?SdxvIiWvrAiHZrjRvBV9VJVEv4e2UuohOosRKl91uJ6Ey9E7FSOY0IA3lx?=
 =?iso-8859-1?Q?Cw/AfWRb+Ld7LFbdijbTxkZXeCqvR3qotpF/pxijfT6VOCJNJ0bwe3mwAK?=
 =?iso-8859-1?Q?cXHnWuSG0QAaH8kjOliQtX/6iQZrsYmNpI8taLfO2ZdjU/LOpGZ0uJxvtW?=
 =?iso-8859-1?Q?2gSZquGdhw7HI4pqypBeXaJIG+5LSEgYCZH1MGsKjtqibHuEllCEqXaGKe?=
 =?iso-8859-1?Q?WHFmpeBH5vmyShnI2lkJyNw2w3Yiyuet44UAZdsgnR5A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR06MB7077.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?pgMpnyulpqslAvGFKh9g8Y2Ehmh5KmZXXwO8iolVVsQZdqJsndWbXkHVLw?=
 =?iso-8859-1?Q?EjpMZlgRAx4y5BbcC65qIlipLJ+o8WHsZRocGj1fl1juLDxEtj7+OYFXhX?=
 =?iso-8859-1?Q?Nm8jsa+0ceFkEM3XUcGoqniyIv2jUdNYkr6/FuMGWRyE9bqITX5aYK1cti?=
 =?iso-8859-1?Q?kFDBHj9p2NY3HSXG2/JVQMytIKC+VGwmlw+AfaRVMJuf75q+CLRND4aKcD?=
 =?iso-8859-1?Q?ebB6bujdudPWaIjbZcw3w3ZZ0fiNaUBBZ2BrtT7Eq6nF8yJh9WDa7q6WHn?=
 =?iso-8859-1?Q?eBhVjDKhKIlHN25aeVYO84C0JhXkQZ1Wc6YYgG0084in6ZDqmiIrBkJt81?=
 =?iso-8859-1?Q?AI0gGHjrNeI+S2FXLNv73EpsINGfCVCYHemIYwfSRHxb7lj3SrhRGBrFli?=
 =?iso-8859-1?Q?ecgnnIZx3yCkcvNXRPsaiuEMnG3HfvNz8plKceURgvpOBHCQBo+NfCcjdq?=
 =?iso-8859-1?Q?B0/F4F7GZv/q1dEGFtCNKCWex1q/mMSZXxzwig4B7LF4hpwAVLBBlNeine?=
 =?iso-8859-1?Q?X2ZWAKp9EL9mnxrez+WhGWNGqIz/N5A9bXCzfzI6JDgyioQOLHmUpK8K90?=
 =?iso-8859-1?Q?OVKdwt29wPSRUHgZfb/OgDtiidZ/1AJV6VP6Wl/Vh7oMWUWw2V62anRHJS?=
 =?iso-8859-1?Q?Rqj81J7wBqeBK+E+ro4RAZ+/gT/EdEE/o6z+OqAhPUJEVo9anSQVv9E42T?=
 =?iso-8859-1?Q?w6QNGTSpXQwk2hqGNt9MGXpD60RCDzIm6wLdxbOWaswCdX3tuno6ob90FA?=
 =?iso-8859-1?Q?dytIAgIk5Rm8v2NzT0/EOLgSI5dNkSG9S0+Whqbj0V/yRtvYSIE0d8BrjO?=
 =?iso-8859-1?Q?iINGXZiVCP4bizZTEtSo4rd1WpK4EZnSoD2LpAIpwznPD3e1x6dyXtTEWP?=
 =?iso-8859-1?Q?cdXVOHIDyX1nMPfQ/nPSz0eAwVGz2EiLnq6w50JcEpL2lMofLCYUuJXza0?=
 =?iso-8859-1?Q?nwsaboG2ol2J3wlavFIsTvvDTqFA5NDRA93Vk+ubPrTLmTLPsLoeh82UIt?=
 =?iso-8859-1?Q?A+OfCR8buhWRD8/inPSU5D+RWbCzUp6NHw98I+4G+tf3KZUI6c/blYpAGq?=
 =?iso-8859-1?Q?d6sbySoQ99diJaQgzbWEUDpVHcBxLDMCiNWScbVC4IFvvUHmKL1Kx8ROhf?=
 =?iso-8859-1?Q?3tifbl3nj8bbpRwisARe3hl5m8cq5r+++NHPzfeWTQHR0e6bUIdgLdpDtb?=
 =?iso-8859-1?Q?fvpMSqgisEGezxnsh+4fRCUHQBCjkjTIxh8MJe71YCHlZkG7zDAc1AT7/q?=
 =?iso-8859-1?Q?eVQfwceb0K43wK1iU0wCT6bmb1XrD1t6DrCri5y3Te+JI+f4ftVwb/ViFi?=
 =?iso-8859-1?Q?l/Vp4VxSuh6g2bSQZ9DzssMmOBT/R/ZJzd7fpQtf/P8x+soBKANYkt05aV?=
 =?iso-8859-1?Q?jvbugjq98ySv8YE1bOHMXT9vs+zOjH+vveROwETd7j2oE93AWFTj67+OeN?=
 =?iso-8859-1?Q?tLY/OkU6MAlpzgcSDmiM+pmKYvG3rzHqw/pD4OLFK0SKcyFQtX3I55PNMK?=
 =?iso-8859-1?Q?4hBTuMupdUCuodoxAW6POZDIeMz41lnT6OKTRfZ3ZsIjQfOPzmJ7XqvgJw?=
 =?iso-8859-1?Q?xIICwhCKAFx9lhr7W4PvNrQguaRSDHnkTZXYKLXfYGk8sZXU4KRGoNYBNy?=
 =?iso-8859-1?Q?bqTCmQws7xsjHxhvgQDLUANZqU9f/Rm/CkV3qAWhtk0JA+E7v93Nn7XQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: matrixspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR06MB7077.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53718d2f-11c0-4d34-f67e-08dd8f11412d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 15:50:42.6909
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6a4fa4a1-e2e4-4c78-a723-4ca9e3f43dfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +30y968OCgScmJl+PCZ6ktYAwFDZEPHNUw/238zEFttrI1aWxa6meAxMMZc3t36BH0rmOOOf1k4V82cg5BR/dAU+XOeGtOSFIv1bhld1dok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR06MB9052

Hi Thinh,=0A=
=0A=
Sorry about the formatting, I switched outlook to use plain text.=0A=
=0A=
I removed the reset at init like you mentioned with the patch. As well as p=
ut the quirks back in for u2,u3 disable. I also had tried manually toggling=
 the /sys/bus entries in the past, and would usually see the hub messages c=
ome back but the downstream device would still not enumerate. I tried it ag=
ain with no change. Note: usb3 is the 2.0 controller for the same port.=0A=
=0A=
root@ms-radar-01:~# cat /sys/bus/usb/devices/usb4/4-0:1.0/usb4-port1/disabl=
e                                                                          =
                                                          =0A=
0                                                                          =
                                              =0A=
root@ms-radar-01:~# echo 1 >  /sys/bus/usb/devices/usb4/4-0\:1.0/usb4-port1=
/disable                                                                   =
                                                                       =0A=
root@ms-radar-01:~# echo 0 >  /sys/bus/usb/devices/usb4/4-0\:1.0/usb4-port1=
/disable                                                                   =
                                                                       =0A=
root@ms-radar-01:~# echo 1 >  /sys/bus/usb/devices/usb3/3-0\:1.0/usb3-port1=
/disable                                                                   =
                                                                       =0A=
root@ms-radar-01:~# echo 0 >  /sys/bus/usb/devices/usb3/3-0\:1.0/usb3-port1=
/disable  =0A=
=0A=
Here I am toggling authorized instead and I do see some messages, but still=
 no device:=0A=
                                                                           =
                              =0A=
root@ms-radar-01:~#         sudo echo 0 > /sys/bus/usb/devices/usb4/authori=
zed                                                                        =
                                                          =0A=
root@ms-radar-01:~#         sudo echo 1 > /sys/bus/usb/devices/usb4/authori=
zed                                                                        =
                                                          =0A=
[ 2208.950615] hub 4-0:1.0: USB hub found                                  =
                                                                           =
                                                          =0A=
[ 2208.954440] hub 4-0:1.0: 1 port detected                                =
                                                                           =
                                                          =0A=
[ 2208.960168] usb usb4: authorized to connect                             =
                                                =0A=
=0A=
=0A=
Then once again, I cycle the usb C connector and it comes up:=0A=
root@ms-radar-01:~# [  323.210398] usb 4-1: new SuperSpeed USB device numbe=
r 2 using xhci-hcd                                                         =
                                                          =0A=
[  323.511597] usb 4-1: New USB device found, idVendor=3D0b95, idProduct=3D=
1790, bcdDevice=3D 2.00                                                    =
                                                                =0A=
[  323.519776] usb 4-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3                                                                =
                                                                =0A=
[  323.526917] usb 4-1: Product: AX88179A                                  =
                                                                           =
                                                          =0A=
[  323.530672] usb 4-1: Manufacturer: ASIX                                 =
                                                                           =
                                                          =0A=
[  323.534506] usb 4-1: SerialNumber: 00000000000FF3                       =
                                                                           =
                                                          =0A=
[  323.913798] cdc_ncm 4-1:2.0: MAC-Address: a0:ce:c8:ba:a9:44             =
                                                                           =
                                                          =0A=
[  323.919389] cdc_ncm 4-1:2.0: setting rx_max =3D 16384                   =
                                                                           =
                                                            =0A=
[  323.937168] cdc_ncm 4-1:2.0: setting tx_max =3D 16384                   =
                                                                           =
                                                            =0A=
[  323.951984] cdc_ncm 4-1:2.0 eth0: register 'cdc_ncm' at usb-xhci-hcd.2.a=
uto-1, CDC NCM (NO ZLP), a0:ce:c8:ba:a9:44                                 =
                                                          =0A=
[  324.103396] cdc_ncm 4-1:2.0 enu1c2: renamed from eth0 =0A=
=0A=
Very strange the plug cycle seems to fix the controller reliably. Also to n=
ote that it happens to every 3.0 device I have tested. I have a change orde=
r for our next board revision to toggle the VBUS with a GPIO, but not an id=
eal solution.=0A=
=0A=
I know USB and these controllers are extremely complex so I appreciate your=
 time and expertise.=0A=
=0A=
Let me know if you can think of any other registers/experiments we can try.=
=0A=
=0A=
=0A=
Thanks=0A=
=0A=
Jakob=0A=
=0A=
=0A=
________________________________________=0A=
From:=A0Thinh Nguyen <Thinh.Nguyen@synopsys.com>=0A=
Sent:=A0Wednesday, May 7, 2025 7:32 PM=0A=
To:=A0Jakob Trumpower <jakob.trumpower@matrixspace.com>=0A=
Cc:=A0Thinh Nguyen <Thinh.Nguyen@synopsys.com>; balbi@kernel.org <balbi@ker=
nel.org>; linux-usb@vger.kernel.org <linux-usb@vger.kernel.org>=0A=
Subject:=A0Re: [BUG REPORT] usb: dwc3: Failure to enumerate from boot.=0A=
=A0=0A=
[You don't often get email from thinh.nguyen@synopsys.com. Learn why this i=
s important at https://aka.ms/LearnAboutSenderIdentification=A0]=0A=
=0A=
Hi,=0A=
=0A=
On Tue, May 06, 2025, Jakob Trumpower wrote:=0A=
> Hi Thinh,=0A=
>=0A=
> Thank you for looking at this, here are some answers to your questions.=
=0A=
>=0A=
>=A0 * Is this a regression? (has this issue always been there)=0A=
> The issue would happen occasionally (cold boot) on host hardware, however=
 the=0A=
> issue is consistent with OTG hardware. They both manifest in the same way=
, as=0A=
> in require toggling VBUS for the device to enumerate. We were on a kernel=
 from=0A=
> 5.10 before and the issue existed then as well as now 6.6. I also tried=
=0A=
> mainline USB stack mixed into the old kernel.=0A=
=0A=
Ok, so this isn't a regression.=0A=
=0A=
>=A0=A0 * Is the regdump captured after bootup with the cable preattached?=
=0A=
> Yes the regdump is with a cold boot with the cable preattached.=0A=
>=A0=A0 * What quirk did you try? (did you try "snps,dis_u3_susphy_quirk" a=
nd=0A=
>=A0=A0=A0 "snps,dis_u2_susphy_quirk")=0A=
> Yes I tried those quirks, although I don't think they would help since=0A=
> according to the USB spec to get to U2, and U3 it has to get to U0. It ne=
ver=0A=
=0A=
Unfortunately the naming of these properties are not that great.=0A=
The "u2" and "u3" in the property names correspond to usb2 and usb3; not=0A=
the link state U2/U3.=0A=
=0A=
These quirks prevent the phy from going into lower power when in lower=0A=
link state, not preventing link state change itself.=0A=
=0A=
> even gets to training/polling step.=0A=
> I also tried all of the dwc3 quirks in snps,dwc3.yaml one at a time as=0A=
> appropriate.=0A=
>=0A=
>=A0=A0 * Did you try to configure the driver with USB_DWC3_HOST instead?=
=0A=
>=0A=
> Yes the host mode version of the product has that configured, I also trie=
d that=0A=
> same kernel on OTG hardware and the issue is the same.=0A=
=0A=
Ok.=0A=
=0A=
> If the regdump is captured after the connection, I see that the current=
=0A=
> PRTCAPDIR is still in OTG and did not get switched to host.=0A=
>=0A=
> (Note: I'll try to see how much I can help here, but the controller here=
=0A=
> is quite old and the kernel isn't mainline. This will be difficult to=0A=
> provide accurate feedback on the downstream code.)=0A=
>=0A=
> Understood, thanks regardless. My biggest question is around the current=
=0A=
> solution, can you make sense as to why toggling VBUS after the driver pro=
be=0A=
> would have everything work as expected? I think that rules out a lot of o=
ther=0A=
> issues and is quite strange.=0A=
>=0A=
=0A=
Looking at the trace, looks like port fails to enable after performing=0A=
port reset. Can we do some experiment?=0A=
=0A=
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c=0A=
index 62c74ba7bb53..e047a4e50b82 100644=0A=
--- a/drivers/usb/core/hub.c=0A=
+++ b/drivers/usb/core/hub.c=0A=
@@ -4883,12 +4883,17 @@ hub_port_init(struct usb_hub *hub, struct usb_devic=
e *udev, int port1,=0A=
=A0=A0=A0=A0=A0=A0=A0 if (oldspeed =3D=3D USB_SPEED_LOW)=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 delay =3D HUB_LONG_RESET_TIME=
;=0A=
=0A=
-=A0=A0=A0=A0=A0=A0 /* Reset the device; full speed may morph to high speed=
 */=0A=
-=A0=A0=A0=A0=A0=A0 /* FIXME a USB 2.0 device may morph into SuperSpeed on =
reset. */=0A=
-=A0=A0=A0=A0=A0=A0 retval =3D hub_port_reset(hub, port1, udev, delay, fals=
e);=0A=
-=A0=A0=A0=A0=A0=A0 if (retval < 0)=A0=A0=A0=A0=A0=A0=A0=A0 /* error or dis=
connect */=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto fail;=0A=
-=A0=A0=A0=A0=A0=A0 /* success, speed is known */=0A=
+=A0=A0=A0=A0=A0=A0 if (!udev->config && oldspeed >=3D USB_SPEED_SUPER) {=
=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 usb_set_device_state(udev, USB_=
STATE_DEFAULT);=0A=
+=A0=A0=A0=A0=A0=A0 } else {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Reset the device; full speed=
 may morph to high speed */=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* FIXME a USB 2.0 device may m=
orph into SuperSpeed on reset. */=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 retval =3D hub_port_reset(hub, =
port1, udev, delay, false);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (retval < 0)=A0=A0=A0=A0=A0=
=A0=A0=A0 /* error or disconnect */=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto fa=
il;=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* success, speed is known */=
=0A=
+=A0=A0=A0=A0=A0=A0 }=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0 retval =3D -ENODEV;=0A=
=0A=
---=0A=
=0A=
This avoids a port reset during init. This is a bit of shooting in the=0A=
dark here without probing into the internal signals.=0A=
=0A=
And if that doesn't work, try to disable and reenable the port:=0A=
=0A=
## Check whether the port power is set:=0A=
# cat /sys/bus/usb/devices/usb4/4-0:1.0/usb4-port1/disable=0A=
=0A=
## turn-off and turn-on port power:=0A=
# echo 1 > /sys/bus/usb/devices/usb4/4-0:1.0/usb4-port1/disable=0A=
# echo 0 > /sys/bus/usb/devices/usb4/4-0:1.0/usb4-port1/disable=0A=
=0A=
Perhaps that gives some more clues to look into this further. The path=0A=
above is just example base on the dmesg "usb usb4-port1: Cannot enable.=0A=
Maybe the USB cable is bad?". You need to change the path to the proper=0A=
usb3 port location should that be different.=0A=
=0A=
BR,=0A=
Thinh=0A=
=0A=
(Side note: please use text only format when sending email to the=0A=
usb kernel mailing list. Avoid top post if you can. Thanks.)=

