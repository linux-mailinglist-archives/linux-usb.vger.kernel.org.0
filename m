Return-Path: <linux-usb+bounces-38113-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJt8ER19F2qqGggAu9opvQ
	(envelope-from <linux-usb+bounces-38113-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 01:24:13 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9455EAE90
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 01:24:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 816C030602AB
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 23:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43C53CCFA8;
	Wed, 27 May 2026 23:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Sgh+n9n2";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fsX+q8d0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZOIUs41y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F81A3B5F50;
	Wed, 27 May 2026 23:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779924232; cv=fail; b=YHxIPs1F5FWdyL5p45fi6kWCb4SYHFNGnnJl91Avb9oeJwehSlGxYpWoxkyZQhTacSyvCGGcswzWV8VmHJBNVxZ+DSq54bWvNvdaPqmkBrFw+ksCetgJ8HfJAlR8AA6Juizcc7SWR3KYovf1HKCEHt5rJCmjtI1uGzkYS6Cg5BE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779924232; c=relaxed/simple;
	bh=/INNycSmQQEyaCY6Gs5NX0xnfRXYyTw9paN0fjKTlco=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qw9UOGfQamOcwQgXeDuERjBlsSyr5TEZl3zda/V4VAP4BokcGaYfLgO0AuSDihLoIMp/cVmCVIeOVsTsN/b5A+M/Jf9cAOtx7NZuynw8jI3CYRhiTjgC0n5yFi9yapQHVy+mbYxvJ9Wnp8sYF14JN4+rEY/JdVlB33QxLdh2Hcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Sgh+n9n2; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=fsX+q8d0; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ZOIUs41y reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RMlRPC2656573;
	Wed, 27 May 2026 16:23:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=/INNycSmQQEyaCY6Gs5NX0xnfRXYyTw9paN0fjKTlco=; b=
	Sgh+n9n2OU2CRZEkk8LHmE2a/v5oy/kaAluXP1St5WLRlP2+1CJuzIQ1lrd7CRsg
	ZP4eTTqqJdvORcTyNtpkFyVb9DRnToSZLjWdLsV195ptuFxWHx72KI6+buGPLEIb
	WQUi9EvclCzWC2odzpQmA3v90Jpj5e4rmGLCTNuFvVqEUfP3GsbxXauv6ZqBlGeq
	GaCb9QNTK6jeFvIRsCrTGrS0FE1/Lym4N9qM4UJrOG5Oj6iSQpNLnyIQ2hkCL8DZ
	BgvkZqrpEaeIj7/zs1lnHWwsWSFNzLUuBHb07jIjW3LnOOmYzj+pTkgsAyF47bfB
	lBTUtFcsF4CPZ6hqlGgWrA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4ee7xr8nbn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 27 May 2026 16:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1779924219; bh=/INNycSmQQEyaCY6Gs5NX0xnfRXYyTw9paN0fjKTlco=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=fsX+q8d0notaBpOCS3N1suFLrKAu2wz+1r1vrTSlcYRQ0rqKS2cO8NiabaZ8vwMSL
	 67KMA7/SRkk0PtLxP2CCgt2ZXP+JSfrDTS9c1by8cgWaQ0Lvhwm57VAEaW43jAIe5y
	 BDr3DQoo8Oqp7q1e39Y8HyuEfz8xVK6etRpVOfIV8ac+D7MCmHeFLfOhG/gVGJl+Le
	 GyPi25Jx8BXcGgHxmmIbooFlZx6xc9I2k4XTD95Cz3vS+jleYIGvngs+LxM57nhobX
	 6uOHfXKYL9t+736XmX5FDEo5cvJIPbBnqQc14cdDg3yA2r7xMCF/L/ig+sYaFV1lCq
	 nXGc/q07jSnZw==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 70FDA40340;
	Wed, 27 May 2026 23:23:39 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id EC339A0073;
	Wed, 27 May 2026 23:23:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ZOIUs41y;
	dkim-atps=neutral
Received: from CH4PR07CU001.outbound.protection.outlook.com (mail-ch4pr07cu00100.outbound.protection.outlook.com [40.93.20.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2DA2A4035F;
	Wed, 27 May 2026 23:23:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gqbw8euPhL0Vx7tX/Tm/paUea5EhgzRloBvJXeg1UDT67Nlg432SbnKHLASDvzHP0IchS+Kv/UN5RZE35wNjqQ4+lt+iSP4d12WVgaKQt/oqfGjWbTJTJT1h6lNdRoM79K3GDRURhWOyZcJv/bI3Nl6LU3rZSR2NX5MBXpMuM7d+89WPDOrE1+oTkjVc7PVGRbjpfJWmm65Y8BC0JAp8U3C2NbA2NimjzQm64ii8n2/icPgxWMkgW2Ewk8IoP5hhsIhBisAvOfHGHQhz8lw5jVvGcc/NF1OrziIycPaTF20/mQuBQChZsE81nmBqOy/3X8/sUWe6RiefYgy0FvNzyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/INNycSmQQEyaCY6Gs5NX0xnfRXYyTw9paN0fjKTlco=;
 b=jdY9wv6PYaHzTsZKIjiFaH8wGlEpxK8XfMWfUuaILwiO5N2C+08WOwVm2fTDWWJCaHo8kI0PEHrkdAxnE1Gngu2+r9ruJuFfhNse0S3vKcB1osGVNBrvHocn8wrrcYPzi5H4TsuX6pdWBSGPeytyGkQQ4AHFYbSspLzmYUPYEL6kYwf+RLg97UJxyxuhdB0/9eti/4eJdAL2ANiUGpV9CgD9uwYUBhaqJV+hWuNGo5fUAqvNHdVtNxdkctCuRbF4m6OzgfVDHKTSQi3BnIBU6aFOJS+aC/458JA9qOkMF1Vz28qFNV72ikd8r4i7MYDHMn7FQPdU1V1ubxQlEtBMag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/INNycSmQQEyaCY6Gs5NX0xnfRXYyTw9paN0fjKTlco=;
 b=ZOIUs41yAS5npOU2iccIaqe8+TZEa/B57l3/lzxRVVd/N3d1ihtvvYUfxH8e449qxMCPs338pVsQP/s6ocwWkv4hICE3RDAoY4HQjguN20m1wRp2mD1e7gNH80QIV6SAAoHIPIUjxdqTvgGnGzXIqZMOOvF/eUbxr34hBdfkR60=
Received: from CHXPR12MB999220.namprd12.prod.outlook.com
 (2603:10b6:610:2fd::7) by CY8PR12MB8410.namprd12.prod.outlook.com
 (2603:10b6:930:6d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 23:23:32 +0000
Received: from CHXPR12MB999220.namprd12.prod.outlook.com
 ([fe80::c13f:e49a:47dc:5c61]) by CHXPR12MB999220.namprd12.prod.outlook.com
 ([fe80::c13f:e49a:47dc:5c61%6]) with mapi id 15.21.0025.020; Wed, 27 May 2026
 23:23:32 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jack.pham@oss.qualcomm.com" <jack.pham@oss.qualcomm.com>,
        "wesley.cheng@oss.qualcomm.com" <wesley.cheng@oss.qualcomm.com>
Subject: Re: [PATCH v2] usb: dwc3: avoid probe deferral when USB power supply
 is not available
Thread-Topic: [PATCH v2] usb: dwc3: avoid probe deferral when USB power supply
 is not available
Thread-Index: AQHc7T274Ga5YHY2Bk2+/jibW2dGerYihSwA
Date: Wed, 27 May 2026 23:23:32 +0000
Message-ID: <ahdzhu-wahIyD7eR@vbox>
References: <20260526183016.3501307-1-elson.serrao@oss.qualcomm.com>
In-Reply-To: <20260526183016.3501307-1-elson.serrao@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CHXPR12MB999220:EE_|CY8PR12MB8410:EE_
x-ms-office365-filtering-correlation-id: 4a9f02a0-1636-4cef-09ac-08debc46f7bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|18002099003|4133799003|56012099006;
x-microsoft-antispam-message-info:
 3o1NUzw8VM5pKetB3N49o7EWJIAsCfq14YFc4eueeUgMRKs1YiUx0ACj8gLT1jywsmFGOADaRW9SNsIvNCW2blQm767ajrEveoRmgxPcG6Sa/OJ9jhR2YMA3H3R5Dqhc6NxdNTGGPx/dpFMhppEaA/cOd/ArzbLqSs+PcgKg5ZSA2pCsxuLbHZZWx0rqfjHadYd0AshFcDcq1flnjUilkFbvkpE3j7mntW0haUM6iG8IwFmx2mMq/S6iigIKNYvd9gEJ1QnVsNq7pI7eJB4PZRziR8u7N2fMmCHqY7tggsloMvSnZVvMEzN91suSO/gtQDH41pTLUqZdsHa/jJqnkn/mAuA47oQERLbNvwKyldp88n0Yh4Mtt34WhtbzI4rX26pxY8fXIjTTrN5m+auFr7ZpSbLIKEkX8lxw+17NbzGoJ/P9k4uOWpn/FameI03YHIza7pQSRFqKZ05+xzwC7XPd1odWuU2RRAdzAswHksZNGIuTYdM80gYXt2RWuZSsJ2OWFgPURevhlF1fPELyhQvNUHKA8hczVKu0UIJHbikrqxjiEr76WvK1F6sbYKce9v4alELBfqdy6EcWDAlq9cYFgWFSUsR3VU2qEHwqqXGUqK/Z/Wnsl5c3NQZQDdjZ+gtq0kDFW6hpnLPNBI+pA6WUjWIOPxVPvvWX5rE+01SJNzBL2OPTHbVUiNrN96EPXfZKNtPbkF+Nn2wXh04xLlyxn4pyS5Dum4tPCHEMzcBg9OqyTUaY7j9jUTn0bUo1
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHXPR12MB999220.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(18002099003)(4133799003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Zi9LOUk5czdYVy9CK25OMEZ2YitmR3JaSVNlRE54YUd3blZucjBJTk5ZM3l6?=
 =?utf-8?B?UWJsRnM0QS8wUlZWYndTOXArbGNvWEpyT242Q01uVlUrTVRHamdYM3dlOVdn?=
 =?utf-8?B?Qjc2MHB0b1ZaaFpDUzg0SnZNMmJGUlJFT0xlTm9zVG5mOWtNVjMwTEVKcFp5?=
 =?utf-8?B?TmE3UWZQOVZIajc2b2ZTeDQzSTU2QnR1Z0F5bVNXaTdHK245MitwVjNYLzVW?=
 =?utf-8?B?a3pxTEpzS0lVVnRNK1RiY0ZLTEJiU3BtaVJubFR1WGdqNFJ2R0dncGdiN241?=
 =?utf-8?B?dm5GRWlHWDdLV1dLTUV4OFcvcTljNElGakJlTGN2MzZzZXhuWXUwUExhM0J6?=
 =?utf-8?B?NjFjdXIvMHNvV2xCL1AyZHVnUFQ3N0NiZm10YWxsSTVqcjBLZGJUUDRnTzh0?=
 =?utf-8?B?MjB6SkJRb0w4SGJjYXJndWp1OFk1eFdueldsbmVmZEI1c2xKK1NHck8zczdy?=
 =?utf-8?B?Nko5YUpNbjZuQWswOXBXQ0NjcjdVdEpaalhWVFdBQnJLSjJjS1QwbkpYdnV1?=
 =?utf-8?B?clFKc2tsczVGYzllY2s0MUN4SmdLK1ExZFZuZDVpWk1DTnkzRUdpdWkySFZt?=
 =?utf-8?B?N25lekpGbUZsa1dVa0pyYlJYU2s2R2JFOW1ZejdoSG40TXR4c2c5VlE2RXJW?=
 =?utf-8?B?SWc2TFBzS3ZyQzJKbWdzNXpHMC9tcmhkMkwvVkluT1FiaDg2UkIwdU82ZHZ2?=
 =?utf-8?B?S0Z0UHlneDVIY2ZLMVdpRmF5SkpxL0U4alQ2b295WjdZZDhWb084aW5ZMXhX?=
 =?utf-8?B?bEx4VmNPRzVnT0pOWUlCMmhLbjlmc2lNcXdaczVBNVJIT2lteHlETjF5YXdp?=
 =?utf-8?B?c0paaUNIU1RhNlFJWWZVdTN6THk2SlVYK1lJUTBBTUlwY2ozT2ZEeHc1YUt4?=
 =?utf-8?B?dkd2YVI1MW4vNSszdmI4MGFWeit5Wjl3UlF6UDRqL3A2VVVrc1dWMHJYMWxQ?=
 =?utf-8?B?Q3EyMDkrdi9XM1ptcTJWdlpRdXArN3ZockcrdE9NbVlselhZVFpTRFAvc1Vv?=
 =?utf-8?B?ZWdRQkRsL0pHUDZBRUZqK0hPNVZPdVh5MzVHSit3SFVrQjVZcmdiZTBQTzk1?=
 =?utf-8?B?ZVphdTBwUlNCUWtwU2RzSFlVUXBEUk9qVndJSFZna0FPUWJzQTZMcWxtVzl6?=
 =?utf-8?B?YjRSZUlZRGM0citQendHYW1ranVPVU01M2hoUDd2VTNYRkF6K29VaFE3b0VK?=
 =?utf-8?B?Y043d1hnL3RnaTZpWVR5bzJQQnVCVmhPclNMdC9PU04xZ2pIUlVjclJhL0oz?=
 =?utf-8?B?Q2M0RXh6YlJaRXVIYksxWUpKeTgzczhxMldPNGc5M0VpeUpzeEVtMG1yUXJF?=
 =?utf-8?B?RHpuU3dTZzNQZC9kMERZd0ZDaG5IcXlWeXAwZllKSk5SZ1llcnNkWUUxNFJl?=
 =?utf-8?B?T283Y013WVJwYWV1M3lMbTRYN1NLUVRGQzdwdXVZcTN3bHZzSXBVMmVmVXlm?=
 =?utf-8?B?TkVKTUtQVGpoSVdXenRWL3FHU1dvUTgwd2dpRGJZQmQ1eGRDaDhrWVM5bDhw?=
 =?utf-8?B?OWQ2REJnS1lQVWtjTnJEOG55eGJscUsydnpSblFMMHdZa2RNeDlzcXE2aFR5?=
 =?utf-8?B?dWRHK2Q1c3ZJcGJQOUJlQllXaGJLRnpWTFlKb2RrbjZpNFcwSVZHOUd0aUpy?=
 =?utf-8?B?bTNpQ281UlBHN3NBS3UrOXFhc09tUDFjbmdNUml3b2kxZW1BSXR4Q1lKaWo3?=
 =?utf-8?B?bVRUZlhPQWl6ZVhQK1FibVA4di9hbHJ2QXdLdnR1SDNGK3FlQzNtSTZrZGlG?=
 =?utf-8?B?S2VSbHRiNEJ4Q0NQV01lQTNGVHpVL2EvMmxuRFNXTyt3YjkvdjdRcU1QTDJq?=
 =?utf-8?B?b24xM1JRUlg2Mk9UQ0N1NkUxWWRSQStyL0hQUFpCQ2liMzVGNmVZVklpdjdD?=
 =?utf-8?B?MnpLeFhLZE5lVUFTQjZ3TjJXdTUyQzg3MWd5QnhiWHA2UDlHajY1Sm4zRGE5?=
 =?utf-8?B?a004YmhRTTJ3bzdISWxsNEtLU2NlTTBvb3oxcktodVZDUFV6cjRnd0dPbitm?=
 =?utf-8?B?cUI3dld0UGhvR1llejdoV3lpU1ZXNXVlSEtweVRGUDFnVTNQcWt3R3I0bTVW?=
 =?utf-8?B?bldiQjQwKzFRL0xhOVlUR05xM1IrcHROcFYxelRCR1g3SERDU0RuNUhhKzBL?=
 =?utf-8?B?WUZnV3BqZDdTa0F2b3VuSStYMjBtTGQzNHJaRXYvem5aWHRuZFhGbEovc3Jl?=
 =?utf-8?B?OE1BTkVpZUMrYlBpb1FiZGhTYSt3blBVc25CVXZuRUs5WUVzQ2hUNzVIZ2Vj?=
 =?utf-8?B?a0F6VC8vZkY4dmJKdExJUEhmMy9aYnN6QkYyV282QSs2ZmdDbnA2SjhaMnJE?=
 =?utf-8?B?RTNlTFVTVmJ3WlJVTzlUZ3htQ1padkV3RFowMTY5ZnQ4STJNU2s0dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE644C4995E64E41A91DD1381C12E2FF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	gLHsLr40Sf0vfUP3m1+jPxkGAgyuf8mE48SrdHfrey/bMr1cR5bxlRPxYv5uMI+GihdBwCSmp0Aqc72h2noomatkcHT5TEbmFe3GaZMc4RtPRzEDYIzc00XopQNQlaGbM6pvEIyLpfmaloG9PeJLWpwsxftoHD/lb0yLL6sCqXcCuBxTSWiu6b0uoOO7q5UOsLh/aPQshdaSjPvC2IZDzyn63URUyn2mKrEzFmcxN8iQTjjM6UaSlCi5cYt+VvVAsAihREtL+0Ixc4sYdkbAVU5JCr7btZjBYWIn2OOwErhnI00Xy/viksDRSnhLZO4XhsFac71PbbfTDAkB4YBzxA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	z8rNRXlfqiifJac+KwlLT9Up+Sw6+yDoUvDIo7lNGOVQsE0bfjlFPYP2TMqYaTlhAGFZV2Qc0E8LxYC5JAeF0v3RCFjIRRSpYHUzSVpmYv7va8ryt2XPyiaLWe6DthoZhkPPL8I5/Vaf9/itQKR0LcZ56ZMKl3yky6xC7gqhNppQyNxnDppDRqDWKYyBc+wkoQsO1F4EaM2zZ77rFbfsdvgfAYV91k2p3eI+EDiDyKOSreUeW50CtZ1teOk6uIz6YgXyUOvyG53bXM7cO6uafDVOWobfK2fFIrmS71aREl3aTQ09UBsz3TFqGwLPK2kFUW6M99K+9Ln+9c8o+pIH+Rta2zDy2Jmth0gnzrS4Je2Cmc6wDLE0VbGGp9QoMsJbXRDEfc+qCmwZOmCkcc+frRO+Ap6xd5pmRKQ5zE60jBTymub4zMyLyPsKG1uPeR/8SGgZwAW6/ERK8YqHJI5H7B9VbYjeKlDiL2HagDLv6Tqbv5tGmPy/Is7luaXVPrGTYJv/Re1rGjOARt3vRPTpEGkkOhMQp1P6355Or4PAo6ddnLCuqq5gujuO38W8z2xo+gCk4WPe34IUIelm6/QcUf29VoS6080mAt0VAEt06r+PY0riCAjmQRO3bXUakow38O+rqGUGox/Xlp/MzIZWRQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999220.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a9f02a0-1636-4cef-09ac-08debc46f7bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2026 23:23:32.2971
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9LGoZGYyKVSsBL6O3zz54rl8HIDo17/3eEBI1WzGtkX0yAMOT7hke8aSP0Yt9NadbH4CF15Pk98NknO9CGdlGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8410
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDIzMyBTYWx0ZWRfXzdpu6pl1r4bH
 qV4vvbmbPmerRmtpLgqjQLgA0a67e2nSLZv71kBDPqjjpQEVnUcLWeiigO0yV6XTWo+EIPli36/
 aSr0EdC5CanDlwuYi1q2YSec/WD3GrEhKj04Qw5ia2eo5tJCcF9rFxQC1eXlj27XCBArwfERY4K
 nEcDPOPFkMIx7bsjOvbbFXz1BSDoGom++WNUnIJE+o1b8I9d23t/WWieO20yUUl7MxnsVnDfn8h
 lO+yTqID3+X/LO0LvjtZHWYcfbmbesjYGBpkE6JaI0m/NPuq5sP+5/m25Cqq5N+KwYCQIAZbwgc
 VxQ5AWJfXaOiGJMgfYlB4EKMrWe/RkpRbzdVt3aXUVrkSIbmssrKHBvLwTzbWOWExEFG71EXLt7
 dRp7KbEivU+R1E79m57mjlEsDm1iDgzZL7iJBt3lRvvNsKwut+cJ4lXxPYMyyjar5NadcSs4srE
 AN/WjDXvfCpM23urH5g==
X-Proofpoint-ORIG-GUID: p-Vut8zGOuk47W4cTKClriwTOU-2Ghf0
X-Authority-Analysis: v=2.4 cv=A8tc+aWG c=1 sm=1 tr=0 ts=6a177cfc cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8GyJEqZ33G73F9xiXPMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: p-Vut8zGOuk47W4cTKClriwTOU-2Ghf0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605210000 definitions=main-2605270233
X-Spamd-Result: default: False [1.44 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38113-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,urldefense.com:url,synopsys.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	RCPT_COUNT_SEVEN(0.00)[7];
	REDIRECTOR_URL(0.00)[urldefense.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AE9455EAE90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCBNYXkgMjYsIDIwMjYsIEVsc29uIFNlcnJhbyB3cm90ZToNCj4gVGhlIGR3YzMgZHJp
dmVyIGN1cnJlbnRseSBkZWZlcnMgcHJvYmUgaWYgdGhlIFVTQiBwb3dlciBzdXBwbHkgaXMgbm90
IHlldA0KPiByZWdpc3RlcmVkLiBPbiBzb21lIHBsYXRmb3JtcywgZXZlbiB0aG91Z2ggY2hhcmdp
bmcgYW5kIHBvd2VyIHN1cHBseQ0KPiBmdW5jdGlvbmFsaXR5IGlzIGF2YWlsYWJsZSBkdXJpbmcg
bm9ybWFsIG9wZXJhdGlvbiwgdGhlcmUgbWF5IGV4aXN0DQo+IG1pbmltYWwgYm9vdGluZyBtb2Rl
cyAoc3VjaCBhcyByZWNvdmVyeSBvciBkaWFnbm9zdGljIGVudmlyb25tZW50cykgd2hlcmUNCj4g
dGhlIHJlbGV2YW50IFVTQiBwb3dlciBzdXBwbHkgZGV2aWNlIGlzIG5vdCByZWdpc3RlcmVkLiBJ
biBzdWNoIGNhc2VzLA0KPiBwcm9iZSBkZWZlcnJhbCBwcmV2ZW50cyBVU0IgZ2FkZ2V0IG9wZXJh
dGlvbiBlbnRpcmVseS4NCj4gDQo+IFVTQiBkYXRhIGZ1bmN0aW9uYWxpdHkgZm9yIGJhc2ljIG9w
ZXJhdGlvbiBkb2VzIG5vdCBpbmhlcmVudGx5IGRlcGVuZCBvbg0KPiB0aGUgcG93ZXIgc3VwcGx5
IGZyYW1ld29yaywgd2hpY2ggaXMgb25seSByZXF1aXJlZCBmb3IgZW5mb3JjaW5nIFZCVVMNCj4g
Y3VycmVudCBjb250cm9sLiBUaGUgY29uZmlndXJlZCBWQlVTIGN1cnJlbnQgbGltaXQgaXMgdHlw
aWNhbGx5IGVuZm9yY2VkDQo+IHRocm91Z2ggdGhlIGNoYXJnZXIgb3IgUE1JQyBwb3dlciBwYXRo
LiBXaGVuIGNoYXJnaW5nIGZ1bmN0aW9uYWxpdHkgaXMNCj4gdW5hdmFpbGFibGUsIGFwcGx5aW5n
IGEgY3VycmVudCBsaW1pdCBoYXMgbm8gcHJhY3RpY2FsIGVmZmVjdCwgcmVkdWNpbmcNCj4gdGhl
IGJlbmVmaXQgb2Ygc3RyaWN0IHByb2JlLXRpbWUgZW5mb3JjZW1lbnQgaW4gdGhlc2UgZW52aXJv
bm1lbnRzLg0KPiANCj4gSW5zdGVhZCBvZiBkZWZlcnJpbmcgcHJvYmUsIHJlZ2lzdGVyIGEgcG93
ZXIgc3VwcGx5IG5vdGlmaWVyIHdoZW4gdGhlDQo+IFVTQiBwb3dlciBzdXBwbHkgaXMgbm90IHll
dCBhdmFpbGFibGUuIENhY2hlIHRoZSByZXF1ZXN0ZWQgVkJVUyBjdXJyZW50DQo+IGxpbWl0IGFu
ZCBhcHBseSBpdCBvbmNlIHRoZSBtYXRjaGluZyBwb3dlciBzdXBwbHkgYmVjb21lcyBhdmFpbGFi
bGUsIGFzDQo+IG5vdGlmaWVkIHRocm91Z2ggdGhlIHJlZ2lzdGVyZWQgY2FsbGJhY2suDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBFbHNvbiBTZXJyYW8gPGVsc29uLnNlcnJhb0Bvc3MucXVhbGNvbW0u
Y29tPg0KPiAtLS0NCj4gQ2hhbmdlcyBpbiB2MjoNCj4gIC0gUmVtb3ZlZCBub3RpZmllciB1bnJl
Z2lzdHJhdGlvbiBmcm9tIHRoZSB2YnVzX2RyYXcgd29yayBmdW5jdGlvbiB0bw0KPiAgICBhdm9p
ZCBhIHJhY2Ugd2l0aCByZW1vdmUgY2FsbGJhY2suDQo+ICAtIEFkZGVkIGFuIGVhcmx5IHBzeSBy
ZWdpc3RyYXRpb24gY2hlY2sgaW4gdGhlIG5vdGlmaWVyIGNhbGxiYWNrLg0KPiAgLSBNb3ZlZCBw
b3dlciBzdXBwbHkgcmVnaXN0cmF0aW9uIGNoZWNrIGFmdGVyIG5vdGlmaWVyIHJlZ2lzdHJhdGlv
bg0KPiAgICBpbiBkd2MzX2dldF91c2JfcG93ZXJfc3VwcGx5KCkgdG8gYWRkcmVzcyB0aGUgcmFj
ZSBpZGVudGlmaWVkIGluIHYxLg0KPiAgLSBMaW5rIHRvIHYxOiBodHRwczovL3VybGRlZmVuc2Uu
Y29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNDA3MjMyNDEwLjQxMDE0
NTUtMS1lbHNvbi5zZXJyYW9Ab3NzLnF1YWxjb21tLmNvbS9fXzshIUE0RjJSOUdfcGchZFNNdExy
WC1tTFRPU3owVHBLRV9QMVdrTWc5b2RrQ2Q0YW03QmdNOTRnM0djZjh4M2JiZ2pTcGRyeTdlQWNG
dXNMQnlYcU1XRXBmZHpxQXJwMEJpcjhPS2N0Qm16RVBpJCANCj4gLS0tDQo+ICBkcml2ZXJzL3Vz
Yi9kd2MzL2NvcmUuYyAgIHwgOTkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCAgIHwgIDQgKysNCj4gIGRyaXZlcnMvdXNi
L2R3YzMvZ2FkZ2V0LmMgfCAxMCArKystDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDk3IGluc2VydGlv
bnMoKyksIDE2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3
YzMvY29yZS5jIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gaW5kZXggNjUyMTM4OTZkZTk5
Li5jMDM1YjVmYmZiMmYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+
ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+IEBAIC0yMTkyLDIyICsyMTkyLDg5IEBA
IHN0YXRpYyB2b2lkIGR3YzNfdmJ1c19kcmF3X3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3Jr
KQ0KPiAgCQkJcmV0LCBkd2MtPmN1cnJlbnRfbGltaXQpOw0KPiAgfQ0KPiAgDQo+IC1zdGF0aWMg
c3RydWN0IHBvd2VyX3N1cHBseSAqZHdjM19nZXRfdXNiX3Bvd2VyX3N1cHBseShzdHJ1Y3QgZHdj
MyAqZHdjKQ0KPiArc3RhdGljIGludCBkd2MzX3BzeV9ub3RpZmllcihzdHJ1Y3Qgbm90aWZpZXJf
YmxvY2sgKm5iLA0KPiArCQkJICAgICB1bnNpZ25lZCBsb25nIGV2ZW50LCB2b2lkICpkYXRhKQ0K
PiAgew0KPiAtCXN0cnVjdCBwb3dlcl9zdXBwbHkgKnVzYl9wc3k7DQo+IC0JY29uc3QgY2hhciAq
dXNiX3BzeV9uYW1lOw0KPiArCXN0cnVjdCBkd2MzICpkd2MgPSBjb250YWluZXJfb2YobmIsIHN0
cnVjdCBkd2MzLCBwc3lfbmIpOw0KPiArCXN0cnVjdCBwb3dlcl9zdXBwbHkgKnBzeSA9IGRhdGE7
DQo+ICsJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gKw0KPiArCWlmIChkd2MtPnVzYl9wc3kpDQo+
ICsJCXJldHVybiBOT1RJRllfRE9ORTsNCj4gKw0KPiArCWlmIChzdHJjbXAocHN5LT5kZXNjLT5u
YW1lLCBkd2MtPnVzYl9wc3lfbmFtZSkgIT0gMCkNCj4gKwkJcmV0dXJuIE5PVElGWV9ET05FOw0K
PiArDQo+ICsJLyogRXhwbGljaXRseSBnZXQgdGhlIHJlZmVyZW5jZSBmb3IgdGhpcyBwc3kgKi8N
Cj4gKwlwc3kgPSBwb3dlcl9zdXBwbHlfZ2V0X2J5X25hbWUoZHdjLT51c2JfcHN5X25hbWUpOw0K
PiArCWlmICghcHN5KQ0KPiArCQlyZXR1cm4gTk9USUZZX0RPTkU7DQo+ICsNCj4gKwlzcGluX2xv
Y2tfaXJxc2F2ZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+ICsJLyoNCj4gKwkgKiBUaGUgVVNCIHBv
d2VyX3N1cHBseSBtYXkgYWxyZWFkeSBiZSBzZXQuIFRoaXMgY2FuIGhhcHBlbiBpZiBub3RpZmll
cg0KPiArCSAqIGNhbGxiYWNrcyBmb3IgdGhlIFVTQiBwb3dlcl9zdXBwbHkgcmFjZSwgb3IgaWYg
YSBwcmV2aW91cyBub3RpZmllcg0KPiArCSAqIGNhbGxiYWNrIGhhcyBhbHJlYWR5IHN1Y2Nlc3Nm
dWxseSBmZXRjaGVkIGFuZCBhc3NvY2lhdGVkIHRoZSBpbnN0YW5jZS4NCj4gKwkgKiBJbiBzdWNo
IGNhc2VzLCByZWxlYXNlIHRoZSBuZXdseSBhY3F1aXJlZCByZWZlcmVuY2UgYW5kIGlnbm9yZQ0K
PiArCSAqIHN1YnNlcXVlbnQgbm90aWZpY2F0aW9ucyB1bnRpbCB0aGUgbm90aWZpZXIgaXMgdW5y
ZWdpc3RlcmVkLg0KPiArCSAqLw0KPiArCWlmIChkd2MtPnVzYl9wc3kpIHsNCj4gKwkJc3Bpbl91
bmxvY2tfaXJxcmVzdG9yZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+ICsJCXBvd2VyX3N1cHBseV9w
dXQocHN5KTsNCj4gKwkJcmV0dXJuIE5PVElGWV9ET05FOw0KPiArCX0NCj4gKw0KPiArCWR3Yy0+
dXNiX3BzeSA9IHBzeTsNCj4gKwlpZiAoZHdjLT5jdXJyZW50X2xpbWl0ICE9IFVJTlRfTUFYKQ0K
DQpDcmVhdGUgYSBtYWNybyBmb3IgdGhlc2Uga2luZHMgb2YgY2hlY2tzIGZvciByZWFkYWJpbGl0
eToNCg0KI2RlZmluZSBEV0MzX0NVUlJFTlRfVU5TUEVDSUZJRUQgVUlOVF9NQVgNCg0KPiArCQlz
Y2hlZHVsZV93b3JrKCZkd2MtPnZidXNfZHJhd193b3JrKTsNCj4gKwlzcGluX3VubG9ja19pcnFy
ZXN0b3JlKCZkd2MtPmxvY2ssIGZsYWdzKTsNCj4gKw0KPiArCXJldHVybiBOT1RJRllfT0s7DQo+
ICt9DQo+ICsNCj4gK3N0YXRpYyB2b2lkIGR3YzNfZ2V0X3VzYl9wb3dlcl9zdXBwbHkoc3RydWN0
IGR3YzMgKmR3YykNCj4gK3sNCj4gKwlzdHJ1Y3QgcG93ZXJfc3VwcGx5ICpwc3k7DQo+ICsJdW5z
aWduZWQgbG9uZyBmbGFnczsNCj4gIAlpbnQgcmV0Ow0KPiAgDQo+IC0JcmV0ID0gZGV2aWNlX3By
b3BlcnR5X3JlYWRfc3RyaW5nKGR3Yy0+ZGV2LCAidXNiLXBzeS1uYW1lIiwgJnVzYl9wc3lfbmFt
ZSk7DQo+ICsJcmV0ID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfc3RyaW5nKGR3Yy0+ZGV2LCAidXNi
LXBzeS1uYW1lIiwgJmR3Yy0+dXNiX3BzeV9uYW1lKTsNCj4gIAlpZiAocmV0IDwgMCkNCj4gLQkJ
cmV0dXJuIE5VTEw7DQo+IC0NCj4gLQl1c2JfcHN5ID0gcG93ZXJfc3VwcGx5X2dldF9ieV9uYW1l
KHVzYl9wc3lfbmFtZSk7DQo+IC0JaWYgKCF1c2JfcHN5KQ0KPiAtCQlyZXR1cm4gRVJSX1BUUigt
RVBST0JFX0RFRkVSKTsNCj4gKwkJcmV0dXJuOw0KPiAgDQo+ICAJSU5JVF9XT1JLKCZkd2MtPnZi
dXNfZHJhd193b3JrLCBkd2MzX3ZidXNfZHJhd193b3JrKTsNCj4gLQlyZXR1cm4gdXNiX3BzeTsN
Cj4gKw0KPiArCWR3Yy0+Y3VycmVudF9saW1pdCA9IFVJTlRfTUFYOw0KPiArCWR3Yy0+cHN5X25i
Lm5vdGlmaWVyX2NhbGwgPSBkd2MzX3BzeV9ub3RpZmllcjsNCj4gKwlyZXQgPSBwb3dlcl9zdXBw
bHlfcmVnX25vdGlmaWVyKCZkd2MtPnBzeV9uYik7DQo+ICsJaWYgKHJldCkgew0KPiArCQlkZXZf
ZXJyKGR3Yy0+ZGV2LCAiRmFpbGVkIHRvIHJlZ2lzdGVyIHBvd2VyIHN1cHBseSBub3RpZmllcjog
JWRcbiIsIHJldCk7DQo+ICsJCWR3Yy0+cHN5X25iLm5vdGlmaWVyX2NhbGwgPSBOVUxMOw0KPiAr
CQlyZXR1cm47DQo+ICsJfQ0KPiArDQo+ICsJcHN5ID0gcG93ZXJfc3VwcGx5X2dldF9ieV9uYW1l
KGR3Yy0+dXNiX3BzeV9uYW1lKTsNCj4gKwlpZiAoIXBzeSkNCj4gKwkJcmV0dXJuOw0KPiArDQo+
ICsJLyogVW5yZWdpc3RlciB0aGUgbm90aWZpZXIgbm93IHRoYXQgd2UgaGF2ZSB0aGUgcG93ZXIg
c3VwcGx5ICovDQo+ICsJcG93ZXJfc3VwcGx5X3VucmVnX25vdGlmaWVyKCZkd2MtPnBzeV9uYik7
DQo+ICsJZHdjLT5wc3lfbmIubm90aWZpZXJfY2FsbCA9IE5VTEw7DQo+ICsNCj4gKwlzcGluX2xv
Y2tfaXJxc2F2ZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+ICsJLyoNCj4gKwkgKiBJdCBpcyBwb3Nz
aWJsZSB0aGF0IHRoZSBub3RpZmllciBjYWxsYmFjayByYW4gYmVmb3JlIHdlIHJlYWNoZWQgaGVy
ZQ0KPiArCSAqIGFuZCBzdWNjZXNzZnVsbHkgZmV0Y2hlZCB0aGUgcG93ZXIgc3VwcGx5LiBJbiB0
aGF0IGNhc2Ugd2UgbmVlZCB0bw0KPiArCSAqIHJlbGVhc2UgdGhlIGFib3ZlIHJlZmVyZW5jZS4N
Cj4gKwkgKi8NCj4gKwlpZiAoZHdjLT51c2JfcHN5KSB7DQo+ICsJCXNwaW5fdW5sb2NrX2lycXJl
c3RvcmUoJmR3Yy0+bG9jaywgZmxhZ3MpOw0KPiArCQlwb3dlcl9zdXBwbHlfcHV0KHBzeSk7DQo+
ICsJCXJldHVybjsNCj4gKwl9DQo+ICsNCj4gKwlkd2MtPnVzYl9wc3kgPSBwc3k7DQo+ICsJc3Bp
bl91bmxvY2tfaXJxcmVzdG9yZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+ICB9DQo+ICANCj4gIGlu
dCBkd2MzX2NvcmVfcHJvYmUoY29uc3Qgc3RydWN0IGR3YzNfcHJvYmVfZGF0YSAqZGF0YSkNCj4g
QEAgLTIyNTUsOSArMjMyMiw5IEBAIGludCBkd2MzX2NvcmVfcHJvYmUoY29uc3Qgc3RydWN0IGR3
YzNfcHJvYmVfZGF0YSAqZGF0YSkNCj4gIA0KPiAgCWR3YzNfZ2V0X3NvZnR3YXJlX3Byb3BlcnRp
ZXMoZHdjLCAmZGF0YS0+cHJvcGVydGllcyk7DQo+ICANCj4gLQlkd2MtPnVzYl9wc3kgPSBkd2Mz
X2dldF91c2JfcG93ZXJfc3VwcGx5KGR3Yyk7DQo+IC0JaWYgKElTX0VSUihkd2MtPnVzYl9wc3kp
KQ0KPiAtCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoZHdjLT51c2JfcHN5KSwg
ImNvdWxkbid0IGdldCB1c2IgcG93ZXIgc3VwcGx5XG4iKTsNCj4gKwlzcGluX2xvY2tfaW5pdCgm
ZHdjLT5sb2NrKTsNCj4gKw0KPiArCWR3YzNfZ2V0X3VzYl9wb3dlcl9zdXBwbHkoZHdjKTsNCj4g
IA0KPiAgCWlmICghZGF0YS0+aWdub3JlX2Nsb2Nrc19hbmRfcmVzZXRzKSB7DQo+ICAJCWR3Yy0+
cmVzZXQgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfYXJyYXlfZ2V0X29wdGlvbmFsX3NoYXJlZChkZXYp
Ow0KPiBAQCAtMjMwOSw3ICsyMzc2LDYgQEAgaW50IGR3YzNfY29yZV9wcm9iZShjb25zdCBzdHJ1
Y3QgZHdjM19wcm9iZV9kYXRhICpkYXRhKQ0KPiAgCQlkd2MtPm51bV91c2IzX3BvcnRzID0gMTsN
Cj4gIAl9DQo+ICANCj4gLQlzcGluX2xvY2tfaW5pdCgmZHdjLT5sb2NrKTsNCj4gIAltdXRleF9p
bml0KCZkd2MtPm11dGV4KTsNCj4gIA0KPiAgCXBtX3J1bnRpbWVfZ2V0X25vcmVzdW1lKGRldik7
DQo+IEBAIC0yMzc3LDYgKzI0NDMsOCBAQCBpbnQgZHdjM19jb3JlX3Byb2JlKGNvbnN0IHN0cnVj
dCBkd2MzX3Byb2JlX2RhdGEgKmRhdGEpDQo+ICBlcnJfYXNzZXJ0X3Jlc2V0Og0KPiAgCXJlc2V0
X2NvbnRyb2xfYXNzZXJ0KGR3Yy0+cmVzZXQpOw0KPiAgZXJyX3B1dF9wc3k6DQo+ICsJaWYgKGR3
Yy0+cHN5X25iLm5vdGlmaWVyX2NhbGwpDQo+ICsJCXBvd2VyX3N1cHBseV91bnJlZ19ub3RpZmll
cigmZHdjLT5wc3lfbmIpOw0KPiAgCWlmIChkd2MtPnVzYl9wc3kpDQo+ICAJCXBvd2VyX3N1cHBs
eV9wdXQoZHdjLT51c2JfcHN5KTsNCj4gIA0KPiBAQCAtMjQzMyw2ICsyNTAxLDkgQEAgdm9pZCBk
d2MzX2NvcmVfcmVtb3ZlKHN0cnVjdCBkd2MzICpkd2MpDQo+ICANCj4gIAlkd2MzX2ZyZWVfZXZl
bnRfYnVmZmVycyhkd2MpOw0KPiAgDQo+ICsJaWYgKGR3Yy0+cHN5X25iLm5vdGlmaWVyX2NhbGwp
DQo+ICsJCXBvd2VyX3N1cHBseV91bnJlZ19ub3RpZmllcigmZHdjLT5wc3lfbmIpOw0KPiArDQo+
ICAJaWYgKGR3Yy0+dXNiX3BzeSkgew0KPiAgCQljYW5jZWxfd29ya19zeW5jKCZkd2MtPnZidXNf
ZHJhd193b3JrKTsNCj4gIAkJcG93ZXJfc3VwcGx5X3B1dChkd2MtPnVzYl9wc3kpOw0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmggYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUu
aA0KPiBpbmRleCBlMGRlZTlkMjg3NDAuLjQ4NTRjZmRiYzY0YSAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy91c2IvZHdjMy9jb3JlLmgNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4g
QEAgLTEwNTksNiArMTA1OSw4IEBAIHN0cnVjdCBkd2MzX2dsdWVfb3BzIHsNCj4gICAqIEByb2xl
X3N3aXRjaF9kZWZhdWx0X21vZGU6IGRlZmF1bHQgb3BlcmF0aW9uIG1vZGUgb2YgY29udHJvbGxl
ciB3aGlsZQ0KPiAgICoJCQl1c2Igcm9sZSBpcyBVU0JfUk9MRV9OT05FLg0KPiAgICogQHVzYl9w
c3k6IHBvaW50ZXIgdG8gcG93ZXIgc3VwcGx5IGludGVyZmFjZS4NCj4gKyAqIEB1c2JfcHN5X25h
bWU6IG5hbWUgb2YgdGhlIFVTQiBwb3dlciBzdXBwbHkNCj4gKyAqIEBwc3lfbmI6IHBvd2VyIHN1
cHBseSBub3RpZmllciBibG9jaw0KPiAgICogQHZidXNfZHJhd193b3JrOiBXb3JrIHRvIHNldCB0
aGUgdmJ1cyBkcmF3aW5nIGxpbWl0DQo+ICAgKiBAY3VycmVudF9saW1pdDogSG93IG11Y2ggY3Vy
cmVudCB0byBkcmF3IGZyb20gdmJ1cywgaW4gbWlsbGlBbXBlcmVzLg0KPiAgICogQHVzYjJfcGh5
OiBwb2ludGVyIHRvIFVTQjIgUEhZDQo+IEBAIC0xMjUxLDYgKzEyNTMsOCBAQCBzdHJ1Y3QgZHdj
MyB7DQo+ICAJZW51bSB1c2JfZHJfbW9kZQlyb2xlX3N3aXRjaF9kZWZhdWx0X21vZGU7DQo+ICAN
Cj4gIAlzdHJ1Y3QgcG93ZXJfc3VwcGx5CSp1c2JfcHN5Ow0KPiArCWNvbnN0IGNoYXIJCSp1c2Jf
cHN5X25hbWU7DQo+ICsJc3RydWN0IG5vdGlmaWVyX2Jsb2NrCXBzeV9uYjsNCj4gIAlzdHJ1Y3Qg
d29ya19zdHJ1Y3QJdmJ1c19kcmF3X3dvcms7DQo+ICAJdW5zaWduZWQgaW50CQljdXJyZW50X2xp
bWl0Ow0KPiAgDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIGIvZHJp
dmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiBpbmRleCAzZDRjYTY4ZTU4NGMuLjMwMzU5ODA0OGU5
YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiArKysgYi9kcml2
ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+IEBAIC0zMTI0LDE1ICszMTI0LDIxIEBAIHN0YXRpYyB2
b2lkIGR3YzNfZ2FkZ2V0X3NldF9zc3BfcmF0ZShzdHJ1Y3QgdXNiX2dhZGdldCAqZywNCj4gIHN0
YXRpYyBpbnQgZHdjM19nYWRnZXRfdmJ1c19kcmF3KHN0cnVjdCB1c2JfZ2FkZ2V0ICpnLCB1bnNp
Z25lZCBpbnQgbUEpDQo+ICB7DQo+ICAJc3RydWN0IGR3YzMJCSpkd2MgPSBnYWRnZXRfdG9fZHdj
KGcpOw0KPiArCXVuc2lnbmVkIGxvbmcJCWZsYWdzOw0KPiAgDQo+ICAJaWYgKGR3Yy0+dXNiMl9w
aHkpDQo+ICAJCXJldHVybiB1c2JfcGh5X3NldF9wb3dlcihkd2MtPnVzYjJfcGh5LCBtQSk7DQo+
ICANCj4gLQlpZiAoIWR3Yy0+dXNiX3BzeSkNCj4gKwlzcGluX2xvY2tfaXJxc2F2ZSgmZHdjLT5s
b2NrLCBmbGFncyk7DQo+ICsJZHdjLT5jdXJyZW50X2xpbWl0ID0gbUE7DQo+ICsJaWYgKCFkd2Mt
PnVzYl9wc3kpIHsNCj4gKwkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZHdjLT5sb2NrLCBmbGFn
cyk7DQo+ICsJCWRldl9kYmcoZHdjLT5kZXYsICJTdG9yZWQgVkJVUyBkcmF3OiAldSBtQSAocG93
ZXIgc3VwcGx5IG5vdCByZWFkeSlcbiIsIG1BKTsNCg0KQ2FuIHdlIHVzZSB0aGUgY2hlY2sgaWYg
ZHdjLT5wc3lfbmIubm90aWZpZXJfYmxvY2sgaXMgc2V0IHRvIGRldGVybWluZQ0KaWYgd2UgZXhw
ZWN0IHRvIGhhdmUgYSBwb3dlcl9zdXBwbHk/IFRoZW4gd2UgY2FuIHByaW50IHRoZSBtZXNzYWdl
IGFib3ZlDQp3aGVuIGl0J3MgcmVhbGx5IG5vdCByZWFkeSwgYW5kIG9ubHkgcmV0dXJuIC1FT1BO
T1RTVVBQIGlmIHdlIHJlYWxseQ0KZG9uJ3QgaGF2ZSBhIHBvd2VyX3N1cHBseS4NCg0KPiAgCQly
ZXR1cm4gLUVPUE5PVFNVUFA7DQo+ICsJfQ0KPiAgDQo+IC0JZHdjLT5jdXJyZW50X2xpbWl0ID0g
bUE7DQo+ICAJc2NoZWR1bGVfd29yaygmZHdjLT52YnVzX2RyYXdfd29yayk7DQo+ICsJc3Bpbl91
bmxvY2tfaXJxcmVzdG9yZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+ICANCj4gIAlyZXR1cm4gMDsN
Cj4gIH0NCj4gLS0gDQo+IDIuMzQuMQ0KPiANCg0KVGhlIHJlc3QgbG9va3MgZ29vZCB0byBtZS4N
Cg0KVGhhbmtzLA0KVGhpbmg=

