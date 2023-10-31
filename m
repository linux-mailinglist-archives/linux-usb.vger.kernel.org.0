Return-Path: <linux-usb+bounces-2412-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F437DD944
	for <lists+linux-usb@lfdr.de>; Wed,  1 Nov 2023 00:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C0B7281847
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 23:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31842747C;
	Tue, 31 Oct 2023 23:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kZ4Ft6N/";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bJhak+Ce";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="m1CsIW1U"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C22E27479
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 23:29:08 +0000 (UTC)
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD4F8C9
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 16:29:07 -0700 (PDT)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39VM47xa012840;
	Tue, 31 Oct 2023 16:29:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=7y1GHaqmOB6yMwFf5GZhhqLk9kff7Ve8QXyqJ0abCBA=;
 b=kZ4Ft6N/zr0rOyV7kCMXTWrNcybbHEra5ts//yOXhjQV3+BTR8WIKRnYOhuKvGwlF5TP
 XG8WsxrpX6A+niY6WKcPt7MIeMGyTq+g8PmZBOkbA9aR5DT5JOZ6OSU8SZzRiaFisiLt
 mqSqI4RzUr4quQhFJi3SjyfmP7ekTT3c8C3Ic3C3TzhTFKt0QQska3To93so1dYIRraW
 CSNlyPaSlumqgDESbYTkMkKpIUgNNs8f9LYh5eMUS1ureoYMmyk6AZh0Kyei0tL4/O9v
 xqi44GFjtkMb3OlY8+N4dtDevvMTMhxb4FYY+ZodSIKIN6W5er2DPrB11CLFIa/2Jn+x +Q== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3u117wh61t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Oct 2023 16:29:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1698794940; bh=7y1GHaqmOB6yMwFf5GZhhqLk9kff7Ve8QXyqJ0abCBA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=bJhak+CeN7QaNiyGmEogi35+4ibTWwcbaM9NQzu5AyJdlHylIEA55YGQiyNgKXRD6
	 by+2A2n8wjwewV0LIOyz/6Fnf0Mp/x+/CFtY3CMlwoliNKx+2LW9N7/JBIUGF4iRP4
	 XN+brUnaO00Auj0hGLNoqyrSjMwsfO3ts1qVL+WTCkOyTkGaCuCeHrGCHijLY4Zgvf
	 xbQpg/qbUmKHjh8wm0WS7D5lWtmHXNg9TDYtw+1P98UezRpczxOUR2ECuYjDF9bm2Q
	 U7ELY+BVJYZC1lB6EMOU4vFbOK7wjUz7RkoeJ0BqOXQCv/j18QiTxQxZ6z2i5nU4wa
	 clYJuHezALwOw==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DF2044012B;
	Tue, 31 Oct 2023 23:28:59 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id DD038A006D;
	Tue, 31 Oct 2023 23:28:58 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=m1CsIW1U;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A83CB40364;
	Tue, 31 Oct 2023 23:28:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBjOPT6evPMyxTk6WfBZKDgMOqaQPOiy2pGd2btgQIKOtvRv6FVXeBGpKAGiZxoqnCVEhQAbPbwgzYDSfvc186TkquFvqlbtiUJ6bGOpf9LDZjfTgffZlCnRXsYsKHqox5JsB8l6iQ0p84Rx49WGXWthz4bNIruvcEcvnfAFypaOdt1J8W7USQUrPwXDyHNOPwuExwMdiaqAW2dhh2wl4sGQ0LRMFRaUG2QT4znFTC7+vNNcwdQeYIOblaa8nWl445beCYYjUzbha9922KZfsF7IPTzjd6AtMz1rwbqMdYzTJZ/qWSd2AQ7DT/JDGQ8voAZEStbfjLPgDasQrCdXLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7y1GHaqmOB6yMwFf5GZhhqLk9kff7Ve8QXyqJ0abCBA=;
 b=eF6nuvEpCM8eL4XxOt8d0jIP3SleUjy0RvaQSUxbQavebE2ia/UaUigtWQre4zdIS8F7/yln7x23c0+l4oAsKh7woYiyV1H6GYr5SogWuGjXzRb3cB+tKpiag6/FHhG1s04NzOiq+mkdrOjghqqWBBONiP9IxBEo24mOoLt4zmLxNwY/Rzc3Li7FwbuY2x07cHYIg56RKcwiiTK/KQvS5s4HvchahnMf+dKYAW9j76keAOLpCUys6ODt1gArwXbcxxcZ5fNH+8ij/2780XDQFXZl1whVoNNHyRPM0S+tpgsI95uYCDIUdzcpLkUoDmdMx3xeffGKVmEJgaYWsfgUNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7y1GHaqmOB6yMwFf5GZhhqLk9kff7Ve8QXyqJ0abCBA=;
 b=m1CsIW1UEbNo+npg1HIFPu7B9M4fdw/bm300NJUGHjy+/2UwGCghpiTCSytvmax9venJZhKtXDqBd991Sjt7Fzk9TwoPaUxeuqtm3Ly+aPjai/Nq2EYJzV+v8rEz58bEeERvm02MKmCj+2vhlWvBk8hN4YKCsVajhI5UBd459fA=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by IA1PR12MB7494.namprd12.prod.outlook.com (2603:10b6:208:41a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Tue, 31 Oct
 2023 23:28:54 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3fd1:e599:fe7b:e676]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3fd1:e599:fe7b:e676%6]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 23:28:53 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Markus Niebel <Markus.Niebel@ew.tq-group.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 1/1] usb: dwc3: let role switch handle initial state
