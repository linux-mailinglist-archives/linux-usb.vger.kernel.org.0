Return-Path: <linux-usb+bounces-31359-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1224ECB26D1
	for <lists+linux-usb@lfdr.de>; Wed, 10 Dec 2025 09:33:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01BEE3123891
	for <lists+linux-usb@lfdr.de>; Wed, 10 Dec 2025 08:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366AC2FF17F;
	Wed, 10 Dec 2025 08:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="CJg932vN";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="oAc9JNlg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E6C3002BB;
	Wed, 10 Dec 2025 08:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765355497; cv=fail; b=j07HfIb34fpBDWOc1zeEn0xOAA79xPvFkYwQKeUa1fTHrNb+GroTObjUgjhUiuKHpBD34Z4dsD7+EkQb51d0PwLecTBVZKt3oma+gzW649qsQlWkG2bAvQNYWqqcpVNGtQhaskhcHGhhesBk314geYbv/R45Oy/v0QPFbaByCMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765355497; c=relaxed/simple;
	bh=lMmxYEUAIw4siRM7ZL40q7cfZ35hw759ZJIMw8a5in0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WGw4oBR27Tn7n3Yu2ykil+qPL6TSn/3ubR06m0TFCSDmTZ9qVVdPK4MVGj00b0SrPw7Ns9yeoQ4TBNjWR45midPXuctFovtD10f79DUTMkSjCGEOcBMqY2hRh93QVDaAEHTeKHyApezCb0TCwqVXRWZ0JsukxVYa3njQ9rKmslg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=CJg932vN; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=oAc9JNlg; arc=fail smtp.client-ip=205.220.184.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6UPoF3242683;
	Wed, 10 Dec 2025 09:31:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=270620241; bh=NNXQvhBfjaUA44s8VRY1WkW1
	Qi79govWSPTR8Ux1lpk=; b=CJg932vN5cHonI2HetxoLdSxUHsJ9jMz3AXd8VnH
	ab2GU+TU4yCw8tq/sKbOKhXsXI1O+++f+4qPkRSpJ+6MjX/NPkdbtukPc1CagQzv
	rtw5X7oKS7P7rNkMrMWGyGMaxEjSgaqnrzfW92w66t284u0Ur1yliaFePZN/7pa2
	ljWngdeydLnvHhDdBPtgCLqZzxzEuUgip3oLjfuQ+aF4N604RPeZWOVAx4b6/Cul
	SAXJfKQOM2xHyB4Gu4LSb43DIpHTSgkmIRCDXG1poaC6j4RASu41PlWJCj73kaEW
	KHmDjShJs4SQ9ARn+aEaNyGHjTyKiq5tNihr7LUJMU3+oQ==
Received: from osppr02cu001.outbound.protection.outlook.com (mail-norwayeastazon11023088.outbound.protection.outlook.com [40.107.159.88])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4ay01a89gu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 09:31:13 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cuyL7SIpwHWntaHfcQ9b7SzC26anyX7BG8mY+Kiy6ZVuSL1gJXvmUSrHhNGfHxCqknq2RJcqveBtGg9yVp37hW03JUqVw7GAPP9zdtzbu0w3ISImltBq9pZolJE/ASJq0XIVuDwrn/fizZ27o9MFY8YAB4gmjshEZ8KaSmxcedXEPqhZ1yTuOw/26Ym3go7VWU8UR+pRcFqEQ447OnbwpdjeXZASaMTeOvC8YcP/DouX24KxSISIxP3Qf7pulOy/aUE1Sj+BuNoxeeoLYY7qMShsWFah4ochm8ZAXJYb1GPqdjNe8oKctXHYNSxgz4hTzidpAZ0WiRmwIIvhQze5Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNXQvhBfjaUA44s8VRY1WkW1Qi79govWSPTR8Ux1lpk=;
 b=KsBe8JXQyhByR9OA5xHm+0GUGf4kbZql6oBjcePLyycnO42MA4TFXw+3g/xUzpdnOjNyzKjZXnWPWe5yYLgRXSA8ZPWdhL7y3vjq113/mHso+nfZTNJdsy5+QWTXU41/wng+4XVOCpN8OeQFRXz9sVUwcRheXUZ7NfSIHho2Dl93fG0kO8nLf9KZskoptaStPOhHAHUP4Cv8bzwn9YsrnaIZQ6mxQht7AYxsJVA+YLyidrbhUDCVvaBl1aB9vhczyflTceh8W3pIhXxjDKb6ycTtli5qvW+qmQvFo7E/bSkzewoXioWND/btuOWsfpOs7j2eLBn4WDxOgFdEK32kIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNXQvhBfjaUA44s8VRY1WkW1Qi79govWSPTR8Ux1lpk=;
 b=oAc9JNlgwKZ0va2r/KSbq8HOUCKK5EMmQ1byBXeV91SVCgLNjNgbP60Hqg7cZwYkmte9F8ZCyo2KA1WOmXiH8pvL4F4L3qpGeNDN5e9COl45t81uILgy/1wHuIW2MHy5lwGcNig3/H9PhUkWmHclJ9/bJuu9/NnHBwKplqNjjkg=
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM (2603:10a6:d10:17c::10)
 by PA1P192MB3161.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:4ff::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 08:31:10 +0000
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0]) by FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0%5]) with mapi id 15.20.9388.013; Wed, 10 Dec 2025
 08:31:10 +0000
Date: Wed, 10 Dec 2025 09:31:05 +0100
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: usb: Error while assigning device slot ID
Message-ID: <aTkvyXSs6_lChFdr@FUE-ALEWI-WINX>
References: <aTFr17xKxnWGG3vU@FUE-ALEWI-WINX>
 <958c8848-945e-4fe0-9ebf-481155e11d73@linux.intel.com>
 <aTKWWjfWihg0a9WP@FUE-ALEWI-WINX>
 <b8947ce6-8e34-45fa-aaa9-262ac1232bcf@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8947ce6-8e34-45fa-aaa9-262ac1232bcf@linux.intel.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-ClientProxiedBy: GVZP280CA0098.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:275::8) To FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:d10:17c::10)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRWP192MB2997:EE_|PA1P192MB3161:EE_
