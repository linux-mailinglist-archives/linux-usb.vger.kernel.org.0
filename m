Return-Path: <linux-usb+bounces-3403-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D80507FB9A0
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 12:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BB79B21C2B
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 11:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C5B4F889;
	Tue, 28 Nov 2023 11:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="I9Pv2v76";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JrM2CMZr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="eQE7dTzQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B8A0D56
	for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 03:48:45 -0800 (PST)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AS7ZLjb031309;
	Tue, 28 Nov 2023 03:48:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=3Suu68DveEaACWCr8VVfQITVSyp+DytnabITQ0l6DSw=;
 b=I9Pv2v76wQoG9IUjtoWv384Kxs7w+YWpY9tXUDIMMGy30U6t4A1RiSZP1ZYTyX9asuMB
 +z+bzZxltRGK1/vtVJR4vetwqVRfkeYjU6VtkPO1VF2iyBi7SFFtxKsTAtJlhB80+Dyk
 ZYWzaRK7CifZUslewjNcW2e/LzloMw1RUNQYkUgRswXC20HLougfFKGugfcDCXZJApKM
 m/D6LugG9YuDEbbWjSsccnLqMzEWDtE3tjqFzU06Y4xF/Fm5Ebt+lAPRBxVEWPG2DJ8+
 T3sicCNNNaVSzwDj1f0yAeHhAicgNcNyjoJEMBRrSz2jPtZrkn5XkfQ3x+ydbJgl2CTt NA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3ukh2ba6g8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 03:48:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1701172119; bh=3Suu68DveEaACWCr8VVfQITVSyp+DytnabITQ0l6DSw=;
	h=From:To:Subject:Date:References:In-Reply-To:From;
	b=JrM2CMZrv2lbS/mCngcWS1kfaAb4Rvz40SzRDXu10R191e409PwL1HEneBRt7kfvY
	 97DbRkwgOhxDiL0zD1DMEms8azg4kA/6cHhrhH8+EV7TFzVXFXILe1IwGwvtLx3X3w
	 am5EUBfP7zLdeoQUpLscbDBsCzUHv08ZYT41pr5/uZyAhbV018+XOtA3T50LnXr8OZ
	 gU74+ZPl7GtybYDPiu+Z8/A5sAw8/BFyyfabZW+hIeNDFUQ1sYu6Khl/z5YUZVild9
	 HwN8EK6ZnAmpTtIncR1Kontfxd76zTcWiFNZhoXnAqwkq5T3QWOcsYasBlC5wYrIds
	 +p1crhaKL34MQ==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 248924041E;
	Tue, 28 Nov 2023 11:48:38 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id ACE52A009A;
	Tue, 28 Nov 2023 11:48:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=eQE7dTzQ;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id B4E5740424;
	Tue, 28 Nov 2023 11:48:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlgNKcLgINPYwmAIVf9b9ZZRq5Rjt4fZpbKGwPaZEmrGYJ8GekbmUBcMvoekinbKF7P39yI+pjzxjMUX6PwvBqTxGl4qw61OuMvUN6Lj0vm5FqTU5hpR5mnbfrxI/l0bOtGPqm1rRBwN65Rwl7B3ZZlWq8p8+V/YtBIZJiR0pV1JIpF0+rev3c5S4fWtK/tTMAHCZ6KjC8Qeym+0iwesbbGob3pGy+wVV5ylGp/W7eXr1TK5UM3Jv9cMbTi+uDsft3f8nP+nyE57CXdOElAjM+SjwUv7JfVCCeXeL43WTvv5iDYqjqfEBwApEIiF3RgZGbsf/0Cg52BtKc8K8L3Azg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Suu68DveEaACWCr8VVfQITVSyp+DytnabITQ0l6DSw=;
 b=O/rNfsdqNSHIrbzq/hRxEiQq5Qw3kNCjsic4mjunTSK4cuCQhhiGO+smekSxeHMSh7w4dGAxd4GdLR3AQjJd2hkk+rQMRFpPnowdeBpsbTX6va60mjNdZRn4ssz8x9vEmkXGT0fxOBAB0ZkXKNAcCsu3PhbEiLBXNQY71ER1ULGY0pe8sZXHiZrE7KVbN1122l9IvTv2KG7XxDn/xjEr+/7R0idJNDsOBi509hortOKFUvCg1fc2YYifKqJpKb3T29LAA69QdbFD8cbJsFY5t65rZf4oVCPB7Via9TdMDPk6oYY5cL2+AmMLaATfe/c48zfXcsd5+VqUZEsD4wNvmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Suu68DveEaACWCr8VVfQITVSyp+DytnabITQ0l6DSw=;
 b=eQE7dTzQ/AjgCx25Gjje6+aC6teKkLt97Yc77/w0SDw3XlD93ekuZ5Db7tjwdYeUCwz2g6bod5UwO9PIyPWjRXEg66Fq5MXagBKzT7ZmEHc1MD9vHe58L5cMJC3OGdtastWviBCVynyrezZtgDT9D/WPOT8UdHiuAROmv0qPZek=
Received: from BYAPR12MB3399.namprd12.prod.outlook.com (2603:10b6:a03:ad::22)
 by MW6PR12MB8662.namprd12.prod.outlook.com (2603:10b6:303:243::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 11:48:34 +0000
Received: from BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::94f2:3161:83a2:4680]) by BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::94f2:3161:83a2:4680%3]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 11:48:34 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Oliver Neukum <oneukum@suse.com>,
        "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>,
        Ivan Ivanov <ivan.ivanov@suse.com>,
        Andrea della
 Porta <andrea.porta@suse.com>
