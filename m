Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32A8E53EDDE
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jun 2022 20:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231750AbiFFS2a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jun 2022 14:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231745AbiFFS22 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jun 2022 14:28:28 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE4B91AF6DE
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 11:28:27 -0700 (PDT)
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 997E4C0856;
        Mon,  6 Jun 2022 18:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1654540107; bh=J9bvY5+3dEtchyYZn5UOmUllyp7ROsF1bW6LKH25yFU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=IDQkXRwXPtf0luwYdkpi19bjGThbtXO+PO5C5bYCmxrT9TuSMHktvOwLBAv+HqgVo
         3xWupXImdY9dfZv4nGSbiuJm0+a3Q2sLIEU88HEpkFc67lpXjA2uAyEJIXtWppuuDr
         GjJ1w4Q+JOH6+iLDY7IKbgtd9j3Dm3MUxmWaLQldjHH1MPy5aPk8f4lps29HX2+zZn
         SkqTiPcwVUJM6JjBI14nHIcrHUg0dPQOd4bctgguoRT+sw0S60Ivn2nmRYJtSBGJok
         Qa0t4parcAPSu2hfcEJT4OxPkkQNSdZkFeD4nKsZh72oftgUMklwDwn2xsbV8sm5YK
         OdRrDOfYYfCGw==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 186E1A00A3;
        Mon,  6 Jun 2022 18:28:24 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 38CEA400BA;
        Mon,  6 Jun 2022 18:28:23 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="jQySCuqq";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSvDhBHf2/2ja6HUobyK0VmJcltzM4wFlwhVwUMrpiOQGCmNVaPSM36SDSXF7oFBtg+PziMyTCYkxEV3P4L/6SrQB+K/cUAM5rDew1fZeXtEXRmbWRpKc7gD8/ll6v7YHec+MberOXSTjiXNxc+53751xaaizjrz2BRACML/NDJ2U+/FgAolETe3pMVUOB6JiuWIYqcScykqVrvpBc1dNWje+Hom9GhxB0SIQCaoC31k84WHkpxQpIMk6UKA5kIdezmXWMOq2B8dp82u99753Gt5967b7zxlqx29MyWD6kb96JHwKA7jHF85RhtLazuxi8N5QNoD4vysLxFLvcJALQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9bvY5+3dEtchyYZn5UOmUllyp7ROsF1bW6LKH25yFU=;
 b=Dyd7mg4nNI7T/XUchUjg+xcj951clryDA1o37GfVQRiZTaRJx88fAZuRgMGVK1WQefbe6bqNaBWMhrrZC8PJ656OX5o4XtTBhgS6xm8VT5M1s66rq0rUdFaAxzezRBAdpfDowGnhZhp2fd2oK0WfewQhRjRPICWA1nx7iMRgBIDLfMQubRwnqVIl7EX8tYHCX3X2offqHKU2S5Md+Lg/eAH6cBsX/NdkQNZhMczHLDtREZfat+AUEeDE5Vx6/eFi6/FPEqTF/X0tnKQ3/O0NjXIagl+OKX2Ig7dHI4easD+1yxZL1fxBJKebGA2hNljZLjJpg87tCYyL0tpAP3lGcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9bvY5+3dEtchyYZn5UOmUllyp7ROsF1bW6LKH25yFU=;
 b=jQySCuqqCL69ug1h5I0K6yWfzvIywPqRmlYDDhSHMrIoJGsFTtUpERPQSxRvbBOo0F4EYP2EqWsI48Iq3UoOodDroDl7Y9QKxFDeQ+ttxWUcCfskyezwDD0Pu54Db1POmVtMWggbg1vtYWCBHa7BovdtiH7VHfcSQ64HtZNaA30=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BN8PR12MB3411.namprd12.prod.outlook.com (2603:10b6:408:40::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Mon, 6 Jun
 2022 18:28:19 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::91c7:7e6b:d663:a349]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::91c7:7e6b:d663:a349%7]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 18:28:19 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Pavan Kondeti <quic_pkondeti@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Juergen Gross <jgross@suse.com>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 4/4] usb: xhci: Introduce Synopsys glue extension for
 DWC_usb3x
