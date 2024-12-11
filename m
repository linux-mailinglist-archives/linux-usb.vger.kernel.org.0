Return-Path: <linux-usb+bounces-18345-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B23B89EC0D7
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 01:33:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A577C1641AE
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 00:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC98A175A5;
	Wed, 11 Dec 2024 00:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="e5wQ35Qh";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Lwu8E5UW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Sy1uFBK5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8552923BE
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 00:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877200; cv=fail; b=lwp7sGwQAK8jChUf17Izsr+HkM3wCvIQMNEZoHfThRuvZzhRVFt1R/ZqXI+JUxE0KvVv+nJSv4IfRslmG5TzADqtw5SpxlF5wPn+7tNp1q2hWx1wjtmyQ65J8njFBH9rIyOUzRzmAmlW1sacNpoC/Uc5TfToCYEH/UaCmbkiq4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877200; c=relaxed/simple;
	bh=8zZoTXW5qVtWkzoT61faOWYj4oVmiQdL7RLDuQjxHv0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UYF59uG4SZWHKyIDr4VCKsvaObYoZpTOK2OduilpfJ0NlemdqVsKkl2zzek+9jWgk+S7nYITSBGK7w4eNIrbIsrf090phIHV29VsHmCaKLUxkTk7E1F1RR3G2fDxWEZXiDjZgTsviiacersvX6KRjHFQVra/zqeI/UEAihNkFRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=e5wQ35Qh; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Lwu8E5UW; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Sy1uFBK5 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAM2wCo017317;
	Tue, 10 Dec 2024 16:33:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfptdkimsnps;
	 bh=/KtrrhzhXgyiX6znEeHqUF3DWfAsq7WvxwnQrAIRwto=; b=e5wQ35QhBVf9
	CYQG4hpvz7wbJ5nc+9WBHq9kssSu/xe5ecBa5+Ryqx7UMvK68z/O0nlxi3V9uhQR
	GpVEf53c1TTlMP8y+PLHyLgYVs4Fp8CAmfHqfHnvxLP1upEhJYwbXJAJz3eFyuAQ
	nRHwGbLMgiQPFJhuFOft8v12Wt3wHULyQ9DNhS147ZRVCGthAPjfGCqAIUCw3ISe
	eYMzvJafG6Zs1u1Hcw4kRoBk2B/GjpqsQDIXLZYe72vxBeRHwWUNkF7KWPlKrM1b
	I1s6F9rnfXhK8OW2AFlzOmg0whHpr2GtLgsxjy0l+YngBGf7fRumgcg9nW5s3qs7
	nVNL8e4NHw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 43cp60t12s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 16:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1733877191; bh=8zZoTXW5qVtWkzoT61faOWYj4oVmiQdL7RLDuQjxHv0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Lwu8E5UWLYgsknQMXX5aD4uCF/z5Abps3ThbQIQDElgG7tRQuD5aT4ixQqxpRVe3E
	 nJKIVYrnsKONutdldYms4MQrgZfBRENk9DGlzpf3uScJjtU642felpIRdSLZFTKtI+
	 kx2iCLy0v6zzZBzKFVkIWX/MSOh0XF6lI/7+LcfYX/ou4PcupMG2NnTj6rdEJmIYwD
	 xgoGdJqvyv+F5c79nou3Xbsv8QBycfAjNTd5hL8IpIEcdzNlK+pu/XLm2EkFpILoL0
	 RlBOIoWW5l5eP+jo2WdNe0VusUReTxwhWGi4j/353KBCw29WYbUcrZ8qjJziXQoLJz
	 EKxDHkdd63NVQ==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5D9D9401F2;
	Wed, 11 Dec 2024 00:33:11 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 3A013A009C;
	Wed, 11 Dec 2024 00:33:11 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Sy1uFBK5;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id E588F405AD;
	Wed, 11 Dec 2024 00:33:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2JCizYC9uc3GsRT4xm8al9IuG/x5/mmJNyt1q+9ALLKu7BURsRiBzNKHmc+YH99T6jh+wLUL5V5A1jNzDVx8GL3zDlfo77UiJSWdyr18Uuy/5aNxuJdGaTBxAxKaZ0aVdeLsNkGx+RWI1ZwCRrrUxDcIh3rsK/rgrpKQhEnvW+v6w63alAmvjdGU8iXPe2EYjzXiVx9euIWjsv0wlt3hX8c00TArm+qT3lvBZy8nqQ3KPvf3DsYmKDX0N8hDKJXt1VH6yuFvvlyQziC8ycjqNNLxHeeO4b4eYRlP1Q+WXBle6e2UH+hfJQK2jYy16GfXlUsA6Q+IlWDdHevktfQCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KtrrhzhXgyiX6znEeHqUF3DWfAsq7WvxwnQrAIRwto=;
 b=fkaDmfanBc/c4+gxaHW2cGOWh4S8a3ZhE6jYxagvatzIXddZEAYH65gJ6tCV2+pI4T1qxgEqvFsLB2ofSXMeFBDwoYkVuTFAyi58GPrYqw3u+PodMYqRILK56ihkjkVOCqsTlzY2fl5sjOyOIUkfr3YCejaYGSjT7mwRF2S/eyu72inx0fyj+yvGK7hToXbZY83nhC2ma1XrGGBtWkvKL3EagpFhu7Kkitl3MLuWVVwgUfIJleyFtUo5haUcPo0AiDpz9HdG5LnR4MpZAm7KNQ7QBHZYCPMjo+5cxxdhgz31C3HIlXuAgQ2F8rVA8y4Vh04UGZ80cAK2Zt+FCrItjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KtrrhzhXgyiX6znEeHqUF3DWfAsq7WvxwnQrAIRwto=;
 b=Sy1uFBK51KS4jDqCYiq7vZ4tO5BSm6xeaAHMlGXUZGKV7ObOZqM9G4IhMvbCMlc8zuDMaTU9yMEWXZggpKlJYM4KX9lnJfGkJd5eSWVhY5C/aMrrHX9pihdJCwwKwrI7FVkijDVjnYde7EsDOMl5hpp1ndAaEHbN5PTJUNe7y1E=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY8PR12MB7635.namprd12.prod.outlook.com (2603:10b6:930:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 00:33:07 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 00:33:07 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Homura Akemi
	<a1134123566@gmail.com>
Subject: [PATCH v3 16/28] usb: gadget: f_tcm: Execute command on write
 completion
Thread-Topic: [PATCH v3 16/28] usb: gadget: f_tcm: Execute command on write
 completion
Thread-Index: AQHbS2Q/RQy42qOpnkqk31dnR8JLyg==
Date: Wed, 11 Dec 2024 00:33:07 +0000
Message-ID:
 <9f6b1c6946cf49eeba0173e405678b9b7786636b.1733876548.git.Thinh.Nguyen@synopsys.com>
References: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY8PR12MB7635:EE_
x-ms-office365-filtering-correlation-id: 545654c3-055c-412f-f18c-08dd197b621e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?hisIVYS//C9ByeGyNZrMiDKJWeD0t5yQZg/OGlrULBoWc+Se+VSnENlkQT?=
 =?iso-8859-1?Q?5L4VKo+LgBvyiJ+iRitl3W0Z9gyAxtJy8sSKanLsSOyg4f6fG1LLm9mQvk?=
 =?iso-8859-1?Q?1Z1NpWfinPniP8CoXfbmz5/2GYAprteMkFKTCIv70z9+FKhcw1VArIr14Q?=
 =?iso-8859-1?Q?uv733KpurRqGxCY99pYB72ty6oEmX7nh/b7yIkNo52zlRjDjQOspm/ABnW?=
 =?iso-8859-1?Q?J3K/cf28H41OBmHkn+pyPAfaW+xFvlkGJjVWAh2CAGxI5c1tMYuvZYovQb?=
 =?iso-8859-1?Q?Y3ErJmp6G7ZQ56QVtjtmY21/AmD0XiVk2mC4aBZG028nlP51kRRrmQvt+S?=
 =?iso-8859-1?Q?zeBrKsDl+lGQo//PPHdCrmqFWEag+NErT9/qT9EjeegRP61VBgngJn7Q1E?=
 =?iso-8859-1?Q?5taMG4Zad3rNN5LeRDxXkHQHLUT85xSSP3bUGpWA1zFTZVnvMqj1z2fpfX?=
 =?iso-8859-1?Q?gAF30NqVSLqYeq97t8wktqLtxGYGy0/D5nC3SLsvsWO6ZIY00wEdVgHGYg?=
 =?iso-8859-1?Q?9KCi80dvHlnC/VHKPKgY40Nh2ye/A1kmbGbOhvT2gH6tB3Js2seHsXDXbu?=
 =?iso-8859-1?Q?DxRY+PftE6IlCi+Q0q1+5fCUOVooAd5Rv09skU0LrbTDzmjN83GIDsfGvk?=
 =?iso-8859-1?Q?oN9fg4qxpqzae3hbfs3m3hHL14P0aAQdnlDDuXfaLRxeAShv2I1KT+5XF/?=
 =?iso-8859-1?Q?dT3J69PE3v3kDCbmAknkgDLBkBKgYEgCYlKa6h7IZM+hdCpLlkEtdn+xYi?=
 =?iso-8859-1?Q?mJ/nfq+vEFLSd5sXnAdHLXTlNGQ7n8563bl1X/EC1H+hia9EezHR7f6R1h?=
 =?iso-8859-1?Q?j3M3hWvaOcS1cBGv1vtGUlGrCIHRA+L5GBXI6ynPwrgWMmD9IOkMc0NV6S?=
 =?iso-8859-1?Q?k8eeV7ILJd8WkF5kwf2udyyih6AhmTGEf0IzaSeF6RH2C26X68x75bmtvm?=
 =?iso-8859-1?Q?w/D+uj72oIbOxPgqgl7tRtkBqhQgpkCPRoh/W2Z6v2O0xxm7PVciU0VNGv?=
 =?iso-8859-1?Q?AKxOB8UXwd/iOUnEHVtYKU0FuXZd/hjN6gx8Vc62hKgayHbpkiLmxTMP1Q?=
 =?iso-8859-1?Q?pEehidiiy4bpN2qiKhnwNpb7LCIPe9UCcM4NiHrxqZ7NU+VgC43/g2Gp8B?=
 =?iso-8859-1?Q?ayh5hllg5FhQ6zGuowr3yzjilrvTtiyfU2rl/Z73lORHALIM1bSWZCUOq2?=
 =?iso-8859-1?Q?R9x8uvhUQj3Zyt1dNt+UB0kFFDcsnj7M/rlB2T9V6LvcmRSZPyx0b5KAEZ?=
 =?iso-8859-1?Q?u/3ytmDqL/ZJqm5751vjpSm4vnYbu9AYyiu2harQo6a4NffE9PazzH+dla?=
 =?iso-8859-1?Q?O0/pWKKpP9gjgLOOOpcAVZlr9tT7tDdbNaNzWN6CChClzdSjVx8B9xMY4j?=
 =?iso-8859-1?Q?KbFxZq3gTjWHXIJRLWC7MOad0VBg/SUScnORGoNVyDPGg6Lx1PuXi6O1YW?=
 =?iso-8859-1?Q?0YRxm6Xz80u9MIP7gQBeRPvYlJuQO/J3I9Hwtg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?YBJymfOaLxTihwF1ExjdCrkHwIKdtHCarRExBNZWxG+0MYlCdNgZG99usG?=
 =?iso-8859-1?Q?+PZyI1TBKRXpwZY572ivSK0F2f4wcqcS7Mki1sHMjDe+Y6saanc6DBk9uR?=
 =?iso-8859-1?Q?xYv5Hw5ICTqR8gpa8i8ucI+1ej89iPI1FDwakyHiXgga6H+h1rfG2wt2Ns?=
 =?iso-8859-1?Q?13YANyepfVmRKsALFjHoBhfeNlJu0+hU5rEPwhESHzGCBHPKJDmes0Achv?=
 =?iso-8859-1?Q?LTyW/I84pYTJAEYR3GIjEbmyc5yalyfx2qqYiOPQC7fzsPNXjAUX+mTjZM?=
 =?iso-8859-1?Q?2S0OnBrHQsvyxTiKmlKEuhHbZscxwNMwBPhlSaqZUX03p9aNOR0DztPZ0K?=
 =?iso-8859-1?Q?vVHI0wAHpMQpN1cv7hzSC/7igiaKMTpugJPqn2Fxo6V2khKuIO2FQzfpDX?=
 =?iso-8859-1?Q?aw7cbh4pxicp3AWA2EV7iFLNuWOzFyguLCFQ5ys2uZgcwpQ8ooTSe4pt4G?=
 =?iso-8859-1?Q?0VKm6Gg/MfdIlq3vBUv0d2A3wOKlkahiZhGG1xtiC+3mGXTVy7h5APj4jH?=
 =?iso-8859-1?Q?He06PmXSq7HNVyamdDButR/htlT+1cUtrgRv3m5Y9HUjlu1cFVZcQfugPe?=
 =?iso-8859-1?Q?GnQqXCyhw2NGXPE04unqE5T+ps9r5SwGMN3faR437V0SKuw3m2RjF0GAPe?=
 =?iso-8859-1?Q?v+PfjqecJptdGdULNA6mL992irWpNV2LDBpF4hjyqhFHDSwJ9N99sZe4BD?=
 =?iso-8859-1?Q?bfzZ4aVad1ANNAvI5eNw9OROqclNE6M86jSFR9c/DlyL1J0H6RHrIBqWZm?=
 =?iso-8859-1?Q?7wFwW1+8Xr4N6NAyNR2vKJPa+23GslkDzXcLVhWEtz1OX5/lw8GjFjDORC?=
 =?iso-8859-1?Q?YhhKHZ2J8iRIe8PAfD7+bH3o7qxCL7xgf5m4ezqsgTQjmUzz8eQc8C0DIA?=
 =?iso-8859-1?Q?huzhgblrtbtR6JoBfQUv+6iEXjozW8UY3Kox5NoMqTiMB0MU4lt5ElQ5Pn?=
 =?iso-8859-1?Q?Xcpk8w88oDP1uVlIqgqf8Ct461K5xMppD4nalD10bagQYLDQ6yaIVGtebE?=
 =?iso-8859-1?Q?Y3ZKbiNiJfFemG6hIRoh88MeolyNSuehKjmH/batEa6hpUMoOqhoa6a9FM?=
 =?iso-8859-1?Q?l17ZtvMY4U/EAjMoGvr6n19i4URiC4FL1jYCJpI/U3inYJ777oaH9JDeXd?=
 =?iso-8859-1?Q?SbrbbJZuFUG6jypOZQizstg7VDy2JM4ICdKwgblwd3iXIeLj4Gd94zCjHP?=
 =?iso-8859-1?Q?VAXc+xBvORr1CSgZabfZUtc5KUALe1g7Qht6ODdPLQWaB6LyEpH5S3gC3H?=
 =?iso-8859-1?Q?Y6/fwhGtj1w/YIovUH18uVvt90VMvVKYHs41O03rI8CE+WAVbvgVGEc9hl?=
 =?iso-8859-1?Q?niu4BTna3hnmSjAUGBJIORoXzemJCjNHYSXIoe4kdafRLZRw35PcWLqnfG?=
 =?iso-8859-1?Q?UhGGGgsmNl4/xNuDMgIQNjcNomQflshzaSb8QlmHqX9/nbCJA0188RTLQX?=
 =?iso-8859-1?Q?V3ivclv8sNmpa23RVMhflP7p+4pe4/uEMp/uR56XtOlBrXd1DdyzQcvjt/?=
 =?iso-8859-1?Q?4PoKdVlldUtE3FW07/n2NtN+mgknsM517WLsLup1vmkrUVyjhbjx/d+b3K?=
 =?iso-8859-1?Q?4oU3xGCF4fLJUWlhb+QK0Gj4fSd1f6Zel/DY6T7+54VEqqGpCqCBx6vO4X?=
 =?iso-8859-1?Q?swTouCB4K33PtXmOoZpaTN64tL41K7vtRK+2IlDig4hczR02Y8E25l9g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UQc8E+JpQ0ExWtWjReYRDLUuCx1hDUJiLHi/ycPi8d2BdETkQxj64FCugrgcsTzjhj7+5P/6yF+Y0ehm04zXrK/pg5hw9DpdB182QqN0B7byfnzFvyOyx1Tfu39/5Fs3A2xBkPf8aWG//HSj2T02HXvBZQutn9zK8XJhNvGVm/3GMQjS7BDbI7Qi7HN757yJtHwwgNWzYNfkdRQgntPe1zZWYWXR5Fney6t6MdAwxeW9DjBXucrdu5og4kwfHGW8iguf/4PZ51s2+R70wFv86YwfL67nL0d7qumkuiFX3bH2oGLaVNkwe6RH3em+/NqnhYoKRN3OzW+7pO3qLOAp9zqQwV6qk50Dur6c3DbD7W3NzXGZ9XnnA4MzaJftWBwX4Gr/iyhGWOl2wBP6zc8rgjvRzFkUwNl0fbHiHFCnkD9A4T4NfryfQcVVlTGWZnvClrJKp3HY7QC3uLq4C40f7+ZAZ9kO6U3Ai5QLEuzX4PJ8FIZmmsXRq4hzXvUc9hNgrHCsxaAogOdIaOj94548atK8NVoKMG9IRV/TSOnjO71+TYbI81vwE2qc8Irs2NQpcgnscD86glgHlHHu2hGGcjfIE3/xZDQ0p7GR87WxgNRXwjsVLbp0zXizwM26V2plH9xpPdonBkZuO/xqL50zRA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 545654c3-055c-412f-f18c-08dd197b621e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 00:33:07.3933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MzxEPfpzYQcZ6W6VJxEyu6WxOgUgjRfA9XWOlg5+BKBoSSb5+TcTxRav0vyAvFfv2n+z8+QROl9sQ5hS1r4dCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7635
X-Authority-Analysis: v=2.4 cv=Z9YWHGRA c=1 sm=1 tr=0 ts=6758ddc8 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RZcAm9yDv7YA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=yKPNG9v0iw303YuVllIA:9 a=wPNLvfGTeEIA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: NGeZPgzHUmAJXv_IHRuJtzwtsecrbDUS
X-Proofpoint-GUID: NGeZPgzHUmAJXv_IHRuJtzwtsecrbDUS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412110002

Don't just wait for the data write completion and execute the target
command. We need to verify if the request completed successfully and not
just sending invalid data. The verification is done in the write request
completion routine. Queue the same work of the command to execute the
target_execute_cmd() on data write.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/gadget/function/f_tcm.c | 39 +++++++++++++++++++++++------
 drivers/usb/gadget/function/tcm.h   |  4 ++-
 2 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/funct=
ion/f_tcm.c
index f43fa964d2b5..50c0703e8df6 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -244,10 +244,8 @@ static int usbg_prepare_w_request(struct usbg_cmd *, s=
truct usb_request *);
 static int bot_send_write_request(struct usbg_cmd *cmd)
 {
 	struct f_uas *fu =3D cmd->fu;
-	struct se_cmd *se_cmd =3D &cmd->se_cmd;
 	int ret;
=20
-	init_completion(&cmd->write_complete);
 	cmd->fu =3D fu;
=20
 	if (!cmd->data_len) {
@@ -262,8 +260,6 @@ static int bot_send_write_request(struct usbg_cmd *cmd)
 	if (ret)
 		pr_err("%s(%d)\n", __func__, __LINE__);
=20
-	wait_for_completion(&cmd->write_complete);
-	target_execute_cmd(se_cmd);
 cleanup:
 	return ret;
 }
@@ -664,7 +660,6 @@ static int uasp_send_write_request(struct usbg_cmd *cmd=
)
 	struct sense_iu *iu =3D &cmd->sense_iu;
 	int ret;
=20
-	init_completion(&cmd->write_complete);
 	cmd->fu =3D fu;
=20
 	iu->tag =3D cpu_to_be16(cmd->tag);
@@ -696,8 +691,6 @@ static int uasp_send_write_request(struct usbg_cmd *cmd=
)
 			pr_err("%s(%d)\n", __func__, __LINE__);
 	}
=20
-	wait_for_completion(&cmd->write_complete);
-	target_execute_cmd(se_cmd);
 cleanup:
 	return ret;
 }
