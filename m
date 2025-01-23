Return-Path: <linux-usb+bounces-19685-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 301E3A1A7E5
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 17:34:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E440B3A3F70
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 16:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70D7212FA3;
	Thu, 23 Jan 2025 16:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="dkgpp0Wu"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2085.outbound.protection.outlook.com [40.107.22.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294CD35950;
	Thu, 23 Jan 2025 16:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737650041; cv=fail; b=Op0T83co1sdQqRC+eZv+a1gTjg0Nxy+J5oEAq9nrvjR/ep7bhei9jMPVLxKoqlvuKTdMm8DG6sunuCXFzfsQ3PoI52JFbEvgPoduJEiaZG9y9gpmtsySuCqiyKP0g3XEVkHWyBlaqWmFp3Cybed1J+Jr6sjaOoBde+h0i9nmsBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737650041; c=relaxed/simple;
	bh=YBLiN3R5B8tRUjg21BAi76uVNoTcYIGux5gwqotHW0k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gYRzJoD+O8Dt9LNVHii0lmOimK0iF0rAYgxQs3YX4oo9d+hgiapmKfvqfm0gTCG/5nSMTKW3YwTw7CfG9qO7bN/SOIhP/ElnBsSJbFmMBSeOWnMIIsIrA50yR2nfi7ygZP4yu4lPmUPSr7wtVwB6TwyCBs73jASdE1QQsUXeZhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=dkgpp0Wu; arc=fail smtp.client-ip=40.107.22.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=suY1ByTo9XMJ7mkxNrEmJ4p/+bdzCpUeuytqFro/t+FyR1gqInEP0l58c6G/im3gdsl2YK3vgU4xKTQZyAq0DdZ5o6wycpbapsgYPQ22htCkuprlk4/BxSclrnRtspcLSW1zbhKWovhwodAYMnO1aKcIoLJ2sJJQVl2lDXt7QLM3sRdoigqnZHnVe8L0u09wGgvdrm8BbGrPJo7gFhWLdTg6aSzx4dlpE1mtjQNVqwDpK1yKGFhadpN1rQRBND+AfFiod/hNVjmcDezuC1d2G0PwQtYJw2pRhtwNZHiNZ/LfHP5Dmmm5ypR3f5i38mc1nRQqf+OsWF8b15uWARv8RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBLiN3R5B8tRUjg21BAi76uVNoTcYIGux5gwqotHW0k=;
 b=fp1IpxlBz++Px7nSND8aPl8LWaiRNbsFbSCSL8TJpiWBm4iTHmqBW/0IZ3wCtw2OETjvkcdMKYolWDMC57pKjsVJ9vrbySpwTvmKUOte6BqMkrYXO6AkHMKEbScp1aAHCxNFmU+COgJg9kIVfu/3v7yJeXGVIXBPeJcq86POrJ8D1t6liGCeGHMKv69ilSElJSzTk0OJJRIFK9eAb1DNJ/YqmsK5VQ086ayyXynF2XxpeYD5IVOgOGA+RH/CWm7NqWrk8rxsUVYT2/tLbdTzde1MOK8wJqWUO41Ttsg5168KSbw0ZHPrDIba9AUzHKq9O9FaqRqXm4VjthAKnQJinw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBLiN3R5B8tRUjg21BAi76uVNoTcYIGux5gwqotHW0k=;
 b=dkgpp0WuK5JQilH2i33TdWEnqvGthTwtCnm7rsKPStafnkPxiglX3Z7qHVMoS+UExkpXQ0jV0SgboKxXWKNkdWraTJ6DgX49OalASB5dkXT0wbbWo/WdTy6Gs8ELJSObw9ezv7vfuytSGk/5aKDCdpO5Xf+SwifvwtIkcBryuCw=
Received: from DBAPR06MB6901.eurprd06.prod.outlook.com (2603:10a6:10:1a0::11)
 by GV1PR06MB9242.eurprd06.prod.outlook.com (2603:10a6:150:1a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Thu, 23 Jan
 2025 16:33:54 +0000
Received: from DBAPR06MB6901.eurprd06.prod.outlook.com
 ([fe80::3988:68ff:8fd1:7ea0]) by DBAPR06MB6901.eurprd06.prod.outlook.com
 ([fe80::3988:68ff:8fd1:7ea0%7]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 16:33:54 +0000
From: POPESCU Catalin <catalin.popescu@leica-geosystems.com>
To: Johan Hovold <johan@kernel.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"m.felsch@pengutronix.de" <m.felsch@pengutronix.de>,
	GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>
Subject: Re: [PATCH] usb: core: support interface node for simple USB devices
Thread-Topic: [PATCH] usb: core: support interface node for simple USB devices
Thread-Index: AQHbbNQz5nuTuJgNwkO47mkrPRQBtLMkNpcAgAAuNoCAABZagIAAFF6A
Date: Thu, 23 Jan 2025 16:33:54 +0000
Message-ID: <e59623a7-5438-4a8a-b3c0-13cf7e36baa1@leica-geosystems.com>
References: <20250122134732.2318554-1-catalin.popescu@leica-geosystems.com>
 <Z5Ik2GoseMbZRe8i@hovoldconsulting.com>
 <ce5fe24e-e2b5-4e41-9dd3-164d688afe04@leica-geosystems.com>
 <Z5JeW6kprsLgJJ_m@hovoldconsulting.com>
In-Reply-To: <Z5JeW6kprsLgJJ_m@hovoldconsulting.com>
Accept-Language: en-CH, en-US
Content-Language: aa
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBAPR06MB6901:EE_|GV1PR06MB9242:EE_
x-ms-office365-filtering-correlation-id: f8abf82c-63e3-4d42-4778-08dd3bcbba15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZVNiM0QyVXRGdGZIK2lFaStDZGRaMDhId3o3Si9VSDdqVTJmVXM1V1FFNU8r?=
 =?utf-8?B?YWNJOVdHWUxQS2UyMjBIMzd6RjdFUHRPNFNxUnp4RUhNRUx2cjlxc3hhN0tH?=
 =?utf-8?B?TXRjbkg3dFc2RStMbmx3UytJcU9pRVNSeVArRk1wTWlqSVB3MnRocW5Zc3NM?=
 =?utf-8?B?TkRqc1Z1aTdicXBiNnhYRmhPRjF1dUhjVktRdmx0NFY2b09KSFFnOUpQdnpB?=
 =?utf-8?B?TXJJWkprTDJybUlRRFlmbHBNcG1iYklQTDJZRG1UVUU2a2FucmJFdGh5WHpH?=
 =?utf-8?B?ZkNZckpJQU55ZnRjN0VjV0hLSkV1RlR1TG5EQlpGaitCMFdqQld1RU9WZFpW?=
 =?utf-8?B?UnJUakZnV2VEQ3I0akppKzNDNUZXQVJ6a2RFTWhEa2U4bkFvTU51M2szYnBB?=
 =?utf-8?B?R1U5Mkt2bDFOemtJNHgzZVpkT1NYVHZwTFV0WXRMZk5JTWhXSHVPdDJTTGNC?=
 =?utf-8?B?NVdIMXlTMkU2TEFCZElCWEVFazhRNS9EVFNyVlh0S2dDeEY0NHhuRzVXTFh0?=
 =?utf-8?B?OG8yRDdyMS9LWnBBWFJUdXVOM09sMHQ5UFVJYW5xNlBsMWUzYjBVQ3RZZUxq?=
 =?utf-8?B?RjF4Q1FoVlAxUHNuRW1iY2FhZUt0RmlicExVK0RUeitWUlN3MnEwV1ZZcHM5?=
 =?utf-8?B?NUFnWnVTWU1tbUp5ekVPSVdzNEVPWHVMcEtvS1Y4RHM5WHQ3c04rM3cvWHR5?=
 =?utf-8?B?ZmFlZUpYRU0xOGRyWldMRTJhRGRSUVBmdDd2ZUtPdDVlOVprYmhtcFZTM1k0?=
 =?utf-8?B?ak52Wk1FQ2ZmME1Dbm81TFNZT0NFRU96Wmw4RXJxTzBCc25NS1gvVE5hanlq?=
 =?utf-8?B?YWtKdjhRVWdwL0IzS0FBN1VtY3k3QXo1VndQa2p2TnZ1VktReDdYaUNaeVFF?=
 =?utf-8?B?a1FIWjA0OHVvbnpMb3AydjJkZCt1SDhXZEIrdkxqZ2g4YmIvcktwNjdaejZY?=
 =?utf-8?B?VGNXZ0NqaWFpMFMwNGlZQStscFdzby9HVVhwa0l6NDV1cktDNGtCSENWYUFq?=
 =?utf-8?B?YVZaWEJzeTFJV0FkTE5nR29OTFBWZER5WExtdjlYOHFDZmFKK2FNZjNDdGVo?=
 =?utf-8?B?b2NhM3l3SVpUS2QyYWxxODVSQTF5SG9UZGphOVl2L3h4ZEtUYTNudEwzY0Ns?=
 =?utf-8?B?aXhjYVJCVURrd0xQb3VMTG9VaytwNTdWdE81UTd2VUU3cHAvU05iR3pMV0Vy?=
 =?utf-8?B?M0UyektkY1E5TENvcmxmNVUzUy9kSXJ4T1ZueFJJYlNrUU9KdGd5RUxaVjZL?=
 =?utf-8?B?NWhEUFVHT240SFU1cGhLTDlFN2FyZXNIeDZ3TWJWMnBuUW1pbytUeERSVnk1?=
 =?utf-8?B?ZEtVbG03bjdaUHhKM3M4UjlBRU1iT1RWQnIybkpXajl3UE1PeEFUR25jMGhp?=
 =?utf-8?B?bFZkdEM3UHJlM2RjVVJ4VDR1VjR5eTdHa0F5cDlISnZiN3FPMUtseHpnaE1U?=
 =?utf-8?B?V2ZjZEZGcmFOSWV6UGM2blIwNWFQcDVUbEpCUzUzaHkyQVNPVFhZanhnMzhF?=
 =?utf-8?B?b2FUa0RpZnlnbEVTVWpLOHc5MlBuNk5zdnNFL0h5ZFJMZkcydmZScm1VemI1?=
 =?utf-8?B?bEdxMWdlaUZ6dHFVNTdmdmhQajZtYmNSd1dwUG10T0xwelhJWjFWaHlYenBY?=
 =?utf-8?B?VENrUnZCTHhSdnRYRWhORW5xM1k3b2xaaWlxbzRMTjRnbDEvMmQ2a2FNcERM?=
 =?utf-8?B?dGI0R0VOa1lCaWFoSW15NEFPYm5BbDV2TU1FNExnRXhJZngvNHd2SGhjcEFD?=
 =?utf-8?B?YnRucFN0bFcwTmcrVE52Ym8rdkFqZmsxVVRCK3ZrcTVIZm5CUzJWaWlFcjFD?=
 =?utf-8?B?TXJEZFlYcmZzd3lRTzYxam1iVjEyWDJ0Ny9CMXhpU3RwZU5vTHFDT0MzMy9J?=
 =?utf-8?B?UWpYbCs4UlhXZzRiK3NHKzhBaEFJY3dyRDBiN0NJYWtvVDFra3VVVHhoeVRu?=
 =?utf-8?Q?vPjemaBgE4xf+OG1T56Tpe6/afnQ+INs?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR06MB6901.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WllEcjdPU3lqYVppRWU5elB3RXVOOHRBVndNT3NpUVNYeWhQM1RTOTl2WkRj?=
 =?utf-8?B?M0VpeUU2Y1pFVit4Wkp5TDdPSHJRZEpuVk5xMEhscVFhNDNuTG1TZjc3VkFQ?=
 =?utf-8?B?bXN5ZFNDUVJHRjA2QUtIaVlQekxSRVpXb2FEMUU3bXFpa2diM0dLdUl3VHhk?=
 =?utf-8?B?T0tjYlVWbkpDYXhMTXNCNG9rMUw1dmZkTGU3RmNiMzVyVGtFSW5QaTQxcUdE?=
 =?utf-8?B?MEtSMzdMdkZYdGs2Q0Z3dDcxSEh2Zk9HUkpyUHlBUFg4cThFUENhTWtidmMz?=
 =?utf-8?B?YTRwUkM3d3N2K2hzTkZZVVJrR2MwaWNRZHJ1bFBHYTV0aVVMZU4veS9vdjZQ?=
 =?utf-8?B?eHhDVEVnQ3ZsdTg2TGdDbm1hN2s0cFNndERwZGFDMGR2N0t6ejBycVRNRWgv?=
 =?utf-8?B?d3g2dXFtZnY4MEYyTDBPSHdoNDFyZklLVFZOTkxWeFcwYjJxR0prWEl1VjlN?=
 =?utf-8?B?TWtjU2NBVEtadzlKME1oWXRsdDNURHRxTTNPWXVyYTFtSGpxZVhNREtIUzV6?=
 =?utf-8?B?cWlmMmN1dkNHckZ3aGhKYURUMkMrajVOOEFtcm9IM1BLTXdXeEtOckhHVGh2?=
 =?utf-8?B?eE5QZ1BXemcrNGNzSGNxdFI5SXBaTnQ1bFRKTEpyQklyVTVvTkduOHVWTHYv?=
 =?utf-8?B?ckxXK0ZYWTl3ZkhuYVhRRlpkSG9MQnZkQlFNME9vanlMR3FNN0sxTG1mN083?=
 =?utf-8?B?b3E4V013czJ0UWZsRHNZUmUrWGtnVzJVd01yZWJzYy9WRXFPRUx4TlRxcVo0?=
 =?utf-8?B?U3RqMTMwcWpUMGZ2N1dUa2ZEYW1GdmtpV2lpdzlIYWFJTGx4QmxxOVNONmN4?=
 =?utf-8?B?NGxDV2lzbnVZemt2T2pUNHZsRWdnNS9CZDBiUHgxZFlqNzJkQTM2NnlJcHVh?=
 =?utf-8?B?a2Z5bTRQR3d5ZGtOWWY1VUpJMERKcEZoWXBiSUpGN1l4M0hvNG01cHJwOExh?=
 =?utf-8?B?eHhuSHM3VXV3TUFNQ1lBZExMK1k0RDNQdUhLeDZUVzVHdmxDZStFMDgrSmxW?=
 =?utf-8?B?TC9wZjNOUmRSYjVpWWJRa1o4YWpqWVlhUXBsa2xiMm55bisrdHFWdDc0TXYz?=
 =?utf-8?B?akEydi8xcnBjMFVRdXp1cE0va24rQUlRaGIvOTYxUmtZRzFFR3hCeDI2RFVh?=
 =?utf-8?B?QmEvV2UxVjYxYmN1NTYrWVVRMzhEQ2FYM01nVWh0RDlPVHRCUlJHaXBkeWVX?=
 =?utf-8?B?c0gvSGJOL0hGOWNsREFtYjZ6QUZDMUlYbVFYZW1TWkZRRXRZdkhIazJFeTYr?=
 =?utf-8?B?OHZUTXozdUdkSW5EcW8vZmRrNnRFVytUVlJ5VWdyVFpmeC8rZVIvZ0huemp3?=
 =?utf-8?B?YVUycWdGSlBFb2x3TUV2Y1VtaFowV3h3L1RBMUo2TlRDTFdWWkNDRWtkdnpm?=
 =?utf-8?B?dlI2VGlKWkFhQTdUdlhHL05KRHphTkNxN0xEaGxlTFF3QWgxcWJYM2d0RWhy?=
 =?utf-8?B?Q2c1aUxQL1lFTEpxS2hDYkZTTHhkVlpCNWFjQ05QcXBGb21BUEZZNTY4dGY2?=
 =?utf-8?B?TWhTTlNkU0xYdVlNQXQ1bk5lOHhreWhTcU1IMndDNUZVUU5EWmNXTkIwb3d5?=
 =?utf-8?B?YUpxdVY3NEhpRnl2ZWFDTUxoeGg3VDJ0a0tReEQrZ0o4dzhDRithMVdHV0lu?=
 =?utf-8?B?WXZyZjNYVHNZcjF1YU1WdjBNS3BxaS95ZWJCNGdRUjhIdUJqTzhicGlOQmhJ?=
 =?utf-8?B?NTdrMFdmVzlXcUdtYzA2RTI5SGZKOGNjcVVlaFcrNXM2b0F1ak03Sk0wcWFo?=
 =?utf-8?B?OXZsejFOblhzeS9oaGFvZG1ncXl1cEZSL0dCSWR3amNMODFMdk40V3lKYStU?=
 =?utf-8?B?R3p4dzF0Tm9NaVNNV096QzJoSEtDV3JjSXJERmhoekRxNmtuV1BFVHBmWi9O?=
 =?utf-8?B?MjZqR1hNVWRVeUIwMktjS01sd0VqU2FvZkpMaklzSUdxZVVEN2lNOVpjTmJ5?=
 =?utf-8?B?alBCRzQ2alhrUEs0aWpQQVdOOE96M2VWUm8wd05EOTgxWUFrOUNFR2R6eFRx?=
 =?utf-8?B?cGRlKzJ2dzRxT2VJUEE2LzNnWldCV2lmSTk1Q0poVTB1WElYZGhsQ29rTHA3?=
 =?utf-8?B?d05iWW5VZzBva0lCSnBlKzdXTmpXTWVnM0sxS2VsQVZDa3pHQS9zTGpNUVlN?=
 =?utf-8?B?ZVpvOEtyUGZtQ2FicW9GKzdKb3poSjhRTXBkVkpobU80ajNOSEhia0Rxdnl3?=
 =?utf-8?B?a0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <40E371CC2815D94388B92340EBB359DE@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBAPR06MB6901.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8abf82c-63e3-4d42-4778-08dd3bcbba15
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 16:33:54.2809
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5HsbeskUGRBCwDvCZ3d+tfRMx33K70lun+H2TUe6tUCtrkZxx9Kb6LZQhVkRE2xv5qaCw7RDeWpM8aa2mnCu41/scEyexHEuH0Z7R+RwvdLdPhiTcM0ov4JEO5RQUfue
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR06MB9242

T24gMjMvMDEvMjAyNSAxNjoyMCwgSm9oYW4gSG92b2xkIHdyb3RlOg0KPiBbU29tZSBwZW9wbGUg
d2hvIHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBqb2hh
bkBrZXJuZWwub3JnLiBMZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2Eu
bXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4NCj4gVGhpcyBlbWFpbCBpcyBu
b3QgZnJvbSBIZXhhZ29u4oCZcyBPZmZpY2UgMzY1IGluc3RhbmNlLiBQbGVhc2UgYmUgY2FyZWZ1
bCB3aGlsZSBjbGlja2luZyBsaW5rcywgb3BlbmluZyBhdHRhY2htZW50cywgb3IgcmVwbHlpbmcg
dG8gdGhpcyBlbWFpbC4NCj4NCj4NCj4gT24gVGh1LCBKYW4gMjMsIDIwMjUgYXQgMDI6MDE6MDBQ
TSArMDAwMCwgUE9QRVNDVSBDYXRhbGluIHdyb3RlOg0KPj4gT24gMjMvMDEvMjAyNSAxMjoxNSwg
Sm9oYW4gSG92b2xkIHdyb3RlOg0KPj4+IE9uIFdlZCwgSmFuIDIyLCAyMDI1IGF0IDAyOjQ3OjMy
UE0gKzAxMDAsIENhdGFsaW4gUG9wZXNjdSB3cm90ZToNCj4+Pj4gQSBzaW1wbGUgdXNiIGRldmlj
ZSBoYXMgYSBzaW5nbGUgY29uZmlndXJhdGlvbiBhbmQgYSBzaW5nbGUgaW50ZXJmYWNlDQo+Pj4+
IGFuZCBpcyBjb25zaWRlcmVkIGFzIGEgImNvbWJpbmVkIG5vZGUiIHdoZW4gZGVmaW5lZCBpbiB0
aGUgZGV2aWNldHJlZS4NCj4+Pj4gSWYgYXZhaWxhYmxlLCBpdHMgaW50ZXJmYWNlIG5vZGUgaXMg
c2ltcGx5IGlnbm9yZWQgd2hpY2ggaXMgYSBwcm9ibGVtDQo+Pj4+IHdoZW5ldmVyIHRoZSBpbnRl
cmZhY2Ugbm9kZSBoYXMgc3Vibm9kZXMuIFRvIHByZXZlbnQgdGhhdCBmcm9tIGhhcHBlbmluZw0K
Pj4+PiBmaXJzdCBjaGVjayBmb3IgYW55IHN1Ym5vZGUgYW5kIGlnbm9yZSB0aGUgaW50ZXJmYWNl
IG5vZGUgb25seSBpZiBubw0KPj4+PiBzdWJub2RlIHdhcyBmb3VuZC4NCj4+Pj4NCj4+Pj4gRXhh
bXBsZTogRlRESSBjaGlwIEZUMjM0WEQgdGhhdCBoYXMgb25seSBvbmUgVUFSVCBpbnRlcmZhY2Ug
d2hpY2ggaXMNCj4+Pj4gYmVpbmcgdXNlZCBhcyBhIHNlcmRldiBieSBvdGhlciBkcml2ZXIuDQo+
Pj4+DQo+Pj4+IGRldmljZUAxIHsNCj4+Pj4gICAgICAgICBjb21wYXRpYmxlID0gInVzYjQwMyw2
MDE1IjsNCj4+Pj4gICAgICAgICByZWcgPSA8MT47DQo+Pj4+DQo+Pj4+ICAgICAgICAgI2FkZHJl
c3MtY2VsbHMgPSA8Mj47DQo+Pj4+ICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQo+Pj4+DQo+
Pj4+ICAgICAgICAgaW50ZXJmYWNlQDAgew0KPj4+PiAgICAgICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJ1c2JpZjQwMyw2MDE1LmNvbmZpZzEuMCI7DQo+Pj4gWW91ciBleGFtcGxlIG1ha2VzIG5v
IHNlbnNlIHNpbmNlIGlmIHRoaXMgaXMgdGhlIG9ubHkgaW50ZXJmYWNlIHRoZW4gdGhlDQo+Pj4g
aW50ZXJmYWNlIG5vZGUgc2hvdWxkIG5vdCBiZSBoZXJlLg0KPj4gVGhhdCdzIHRoZSBwcm9ibGVt
IG15IHBhdGNoIGlzIHRyeWluZyB0byBhZGRyZXNzIC4uLg0KPj4gV2h5IGlzIGl0IE9LIHRvIGRl
c2NyaWJlIG11bHRpcGxlIGludGVyZmFjZXMgYW5kIGl0IGlzIG5vdCBPSyB0bw0KPj4gZGVzY3Jp
YmUgdGhlIGludGVyZmFjZSBvZiBhIHNpbXBsZSBVU0IgZGV2aWNlID8NCj4gSXQncyBwYXJ0IG9m
IHRoZSBzcGVjLiBTZWUgY29tbWl0IDFhN2UzOTQ4Y2I5ZiAoIlVTQjogYWRkIGRldmljZS10cmVl
DQo+IHN1cHBvcnQgZm9yIGludGVyZmFjZXMiKSBhbmQgaXRzIHJlZmVyZW5jZSB0byAiT3BlbiBG
aXJtd2FyZSBSZWNvbW1lbmRlZA0KPiBQcmFjdGljZTogVW5pdmVyc2FsIFNlcmlhbCBCdXMgVmVy
c2lvbiAxIi4NCkkgc2VlLCB0aGFua3MgYSBsb3QgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLg0KQlIs
DQo+IEpvaGFuDQoNCg0K

