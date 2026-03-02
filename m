Return-Path: <linux-usb+bounces-33863-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKQiGgFepWlc+QUAu9opvQ
	(envelope-from <linux-usb+bounces-33863-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 10:53:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C52DA1D5CCF
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 10:53:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E1803057E96
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2026 09:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3A838F92E;
	Mon,  2 Mar 2026 09:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="F3q/+Ef5";
	dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="kpsQxetP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com [208.86.201.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEE01DC9B3;
	Mon,  2 Mar 2026 09:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=208.86.201.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445044; cv=fail; b=gdxsljisM+OYMLi5rSGlArUJDOT7SuQkU29sRyvb612mLxeS7K6PDyHSbj6SRGPvwRMgVijsG7EvoQDrdu4awdmtPt79HGP+UbsFK0VK3m/h/Ik9dRbtvRmPOKYFyyiyw0u5add+oO2AOLDAQ4AtsXq+BRDCUMe5GgfCGxh9U/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445044; c=relaxed/simple;
	bh=KDZlcSaOJHkyM+PNkGKuyJwHixsQaOc9UOiVZVBmIXk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QywhyljNO6Ia1Lz7uOGtOYla0npxVKKsvek5UdfK0s1yH8Cywnxn1wsPo5iaOBkGE+4QTsR2e2LM0okyf1XI0461uXjix8SG+wObaUCgGkQpPJOFXffiNPR6LDCiTUPdkNO5cZ2y1Rndxv6OxzL/DhfY0x0Fkyt7LLL92f0qxEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cadence.com; spf=pass smtp.mailfrom=cadence.com; dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b=F3q/+Ef5; dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b=kpsQxetP; arc=fail smtp.client-ip=208.86.201.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cadence.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cadence.com
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
	by mx0b-0014ca01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621M0RAR2910483;
	Mon, 2 Mar 2026 01:03:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=proofpoint;
	 bh=KDZlcSaOJHkyM+PNkGKuyJwHixsQaOc9UOiVZVBmIXk=; b=F3q/+Ef5iopB
	vKnuWAXNCf9nQssamHPDGjF9rK39LCvLoiAeOwbZa9gUdYJtGPVI9DcjM7h4epJ7
	nA2dutF6UmwhgGUWRSjsMN+4rx0/X44f38JmyB8Q8S1E60y2hfp95UhY7q2MazaT
	E9n/PteYtp/Gk1cV5C3TtanTeZQ2DpodvU7CGHQtNrqaZQiDPl4bk5ecu9tV6hY+
	+WqMS+o7kbo3vzqxj4YILYOneV48eMtDrLI5CyUusnpmVgwbRXKqKSeyNYUfPioj
	YGi9cagN/lWaJ5TZH364drmCvfFmDPEvsB4UV7IDsRRNqrfgYCNoon9Yg7g2y90s
	3SS7rzW1AA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013059.outbound.protection.outlook.com [40.93.201.59])
	by mx0b-0014ca01.pphosted.com (PPS) with ESMTPS id 4ckvtxe87r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Mar 2026 01:03:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEZ9ZPR+OslJlcAtEMGkDVcPFMQzEq/KY9mLDSfDEqGyxjLgx8u/8ubkktOMDr9nBR8HsMHEe2rPa5Y0gww4riWoOYWNWyTF6g1kH515SRsMNCCSrh2Rx/kCCjBJ11pyHL/pzMGTjOC2/cu+DPDdRRkhJr6zzLtQ3s6xJHiKHuX3eZ4aL+8TM4JyEjpxvYcwWeb6jb+TD3At3gxCsasTcenNFtWNNRyGGFmRe8jtaLdVP2zqH+TJQ0RGP8zcvtLKlfh2qwViVVFXQHLFkdFVHNnmht5GPt6+XBAH+5HK6X2o11sZlFCp1Azavad6hDXHGBz8wGZymV04EcUyRNndWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDZlcSaOJHkyM+PNkGKuyJwHixsQaOc9UOiVZVBmIXk=;
 b=XokpwN0eL6RUJgFLpEdDK5phCA257qrATqP5kKnS5eLIxPaMVAL2g71CE7QUwRIOjx6RueLQJopugj+CUERQe3I1/SPlqeJ6gvUVj13sycQfpUDvzvxSBdvgzMhY9WkK4wIwusWQIS13b5nKhEZfQ/JcKlK8QrT6X/HNpKImcoYkQpa/xtXfz3N4vcwury2AGk2WDoIQBqFODfr+fPZXHZsWztzijH8+l72G6Q9LPESC6e26cp24dpxrLxrw5ZWM/xTVJvNQD3G0JgD0cMqMfHob2Nrqlb0439q/pAQ7vxaIyuqJ1vSCdI00utUFUnaSd+FENa+l9eiZyY7TzTU9Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDZlcSaOJHkyM+PNkGKuyJwHixsQaOc9UOiVZVBmIXk=;
 b=kpsQxetPpSdPEd8U8u3JkVajJpkfAEZzLPFxd85IFTsaJKciNs52dXsKJzVgpdFi6s0HQ//gvgUAKKLw7PuRJPAEym/Ads+X+QjsxpGvL2U3bE8JZDj8DFPVrth/eoN90IMr4cOsqBu7V8OTy8dmwUA3AOxFE4i4ujTGeZbB4ZHzLQ7NI+P34rNOBFDqtkLpRy9WP+gr3NEtVt5q8W5m5PtJ6841rAYw/071k6tMNjI1LuTYepiSNVSMvpXSYtFU10nLwoxIWYH0OXbtJaqqA/T3LLEkA9akULfQhCfguo+sCpA2TJDz/uWC5kd0gAMh/2DFL9VmvM31PLDuUDWyxQ==
