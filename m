Return-Path: <linux-usb+bounces-35393-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBkaB5iQwmkXfAQAu9opvQ
	(envelope-from <linux-usb+bounces-35393-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 14:24:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A32309530
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 14:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C25D31FDECE
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 13:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192073F99C0;
	Tue, 24 Mar 2026 13:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="cZ1M47qu";
	dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="FI9MGlpn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com [208.86.201.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB923F8DE7;
	Tue, 24 Mar 2026 13:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=208.86.201.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358062; cv=fail; b=GDYSjvUWzBdrCtbU6/pNtSPqlplpQTxohLcR14wFAwRXHOJjRyCiPYik1rXi/kNNqnWrtWBMIlYoFyaVQURRghAchFrDokLYT1Uvnic4xVGK9o68Hj2dPMolJ3OThDE7ec2lUn0UpQwwncuOOEakHlLvZ+BwhvWk3yMrd5GVhJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358062; c=relaxed/simple;
	bh=XraiyzbETpqH1BJMfikGfafFpNbrU8Pxd9KhmP2kvWc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NofmsiwztlzhkQRZSNuzEBQ3+NqbEzp6ms+LodMxE7T5r9JGkpWbBrRAF/gQOefH4qWbwV/vdxf+WNg+4JAhmKcLHmJw6/rHYAQpc0NNVHVBfTJ0AaWi/E/V30BG7JEwukMQBkS76CqBz61XWdjC5WYnn8ZjOQTTqmp+ndjSInQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cadence.com; spf=pass smtp.mailfrom=cadence.com; dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b=cZ1M47qu; dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b=FI9MGlpn; arc=fail smtp.client-ip=208.86.201.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cadence.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cadence.com
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
	by mx0b-0014ca01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O90afc1873507;
	Tue, 24 Mar 2026 05:10:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=proofpoint;
	 bh=LMutgPngbvgi33H6TAe2hYDyMIX22JKoQ3xr80g/uhA=; b=cZ1M47quh37o
	aloskkG2kZ7yqOIgOsjhyjKmLV7TZeXb0SNQ3uaUHUyf9qB6EhhwwIqmbqDrYZXx
	7jMqgyeb0PsFnHKRLwKBnduJ1InAqk8DqbA22g1ytIEtuDOrS+N1fG5JZXLLy2GJ
	qOvmVDHChGV/6kl2WU4kg8bxfybizuOEWHy0hknaeJa78UG3iBwZAhJHxqard+ot
	A26yrNxnKbm4ylZhSvPnsBsR1izDzvoGQ/oTsbPNEgMY0r3RmOvW9oiCpZdoY0qg
	jExGyizN6hCJqc5x7neN7VzT9GQQ8eJvaENMc/xBJU+Ntxl2TOC98TE/7WP9TPL9
	VTBXvpoGbQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012044.outbound.protection.outlook.com [40.107.200.44])
	by mx0b-0014ca01.pphosted.com (PPS) with ESMTPS id 4d1pwrux5t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 05:10:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cr9XmbY/PygsR8hccB9zLHyBb1bDWXKDPaV9MeTpSLnUacPvDPBp8p8HHJ/iEK9bwlU+bnXWEX5auwrM6VBBzD2cQCPQvnppY51vI/WM5ySiCwbkknMz22Znuc1ZucDLi9zky6AVBwzxG1dNJaxI8cK9pF6izuZ8vfrfL0NAnRSProKl3S+zDTwFeCuDNUURO3oTZmREWpGVRN3CJCa4rbqKlJr98r42yRoWOmwYgzLGMstiqrfLSIThUuXIsIqRo7c0NnJGzYsoFlfwg100cHbJnYJjlcT+3+fiFI5nb3gO1cGimIbz+GBuJ4wASU2+7mMQ6E74eKL0YRW3WmFDDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMutgPngbvgi33H6TAe2hYDyMIX22JKoQ3xr80g/uhA=;
 b=R3O7UvW4LVI0Z9RAq5qZIrI3Zv7Zw+iFRRugnSuvU8eeg4/U/vtMjF5GXxQQKRuQTBRM8dB3iipExFsg1mINqkqUzHXicO4qBx33JI5sHrUul5bqAohbmJ3PQY3SQ6YAuMb4zLj6pa8jxdeIPoUoEgio3h4Mq784IeeKXv8G/gLd7eDtXiKJXrobJGpZV1ryK4gl/2Hu3dQsnyJL0AiohE531a44gLhsCODEbdxvN8G8TXi/wVWAYcggF2uJcQ98YM5QoRvxgbHFQM1Fss3AVyolzbB6PP7jvElbAVLUCJnwaWcc6gTEj6+7A1Cp5rtT6V7ZAM2v2JCcgSdx8FWX8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMutgPngbvgi33H6TAe2hYDyMIX22JKoQ3xr80g/uhA=;
 b=FI9MGlpntY2GATa6lF4up1NCu4VFTxE471hMr1FxLLzo8NOAe5g8xq6Cl7IWhAgyHEcoEVKsno2MPcSw9m2dl8QM0yxYGzKtF8RcbfqEtlHdS07CwR1OB5SWxO4E8SwA6BooIT8maswKDl/22K+7FwYXGsvPInG5WnkFHYXpCVOFRVWtEfXxL62WBjX0qPSjPEqmu6h/TFAXnK1FjnUm7xbS5HvrHGfpG4iD/TSk2UtyHo1uugZTSqEfCO9+ZLXFc9FbA1FhVaR9HyVRzjyhR9GoVW05Fu1Tj618OtWdbSgeJ4IgQMe/QGkJ4zgxnYuEEmJ0uxkW9GP3OpDNszxFgA==
