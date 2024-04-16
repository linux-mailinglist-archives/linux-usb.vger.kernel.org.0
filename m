Return-Path: <linux-usb+bounces-9407-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B518E8A74B3
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 21:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3ACDF282E40
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 19:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01096138493;
	Tue, 16 Apr 2024 19:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b="EHdW7zxB";
	dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b="oQIbstlc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0068d901.pphosted.com (mx0b-0068d901.pphosted.com [205.220.180.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22980137C59
	for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 19:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.180.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713295864; cv=fail; b=qAG4qjgH47BNAndeG4aAkvhPgXr2JjZfpzRbtVLc2zVXvhJgmmRQTQgPy+OW7LimeqcrJMYA6ibgDI+cjIsc+hilpV43zLsT/oWgc/Pr1VIiUD9mgbZBXflr9P7ze6tWaqAvsahdOxnD2+6r8y3Y5PW737D5Tfa9e4RDhpQWqf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713295864; c=relaxed/simple;
	bh=izGRwTzLDmLKCOLlzuoG+qrp9/Tg3Aakj5XF1lUEcpg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CyXzZEE2ub9aLrBPhHcmYyBkkAtWjPsgFZiQHuUYqzpOAdblf/755BvyOXWnYiafW6EQBRe+U60AkkBxE/U7VaMqV7Kb9vBUw41EGD/KmXmCW+4PiRw4/aKxniPePXmdMewRWsdxYISikM8nicvZr6lyBH9OR1ZZ8vLtoE+xpQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=biamp.com; spf=pass smtp.mailfrom=biamp.com; dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b=EHdW7zxB; dkim=pass (2048-bit key) header.d=biamp.com header.i=@biamp.com header.b=oQIbstlc; arc=fail smtp.client-ip=205.220.180.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=biamp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=biamp.com
Received: from pps.filterd (m0278265.ppops.net [127.0.0.1])
	by mx0b-0068d901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43GBL44I018879
	for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 12:28:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com; h=
	from:to:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=proofpoint; bh=mrp5Qu
	LaDAzP8K7QP/yS4eAUiST/vtUcjnLmyhpLG/8=; b=EHdW7zxByaCA3Q3Pq1tp9t
	DCY4r7ZLpgGoscctZ857UzpjKFeMkx3Ysnn7IuAIdmfjlXa9QKCx5lkDXflZjHG1
	YIzboj7XbyvlN/B0ttN1C2AMe6/trAHEBq8yQxIm5kdXfRyl84VTH8JXY3+3erZQ
	Ea0EDepEqTHu5OwJ5jSlKJYEBYCnah8o9WtqJaETt2rtvdRvFza4BVL/0uloRlZy
	r2nTXaBPhfjlG3Bpht7+mwJJE/D4bBg8S4oS3fskechMsCtJn6rx3FUQ4/CQWysP
	gdF3do8gKMZQ+Fv66YESdhsWgC05R7h4LzzTrF/6XrC9g1tW3Q5Dt55AL+PoVEow
	==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0b-0068d901.pphosted.com (PPS) with ESMTPS id 3xg40v1u1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 12:28:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHfSv59eFAwfYBsn3FFtL+z2bvlyCGy6EHqenRc9eb3sxCIGKVIo7jxriXlea0/gQ8BpdH/OF3Vu/6Kb4yQKADPwNAmus/J0M9AC8ybsF/RNbaAdVkjcVI4tCDNsrhNq51jBkxzULC8yT3jlkaVksi1VnpLQXqIUAlqsUvYRwX+b3lmf0B6OZ4iV7AxjSGz8e/4QhrOxk/ffxOqfXUbqYGlxZDTmcC5llHYtvvlDCS9Q1Tb8oFaB1dyriYCZfdrRFd9HjIGpZN5eo0o1RBSThSVXPBqjQVl3l7PZqG+VWobFC400uxEUceQuurU/4L0lzPM0ZTmyOkbArnxE0O729w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrp5QuLaDAzP8K7QP/yS4eAUiST/vtUcjnLmyhpLG/8=;
 b=kXsK2VA0o9MKRneBI1OkknyQQ0NWDbZBskEIveS4sYIZzjgudekWYYOLV6zg2mH9wnbkDSWNyRh4ko0M0nYHhEDwrU1wwtv3K6owM7oh57N/Cxw4Cyg7spyS1qc8eyBzVgpqvKbo3Ag7u38z/1/we+tCwa4EwdGk95hEYrUoAgZuJMgkfil39Pbcfl1RCCkN4h0ijDUDKX2ivcu8loTR6xBURGi1mZLRMVNHuNtx3jVZV3jpzDuiU8G/AwWlEYWQe8SwtgwrleVkd/Si8rqhxA7xG52tZXkDZjuvHh1c4FZ/xaf4F5jJQdpBCAVIi/OCs9pmCVXodbvImIBMwd8nJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=biamp.com; dmarc=pass action=none header.from=biamp.com;
 dkim=pass header.d=biamp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrp5QuLaDAzP8K7QP/yS4eAUiST/vtUcjnLmyhpLG/8=;
 b=oQIbstlcwfAx4cdqpScuA7sMtNqYaahME1YZseXnlIZU1yhY1iyk5jdRGp0RiHg+mMj9kLLDjGOQ6oKZMLzD4Wlpjz22qt+URSWzoPvZgIHJdRaK1q9/iGvWDD+ETSEw0SSQ7uwnIfeT0gNWnlqhFBnEV4vd2j9psyxu/pYOBO6l/1YxPxGuKx2WJibuo/eIjgTLyFD6L9gEYZxreu+z4+0/N8rnrEsKlWorsmrTGTBTZqy0ZlB5wUsZyVTcMhBeQeEN9099xv5eydU14THAl5sqvzZ7JbS6OPsA/mbLWv8+bGMbetNzvFJK+Ka19jXjlJAo6OX1J2C3asu8p+6xgQ==
