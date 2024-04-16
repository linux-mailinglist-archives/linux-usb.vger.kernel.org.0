Return-Path: <linux-usb+bounces-9392-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7BC8A6E4A
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 16:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8AA01F21AAA
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 14:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B30129A72;
	Tue, 16 Apr 2024 14:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=radatechllc.com header.i=@radatechllc.com header.b="w0hNm+wd";
	dkim=pass (2048-bit key) header.d=radausa.com header.i=@radausa.com header.b="gm7moUZS";
	dkim=pass (2048-bit key) header.d=drs.ca header.i=@drs.ca header.b="LRAfGM+B";
	dkim=neutral (0-bit key) header.d=drsintl.com header.i=@drsintl.com header.b="onBoLh1g";
	dkim=neutral (0-bit key) header.d=drs.com header.i=@drs.com header.b="HY6irqLx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00218c01.pphosted.com (mx0b-00218c01.pphosted.com [148.163.152.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183B420B35
	for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 14:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.152.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713277923; cv=fail; b=EoAxXML06s4zamEf8CgFJ9WhrNBuM3w4mTIsvHzEi79v0eKR6aQ/Djb7Z8CbUp1cTqKy/tAzhIQ4/+3n8MJBG1xkNi0luQRpf95aChzKyVjvDoS68ItPZFNGhtdy82TjcUyv/zV4NSnrIc5MyFYQ4VIiC8QkRywhpHfmZn66gRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713277923; c=relaxed/simple;
	bh=jWeBpOf6zYxHiHd2xwt41jeCVWAoFBH2iICXxgjtgA8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p8gpi2MqxQH+lG85jsVQKjY3CPhHaMssfG3bxXs+NSE0WxHpw0HE/ZyS+ZwG95L9itn5HW/hisHZgqRKuET9G7xkie289bWenLlr04kZ+Gq04MQIuqgmhOODmI0B7hw1iLCYO/wTiEU60s+nj/Cyf5yZIWiwi9XZ+ariMjyYQzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=drs.com; spf=pass smtp.mailfrom=drs.com; dkim=pass (2048-bit key) header.d=radatechllc.com header.i=@radatechllc.com header.b=w0hNm+wd; dkim=pass (2048-bit key) header.d=radausa.com header.i=@radausa.com header.b=gm7moUZS; dkim=pass (2048-bit key) header.d=drs.ca header.i=@drs.ca header.b=LRAfGM+B; dkim=neutral (0-bit key) header.d=drsintl.com header.i=@drsintl.com header.b=onBoLh1g; dkim=neutral (0-bit key) header.d=drs.com header.i=@drs.com header.b=HY6irqLx; arc=fail smtp.client-ip=148.163.152.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=drs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=drs.com
