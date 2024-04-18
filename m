Return-Path: <linux-usb+bounces-9465-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B4A8AA051
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 18:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C7B01C225B4
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 16:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A25916F8F7;
	Thu, 18 Apr 2024 16:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b="OCui5yak";
	dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b="OgLX9iTa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0068d901.pphosted.com (mx0b-0068d901.pphosted.com [205.220.180.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4566C16078D
	for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2024 16:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.180.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713458719; cv=fail; b=qZ1/4QWief74hWfZRGpIyjxf/pwihiQ4QG13grBICD6rsFIPWabSYe3xu9eXOiXVcV3qPF8ic333n2L8+x9Q56VWO7+NEH7n/yk/vWIlmiSg/kere0iMM322dCUe8fj7HKJf/n8DLpRim3+2SXEaOq6Atp539S5X9V1OtbWGvJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713458719; c=relaxed/simple;
	bh=vs76Vv5FwW2EkP/jexkeMOJtcJ3bNSVW74GxaPohhhQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NAjXtskmF/ATYodqXePs0AhCp7DSJc0+cepnGFUaAPnPej3j12UO74gHwzarn9d5IJDwA76JaOh95BivluECROzyfL1eODJEowxIPQtuvhGFs4xk7DVmOL2xiJFl4R7wlVA1HpNdsriIeAHf6ZDhWa7sW5KbJJ5NnMn1/s+TOOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=biamp.com; spf=pass smtp.mailfrom=biamp.com; dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b=OCui5yak; dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b=OgLX9iTa; arc=fail smtp.client-ip=205.220.180.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=biamp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=biamp.com
Received: from pps.filterd (m0278265.ppops.net [127.0.0.1])
	by mx0b-0068d901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43I6vnSY020874
	for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2024 09:45:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com; h=
	from:to:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=proofpoint; bh=VqE4uL
	yZk0p3dIOAVQhM9alQZYBioiOZu7h+yqA9FUI=; b=OCui5yakIzkMFuDmFgZ9QG
	TjwsURy1Ij/qrCA5SI6vu7SyoIIHdEbxFXZRfIXYNxwxb6CdVwqZ48RRylWBVrAd
	wxVkdNgVNAawcx0uWaXIl2i/5kTeIEDciW+VMuH2gE15SIajwXvbC+pcbynuzbQH
	uz2WDgCZ7UoTFfLw2i4rQOg7OYJeckeIv0tDXq0Fp67Sl16UTFacCckHLhoUDAW/
	YxjIkH9BxDPd6R+nTMRHGLbqW/j6PdMjaE0WHz+yD7nFuD5ZJAAoFnyKpGqOghVT
	VnKcUGM5MQbb/Nr5287p7ntcTyTZpmoGLHzFpNY64MOBpZBucJZ3y/nqg5SlOegQ
	==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by mx0b-0068d901.pphosted.com (PPS) with ESMTPS id 3xg40v3d5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2024 09:45:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYELFN7QFi06b7r0q/IYoigrnHmCAz+TqR7uGxnzqiuB82Vl2pOh0wkYzhXcD0y/MF5kVfnIfblnRiwMZ6+eRmcSwuuZxS2Ac4ueALRt/dYzKeIDPFmNAt8LFnMPckJUOjFj3MqWsZQNX2PJNbyBygbhVYs3vVs/bUf6SjYBJcBm5x1Kxim/4kdhQETYRmiPV7aXSwCrpCy0C7QLbv2G+ojm+IQGjrUa21FqijGxhE182Jbju/prrcsROkzH6faCUK6KMhNEPCh1p6XV3rox82TcOecNc0crk6DKyYoIZ0RFgODnnzN2bsmgOREwsrcA+b9nVDVjWJh3ahQDKf0rxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqE4uLyZk0p3dIOAVQhM9alQZYBioiOZu7h+yqA9FUI=;
 b=BKRyZ6h0zLXwAZuaiOlE2w6JmncakcatjWLinwOXvHcYiZb2+wSF+6OxqXx1X4mDycsP2dGgzn8cD9P0BIgFLMM7m68sxfLjWUrK3m10AHqwQIk2+BwpOCx1qG0g4cTU2gSh9irgl5OSCLvCP7MsWUoZP3ASXUZKmx+rWukCuSO7Bg1q70WDWAS5Zbj7s4KoIJtcigCnaLTtyLFYv0k8nLsvwoIF/kcd6ITNajCO6KsYB3meEHNiCBPb4OpM3689gjuc1p3ia1aiBW5+O44mUP0XV2dgmKLP5i2RJiBFi3PruxezNX+X7+lRsdu4e8ItRAdyTWLXuV/FQYKuBu7P7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=biamp.com; dmarc=pass action=none header.from=biamp.com;
 dkim=pass header.d=biamp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqE4uLyZk0p3dIOAVQhM9alQZYBioiOZu7h+yqA9FUI=;
 b=OgLX9iTaCZ3hv6r1QuP45uC1GK6p6V5fxA4uvAfccmDzPSO9F6Xcd4ZY+Amh2midBa1jDb89BwJNbEvo0tff4KwVz65cmWrhPTug3e7OsIOsvKHI4H7OqyevlpR55arXZa0RXt4Wuc1RKPaFqcfo6YoisteVuMMYn1Y2pC4LyKqx1CbBr0VRlkufxdF3pyGfHpbhKkU1esrEQlTT5s7I1EUmn7/OXtnEjUW04Df4CsqGp/yz96zHNV2XLXJ672xPF5e+00sA3JknhB3jKEnLqYs2WXgijUgu7pFf0SaG/VT3/+KvlysRbzdpKzPW6nJvwv75HVjFwT2Szm6ewE4I1A==