Received: from CO1PR17MB5419.namprd17.prod.outlook.com (2603:10b6:303:ec::17)
 by PH7PR17MB6001.namprd17.prod.outlook.com (2603:10b6:510:12c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 19:28:27 +0000
Received: from CO1PR17MB5419.namprd17.prod.outlook.com
 ([fe80::f48:ee61:a81b:d555]) by CO1PR17MB5419.namprd17.prod.outlook.com
 ([fe80::f48:ee61:a81b:d555%4]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 19:28:27 +0000
From: Chris Wulff <Chris.Wulff@biamp.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [PATCH] usb: gadget: f_fs: Fix a race condition when processing setup
  packets.
Thread-Topic: [PATCH] usb: gadget: f_fs: Fix a race condition when processing
 setup  packets.
Thread-Index: AQHakDP2vpYXDIKUDkq18XpJP4iCJA==
Date: Tue, 16 Apr 2024 19:28:27 +0000
Message-ID: 
 <CO1PR17MB54192FDB6988F5C4F5C4E41DE1082@CO1PR17MB5419.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR17MB5419:EE_|PH7PR17MB6001:EE_
x-ms-office365-filtering-correlation-id: dfda5e2d-4835-4d6f-9125-08dc5e4b6416
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 znvw5GKSS//WOQdNJ9jk5ChwNL8shGktradTdQTksOlHbi6nWrExDWGetmJn3mDKdgk2bDubGieXmCwKin13EDhROpwFBshMEHST6UBYIEpPmYXmlaoDWvL2R/EKg8dmr1Es/3JAGZtbBPUURm8GhMVUNgFzFp7+2XjhczQE4LED1+hxw3CxkMiGt1HPCuCgs6/gKL5v5cJqagOH3Mq/3kmbDkIrMxKNrJZdUCHBtZlpO6GBYe6ThT+0E0xh51Z3Okr3BmNgojbenXHhDTSIXtqTO0Fl3b0X5kwbECcTgpj//zbSUShlyWLJEguoc03sUErlbzvyFfl4xvU2QwsrUJstUl3UwAX2QuGiZYcWsuH2XEaaXaNKKSDsRFfyEgElplR5BrWuatinSH15Fvy/ahII8DIfmn9JOnZ3sxLZ4PMwRfNnJVXLxLQETyC4wRB6GoAJGZJ6Scq9hGYbrD4v2+lD6QueHEtbJs8tze87r8vPS5HiZCBF81sRU4vPAVLaP6XNJJAOhbOEuS1zRxqBLwLweJ5dk82ixazhTONKIWFIXUzIDLw+qk6IEM8aRsDFlTP/RyBNw+Fk22Ddkc2F8bNg5dZRGjhVBP6wKYtro9ETvmntywVXH59aTvrd9cilVubVu0yChWcNzm5XA3qagcg+zc/zMUn+IP3xMF1CkBO48PC7ouuuAihfJxmHlA9TxgZm9zjHbhHGpkh8NvjHh2VYpkkErhNRBa1rByGUMuI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR17MB5419.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?rI+RoUFXDwuLDz+nMjrNyckYGPAKHbh/v1KkYzzU+FmJKwFme37wgCSEaV?=
 =?iso-8859-1?Q?psbxmTRmS3V/jf4iKLWn0QN85ruVHdtfaf2neqDD2QVCgBS3lPfmbqU8JY?=
 =?iso-8859-1?Q?FejYnGHLWBMFdYJk1m8NUOh7pY5hATdtTiEEyOFoE/fou8GQLI0N8mHbpU?=
 =?iso-8859-1?Q?ROk2tckkHLpFGVgaxbfCWmRkqgyh4AkccPVjgtHh0uG50Qt1C0Lg2bobeQ?=
 =?iso-8859-1?Q?qHvO02dvaIWC/4Oc0tldaFaWTT+rpRt/xEGcOkNcbewss3QiSZVp2MN40K?=
 =?iso-8859-1?Q?TlEcx6PyiodJbpJIzWj3GFX3ER+lMolcb+o20MfDVVtcUbBLcBWPn9s03Z?=
 =?iso-8859-1?Q?BlZrsM3k1zkKIqP+fPL3qUrkL2FinAMc9RxE52vmykgswMdDEiaAsmBhys?=
 =?iso-8859-1?Q?+E6CJLS8mOUzx1Jai2OqFunPoqwG/VZ+UELfpE6A9yQ1lOy1C7NVm6L79O?=
 =?iso-8859-1?Q?aV7zESEKOBw2AGwTphnRJAn5yZUq638UpcB2SlgTk6q9P80/3ZKyBaB0dy?=
 =?iso-8859-1?Q?2F70BInr9DWNHkDXms7S9KEyOK3gVwuYqABUdM2rRzWMvRQFzXTFumEle7?=
 =?iso-8859-1?Q?WZ99l+NexhsEAxQqwSr1EWCQjf5HxARB5OWTIK/KeedA4D+kV8OWsNqTT4?=
 =?iso-8859-1?Q?J873XAPM2kZfRsQyeC5in5mM49Q3cAN1xUI9Y1OjRWmQzyVQrJijPsWFFb?=
 =?iso-8859-1?Q?/1aFjWxgecYLAgKHg/4jsegxQLw3FsU2HO/LoNRXOo+V74GB+twbzYq9tc?=
 =?iso-8859-1?Q?pnEfysaYwtUHdRdukBZrb2CSUMa16nyyMDFciYaLmyFmip+ZyROUceGaip?=
 =?iso-8859-1?Q?rN2Dor2Pit9WbUWRNF89xtFDxlq2H7K46ary41YEjr2VGJcqoUmv5GK8cr?=
 =?iso-8859-1?Q?GHWtlYTV279/CSh6WS/7MOKdhe4+SC+MnVvlhzzcpDLkv9+F9OIacjcBtq?=
 =?iso-8859-1?Q?nQdcmeas1LE2wnfodM6DwFBqfYSvBon0GUBgH5Oo4O/ubJjWHj/ysmqgIy?=
 =?iso-8859-1?Q?3LGyyR/okLndjXPCKD8fnEDcfg2uQdTyPjY8zMt4oC2TMWsTYuDcfMn/2e?=
 =?iso-8859-1?Q?IZv42EIsZqIMHqfZZ/q7z9H3cYIlVEcofy5881TLHM02iAgj7yfGZuVeIG?=
 =?iso-8859-1?Q?1KNZEh8GHmQvp5V0KrTCmd/0EilY1tmQyf8zizBpA1aK64/sktf1dcLLma?=
 =?iso-8859-1?Q?02Cz0G1XovRRz63qlhwmGZrU/RVlFVDNZkzeyRssjLlRm+lek3KzP2LSOC?=
 =?iso-8859-1?Q?7LPWjHOgw0tySzrbw0NWeSlalG+OY6msXOPTckDidqT+12pWAjPINsEtmV?=
 =?iso-8859-1?Q?yywE04f5W+RVQABM/q+jRUGXe3Bjr/BQy/POzecn54Iibkw2yVk6leos/2?=
 =?iso-8859-1?Q?FC8qoohmbCQR8zd2est3+CcjVvsqLaIuc6B9ZStEz1c3UA+6NyK+KvbK5i?=
 =?iso-8859-1?Q?TSxDOaLcEId7Ih5+yDqBNaPDU02BjemC7Bff2yXU//Xiqyq67jERGL+Qsr?=
 =?iso-8859-1?Q?2PxRH8Oo0T99iomPkNKubNSKqjkLJGZ11HmBD2/on10KyJOdMIgWgUNUeU?=
 =?iso-8859-1?Q?8CTRgeOEAFwRzueRtPCURomgEyrJyIYD0TAT+DI1oJFfHKtYWcXTeynAG7?=
 =?iso-8859-1?Q?lo5xxNRrRCkPY24IAXToiYqIIUeEaMx5ek?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dfda5e2d-4835-4d6f-9125-08dc5e4b6416
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 19:28:27.4480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 341ac572-066c-46f6-bf06-b2d0c7ddf1be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OodZ5Wme/DUudi8KlD8bFV07MLI6yRjPIzDKfkXvqlu8HJMvoM33W3XQ0yd2iOeupENgiF6qP0zM057u2KOFVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR17MB6001
X-Proofpoint-GUID: IbuU3ejYebdArTVPtuG2S5vaME-dS7O3
X-Proofpoint-ORIG-GUID: IbuU3ejYebdArTVPtuG2S5vaME-dS7O3

=0A=
If the USB driver passes a pointer into the TRB buffer for creq, this=0A=
buffer can be overwritten with the status response as soon as the event=0A=
is queued. This can make the final check return USB_GADGET_DELAYED_STATUS=
=0A=
when it shouldn't. Instead use the stored wLength.=0A=
---=0A=
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