Received: from pps.filterd (m0095893.ppops.net [127.0.0.1])
	by mx0b-00218c01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43GDIKb9025042;
	Tue, 16 Apr 2024 10:20:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=radatechllc.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=summer; bh=f0nSojSlA9GYz+lNRIB0+RU
	wOyiBesBQfV6IlPiIBH0=; b=w0hNm+wd/SDEBvU2639GQnv3UyChNvASnT2xurW
	HukRKjMEocQJVm9K/t/nkaJKfPehjy75Q3fLFKwPnmkCs8hbUvcHv64fSi7aZPd4
	PczZAs7UKoA6ElmuQ/GH27bWv8EGtGsQhpibPVfPmhgS91ULQuHNu6vXgVDA30tv
	d6tSB9FaDIsvl4vHHi0I2WBM8OyLMe8viLqY7DE/9D9UD2Am1K5ZWyIp2CNwOawR
	HpyISwoRL1Am+PzF2vOiMrAq4Yee/QY4nKNOs8Et5x1YCiZilbw45ly/vDq8e2I8
	uDKEfbxs5zMybf1gv1q9nooWmvtLDSqxj/90+L17bmRA1PA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=radausa.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=summer; bh=f0nSojSlA9GYz+lNRIB0+RU
	wOyiBesBQfV6IlPiIBH0=; b=gm7moUZSa0DSUzz3x+ytZYLNJSbz+bAtJweraKJ
	aTVz6E34lhdN1SiUEKwcBUjo8/vVV2DZfNcW2swPusYT8TOP61kzlS+3/jrKdLM+
	ZshgTNR88/PJZ6SfS5N001bLEb+CasVjvutPNPt6gx+8ibQGohfpB8pRM+BoKHPL
	ReDr+AfJ6F9PnauzlQGGi0a5LpBPzX7wyvI78Gbk2/IHx8y77W44jgJGr5+dVhuL
	KuUtK+I3xHqakrxQf3KNg5T8fdQoRZbY4PlpskSe50MdzjDNmuD+hQpTyQU+iWsV
	mfFMdUvkkofCS2abbRu6IWrebj9Rkily55HiBe9fuJ0e2dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=drs.ca; h=from
	:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=summer; bh=f0nSojSlA9GYz+lNRIB0+RU
	wOyiBesBQfV6IlPiIBH0=; b=LRAfGM+ByKuJPNwKkVXRwSprDZ/9Fm6iplzbJ68
	6mLXTdkDBKrVRxppwE4eerWHQw1U4/EdQ4MYgrsjslUhALAop7JWKflQhddnj/FR
	Xh4TtQpUqKAP2qwPn7IbTzFmV49dv50keLZxI/jvyflpd07em92a/oVv/d2AMWRc
	m6hU23HimxiEhcnTsaLfE3l+MmKGMx7d6obN6kc3AILndFXaqmZtYZEbha7uFMJ8
	Rgmpt4gEy6gIIjvSc1D0Efa+b733+TUzJZdEoSve8W1KLESUpnATqdhoSwaFeebr
	6LtFWD5foZMycevO9W+5ELiHzcy8a/rO1BCe1lXlib4dVWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=drsintl.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=summer; bh=f0nSojSlA9GYz+lNRIB0+RU
	wOyiBesBQfV6IlPiIBH0=; b=onBoLh1gzq5PUSbpfMEVsU7cBgle2c/S8YfImJR
	93jkQZZbfyU+IiF1dMMs8RRLBkpB2kHdM9865chS1G7mEN4hMeDtLquiNKu3Kscv
	68BdlYPD6xFgs1BJFzgkyUIYbUD9PVX1V7CFtMVTVmW8SSiROy1JEb7Zv3fzTJk0
	gRKYE1aJP8ciR2YO2yacw7FVMOw9aJfL5d0o1mt7QZolPUNsGT0aWF5auTPGAhRq
	r+W6taT9JIA5CJvjkwJszMopXg044Oc58fo5XjgdNpF45mvvd/vs+9tQL0XwEW5m
	YKbXIj/K3kIFHcmKfGih1DMXYxOyuCE6V9uXqK7cUMJdIdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=drs.com; h=from
	:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=summer; bh=f0nSojSlA9GYz+lNRIB0+RU
	wOyiBesBQfV6IlPiIBH0=; b=HY6irqLxMVsMZsnf/AjfN0TrEa60lrBh3syA5PP
	1EFMlDhNiH9vXHL/fB6PHpTjft2mYjaFkXZCnnV48KL4ob5S2TS87mCczxTApTes
	7PIDzJHMuviqXZK+vZJvUFwlYdz0DQDT/E4CAyGM579TGYRDK7t/nki2f9WaDlur
	cK/ObduBNz4oFN16sKWTnF57NqMEXo98QXtjnDsg0qVzzfimZLf/GOJf1puSPxRu
	izsQIeCUQij/Vc7Z9kS3petc3gVOBGz2SQC9FS7M0uo1WoIWwZLvrmv3wU/Snx+G
	GcEGUa5msHxnEdR/n7SNgrcF8LBIrtnaSOJ2n3CJVKrJDow==
Received: from usg02-cy1-obe.outbound.protection.office365.us (mail-cy1usg02lp0183.outbound.protection.office365.us [23.103.199.183])
	by mx0b-00218c01.pphosted.com (PPS) with ESMTPS id 3xfnf7u6mx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 10:20:46 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=BtXxwJU/eH9o0FYmFpsG9BnS242awrncxAoeT4WxeWjqeqN3pA+qGNKxbga7o2XLTO5EEiw6f/DbvYGHORN0h9mh/YpOHRMDOpIrIoeusqWmT6hF20tPlDTyHvciYC3yt5L2d4naKu3bKzmesJ5czoDiC0fSMH+LRKmdpsXpyQsHCc/v0HDi0J76zN27TPyAp4BDG9bZwxGPtO6hbNPXfThdcQ9GRDkoN8eIFqz1nJKKhBYSDOxF0o8wLuHP6en03b4lCl8mtUmBB4Cl9AGtqC1pGtLTAGsIe3mx09fA02Ssa3d42PtFoVqCJ0MLgCJx45IOi1n0eKkglGfiGW0duQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0nSojSlA9GYz+lNRIB0+RUwOyiBesBQfV6IlPiIBH0=;
 b=J7fP04lI+++sdnjduPeMYIAUQgTZ2jKciJ148xA0DImNDYTL/t4YPY3iQ3BdvjBd2WItkqs2iN6jR1i0VIAsieEEA+HpWnz8DuJ89HVYmuoZgX9qOY6/dxFkHf0dNRhy766dP5cspDIIt1EeMMjAdwqW2yaNkAqtNbsjoU4iZihSpINFI0a89tnUdjgdATR3c+pWda2wQ/dZU5umNIGCdemysh8DnbKIBArDwda7bQolrvfqmKUor4M+edIslFjsesDmZaDSPJuOcM2s9oXZVkn2ewQty0K3X5ptesOAi+70PeIFHza3CnGt8q6QvhODKM8RGhPGyDl/Z2pFKPqi0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=drs.com; dmarc=pass action=none header.from=drs.com; dkim=pass
 header.d=drs.com; arc=none
Received: from PH1P110MB1489.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18a::19)
 by PH1P110MB1049.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:175::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.61; Tue, 16 Apr
 2024 14:20:44 +0000
Received: from PH1P110MB1489.NAMP110.PROD.OUTLOOK.COM
 ([fe80::72b5:415:c7aa:f3b6]) by PH1P110MB1489.NAMP110.PROD.OUTLOOK.COM
 ([fe80::72b5:415:c7aa:f3b6%7]) with mapi id 15.20.7409.061; Tue, 16 Apr 2024
 14:20:44 +0000
