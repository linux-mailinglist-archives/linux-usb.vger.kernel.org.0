Return-Path: <linux-usb+bounces-30178-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A88EDC3DF6F
	for <lists+linux-usb@lfdr.de>; Fri, 07 Nov 2025 01:18:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22D7618881D9
	for <lists+linux-usb@lfdr.de>; Fri,  7 Nov 2025 00:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1895266582;
	Fri,  7 Nov 2025 00:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DMaELetv";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GFEtjBsK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="M14Weyqz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB221F8BD6
	for <linux-usb@vger.kernel.org>; Fri,  7 Nov 2025 00:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762474698; cv=fail; b=qpzNdvtC+DKL+NopzpkMw8ckbjfVy9SNwf/tu1kqakT0vBAe8G5K0n8hqoFEJVDSk/1XeYNa0Cl+Midm9QofIRH6np8406f13i1ALpJgVOW3NnIMGVMt7h2fSp5pilmZet23P0T3Sivp5zfD04jaqo4jk2BX7SkVLriTJKRymKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762474698; c=relaxed/simple;
	bh=Nsi/KFwbHBstcIlUmyUerO4PYphJlK82D4rPuhSdbCU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cc3KvkhKOJxyRtE/R2MlVNegijEFajLVdU2IRpBMy0tDzjDtrnTeMfoLIayPeqPrOz5dPSNiFkq9wD2aRSfUUvrbV8zdrZ1uGfsta48yFG2+3GLc8zh3+8vJz79IbWYJLL9GD/air/jL18sREc29F903XZkTatp1R0cCIUzXMTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=DMaELetv; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=GFEtjBsK; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=M14Weyqz reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6MkPZA4139808;
	Thu, 6 Nov 2025 16:18:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=Nsi/KFwbHBstcIlUmyUerO4PYphJlK82D4rPuhSdbCU=; b=
	DMaELetv61vqt8GIGCBCiGS89nwlxC4gu3XxlMQ7B+xVr9OsWQClXDEijufJkAFN
	WC/GllirXla/oXlnjGjtlzFbwrQZaBs2mBL+D9z5V/3MNAip8fVT3p0tZk8RCtP4
	pWzZB8XR0mEOwLlG+iXZC8XQnJueyQe2X2qsX5877vBdp11FlhqCSCahm5nEYntg
	exhxgsso0iKsnAXL0ZFYOz3uf8lpEwMELtVbLVIpJZqB7o3LsW8ZWzHn1cGWjbmA
	j8evOBNIaCOYi3oQ9a1W8O+7U4FwWM+6jJiSgVxy0BPZvDPxkm46NlLdJg2CUypl
	NR9FeIdJZU/aiMNJpytW9A==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4a8x352f39-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 16:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1762474689; bh=Nsi/KFwbHBstcIlUmyUerO4PYphJlK82D4rPuhSdbCU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=GFEtjBsKOWMPj7WNawBvVESVt+9qpUHgglAEzg9fR83t1SMNTKBAYrdJMdRJ8ml99
	 9Mn1yyoM1t3mPPnKHztPYyzPmNsp/ZG8cJWSvunfbaFt1MzYjJx2y/yrKKWSIW8bj4
	 BuUn7q1SqH0GwQ+CDG8b+QQfcfuEFaXkmlFt6z8L1QrNV6x4Yb5IvPVZyC009FNUHy
	 c+zIaLwvAZbRf3FZViWRnteuQcoOGK+70BmaGuePpru6u+kerGQGPuFtohcLcWXRpk
	 71DFz4Oof/SUhEvtdkO09ZcJwJ/BPagbwwpwjmcfkFHI3yhcISM1NyOXxUvafrUOnD
	 eYEm6swGH15Xw==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0FC2340520;
	Fri,  7 Nov 2025 00:18:08 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id AF7B1A006F;
	Fri,  7 Nov 2025 00:18:08 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=M14Weyqz;
	dkim-atps=neutral
