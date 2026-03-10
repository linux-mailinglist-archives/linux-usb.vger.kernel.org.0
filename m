Return-Path: <linux-usb+bounces-34491-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJK3FTZksGloigIAu9opvQ
	(envelope-from <linux-usb+bounces-34491-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 19:34:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4C0256733
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 19:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AD7E3144FA2
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 18:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3526B318EC7;
	Tue, 10 Mar 2026 18:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ivC48lQc"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013011.outbound.protection.outlook.com [40.107.159.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9562631714B;
	Tue, 10 Mar 2026 18:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773167661; cv=fail; b=VcCR7Aa0d+W/0+zsUSu7h3nvE30ANMV1a8sfdevOE1Vpdgzc3+nhtn35rd1AKEK6dkjxHY5/BdE1UoGrx1JVNMBLeD1qHP/6SMKnlDNxRF4HX60fI22Rjb5Brrxdx/9V+cUcDvMUMyl2WZRenFIqnCMrA6mcsgpuZaCJKpc/hv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773167661; c=relaxed/simple;
	bh=cHedIew9cUdyeXYk3ZCByYHgMEiW3iALYDPXL4t+V+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CelUVM/33Uw7EgxB4aSYHWEiIMKCgZZl84L68X+b4yf23RYQ6c523gsFH6PMzgO/FNN1gQGTa9FiNHi9xD0r5/1NInPsu6ssVBesNAf1N1k/+M9N/MesLiEYlJkUDs5bRancRfje71HdZD0l4thVJtnCSQT3+UhNvC2yARKiBW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ivC48lQc; arc=fail smtp.client-ip=40.107.159.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOvS7oRONNAEaGRyRsCxDPGKSU64FPgXTXV3iKFpjdFO2PdiBjE7TJjykwr3WDTR+QAswxt4LuwZMqIafJmecBgEFLh4W0CQCwCKtWsDxasI5UxoL+PJ3EcTB5QG8323WZgkwf9eZd0YxKisAyjktaKv8P0T85gG7/ihf/rUwElHs0rFEYh95UGg/w9P2VXFfBkO8RWzdrujtQhUXab6Ug7n+Xgxm/bFugO8lGpKtlI7/eVm18Rowxn3EbzcBMxD4y/tddYRKAvGnMekxLSf4K4WP/yXQY4UayGID79lczMPPlCxhH0eAZj8Hua+vXGidC2j5MmySX7IYsGsU/QA4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=goJktlLGHuLuiAq4hm5bfmNVF198Zv8Aq+1BF+olufY=;
 b=Xdkm8MynycbojYV8U6vPaLUpuJIC53/q1QOrK0nxb/bPbC1uPsIzIrNNS/94f7qpN6Pmp1E1PduM5Hh1Sjlnz7YJHTmWFF6FSRAV486LZgFZGc6/mbWFgigYRM3WCewHzwVJTyaMRlDdMIO2MHJ9VkfWg4xmHolyHLdktNBEcRLrJY5dkcoOYlPahb64CMiGWeKSAT65bYJkqupkLhXDEh/kLrae5IoI/+Zo4KvYIcewP/ZWAa/B6NAZMYRL3qdp1Cp3OBxAxOW3qlWR/VY8A5I4/EwJG+GkSvDkgU7rYrGOCyP4Sk7/6Lt72yU81OasRoZ9aT7JOKOkk5EHcujXOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=goJktlLGHuLuiAq4hm5bfmNVF198Zv8Aq+1BF+olufY=;
 b=ivC48lQcm06+8c8Qpgm1ZiAL4dwM/4ukggJmwNmMIjxtRKrJ6Wh16JI67KfiAQda0y+Vu9RIqYFvNEanL9EorIIgF1F27Z03oUSNYVkIKRukk2+m3oR5OOyCrq/Ns3whZ3Nvlvenj00t1zXPc0BZR0sAyo2GE0BWCwe5tXUPxds70u6zCXDIZ0+QsZsu76EeHVGRfBEbjjbCmL6JBV08ATV3j/y2c1/Rgas1XeDJZCc7AmJweRsEjFPmolps/XUHfBuYuHNVSKG7U9x6wyooKMufZHxFE5ucvtznraExinTggaoUBSh3iFvrHJ0u9dQID7tPDFKyFuSv0DOTD58b2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV2PR04MB11711.eurprd04.prod.outlook.com (2603:10a6:150:2d5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 18:34:15 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Tue, 10 Mar 2026
 18:34:15 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Li Jun <jun.li@nxp.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Frank Li <frank.li@nxp.com>,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH 2/2] usb: typec: tcpci: support setting orientation via GPIO
Date: Tue, 10 Mar 2026 14:34:00 -0400
Message-ID: <20260310183401.2228714-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310-support-setting-orientation-use-gpio-v1-2-da31dc6cd641@nxp.com>
References: <20260310-support-setting-orientation-use-gpio-v1-2-da31dc6cd641@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR13CA0021.namprd13.prod.outlook.com
 (2603:10b6:806:130::26) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV2PR04MB11711:EE_
X-MS-Office365-Filtering-Correlation-Id: 29a80b50-14e3-4fc2-4399-08de7ed3a1ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|52116014|376014|1800799024|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TeEADuLHJST/a848GUkqFTsUDTtpr3V8PAAdc9DPZ3nY4SEsEhlZ48hEKE8iiFmltp95pSPZf+we1BCKfuKKkK5qcS02pMN603o6w5Z0ucqCHuM3HSr8m7PYoHFCQoQB7j8TCo+ZYghPYzJmDNum/cefxFMRJwqmhTeuLioFJLY4ngTTWGxsfWVKrZ/kf/oqjaBDzBoq+c2A025WHb3/5y1hdkLHDDmLs7x3wTlosmJoSSsKI9zaVl/BoaQAZ7jh2vB8ZO+L8Yh699Dk5y0q7vEitje8CQnjJDqToARvZ1nq7y3fo3rgoYts4fVg/Kq0+CE2RSHngkVxF959/sh9NB7pZtZmtAd0mfCEab4JbMCtKCto93uYMaNZX8zbWUxCzwnS2P/vf9902Ri7jL910Cii5Op8iv7xnwZJ2eJk2oO1PORu2Zb4WnLueqGx4rjSsgDBxsa3sLJI0eaCgi5bqxx8+wfukLvLbYqWuoXOfcyHnWqhVMVJ94arv2eOzXxpUXtKYAy/QHb34kGRncrVspQEQpK6GfTJ8VWodGhbe/KF4F7/QV2qAt3iUVXidlRjXV+b2CFnecs1RHcIXC8W69g1zZUnj7Ya88do8fZ3ucmsFoaaAqkOPklbgE4Hi3uXRQ1ZdtvVVzMah3OGC9lgPKQZweOCeRbVAM0jMZiKIMeR6hl9EIAs6hnPtvs9oHPVtoPbsKv1LmIXm7RoI3u6MHtYSLU3vnuh4uMOxPUxOmUzWyr1yx1rLvnIdQ0KnjMVRqDNMUOO+kctvubqAFzzgHD++1sDC7O7yvEfznwCa3g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(52116014)(376014)(1800799024)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zTfAGVKwPN8OtdnfStMj9GDv+7XYZbzwSB0usxl9o3+Yq4L67HvTBVP4YhOt?=
 =?us-ascii?Q?aeVF+EWfSmc/AktH9P7jTWkSfwKR3dczaqwotCNLYoaqddMWalDw5c8zxBP4?=
 =?us-ascii?Q?MPkz/YnBYiW13rotPFmvdgxIbcnx4P6VeTSsRHeeqBJcPYNmq7NLpCBQEBZ5?=
 =?us-ascii?Q?KrN3ziu75szQD+D6jlSBpFD+ztBsfrjX6O9HJdIvkqoTI+p9uxVI781fH44B?=
 =?us-ascii?Q?5v/3NWK41g6TPMXyOsOVA4yYia9GwVBFPMQ6xMXiF0DbxR4Bwca5BmwUvOJm?=
 =?us-ascii?Q?5mwlGERnHRf5a086be+z5AYdh82VJsM1VBUNyMwwTK7g+GqtNVwEbe1geFKt?=
 =?us-ascii?Q?bP6cKmzPep+In87HipNlB6AbWFZRqILOpjAcJNRx/qNU55ofiZ1uwTVupB0f?=
 =?us-ascii?Q?4sAGJTRahRu/fyEGqq0wmDh9KYLnt7vYoaZ4kJUNrTinC2FLBqxyTUQ2AKdZ?=
 =?us-ascii?Q?HqUNMlmCSr69D+bbQlVnVkOGYsipNioXEUn02Ni+8NTF06O31xKGLrQC6Qfn?=
 =?us-ascii?Q?Dg4lZEtpQ41zfan50HIYGLVw5ken4dLJM/247sJKfGGW5bsfViFB15QADf5t?=
 =?us-ascii?Q?3g8lPQpVxA6URAC4Q8c+CIF24+s3SuytKT6gr/hmKBe/Lt6qMHouCl4R7D13?=
 =?us-ascii?Q?7z7867NQSthUNjyXmGgw3WPvQ5eTeWC47KbMaq6fDiO0k1nFAMjKm2+40a4X?=
 =?us-ascii?Q?iIiQsmpDuQM10jB5Rg0npE1eEb21uvvskw0rbzi0XwqAWhgTZZrp0YX9yloS?=
 =?us-ascii?Q?iJbA1HPuEo3u/ya6v3yXdgz/1E9KQ2CCY9JhEhjmGA8WOQk6Pco3zC32PD/w?=
 =?us-ascii?Q?KALbadFetWxltdobfEPW89dDVOlrf5jZ6iN4bTj10IITP1ncSqFpU36KMrMi?=
 =?us-ascii?Q?t9cjWKnhk825rp4xr6LLVlKhEhLfv90At3SCW2j8SNvI6Ddax9aOdPB4gpHQ?=
 =?us-ascii?Q?w2jMk5ox0R+QfMQ6wPEz2MrNmHZ0msVOcQlgNJv8VUz2qcb0y9rv3pGUCdHy?=
 =?us-ascii?Q?MHlWTyq554/i5rCVxsVGyUZ9fj4H2PGC3YbCzLHAVucqjxSPHctqyq1qeVYK?=
 =?us-ascii?Q?R3tkbhE3QC6BlwdMx+Rt/4/kIxvBSVe+NsL9RFe82CyoLuILd8ya70XJ5RuY?=
 =?us-ascii?Q?64Rxh3WEvg5tXZg0i7JMR4oLCQyKtyeKidpggrnNXvCavqkVL3AtGA7aqJbW?=
 =?us-ascii?Q?1f28rO7Y9Qm51wPdmlGHBq2M12tMug+DGOv7gyG0zhRkUkE+p7xJinTl81Zo?=
 =?us-ascii?Q?R5fVnYaDQivjUW7KET+XmLLOqn3q9FvlbTYqoWBqeL5yvBpZKIcn4Dwu1EbH?=
 =?us-ascii?Q?q/FsKMLOUsHv76GsVTi2JmBVCMoKie9aGoIacEqJBTYWH2zAjEHjFy7MKBei?=
 =?us-ascii?Q?mTMm0ec4bxsJoxknEWp+0MeF03sZfW32Z5HIE0iOvkBV+lFgSMKcJhUCucE1?=
 =?us-ascii?Q?zPZKxy2XugqQNA5ytANtfaVylmxhUSHUFXURnvh1S7xJj+d1RRASP77CvGz4?=
 =?us-ascii?Q?ckzbR2rMAm702Q0SohN3KfbP62BWxrbrJiVnnhQxp7PAwXHEaBRtHP76TeQi?=
 =?us-ascii?Q?mRdvLmz934sRgCepFEk/rflGpEUqDeCI51A1LMAYVR0Zlkd9O5tJeV6pJlw8?=
 =?us-ascii?Q?DfLs7sZ+v+66lOXbOhECz8POY1j4iKmxdSV7S3qd+n4g8utFDea2HbSG7xj2?=
 =?us-ascii?Q?dtHvDQO1gn1gipI0P2AqmgrPpbCmTVTIgwvHtyC5+PW3V/pDR0O4nQYapK6A?=
 =?us-ascii?Q?UyQB+qMa3w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a80b50-14e3-4fc2-4399-08de7ed3a1ac
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 18:34:15.2288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itFPAVZPd/2QYrMv/R+UOgJV1i5SUHKatrwl3xErD43ELdTw4265+GNXPiuNs0HO9KFIZexrcGn8sGLWP0JAWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11711
X-Rspamd-Queue-Id: EC4C0256733
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34491-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Action: no action

From: Frank Li (AI-BOT) <frank.li@nxp.com>

> +	if (err == 0) {
> +		orient_gpio = devm_gpiod_get_optional(&client->dev, "orientation",
> +						      GPIOD_OUT_LOW);
> +		if (IS_ERR(orient_gpio))
> +			return dev_err_probe(&client->dev, PTR_ERR(orient_gpio),
> +					"unable to acquire orientation gpio\n");
> +		err = !!orient_gpio;
> +	}

AI: The logic here is confusing. You're converting a pointer to a boolean with
`!!orient_gpio`, then assigning it to `err`. This overwrites the error code
and makes the intent unclear. Consider using a separate flag variable or
restructuring to keep error handling explicit.

> +	chip->tcpci->orientation_gpio = orient_gpio;
> +
> +	err = devm_request_threaded_irq(&client->dev, client->irq, NULL,

AI: This assignment happens after `tcpci_register_port()` returns. If that
function or any subsequent code path fails before this line, the GPIO
pointer is never stored in the chip structure. Consider moving the
assignment immediately after the GPIO acquisition, or ensure the pointer
is initialized in the struct at declaration time.

Frank

