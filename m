Return-Path: <linux-usb+bounces-32093-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5F7D06C36
	for <lists+linux-usb@lfdr.de>; Fri, 09 Jan 2026 02:43:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 040423012A79
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jan 2026 01:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809E5235BE2;
	Fri,  9 Jan 2026 01:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KsgRhKkZ";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lrXWjc1M";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SKIiA22d"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE0A2836E
	for <linux-usb@vger.kernel.org>; Fri,  9 Jan 2026 01:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767922996; cv=fail; b=ZdEYuQwcgRcXJU9YffQNsXdz1bl9UM3Lh3fMX5iSJVSokwGzcBJ0rDxNFb9CLs8PoAHgd9oH8fBVV0300wKhm6GtK47vlm9zz3vnZrImpDjYsZ5VPonu5AlOjG7S5hEg4+mOour4ZGqIw7+GFkyqTAy6x+7Y5y+2VDh8Xy7enrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767922996; c=relaxed/simple;
	bh=6m6XWA3g3T3Vga4Xk64fijxCdQAl7agAgZUGDaGM+sE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iCLMbta5cXDYpsgSJv1wkJXGx0XNMfJpC6QFm5mGNuLfl5MyGfP7KSr03btatZ2tkTlF4OzDhnjRIrLC/Pf1OB5cmR4nlmpCSm1DqlijQqHrXkFCOODjHdXQ8vRQi/x0n9sLxB1ZuHsKAeXwCjkbVoMtt4OmcjvOou9fddPfodg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=KsgRhKkZ; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=lrXWjc1M; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=SKIiA22d reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608MiU5i2336225;
	Thu, 8 Jan 2026 17:42:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=6m6XWA3g3T3Vga4Xk64fijxCdQAl7agAgZUGDaGM+sE=; b=
	KsgRhKkZevUpxKNSB8jy+yWj5BplGXRWHhEb1NflrIbdAlNaFdbSEN9TQFN7xlIs
	7tvSgX35Y62s5URDkrTitAoKJvpggYVjhHR6xQJrl0tPB5Jx8LeDSaup4ZjbM2pY
	i35mUubhTlrR1cYS/vkC2t98IvwyibUR6QjPC/BKqfC0FVZGd5V3EI5qVuXw/kGH
	/qm22J+Ve1ZNPMsVDerC6zO+3v/K3HLBXwSuycHJtcdFApcdshCHu2Zj1IEZYm/i
	yNsssyTqopek6tEyLKUyGsmZaG3r0+FqKlrampEcMg3r+9soBwWtzng4pKMtASIP
	qm64x2ZjV21A/7GIGWraJQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4bjng093a5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 17:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1767922975; bh=6m6XWA3g3T3Vga4Xk64fijxCdQAl7agAgZUGDaGM+sE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=lrXWjc1MI1n0DfeYgRvX+aEvf61rNJ3hU3bFoa6xciLxJnrV9YkDKTHzxDyH2OekE
	 aivEM/yKJCRfeu1w3IHpWbjkDpNR7g+cVNXbrueoHu/aGb30ur/IEXJP6gCOhpZN9y
	 Q5elHXlUJM+oEIKhnWNGoOOoNyzhrVK9w680fXyMKepHd5UgtUEO38wWzpm9UpySps
	 Z7WPEzV/XiqcjuXkYO1DvGCz4WVKv3Y6E11N8TedfGCcYRnfpYYur97A3HswN11xz5
	 /+x/d+FPc5RD8J4K+yT7J0BeCXDIWtjox8OezQdkRkbrecw/3kVhYyg3UJjcsSRaID
	 +2er2Eh28ejjw==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A9B1E402B2;
	Fri,  9 Jan 2026 01:42:54 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 82071A006D;
	Fri,  9 Jan 2026 01:42:54 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=SKIiA22d;
	dkim-atps=neutral
