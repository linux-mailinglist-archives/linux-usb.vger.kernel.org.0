Return-Path: <linux-usb+bounces-34517-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EH9uBz4RsWmYqQIAu9opvQ
	(envelope-from <linux-usb+bounces-34517-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 07:52:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7042525D11A
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 07:52:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46B85312F00A
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 06:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E9B03750B3;
	Wed, 11 Mar 2026 06:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="AAdlo5Tl";
	dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="tydnwE0X"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com [208.86.201.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580B93176EF;
	Wed, 11 Mar 2026 06:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=208.86.201.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773211957; cv=fail; b=ngXNLk5AaHYismV7vj/UHnGb3lZo6VFYBmZO6jLDgg7QFUMoa9rfCegxdlWRZ8qvya9OOwy4ctPciW6MhDNqplaikfeukLj9hCXOo56Tu05utKNIQ6R5DeTZA6edXZU4iZEM4kzgTypHRC7Wmn6RFc8tOjsC6junW/gQ1NC7E8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773211957; c=relaxed/simple;
	bh=CbNteYwXd4lbaGRKV6yYzSHAn6GNgSyAcg1k8le/mdY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NRWjCbgHwMAB1NhCvPs1oJaaRTZrCeeS6WLgbyuzlRlEqqpzMBsm9Os5wZ/lWGNTvltyDhDjSxGH4Nc2tmRXIR7XT9I2jY5xVSb/Cek8QYxlxGzmx50Fr5h/PEZ4+TUfMNye7xTTKrYj1swSUT0JkFjFY3YDHXcELUzAdIVz6/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cadence.com; spf=pass smtp.mailfrom=cadence.com; dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b=AAdlo5Tl; dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b=tydnwE0X; arc=fail smtp.client-ip=208.86.201.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cadence.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cadence.com
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
	by mx0b-0014ca01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ANQR1E731086;
	Tue, 10 Mar 2026 23:52:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=proofpoint;
	 bh=7LF5KawEwbdJmH/v22VKjHQmiK6Y4HBTGyhlzYaU5E8=; b=AAdlo5TlCpM+
	GIWP31pYz8Thj9P415D+ntzgv88dBXJ7D2Yq54hcpI/sWQEABSt5MLm1RdVoZBiP
	Qj1rqE4UC36JyZJXj5bHL9ADHYH2nE7lbgt3VN3HCv5AMVS8RFAzccOj1i4BO87l
	dM2vF5VoOxe8RsFP0TX7BEAuVZf1GOUvb22FxDl31Cj9x/ICRbJOq+CEs+icHQbr
	gIITWFgc56V9XCx40RNuQhrNLvHNL83rAAHzXuaGkH+p8kbdvGYMYGodCOolcbAn
	Nw3r2tojTrjZmoHGuV4RT8s1DuiZLvVCJD0mklxrHVlObn79IQyGBVuKYoPWMqW9
	6U38rHowSQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011052.outbound.protection.outlook.com [52.101.57.52])
	by mx0b-0014ca01.pphosted.com (PPS) with ESMTPS id 4ctvynheq8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 23:52:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MldMi/mCfwk0mDjgA2DBlEDpTFnhKw2/DoNNNbD4KjUoqvah84BrLqsksjSwV/gqgXyUVAIizhysAeJuGqwBDziFAPcp0FUYWJ0oNui+FpdhOF9wahtaxiQQ0KwjAYIsCA0HSiFtdEO+C2s/PzeUYj6hPn70OdKevBsld7UkwyKeovhiUkvokgt2fmyePU37ugF7MYHtsTj9XLCExY75oxmdJI+NIfbMmH627nL28rUifaj3cbCL/0H/ellWWBvz8h3AYWm/MReVNXy59o5uEiF9t0jtMPD07C5VjChJlAG0zfqqhRchVZUUDpH5my4g9lnmQwTzK7gEFs9TQJ13Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LF5KawEwbdJmH/v22VKjHQmiK6Y4HBTGyhlzYaU5E8=;
 b=TD/Qs/BjxE5QujFCLb2ae2nxL6B2kIQCs89gAudd0p5/fth+wO8R+DCc0Kh3D0IlSdGt5C4B6SFARRaWjqO/9nVmPvyOkq8yMQ5vOE2x8zdh/ZzzBd0z7dAWzj3zY+Yw7cvlCSP/7AtUgn0Mfi8QeLjmp9iNLpb/b8M4ndmxUp8Nd227Yj15ZGexfmyPnYuLO0gWvXNrz/SuRxdIgTtF6QrGFTlL5PUmkHKJnUuG9tBmEFSAXN2j3u6SoCmsYkaV9A7qE8SWLx86Lwpy2dlqHH+OzM97Yoipkt96btnT3mDvehq3w7s4YQ7DZWy1UkZFBiHXgHlJdbZP8wHFlBldbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LF5KawEwbdJmH/v22VKjHQmiK6Y4HBTGyhlzYaU5E8=;
 b=tydnwE0XEU6UcMkxHj6s1dX8kOfhGO2kPGJAx7yXrLKU6VSWgWfwDWKMZ/a1HNjxtvCOQ1oKEDvFP1r+mOlCYsjeuWfsCFkaFEdyFLwJVs/+BiE3XYSrlCSy+c6QoFW39A3fbxw7GvnKhMHvP2tjhgaHyTrz8+hnfMZ/VbLpuLbLxrC+KVuV417TBqusRRPKu/uF6XoGIemIFboMEdNStPPdmy99lB8Xa7jN5UKH/Pk4hpMNu6uoAg7bRwcN11Milxm+/ZMExSw2SEqOnEiRU8jGxINDYUhOkfiESpobhWZCoKIKaaUiolPm6EjHS+b49D5rEq7NS8XKLGwwKrgh1A==
Received: from PH7PR07MB9538.namprd07.prod.outlook.com (2603:10b6:510:203::19)
 by DS2PR07MB11349.namprd07.prod.outlook.com (2603:10b6:8:2b2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 06:52:08 +0000
Received: from PH7PR07MB9538.namprd07.prod.outlook.com
 ([fe80::9088:4354:91a3:3bbe]) by PH7PR07MB9538.namprd07.prod.outlook.com
 ([fe80::9088:4354:91a3:3bbe%7]) with mapi id 15.20.9678.024; Wed, 11 Mar 2026
 06:52:08 +0000
From: Pawel Laszczak <pawell@cadence.com>
To: Peter Chen <peter.chen@cixtech.com>, "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>,
        "rogerq@kernel.org" <rogerq@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "cix-kernel-upstream@cixtech.com" <cix-kernel-upstream@cixtech.com>
Subject: RE: [PATCH 1/2] usb: cdns3: Add USBSSP platform driver support
Thread-Topic: [PATCH 1/2] usb: cdns3: Add USBSSP platform driver support
Thread-Index: AQHcqfE3zK8oK4VdQEy+BJQRIqSynbWo8JsA
Date: Wed, 11 Mar 2026 06:52:08 +0000
Message-ID:
 <PH7PR07MB95380FB5C164CF0B469152FCDD47A@PH7PR07MB9538.namprd07.prod.outlook.com>
References: <20260302030339.324196-1-peter.chen@cixtech.com>
 <20260302030339.324196-2-peter.chen@cixtech.com>
In-Reply-To: <20260302030339.324196-2-peter.chen@cixtech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR07MB9538:EE_|DS2PR07MB11349:EE_
x-ms-office365-filtering-correlation-id: 09fec8a9-0288-4992-58ef-08de7f3ab6db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 7tq8Sr50oOwAV0gQJpE820x6buD0uvvKfIi/B+t+/L+28bhdThNWjDErxvcglI37agpJ56XoXE9rc+bsrZFXAsELEvca4SxKwIUSRElWAhl2uUJF1BAx3uMIAxPGpC/bvllmzUDkhYuWPE1PbKzTlSp1qgg6MrSmKFKeWzw3xHv9SKrwMbyjzO4gC4oCCa4y1cpLl1F+oAVmlIZFlq1vU8RoSvkY1rr8o+0BjsEuKEy+4dOt4d9tWCJrhXZZMKk8OYPD6RT36hXQenRuPncI+GLCbO5j2OYn0Xgkv4oU3vYufrKoblosad+z/Y8H5f1EcSMja9EjWdN9NtWm7JZZeUBhdcanogEis2XoRZryf13F4mlHO1XmGjTw3z0KxCcTaF0ZxfJW6SuXMmVEg2umxJJTL8JzUo6t7ai5/OJ3T6tgxP4BB9th/9nWsjGMbVej/kZ8N8WgYXTf1jup4AtRL+YhC0v+R66lEzT2dHNE9xUc1/xq+uxgcDn2WQUj3CUc+lIG2SxTHf4tO7Re3YCc2vrYsq7iVMNVcXyp9UewSzjq4mdFkR1UzIoTOSLg1msk9cVUt4Kv1/F4fteeEEhMfFh1Lqz98FZjMfrAukCmTNTuPlDK6lgLEZoQutV/qLY2tq+6zfKWwQqS/RbSsXcja0xi2AweC56WvVObU5XS/Y2e65XW60k9PZ8kFhkboqdx5QvPuwzER5EFIdkktqtg4qu5Kcja4kXND72p2mxgI5xEoU1lA9OvdAdKvYuH3wEk9SwAyNvlwRz7cIDB4RRFFiUNwh5gIN0JPy71m+mMRc8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR07MB9538.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rR5uUwjeDUzy/Yx+BFvGw40CSiIRy3JQU5EiRsnezThI7QXiGN05azvMDuQZ?=
 =?us-ascii?Q?UL/P5IM4nRZgJsB5cLyisDc2p0jurf5huT/s8ArlNRmSviosGx0CQTr1wYl/?=
 =?us-ascii?Q?qs+xO/U5qN2QqYg5467rhJ1HWc7wwLBumN6nbC8xoXN+2mc53a/hOE917m7i?=
 =?us-ascii?Q?gS94cVy0tArX5z8gJNFmHqndxdjE/dG8n0PcAQ+HIEL4fCM/j0lBb+z3leRP?=
 =?us-ascii?Q?mTHKPkI21wKV4DXK1VpNNF3tTJW3rDsvDRHsxgO2rXLOOTjQro0mvLnB7n1d?=
 =?us-ascii?Q?y/p5daxeuKnrc+6xaNmwtJSMniyI1R0Wzco3LBm4bHzmIbhvqQDAec2dk52Z?=
 =?us-ascii?Q?sBJ8/WdAhYeWVsCYEJNtXZWp5lYfhO4J8qLHV2H1qUQgVR8a7moHM9Rkf8iM?=
 =?us-ascii?Q?8rAiY69h7FDCM8WH55XrK2E941SXKpUFNzk8olgpqdvvFXmyq4NE5ljRDXfh?=
 =?us-ascii?Q?ebe6bgqtr8JSIqa3v9Y0agKe9CegDdYpynHXBwux/hlmBc/LhxqbROuDtkgX?=
 =?us-ascii?Q?RCCuqj/Y5voQSQQHfAZSXMb4Kuyp/KYK/v3VeqZ0TksUNEB3oOTeCubKjHJ8?=
 =?us-ascii?Q?mzkQDv9IQJ087CMdRuU++eLeUQ58d5PYed1ThEg6i3cHhIcEZTZHJVTkoG2T?=
 =?us-ascii?Q?s99Z0I7wVLcqzoNoTbQl5KIRbyMdx7aLgu4pVNCjhlJACe7FcaNFhwJJOphe?=
 =?us-ascii?Q?vm+AN5/D4vjVRUfmB8lqaVXB67v9l7eGLZYA1sq2TOn2WMrpIRP6L2caVn+7?=
 =?us-ascii?Q?9SKWfEZTAJDZRsvffQM6etb3SpBC4inFyuXbghLQ53daHY3nRIcbE5n9zJjV?=
 =?us-ascii?Q?0+Gn9kt19eyuLecJv2rOnGfpY6SpmS5DOSCFblskpJ8Vp0+AInSwBc1/l14U?=
 =?us-ascii?Q?Rue2yqCcFvUyhZKpC4W45E1VR78Oa+3Wps/UVaC2uQyS0AGw77ULNBctdoM8?=
 =?us-ascii?Q?5LiSbu0aHfjXKswW3KKV1i6Ad9kp80lOZRCy0o6o2CyaPfnqzJoSRh9+YGpv?=
 =?us-ascii?Q?0XQqx4/40C0vcDKc7mQ4VMSY9KlYAOs1tNCc0Ddwpw0X7BoaNuQGvhxIkNnE?=
 =?us-ascii?Q?sLBQeCildc+YUyrUq50kMaQZIPeV1tLuoHHfm0PHkoYKCqstQMyLZqIi2mSn?=
 =?us-ascii?Q?5YIYQe4LinM3Pf4YKKGMVOSXNJaiGGHX485ooeXzEQF3GQ3AGZVl37G6Sz5E?=
 =?us-ascii?Q?u4sygqWJdO6TzZoqbLfVlpMdseImhTKlTg0U5MVyGXcEGUVoWMOHCVxU0tdA?=
 =?us-ascii?Q?5gSZXOUpaEmZ80aQFqphUW7laEHK9ttClcwk32AYDmVnoH4jBvE5lI9pUaOv?=
 =?us-ascii?Q?G4jKQ+vkGMT6MyHBIc6NtQ51JWBZQpUwHS6KcphA4n3Iz+tEWMLdyjrwSjT8?=
 =?us-ascii?Q?bzdLWx+JBfzE1TRIEac7YRCmSsEWAlJKyTkr0yJrqxwq2OPpnn0no5mEXpJV?=
 =?us-ascii?Q?e3wXlcfzUyHYD47Pl0EbGxMP186xfPGWMKDRrmsIP5gfJDoex6aA3AZg4kbw?=
 =?us-ascii?Q?Un23zAbgSLcnS4913GwZyf3gfYSRbnHqZsxjAvG3OxshucY5/2gHKv0runsD?=
 =?us-ascii?Q?rHhs29YymPk1wB4DGLEIihr9ksdXz/lt0pCblVZ0Xk1KEfNh/VswOeY94h5o?=
 =?us-ascii?Q?vnw3jGBH/cSWhEfwiRzx/1btHSJd90GTD2NEYKQ7ZRlj16bj8MQjlDm4+kn9?=
 =?us-ascii?Q?tHyDgfJM+X8TDuCeMEGxjc+sqTNgKRIEGEcREdNyYjoidNUorDZP1aeI6ESw?=
 =?us-ascii?Q?/iJtID+keA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	QBHh3N75v4Li+E+ibP9h+3hZyKWgQDaSBIobrJ0JQbRRa92bP0Fq6gEAP6LxuvtwYuy/qP5JEI4Ozrk//jwzbQ8kJFXeEQr/ubCQdP9XR7w4GrtPNj/5YA+WACzBgCf9vhX5ijt9vjnNYsm2sMeUrJerFle9lK8OhNOM2RlsUFMBca6OOO6kaCav3uZ0FS3LzgKby/TPmKS0XlcVkXlbvT0oV0gS5zfjHRMnBDt7HMBiE9UoUnPnb9kiFt1zt9GXBBbqrJCwfXHXh8bAM/UJxkerLbh6R5r4YN2EQQTIlh6i+ZIz6PcHdpA0WVxGRVOXXYIxf97dcwsCJ2Lxq4d10Q==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR07MB9538.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09fec8a9-0288-4992-58ef-08de7f3ab6db
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 06:52:08.5724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mfjLRJcwzj12VmxJK1QrT51M0aL//L4FgUf3V48HS8+c638EMpiPJxQAuhzbokWe6SY6ekrwJCwI1XdF0p0K5KV6rQq/VqcEqAklwQBbNZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR07MB11349
X-Authority-Analysis: v=2.4 cv=Y4H1cxeN c=1 sm=1 tr=0 ts=69b1111a cx=c_pps
 a=TarwAQ2eZTQc/qcP07j9+g==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=Zpq2whiEiuAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=W8fx6O4W8wtO2w6lYej3:22 a=tuMieXAyK57eGGFK7xkD:22 a=TAThrSAKAAAA:8
 a=Br2UW1UjAAAA:8 a=Tt19Ayum1SdS3ka9u5cA:9 a=CjuIK1q_8ugA:10
 a=8BaDVV8zVhUtoWX9exhy:22 a=WmXOPjafLNExVIMTj843:22
X-Proofpoint-GUID: _IWprCB2ugvpd5MnYZfDfrFvk7gymU9t
X-Proofpoint-ORIG-GUID: _IWprCB2ugvpd5MnYZfDfrFvk7gymU9t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA1NyBTYWx0ZWRfX71WOCi8mhCJU
 qQGtNTnnrb3zHcMQm0Jm7VSDjni9NSOyCGYkMoCrPCo5wmnPq20IGi3RNWYgDwfKs8i4Aam7qVz
 EUbFag2b4CpuYqr+5OfF27yWX4THR/E7ugMEAEtnltm01w1DEZ4OctjDa7a4bKCJQNzwA5OYbHJ
 /cUzy7DBnj6BcnvpkD/ERP0eu1H6eu4fAnDltBPJy0nqFRGhjl47N1UyjTSkM04yZ2BsMPfNMT6
 ggH/8XgH9hPCcyxPLbUxQsSrrLVBugssazI1qgmBpp2nQZ30fghpymmcDwCuXOstNxhdFSE/nvJ
 3SnoF8CTLAcgZyhbdVZnvp4YVYsVntXads6qL5uuoXdNnIpDW8BZ2QCEoTwrOzYakqvzidbopOE
 +GxFoTaqZfviYNt4kH2ELz0JivG2FP5C8Eztp1i4go8g8R6fUhQJ7q52kZ2wP8iGho+Dl7T5X+V
 L0hKuCi5NywzCr/9LXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110057
X-Rspamd-Queue-Id: 7042525D11A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cadence.com,reject];
	R_DKIM_ALLOW(-0.20)[cadence.com:s=proofpoint,cadence.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34517-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cixtech.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,PH7PR07MB9538.namprd07.prod.outlook.com:mid];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[cadence.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pawell@cadence.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

>
>The Cadence USBSSP (CDNSP) controller was previously only accessible
>through PCI, coupling the gadget driver with the PCI glue layer into a
>single monolithic module (cdnsp-udc-pci). This prevented using the
>CDNSP IP on SoC/platform designs that expose the controller through
>device tree.
>
>Restructure the driver to decouple the CDNSP gadget from PCI:
>
>- Introduce CONFIG_USB_CDNSP as a standalone tristate (analogous to
>  CONFIG_USB_CDNS3), with USB_CDNSP_GADGET and USB_CDNSP_HOST as
>  bool sub-options. The gadget code builds as a separate cdnsp.ko
>  module.
>
>- Refactor cdnsp-pci.c into a thin PCI-to-platform wrapper (similar
>  to cdns3-pci-wrap.c) that registers a platform device and passes
>  PCI resources and platform data to the common platform driver.
>
>- Add "cdns,usbssp" compatible string to the shared platform driver
>  (cdns3-plat.c). The probe function uses of_device_id match data to
>  select cdnsp_gadget_init vs cdns3_gadget_init.
>
>- Move cdns3-plat.o into cdns-usb-common, since it now serves as the
>  shared platform driver entry point for both CDNS3 and CDNSP.
>
>- Fix gadget-export.h to use IS_REACHABLE() keyed on the tristate
>  module config (CONFIG_USB_CDNS3/CONFIG_USB_CDNSP) instead of
>  IS_ENABLED() on the bool gadget config. The bool configs are always
>  'y' when enabled, causing IS_ENABLED/IS_REACHABLE to always return
>  true and resulting in link errors when cdns-usb-common is built-in
>  but the gadget module is loadable.
>
>- Add missing MODULE_LICENSE()/MODULE_DESCRIPTION() and
>  EXPORT_SYMBOL_GPL() to the cdns3 and cdnsp gadget modules, required
>  by modpost.
>
>- Pass override_apb_timeout through cdns3_platform_data so the PCI
>  wrapper can communicate PCI-specific APB timeout values to the
>  common driver.
>
>This patch was developed with assistance from Anthropic Claude Opus 4.6.
>
>Signed-off-by: Peter Chen <peter.chen@cixtech.com>
>---
> drivers/usb/cdns3/Kconfig         |  44 +++---
> drivers/usb/cdns3/Makefile        |  30 ++--
> drivers/usb/cdns3/cdns3-gadget.c  |   4 +
> drivers/usb/cdns3/cdns3-plat.c    |  14 +-
> drivers/usb/cdns3/cdnsp-gadget.c  |   4 +
> drivers/usb/cdns3/cdnsp-pci.c     | 221 +++++++++++++-----------------
> drivers/usb/cdns3/core.h          |   1 +
> drivers/usb/cdns3/gadget-export.h |   4 +-
> 8 files changed, 151 insertions(+), 171 deletions(-)
>
>diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
>index 0a514b591527..80c740f5c755 100644
>--- a/drivers/usb/cdns3/Kconfig
>+++ b/drivers/usb/cdns3/Kconfig
>@@ -20,8 +20,13 @@ config USB_CDNS3
> 	  Say Y here if your system has a Cadence USB3 dual-role controller.
> 	  It supports: dual-role switch, Host-only, and Peripheral-only.
>
>-	  If you choose to build this driver is a dynamically linked
>-	  as module, the module will be called cdns3.ko.
>+config USB_CDNSP
>+	tristate "Cadence USBSSP Dual-Role Controller"
>+	depends on USB_CDNS_SUPPORT
>+	help
>+	  Say Y here if your system has a Cadence USBSSP dual-role controller.
>+	  It supports: dual-role switch, Host-only, and Peripheral-only.
>+
> endif
>
> if USB_CDNS3
>@@ -91,27 +96,14 @@ config USB_CDNS3_STARFIVE
> 	  be dynamically linked and module will be called cdns3-starfive.ko
> endif
>
>-if USB_CDNS_SUPPORT
>-
>-config USB_CDNSP_PCI
>-	tristate "Cadence CDNSP Dual-Role Controller"
>-	depends on USB_CDNS_SUPPORT && USB_PCI && ACPI
>-	help
>-	  Say Y here if your system has a Cadence CDNSP dual-role controller.
>-	  It supports: dual-role switch Host-only, and Peripheral-only.
>-
>-	  If you choose to build this driver is a dynamically linked
>-	  module, the module will be called cdnsp.ko.
>-endif
>-
>-if USB_CDNSP_PCI
>+if USB_CDNSP
>
> config USB_CDNSP_GADGET
>-	bool "Cadence CDNSP device controller"
>-	depends on USB_GADGET=3Dy || USB_GADGET=3DUSB_CDNSP_PCI
>+	bool "Cadence USBSSP device controller"
>+	depends on USB_GADGET=3Dy || USB_GADGET=3DUSB_CDNSP
> 	help
> 	  Say Y here to enable device controller functionality of the
>-	  Cadence CDNSP-DEV driver.
>+	  Cadence USBSSP-DEV driver.
>
> 	  Cadence CDNSP Device Controller in device mode is
> 	  very similar to XHCI controller. Therefore some algorithms
>@@ -120,8 +112,8 @@ config USB_CDNSP_GADGET
> 	  It doesn't support LS.
>
> config USB_CDNSP_HOST
>-	bool "Cadence CDNSP host controller"
>-	depends on USB=3Dy || USB=3DUSB_CDNSP_PCI
>+	bool "Cadence USBSSP host controller"
>+	depends on USB=3Dy || USB=3DUSB_CDNSP
> 	select USB_CDNS_HOST
> 	help
> 	  Say Y here to enable host controller functionality of the
>@@ -130,4 +122,14 @@ config USB_CDNSP_HOST
> 	  Host controller is compliant with XHCI so it uses
> 	  standard XHCI driver.
>
>+config USB_CDNSP_PCI
>+	tristate "Cadence USBSSP support on PCIe-based platforms"
>+	depends on USB_PCI && ACPI
>+	help
>+	  If you're using the USBSSP Core IP with a PCIe, please say
>+	  'Y' or 'M' here.
>+
>+	  If you choose to build this driver as module it will
>+	  be dynamically linked and module will be called cdnsp-pci.ko
>+
> endif
>diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
>index 48dfae75b5aa..0e9b20e799d0 100644
>--- a/drivers/usb/cdns3/Makefile
>+++ b/drivers/usb/cdns3/Makefile
>@@ -3,42 +3,32 @@
> CFLAGS_cdns3-trace.o				:=3D -I$(src)
> CFLAGS_cdnsp-trace.o				:=3D -I$(src)
>
>-cdns-usb-common-y				:=3D core.o drd.o
>-cdns3-y						:=3D cdns3-plat.o
>+cdns-usb-common-y				:=3D core.o drd.o cdns3-plat.o
>
> ifeq ($(CONFIG_USB),m)
> obj-m						+=3D cdns-usb-common.o
>-obj-m						+=3D cdns3.o
> else
> obj-$(CONFIG_USB_CDNS_SUPPORT)			+=3D cdns-usb-
>common.o
>-obj-$(CONFIG_USB_CDNS3)				+=3D cdns3.o
> endif
>
> cdns-usb-common-$(CONFIG_USB_CDNS_HOST) 	+=3D host.o
>-cdns3-$(CONFIG_USB_CDNS3_GADGET)		+=3D cdns3-gadget.o
>cdns3-ep0.o
>
>+# For CDNS3 gadget
> ifneq ($(CONFIG_USB_CDNS3_GADGET),)
>+cdns3-y						:=3D cdns3-gadget.o
>cdns3-ep0.o
> cdns3-$(CONFIG_TRACING)				+=3D cdns3-trace.o
>+obj-$(CONFIG_USB_CDNS3)				+=3D cdns3.o
> endif
>-
> obj-$(CONFIG_USB_CDNS3_PCI_WRAP)		+=3D cdns3-pci-wrap.o
> obj-$(CONFIG_USB_CDNS3_TI)			+=3D cdns3-ti.o
> obj-$(CONFIG_USB_CDNS3_IMX)			+=3D cdns3-imx.o
> obj-$(CONFIG_USB_CDNS3_STARFIVE)		+=3D cdns3-starfive.o
>
>-cdnsp-udc-pci-y					:=3D cdnsp-pci.o
>-
>-ifdef CONFIG_USB_CDNSP_PCI
>-ifeq ($(CONFIG_USB),m)
>-obj-m						+=3D cdnsp-udc-pci.o
>-else
>-obj-$(CONFIG_USB_CDNSP_PCI) 			+=3D cdnsp-udc-pci.o
>-endif
>-endif
>-
>-cdnsp-udc-pci-$(CONFIG_USB_CDNSP_GADGET)	+=3D cdnsp-ring.o cdnsp-
>gadget.o \
>-						   cdnsp-mem.o cdnsp-ep0.o
>-
>+# For CDNSP gadget
> ifneq ($(CONFIG_USB_CDNSP_GADGET),)
>-cdnsp-udc-pci-$(CONFIG_TRACING)			+=3D cdnsp-trace.o
>+cdnsp-y						:=3D cdnsp-ring.o cdnsp-
>gadget.o \
>+						   cdnsp-mem.o cdnsp-ep0.o
>+cdnsp-$(CONFIG_TRACING)				+=3D cdnsp-trace.o
>+obj-$(CONFIG_USB_CDNSP)				+=3D cdnsp.o
> endif
>+obj-$(CONFIG_USB_CDNSP_PCI)			+=3D cdnsp-pci.o
>diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-
>gadget.c
>index d59a60a16ec7..b800bd1bedd4 100644
>--- a/drivers/usb/cdns3/cdns3-gadget.c
>+++ b/drivers/usb/cdns3/cdns3-gadget.c
>@@ -3508,3 +3508,7 @@ int cdns3_gadget_init(struct cdns *cdns)
>
> 	return 0;
> }
>+EXPORT_SYMBOL_GPL(cdns3_gadget_init);
>+
>+MODULE_LICENSE("GPL");
>+MODULE_DESCRIPTION("Cadence USBSS DRD Driver - gadget");
>diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-plat=
.c
>index 735df88774e4..156404bd6a43 100644
>--- a/drivers/usb/cdns3/cdns3-plat.c
>+++ b/drivers/usb/cdns3/cdns3-plat.c
>@@ -23,6 +23,9 @@
> #include "gadget-export.h"
> #include "drd.h"
>
>+static const unsigned long cdns3_plat;
>+static const unsigned long cdnsp_plat;
>+
> static int set_phy_power_on(struct cdns *cdns)
> {
> 	int ret;
>@@ -64,6 +67,8 @@ static int cdns3_plat_probe(struct platform_device
>*pdev)
>
> 	cdns->dev =3D dev;
> 	cdns->pdata =3D dev_get_platdata(dev);
>+	if (cdns->pdata && cdns->pdata->override_apb_timeout)
>+		cdns->override_apb_timeout =3D cdns->pdata-
>>override_apb_timeout;
>
> 	platform_set_drvdata(pdev, cdns);
>
>@@ -143,7 +148,10 @@ static int cdns3_plat_probe(struct platform_device
>*pdev)
> 	if (ret)
> 		goto err_phy_power_on;
>
>-	cdns->gadget_init =3D cdns3_gadget_init;
>+	if (device_get_match_data(dev) =3D=3D &cdnsp_plat)

To support USBSSP pci glue layer it should looks:
	if (device_get_match_data(dev) =3D=3D &cdnsp_plat ||  cdns->pdata)

>+		cdns->gadget_init =3D cdnsp_gadget_init;
>+	else
>+		cdns->gadget_init =3D cdns3_gadget_init;
>
> 	ret =3D cdns_init(cdns);
> 	if (ret)
>@@ -317,7 +325,8 @@ static const struct dev_pm_ops cdns3_pm_ops =3D {
>
> #ifdef CONFIG_OF
> static const struct of_device_id of_cdns3_match[] =3D {
>-	{ .compatible =3D "cdns,usb3" },
>+	{ .compatible =3D "cdns,usb3", .data =3D &cdns3_plat },
>+	{ .compatible =3D "cdns,usbssp", .data =3D &cdnsp_plat },
> 	{ },
> };
> MODULE_DEVICE_TABLE(of, of_cdns3_match);
>@@ -336,6 +345,7 @@ static struct platform_driver cdns3_driver =3D {
> module_platform_driver(cdns3_driver);
>
> MODULE_ALIAS("platform:cdns3");
>+MODULE_ALIAS("platform:cdnsp");
> MODULE_AUTHOR("Pawel Laszczak <pawell@cadence.com>");
> MODULE_LICENSE("GPL v2");
> MODULE_DESCRIPTION("Cadence USB3 DRD Controller Driver");
>diff --git a/drivers/usb/cdns3/cdnsp-gadget.c b/drivers/usb/cdns3/cdnsp-
>gadget.c
>index 6b3815f8a6e5..8db7eee528a1 100644
>--- a/drivers/usb/cdns3/cdnsp-gadget.c
>+++ b/drivers/usb/cdns3/cdnsp-gadget.c
>@@ -2075,3 +2075,7 @@ int cdnsp_gadget_init(struct cdns *cdns)
>
> 	return 0;
> }
>+EXPORT_SYMBOL_GPL(cdnsp_gadget_init);
>+
>+MODULE_LICENSE("GPL");
>+MODULE_DESCRIPTION("Cadence CDNSP DRD Driver - gadget");
>diff --git a/drivers/usb/cdns3/cdnsp-pci.c b/drivers/usb/cdns3/cdnsp-pci.c
>index 566d94e49102..7deb25816548 100644
>--- a/drivers/usb/cdns3/cdnsp-pci.c
>+++ b/drivers/usb/cdns3/cdnsp-pci.c
>@@ -1,6 +1,6 @@
> // SPDX-License-Identifier: GPL-2.0
> /*
>- * Cadence PCI Glue driver.
>+ * Cadence USBSSP PCI Glue driver.
>  *
>  * Copyright (C) 2019 Cadence.
>  *
>@@ -8,15 +8,27 @@
>  *
>  */
>
>-#include <linux/platform_device.h>
>-#include <linux/dma-mapping.h>
> #include <linux/kernel.h>
> #include <linux/module.h>
>-#include <linux/slab.h>
> #include <linux/pci.h>
>+#include <linux/platform_device.h>
>+#include <linux/dma-mapping.h>
>+#include <linux/slab.h>
>
> #include "core.h"
>-#include "gadget-export.h"
>+
>+struct cdnsp_wrap {
>+	struct platform_device *plat_dev;
>+	struct resource dev_res[6];
>+	int devfn;
>+};
>+
>+#define RES_IRQ_HOST_ID		0
>+#define RES_IRQ_PERIPHERAL_ID	1
>+#define RES_IRQ_OTG_ID		2
>+#define RES_HOST_ID		3
>+#define RES_DEV_ID		4
>+#define RES_DRD_ID		5
>
> #define PCI_BAR_HOST		0
> #define PCI_BAR_OTG		0
>@@ -28,14 +40,14 @@
> #define PCI_DRIVER_NAME		"cdns-pci-usbssp"
> #define PLAT_DRIVER_NAME	"cdns-usbssp"

Platform driver name is "cdns-usb3"

Regards,
Pawel

>
>-#define CHICKEN_APB_TIMEOUT_VALUE       0x1C20
>+#define CHICKEN_APB_TIMEOUT_VALUE	0x1C20
>
> static struct pci_dev *cdnsp_get_second_fun(struct pci_dev *pdev)
> {
> 	/*
> 	 * Gets the second function.
>-	 * Platform has two function. The fist keeps resources for
>-	 * Host/Device while the secon keeps resources for DRD/OTG.
>+	 * Platform has two function. The first keeps resources for
>+	 * Host/Device while the second keeps resources for DRD/OTG.
> 	 */
> 	if (pdev->device =3D=3D PCI_DEVICE_ID_CDNS_USBSSP)
> 		return pci_get_device(pdev->vendor,
>PCI_DEVICE_ID_CDNS_USBSS, NULL);
>@@ -48,11 +60,12 @@ static struct pci_dev *cdnsp_get_second_fun(struct
>pci_dev *pdev)
> static int cdnsp_pci_probe(struct pci_dev *pdev,
> 			   const struct pci_device_id *id)
> {
>-	struct device *dev =3D &pdev->dev;
>-	struct pci_dev *func;
>+	struct platform_device_info plat_info;
>+	static struct cdns3_platform_data pdata;
>+	struct cdnsp_wrap *wrap;
> 	struct resource *res;
>-	struct cdns *cdnsp;
>-	int ret;
>+	struct pci_dev *func;
>+	int ret =3D 0;
>
> 	/*
> 	 * For GADGET/HOST PCI (devfn) function number is 0,
>@@ -79,146 +92,105 @@ static int cdnsp_pci_probe(struct pci_dev *pdev,
> 	}
>
> 	pci_set_master(pdev);
>+
> 	if (pci_is_enabled(func)) {
>-		cdnsp =3D pci_get_drvdata(func);
>+		wrap =3D pci_get_drvdata(func);
> 	} else {
>-		cdnsp =3D kzalloc_obj(*cdnsp);
>-		if (!cdnsp) {
>+		wrap =3D kzalloc_obj(*wrap);
>+		if (!wrap) {
> 			ret =3D -ENOMEM;
> 			goto put_pci;
> 		}
> 	}
>
>-	/* For GADGET device function number is 0. */
>-	if (pdev->devfn =3D=3D 0) {
>-		resource_size_t rsrc_start, rsrc_len;
>-
>-		/* Function 0: host(BAR_0) + device(BAR_1).*/
>-		dev_dbg(dev, "Initialize resources\n");
>-		rsrc_start =3D pci_resource_start(pdev, PCI_BAR_DEV);
>-		rsrc_len =3D pci_resource_len(pdev, PCI_BAR_DEV);
>-		res =3D devm_request_mem_region(dev, rsrc_start, rsrc_len,
>"dev");
>-		if (!res) {
>-			dev_dbg(dev, "controller already in use\n");
>-			ret =3D -EBUSY;
>-			goto free_cdnsp;
>-		}
>-
>-		cdnsp->dev_regs =3D devm_ioremap(dev, rsrc_start, rsrc_len);
>-		if (!cdnsp->dev_regs) {
>-			dev_dbg(dev, "error mapping memory\n");
>-			ret =3D -EFAULT;
>-			goto free_cdnsp;
>-		}
>-
>-		cdnsp->dev_irq =3D pdev->irq;
>-		dev_dbg(dev, "USBSS-DEV physical base addr: %pa\n",
>-			&rsrc_start);
>-
>-		res =3D &cdnsp->xhci_res[0];
>-		res->start =3D pci_resource_start(pdev, PCI_BAR_HOST);
>-		res->end =3D pci_resource_end(pdev, PCI_BAR_HOST);
>-		res->name =3D "xhci";
>-		res->flags =3D IORESOURCE_MEM;
>-		dev_dbg(dev, "USBSS-XHCI physical base addr: %pa\n",
>-			&res->start);
>-
>-		/* Interrupt for XHCI, */
>-		res =3D &cdnsp->xhci_res[1];
>-		res->start =3D pdev->irq;
>-		res->name =3D "host";
>-		res->flags =3D IORESOURCE_IRQ;
>+	res =3D wrap->dev_res;
>+
>+	if (pdev->devfn =3D=3D PCI_DEV_FN_HOST_DEVICE) {
>+		/* Function 0: host(BAR_0) + device(BAR_2). */
>+		dev_dbg(&pdev->dev, "Initialize Device resources\n");
>+		res[RES_DEV_ID].start =3D pci_resource_start(pdev,
>PCI_BAR_DEV);
>+		res[RES_DEV_ID].end =3D pci_resource_end(pdev,
>PCI_BAR_DEV);
>+		res[RES_DEV_ID].name =3D "dev";
>+		res[RES_DEV_ID].flags =3D IORESOURCE_MEM;
>+		dev_dbg(&pdev->dev, "USBSSP-DEV physical base addr:
>%pa\n",
>+			&res[RES_DEV_ID].start);
>+
>+		res[RES_HOST_ID].start =3D pci_resource_start(pdev,
>PCI_BAR_HOST);
>+		res[RES_HOST_ID].end =3D pci_resource_end(pdev,
>PCI_BAR_HOST);
>+		res[RES_HOST_ID].name =3D "xhci";
>+		res[RES_HOST_ID].flags =3D IORESOURCE_MEM;
>+		dev_dbg(&pdev->dev, "USBSSP-XHCI physical base addr:
>%pa\n",
>+			&res[RES_HOST_ID].start);
>+
>+		/* Interrupt for XHCI */
>+		wrap->dev_res[RES_IRQ_HOST_ID].start =3D pdev->irq;
>+		wrap->dev_res[RES_IRQ_HOST_ID].name =3D "host";
>+		wrap->dev_res[RES_IRQ_HOST_ID].flags =3D IORESOURCE_IRQ;
>+
>+		/* Interrupt for device. It's the same as for HOST. */
>+		wrap->dev_res[RES_IRQ_PERIPHERAL_ID].start =3D pdev->irq;
>+		wrap->dev_res[RES_IRQ_PERIPHERAL_ID].name =3D
>"peripheral";
>+		wrap->dev_res[RES_IRQ_PERIPHERAL_ID].flags =3D
>IORESOURCE_IRQ;
> 	} else {
>-		res =3D &cdnsp->otg_res;
>-		res->start =3D pci_resource_start(pdev, PCI_BAR_OTG);
>-		res->end =3D   pci_resource_end(pdev, PCI_BAR_OTG);
>-		res->name =3D "otg";
>-		res->flags =3D IORESOURCE_MEM;
>-		dev_dbg(dev, "CDNSP-DRD physical base addr: %pa\n",
>-			&res->start);
>+		res[RES_DRD_ID].start =3D pci_resource_start(pdev,
>PCI_BAR_OTG);
>+		res[RES_DRD_ID].end =3D pci_resource_end(pdev,
>PCI_BAR_OTG);
>+		res[RES_DRD_ID].name =3D "otg";
>+		res[RES_DRD_ID].flags =3D IORESOURCE_MEM;
>+		dev_dbg(&pdev->dev, "CDNSP-DRD physical base addr:
>%pa\n",
>+			&res[RES_DRD_ID].start);
>
> 		/* Interrupt for OTG/DRD. */
>-		cdnsp->otg_irq =3D pdev->irq;
>+		wrap->dev_res[RES_IRQ_OTG_ID].start =3D pdev->irq;
>+		wrap->dev_res[RES_IRQ_OTG_ID].name =3D "otg";
>+		wrap->dev_res[RES_IRQ_OTG_ID].flags =3D IORESOURCE_IRQ;
> 	}
>
>-	/*
>-	 * Cadence PCI based platform require some longer timeout for APB
>-	 * to fixes domain clock synchronization issue after resuming
>-	 * controller from L1 state.
>-	 */
>-	cdnsp->override_apb_timeout =3D CHICKEN_APB_TIMEOUT_VALUE;
>-	pci_set_drvdata(pdev, cdnsp);
>-
> 	if (pci_is_enabled(func)) {
>-		cdnsp->dev =3D dev;
>-		cdnsp->gadget_init =3D cdnsp_gadget_init;
>-
>-		ret =3D cdns_init(cdnsp);
>-		if (ret)
>-			goto free_cdnsp;
>+		/* set up platform device info */
>+		pdata.override_apb_timeout =3D
>CHICKEN_APB_TIMEOUT_VALUE;
>+		memset(&plat_info, 0, sizeof(plat_info));
>+		plat_info.parent =3D &pdev->dev;
>+		plat_info.fwnode =3D pdev->dev.fwnode;
>+		plat_info.name =3D PLAT_DRIVER_NAME;
>+		plat_info.id =3D pdev->devfn;
>+		plat_info.res =3D wrap->dev_res;
>+		plat_info.num_res =3D ARRAY_SIZE(wrap->dev_res);
>+		plat_info.dma_mask =3D pdev->dma_mask;
>+		plat_info.data =3D &pdata;
>+		plat_info.size_data =3D sizeof(pdata);
>+		wrap->devfn =3D pdev->devfn;
>+		/* register platform device */
>+		wrap->plat_dev =3D platform_device_register_full(&plat_info);
>+		if (IS_ERR(wrap->plat_dev)) {
>+			ret =3D PTR_ERR(wrap->plat_dev);
>+			kfree(wrap);
>+			goto put_pci;
>+		}
> 	}
>
>-	device_wakeup_enable(&pdev->dev);
>-	if (pci_dev_run_wake(pdev))
>-		pm_runtime_put_noidle(&pdev->dev);
>-
>-	return 0;
>-
>-free_cdnsp:
>-	if (!pci_is_enabled(func))
>-		kfree(cdnsp);
>-
>+	pci_set_drvdata(pdev, wrap);
> put_pci:
> 	pci_dev_put(func);
>-
> 	return ret;
> }
>
> static void cdnsp_pci_remove(struct pci_dev *pdev)
> {
>-	struct cdns *cdnsp;
>+	struct cdnsp_wrap *wrap;
> 	struct pci_dev *func;
>
> 	func =3D cdnsp_get_second_fun(pdev);
>-	cdnsp =3D (struct cdns *)pci_get_drvdata(pdev);
>+	wrap =3D pci_get_drvdata(pdev);
>
>-	if (pci_dev_run_wake(pdev))
>-		pm_runtime_get_noresume(&pdev->dev);
>+	if (wrap->devfn =3D=3D pdev->devfn)
>+		platform_device_unregister(wrap->plat_dev);
>
>-	if (pci_is_enabled(func)) {
>-		cdns_remove(cdnsp);
>-	} else {
>-		kfree(cdnsp);
>-	}
>+	if (!pci_is_enabled(func))
>+		kfree(wrap);
>
> 	pci_dev_put(func);
> }
>
>-static int __maybe_unused cdnsp_pci_suspend(struct device *dev)
>-{
>-	struct cdns *cdns =3D dev_get_drvdata(dev);
>-
>-	return cdns_suspend(cdns);
>-}
>-
>-static int __maybe_unused cdnsp_pci_resume(struct device *dev)
>-{
>-	struct cdns *cdns =3D dev_get_drvdata(dev);
>-	unsigned long flags;
>-	int ret;
>-
>-	spin_lock_irqsave(&cdns->lock, flags);
>-	ret =3D cdns_resume(cdns);
>-	spin_unlock_irqrestore(&cdns->lock, flags);
>-	cdns_set_active(cdns, 1);
>-
>-	return ret;
>-}
>-
>-static const struct dev_pm_ops cdnsp_pci_pm_ops =3D {
>-	SET_SYSTEM_SLEEP_PM_OPS(cdnsp_pci_suspend,
>cdnsp_pci_resume)
>-};
>-
> static const struct pci_device_id cdnsp_pci_ids[] =3D {
> 	{ PCI_DEVICE(PCI_VENDOR_ID_CDNS, PCI_DEVICE_ID_CDNS_USBSSP),
> 	  .class =3D PCI_CLASS_SERIAL_USB_DEVICE },
>@@ -230,13 +202,10 @@ static const struct pci_device_id cdnsp_pci_ids[] =
=3D {
> };
>
> static struct pci_driver cdnsp_pci_driver =3D {
>-	.name =3D "cdnsp-pci",
>+	.name =3D PCI_DRIVER_NAME,
> 	.id_table =3D cdnsp_pci_ids,
> 	.probe =3D cdnsp_pci_probe,
> 	.remove =3D cdnsp_pci_remove,
>-	.driver =3D {
>-		.pm =3D &cdnsp_pci_pm_ops,
>-	}
> };
>
> module_pci_driver(cdnsp_pci_driver);
>@@ -245,4 +214,4 @@ MODULE_DEVICE_TABLE(pci, cdnsp_pci_ids);
> MODULE_ALIAS("pci:cdnsp");
> MODULE_AUTHOR("Pawel Laszczak <pawell@cadence.com>");
> MODULE_LICENSE("GPL v2");
>-MODULE_DESCRIPTION("Cadence CDNSP PCI driver");
>+MODULE_DESCRIPTION("Cadence CDNSP PCI wrapper");
>diff --git a/drivers/usb/cdns3/core.h b/drivers/usb/cdns3/core.h
>index 801be9e61340..9149612bb2a8 100644
>--- a/drivers/usb/cdns3/core.h
>+++ b/drivers/usb/cdns3/core.h
>@@ -45,6 +45,7 @@ struct cdns3_platform_data {
> 	unsigned long quirks;
> #define CDNS3_DEFAULT_PM_RUNTIME_ALLOW	BIT(0)
> #define CDNS3_DRD_SUSPEND_RESIDENCY_ENABLE	BIT(1)
>+	u32 override_apb_timeout;	/* 0 =3D use default (e.g. for PCI) */
> };
>
> /**
>diff --git a/drivers/usb/cdns3/gadget-export.h b/drivers/usb/cdns3/gadget-
>export.h
>index c37b6269b001..0cb600e2b5d2 100644
>--- a/drivers/usb/cdns3/gadget-export.h
>+++ b/drivers/usb/cdns3/gadget-export.h
>@@ -10,7 +10,7 @@
> #ifndef __LINUX_CDNS3_GADGET_EXPORT
> #define __LINUX_CDNS3_GADGET_EXPORT
>
>-#if IS_ENABLED(CONFIG_USB_CDNSP_GADGET)
>+#if defined(CONFIG_USB_CDNSP_GADGET) &&
>IS_REACHABLE(CONFIG_USB_CDNSP)
>
> int cdnsp_gadget_init(struct cdns *cdns);
> #else
>@@ -22,7 +22,7 @@ static inline int cdnsp_gadget_init(struct cdns *cdns)
>
> #endif /* CONFIG_USB_CDNSP_GADGET */
>
>-#if IS_ENABLED(CONFIG_USB_CDNS3_GADGET)
>+#if defined(CONFIG_USB_CDNS3_GADGET) &&
>IS_REACHABLE(CONFIG_USB_CDNS3)
>
> int cdns3_gadget_init(struct cdns *cdns);
> #else
>--
>2.50.1