From: "Grossman, Jake" <Jacob.Grossman@drs.com>
To: "Thinh.Nguyen@synopsys.com" <Thinh.Nguyen@synopsys.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Krebs, Charles"
	<Charles.Krebs@drs.com>,
        "Hardee, Hayden M" <Hayden.Hardee@drs.com>
Subject: usb: dwc3: gadget performance insight
Thread-Topic: dwc3: gadget performance insight
Thread-Index: AQHakAlEOXyT1lcifUm2l6SVwC7O4g==
Date: Tue, 16 Apr 2024 14:20:43 +0000
Message-ID: 
 <PH1P110MB148961B015C6ABB24C2E03538308A@PH1P110MB1489.NAMP110.PROD.OUTLOOK.COM>
References: 
 <PH1P110MB1489614D2BD4B34E66B9A3208334A@PH1P110MB1489.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: 
 <PH1P110MB1489614D2BD4B34E66B9A3208334A@PH1P110MB1489.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-dg-rorf: true
x-dg-ref: 
 PG1ldGE+PGF0IGFpPSIwIiBubT0iYm9keS5odG1sIiBwPSJjOlx1c2Vyc1xqYWNvYi5ncm9zc21hblxhcHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJhMjllMzViXG1zZ3NcbXNnLTgxMmY0ZTk1LWZiZmMtMTFlZS1hN2I3LTAwNTBiNjI0MWExYVxhbWUtdGVzdFw4MTJmNGU5Ny1mYmZjLTExZWUtYTdiNy0wMDUwYjYyNDFhMWFib2R5Lmh0bWwiIHN6PSI5Nzc0IiB0PSIxMzM1Nzc1MDg0MjI4ODQwNjMiIGg9IkNLbTRrWGJoNlRKdHJISXFQRWgvKzBHd3h6RT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-refone: VE5SbXM9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1489:EE_|PH1P110MB1049:EE_