Thread-Topic: [PATCH 1/1] usb: dwc3: let role switch handle initial state
Thread-Index: AQHaAL7XVe/PRjRjRkeuC1ZCgJjkDLBTTDQAgAbmYgCACm/ngA==
Date: Tue, 31 Oct 2023 23:28:53 +0000
Message-ID: <20231031232845.owfngqqaz6xq6hzt@synopsys.com>
References: <20231017055726.904133-1-alexander.stein@ew.tq-group.com>
 <20231020224330.e4tddtcer3uv2eb7@synopsys.com> <2176034.Icojqenx9y@steina-w>
In-Reply-To: <2176034.Icojqenx9y@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|IA1PR12MB7494:EE_
x-ms-office365-filtering-correlation-id: b436b4ea-aa0e-4fc7-cd09-08dbda69257c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FkLr04v35jsbB4jcZEhMlZcZB/OFJ97DOkjBtdSr5GinMRV0pgdP7x9dTXp3AX7Wr4uahbop56NL9Yy9hPixljSSUMt8WJ/MeNodO52Ujwmsv5sLG5ocbSTcC1F+jLPDYT3qAT1frLoI5L6/IAQdTGM9Gy440GvhoWPTbn1s+p0iW+OqNcvNFlAvjG0EKfy44lsPKIBmZu09PqN588JBmB7/fP5UhzdFY5/X/l8wNKtmMe8Q/hzDM7SrIgPkyvcpvOgmubgxjXHQP1CG/rjyaa2A2m14dWrhtukTB4Qaqcto5+JYj9IkG6cRA5BsID455wRc2J0qIc2SV4PftG3rcGOWfolmEEsVH+yQIk75dlF6r6qUgu9BysoRDWruwdl9kB5FQRIfL/AF/ybgeXqGe/bJNzTGEusrHF+ancxEXOZ8Qo3YVlREB5g8jYdwk6ieYvlZla84pk8jM1Dc1dntAqxAGaedKbUOfi2p8C5Gq4QTCnuG2+q1nRXJMJb0MDWsGx/0WMOyGqKoJoNa/ETGWL8QcaH5MxhtL4B/2W6YTg1/UJS9KE1hTMklJ5FDohe+lE6vy23YYSusGsrw9ecoXSZFNaUS/hZ1kXVc7qtLPDZFLgRlgn66JJYIMCh9+1fl
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(136003)(396003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(26005)(6506007)(36756003)(2616005)(86362001)(1076003)(6512007)(38070700009)(71200400001)(38100700002)(83380400001)(122000001)(6486002)(2906002)(478600001)(66446008)(66476007)(66556008)(54906003)(64756008)(41300700001)(316002)(6916009)(76116006)(66946007)(4326008)(5660300002)(8676002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Q3NLellyblVNeUQrVjZTOEtwcUpnRm13c24rQlo1MVB5UU0wUzBYclRzTm9y?=
 =?utf-8?B?QjdBUVMvV0RBZ0VVSGRkMVRYckpNcVBvc1UxY2hCcVNJY24wQld3ZU4ySzZP?=
 =?utf-8?B?UWs0WkhmK3J0bHZRQ2JDUGdKNmhMWkZ0Ni9xYW1NWWlHY2thdzVoMnQ2Njhk?=
 =?utf-8?B?Y3dGQmdBZUUvSk5TZ0wzWkM4Umw1VGdrZW1EcGNqQW9vNzRDeHJ4SmM4dXFV?=
 =?utf-8?B?QjNORmhPQUtvMEFJWDdMck5oNTVCL2NyYUorcm5neWdUaVJScXl6aTFCaURu?=
 =?utf-8?B?eEpFZnVpMkNuOGFiVkwvZEUxMmo1NWw0VG5MeERCbnBBSTlWdzRGTTBQckU1?=
 =?utf-8?B?U1d2cE9GN3A4N3Qrd2hTV1p0TWVTVytQcW9yeGlQRlE4RUU5RjA0WUVaMGd3?=
 =?utf-8?B?Q3lJYkphMEYwVWN6MVdIZkF6RVgvaGRmejVSWGNhd09lY2RSL0syMDU3a24x?=
 =?utf-8?B?SlpSeUk1anRReEQyalJ5RXlzeExDU0UvVWl3bVR4WVhrZGZrR0FPcGlPQjNZ?=
 =?utf-8?B?SkVHZ3hKZUdTVWxNNDhmRnB4QzY4YU90bVk5WkUzbk5zdUpyZlREdytKK2xw?=
 =?utf-8?B?NEVkMk43RW1EbG90UXVUYm15cDB5L3ZhT2dKZXg3ODEvOVcrbHNGNkJLalhJ?=
 =?utf-8?B?anZCWUU5bDkxc09NbEJvS2J0NkJueHB5T1dRYmZSQzBkb251TDBMTU4xNzVk?=
 =?utf-8?B?Sml6RzZPVmNDMWNrd0lBb3Zia2gzTHNHQlZQTkNzTGhudms2aGp1NE5QWWd6?=
 =?utf-8?B?bDNvVjlzMW1HYVNxejFldHYyU2xGeWt3R2JkbDVGN2tpeEtzcFBURmtHdFpQ?=
 =?utf-8?B?WjlQQlExcGVDRzNnOGNKNmpNa1pRaWZwUDZGcTFrNzEvMkdCN0dFV2NhVDJJ?=
 =?utf-8?B?ZTFWL0JIaTU1MnJ0b25aRVJaS1hoL283ZXVla1QxWjZKSzl3RDl3M2dRNWw2?=
 =?utf-8?B?STd1bENZd0lIMXc2bDZtNzZQbSt2VWtZUzZHbDhNdDFVbTdyRm1wbnZrVEEy?=
 =?utf-8?B?eWszZTMvSzlNL2RoeUc0WjZaTWR6R0JieFluN1ExQjdJNXZzTmJvbllnZHQ0?=
 =?utf-8?B?ZGJtRTVhYWtjdGpCU1JCS21zUklzV3dkYVlxRWVKdGlnZEg4aVF5T0lxVFZW?=
 =?utf-8?B?MExvY0gvK0g5Y3dUK1N4cHQwRXQwdmtadVpWUC9zZnJpVGdSRjEreVVlUEpn?=
 =?utf-8?B?RENid3BuQnk4YjFsTVpYbE1FN2g4R29kdVFPUFoyVlNuWGY1SkkzcTZOdG11?=
 =?utf-8?B?SVFyZG1PR1lESFZ2SmxzOEdoYmp6OXBnckUwZmcwUHBCbnpyK1RFY01TUTFL?=
 =?utf-8?B?bXJ3cHFPUU1GYzdCT1IwdjhTY3RvUWc3b2hjZ0d2Tkh3SnQ0eTV4eEwvLy9t?=
 =?utf-8?B?eXplMEQvYVhkM2NhYkVIYUU4RHJ4RktBcG1XdWVXcG5SQldiNzFXeGYyQjZh?=
 =?utf-8?B?R1VUZGQ5M0M5d2NHTkRod1E3N3VxQytYTGVEYTJaYnQ4NXdDSU4raVBvbDJi?=
 =?utf-8?B?bTQwK04rWTRlTmkxOHZxNFVRWUFCeE1SZkw2RG82dU1XUkwxUk95QkhpVmRZ?=
 =?utf-8?B?UjNuYjd3cUNaZ2FVWUoxcVN3eHYxRk5HeW5tVjlvMXhPQzl2TDVpUkJGTzE2?=
 =?utf-8?B?MFhGK2dUYkRSY1RWOGIyVUQycW9HVkJUTnJGUzJoRVlnVm5YblZ2eEFFQ0ZH?=
 =?utf-8?B?ZFA1d0Q1Ty85NXZDTTBHRVRIYnkxT3lIVVhMUjNkcGljQVZTd0RPeUFqTHBM?=
 =?utf-8?B?YXFVckRmcDhDZEJXZ3ZCVHdQU0oxeFh5Z01DL0lvUHlHeUtybXZNbGI1WnBz?=
 =?utf-8?B?UTVEQVBVbDd1eFRlekZtTkwzNlZQQmxxT3d0aGZ2eTF5MTZSekFFSHBpNDFu?=
 =?utf-8?B?Qks0NExTZjlBOEtqY0NlMitVNmdYQ2hTZlRudVhlZlBmUDlXcGpGaXd0S3Jz?=
 =?utf-8?B?M1BQaklnZFpyM2loSGdJbW5KU20yODJFMkF1QXB0Vjg5VUQ5VW9NVE5pT2Y5?=
 =?utf-8?B?QmdqUFdJVEdaZFBZQWhsS1JLY2dpbEs3dUpGUVU0d2tQUk01c3EvUXBBK1Q2?=
 =?utf-8?B?K3pBWE91cTZRcERZS1l2dGZ3WXgxZUhheUh0NVZnNjR6UlEyZUw3UHhPcno4?=
 =?utf-8?Q?+491xw6OnpyNcwvFve6/23sXt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D7BA60569CE09440995A9282AEB95ED5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	L6G91FUFf+pIB6ETRPoAsyrvvPar2PkRQAgeRotaFrjOjTvy9k9qffr5VAIG0McHHUV8PSiY1H1L3y1yAf53jkkJrcRm3qs0643gBT8qkD4q90kAE9m3yJmU/rNrNaE0qDdrH3giujnXOCwW7zz+WfwF/CmW8Od6IV5bA+90rA8vYBDKadBtKFccA0nYoQVdo8LQXGlDz1/nC7gycW+bSRJgOnVek9QxWHN6zLxolOfkTillnAH7mQLfXDUx9OCANsVFbXcUfRUcr8/9X7ne/jZ4BP71xEvCJr60dNN4wihGvDnSldWVyGph41WvLScaworxlxsTumtk/XdyagkWLDysh5669mvqsHM7NpHjjI+4h497k2HUaY50VlvKYPmah1OW8C88afbMoJCLOFPELdoTkO+bXjPt+yf6yImhofSsPfz/RcTWrWfLzEma36ErgnEfyE8ROZFKgd7TZO9EGZOgDKprxMN+y5TKzayQyEv9sUL63S1Nib1tw+ku/x8hAi0AtMww8RlfSrIh5wCqAR6kjZgIj2qArpKNvYW6LvGmiVme8udib5/qS5rzUiGnULTfmsNjsNo1J0nyFEhRMrgVbd9Be/yzm6tXsgAlM+Pygw7GInZHqQ90MKV9Oc0HZRlStvLXpMvjRicCCC0CvdfuK+1Vvf2EGHJsDITcSo2HI+1I1yx6yF0/x3xj9V3NoEiJDwQXQ9DyGt87UjVf0Cj5/YBI5CT1951sUnlrl+8mL0gXR6R2MypvTG5+r01spG10f50gZBllgq3ie3XPBci0Zjzlkxx+D37XhtpvVIyD5LzyT4SF8PTf+9WYAvLCprj/exbdpwFKW9vI4P8QnY5OZG02SaUFRdAD8CRgqwpzIJckTfEeWFbnM7jYSyDkqSJ1jki7yGwqDhZ7DrsEaA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b436b4ea-aa0e-4fc7-cd09-08dbda69257c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 23:28:53.8042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wSDJ3iYl7DBL8V+LUpuwoRgIEaplboJcnIO65ztSSPTIJY6t2p8ZY+p+AvaIJLDqBCX+7mu+Argnj7oNqUt4Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7494
X-Proofpoint-ORIG-GUID: L87AXNCWLc8NL7SBPZ5kJdvc-ErIGPuw
X-Proofpoint-GUID: L87AXNCWLc8NL7SBPZ5kJdvc-ErIGPuw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-31_10,2023-10-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxlogscore=946 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2310240000 definitions=main-2310310194

T24gV2VkLCBPY3QgMjUsIDIwMjMsIEFsZXhhbmRlciBTdGVpbiB3cm90ZToNCj4gSGksDQo+IA0K
PiBBbSBTYW1zdGFnLCAyMS4gT2t0b2JlciAyMDIzLCAwMDo0MzozOSBDRVNUIHNjaHJpZWIgVGhp
bmggTmd1eWVuOg0KPiA+IEhpLA0KPiA+IA0KPiA+IE9uIFR1ZSwgT2N0IDE3LCAyMDIzLCBBbGV4
YW5kZXIgU3RlaW4gd3JvdGU6DQo+ID4gDQo+ID4gPiBGcm9tOiBNYXJrdXMgTmllYmVsIDxNYXJr
dXMuTmllYmVsQGV3LnRxLWdyb3VwLmNvbT4NCj4gPiA+IA0KPiA+ID4gV2hlbiB3ZSBoYXZlIGEg
cm9sZSBzd2l0Y2ggZGV2aWNlIGF0dGFjaGVkLCB3ZSBzaG91bGQgbm90IGNvbmZpZ3VyZSBvdXIN
Cj4gPiA+IGluaXRpYWwgcm9sZS4gTGVhdmUgdGhpcyB1cCB0byB0aGUgcm9sZSBzd2l0Y2ggZGV2
aWNlLCB0aGF0IHNob3VsZA0KPiA+ID4gZGV0ZWN0IGFuZCBzaWduYWwgdGhlIGluaXRpYWwgcm9s
ZS4NCj4gPiA+IA0KPiA+ID4gVGhpcyBmaXhlcyBzaXR1YXRpb25zIHdoZXJlIGEgVHlwZS1BIHBs
dWcgaXMgY29ubmVjdGVkIGFscmVhZHkgd2hlbiB0aGUNCj4gPiA+IGRyaXZlciBpcyBsb2FkZWQg
YnV0IHRoZSBkZWZhdWx0IHJvbGUgaXMgc2V0IHRvIG5vbmUgb3IgZGV2aWNlLiBJbiB0aGlzDQo+
ID4gPiBjYXNlIG9ubHkgYW4gZGlzY29ubmVjdCAvIHJlY29ubmVjdCBnZXRzIHRoZSBjb3JyZWN0
IG1vZGUuDQo+ID4gDQo+ID4gDQo+ID4gSWYgdGhlIGRlZmF1bHQgcm9sZSBpcyBub25lLCB3aHkg
aXNuJ3QgdGhlcmUgYSBub3RpZmljYXRpb24gdG8gdXBkYXRlDQo+ID4gdGhlIHJvbGUgb24gaW5p
dGlhbGl6YXRpb24gZnJvbSB0aGUgY29ubmVjdG9yPyBUaGUgY3VycmVudCByb2xlIHNob3VsZA0K
PiA+IG5vdCBiZSBub25lLg0KPiANCj4gZHdjLT5yb2xlX3N3aXRjaF9kZWZhdWx0X21vZGUgY2Fu
IG9ubHkgYmUgbm9uZSBpZiB0aGUgRFQgaXMgbWlzY29uZmlndXJlZCwgDQo+IGUuZy4gcm9sZS1z
d2l0Y2gtZGVmYXVsdC1tb2RlID0gIiI7DQoNCk5vLCBJIHdhcyByZWZlcnJpbmcgdG8gdGhlIGN1
cnJlbnQgcm9sZSwgd2hpY2ggaXMgZGV0ZWN0ZWQgYWZ0ZXINCmluaXRpYWxpemF0aW9uLiBUaGUg
Y3VycmVudCByb2xlIHNob3VsZCBub3QgYmUgbm9uZS4gSWYgdGhlIGNvbm5lY3Rvcg0KaGFzIG5v
dCBub3RpZmllZCB0aGUgY29udHJvbGxlciBvZiB0aGUgY3VycmVudCByb2xlLCB0aGUgZHdjMyBk
cml2ZXINCndvdWxkIHNldCB0aGUgY29udHJvbGxlciB0byBlaXRoZXIgaG9zdCBvciBkZXZpY2Ug
bW9kZS4gVGhlIGNvbm5lY3Rvcg0KY2FuIG5vdGlmeSB0aGUgZHdjMyBkcml2ZXIgaWYgaXQgZGV0
ZWN0ZWQgdGhlIGN1cnJlbnQgcm9sZSBvbiBpdHMNCmluaXRpYWxpemF0aW9uLg0KDQo+IA0KPiBD
YWxscyB0byB1c2Jfcm9sZV9zd2l0Y2hfc2V0X3JvbGUoKSBmcm9tIHVzYiByb2xlIHN3aXRjaCBk
cml2ZXJzIHdpbGwgbm90IA0KPiBhZmZlY3QgZHdjLT5yb2xlX3N3aXRjaF9kZWZhdWx0X21vZGUu
DQo+IEknbSB3b25kZXJpbmcgaWYgY2hlY2tpbmcgZm9yIGEgbWlzY29uZmlndXJlZCBEVCBpcyBz
ZW5zaWJsZS4gQnV0IHRoaXMgd2lsbCBiZSANCj4gZGV0ZWN0ZWQgYnkgJ21ha2UgZHRic19jaGVj
aycuDQo+IA0KDQpJIHNlZSB0aGF0IHlvdSBqdXN0IHB1c2hlZCBvdXQgdGhlIGZpeCBwYXRjaCBm
b3IgdGhlIGFjdHVhbCBpc3N1ZSwgd2hpY2gNCmxvb2tzIG1vcmUgcmVhc29uYWJsZS4NCg0KVGhh
bmtzLA0KVGhpbmg=

