Return-Path: <linux-usb+bounces-20147-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D83A2848A
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2025 07:39:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21C4E165EB2
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2025 06:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 548A6228387;
	Wed,  5 Feb 2025 06:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="TEeCgvv+"
X-Original-To: linux-usb@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2047.outbound.protection.outlook.com [40.107.215.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF9F21E097;
	Wed,  5 Feb 2025 06:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738737537; cv=fail; b=OLQlk8BDPQ3HN1t6E/xvYP8iIFoVxtPvXJrsHfGnkQ48vnffJsy2EQ9sFkB8TLxahGusKD7TtHJJL4Twou0wc+Qy0uCNKlvUbhbAlKtqpSrdH8VOR+FlRJ+sM4+f3VoOBjhAm/HKqQbX/YZ9vHtBlbUZJljUmNyyEVIzlY6eqzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738737537; c=relaxed/simple;
	bh=RpSAz8Lde1WxHRIaptXyN8nUW+B9wTDfk+yx2qq/CbA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CmC/ONsKSkUsSESq1hHh/VZphlNSa/zznqpvbw4zOhoP1lLCtY20ZLrSStmwr9u4ZWksDRAgFGoDJlvJ3CRnJHUMJ0Gjz+c9puAPhEhv73XzWYuQcjlR16k8rO30BSKDUSlNeINRVcCd4rfKEg1GKM60fUk3pEsOD9BJ6dWmw+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=TEeCgvv+; arc=fail smtp.client-ip=40.107.215.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZHXPfOouMt+iztOFO5OUFQB+Kn2EhKxm5IZfswOml+de/Bqjb950B8MR5bNHmhYZa9oTlP2772PU4NlhGNrf9XsZYhEgntlKAqq/CGKdpNS6qWDt8lIhFoYUCxVz84v0by5hCQrAYlf2ugdjG1Ak+kgy9Mvx7TOZcplLb00VIHw8N1wPzH/4FPwbxRJEC1CJex6FxXnh/G3tp19/OtozJeisiEVVA2ancfLo6BzUwYZEPMGToPhDB49XlkIION2hlPxUXwbK6iR86lQ/MEEvqrkXoewQXXAPsHFLMwFgJbPZ9oF9Sloye0bbTCPtKEZ8ZFLZUYyyNgk/n163j1EhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpSAz8Lde1WxHRIaptXyN8nUW+B9wTDfk+yx2qq/CbA=;
 b=FWj3aNF48PqMazeOcL2Kv9bOFnvajtSEXusmzM2aWdUvgtImudhqtCXuLbkS7jXB0vxMVCaXwCRgnfg+hdjVsutZaE0pAlqWPJOPIEvECZwEHfyfRcsgVOfz/he4vJJdRrKW6tXOg1Hk3l9hk4HyDhe0FnlQZkv1KzVkqjAOuVITVvFxOrGIB04MbIp6sa13GvDYTL+etm79MvFr2bmJt/zby3CGb1GsW5OgwscnLBAJCo+LgwgVKmZNOdAV/yepKW1nPT6YW1zqMPcITXIcr7hESgbHQcpUZisUpLPRxF9IkE6UFocx8I1AHqxzLaGr8Oeco4C4gSguFtzcqmX3aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpSAz8Lde1WxHRIaptXyN8nUW+B9wTDfk+yx2qq/CbA=;
 b=TEeCgvv+u/J6QiB38+gJxdvTNITSEO7ACOyGa795KVQuZ0Z7dXdaBq73znnMYgNf9crI4npmfPxss0lFh6lTBp69kVRvnBFsqA09TXR0DoD3IE9v+PEE0Rmi3aJwQ3kEQg7fQV23TBFcBgyCvCAt7BrOZKNollbebmP7alyTHMedCtrlzu5E8vt4yTnsR61cfHqHe9d9QUTSyiaLZNb/9jGB8ld1phE2buDys7DXR8GAEeleobfheqQP+Urz7vvgqvDzL3sGebHyOViwM2Ll8RTuExQWbEJvTKLVVwyV/SueSaL0jRJbhRo+rcUwjPMFP+kdd8v3vctQ+FdLvCxbsw==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by TY0PR06MB5353.apcprd06.prod.outlook.com (2603:1096:400:213::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.6; Wed, 5 Feb
 2025 06:38:48 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe%6]) with mapi id 15.20.8422.005; Wed, 5 Feb 2025
 06:38:48 +0000
From: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Dan Carpenter
	<dan.carpenter@linaro.org>, Jon Hunter <jonathanh@nvidia.com>
CC: Prashanth K <quic_prashk@quicinc.com>, "mwalle@kernel.org"
	<mwalle@kernel.org>, "quic_jjohnson@quicinc.com" <quic_jjohnson@quicinc.com>,
	David Brownell <dbrownell@users.sourceforge.net>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, opensource.kernel
	<opensource.kernel@vivo.com>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, Brad Griffis <bgriffis@nvidia.com>, Harshit
 Mogalapalli <harshit.m.mogalapalli@gmail.com>
Subject:
 =?utf-8?B?562U5aSNOiBbUEFUQ0ggdjNdIHVzYjogZ2FkZ2V0OiB1X3NlcmlhbDogRGlz?=
 =?utf-8?B?YWJsZSBlcCBiZWZvcmUgc2V0dGluZyBwb3J0IHRvIG51bGwgdG8gZml4IHRo?=
 =?utf-8?Q?e_crash_caused_by_port_being_null?=