Received: from PH7PR07MB9538.namprd07.prod.outlook.com (2603:10b6:510:203::19)
 by CH4PR07MB10996.namprd07.prod.outlook.com (2603:10b6:610:23d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 09:03:25 +0000
Received: from PH7PR07MB9538.namprd07.prod.outlook.com
 ([fe80::9088:4354:91a3:3bbe]) by PH7PR07MB9538.namprd07.prod.outlook.com
 ([fe80::9088:4354:91a3:3bbe%7]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 09:03:25 +0000
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
Subject: RE: [PATCH 2/2] dt-bindings: usb: cdns,usb3: Add support for USBSSP
Thread-Topic: [PATCH 2/2] dt-bindings: usb: cdns,usb3: Add support for USBSSP
Thread-Index: AQHcqfEzqq3AzishPkyu47OHwJ3jnrWa8uJw
Date: Mon, 2 Mar 2026 09:03:25 +0000
Message-ID:
 <PH7PR07MB9538B9EE0077B16E40097A6CDD7EA@PH7PR07MB9538.namprd07.prod.outlook.com>
References: <20260302030339.324196-1-peter.chen@cixtech.com>
 <20260302030339.324196-3-peter.chen@cixtech.com>
In-Reply-To: <20260302030339.324196-3-peter.chen@cixtech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR07MB9538:EE_|CH4PR07MB10996:EE_
x-ms-office365-filtering-correlation-id: 5485e3b6-7ffb-4baa-4ceb-08de783a9026
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 PAN/9TpfWaBZ4fiUtRTTBtMy3sdgaxG8L+8Ea79km3gAATaaI2/5xXe/Lp0rYk3Oy/RAEyxSe2TEkD1XbX/7KK9OGaMrVmlMVC4lNlmpuCjBT9GuWZgHxH5PdIE3uPzUhUnuKYf+yglefd3b4aqhTvrHp7wjdcydZPec6J947J5ub8LsUxrPRBGSjJBX7iRFd95qoEHurCmnPG924s4SY1/VG6hkHaEivCe2ewcyGnHnHHquKgZxyzPBEg3OModHW9sWdHRw6rcsrSo6ctw0tbFH5XAC4taJCJqUo+BT3LBTZX/SwwqIudA2U1q+lN7bVtcjUgG1OzisDzq/otC0yUT2Bk79Io4Kpv2HuXdSk60LFzfCN7YJiALdQOozu/wEJzjPs+CEWWn4zFUGFr5w3zF429L7km16Fir1fRPiAZzaoSKhBSrKx1ALuCX2UO7GCygSdTkzBoxn+CH+qTlS1/NGogkutF8OWZsKBBc0oXg7fNXCZGt5mkiXkJymcFtObxa6RZQMk6jeCffQqp9t68i/axgposVJg/v2Nd5umD66GzFqAQWjZcFLFp+dHPK/NkT5/Oc7CNci5jBxvbtuF5MtryQ0p0BEYcVMZvjxFf8aZk863WJfm92DToYjQ0kc9F7gkA3HxDeq/K6b/B3WDBacC89wRdd1z7sqRVDNnAYNbjfc2IrNnwUISutDI72aXwyJR25qVbWVNmtncaxtHxD/RB+5z+Hb/QwTlmsMT4FG5JNASwG1cQ2+wZy75jR+EBg7cNnDWHhwNLm1/HT4vxb6IIsQHml3IPyCci9J4Pw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR07MB9538.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?hRbfsG52b+CF0tBLoWXJGPw4zX7jtc2NEDJkvRJMr5ph4aaLh6oN/1SGNMUe?=
 =?us-ascii?Q?+m0e4uMukvl2x8DQPg5sivlhqj5RfJf5s7hkOj6zykjxm+up8kqShWAbX82m?=
 =?us-ascii?Q?CRuSl2MR3XNJGc00nFUZMo6l1MUMLVpXTZZ1RezNrMsaDCxa3z2kQSpOV/ug?=
 =?us-ascii?Q?cZ3O+gBl6806BunOaQK+9AbiKOWBl+BfXuQpiYmnIDL1qoU/8fdhDDVadbLH?=
 =?us-ascii?Q?u2/qDpwK+QzdOaYHs0sYOb/ULz7U4jdjwVvM2fxLnFNBqrLUxcZ1Og4uGBPB?=
 =?us-ascii?Q?pSk8V874hQTJQZa6bFLeTeXngmn7YBXGZbNyayNRytlOge0xAHBfccMTsMjQ?=
 =?us-ascii?Q?MEr5buc/93pGd4dw25pAl0sJKKLresdUFnQ4c8NzwqQNUD7z+DzhWTwILHPC?=
 =?us-ascii?Q?P/MX3SARkkIkNvmHOLYYI6rcq637DZV9M5sYjabyY2YjcN3OQBDGfaN29/Kx?=
 =?us-ascii?Q?PMBuKZi/k4iUSM8quHb27A/QAxINd8IcRcnhToanvW3Hav1wS6jQYdldlSd3?=
 =?us-ascii?Q?caLgsegtwwIchOl8MpJ80MZ7DH+0NI32cK0gjrni8+0S81Udi+rVQL4hSFxr?=
 =?us-ascii?Q?JTRhLMiE3WwSRnTKDxrt0SjDEGDMt3pzHmYYRxKj4GuBwR+Vt4SIt6MXUQz+?=
 =?us-ascii?Q?9sYJW4i1mZVh7ZjuIm9TOKbbtuUhJWCvtx/VXiCl43v+sBOQQdlVfHikfuzX?=
 =?us-ascii?Q?l2toQPiiHq8NOGqEhu3l8TP4HTRtING6nvqnTSNlx0n6kCqpqXvU4CQJFSeJ?=
 =?us-ascii?Q?tRMxjnJ8YPvq4twiQf8pDX3vIsg6zQq4mLZLEoVvrNrBd0T1l5TDjQR5svlO?=
 =?us-ascii?Q?rLmqNGF82KI7aYijIrhcHOp/hVQqjG03+y4lOQbsROHQCCZe7XhaEfiauUt/?=
 =?us-ascii?Q?53uNO8THR5s3iQmEx4fmERuzud5JSjKMHMIa5zvQ7jNHr/y8+r3ZQVuNlV9h?=
 =?us-ascii?Q?AuH+9Swj/X8t+mPmXZuDKXWXXdiv30SToYJd8Ao869xHI8XsWxuEEprUTsPy?=
 =?us-ascii?Q?lEof4NnItRTM9TqJuetfXQK3cb7kdh7w4mVI5P/mlgOvc5TI9IJ/4rlADqK7?=
 =?us-ascii?Q?KLzynMpTTKxDqjYHsxFlX6wwuG5hfG/bL/sVt4i936l6mFZS4HQAN5qXOReK?=
 =?us-ascii?Q?h0rsW8V3HFMVkYKnEDNX0mKR3SV5KTIkQPTLDYZcHXZ90GuUYlfii2rzHJAp?=
 =?us-ascii?Q?09qYKMijquKbp67yIBxlNdrvz14dawybZz4XSGGMbohLPl9G5AJ3lwf+yYw7?=
 =?us-ascii?Q?QPt0KvH/iMvVpcUQ1/pcI+oX0ZaRyI1utwXW69hxcVZvtIBVYklT5f4DVuuM?=
 =?us-ascii?Q?kKl47pgJ98DvDFHwwfar6TvWec4fLTsNC6SY+MotDpPrkX4pwOIxmv8pADOi?=
 =?us-ascii?Q?J6LUBCWHJXZdOy+vhXlewLqmR/NLpASUxgo8seVYdbt7PpeS5vcdV024R0Rh?=
 =?us-ascii?Q?RRntjds8vlPJlh9i0V+oGx+Eb2Wur0PhO2lxOEdZOCBMfpcM7Q0/x3LBjwBW?=
 =?us-ascii?Q?m+mZklHruwO6Na7Ui1tgMkKw0ETk31igrtvGlRDO6P/YLHGgvx8NRqgFAAkx?=
 =?us-ascii?Q?J9sM8BuMKtpX1llKenpd4L/A7GkUDdCQlAXTodx1pRESX8j6jEATiB5iVmX1?=
 =?us-ascii?Q?6diKP/APgCBhiZi9b76kdRZ17D3b/VgXd/1uymEz6TFHw322G0rp05w+8Wwk?=
 =?us-ascii?Q?DXCzKRykfqkIjk1HJ+lQVtYDOKyG8gDGc9QchjxvLi69kruhv2QQZWpnJ4Jq?=
 =?us-ascii?Q?fF+h4QHAMg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR07MB9538.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5485e3b6-7ffb-4baa-4ceb-08de783a9026
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 09:03:25.4841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bMewW3QlGHK3XHcF5hRnxMZKqQnnw0KjNxIq+l34CpTfiiZau5Nvb7jqtLf9gDBI73D8I/P7ip9YO6L0aTch309bEgHYj+gSpCLcqEMfMEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR07MB10996
X-Proofpoint-ORIG-GUID: N6jCQz8EFMIEZ49RGTLWyRUCaZHvFiTd
X-Authority-Analysis: v=2.4 cv=WNlyn3sR c=1 sm=1 tr=0 ts=69a5525f cx=c_pps
 a=sTSJOlcUIwiiAZkT7IHz4Q==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=Zpq2whiEiuAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=W8fx6O4W8wtO2w6lYej3:22 a=tuMieXAyK57eGGFK7xkD:22 a=Wc2V4drEwFx5bKXPE4gA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3NyBTYWx0ZWRfX77fFHaxGcEW2
 Ows6aNs0YjuNAiPEpPHdxc7gLIsQD+JJXjgRQtQ/QidlqOxF/CERqSoPAjD+gzi2JqH9K1jiMO+
 QILKqldrwPIHYOo+NeM1DNkvG/jq0h1Ds75Lmi0OcHn0fF3LRD11F2v3LghH0upcLODtp4KXoMZ
 WZkZRGbZzkBXn3SQE/q9jxSoaVFrmEkP7T2U0l+4CQo112kmtQbXa0cCucYtvWVDoKY7E8Yzz/l
 pZ0fl9vTLjyqd87OoHPlMjATtUMJp2F+a2nXQ7r4QQMZJyBRpj1zxWOab6agx5UfT4pLRsqwMRm
 tCgoXvfyeSAC26LskiDG88JhD6kTdEsOCPJ/G+On7PCZUzUZOWzwPpFyxEyPESVY0dAB05Yhx4t
 d3fjk3RhhSekghy5/BrRHtWO4NfBC4JH6M87iPpVu/tSjgypOIfg8ooJKJrTHSD6/59e60+3b/o
 /2QihOOmCmsBFcsQ59w==
X-Proofpoint-GUID: N6jCQz8EFMIEZ49RGTLWyRUCaZHvFiTd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1011
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cadence.com,reject];
	R_DKIM_ALLOW(-0.20)[cadence.com:s=proofpoint,cadence.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33863-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cadence.com:dkim];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C52DA1D5CCF
X-Rspamd-Action: no action

Hi Peter,

>
>The USBSSP is the next-generation Cadence USB controller IP. It adds Super=
Speed
>Plus (USB 3.1 gen2x1, 10 Gbps) support and uses an XHCI-based device
>controller. The register layout and resource model (otg/xhci/dev memory
>regions; host/peripheral/otg interrupts) are identical to the USBSS, so bo=
th
>controllers share the same binding and the same platform driver (cdns3-pla=
t.c).
>

Include the change for the wakeup interrupt in the next version.
Unlike the legacy USBSS, the USBSSP IP handles device-mode wakeup events
natively through the xHCI-based Event Ring via TRBs, rather than using a
dedicated sideband interrupt line. This integration aligns the wakeup mecha=
nism
with the standard xHCI event processing, making the separate "wakeup"
interrupt property unnecessary for this variant.

Thanks,
Regards Pawel

