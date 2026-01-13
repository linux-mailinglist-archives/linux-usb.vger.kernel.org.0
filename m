Return-Path: <linux-usb+bounces-32205-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AE0D1612E
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 01:44:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 791E63032122
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 00:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A953221265;
	Tue, 13 Jan 2026 00:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="b27ni250";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fgGzei0J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="R8MeuAJh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BC71F3FED;
	Tue, 13 Jan 2026 00:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768265046; cv=fail; b=iS5tcf5CqWfP7u19IN6Vf+k50RD1DBXVI6pbpklfoOE5K1GVWI4kRy4Yh0YUUoqgQiKWGfHKRG5neE6IrCYBC4yhD7uRHChJ0QYaH2GVOR4VBC6lgQsru5dB1JUjqfzQNgDoywIj2msVjIYtOCtXhMI1BlT+wpXOiyUQ/998aF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768265046; c=relaxed/simple;
	bh=6euSR6YkRN7FXX/8T3ogKGHAZ6WDHIfmt5z9lS/i3tM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FvFPiJnnTQVn0CeWQY4JzD8V633t2g7yQZttewngLc3U+MRnaMxg7mefemQAVT+G38fjbinUAGyKzujlLyYPJ4ZMGwEyMlURkUD6Yfn1dvJ1kofO0hE59dsUy2LdqCzzPohAfFijlMGlUObwXd/7h79bC7dE4K1x5eLGrSvonFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=b27ni250; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=fgGzei0J; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=R8MeuAJh reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CKG6Mi1869846;
	Mon, 12 Jan 2026 16:43:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=6euSR6YkRN7FXX/8T3ogKGHAZ6WDHIfmt5z9lS/i3tM=; b=
	b27ni25054rNnC8dRwxVM/moTh+UhOpCcPS1JpIHeOn7FoBOcHeGylGxqIeM88Az
	ECAEI/GXPog27Yeum6mP/w1b8huOwoUTDr2/y9lkUk2ppp6b+uuU5vcR+5EfXNCN
	psiZcL9S4DNy62c+/QKxgZHi+nmSYuBbkOI40RIupBwGi0D9GgJFHBuAVDs67VkR
	aNvM3h8Amwi0tDlEX6f9ezxc/+KlBwHfLnzis4nCqg7nDxBDnxPDcYkGEAyVSQxQ
	hiCdD+KkyhFJ+Ucrv2RnLPPDh8pUkb6JOU5OL1IYDTnLbzc1+umcPu4319meimHV
	tGAMKTnFrRAOcslarQO3aw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4bn5xkhqgb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 16:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1768265017; bh=6euSR6YkRN7FXX/8T3ogKGHAZ6WDHIfmt5z9lS/i3tM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=fgGzei0Jf7dzfR7Ow3Ncrua50eNOissYib+UU9XatVFEgYgcTYssje1QsR0V3Ob30
	 U+16KhAE8+F+5jAqtEeAMAzhKhB5qOVUfgh9sn8neMyqbMXTWuyW8bvZhSujQOOwwW
	 9hgvrSVA7jNnEkhB5dSqyEJ/mIH588bHBE4n/83ZNYd4LnL+fPc5liWiTWSlrK4FjX
	 rFz33aGMlTkI6+lcArYJLnPVvyBtLBRuB6+GDN7AqeMo3RWnvMJAHO+iT0rcMU15P8
	 tFoODn7damnktstqd0MVassGZHugWDrvZT04axGAcwOenV1OiN0+jtRTGI3bopV1X4
	 BFnHfovfd9FmQ==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6BE3740140;
	Tue, 13 Jan 2026 00:43:35 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E5F5DA006D;
	Tue, 13 Jan 2026 00:43:34 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=R8MeuAJh;
	dkim-atps=neutral