Thread-Topic: [PATCH v3] usb: gadget: u_serial: Disable ep before setting port
 to null to fix the crash caused by port being null
Thread-Index:
 AdtQVu3p636G49OMSa2yDMmE+bdUDgXwT3UAAACXZQAAA0EggAD1y7uAAGoR8AACe8P7MA==
Date: Wed, 5 Feb 2025 06:38:48 +0000
Message-ID:
 <TYUPR06MB621712E6A082791B397088BFD2F72@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB621733B5AC690DBDF80A0DCCD2042@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <1037c1ad-9230-4181-b9c3-167dbaa47644@nvidia.com>
 <2025011633-cavity-earthworm-2b5e@gregkh>
 <3d9db530-a0b7-4f18-9ad4-233356dfe68c@nvidia.com>
 <e3a457d6-092b-4b7a-9032-50daddab6f1f@nvidia.com>
 <0fa6c6db-fd75-4a09-b4fa-d6a98bb8afac@stanley.mountain>
In-Reply-To: <0fa6c6db-fd75-4a09-b4fa-d6a98bb8afac@stanley.mountain>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|TY0PR06MB5353:EE_
x-ms-office365-filtering-correlation-id: 106886c2-df36-4dc5-7672-08dd45afbf2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ckhmR1ZZTXExb1dyWEJKWVFkempqNm12UHYwRXlhOUo2cjZpYVd2c1krODgv?=
 =?utf-8?B?YW9lZHRBbk5Hc2xJVUYxdlVEYlZObmY2NTZBN3RzSHl6UUp3VTJUNUZrSC9Q?=
 =?utf-8?B?K1dPbHF2MXdlSFRLUDNsMWpoMHNYMnZWeUhoTktFakFYdTRLUExHcFdDZHVp?=
 =?utf-8?B?dEMwMTFYNVdqNGdBNW9lZnNEMFdncitKRnRjS0p3Rm53czZ2WFlaNlFzeEEr?=
 =?utf-8?B?NUZQU0hYVFFML1JhR0sxY3FFVXFsYmc4bFlYazl1dU5Wakd2WUxHZ2t1SUhN?=
 =?utf-8?B?Ty8xZ1h5UFFvS2drU1laUGpLdncyWTdSalB4SWxCSWU4bjV2N1hyOGZhT05n?=
 =?utf-8?B?YmpKdFhQRGhraUhrYUhoY1VVN1B2V3lhY2wzbTloYng5ZGQwT2dleUVlRVhL?=
 =?utf-8?B?SmdGMU84VTREMDJTY1hILzNkU01KU1VSNHdqdTRITkdYSGhaOE1VVzFiVU9k?=
 =?utf-8?B?Vng0VTdCQllJbU1nZ3RnNW5JQm9BQkNTZjRRT2w5TzgyVWNYYzlQSFc0Y1ZG?=
 =?utf-8?B?Wm5sUnFHbTVJdnJYRHcvTnhJZlJqbU04Vy9rQ3JZc01idWU3NXU5ajk4T3Ux?=
 =?utf-8?B?ZVQrUlQrdUFSeUZRV1o0dE9hZzZzYm9aYzNhV0l2UVJnamllbnFMZXFmM1hw?=
 =?utf-8?B?SVgwSHdmNDBnUjVZNEtxQnhtRGwvbGNBV054bXptS1gzd2Ixbi8vQjg3MUJP?=
 =?utf-8?B?cmF3anBHYWNwMU1rNlZHaThLV0VGZXRDU3JvVzRuenVoMGE5ODc2T3g3aEVn?=
 =?utf-8?B?dGRrRVd0ZDdnS1JZUHI0RytrSkF4Z3RNVHZubERJMStPcXpSR0Z2YzBmTSt4?=
 =?utf-8?B?SVJ4THJCM05oVzEwRVV4cTliR0NGSC9kc3A1WndFdFdWeVJLZ1hHTU1yWGk0?=
 =?utf-8?B?dzdiTklXZExBTU1wcTBRNzJ5OHRJSFZ0YmMxdmRYSCtaQ2dBVkw2d0NZbGwr?=
 =?utf-8?B?dmVRUlk4THFUM1pCT1dZQTFReHlqSVB0NStDN0Y4NTd5K2NWenoxajRVa0dw?=
 =?utf-8?B?bWhtYzNaRTNWQ2ZzMlVVOWdOcXM1RThZOWdvcGdUTVZ1cmpkY0FkK0hmVEZK?=
 =?utf-8?B?OE5RelJWNjFLRzE5dDNwc2JCdGNsYnJBaHJXekhMbjVqRks2cnFUTjlPSVJr?=
 =?utf-8?B?OXJGc0xsb2ZHZlk3L3hzVHZ6U29pVEplMFU5QnlTU0p5eFUrMXd5OFg5MHlP?=
 =?utf-8?B?NnFiaWxMSWwxbHJZU1J3ZlFSUWRhUHNLWXUzL0lMUUlZd3BlUmUrd0dZbWs5?=
 =?utf-8?B?MHVYZmNENmJWMnppUkRJb3FCNzhXcktrUUxZeVUzdDd3eUk4a3d6VFZOYjM2?=
 =?utf-8?B?V24xdDQxbUFOQnFYZWRUbXpSR2hidEFXRnpDakVwMnBOMFV1TE0xT2tvVEk0?=
 =?utf-8?B?ZHo5c3ZUWHQ4eDIyVTJyMERsRy9KU1lyT3JGRHV1MWppK2NvSGJrRmJ0UkZV?=
 =?utf-8?B?dDJiUE1SQnJnRnZnOHZUd1ZDc3piWGQvZWFuYkxUbktDZVFoZ2lQaktmK3lQ?=
 =?utf-8?B?TFJwSy9oL0RZaW9Bc1h6VmZHV0pWbWFyMGhrN3VXb3NOeW90aENXS2UydGls?=
 =?utf-8?B?ZDNqVHdSK0EvT05UZnRObTQxazBUUVJnK0hReUVnTDZOeDFpVFNKYk9iTFRi?=
 =?utf-8?B?R29FczhZR2ZPR3JLK2NORGpBU0tBRk9xakVJYkx6Y3pWUGFXYVY3dFR1UWZi?=
 =?utf-8?B?T1pzQWx6TmExY2ExZFRYZzdybytFcFRHcmdYRStTV3dIVEIvY1d0cVBuNVIz?=
 =?utf-8?B?N2xoME5pSVF2YWRzQ0MwZXBpc1NlS1pIcnJIQWFkMXNpb2NEVFZiczY4bExF?=
 =?utf-8?B?RWtmbjZ0dVY4dzkvNHh4cTh2L1pqcjFsbmIweG9oWTZFVHhyN2N2eTFrZ3Qz?=
 =?utf-8?B?ZGQ1N1IrNEZ3aVQ3RWpRQTJGQ1JYS09UNnl0MERvNHhiclE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eHViSnQrcnlwK01tdW9iSzhRY1FmV0hQSmdObnd5QzNTQmwvTEU1M1lRL3pU?=
 =?utf-8?B?bUEvaS8yRkhLa24wdCtacnBPcTM2bEVGVG9GTTNBZnk4S3dwa3ZONXJRRFRS?=
 =?utf-8?B?dkE3MFphMHhZa3hVd2c0elZ6bHYzMElXR0hHRUY2TitYRjcxcUxpcEFZeFZB?=
 =?utf-8?B?eXhDQ21ULzN1WUtnWFAwTmEvUE5USHUzNVRLVlBFem5Yb1ZreU5GRWFGQ2FO?=
 =?utf-8?B?dG5PdWZyT2pUVXpJVjZCMFhmRGV2VkVFMTVuVWZKL0ZPTlBkd2lGU3VvN1gr?=
 =?utf-8?B?enIyc2lZYTBDaFVKdzZ0cG9vNWJOd003YndHMi9PajdxZitEVGIxNE1IQTRP?=
 =?utf-8?B?S2kwQUNET3RRTy9YLzVXM2VuRFM3L1JLa2cxRjVFMVlYYklVYzd4UHMzZisz?=
 =?utf-8?B?NkJ1SWZDc1YweFZVeklucUpObDdCV09Va1g1N21iVkZkMGZsZEo3Ull1VkVN?=
 =?utf-8?B?MzBMTzBUamlTZUZDWUo3dmZVR2J5a1dQR0VTL1d3ZjBhRS9zVVd5RS82TWs0?=
 =?utf-8?B?dE9WelVZSmw5LzhKVENqc0dveDJRMDA0N1pKNEhUUVllMTdMRk5NdVB3TGVI?=
 =?utf-8?B?OUwvNWZVbyt4ZzI4SFd2SzRrRXdDWUJ4YmFUcE1ITDdXQWV2MVRMdXZqdXBF?=
 =?utf-8?B?MnVLMnV2NjlLSkdFZUJKbFpHM0ljL3RhSkl5U0dZMzNXMDFVRUJnTUU3bWpR?=
 =?utf-8?B?aW9PUEY2SEFoSnhNb045Sy9CcmlZZ3RONzc5RzhMNTdiYzNRTEE0Y1k2LzF6?=
 =?utf-8?B?Q1hpRGJjWHRqaE1DUGEvSkR5VDAwUDI5ZGVOT3FjTVQ1a2pUOUpaNGFKMTFw?=
 =?utf-8?B?SW5KZkl5SFNSUmt5eCt4NkxLWlFTQm83cW9pMjBER2NqK05MM2Z1eUI0TEVF?=
 =?utf-8?B?VmltaUJETTkxMGx3amxNdjFydnBoaTVmMDVGblN1cEF0dmtQMG1VSGU2dHJ5?=
 =?utf-8?B?aXNWWUtaeFgwbWxWU2hGL2Ewb3dDc2dkZytyeEpXdjZaQTAxUzNyeTMrZ0tX?=
 =?utf-8?B?VEZoZExRSW9FQldwRXJVNk53bXNuRFNBTzdXN1psVmtZbENidnBYbnhLMzZ6?=
 =?utf-8?B?VXh2RGovQTV3MXVIeG1OWDJwdFRUUyt2TkZGM0xZSXB6dGxTMGUwZGc0bU13?=
 =?utf-8?B?QVZPOEhKSDlMY2cvOTBTcWJRV0F6T3BXbGFZenFvTU5zaC9rMlB4NWNhc0V3?=
 =?utf-8?B?ZFJtaGE1M3drQ1drSzhEL2FZNlZFb29YZzhWcTlGdmN4TnNyMVlzc3dMWkVk?=
 =?utf-8?B?ZFNqUG9KZVAyQnFPZzBqS1cvL1NaRHFEZTNZcWx3UzdVSmtXRTRaU0V1ckN2?=
 =?utf-8?B?VVhINmp1YjI0VEhXYTNZUEtOTXV0Rnc3bVd5MmVTaTM5d0hGVzBUbDBzVER3?=
 =?utf-8?B?WGFSaTM2c3M3dmZNZVhMUWp2RUFWaTZjUlpvWnpxRzN1MG44WjQ2WlV3TlRV?=
 =?utf-8?B?VUhFaU8vSWNqVkNIbkhKeTVPMTlLWXdYbHI1c0NnSDZoeFJYbnBUVHBOWGVU?=
 =?utf-8?B?UnU0T3BuanFTeTJJSTlzYktKTGVYdDNRTS9rWVhXRGk2c0tSS1pVRm9rREQw?=
 =?utf-8?B?N0pybUNRQkRZNVFUZ0VNeGk2MnhzLzJtclBlUHF0THlXWkdWVzJtVnJTVFlv?=
 =?utf-8?B?MFhBc2U5VWJtMjhOak5KaXdncGR1YmU3OXJkUFdjMFIrYWhIMkorRzJuc3Bu?=
 =?utf-8?B?RnY4dWhaUlh5ZE9zbjNPQTFwaDFQakR0QUxRUWFUK3NKS25DQWVkN3hQL0pJ?=
 =?utf-8?B?dUErS2V2WDV5M3I4d1Vjbjc0NUlEYTRDcXR0ZTlod25UMENwdGE4TXFOdjQ3?=
 =?utf-8?B?WnkrdzJWVlczbjA4WGxOdktEQ0s5S2lFdm00OXpkSWxicmdQNlVQdGJ4b0d5?=
 =?utf-8?B?VFhMbEtnbVQ5SG5uU3NLOUtNOEVUc0lDd0RaREJORnNNN0ltT2d5c0xzbTU0?=
 =?utf-8?B?OHBaeEdZUUZQenlpY2VHNGNhZG80cFlQVlJHKzc5UHduYi9FZTZhaWRKYnY0?=
 =?utf-8?B?aWk5dEsxOExJM2h0UmIxZnlUblVhRnYxS2pZYXJNOXJ3VjlMbjNiYmFNVit6?=
 =?utf-8?B?M1JtbEJ5bHg3WXdPblBPUmR6ZjZ1MHJEWFJEclBGZk53dFJEcm5MY2svNEUv?=
 =?utf-8?Q?P9pw=3D?=