@@ -922,6 +915,8 @@ static void usbg_data_write_cmpl(struct usb_ep *ep, str=
uct usb_request *req)
 	struct usbg_cmd *cmd =3D req->context;
 	struct se_cmd *se_cmd =3D &cmd->se_cmd;
=20
+	cmd->state =3D UASP_QUEUE_COMMAND;
+
 	if (req->status < 0) {
 		pr_err("%s() state %d transfer failed\n", __func__, cmd->state);
 		goto cleanup;
@@ -934,7 +929,8 @@ static void usbg_data_write_cmpl(struct usb_ep *ep, str=
uct usb_request *req)
 				se_cmd->data_length);
 	}
=20
-	complete(&cmd->write_complete);
+	cmd->flags |=3D USBG_CMD_PENDING_DATA_WRITE;
+	queue_work(cmd->fu->tpg->workqueue, &cmd->work);
 	return;
=20
 cleanup:
@@ -965,6 +961,8 @@ static int usbg_prepare_w_request(struct usbg_cmd *cmd,=
 struct usb_request *req)
 	req->complete =3D usbg_data_write_cmpl;
 	req->length =3D se_cmd->data_length;
 	req->context =3D cmd;
+
+	cmd->state =3D UASP_SEND_STATUS;
 	return 0;
 }
