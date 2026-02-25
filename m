Return-Path: <linux-usb+bounces-33683-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIQMLQBnnmmLVAQAu9opvQ
	(envelope-from <linux-usb+bounces-33683-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 04:05:36 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9011911A9
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 04:05:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84083306FE14
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 03:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89D4629ACC0;
	Wed, 25 Feb 2026 03:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LJiCdj1L"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012043.outbound.protection.outlook.com [52.101.66.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8573A27280F;
	Wed, 25 Feb 2026 03:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771988731; cv=fail; b=Qa7a0Vim7qV94XKetznU698PyH8zWJzpbi8sBxLEaQ8vrQqFCsSpP3IcC6OIs+tT/8AlahHXs1u97J7k6TfJ8n+cHuqbD7K8byWJ4ZGqxSSHLkSCTBXkQzL6cBj+rAw+zO5n4//wryXOQi4ez/20jtKQS+scLnC0WtKz9xGgFrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771988731; c=relaxed/simple;
	bh=B63woPLw9w8t/krF2e4J2+tcTAEL0gbC92QS1ZJ8g3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ryw3Z2ER4NYkeKcoJQhSpZafSYMvcxmFF91z0AOjOKwt8aoHz7RejByj8aKGKVdVBYUmzcOUDHM8nyZtovhaoOoKTfS5NAr0yUtoE/+QhiMaZf47z6lYkRqlBqO1rxgiXYOm8zq8o8jYPpQYfJSqmXecCKRsyadda/uyyte+MOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LJiCdj1L; arc=fail smtp.client-ip=52.101.66.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPAmex9hXB6qhdyjg5Da1xGtI6J929lr4YjO8ApSaV+4QHzNtx0br6m01gYzj+RWMnHZjLEQMB2Rk+Ozw27GOL9wdHejyiMfafKM0EVLuJuw8bbxVk7OLJqduggqVfDLuNuP9YQlnfBGAyQHJ1GRIi/JfdXXS/hssLmdXeJ1JDQgLA+u0gDczKdzrEIT7U/E7T44bMZporXgNN8M9twh+KbdUF1HRv0/BejlF/6Uxg+gpCQl2Tx15ats2mSKObbJ+kJutiTATxlRoJVH5LMhCie5Q2K0u/yEhGQ0CInh/rFpBxdAx12g31kgf9i9IE/uKA/0lgpyLn7a7BdYH2WBQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++p02GjL99BBmlJVXHW33tHmesaNw7Jg0Q1E/BIVDwE=;
 b=YOz4mmpQFRZ1zFldr4yohWDu3zqN3J5riOtv4a5lpcaLcrDnAOqjIHre/T5mUynAg3CgiQAPtSiTKwuZgZ25ls5E/qcIVkYqpM4Ktqe4p7xO+DUOf620nQPo3X//OJyf9YOyfqoKHXqJCP9kigyiKlo6Z7jhtc7cPVSBpJ5nFR1uKK15S7X5S6jAVw1jYWu3Yqk5gHeWeosDCb8wMTnu0fjP7Ha7UJ3sNy6W3Ilhp0HtFoHid06n3Onow3vTNbqoheZCPs0TmldAnzKB3o3EesvhVoaG5OVhsoghcFrohvx0Zm6aiGZkTQ+B6RqIAxJNcveSiw3d64FNd25+ENlPOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++p02GjL99BBmlJVXHW33tHmesaNw7Jg0Q1E/BIVDwE=;
 b=LJiCdj1LvI8oQI4vAnn2M0jEBsJMNcqlfMlA85s8JozThPxXNOtWqtxuaoD/FxHD/eTBG0bMXX4pwD6mPQqv0fQH8adRq1BnDy0V3nhoIwqSESYj5geA+xepqz7iylaFoQGQOc7TJIRGSbTwQIsqRYD5oONLtogUWB7beItCiFS6uJfW96c+Gnn9Cy/YcXDM0rPBZm/M6Nws5Pjr4weNUY9K+wWtJT8uIcn+9Vp/OhE9EbR94OmbKW6lJIVKuobFT24AQdtSgfDp51qeMvxqek0HbNi2MlD5dm11p4xC3iv/a9DxiSxViLuquyktI+6KdY2eChRgaJ9DCpy5h8PK4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by PA2PR04MB10130.eurprd04.prod.outlook.com (2603:10a6:102:408::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Wed, 25 Feb
 2026 03:05:26 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 03:05:26 +0000
Date: Wed, 25 Feb 2026 10:57:47 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Cc: badhri@google.com, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, dsimic@manjaro.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] Revert "tcpm: allow looking for role_sw device in the
 main node"
Message-ID: <im3nnajzv2hdu3kv2hknxi3jaz3oam5pujdoapva4hs5rzguky@t45ryche6n5k>
References: <20260224110139.3812757-1-xu.yang_2@nxp.com>
 <30bc5aeb-382b-49e0-824a-303230110313@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30bc5aeb-382b-49e0-824a-303230110313@collabora.com>
X-ClientProxiedBy: MA0PR01CA0072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::19) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|PA2PR04MB10130:EE_
X-MS-Office365-Filtering-Correlation-Id: 633fb6d5-5425-44e5-1851-08de741ab92b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cGIzT2E4SHZoeExlOVZyV3MyWnFScUp5bTFvb0hhRjlKejdTRDRUUEpHd0RN?=
 =?utf-8?B?ckxoTzFUdXNCOXV5Y1kzR3Uyb0kvZ0t1VGpwNlExazZlemowWUEyRVljMDlR?=
 =?utf-8?B?cGFZK1ZhUWZaRkV3dDN1cmpJK3JldmREVU9FRXo5ZXdKUEpyTUtTOHRFYlc4?=
 =?utf-8?B?VXhEZlZpc28zL1RLYmloVFM2ZlRyQ3lPREZORThLTElVVjE5ajBySmFma29M?=
 =?utf-8?B?OXpUQUs1UE82Qzc2cmpybC9CVW0yc1ROVUdjMzd6Y1h4aElMN0t2WjBkTHdu?=
 =?utf-8?B?Z3o0aURzKzY4T09kcjEzUXNrczJYNmhIT3J3VDJpVTJobVFoM2JWczhlaUJC?=
 =?utf-8?B?WlFHcWZJQk5TSUJYRU1TTjN6TXgzeXdFVktsUWZTY0lCdmwrb2tDUXpiRHBz?=
 =?utf-8?B?WjVQVEE1SExQOW1VeDZpSG5CcEdLYzU1SEhpUFJIc1lmbUhTTEo1THBkTnJx?=
 =?utf-8?B?bmNPZ0w0R05QL2VJMFdWVGIra2hzd2doc0VWNktWNmZEcGxTclF1QXBsQ0No?=
 =?utf-8?B?VlFXTnZiU3k5NzRxeDRJNTZQZ1JVS2tZSWRvand1aEdva3RiTVZHL3pnVkVN?=
 =?utf-8?B?SGxzc2JxQXd4MC81VlVQbUV4RUhmYlVFRXBJeXRvOXdwdHBNOHdVVWxEQ1dk?=
 =?utf-8?B?NExVd015VFFiWXh6STZHWmVCT3lJKytPbllZY0E4ZHZzM3hWam41ZFhxdGlz?=
 =?utf-8?B?b3JzcEhDSUQwWE9TZHhQZG5XTUJXOE50NFJmZFZ1MGE1QmZMMjVVVk84blR6?=
 =?utf-8?B?RlE3Y2ZFZjlBY3lrVlhPNHhoTVY4cWRxekhFQnBWMTBnYnZpYlN6cFhqZVlp?=
 =?utf-8?B?a2o1KzdFdnJQOW91cURBTDdUNVBmTHFmTzRtSzdsZmxNam1JRjJwSXF0eUhK?=
 =?utf-8?B?NTlpNnVWRTNOeG5la2hzdHN6SkkwR0FGN2gxeFk5K0RSQnhSZFBrcmk5SXN2?=
 =?utf-8?B?blRUWHF3RkJxN0l3dXkvYTAzSTdlTnJySG9za2hBTW9SRWh4cUtYYVRLanV6?=
 =?utf-8?B?VzFhZk9zSVZGRHhicFFCS2NzVWZLMTMxZEpPSzZpTzJmN255SEVuMGYvV1hu?=
 =?utf-8?B?cXVsbjgyc2NRSWtlNUdZbkk3WTE5Wk5zQUZlNUlQWno4c1Z2TnI2L0JsS09B?=
 =?utf-8?B?d2hRdEtNd2MycnpFWnQ2akVjaUVvRjVLaVRncU9ucEhoWTZFZVhuY0VKWC91?=
 =?utf-8?B?blRmVVhCbmpaQ1BFa0VncllmdWdWakQ3bVUyaGJrMVgza2JkZTNlbWRXUURB?=
 =?utf-8?B?TEhCdmoybno3N2VHcDhSS1pCS3BDUSt2eCtYT1NsQVltY1BBcExIOURWbmxC?=
 =?utf-8?B?KzltSVdaUVgrUVIxaFB2Lzl4SnJad0hLNXZHb2ZBUm9FVU5OdkFaYWZacWdV?=
 =?utf-8?B?VDlRY2VKMjRnVmJ0c2RVNVhFYy9pRXBUb1RublI1bXZrMUcwMnFsa3ZBbjAr?=
 =?utf-8?B?d09vSEtuaWNoU1l1dVh3T3F4OVdCSXFnbW9yanBOb2xlNWtibHQwQ1Nvc0tH?=
 =?utf-8?B?NW5sckpEV0JXWGFMVHRLL2NRdkhONGcxalVES1dFZXYyb040OStSSzZGWmNi?=
 =?utf-8?B?UjJiUDVNQUt2cmx1UUU5Zm5OL2x2WTgrS0l0WVdTVEdPcTI5SzdQRnlaSkZx?=
 =?utf-8?B?YXVFTVNFVEpLclE4WWU1NEV3S3ROMitkTGxLR0lnaXpZVjZpRDFsZE1XNEtJ?=
 =?utf-8?B?M2R5WXFGS2FmVUpFNWF4NGlHb2FrVXZJTGF3WEtKbDVaNVV0dkNvY2JuZ3U2?=
 =?utf-8?B?U0Z3SFVIUU90RUQzSlVvYUxKbEVPOEZRTXBFcWlCL2xkTDE1Y3RHbVM5ZEhx?=
 =?utf-8?B?dXNURXhqY2FkUU9TT3pFb0VwRFFqWHNRODRiWGNZUklSTEhyNElTZGZqVzVG?=
 =?utf-8?B?MEtFMk5qVTVQS3p3Mm9Dcy90UVJKdDRZTVhDNWg5NmRqY3ZHWjdNTVFEQW92?=
 =?utf-8?B?TllSRGt1WENsZytnM05FTFBBMW9LTTlpL0NBRHc4YjJBZWtmSzczMWsyLzlh?=
 =?utf-8?B?L1FFOFlyQWUydVhXNm43UDhGSmltQTBlV3BmRis5NFBsaXE1cjhjZ2dyZk9p?=
 =?utf-8?B?ZkJSNlVyMkFLamNoTm55Y3NBQmtQeUw2S3FORzFrTDNSUC9vZXBGT0JHNXdZ?=
 =?utf-8?B?aUpEL1IxUzYyZlpkSVlRd1RJd2lvd0RHUGRFUkduSWlwSkQvb2JsMHAveHVB?=
 =?utf-8?Q?qdWn7NasZ8Tp4q0f0Dp6ijk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVJGV2kydS83RUNsNXU2RUJPM0hnekxySS9JQWF3RlBQMFc2REZON0VCMGRs?=
 =?utf-8?B?RlNpVzI3QWVJSlhCamZES1BUZE1rZmtRUFZ5VUh3amVSSEZMbEJTTjE3bEFT?=
 =?utf-8?B?REpGUlZaRUZwSVBzbnhmbk12K3BmZlA5UWREZllMNmpPSnlJRFo5bjlGVkVT?=
 =?utf-8?B?K2F2eGZkZ0tMVGF3ZDlrV0lqQUlFNDRHUjVMQ1lxb3UwekQ0ZmFRc2FUM3FH?=
 =?utf-8?B?M0lzMG5oMHFscTdrRkVCbTdvVXRzeUV3djRnYzEvaG1vNW5kcHNXbitjNzlN?=
 =?utf-8?B?WTRJRmVDSENIQlVselNqWDBYUk5lUlh2SWlrbld2QXduVjlqMGE2TlFRWEZs?=
 =?utf-8?B?OGpxOVRCMnFyb29FbmlBaitNV0w2VHBRVys2dVNNQ2daUjYrS2xPTTZ3SUto?=
 =?utf-8?B?a2lDdDhadVBHY3dLeVFrSlFSRHhUOERHNjBJaDduMCs3OENlMjJEa3Y5a3Bh?=
 =?utf-8?B?dzBlUVFvbndEaTVoTHF4cWV4V1VVWXF5ZUI2SThUUkxTWG1TTE9RRkJPQ1RZ?=
 =?utf-8?B?QWVZZlRJbG40ZWJFQURUbnRTVUc2TW1Bby9OUzNZL21iczJHN0RyeTRxWjBH?=
 =?utf-8?B?dUpsOFJLS2RpTjJMUE9YaUNxNGFVNHFUTlVlL0huWWM1VjlSZVNGcTBCMVJs?=
 =?utf-8?B?S001TG82ODVGMFVTb3psVmViempROGkvVjBxOExWWWRBSGZUSEw4bTRWY0VT?=
 =?utf-8?B?WmZGV1o5c21CbnRoYUJEQk9HaVhoUEVlZll0SVlpWXcvWEdqVi94Sk5vZjI0?=
 =?utf-8?B?TVFFQnArakFORlQvdEkxVTAwYjBxOWVNRm4rRWthZGtNVkNINzZrR3R4T2hH?=
 =?utf-8?B?ZjdrN2NhWms3dGNYNyt2L3NYaVZ2Tzg3SVZOK25BK0hqZEFqWHRnMWZBNm5F?=
 =?utf-8?B?TXdwQWdpSDZzTmZWREtyck0xZHVWL0t2K29FQ2JzeS9MNHZIaVlVWG1IVGlY?=
 =?utf-8?B?cHB4UWVGVlZ2V1EzbENTTk4yZjZEenEySEg1SHRRQkJFcU1EbzAxclVKb2ZP?=
 =?utf-8?B?Y2RjUU5TOUlDNDhqbUYrR0hnai9Fcmc0TldzQS9IdTBXMms2aTk3QjlLOUg5?=
 =?utf-8?B?ZEsxSE44cE40NXJpQ2VjNXQ3akVZSmlwdllyWGF4T0c3TzFpdm8wcVdCbTRU?=
 =?utf-8?B?Sng5NXBpVzd3MS94TE5GRktiN0ZhL1BqTkVLTVNQZ0wvQTVBT2MrbEJua0RZ?=
 =?utf-8?B?Q3c4clZkS3Z4TFFsa3MwL1MrRGJlS0IrOFI1L2ZUdTgwVjNzUDVmaE8xU0sy?=
 =?utf-8?B?STdWNk05RHZsOHcxdzZzZjBhYy9nc011SGU0SE9EWnRuRGVtVVJiRjZiWTR1?=
 =?utf-8?B?SDFpOFIvQXM3K0J6UjIzdmdrZ01zUVpxN25ZM2hOcnFDRjlTby8xd1dkQ3ZO?=
 =?utf-8?B?WnB4RmF0Zjkyc3NBYXN2YW9jeGdESGV3YzB6cHY5OXBDQXZHL2tTb2cvNFpS?=
 =?utf-8?B?dk5PN0pnN1o2OFpWVTBFS0hXbmZyaCtHbG9vaWRFaU5NUnlnZFpPWUQrWkJF?=
 =?utf-8?B?ZkF6S1g0M0ZFNUtoemY1ZGJ0SXdLYkZ0amZSWnlheDlnQ0FyWnAyVWE3SzV6?=
 =?utf-8?B?V2VKTG5VZGR0dEVqbmxabUNJelNKUzJ6REJPeVRtcHB6dnIreGdpdmhhRmk1?=
 =?utf-8?B?c3krazc4RzBBUm55MTY4WDlOU0Vod2xuUmhyZjhHMFNyV1YrOG5jeExENEs2?=
 =?utf-8?B?dzlacGtHRlZDSm01T2ZKRGVXdXh1TDFGWW1lSjU5d3NqQnJhcEd0WEFoUmlL?=
 =?utf-8?B?Qmg2TFdBV1BJZmpkcEFDZzVXZmFEQTFkRHhPOXdReUJ3R2pTK3lHT1grd3p4?=
 =?utf-8?B?QWZndFFvZnFTUjhjcHVFVjZjNjdGVnZ1dTg4Vy9KMjF5T2o0RHZsVWRYNzYx?=
 =?utf-8?B?Qk9CMW12L2dNSkloczJjSjFpUjlIQXhMLzVhTXFqNEdQaUtiOFNGS1o0K3Av?=
 =?utf-8?B?ZkdKK2FOT2xVN2FaenNjaDZxTkdVWVZ0bEpVamtkTi9mWGRsRloxNU9jaFZp?=
 =?utf-8?B?Tis4VWRjOFVYSDI0Q1Z5UFY1ckdod3RiOVI5Z3o1V2pLSjVTcmVneUhJS0kr?=
 =?utf-8?B?Z1FpQTVZN0dNdjk0N21uLzBTbm9PZEE4NmQyRGRPMHJwcDc3WmR4RmRvTGtj?=
 =?utf-8?B?Z0trNlRXcjRmQkhYUUtodGVZWGprY2k4QTk5aVF1VXArcFQ4SHhtNVIyWXhI?=
 =?utf-8?B?clROQzV0R1V6Q09OZ2dYVkRtdWczQmVqWmFWdVU4STE3T1paUzFaV0Vub0oy?=
 =?utf-8?B?bUZSM3dpK3QvQlVuQ280Wm5PMGZlVTJKRHZxemE5WTJpUTFTQWlvU1lneTh2?=
 =?utf-8?B?Slowa1p4VDUzNi9GbHNnU3A4Nlc5T09IZFVmeXlMM3M5c1pFdU5NZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 633fb6d5-5425-44e5-1851-08de741ab92b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 03:05:26.6467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ea0lUf0TXRT/+41NFSR+qm154QrhzHeKh2Yk6SmxSOzhfshHK4gSC62/gCy5r8UCBoF4g2cweO9cUuSs+Y7Jtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33683-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1F9011911A9
