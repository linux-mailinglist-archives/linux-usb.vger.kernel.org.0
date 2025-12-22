Return-Path: <linux-usb+bounces-31671-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BDDCD5F7D
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 13:23:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B49C4303B18D
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 12:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068DC274FD0;
	Mon, 22 Dec 2025 12:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="QM9HWatk"
X-Original-To: linux-usb@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012019.outbound.protection.outlook.com [40.107.75.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8633525DB12;
	Mon, 22 Dec 2025 12:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766406076; cv=fail; b=m8iKmP5wgwdXk4emgJ7/IkPQhzmeR5bo4DM7q3PajGqH9VILUwo3fTd1yT16vMqhsBle6GQVAbCUuaGIKrJRdbLcu/FcOLSRgEzcwN4BnTQNHQEfuCOr8l1BpEXnnX+lnM9g41qb6UWOeyhlS0J05LV3FMh/qIjAoy4U0B8cmZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766406076; c=relaxed/simple;
	bh=tvrf14VJasZnatuZLyS5BCBSiNMgSMrBqalZFAqTfcM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QZ3O3BuGBbroyvMLgUQuTkGWPHv7ui0/12stjO1mHdIVJUAP74EKUFilcPQFMpmMGWR83vgoV8AOQURJpoJ9H5e+QfqodXBgqZohppxsXTwa4zypPmo9JzfQMtQGzs2QZmz72CN6l4kgTcOOxMBaOsSS5Rh5PU4B52IfNmwRV+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=QM9HWatk; arc=fail smtp.client-ip=40.107.75.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQfHwivxdNZgVEwJUNKTgfHil8/pQVBEqKWqF0XlJZIyWx/R1yEJEkbo4MbnfqTK16sAIvIG8W9uUIHU/l9ArQm5tmNJ+UluE7WIM+UZAlghdD6zrwfqvm0WN6bU6a2Slp4ybEAprERWHZUfu8Yzhfjtqo5Xi6czbEAZaH0hJP9TqfHZySDBFYTUeywTbccMxfhRANyks+jv8NdSXXRDcZb5RYwUzATxJgdRpOvCg6JPdYZ1xrt15C5POZQWQJiEh1duz48gP7UhrJvwVeljX//2bpPNT3L74T7vAEHNHS7xeHq77Ziq6znG1Kzt0+9LYj/WkzVNHH9Yr/bwPrQh+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvrf14VJasZnatuZLyS5BCBSiNMgSMrBqalZFAqTfcM=;
 b=NnWxwvD2LCBrGJfcyUr9U9NCaRVE7Wsa8nvE8ldDt/mov4zrdsgQd3fVj3jbM9cHEWhZVwU7uCJILRnK1K2TocLlSwXjz5ltg6IOegwhGrUBp5+y7pRooStGd2MrUnpfLGXjUeoMnl4g0omXtXO0G6lRhtrjZBDW5hEAfLR7MANQw0a73GKvoVXGLqAuOhHZhfzKXKN9X425pw9Rrl4Kol0er/3xUwZGj6jAX4PM5jpBGBLNHVibwz8LUVkWY1KnV+Gmsz8vbLK981CZYoUvM5F6Xi1Q0EA1HaUjsbsc5RyELWCjwkoGAN7sz266jrdQrs/2f10AJARtURx+A+Xypw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvrf14VJasZnatuZLyS5BCBSiNMgSMrBqalZFAqTfcM=;
 b=QM9HWatkqpxl55uPpmg7lgQNxxcVWoTA9pb3sWWmyPDiyPyHt9V8yoOd3mgVpTSimpkoZZLT7pEkR6SKwEuuYfdnUOPecAYpNs99vNSXJRHTGz6CfailRk3bWhPB7YfvpjmyB7mdzjS7H8GAKdrfslPecu7TZ9VdpnvnvZ1gurOFJC1uJD85aw/UPR0iCKoI8jlp2dUWan5W7QRrK7cvJ8Dmn254yVNqqGalQisAOTpJoVrOZ1gKrk766mlFh6lCpao8+ninTzzhQQEM7RwvnkjZYHsxINMdbnvLnVUCHCk2iEioUtUrhOxZnKfH2E+SyyCKdM8IDmh8bprcBaNuVg==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by PUZPR06MB5449.apcprd06.prod.outlook.com (2603:1096:301:ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 12:21:09 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe%7]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 12:21:09 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: Michal Pecio <michal.pecio@gmail.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Lee Jones <lee@kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>,
	Mathias Nyman <mathias.nyman@intel.com>, Sarah Sharp
	<sarah.a.sharp@linux.intel.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject:
 =?gb2312?B?tPC4tDogW1BBVENIXSB1c2I6IHhoY2k6IGNoZWNrIE51bGwgcG9pbnRlciBp?=
 =?gb2312?Q?n_segment_alloc?=
Thread-Topic: [PATCH] usb: xhci: check Null pointer in segment alloc
Thread-Index:
 Adxwth5w6+XyiEy+T6yiUQ4BKIwQNAAL7kUAAAZba+AALNlvAABW4cUAAAEQi4AAAXrJgAAJKy4Q
Date: Mon, 22 Dec 2025 12:21:09 +0000
Message-ID:
 <TYUPR06MB6217CB438F21763401A93E6ED2B4A@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB6217F5AA7DA1E43A567CBA04D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<4935bdf5-4d36-45c3-9bcd-9d14606dd54e@linux.intel.com>
	<TYUPR06MB6217AC2CE5431DC9B3956FE7D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<20251220141510.1bc1ef19.michal.pecio@gmail.com>
	<20251222064252.GA1196800@google.com>	<2025122253-stopper-tweed-6e68@gregkh>
 <20251222085543.4d7430d5.michal.pecio@gmail.com>
In-Reply-To: <20251222085543.4d7430d5.michal.pecio@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|PUZPR06MB5449:EE_
x-ms-office365-filtering-correlation-id: 2e299cd0-ec94-44aa-d8f1-08de415496cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?gb2312?B?blJoYlZoZjd1d1ptTUpGYnBBb2ZqQVZITFRld1FweWZQWm5nVEJ4TUtJN3Qr?=
 =?gb2312?B?cnYySUs5OVI2Ly9tOFI5MTN6eDhFMEtMSFlhYytWSUV1YUVKc2syK1JNUDg2?=
 =?gb2312?B?MFpXYUJjTVlvV09VK3RYcnVhczR0endzNHJnNkh0dDlZNERmemlGR2puVGFD?=
 =?gb2312?B?eTg2UHB1U25rUGFUd3JQejNIckdvUk9DenplZTU2TVhzbTJyYnZrVkpMSFNk?=
 =?gb2312?B?bkJRVDFEeDd2RDNMNGNoc1psMjZQbFBHQUswaWpsamJZU05NcXlUTWNDUVR5?=
 =?gb2312?B?czdDZmRzVWpJdWdSYmwyR1p1alJscjZ0WVRKdkk5Vk1kbkJaSHE0aDI1cG5W?=
 =?gb2312?B?ZlVBYWEvbnU1Z0tEN25xZVZNckErM01wd0JSaGJvWlJSdnpTTU91RVRmZWUr?=
 =?gb2312?B?UWFqM2VzQ0d4Z05zb0ovdUtoS2hTL2V2cldhNTRhSkVUNjNyZEozUDNEdXBS?=
 =?gb2312?B?dmpZMG1OSEUrZXRJcWpvNGdOQVRpSkxVU01GcGFyR2RzYThEMU1pV3Jkam5z?=
 =?gb2312?B?dlE2SVJ0MmYvNnluSGxCMXN2UVRQZncxMDU1angzZVVpTm5lbTdJakRyU0tm?=
 =?gb2312?B?bXREVTcxUUJ0MlY5VFNoVUh2cEtXZmx3cnBTK2ZLaW5peTBaTW51ZXhpMlBO?=
 =?gb2312?B?L2VTbzh3dlBUSGgxYXBSblFlYnpsaGlEejVkMG5UUWp2dHlKNUJ6eDhvdW9q?=
 =?gb2312?B?enlpdjY0cWNYc2p6KzM0TWFUbEhyZStMSVdSeE1yS05pMWhpSVlTMjRib3I3?=
 =?gb2312?B?cVlBVGV0TzdEbmRDdEdLZ1hZTDMyU1lHN2JYUlVvNDRWVE9xbXI5c3owbUIx?=
 =?gb2312?B?NHZ1eGhscDBRdnhwMjBOR2JpdWpRU0M0bjF1Vm1FV2MvM2Zrdnl3U1Y4ZHVy?=
 =?gb2312?B?KzZGeFA5ZTMvN0RFSm5HTlJlczIxUmRkSGtUSHpBRkhtYy9PR2xLUDBlVWlj?=
 =?gb2312?B?VktvaE45WXUvSVhaZFpHVUJITnQrcjdmZDI2U0lMZlR5cDg1aWk0ZlFDbUp3?=
 =?gb2312?B?bWJQRzJFRksrTW1mWmtSSVVCbE9weWJoQlo4dVFXVjNKazZiWmtwMmZhRUtx?=
 =?gb2312?B?N1IwQUVMMDB0cURkMklrbmt2Z0UzVXFBMmEyejk4N2N2OGJjODM2b1JDN0Ra?=
 =?gb2312?B?T3hCZGxpMnhxQk1nLzFIVmFqaEs5VFJHbmRua3JGdEtZTnByL1d0ZlF2NDFD?=
 =?gb2312?B?c2ZNQ3U3SFdlUEJZS0p5V0ZVdkRnWVRxdnl0ekxxbDBLRk5ORWF5Q3B5Smtn?=
 =?gb2312?B?MkN6RHcvR1VJMGFObEFsM0NDTVh0VEtNWUVxSmtraFdNSWVKeXN6UUFRMGhl?=
 =?gb2312?B?bExsSnNqWXRxT3A3amNwVzlTNHIwUmpzN2VKNGMxMDcrZkFoNzk5VDJwV1hU?=
 =?gb2312?B?ZEhWblpKelg1RU53WFZ6VVFLWGVmQTVsZUZZN1FvbmlVejVVb1NwbzJ3azlW?=
 =?gb2312?B?d3poR0lSWTg4WHFEUUloVkFrSlVSanB2NWt0SExoVzJJeU1lUWVlMFNhME9O?=
 =?gb2312?B?RjZqcjNMNElJcmRSVVBYeWV4SCs0cFBBdU5jTFk3c2NzTktWZG9VRmZsd3VI?=
 =?gb2312?B?VTZTNlBUcityM1dleGE3NjRIVVZhckxLc3B6dzBlWmR5WkN2YVFnSGlhL3BB?=
 =?gb2312?B?cmx6V0NSK0llQ3JXcGlZRVo0WVRLTm9MQm1raHh0TDhUeVdkWkVtNkdNT2RV?=
 =?gb2312?B?eVN0VURvMnZFS1RoZzRsWWtodzZ0c3ZPaUhXOGxPREVSWS9uY1lCQm11RDQy?=
 =?gb2312?B?cmF4S3ZiK0lOM1RmTDJxSzk4OFRZeUtkRHROMlZNaEU2UHFnUGJFT0xWQnFY?=
 =?gb2312?B?eGdKRzlmaUtVS0VScUxTNFhyMXg1eDN4QmRDeWM2S0x0T0dGczQwMU9NcFhs?=
 =?gb2312?B?Z0VFTUNiMUMwVVhDbTJsaERhZjRjTHpSZ0ordktNS3RDejdVMlRqbUtRSGR6?=
 =?gb2312?B?dzlYU2V2bGxkTFhyT0xmTElZVzFuZ2FtUnZ3WmhYLzVKaDFieFp6OHhRZ1lz?=
 =?gb2312?B?cXhMRUZydjBsN1lxSk1PZE9vVFBCaUUyam1MS3FGTG40UlNXNDZDRlZlMjBz?=
 =?gb2312?Q?JutRgF?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?WHVqdnR1SmlUMURydGx1Qzd6VStVVFZUNzFFKzRHRkNJY2orMjFnQ0Z4ZVhG?=
 =?gb2312?B?dzduclNweFB3ajYrTUJYbHU2bDBySTRCeVZocVliWUlsVllkQkN2aE8yRHcr?=
 =?gb2312?B?WEd6Vm1MdXV3UHNEVjRzaEYzZjBXWkQ4M1Y5UFR0OTZLWlV0VkJLVFdWL2lW?=
 =?gb2312?B?bnQ0UlUxdWtaYW9GcmhuTVNyK3AzYVZaZUk5RkRDdEZVczZ2ZlFtZDlERGF6?=
 =?gb2312?B?eGhjVU1VUS9FVWE1c2lGdVp3SEJjUU9UZWh6RTNROU03aERKZWtGaUpWU21o?=
 =?gb2312?B?TTM2cHNHM1dTcEkvZnZ5eFpsZDVUMkdpYXpVaFNFWGJneG1scW91NVhEK3gz?=
 =?gb2312?B?dXgwZmhFTzhncUpZcnhaaGR1UGZHU0JQRWg3NVpNZ09jWkNDT1B2cjdiZFgx?=
 =?gb2312?B?MTB1SFFBeXNKQmkzUzQ5SEFESDZHdmh5NWZubXZwS0JIalRDWlVwWGt0bkUw?=
 =?gb2312?B?eXl3ZC94UnN0YTM2aTBHWWltak1kMGtuU1pCTEttYjFNS2luVnIwMUdreDls?=
 =?gb2312?B?aWx2aHBZbTI0MnRTZEZHNlhBelRqdThZTW1VZm91SDhvUVFEOHEyRjlMNVpF?=
 =?gb2312?B?SmYySUtPcHNDNkNlbDZQUDd1dk01SnBHclVDdHBCOEVtU0ZxSjE3NU11bm40?=
 =?gb2312?B?T0Fnc1hKVngwVWdLcUFMZVI4SUdGMnErc2t4ZkxEaE96WHNSQXF0Q3RDK0pC?=
 =?gb2312?B?Y1krdGp1OGtONnRCVnBraFNndHFWT0k0dVVaZW9XQXJtQWZ2ZmV4ci82TElM?=
 =?gb2312?B?Mmk2cWphTnJsNzI3RU5iMUNyMWgzYmxUSHV3dEdtUE9lNHpTYzJVRndvM1ow?=
 =?gb2312?B?M2Flb2pWbkhIdHd4WE1VRTlXQjZ0dnpWVXVTb0VtaGZsbnViTHlIcjI4ZWJn?=
 =?gb2312?B?VEVoa1dxT3FCM0JqQjdDVVJZekgzS0N3RVlRa01rK2p4MmU1T0t5S2tsV0ov?=
 =?gb2312?B?NzN5ZUV5aSs3QWtOcFhPWTF2cURDNy9DamthMlBpQVFxU0diVS9pUzc4NTZY?=
 =?gb2312?B?VEdjTjU0T0dwUjdSRHl1aVY0WklGOEs0SXNtc01ZU292K1ROdHZzSEZnT1NB?=
 =?gb2312?B?b2pFVGxRVk9jR1ErR2hLOTVObTd2c3IrZFUzNWpaNWdESXdtc3YzYnV6QUR5?=
 =?gb2312?B?RmNyZnZxUnJYRlpuSU9jQm1FVUQ4MjlvM09oNzZJRjRlQVg1dS9zd2JaQVdF?=
 =?gb2312?B?bVBZMkNJaG1aanRqNkZxT3hUcHNCS1FoL0JJSGNvcit3RkVsK0FqMUxCN25n?=
 =?gb2312?B?eDBuZTFyaDFRR09xS1ZsbzRFZ003QkVnUWRET01nTVZoQlhVTkhkeEw1RjVZ?=
 =?gb2312?B?UStuZHlSaXVqUzZwd2NkNUptMXpIY0xTanRhSFhWaERFcncvR3lYaXpjK2k0?=
 =?gb2312?B?RW5qRlRIbGRtMEtDNVJQSlJMek5GUlJxKzdib3pFNzB4YXI5UGs0WHlYbHcr?=
 =?gb2312?B?end5QTVlTGtlcmw0NWdmdXNOaGJrQVJTNkxpMzhUREpsVFdPb1VGSVh0V2pw?=
 =?gb2312?B?WVFJU2FTQWlLb2FBWUIrb2xpNWhybmxGYXhQSEJHQXg1VVc5RHJDUzYwOVBq?=
 =?gb2312?B?WFdxYitEZmhQb2xnMTdiaG5GSnZVWUd1MGhCdzRTVERGTjR6NW9kbFpIeHhs?=
 =?gb2312?B?aGttV2ZsVnRncFIyM1NVOGxUcnlMWHUyUVNEVEFDRnpMYTdSQnNGQi9mZ2gr?=
 =?gb2312?B?QlM4SFhmVU4zUEtvS25qMlhOYkJFeFJ3ZGFCdUVvRjAwV3hjMzY1cGFQcENB?=
 =?gb2312?B?ZUVDN2NldXdoR3NEQkQ5S0MvdFF4Q3RWZ0tMaWM1SmtYMzBscnFGRFlyVnFu?=
 =?gb2312?B?dExXZTk5QldpY0lvdHF6OEZMaWg0NEpWa2kyRVZHOWNaZlk3bUgvWS9HT0pQ?=
 =?gb2312?B?cVVhZEliL0VsNEp1bnZZRG1lV2NrV1Fyd3dPVmJXTzhvWC9yYkJpOEQ1T3FM?=
 =?gb2312?B?Y3dHdVVlWDlHWHBuUE1zQWRjakhqbXdydVpxS1p5VXpZRnQ5aW9HMWxsZE1s?=
 =?gb2312?B?dDE1SlJ6N0c5a2VyMzN6Mm5HSW1zRVNpZWZUcm1pMVBDekRxdm1lTEdLeFN6?=
 =?gb2312?B?QU1JU2xLK0VINmNFa2p1dmcya08rVFVqZkRGMVVSZUZsQzJNVC9wcmxDQjFj?=
 =?gb2312?B?ZWRadENpUGxDWUdVcTNTMnRpRWxNYjdIRUtHYnl4MUhIRHNKVkp6R3Y3dTFK?=
 =?gb2312?B?WHo2Y2psMmZBa0RXallUdm9NS3NEQ3RDN0poTXpsSHFuSnpudjhxamllNk13?=
 =?gb2312?B?ZTZMSnJYdUV5dVFPVE9zN05RdDhXeXJVK1kwbVViUi95Q0NqU2xmMURMcHhy?=
 =?gb2312?Q?cwAsa4PeC6HmcVMaJJ?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYUPR06MB6217.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e299cd0-ec94-44aa-d8f1-08de415496cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2025 12:21:09.6099
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bnLsTZodq0W8h2t8a93cqencidvOqHMzL7UTQPinpGKoPACnITKzzlxCtlvRHjdZV9scjfuBjCqr3LBASj+WQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5449

SGkgTWljaGFsOg0KDQo+IE9uIE1vbiwgMjIgRGVjIDIwMjUgMDg6MTM6MjEgKzAxMDAsIEdyZWcg
S3JvYWgtSGFydG1hbiB3cm90ZToNCj4gPiA+IEFuIEFQSSB0aGF0IGluc2lzdHMgb24gaXRzIHVz
ZXJzIGV4ZXJjaXNpbmcgY2FyZSwga25vd2xlZGdlIGFuZA0KPiA+ID4gY29nbmlzYW5jZSBzb3Vu
ZHMgZnJhZ2lsZSBhbmQgdnVsbmVyYWJsZS4NCj4gPg0KPiA+IEZyYWdpbGUgeWVzLCB2dWxuZXJh
YmxlIG5vLiAgTGV0J3MgZml4IHRoZSBmcmFnaWxpdHkgdGhlbiwgYnV0IGFzIGhhcw0KPiA+IGJl
ZW4gcG9pbnRlZCBvdXQgaW4gdGhpcyB0aHJlYWQsIHdlIGRvbid0IGtub3cgdGhlIHJvb3QgY2F1
c2UsIGFuZCBJDQo+ID4gZG9uJ3QgZXZlbiB0aGluayB0aGlzICJmaXgiIHdvdWxkIGRvIHRoZSBy
aWdodCB0aGluZyBhbnl3YXkuDQo+IA0KPiBUaGUgcGF0Y2ggbG9va3Mgd3JvbmcuIEkgc3VzcGVj
dCB0aGlzIGhhcHBlbnMgd2hlbiBhZGRfZW5kcG9pbnQoKSBpcyBjYWxsZWQNCj4gY29uY3VycmVu
dGx5IHdpdGggcmVzdW1lKCksIHdoaWNoIG1ha2VzIGxpdHRsZSBzZW5zZS4gQW5kIGl0IG1lYW5z
IHRoZSBzYW1lDQo+IGNvZGUgY2FuIHByb2JhYmx5IGNhbGwgYWRkX2VuZHBvaW50KCkgYmVmb3Jl
IHJlc3VtZSgpLCB3aGljaCBtYWtlcyBubw0KPiBzZW5zZSBlaXRoZXIuIFdlIGNhbid0IGRvIHRo
YXQgd2l0aCBzdXNwZW5kZWQgSFcuDQo+IA0KPiBDaGFuY2VzIGFyZSB0aGF0IHRoaXMgY3Jhc2gg
aXNuJ3QgZXZlbiB0aGUgb25seSB0aGluZyB0aGF0IGNvdWxkIGdvIHdyb25nDQo+IHdoZW4gc3Vj
aCBjYWxscyBhcmUgYXR0ZW1wdGVkLiBGb3Igb25lLCB4aGNpX3Jlc3VtZSgpIGRyb3BzIHRoZSBz
cGlubG9jaw0KPiBhZnRlciByZXBvcnRpbmcgdXNiX3Jvb3RfaHViX2xvc3RfcG93ZXIoKSwgc28g
eW91ciBndWVzcyBlbHNld2hlcmUgd2FzDQo+IGNvcnJlY3QgLSB0aGlzIGNvZGUgaXNuJ3QgZXZl
biBsb2NrZWQgcHJvcGVybHkuDQo+IA0KPiBJdCBzZWVtcyBubyBvcGVyYXRpb25zIG9uIFVTQiBk
ZXZpY2VzIGR1cmluZyByZXN1bWUoKSBhcmUgZXhwZWN0ZWQuDQoNCkN1cnJlbnRseSwgYWZ0ZXIg
Y2hlY2tpbmcgdGhlIGxvZ2ljIG9mIG91ciBLTyBzZWN0aW9uLCANCndlIGZvdW5kIHRoYXQgdGhl
cmUgbWlnaHQgYmUgdHdvIHBsYWNlcyBzaW11bHRhbmVvdXNseSBjYWxsaW5nIHNuZF91c2JfYXV0
b3Jlc3VtZSB0byB3YWtlIHVwIHRoZSBoZWFkc2V0IGRldmljZS4NCg0KVGhhbmtzDQo=

