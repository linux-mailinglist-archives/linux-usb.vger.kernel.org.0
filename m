Return-Path: <linux-usb+bounces-35790-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAdmHgckzWlkaQYAu9opvQ
	(envelope-from <linux-usb+bounces-35790-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 15:56:23 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE96C37BAB6
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 15:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 62F9530162BC
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 13:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DCE443D504;
	Wed,  1 Apr 2026 13:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="F/pW1Nv/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24363DDDAE;
	Wed,  1 Apr 2026 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775051443; cv=fail; b=UrooYbuaNpKCCPj7kmmaWhGGI1rx+MOQaFYti42fBsVJBQoi9gBRTF+Ail1xg0iUunL2IZd5p7kBZuBX57pPZcOJjeLUIHK9AdcyDRptrFdxMpg76DThnfuaK8RWAgCyrNy1epfTGTYMU2Hkjr3wcc8paIcEnLMIAB89INnfBLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775051443; c=relaxed/simple;
	bh=ZWtrmXCscX5g1HlD6rp7yQqMlgZ2Fsz7JZfjFimV+Ys=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=u7v2O2OyVzh6p99dU4dx/XHKUJMAmgaMQ3wSPB/VjmPKUbQShrwQ5keQlcjFXrQdOozFVfJnvlZh1SCrvwqIczUrv7pUhdVA8ubRJWNsxZrzmQJ7BX0DxFxgl1U9W6jyCFijSQkUXNoQOTdKVVU/yCaB1OXZEy+zt8CIG8K3Yyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=F/pW1Nv/; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6316vQUG537987;
	Wed, 1 Apr 2026 13:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=sV71mp8kN
	OE/HMJge8iMCW9Q1q8zU5NutW6lBSQt37k=; b=F/pW1Nv/S1yvIdnJLDf9bJ8cp
	dI9aWDni+Z+lL50FOLaWTk1wl4VU4Zsm3HyLdH3YNYhjuaqTr7srmagDWgE2mtYX
	4NwDqBft4X3YP3MzZ5/u5yV/2MTwQf93eupNAf9Q8ysp8qe3ZoWMnx6+rJqzxOrR
	7SD3RN9oyA3RV0Ol+r0/Aab0kli67uBobFx79f2FNwE9oxlE/S6jAqYCDyRu/IGO
	lzOpRd1ZKvWFYJWuoQOgSol3USWLb+jppMnD0XXMvOSQXn5nzKc2e2DSmdi9XzdY
	2ZqXqU2VBqWwK1LCdQOGL57Zc/R08TdUIbN8asTgEH4rRagdU4rFdKLAJ9gtA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013030.outbound.protection.outlook.com [40.107.201.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d646vwrq5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Apr 2026 13:50:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R26/5HPDD5AdNH28IqA0mwiuGMkPAqImUAM20S9EADB3Da5T1/wOZugEI+ENd+99jmto8+i3tmY7WhPy2f5A63B2htERMnf9Di+zVDuc9VkkVFimx7qsqNjcCanR2Rbx5cI9RWnKqOYrjFBSW+s2v2/bE2CTbh0+ng+3dNUKjQx+/Y4craRHzrSzWx3EW1w8DRGD+pGwoY+WvZ+vOdg1/J+fWovi5ZGuvN0qzYdvM+OnBuCoOPOBW8BViQ30JC5KFvat1URWKDK3tZAvQ7Kkl5GL9vMOaT61hI/s1VMXsnzIq70HpIljCi65bDA5fBRxCKR89gBL914Yp+ry4IiWlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sV71mp8kNOE/HMJge8iMCW9Q1q8zU5NutW6lBSQt37k=;
 b=VI/WMVwS0HPkK4YSaEzdAlAkLTKPu9ZgGeXB6i/MBCnWvTYHNNvupngi98O16Oe16ingDomf/VTQNebZdPHHBp6P6EDa/Aj5Y60sZeM5lmFu+I85KhU2nFczL2sGNlCx+tyDfuYo2R3gphG8ii0qlRp3lIYaX5OQsw6S1JyIkViGp4qgj7aItjVkZHsCEwshyJV5Xt0JmA0t1KW24Sc+e2NHjxBEck9Vlm7kP+wMJDKzpglCS2h2fuU2SIvI1vG/AksmV5s2Sg5oAbMddC5YI2zlC4ySVO461STI9cjf8VH78OIUG9Y5tXFUrQMpVmBBOEthaOZkbk445jitAScMFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by SJ5PPF4990C6B9D.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::826) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Wed, 1 Apr
 2026 13:50:01 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::acc9:24e7:5138:6cdf]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::acc9:24e7:5138:6cdf%4]) with mapi id 15.20.9769.009; Wed, 1 Apr 2026
 13:50:01 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        Xiaolei.Wang@windriver.com
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: dwc3: imx8mp: fix memory leak on probe failure path
Date: Wed,  1 Apr 2026 21:49:38 +0800
Message-ID: <20260401134938.686748-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0048.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::17) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|SJ5PPF4990C6B9D:EE_
X-MS-Office365-Filtering-Correlation-Id: 88347123-ebc0-4837-a21c-08de8ff591b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	dluaHu6HwryaP+HUpbzNNRNhwiEOIMCfll3f/FoCHcQLzj7/jyAqCXRoDj+H3UWeoJzZOpls9gmKGNtDX893nFNvAmTXjoQckl8XsvRe8UdzlMtXN65DTOWr+2PA2Ds56orwt6tkXLBwjrOqTEgA14zJCL636djIKelGue/6Z3s3jHJnDkvqfr0+q0XjUSsfreW85sBUtBsTEqOFXFajAjUrJu+sTsDk946sEPSkC86JxWjKckfzDfRgExzW2X4wkjQJH2gDt0b8UJ1uhco1ZDr9quPp483gooJCF6ftC13SHT1hn5zUa6aNFWBwEinbGn7eF1a3wkCuvXxoXbDxq75FBF3SSDmbaWv0Gc+Y0k0rTR97pQA5e65pS7v/7gOdzAS+w/G9gzW3WB3ktOa7/acKQmy37cpkJ5HU94kkpmXGj2e3NWGeYB7tuJRW707RMj+HkkGBUH2S8yrKgbeKwn/XohXJit5FBDCcBOItiQIThge4P6J+XOHjEnumILlxPWgnto0eXYPO7rrWM+AQStnBKjCBzmiXobMyouZmDuZirTqnNFg8S3K8d5rizNwsR4amlM9dNz45dkJMZy64iK8rnei+xeln2FRjbmYcvgBpXY0pY9nFf9oc2vKiTrIc9gXb3/ncF6fZgGUFtnJscQ1J3c2Qdtc8mbiDzv1oEJzpGslWAVskMKjh3+EuBRGIXHawSI6raX+Aycol7H2ZqSV+jOP3LrhiR10hCOpyff9NeW0B/e8DmzPuDeHMvEn7PVH1hhaaHrUhPQHzRAv45zNFRz1zY5sS1lI1M8Bc42A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w5iXWyCFoUauqDfwV2I3vqWFJpKuOOK3arSnEkZWTeFbgmcTvPTxagnNpqx0?=
 =?us-ascii?Q?f0mbgf+dno+f8ZYXX+ki1310E2I/4eZ2baOi7Lf+iWNc4EUMvXpvhLMQ0R0u?=
 =?us-ascii?Q?PWc5sFAl63bb6VCF+l4CsEylpMqken0iKR83X8i9EQ+AkngIYCoTGeF2aZ1n?=
 =?us-ascii?Q?bCscOvJO35z56FWV+i0tuJfL+kxjA2enjtfxVNIXAkJGXUj1+F4dbbKoSOIM?=
 =?us-ascii?Q?dqd5O9wy6WZu9AQRd7HqFoo+8crXjJoaetTnCMtJvYAnrggLJTW4LUrcZ/ep?=
 =?us-ascii?Q?J/u1qG6u3yGXtTEpMcNm6AfNzTUGeOw4B5hqmyy0nXwT9H1ergf1vKaONzxq?=
 =?us-ascii?Q?U2oPdkYQI4zAFFEMPKrEgUZlWxjt/37C4Om7tfHmbh5okZLfQ8fSmu6YKtn+?=
 =?us-ascii?Q?bwRcas7S34WgeEuw7ylIG4b8JeveCTa+vpxAXvHwWqkT62VtiH11bL06e2C0?=
 =?us-ascii?Q?bn8Fx/GDzZUd0hYV3irmNCnSCtmPnoueF+yP3bYc8tqXRckGlZGeViPcPzgH?=
 =?us-ascii?Q?WLWAITgJ/IvHEJTwFcBOL7XlGkaRnaVaYpwy5EiSFPVyIzMv1OtOwaqWyKjI?=
 =?us-ascii?Q?3EIGxyiUP38pMqTcIgORoIf/NAxNz2z6nxRliYup1zLd0WktS/G6qpCHTYgQ?=
 =?us-ascii?Q?GYOuZpVEec0HLTlBDDRcabVEc6ApMCISLF1RFTbvGFqk46qdAwnQKPUFZpO5?=
 =?us-ascii?Q?7PZV+uJGPy3cXz+n7KAorawk6Qk1FUrFwjl/2xUGI2CVAPL/LKvvIJCgeqnS?=
 =?us-ascii?Q?Y9uSV1ifxOOb8QXqT9Fa/LAb+Y1mqR6uXseDK0qC8/KFJI/8/Tn59onzEEGA?=
 =?us-ascii?Q?xqArEZ6gwCM6P7642fLVepAdUo44183bGbVN/g5nGHKL3parCjcCBm1WXqdK?=
 =?us-ascii?Q?EezMspEoja0uB4JxUSjRAFG5psGdB3SxFznn3UVq19mTZJJMWvP+vhA6gMGa?=
 =?us-ascii?Q?3DgGexdnrU5rB7Px+iMAuPwlJlwrCA8WEAWUCNG2Y5/Y7BVTqg5qZw0ZSn20?=
 =?us-ascii?Q?w8IvmxWHGCESPP0CQ3fFjswntn+dWN2+L84Msh2p0zwkAZ4EmRuveho/poyk?=
 =?us-ascii?Q?SpK/DaSx45EnQIQ9TxNE2e58zehLILBWVe5fYb2e+BJMqNLf1pe0ivkL/Uys?=
 =?us-ascii?Q?AjnAfHeSbP7gL/SG6cMhdFk3vUX0UjAm43RUN9Tx+8lWvUiVUHEsY5aJ5yDs?=
 =?us-ascii?Q?wGdEvqvJ3FK4RkE9zGSMUOvfL0OZ57gjrqawVQ5ABzm87W7UjmRWT5eL2STJ?=
 =?us-ascii?Q?ta0LIUOUUz/+9GLj0wV+Zyg8hCcemDUE1mh0U+3EQIThOQGO39U/XJO8VG/h?=
 =?us-ascii?Q?SomXUNt5/JT6yOsq96b9mcgMSqSyxBrna80Q9eBJCVajLQ20RKg7bwLOlZTU?=
 =?us-ascii?Q?rfzPm55Wi5zYKfTKoF0dnuH/i1rhP5KTRR0Ee9Lz8aZDFLhAxFvIs8w8dmIl?=
 =?us-ascii?Q?D1v19NC4Ry/EF75nDj5bBGHNsKg9kVbI00sda6orZ4057hNky5uFNXt3sEIW?=
 =?us-ascii?Q?SLfNSRlFVrqaSfdXvNGGdbbbUXZ0ahkq5KAuKfK9CjJeoS7V7AzcIn/GbBMz?=
 =?us-ascii?Q?mCukuSGlaYMzYxp15/+tEL9dSZdjF+sB8tzh41VoD9cL0iFF/ZVwgwGcaX20?=
 =?us-ascii?Q?aTuC40/wFmLiq8ZQXcKNNstNxEuhF1eXSYTR0zwp5PLC5FIv43cVaJxuX4gm?=
 =?us-ascii?Q?BwXAZN6aZFhln9RiC/uWgTCxd//MqimsgL1g47tPl/w8OPfFt2iuEbXcqeAy?=
 =?us-ascii?Q?dkotYHP68orlwPyzStJeiiCxnXYnl6E=3D?=
