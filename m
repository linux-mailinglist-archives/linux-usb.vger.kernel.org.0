Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84A323D4C87
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jul 2021 09:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbhGYGnQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Jul 2021 02:43:16 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:45042 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229519AbhGYGnP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 25 Jul 2021 02:43:15 -0400
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9BD80C0DEA;
        Sun, 25 Jul 2021 07:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1627197826; bh=Jn5pqGW2NRrbIfX8GxxYd88FwHp3aiMvma6Pk0MJK2c=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=Vzmxu+VyEuGYpdswWwrLLtD2ObScM585iDygznUN485mCZX5UCl+bAGw/G27/zmnB
         JNUS1oXD6ixXs7rr4URURlO47GBIHqqLPhPruvBLBAUZ1YrZfps+FUz+wsweiyYI6r
         fofNykMSMa8Royl9EhFoCsnOnTnFmoatYNbOuUfn2b5gqC2HRlVOYpj8LQKjWAYQNx
         KQ356Xa2zSeuJi8jk3aPppatP0Cd8klPFrqgYuW0HymanuccJWTltjIPmowMFiOHlL
         fK9EnY93YEXj3rj+2kYZtMBDO8ppZW+y389WU9mZX+XTiojDZGOovWt+BawVkO1U5I
         zjMulb3q/UCVQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 6ADB9A0092;
        Sun, 25 Jul 2021 07:23:46 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0E6DB40131;
        Sun, 25 Jul 2021 07:23:46 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="PbS7KD8p";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxcN8t96mzR9bcAth66WUUZiTEOrGpy4Ttvfl7vYEDVX3uqQvYlRng2ILhfW84HD9qQ+X5Hqm/muxi9s6Vn7XT3RiyMqIA4tkUU08nOVudJwtZrbOANS+k/BkcpSrqk1lWqT7waw4tAlRYb3oqyboNjO7QjEx7xw2E20OXQdVsmQvvfB8CsR0kLf5A+sJMd0baqjWu2vmOj71oZ3tCeZvfrA/c9P0s0lSRVaq8nEldHqZ4vvDji+MaEdB04mL1d50T5VLeVoEL2hAejja7WiF/OCcegMwsolfyUmqCOp4n8ZsPr6HhWPWLpL5/sI8mRDCXZSD70PVN9Jpy91K/DJDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jn5pqGW2NRrbIfX8GxxYd88FwHp3aiMvma6Pk0MJK2c=;
 b=Ua7GSHzJkzELMmGTN9NUv+d6CQzT5iCVTNdid+ZjC8YxteMr3/f8PzBeWYnpyMwPyNVQUPJNu+5ztMchYeHO/Fl1luaAi3rif5nri4j3kGef0FHxPmWM+jba+XOsAGQg8XChaluZ9DMXCIONk78G3OZ+zSHlbdFzi311LylMx49Abc5KVVDbJOvYhfdsm5fPa0yvlaDUEDBAsI50V+QS0m+Q2k4vOoqZ1BLoLo5shpbsFC4YaBH04iDLwownIi++o4k+EUyOwkDkrmqVN7TPj3bk4YE2oklgfpHqxzs+vYxXhCx0+KzqFJoZmGCRZ8yhlR1iSYhRVyctNZ8WaO//Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jn5pqGW2NRrbIfX8GxxYd88FwHp3aiMvma6Pk0MJK2c=;
 b=PbS7KD8pCy6jmImr8lTKdkQy5C1+gUXWseIFlo2AnSbYS6ZUBDABnvXWSSkwxk94CJ7WPaT79IOPG0/EZpvLlKA2VZkbj/t5bMv7qtYAp3J/EWqeIDBNFtc0qpUidJSnPG63gfB+OHCf5oT9TMNHHRaoZc7uynYq3zB9q65mI6o=
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:39a::12)
 by DM4PR12MB5039.namprd12.prod.outlook.com (2603:10b6:5:38a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Sun, 25 Jul
 2021 07:23:43 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4%3]) with mapi id 15.20.4331.034; Sun, 25 Jul 2021
 07:23:43 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "bugzilla-daemon@bugzilla.kernel.org" 
        <bugzilla-daemon@bugzilla.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [Bug 209555] dwc2 driver stops working after sudden disconnect