Received: from BL2PR08CU001.outbound.protection.outlook.com (mail-bl2pr08cu00103.outbound.protection.outlook.com [40.93.4.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5C35B40235;
	Tue, 13 Jan 2026 00:43:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTVPxhirRh5tV2x1WBP+spVAN5nkF38mlE2uKeWT0NTPbXTylgcrIt/5uQscnUV5xsl111ZNrWYoWFUmxnpWWX2rL+bPiu6yycDwm29Ym8keK/rWJ2o8ZxQU36xXW89xiDvfyXl8XmF+7M78R7cyP2RL3EYRZ16nADcxOzEgnMmfFiHONn1s2gNXeLHJPJNGXts1SENHl3dh5g8t/9x7ayvzEgs1O1HN2xFIpOPD/O7DPsrOl6S4GZ6UWq/Lxm8BcPQkGMfJjjuEbnjIuJ11bqjSQ17LBG0BYB8TWCst4UmYAUsU2jRqpDtntelIoI34w5NHwoRXktlYW7lUJj68VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6euSR6YkRN7FXX/8T3ogKGHAZ6WDHIfmt5z9lS/i3tM=;
 b=hs5cwqVjuTymYGRQfP6qtpehyuD9ImNEJGkoZ0/ocV4P8ha86ApuGJgUW87ochjeJwhAFGHqWAMITuBKJMcZmiAFtQnxHqjb0jAK9MGwPW61QuCHjazKVJiie+ktEohKkkxCOFuQO05Kp+tNr8RUcMHbaiHZXepvPwAtxl+Kcygga/MEkSIEGsqbp6ioZjG+zlo6JvFNCObwAWhE0819+9+jMy+I5iqfYc6s3f9JoCOZBUoIUvCHMBbGwGxZKCWkpMR5N3VLwGPPJFFfnsj24x7RQHoReueA9Oqk8ZqfUkIx5rtZeuMUwC5zhd4G6JhC+zpUBcTfzA0vQybDhyV1hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6euSR6YkRN7FXX/8T3ogKGHAZ6WDHIfmt5z9lS/i3tM=;
 b=R8MeuAJhCkul0seeZ2aEZ16PiGw7UCgRZeAZCXixgHTUtGTfbTAQBb6He71CTwCSoh7sdOkdFeq55xiNug4MJIMXywJ2ifDpvbjLTJgv/fkkUe8hLKc5f18A/LmnHdpjUL8/F7VDBSKFt2/NjDzLoEnBtUhGFLD8JrV68C7kTsY=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SN7PR12MB6716.namprd12.prod.outlook.com (2603:10b6:806:270::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 00:43:28 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 00:43:28 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Sean Anderson <sean.anderson@linux.dev>,
        "open list:DESIGNWARE USB3 DRD IP  DRIVER" <linux-usb@vger.kernel.org>,
        "Frager, Neal" <neal.frager@amd.com>,
        "Simek,  Michal" <michal.simek@amd.com>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: dwc3: Always deassert xilinx resets
Thread-Topic: [PATCH] usb: dwc3: Always deassert xilinx resets
Thread-Index: AQHcfy9dgzbCYKtHtUStePNrj7tTSLVJBR6AgABXXoCABfBaAA==
Date: Tue, 13 Jan 2026 00:43:28 +0000
Message-ID: <20260113004316.rzspfvyd5aqhwxox@synopsys.com>
References: <20260106171018.501612-1-sean.anderson@linux.dev>
 <20260109004901.ygts6mmcxy4vs3y2@synopsys.com>
 <MN0PR12MB59538C2F8613A9C0641BEAFBB782A@MN0PR12MB5953.namprd12.prod.outlook.com>
In-Reply-To:
 <MN0PR12MB59538C2F8613A9C0641BEAFBB782A@MN0PR12MB5953.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SN7PR12MB6716:EE_
x-ms-office365-filtering-correlation-id: e6e20cd6-685f-44d1-4733-08de523cc49f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?QnVCWTc3R2RqNGpwZjVaUEQ0d3NqZ1BKdlN0Yzdlcm9tU2Z6UzlkUTBxditx?=
 =?utf-8?B?bTcxbmlKK3d4VGZkZWkvdFI5bU00cXVaVEwzYnpSUk9sNzd1SWZRNVhONi9i?=
 =?utf-8?B?aUdqR3ZQNjg2aFFhSUdMbGNKUms4a3g3aEwvZTBIZmVCeHBoZkoxL3lNYVhB?=
 =?utf-8?B?amk3Yy9Gd3YrbitZYjdiV0g0Z2VHRVNkZVhHYzVESUd3NVFWa0JYVHRCZ3h0?=
 =?utf-8?B?K2JIQWNEaGRJenV1cVo5cFBiSHdBU01LaEg2SUlyUjVyaEVScEZIeXYva1g4?=
 =?utf-8?B?aGRrcXc1aFd5S3JzRjhmdGY5d2xyTzVDRURLYnZMckJEUyt5a3owQy8yRTZR?=
 =?utf-8?B?YjNGREVuVTZwcjhMSU00Ky9KK3BsT1BmcjVtSWF0RnNYcEpsdGRkU3JySFpV?=
 =?utf-8?B?b0c2TmZ2ZEMzalhwSWtreXlhdnkyZTZYTXFtcUh6RHlIcENCVzhoclNSQnkw?=
 =?utf-8?B?bUFWLzNiR0lKYW5VVWxiUmYzYjBaUkR3eDRZU0lsNmtNRjdweEk1VEU1WGtm?=
 =?utf-8?B?cGg5TGR4b2FMQk1id1ZYMzhiMDZMMWhTR2tDV3lNUExlRWl6dGJHcUhXWUJU?=
 =?utf-8?B?Q2JQRklXcHZ4c2E5SHp0ZVplb25QY21kQlF6M2gxSTNHWm4wbzdpWnIrTjZo?=
 =?utf-8?B?TERhSCt1MDRZbzZtc1dMbmRPYWx2eXBYekJyZGZjVk9GczkzVG0vWjh3dU15?=
 =?utf-8?B?RDkzVzhFeEdCTWE1QnNab0VFc0p4b3ZYUGROYXAwMGYza2dyelJCckhuZGlC?=
 =?utf-8?B?d1F6Z0dVUUE4U3VVNCtjNUN6MmN0OWZDc3NCb09PdVJWaVhMMWJ6dVVMTkdx?=
 =?utf-8?B?cnlIbmdvY0EyeXZrMHpLWW5UTnh6enlvYVRCaUN2S1Z0Wi9JblVaak40TFgx?=
 =?utf-8?B?T0V5dzgxVmJEczFibjMzQ0dpV3h4Umc5ajBRV0ZVbmF6aFZueVVYMFQ0dEh5?=
 =?utf-8?B?ek4zUk45WTgyTHhDTGQxUTlWc05hUW9uK25DbmN0cjNOREVpWUt4S0ZsNmR6?=
 =?utf-8?B?MmlzV010MzhpVEJGcjRDR3h3QlcxeFZFZGl5aVJXQWcrclhQeUdVa2pMMndB?=
 =?utf-8?B?QXFvbVo3ajJieDZldXBaMmhvWmQ3UjgvQmNJV1R1NHhyMkxIeWlBSTlrSUk3?=
 =?utf-8?B?WXlPUHJQYndUSmtTUEV2UWtxQ3RtWVBHU2dQSUsvUDVPVlVlUlVHMHpLaUlE?=
 =?utf-8?B?ZDNXYk9hRXBxdTZFWWhSTDFsQ0NLUCtiWmVlN2NtTFloZUVkbGtvdnRvZlZv?=
 =?utf-8?B?WWxjSFByT0VjYWhaay9ucEZqNnpER0ExUXhaZmYyM0JBVWRwYno1ajVtNXBi?=
 =?utf-8?B?U3loMW5rQTNsQllGZmhjaXR6TFJMWnFHSGFDRGFWS2liZUtkeVg2SFFxL0VC?=
 =?utf-8?B?Vk5VcU9zdDRwYkZDNDJEaHRzYkFrMFRHZ2pTUUI2eGh3Wk1NVmdVbTUraG5p?=
 =?utf-8?B?WDJHUXlrUjhBT1pybXRMQjJlSU1HRFVhUjdscnBaYlcremhQbVNWQ2g4em5S?=
 =?utf-8?B?cUZVWG40eUlabXJnSXZvYWtjdVNQRzFqYjcxdWYybTJ3ZjJEaE9DZkxCc2k2?=
 =?utf-8?B?bXpCZm41QlFvNGw0U0QrcXJTNlBnNFVGYXlKbUx0bkh6VzY5MHhIMElVVHNK?=
 =?utf-8?B?ci91U1M2cGdDRUIycmtqRWQxRWhMR0psYk5KRzNsOVZickdVUytpZTU4dlFC?=
 =?utf-8?B?djd4ZXFGN042bWlZcEZhazR3VkJOdk5aMk15MzJLM1RJb1JLOU9aNDVjL2VD?=
 =?utf-8?B?aWdXcE5KUTJGUnRKVmYxM1FyTTZoT0xMdytYcGl2WGdCYkdQUzd4bWFKRzh0?=
 =?utf-8?B?bkYzNWU5bnRnSllCK0cyalpQY3NuYjBxVHRmeWl3WGVkODE1bnBqdnp5Snlw?=
 =?utf-8?B?alJPWVFvOFk3NmtZQi9CNmhOeTFTeWR6OTVmNzdFNHcyRVR5ZnNNUW1WNkRZ?=
 =?utf-8?B?ZlpoOEp5bUcwKzQ0Q0JzKzUwdVNVRWZuZmN3MG1TenErWm9CeFV0QTJ1K1ZK?=
 =?utf-8?B?bmpwQ1F4UnJyaWY4OVYvemRzS1ZPUXlHWWwyQ3NFWU9heE1OdjJDRDVHTzdh?=
 =?utf-8?Q?5++C4i?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aVdwVzMrdVBIekNLSlNWNTRhVEx2aElGV2FqbUFjSVI2Y05wNjVSYWFmUkZ4?=
 =?utf-8?B?V09kTTQxNzBISlR5TGtqam5RZ083VkNHcDVOcmtTbHcyWjZEbTN5dEJuWTAr?=
 =?utf-8?B?ZzlxWmNCbmt2MzMvRm16YnpYWWFTU2Yrd3lkUmFCSERxV0s0cmpWNTN1YTNS?=
 =?utf-8?B?OU1YU3pjOEZnbUNkbmNEQ1dNclVlcEJXUVVJOS9lQllqZFBiMnVveEhGZDZF?=
 =?utf-8?B?UnZ2aDEvTzFkL29ZNHlLZ1hPUkVkS0taU3AvUUtqa1BCcDZtN3hDS2hoYTBl?=
 =?utf-8?B?OW5IMzRyT213Qm1EUDdFVVpqT3ExemdIMml5Zlg2ckdKaUNBWjJCK3M3anph?=
 =?utf-8?B?SnZkSVh6S0xqUnRxenFjZG1xYS90b1A3bGcwVm0vVkthOHVzR1E4YlhkTitm?=
 =?utf-8?B?c2NtQ3FmZER3TEFKYTY2bEpTTElsOTk3T0dEYm1ndnl3U3BadnpTendIdGhv?=
 =?utf-8?B?Mmo2clE2Yk5ZM3NhZGNlelNLZUJtbVJuNlZjRTZiSUdpeURRWGVIbHowdEc5?=
 =?utf-8?B?ajRCWGJ1ZkcyMERjanZ5QVVnNEs1Qis3MzJjY29NM29KWm5ubUVVTjB2ZVFX?=
 =?utf-8?B?RjdBdkhoVFJreDByaVZkTjhPMlg5d2NURFk4cEh4eWRLMjFUYkFEKy9pR1Z5?=
 =?utf-8?B?QzZueE90V1FWTFkzM2UvaHJSNVJadlJkWFQzMERjNGJiVXNUc3BaOXVJazRK?=
 =?utf-8?B?UVljcUFxcC96VGxmWnI5NXhvTy9Fc1lLc1ByUnRDdHdkbWtBanNVMjA2UkRo?=
 =?utf-8?B?bFQwSmRpWFlIc0YrMFJCY1pJQ2VPa2x2ZXFGQmxWa200dy96dFJqbThQTFhR?=
 =?utf-8?B?bjlVQ3NEMlBscXR4T0laM0psWkZETmo1RWpCbmxDeHFRUzZEbEVwLzFqaGY4?=
 =?utf-8?B?M0xmNVBNUTZCaldaZ0R0cWdaa01uVnQ5Z1RaZzRJeXVySVAydGxQQjlBMFZT?=
 =?utf-8?B?WmZyUCs0azdSOUJHOHhQQmNKSzQxbnJ6ZTkvWXlOeWU1M2FyRG02MVdYZVZS?=
 =?utf-8?B?cmhyeDhFc3loc2kvNWpNMWZSQmNnT0gvNFpJTEd5UXd3cCttV0dmYThCUzZZ?=
 =?utf-8?B?WE9Yc0o1YXpEclppdVoxQzFNMGhvY3Y0RVVCSElpZTNkb1l3eW1Td2VoNFNm?=
 =?utf-8?B?ang2cFo2Q2pNVU00THZMeGxXMEIzWEJSYmdUUmxGTnpHVUFKeDVYVmNaaUpK?=
 =?utf-8?B?SHkyR2E0T0diQTdpZExmR1pSWWhvRng0TENvTmRIUEdGNkdvYmtvbUhKRTNa?=
 =?utf-8?B?aUtYWDlJd01MY1NGNWprMVhDMnhIbEY2NStTZlp6d0VnVlpvVGpId3B3NCtX?=
 =?utf-8?B?U09ESEptYUZpY3B3cHFtMHpwOEo0bE5uUTVqdjhFZ08vaTFwOHg3SFl6bmVp?=
 =?utf-8?B?Sy9oSitOTHV4WlFpVmRzOXA5QnJNQk5CQ2gxaDJZWkw3dDI2REVnaTBDcCtX?=
 =?utf-8?B?c0loand3eTAwdGM0dk1lYzJRUXhrQis3VHg4bytvOHBHbUNrRW11MWJoYmND?=
 =?utf-8?B?WWFPZU9mYlVvM3BJSlJodmoreEl1RlN3TDFyc2hvNFB6aEtmVW4yVUhUbjky?=
 =?utf-8?B?eGUvL0Q0cjM4VjBiMVlqUnVEdEhrTjVqak5sY1ZjTTBWU2VkQkNZbUtDcHdO?=
 =?utf-8?B?d01CbDVWWlNRS0Q5b0ZzbldJelhzQTBLT1FvMCtPR3AvQlBya3RCNStxaU4x?=
 =?utf-8?B?V29waXRJYnh4MDBuSmFGd2xyOTY4UjNSSlR3OEVReVB1UFdueEZ3WnN2RGtq?=
 =?utf-8?B?QlNEVnB4L1Fjd1RWYjF3eTFxZTRaeVJHV0tKUG8yY3IyL21zVzdmY1p1WmlX?=
 =?utf-8?B?dlpMR016N2lJUjNmR0ZLZkVHUWR0UkZMOXU3VWJMN2p3U2N4blhZMkxRbDhW?=
 =?utf-8?B?cStoLzZ1dTFzSEsvOGtTWE9wN2dOQ1pBNjRhU21OSWJFOGh6QlovL0kveUhB?=
 =?utf-8?B?S0N5WnBGaGJIaG9QeWVNQ0tkVlNKNUIzNnd5dGFES3UxU3RLdXpNL2RNL0pL?=
 =?utf-8?B?cGFQYmJ5MStkVE9RT29INURESE1KbnJMaW51R0lmN0RKZ1RIUjQ5SWptRHJ4?=
 =?utf-8?B?L0FVWDN5WGc4enMvR0JWc081MTl6UHR0ZFNQY3BUWENBY1pHNm1wZU5MRHFE?=
 =?utf-8?B?OW05eUhablI5M1pMSWJ0NC9TbjVNNzB1QmNwSDlicmNpaHhJbGQ2cHhOWFQw?=
 =?utf-8?B?b0NDRFZQZUVlTFczV3NBSUlaRHhkeHF0RjFsU0IvU2U4UkpKdi9IYnkzdzFQ?=
 =?utf-8?B?cWh5ZU1RUjNnMUZ1NWlxckc5S2lvb1VBdExtb0psMnBKN1VNN1ExYnpsK3lM?=
 =?utf-8?B?aHJUeXphQ25lUU5ZNlBhTjZqck9uajRzczYyMFBjcjI0WmNJVkovdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8A70EC235B1B84C97EE7C010BE6B22A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GE9FPaU8UEIXLYVvRe/TP96DEDWvow9c8f+y90GqjvXezgYr0ZCPXt7oqs1i5MgFozYDp8MXbmvpZsS8GfgORzXZC50hRZw2tOynoPWFqqGA1xJtAY2BhWcHKdAbFTKzzn9U9QXTnW04Cql1R0/edgY4QOEftD61PNdDiLA+c2CLyBQuc3BX7RdNTkvTM+qe9BkgHbeivKtUfdAnhJhdoBKeSpus8Nn+6vW1P/qPqYkfgv+7+AbKEdm4p4VTCZmF2NYwl6+jn9SyHD7Igszr0oyYbAeXgcZF7iw/Kv3uY6eGEohe37LgfdEDyZ86itqDM/wP5n5a0OZ9cylk/3PzhLJYO3nKM+nMGW/B1XsDboNRq/1fAQ1BrkxlvjjAq2+8PqMtWmV2N+Yl09C5HrcD6fvMbhPsLM8dNn7iajG2BYoLXewz21AmBddiCljllP00loxy2F8Tg1txaMyx7PDZvDOW/wg5wxfqSh8dFuEX8PRUg76T/W7vwUQ3Z6GKfkYfqDikNOvWp6NlZIg0io5HhNE46Rtel03ne5On/qCcKHyCJ/PEGS4GaX2TQLSXCDJNrpc+Q8H+twNViPGrB+4wy6yh4jb2HZTN2ui8arPePN40zU90JiL2N8y2wm8nNq67hTApsfk3ZilAZZGrrQo0Dw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6e20cd6-685f-44d1-4733-08de523cc49f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 00:43:28.3214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b2eoHwzzx16LYUVWJQZ/uo9CL/TSEgaep+ZclxW6RiZ8Ta2V/wWPMGL1oA1aVrsGgfqIRi5sFVgn3enZrxRpOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6716
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDAwNCBTYWx0ZWRfX+E1vMMnmU5tz
 /qqBUDksP7Vo49bBtRY8nJrdXfUk6xj76uY0oQAe+1wSseEwHi1IsZb3osKf7Alvije4S+/YXJL
 MR5OgmFhp/qi1x1XMdzeQ4pwIYoJ+kpwKLxngBZWo8hAqhXV8AOGGs192snF0HZNMwz8V0UVGox
 wrUTqXnARO6DNtowDhPGz2t8sMOFznnLDwQynLKKIbHLuby1G6KNxb6rbLAltWtK0PnGy92sItn
 +uY+53ZeYXESMBgcgMVK5TMcYpUe1WIdihpxWv81MI1lKdzxGBhsgAv4rRHQKWYTfhcqDnpPXlJ
 VG4S4AZEKVHaqys3dDHWgOE5GFBl1A/gAdKps2J1tBpOliar1znbWEEJSS74MUeJzOczhthR+aN
 gAgT+SWhnP+j31TGVcbdXANKUjPr3YWH+XyFUeI6ab/etsm+siORVNWqNUDQ4v6ptbrZnk1Gqz7
 vvzANnGBSy7eRhHZQmg==
X-Proofpoint-GUID: U4esDd1SMptUDAZzeyEmNInwruDv69ET
X-Proofpoint-ORIG-GUID: U4esDd1SMptUDAZzeyEmNInwruDv69ET
X-Authority-Analysis: v=2.4 cv=CIUnnBrD c=1 sm=1 tr=0 ts=6965953a cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jIQo8A4GAAAA:8 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8
 a=JfrnYn6hAAAA:8 a=ag1SF4gXAAAA:8 a=cKZ-tXH2yIW-O7GVcvQA:9 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130004

T24gRnJpLCBKYW4gMDksIDIwMjYsIFBhbmRleSwgUmFkaGV5IFNoeWFtIHdyb3RlOg0KPiBbQU1E
IE9mZmljaWFsIFVzZSBPbmx5IC0gQU1EIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KPiAN
Cj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IFRoaW5oIE5ndXllbiA8
VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCj4gPiBTZW50OiBGcmlkYXksIEphbnVhcnkgOSwg
MjAyNiA2OjE5IEFNDQo+ID4gVG86IFNlYW4gQW5kZXJzb24gPHNlYW4uYW5kZXJzb25AbGludXgu
ZGV2Pg0KPiA+IENjOiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+OyBv
cGVuIGxpc3Q6REVTSUdOV0FSRQ0KPiA+IFVTQjMgRFJEIElQIERSSVZFUiA8bGludXgtdXNiQHZn
ZXIua2VybmVsLm9yZz47IEZyYWdlciwgTmVhbA0KPiA+IDxuZWFsLmZyYWdlckBhbWQuY29tPjsg
U2ltZWssIE1pY2hhbCA8bWljaGFsLnNpbWVrQGFtZC5jb20+OyBvcGVuIGxpc3QNCj4gPiA8bGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47IG1vZGVyYXRlZCBsaXN0OkFSTS9aWU5RIEFSQ0hJ
VEVDVFVSRQ0KPiA+IDxsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc+OyBQaGls
aXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPjsNCj4gPiBQYW5kZXksIFJhZGhleSBT
aHlhbSA8cmFkaGV5LnNoeWFtLnBhbmRleUBhbWQuY29tPjsgR3JlZyBLcm9haC1IYXJ0bWFuDQo+
ID4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hd
IHVzYjogZHdjMzogQWx3YXlzIGRlYXNzZXJ0IHhpbGlueCByZXNldHMNCj4gPg0KPiA+IE9uIFR1
ZSwgSmFuIDA2LCAyMDI2LCBTZWFuIEFuZGVyc29uIHdyb3RlOg0KPiA+ID4gSWYgd2UgZG9uJ3Qg
aGF2ZSBhIHVzYjMgcGh5IHdlIGRvbid0IG5lZWQgdG8gYXNzZXJ0IHRoZSBjb3JlIHJlc2V0cy4N
Cj4gPiA+IERlYXNzZXJ0IHRoZW0gZXZlbiBpZiB3ZSBkaWRuJ3QgYXNzZXJ0IHRoZW0gdG8gc3Vw
cG9ydCBib290aW5nIHdoZW4NCj4gPiA+IHRoZSBib290bG9hZGVyIG5ldmVyIHJlbGVhc2VkIHRo
ZSBjb3JlIGZyb20gcmVzZXQuDQo+IElzIGl0IGEgY3VzdG9taXplZCBib290bG9hZGVyID8gaS5l
IGl0IGFzc2VydCByZXNldCBidXQgZG9uJ3QgZGVhc3NlcnQuDQo+IA0KPiBJIHRoaW5rIGlkZWFs
bHkgY29yZSAvQVBCIHJlc2V0IHNob3VsZCBiZSBkb25lIGluZGVwZW5kZW50IG9uDQo+IE1BQyAy
LjAvMy4wIGNvbmZpZ3VyYXRpb24uIE5vdCBzdXJlIHdoZXJlIHRoZSByZWNvbW1lbmRhdGlvbiBp
cw0KPiBjb21pbmcgZnJvbSB0byBvbmx5IGRvIGl0IGZvciAzLjAgTUFDLiBMZXQgbWUgY2hlY2sg
dGhlIElQIHNwZWMuDQo+IFRoaW5oOiBQbGVhc2UgY2hpbWUgaW4gd2l0aCB5b3VyIHRob3VnaHRz
Lg0KPiANCg0KVGhlIGR3YzMgcHJvZ3JhbW1pbmcgZmxvdyBpbml0aWF0aW5nIHRoZSBzb2Z0IHJl
c2V0IGhhcyBub3QgY2hhbmdlZC4gSG93DQplYWNoIHBsYXRmb3JtIGhhbmRsZXMgU29DIHNwZWNp
ZmljIHJlc2V0cyBhdCBpbml0aWFsaXphdGlvbiB2YXJpZXMNCmJldHdlZW4gaW1wbGVtZW50YXRp
b24uIEkgcmV2aWV3ZWQgdGhlIGNoYW5nZSBiYXNlIG9uIHdoYXQncyBhdmFpbGFibGUNCmluIHRo
ZSBjdXJyZW50IGNvZGUgYW5kIHRoZSBjb21taXQgbWVzc2FnZXMsIGFuZCBpdCBzb3VuZGVkIHJl
YXNvbmFibGUNCnRvIG1lLiBZb3UgbWF5IGtub3cgbW9yZSBhYm91dCB0aGlzIHBsYXRmb3JtIHRv
IHByb3ZpZGUgYmV0dGVyIGZlZWRiYWNrDQp0byBTZWFuLg0KDQpCUiwNClRoaW5o