X-MS-Office365-Filtering-Correlation-Id: b5a8619e-14e2-4f24-ce75-08de37c678e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mOZr3st2yEe8oyj+uUorJ4NVBgx+a0QuCZlgHXp+Z9AuMPxCLkqdTmeofL7U?=
 =?us-ascii?Q?XGLswTmnlXzpTK/3SbgGK05ICGIOMBt85ie+gVbf/YFe9R88eb2D9ZGfOFAw?=
 =?us-ascii?Q?xNZtLUqB6WouvAN+JOSUoIRdf1M9QwySKr6W8stsCTPZXIh+L8ERxTjDtQ95?=
 =?us-ascii?Q?EbRIMdv0Ln8RjfmUG3gKkC33peLEfHHkmPX2slsZj3FUxwxAWSYueaYogg+x?=
 =?us-ascii?Q?23zjmd409gc/lVU1VmfH7bACXTRjWaYxuSJOJeCrEOtPaQ99QcO5hXfnoiE9?=
 =?us-ascii?Q?6lxSz3wimCxoTP3CNWMbbXx+prdtgOJOqSimQPeQ6bWK4HPpglEhMRBLk8kE?=
 =?us-ascii?Q?+NUDrkixbpDZA2WtScdFiF5IOlz7t6F8o/6b9Q9ex25ByzMCUqHiWXEWSHoQ?=
 =?us-ascii?Q?+Nm7VABI0V7lkONH8LEVGBwCwcWooG5Sg+zhwBxnXCBQ6srL85bBmvNVhZfm?=
 =?us-ascii?Q?3VbcAXBuyByC5Y4XTMbbfybGGz7VGkVxev1goGXcr9g7DWZ8rZjM2XjNE8Zl?=
 =?us-ascii?Q?bUuxeFecVKYKMcR+4YwT1W0c7cLWa5v6wX98y6/Cp9R9+7HgyAc191CGMveM?=
 =?us-ascii?Q?0ouvbeafWlL7nGWeeDu8bgeM1kNpK4LtJIh+fxFsWJSEz65+iV6jzhehHkOq?=
 =?us-ascii?Q?jh0SQ8W9Y1bSCBC6gbRYLB8WT/EdBv4EFHwaN/HKWPK9EQ5M45hyqcAr4aZC?=
 =?us-ascii?Q?gP4ME4jyTioJYhDffmsc9TfU1U0K8yFoJbI9rYUNKxchSZvgvDHbilfHQlEP?=
 =?us-ascii?Q?853kiAx+EKzGZCljub8sYxk27xeRvmDUJxh+EcSVWOVGM4IOz3V0m16W4BFz?=
 =?us-ascii?Q?QXik0gWsf3CvHhNdxBoVC6xGpasMgI6NWcyTnkHRzuwiRsWqbPPNMTTXbCdU?=
 =?us-ascii?Q?Gc6ima871jrXChA0pB1eHXt6EHHdE+95XF+bg6rBh+QpS6XDLqlJOj/iutmy?=
 =?us-ascii?Q?KCuu6PAQEw+BavFU3mkrdblZFcBRv5B425i0wT6PJebQ2bPq11UPwv4U4bMq?=
 =?us-ascii?Q?kOQ8sCerjZDYOA+vMdRsr7pvBjlGXEqnHeYVrzNYTyBwRn2MRrGVRYZqAnN7?=
 =?us-ascii?Q?ceNcjd4DSTNWRDnmII6UhN3SsuLCKnqFzY1wipLlnhHrmL1q/EEzI1UjTDRE?=
 =?us-ascii?Q?WuqL4LSxjuIh7jqt1aTWOyvOSxFeyGTaJVUZrTgkKyZ2Q+RHprhW1kI5/c4X?=
 =?us-ascii?Q?JCUyHSxVgnFkaOniTp/zE9uaQncnGECwnTTszDB6spDi+c+0GcFPR6IdM146?=
 =?us-ascii?Q?S3Czzb5zgObca2tCglgBZIJIRS9PMY4WXPDtrnxVH8LvV0M6+FJYqBgxnHfx?=
 =?us-ascii?Q?Oj6WNiKMRRoi1CaoUtgQCkOkVZ/1czCFQ35OqfBRv9bqb/ZvAMQ5aG6A+rcv?=
 =?us-ascii?Q?oZwNTTStVIhZGIALOF/aD6iKDbDe6zBtaAe5sJ/cw+SMRK5Ed304szrbW+IB?=
 =?us-ascii?Q?lDsM+0p5zTeD3Yf3mA6NuXmAodkE7AW9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWP192MB2997.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vDrJF/QFN/Hncwt7pPq8sR2n3vNt651TKYS++K6x2/ZA8rnWO5aeToAZzfvq?=
 =?us-ascii?Q?iUXWI+e3sG9GwXcuCcaRFpbDmJOkIGGIiFQ/dpl18jci5/1AYPG7s63ibkel?=
 =?us-ascii?Q?kt7QtauziXJ9TNkCYzAOOjZ8Pbn/coWTDXlyNUFw48ysJWtL1n82r1VzAfZC?=
 =?us-ascii?Q?7XYuNzocd8bpBSgfcQv7v6JCBUVCIe07i70XzPxXZazCA7sJ81ifAkaQY/3k?=
 =?us-ascii?Q?bPCKnMUd+wBRfArmut0oRPQVCBh/sQHyT98bwsrIa7M3d4yEBVnOayetHPgz?=
 =?us-ascii?Q?1Ck4lSCVxvsZsdu2GON/Q2KZxelxaC3YYwPx3DNdkq1N53WZOd5EGNV4N0jY?=
 =?us-ascii?Q?YXNTHKUerqcTLzVkfJ2c5kk7KHriJgcv97guHo9/yI/WPfaHL7kBVbdFhzux?=
 =?us-ascii?Q?ieoQ6hwyaQaP+6+1dNoxHOq6moOHD030PEH4il9Akh5FMlTqwObsUQbixZIb?=
 =?us-ascii?Q?MSPhyMYCJKIJ4y0gTnNu2cRkLtwoKGXvi7bk80rlfkWkVyTCrq8r9rEUsdWW?=
 =?us-ascii?Q?tXDS+frXR1lFdR5Gg/Aosxh43DB4o44tPuH7NMzvx9T7zS5LEQhcLAyGNIgB?=
 =?us-ascii?Q?J1flBHkJAzizRQnGfqIruoS75lAO6iqCKHP4WDfBrJB6a7BBC4ZTctMEp03o?=
 =?us-ascii?Q?ZVeCpp9Ggpbs0ARVbZABOfyn9QBeHtbCR/tvhnKFE7BE84e583meJlrA620v?=
 =?us-ascii?Q?INB2/eTP2FEGUNfVGbdBtzvNU2mUG7yn7JoIiWPn/fz64YMg9oAiRVHiRc65?=
 =?us-ascii?Q?F3m282FkiTfTvkjU9eG0ZJvDufO7veXJLGlNzuTGTSC2udt0eQO2BKHxI7qj?=
 =?us-ascii?Q?rHS4PgJpAgamGIqOFlms+8ni3LgVBgwjd81gbQQI+mLZNwkRTFzyZ0eydQbc?=
 =?us-ascii?Q?XeJeS8j/qCfwUkkK7K5/WcFhJIihE3iFNkVm6DL6iVUfK7IUoG8wTdVG3pl6?=
 =?us-ascii?Q?R47VkO6oF/zxDNJL26BgSEfTGD0+Dv1MRhllOLsHAvlVXZpujfYqxd7Ul7ZY?=
 =?us-ascii?Q?iPVxcna2i5XPFkYzchYem4g3PxoGu9rP6D+U8A6mLgkhZqxLDVy0EkokP6AN?=
 =?us-ascii?Q?Q0e2l57SL3DXIwEY0rDfu5dUVkj267YdXIkH9TfDQTn7OhTh9RecaKRc+THM?=
 =?us-ascii?Q?sFezp/1Zv/AxMci0lGLw0NE0HxCMq2IOywykuklC17mhmc6p8e8Baj9srjN0?=
 =?us-ascii?Q?OinfpodGS1WYiQZxoyzrFz5LTT56UqphKUnrIlUG6BiVU5cCxn3nUUbaPAZ1?=
 =?us-ascii?Q?n3AmAHFMW5aZZt1GkfVM2DUYILTqHp0GBHam57MBqtQwLfhJkZVFMzK0yVyV?=
 =?us-ascii?Q?aupRotSBzu0LURtzs6cEv6WFSLHhoPcsOMB27OObl3HOe5G13BSD6ZitYF6N?=
 =?us-ascii?Q?mhmRzAy1oy1T5RDFax/vJ7J/5s0wtw5KHn1I6kxyExpPw4U2YTrrpIm5+5Sj?=
 =?us-ascii?Q?oJjjT7mf6JEuKGxs8ZUClww8ngAJKL2HMMFFFAMQFz+erdUy5cwlOusUB2JK?=
 =?us-ascii?Q?OzlbF9WcoBAz7LdlD+4n5FhAUBBAvYakE+Lo9MAKoc4ERhKjlPHMpfRzZ2j6?=
 =?us-ascii?Q?9+JTt9pSUBnT3aEV/BKrPSYuj1T/UUDnRcDrzz2T?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pkWxvjxM2nJT0/XU41HD9sIueOWrdzMfqoqgp9NusJRa3OuyW7xResS+cD3QvXrlLuHVCDbP3XfeAq4c5tAb/oHcjOJeIr/+X/01tl/cNsUEyI8EiuojorlCfzYRdPjgu23x81crDEqt+94ZLHgKO3h5iEwxrdVmCnkBSXimeOyQlokSM1HN/IbishrCTmG9nAXjDHLpnkJnLTGrj1x8+ZrffBXP9h+EPLUiA7A3W/EyeJdKcErgNW0Jatkc4VxRYsju6LmVV19EGabZi/nZEafyokV2nlY4KWLB7+JVToRezvTownnGr6nJ/UENTbllzs81UtgNKIz6ncPzEUeeiiME1BgCeq8/am7PE/WR58ZcFLwz4vGuorDhu1EG9o9ogidubOMLRbe0Sb7+HxajHsQX6QfaWWFuWvmXBhYtYch4jgq6vaZrQtDrblpQazV06onIm70RaM50p0g6G9WuhQrsxp1ku3cNMUHsEGOiFx8KWYYHPectipJj6LypsD0HzHv4RedvwSYrKqW+/Mg5tR5aibOH3fThNYilGs1cKpgtm1lEstzolGFaDxv0BSNUDbch4zWNFGnAAoM9I67ac0bA7dolUOsSQR0d5akVsJwoROw0cXgPuOHsE5bqA8HZ
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a8619e-14e2-4f24-ce75-08de37c678e2
X-MS-Exchange-CrossTenant-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 08:31:10.7628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/9A1rocZxCylJNJ40eO2vwfffHsoIbYZVLJ07758NHMcxK0r8j5D4ZTyzQycF2vKa9alBTdVu8pP4rzNDZLtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P192MB3161
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
X-OrganizationHeadersPreserved: PA1P192MB3161.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-GUID: 0fbeQCbCLTCvrittLw85I9wxoNT5m-P_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA3MyBTYWx0ZWRfX3saPiWxuDBDG
 se59g62isr31CUTALZE+X2FzErGOudm0pIxLlMwAujbxM+TUTA6Zgzi0xwq2FkPTqhpqMky1/0V
 Zbb2wzYtO17RkhpM+NY09OzUJAOibQuGbuy0p3MbwF13uoMSahE7ZaylMa0yxzGOHsAlZCiqLSt
 /Tg2r2WXvOV8v64I9CemqdIoyUdOkQvgPX2Fjy90VMRSvEcG71n/gA+1oWG7WypKliaH+55DsZj
 354gcF8AXzdccUBUVBRD2x7XbdnvwxMtI/rx+Fq9nrj0KslrbCld+EnF2eICbzC28tHn4IBocvP
 US8srp/MBSCr8BkNSwpfXVocKMsbjdNqfsXP8O5s4zJ5col1TN2WEnIw+bcjrBQ3fZaIWcWo2z7
 U+Hoa9ietsABxlWseBYsauzCfRSvbg==
