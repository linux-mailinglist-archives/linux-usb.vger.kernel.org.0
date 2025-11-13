Return-Path: <linux-usb+bounces-30502-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B4BC5A7A0
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 00:09:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB46C3B267D
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 23:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2652EA174;
	Thu, 13 Nov 2025 23:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="I2Sr0fBA";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cTdIAd7e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hHfBk7in"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F49E2D73B4;
	Thu, 13 Nov 2025 23:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763075206; cv=fail; b=L1ziKB3eKOUjDBO6BYDMmhXUaTixhQmb+A6SrjhIs45PEsqB0nOfMl8BX+Hyg/cocjrmIvV/5rLrDyT7321NR6eFnCByfiPkR8RJKA4oV1bBtqwOwA7ddJuqxlayiPcV2H57fGxk+hTAl3WAkSxQ7D+TQmU2ZeWlLvUrs4Wdvsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763075206; c=relaxed/simple;
	bh=CNrsKVQPSwLgThmUAddk/W7kpYYGuV/hJFUsWnQwih0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RZsaC+LUAJ0rolQlVDdeBeSbh3O0Hr2qvP9Ephrs++JlhVAfPSyEPnLFqreY8T2tiv68LhD7eb1E/HUWbsFfQzBNfmbwpVgZqOibta5DUYgyxTY9yPOob33MXFpLm037Cu6LMg+Vm8XzRTFNIHkpdz1Y/cgnMi89GYU9Bd8WBk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=I2Sr0fBA; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cTdIAd7e; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=hHfBk7in reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMYsDG2329410;
	Thu, 13 Nov 2025 15:05:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=CNrsKVQPSwLgThmUAddk/W7kpYYGuV/hJFUsWnQwih0=; b=
	I2Sr0fBAh8mfxu8TQR64BChJqHEhzD8UCfQOLweHPAhKOJozfNSAbPhuSkKMqC1d
	pJZgIB7bEf4+6ka1Z5HVSfqsPcPcJXqjFXXiwRMO9MW+yPn5p5dfJG1ZfSSH6/7U
	LFww7GwjCtUF3ztuRtaJ3RRl3XBesn0cvIDymor4mBQGZ1pYkCug2fR2IcBLk3Hr
	2V1oidlkB7R9pLJGc2558S6ytkEqrg03pSWz4lH0K86h3L9thbNM8o0End7Be76V
	UQyUcdb1ZuqYM9qt9BlnJXtwPndsNrLQq3eWCeI8FcKKVthH4CxQtNSi/m2JZQHS
	c4bAxV4tM95axXI4n8F/sg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4adr8e83d2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Nov 2025 15:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1763075155; bh=CNrsKVQPSwLgThmUAddk/W7kpYYGuV/hJFUsWnQwih0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=cTdIAd7eREp4iwin417RawRbq6cPHnymaXaB4j1jLxqYeu4hXXuqBjubaMhClpCzS
	 Yps9uIeCsliyoptmwIsV3pkrI9+DPfuZS41MghwpIGFy4itlkhj52kzxIzwIIUJVHC
	 gI81r0PFxsRUdT/w550FzsZG0O7VR0DslgkWnm6zLcICH/TJEdwE22yKizrLZbVfZJ
	 VK/gUvmf1Y2Ds2bYmJXD/YkvcWclX53lc1SNfxjQRL75NagiVUnUOXOv9Bw3PZKzF0
	 8U4pZ06ViOBvdgPkYEFKUmxqsWKvzRLIJbXOAzWem4JqTnVudWEv2ARqES62HAebCk
	 bcaVsMJs/VfDw==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5938140918;
	Thu, 13 Nov 2025 23:05:55 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id C6592A006F;
	Thu, 13 Nov 2025 23:05:54 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=hHfBk7in;
	dkim-atps=neutral
