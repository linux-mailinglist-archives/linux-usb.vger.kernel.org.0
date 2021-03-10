Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47E19334803
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 20:33:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233249AbhCJTdV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 14:33:21 -0500
Received: from mx0b-00154904.pphosted.com ([148.163.137.20]:37086 "EHLO
        mx0b-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233987AbhCJTdH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Mar 2021 14:33:07 -0500
Received: from pps.filterd (m0170394.ppops.net [127.0.0.1])
        by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12AJX0xK002039;
        Wed, 10 Mar 2021 14:33:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=iMylK4T8qAMEW1Tq3iu+OlSwqMG8fobZ3eT36dccy/4=;
 b=ELMnU9xFCWDoH1WOihTC7sNVOf0t3icFLUGUL18wjakbynsCxzYb2Vkg6a1ztw4IlyMx
 w/dQvv3T8vOKfJcA2mcfFvLdX/MQkpr3QntqXTZct9594pYOfNUAf4yhoCFr5trnx3C/
 1RxyWJSliYlbzlIxhb7+4FPl3pJl77Apu9KJfD+iGbWIwl/ljjcYAJW/CebNdAOGgedm
 A4qXcwSYZtYchbHLZAVoz7zm4Kqx7xOn8ha5+wzUo4ZUX3x1zJOUk1ayzDvEkIZHFdYd
 ssGDrl252aGxU/ji3dJs5gAjRZc+YJHFI8VKu/smacDYsfrdp1nNUUcxlYdCZlDr4w8O gw== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
        by mx0b-00154904.pphosted.com with ESMTP id 37456bpswb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 Mar 2021 14:33:00 -0500
Received: from pps.filterd (m0090351.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12AJUjqn162675;
        Wed, 10 Mar 2021 14:32:59 -0500
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
        by mx0b-00154901.pphosted.com with ESMTP id 376vt1f4u5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 10 Mar 2021 14:32:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBJpsAc07HKRpZarjhbkBRp8cwFlk+N3FMFovPmQMLwIZbhYm5KurUi71fzPyI9Roly8rLEg8HrcA1m1AHK/dQyUgOaOC/3ArNqTeDPZJLNSMltEe3eTQMQWYFQp0Z2VidOSUPcP1XDK54wGi83n6qkYPEg7MKECcihhBIfLoUPPWMeAjFp1TgQckfYiSB/Sie3DFNo3kreCdd3eYvLky96NnX17d2ZrKb3wiXs9rvy+sBcUHJVIrsHCegMLMFLkwfl61LsWxdjiDtKEPEtY3Z/umxHjS9y6TmIlQbpyOHUFUgpzTgniZJHnY8tClMIiQqUUK/GRUNIYdofp+nLrMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMylK4T8qAMEW1Tq3iu+OlSwqMG8fobZ3eT36dccy/4=;
 b=OyOgSmKVk58/Zwp3snXrA9mUFMP/oj0uvtwuOFx7ygWuoj7SAWS7L8WTS2VE7aHgmgSY/QgwHmsnhSM+KCm62jHjSgRdCAVVcUNtCwYfCxDkuxFaRPgNuy0f0WAGmXyv9cEkiqKM6dpW5tyVpLcco1+sLqK7/gx7TajU4DNbsGctzLGZoPw8JJMkXRYITT8AESnUwtZb47lTNgNwVX2Mqtr2OHaGEe63hiWK/UTTZRW1PxmKhisO+FSouxbyOIUxbK/Ytf1ZRb5RudpiwTWlbXpx4QQhcdDhEtJw0Rcr5Bb5aqdMzGBjjrV2MTORUFYAGifxayaHYH2Wry26QrtFgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from SA1PR19MB4926.namprd19.prod.outlook.com (2603:10b6:806:1a6::18)
 by SA0PR19MB4428.namprd19.prod.outlook.com (2603:10b6:806:b8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 10 Mar
 2021 19:32:57 +0000
Received: from SA1PR19MB4926.namprd19.prod.outlook.com
 ([fe80::1c92:24d3:b11f:bc50]) by SA1PR19MB4926.namprd19.prod.outlook.com
 ([fe80::1c92:24d3:b11f:bc50%6]) with mapi id 15.20.3912.030; Wed, 10 Mar 2021
 19:32:57 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@dell.com>
To:     Lukas Wunner <lukas@wunner.de>
CC:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Christian Kellner <christian@kellner.me>,
        Benson Leung <bleung@google.com>,
        Prashant Malani <pmalani@google.com>,
        Diego Rivas <diegorivas@google.com>
Subject: RE: [PATCH 3/3] thunderbolt: Expose more details about USB 3.x and
 DisplayPort tunnels
Thread-Topic: [PATCH 3/3] thunderbolt: Expose more details about USB 3.x and
 DisplayPort tunnels
Thread-Index: AQHXFOrkKoHbLY6shEa7xflOErQBmqp7sfGAgAEpfQCAABBsgIAAB/CAgAADjQCAAAFrAIAAcElggAApcgCAAAvosA==
Date:   Wed, 10 Mar 2021 19:32:57 +0000
Message-ID: <SA1PR19MB49269CC8DC2BD0CE5A9B832FFA919@SA1PR19MB4926.namprd19.prod.outlook.com>
References: <20210309134818.63118-1-mika.westerberg@linux.intel.com>
 <20210309134818.63118-4-mika.westerberg@linux.intel.com>
 <YEeBt+fHt1MdyEBz@kroah.com> <20210310075444.GB2542@lahna.fi.intel.com>
 <YEiJC/oZ2ZasVtvf@kroah.com> <20210310092155.GC2542@lahna.fi.intel.com>
 <YEiSrgziexV4SNdf@kroah.com> <20210310093942.GD2542@lahna.fi.intel.com>
 <SA1PR19MB492655CA54780348D70BB863FA919@SA1PR19MB4926.namprd19.prod.outlook.com>
 <20210310184956.GA1438@wunner.de>
In-Reply-To: <20210310184956.GA1438@wunner.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-03-10T19:32:54.7585394Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=5442f137-939b-4328-a7a8-d59b80c4d29d;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: wunner.de; dkim=none (message not signed)
 header.d=none;wunner.de; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b98f8fd-f3a3-49f2-db48-08d8e3fb4f3a
x-ms-traffictypediagnostic: SA0PR19MB4428:
x-microsoft-antispam-prvs: <SA0PR19MB44288406E32440E6A29721D5FA919@SA0PR19MB4428.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hDczox2uQRAmmUqFEa4t75FjZTLqIRqecZCIPPCMCbfrSuLsa8RU8GZ32DxuxtdQaStUQpxYiv63XzK/PdS/SOn3FMrVV9RnPQDX1ATg6Lsjrd1KIWdTS/264SSEd0Smb54cEJJqbgbWEbKlS8YOpLFGjri68/Rg6CCZfS9fGPvFEV4MVWXBRsHbeg/c4wpEcE6ezIin2+DUaFBEwtDxWsWqYZwCXrdu4hrln56u5QwXDhjFvsOsNh90siZnM32/C8vxUMxYL1ly2VYh/e/ntxRSlH4x6xU8gvGpUQ9e9ylPNOTq/6egV6zrGXSoVR4Fle8EaCaKZm42gEIFw04S1/0HTZAeo4wdvDslHBuvo/4y5I84E33ZshZu1DlAyIkT9vY86GtDhB2od6V7Q1DX6m7ixChCIAHKvkLemxfrXqEE1OoUJcb28ZVXE0h8bFE8FN9oDyqp5vuPxFdAoGywhvYI/dkEDUHzr79yrAF5Q9kfYDBW3SXNugInjdZ1ltPqaQGx6xNdq0UDSuY+m8Npdw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR19MB4926.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(55016002)(64756008)(9686003)(66556008)(76116006)(66476007)(66446008)(4744005)(786003)(66946007)(2906002)(52536014)(8676002)(316002)(7416002)(26005)(54906003)(86362001)(5660300002)(8936002)(478600001)(4326008)(71200400001)(53546011)(6506007)(7696005)(6916009)(186003)(83380400001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?38cSFxNvpPXVw+VYE27y1JmZEnyoOIqrX9Fyiy3qG3MUzOWj5Gg//EWZS1ee?=
 =?us-ascii?Q?JPDPsaZlgmgImI8qWVqsD5hHljMLjEE1ky8iIwh29uuxmNwoVRVm3GpNXjlb?=
 =?us-ascii?Q?T92ugAt/SmyM6BaOgv+cRqg6h+4JoEoazWy5v6hwO6xdUKfTJgg44cQHIZg9?=
 =?us-ascii?Q?F1CYW1PPm27jmi3MPR1o2DHuxGMH4hYTd7yGMJyWMw1uTtW2KeOUBZkA3bY8?=
 =?us-ascii?Q?1d8WOLINyeUjNWncPy7v7SvjHK8EqeWqa4/UGfft/T1MZm3vb3jaPl6xlLdt?=
 =?us-ascii?Q?cJ4xU5hyachBFNxvynJ/GumGgJwgsw08etoM5X+WTuiFJrsXa7jvM+cKLZUn?=
 =?us-ascii?Q?ZG9mMDjPHXKGwqWpAfNAS0NyKSavutcBsbyQ4G2zlyAUzBZYIQ0Ao3K2otAB?=
 =?us-ascii?Q?K6rjqHZ9Xi1SVQap+gQakXcoc8e8WsntzFDgyK5HsgK3FFWhDE3XRvtsDg8O?=
 =?us-ascii?Q?NRPXlmpEExkv1xLsn9ufd9Yj6uqTIZX6Ne3baMvPYpY5tqNzGpl+mrgM4xaq?=
 =?us-ascii?Q?hl0E4cvSGzqgF1FWQpyhwjBL4sbIRqEXyi+yMwi5uiGVOiZkDa4anjnckQua?=
 =?us-ascii?Q?I2mZl2CZ7Nb6QKI+7wN4FhrPVIFB1xQflJTsQRqYIMav4j8t9LIGka41oEjY?=
 =?us-ascii?Q?K71Odmwwb2y8fYrHlmI4SQjPsyqelM26M3f/xZL6w65QiI9fo4uLZjrpSYWr?=
 =?us-ascii?Q?QfQh3ADvvxFhX2Xv27xNcM//mrydibguWw8XpuzPCRzL5q1tJGR8wEygNC1n?=
 =?us-ascii?Q?41sFx1euMqIfXQtb+ivCRBUUQSrd34K2RDe8CgP6D+4s/Iw4/oF2oQn7u4lm?=
 =?us-ascii?Q?VB7QqZ8ne0Nf54qxnbrQzdItPLvBj20LmF+w/rSZDaISSdxKUcgfn8/eqc9a?=
 =?us-ascii?Q?Wldpg8gmRQIpQq0pquGFcBWYVFAGEVsrq3moI7wEE3DI4mtwP/M+uZuESDTU?=
 =?us-ascii?Q?fO9bOiMLzt7kZs+ofNwcDRoDg53aYKaE24OANUhxbMbk2fOcH2nWSWvNA0AT?=
 =?us-ascii?Q?tXBQgjCYUhuXNbiPlBow4gjTy7LBBC83w2uyi8801FZvbH7hQB+SEdIejILv?=
 =?us-ascii?Q?DgttalkS1ViFlFPB5FJWKBoxsEaDnYo1VL1E9j0KIRX4rl573G9TJpDKjrMU?=
 =?us-ascii?Q?m+4VINmWQEHI1+Kae0cHuEYybFvE7Tgyc7v26Tual1Elw3n95LJZrVwAPYcs?=
 =?us-ascii?Q?4s7NqeTq0MYGPLzPKXvyjrMSQUkqB7elDf5/Pb/SS7mKUbqqc9a6/soWdqyK?=
 =?us-ascii?Q?DRRxVh1I4vFnof9/m8g0fC8VN3jcxEUI25YzXSvzza7jfwPVb+xKofsGd63o?=
 =?us-ascii?Q?idFfJp91UrS86jO+jCkYc097?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR19MB4926.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b98f8fd-f3a3-49f2-db48-08d8e3fb4f3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2021 19:32:57.7801
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nnC27SpS2ziQVUMmJSVrHfJ8h3scJ25Jxn09cnplsXN2O5ONyZBnaMCM1kwCZzk0qHbAp9b+NAKBC7ilx0whDJbkX2fweEdq/Mi2jxksRtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4428
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-10_10:2021-03-10,2021-03-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1 suspectscore=0 bulkscore=0
 spamscore=1 lowpriorityscore=0 malwarescore=0 clxscore=1011
 impostorscore=0 mlxscore=1 phishscore=0 adultscore=0 mlxlogscore=188
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103100092
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 bulkscore=0
 mlxlogscore=304 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103100092
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> -----Original Message-----
> From: Lukas Wunner <lukas@wunner.de>
> Sent: Wednesday, March 10, 2021 12:50
> To: Limonciello, Mario
> Cc: Mika Westerberg; Greg Kroah-Hartman; linux-usb@vger.kernel.org; Micha=
el
> Jamet; Yehezkel Bernat; Andreas Noever; Christian Kellner; Benson Leung;
> Prashant Malani; Diego Rivas
> Subject: Re: [PATCH 3/3] thunderbolt: Expose more details about USB 3.x a=
nd
> DisplayPort tunnels
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> On Wed, Mar 10, 2021 at 04:24:20PM +0000, Limonciello, Mario wrote:
> > In practice software based connection manager isn't in any production
> > system in the field today
>=20
> ... except everything Apple.

I was referring to USB4 products... but yeah you're right.