X-Proofpoint-ORIG-GUID: 0fbeQCbCLTCvrittLw85I9wxoNT5m-P_
X-Authority-Analysis: v=2.4 cv=etrSD4pX c=1 sm=1 tr=0 ts=69392fd2 cx=c_pps
 a=z8YjDtZOedIymj+2b1S5Vw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yCSaODmWOhUo12K6M8IA:9 a=JOwMcCZCrZC84J6W:21
 a=CjuIK1q_8ugA:10

Hi Mathias,

On Tue, Dec 09, 2025 at 04:53:31PM +0200, Mathias Nyman wrote:
> Hi
> 
> Flash driver appears as a Full-Speed device. Is this correct?

Yes, that's right.

> Does it work if you boot without the drive and then connect it later?

If I do so, nothing happens and I see nothing in logread, too.

[...]
> Could you add xhci tracing, and dump the command and event rings after timeout?

Sure, here are the commands and their respective output:

    user@host:~# echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
    user@host:~# echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
    user@host:~# echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
    user@host:~# echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
    user@host:~# echo 1 > /sys/kernel/debug/tracing/tracing_on
    user@host:~# modprobe xhci_plat_hcd

logread:

    xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
    xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 1
    xhci-hcd xhci-hcd.1.auto: // Halt the HC
    xhci-hcd xhci-hcd.1.auto: Resetting HCD
    xhci-hcd xhci-hcd.1.auto: // Reset the HC
    xhci-hcd xhci-hcd.1.auto: Wait for controller to be ready for doorbell rings
    xhci-hcd xhci-hcd.1.auto: Reset complete
    xhci-hcd xhci-hcd.1.auto: Enabling 64-bit DMA addresses.
    xhci-hcd xhci-hcd.1.auto: Calling HCD init
    xhci-hcd xhci-hcd.1.auto: xhci_init
    xhci-hcd xhci-hcd.1.auto: xHCI doesn't need link TRB QUIRK
    xhci-hcd xhci-hcd.1.auto: Supported page size register = 0x1
    xhci-hcd xhci-hcd.1.auto: Supported page size of 4K
    xhci-hcd xhci-hcd.1.auto: HCD page size set to 4K
    xhci-hcd xhci-hcd.1.auto: // xHC can handle at most 127 device slots.
    xhci-hcd xhci-hcd.1.auto: // Setting Max device slots reg = 0x7f.
    xhci-hcd xhci-hcd.1.auto: // Device context base array address = 0x0x00000000fb152000 (DMA), 00000000ad2d5218 (virt)
    xhci-hcd xhci-hcd.1.auto: Allocated command ring at 000000000ed94e0c
    xhci-hcd xhci-hcd.1.auto: First segment DMA is 0x0x000000009dd60000
    xhci-hcd xhci-hcd.1.auto: // Setting command ring address to 0x000000009dd60001
    xhci-hcd xhci-hcd.1.auto: // Doorbell array is located at offset 0x480 from cap regs base addr
    xhci-hcd xhci-hcd.1.auto: Allocating primary event ring
    xhci-hcd xhci-hcd.1.auto: // Write event ring dequeue pointer, preserving EHB bit
    xhci-hcd xhci-hcd.1.auto: Allocating 2 scratchpad buffers
    xhci-hcd xhci-hcd.1.auto: Ext Cap 0000000010cc46a0, port offset = 1, count = 1, revision = 0x2
    xhci-hcd xhci-hcd.1.auto: xHCI 1.0: support USB2 hardware lpm
    xhci-hcd xhci-hcd.1.auto: Ext Cap 00000000d44c9886, port offset = 2, count = 1, revision = 0x3
    xhci-hcd xhci-hcd.1.auto: Found 1 USB 2.0 ports and 1 USB 3.0 ports.
    xhci-hcd xhci-hcd.1.auto: Finished xhci_init
    xhci-hcd xhci-hcd.1.auto: Called HCD init
    xhci-hcd xhci-hcd.1.auto: hcc params 0x0220f66d hci version 0x100 quirks 0x0000008002000810
    xhci-hcd xhci-hcd.1.auto: supports USB remote wakeup
    xhci-hcd xhci-hcd.1.auto: irq 65, io mem 0x02f00000
    xhci-hcd xhci-hcd.1.auto: xhci_run
    xhci-hcd xhci-hcd.1.auto: ERST deq = 64'h8700a000
    xhci-hcd xhci-hcd.1.auto: Finished xhci_run for main hcd
    xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
    xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 2
    xhci-hcd xhci-hcd.1.auto: Host supports USB 3.0 SuperSpeed
    xhci-hcd xhci-hcd.1.auto: supports USB remote wakeup
    xhci-hcd xhci-hcd.1.auto: Enable interrupts
    xhci-hcd xhci-hcd.1.auto: Enable primary interrupter
    xhci-hcd xhci-hcd.1.auto: // Turn on HC, cmd = 0x5.
    usb usb1: default language 0x0409
    usb usb1: udev 1, busnum 1, minor = 0
    usb usb1: usb_probe_device
    usb usb1: configuration #1 chosen from 1 choice
    xHCI xhci_add_endpoint called for root hub
    xHCI xhci_check_bandwidth called for root hub
    usb usb1: adding 1-0:1.0 (config #1, interface 0)
    hub 1-0:1.0: usb_probe_interface
    hub 1-0:1.0: usb_probe_interface - got id
    hub 1-0:1.0: USB hub found
    hub 1-0:1.0: 1 port detected
    hub 1-0:1.0: standalone hub
    hub 1-0:1.0: individual port power switching
    hub 1-0:1.0: individual port over-current protection
    hub 1-0:1.0: Single TT
    hub 1-0:1.0: TT requires at most 8 FS bit times (666 ns)
    hub 1-0:1.0: power on to power good time: 20ms
    hub 1-0:1.0: local power source is good
    hub 1-0:1.0: enabling power on all ports
    xhci-hcd xhci-hcd.1.auto: set port power 1-1 ON, portsc: 0x2a0
    usb usb2: skipped 1 descriptor after endpoint
    usb usb2: default language 0x0409
    usb usb2: udev 1, busnum 2, minor = 128
    usb usb2: usb_probe_device
    usb usb2: configuration #1 chosen from 1 choice
    xHCI xhci_add_endpoint called for root hub
    xHCI xhci_check_bandwidth called for root hub
    usb usb2: adding 2-0:1.0 (config #1, interface 0)
    hub 2-0:1.0: usb_probe_interface
    hub 2-0:1.0: usb_probe_interface - got id
    hub 2-0:1.0: USB hub found
    hub 2-0:1.0: 1 port detected
    hub 2-0:1.0: standalone hub
    hub 2-0:1.0: individual port power switching
    hub 2-0:1.0: individual port over-current protection
    hub 2-0:1.0: TT requires at most 8 FS bit times (666 ns)
    hub 2-0:1.0: power on to power good time: 100ms
    hub 2-0:1.0: local power source is good
    usb usb2-port1: peered to usb1-port1
    hub 2-0:1.0: enabling power on all ports
    xhci-hcd xhci-hcd.1.auto: set port power 2-1 ON, portsc: 0x2a0
    xhci-hcd xhci-hcd.2.auto: xHCI Host Controller
    xhci-hcd xhci-hcd.2.auto: new USB bus registered, assigned bus number 3
    xhci-hcd xhci-hcd.2.auto: // Halt the HC
    xhci-hcd xhci-hcd.2.auto: Resetting HCD
    xhci-hcd xhci-hcd.2.auto: // Reset the HC
    xhci-hcd xhci-hcd.2.auto: Wait for controller to be ready for doorbell rings
    xhci-hcd xhci-hcd.2.auto: Reset complete
    xhci-hcd xhci-hcd.2.auto: Enabling 64-bit DMA addresses.
    xhci-hcd xhci-hcd.2.auto: Calling HCD init
    xhci-hcd xhci-hcd.2.auto: xhci_init
    xhci-hcd xhci-hcd.2.auto: xHCI doesn't need link TRB QUIRK
    xhci-hcd xhci-hcd.2.auto: Supported page size register = 0x1
    xhci-hcd xhci-hcd.2.auto: Supported page size of 4K
    xhci-hcd xhci-hcd.2.auto: HCD page size set to 4K
    xhci-hcd xhci-hcd.2.auto: // xHC can handle at most 127 device slots.
    xhci-hcd xhci-hcd.2.auto: // Setting Max device slots reg = 0x7f.
    xhci-hcd xhci-hcd.2.auto: // Device context base array address = 0x0x000000008709c000 (DMA), 000000009ed5fbd5 (virt)
    xhci-hcd xhci-hcd.2.auto: Allocated command ring at 000000003be51046
    xhci-hcd xhci-hcd.2.auto: First segment DMA is 0x0x00000000810cc000
    xhci-hcd xhci-hcd.2.auto: // Setting command ring address to 0x00000000810cc001
    xhci-hcd xhci-hcd.2.auto: // Doorbell array is located at offset 0x480 from cap regs base addr
    xhci-hcd xhci-hcd.2.auto: Allocating primary event ring
    xhci-hcd xhci-hcd.2.auto: // Write event ring dequeue pointer, preserving EHB bit
    xhci-hcd xhci-hcd.2.auto: Allocating 2 scratchpad buffers
    xhci-hcd xhci-hcd.2.auto: Ext Cap 00000000183dcc08, port offset = 1, count = 1, revision = 0x2
    xhci-hcd xhci-hcd.2.auto: xHCI 1.0: support USB2 hardware lpm
    xhci-hcd xhci-hcd.2.auto: Ext Cap 00000000acf2f25f, port offset = 2, count = 1, revision = 0x3
    xhci-hcd xhci-hcd.2.auto: Found 1 USB 2.0 ports and 1 USB 3.0 ports.
    xhci-hcd xhci-hcd.2.auto: Finished xhci_init
    xhci-hcd xhci-hcd.2.auto: Called HCD init
    xhci-hcd xhci-hcd.2.auto: hcc params 0x0220f66d hci version 0x100 quirks 0x0000008002000810
    xhci-hcd xhci-hcd.2.auto: supports USB remote wakeup
    xhci-hcd xhci-hcd.2.auto: irq 66, io mem 0x03000000
    xhci-hcd xhci-hcd.2.auto: xhci_run
    xhci-hcd xhci-hcd.2.auto: ERST deq = 64'hfb7b7000
    xhci-hcd xhci-hcd.2.auto: Finished xhci_run for main hcd
    xhci-hcd xhci-hcd.2.auto: xHCI Host Controller
    xhci-hcd xhci-hcd.2.auto: new USB bus registered, assigned bus number 4
    xhci-hcd xhci-hcd.2.auto: Host supports USB 3.0 SuperSpeed
    xhci-hcd xhci-hcd.2.auto: supports USB remote wakeup
    xhci-hcd xhci-hcd.2.auto: Enable interrupts
    xhci-hcd xhci-hcd.2.auto: Enable primary interrupter
    xhci-hcd xhci-hcd.2.auto: // Turn on HC, cmd = 0x5.
    usb usb3: default language 0x0409
    usb usb3: udev 1, busnum 3, minor = 256
    usb usb3: usb_probe_device
    usb usb3: configuration #1 chosen from 1 choice
    xHCI xhci_add_endpoint called for root hub
    xHCI xhci_check_bandwidth called for root hub
    usb usb3: adding 3-0:1.0 (config #1, interface 0)
    hub 3-0:1.0: usb_probe_interface
    hub 3-0:1.0: usb_probe_interface - got id
    hub 3-0:1.0: USB hub found
    hub 3-0:1.0: 1 port detected
    hub 3-0:1.0: standalone hub
    hub 3-0:1.0: individual port power switching
    hub 3-0:1.0: individual port over-current protection
    hub 3-0:1.0: Single TT
    hub 3-0:1.0: TT requires at most 8 FS bit times (666 ns)
    hub 3-0:1.0: power on to power good time: 20ms
    hub 3-0:1.0: local power source is good
    hub 3-0:1.0: enabling power on all ports
    xhci-hcd xhci-hcd.2.auto: set port power 3-1 ON, portsc: 0x2a0
    usb usb4: skipped 1 descriptor after endpoint
    usb usb4: default language 0x0409
    usb usb4: udev 1, busnum 4, minor = 384
    usb usb4: usb_probe_device
    usb usb4: configuration #1 chosen from 1 choice
    xHCI xhci_add_endpoint called for root hub
    xHCI xhci_check_bandwidth called for root hub
    usb usb4: adding 4-0:1.0 (config #1, interface 0)
    hub 4-0:1.0: usb_probe_interface
    hub 4-0:1.0: usb_probe_interface - got id
    hub 4-0:1.0: USB hub found
    hub 4-0:1.0: 1 port detected
    hub 4-0:1.0: standalone hub
    hub 4-0:1.0: individual port power switching
    hub 4-0:1.0: individual port over-current protection
    hub 4-0:1.0: TT requires at most 8 FS bit times (666 ns)
    hub 4-0:1.0: power on to power good time: 100ms
    hub 4-0:1.0: local power source is good
    usb usb4-port1: peered to usb3-port1
    hub 4-0:1.0: enabling power on all ports
    xhci-hcd xhci-hcd.2.auto: set port power 4-1 ON, portsc: 0x2a0
    xhci-hcd xhci-hcd.3.auto: xHCI Host Controller
    xhci-hcd xhci-hcd.3.auto: new USB bus registered, assigned bus number 5
    xhci-hcd xhci-hcd.3.auto: // Halt the HC
    xhci-hcd xhci-hcd.3.auto: Resetting HCD
    xhci-hcd xhci-hcd.3.auto: // Reset the HC
    xhci-hcd xhci-hcd.3.auto: Wait for controller to be ready for doorbell rings
    xhci-hcd xhci-hcd.3.auto: Reset complete
    xhci-hcd xhci-hcd.3.auto: Enabling 64-bit DMA addresses.
    xhci-hcd xhci-hcd.3.auto: Calling HCD init
    xhci-hcd xhci-hcd.3.auto: xhci_init
    xhci-hcd xhci-hcd.3.auto: xHCI doesn't need link TRB QUIRK
    xhci-hcd xhci-hcd.3.auto: Supported page size register = 0x1
    xhci-hcd xhci-hcd.3.auto: Supported page size of 4K
    xhci-hcd xhci-hcd.3.auto: HCD page size set to 4K
    xhci-hcd xhci-hcd.3.auto: // xHC can handle at most 127 device slots.
    xhci-hcd xhci-hcd.3.auto: // Setting Max device slots reg = 0x7f.
    xhci-hcd xhci-hcd.3.auto: // Device context base array address = 0x0x00000000813f1000 (DMA), 000000006440d11f (virt)
    xhci-hcd xhci-hcd.3.auto: Allocated command ring at 0000000099949093
    xhci-hcd xhci-hcd.3.auto: First segment DMA is 0x0x0000000086616000
    xhci-hcd xhci-hcd.3.auto: // Setting command ring address to 0x0000000086616001
    xhci-hcd xhci-hcd.3.auto: // Doorbell array is located at offset 0x480 from cap regs base addr
    xhci-hcd xhci-hcd.3.auto: Allocating primary event ring
    xhci-hcd xhci-hcd.3.auto: // Write event ring dequeue pointer, preserving EHB bit
    xhci-hcd xhci-hcd.3.auto: Allocating 2 scratchpad buffers
    xhci-hcd xhci-hcd.3.auto: Ext Cap 00000000aa5745f8, port offset = 1, count = 1, revision = 0x2
    xhci-hcd xhci-hcd.3.auto: xHCI 1.0: support USB2 hardware lpm
    xhci-hcd xhci-hcd.3.auto: Ext Cap 000000004205fa17, port offset = 2, count = 1, revision = 0x3
    xhci-hcd xhci-hcd.3.auto: Found 1 USB 2.0 ports and 1 USB 3.0 ports.
    xhci-hcd xhci-hcd.3.auto: Finished xhci_init
    xhci-hcd xhci-hcd.3.auto: Called HCD init
    xhci-hcd xhci-hcd.3.auto: hcc params 0x0220f66d hci version 0x100 quirks 0x0000008002000810
    xhci-hcd xhci-hcd.3.auto: supports USB remote wakeup
    xhci-hcd xhci-hcd.3.auto: irq 67, io mem 0x03100000
    xhci-hcd xhci-hcd.3.auto: xhci_run
    xhci-hcd xhci-hcd.3.auto: ERST deq = 64'h9dd65000
    xhci-hcd xhci-hcd.3.auto: Finished xhci_run for main hcd
    xhci-hcd xhci-hcd.3.auto: xHCI Host Controller
    xhci-hcd xhci-hcd.3.auto: new USB bus registered, assigned bus number 6
    xhci-hcd xhci-hcd.3.auto: Host supports USB 3.0 SuperSpeed
    xhci-hcd xhci-hcd.3.auto: supports USB remote wakeup
    xhci-hcd xhci-hcd.3.auto: Enable interrupts
    xhci-hcd xhci-hcd.3.auto: Enable primary interrupter
    xhci-hcd xhci-hcd.3.auto: // Turn on HC, cmd = 0x5.
    usb usb5: default language 0x0409
    usb usb5: udev 1, busnum 5, minor = 512
    usb usb5: usb_probe_device
    usb usb5: configuration #1 chosen from 1 choice
    xHCI xhci_add_endpoint called for root hub
    xHCI xhci_check_bandwidth called for root hub
    usb usb5: adding 5-0:1.0 (config #1, interface 0)
    hub 5-0:1.0: usb_probe_interface
    hub 5-0:1.0: usb_probe_interface - got id
    hub 5-0:1.0: USB hub found
    hub 5-0:1.0: 1 port detected
    hub 5-0:1.0: standalone hub
    hub 5-0:1.0: individual port power switching
    hub 5-0:1.0: individual port over-current protection
    hub 5-0:1.0: Single TT
    hub 5-0:1.0: TT requires at most 8 FS bit times (666 ns)
    hub 5-0:1.0: power on to power good time: 20ms
    hub 5-0:1.0: local power source is good
    hub 5-0:1.0: enabling power on all ports
    xhci-hcd xhci-hcd.3.auto: set port power 5-1 ON, portsc: 0x206e1
    usb usb6: skipped 1 descriptor after endpoint
    usb usb6: default language 0x0409
    usb usb6: udev 1, busnum 6, minor = 640
    usb usb6: usb_probe_device
    usb usb6: configuration #1 chosen from 1 choice
    xHCI xhci_add_endpoint called for root hub
    xHCI xhci_check_bandwidth called for root hub
    usb usb6: adding 6-0:1.0 (config #1, interface 0)
    hub 6-0:1.0: usb_probe_interface
    hub 6-0:1.0: usb_probe_interface - got id
    hub 6-0:1.0: USB hub found
    hub 6-0:1.0: 1 port detected
    hub 6-0:1.0: standalone hub
    hub 6-0:1.0: individual port power switching
    hub 6-0:1.0: individual port over-current protection
    hub 6-0:1.0: TT requires at most 8 FS bit times (666 ns)
    hub 6-0:1.0: power on to power good time: 100ms
    hub 6-0:1.0: local power source is good
    usb usb6-port1: peered to usb5-port1
    hub 6-0:1.0: enabling power on all ports
    xhci-hcd xhci-hcd.3.auto: set port power 6-1 ON, portsc: 0x2a0
    xhci-hcd xhci-hcd.1.auto: Get port status 1-1 read: 0x2a0, return 0x100
    hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
    xhci-hcd xhci-hcd.3.auto: Get port status 5-1 read: 0x206e1, return 0x10101
    xhci-hcd xhci-hcd.2.auto: Get port status 3-1 read: 0x2a0, return 0x100
    hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
    usb usb5-port1: status 0101 change 0001
    xhci-hcd xhci-hcd.3.auto: clear port1 connect change, portsc: 0x6e1
    xhci-hcd xhci-hcd.1.auto: Get port status 2-1 read: 0x2a0, return 0x2a0
    hub 2-0:1.0: state 7 ports 1 chg 0000 evt 0000
    xhci-hcd xhci-hcd.2.auto: Get port status 4-1 read: 0x2a0, return 0x2a0
    hub 4-0:1.0: state 7 ports 1 chg 0000 evt 0000
    xhci-hcd xhci-hcd.3.auto: Get port status 6-1 read: 0x2a0, return 0x2a0
    hub 6-0:1.0: state 7 ports 1 chg 0000 evt 0000
    hub 5-0:1.0: state 7 ports 1 chg 0002 evt 0000
    xhci-hcd xhci-hcd.3.auto: Get port status 5-1 read: 0x6e1, return 0x101
    usb usb5-port1: status 0101, change 0000, 12 Mb/s
    xhci-hcd xhci-hcd.3.auto: // Ding dong!
    xhci-hcd xhci-hcd.3.auto: Command timeout, USBSTS: 0x00000000
    xhci-hcd xhci-hcd.3.auto: Command timeout
    xhci-hcd xhci-hcd.3.auto: Abort command ring
    xhci-hcd xhci-hcd.3.auto: No stop event for abort, ring start fail?
    xhci-hcd xhci-hcd.3.auto: Error while assigning device slot ID: Command Aborted
    xhci-hcd xhci-hcd.3.auto: Max number of devices this xHCI host supports is 127.
    usb usb5-port1: couldn't allocate usb_device
    xhci-hcd xhci-hcd.3.auto: Broken Port Enabled/Disabled, ignoring port disable request.

trace:

    # tracer: nop
    #
    # entries-in-buffer/entries-written: 103/103   #P:4
    #
    #                                _-----=> irqs-off/BH-disabled
    #                               / _----=> need-resched
    #                              | / _---=> hardirq/softirq
    #                              || / _--=> preempt-depth
    #                              ||| / _-=> migrate-disable
    #                              |||| /     delay
    #           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
    #              | |         |   |||||     |         |
            modprobe-20491   [001] .....   242.672902: xhci_dbg_init: // Halt the HC
            modprobe-20491   [001] .....   242.672913: xhci_dbg_init: // Reset the HC
            modprobe-20491   [001] .....   242.672942: xhci_dbg_init: Wait for controller to be ready for doorbell rings
            modprobe-20491   [001] .....   242.672957: xhci_dbg_init: xhci_init
            modprobe-20491   [001] .....   242.672962: xhci_dbg_init: xHCI doesn't need link TRB QUIRK
            modprobe-20491   [001] .....   242.672968: xhci_dbg_init: Supported page size register = 0x1
            modprobe-20491   [001] .....   242.672973: xhci_dbg_init: Supported page size of 4K
            modprobe-20491   [001] .....   242.672978: xhci_dbg_init: HCD page size set to 4K
            modprobe-20491   [001] .....   242.672983: xhci_dbg_init: // xHC can handle at most 127 device slots.
            modprobe-20491   [001] .....   242.672988: xhci_dbg_init: // Setting Max device slots reg = 0x7f.
            modprobe-20491   [001] .....   242.673000: xhci_dbg_init: // Device context base array address = 0x0x00000000fb152000 (DMA), 00000000ad2d5218 (virt)
            modprobe-20491   [001] .....   242.673007: xhci_ring_alloc: CMD 000000000ed94e0c: enq 0x000000009dd60000(0x000000009dd60000) deq 0x000000009dd60000(0x000000009dd60000) segs 1 stream 0 bounce 0 cycle 1
            modprobe-20491   [001] .....   242.673013: xhci_dbg_init: Allocated command ring at 000000000ed94e0c
            modprobe-20491   [001] .....   242.673018: xhci_dbg_init: First segment DMA is 0x0x000000009dd60000
            modprobe-20491   [001] .....   242.673025: xhci_dbg_init: // Setting command ring address to 0x000000009dd60001
            modprobe-20491   [001] .....   242.673031: xhci_dbg_init: // Doorbell array is located at offset 0x480 from cap regs base addr
            modprobe-20491   [001] .....   242.673036: xhci_dbg_init: Allocating primary event ring
            modprobe-20491   [001] .....   242.673040: xhci_ring_alloc: EVENT 0000000048d09142: enq 0x000000008700a000(0x000000008700a000) deq 0x000000008700a000(0x000000008700a000) segs 2 stream 0 bounce 0 cycle 1
            modprobe-20491   [001] .....   242.673047: xhci_dbg_init: // Write event ring dequeue pointer, preserving EHB bit
            modprobe-20491   [001] .....   242.673053: xhci_dbg_init: Allocating 2 scratchpad buffers
            modprobe-20491   [001] .....   242.673066: xhci_dbg_init: Ext Cap 0000000010cc46a0, port offset = 1, count = 1, revision = 0x2
            modprobe-20491   [001] .....   242.673072: xhci_dbg_init: xHCI 1.0: support USB2 hardware lpm
            modprobe-20491   [001] .....   242.673079: xhci_dbg_init: Ext Cap 00000000d44c9886, port offset = 2, count = 1, revision = 0x3
            modprobe-20491   [001] .....   242.673085: xhci_dbg_init: Found 1 USB 2.0 ports and 1 USB 3.0 ports.
            modprobe-20491   [001] .....   242.673090: xhci_dbg_init: Finished xhci_init
            modprobe-20491   [001] .....   242.673126: xhci_dbg_init: xhci_run
            modprobe-20491   [001] .....   242.673132: xhci_dbg_init: ERST deq = 64'h8700a000
            modprobe-20491   [001] .....   242.673137: xhci_dbg_init: Finished xhci_run for main hcd
            modprobe-20491   [001] d....   242.673236: xhci_dbg_init: Enable interrupts
            modprobe-20491   [001] d....   242.673240: xhci_dbg_init: Enable primary interrupter
            modprobe-20491   [001] d....   242.673245: xhci_dbg_init: // Turn on HC, cmd = 0x5.
            modprobe-20491   [001] .N...   242.675396: xhci_dbg_init: // Halt the HC
            modprobe-20491   [001] .N...   242.675445: xhci_dbg_init: // Reset the HC
            modprobe-20491   [001] .N...   242.675475: xhci_dbg_init: Wait for controller to be ready for doorbell rings
            modprobe-20491   [001] .N...   242.675490: xhci_dbg_init: xhci_init
            modprobe-20491   [001] .N...   242.675495: xhci_dbg_init: xHCI doesn't need link TRB QUIRK
            modprobe-20491   [001] .N...   242.675501: xhci_dbg_init: Supported page size register = 0x1
            modprobe-20491   [001] .N...   242.675506: xhci_dbg_init: Supported page size of 4K
            modprobe-20491   [001] .N...   242.675512: xhci_dbg_init: HCD page size set to 4K
            modprobe-20491   [001] .N...   242.675517: xhci_dbg_init: // xHC can handle at most 127 device slots.
            modprobe-20491   [001] .N...   242.675522: xhci_dbg_init: // Setting Max device slots reg = 0x7f.
            modprobe-20491   [001] .N...   242.675534: xhci_dbg_init: // Device context base array address = 0x0x000000008709c000 (DMA), 000000009ed5fbd5 (virt)
            modprobe-20491   [001] .N...   242.675541: xhci_ring_alloc: CMD 000000003be51046: enq 0x00000000810cc000(0x00000000810cc000) deq 0x00000000810cc000(0x00000000810cc000) segs 1 stream 0 bounce 0 cycle 1
            modprobe-20491   [001] .N...   242.675547: xhci_dbg_init: Allocated command ring at 000000003be51046
            modprobe-20491   [001] .N...   242.675552: xhci_dbg_init: First segment DMA is 0x0x00000000810cc000
            modprobe-20491   [001] .N...   242.675558: xhci_dbg_init: // Setting command ring address to 0x00000000810cc001
            modprobe-20491   [001] .N...   242.675564: xhci_dbg_init: // Doorbell array is located at offset 0x480 from cap regs base addr
            modprobe-20491   [001] .N...   242.675569: xhci_dbg_init: Allocating primary event ring
            modprobe-20491   [001] .N...   242.675575: xhci_ring_alloc: EVENT 00000000c9c9b6c1: enq 0x00000000fb7b7000(0x00000000fb7b7000) deq 0x00000000fb7b7000(0x00000000fb7b7000) segs 2 stream 0 bounce 0 cycle 1
            modprobe-20491   [001] .N...   242.675583: xhci_dbg_init: // Write event ring dequeue pointer, preserving EHB bit
            modprobe-20491   [001] .N...   242.675589: xhci_dbg_init: Allocating 2 scratchpad buffers
            modprobe-20491   [001] .N...   242.675604: xhci_dbg_init: Ext Cap 00000000183dcc08, port offset = 1, count = 1, revision = 0x2
            modprobe-20491   [001] .N...   242.675610: xhci_dbg_init: xHCI 1.0: support USB2 hardware lpm
            modprobe-20491   [001] .N...   242.675617: xhci_dbg_init: Ext Cap 00000000acf2f25f, port offset = 2, count = 1, revision = 0x3
            modprobe-20491   [001] .N...   242.675623: xhci_dbg_init: Found 1 USB 2.0 ports and 1 USB 3.0 ports.
            modprobe-20491   [001] .N...   242.675629: xhci_dbg_init: Finished xhci_init
            modprobe-20491   [001] .N...   242.675668: xhci_dbg_init: xhci_run
            modprobe-20491   [001] .N...   242.675673: xhci_dbg_init: ERST deq = 64'hfb7b7000
            modprobe-20491   [001] .N...   242.675679: xhci_dbg_init: Finished xhci_run for main hcd
            modprobe-20491   [001] dN...   242.675782: xhci_dbg_init: Enable interrupts
            modprobe-20491   [001] dN...   242.675787: xhci_dbg_init: Enable primary interrupter
            modprobe-20491   [001] dN...   242.675792: xhci_dbg_init: // Turn on HC, cmd = 0x5.
            modprobe-20491   [001] .N...   242.677973: xhci_dbg_init: // Halt the HC
            modprobe-20491   [001] .N...   242.677984: xhci_dbg_init: // Reset the HC
            modprobe-20491   [001] .N...   242.678014: xhci_dbg_init: Wait for controller to be ready for doorbell rings
            modprobe-20491   [001] .N...   242.678028: xhci_dbg_init: xhci_init
            modprobe-20491   [001] .N...   242.678032: xhci_dbg_init: xHCI doesn't need link TRB QUIRK
            modprobe-20491   [001] .N...   242.678038: xhci_dbg_init: Supported page size register = 0x1
            modprobe-20491   [001] .N...   242.678043: xhci_dbg_init: Supported page size of 4K
            modprobe-20491   [001] .N...   242.678048: xhci_dbg_init: HCD page size set to 4K
            modprobe-20491   [001] .N...   242.678053: xhci_dbg_init: // xHC can handle at most 127 device slots.
            modprobe-20491   [001] .N...   242.678058: xhci_dbg_init: // Setting Max device slots reg = 0x7f.
            modprobe-20491   [001] .N...   242.678069: xhci_dbg_init: // Device context base array address = 0x0x00000000813f1000 (DMA), 000000006440d11f (virt)
            modprobe-20491   [001] .N...   242.678079: xhci_ring_alloc: CMD 0000000099949093: enq 0x0000000086616000(0x0000000086616000) deq 0x0000000086616000(0x0000000086616000) segs 1 stream 0 bounce 0 cycle 1
            modprobe-20491   [001] .N...   242.678085: xhci_dbg_init: Allocated command ring at 0000000099949093
            modprobe-20491   [001] .N...   242.678090: xhci_dbg_init: First segment DMA is 0x0x0000000086616000
            modprobe-20491   [001] .N...   242.678095: xhci_dbg_init: // Setting command ring address to 0x0000000086616001
            modprobe-20491   [001] .N...   242.678101: xhci_dbg_init: // Doorbell array is located at offset 0x480 from cap regs base addr
            modprobe-20491   [001] .N...   242.678106: xhci_dbg_init: Allocating primary event ring
            modprobe-20491   [001] .N...   242.678111: xhci_ring_alloc: EVENT 0000000069cb484c: enq 0x000000009dd65000(0x000000009dd65000) deq 0x000000009dd65000(0x000000009dd65000) segs 2 stream 0 bounce 0 cycle 1
            modprobe-20491   [001] .N...   242.678118: xhci_dbg_init: // Write event ring dequeue pointer, preserving EHB bit
            modprobe-20491   [001] .N...   242.678123: xhci_dbg_init: Allocating 2 scratchpad buffers
            modprobe-20491   [001] .N...   242.678138: xhci_dbg_init: Ext Cap 00000000aa5745f8, port offset = 1, count = 1, revision = 0x2
            modprobe-20491   [001] .N...   242.678143: xhci_dbg_init: xHCI 1.0: support USB2 hardware lpm
            modprobe-20491   [001] .N...   242.678150: xhci_dbg_init: Ext Cap 000000004205fa17, port offset = 2, count = 1, revision = 0x3
            modprobe-20491   [001] .N...   242.678156: xhci_dbg_init: Found 1 USB 2.0 ports and 1 USB 3.0 ports.
            modprobe-20491   [001] .N...   242.678162: xhci_dbg_init: Finished xhci_init
            modprobe-20491   [001] .N...   242.678199: xhci_dbg_init: xhci_run
            modprobe-20491   [001] .N...   242.678204: xhci_dbg_init: ERST deq = 64'h9dd65000
            modprobe-20491   [001] .N...   242.678209: xhci_dbg_init: Finished xhci_run for main hcd
            modprobe-20491   [001] dN...   242.678309: xhci_dbg_init: Enable interrupts
            modprobe-20491   [001] dN...   242.678313: xhci_dbg_init: Enable primary interrupter
            modprobe-20491   [001] dN...   242.678318: xhci_dbg_init: // Turn on HC, cmd = 0x5.
         kworker/1:1-54      [001] d....   242.695620: xhci_get_port_status: port-0: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: 
         kworker/1:3-20526   [001] d....   242.699424: xhci_get_port_status: port-0: Powered Connected Disabled Link:Polling PortSpeed:1 Change: CSC Wake: 
         kworker/1:2-82      [001] d....   242.699445: xhci_get_port_status: port-0: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: 
         kworker/1:0-21      [001] d....   242.775417: xhci_get_port_status: port-0: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: 
         kworker/1:0-21      [001] d....   242.779413: xhci_get_port_status: port-0: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: 
         kworker/1:0-21      [001] d....   242.783420: xhci_get_port_status: port-0: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: 
         kworker/1:0-21      [001] d....   242.803419: xhci_get_port_status: port-0: Powered Connected Disabled Link:Polling PortSpeed:1 Change: Wake: 
         kworker/1:0-21      [001] d....   242.803448: xhci_queue_trb: CMD: Enable Slot Command: flags C
         kworker/1:0-21      [001] d....   242.803449: xhci_inc_enq: CMD 0000000099949093: enq 0x0000000086616010(0x0000000086616000) deq 0x0000000086616000(0x0000000086616000) segs 1 stream 0 bounce 0 cycle 1
         kworker/1:0-21      [001] d....   242.803455: xhci_ring_host_doorbell: Ring doorbell for Command Ring 0

even-ring/trbs:

    0x000000009dd65000: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65010: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65020: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65030: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65040: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65050: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65060: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65070: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65080: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65090: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd650a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd650b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd650c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd650d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd650e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd650f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65100: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65110: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65120: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65130: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65140: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65150: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65160: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65170: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65180: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65190: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd651a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd651b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd651c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd651d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd651e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd651f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65200: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65210: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65220: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65230: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65240: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65250: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65260: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65270: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65280: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65290: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd652a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd652b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd652c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd652d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd652e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd652f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65300: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65310: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65320: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65330: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65340: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65350: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65360: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65370: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65380: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65390: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd653a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd653b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd653c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd653d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd653e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd653f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65400: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65410: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65420: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65430: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65440: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65450: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65460: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65470: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65480: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65490: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd654a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd654b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd654c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd654d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd654e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd654f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65500: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65510: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65520: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65530: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65540: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65550: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65560: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65570: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65580: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65590: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd655a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd655b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd655c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd655d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd655e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd655f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65600: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65610: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65620: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65630: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65640: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65650: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65660: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65670: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65680: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65690: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd656a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd656b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd656c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd656d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd656e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd656f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65700: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65710: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65720: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65730: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65740: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65750: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65760: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65770: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65780: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65790: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd657a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd657b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd657c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd657d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd657e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd657f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65800: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65810: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65820: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65830: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65840: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65850: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65860: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65870: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65880: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65890: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd658a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd658b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd658c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd658d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd658e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd658f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65900: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65910: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65920: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65930: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65940: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65950: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65960: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65970: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65980: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65990: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd659a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd659b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd659c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd659d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd659e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd659f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65a00: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65a10: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65a20: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65a30: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65a40: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65a50: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65a60: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65a70: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65a80: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65a90: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65aa0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65ab0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65ac0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65ad0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65ae0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65af0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65b00: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65b10: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65b20: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65b30: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65b40: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65b50: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65b60: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65b70: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65b80: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65b90: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65ba0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65bb0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65bc0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65bd0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65be0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65bf0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65c00: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65c10: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65c20: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65c30: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65c40: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65c50: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65c60: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65c70: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65c80: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65c90: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65ca0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65cb0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65cc0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65cd0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65ce0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65cf0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65d00: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65d10: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65d20: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65d30: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65d40: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65d50: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65d60: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65d70: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65d80: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65d90: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65da0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65db0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65dc0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65dd0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65de0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65df0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65e00: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65e10: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65e20: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65e30: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65e40: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65e50: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65e60: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65e70: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65e80: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65e90: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65ea0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65eb0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65ec0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65ed0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65ee0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65ef0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65f00: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65f10: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65f20: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65f30: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65f40: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65f50: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65f60: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65f70: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65f80: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65f90: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65fa0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65fb0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65fc0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65fd0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65fe0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd65ff0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71000: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71010: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71020: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71030: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71040: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71050: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71060: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71070: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71080: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71090: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd710a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd710b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd710c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd710d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd710e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd710f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71100: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71110: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71120: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71130: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71140: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71150: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71160: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71170: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71180: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71190: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd711a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd711b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd711c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd711d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd711e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd711f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71200: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71210: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71220: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71230: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71240: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71250: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71260: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71270: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71280: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71290: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd712a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd712b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd712c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd712d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd712e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd712f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71300: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71310: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71320: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71330: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71340: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71350: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71360: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71370: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71380: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71390: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd713a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd713b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd713c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd713d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd713e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd713f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71400: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71410: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71420: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71430: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71440: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71450: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71460: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71470: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71480: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71490: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd714a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd714b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd714c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd714d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd714e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd714f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71500: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71510: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71520: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71530: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71540: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71550: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71560: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71570: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71580: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71590: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd715a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd715b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd715c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd715d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd715e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd715f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71600: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71610: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71620: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71630: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71640: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71650: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71660: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71670: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71680: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71690: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd716a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd716b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd716c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd716d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd716e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd716f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71700: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71710: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71720: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71730: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71740: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71750: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71760: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71770: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71780: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71790: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd717a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd717b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd717c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd717d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd717e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd717f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71800: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71810: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71820: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71830: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71840: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71850: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71860: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71870: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71880: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71890: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd718a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd718b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd718c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd718d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd718e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd718f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71900: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71910: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71920: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71930: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71940: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71950: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71960: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71970: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71980: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71990: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd719a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd719b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd719c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd719d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd719e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd719f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71a00: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71a10: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71a20: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71a30: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71a40: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71a50: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71a60: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71a70: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71a80: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71a90: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71aa0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71ab0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71ac0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71ad0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71ae0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71af0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71b00: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71b10: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71b20: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71b30: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71b40: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71b50: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71b60: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71b70: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71b80: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71b90: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71ba0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71bb0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71bc0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71bd0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71be0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71bf0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71c00: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71c10: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71c20: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71c30: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71c40: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71c50: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71c60: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71c70: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71c80: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71c90: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71ca0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71cb0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71cc0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71cd0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71ce0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71cf0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71d00: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71d10: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71d20: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71d30: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71d40: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71d50: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71d60: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71d70: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71d80: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71d90: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71da0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71db0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71dc0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71dd0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71de0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71df0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71e00: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71e10: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71e20: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71e30: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71e40: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71e50: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71e60: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71e70: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71e80: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71e90: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71ea0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71eb0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71ec0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71ed0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71ee0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71ef0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71f00: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71f10: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71f20: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71f30: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71f40: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71f50: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71f60: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71f70: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71f80: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71f90: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71fa0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71fb0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71fc0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71fd0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71fe0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x000000009dd71ff0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000

command-ring/trbs:

    0x0000000086616000: Enable Slot Command: flags C
    0x0000000086616010: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616020: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616030: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616040: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616050: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616060: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616070: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616080: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616090: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866160a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866160b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866160c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866160d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866160e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866160f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616100: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616110: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616120: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616130: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616140: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616150: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616160: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616170: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616180: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616190: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866161a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866161b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866161c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866161d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866161e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866161f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616200: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616210: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616220: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616230: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616240: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616250: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616260: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616270: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616280: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616290: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866162a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866162b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866162c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866162d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866162e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866162f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616300: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616310: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616320: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616330: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616340: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616350: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616360: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616370: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616380: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616390: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866163a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866163b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866163c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866163d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866163e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866163f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616400: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616410: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616420: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616430: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616440: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616450: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616460: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616470: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616480: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616490: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866164a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866164b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866164c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866164d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866164e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866164f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616500: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616510: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616520: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616530: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616540: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616550: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616560: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616570: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616580: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616590: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866165a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866165b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866165c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866165d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866165e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866165f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616600: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616610: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616620: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616630: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616640: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616650: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616660: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616670: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616680: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616690: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866166a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866166b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866166c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866166d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866166e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866166f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616700: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616710: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616720: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616730: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616740: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616750: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616760: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616770: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616780: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616790: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866167a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866167b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866167c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866167d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866167e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866167f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616800: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616810: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616820: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616830: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616840: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616850: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616860: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616870: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616880: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616890: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866168a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866168b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866168c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866168d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866168e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866168f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616900: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616910: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616920: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616930: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616940: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616950: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616960: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616970: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616980: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616990: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866169a0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866169b0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866169c0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866169d0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866169e0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x00000000866169f0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616a00: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616a10: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616a20: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616a30: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616a40: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616a50: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616a60: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616a70: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616a80: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616a90: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616aa0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616ab0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616ac0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616ad0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616ae0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616af0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616b00: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616b10: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616b20: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616b30: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616b40: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616b50: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616b60: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616b70: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616b80: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616b90: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616ba0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616bb0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616bc0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616bd0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616be0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616bf0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616c00: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616c10: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616c20: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616c30: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616c40: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616c50: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616c60: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616c70: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616c80: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616c90: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616ca0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616cb0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616cc0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616cd0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616ce0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616cf0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616d00: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616d10: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616d20: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616d30: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616d40: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616d50: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616d60: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616d70: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616d80: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616d90: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616da0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616db0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616dc0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616dd0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616de0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616df0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616e00: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616e10: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616e20: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616e30: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616e40: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616e50: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616e60: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616e70: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616e80: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616e90: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616ea0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616eb0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616ec0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616ed0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616ee0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616ef0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616f00: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616f10: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616f20: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616f30: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616f40: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616f50: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616f60: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616f70: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616f80: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616f90: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616fa0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616fb0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616fc0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616fd0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616fe0: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
    0x0000000086616ff0: LINK 0000000086616000 intr 0 type 'Link' flags i:c:T:c

It seems like the TRBS output here is not very useful, is it?


Best regards
Alexander Wilhelm