Thread-Topic: [Bug 209555] dwc2 driver stops working after sudden disconnect
Thread-Index: AQHXgSIsBUGvpr7+tUCBLjob+sgcOatTR9UAgAAB5AA=
Date:   Sun, 25 Jul 2021 07:23:43 +0000
Message-ID: <70604051-fc16-212a-a4bb-ff6c1361aa3e@synopsys.com>
References: <bug-209555-208809@https.bugzilla.kernel.org/>
 <bug-209555-208809-J4J377hoS5@https.bugzilla.kernel.org/>
 <dbe446ed-c4aa-4297-7735-45d2d634a4d8@synopsys.com>
In-Reply-To: <dbe446ed-c4aa-4297-7735-45d2d634a4d8@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7134815f-ed49-4476-745a-08d94f3d2219
x-ms-traffictypediagnostic: DM4PR12MB5039:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB5039AC86A62AE8290BF1A99BA7E79@DM4PR12MB5039.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P9bena5jDQw4ffaQni2c1of1XfB1/9s/PT6jHDrrlsB/2f0WibpQx9N8f/+HLh5PVBkq5KL9OKkYb9mV5f9oPU/TywtCT9bM8N54rR+ozGgbi6ngZxAHfEiqI8jXMgaSJzfrf03Y+ByGmXYJUg3ky/UL2Bhsfl281DVowmASOGkyL7JIRLiI8Q1sXIS0qJ/KqyQHvQ7Gn7AEuOO9A2h0gWBg4y+9Oz2W1fKNBuNS9bIeR0RBlbRf3TY0jzOIpX+EcA6KJPlyO/2O6kCr07pWxdQXU+44UMIJYvW+xxa2ez1bk986hEkAg/yK8POzthAa3vpoyRHa3YSifEr/YNN10xnomes+oIZxntl27UfdLv8nYBvQVVVvyhyxBCNzavmXj1vpZL7FZJVK4PUz7BhcTJg6BsNHMa+iHblqYjenG4JEtTRh4r+ZQEhIKuL0P+6bQrEqqOh+aBlVo5YtDCj/VAtgtn6T4FTUO4e2kP7/emUY9zYGmYm5HH3jjTypYpf8SUjU6hjDJtgUobYlX8Y4smnAuq9yrMRraj1nQ8mN2iwXDWAYuLhq+eLJHM+8h8UsZg0euthWiId610aH5wkE1FbV26yeooXTC8SIZ7IYLSK8et9L0VcMrxJwtOgPBT3Kw80+4wFZv3OpAjgKELjbiXjCpZKJ+kiT19/iEvYgekodFSv8qWrWGcY2hi5LHc2a6rhuscIY17EO/1hpLnNDBWlt40dPqc3sC4Q0/6D5pC+AQGkk3Fik1u1j95ry5RQ3Jp0R1FGrUo1Ze0NUFi12Fu6JtCA66W1UzCLl79pzsp026Kw40sKVED9rwQWFmkt9eSQFn7vOwj2B+LfMyLM+Bz1dwwdpEX3cseSFJf88azY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(39850400004)(396003)(376002)(110136005)(478600001)(31686004)(966005)(2616005)(36756003)(31696002)(6512007)(6486002)(26005)(53546011)(316002)(45080400002)(8936002)(8676002)(186003)(86362001)(6506007)(91956017)(122000001)(76116006)(2906002)(38100700002)(66556008)(64756008)(66476007)(66946007)(83380400001)(5660300002)(71200400001)(66446008)(38070700004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sk9JN0JubnNOUXdwY1FrV1Y3b2ZudEd5MFpiNUhuQ1hYK1ZUQWRZb3hycjRy?=
 =?utf-8?B?dVRmY1ppaS9GZk1FaVNDaytvQnZUdkVMUHpuaTFWOEZ0NWtpZWdNWjUzU2sw?=
 =?utf-8?B?azVLM1AyaVAvYjNOQUxDZlhlZEdMRFIza0VtakRHSFIrZDRNVHVZTE9JMUFI?=
 =?utf-8?B?eXdJOVozZFNER0UveTE1S3pOOUpNQnJJa1NxV0FoSzRtOGY4V2xKRWN2WUMr?=
 =?utf-8?B?aENYaEt2d2ExKzZJQlNMUnRxRFVDQi9XdCt6bHo5ak01czIwaFFNbnBjc0gx?=
 =?utf-8?B?a3dyUGNpSW55dDJCNkpSM3MrWWZhSkt5cFJuQzlHRTg0Y2h3am9MWWZnUHFq?=
 =?utf-8?B?SUZwdzkwZUZGSVQ1WFZRbHpjbjB4QTV3c0xXRCtBeVZjWmtZZU9IR29tQzBO?=
 =?utf-8?B?UzBYQS91VHpQZFZvclcyTUIxTjBNS2VxR2FURWlPMUNJbk1oL1ltWGdpanoy?=
 =?utf-8?B?dnRqSGFhVkFHdFFDN0FPV3NVZzl1NTJOcG9Ob1BTSG1rL3NQc21LOFM5cjhE?=
 =?utf-8?B?ZTMzMkpSNkZTbUd0TE1VQWNZQXNFcHNwOWVyT2VJdlRSaDRuQjhXNjZUdUJu?=
 =?utf-8?B?d3BxR3pUZHRrWUZrOFJZdGtwTWVZSUZJczJweWxSVTgyTHBsbGk1N2FaY3NW?=
 =?utf-8?B?eTNoSlNubStZZzUvcE1MVXNoaU5lMHNXRWE2SDRaeklQQTArbkVIV2ZGK0Ji?=
 =?utf-8?B?emN4UXVybGg4SlBPYXl2V3QvdkNRbElxM0pvT29LSE9ZTHdiOVcyQ003aVRw?=
 =?utf-8?B?bkFTRm5qSUY0cEhZTFlTc0tWYzJCSjZ3eGZQWHV2NmR5NWo1K3c5ZXRQeDZW?=
 =?utf-8?B?dkg3WEdjQ1h0V2l2VjBzY3lLdDYzRmRiWE0vaStqY29VS1lCSDg2eThLdFhV?=
 =?utf-8?B?aklrNll3UHV3aVZ0UkNYcVN5NDBYYVZNWUZEbmhaVmNLT0ZUbjlBWkVEYnhn?=
 =?utf-8?B?K1h0emdIQ3ZYSGpEZ3ZXV2U4ckUrRVQ2THFqa01IZGJVZnpiblhEQVV3QjJx?=
 =?utf-8?B?dXIvRU1QNzNGNzlVSXd1MlRCampxZ3I3WXZxQitKR2t0bEt2clc4enNRaFRX?=
 =?utf-8?B?VTYvQ2pKYlNqYTJaaEdCcGJFTW9mbWsySFJEb09Cc0o2QnB0WFBNUUZ2Rks5?=
 =?utf-8?B?djhBRUFnUm5xd1VZQ3d5WXZFM2dMRjVNS0h6cHpkaVE5MVBYekwxbTNEQ3VE?=
 =?utf-8?B?cG96WW1lSGVnQXl0b2RFZHdLWUtFMTBrSGZLaE1OSEtaZEFMa3l3Uk4vaUZV?=
 =?utf-8?B?eXBucFN1Y2xlVTlWRzlMM0dRMXlWdHhSSXk0UXhOdi9nVnNwUThkU2V2RzIx?=
 =?utf-8?B?SmNEVGRZRXVqWFJDSFJ2UkVlbUg5OXNnT3RJc3A4aUZOcnFhOEIrSUF5SDVI?=
 =?utf-8?B?Y3BXZ2tOV0VBaElqR00wcUpvVUFoZVBJczZxc0FiTUNCejQwVUN4UDVkUnll?=
 =?utf-8?B?YWJSOFkvajRFaUFRalEreU56UlVJNUgxOW5LL0FyYithWEpaQUZRckNLdXVY?=
 =?utf-8?B?ZGVWTXUrajFpcFc5aXd2THFYbUVhdHpncWk5N3F5TSs4YjlYcUloOVNodHlJ?=
 =?utf-8?B?bDR4eEtpSTlrc01qN21udHRWV1RWcXVnc0ZzOWVwVjB0WnQ2Y21EOUFmOFhV?=
 =?utf-8?B?WmlVTTlRYWgvNnNJZ012VUtGZzczT3ZJakZWb09pemdVVzJEQ1cwMTRJRVIv?=
 =?utf-8?B?UlJxRmJaaVpMS3pESXRCaXNmM0JjWmJ4eE5ZZDdzMUVBdFQwMnZGRC9QVzk4?=
 =?utf-8?Q?LSR2Ft89VmI4ynkVLQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <97C6FB1F9E406044B5B5ED0F1F92AB79@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7134815f-ed49-4476-745a-08d94f3d2219
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2021 07:23:43.2890
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4OlsJDovsqfDhtnE9b0RendMly2o8dwaJ7HBHZkS8KIfV23a1qiv+p84ZYsvWqwSbaa2mqHqgFOX4AIgG/QW8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5039
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gNy8yNS8yMDIxIDExOjE2IEFNLCBNaW5hcyBIYXJ1dHl1bnlhbiB3cm90ZToNCj4gSGkgWXVu
aGFvLA0KPiANCj4gT24gNy8yNS8yMDIxIDEwOjU1IEFNLCBidWd6aWxsYS1kYWVtb25AYnVnemls
bGEua2VybmVsLm9yZyB3cm90ZToNCj4+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRw
czovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIwOTU1NV9fOyEhQTRGMlI5
R19wZyFMNmRscGhnMDM3NWJ4MUZGN0lFQ05SblNpSXY2ZV9zQ1E1ZTFvb1l2Y0NreVR0ZS1kRVFw
MnJ5OFJ5b3BSWk5VZG5MYVFwU2gkDQo+Pg0KPj4gLS0tIENvbW1lbnQgIzggZnJvbSBZdW5oYW8g
VGlhbiAodDEyM3loQG91dGxvb2suY29tKSAtLS0NCj4+IChJbiByZXBseSB0byBNaW5hcyBIYXJ1
dHl1bnlhbiBmcm9tIGNvbW1lbnQgIzcpDQo+Pg0KPj4+IENvdWxkIHlvdSBwbGVhc2UgYXBwbHkg
cGF0Y2ggIltQQVRDSCB2Ml0gdXNiOiBwaHk6IEZpeCBwYWdlIGZhdWx0IGZyb20NCj4+PiB1c2Jf
cGh5X3VldmVudCIgZnJvbSBBcnR1ciBQZXRyb3N5YW4gYW5kIHRlc3QgYWdhaW4uDQo+Pj4NCj4+
DQo+PiBIaSBNaW5hcywgVGhhbmtzIGZvciB5b3VyIHJlcGx5IQ0KPj4NCj4+IEl0IGRvZXNuJ3Qg
c2VlbSB0byBtYWtlIGEgZGlmZmVyZW5jZSB3aXRoIHRoZSBwYXRjaCBhcHBsaWVkLg0KPj4NCj4+
IEkgZW5hYmxlZCB0aGUgZHdjMiBkZWJ1ZyBsb2dnaW5nIG9wdGlvbiBpbiBtZW51Y29uZmlnLA0K
Pj4gYW5kIGNhcHR1cmVkIHRoZSBsb2dzIHdoZW4gSSBwbHVnIGluLCBkaXNjb25uZWN0IGFuZCBy
ZS1wbHVnIGluLg0KPj4NCj4+IFRoZSBsaW5rIHRvIGxvZyBmaWxlIGlzDQo+PiBodHRwczovL3Vy
bGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8xSUQzYkRw
NE5BNnZTWGY0QXFOOHcyV2lEaGFGYm5iNTkvdmlldz91c3A9c2hhcmluZ19fOyEhQTRGMlI5R19w
ZyFMNmRscGhnMDM3NWJ4MUZGN0lFQ05SblNpSXY2ZV9zQ1E1ZTFvb1l2Y0NreVR0ZS1kRVFwMnJ5
OFJ5b3BSWk5VZHAwNEc5bVgkDQo+Pg0KPiANCj4gZHJpdmUuZ29vZ2xlLmNvbSBub3QgYWNjZXNz
aWJsZSBmcm9tIG15IGNvcnBvcmF0ZSBsYXB0b3AuIENvdWxkIHlvdQ0KPiBwbGVhc2UgcHV0IGRl
YnVnIGxvZyBvbiBidWd6aWxsYS5rZXJuZWwub3JnPw0KPiANCg0KQWxzbyBwbGVhc2Ugc2VuZCB5
b3VyIHBhcmFtcyBkdW1wLg0KDQo+IFRoYW5rcywNCj4gTWluYXMNCj4gDQo+PiBBdCBbICAgMzIu
OTY0NDY5XSB0aGUgZ2FkZ2V0IGNvbmZpZyB3YXMgYm91bmQgdG8gdGhlIGRldmljZTsNCj4+IEF0
IFsgICAzOC4wMDI3OTJdIHRoZSBkZXZpY2Ugd2FzIHBsdWdnZWQgdG8gYSBQQzsNCj4+IEF0IHJv
dWdobHkgWyAgIDQzLjA2Mzc2Ml0gdGhlIGRldmljZSB3YXMgZGlzY29ubmVjdGVkOyBhdCBbICAg
NDUuNjQwMzc4XSB0aGUNCj4+IGRldmljZSB3YXMgcmUtcGx1Z2dlZC4NCj4+DQo+PiBBZnRlciBh
IHNob3J0IHBlcmlvZCBvZiB0aW1lIHRoZSBrZXJuZWwgZnJlZXplcywgbm8gbW9yZSBsb2dzIGNh
biBiZSBvdXRwdXQuDQo+Pg0KPiANCg0K
