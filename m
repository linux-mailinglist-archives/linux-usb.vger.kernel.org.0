Return-Path: <linux-usb+bounces-9464-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C69FB8AA031
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 18:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C5E52840BE
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 16:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84ECE16F8EC;
	Thu, 18 Apr 2024 16:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b="aZSXFH31";
	dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b="EKQ0IQrL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0068d901.pphosted.com (mx0a-0068d901.pphosted.com [205.220.168.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A5C146D6F
	for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2024 16:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.168.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713458115; cv=fail; b=t/ZfXEtLVFCiIUsROwlim1pACsFZk5TFTELPDh/CaAyLVoJw4lVciXIxvsDS3zEHgEy6AMaqlZkWmG/tZClioP3+b3BdoB/gdl97HMJdgto7zLlN8f3CHnmNUIxxA8K9JqjWjcKdtv05jYWbkAyxMxt7ezOmNU0cMfFAbeWaaz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713458115; c=relaxed/simple;
	bh=DHEmQLoqwQixB5pGeEIYdol4myZa1wiN+0kCOeZTpoo=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ULyc+HtyUGDeGl4IFEEQV66P+fYBGlIDtpCk24n8SJh8TkGQ1iWTZZaflOYN1UG8RAFeH9zsYvHqyUB0KVo+IP28OOoz9Xm7Ob2jeafxTyv4TMvyoIbp0i6umQmMJr2L/Mz2cb1G521vnZ0Yfe+TRa8PohurUQ/irwSfjShEVJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=biamp.com; spf=pass smtp.mailfrom=biamp.com; dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b=aZSXFH31; dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b=EKQ0IQrL; arc=fail smtp.client-ip=205.220.168.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=biamp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=biamp.com
Received: from pps.filterd (m0278264.ppops.net [127.0.0.1])
	by mx0b-0068d901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43IB22B7007442
	for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2024 09:35:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com; h=
	from:to:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=proofpoint; bh=SM7KlA
	pvK4QcCyWPRXcw/e0Wk5+OSLJYXgKHbqLstdM=; b=aZSXFH31CxkC7QVyjfw8VS
	HTUbS+2L637Fh73m7c3Hgws5uEIKccttEWkfrQfIl6417zGp5FQTKGbfHjLEEPjO
	4EiN5FcD9kLB3gXlrT0d7LFA5vNLabJtl+lPktIvLaOGtoax0++079UrBbjhyGiZ
	yQ/6bouFVruhp3a7Z1lDWDZMfsl3gaa94T89B3Xv8xyLCvU4In7xnZnYq402FQov
	MMQD/t75MRZn91lyPY2s1EhAr/g//wLiUXudSOzscm1LVT4RWeRPO9k1feTmq9ZI
	DsuJRjrD7wDVTb0jmhz33gSvd+cfQaRj/4ffPvdzNMO4YWZqqRCFQk04kNbT39PA
	==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0b-0068d901.pphosted.com (PPS) with ESMTPS id 3xg09r3eht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2024 09:35:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T15/GX7oVIH/D14mgGZO1yG5QGzdlkRu7Rf52y3ZLtMEbj40y+xYG42vnQfQrRoq4Z4V+bfv0i/MHl1kN7rEfeRf1B0ylpl+x3XmYcsx9llMvlO/9xck7msqLmtI5pRJNiLFqaYNH36gk2JZTEjxfotGXm9FyNb8Q1XaoRjI1qWNot9T6jVU1vLWSbMicAobPUevFjG3XSyQk3GJllcImwGD9bhT4fGJnWto3TBr3xs4vND699yXpgFO04nqyOclWYSl3oKFxcGirSZHTXJeMYcQjJ3yaAWJH3X7yOsfH923gVIo2N+bSEH773uClgKNUawc4/YeKqx6S6Z8ywM+FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SM7KlApvK4QcCyWPRXcw/e0Wk5+OSLJYXgKHbqLstdM=;
 b=McihSsYgM4Yg3WbpjUvAqaSmftgtIJLYuhEKlqiGoyym+HFSX1vC8hOAHeQkahanzSzvdIeyqApqKaWuJlA8+8yl1VK+xFD/qLIRbTylJbF6LVD6OzhrSFuA1Jy9kJd1GccAQNChkFvPJQDnVmhS4JTuAiseGWlgUvEsog3EBhEXmQFSf6CMppQPzLQrOKzoDbGquOYD6AfZluNSYWSCKr0dp1wnmYqXFJwIHjK81GrVQXj0gtFatg5qM4nwCVOkEf+WBtvokT9oO/qG/iaECRpQZr3ezV8hdt6ebZhgfnhn71WkSDikAAUlQS3poloz4LqpiKY/chBnKixEK2R8TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=biamp.com; dmarc=pass action=none header.from=biamp.com;
 dkim=pass header.d=biamp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SM7KlApvK4QcCyWPRXcw/e0Wk5+OSLJYXgKHbqLstdM=;
 b=EKQ0IQrLpzvE+1QRbG6O4U+NeTYFPgvXpJfBA9LfIgfzlf2gJ0ZT5/+k94liiCQFYoyouae0Sa5S/km4ldMfJS/ViocQo6rQNfc/hJXmaOJGVsnR99p7agHPNJ5ySZqj062hlKWWYogo7gyf8qoFJ8EM4aBuCh3mKlPbmyEbuBnpBWf1OdfBMmPOjRPdjSZnHw56qz4NDTWVZOidpB5hNwvUFLrLZC4MVFe7EAulTE1WsRTAtn1HznFPJm8+RfTSG9BC6N1X702PNeK6GXlE+F2cB5Q+/NFU3jH5g3Njnsrfq2Sb9ht/mJ+2Rup8ABo4HGNFrEnQtriaV+FwdNwxmw==