=20
@@ -1012,6 +1010,17 @@ static void usbg_cmd_work(struct work_struct *work)
 	struct usbg_tpg *tpg;
 	int dir, flags =3D (TARGET_SCF_UNKNOWN_SIZE | TARGET_SCF_ACK_KREF);
=20
+	/*
+	 * Note: each command will spawn its own process, and each stage of the
+	 * command is processed sequentially. Should this no longer be the case,
+	 * locking is needed.
+	 */
+	if (cmd->flags & USBG_CMD_PENDING_DATA_WRITE) {
+		target_execute_cmd(&cmd->se_cmd);
+		cmd->flags &=3D ~USBG_CMD_PENDING_DATA_WRITE;
+		return;
+	}
+
 	se_cmd =3D &cmd->se_cmd;
 	tpg =3D cmd->fu->tpg;
 	tv_nexus =3D tpg->tpg_nexus;
@@ -1028,6 +1037,7 @@ static void usbg_cmd_work(struct work_struct *work)
 	target_submit_cmd(se_cmd, tv_nexus->tvn_se_sess, cmd->cmd_buf,
 			  cmd->sense_iu.sense, cmd->unpacked_lun, 0,
 			  cmd->prio_attr, dir, flags);
+
 	return;
=20
 out:
@@ -1111,6 +1121,7 @@ static int usbg_submit_command(struct f_uas *fu, stru=
ct usb_request *req)
=20
 	cmd->unpacked_lun =3D scsilun_to_int(&cmd_iu->lun);
 	cmd->req =3D req;
