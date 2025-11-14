Return-Path: <linux-usb+bounces-30504-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C66C5AC6A
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 01:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73F3A3ACEB2
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 00:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 634F822425B;
	Fri, 14 Nov 2025 00:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="C0R78FCw";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kyAxKxWe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="rt19SErP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EA91DF75A;
	Fri, 14 Nov 2025 00:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763080202; cv=fail; b=JJeEInfNBHhWFExH3iejXF20OA4XEKPvp8o7U1974Fbe+bad9QpDplR2AHkZ6IXsSJgju2d0qYANrQ5Mrb8mMcRAVF8eFgZtfb8AK2sC10m8mC0Nq5hmiqIu3oQKv4QZMKpJJVzJ8NKYwZLxgl1Xbk2444M3byUb0gHYlZnk/RI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763080202; c=relaxed/simple;
	bh=In8w7e+rcqS+txQGnF0swTZyX1y/hUlgrK7T7ETWac0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kLXCtaySZ81kI30sDvdr0BAse2zT4xcR7kMl18ISTHxcqALPpBO9tjNdE2m+REOANqUCDyv9R+MAJXC9PAx1i0+knz+HD+FdocJahJNeuHPSDgWtclboqnMRQKHl57QHLMIXNGhkoqZgYKgNxtC1SxXOgUBdRzJQlL1DuNUFQDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=C0R78FCw; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kyAxKxWe; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=rt19SErP reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMYX0H2271672;
	Thu, 13 Nov 2025 16:29:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=In8w7e+rcqS+txQGnF0swTZyX1y/hUlgrK7T7ETWac0=; b=
	C0R78FCwPm2FIEPFKP5Wsa+LnOO+On6r+H/gnYs0z+nO0CGZNhr089euLEU8Fcv3
	BJ0J4GeOaxzKy1KlznAiT3uk4R+dAXTONeNf0Mi+JiLcJFV5tiAJ4Et06vh9xVmv
	wFaKZ8hahY5F3/k6jwNSCOx85vOXbIFahTbPZr9MMDXgEC9AqiZq0UPrsp90l1qs
	HiaT4zQZx6Hm93ZeWoIeZh0DKAgw96WTEgy5wvPxgeIwYJGjHrti25CNaD7Txz7u
	/WTCy4iHAHY75ALsD7CRDT+wga5impE1JKTIRn4w/CNyW47IFEqOPUcUAmj1eJ3R
	bR8TbtbgwA1+SiANb8XsUg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4adr8drbqh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Nov 2025 16:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1763080192; bh=In8w7e+rcqS+txQGnF0swTZyX1y/hUlgrK7T7ETWac0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=kyAxKxWevN4KTPLoSK1dsQthtL5U/JscjIH7dBz1QiyncQXCBaZO8BHaqFTU2fsOS
	 dZYSIfvleDAdqApSlivYWWtPOTqEgASEPJrsKyJeS33x04ht0Wy+gFY2mdyaRfHi6T
	 Y+4iC597ViWX7qMT5NsQ8oAQFSPXKirvQqZmgyvtSDOAy9qbW3jQFktdObsjoz3Su5
	 c6vZM6NbOYNZo5+muzxBr7Vrlng3oqJssjTx6qDxXh9T/ZHeD3sqOf472eXiKZ6N8E
	 +BefhpLKx+qKbUqs6mznYb/nzDG9HH7qglRod7F/d6h/3jZvrLnsrvGlQ+EHVoXX2v
	 Db1e9BmTASZcw==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EBB7E40918;
	Fri, 14 Nov 2025 00:29:51 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id D0475A006F;
	Fri, 14 Nov 2025 00:29:51 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=rt19SErP;
	dkim-atps=neutral
