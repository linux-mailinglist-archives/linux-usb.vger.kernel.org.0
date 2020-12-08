Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C88CB2D320C
	for <lists+linux-usb@lfdr.de>; Tue,  8 Dec 2020 19:23:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731032AbgLHSWm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Dec 2020 13:22:42 -0500
Received: from mx0b-00154904.pphosted.com ([148.163.137.20]:15652 "EHLO
        mx0b-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731001AbgLHSWl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Dec 2020 13:22:41 -0500
Received: from pps.filterd (m0170396.ppops.net [127.0.0.1])
        by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0B8IBl8G015717;
        Tue, 8 Dec 2020 13:21:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=aIpLCShtFGKM5gkTirBOruPRO9a8yVDW7QpnNqDXCFY=;
 b=xAhcYXmk0S/8mz1ZCD/jHxNYBar8oo1FAhYBMUPQddw72ydu7FE7x4jcNnr7F+eo3C7v
 o/zBWznV9pmENgY/dDUExcsJRjsBO3F9NPZ4m49rG8esCA9XsIsMg0apjMFSDZ7VioRF
 M7Bq9jOWK/vd/qPl/EO8qvWK+DiCMY0ZUWCLdvKrrfg0OVMvYre1UDIgQlwWlAHatNQ5
 KygPDZtZmmKwi/s0e5nLIjJsZHC+Va8byYh4A+8PMcoH/TeXrcQDri8vNF8z1xQjxEiG
 K4gWSN6Ub/TFGm8yq8c+dQhRVBfW8jb9wqZslNUqdWmrHceW+gBjjhwJNSeEWl1lxayQ ZQ== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
        by mx0b-00154904.pphosted.com with ESMTP id 358b6nk3dx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 08 Dec 2020 13:21:52 -0500
Received: from pps.filterd (m0090351.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0B8IGblx180525;
        Tue, 8 Dec 2020 13:21:51 -0500
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
        by mx0b-00154901.pphosted.com with ESMTP id 35abtj4wa2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 08 Dec 2020 13:21:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXBnBBG+mH+1HHpwUzULJ8qi++5oTtpxh6K3kPPRKrjVhZuiL0GwMcAb64O2rq6SVaxkZv+7uEAeSaKFEKKV3ZU0y4Tu7sAOy1MErHYDFkzO2oieh+ixGjNmKnmdgceGgak/5+rAzEHBpaWgtC+OrWdRCRNcSwmxjJuX5po6YJyBDwCWHRS//Y5fqPz6ZWuHjSGZRo8tDsKu0b2MbIwikT1k9Qkq2P0vKCiwyMcgr5+bfpM6R/QZhZhFxeRCXIQwvidS2BPWTNCD3s+yt1tY1WZICjaVi37ejVPB4Sd/386lMDKiPSroY15NifyVz12k7eTrbO+Ss9jolPjLfPvcUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIpLCShtFGKM5gkTirBOruPRO9a8yVDW7QpnNqDXCFY=;
 b=Ww6UFEwSElCeN5sCMm90tpy5CTm4I4ha4LrzlrMaHnHwT7Jtvd9b/rKAPNvIjXVml2UmAJk9t9ktmGizCvmP01ico5Rq/NxK4eOOZ4XMMRgQ1lPiJBMlOQVVmr07s+I7cNqn/IAgCF4PmlHJBDjFhLC+hbX3EmbQPN+6PANwMfyGtiPnTYiahBPTSiFBP+zBLN8FV9tqCqNqI1xu/0Wz0585JLKmrJB5HRcO0VBZVQPVSzlgYnmQMO4bbNNzQ71prkdZNufOibVPRLTSttxVx1faOGNUxtt5O0cDo0ls9WeNkk4N3k9VdhEOUAL3rb8+pWmG8V6gqWV57ewE0ecQPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com;
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIpLCShtFGKM5gkTirBOruPRO9a8yVDW7QpnNqDXCFY=;
 b=MNZsgaC3EfktTFZqlp4oOaCSFr8K4aVI6pPQV7rsynioj9ej/LaiiYeks1WPDRuYcq4u/lrX7/uHvSZaFtxKYb1eVBQSHpd2Vqy0uEbfNozcOCZl6Dim68Kn+V/twHrayqH/0WHRi7fqJvaBRw3Mu+Qm1tO215JOu2ZvmJHTNYU=
Received: from DM6PR19MB2636.namprd19.prod.outlook.com (2603:10b6:5:15f::15)
 by DM6PR19MB4027.namprd19.prod.outlook.com (2603:10b6:5:248::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 8 Dec
 2020 18:16:16 +0000
Received: from DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::8a8:3eb2:917f:3914]) by DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::8a8:3eb2:917f:3914%7]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 18:16:16 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@dell.com>
To:     Paul Menzel <pmenzel@molgen.mpg.de>,
        Greg KH <gregkh@linuxfoundation.org>
