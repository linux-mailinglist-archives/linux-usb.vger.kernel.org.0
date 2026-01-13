Return-Path: <linux-usb+bounces-32206-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EDCD16143
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 01:50:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3753230285DC
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 00:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1512253EE;
	Tue, 13 Jan 2026 00:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HQPRdlPB";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GmOgZmdA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="rlO0VJiP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196D8163;
	Tue, 13 Jan 2026 00:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768265420; cv=fail; b=GtAAGy20FJ+mDXyLWXEcJqkhT6yb7YCqmyhx1sHmMUUJVPN7675n0q9tG2XHxjXkGYR0ujXA0tTVb/egquKX3qg2vAW0BVCgThGjgLVKT2hWtpH0oO8pN93g5VIGmbe4UGwA3Qrpq71pjxdGv/ANgNFdq00tpyZlCImv15cxfMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768265420; c=relaxed/simple;
	bh=YnPta698kKSOX+c+nTouBa5+ZZZpSCEbz37aivEsJqU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=evF45VUO0qr5HjaVtB1R47ztxDO/fSDtlsOOJTDH/ONLrTiHfwhI964BVFwoKFCbitKwj1j6/+Pwx0uSOGioaIhZPI//DrwAJ/CQq9t9VwvhriIwNP9BVnKAhVTb/3K0WtohkD1G8rtFH6ASeSZQiJq37xBxfUWvAZ4xgDCT55M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=HQPRdlPB; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=GmOgZmdA; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=rlO0VJiP reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CKGfwE3837368;
	Mon, 12 Jan 2026 16:49:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=YnPta698kKSOX+c+nTouBa5+ZZZpSCEbz37aivEsJqU=; b=
	HQPRdlPBXeypM7YzPWpF6Qabk/lf9+7+gvue11GAgAgLF0+LYCqL3shnLGPRBRs9
	JiueB0GyCqC0EI+JnmZoA10VULiiiNlI1eizHSXxojyfjs7dDg68zh7TM5z/E5jG
	IB3Dk/6ddxV1UWTwXrSy62puwQCR3CGcPrP6WUP48P2V8ocI1GoL9dmy/6lzs2Tw
	d8HLVvqM8t7Bp8w8hjmWMPl5MK6/7MkW0Ogr96yFaYacboK04N1wfzsR7CQcq+85
	QQsjaqVyJRqzmpzrGJPiY567DlVFjKXcQBK2m1zrWPt3KoGRSoRHtDDJHVDj+pQa
	dK75XlcV3VWU7exAY3ytqA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4bkpnq8snf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 16:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1768265393; bh=YnPta698kKSOX+c+nTouBa5+ZZZpSCEbz37aivEsJqU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=GmOgZmdAUmjYDhe4hwdv7H1AHHnp1Q4ULdME84x+FB4SeB0Gf/v54GYWW/czvAmid
	 gRsXAmq59i+mRmuXDqwTa/U+Gn++XUU/tu410pnWzAWNnZFkKP79/5QTdqOTSDQNc2
	 cvdI5R4EA4SE45uV1KZABAU4P9tD5/9Zj8ESeziV5LZOMjzHxuPCjD40By8HtAzbYt
	 C5sNhVPONGkj0ZerZla+C+TIWLuf+o5EQTn6Jckl2GCnDF79xtrDyk4mfBFlk9fLG0
	 eJHiq8edmiH8EVVd/18Z+FQwJyvxgk6XISH8WOs4oEngvM/0xDaB0LRJLZfue7UxAf
	 KqvF4BHWBblrQ==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CFFDE40563;
	Tue, 13 Jan 2026 00:49:50 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id BA39DA0073;
	Tue, 13 Jan 2026 00:49:50 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=rlO0VJiP;
	dkim-atps=neutral
