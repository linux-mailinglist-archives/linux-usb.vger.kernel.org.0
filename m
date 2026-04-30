Return-Path: <linux-usb+bounces-36742-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +M/3MAIf82kvxQEAu9opvQ
	(envelope-from <linux-usb+bounces-36742-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 11:21:06 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D26D49FC8A
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 11:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8C68C30095ED
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 09:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D075F3A0B31;
	Thu, 30 Apr 2026 09:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="oT3a1n2S";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JQJl9RWS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Yegjaj4q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1719439FCD8;
	Thu, 30 Apr 2026 09:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777540859; cv=fail; b=r6fpewEIFPbltcdm7G9f+wezm+UQhiNcbxjcfII8KpqJzAttwGELYrOCKBfgBQ4rB0AzZ3ca1xqbWmFIkX8RoT6IzH9WVge71DA48JAH/LmdmJPekRBAdihzC1N7At2iY9FMF5ievr6akYozAFdh+qaWP1FVngBLLLHqdGanCqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777540859; c=relaxed/simple;
	bh=Xul7J+J5HflhTwiVMriNreOQe1lbp6pxAKORpvVmvWk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PKlJeJa0z4D+tkgu2mflQZt1Bnp0+q93Om6SDhFFQn2LgvwiFREaCBlmvvDNIgn6mi4jko9XrNVHrwIaQmBs0ym9IkLj+wZiU6uAmL+Rq3xbLYcYCrSgh8GmJ//fJdMrtDQAe5FJTalLkblfvPYrYoG5VRoEQuupJLgiph2hxp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=oT3a1n2S; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JQJl9RWS; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Yegjaj4q reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U7LB9P3026353;
	Thu, 30 Apr 2026 00:43:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=Xul7J+J5HflhTwiVMriNreOQe1lbp6pxAKORpvVmvWk=; b=
	oT3a1n2S5hMvoFi+pAiSt8efCPgt39AqiqVcvRb7pV49I64WJTV2fl4fX4/Pz/Mt
	eP1thRdHEnIcA+jJnol4A5NcwTHSLzkrV4Zqr4DEFoEtc4stvV2jqavO2KDtdan1
	M3VKewKa6MzG/HTvhKUpJDNUMB88DD+eI91zKM20wfP/LbC4WflgB9YW5atDx7PZ
	A559OYiH0KWSNfVilrLAjIjNWRqQZ+42JqNfjcG/uPs1p7fVbx2g5+1kIi84vv+2
	y0pn1TTLL01aI9+fcuF2wKNhVKAo4+QIEbBcj7GUjPISpOQT9UFaBlU6JSzA81Y0
	eJtWNViNIgv7rzPIz4f1mw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4duxv9scbd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Apr 2026 00:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1777535000; bh=Xul7J+J5HflhTwiVMriNreOQe1lbp6pxAKORpvVmvWk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=JQJl9RWSlXttY2KwTYK5H0p0NaHPtWkT/uCQkVlu/zo8fgU7AI8Q4AV0c9CV33SrZ
	 nbY1nZ3bYcZ3cPIeBJ5r/E6aLnqC1m4uk9bREZ+XZFPxsR+2rmabZFX2gK34P91I68
	 Jgv/xvrANFRr4ybgUab1IEc6ntUm85qXqxJJG2j4QpACjSyh9a/UGt/hoKJGnbRMzm
	 vHsKS8KJoDNPAzOGnNRtrEQ0SJAiWGn5X2q9N5aM94O+LawBlL+asDS4T/PAzVRhZS
	 E67U89dvSugYZ48C+1i4GdIpTGgE5H6rKzi6h7RQPqisydrIcak4q4lSSvtkF8pU9t
	 m2nP4jqdDgiyg==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 941C24034A;
	Thu, 30 Apr 2026 07:43:20 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 663D0A0070;
	Thu, 30 Apr 2026 07:43:20 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Yegjaj4q;
	dkim-atps=neutral
Received: from SJ0PR08CU001.outbound.protection.outlook.com (mail-sj0pr08cu00100.outbound.protection.outlook.com [40.93.1.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8E58A40147;
	Thu, 30 Apr 2026 07:43:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ts4mRifoNTGZETxwcgp6RxePihzrrKB+XHBrFIB4xP8P+XgL7l3k9XvrLAHnVEhVyWcoJmKDr5amZrib7JYK/llmCOpEWqOrM5sG8BUOM06EdLZRLt9lDJPrcwEWwVGGlLYhCNjldRI388Er25QW+V2PKVg9WWUzhyw937VPCB0+fa+ErcYFnLK8nixOMjqsSxcQMSsZtg7KSYuPRdJYClvg7P6dw2cTcqY2SwZh2UF7RZ1CGJEUueRyg43kFYSckWEKRJ5t/JMD7fSXGvE2NKSTc6uZCiLBqG08QeeyUrdYYyM9ZZZUkcUdV1yvgPz7HUSrL5THi4BOHy0tW/SuCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xul7J+J5HflhTwiVMriNreOQe1lbp6pxAKORpvVmvWk=;
 b=VGJrtb5vm9ZMb/eGVJwkl49/ssmo7RXy4aLjazyWmJ8B5dnlWa5RwyUZu1riBDkfP8G7oNEAdycHiimbiAV0+UsbjyIo7St8ORvh2vb90elx3pb7j3N0Aj5M9vfVd79mlMUyIv8+6n7ZW0LWs0J+WRFhHEZwFrd/0OyxJAS8tEf3rC9fJG0gqmKOGsPj7rEUFbRTGUCZGdWIW0OiLsSZPbJKSDDifQrRYlQ9nIdrPS5gYN73fcASlff4jHvVEGv0a7AsOQXGybkUMv3xPKjkPp7qTzl779rKurKLi3c2r9vNi8VCayq83iuVBmQLS+e35JpQWN079AnI8if2FHXJVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xul7J+J5HflhTwiVMriNreOQe1lbp6pxAKORpvVmvWk=;
 b=Yegjaj4qM3y3XZSNO0ceTwqvIJ1+L6VhY6c2Yi1p30caT7Mu4jNLURe/mH2iNHHGnVOlQP12fNWF50lCezmMOX/pu4MkN4HF0/4iMEhPQ83IUgUbqDhZHkpqLHCC8bMj1n5gMZDNtrpLHUZyRKmmPUiR/BZGFM0prfYOAmATvCo=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS0PR12MB8271.namprd12.prod.outlook.com (2603:10b6:8:fb::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.17; Thu, 30 Apr 2026 07:43:15 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 07:43:15 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jack.pham@oss.qualcomm.com" <jack.pham@oss.qualcomm.com>,
        "wesley.cheng@oss.qualcomm.com" <wesley.cheng@oss.qualcomm.com>
Subject: Re: [PATCH] usb: dwc3: avoid probe deferral when USB power supply is
 not available
Thread-Topic: [PATCH] usb: dwc3: avoid probe deferral when USB power supply is
 not available
Thread-Index: AQHcxuWp9hYn7RcqQkmtW0XySNuTgLX2dDQAgADn/4A=
Date: Thu, 30 Apr 2026 07:43:15 +0000
Message-ID: <afMGNh3xh8Az4x-S@vbox>
References: <20260407232410.4101455-1-elson.serrao@oss.qualcomm.com>
 <ed8566ad-2a98-43c1-8d89-d4ddc37e273e@oss.qualcomm.com>
In-Reply-To: <ed8566ad-2a98-43c1-8d89-d4ddc37e273e@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS0PR12MB8271:EE_
x-ms-office365-filtering-correlation-id: 2c190ad5-c395-4393-a03d-08dea68c235d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 De3/BcjWkMkae+WnZv9Hvn7tDO7lNdBQmLKSeMlPQlmJ0TDo1a4PjmZaAQhxtj2SyfmvEriZt1ef8zHkxX3uxcS5J2bj/g1wzzKxQMCb13M5WUctEf1/Q3KUpIgqA4U0+2TmSSAu8JTNDhGdGOxKpciZOtn4SshTYeVUVh74QyzHy7XfqZLlXdUZukZ246hVtuU/r5STgbfsAiNWspAWkJJbCgN3KtH9/xfgsshO6DlASJTFzC1Q/aSNSti1Gbu09w+E/vtbvjEnbZplB2eF9zcNeNKoXodnZ455R9VE3OeLRBhV7OoJgWyjSowjHLfwbnvQWKPkMEFe4hH7+0AifZXKYv2+2QG/+EX58MxTfeIeWbzhRazvEhzBlT1xVKM9Jkd0Rdn8jxpHu+kTSVEfM9//zqU67ScPChSfbY6/a5Rcv/qBiwoxQjqH/yXbv0Rx+iViftHD2z4K9WiWzC18cH0P5ZU7PQ1u/KsGLa9v66wUCHPZq8Eg2cilcw/S2Vq3VmepmN4FnE3SQ9A8WoXRWT8zB13KqfFizAnMUQTkTmCXe391fCtxTtBrnC5yic2nIKGYw1wSxlyrR1MDt2u58mbfX7blbfoAd7njsDB+USxyav2Cjv+6XKCjuVZNQMXgGcIzq5H4hmUDggSZIVWo0ZZkv8qknAWZ+F3+o5ZmzBJ5obZGjyz3/C8YbkO+VonW5myrshKyocLTUd8LjzIGgrZKM2dLVh/HHKfI772qUMieVBY/xRo0aB6os1BM0LCtnJ3oOFolDOPSOVVw/hFJ7qu/N2tLHZanjBUn65nlLus=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?STFWVUxIaWwyT2QrZWVaUG03L2VSRkhrc3JLbk9ndjNkRHNaRDZzWGRFYWFD?=
 =?utf-8?B?MEkwK09KNm84eEdYS0pYU1pkbDc1MWZKUXNpNDB5di9od1RiNkxINWU5czMr?=
 =?utf-8?B?OFg2M3A0QmZCV2xEMCszZGFTNHg1V1pTRkpPdUJ2VTR2UTREV3drejlZRlFE?=
 =?utf-8?B?K1NPdzd2ZUY4QW1GcFA1VFJVUkROcEZhai9oVHNzemtUenhDY01OeHRxaThW?=
 =?utf-8?B?cVdzR01BNDlSY1U4SWh4ZURBdUwya2U3d3VqYjNRdTh1djhvZVdHS2E1ZVNI?=
 =?utf-8?B?S29rbzhzdHlnbzJYZEI2OC9PalJwY2lDUGpyOE93S1VwU1dNTW1nWmlYOWIy?=
 =?utf-8?B?YVNtNnYySDZxd0JZdnk5T2lCT2tBTFM4YUF2TkdqUi9QTFpqVDArOHRscXJE?=
 =?utf-8?B?TW91L1VsbjhXUm53ZFY0cU1hZWltc3UweHUxK0RUalRlaDlkU2V1SFJNMmpN?=
 =?utf-8?B?WUVXdlFuSE5QMnovdk5pWWpMNldwNWQ1cDZTUUJROEdoVm5qMUpQSDAvWXJp?=
 =?utf-8?B?Z01McnZ3MkppK0drWUJndHdtdUREejRXeXdtUVhncHFxanlaK1NrOEFGcmhV?=
 =?utf-8?B?dVBSeFBZRms4V3dnSzB6ZGZkVnkrWGVuem5JRTdJelhrM2VhT21XbXB6Vjc0?=
 =?utf-8?B?NHF3MThMeGM0UGcvdFZoYnFWVzdTRktpN2NVZ3VJbEFnUDdDb0dtK3ZOd05V?=
 =?utf-8?B?QlNOKzdVdWhlV3RwdDcrZ3VHdzl5ZEo0VTBNYldHVEVZM0JnM0Q4cnhLS1Nk?=
 =?utf-8?B?d0xWSkM4SDIwTGp1bW5pYVJ6OXpUYWtod0dSOWcrUklEVDNTL2VaVVdUOVZj?=
 =?utf-8?B?VnpKblQvYWlmMW4yUUJPSWV5TlZRckE4bWpLd1JSOEJKTnozMnZnWHJCbnVR?=
 =?utf-8?B?ZHdDMnU3anZHVGZZaE8vaWJFMmR6V2U4WjdNZXdqSkhVMmEvTFJVRWxBYitY?=
 =?utf-8?B?R3VNU3dkSTdCaDQ3aTlyTmxLcXArRHp4S3VMTzBxSHJ3cnBKVHgxWGRsQjBp?=
 =?utf-8?B?dVVvc28vUGppZy9hUGFreUNtWk81QjhndEV2ZFlqSk5IYnFVUzN6WWc0TWhi?=
 =?utf-8?B?OTh2RDlMUkFhdWlZUWt1by9Ib3pIeTVsRXRqRWhIc09ya2kyaUFNRlNERlM2?=
 =?utf-8?B?TWxtbnpJL3hlZC9QZ2xUZ1hvdWlnNVRuWkZmbXpMMThFTExvdkt0d0NlVzk5?=
 =?utf-8?B?WXNZTSt3NWUvc09xdmpIM2tZTWdPek04cFpoOUtLTUEwWHdqazRUaGNpYXVy?=
 =?utf-8?B?ZnlVR3RQQ3FkWUM4bGFjWlliVUpBZ2pDMldabnRaV2s4UHZIMlZKZUdhakVT?=
 =?utf-8?B?dmJJR2hYSUVWQUN5LzdieEdZVGhvZ0pzSWxDWGdaU2JBYTBSdlR3NC96RDBl?=
 =?utf-8?B?N2Fpc1pUNTQyU3ZNZHBRZ08xVEhNbG92aUdQKzVNaTU2dTlIUG96eXRjV3dH?=
 =?utf-8?B?OWZwWDcyQ1JRbUpjT3ZRU1k0NU9xV1IxZG44NnFVOGlrZnczQkE0UVM5eVJ0?=
 =?utf-8?B?VHJ4K1ozallBWGJYTmNaNVlPWXhOMG9QaENFdkdjVkxiODVyTERlMXN6TEdY?=
 =?utf-8?B?dTN5aHVGdVdaSzMybnI0Y09uVWFaa01tZDZrcmplWHVuYUVWbTJuZU5US3gy?=
 =?utf-8?B?KytvLzlFYlJSUkwxNjdLelNHT1MveU1NWWFwTk80NTJFWHVhUWMza1IvV1k2?=
 =?utf-8?B?UENSNVM5dWlEeGU4KzZGdWtkYmFMRnF5TGVxUTRGK3p6bUR4VWlSSldBYlI4?=
 =?utf-8?B?dThleWNYOEs5dERpTkl1a2hoa3RrSXVrN0E0b1JlQmdhWm9jS3NCZmtwMU9H?=
 =?utf-8?B?TEZBbm5Ca3ZXZ1dvQ3p3QVdKcGl2NzJlSDFySXNvcmlrRDVZQVRNT1J3L0k5?=
 =?utf-8?B?Z0toT1YyeDNCcWlSaExaY1o0Ny9NSU9rdWtjdGluUThYZHRJZ1FiOThZTXh6?=
 =?utf-8?B?Y3l5SVdhL2dJemtUWHVVRW5zdnZiZWZWWVJVa2ljbFpwVmJoTnRuTzZIK1JD?=
 =?utf-8?B?RXlON0R2SEFzb21NU01MUnpkVjA4LzZYZC9mVUpiblEyU3A2aEVRQmxrSVEw?=
 =?utf-8?B?cmZxTURQVE5yRjVhZCtXbUtCWWc1UTBnOWh3YXIzZldlclFJWDdWNUw4TnlK?=
 =?utf-8?B?MUtiMTZiSGx6WlVNd2FHNVhBQVNqVERtZHRHazJQNHZEZVdXcEhCTkJmVi9y?=
 =?utf-8?B?cndNTnlUazZPV05HOVBuUmg4VXNXYSttUkxDYS9XanZzVEQyRmd6dW9aaWNw?=
 =?utf-8?B?UGFwdlFST3MrclRSVzRGb2NuaG9SejBBVDFFUE1uSnl0QmhuU1VjcEFxUGhQ?=
 =?utf-8?B?R3g0VFAxRm9WTTZST0xkbzY0bUEySDVkb1d5UHpzL3JkbnpQTEFodz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A1B1B1B1A63A2E4686F126E79D46002F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	dir12QzkdQ2rTDMbH/Nii9oIpiJOTQbD0Pds0Y3clxXCXI33MLa3Z3vqH2RZdQ1W5v2As5apVL+QuFmoV3gwxps2EGjWhIpzthu3FRCyYeX7HDbcMHRq5mJbA8KHs0MuEEhTE8O9zB/QQJ3p4nw4JgS5Y7Rw5jeuFAUk07EllOWVxQrZ751VtpUWPAyndgIqpGFGuDoXENVmfhE7gNeLp76sejOBaQrh2gsC1lKiO9ULxEt7djZCr2z8pEP9gIbJ2Eod7DGmkrxOUScNoAC1KsyQNaole7pokR6sQO/ihRFe5aBeooXvQcUcd4xvwxllhRpkbzvKBFF1JBUOo8Nlyg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	X0Eqf/6fiGibM/re11vkLyPzIh6Ca11TUkobJA0Oci09L0aF7Wye3mgdwvs7gW6EoPj0KzJ4d0p/lFvocu0Xx4zh/I/1PagGBWU0I/HF+1IVyFKBc6cO0Dlcys7U5I08BE3EkLKsk69lEn6iehRB13vCkvF3G60+aeV0fACT7AGFAO6Zx1SbB85pNILcPLyIk+IWZSO3pBEHlvUBTcdha3T3wmwYCxpNrtrB01YIHXrSJv6HsvGWgFiGzD4O0NbVJX6FYXp5o6Cw/V16g9473ItkHf7eWQOLz6qx8ZYBorWhjFZUwpnv6CiYJA9TlfUCGESmyoqoHZWGc1u3T89+cAbqEu9o5HvY11y9x9BlXsdbJqR9JWvqh4SbDuGl26aJ8CeUWQcEOG/itZ5QD110RjLf30ZRNu+A7X7H5sVM+QCrzCiTyOaZIvHFIvJAKFNco9h0M0mjqLAQHE8R76KXytlYaYcxz31Gtb+H9eOOuLzIuApBETD7xR9FmhFBb5WL/ob8aclL4KDtA6paDUVofNS7oxtaDwa0E5MSirsDJ2A1M1jcwXyGZ0cMXoMweWcx+FefdeBsH3lK7wJ3KGGDJY+8j8ys1kK4q/z0Djof7MixGuCC9t5bufzGj92MjNkXrk6Mc+8ocmVmgUDW7HgZ2A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c190ad5-c395-4393-a03d-08dea68c235d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2026 07:43:15.1554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FnwhbGaUtc8lC99n0oIlGM8m9/wxyVpRKxQHT0IffbDR15Ls1Vh6GA/lmO4ebfIeChfdE4PxxR2V2G0aidXrsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8271
X-Authority-Analysis: v=2.4 cv=AvDeGu9P c=1 sm=1 tr=0 ts=69f30819 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=EUspDBNiAAAA:8 a=fnjJPIvQA_EDyhiCYhgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: xtItblJtJDy-xH_wp85Uny3RfCn9SpPd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA3NCBTYWx0ZWRfX6UmiNwjlr1B4
 5UmzSWNnz9zHv5j10v8V/9wp62+YSNrxq6vs7g/71F+nIRGUT1lncTHdmlZh5u5d+TGJeWeovf/
 YfWSLyHQiWoffI8382VNtI0sBuN4JVf9U/dEA3r5+/2kL64FG4C7wKKiXzvZE77IDth0rOVw6cw
 ZwK9ua2gLMpmB5n8Ire26H54CSxEPdILtCIh8Ttr66twbbBZtxUYkghDK9RWJezpvX0QlwNSz9F
 pSxCUpjaD3EPIsMoT8XC+4zJbM25GmcHrDR1RD05oVHdnA8HAAdBfH7i7RvKTlOEyWGI7pRFbf/
 sbcvBYc2NtCtDrXss3NDdtOxcKccRiRe0X1p6cVUu3/7o2bRQ6JXz/xhZ3GHlDuhx11hqLCdjAy
 rq3kYQPB2x3LoPy1UUroWcJcFOA8rcLQ34EffSZueUGnIobxmatgoPU2oRXH4BcYoYhULbtmlg6
 nnayPuOBaAdRGqhpaoQ==
X-Proofpoint-ORIG-GUID: xtItblJtJDy-xH_wp85Uny3RfCn9SpPd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 adultscore=0 lowpriorityscore=0
 clxscore=1011 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 phishscore=0 spamscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2604200000 definitions=main-2604300074
X-Rspamd-Queue-Id: 9D26D49FC8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36742-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,synopsys.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

T24gV2VkLCBBcHIgMjksIDIwMjYsIEVsc29uIFNlcnJhbyB3cm90ZToNCj4gDQo+IA0KPiBPbiA0
LzcvMjAyNiA0OjI0IFBNLCBFbHNvbiBTZXJyYW8gd3JvdGU6DQo+ID4gVGhlIGR3YzMgZHJpdmVy
IGN1cnJlbnRseSBkZWZlcnMgcHJvYmUgaWYgdGhlIFVTQiBwb3dlciBzdXBwbHkgaXMgbm90IHll
dA0KPiA+IHJlZ2lzdGVyZWQuIE9uIHNvbWUgcGxhdGZvcm1zLCBldmVuIHRob3VnaCBjaGFyZ2lu
ZyBhbmQgcG93ZXIgc3VwcGx5DQo+ID4gZnVuY3Rpb25hbGl0eSBpcyBhdmFpbGFibGUgZHVyaW5n
IG5vcm1hbCBvcGVyYXRpb24sIHRoZXJlIG1heSBleGlzdA0KPiA+IG1pbmltYWwgYm9vdGluZyBt
b2RlcyAoc3VjaCBhcyByZWNvdmVyeSBvciBkaWFnbm9zdGljIGVudmlyb25tZW50cykgd2hlcmUN
Cj4gPiB0aGUgcmVsZXZhbnQgVVNCIHBvd2VyIHN1cHBseSBkZXZpY2UgaXMgbm90IHJlZ2lzdGVy
ZWQuIEluIHN1Y2ggY2FzZXMsDQo+ID4gcHJvYmUgZGVmZXJyYWwgcHJldmVudHMgVVNCIGdhZGdl
dCBvcGVyYXRpb24gZW50aXJlbHkuDQo+ID4gDQo+ID4gVVNCIGRhdGEgZnVuY3Rpb25hbGl0eSBm
b3IgYmFzaWMgb3BlcmF0aW9uIGRvZXMgbm90IGluaGVyZW50bHkgZGVwZW5kIG9uDQo+ID4gdGhl
IHBvd2VyIHN1cHBseSBmcmFtZXdvcmssIHdoaWNoIGlzIG9ubHkgcmVxdWlyZWQgZm9yIGVuZm9y
Y2luZyBWQlVTDQo+ID4gY3VycmVudCBjb250cm9sLiBUaGUgY29uZmlndXJlZCBWQlVTIGN1cnJl
bnQgbGltaXQgaXMgdHlwaWNhbGx5IGVuZm9yY2VkDQo+ID4gdGhyb3VnaCB0aGUgY2hhcmdlciBv
ciBQTUlDIHBvd2VyIHBhdGguIFdoZW4gY2hhcmdpbmcgZnVuY3Rpb25hbGl0eSBpcw0KPiA+IHVu
YXZhaWxhYmxlLCBhcHBseWluZyBhIGN1cnJlbnQgbGltaXQgaGFzIG5vIHByYWN0aWNhbCBlZmZl
Y3QsIHJlZHVjaW5nDQo+ID4gdGhlIGJlbmVmaXQgb2Ygc3RyaWN0IHByb2JlLXRpbWUgZW5mb3Jj
ZW1lbnQgaW4gdGhlc2UgZW52aXJvbm1lbnRzLg0KPiA+IA0KPiA+IEluc3RlYWQgb2YgZGVmZXJy
aW5nIHByb2JlLCByZWdpc3RlciBhIHBvd2VyIHN1cHBseSBub3RpZmllciB3aGVuIHRoZQ0KPiA+
IFVTQiBwb3dlciBzdXBwbHkgaXMgbm90IHlldCBhdmFpbGFibGUuIENhY2hlIHRoZSByZXF1ZXN0
ZWQgVkJVUyBjdXJyZW50DQo+ID4gbGltaXQgYW5kIGFwcGx5IGl0IG9uY2UgdGhlIG1hdGNoaW5n
IHBvd2VyIHN1cHBseSBiZWNvbWVzIGF2YWlsYWJsZSwgYXMNCj4gPiBub3RpZmllZCB0aHJvdWdo
IHRoZSByZWdpc3RlcmVkIGNhbGxiYWNrLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEVsc29u
IFNlcnJhbyA8ZWxzb24uc2VycmFvQG9zcy5xdWFsY29tbS5jb20+DQo+ID4gLS0tDQo+ID4gIGRy
aXZlcnMvdXNiL2R3YzMvY29yZS5jICAgfCA4MiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0NCj4gPiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmggICB8ICA0ICsrDQo+ID4g
IGRyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgfCAxMCArKysrLQ0KPiA+ICAzIGZpbGVzIGNoYW5n
ZWQsIDgwIGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiANCj4gDQo+IEhp
IFRoaW5oLA0KPiANCj4gSnVzdCBhIGdlbnRsZSByZW1pbmRlciBhYm91dCB0aGlzIHBhdGNoLg0K
PiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgYW55IGNoYW5nZXMgYXJlIG5lZWRlZC4NCj4gDQoNCkhp
IEVsc29uLA0KDQpBcG9sb2dpZXMgZm9yIHRoZSBkZWxheWVkIHJlc3BvbnNlLiBJJ3ZlIG1pc3Nl
ZCB0aGlzIHBhdGNoLg0KDQpCYXNlZCBvbiB0aGUgcGF0Y2ggZGVzY3JpcHRpb24sIGl0IHNvdW5k
cyByZWFzb25hYmxlLiBJJ2xsIHJldmlldyB0aGUNCmltcGxlbWVudGF0aW9uIGluIGRldGFpbCBh
bmQgZ2V0IGJhY2sgYmVmb3JlIHRoZSB3ZWVrIGVuZC4NCg0KVGhhbmtzIGZvciB0aGUgcmVtaW5k
ZXIuDQoNCkJSLA0KVGhpbmg=