Received: from PH7PR07MB9538.namprd07.prod.outlook.com (2603:10b6:510:203::19)
 by SJ2PR07MB9711.namprd07.prod.outlook.com (2603:10b6:a03:4fa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 12:10:48 +0000
Received: from PH7PR07MB9538.namprd07.prod.outlook.com
 ([fe80::9088:4354:91a3:3bbe]) by PH7PR07MB9538.namprd07.prod.outlook.com
 ([fe80::9088:4354:91a3:3bbe%7]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 12:10:43 +0000
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
Subject: RE: [PATCH v2 2/2] usb: cdns3: Add USBSSP platform driver support
Thread-Topic: [PATCH v2 2/2] usb: cdns3: Add USBSSP platform driver support
Thread-Index: AQHctRDuXCnZZjr6gEeuPjjl1ktBK7W9l57A
Date: Tue, 24 Mar 2026 12:10:43 +0000
Message-ID:
 <PH7PR07MB9538B73EB7746CED9A094447DD48A@PH7PR07MB9538.namprd07.prod.outlook.com>
References: <20260316064831.274865-1-peter.chen@cixtech.com>
 <20260316064831.274865-3-peter.chen@cixtech.com>
In-Reply-To: <20260316064831.274865-3-peter.chen@cixtech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR07MB9538:EE_|SJ2PR07MB9711:EE_
x-ms-office365-filtering-correlation-id: 8e4d7647-dc54-4145-5e39-08de899e5fa8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 hxss74wc6XLV3UYyn/keQVljBCmr+XA90IWYUeI7KO1RfrJHjCyaJjYHeu4PYMcdBFFeF37+5yAAfBHjqipCg2zaxqkkVPu5Kp28UmNfVEgs8HrhYvy7djdYH38V/0u191xigS1CefwTBdhTL4I8GXBDVUeQXKx99OMfjISbS/CANW4y3N6YnRVMyHny1hp0Iw6gh/9O8daC5SodZ6L+TIjzAiz9vi5OSQikdbZkpi8tUp83ClYgHNOUmIdHETvO1qND1LMiCot8pcVv6/dgXmTWNQ00yRqyhRfxzC0OdLbLgxcJRfOkwI/z30dMLAhkvLfAIAZYUcy69PcLSj9FSFlHhjtcv28QwBO+MpQve5O/vFwMXCrhEVoWrJWK9Ae8GwSF24pJ7gpQdN9/RLPrGey+6Exq/y+iLVkgqCy69bDgjqD1+Bs3H1Rnx05wLQAC6vhufs/0QHbeMzXOd4fqpxffXLQ3+2tcgoU6LNxIkkn2nnBJ6xZJOQTWMuWIgHMxjxgDKF1WixyCIGxooM6eLBANKNkv7fm6JCymPQs/ky0VM16Q+9oQAQtC77IY7+/TYXzjwjf/lpq8kpcJXkDynCqY5m+0km45Rt9p/Oqy4J1kdlBcqc2dx4sQvUayeRY70TJNAuordI8LWNQ4jIahvCWhOrdNrDqHzM1g0PeIHi2nufrQJ+gZrezB+C4PQiNbco4H+8FPI3Ksdn31Na7NKZ92MKARFQDAHIIvxgVq1977i8bwclk1p2bO+Sg2OfuXnYw+uHnY+yK8k/P/g7Dn//vrBAGPOVkeDfy7ZDd38sg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR07MB9538.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1nPdwyGfBQ/W7BR0dGTgnPNSny/MQ07BwjoqM2t2S+s+4EIMCHq8XukVWO2a?=
 =?us-ascii?Q?BdhI4KJvsv/IRgyqSe1bj7AShi9f9UhS24BbeLphu6ff3766PzgOLKG1eLhX?=
 =?us-ascii?Q?5RvdZxX3tvqtMITsXSASJi7A5bs1bsfco9706c3wiZl+c9tmO3Kz309PRfME?=
 =?us-ascii?Q?tkY0DUJaF9wFTatnJvzOtuZqQ9atwjspYqc4Q1S456sGX2dDgl+U4btoM+pn?=
 =?us-ascii?Q?NyxajX2tgwB0UxciUtsZNsprMYkfO2bQUrGcSoLg4GJWOFjTK1NKhoUvOmiB?=
 =?us-ascii?Q?Jc44WepnqrpBjK5PkdSbjuaxm91C0bcxQmO/UlCNMtyBR3ywkgmg0yT2KzsR?=
 =?us-ascii?Q?+h0tnUbma2+toBykWoUyBzF985+geZ4lqICB6fRQXUik/QUnuY+uCa9cP3Xo?=
 =?us-ascii?Q?ICA2WdqZlKTgrG2PPCAF8oDzupRDQZOM9lUi0D/UV7orMXE/kJl/5tvf8bE9?=
 =?us-ascii?Q?S6s1Xhwh2/L/kESJAqoqsbP+swLlVbOkOPzAux43u8xaObeq8HF0kJTMd7pg?=
 =?us-ascii?Q?bQy1Zeg146YOaHmiSbmrdr8YqCYxb8wykcsXOuGH9c6I2LXG4XKrMlTFlpQ1?=
 =?us-ascii?Q?gUGyaIPkQE47JPbT5riCo92Hez5P8ahAMTWZSGKR724HH5rpTU9ZRGdj0FZW?=
 =?us-ascii?Q?BwFeoLO77YVxka+zIZWiBboPxtTD0oOPFtfQHfNvtyKOru64d9ioGPFj+s7n?=
 =?us-ascii?Q?USyCUn0rqsCCaCmSKJzJU4eZHgKCJOD8d7WCbftqVCbSbO+X66cKzQr0gpyr?=
 =?us-ascii?Q?ntkAby3bGKxZdv62jgoI/h21MEbQBeCtEYIcf4R0ekQFqvMSNTjXJB+XYSc5?=
 =?us-ascii?Q?/6tWlkmNERCLJB3Nv9kbARQ9b1gwo+cx+h1lAQ//0b2c392VU+LmhliIJBVO?=
 =?us-ascii?Q?wERJ6TorQUFtpHkA4ZJjiWEXushMgDUWgs+DUOiaCKMXo8OtuJuzKmVWn/7f?=
 =?us-ascii?Q?1ZndJ+b6ArxoI1Bf1CYKBcYN/PSgl3pVr+NjNDkRTcBiwi74ROqJFcmxwhB2?=
 =?us-ascii?Q?ycLzeUccOSwfMAv3E+A/ptpOsDgMPJPi47EZxDGXxSCNxNEqSg3HHudib73z?=
 =?us-ascii?Q?2XX2yluK2f3QqVgs8Q01M7VOAhNEyPGmiK7MWlDfOh/Kuec/bk0AYHzvLlpi?=
 =?us-ascii?Q?ZatXVDUGiOATx0i65MkDFYX9M4lYCWGinMjUMlLM11KZqdj5oks54qtswrOI?=
 =?us-ascii?Q?AQJHHQWK4xf7Xax5mhOg8DWyXjyjazSaS91VuBJP1acZB2cGf3Xuix+0pg32?=
 =?us-ascii?Q?YHlj2AHSTNhhYVC79yaoszDnuEmQIQtigmMfciEb/vXmbBS3cvNFZaYpsWns?=
 =?us-ascii?Q?8b9AACHQdE58foHQQTXGfpA5/xbfIQXaTiskS8a4Mr6ytN5IDBwCcNi7AvT1?=
 =?us-ascii?Q?7Lf8yqTx+EIIJs0VNIc6dfGHWS8nsvnHL7QUHpoyCUiu+3XYp2Uzj/qrVhGq?=
 =?us-ascii?Q?k9oib/7qcx4K6gAKYLbaKCjmN8TCJlh/1yCVFJaNiLZFnGSdd/cd8ND/Fdtx?=
 =?us-ascii?Q?0oVMII3TlJViACB6QfAyavEAzIz0dnWOGyav4zg7Vu4pD1+PJx6S4jdCLFZo?=
 =?us-ascii?Q?eNyCss5nqAzlS+CGpkzALpDePInK0qH//8BcPVV/EqYyDDlqbxsmQ/mgkaDN?=
 =?us-ascii?Q?xkMOA6FZNY71KPX+3KDZya/lxHjwftqGiWRYjN9VCkxKrekGF8NK0bohI8CT?=
 =?us-ascii?Q?IzxcHEl5MI4E5uwfCF9X5jcdxgcZZiu6ZNiDErCLx+/VhV6QBrkg8ICZ0H9N?=
 =?us-ascii?Q?SfaMdZlADw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	nKFUt/HS3r7HJwdSYP7f7hul+cBIfS4mh0cIJv8dPS4RpFitaeppbOP7xZBtuUz8N/MYMGznC4bcmMx2pJiX5HbH1NN9uuDCmIP+ZN6DezNxpCYDJxbYEFJhjck9iSQ4D8BsgKLKG9F3hu5l7zcF29PtOkEzSsdICSb75nyWKprja1xsqWVkqMI+epmi77nIRxmwx7nGU0YOS5MvZ9gb5qBsKenAnmnx/v+NjIFwz0gLNmGSV3H09mrc0N+DJAVQLLcvHVIK97Sdj+NIBdbg5Ag5Pqasx65Qeafcx3G3Ld4y6qeiOxgPpcty4AYz4awFwvX5p7SSeaGOzNJ9Co6zMQ==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR07MB9538.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e4d7647-dc54-4145-5e39-08de899e5fa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 12:10:43.5690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gse1ixO4KK7/Z3AxjN2HV8GOUCukva3AGKiEQmvz77A79uAPGhmnJN8UDaZXK2fKk1gWH8DTLEjPxLHc1wWehddGcvQ9KnMQK13QOHDlqpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR07MB9711
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA5NyBTYWx0ZWRfX1lPtxwvjxQa5
 s0pxWAmeEb3HZAU95rXXEzCsnu/1rQDy3wLNjzrZwSNz/zcyhfjtlSevaocu9ACaNfDz1Mdm10U
 NamvY+S+E1vv6hjf5JS7DLyZpRPDhckdkwbeQ9gibCdl12n7zzvmJqUzPTIb1zvtacDGS71yogJ
 iQNTWf8fpUMGOKknv9FgfgvBxcActGY5/o8WkZCw8FNROodu7DVFmhuw86egGttbbtzhwWIYrmC
 Syiw0FAvhzUWKN/7gsZnWDOKDGH9vTzy+4lN58Fn1+dZL0MMIF5nn+/YKDmgxebQQ+1b6FntNud
 pZE5Q6bSYxwSDzhl1zQ8Zzq9HerAvPJnTm1fDcVJmKjwWmUPgYvgJeygWzbbeLcc8z50u3NeaiP
 hHmUq1PQLtRQ3k1O+Ny5qhiCfsGRMhJhuvtMQM6CXJFFfkYdCwOm7BRfeQ3WNMmJbNDZ8GscSDT
 5x3ngUnBh6thsBsehyw==
X-Proofpoint-GUID: ubSqG0NArAauBKE53EetOOv9In-Z7hf1
X-Authority-Analysis: v=2.4 cv=UapciaSN c=1 sm=1 tr=0 ts=69c27f4c cx=c_pps
 a=DLgJpnoc0/49jVUGH+L3OQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=Zpq2whiEiuAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=W8fx6O4W8wtO2w6lYej3:22 a=tuMieXAyK57eGGFK7xkD:22 a=TAThrSAKAAAA:8
 a=Br2UW1UjAAAA:8 a=c6ZWSSpMEdiS729S3h0A:9 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10
 a=8BaDVV8zVhUtoWX9exhy:22 a=WmXOPjafLNExVIMTj843:22
X-Proofpoint-ORIG-GUID: ubSqG0NArAauBKE53EetOOv9In-Z7hf1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240097
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cadence.com,reject];
	R_DKIM_ALLOW(-0.20)[cadence.com:s=proofpoint,cadence.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35393-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,PH7PR07MB9538.namprd07.prod.outlook.com:mid,plat_info.id:url,cixtech.com:email,cadence.com:dkim,cadence.com:email,plat_info.name:url];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 65A32309530
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


>
>The Cadence USBSSP (CDNSP) controller was previously only accessible
>through PCI, coupling the gadget driver with the PCI glue layer into a
>single monolithic module (cdnsp-udc-pci). This prevented using the
>CDNSP IP on SoC/platform designs that expose the controller through
>device tree. It restructures the driver to decouple the CDNSP gadget
>from PCI.
>
>- Introduce CONFIG_USB_CDNSP as a standalone tristate (analogous to
>  CONFIG_USB_CDNS3), with USB_CDNSP_GADGET and USB_CDNSP_HOST as
>  bool sub-options. The gadget code builds as a separate cdnsp.ko
>  module.
>
>- Regroup USBSSP and CDNS3 Kconfig options under the USB_CDNS_SUPPORT
>  menu so they appear properly grouped in menuconfig.
>
>- Refactor cdnsp-pci.c into a thin PCI-to-platform wrapper (similar
>  to cdns3-pci-wrap.c) that registers a platform device and passes
>  PCI resources and platform data to the common platform driver.
>
>- Auto-detect the controller version (USBSS vs USBSSP) at runtime by
>  reading the DRD/OTG Device ID register in cdns_drd_init(), and select
>  the appropriate gadget init function (cdns3_gadget_init or
>  cdnsp_gadget_init) based on cdns->version. This follows the same
>  pattern already used for host initialization.
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
>This patch is Assisted-by: Cursor:claude-4.6-opus
>
>Signed-off-by: Peter Chen <peter.chen@cixtech.com>
>---
> drivers/usb/cdns3/Kconfig         |  50 ++++---
> drivers/usb/cdns3/Makefile        |  30 ++---
> drivers/usb/cdns3/cdns3-gadget.c  |   4 +
> drivers/usb/cdns3/cdns3-plat.c    |  17 ++-
> drivers/usb/cdns3/cdnsp-gadget.c  |   4 +
> drivers/usb/cdns3/cdnsp-pci.c     | 217 +++++++++++++-----------------
> drivers/usb/cdns3/core.c          |  11 +-
> drivers/usb/cdns3/core.h          |   5 +-
> drivers/usb/cdns3/gadget-export.h |   4 +-
> 9 files changed, 164 insertions(+), 178 deletions(-)
>
>diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
>index 0a514b591527..97fa84dddbca 100644
>--- a/drivers/usb/cdns3/Kconfig
>+++ b/drivers/usb/cdns3/Kconfig
>@@ -20,10 +20,6 @@ config USB_CDNS3
> 	  Say Y here if your system has a Cadence USB3 dual-role controller.
> 	  It supports: dual-role switch, Host-only, and Peripheral-only.
>
>-	  If you choose to build this driver is a dynamically linked
>-	  as module, the module will be called cdns3.ko.
>-endif
>-
> if USB_CDNS3
>
> config USB_CDNS3_GADGET
>@@ -89,29 +85,27 @@ config USB_CDNS3_STARFIVE
>
> 	  If you choose to build this driver as module it will
> 	  be dynamically linked and module will be called cdns3-starfive.ko
>-endif
>
>-if USB_CDNS_SUPPORT
>+endif # USB_CDNS3
>
>-config USB_CDNSP_PCI
>-	tristate "Cadence CDNSP Dual-Role Controller"
>-	depends on USB_CDNS_SUPPORT && USB_PCI && ACPI
>+config USB_CDNSP
>+	tristate "Cadence USBSSP Dual-Role Controller"
>+	depends on USB_CDNS_SUPPORT
> 	help
>-	  Say Y here if your system has a Cadence CDNSP dual-role controller.
>-	  It supports: dual-role switch Host-only, and Peripheral-only.
>-
>-	  If you choose to build this driver is a dynamically linked
>-	  module, the module will be called cdnsp.ko.
>-endif
>+	  Say Y here if your system has a Cadence USBSSP dual-role controller.
>+	  It supports: dual-role switch, Host-only, and Peripheral-only.
>+	  Cadence CDNSP Controller device mode is very similar to XHCI
>controller.
>+	  Therefore some algorithms used has been taken from xHCI driver.
>+	  Host controller is compliant with XHCI so it uses standard XHCI driver=
.
>
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
>@@ -120,8 +114,8 @@ config USB_CDNSP_GADGET
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
>@@ -130,4 +124,16 @@ config USB_CDNSP_HOST
> 	  Host controller is compliant with XHCI so it uses
> 	  standard XHCI driver.
>
>-endif
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
>+endif # USB_CDNSP
>+
>+endif # USB_CDNS_SUPPORT
>diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
>index 48dfae75b5aa..63484f145bb9 100644
>--- a/drivers/usb/cdns3/Makefile
>+++ b/drivers/usb/cdns3/Makefile
>@@ -4,41 +4,33 @@ CFLAGS_cdns3-trace.o				:=3D -
>I$(src)
> CFLAGS_cdnsp-trace.o				:=3D -I$(src)
>
> cdns-usb-common-y				:=3D core.o drd.o
>-cdns3-y						:=3D cdns3-plat.o
>
> ifeq ($(CONFIG_USB),m)
> obj-m						+=3D cdns-usb-common.o
>-obj-m						+=3D cdns3.o
>+obj-m						+=3D cdns3-plat.o
> else
> obj-$(CONFIG_USB_CDNS_SUPPORT)			+=3D cdns-usb-
>common.o
>-obj-$(CONFIG_USB_CDNS3)				+=3D cdns3.o
>+obj-$(CONFIG_USB_CDNS_SUPPORT)			+=3D cdns3-plat.o
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
>index 735df88774e4..71c612e27b73 100644
>--- a/drivers/usb/cdns3/cdns3-plat.c
>+++ b/drivers/usb/cdns3/cdns3-plat.c
>@@ -44,6 +44,14 @@ static void set_phy_power_off(struct cdns *cdns)
> 	phy_power_off(cdns->usb2_phy);
> }
>
>+static int cdns3_plat_gadget_init(struct cdns *cdns)
>+{
>+	if (cdns->version < CDNSP_CONTROLLER_V2)
>+		return cdns3_gadget_init(cdns);
>+	else
>+		return cdnsp_gadget_init(cdns);
>+}
>+
> /**
>  * cdns3_plat_probe - probe for cdns3 core device
>  * @pdev: Pointer to cdns3 core platform device
>@@ -64,6 +72,8 @@ static int cdns3_plat_probe(struct platform_device
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
>@@ -143,12 +153,15 @@ static int cdns3_plat_probe(struct platform_device
>*pdev)
> 	if (ret)
> 		goto err_phy_power_on;
>
>-	cdns->gadget_init =3D cdns3_gadget_init;
>-
> 	ret =3D cdns_init(cdns);
> 	if (ret)
> 		goto err_cdns_init;
>
>+	cdns->gadget_init =3D cdns3_plat_gadget_init;

The call to the following function could have been placed in cdns_init.=20
Then assigned of gadget_init  should be above of cdns_init.
=09
Besides,
Acked-by: Pawel Laszczak <pawell@cadence.com>
=09
Pawel,

>+	ret =3D cdns_core_init_role(cdns);
>+	if (ret)
>+		goto err_cdns_init;
>+
> 	device_set_wakeup_capable(dev, true);
> 	pm_runtime_set_active(dev);
> 	pm_runtime_enable(dev);
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
>index 566d94e49102..432007cfe695 100644
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
>@@ -16,7 +16,19 @@
> #include <linux/pci.h>
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
>@@ -26,16 +38,16 @@
> #define PCI_DEV_FN_OTG		1
>
> #define PCI_DRIVER_NAME		"cdns-pci-usbssp"
>-#define PLAT_DRIVER_NAME	"cdns-usbssp"
>+#define PLAT_DRIVER_NAME	"cdns-usb3"
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
>diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
>index f0e32227c0b7..10f00b6c3c83 100644
>--- a/drivers/usb/cdns3/core.c
>+++ b/drivers/usb/cdns3/core.c
>@@ -80,7 +80,7 @@ static void cdns_exit_roles(struct cdns *cdns)
>  *
>  * Returns 0 on success otherwise negative errno
>  */
>-static int cdns_core_init_role(struct cdns *cdns)
>+int cdns_core_init_role(struct cdns *cdns)
> {
> 	struct device *dev =3D cdns->dev;
> 	enum usb_dr_mode best_dr_mode;
>@@ -197,11 +197,14 @@ static int cdns_core_init_role(struct cdns *cdns)
> 		goto err;
> 	}
>
>+	dev_dbg(dev, "Cadence USB3 core: probe succeed\n");
>+
> 	return 0;
> err:
> 	cdns_exit_roles(cdns);
> 	return ret;
> }
>+EXPORT_SYMBOL_GPL(cdns_core_init_role);
>
> /**
>  * cdns_hw_role_state_machine  - role switch state machine based on hw
>events.
>@@ -469,14 +472,8 @@ int cdns_init(struct cdns *cdns)
> 	if (ret)
> 		goto init_failed;
>
>-	ret =3D cdns_core_init_role(cdns);
>-	if (ret)
>-		goto init_failed;
>-
> 	spin_lock_init(&cdns->lock);
>
>-	dev_dbg(dev, "Cadence USB3 core: probe succeed\n");
>-
> 	return 0;
> init_failed:
> 	cdns_drd_exit(cdns);
>diff --git a/drivers/usb/cdns3/core.h b/drivers/usb/cdns3/core.h
>index 801be9e61340..dc8c4137de15 100644
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
>@@ -119,14 +120,14 @@ struct cdns {
> 	struct cdns3_platform_data	*pdata;
> 	spinlock_t			lock;
> 	struct xhci_plat_priv		*xhci_plat_data;
>-	u32                             override_apb_timeout;
>-
> 	int (*gadget_init)(struct cdns *cdns);
>+	u32                             override_apb_timeout;
> };
>
> int cdns_hw_role_switch(struct cdns *cdns);
> int cdns_init(struct cdns *cdns);
> int cdns_remove(struct cdns *cdns);
>+int cdns_core_init_role(struct cdns *cdns);
>
> #ifdef CONFIG_PM_SLEEP
> int cdns_resume(struct cdns *cdns);
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


