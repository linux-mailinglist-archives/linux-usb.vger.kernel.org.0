Return-Path: <linux-usb+bounces-34133-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 49DDL/U2qmnUNQEAu9opvQ
	(envelope-from <linux-usb+bounces-34133-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 03:07:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1946721A781
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 03:07:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBC4A303677A
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2026 02:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997AC31B833;
	Fri,  6 Mar 2026 02:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WVoQ2zW3";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="aibYwbF8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XYZZ3pnw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FCE315D39;
	Fri,  6 Mar 2026 02:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772762805; cv=fail; b=LQ3YOLH4O+ZQefZ/k6i9N078G3dKqVJca53foLbLwZ5B76Et02sHUR/y9YLyY0gQxYsJd/j1qKJJZB0ACx7mmI4KmUwn9aTJwh3LCFsUH2IETjQZ+SSuPC5H5/gv+mJCFsPoBTYPa2A1MqNbG4WkCWbgl/y4brs/2nhgZ2GOBtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772762805; c=relaxed/simple;
	bh=J4l+dctCeABEdxpbwL83Xl65QoBx/51078rLgUfHGLE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mWA5PFS15IzOJF8Z5e+WkY9fLR4saAl7R0w0tu7e50pIFbnFJ7UCYCK3+noOIi8pCMG8HBIouwY0zp0ZRzLIA+4jgJeP9GztAVRp7R0CaPXHogR9YpVuZtC3rzuYh9KEEMMIAN8UVT4fqYnTWUQjGe6PwM47WrsobZKtlQ4dxVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=WVoQ2zW3; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=aibYwbF8; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=XYZZ3pnw reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625Kn1vm3016858;
	Thu, 5 Mar 2026 18:06:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=J4l+dctCeABEdxpbwL83Xl65QoBx/51078rLgUfHGLE=; b=
	WVoQ2zW3f2HLmLsiTap9MQ0tIhj1GugD7p4LEWq7SDkxhqOzSn4C2EqnwyGAJmPL
	hWzeW8LnldfVMnAATg+CCRodnySf2uw0N6hH69gp+4KdwYXUGJLyRJg3IpCrG2iF
	zPZf4hN1BcunEZWYEPLrcz6rQzN9m8jyVe87TBo6rBjNrFnWtIv5ohu/z9Wo1gZW
	pIprgekrRBL7PP19Q4PiKy38Sy/QBqjNrpxtTZ6TfW9dq81IGHLOd2zzjUjsuYq/
	F+L1th7nKGtAc4+bIP0EvHCvuM5PoNJFHyGFYz3sxaQsem1HdVnv6cdugWH/CtaM
	E9vkECqg0qEPtPAcSdqHnw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4cqb8f4yx6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Mar 2026 18:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1772762790; bh=J4l+dctCeABEdxpbwL83Xl65QoBx/51078rLgUfHGLE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=aibYwbF8LdW/CzgkzCVNkIehCMRZzPBfug2IMFKw9FGbvMTv5gxcn+1s+hKdgy/2U
	 WQmMRSMCP3skwa9dygr3ndIb4O4nxIOdn8gQLr0RBPDWe54HzItDcU0EVoQQUR/tCl
	 +nE9kaFfZarL+zaxVfzTxM1yTBzhYtk4CToxVaOhlw4diRdBp97BZE0aTpn+uUeGQK
	 s3VsKuT6qgSGTNN65KwTU2C1HY671DvptIYWXvJOxuiMFhueskzj86+4a7F1NxCHXn
	 hHuK5xoNFVULQiDHrdIeaFO+TwRRRSGF04CefIF71Fmdf+ANnfQ1qVvzd3olFffvpk
	 Up9664g4TLKRw==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6BF24403B9;
	Fri,  6 Mar 2026 02:06:29 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id C2D37A005E;
	Fri,  6 Mar 2026 02:06:28 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=XYZZ3pnw;
	dkim-atps=neutral
Received: from CY3PR08CU001.outbound.protection.outlook.com (mail-cy3pr08cu00107.outbound.protection.outlook.com [40.93.6.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 04D83401D3;
	Fri,  6 Mar 2026 02:06:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZpCTbdFdMKiTHSZbQSQN2GbE4p3yW84ZtBxx6mmkR5s3p+Brlz2WPRU6oR7k3/OM13lii0mEvpSPZkMDUUMkMu0IGziGHCTOQXwAhJpVYoLuLvT8PyCEaJAW/deFWbKCqoustG/ejLGEcZ8OBAFt9AOBrxh1ZtGqGJ+kqhr8dXaycF32rq5YSN8NlfmhGTzIoimP2DXOO9VGizxz4kpRktQ6fdHqfMeYK/feYqpVrOHQxKIhSROjto8g06dbbFfHtO1Jb88lNN6AauLG5J2hODUxtaM9Liw7G/nmx71o0xRJMSAmjVJRm3azhJ3ridiRMhXa5e1zLaIimBoTLXkV4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4l+dctCeABEdxpbwL83Xl65QoBx/51078rLgUfHGLE=;
 b=LECFVTK7IB7IrkQXS/6sUwWXQlREtYmJahQW/vC4+fmKyK8F5wynBYkcXJ+LK94bER5Y7ezNwRA7omhymnWeLXzkawoQrVYC2o0A6p6f1Ng3kgJL7iGajUOS3uPmlzieMLm/gNz+lrAhU5/tobzvresN7eQN18BXRBjXPF8KoBPDU2r4FfEZQ3bNDBUPSTCPiikHp/LJBwjh1nFa3tKrUBZIIItJTqHcD+ohNXU4ByzgNcVWrroPbQ5sqnqiI35iWMNYUc63useiE0z2H2qtkRE5Y/oiid/3trw91vKNVoeZ9htEKEZDJGjoMLG2x/oSFxdaC2YqDzNnWUPTuUSo/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4l+dctCeABEdxpbwL83Xl65QoBx/51078rLgUfHGLE=;
 b=XYZZ3pnwfBc7hhx875ewx8agSc7FoyoiWVm57w4AmprWs4Fj12RPt5J55oUdPpvUrYz4cFl17lk8HtqO8JIBxAdWFlomI3D+ja5EU99bBHfA8Sc0MyyLtFVdDm3nFPTU/kcYc5kmJFWh+kB4mej0oxkp8CFn08pTQQ/xpvg4zJs=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ2PR12MB8805.namprd12.prod.outlook.com (2603:10b6:a03:4d0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 02:06:24 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 02:06:24 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Ravineet Singh <ravineet.a.singh@est.tech>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jura@vukad.in" <jura@vukad.in>,
        "malin.jonsson@est.tech" <malin.jonsson@est.tech>
Subject: Re: [PATCH] usb: dwc3: gadget: Inform system of suspended state
Thread-Topic: [PATCH] usb: dwc3: gadget: Inform system of suspended state
Thread-Index: AQHcrITXq3zDzm/ek0SIJMz2SpfVYrWgwp2A
Date: Fri, 6 Mar 2026 02:06:24 +0000
Message-ID: <20260306020621.4o52wfl2ej4dxvdg@synopsys.com>
References:
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.c5f44c79-75b2-43c1-a791-806fe8b693cd@emailsignatures365.codetwo.com>
 <20240603131304.233403-1-mike.looijmans@topic.nl>
 <20240604010256.4dxamwvcjxug6xfb@synopsys.com>
 <0fceefc4-2b3c-41a4-a6ac-d0b6dbacc1f7@topic.nl>
 <20240604230624.dk3pssivd7g3qb7p@synopsys.com>
 <23bf65a8-b3b2-459e-bee7-ca7c4e4993de@topic.nl>
 <20240606002909.f6a7fwfh7ccb6pxq@synopsys.com>
 <2j6o5atwkm5wl25adcusadiadme7gqpx4vqmscl42wnxgjyh7b@b5om47iesajo>
In-Reply-To: <2j6o5atwkm5wl25adcusadiadme7gqpx4vqmscl42wnxgjyh7b@b5om47iesajo>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ2PR12MB8805:EE_
x-ms-office365-filtering-correlation-id: 5ba7986d-4100-44cc-cf6e-08de7b24f7e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 JVIgnk+Y/lm6I+DoB4zJ2gnMMJH1JiycAykSS+vQJpxXDry8XQmuHlmRZPPmBjx6qRTYcbZ4k1rKzIW1VS0fKetK6r96VzcXGiU1OKVFyZtTze4vhtcsrTLdVk3CNfGN4w2fqUyXT9XmKslspwkCTy5oOIEviZBAU04XlG2H3SIqlXNNPDMFfYExMnzwHDxFbWyKUI7bLJ0aED+I3J0cfa9+z9U/dDIkoTp25aIu/fEPfCtY9t9/9oTw+yGht6PrEqiaxyEn1fSGmIoe5pcCkplK1wAApH+MKIG2hm1OyZSrDF6Q5vgSqalk9tqcq3ZRa3h1lJtQ3+eGG+nmRdrHWW4k1XRS1ao/aP7TXYq40F8QuZi8DgvfOu6C9XLUviP2tt9Qcb7/8WtYDsyPLzmp9BbndSq8vUjo2pqmVpGcZEKVW+oawN6XGAmxcDpnYROcu2A4WrG6/bRsgOgghsjFrEgIeFl+J6dG5AnBMUyMzoi+5ixjVRPdo5mALsPKY+wH0xMBvOFrWtCvz/xPIYBD+hPWnkfytEYLCjrjs5KyMv2+lpM6XoRHkuFhxobCmfTVK/f5WRzw699ISNdBUm8EDqK0iiiFuACiDXeEGxHEjRs1Kl63l/VvPYQlqV93FCyDtTRoZdJHlRuLkYkwy/61w49ElimyUO4RYTZZ7eK/ACuykmTEh/ijqyTpeZC7Cqkz9ibx1NeeVSJvzOtw5+lLNtR6IxZRPgA56j6So1Mme1q/XAGQiR1fyo6fao/lckgGg3NAE06cPxchDqhcqrJEo8gxagcmCimzLyj9k9BeTyo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y21LN2Z5SFFrQnBDNFBmdVZwTG0rOEFxcUFIeFk4YU1qSVQ0YlJKRnhWUHB0?=
 =?utf-8?B?OWRXL2hTZkNENW1sVDk5bWZlMVpQbFBleHlJdFBJUVljdGdkejFaZDNjdnZz?=
 =?utf-8?B?TzluQm5oKzRETzIyK3RNcGlKT3BiN05GZnB2K3RmSWFCMFl2UlZwVStiQTRJ?=
 =?utf-8?B?bHNJek9vcWt0ajU0OHc5dEs4eWZ2V3ZIZGlyQndoZ1NabkJ1UkY1WkNlNk9T?=
 =?utf-8?B?TEJnNmxsRW1HaUlHUXM2NUdXNy9Fa2Qyd3NHcUtDRU9jUmUxVENMbUtPTGpk?=
 =?utf-8?B?SStxcmNXTHNKRmRUMnB5Z2pYZ05qdXd1QUQzMldlOGhmRk50bjd6ZXpZMXhs?=
 =?utf-8?B?cWlGWUYzSWF0c2djbVJpOUVUUE1RNXdVVS9IYXNlUEhqL3JNQ3BlOHBoMmhZ?=
 =?utf-8?B?NC9CM2tobzk0T2dRR3hqd0hmRlRKbzIwMGhwVEZjeE52QlNqbzczaHhONWlR?=
 =?utf-8?B?aDZlQWJXZ3BtR1hEd2NkcVRTak12QXoyM3RGd3pCRGxvUjNOMWR0QmxGVDBv?=
 =?utf-8?B?ckhmOGI5Z0syNVU4L3gwY2U2QVQ0bVYxaHpNTmFmcEYvYjU3SlNLUFR4R055?=
 =?utf-8?B?Ui9uMi9nZTV0VlVkOGt5aXRTeWNLY0xQaUNXazkxYXFvaUxqRUFGaUJFUzRR?=
 =?utf-8?B?UVVyZHlSV0xXaEhoWHhDTHE4dE9uc0RBa3FvQ09WSm0wRkd1MHhad3YyZHZy?=
 =?utf-8?B?STdGam5xS1FXbHdPU1d4WWM4eWt2TXdKSjR1N0o2cHhaWU0zWklBaG8vL0pT?=
 =?utf-8?B?WjE4VHFGRkwxQkJDQklhRGxBcHVFcjFENlFCTy9RRWJvNkgxRHFmQmhQYnp2?=
 =?utf-8?B?WnJvbVQrK0pqTEZsR05DMWdGNDBkMENVR0lxNzB0WkR5ajVobU5HRVNlbU44?=
 =?utf-8?B?K1hlbjBwVnlnc3YrK3JxY0FoVEQ3T0VIWDN5aFptTERSL01zRFBSVC9kOFRB?=
 =?utf-8?B?R29nQ0pNQTJWRkptYVVhNVFaRHBuY0trZWpyVXoyOEo2d25tOTJwT2VHQVY2?=
 =?utf-8?B?ZElWaHhEay80QXNSUElBMEVnWFJoN2lGRWdaZlNJK2FjTUdoeDlmRWpTczBE?=
 =?utf-8?B?WUJjQ2ZtbHkzMTg0RTRzNkZGTmNvZ2N0STFJTFRTb3FDL2k1WXBMRjhrZHFm?=
 =?utf-8?B?MUZWWHhXN3duZmlmTFhjZDZFa2N3V2VTQTdhelZUTWwxbDNTMWNrNldQeTc0?=
 =?utf-8?B?L1FTQWdFekdPZmtJNENFUE5vRFFoRXZuektkK0s2U1VqcW81YlgxQ2FEcEFQ?=
 =?utf-8?B?YjU5aEt5WXo4MGZUQlc0TUNDRFRGWHZ0U2tCK2hiQWRWdWJCVlM0V1hnaG5w?=
 =?utf-8?B?SWZzWmlVc0c5clBGUzFiMzNMZUxGNWp2M0Q2S3l2TE9TUklHOHFURzE4V3U0?=
 =?utf-8?B?WFlIa2k0K3ZMUW9RbkpQT3JpYkdWdEJJaVA1N3dCbGk1T2lOcGFIWnA2ZWxn?=
 =?utf-8?B?VVNhL0pGQ01UaHlsUndjZ0FQV2NYUXhvSGlSZnNNL0VlVS8vbkhxTG85MDJv?=
 =?utf-8?B?eE1SUVFjK0pmczdhZEdvMXIvaDNGWCtlWkVLQ05PbUxBK0pGcEwwWlpxamFT?=
 =?utf-8?B?MEtSVmdka1hxMUFJQnFKMGtaRksxRjZ4NFpUcU9YMHo3RHRISnd5VmZqM1VH?=
 =?utf-8?B?ajdBQTNqRmE3MG5ZL0lhT2VyR2V3TlNyZGpBNWl0VkQ1YjZRNXNITmwvU3BP?=
 =?utf-8?B?R0ovSzBWRVV2S3R2VVdWUTg3ak52M2UzeDhVVG81QjhBcW5EbU9RNU5heUVP?=
 =?utf-8?B?Q3JZL2tMOEI5d1A0YmcwN0RvKzUvL1d3dXVKdkhkUitrQWVVQVhVblhmeDFE?=
 =?utf-8?B?YnpveVZ2WXptMVpxcnRuTlM1aWlWalIzU21vdjI1SHRXampSbUFvNGFncUJP?=
 =?utf-8?B?MU9UMWp4V0RHVGdEUktLcHRQRzB4SkdXMEZiWUFwRnc1OGRMZGp1QVB1Rysy?=
 =?utf-8?B?UmtweUUwM3ZIdFB0THBqYVM5ak1PQ3hHVHdVQWJoZURaUlNORC9qSnQ5WWw2?=
 =?utf-8?B?QmVaR1NVUUFwQ0tBZ1ROczkrYXB4c2FFaG5VRkcrRUdmRjdSTFZuTjdHTXdJ?=
 =?utf-8?B?MkIxOFk0am40YW53dlNpdnpLb2JZd2t5VnBmMitoMzQ5MldLTzVaMDlIdWlO?=
 =?utf-8?B?MEt0bzlDbE4zTTRZY2dWaURmLzJhNmVTRDl4cmZvV0VnOHlzRXVkakJzNTlr?=
 =?utf-8?B?alNBdnJ2RXhEcWMrNzZUZWFZQmI2UWE2YmFXRkFCM3EvOGZ2bkFmOFFld1FB?=
 =?utf-8?B?NFdoWEtHOVY1VlVPaTVXeStXMFFLMGVxSE5Gb2dpQ2EreGdXakowOWlCb0Yx?=
 =?utf-8?B?YW5BQUdvMzZlaTFDakRvTzRZNmpMQnRva3hoOU0xWWtBcjdtd0M5Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF42D04DB9F3734A95DB85ED16323E3A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kUq7VQ6qQdeUlf38kI8fCVG7vxl5OKqwOGEkyN1aBkLpkQkGoCXmJRQvWXtetDolEv98jvNR50UH5vDW9pjC3txaOAQWpQ4MHEHH0WSDtSUHBtVfCikEIVd5GlS7Luc/XI75v0LpxLTRzohcWhUzBAKbeErhTiZ3DuEc0MloZxECti3ketPLp8hvucLWlaU3tTVsbRSWZplKRHnK2ZTiVYQa5u4jWnQDV5fApc5FMMX//G3HY+XYSaRGgGUNPWgwCIMEzDSVKYhtPTz05vPpDdA8KTifrJAhSyblD+XVQQ16mRMtQRutqhrqhrIr2iUYIDLJIBBn1WlJpVo+NDUKEsPADjxjpjGELekJInngoP1Cdo5yPBO6pQHK6t8+EvOT0diA7w83etCS5udCG2x7ySu1e5lQfEff6JwZLitwk1RIWUpdRWfsf6EcK0xr0YWlPeU91vNkDpvFDmR3dRkwmJZ4En41C4I51AK38VjRbdHxR6ie0nDw1jKvk732akqM3eA+px6tsaWwKg+I0Oa07+SryHFo8gThu26RZsFC57f5l/EFE87WKhFArAhY0xeXthqQ80PdTAMHCZi2L4FCS5Dw7OrgLlx+0oyLdDnTZrTyV0B7oQMog/UuE0QFycpLKwNoiFKaTOCLBQPT9suwOA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba7986d-4100-44cc-cf6e-08de7b24f7e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2026 02:06:24.1146
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zZ+OzklrFKgRzYz3+RBWmlUmZOUjOBOVoBNu9oot/y0sPS+MEC1P/NeO8WYGhzrYTgyMQ0Cp0ulGqu5l7ln4NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8805
X-Proofpoint-ORIG-GUID: keJZsoEpTtLC_4HJ9Xt-vEVz0rF9MVmW
X-Proofpoint-GUID: keJZsoEpTtLC_4HJ9Xt-vEVz0rF9MVmW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDAxNyBTYWx0ZWRfX4RHCOt5764Hn
 qC1VGObM8ciFxQ4ktv5U+hpeg1C1EGxhehvSGnYBLq22DOatWF8SnEa/HqzrkDXQPjvGZoWn6uA
 QFtx4cZfmbds0n0a1uRu58W9si0fjGewi/j8mcl5SrWUDs7x/YwIKwMYmKgHRRXivvn1Yu9ZSj8
 BAWpgDEh3Rvva0i4772U4tC8wzy8k7J3B32QIdiKiLLEyqU/SoQWxOiVS3hy/knjiz2wX6THUko
 0yx5zSerbZ3VK+r6HPWI+ewaxXu+hDE25FzbEspyqKa9dvzRq/xXKiOQKxKCSvCNNMYn/6G5f3N
 9iAfEN9Gsk6ZVtckpUkFmPRfWQgq6UNkqpA68/+iT5qmkYIYeSLefaySENG0mgDHTbgUMaAGewy
 YSa9+8rjQA7bUNky05eQ9XPGG/KAOjXOjCmB6tvyJkdQeL3JAEMaw2lE7+nEfFdwsHnuETmNNyk
 wbTLv4D2dW/S9xVaE9g==
X-Authority-Analysis: v=2.4 cv=F8dat6hN c=1 sm=1 tr=0 ts=69aa36a6 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=BYyWIJwf7quEGHPRYNMA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 spamscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2603060017
X-Rspamd-Queue-Id: 1946721A781
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34133-lists,linux-usb=lfdr.de];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

T24gVGh1LCBNYXIgMDUsIDIwMjYsIFJhdmluZWV0IFNpbmdoIHdyb3RlOg0KPiBIaS4NCj4gDQo+
IFNvcnJ5IHRvIHJlc3VycmVjdCB0aGlzIG9sZCB0aHJlYWQgYnV0IGFzIGZhciBhcyBJIGNhbiBz
ZWUsDQo+IHRoaXMgaXNzdWUgd2FzIGRyb3BwZWQuDQo+IEFzIHdlIGhhdmUgdGhlIHNhbWUgaXNz
dWUsIG5vdCByZWNlaXZpbmcgYSBkaXNjb25uZWN0IHdoZW4gY2FibGUgaXMgZGlzY29ubmVjdGVk
LA0KPiB3ZSBhbHRlcmVkIHRoZSBwYXRjaCBhbmQgdGhpcyB2ZXJzaW9uIHdvcmtzIGZvciB1cy4N
Cj4gDQo+IEFueSB0aG91Z2h0IG9uIHRoZSBwYXRjaD8NCj4gDQo+IFJlZ2FyZHMNCj4gL1Jhdmlu
ZWV0DQo+IA0KPiANCg0KUGxlYXNlIGF2b2lkIHNlbmRpbmcgcGF0Y2hlcyBhcyBhdHRhY2htZW50
IHNvIHdlIGNhbiBrZWVwIHRyYWNrIG9mIHRoZQ0KY29udGV4dC4gWW91IGNhbiBzZW5kIGFzIFJG
QyBwYXRjaCBhbmQgcmVmZXJlbmNlIGJhY2sgdG8gdGhpcyBkaXNjdXNzaW9uLg0KDQpSZWdhcmRp
bmcgdGhlIHBhdGNoLCBubyBpdCdzIG5vdCByaWdodC4gWW91J3JlIGNvbXBhcmluZyB0aGUNCnVz
Yl9kZXZpY2Vfc3BlZWQgZW51bSB2YWx1ZSB0byB0aGUgRFNUUyByZWdpc3RlciB2YWx1ZS4NCg0K
Q2FuIHlvdSBzaGFyZSB0aGUgcmVnZHVtcCBhZnRlciBkaXNjb25uZWN0aW9uPw0KDQpCUiwNClRo
aW5o