Received: from CY3PR08CU001.outbound.protection.outlook.com (mail-cy3pr08cu00102.outbound.protection.outlook.com [40.93.6.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 18FFA220156;
	Tue, 13 Jan 2026 00:49:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i09DBnYdoVrzlsTBBMnAaDE7TDik7BqdM0ci3LHGcYEDtWiFBzmTfpc5qJjmawUSZ82C6oib9Z4B2LuUWzvDk2WxKln75taqbT1eXpETOrwtCBc5XJOGjJzlW1aKL1TlIsyx/nDkf+A0vwRFKLss/UuonWSzhtlPrXItyQEeieJekgaN5K2Ko5ximFJ/o2v34moDtp3EtQSP3CPHrLDwD9UxzSzXH69a7iuub2BcI6tQ/UCuiHtu2fGmZSbQTfZy7GKbhxRoecG8kn9P/nQgfCRLk7DqhVTa1iF5fpC9ipIQGFnk/SVu7S+ho5V2eQz5nwFHM/nZbGXU9kvL3JWkCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnPta698kKSOX+c+nTouBa5+ZZZpSCEbz37aivEsJqU=;
 b=Vw90yj6FKsJifLOwyvn7P1EpsycpEMIE8WA9oxupwAc/+iPbsL4H34b9auaTw8zJfWrxIV6vAXP4wf5UPwdOItlxaBEpiRlIVuEvS91rIiT8JWKUnSyu/N4D4btN3vNqXpj7lyLlUmkPJAQE9CFFCMssvhMEHY/LIDiFrHxyXbkCyiuee4ttzB7mpcU4dFEDvQxlhwuNE+1IIrbKV9UbrIGiI5wKi3mq8PDEAqv8PHbnfyEtNx6M2ACpTeS7V+7n4QBGEgaXSIpvm/xF3OinhpJbfISd8OiVVwAAkFp1FaDyzEEB2j/xyZC6UNPlSMt0I/H1GfEZCog2ZtBizqZkTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnPta698kKSOX+c+nTouBa5+ZZZpSCEbz37aivEsJqU=;
 b=rlO0VJiPPweC6SslK9rD1Iu8Uw2xzhcznhF0Lpt4tdV0zdWUvIOR94R9zB+r4SIuKn+DDM3w4Td2KCHrBijsSI52zDM71EI3S3Ec6IbeZBt2pipZRIylScf/f8MPyRAna5e8011sW+9Ui1KZPercVKfhUODTjaUokHvvFuovsJI=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DM4PR12MB6637.namprd12.prod.outlook.com (2603:10b6:8:bb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Tue, 13 Jan
 2026 00:49:45 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 00:49:45 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Sean Anderson <sean.anderson@linux.dev>
CC: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>,
        "Frager, Neal" <neal.frager@amd.com>,
        "Simek,  Michal" <michal.simek@amd.com>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: dwc3: Always deassert xilinx resets
Thread-Topic: [PATCH] usb: dwc3: Always deassert xilinx resets
Thread-Index: AQHcfy9dgzbCYKtHtUStePNrj7tTSLVJBR6AgABXXoCAAKTngIAFTT6A
Date: Tue, 13 Jan 2026 00:49:45 +0000
Message-ID: <20260113004941.4fhmvlkhf5pifwgt@synopsys.com>
References: <20260106171018.501612-1-sean.anderson@linux.dev>
 <20260109004901.ygts6mmcxy4vs3y2@synopsys.com>
 <MN0PR12MB59538C2F8613A9C0641BEAFBB782A@MN0PR12MB5953.namprd12.prod.outlook.com>
 <8f0e04a5-49df-4fe3-9c76-9a1c0bd822a0@linux.dev>
In-Reply-To: <8f0e04a5-49df-4fe3-9c76-9a1c0bd822a0@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DM4PR12MB6637:EE_
x-ms-office365-filtering-correlation-id: 4a7f6ff1-a783-47da-64f0-08de523da540
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?YjhBVUtBVHRGVkJRTHpPdEI0cHIyVjRJaUYyZ2xLeHlSTE5PR2NXeG9tdGRo?=
 =?utf-8?B?dGMwbVVwZGNMVEdwWkFzM0YvMnJrZmI5OTlXVEYrVVpiTmVNbGYwWDBySWl5?=
 =?utf-8?B?SXZVWVY0cEJtTXcvSnhOUmpIWWp5UkN5eWgrWXRVNFp1TENIQ2JBYktNZ2ZZ?=
 =?utf-8?B?SWpwR3BweFhtVG5ETkpoOUNSb3lxVTBEYWNPdGRqbU4rcE51a205NGxzVXA4?=
 =?utf-8?B?NkZqUmJLSkhXNnFtOXVWb1dUdDF2Uzk4WmpkaTVnbk5tQ2tFM1ZlWE9jZDlJ?=
 =?utf-8?B?T2RrdkFFUHhGcU1ScjRqZFF4cTNtbDFtd3hWM2hWc0thcHdWcHh5TUx3ZWFw?=
 =?utf-8?B?ZURGR09BS2c5QVQvNUFzM1V3Q1FnRlVrdDg0YWprb3ByTkNVczlwUXdKNG5L?=
 =?utf-8?B?K0FudUt1QzllZHNZTDF2K1phTThpUHM2NzVKTnlJYmFoMEFlRmc0ZlRkZFYr?=
 =?utf-8?B?eE1BYXNjaFVJNDZxVW5lSytEaVJoeGxYVitsMjc5cE96UVorWjVuZ2pzR1Ru?=
 =?utf-8?B?aGVpSi9YQXRlZ01WTjd2Ulk5TENSWGwxamo1ZDJFSThWNlF0ZGhLOU5GN1dF?=
 =?utf-8?B?SmFuNXpab1IvQkFaeWszS2RmSitFQ216eDF2TWhTSmhBdGxmUnVGRzlQeGNO?=
 =?utf-8?B?Y2dCVFhuYnJyUFJJTGM2MExaRVVJa0xNWnE2VTRxVnhnQlJnUDEyTXdBeTlM?=
 =?utf-8?B?akZ6MytxUVYxMk9Vc2Vmd3hDay9oa2tHa3YxaHYydzg5T0NiZlFLNTJ0T3lm?=
 =?utf-8?B?NVZtS0laYjMzL0VxT09xZzZpUHJORnR4UE54bjF2Sjg3eVRPK0RGRFUxbG8r?=
 =?utf-8?B?b3NjV3Q5SFZOOFNCaG90ZFFrZmc0TkJiei9pa1RJTldSbkU3RkFFeExHWWlN?=
 =?utf-8?B?b2g4bm9wcDE1UEppUlcyTmYrcTRPcWY0ZER0eWM3dHh2dmZacVdQZ000TFlS?=
 =?utf-8?B?WlYvMGVvcVVUSVNJZVduU1k5MHhMRktXaGZHNzVpRTgrZlM1NERMR005aEU3?=
 =?utf-8?B?Z0FhRjd4ZnpJeG01WEJBVVZNc3ZTdnBIT2VERFd2Znk4YXR0L1ppL21JZkZS?=
 =?utf-8?B?WjNLQ2ZyalhHM0FRenBqOE91TUc4TTBQZ1k5RHpVd0ZlcmJJQ0M3aXhLUnJs?=
 =?utf-8?B?eHBaUFRhMWVjMjVkYk8wVklDZDhDYUFLeTkvNkJIQkxPRCtrY21vUVQrWDM0?=
 =?utf-8?B?OWlLa1BVNWI0bEpIWFRVdlRkeDluNTBBYmlQUmdNZHNNV25sTnVIaS9Ybkgw?=
 =?utf-8?B?TlFUZU5TVVg1NVRXSkszTmtEK3pqQlAyWHJpbElyRk1QWU9tbk55cHRFUmFs?=
 =?utf-8?B?azcrbGN4aEtkWG9ITEZZMk8wUTd6ajdQZGVKZkltMkJJTmJYNGk5T1FnUFdh?=
 =?utf-8?B?eTNWTTU1SmNOTHh6N01tei9hNlVwcEhmbnRLcnR3eFdsZndBbmdndWVWNThT?=
 =?utf-8?B?ZGJzZ1JwcndDYnArWU1PTXdkQUpEMXNtRlZ5YlRuT3c1U1ptWkhZbE5xT3FI?=
 =?utf-8?B?QStXVk1DMjRuZ0FtVkthamRtd21oN1Q4aXJnNzdYc1FpUjBmOHU5UTZEWEVz?=
 =?utf-8?B?SjRtNUlBQ0NSRXF0Z3hlVktMY29hUWdrUUkrU1VMQUxibE8wWUVOSTJGREZH?=
 =?utf-8?B?bjAveUx2S0xhOGsrMi9MMXR2T2VrMnFmODF4WFBuNXovems3T0h0bEMzandr?=
 =?utf-8?B?dEllRDFMT1FvWVRFdmluMnBXZ3FtS3AvaTA0bGNXSm1yQ1J0MnM4SkNlZzJY?=
 =?utf-8?B?WEdGdXpLYU0vM2JKTER1V1J6eFAzVEFqeVY1cFlBVUdrNjFKVG44NTk1WkRS?=
 =?utf-8?B?Mm82MU1PR1FCazlUTWUzNGdkL2RZZmVRUVRrdTBWbFcxTnR6UG5keUNVWlZ3?=
 =?utf-8?B?UmtNT3RQSkJVNjVIS1F1SjcrbmZkQUQxODNTWngyS1AzMGlpZ29QNzZCQjZ4?=
 =?utf-8?B?V1FrTklyZWR0V3VBUktHaWRhOCtZYmwwbEYwUm1sSmlocnhJSGhYZk9HSkZG?=
 =?utf-8?B?RFVBYXFnUDVCUHJrV2swVzhzcGorbWdiWUdSK2tWdWxrVjJRL21ETWxNZGJY?=
 =?utf-8?Q?3MRMbS?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NEErbndZM25kUmdoVHdQczU0MFVyQ2J2d3YxNU1jTHNXbGFaQnNDYUl6b21G?=
 =?utf-8?B?b3p0NkFsVEZIbFFYbTdXOVFVaVc3RCtMTU83NDVLWnFXVjVGVWxUN3ArckdC?=
 =?utf-8?B?cmhWbndSZGJIYlp2U2dDS1RuN0YyK1hlRDY2TDAxQXRkdVFYTjBDcUcyZVZk?=
 =?utf-8?B?clM1ZElMMEVGelUrOHVPcTZQQU9QM0xqVzBzWXNHWGhORTdaNERKeGNHb0Mr?=
 =?utf-8?B?NVZaNVpEUlZ6VFVoRmx6aXowOUlVVHlZNnJHTnFzWVBDMFVTL2FPcHBwSEtS?=
 =?utf-8?B?Z3hXQklKMHlPZTAwVE5FUkgyZTZlRjByWUk3YUJGcm9wYzFvZjh6YW83WE5o?=
 =?utf-8?B?OEV6czczTjR4eEM2VVJ2SGRhWnV4eCs3SFVpWXhlOVZ0YklDTFFjQ2VEanZi?=
 =?utf-8?B?S1VUei9GWnRoRExJcUtRMFZvcGlFQkoyZ2piTFlhdTUydkUzaGlFRjM2NnBh?=
 =?utf-8?B?eXVXU0F4SGMwRW14ekF3UCtWdzBqbUNCaEJCYmZEN21KZkV3OSsyb01DVWd4?=
 =?utf-8?B?YlFLOUxCL2JCZWk3OTlUcXBnM0RZNXVMS1FzQlZUMVkwWEpvMXNoSHJhemVG?=
 =?utf-8?B?aXhpbTZ5aTJ5QVdCTENFeW9ZbkZUcGRTMEMwUE9RV1hqUklRSDc0Q2xiRHA0?=
 =?utf-8?B?NzlYTzYzNC8xaUNMV2gzRjI1R2R4SFg0bXNSYms0TStSWW9OQzJ3Vjh4V2J2?=
 =?utf-8?B?WXNLNHZXS0V3Yjg4a082NjZVcGMwMU9BR3l2UkZoWXBUa0VoTGJwQkJSMFkx?=
 =?utf-8?B?SnRNSklVOE8zT01kbVFXN2xkaTJPZk1qQ1BmUzRGLzRIUytVODhHMG15V3h6?=
 =?utf-8?B?Q3BOTXg4U29NTUd0N0xQM2Z2dEY2cHB0d3V5WGFiSzROLzJ2SWFreUh0Y0Vm?=
 =?utf-8?B?dVFCUmJBeGFWd1BHRVJxTFBLTTVaRUNGNW1BREdTLzlJMk13aXRjaGlXaitW?=
 =?utf-8?B?dUI5dGdKVzM1dU1MaXZ6WnkyRGgweXliaVdJTWp0SkJYQzAyRk9Wb2dXbm4x?=
 =?utf-8?B?aFA1WUVHM0RVMWxrWFJ6TmMzbE5haHh0aER6WWhaSXNmUCtWL1hZT25IK0I5?=
 =?utf-8?B?NnQrL09HMU95S1Q3dytmK2NXRUVBUVlwYU1sZzBvR2FFZFZSZXpkR3psTzRN?=
 =?utf-8?B?R3gxN05mRXZOMHdMU1VmVXVTVllzNkx5V3pkY0d3clZIa09EV0Z3bE1MUUpW?=
 =?utf-8?B?aWU3a1NaQ2R3dzhRb3VJQzhrL1lmRWhNWjNjdWhhcTdXMTVZYTlYUElqS3p4?=
 =?utf-8?B?bXJDTUI0Y3ZGTVFTMnZGSkFMUFovUmV2QzRBT3R4TElCTVFlRURkdk9GTXhh?=
 =?utf-8?B?amp3NFVVTHZmV0U2ZEc3L2d2V2pZeW40c2lYV2N1Q2U1V3RVZHB2cWxsUjhS?=
 =?utf-8?B?VDVVUU9jVmZFRlhPOFQzMHltTVZ2OVduUmQyM09qNytwcHVvcVhBSTd6OXZy?=
 =?utf-8?B?SzVFclNoMEZiNlZZb2x6M09RMEJ6OGJOVmFrMElVT3J0UGJOQU5CSkxaakJt?=
 =?utf-8?B?VHZXZ2RSbXFVY3N6UjZnVVZwUmZROGRjeEhEMDhITVZROVNvZThRTHkzRzdU?=
 =?utf-8?B?cGM1QkN0K1Zja24yQ3pmdjZ2NlArMGJqbk5mSFA1cjVtUW9NeG1KbElSejEw?=
 =?utf-8?B?aS9iTFhZdFFOdnZ1dHc1TDQ2RUxYVnArNzk5ekVHdmdnN3F3dzBrUmp3OGsz?=
 =?utf-8?B?S2xncG51aVhrdDduaVRCU3NDM1gxdFUxUk1vSVNhM3Q5UVozSTFURXQ2cCsr?=
 =?utf-8?B?VGZ0SHhKUVBldXYxMlBjOHhqVmRUTmwzSVFvWm4xR1RHLzN5T0g2clRuSkdT?=
 =?utf-8?B?cnNwT2RwUU5JL1J5SVZqSWVuTXltSHBRRm5JeFJ4Q29JSFVHMjJiYjJEa2JH?=
 =?utf-8?B?MFd3Y1VrenR4TXRMeWpuY1h5aWtmdWRUVE1yTWZzZVVMQW0vdnRPbUN6c3Iw?=
 =?utf-8?B?MEhKS2ZPaUtPWlU0UjdDd1lvNFFSdnE3bEhxN3l3QW45OXd5aTJnTWgxQ0dw?=
 =?utf-8?B?NWIxdUhDbHhqVVdLSndXaWVTWG9tVFJsMEdCTXlPYjRwcy9DVW1zcGZsQTJ0?=
 =?utf-8?B?dWtrdlpadXlnNko1MXRpN3d4VFlpcmlsbDhmUkVvV0xJR2RVQWI1NFdsRnZ6?=
 =?utf-8?B?NmlEY3pvTnJRcDl3bUU3ZXJQREI3dk53c3lrQmppaUJxZXBmdm9GelVuazV2?=
 =?utf-8?B?WmcwZTloOVpOb0o1ZU9nUGhINEFhbE9idUNmQ1ZIdTdFM0o5UzFpVHdFVGRT?=
 =?utf-8?B?WFpiZUtaTFVFZW5aRlUyM1kyYk1zb3dLek83UjlRM3JXcjRlSFJQbmFLZ29S?=
 =?utf-8?B?czAwTE0vTmt1QzcrbFBINjIzUnRKYU5RRFIrVU0zRVZvL2hlRzlSQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B36C619166FC4B4ABD3A5DBE3DED6A7E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ti5EqgXOMQhx1XjQFHIk0x89p5n2bnp/4Rjc9/YpPRrD/NJneYVprMmvZ2ySJwzTql4fN74txlHoO6YbZqOzGC4/xveX+tjxrFcUbdaS+v+NNr+lCzP1PW/HSguUxAq/VXZvnpii9xG297mO48TLN0ZFqCaZNNk9HjA+hl7oi8wXSZSrdJ6EID1+35hPj/8NYYelzZzUsduVSA4i1rFu5oo6p1WaNKOHV0UzMbM4WN4GgY0PYf6JgBpn88NXMQNcZofiP14+J0y4m2JgjUpdcIwjp4AkR6xdYGsvNOrGUGCt8xFrWsUh9us3JSdJsV7LGtVZvW5nhWb2MvYOsbOsWzMl77ctwWwiuFvq6R2ESjl9r8W1N3El6cetRmgDpo8dium4+wKU2h8dB4TNiW8CoPD5M6s8t3CPaYB2So0/hOaosV54mG0iv1Hgt9pF5CxEO7ddtspzVwMZjGZ/rd0Bvdo86GPPaKZ5+jVyD2z/y8fQarJDcDcHkf0xp2j9tdQS5ZCrxqMLjrVDac2Nmllu6RCfGXyNuE+EfvGhD/Qjf/YB7nsmhbau57RaNmfHNuoZUnwyPS8vL0cxhAsP96XSiQ2mcvnhK6xghpxDszHx1FNGaolDwAN0eVtpqSohJ8Otsi6yhhTXz1G4DI0C3e7Z4Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7f6ff1-a783-47da-64f0-08de523da540
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 00:49:45.1710
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nrjcBJhgdbgsehvQMPp2F2TVbaoHkvIh6soXChIwP9hJvwfvtECxIM9RFwqvfKEtBoCprzHasADZGVOvQtDE4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6637
X-Authority-Analysis: v=2.4 cv=NpzcssdJ c=1 sm=1 tr=0 ts=696596b1 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jIQo8A4GAAAA:8 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8
 a=JfrnYn6hAAAA:8 a=ag1SF4gXAAAA:8 a=D7eKEKNB6-R4ukne3JQA:9 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: 2qRvZpUmETBn_eT2jU_zKttbaW9RHSZA
X-Proofpoint-ORIG-GUID: 2qRvZpUmETBn_eT2jU_zKttbaW9RHSZA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDAwNSBTYWx0ZWRfXzCYnEDQXi4hJ
 dXYGEWUKFUwoB/V4Hpy/1dzuUkULXNe/2TyxN8NkuIVBDjxNLg844ag/9x5SflQyRsa8QJrLZwB
 RtoUFk6GYwxf9oKef1kow1vLJZ4qI3Ux3lCUjMYp/mCR8A0ab8WpfizVd1jBx3t59WmzuL0WEWA
 hAidmHU9eu4oTCTc9+NBgHgJkFrCDzNxgd1nP6Kl6sq4399ehrrcWi5WL1ycAPOPUfsl+5h1QnI
 QhANnlv6grgIfYKaBSqGAclMvwykNqnczlrcf22iKhjFjqy24mf1arZZl+9/5jjbBq309x3eNwC
 0xe04UKC6PHU7nnwBLNIY3m2TqKT3/DfNO+gKN5V9WvWqe88QtWf74hIkl/uzGBt7ImPO5xz3ce
 SvFHdTT3NZ29B3D9bd3Nt81ChJRYDYlly3YHNqewS80YaC5gUWJPEZpcNZeZOPiGgvG7JoJ+/fP
 S6Orfr8KeBPQiD4n7Pg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130005

T24gRnJpLCBKYW4gMDksIDIwMjYsIFNlYW4gQW5kZXJzb24gd3JvdGU6DQo+IE9uIDEvOS8yNiAw
MTowMSwgUGFuZGV5LCBSYWRoZXkgU2h5YW0gd3JvdGU6DQo+ID4gW0FNRCBPZmZpY2lhbCBVc2Ug
T25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0NCj4gPiANCj4gPj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5
ZW5Ac3lub3BzeXMuY29tPg0KPiA+PiBTZW50OiBGcmlkYXksIEphbnVhcnkgOSwgMjAyNiA2OjE5
IEFNDQo+ID4+IFRvOiBTZWFuIEFuZGVyc29uIDxzZWFuLmFuZGVyc29uQGxpbnV4LmRldj4NCj4g
Pj4gQ2M6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT47IG9wZW4gbGlz
dDpERVNJR05XQVJFDQo+ID4+IFVTQjMgRFJEIElQIERSSVZFUiA8bGludXgtdXNiQHZnZXIua2Vy
bmVsLm9yZz47IEZyYWdlciwgTmVhbA0KPiA+PiA8bmVhbC5mcmFnZXJAYW1kLmNvbT47IFNpbWVr
LCBNaWNoYWwgPG1pY2hhbC5zaW1la0BhbWQuY29tPjsgb3BlbiBsaXN0DQo+ID4+IDxsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnPjsgbW9kZXJhdGVkIGxpc3Q6QVJNL1pZTlEgQVJDSElURUNU
VVJFDQo+ID4+IDxsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc+OyBQaGlsaXBw
IFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPjsNCj4gPj4gUGFuZGV5LCBSYWRoZXkgU2h5
YW0gPHJhZGhleS5zaHlhbS5wYW5kZXlAYW1kLmNvbT47IEdyZWcgS3JvYWgtSGFydG1hbg0KPiA+
PiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hd
IHVzYjogZHdjMzogQWx3YXlzIGRlYXNzZXJ0IHhpbGlueCByZXNldHMNCj4gPj4NCj4gPj4gT24g
VHVlLCBKYW4gMDYsIDIwMjYsIFNlYW4gQW5kZXJzb24gd3JvdGU6DQo+ID4+ID4gSWYgd2UgZG9u
J3QgaGF2ZSBhIHVzYjMgcGh5IHdlIGRvbid0IG5lZWQgdG8gYXNzZXJ0IHRoZSBjb3JlIHJlc2V0
cy4NCj4gPj4gPiBEZWFzc2VydCB0aGVtIGV2ZW4gaWYgd2UgZGlkbid0IGFzc2VydCB0aGVtIHRv
IHN1cHBvcnQgYm9vdGluZyB3aGVuDQo+ID4+ID4gdGhlIGJvb3Rsb2FkZXIgbmV2ZXIgcmVsZWFz
ZWQgdGhlIGNvcmUgZnJvbSByZXNldC4NCj4gPiBJcyBpdCBhIGN1c3RvbWl6ZWQgYm9vdGxvYWRl
ciA/IGkuZSBpdCBhc3NlcnQgcmVzZXQgYnV0IGRvbid0IGRlYXNzZXJ0Lg0KPiANCj4gTm8uIE1v
c3QgcGVyaXBoZXJhbCByZXNldHMgYXJlIGFzc2VydGVkIG9uIFBvUi4gU28gaWYgdGhlIGJvb3Rs
b2FkZXINCj4gZG9lc24ndCBkZWFzc2VydCB0aGVtIHRoZW4gTGludXggaGFzIHRvLg0KPiANCj4g
TXkgZ29hbCBpcyB0byBtYWtlIGluaXRfc2VyZGVzKCkgaW4gcHN1X2luaXRfZ3BsLmMgb3B0aW9u
YWwgYW5kIGRvIGFsbA0KPiBzZXJkZXMgaW5pdGlhbGl6YXRpb24gaW4gdGhlIHBoeSBkcml2ZXIg
KGFuZCBpbiB0aGUgY29uc3VtZXIgZHJpdmVycykuIEkNCj4gaGF2ZSB0aGlzIHdvcmtpbmcgZm9y
IERQL1BDSWUuIEknbSB3b3JraW5nIG9uIFNBVEEsIGFuZCBJIGRvbid0IHRoaW5rDQo+IFVTQi9T
R01JSSBuZWVkIG11Y2ggc3BlY2lhbC4gVGhpcyBnaXZlcyB0aGUgZm9sbG93aW5nIGFkdmFudGFn
ZXM6DQo+IA0KPiAtIE9uIHNvbWUgYm9hcmRzIChtaW5lKSB0aGUgcmVmZXJlbmNlIGNsb2NrcyBt
YXkgbm90IGJlIGNvbmZpZ3VyZWQgaW4NCj4gICBTUEwvRlNCTC4gU28gSUxMIGNhbGlicmF0aW9u
IHdpbGwgZmFpbCAoYW5kIHRha2UgYSBsb25nIHRpbWUgdG8gZG8gc28pDQo+ICAgdW5sZXNzIHdl
IGRlZmVyIGluaXRpYWxpemF0aW9uIHRvIFUtQm9vdC9MaW51eCB3aGVyZSB0aGUgcGh5IGRyaXZl
cg0KPiAgIGNhbiByZXF1ZXN0IHRoZSBjbG9ja3MuDQo+IC0gSWYgUENJZS9TQVRBIGFyZSBub3Qg
dXNlZCBpbiBVLUJvb3QsIElMTCBjYWxpYnJhdGlvbiBjYW4gYmUgZGVmZXJyZWQNCj4gICB1bnRp
bCBMaW51eCB3aGVuIGl0IGNhbiBiZSBkb25lIGl0IHBhcmFsbGVsIHdpdGggb3RoZXIgaW5pdGlh
bGl6YXRpb24uDQo+IC0gV2Ugd2lsbCBoYXZlIGZsZXhpYmlsaXR5IHRvIHN3aXRjaCBiZXR3ZWVu
IGRpZmZlcmVudCBzZXJkZXMNCj4gICBjb25maWd1cmF0aW9ucyBhdCBydW50aW1lLiBGb3IgZXhh
bXBsZSwgdGhpcyBjb3VsZCBhbGxvdyB0aGUNCj4gICBib290bG9hZGVyIHRvIGZpeHVwIHRoZSBk
ZXZpY2V0cmVlIHRvIHN1cHBvcnQgUENJZSBhbmQgU0FUQSBNLjINCj4gICBkcml2ZXMsIGRlcGVu
ZGluZyBvbiB3aGF0IHRoZSB1c2VyIGhhcyBwbHVnZ2VkIGluLg0KPiANCj4gPiBJIHRoaW5rIGlk
ZWFsbHkgY29yZSAvQVBCIHJlc2V0IHNob3VsZCBiZSBkb25lIGluZGVwZW5kZW50IG9uDQo+ID4g
TUFDIDIuMC8zLjAgY29uZmlndXJhdGlvbi4NCj4gDQo+IEkgYWdyZWUsIGJ1dCBJIHRoaW5rIHRo
ZSBleGlzdGluZyBjb2RlIGRvZXMgdGhpcyBvcHRpbWl6YXRpb24gdG8gcmVkdWNlDQo+IGJvb3Qg
dGltZSB3aGVuIHRoZSBib290bG9hZGVyIGhhcyBhbHJlYWR5IGluaXRpYWxpemVkIFVTQi4gSSBo
YXZlDQo+IHByZXNlcnZlZCB0aGF0IGluIHRoaXMgcGF0Y2guDQo+IA0KDQpJIHRoaW5rIGFsbCB0
aGlzIGluZm8gaXMgdXNlZnVsLiBDYW4gd2UgaW5jbHVkZSBpdCBpbiB0aGUgY2hhbmdlIGxvZz8N
Cg0KVGhhbmtzLA0KVGhpbmg=