Received: from SN1PR07CU001.outbound.protection.outlook.com (mail-sn1pr07cu00100.outbound.protection.outlook.com [40.93.14.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5636E40054;
	Fri, 14 Nov 2025 00:29:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DN0UAGVNySb5wbZsr2glWlVwWdQ5xKbuT2AU8eYj/+WAlyXK7ztuQ9Myv8yBLACppChMnojQJbbuJsXcmB6dBU8lQyXUv+SB0tHrga1Y3YE3iA0d24E5ImAUm8n9yDDTli4x4Ba88xMG5EMCBrJtm1E4n4xABMeVWWGE0lKOscFHTyz9aKk5IUKKW0AJK1WtJMZmk9CsBApaIwR03Jz7en4HbCQcNqW1IEdh5smIS/ZuAL3ME1c0baNeCOyZFlEneIxX+1CkoDia547AUwxpZN8tObshH/XpF4hyoRBg/fkLboD1AGPISQBLEo2qSmzfU/NrVqVVfbiCkj4U4hXA3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=In8w7e+rcqS+txQGnF0swTZyX1y/hUlgrK7T7ETWac0=;
 b=VhC+BdhqpJnH6/SC7mT9qObE38NytTiEgAsTa/RlDes5iYiuDsQz5sQGeatLDaOxfLJq8K+H7YtS6wx0kA8IwPxgnG92bx1vOBasXqdgRMaGaNGhZvs8HurqegS51eaUv1agnVXE0S9RDyq/F3XHByrW44Va+BuQ6Z+wRHsUpksenvlXqC6dKya50vNK8JetDgQTLky4fc66hJuEshzeQdtCdVVici41/8liDdgSuljcMTuDdU2l9oU/g23JcP6AGXrjkZXxhUPO+F+1i+FV/W47A7dntbJbMZmI8ZD/zX8NOsRdLC/kcYyrw1jQEiUPE+2jZ3EuHrp7TaUPFrBXyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=In8w7e+rcqS+txQGnF0swTZyX1y/hUlgrK7T7ETWac0=;
 b=rt19SErPmqofG9465Cp+o4RgISPLGKtbdkPmPDAZrlSil8EowgmkPqs4Bv/ms6JDxHS4FJNX9PifJ7XcAwb7CEeCMlHg7Fzb35B3ARxVkhtu0hYuu+iPZW6/j5JNLakpFZ8n6Pcu/Q+BvN1MkBcKQ8INX3i87OeB2kLsy9xpCWg=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ2PR12MB8012.namprd12.prod.outlook.com (2603:10b6:a03:4c7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 00:29:47 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 00:29:47 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Manish Nagar <manish.nagar@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: Fix race condition between concurrent
 dwc3_remove_requests() call paths
Thread-Topic: [PATCH] usb: dwc3: Fix race condition between concurrent
 dwc3_remove_requests() call paths
Thread-Index: AQHcR+G5zez0RKsXjU2awYETywqYDrTZzPwAgBZT3wCAAUrvAA==
Date: Fri, 14 Nov 2025 00:29:47 +0000
Message-ID: <20251114002946.427ab4xdq7qhbi2k@synopsys.com>
References: <20251028080553.618304-1-manish.nagar@oss.qualcomm.com>
 <20251029234724.pg2icfi3a63ojsxn@synopsys.com>
 <CADGrZwXmnKn68v_cR3o+MiLPAyo+ujtgbx50sK=+4rOfgcoyBA@mail.gmail.com>
In-Reply-To:
 <CADGrZwXmnKn68v_cR3o+MiLPAyo+ujtgbx50sK=+4rOfgcoyBA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ2PR12MB8012:EE_
x-ms-office365-filtering-correlation-id: 595b240c-e080-48cb-d2b3-08de2314ea82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?TmJSanNCa2FiS0tBcTk0Y2hXMGJIQUNxdGZ4cVZYRGszdjBiSmwxZDNSVVcv?=
 =?utf-8?B?dmpuUHYzOWxROE1sM1VhVnk0SUx1MU5uc3hqdGNKT1FjOHM5OEMyWkFjQ0g1?=
 =?utf-8?B?bUk4Y1BVc3BXamhCM3JONHZUSmhFbUUyanRtSVhYMGxPQUZDK3JHVFdMekFL?=
 =?utf-8?B?VUVlM3UrZUZIVXQxVjBrL2U5eDEvd2h4M0x1SWlGaTJESWtWQjJ4K3VBMUt6?=
 =?utf-8?B?NzdCY0FQdUVKTjdPekRFOWEweVYzWkJ3aVc5SytWQjRqVno2NE1PMU1KTnNL?=
 =?utf-8?B?NCswanlQYVB2bEc0b2xpWk9qU0syOXZQNHhoKzVoUzJBdHp3OXZnR0xBWVBV?=
 =?utf-8?B?c0VGNzlVb001c1FYL2w2c1RhYjVQVWk5cm16NnpTUm5PUmRoMGpSdHpUWTJx?=
 =?utf-8?B?MU16TkxrREx2T2QvZjE5ZUxLNHZ2cFFkTHpTTEw2ZXpWaDU3Nk1NZE13UStR?=
 =?utf-8?B?VHl4TWZvRHlNRGtaQVU0dUExSDdZaGdBa2x2c1JwdlpPWmJNYzVUdWZPRGFR?=
 =?utf-8?B?dUpZN25WUk5neS9QK091Q2dBV0JJbEUxb1VUQlM1bzA4SjlOei92YmdKbWM4?=
 =?utf-8?B?eUcxc2FsczZadkNraTJxZ0xGbmYzRFNVdVdmcERVMHVnRHk5S1NOdmJoaXFR?=
 =?utf-8?B?d2JEM1ZqQ0Y0STVIaDhiM3o3RCs2a043Q1lRTGkrQjNta1NtMHhIanhZKzFx?=
 =?utf-8?B?WHNUN1hRR253dmwzbnpGTFVtNnB2RGh1aXE3S1VmeER1L3JIYnRsRTdvcXVm?=
 =?utf-8?B?UmhTOHlQRUhnV3BhbDA3aElDYkZmbnRFN3JOaEtrKzcwYXE0d0R0d21CSjlj?=
 =?utf-8?B?bHEyc0NpcFA4RDZHMHc3QTJNcGhYa3lOVUx1YVAxay9kMm1nZ3VldjFkUzB0?=
 =?utf-8?B?TUpmYWVXcU5QWmJnVUtUcGVlWjRLOGxmSnBJQVNFcmtNSncvVDI4L3h2TC9B?=
 =?utf-8?B?eXh1NW9lUHF6aUI5bTVlVGhBNkNvczNSMFIvbndMemxXVkZXdGM1SjFpaVpj?=
 =?utf-8?B?VEZNYnJjbldjMk9EeEYwcktvTDBYd1gwZ09jVWdYdEp1blNTV3luUWRUcEho?=
 =?utf-8?B?VDlhd0VJVTA4WjYzaXlFd04zMTBwSW11cHBndk9KVEw5NDFjQzR2MTMwUUdj?=
 =?utf-8?B?NURKSVJ6dDQvbkNiSlhpMFRhSlk4UmJlT0cxRFF0ckY3V2NNdGJHWVM1TWpX?=
 =?utf-8?B?ekhsMStBRFFSSTNhSy8xcys5bFlwazFHUjg2eW1hWVJRUzQ1RHY0VWZJb2VX?=
 =?utf-8?B?UDIxUE9mc2dDOW9hNmlSZEpOVzJ6ZVczZlpDbCsyVzJkdndlZmxCUEJJNWp6?=
 =?utf-8?B?c3NXTjl6Vm5ScVhSdEgrYm9BQW4reCtxUWhPU0ZKWlpub2Z4K2VMZzU4dlFD?=
 =?utf-8?B?ZG9CT2ZONVphVTBYSTRnVU5sdXliWjBDOU9sL254QWx0M3g2Q1l5R0Jqc3kx?=
 =?utf-8?B?ZjliQllaNFdZM2hwY1ZEWUI0cjBGNm5TZE40U3gybkF6Y3I2UHpVblNFVTBm?=
 =?utf-8?B?WnN4Tk9GYm1oZHNiQlU1bDVadDFPdmt5ajhSZGhvL0NoVWJqeUZoRElYMnVF?=
 =?utf-8?B?NFNmYUhEdmY4Z0ZqaW5kZjJxbTRKMHU3REs1UlE4QW84RVhIcWtGN2V6RkJK?=
 =?utf-8?B?NVNwR0l2eU0wMWpoTGVWUWxIdFBNQ2NwV1BmTkh3SElTaUhLWGxEa0tYSE5t?=
 =?utf-8?B?VTBuMm1tRGdrbGpJQWF1MG5kdzQ1U2hLVldSd29BM0paUFVOVjVoYXpoc3Vp?=
 =?utf-8?B?MDdOajJWaSt4MnlSK1c1clJoZGNyWlJRUXJoeEdpdERrbGVPWWdkcUFWM3h3?=
 =?utf-8?B?NXBWay8rMThiTndScHhYNmI1V3lBczdCUjNHNVNKQVp1ZmlXdThSNHZNYURD?=
 =?utf-8?B?Yk1qaTN4OHMwK0gxNzFoTmd1RkVhSS83YXpwOUZ1ZVUvNjZySkJzNnNkMHZj?=
 =?utf-8?B?TDFqb1VRVEVOVHM1dmVNZGtuZkl5amh4a2M4cDFlTEJjRWJtYmdoVFQrMnUr?=
 =?utf-8?B?VXEvMjJtL0VFR004N0xQR3FjQjRVTW9RMFl3WjMzVGNSb2N1aWovZUp5NDdG?=
 =?utf-8?Q?uKl0h6?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eTEyUWJ4Z1I0YzFCcUJabWRVRGkvWkIra1hjbXdZYkZTY25FT3J5SGp5bXZZ?=
 =?utf-8?B?MkVlb0hLc1BnWGM3OUhmVkJoRXFSK2JFN212UVVVNGJSNTRsbzEzZWtnOHVL?=
 =?utf-8?B?SDMxcys2VUZod2xxMlU2Q0NCVG9JekRTb0thMUQ0ZG1WWHNUTkFDRHVFYUk2?=
 =?utf-8?B?NDVZOGxxN05VYmEzZ3UzQjNmZVorSGNnd1dBUXdRRDFyMVRRYnl2MnV3QWl4?=
 =?utf-8?B?SnRRVmFyTFpvZFZZa3Jad0Y4NEJiaUxVYTcyQ21EZ21EOXJBai95NG05Ykl6?=
 =?utf-8?B?aHVDaDB3RTVZYy9Wdm5nL043dmVvZ0grUzJ0cEQ0RjRHWWllSkY0bm1qYVNk?=
 =?utf-8?B?MW55TDk1Q1hSTnMvbGlMbDJBeW04SUNuQytqUEhkc0c2em1WaHdnWDZ5SjJS?=
 =?utf-8?B?VUxFZlZCcTZnWXFidzR0UEIzcU15ejI3U2xwbXYzN3QxY1NScWxqRjEvZkdE?=
 =?utf-8?B?eGVhaElLc0RRL3pzT0xiMWRydENKeldkMEJ4bzNGMEFXU2lDdnlyRlgramtQ?=
 =?utf-8?B?MklhUUZCZmIxK0hSTDl1TjF3bTZ4TXpCMFQ2aWQyeXAraHUrNHpyZmd5bnZ3?=
 =?utf-8?B?cDRCNHJ3OHBhN0FNVEpEbERsQnA5S0Jxb3hMQTdROHpXeWJ6S1h3UCs4Nmdu?=
 =?utf-8?B?R3pDc1psRzJoOVl0Zi9MZEpOM3lPc3NYNGJwSXVpclFuMWMrQUFwVDZERy9M?=
 =?utf-8?B?VnJhN2Jqck01dmM3aWJqakgzbWZCajR4c0xQWnd4WHdrampRTElVWlRiLzF2?=
 =?utf-8?B?K2hBV0hUR3ErZWRUdmd0S3Y4a1U1RDZMYWJIYVNRRzNUZTlaTWxxVHJ6a0lI?=
 =?utf-8?B?ckdxK3VoT3l4eFgralNuZlMxdFlEVGcxZGh5cHdEc1dMbWlDYVY0aE0yS09j?=
 =?utf-8?B?K0hHdDdudlpVSGFDa3RjY2tHVHQ1ODVaajc2d1VoL0tYTUNiZXB3aWpzMmhQ?=
 =?utf-8?B?NFZOWXpRU3hBZnYyWnNNV1FRaGNpWlo0R3ZTcER2alZTVmIwYWdmcXEydEF1?=
 =?utf-8?B?K0lzeFYvN3l4SXpOVFdJM3NjWkNpeUZWcEZVNnVaOVRVNy9CeGJnWno1cmVO?=
 =?utf-8?B?T2xFbVlwb2UrdnJUSXFNZ2dFR2QwdzhyTjd2V09iTjZRTmNlMlNBYUh6Y0RU?=
 =?utf-8?B?VHUzdXhWMXNZWmVwby9QWFVldjc4V0dWOE4vNFpnb24vN0dhRUNleVRMMnJ1?=
 =?utf-8?B?TnZQcFIvRHFwSVd1NElzclIyVHZvTFlvdHR1RXBNWjExL2J0N1lLaGpubnJs?=
 =?utf-8?B?YklidEw0amw5U2JNOVVleDh4cDQ1T3JaQTBmVEV4SC9EbG5WTVN3ZkVoc3J3?=
 =?utf-8?B?dy9DY1pNMEoreUpSeUt5UnlXdXFIcjQ5Nm9pVEZhZm9SenVBMExIdmhFMFBi?=
 =?utf-8?B?ZjFRYmw1cVZ5azhDYjhCTDk3REliYklPTFFpakg2ZUprTWFtcDdvUXJhZ0ln?=
 =?utf-8?B?V1pYTzgrRThWTSs4N0E5V2hRejRLcnVNYkdxUnI2S3VpeC8rNGNLSDN2bnJy?=
 =?utf-8?B?ZnFteVU2NkJIZXZaMWtsT0NTczc2RXJUeFgxdTNyVDJZR3N4MlJUY3h4cU8w?=
 =?utf-8?B?ZklhaUcxOERBMEtGTkVOMTd6RjNQK1o1cEMvM0c1aCtzbnJXZDF1OVRrVHVF?=
 =?utf-8?B?RkVBRjd2YUczZklDTlVhQWRqYXZoV2t2NzRDM0gyMnJjUjJUUngzb1pRNTNN?=
 =?utf-8?B?Q1hpRmdkZERUM1Y0MTFNUFZIenJ6M1hIeHZ0SFFIUjJuVFpUWVphUmRYLzRv?=
 =?utf-8?B?TWphcmhJNVhDU3pDZEMrckgzQ1FqUFlLRzRDeTFpOWY2V1lWYjR0WmU0V3lK?=
 =?utf-8?B?RTcrTEo1RVFNNWRHZW81Wm5zNWRxRnpzY0lBTDRCcDZYWGFvc0ZvUGdSM2Nn?=
 =?utf-8?B?bU9CYWFTYW5tNEh3OXU2Y0U3TGRnTEhCMlJ1bHZ6b0hPamI2bWdBWVdPS1ND?=
 =?utf-8?B?L2JjYTk0YXdGUTNuWUxIUC9HMVljNHpJLzZvY280QVJpcTVGTy92MmVtdGkx?=
 =?utf-8?B?OTZtWGlZUmlhSXBjTXNDc1BiTzFvc3RCbTU2Y3kxZm41RlF6dndKUDVMNzBU?=
 =?utf-8?B?L3E3N2VORVVlemtqa3ZrVi8rWGs3UUVzeEhDNy8yNFhwdndsdmRMNm9ralRK?=
 =?utf-8?B?YzBJQnNKaWFtaWxGMGR4V0NETVc3ZVJHQlM2M2pYay9obFQ2dW9rYVNQUVJE?=
 =?utf-8?B?RUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <090D7F6E1B21A640B47097ADB9774474@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PKw6a5xEMVJ1PU/SqXAtJAJEEHE6cDz0qSvLLAvkHoAZ8ev1UeOl0b4Prb9VH8d0Px789618id3HCjG0pjrN48dDpCxVoextiswX3fNiPzdcN62xutwia/74zZ57lPIzFTDoTnPOUrsD2LgF3tdbKNYm7EhyeS5fKrSZeq13b28RzwJal5dgTFKSmJwLMRM/IzjKsk2xAPE/PYJVOoj2nUPXhMNY95BB4Xe6S9/i8oDEyZ39vudpvptGhOnZfYaSfyWqE6SkBLsSe2Pt1gEGI9eN6Snc61KLpaXmMF1fxLZV1txJrTjkB8xbcZrNV3gzrNQOgOfuaqCIfez7x0VfBvfq2YwmaTUO/gNgRtIrutKCIYVwq8hC7BydBOiPCz/CEw9dAjowkWLQD7hz9iegRlJoYuj95eUTXYYIp7mOYCT1fJ/Y9Y5SvW+SP23/hp4jnB3sntEff6QcWIH/CTq0nJlZ46FCxIoUg92wxNPqyY66vRPBoGNKYWVtVX1trrD/moUhXoM0xtRvotSaXUJmf9NW0+gaPX1Nz7TcDRVwodtuUfF/zk8gmOn/XzzSN382/N6y03zi4X+XVVQF2l1MjAzfie1U0idRwUmEVzbQ35/7/O1aTlsNU/lEs3KrFKsJCl6cVluNTwvHiIjXECUrDQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 595b240c-e080-48cb-d2b3-08de2314ea82
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 00:29:47.3787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7NI/qTFCDjT16o8RZJ+na0DQd8c5Mdxo8Ytpz5wtiyvf34EEc89/r2JDBIn59AvxvXBwYap1LQ97X4rGBoiLiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8012
X-Authority-Analysis: v=2.4 cv=OrpCCi/t c=1 sm=1 tr=0 ts=69167800 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=XMm1h6emDis4LsH66K0A:9 a=QEXdDO2ut3YA:10
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAwMiBTYWx0ZWRfXwzjzAFNvVz2L
 IFjZxeptnafTJmUpRn6hzRPin7uYe9R3nSlKcVI59me+o3zfN4s8TyV+UBNBmp5EAIw5byDXyKm
 XGOG8BbZCDVZ7f49/H7Xhn73zqYJ6aQIHjTgjgKv3M4oujCecgX+bv6/wSJBoJsVV5PdeeS3+K9
 dIZrCvL9tMp45n89w/90Rv8NA33qF1mZ+CcdELI2r9dQnYpgfUN3KiAVExu3G9fq2SktByFJ1dx
 waOzPNKYSkYbibwYMUh6emZzAYZ8wH+9NOgecDeBz8pE27sr8HXSULKpjp6TZyITS0IqV32JqB2
 kMFBV/BUOyd/32ZUvS0qUayIYTjxWTN8vrJ9uc8YRkEYQYSpZSrEwCfsEhgTkvO0CZGQddHRiND
 3qhNeUVdPAxfKyKk/3KeT7JqV1WuqQ==
X-Proofpoint-GUID: P1GGoseZGwuvnZt0JQC0L32nuO5IPfQs
X-Proofpoint-ORIG-GUID: P1GGoseZGwuvnZt0JQC0L32nuO5IPfQs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2511140002

T24gVGh1LCBOb3YgMTMsIDIwMjUsIE1hbmlzaCBOYWdhciB3cm90ZToNCj4gSGkgLA0KPiANCj4g
VGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbiAsDQo+IA0KPiBPbiBhYm92ZSB5b3VyIHN1Z2dlc3Rp
b24sIEkgYWRkZWQgYSBjaGVjayBmb3IgIGRlcC0+bnVtYmVyIGFzIA0KPiANCj4gaWYgKChyZXEt
PnN0YXR1cyA9PSBEV0MzX1JFUVVFU1RfU1RBVFVTX0NPTVBMRVRFRCkgJiYgKGRlcC0+bnVtYmVy
ID4gMSkpDQo+IHJldHVybjsNCj4gDQo+IEkgaW5jbHVkZWQgdGhpcyBjb25kaXRpb24gdG8gcHJl
dmVudCBlbnVtZXJhdGlvbiBmYWlsdXJlcy4gRHVyaW5nIHRoZSBzZXF1ZW5jZQ0KPiBkd2MzX2dh
ZGdldF9naXZlYmFjayDihpIgZHdjM19lcDBfaW50ZXJydXB0IOKGkiBkd2MzX3RocmVhZF9pbnRl
cnJ1cHQsIHRoZSBnaXZlYmFjaw0KPiBmb3IgZXAwIGRvZXMgbm90IGNvbXBsZXRlLCBzbyB0aGlz
IGNoZWNrIGVuc3VyZXMgcHJvcGVyIGhhbmRsaW5nLg0KPiANCj4gUGxlYXNlIHNoYXJlIHlvdXIg
ZmVlZGJhY2ssIGFuZCBJIHdpbGwgcHJvY2VlZCB3aXRoIHYyIGFjY29yZGluZ2x5Lg0KPiANCg0K
Tm8sIGFkZCBjaGVja3MgZm9yIGVwMCB0b28uDQoNClRyeSB0aGlzOg0KDQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy91c2IvZHdjMy9lcDAuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZXAwLmMNCmluZGV4IGI0
MjI5YWExM2YzNy4uZTBiYWQ1NzA4NjY0IDEwMDY0NA0KLS0tIGEvZHJpdmVycy91c2IvZHdjMy9l
cDAuYw0KKysrIGIvZHJpdmVycy91c2IvZHdjMy9lcDAuYw0KQEAgLTk0LDYgKzk0LDcgQEAgc3Rh
dGljIGludCBfX2R3YzNfZ2FkZ2V0X2VwMF9xdWV1ZShzdHJ1Y3QgZHdjM19lcCAqZGVwLA0KIAly
ZXEtPnJlcXVlc3QuYWN0dWFsCT0gMDsNCiAJcmVxLT5yZXF1ZXN0LnN0YXR1cwk9IC1FSU5QUk9H
UkVTUzsNCiAJcmVxLT5lcG51bQkJPSBkZXAtPm51bWJlcjsNCisJcmVxLT5zdGF0dXMJCT0gRFdD
M19SRVFVRVNUX1NUQVRVU19RVUVVRUQ7DQogDQogCWxpc3RfYWRkX3RhaWwoJnJlcS0+bGlzdCwg
JmRlcC0+cGVuZGluZ19saXN0KTsNCiANCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2dh
ZGdldC5jIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KaW5kZXggMWY2N2ZiNmFlYWQ1Li5h
MWQyZmY5MjU0YjQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQorKysg
Yi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQpAQCAtMjI4LDYgKzIyOCwxMyBAQCB2b2lkIGR3
YzNfZ2FkZ2V0X2dpdmViYWNrKHN0cnVjdCBkd2MzX2VwICpkZXAsIHN0cnVjdCBkd2MzX3JlcXVl
c3QgKnJlcSwNCiB7DQogCXN0cnVjdCBkd2MzCQkJKmR3YyA9IGRlcC0+ZHdjOw0KIA0KKwkvKg0K
KwkgKiBUaGUgcmVxdWVzdCBtaWdodCBoYXZlIGJlZW4gcHJvY2Vzc2VkIGFuZCBjb21wbGV0ZWQg
d2hpbGUgdGhlDQorCSAqIHNwaW5sb2NrIHdhcyByZWxlYXNlZC4gU2tpcCBwcm9jZXNzaW5nIGlm
IGFscmVhZHkgY29tcGxldGVkLg0KKwkgKi8NCisJaWYgKHJlcS0+c3RhdHVzID09IERXQzNfUkVR
VUVTVF9TVEFUVVNfQ09NUExFVEVEKQ0KKwkJcmV0dXJuOw0KKw0KIAlkd2MzX2dhZGdldF9kZWxf
YW5kX3VubWFwX3JlcXVlc3QoZGVwLCByZXEsIHN0YXR1cyk7DQogCXJlcS0+c3RhdHVzID0gRFdD
M19SRVFVRVNUX1NUQVRVU19DT01QTEVURUQ7DQogDQotLS0NCg0KQlIsDQpUaGluaA==

