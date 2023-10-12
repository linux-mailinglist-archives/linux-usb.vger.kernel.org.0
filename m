Return-Path: <linux-usb+bounces-1529-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 340A37C7628
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 20:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11B1B1C210F7
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 18:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEFDC36B11;
	Thu, 12 Oct 2023 18:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EMgtCUCs";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="K6Vq75GH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="p1J5/MjD"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072F526288;
	Thu, 12 Oct 2023 18:50:44 +0000 (UTC)
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C919883;
	Thu, 12 Oct 2023 11:50:40 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39CHQsXZ022252;
	Thu, 12 Oct 2023 11:50:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=3sAGT/6rFvSnQjD3HsabT3eIFG+LGEZ4FV504og23AI=;
 b=EMgtCUCsz+CWqyxPEjM/KzSFbIRjr30tenJvobBIdlvQBDNZU1OzxgBhwqsKUt0GgEQ5
 AiGO3wyGmSrv3hLjBBanEyX36i3LFR9wzZRow3PP9rX/pcgEu1krURPnzVu6grW8tctL
 P8t0kfTlPpOQd4G+nBy86SUS3hlfJJRRw4vQyktBeJGhM8CT8wDXMV9ZSLO+ghjgYTSJ
 SwjyVCAOse9QcOTJV2GtqNBm/xe9IRa8/RY19QJgDfU+Oc0oyjcy1N7Inz770NqmIjW6
 w5QYf3M0Reo5x7t8D0DHri0ueH69K6J832UUBJm17J44PSebCWYuZS+ILndqcLK+XWkm Cw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3tkh3shxsc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 11:50:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1697136623; bh=3sAGT/6rFvSnQjD3HsabT3eIFG+LGEZ4FV504og23AI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=K6Vq75GHmCPB+Y/b6YujeEK0jsucwr+EnJKSLqXzL7QHUTF1Rn10BHTVjEGnsxq8B
	 6Ml4yMf8c83OyIpmaIVgrfTj/85hmZWolQKc4kSij8NKGOX1ObUANS+lYkLY6V9f97
	 2csM8sL5WbNfWVaRgrPs7EXxKuVAQv94S5ZqCa9Nl6kPVtHxXyTIMN2/YMWncS5ksl
	 fsTl1zJOmPFAa//NfInxLmzohsuqJlHIw99EzAVBhSsr0bss/M5kzrvJP+qp68FWVx
	 BrT2Op+50c5i4n6iem6R4tlhYcMw3GosmIBeqetp9XSy71EOpr+UYL6TwZGOWml4Jc
	 Ykz5lPPkffa4Q==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3225E404D0;
	Thu, 12 Oct 2023 18:50:23 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 90EA5A0081;
	Thu, 12 Oct 2023 18:50:22 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=p1J5/MjD;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id B1F3440606;
	Thu, 12 Oct 2023 18:50:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMZNY/rQHyQ6fz2Ynfs2SGl0VQ0qm4qb0uLH+wS71odO/xHyHGaQWSNZMCtGW+tgovRPVztomFEAWr8dEwvkZbYW3mrFGD25Rfhzez9sqzili4FbQNAmTT4Se7WmRU6iXQaI+vs1XJkX2qZ1qtZmPeTL+xd6spG6iKy1l1vrRROt6kBe5LnT9GfbghYd834Up4RDmIhXfYQ6JD1JAXq24hIV65cZGTKnk2Dtk+9v3armKkIi2TGaNlVyMfFsn0ILb1dpteFul7vF7TqL4Ctl330iNSjcZjx74h4IWWMUEw5eBcjIgLAgMSqWR35YXauaZyKQ8F3vu6vrwHek7lDF+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3sAGT/6rFvSnQjD3HsabT3eIFG+LGEZ4FV504og23AI=;
 b=cb8WYw6rcUG5tt4beAhPlCqCgzv/DreHTfErCgfBEy4/6/guMtGjlAM8d7Eb/bJ6vGSgwwPJavoipuumb121hoMtL6slUvHwyZo7v+28yxvY+EyW1mJg/+w3ui4LkKRsaOmV+d4QlVBWzRZI6FdZUCz9vLXLZMe9B5/Er1auB8voXu6WV4vbWh2ACnaIXaQa3AjRP2PD2WtXYioHhMpfZQ2ITxd0YPNbPs06z8cbLpcLcBFojxTAvM60xrqlZgl1WLZGr5VA//gZVKO/0xaksU7DHytwgjlc5iQNF8LE4Ry+KQ8u1MIPS0JQrEhpjSUPlMvVN7kIN+Pj7yJ6cL1Fzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3sAGT/6rFvSnQjD3HsabT3eIFG+LGEZ4FV504og23AI=;
 b=p1J5/MjDJtj41Gafa/s7qy76IRoiVnFsf+JcVaXUp6Us0nbQEPrD9JjsyyQx5LcQdZkmhwxYX+lgP8iyOyOqVrGSvoOkqJtikF4QC6mykD/HQ6zEX5mvojLpYJ5cuwrJ9BkpAyb+R9hboH7imXvOu6PYvXUJWStysYaOTwB/7pQ=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DS7PR12MB6189.namprd12.prod.outlook.com (2603:10b6:8:9a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 18:50:17 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b398:9c9e:3818:b7a2]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b398:9c9e:3818:b7a2%6]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 18:50:15 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Jayant Chowdhary <jchowdhary@google.com>
