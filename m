Return-Path: <linux-usb+bounces-31162-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A5ECA371D
	for <lists+linux-usb@lfdr.de>; Thu, 04 Dec 2025 12:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37E20317616D
	for <lists+linux-usb@lfdr.de>; Thu,  4 Dec 2025 11:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34C5B33F371;
	Thu,  4 Dec 2025 11:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="qP+SoJhE";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="GUGIAXaq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD67B33EB19;
	Thu,  4 Dec 2025 11:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764847569; cv=fail; b=cvo9eSMJ33Z5Bs1XRalbX9QU9BTlvvch1C0FKYx4lglwbcI0OZPAYvWDVVkcdWkjA1fI+P+78QSgkAZXS7R2WH/YVlcAypj01EPMqHyHYVwvPnEcvUq50f8rQZyv5dfeKwDK1JB7Nl725Lqr5O7qdGr47tNFTk57s4wm1PbCWQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764847569; c=relaxed/simple;
	bh=tCVxUn3juQ11NlOnkQFOYqgU9UTGh2qp/R+P8X/Iy3M=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=n5UqHsnDXGaADPdCsgWpYGt+89yQLjjrj1yDmBuM9PmgeRopMUnvJfNNTvaLPrutHpf2mElmsbe2RM9oJFDTQNJ6inVDwYjpZaVsnr2nd85hKmCwvkmmsamzg4ndAAlI6NjckQF8x7GvYXWzQbjKDOlNSX+cWnRyf7J+3RvLBqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=qP+SoJhE; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=GUGIAXaq; arc=fail smtp.client-ip=205.220.184.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4ArPHD2378503;
	Thu, 4 Dec 2025 12:09:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=270620241; bh=t+J95qRZS1pA4gZ/TUWbyw
	fCg+K4z+zDWNVexJqONyY=; b=qP+SoJhEX0nHwZpftJpw9lpOZebth9xsq21xgX
	/A8Mk87yaZEpiONEN6p8MdMuEwTaI7R6nE325JTHT/D+Fi2b536FyOx/pNquFaf4
	uLcGL/K/FRhLrWXgZuzJYnndbHnHiwTbwCzNy+v40bIsbNkPCmMFs+IR73DY92//
	HuDTqvEsvkPIN4XsD9FdSwjx9uG8jDbiZog2qN4rvIyWYdSDxIFHhTUS4j1XHXC6
	2G6aG4UdRMiK3xw17pnXCbTaxnVkhxopzdQJ/xFMxgzjatDz8O5XtQnWeANMpvOb
	S1JaPO1TocCj4PM5ER9CYnN/nvbEdr+1P4Q11oXQw0buMOfg==
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11022116.outbound.protection.outlook.com [52.101.66.116])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4au8wy80fj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 12:09:20 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TyZX+GM69NGbfUHgPQmxB7pnKeUzUDjD1AcbID8aBLj72JM199m7uUxqJDrJ13eD9tUFFdGH2Uzpw+yznkc4ufW/wrcbOGiX+g8CIHlT8YkYsX63AwAKCsemt094vdEuTiEwUwlwlbnA60kbFgxmrFd+V6jcMJNYZrOdjep0NqcjeB7lBXoEbgGW8sFS2GDVN3+BH0K/1bFXxJcVCq+ODipIksIGsE6snOHncwGrcDA+ZS4uGeO1xbSXqLbm6qzkKziaIrBH5Erl8ry0DgjyXnXG79HlZ/3lNytyapzz1MfZ9fgOBWkKVB09uJePLWw/qN12lTXDHzLUij/Bpt8dZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+J95qRZS1pA4gZ/TUWbywfCg+K4z+zDWNVexJqONyY=;
 b=aNgn0YrnX980SDCm/pFwSHl67HWcNHOrUraXjeUIA0M59aDwHz4Zxvkp58L+Z4hn+e0Rdoyim0+Dvlb7UpiJAl8y/MYs84Xtr+k8KgFU9yhi0ANgvlh4SAxwhtXvIpwpIwpprR8YvutfkkmKizBWcu/vqCFBJ2LFxGimy+40YArpThp2u0N9zU0FQIxYlIGooR1oKxtBCMbRiv1w3HH29vraWuqAGCZIh/sINLc0C3WQ0BQPHv8juClUNszNt8M5wnqi9WsXGj9v2Ez0eixuMWgOPvwH9MNBJCZpLwK71lPVS8rr2IETDH3jIWnJuMIAp9I+t0/r33LoIOCNmLVZdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+J95qRZS1pA4gZ/TUWbywfCg+K4z+zDWNVexJqONyY=;
 b=GUGIAXaqa+PEjh6rNY5c+DM4UO4vzFkDqO6bafB/tLoIVfYeStyKpdI+vkBfFsK/apAK/tEQpO/i20nbN6uoO65mNF0utQLETzZPAMZl498zoqBARLlRXtqDUDfHkyYFSE6y2t2embMcQKRwWbr4BMUkcxSsq5jYRD+aV/c5HBs=
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM (2603:10a6:d10:17c::10)
 by GV2P192MB2567.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:26b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 11:09:17 +0000
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0]) by FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0%5]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 11:09:16 +0000
Date: Thu, 4 Dec 2025 12:09:11 +0100
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: usb: Error while assigning device slot ID
Message-ID: <aTFr17xKxnWGG3vU@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/2.2.12 (2023-09-09)
X-ClientProxiedBy: GV3P280CA0045.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::18) To FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:d10:17c::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRWP192MB2997:EE_|GV2P192MB2567:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d7f677f-3f51-4f35-8848-08de332590bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S1ptNW9SWCtTN2s4eGVtWkpyVHllbXYxT1d1V2NvZXJVSHdaRTU3YlZVUVRC?=
 =?utf-8?B?c1hKRms5M3kwc09TSWIyMFdxd2grWXBBTzVjOEc4dE9ETVZFd2RQQ2lCeTRt?=
 =?utf-8?B?Nk9UTUVHSklxaVNLbk5OSDdKZVQrZHAwbjNZREVpZEpGMWw5RXJtaGliL0tU?=
 =?utf-8?B?OEtLVVhzcEUzSjIyYllkV0lwVk9sL1ovbjNDWVpEVlF1ZitCeDZtMTcxQk4r?=
 =?utf-8?B?bmtkVzJOVGRYbkdWRVF2eHlXaFB3TkplaGxNL0JTR3AyYVE3SWlscUdtQWZ1?=
 =?utf-8?B?NlgxNlZjOFZIcUxRR05vVzh4MS9jcEJSek55bTBOKzUyUlpTWm9mUWliT3hK?=
 =?utf-8?B?eUFlKzl6QURXSWJqQW1YZ1FmQ3g4aW1xS0xMV1Y4UHFnTGxpR01XYWovSUhR?=
 =?utf-8?B?TnZWNyttQ3lBdGhJWlBvMlUwdGRlSXNwS21lcHFubmQ0ak5acHBUN04yOVhq?=
 =?utf-8?B?b0ZhRVpYbFh4SmV6ZzFsOEY2RzdoMFpCUjdGMm9iQTYreWZ5U01uK1VoNU5y?=
 =?utf-8?B?ODlMaHh4TU1ad3RrYllRSStadGZDUDNDUUFGOERzcnhCYjlNeTR5MDRpV1Mw?=
 =?utf-8?B?WTVxWmdpWEFZa3l3SHZIWXFvWndqS2gvWGVBWlljL0Q2bWl6RDFZUlBpcVo2?=
 =?utf-8?B?eHB1TGVkODlBL2xzaUdUTlo0Y3FWRjQ0NUU4eHUvYWQ1RXdGdXdObW1JMnF0?=
 =?utf-8?B?ZTdocC9RdzJLSlVKZUVTNUZEaG5hNml2YTZRejJlUXdmWTdFc0NRaUtTMlhv?=
 =?utf-8?B?bTk4TVFwYTRYcWhwQTdtckZ3d3FWejQ4aGJQemJnRml2cjdSZ3hGMFJlbFly?=
 =?utf-8?B?b2t4YXZYWFkwcHhQbkl1a2xmb01McjhxVVNqdzJvWFVyVXE1Sm9KYkpidTNa?=
 =?utf-8?B?bUk3S3hzUTBYZDlaQUhtb01uMkVidXBwZHZmMy9hZUpVSXhKbTBGMnZQcUll?=
 =?utf-8?B?SDF1cGVnVGE2am02bVJ2enhROWE1dTlVZi9SaHNPNW52U0VQV0J2b3pFN3hx?=
 =?utf-8?B?ODlTby9LbkYyOE9Ud1dvS1dORkZvZmlvN3ZoL0U0Zm16aXhmR1lpcWpTQ0F6?=
 =?utf-8?B?NUFQWkQzN2JpczFGcHMvbHBhZVdtZGJHUUVINUZ3WVlaVGxQbmxINndQMGJU?=
 =?utf-8?B?azVwMHRWVGo2ZWx2RFQyMjhLSEtNYWxUajRteE5Wck9TZzZpUEc5cnpIb2Jm?=
 =?utf-8?B?S0tnSUZ6bUJ4bGVXYkdWMXlwVXdSazNPakhWV3hNbmt6YS91Nk15QWRtM1FT?=
 =?utf-8?B?cmFMZlhudFJ2YTQwQ01LNTZCeTVaS1JVOHFhS1orcWZLZFBLYWpORlFTVTFy?=
 =?utf-8?B?OTNCVTA0ZW1XbmxaY29HUXpxVWVjL2hyTzE1ZTFlVm1kd1N4ZVlieFhFdWpI?=
 =?utf-8?B?aHRBWXI0NktIUWZTcUJmUExPdCs5cithOENPeTdCbmlRUXhVMzZMRkR2OFlm?=
 =?utf-8?B?cjU1SHR4eFF1U2FtNWZVWGVveXFjWm8yQ0Frc2Nxc1JsT044Tk41aWNKWDJH?=
 =?utf-8?B?VTZxczNzTDBoZWRESVVxTzllSTZuTmhVODFVYXV0c3prNTdBTUhpdDNmZ1Bx?=
 =?utf-8?B?TFhyZGhBZllLWXZZMmpNNk0yamVYWlZlTzRFV0NJOC8zNm4zaGVUai9oMDU4?=
 =?utf-8?B?VzV4K2VZRjlBOUlOYk81d3l4US9IV1VscDRjcjNuYUdNdHBkMVBJSDB1RlJQ?=
 =?utf-8?B?T01HZ1c2aFRlN08venlPT250VDRUZURzQnU0dWZyUHBjTHVQeWRJc1dWd2pi?=
 =?utf-8?B?TU1jZTRkTU8rZi81M0VDTE9jeklWRVo2SkdOTWNaS3RnSUpudjBMM242cThX?=
 =?utf-8?B?OFNNSVNEZGNDRDY4a0tORUt1WE9WRkFmSmxsZHJOWjkrKzdCZlVYeTNqREZz?=
 =?utf-8?B?RGdDMU95bTY0UEgwTThyaklqTXhjSHpRNWJFU0JVV1U1Q0ZZaHFQYkN4bkZi?=
 =?utf-8?Q?IFjkAY9vbW1DwNLr7GP/K0D5LBmHM19L?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWP192MB2997.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGRhVGFiOVFLbXhML3AzNHhkMzlBc21ldEdjTXdIZUlrdDQ1RGZJSUNmU05j?=
 =?utf-8?B?cDV6ekYrVUoxYjZpWVFDUk15d040aHJIbndYeGVWc3hKemtkNlJKeXJkbGlo?=
 =?utf-8?B?WktFN2lkOXZwYnRkZTNxZG5rNFJPUEZOaDZZeHBPenlMNXQrVlRGb0dhUk5W?=
 =?utf-8?B?Qy9kbHJXVmlSTERUL3RQVDQyM0FhSDNzOU1HYnB4VTA0K0N2VFRsS21rTG11?=
 =?utf-8?B?YWJOOFZvSGkyVGRDejNnOTd3NVJ1clBBUFRZdjU0MzhmK0ZqdlRmWVpGZ2dM?=
 =?utf-8?B?THV5ZHgvOVVzK2hrZmg1QTAzRnJqTDcycTZMWkJFQUlSYTBhb25RM2s1MGVI?=
 =?utf-8?B?QmpEcXI5bkdFaGNKakFjSWU0M2htazRDeE9UMWwxN3QxQy9IN0JuRkQxN2ZK?=
 =?utf-8?B?UWZXMmJTdURON0Y1UjNqTkpZY3V3elQrWWpNaWtWVnpNcnZFcFJvYnppL042?=
 =?utf-8?B?ek9qcWdXOHFrdHNXczk5RDNaWDR6ZG9hNzh4YVl4MGFtdXlUcXNQV0JRNlVQ?=
 =?utf-8?B?b3A2NVIzdGlOVnpLNFJ4czB1SXhCTHQrb0JXb0ZpaEV2WWE2QW5QU3ZlbDUw?=
 =?utf-8?B?dWQrdDJiMDBtMzYvMkZpQld3VHdSelA3dE03Z1I4S1lZT2p5YlIzWU5wcUpj?=
 =?utf-8?B?RDUyOXNESS9QSy90K1V6M2J1em9FbjNlYmFqR3huUFBxeVpDWitjTjZaRjRz?=
 =?utf-8?B?WEowdWdtKzZXRVpwaXk2cWtzRStzSkV6OGVyNG5XVEhEWnF0QzViS1VIYWs2?=
 =?utf-8?B?a2R5Y0xJcGppSnkxakRHYTNML2pIdWxmNFJkR2h0NHRwb0hmTHVmaWNFa1Zp?=
 =?utf-8?B?TlZKb01yRnZtV01JbW9CREhQQXRndmNITmdNNkYzVjdiSmFNcVpEcTdxRkRL?=
 =?utf-8?B?bGRHM3pobUFWZnpFZTdybTlaa0NZcXVaT3dwUmYzWStOUjRJVnExRnZwVDg4?=
 =?utf-8?B?ckZ5cWVjZnpVTnp1ZkpFWEQ0OUtvMFlZNGo0TFVWNXJTRjYzQXJsTFRVV3dN?=
 =?utf-8?B?NjNOamZYZkVldk5DVFRJTklQMmtBbDFBcWtFRlE4YlJmTjgrYW5lbVFxZURN?=
 =?utf-8?B?TXNHdG9USlRxS0dpOVNRRWZ4NTdpMkZ5S09rN0hqL0NjV0lRVmdXYzFOSXNI?=
 =?utf-8?B?T3daYXlJZ1pOSkpiSDVEOU5BNnBNUG9mNlN0Tm52Snl3K0p1S09NcEhEdDZQ?=
 =?utf-8?B?RWk0MnE4MXg2ZEYrcmhyOHZlZGFkdFBtQmxJUlFURVFEdDM1Tm1aSitkczgx?=
 =?utf-8?B?U2xiTHd1VWIzeHQ0LysxOFdDKzRPcGMzQTAxbnVnSjd0cEdmK0R3TFRCRVRm?=
 =?utf-8?B?MnY3Nkp1dEtRalRLWDlDSDVGV2d5dEQwM1pFUDN6T3ZUczJKaGEzOGcxcTRl?=
 =?utf-8?B?VWpLdzQxbHFRRHo2Yk5DOGNsZ09zVEpEbWxEemM2a2JMQ21JcHVaeE1mN3RV?=
 =?utf-8?B?dENFeTBHWlZvdmNIQ3VLRE8rdjJPL0trMkZib0ZaVUNmYWZWbE9wTUtXYUZM?=
 =?utf-8?B?SVNhWGlyQ0F0SjRRc1QwVGdpd0NVaHFDUEJldXdNTnhNNGR1YjNoL01pZGNT?=
 =?utf-8?B?OVhyMzd6T1BRbkFpNlhEd3Y5WWQ4SzdEM3hTOXFsUkxrTURLNkU3WkFCWExu?=
 =?utf-8?B?b3d5NFNieWFXZ2ErWXNtT0F4Ni9wUE1yV3o3bUpLWkJySnRDSXdobjZhN2h0?=
 =?utf-8?B?aG5VK3IwSUg2SStwdEVlN2hjNzlWVFVtRXFqU3FhSThNVUpuRnVFTHJIbXdq?=
 =?utf-8?B?THgxdFBoL0crS1dTTUV3dVZhbWt3TGluS3BZcGJ6U2tlR1FkcUNFMFBLcmRQ?=
 =?utf-8?B?aDZSb2NYNHhVU2tEU1NQWC9IbEVmWUYxa0I4RnFxQVVQRVZSc1c4SFdnZEpS?=
 =?utf-8?B?QXNJdnNHUGdmbjJQMFdqOXMvdnNaQlhGNWZqYjBLRCt0ZTBJaTdpWTNldG50?=
 =?utf-8?B?cUI1bVk5RHpNRlBpZlYvcTRkeEF4bVlpTHRzejgxVlVoVFgzSE85a2dQbFdD?=
 =?utf-8?B?TkFoWFg4L1RGdWZkMXh6d2pBQXVzNm9wWWFBckh4MkRWZnlhUEl0OUw4N3Jr?=
 =?utf-8?B?VDE1NmZEUStrSWVmUG81WlhMcHVLQjZOVHo5UzN0aU5EVjBmZ3I2YU50bWU5?=
 =?utf-8?Q?XTXNq6KRfIxal2KTYXXWDI/l+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6cT1CdexhWMjSfwLfr8f0LThw6GEUNMsHNADtzKJzdG5Wlj/JJJtSiLqBgWc1MGPWjnuUWAij5CJlaqGb4LRSFH3xZrVe4+umRvJzbZlE0Ohp5tm06CoMaplIu29EbcfAP24wX2xQxz7AtKVLsFS4uGvuWixEe5Em0O8Nkxp5iJrHLBDMyyicFB5z2b2Syu9LLBbCJWrTTyVy/CDKGxMh+bTR5Ivl+EpUjINmu2eNFPnaqPPnZ7BW0TIZ/VQfCeGBeOd9dvCxOP1rWbeWBLX/0eiFi9r8/UFfNS/kOtaPEThbg3BCdqneK+SCaP88wv0xIV1ZlbUcEzUkdoAQ6tH88GnB3PH3zIuCPfT6W9qu2U0Z7VsZmxmEJGq8X5/5b3/vwv2MecELA9uWjzhRg1ns+f3mMBDmGuN3DKNRdUxgIwfu51bti9sM4Xr3v8yzSAsZHFNhbimDZ3OZ5guyOjSqyE5P7TEJW/VcpxLWp4VXLa+ViziihKaVho7mMYhsULjtzhY+dnlhhYJLaGS+sHfaP8pz82W6bS0BncIs9Z+kNjiUiAv9iWmmy7YWCmV9JjzeLyGD7A83CQEE6cUjw4i3HcTHIm16rjUf+GO55i0JsC4iGR5PEVnyTLi4jvJocWB
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d7f677f-3f51-4f35-8848-08de332590bc
X-MS-Exchange-CrossTenant-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 11:09:16.8960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7us3hGG4yw5gOuFMT1X9huhyxH26a0BuUe81+/BfeMuMfsZ4wO4VSiyoqq9UTMuTSOlHQXegKhO+T+0Eesb2mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P192MB2567
X-MS-Exchange-CrossPremises-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission:
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext:
	DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: GV2P192MB2567.EURP192.PROD.OUTLOOK.COM
