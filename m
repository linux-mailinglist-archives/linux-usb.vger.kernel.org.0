Return-Path: <linux-usb+bounces-31935-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C605CF4DDF
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 18:01:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 999DB3007935
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 17:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D3328C849;
	Mon,  5 Jan 2026 17:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NYikN4EO";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="AFNKbU22";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="l2CnK3n3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1E81A5B9D;
	Mon,  5 Jan 2026 17:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767632459; cv=fail; b=OA1zvG9Mf7GMTRB6w8efbj/9bkD7ov4k9WnhEY+HO+LcWekAzt17cptJ1pVcB7PxUZaxfy36RDwksSwth7+sMW8t93XmO2A2d6I5itJ1ArLmWZA5jFaqy91yJ7QBYAssckA86gAVULEWWsZz5KxD3UhdIP9fCls4BljwKxDd/HQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767632459; c=relaxed/simple;
	bh=T8Db9O/7PLpP+cpl1PMKd6sBWmQr6vdFgRN10s0tEtE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oO3v0JsRMf+Cca+in0i5yfHqtkucjwnI1b5csGeFLi5Gyk+J3zV3t+ISVNDa6bp8hwgSOEqy+xO6Jah31UhhlypX91hLD3nzn20OOsZnbQTuoN1v+50pNUfQbOt/cO4UCbSTGH8hN+Xazk/17lklkvzeF7MceYL84A580nAgRRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NYikN4EO; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=AFNKbU22; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=l2CnK3n3 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605Ehlq31310809;
	Mon, 5 Jan 2026 08:12:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=T8Db9O/7PLpP+cpl1PMKd6sBWmQr6vdFgRN10s0tEtE=; b=
	NYikN4EOqrITc4G0RAPyTWR7wwUEonFrET74veATpVP9BeRz4NcQ3VrlWCOG64Sp
	kHBP3z1ANkaSCTFkhw+hQIJcgoDE4GNOnRYfdrkjNNanRpIDIEy+cdPwMe4PZzKN
	Up1WsbEKVwMupwY4o3TIvIWnCu+/NSKDx77mrc5Zi5Go5VjlA1Ppvs2u+nAvBK+o
	1ioVhZRORwYzqb9WzjJf/9lSj91DZhY+vhNQBqlvTv33ov+rOAn/JRl7G/4Mml9H
	8hjqGziAdt5iM1NKzGhY4q3lnuyBmS5HhMvZg3MOJ/fcoHs++0cswO99bEu2FQ0i
	JKvmA095Z3yp1wXhHAPKSg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4bf30qwmvy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Jan 2026 08:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1767629522; bh=T8Db9O/7PLpP+cpl1PMKd6sBWmQr6vdFgRN10s0tEtE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=AFNKbU22xoEgi9Z0pU6u8pPvIoE84WoLIenfMoyhUIe8M+EafQpEcm7c4zWrakqIQ
	 NhigfmN+57apL/heNvMZPNPJZpM/3ge5whe5m+Bp4nylGw/+XtT+pmQBjEvvXEFYci
	 bEJU45HmSRJ2gN7lILEAIKVTR3gbrfTKGIuGDytQQN2rlm1vZboJx5SUKjim1x1Ifn
	 H/GMg3MReyI8PgI4Q2H+AaGbPoZfsQQzoj/qPfYRGOoKnaWX+86FWfEDHak4GWKjEW
	 SgzMU5eE8Cn8myKyY00f5GOpiPxDAWnQot5e9a1Pcd+VtlTNZC3Rk6iEVWnvuprmBV
	 Q30lW8OaccC1Q==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 17D3F40728;
	Mon,  5 Jan 2026 16:12:01 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 4E041A006B;
	Mon,  5 Jan 2026 16:12:01 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=l2CnK3n3;
	dkim-atps=neutral