Received: from CO1PR17MB5419.namprd17.prod.outlook.com (2603:10b6:303:ec::17)
 by BY1PR17MB6831.namprd17.prod.outlook.com (2603:10b6:a03:524::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 16:35:07 +0000
Received: from CO1PR17MB5419.namprd17.prod.outlook.com
 ([fe80::f48:ee61:a81b:d555]) by CO1PR17MB5419.namprd17.prod.outlook.com
 ([fe80::f48:ee61:a81b:d555%4]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 16:35:07 +0000
From: Chris Wulff <Chris.Wulff@biamp.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [PATCH] usb: gadget: u_audio: Fix race condition use of controls
  after free during gadget unbind.
Thread-Topic: [PATCH] usb: gadget: u_audio: Fix race condition use of controls
  after free during gadget unbind.
Thread-Index: AQHaka4lVhUzwnyW8kqaey/gOsvPVg==
Date: Thu, 18 Apr 2024 16:35:07 +0000
Message-ID: 
 <CO1PR17MB54190B898057616EEB3F9E51E10E2@CO1PR17MB5419.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR17MB5419:EE_|BY1PR17MB6831:EE_
x-ms-office365-filtering-correlation-id: 6077b95d-85b2-4fea-79ef-08dc5fc581ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 SjMCNGeiLPF3dZ0w4FHMz2E/NPa54YwpnTtXVJT74nNkJc/Rt5TuUkhclElXS7kHpcZExTdhNcCOXjOcD1rn5S7c1dtphZ0QL2resWeIlOtu4MjID6ngVaLBq60eh1LVUer+ZdCGQKvZYvCA7lA7t6anbkyjmwdjz/dN+oh2BSv8i6zemK/x8K/HNRC/QKLkl1RmVymStxmkcystvMoy6IUKeI84uHeD/5RTK6aXcWsBHNVUFsMMxnUXMECn0Oqu5zdITsH4fp/P5YdP1mU7Bx9ddmWuTHU8xM3mpmeatgeUYALulhYXxvfti2VEKkCkAxePHuK8VyXXxYW9OYIgOurN3b1TOWf9MRO/cM/JvegqNwcx/2gzAXydrQoZIFhNmkFB5wxekwt38HjBVxEcmKVLVFneTE2iH1qgFobghyp0/YaC4IU1ZMxWU172IS24vAZ7x6mihKZR7EFidGuxjAqnKKDBY2JHAW8lSR8VYOXx1HqGC66+dKZhIxOhlvkcq/nU3+UTp/rc2yRbWyW1/bxb0k9d3+cKzHE7HaGiG8Gx5Ed+dqD6rn1ero2TpRKRrTpJxlOMJSE90hh3s2iC61u3AbpnUZsoYuof3a6T+YUIoetk0iD9KdjB4/25DijZse+fJJkyStAzTbmfJyEky9+b71ilxm/em0IHdZgwDAyx5uTlTh0pk/fnq5Tsao3NiPbJmKjfhS0K6XI+vbTyFbLvEyDq1kLToPRHF+VezOI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR17MB5419.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?HOLQ3G2LXiW7iVyMclikx6DlUW5UvB46MffsGlWlEwAJNaOhIVLtA5rxAO?=
 =?iso-8859-1?Q?LTegRCRmfxI7mFDSlDZ71SXKJSUdzpvD9otFEjN7A7Su5vn/9eOIOi7tGd?=
 =?iso-8859-1?Q?gMIlVSnVPcI1YeTYRvrMIXC1Y1jQ/cQN+1hBR7yLcvho66OycaLeFmuMkS?=
 =?iso-8859-1?Q?Cnw2qCLqnQqfzhvfbTCZq3OrmRZhOV+t9Aa3TejiH+BKfh5AhX2xMRuv92?=
 =?iso-8859-1?Q?BFzHmwikOSKO5NVdYPJMrzXbjCCBcO1e6T0MdyjVT1+P0E+9QKR7my2sxO?=
 =?iso-8859-1?Q?tk1JYuJqj46hlsys+d/Y5hgByJ6FNzUUkHCcp6jsqrfqlQLfYziXtXHDnM?=
 =?iso-8859-1?Q?Ei8i5tONMVv+r5GrAArThHq8ojCiMniOF6wfGe/ohX0UcWTtd1u5GZ7nxR?=
 =?iso-8859-1?Q?mxJSo0CFAguny568d6QfxsA9hOxtKu7kb5/S9ARp02RkLLl4dTPNkIBtiy?=
 =?iso-8859-1?Q?FR0d4nEfz+eMfbEigwPooeRhSpCejMlsB705oVFXSLt5boHTFnVw3bIisQ?=
 =?iso-8859-1?Q?AeANe9ihhmO+86Yp7BxY5DVvDR/R0yM7E/nbJE3u36qxDDj+nsaJiAZQyn?=
 =?iso-8859-1?Q?1Wvcm3uCiEW74okaVwV3XXUNjKpY26a8lYOBMnZRVCm6d5anOTVPwtgmWq?=
 =?iso-8859-1?Q?ovOTusy1JcXrCw7ldoOaGDJMSkJfmHR/Vk8814A/iSZmkpvtpslwc/CY1r?=
 =?iso-8859-1?Q?4BZ7C/Ei0bGrnZ6B29c2XXcm1zb4KOjk4vsQDGw30dQAA4MzjN0/3uMBWI?=
 =?iso-8859-1?Q?D+elU51PRqlONqxp4Px/WuRuoMkKGAmgp6xH2zIbzNR4oK7tpNdKTTCt78?=
 =?iso-8859-1?Q?97iF6UZjdNDFfGyqdZFMJqi0FwMfLNlpnwJ/PkYJZY5fbqk4ucRWjWXBrl?=
 =?iso-8859-1?Q?60orMr0E0U8j7wsXTeEX6nhWZGY5WKgGld6BiWaKqRhppJUmcIb4xwhLo0?=
 =?iso-8859-1?Q?WGn5McmE3tpMOQZA6aEDIYNnfb3bwDzTdBdsw90piODFACprxwYptcAZdZ?=
 =?iso-8859-1?Q?ib/N1ONkk8KfIFakUugF7OPmAxdQ8ZmbOt+4zYdtNDyLlhUpDOPYrrIvVF?=
 =?iso-8859-1?Q?l/RetSMmDZ+7BvyuB1DTVsTRGBA/ujbnASntzLnvo3jDnPpy5cEGuok2Gu?=
 =?iso-8859-1?Q?3ZVoCa4cKW3vFZ8tFA6sqP7I8pyWmtPvlqpprFeOHoICAs2jW8O0Y8FGG5?=
 =?iso-8859-1?Q?xd6iPwv0vXShdM1JdyGGzcMFwn8huMjdPZlK4jiCreF7SahbeZggnA48d/?=
 =?iso-8859-1?Q?6CcDzFdmX/+qjjKx0mKV2sS6ZkQ2LZ+WPWrY+EAdh4rEFuhVsXQ4ECWVgl?=
 =?iso-8859-1?Q?mnSRHUTYW4mpST0LFuMqpslU9DyObdj48tWg5jz9BQfVTuEbtMX0pca6zh?=
 =?iso-8859-1?Q?f8TZq6pZIvoO2cIE6qWfo4iJjoFd554Mdpl7P9KnoVnS1ZuWJeiw20Cgim?=
 =?iso-8859-1?Q?huDtu3m697+1dxdWv6zCFlYmeOz6JW8xMp8yzvk7+aO+npUrAz22LYS3jI?=
 =?iso-8859-1?Q?fg+bUO8UnYXQP+bCc5YAw5nPHO1f7ByJvbC+6i6PO1vTbZ6MrrCqIz4gbw?=
 =?iso-8859-1?Q?mQkHSXSGZDZ/ED/y2c/8Ika3lqSRiEFucuXqtdIffmZwI+HD1V4CiBFQs5?=
 =?iso-8859-1?Q?iiyPXmsfSxpuolQ51UWz5Weix8WfgHGSRe?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6077b95d-85b2-4fea-79ef-08dc5fc581ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2024 16:35:07.2206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 341ac572-066c-46f6-bf06-b2d0c7ddf1be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qrk6VfFOTdWt9stYataPweKcXHo8iPWW72K8yIip2qKoFtQq0ioRjKH+u4ZYHZUxcJWFJwoQlSmjKmdCWGKshw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR17MB6831
X-Proofpoint-ORIG-GUID: mqEoGXxA5-jDKgBrFH9kuaulD1WoJ7Cr
X-Proofpoint-GUID: mqEoGXxA5-jDKgBrFH9kuaulD1WoJ7Cr

Hang on to the control IDs instead of pointers since those are correctly ha=
ndled with locks.=0A=
Prevent use of the uac data structure after it has been freed.=0A=
Mark the endpoint as disabled sooner so that freed requests aren't used.=0A=
=0A=
Signed-off-by: Chris Wulff <chris.wulff@biamp.com>=0A=
---=0A=
 drivers/usb/gadget/function/u_audio.c | 31 ++++++++++++++++-----------=0A=
 1 file changed, 19 insertions(+), 12 deletions(-)=0A=
=0A=
diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/fun=
ction/u_audio.c=0A=
index 4a42574b4a7f..bcae95472455 100644=0A=
--- a/drivers/usb/gadget/function/u_audio.c=0A=
+++ b/drivers/usb/gadget/function/u_audio.c=0A=
@@ -57,13 +57,13 @@ struct uac_rtd_params {=0A=
 =0A=
   /* Volume/Mute controls and their state */=0A=
   int fu_id; /* Feature Unit ID */=0A=
-  struct snd_kcontrol *snd_kctl_volume;=0A=
-  struct snd_kcontrol *snd_kctl_mute;=0A=
+  struct snd_ctl_elem_id snd_kctl_volume_id;=0A=
+  struct snd_ctl_elem_id snd_kctl_mute_id;=0A=
   s16 volume_min, volume_max, volume_res;=0A=
   s16 volume;=0A=
   int mute;=0A=
 =0A=
-	struct snd_kcontrol *snd_kctl_rate; /* read-only current rate */=0A=
+	struct snd_ctl_elem_id snd_kctl_rate_id; /* read-only current rate */=0A=
 	int srate; /* selected samplerate */=0A=
 	int active; /* playback/capture running */=0A=
 =0A=
@@ -447,6 +447,8 @@ static inline void free_ep(struct uac_rtd_params *prm, =
struct usb_ep *ep)=0A=
 	if (!prm->ep_enabled)=0A=
 		return;=0A=
 =0A=
+	prm->ep_enabled =3D false;=0A=
+=0A=
 	audio_dev =3D uac->audio_dev;=0A=
 	params =3D &audio_dev->params;=0A=
 =0A=
@@ -464,8 +466,6 @@ static inline void free_ep(struct uac_rtd_params *prm, =
struct usb_ep *ep)=0A=
 		}=0A=
 	}=0A=
 =0A=
-	prm->ep_enabled =3D false;=0A=
-=0A=
 	if (usb_ep_disable(ep))=0A=
 		dev_err(uac->card->dev, "%s:%d Error!\n", __func__, __LINE__);=0A=
 }=0A=
