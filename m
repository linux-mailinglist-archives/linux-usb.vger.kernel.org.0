Return-Path: <linux-usb+bounces-33933-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sD56I/F1p2mehgAAu9opvQ
	(envelope-from <linux-usb+bounces-33933-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 00:59:45 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA3B1F895D
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 00:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7AA831AF2FF
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2026 23:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCDFE377034;
	Tue,  3 Mar 2026 23:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="C0Huck2W";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UhlxNQ6c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ke/d4RHa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB93377EBC;
	Tue,  3 Mar 2026 23:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772582088; cv=fail; b=L3yYpk471FkVYdLRhmo1qdGbsIeNz8NZ5nA5mqKv0TEr4lXdR0udaIvudhfRztbW+LBvOvYrQ09JDHJ5mkK35ay6ongyomgGwFybsLw3QSuzjfJ8IpeivEWr27sdruU9WPJM9oO0TxxRoZYVvMXarlb8hJ5qsmlxGJeo0wEzP/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772582088; c=relaxed/simple;
	bh=HUTGbk+lXANtXqJbSak1Ek7kNUMR0RrMUsN5vlUiuX8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nfMZRPq7fyveZrFdDpeVzGPNlrw6+1VTnEZuuVbi5yeTQO8Z9pkM1HkUjfUOBP/hHB/wqvM0xxUlz+FMjMvmzXf3CYRxMnIN7J+zmhFYYptdMtiUrI59i4IaB77N1gr2BYYLe68OaI4LdD2Re1Gfr1LVpxBxdG3B0dsjbn0G2LU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=C0Huck2W; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=UhlxNQ6c; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ke/d4RHa reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623KjHrJ1398730;
	Tue, 3 Mar 2026 15:54:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=HUTGbk+lXANtXqJbSak1Ek7kNUMR0RrMUsN5vlUiuX8=; b=
	C0Huck2WBZMWoqQ6W7esT3W4n8qFjM51EAS0/SVF+EF66crotTXVn6go9e6NPVxc
	3Skgh5EoXKD2bdLcYVfDZJffvdlFz7C2OCyhHYHvND+YEjpCL8jUljgzMJ+Ph7Gc
	UdW36RocAnGaTdlv7gHF/MVIbwb+SFwqron+1hNvdw0sbk7bTpVfmGrECc2bZzSm
	sbHBfGOAq8DZXPDkWIbOza/M0Yxl/rqE8w30H2m9WwxXFn3upJzQzzqsRxvSq/06
	/SMDDaZP9aeIHR6LjvtTfwRgUPTSDZE8PxZDOqFDtY8EE2JMv0jjaGDnVHW5iCNs
	0tJjE24HBv8gSdYoX92Xyw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4cp31yaskb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 15:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1772582071; bh=HUTGbk+lXANtXqJbSak1Ek7kNUMR0RrMUsN5vlUiuX8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=UhlxNQ6cIijnq4rHqRRNtWZ2aVwrn430l/7bz0usKB9zdER6ecAriNbh2P2vw9ODg
	 PxGEMRnJQnf/nRZq7UPqxAY+MzZXZ1oT8j01QRYWyyZykreVsefkD9cU4lCG7sQU0q
	 TZuy1WVdSXInyXFaMG+JIrURd12s8vpNWKYL89vZwFKfPfZe6zNfgfrmj5SgnrKd3M
	 P64PfKE3Cl/E+LUEYz7xoxUOVfTSpNdrQZ7S6oFX9lXbQoYrIVoXg+euxKvUXUO0Ak
	 1jA2Pmhq3Kii79FvcNUAhsgE7N99KUgaplxHL6ixYu0lA3PoiEWp5gcZn4qb8tvwzF
	 vkcLjnrDhX0pA==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D06A24045F;
	Tue,  3 Mar 2026 23:54:31 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 814B1A015A;
	Tue,  3 Mar 2026 23:54:31 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ke/d4RHa;
	dkim-atps=neutral
Received: from SJ0PR08CU001.outbound.protection.outlook.com (mail-sj0pr08cu00105.outbound.protection.outlook.com [40.93.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C803D405C1;
	Tue,  3 Mar 2026 23:54:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wu0v0utVJac3tev1W2rv08aixcvyxrGT1RjkUkbpSYSByM9KchMhPsP/fAi0/WEgDt/B4DshAL2PmVck7W9Y2bObG7YcMDUt00rs/jCVA+3BCFFtzdulAyzsNkeZ7/LRmab1FeK40RN4GQeKKPHyIr+CRaxSUQkINUtxdUkRBaiQynQhH9WcJNcc085+2wlPFYU/XM2IezxHQvJIcVjJ0xKJRr4UUPXytA1M9BeF3U6TJrnjmXT6KPwBLEVZFT1IrnT9Uf60U75IrwJkgOq88wH8YL5qKsvu/YvG07yI2wepuWJR/x20Xn/jKAuLVNCBSSYLE7YYMLcvtHzS4QUm+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUTGbk+lXANtXqJbSak1Ek7kNUMR0RrMUsN5vlUiuX8=;
 b=tSZgBeJqLixQZb0sa6rRkHTLAFWDGR5o+C/mfgc5qjVX8cSjMjbqV51fhWV69v96lTv9LZmpHz1gPBVBD4uI7eTi84RWDJcY2NXp9P60sj9dcY5DzMWm/qztGyTNHE1ZsGngAYzHi9KadPAgwVSgxLCne3XA6h7Cy7WE6P6rJrkLu+HYrhYfHbvqD0qYnlqDwpNyKFPa3x3D6rr/bCDtNkn6KoEBtDCK1yZWp/MuwhSiZ1GYoFy5TQe/Tz9BPYyGQGqNyMSBwY11fMYBg9Hqu++K63WJD6tchbyu5QA7VrC5eN7MzkQGfqA06o/tgJgr0LhnRjkvjaKBgS6ovAl7HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUTGbk+lXANtXqJbSak1Ek7kNUMR0RrMUsN5vlUiuX8=;
 b=ke/d4RHasaAsOdluoApYYtVPS7P1UyG/J5Dh//8kGcFSdJVjfspRbFqhvLGy7y4W7MIEGJwIf9ErPNHGTIry65jazs8AOwOnqXvaOvNFw6G2OVP7tXQCM82s7bL+tmxAAEDGqyf4JFPTBRwLoS1sRZpRZkK3RpRw3x723oKCajY=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA1PR12MB9529.namprd12.prod.outlook.com (2603:10b6:208:592::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 23:54:28 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 23:54:27 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Frank Li <Frank.li@nxp.com>
CC: Xu Yang <xu.yang_2@nxp.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] usb: dwc3: add '*'  for @needs_full_reinit comment
Thread-Topic: [PATCH 1/2] usb: dwc3: add '*'  for @needs_full_reinit comment
Thread-Index: AQHcqrN14cXRawD+pEyN+psds3iLH7Wc9TQAgACHiIA=
Date: Tue, 3 Mar 2026 23:54:27 +0000
Message-ID: <20260303235427.ykpm7hd3clhhmqjp@synopsys.com>
References: <20260303021559.4021177-1-xu.yang_2@nxp.com>
 <aacDAgN-5bXp51ZO@lizhi-Precision-Tower-5810>
In-Reply-To: <aacDAgN-5bXp51ZO@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA1PR12MB9529:EE_
x-ms-office365-filtering-correlation-id: 86ed0b25-e163-48ba-baf1-08de798034a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 c6eQ/EQ9nQmP5hY7pkBIIeB0pq9wgz0k92fuRVnbWqSikDD+7sSKdXqnHVAQSnN9HdhjTwy/vbKb4o7Z9lsDZTPOQht9JgEYjqk5FHdONRFXp5cXg37CX9y7YAHzkRlqeyZnZeM868JuUMrUaXS/OqKbQonUgiKMZZLCdoKr46JHm9cdKdKhnjWpvqCUc8+8FCm14cW7cGBN5bD1k2swBZjSvMh1kjG5pXLCeLfiSYqKPVAJZ9/5Y7mZKP0mo3k+R6kBkpQE7dfPMvXB4GhoLiPvSgq68n7kKYpWjJEyX6be2I9lOPa0CkebCDqdnm1qNS2aCWqm9HnXP+TWxkRzoKT0UZtHg/IAALHQsdjZZ575CWI09osPGgk6JrMXPoL3LQAOnsoF01/9N/AoKrT5qFuSvTclOZlbmZV1NnaGVN/6tec/J9E0XsCTflptmlQ/gU97XJo5UiDUa1mdP/XBmcC5T531k5wCuJjn5VZEQIEj/f9/rA2mCIz8H+vgcvQsGhfZxIjyDatH3M+yTo97yoyJg/cA1qD3Zg3yk7EkVgiWct3tvpVs+GpSFFzr6XspaIzRhhCjhOv3WrH/qAQlBxvruonWt8ifu7fTegEBggYUVL2/H6uYecyQuPPueXWk9+rqhhVsKlJtxc+sNVtpweoTUBu8HyYXq2Fy0/GouuRwgKR+RhE1X0jmLcU5+pmxJ8S0JNeOQvlGhO+ToJjfVWSIyYGfXgQE8NCIbqmfdDt+Ofq/2katsF93yH32alKZtEwF6bd+NhYTL2h7x7iB1u//Qt2xuUUsswRBXH4XJUg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZWZBSHRtVjRCOWFVNlMxbWJ0enpJdlI5N2Y1bmZYNjQycjVmUHpzajNOU2xy?=
 =?utf-8?B?czAxcWpMZDlzSUJTVGtqWkovYjZJVFlIb0pTLytxRUdiWVA0WS8zVGVRdTVs?=
 =?utf-8?B?NDA4cEs5VVdOU0xnQ0U3ZWFWZkROSW5jTkVBUjliajNmcGpDS0kyWjF4RzI0?=
 =?utf-8?B?U21QZ085dzZ1UEJOV1hRN21kclJaRHNlN2F5NXJldjcwc0ZaMVV6MkNUR2M1?=
 =?utf-8?B?enpoa2ZYQi85dlZUMHNTNzcwUUhtb3hXc0VGZE9iQkJVZWVQUmluMHNOY2lT?=
 =?utf-8?B?K2RiQjhRdkY3SkZsbnAxN1pIMW1MUkpxMkZnRVc1UVNyU25CWnY2UDVMaktR?=
 =?utf-8?B?K3NvMlpIV0lMeWZ3bGJNVDhMaVlaR3FRcmVLbkdlMmkrVER0Vm83S3htVjNp?=
 =?utf-8?B?TzNobVMvVlZwcW5jRFFtdENUaU43QWxneTNwUzI1aDd2em1MYUZGWGZXVUxy?=
 =?utf-8?B?TTYzRFR6WFo5aGNtb3lEM2h6OTN2SFVDNE5RTnJEb1hjYVF2b0VKbmp5WGpy?=
 =?utf-8?B?UEFIU2NHTVpqblBrdHhMT2FuZXdacERseU5EbU40dVZWT3VNUnFla2t6T0x0?=
 =?utf-8?B?ZGM3RU41cGIvY1FReDhsVytPVTdNZnNuSVZ1VjNKSXFOVEVpUDdkdVhFa0NB?=
 =?utf-8?B?WW5wKyszWWJvOS9KUm0rM0xuOW1LTk9EMCtDdzJ2ZEU3bUVGZnhyZmJhU3R2?=
 =?utf-8?B?d3BqVkNVU0RwZm9CMyt4cU1kenpSUlFJc0pBNWdJcUd3cjlES3RTVkNWWHQw?=
 =?utf-8?B?azllazJ0UFpuaFg0YVJ0OFJsYjZRTVJQSmVCM1JkV20xYXU4alJXakEzaTgr?=
 =?utf-8?B?dDVzZEh3NFFDdVByeGhtck4zbjE0TmhZZ2x3RDUxRHFuU0dNOXBtN1duNW1v?=
 =?utf-8?B?cHBJdnlYOXh4VGhSVVc2QXdOMy9TV3V2N0c4SmR1TlJJWHh4cUVMMnl1cG5n?=
 =?utf-8?B?NzBFRFFtQVVDcUt0QkZDMWF2NVBmQ01yRlVvd2ZKODA1dXNDd0FBQ0hHNStQ?=
 =?utf-8?B?ZFJDN1cxK010eW5WUGppNENMaEpQZ0dxN3ZTdlIwckJJWnc2TXBMekNRMXpn?=
 =?utf-8?B?bTZJNVprbzJEU1NORlUyT2ZDQ3BEYXBkWnZHRElFUzBrMlZjUU8zTDl2NUhs?=
 =?utf-8?B?TGhjcS9WV1VsYzRnTXVYUFEvUFlDLzlTdWthQjZ5dkZCSElRZ01teUJvWWh5?=
 =?utf-8?B?anhKU0lIMjlhbEFHc0VKcGVEaWNyKzc3QmJSdUZGTnBOYkFtUkliaFN1NEJO?=
 =?utf-8?B?OXlSNlB1MnZlR3VTWmJ6UkpoYVUzNGhSNHRXQ3pJUFFlQzk0UHNqZStjS1VF?=
 =?utf-8?B?NkVvWTN1RFozdjFHWXpPTjVObklSYVVzbnU3Q2pGQmJ3c2p4by9qSHU0VkJQ?=
 =?utf-8?B?Nm03K1pzZ2gvYWdwUGxMYlR3UWZXVDVPdGNCVmhXUVVrMTdQaWdxZXRvSFJZ?=
 =?utf-8?B?Y3F3Zm5CTDlTNXloejF1Uk5oYWxKZ0h4b091ZDEycWhXMGZIMCtQc0ZlaVph?=
 =?utf-8?B?VnVwZ1RQSlpNU01xdGlrSDM1WW9XcjlrZlliQzVYVm1QSm50MXJZTnBoa092?=
 =?utf-8?B?RjdSbE1wanUrR3ZaNmoxQ1BMbzVYVVp0blJvZFFmMjVwZDdrbGoxYTJUVHNo?=
 =?utf-8?B?V0RIOUtYenNSNThjT2ZXZ1hET2xwcFlZQVZRYUwxbjZRNU1ZWWNBVzN4V2du?=
 =?utf-8?B?OVFydUVoQjJRSlpUaCs1TWhnTVZ3VW1RelJaREsxaS9pODJmS1N4TkZRWjNS?=
 =?utf-8?B?L1FoN2tyTVVzSHR5Y1I1L29pbHg0ZnJDWkVGdW4wMnpUM1NKWjJUV29vR1Vw?=
 =?utf-8?B?TjhRUlk2eXp4R0Y5REtjMmd1aHNCRndINzdnMkxyUW5VN0JoczRaZVEyVlBK?=
 =?utf-8?B?Tk5aOFB2bVRnY0JqWXpnSDdSM0tVQzZZbVNzOTBCOENFaG1lQVZxbFBiZ0F1?=
 =?utf-8?B?V3JJR3dDTSsyZC9SM0JZL1dRU2RIRGhUZElFOVdQamcwR3VqRmhlNW8rSGND?=
 =?utf-8?B?WTd4bHpycWlDS1JxcXBHR0tQOFcybjBSTUR4S3p0ekJ0OHdMbG1wKy9uMG5I?=
 =?utf-8?B?ZmFxMjJvaE50bjk1dnBHc2ZwOExucXdTZDlWWnhMZGZpNVhYWFdGdmRFalpv?=
 =?utf-8?B?M1F1U3F6OHplTUNoKzV5c3huVUZkMWY5UVdnRkFtU3ZHS20xaWIzczU5eUww?=
 =?utf-8?B?Tm1ISU54aDBHV1Jqd1VPSEszcmZ3S3NGZHVCM2UvTndRWTBSTGpreXh4ZjlW?=
 =?utf-8?B?cXVIRVUyQ1dEQ0NQZjZaY1pxSXZva0pwcTRrOThRKzRCZXpKQVVobkdMS2lu?=
 =?utf-8?B?Y0tyV0tiQVVsSGFxNjRIdDlDTW9YYmFvdlBDaUpwWnJoNlk4cmZkUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1398D97B24111A438147FFC2CD618111@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LEv7w0uoKQ5CtefhWq2bfK/9i0G9UiPnqPkl208f970lmoWatCaL8uN4oGnR30BHguLokrEXWCiMcHmENIv2AD+uAclY427MrF70L9aiKL6lzZYiWcR4e5A1iU+byxzv5gHCTSvM4wYK+YQe17vYuacUjxsaaPAHgJxAQA5n1MpHg9+MnJyiQ/sq2AQ3clgxzDcrqb5oVtyPC0Lnil01XHLTEpMZhYzYANqGmFfVzfiJ7Yr1BhAGUwicYjdm5pjlA0/WqGUTrR6uvVrQ6OJJaXlYgN9bcep3gBn0eUNWe4y1kE6XqQpKkSWLX1wkPcM/X9HL2Qgg+kZTI/m4DFIrt/OG0CC6IsE3lqv/Og6te/Tjn0OVnUfyZqsPz+nE/RhPK2Bv54f69QjFGrkPF/ZGNY9pe5bKz+YMEP5/wbDomK1UY0wUwGTDQUE/7r8rVptK8mET9qL9XAfjr1I97hlBHqg01YFOspZZ5+EJwBJX7biWTFTm4FvofhN/k6MrvMYUQ1Q6pCrsDJ4puhsUwyaPFpBXAVy1AM+Bvzac3XTuaHVbBKKkXzQ5auFOJs2aTdloC678VjN2n8kDUQOnXGqPcwXH4w3/73lsLAaayQvG0Z2NOm1KApH4Lky/D4ct4XViHJDb5ri+CqIBB1fnEoJukA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ed0b25-e163-48ba-baf1-08de798034a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 23:54:27.8879
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HnE2OW14mPC5f8vb+FCboagoTdkT1cxvFD+VFlmLlWDtwixs03AQP6JwOGJ3PQ2XEq/fFnnywUHIU6F9+FJzuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9529
X-Proofpoint-ORIG-GUID: 6Mn9Gy3jdEhEjEUh1sXhbiLzMBX-_ZFG
X-Authority-Analysis: v=2.4 cv=RMq+3oi+ c=1 sm=1 tr=0 ts=69a774b8 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=8AirrxEcAAAA:8 a=_yXoGLV4n4wi69H--48A:9 a=QEXdDO2ut3YA:10
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: 6Mn9Gy3jdEhEjEUh1sXhbiLzMBX-_ZFG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE5NiBTYWx0ZWRfX+VnQl847Dio3
 ma35dFyWhHdAU5gxkTh8ndeuoDQQ8Y8zFtEiElQIweTeuHZz929VcIc18lsoBECaY3PghenMM3D
 RvVoFBagTYIxffvWqcaCgCz14G0i+7MESQuATSOg9XYjC4z6xdgZYjP91UkeNfiJNiHEbJ2bIG+
 xMcK+P80b/ZeRpsxLyKOJlEfsC2ufJJpUw9X3f+7CYZ1eWLiyglI+TD0OzR3jR1dxuwkaxdTvqy
 KktSJhWYntfx7ekL0RU+U4sGPmDZgh2c9Kd22rtqDZrDJtyspY08T55aEasbq6Da0UNRGb67Od7
 msdPLPuWCV2py352uhg98sluvz7HqClZRTyoeG2IPRYTzXzbfyuexg9d/CjvU7zs1Pg6WAH/fno
 7VpufCEIoXmP0Dm4iAhqBiJUFw8QqV1vDwjyILJ+6rJBjNjPFBrzgU/WpYSSGHZbT+LqwdYY0nL
 wdnAOY5KmePTncAeFJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2603030196
X-Rspamd-Queue-Id: 0EA3B1F895D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33933-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

T24gVHVlLCBNYXIgMDMsIDIwMjYsIEZyYW5rIExpIHdyb3RlOg0KPiBPbiBUdWUsIE1hciAwMywg
MjAyNiBhdCAxMDoxNTo1OEFNICswODAwLCBYdSBZYW5nIHdyb3RlOg0KPiA+IEZpeCBhIGNvbW1l
bnQgY29kZXN0eWxlIG9mIG5lZWRzX2Z1bGxfcmVpbml0Lg0KPiANCj4gRml4IGtlcm5lbC1kb2Mg
aXNzdWU/DQo+IA0KPiANCg0KQWxzbywgYWRkIEZpeGVzIHRhZy4NCg0KVGhhbmtzLA0KVGhpbmgN
Cg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWHUgWWFuZyA8eHUueWFuZ18yQG54cC5jb20+DQo+
ID4gLS0tDQo+ID4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5oIHwgMiArLQ0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+
ID4gaW5kZXggNjdiY2M4ZGNjYzg5Li43YWRiOGU3NGJkODQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy91c2IvZHdjMy9jb3JlLmgNCj4gPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0K
PiA+IEBAIC0xMTIwLDcgKzExMjAsNyBAQCBzdHJ1Y3QgZHdjM19nbHVlX29wcyB7DQo+ID4gICAq
IEB1c2IyX2xwbV9kaXNhYmxlOiBzZXQgdG8gZGlzYWJsZSB1c2IyIGxwbSBmb3IgaG9zdA0KPiA+
ICAgKiBAdXNiMl9nYWRnZXRfbHBtX2Rpc2FibGU6IHNldCB0byBkaXNhYmxlIHVzYjIgbHBtIGZv
ciBnYWRnZXQNCj4gPiAgICogQG5lZWRzX2Z1bGxfcmVpbml0OiBzZXQgdG8gaW5kaWNhdGUgdGhl
IGNvcmUgbWF5IGxvc2UgcG93ZXIgYW5kIG5lZWQgZnVsbA0KPiA+IC0JCQlpbml0aWFsaXphdGlv
biBkdXJpbmcgc3lzdGVtIHBtDQo+ID4gKyAqCQkJaW5pdGlhbGl6YXRpb24gZHVyaW5nIHN5c3Rl
bSBwbQ0KPiA+ICAgKiBAZGlzYWJsZV9zY3JhbWJsZV9xdWlyazogc2V0IGlmIHdlIGVuYWJsZSB0
aGUgZGlzYWJsZSBzY3JhbWJsZSBxdWlyaw0KPiA+ICAgKiBAdTJleGl0X2xmcHNfcXVpcms6IHNl
dCBpZiB3ZSBlbmFibGUgdTJleGl0IGxmcHMgcXVpcmsNCj4gPiAgICogQHUyc3NfaW5wM19xdWly
azogc2V0IGlmIHdlIGVuYWJsZSBQMyBPSyBmb3IgVTIvU1MgSW5hY3RpdmUgcXVpcmsNCj4gPiAt
LQ0KPiA+IDIuMzQuMQ0KPiA+