X-Exchange-RoutingPolicyChecked:
	rDFWSyLTOTcjyqe7jFxaNSn2Aq6d5OHvT8zR7X5+wSKRAfiyTUiv89yhSE05qcnM1F4Hh1BHs9kTGd+3LGuLP0m7jcvNCCtDjon/CWDVUSoHgzfaYMnXHKbK5qU0voTsj617Zn+rBeXo+hjOm9trYeHXSpMePG4nk1fX7Dw8aAWg02Nj9p7xkUrN7mx2UZ5q28xM+1dFT1LsE7+eVdAZ5uQRZ+cCTt8LAfVJXM9Z/tt/i4xMiGsEvS7b5nbugE7ZJCK+OFOnHiIoiuaEQOQf6pH7iyQysw/9hCx2R/OMW404HHxSDklJAt3xl0odvCdBuIZkP8cBlbflI14g3pIKYw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88347123-ebc0-4837-a21c-08de8ff591b0
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 13:50:01.0257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RzeHpRkJqnrj6JkDSeE0JxloK7ecTjRa1XZ5Hz67p1w/heRNckmKfhbv11eykeM4mR+l+zjENY4i/9wmcuXVu4Te2U/4P7UcGK+IBnmzsVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4990C6B9D
X-Authority-Analysis: v=2.4 cv=Zqjg6t7G c=1 sm=1 tr=0 ts=69cd228b cx=c_pps
 a=8mz6MTC2HIKUG4doMpATJQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=uO0uKvSJ9KFRvn_vxpkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 99DxtnIMn4QFvJft9iuijqRazOiOd_IX
