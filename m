Return-Path: <linux-usb+bounces-32907-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kG2AIg0re2kyCAIAu9opvQ
	(envelope-from <linux-usb+bounces-32907-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 10:40:29 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9EDAE35F
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 10:40:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E099300A8E3
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 09:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F78B37F753;
	Thu, 29 Jan 2026 09:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="Kk2UNmya"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011019.outbound.protection.outlook.com [52.101.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65845374756
	for <linux-usb@vger.kernel.org>; Thu, 29 Jan 2026 09:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769679626; cv=fail; b=gzR1ixrncpscrICDmLwxn0aDb21aP2uhDfxJUV1cQ3xEeyreEPfR4pcllS9ev+DGDaExUU8IxFYhJapa9Kb7XjjguGB/uPFXwiUnCkQYfVnPaXHx5QfSn4R6DAbMuY/0Vm+ji0k3PVpjuVtMJcytU/kMjUp90tNYemQSO+kRUxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769679626; c=relaxed/simple;
	bh=an8onehKmBL/XSpC9JDdeXGXAhD+x1QxeNh8KsLPofo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EaFIMy65NHl3YSZlQt6+pIJybjQWdQWg3Tx609pTaf2437XEbMrRonH4bsZ0HjMa2SUc7Xn9F9pPjnM/Ef6sepT79W0qbyDRq5QhPZ74ahbRS/5xdLiZQQm3PNrydXL0PLrEMJkGSsMWkYxU5F9JRiY4h3bhjS3+NkGyJFalckg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=Kk2UNmya; arc=fail smtp.client-ip=52.101.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgiOfpTBI9Gej7Tl7zyJNRhwHBTg+r+Yz3LikLqyKGrEOItenM60shx5ARcNrXawkM6ke/YLWuAwPzC3tTNHyV1EAMOmp1d7I+O54HE7r7XS60jj7GTZ0i0zos1MmCMNKzcQyHHF203f97zUBHnlMt08XVXJ+ZXYV7nA/i96C8rujmxXdtEnXkLZ0YNqGX4sECGcqP7fU8o0VijY678ocIlwU6y9tABQ90jGQ5sdJbpFaHXfH1Nzo4lbvB2R+ccCQQLYSA8uqvIwfIGJL/2eu/91Ujh94E7TMh6zKe3tOCbkQ7iSPbezK/ezc/l6xOSgTT2WV5MHZBsmVntWbZ9YbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=an8onehKmBL/XSpC9JDdeXGXAhD+x1QxeNh8KsLPofo=;
 b=AI+CIJ50PDwc4KsOENlPZA4d/mMW4hwFVaVG/khZFsvMnGMcWpJeKEotWNv9Nqb+nnCFhW2I1unZ2sRZKS3SF8rjcLE2JHH5wkXEE76agy4lS00tIt+kHbdOe5reeN+Ztcwz+Squbgx1p9o23nPPmhABHLiUuGLaD7kAsOsyU5wo7YTrPX8LfjmmsQtNycYjI5gFgOOAbnRaVU8ptDYuErM6flAr1n7mIeWQH3LcukKInkeaY3lbFV3o+X1CCGeugQUzoIgAOL2trc6LTaFA2FcZLrqGf5zhdLPNbaaUhKd4WlbQWrjPqQo+W9Qcm+48t9VQ4/f2+Nr2z/uyBnIiJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=an8onehKmBL/XSpC9JDdeXGXAhD+x1QxeNh8KsLPofo=;
 b=Kk2UNmya4amkNhW1YVLwNhXihXIDvbcVU4jodQf41Bx5uDNgUq6y6s5pr6IZguEpZTCMTt8DbEmSDx9NCgkErg7+elx2Kz5QRidw2xhpgOSRmWwEs1iuNBpnHycfD8LvWjlUJoVAr55p08qxunSvgifMVq4U46YybzKPG3E2EkY=
Received: from GV4PR06MB10308.eurprd06.prod.outlook.com
 (2603:10a6:150:2dc::14) by AM8PR06MB6850.eurprd06.prod.outlook.com
 (2603:10a6:20b:1dd::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 09:40:20 +0000
Received: from GV4PR06MB10308.eurprd06.prod.outlook.com
 ([fe80::930b:b831:99ee:f1e]) by GV4PR06MB10308.eurprd06.prod.outlook.com
 ([fe80::930b:b831:99ee:f1e%6]) with mapi id 15.20.9542.009; Thu, 29 Jan 2026
 09:40:20 +0000
From: PETER Mario <mario.peter@leica-geosystems.com>
To: "Peter Chen (CIX)" <peter.chen@kernel.org>
CC: Alan Stern <stern@rowland.harvard.edu>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] usb: chipidea: otg: use autosuspend in ci_otg_work
Thread-Topic: [PATCH v2] usb: chipidea: otg: use autosuspend in ci_otg_work
Thread-Index: AQHcgLRaV9i/bFlrrE2rqWd5DVIPjbVIcdAAgAFK+4CABy2tgIAYGq6A
Date: Thu, 29 Jan 2026 09:40:20 +0000
Message-ID: <ba8bac85-c537-431f-a0ac-c4dec3463852@leica-geosystems.com>
References: <20260108153458.1707897-1-mario.peter@leica-geosystems.com>
 <bc08faa5-9089-44f6-8c7b-236a47aabb0f@rowland.harvard.edu>
 <28460ab0-02d9-4e19-940c-519c0e97440b@leica-geosystems.com>
 <20260114013435.GC2295746@nchen-desktop>
In-Reply-To: <20260114013435.GC2295746@nchen-desktop>
Accept-Language: en-AT, de-DE, en-US
Content-Language: aa
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV4PR06MB10308:EE_|AM8PR06MB6850:EE_
x-ms-office365-filtering-correlation-id: e30bba7f-7b77-4629-9eb5-08de5f1a6b0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZGNES0dVTmoxYmNIdmhhOVRidk5qanB1SlZQRmxzaW9VdEhRbVZWVTJxVXp0?=
 =?utf-8?B?eXFuRE0zVFlSZkJYUUJ4ZDFHVE9oZ2FFWGRUd1hoSGJWOEt0UGdzeDZvb1Rw?=
 =?utf-8?B?cE9PS2MrSk0zcWg5SE5SZXJ2bXVDVW1sdlQwRVU1SklFaW0rRXRSUy82V1dh?=
 =?utf-8?B?MDVha0hVQVFMVUJJek9qbzd0YzFrdFVMMmR6M3NDL1dxSGtrQWdrekxkVmVt?=
 =?utf-8?B?ZXUwbGxIaU1tVmZwZURQTStNOWMvSkt5NHlOSnFPNDY3V2xGdjVIU1pla0k5?=
 =?utf-8?B?dlZHaWFCZTczeGdtckxhazhkMm1rTE1MTzd4Sit0SGg0ZnRYcDNrbnBqbWdX?=
 =?utf-8?B?dXVVOG5ZWndMMHlKTnd3S0o0TllEWWxxSDlGWG0zRWtKdGdRUGxQMlZibUpO?=
 =?utf-8?B?ckIrVlQ1RkdJRnNIZWZyd3M1ODhKNHQvby9aZllMNXorc29VS3hlT2lRUFor?=
 =?utf-8?B?RXV6YmF0VnkwS2txNm1NWXJOUEtXU1NaTStPQlBFM2xoaXBBNkFRMXo1cmRQ?=
 =?utf-8?B?MGt0eEU0SkM2aVNsb2ZHeW9sSm5vNDIxTFRaVDhXb2JmcjZKRXA2TDBxNmRJ?=
 =?utf-8?B?U2JMeXRzSzNNQ3lsby9yVmdsTzFrQnJKUkwvU3g2UTh0R3VyUTlCcjcxZ1Bx?=
 =?utf-8?B?Nmh1eWt0S2xLSk42bzd3YmlEVGJPckQvSGt4VjhtcjNQc1hNRVlva09pUXkr?=
 =?utf-8?B?SGNLM1pyLzd1Y3FaOHdaQ3JEYm9vZU9jNGJxczFKVTVmUUI0L3V3dm12SXdZ?=
 =?utf-8?B?TDJPRVYxK252amcxR0l0TTAzU3ZyOGxGZXZIT1Z5ZXNUSytsKzZic2Q0K0pZ?=
 =?utf-8?B?R3Zhc1JyMTFvejlCSW5TdEFTTGpHYlVWdjEzZDRaTjJvbFZLMERSeFpFbGVM?=
 =?utf-8?B?cjdOZ2RyTFpueVZzWUozNHp5U1hUMXdWY2FhYzhvYXkxUUpjSHJYVFdDZkE3?=
 =?utf-8?B?eTFOKzJUOGxiSXoxTm5oL0tENHZLYjl3Tlh1YThhNllQK3F2TWZyMU85Y1hK?=
 =?utf-8?B?WUhsR1Fsb2pGMjlRaUNmNjhXcFNKYjhTRXF0U2FFUCt0NERPVDIrSUNVZm92?=
 =?utf-8?B?ZTZTSXNFSWxuR1dRK2JIWVQyK25iek52a2FCRHdZY1FsN2hyajZ2M0ZnT3px?=
 =?utf-8?B?Vy9GVEhCaUVaV245VjljUm5COHVFNGk5WEFOWE1wdlo1RjJqWTBncFR5bkJk?=
 =?utf-8?B?R2UzcmhaVEZud3dMWDE5ZloraEdKeDEwdExBUHhXMVgvenNFTk5lZEhFanRn?=
 =?utf-8?B?eXBFQi96V2JaNlpHNGJOVFVIRGpBdlN2MEdjVGlMRk5JMzBxaUNpUEFXVWdq?=
 =?utf-8?B?bHp5Y3dTOXRYWXRITEFtZmsxL2pDWjQ3ZFBEKzc5d1lUbjF1V2pvNmpFZEtx?=
 =?utf-8?B?RU9qcGtnZktZcnZ1OG01Z3hVV3AwMFlMTkU2bTd3MitQTFROVytKZ0x4clBi?=
 =?utf-8?B?UUEySGUzcDNGS1JmcThlc0E0MTBCK2VWeFppUWdBOCtabkNTZkVSYnlVUW1N?=
 =?utf-8?B?SmhtaDZMcmdZanY4VWpxTElnNHpIbDl3YWFjUjJSNDkwYjBUd0FRMERsaGFO?=
 =?utf-8?B?cEtpRmVtbFBtUnJENWF0U1E3RWtSOS9oUWpoenJ5cm5OY0x3WnhPM05Ickpy?=
 =?utf-8?B?bTN0MFhscTgzV1NiNk1XblZKRkdJNTFhUHdLbjJuaWkveXV3c3RDS3RncjBM?=
 =?utf-8?B?bDdYTjFPc04yeXBGbGdhNmUwL1I3c3ZzNXRGTHN3UFVsV0tYbHJZVnVmUVBa?=
 =?utf-8?B?WlVZRjZHcUhMbHhFWGUwMkpheS9jaldLQ3FHcEs0Z3MrTlczdlcwYmF5QThT?=
 =?utf-8?B?Q0dmZ012OXQzS2x2a0RNNnpMa0JmeG5ZdndJQ2lrYThJMk9keUgzakdXdkUr?=
 =?utf-8?B?YjYxQnYyNzM3ekRBWENJSnBueUpraW1xZWpEdDRhNzJkQjJodmN5MVNldnlw?=
 =?utf-8?B?UHRXY1hISHh0ZXV2N0dneGNIbEMvWVhDZWsvTTg4TGJNSlZqUUt4NUppUWpT?=
 =?utf-8?B?TitvTGMzZnBwZUwrKzcyQTVYQis5cXVFK0ZtcUJZcndtbW9OTWtpZ0FNSGNV?=
 =?utf-8?B?dnV4RXJsWWF0Si85ZU5EbFV5dVNmZ24zci9rb1k3VGxhcWxleVNxM3JDL2h3?=
 =?utf-8?B?aXVjOFZDaFlUUE9DTkFmMlovVW15VkNvWWU4WlNzcVY0OXBGLzZvMUNFeCtP?=
 =?utf-8?Q?7zB6Vg8PlJNXokTosgNxLEM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV4PR06MB10308.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V2FoYk1LaHM4dlVpNmtZWG5GNE8yKzdXN0g1UzkweVNUdzdoN1JJYW45NVJ0?=
 =?utf-8?B?OWllNmFpRTdLaThZOHpFbzZISmNqN05jVW05MmRDaUJyT01aZmw4bXBNNzdi?=
 =?utf-8?B?WWluYnMySzRGeE5pZ0VJZnlmSyt3MHFtd3ZsOTlrMDJUTXRFU1dSUUFwdXNz?=
 =?utf-8?B?RXF3RW0vTHg3bHNFRytVTnhlTE40RllKd0x3bFdNeVM5aFlOK1BvdE9ZL1Jo?=
 =?utf-8?B?S1dDSytlbEMxdEZiN1RScEpqaVZtSlZJSElkUWdycDQxc3ZzSzU1MTd6MzlH?=
 =?utf-8?B?Z2JOYTVvMU9FWTA5NFFtL1dkcld5a1YzZEZnbHBVaStDY0krZC9mSXh0dUpL?=
 =?utf-8?B?L2xnNUdMODVHWXBlOGFsZld5bnRvYUNMQkg0NFFIRHZ6VTlPZE91L1hHd3hM?=
 =?utf-8?B?MytOc3VtMjRsVWJ6U0VYMmpOcFExSUlURm1hWjVHSVNhbm1lNGtaTHZGT3Z4?=
 =?utf-8?B?NHVYQ3F5RnZETzRZbldHL2JlS2VaRDUwTUF2REVYaVJVbklaSXptWGJYU1Vl?=
 =?utf-8?B?YXo0NFZMTUxFRmdxME1vZURBR1VTM1BTUUZ0R2oveGNZMnJHTUNrR3F1RWd0?=
 =?utf-8?B?S3NLeVdvcW1xd2d3eThMNnNjZFl5aktPQ2ZBQVkxNThvUzlXdkx2Q2N1WFFa?=
 =?utf-8?B?K1pKMWlLOXJ6a3pCcjdTT0drNHlyd0lxQ29IVUFjTXpjbllrWUF3dzNCaHJz?=
 =?utf-8?B?ekhYWDBNdFc5cmN3eGpzbnVteU8zbGQxYjc4YmloMmtLYlhqK2ovUXdNNEZ6?=
 =?utf-8?B?NmNiMUVKbWxPeEsvMVJhOVhVNzNVOVd5ODZBT01pdGs2T2RnRnJ1NjRibzd5?=
 =?utf-8?B?NEFkczRKNndoeW14b3NNdVhMOTFiSnh5blU1UnRYKzN3Y1RONFhtWXptVGJ0?=
 =?utf-8?B?dWlSa1hkSHVvVEdXSDBxYVhYV1QrdWNzUGN6NU00a0pyVUpXbmpldi9UZ3JO?=
 =?utf-8?B?VnNiSEZISkxQa20vemIvcWFXT3AwWGNVV0ZERnJxZXM3Y3J4QWZvYUJBWUlv?=
 =?utf-8?B?VmMxcXpMYTdSWDVtTWpaRStlbmZycHJxcVpPOTg3cFBZbDJVOUtseGlwWGJo?=
 =?utf-8?B?Q2VJeFZaNGM3NnZuTkI5eUxZQmJsMm0vemtiUlhHenJFaXdLeG9HWDhtTDNY?=
 =?utf-8?B?VjF4QnJFZEkxeDA2bUpad2d4K21wcXVweE1Na1Q0Q2t4cW53YTk4YUlyb3g0?=
 =?utf-8?B?aUl5QWpFN1FGSVpaSHN2M3ZpaTZEZkRFdzMyNzBOaE1TZjQ4NC9uWmI1NndB?=
 =?utf-8?B?b25lUUhoRG9tM1hwdGU2RXJMRHJGV3p5bEU1N2Y2VGlvbHNiNWVVbGJGWUZx?=
 =?utf-8?B?bk5qeVh3MFhCOVNkZTduN3RnZzhHZ1BMUVdWanFOQ2prTHIyL3dUUW9yZUVW?=
 =?utf-8?B?QUpiWjJDREZiQm1xaFVrVVVZQTBnSFdEWVFzbk1sclJhVUZ1UXozQjhZNXNj?=
 =?utf-8?B?U01ZMklSNGc1d3J5eU9semQ0cEs5SkFyK2Z4UUxoMEd3dW1qUmdsaGQyYm53?=
 =?utf-8?B?ckl2cVBEb3E2UW1yV1lWZWpLOWFaMXBGUDVJaFI0SHlIKytnSU1nUEhpVTY4?=
 =?utf-8?B?SG5acTVpYmxxOFJieStKWmhQNEVaWXpmUnFjUElQZVA5eWwzSUpzQ0xmc2h4?=
 =?utf-8?B?Nm5VR3JFajRrRE9QQ0xZRVZuWHkyRnFiNEMxVWo2Sk5LNWVsNDdDdVIyQmx6?=
 =?utf-8?B?SHZGL0xzZ1NIY3F3OFZNbUtubC9KanNHZUFDV3FSRjdYZDl1eUNLVnRmaThO?=
 =?utf-8?B?VnZRV1JheThQd0c5TnNLaCsvRkVvOUlBbGdMWk1vVGZBY2pQT2FaWStnc29U?=
 =?utf-8?B?UXhFN3EyNmhRcWdEYzA4a1p0eDBLMmxReGlHdVpDa2hubUptS1FaS3BpYXoy?=
 =?utf-8?B?SWRxbXF0bHhaTTBIeGVGN2xzU0JwcHNzUjMxWTMzS2ovSitxVmZPQkNzVTFu?=
 =?utf-8?B?TnJUTnZZK1dHUlZhcHBtZFFkTjBIMGxLWTBYRmF0aml0bHhYdVdmVmVzbHp3?=
 =?utf-8?B?ZDhROXFDV3E2ODBTRGZZSkZpeWgxOVBhcDJaNTVmdnNyVmJHa3Zrc3MzeDB0?=
 =?utf-8?B?YVYzcEp5NVI3UC9BaGhzMEdJY2JrUVdBQ3JpWlIwSzFCM0R1ZUNSTmdwUE0z?=
 =?utf-8?B?ckRRY3Q0U1VIOFFpb3JXZ2lJdjBtbVFaUEZZMktrUzNENVFkLzhZYkNhTjlo?=
 =?utf-8?B?S25Ycy9iL21rbnFzWVFidzNVa1NrZGdXc3N3Mnk5RnRFVlA3S3VabDRHdmtu?=
 =?utf-8?B?SjRRZmNTbFg2VGFWcFZ0c1FhYXdDSllSODF4TElIc2xyMld0SlkyQXlPeFhl?=
 =?utf-8?B?Y0RjbmZuNkU1QWwwOUVEdzhtbTVUQjQ5bGpid243OFBpZFZkdzI1TG9nbDZz?=
 =?utf-8?Q?orNZ2H0z9KiPRgbI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F92C807226A6FF4A8B7465EFBE4F7AE0@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV4PR06MB10308.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e30bba7f-7b77-4629-9eb5-08de5f1a6b0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 09:40:20.2364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HOQLTb7/TjHv+h++rabndVJsnRs9GlGcOZ3slS2P3IO6fvvnqMrMzqS/Y/mpMY2TG9pYjFFGPNI3i9PcdgsXV3qYtrIiQA5m1ZSxBnsjzG/COA3ixYt2Ot06f804C3Sk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB6850
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[leica-geosystems.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[leica-geosystems.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32907-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.peter@leica-geosystems.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[leica-geosystems.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CE9EDAE35F
X-Rspamd-Action: no action

T24gMS8xNC8yNiAwMjozNCwgUGV0ZXIgQ2hlbiAoQ0lYKSB3cm90ZToNCj4gT24gMjYtMDEtMDkg
MTE6NTc6MTcsIFBFVEVSIE1hcmlvIHdyb3RlOg0KPj4gT24gMS84LzI2IDE3OjEyLCBBbGFuIFN0
ZXJuIHdyb3RlOg0KPj4NCj4+PiBPbiBUaHUsIEphbiAwOCwgMjAyNiBhdCAwMzozNDo1OFBNICsw
MDAwLCBNYXJpbyBQZXRlciB3cm90ZToNCj4+Pj4gU3dpdGNoIHRvIGF1dG9zdXNwZW5kIG1lY2hh
bmlzbSBpbiBjaV9vdGdfd29yaygpIHRvIHByZXZlbnQgcmFjZQ0KPj4+PiBjb25kaXRpb25zIGR1
cmluZyByYXBpZCBkZXZpY2UgcGx1Zy91bnBsdWcgY3ljbGVzLg0KPj4+Pg0KPj4+PiBUaGUgY3Vy
cmVudCBpbXBsZW1lbnRhdGlvbiB1c2VzIHBtX3J1bnRpbWVfcHV0X3N5bmMoKSB3aGljaCB0cmln
Z2Vycw0KPj4+PiBpbW1lZGlhdGUgcnVudGltZSBzdXNwZW5kLiBUaGlzIGNyZWF0ZXMgYSByYWNl
IGNvbmRpdGlvbiB3aGVuIGEgVVNCDQo+Pj4+IGRldmljZSBpcyB1bnBsdWdnZWQgYW5kIHF1aWNr
bHkgcmVwbHVnZ2VkLiBUaGUgY29udHJvbGxlciBtYXkgc3VzcGVuZA0KPj4+PiBiZWZvcmUgdGhl
IG5ldyBkZXZpY2UgZGV0ZWN0aW9uIGNvbXBsZXRlcywgY2F1c2luZyBkZXRlY3Rpb24gdG8gZmFp
bC4NCj4+PiBZb3Ugc2hvdWxkIGJlIGF3YXJlIHRoYXQgdGhpcyBjaGFuZ2UgYWxvbmUgd29uJ3Qg
cHJldmVudCByYWNlDQo+Pj4gY29uZGl0aW9ucy4gIFRoZXkgbWlnaHQgbm90IG9jY3VyIGR1cmlu
ZyByYXBpZCBwbHVnL3VucGx1ZyBjeWNsZXMsIGJ1dA0KPj4+IHRoZXkgY2FuIHN0aWxsIG9jY3Vy
Lg0KPj4+DQo+Pj4gQ29uc2lkZXIgd2hhdCB3b3VsZCBoYXBwZW4gaWYgdGhlIGRldmljZSBpcyB1
bnBsdWdnZWQgYW5kIHRoZW4gcGx1Z2dlZA0KPj4+IGJhY2sgaW4gYSBmZXcgc2Vjb25kcyBsYXRl
ciwgZXhhY3RseSB3aGVuIHRoZSBhdXRvc3VzcGVuZCBtZWNoYW5pc20NCj4+PiBraWNrcyBpbiBh
bmQgc3RhcnRzIHN1c3BlbmRpbmcgdGhlIGNvbnRyb2xsZXIuDQo+Pg0KPj4gSSB0ZXN0ZWQgdGhp
cyBzY2VuYXJpbyBzcGVjaWZpY2FsbHkgd2l0aCBteSBhdXRvbWF0ZWQgdGVzdCBzZXR1cCwNCj4+
IGluY2x1ZGluZyBwbHVnL3VucGx1ZyBjeWNsZXMgdGltZWQgYXJvdW5kIHRoZSBhdXRvc3VzcGVu
ZCBkZWxheSBvZiAyDQo+PiBzZWNvbmRzIHRvIHByb3Zva2UgZXhhY3RseSB0aGUgaXNzdWUgeW91
IGRlc2NyaWJlLiBJIHdhcyBub3QgYWJsZSB0bw0KPj4gcmVwcm9kdWNlIHRoZSBkZXRlY3Rpb24g
ZmFpbHVyZSwgd2hpY2ggZG9lcyBub3QgbWVhbiB0aGUgcmFjZSBjb25kaXRpb24NCj4+IGRvZXNu
J3QgZXhpc3QgLSBvbmx5IHRoYXQgaXQgbWF5IGJlIGhhcmRlciB0byB0cmlnZ2VyIG9yIGRlcGVu
ZGVudCBvbg0KPj4gb3RoZXIgdGltaW5nIGZhY3RvcnMuDQo+Pg0KPj4+IFRoZSByZWFsIHdheSB0
byBmaXggdGhpcyByYWNlIGlzIGJ5IGVuc3VyaW5nIHRoYXQgZGV2aWNlIGRldGVjdGlvbiB3aWxs
DQo+Pj4gb2NjdXIgaW4gYWxsIGNhc2VzLCB3aGV0aGVyIHRoZSBjb250cm9sbGVyIGlzIGF0IGZ1
bGwgcG93ZXIsIHN1c3BlbmRlZCwNCj4+PiBvciBpbiB0aGUgcHJvY2VzcyBvZiBzd2l0Y2hpbmcg
YmV0d2VlbiB0aGUgdHdvLg0KPj4NCj4+IEkgYWdyZWUgdGhpcyB3b3VsZCBiZSB0aGUgcHJvcGVy
IGZpeC4gRG8geW91IGhhdmUgYW55IHByb3Bvc2FscyBvciBpZGVhcw0KPj4gb24gaG93IHRoaXMg
cG90ZW50aWFsIHJhY2UgY291bGQgYmUgYWRkcmVzc2VkPw0KPj4NCj4gDQo+IEhpIE1hcmlvLA0K
PiANCj4gU2luY2UgeW91IGhhdmUgZW5hYmxlZCBydW50aW1lIFBNIGZvciBjaGlwaWRlYSBjb3Jl
LCBJIGFzc211ZSB5b3VyIFNvQw0KPiBoYXMgZGVzaWduZWQgd2FrZXVwIGxvZ2ljIGZvciBVU0Ig
Y29udHJvbGxlciBvciB5b3UgaGF2ZSBub24tVVNCIGV4dGVybmFsDQo+IGV2ZW50cyAoZWcgR1BJ
TykgZm9yIGhvdCBwbHVnLCB3aGljaCBvbmUgZm9yIHlvdXIgcGxhdGZvcm0/DQo+IA0KPiAtIElm
IHlvdXIgcGxhdGZvcm0gaGFzIFZCVVMgd2FrZXVwIGxvZ2ljIGF0IFNvQywgeW91IG1heSBlbmFi
bGUgd2FrZXVwDQo+IGF0IHlvdXIgZ2x1ZSBsYXllciwgaXQgaXMgbGF0ZXIgdGhhbiBjaGlwaWRl
YSBjb3JlJ3MgcnVudGltZSBzdXNwZW5kLg0KPiBJZiBWQlVTIGNoYW5nZSBvY2N1cnMgYmVmb3Jl
IGNvbnRyb2xsZXIgZ29lcyB0byBzdXNwZW5kLCB5b3UgZ2V0IG5vcm1hbA0KPiB2YnVzIGNoYW5n
ZSBpbnRlcnJ1cHQsIGVsc2UsIHlvdSBnZXQgYW4gVkJVUyB3YWtldXAgaW50ZXJydXB0Lg0KPiAN
Cj4gLSBJZiB5b3UgdXNlIGV4dGVybmFsIGV2ZW50IGZvciBob3QgcGx1ZywgdGhlbiB0aGlzIGV2
ZW50IHdpbGwgbm90IGxvc3QNCj4gYmVjYXVzZSBpdCBpcyBub3QgcmVsYXRlZCB0byBjb250cm9s
bGVyJ3Mgc3VzcGVuZCwgdW5sZXNzIHRoaXMgZXZlbnQNCj4gaXRzZWxmIGhhcyBkZWJvdW5jZSBy
ZXF1aXJlbWVudC4NCj4gDQo+IFBldGVyDQo+IA0KDQpIaSBQZXRlciwgQWxhbiwNCg0KVGhhbmsg
eW91IGZvciB0aGUgcmV2aWV3IGFuZCB5b3VyIGhlbHBmdWwgY29tbWVudHMuDQoNCllvdSdyZSBh
YnNvbHV0ZWx5IHJpZ2h0LiBUaGlzIHBhdGNoIHdhcyBqdXN0IG1hc2tpbmcgdGhlIHJlYWwgcHJv
YmxlbS4gRm9sbG93aW5nIA0KeW91ciBmZWVkYmFjaywgd2UgcmFuIG1vcmUgZGV0YWlsZWQgdHJh
Y2VzIGFuZCBkaXNjb3ZlcmVkIHRoZSBhY3R1YWwgaXNzdWUgDQppcyBpbiBvdXIgZmlybXdhcmUs
IHdoaWNoIGlzIGdlbmVyYXRpbmcgaW52YWxpZCBVU0Igc3RhdGUgdHJhbnNpdGlvbnMgb24gDQp0
aGUgVkJVUy9JRCBwaW5zLiBUaGUgYXV0b3N1c3BlbmQgYXBwcm9hY2ggd2FzIHNpbXBseSBoaWRp
bmcgdGhlc2UgYmFkIA0Kc3RhdGVzLg0KDQpQbGVhc2UgaWdub3JlIHRoaXMgcGF0Y2guIFRoZSBw
cm9wZXIgZml4IG5lZWRzIHRvIGJlIG9uIG91ciBlbmQgcmF0aGVyIA0KdGhhbiB3b3JraW5nIGFy
b3VuZCBpbiB0aGUgZHJpdmVyLg0KDQpUaGFua3MgYWdhaW4gZm9yIHlvdXIgZmVlZGJhY2suDQoN
CkJlc3QgcmVnYXJkcywNCk1hcmlvDQoNCj4gDQo+Pj4NCj4+Pj4gUmVwbGFjZSBwbV9ydW50aW1l
X3B1dF9zeW5jKCkgd2l0aCBwbV9ydW50aW1lX3B1dF9zeW5jX2F1dG9zdXNwZW5kKCkNCj4+Pj4g
YXMgcmVjb21tZW5kZWQgYnkgU2VjdGlvbiA5IG9mIERvY3VtZW50YXRpb24vcG93ZXIvcnVudGlt
ZV9wbS5yc3QuDQo+Pj4+IFRoaXMgdXBkYXRlcyB0aGUgZGV2aWNlJ3MgbGFzdF9idXN5IHRpbWVz
dGFtcCBhbmQgZGVsYXlzIHRoZSBzdXNwZW5kDQo+Pj4+IHVudGlsIGFmdGVyIHRoZSBhdXRvc3Vz
cGVuZF9kZWxheSBwZXJpb2QsIGFsbG93aW5nIHBlbmRpbmcgZGV2aWNlDQo+Pj4+IGRldGVjdGlv
biB0byBjb21wbGV0ZS4gQXMgZG9jdW1lbnRlZCwgdGhpcyBhcHByb2FjaCBwcmV2ZW50cw0KPj4+
PiAiYm91bmNpbmcgdG9vIHJhcGlkbHkgYmV0d2VlbiBsb3ctcG93ZXIgYW5kIGZ1bGwtcG93ZXIg
c3RhdGVzIi4NCj4+Pj4NCj4+Pj4gVGhlIHN5bmNocm9ub3VzIHZhcmlhbnQgcG1fcnVudGltZV9w
dXRfc3luY19hdXRvc3VzcGVuZCgpIGlzIHVzZWQNCj4+Pj4gKHJhdGhlciB0aGFuIHRoZSBhc3lu
Y2hyb25vdXMgX19wbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpKSB0byBtYXRjaA0KPj4+PiB0
aGUgc2VtYW50aWNzIG9mIHRoZSBvcmlnaW5hbCBwbV9ydW50aW1lX3B1dF9zeW5jKCkgY2FsbC4N
Cj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogTWFyaW8gUGV0ZXIgPG1hcmlvLnBldGVyQGxlaWNh
LWdlb3N5c3RlbXMuY29tPg0KPj4+PiAtLS0NCj4+Pj4NCj4+Pj4gVGVzdGluZyB3YXMgcGVyZm9y
bWVkIHVzaW5nIGEgc2NyaXB0ZWQgc2VxdWVuY2Ugd2l0aCBhIHJlbGF5IHRvIHNpbXVsYXRlDQo+
Pj4+IFVTQiBwbHVnL3VucGx1ZyBvcGVyYXRpb25zIGF0IHZhcmlvdXMgdGltaW5nIGludGVydmFs
cywgdmVyaWZ5aW5nIHRoYXQNCj4+Pj4gZGV2aWNlcyBhcmUgY29uc2lzdGVudGx5IGRldGVjdGVk
IGFmdGVyIHJlcGx1Z2dpbmcuDQo+Pj4+DQo+Pj4+IHYxOiBzdWJtaXR0ZWQgKGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LXVzYi96dXpzanI2aXNxNmk1aXp3M3JreW80NW9weWlraXFqbXk1
eGs3ZmxwbWxnbXFiNm1naEBycGJkdmkzczR1NTQvKQ0KPj4+PiB2MjogZHJvcHBlZCByZWR1bmRh
bnQgcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSgpIGNhbGwNCj4+Pj4NCj4+Pj4gICBkcml2ZXJz
L3VzYi9jaGlwaWRlYS9vdGcuYyB8IDMgKy0tDQo+Pj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy91c2IvY2hpcGlkZWEvb3RnLmMgYi9kcml2ZXJzL3VzYi9jaGlwaWRlYS9vdGcuYw0KPj4+PiBp
bmRleCA2NDdlOThmNGUzNTEuLmQxOWMyN2Y0NDQyNCAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVy
cy91c2IvY2hpcGlkZWEvb3RnLmMNCj4+Pj4gKysrIGIvZHJpdmVycy91c2IvY2hpcGlkZWEvb3Rn
LmMNCj4+Pj4gQEAgLTIzMCw3ICsyMzAsNyBAQCBzdGF0aWMgdm9pZCBjaV9vdGdfd29yayhzdHJ1
Y3Qgd29ya19zdHJ1Y3QgKndvcmspDQo+Pj4+ICAgICAgICAgICAgICAgIGNpX2hhbmRsZV92YnVz
X2NoYW5nZShjaSk7DQo+Pj4+ICAgICAgICB9DQo+Pj4+DQo+Pj4+IC0gICAgIHBtX3J1bnRpbWVf
cHV0X3N5bmMoY2ktPmRldik7DQo+Pj4+ICsgICAgIHBtX3J1bnRpbWVfcHV0X3N5bmNfYXV0b3N1
c3BlbmQoY2ktPmRldik7DQo+Pj4+DQo+Pj4+ICAgICAgICBlbmFibGVfaXJxKGNpLT5pcnEpOw0K
Pj4+PiAgIH0NCj4+Pj4NCj4+Pj4gYmFzZS1jb21taXQ6IGYwYjlkOGViOThkZmVlOGQwMDQxOWFh
MDc1NDNiZGMyYzFhNDRmYjENCj4+Pj4gLS0NCj4+Pj4gMi40My4wDQo+Pg0KPj4NCj4gDQo+IC0t
DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IFBldGVyDQoNCg==