@@ -494,14 +494,13 @@ static inline void free_ep_fback(struct uac_rtd_param=
s *prm, struct usb_ep *ep)=0A=
 static void set_active(struct uac_rtd_params *prm, bool active)=0A=
 {=0A=
 	// notifying through the Rate ctrl=0A=
-	struct snd_kcontrol *kctl =3D prm->snd_kctl_rate;=0A=
 	unsigned long flags;=0A=
 =0A=
 	spin_lock_irqsave(&prm->lock, flags);=0A=
 	if (prm->active !=3D active) {=0A=
 		prm->active =3D active;=0A=
 		snd_ctl_notify(prm->uac->card, SNDRV_CTL_EVENT_MASK_VALUE,=0A=
-				&kctl->id);=0A=
+				&prm->snd_kctl_rate_id);=0A=
 	}=0A=
 	spin_unlock_irqrestore(&prm->lock, flags);=0A=
 }=0A=
@@ -792,6 +791,9 @@ int u_audio_set_volume(struct g_audio *audio_dev, int p=
layback, s16 val)=0A=
 	unsigned long flags;=0A=
 	int change =3D 0;=0A=
 =0A=
+	if (!uac)=0A=
+		return 0;=0A=
+=0A=
 	if (playback)=0A=
 		prm =3D &uac->p_prm;=0A=
 	else=0A=