Thread-Topic: [RFC PATCH 4/4] usb: xhci: Introduce Synopsys glue extension for
 DWC_usb3x
Thread-Index: AQHYd72U5vDxcqRhvkGcaLgpKysUM61CG18AgACbiAA=
Date:   Mon, 6 Jun 2022 18:28:19 +0000
Message-ID: <6eb9f752-0979-3a96-3f07-324fa8455be9@synopsys.com>
References: <cover.1654310542.git.Thinh.Nguyen@synopsys.com>
 <fdd35b176f74e80fd75e4f75731e0f26c0808c89.1654310542.git.Thinh.Nguyen@synopsys.com>
 <20220606091138.GA19757@hu-pkondeti-hyd.qualcomm.com>
In-Reply-To: <20220606091138.GA19757@hu-pkondeti-hyd.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 729b8211-d649-4f8b-91d8-08da47ea548b
x-ms-traffictypediagnostic: BN8PR12MB3411:EE_
x-microsoft-antispam-prvs: <BN8PR12MB341133862C25F114AB40E06BAAA29@BN8PR12MB3411.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: htQJOaG+99UKTK95kIkmjhUvr5sBE5yxjYagFl9mGcDt3SKH5Yz9cxGcKZ9ybNa+fzkSv6kGRxNkHz7EgLbp8bFA/TVyJGIWBbe9THwfPBzPCRw95ROEsFr/bLO35/w/LC0mYIMzmYfyHOgqioS2bMEwBstZf1Xtnpy20CzBkZOFWm0woNOVQfa3wm09RGcUJvGQYzdXkmdbIc6pVpiQ66U/vZvnZ/HQ5XwTa1fTuDZjKQx98qL4X7sAynqOSaS+OFmjiz/ydu+0L1uu7hqz1WqrCxpjotV3wefvuGIGFKMFiIWC1A14jonp2Rnwrkrha4yVca3WlEg6yXqS3Uim71bnJ0U9HVZwiPJeqrVoJEZMYcFS628gdrDFGmmlv3WN+1OJPjaKSUFUiEKRYsRUCpQOhX8EbkaIYxqi2qFNyTJD85OXhTLbsab9HMs2Ha2DbWlGvgL/Xo3o769pMeVwrEkDgCy2J5n7TUFDkLXJK9sSNip8UuVUVsCjF8u5TSaDM14PeeWNyE0Q5oHZdI0TeIvPJPreb4f+X6tOJ6Yg3v2SEEmToJr2ZI7gVuzCWeYogYgXy3z4oI+DUB68I8GT8DFii1P3og7827zjcNc45dlXUcuEuUPCOgevuiLNnapRnGywxMeHt61rPlEOhHwGane0eJRDZYTBBXWQzK+AmYCPC7icwSVe75KYqDpLyGZMI5IbXz9i2/xFJDtrP152djznd1KYQWmfgmuEleo68ZWrEJFfjZfJiaV7KTAJCz4KhYpeFdDAdwps5Xxb2bcSwQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(64756008)(66556008)(66476007)(38100700002)(66446008)(31686004)(31696002)(4326008)(66946007)(71200400001)(8676002)(36756003)(2906002)(76116006)(508600001)(122000001)(5660300002)(38070700005)(26005)(6486002)(2616005)(8936002)(316002)(6506007)(110136005)(6512007)(86362001)(186003)(107886003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFg0MllURStLcWo0M1JJbVlTNXpoR2I0SGl1Tmpkc045MCsrTmlWTjFsRFJO?=
 =?utf-8?B?VEtyUHdtMW44TzhEbUFvaDNJQVpCWEZaUHBSMTh4WEdpRTIxOVZPMEhrUlY0?=
 =?utf-8?B?QW5Vb016blc3N1ZKNko5dkNHZmNMMjcvallPdTdleUVDY3VWaWtNbEYzV1Zl?=
 =?utf-8?B?NVB2ZTBYQ0l4cHR3NmU1ODdLUmhXMzFEWURwc21hNnp2bFRUVGMzWHp2YVVV?=
 =?utf-8?B?MDQ3RGszR3RxMTVSb2lqM0tqWHBGQlVhR1A0bTNQK3N4bjZyWmc2RTE2SWtR?=
 =?utf-8?B?Z2pzUEh5TnFFbFJ3MncwN0RyZ28xY1c5WUQ0SFVmNHdSejU2aFcvVFpPa09j?=
 =?utf-8?B?cmRyQkY4Mm51aHdqRlpTdkpNaXYrNjRVVi8wSGl2ZmNEMzNUZ3RwUzJnVWlk?=
 =?utf-8?B?NjhVQUpyMlVneXRaR3ZrKzh2bDdJdkJPSHJlUjd4OVBzUXlXNVd0cHhNbFNj?=
 =?utf-8?B?Sk1aNk1MTDhKQ1FhTmdldDRWRHJ5NG43YXVRMmNjYUVOVmN4K3l4am5tOWFT?=
 =?utf-8?B?T1Y2SjhIYklHSXJ3Yy9UZGtmZWJ1aW0zVzB3OXh0K2NVQ1RDdi93bWd2dUMr?=
 =?utf-8?B?QUNtTUQ5MFNYRUVCbEttc2ZMU09jdEh0Mm12RDk4ZlpPRnFTL2ZvWHhHbGI5?=
 =?utf-8?B?Mi9SRUNwbEhnbEtURko5WHFtaEtPU1d1eldNVzJ3V2NjRXZtcnlXcHpDS3Vw?=
 =?utf-8?B?NDlFSlNKMEhxU0Q3WkJnSkNFZmdIRFptRVBodHpGTFhOVUxVVktDOXVhckZk?=
 =?utf-8?B?UXVWNzd3ZlFyYzdWbFFmZklSb25ESkhsSUo5dlRUanJ2SFdyN2tsMFNpQ2ZZ?=
 =?utf-8?B?WUZ1UnVqTDdIUm5ZVy8zU0dxQ2RHWjdjdXA5NE4rNDkxMUFoWjFOQk5Xbjlq?=
 =?utf-8?B?cW8yOEx4dVFSOUNtRmVodEZOblBDbjQwRjNsSEx2aG9KL2FlWm1tamh1b0dE?=
 =?utf-8?B?YWRLWFJ6cDVxTEdEcTcvczIydy9tVGp4NzJPL0xha05PaDZLcGhoSlBpZldP?=
 =?utf-8?B?RWVwdXdaVFpjM2lyM2RXV1FsZGhiU1FFL2dVaUo4Yks0REtpUDRWaFZrbWJN?=
 =?utf-8?B?YmhSOEUwYjF0U1lZa1R0SXl3bENzREhHY2V3aG1vcUQxU3hrVEdJSkNwMlFa?=
 =?utf-8?B?cDVqbTJCQkVBWTUrZk5reEVLaUI1cTlHb3R4Vllzb3VLL0ZjMDRDOHlENGdt?=
 =?utf-8?B?TFFFMlJsU05MRGl2ejBBa0JWUzJQOXc2UThyVnpwQU9EL09lSFlVQXFkeC9p?=
 =?utf-8?B?Q3hJZE8rdHNTSVV4YkdjME10VGd4L3JmTmV5UHBmMk5hZ3luK0thR25tMzM5?=
 =?utf-8?B?cE9qLzRXeHcrbk5IcGRHRzhuTnZLSEttT1NXV09rekFZcU82Y2VDOWFza1Nk?=
 =?utf-8?B?bmJFR20rVFhQelFYeVNJVUxDVlg0UHJYSW5DYS9JcnBsVU9CQzV5eENRZFB2?=
 =?utf-8?B?V0pnOVdqRThWM2d6c2xZS2xyeXQwZW0xOE1JVHFoNzdTNDZjdzNzMitWdXRH?=
 =?utf-8?B?SmhxbldEamxUM0lnTXk2Q1hBQ3pJNnNTK1VnOWc1eUwwMUdOamtEVkhLcEw3?=
 =?utf-8?B?TDc3dGpya3lvL2pldmhhVkg3RlJ4b2ttQ0pXM1cxQ2xFQWFSVUxSUDBwOXRU?=
 =?utf-8?B?V1ltbGNyNDI3TmJVNDBkLzRldjMxd2phYitsNTZGL240enhScjZvYlNhM1k2?=
 =?utf-8?B?elRINEdhdEZpa1BVRnhzbEo5YkRuSzBzRzFEcUtqeE9vWUZiZGtNaHc5eHlV?=
 =?utf-8?B?Vm1QZUQ4MjN5SjRKMlcwSEVtZFhETTNWQUovemxLNDBlUFFSS01IOEh1bzZX?=
 =?utf-8?B?OXJYZmJlb0MzMC9KanVvMjVsTHBVYVhMU2M4UzJabEU5cWVleUZGTXdwYzQr?=
 =?utf-8?B?bm1ybFpuMkNickw4UHprSWRVR3BsaWJXU3prWEI3eXFZZC9TYUM0R0hDd2JR?=
 =?utf-8?B?M3JCV3N0cDhDR1JjYnU5T0h4RmFZa09RTVllNkFBZCsrSWJlTXlKTWpPeTVy?=
 =?utf-8?B?MjZDSyt2QkVrbHlpVVF6YkNMeU5TY3Jia0laMXhoREFEcHptSTVzZWNpOE9F?=
 =?utf-8?B?RXppWENQaytMYWFKaDBkcC82N2FEUmRRVVpBOUp0WUFxeXMrMElJNHZHdWZN?=
 =?utf-8?B?cnlPZmFqcEpURTJDRTVaQklncXNRS1V2L0xoNjJSSHlrcFBJb2grS3NDYmZF?=
 =?utf-8?B?WUtXcnhvMkk1ZGg4UHhkeUV3S2U0S3YzN0dpR29rY2pwRGE0UUJTNGVxblNP?=
 =?utf-8?B?K2U0WXQrN0NSZ1JjYU1ZL09POW9SaDg4ZnBvN3hSVnBGanhZZk5ScHY3a2ZM?=
 =?utf-8?B?MFVTNDNkTW9MeWVPWmRFWE00OGY1SlhLTkNSdHJiQ09mWEh0RFVkUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9CB3191D1F6BF742BE48D8534F0C06E7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 729b8211-d649-4f8b-91d8-08da47ea548b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2022 18:28:19.2386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Qy3zUM8tX8bPR4Wsx/6nDEjrwg1hgrVwxN67N1gbf6bXzTQi5d7b2B2rrUCmRotbc7V/KXWXIrVy6hgpnBM1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3411
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

UGF2YW4gS29uZGV0aSB3cm90ZToNCj4gSGkgVGhpbmgsDQo+IA0KPiBPbiBGcmksIEp1biAwMywg
MjAyMiBhdCAwNzo0ODoyOFBNIC0wNzAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+PiBTeW5vcHN5
cyBEV0NfdXNiM3ggSVBzIGFyZSB1c2VkIG9uIG1hbnkgZGlmZmVyZW50IHBsYXRmb3Jtcy4gU2lu
Y2UgdGhleQ0KPj4gc2hhcmUgdGhlIHNhbWUgSVAsIG9mdGVuIHRoZSBxdWlya3MgYXJlIGNvbW1v
biBhY3Jvc3MgZGlmZmVyZW50DQo+PiBwbGF0Zm9ybXMgYW5kIHZlcnNpb25zLiBUaGlzIGRyaXZl
cyB0aGUgbmVlZCB0byBmaW5kIGEgd2F5IHRvIGhhbmRsZSBhbGwNCj4+IHRoZSBjb21tb24gKGFu
ZCBwbGF0Zm9ybSBzcGVjaWZpYykgcXVpcmtzIGFuZCBzZXBhcmF0ZSBpdHMgbG9naWMgZnJvbQ0K
Pj4gZHdjMyBhbmQgeGhjaSBjb3JlIGxvZ2ljLiBIb3BlZnVsbHkgdGhpcyBoZWxwcyByZWR1Y2Ug
aW50cm9kdWNpbmcgbmV3DQo+PiBkZXZpY2UgcHJvcGVydGllcyB3aGlsZSBtYWludGFpbmluZyBh
YnN0cmFjdGlvbi4NCj4+DQo+PiBTbywgbGV0J3MgY3JlYXRlIGEgeGhjaS1zbnBzIGdsdWUgZXh0
ZW5zaW9uIHRoYXQgY2FuIGFwcGx5IHRvIHhoY2ktcGxhdA0KPj4gYW5kIHhoY2ktcGNpIGdsdWUg
ZHJpdmVycyBhbmQgdGVhY2ggaXQgdG8gaGFuZGxlIERXQ191c2IzeCBob3N0cy4gRm9yDQo+PiB0
aGlzIHBhcnRpY3VsYXIgY2hhbmdlLCB3ZSdsbCBzdGFydCB3aXRoIHhoY2ktcGxhdCBnbHVlIGRy
aXZlci4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBz
eW5vcHN5cy5jb20+DQo+PiAtLS0NCj4+ICBkcml2ZXJzL3VzYi9ob3N0L0tjb25maWcgICAgIHwg
ICA4ICsrDQo+PiAgZHJpdmVycy91c2IvaG9zdC9NYWtlZmlsZSAgICB8ICAgMyArDQo+PiAgZHJp
dmVycy91c2IvaG9zdC94aGNpLXBsYXQuYyB8ICA0MCArKysrKysrKw0KPj4gIGRyaXZlcnMvdXNi
L2hvc3QveGhjaS1wbGF0LmggfCAgIDMgKw0KPj4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1zbnBz
LmMgfCAxODUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+ICBkcml2ZXJz
L3VzYi9ob3N0L3hoY2ktc25wcy5oIHwgIDMyICsrKysrKw0KPj4gIDYgZmlsZXMgY2hhbmdlZCwg
MjcxIGluc2VydGlvbnMoKykNCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy91c2IvaG9z
dC94aGNpLXNucHMuYw0KPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3VzYi9ob3N0L3ho
Y2ktc25wcy5oDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hvc3QvS2NvbmZpZyBi
L2RyaXZlcnMvdXNiL2hvc3QvS2NvbmZpZw0KPj4gaW5kZXggNTdjYTVmOTdhM2RjLi5lZmJmYjc5
YmFmNDQgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0L0tjb25maWcNCj4+ICsrKyBi
L2RyaXZlcnMvdXNiL2hvc3QvS2NvbmZpZw0KPj4gQEAgLTYyLDYgKzYyLDE0IEBAIGNvbmZpZyBV
U0JfWEhDSV9QTEFURk9STQ0KPj4gIA0KPj4gIAkgIElmIHVuc3VyZSwgc2F5IE4uDQo+PiAgDQo+
PiArY29uZmlnIFVTQl9YSENJX1NOUFMNCj4+ICsJYm9vbCAieEhDSSBmaW5lIHR1bmUgZm9yIFN5
bm9wc3lzIHBsYXRmb3JtcyINCj4+ICsJaGVscA0KPj4gKwkgIFNheSAnWScgdG8gZW5hYmxlIGFk
ZGl0aW9uYWwgZmluZSB0dW5lIGZvciBTeW5vcHN5cyBEV0NfdXNiM3ggeEhDSQ0KPj4gKwkgIGNv
bnRyb2xsZXJzLg0KPj4gKw0KPj4gKwkgIElmIHVuc3VyZSwgc2F5IE4uDQo+PiArDQo+IA0KPiBD
YW4gdGhpcyB3b3JrIHdpdGhvdXQgY29tcGlsaW5nIGluIGR3YzM/IGkuZSBkaXJlY3RseSBhZGRp
bmcgeGhjaS1wbGF0IGZyb20NCj4gZGV2aWNlIHRyZWUgb3Igc29tZSB3cmFwcGVyIHRvIGNyZWF0
ZSBwbGF0Zm9ybSBkZXZpY2UgYXNzdW1pbmcgdGhhdCBEV0MzDQo+IGNvcmUgaXMgaW5pdGlhbGl6
ZWQgYW5kIGZvcmNlZCBpbiBIT1NUIHJvbGU/DQo+IA0KDQpZZXMuIFdlIGNhbiBlbmFibGUgInho
Y2ktc25wcy1xdWlya3MiIGRldmljZSBwcm9wZXJ0eSBmb3IgdGhhdC4NCg0KVGhhbmtzLA0KVGhp
bmgNCg0K
