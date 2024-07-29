Return-Path: <linux-usb+bounces-12555-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E3E93ED68
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2024 08:26:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF6DF1C21A98
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2024 06:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D8585260;
	Mon, 29 Jul 2024 06:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fUMqRYe5"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010058.outbound.protection.outlook.com [52.101.69.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC61184DE0;
	Mon, 29 Jul 2024 06:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722234390; cv=fail; b=JmD1vGi2RNgI82St/tZ4HGSGkZN5jfU8hlRvzikLtp8TwgXt4TD/tlxBqGBoKzM9QPXV5qftz25LLhlT2rgxPYFn2VYClARcIRBZUANHRgTHBoVX30HrCrvKli7367FLQ1i21fzf8H5rzOVMZuXNGSloHVlUj3GvteS1vR8I0eY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722234390; c=relaxed/simple;
	bh=impZmQ+ryOlZTvBycNt2IYo+hxzeR2z7otYweouOX30=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F9ngVh1yOT3npr9HGJ5qBpS4+ExZiRhel7ZXroHkQGzfhTU9l8JoPtZ7kvZAgj5rz1x1jIcb3Mwua7396AJ7d1nRqRHw3w6C/b5ZOvFhk6EUnm+pApK+AJMSH+d4rPjb3aypPiWYUSHA8pw1o+MZl8/VKeR9ISxVY4yZZLw6n1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fUMqRYe5; arc=fail smtp.client-ip=52.101.69.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uoAKw8MVkKJR3tWJONk+9pFVg/F4QVbQ0lwS5CL4I3iDqQWmWaCzZYdftN4mZDPi43ZW5j0A4/1O9W4GNFgBcetHqttQ9U3gX+IKfcyjjIaPPBhC+nzKu8OzHvXZ9yq1UhJaurd8YFw5DezUfIrnf+/TaMltlGmBVcAfWEbIuWfuBxk0fq5FUk/7dsatrqXb2TQf9A2W/+O3FUcca+gt6uR1t5dsSkBq6HRzHG3IHseiNnkTsTq5F6xxGy8yDGdrJ5qquKhVddpHBvFVW9tG2W/0kR3wglyNRKnet4pC28kyb40ev344IJ1Hmy8Vi34tjg7x8OxNuKcnatkMtnHW0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=impZmQ+ryOlZTvBycNt2IYo+hxzeR2z7otYweouOX30=;
 b=TB4oOC+B6JoERW0HP9zcLtgm0pOw5mCImRC9N7pR8O9O6Slq+rsScpQJJWNM6M+r7T5kuDs2kQ8slLFQ520oSUE5aFQvFb7j58pLp26dFPLItZomPINRpNpMO27IUNnQ8Fy1ztTOpesPdqc6Xw+Z99Nfgm4Iz0+mWQvjQaQDj1Y2GgElUf5J+L0Nf1bvZrPXpXV7PsMfLC9kkUMUgQMWhc8RTokT+eySI/eNDaEXI45yVq+l2ETHHhWtTB4LzR3Dy6PKlgxy/2egTYEVv6haaLQX/NtPYXtOQOO10t2UHSYk/PMJS8KLJ4KBDX2V4Uptv8Pf8LnMeM4lLJV5PQlqYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=impZmQ+ryOlZTvBycNt2IYo+hxzeR2z7otYweouOX30=;
 b=fUMqRYe54aoB+L/3jvPGZFttdZRpTr0DOxmrYSqxv8pChyEYcY3tcJg6zUM/bF+ANW3TSIOQm/tUmK7YwkoPUFoNGOD1EPk8GLGyS6yAo313DTVUKA5/SV/IXRlpguaiW70ypTizqfFUX6zvOj/c+m19SVHj4WXtL4Nnqy4oATpay4sIYppKmkNTvEmej/Z5fde0whKciEnwuecPQDHJqEjazNNvQd6u2ZHxuwqiM2DZqmugGiSHx2pqUuq6i5CF1ndqCD+JRqhDygfOGBFo4atstZdjfAhla2ioqY9rz/G3oELnrylQX38cP2IgeAlmL2RHcxfgEWNznQ+1hQ21Gg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7203.eurprd04.prod.outlook.com (2603:10a6:20b:1d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 06:26:25 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7784.020; Mon, 29 Jul 2024
 06:26:24 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	"vkoul@kernel.org" <vkoul@kernel.org>, "kishon@kernel.org"
	<kishon@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"peter.chen@kernel.org" <peter.chen@kernel.org>, "herve.codina@bootlin.com"
	<herve.codina@bootlin.com>
CC: "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH v2 3/6] dt-bindings: phy: mxs-usb-phy: add nxp,sim
 property
Thread-Topic: [PATCH v2 3/6] dt-bindings: phy: mxs-usb-phy: add nxp,sim
 property
Thread-Index: AQHa3097fNjJlnhH/0ODxZBb+E47dbIM53LAgABXgoCAAAInEA==
Date: Mon, 29 Jul 2024 06:26:24 +0000
Message-ID:
 <PAXPR04MB8459A07BDD8EA36E1E9C03E188B72@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20240726113207.3393247-1-xu.yang_2@nxp.com>
 <20240726113207.3393247-3-xu.yang_2@nxp.com>
 <PAXPR04MB8459517F5F5BC4E1C7A5E67888B72@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <b1a4b23b-1c0a-49cb-9601-f4a7609cc930@kernel.org>
In-Reply-To: <b1a4b23b-1c0a-49cb-9601-f4a7609cc930@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM8PR04MB7203:EE_
x-ms-office365-filtering-correlation-id: bacd507f-d651-4219-ea60-08dcaf975efd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?QW9TSHJoSzVoRVNOUEg5ZUlTSk1KVkdwZGJDcUg1dmlqOXEvMmdUZXhsaDA1?=
 =?utf-8?B?anZuVGtqdXM5NFZ2RCt2aEdib0NLVk9WeGZMOEtVSlpJRzlQcnkxb2VEemtP?=
 =?utf-8?B?Wk9qUDRoN2o5Zld5bzZFL05zMUhUcy9IS2xMZDhjOThWdzlKVVBPUUVlc0hK?=
 =?utf-8?B?ek9oRVZlY09sTmRHcTZwZlhtTGl3KytqR2x1N2RYa3gvU25MS3ZRN09STWpy?=
 =?utf-8?B?eFYxMENSZDJ1WUdEdXNieVZ1N0FuUjEvK200bHlENmJhd244aEFYeC9ZUTVm?=
 =?utf-8?B?dEdLWG9uRll5UWwxbGFpeTRNVDNxYm9BOGN1WVhOU2F4K001N2ZZL3U5b3pM?=
 =?utf-8?B?TmJNekp5STRZc1NNTjNPUjBBQWRBV1FLaVdjWEhxazkzTkpMbXRlU3B2MGdM?=
 =?utf-8?B?cUZHQmNyVDBXU1JOa0VBNnA1Nm1QWU5KQjN1TUkwQWdnUklKVzU2MEZpRlBj?=
 =?utf-8?B?bGZZOUs1MFRTRmVFUGdwSW4xcGQ4aVcwbkJxMi9oUzNaUmRXek1XRXZpSlNU?=
 =?utf-8?B?K3BZVkttbDUxcWg4cWhNK2RBbDJNdDQzajVNT0g1eEgrNDVpM2FOb0ljbU1L?=
 =?utf-8?B?RmFUUEVTYXh0VlFabUNDY1BycGk4b2lpUTJGMkVaK2xjWkZLZ2l6OFQ0bDFu?=
 =?utf-8?B?NmpZamliN2ZkYTV4emgvL29XNHpNOCtlck1KY294TmtUcENvcGgwOXJnKzgx?=
 =?utf-8?B?dUZKRzh1SCtEUFJINENOMjVCRmdDald0U1Fxdlk4ZDhJK25RampUdkRqTW1z?=
 =?utf-8?B?WHM5VVd6S2luNnpTMUg1SFhmTmlseUV0U3BGVDB2QzUxV3hxNzBxTmJ0UmFV?=
 =?utf-8?B?MkhEMXUyWWtQaXpnTGlYL1poVmtDYkVJVEZIWXI2em04MUFtcW82MUl0Yksx?=
 =?utf-8?B?YjRjWGZXRlFWZmI0NytNcGVDMDIzRjlwdUtHKzl0akJBc1V6bmxxMGVIbUtl?=
 =?utf-8?B?cEhvdzRUeDBybE1uTi92N29TWXdQT3Z6OGcrK2xPcTc3TERRWEpIbWZFSFFm?=
 =?utf-8?B?ZXhRdDZVY0p6dWtzTHlqVTJQT0xSdHYrNVpPSHJ5WFl1M3U3WHEwM2lCSlBE?=
 =?utf-8?B?YlhsMnRSQWlYTGpzSXdUMVVDdnI1RDRPSHIwV2VXckhLWXRoZXpCMTJaWVhS?=
 =?utf-8?B?Y3dSVU44UXU3WU9HaTVsU2l2MG9KVUhOT2F2VXNEQjZKcGhzeElDL0I3Z0Nu?=
 =?utf-8?B?Qi9HRjFUS3NmRkJXTzZPYTRjTjVWeDMwaEdoNk5TUzd1Mk1KclpXaTNPOGJ1?=
 =?utf-8?B?OHBpR2NmVnZlN0xEaXpOa0ZDVkhwZVR0L3hXbWk0Y21rTEF0WW9BMWQ4cThC?=
 =?utf-8?B?MGlCd0pHZDBXRGVBZGdxcDZDc0E3aVR3U1A1RGFHQ2FzY3BVMHAzdUhEQk0y?=
 =?utf-8?B?L1FEaGVleG91R1VPUFFnblBCa2FRMDVhSENwcUVOcmZCdFpzWDZiaUhzSkJX?=
 =?utf-8?B?N21xKzBqSnZpYVlmM21yTXBpWEJLa01FNllzK0g3RkhLcXo5c3NBVnk2ZkVJ?=
 =?utf-8?B?bUNacU8yN1BCcnRjOU9BOEFwTlJla0U0SVFYdFJXQkE3SHV2YjZab25GWE1v?=
 =?utf-8?B?Y2JhMDFyWG1mOW9GSWM5RC8yVWZ2eUF3NEV5OVRrUGswMVRTRUtLZ2JISFJH?=
 =?utf-8?B?alE3b01WUktHellrN3JxdDB2b1ZPK0FxMDZkWHhScWtLSEVENGpzRjNCazVT?=
 =?utf-8?B?VGI1QUE3REYvdGRMTWhSUlhUYUtDQ24vVHdMdXBpOWdvcFVMMThNa0hHOFlE?=
 =?utf-8?B?cmFEWTVpM01LdndhKzdtaEhzMkJYSlNacGU4VUFteDl0TTJmZWJrSGVjaHY2?=
 =?utf-8?B?YVErelFMVzlTckg1bkNTUTUxbkl5RGJDRVZmSTRGdnRmWUJqS2g4WjZPdGlw?=
 =?utf-8?B?SytXOEZ5VTZXbi94a0hpaWlSK2JoRlVLUHBHMlJHdXh4NjJFcEIrNTZiendo?=
 =?utf-8?Q?6fU3KA5yjdw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SzVKWXhIWjNyM3NtVkJCM000VTZvWng5anpNdENQQVZwbUJMMk9IT3JCcFJB?=
 =?utf-8?B?cVBpdFRIMmNrQU9yL0Jmc05La1RGZTJ5YU16V2dsMC9WeFFRYjZlSkRyMit3?=
 =?utf-8?B?QVF5ME9VclJ4M2V1bDJNZmlyZWp6SHpFY1gwYkpHMjU1QUxNVEZkTHdIaFZa?=
 =?utf-8?B?ZmM0UGNiWkZJaDhRYTE2elNQdEkrajdIbkpTMkg1cThBOGhZZEpKUmFoRVdQ?=
 =?utf-8?B?RlhiM1R6a3M4djJ0eWUrOW5DM3VobDRHRGZTK3A0ZHBCbmE1QXRQRWlrQm9I?=
 =?utf-8?B?dyt2QUVFSGVIbkpEVi9mVCtJc2VtaXNhK3BRYVFXM3B3VU5sNXRhYnVhVjRK?=
 =?utf-8?B?TnZDM3E5Z3FncGhvaTVDV01JcnkvTzRBWlNnaWwrblFaQ1J6VjJvaFhzcTVB?=
 =?utf-8?B?NzhFcTNxMUpKMVNYMDYxVUx6L1UwTnpDZG5hdDRRdzlpcmxqTEpDVXI3Q3Y4?=
 =?utf-8?B?OVdFeTNsazIwdkxCb01VdllZOWNSNXRsMmRNUFl3cG1IcUY0dlZMQmlGYzZK?=
 =?utf-8?B?RVV6WlZDMzFvTzNOSWplUnVkYUFSY2x2aktFcitNQWVkTXFENWJQWXAzVjJz?=
 =?utf-8?B?MzBTMWloTUYxS2Zkcm1mT1I0QWRBY2dRczlOYWR3TmRoMEthZEExN3ZSdDBJ?=
 =?utf-8?B?eVd5MUpHb0NTTjZaSmkxdnd2b1k5a1E2YnIva1pmcVhVbjR6WmU4aEFmL0ha?=
 =?utf-8?B?R3RFV1dmNmxrUXRZWXdxOTlMZWFQTjhBUjY1dE50M2R3NUczQU13OC9wUGZs?=
 =?utf-8?B?Q2s1UjIxQUo4dHFXT2JRLzJMSE5EaHJBU2paWnlnUCtxVVp0aWVvMVB6aS9F?=
 =?utf-8?B?aUVObGdSYkhJYlRrRkpGWW02RmFoSEFPaHBmTDBsMlpYempvR0FCbGUwb1gw?=
 =?utf-8?B?dGRxeFVMeFgvYVNSTFBPTzl6OGdENTJ5dkZQTnZ0SWhXL1dzYlo3NmdIV2Mr?=
 =?utf-8?B?c3doajhQa3YzV0RVeG5vd0RsUWdtTTJIZFFHSmpySGVGSTR3cGFWb0s2RjJZ?=
 =?utf-8?B?RzhzUmJNdm11VWgyaHEvMW5nM0IyMEloZjZGZDJwNlorWnU5Q0RXeXJGeno0?=
 =?utf-8?B?VTZ2S2JweFpaMzhlc2dNbmFLWWt4WWNNRjd6TUdJcXowUlI3Uy83WlhiZHdu?=
 =?utf-8?B?Z01yNitJZnVIQ2JKeFc4SmFnMVd2TVIwc1Z1U2N6Wlg0Y0pzNEdLdHNBSjZy?=
 =?utf-8?B?c3padkp2bmNvcTh3bjZMUElJOWtSZzN5YUg3K3dnRFNYRG9GVkkxMU92Wkhy?=
 =?utf-8?B?OUNxWWVDYmd4WkM3VWo4OTVkZEFQSGQ4QllNcm8xdWcxT0poZVNhN25CVm90?=
 =?utf-8?B?ZnhXQUZzSHhpcFdsWDRTeHE4b0xWNDBiQnFrNnZiWStvbEFOdU94SllLdEJt?=
 =?utf-8?B?QU9MOWVwalZQTEUveEwvSkVzbVdxYnl3NUt5NHYrUEROakUvVUVXcjR4K2dC?=
 =?utf-8?B?RjlrNjFNZU10ZTRNRHhydlRncDYyY3R2Mk9uR0tTY3FrMUo2VVRrN0FRa0F5?=
 =?utf-8?B?UlFFcFZ4SjYyRjBQRk1NY3o1Q0V4bFB3aXlERFFZUHlmeW9FdFlKenNmOGNw?=
 =?utf-8?B?eVJFUkhrUzRSdGdlNkQ0OHJqdStuYnBGMEVXbjVIYWhsVTdLSTE1MnRGMGF6?=
 =?utf-8?B?RE5YRTlFcithbU8vQ1hiRzlmTm01ODBqbXlST3MvOTdDeXE1OEh0TzlXNVZm?=
 =?utf-8?B?TktOL0MycXpDMG81YWhtaUc0K3A0ci81K24xMnF2Ujh6K2JtTTQ3SmdNVnQv?=
 =?utf-8?B?WnlTeGtFdnN3ZElUWE43NVVaektVbGVzR3BMRDF2MlhyTWs1aXMrZ1VEZ0J5?=
 =?utf-8?B?dFFnUWdLblVNb1BhRzdxWHZlVTF2SzNMb2x5b2hSUzFCeEVaL0N4YkpCVmRa?=
 =?utf-8?B?TGZ3RVlURDNTQ05XSkdtQ2tLSVc3RVdIeUptMG9RMXMrdG1kdjVCTWl4K0d2?=
 =?utf-8?B?RVpoU0g1ZWtnN2l3NFFZVncrQ3I2eFYrQTdSS2FJclN1ZzZBZFN4YitTcWRI?=
 =?utf-8?B?ZlA1dENxajBqS1RwSTFUWG9sY2k0akNqRXRVMzBaSFJpRjhiZFdpWWplWjhX?=
 =?utf-8?B?UG83N05Ra0Z5blljalpxbDNqNUhwUlhwb2toS2lLVWxucWo5ay9SZ2hENUhG?=
 =?utf-8?Q?f9Kg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bacd507f-d651-4219-ea60-08dcaf975efd
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2024 06:26:24.8207
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xxo2h1X8weY1TSE3azDQcdhYCU7tpHVb9ID6wVGmD1aUm0Icjgmlcdrz8UFwzWCvhGY6NkhTF4ApL0r2DLOsxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7203

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDMvNl0gZHQtYmluZGluZ3M6IHBoeTogbXhzLXVzYi1w
aHk6IGFkZA0KPiBueHAsc2ltIHByb3BlcnR5DQo+IA0KPiBPbiAyOS8wNy8yMDI0IDAzOjAzLCBQ
ZW5nIEZhbiB3cm90ZToNCj4gPj4gU3ViamVjdDogW1BBVENIIHYyIDMvNl0gZHQtYmluZGluZ3M6
IHBoeTogbXhzLXVzYi1waHk6IGFkZCBueHAsc2ltDQo+ID4+IHByb3BlcnR5DQo+ID4+DQo+ID4+
IGkuTVg3VUxQIG5lZWQgcHJvcGVybHkgc2V0IFN5c3RlbSBJbnRlZ3JhdGlvbiBNb2R1bGUoU0lN
KQ0KPiBtb2R1bGUgdG8NCj4gPj4gbWFrZSB1c2Igd2FrZXVwIHdvcmsgd2VsbC4gVGhpcyB3aWxs
IGFkZCBhICJueHAsc2ltIiBwcm9wZXJ0eS4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogWHUg
WWFuZyA8eHUueWFuZ18yQG54cC5jb20+DQo+ID4+DQo+ID4+IC0tLQ0KPiA+PiBDaGFuZ2VzIGlu
IHYyOg0KPiA+PiAgLSBhZGQgZWxzZSBicmFuY2ggc3VnZ2VzdGVkIGJ5IFJvYg0KPiA+PiAtLS0N
Cj4gPj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9mc2wsbXhzLXVzYnBoeS55YW1sIHwg
MTcNCj4gPj4gKysrKysrKysrKysrKysrKysNCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNl
cnRpb25zKCspDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcGh5L2ZzbCxteHMtDQo+ID4+IHVzYnBoeS55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9mc2wsbXhzLQ0KPiA+PiB1c2JwaHkueWFtbA0KPiA+
PiBpbmRleCBmNGIxY2EyZmI1NjIuLmNlNjY1YTI3NzliNyAxMDA2NDQNCj4gPj4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9mc2wsbXhzLXVzYnBoeS55YW1sDQo+
ID4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvZnNsLG14cy0N
Cj4gdXNicGh5LnlhbWwNCj4gPj4gQEAgLTg3LDYgKzg3LDEyIEBAIHByb3BlcnRpZXM6DQo+ID4+
ICAgICAgbWF4aW11bTogMTE5DQo+ID4+ICAgICAgZGVmYXVsdDogMTAwDQo+ID4+DQo+ID4+ICsg
IG54cCxzaW06DQo+ID4NCj4gPiAibnhwLGlteDd1bHAtc2ltIiBzaG91bGQgYmUgYmV0dGVyLiBT
SU0gaXMgc3BlY2lmaWMgdG8gaS5NWDdVTFAgYXMgb2YNCj4gbm93Lg0KPiANCj4gQ2FuIHlvdSBn
dWFyYW50ZWUgdGhhdD8gSU9XLCBpZiB5b3UgZXZlciwgZXZlciBjb21lIHdpdGggYW5vdGhlcg0K
PiAic2ltIg0KPiBwcm9wZXJ0eSBmb3IgYW5vdGhlciBTb0MgTlhQIGFncmVlcyB0aGF0IGl0IHdp
bGwgYmUgcmVqZWN0ZWQ/DQoNCkkgY291bGQgbm90IGp1ZGdlIGhlcmUuIEkgd2FzIHRoaW5raW5n
LCB2ZW5kb3Isc29jLWlwIGlzIHRoZSBwcmVmZXJyZWQNCnByb3BlcnR5Lg0KPiANCj4gUHJvcGVy
dGllcyBzaG91bGQgYmUgZGVmaW5lZCBvbmNlIGFuZCBuYW1pbmcgc3VjaCBwZXItc29jIGtpbmQg
b2YNCj4gY29udHJhZGljdHMgaXQuDQoNCkl0IGlzIGZpbmUgdG8ga2VlcCBueHAsc2ltIGFzIHdo
YXQgdGhlIHBhdGNoIGRpZC4gDQoNClJlZ2FyZHMsDQpQZW5nLg0KDQo+IA0KPiBCZXN0IHJlZ2Fy
ZHMsDQo+IEtyenlzenRvZg0KDQo=

