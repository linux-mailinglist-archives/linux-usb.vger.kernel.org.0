Return-Path: <linux-usb+bounces-22718-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5B1A7F171
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 01:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A99EF1882C00
	for <lists+linux-usb@lfdr.de>; Mon,  7 Apr 2025 23:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE4F22ACC6;
	Mon,  7 Apr 2025 23:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NJDq7pNE";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OjirkXKm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="tTkYWuZp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DED22A80F
	for <linux-usb@vger.kernel.org>; Mon,  7 Apr 2025 23:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744069477; cv=fail; b=nABktI5HgHayF2AipVWqIRVjwS4XcfNoXJ81L4e1rRA9lLdAa+EZw46O+wxiWr1T/QxDqVf13DBynDI/qWiMUb6Q1337xKoMYLid2Z/7ZzPzbpoycE4rh5C/SbF1n+Vt7RFHfRjos7xt2/b2HyBk7eB4brrHKEmW/FkPgvdcsWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744069477; c=relaxed/simple;
	bh=8Ss2+NMT5sSlrigjzZXS5mtZtixQEnRQy1yXLwCS+wY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OBKphJQzQDbPzwsMu1zaLpNP9ZZx4lFnDF4YA5xCej2rQPkbOd6umKPn3/FLbWo54LHnQIDhMxkpTFryaVPzCnLOhX/CByV78BUS3EEih4JIzi90AEWFtoM96JQ17uDEZbiLXuelYnshf+ZDKxeKjv862Cx6khmbqIcqKp49gao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NJDq7pNE; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=OjirkXKm; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=tTkYWuZp reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537GVkew003054;
	Mon, 7 Apr 2025 16:44:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=8Ss2+NMT5sSlrigjzZXS5mtZtixQEnRQy1yXLwCS+wY=; b=
	NJDq7pNEVwGTiOX2K6Bgfa0V4Izmg6HBt6LxRBf1qAyOI1f2HgcrYF4EVUITF06a
	kiFCbbnPHTqD3eluvK6ACBT2ImdL2XdEdPlIY5a8NIsv+etbiXB7+OnlIm6iXZ71
	PayJeSk3o4V/u4dkQhULfb++dbu6RxYd8qdgg0d3B18B9cRXmSYyMLu3XrIgUCX9
	aR1hskW8RJfCU3+2qjGxWk4OiFYjNTS/MbFr42FpVyBlvN8PSX/b/7fcXrAvEsQW
	vF3kJ0MzTRDKIidYA5YDSCXj9+XEhueihlZ+hbIVl1urk9VM52gXhbwUAoTFfP7E
	gwPQNFazMZwwA/GexSoN0g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 45u35ff2ud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 16:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1744069460; bh=8Ss2+NMT5sSlrigjzZXS5mtZtixQEnRQy1yXLwCS+wY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=OjirkXKm18lgjUCdNgFYtzAFVC0B6AgvTtYjH7PBzi248Q10phwiCHaHiKNZOIVo1
	 Srq4zS1xe/WdKe3WQplqNrCLCmqCLvr7/SvpQ7B9AT7QYnfW1YrBD0j4sMdrufQgmV
	 ni26IEI42sm0ScP8KAlU/lY+ychza1YLZcFvbByzFiI4V/6qWCxvdrD+vOV5cxuPsy
	 zXqcXY7dBgN+fbx04GmmCh3u4v85DJ88PlWmtuLjh9UqBOscnBBv6NbEL6LaNhROW0
	 qodyCI7DxRHC6can4rPuWVgded2PwBp07Z8+epjM/FSQ+vVPyDsNwJig9BZXgF51MH
	 LpbYg9H5AXb5w==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 13B4840114;
	Mon,  7 Apr 2025 23:44:19 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 9FB79A006F;
	Mon,  7 Apr 2025 23:44:17 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=tTkYWuZp;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id BC32C40359;
	Mon,  7 Apr 2025 23:44:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cp+muR/bbqu3SnmuCJPeUfe+lEjXoTkYyXYe22/GBhwSwZA1A4tFb0uH9jSb1phUfMDV7ynuno3DP/AtRLrsXDINKt0xKtfQwUadsPRqrIvE+gtv13iBJbRjMktfNqB6KjDe1ZJ61/BID2QA+HrXK16lMxwfF65K9YArybdAoQxQmS7fv+4eCGPYzPG4QuSateeM8aFXnpRdhP+w8vebV4GCqTbY9TclcH+onEN0r4LcV0r/vy5uZheNU+GeAUpRjyJKQ/3IKP0jXGC2C4DY5Icbg/F5URbKp+R1z+bxz9KGWyHeRSfPGvNr7B+/4Wy7vG/y4y2v6cWnzeJnCjoCAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Ss2+NMT5sSlrigjzZXS5mtZtixQEnRQy1yXLwCS+wY=;
 b=JbT1KHI4hfp5Aqfc1XEuqNzotC0ZJphUuTjP4o+nMGndmSzAICWh9ejbXpLMT59Gh5KwEaEQmbq7qrK9CcONLqOkxUHDoSsCyjyGsprPnSNrzyb7NONyamX7udXuxJ0yqhQUTPlHT69znUDqEqK3CsD3M2qWqeHKSJznF37nMfJGn70bFuVm04DcSlyQevZfYqtLSe8Q0muHFaU2+S6N9ox9I1Z2QPRveSymnKUnMbMBncT6VXVUldrGNLF4S/Vkv3RcsaJBbKfxEsJpJVlV1S1ntziwusV27RQdeDhEOKZjQhTqqBczFoeUvVPZi3SQUy3/ER0jAMRs8fZxmlFVCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Ss2+NMT5sSlrigjzZXS5mtZtixQEnRQy1yXLwCS+wY=;
 b=tTkYWuZpv6jF9/uLAgx9bBRWlmKOVnhpNA8v7g/DvG/kQk99/VFYdmQAXEzs3dKbmtal+ukN4JBmjmr3ccdZwAGI65k2Y5AabkUHPwUU7tYgpNQnVtcqimqNxYtF6a5295+h4OOVpPANgzCuEApKYiXDEH0lSGJjYApk8SxEn+E=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ2PR12MB8781.namprd12.prod.outlook.com (2603:10b6:a03:4d0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 23:44:09 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 23:44:07 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Frode Isaksen <fisaksen@baylibre.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Frode Isaksen <frode@meta.com>
Subject: Re: [PATCH] usb: dwc3: ep0: prevent dwc3_request from being queued
 twice
Thread-Topic: [PATCH] usb: dwc3: ep0: prevent dwc3_request from being queued
 twice
Thread-Index: AQHbnyLuqf9Hu8uhE0ul0JwT/TVjubOPgwsAgADYZoCAAKFwAIABD9gAgAbixIA=
Date: Mon, 7 Apr 2025 23:44:07 +0000
Message-ID: <20250407234337.ejaghhulwqumbk3j@synopsys.com>
References: <20250327141630.2085029-1-fisaksen@baylibre.com>
 <20250401234908.npkn5h3vdyefkvxr@synopsys.com>
 <26644fc1-98c1-4443-9809-b7e4d6cec2e3@baylibre.com>
 <20250402222128.2soczlkfwonz7r3p@synopsys.com>
 <cf51ea66-24b2-49f4-87ec-5165249d53c5@baylibre.com>
In-Reply-To: <cf51ea66-24b2-49f4-87ec-5165249d53c5@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ2PR12MB8781:EE_
x-ms-office365-filtering-correlation-id: 551f8cd3-0fe3-44f3-30db-08dd762e1692
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZlRwVmViS1BHS2szeDc0T1BqY0ZWS2JhalNrT0FaSjQ3TXQxY0twc3h1b2M4?=
 =?utf-8?B?SldJS2o0NUI3VEp5eTlLbjM4cWJzRFllL0grY2YvelFKTWhlRGJXdGVDMWlY?=
 =?utf-8?B?Mk0wdHhVUk9tNHlQbldjOXVlOTlNQjRxcFZTMklyRCt5RjVuTVhFNTU0aDlr?=
 =?utf-8?B?TmFFWXNZRG4xZmtwdGdpMTBUQjYrTmhDdnhKTWNqUnkzQVhndTdadWtNZzg0?=
 =?utf-8?B?TW8wUG5SOGlSaGlseTB0SWxTVFpGTUU4eU5qSVczMWwvVUhUQ2c2Z0I0Q2wr?=
 =?utf-8?B?dFMyQi9LSkhFL1J1TGI5cmhwVmF2cHZZUmpCT2NQSUJ5bXdCTUVJS1M3U3Iw?=
 =?utf-8?B?OWFYeDlRNllhUEF6NEVNUDhIQXlSS0FvSGJKbUpzZnM1V0JIT0Q4TnNEYnJz?=
 =?utf-8?B?N1hxbnNEaDFCRWdDdlo1OHNZbkRSYjQvSURNYS9sdnJpM2Y0T2hudWx5cUlt?=
 =?utf-8?B?eFNKektxWEpIdUZSNUZyektIMTRwb3BJWVI2V1BvS2JhRzF4THM3bUtPbFJ3?=
 =?utf-8?B?eFcydFdITzRtaGw5ZjE2THJrWnRyU2p5SmlCSUlnRFEwZUd2WTZKS1ZBS2tT?=
 =?utf-8?B?TjBFTTJ2N1VVaGUxMEluRXJadHMyL3hqcEdVQ2ExbjZyV3ZTL2RtbTBZa0RX?=
 =?utf-8?B?bUNBcEhJQzJ3cUNvNmM4eGZUVUkrRzZOWllHY0tNZTVuT3BLV1A4ZVZneE9Y?=
 =?utf-8?B?NmJDVmdxQlRQc0xoK2JhNmt1cTBTckZhZzNqNWN2TDBBUnRqQkkrMXVFUlh1?=
 =?utf-8?B?WnBVa1YrWXB5SFYxZTdKN2E5OVZhZkVHRjRRMnFacSt2dldKQWgvNDdieXBL?=
 =?utf-8?B?cFRjL3JqM1U4MDQyaVc5Qzl6c1FZU2YvdG8yQWxnU2NpbFVsdmRVUzVCTzM5?=
 =?utf-8?B?T29zNFhDVUNpY1NjTkI2aXA4UU85N2lFRzU0UWNhN2VDU0xkWHFncHVHTzdq?=
 =?utf-8?B?Zzh6OXdibUp4Nmx0M0JIcTA0UjBzdkVqYlhLRHU0UElNc2VuTGo0SVUxNk1n?=
 =?utf-8?B?Rk9vT2d2VVloVGtTdW9BSXlpeXJQQ1ZPZ2k1dVYvRVU0eHNncGs4eGlxdUsv?=
 =?utf-8?B?SlcvaWRmYnpKY0Q1S3lZZ0xKL3g2VldEaHh6WGlOaVlrVFZpdzk4bDBrQ0JJ?=
 =?utf-8?B?NXlTOWhFUDN0TUtZUHhpbSs0RzJjMS9McnRtcll6M1RRVDd3MGhic2hVQzRG?=
 =?utf-8?B?dGJSdW1JQWJ0ZDFjTjlOYkgzYXJiU1dpOEZ0V2s4a2pFdFpBYWI1Zi9Ua2RI?=
 =?utf-8?B?REx2ZVQzQVFBZVYzK1I0WmltejR3bmtGRHNuU3B2WS9oTzNmVUU4NHNaVmta?=
 =?utf-8?B?ZDZHdWlkNXRJczhtY3lJVkdBL2srT1FUcHZYNDAwZlN0QWlzY00rZ0RWcmp0?=
 =?utf-8?B?MFRjc3VLbjAvTTFCbXRMcDZmSkpxVkFEZTdnaDg2blYrWDJRdEpzSGR4LzdS?=
 =?utf-8?B?MkRlZFpablgxbGdJUEFyTG5aS0I2YitMS2NTSmZHWVFpMHN5WW54Wkw0TjlS?=
 =?utf-8?B?MjY3Z0c4blJ0NUQyR2xqZWJzbFQ1MGtkZEs5cmNSOXFRMjVtUTA3djRpUkNs?=
 =?utf-8?B?eEp5bWVLRlZWVEZYSDJhMUhFWjEyS2RzQXQwUC82WkdMYllHbVZKNlFmNzly?=
 =?utf-8?B?Qm1CZmxKbWd2VC8rVE5JRkV2Sy9QM2dGMmNraWRaU0VLYzJ4SFU4ZVNNWVUw?=
 =?utf-8?B?b0JObVcwczV2T2ZkbkdvanNIamFLUjFpeGUwNCtKY2FDQzlsSnl4MndLeVlm?=
 =?utf-8?B?ayt3RThQc0JmNDRXcTAwazAyRGt4QkY2em5DSmlFdHVCNkdVc1o0NlN3clE4?=
 =?utf-8?B?QzBqbUVYeFFEeld1YVo2aEU2OU9GWGhvaTk5dklDQnhvbG5uTGd4NXFqQXVC?=
 =?utf-8?B?Ymo4Z01BNGNJSTI0dGFHc3FjNGU3Q0VCZGxxdE9IcTlwK0pUanhRbnFzYmJ1?=
 =?utf-8?Q?9aosdBjm0dEHvXTJwTWQLAi9ttxj6SbR?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z1ZqY2p0ZHpmUWlNUEFWcE9lOTNuNTZLOS9WSElDUGQ3aTRyUGkxdTJYb3lF?=
 =?utf-8?B?aWwvT0hmQlBPMzUrVXgvZGtMd24wTlAwNXFsOU5iU1NpbU01TFlSZnNTbmNS?=
 =?utf-8?B?cFZtUkQ2VE9jcVlmMmQ0U1NUVkVaaTZrdkxKdWwxQzhBTFJaeE4vaG56bnlo?=
 =?utf-8?B?UkFVRjYydGYyQW5XMkZoY2kxR09iNjRvbEx3TXZKV1c0UngvUjdHT2VubklO?=
 =?utf-8?B?Ris3NUI1aEIyM0hDZWd2MFlwMVR4RW5wSGtZcHNDbklidjd1UktzMkZQZXdO?=
 =?utf-8?B?SjlWT09CbGV0WkVtODdjSXdJYjdqc1ZVd0t2d0ZXMzJmbUVrS1RKYkh0QWlS?=
 =?utf-8?B?SGh3cjVCaDVwSnBRN1g2eU5seFF3ZmtGVDhPL2RUdC9aUm5RSkJVVi9xQlAr?=
 =?utf-8?B?QS9qdUNhRkFMWVN0MUJnWWVxcXoxR2hKakhaakFRTERzS3BWQVZ4U0poWGw4?=
 =?utf-8?B?N2FIUjlMdWpROGRGVHlTdzFZYlprT0ZqcDNDQkRYclZGNTRvcE5nWE51ZlAx?=
 =?utf-8?B?cmdVOXFWV2U4SWV4dW92WUE4Qk5RRGFZTnRKdnJvWHpDRXViMU1GYXVVb1hL?=
 =?utf-8?B?aUVaWWsrTGw3QVZYaUo0eXl3UTk2bEFCS05QUFFEUlgydDA4cFBteUkwZFQ4?=
 =?utf-8?B?QXBiMWoyblIyWU1uY3cvNTY0MlMvUHQzc2krZi9yNkFxa1JyeUNnb01qQUVU?=
 =?utf-8?B?LytudXMvODhENmNobll0VXd2QkoreU9VVnVLS2NBazMyN21PNGkxc0FvR0pC?=
 =?utf-8?B?SHJ2YlFNbVM4WHgvVUhDWFEvOGRicmlHbXUwQUNOM1NqY1pvWjJqOTkvcis2?=
 =?utf-8?B?NUtZdEZmUjZ2a09ic09KWlhJNXJBdGVQaWUySnZCd00wN0ZSbHp4S0lSUWlw?=
 =?utf-8?B?YXNIbkwrTHUyVHFKb0pBZ0FEVW1tTXZOTnl2djZPT2xZU1JYSnd4bkNQQ1dO?=
 =?utf-8?B?L0ZlVTRtWGh2T1J6VnkrUEdWL0oyWUNobWEyNStFcmdHMHF6RWFFcW0wY05K?=
 =?utf-8?B?S3ZQTWIwdDR6OE82YzNKNDFpNHFOcGgrWVBiZVlkekRMOTgvMHprUklDV2lW?=
 =?utf-8?B?cGYzanNWWlRCTWJqaDNpVnVaRmVrb3VtOGhsa3RkYmltaGdiSDNXSlR0UzVp?=
 =?utf-8?B?Y1NIUlVDaHczOHY0QkJJL3BObGw4dHZndHA0clBHRW5xMmNjbkZnK2ozUktG?=
 =?utf-8?B?b3dTZ2lKNlM1eldkSjN0ZDlwUklTVjdDc29ncEFocU04S1pCY0FOSHFCUXBs?=
 =?utf-8?B?eVg1SWNHaURCcWdKbGhGWldsRTMzT2xjcXB1QmpEazdWV1VjLzNzdlBMKzBG?=
 =?utf-8?B?ZTgramZweUhYczJ5dkJDTC9xZlRBaDN0RTFwM0p4ZjBqWmNOajlPUXJucUxo?=
 =?utf-8?B?dDJwbkFpaTMxSmhRSXY5Zk1NNk1oMDZmNkdYNmd6Y05SK1RDYUljbStXMmpt?=
 =?utf-8?B?cjR0VlNjMXkwQXZ3bW5NMVBJbVVNa3lRRTdCS3M4aG5lb3RPRVVqVy85aFcw?=
 =?utf-8?B?U3Fpa3Jvb2Z5alVhbURFdFpmK1F2c09vSmJjaU1qZXJLUk1xSDBRL1JvMkxU?=
 =?utf-8?B?b3d0MnJZTUFpWWtiTEhVQ0d4dmhKc0xGUnpxUFE5RGJDUjgvOGh4NHVBRjJ3?=
 =?utf-8?B?WU0vWEJnMUJ0bG15cWZlQVJvVG5LQ2V5SUVHeVZ2TGZlMXdCRzRzaUJpdFUv?=
 =?utf-8?B?TUQwRFQ4MjRKWFVRQTNBTlBXaU15dzk4c0Y4NXdwYldpRkt1RXB5bG1uRy94?=
 =?utf-8?B?M1J6alhLU1pMMTRsVjIxdGs2RmViL1hPcGxjRlEzcVdkNTJKNjU3bTR1N2dW?=
 =?utf-8?B?Q1pDQmk2Vm05Qm1xOFZIWFl1ak5oVDBsMmVTUUdpUHpnZkx4SWhKOXB3T1I3?=
 =?utf-8?B?OHY1RHhwQTkyRjhoYU9jOG9zZDVYMnY5b1RHY05acUdSYWxJQlFyek9WRHVX?=
 =?utf-8?B?djI1VWtYQ3pudkk3NWFRYk1IUWZ6UWpFbkF2V2MvblpXRlVTVFpDeG5VU0ZZ?=
 =?utf-8?B?SGQ5TnZDZlI2MXJsVnpXbDErcnJwK3l4NjBKVXlpMVpNZnExMmtKa0VaNi9C?=
 =?utf-8?B?UGdBanRjQjV4MWloTGI5VkhFeE1uU3l5MngvbjRlTkgzcFJWZlRGVEJieVhG?=
 =?utf-8?Q?ZxTVsUxpCrHHdiVRNH7jz3yVU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F24CE2E55027446B6E8D94EDD6081ED@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	b3uKxsgxxQRTYMtSfWd797LXcy5UJChZFyN+iTP37iAb5aBZnc3muqcubGFW9gH0YkBuRHELAYmt4pyrWQB7vUNEzP49hEEvItOaJ+XfXGZi4C6IEV1B9RQRUT93Q5ZJZyEwzOgpHYfP75H5/qIEcmADSyXqU5hWNqv3Qf2ZwuXYQO1m5EdPDgyP7knmaeUvPCEAhUhLaU5+mEYPMilXXSYq3/J1sa8dlfIUgkRvUVf1pX4IKnAQDGIL9z14rPg1ZjFejY9J1NIVbhMvpglE9KRVGM+jQOA6rSky5Tk5V+fFvwhZnPWqPlP3wJH8lsaR2CJT531vpFAX5gJJgADWb9seGf3TAUsDVymoT3+eczimt6IzDjXLFDxDA7b+ycAL+eaRvD0TB+ReOcFrl121Holk/l80A7uGtvCNBWmhQlhDcqqTHpd9+dOmYfI6K5jmoJjEKC/+6Ox/xu1UpJUVdVs8iw52jO46RF4k8a4Z0N0bLp1f+2RT8LcUo9F2NqVsHBCQ3O+EwujrIvNcuwk6/IYCJbwmSqbqf7GIhouY6f+GBYc6XF2lY5/wLwThhfyaDGvt0B/u9ytEU8Z3jksjpj8+WVxqvZpuQGFDs4xWlGINEwo+imz6rTwWmMMeHnGgkhT/XE8ozvu8cwRu3hQwgA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 551f8cd3-0fe3-44f3-30db-08dd762e1692
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 23:44:07.5522
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c+kCMIfeR8uECrAW6vc7ATCmj9VRzhZ2qyywHp4eKav2h/Z6Va9GH991wmpfIkaoIIaRaQWJihPtlw3EOOTUGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8781
X-Proofpoint-GUID: 9wdnIILtejkwPH_s_S3jmfMPuI1gT5Kz
X-Proofpoint-ORIG-GUID: 9wdnIILtejkwPH_s_S3jmfMPuI1gT5Kz
X-Authority-Analysis: v=2.4 cv=FZM3xI+6 c=1 sm=1 tr=0 ts=67f46355 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qPHU084jO2kA:10 a=VabnemYjAAAA:8 a=SMw-t9EX-mpSK0Nnp00A:9 a=QEXdDO2ut3YA:10 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_07,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504070167

T24gVGh1LCBBcHIgMDMsIDIwMjUsIEZyb2RlIElzYWtzZW4gd3JvdGU6DQo+IE9uIDQvMy8yNSAx
MjoyMSBBTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IE9uIFdlZCwgQXByIDAyLCAyMDI1LCBG
cm9kZSBJc2Frc2VuIHdyb3RlOg0KPiA+ID4gT24gNC8yLzI1IDE6NDkgQU0sIFRoaW5oIE5ndXll
biB3cm90ZToNCj4gPiA+ID4gT24gVGh1LCBNYXIgMjcsIDIwMjUsIEZyb2RlIElzYWtzZW4gd3Jv
dGU6DQo+ID4gPiA+ID4gRnJvbTogRnJvZGUgSXNha3NlbiA8ZnJvZGVAbWV0YS5jb20+DQo+ID4g
PiA+ID4gDQo+ID4gPiA+ID4gUHJldmVudCBkd2MzX3JlcXVlc3QgZnJvbSBiZWluZyBxdWV1ZWQg
dHdpY2UsIGJ5IGNoZWNraW5nDQo+ID4gPiA+ID4gcmVxLT5zdGF0dXMuDQo+ID4gPiA+ID4gU2lt
aWxhciB0byBjb21taXQgYjJiNmQ2MDEzNjVhICgidXNiOiBkd2MzOiBnYWRnZXQ6IHByZXZlbnQN
Cj4gPiA+ID4gPiBkd2MzX3JlcXVlc3QgZnJvbSBiZWluZyBxdWV1ZWQgdHdpY2UiKSBmb3Igbm9u
LWVwMCBlbmRwb2ludHMuDQo+ID4gPiA+ID4gQ3Jhc2ggbG9nOg0KPiA+ID4gPiA+IGxpc3RfYWRk
IGRvdWJsZSBhZGQ6IG5ldz1mZmZmZmY4N2FiMmM3OTUwLCBwcmV2PWZmZmZmZjg3YWIyYzc5NTAs
DQo+ID4gPiA+ID4gICAgbmV4dD1mZmZmZmY4N2FiNDg1YjYwLg0KPiA+ID4gPiA+IGtlcm5lbCBC
VUcgYXQgbGliL2xpc3RfZGVidWcuYzozNSENCj4gPiA+ID4gPiBDYWxsIHRyYWNlOg0KPiA+ID4g
PiA+IF9fbGlzdF9hZGRfdmFsaWQrMHg3MC8weGMwDQo+ID4gPiA+ID4gX19kd2MzX2dhZGdldF9l
cDBfcXVldWUrMHg3MC8weDIyNA0KPiA+ID4gPiA+IGR3YzNfZXAwX2hhbmRsZV9zdGF0dXMrMHgx
MTgvMHgyMDANCj4gPiA+ID4gPiBkd2MzX2VwMF9pbnNwZWN0X3NldHVwKzB4MTQ0LzB4MzJjDQo+
ID4gPiA+ID4gZHdjM19lcDBfaW50ZXJydXB0KzB4YWMvMHgzNDANCj4gPiA+ID4gPiBkd2MzX3By
b2Nlc3NfZXZlbnRfZW50cnkrMHg5MC8weDcyNA0KPiA+ID4gPiA+IGR3YzNfcHJvY2Vzc19ldmVu
dF9idWYrMHg3Yy8weDMzYw0KPiA+ID4gPiA+IGR3YzNfdGhyZWFkX2ludGVycnVwdCsweDU4LzB4
OGMNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBGcm9kZSBJc2Frc2VuIDxm
cm9kZUBtZXRhLmNvbT4NCj4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiBUaGlzIGJ1ZyB3YXMgZGlz
Y292ZXJlZCwgdGVzdGVkIGFuZCBmaXhlZCAobm8gbW9yZSBjcmFzaGVzIHNlZW4pIG9uDQo+ID4g
PiA+ID4gTWV0YSBRdWVzdCAzIGRldmljZS4gQWxzbyB0ZXN0ZWQgb24gVC5JLiBBTTYyeCBib2Fy
ZC4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiAgICBkcml2ZXJzL3VzYi9kd2MzL2VwMC5jICAgIHwg
NSArKysrKw0KPiA+ID4gPiA+ICAgIGRyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgfCAxICsNCj4g
PiA+ID4gPiAgICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiA+IA0K
PiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2VwMC5jIGIvZHJpdmVycy91
c2IvZHdjMy9lcDAuYw0KPiA+ID4gPiA+IGluZGV4IDY2NmFjNDMyZjUyZC4uZTI2YzNhNjJkNDcw
IDEwMDY0NA0KPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZXAwLmMNCj4gPiA+ID4g
PiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2VwMC5jDQo+ID4gPiA+ID4gQEAgLTkxLDYgKzkxLDEx
IEBAIHN0YXRpYyBpbnQgX19kd2MzX2dhZGdldF9lcDBfcXVldWUoc3RydWN0IGR3YzNfZXAgKmRl
cCwNCj4gPiA+ID4gPiAgICB7DQo+ID4gPiA+ID4gICAgCXN0cnVjdCBkd2MzCQkqZHdjID0gZGVw
LT5kd2M7DQo+ID4gPiA+ID4gKwlpZiAoV0FSTihyZXEtPnN0YXR1cyA8IERXQzNfUkVRVUVTVF9T
VEFUVVNfQ09NUExFVEVELA0KPiA+ID4gPiBMZXQncyBub3QgdXNlIFdBUk4uIFBlcmhhcHMgZGV2
X3dhcm4/DQo+ID4gPiBJIGNvcGllZCB0aGUgY29kaW5nIHN0eWxlIGZyb20gY29tbWl0IGIyYjZk
NjAxMzY1YSAoInVzYjogZHdjMzogZ2FkZ2V0Og0KPiA+ID4gcHJldmVudA0KPiA+ID4gDQo+ID4g
PiBkd2MzX3JlcXVlc3QgZnJvbSBiZWluZyBxdWV1ZWQgdHdpY2UiKSwgc28gbWF5YmUgYSBmb2xs
b3ctdXAgcGF0Y2ggdG8gY2hhbmdlIGZyb20gV0FSTiB0byBkZXZfd2FybiBmb3IgdGhlIHR3byBw
YXRjaGVzID8NCj4gPiBXZSBjYW4ganVzdCB1c2UgZGV2X3dhcm4gaGVyZSwgd2UgZG9uJ3QgbmVl
ZCAyIHNlcGFyYXRlIHBhdGNoZXMgZm9yIHRoaXMNCj4gPiBjaGFuZ2UuIFRoZSBvdGhlciBwbGFj
ZSBjYW4gYmUgcmV3b3JrZWQgaW4gYSBzZXBhcmF0ZSBwYXRjaC4NCj4gT0sNCj4gPiANCj4gPiA+
ID4gPiArCQkJCSIlczogcmVxdWVzdCAlcEsgYWxyZWFkeSBpbiBmbGlnaHRcbiIsDQo+ID4gPiA+
ID4gKwkJCQlkZXAtPm5hbWUsICZyZXEtPnJlcXVlc3QpKQ0KPiA+ID4gPiA+ICsJCXJldHVybiAt
RUlOVkFMOw0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiAgICAJcmVxLT5yZXF1ZXN0LmFjdHVhbAk9
IDA7DQo+ID4gPiA+ID4gICAgCXJlcS0+cmVxdWVzdC5zdGF0dXMJPSAtRUlOUFJPR1JFU1M7DQo+
ID4gPiA+ID4gICAgCXJlcS0+ZXBudW0JCT0gZGVwLT5udW1iZXI7DQo+ID4gPiA+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdl
dC5jDQo+ID4gPiA+ID4gaW5kZXggODlhNGRjOGViZjk0Li5jMzQ0NDZkOGM1NGYgMTAwNjQ0DQo+
ID4gPiA+ID4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiA+ID4gPiA+ICsrKyBi
L2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gPiA+ID4gPiBAQCAtMzAwMiw2ICszMDAyLDcg
QEAgc3RhdGljIGludCBfX2R3YzNfZ2FkZ2V0X3N0YXJ0KHN0cnVjdCBkd2MzICpkd2MpDQo+ID4g
PiA+ID4gICAgCWR3Yy0+ZXAwX2JvdW5jZWQgPSBmYWxzZTsNCj4gPiA+ID4gPiAgICAJZHdjLT5s
aW5rX3N0YXRlID0gRFdDM19MSU5LX1NUQVRFX1NTX0RJUzsNCj4gPiA+ID4gPiAgICAJZHdjLT5k
ZWxheWVkX3N0YXR1cyA9IGZhbHNlOw0KPiA+ID4gPiA+ICsJZHdjLT5lcDBfdXNiX3JlcS5zdGF0
dXMgPSBEV0MzX1JFUVVFU1RfU1RBVFVTX1VOS05PV047DQo+ID4gPiA+ID4gICAgCWR3YzNfZXAw
X291dF9zdGFydChkd2MpOw0KPiA+ID4gPiA+ICAgIAlkd2MzX2dhZGdldF9lbmFibGVfaXJxKGR3
Yyk7DQo+ID4gPiA+ID4gLS0gDQo+ID4gPiA+ID4gMi40OC4xDQo+ID4gPiA+ID4gDQo+ID4gPiA+
IEknbSBzdGlsbCBub3QgY2xlYXIgaG93IHRoaXMgY2FuIGhhcHBlbi4gQXJlIHlvdSB0ZXN0aW5n
IHRoaXMgYWdhaW5zdA0KPiA+ID4gPiBtYWlubGluZT8gQ2FuIHlvdSBwcm92aWRlIHRoZSBkd2Mz
IHRyYWNlcG9pbnRzPw0KPiA+ID4gSSB3YXMgbm90IGFibGUgdG8gcmVwcm9kdWNlIHRoaXMgbG9j
YWxseS4gV2FzIHNlZW4gb24gNS4xMCwgdGVzdGVkIG9uIDYuMQ0KPiA+ID4gYW5kIDYuNi4NCj4g
PiA+IA0KPiA+IFdpdGhvdXQgdW5kZXJzdGFuZGluZyBob3cgdGhpcyBjYW4gaGFwcGVuIGFuZCB3
aHkgaXQgaXMgbmVlZGVkLCB3ZQ0KPiA+IHNob3VsZCBub3QganVzdCBhcHBseSB0aGlzLiBLZXJu
ZWwgdjUuMTAsIHY2LjEsIGFuZCB2Ni42IGFyZSByZWFsbHkgb2xkLg0KPiA+IFdlIGhhdmUgYSBs
b3Qgb2YgZml4ZXMgc2luY2UgdGhlbi4gUGxlYXNlIHNlZSBpZiB0aGlzIGlzIHJlcHJvZHVjaWJs
ZQ0KPiA+IHVzaW5nIG1haW5saW5lLg0KPiANCj4gV2UgaGF2ZSBhcHBsaWVkIGFsbCByZWxldmFu
dCBwYXRjaGVzIGZyb20gbWFpbmxpbmUgdG8gZXAwLmMsIGluIG9yZGVyIHRvIHRyeQ0KPiB0byBm
aXggdGhpcyBjcmFzaDoNCg0KV2hhdCBjYXVzZXMgdGhlIGNyYXNoPyBJJ20gc3RpbGwgbm90IGNs
ZWFyIHdoZXRoZXIgeW91IHdlcmUgYWJsZSB0bw0KcmVwcm9kdWNlZCB0aGlzIG9uIG1haW5saW5l
LCBvciBhbnkgb2YgdGhlIG5ldyBzdGFibGUgdHJlZS4NCg0KPiANCj4gNTY2YmM3OTNiZGQ3IHVz
YjogZHdjMzogZXAwOiBEb24ndCBjbGVhciBlcDAgRFdDM19FUF9UUkFOU0ZFUl9TVEFSVEVEDQo+
IDM3MWQzZmM1NzdkYiB1c2I6IGR3YzM6IGVwMDogRG9uJ3QgcmVzZXQgcmVzb3VyY2UgYWxsb2Mg
ZmxhZyAoaW5jbHVkaW5nIGVwMCkNCj4gZDgxOWEwYmJiNDkzIHVzYjogZHdjMzogZXAwOiBEb24n
dCByZXNldCByZXNvdXJjZSBhbGxvYyBmbGFnDQo+IDJlYjNiYTM4YmY4OCB1c2I6IGR3YzM6IGdh
ZGdldDogUmV3cml0ZSBlbmRwb2ludCBhbGxvY2F0aW9uIGZsb3cNCj4gY2JmY2Y1MTdkYzQyIEZS
T01HSVQ6IHVzYjogZHdjOiBlcDA6IFVwZGF0ZSByZXF1ZXN0IHN0YXR1cyBpbg0KPiBkd2MzX2Vw
MF9zdGFsbF9yZXN0YXJ0DQo+IDRmYzM5MzI4NTc5ZSBVUFNUUkVBTTogdXNiOiBkd2MzOiBBdm9p
ZCB1bm1hcHBpbmcgVVNCIHJlcXVlc3RzIGlmIGVuZHhmZXIgaXMNCj4gbm90IGNvbXBsZXRlDQo+
IDVkYzA2NDE5ZDhhNiBVUFNUUkVBTTogdXNiOiBkd2MzOiBEbyBub3Qgc2VydmljZSBFUDAgYW5k
IGNvbm5kb25lIGV2ZW50cyBpZg0KPiBzb2Z0IGRpc2Nvbm5lY3RlZA0KPiA3NWE0ZjBiNWUxZjQg
VVBTVFJFQU06IHVzYjogZHdjMzogZXAwOiBQcm9wZXJseSBoYW5kbGUgc2V0dXBfcGFja2V0X3Bl
bmRpbmcNCj4gc2NlbmFyaW8gaW4gZGF0YSBzdGFnZQ0KPiBhNzllODQ4ZTUyOTkgVVBTVFJFQU06
IHVzYjogZHdjMzogZXAwOiBEb24ndCBwcmVwYXJlIGJleW9uZCBTZXR1cCBzdGFnZQ0KPiA5MTBl
OWU2MDQ5MmEgVVBTVFJFQU06IHVzYjogZHdjMzogRml4IGVwMCBoYW5kbGluZyB3aGVuIGdldHRp
bmcgcmVzZXQgd2hpbGUNCj4gZG9pbmcgY29udHJvbCB0cmFuc2Zlcg0KPiBmZTUxM2UxYzI2ODUg
VVBTVFJFQU06IHVzYjogZHdjMzogZ2FkZ2V0OiBXYWl0IGZvciBlcDAgeGZlcnMgdG8gY29tcGxl
dGUNCj4gZHVyaW5nIGRlcXVldWVUaGFuDQo+IA0KDQpDaGVycnktcGlja2luZyB0aGUgdXBzdHJl
YW0gcGF0Y2ggbGlrZSB0aGlzIHdpbGwgYmUgZGlmZmljdWx0IHRvIGRlYnVnDQphcyBJIGNhbid0
IGRldGVybWluZSB0aGUgY29ycmVzcG9uZGluZyBjaGFuZ2VzIHJlbGF0ZWQgdG8gdGhlIHVzYiBn
YWRnZXQNCmNvcmUgQVBJIGFuZCB0aGUgZHdjMy4NCg0KQlIsDQpUaGluaA==

