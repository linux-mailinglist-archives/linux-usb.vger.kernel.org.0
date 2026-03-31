Return-Path: <linux-usb+bounces-35728-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KG+ALm68y2kwKwYAu9opvQ
	(envelope-from <linux-usb+bounces-35728-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 14:22:06 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76870369683
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 14:22:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DBD2930266F4
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 12:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8853E1CE6;
	Tue, 31 Mar 2026 12:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aumovio.com header.i=@aumovio.com header.b="GVOR3ghY"
X-Original-To: linux-usb@vger.kernel.org
Received: from BEUP281CU002.outbound.protection.outlook.com (mail-germanynorthazon11010021.outbound.protection.outlook.com [52.101.169.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82452C3251;
	Tue, 31 Mar 2026 12:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.169.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774959710; cv=fail; b=lHLQDjNeJS9G6mZZxRX0rdkXtNNoJrQ60J8hWi2AYSNaMLwFK36eahuC2diE1qL/sZrBLOY+m++qcwpkd1jHDJJG6DV0QOwnYqgh2xwyU3JH9kuJYgufpulcspXAWr1TTKYVOZO/UfgcOgmshZkH7uBmXbtA4CnBx2wx0F0PsOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774959710; c=relaxed/simple;
	bh=MEUg3q0tkPCpqItSMmrgLP6APghUioCJ2hD0ISLP+OY=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Mg/uDnmIzxJUf2EwMwHgEBlxvXileLpV3j7A69Rzwgy7oNIkfD6n1QvWuwsP/s9uncVVcl/u1xyKbGYI2mKHKTBfRKAkChcoO+dbl77fZFZAhjFG0WMLzLsNSPDRHoxGd4feLkg8UCjjrm0538O68Rc1IW5QF/lzP2JAqoAIvqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aumovio.com; spf=pass smtp.mailfrom=aumovio.com; dkim=pass (2048-bit key) header.d=aumovio.com header.i=@aumovio.com header.b=GVOR3ghY; arc=fail smtp.client-ip=52.101.169.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aumovio.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aumovio.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSMYbUEHj2WOfZFfFSBrghe3zkI3atXu5d4VjiaprFhy2XitkMxD0A2fiFjdnjrHevGFQzgWcnKgaekb3FMp+mLK2rBlhncCAg9PQXEK9Sg0JTm6ksdrg8u2Bix+1lT1p3ptFeV0Bp81GMwZY+7bBWJiilGVnofYY47TC3D51jLZP26RopYRlMF9bBNdfqMnPaFgb7lGVhrx9mQj+8UKSrR50DoEeS7hXU6LS3NurT54yCaSiVOyasgXhmdKZQBZ6dRJT127D8T6k0SWHYmfjZRLVSoop5cE1jeZF82K12I7eMPrBx+DT6vqZnt2OfPcCP3257ap47Qx6nyUgu6Hcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7dff4dPxq5m+gnqNq0rj4gKfmKVGPDV0KnVDORXn8g=;
 b=gOzZWXN8cKuYJTtwdAGieobUnY2ubg+UsIcBbn4AZTp3EubX4NjlKAzVuvNRgxrQOwJzfRHgeKuxW8ryQQhRM/KOYcGnUTlgPv0IlQ4Hyd+4GLmU9EdZrWov3VMffp4/QCLD5rn6OLQqyjw2DCok/D6ZsY1z72pdVNXqBOioNw6dR2qRQbUjUH2dywI5Uk0A7GCo31AfY6Ga2s5cCWX9zHt7gsH50ezA0YBv95ngP7MBoSiQjmDIP9phx8U0tjNWibONJX9DPF2Q2HGLHh2jAIq5nYYi4zSR/9nVJnX+MU/ghY6C8CHtCxsru8AdxXFC24BGYQPd8Cfg3ZrAJUvn7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aumovio.com; dmarc=pass action=none header.from=aumovio.com;
 dkim=pass header.d=aumovio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aumovio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7dff4dPxq5m+gnqNq0rj4gKfmKVGPDV0KnVDORXn8g=;
 b=GVOR3ghYUlKFpLYiByXwweu9Dljs+kw7dnOJotG0smndJwdvTS7rkvxi2iwrF952ayF3rZK7SD1GLrIyuL/mP+j1y9dFpRUT8rXTR7U3P4xm915rfR+Wkx2uVMtqcnJq70q/ffW7kzJE7LDg+E/Ww9TXDC64TAV8mlmxLKYT88P1BK/wq0bqbAfZQychFiOxgvbWUnOgzJm04qdZqkHARwHB93/KmjdI2G7rHWgZLRZ0SVGpLhJPOmNZ/OcnTGHf5/iZ9M3sGsjFo8VFAaRcfRwRzv3/IzyUDTdHYVNNQQCbcGduRHSP+ycY72YXmelwDtWFTMvjV+Kx53iS+WGCbA==
Received: from FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:41::9) by
 FR2P281MB2860.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:67::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.29; Tue, 31 Mar 2026 12:21:45 +0000
Received: from FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM
 ([fe80::e8ba:f0dd:af7a:ede8]) by FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM
 ([fe80::e8ba:f0dd:af7a:ede8%5]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 12:21:45 +0000
From: "Andreea.Popescu@aumovio.com" <Andreea.Popescu@aumovio.com>
To: Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] usb: chipidea: udc: reject non-control requests while
 controller is suspended
Thread-Topic: [PATCH] usb: chipidea: udc: reject non-control requests while
 controller is suspended
Thread-Index: AQHcwQg5wVeiN+sx6EGbnG0btBxBJQ==
Date: Tue, 31 Mar 2026 12:21:45 +0000
Message-ID:
 <FRYP281MB261885D9851351180B1EC037EA53A@FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM>
Accept-Language: ro-RO, en-US
Content-Language: ro-RO
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_7e753c2c-bb14-4786-921b-97c6a6fc424f_Enabled=True;MSIP_Label_7e753c2c-bb14-4786-921b-97c6a6fc424f_SiteId=3bd97919-57c3-48d3-9e9a-8e4c01614a8f;MSIP_Label_7e753c2c-bb14-4786-921b-97c6a6fc424f_SetDate=2026-03-31T12:21:45.108Z;MSIP_Label_7e753c2c-bb14-4786-921b-97c6a6fc424f_Name=Recipients
 Have Full
 Control;MSIP_Label_7e753c2c-bb14-4786-921b-97c6a6fc424f_ContentBits=1;MSIP_Label_7e753c2c-bb14-4786-921b-97c6a6fc424f_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aumovio.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FRYP281MB2618:EE_|FR2P281MB2860:EE_
x-ms-office365-filtering-correlation-id: 2b93d1ee-9406-47c4-1aec-08de8f20131c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|18002099003|56012099003;
x-microsoft-antispam-message-info:
 xSuRPUTQfbu1OF4qp1PePJUc4TREyIFBay8XWiRgDjpmdvvUvPD1zx/kS80HA5APFnO+fWuJCgqzj4E1gC/Ma/2OHjz+Sw8bexPfi/ZzLNugmBNbpzo4hpqIb04s329urhPODRLEc9yOl105d2HYXcYBE6n4KkB5+JkmBJ094y9eHieMTa5pG3TW3QXHCszPIJaCSosnbq00oGGkneo/q41B/pVDEkc4q0nTckwBO7GFbX6XjWKTRUObAI6KaEVQjLBvVlWpFOPy/QO1IsBXu30lSfK1JJO8tP0TYIxXD1za5vVtj+bxpjEIxBVoqWq070y5rSZxLCyUWrxODa24E0YFpKDTNbPfpaTF2w7ABfCaIldWj45F+YQRDtUkvmBownRidhTX58X0yOkof29vxs1qDojA2Wr0NFiggEemH91Y2dF1HXZlIbbXgz7+6SCHURW7RUOYca7lF9LOkX0p7/S54qB4c3gOnZwx3ehXwQtizzIAoDK1dq4GAcetvDpjVt3kS/OUFYoA7rpQciWOrfPt1WRmzeGvE6OoJo3sVm0ITX2cH3ZR2FJ6KdUPvKdYJSFJ8cKs/KWcvTwrD6OKte4FNtgi8hSuLMaflXGF3SSLfu2OhJMFHNb+nXcFqZPP7LjQRUGN909DKfSYHLHmJv1TCY+fe3/exb2NXLS7mOYD2mi50f8vPKDP0/mWHjzV5eWePBluASQa6AbDas+5Q2LQc5RYKe8EfCEPu4tb930XSK/5+EEcWuqPC+2rBd5qpPzXDDjrfQXrQPXbuWBLbgOvhskKAUesR8zmWSaQo2k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?windows-1250?Q?XW7cbHzLayTDgqedcm0kHF3GTFoTrYvJFm5CptgnQYLkY+zU+8TW+pRO?=
 =?windows-1250?Q?sSO4ETDTbdKDfW7v6vexudxCxfu9LqVzhF+70kmDODDx5o9H5oefUTpw?=
 =?windows-1250?Q?d4wdzzXSm634J3PJ+P926Y8CYeXgnfW4bMibtvxHnsFCRsMUXoKkgjtP?=
 =?windows-1250?Q?BvSQYOBucYhuR4Kacn5m283xpIQ+3A/jYCFbllGt3Qg4d29BKTm/a+Sv?=
 =?windows-1250?Q?d7gop/xqkYczQbTGsmuSHaf9tsgaMC2aBQ6XQ5kneg7BaU2pH60bPWOM?=
 =?windows-1250?Q?iaJEWErD8Kixi2OlxnH/gKdPkliyM+fTJ4GsJXniPMIAG8lypGA7qAWB?=
 =?windows-1250?Q?SN/LLjb8OZ2FpaHqcRKB9TkQKoSrhOnRDUDa4c/FBbrOrNwprRdzGCGv?=
 =?windows-1250?Q?zbICbTOGh9J1vk12jaalba2jzUsKLFRJf3JvbhVfaApWBiXcBOpiGhjS?=
 =?windows-1250?Q?caaslts7jVK+8U2HRo4Ay4algZ23rl1qHkN4JQnea2ozsCRV6MAOwXLP?=
 =?windows-1250?Q?ElLbUHjjkUUUJfsFaxtIbB2zRTWG/Y53NeUvYhvWQ3ZVEoNSJlwPzbju?=
 =?windows-1250?Q?P7a2b2hHRvF3OmOiadmPw6I/QwYxzTXZqp40yVdQc/gusJ7/U4P7clWr?=
 =?windows-1250?Q?dNMpPKC1SvhZs3sTF9XdOsQW+8ZGICoYcHRXKlYZXyurDZbHv7ekg+Mr?=
 =?windows-1250?Q?9zc46m3Jt+/SE837aKx24aqEE61rDYiAJfQ+bAN9E25Y/dUNF+SQS4Tk?=
 =?windows-1250?Q?JwdSP+xvkOcomYpsceteL2voELf7eP1A4tIkfaRagGfff5nWJss7abOX?=
 =?windows-1250?Q?UFucbFerqIsQt7ECqV0ZMs/pBHon7rasTPVFr5SIhhkLjiT6ZdPXrpPT?=
 =?windows-1250?Q?TKXA6CeDdrtVIM/LTZ72tkxlYYAiJkPWvOCYTosBNq8U+QtzfF6jbHq3?=
 =?windows-1250?Q?cGVC+cqY5kiiNvMGLQY4NF6uvO2MFp4YvOwGqow/zANxjJyZJtxj9c8X?=
 =?windows-1250?Q?wKVV60HMLrLnDge+DFh28lLs/C01/339R9UUyw0dMBRtcbdeFcIwsZwk?=
 =?windows-1250?Q?GH+9Pb2YS766uJnrrUUa4Bh2GsB+JEciFAerlyOH/zgp6mnPJXsgVQkF?=
 =?windows-1250?Q?1O5hMSNhc8RDi85luXftfAZt8K3ujY/jMDdqWfDuyalMw8c29l+vyj6X?=
 =?windows-1250?Q?5xmmX/Mp+r5RVaTBTtgy1BXQqiReEtljaaxSpHuAoL+D6Et5C8bYRg92?=
 =?windows-1250?Q?TGHYhyQqz7c8Gxi5V+MPT/qnnDsb3VplVuZ6Bdoh1U89A7irIR3/vn6i?=
 =?windows-1250?Q?5MDCdOZfXQQum1X804DGSMBJHXL9WUgIBQS5I6s4gYk53iuSFHOt95AV?=
 =?windows-1250?Q?OPfTlRkP7ykk+WHylSgMKcQtCFM2PLq+O/35/k3w9EeiVPA++ECpKElG?=
 =?windows-1250?Q?0TdX/OUqoOTmAj2RAHjjrJohDROxUvGNueBzrkBZB8hJLWCPTXDSg8nF?=
 =?windows-1250?Q?olKtJTK6PtsjnLNvlhcgomnoaceSmAW4zSenaX1dLs/GqtXkhA2lUzNF?=
 =?windows-1250?Q?WwpPuynfsg0Y/wx05BkoZFqBBo8nspBms8le1xDSQxwbwnGGn/BIulrK?=
 =?windows-1250?Q?5ymWA+0J5k4i3Pgn6cy4TBBy5VIa3NTVMLcPUaEy9gm8OTqM8B+s1Uv2?=
 =?windows-1250?Q?QZgvSpOcF0+c9+f1OZ+JI4rkNb+0eSTeoPVtc1yn75pULvlsphE9uz0m?=
 =?windows-1250?Q?JUm28jKi0sECR1CRr5erd1aRa7njHlQgud94Pa3yR8NvczLOslPH8GnO?=
 =?windows-1250?Q?Q2FuH2Tn1e5F+MRhlf9Sw2L9gL9z0urlYMFqio5Y3o9JSIpZd35FHkP3?=
 =?windows-1250?Q?oEsRofNVkH3+pQ=3D=3D?=
Content-Type: text/plain; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aumovio.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b93d1ee-9406-47c4-1aec-08de8f20131c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 12:21:45.5161
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bd97919-57c3-48d3-9e9a-8e4c01614a8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5jCYa+wIZlgPHnie2mf9jmYuK+W5UFrqC3RhbRP09RKhuVZR6HN7Ow54MsKyMyxFwmBplikm7g6DMs6ncM++m5eMk0BVKViQVMUyRVysRM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB2860
X-Spamd-Result: default: False [0.84 / 15.00];
	FROM_DN_EQ_ADDR(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[aumovio.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[aumovio.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[Andreea.Popescu@aumovio.com,linux-usb@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35728-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[aumovio.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,aumovio.com:dkim]
X-Rspamd-Queue-Id: 76870369683
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When Linux runtime PM autosuspends a ChipIdea UDC that is still=0A=
enumerated by the host, the driver gates the PHY clocks and marks=0A=
the controller as suspended (ci->in_lpm =3D 1) but deliberately leaves=0A=
gadget.speed unchanged so upper-layer gadget drivers do not see a=0A=
spurious disconnect.=0A=
=0A=
The problem is that those same drivers may continue to call=0A=
usb_ep_queue() during the autosuspend window.  _hardware_enqueue()=0A=
silently adds the request to the endpoint queue and returns 0, but=0A=
hw_ep_prime() cannot succeed with gated clocks, so the completion=0A=
interrupt never fires.  The request =97 and its backing buffer =97 is=0A=
permanently lost.  The caller sees a successful return and never=0A=
frees the buffer.=0A=
=0A=
The attached patch fixes this by adding an early -ESHUTDOWN return=0A=
in _ep_queue() for any non-control endpoint when ci->in_lpm is set=0A=
or when gadget.speed =3D=3D USB_SPEED_UNKNOWN (cable gone / soft=0A=
disconnect).  It also corrects ep_queue(), the public usb_ep_ops=0A=
wrapper, which was returning 0 instead of -ESHUTDOWN for the=0A=
USB_SPEED_UNKNOWN case, masking the same class of bug.=0A=
=0A=
The guard follows the same pattern already used in ci_irq_handler(),=0A=
which exits early on ci->in_lpm, and has been verified against v6.19=0A=
ci.h (in_lpm field present) and core.c (ci_controller_suspend() sets=0A=
in_lpm without touching gadget.speed).=0A=
=0A=
Please consider routing to stable; the bug has been present since=0A=
runtime PM autosuspend was introduced to this driver.=0A=
=0A=
Thanks,=0A=
Andreea Popescu=0A=
=0A=
---=0A=
=0A=
diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c=0A=
index 64a421ae0f05..09bdd78826b6 100644=0A=
--- a/drivers/usb/chipidea/udc.c=0A=
+++ b/drivers/usb/chipidea/udc.c=0A=
@@ -1100,6 +1100,27 @@ static int _ep_queue(struct usb_ep *ep, struct usb_r=
equest *req,=0A=
 	if (ep =3D=3D NULL || req =3D=3D NULL || hwep->ep.desc =3D=3D NULL)=0A=
 		return -EINVAL;=0A=
 =0A=
+	/*=0A=
+	 * Reject non-control submissions when the controller is suspended=0A=
+	 * (ci->in_lpm set by ci_runtime_suspend) or the gadget is not yet=0A=
+	 * enumerated (gadget.speed =3D=3D USB_SPEED_UNKNOWN).=0A=
+	 *=0A=
+	 * ci_runtime_suspend gates the PHY clocks but intentionally leaves=0A=
+	 * gadget.speed at its current value so that upper-layer drivers do=0A=
+	 * not see a spurious disconnect.  As a side-effect, callers have no=0A=
+	 * way to distinguish an active gadget from a clock-gated one.=0A=
+	 * _hardware_enqueue() adds the request to hwep->qh.queue and returns=0A=
+	 * 0, but hw_ep_prime() is a no-op with gated clocks so the transfer=0A=
+	 * completion interrupt never fires and the buffer is permanently lost.=
=0A=
+	 *=0A=
+	 * Return -ESHUTDOWN so callers can free the buffer immediately,=0A=
+	 * matching the behaviour of a real hardware error completion.=0A=
+	 */=0A=
+	if (hwep->type !=3D USB_ENDPOINT_XFER_CONTROL &&=0A=
+		(ci->in_lpm || ci->gadget.speed =3D=3D USB_SPEED_UNKNOWN))=0A=
+		return -ESHUTDOWN;=0A=
+=0A=
+=0A=
 	if (hwep->type =3D=3D USB_ENDPOINT_XFER_CONTROL) {=0A=
 		if (req->length)=0A=
 			hwep =3D (ci->ep0_dir =3D=3D RX) ?=0A=
@@ -1698,7 +1719,7 @@ static int ep_queue(struct usb_ep *ep, struct usb_req=
uest *req,=0A=
 	spin_lock_irqsave(hwep->lock, flags);=0A=
 	if (hwep->ci->gadget.speed =3D=3D USB_SPEED_UNKNOWN) {=0A=
 		spin_unlock_irqrestore(hwep->lock, flags);=0A=
-		return 0;=0A=
+		return -ESHUTDOWN;=0A=
 	}=0A=
 	retval =3D _ep_queue(ep, req, gfp_flags);=0A=
 	spin_unlock_irqrestore(hwep->lock, flags);=0A=
=0A=