X-Authority-Analysis: v=2.4 cv=Vokuwu2n c=1 sm=1 tr=0 ts=69316be0 cx=c_pps
 a=f5BtQftweRdMEbMfvtUAxg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ZEtExN4_Fc2T82klrDIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: z9WX-Ua1DFKXQfLxJ6k75vq0mNfAWLXQ
X-Proofpoint-GUID: z9WX-Ua1DFKXQfLxJ6k75vq0mNfAWLXQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA5MSBTYWx0ZWRfX6CqC2QxqTxa4
 e2hk6YjNrN38YGIqsnCOa3UnQho/yWla+c7PKyp5jGIcSoX8C0MSKjwGDd+8/JZE3851sgJ6iIr
 AM77sIWlr0F6w4G13ksfSt45dYdHwa2IYPvV7R5GxK38926QtykbdKqlkXxOjHTJ7CMz0Bo3z/Z
 c98++lMVeDKImtCYdUa8lKWmjHefvV4fDCGC4RBU/zF/For1mv8P7XjUilpS9KYL/TNWkIR3xSY
 Ln0gRbxICRDPFnN8odUOSE3eDYsL963HbiqZrjVzT5v6zA8b/NrcgVT1Q4FABlt1l5QGr+Qx2hG
 De2xbdb3MxCWpJ6xz4ZyFGHXcJPDu0u6JbRe6U0Da4+5wlMz5dbodxO74DvvjC6uv2/gdEh4hhE
 HQVhl5ckWHQzPLrNdKR/YRDdhd78JQ==

Hello USB developers,

I’m using an NXP LS1046A SoC with the integrated DWC3 USB controller in
host mode. On Linux v5.5.167 my USB flash drive was detected and mountable.
After upgrading to Linux v6.6.110 the USB flash drive is no longer
recognized. If it is already plugged in during boot phase I get the
following errors:

    xhci-hcd xhci-hcd.2.auto: Error while assigning device slot ID: Command Aborted
    xhci-hcd xhci-hcd.2.auto: Max number of devices this xHCI host supports is 127

And here is the kernel debug output:

    user@host:~# cat /sys/kernel/debug/usb/xhci/xhci-hcd.3.auto/ports/port01/portsc
    Powered Connected Disabled Link:Polling PortSpeed:1 Change: Wake: WDE WOE

I’ve also found that the function `xhci_alloc_dev` shows the error message.
I printed the `command` member variables and see that the `status` is
`COMP_COMMAND_ABORTED` and `slot_id` remains `0`. I have already seen
similar error patterns in some forums, but the suggested solutions didn’t
help me. Between these releases Kconfig has changed significantly; I may be
missing a config option, but I haven’t found one. Does anyone else see this
error pattern? Or maybe someone has a hint for me on how to proceed?


Best regards
Alexander Wilhelm