Received: from BYAPR08CU003.outbound.protection.outlook.com (mail-byapr08cu00305.outbound.protection.outlook.com [40.93.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A3D934056C;
	Mon,  5 Jan 2026 16:12:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofVTtRTH2CUWXf8ayp9Srl9X/ilfxi04k/cSOFpmhl96STz6Ow02IXG+uN5vsgwa74xffY/8YSYkSPym2Yq9hscNU6W2nLrIIUvstzdHcRFcwq3/Ig5tL+zbHZROsIgRzypFyMAEhJESzmbG785eR8GWSAKILsXPZhG//VtmUbTnKIFMan/YTRxKcYiflacVYuFPO1hxSXX7ZOodA3frk1HJOBAlqS08PcyKAlW7yL2dkCAMqpPR1U1ZtQE2D1NS0A2apYgMeDdKlzMnNGSCPqnCcEPc+K07dVOOnzpBwhk5SRI4eKt6i1nLqDyDIz3U+BK/xmP/KEdp+lJB4sL+/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8Db9O/7PLpP+cpl1PMKd6sBWmQr6vdFgRN10s0tEtE=;
 b=bMOr3bn/TlH0FNo+W4C4dC2DBP5LGjhHqNrVsOEe7Uyxv6YI5NWdIgkAfzmha5QCQeinLh5EErHP8q0k+HFzwWfSTpRfDnswlUHRYOZYU8nVBPtz7dJNxIZUsAA4RQpv2pAEdgcneL6rZv/6Pn6JSbtBr8WE9sB8Drv6f00ZSpoTjmqELDBhV9nBmX3ON8pY/4irE3khEddnpXW4EI2VN+zp+R0u7+mrADFPRWCu8sXkIGzuOrommzjy5tav5BaXFjwQPL7HdoBpVCZ9+nrI4cGO2x2KXJoXUxZBCuh3M2F8/AvS0UoA5yfdSyCF9rrN0JcTN+uElqD0e7mPlXTtaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8Db9O/7PLpP+cpl1PMKd6sBWmQr6vdFgRN10s0tEtE=;
 b=l2CnK3n3TfWmGcexza8RqpMH7EKX7UeIab8CUjyFB43BoT7PVhOylOGjC6TETEVk+ow9haXDWPRx576ySD2rRFpIL350xiekjVGUdbWYiwB323NCJpF3fS4SKAQlfFt003OG7SxVItmW4Xln4UVDAJWTHbxB1/e9Ec82jLYYQ9k=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH7PR12MB7234.namprd12.prod.outlook.com (2603:10b6:510:205::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 16:11:50 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 16:11:50 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Prashanth K <prashanth.k@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] Add the DWC3 instance name in traces
Thread-Topic: [PATCH v2 0/3] Add the DWC3 instance name in traces
Thread-Index: AQHcfjoBtXqdJ9szpEOmIm3MfZ3JrrVDhZyAgAA56YA=
Date: Mon, 5 Jan 2026 16:11:50 +0000
Message-ID: <20260105161145.podzns57ekzjg3pj@synopsys.com>
References: <20260105115325.1765176-1-prashanth.k@oss.qualcomm.com>
 <2026010555-squealing-easily-7659@gregkh>
In-Reply-To: <2026010555-squealing-easily-7659@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH7PR12MB7234:EE_
x-ms-office365-filtering-correlation-id: f2b97f7a-5d1b-4f4a-c815-08de4c75226b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?eUxjbXBZNFVDWDBmOFJ0c3h4dlpZN0RJQUdEQmJ4bXQwd2U3TkpmTjlxRVpD?=
 =?utf-8?B?eUFPaVdxdGRMckRrbUhNQ2UvTHh3d3IxWmpjQ1AyQ3Z4OEN3ZjMzc2FFWjM5?=
 =?utf-8?B?N3RnM0ltL3pkL0ZEc1JpZkhOZSs5TjVHOHRNWlV2MTZSWmt4MjlkRmpNQkZn?=
 =?utf-8?B?UjJ5QzYvVVQwMUt6ckZKaEsvMWwycVFRa3dacU0xSXUzU0NyUFlxRDlyb0Vv?=
 =?utf-8?B?ZHFqaXNzWGNPeElWclo5eWhnTkZqUE9QSlBUK1hZUFU5ZXFSR1hYcVJsRzI3?=
 =?utf-8?B?ZW42aGVvUHRLbEQ5ZnJvaSt2YXgxdWNkdTgvY2N2N2dmYko4VDZVTDBzdUJz?=
 =?utf-8?B?Umw2UDhTKy9rU05CVGw5a0hXVDRqNno0d29hTE9jN2hjZk1VNzk4RzAzU2lU?=
 =?utf-8?B?d0hTVndkY0FWK2I4aUw3Wk5UWWdQcXZadVZ0bVFrcUpDM1VNNmp0ZlB2SjBj?=
 =?utf-8?B?VjdsS1Q2MTdXWGVlMVpQR1hLaE5sKzhjNDhaK05ZVzNsa3laenZaY0N1Wllt?=
 =?utf-8?B?VDd2MTRnUFlLd1FGZThWYThOMHRRWDgrVHBUUGpzSkh2TlZBaDZlME5YSGhi?=
 =?utf-8?B?bEdqR0ZrT1lWMHRNcjZ0K051OEViNldHblp3Z0hTbmVOWDl4N0xuYmROWnJH?=
 =?utf-8?B?aXc0VFV3RitJVTVOb1BzUm1EUFRKRGxZU1dkeDE3ckpoU1ptNFV4UWpLRDMy?=
 =?utf-8?B?b2YxYXNYNS9FYzVPVnRoWlBiUFBZZDRoSTlBUzNpbzJWYVlDNWlUVzczTEow?=
 =?utf-8?B?Q0Y3YkNNV1A4Q0U2TUt3WUxnM01Ga0lRTDJQUHJEL004MWsvUmtya0JpbHZB?=
 =?utf-8?B?a1RaMWtSTWhaM1dENnVBdURNY0pnRFhpdC9ldXRFd1owbWdMMHllbG9Pa1o0?=
 =?utf-8?B?S0t6TUVwc0xBZHRsWVQ5UkJqQ0ozd29kOGF0YXBtUGxkU0hFWUFCekJuZlZ0?=
 =?utf-8?B?OTFBdUVqK2xNUnd3U2hUWklpU0E4aFRsSFV1VThGTTNReEFDUUFoQ2pJRzJx?=
 =?utf-8?B?U25UUVZ2N084RlJySnI1VWZRVmVlZGxNVTIydW5Lc2dXd3NMREFCMmNIRHZa?=
 =?utf-8?B?MVRuWE1XUklNUUJNZjQzMEx5NGVZRE5EZnEvN3pzWGg0U0NtQ05DUDZtb0hl?=
 =?utf-8?B?d0t6TkpWZlBxR0hVZ3hZbTB4T2g3OVdMOXEyRTd2NWdaQlpyaUlONDZXeXhE?=
 =?utf-8?B?R3cxajhob2FyTDQ5a3d4TjBxQVh6U2k4T3pNTzRLcTVUbTlzZFRoSFVLRU1Z?=
 =?utf-8?B?Vk90L000c0o4YTJJU2Irc0RHMzRkOXR0MDNZbmpRSHd4UUtYSkJWMzAzVEFL?=
 =?utf-8?B?c05ueHExanRYd0E1RHo2aFQwUWNXbHJnOFV3SUZGclRYTUxqeXFsTzBUSGtz?=
 =?utf-8?B?eXlGb2Izenp1MFFnaFhwajhUODJIVDRTK2p6Q0xhNGpnQkN5UVJrbTFWeWs1?=
 =?utf-8?B?M2s0RnkwcG1rV0Q2dUdCTHBkS0wra25tWUF5dXcxRHBaendJKytjVkZ0NDZH?=
 =?utf-8?B?YnA1NCtTb2ZGUm9qbUdEcEVlU3cyNWlHMmpZQVhUdGhFMkxlbGhnbDF5Ykhs?=
 =?utf-8?B?dWlyYSt3MXNndHptQlVYSmE2NWZaeFN2Z1pyNEh1Q2dma3FSMXA0RGN0RjVU?=
 =?utf-8?B?NFdlUTNldFpBQVY4eDV6STZHcUpxZXpuZVYvWjQ4d0Z5R2J5bkxjekpNcWNw?=
 =?utf-8?B?MTZxdG16dzVRUzhzTDhKeGpVQm1xdjdkWS9sc01DOEdjMmNGQk1uWWt0Wlhs?=
 =?utf-8?B?OXVrVys3b0Y2Sy9FUmdvNkZEdjlvUmtVYktNMTJpZ0FqckxQeEZwUllxUTRo?=
 =?utf-8?B?N2l4OWFWSnk1MHlYTTkzZFZkcXVraVFSZTN5dDhmQlZlRnJjOVFWVCtQeXNC?=
 =?utf-8?B?SE1BLzIxSzRPMmV4MUkvcnJCc1NBQndrSEFZbkFGRENhTjVZcjJEOVRFYWRs?=
 =?utf-8?B?R2VuZXgxNERVSmFCYjBmdGd3RC9qai9NV2hjd0hSWkdnVEEvNHkvVnJVbWlw?=
 =?utf-8?B?NnNzVDlQL2FtRXBuZkN1WHgvQlp2QWZvcGdSRUtLSFZYcC91bVEwVUhjbERJ?=
 =?utf-8?Q?1ARivV?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Tm9XeWJYUThFbW9KY3NqSm5mRXdnQVl4WjFmK08xR2FsWHNjK2hVRFN4T0pQ?=
 =?utf-8?B?THZ6UnlNdHhXVlEvUGZIVmFFWVFYdTUzQmFtR3RSbWFVeGxkM0pzdEMxTDJS?=
 =?utf-8?B?dXNjRGg5NDRmTFVJZTVhVENrUUZCK3VYRnFsWEZRdTZpY3ZjVmc4dHFpUEdw?=
 =?utf-8?B?OHA0dGNLaHVWclcwNFI3czBlNkg4Q2VFM2VnTW9USVpYaW5KUFMwbDZSaUFP?=
 =?utf-8?B?T01Bb21YZ0VQWG02RHByRmJUOGtxeUJQazhxejBDTllzNVRBdzNUblM4aERU?=
 =?utf-8?B?VnkrdDFSZDlrS1I5MXNYS0pFdEo3SGgvNURGU003ZlR5U01yN0FxcExjNWlK?=
 =?utf-8?B?d3U4OHhiNkNXalBWUGpESFZnSHliRWt5eWliVmVTd0RhdFI2clJLZEFDNWE4?=
 =?utf-8?B?dVFIVitMYXVxVEtPODd1TFpjRVd1VEk0SjRLZm1NQng5WWFsaUVsMDZvRDBl?=
 =?utf-8?B?ZUIwbzBlbDhXTXdYTjFUZFpvNzJpbFZiNGNzajFMTkUyaS92WGFsRlFXOWt5?=
 =?utf-8?B?L2lXK0d0Q2htd21uUWNUVmt3RUZKT3hXT1NFYzhZRlJZVFNzTTlQZ3ZKRk9l?=
 =?utf-8?B?S3UyZDYwbWtLcTl6ZzhReURNQmkxSWhxeHlHT2JPR3VKRTFUVVVRZGgrVnhN?=
 =?utf-8?B?b0Q4Sjg0Mm04NVZHVlVKMUVuSURiQ0EyaThGOFAwNzFQOExpV0t0NUNnUDJE?=
 =?utf-8?B?L2ZXT1g3a09TSW1RY1lnZ3o5NG0yQk5taEpGQUdBNFFoRUJraW9GYkZnVjd6?=
 =?utf-8?B?WG9uenEyM1lKVGk4WW1KOTNQTzhUVUFQbkg3cHlldStldkVTakhOcGkxUVZW?=
 =?utf-8?B?WG15WDNXZVZTYU9HQVFNRlBWUWJwQVh4Rk1ncnE2U0VjTE1wVXNvWm5BTXJh?=
 =?utf-8?B?RTNEYUZ1VE15UEdjQXNvMXY2TkFDUlJpSm9Rc1FSa1ROQWtnSjhpQlpIdVBx?=
 =?utf-8?B?eXJMelpFeFgySUhtZE1OZ3d3d2VpeCtXQkozMnhObDNtYU90a3M1SWJzK3Vw?=
 =?utf-8?B?cFJ4S2p0MEc2SnhYcEx1UjUvR0R0UHFnTUhvS1BVVlQ0UGJJcXlCVVBoN2Fw?=
 =?utf-8?B?Ris4eDVsTS9aRVdha3BtR0hwcWVEallwNTBSSkJUQ3JybTltVEJUWWZyZ1F3?=
 =?utf-8?B?dit4aWI1U2wyM2J4YWJGd0xnc3hrMkZ0amlnUW1OUzNJYzNFUmRhRko0MHZU?=
 =?utf-8?B?SmJuTUFwQ3ZxTDZqSEVLMm1FWlNaUWpZaVpVVnd6a1RvckU1WkhiMkI0QnlR?=
 =?utf-8?B?OTVVdDUvRXVlMlpZVkpnUENKSHZUMVVPQzlhVm91dzJLckZ1T0NGWGoxZkl0?=
 =?utf-8?B?Wk9sYkxJRmVnWmpqZWRCY1dDMjNodDljY3d2Wm5EZXh3MVhiOUptaldLOURZ?=
 =?utf-8?B?TFdPVmVBdjR6TEEvSFBDMmpwemZmT3pBTmZQVHJoZ0NEMGlndjU3VDRpMElU?=
 =?utf-8?B?alZuSWNwWTdNZ1pPTHcwSUVUVXpobGRWd3EwdExyMi9IUmw0VHQvUHE0Rys4?=
 =?utf-8?B?L0o1ekpubmxxYWVOSzFGa0dDOVZTNDlIWlhQZDEzbDE3UjVXUmMybGV4aWtq?=
 =?utf-8?B?SlVONEVyay9Bb0xIOEoyM1NCcU5QU2QyZFRNZnZDZmFNaWsvS29VdWordjZn?=
 =?utf-8?B?YnNiYkdCOWxmN2Zrb3MxTzlsV1c1ZUlOS09pdzh6ZVo0dm1yeTJWVld4SWdS?=
 =?utf-8?B?eUNBVlJwSExyRXVuc2hHeU9KUmcrMGhOZWpHNmlZcnhUQnY3bVNSZE90UlJj?=
 =?utf-8?B?WWRPaFJjTXIwNVIvcWcwNisxYkZuai9KbUJ5YjB1NXIzZmtCTnB4Q1hqZ1dv?=
 =?utf-8?B?QXF2OWNsTEptbC9GdVhONzNjd1NxK3hzNkJFMnIxbStnTFRQNWNmK3BaQmtB?=
 =?utf-8?B?aWhnS0pJZTQrMjFSSDZPeUM5ZkhEa3Z6amFrYzEwNDdLVmRHMHlTRXpBcGJn?=
 =?utf-8?B?UnNROUE3UEhEbnI0RElxMUR0MWRNaUhkclVTdzJOVnV2SG8xeHlVSVZoZVk2?=
 =?utf-8?B?b3VFOFdKOWM2T0tTbEtWNGVqMGtEL1dLYVJmUW8zM241RFhWMjlvY1puTEVP?=
 =?utf-8?B?SFVHMWpxUDUwKzA5cGtSV2lrZlhlTlNNWFduZkNGR2JPQ2NoQ1YzdlRLa0Qy?=
 =?utf-8?B?STNpendHVUt0d1ZtdnRkOWN4UFpERHEvY2N6MGh5S0VLa0ZOZlFLdC9FL01u?=
 =?utf-8?B?Y2kxd3Vlb1ZoSTBPRy9ldFBoVkVKdWhsbjlBMUZLSUlESnFTZ25pcVZQSjlM?=
 =?utf-8?B?TEFadVY4eTRkdnRQUGpiNlJBcFFwN3pmNXpaV1Y0NU5Yb2lNcnlQbXZDdjhV?=
 =?utf-8?B?QnpUY0Q3QTlGN29WTVF5QVF0d0lKbk01UjNzdTlVNHNGTXV3eVptQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9A6995EB7B16E349A31ECD42DBC3EB49@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9rc3eyvEPPl1Nytb33LZjkJUf6Tyh3QFuGuMSNsVO3KgEvGPq6trVKWLbnyS2rpZ7RYmEI6VdUNWqY5+aTv/K8674/uEzqcOnB11gowENwLdeD3tp+c6Gs6veXfxp/IXyiJZxKhQ9KAee9A/QxeGdpuC8tNxppIWsEbD2Jn2tgYI96oViAqLsNtYKDDITIoR3wWhY3T6fhqFIwVjIvAcYL0A9zVlMBLn+faliT+U2Nb2Px70FjL5PdgeJx3yaRDkJ17QzZvfZgbitc56KicEUwca4WNMjMvOmkLiCPR5inTAGCndjeG/5gjy5qtHEsIAV71BdWZ5WafCVJk6JcrUJPCcQzkQpVT+1EHnsQO+sMfTGvWtuVh5ciJnqDM6B8Gywr/YDMNlG/ZdLZTGdPuxOOgzs9jV+k0cq2hcoYxAGvttIROgPOjB910mpDfEncfpdZ84OPUOtBRPvlV0VuxID9tFJ1P44XyYIiLrxSwsRK3gl3AioZ+LtQe77inm5IUfHfg+9dKyVC9j3ISm8XICY83BrmC8S5PZtSTI0mKsGjL2Mjif6RytprctPyewOQBPcApRgUf/WDBqXLu5r/nuZa8Fo1nwJKEGcr1uP5ClfXzzhCXcs4qM9seYW6jRM/iEw6Phre0kllO7vNWCSFVZ5g==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b97f7a-5d1b-4f4a-c815-08de4c75226b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 16:11:50.5128
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oQmvCO7zaENd6UI8mLrsTAjOrXxogZWI5i6C8yms0hvwq1jrJN6EAW42mGy1z53Ag5PrTOyiMNlT7Qq1S+NzmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7234
X-Proofpoint-ORIG-GUID: xt-IEvm7TnaV2jkVpVElh-pIy4MvtIqW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDE0MSBTYWx0ZWRfX2hq3Z5QLOdbE
 J8kHRhhLMDnkPI6RGTDnAZlvHIySaBxIze2T0JJFQwuZMqfl06L44Zyev3Ul66VsDCmasGrELMG
 vN02VcuAxZVZnCX+MUpDv7ahtQZ57/2v0IxA7fR97iIq11Gx96H7K5/7+9Di2oIsgK+lGqKO/2T
 Iz983NB0tOAc6m/Cfn2DTk4VBBsKtn5QYU9z4uhXpA8+SxDXf/G0pKWM5PrsuB4nWSt7rUfbPGg
 aoG5YBvl+REBrdITex8iIz2MmwwsN5NWl21DvlT5I9ccnWD+TJOKQf0YKImTL7t8A+ZhH3OgvQt
 korA2dVWoZUlRNpF7bS7anQcnWqLZpqcm946Hpso7uhfB0OrVEW674OoigMSfSBqZXvWSQY+Okk
 inFmVYm4IkbdR39G6rxeRhq1suijDRoV0hBGF6+XlV9hRrplpvkcwTjTIjTplX51ehRytih3odb
 ZihGPCEHzx/ieOOC2jw==
X-Proofpoint-GUID: xt-IEvm7TnaV2jkVpVElh-pIy4MvtIqW
X-Authority-Analysis: v=2.4 cv=faOgCkQF c=1 sm=1 tr=0 ts=695be2d2 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=5eArMb7tNA6DwVh1L6IA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1011 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2512120000 definitions=main-2601050141

SGkgR3JlZywNCg0KT24gTW9uLCBKYW4gMDUsIDIwMjYsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90
ZToNCj4gT24gTW9uLCBKYW4gMDUsIDIwMjYgYXQgMDU6MjM6MjJQTSArMDUzMCwgUHJhc2hhbnRo
IEsgd3JvdGU6DQo+ID4gV2hlbiBtdWx0aXBsZSBEV0MzIGNvbnRyb2xsZXJzIGFyZSBiZWluZyB1
c2VkLCB0cmFjZSBldmVudHMgZnJvbQ0KPiA+IGRpZmZlcmVudCBpbnN0YW5jZXMgZ2V0IG1peGVk
IHVwIG1ha2luZyBkZWJ1Z2dpbmcgZGlmZmljdWx0IGFzDQo+ID4gdGhlcmUncyBubyB3YXkgdG8g
ZGlzdGluZ3Vpc2ggd2hpY2ggaW5zdGFuY2UgZ2VuZXJhdGVkIHRoZSB0cmFjZS4NCj4gPiANCj4g
PiBIZW5jZSBhcHBlbmQgdGhlIGNvbnRyb2xsZXIgYmFzZSBhZGRyZXNzIGludG8gZnRyYWNlLiBU
aGlzIG5lZWRzDQo+ID4gdGhlIGZvbGxvd2luZyByZXdvcmtzIHdoaWNoIGlzIGFkZHJlc3NlZCB1
c2luZyB0aGlzIHBhdGNoIHNlcmllcy4NCj4gPiANCj4gPiAgIDEuIFJlbW92YWwgb2YgZGVwLT5y
ZWdzIGFuZCB1c2UgZHdjLT5yZWdzIGV2ZXJ5d2hlcmUNCj4gPiAgIDIuIFVzZSBkd2MgcG9pbnRl
ciBpbiBhbGwgZHdjM19yZWFkbC93cml0ZWwoKQ0KPiA+ICAgMy4gQWRkaW5nIHRoZSBiYXNlIGFk
ZHIgaW4gdHJhY2VzLg0KPiA+IA0KPiA+IENoYW5nZXMgaW4gdjI6DQo+ID4gLSBBdm9pZCB1c2lu
ZyBtYWNyb3MgZm9yIGR3YzNfcmVhZGwvd3JpdGVsKCkNCj4gPiAtIFVzZSBiYXNlIGFkZHJlc3Mg
aW50cmFjZXMgaW5zdGVhZCBvZiBkZXYgbmFtZS4NCj4gDQo+IFdhaXQsIHdoeSBjaGFuZ2UgdGhp
cz8gIFRoZSBkZXYgbmFtZSBpcyB3aGF0IHlvdSBzaG91bGQgY2FyZSBhYm91dC4NCj4gImJhc2Ug
YWRkcmVzcyIgZG9lc24ndCBtYWtlIG11Y2ggc2Vuc2UgYXMgdGhpcyBpcyBvbiBhIGxvdCBvZiBk
aWZmZXJlbnQNCj4gYnVzc2VzLCByaWdodD8NCj4gDQoNCkkgYXNrZWQgUHJhc2hhbnRoIHRvIGRv
IHNvLiBUaGUgcmVhc29uIGlzIGJlY2F1c2UgdGhlIGRldmljZSBuYW1lIGlzIG5vdA0KY29uc2lz
dGVudCBhbmQgbm90IG9idmlvdXMgZm9yIGRpZmZlcmVudCBidXNzZXMuIEZvciBleGFtcGxlLCBm
b3IgUENJDQpkZXZpY2VzLCB0aGUgZGV2aWNlIG5hbWUgbWF5IGJlIGluIGEgZm9ybSBvZiAiZHdj
My5OLmF1dG8iLiBJZiB3ZSBvbmx5DQpoYXZlIGFjY2VzcyB0byB0aGUgdHJhY2VzIGFuZCBub3Qg
dGhlIHRlc3Rpbmcgc2V0dXAgKHdoaWNoIG9mdGVuIGlzIHRoZQ0KY2FzZSksIGl0J3MgZGlmZmlj
dWx0IHRvIHRlbGwgd2hpY2ggaXMgd2hpY2guIEFsc28sIHZlcnkgb2Z0ZW4gdGhlDQpjb25zdW1l
ciBvZiB0aGUgdHJhY2VzIGlzIGFsc28gdGhlIGhhcmR3YXJlIHZhbGlkYXRpb24gZW5naW5lZXIs
IGFuZA0KSU1PLCBpdCdzIG1vcmUgdW5kZXJzdGFuZGFibGUgcmVhZGluZyBiYXNlIGFkZHJlc3Mg
dGhhbiBkZXZpY2UgbmFtZS4NCg0KQlIsDQpUaGluaA==

