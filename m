Return-Path: <linux-usb+bounces-9408-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 321498A755A
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 22:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDAE1281DD6
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 20:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC1513A245;
	Tue, 16 Apr 2024 20:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b="c2I1qK5N";
	dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b="azDyWBGn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0068d901.pphosted.com (mx0b-0068d901.pphosted.com [205.220.180.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2EA139CF1
	for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 20:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.180.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713298512; cv=fail; b=aFrTyuClYqIkqpLa3SyjkW5V8TT9vDgMgw+ud73JM3LwGjnRrfOxp/WpoD5imgivC9+p0ObwHettRB420Euw+dLgW4H7ZqZxSvt4oVl7ESzFPtP8xyW7BA2UTA7Rgl51XH8CVoBOqctMEeALWI/XSo+ygxZs0LgDI+2HbgG0oVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713298512; c=relaxed/simple;
	bh=PS3L2pkWkOtr/OOF+jBE673Na/eCBaPV2Q6wa21dZKk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=aaszcT5MYzygqey32HEyq2tjgBnT7W7XXxeQPlQWZvV7tp83v/oO2hkwlF9GKD1bAIB06Dpg/RxuielHWgasXjIILKJwYZzsrHAJ6WjNrVW6baMToDkASQ9pSN6VJBQG4l0ovunejHTWsCb5xjc20JLMdW8SYRA8qa8DQpyK9xk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=biamp.com; spf=pass smtp.mailfrom=biamp.com; dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b=c2I1qK5N; dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b=azDyWBGn; arc=fail smtp.client-ip=205.220.180.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=biamp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=biamp.com
Received: from pps.filterd (m0278265.ppops.net [127.0.0.1])
	by mx0b-0068d901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43GBTSlV031634
	for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 13:15:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com; h=
	from:to:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=proofpoint; bh=QST0kM
	ySGuyslp/z9y1TGnSKoq7O0lB46MAn8x34FW4=; b=c2I1qK5N+F19hGx31zA/qW
	2RDiROIrPgF+GakiRHVZHdQmQzqrILfy0S6vYWJnQDKZilaS50N5i6q0tA2lB8Tk
	LnVe13/Thg3dKxWZa2T6gKO+MXPA/46x9t9pXYAPQcinq2wHJnSmDibjMmfSAp0o
	UaJXHWAaU3VlRuH2HM7kVU4Zq/GPysvwCP3OvAy6opZK4BSbTQJku5hgyZ9cnKof
	hE1X4kJgr8HucpKHrrVk+NTUAoWkkrVx2nbLtblEWZuhFBrIoEN7nNM7bqGSRUDv
	d6Q62CySuxTZtE2u6eY2Bn6vacVMuoM/675rTRwk8uJu3TOrGxaiBGgQz+Sn04ZQ
	==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0b-0068d901.pphosted.com (PPS) with ESMTPS id 3xg40v1v25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 13:15:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQIZQggGy3X/IAud/z2OFEiFUzWSo43TEq9AlRAOhyO0iWJuSDpIY9RPJSC5c1oEGQADyRq/UBxd7bf0oBPBpDuu7oSJrGX0LaVsoIkcRxlKjxoB1CBB3OhHj+ifGIkfUR64S0Uc4v8AhMdN5dQVf72Ixp76qN5NZ56bjqXpntNb3jpf/Y1geobQmd8xmRJZhLLJvLLMntcAgbbNLjZxLwVX8/jBqsFNQrFgrM00Ju5sSGj51DwnymqNHFkmDn8hUh2iAgf6CsdY/aLmaEGoxZ80n+PVgyTcDnIQzQrWKp9kaXqsWIoOwMPOEde5q7Sj4QFIKYOQ1Sg0ciHQmZmfag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QST0kMySGuyslp/z9y1TGnSKoq7O0lB46MAn8x34FW4=;
 b=JPl1GYvgE3JX3O/oH2O91KJAVBz8UM18R1+lqS1ArsfeAkDL/89esPeflYRGtO5CAoGg7mlm773iqcLgc38+wKOl/pFeEWz5tm2RkhMNapmgmJAubQoFkezbrJ/94/9JD8qSxwXeGcW/P43vdt4bclgfYZQB+nxcUin1UQGstnuIjdqdFVWLplDPMIkEpomHckkKqQlrErjrUz1yvB6/Gm0RuECDaKmxq+OS4MXI5eso629mK/gYeYpNLUNrH8dse+oBD829TEVedN37Ou6HhGI5TGWMu7hLZ6jO6K3qbPQ5xy1ZhkxI1YpA4HzM2eSG4iXcUSsDTD6w8ifg7RjTvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=biamp.com; dmarc=pass action=none header.from=biamp.com;
 dkim=pass header.d=biamp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QST0kMySGuyslp/z9y1TGnSKoq7O0lB46MAn8x34FW4=;
 b=azDyWBGn9nKOB92oRz+mNDJ48rhf67gz2FFh4tpgI6BZGV/FxEW7BnltfvzFMxMvh9jq/I2lErkszjtEbrXMsdSesGDwKdOeDHFrsRXQ6r7fXuzWjkotSdhiijkfSYP20rjNZ9yhXr0SkqtRczuR6lWSD6UJ9A+GBsfbG3htqHk1qCN39ZJz8CtiiA0GcYUTkXvkjDiUPQFKU3+stGOC7CJrTKwgy2/k5wJGD7jUF8MEqL+mLJsTH4g2o2OTwoIefup76pEyyJiZc0vtur00r6BkxjCY/d37JgTrdWRYfqHtrkfbxNJ5o8qLOheQr3KkrrLTCY1P+LQQcIyFVq8dgw==