x-ms-office365-filtering-correlation-id: b6bffb33-9c13-4a52-5902-08dc5e206703
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?kvVB6cJl/wKHzioBEl8SNZ+FceLxqsos7TuHYrj2P1D6VimQVj4IB17FdP/z?=
 =?us-ascii?Q?FgXWlHfGIDD0UJ84uwbeN5JhX3bO07gjY9zHc21zQNrB2rGOVDPZKAazeUrg?=
 =?us-ascii?Q?B3eShQpspdMiloK1VHCBOQWo7AweooUDKk4hZrertLKoxSg6dCqFllW5HDvj?=
 =?us-ascii?Q?D4qtvQcmGYvo8DasMq2MHFbaWPLxSPSrr1C5tlsg9ZkXp4QlvS7RSlYomSVD?=
 =?us-ascii?Q?EpNfWV/1aHnTouEeDAAteEeAu58xrK5SjOLi1ElgSGGEpLIhZnnI5jOTvHPB?=
 =?us-ascii?Q?W+q0qwLkk5qiS18Y/OlIgLy5DSapINszevPyjy/Edy4inF9Vn9dGmvIMm06B?=
 =?us-ascii?Q?8sFY3Vsebj5HdCJwK8jsE0SJ32qoV0z8B8UFIsD0nCwmoTXDhsE6f850v6W8?=
 =?us-ascii?Q?5eVPzoloavHQe+e0TKJKaEE8s62IxPEGJnC6hm684Okxw0iIIj5aN5rHToQ2?=
 =?us-ascii?Q?bI06eO6fBJlfqpXbm3vo9eU9FdWWqRiTR+sA1LnKJa7g8tFwuQqJu2mk8U1K?=
 =?us-ascii?Q?F/R1tL0J97p0B4VpCrURZKKSu9SHi64elqjtGwH4NC2/yeEr1NOJUTbmDC+R?=
 =?us-ascii?Q?Fu4RwN/84rmp6eE/A5lBjLj+ruKnMtqnLnhabIBB70GuiPltyPraccjb0Jws?=
 =?us-ascii?Q?Bhv2NYQik8QOfGzoJq/X9TBfoV/X8169s/C4h+vhzYFlJd/vQ1DJXf7qlAma?=
 =?us-ascii?Q?/C4y+i8gZ2hEBoO2ERAmETFd4tfy+uxQPr2IGi0MOQ2+frYlnuL2mIaMspBX?=
 =?us-ascii?Q?51q0qGmDoAiaP10QdYr5Oq079ix4I8u+1baTxL9vDK4pI1gjPXoZJB2zfGks?=
 =?us-ascii?Q?OXj0B6bSoRnfV4XCfz26ryr4UVeQ2TIQN5L8A9epIpmwxMbjtsKVd3q0tlo0?=
 =?us-ascii?Q?7eQRwatasLcM1VIYIOZyxjHSEGkAIo8raUg5n4pmebzWqdr6YaUBXcbqzqSu?=
 =?us-ascii?Q?lk9l4Iex6GFsZOGr4rX975LZW93ecWraK1RWXYIl7xVqVRCo+818qpyg6aOM?=
 =?us-ascii?Q?ZpWoku4Gm0cJ+Y8PajogS4mxOgpgYGymc4uHh8wcdzHItekMQAS/3gWGW0lx?=
 =?us-ascii?Q?yXtA9/6/WF23SuczdOYEvfT3eWvmqw+KKX2uXb9tyNK1W3NTSy4Kya3cXksw?=
 =?us-ascii?Q?E9bR2uE+MXw2jFZ7N31TVwfOYVbT5wNv+yN4ty/DarTNnrZj//SZR+ng9DRD?=
 =?us-ascii?Q?WB/zsIsbPhYeltN/48cSb4MzIptySHKZ4zhBNUuBbv+ARGvC/gOSHiJYhkzV?=
 =?us-ascii?Q?z/ZFu+qDBmdmTbYWLgsOOxbSqOlQmUhOSrmx8ZgT1Q=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1489.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(41320700004)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?qbqS68ketvQ3oZbGV3Te2AMmZu/0b70D2KX7Mk0YR1Iztoah7wHdVD6eODmy?=
 =?us-ascii?Q?6eEpsa/kV6crjCV+HVBmGbEYZjdj8JJc48gYzinBo7Cra/vFYaiS4odgvX6S?=
 =?us-ascii?Q?yF986CpPkk9hr9Ua3OZGaaOEruJvKLTrwCYIHr1qKFirkTpNY5n3eLGBMvCF?=
 =?us-ascii?Q?6lsAyiFKhpF/jGiUSLyt/UVJwwQ8qBfjvPNoXeAE+9P9idFj4P7o5zRr6wID?=
 =?us-ascii?Q?NKi7IFjRUECqpPURpaNgnGpqKztR9LmodRk/tUwnCsuW+OmYxaEjB3kDIXJ7?=
 =?us-ascii?Q?+alQoGDl+B6B8kpaupLeXjKwnLS0OXzCqaCG2qnPWU7GpWynEEI6gTs4qWLY?=
 =?us-ascii?Q?2UjF6Vb4AmEjAgTD0wKMb1vp8OySZdchR6byHkQqCVLX1TlYhHu6hG6oNJsb?=
 =?us-ascii?Q?oTIc/DfEvi8AlJ3par54yspHEWQt9vFtD8P+WseBbsWlBZXVBJera7RZ4YXT?=
 =?us-ascii?Q?Z9YWvW5SWnnuYw2GkBl6ArpRcFsKI7sS38TP9+GUNZQWZROjwA8gf5ietgwx?=
 =?us-ascii?Q?hI0U68p3gNm+PYot/KUip6OVqgo0YKe++6nrEIYj7WPhkk5kp7TuM9xGNyPz?=
 =?us-ascii?Q?BV0277lldplrZEVRNs0YSyGK4AMn1t1OfICUAdA5cJ1c7oIN7659Er2OP8bA?=
 =?us-ascii?Q?v2eLKJoZZUODmE46fz3j9ZoPcAjakCUMAJ86NQjot/B3Ln+ZrJfFdnWmE/aR?=
 =?us-ascii?Q?6HAc3UaS6jKgzW35g4ip57gTUB77/ItACGlwD4mLWuirrAhaXIdlUlnEZhvx?=
 =?us-ascii?Q?Jp/SfjJEtCmub67iYVT68FKhGl2FFdWy6GZxRcUnzHwnr6j6m7RfQUSukcgO?=
 =?us-ascii?Q?rbd3LsQpawUUX+P/y62yQoq76xnFuxQaxm7MA4hat5LSXeg/5NO8N6Qmq9VM?=
 =?us-ascii?Q?m9zrBJw5pTWsi3LEoJ54IyZ4Jtz/G4RKPRjYOd+5X1zELmwKb1+/umiZf7S4?=
 =?us-ascii?Q?oVYFKTT6i5kPYOYOJJQoPY6NO8OASJ0PzPMWx4Zj7+mQNyjv0kDs25giVlwa?=
 =?us-ascii?Q?6h6aRiEFZD1bR47//ck97HFI6aHGaVPJiwZeL+/aY8ypVm9QdlKL005jUKxY?=
 =?us-ascii?Q?FxVd78Djcfg5mz0NKgeoAHI82gZ8L2rTEssRENYTaClo+/WGukpz36Q2BeMg?=
 =?us-ascii?Q?HsxEvdPQlziSZbWfPZ8tu94ELiwagfoahnNjN/N0aPF6FVaQ10EYSuOL7bYx?=
 =?us-ascii?Q?Y8rDRRvL/kcoCOEikHCg5Nf6QYO/lCiOQUzOacJPrNTJ+pWaiqmxXZSPc7ZC?=
 =?us-ascii?Q?sT9Ad2aOlKkpg0kwPNMDNlvPPxaSvLcNTvWugWRqTBFJk7ViypWhNQjkfd8p?=
 =?us-ascii?Q?UoDdUxQx60H2V7rkrLBhWJ8+C99VehgiP47GRWRAwyT+A6mZ92fKxewaXhZ9?=
 =?us-ascii?Q?Gw5Q6RL2kxQPEovrT2JZTnMcsWDZ6dUzHnPsXkY4cFKgQUAUGnVoFehrKiIx?=
 =?us-ascii?Q?Q+7CyDLRKYL7RHmuBUrIi3WUnYk1m02YQOMpsx9APN097056QVFywAy+toet?=
 =?us-ascii?Q?Z8k9gjFNFlbrrBTqhoOO3eNzGGWyTLei7omj?=
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_0067_01DA8FDF.5AC54E50"
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: drs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1489.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b6bffb33-9c13-4a52-5902-08dc5e206703
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 14:20:43.9886
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c45439e3-f743-4e4b-879b-69b3aa8bf6a4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1049
X-Proofpoint-GUID: z4hD0U3Q7ZdfiA73FKbW81WZIurHP3qD
X-Proofpoint-ORIG-GUID: z4hD0U3Q7ZdfiA73FKbW81WZIurHP3qD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_10,2024-04-16_01,2023-05-22_02