CC:     Mathias Nyman <mathias.nyman@intel.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: RE: usb usb1-port10: disabled by hub (EMI?), re-enabling...
Thread-Topic: usb usb1-port10: disabled by hub (EMI?), re-enabling...
Thread-Index: AQHWzTqxyBNgWTpTm0efZbxXQhI2mans5egAgAAIbQCAAI8ucA==
Date:   Tue, 8 Dec 2020 18:16:16 +0000
Message-ID: <DM6PR19MB2636B65562B4A768A9629E94FACD0@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <c8408e58-8bc3-dbe7-2a99-1b1f0d3eae21@molgen.mpg.de>
 <X89ABDFgyjpQPeRq@kroah.com>
 <8c5d6edd-d41b-0d86-e0ea-d1a1689625de@molgen.mpg.de>
In-Reply-To: <8c5d6edd-d41b-0d86-e0ea-d1a1689625de@molgen.mpg.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-12-08T18:16:09.0670132Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=b024fe22-088f-486f-9865-ad755c7721b8;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: molgen.mpg.de; dkim=none (message not signed)
 header.d=none;molgen.mpg.de; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a50ac524-2b79-40b8-4823-08d89ba55a8d
x-ms-traffictypediagnostic: DM6PR19MB4027:
x-microsoft-antispam-prvs: <DM6PR19MB4027C68CA94CF61ED0C816A4FACD0@DM6PR19MB4027.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BVFb+XHVoWGE+irtp1TOofMoxkFhM/nyHWijla8uFZN/hquSz/tAyhRo/ulgpsb3Dae8W5n8cclkrkKGSyV0a5/f9MVS59Trd0YyvIRqmIB8LN5RRd54y3S0Mf1/i4oQQnkHv76b0skvIw4DMCyyOgx7YW94OM4H6W/VPNVKI6xMYoDuiGW4In9NvHIyOX1tGiLNh5pCpcxNqyXJZ2xp8Xlp4TvDFnhMGlL8NLCbN841yt9bFX5M/sREgwNfGt193J3c3lIghCehLjKVX7oBs4kBIWR0VMdLOElhIxbe3ITp9263tyGOlaIc3fBMhQj5sqeUWf1AhN/AyUpfTkt9HDfHo/lTuahDbyhnph5WKjmA1S0+VQ7QAF0y9WnA0fhLMkFsAalFslWiI/gkxUmEwA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR19MB2636.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(346002)(86362001)(186003)(64756008)(9686003)(966005)(786003)(5660300002)(16799955002)(4326008)(71200400001)(54906003)(66476007)(76116006)(110136005)(6506007)(66446008)(26005)(66556008)(66946007)(2906002)(55016002)(33656002)(8936002)(8676002)(83380400001)(52536014)(508600001)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?WW8wSjE5dE5wcERtaUY4WDlZMmpHa2hzajFaTHBEQlNzY24wSnp0clJpbGtJ?=
 =?utf-8?B?WDJMeXpETEtsNHhHdnYyMVNJN2pQdms0WTBFUFd6OEJ6ZUk0NGcwSnBjbGdt?=
 =?utf-8?B?N3NmTFhOd1dMQkxtYVhKK2t6RXlHczc4dFRYK1ordmdvTzNrY2t3eXJ4VXlO?=
 =?utf-8?B?U3VwdkYwdkJBTGx4UHE2bTd2MkxwQzYrTkFsL1RNbHl6NU5qbkw2ODVhZG1v?=
 =?utf-8?B?Z0wvY21vcHJnbE54bW9QMnVoSXJrVWl1dW5lVWJscU1XRXNoYVY5c1kwcUQv?=
 =?utf-8?B?NlEvVjZYQ1BEQU1yYW9pREcxVWF5Y3ZFM1RGdW5KZzZEZDRVQTR4VXpyU0tT?=
 =?utf-8?B?WnlOZ1ZHRHdBK3M1VU9CTms0UU5vSE1rTlRwS2s5WHFLcEErOEZMa29pa282?=
 =?utf-8?B?Tk1QT3VLVytCbVlrZU5XcG5MZ09tU0VZaVN3Q0JraVRBUGZERHJVM2ZOSk02?=
 =?utf-8?B?dVNBS25RUUh0ZnpWNDBvTWVrU0pBWUFnYVBycUU2Tzc0RjIvQXlNaTVpN281?=
 =?utf-8?B?b05Kc1MzK2Q1WFdEZUduTWF6N0R6SXF0NW1SblorUlpSTGxOV3RCY1UyNGVD?=
 =?utf-8?B?V1AybjNDWnF2M3ltMjQ0eFdySFhLTmp5TnhzaE1ZU3o5SVh4cVlabXNMYTZi?=
 =?utf-8?B?bE02MTJrOTBQMnBFTFV6TmZvYXRKcUo4N1ExeXpOUnVYMTVCdG91Z3ZZYnNk?=
 =?utf-8?B?dDBmaTIzLzNxMmFJME1GQ1Azbkk5MVZIbzlGQlJObko2eGVIaTZrTG03Rnk4?=
 =?utf-8?B?K0xDL0pIQmZONW5XZ1AvQW15NS8zUkgrbDFwUXNTQXloYlFlcEp2eVpyU2tj?=
 =?utf-8?B?TlFEaURiaXhubEpqMXc1QUljRk1Fd3hpQzFGb1p4T1c2V3VJZTlSelJtOHpY?=
 =?utf-8?B?N2crb3hRaEJWZlFQdlhvWkdCck1xd1N3aXZYUmFQbkdvbmprOTVhZEhqZEZz?=
 =?utf-8?B?bGwzZWZyVkxTVm5QWStyQ1Y4UHVwS0ZpajEzMFVBZ3NnMG9Qdkk5TERHbzU3?=
 =?utf-8?B?QmhaTmRwLzNlQ09GWWdWWHVsYS9IUHFab1IzeU84QVdOb3FZWnJIdld3NWdI?=
 =?utf-8?B?YzZaNGVSUEd2VjNZWWd5T2RRS3pKK2NQekE3YndBdllycWVabU1nTjRjcklX?=
 =?utf-8?B?N1ZwM0xHUjg2VTF1dncyNkVwZ2NvVGdFSGk1SjRoQmRrNHpUZU1IV0V0U0RL?=
 =?utf-8?B?SlFqMm8yR09PVk9pTXFaejRJald3bitjeEhGdVM3eEVqZUtsdzNMSWplYStL?=
 =?utf-8?B?SWQwME92QlF4ZGIvR1p6VzNaSzd1T3ZRYzdwaDZIQnVjVHM4aVJyM0I3ZS9z?=
 =?utf-8?Q?Q+tdGn6gNlCOk=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2636.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a50ac524-2b79-40b8-4823-08d89ba55a8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2020 18:16:16.2753
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MI+ZjVIwyVW/AYm/Sw5msJS1ra9asNCW///68wnv8tjVVvCRmO1gPt9PiCK9gt9L/cjAOb4j73MUlikEdNk+7JD0I80U8cvQFZ9d0KSedUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4027
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-08_14:2020-12-08,2020-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0 mlxlogscore=910
 clxscore=1011 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012080113
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012080113
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiA+PiBPbiBhIERlbGwgUHJlY2lzaW9uIDM1NDAvME0xNFc3LCBCSU9TIDEuOS4xIDA3LzA2LzIw
MjANCj4gPj4NCj4gPj4gICAgICAkIGxzcGNpIC1ubiB8IGdyZXAgLWkgdXNiDQo+ID4+ICAgICAg
MDA6MTQuMCBVU0IgY29udHJvbGxlciBbMGMwM106IEludGVsIENvcnBvcmF0aW9uIENhbm5vbiBQ
b2ludC1MUCBVU0INCj4gMy4xDQo+ID4+IHhIQ0kgQ29udHJvbGxlciBbODA4Njo5ZGVkXSAocmV2
IDMwKQ0KPiA+PiAgICAgIDNhOjAwLjAgVVNCIGNvbnRyb2xsZXIgWzBjMDNdOiBJbnRlbCBDb3Jw
b3JhdGlvbiBKSEw2MzQwIFRodW5kZXJib2x0IDMNCj4gPj4gVVNCIDMuMSBDb250cm9sbGVyIChD
IHN0ZXApIFtBbHBpbmUgUmlkZ2UgMkMgMjAxNl0gWzgwODY6MTVkYl0gKHJldiAwMikNCj4gPj4N
Cj4gPj4gYXQgZWFjaCBib290IExpbnV4IDUuNiB0byA1LjkgbG9ncyB0aGUgZXJyb3IgYmVsb3cu
DQo+ID4+DQo+ID4+ICAgICAgWyAgIDk1LjUyODE5MF0gdXNiIHVzYjEtcG9ydDEwOiBkaXNhYmxl
ZCBieSBodWIgKEVNST8pLCByZS1lbmFibGluZy4uLg0KPiA+Pg0KPiA+PiBFdmVyeXRoaW5nIHNl
ZW1zIHRvIGJlIGZpbmUsIHNvIEkgd29uZGVyLCB3aHkgdGhpcyBpcyBsZXZlbCBlcnJvci4gSXMg
aXQgYQ0KPiA+PiBoYXJkd2FyZSBlcnJvcj8NCj4gPg0KPiA+IFllcywgaXQgaXMgYSBoYXJkd2Fy
ZSBpc3N1ZS4NCj4gDQoNClRvIG1lIGZyb20geW91ciBsb2dzIGl0IGxvb2tzIGxpa2UgaXQncyBJ
bnRlbCBCVCBkZXZpY2Ugd2l0aCB0aGlzIHByb2JsZW0uDQpodHRwczovL2xpbnV4LWhhcmR3YXJl
Lm9yZy9pbmRleC5waHA/aWQ9dXNiOjgwODctMGFhYQ0KDQpEb2VzIEJUIGFjdHVhbGx5IHdvcmsg
YWZ0ZXIgYm9vdHVwIGNvbXBsZXRlcz8NCg0KQlRXIEkgbm90aWNlIHRoYXQgeW91IGFyZSBzZXR0
aW5nIGF1dG8tc3VzcGVuZCBvbiB5b3VyIGtlcm5lbCBjb21tYW5kIGxpbmUuICBQcmVzdW1hYmx5
DQp0aGF0J3Mgbm90IHRoZSBkZWZhdWx0IGZvciB0aGlzIG1vZHVsZS4gIElzIHRoaXMgcG9zc2li
bHkgY2F1c2luZyB0aGUgYmVoYXZpb3I/DQoNCkFsc28gSSBub3RpY2UgdGhhdCB5b3UgaGF2ZSBh
biBlcnJvciBsb2FkaW5nIGZpcm13YXJlIGZvciB0aGUgZGV2aWNlLiAgWW91IG1pZ2h0IGNoZWNr
DQp0aGF0IHlvdSBoYXZlIHRoZSBsYXRlc3QgZmlybXdhcmUgZnJvbSBsaW51eC1maXJtd2FyZS4g
IElmIHlvdSBkbyAtIG1heWJlIGl0J3MgcmVsYXRlZA0KdG8gdGhlIEhXIGVycm9yPw0KDQpbICAx
MDUuNzQzNDQxXSBCbHVldG9vdGg6IGhjaTA6IEZhaWxlZCB0byBzZW5kIGZpcm13YXJlIGRhdGEg
KC0xMTApDQpbICAxMDUuNzQzNTU4XSBCbHVldG9vdGg6IGhjaTA6IHNlbmRpbmcgZnJhbWUgZmFp
bGVkICgtMTkpDQpbICAxMDUuNzQzNjMzXSBCbHVldG9vdGg6IGhjaTA6IEludGVsIHJlc2V0IHNl
bnQgdG8gcmV0cnkgRlcgZG93bmxvYWQNCg0KQW5kIGxhc3RseSBpZiB5b3Ugd2FudCB0byBjb25m
aXJtIGl0J3MgYWN0dWFsbHkgQlQgY2F1c2luZyB0aGUgcHJvYmxlbSwgSSBiZWxpZXZlIHlvdQ0K
c2hvdWxkIGJlIGFibGUgdG8gdHVybiBvZmYgQlQgaW4gVUVGSSBmaXJtd2FyZSBzZXR1cC4NCg0K
PiBUaGFuayB5b3UgZm9yIHRoZSBjb25maXJtYXRpb24uIE1hcmlvLCBkbyB5b3Uga25vdyBpZiB0
aGlzIGlzc3VlcyBpcw0KPiBrbm93biB0byB0aGUgRGVsbCBoYXJkd2FyZSB0ZWFtPw0KPiANCg0K
SSdtIHNvcnJ5LCBJIGRvbid0IGtub3cuICBZb3Ugd291bGQgbmVlZCB0byB3b3JrIHdpdGggdGhl
IHN1cHBvcnQgdGVhbSBvbiBhIGNhc2UuDQoNCk15IG93biBvcGluaW9uOg0KSSB3b3VsZCBzdXNw
ZWN0IHlvdSdsbCBoYXZlIGEgYmV0dGVyIHJlc3VsdCBpZiB0aGVyZSBpcyBhIGZ1bmN0aW9uYWwg
aXNzdWUgdG8gc2hvdy4NCg==
