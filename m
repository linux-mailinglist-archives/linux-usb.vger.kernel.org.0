Return-Path: <linux-usb+bounces-3339-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 255FD7F9DE9
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 11:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A05E72813ED
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 10:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3090918AEE;
	Mon, 27 Nov 2023 10:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZD/8kEzU";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XA0SExLY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KSgZGg4C"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D817BE
	for <linux-usb@vger.kernel.org>; Mon, 27 Nov 2023 02:46:53 -0800 (PST)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AR8fOg9020220;
	Mon, 27 Nov 2023 02:46:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=LjEpxHRbyrDgXvPeyQX9XtP8y9uRPW24SZphTzDAb3g=;
 b=ZD/8kEzUq/wL6T2T6LoDowR9ZMfFKelkBZktFF/l01aaMljr311unGCoGcX51KKD0yJJ
 2V7PwOg11ThhE2T4w0f0qk2gcSxe9ugdOMNORRRqs70t50rEZwcTcSMw2R/ua3oQ9MNX
 By4i4T6/Fi7VNabLkCYIoDfPWOcWLTNSP2R/uYZQNxQc7yX/R1w+FOHJjwHA0MlgAlbj
 GDnpX+orTx7+TD8wiMfoquYdqp4U/XGeSSSHbiyFni42Ekf+PI6pGb0s5XydLKw/xrgm
 nT/WyW594AKd+X7c9fxDNRlrddCUFvwYzNTrtJejxJ0l2WMU35vryT2mWsvxCjQD+655 7g== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3ukgekvxbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 02:46:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1701082008; bh=LjEpxHRbyrDgXvPeyQX9XtP8y9uRPW24SZphTzDAb3g=;
	h=From:To:Subject:Date:References:In-Reply-To:From;
	b=XA0SExLYuuTk0QsdL6oiPhJeAeM4n7AGeaGZ4IHZE2zJuz3ewSkenbB7Urrhoj19b
	 CoaZ91VTw51uVrKfA0tbD4zHEGhgVNIh1bGrm71qAfSEcN7/74bPF+nGqst4J04xfN
	 51Z2mjV8zPimnfNG52mmljmfBBK8/G2KAZel5FUUIMEVbo/cClF7/p2ZwwXb9SWT7g
	 IfGFPdMSmdcAytd8cdaq/jjoZp4kdD+Xh7wXW/0o1gAbOPO237azPlTqLnSDsm3Z+2
	 1F1lo5MzPfy26uJyi5VaseTeBPkU4T08Nnd8gs5fxWSyU0hxN/HFyNhOGhPU18j6QZ
	 kzunTxgqAUQ+A==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 71AB740121;
	Mon, 27 Nov 2023 10:46:48 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id EE2FEA0262;
	Mon, 27 Nov 2023 10:46:47 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=KSgZGg4C;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 48A0C400A2;
	Mon, 27 Nov 2023 10:46:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhGClxBYGp4Sm1ekIkSk6ZXF+S7vMUDZtA+rMqhBbKQFqjrwGfQBm42MoeG44kh0tN3unzgBZealo0GH+1N3cE1I/N7m4TrGQ6vPHvysyXOrxMc7tZMFNQuUzU1jW69/JHpFRVwXqEF/8Ox+qfhe4egpQdKFA8fD8pIMmU176POmh1islkb5niBaZIdVX+U80wageaAOa7dWhnVWSWqNrrdPkd7u4d6x4Pcdoc0027Ffgc1hRTGbz+rdThfBkbOVhA+ioXRuWLo+AyQPkgdBhPtzCBpwRpTRsRi3cLGrREpDmie7ED0gOoJtA08UlZrNvMxQuMHHILTGTc83tuiVMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LjEpxHRbyrDgXvPeyQX9XtP8y9uRPW24SZphTzDAb3g=;
 b=KNl4M72nUO7vf8/iKJ2101DuVKnYR9oobnyeo/7Dv/QpLBU2niWZ6g+1JtlDeek5b7RyK7Tt/kP6YWXDL3oO8UAZEMsWafRsDZ0U2+5JzMz+aHQBHTP6LqZLDeRhlvze+onR5H3IJSWnafv8WpgYKf35r8P8TwbuOFi0trJ0wog6uSzP0BFbOXiSukOj5yaARoYdhftCz4K8gKUBA7zPUi9a6rvWKYA1O23RK8U5fRya85khZ9rKaQIOLzUK97XMfPrZ1wTqNow/j0LhKrcR52wXl9w66PssYlsLVXPvvNoIXoI4/wk375vQQAr/I7sE7jN/sfEz1PI4vCtxnfpNQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjEpxHRbyrDgXvPeyQX9XtP8y9uRPW24SZphTzDAb3g=;
 b=KSgZGg4CHyhht4DgNnMJ/qDMhY/0NxpAJ2ms7cOjn5ttiAtx3R4Fwq8XOpwyVshApqG20NjulytuLO8MgmwOr5wC0Vv4SiSvRC06OSqi4pOlYR2K4EW7e4tCmpn2W/+w58XqAPqHj0kwSHp5HOW7lbCv0TNfnEJiOC0mlCGs5cQ=