Received: from SN1PR07CU001.outbound.protection.outlook.com (mail-sn1pr07cu00103.outbound.protection.outlook.com [40.93.14.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 752F440522;
	Thu, 13 Nov 2025 23:05:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nY8Y3qllIu9yaeWjWLPZ/O0za/2Ym8o1ZlTBhakYxyV67wpB9bvRRr6ZQ9coAnfimv7e2lx7UDEpGHeEd0lyswTM9A049TmdVaLBy8espuIRpQR3XHvxKIVDpEpItzz1RsSQA+1Tvlb7fVyPBDOXJEKRN3chu9ypFlljt+zVUXbvu8C/VMOw/oLulTuQ8/8vXCmavgD0chrxshEKcKntXS0p9G3bQm/GnudtB98fQkZ2QW8IlGKAdiIrr4cc2vEh0+jwQgk2J+I+xlvDkbVHeVYZ2TGHy3womIKV6UC4cayYOUVyQJNsOiA8dUJxnM62dbE26Esq/svKiW6G1qiemA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNrsKVQPSwLgThmUAddk/W7kpYYGuV/hJFUsWnQwih0=;
 b=JhBLunOxNNoF1DL/sGoNRoHJ5sNmjyUNe8HUzqfPHg+UKeZDVQtSNy5Q+Q8bnHF/Js3O5kcsLNrr8wn8tznMS6pcmqSp5QTyHrCId/P7vY1yjjZ1NdFCt+kDdwzvBUIgu3TD36RpnAMUDs+M3h6qrohpzn2UY3r5xPOSbmdTR3ekJ1Lkosw7Ifp/xZZPbvHT+Kmp+X8fTQxfPCF4eKzoLtS24n981GwtM6K/k77oDH1N8DpNmru4lpBaSV81SH8ks7nj2LDXjCuSWXJ8RXhz+Jjg9nyx8aAdsD8e2QpbTVlEsGUIZKcRvsl7j8uZ8VKcHKbQvitBEoZ8WmHSghzT+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNrsKVQPSwLgThmUAddk/W7kpYYGuV/hJFUsWnQwih0=;
 b=hHfBk7inOdd97qAaxgIWfaDENQfTWOoYgs3Ln3OnNnAhxpVcZbzzO/sAs7O4EAraf8thESMM9ZNnQb9O6w13QlY+OPDFtF1Pk7+0DxgSPvNYllkSfzJlQU0ZPlek2WdK24i4V0lRedCmyuD9d7no3yk9zRv2DTgfVbz+M26tGIk=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA3PR12MB7903.namprd12.prod.outlook.com (2603:10b6:806:307::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 23:05:43 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 23:05:43 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Xu Yang <xu.yang_2@nxp.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "jun.li@nxp.com" <jun.li@nxp.com>
Subject: Re: [PATCH 2/2] usb: dwc3: imx8mp: disable auto suspend for host role
Thread-Topic: [PATCH 2/2] usb: dwc3: imx8mp: disable auto suspend for host
 role
Thread-Index: AQHcTigLFJc1f1uJi02/Qj90wUqLQbTxR8CA
Date: Thu, 13 Nov 2025 23:05:43 +0000
Message-ID: <20251113230541.wbzt6xbine5gdmpp@synopsys.com>
References: <20251105074504.1427926-1-xu.yang_2@nxp.com>
 <20251105074504.1427926-2-xu.yang_2@nxp.com>
In-Reply-To: <20251105074504.1427926-2-xu.yang_2@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA3PR12MB7903:EE_
x-ms-office365-filtering-correlation-id: 0d5c166b-f3c3-47b6-3f34-08de23092be7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Ui9FUDhSTWRBekhMT3NxbGFPYVVwR1BoczVlcWhXUzlvY0VmdGtTV2ZsRVc2?=
 =?utf-8?B?ejd6OW9mdjdBRmFES1NOTzhiRXFObGd2UGZPQ2l5Lzl5Z1IwT1E4cm5pNHE5?=
 =?utf-8?B?dmUxYTJoMU9lWUY5cFN5ZmttbG1wVDVtOXhocUJxWnJSM0xEZGFKdXZJblJx?=
 =?utf-8?B?Yk1DcE1LMVVXWEVVbVNrYzBNSkdMTjNEQzVRWFJreCtQVkRZY1RCUlEyZlUw?=
 =?utf-8?B?cU5ROXIwRUlpWmhLaEFIbzU3UU4wYTBYVWJNNm4wQkpObDF1d1MzKzNTVFhh?=
 =?utf-8?B?VGkwZEpqWlJteVdBWEtsaG03d3EzR1JpdzhJRDFWSGNENkh1Z3F4SXBOQTJC?=
 =?utf-8?B?ZExxM2xsREorcXFQdHFOYmJNQVhYNWJRK2tQVDNLTUoxTCtUMmxIYzc2bnNx?=
 =?utf-8?B?Smk1VEsrZ3hybWwwdnlWMWMxcG8yZ2k2NVhyNXFnRHQ3YTZlclNwQmRlSHBl?=
 =?utf-8?B?UC9UYzZNRjJ1Mk1GNk5reisrL3hVeTRTQmx2MmtEcy9BQUtjQnNzNEhoWitC?=
 =?utf-8?B?VTJ1SlNXd3JzMG9NU2Q1ZWZIamRiWTZ5eW1RSllTb1Vscmk2QnhROHp2WGxR?=
 =?utf-8?B?SXp0QzVrM1FPZEc1WEFKVkRuTXVsak5YbDhyOHhlaVVxQ2JkUjIzZXlHSjRu?=
 =?utf-8?B?SkZ1N0xCbng4T2duWkVtRlNlNHlQbU5KQmlwUStOeHZycjR3UXI0WjZQSytQ?=
 =?utf-8?B?ak9tTzVWRTJwYk95Tmt0QytyWEw0dnlaWVFSTkw2S0ZOQVFIL1ZoR0sydzFJ?=
 =?utf-8?B?Q1VZL2c4UzFUWkhnS1Y5c0JZMVVZNzM0MzFhQSszL2t3MjVzbHJ6bW9rZmlC?=
 =?utf-8?B?QjRjaitRRHVXUk5rR1lFUUI3VVpJZ05JL29rVFU4MzE4THIwU3FrdEhZb0JP?=
 =?utf-8?B?ck5VUzlZaVpwOFlTWjhkV3IyRjRXWVgxUXNtZjZmQitrNkxzZGZ2OC9zYzgx?=
 =?utf-8?B?U0hmT2p0RjBzWTdwWDZLMS92aXNRRENXbkphOHF0aEpkekdIdmpBTmhrZXJT?=
 =?utf-8?B?SHE2TmtxOUQxUVRWcmdZTHlqTHVyVmtrUWRZdWh3RjNCTU95QnBNNTJldWhX?=
 =?utf-8?B?WnBvT282SjYyVlZHVmpFSG03Nncyam52VnBCcjRiZkMwTFUwaVo4T3JzdXVq?=
 =?utf-8?B?a1h3V2hFZy9wYVJTNjdML0taVVRMUFVISnNaRkZwaXM1YVFsUzhJN21idTY5?=
 =?utf-8?B?eXJCY3RiSnYwZWdzaGtRdGNURzBuMnkzRXJINVRSMUdVOEpqMVVSTkRkMHJD?=
 =?utf-8?B?Rk1oNmFBNUo1Z0RkSFNBNXZVTmN3T2V6cDgvSzNVRGZYaUgzOGs0a2hVckh1?=
 =?utf-8?B?S1grWkN3c29SczcvWHY4SWxhL1hWL1M1N3QrTW8wTldNSGN0Mm11dTZubW1M?=
 =?utf-8?B?K2xiS1o0eWRKZjNLOEw5b0NpbHRUaTRyS205SklPTFB1TlJTeFdST3FRMG9E?=
 =?utf-8?B?OHBITTM1Z3d3ZHoxUmg5dVBLSytCMTExSUxtMEdyclR5UEljRHpyeG1JMDRt?=
 =?utf-8?B?d3hPZnErc212WnFWazR1ZVZGcFpWZitQRXhkYzFqcVROSVM5cUVJQjNEdE0w?=
 =?utf-8?B?R1BlYkxVRWlVOWFyVXZ5NHBaVnkyaVRNemtkWVFXcnd0Nk5xNVFwWlV6Z0Vn?=
 =?utf-8?B?dytHY1RocDR2Q2VUeENyL05TcVdtU2EwcFF4UU1HdXl1bFdUVzdVTHNuK04r?=
 =?utf-8?B?aFVjem9vQXJMV1NxNkRSRGw1cDBqQUdBeVVDZDJkeEowSHVrZVR2WnJ2MHpO?=
 =?utf-8?B?WllhaVFYeXRCSW16akFEcS8yVjdxMCt2L2x6TUI3czhDZzQ2WDNKT0JWSnFP?=
 =?utf-8?B?eUhvMG56SUxPZUdJWFJ3RVhDbXRBTnJIL1h4ZXltOTBudjdMYUJVcGpiRnpP?=
 =?utf-8?B?cnhrckRQTEdTeFVlakMzTDkvOTNVU240ZGNBOGs3b05uNDU1NkxPdnFkYkdH?=
 =?utf-8?B?MkRTUGJVY0M0VUorNUdIcHZWV3JlRVhkVGxpTW9QbUlrK1JoNU56TFJraW95?=
 =?utf-8?B?dCtiS084aG4vZ01KeE1PeTdKZVpLQVI4dUY3cTlvZzQyM1gyajlkQ2dVdEFY?=
 =?utf-8?Q?YwXI4b?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?azNkVXIvUjRoSm1SVlhLbVdSck1hcWVCZlNKK3ZxeWhiVE1sbCtQaExKS1Er?=
 =?utf-8?B?VzJSVzJnOUsxOCtWejQzUUJWUnBUcjRqWUZicjB2TTJ1WHl3RXVwWWVmU0xT?=
 =?utf-8?B?bnRycUlOWWcxQWptcXRXNnl2NzhLNDhZSzlsQjA1UnEvWEZVNkovWmJXZDFU?=
 =?utf-8?B?M1RUckw5WG1MTm0vYjlHU2JHV21tSldueW8vaUNTZFlVNG9XNDFqcUFKUTJZ?=
 =?utf-8?B?KzVHT2xDRGVPNUVxQVdFUGhweDFnUGpGVmxWY3VJRVgyYXl4RmpQS0x2RzZo?=
 =?utf-8?B?b1ZlKzRDWnp6eEZ6NVkvdjBYcG0vOWZBbnRtSllUa3RSM2xmdGJ2cU1SMDMr?=
 =?utf-8?B?dFZGNTNtRWtJNFZhRm9SbkpMWXcwYkp1YU1iUHhhLzE4S1EvbThBNEw0K1lS?=
 =?utf-8?B?emh1dkp1aWhjQko3K2Irb0VUdjRSTEN4YjNacVdtYVVxcTZWaTZrNTVpYlJm?=
 =?utf-8?B?U3YrUzlmU012V0lBSlI4eTNpb29XMnNPVnR6SlNSQ000UGdLWU9ES0xKNzFP?=
 =?utf-8?B?Z2dNMEpEQUJ3ZVpORHljRTl0aFd3ODdieEVVUHNtVVRWWWRTMDJoUFJlaEVV?=
 =?utf-8?B?WHZOc3ZVejQ3a0xiUDNmWnRqdmhMWWpCREVGa0RtakxuVVZweUcrdGg0VHky?=
 =?utf-8?B?d2xYbXhYaDYzNzhlME9aWlM4Z01GdFY3ZENBejc4a1pSN1YwaW8zSGhEckxp?=
 =?utf-8?B?eFozSXFJM21aL0xsNm5aall3Nll5TUoxMTl4ZEJ0KzBMTVArbHBnRWt2NGVU?=
 =?utf-8?B?bXgrYXByZEtRRVBZVTRIekJHek0rZ2g2V2UyVVBRdVV5YzVhblVuaHBhTFBa?=
 =?utf-8?B?SlVPbWpLTnJyYllDRzJidU8wWG5uR0hTWnRndUdxbDB4c0hhaS9RYnBmRnFr?=
 =?utf-8?B?SjlnMk9uMkFPOEZqRWJWRndrTnE2QVVhczNQQ3A2RllEUWsrOHB6SzFWbHZG?=
 =?utf-8?B?cXpTMWFJaU4xWlJZSCtzSXppUU9QSVVZSjhqYldneWNrOG04ZkJKd0JNenFF?=
 =?utf-8?B?RkZIWStGWTdVTEx4MHB5enpIWVc5TExzRXY4RVA2N09CdWNsem1jZnFaYXN6?=
 =?utf-8?B?M3duOEhwSG1nU2NoaDVwalVzTkhWM3A5WVZhZFlOc2JiQlIyS0p3MnlBckpF?=
 =?utf-8?B?UC9nRjYrODhMQkJ2Z2kwNkU0bmpoNlhlVmc3NUZ1dkVleHpjRDQ4YTNMM1g4?=
 =?utf-8?B?NnJTK3lsQ3VrKzBVSGt5WENVRHVsbmp3ZEVhUHptWUtHUzlCWllBekxDb0tW?=
 =?utf-8?B?cmhRQ0JvNGZSdlhvUUJaNWd4azdTMGlhNno0TFVZb2J6MHV5azkyMkRlSDB1?=
 =?utf-8?B?Q0xkVGhpU0VxQXRLdEdCUGw3bjdGYm03VkU4aDllcEMxcEpoRys4dHc1bU9r?=
 =?utf-8?B?Ry9HbTlaeDFqUy9Ua0JyNCs3QlRxcUZkUGlqS1RZM1c5YTlaRnA2TWhYUEU1?=
 =?utf-8?B?SklQcGJwSVJCNUJ5OG1EMldKZjhwY2sxWGZTd0k4YnhRaENKcXNvNVZnM1l4?=
 =?utf-8?B?aVg0ZEZNcDd2b0o1SVpWVTlqM2pjT3p1NnpMZldGVGJiU3d0bmcyRlNOUHZz?=
 =?utf-8?B?aDZVN0dvRTFVNVhjRlZhdVNXVCtMSW1NbUUvTnkwYXhTamJFckJHckZ5QTBV?=
 =?utf-8?B?c2JxQXNoOHBvemRMTk1wRWhtaTVsR2lvMjlQQUhYdURBMFJOR2JhL1lEQi9V?=
 =?utf-8?B?dERySUgxMmNLSEpmTjV5aERzc2JNamRza1VCZDNjKzJDcmdMN3RqeDV0ZnlF?=
 =?utf-8?B?ekhqV1o3VVBRaEpodlN2a2xweko1RHBsM0VwanN4WEtRK3BKYzI1aDZnUDNE?=
 =?utf-8?B?blBGWFpJNTNjcHZlSmFZYnd0MkRlZnpKRVhCUDJyTGgvSFVxdHA2em1CMzJO?=
 =?utf-8?B?eGNEYXNQOVRyTU8ycFZmdHZQRzRIdUkwc05XRzNTTkdNQ2NlWHBxaURmeE12?=
 =?utf-8?B?ZEdpZVhoUGJ0OGZwdm1LTUF2NEVSTXZITnArc1dNamY3Tkx2aThDQjN1Qlhv?=
 =?utf-8?B?OXFXVGY1OFA1RnU4aWJpdDAvQTliZ1RiRmNZbEtpSldvRE1uNGhuS0lTYkVz?=
 =?utf-8?B?NTVpdzFXYXVmaE5CQkRmRnhWZGhRN09TWFY0OWkzMWZ0TXk3VHdwcGRGNjNW?=
 =?utf-8?Q?tRS+CaZ4gsx6Le0pGYVFGktrp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F367443DD172B94DA44D246838EF5075@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HZvE04FCCeH9VrcMKGAYyTlS2J5ZDVZPXIGsb+Pd1PKVbDJl8z3V+lxMnHJDAIYNTRzcsPzq++cVd/OT26k1wCKtdfqEk4KvBT922qJwk1T3aC0oBuxi8dmak8QPyJdqdGBHw6qqB6Kb+QjojxTgy3om+PQwgX1BqrTy6zCXF0LkzAMm4m7kc7m5XACZ3LoYHqYfWPuZEjKr9On7YewHhX2e1pwoTphujxN2xFUAGk9YtVhe3Oh7CdWl1BryY/bg9B3EkVNp8BevkaXLtRGOTLrJDfR1CZ3nf2U8vIjVp9z/pJiczQ7i5jwpoCU4ImHXcPR3R+yGkGvdqDJwPDXOoW88YCweIKX2GTvzW/g4TeK801EolcF/3UuqNwA4neSVh43DeVuXQxUn4xyXfe4wuOlGfOFVTYhmpM12jrXeu+JKDh8FKUmYuhbOSxzNIcJg3jMoV3q2be5Zx1UdhwHPU2quhaiJiDTh4Uj+R6Ox+bzMjdmLzj1x/B+/f5zMOr6xkZHFv0c1sbJ6H8/PtyY5R0/X32egPXkGfvAbJYKKJ02J06ZOQOGSLlRsli8aQoRy+glc+2wFg9bQa+V3GGYKzluOFbKUYIthPoRwDGYHK9GewCd6oxHRDezI1f8LZHaP8V451S4fnTVWCG3kCa+Kgg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d5c166b-f3c3-47b6-3f34-08de23092be7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 23:05:43.1350
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XpvrkkYUFbfHtcbrXuB0Y6HySo3LMT92bXgRo2kSiucajKdD8ORzdnGwPnEUbf1l9fWLiuWvobghKkAGnW70VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7903
X-Proofpoint-GUID: 7xCUC4CzscrRbcV0Ua1uGcz-jhrjTy_3
X-Authority-Analysis: v=2.4 cv=YoEChoYX c=1 sm=1 tr=0 ts=69166453 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=sZdw91-ZnYqtZg0vZakA:9
 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 7xCUC4CzscrRbcV0Ua1uGcz-jhrjTy_3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4MiBTYWx0ZWRfXw1CP5l6ualMI
 rvbZpUyU3gQK+5XtQ/gh49M6JRTZuUeLvok3owOM+eDJCz9P6H/AMLN8zVxdJ3wTHv+cSkQvJN4
 sdz260eq+k/l5GT52GlS/QxlIPjM//SDxCLd8wgU720EctKinEb43TxLOY2RB8uWAISlpMWhddw
 6vwuSa2yB0rmTzX+g0FTwea/Xv7grOosTpDRXEfhHYyCVVHEi/7iSwDFhhmEOVosk7jkAAy8oaZ
 2sU/UOqLgsjH6MrZJlJOaFu5ylBpUPJQZ4wjQ3qyL7Qv9s7rG6yYcgU1OlfVg9xiU2SLSy6lg5H
 6sm0oac0hClqnHCRuFqUcddVTNZpCxrhtq+CPWbtnQstNOkjHFaA4bSkEWnRw3W4DlR91ztZkF6
 9k2DsXdp3C2JZyTKYvYPYyfMsFkTvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2511130182

T24gV2VkLCBOb3YgMDUsIDIwMjUsIFh1IFlhbmcgd3JvdGU6DQo+IERvIGR3YzMgY29yZSBhdXRv
IHN1c3BlbmQgZW5hYmxlIGZvciBkZXZpY2UgYW5kIGRpc2FibGUgZm9yIGhvc3QNCj4gLCB0aGlz
IGNhbiBtYWtlIHN1cmUgZHdjMyBjb3JlIGRldmljZSBhdXRvIHN1c3BlbmQgc2V0dGluZyBpcw0K
PiBjb3JyZWN0IGFsbCB0aGUgdGltZSwgdGhlIGJhY2tncm91bmQgb2YgZGlzYWJsZSBkd2MzIGNv
cmUgZGV2aWNlDQo+IGF1dG8gc3VzcGVuZCBpcyB0byBtYWtlIGl0cyBwYXJlbnQgZGV2aWNlIHN1
c3BlbmQgaW1tZWRpYXRlbHkNCj4gKHNvIHdha2V1cCBlbmFibGUgY2FuIGJlIGVuYWJsZWQpIGFm
dGVyIHhoY2ktcGxhdCBkZXZpY2Ugc3VzcGVuZGVkLA0KPiBmb3IgZGV2aWNlIG1vZGUsIHdlIGtl
ZXAgdGhlIGR3YzMgY29yZSBkZXZpY2UgYXV0byBzdXNwZW5kIGlzIHRvDQo+IGdpdmUgc29tZSB3
YWl0IGZvciBnYWRnZXQgdG8gYmUgZW51bWVyYXRlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFh1
IFlhbmcgPHh1LnlhbmdfMkBueHAuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdj
My1pbXg4bXAuYyB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIDEgZmls
ZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91
c2IvZHdjMy9kd2MzLWlteDhtcC5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLWlteDhtcC5jDQo+
IGluZGV4IGJjZTZhZjgyZjU0Yy4uODBhNDMxY2I2ZmVkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L3VzYi9kd2MzL2R3YzMtaW14OG1wLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLWlt
eDhtcC5jDQo+IEBAIC0xNTgsMTEgKzE1OCwzMSBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgZHdjM19p
bXg4bXBfaW50ZXJydXB0KGludCBpcnEsIHZvaWQgKl9kd2MzX2lteCkNCj4gIAlyZXR1cm4gSVJR
X0hBTkRMRUQ7DQo+ICB9DQo+ICANCj4gK3N0YXRpYyB2b2lkIGR3YzNfaW14X3ByZV9zZXRfcm9s
ZShzdHJ1Y3QgZHdjMyAqZHdjLCBlbnVtIHVzYl9yb2xlIHJvbGUpDQo+ICt7DQo+ICsJaWYgKHJv
bGUgPT0gVVNCX1JPTEVfSE9TVCkNCj4gKwkJLyoNCj4gKwkJICogRm9yIHhoY2kgaG9zdCwgd2Ug
bmVlZCBkaXNhYmxlIGR3YyBjb3JlIGF1dG8NCj4gKwkJICogc3VzcGVuZCwgYmVjYXVzZSBkdXJp
bmcgdGhpcyBhdXRvIHN1c3BlbmQgZGVsYXkoNXMpLA0KPiArCQkgKiB4aGNpIGhvc3QgUlVOX1NU
T1AgaXMgY2xlYXJlZCBhbmQgd2FrZXVwIGlzIG5vdA0KPiArCQkgKiBlbmFibGVkLCBpZiBkZXZp
Y2UgaXMgaW5zZXJ0ZWQsIHhoY2kgaG9zdCBjYW4ndA0KPiArCQkgKiByZXNwb25zZSB0aGUgY29u
bmVjdGlvbi4NCj4gKwkJICovDQo+ICsJCXBtX3J1bnRpbWVfZG9udF91c2VfYXV0b3N1c3BlbmQo
ZHdjLT5kZXYpOw0KPiArCWVsc2UNCj4gKwkJcG1fcnVudGltZV91c2VfYXV0b3N1c3BlbmQoZHdj
LT5kZXYpOw0KDQpXb3VsZCB0aGlzIG92ZXJyaWRlIHRoZSB1c2VyIHNldHRpbmcgZXZlcnl0aW1l
IHRoZXJlJ3MgYSByb2xlIHN3aXRjaD8NCg0KPiArfQ0KPiArDQo+ICtzdHJ1Y3QgZHdjM19nbHVl
X29wcyBkd2MzX2lteF9nbHVlX29wcyA9IHsNCj4gKwkucHJlX3NldF9yb2xlICAgPSBkd2MzX2lt
eF9wcmVfc2V0X3JvbGUsDQo+ICt9Ow0KPiArDQo+ICBzdGF0aWMgaW50IGR3YzNfaW14OG1wX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICB7DQo+ICAJc3RydWN0IGRldmlj
ZQkJKmRldiA9ICZwZGV2LT5kZXY7DQo+ICAJc3RydWN0IGRldmljZV9ub2RlCSpub2RlID0gZGV2
LT5vZl9ub2RlOw0KPiAgCXN0cnVjdCBkd2MzX2lteDhtcAkqZHdjM19pbXg7DQo+ICsJc3RydWN0
IGR3YzMJCSpkd2MzOw0KPiAgCXN0cnVjdCByZXNvdXJjZQkJKnJlczsNCj4gIAlpbnQJCQllcnIs
IGlycTsNCj4gIA0KPiBAQCAtMjQwLDYgKzI2MCwxNyBAQCBzdGF0aWMgaW50IGR3YzNfaW14OG1w
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJCWdvdG8gZGVwb3B1bGF0
ZTsNCj4gIAl9DQo+ICANCj4gKwlkd2MzID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEoZHdjM19pbXgt
PmR3YzMpOw0KDQpJdCdzIGNvbmZ1c2luZyBob3cgZHdjM19pbXgtPmR3YzMgaXMgYWxzbyBuYW1l
ZCBkd2MzLi4uDQoNCj4gKwlpZiAoIWR3YzMpIHsNCj4gKwkJZXJyID0gZGV2X2Vycl9wcm9iZShk
ZXYsIC1FUFJPQkVfREVGRVIsICJmYWlsZWQgdG8gZ2V0IGR3YzMgcGxhdGZvcm0gZGF0YVxuIik7
DQo+ICsJCWdvdG8gZGVwb3B1bGF0ZTsNCj4gKwl9DQo+ICsNCj4gKwlkd2MzLT5nbHVlX29wcyA9
ICZkd2MzX2lteF9nbHVlX29wczsNCg0KSWYgeW91IHdhbnQgdG8gdXNlIGdsdWVfb3BzLCBwbGVh
c2UgdXNlIHRoZSBuZXcgZmxhdHRlbiBtb2RlbC4gSQ0KZG9uJ3Qgd2FudCBkd2MzIHRvIGJlIGlu
aXRpYWxpemVkIGFnYWluIGFmdGVyIG9mX3BsYXRmb3JtX3BvcHVsYXRlKCkuDQoNCkJSLA0KVGhp
bmgNCg0KPiArDQo+ICsJaWYgKGR3YzMtPmRyX21vZGUgPT0gVVNCX0RSX01PREVfSE9TVCkNCj4g
KwkJcG1fcnVudGltZV9kb250X3VzZV9hdXRvc3VzcGVuZChkd2MzLT5kZXYpOw0KPiArDQo+ICAJ
ZXJyID0gZGV2bV9yZXF1ZXN0X3RocmVhZGVkX2lycShkZXYsIGlycSwgTlVMTCwgZHdjM19pbXg4
bXBfaW50ZXJydXB0LA0KPiAgCQkJCQlJUlFGX09ORVNIT1QsIGRldl9uYW1lKGRldiksIGR3YzNf
aW14KTsNCj4gIAlpZiAoZXJyKSB7DQo+IC0tIA0KPiAyLjM0LjENCj4g

