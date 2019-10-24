Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A23AAE32B7
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2019 14:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502105AbfJXMr5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Oct 2019 08:47:57 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:54514 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2502083AbfJXMr5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Oct 2019 08:47:57 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 604F8C04B0;
        Thu, 24 Oct 2019 12:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1571921276; bh=P4/YnlfYqUPRr34t5iLWNhDOvvbJuZKs0jXBl07HxwQ=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=OzJMJFKnERzdTat/Rlox3in8HWPX1sn6hehr5U5IlhO5JyxAgnsFybR2iSNeWExBY
         huXGnllhdlpv2J2BwQk3jXW2frcHqIKHCm/7X0f8nvc3szG81h+H9Osndeoln+xFUj
         1q1hWJBnfw2Cym3jzau8V2264tumFpZph0ltvFofZ84kiQCpgV/SJl69A0W+oULdKi
         kOxxTI2GDipJ3TYLoDbYfuqDCtaLJnlylBvXJRwCK0LredpgOprYSC+cf+Uvbu5VmE
         zvw4uWpX9pwYKmNn7qMH8G9vRC6NWXVh3o2rfSIliduyECYvq81E+9/YI6OlWwTnnx
         ruX5yjV0F7tDg==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id AFD53A0066;
        Thu, 24 Oct 2019 12:47:55 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 24 Oct 2019 05:47:03 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 24 Oct 2019 05:47:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJfMqfFrT1Qz2YmRpUe5iGgwC5A0mG891apuRq8Al3Q1z4mxNOw+nbOcyzsDNlYvoPPRFR0uaTvlLTrZj3GKTOMnUq9/aSYWkpdCDt+tK7uMaYx1752p3PuS5VBCqohv2y1/rDH1zT+DTn9ZjogIKQn15zMyuf6vz9yASyTFJ3mjoo5V1uVfmfnYUtmfNOWjrV+na47L1/ClsC7SHDsNYRqzXFU78uN94jyi2nzoKRswRYU2Dtc4YIheWkROtMYf9r5+n1eF/tJYVyWOVTtcEdIgHZ6wRj8+fEquEM1ktGyv2MG3FgqmN/Wwz44memH1nkxirRu8OHStPVsmsJ9+eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4/YnlfYqUPRr34t5iLWNhDOvvbJuZKs0jXBl07HxwQ=;
 b=kVBEdGwy+bjVMkLqdR2xJHjc++oFkH7NNUFKK7Vsda3GJB5CySJcWSGNGLQdhGUu5/FJAtTA+R8pK8KeOmgakNgf71xDahD83YwREcCmCIvdHvrLE9G8y7IO4SouwdZm2eF+zdTP+jMGa/JfejVAP3KKApDfbHstzLjVQH7uuzs/dZ6faFv8x+vJPqL6WmcCf5FSk61ka+F+Zx4IxrcHxyknB54YJETjwrlk8JMT3FSaTy+c0pSQeeCsyclFGVkGsUDRa4rOVhBNuyVdX2/81zGutOeYqzcuw6RX4vFEQ90VXdDPL+dWWiql879EEVuMmFRLLHrgzNMvmqVNfEKN3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4/YnlfYqUPRr34t5iLWNhDOvvbJuZKs0jXBl07HxwQ=;
 b=UfRkDpJVe1vfiW7DiD7VwJwo3lpEmOmjp5csTRZZBHReeg0aktX7QJuuHY+p6gl4Ph58D0UG3MET8qj4ihqmU7/Vp/LNlRIwZuqDtKtR8lkSTGUVHZV4GP+h/s8u8aBgMBkfh+4RQNbHLZGd3nEOWozj1uCzrsSR3TOX+pWd4Tc=
Received: from MN2PR12MB4093.namprd12.prod.outlook.com (52.135.51.203) by
 MN2PR12MB3392.namprd12.prod.outlook.com (20.178.242.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Thu, 24 Oct 2019 12:47:34 +0000
Received: from MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::85e4:7eb9:af8d:8a9]) by MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::85e4:7eb9:af8d:8a9%3]) with mapi id 15.20.2387.023; Thu, 24 Oct 2019
 12:47:34 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: Re: usb: dwc2: Re: Maximum packet size in dwc2 gadget HS mode < 1024