Received: from BN8PR12MB3395.namprd12.prod.outlook.com (2603:10b6:408:43::18)
 by BL1PR12MB5205.namprd12.prod.outlook.com (2603:10b6:208:308::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Mon, 27 Nov
 2023 10:46:44 +0000
Received: from BN8PR12MB3395.namprd12.prod.outlook.com
 ([fe80::4907:7c95:cd2d:ce5e]) by BN8PR12MB3395.namprd12.prod.outlook.com
 ([fe80::4907:7c95:cd2d:ce5e%7]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 10:46:43 +0000
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
Thread-Index: AQHaF9Jh+M4x1h3P7ECYkgn6i43CXLCGUQGAgAegwICAAByPAA==
Date: Mon, 27 Nov 2023 10:46:43 +0000
Message-ID: <f293d306-54fb-ecb5-4515-70a6c1faf1b1@synopsys.com>
References: <20231115144514.15248-1-oneukum@suse.com>
 <f0bd323a-8384-e303-907f-5d533af6d71e@synopsys.com>
 <ZWRbkdTASTNJB8Fv@apocalypse>
In-Reply-To: <ZWRbkdTASTNJB8Fv@apocalypse>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR12MB3395:EE_|BL1PR12MB5205:EE_
x-ms-office365-filtering-correlation-id: 774c4b10-f787-46a9-b27d-08dbef36252b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9/Iw7WeFy4zh9y+xX1Gslwnqj+oOEKiMwlC4J/t8Bo2MzYlgZ3VZsapUPJuvmLFHy1ESeDHTG8T1w5fhyTxrkqMsxYGNs/aI9CvEXqCOg05a8LPEtECFqdqG2mgKjke8ucDfqkMeu9Iq0/t88ezt8K5SdgKTv52L2m6osd0n5W10spEhOhqA9Lc/JS6yWdPfjJrwHluykRu692LuWwDlY9xOUbHvBGB6FWo4EgukG6GdIza6oFZLanBYR8SEerErTa4N+jjC3OAGvlRhNY2r3Lx1/ndUmAIdTFYagYuhg5Cnp0piYEKg108ruUZ0yusgSufx4e9cKzYXHBxFBJPGvvzFUI8nCX1msYqT/grYq6ziN4OX9lOYqKveTvIx/gzvKfBzKlYZzBt/5AH0d1dc5aVZEnXS0EWk/4dFysDpw73I/Hn1uFGjl09yWKRNENR3bjgqGKF80KVeW+nyJtAHJX90kMjG7xzkG6s3kegmG0wDNZO44dp2vhgN6L7Bbf1lLVQZHTAWT5+afxLlfXoxGWj1X2dNOXmb3PB/fI+o7mEaRGIdy78A2dGR6dnYPLetaMAGzdDPVea7Jd2b+teD5pc+yGtMNty+pYGuBLz/2xw2c41icbv2ujArQcuedjKsWEpfzzE4XHaUPkKtrGabj2LSeTpVaanuQ0KfCs5aZhq+6auBpTa16UrFZqUJb62e
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB3395.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(39860400002)(396003)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(36756003)(38100700002)(38070700009)(41300700001)(31686004)(2906002)(122000001)(83380400001)(5660300002)(64756008)(26005)(86362001)(2616005)(6506007)(53546011)(8936002)(8676002)(71200400001)(31696002)(6512007)(6486002)(478600001)(66476007)(110136005)(66446008)(66946007)(66556008)(91956017)(76116006)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VTEzVzRjNHZoWU1aM1RBVEN3Y2lTWmFIMWxpZTFQcUREL1lrRWlSMmk0OHQ5?=
 =?utf-8?B?ejZ2bW94VWZYZFJDdEJOOHkza2VLLzFweXE5a0ZXT2pwU2xQeG8wY045WVd5?=
 =?utf-8?B?K2JPQTYwY2ZhbTJYVFc1NTd4T3VNdnN5TUc2ZktpaXlXREQ3MHBTSlFyLzZY?=
 =?utf-8?B?L0lvK0FONlRyOTlpMzFVVmFFbzBxY09waWJ1T3Bub3hDR21sTEJuaHlsSkFz?=
 =?utf-8?B?RG5CMERlREdNUUh1Qjd5U0lsTXhIakFNbDNOcVdhWWJPaDZtZVc1TE1NMnZC?=
 =?utf-8?B?TDFCc2xBd1VjcUNpcVcwdGticHlodjZRZmFnbm5BbTVWQ3h5SDd0UUZ5eGZY?=
 =?utf-8?B?b0dqYWhtdmtJMmdNY2RDRmhyMXhBc2IxVzBiVnZYSk5WV2Vxajc1RnlOME5y?=
 =?utf-8?B?R0c1dWEyMGt2ZHo4dERwYUpnSHhuWUVkc21wNUgzTm1lTTdvQTVDUUxjMmlH?=
 =?utf-8?B?WFIyRXlES2k0VFVUUFpyeWwraFB4eWFnd1c1cUkvZkp0QklvaERhb1BmYzRm?=
 =?utf-8?B?L0tRRnFXK2xiakM4b054OEZOR0V6d2tUT1lPWUQwUVVGOFpRKzRNS3VpV1BB?=
 =?utf-8?B?TFZZSE1GVHN3Sk5YZlppc2ptN3Bzc3k1Vmg0RVJhYWY5am1MME16eTVFZEwy?=
 =?utf-8?B?d3B2M0JyMU41TXV6R2greVRRUCs1YzFWVXlWNGJQVE5wSC9sWmJaWm1aWFBO?=
 =?utf-8?B?VHVqWnI1b2JIc3BFT0ZNcE91WjJMeklLcDVEcUlORVllc1Q2Tmo3a25yVGhi?=
 =?utf-8?B?YWtKbUxLVGpVYzJiWHhlZ1QzcXZRNlBmUWpZZ2ZCU1VNdE9ROWcrVFZGaEJq?=
 =?utf-8?B?WHp5VTExWWtTNTNYRlUxMzFZam1iZG9STFB0RXlxVGUxR08rbmxwTkRpMDRo?=
 =?utf-8?B?ZmY2TXl1QmVFTlJIdVBVaHJUU2RsRDIzQTFaa0ZzZjd4V3JXVytYYWxoOVpx?=
 =?utf-8?B?Qllka1pMSkl1K3U4Qm05U3owNW5PenkrSUpraFY5YmtsYkhrR0txbDdRQitq?=
 =?utf-8?B?Z1FKa3M5TWIwODNWRzJCUHN6WkNKdld3MThrLzhBaXFKSm45bFRFRndXVUdR?=
 =?utf-8?B?MEpCa1h0WHRBM1BwdFQwdDlTSEwweUc1SmYrTjgyMzJGN01xc3JmSVFlVk5r?=
 =?utf-8?B?V21pWlkrSmNvcHp4bTBTd25MdWpjMW4yMGhXQzdSM1llVTZsdEZQeHRpWjds?=
 =?utf-8?B?M3BlNnZ5QWlNTEF4ajZnQ3RoWWp1aEZ5Mm9uN2dxWjhHVk9iVjA0U2hoWmRo?=
 =?utf-8?B?ME1ueGpRcVRJRkREMVVNSVA0YldZYkZLc0NjMytrYktrR1psTGFCeko0aG5v?=
 =?utf-8?B?UlhGdUR4bVBmV2Ryc0RwZTBwZFp5cEcrNnZjYjVwTTNNODVtckkxOHJHaGI3?=
 =?utf-8?B?aUxTRkVxdXJJTEYyOTBwOHlBdHJLcmhpRUtYRWhHRzdHL0RtaHRvSFo2NG4v?=
 =?utf-8?B?cUxXYlVELytSSHlIMWw1V2J1b3k0WEkycnNuZFE5WWZBNjVWdHlmemZKMFhY?=
 =?utf-8?B?THY1T2VLR1d6clljWWZ5VjUzUVFUdEpOUmZMckl1clNaUHdRK1lXdDZJTzRl?=
 =?utf-8?B?OW10dis4aE1ERUlkd1dqUFhLSmY2WDNHQ3QwekRpcnlsY3Z2YlptcDc5Nm5L?=
 =?utf-8?B?T0QreGNzNGhEZUJWbFZjZE0wNXk2RkhGM0FSRks0K1RsbzVqbk94YlM2ZFgy?=
 =?utf-8?B?Yko0SmhhVXk5QnZteCtQamxDeksxMFRkZk1TdDJkemxzVXhBRE4zRHBEOTdJ?=
 =?utf-8?B?S0F3MkhrSXVOYmpBSEhIRWg3L29tb3dDcmR0MW93Y2tHRFE1SktndlBQSmgz?=
 =?utf-8?B?R01YeEZSK0ZtUzgvelVZaU0rVDJITGVNZ1hVVUxFUGZ1aHp0MmRLS3RCaGM2?=
 =?utf-8?B?VUpiQ3ltZXpzTm5hTE5yeVIyTk9UR1VwQ3YxVk1nYm5HSSt6VG1FL0NlU29z?=
 =?utf-8?B?YVlTQ0pBdG1jc0RXNkdYQkViUmd6VU1pUUpyOURzbXVFMFFjd3k4cUlnd21V?=
 =?utf-8?B?L3FTdmttK2RZUXJzU1lYNzJ5cXdiODhxMFZkK2xLeFFHQXJ1ZW45SGFTRlpX?=
 =?utf-8?B?YjRaSThyalpyZUhxWUx0aVpBZ2gwRlpXOWphd0JUcjlnTEl4NFdKSlI1em5L?=
 =?utf-8?Q?bqKi4bsXZtK2ayAEYGCRFKAbd?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <570EF77D645BAC4DB83532790F9EBC7C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	hHanJWDwqNjAoFIfui0fz9+clBRoWVQneeCYwU+N4nW+Ug/DwshiQzpTykQ0OxqPlyeAZi0AaZUYrE3AVH18q0QxjJU74NDT9MYG7+5qLkkJWgJ+3gBP6QAZpFthTYdIHxer1j/w7LD2bQatWMoNsSXDKuGJuqlLOfBD0NbbBDJblIbiQPI8V6QI2bkkjkpEK7B8EX//TUveSLGFO/WarHu/PoSaz7J1m6uYN6Q0wqrFrJVvX7Cc2X6yjRBGqPSrapg8Z5a0F1DBpnk/ZCpD6z4f9R1Q96ZzfUrHSsxBeakusH1wMl8rlhhKD0ybrOHJSMchaOiNtI5PLOMkRT7Xyj2zuay6TPTqZ7/SK/wP9Hiy4zc3jKyKjyQOzVJhY2f6cHYYOjVyUlWooq1Tv922wuZ/I+xNdvR2GBk+O3mDcwYephd4yA5HrU9QJm45Ks4Nz+WOeg/rdhHBmrv1+BdIe+2sii3AJCZncirBP15WfL8TxB49WSvdUihVR7gaU43ymW+zmqj2/5IUzCR3XRoBCNW2t4lo83r20R4fCROphh0iqjGiyyeq+KtSvxiocNBXkbAG6p/CtIkq5upjotcyv/mTriso8CBKdtEgowl+KXo9FRpKnLu38EOcaxrlhl31u0TqUcWv1ED3tSzTdwPsSE4bKMd0DmHA4mONDvxEiDLQhxBTI6MWEUOPR3QiVvyS1Ys68VhLA3LAtYao4gQ61+GdX0E9VA0xDE8lI7es6180WS8iSpEl6VOga6IfK65n9dHaViVKzbaw6tvA6QbBG58R3qFjQR64QDleV0Djv6gppUdRyawOaPWD7xHStLhBfS8Mz1A0XhsglSGg/BOiRlBSKC/JcYYMznBbhjPKLFAJTTbUjpWV0OdJs4Xk1Ekj
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3395.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 774c4b10-f787-46a9-b27d-08dbef36252b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 10:46:43.3476
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3CDHYj080q9HqvinUp0itCJO+uRhfC09QgItYssKARBUNNJv4pw6Jx/lj1bnI7RTENG5JrVh1yqaO6WhuatWLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5205
X-Proofpoint-ORIG-GUID: SqJi54vHs6dSz-Sh7meJAmZikgKAMUSs
X-Proofpoint-GUID: SqJi54vHs6dSz-Sh7meJAmZikgKAMUSs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_09,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=567 mlxscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311270072

SGkgQW5kcmVhLA0KDQpPbiAxMS8yNy8yMyAxMzowNCwgQW5kcmVhIGRlbGxhIFBvcnRhIHdyb3Rl
Og0KPiBPbiAxMjozNSBXZWQgMjIgTm92ICAgICAsIE1pbmFzIEhhcnV0eXVueWFuIHdyb3RlOg0K
Pj4gSGkgT2xpdmVyLA0KPj4NCj4+IE9uIDExLzE1LzIzIDE4OjQ1LCBPbGl2ZXIgTmV1a3VtIHdy
b3RlOg0KPj4+IGR3YzJfaGNfbl9pbnRyKCkgd3JpdGVzIGJhY2sgSU5UTUFTSyBhcyByZWFkIGJ1
dCBldmFsdWF0ZXMgaXQNCj4+PiB3aXRoIGludG1hc2sgYXBwbGllZC4gSW4gc3RyZXNzIHRlc3Rp
bmcgdGhpcyBjYXVzZXMgc3B1cmlvdXMNCj4+PiBpbnRlcnJ1cHRzIGxpa2UgdGhpczoNCj4+Pg0K
Pj4+IFtNb24gQXVnIDE0IDEwOjUxOjA3IDIwMjNdIGR3YzIgM2Y5ODAwMDAudXNiOiBkd2MyX2hj
X2NoaGx0ZF9pbnRyX2RtYTogQ2hhbm5lbCA3IC0gQ2hIbHRkIHNldCwgYnV0IHJlYXNvbiBpcyB1
bmtub3duDQo+Pj4gW01vbiBBdWcgMTQgMTA6NTE6MDcgMjAyM10gZHdjMiAzZjk4MDAwMC51c2I6
IGhjaW50IDB4MDAwMDAwMDIsIGludHN0cyAweDA0NjAwMDAxDQo+Pj4gW01vbiBBdWcgMTQgMTA6
NTE6MDggMjAyM10gZHdjMiAzZjk4MDAwMC51c2I6IGR3YzJfaGNfY2hobHRkX2ludHJfZG1hOiBD
aGFubmVsIDAgLSBDaEhsdGQgc2V0LCBidXQgcmVhc29uIGlzIHVua25vd24NCj4+PiBbTW9uIEF1
ZyAxNCAxMDo1MTowOCAyMDIzXSBkd2MyIDNmOTgwMDAwLnVzYjogaGNpbnQgMHgwMDAwMDAwMiwg
aW50c3RzIDB4MDQ2MDAwMDENCj4+PiBbTW9uIEF1ZyAxNCAxMDo1MTowOCAyMDIzXSBkd2MyIDNm
OTgwMDAwLnVzYjogZHdjMl9oY19jaGhsdGRfaW50cl9kbWE6IENoYW5uZWwgNCAtIENoSGx0ZCBz
ZXQsIGJ1dCByZWFzb24gaXMgdW5rbm93bg0KPj4+IFtNb24gQXVnIDE0IDEwOjUxOjA4IDIwMjNd
IGR3YzIgM2Y5ODAwMDAudXNiOiBoY2ludCAweDAwMDAwMDAyLCBpbnRzdHMgMHgwNDYwMDAwMQ0K
Pj4+IFtNb24gQXVnIDE0IDEwOjUxOjA4IDIwMjNdIGR3YzIgM2Y5ODAwMDAudXNiOiBkd2MyX3Vw
ZGF0ZV91cmJfc3RhdGVfYWJuKCk6IHRyaW1taW5nIHhmZXIgbGVuZ3RoDQo+Pj4NCj4+PiBBcHBs
eWluZyBJTlRNQVNLIHByZXZlbnRzIHRoaXMuIFRoZSBpc3N1ZSBleGlzdHMgaW4gYWxsIHZlcnNp
b25zIG9mIHRoZQ0KPj4+IGRyaXZlci4NCj4+DQo+PiBJJ20gT2sgd2l0aCB0aGlzIHBhdGNoLCBq
dXN0IG5lZWQgc29tZSBlbGFib3JhdGlvbi4NCj4+IFNvLCBjaGFubmVsIGhhbHRlZCBpbnRlcnJ1
cHQgYXNzZXJ0ZWQgZHVlIHRvIHNvbWUgb3RoZXIgaW50ZXJydXB0IChBSEINCj4+IEVycm9yLCBF
eGNlc3NpdmUgdHJhbnNhY3Rpb24gZXJyb3JzLCBCYWJibGUsIFN0YWxsKSB3aGljaCB3YXMgbWFz
a2VkLg0KPj4gQ2FuIHlvdSBjaGVjayB3aGljaCBvZiBtYXNrZWQgaW50ZXJydXB0cyBpcyBjYXVz
ZSBvZiBjaGFubmVsIGhhbHQgaW50ZXJydXB0Pw0KPj4NCj4+IFRoYW5rcywNCj4+IE1pbmFzDQo+
Pg0KPiANCj4gSGkgTWluYXMsDQo+IGhlcmUncyB0aGUgcmVwb3J0IGZyb20gZG1lc2c6DQo+IA0K
PiBbMjA5Mzg0LjIzODcyNF0gICBoY2ludCAweDAwMDAwMDEyLCBoY2ludG1zayAweDAwMDAwMDA2
LCBoY2ludCZoY2ludG1zayAweDAwMDAwMDAyDQo+IFsyMDkzODQuMjQ2NzI1XSAgIGhjaW50IDB4
MDAwMDAwMTIsIGhjaW50bXNrIDB4MDAwMDAwMDYsIGhjaW50JmhjaW50bXNrIDB4MDAwMDAwMDIN
Cj4gWzIwOTM4NC4yNDc2MzRdICAgaGNpbnQgMHgwMDAwMDAwMywgaGNpbnRtc2sgMHgwMDAwMDAw
NiwgaGNpbnQmaGNpbnRtc2sgMHgwMDAwMDAwMg0KPiBbMjA5Mzg0LjI1NDcyMl0gICBoY2ludCAw
eDAwMDAwMDEyLCBoY2ludG1zayAweDAwMDAwMDA2LCBoY2ludCZoY2ludG1zayAweDAwMDAwMDAy
DQo+IFsyMDkzODQuMjYyNzI1XSAgIGhjaW50IDB4MDAwMDAwMTIsIGhjaW50bXNrIDB4MDAwMDAw
MDYsIGhjaW50JmhjaW50bXNrIDB4MDAwMDAwMDINCj4gWzIwOTM4NC4yNzA3MjRdICAgaGNpbnQg
MHgwMDAwMDAxMiwgaGNpbnRtc2sgMHgwMDAwMDAwNiwgaGNpbnQmaGNpbnRtc2sgMHgwMDAwMDAw
Mg0KPiBbMjA5Mzg0LjI3ODMzNl0gICBoY2ludCAweDAwMDAwMDkyLCBoY2ludG1zayAweDAwMDAw
MDA2LCBoY2ludCZoY2ludG1zayAweDAwMDAwMDAyDQo+IFsyMDkzODQuMjc4Mzg0XSAgIGhjaW50
IDB4MDAwMDAwMTAsIGhjaW50bXNrIDB4MDAwMDA0MzYsIGhjaW50JmhjaW50bXNrIDB4MDAwMDAw
MTANCj4gWzIwOTM4NC4yNzg3MjBdICAgaGNpbnQgMHgwMDAwMDAxMiwgaGNpbnRtc2sgMHgwMDAw
MDAwNiwgaGNpbnQmaGNpbnRtc2sgMHgwMDAwMDAwMg0KPiBbMjA5Mzg0LjI4NjcyM10gICBoY2lu
dCAweDAwMDAwMDEyLCBoY2ludG1zayAweDAwMDAwMDA2LCBoY2ludCZoY2ludG1zayAweDAwMDAw
MDAyDQo+IFsyMDkzODQuMjg4NDg2XSAgIGhjaW50IDB4MDAwMDAwMjEsIGhjaW50bXNrIDB4MDAw
MDA0MjYsIGhjaW50JmhjaW50bXNrIDB4MDAwMDAwMjANCg0KPiBbMjA5Mzg0LjI4ODUxMV0gICBo
Y2ludCAweDAwMDAwMDAyLCBoY2ludG1zayAweDAwMDAwNDA2LCBoY2ludCZoY2ludG1zayAweDAw
MDAwMDAyDQpBY2NvcmRpbmcgeW91ciBwYXRjaCB0ZXJtaW5vbG9neSBhYm92ZSAnaGNpbnQnIGlz
IGEgJ2hjaW50cmF3JyBhbmQgaGVyZSANCmFzc2VydGVkIG9ubHkgY2hhbm5lbCBoYWx0ZWQgaW50
ZXJydXB0LiBTbywgY2hhbm5lbCBoYWx0ZWQgd2l0aG91dCBhbnkgDQpyZWFzb24uIE5vdCBjbGVh
ciBob3cgeW91ciBwYXRjaCBmaXggdGhpcyBjYXNlPw0KDQpDb3VwbGUgb2YgcXVlc3Rpb25zIHJl
bGF0ZWQgdG8geW91ciB0ZXN0czoNCjEuIFdoaWNoIERNQSBtb2RlIHVzZWQgaGVyZSAtIGJ1ZmZl
ciBvciBkZXNjcmlwdG9yIERNQT8NCjIuIFdoaWNoIHR5cGUgb2YgdHJhbnNmZXJzIHRlc3Rpbmc/
IE9yIHlvdSBjYW4gYWRkIHRvIHRoaXMgcHJpbnQgSENDSEFSeCANCmFsc28uDQozLiBXaGljaCB2
ZXJzaW9uIG9mIGNvcmUgeW91IHVzZSAoR1NOUFNJRCk/DQoNClRoYW5rcywNCk1pbmFzDQoNCj4g
WzIwOTM4NC4yODg1MjhdIGR3YzIgM2Y5ODAwMDAudXNiOiBkd2MyX2hjX2NoaGx0ZF9pbnRyX2Rt
YTogQ2hhbm5lbCAxIC0gQ2hIbHRkIHNldCwgYnV0IHJlYXNvbiBpcyB1bmtub3duDQoNCj4gWzIw
OTM4NC4yODg2MDRdICAgaGNpbnQgMHgwMDAwMDAxMCwgaGNpbnRtc2sgMHgwMDAwMDQzNiwgaGNp
bnQmaGNpbnRtc2sgMHgwMDAwMDAxMA0KPiBbMjA5Mzg0LjI5NDcyMF0gICBoY2ludCAweDAwMDAw
MDEyLCBoY2ludG1zayAweDAwMDAwMDA2LCBoY2ludCZoY2ludG1zayAweDAwMDAwMDAyDQo+IFsy
MDkzODQuMzAyNzM0XSAgIGhjaW50IDB4MDAwMDAwMTIsIGhjaW50bXNrIDB4MDAwMDAwMDYsIGhj
aW50JmhjaW50bXNrIDB4MDAwMDAwMDINCj4gWzIwOTM4NC4zMTA3MjRdICAgaGNpbnQgMHgwMDAw
MDAxMiwgaGNpbnRtc2sgMHgwMDAwMDAwNiwgaGNpbnQmaGNpbnRtc2sgMHgwMDAwMDAwMg0KPiBb
MjA5Mzg0LjMxODcyMV0gICBoY2ludCAweDAwMDAwMDEyLCBoY2ludG1zayAweDAwMDAwMDA2LCBo
Y2ludCZoY2ludG1zayAweDAwMDAwMDAyDQo+IFsyMDkzODQuMzIxNzIyXSAgIGhjaW50IDB4MDAw
MDAwMTIsIGhjaW50bXNrIDB4MDAwMDAwMDYsIGhjaW50JmhjaW50bXNrIDB4MDAwMDAwMDINCj4g
WzIwOTM4NC4zMjY3MjldICAgaGNpbnQgMHgwMDAwMDAxMiwgaGNpbnRtc2sgMHgwMDAwMDAwNiwg
aGNpbnQmaGNpbnRtc2sgMHgwMDAwMDAwMg0KPiANCj4gDQo+IE1hbnkgdGhhbmtzLA0KPiBBbmRy
ZWENCj4gDQo+IA0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogT2xpdmVyIE5ldWt1bSA8b25ldWt1
bUBzdXNlLmNvbT4NCj4+PiBUZXN0ZWQtYnk6IEl2YW4gSXZhbm92IDxpdmFuLml2YW5vdkBzdXNl
LmNvbT4NCj4+PiBUZXN0ZWQtYnk6IEFuZHJlYSBkZWxsYSBQb3J0YSA8YW5kcmVhLnBvcnRhQHN1
c2UuY29tPg0KPj4+IC0tLQ0KPj4+ICAgIGRyaXZlcnMvdXNiL2R3YzIvaGNkX2ludHIuYyB8IDE1
ICsrKysrKystLS0tLS0tLQ0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyks
IDggZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMi9o
Y2RfaW50ci5jIGIvZHJpdmVycy91c2IvZHdjMi9oY2RfaW50ci5jDQo+Pj4gaW5kZXggMDE0NGNh
ODM1MGMzLi41Yzc1MzhkNDk4ZGQgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMi9o
Y2RfaW50ci5jDQo+Pj4gKysrIGIvZHJpdmVycy91c2IvZHdjMi9oY2RfaW50ci5jDQo+Pj4gQEAg
LTIwMTUsMTUgKzIwMTUsMTcgQEAgc3RhdGljIHZvaWQgZHdjMl9oY19uX2ludHIoc3RydWN0IGR3
YzJfaHNvdGcgKmhzb3RnLCBpbnQgY2hudW0pDQo+Pj4gICAgew0KPj4+ICAgIAlzdHJ1Y3QgZHdj
Ml9xdGQgKnF0ZDsNCj4+PiAgICAJc3RydWN0IGR3YzJfaG9zdF9jaGFuICpjaGFuOw0KPj4+IC0J
dTMyIGhjaW50LCBoY2ludG1zazsNCj4+PiArCXUzMiBoY2ludCwgaGNpbnRyYXcsIGhjaW50bXNr
Ow0KPj4+ICAgIA0KPj4+ICAgIAljaGFuID0gaHNvdGctPmhjX3B0cl9hcnJheVtjaG51bV07DQo+
Pj4gICAgDQo+Pj4gLQloY2ludCA9IGR3YzJfcmVhZGwoaHNvdGcsIEhDSU5UKGNobnVtKSk7DQo+
Pj4gKwloY2ludHJhdyA9IGR3YzJfcmVhZGwoaHNvdGcsIEhDSU5UKGNobnVtKSk7DQo+Pj4gICAg
CWhjaW50bXNrID0gZHdjMl9yZWFkbChoc290ZywgSENJTlRNU0soY2hudW0pKTsNCj4+PiArCWhj
aW50ID0gaGNpbnRyYXcgJiBoY2ludG1zazsNCj4+PiArCWR3YzJfd3JpdGVsKGhzb3RnLCBoY2lu
dCwgSENJTlQoY2hudW0pKTsNCj4+PiArDQo+Pj4gICAgCWlmICghY2hhbikgew0KPj4+ICAgIAkJ
ZGV2X2Vycihoc290Zy0+ZGV2LCAiIyMgaGNfcHRyX2FycmF5IGZvciBjaGFubmVsIGlzIE5VTEwg
IyNcbiIpOw0KPj4+IC0JCWR3YzJfd3JpdGVsKGhzb3RnLCBoY2ludCwgSENJTlQoY2hudW0pKTsN
Cj4+PiAgICAJCXJldHVybjsNCj4+PiAgICAJfQ0KPj4+ICAgIA0KPj4+IEBAIC0yMDMyLDExICsy
MDM0LDkgQEAgc3RhdGljIHZvaWQgZHdjMl9oY19uX2ludHIoc3RydWN0IGR3YzJfaHNvdGcgKmhz
b3RnLCBpbnQgY2hudW0pDQo+Pj4gICAgCQkJIGNobnVtKTsNCj4+PiAgICAJCWRldl92ZGJnKGhz
b3RnLT5kZXYsDQo+Pj4gICAgCQkJICIgIGhjaW50IDB4JTA4eCwgaGNpbnRtc2sgMHglMDh4LCBo
Y2ludCZoY2ludG1zayAweCUwOHhcbiIsDQo+Pj4gLQkJCSBoY2ludCwgaGNpbnRtc2ssIGhjaW50
ICYgaGNpbnRtc2spOw0KPj4+ICsJCQkgaGNpbnRyYXcsIGhjaW50bXNrLCBoY2ludCk7DQo+Pj4g
ICAgCX0NCj4+PiAgICANCj4+PiAtCWR3YzJfd3JpdGVsKGhzb3RnLCBoY2ludCwgSENJTlQoY2hu
dW0pKTsNCj4+PiAtDQo+Pj4gICAgCS8qDQo+Pj4gICAgCSAqIElmIHdlIGdvdCBhbiBpbnRlcnJ1
cHQgYWZ0ZXIgc29tZW9uZSBjYWxsZWQNCj4+PiAgICAJICogZHdjMl9oY2RfZW5kcG9pbnRfZGlz
YWJsZSgpIHdlIGRvbid0IHdhbnQgdG8gY3Jhc2ggYmVsb3cNCj4+PiBAQCAtMjA0Niw4ICsyMDQ2
LDcgQEAgc3RhdGljIHZvaWQgZHdjMl9oY19uX2ludHIoc3RydWN0IGR3YzJfaHNvdGcgKmhzb3Rn
LCBpbnQgY2hudW0pDQo+Pj4gICAgCQlyZXR1cm47DQo+Pj4gICAgCX0NCj4+PiAgICANCj4+PiAt
CWNoYW4tPmhjaW50ID0gaGNpbnQ7DQo+Pj4gLQloY2ludCAmPSBoY2ludG1zazsNCj4+PiArCWNo
YW4tPmhjaW50ID0gaGNpbnRyYXc7DQo+Pj4gICAgDQo+Pj4gICAgCS8qDQo+Pj4gICAgCSAqIElm
IHRoZSBjaGFubmVsIHdhcyBoYWx0ZWQgZHVlIHRvIGEgZGVxdWV1ZSwgdGhlIHF0ZCBsaXN0IG1p
Z2h0

