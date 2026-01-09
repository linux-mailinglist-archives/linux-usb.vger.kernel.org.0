Return-Path: <linux-usb+bounces-32096-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B98B0D074AF
	for <lists+linux-usb@lfdr.de>; Fri, 09 Jan 2026 07:01:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D8BA300A378
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jan 2026 06:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1638270ED2;
	Fri,  9 Jan 2026 06:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="B7wSqOJv"
X-Original-To: linux-usb@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010058.outbound.protection.outlook.com [52.101.201.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07A419309C;
	Fri,  9 Jan 2026 06:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767938508; cv=fail; b=lufU3L9/YON4Ya2fZcIVoWg2U6XM/Aa8yFNJiwH9/2M+5WxqV/5VOJwaqMVKe9ZKGBkknwrKf1RaQ90bGTXxnBLHPQpDKLZfRy7tUBeXl2SCnFzSxe2v6zHKexKKhfbpXFRhBDEbvVkanrLWaA8Vtgb07zxjLzXhouZbMHWdYn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767938508; c=relaxed/simple;
	bh=KWalCwZMOpgsDsu5UH2OEoi/D6nuGK2akfkEb4+efeA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OrP7kOJGR4+ZG9c23Sm0aJOv/sJQPEqe6xGt/Hk3r8NR6NfB1dGZc4Pz1x0mz5ueiv+UIlLywu5FMsby1lL3VvUh/Hjj0a4EKth3QUtCP6YDPDZWNrl78Fzb3003uJ/HElstcrVvm7rIE+TwMq44ZLG70oX/nX7CwzeUeYlaZbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=B7wSqOJv; arc=fail smtp.client-ip=52.101.201.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HB1VwEJHmO/L43EObEIdVZZPkt1nOt+fVQ56g6XfFcxasJT6M6bNL+rwLbfylW3FpJ3zrlsPjFZQmeZE2RF5+H+XYGcRfl7+0N4U3KNm9AH/+3wIDunHgW+9XUNs61DSuk57CAZRIGXCQWIr1WcZnh9toxE0b3AHNqPmEonapQ5g7JFkztlpJDBNdh9sw9nVcCJ8/Om++7z5MMuROmt6/1sDN0VY6zaQONUBEREF/UdX1KmaVB4UuVxbjFg8x0Hwx+YRVil1Uteu63x0hKf1kRi4+vWzGJi1PZ2GYiAW2xC08ouiii82DBvr3f+FAgbxlGwZhBhoykWJ+EpLNC+Shw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWalCwZMOpgsDsu5UH2OEoi/D6nuGK2akfkEb4+efeA=;
 b=YNsx0eBc8fXNZD74MNxZ6SWdql1bTuD/9KEGTEeSxZlrg1Erx8kURBwZuwYS/SdFszanu9PzhOIscwdC0nqI1dVWwrpAzc0nUq7ctgzcAbjxp2mQWhSqEZzK/+o9XQ+li21sEVHlFan9kcN6x8bVh4x2+oLy8Kg58B7fmti/DEQwe+338uJRfE+9hOxA+k+jglkxr+H4ZZHeydT1DoA6MtnMNmUqah4TNsfTbnEwvLbnmwNraRsuSh5jtED1sJFbJBhirQaaktksa8mi4eJlnDmofUc1AhXU206vvJySqLPia4Z7olGncA7ZcnQM/UHzRrMLw/cnK77SsZReAfLUkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWalCwZMOpgsDsu5UH2OEoi/D6nuGK2akfkEb4+efeA=;
 b=B7wSqOJv7k8x0JUSrB3Jn0hnSRJFV91gs9V4Scfe1LNq8xVDf8v7pzgI594VaJ8WADIcvkDwCCsFFM0KVBD4YyoXJ9mQgyVYhyEZZDzndX2c54VN+u87XvMLe8L6mpjfoFFNa+NHD6Y8xy3SCSne2mCOlN4zJxULclCpl5zFmEU=
Received: from MN0PR12MB5953.namprd12.prod.outlook.com (2603:10b6:208:37c::15)
 by SN7PR12MB7417.namprd12.prod.outlook.com (2603:10b6:806:2a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 06:01:43 +0000
Received: from MN0PR12MB5953.namprd12.prod.outlook.com
 ([fe80::5151:8ae3:f31e:4c9c]) by MN0PR12MB5953.namprd12.prod.outlook.com
 ([fe80::5151:8ae3:f31e:4c9c%6]) with mapi id 15.20.9499.002; Fri, 9 Jan 2026
 06:01:43 +0000
From: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Sean Anderson
	<sean.anderson@linux.dev>
CC: "open list:DESIGNWARE USB3 DRD IP  DRIVER" <linux-usb@vger.kernel.org>,
	"Frager, Neal" <neal.frager@amd.com>, "Simek, Michal" <michal.simek@amd.com>,
	open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/ZYNQ
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: RE: [PATCH] usb: dwc3: Always deassert xilinx resets
Thread-Topic: [PATCH] usb: dwc3: Always deassert xilinx resets
Thread-Index: AQHcfy9iYjxV+1/C/kyHUwydLwJUOrVJBSGAgABL7tA=
Date: Fri, 9 Jan 2026 06:01:43 +0000
Message-ID:
 <MN0PR12MB59538C2F8613A9C0641BEAFBB782A@MN0PR12MB5953.namprd12.prod.outlook.com>
References: <20260106171018.501612-1-sean.anderson@linux.dev>
 <20260109004901.ygts6mmcxy4vs3y2@synopsys.com>
In-Reply-To: <20260109004901.ygts6mmcxy4vs3y2@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-01-09T05:20:49.0000000Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5953:EE_|SN7PR12MB7417:EE_
x-ms-office365-filtering-correlation-id: f975e23a-da3e-4a5f-5963-08de4f449096
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?cXVqSzVyTkxtYmtsSGQzWGphNGdQR2o2eXdqMG5zY1h3Z05uY2VZWjRFdlE4?=
 =?utf-8?B?UFoyTEFVdkZZc3g4RGNVRDNzUitQci9RVnE0YXUyOFNUSDhHUm5oVkR5bmwr?=
 =?utf-8?B?WjgzbnlEaUZJVFNkTzBBNmkxdlpwcml6N21EVkswSUp3UkwraEt4YWRPVkIy?=
 =?utf-8?B?cUpiaFhrWU14aUYvR1VpV0dJYkNFeDZNQ0liQ3JjQjF0L09GZ25HMnJsSWNv?=
 =?utf-8?B?dzBRYzhCNlhlVEIxa3liMEpKOFBMaE53QjA0ellvWnNyeHZnN2s3YlA0VHZD?=
 =?utf-8?B?MVRxbHdkTld3ODRnRFJubDN6ZGxON05zRGtZRElSWUhjSGNYWVZaOGRyR2Nz?=
 =?utf-8?B?N0ZpL1pVa2phdGpsNnlGajc2TnNWUjF3VlJNQ3d5NEJXRjFlbGduY2U2Q1c2?=
 =?utf-8?B?NThlTEprRnl4Qnp2d2hpaWFMMVRCUU9LajdHaXluMGgwWVRJUlNRelBJR1Z6?=
 =?utf-8?B?cTREbjVXclJON1BCMkszLzBET2I1TGkvTVNlZnZpN3lTM3ZPQmNrZ0RrWHlx?=
 =?utf-8?B?Z0YwMHVVbC9MMlhnZ3NsQ1VTUVB2MXVtRFRCWFJYdXFKbGNZSVhSbVk3Uk1M?=
 =?utf-8?B?Zi9ETEFEd05saGM2TjhUaVFiL2xTZ1UzZ0hFZ3k0ZWtQWGxDd3BHd282MTlY?=
 =?utf-8?B?VHByQW03TXhnN3RVRkFpQUo4eHNYcnVyTGcyaURlUUNGMWc5UHNIbHFicmtR?=
 =?utf-8?B?eXVQMUUraDJ6NkNmVEIvYXp2SklJbzNDTVBmdnVuVTZWUmlmdWh2ZDB3TFVD?=
 =?utf-8?B?SVp3b3dUYTMvdHJJR3NUaUhUMllzTXg1N0tib25DOW5aZzB5aG9ZRk9RdThk?=
 =?utf-8?B?L3RuNzhLVUhDYktJcklBZzhtR3crU0ZrMHNpZEhVeXUwYkN1U3NraThTUzlT?=
 =?utf-8?B?RlAvUkkybUdHRkxKWEJwQTlWZlV5L2VPNEw4V21ZZ1phZWZSSldQRUFIYUMv?=
 =?utf-8?B?dlVSRXBPRlNML044b0orNDUxR3pyZmZBMjlMRWNpWlFNckpyYnVIdmJGc1Br?=
 =?utf-8?B?dThURnAyQktTT21oOWxtVHdaTXpzODdlRFROQzF1Q05lL1FWcmY3a2FMdm1T?=
 =?utf-8?B?N3RZMDA2MFgwYWpGR0tXZTRaSkpQd2RJYjZpenFUUW5MOXM3enhmanRqWVFk?=
 =?utf-8?B?ZXNsb3kwaTYrRzBXYWNlZ09PRjlsY0tJUWlMd1JpSm1GSWJZeE5DV01CYkZD?=
 =?utf-8?B?Ykxwb3NMd1pycEdZOGVlYXBCemhNMUU3b2hzcFRsS2kwanRZaURzODM3YTlI?=
 =?utf-8?B?ZEtVZkxoeWpMZmZXOVJHNDJ2dVFxSkZ6Y1Z0ejBTWVlZMjdBVCtKbzU4VGxo?=
 =?utf-8?B?S3huZW5NUTdscFpOakljdmNVT2RBQy9YVlBlMXI1ZWl0cU9JbVFjZGhoR3ND?=
 =?utf-8?B?akpyZDhtTDlFZmpJRFRMdHdJYVUrQUY3ZUlNZ1BES05JRnZRRVFYeFp0VEYr?=
 =?utf-8?B?eHJTRytKd3gzQ3VLYlgrV1VzSUlTaS9TaXBocDdidVhxWmt2aFFzcnlUb0Ez?=
 =?utf-8?B?WVJ2ZmJYNG1US1B1UE5POHBFaVRmdUtpUDlaZy9ReG44UG92aEJjTDN3b2pM?=
 =?utf-8?B?Wjc2Q3pHNWt1UEdxYzc1cEIyYWpnNVpyOFpjL1BQRUZGbzlUSXZ0M2M5T1Ey?=
 =?utf-8?B?bW9FdFk5M29UUmNYaDg0clhFVFcwbkVFZms1UnJ1Zk9Pd2UxUUtxWWpub2Mv?=
 =?utf-8?B?OHB0NThNMXlEU0FBY09Rcm1jdDhqNmZQNHViN21WY0lWZU04TlA0ZE9mcm5N?=
 =?utf-8?B?RFJaOHFzaG9vcVdqVndvVnZSZHBXQTNLSzFiUWs0UlltVVlsYjZUaHRKcmNE?=
 =?utf-8?B?dTRTZDZFSnZVYkFjQUhMMFlXMktOa2grc0hiM0NPcSsxSzlxc1dhTW9sY1lH?=
 =?utf-8?B?NFNLOElCc252R0htZ1cwemlFRnlQKzhZWXpmSFRzdVhpYzFCS2x6Z05MYThp?=
 =?utf-8?B?N0NCUUZ1WkhzQzBMYnpvVlhsNkYwOHByY2JpNG5nSnRPaGRPYklzVTlHRnZu?=
 =?utf-8?B?aGdGbkZTbmg4bkdKQkNwdGxCa2Foazc0Y2Z6TE5kZjBXRmhBRy81YWxzNzdL?=
 =?utf-8?Q?AQsJ1L?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5953.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZGk2VFplOGoxNGNRRzZSVTdlb2UvQXprWkpUUi9abEZtMDBzNFk3SVhGYVNo?=
 =?utf-8?B?aTY0Q2NoTCtJY2JaTDN4bC9mbDZ2Z0dFKzZES0tBaitSekRaSllEMkkzT3JS?=
 =?utf-8?B?SkhmNllPUklyUXBGT0xNekNkVk5NUmdSczZvS0tQYzBSNkNEeUoyQUVZTHA1?=
 =?utf-8?B?OUJXZFNGNWV0SVJWQ2loR0hKNnk2bVNtVC9tQ2FZeVRBM280M2grWEU2eFl1?=
 =?utf-8?B?dndkZFh3R1Z1WDVnU0JvL3ZuWmxuWGlEMDAvTTQrOXI2Zy9UZ3RUOXVhWEY4?=
 =?utf-8?B?akVjbnZuNC8vWHZwa0ZlcnNVWG42eXMxNDZmclJ2anlFZTE0TzBQdThKTnVE?=
 =?utf-8?B?aThMVUNyNjl2ZTQrMkZhUG1weTMwYk5xUHhIWXJRWFFNMW5USFNyNm1KaHVa?=
 =?utf-8?B?ekU2Nk9icWJvQWpCWWFSVEw5QXkwNHpNTFNlTW56bmE1Z3NpeUVkM1dYV0dI?=
 =?utf-8?B?RlVuNmJoTUxYd1lZQWx6YTRyUXdjS1Yxd1U4czJ0TVl5TDZpUXdPczFMdVVq?=
 =?utf-8?B?SUNVd01ZTW13SGxUcTVlOWRHdkRIbDY0aE9rOGFXUVY0aStXV3dmUk4vTFRX?=
 =?utf-8?B?MlNYMU00eGE4QmdDUmUvWnAvRVp5empNOThqbXpvMEUwU0VZbGZGU3pOcmZ1?=
 =?utf-8?B?bXAvamZ6WDVJRWQxZ1FQUFZQd0YvanNqY2NLbndyT1AxbjJsbnVWNG0zWHhn?=
 =?utf-8?B?STdIZENocG5JMTFUTXkrc1MxNGdTak9qN2JMZzBSTHl5aExreENCNXIxRDBr?=
 =?utf-8?B?SXFGa0lTY3daWURRMnNnM0F4RU1jakljL3pLVGxZQkZWbGNsS0tUc1JSTVl2?=
 =?utf-8?B?YlFTUzFmRzJYejM3bFN4UldteS9mQ2V3S0ViVWdpMTFhMURRSG1zUEJDQkZ0?=
 =?utf-8?B?T0VzZmxHNjc3ZExpOFZXWi9JRjk0SkNhTFZnMGpFejc0RU96M2pGeVUvL2pw?=
 =?utf-8?B?RmRwTUg1Q3hFNEJaU1Noc2Vaa05qclhTWmZyNW5rblhXVWxyTWZ5S2kyQkpa?=
 =?utf-8?B?cUdWODFPZEtxVGFQZDd0V3Y0SHN1R1VoM3UyRkExTStsRXpwMUs3SjR4c2Q5?=
 =?utf-8?B?MUlpeFhSV2VJVWYvaUJVQld5MkVEQmR4ZTFmeCtVWjdOaUszQ25GOTRlMmRB?=
 =?utf-8?B?OWsrMDA4Zlc2d1NyVTRRYzloVTVYQW1jS2hXbXRMa2U4Y0MrbjA2U2xpNFE3?=
 =?utf-8?B?aVczK0tlc3lFY3p1eHhjSVJZWmdGNSt3RE1uYTBpZllNa2Y2YjNkeWdaa01N?=
 =?utf-8?B?djEyWXI3MW5udW9LTE9ZNnlQaUJpK0NKaVc2YUthV1BSSmVDN0I3NjRSMWpC?=
 =?utf-8?B?bjh0cTRDcmxpbzlGekUrb3VtUFdURzUvZjhyazBONGFValV2WGxMNzB1S1hi?=
 =?utf-8?B?d3dHUUp5cE1jK1J1UDJuamlSU1h4MjdHTmxpWGlmSFZ2a0VWNTJEWkV2dFpI?=
 =?utf-8?B?ODFYK2lKMVBMUnphTmxROHczQTZZdm91YlBHV2s3elVQNi9kZURwb0lTNE55?=
 =?utf-8?B?OWpJWmRGSmtGZlJab05xdThjamVncnBVZ1M3OHUxd3plV0NyVURtVEdsVWlh?=
 =?utf-8?B?MmhBMGRTTGtvRXQxWnVEOGliRmQ3bTNmVVN4QzBtRThta0lsS3NsNGVSRFo4?=
 =?utf-8?B?US9VUk5BbE9sczNrMEkyUDBkVzVFUWRML1lJOTRFNmZZYWFaVXg2RmlTcjZ5?=
 =?utf-8?B?OE1PenN1OFF4WkhibkdjNjJIVVZJZ3BhT28xN3orQXI0M0U5cEFDQnpXSnBB?=
 =?utf-8?B?R3Y3ZFVBakZjcTMvcDMyTkdIVUNOUUFFWkcyNVdtdVYrWXVQVW5HL1Q2bXgx?=
 =?utf-8?B?WEJTRXN0RUxERFozWkg1RW9iK2VlcTM3UzYrSWUyZjhtNmVrS2pCTlpGNERK?=
 =?utf-8?B?bnBPczlXMEZqdzNWQWZxUmQ1d0ZFS2lPUEQxUVVmSU5qV3dneW0rdy9aK3Qw?=
 =?utf-8?B?SWxlVTZmakMzY1ZZdTJlTVNuSzhFWVBydU9hVVZnNkd4YnpJZ0JMZEtBYkhU?=
 =?utf-8?B?VFdTSnhQempOU0J3dkV5cEtmaWZhUXlnVG4yc1Fxa3pTK1E1Q09LaXc1VUxM?=
 =?utf-8?B?d0VCWDc2UDVMWjI5RHRkWEtITlB6QXlnVWJFT0JtYjZhWm5NcVFVUWhsUDVK?=
 =?utf-8?B?KzVWeUxLejg2ak5mbGZNU3pMRmM1YmhmY0tjYVlLbVZCMjh3b2ZHQS95RTVI?=
 =?utf-8?B?VHVtdEdMdjBGaWJOOFpWeWppViswOC9YRDJ3U1R0bGRYelF2U1dYd01aUFBj?=
 =?utf-8?B?TVdnSVpaYVZnYThxczB3Zkh3WlZYKzJNKzRTTUIwMEowbk0wNmszME5ZQml2?=
 =?utf-8?Q?ivoGIWXi3ewVHk1cuQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5953.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f975e23a-da3e-4a5f-5963-08de4f449096
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2026 06:01:43.5240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mfa09LXlYQlzLQdxVPrcHDIiJl57GJ26e8AeyVvfKWoVW15VXCAxc9WBO3wohrDQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7417

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUaGluaCBOZ3V5ZW4gPFRo
aW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQo+IFNlbnQ6IEZyaWRheSwgSmFudWFyeSA5LCAyMDI2
IDY6MTkgQU0NCj4gVG86IFNlYW4gQW5kZXJzb24gPHNlYW4uYW5kZXJzb25AbGludXguZGV2Pg0K
PiBDYzogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPjsgb3BlbiBsaXN0
OkRFU0lHTldBUkUNCj4gVVNCMyBEUkQgSVAgRFJJVkVSIDxsaW51eC11c2JAdmdlci5rZXJuZWwu
b3JnPjsgRnJhZ2VyLCBOZWFsDQo+IDxuZWFsLmZyYWdlckBhbWQuY29tPjsgU2ltZWssIE1pY2hh
bCA8bWljaGFsLnNpbWVrQGFtZC5jb20+OyBvcGVuIGxpc3QNCj4gPGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc+OyBtb2RlcmF0ZWQgbGlzdDpBUk0vWllOUSBBUkNISVRFQ1RVUkUNCj4gPGxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz47IFBoaWxpcHAgWmFiZWwgPHAuemFi
ZWxAcGVuZ3V0cm9uaXguZGU+Ow0KPiBQYW5kZXksIFJhZGhleSBTaHlhbSA8cmFkaGV5LnNoeWFt
LnBhbmRleUBhbWQuY29tPjsgR3JlZyBLcm9haC1IYXJ0bWFuDQo+IDxncmVna2hAbGludXhmb3Vu
ZGF0aW9uLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gdXNiOiBkd2MzOiBBbHdheXMgZGVh
c3NlcnQgeGlsaW54IHJlc2V0cw0KPg0KPiBPbiBUdWUsIEphbiAwNiwgMjAyNiwgU2VhbiBBbmRl
cnNvbiB3cm90ZToNCj4gPiBJZiB3ZSBkb24ndCBoYXZlIGEgdXNiMyBwaHkgd2UgZG9uJ3QgbmVl
ZCB0byBhc3NlcnQgdGhlIGNvcmUgcmVzZXRzLg0KPiA+IERlYXNzZXJ0IHRoZW0gZXZlbiBpZiB3
ZSBkaWRuJ3QgYXNzZXJ0IHRoZW0gdG8gc3VwcG9ydCBib290aW5nIHdoZW4NCj4gPiB0aGUgYm9v
dGxvYWRlciBuZXZlciByZWxlYXNlZCB0aGUgY29yZSBmcm9tIHJlc2V0Lg0KSXMgaXQgYSBjdXN0
b21pemVkIGJvb3Rsb2FkZXIgPyBpLmUgaXQgYXNzZXJ0IHJlc2V0IGJ1dCBkb24ndCBkZWFzc2Vy
dC4NCg0KSSB0aGluayBpZGVhbGx5IGNvcmUgL0FQQiByZXNldCBzaG91bGQgYmUgZG9uZSBpbmRl
cGVuZGVudCBvbg0KTUFDIDIuMC8zLjAgY29uZmlndXJhdGlvbi4gTm90IHN1cmUgd2hlcmUgdGhl
IHJlY29tbWVuZGF0aW9uIGlzDQpjb21pbmcgZnJvbSB0byBvbmx5IGRvIGl0IGZvciAzLjAgTUFD
LiBMZXQgbWUgY2hlY2sgdGhlIElQIHNwZWMuDQpUaGluaDogUGxlYXNlIGNoaW1lIGluIHdpdGgg
eW91ciB0aG91Z2h0cy4NCg0KDQo+ID4NCj4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIEFuZGVy
c29uIDxzZWFuLmFuZGVyc29uQGxpbnV4LmRldj4NCj4gPiAtLS0NCj4gPg0KPiA+ICBkcml2ZXJz
L3VzYi9kd2MzL2R3YzMteGlsaW54LmMgfCA2Nw0KPiA+ICsrKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0tLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDM1IGRl
bGV0aW9ucygtKQ0KPiA+DQo+DQo+IFRoaXMgc291bmRzIGxpa2UgYSBmaXguIERvZXMgaXQgbmVl
ZCB0byBiZSBDYyBTdGFibGUgYW5kIGJhY2twb3J0ZWQ/DQo+DQo+IFJlZ2FyZGxlc3MsDQo+DQo+
IEFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQo+DQo+
IFRoYW5rcywNCj4gVGhpbmgNCj4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9k
d2MzLXhpbGlueC5jDQo+ID4gYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMteGlsaW54LmMgaW5kZXgg
MGE4YzQ3ODc2ZmY5Li5mNDFiMGRhNWU4OWQNCj4gPiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L3VzYi9kd2MzL2R3YzMteGlsaW54LmMNCj4gPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMt
eGlsaW54LmMNCj4gPiBAQCAtMTMyLDIxICsxMzIsNiBAQCBzdGF0aWMgaW50IGR3YzNfeGxueF9p
bml0X3p5bnFtcChzdHJ1Y3QgZHdjM194bG54DQo+ICpwcml2X2RhdGEpDQo+ID4gICAgICAgICAg
ICAgZ290byBlcnI7DQo+ID4gICAgIH0NCj4gPg0KPiA+IC0gICAvKg0KPiA+IC0gICAgKiBUaGUg
Zm9sbG93aW5nIGNvcmUgcmVzZXRzIGFyZSBub3QgcmVxdWlyZWQgdW5sZXNzIGEgVVNCMyBQSFkN
Cj4gPiAtICAgICogaXMgdXNlZCwgYW5kIHRoZSBzdWJzZXF1ZW50IHJlZ2lzdGVyIHNldHRpbmdz
IGFyZSBub3QgcmVxdWlyZWQNCj4gPiAtICAgICogdW5sZXNzIGEgY29yZSByZXNldCBpcyBwZXJm
b3JtZWQgKHRoZXkgc2hvdWxkIGJlIHNldCBwcm9wZXJseQ0KPiA+IC0gICAgKiBieSB0aGUgZmly
c3Qtc3RhZ2UgYm9vdCBsb2FkZXIsIGJ1dCBtYXkgYmUgcmV2ZXJ0ZWQgYnkgYSBjb3JlDQo+ID4g
LSAgICAqIHJlc2V0KS4gVGhleSBtYXkgYWxzbyBicmVhayB0aGUgY29uZmlndXJhdGlvbiBpZiBV
U0IzIGlzIGFjdHVhbGx5DQo+ID4gLSAgICAqIGluIHVzZSBidXQgdGhlIHVzYjMtcGh5IGVudHJ5
IGlzIG1pc3NpbmcgZnJvbSB0aGUgZGV2aWNlIHRyZWUuDQo+ID4gLSAgICAqIFRoZXJlZm9yZSwg
c2tpcCB0aGVzZSBvcGVyYXRpb25zIGluIHRoaXMgY2FzZS4NCj4gPiAtICAgICovDQo+ID4gLSAg
IGlmICghcHJpdl9kYXRhLT51c2IzX3BoeSkgew0KPiA+IC0gICAgICAgICAgIC8qIERlc2VsZWN0
IHRoZSBQSVBFIENsb2NrIFNlbGVjdCBiaXQgaW4gRlBEIFBJUEUgQ2xvY2sgcmVnaXN0ZXIgKi8N
Cj4gPiAtICAgICAgICAgICB3cml0ZWwoUElQRV9DTEtfREVTRUxFQ1QsIHByaXZfZGF0YS0+cmVn
cyArDQo+IFhMTlhfVVNCX0ZQRF9QSVBFX0NMSyk7DQo+ID4gLSAgICAgICAgICAgZ290byBza2lw
X3VzYjNfcGh5Ow0KPiA+IC0gICB9DQo+ID4gLQ0KPiA+ICAgICBjcnN0ID0gZGV2bV9yZXNldF9j
b250cm9sX2dldF9leGNsdXNpdmUoZGV2LCAidXNiX2Nyc3QiKTsNCj4gPiAgICAgaWYgKElTX0VS
UihjcnN0KSkgew0KPiA+ICAgICAgICAgICAgIHJldCA9IFBUUl9FUlIoY3JzdCk7DQo+ID4gQEAg
LTE3MSwyMiArMTU2LDMxIEBAIHN0YXRpYyBpbnQgZHdjM194bG54X2luaXRfenlucW1wKHN0cnVj
dCBkd2MzX3hsbngNCj4gKnByaXZfZGF0YSkNCj4gPiAgICAgICAgICAgICBnb3RvIGVycjsNCj4g
PiAgICAgfQ0KPiA+DQo+ID4gLSAgIHJldCA9IHJlc2V0X2NvbnRyb2xfYXNzZXJ0KGNyc3QpOw0K
PiA+IC0gICBpZiAocmV0IDwgMCkgew0KPiA+IC0gICAgICAgICAgIGRldl9lcnIoZGV2LCAiRmFp
bGVkIHRvIGFzc2VydCBjb3JlIHJlc2V0XG4iKTsNCj4gPiAtICAgICAgICAgICBnb3RvIGVycjsN
Cj4gPiAtICAgfQ0KPiA+ICsgICAvKg0KPiA+ICsgICAgKiBBc3NlcnRpbmcgdGhlIGNvcmUgcmVz
ZXRzIGlzIG5vdCByZXF1aXJlZCB1bmxlc3MgYSBVU0IzIFBIWSBpcyB1c2VkLg0KPiA+ICsgICAg
KiBUaGV5IG1heSBhbHNvIGJyZWFrIHRoZSBjb25maWd1cmF0aW9uIGlmIFVTQjMgaXMgYWN0dWFs
bHkgaW4gdXNlIGJ1dA0KPiA+ICsgICAgKiB0aGUgdXNiMy1waHkgZW50cnkgaXMgbWlzc2luZyBm
cm9tIHRoZSBkZXZpY2UgdHJlZS4gVGhlcmVmb3JlLCBza2lwDQo+ID4gKyAgICAqIGEgZnVsbCBy
ZXNldCBjeWNsZSBhbmQganVzdCBkZWFzc2VydCB0aGUgcmVzZXRzIGlmIHRoZSBwaHkgaXMNCj4g
PiArICAgICogYWJzZW50Lg0KPiA+ICsgICAgKi8NCj4gPiArICAgaWYgKHByaXZfZGF0YS0+dXNi
M19waHkpIHsNCj4gPiArICAgICAgICAgICByZXQgPSByZXNldF9jb250cm9sX2Fzc2VydChjcnN0
KTsNCj4gPiArICAgICAgICAgICBpZiAocmV0IDwgMCkgew0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgZGV2X2VycihkZXYsICJGYWlsZWQgdG8gYXNzZXJ0IGNvcmUgcmVzZXRcbiIpOw0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgZ290byBlcnI7DQo+ID4gKyAgICAgICAgICAgfQ0KPiA+DQo+ID4g
LSAgIHJldCA9IHJlc2V0X2NvbnRyb2xfYXNzZXJ0KGhpYnJzdCk7DQo+ID4gLSAgIGlmIChyZXQg
PCAwKSB7DQo+ID4gLSAgICAgICAgICAgZGV2X2VycihkZXYsICJGYWlsZWQgdG8gYXNzZXJ0IGhp
YmVybmF0aW9uIHJlc2V0XG4iKTsNCj4gPiAtICAgICAgICAgICBnb3RvIGVycjsNCj4gPiAtICAg
fQ0KPiA+ICsgICAgICAgICAgIHJldCA9IHJlc2V0X2NvbnRyb2xfYXNzZXJ0KGhpYnJzdCk7DQo+
ID4gKyAgICAgICAgICAgaWYgKHJldCA8IDApIHsNCj4gPiArICAgICAgICAgICAgICAgICAgIGRl
dl9lcnIoZGV2LCAiRmFpbGVkIHRvIGFzc2VydCBoaWJlcm5hdGlvbiByZXNldFxuIik7DQo+ID4g
KyAgICAgICAgICAgICAgICAgICBnb3RvIGVycjsNCj4gPiArICAgICAgICAgICB9DQo+ID4NCj4g
PiAtICAgcmV0ID0gcmVzZXRfY29udHJvbF9hc3NlcnQoYXBicnN0KTsNCj4gPiAtICAgaWYgKHJl
dCA8IDApIHsNCj4gPiAtICAgICAgICAgICBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBhc3NlcnQg
QVBCIHJlc2V0XG4iKTsNCj4gPiAtICAgICAgICAgICBnb3RvIGVycjsNCj4gPiArICAgICAgICAg
ICByZXQgPSByZXNldF9jb250cm9sX2Fzc2VydChhcGJyc3QpOw0KPiA+ICsgICAgICAgICAgIGlm
IChyZXQgPCAwKSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIkZhaWxl
ZCB0byBhc3NlcnQgQVBCIHJlc2V0XG4iKTsNCj4gPiArICAgICAgICAgICAgICAgICAgIGdvdG8g
ZXJyOw0KPiA+ICsgICAgICAgICAgIH0NCj4gPiAgICAgfQ0KPiA+DQo+ID4gICAgIHJldCA9IHBo
eV9pbml0KHByaXZfZGF0YS0+dXNiM19waHkpOyBAQCAtMjAxLDExICsxOTUsMTUgQEAgc3RhdGlj
DQo+ID4gaW50IGR3YzNfeGxueF9pbml0X3p5bnFtcChzdHJ1Y3QgZHdjM194bG54ICpwcml2X2Rh
dGEpDQo+ID4gICAgICAgICAgICAgZ290byBlcnI7DQo+ID4gICAgIH0NCj4gPg0KPiA+IC0gICAv
KiBTZXQgUElQRSBQb3dlciBQcmVzZW50IHNpZ25hbCBpbiBGUEQgUG93ZXIgUHJlc2VudCBSZWdp
c3RlciovDQo+ID4gLSAgIHdyaXRlbChGUERfUE9XRVJfUFJTTlRfT1BUSU9OLCBwcml2X2RhdGEt
PnJlZ3MgKw0KPiBYTE5YX1VTQl9GUERfUE9XRVJfUFJTTlQpOw0KPiA+IC0NCj4gPiAtICAgLyog
U2V0IHRoZSBQSVBFIENsb2NrIFNlbGVjdCBiaXQgaW4gRlBEIFBJUEUgQ2xvY2sgcmVnaXN0ZXIg
Ki8NCj4gPiAtICAgd3JpdGVsKFBJUEVfQ0xLX1NFTEVDVCwgcHJpdl9kYXRhLT5yZWdzICsNCj4g
WExOWF9VU0JfRlBEX1BJUEVfQ0xLKTsNCj4gPiArICAgaWYgKHByaXZfZGF0YS0+dXNiM19waHkp
IHsNCj4gPiArICAgICAgICAgICAvKiBTZXQgUElQRSBQb3dlciBQcmVzZW50IHNpZ25hbCBpbiBG
UEQgUG93ZXIgUHJlc2VudCBSZWdpc3RlciovDQo+ID4gKyAgICAgICAgICAgd3JpdGVsKEZQRF9Q
T1dFUl9QUlNOVF9PUFRJT04sIHByaXZfZGF0YS0+cmVncyArDQo+IFhMTlhfVVNCX0ZQRF9QT1dF
Ul9QUlNOVCk7DQo+ID4gKyAgICAgICAgICAgLyogU2V0IHRoZSBQSVBFIENsb2NrIFNlbGVjdCBi
aXQgaW4gRlBEIFBJUEUgQ2xvY2sgcmVnaXN0ZXIgKi8NCj4gPiArICAgICAgICAgICB3cml0ZWwo
UElQRV9DTEtfU0VMRUNULCBwcml2X2RhdGEtPnJlZ3MgKw0KPiBYTE5YX1VTQl9GUERfUElQRV9D
TEspOw0KPiA+ICsgICB9IGVsc2Ugew0KPiA+ICsgICAgICAgICAgIC8qIERlc2VsZWN0IHRoZSBQ
SVBFIENsb2NrIFNlbGVjdCBiaXQgaW4gRlBEIFBJUEUgQ2xvY2sgcmVnaXN0ZXIgKi8NCj4gPiAr
ICAgICAgICAgICB3cml0ZWwoUElQRV9DTEtfREVTRUxFQ1QsIHByaXZfZGF0YS0+cmVncyArDQo+
IFhMTlhfVVNCX0ZQRF9QSVBFX0NMSyk7DQo+ID4gKyAgIH0NCj4gPg0KPiA+ICAgICByZXQgPSBy
ZXNldF9jb250cm9sX2RlYXNzZXJ0KGNyc3QpOw0KPiA+ICAgICBpZiAocmV0IDwgMCkgew0KPiA+
IEBAIC0yMjUsNyArMjIzLDYgQEAgc3RhdGljIGludCBkd2MzX3hsbnhfaW5pdF96eW5xbXAoc3Ry
dWN0IGR3YzNfeGxueA0KPiAqcHJpdl9kYXRhKQ0KPiA+ICAgICAgICAgICAgIGdvdG8gZXJyOw0K
PiA+ICAgICB9DQo+ID4NCj4gPiAtc2tpcF91c2IzX3BoeToNCj4gPiAgICAgLyogdWxwaSByZXNl
dCB2aWEgZ3Bpby1tb2RlcGluIG9yIGdwaW8tZnJhbWV3b3JrIGRyaXZlciAqLw0KPiA+ICAgICBy
ZXNldF9ncGlvID0gZGV2bV9ncGlvZF9nZXRfb3B0aW9uYWwoZGV2LCAicmVzZXQiLCBHUElPRF9P
VVRfSElHSCk7DQo+ID4gICAgIGlmIChJU19FUlIocmVzZXRfZ3BpbykpIHsNCj4gPiAtLQ0KPiA+
IDIuMzUuMS4xMzIwLmdjNDUyNjk1Mzg3LmRpcnR5DQo+ID4NCg==

