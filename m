Return-Path: <linux-usb+bounces-2410-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1097DD932
	for <lists+linux-usb@lfdr.de>; Wed,  1 Nov 2023 00:19:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D90B5B20FCF
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 23:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3604427475;
	Tue, 31 Oct 2023 23:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="uvo4lZOK";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NKJ5b0HQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="FknqXUdV"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4ED1DFCD
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 23:19:05 +0000 (UTC)
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFF01B9
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 16:19:03 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39VM49MJ009377;
	Tue, 31 Oct 2023 16:18:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=Gw+IMe1Uq2f8nBtVa5smOZyfXwh3OBVZHA621f78O4M=;
 b=uvo4lZOKNVe/qXE0CLn65pnINCr80ZnWNk+O+f1h+BZG6agqE6U8jmW8dfH5Mw8DS1Xm
 ldFYKbQjq9s/2zVSeHRtxDeIFuOiveEaEgi18Qhgpo+I6sgh88QyAhWTAeVnB/mm7vQr
 0IFNrwFg0TRFeUNVvalQ2W5nRllsWA5BxpqBPb6x3egPfqd7a64slhhlOfp/mY03DtJh
 84JmQ3CMGieUXETSGtBJGYxOTzC1OHtAEJ3J/7UPEnmAREfYifV/1dXi0TrUGJmWdlc0
 Jcde6cC5xoQJopfiw1XPp4NhneuFI/91hnKf4rbLwVRck8Mg3oBsXzLjADb7hxT4FEPh uQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3u11an127x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Oct 2023 16:18:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1698794338; bh=Gw+IMe1Uq2f8nBtVa5smOZyfXwh3OBVZHA621f78O4M=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=NKJ5b0HQbWn8S4769xqQwMsdolAiSd3xqJDrgE3sfmxc9Cn54AIvqLoR2tNu8gXwM
	 U0bD12JFj+dsGANfbEQNK+A7NIsGkuKTqmD/cVHEmLxQUd3m3HTsEWgkH7hMJVQFiL
	 UPvV+HafqQfLpQKcRFSWm+ALelsUcf53QOrOSq25wYTv2bwxOJFtS0mtmFa+z2A+C7
	 7cQMoQp35DqDq4MXMQnimJ1IOHTK0jLivZ/kNNP+rjzzsqnBksBJ7Q7JnaSREC29Dp
	 E9tk+UAqRnHJBhOyt8DFn2hOMRoYShG493xYBs24SNFAYNsHS4jD5N9dIoqlYDCXuW
	 u+8sILuYDsAsQ==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9767340493;
	Tue, 31 Oct 2023 23:18:58 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 21D86A005C;
	Tue, 31 Oct 2023 23:18:56 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=FknqXUdV;
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0D4DD40078;
	Tue, 31 Oct 2023 23:18:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLX33R2jmTg+K/ssLL64SW7z3uCkdV1rvYGl82zAmQOk+xTwcco1qqDlUWE2VKH7EfLXz4fsB5KepVpK/+n+jRPsTKxQ4ORTxuRVggloyzX4TpgILCW7btc117bWEQIymrHM54PUTfXxkJj6iYYE7O+Zhtg+YvUmDiaYVTuDdt+Qw3nh30ObLUSCpTzZd5t5wCg6RE1ZRzeS2QFF6TXpfdab73JU+n4vMn2QPLioKptO/35bub0OmJZ5bMnxz6d7FthjVoRoStxJQMMeCjhWYAguSdBVT40XCQc3X1KfhTM9CqnAHGhxcO/k9EXxJau+dBXq21EJkXPe9N0JIG+pQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gw+IMe1Uq2f8nBtVa5smOZyfXwh3OBVZHA621f78O4M=;
 b=AZlDaJAeh/wnb7Nzi0P9vLF11BprUs1RFflGOkhvYXqSLT+Lwuw4gPFLxGB7mRByMHyK5tv0J3orpt2InWpsuuj2R4I3Feb/eCqUyZISy64RExJqPYmngLUZuRk0vfMOnOnUoxpI3pcB5j/lHEakPhB1r3UzRAPR4QOClVnDUe6c5ilfU8Xw4y5H9WZsNrpr0roNMKklSYotPzf6NJ/M6S7baKpLcA1Z164uFj9eJANi9n0Y5UPVkZACu/kfYB2J8j5kqpdiD36h+HwWZq4Su5ibUXuCdPL+SDdgCp2Hwy2GR5faOIt3n0je0YcxEIn581Z4ypoW/xs9PbpXqljc+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gw+IMe1Uq2f8nBtVa5smOZyfXwh3OBVZHA621f78O4M=;
 b=FknqXUdVC/eNXjbRB1qxTCudstPdq4WKWFD/rRwPgG2sJwlW3ig1Ei5BjjgWbrwKuHMxBohuU2CWzdepcqpFv9ne17HQZdH+S0NY6A/tgOV0iEcwMr3zTNfkxEL37mzj6lieWdWeGulA0j2xulTAo69jMYoKYOelwtel51QZu84=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SN7PR12MB7812.namprd12.prod.outlook.com (2603:10b6:806:329::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Tue, 31 Oct
 2023 23:18:51 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3fd1:e599:fe7b:e676]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3fd1:e599:fe7b:e676%6]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 23:18:51 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Michael Grzeschik <mgr@pengutronix.de>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: DWC3-Gadget: Flickering with ISOC Streaming (UVC) while
 multiplier set on Superspeed
