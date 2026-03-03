Return-Path: <linux-usb+bounces-33888-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFfdIf0ppmnwLQAAu9opvQ
	(envelope-from <linux-usb+bounces-33888-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 01:23:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0486C1E7184
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 01:23:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A93B303608E
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2026 00:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E896D1F5821;
	Tue,  3 Mar 2026 00:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BtfwNxzs";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Bdz+er0d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="eWv3Qjkw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61BA1F130B
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 00:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772497394; cv=fail; b=MpCy5GT3rvWep0cGiwAROiKTJ3xzLJzzsLtNSCRtjlQdxS+qL9Zo3dX2IydAjBNNVGkU8mem+rtFUtV55u6nQno8aD6L1ledjFRlKPN8vDV0q5OypUEFQEtTdNp9u/wj9ll0qPyKKCepI/H5oat1uCswTMgPbQllLatFxHKuFzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772497394; c=relaxed/simple;
	bh=VextoMVkO19Xq8gmuhISUiLuxDsO10Sf0rWc5FZoZss=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ltODRU36GfTLZw0AoVoIxCRW4Q9MWByYzAyVIYBB1ysOv5UJb/XU9Y/sMpo0p+SLMlLEDZeseMZtfMWdgXgqYS/rGOhVmqNWVvzH4yFR/zH3qsPsew11iuaCUDoeFVct1YTPNlVJcEA9A95L09U4QP2mT/L8hrjch8TXOyp1VGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=BtfwNxzs; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Bdz+er0d; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=eWv3Qjkw reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622KitV8297716;
	Mon, 2 Mar 2026 16:22:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=VextoMVkO19Xq8gmuhISUiLuxDsO10Sf0rWc5FZoZss=; b=
	BtfwNxzscfA3FIvWCkR5mNBoDtNstaX0KtJS4yGv2HKPi1iJG/vgggND7ACndC7F
	RHygcqVcZfTOJ0XLQYW6UOn9IYkuPduO1a8JgLUv06DWPzyc7uLJ+R6JeP99JeJ1
	TMNA0HSyZnjJnqPiMwxze+pEYRsO/y9zOxrsvAQ7A7Qx+OvVsfa6vKOzWKCVJ+Ds
	toGOmrrFbmUTrxKTFEjjawg+ofhlOdu1Tnq2P9KlVQcPQ26Mi38vNyG58ZFxBLEk
	4M+NcUFIIr9b8R2RjBnatiIlPGWmZDM+2+cwqZASv7jc6c/+unxvDDXcA/xxbF5B
	Uags0+A42fN+GVTx2Tvztw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4cng95spsw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Mar 2026 16:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1772497363; bh=VextoMVkO19Xq8gmuhISUiLuxDsO10Sf0rWc5FZoZss=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Bdz+er0d3i244gcsY2WwRtIqaJTy/BHDuwqAmKh1fz7uLiECStdfYFytDE/ZHLlVl
	 hok0VV1bdYN/w0YcjtUCbsAewABFojsp5Q9vP0W1Hie7aaOAUM2xWEA9q+w106Pi2G
	 Mu/37ErsnU/71Plec6vQYr9R/UbJqP0NVwO3s2VrLt46KG7qTI61iOdmBTCr0muVTg
	 rtLw/X548gP2+dK4XiIHEJk+h7mdXtTCFFOoQvI4XSPNBncKOpVYQFQUbW0XIuecVu
	 2QYCHuIeFBdx5sS1hEkadJ65c+4X0Drdje+wnRHioMY5Fs3qVQm9l+H0pE3t7Sg3Oi
	 Mnppq6S0fuOrQ==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BCA6240357;
	Tue,  3 Mar 2026 00:22:42 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 29D89A006D;
	Tue,  3 Mar 2026 00:22:41 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=eWv3Qjkw;
	dkim-atps=neutral
Received: from BN1PR07CU003.outbound.protection.outlook.com (mail-bn1pr07cu00301.outbound.protection.outlook.com [40.93.12.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4AE8240519;
	Tue,  3 Mar 2026 00:22:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JNcraR3AR3vcfPd37qC3rB+RpNOuuaW0MdCYydHPtJCh3NlNOrJB/XsZHA0glI3VIPV0CQu7+YISpjJTgw+Y8Jn/Dw75pRH2AA5m5kHUKlatHOK0ndjVWTzeo8VlAPPwXbcnDzTVivaaHYFVx9DWYXF46BOmIA0MX8AZ2aq6roM4mKTKicSOVz8fdINDgcaZy7vXGCbULAP/JJk0elRbXKdiwSszUaHXn4xIEnk7uGoD+/Y0Q3zI9b618HeIpV3BrkTB4UDKHmPiBe1V2TxfNh72033zGRA1lyYtUtPFaB5W/FyYAgDbFtHTZ+GiSpxf2EOWh3FCtpSTv2p5Jisl/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VextoMVkO19Xq8gmuhISUiLuxDsO10Sf0rWc5FZoZss=;
 b=dOPa/7zf1OGSU/hYUkZv/Q8sHW/SQulVcGUsdZFASbyMn8Fl7wWDxiUWGb3Lads25iRzkv/9v8g4k+uM8K+oNsrnhiRPyrpJylxPwSlDheDbZ5SByY28jTJXbyf0kFInvYg9rRmJpR5KaMJG78P1Ms3bbVk7/dvcVOYm+kLIS/QTZsZfPKBd68TWT9jFDXuYVLDgJYRFzZ4Sw55KFzXRqann1pEeHe8pETK/TKE19P8mgd8A3h6w7jfxHx2PL+hgFPo8xu6O7EHe/2Y0zhtTvy4wl0ZmCXMNLyMlyNkJgr9Z7D3LSejEVQ4rZUxbK86Zxr+v6RK/H8u4Bp1JZy74qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VextoMVkO19Xq8gmuhISUiLuxDsO10Sf0rWc5FZoZss=;
 b=eWv3QjkwrCQCGUg+p1kUEwsC10INRfauRE10fDz6w+ZXlqgiYlt6jRFIokdzuhugZHYAeagHTjNDEJNJqV2vEuOAnTapc/NkL5DU/Y0H+WatTQFCsSVSnkakereIGXdLqXBm3anUavEdqa9FBqM9HHmAEV+a4B34UtwlL8Ir4R8=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY8PR12MB7265.namprd12.prod.outlook.com (2603:10b6:930:57::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Tue, 3 Mar
 2026 00:22:35 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 00:22:35 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Ingo Rohloff <ingo.rohloff@lauterbach.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v3 1/1] usb: dwc3: Support USB3340x ULPI PHY high-speed
 negotiation.
Thread-Topic: [PATCH v3 1/1] usb: dwc3: Support USB3340x ULPI PHY high-speed
 negotiation.
Thread-Index: AQHcp+1Q5pzyw6begke12WBfH9akjrWXSzcAgAPbboCAANEogA==
Date: Tue, 3 Mar 2026 00:22:35 +0000
Message-ID: <20260303002233.j2yrwbgjfrb4csjh@synopsys.com>
References: <20260227133038.45150-1-ingo.rohloff@lauterbach.com>
 <20260227133038.45150-2-ingo.rohloff@lauterbach.com>
 <20260228005948.p4jniuf2zwws3ek5@synopsys.com>
 <20260302125357.16bac2df@ingpc2.intern.lauterbach.com>
In-Reply-To: <20260302125357.16bac2df@ingpc2.intern.lauterbach.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY8PR12MB7265:EE_
x-ms-office365-filtering-correlation-id: 8bb35a19-e300-4604-562c-08de78baf81f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 aZ5FkKdP3ci1i+VeRK/Mnes2r8zn7RQKPZUkhRGj+ocmUHEkksa7VRHd8O6uyPgYHYaTDXPvDXgcwepYD9SUcmcOz6J2tF2VKG++Ha54bsHUJd1n3eUEzEogu4C3rHiIfXdZWxacAA5HFT8tUXRTw1MQvhQvKiUPboCuJqAoqzoPptBkbEJ2VclY++APsRbT+F8nHZj86Cr6PpIidCysF6qScvzf4ypPbtVqUezDQbgZywIMsj0RGrT8h4B9Xblp1K0aj7YuzQ65jKbzLt8wDgb2qC3sTUhUhPnQRTTthmt0Ko0/wb/90g5Yn2CO40SPY2wd9TQdDnlTp0l7lcO9aVl0wXEf8Jh8B72mdMXRKrkY0N25uzJyDI9JC7B4301CfAAhe/iQoEk6GqTI1IExIJob3UjBjT542Ae7MCgH0qajhC5hscaVrZUYsEjcC7jk+1bTxmkrfVLVoOenisCDBJPedatrmZNDZ/yGKRcdnM10ePRJzqVdbKGA1F6QvYoyowwebcjZDslJt4eC/RWsWOUyQCoIEmDry5nJWWPHTwYuCyL4ZHznKbl3YRhA6hbLdgWIjXb2vAw1pBKBpeWeqmP1dj6sutHZQUcMs9GfU4/ayGjkAAPkmAkqDmbxulID62DztnRtikXPEXGq/GchU0hYepAoFQ3rGyGMfme1r+zYSgHsAoXiXM+lTxoeYgmUyhp7Qt0Piy0rThR6QYgfpDOaheWV17ucNLK/++YDpUcNTEsy9tEIiF394D7RApqqsVRS2lvTN+uJG4v37pSGih6UAUw0Enkyy9rnJfYAzjo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NFpzMFFwL2EvbTNzMm1XR1cyUmpUR0hxQ21LdVNoMjVtaEJHcFpJdFo1QmFB?=
 =?utf-8?B?c1dWdHNObm5CV3ArdUNaR0xsTVBWS2Rsc0RCckJVWDhHUENqQldiQ0VRdElr?=
 =?utf-8?B?UDhjWEdPMUFqZVJGdGxodzZZcm1WSFh4ay9ieW9kUy9heElJT0Q5bDdXOUJH?=
 =?utf-8?B?V0lLeW5SK0JSb3JoWnVPYi9ocGtML1JBWExtcm9Hb2JMMlpaWDU2Tm9nZ3lx?=
 =?utf-8?B?UXZFaUl0ZlVlaEFkWVBaUlJvdWhWb05lZkQ1UjZqc2JLYVF2aVQraDcwazVX?=
 =?utf-8?B?bmpsamJkZnlPNUVXanpLOWwrT2pVekZ4YmtaSVl4Yko3WGs1L2lTb3NtUkRa?=
 =?utf-8?B?RURNclNrZk1YZmkvcTdsUHVSendJYndyS0h3THlwOFFRYWJEVUdLMzBEcjBz?=
 =?utf-8?B?dDlLUHlPVmF4OGlHNXZqcDlHZkNpeXRoQWJDNHdRelUwTXlhVllIeXRBV2JS?=
 =?utf-8?B?WjJVb25pU0ZQSWg2S3gwY0lTVFc3SWdxUjlsNEdYNmpPRmkxZmVnTGxpN25t?=
 =?utf-8?B?OStLL2VmMTFRTWR5WkNxQWRKU0lreWN6KzVLbnpPaTR3ODNWN1VsTS9kSS9l?=
 =?utf-8?B?bngvSVhxVFM2YVNvTVR4U0REbDJpZDQxUE94eVF2c3kvVTZ6R2xLMm5wK3oz?=
 =?utf-8?B?dlJnUTlBUmF6SlpYWlhZUmVkNnltN3k1RG9WU1JZeG05bUllKzc1eG9zYjdW?=
 =?utf-8?B?UVoxSU45QWhnY05pRHVQbEZrS0JQT2NNcGRBOWVMOXRtS0dPSlFLc1prMXl0?=
 =?utf-8?B?OXF1WkxobW9FL280TjUzcktJMGxWZy9sL0YvT2t0QlQ1NE5La0Y5bkpXMGlK?=
 =?utf-8?B?NHk0S0RsdkcrZ1lvZnh1MjRtT2RqQnVUZGovOHNiT2N1bVdlR2kwOGpHTTlF?=
 =?utf-8?B?aWt0czBSaUdoM3UxbzRtbm00OW55a1J1M0tRSXlSTy91eWtwbWNPejRKSkd4?=
 =?utf-8?B?eCtIM1hYcTA4VGJjWDFzcm92a1V2SjV4VXZnSmNMVXJMc3lNcm84eFBLdk9m?=
 =?utf-8?B?RW9scnBUd2hpaW9pakZhWXM3cU1wTDdnNm5sQzVIYmpreWU5QmlaSlRBczJi?=
 =?utf-8?B?eGxvU3EvMmZ0ZUNERnh3VXhWSWt1aVQycUFoQnRsalBiQnN6azh2RVRpRFFN?=
 =?utf-8?B?dlJrT0pncTRydVdXSkpMOFpsTGN2VzJvdlMxKzVvTGNtQ3MzeEtkYVpPbTZi?=
 =?utf-8?B?dGhhRXlPbndsUmFrWFBVUytvUEJqdlQ2RnB4MGZ5UG12MVg3dFVnSk02L0t1?=
 =?utf-8?B?NjFudjdvdVFTNHN0VjJEREFEM2pzTTExaVFFLy9sbVhGT2FTSGRBU25LMUhh?=
 =?utf-8?B?cXQ3VDVmUldMdHcvMWQ0TXVacTQ5ZStOWG5EVDdFOWxSNEs4Y1hhS0UvSWRq?=
 =?utf-8?B?SkRJNVRRSHozemdIUC9ISlFUY2Zpd0YyTnJMM1ZKMC9ha0szUW8vR1ZVaFUv?=
 =?utf-8?B?a2NVSjFKSGQ2blR0ZW1vbmQvQmVQL1NXOXZWS2FiNmtpTk5tSDZnS0lSUGh1?=
 =?utf-8?B?c3J6TWpZbERRenJsMjdBdndiUmMrTTlJT1oyRmc3S2l2UzRhSkl3V3VlTytK?=
 =?utf-8?B?RnRnaTgyWktKbVpnNmE1bFp4ZVNLcG1UTUFuQ2ppa044cHJQQkw2djNweGNW?=
 =?utf-8?B?T1BYa0JNMU1walF0SXZocEgzME4yYXRta0xYT3d1SGd2N3BIY2JHbGdVenh0?=
 =?utf-8?B?VXVGc3lMaFlPcTFGTFBrYUljWHRuK0J2NytyNGVGa1I1WmhlNVREc1NUSVJy?=
 =?utf-8?B?SW9ZYzlkY09pQmN4elYvZ0tBSlV5bnB2SmlqS1pIQ1BCc3NVWHJDZVJkRU5m?=
 =?utf-8?B?TjIyUE9oM0FJbHVaa2krOUpuU1FHZWx0SW5IcVdqNW03dXlFRWwrb1NxYU1s?=
 =?utf-8?B?eGtjN28zdUFYb3hZRVdmdFBRTGpseE00NXhteW9hWjhWREhXT21FWHU0NExH?=
 =?utf-8?B?bXBoRHR4cTRVWlMxSlRwem5OUGlWb1hiaUtTcmo3ZUE2TlQwbUtmczNudXVL?=
 =?utf-8?B?dHE0VkRDQVNuZGlDOE1nRllDSnJVdlZvL2F3SGxvazNFWXN0YXJxdUdiZmhj?=
 =?utf-8?B?TjNwcUgvVUVzNDgrVGk4UnhiNGdTWGRQRDllcjUvR3pMWVlHdDRVdlMxOXdr?=
 =?utf-8?B?ZmtESHZhempnUThLb3JCbGRTanJ2cEhxdXEraEVscHFYcjZUUlFwdjhPWTZM?=
 =?utf-8?B?dDIwUFFtN2g4bTdhUm12amlGdVlSbzc5eXYvV1V3YXBaWHp3dk0zWU1OYmRS?=
 =?utf-8?B?UlkxVFdYTFNRUG9SOWVQWnlWOXZWVzVzK1Z6R1lsNDFwSXBHQWZDYzFiQndu?=
 =?utf-8?B?YVoyZHBTTnBUeno2WG5pZStseHdUbjZhNTdrQ0gxWldwcUEvNTgxdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C7B24184C2F257419700F58FA6B564DD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Seq8+dn7urU+E1B0wr8S69MjZlz+Lm6Dg6H//EM1h/bBauUkZPdcOaG2r3S71nkmTU/EJV3maYY8WztNrntq13Cer27CzWSv5aUqnpII+ST5Xq/JTeDD8X+uZEjr8l9Hi+MajPmOnUvOSfuC5iWmiviDVJUh5PA+olw0vAHj6tzkef7SZOLjMxkQXRY+bLzRBRAi9wjDpEE6wxEmtVjLYzjgSJCzm7xXUl9504UYbZ/o1qPIe5UcG+9tj1ymUVOR7XEIjrkEfybKWQcoAM3GFosWfWYCmVHQFA6UhWrygEP1ATPOItR0cgrKTQA8vftCz5DMNjlYRQCzbiI0Y6jmucmZ00ptiLl7aY1u7fhK/E9H7SmZ0x05EMfPq61TbSgAK3hE6SQ5Vf0BLPn8UpMqcALVQp5FZE9K38iKyuXt0N2H9tWWDFnNhYRwPE9hPhwWFxwR65ET6KKDr1LZEL+RonPv4ek3JVQ2YjVfuc/h2gY87n/JvZ/BM0rP3w/YEYrmYqRW3Vkn96aQcDTqGKiKalcG6Yp9ffWblv4gRyHeQro89XWEltdFs/SMawOkLWGOXlXVMm2R4oRyaWxQp8CtMf3gWrYRO7DDzF6heqkqiV1ZiBXcIfnDun6JIkNJjq5gehy4QYpEtDABKh3tqUKjNw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb35a19-e300-4604-562c-08de78baf81f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 00:22:35.5020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rha+yEYIGwW1hf/U14PsAr/LA0IFTxylYVNv3r23A5+GkIKD0b7H6kacNZUuN/vK6e8EWY/Y7XTb+BofdrxPBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7265
X-Authority-Analysis: v=2.4 cv=HbgZjyE8 c=1 sm=1 tr=0 ts=69a629d4 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=Sn5pOLxDqdBd4ltpIs8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: dPpwa6c1dQUCK_oDyXVEHYQy8ygGaaRQ
X-Proofpoint-GUID: dPpwa6c1dQUCK_oDyXVEHYQy8ygGaaRQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDAwMCBTYWx0ZWRfXyZ1526UyRyKW
 FUCKmncUm9YSJ9ySuM6rGaUpxjRwuMDmEI56BLfWEB7efG274+PdsqQOmZQSTGbYtL+2NAnxPDG
 yE8eFAuoUZxfcMZDaUF899UBpE5I2yaWF1Yijm6uB2jEsYI5QOqCFDHQJgIJMc8gOH/4+PRFCni
 IE9sqwD9ybz0lLrp6t66p6sE6tc6sGyleyUUo+LhYwIBxnL4waPaEbSOAJKbGXiUFDLnBWgutKM
 LfpXcLmwQO71apScyh56xPD6b7TV2OfrJ92rzhpzfGW6I5V/OJTmJzrZm+sUe4OwUqy4b6F5aCr
 bWj+xJAacxVTWIOq1GeyLv6Axy5FDhlRvXdiXFbcDr4MuTMGbLFGjI1d8t34YxT1wVOYHXkB4Gy
 zfVfAeWTDi0gycE2P0+EYSy+N3nF44SZ0XjdhoR5VV3U9IW5kOzFFhqGGku6TnhgQoqHuk3RJQX
 TTWncS3QGw0DFAOZwrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2603030000
X-Rspamd-Queue-Id: 0486C1E7184
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33888-lists,linux-usb=lfdr.de];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

T24gTW9uLCBNYXIgMDIsIDIwMjYsIEluZ28gUm9obG9mZiB3cm90ZToNCj4gSGVsbG8gVGhpbmgs
DQo+IA0KPiBJIGhvcGUgSSBkaWRuJ3QgY3V0IG91dCB0b28gbXVjaCBvZiB0aGUgZGlzY3Vzc2lv
bjoNCj4gDQo+ID4gPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL3VscGkuYw0KPiA+ID4gKysrIGIv
ZHJpdmVycy91c2IvZHdjMy91bHBpLmMNCj4gPiA+DQo+ID4gPiArc3RhdGljIHZvaWQgZHdjM191
bHBpX2RldGVjdF9xdWlya3Moc3RydWN0IGR3YzMgKmR3YykgDQo+ID4gPiArLi4uIA0KPiA+ID4g
Kwlzd2l0Y2ggKHZlbmRvcl9pZCkgew0KPiA+ID4gKwljYXNlIFVTQl9WRU5ET1JfTUlDUk9DSElQ
Og0KPiA+ID4gKwkJc3dpdGNoIChwcm9kdWN0X2lkKSB7DQo+ID4gPiArCQljYXNlIDB4MDAwOToN
Cj4gPiA+ICsJCQkvKiBNaWNyb2NoaXAgVVNCMzM0MCBVTFBJIFBIWSAqLw0KPiA+ID4gKwkJCWR3
Yy0+ZW5hYmxlX3VzYjJfdHJhbnNjZWl2ZXJfZGVsYXkgPSB0cnVlOyANCj4gPiA+IC4uLg0KPiA+
DQo+ID4gDQo+ID4gPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiA+ID4gKysrIGIv
ZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gPiA+DQo+ID4gPiArc3RhdGljIHZvaWQgZHdjM19o
c19hcHBseV91bHBpX3F1aXJrcyhzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiA+ID4gK3sNCj4gPiA+ICsg
ICBpZiAoZHdjLT5lbmFibGVfdXNiMl90cmFuc2NlaXZlcl9kZWxheSkgew0KPiA+ID4gKwkgICAg
aW50IGluZGV4Ow0KPiA+ID4gKyAgICAgICB1MzIgcmVnOw0KPiA+ID4gKw0KPiA+ID4gKwkgICBm
b3IgKGluZGV4ID0gMDsgaW5kZXggPCBkd2MtPm51bV91c2IyX3BvcnRzOyBpbmRleCsrKSB7DQo+
ID4gPiArICAgICAgICAgIHJlZyA9IGR3YzNfcmVhZGwoZHdjLT5yZWdzLCBEV0MzX0dVU0IyUEhZ
Q0ZHKGluZGV4KSk7DQo+ID4gPiArICAgICAgICAgIHJlZyB8PSBEV0MzX0dVU0IyUEhZQ0ZHX1hD
VlJETFk7DQo+ID4gPiArICAgICAgICAgIGR3YzNfd3JpdGVsKGR3Yy0+cmVncywgRFdDM19HVVNC
MlBIWUNGRyhpbmRleCksIHJlZyk7DQo+ID4gPiArICAgICAgfQ0KPiA+ID4gKyAgfSAgDQo+ID4g
PiAuLi4NCj4gPg0KPiA+IFRoaXMgc2hvdWxkIGJlIHBsYWNlZCBpbiBkd2MzX3VscGlfaW5pdCgp
IG9yIGR3YzNfdWxwaV9kZXRlY3RfcXVpcmtzKCkuDQo+ID4NCj4gPiAuLi4NCj4gPg0KPiA+IERv
IHdlIHJlYWxseSBuZWVkIHRoaXMgZmllbGQgZW5hYmxlX3VzYjJfdHJhbnNjZWl2ZXJfZGVsYXkg
YW55bW9yZSBub3cNCj4gPiB0aGF0IHdlIGhhdmUgdGhpcyBjaGVjayBiYXNlIG9uIHRoZSBQcm9k
dWN0SUQ/DQo+IA0KPiBJIGhhdmUgdGhvdWdodCBhYm91dCB0aGlzLCBidXQgSSB0aGluayBJIGhh
dmUgdG8gZG8gaXQgbGlrZSBhYm92ZS4NCj4gDQo+IEkgdGhpbmsgbW9kaWZ5aW5nIHRoZSBHVVNC
MlBIWUNGRyBpbiBkcml2ZXJzL3VzYi9kd2MzL3VscGkuYyBpcyB0aGUgd3JvbmcNCj4gcGxhY2Uu
DQo+ICJ1bHBpLmMiIGN1cnJlbnRseSBkb2Vzbid0IHRvdWNoIHRoZSBEV0MzIGNvbnRyb2xsZXIg
aXRzZWxmIGF0IGFsbC4NCj4gDQo+IEl0IHNlZW1zIGFsbCBvZiB0aGUgY29uZmlnIGZvciBHVVNC
MlBIWUNGRyBpcyBkb25lIHZpYSBgZHdjM19jb3JlX2luaXQoKWAuDQo+IFRoaXMgZnVuY3Rpb24g
aXMgYWxzbyBjYWxsZWQgZm9yIHJlc3VtaW5nIG9wZXJhdGlvbiBhZnRlciBhIHN1c3BlbmQ6DQo+
IA0KPiBkd2MzX3BsYXRfcnVudGltZV9yZXN1bWUNCj4gICBkd2MzX3J1bnRpbWVfcmVzdW1lDQo+
ICAgICBkd2MzX3Jlc3VtZV9jb21tb24NCj4gICAgICAgZHdjM19jb3JlX2luaXRfZm9yX3Jlc3Vt
ZQ0KPiAgICAgICAgIGR3YzNfY29yZV9pbml0DQo+IA0KPiBTbyBJIHRoaW5rIHRoZSByaWdodCBw
bGFjZSB0byBtb2RpZnkgR1VTQjJQSFlDRkcgYWNjb3JkaW5nIHRvIHRoZSBkZXRlY3RlZA0KPiBV
UExJIFBIWSBpcyBpbiBkd2MzX2NvcmVfaW5pdCgpLg0KPiANCj4gTm90ZTogZHdjM19jb3JlX2lu
aXQoKSBkZXRlY3RzIHRoZSBVTFBJIFBIWSBvbmx5IG9uY2U6DQo+IA0KPiAgICBpZiAoIWR3Yy0+
dWxwaV9yZWFkeSkgew0KPiAgICAgICAuLi4NCj4gICAgICAgZHdjLT51bHBpX3JlYWR5ID0gdHJ1
ZTsNCj4gICAgfQ0KPiANCg0KQWghIEkgZm9yZ290IHRoYXQgdGhlIFVMUEkgaW5pdCBmdW5jdGlv
biBpcyBvbmx5IGV4ZWN1dGVkIG9uY2UuDQoNCj4gTXkgcHJldmlvdXMgdjMgcGF0Y2ggaGFzIHRo
ZSBidWcgdG8gY2FsbCBgZHdjM19oc19hcHBseV91bHBpX3F1aXJrc2ANCj4gKHRvIGJlIHJlbmFt
ZWQgaW4gdjQpIE9OTFkgT05DRS4gSSB0aGluayB0aGF0J3Mgd3Jvbmc6DQo+IA0KPiBUaGUgc3Ry
YXRlZ3kgaXM6IFdoZW4gdGhlIFVMUEkgUEhZIGlzIGRldGVjdGVkLCBzZXQNCj4gICAgZHdjLT5l
bmFibGVfdXNiMl90cmFuc2NlaXZlcl9kZWxheQ0KPiBpZiBuZWNlc3NhcnkuDQo+IFRoZW4gdXNl
IHRoaXMgYml0IHRvIG1vZGlmeSBHVVNCMlBIWUNGRyBpZiBuZWNlc3Nhcnk6DQo+ICogT25jZSBh
ZnRlciB0aGUgVUxQSSBQSFkgaXMgZGV0ZWN0ZWQgaW5pdGlhbGx5LA0KPiAgIHZpYSBkd2MzX2Nv
cmVfcHJvYmUoKS4NCj4gKiBFYWNoIHRpbWUgb3BlcmF0aW9uIGlzIHJlc3VtZWQgYWZ0ZXIgYSBz
dXNwZW5kLg0KPiAgIFRoYXQncyB3aHkgYGR3YzNfaHNfYXBwbHlfdWxwaV9xdWlya3NgIGhhcyB0
byBiZSBjYWxsZWQNCj4gICBlYWNoIHRpbWUgZHdjM19jb3JlX2luaXQoKSBpcyBjYWxsZWQuDQo+
IA0KDQpZZXMuIERvIHRoaXMuIElmIHRoZXJlJ3MgYSBwb3dlcm9mZiBhbmQgdmNjIHJlc2V0IGlz
IGFzc2VydGVkLCB0aGVuIHRoZQ0KR1VTQjJQSFlDRkcgd2lsbCBuZWVkIHRvIGJlIHJlLWluaXRp
YWxpemVkLg0KDQo+IA0KPiAqKkFMVEVSTkFUSVZFKioNCj4gU3RvcmUgdGhlIGZvdW5kIFVMUEkg
VmVuZG9yL1Byb2R1Y3QgSUQgaW4gYHN0cnVjdCBkd2MzYCBpbnN0ZWFkIG9mIHRoZQ0KPiBgZW5h
YmxlX3VzYjJfdHJhbnNjZWl2ZXJfZGVsYXlgIGJvb2xlYW4gYW5kIHRoZW4gZGlyZWN0bHkgdXNl
IHRoZQ0KPiBVTFBJIFZlbmRvci9Qcm9kdWN0IElEIHRvIGFwcGx5IHRoZSBuZWNlc3NhcnkgY29u
ZmlnIG9mIEdVU0IyUEhZQ0ZHIGluDQo+IGBkd2MzX2hzX2FwcGx5X3VscGlfcXVpcmtzYC4NCj4g
DQoNCk5vdCB0aGlzLg0KDQo+IFdoYXQgZG8geW91IHRoaW5rPw0KPiANCg0KU291bmRzIGdvb2Qu
IFRoYW5rcyBmb3IgZG91YmxlIGNoZWNraW5nLg0KDQo+IA0KPiANCj4gSSB3aWxsIHRyeSB0byBp
bmNvcnBvcmF0ZSBhbGwgb3RoZXIgZmVlZGJhY2sgeW91IGdhdmUgbWUuDQo+IA0KDQpUaGFua3Mh
DQoNCkJSLA0KVGhpbmg=

