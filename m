Return-Path: <linux-usb+bounces-35864-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNNYDUthzmnvnAYAu9opvQ
	(envelope-from <linux-usb+bounces-35864-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 14:30:03 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E632B389148
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 14:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5298D3033915
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 12:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F39583E3D8A;
	Thu,  2 Apr 2026 12:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dicortech.com header.i=@dicortech.com header.b="lA+yoiC8"
X-Original-To: linux-usb@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020126.outbound.protection.outlook.com [52.101.225.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF8A3C871B;
	Thu,  2 Apr 2026 12:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775132993; cv=fail; b=pkGjBhruLxxrHEAnMcmUrWhiWWYMaAG6QZuwo3kogrtnas9ZTppRZcn8wXQASB/Ile7sWqBEDRTzaFvIJTqmM45YI35hB1ZYM5SAz0JafVMVWyfglBcfgNs7uglZlpnlf8MP92vkWnxNP2IioLR6z3vnVZluvpKCkoqjTxeJ5wM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775132993; c=relaxed/simple;
	bh=IgUk/VbEaAQyAltG+YWZl0Kjb07chhAUcCom60WeAJ4=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=aoQHEwPlpCJFeCtGlSqDVQIbFUdfnC5qwFenTnECRwcHcY5i86jaCrQcc4E2mFWthQtTQS7Fp1t3+cJkyRNj1XBVtiMeG6AAcuIqMvFjV56wc9+zWCCO5m70bojhcKA9vPAtreBu1HLauYxQ/rga8yWyXuZAunmpvvayaNNMWFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dicortech.com; spf=pass smtp.mailfrom=dicortech.com; dkim=pass (2048-bit key) header.d=dicortech.com header.i=@dicortech.com header.b=lA+yoiC8; arc=fail smtp.client-ip=52.101.225.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dicortech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dicortech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/7Ix9Hou0Vj/cW5TGJcsaW9PVcm4s6Jo3e5y/AvKT8B86OiDF3bdddp9k2Vutx9XaCW8MJDPJpAmA8sG405B8L97GAqVdwH2fqAW6m7yiIH+YVHP0Qk5BOHwLBsrbdAmo95huoJi2WM8g59KCMZXzqzzBbLYztWixyi4CPd1xVGZmvY79sD/E3sCLo9ZbmmTYoz464xB3ldSLbFi4i5Ul4o9W24G48wAOS16RoPUN/rGZLmIFmxHmJmOtMRa5MqfKf+NroWIzo2Gr9tCeMwvlQDTdva/p7oJWh2nkztJ80a5b7QSpnQe61zRIKZMLi2Wapy5zAe4nfQRbx0CRK2aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgUk/VbEaAQyAltG+YWZl0Kjb07chhAUcCom60WeAJ4=;
 b=uCPSni6iJuSdT+BRWmSjE+RvD9pLUhp6+AxSY51pwBwCfpCKYjmxD2vLyOFNgYpOEFb+GvwmeEpR2IthJGl3FGgpmLJ5PYIxkjJPx6Zks4hpaTCRBWbY8xVCUDSBLvRRd3JnDaairRZasrRPH3oXSY+fazm9bPQIxTRjj/rVwmGjdQXCuEiysadJwuHCXBSJJoktOykOkCb+hP4MZgFWIJnkgQOEkhbURctTolCFWyzVaV4ygxsnbcdH77AYEDyo+TqQojvz7QAtfyVaeY86GcTGkalUwUjXzj7KfSU91NM/Kaf3mJD1QX3uubilyZepOi38y53KCPP6OASue0ImcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dicortech.com; dmarc=pass action=none
 header.from=dicortech.com; dkim=pass header.d=dicortech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dicortech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgUk/VbEaAQyAltG+YWZl0Kjb07chhAUcCom60WeAJ4=;
 b=lA+yoiC8iHUBGItCBypkZb3hdeqcePorTshii9O80t2zWzPQQVv0c8YdlZ77j4E8appFt6Bbqjyc21BCo/GFYnLAxvvn55t5ijnzZQvch/LehOFM60KC7hXZ2yAnrDUPIkbKFMbh7J54LmJ766r/HTfvIY+CKLhK9+i1eZiLjggSW/fUG1Urc0d8dpVS3e+HCB5+bwk2IhDDLkW5zP8yMx3on8ElZ0Qt9hmZRLiMD/EuPL6xZ6YFfSY+Wk/NCZ6v0YbeaiHz+P0bC3q6LWCWVPsV2Ip7j+QYHhg5Ep2UxNT1NhGee6aWb2D0TR9NuINcUS4K6OAdZzpvHB65pknhNw==
Received: from MAYPR01MB10413.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:154::6)
 by PNYPR01MB12786.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:309::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 12:29:39 +0000
Received: from MAYPR01MB10413.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::773b:1392:c68a:5958]) by MAYPR01MB10413.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::773b:1392:c68a:5958%3]) with mapi id 15.20.9745.027; Thu, 2 Apr 2026
 12:29:39 +0000