Received: from DS2PR08CU001.outbound.protection.outlook.com (mail-ds2pr08cu00105.outbound.protection.outlook.com [40.93.13.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6B96B40528;
	Fri,  7 Nov 2025 00:18:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLmsLgNwh+Dw041/uJmN5Xg8Uq/WRdZtYEfE0OV7yCgGzy8wZSH836KYQxMfOQ1zyVaNDfPgDaPbKF13cSceCCmZp4cGfXYciwo99njBWTS4wihH1rOHkGZ6lu+n6ekRHEIGSDqZ+bPI+pojSeDX8aHXd6Px1YfLITju3wCDffL2HX0uLtGNZoFvp17hwdinKvi+/Ls8Eso40XCmcwP+tv0dKMACK5k2q+ciCvt6PXdtKTWPPn87UaXhDQfWE6JYosEw3DOU/6xPbNrowpGqrJOilF/lId/IuqVhR5WambYkUnZtXNvKCcIDQP0U0HeeYNvqjn4769jQomF18a/deA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nsi/KFwbHBstcIlUmyUerO4PYphJlK82D4rPuhSdbCU=;
 b=H7jwg1jhC7KC8Tll9IPCh2e3BwC1hzzV0haexlGxX4/sfEXaVSLOKDjcKKf08MOQk1iG/MjXV7j73mKie6QwV69CuM/ePGt/A+eG80PO6xa4tXdTb51Nw1nOP+Wrpy4PIbz7Yzo7LmZ1FTsnH/h2Lw9BOwRJCUICmAQOiPZG0Nb1DucPcJE/8T2F//jhsoJz2DpfItPuJk+Ju26oWRI825+ANVwDevNRnpp22SidNkzAqBeN++/EeTxFr6cRtrjfBgJBzf5qabZEv85uMk6eQAPlFC47GgfA0QllQnKLWdvhsxVQGR7Hw61WhH9hoX27gmOAuEzcNC+Mz4561PL5+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nsi/KFwbHBstcIlUmyUerO4PYphJlK82D4rPuhSdbCU=;
 b=M14WeyqzQikBl++3uFKbtFjAfD2y/tbUjWEEtA54gMOvW9zVYxbHiX7OLzuWD2oE0y5KWEeb+V3+y6gUKixlq4IFw4X1dU4xEvA++dgl9UAbOyKhRMN+QS5hfAmpoFQsLLb51ggtA7EbHqy8LbiUmkEKDES0tKH5aXyU8TuTglg=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH2PR12MB4199.namprd12.prod.outlook.com (2603:10b6:610:a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 00:18:05 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 00:18:05 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: pci: add support for the Intel Nova Lake -S
Thread-Topic: [PATCH] usb: dwc3: pci: add support for the Intel Nova Lake -S
Thread-Index: AQHcTxTRteU0C3iT+UK7D1s4401PrLTmWb8A
Date: Fri, 7 Nov 2025 00:18:05 +0000
Message-ID: <20251107001752.pr5mntqbrztgzkm5@synopsys.com>
References: <20251106115926.2317877-1-heikki.krogerus@linux.intel.com>
In-Reply-To: <20251106115926.2317877-1-heikki.krogerus@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH2PR12MB4199:EE_
x-ms-office365-filtering-correlation-id: 1fa845fe-1972-4a0f-6ca7-08de1d931f78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?WFl0ZEtZeVhFa1RSYjFuU1AzRnBjcms0QXlTUkRFZElvNVNoanJZMEVrUXdr?=
 =?utf-8?B?Yjk5dzNhb2Y0cURDWGtvZTlaZlROQlJwc2Q5Smt4OWRySzYrc3dRU3QzNlRX?=
 =?utf-8?B?a0daRHhSNGx3SnRwUVQxelUvcGpnZlk0YVQ4enRlcDcrQ0svVXZUNG9leWQ2?=
 =?utf-8?B?MXFqOGp5alIyRStxREVPY21sNktOVHo5QlBXSEIvaXFINUxkOHl5cERTeUV2?=
 =?utf-8?B?aUxjSjdlelZvWTV3bS8vQ2xnYkw2SGsxb2t6ckJNV2orVnZwUzhvNjNuanU4?=
 =?utf-8?B?Uk1aRzVacUZ1M3k5TC92ZlJnNkJiT2VLOHFYZXRveEx5Vm9ZWHZwQWRMbVdC?=
 =?utf-8?B?Y25UckJJMUlTRFBnOWNxdTNHM054ellzZDNvT1M0SGc4bXo4bGRyMXEwY1U2?=
 =?utf-8?B?RDdKMGJKTkdBRkQrc1Y1SVk0ck5HUEFac1RzZXREUmtTWTRSY2tiUWFhanJ1?=
 =?utf-8?B?ZWRJcGJ2SHhNd3FrQ240T1dmNHExNnF3Z2JNMjJuRy9NK1B6eFFtUmZxVHpI?=
 =?utf-8?B?Ky91ZkZOSFVRZkp6UTVwcThzREQrdG05UmhQUEZDaDFPbzZUQ3lmME9EWFhZ?=
 =?utf-8?B?MUZGU05QNWQ0ZW9JSndxdTFWQldVQVRvKzVBenF3d0Vic3FMdWFBSjMxa00w?=
 =?utf-8?B?SVliTkVhSVRTSkxXd0d6dFdLd1ZqVTcvQXJVdGpEY3Jiay95bWRobm1QZEZX?=
 =?utf-8?B?WUtPNWhzUHZFR24zWDdYMHdxdTlEdHlTQWkxbmJBamx3U0VRVUp4WkRnQUdW?=
 =?utf-8?B?NExvVDFyRmczYnpqZzduOGRWSjhaamFUaGFZK3pOUzZOc0ZSTVc2VXFWdzVX?=
 =?utf-8?B?NlkrWGErYnZKK2owNDE5VFQ0UUFFeE5NaXVMZFpzeG9ISlp1MWpWRkJ6ZDNB?=
 =?utf-8?B?VHNZQzFCSzZEOXlFcUZwTkZ1YzViaG1hY3Rnb3ZXZ1RvWms3T2dFZXRMMldj?=
 =?utf-8?B?QmsvSFFRT0ZIZGVDcUh3cERneVhPZ1RIbWdpYm54Tm1VeGhiV01hc3RJMWxj?=
 =?utf-8?B?NkxWZWtGMnJFY0NrVk5zQ1I3RzdwNWh5ZnNYcjBENGNjZVZzaWloK2daaXhF?=
 =?utf-8?B?bENENDVWdjlsTytPNjlhTHFKUVdiWmhmcGw4aEQraHY5UXpMdWFlbWdlOTBw?=
 =?utf-8?B?c1ovMjA1MUZoa2owWHRPY1FPYzhkalJkVzgzUnByc0FEQmk5UDJhbHV0MmNH?=
 =?utf-8?B?ZmV0a3dYLzJBWjhZR2RRMnN0dmlTSVVLaWh0ZmlrekV2MnE1NExnTFRyZTBN?=
 =?utf-8?B?ZTZFenlvV2RVKzRMT0lGZkl0RHRFSlVIdmpvLzI0MEFnZHlaZVAzZU1iajBa?=
 =?utf-8?B?clEwN2d6Mmwxb1Z6TzFreis4c0h2NHRWTG1SOWI0WmtNR09ZL3hmaHNkQ296?=
 =?utf-8?B?NHJPQmNVYy9GV2dlTjY5MVkzbytBay81dGUvS212L1VrejNlRkJ0UC9INm5M?=
 =?utf-8?B?aWRYVTJnSForMGdEd09qaWNCN2k3ZWNZbGI4dnZmRWtjQnRBK2JBU1JTVEJt?=
 =?utf-8?B?MHJjVDJibHE0djlDOXc4RGdHV2dKRllXOXlhOFJlSVdWbTFBZy8zTHdnTFBz?=
 =?utf-8?B?UE5RMFdRY0VGSnVnamlVS1RBQmZiaGdtS1NMQVRiRDJaOHBwYXNpTkp1ajJ0?=
 =?utf-8?B?WGxQcDJuT3ZjdTkvSVBoaXVROWY3QTU2OW5XQ1BXS0EzS2ViVWtWN3Z2eDYv?=
 =?utf-8?B?eFNGdlNGc01kT0JnSkhGUEx3UjUzUGZ0N0ZrdlY1SHppVmhXb3gvajRBd1Nr?=
 =?utf-8?B?b3VERGtyMis5Qi9xSnZ3eEJ3R1RhRkJER09MZWtoUzdRUTVOTXFES2JuMUY3?=
 =?utf-8?B?TnhuU0lUQUJiMTZOZi9FV2VDWm1NYnNwc1h6eEpocHJ4YUFibFdxSXpjUEEz?=
 =?utf-8?B?ZEx0elpHWkRHMWpIN29zY1dCTXVYbXMrOG1RcDJGSjk3WGFLY0pzSXVJYWpn?=
 =?utf-8?B?eUFiL3FGdkZKSGZyUnhHZ0VGY3RGQXNoRkFKVklBMkFZRFRJK3RPclBMSnUr?=
 =?utf-8?B?UGpzZExKVStyMnA5SlFmbmxKaTUxTUJ2Sjk0cFU4TnNGdEVPenNCSU9HeVR5?=
 =?utf-8?Q?rOoyyr?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T0hVbjRyRHhMNVlPVHlVM1JmbGtrYmpxTEJKQjlyQWQxR2hGdFRrRGZKa0g3?=
 =?utf-8?B?dmIzbTBKME42ZHkvU2c1SksrMHdtL3VhazZISjFzRUlUK1VTOEVpVmg5c2Nk?=
 =?utf-8?B?MTVCUzNBelZPTytjQ3JZUGdyVWVDaytMRk9GTG9oT1EwVDEwZGpHaVZlYkhw?=
 =?utf-8?B?SWkzc1VDc1h5VmJpNlhaT0JUYjVQUG04ekNwLzY0bDFiZGRQZ2JiOW84Umcw?=
 =?utf-8?B?NmJLRG0rR0J0cENqdzlDUkZDVkw1OFRIYU96TnIxT1U2ajBLVGJtVXRid1Jm?=
 =?utf-8?B?aUtMSkdSUHlTVjJKMVMxNXd6UXhCK0s4MFh1ZlJKTUZ6WFZyN0xNektuRG1S?=
 =?utf-8?B?ampwVlN5cUpKU0VJV2RYTzdSZFkvRUNMV3ViMnFxb3hpaExPNURDWThoaVoy?=
 =?utf-8?B?NmZ3V09PYittWklPQ1ZUZ2t3dGpvTHFiVFppWHh5UWdvMTdXdjIvS3JzVlRF?=
 =?utf-8?B?c01kM3VjcWFtUXVZM29KMjZPVG1KMjZpaFd6WW1tU0daN1lFcGdoWWJtQU12?=
 =?utf-8?B?WjBDQ09UWXBrcXVCeEJzQ2hMbEpxV3Rxd2VRSFlwYXZIdTB3ZXZCbVFGV1ps?=
 =?utf-8?B?cy9MZXRwWGRVV3NraVBiU1VCVVI2YTFRRUdyYldRUGtMK0NpZlN2RmhDNzdO?=
 =?utf-8?B?MjB5OVI1OHRXMnNaY0JUdkhha3FjeVZoQ0k5YkdGN3I1SmdsLzJFTGlndnNR?=
 =?utf-8?B?bFl6dUpIa01vOGFFajRBQ09ibmExUmF6elRXMGswRko3TDRpZWhlSzhYSjlV?=
 =?utf-8?B?a3g3U3NuN2tRL1JFN2tDdzE1b0tNRytFRHh0S2J5OVNOaXF6SUhVc2loTGhY?=
 =?utf-8?B?MXFnTHBrWTAyOGRTQ2o0MVVnY0krbmRqV000eXhyN3dsVm1EWDlZZkE1N1pv?=
 =?utf-8?B?OGlWcER4OFRLK0pBdFVzWlE3MTYyVEE5RzE2bDFHbGdRaU1NTE1zanM1VTFt?=
 =?utf-8?B?TnhtMHhROWVoU25XazgrU2YwOTBIVlhxSThRTUtvSm1USHVMNm13cnZjZlcv?=
 =?utf-8?B?SE1GNklwL0k3bXNhbUdZTzViVUh0WjF0bVlGYlFmSnNXcGRjRkNHMVJLc0JB?=
 =?utf-8?B?MDlITno4OFpMZVo2ZVFoaHNYdlo0VVNCbkhOREFmeVd1UDVVVlJ1bkw3V1B3?=
 =?utf-8?B?YjFEUUIwaVQ3SndhMWlGSktmMGRqZ3F4RnU1RHl3TWxFSkRGZGRTbTUyb3Ns?=
 =?utf-8?B?cDRQZVNvM3VjTndPSEVTVklrWktrMDNxMkRxUlpYaXJKaTVJaWt5K0pJL2FB?=
 =?utf-8?B?bng0N1lYQXdaV0RnZXB5c2ttZmFZMmsvRlYra3pxK1NSRUliYkNhMng2cGdp?=
 =?utf-8?B?WXZVK2VoQzZySVZhY2gyWGRCYWZ5RVdKYmI0VXYwanlKSXBFM0hBaTdlVlVB?=
 =?utf-8?B?dTRpSlhuR1Z0RTJES1dkZ2w0YlNzU3JWWjZtT3owK1RvTlZWNGsvam16MDJL?=
 =?utf-8?B?bWQyaXRLbzlFaDdJOXo0bzZ5ZDgwMmVqSWNUeUYwZHlnL3ByeGRMU1RUYmc0?=
 =?utf-8?B?WnVYMkYydWVhbFBpdS9vc3FoVlJIT0RZNGxvTXVpdU4yRmVCSFY2VmdoKzMx?=
 =?utf-8?B?S1BkSTFaaDBuQlFESHcvL09Tak9PVDhUcGhXREEvK2dGQkptZVlYOGZPYjhQ?=
 =?utf-8?B?V1FSUUhMYng5bk1LSlFvaHFKNWpGallOWHJoTjdqMEZobG4rVTBibkpVQS9M?=
 =?utf-8?B?L3FjbHhkdmZDSk1WMXhadktLa3JCMS9PcTRIM0ROVUVnaUpJckxCRjZkdjVN?=
 =?utf-8?B?aTVFQ04wN2phRDNEWFozeTVvK3pZaS96V3JqR1FnTHk5OExnQWFQK1pIUlNt?=
 =?utf-8?B?citUQ2ZEMjFQbWk0b1IwU1UyV2NHWFJadjJLMFIyY1QyNFNwMmNxUGdzTnlp?=
 =?utf-8?B?Q3ZBRWpyZXhERHNQYzNUQUowRWF3cjlpUzdCdlBZQmVIOTBNNXVPV042dFc3?=
 =?utf-8?B?ZUFwUHc2NEYxbk4waVBQT25iVGxJU3NialhacXVJenBVWU9reVdJcHhyOHdQ?=
 =?utf-8?B?S2JOdzVwUzIwUWlaUTNaODZEamtlZktuUnFWVGtUN0hLZExFZlR1VHpwa0xN?=
 =?utf-8?B?UzBVbFBEaDlZRjNVM1d6T0haNE02OG5yNE5qQ0c3R05GK2dFWmIwUXlXSkkz?=
 =?utf-8?Q?SgRxBw2fUDcha3wSDIKltZ5L+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9279DC530FDB84F8C2234F69A8932E2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	187L46CIRrqci0tB8hogIbVE5/K6Yy7TB8IHz6GzIymcoTUa1IDY/a4mJVLLfePn4vXVsy+hzAsEeS8Ug6ZGX7TDVNlssWkgEQ0R8LLsUUK/twCOeX8IdBgdDHIn8Sl5z4OtRA7lydoxcto2zQnjLRLsxVdfYAQ4u/1rLiTiWWkZ8ShgmpNLsF8e7VCdawEP+B0eZ/bLrF3QGFaHF9fnoerdYXXzq5U4oCT2FW5PeaFpTLJPH1j+/t5Ngg6KtyigghTy2ssyb9ScD81S3l/8Ld9jtIYeDSybZzZtjULafZbwtnKwXNUO38GV6wiCsy2HrDkaUKs8KME/+z2R0/3+7llCIy/JZS3TZoT0Sjf85gnX/6z5hKvHjt1zekeZnfSnt4gEPux98FkOUkgbGCeXCKPz55VKpEeztEMLYAZX7yGMN4qrLdYbm2VZs4XzSdrANDSZV2DPj/t7vl2uQhITdmpizSPdEhwEzJPy8DQ6YNvwzEIQFhspX8S/3HH0Kf0E13z1eUQjQFKKS3IVSy4Q5z1Xk+fhrZc9p12DizzOGzK4QMSsL/qXxnGBInW/1gPL0Ibwfi3yvmyFHr0dAx2JGdF7IIfjdIZf4SiS3jMI0MRcMnodatNduCOgxaM5sFO+zAK6VKFiXEvXYFWcwKktfA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa845fe-1972-4a0f-6ca7-08de1d931f78
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 00:18:05.8437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UMyB61FjLiRkCv7nf0Zjve87fjm8Pg5kK8ErEjQOyExRJuj+Dg3zhqkbEFiLogFPGC6A71KFEkZGosITsIP5pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4199
X-Proofpoint-GUID: 4Ol7OJVSUrqO0mZgAgi2Vn4s3BAI5pmb
X-Authority-Analysis: v=2.4 cv=Utdu9uwB c=1 sm=1 tr=0 ts=690d3ac1 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=jIQo8A4GAAAA:8
 a=doKXG08EfIypHvMW53IA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 4Ol7OJVSUrqO0mZgAgi2Vn4s3BAI5pmb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDAwMCBTYWx0ZWRfX0Ti3Pd7dkvTf
 jTye3ernGQ6Kv2e78DxGRGhwd+88O6JHdNTDNXarPG8FgjX0QgY1orr5+WAAwafC29yw8+6h3ZO
 msytAyaZSYgt46Of7OWNQt4x0wwzfvNL5EE6mG1SvreZc2+wWzF4iQ7S60AUBcyptQlb9FGLfCZ
 DN2Qk2smSMGiUeY9qt2nMJdWIrHKxyKRiO7/WrcGblcojWXA7KGq5dnOsQWlevo3r6/sGFWl+W4
 dag9MvlzZMy8dCnwTPBB5YxbFAmb9sDVE0DNeU6gtmS5SzMIrwJWWnOdnJUT5kZLCLp3ufTJBTQ
 iH0IJy49FcuEBniyqq1VUK7tPON5W1Knk5hRoiUw+U0jbJKxSMR3I3v27bS8/FByFWifz3Xkyhb
 vrMjSqW/LP5x+wgBbbCrkInD4gSUtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2511070000

T24gVGh1LCBOb3YgMDYsIDIwMjUsIEhlaWtraSBLcm9nZXJ1cyB3cm90ZToNCj4gVGhpcyBwYXRj
aCBhZGRzIHRoZSBuZWNlc3NhcnkgUENJIElEIGZvciBJbnRlbCBOb3ZhIExha2UgLVMNCj4gZGV2
aWNlcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhlaWtraSBLcm9nZXJ1cyA8aGVpa2tpLmtyb2dl
cnVzQGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtcGNp
LmMgfCAyICsrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXBjaS5jIGIvZHJpdmVycy91c2IvZHdjMy9k
d2MzLXBjaS5jDQo+IGluZGV4IDM5YzcyY2I1MmNlNy4uYzJiYWI2ZDRkNTA3IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcGNpLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdj
My9kd2MzLXBjaS5jDQo+IEBAIC01Myw2ICs1Myw3IEBADQo+ICAjZGVmaW5lIFBDSV9ERVZJQ0Vf
SURfSU5URUxfTVRMUAkJMHg3ZWMxDQo+ICAjZGVmaW5lIFBDSV9ERVZJQ0VfSURfSU5URUxfTVRM
UwkJMHg3ZjZmDQo+ICAjZGVmaW5lIFBDSV9ERVZJQ0VfSURfSU5URUxfTVRMCQkJMHg3ZTdlDQo+
ICsjZGVmaW5lIFBDSV9ERVZJQ0VfSURfSU5URUxfTlZMU19QQ0gJCTB4NmU2Zg0KDQpUaGUgbGlz
dCBoZXJlIGRvZXNuJ3QgZm9sbG93IGFueSBvcmRlci4gSXMgdGhlIHBsYWNlbWVudCBhcmJpdHJh
cnk/DQoNCj4gICNkZWZpbmUgUENJX0RFVklDRV9JRF9JTlRFTF9BUkxIX1BDSAkJMHg3NzdlDQo+
ICAjZGVmaW5lIFBDSV9ERVZJQ0VfSURfSU5URUxfVEdMCQkJMHg5YTE1DQo+ICAjZGVmaW5lIFBD
SV9ERVZJQ0VfSURfSU5URUxfUFRMSAkJMHhlMzMyDQo+IEBAIC00NDMsNiArNDQ0LDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIGR3YzNfcGNpX2lkX3RhYmxlW10gPSB7DQo+
ICAJeyBQQ0lfREVWSUNFX0RBVEEoSU5URUwsIE1UTE0sICZkd2MzX3BjaV9pbnRlbF9zd25vZGUp
IH0sDQo+ICAJeyBQQ0lfREVWSUNFX0RBVEEoSU5URUwsIE1UTFAsICZkd2MzX3BjaV9pbnRlbF9z
d25vZGUpIH0sDQo+ICAJeyBQQ0lfREVWSUNFX0RBVEEoSU5URUwsIE1UTCwgJmR3YzNfcGNpX2lu
dGVsX3N3bm9kZSkgfSwNCj4gKwl7IFBDSV9ERVZJQ0VfREFUQShJTlRFTCwgTlZMU19QQ0gsICZk
d2MzX3BjaV9pbnRlbF9zd25vZGUpIH0sDQo+ICAJeyBQQ0lfREVWSUNFX0RBVEEoSU5URUwsIE1U
TFMsICZkd2MzX3BjaV9pbnRlbF9zd25vZGUpIH0sDQo+ICAJeyBQQ0lfREVWSUNFX0RBVEEoSU5U
RUwsIEFSTEhfUENILCAmZHdjM19wY2lfaW50ZWxfc3dub2RlKSB9LA0KPiAgCXsgUENJX0RFVklD
RV9EQVRBKElOVEVMLCBUR0wsICZkd2MzX3BjaV9pbnRlbF9zd25vZGUpIH0sDQoNCkl0IGJ1Z3Mg
bWUgYSBsaXR0bGUgaG93IHRoaXMgbGlzdCBkb2Vzbid0IG1hdGNoIHRoZSBvcmRlciBvZiB0aGUg
cHJvZHVjdA0KSURzIGFib3ZlIGVpdGhlci4NCg0KPiAtLSANCj4gMi41MC4xDQo+IA0KDQpSZWdh
cmRsZXNzLA0KDQpBY2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMu
Y29tPg0KDQpCUiwNClRoaW5o

