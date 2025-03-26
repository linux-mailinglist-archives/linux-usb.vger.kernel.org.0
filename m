Return-Path: <linux-usb+bounces-22179-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D05A71B77
	for <lists+linux-usb@lfdr.de>; Wed, 26 Mar 2025 17:05:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30FF41888320
	for <lists+linux-usb@lfdr.de>; Wed, 26 Mar 2025 16:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B61D1F4E49;
	Wed, 26 Mar 2025 16:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b="DjrV2SMb"
X-Original-To: linux-usb@vger.kernel.org
Received: from outbound-ip8b.ess.barracuda.com (outbound-ip8b.ess.barracuda.com [209.222.82.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB941F463F
	for <linux-usb@vger.kernel.org>; Wed, 26 Mar 2025 16:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=209.222.82.190
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743005003; cv=fail; b=odS6rx9I/AcNjx/F99v6htzbKOYr6xyvTaOQDHylhlhvUu/7B+k5nTI4DbsAt4sgr78JGw0lnxhi0VeyknWI8u8KyqA0ZirXjFWM7zV6Zt5F4s00puh/bZu/sNiQxXSnIoCuucavb5mRxAuxAvzqoVNGzfzTOwxL9KSQQbhule0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743005003; c=relaxed/simple;
	bh=gGpiMgUrF8mEDlFcFawCEDQjQ8h4OIDXK+tfR7U7EwY=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nuGiqNJPdEgAh1fTdMw4h1idWmWrxcgdeIdT75L6kdO2Cj86EGs2L2l6rH4jANwNVw6a0sWZuW0uvCxv9nsc7Qszm/9C5sl1Z4Zx7femd0VeAVJD69kzDaKhZ93c8N3Z1JPA0OoByMDs7dV3eFR2g6efkyT7aS+WshpldYCB4QY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com; spf=pass smtp.mailfrom=digi.com; dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b=DjrV2SMb; arc=fail smtp.client-ip=209.222.82.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digi.com
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2044.outbound.protection.outlook.com [104.47.73.44]) by mx-outbound21-52.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 26 Mar 2025 16:03:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWHpI2LZJ+IMZy61m5YAkh+Gf+B8eGiLwKHap6q1ZYPbdTVSCOeJK6NzKk7YasCMxma20NsX/hfuskamzqigA2juXBPxQ7Rh10IZ4C3Foo3PT64UpsiMIMqTNitSP6od1Ez2zcQz4Ks0clVFq+Yz0mnn9PH7TQvXHOhYij8gTSXhqMunkD8JcUtI23Pbd1JvNikLXuNRVXcVN1AhSnsKvks+R3SLJ9GEBmaePhKEmz2CC4lqJgawDR2xqF4+3C3lyN66hIgWvmkvNILH2gZYwESwTkFuPGT0WCWFManJFnd0Z4n12Ce1miifU5epG8NUMUjONVy+uQUhscxBolys9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEWCl9QZhsoZRuuWVyALVVnlTLWHxrXy0kFJxhJQ9MQ=;
 b=sjds7//EKTQizK5fEgwyfAmKl6vfmoy49q1Uw9bH6anMxYUs2FqcFnWmZ/Y6e7VD7Cc2Q/YcW9fgGZj5HbVp55vy/wMoNlMLTcY8j6BhWQVq5ysG3DvvcFXG6OGIKJxV55j3wt17/H4KVwpQNL4bn8B0Nasj3i5/uyLoZ1gZUMkWF71FLd9ljundYVFWdHASFaqIOf2koPs+n4u/A4PS+wjzFnJY1IXZdYxuttIDPQvPWlgJOLls7FAyuf1WqBAyyojz8USQCasgIImSIRxZfIqEgdJRyrouhGPH4G+RgklI04VhVN9J6kAOSLaUhgpjww16KG35Kfik9K8ZSa2eGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEWCl9QZhsoZRuuWVyALVVnlTLWHxrXy0kFJxhJQ9MQ=;
 b=DjrV2SMbJ2uiBDAUF7PNh9eapEes2YR6y8CK4tM/9Xg8VNT+FeHB0H16lEOvNK2clTB1TC5DuLdltB/HtZWNIDaR+fQQa6pUgP/8E0Fq/P6/cDxMgky6UDXaEbccI18QhV/nuhdMDuqa4ZFHWcXeQm9DEKgooTEg2Az9gBz/avTdXZ5W9C4wdFEgvoGRoGhHRrQt4sabZn3w+lyeBU6qsU3l+rPZ2Erl7s+qsGM7ZkiGg/lbnFhVWH3kXt2qfbQbJfhCAKHzLWL7uDffPr3fpvF3Z5bduRrokxp9W4WfGONNurvcLxaKRRHnkwBssNK+WaTUiP0R3KTkYiTv4MMr3Q==
Received: from CO1PR10MB4561.namprd10.prod.outlook.com (2603:10b6:303:9d::15)
 by PH8PR10MB6669.namprd10.prod.outlook.com (2603:10b6:510:221::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Wed, 26 Mar
 2025 16:03:04 +0000
Received: from CO1PR10MB4561.namprd10.prod.outlook.com
 ([fe80::ecc0:e020:de02:c448]) by CO1PR10MB4561.namprd10.prod.outlook.com
 ([fe80::ecc0:e020:de02:c448%4]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 16:03:04 +0000
From: "Hodaszi, Robert" <robert.hodaszi@digi.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Handling incoming ZLP in cdc-wdm
Thread-Topic: Handling incoming ZLP in cdc-wdm
Thread-Index: AQHbnmX9xdeooQQw5kWb4NorX+lXjg==
Date: Wed, 26 Mar 2025 16:03:04 +0000
Message-ID: <bd07dc48-d6f5-4a95-9dc4-c738640349d1@digi.com>
Accept-Language: hu-HU, en-US
Content-Language: hu-HU
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_6422b22e-4331-4b6a-b9e6-d9947ce1a902_Enabled=True;MSIP_Label_6422b22e-4331-4b6a-b9e6-d9947ce1a902_SiteId=abb4cdb7-1b7e-483e-a143-7ebfd1184b9e;MSIP_Label_6422b22e-4331-4b6a-b9e6-d9947ce1a902_SetDate=2025-03-26T16:03:04.095Z;MSIP_Label_6422b22e-4331-4b6a-b9e6-d9947ce1a902_Name=All
 Employees
 (unrestricted);MSIP_Label_6422b22e-4331-4b6a-b9e6-d9947ce1a902_ContentBits=0;MSIP_Label_6422b22e-4331-4b6a-b9e6-d9947ce1a902_Method=Standard;
user-agent: Mozilla Thunderbird
x-mozilla-draft-info: internal/draft; vcard=0; receipt=0; DSN=0; uuencode=0;
 attachmentreminder=0; deliveryformat=1
x-identity-key: id2
x-ms-exchange-imapappendstamp: CO1PR10MB4561.namprd10.prod.outlook.com
 (15.20.8534.033)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR10MB4561:EE_|PH8PR10MB6669:EE_
x-ms-office365-filtering-correlation-id: 069f98f7-1f89-4075-9239-08dd6c7fb10c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-2?Q?qHLPkC5xhvI5CnE+jrLmamsOj+TYx+rwnKIUnW39yoMQ7I06BjgdZtyw6r?=
 =?iso-8859-2?Q?5ox8WPBiN8hZe2rqYLWEpMFwMSXyj2pxBGvo2zfC+bw94N6T1R1oSIrSoT?=
 =?iso-8859-2?Q?azRh7NO125pnKh9Le6vsyV8tJP8VQRXhpP4elA4eR8jzSv6L1mORAibgkY?=
 =?iso-8859-2?Q?J/u9FPEwaNlnh1gWfOeFtFGKese85WPJPbCpYrlvbRdmsQ/wf2lL4oxuux?=
 =?iso-8859-2?Q?AGUNiPx6zG0VyYlyInPQAo/AUh7tpg7Y0jwKl7POl5wWO3NQzHi+C3QrWO?=
 =?iso-8859-2?Q?0Shv6D14b5GBLdlS4bTFE9QbtWIcIGB20kRRIgprAf1oyvdlSVzLGfKxX/?=
 =?iso-8859-2?Q?pgb+dMRA58O4CDMnlV2GnFHYNEjj1d4d+EA8qbJ2LiuwPqR9EKSHQ4AIQ/?=
 =?iso-8859-2?Q?dcoMbfm8S8fqGoyBsCHXyJLc4wupNI2TxHlgnJMPrFP0e8UWuYNksSXBvE?=
 =?iso-8859-2?Q?J8z0tPQNsZRPH6iieLWgFngbVkFHm7+wyEFl2LZHTZvL2JZXWHZX9J8XKQ?=
 =?iso-8859-2?Q?TiyqMnJXSR7tsw8U9M0RSDVVDe48F7FkiVgckkZqNT7TkYKDVtHJLHDISS?=
 =?iso-8859-2?Q?aLqsfvGBH/K4IHiyXJ39Xy+FAwR6UU5O0zCCuXsZB9JwuNduvTYrHvfGJS?=
 =?iso-8859-2?Q?SFwmKe6n7yGxuStKKrOfwKt/F81h/xf2rtU7f7d5Cxlvdhb8w3BGqpldHi?=
 =?iso-8859-2?Q?uHqbU/mQo63y18Gw0NOXUW5kUYRmZkzEnPYdPX1tMTRQxPbxB8CHfYc74C?=
 =?iso-8859-2?Q?tDDGYw8fML+726DD6oYQqG8nCtgagcWhblWRKF/L+F9HNhEc/hj9B07yR8?=
 =?iso-8859-2?Q?QWwgKz+9WjzV21YQcs9yBlLJIwtgCQqpsBITo8bbxmLOcJ0mIQrEqnIxk9?=
 =?iso-8859-2?Q?xIGK1XFEICe//TKLSZMdgMRvjX1mjHIIVpyRCPE8Tqxzo/8JTxay3ETuty?=
 =?iso-8859-2?Q?VtWLj3yBdrFO/vA1M1DFl/uDrWLMhQYv9Si49XlZgEU9hmcG00d/U2MwDh?=
 =?iso-8859-2?Q?aucekRDr/2HSrrtCcUKcww20M0fdIHXKoQ3RuebSV6UWjQ+Bp90P5FpFwT?=
 =?iso-8859-2?Q?X0oLS138x6y7MJ6S6Cm7UW53GPFL9vkSUQUbeS42Fb0aIH+26J0ZQIYSBR?=
 =?iso-8859-2?Q?/CI3gp8I3Xq0czAO2uQ2BHznd6AMZPGZAqjc09Jd98/mfVtEIETmhCtoVi?=
 =?iso-8859-2?Q?KC6H0Lga2wVoEkSDiL06F3rK7VgkWcdJ+RcuG1xLeJ3rjRfj3skaTyp0ha?=
 =?iso-8859-2?Q?+cZiQ0ee/9EdeqXso8bCva3c1CFntMsqFzTEd9huLrZ89CRx4I0VRK1BsZ?=
 =?iso-8859-2?Q?HYa3CCUvIXN02F/59fNNKERFsnLQ/5Oxzy2/A0jSdAwxt3RNsWSRO9wHqs?=
 =?iso-8859-2?Q?tTxgnjnC7Z+Vlk5ycqSPdQrbyKZSqLAWANfPiFK8B4Sa+ifCsYcz8EnpnO?=
 =?iso-8859-2?Q?8UU3Mu+J91MbxbZK2Uf0NoLqDluuLF42eVCmOR7JSYvREGEv0ZFRtIWB/V?=
 =?iso-8859-2?Q?kNvrAEYXJ4J7uZ4B0OnfBn?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4561.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?enqTdIKjL16hIPBs7SRxxgGC9OUkqK1gzlTDsVGKNGdcauKAA/f6yncWqU?=
 =?iso-8859-2?Q?aM1MevD0OclBa6HCETJcLR3fWBCZAz5O8FvLxrlqos161PGTDiKPC2HOjc?=
 =?iso-8859-2?Q?Npu1Ccs5MxsZBFToKQa7iuKHOgMrTv/xSqzITaY1cr+dsS2D9ze4Rf8CV0?=
 =?iso-8859-2?Q?NqiOvBpZvpIufP53yOhpnFwYY9h6CLFi5Ah0FKhranK2pEydwLkXbzgNxh?=
 =?iso-8859-2?Q?axJ2BDl6YmR12FQ+kZjNv0VlhDu6vvxW5jm7fDYASm+FSDEj08TV/AAw8q?=
 =?iso-8859-2?Q?1xwBrPokYW6yfJ4IA4kawrVarQHHgIs0+qCDxfXsyP17peZNAtq9kkrNZa?=
 =?iso-8859-2?Q?7ZiH4fuv1mP7cz1G9+0MxvEHIXvqeZVR2EAgJk5Z1TZD/i2qJ0FTftjXrY?=
 =?iso-8859-2?Q?USBIhU2KjHXhfMC/ICjVLHbdk6k9Vl6E10Ulmixu/oVooQCMzBluZDlDGe?=
 =?iso-8859-2?Q?fWq0m6N4sQcHyDOMj6hyBGwNGSWux2CLp39bYUCNA8QAfZZOaxrmxbI7yL?=
 =?iso-8859-2?Q?n9iGKllKh3ypbLb5Wc+zcsxfyLTWlM7dYTm5koT/awlFsnQhuN9h+oUulz?=
 =?iso-8859-2?Q?+GMz2zezwIvPsjYo0i+TqsRw6TBGgOINQYnCP//ppglJe/IEpRmOkzE+ko?=
 =?iso-8859-2?Q?F3w729fX+svp1y6p6mA90BE+SRkpTao06zIWXLrclzN33xp3rg19olrdRG?=
 =?iso-8859-2?Q?Ix8XLSxliKSFafqAYBaa/MK4IZgouUIXVIc2eBdsP7lFUgtVeFnayqr5qf?=
 =?iso-8859-2?Q?jhrVjlXZsDrJ136Zq/heSV8lBC6sK4HS6fglYb0yftS0ebfA61H0j2GaxX?=
 =?iso-8859-2?Q?FMfz+kWw8bUA1Hz7ByF4+EwDiS9OMXBc3uqGb+xGyhWc7fhKwaVAVKEYvM?=
 =?iso-8859-2?Q?WyKV82bmnkUaYPU1N+YJI8mIkBJg44NE89fEMsO8uV0TNeQ1J8qnxG3IHZ?=
 =?iso-8859-2?Q?uGVuqsIN+Ym/gxCt9NTKnH1tTshZBDXHg3JM80GKl6Lr50Dt49wFMs3mRT?=
 =?iso-8859-2?Q?DPPr7FOv1HuRFgOY5E337BVvWWFvH9YFkIBnqeyQCIckQE0LkBJJUGfYbq?=
 =?iso-8859-2?Q?jPSxM6eFhTbHXpvdVDduPh9AJLdK8IJiJ/BNh8eWa8loxDWHTJr382hSfp?=
 =?iso-8859-2?Q?0lodpvmYtk9NX4h/oVw4rg4SN7ZxmDVQKnaXhegLjSgDFLa6LolDVu77BA?=
 =?iso-8859-2?Q?r+4hdw98otEZrOiozEuLO7Ispu9vCIZPvTf85Oy8vVzA83QBWWYvBEV2rg?=
 =?iso-8859-2?Q?fpKnbYbq/fntP217QfFWgTdMuJ0+RKZdX5YQarDHFUhcfC0qVxhKcH915p?=
 =?iso-8859-2?Q?M9rwg7+E9nW0BEO5WGlvgv2tmJc+n5qLdmELH8WKollcTaJW3/QbmQI/F2?=
 =?iso-8859-2?Q?7Kvih2MI2bLPdJbLPK/KjOOWVp1CnnkqJG7QvQCo+Mb7JXlxwss8zmyx1+?=
 =?iso-8859-2?Q?2dvEbceSVp/qOWEMCLzvr6YpbUt/l3KZzt6qNExxBhqH4zVkzplVHTAwE4?=
 =?iso-8859-2?Q?p6pmkEGEq7s4gAzfXO57RcEYkatFAq/lkPCUljnRf969EDSef+wm0soTZa?=
 =?iso-8859-2?Q?WX3qevCZqcOyOx6tuuM+6Cekwsngx7U0zx/ITRYfoUF6LSe+gsE8d4pTc6?=
 =?iso-8859-2?Q?yZ6by1L35OPBY=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-ID:
 <0B79BE504696D14CAC94566817D428AB@digiinternational.onmicrosoft.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4561.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 069f98f7-1f89-4075-9239-08dd6c7fb10c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 16:03:04.3152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mYkOuoYG9GPiQST54x1tT1mFao2v09oc84sNAYeZbOX2Lk8SdbFS9QIX2mVjUc1HeIIosn/xMjFCiRh9rsOCGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6669
X-BESS-ID: 1743004989-105428-9859-12291-1
X-BESS-VER: 2019.1_20250319.1753
X-BESS-Apparent-Source-IP: 104.47.73.44
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVsZGBqZAVgZQMC0lzcjCJNE81c
	jIINXA3MLSMCUt0djUzNLE0sw4NcVcqTYWAEOx/T9BAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.263435 [from 
	cloudscan23-155.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1

Hi,=0A=
=0A=
(Sorry for the long mail, but want to describe exactly what is happening!)=
=0A=
=0A=
I'm having a weird error with a certain modem (Telit LE910C4) + ModemManage=
r. In some circumstances (e.g. SIM switching while there are some other ong=
oing transactions already from ModemManager, or stopping ModemManager in th=
e wrong moment (again, ongoing transactions)), I can make the qmi-proxy stu=
ck, and can only SIGKILL it.=0A=
=0A=
qmi-proxy gets stuck in g_unix_input_stream_read() in glib.=0A=
=0A=
ModemManager tries to read an incoming message (/dev/cdc-wdm0), so it calls=
 g_pollable_input_stream_default_read_nonblocking() (glib), which first che=
cks if the stream is readable with g_poll(), and if there is, it reads the =
data in g_unix_input_stream_read() (glib).=0A=
=0A=
What g_unix_input_stream_read() does: it polls first (uninterruptible (EINT=
R) loop, this is where it gets stuck finally), then reads the data. If the =
read function returns with EINTR or EAGAIN, another loop starts, and goes b=
ack to poll().=0A=
=0A=
When the issue happens, the modem sends us a lot of zero-length packets. I =
see a 10+ INTERRUPT_IN URBs, without CONTROL_IN URB, because qmi-proxy is b=
usy with close the connection (sending CONTROL_OUT URBs, and doing other th=
ings). In the INTERRUPT_IN URB's last 4 byte (cdc-wdm driver doesn't handle=
 that), I can see the exact same number. I guess, this is the frame ID, as =
usually that gets incremented. So I think, modem tries to inform us about a=
 pending message over-and-over. That's incrementing the desc->resp_count co=
unter in the cdc-wdm driver.=0A=
=0A=
Finally qmi-proxy gets to the point to try to read in data (and call the af=
orementioned g_unix_input_stream_read()). But the modem is only sending bac=
k ZLPs, I suppose, because it informed us multiple times about the same pen=
ding packet, and it doesn't have anything more to send us (and it makes sen=
se to send ZLP in this case).=0A=
=0A=
The problem is, wdm_poll() always return with EPOLLIN even when wdm_in_call=
back() receives a ZLP, as it sets WDM_READ. So it makes sense for glib to t=
hink, there's a pending packet. In wdm_read(), if the packet's length is 0 =
(desc->length =3D 0) and WDM_READ is set, we reach=0A=
=0A=
    if (!desc->length)=0A=
=0A=
line, where it puts out another URB (as the resp_count is not 0), clear WDM=
_READ and go back to "retry". The second time we test WDM_READ, it is obvio=
usly not set yet, and as we are reading non-blocking, the function returns =
with EAGAIN.=0A=
=0A=
And that is the issue here, as glib in this case thinks (with reason), that=
 OK, it has to try to read the packet again, so it goes back to poll.=0A=
=0A=
Then another ZLP succeed, wdm_poll() returns with EPOLLIN, glib calls wdm_r=
ead(), which return EAGAIN, etc.=0A=
=0A=
Finally modem runs out from ZLPs as well, and has nothing to send us, so we=
 just wait in wdm_poll(), and we cannot even interrupt this loop, as this i=
s a non-blocking call, and EINTR is disabled.=0A=
=0A=
-----------------------------------=0A=
=0A=
I think, that should be fixed in cdc-wdm. So I'm wondering, what is the rig=
ht approach here? Should we just return with success with a 0-length packet=
 from wdm_read()? Consider ZLP as an error in wdm_in_callback, and schedule=
 service_outs_intr work, like if desc->rerr is set? Other?=0A=
=0A=
=0A=
Thanks,=0A=
Robert Hodaszi=0A=
=0A=