@@ -807,7 +809,7 @@ int u_audio_set_volume(struct g_audio *audio_dev, int p=
layback, s16 val)=0A=
 =0A=
 	if (change)=0A=
 		snd_ctl_notify(uac->card, SNDRV_CTL_EVENT_MASK_VALUE,=0A=
-				&prm->snd_kctl_volume->id);=0A=
+				&prm->snd_kctl_volume_id);=0A=
 =0A=
 	return 0;=0A=
 }=0A=
@@ -840,6 +842,9 @@ int u_audio_set_mute(struct g_audio *audio_dev, int pla=
yback, int val)=0A=
 	int change =3D 0;=0A=
 	int mute;=0A=
 =0A=
+	if (!uac)=0A=
+		return 0;=0A=
+=0A=
 	if (playback)=0A=
 		prm =3D &uac->p_prm;=0A=
 	else=0A=
@@ -856,7 +861,7 @@ int u_audio_set_mute(struct g_audio *audio_dev, int pla=
yback, int val)=0A=
 =0A=
 	if (change)=0A=
 		snd_ctl_notify(uac->card, SNDRV_CTL_EVENT_MASK_VALUE,=0A=
-			       &prm->snd_kctl_mute->id);=0A=
+			       &prm->snd_kctl_mute_id);=0A=
 =0A=
 	return 0;=0A=
 }=0A=