Received: from BN1PR07CU003.outbound.protection.outlook.com (mail-bn1pr07cu00301.outbound.protection.outlook.com [40.93.12.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C7D7640572;
	Fri,  9 Jan 2026 01:42:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPR7M+NbAsfYEwflWm8BgPtD7oIGQIGsEMhWzSjImJfz+3JGuGfTPZAtoxzWQ4tVdnP82zfd7RT0OqT+2OGK55NyhrKwqO/YEBbjTZic3CEL13RtmLCFjG9gO5XLxc9LOmNQygZc4q3T+0tRPBObq2kMDocz6P3m3OEbbBmoqREPDnd/QXpYwg2zCruNVhh5/U3eqsvIOL3yqykcZz67JOILfcp2k6/1svF5Wvl1+ROyx+mlp+lyISAmVa/JqLD9LILiepKvbiDzzMWf3nirR+oWHvbtXMpw/RjVbt31w/zRaGNXLe8jVxIdp0wsF37nMFFhXgHevgODlvYfAq7M3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6m6XWA3g3T3Vga4Xk64fijxCdQAl7agAgZUGDaGM+sE=;
 b=atK9LkhJbtsHdjpfY3LOc0e7pHcJdugyhB2EexJpybaCyyjYNFF6n0DVUHWOW4Eej3OF6LFJX1PAUsRTAz3AYTAkId87MbOmPMyuVbl2dz6dqo2khnxGBotG1AfV87H7IbcoNB2Y9Sk2fOlwTvMr9qfMJYqfaySCVNkUN51u3BdWqe67iIPsrRU+8WIDAfqbENnhN2zgr/3Gfe3z5csmgnkyQ+qRdB1LxbkpkUtORLBIZhGUExbteh0JhhaveEc9sD5iiWhQaNdoGqvVnv3x3PI39ZXA4j3ZoOyphnvFTZFTvML2atQ+kgcMwe5/BrKntVmhTjygFnm5uWMXMZkMbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6m6XWA3g3T3Vga4Xk64fijxCdQAl7agAgZUGDaGM+sE=;
 b=SKIiA22dWs5dUnO56SZD2/yb0VL4XnVvRzmB+mmwMMC+YY4YngOvEVMLNKQp9rNrl+zGcCxVpZIRz1yNNlfJLiYF3btnTaB7VDz0oLJ9DbEDsJrhV3SHKFGrggkxbTCKlAp4Sodbh2eiSa76TlqIloLWK6ZJVbx3LvxupUXF3pA=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ0PR12MB5676.namprd12.prod.outlook.com (2603:10b6:a03:42e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 01:42:48 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 01:42:48 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Udipto Goswami <udipto.goswami@oss.qualcomm.com>
CC: Alan Stern <stern@rowland.harvard.edu>,
        Frederic Weisbecker
	<frederic@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [RFC PATCH] usb: gadget: uvc: Prevent smmu fault in unstopped
 stream uvc teardown
Thread-Topic: [RFC PATCH] usb: gadget: uvc: Prevent smmu fault in unstopped
 stream uvc teardown
Thread-Index: AQHcfgE6RFsizj2hpUKn1mnnjoWcDrVDu2UAgAE7JYCAAGdegIAAxYwAgALzBgA=
Date: Fri, 9 Jan 2026 01:42:48 +0000
Message-ID: <20260109014242.cmbdat6fvutl2uxk@synopsys.com>
References: <20260105050724.2041581-1-udipto.goswami@oss.qualcomm.com>
 <9101e538-022a-4802-8bec-891c14b221a9@rowland.harvard.edu>
 <CAMTwNXAECok2-4yO8sPtNgGE6u+qLALRSUnsbOfC7XfGKTJn0w@mail.gmail.com>
 <a9281a6c-0315-4657-b14c-ab68fc85fc40@rowland.harvard.edu>
 <CAMTwNXAY5UEm6FEF=xD2m2s9PBOiLE-Btgii-L3kqiuiKbj2Tg@mail.gmail.com>
In-Reply-To:
 <CAMTwNXAY5UEm6FEF=xD2m2s9PBOiLE-Btgii-L3kqiuiKbj2Tg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ0PR12MB5676:EE_
x-ms-office365-filtering-correlation-id: f76d82c2-cc17-410b-6778-08de4f2064f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ejlYZWdsOXhrbVF0Y2UvbVBHMkxEa3FFWmZTckFnL0lud0RqbHhTYlNmdEoy?=
 =?utf-8?B?OG55NWZkem1WUkt2ckEzYnBwMHlueW5yQlJ3VUR6R3FCNXhsY1N4RmZsQVVw?=
 =?utf-8?B?Zkt2bTA0UEJueG40Zk9MamFxUE5NT3Z3SnZGbzNLTE1pQ2VWS2xXcm5rdmxX?=
 =?utf-8?B?RzRuWjY3K3BKeXhmUEZyR3dWcHlCUFMvVXBXRmRpSy9aZ2FXVnlqdDZVZWpu?=
 =?utf-8?B?NHRkMXRxUGlrWnVJMXBJVVJiQnFVQkxPeVU4MUU1SFJ5N2JsYW5Bbmd3Z3FO?=
 =?utf-8?B?cDBJblR3WmZJeUJ1THU5QU9lY0h4d3NFZ2RxNjhOS2Z1ZlVWV0U4VmQ4djBo?=
 =?utf-8?B?ZS83K1VnNzBmd0Y3OFdhS012b2hxejNyTlFiMFhQVGRSSXFjOFdiSUVSR0tP?=
 =?utf-8?B?cHpCbllWUG8yWW9kUWVXZ2E5dEJueHhOeTFrK0tqL05IN1oxbW4zNk45eDU4?=
 =?utf-8?B?MU8rdkRBMFRGQjlpcWl1MkhWc0dqUTUzZ2FLUi82WnR0OHplWTV3YnNmVFdu?=
 =?utf-8?B?RWdWMjBUSnFxT09KU3J2ZzBPRSsyRndGMGt4ZGxockREUXIvK0p2ek9JVmRY?=
 =?utf-8?B?UmxIZ0Z1cFRqbjM3RzJadUJQY2dWY0g1RFpwa3NGMExJb2tFbDh4NDRJdy96?=
 =?utf-8?B?cnIxak44OW5XZzhob3dvL2RDS2JNM1JiQWlrZEt5U1N2WERkSmd3MTdrMDZo?=
 =?utf-8?B?b003VEdtNS9XOWpPa2hvTXRBNXR4OW9EdEFNRm1tN2t2VzBRSWxCT00xenl1?=
 =?utf-8?B?M1lrRTZ5MzJLUW1nb284RmFHSlY2MDBuYlB1R2NnTWNYRWY0cVdBWEl1b20r?=
 =?utf-8?B?L2NhSTAvU29ibVdXWFVqVFBZMjJFbFkrQ2thbTVJWGQwS2hwUjJvWHMyVEdV?=
 =?utf-8?B?OGNxVU1aZEJZcmJ5QS9GbnBPdkxqb3dpMDhNSWpnV1lRd29KcHpidGZEL1N4?=
 =?utf-8?B?WVdxejNoRDM4d2w4eXA1NC9NaVlhT2Frc3YyMG44TGN0WGhUR01TVHRnZkN5?=
 =?utf-8?B?OFVPUjJRRFdXOUdpQ0pTY2hWSVM4eCsrMitPUUJneFJTY3BGV0dOWGxWN1Iy?=
 =?utf-8?B?U0RjQTVuSE4wS0syRWN4ZmpvQnJTc1YybEgyRVVkVGtPZkZwZFF2UkFxTi8w?=
 =?utf-8?B?L0l5OXUrSFNiamwxbjJiUExRa0JCOTREZ214eXJKSVZZdVF1SnFlYUxqL1Vn?=
 =?utf-8?B?STY3bzh5b0NEWHh0NU5aRC9yNERUQnFWZCs5YURkL1hvUkJPY3VaTmpjaitF?=
 =?utf-8?B?T3BycXNtK3Jiem9HdmtuMEZhR0U1RkZQaitxa09tajMvZ1RZRktWdlA5c1Zh?=
 =?utf-8?B?ZE90UEFPSmNZTTJCc1JIOGhDR3FKRkYveENvdGU2aEtwQllvMzJ6anlFRGpR?=
 =?utf-8?B?cWVQeVVZdlY3SnRrRTNTMGduSXhNV2hRZm1ET2pDRkRESUd2dWVLR2F2TEQ2?=
 =?utf-8?B?WkZyWlZtVEJhbXVBVDZKTjF2SzJWSUFxWjdXQ3FjNWp2Y0NVOUE2WHkwMlpr?=
 =?utf-8?B?eHVsOFlWL0JpTDEvWWZXejY0NHpuS241T0FYS2pyc0JwVTRPSUJyY3dsd1Ux?=
 =?utf-8?B?Y0orUHl2d2tvVzhSM0lpc1N2WHUrS05rNk4wR2lFbDljYWduTk8wVTluWisr?=
 =?utf-8?B?S1dIbm1tSkZxaUV1V1IwUVllTEtCNmJFS0Z6WDBQRzFuZmtBYUFFaXhTdmcz?=
 =?utf-8?B?eENhbU8vOEFLVG14bTl4K0JQRmtYeTVKcDhnT2phNmh2MW52RkRmWGgwZ3Vx?=
 =?utf-8?B?WkM3aFpvNDlrRnJ3RlhlY095RDBaZHVmejVDR0doTUU5RWk2TkxMY3g4Rzl5?=
 =?utf-8?B?VE5nZDN1M1hZL0pHd1RWS0RHdzlQMGsyMXZncXpZMWxWaGZWdWlMZlRKM1RL?=
 =?utf-8?B?ZEJHN1JQUDlPM2dsZE9iZUJQbUdGb3RDWGlKWlViMGRTMFRZbFhMeE9ySEVx?=
 =?utf-8?B?THNpQWs3WmYzV1hRemU3bDlyemNVSWFsVXdwUUJnNGRmNWdHQVdQcnkwaXp3?=
 =?utf-8?B?RVBVTWl5OHJRUUQwUHBjWWRWM2FIUi9tOURreFFJTzcweU1Dd05aNGtOeXNL?=
 =?utf-8?Q?b4UDWe?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RXRnWW1GQUdyQitLRHg3VElpVGxQazNBcEg2ZzNrSDRiL3NaZUtudEIzazM2?=
 =?utf-8?B?WEg0aWwrbmJjaGM4Q3dLempjdnlUOUxseE83MnVXdWtGYVRvY0gwbkRRSjQr?=
 =?utf-8?B?TlV0WHNWMSs1ckhKVnZkUm1hMVFqcW0xdmhNeXp3ZW81Kzd4QUMwV0lQSm5q?=
 =?utf-8?B?SlA5NVgzRTVQck9EcWN4eTkwN05jY0N6RngzaVVyZ3Blb1FhWDVlSkVqV3Zq?=
 =?utf-8?B?RGFWTjdhTEZYQURHcDJEbUN3UXBXR1NmQWptV3BEbGFHMmVKZ3N1dUd5WitW?=
 =?utf-8?B?Vy9nMjdBcXBsSnBzUmdNaEFzQ0gwd09QV1dUbVl2eVBaNGY1eGhhVG9DeUtR?=
 =?utf-8?B?aGxINzlGSGFmYmhEdk5XL2lzdlpaanA4bzhwSXU3bG5qSjVQWkQwcURUa2RR?=
 =?utf-8?B?N2ZDcjVtUnIwdzRLSCtzZUUzdGNQTWlMZG9wZlpJdXBtTWduZXppSVFKUnBF?=
 =?utf-8?B?d0FQWmhqbU1rOGRTZG9NZm5vRy9HRm1SdWFjV2RZSXhZbnE2YURpVlFORG9t?=
 =?utf-8?B?K3FqeGhKMzMwWTRvQW84WEJyV29BSThxbDE1ZURrY1psNXFjMVRyQzd6UTBU?=
 =?utf-8?B?TjZ4dlQyU2pGbktqaGdJQ3ovNkpwcThYQTFUMGQxMzVnUXpyb2poSWJOVUJV?=
 =?utf-8?B?amxFczZ2bExPRHRoV2owak5BVXRrTi9TcHA2YWx5U2xFa1JRN20yVW4rdFRr?=
 =?utf-8?B?cUYraGFpdEttaWdnK3pYa3BZd24yNGJmWVBFNzVQLzI4REljUWRQeTRseDhJ?=
 =?utf-8?B?QlZsYngwakFlUG9jRUVOeXlDelJ6VlI5emVrOTd5aWlCWHp4eTZFd1A2Zjhu?=
 =?utf-8?B?NHcrUHpkR3R5bHdXbnhZMGlCLzByUmZSMUxZVnF2VEpzbW5KMkUvZDF4eDFX?=
 =?utf-8?B?dmRpcnpCWll3Ly8vZm5kUkFpV0IrQTNXa3BsOWlRQ2hsS2Z3VUxRN3VVVk91?=
 =?utf-8?B?OHQ1ZjBESkduNndDdG51OC9KNmFCSDZDVWhjOE5hSWFsMVU5Qmk5UDV6VHdQ?=
 =?utf-8?B?cVhkZklZN1VZYXo3Z25iOXhnWUptblV3cDRmYXVtZ0ZwcHdsQms5UFBJTVkw?=
 =?utf-8?B?WDhMMGlYbE9yQmJQRUJsYWZieDVmYVJLYjlBSXhsQ3Z2NWZZMHNrSjYweG5F?=
 =?utf-8?B?NWdFMWowQjdsam5ZM3JxMG1CeTUxNFJDT1lqWnlLVy9lbS9LaFdxb3JrOURB?=
 =?utf-8?B?Ukx2UGY2TnNEWW51VGhzUG5EVitZbHJTUTFkSG9MaFZ3Zmt0L1RhMnN6RHMz?=
 =?utf-8?B?MjZvNVV1MzlwS0huTHdxbHIzUWpHZktQa3Fsclcza2VRSUJQZjZYSE9vUkhC?=
 =?utf-8?B?ZXV0akc5R3F5WW9RSGtTREpHaERXQzZEb0F3d0UwL3FqbGhuOEdUTWI1RTg2?=
 =?utf-8?B?NjlEMnc2MTVUQjl6LzlSUmo2cDNXUituNXhqTzhiNmJ2SjRhWFFwOWRaVUhq?=
 =?utf-8?B?eGtKQ1dhUFFLOStBZ0R4NFRVMCs4VzlzMXM2VVZMZGYvTnJUWVRBZHY4RTJm?=
 =?utf-8?B?RmRsZG9uLzF0anFlTmxmV2h6U0dQRW90VlBrSllBd2tYNmd6ZUgxZE1yOWh0?=
 =?utf-8?B?ZTdwcDVBYnN2K3pOMlpseURnQnlpRmhROGxnZzZnOVhhQkdpZDZCc2ZIQ3pm?=
 =?utf-8?B?N29kcFh4dDRQbWVCYTV4RWM4WUJROFdGVVkxNm03M0QxbHNLV3FFQTNiYnBp?=
 =?utf-8?B?bjFGNnQxV050Unk2cGRNU3NLRmVBbXlFa0dCVVNDZjR2QXNlekhlQjFXTWNk?=
 =?utf-8?B?NTg0aFlTdmtBSkM0NUJKdmYxeDJtTzZ6QXNhT2h4T2ZwcUhyaldmU2RVeUdW?=
 =?utf-8?B?dk9kdmpDNXhzWm51dmtZSDVNcXJaQ2gwMS93WVVlUFVYTFMyZ3dYSGtSeFNO?=
 =?utf-8?B?RlpUSVI0K2txaG51YTBwU0FuQ1VScHdrazVFaWZkWUhyMit5V0NHQ2NHUGJh?=
 =?utf-8?B?Wk5vRlJrOEhZb20yNGEzbGU0R2FpZ0lDc0k5dEFrQWhnbGxINEZ4SGhCWGJB?=
 =?utf-8?B?S2pTenB4dDdVVHF6MFA0ZTQxNXBkVVVXQ2F5YlJNRFN0cllzb1U1bWNUTlE3?=
 =?utf-8?B?cVN3eFRjOW02Q2JSZlhUNnNUNURUWng5ZlVvYXRRamdtd2JzaTgyT215NGJi?=
 =?utf-8?B?YW5NYlNzdi83OFc2RDhKUUpXb05peDQ1eFBua2N3VmczM3ZuZjhPRjBHdElY?=
 =?utf-8?B?MDVyMCsxbnEvZHJqdGVyQTJNMVBJRDdoU3BOSUUzN2c0UzQvZEhnb0ZlY2cz?=
 =?utf-8?B?NzJHWlpBaVlEcDlDb0VNbU0rU0trSUpWNkx0cFRQMThIUWl0c0pkYlRmUzFl?=
 =?utf-8?B?dEF5YklmUG5yMHowVUlrVFJBS25Pd055dlZQZ1lYUlBha2NJUTY0Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E424EE0FD7A3D6438E18B83EF6ACCDA4@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dt7UqY9YGzHmpclZijlq1EIAtmlYA1r/XrY9I7mcl7hKHbQtVNLTE4BZe3cIuQm0WWttPl14as0gqAOrjxsoKm70RtDAP7bENyEoBIbEwraRdVG5zlv6zuX2OoUL+UdnlfDLLRn8DlzUpEZAboi7T5pGEUwXyawVwlh6LcJzNI7AePpMlWITmcBo2dZwuss1NsJRAcP3PjMM9TMN0k74wvmeTtBiwX7GYS6JGcNRMDQsYFEVW6IZ2wUxKzhJVzqGU0VHabrW04SIXsF5XzniNlbJMRsZY4jWMEknt7ycA2CoobreiGQPvdKGOILdiIaZtgxXjWJbwsmG8T1eYurypByjo+TXaQl1XDwB/tmOlT3e8c32Gv9nOa0f8cqUTh1o9krXEFjGvMrBYV3YYE4hfPNdgtvt6sKRsKRTjaD5rKz4scFFp3xqB9pRmo2DJkToD5qxzanBoF+NKMvHHnQfP4VMs9CSxVFI9IKXeM33HT3OCbWNxmNK0guN+iquONSsX2HwKDFagD7gVlfp49X7/nZeLlQH1oJeu9sssZNpn8CHHgGXP/YOz2MFbxN+ezTuPgkoWk72NVBInMg8MNS/z/IiiGKd/wQR+YdNpigFIWT9uxPCXN4vhGrHe9FbrqN0aFyNi9QgoRKGqhcU3KNSkQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f76d82c2-cc17-410b-6778-08de4f2064f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2026 01:42:48.3896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hAg/2w7pY+IsiB1ffek54AxgzCTVSPEW7lvnWonAAv7XNKd7Y6HZ8h+WZaWrGJwSdy1TI4M0ZvnIz+QEsftUWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5676
X-Proofpoint-ORIG-GUID: PlguwZ_tUlwfNBVSLz1mOQ4wSVVIUDkq
X-Authority-Analysis: v=2.4 cv=N7Ek1m9B c=1 sm=1 tr=0 ts=69605d1f cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=jIQo8A4GAAAA:8
 a=h13IOjy4GvuodPFYfC4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAxMiBTYWx0ZWRfXwjQio1TQoPP3
 lab8RCyTHiztY4Yf0pOhwFNFITD022YLMnxKIHfxpt47fP13O1/RdHV2G4bxmo5hKUz4wDjItfY
 oFgnRb71gMvIH/S3P7y4Bhm4jkmHC59T8aqPsziXDTJKl4508uSV5Weswrki2rUZPoKBetCI0BM
 2wtfVBivIFvxEZ97jkF7kpTJ/lEc7St20NhIkGdbW+ZOtwSR30oXjEJNlTGTDk0jvhckFXuEQwO
 ny7+TzJUO6lVIuFYSWPBUEl06RE1L9qVtiRe0vUDEzlsvK3ZxmBCcR/8PHzA+nCZET3q9ONJynx
 /5pDDrfwEncZoGu791ox4P7aHuyGoe47P/uTUIXfDk0Gexrgs6ZrAG3zUItTDJixSbOXcUx5KCY
 KB9i+pbNJIshs+mukCvEKGwg7Jn0M+CsMFZJpzb2mDn2f19XAuCpzoWWiVVVhawAiT1vT7pCLOh
 oKrB/iVab9zJJlK8zOw==
X-Proofpoint-GUID: PlguwZ_tUlwfNBVSLz1mOQ4wSVVIUDkq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 spamscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2512120000 definitions=main-2601090012

T24gV2VkLCBKYW4gMDcsIDIwMjYsIFVkaXB0byBHb3N3YW1pIHdyb3RlOg0KPiBPbiBUdWUsIEph
biA2LCAyMDI2IGF0IDEwOjIz4oCvUE0gQWxhbiBTdGVybiA8c3Rlcm5Acm93bGFuZC5oYXJ2YXJk
LmVkdT4gd3JvdGU6DQo+ID4gUHJvYmFibHkgYSBkaXNjb25uZWN0IGNhdXNlcyB0aGUgdHJhbnNm
ZXIgdG8gYmUgY2FuY2VsbGVkIGltbWVkaWF0ZWx5DQo+ID4gcmF0aGVyIHRoYW4gd2FpdGluZyBh
cm91bmQgZm9yIGl0IHRvIGZpbmlzaCBieSBpdHNlbGYuDQoNCj4gbGV0IG1lIGdldCB0aGVzZSBk
ZXRhaWxzIG9uIHdoYXQgaGFwcGVucyB3aGVuIGNvbXBvc2l0aW9uIHN3aXRjaGVzIGFuZA0KPiBk
aXNjb25uZWN0cy4NCj4gVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbiBhYm92ZSwgbGV0IG1lIHRy
eSB0aGF0IG91dCB3aXRoIHN0cmVhbW9mZi4NCj4gDQo+IFRoYW5rcywNCj4gLVVkaXB0bw0KPiAN
Cg0KVGhpcyBpcyBwcm9iYWJseSByZWxhdGVkIHRvIHRoaXMgY29udmVyc2F0aW9uOg0KDQpodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC11c2IvMjAyNTExMjEwMjIxNTYudmJuaGViNnIyeXRv
djdidEBzeW5vcHN5cy5jb20vDQoNClRoZSBzdW1tYXJ5Og0KdXNiX2VwX2Rpc2FibGUoKSBpcyBk
b2N1bWVudGVkIGFuZCBleHBlY3RlZCB0byBiZSBpbiB1c2VkIGludGVycnVwdA0KY29udGV4dCwg
YW5kIHRoZSBjb21wb3NpdGUgZnJhbWV3b3JrIGFuZCBzb21lIGdhZGdldCBkcml2ZXJzIHRyZWF0
IGl0DQpzby4gVGhlIGR3YzMgZHJpdmVyIGRvZXMgbm90ICJ3YWl0IiBmb3IgdGhlIGVuZHBvaW50
cyB0byBiZSBmbHVzaGVkDQpiZWZvcmUgZ2l2aW5nIGJhY2sgdGhlIHVzYiByZXF1ZXN0cy4NCg0K
VGhlIHByb3BlciBmaXg6DQpDaGFuZ2UgdXNiX2VwX2Rpc2FibGUgZG9jdW1lbnRhdGlvbiBiYWNr
IHRvIGFsbG93IHRvIGJlIHVzZWQgaW4gcHJvY2Vzcw0KY29udGV4dC4gVXBkYXRlIHRoZSBkd2Mz
IHRvIHdhaXQgZm9yIHRoZSBlbmRwb2ludCB0byBiZSBmbHVzaGVkIGJlZm9yZQ0KY29tcGxldGlu
ZyB1c2JfZXBfZGlzYWJsZS4gQXVkaXQgdGhlIGNvbXBvc2l0ZSBmcmFtZXdvcmsgYW5kIGdhZGdl
dA0KZHJpdmVycyB0byBub3QgdXNlIHVzYl9lcF9kaXNhYmxlIGluIGludGVycnVwdCBjb250ZXh0
Lg0KDQpCUiwNClRoaW5o