Subject: Re: [PATCH] USB: dwc2: write HCINT with INTMASK applied
Thread-Topic: [PATCH] USB: dwc2: write HCINT with INTMASK applied
Thread-Index: AQHaF9Jh+M4x1h3P7ECYkgn6i43CXLCGUQGAgAegwICAAByPAIABdJ8AgAAvCwA=
Date: Tue, 28 Nov 2023 11:48:33 +0000
Message-ID: <bfb8e693-7085-430c-0481-3d6630168240@synopsys.com>
References: <20231115144514.15248-1-oneukum@suse.com>
 <f0bd323a-8384-e303-907f-5d533af6d71e@synopsys.com>
 <ZWRbkdTASTNJB8Fv@apocalypse>
 <f293d306-54fb-ecb5-4515-70a6c1faf1b1@synopsys.com>
 <ZWWsGknhNuVggNNa@apocalypse>
In-Reply-To: <ZWWsGknhNuVggNNa@apocalypse>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB3399:EE_|MW6PR12MB8662:EE_
x-ms-office365-filtering-correlation-id: 6cf5c334-ca21-40a1-fb84-08dbf007f32f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FHjbH30ig12h0puIHXxH7JnllqNqQNtJzs3/8JHnPK3GUPlHKzrFHgXy+uiWvdg9aGbIuaRHkdQOIBU6BfDFaVPgXhM2AKknRl+T2I5frXqqLYusMpfgnkko3VrZiz5nBrdDAaerX0QviY6AdG7LXnN3bXTIEzVNkgKlku2haJvbv+t3KAKwSn2g4EUXuQEyEvpI58nyJaMe1/EdoflczOH5XzXMQ2dlWhpiyqHPEQwgahnDxXCK2V4JsABW1uWdUJpEE/tP3wlXUnFq78mbXb9TMpWUQslc0AXArBZM1jZf88xUoQMpR62G7fXWCbyLGe8jC4Yt8qgWqgbqvLWq8ejRyLqUQ7Noibp3td8PprHhouTHzL92DYqbAaL5bgVQfwwGiIkTBA0/xOdhs99Bk0tWjhej77eUaGNDVIlgCm6RL3XJZ1aXsTFCZe8t4cay5liOPmacBimPPumfRgvjxqxwjrXMSk2Nb0i4j6Aw5NAov5ppERL6owIaIIYNFLOaBUC7x5wJTNnVYmIGq4nVaxPCf8Evrv42y33OEO0OfEinA4ioxFNEbFvHSlQobBgCvEfMMUzUbchdru9gh8QDsf3mxbij8+NdJpsGYP11YQicWclvf5Y3jD7NGeoT9oXbE+C3m0mAPk9+wLXwPY5U3FyU87wC4Y6QF691AHRc2hW8odChVT/TW71OQmibGW1p
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3399.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39860400002)(366004)(136003)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(71200400001)(31696002)(8936002)(8676002)(6512007)(6506007)(53546011)(64756008)(91956017)(66946007)(66556008)(66476007)(110136005)(316002)(66446008)(76116006)(6486002)(478600001)(36756003)(41300700001)(38100700002)(38070700009)(31686004)(86362001)(26005)(122000001)(2906002)(2616005)(83380400001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MmdqS1IrbDlZNE9HcmlISUU3RVRlUFJwUDZTakU0aUpPMHFnNUMrYy9sZ05n?=
 =?utf-8?B?YmdvTDdXRjBxSHBWbVJQZ2U1NENZWE1jc1JWZUhSREV4alBmdDVIWklKcktE?=
 =?utf-8?B?ZzlsUGdHWGxIcHJrSllhT0VGR3ROcUZDNFFnZ2xUZUhKdWxOUDMzaG1rZTcr?=
 =?utf-8?B?aEI2YlJncFBWMS94VDdCdHNqU2NsYWRBdHBKcW5ad2Y4ZlZiUmpma1FZMGhR?=
 =?utf-8?B?SndEUkhJUVd4RzcvdWJSWlVETU1NbW5EeG01ekdNWHN6N3ZSWTlzaVR4WGw4?=
 =?utf-8?B?Mi9JZ1p1R1U3VmNmUkJtZXZKUTZITjduR1RJdnFRenlkSmh2OElKeVI0K1Fp?=
 =?utf-8?B?aUxZazFwelNjSkVWZ2F3TEEzTks2ZXVOcUhSRStoSnMxUnB1UXlIdGJRZTF2?=
 =?utf-8?B?elpMWXdYdXlyOXV5aUMxZWIyaGpZZUVEVmxpTWY5SkFpMUQvRlQ0ZGlBNFg0?=
 =?utf-8?B?Z3U4emc5d04rYlpZRmRKanBzYnVrZ0FaNUErb0lGT2NKWVh1bkNSTEZFbmwx?=
 =?utf-8?B?ajVOTDQ5YXZnbG9hV3lqa1pMRWVkTzJyTlZMcTFXUHdqNWJOemEzSWRNVWRq?=
 =?utf-8?B?Znk1OC9xMHZqWnFXQTZYK3dCSWpIOGs4TzhyT1FaZ0VaVXNuWXpidmZxNXpq?=
 =?utf-8?B?eloxditxN2ZNd3oxbENZeVd3SG9sVTBaSlp1TFB0amZaZUpuUnowUDhIcUZu?=
 =?utf-8?B?Z1FPbjRIZ05oN0t4NFoyajZhcVBQWVlCdER1RVBCYSsxSW80Y1FYSVpqRXFz?=
 =?utf-8?B?S0s5QkZjSXk4ZllvaGJtK21MTkUwbGdTejFmS3NGM2QxaFFzWE93THIwZWZm?=
 =?utf-8?B?NmZKWURnQWs1ZU1nQkliV3pZeEUvN3Npa1hCNWM4ZHp5bzVIYTR6OU1DZFRR?=
 =?utf-8?B?cHJLTitXb1Jpa2JuMk9XZ0VVNmhrdHl2UWdHbTY0bkdKWlNtMjkxUm9qU1pI?=
 =?utf-8?B?UUwvZVJXMWNsWHFoM3ZnTHhMZk9FKzRmc01wdTc2eUlQekk0a2hiTmtIeExG?=
 =?utf-8?B?UE11R0hGaGptMi9KdE5oNTMrT2QrYTVNUGIwR0RsMGxRdFRWYmRLenBKTURT?=
 =?utf-8?B?NDUyRllsb2ZaRnM1eEdkNFFpcDRSZ3RyL0xRTjMxY1ExSmJQWjJQRnNjTy9h?=
 =?utf-8?B?NitCenVQV1UvQU41UnprQjEzVVdIK29Pdk92dFZCbmdRa2NjMjRVYTZsUURk?=
 =?utf-8?B?eHNVcG5UaGRrd3JnRHB3K055SmxOUFpHOU9UYnRCVW5SVnJNMUlTMHdudVVz?=
 =?utf-8?B?OTNJcU5MaUNPTlNYQkJvU3dQOWloM0UrVVYvZmxETlViOHJRdXpDSzV2YmVv?=
 =?utf-8?B?a2lRTmVya1htL0R4dVFPY3piOHZnUGlHZ25jbXkzRFM1emt6NXZiY1NLaWpM?=
 =?utf-8?B?L1ZvZFBVV2dScm9vUERwalp4R1V0dVNHZXBmNEFpVWhWa21tOWc2Zjd4R0dX?=
 =?utf-8?B?RGoxRFFoRVlVaWVLSnc2Q3h5dUlYdXBpd3RQV1Y4ZGVubmRqZ0pCZXptbGts?=
 =?utf-8?B?R0I5Mmp3UXdrZ0lIdnZFd0IwRTlnNmx4NE5QY3RYeXUrcGQvVUZWdTRKT0ls?=
 =?utf-8?B?OEREMTdkaUhVc1hlRlpCa09aZ1dpbmU2K1hMbStBRzMyQUl1MHFsb1EyOHRl?=
 =?utf-8?B?Yy9KbW1tMXlnUjBPQjd6REdJK3hibkpJaGdvMGxEbkpyNVdoUGtKMDZsc3ZP?=
 =?utf-8?B?aWhROHpYemN0SWd2RFNhODFhaUljN3A5NE9yaEtOL3BQVEhmT2l4OG83VFMz?=
 =?utf-8?B?aW15WWNMNHBuOUk4ZHlXSzdUTE9JYTM4bDdkNk1mdEljSjhrT09OcnZKditH?=
 =?utf-8?B?YzRxbk9tcExwbE94aFJRbktYZ1J6ZHFkYng5L1ZuZmFYVkNlMVI0Q1ZPV09h?=
 =?utf-8?B?c2tBRUhRcDhBM1pOTHN6ejJaNURteEVmWG5xVmltRGdIK3EzNnJDVHVLWS9j?=
 =?utf-8?B?OHlIVkZoa3FhaER5ZnVOaFN0Sy83emJBQ2tyWnIyYkdER1Y2RnN0RHJRMStW?=
 =?utf-8?B?bHpSYWh3eXJla0FhS1p3WlBBdmQ5OEFzK3cyTlloWnRONEl1Q2tSVUdxQ1Vn?=
 =?utf-8?B?WjcxYWVDcDlPOGZsYXFsZm5DUTIyc3JCanRSUDVSMXVhSG5SNVBZVkkreTBN?=
 =?utf-8?Q?BqDL17S32ZEpMOsR7qhaKWm2W?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <04BA0DA27E34CA4E83AC9912EF2F0C4D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	lTzp6nAEE/YdlmBk4hd9BvCLy+lzh3pIvvDPGKdmu2e6wfdIkPe6kL1zJw0doy2C18xTNt4wsaWNVGyZrDs0ii10/nGEdzzah6lLULsWoyUtm86V6A23ZP/YGuuY62EYH+UliXqpl/4Nn+DaH1ue6xImxUZwx8P7A1/kHKXGzSJSSgKzTI22gydklgNQnpYJ08XHzVhx8No1iNQwlLY+CVvVYjYMxqegKzGFFtz4KCo28Zo4FJzjEBXbwB91cprq1XNLMscjcV/GPPtK6LkzdFLmSAIxDVwn87Ox+5K1NusmTu++jYEzdRiFx4ijOsFlTSCsafx/C12d6Crp7pJ5J+SMXlXONsHElgiHIycsja54hTUwuTy2xzvSAEB9cfkqCFWknlD/iouKBZTw7X2k5Ad7Km9c8tdBLXzojqwh0RBMNVlYghjxBJ1nO9HQy02RNrsKpMBuTIMcBHO1H7nPWxC6T2GkBMFdHcXSzi66fhdFomk6OUnnJuKEGIARUPtxdc5KVKt4k11YF57bZJ7nksFsF2OZcp1R8oJvo6kiTZJNe+xLBtZ7muvsmqHqU+J0ntTB3jB4kQFuXbbfHredsBpqqYCIcrd1ADIVQsnSsF/mf0m6eFT38//uWfmrhcRqqD2MIa8X3rgoueszoX72RuCCDM4vCsG0JmcfBbIB8DdhnwqmPH8YjoJZ5dHrmwt0TM29wbxoTKeCenO2T2u2bOLVhjMY42VSzVAlGo+kqlHZMPem2rVJz7sut/OkkiorCmA5pUjnGrfUjvALA0FOTP3AXJ9grlXvib0kIRRbx3kSqrtioSA7JTzF49vIiU3zyKQFzQ7MR9OUDALFAIS59Ts02lCZwHE8mr7dUc65hFzC9fJh83Pq/XqYSQdez2Ks
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf5c334-ca21-40a1-fb84-08dbf007f32f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2023 11:48:33.8447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N9z/E21aOrbIp0iNqpUwVlS1PshlADHLtkEa+Yce3S4w6+BKbbk3yFiUdx6rKG96dST0vfJw11CGXwgBMLiWiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8662
X-Proofpoint-ORIG-GUID: BrqIajhBx4tj-y8CRU1SPkiwn_YX1NQZ
X-Proofpoint-GUID: BrqIajhBx4tj-y8CRU1SPkiwn_YX1NQZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_12,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=615 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311280093

SGkgQW5kcmVhLA0KDQpPbiAxMS8yOC8yMyAxMzowMCwgQW5kcmVhIGRlbGxhIFBvcnRhIHdyb3Rl
Og0KPiBIaSBNaW5hcywNCj4gDQo+IE9uIDEwOjQ2IE1vbiAyNyBOb3YgICAgICwgTWluYXMgSGFy
dXR5dW55YW4gd3JvdGU6DQo+PiBIaSBBbmRyZWEsDQo+Pg0KPj4gT24gMTEvMjcvMjMgMTM6MDQs
IEFuZHJlYSBkZWxsYSBQb3J0YSB3cm90ZToNCj4+PiBPbiAxMjozNSBXZWQgMjIgTm92ICAgICAs
IE1pbmFzIEhhcnV0eXVueWFuIHdyb3RlOg0KPj4+PiBIaSBPbGl2ZXIsDQo+Pj4+DQo+Pj4+IE9u
IDExLzE1LzIzIDE4OjQ1LCBPbGl2ZXIgTmV1a3VtIHdyb3RlOg0KPj4+Pj4gZHdjMl9oY19uX2lu
dHIoKSB3cml0ZXMgYmFjayBJTlRNQVNLIGFzIHJlYWQgYnV0IGV2YWx1YXRlcyBpdA0KPj4+Pj4g
d2l0aCBpbnRtYXNrIGFwcGxpZWQuIEluIHN0cmVzcyB0ZXN0aW5nIHRoaXMgY2F1c2VzIHNwdXJp
b3VzDQo+Pj4+PiBpbnRlcnJ1cHRzIGxpa2UgdGhpczoNCj4+Pj4+DQo+Pj4+PiBbTW9uIEF1ZyAx
NCAxMDo1MTowNyAyMDIzXSBkd2MyIDNmOTgwMDAwLnVzYjogZHdjMl9oY19jaGhsdGRfaW50cl9k
bWE6IENoYW5uZWwgNyAtIENoSGx0ZCBzZXQsIGJ1dCByZWFzb24gaXMgdW5rbm93bg0KPj4+Pj4g
W01vbiBBdWcgMTQgMTA6NTE6MDcgMjAyM10gZHdjMiAzZjk4MDAwMC51c2I6IGhjaW50IDB4MDAw
MDAwMDIsIGludHN0cyAweDA0NjAwMDAxDQo+Pj4+PiBbTW9uIEF1ZyAxNCAxMDo1MTowOCAyMDIz
XSBkd2MyIDNmOTgwMDAwLnVzYjogZHdjMl9oY19jaGhsdGRfaW50cl9kbWE6IENoYW5uZWwgMCAt
IENoSGx0ZCBzZXQsIGJ1dCByZWFzb24gaXMgdW5rbm93bg0KPj4+Pj4gW01vbiBBdWcgMTQgMTA6
NTE6MDggMjAyM10gZHdjMiAzZjk4MDAwMC51c2I6IGhjaW50IDB4MDAwMDAwMDIsIGludHN0cyAw
eDA0NjAwMDAxDQo+Pj4+PiBbTW9uIEF1ZyAxNCAxMDo1MTowOCAyMDIzXSBkd2MyIDNmOTgwMDAw
LnVzYjogZHdjMl9oY19jaGhsdGRfaW50cl9kbWE6IENoYW5uZWwgNCAtIENoSGx0ZCBzZXQsIGJ1
dCByZWFzb24gaXMgdW5rbm93bg0KPj4+Pj4gW01vbiBBdWcgMTQgMTA6NTE6MDggMjAyM10gZHdj
MiAzZjk4MDAwMC51c2I6IGhjaW50IDB4MDAwMDAwMDIsIGludHN0cyAweDA0NjAwMDAxDQo+Pj4+
PiBbTW9uIEF1ZyAxNCAxMDo1MTowOCAyMDIzXSBkd2MyIDNmOTgwMDAwLnVzYjogZHdjMl91cGRh
dGVfdXJiX3N0YXRlX2FibigpOiB0cmltbWluZyB4ZmVyIGxlbmd0aA0KPj4+Pj4NCj4+Pj4+IEFw
cGx5aW5nIElOVE1BU0sgcHJldmVudHMgdGhpcy4gVGhlIGlzc3VlIGV4aXN0cyBpbiBhbGwgdmVy
c2lvbnMgb2YgdGhlDQo+Pj4+PiBkcml2ZXIuDQo+Pj4+DQo+Pj4+IEknbSBPayB3aXRoIHRoaXMg
cGF0Y2gsIGp1c3QgbmVlZCBzb21lIGVsYWJvcmF0aW9uLg0KPj4+PiBTbywgY2hhbm5lbCBoYWx0
ZWQgaW50ZXJydXB0IGFzc2VydGVkIGR1ZSB0byBzb21lIG90aGVyIGludGVycnVwdCAoQUhCDQo+
Pj4+IEVycm9yLCBFeGNlc3NpdmUgdHJhbnNhY3Rpb24gZXJyb3JzLCBCYWJibGUsIFN0YWxsKSB3
aGljaCB3YXMgbWFza2VkLg0KPj4+PiBDYW4geW91IGNoZWNrIHdoaWNoIG9mIG1hc2tlZCBpbnRl
cnJ1cHRzIGlzIGNhdXNlIG9mIGNoYW5uZWwgaGFsdCBpbnRlcnJ1cHQ/DQo+Pj4+DQo+Pj4+IFRo
YW5rcywNCj4+Pj4gTWluYXMNCj4+Pj4NCj4+Pg0KPj4+IEhpIE1pbmFzLA0KPj4+IGhlcmUncyB0
aGUgcmVwb3J0IGZyb20gZG1lc2c6DQo+Pj4NCj4+PiBbMjA5Mzg0LjIzODcyNF0gICBoY2ludCAw
eDAwMDAwMDEyLCBoY2ludG1zayAweDAwMDAwMDA2LCBoY2ludCZoY2ludG1zayAweDAwMDAwMDAy
DQo+Pj4gWzIwOTM4NC4yNDY3MjVdICAgaGNpbnQgMHgwMDAwMDAxMiwgaGNpbnRtc2sgMHgwMDAw
MDAwNiwgaGNpbnQmaGNpbnRtc2sgMHgwMDAwMDAwMg0KPj4+IFsyMDkzODQuMjQ3NjM0XSAgIGhj
aW50IDB4MDAwMDAwMDMsIGhjaW50bXNrIDB4MDAwMDAwMDYsIGhjaW50JmhjaW50bXNrIDB4MDAw
MDAwMDINCj4+PiBbMjA5Mzg0LjI1NDcyMl0gICBoY2ludCAweDAwMDAwMDEyLCBoY2ludG1zayAw
eDAwMDAwMDA2LCBoY2ludCZoY2ludG1zayAweDAwMDAwMDAyDQo+Pj4gWzIwOTM4NC4yNjI3MjVd
ICAgaGNpbnQgMHgwMDAwMDAxMiwgaGNpbnRtc2sgMHgwMDAwMDAwNiwgaGNpbnQmaGNpbnRtc2sg
MHgwMDAwMDAwMg0KPj4+IFsyMDkzODQuMjcwNzI0XSAgIGhjaW50IDB4MDAwMDAwMTIsIGhjaW50
bXNrIDB4MDAwMDAwMDYsIGhjaW50JmhjaW50bXNrIDB4MDAwMDAwMDINCj4+PiBbMjA5Mzg0LjI3
ODMzNl0gICBoY2ludCAweDAwMDAwMDkyLCBoY2ludG1zayAweDAwMDAwMDA2LCBoY2ludCZoY2lu
dG1zayAweDAwMDAwMDAyDQo+Pj4gWzIwOTM4NC4yNzgzODRdICAgaGNpbnQgMHgwMDAwMDAxMCwg
aGNpbnRtc2sgMHgwMDAwMDQzNiwgaGNpbnQmaGNpbnRtc2sgMHgwMDAwMDAxMA0KPj4+IFsyMDkz
ODQuMjc4NzIwXSAgIGhjaW50IDB4MDAwMDAwMTIsIGhjaW50bXNrIDB4MDAwMDAwMDYsIGhjaW50
JmhjaW50bXNrIDB4MDAwMDAwMDINCj4+PiBbMjA5Mzg0LjI4NjcyM10gICBoY2ludCAweDAwMDAw
MDEyLCBoY2ludG1zayAweDAwMDAwMDA2LCBoY2ludCZoY2ludG1zayAweDAwMDAwMDAyDQo+Pj4g
WzIwOTM4NC4yODg0ODZdICAgaGNpbnQgMHgwMDAwMDAyMSwgaGNpbnRtc2sgMHgwMDAwMDQyNiwg
aGNpbnQmaGNpbnRtc2sgMHgwMDAwMDAyMA0KPj4NCj4+PiBbMjA5Mzg0LjI4ODUxMV0gICBoY2lu
dCAweDAwMDAwMDAyLCBoY2ludG1zayAweDAwMDAwNDA2LCBoY2ludCZoY2ludG1zayAweDAwMDAw
MDAyDQo+PiBBY2NvcmRpbmcgeW91ciBwYXRjaCB0ZXJtaW5vbG9neSBhYm92ZSAnaGNpbnQnIGlz
IGEgJ2hjaW50cmF3JyBhbmQgaGVyZQ0KPj4gYXNzZXJ0ZWQgb25seSBjaGFubmVsIGhhbHRlZCBp
bnRlcnJ1cHQuIFNvLCBjaGFubmVsIGhhbHRlZCB3aXRob3V0IGFueQ0KPj4gcmVhc29uLiBOb3Qg
Y2xlYXIgaG93IHlvdXIgcGF0Y2ggZml4IHRoaXMgY2FzZT8NCj4+DQo+PiBDb3VwbGUgb2YgcXVl
c3Rpb25zIHJlbGF0ZWQgdG8geW91ciB0ZXN0czoNCj4+IDEuIFdoaWNoIERNQSBtb2RlIHVzZWQg
aGVyZSAtIGJ1ZmZlciBvciBkZXNjcmlwdG9yIERNQT8NCj4+IDIuIFdoaWNoIHR5cGUgb2YgdHJh
bnNmZXJzIHRlc3Rpbmc/IE9yIHlvdSBjYW4gYWRkIHRvIHRoaXMgcHJpbnQgSENDSEFSeA0KPj4g
YWxzby4NCj4+IDMuIFdoaWNoIHZlcnNpb24gb2YgY29yZSB5b3UgdXNlIChHU05QU0lEKT8NCj4+
DQo+PiBUaGFua3MsDQo+PiBNaW5hcw0KPj4NCj4gDQo+IFRoZSBhdWdtZW50ZWQgbG9nIGlzIGhl
cmUgYmVsb3cgKGhjY2hhcltjaG51bV0gYW5kIG90aGVycyBhZGRlZCk6DQo+IA0KPiBbMzMwNDM4
LjYyMzAxN10gLS1Ib3N0IENoYW5uZWwgSW50ZXJydXB0LS0sIENoYW5uZWwgNA0KPiBbMzMwNDM4
LjYyMzAyOV0gICBoY2ludCAweDAwMDAwMDEyLCBoY2ludG1zayAweDAwMDAwMDA2LCBoY2ludCZo
Y2ludG1zayAweDAwMDAwMDAyDQo+IFszMzA0MzguNjIzMDM5XSAgIGhjY2hhcls0XSA9IDB4MDE1
Yzk4MTAsIGNoYW4tPmVwX3R5cGU9Mw0KPiBbMzMwNDM4LjYyNjE4M10gLS1Ib3N0IENoYW5uZWwg
SW50ZXJydXB0LS0sIENoYW5uZWwgNQ0KPiBbMzMwNDM4LjYyNjE5OF0gICBoY2ludCAweDAwMDAw
MDAzLCBoY2ludG1zayAweDAwMDAwMDA2LCBoY2ludCZoY2ludG1zayAweDAwMDAwMDAyDQo+IFsz
MzA0MzguNjI2MjA4XSAgIGhjY2hhcls1XSA9IDB4MDFkODMyMDAsIGNoYW4tPmVwX3R5cGU9Mg0K
PiBbMzMwNDM4LjYyNzY1OV0gLS1Ib3N0IENoYW5uZWwgSW50ZXJydXB0LS0sIENoYW5uZWwgMw0K
PiBbMzMwNDM4LjYyNzY3NF0gICBoY2ludCAweDAwMDAwMDIxLCBoY2ludG1zayAweDAwMDAwNDI2
LCBoY2ludCZoY2ludG1zayAweDAwMDAwMDIwDQo+IFszMzA0MzguNjI3Njg2XSAgIGhjY2hhclsz
XSA9IDB4MDFkOGQyMDAsIGNoYW4tPmVwX3R5cGU9Mg0KPiBbMzMwNDM4LjYyNzcwM10gLS1Ib3N0
IENoYW5uZWwgSW50ZXJydXB0LS0sIENoYW5uZWwgMw0KPiBbMzMwNDM4LjYyNzcxMV0gICBoY2lu
dCAweDAwMDAwMDAyLCBoY2ludG1zayAweDAwMDAwNDA2LCBoY2ludCZoY2ludG1zayAweDAwMDAw
MDAyDQo+IFszMzA0MzguNjI3NzIxXSAgIGhjY2hhclszXSA9IDB4MDFkOGQyMDAsIGNoYW4tPmVw
X3R5cGU9Mg0KPiBbMzMwNDM4LjYyNzc0MF0gZHdjMiAzZjk4MDAwMC51c2I6IGR3YzJfaGNfY2ho
bHRkX2ludHJfZG1hOiBDaGFubmVsIDMgLSBDaEhsdGQgc2V0LCBidXQgcmVhc29uIGlzIHVua25v
d24NCj4gWzMzMDQzOC42Mjc3NThdIGR3YzIgM2Y5ODAwMDAudXNiOiBoY2ludCAweDAwMDAwMDAy
LCBpbnRzdHMgMHgwNDYwMDAwMQ0KPiBbMzMwNDM4LjYyNzc5OF0gLS1Ib3N0IENoYW5uZWwgSW50
ZXJydXB0LS0sIENoYW5uZWwgMA0KPiBbMzMwNDM4LjYyNzgwN10gICBoY2ludCAweDAwMDAwMDEw
LCBoY2ludG1zayAweDAwMDAwNDM2LCBoY2ludCZoY2ludG1zayAweDAwMDAwMDEwDQo+IFszMzA0
MzguNjI3ODE4XSAgIGhjY2hhclswXSA9IDB4ODFkOGQyMDAsIGNoYW4tPmVwX3R5cGU9Mg0KPiBb
MzMwNDM4LjYzMTAxN10gLS1Ib3N0IENoYW5uZWwgSW50ZXJydXB0LS0sIENoYW5uZWwgMQ0KPiBb
MzMwNDM4LjYzMTAyNV0gICBoY2ludCAweDAwMDAwMDEyLCBoY2ludG1zayAweDAwMDAwMDA2LCBo
Y2ludCZoY2ludG1zayAweDAwMDAwMDAyDQo+IFszMzA0MzguNjMxMDM1XSAgIGhjY2hhclsxXSA9
IDB4MDE1Yzk4MTAsIGNoYW4tPmVwX3R5cGU9Mw0KPiBbMzMwNDM4LjYzOTAxOV0gLS1Ib3N0IENo
YW5uZWwgSW50ZXJydXB0LS0sIENoYW5uZWwgNw0KPiBbMzMwNDM4LjYzOTA0MV0gICBoY2ludCAw
eDAwMDAwMDEyLCBoY2ludG1zayAweDAwMDAwMDA2LCBoY2ludCZoY2ludG1zayAweDAwMDAwMDAy
DQo+IFszMzA0MzguNjM5MDUzXSAgIGhjY2hhcls3XSA9IDB4MDE1Yzk4MTAsIGNoYW4tPmVwX3R5
cGU9Mw0KPiBbMzMwNDM4LjY0NzAxOV0gLS1Ib3N0IENoYW5uZWwgSW50ZXJydXB0LS0sIENoYW5u
ZWwgNg0KPiBbMzMwNDM4LjY0NzA0MF0gICBoY2ludCAweDAwMDAwMDEyLCBoY2ludG1zayAweDAw
MDAwMDA2LCBoY2ludCZoY2ludG1zayAweDAwMDAwMDAyDQo+IFszMzA0MzguNjQ3MDUxXSAgIGhj
Y2hhcls2XSA9IDB4MDE1Yzk4MTAsIGNoYW4tPmVwX3R5cGU9Mw0KPiBbMzMwNDM4LjY0OTAxNV0g
LS1Ib3N0IENoYW5uZWwgSW50ZXJydXB0LS0sIENoYW5uZWwgNA0KPiBbMzMwNDM4LjY0OTAyMF0g
ICBoY2ludCAweDAwMDAwMDEyLCBoY2ludG1zayAweDAwMDAwMDA2LCBoY2ludCZoY2ludG1zayAw
eDAwMDAwMDAyDQo+IA0KPiB3ZSdyZSB1c2luZyBidWZmZXIgRE1BIG1vZGUgKGRtYV9kZXNjX2Vu
YWJsZT0wKSwgd2UgYXJlIGF0cnNzIHRlc3RpbmcgdmlhIHBpbmcgZmxvb2RpbmcNCj4gdGhyb3Vn
aCBhbiBMVEUgbW9kZW0gYXR0YWNoZWQgdG8gVVNCIHdoaWNoIHNob3VsZCBtb3N0bHkgZG8gYnVs
ayBkYXRhZmxvdyAoY29uZmlybWVkDQo+IGJ5IGVwX3R5cGU9PTIpLiBGcm9tIHJlZ2R1bXAsIEdT
TlBTSUQgPSAweDRmNTQyODBhLg0KPiANCg0KSG9zdCBjaGFubmVsIGhhbHQgaW50ZXJydXB0IHdp
dGggInVua293biByZWFzb24iIChubyBhbnkgb3RoZXIgaW50ZXJydXB0IA0Kc2VlbiBpbiBoY2lu
dHJhdykgbWVhbiB0aGF0IGNoYW5uZWwgaGFsdGVkIGJlY2F1c2UgYXBwbGljYXRpb24gZGlzYWJs
ZSANCmNoYW5uZWwsIGkuZS4gb24gdXJiX2RlcXVldWUuDQpNYXliZSAiQ2hIbHRkIHNldCwgYnV0
IHJlYXNvbiBpcyB1bmtub3duIiBtZXNzYWdlIGlzIG5vdCBjb3JyZWN0LCBidXQgDQppdCdzIHBv
c3NpYmxlIHRoYW4gY2hhbm5lbCBoYWx0ZWQgaW50ZXJydXB0IGFzc2VydGVkIG5vdCBiZWNhdXNl
IG9mIGFueSANCmVycm9yIGNvbmRpdGlvbi4NCkNoYW5uZWwgaGFsdGVkIGludGVycnVwdCBhc3Nl
cnRlZCBieSBkYXRhYm9vayBpbiBmb2xsb3cgY2FzZXM6DQoiSW4gbm9uIFNjYXR0ZXIvR2F0aGVy
IERNQSBtb2RlLCBpdCBpbmRpY2F0ZXMgdGhlIHRyYW5zZmVyIGNvbXBsZXRlZCANCmFibm9ybWFs
bHkgZWl0aGVyIGJlY2F1c2Ugb2YgYW55IFVTQiB0cmFuc2FjdGlvbiBlcnJvciBvciBpbiByZXNw
b25zZSB0bw0KZGlzYWJsZSByZXF1ZXN0IGJ5IHRoZSBhcHBsaWNhdGlvbiBvciBiZWNhdXNlIG9m
IGEgY29tcGxldGVkIHRyYW5zZmVyLiINCg0KU28sIGl0J3Mgbm90IHNwdXJpb3VzIGludGVycnVw
dC4NCkRvZXMgdGhpcyAic3B1cmlvdXMiIGludGVycnVwdCBicm9rZSB5b3VyIHRlc3RzPyBJZiBu
b3QsIHRoZW4gZG9lc24ndCANCm5lZWQgdG8gYXBwbHkgeW91ciBwYXRjaC4gTW9yZW92ZXIsIEkg
Y2FuJ3QgdW5kZXJzdGFuZCBob3cgeW91ciBwYXRjaCANCmFsbG93IHRvIGF2b2lkIGNhc2Ugd2l0
aCAiQ2hIbHRkIHNldCwgYnV0IHJlYXNvbiBpcyB1bmtub3duIiBtZXNzYWdlLg0KDQpUaGFua3Ms
DQpNaW5hcw0KDQo+IE1hbnkgdGhhbmtzLA0KPiBBbmRyZWENCj4gICANCj4+Pj4+DQo+Pj4+PiBT
aWduZWQtb2ZmLWJ5OiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPg0KPj4+Pj4gVGVz
dGVkLWJ5OiBJdmFuIEl2YW5vdiA8aXZhbi5pdmFub3ZAc3VzZS5jb20+DQo+Pj4+PiBUZXN0ZWQt
Ynk6IEFuZHJlYSBkZWxsYSBQb3J0YSA8YW5kcmVhLnBvcnRhQHN1c2UuY29tPg0KPj4+Pj4gLS0t
DQo+Pj4+PiAgICAgZHJpdmVycy91c2IvZHdjMi9oY2RfaW50ci5jIHwgMTUgKysrKysrKy0tLS0t
LS0tDQo+Pj4+PiAgICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlv
bnMoLSkNCj4+Pj4+DQo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMi9oY2RfaW50
ci5jIGIvZHJpdmVycy91c2IvZHdjMi9oY2RfaW50ci5jDQo+Pj4+PiBpbmRleCAwMTQ0Y2E4MzUw
YzMuLjVjNzUzOGQ0OThkZCAxMDA2NDQNCj4+Pj4+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzIvaGNk
X2ludHIuYw0KPj4+Pj4gKysrIGIvZHJpdmVycy91c2IvZHdjMi9oY2RfaW50ci5jDQo+Pj4+PiBA
QCAtMjAxNSwxNSArMjAxNSwxNyBAQCBzdGF0aWMgdm9pZCBkd2MyX2hjX25faW50cihzdHJ1Y3Qg
ZHdjMl9oc290ZyAqaHNvdGcsIGludCBjaG51bSkNCj4+Pj4+ICAgICB7DQo+Pj4+PiAgICAgCXN0
cnVjdCBkd2MyX3F0ZCAqcXRkOw0KPj4+Pj4gICAgIAlzdHJ1Y3QgZHdjMl9ob3N0X2NoYW4gKmNo
YW47DQo+Pj4+PiAtCXUzMiBoY2ludCwgaGNpbnRtc2s7DQo+Pj4+PiArCXUzMiBoY2ludCwgaGNp
bnRyYXcsIGhjaW50bXNrOw0KPj4+Pj4gICAgIA0KPj4+Pj4gICAgIAljaGFuID0gaHNvdGctPmhj
X3B0cl9hcnJheVtjaG51bV07DQo+Pj4+PiAgICAgDQo+Pj4+PiAtCWhjaW50ID0gZHdjMl9yZWFk
bChoc290ZywgSENJTlQoY2hudW0pKTsNCj4+Pj4+ICsJaGNpbnRyYXcgPSBkd2MyX3JlYWRsKGhz
b3RnLCBIQ0lOVChjaG51bSkpOw0KPj4+Pj4gICAgIAloY2ludG1zayA9IGR3YzJfcmVhZGwoaHNv
dGcsIEhDSU5UTVNLKGNobnVtKSk7DQo+Pj4+PiArCWhjaW50ID0gaGNpbnRyYXcgJiBoY2ludG1z
azsNCj4+Pj4+ICsJZHdjMl93cml0ZWwoaHNvdGcsIGhjaW50LCBIQ0lOVChjaG51bSkpOw0KPj4+
Pj4gKw0KPj4+Pj4gICAgIAlpZiAoIWNoYW4pIHsNCj4+Pj4+ICAgICAJCWRldl9lcnIoaHNvdGct
PmRldiwgIiMjIGhjX3B0cl9hcnJheSBmb3IgY2hhbm5lbCBpcyBOVUxMICMjXG4iKTsNCj4+Pj4+
IC0JCWR3YzJfd3JpdGVsKGhzb3RnLCBoY2ludCwgSENJTlQoY2hudW0pKTsNCj4+Pj4+ICAgICAJ
CXJldHVybjsNCj4+Pj4+ICAgICAJfQ0KPj4+Pj4gICAgIA0KPj4+Pj4gQEAgLTIwMzIsMTEgKzIw
MzQsOSBAQCBzdGF0aWMgdm9pZCBkd2MyX2hjX25faW50cihzdHJ1Y3QgZHdjMl9oc290ZyAqaHNv
dGcsIGludCBjaG51bSkNCj4+Pj4+ICAgICAJCQkgY2hudW0pOw0KPj4+Pj4gICAgIAkJZGV2X3Zk
YmcoaHNvdGctPmRldiwNCj4+Pj4+ICAgICAJCQkgIiAgaGNpbnQgMHglMDh4LCBoY2ludG1zayAw
eCUwOHgsIGhjaW50JmhjaW50bXNrIDB4JTA4eFxuIiwNCj4+Pj4+IC0JCQkgaGNpbnQsIGhjaW50
bXNrLCBoY2ludCAmIGhjaW50bXNrKTsNCj4+Pj4+ICsJCQkgaGNpbnRyYXcsIGhjaW50bXNrLCBo
Y2ludCk7DQo+Pj4+PiAgICAgCX0NCj4+Pj4+ICAgICANCj4+Pj4+IC0JZHdjMl93cml0ZWwoaHNv
dGcsIGhjaW50LCBIQ0lOVChjaG51bSkpOw0KPj4+Pj4gLQ0KPj4+Pj4gICAgIAkvKg0KPj4+Pj4g
ICAgIAkgKiBJZiB3ZSBnb3QgYW4gaW50ZXJydXB0IGFmdGVyIHNvbWVvbmUgY2FsbGVkDQo+Pj4+
PiAgICAgCSAqIGR3YzJfaGNkX2VuZHBvaW50X2Rpc2FibGUoKSB3ZSBkb24ndCB3YW50IHRvIGNy
YXNoIGJlbG93DQo+Pj4+PiBAQCAtMjA0Niw4ICsyMDQ2LDcgQEAgc3RhdGljIHZvaWQgZHdjMl9o
Y19uX2ludHIoc3RydWN0IGR3YzJfaHNvdGcgKmhzb3RnLCBpbnQgY2hudW0pDQo+Pj4+PiAgICAg
CQlyZXR1cm47DQo+Pj4+PiAgICAgCX0NCj4+Pj4+ICAgICANCj4+Pj4+IC0JY2hhbi0+aGNpbnQg
PSBoY2ludDsNCj4+Pj4+IC0JaGNpbnQgJj0gaGNpbnRtc2s7DQo+Pj4+PiArCWNoYW4tPmhjaW50
ID0gaGNpbnRyYXc7DQo+Pj4+PiAgICAgDQo+Pj4+PiAgICAgCS8qDQo+Pj4+PiAgICAgCSAqIElm
IHRoZSBjaGFubmVsIHdhcyBoYWx0ZWQgZHVlIHRvIGEgZGVxdWV1ZSwgdGhlIHF0ZCBsaXN0IG1p
Z2h0