CC: Greg KH <gregkh@linuxfoundation.org>, "corbet@lwn.net" <corbet@lwn.net>,
        "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
        "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "etalvala@google.com" <etalvala@google.com>,
        "arakesh@google.com"
	<arakesh@google.com>
Subject: Re: uvc gadget: Making upper bound of number of usb requests
 allocated configurable through configfs
Thread-Topic: uvc gadget: Making upper bound of number of usb requests
 allocated configurable through configfs
Thread-Index: AQHZ+KEKBuYujouRjEW8XTDGwXvQc7A/ZBGAgAKsIACABHhTAA==
Date: Thu, 12 Oct 2023 18:50:15 +0000
Message-ID: <20231012184954.ech7kfpqjkunq6eu@synopsys.com>
References: <edad1597-48da-49d2-a089-da2487cac889@google.com>
 <2023100834-statistic-richly-49ef@gregkh>
 <7ed46b3c-bd42-468e-b28d-860dc8a6c7e6@google.com>
In-Reply-To: <7ed46b3c-bd42-468e-b28d-860dc8a6c7e6@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|DS7PR12MB6189:EE_
x-ms-office365-filtering-correlation-id: 5aad9678-99b3-4335-c5f6-08dbcb5412b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 XCHpXj1n5E9Z19XZMhdcFwzrhyPz9eYbpsBGZZXxnp2+IqbCupkxwHDpWAq+kE+yLdLLBT7tsasKaTN9gpCP1j5L7xJxCgXA9VGJeHqd1BaoBuhnF0Fz7+uYDSelYue7L/dtJpyyrDSalrKQyABb7FueQ66wH5l0wzJf9P9kq8kr5kOBevnHseMg3J/IVHIhH/xz9skFTZXz/PASUPAHEeJRRAz2rJTo2WUKP4dfb+xDcseSjHKapvKNqAHWO5HYklsa3DCIF7j6qURsFwZ0DxBne9X9X+RK2BtYSMl4K67xCf3/Wh5LFkwmBXCihhH+Ael7rhFt6F0RPcF2HGxcQ5phl5154+ER1JSwmAaC6WTlMzxxClDFdczBWYw4PBqoPlURonsFZUZJh0NwoBwBvNiN5wXkV3TNqreHemybsSPz0iFn/YRsdD6Sez224vNHOHQB27DbV/IytxJVDatifaDmlujisp8ycA7nK3lziLckV1cdfNG28UdCwlkV/a0bj8+FiggsrlVC8RQfJ67OW6VG4MNF8YJ3w+fPTTe8pvmBd8EqErJ5ijmON7M8CW4uO4b9CgWoDh4F24VEM6LZZ1XOvMSnnJicPZ80KycVr9U=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(396003)(366004)(376002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(122000001)(38070700005)(38100700002)(6512007)(1076003)(2616005)(8936002)(478600001)(86362001)(966005)(5660300002)(26005)(8676002)(4326008)(6486002)(7416002)(2906002)(71200400001)(316002)(6916009)(36756003)(41300700001)(54906003)(64756008)(66476007)(66446008)(66556008)(76116006)(66946007)(6506007)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Q3lsamRZeVR1UnorbDA5TTVuUGU1N29uaTA2d3BQRElib3pOSU93MkJaR25G?=
 =?utf-8?B?bEI2aEpWcnQzN3NkSjIwZ0s4NTF1aGQyVW1vSC9rZU1Ic254VTJxREpCc2RF?=
 =?utf-8?B?UU4wZzdUM040czkwejRJcjRyS3craGNYQVFncGxGOUxFQTZqSzNMV2tEMnU1?=
 =?utf-8?B?eU8yVXNSTCsyVVdsSDk2VUtKV0xSNkJTN1dlM044aU9vcmlnanBYWjVINGVW?=
 =?utf-8?B?aTJtQTVObGw0cWwxSWxPSS9haGtpV3B2b0lqOGExU2J1T3pyckJKUlhEUzlG?=
 =?utf-8?B?VkJPcmlLY3c5VXJLWnFFWGF3YUpLWnhhelBXSEdLd0p4WlFTZWdwSlhwQUY1?=
 =?utf-8?B?bmtOS1phNW9yWWgwTDdwZzA3dzA1Z0ZRL3JHUTNkd1lpNHF1QVlobzJhOUMx?=
 =?utf-8?B?b1hpcHZFeTJsRDd1cnVrcGU5L3o3V1NTR0crazhuUGh0T3cwbnB2ZXpCeEtK?=
 =?utf-8?B?N3c0V1BiU1NOa1VWU2tudVU2bjFWemtUUmtJTVBKQXRMakUxMHZRcVZxNzlj?=
 =?utf-8?B?MDF3OWxUSjFCQUplcFRqUTd6em5heGdQejFCeGpFMW82TDN4N2VTUFh6aEVa?=
 =?utf-8?B?VEZzY3puVWVMemlBYW1RRGI3UmlML0JQRThFdXFVVGJERjZkOGxvV0tvWDBl?=
 =?utf-8?B?N25SRlA2MHg5dVRFWjV0dExHaWZoWDFUVk44K3NSaTJHanR3ZWVvZ3lwTTFv?=
 =?utf-8?B?THhSbE5obk5hMW9tZVRuSmFuSVZhWTVPZU5YRnl3dVJaeE9iNjkvZHFLeTRz?=
 =?utf-8?B?VXlRZTJMTUlCOWRnQVZTNk5rTEo1VFJVUVBPLzl3VnBtRm14UkhJemVVNVps?=
 =?utf-8?B?U2FqZ0FDTGVkK0ZhNXpyWTRTKzYyU0kzWEZObTRZQXU1eGI3c2pBS0RYTE8v?=
 =?utf-8?B?VXhTRDlxUnNyOVA3UzcxQm9HdGtVUWVQUFJlOXYyaXZKTHhuekZHWUswcnd0?=
 =?utf-8?B?SlhhNE1SQ2xvMjcxSzBkZDBKZmZzZXFzbm8yNU04aUtPbXFzVWRxdjZuc29o?=
 =?utf-8?B?T2IyMzRLMGd1ZU1mMDRHdkRtMTdvWXRFMkkyVVdvVHMzTXhwa2hLWTF5R25Z?=
 =?utf-8?B?anR0T1ZKSzFQbE5CSGNrN0x0clpBMVA4TDFDcENZV2YvQTFjUy9WZUo5VnMy?=
 =?utf-8?B?bisvSWtaeTRKVDhMc2dSNW4zY1U4cVd2bWRGZUsxd2xnNGl6MDdrZ0s1OVMx?=
 =?utf-8?B?RlNWczIxV2VyRTNQQ3ZPbzVtVmJuMHMvMEZOMEhMaGdBYWJIUXRBWmI1dmhY?=
 =?utf-8?B?QjNQaVkvbmg1NU9oTjJiT1F6Mm80eFJkc3JPWUYrR3hVNk9lU2xOeGhxa1pi?=
 =?utf-8?B?a3BsSFlXalBob0xJMXZkV0xzVjBHYklHd2QxazI3dld6cjk5YzBMclY4bkgr?=
 =?utf-8?B?U3dNQ0FnMXZRTmtjeitERENhRU0vSXliOTNMdysvZHZRc1psR2V3REZCd1k3?=
 =?utf-8?B?Ylh3TU5RYzZLYWhtZEF1T2t2S2F1OTBQdGRTcEppZUw3NEtPM3hhNVBpZmZx?=
 =?utf-8?B?SHB3MlNTMDgyWWFZK3hYVHZQOGZsRHVsU1Z2WWM5TFFDK1M2UUdJSmdRaVJE?=
 =?utf-8?B?MFhTM3dGblIrUDh5SVlCampjaDJzTzNDam9vSkF6d3hBd2VkL29BcXpCbXJB?=
 =?utf-8?B?UGR5UUZlTGxsZWVhZmhxK3BuL0pQV0NjdHR6blBHWUJBbnErSE5GMTZLK2M1?=
 =?utf-8?B?THhTMGQ5Szk3T3lveTh2bkJ0cEJIMFVOVmQ4eEJqblRRTTd6SXJqZ2FrNThi?=
 =?utf-8?B?M21JSXJLWkZOUTBsWXZPUG5SNndrNzBEbTR5UEVIKzRraHU1d1hDMC9hY2RI?=
 =?utf-8?B?OUFPRG00NktWbU03Q1hGT0RuWElpdFE5c0xUMW5hcGhubThrOVE4NVlIT1FU?=
 =?utf-8?B?ZU1VcDNndjg4ZEVQa1VMdkRyS1k1QmErbUh4Vm5UbmNHaWNyaXl0cHVpOVV5?=
 =?utf-8?B?UjVpMms3ZG1pTXY4Y2kvSW9MdmZUMEpwUFFFS2t4TWVLTWRuMzZZb29zNUI1?=
 =?utf-8?B?Vms5UE96T0JxM0EyZDVFK0dqOEZQYisrNDFTZzNhTDVNM2VGMGJsQ2tPUkNS?=
 =?utf-8?B?ZW1zc2IvVm1sRjFZQWFvbTFlUTFCQmRoOUtUNktmRXk3cDlJcUg0SXVDL1M2?=
 =?utf-8?B?MHlkOW4wMmNxSW10WWpKeHZjaWh5WmxGbkFOaDZ4UCtSZjRyckNWRUZPUWpt?=
 =?utf-8?B?dkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5ADE8DDA039EC548B5241C44E7BED343@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	=?utf-8?B?OVN1WkRMYWpkUnhIZEJsZ3AvVEdoQThmWE9BS3ByeUZXUUhzUHpuQnlKYjlm?=
 =?utf-8?B?aDJsTldzWjI2TlBrcGtjb1dnSEhJN0RHVUtkWWp1ODl3b09wS2ZtTjZwbGor?=
 =?utf-8?B?UjlhZVR2WFhnL1Y5b3Y4TzFwNitKM2xaTFQzYitqYVlSOHBEUTZRckdLWDFL?=
 =?utf-8?B?YndVK0htdTJsNk5pUU96d3BzYzhBRExpR0ZXYko2VjE1b2dTY3gwZWNFYWhu?=
 =?utf-8?B?Y1hWdVhYSzBoYVdPTnhMN1RBN0xkOEZYZUpPRkRFcDh6a01oTTJEUTQ0Y1pL?=
 =?utf-8?B?QmR3R1AvZUZ5aFhQVWRkanh0VXBtVGRQOUtubTVDUnV0dTg2N3ZrajZhRE5V?=
 =?utf-8?B?NGF3aHA0a1BrL09HSU5wcjM5ejBNbFNlemoxa01nTDRaZzBYL0tKSEpwUldZ?=
 =?utf-8?B?d1ZBRjZmVHlNU2xmNUtWOVdwWFA2NWhuTDdlbmZlNzJsS3oxNkxlbjVJU0xQ?=
 =?utf-8?B?MjlKRlM0TXlsdnhHS2xzaGFUcVpQcFdDTWZGNjRKRkM3SStBaG5iMG1CYWlS?=
 =?utf-8?B?aSt0M2Q5Zlg4T1VjOS9sZzBwdzc3dXhQdnBxV2s1WXpnV041WnpPZ21OWEsz?=
 =?utf-8?B?ZnhRVk8wSXJMV1llUE50TWNmTFFJbmY0Ykcrb0UxQzJFMFh3MFJUbEtKbVFw?=
 =?utf-8?B?Tmo5WGFpN1o4VjAzMnluOE41a3RIaWVXQ0NCNUYrWDRaZ29qb3h0VmtCRzho?=
 =?utf-8?B?TVA3d3Z3RFVnNWJRWGRydmtIMXBkem1ESXAwdUxtR3pqNTRyUTZCZ1pHOGJu?=
 =?utf-8?B?UUcyT1JrYjJUaCtSYXJPS0dtYXo2aXBjSmNhSjVWRmJHL3dRMFFTMiswUFBN?=
 =?utf-8?B?YkxkQXg2Y2ZLMkh0eHRGOE5vK2dGVmxzd0gvMDRDQUo5M3AxWHNYZVMxUTc4?=
 =?utf-8?B?cEpUOGpsOWNIcDFsbHJGM3VUNUZnUnFrODAycXY1NVppS1Y0VytRWjVFNWxI?=
 =?utf-8?B?c2hySkROakF3TmltUTlreEpHVmErbDAxRHdhQ2tIQ0t0UUd3SjNaajR3UHAz?=
 =?utf-8?B?c0JhdXpRU0xtYjcvR1VqT1ltQnNKNFUrYmNhNm4vRml3VEdaWG9SakZ2RDl2?=
 =?utf-8?B?RmRKRjc0OXFkcStoY3p1bDllL0lvSk1lQzVPbGNyQnBXdU1qVG5lOFpZUnZG?=
 =?utf-8?B?cnJ4Mk9kS1BGb0hmTW9jeHhGaTZjWkRXd2taa1RNOTdaRXBwQkZoSGM5YjJG?=
 =?utf-8?B?L2t6N0ZEQ25GRGM5eUJWbVBIRURMR3hVRkZyVERUVXZJQW1UUlhSVml0K1dh?=
 =?utf-8?B?Y2Z1dHBicWpKeVRpR2JzRWpLMXBpWnNycWh4OUk2UXFDNWlvZz09?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aad9678-99b3-4335-c5f6-08dbcb5412b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 18:50:15.3860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QzrVf+iUjRIPtsT7N6ihQLjGtko5R2FTdc6m3ROnUPMC7Aic+QkL2wUAY9X9IDjAeyJreoJTu5fImRxEK1deKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6189
X-Proofpoint-GUID: ttFstGId3Ls5rhgdSo0GzSuUGSJDKBEX
X-Proofpoint-ORIG-GUID: ttFstGId3Ls5rhgdSo0GzSuUGSJDKBEX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_11,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 spamscore=0
 impostorscore=0 phishscore=0 clxscore=1011 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310120156
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

SGksDQoNCk9uIE1vbiwgT2N0IDA5LCAyMDIzLCBKYXlhbnQgQ2hvd2RoYXJ5IHdyb3RlOg0KPiA+
IE9uIEZyaSwgT2N0IDA2LCAyMDIzIGF0IDAzOjAzOjU2UE0gLTA3MDAsIEpheWFudCBDaG93ZGhh
cnkgd3JvdGU6DQo+ID4+IEhpIEV2ZXJ5b25lLA0KPiA+Pg0KPiA+PiBXZSBoYWQgYmVlbiBzZWVp
bmcgdGhlIFVWQyBnYWRnZXQgZHJpdmVyIHJlY2VpdmUgaXNvYyBlcnJvcnMgd2hpbGUNCj4gPj4g
c2VuZGluZyBwYWNrZXRzIHRvIHRoZSB1c2IgZW5kcG9pbnQgLSByZXN1bHRpbmcgaW4gZ2xpdGNo
ZXMgYmVpbmcgc2hvd24NCj4gPj4gb24gbGludXggaG9zdHMuIE15IGNvbGxlYWd1ZSBBdmljaGFs
IFJha2VzaCBhbmQgb3RoZXJzIGhhZCBhIHZlcnkNCj4gPj4gZW5saWdodGVuaW5nIGRpc2N1c3Np
b24gYXQNCj4gPj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LXVzYi84NzQxYjdjYi01NGVjLTQxMGItY2FmNS02OTdmODFlOGFkNjRAZ29v
Z2xlLmNvbS9UL19fOyEhQTRGMlI5R19wZyFlM3pWWkd0LTZUZDZISlhxaDhHYVpBc1VlS3l2S0Jo
T295cnU5cXpuM1ZrdzAxVmRrd2s3aEZyX3Q1Z2xCRzJCWUpsT1lmRktFVXBpSDVINGdRNzNuXy1Z
JCANCj4gPj4NCj4gPj4NCj4gPj4gVGhlIGNvbmNsdXNpb24gdGhhdCB3ZSBjYW1lIHRvIHdhcyA6
IHVzYiByZXF1ZXN0cyB3aXRoIGFjdHVhbCB1dmMgZnJhbWUNCj4gPj4gZGF0YSB3ZXJlIG1pc3Np
bmcgdGhlaXIgc2NoZWR1bGVkIHVmcmFtZXMgaW4gdGhlIHVzYiBjb250cm9sbGVyLiBBcyBhDQo+
ID4+IG1pdGlnYXRpb24sIHdlIHN0YXJ0ZWQgc2VuZGluZyAwIGxlbmd0aCB1c2IgcmVxdWVzdHMg
d2hlbiB0aGVyZSB3YXMgbm8NCj4gPj4gdXZjIGZyYW1lIGJ1ZmZlciBhdmFpbGFibGUgdG8gZ2V0
IGRhdGEgZnJvbS4gRXZlbiB3aXRoIHRoaXMgbWl0aWdhdGlvbiwNCj4gPj4gd2UgYXJlIHNlZWlu
ZyBnbGl0Y2hlcyAtIGFsYmVpdCBhdCBhIGxvd2VyIGZyZXF1ZW5jeS4NCj4gPj4NCj4gPj4gQWZ0
ZXIgc29tZSBpbnZlc3RpZ2F0aW9uLCBpdCBpcyBzZWVuIHRoYXQgd2XigJlyZSBnZXR0aW5nIGlz
b2MgZXJyb3JzIHdoZW4NCj4gPj4gdGhlIHdvcmtlciB0aHJlYWQgc2VydmluZyB2aWRlb19wdW1w
KCkgd29yayBpdGVtcywgZG9lc27igJl0IGdldCBzY2hlZHVsZWQNCj4gPj4gZm9yIGxvbmdlciBw
ZXJpb2RzIG9mIHRpbWUgLSB0aGFuIHVzdWFsIC0gaW4gbW9zdCBjYXNlcyA+IDZtcy4NCj4gPj4g
VGhpcyBpcyBjbG9zZSBlbm91Z2ggdG8gdGhlIDhtcyBsaW1pdCB0aGF0IHdlIGhhdmUgd2hlbiB0
aGUgbnVtYmVyIG9mIHVzYg0KPiA+PiByZXF1ZXN0cyBpbiB0aGUgcXVldWUgaXMgNjQgKHNpbmNl
IHdlIGhhdmUgYSAxMjV1cyB1ZnJhbWUgcGVyaW9kKS4gSW4gb3JkZXINCj4gPj4gdG8gdG9sZXJh
dGUgdGhlIHNjaGVkdWxpbmcgZGVsYXlzIGJldHRlciwgaXQgaGVscHMgdG8gaW5jcmVhc2UgdGhl
IG51bWJlciBvZg0KPiA+PiB1c2IgcmVxdWVzdHMgaW4gdGhlIHF1ZXVlIC4gSW4gdGhhdCBjYXNl
LCB3ZSBoYXZlIG1vcmUgMCBsZW5ndGggcmVxdWVzdHMNCj4gPj4gZ2l2ZW4gdG8gdGhlIHVkYyBk
cml2ZXIgLSBhbmQgYXMgYSByZXN1bHQgd2UgY2FuIHdhaXQgbG9uZ2VyIGZvciB1dmMNCj4gPj4g
ZnJhbWVzIHdpdGggdmFsaWQgZGF0YSB0byBnZXQgcHJvY2Vzc2VkIGJ5IHZpZGVvX3B1bXAoKS4g
SeKAmW0gYXR0YWNoaW5nIGENCj4gPj4gcGF0Y2ggd2hpY2ggbGV0cyBvbmUgY29uZmlndXJlIHRo
ZSB1cHBlciBib3VuZCBvbiB0aGUgbnVtYmVyIG9mIHVzYg0KPiA+PiByZXF1ZXN0cyBhbGxvY2F0
ZWQgdGhyb3VnaCBjb25maWdmcy4gUGxlYXNlIGxldCBtZSBrbm93IHlvdXIgdGhvdWdodHMuDQo+
ID4+IEkgY2FuIGZvcm1hbGl6ZcKgIHRoZSBwYXRjaCBpZiBpdCBsb29rcyBva2F5Lg0KPiA+IFdo
eSBkbyB5b3Ugd2FudCB0byBsaW1pdCB0aGUgdXBwZXIgYm91bmQ/ICBXaHkgbm90IGp1c3Qgbm90
IHN1Ym1pdCBzbw0KPiA+IG1hbnkgcmVxdWVzdHMgZnJvbSB1c2Vyc3BhY2UgYXMgeW91IGNvbnRy
b2wgdGhhdCwgcmlnaHQ/DQo+IA0KPiANCj4gVXNlcnNwYWNlIG5lZ290aWF0ZXMgYSB2aWRlbyBm
cmFtZSByYXRlICh0eXBpY2FsbHkgMzAvNjBmcHMpIHdpdGggdGhlIGhvc3QgdGhhdCBkb2VzDQo+
IG5vdCBuZWNlc3NhcmlseSBjb3JyZXNwb25kIHRvIHRoZSBJU09DIGNhZGVuY2UuIEFmdGVyIHRo
ZQ0KPiBwYXRjaCBhdCBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sa21sLm9y
Zy9sa21sL2RpZmYvMjAyMy81LzgvMTExNS8xX187ISFBNEYyUjlHX3BnIWUzelZaR3QtNlRkNkhK
WHFoOEdhWkFzVWVLeXZLQmhPb3lydTlxem4zVmt3MDFWZGt3azdoRnJfdDVnbEJHMkJZSmxPWWZG
S0VVcGlINUg0Z1diYjlidnkkICB3YXMgc3VibWl0dGVkLCB3ZSBhcmUNCj4gbWFpbnRhaW5pbmcg
YmFjayBwcmVzc3VyZSBvbiB0aGUgdXNiIGNvbnRyb2xsZXIgZXZlbiBpZiB3ZSBkbyBub3QgaGF2
ZSB1dmMgZnJhbWUNCj4gZGF0YSwgYnkgc2VuZGluZyB0aGUgY29udHJvbGxlciAwIGxlbmd0aCBy
ZXF1ZXN0cyAoYXMgbG9uZyBhcyB1c2JfcmVxdWVzdHMgYXJlDQo+IGF2YWlsYWJsZSkuIEFsc28s
IGV2ZW4gaWYgdGhlIHVzZXJzcGFjZSBhcHBsaWNhdGlvbiB3ZXJlIHRvIHNvbWVob3cgcHJvZHVj
ZQ0KPiBkYXRhIHRvIG1hdGNoIHRoZSBJU09DIHJhdGUsIGl0IHdvdWxkICBuZWVkIHRvIGhhdmUg
aW5mb3JtYXRpb24gYWJvdXQgVVNCDQo+IHRpbWluZyBkZXRhaWxzIC0gd2hpY2ggSSBhbSBub3Qg
c3VyZSBpcyBhdmFpbGFibGUgdG8gdXNlcnNwYWNlIG9yIGlzIHRoZSByaWdodA0KPiB0aGluZyB0
byBkbyBoZXJlID8NCj4gDQo+IEhlcmUsIHdlIGFyZSB0cnlpbmcgdG8gaGFuZGxlIHRoZSBzY2Vu
YXJpbyBpbiB3aGljaCB0aGUgdmlkZW9fcHVtcCgpIHdvcmtlcg0KPiB0aHJlYWQgZG9lcyBub3Qg
Z2V0IHNjaGVkdWxlZCBpbiB0aW1lIC0gYnkgaW5jcmVhc2luZyB0aGUgbnVtYmVyIG9mIHVzYiBy
ZXF1ZXN0cw0KPiBhbGxvY2F0ZWQgaW4gdGhlIHF1ZXVlLiBUaGlzIHdvdWxkIHNlbmQgbW9yZSB1
c2IgcmVxdWVzdHMgdG8gdGhlIHVzYiBjb250cm9sbGVyLA0KPiB3aGVuIHZpZGVvX3B1bXAoKSBk
b2VzIGdldCBzY2hlZHVsZWQgLSBldmVuIGlmIHRoZXkncmUgMCBsZW5ndGguIFRoaXMgYnV5cw0K
PiB0aGUgdmlkZW9fcHVtcCgpIHdvcmtlciB0aHJlYWQgc2NoZWR1bGluZyB0aW1lIC1zaW5jZSBt
b3JlIHVzYiByZXF1ZXN0cw0KPiBhcmUgd2l0aCB0aGUgY29udHJvbGxlciwgc3Vic2VxdWVudCBy
ZXF1ZXN0cyBzZW50IHdpbGwgbm90IGJlICdzdGFsZScgYW5kDQo+IGRyb3BwZWQgYnkgdGhlIHVz
YiBjb250cm9sbGVyLg0KPiANCg0KSSBiZWxpZXZlIHlvdSdyZSB0ZXN0aW5nIGFnYWluc3QgZHdj
MyBjb250cm9sbGVyIHJpZ2h0PyBJIG1heSBub3QgYmUgYXMNCmZhbWlsaWFyIHdpdGggVVZDIGZ1
bmN0aW9uIGRyaXZlciwgYnV0IGJhc2VkIG9uIHRoZSBwcmV2aW91cw0KZGlzY3Vzc2lvbnMsIEkg
dGhpbmsgdGhlIGRyaXZlciBzaG91bGQgYmUgYWJsZSB0byBoYW5kbGUgdGhpcyB3aXRob3V0DQp0
aGUgdXNlciBpbnB1dC4NCg0KVGhlIGZyZXF1ZW5jeSBvZiB0aGUgcmVxdWVzdCBzdWJtaXNzaW9u
IHNob3VsZCBub3QgZGVwZW5kIG9uIHRoZQ0KdmlkZW9fcHVtcCgpIHdvcmsgdGhyZWFkIHNpbmNl
IGl0IGNhbiB2YXJ5LiBUaGUgZnJlcXVlbmN5IG9mIHJlcXVlc3QNCnN1Ym1pc3Npb24gc2hvdWxk
IG1hdGNoIHdpdGggdGhlIHJlcXVlc3QgY29tcGxldGlvbi4gV2Uga25vdyB0aGF0DQpyZXF1ZXN0
IGNvbXBsZXRpb24gcmF0ZSBzaG91bGQgYmUgZml4ZWQgKDEgdWZyYW1lL3JlcXVlc3QgKyB3aGVu
IHlvdQ0KZG9uJ3Qgc2V0IG5vX2ludGVycnVwdCkuIEJhc2Ugb24gdGhpcyB5b3UgY2FuIGRvIHlv
dXIgY2FsY3VsYXRpb24gb24gaG93DQpvZnRlbiB5b3Ugc2hvdWxkIHNldCBub19pbnRlcnJ1cHQg
YW5kIGhvdyBtYW55IHJlcXVlc3RzIHlvdSBtdXN0IHN1Ym1pdC4NCllvdSBkb24ndCBoYXZlIHRv
IHdhaXQgZm9yIHRoZSB2aWRlb19wdW1wKCkgdG8gc3VibWl0IDAtbGVuZ3RoIHJlcXVlc3RzLg0K
DQpUaGUgb25seSB2YXJpYWJsZSBoZXJlIGlzIHRoZSBjb21wbGV0aW9uIGhhbmRsZXIgZGVsYXkg
b3Igc3lzdGVtDQpsYXRlbmN5LCB3aGljaCBzaG91bGQgbm90IGJlIG11Y2ggYW5kIHNob3VsZCBi
ZSB3aXRoaW4geW91ciBjYWxjdWxhdGlvbi4NCg0KQlIsDQpUaGluaA==

