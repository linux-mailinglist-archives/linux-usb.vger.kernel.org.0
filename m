Return-Path: <linux-usb+bounces-34655-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WE8hAMp0smlbMwAAu9opvQ
	(envelope-from <linux-usb+bounces-34655-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 09:09:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE5626EAC3
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 09:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C8FC30A54C0
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 08:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944D62D8DDB;
	Thu, 12 Mar 2026 08:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="T3tnU/59"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011071.outbound.protection.outlook.com [52.101.65.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60B732BF5D;
	Thu, 12 Mar 2026 08:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773302778; cv=fail; b=qytr70Mm20TfgAVS2m/kqricGq68bi5dJA9E4dT0/oHuGO/klxgfMUR+hIZpvUMXxu2eKh9y+m1jiyuyz4oSfAILCp+9ccr/mOneKm1K7Kf/Q4cu1zNelr4f10Bgp2TSNRkrexKoHTf++MsxMFr8arMQSu6bOYAwD62x5IP3MMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773302778; c=relaxed/simple;
	bh=f1jNw8fp7xvEdjI/fjuRmE7wI3uOFyif0wUfBzdiJxo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=tpTPlY0YISnyUP2btQ8WosxyzveGrsMVGP7HgnIZj+DzRKVKtqoFsDMs5n7XbH9vWF8Hq3M97nCHzjMVK9BoLikjNNgbAnGN61a6kb/vB3u0k8WAxqeErqFdAMzPGDLpF8QujFldTOXasivWC6QRZ5MuFuo9yC5mbcAmahNH+/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=T3tnU/59; arc=fail smtp.client-ip=52.101.65.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJOcGIPQ4ImqlAdtArLNrypWBpoxJaHLYw6aR4dmiRGbdYucC52xVJnDYMqDHY073T0QKRTUoqmDahc2AvtAahhDKFyuKKc5AQ9o6u+8kdJaS/tJyfXRIq0Pgo70cbVSR3Jbs3igv+gjo9xNfSMZnFZWwdIGWjjxQTAqo8AkYwpfsWQEq2MuZnEbkBozupVJbDCh3IsYqH4z2dsSg+lOtDgW2K8B+IXoYwRatY2Dgjw9AzEdh/pZbm1b0clBlbMiFCOdSGisfQBy2ztKw01ThvBN3YtMqjmQGYyDbOygpfwyb7CfVkxTFNLmtOEL0BQ8gqMQqRYa2/SGjxgX4aX5SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwQgPpFmd9fonhZo4wVo3lfzfTQsQS00DwqL/h2T1q8=;
 b=sIYtj5Xq6TwEAQ8V3GAITGUj/SYuUwoLDyWQ2fLgWNc+/h34vZMC7Ogcr0EXE4y1vbLeGGzxB8Mkl1sQrkd1I2ycbJ6HbKfc+P+vzCBRjdj/yD2+2phJykFoF8lX1A7lGJkXjw0BquCrUSyefxRbqi+pEuIzxn9rqUKxN+/xv+R6ECgWx97P6SPHBvnt0g5iiJhlRv4xVWEDWIw8S/9CQPiAOofOk4XCWGtamnMgAQe6yl3ZZshDPYwblttShw3ozybLWrnaXsRQAsNNoA2KWWiJyzNmeQSBoNHaM0eOlR1clbfXmV+tbpb1B5HKtxp3tWz9kpDJypDKnMpgDHt9aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwQgPpFmd9fonhZo4wVo3lfzfTQsQS00DwqL/h2T1q8=;
 b=T3tnU/59tEO/VR8kKXAYUPrwV7fW0vmwrZtMQh4YxwmrIkmN2DVffY061/kD4R/jlLkDzv0yYyfat0iSt6+SJOc9XD6aheUnVlfybM22DdbeW3pRrD96zKqtsZq+/cnj51DJdLqnZuDWp+IXa1LrnE15H45pMcD+ipNnekeAXF2J2Wpq4GcPNMyRUvBcuh5llb2ax+dCg+0rzsEqtZfIU8TO+jAdLfAotUAvgU8Peo2quWZ2ULkzCpA4bKrd+CURxyeTDbTUiu1ap5nnMctYCaxDWp9M0r5AogbPgZdhA9cgKxP8ITLZx9qP+6Uzz+7iQKV56ubfkz4oNE/flf4BLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by PAXPR04MB8427.eurprd04.prod.outlook.com (2603:10a6:102:1cd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 08:06:09 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 08:06:05 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Date: Thu, 12 Mar 2026 16:07:25 +0800
Subject: [PATCH v2 2/2] usb: typec: tcpci: support setting orientation via
 GPIO
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-support-setting-orientation-use-gpio-v2-2-59c523a09f12@nxp.com>
References: <20260312-support-setting-orientation-use-gpio-v2-0-59c523a09f12@nxp.com>
In-Reply-To: <20260312-support-setting-orientation-use-gpio-v2-0-59c523a09f12@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Li Jun <jun.li@nxp.com>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773302893; l=2564;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=f1jNw8fp7xvEdjI/fjuRmE7wI3uOFyif0wUfBzdiJxo=;
 b=sFpoAoqXKYYbJc9B0r/8y8/Dbp4H9xZ/SAkNGncIqj+WMKXb7mNUH9iuKRFL81/JGppKnTfwM
 sSc8E756wTlB/qcJG/1oA4If5aI/NEjZt8FZlYtSthZrsanQHYZ37y9
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: MA5PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::7) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|PAXPR04MB8427:EE_
X-MS-Office365-Filtering-Correlation-Id: b574d175-e611-4699-edbd-08de800e35c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|52116014|376014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JpdaqePU6qchjsURAaxN7yzFhsYick4LQgDOJ/oSwA9FFFBvjq1tksFIZctRktw1FpoJjtl5obq047UbaesSp2Qf1zyjsj24dMYVJstN507DAkOrx6pit5MAqshhjc9BUuRSBfhBaMSyiniiYFlqQC0qCDwtFm4arhqty24rRyTbkIIPFHMV3xw5k2gmtKDhzEEhdroZpDFsKE21vMdItv6er94kNpPGlEb7ob+WM66p7HDlkdYPbwY/JnIBXU3n3Yn6bGHrcyz4Y4IL62yTEWECzyWvd4pWawRG5uCCbSsdSvTRWSTFolFlILjSYfMkYz8X2kB2+clwHcUU/8Rj/CjPH/RObj0nDrt6pdix8ujCP1/Yh0IVr3CjWJ8+/VQdlFVDKg9PBoaxkTHFvltXSnzJJUppfoiCrb5QWfhXg8SQgHWZ+9iTDX9T+U617mR3OnbEgGEmrTJY/SztV4YEDUVUaLtsMn3SzgoqTNFAOQ/83eupEbmFMM8W/VKI484tacyurLvrqZqBu2NPQWIx6NmxvO1FWIUZmSJamYkPvkAuVb5pUgm2zRzFqlSjues9TtZD5syRqeU/1NRxjsaSrF9fk6z1An5OziOfQlVvFjuD+ZJpqFa/2yE/LLUwwYIkfvxDqDZUS0eLXYBKzVWOfCe8Rv+EkvKZt4XX3G15SOrcqvgcqwn0zflqF4/O6QCoO/TSncptaDHSrQtsk/eCkddr6TnfRlkwAKImCgyDE5XR5RWcrC+CHtGCX0uY8WUqsLbk6f3hhDJq6/ByGPvaCKhl02QqhR45+gz+opO7jcM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXBXdVc5SjUrWGVXd0JISEpnSlo0NWZZVzJhZHh4YmZLWFlWMjFPQnNkeFNh?=
 =?utf-8?B?Um5oVUhOb3o1ek5vOXdISnViOC85RWE1cmR0VnJKSkExN3kweWR4RXdGRXZD?=
 =?utf-8?B?dHpUM09uVk9oQWJzVXZWL2JIZDMrd2dVcU9wRzZtTWNWMUZzcmora2NhT3VW?=
 =?utf-8?B?UFJQUHNobVlVRWNvakVOWlNkU1RPaURWSmxXQ3JYU0ZYNVZ5U0poTXp1MDdx?=
 =?utf-8?B?NXNyeUJhYWUyZGFhT29qUmU5eEVwVzF3aVhjZ3dzN3g0WThEOGJVYU5KL2ZB?=
 =?utf-8?B?RDJkLy9wLzhrMjduNzVYTWJkZzV2ZWpSZGd3UHFEY3NIcmlQQW5vbTY5WlZ3?=
 =?utf-8?B?dFlzenZ4R2N1NGdYUitCVEFldHdld0c4ak9xUjN5M0I5bWE0UzczSTBudmQr?=
 =?utf-8?B?ams1K2tvRmI4VGo1TnN6RG1rNW8wY081V1ozRDV1Rmhrc0R3N2tUSkhGTWFS?=
 =?utf-8?B?V2crbjR1V0tNU1JYWmM2QWgwODJ4OW5ReFhtb215QkptNEVKUWlBc1lKR21m?=
 =?utf-8?B?bEUzWC9LQjhVQUdJNHZMTFdIaDRXMDdOUHdTaWNsWERRQ1lRcEQwcFFrVnJ3?=
 =?utf-8?B?V0JXTXlmeWJqRnpyVXR1N2V1NXdHZkpOTzFEWEJQcmpXeFlzVmV5Nm5kTDFq?=
 =?utf-8?B?blQwM3BTOWdlT2VnbHBEVnJIZDBhUmFlMFJJT28wUnV2U3pzdU5ZZWdnNjBG?=
 =?utf-8?B?emNsQzV5VXozN2JKYW1ZditZeWdJdGZVakI4Q1M2dW1oT0ZzM01xZkVtMnpF?=
 =?utf-8?B?NHZKeTY5ajY5NzU0VHkwbXFHa0VrVHV3NUtHbFUvSFE4UVVINlBYYU9UOGs3?=
 =?utf-8?B?eWZPdkRHc24wQUwzdU1yTTVyeTVpbnZGampPUzk1bVZiRVpNd1FTVGNSeENk?=
 =?utf-8?B?Zm16bmJBelhteU1qVXF4dzl4N1hNajJSUjd1RGRreTJqVThwQjF5OWpsVVNN?=
 =?utf-8?B?Y1NwRk9YRDVqV3poWkRTV0F4MExzWW9UbjB6Yzh4a0dXaS9uQzMxZHR6aUp5?=
 =?utf-8?B?dzhiS24vK3ZEeHkzTEhPM0I1NXlGWU1BcXdXWVA3TC9WSXQ5RE9uUCtJMGFy?=
 =?utf-8?B?K2RzMVJ2OVdRK1dHWFdGbGExV0xkdW4xU3E3Vnl1Q0I2NlAzRU5yR1d5ZGl6?=
 =?utf-8?B?akFHb2dKOFExNUk5aWFVWnBYVkxoR2FwOUZlNVM1aHltN05wMXRibkMzMFNy?=
 =?utf-8?B?clk2bWZSWEpUV01SWU4vaWlSTVhSK2JxdW9JSWNNcnhCbFEveXBGMFdtbDZq?=
 =?utf-8?B?b2RTNEh0dHVURlZJOFFNRWsxYlVPeGwwUmpiYkxvWnBUYmVBWUhPSXVEVGtu?=
 =?utf-8?B?VSsyTXJTNzJSS2lRanMwTFZaRGdNdVJvVTlTVFlyZXNld2ZEL1kyeW01Z3dD?=
 =?utf-8?B?WnNJaENtblNNOTRqb2NKNzMzc1p2dStwL3JQb2lmK2V4Vm1Qc3h1M2FISjhk?=
 =?utf-8?B?YkM3QTR5Ujl4M3IzdldEMGRkclhPeXRtUVlpWldPeEFQRVhoTFhaWDM0bWwr?=
 =?utf-8?B?Q01udXZTRllIMXF0UHlXS2Q4am9kV1NiMmd1d1ZZVnBwRVNiSDNkVjNvUmd5?=
 =?utf-8?B?dVZHaFFXa1gvVE41TEtqellrbjVxcWcreHlqRlZXajdWNVAxb2o0TUFaOHdZ?=
 =?utf-8?B?SGo1L0VCWmhMeFBUeldpdHd1eFViU3pjWkRxbFBJK1hWSnZJTnlqTGFnMGdF?=
 =?utf-8?B?a0J3UDdVd1Rkcm1uSkM1cW1sdXJ1cWpYS1kvVzd3RUNYQjZFdTRFYkVnUGUy?=
 =?utf-8?B?OGU1cW9YNHVGeXQzbTRFdXJZdXBEMTVSd29ZZ3hYakhCYnRvZGsxS1VwUEhn?=
 =?utf-8?B?VDA1UUVhUTkxOW8rRHNESmRXeFlqTHNDdjMwTWs2cmtjaytWL21jSXpEeFpX?=
 =?utf-8?B?MzFNVXNlT25WNjlJblk3QUJlcEU4NUk4TWp0WCt4SE1IMVFnQUc2YjEwZVVY?=
 =?utf-8?B?WTBKTVVWS1JnV2FMdWRCczc5Q0pqS0tjK1dVMmFid1V2ZkRxL0FlV2M5aDF5?=
 =?utf-8?B?R2dtVmNaUXlZN3k0ZzY1OFFiMW5LU21ZeVdwTkFBTSszYnR5S2pUSnJyTHpr?=
 =?utf-8?B?dHIzL0U1OUJsZnZsQVJLVThxUy9neUcva2UwcFpwOUQvaHVLeDNFRnM0R3p4?=
 =?utf-8?B?UHhFbHNrTUNYREFjcHZMdmY4WmhaS29IckR0N3hHT2tRSTM4TFJlQ1UvSkhN?=
 =?utf-8?B?ZFN4aFVja0VpTzFLUWZYSGNqYmR3RjlMQ2hkNjAxelk1eXd5ZTRLWlE3UDNz?=
 =?utf-8?B?SUp5bFlOUzFCUEc0RjA5aWswZTVLREdpZmRlRDRObGlxMnZNWE9TekRQMlZz?=
 =?utf-8?B?cDB2UnE2M0h3c0dUUlE2K09QKzFjZjltdlcrS202RDQvampOclY3Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b574d175-e611-4699-edbd-08de800e35c5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 08:06:05.8855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQ7L0fT/mdkeHx5vCZbYn1HGWh3K/G8Ygwnzqe+HaslxYzxKfZlAdeBzRcfDr4zKRTSk1FEbAgTk5a3NNTuK/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8427
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-34655-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 6CE5626EAC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If the chip indicates its "Connection Orientation" standard output control
in STANDARD_OUTPUT_CAPABILITIES register, it can do the thing by
programming CONFIG_STANDARD_OUTPUT register. Due to the optional feature,
the chip which not present this capability currently doesn't have a way to
correctly set the data path. This add the support to set orientation via
a simple GPIO.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - return early in tcpci_set_orientation() if using gpio method
---
 drivers/usb/typec/tcpm/tcpci.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 2a951c585e92..b930c8b1d2f7 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -7,6 +7,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/i2c.h>
@@ -42,6 +43,7 @@ struct tcpci {
 
 	struct tcpc_dev tcpc;
 	struct tcpci_data *data;
+	struct gpio_desc *orientation_gpio;
 };
 
 struct tcpci_chip {
@@ -316,6 +318,10 @@ static int tcpci_set_orientation(struct tcpc_dev *tcpc,
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
 	unsigned int reg;
 
+	if (tcpci->orientation_gpio)
+		return gpiod_set_value_cansleep(tcpci->orientation_gpio,
+						orientation == TYPEC_ORIENTATION_NORMAL ? 0 : 1);
+
 	switch (orientation) {
 	case TYPEC_ORIENTATION_NONE:
 		/* We can't put a single output into high impedance */
@@ -903,6 +909,7 @@ EXPORT_SYMBOL_GPL(tcpci_unregister_port);
 static int tcpci_probe(struct i2c_client *client)
 {
 	struct tcpci_chip *chip;
+	struct gpio_desc *orient_gpio = NULL;
 	int err;
 	u16 val = 0;
 
@@ -931,12 +938,23 @@ static int tcpci_probe(struct i2c_client *client)
 	if (err < 0)
 		return err;
 
+	if (err == 0) {
+		orient_gpio = devm_gpiod_get_optional(&client->dev, "orientation",
+						      GPIOD_OUT_LOW);
+		if (IS_ERR(orient_gpio))
+			return dev_err_probe(&client->dev, PTR_ERR(orient_gpio),
+					"unable to acquire orientation gpio\n");
+		err = orient_gpio ? 1 : 0;
+	}
+
 	chip->data.set_orientation = err;
 
 	chip->tcpci = tcpci_register_port(&client->dev, &chip->data);
 	if (IS_ERR(chip->tcpci))
 		return PTR_ERR(chip->tcpci);
 
+	chip->tcpci->orientation_gpio = orient_gpio;
+
 	err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
 					_tcpci_irq,
 					IRQF_SHARED | IRQF_ONESHOT,

-- 
2.34.1