@@ -1331,7 +1336,7 @@ int g_audio_setup(struct g_audio *g_audio, const char=
 *pcm_name,=0A=
 			err =3D snd_ctl_add(card, kctl);=0A=
 			if (err < 0)=0A=
 				goto snd_fail;=0A=
-			prm->snd_kctl_mute =3D kctl;=0A=
+			prm->snd_kctl_mute_id =3D kctl->id;=0A=
 			prm->mute =3D 0;=0A=
 		}=0A=
 =0A=
@@ -1359,7 +1364,7 @@ int g_audio_setup(struct g_audio *g_audio, const char=
 *pcm_name,=0A=
 			err =3D snd_ctl_add(card, kctl);=0A=
 			if (err < 0)=0A=
 				goto snd_fail;=0A=
-			prm->snd_kctl_volume =3D kctl;=0A=
+			prm->snd_kctl_volume_id =3D kctl->id;=0A=
 			prm->volume =3D fu->volume_max;=0A=
 			prm->volume_max =3D fu->volume_max;=0A=
 			prm->volume_min =3D fu->volume_min;=0A=
@@ -1383,7 +1388,7 @@ int g_audio_setup(struct g_audio *g_audio, const char=
 *pcm_name,=0A=
 		err =3D snd_ctl_add(card, kctl);=0A=
 		if (err < 0)=0A=
 			goto snd_fail;=0A=
-		prm->snd_kctl_rate =3D kctl;=0A=
+		prm->snd_kctl_rate_id =3D kctl->id;=0A=
 	}=0A=
 =0A=
 	strscpy(card->driver, card_name, sizeof(card->driver));=0A=
@@ -1420,6 +1425,8 @@ void g_audio_cleanup(struct g_audio *g_audio)=0A=
 		return;=0A=
 =0A=
 	uac =3D g_audio->uac;=0A=
+	g_audio->uac =3D NULL;=0A=
+=0A=
 	card =3D uac->card;=0A=
 	if (card)=0A=
 		snd_card_free_when_closed(card);=0A=
-- =0A=
2.34.1=0A=
=0A=