------=_NextPart_000_0067_01DA8FDF.5AC54E50
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0068_01DA8FDF.5AC54E50"


------=_NextPart_001_0068_01DA8FDF.5AC54E50
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

 

We're trying to operate a USB gadget backed by the DWC3 core on an iMX8
processor, but we are seeing issues with performance.

 

As a comparison, utilizing iperf3 to benchmark, we are able to see
~230Mbit/s with an RNDIS gadget, and ~900Mbit/s with a hardware
USB-to-Ethernet peripheral.

 

Looking at the output of perf, we are seeing that with all of the gadget
drivers (RNDIS, UVC, ACM), there is significant time spent spinning in an
IRQ context that does not occur with the hardware peripheral. This seems
like it might be related to the interrupt handler as described here:
https://docs.kernel.org/usb/dwc3.html.

 

1.	We have not yet acquired technical documentation regarding the DWC3
module.  Do you have a list of the DWC3 commands that have high latency
(~1ms)?
2.	Do you believe that implementing a per endpoint IRQ framework will
resolve the large disparity in performance?  If not, do you have any insight
into what the root cause might be?

 

Thank you for your time and insight,

Jake Grossman


------=_NextPart_001_0068_01DA8FDF.5AC54E50
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:568074670;
	mso-list-type:hybrid;
	mso-list-template-ids:212388884 67698703 67698713 67698715 67698703 =