Thread-Topic: DWC3-Gadget: Flickering with ISOC Streaming (UVC) while
 multiplier set on Superspeed
Thread-Index: 
 AQHZ3FhJKJr5gUY68kuSvYhFApjTyLAFL1EAgASHkoCAA0Y9AIAAbtcAgAEIgwCAAAESAIABbk8AgAAq0YCAUo72gIACStiA
Date: Tue, 31 Oct 2023 23:18:50 +0000
Message-ID: <20231031231841.dbhtrgqounu2rvgn@synopsys.com>
References: <20230831221242.GC20651@pengutronix.de>
 <20230901013118.iqpegkklfswdkoqc@synopsys.com>
 <ZPULnRSVgd5S3Cao@pengutronix.de>
 <20230906004144.4igr4akglxxqahc3@synopsys.com>
 <ZPgnwlOV1XP82kAY@pengutronix.de>
 <20230906230510.vi7d4wnjeiapgtyk@synopsys.com>
 <20230906230900.tmyhlxomrhsm3kna@synopsys.com>
 <ZPo51EUtBgH+qw44@pengutronix.de>
 <20230907233319.djsrstygwo6vr3yd@synopsys.com>
 <ZT+fCXtsa3s4CoGC@pengutronix.de>
In-Reply-To: <ZT+fCXtsa3s4CoGC@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SN7PR12MB7812:EE_
x-ms-office365-filtering-correlation-id: 97f98ac6-c90f-40cc-8718-08dbda67be71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 iLJVBvUmXTcw3xYlxcH1NHjPB2IVsjQfSZ6mHHQACULUYJ0aN96c5CghTyBZHZ2Fxd87PATOQ2jKlodMuwK1Og344zD3E36xXIC9ZPqEIy8j0Tq9A6nDBKxfuhSKQJI4i5l64dfragXq41COiC4BPkqw3HB3YxcO3GrYVeuJV7V3kM/Q0AG298jdE1auc7xhm52oF9TuGXPQ/ogaxb0JdiTUhHw/kA7CBbH4K5XOBoLjL/qYHRF+BvAOZJsu+yZTU+eL0d4GqlQ6dBy03RifbgzDDwwihDWunDvho3auk0n8JMnXPxfwa5mfIgvEFWieOoVaS8QYjZU5ng5tNV6c0yOYtdzLuAbW4utE31kEnQEmVkvdv+E1RWBG6IODsN49SSnZtouVUw4VpMIFzAmGxQreD7veolg2EoZsmkvRBSvUGpgDriWhC+64H2CUH8/y68pntz4sPu01t4IgqXC0FTaI0LerlRQgsBzOxZg8CW8lx9IcbXVt5YOaFrdhvmb9t6HnlH/xvhZtX171F7kzKYVC8FZ9kpeDyO47qWibhkJ2vB3BkyIGCPVnQNSL73VTov6KhRy9QzhyKqvwhM4t3/wgtlK5/l2awkPycSjW7bQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(39860400002)(366004)(376002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(8936002)(2906002)(8676002)(4326008)(5660300002)(71200400001)(478600001)(966005)(6486002)(41300700001)(76116006)(66476007)(66556008)(66946007)(316002)(66446008)(64756008)(54906003)(6916009)(6512007)(2616005)(1076003)(6506007)(26005)(83380400001)(38070700009)(36756003)(86362001)(122000001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OXlXblJITmRyRkNUNlV2VVo5NCtKbzZuMk5QcDB4TndHdE1XOVpyOXNtN2hO?=
 =?utf-8?B?MU40Um9WcVBPTDVZRmUxREtFQ3crQ2Ntd0llTUpGdVI4K213dTV5Z1cweU1O?=
 =?utf-8?B?ejlOYkQ0U09vVzFmNXBVbG93Tm5sOEtpRktCVGRmdEE3VlhqRXl5cm1kMzEx?=
 =?utf-8?B?NHkrSmV5dzZGbzBOUHBXUXJtdWpmRGNBdXBQU3A4dWxIWXo1RkZOb1BvQ2dP?=
 =?utf-8?B?c1RTYkRsUXdCK3NtbFBYajk2MFFMNDRrVzlVVjVKdEpvMURaU0hYT1g1bXJ1?=
 =?utf-8?B?d2g4V3VXLzlUZGxQWjRDMENZT1h2WHYzNjBvdWQ2bDVlQU1Dc1NWenFuNzJE?=
 =?utf-8?B?YWUrUUg0ZWY3LzI4T3JzenpPZUp1YjZYL3dMbGs2UlZHaFh5VnBBdzF5c1l1?=
 =?utf-8?B?RHhTS2hqeHFzN0ViL2F1cXFPak5aVVpEUE4ra2FVR1liVUZDdGxVMlUwYTdm?=
 =?utf-8?B?TkxLSjBxOWxOTVQwcUdyMGJIbGdOd3NSSGREaEFnc2FWTXQwS0luU0RRMVIx?=
 =?utf-8?B?OElnN3ovOFFkNkV4enlRSnZqQVpCTGExZHNDdGdvelFheXVmVE9DVkFzU05y?=
 =?utf-8?B?WDZkSUk5V1VmSHMwN2JzRy9BZzg4Y3ZOQlRCdUd0THR3TFRNa0VFRnBMQlFP?=
 =?utf-8?B?anRlSS9uUHFrZzBGL2NiWm9wTDdOaW9rczgyaGptS3JMemVhUkdrWWRMQzFV?=
 =?utf-8?B?SlEvbm16TE1XK21RTXRxTitKRGJVYnFoWU5rOGF3czdtNVZsWlJBaFFWd1Br?=
 =?utf-8?B?cTdaUXVqYmdsVnNTdGFSemxMM1hIYTJmbUZzNSs3RDhwMTBQSEUza2kwZVRr?=
 =?utf-8?B?NkxmeW5vRlFoQ0xZd1djQjJtT3paZFFmMXNDRU9XSzFMZkhBYnJXeHYrdzJu?=
 =?utf-8?B?TFNtZHBteEx3cGtwdkZYbGJ2ajNlbkZpQkxOaDl0eWovSGVhcHM4K0R2YnRM?=
 =?utf-8?B?d2xqVEZaYzM1ZmpjeTFGbjFuQ2xkTDRCVjZXTjJrdXZNVFUrbWgyeVMwUk8r?=
 =?utf-8?B?THozWGl6L2ozTWtpQmtlUmhJWUZsQkxoYjRESzEvTkhVZEkwU2JPdXFBdmow?=
 =?utf-8?B?aW1MbmlWb1hpdEJoVkcvTEhUeE5hUDhXU3d5cC9pZzZxK1YzcFcwZkFoTkgw?=
 =?utf-8?B?V0RocjZ6eWJwL1ZxT290TFcrZXFDMHA0TjlQbS9rTEtzcFRpeVl5MFNvbC9v?=
 =?utf-8?B?KzhTQ1dTYVRZRW5pUHVlRTFyVGY5V0dWN1M4OTVXU094Zjh4Nmw2di9rTGIx?=
 =?utf-8?B?ZTU3T2VtRFJlRXNRV0FSWkFvYk9DcDBWM3IzZ250N3B3dG5FVlAxSllqZ0h6?=
 =?utf-8?B?T2Jkakd2RjFjaE9MNjJPOExlQWFYQ0hoUjFWNW9VZ0ZHWVpieStSVlF3cVdY?=
 =?utf-8?B?VkJEYUxUREZwUTNURG43clVkSkYvSy9DUjZ4eUlPSFQ3V3pqNG5kZThMUGFq?=
 =?utf-8?B?b1paN2lZRVZZUVFkZDFsR2ozSWlPd0dQNHo1NE5sRkYvbWZNNzFjTC9lcHpU?=
 =?utf-8?B?WWdFeC9qNkNCbXFBMU1BWHBGK0lNbkRManZ6aVMyZjlyd2NrV0NZNFg5WU9s?=
 =?utf-8?B?Qk5telJ6ZjdxVG4xbFJKSFNGQ25XbExESGd1WG1rTGY3N05BemtjNG8vRG1s?=
 =?utf-8?B?dDA4b2Q0ZFhmQzlCYWFjWHZjSnYyZWdpekpSVHljaUJKUDVLR3FycThpVDJv?=
 =?utf-8?B?Vll3Q3ppMk00aWgrK3hxclN4WjBwQ1pLUkMxa2tSNlRXMWdubko1MHdnODJs?=
 =?utf-8?B?OUdXUXVQUmE2M1pIWFJjUUVYOC9WeWttVG10Zm5sVGJyMk1wZ0hSWGFBQ3JQ?=
 =?utf-8?B?Zi9iOXFCQUlRcGRYOTFWaWYrVFU3Z01NYjNtZ24rRi9mTFdpMUY3RVQyR0Nl?=
 =?utf-8?B?WGlDUjBKWjR1bWZRTTF4azVhYWhIVm9lSzNickhNQnRtRjN3SU9CdXdQbmkr?=
 =?utf-8?B?bmFYZnVmdDY5NXN0T3pRdE9hRitIVkZqNUhNeGdMWFpvNUJab3FMZStVVUp5?=
 =?utf-8?B?RksyZlhtYnhHYm5ycXgwall5MnhwSG5oNmpkQVl5VHlDTDdkVGVJSzF1b3k2?=
 =?utf-8?B?MVZUTG1leHFmTGU1SFJadXRHbjloU2pkcjV0dGZPU3ROS3RGV3Blb1p3V1lE?=
 =?utf-8?Q?a3jFZlBjZDLQE3RrcyyLoukDp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <93C7CC1A34854C4AB35F37CA1AA6F0EF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	rAtyZOcSfN3uJGjfHL8/Ohw2Soww2qpGVYQqLDfRCKPOcK9Co/fUh3vPA4Cn8lPpg3f0e/g1YJAvf/2qer4gSSL4YWdiFvfPZznhVzzOClWEpomXiqz4nmHTjUHHbnuNuBZq8/QxU7Y3arBqoLLF245XDMfXw+O0C0pIAzb9YApK/W58GTNydxn7lwpSSa8RLkUvQ5iUvYunSXU0U8vxYjZ2vWKl5Q540gpCeZ0VKCAa4SoLWAjDdsDHz5i5wJ0J9lZeIvd/Y6LVcdokAwcud1Xj9vNWKlWCgzALjy4fILoQzXr5UG7pJwdc6d3g7UBnb6wr8+WxG8RmQ4dl22uR2eiU66wnfl6bxIuEb88y47U9m+ImkT0dZ4rxHDhtfulKvM8fVd17Cuf6orR/bzBmrRHI/P0B03Dx6UEiPkfV+4cSJe6g4syJ0zlBzbHjeJg0MHoPE6c1EzX7XBZf/BaAgw3Jida9IlsQNuU0bmgQEQebUxZikUNLHTvIbS7P1Wd5lpf8mDG+7S2/EI+jufBpuDTNMOTEgW67VP36+cVFtwQzhyZr3YB8P+czyDaOBWk1k0GaMMSV+RjK1i6Qz5z8c8QiH1GTXPcaq/yHhDawimeCXBzqOEDyHyfQaIMAm1vPC5dgsj0zZYxhB0h9XLCX29lvZD0/wUGfw0tvPqxklJ5EKWmYtWRUGILhbHbM/NNqG01EpVIO9HvIiAL4EzzOIVmDqyijnMhW91o75GvC6HkivVcQPE37NxgEinQflT0e5Lh8hdRRnXAH7y3RSaWSZSOeGr18Wf2PKpi4obCA//LKgd/Nfc7mylxhy0hZsVqlIrCXG1VMcG67s27v0x9X+rPK3gFXC/yqXC7HaOJqll8=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f98ac6-c90f-40cc-8718-08dbda67be71
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 23:18:51.4632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CXxYMEjVV0x+njmGvrXj6kIPwG/u3y0SdPwnRcktAHQQZ0n2i13rqG0BydYvrvdG10B24t+oB6OoOJqaOkWdTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7812
X-Proofpoint-ORIG-GUID: TvQ56ZBNeenZ_VpI_NwPumhcquUDQIa5
X-Proofpoint-GUID: TvQ56ZBNeenZ_VpI_NwPumhcquUDQIa5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-31_10,2023-10-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 clxscore=1011 priorityscore=1501 spamscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2310310193

SGksDQoNCk9uIE1vbiwgT2N0IDMwLCAyMDIzLCBNaWNoYWVsIEdyemVzY2hpayB3cm90ZToNCj4g
SGkgVGhpbmgsDQo+IA0KPiBPbiBUaHUsIFNlcCAwNywgMjAyMyBhdCAxMTozMzoyNlBNICswMDAw
LCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gT24gVGh1LCBTZXAgMDcsIDIwMjMsIE1pY2hhZWwg
R3J6ZXNjaGlrIHdyb3RlOg0KPiA+ID4gT24gV2VkLCBTZXAgMDYsIDIwMjMgYXQgMTE6MDk6MDNQ
TSArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+ID4gPiBPbiBXZWQsIFNlcCAwNiwgMjAy
MywgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+ID4gPiA+IE9uIFdlZCwgU2VwIDA2LCAyMDIzLCBN
aWNoYWVsIEdyemVzY2hpayB3cm90ZToNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IDIpIEJ1
cnN0IHNldHRpbmcNCj4gPiA+ID4gPiA+ID4gCUkgdGhpbmsgdGhpcyBpcyBzZWxmLWV4cGxhaW5h
dG9yeS4gTGFyZ2UgZGF0YSByZXF1ZXN0IG5lZWRzDQo+ID4gPiA+ID4gPiA+IAloaWdoZXIgYnVy
c3QuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gSSB3aWxsIGhhdmUgdG8gZmluZCBvdXQgaWYg
dGhlIGJ1cnN0IHNldHRpbmcgY2FuIGJlIGNoYW5nZWQgb24gdGhlDQo+ID4gPiA+ID4gPiByazM1
Njggc29tZWhvdy4gVGhpcyBzb3VuZHMgdmVyeSBsaWtlbHkuDQo+ID4gPiA+ID4gPg0KPiA+ID4g
PiA+DQo+ID4gPiA+ID4gVGhlIGR3YzMgZHJpdmVyIGNoZWNrcyB0aGUgZW5kcG9pbnQgZGVzY3Jp
cHRvciBmcm9tIHRoZSBVVkMgZnVuY3Rpb24NCj4gPiA+ID4gPiBkcml2ZXIgdG8gc2V0dXAgdGhl
IGJ1cnN0LiBTbyBqdXN0IHNldHVwIHRoZSBtYXggMTYgYnVyc3RzIChvciAxNSBpbiB0aGUNCj4g
PiA+ID4gPiBkZXNjcmlwdG9yKS4gVGhlIGR3YzMgY29udHJvbGxlciBzdXBwb3J0cyB0aGF0LiBX
aGV0aGVyIHRoZSBob3N0IHdvdWxkDQo+ID4gPiA+ID4gZG8gMTYgYnVyc3RzIGlzIGFub3RoZXIg
dGhpbmcuIE5vdGUgdGhhdCB0aGVyZSdzIG5vICJtdWx0IiBzZXR0aW5nIGZvcg0KPiA+ID4gPiA+
IFN1cGVyU3BlZWQuDQo+ID4gPiA+DQo+ID4gPiA+IENsYXJpZmljYXRpb246IG5vIG11bHQgc2V0
dGluZyBmb3IgdGhlIGR3YzMgY29udHJvbGxlciB3aGVuIG9wZXJhdGUgaW4NCj4gPiA+ID4gU3Vw
ZXJTcGVlZC4NCj4gPiA+IA0KPiA+ID4gSSB3YXMgc29tZWhvdyBtaXN0YWtlbiBieSB0aGUgd29y
ZGluZyAiYnVyc3Qgc2V0dGluZyIgYW5kIHRob3VnaHQgb2YgdGhlDQo+ID4gPiBheGktYnVzIGJ1
cnN0IHNldHRpbmcgdG8gdGhlIGNvbnRyb2xsZXIgaW5zdGVhZCBvZiB0aGUgdXNiMyBtYXhidXJz
dA0KPiA+ID4gc2V0dGluZyBhcyB5b3UgbWVudCBhY3R1YWxseS4NCj4gPiANCj4gPiBJIHNlZS4g
WW91IHdlcmUgcmVmZXJyaW5nIHRvIHRoZSBheGktYnVzIGJ1cnN0LiBJZiB5b3VyIHBsYXRmb3Jt
IHRha2VzIGENCj4gPiBsb25nIHRpbWUgdG8gRE1BIG91dCB0aGUgZGF0YSwgaXQgd2lsbCBpbXBh
Y3QgdGhlIHBlcmZvcm1hbmNlIGFsc28uIFlvdQ0KPiA+IGNhbiBwbGF5IGFyb3VuZCB3aXRoIEdT
QlVTQ0ZHMCB0byBlbmFibGUvcmVzdHJpY3QgY2VydGFpbiBidXJzdCBzaXplcyB0bw0KPiA+IHNl
ZSBhbnkgaW1wcm92ZW1lbnQuIEhvd2V2ZXIsIEkgd291bGQgZXhwZWN0IHRoZSBkZWZhdWx0DQo+
ID4gY29yZUNvbmZpZ3VyYXRpb24gdmFsdWVzIHNob3VsZCBiZSBvcHRpbWFsIGZvciB5b3VyIHBs
YXRmb3JtIGRlc2lnbi4NCj4gDQo+IEkgd2FzIG5vdCBsdWNreSB3aXRoIHRoYXQgcGFyYW1ldGVy
cy4gVW5kZXIgaGVhdnkgbWVtb3J5IGxvYWQgdGhlDQo+IHN5c3RlbSBzdGlsbCBydW5zIGludG8g
ZmlmbyB1bmRlcnJ1bnMuDQo+IA0KPiA+ID4gSG93ZXZlci4gVGhpcyBpcyB1c2VmdWxsIGlucHV0
IGFueXdheS4gSSBuZXZlciB0aG91Z2h0IG9mIG1heGltaXppbmcgdGhlDQo+ID4gPiBidXJzdCBh
bmQgcGFja2FnZXNpemUgYW5kIGxldCB0aGUgaG9zdCBzaWRlIG1ha2UgdGhlIGRlY2lzaW9uLg0K
PiA+ID4gQnV0IHdlIHdpbGwgcHJvYmFibHkgd2lsbCBlYXQgdXAgYSBsb3Qgb2YgdXNiIGJhbmR3
aWR0aCBieSBkb2luZyBzby4NCj4gPiA+IA0KPiA+ID4gQmVmb3JlIHlvdXIgbm90ZSBJIHdhcyBz
b21laG93IG1pc3Rha2VuIHRoYXQgdGhlIG1heHBhY2tldCBhbmQgbWF4YnVyc3QNCj4gPiA+IHNp
emUgaGFkIHRvIGNvcnJlbGF0ZSB3aXRoIHRoZSBhY3R1YWxseSB0cmFuc2ZlcmVkIGRhdGEgd2Ug
cXVldWUgaW50bw0KPiA+ID4gdGhlIGhhcmR3YXJlIHBlciByZXF1ZXN0Lg0KPiA+IA0KPiA+IFJp
Z2h0LiBUaGUgbWF4cGFja2V0LCBtYXhidXJzdCwgYW5kIG11bHQgbGltaXQgdGhlIG1heCByZXF1
ZXN0IGRhdGENCj4gPiBsZW5ndGggeW91IGNhbiBzZW5kLg0KPiANCj4gPiA+ID4gPiBJIHJlY2Fs
bCB0aGF0IFVWQyB0cmllcyB0byBwYWNrIGEgbG90IG9mIGRhdGEgaW4gYSBzaW5nbGUgcmVxdWVz
dC4gQWxsDQo+ID4gPiA+ID4gdGhlIHdoaWxlIHNvbWUgaW50ZXJ2YWxzIGl0IHdvdWxkIHNlbmQg
MC1sZW5ndGggZGF0YSBiZWNhdXNlIG9mIGlkbGUNCj4gPiA+ID4gPiB0aW1lLiBJIHdvdWxkIHNw
cmVhZCB0byBtb3JlIHJlcXVlc3RzIHdpdGggYSBsaXR0bGUgbGVzcyBkYXRhIHRvIGdpdmUNCj4g
PiA+ID4gPiB0aGUgaG9zdCBhIGxpdHRsZSBtb3JlIGJyZWF0aGluZyByb29tIGFuZCBiYW5kd2lk
dGguDQo+ID4gPiANCj4gPiA+IFRoZSBoaWdoZXIgbG9hZCBwZXIgcmVxdWVzdCBpcyBkdWUgdG8g
dGhlIGZhY3QgdGhhdCB0aGUgdXZjIGdhZGdldCBpcw0KPiA+ID4gdXNpbmcgdGhlIG11bHRpcGxp
ZXIsIG1heHBhY2tldCBhbmQgbWF4YnVyc3QgcGFyYW1ldGVycyBmb3IgdGhlIHNpemUNCj4gPiA+
IGNhbGN1bGF0aW9uIG9mIHRoZSByZXF1ZXN0Lg0KPiA+ID4gDQo+ID4gPiBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJl
ZS9kcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vdXZjX3ZpZGVvLmMjbjMzMQ0KPiA+ID4gDQo+
ID4gPiBTaW5jZSBpdCBpcyBjbGVhciBub3cgdGhhdCB0aG9zZSBwYXJhbWV0ZXJzIGFyZSBub3Qg
bmVjZXNzYXJ5IGNvdXBsZWQNCj4gPiA+IGl0IG1ha2VzIHRvdGFsIHNlbnNlIHRvIHNwbGl0IHRo
ZSByZXF1ZXN0cyBpbnRvIHNtYWxsZXIgY2h1bmtzLg0KPiA+ID4gDQo+ID4gDQo+ID4gT2suDQo+
IA0KPiBTbyBjaGFuZ2luZyB0aGUgcmVxX3NpemUgdG8gc21hbGxlciBjaHVua3MgaW5kZWVkIGRp
ZCBpbmNyZWFzZSB0aGUNCj4gc3RhYmlsaXR5LiBUaGUgbWFpbiBtaXN1bmRlcnN0YW5kaW5nIGhl
cmUgd2FzIHRoYXQgdGhlIHRoYXQgbm90IGV2ZXJ5DQo+IHJlcXVlc3QgY29ycmVzcG9uZHMgd2l0
aCB0aGUgdGltZXNsb3Qgb2Ygb25lIGludGVydmFsLg0KPiANCj4gQWZ0ZXIgcmVhZGluZyB0aGlz
IHRocmVhZCBvbmNlIGFnYWluLCBpdCBpcyBjbGVhciB0aGF0IHRoaXMgaXMgbm90IHRoZQ0KPiBj
YXNlIGFuZCB3ZSBzdGlsbCBmaW5kIGFsbCBwb3NzaWJsZSBiYW5kd2lkdGggYnkgZGVjcmVhc2lu
ZyB0aGUgc2l6ZSBvZg0KPiBlYWNoIHJlcXVlc3QuDQoNClRoYXQncyByaWdodC4NCg0KPiANCj4g
VGhlIG1haW4gdGFrZXdheSB3YXMgdGhhdCB3aXRoIHRoZSBoYXJkd2FyZSB3aWxsIGNhY2hlIHNl
dmVyYWwNCj4gdHJicyBpbnRvIHRoZSBxdWV1ZS4gU28gd2hlbiB0aGVyZSBhcmUgbm90IGVub3Vn
aCB0cmJzIGF2YWlsYWJsZQ0KPiBiZWNhdXNlIHRoZXkgYXJlIGp1c3QgdG8gYmlnLCB0aGUgZmlm
byBydW5zIGludG8gdW5kZXJydW5zLg0KPiANCj4gSW4gb3VyIGNhc2Ugd2l0aCB0aGUgaGlnaCBt
ZW1vcnkgYmFuZHdpZHRoIHVzYWdlLCB0aGUgdHJicyBjb3VsZA0KPiBwcm9iYWJseSBub3QgZXZl
biByZWFkIG91dCB0aGF0IGZldyB0cmJzIGluIHRpbWUgYW5kIGRpZCB0cmlnZ2VyDQo+IHRoZSBj
YXNlIGVhcmxpZXIuDQo+IA0KPiBTbyB3aXRoIHNtYWxsZXIgcmVxdWVzdHMgdGhlIGZpZm8gd2ls
bCBiZSBmaWxsZWQgd2l0aCBtb3JlIHNtYWxsZXINCj4gdHJicyBhbmQgZG9lcyBub3QgcnVuIG91
dCB0aGF0IGZhc3QsIHNpbmNlIG1vcmUgdHJicyBhcmUgY2FjaGVkIHRvDQo+IGJlZ2luIHdpdGgu
DQo+IA0KPiBPbmUgbW9yZSBxdWVzdGlvbjogRG9lcyB0aGUgY2FjaGluZyBhbW91bnQgb2YgdGhl
IGZpZm8gZGlyZWN0bHkNCj4gY29ycmVsYXRlIHdpdGggdGhlIGVuZHBvaW50IHNldHRpbmcgaW4g
RFdDM19ERVBDRkdfQlVSU1RfU0laRSB0aGVuPw0KPiANCg0KTm8uIFRoZSBjYWNoZSBJIHdhcyBy
ZWZlcnJpbmcgdG8gaXMgdGhlIGNhY2hlIGZvciBUUkJzLCBhbmQgdGhlIGNhY2hpbmcNCm9mIFRS
QnMgaXMgbm90IHJlbGF0ZWQgdG8gRFdDM19ERVBDRkdfQlVSU1RfU0laRS4NCg0KQlIsDQpUaGlu
aA==