Content-Type: text/plain; charset="utf-8"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 106886c2-df36-4dc5-7672-08dd45afbf2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 06:38:48.4984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FCIN/3/3/Zaosd2zMfvl816+tA9SydGngEH/ES+qyVdXMe2P2M14Z7X3S7s8GangKu59IWEB7VXP7WrGwnBehw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5353

SGkgR3JlZywgRGFuLEpvbiwgb3RoZXIga2VybmVsIGV4cGVydHM6DQoNCj4gT24gVHVlLCBKYW4g
MjEsIDIwMjUgYXQgMTI6MTk6MzdQTSArMDAwMCwgSm9uIEh1bnRlciB3cm90ZToNCj4gPiA+ID4g
PiBbwqDCoCA1OS45MTgxNzddIHRlZ3JhLXh1ZGMgMzU1MDAwMC51c2I6IGVwIDMgZGlzYWJsZWQg
Ww0KPiA+ID4gPiA+IDU5LjkyMzA5N10gdGVncmEteHVkYyAzNTUwMDAwLnVzYjogZXAgMiBkaXNh
YmxlZCBbwqDCoCA1OS45Mjc5NTVdDQo+ID4gPiA+ID4gdGVncmEteHVkYyAzNTUwMDAwLnVzYjog
ZXAgNSBkaXNhYmxlZCBbwqDCoCA4MC45MTE0MzJdIHJjdTogSU5GTzoNCj4gPiA+ID4gPiByY3Vf
cHJlZW1wdCBzZWxmLWRldGVjdGVkIHN0YWxsIG9uIENQVSBbwqDCoCA4MC45MTczNTRdIHJjdToN
Cj4gPiA+ID4gPiA2LS4uLi46ICg1MjQ4IHRpY2tzIHRoaXMgR1ApDQo+ID4gPiA+ID4gaWRsZT1l
YzI0LzEvMHg0MDAwMDAwMDAwMDAwMDAwIHNvZnRpcnE9MTIxMy8xMjEzIGZxcz0yNjIzIFsNCj4g
PiA+ID4gPiA4MC45MjcxNDZdIHJjdTrCoMKgwqDCoCAodD01MjUzIGppZmZpZXMgZz0zNzgxIHE9
MTQ5MCBuY3B1cz0xMikgWw0KPiA+ID4gPiA+IDgwLjkzMjcwNF0gU2VuZGluZyBOTUkgZnJvbSBD
UFUgNiB0byBDUFVzIDI6DQo+ID4gPiA+ID4gW8KgwqAgOTAuOTgxNTU1XSBDUFU6IDYgVUlEOiAw
IFBJRDogMTggQ29tbTogcmN1X2V4cF9ncF9rdGhyIE5vdA0KPiA+ID4gPiA+IHRhaW50ZWQgNi4x
My4wLXJjNy0wMDA0My1nNjE5ZjBiNmZhZDUyICMxIFvCoMKgIDkwLjk4MTU1OF0NCj4gPiA+ID4g
PiBIYXJkd2FyZSBuYW1lOiBOVklESUEgTlZJRElBIEpldHNvbiBBR1ggT3JpbiBEZXZlbG9wZXIN
Cj4gPiA+ID4gPiBLaXQvSmV0c29uLCBCSU9TIDAwLjAuMC1kZXYtbWFpbl85MmU1YWVfODhmZDFf
Mjk2ZGUNCj4gPiA+ID4gPiAxMi8xNi8yMDI0DQo+ID4gPiA+ID4gW8KgwqAgOTAuOTgxNTU5XSBw
c3RhdGU6IDgwNDAwMDA5IChOemN2IGRhaWYgK1BBTiAtVUFPIC1UQ08gLURJVA0KPiA+ID4gPiA+
IC1TU0JTIEJUWVBFPS0tKSBbwqDCoCA5MC45ODE1NjJdIHBjIDoNCj4gPiA+ID4gPiBzbXBfY2Fs
bF9mdW5jdGlvbl9zaW5nbGUrMHhkYy8weDFhMA0KPiA+ID4gPiA+IFvCoMKgIDkwLjk4MTU3NF0g
bHIgOiBfX3N5bmNfcmN1X2V4cF9zZWxlY3Rfbm9kZV9jcHVzKzB4MjI4LzB4M2MwDQo+ID4gPiA+
ID4gW8KgwqAgOTAuOTgxNTc4XSBzcCA6IGZmZmY4MDAwODJlYjNjZDAgW8KgwqAgOTAuOTgxNTc5
XSB4Mjk6DQo+ID4gPiA+ID4gZmZmZjgwMDA4MmViM2NkMCB4Mjg6IDAwMDAwMDAwMDAwMDAwMTAg
eDI3Og0KPiA+ID4gPiA+IGZmZmYwMDAwODAyOTMzYzANCj4gPiA+ID4gPiBbwqDCoCA5MC45ODE1
ODJdIHgyNjogZmZmZjAwMDdhOGExZDcwMCB4MjU6IGZmZmY4MDAwODI4OTU1MDAgeDI0Og0KPiA+
ID4gPiA+IGZmZmY4MDAwODAxMzIwMTgNCj4gPiA+ID4gPiBbwqDCoCA5MC45ODE1ODRdIHgyMzog
MDAwMDAwMDAwMDAwMDAxNCB4MjI6IGZmZmY4MDAwODFmYjc3MDAgeDIxOg0KPiA+ID4gPiA+IGZm
ZmY4MDAwODI4MGQ5NzANCj4gPiA+ID4gPiBbwqDCoCA5MC45ODE1ODZdIHgyMDogMDAwMDAwMDAw
MDAwMGZlYiB4MTk6IGZmZmY4MDAwODJlYjNkMDAgeDE4Og0KPiA+ID4gPiA+IDAwMDAwMDAwMDAw
MDAwMDANCj4gPiA+ID4gPiBbwqDCoCA5MC45ODE1ODhdIHgxNzogMDAwMDAwMDAwMDAwMDAwMCB4
MTY6IDAwMDAwMDAwMDAwMDAwMDAgeDE1Og0KPiA+ID4gPiA+IDAwMDAwMDAwMDAwMDAwMDANCj4g
PiA+ID4gPiBbwqDCoCA5MC45ODE1OTBdIHgxNDogZmZmZjAwMDA4MDI5MzQ0MCB4MTM6IDAwMDAw
MDAwMDAwMDAwMDEgeDEyOg0KPiA+ID4gPiA+IDAwMDAwMDAwMDAwMDAwMDANCj4gPiA+ID4gPiBb
wqDCoCA5MC45ODE1OTFdIHgxMTogZmZmZjgwMDA4MWZiMjM4OCB4MTA6IGZmZmYwMDAwODAyOTMz
YzAgeDkgOg0KPiA+ID4gPiA+IDAwMDAwMDAwMDAwMDAwMDENCj4gPiA+ID4gPiBbwqDCoCA5MC45
ODE1OTNdIHg4IDogMDAwMDAwMDAwMDAwMDA0MCB4NyA6IDAwMDAwMDAwMDAwMTcwNjggeDYgOg0K
PiA+ID4gPiA+IGZmZmY4MDAwODAxMzIwMTgNCj4gPiA+ID4gPiBbwqDCoCA5MC45ODE1OTVdIHg1
IDogMDAwMDAwMDAwMDAwMDAwMCB4NCA6IGZmZmYwMDA3YThhNGY5YzggeDMgOg0KPiA+ID4gPiA+
IDAwMDAwMDAwMDAwMDAwMDENCj4gPiA+ID4gPiBbwqDCoCA5MC45ODE1OTddIHgyIDogMDAwMDAw
MDAwMDAwMDAwMCB4MSA6IGZmZmYwMDA3YThhNGY5YzAgeDAgOg0KPiA+ID4gPiA+IDAwMDAwMDAw
MDAwMDAwMDQNCj4gPiA+ID4gPiBbwqDCoCA5MC45ODE1OTldIENhbGwgdHJhY2U6DQo+ID4gPiA+
ID4gW8KgwqAgOTAuOTgxNjAxXcKgIHNtcF9jYWxsX2Z1bmN0aW9uX3NpbmdsZSsweGRjLzB4MWEw
IChQKSBbDQo+ID4gPiA+ID4gOTAuOTgxNjA1XcKgIF9fc3luY19yY3VfZXhwX3NlbGVjdF9ub2Rl
X2NwdXMrMHgyMjgvMHgzYzANCj4gPiA+ID4gPiBbwqDCoCA5MC45ODE2MDddwqAgc3luY19yY3Vf
ZXhwX3NlbGVjdF9jcHVzKzB4MTNjLzB4MmEwDQo+ID4gPiA+ID4gW8KgwqAgOTAuOTgxNjA5XcKg
IHdhaXRfcmN1X2V4cF9ncCsweDE4LzB4MzAgW8KgwqAgOTAuOTgxNjExXQ0KPiA+ID4gPiA+IGt0
aHJlYWRfd29ya2VyX2ZuKzB4ZDAvMHgxODggW8KgwqAgOTAuOTgxNjE0XcKgIGt0aHJlYWQrMHgx
MTgvMHgxMWMNCj4gPiA+ID4gPiBbwqDCoCA5MC45ODE2MTldwqAgcmV0X2Zyb21fZm9yaysweDEw
LzB4MjAgW8KgIDEwMS40MTYzNDddIHNjaGVkOiBETA0KPiA+ID4gPiA+IHJlcGxlbmlzaCBsYWdn
ZWQgdG9vIG11Y2gNCj4gPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBPZGQsIHlvdSBoYXZlIGEg
dXNiLXNlcmlhbCBnYWRnZXQgZGV2aWNlIGluIHRoaXMgc3lzdGVtIHRoYXQgaXMNCj4gPiA+ID4g
ZGlzY29ubmVjdGluZyBzb21laG93P8KgIFRoYXQgb29wcyBkb2Vzbid0IHBvaW50IHRvIGFueXRo
aW5nIGluIHRoZQ0KPiA+ID4gPiB1c2IgZ2FkZ2V0IGNvZGViYXNlLCAiYWxsIiB3ZSBoYXZlIGRv
bmUgaXMgbW92ZSB0aGUgY2FsbCB0bw0KPiA+ID4gPiBzaHV0ZG93biB0aGUgZW5kcG9pbnRzIHRv
IGVhcmxpZXIgaW4gdGhlIGRpc2Nvbm5lY3QgZnVuY3Rpb24uDQo+ID4gPg0KPiA+ID4gWWVzIHRo
ZSBib2FyZCBzdGFydHMgdXNiLXNlcmlhbCBhbmQgdXNiLWV0aGVybmV0IGdhZGdldCBhbmQgb24N
Cj4gPiA+IHJlYm9vdCB3aGVuIHRlYXJpbmcgaXQgZG93biBJIGFtIHNlZWluZyB0aGUgYWJvdmUu
IEFzIHNvb24gYXMgaXQNCj4gPiA+IGRpc2FibGVzIHRoZSB0ZWdyYS14dWRjIGVuZHBvaW50cyAo
YXMgc2VlbiBhYm92ZSkgdGhlIGJvYXJkIGFwcGVhcnMgdG8NCj4gc3RhbGwuDQo+ID4gPg0KPiA+
ID4gPiBJJ20gZ2xhZCB0byByZXZlcnQgdGhpcywgYnV0IGl0IGZlZWxzIHJlYWxseSBvZGQgdGhh
dCB0aGlzIGlzDQo+ID4gPiA+IGNhdXNpbmcgeW91IGFuIHJjdSBzdGFsbCBpc3N1ZS4NCj4gPiA+
DQo+ID4gPiBUaGFua3MuIEkgY2FuJ3Qgc2F5IEkgdW5kZXJzdGFuZCBpdCBlaXRoZXIsIGJ1dCBJ
IGFtIGNlcnRhaW4gaXQgaXMNCj4gPiA+IGNhdXNlZCBieSB0aGlzIGNoYW5nZS4NCj4gPiA+DQo+
ID4gPiBIYXBweSB0byBydW4gYW55IHRlc3RzIHRvIG5hcnJvdyB0aGlzIGRvd24gYSBiaXQuDQo+
ID4NCj4gPg0KPiA+IEkgZGlkIGEgYml0IG1vcmUgbG9va2luZyBhdCB0aGlzIGFuZCBJIHNlZSB0
aGF0IHdlIHNldHVwIGEgVVNCIGdhZGdldA0KPiA+IGRldmljZSB2aWEgdGhlIGNvbmZpZ2ZzIGFz
IGRlc2NyaWJlZCBpbiB0aGlzIGRvYyBbMF0uIFRoZSBSQ1Ugc3RhbGwNCj4gPiBvY2N1cnMgd2hl
biB3ZSBhdHRlbXB0IHRvIGRpc2FibGUgdGhlIGdhZGdldCBvbiBzaHV0ZG93biBieSAuLi4NCj4g
Pg0KPiA+ICAkIGVjaG8gIiIgPiAvcGF0aC90by9VREMNCj4gPg0KPiA+IEpvbg0KPiA+DQo+ID4g
WzBdIGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL3VzYi9nYWRnZXRfY29uZmlnZnMuaHRtbA0KPiAN
Cj4gSXQncyBhbiBSQ1Ugc3RhbGwgc28gaXQncyBwcm9iYWJseSBhIGxvY2tpbmcgYnVnLiAgVGhl
IG9yaWdpbmFsIGNvZGUgZHJvcHBlZCB0aGUNCj4gcG9ydC0+cG9ydF9sb2NrLCBjYWxsZWQgdXNi
X2VwX2Rpc2FibGUoKSB0aGVuIHRvb2sgdGhlIGxvY2sgYWdhaW4uICBUaGVyZQ0KPiBtdXN0IGhh
dmUgYmVlbiBhIHJlYXNvbiB0byBkcm9wIHRoZSBsb2NrIGFsdGhvdWdoIEkgaGF2ZW4ndCBmb3Vu
ZCBpdCB5ZXQuDQo+IFRoZSBuZXcgY29kZSBtb3ZlZCB0aGUgdXNiX2VwX2Rpc2FibGUoKSB1bmRl
ciB0aGUgbG9jay4NCj4gDQo+ICAgMTQzMSAgICAgICAgICBwb3J0LT5zdXNwZW5kZWQgPSBmYWxz
ZTsNCj4gICAxNDMyICAgICAgICAgIHNwaW5fdW5sb2NrKCZwb3J0LT5wb3J0X2xvY2spOw0KPiAg
IDE0MzMgICAgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmc2VyaWFsX3BvcnRfbG9jaywg
ZmxhZ3MpOw0KPiAgIDE0MzQNCj4gICAxNDM1ICAgICAgICAgIC8qIGRpc2FibGUgZW5kcG9pbnRz
LCBhYm9ydGluZyBkb3duIGFueSBhY3RpdmUgSS9PICovDQo+ICAgMTQzNiAgICAgICAgICB1c2Jf
ZXBfZGlzYWJsZShnc2VyLT5vdXQpOw0KPiAgIDE0MzcgICAgICAgICAgdXNiX2VwX2Rpc2FibGUo
Z3Nlci0+aW4pOw0KPiAgIDE0MzgNCj4gICAxNDM5ICAgICAgICAgIC8qIGZpbmFsbHksIGZyZWUg
YW55IHVudXNlZC91bnVzYWJsZSBJL08gYnVmZmVycyAqLw0KPiAgIDE0NDAgICAgICAgICAgc3Bp
bl9sb2NrX2lycXNhdmUoJnBvcnQtPnBvcnRfbG9jaywgZmxhZ3MpOw0KPiAgIDE0NDEgICAgICAg
ICAgaWYgKHBvcnQtPnBvcnQuY291bnQgPT0gMCkNCj4gICAxNDQyICAgICAgICAgICAgICAgICAg
a2ZpZm9fZnJlZSgmcG9ydC0+cG9ydF93cml0ZV9idWYpOw0KPiANCj4gDQo+IEl0IG1pZ2h0IGhl
bHAgdG8gdHJ5IHRlc3RpbmcgYWdhaW4gd2l0aCBsb2NrZGVwIGVuYWJsZWQuDQo+IA0KDQpUbyBz
b2x2ZSB0aGlzIHByb2JsZW0sIEkgcGxhbiB0byByZWZlciB0byB0aGUgbWV0aG9kcyBpbiBnc2Vy
aWFsX3N1c3BlbmQgYW5kIGdzZXJpYWxfcmVzdW1lIGZ1bmN0aW9ucw0KYW5kIHVzZSBzcGluIGxv
Y2sgdG8gc29sdmUgdGhlIGNvbXBldGl0aW9uIGJldHdlZW4gZ3NfcmVhZF9jb21wbGV0ZSBhbmQg
Z3NlcmlhbF9kaXNjb25uZWN0Lg0KDQpUaGUgcGF0Y2ggaXMgYXMgZm9sbG93czoNCg0KQ29uc2lk
ZXJpbmcgdGhhdCBpbiBzb21lIGV4dHJlbWUgY2FzZXMsIHdoZW4gdGhlIHVuYmluZCBvcGVyYXRp
b24NCmlzIGJlaW5nIGV4ZWN1dGVkLCBnc2VyaWFsX2Rpc2Nvbm5lY3QgaGFzIGFscmVhZHkgY2xl
YXJlZCBnc2VyLT5pb3BvcnQsDQp0cmlnZ2VyaW5nIGEgZ2FkZ2V0IHJlY29uZmlndXJhdGlvbiBh
dCB0aGlzIHRpbWUgYW5kIGdzX3JlYWRfY29tcGxldGUNCmdldHMgY2FsbGVkIGFmdGVyd2FyZHMs
IHdoaWNoIHJlc3VsdHMgaW4gYWNjZXNzaW5nIG51bGwgcG9pbnRlciwNCmFkZCBhIG51bGwgcG9p
bnRlciBjaGVjayB0byBwcmV2ZW50IHRoaXMgc2l0dWF0aW9uLg0KDQpBZGRlZCBhIHN0YXRpYyBz
cGlubG9jayB0byBwcmV2ZW50IGdzZXItPmlvcG9ydCBmcm9tIGJlY29taW5nDQpudWxsIGFmdGVy
IHRoZSBuZXdseSBhZGRlZCBjaGVjay4NCg0KQ2FsbCB0cmFjZToNCiBnc19yZWFkX2NvbXBsZXRl
KzB4NTgvMHgyNDANCiB1c2JfZ2FkZ2V0X2dpdmViYWNrX3JlcXVlc3QrMHg0MC8weDE2MA0KIGR3
YzNfcmVtb3ZlX3JlcXVlc3RzKzB4MTcwLzB4NDg0DQogZHdjM19lcDBfb3V0X3N0YXJ0KzB4YjAv
MHgxZDQNCiBfX2R3YzNfZ2FkZ2V0X3N0YXJ0KzB4MjVjLzB4NzIwDQoga3JldHByb2JlX3RyYW1w
b2xpbmUuY2ZpX2p0KzB4MC8weDgNCiBrcmV0cHJvYmVfdHJhbXBvbGluZS5jZmlfanQrMHgwLzB4
OA0KIHVkY19iaW5kX3RvX2RyaXZlcisweDFkOC8weDMwMA0KIHVzYl9nYWRnZXRfcHJvYmVfZHJp
dmVyKzB4YTgvMHgxZGMNCiBnYWRnZXRfZGV2X2Rlc2NfVURDX3N0b3JlKzB4MTNjLzB4MTg4DQog
Y29uZmlnZnNfd3JpdGVfaXRlcisweDE2MC8weDFmNA0KIHZmc193cml0ZSsweDJkMC8weDQwYw0K
IGtzeXNfd3JpdGUrMHg3Yy8weGYwDQogX19hcm02NF9zeXNfd3JpdGUrMHgyMC8weDMwDQogaW52
b2tlX3N5c2NhbGwrMHg2MC8weDE1MA0KIGVsMF9zdmNfY29tbW9uKzB4OGMvMHhmOA0KIGRvX2Vs
MF9zdmMrMHgyOC8weGEwDQogZWwwX3N2YysweDI0LzB4ODQNCg0KRml4ZXM6IGMxZGNhNTYyYmU4
YSAoInVzYiBnYWRnZXQ6IHNwbGl0IG91dCBzZXJpYWwgY29yZSIpDQpDYzogc3RhYmxlQHZnZXIu
a2VybmVsLm9yZw0KU3VnZ2VzdGVkLWJ5OiBQcmFzaGFudGggSyA8cXVpY19wcmFzaGtAcXVpY2lu
Yy5jb20+DQpTaWduZWQtb2ZmLWJ5OiBMaWFucWluIEh1IDxodWxpYW5xaW5Adml2by5jb20+DQoN
CiBkcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vdV9zZXJpYWwuYyB8IDE3ICsrKysrKysrKysr
KysrLS0tDQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
DQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vdV9zZXJpYWwuYyBi
L2RyaXZlcnMvdXNiL2dhZGdldC9mdW5jdGlvbi91X3NlcmlhbC5jDQppbmRleCAwYThjMDViMjc0
NmIuLjZmMmM5NzE1ZThkZiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvdXNiL2dhZGdldC9mdW5jdGlv
bi91X3NlcmlhbC5jDQorKysgYi9kcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vdV9zZXJpYWwu
Yw0KQEAgLTQ1NiwxMyArNDU2LDI0IEBAIHN0YXRpYyB2b2lkIGdzX3J4X3B1c2goc3RydWN0IHdv
cmtfc3RydWN0ICp3b3JrKQ0KIA0KIHN0YXRpYyB2b2lkIGdzX3JlYWRfY29tcGxldGUoc3RydWN0
IHVzYl9lcCAqZXAsIHN0cnVjdCB1c2JfcmVxdWVzdCAqcmVxKQ0KIHsNCi0Jc3RydWN0IGdzX3Bv
cnQJKnBvcnQgPSBlcC0+ZHJpdmVyX2RhdGE7DQorCXN0cnVjdCBnc19wb3J0CSpwb3J0Ow0KKwl1
bnNpZ25lZCBsb25nICBmbGFnczsNCisNCisJc3Bpbl9sb2NrX2lycXNhdmUoJnNlcmlhbF9wb3J0
X2xvY2ssIGZsYWdzKTsNCisJcG9ydCA9IGVwLT5kcml2ZXJfZGF0YTsNCisNCisJaWYgKCFwb3J0
KSB7DQorCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZzZXJpYWxfcG9ydF9sb2NrLCBmbGFncyk7
DQorCQlyZXR1cm47DQorCX0NCiANCi0JLyogUXVldWUgYWxsIHJlY2VpdmVkIGRhdGEgdW50aWwg
dGhlIHR0eSBsYXllciBpcyByZWFkeSBmb3IgaXQuICovDQogCXNwaW5fbG9jaygmcG9ydC0+cG9y
dF9sb2NrKTsNCisJc3Bpbl91bmxvY2soJnNlcmlhbF9wb3J0X2xvY2spOw0KKw0KKwkvKiBRdWV1
ZSBhbGwgcmVjZWl2ZWQgZGF0YSB1bnRpbCB0aGUgdHR5IGxheWVyIGlzIHJlYWR5IGZvciBpdC4g
Ki8NCiAJbGlzdF9hZGRfdGFpbCgmcmVxLT5saXN0LCAmcG9ydC0+cmVhZF9xdWV1ZSk7DQogCXNj
aGVkdWxlX2RlbGF5ZWRfd29yaygmcG9ydC0+cHVzaCwgMCk7DQotCXNwaW5fdW5sb2NrKCZwb3J0
LT5wb3J0X2xvY2spOw0KKwlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZwb3J0LT5wb3J0X2xvY2ss
IGZsYWdzKTsNCiB9DQogDQogc3RhdGljIHZvaWQgZ3Nfd3JpdGVfY29tcGxldGUoc3RydWN0IHVz
Yl9lcCAqZXAsIHN0cnVjdCB1c2JfcmVxdWVzdCAqcmVxKQ0KLS0gDQoyLjM5LjANCg0KUGxlYXNl
IGFzayBMaW51eCBrZXJuZWwgZXhwZXJ0cyB0byBoZWxwIGV2YWx1YXRlIHdoZXRoZXIgaXQgaXMg
ZmVhc2libGUuDQoNClRoYW5rcw0K

