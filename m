Return-Path: <linux-usb+bounces-37549-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJwCCdbKCWropQQAu9opvQ
	(envelope-from <linux-usb+bounces-37549-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 16:04:06 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E1356178A
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 16:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3942B3001446
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 14:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7113F280A56;
	Sun, 17 May 2026 14:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ntu.edu.sg header.i=@ntu.edu.sg header.b="CyavmQ3C"
X-Original-To: linux-usb@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013010.outbound.protection.outlook.com [40.107.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969A024293C;
	Sun, 17 May 2026 14:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779026638; cv=fail; b=Y8vVzDmrMBmTWFd9/HtdkhFdn6gpOX0BU09nLQHS+XTE9u5FMD0ksbq1xEh9lCNXEYFeSY2KbSBoKbW+ksm7FX7zxwEHUOPqnev0oVD/faZuukYDf+4ZR+G3lbfeQfh+B7mvCgNrm78eV29G/F9MsKhq7BtzzpVh6XyU7NxUeaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779026638; c=relaxed/simple;
	bh=xXF8eS5ehzWJ0NCDeCyExYTdIumDQh1OMQ+Olm2gxDI=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Zr8+p+m+u/ewBDMIacFKurW8VBb+h0KNIafm2rSmE0u5Ic14H/QjodldY0DmZULIn5m1FfqzXVZYCcc+R646T/6AAQPVIJ42HXqWWyZZcYra8nO1HWdKcI0b5m4218whuy2e8nTjswLN8rtXXgbLDVUnPXpcKeW5ES6gmc8yiV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ntu.edu.sg; spf=pass smtp.mailfrom=ntu.edu.sg; dkim=pass (2048-bit key) header.d=ntu.edu.sg header.i=@ntu.edu.sg header.b=CyavmQ3C; arc=fail smtp.client-ip=40.107.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ntu.edu.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ntu.edu.sg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ok2Qv9y1k8Yx9eXjoAaUTudue03kAuVgi7nuqJ5aYEju3dvgk28YWMGRJfDVrsmYpfWW16Gkcgk9rVUaVirz+XfvKMNVu6oKwy2SYuM8Q27uS0gjSd6+X47j29IKFZKHMx1+6HCiasa5IOlmAMKDAdRPc9RJOB0l8oddKbKvLhP0XK8F8/gdvvqNMPEjilXLyXYs4nQ2fe5clH9qYNq+3aqgxieOG0Tst3kbBMqEeiRGCWKOPQ3g81h4XVYoHgIWYZQVzI82MqdeR+nZwtowtKHfcDOj89s3e6ECERBkP4aVi3EFHdRRqowDiSgccgfeanTiFyuvvKSWYkx6Q5JC6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pgf3e+FP6bkRbDud6/FMM31xR5cyi99z6CqUYwichx0=;
 b=L2Jr2zcyGmE1x6RB0olZ5Ti1AvLyDWKM6hiMyqt71WRu12dMSwzpptDMyxRSpM5i56FrLpAIzH+1fRZE6k9z4OMDfpjNtbgeYZS89TE3HQ7zB8B/rwzxE/Fh5OzJtXhD3ipvLrhpkuvOuacD+kvpAsUaDwU8T6qcw1cqn6A0A+utyHZao6o6QUx4C4svnqGuh5vEfRPETYnKTWFucN6Hi7HPFidQyvake+zsfLwm+ruKHABB4jPtBvOMod8gqReGEjDF+f7pp19bb7f0ZNiZmErv+3fKGUJ5MFKDQwjQ9gFzfBG8dV8ufz7HhC2uwDtnkX8czkuW/S1nvzpjxig/KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ntu.edu.sg; dmarc=pass action=none header.from=ntu.edu.sg;
 dkim=pass header.d=ntu.edu.sg; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ntu.edu.sg;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pgf3e+FP6bkRbDud6/FMM31xR5cyi99z6CqUYwichx0=;
 b=CyavmQ3Chr64yJ1EjFkiaNO5QWM5TiT94xoB6j2CqMWLxrOFke5vm/5I3PdG9bXjT6gKUBLpX/JH2yPNv4nuT6f/fTqVP7fWapNOybMjtmphy8Kr8iJY9AMC0aT011ugm3vG2BDTIVI6+C0h2VrTVkT2ejQXZ/JAde704xhB0szcvdIJyIky2JUuHPfo36iONR7nkDmZEOfTomVcf8imKydcljfR+TpOfxLp7+xhRy2RycjuiD7ddPDkdGsQAgrTlMnH3vx7XHzIUbcHgCixaYdphZ40h12q6dewV3jrp7HwugpWGxkIIXbLCv21c36CJ1qAVQ8WnKnHhjDdy8HU/w==
Received: from TYZPR01MB6758.apcprd01.prod.exchangelabs.com
 (2603:1096:405:a2::6) by SEYPR01MB7778.apcprd01.prod.exchangelabs.com
 (2603:1096:101:2cf::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Sun, 17 May
 2026 14:03:47 +0000
Received: from TYZPR01MB6758.apcprd01.prod.exchangelabs.com
 ([fe80::bbb1:1ecd:fe69:9743]) by TYZPR01MB6758.apcprd01.prod.exchangelabs.com
 ([fe80::bbb1:1ecd:fe69:9743%4]) with mapi id 15.21.0025.020; Sun, 17 May 2026
 14:03:47 +0000
From: Xie Maoyi <maoyi.xie@ntu.edu.sg>
To: "neal_liu@aspeedtech.com" <neal_liu@aspeedtech.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "joel@jms.id.au" <joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: usb: gadget: aspeed_udc: list iterator used after loop in
 ast_udc_ep_dequeue
Thread-Topic: usb: gadget: aspeed_udc: list iterator used after loop in
 ast_udc_ep_dequeue
Thread-Index: AQHc5foDLIAqWYseRUOocwkj85COaA==
Date: Sun, 17 May 2026 14:03:47 +0000
Message-ID:
 <TYZPR01MB67588F1EEB07DBEB681AEE1ADC022@TYZPR01MB6758.apcprd01.prod.exchangelabs.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ntu.edu.sg;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR01MB6758:EE_|SEYPR01MB7778:EE_
x-ms-office365-filtering-correlation-id: d36310f2-7046-4406-4947-08deb41d1d4a
x-o365: NTU-OFF365
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|6049299003|376014|786006|1800799024|366016|38070700021|3023799003|11063799003|18002099003|56012099003|4053099003;
x-microsoft-antispam-message-info:
 fKa5sqr7kHY3uo44K9k4lnPzXXQ7xCVkNUA2cH2tLJ/jCFBweg79cgsy6TCufovoQBd68uDbXCGGdiutVgW19g2P9BZ0rxz7LEfq6jVQqvm8m0EE6PLAla90A6DbCrB1w5wTGfhMNO3XtmoJzuU4G8t5b0WNnO+9OYiOACbTE7eQkaczLFdr/e1yDlF+fPCAC49C3ov3p/Zr9uuPHkHPCFXQMCBASlZT+BrugD8IfNhgL0G7ejzkv7d2nAdlZ5xdMXKmS1KGMok2+ca6JB7QwdfM5DdWuC7OA9g4aYdzJ5PCewrkU2MlYOK1EhIbkRfycsZVdgmiRrVauHY3HuvesKPYyOH+Qd7P1E15liUv5sL7+bECLcqiKZs7fhGukdk3RtV2ISgv48ZQW7ViOztPLkkgNcRNFmxhQsAqdoXS18Os/r2Iqi/chiu3JnNjSftm4CTgJxynJTInACH3Ik+YxINTZiKFM57dvtbLFGQQaPLU0mmF5wnGaF4IqHQNPZQJ1bbIuPcSZfrgdxsHwbU20+ZMVk6ScKq/hqoUund+YftfgfHH3ZpSLh+sYvT6frQA5A9y+UuwBo3aR2uV8LGfGr5UB26PaAx5kpdDf1RqieoMdsH+2gKHxHxj8C9VmjM1NbLLzJOOCsH1Xn0z6J7KosUmKxRSYbZOrlSKK3F0ZTvOZHJybtfCDACj74Cnfii+69I1EL60rYlsnhu4HCPEjA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR01MB6758.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(6049299003)(376014)(786006)(1800799024)(366016)(38070700021)(3023799003)(11063799003)(18002099003)(56012099003)(4053099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?m2680FgxdEWgsFkw9xoU5Uw44VKSh9Snz/JdhR9PDzOu0PcujfNwqMXMkB?=
 =?iso-8859-1?Q?GN8FJan6/NgVPjtKu4MYIBui0QEZIdWZcxVtFv5LgW3CDS2ImSFJqaEkhL?=
 =?iso-8859-1?Q?QQSm948C9tmC/9aX1cmK1IV+ZFdW/Zu7cLzHtvvN0V9hruS4uH9BcdPXdb?=
 =?iso-8859-1?Q?AGacdEbKK7kGOY+TUUxKDaqDOeYd3J7haEU35EXPWcSXKcwOOw1Fsunn27?=
 =?iso-8859-1?Q?315Inc9MjAr6Iz555/ScClEhSCGlu6nbVWl8TdkxglPdnAohR2xWdb6+OQ?=
 =?iso-8859-1?Q?FfZu3lUFoTt4lkvrA0PIPT+FYgYI9TB9qSJNrCL2pMx/MPu+KBFqNtQPl3?=
 =?iso-8859-1?Q?tIsmPjNpwGZoxTzBS07EyKUH0o+KmTibxfcNh2N4/k7B7JVzDkFxYb2m/f?=
 =?iso-8859-1?Q?8j+0V2UVZMtynUmKISdE4Zxmh5pf9gAl4DIp/JLycVgTG9H4ZHYgcsvhX7?=
 =?iso-8859-1?Q?WZ8uO0XsYOcyFZxkSDdAAg5/vh0UMld1C55i88797eWWTaIGMgYwj+dgCM?=
 =?iso-8859-1?Q?1xnOobGDuIP9WqYL2fjfGMQgo7+iOw2BPtmQmeSWeFC07/cGPgNNijtPDv?=
 =?iso-8859-1?Q?Es3eysai6tiOpcAJVqb5mmFbsV5C1o1TN1Yc3yagUB/z1RuI+waDGzHBwg?=
 =?iso-8859-1?Q?AJxMYP05QMCDcw0EvE/JBKO4A35PFGkDqMe+P7tQwn/2dMVLalvEkFjBnL?=
 =?iso-8859-1?Q?yY09aed7j6xi2fkbu9kx3wFYdKCEW3OdufyKKMK01zeW2NS9KJYWR7cTY9?=
 =?iso-8859-1?Q?cBjJUioFoJMWnptfJC9kizQY10Q9Feaj6jC7lJX7Uput3rRZLnrRBVtcli?=
 =?iso-8859-1?Q?TM04DEcU1tknogCUdFIVJ0Oa49SNk65hrWfJsG6q8JAcQtMp3aWqJgT/JL?=
 =?iso-8859-1?Q?lv7thNH8CDxWlNE6vOyDx13LjwW0ROxIUqiH3r+xLlg41sjQo1Jmk1lHxi?=
 =?iso-8859-1?Q?Hm1Ch7bDq742Rb5UfjLtvmMPPRqgOiETCNUSHwV8XjyStJYSQS7gHYE7Zt?=
 =?iso-8859-1?Q?RuHUhyr8r9M7mdx1LCeXmI1/p7lpWvV3vRStq9D5EZI6uRW/pdEjQOsJXm?=
 =?iso-8859-1?Q?nWiFBpmxciaAFlTcxbajklXlRs9aA4pPtr6O9xU+w3GaRg8Hw1CMfSBeTG?=
 =?iso-8859-1?Q?wyOqkXrdnPwje0LSLERaIcrm/I2pN5knB0WPCiHoTdUiL2WZROg0dyPuUG?=
 =?iso-8859-1?Q?rXXsYxX7Z3v5a7QVqlMbxABPV6whHa5/is2SCtzMuCzun/a3ORKoPFuLBc?=
 =?iso-8859-1?Q?OTAP4aLLCADVwSLuWhzALX26odCmtCHyeb8fEIHscKxldmHaqkkqs4jlJl?=
 =?iso-8859-1?Q?mp1l47BGMkqp3cck5bI+8ng85beVMYnDQnfPueV4cfG1aZO7dSl2/erddV?=
 =?iso-8859-1?Q?n4G9tEKYfdRvixKpKmTQHx+wjYRpSsRr/qz5X5DHjKWTQ8dg3E+TWvbd08?=
 =?iso-8859-1?Q?Wizu56XWQ5JpoArIJhvtX5IaKuaWDogYIEZNLhnQRZ3npzbvFSmwXfXjzd?=
 =?iso-8859-1?Q?9NAKX2aJsgACOQbPTMi7SPSE6gD51apiwZgksWaVHWqzLhpgTPlovJXumt?=
 =?iso-8859-1?Q?BUuENTCfmhPXWnktXxN/IPMPb5DGONib56CaY8rm1J6NJZgvAG18vcujqA?=
 =?iso-8859-1?Q?XhmiK9R8bP5U9VCPr5hQywzLpxyPjioPRhM+esoP9TuCb+CCFnoCcDpeVz?=
 =?iso-8859-1?Q?HL6GJX9zBe6NwCRq4ZN/UiUwOvqCeYnO0+jcpWlTEkY0WVp/8sd30eHMfb?=
 =?iso-8859-1?Q?bacsAQ3PcqFHwLnjZnc+SKyTpqCWTh8JeZGQWnN1nFL0X8fabjVdIR8lUR?=
 =?iso-8859-1?Q?aAa5jqHlAJA78gmQ0p4r/nfSiLdzXW8=3D?=
Content-Type: multipart/mixed;
	boundary="_003_TYZPR01MB67588F1EEB07DBEB681AEE1ADC022TYZPR01MB6758apcp_"
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: ntu.edu.sg
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR01MB6758.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d36310f2-7046-4406-4947-08deb41d1d4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2026 14:03:47.1502
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 15ce9348-be2a-462b-8fc0-e1765a9b204a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SNgcKCy/sb80WCOYHgTQtXL7973Ipc6qfO9av+Y5sYT7vjogQGFiWUetwBlaM/dH9Ux9iC+Jn+PntHmKE+82DmmEZgozPDTr/uvALtrK5KA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR01MB7778
X-Rspamd-Queue-Id: 55E1356178A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ntu.edu.sg,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ntu.edu.sg:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37549-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~,3:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maoyi.xie@ntu.edu.sg,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[ntu.edu.sg:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,maoyixie.com:url]
X-Rspamd-Action: no action

--_003_TYZPR01MB67588F1EEB07DBEB681AEE1ADC022TYZPR01MB6758apcp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

I have been running a small static check for list_for_each_entry
past-the-end patterns, similar to Jakob Koschel's 2022 cleanup
(commit 2966a9918df and related). The check flagged
ast_udc_ep_dequeue() in drivers/usb/gadget/udc/aspeed_udc.c, and I
would like to ask whether you consider this a real defect before I
send anything formal. The same code is present in v7.0 and in
v7.1-rc1 (the two files are byte-identical).

The code in question is around line 691:

    struct ast_udc_request *req;
    ...
    list_for_each_entry(req, &ep->queue, queue) {
        if (&req->req =3D=3D _req) {
            list_del_init(&req->queue);
            ast_udc_done(ep, req, -ESHUTDOWN);
            _req->status =3D -ECONNRESET;
            break;
        }
    }
    if (&req->req !=3D _req)
        rc =3D -EINVAL;

If nothing matches, the loop exits past-the-end and req becomes the
synthetic container_of(&ep->queue, struct ast_udc_request, queue).
Reading &req->req after the loop is undefined per C11. The post-loop
check works in practice only because real _req values do not collide
with that synthetic address.

What made me suspect this was not intentional is that 14 other UDC
drivers in the same directory (at91_udc, atmel_usba_udc, dummy_hcd,
fsl_qe_udc, fsl_udc_core, goku_udc, gr_udc, lpc32xx_udc, max3420_udc,
net2280, omap_udc, pxa25x_udc, pxa27x_udc, udc-xilinx) use a
different pattern, with a separate iter cursor and a result variable.
For example dummy_hcd.c:

    struct dummy_request *req =3D NULL, *iter;
    list_for_each_entry(iter, &ep->queue, queue) {
        if (&iter->req !=3D _req) continue;
        ...
        req =3D iter;
        retval =3D 0;
        break;
    }
    if (retval =3D=3D 0) { ... }

aspeed_udc seems to be the only outlier in drivers/usb/gadget/udc/,
which is what made me think this was probably an oversight rather
than a deliberate idiom.

I also tried to confirm whether it observably misbehaves. If _req
happens to coincide with the synthetic past-the-end address, the
function returns 0 (success) on an empty queue without removing
anything. I attached a small userspace reproducer (poc_aspeed_udc.c
and its output log) that arranges this collision. In normal use _req
comes from the kernel slab and the collision is unlikely to happen
naturally, so I am not sure whether this rises to the level of a
real bug or just a code-quality issue.

Two questions:

  1. Do you consider the past-the-end use here a defect worth fixing,
     or is it an accepted idiom in this driver that I am misreading?

  2. If it is worth fixing, I already have a small patch that brings
     the function in line with the 14 sibling drivers. Would you like
     me to send it, or would you rather address it locally?

Thanks for taking a look, and apologies if I am off base on any of
this.

Best,
Maoyi Xie
--
Nanyang Technological University
https://maoyixie.com/
________________________________

CONFIDENTIALITY: This email is intended solely for the person(s) named and =
may be confidential and/or privileged. If you are not the intended recipien=
t, please delete it, notify us and do not copy, use, or disclose its conten=
ts.
Towards a sustainable earth: Print only when necessary. Thank you.

--_003_TYZPR01MB67588F1EEB07DBEB681AEE1ADC022TYZPR01MB6758apcp_
Content-Type: application/octet-stream; name="poc_aspeed_udc.log"
Content-Description: poc_aspeed_udc.log
Content-Disposition: attachment; filename="poc_aspeed_udc.log"; size=402;
	creation-date="Sun, 17 May 2026 13:35:21 GMT";
	modification-date="Sun, 17 May 2026 13:35:21 GMT"
Content-Transfer-Encoding: base64

JCAuL3BvY19hc3BlZWRfdWRjCltzZXR1cF0gZXAucXVldWU9MHg3ZmZlZmUwYjFjZDAgKGhlYWQp
CltzZXR1cF0gcGFzdF9lbmQ9MHg3ZmZlZmUwYjFjYzAKW3NldHVwXSBmYWtlX3JlcT0weDdmZmVm
ZTBiMWNjMApbcHJvYmVdIGV4aXN0aW5nIHJjPTAKW3Jlc3VsdF0gcmV0dXJuZWQgMCAoc3VjY2Vz
cykgb24gZW1wdHkgcXVldWUgd2l0aG91dCByZW1vdmluZyBhbnl0aGluZwoKJCAuL3BvY19hc3Bl
ZWRfdWRjIHBhdGNoZWQKW3NldHVwXSBlcC5xdWV1ZT0weDdmZmVlNjQ4ZWVlMCAoaGVhZCkKW3Nl
dHVwXSBwYXN0X2VuZD0weDdmZmVlNjQ4ZWVkMApbc2V0dXBdIGZha2VfcmVxPTB4N2ZmZWU2NDhl
ZWQwCltwcm9iZV0gcGF0Y2hlZCByYz0tMjIKW3Jlc3VsdF0gcmV0dXJuZWQgLTIyIChyZWplY3Rl
ZCkK

--_003_TYZPR01MB67588F1EEB07DBEB681AEE1ADC022TYZPR01MB6758apcp_
Content-Type: text/plain; name="poc_aspeed_udc.c"
Content-Description: poc_aspeed_udc.c
Content-Disposition: attachment; filename="poc_aspeed_udc.c"; size=4521;
	creation-date="Sun, 17 May 2026 13:35:21 GMT";
	modification-date="Sun, 17 May 2026 13:35:21 GMT"
Content-Transfer-Encoding: base64

LyoKICogVXNlcnNwYWNlIHJlcHJvZHVjZXIgZm9yIHRoZSBwYXN0LXRoZS1lbmQgaXRlcmF0b3Ig
YmVoYXZpb3IgaW4KICogYXN0X3VkY19lcF9kZXF1ZXVlKCkgKGRyaXZlcnMvdXNiL2dhZGdldC91
ZGMvYXNwZWVkX3VkYy5jKS4KICoKICogQXNwZWVkIFVEQyBpcyBCTUMvQVJNIGhhcmR3YXJlLiBS
YXRoZXIgdGhhbiBicmluZ2luZyB1cCBhIGZ1bGwgU29DCiAqIGVtdWxhdGlvbiwgdGhpcyBwcm9n
cmFtIGV4dHJhY3RzIHRoZSBkZXF1ZXVlIGZ1bmN0aW9uJ3MgbG9naWMgaW50bwogKiB1c2Vyc3Bh
Y2UgdXNpbmcgbW9jayBzdHJ1Y3RzIHdob3NlIGxheW91dCAocmVxIGF0IG9mZnNldCAwLCBxdWV1
ZQogKiBpbW1lZGlhdGVseSBhZnRlcikgbWF0Y2hlcyB0aGUga2VybmVsIGRlZmluaXRpb24uIEl0
IHRoZW4gcnVucyBib3RoCiAqIHRoZSBleGlzdGluZyBjb2RlIHBhdGggYW5kIHRoZSBwcm9wb3Nl
ZCBmaXggb24gdGhlIHNhbWUgY3JhZnRlZCBpbnB1dC4KICoKICogQnVpbGQ6IGNjIC1PMCAtZyBw
b2NfYXNwZWVkX3VkYy5jIC1vIHBvY19hc3BlZWRfdWRjCiAqIFJ1bjogICAuL3BvY19hc3BlZWRf
dWRjICAgICAgICAgICAoZXhpc3RpbmcgY29kZSwgcmV0dXJucyA0MikKICogICAgICAgIC4vcG9j
X2FzcGVlZF91ZGMgcGF0Y2hlZCAgIChwcm9wb3NlZCBmaXgsIHJldHVybnMgMCkKICovCiNkZWZp
bmUgX0dOVV9TT1VSQ0UKI2luY2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxzdGRsaWIuaD4KI2lu
Y2x1ZGUgPHN0cmluZy5oPgojaW5jbHVkZSA8c3RkZGVmLmg+CgovKiBNaW5pbWFsIG1vY2sgb2Yg
dGhlIGtlcm5lbCBsaXN0X2hlYWQgYW5kIGNvbnRhaW5lcl9vZi4gKi8Kc3RydWN0IGxpc3RfaGVh
ZCB7IHN0cnVjdCBsaXN0X2hlYWQgKm5leHQsICpwcmV2OyB9OwoKI2RlZmluZSBjb250YWluZXJf
b2YocHRyLCB0eXBlLCBtZW1iZXIpIFwKICAgICgodHlwZSAqKSgoY2hhciAqKShwdHIpIC0gb2Zm
c2V0b2YodHlwZSwgbWVtYmVyKSkpCgojZGVmaW5lIGxpc3RfZmlyc3RfZW50cnkocHRyLCB0eXBl
LCBtZW1iZXIpIFwKICAgIGNvbnRhaW5lcl9vZigocHRyKS0+bmV4dCwgdHlwZSwgbWVtYmVyKQoj
ZGVmaW5lIGxpc3RfbmV4dF9lbnRyeShwb3MsIG1lbWJlcikgXAogICAgY29udGFpbmVyX29mKChw
b3MpLT5tZW1iZXIubmV4dCwgdHlwZW9mKCoocG9zKSksIG1lbWJlcikKI2RlZmluZSBsaXN0X2Vu
dHJ5X2lzX2hlYWQocG9zLCBoZWFkLCBtZW1iZXIpIFwKICAgICgmKHBvcyktPm1lbWJlciA9PSAo
aGVhZCkpCgojZGVmaW5lIGxpc3RfZm9yX2VhY2hfZW50cnkocG9zLCBoZWFkLCBtZW1iZXIpICAg
ICAgICAgICAgICAgXAogICAgZm9yIChwb3MgPSBsaXN0X2ZpcnN0X2VudHJ5KGhlYWQsIHR5cGVv
ZigqcG9zKSwgbWVtYmVyKTsgXAogICAgICAgICAhbGlzdF9lbnRyeV9pc19oZWFkKHBvcywgaGVh
ZCwgbWVtYmVyKTsgICAgICAgICAgICAgXAogICAgICAgICBwb3MgPSBsaXN0X25leHRfZW50cnko
cG9zLCBtZW1iZXIpKQoKc3RhdGljIHZvaWQgbGlzdF9pbml0KHN0cnVjdCBsaXN0X2hlYWQgKmgp
IHsgaC0+bmV4dCA9IGgtPnByZXYgPSBoOyB9CgovKiBNb2NrIHN0cnVjdHMuIE9ubHkgZmllbGQg
b3JkZXIgbWF0dGVyczogcmVxIGF0IG9mZnNldCAwLCBxdWV1ZQogKiBpbW1lZGlhdGVseSBhZnRl
ci4gKi8Kc3RydWN0IHVzYl9yZXF1ZXN0IHsKICAgIHZvaWQgKmJ1ZjsKICAgIHVuc2lnbmVkIGxl
bmd0aDsKICAgIGludCBzdGF0dXM7Cn07CgpzdHJ1Y3QgYXN0X3VkY19yZXF1ZXN0IHsKICAgIHN0
cnVjdCB1c2JfcmVxdWVzdCByZXE7CiAgICBzdHJ1Y3QgbGlzdF9oZWFkIHF1ZXVlOwogICAgaW50
IHBhZDsKfTsKCnN0cnVjdCBhc3RfdWRjX2VwIHsKICAgIHN0cnVjdCBsaXN0X2hlYWQgcXVldWU7
Cn07CgovKiBFeGlzdGluZyBjb2RlIHBhdGggZnJvbSBhc3BlZWRfdWRjLmMgYXJvdW5kIGxpbmUg
NjkxLiBMb2NrcyBhbmQKICogdGhlIGFzdF91ZGNfZG9uZSgpIGNhbGxiYWNrIGFyZSBlbGlkZWQg
c2luY2UgdGhlIHBhc3QtdGhlLWVuZAogKiBiZWhhdmlvciBpcyBpbmRlcGVuZGVudCBvZiB0aGVt
LiAqLwpzdGF0aWMgaW50IGFzdF91ZGNfZXBfZGVxdWV1ZV9leGlzdGluZyhzdHJ1Y3QgYXN0X3Vk
Y19lcCAqZXAsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
dXNiX3JlcXVlc3QgKl9yZXEpCnsKICAgIHN0cnVjdCBhc3RfdWRjX3JlcXVlc3QgKnJlcTsKICAg
IGludCByYyA9IDA7CgogICAgbGlzdF9mb3JfZWFjaF9lbnRyeShyZXEsICZlcC0+cXVldWUsIHF1
ZXVlKSB7CiAgICAgICAgaWYgKCZyZXEtPnJlcSA9PSBfcmVxKSB7CiAgICAgICAgICAgIC8qIGxp
c3RfZGVsX2luaXQgKyBhc3RfdWRjX2RvbmUgKyBzZXQgc3RhdHVzIGhlcmUgKi8KICAgICAgICAg
ICAgYnJlYWs7CiAgICAgICAgfQogICAgfQoKICAgIC8qIFdoZW4gdGhlIGxvb3AgZmluZHMgbm8g
bWF0Y2gsIHJlcSBpcyBwYXN0LXRoZS1lbmQuIFJlYWRpbmcKICAgICAqICZyZXEtPnJlcSBpcyB1
bmRlZmluZWQgcGVyIEMxMTsgdGhlIHJlc3VsdGluZyBjaGVjayBpcyBhCiAgICAgKiBwcm9wZXJ0
eSBvZiBoZWFwIGxheW91dCByYXRoZXIgdGhhbiB0aGUgcXVldWUgY29udGVudHMuICovCiAgICBp
ZiAoJnJlcS0+cmVxICE9IF9yZXEpCiAgICAgICAgcmMgPSAtMjI7ICAgICAvKiAtRUlOVkFMICov
CgogICAgcmV0dXJuIHJjOwp9CgovKiBQcm9wb3NlZCBmaXggdXNpbmcgdGhlIHNlcGFyYXRlIGl0
ZXIgY3Vyc29yIHBhdHRlcm4gc2hhcmVkIGJ5IHRoZQogKiBvdGhlciBVREMgZHJpdmVycyBpbiB0
aGUgc2FtZSBkaXJlY3RvcnkgKGUuZy4gZHVtbXlfaGNkLmMpLiAqLwpzdGF0aWMgaW50IGFzdF91
ZGNfZXBfZGVxdWV1ZV9wYXRjaGVkKHN0cnVjdCBhc3RfdWRjX2VwICplcCwKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHVzYl9yZXF1ZXN0ICpfcmVxKQp7CiAg
ICBzdHJ1Y3QgYXN0X3VkY19yZXF1ZXN0ICpyZXEgPSBOVUxMLCAqaXRlcjsKCiAgICBsaXN0X2Zv
cl9lYWNoX2VudHJ5KGl0ZXIsICZlcC0+cXVldWUsIHF1ZXVlKSB7CiAgICAgICAgaWYgKCZpdGVy
LT5yZXEgIT0gX3JlcSkKICAgICAgICAgICAgY29udGludWU7CiAgICAgICAgcmVxID0gaXRlcjsK
ICAgICAgICBicmVhazsKICAgIH0KCiAgICBpZiAoIXJlcSkKICAgICAgICByZXR1cm4gLTIyOyAg
ICAgLyogLUVJTlZBTCAqLwoKICAgIC8qIGxpc3RfZGVsX2luaXQgKyBhc3RfdWRjX2RvbmUgKyBz
ZXQgc3RhdHVzIGhlcmUgKi8KICAgIHJldHVybiAwOwp9CgppbnQgbWFpbihpbnQgYXJnYywgY2hh
ciAqKmFyZ3YpCnsKICAgIGludCB1c2VfcGF0Y2hlZCA9IChhcmdjID4gMSAmJiAhc3RyY21wKGFy
Z3ZbMV0sICJwYXRjaGVkIikpOwoKICAgIHN0cnVjdCBhc3RfdWRjX2VwIGVwOwogICAgbGlzdF9p
bml0KCZlcC5xdWV1ZSk7CgogICAgLyogQW4gZW1wdHkgcXVldWUgZm9yY2VzIHRoZSBleGlzdGlu
ZyBjb2RlJ3MgaXRlcmF0b3IgcGFzdCB0aGUgZW5kLgogICAgICogcGFzdF9lbmQgaXMgdGhlIHN5
bnRoZXRpYyBhc3RfdWRjX3JlcXVlc3QgcG9pbnRlciB0aGUgbG9vcCB3aWxsCiAgICAgKiBsZWF2
ZSBiZWhpbmQuIEJlY2F1c2UgcmVxIGlzIHRoZSBmaXJzdCBtZW1iZXIsICZwYXN0X2VuZC0+cmVx
CiAgICAgKiBoYXMgdGhlIHNhbWUgbnVtZXJpYyB2YWx1ZSBhcyBwYXN0X2VuZCBpdHNlbGYuICov
CiAgICBzdHJ1Y3QgYXN0X3VkY19yZXF1ZXN0ICpwYXN0X2VuZCA9CiAgICAgICAgY29udGFpbmVy
X29mKCZlcC5xdWV1ZSwgc3RydWN0IGFzdF91ZGNfcmVxdWVzdCwgcXVldWUpOwogICAgc3RydWN0
IHVzYl9yZXF1ZXN0ICpmYWtlX3JlcSA9ICZwYXN0X2VuZC0+cmVxOwoKICAgIHByaW50ZigiW3Nl
dHVwXSBlcC5xdWV1ZT0lcCAoaGVhZClcbiIsICh2b2lkICopJmVwLnF1ZXVlKTsKICAgIHByaW50
ZigiW3NldHVwXSBwYXN0X2VuZD0lcFxuIiwgKHZvaWQgKilwYXN0X2VuZCk7CiAgICBwcmludGYo
IltzZXR1cF0gZmFrZV9yZXE9JXBcbiIsICh2b2lkICopZmFrZV9yZXEpOwoKICAgIGludCByYzsK
ICAgIGlmICh1c2VfcGF0Y2hlZCkgewogICAgICAgIHJjID0gYXN0X3VkY19lcF9kZXF1ZXVlX3Bh
dGNoZWQoJmVwLCBmYWtlX3JlcSk7CiAgICAgICAgcHJpbnRmKCJbcHJvYmVdIHBhdGNoZWQgcmM9
JWRcbiIsIHJjKTsKICAgIH0gZWxzZSB7CiAgICAgICAgcmMgPSBhc3RfdWRjX2VwX2RlcXVldWVf
ZXhpc3RpbmcoJmVwLCBmYWtlX3JlcSk7CiAgICAgICAgcHJpbnRmKCJbcHJvYmVdIGV4aXN0aW5n
IHJjPSVkXG4iLCByYyk7CiAgICB9CgogICAgaWYgKHJjID09IDApIHsKICAgICAgICBwcmludGYo
IltyZXN1bHRdIHJldHVybmVkIDAgKHN1Y2Nlc3MpIG9uIGVtcHR5IHF1ZXVlIHdpdGhvdXQgIgog
ICAgICAgICAgICAgICAicmVtb3ZpbmcgYW55dGhpbmdcbiIpOwogICAgICAgIHJldHVybiA0MjsK
ICAgIH0KICAgIHByaW50ZigiW3Jlc3VsdF0gcmV0dXJuZWQgJWQgKHJlamVjdGVkKVxuIiwgcmMp
OwogICAgcmV0dXJuIDA7Cn0K

--_003_TYZPR01MB67588F1EEB07DBEB681AEE1ADC022TYZPR01MB6758apcp_--

