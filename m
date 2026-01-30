Return-Path: <linux-usb+bounces-32934-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODdjMpNyfGmAMwIAu9opvQ
	(envelope-from <linux-usb+bounces-32934-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 09:57:55 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 78254B8ABB
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 09:57:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17A8630166E4
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 08:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02CA1314D3D;
	Fri, 30 Jan 2026 08:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="EA+cxwJj"
X-Original-To: linux-usb@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023139.outbound.protection.outlook.com [40.107.162.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32AD308F33;
	Fri, 30 Jan 2026 08:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769763468; cv=fail; b=phqaoYA7qjtUeMdyVTukzpUy7AcFwmbuvRFQZX0aK0aZB3zY5kdWePS9ohBsyjrOujNnHtLpKgJWiqo/vvWs2t3oV33QpxGAzmV8uppdRf4i7qwfOvBze1IfloAceF5NtLP84QtRAuh0j16pcWuuzKHbVXa0aCu4SlF9jNCTLLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769763468; c=relaxed/simple;
	bh=AS/tc1UsUdo9m+C8c5lhS4C3+jrR7HX82VBdg9319VE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L5lz+KG4gnI4r5JG84FNVApHLO+ox713CsfKpkhEqe63m6CiPDNd0rpINqa/oO9i+eW8oq4c91YeRct1zli3Fjt6sLwOTq+HN0x3ZIXdZhcY+sawP202hIaGK1HLIOf77JHfepYGAnUn4w0rluGzn+fJ/5WTmweSDRWBzAvrEo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=EA+cxwJj; arc=fail smtp.client-ip=40.107.162.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hqSEOswf3EnzRgJbc/TiklxzsKmEhbS8dp67dFZ3Uu+z2Wgia48y4JlaLWtQak35gOUCt8Mxeq/DtfJhrnzpOam8o870LptJ4pHI6AwBufpjzjrkzO/QAPkYjqRWI0/CEkmNAzHaEjcqmkw/wuH64dmsMzeW658zMPQsGcsL1P4zPitipJaJ+RNQtpP84tRm6k66HQ2Ie5JRHL09eyDBlRg+I9uSJItALcFeh7L+VXyzI4dJutovt/ndRNPrj1vE3/+QVN+X23LBGQ33FD9FTIXGImc/eG6WfrQ/F30L/h7tfcMgFPamCcmf3L8fz4lh9GyZqPbsft4DZxfQZrNyrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AS/tc1UsUdo9m+C8c5lhS4C3+jrR7HX82VBdg9319VE=;
 b=bS9jt8R61ZPbTfVJSmNU1lSDJZ9avizRsqKeklenXukaQvtD5AKQnod1YiJasjYCfpeSmtWyBSOakH4i0J+QesjpNMfkKfWT4bghNDeRTcIFIYpJqj20NwcG9Prqttn0/VrYZyReAjbsbr/TxepayQ48C16bOsRB/aj49pebLSxOa51g//1qv+kbjlI6s9Q7cbneh2xD1ZpBMdmMWYhmuDqKCdGWxUatZqQG1QtxCYhqLLqUKUQ9oexGNI0AxJmchlP7caRObF90AybMFTrzoSQorDwLSpCacKdLa+BRBi2RtsvJwNVnGEZ5rI3QzrogEO0Gl9CthmKCi2byU+yiIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AS/tc1UsUdo9m+C8c5lhS4C3+jrR7HX82VBdg9319VE=;
 b=EA+cxwJj7K+6r0ezATr5a5M6mNzRLuX4g8Vn5KkOtCY/QXOcIQtW2C5q2gNA88OPeSVn1RUELNeIKk5vSkZNKubl6+2UOt0zNKw5EgklqQ/7QyL6zx8CbOGTFJA4ysHbswdAZNXezPlsUCFzu9YsyZn+nrzi2irJyrSUMSqv1Krwf7Yia6SUZBHZe6wtor+222Cuj5QDP7mj0wWBrMOzHSPuU4ABQceX477Ex1zer8dz8Z7RtCIfxsXYrY6XTjFoL1Zwai/5kp5eT8OPJaEj6cvdx76CeY0h4D6lbu+QISqRYUfRs2fLWa/iT1se4umnGAZQkf6MsoRvzrKHFOFoAQ==
Received: from DU0P195MB2325.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:425::22)
 by PAWP195MB2468.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:34e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 30 Jan
 2026 08:57:41 +0000
Received: from DU0P195MB2325.EURP195.PROD.OUTLOOK.COM
 ([fe80::a5a9:5513:e1a:f50f]) by DU0P195MB2325.EURP195.PROD.OUTLOOK.COM
 ([fe80::a5a9:5513:e1a:f50f%6]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 08:57:41 +0000
From: Jan Remmet <J.Remmet@phytec.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Krishna Kurapati
	<krishna.kurapati@oss.qualcomm.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>
Subject: Re: [PATCH v2] usb: typec: hd3ss3220: Check if regulator needs to be
 switched
Thread-Topic: [PATCH v2] usb: typec: hd3ss3220: Check if regulator needs to be
 switched
Thread-Index: AQHcj58dCo+SxgdxJ0KjxMsMkvGhL7VqbbyA
Date: Fri, 30 Jan 2026 08:57:41 +0000
Message-ID: <2d8f5ecb-111f-4d67-8165-3f8d18c5ad1f@phytec.de>
References:
 <20260127-wip-jremmet-hd3ss3220_vbus_split-v2-1-f615d4e88634@phytec.de>
 <2026012728-figurine-cheesy-5e9e@gregkh>
In-Reply-To: <2026012728-figurine-cheesy-5e9e@gregkh>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0P195MB2325:EE_|PAWP195MB2468:EE_
x-ms-office365-filtering-correlation-id: 845b0de7-5d53-48da-43a0-08de5fdda023
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?SDZrM3ZoUnIxWjEwZHBqS2tEdlNyYXNkak9LN1JVYU5DQUtLL3lya2lMY1BR?=
 =?utf-8?B?dVdLZExFd2JtM0h3VGE2cnV2c2phNk1NVDduNUIxakJWalYxTzBobnFYdzJp?=
 =?utf-8?B?eW4rSmxXRlZjZzEySTBzRlhrWVFIQzcvMVlONy9qbXFmRnVCUzJnaTdTNzU0?=
 =?utf-8?B?Y3k5N0ZZd1F2eW8ydzNUdjR1b3pqdjh6RERpb281UEtaMjhEdHlmbW5PTjdY?=
 =?utf-8?B?Ymtob1BBZTkvVzN2bCtHVnYrcWt2MkNvdmhOM3pIMlMyQkVjb3R1MjRvWGJk?=
 =?utf-8?B?WXRmNWNKOHBvaEFtbm9URTNnOGR6N1RKd2dDZkg4WlErMXRpb3JIVS8xbGJ0?=
 =?utf-8?B?NjQ2cGFjTS9PUWY1RTRIeU9lVUtXWmFXaEZOYlloMmVQRzVmTk41TmZLdkRU?=
 =?utf-8?B?TXp4UFJEenI1V2pabDVtT1VhMWJVTm04c1Y3TzM4Nng2K0haU09Sdkl4T1Rn?=
 =?utf-8?B?cXFjUG1nZmRxVlk5dGdrVng3bzdackpOeEtHbHdDdnZmOVg4WFNhSlhqaU02?=
 =?utf-8?B?QmE1RzBxYkI5Mkd0Z2w5QUNReU9idTlMVVgxUDJYanFJMW40b3ZxbkFISUVQ?=
 =?utf-8?B?d05QS1FZeXBYb2d3cEIrUFNMQ2RMOTcwbHMzSCs2ZkVndHd3Zi9Hd3hOQzJr?=
 =?utf-8?B?TDFTMmVrY25zRzlYSC9iUG5JZU0zb0cvVCttaVRJZEFEUnU3REloNyt3TGdC?=
 =?utf-8?B?aHpwbG9XYlhwZTUzRlRFbEtWVzhEZWdxV3NTNTFqdzFJZ0Q5b0RwUkh3ZDlF?=
 =?utf-8?B?cjNvZzl3OHdrcWRNU2FXY0tIbHo5ZFFLVzBnUFN5eWRJa1NCN3NXK0t6UVdz?=
 =?utf-8?B?aXpsWTV5azVYTmJONUtqdGR4d0ZodWFEWXpPdXN2UHZ2WmdndTdWMkV4RC92?=
 =?utf-8?B?RGRiUHAvYnh1aUdSZnVyUlhjVkhJOURIY05DSEx4NE5KL2szNWxOZGxOZ0Rt?=
 =?utf-8?B?UEVKZytleUFyUFlkSzNNUGRTeGkxUTVGL2JnTnZDY2Ivc3RCK1B3MktpcU5O?=
 =?utf-8?B?UHJhN29qbWN4bnl5STR0THgzeS9PM0UrMWRlWnhjSHJiOFRGeExOSUZzNlVo?=
 =?utf-8?B?clh0elFZRUt2TmZnYnN1SStGbDFLS3lJL2xOSTErRlRxcVFsYWRoM2FvdllV?=
 =?utf-8?B?Q09LR3UzSnVmWkd1cUwrS21jcWJPMlNIV1NZZmQxMWo4cGp0Z0RvK2hiREtU?=
 =?utf-8?B?cTVKQ0x5SUp0dzg5MlQvdnhXOUpuUTZ1Z0pLbVgyYkZwMTg4bFlOTFR0ODFS?=
 =?utf-8?B?WEwyWE5yWUYwM1ZtZXVBWERBcXZNdUJPRWtsbGswL0s2K0IwVkxQbEp0TUZC?=
 =?utf-8?B?Wlp2WmNmN1cwbVFzWGZqTkdQWC9XWHRQMk1vdUJZRUVFVEtTWnlXVXphaWk2?=
 =?utf-8?B?R0hPLzZSNWxCUkZ0OGZzU1ZSZnZXWk96ZDY3NE5KNk1rdFlIQzJCcjdTZDhp?=
 =?utf-8?B?cUdKQlpBT1BOVTMwbnBqbmtNOE1aa0ZOWXNoeFZsa2RuWnk5aHFiWHNpSUl4?=
 =?utf-8?B?aWNPT3R4TTkxZlh5Yy9Fc1FmREsrd2sva1dSbHI4aW84dTA4TFcreEdHSkU4?=
 =?utf-8?B?ZmlxNUxPZHd5ZnlxSUNYWk5yZ0NOWm5yaUVuWkQ2Y1ZQQkF1bDBtVThIRGY1?=
 =?utf-8?B?V1lQS1gzUkpLSkY2YkJWcmMyWFRKU2RpUVYvRXpDcSsxdFZxb3NaVldEWm1j?=
 =?utf-8?B?bEJOc3p6M1NrNFdxa0k2Q1Roajkzb2paVGhhMGVQL3hIc1V2TnVYV0swZ1Ey?=
 =?utf-8?B?UWdJZzlrN0pIdGVVbG5Zc2w3K2tMM3c1aGlVTFJMaktWbzhrVFNQSVo3dkF0?=
 =?utf-8?B?Z1dXMjRic1BKc3dyVWN3TnhUcFZBQ1p2N2crb1ppMUpVWEhxeC9RcHI0S1RH?=
 =?utf-8?B?bGlHNkR2YVFwS0RLSURhMWpEWHl1Q0xVQ2VMVGxORGJpZGhRcEwyUkQybzhr?=
 =?utf-8?B?K3MyTlRmdkRoL2s3Y05vUlgvclRCemhRTHFSRXB4azFmbGttV2ZEWjFHQ2th?=
 =?utf-8?B?MUdRdWo0Szh3cDNhYWNkWkJPaVR3bTg5MEtQeUwwWmRHTFJPdEZUQTRtQ2JO?=
 =?utf-8?B?RXFWTDlNSE9MU1U5QlJRT0lzSGU3YTE4VkRQRW9mcmxLa2RzWFZ1ZEpvUmtx?=
 =?utf-8?B?MkVQOWlHbUd4RkxGQ3MyS01CcElFRjlSSmFDTnNBNTQwWWk5YUkwRFlESlY0?=
 =?utf-8?Q?O0v9Cw8dtJFoUGtqPsXmrx0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0P195MB2325.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T1ZMaFVSSlkrdW1icnJ3b0xUWVBnY3EvWGJ6WncxWjNYMzBScW9QLzBTRXk2?=
 =?utf-8?B?RDNsY0NBd2ZIUm9ieU9VT1ZKUC9pLzBkdXpsU1VGZ3BJVXlIR0VpL3VlR0da?=
 =?utf-8?B?cDRCNmx1SHNkVnp4V2szZ21Ka3hmOFFHZjVvOTgzeHJRUVNWbmdwSUVJaUxI?=
 =?utf-8?B?SWY3RVlPUlQ4eFRLclRuSi80THp6cDRDVFVLeXRhUVZ6Tk1QZE9EbVB0VSs5?=
 =?utf-8?B?bWc4R04wMk16R3pkUXlUT1RVVFNrZ2hUNG9ydUFsUlBjWWo5MjJLeUxhZFB3?=
 =?utf-8?B?QjhwRkdFWUkxM05iRXo5V2xNdmE1amVqYzAxSHJRTmR0eWw1NDYvaERKT2Rl?=
 =?utf-8?B?N3NpQm5URGxsaVFDVnRBTEhkS2FBVnFETkRobUNCd0xDeU1sUng2UFBmOUtT?=
 =?utf-8?B?b1RENWFiSUhHaktlY3NybzE3OGIyeFVkS3hQN3pKZ3B1MFJPWkxFWVd6Nkhk?=
 =?utf-8?B?Nk1hakhrY0JiZUtxZDlFOTBoY09ka2hxdWhpVTNhYldZRjl3clBMNU1sZW9N?=
 =?utf-8?B?NnJ1YW9OS090UmdZS2dBTWc0Yi9RL0g1djF5QjBzZTd3c0RoQytlSTVqREhI?=
 =?utf-8?B?RTdxMmY2Sk1pSDNadjBUUUlCY2srZ1F4UFNSdHhGdFRGcWFDT0hYbVRqV0x1?=
 =?utf-8?B?NndPK0pTY2YrSjluM0d1YVFZRmZqYjh6cklQUUc3NEJTcHhwMVdQTERPUUFB?=
 =?utf-8?B?Z0hYTmV3TUl6dDMya2dGektjeXlQcGVxajMvdjBGamxyNG94WlhKWWJwSmlT?=
 =?utf-8?B?ZFB3OWdoVEJHOTZ0NmFTWEpRazJCUkV4eHBISnNhcVludyttUndGN3J4RWx5?=
 =?utf-8?B?clgvcVduU1dhZGFrMWpWTWh4SDF5bS9jQjJhOURmamtQMnZWUG1GWHpBamZH?=
 =?utf-8?B?a0xPODZVYjk1WjM2SWJvZWZyUHJhVm9qQjZzU0dLU2dlbHlBajN5UWhtVEtr?=
 =?utf-8?B?YytqNksyc3Nub3BJK2YxQlB4WjlwdU55VTVSV0ZKWWlaVVU5dTZiL1NETVM2?=
 =?utf-8?B?S3UrNUJuNXRKY1hpc0NIMVg2OEhSMmk1WTNtZEJEYjhDSnZzRTFLWnFPQ20r?=
 =?utf-8?B?Q21FYzRsNjlmUDh1TnNYVXhCamREZWZsOVNsd0MrUlZNYmo0b1h1MFROcE9r?=
 =?utf-8?B?SmZYaWYyYmphUlQ4SGtIQU81SXdHeWNmUjcyM3JhTThwNlkzVEd4eVlSTnRU?=
 =?utf-8?B?cjZldnFFU3BCbjU4blJzVGtEcTd4ZVJYeEErVmh2NnltQzRYLzBIaURyY05t?=
 =?utf-8?B?N3Nub0Z6QVdQeElCYnFMYkhYaStTazUveHNpbDF3Sy91RkltODU1L3NIemR4?=
 =?utf-8?B?dkozcjFWQVFhSlRhMDFFa1U4MkNkTkRLWkpCRG5JRjRFVktmcWdIZHlOakV1?=
 =?utf-8?B?aDNMWTkzb1Ywd3E5bHZlLzBmTEpsajI4bXo5SVJSWFdMTlhiVTdFc1JnMnhl?=
 =?utf-8?B?U28raEJVWjNuOHJLbmlhdEFGUnQ4UCtCU2pyVTk0NnNwaUNKODBIb01BOHNm?=
 =?utf-8?B?d2wyOEgwaHRGUDZINTdDdTlDYS9LUXFQVjlqZEhuZVltYnNpY05pQ2lhS0ZT?=
 =?utf-8?B?c3dPRkViamFwT0lHVVV5SUFLQTBaY1duNGxuSFloS2ZHM2hJM0FvUEhvSkxy?=
 =?utf-8?B?czk1bGNtKzcySy9sWVh3UUxvcklpTkFsM29PTllIZUVvUWFjQUpGcUFkT21u?=
 =?utf-8?B?QlJqblAxSyt6Mk5xaDJIUUhQYjNnRVlqQlNjWU5tdHN4ckVuYWpXTHFKdkxL?=
 =?utf-8?B?TVJIRUlETUFTNE1kYW9UY2pDckJzdGhmb1lFUlpYZklwSWhrb3hiLzRGWVBC?=
 =?utf-8?B?akRsdjJFVlltYnVMWlBDNWdweFBUQ25nTDIybk9jeEdGT0lQNUgxZ0o4Z3Rp?=
 =?utf-8?B?OERtM3VqUm5HRkxVMnVmY2pXdmo1VTduSmRKY3FUMHZVUzNMRU1WM2FxZFVI?=
 =?utf-8?B?NllwL0lvY2FORExoZ2EreTV4S0lTU2ZQNTJVczBSSUtSMUVoWndWMHpzM2Nw?=
 =?utf-8?B?dUYvUE9tR25xV21JMHhYZ0FTUmtYQWxwbmpBYnRJZ0oxdWNGVkFUbUxZYWcw?=
 =?utf-8?B?WlM3dDNsZm5BSWNpOEhPeUdIN0x1VDk5aVZkM043dmt1akhnNFd6NXowYldl?=
 =?utf-8?B?UDRoTHl4M3FrQ0FRc3RxRXhZeEZYa2Nxakc3NERYNEtHQlo2N1dlZ1JOZUwx?=
 =?utf-8?B?NG1LeGNzaVpsVk9OWlcyUEh4YTdWSGgzc1ZoOTZWYUpEWXFwZm1KWWQ1a2lV?=
 =?utf-8?B?NFMwNnR3a1VSTnFoNHR3MHlpTldzbGRxODcxSE1MbVA1a3JkMml1ckYrWGFP?=
 =?utf-8?B?YUZhWnN1RzEvaHVyeFg5dS92QmJjMGpVQnYzdGhNb0lwOVk2d1cwUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0FE5181106AC7F4391EDE2AB019AEAB8@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P195MB2325.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 845b0de7-5d53-48da-43a0-08de5fdda023
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2026 08:57:41.2179
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pFmTz4AANZLd5ZCMRYcmZmaAeAaCjoRGdLKEPo+kUA0TQg+TDlL5f+BOiU7wVUn5umT1V0sRFcsPZKCCDZsDxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP195MB2468
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[phytec.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[phytec.de:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32934-lists,linux-usb=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[J.Remmet@phytec.de,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[phytec.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 78254B8ABB
X-Rspamd-Action: no action

QW0gMjcuMDEuMjYgdW0gMTY6MTAgc2NocmllYiBHcmVnIEtyb2FoLUhhcnRtYW46DQo+IE9uIFR1
ZSwgSmFuIDI3LCAyMDI2IGF0IDAzOjQyOjE1UE0gKzAxMDAsIEphbiBSZW1tZXQgd3JvdGU6DQo+
PiBDaGVjayByZWd1bGF0b3Igc3RhdGUgYXMgcGVyaXBoZXJhbCBhbmQgZGV0YWNoIGNhbiBkaXNh
YmxlIHZidXMuDQo+PiBXaXRob3V0IHRoaXMgY2hlY2sgd2Ugd2lsbCB0cnkgdG8gZGlzYWJsZSB0
aGUgcmVndWxhdG9yIHR3aWNlIGlmDQo+PiB3ZSBkaXNjb25uZWN0IGhvc3QgYW5kIHRoZW4gY29u
bmVjdCBhcyBkZXZpY2UuDQo+Pg0KPj4gRml4ZXM6IDdlNzAyNTgxMTU3OSAoInVzYjogdHlwZWM6
IGhkM3NzMzIyMDogQ2hlY2sgaWYgcmVndWxhdG9yIG5lZWRzIHRvIGJlIHN3aXRjaGVkIikNCj4g
DQo+IEkgZG9uJ3Qgc2VlIGEgY29tbWl0IHdpdGggdGhhdCBpZCBhbmQgbmFtZSBpbiBteSB0cmVl
IGFueXdoZXJlLCBub3IgaW4NCj4gbGludXgtbmV4dC4gIEFyZSB5b3Ugc3VyZSBpdCBpcyBjb3Jy
ZWN0Pw0KPiANCj4gY29uZnVzZWQsDQoNCkkgc2VuZCBhIHVwZGF0ZWQgdmVyc2lvbiBoZXJlOiAN
Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDEyNy13aXAtanJlbW1ldC1oZDNzczMy
MjBfdmJ1c19zcGxpdC12My0xLTAwOTc3MmYzODI2NUBwaHl0ZWMuZGUvDQoNClNvcnJ5IGZvciB0
aGUgd3JvbmcgcmVmZXJlbmNlLCBJIHJlcGxpZWQgdG9vIHF1aWNrbHkgYW5kIGRpZG7igJl0IHBy
b3Blcmx5IA0KdmVyaWZ5IHRoZSBudW1iZXJpbmcuDQoNCkphbg0KDQo+IA0KPiBncmVnIGstaA0K