X-Rspamd-Action: no action

Hi Arnaud,

On Tue, Feb 24, 2026 at 12:33:33PM +0100, Arnaud Ferraris wrote:
> Hi,
> 
> Le 24/02/2026 à 12:01, Xu Yang a écrit :
> > This reverts commit 1366cd228b0c67b60a2c0c26ef37fe9f7cfedb7f.
> 
> I believe a plain revert isn't the right solution here, as we'll get to the
> same point as we were before 1366cd228b0c, where some devices stopped
> working properly with newer kernels.

I don't think 1366cd228b0c fix the real root problem because the description
should be wrong in the commit message. If -EPROBE_DEFER is returned by
fwnode_usb_role_switch_get(), the ports node should be in connector node
instead of tcpc node. However, you get the error when ports in tcpc node.

Could you double check the issue, so we can find a proper solution and avoid
the further regression?

> 
> > 
> > The fwnode_usb_role_switch_get() returns NULL only if no connection is
> > found, returns ERR_PTR(-EPROBE_DEFER) if connection is found but deferred
> > probe is needed, or a valid pointer of usb_role_switch.
> > 
> > When switching from NULL check to IS_ERR_OR_NULL(), usb_role_switch_get()
> > will return NULL pointer which will override ERR_PTR(-EPROBE_DEFER) which
> > is returned by fwnode_usb_role_switch_get(). Then usb role switch can't be
> > obtained because the defer probe info is lost. So the unique error should
> > not be regarded the same as NULL.
> > 
> > Fixes: 1366cd228b0c ("tcpm: allow looking for role_sw device in the main node")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > ---
> > Also correct a description in 1366cd228b0c ("tcpm: allow looking for
> > role_sw device in the main node"), if the ports are defined in the tcpc
> > main node, NULL pointer is returned by fwnode_usb_role_switch_get()
> > instead of an error.
> > ---
> >   drivers/usb/typec/tcpm/tcpm.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> > index 1d2f3af034c5..8e0e14a2704e 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -7890,7 +7890,7 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
> >   	port->partner_desc.identity = &port->partner_ident;
> >   	port->role_sw = fwnode_usb_role_switch_get(tcpc->fwnode);
> > -	if (IS_ERR_OR_NULL(port->role_sw))
> > +	if (!port->role_sw)
> 
> It might be worth saving the error and restoring it after the call to
> usb_role_switch_get() instead, something like:
> 
> 	if (IS_ERR_OR_NULL(port->role_sw)) {
> 		err = PTR_ERR(port->role_sw);
> 		port->role_sw = usb_role_switch_get(port->dev);
> 		if (!port->role_sw)
> 			port->role_sw = ERR_PTR(err);
> 	}

It works but we'd better to get the thing clear firstly.

Thanks,
Xu Yang