67698713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1
	{mso-list-id:1096756471;
	mso-list-template-ids:2094831862;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72" style=3D'word-wrap:break-word'><div =
class=3DWordSection1><p class=3DMsoNormal>Hello,<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>We&#8217;re =
trying to operate a USB gadget backed by the DWC3 core on an iMX8 =
processor, but we are seeing issues with performance.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>As a =
comparison, utilizing iperf3 to benchmark, we are able to see ~230Mbit/s =
with an RNDIS gadget, and ~900Mbit/s with a hardware USB-to-Ethernet =
peripheral.<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Looking at the output of perf, we are seeing that with =
all of the gadget drivers (RNDIS, UVC, ACM), there is significant time =
spent spinning in an IRQ context that does not occur with the hardware =
peripheral. This seems like it might be related to the interrupt handler =
as described here: <a =
href=3D"https://docs.kernel.org/usb/dwc3.html">https://docs.kernel.org/us=
b/dwc3.html</a>.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><ol style=3D'margin-top:0in' =
start=3D1 type=3D1><li class=3DMsoListParagraph =
style=3D'margin-left:0in;mso-list:l0 level1 lfo3'>We have not yet =
acquired technical documentation regarding the DWC3 module.&nbsp; Do you =
have a list of the DWC3 commands that have high latency =
(~1ms)?<o:p></o:p></li><li class=3DMsoListParagraph =
style=3D'margin-left:0in;mso-list:l0 level1 lfo3'>Do you believe that =
implementing a per endpoint IRQ framework will resolve the large =
disparity in performance?&nbsp; If not, do you have any insight into =
what the root cause might be?<o:p></o:p></li></ol><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Thank you =
for your time and insight,<o:p></o:p></p><p class=3DMsoNormal>Jake =
Grossman<o:p></o:p></p></div></body></html>
------=_NextPart_001_0068_01DA8FDF.5AC54E50--

------=_NextPart_000_0067_01DA8FDF.5AC54E50
Content-Type: application/pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIVijCCBDIw
ggMaoAMCAQICAQEwDQYJKoZIhvcNAQEFBQAwezELMAkGA1UEBhMCR0IxGzAZBgNVBAgMEkdyZWF0
ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBwwHU2FsZm9yZDEaMBgGA1UECgwRQ29tb2RvIENBIExpbWl0
ZWQxITAfBgNVBAMMGEFBQSBDZXJ0aWZpY2F0ZSBTZXJ2aWNlczAeFw0wNDAxMDEwMDAwMDBaFw0y
ODEyMzEyMzU5NTlaMHsxCzAJBgNVBAYTAkdCMRswGQYDVQQIDBJHcmVhdGVyIE1hbmNoZXN0ZXIx
EDAOBgNVBAcMB1NhbGZvcmQxGjAYBgNVBAoMEUNvbW9kbyBDQSBMaW1pdGVkMSEwHwYDVQQDDBhB
QUEgQ2VydGlmaWNhdGUgU2VydmljZXMwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC+
QJ30buHqdoccTUVEjr5GyIMGncEq/hgfjuQC+vOrXVCKFjELmgbQxXAizUktVGPMtm5oRgtT6stM
JMC8ck7q8RWu9FSaEgrDerIzYOLaiVXzIljz3tzP74OGooyUT59o8piQRoQnx3a/48w1LIteB2Rl
gsBIsKiR+WGfdiBQqJHHZrXreGIDVvCKGhPqMaMeoJn9OPb2JzJYbwf1a7j7FCuvt6rM1mNfc4za
BZmoOKjLF3g2UazpnvR4Oo3PD9lC4pgMqy+fDgHe75+ZSfEt36x0TRuYtUfF5SnR+ZAYx2KcvoPH
Jns+iiXHwN2d5jVoECCdj9je0sOEnA1e6C/JAgMBAAGjgcAwgb0wHQYDVR0OBBYEFKARCiM+lvEH
7OKvKe+CpX/QMKS0MA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MHsGA1UdHwR0MHIw
OKA2oDSGMmh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0FBQUNlcnRpZmljYXRlU2VydmljZXMuY3Js
MDagNKAyhjBodHRwOi8vY3JsLmNvbW9kby5uZXQvQUFBQ2VydGlmaWNhdGVTZXJ2aWNlcy5jcmww
DQYJKoZIhvcNAQEFBQADggEBAAhW/ALwm+j/pPrWe8ZEgM5PxMX2AFjMpra8FEloBHbo5u5d7AIP
YNaNUBhPJk4B4+awpe6/vHRUQb/9/BK4x09a9IlgBX9gtwVK8/bxwr/EuXSGti19a8zS80bdL8bg
asPDNAMsfZbdWsIOpwqZwQWLqwwv81w6z2w3VQmH3lNAbFjv/LarZW4E9hvcPOBaFcae2fFZSDAh
ZQNs7Okhc+ybA6HgN62gFRiP+roCzqcsqRATLNTlCCarIpdg+JBedNSimlO98qlo4KJuwtdssaMP
nr/raOdW8q7y4ys4OgmBtWuF174t7T8at7Jj4vViLILUagBBUPE5g5+V6TaWmG4wggWBMIIEaaAD
AgECAhA5ckQ6+SK3UdfTbBDdMTWVMA0GCSqGSIb3DQEBDAUAMHsxCzAJBgNVBAYTAkdCMRswGQYD
VQQIDBJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcMB1NhbGZvcmQxGjAYBgNVBAoMEUNvbW9k
byBDQSBMaW1pdGVkMSEwHwYDVQQDDBhBQUEgQ2VydGlmaWNhdGUgU2VydmljZXMwHhcNMTkwMzEy
MDAwMDAwWhcNMjgxMjMxMjM1OTU5WjCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJz
ZXkxFDASBgNVBAcTC0plcnNleSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsx
LjAsBgNVBAMTJVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwggIiMA0GCSqG
SIb3DQEBAQUAA4ICDwAwggIKAoICAQCAEmUXNg7D2wiz0KxXDXbtzSfTTK1Qg2HiqiBNCS1kCdzO
iZ/MPans9s/B3PHTsdZ7NygRK0faOca8Ohm0X6a9fZ2jY0K2dvKpOyuR+OJv0OwWIJAJPuLodMkY
tJHUYmTbf6MG8YgYapAiPLz+E/CHFHv25B+O1ORRxhFnRghRy4YUVD+8M/5+bJz/Fp0YvVGONaan
ZshyZ9shZrHUm3gDwFA66Mzw3LyeTP6vBZY1H1dat//O+T23LLb2VN3I5xI6Ta5MirdcmrS3ID3K
fyI0rn47aGYBROcBTkZTmzNg95S+UzeQc0PzMsNT79uq/nROacdrjGCT3sTHDN/hMq7MkztReJVn
i+49Vv4M0GkPGw/zJSZrM233bkf6c0Plfg6lZrEpfDKEY1WJxA3Bk1QwGROs0303p+tdOmw1XNtB
1xLaqUkL39iAigmTYo61Zs8liM2EuLE/pDkP2QKe6xJMlXzzawWpXhaDzLhn4ugTncxbgtNMs+1b
/97lc6wjOy0AvzVVdAlJ2ElYGn+SNuZRkg7zJn0cTRe8yexDJtC/QV9AqURE9JnnV4eeUB9XVKg+
/XRjL7FQZQnmWEIuQxpMtPAlR1n6BB6T1CZGSlCBst6+eLf8ZxXhyVeEHg9j1uliutZfVS7qXMYo
CAQlObgOK6nyTJccBz8NUvXt7y+CDwIDAQABo4HyMIHvMB8GA1UdIwQYMBaAFKARCiM+lvEH7OKv
Ke+CpX/QMKS0MB0GA1UdDgQWBBRTeb9aqitKz1SA4dibwJ3ysgNmyzAOBgNVHQ8BAf8EBAMCAYYw
DwYDVR0TAQH/BAUwAwEB/zARBgNVHSAECjAIMAYGBFUdIAAwQwYDVR0fBDwwOjA4oDagNIYyaHR0
cDovL2NybC5jb21vZG9jYS5jb20vQUFBQ2VydGlmaWNhdGVTZXJ2aWNlcy5jcmwwNAYIKwYBBQUH
AQEEKDAmMCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5jb20wDQYJKoZIhvcNAQEM
BQADggEBABiHUdx0IT2ciuAntzPQLszs8ObLXhHeIm+bdY6ecv7k1v6qH5yWLe8DSn6u9I1vcjxD
O8A/67jfXKqpxq7y/Njuo3tD9oY2fBTgzfT3P/7euLSK8JGW/v1DZH79zNIBoX19+BkZyUIrE79Y
i7qkomYEdoiRTgyJFM6iTckys7roFBq8cfFb8EELmAAKIgMQ5Qyx+c2SNxntO/HkOrb5RRMmda+7
qu8/e3c70sQCkT0ZANMXXDnbP3sYDUXNk4WWL13fWRZPP1G91UUYP+1KjugGYXQjFrUNUHMnREd/
EF2JKmuFMRTE6KlqTIC8anjPuH+OdnKZDJ3+15EIFqGjX5UwggW3MIIEn6ADAgECAhEAjU2dFvtc
9szPxJgDiJiFcjANBgkqhkiG9w0BAQsFADCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0
ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVk
MT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBF
bWFpbCBDQTAeFw0yMzA5MDUwMDAwMDBaFw0yNDA5MDQyMzU5NTlaMIGbMQswCQYDVQQGEwJVUzER
MA8GA1UECBMIVmlyZ2luaWExGzAZBgNVBAoTEkxlb25hcmRvIERSUywgSW5jLjEYMBYGA1UEYRMP
TlRSVVMrREUtNjkyMjExMSUwIwYJKoZIhvcNAQkBFhZqYWNvYi5ncm9zc21hbkBkcnMuY29tMRsw
GQYDVQQDExJMZW9uYXJkbyBEUlMsIEluYy4wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
AQC7KcZiiMWYzr6ZZYiUEGqpR3gJSiIu8mjcivGx4YXucr6REhjbO2ZfbOccQ4BUIPlqlW9BpkmN
fTCddVcTJYDm7GT4L57npRk4u0jtQ77aFn3IOFT2/S9gljCivf6DO9Sa+6B2IDcTb4Keu6VhDBrq
ZPca6WAI0amfh03kpK+5fARPdWIWqVnJrxvjm11/Yy0uh5witJa4FUsAklKOsKDx6yHi0ojJI0Bm
SPhzIGQP3bFiFCMqZUynocP0ra0Ev1u5T9azptJ2pi+Zq8dAKexNFP7vi6HdyAC71LTdr5NQA6ue
DJiYwJKcX6plPm/ax8t4f/Nl5HrzS01i8NEG9IPhAgMBAAGjggH3MIIB8zAfBgNVHSMEGDAWgBQJ
wPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUZID7pCEvTnVlfBzAbHrSc/LxmNYwDgYDVR0P
AQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMCMFAG
A1UdIARJMEcwOgYMKwYBBAGyMQECAQoDMCowKAYIKwYBBQUHAgEWHGh0dHBzOi8vc2VjdGlnby5j
b20vU01JTUVDUFMwCQYHZ4EMAQUCAjBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3JsLnNlY3Rp
Z28uY29tL1NlY3RpZ29SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWlsQ0EuY3Js
MIGKBggrBgEFBQcBAQR+MHwwVQYIKwYBBQUHMAKGSWh0dHA6Ly9jcnQuc2VjdGlnby5jb20vU2Vj
dGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcnQwIwYIKwYBBQUH
MAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMDkGA1UdEQQyMDCBFkphY29iLkdyb3NzbWFuQGRy
cy5jb22BFmphY29iLmdyb3NzbWFuQGRycy5jb20wDQYJKoZIhvcNAQELBQADggEBAIrzpC8fQxnh
eVtezIxk8ligojSk+SkhJXvThkpEUKtNEb9BgmEsEKYSBgkml4HRSmU1hC/Qcnd7z+MnZDLvAdhT
umjayv2uoJu8kCD+JVSDp0tbZOXIqzU/Rrg9rNToS2Mf6bQzMlZhpeEc6WT0CKOkHgdLcsEnB5FW
T7i02yaKqOfLDFC7fOYCDVBRUbPBTI7GWP64XMn4nAnnca2eoL0bRU4VcM67khlx6xyz+dxMjrl/
OIlM6Fk6fZkYMkiz/rrfRcymAdDAZUAuN/xlBJHSmfVQwnlDP3WjbsrWBc2nlobsuHIX283TRwAQ
5ASykuvJcGXj3myD21WoRJMwofEwggYQMIID+KADAgECAhBNlCwQ1DvglAnFgS06KwZPMA0GCSqG
SIb3DQEBDAUAMIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxML
SmVyc2V5IENpdHkxHjAcBgNVBAoTFVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNF
UlRydXN0IFJTQSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTAeFw0xODExMDIwMDAwMDBaFw0zMDEy
MzEyMzU5NTlaMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAw
DgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3Rp
Z28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkq
hkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyjztlApB/975Rrno1jvm2pK/KxBOqhq8gr2+JhwpKirS
zZxQgT9tlC7zl6hn1fXjSo5MqXUfItMltrMaXqcESJuK8dtK56NCSrq4iDKaKq9NxOXFmqXX2zN8
HHGjQ2b2Xv0v1L5Nk1MQPKA19xeWQcpGEGFUUd0kN+oHox+L9aV1rjfNiCj3bJk6kJaOPabPi250
3nn/ITX5e8WfPnGw4VuZ79Khj1YBrf24k5Ee1sLTHsLtpiK9OjG4iQRBdq6Z/TlVx/hGAez5h36b
BJMxqdHLpdwIUkTqT8se3ed0PewDch/8kHPo5fZl5u1B0ecpq/sDN/5sCG52Ds+QU5O5EwIDAQAB
o4IBZDCCAWAwHwYDVR0jBBgwFoAUU3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFAnA8vwL
2pTbX/4r36iZQs/J4K0AMA4GA1UdDwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1Ud
JQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBF
oEOgQYY/aHR0cDovL2NybC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25B
dXRob3JpdHkuY3JsMHYGCCsGAQUFBwEBBGowaDA/BggrBgEFBQcwAoYzaHR0cDovL2NydC51c2Vy
dHJ1c3QuY29tL1VTRVJUcnVzdFJTQUFkZFRydXN0Q0EuY3J0MCUGCCsGAQUFBzABhhlodHRwOi8v
b2NzcC51c2VydHJ1c3QuY29tMA0GCSqGSIb3DQEBDAUAA4ICAQBBRHUAqznCFfXejpVtMnFojADd
F9d6HBA4kMjjsb0XMZHztuOCtKF+xswhh2GqkW5JQrM8zVlU+A2VP72Ky2nlRA1GwmIPgou74TZ/
XTarHG8zdMSgaDrkVYzz1g3nIVO9IHk96VwsacIvBF8JfqIs+8aWH2PfSUrNxP6Ys7U0sZYx4rXD
6+cqFq/ZW5BUfClN/rhk2ddQXyn7kkmka2RQb9d90nmNHdgKrwfQ49mQ2hWQNDkJJIXwKjYA6VUR
/fZUFeCUisdDe/0ABLTI+jheXUV1eoYV7lNwNBKpeHdNuO6Aacb533JlfeUHxvBz9OfYWUiXu09s
MAviM11Q0DuMZ5760CdO2VnpsXP4KxaYIhvqPqUMWqRdWyn7crItNkZeroXaecG03i3mM7dkiPaC
kgocBg0EBYsbZDZ8bsG3a08LwEsL1Ygz3SBsyECa0waq4hOf/Z85F2w2ZpXfP+w8q4ifwO90SGZZ
V+HR/Jh6rEaVPDRF/CEGVqR1hiuQOZ1YL5ezMTX0ZSLwrymUE0pwi/KDaiYB15uswgeIAcA6JzPF
f9pLkAFFWs1QNyN++niFhsM47qodx/PL+5jR87myx5uYdBEQkkDc+lKB1Wct6ucXqm2EmsaQ0M95
QjTmy+rDWjkDYdw3Ms6mSWE3Bn7i5ZgtwCLXgAIe5W8mybM2JzGCBE0wggRJAgEBMIGsMIGWMQsw
CQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3Jk
MRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBB
dXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAjU2dFvtc9szPxJgDiJiFcjAJBgUr
DgMCGgUAoIICdTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNDA0
MTYxNDIwNDJaMCMGCSqGSIb3DQEJBDEWBBQ/B0JRCNwVolSzAEOCFufuvrAdPDCBkwYJKoZIhvcN
AQkPMYGFMIGCMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCgYIKoZIhvcNAwcwCwYJYIZIAWUD
BAECMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCGjALBglghkgBZQMEAgMw
CwYJYIZIAWUDBAICMAsGCWCGSAFlAwQCATCBvQYJKwYBBAGCNxAEMYGvMIGsMIGWMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAjU2dFvtc9szPxJgDiJiFcjCBvwYLKoZIhvcN
AQkQAgsxga+ggawwgZYxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIx
EDAOBgNVBAcTB1NhbGZvcmQxGDAWBgNVBAoTD1NlY3RpZ28gTGltaXRlZDE+MDwGA1UEAxM1U2Vj
dGlnbyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQCNTZ0W
+1z2zM/EmAOImIVyMA0GCSqGSIb3DQEBAQUABIIBAAZ+y3HY0i0MivE5IFPzxWY5P0aARe0juj0g
2KVuHZGK7YBWc1XByltSSgNSJ15Gn/kn/zrVYxhpXzC2xptA3LN3joQFMWYNX/d93UCZTx87k68q
/GAE+8kM7FND2AlAgfe5j6rN74KWItuKvd//sYsDXqAOUMFJDRyUJfgBVMlP8vkS5Lfu7mlqBxjH
BSSTo8hweduN4MaH65qj99GPVX5Mc48PQplyS48qhZZljpvZVp9iSXeOqaPtHvnVdEAAYHcXdqqV
KWzjD0JaNhCCral2T4pdrZUvCxq54JmfHCrTw7XKaHMr4UCu5vgkSnHDD/21epaVMD4ckRxWt2rh
sgkAAAAAAAA=

------=_NextPart_000_0067_01DA8FDF.5AC54E50--

