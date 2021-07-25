Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85F293D4C24
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jul 2021 07:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhGYFFE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Jul 2021 01:05:04 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:43086 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229460AbhGYFFD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 25 Jul 2021 01:05:03 -0400
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 657C9C0DE9;
        Sun, 25 Jul 2021 05:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1627191934; bh=gtG2jElzzBAR9fhZrN7rKI4iW5TS8k43PYH2qNlVbCo=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=VGRJOIJn9zuWiewb6Jeg1X3zhxoiINE5na2vnkuyhf/Zj9hA5/+eGJKLMq1RnD8DC
         8tsCFvg17QWg0gDmg33I/RSnZqEdrRNsCGrSDSszau6N/1Xlw18vMmzK+iEx6AKe65
         z6UdBgN4gpgXldWzhQ7lb7+Dz/Va7Qp0kKKi+CB7Dxq6AE1FCiM6zHUOL7WYJ6WQEh
         b1Co6P0pBXmS00N77trr9vrau2ZGXYWeQDhzs02I4+iE9WFb62hlomMdfVRSqxj3Od
         0iMmcvPBAJCDQJLAJx7OUG/meMukJimQc/MhArAI2DKR0wH/BfE8L37QlzDbVLd7NF
         /io3z2KgJ28Yg==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 389DFA0080;
        Sun, 25 Jul 2021 05:45:33 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id C342A80026;
        Sun, 25 Jul 2021 05:45:33 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Mn9+ps/T";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fv1eVL8fJyobxCo4AwyJjZdFquLYmuCspyS7unth5B8ROaGndvCMEsPuB/x380+4269kp3fIZThCVVRvg0LNA3U+30m3ktmMeogSxG5BHBmQsUsbYmGWf3jD/5ZjHENTJLS/LZFzdXcTxaY/Nt1npcy8UHJPAXClmehbSnfaJpILpF2DfrsyAardwcr5InR9JHXCrYNmb37to5KyqYABFkPsqOfYqhqtpya0b2NJhUGN91GhH4Rg7PUlwt8JJ2lJKc9O/04ckV4D68z9ygploqVIncUzCYc1lv3WeifqoQrAAntZ0jbwCab77GPiS9NcirOcKImP9ryWlLYcGq+tMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gtG2jElzzBAR9fhZrN7rKI4iW5TS8k43PYH2qNlVbCo=;
 b=DrMZW2eR2g8MkSYDvjbmdnR319rjtSSS24Kd2KTJOK4y1cQBH1hbRw5TQDKpf9TPmy/BcJpH9rcYSBGFwFOSyLAcnmtj0rklhU71fop16zgFt+fnKheuu8TO5Xv4VREdHOKOAhV67SeJSgJpng637TLpzSePJZagvvqs3WKq5nZXzK0pl2XiZKRrRhLxSzednJWaBQXU1zC47zl28QGvvxnirzCTpU3DYH0NKeC8EQE35MMCuvPNo2f+UPPPn5thVBwEemqTMhva6Dt4MVl6NO6TrBXCzFnnS1B54d6fAtJ57Os71lfewoH71OErn3le0l/qVg2VnhqvLnNtdDpq8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gtG2jElzzBAR9fhZrN7rKI4iW5TS8k43PYH2qNlVbCo=;
 b=Mn9+ps/T/2NAwEr4K05v+wJRdjQuWMc6ygrKIAcHd13RSL1ujo9d8I9aokdiL7/IqOtxVxT6vbob/vlIH0xrK2LvfYx7Res39jvahuDk9YjkfjEwAxMcEyIr7r91QewJch8lI4dPs/+Q7pSvVCHiPNs5pXrFGGd5W4FDS1RYahQ=
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:39a::12)
 by DM4PR12MB5328.namprd12.prod.outlook.com (2603:10b6:5:39f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Sun, 25 Jul
 2021 05:45:30 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4%3]) with mapi id 15.20.4331.034; Sun, 25 Jul 2021
 05:45:30 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     "bugzilla-daemon@bugzilla.kernel.org" 
        <bugzilla-daemon@bugzilla.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [Bug 209555] dwc2 driver stops working after sudden disconnect