Received: from CO1PR17MB5419.namprd17.prod.outlook.com (2603:10b6:303:ec::17)
 by SJ0PR17MB5887.namprd17.prod.outlook.com (2603:10b6:a03:437::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Tue, 16 Apr
 2024 20:15:03 +0000
Received: from CO1PR17MB5419.namprd17.prod.outlook.com
 ([fe80::f48:ee61:a81b:d555]) by CO1PR17MB5419.namprd17.prod.outlook.com
 ([fe80::f48:ee61:a81b:d555%4]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 20:15:03 +0000
From: Chris Wulff <Chris.Wulff@biamp.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [PATCH] usb: gadget: f_fs: add capability for dfu run-time descriptor
Thread-Topic: [PATCH] usb: gadget: f_fs: add capability for dfu run-time
 descriptor
Thread-Index: AQHakDpo6LKkehmJcE+I+KBBFalSug==
Date: Tue, 16 Apr 2024 20:15:03 +0000
Message-ID: 
 <CO1PR17MB5419AC3907C74E28D80C5021E1082@CO1PR17MB5419.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR17MB5419:EE_|SJ0PR17MB5887:EE_
x-ms-office365-filtering-correlation-id: 6a1a9056-3301-4a27-68ee-08dc5e51e69c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 em7w6I8VrzZGs7Rt9hZA0SOBH50ZvLWoHDs7GBdbJYWwZ2/Qz2XhvUNdH6InONjVpdEz/+AtjL5eFYmxs2jBdS0nIJNs/nXuRfVJ6ie5UnW2iY8e9G0kAdTYkgBCLn0md5W4DpwpQ+mEib1TLMSFeM0wfzKCtU5POOa9cQyOKxvirq0dsQdcS17k5IOAhEKHV4uDWMnxz5GuKPP1igBEX8kOEz6jwm7rSP3F0ssh1EpEWmoH8gWRPoZzXPHR5B7tic54X4eGNCICJ2oOofLJpy1BhftfeR1U3/z86tE3LX5tCMlGyTALK8dOpf26Aw/Z3jUZelwDxsLaCX6JlkKICC5lamVRPo7f3O97Zqx5EEc3FjpTAivn2kvxEGQh834BqPj9MJHQjr+OZ3LKjK+r262rBQnbRdftJ1cL0+DJWajLAULedbQVgNcceGAcHBvN8oFT2sq/ZkVBTvla0siYWlr9Kcvy63xWl9+9453auMZMDJMhz6j9MlOoNmXd9/P+IAbJhe7DqCJGiE5OQJ4aXL9xgfIyj4BmPBrjYUjRZgk3LF/F8YsHNXsLIgTZGSfdIL1FkbKDYS1+Go2w3uzJXDlZ6lWnEnRvXozwdu/kt22v+AgCWEACGl1EK9K5k6SwqlJ7jqQ1jUQOItPOI+JBz8d/eMYqLDDGBesEXEcCd5y+ozoQ/ApISmArlSq+sOHbWy1yW4P8kKzFTTh0MxJg3cFAwuYZvKbmpsBI/c8Q6P4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR17MB5419.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?kz/kgJ4vMGCmRBRK62bdSBUTS67jpaXMyo+RDTS5vAZgr3OGsJ50Svw4YP?=
 =?iso-8859-1?Q?3NOs0UExmT5RYUAcDpP9IS64qc/eOhCRIGOttk06XX82eEcQNA1xB4DsNg?=
 =?iso-8859-1?Q?Y5M9ujSo4oc+PzgfLYFKS2OSrkA+RV0BUXgMMFSupF1jxzW3A5m6pY8UnE?=
 =?iso-8859-1?Q?JX/Fea4l6odH4zFRZX9dc16FmdHJV0Qh5zTpnPziNJg4DlR73YEnYUD/GF?=
 =?iso-8859-1?Q?NnaXUvyEfuygLd6T7XINEv1jZlmp7vpnmQqZQbc135KjkNoHehs4iZ799f?=
 =?iso-8859-1?Q?4QRQ9SDxvyBu9wW8T5oGAlUBv0k0f2HcksCqYTV61j2FzHRuT1+Cy0bpVs?=
 =?iso-8859-1?Q?ovig2QNVKZzfWzjeAxNBDhXCP6eDr5nyIm+EHI81WzCbGTEL0ycuM/m57d?=
 =?iso-8859-1?Q?CshLRSSnK4W9dPnCKFZI2a+8WvAMnrI2FkkZB5CCsX7zC2J8+Bms2NRhd+?=
 =?iso-8859-1?Q?g8heo8Y9Qv7fn3HEyV9Ai5vSMTFnlxvrSTHU/eBBSVkeEn2xmsHjawi0xm?=
 =?iso-8859-1?Q?lN5X2Vs8nszLIuI7JtYP0IHCA6QDZmkF42fu3iQ0wDNHz9oEiQLTLmom/m?=
 =?iso-8859-1?Q?sisBfFoqBtgD4TkZzYzJoaOdJ3R34AxaelklhlolXf8uAqtO3DMBDYCfUZ?=
 =?iso-8859-1?Q?OGQDRvlPPpCzDl2BiRpNRbfoiEfZHz0N1ZKAI/2WltDltphK83GjveTLrY?=
 =?iso-8859-1?Q?QBXw83Yadymy/zoFy5xWaruFK1RyrHtzzWZ+0q+rfz2kk2Bk4nUGD4AVOO?=
 =?iso-8859-1?Q?3AutnA+bWN7n4fWJp96BB5/dURg6x95tSO/dr7291N4HqVwwtq/6c98wLZ?=
 =?iso-8859-1?Q?slLqbvpzhPAK1mr9MRfgZF/nCam9y1Nv0/wvQZBudzoiMNQJ3kNR7UogGf?=
 =?iso-8859-1?Q?3uuvWeorMiEPJTvgzJIHDlK2GJ6Wk/Aq5By0PKWDHC7UEXc6IHZgyVAIdV?=
 =?iso-8859-1?Q?umxoOgvDXBzHB343Ch6EsCqpFcnqwFo2GkFXFIr6lgiQCie+T3cQcPuti7?=
 =?iso-8859-1?Q?L/7NiZXnu5tb4yvcszGREMg/QCagAP6AgB8YSlrclNsvSptofmYSHWP3Xa?=
 =?iso-8859-1?Q?Tm6SEdcvFaE7geCu2E3Jl1dMnTjzQV4LqmiZY8KqE83L87JpqskNShVCUv?=
 =?iso-8859-1?Q?+HZspUNkYEyHgDeLlvZuLdJPz7DqwRIgGClPK8nW2lGNcHq2OdDvYI4uVn?=
 =?iso-8859-1?Q?zJ0AOIirdqnZce5+x6P+w7OEG5eiTYdwdhkEuod3E+7n3WRL/sGiEw4j6Q?=
 =?iso-8859-1?Q?X1B7ZquqQnyNrkgHnRIQImggmz+nwDNii8hr0c7bA8nPvkH2LA7xsSjdR7?=
 =?iso-8859-1?Q?mTlzlTBewf1LWkUQhm51p5oFeccFregIqBh95dexw9LNpsQkm1A4hd2ZTt?=
 =?iso-8859-1?Q?Y3aLGYo5AdoNfY36Y4JtTja6xJQ8/KDsMOgmNDxLDlWKJt6FRpePhqjCf6?=
 =?iso-8859-1?Q?fIEyhZCVpbgSVUDJMJLtU4StZBxQ6o23tu3je+8hNR4xsWgVAriMrkvw3g?=
 =?iso-8859-1?Q?dTfRKeJkIxIbaJ2xmaxFtRq3ngAEw3QftLeTHSgQzc30j577Rd0s6vdOE3?=
 =?iso-8859-1?Q?mRxRXX2JT6wbaZIWnbMDddT08vH27vMBAH79o1jkVUB2jsewsLh0v1aOib?=
 =?iso-8859-1?Q?PlyWZ+rOH/cAv2eNizgGPqRLz9vAeA/oMN?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1a9056-3301-4a27-68ee-08dc5e51e69c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 20:15:03.4077
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 341ac572-066c-46f6-bf06-b2d0c7ddf1be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cLaZHSqnYlD5u5ZkKRYlha4ViR4x8XGCFvU6YaDx2S1eSSduhnBK0WFzt89ruPV/LNS2ggg4cbgQkXSi0LLP7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR17MB5887
X-Proofpoint-GUID: STMXjfEvLIDbWc-h7lAPPx9T6ylHGSVw
X-Proofpoint-ORIG-GUID: STMXjfEvLIDbWc-h7lAPPx9T6ylHGSVw

=0A=
Add the ability for FunctionFS driver to be able to create DFU Run-Time=0A=
descriptors.=0A=
=0A=
Signed-off-by: David Sands <david.sands@biamp.com>=0A=
---=0A=
 drivers/usb/gadget/function/f_fs.c  | 11 +++++++++--=0A=
 include/uapi/linux/usb/ch9.h        |  4 ++++=0A=
 include/uapi/linux/usb/functionfs.h | 10 ++++++++++=0A=
 3 files changed, 23 insertions(+), 2 deletions(-)=0A=
=0A=
diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/functi=
on/f_fs.c=0A=
index bffbc1dc651f..4d39e5e30b73 100644=0A=
--- a/drivers/usb/gadget/function/f_fs.c=0A=
+++ b/drivers/usb/gadget/function/f_fs.c=0A=
@@ -2467,7 +2467,7 @@ typedef int (*ffs_os_desc_callback)(enum ffs_os_desc_=
type entity,=0A=
 =0A=
 static int __must_check ffs_do_single_desc(char *data, unsigned len,=0A=
 					   ffs_entity_callback entity,=0A=
-					   void *priv, int *current_class)=0A=
+					   void *priv, int *current_class, int *current_subclass)=0A=
 {=0A=
 	struct usb_descriptor_header *_ds =3D (void *)data;=0A=
 	u8 length;=0A=
@@ -2524,6 +2524,7 @@ static int __must_check ffs_do_single_desc(char *data=
, unsigned len,=0A=
 		if (ds->iInterface)=0A=
 			__entity(STRING, ds->iInterface);=0A=
 		*current_class =3D ds->bInterfaceClass;=0A=
+		*current_subclass =3D ds->bInterfaceSubClass;=0A=
 	}=0A=
 		break;=0A=
 =0A=
@@ -2548,6 +2549,11 @@ static int __must_check ffs_do_single_desc(char *dat=
a, unsigned len,=0A=
 			if (length !=3D sizeof(struct ccid_descriptor))=0A=
 				goto inv_length;=0A=
 			break;=0A=
+		} else if (*current_class =3D=3D USB_CLASS_APP_SPEC && *current_subclass=
 =3D=3D USB_SUBCLASS_DFU) {=0A=
+			pr_vdebug("dfu functional descriptor\n");=0A=
+			if (length !=3D sizeof(struct usb_dfu_functional_descriptor))=0A=
+				goto inv_length;=0A=
+			break;=0A=
 		} else {=0A=
 			pr_vdebug("unknown descriptor: %d for class %d\n",=0A=
 			      _ds->bDescriptorType, *current_class);=0A=
@@ -2610,6 +2616,7 @@ static int __must_check ffs_do_descs(unsigned count, =
char *data, unsigned len,=0A=
 	const unsigned _len =3D len;=0A=
 	unsigned long num =3D 0;=0A=
 	int current_class =3D -1;=0A=
+	int current_subclass =3D -1;=0A=
 =0A=
 	for (;;) {=0A=
 		int ret;=0A=
@@ -2629,7 +2636,7 @@ static int __must_check ffs_do_descs(unsigned count, =
char *data, unsigned len,=0A=
 			return _len - len;=0A=
 =0A=
 		ret =3D ffs_do_single_desc(data, len, entity, priv,=0A=
-			&current_class);=0A=
+			&current_class, &current_subclass);=0A=
 		if (ret < 0) {=0A=
 			pr_debug("%s returns %d\n", __func__, ret);=0A=
 			return ret;=0A=
diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h=0A=
index 44d73ba8788d..dcd962d1a75a 100644=0A=
--- a/include/uapi/linux/usb/ch9.h=0A=
+++ b/include/uapi/linux/usb/ch9.h=0A=
@@ -263,6 +263,9 @@ struct usb_ctrlrequest {=0A=
 /* From the USB 3.1 spec */=0A=
 #define	USB_DT_SSP_ISOC_ENDPOINT_COMP	0x31=0A=
 =0A=
+/* From USB Device Firmware Upgrade Specification, Revision 1.1 */=0A=
+#define USB_DT_DFU_FUNCTIONAL		0x21=0A=
+=0A=
 /* Conventional codes for class-specific descriptors.  The convention is=
=0A=
  * defined in the USB "Common Class" Spec (3.11).  Individual class specs=
=0A=
  * are authoritative for their usage, not the "common class" writeup.=0A=
@@ -332,6 +335,7 @@ struct usb_device_descriptor {=0A=
 #define USB_CLASS_VENDOR_SPEC		0xff=0A=
 =0A=
 #define USB_SUBCLASS_VENDOR_SPEC	0xff=0A=
+#define USB_SUBCLASS_DFU		0x01=0A=
 =0A=
 /*------------------------------------------------------------------------=
-*/=0A=
 =0A=
diff --git a/include/uapi/linux/usb/functionfs.h b/include/uapi/linux/usb/f=
unctionfs.h=0A=
index 9f88de9c3d66..cf3f55234a5e 100644=0A=
--- a/include/uapi/linux/usb/functionfs.h=0A=
+++ b/include/uapi/linux/usb/functionfs.h=0A=
@@ -37,6 +37,16 @@ struct usb_endpoint_descriptor_no_audio {=0A=
 	__u8  bInterval;=0A=
 } __attribute__((packed));=0A=
 =0A=
+/* DFU Functional descriptor */=0A=
+struct usb_dfu_functional_descriptor {=0A=
+	__u8  bLength;=0A=
+	__u8  bDescriptorType;=0A=
+	__u8  bmAttributes;=0A=
+	__le16 wDetachTimeOut;=0A=
+	__le16 wTransferSize;=0A=
+	__le16 bcdDFUVersion;=0A=
+} __attribute__ ((packed));=0A=
+=0A=
 struct usb_functionfs_descs_head_v2 {=0A=
 	__le32 magic;=0A=
 	__le32 length;=0A=
-- =0A=
2.34.1=0A=
=0A=
=0A=
=0A=