+	cmd->flags =3D 0;
=20
 	INIT_WORK(&cmd->work, usbg_cmd_work);
 	queue_work(tpg->workqueue, &cmd->work);
@@ -1126,6 +1137,17 @@ static void bot_cmd_work(struct work_struct *work)
 	struct usbg_tpg *tpg;
 	int dir;
=20
+	/*
+	 * Note: each command will spawn its own process, and each stage of the
+	 * command is processed sequentially. Should this no longer be the case,
+	 * locking is needed.
+	 */
+	if (cmd->flags & USBG_CMD_PENDING_DATA_WRITE) {
+		target_execute_cmd(&cmd->se_cmd);
+		cmd->flags &=3D ~USBG_CMD_PENDING_DATA_WRITE;
+		return;
+	}
+
 	se_cmd =3D &cmd->se_cmd;
 	tpg =3D cmd->fu->tpg;
 	tv_nexus =3D tpg->tpg_nexus;
@@ -1190,6 +1212,7 @@ static int bot_submit_command(struct f_uas *fu,
 	cmd->is_read =3D cbw->Flags & US_BULK_FLAG_IN ? 1 : 0;
 	cmd->data_len =3D le32_to_cpu(cbw->DataTransferLength);
 	cmd->se_cmd.tag =3D le32_to_cpu(cmd->bot_tag);
+	cmd->flags =3D 0;
=20
 	INIT_WORK(&cmd->work, bot_cmd_work);
 	queue_work(tpg->workqueue, &cmd->work);
diff --git a/drivers/usb/gadget/function/tcm.h b/drivers/usb/gadget/functio=
n/tcm.h
index 9d614a7f2ac0..adf4c415140f 100644
--- a/drivers/usb/gadget/function/tcm.h
+++ b/drivers/usb/gadget/function/tcm.h
@@ -74,11 +74,13 @@ struct usbg_cmd {
 	struct se_cmd se_cmd;
 	void *data_buf; /* used if no sg support available */
 	struct f_uas *fu;
-	struct completion write_complete;
 	struct kref ref;
=20
 	struct usb_request *req;
=20
+	u32 flags;
+#define USBG_CMD_PENDING_DATA_WRITE	BIT(0)
+
 	/* UAS only */
 	u16 tag;
 	u16 prio_attr;
--=20
2.28.0