Received: from CO1PR17MB5419.namprd17.prod.outlook.com (2603:10b6:303:ec::17)
 by SJ0PR17MB4741.namprd17.prod.outlook.com (2603:10b6:a03:376::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Thu, 18 Apr
 2024 16:45:12 +0000
Received: from CO1PR17MB5419.namprd17.prod.outlook.com
 ([fe80::f48:ee61:a81b:d555]) by CO1PR17MB5419.namprd17.prod.outlook.com
 ([fe80::f48:ee61:a81b:d555%4]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 16:45:12 +0000
From: Chris Wulff <Chris.Wulff@biamp.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [PATCH v2] usb: gadget: f_fs: Fix a race condition when processing
 setup  packets.
Thread-Topic: [PATCH v2] usb: gadget: f_fs: Fix a race condition when
 processing setup  packets.
Thread-Index: AQHaka9eU89Zqk/XPk+xKvM9jFa6Yw==
Date: Thu, 18 Apr 2024 16:45:12 +0000
Message-ID: 
 <CO1PR17MB541952EE4072214813CB05C8E10E2@CO1PR17MB5419.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR17MB5419:EE_|SJ0PR17MB4741:EE_
x-ms-office365-filtering-correlation-id: 8c7a6483-7074-4685-383c-08dc5fc6eabc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yBAwub47ICeegUJXBEPCFN0UTYh+CFMTRNwGZct+cCjxpddVZh6p31Cs4eD7nOKWs3zUddHxBJHjHJ4mMyztvCiizkpnrntjZpAqSKjGORSrCEICv6yfCiEI/NZjMA4EhlkNwBH7vNmKiTQFAmLJB/u13LXUDiBnAVFH5sZ4CSqE2TcWbo9Ig/TTdSeanTujs4+ctj3hBmVwLX3gw26smNNOKan+tjbf1XR5gfHuh49DAFmgDu2CXtjK7V3bunDI32699dLF0p+46mVVVDsgPf/Cr14v0z66nA2/NPC+o7DS+bfXTj7/AFXoJFnTsCBlQLf0eLuRQkcytNtpV7PjKKseZTVXXYFYQqzaYKnNFTJ+yzCIviiwhqZtn1HLVoF0GofliWnMLeGI0IX6JIog4WztKfjI2L38ATl56oo1JtBpLut/hTqMqtQttMlsYheTHrpvxL/Xj4Rpaajo34F2w5mCf9tLk0EK8Hok0kzZIrZS2yrn55IHGJGHsf++oubHXu2mkoSONBuyYdDiVMVH/7Y7vvwEBY/pmOdW0RAEuZWZY4EKKql39FyUZx4y8pmsiTV8IjnbTBRVaBtRO5RzWaPs9pNRa01YRoEd9zs7ILo5Q/p9Mt6VZwliuE/XPwGayVbCrIshrtkGb41PEsfxSITczdOfxi2PPq6C7kfR1gARnCWhllj3JvyyRjdP1xP5aClPfPNUNTpAdYvVdkhNaXhdXMkUn9PsREI+lBQKHP4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR17MB5419.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?r0mMyyl4FutBZdJEHhpw0g2n6vaIJ2QYhcR0wfERxAwhQN6qxUUF49L3io?=
 =?iso-8859-1?Q?f6sV0ZW1/sHBEJJD+08joLntmXo664hSKz3uwaLf3LL1KtANTw7DcJejjC?=
 =?iso-8859-1?Q?UrDJ/1E3isa6tQPnLF84QOzeVxltPs/OfwYrCDZ4xDlPs1ymoX7tK4XPTX?=
 =?iso-8859-1?Q?1THd0KtZ1t/LaAdBmJCr/SPNn24xpZ3WGm561K+YySyiUFRgciHomk7xyj?=
 =?iso-8859-1?Q?rUEqPPS4L+fyHABda2HOn1IC0WjdFPj3gyDDoo1Uw1Ss8MjU8bQNq+895S?=
 =?iso-8859-1?Q?lbCPqjwVj5Aw23lezkQEpNbkl6hjV833GjM3dtuH+kxWpjIP9ztzuUlqTc?=
 =?iso-8859-1?Q?bCrcbR0jAG0uOXjGtnygSF+CvLI/kudSQLHrFJ0XBdstMN/ccDHr8iZskQ?=
 =?iso-8859-1?Q?Xd1L7Rt62cwbdJn92uKVrJjaruZFInQyhUtazXkQa/Gf9MaBVmZGaAEbKv?=
 =?iso-8859-1?Q?/JoX7Yr+59dvBRfXR3zKqXMwKq7wMXmcryikUncWkADCh5XXlhykRUZ9QL?=
 =?iso-8859-1?Q?akf8wsJmrpFxmFiOsiqPRSbTBOSn9BL5cqmHt2BmGhW7ObOPb/iqDFYglM?=
 =?iso-8859-1?Q?QwQy/yqgUqZX2qYXOr3U8Xs2hgWgTElh53GLZXyZrXJdhRUir4sJZ+PCfO?=
 =?iso-8859-1?Q?icKohtP9ZhYq6TZE4hSSutFNtJIHtt7DGhxPfrvc9zRWW9CmwqHt3IViKq?=
 =?iso-8859-1?Q?jNvHT2iRusVclE7mLqZZnqFUUr9FdmMNcv4T+sP70F7nN42lpMkG1EmXxp?=
 =?iso-8859-1?Q?zYHZM4b/bbW45x4LccQ7HIroIxcilPxEFjww9JY3Ctt5a9aBpjL2MzGFk0?=
 =?iso-8859-1?Q?tFQX07KIb+Ae4voiaEEo4PYyZFns1vaV2c1l1CrNekme9Q0wMbhgI7Q+W3?=
 =?iso-8859-1?Q?MWORai4bCCfnnm/ld+koVk6TJJmUz/FChgLV5/flw3ghIWuYeFBAr8cBKh?=
 =?iso-8859-1?Q?Ps6J0mnsNsO2LctRznuN8mKIaY0SUg8ErYYEwKL1/BluiHJrj9tWJO1FBV?=
 =?iso-8859-1?Q?1AZGS0axpPazk85xEBYrm4ew68EpkHl13LUqAFJxHHQtW9z8qPxQEAJjUz?=
 =?iso-8859-1?Q?81JXwV/nzrWlRZRMBnNVdXpvGIKWcSVCmVIw/cEyhxGqeLKNmQJDQl68qM?=
 =?iso-8859-1?Q?mzt7Cmxo5BxPeoDbgEY6GT0Eop0t7bJn/Pq80khthng82jQ9t9dATXnG6H?=
 =?iso-8859-1?Q?9t3qQvhTgwIi5uG0M0e9xgPrRBMRIU8PEtF2bJ30t+xsi5bYpGUKzCAlbT?=
 =?iso-8859-1?Q?py5+A3YeZMGiN32nR4y2lpNX/5AheSjdTmFBLwD6BB5FMrN1f0G/oxWj+G?=
 =?iso-8859-1?Q?1PPIxLwuCfP8yIfOSrIxyaPGjMIyDJjesZhJ7BVGe1lfI1m9hQtG2YfLzi?=
 =?iso-8859-1?Q?Xnr4f6XoTOpgnYqtnwomINfSj1FqFSStuvDBPluPFEul2ayulTgD2W2v/t?=
 =?iso-8859-1?Q?s3CSHWnB0DFM4zYy63jDTgyNHE0jejCFjZ46ahefsDhRyK10/xV4V8lLSr?=
 =?iso-8859-1?Q?ZoGUtz7adVNIS3LXX36tvInRgrDZloEHHnBaLZkpuo/4o8K2Jh1DtHNbaO?=
 =?iso-8859-1?Q?0Y9eiYgQKvAdy8GwdzPRdXjVxuzA91sDSyuhLV88+nvDGFV20LFoAqhE3B?=
 =?iso-8859-1?Q?wPqgxTEDALGpJDTSCvqk+zDpuhI0eHiVHG?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c7a6483-7074-4685-383c-08dc5fc6eabc
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2024 16:45:12.5657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 341ac572-066c-46f6-bf06-b2d0c7ddf1be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B0a6o6+eCJ65+RN2McnuMAVqK8DL9stO16R/Ik+d2K8IwkO2ChM6M6vFX8FShGDm6ZwrdkM0PlAhmbJdZaKOcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR17MB4741
X-Proofpoint-GUID: IAmQ_cBwORai1r02mjpvDOtjMfG4pGgC
X-Proofpoint-ORIG-GUID: IAmQ_cBwORai1r02mjpvDOtjMfG4pGgC

If the USB driver passes a pointer into the TRB buffer for creq, this=0A=
buffer can be overwritten with the status response as soon as the event=0A=
is queued. This can make the final check return USB_GADGET_DELAYED_STATUS=
=0A=
when it shouldn't. Instead use the stored wLength.=0A=
=0A=
Signed-off-by: Chris Wulff <chris.wulff@biamp.com>=0A=
---=0A=
v2: Added signoff=0A=
=0A=
 drivers/usb/gadget/function/f_fs.c | 2 +-=0A=
 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/functi=
on/f_fs.c=0A=
index bffbc1dc651f..8d72acf9a760 100644=0A=
--- a/drivers/usb/gadget/function/f_fs.c=0A=
+++ b/drivers/usb/gadget/function/f_fs.c=0A=
@@ -3803,7 +3803,7 @@ static int ffs_func_setup(struct usb_function *f,=0A=
 	__ffs_event_add(ffs, FUNCTIONFS_SETUP);=0A=
 	spin_unlock_irqrestore(&ffs->ev.waitq.lock, flags);=0A=
 =0A=
-	return creq->wLength =3D=3D 0 ? USB_GADGET_DELAYED_STATUS : 0;=0A=
+	return ffs->ev.setup.wLength =3D=3D 0 ? USB_GADGET_DELAYED_STATUS : 0;=0A=
 }=0A=
 =0A=
 static bool ffs_func_req_match(struct usb_function *f,=0A=
-- =0A=
2.34.1=0A=
=0A=