Thread-Topic: [Bug 209555] dwc2 driver stops working after sudden disconnect
Thread-Index: AQHXgKrwCXblXzzDAUmyVsj6mf+W3qtTLzaA
Date:   Sun, 25 Jul 2021 05:45:30 +0000
Message-ID: <78e0b168-83d5-fe1d-48d6-7e557dbb0794@synopsys.com>
References: <bug-209555-208809@https.bugzilla.kernel.org/>
 <bug-209555-208809-3WiVPMqWX9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209555-208809-3WiVPMqWX9@https.bugzilla.kernel.org/>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
authentication-results: bugzilla.kernel.org; dkim=none (message not signed)
 header.d=none;bugzilla.kernel.org; dmarc=none action=none
 header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be715759-7f48-4235-1319-08d94f2f69e4
x-ms-traffictypediagnostic: DM4PR12MB5328:
x-microsoft-antispam-prvs: <DM4PR12MB5328F1D3FB70E3369B2D46A7A7E79@DM4PR12MB5328.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2EeEoPJzET2gVjMqb0KSnxcRz9g3c6w/ulab+9KP0yet0cVybPyUZ1994V5W+jhC4e/6TWjGcrJ3HfpODaQf6riI71Cy9xR4xyUXGbvMrZDc238d27aMblYrlj+7NX4HY+HAp56TDDfpDgJSiy0TW6AFHl2aqmnwk+76RXFbfOyNI4Xh7Eqbg6Qe06aur/3IFZKm9nXZ8vBdcdR9A3AfUi2rP2LiWRqpNxgv6nlHuRqNFey2rx86Sebj9ZP7Us+Q3ZQ46qOkmhb5ad86OKb6HFl8NcDdcujnGkL1p7sGMrD9jJ9AMfsgkPkOP4U7Hi7SZifpCH8Dk5PZlJD+azW5GGQC7sNGp1gPCxm9OsAoNgFCKMgJB7r7mk5X4u7UwCSXzFrmlmt9Uv+U9FfwnGbl4DTZFGv22RGr/Ci4dU/pariZd90E7xv3iuStL4mCT0LonOXADmlQWec+VFL2EpXmb53TmYEZeT73Mn1sIVu5M4t1funQyZBpelQOJfFBx6Dvwsk9TmZx7bAsPl3oRQB1hTpMkwb0j0HY+HhPxrj/bcuxsCX1pWQSCe3vm/XrXyNwXPmLwn6rkx9qxhbejeGErJAPikXyU0+3bJHrT7jM7XhVfPy7JWOAWE/LULIWdkuG6kOxmja3x4Zdt9DczakEYFqPPnR6R8KbUDztkqDHOstzHOJtlGZSYME0V0zhBNDtOGbH53dyxQTSp0K0myzIWeoqRnb/ficWHAdEcQkea2Iwmv6QgnJ9s5MD1YRq+6lGDeIa1vqf5Wo8pABHo10rLH76a9jz+oyvsvdi5Q1vWdS4bmIRZNpvrMBKMiaoRh4E8inK45lL227fVJDgH5VMwzL/JOBoqxUR6Q5B0B8WiWk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(346002)(39850400004)(366004)(136003)(6512007)(45080400002)(6486002)(71200400001)(966005)(31686004)(478600001)(83380400001)(36756003)(2616005)(110136005)(38100700002)(6506007)(31696002)(53546011)(8936002)(316002)(186003)(66556008)(66476007)(66446008)(64756008)(122000001)(66946007)(91956017)(76116006)(86362001)(26005)(5660300002)(8676002)(2906002)(38070700004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDhlL1FzUzgxUFhaSTFrT0pFSkhDMFpyUW56M0pDN1JvSFFSK1RLRms2TklI?=
 =?utf-8?B?Umxyc3N3VGxmWS91azJucGNDYUNKcWlOa0o4YVhDRVVaa053OWE4Nm0yK2Iy?=
 =?utf-8?B?djExVUNMVEppTHlaUHJCeStaYjNJaDM0dmoxZHh4a3hid0l3SDdkendqUjdL?=
 =?utf-8?B?V0NWRnU0RGtSUlJibWFwa1RnM29vOHlGaFloV0theTBtUVlZKzJoQ2pmM2hJ?=
 =?utf-8?B?ek04WUttQWdtNFFBTUxJOE9FWWgvVlVOd2RRdjFyMGZsNHdDTlVQaFRiLzZr?=
 =?utf-8?B?OTVPbGpUcmNORkF5VTc4SHFRRTZURkRGRUdycndxUWdBQndnc2VMUGxkeUli?=
 =?utf-8?B?MDF3NnNZVWtEcWtMT1NsS2dGU2tMa2lQaXRRQ1lEMXlRWEpaVEpRdzhUcEkz?=
 =?utf-8?B?L3lqTmd5c3c3MExGZDhjcFRDdEZxcDVzL1N2cU1uTE9peW5PTFZYNWtBOWJq?=
 =?utf-8?B?QXJobWQwMk5XOWxod0hQM1RoazhSQVdZd0R6OGdsUlBZempMMC9RWW0xeWRv?=
 =?utf-8?B?RzV2Nk9ubzd5TlVHYWxkQWx0YllXM1JkZnY2M0kwSXArenhQWHRpMmE2ZjQx?=
 =?utf-8?B?WEZJb2NpbmFqZHNCSzVqMXJCRDdldTdzYS9acVJ0SDMxeTVJYXB2bWM1b3NT?=
 =?utf-8?B?U2JrWTQzYjhVRHBuTXQ5YnFuZk05ZHoxTFBxNVVsdzZLS1pPNHU5eVVZQ08v?=
 =?utf-8?B?UW1hbDZOQU4xQW1XSGYxQlRlODQ1MWgvaC9TWlFJRjJwd2krZ0JRVHVobWpH?=
 =?utf-8?B?cXFPY1lXSHhoSTZaZ1kydXphaEN4QzJhb0NaTXdJT21qeFBpNFlmcGt0WlVB?=
 =?utf-8?B?aFlpemw0VnExZTBnQmFDeHAxZ29UcDRaNVVrV1AvcTgzNjFMYWI4UUNBNm05?=
 =?utf-8?B?RkJnc2dFcWo0a0JHQVlzeVFxQ1p2MGMzTEszeHNYZ1FKNENtVHBoU2FVZTgy?=
 =?utf-8?B?R0RmWEdZSkt0dEZsbUhGakw0eDB0ZFJTUzY5eVAwRG9xdnBoNzZ1SDdFRVRS?=
 =?utf-8?B?OEcreWVuMit6cVpGRVBOZ3krcU9IQTE0QVZmbHNvci9lcUpZRGU5Zk9Md2o5?=
 =?utf-8?B?SlBsTkgwSnc2c2VPSkg0aTE2Z09ZUUwyMjhZM0dDVXphVzJCTWdrZlRXbUo4?=
 =?utf-8?B?dGFhQXlBQkxUSkNvczRNeGUvVzZOcmpnektBQkJ4clpBRUFzdUlLY0loY0Vl?=
 =?utf-8?B?UFROUzg3MHBrbWYwbmFkNTcxYXdYWHRjZkJkSXErU2YvakdNQmZqU05MNEZC?=
 =?utf-8?B?YldoMHBuQVJJSVZVbkhYMkJMbzBrdnZBZE5yWUo0ZlJSVXo3a3RvVzRsZmgy?=
 =?utf-8?B?RDNlaHUzQmEzQmpkZjhNU3FaR25JcnBuNk5HbVphdnUrcU9ZdEZHVEhUdWR1?=
 =?utf-8?B?UGQ5MHZuN0lHVkR4MnhSajR4d24wbjVjL1U2TkFCd25OT29qNk5Ed1lyN3Zv?=
 =?utf-8?B?aVVTbDhqSTI2T0Fmamw4cHV2ekJsOWljdUpTZ1RiYkhNWXVvWDBkZm92ZDB5?=
 =?utf-8?B?MWdMdThnSDVINVZwbDJnK0w4ZmJpVlA1ZEl0bTUrckNDeENndisyYTQrZ1ZT?=
 =?utf-8?B?Y2htSFpncjNuY1VJU3JhQkZxdHJXUXh0b3JTTUFxY2ZiNmxPM1hDTjYwOXhO?=
 =?utf-8?B?SEdYSno3Njc3TlovQWpTKzZkYW1paFVNR056b0ZickZnazNoOXpwVmIvQWJN?=
 =?utf-8?B?ZTlNcitMOVZHbmFOSTdwL0Z3RXN6LzRFQTJXU2MwRGh5QmhIZVZRL0hlRG1l?=
 =?utf-8?Q?oPdlEBnhfrwpdZutEw=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <85E5EE0F12110A48990254FB44CFB9A5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be715759-7f48-4235-1319-08d94f2f69e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2021 05:45:30.7799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DEeEf3Hilcfqm1TqRNU+Fw4QOjasfTbeHEjmN95BhbFUgbtOdgoObq26xsYh/4QINiI27A85GafrsdYN+YjPSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5328
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCk9uIDcvMjQvMjAyMSA4OjQyIFBNLCBidWd6aWxsYS1kYWVtb25AYnVnemlsbGEua2Vy
bmVsLm9yZyB3cm90ZToNCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vYnVn
emlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjA5NTU1X187ISFBNEYyUjlHX3BnIUwx
QzV2MFkwdUxhSFlHWUJlUjhIY0V1UnhURFQ0NFE3QncyWUFCRy1PUnFLZGJETDBzbXMzNDBmQlJt
U1NTSC1abzdyNzY1WiQNCj4gDQo+IFl1bmhhbyBUaWFuICh0MTIzeWhAb3V0bG9vay5jb20pIGNo
YW5nZWQ6DQo+IA0KPiAgICAgICAgICAgICBXaGF0ICAgIHxSZW1vdmVkICAgICAgICAgICAgICAg
ICAgICAgfEFkZGVkDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gICAgICAgICAgICAgICAgICAg
Q0N8ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHx0MTIzeWhAb3V0bG9vay5jb20NCj4gDQo+
IC0tLSBDb21tZW50ICM2IGZyb20gWXVuaGFvIFRpYW4gKHQxMjN5aEBvdXRsb29rLmNvbSkgLS0t
DQo+IEhpLA0KPiANCj4gSSdtIHVzaW5nIFJLMzMwOCBSb2NrIFBpIFMsIGFuZCBleHBlcmllbmNp
bmcgYSBzaW1pbGFyIGlzc3VlICh0aG91Z2ggbm90IHRoZQ0KPiBzYW1lKSBvbiB2NS4xNC4wLXJj
Mi4gVGhlIG1lbnRpb25lZCB3b3JrYXJvdW5kIGRvZXNuJ3Qgd29yay4gVGhlIGZvbGxvd2luZw0K
PiB0ZXN0aW5nIGlzIGRvbmUgd2l0aCB0aGUgd29ya2Fyb3VuZCBhcHBsaWVkLg0KDQpGb3IgNS4x
NC1yYzIgZG9lc24ndCBuZWVkIHRvIGFwcGx5IG1lbnRpb25lZCB3b3JrYXJvdW5kIGJlY2F1c2Ug
dGhlIA0KcG93ZXIgaXNzdWUgcmVsYXRlZCB0byAncm1tb2QgZHdjMicgcmVzb2x2ZWQuDQo+IA0K
PiBXaGVuIHRoZSBob3N0IGlzIHVucGx1Z2dlZCwgdGhlIG1lc3NhZ2UgYnVmZmVyIGlzIGJsb2F0
ZWQgd2l0aCB0aGUgZm9sbG93aW5nDQo+IG1lc3NhZ2UgcmVwZWF0ZWRseToNCj4gDQo+ICMgWyAg
IDIzLjIxNTY3NF0gZHdjMiBmZjQwMDAwMC51c2I6IGR3YzJfZmx1c2hfcnhfZmlmbzogIEhBTkch
IEFIQiBJZGxlIEdSU0NUTA0KPiBbICAgMjMuMjE2NDQ4XSBjb25maWdmcy1nYWRnZXQgZ2FkZ2V0
OiAyMjAgRXJyb3IhDQo+IFsgICAyMy4yMzE2NzddIGR3YzIgZmY0MDAwMDAudXNiOiBkd2MyX2Zs
dXNoX3J4X2ZpZm86ICBIQU5HISBBSEIgSWRsZSBHUlNDVEwNCj4gWyAgIDIzLjIzMjM4Ml0gY29u
ZmlnZnMtZ2FkZ2V0IGdhZGdldDogMjIwIEVycm9yIQ0KPiBbICAgMjMuMjQ3NTI0XSBkd2MyIGZm
NDAwMDAwLnVzYjogZHdjMl9mbHVzaF9yeF9maWZvOiAgSEFORyEgQUhCIElkbGUgR1JTQ1RMDQo+
IFsgICAyMy4yNjMwMDBdIGR3YzIgZmY0MDAwMDAudXNiOiBkd2MyX2ZsdXNoX3J4X2ZpZm86ICBI
QU5HISBBSEIgSWRsZSBHUlNDVEwNCj4gWyAgIDIzLjI3ODQ1OV0gZHdjMiBmZjQwMDAwMC51c2I6
IGR3YzJfZmx1c2hfcnhfZmlmbzogIEhBTkchIEFIQiBJZGxlIEdSU0NUTA0KPiANCj4gQW5kIGlm
IHdlIHBsdWcgdGhlIGNhYmxlIGluIGFnYWluLCB0aGUgSEFORyBtZXNzYWdlIHN0b3BzLCBmb2xs
b3dlZCBieSB0aGVzZQ0KPiBtZXNzYWdlczoNCj4gDQo+IFsgICAxOC4zMzI0ODldIGR3YzIgZmY0
MDAwMDAudXNiOiBkd2MyX2hzb3RnX2VwX3N0b3BfeGZyOiB0aW1lb3V0DQo+IEdJTlRTVFMuR09V
VE5BS0VGRg0KPiBbICAgMTguMzMzMzc4XSBkd2MyIGZmNDAwMDAwLnVzYjogZHdjMl9oc290Z19l
cF9zdG9wX3hmcjogdGltZW91dA0KPiBET0VQQ1RMLkVQRGlzYWJsZQ0KPiBbICAgMTguMzM0MjY1
XSBkd2MyIGZmNDAwMDAwLnVzYjogZHdjMl9oc290Z19lcF9zdG9wX3hmcjogdGltZW91dA0KPiBH
SU5UU1RTLkdPVVROQUtFRkYNCj4gDQo+IEFuZCB0aGVuIHRoZSBrZXJuZWwgY29tcGxldGVseSBm
cmVlemVzLCBub3QgYWJsZSB0byBldmVuIHJlc3BvbmQgdG8gYSBrZXkNCj4gc3Ryb2tlIG9yIG5l
dHdvcmsgcGluZy4NCj4gDQpDb3VsZCB5b3UgcGxlYXNlIGFwcGx5IHBhdGNoICJbUEFUQ0ggdjJd
IHVzYjogcGh5OiBGaXggcGFnZSBmYXVsdCBmcm9tIA0KdXNiX3BoeV91ZXZlbnQiIGZyb20gQXJ0
dXIgUGV0cm9zeWFuIGFuZCB0ZXN0IGFnYWluLg0KDQoNClRoYW5rcywNCk1pbmFzDQo=