X-Proofpoint-GUID: 99DxtnIMn4QFvJft9iuijqRazOiOd_IX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEyOCBTYWx0ZWRfXyemp2tGH/q1x
 cbDfDosHMAS8KVn5xTe24ucLr0zyd0BlLqPAP7s1Zm10sZ673Hy99QTktuCv4mwpfN0h8vEqU+b
 ABTexJmcK4rE+5VtMMD5khbJDKTwyaZXJajj9zkv64jUz75zVbLPdzb9sqO6YY9E8ROMTgBO1WV
 fTfAzA7v5lztYKVGg8x+orZg5jl9wXG3FXnLu+4QL3ivj/byxk1/Qlp11nDX/xjDwh2jGveusbV
 rMNFZLYLsmXVUmo9lNsFXI7wICLK9t3V0WuTh79CdPV6OykbYNDe5i55pjikVW4rP9/rSVVy5Nv
 N58siw29zJCDRS055f2B3VDpLQ2ulerrWLlTBLuGgpJ7MULTQKkqEx9KqM6H/XrHjrtp/omJALV
 fz9zFxT2GIVuypr+nH0etOPAxSVIh6OuY6YWP6hAHhBgzyX58eE2Og2FcAl0yMflgvOGLuvWAkp
 nKcjRBidCHbEh5jws0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010128
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35790-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[synopsys.com,linuxfoundation.org,nxp.com,pengutronix.de,gmail.com,windriver.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE96C37BAB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When platform_get_drvdata() returns NULL and probe defers, the error
path jumps to the 'depopulate' label, skipping put_device() for the
reference acquired by of_find_device_by_node(). This extra reference
prevents the child platform device from being freed when
of_platform_depopulate() is called, resulting in memory leaks reported
by kmemleak:

  unreferenced object 0xffff0000c92c1480 (size 64):
    comm "kworker/u16:2", pid 50, jiffies 4294895789
    backtrace (crc 49d507d0):
      kmemleak_alloc+0x34/0x40
      __kmalloc_noprof+0x430/0x670
      of_device_alloc+0xec/0x26c
      of_platform_device_create_pdata+0x60/0x1f0
      of_platform_bus_create+0x290/0x610
      of_platform_populate+0x74/0x118
      dwc3_imx8mp_probe+0x228/0x734

Fixes: 86767625f525 ("usb: dwc3: imx8mp: disable auto suspend for host role")
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/usb/dwc3/dwc3-imx8mp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index b3d7252bd910..1cf96540b66e 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -263,7 +263,7 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 	dwc3 = platform_get_drvdata(dwc3_imx->dwc3_pdev);
 	if (!dwc3) {
 		err = dev_err_probe(dev, -EPROBE_DEFER, "failed to get dwc3 platform data\n");
-		goto depopulate;
+		goto put_dwc3;
 	}
 
 	dwc3->glue_ops = &dwc3_imx_glue_ops;
-- 
2.43.0