Thread-Topic: usb: dwc2: Re: Maximum packet size in dwc2 gadget HS mode < 1024
Thread-Index: AQHVijUBxoK/MK6P90arc2M4mai0sadpvf8A
Date:   Thu, 24 Oct 2019 12:47:34 +0000
Message-ID: <926c3136-1979-4df7-0afb-a91df9a2ab01@synopsys.com>
References: <3496ebef-c3b6-d884-8bd8-fed48e875b10@ivitera.com>
 <52dc70dc-86e4-c47a-ae49-1f201b066b2e@ivitera.com>
 <97fed6c8-e780-021f-4f93-64701a14bc3f@synopsys.com>
 <60def6a9-89f3-d7b9-4bc1-2f1a7a5ce769@synopsys.com>
 <deb8918a-14f5-ca3f-53d5-0d99d406fc3c@ivitera.com>
 <79aba6ae-befe-878e-cc17-e1fde9ac6a80@ivitera.com>
In-Reply-To: <79aba6ae-befe-878e-cc17-e1fde9ac6a80@ivitera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hminas@synopsys.com; 
x-originating-ip: [195.10.9.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63ff6929-3f07-46fc-0428-08d7588057b8
x-ms-traffictypediagnostic: MN2PR12MB3392:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3392FF28952B7271A7BDFFADA76A0@MN2PR12MB3392.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0200DDA8BE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39850400004)(366004)(136003)(346002)(376002)(189003)(199004)(52314003)(31686004)(58126008)(65956001)(65806001)(66066001)(316002)(6116002)(3846002)(6512007)(2906002)(110136005)(305945005)(8676002)(256004)(14444005)(5024004)(81156014)(81166006)(8936002)(229853002)(7736002)(486006)(6246003)(66446008)(71200400001)(478600001)(14454004)(76116006)(25786009)(64756008)(66946007)(36756003)(91956017)(71190400001)(66476007)(76176011)(2501003)(99286004)(102836004)(186003)(26005)(6436002)(86362001)(6506007)(53546011)(6486002)(31696002)(2616005)(476003)(4744005)(446003)(5660300002)(11346002)(66556008);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR12MB3392;H:MN2PR12MB4093.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V6CgPwMyLbsbpoHnu+zl2+DEn/qx17ZwF+v9mEFb8V55dKDkY0I7rXeTAljlrvHPNLMO4HnSWdA27O6jdgf0enliCsz5Caxyqgb9dcEC+l6vJwV6WACCpRQVe4FxPDqg2xALEywifJbJ5CwHuJZYAuZKtvZwvtaM1NSLFwNeIhpe3alD92kJL7O9er0R3ig78mPsTwaidcETdupQcRdOOS01bWTyoLZXQXJoq460GwCdc3EEO7OkzKY3KCVrHPiTeJR3qWuT9ueNHXLAXhCZiUw9uyyA5023saqaB+pqdhjKTYwA1fytmCtr2+dA75cbkUUxYDs9XTM5FkwHGhKmxXXU1UJGff7QLLsGL7u8V0Qm3RRUgG1jdf1UVFQvF3cnLV3bx8qkO/pldkoZhI6mCUrGe9xA2jsBrGQH/iTxlDBKSH3uWJAGP+y8gWI/6kla
Content-Type: text/plain; charset="iso-8859-2"
Content-ID: <34D1D9EDEA9C1A44ABA792A4723A1B89@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ff6929-3f07-46fc-0428-08d7588057b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2019 12:47:34.5536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sHKgEQH1hErQpDQSn6y9Cwerhv0r6zeH3YuGKNBtv7ro3ZiPS0fdZ6fLA2sIQh367fJUr1fZzAPG/UIdSSNY3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3392
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Pavel,

On 10/24/2019 10:33 AM, Pavel Hofman wrote:
> Hi Minas,
>=20
> Dne 13. 10. 19 v 20:39 Pavel Hofman napsal(a):
>> Hi Minas
>> Dne 11. 10. 19 v 9:45 Minas Harutyunyan napsal(a):
>>> Hi Pavel,
>>>
>>>>
>>> Could you please send regdump and debug log for failing case.
>>>
>>
>> Thanks a lot for your reply.
>>
>> Attaching regdump-960bytes.txt for 32kHz/16b/15ch both playback and=20
>> capture,=A0 bInterval=3D4 in=20
>=20
>=20
> I do not know if the debug info was sufficient. Please should I provide=20
> more?
>=20
> Thanks a lot.
>=20
> Best regards,
>=20
> Pavel.

Sorry for delay. I haven't enough time to investigate deeper.
This type of issue depend on timings: packet sizes and board DMA=20
performance.
Anyway, could you please elaborate:
1. 960 bytes case. Is it high bandwidth transfer? I mean how many=20
packets sending in 1 (u)frame?
2. Could you please print hsotg->frame_number in function=20
dwc2_gadget_handle_out_token_ep_disabled().
3. No any chance to record USB trace?
Thanks,
Minas


