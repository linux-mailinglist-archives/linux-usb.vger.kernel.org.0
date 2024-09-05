Return-Path: <linux-usb+bounces-14752-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C10396E51C
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 23:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA6EB28A793
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 21:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF8E1AD24F;
	Thu,  5 Sep 2024 21:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="aWG2yGdu";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VmbVnvwl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JUIN+YZm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04E815687C
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 21:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725571855; cv=fail; b=KtIhYbqpR4Pv4xeeFStE4NmGNKG7pqtw1bUwuxGRR7TktdLIKD46CNWA+WFoAuA3kQ9/nvXj9mXtJMRNKpoUSjOhTK59ZNBsx5r8D/dVMPtEhwB/+eZItQt6eoaDOCYe/LngDXhpHl9mp7NtwtFtW6YQeyl63P7AbeMUbnvQ60Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725571855; c=relaxed/simple;
	bh=GtYATlDoq97edj5Armv8Ii8ka/QrZcHXkmd43vPZWJ4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hqWICc8uHT/xZXmav+QPQ10P3vPWejFb1WPX/PLI+cvTHnH6NLgYLrhBLYM0SyHm86JzITHO8oktKtCiYHyPD7X6Tph+2SEZZ+hqSjb6k+UtORlTGjNzOs7Js1v2mDS6OorjIwNBxmmSOGyN5qzpOCASLeBNycngGiVOtPR2ujc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=aWG2yGdu; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=VmbVnvwl; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JUIN+YZm reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485KqKoU025256;
	Thu, 5 Sep 2024 14:30:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=GtYATlDoq97edj5Armv8Ii8ka/QrZcHXkmd43vPZWJ4=; b=
	aWG2yGdugBoSi6xwi5fWLOkLFMrOOqZ1piVT2D2Qy6/ZgpssSrHyqZoeR2ZFEsK4
	zfi4hCJtdOh4xDSpiHmYZsUd+hu9bFsHXdARX+SHzDRPlYoxihFafWKEG3e4bMkj
	kC3s9uTbO99Zs5fhdyAGMI5bZh4BwiOFXtzozFN/W/FwtI7t4kQZsCt1nEkHOM1U
	rf/ENQCNXL6OdL9mIdRGiR1x+m8bG2GYLviZj2YvLN0PdD8K6rwCtSGNRnxT8S4m
	Id37oI4x2NA4bAq+wSXnpBFdtMSCzZVLkF4nDrqB6wI4iHtXIc0nUAYYW1oNdfqj
	caoHgMeDaU7Q7iFmfZWulg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 41fhxp8s5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 14:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1725571848; bh=GtYATlDoq97edj5Armv8Ii8ka/QrZcHXkmd43vPZWJ4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=VmbVnvwlm0d6P/+yIjtmXY8xZYXxbJ0G8N5i2YDWXxoYDM5FPJzJPgzu04L7JCexG
	 Nk4XsfRopbK6YsPA+3CN8YOQRcFcQ6FXJ3L6znSn826L5m6RTz/YVuEigtVXlomfE+
	 MVlGB19XNyoDZjzDXEUsH2l80xLUX8tczVcpHOYUdL/ttWpBrIMWRZibEXKDSh7ELh
	 FY2u3mLJ+rs8nxI1dNe+H3J8Y/k5wqzYtICo+QrqepHpXGXF8mi/Rsax2Ahjdkp/4V
	 t40QHEOhWlnvPcXI4G8TLko3ZBG19Hi7YIEnd+/W4qxuEr0ddDJPz0Im7RkNfQIpR0
	 XNUBPkr3/p0FA==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D160F40147;
	Thu,  5 Sep 2024 21:30:48 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id CA890A007B;
	Thu,  5 Sep 2024 21:30:47 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=JUIN+YZm;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2046.outbound.protection.outlook.com [104.47.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 64D8240132;
	Thu,  5 Sep 2024 21:30:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yXe4FpI8BVGNusrFoF4pS9rkkZ5e17Y15TyCsgacmx2KmQy0Bvg9SE6LvOeJYduL38aO49bDSFCNwEiqQndG6z6gwv5JSGq4FaR+tr6eimm6aO2v4RDEoJApF1Cusy0xcWEidip987UhGU+0GuoKLFBWRMai0OuLBR8VSKXxTDnm4tudUXHsrCovjr9I9Wd38FDcTnOUs4Vq9zU8NE14VsOhjqQ0dvE+JRpxYeb2QePNzxkqI4G2ytvY6iPfUuiO4VoFW8W3s/zuWxBgOK2vAJVrsEsGK/jJw8+mDPjoROElxxroTo/J/SCSmO3xNxYjsMBTaajAMlflOod4mJDQLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtYATlDoq97edj5Armv8Ii8ka/QrZcHXkmd43vPZWJ4=;
 b=EQz1R5lUfKDh7vGfUOyLLj/gQYKa4wUmRy7iuUbymbLVjWkNL7QcOCyfsq72wiT7quFlA8WRWv3lzZvYRLPmXmwPhXcaBnc4GB0uU1Ew5Z1Ho5YpLih1YZN8Qz2BuqqmhviafoXtxFUmRcX6QlRZYDoT3JFu+a6O45onyIZk3ok8HINXEBI6l5D1m9usmFP5L22f66geAjxvyeNzPlSr1a9vKNF6NGaVv4TR7CNcF71xjQwZIAzlnNYIz4ousWIgUJXA8S6mlfFGItR/QvgyOZrVAz4pPWxYY8AeW51AdzKU+YEAIeqKJxnDhup0GrxQdGZlC07zRjYBGdWtUBgzXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtYATlDoq97edj5Armv8Ii8ka/QrZcHXkmd43vPZWJ4=;
 b=JUIN+YZm8xaJueYVXkTvVgNQgHnCEy5oF13IXGgBzruiCrRXkYeIrApfOaj4/9My8WhnBNVKppnmN2cKrfZQ5AY0g1nIsR3+8B4BYDjmhc1MOGw8g4Eef0LHzVAvH7HnkDOscIoRS6168w1+bB9R3qy22QAumvRluCIDWlxFPRU=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH7PR12MB8180.namprd12.prod.outlook.com (2603:10b6:510:2b6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Thu, 5 Sep
 2024 21:30:40 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 21:30:40 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Niklas Neronin
	<niklas.neronin@linux.intel.com>
Subject: Re: [PATCH 04/12] usb: xhci: remove excessive isoc frame debug
 message spam
Thread-Topic: [PATCH 04/12] usb: xhci: remove excessive isoc frame debug
 message spam
Thread-Index: AQHa/6BT11QTgfXsiEyK+hBN2ezDMbJJtmkA
Date: Thu, 5 Sep 2024 21:30:40 +0000
Message-ID: <20240905213030.hvk2rucvrhlvkczq@synopsys.com>
References: <20240905143300.1959279-1-mathias.nyman@linux.intel.com>
 <20240905143300.1959279-5-mathias.nyman@linux.intel.com>
In-Reply-To: <20240905143300.1959279-5-mathias.nyman@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH7PR12MB8180:EE_
x-ms-office365-filtering-correlation-id: ed9e9f70-f8a1-41d2-d844-08dccdf1fda2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VnlOcU1GbmkwZlE3NCtIVEVJdThBajYvdDUwWkppeW1Mc1Z2TWlad1ZyeWhO?=
 =?utf-8?B?bjlZdnNmc2pjQ3NyZTI5QzQrT3hBdFNSOXV3MWRpbkJpOWc3c09TUmRCNlFG?=
 =?utf-8?B?QzdtMmVPT1MrWXY3bXpMdTZtemNXQncrZURLaTZNYXFacHhIZndiQkVlRUN0?=
 =?utf-8?B?RFF2Z0lJS2xDTmZZekRKZ1V0ai9pY1NyRE55U0k5MjJ5S2ZxN2dCM0lyNFBu?=
 =?utf-8?B?LzF0V1VaMzZoTTFnVTZaSEFycEtXWndyUkQvMHRXblBhcVhXeGhEdVJkWis0?=
 =?utf-8?B?R0NZd012Y0R2Q05sR2FONFRYTW05TWdLa3dndy9WWWtDOGZxZEJRN1hibDd3?=
 =?utf-8?B?ZVpTdVBnODUzdHg0Ulpaamo1azlFcjNBUzhBMnRIMVJERjJxa3BxakRERzkr?=
 =?utf-8?B?RU5aek9aYUhud25FU085Ykdxa2xMeGtoeHovbDkxV3dsbjNGVFZDZjgvZ3pI?=
 =?utf-8?B?L0VDbVoxYUsrR0F1YXc2YmtZWTFXQ2N3UHVkdGZrZWRjTlA4VHU3eUJsZ29V?=
 =?utf-8?B?SzlyOE9LTFNXaE9uZGFQeHlpT2hLUUJJaE5qQ1hHc09YNkxVcHJhTzVUeFNr?=
 =?utf-8?B?QndwL0FqUkc2UUlnZTFLRkkxMzhmVE9jT1NyZGl3MDgvOHJkZERmZCtaN0ZC?=
 =?utf-8?B?NmliNVFNU1U0Y2kwS3ZnaDdLT05BckdHcDVHalZlZGx6YTA0RWU2ODVHdzJC?=
 =?utf-8?B?blppODdidHZBZGg2d0pTVUtMNTdTWjcvQ2JRMjBWUDlhSlFOTjZBOWR4T2VY?=
 =?utf-8?B?NUpMOWJZYXpIUFBNQnVqNFBnRXAyWGRTMStUejBoTlJiMHc3Z3hrY1JmTy95?=
 =?utf-8?B?bGI2QjcvQ2hlQWVXdHgvTXlkUFNQakgzS01NRzFVR1NlVkpucEVFM28zYnlz?=
 =?utf-8?B?OHl6dFp6RFlOVEd5aXcyVlkzZHlTazBxWW9ZSTZUaXBMQ2liL1Badytoc2U4?=
 =?utf-8?B?UGVpdm94TDBWczVJSEtrWFJDUlNvdmdzMmZIdkE3enVWaFJGdVRLdlF4K2xs?=
 =?utf-8?B?NDlmcjVYb2hNeC9EaFhCSmlBbXRTZjNrU1h1VnlOVU9kZjVVT3FBbERoSXkv?=
 =?utf-8?B?RkNOeHZwQ3cyTVFXVXJEKzQvN2xuRWZyS21qSHV2RmNxTXROdE9wUVp5ZTY2?=
 =?utf-8?B?aFJqKzlyd1RQeHlFZWdVRHFRQ3d6bDFLekp2dlRlTDdiN2pmczFRN09MSWdH?=
 =?utf-8?B?TVZjSnhWcitKUkplYU1HVUVYaHhEczFUNmlmamNHSnJHSXhoeHliaC9wYVkz?=
 =?utf-8?B?NUU2MFV3UjYxcXh2YUZUNFJHWXpWUytGMHR0SUlhd3VsYkwwRU1ZcEplRGZu?=
 =?utf-8?B?Wm9hWjY3NkVZM2JCdEdXdGFIQ2RMM002bThUTUtTVGtHaE5MVC8rM0dyRjJw?=
 =?utf-8?B?WUhSMFh4QnQ3b0NDc3F4L1I5bDRPVzRULzJjOFQxaTc1TVFFQTNqL0hOWHpS?=
 =?utf-8?B?bzEwZ2NSM1huejMwWjh0YW8rVGZIZWJvRWQ1bUdzWTFnbHRBOFYrZGNLWEt1?=
 =?utf-8?B?MllwQlVPMWxtRm4yUXM2bDBsbVZrT0tSc3lsaVdmb0xDcjJiM056T0w4L01G?=
 =?utf-8?B?VkxmMUdIWW9QQWZLQWY5UVFZcXpYYmtCSTdoSFlhQTZ3bklxd3d2aFR5YUNI?=
 =?utf-8?B?cWZpUmRXQThsdGN3R2Q3c0kwMk9RaVAxK0FhUU9FWUo3UjVnZkVoSThvR2RL?=
 =?utf-8?B?RmNCZk5EUm5zREhJeVRLMXAxR0xaNTl6REV0NjhFZzNuWlJRS25GL25mcUxG?=
 =?utf-8?B?aW1YQ0dWZWdibHNTNGNVY0tWMlRGMGFkS1FwSG96UDJFcUJIcHoveExHdkc1?=
 =?utf-8?B?VnJjWXA2SWFMMkQ4aHBmc3ZiUkVaeWl1M2NmZzVxS2lvSmJlYkd4Y1VTSW1F?=
 =?utf-8?B?ZG40aE5FNzM4RU8zR0xXWnR4ak0vWmFJODMwRWJrYUxFWFE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QUxjOVZTVnpRY0V5ZnJXRHB1WVo5WllBZ0VZZnpnMzY2V0JHMHozY3d0ZDF1?=
 =?utf-8?B?YjcvSk1ZaFhWdVVpcElpdUdmeGR1djV4SHd4RlhqM2cydmpPMGFHSC8xcU9n?=
 =?utf-8?B?LzArU0kwaUVObkRicjRyL3Z5MCsvTG1lVkhjSUp4aGNKRHZnK2kyOXo5aXpa?=
 =?utf-8?B?ZE1ZMWxlNjVPUDhkZEVxMGt2VlNTZmhQZExPZjNpeHV0UUtUZG5taGdkTld2?=
 =?utf-8?B?NjBhcnpsYzJ2TzdNSitiMnVsQU1wYXhkZFJTV0pHYmZwZ2c5YitQWDlWRVZG?=
 =?utf-8?B?TjNRRDdOcHdmUGxGY04wcm13WVlNRGYzaEJ3bWt3aDU5bytSR1NHRmZld0px?=
 =?utf-8?B?MXQ2OUVleXZoZkFmTHBXOXZNV0czaTVBaDBpWU4zenRVZ1ZoSSt2N3hvZkRC?=
 =?utf-8?B?WTcxQlZubnFLR01xKy9QRmtLSXJNUGdIRnVlVDJzTzBoMW9rUXl5L3Q4TUNh?=
 =?utf-8?B?N1NTanFjcTV1bnR5cElOWVZ5OWgyVFBHSlVxVnQ1RG1hM0Z6NGlxYXkraVJC?=
 =?utf-8?B?ZzFadGN6cUpPNnQ0NkJXbEpSY3hkNTFWczJjMi9rWnM0cWxQZExPV3Y2bWEy?=
 =?utf-8?B?cWlWQXVONkVremdUb3dvZGxmb0VoYStsM1JTTS9NQ3BsbUtJMWxPeWg4N1hS?=
 =?utf-8?B?TWFtY0ZxOXdzNHlxWGptdXZNUUlDa05LOWpMdVpVelNmcEJuSC8vUE41L2lm?=
 =?utf-8?B?cGFXRWJCTlh3Si9NOUU2aEVzV2oxcS9sL2FPbTZvcG9DaVlxM2tTQUR0S1Zx?=
 =?utf-8?B?cCtnQnVmV2tqU3VmeVV3c3gveXFXUVNvdU9wWWUrTys4QnpOeXhDZTE0WVdE?=
 =?utf-8?B?Y3V0WVhvK1JzTnc5VSsvdUQ4eUNhMmlVeXN6bXpza3FMbWZlUXJMMldBZWgr?=
 =?utf-8?B?YVNBTTBvOVpScGZ0ZW9laVNQODNWL01nbjBLKzFzaFVQTlR6TUFISzQrSjVw?=
 =?utf-8?B?NXBrTWk3OU9GSDNINVIvUTdxaGNWUFgxaFJKNThSVlFPbmp2WnJ3YWsyNkZD?=
 =?utf-8?B?dEVrcXdxMGdpdTc2NEpaeVhsSnlsdUkzcUoxNUJQK0twVU4rV3B1Nnk3L2pP?=
 =?utf-8?B?V3I5QU9NV1pNSXdoWkp2MmlRbUc3TGtYT3JxT2lhTnFrTUNLb0NkTEtZSEZX?=
 =?utf-8?B?a0VGckdHWno1MGJYOUZ1UzFUc0VXL3pkYjFWb0dmYno5Y1BRYzVKeEVOU1lR?=
 =?utf-8?B?VlFNcWJwYXQ3eWhtSnRtSUFqbCtxVDM3KzBNRzVTcDkycHBtSTE2ZGpkeHRi?=
 =?utf-8?B?d0lMSU5wdmRSWXFIUmt4TDRUZ3ZyTnBZcTNsa1piK21VcGhiQ2IrcmJ3bllD?=
 =?utf-8?B?YkdIM3p0N1lOWnlCZVU2S3BsZ29HKzRpR3MzaEJZWXRPUGRqVVpRaml2aS80?=
 =?utf-8?B?Tk5tazhORnNDd25RT1ViSGVQQjFEbEhYRVFPQkdIVHgySVRhdGpHSFFGSEpt?=
 =?utf-8?B?dUEyNVNpWjFOMzJYUm5XbitGR0dlVVc2YzJpUzAyYktFanRndVpERzVnWEQ4?=
 =?utf-8?B?M2V5Nzl1Y2Vpd2MxYjRwdmFJaFF1ME5pOVVaNTNOUHc1dGZZZ08rNDQ4dkJm?=
 =?utf-8?B?ME95bW94NW1nRlJnL20zUUduQlE1OXNEanVCa3Raa0E1ZmljaXFIZ3dlNUFr?=
 =?utf-8?B?TzB5d29lVjAvemRmek5HR2hlZ0FxdGNITE9OTlJ3dzkwbm5OOVI5ZVMxbFgy?=
 =?utf-8?B?YjNnMVl0VXBudHFKRldaNEswNW9mTElKVnluVXp6RlJVUSswTitsWVlRTFZz?=
 =?utf-8?B?RUpQZGlUS090SU0wUUJoa05UNm85MW9Rb0o1d0FFUTFuNmhPN2tiVFBRRllB?=
 =?utf-8?B?ZDNhdFZ4SUVJL2lEUGo3SG14OTZpdkUzRlcxSHgrWWhObHd1a1ZwWW53Uzdj?=
 =?utf-8?B?NXhlUDNheXdmdmxRMXNxWUFwcnNYR3AxL0JWRmhzYy84ZGpuZUFJdTF3b1Q0?=
 =?utf-8?B?bnZrSmNXaGdRTmtKcFQrTzZSczJEL2xEN2VHUUtJUnUwNmlwVThQU1lhZ2tL?=
 =?utf-8?B?d2I3QTZCY1NlaXdBcmpsdkV4T0VSSzFZLzNZV3A1NlJ5OUNqaWYzYUpDUnBH?=
 =?utf-8?B?NWEvNEtJUHA1cUdKMDJINzhpLzRFR2l1QjcvOCt0eUFmb1RpeTVnUS80TVYv?=
 =?utf-8?Q?epDQEiemitNdbYGNEJHuKCirZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B70CA5523DEAB542899DFB7B673840CC@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lLpSY9UOX7UkmD2LlNIHslOFUon8Frdhshes0aUWpbZk7wg8RNRrzdW6UCf0SU9bHLRkKhAdRjWnS3AHKFKs+Ni6fAs4QN+XJwvxiIyMiSvE9ZYJAFiuMjHS6KA0sE0ecLBfAGH/38m4+UBbqAQj5YlRn6lX7dfG0J5Nb7RZITd1Yto5tw3QH33/dObc7xmaQkEw+v/u4XHp65VQ6qxv1C1BBaIe9lV3Zp5AsXoRz1W0fz8whoHR2WQourKTIbbrYlieIFSDrgqku/zmMWaEYtoWAJhUoqIIvF3TxZu2YcaP/sWYvDxAP0L4S/gnzGyb6v5kaNNrqXz0iCrUFKL/BPp+EZZlyAiGJgIOYwZbQSuW7+lD122lg7Sf2OwO9CD+xRUFfHqU9/+NrxqNh8Fts5qDE5CB/WvtQyHje1xpw5WFEZNTgQtBPJNThf96B3cl5Pb6Z7JeS3im2MZ0sINZ8LDBYzHTj5lsDSARTGpcr5XpcAK8n4YUFHSm0svdM/N8yZ/i6zdXu3ez09a7v5Bu1p3VPAnBlQQsZ8D6+UzdBCZnpqAR8rOaL9wAkP8Jk0uAsDJfld/yAx3On8NWh+1pXR1HZjSzrVEkPCfbkFPB+Ok1ntvJsvnLBNXF1khs+nk48NMOtJapM84vkVjI2kCZnA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed9e9f70-f8a1-41d2-d844-08dccdf1fda2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2024 21:30:40.5718
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gPNCpGHegnA8F/yoevlz2sw7+0/z6YjtGA9qBPYiaqkEtn9/MF/MwTYc6YUPRSGJJ50EKa1z3Pr4hQPoovY+og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8180
X-Proofpoint-ORIG-GUID: k0JJM4M_G7e2zUZhkCafJVhphxRCyFm6
X-Authority-Analysis: v=2.4 cv=d7ynygjE c=1 sm=1 tr=0 ts=66da230a cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=nEwiWwFL_bsA:10
 a=qPHU084jO2kA:10 a=QyXUC8HyAAAA:8 a=8YMmXwFRCGdqZTcFLRkA:9 a=QEXdDO2ut3YA:10 a=i8mF9ItuUNqEZ5DK4mkZ:22
X-Proofpoint-GUID: k0JJM4M_G7e2zUZhkCafJVhphxRCyFm6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_16,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 impostorscore=0 phishscore=0 clxscore=1011
 suspectscore=0 spamscore=0 adultscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409050159

T24gVGh1LCBTZXAgMDUsIDIwMjQsIE1hdGhpYXMgTnltYW4gd3JvdGU6DQo+IEZyb206IE5pa2xh
cyBOZXJvbmluIDxuaWtsYXMubmVyb25pbkBsaW51eC5pbnRlbC5jb20+DQo+IA0KPiBUaGUgcmVt
b3ZlZCBkZWJ1ZyBtZXNzYWdlcyB0cmlnZ2VyIGVhY2ggdGltZSBhbiBpc29jIGZyYW1lIGlzIGhh
bmRsZWQuDQo+IEluIGNhc2Ugb2YgYW4gZXJyb3IsIGEgZGVkaWNhdGVkIGRlYnVnIG1lc3NhZ2Ug
ZXhpc3RzLg0KPiANCj4gRm9yIGV4YW1wbGUsIGEgNjBmcHMgVVNCIGNhbWVyYSB3aWxsIHRyaWdn
ZXIgdGhlIGRlYnVnIG1lc3NhZ2UgZXZlcnkgMC42cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5p
a2xhcyBOZXJvbmluIDxuaWtsYXMubmVyb25pbkBsaW51eC5pbnRlbC5jb20+DQo+IFNpZ25lZC1v
ZmYtYnk6IE1hdGhpYXMgTnltYW4gPG1hdGhpYXMubnltYW5AbGludXguaW50ZWwuY29tPg0KPiAt
LS0NCj4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1yaW5nLmMgfCA0IC0tLS0NCj4gIDEgZmlsZSBj
aGFuZ2VkLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hv
c3QveGhjaS1yaW5nLmMgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcmluZy5jDQo+IGluZGV4IDRl
YTJjM2UwNzJhOS4uZTFjOTgzODA4NGJmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0
L3hoY2ktcmluZy5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1yaW5nLmMNCj4gQEAg
LTM5NDEsMTAgKzM5NDEsNiBAQCBzdGF0aWMgaW50IHhoY2lfZ2V0X2lzb2NfZnJhbWVfaWQoc3Ry
dWN0IHhoY2lfaGNkICp4aGNpLA0KPiAgCXN0YXJ0X2ZyYW1lX2lkID0gKHN0YXJ0X2ZyYW1lX2lk
ID4+IDMpICYgMHg3ZmY7DQo+ICAJZW5kX2ZyYW1lX2lkID0gKGVuZF9mcmFtZV9pZCA+PiAzKSAm
IDB4N2ZmOw0KPiAgDQo+IC0JeGhjaV9kYmcoeGhjaSwgIiVzOiBpbmRleCAlZCwgcmVnIDB4JXgg
c3RhcnRfZnJhbWVfaWQgMHgleCwgZW5kX2ZyYW1lX2lkIDB4JXgsIHN0YXJ0X2ZyYW1lIDB4JXhc
biIsDQo+IC0JCSBfX2Z1bmNfXywgaW5kZXgsIHJlYWRsKCZ4aGNpLT5ydW5fcmVncy0+bWljcm9m
cmFtZV9pbmRleCksDQo+IC0JCSBzdGFydF9mcmFtZV9pZCwgZW5kX2ZyYW1lX2lkLCBzdGFydF9m
cmFtZSk7DQo+IC0NCj4gIAlpZiAoc3RhcnRfZnJhbWVfaWQgPCBlbmRfZnJhbWVfaWQpIHsNCj4g
IAkJaWYgKHN0YXJ0X2ZyYW1lID4gZW5kX2ZyYW1lX2lkIHx8DQo+ICAJCQkJc3RhcnRfZnJhbWUg
PCBzdGFydF9mcmFtZV9pZCkNCj4gLS0gDQo+IDIuMjUuMQ0KPiANCg0KUGxlYXNlIGNhcHR1cmUg
dGhpcyBpbmZvIGluIHRoZSB0cmFjZXBvaW50IGluc3RlYWQuIE90aGVyd2lzZSB3ZSBoYXZlIG5v
DQppZGVhIGlmIHRoZSBpc29jIGlzIHNjaGVkdWxlZCBhcyBTSUEgb3IgQ0ZJLiBJZiBpdCdzIENG
SSwgSSB3YW50IHRvIGtub3cNCnRoZSBzdGFydCBmcmFtZSB2YWx1ZS4gQ3VycmVudGx5LCBJIGRv
bid0IHRoaW5rIHlvdSdyZSBkZWNvZGluZyB0aGlzIGluDQp0aGUgVFJCIHRyYWNlcG9pbnRzLg0K
DQpCUiwNClRoaW5o

