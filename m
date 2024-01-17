Return-Path: <linux-usb+bounces-5193-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B415830FEE
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 00:03:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0203B21531
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 23:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAEB622F17;
	Wed, 17 Jan 2024 23:03:26 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (mail-lo4gbr01on2119.outbound.protection.outlook.com [40.107.122.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0062F28699
	for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 23:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.122.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705532606; cv=fail; b=P10IXb6R2o3gk+JcsyYNnEGlRE29kd5sq8bjzEvxibmoSb3TkQ6FiY7bj39TmHUNHwWMkJBx2ArvaL7CIZDBmorazcO/HbOmWGW/v8KWatQ7HMiwkSwuBVgG90BXYv33yHGZX6bOc4eSriA8Wi0nEGVD96TDL/D0DFScBR30m44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705532606; c=relaxed/simple;
	bh=rQASbfCwdwIQEj5YO/P/G3RkAC7/Ap/jA61nn3+4WmE=;
	h=ARC-Message-Signature:ARC-Authentication-Results:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:msip_labels:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped; b=YscdXmMlawp9X0VHKJ39m7He3k5MKvRqHwrJgVU8GKNUuEBfNFe25KX9t9UTIbKGgffRQhOpWOmf0WQcrcFr7yJ9qezzVfFWAL3xLXLdqe32yGUyvkD+nFofeBStSEIlq4kt6fi0K7ra39tRGxIsGLSECQLzuiveQzKFfPLLueI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=integrelsolutions.com; spf=pass smtp.mailfrom=integrelsolutions.com; arc=fail smtp.client-ip=40.107.122.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=integrelsolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=integrelsolutions.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqkBy956hdpq9yyr17thYgP7eC2rOCTkkb3MLWvpIhWgla3gFevVbxLrbwQZgfJA9InQLYhgvn60I1V6g6fsRZ+V1Nq/+Tvz+5GCxMJ37r+C69Sc8CaltSS44upliC+Pc2HfDtqFyx4g/4PyQkUXaL/7zdChECJ4aNMzFpJGKBAbmVoDcT66JECJDAnwYXg999b6j7mPOTygbFhH6f4FY8GjjNiquvf6lZMOwylcGhqPBTKRPNKajrcA86Z7iGAIgfvxsLT+UF5gq+fjODDtdTS3YVmPwa7+c+tfeD6pqretf2w6l6ogmUrVo3ooZSyACy/2uUJGGL+nD06aSMhCWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+O/tPo3StXkvws6QKTgAYzX0BJ+wYH6LKqVUh/vCkc=;
 b=WoyAN94GmghEcuiVOZofqIfzCPR9bV935vsfT0ExzunEkdpC0VPmtj8uZG60Kw+mAIBejks8wYx387dqgt5rLDCBMEv0ycIVQStLstS6DTYfZcRNb6OYijl9h+03Izh4XrWBD66k9NpyQtvDBMsEVo8GSWunctMdH4PDHNvLk6rtRcgAGcd3NAArxArkbWlJK8JrIuTmaYS6NaQPxj3iMRvQYiAeSNS9rwS1u4TE5u5qFfioCDTn/J+bzHt3oc84s1Dvr/l8yhIWAdJqsEmyT2FKqrEako+jlMQBet5xrsO4JMKJDMRcipCnI5b4d/nAWeXB0I3sE+3Xsur7GJWUxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=integrelsolutions.com; dmarc=pass action=none
 header.from=integrelsolutions.com; dkim=pass header.d=integrelsolutions.com;
 arc=none
Received: from CWLP123MB6443.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:1d1::12)
 by LOYP123MB2941.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:eb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Wed, 17 Jan
 2024 23:03:21 +0000
Received: from CWLP123MB6443.GBRP123.PROD.OUTLOOK.COM
 ([fe80::89a8:b271:1a13:2ed5]) by CWLP123MB6443.GBRP123.PROD.OUTLOOK.COM
 ([fe80::89a8:b271:1a13:2ed5%7]) with mapi id 15.20.7181.029; Wed, 17 Jan 2024
 23:03:20 +0000
From: Rob Winn <rob.winn@integrelsolutions.com>
To: "johan@kernel.org" <johan@kernel.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: USB: serial: cp210x: Add VID/PID for Integrel Solutions OEG
 Controller
Thread-Topic: USB: serial: cp210x: Add VID/PID for Integrel Solutions OEG
 Controller
Thread-Index: AQHaSZemqo1n+uwOvEajnfPvpmLGWQ==
Date: Wed, 17 Jan 2024 23:03:20 +0000
Message-ID:
 <CWLP123MB6443E84799CC3972B5317E589A722@CWLP123MB6443.GBRP123.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=integrelsolutions.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP123MB6443:EE_|LOYP123MB2941:EE_
x-ms-office365-filtering-correlation-id: 6e98f508-1f0c-4187-3385-08dc17b07ffa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 XN2Beam2DbICpG8FRp8KqUFE3UFPPNIbgwep4QPfbsF8z0kzG1eNa0KXWnkOhF7m+IPZNA/hLdboV/nHaKcWt2LWOWKn7EAuRoYiKWUHgY4KbIMkmfv+DATdpwRbe8PiOFX1yrr7U6K0FR+92MsBHo75EldRS9FbKDInvxaYVN9JQMSSEwEwleVqHTX8BDM+EigPo9bWzsiOI3F0QMGS/spFynyPlgv1ijuQK9RjtCvuJxBNVG/w2PsF9ytZSTxlDRU65oZ1RK0cIWOIQnQV2pZcD9al10GsjuaLM897gCEFDVW0a+S7CHE1p2i2A9oFzgCa4/CmoIhGBi07OoHOfGA2kPV5ObX/B5A3MYCKy7SgzWXtAH/6pgxftOgATjF1KCKpQphwMDUzeTbF0F00fRNCn6C0dYvhdgN5L/aDyODYRQJ5VADwED7Srjin8gJtCBK9n8hg0JFQIzhyovfIwBF5HL+AJ/6+7cBfHhncIVE1NKj2yfGijb5v7nAbFHtBg9EjqGWOHw6dfMxgfzmiSpBylLPWRc57D/4Kp65W2zUQUm6JiUMnnuJ5XOwFfXGEx2dzwTE28stMufApLXQ2sN+QQH4LIy/ZpRG+PbdHxlcD5qb4ySbbUN3oP/DwUzB7
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6443.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(366004)(136003)(376002)(346002)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(83380400001)(26005)(38100700002)(41300700001)(122000001)(8936002)(66446008)(64756008)(8676002)(4326008)(6916009)(66946007)(66556008)(76116006)(52536014)(66476007)(4744005)(2906002)(5660300002)(316002)(44832011)(71200400001)(9686003)(6506007)(7696005)(91956017)(478600001)(38070700009)(33656002)(86362001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?GtbBdrp3HkTObJTc2aIQQ/7ZtJ6hFqq9Lt3MwNH1pyzTo4gsM5EAASiFXD?=
 =?iso-8859-1?Q?vLhNwYJoyi8gDEnQWLCAo9nOXAMCLy5HTB487p/2Cj0Xq7+Y1cvCfPZc6v?=
 =?iso-8859-1?Q?/LMA8NMHfR/Vpj2I4YhnyFHd/CyHLCPfa6LYGkMxBdoiJdL9mQEaYJy1nj?=
 =?iso-8859-1?Q?XAlA+RCZTvsEZgUCOOHGGncm51DxVuKoYZh5ho4/1Ug7oS5g/KoZxcnaMf?=
 =?iso-8859-1?Q?TbV2CTD9gDeS6I6BeIV8cCeU1empeRsjCIM1LXRpwYXEYvbmPo87kqy70Y?=
 =?iso-8859-1?Q?nH0rxYiZqTtdlgtWAf0L+eUnLpeHBzMxATxbV+F3EXV7/3N9gDAjyUuKb7?=
 =?iso-8859-1?Q?3f59dSDjwFTribVWHOK+lFJ2abvzlOLW9IHBCFUvMU8KnzR4ILyv2vqcrO?=
 =?iso-8859-1?Q?nKihmxOLReM8cSU2SEvx6tk37Xm03PxOe/qB+xjCWw6KBLjutkCUZ5RxqX?=
 =?iso-8859-1?Q?bf4F/xVGWtgwDvq6bjx487x6AhjZk+Bin55BrOJZihMXcXt1aOQd3z1Nek?=
 =?iso-8859-1?Q?ie9pgW+/hNtp8m4lKo0WzCYhHHqktlUsmXhlWS0gTOVZn5tItJ0DPmMHrn?=
 =?iso-8859-1?Q?HQn1WTjxX3MReZe/KEH8GducMcQeGagmGFxRMzH/XST8DKnYvdn5mIqSAK?=
 =?iso-8859-1?Q?+7gyVS+/Sape7rXxB+YAUDn+l5SR3117gqdOhK7M5eHiiD1z7IgEANpnEY?=
 =?iso-8859-1?Q?2K08LR48zi9tswKiMRyRXtEc4vPCjbf6xDeTw8FzTaOaZnEqHL6fPo2jZn?=
 =?iso-8859-1?Q?CKnU4lxTT5NGLp9TFzwwu4tJajCef5FjyJXrVWFIwPMpXFv5zUPtHCUAdB?=
 =?iso-8859-1?Q?/Px8DSQ1YjDWtsY+wgDW+5CAuA3HQFj4a4b9nR5jYj20I7E5fS0yexKPwD?=
 =?iso-8859-1?Q?W+uvGhRQElWCxPmNZ0LodKURPAev4TH+iGg0WUWMm+zWfjVAc9BsAN6srx?=
 =?iso-8859-1?Q?pHhB3w3awnsYFVP7YEH88kv4fS1GBWbnuvJ89CT9ZB/yNIjfFpRlvyDIkP?=
 =?iso-8859-1?Q?fYFkNt+cHeqLpk031fAoHd6gGBimHJFBy3r5sEoYPHGvwjVX9SPZecC08y?=
 =?iso-8859-1?Q?9PvIJFUWRJxc4vB7M3g+QieSnxTqur4aNOi6kK6ZK6PbBTPfaSQT4KTr8F?=
 =?iso-8859-1?Q?GopdE1M5L0eOvIolIhqX1DNncYVl3lPKKzI3X6+IwhcvpSxeXSh94rfFgT?=
 =?iso-8859-1?Q?zDqT6tydE+LkIptXuKBJZzQegJieZRxyLS6nlNHFuiX327+kogEz0TYZWg?=
 =?iso-8859-1?Q?8J6VX7wJ4dDNIJIhGk7eWg7yBGvSi4/vU/qWemTP/sx5Y6hh7UDUpoD3t3?=
 =?iso-8859-1?Q?K6vf6dNX8OtvR6FUC4smHhqaT0yX4rsbtT+WJqxuN4uYdPYX7PSRItbIY9?=
 =?iso-8859-1?Q?k6uhVZtdflHi3j5vG2Rfsor85/6H4NkQBFzeIzd/w3XuHhOhmuCxTGuzP6?=
 =?iso-8859-1?Q?aduOFa4eULFh9yHadYYiFbCQ/snQ6kCSw747Dsr/i34Kq07jeXDxF/0p7u?=
 =?iso-8859-1?Q?Bx/LFsBzxVr9no49E0eUWI1omhLxj1wD9c1wDyRWFRr3NopHXpCV0wUbRe?=
 =?iso-8859-1?Q?sxFnJyRv83FnVs1+m15r2JJEfH9CCf5EMAf5Zf8i5O1K8ZDH5f29Dq/iAw?=
 =?iso-8859-1?Q?w1Grjqr6D1zRThAVJxcyhQi0MqoI49ufg8t8T9HBVNv2ALTCJO5UVg9Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: integrelsolutions.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6443.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e98f508-1f0c-4187-3385-08dc17b07ffa
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2024 23:03:20.8347
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 17ecef28-eca4-4d64-810f-45b5bb01bc36
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DCxP2rReZwP9Sxqg+e/THB8HIcKOXrWKOnt1FbXC/LotkvrDiNjfCsYM/2m2PcznnomnN3Fi0LVDNP/AhM7zd+9h5/c/WwiZyf4RwJYd0no=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP123MB2941

Add vid/pid combination for Integrel Solutions OEG Controller to cp210x dri=
ver=0A=
=0A=
Signed-off-by: Robert Winn <rob.winn@integrelsolutions.com>=0A=
---=0A=
 drivers/usb/serial/cp210x.c | 1 +=0A=
 1 file changed, 1 insertion(+)=0A=
=0A=
diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c=0A=
index 1e61fe043..d1f993eea 100644=0A=
--- a/drivers/usb/serial/cp210x.c=0A=
+++ b/drivers/usb/serial/cp210x.c=0A=
@@ -163,6 +163,7 @@ static const struct usb_device_id id_table[] =3D {=0A=
        { USB_DEVICE(0x10C4, 0x8A5B) }, /* CEL EM3588 ZigBee USB Stick */=
=0A=
        { USB_DEVICE(0x10C4, 0x8A5E) }, /* CEL EM3588 ZigBee USB Stick Long=
 Range */=0A=
        { USB_DEVICE(0x10C4, 0x8B34) }, /* Qivicon ZigBee USB Radio Stick *=
/=0A=
+       { USB_DEVICE(0x10C4, 0x8DDC) }, /* Integrel Solutions Integrel OEG =
Controller */=0A=
        { USB_DEVICE(0x10C4, 0xEA60) }, /* Silicon Labs factory default */=
=0A=
        { USB_DEVICE(0x10C4, 0xEA61) }, /* Silicon Labs factory default */=
=0A=
        { USB_DEVICE(0x10C4, 0xEA63) }, /* Silicon Labs Windows Update (CP2=
101-4/CP2102N) */=0A=