From: Roshan Binu Paul <roshan.binu@dicortech.com>
To: "hhhuuu@google.com" <hhhuuu@google.com>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] usb: gadget: uvc: fix NULL pointer dereference during
 unbind race
Thread-Topic: [PATCH v4] usb: gadget: uvc: fix NULL pointer dereference during
 unbind race
Thread-Index: AQHcwppyerCTMc86kkuRGl57YVt8rA==
Date: Thu, 2 Apr 2026 12:29:39 +0000
Message-ID:
 <MAYPR01MB10413B6654E013F981EAA7ED9EB51A@MAYPR01MB10413.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dicortech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAYPR01MB10413:EE_|PNYPR01MB12786:EE_
x-ms-office365-filtering-correlation-id: 6587035e-ef38-4b19-b848-08de90b3826c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info:
 Dkh8WcPjUfdcdHSjyfctgsMjmxnSLCqFGIfEvbmx5R0InGJ/RIaxeZuz6DsOtYGU5WNOlw/bsQrRlV45II2cvFcrbVvdqtPyhViOY5IFKK1xRWtoEt397n2YBwfG+oZi+9GX94U0te3yVS6jXgWmv+sA8wsDbL6nM+taWQnPy2kvU+/Vsrr5vfdJADfdjVsFfVzX0OZmH7ZxYuEa3XkgrAqNuNE7oIJJtCZh2nRVRU2y6ifonGVY0nJbyoNZ3hYE34ovM/hgav/+iCuNdwxWxbO0mRohVwBY2NfUCmRL1XYjhaOMW15iYPs5wDr3Av82+CSvNs0hmi/e3NJVyL7ytgD2NWpmXU+AcrRc31VtZCxwA3qSejvm4QdDAloFmTq9peqaDkHGTYLCKlewts/oHBwRCEHMsEMxT8guXFEpHeTcuzNPNSAb0mXudUWU04tLUSgMGuEmz4uTwzls4RKay/905sXRhfgGTXzqkmTpGDdt3rNZpGDlVFA03I8SRWJ5UsZJlGHlrzYpsbUen8RC3ZNubrSjoj0snr1aKePlEdiyDdlhcNoxPLpKDwS3R1iWGZp7BHnngKZ547HbLw+eZkCxIOo1Q/+hlFG9in542/C2PxdcWMf7KpspjdZ7LHAT0YpkmJPrtlCdozcs4SLI+iQELWNkH5UbHxX7iesWHlf/j8r05F0V+/N83S7TL7toZJ7N/yeEt8Ve+9MuTf/eWNuSWl8Ox7jAFAlv04e91WgwItQNErkW/i8OOfxYPib37ZEr/S3Z0dzX+n/zjWT3aa6strouXTxHecwvFCHHEBg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAYPR01MB10413.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?kDBsYTOqFErm6w/b5GgHYy1pFTPIZLEQ8OUKE0E5/Do3eobV6EwUS5Oqcu?=
 =?iso-8859-1?Q?LDzCrSrG5orIfM9M0nP3QQHMQLZ24xbCA5JTnaKjbh+hhTnKuaR3t3RoIO?=
 =?iso-8859-1?Q?hffupk4XQj2L9JohIOKCAMY0806o3r1teuuM2iILAyMKa9mDJCLH2dHBaj?=
 =?iso-8859-1?Q?hvot6k30bridGGmgGYDJnJtQGOfDcWeqaEnK/5x53UpGcq7V1QXgd/Vr1m?=
 =?iso-8859-1?Q?KRybmMC4LMglocWJbpDRYOkhdag8fajlyrr2/o6Spj5AO2A4Heo/Bo63+n?=
 =?iso-8859-1?Q?WnseVL4JR9aMrBMYaik8QlzOGbSH5/BDCSHEBtnfszd/syyzlMPU4YYiY5?=
 =?iso-8859-1?Q?uRmh781+jYxqow32/0ti5goMZYgFc4+o8i5wOko7PHWz6o3quGLP1f1PlN?=
 =?iso-8859-1?Q?pBRjBZiCS3bzenkXIC142nRkK7DBx7R94jvq6oMjsLn312L8mx2eOzvucY?=
 =?iso-8859-1?Q?qT2QjdtHbDyt1XoFrcz/PdBTyU4SHcRoo/I03QojLz60GyoojazEuW/+lX?=
 =?iso-8859-1?Q?DHDGjbf/UxfgpHkYHpowS+0RsmiWU/ENGPVuLKovce9nVZHjSj76pJmbMP?=
 =?iso-8859-1?Q?r6h0i/YiqWwd/pzdDmpHuNC2ldGFlasZ6x+7Sb8R2KyXCUJpST/HP78Rsh?=
 =?iso-8859-1?Q?+zZCllLHjJpUcPHToTF/PwBeH3kQZiKUjLhWvSpPf+i44uoRcMbr1w2PHm?=
 =?iso-8859-1?Q?1xt1Y3cUnDuj4x+LlX3MqzMzqEY/u5P1tDrDI8IBylJr9bja+ZM6ZWoA3D?=
 =?iso-8859-1?Q?hmhnfzWUs/+C/q0adqXF284ZHWMR+85Uh40vJ4C9PBmF9pX21gTOgaTQRC?=
 =?iso-8859-1?Q?H43qGeDGrqgsW4mzWs0YHIvwf26wbx9nguSOL/RLoklJWFOGCMpPffhil4?=
 =?iso-8859-1?Q?yN8D7wrzWolYtQZ8mcyKc8RL8FI+RX2mDicPnXjpfO6SpIyKB18sz0AK8Z?=
 =?iso-8859-1?Q?9T/cOPtKD0NsZUuyhLQUMbBSgxl5q0L9qtu3ok+WBsIGHQT9e79RyEUqcT?=
 =?iso-8859-1?Q?8Ot/ZOeBW8j0HsMyKkmOxe7viH4nJfRdTdGXfEEYfyWK2rcYMplXOKlzr+?=
 =?iso-8859-1?Q?8Xdpi5Swd7cMjKJ+EaoDHoVOxIPp32Xe+siHvEt+KSqwt7SqWGpNXYmnx2?=
 =?iso-8859-1?Q?rpg+xi7hdR/e5Yiy2iGE0xAreQ6Wr3DZ5icDyvG2U58zrw4rBRDVBLyKJA?=
 =?iso-8859-1?Q?s+qTzgzqcapHvNy59UnHBY03iaqj77KeXUGSUTZWOWzugU0HrrOmm/sxtB?=
 =?iso-8859-1?Q?HMa/lByyzzveyVDBzw5hNBidGBtqp3n+TFe+kmCoyHwKvUIBxGye3AMfVe?=
 =?iso-8859-1?Q?C6rFnEIWjUFsSuhY+Kfld00O+8MT7vOEm3Bw2Noy1y4joXSYAxa1SuzrDk?=
 =?iso-8859-1?Q?6+EvzA6vkgja4qXjbq9SGVTX0twIKKET+HPvhIthMA+e71VIgN1SxmKZvs?=
 =?iso-8859-1?Q?oRWP7tuPu+gBigAee4tJeWmpQBGgB//vjM9OTxqAK2Ryjz9a2yrFyur/Au?=
 =?iso-8859-1?Q?DNU8SW1lt4BdRgn4ZvtmYpECgRry40ve9J0KZftSmgMHmn6mJknU6x1JDJ?=
 =?iso-8859-1?Q?f/CH4XL6NKzfpnJb86FrDrirLrdb0BoZcInVQgu3Yw2CL5xgr/61oZPtSb?=
 =?iso-8859-1?Q?j9jugPsGGfgrTvC/UnQFjEFdV5m0wsoGnvTVOV4ZKtfq7hRc3jCRqWnYbr?=
 =?iso-8859-1?Q?uH67mCcGu8Se3cvk1yPLkhP3qS/0SgpJQInPxYq4faiDFmkl9eoUGID25n?=
 =?iso-8859-1?Q?GFhsbGEoEGLiHQZQUj3f3UTivFL53s71QJVfzyPtZWGX8omE+sj+NuwBP8?=
 =?iso-8859-1?Q?mCp625wdlx4+cysPgLHVncPVTyFBScxkzOSdJyUH/VdAYAPXHno5/lHIiC?=
 =?iso-8859-1?Q?RA?=
x-ms-exchange-antispam-messagedata-1: I++H0qFVUU5QgQ==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: dicortech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAYPR01MB10413.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6587035e-ef38-4b19-b848-08de90b3826c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 12:29:39.4289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7f6b2399-cdd5-4b48-a44f-ffb0bb0965f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OzByNZqlRoQu+IDQXUnQNGORNR9gG5kbkZtZD4TT9tWEF4LIa0sYOVw9xe0Rrvfz2zYxdIAPB09luthtvX7KctpR127WRM3YpTI5Y9lKNfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYPR01MB12786
X-Spamd-Result: default: False [0.84 / 15.00];
	FAKE_REPLY(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[dicortech.com,quarantine];
	R_DKIM_ALLOW(-0.20)[dicortech.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	DKIM_TRACE(0.00)[dicortech.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35864-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roshan.binu@dicortech.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,MAYPR01MB10413.INDPRD01.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: E632B389148
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jimmy,=0A=
=0A=
I have tested this patch on a Xilinx ZynqMP platform running a custom=0A=
UVC video streaming application.=0A=
=0A=
Test Environment=0A=
----------------=0A=
Platform =A0 =A0: Xilinx ZynqMP=0A=
Kernel =A0 =A0 =A0: 6.6.40-xilinx-g7c7280e64b31=0A=
Application : Custom UVC video streaming application=0A=
Base =A0 =A0 =A0 =A0: PetaLinux 2024.2=0A=
=0A=
Verification=0A=
------------=0A=
Confirmed patch is applied by checking for uvc_vdev_release symbol=0A=
in /proc/kallsyms.=0A=
=0A=
Test Methodology=0A=
----------------=0A=
1. Start UVC video streaming application=0A=
2. Send SIGKILL to force terminate the application=0A=
3. Wait for application auto-restart=0A=
4. Check kernel messages for NULL pointer dereference or panic=0A=
5. Repeat for 10 cycles=0A=
=0A=
Test Results=0A=
------------=0A=
SIGKILL stress test : 10/10 cycles (3 Reps) PASSED=0A=
NULL pointer crashes: None observed=0A=
Kernel panics =A0 =A0 =A0 : None observed=0A=
System stability =A0 =A0: Stable throughout testing=0A=
=0A=
Prior to this patch, we observed NULL pointer dereferences in=0A=
usb_gadget_deactivate() when applications were force-killed during=0A=
active streaming sessions. This patch resolves that issue.=0A=
=0A=
Tested-by: Roshan Binu Paul <roshan.binu@dicortech.com>=0A=
=0A=
Thanks for the fix.=0A=
=0A=
Best regards,=0A=
Roshan Binu Paul=0A=
DicorTech=

