Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 566E036E225
	for <lists+linux-usb@lfdr.de>; Thu, 29 Apr 2021 01:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231807AbhD1XZ5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Apr 2021 19:25:57 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:50512 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230075AbhD1XZ4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Apr 2021 19:25:56 -0400
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6390BC00B7;
        Wed, 28 Apr 2021 23:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1619652310; bh=iLMsltI49/9/ICUecLrlbULpNc/r3+vlrJIjEri5O/M=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=gVE058eIEwggiEM7k9wMW3Sr/9s8Cb2gfDk6q6pI2TnaJ0aRm6fLqzedMPf/BLksU
         a4s5f6ydEUAwZ5BCppQFrsaK1WVTsPVUWubPXVnk1UhN31MCaQyOykwbaGNw+gr4v2
         poysA4M4P1XkIe5cIhlY+LzfoX1RqUdf3BMhzVz85AQAja988LcneftD5d1hrnQmlo
         7lJLORndvBtQkYaz0dQglrd8+5/p/mQA2wV+WZVUIs0FGUiErAvjY/2P/WjLNNCAjl
         g7AaImKq4i4KLwdiM+5b/a56fPhcTTe7wPui0HbnMgBlpWA8Okd/sGhx7EZEfrFhVE
         BC4JzXcfq4DLQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id A439AA0077;
        Wed, 28 Apr 2021 23:25:09 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2043.outbound.protection.outlook.com [104.47.56.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9C23A40131;
        Wed, 28 Apr 2021 23:25:08 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="oYg6HgPK";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krzLWC+QLHj2zxh9I5B7X38LENG6gm5EJNRYICrg0B3nuocf66dLxvPaF6Ki59cjkjXjeTzduxvtPX4DfIYyXeM8CIH/75+1cZ8fxlrbhaOuwOywajxXSmYrZ8OT8HMunKCfiiU5witwSh1HW7B8nBR7btys2YHU0UIzWgaQiMkCYyonDmUXDAhueN8EPQu1wWXDUcT/+bvaLZ3R7EHY+C/ePm+AZo2Oq2JMAeZMRk1OmeWEJi5iFExth+hU/N6qsowxnX/Z8396+00//ZzAwNNz2a5yJ6r6YhJ6jJssWMJV+0/E2pYgePI3LHlMBrRHO6ot7INT0idHdLMib/uFtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLMsltI49/9/ICUecLrlbULpNc/r3+vlrJIjEri5O/M=;
 b=iISCJGS+UrY2AnpGbVmptnKrc68kXOQuAiUJHc1YMB/4cSPrYnzsYGO6APQgkWoB5uR6Z4IcGiuFZba5K8rzASh0matGSRRa1Z7Mb6NvFqI5YHBHBIJ0cl4hLqSvyc10+tAlpUFKDwl89CqIeeIPgys7jIq2y+7jJF6YIdqWMqi3xpjXBi6ekr6HXgr39ICHMAQa8e/cFiCpCq3InI2JfN0C6N7ULuL//iQpEEJMHOIPbJKIZ+mC89S0H9HUpfiga6P4/tXxJKjULBI02+tigS6sL+XKnItQ6lOszAX1vW/tgWzO39CTQ8gi6ujdOUJAYh93/ivlK0uFA9qhgbeOJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLMsltI49/9/ICUecLrlbULpNc/r3+vlrJIjEri5O/M=;
 b=oYg6HgPKPwn1zSqB6heR+A+N8PNZlpb1qJbfSxJTBFLv0PXGGBIvYYbZDXGDKm+9yoRedusCcGGUI7rg9ObpAxcGSnWU8jCeXM62Kj7nIe4EIqoZH3CiHrny4L88kjeHynWagu3eqhcsa3Pm0GNCL8tjAfaBLvkFAa3frv2fsAU=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4209.namprd12.prod.outlook.com (2603:10b6:a03:20d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Wed, 28 Apr
 2021 23:25:06 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c%6]) with mapi id 15.20.4087.025; Wed, 28 Apr 2021
 23:25:06 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Michael Grzeschik <mgr@pengutronix.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 2/2] dwc3: gadget: fix tracking of used sgs in request
Thread-Topic: [PATCH 2/2] dwc3: gadget: fix tracking of used sgs in request
Thread-Index: AQHXNu+9eF7qglWLLkOrzqiL1Cef+6rAXlSAgACdCQCAAKd/AIAARdUAgAANY4CAACI/gIABPhqAgAAPfgCAAEv0gIAAY/OAgAOkbICAARsxAIAAXO+AgABikQCAAQihgA==
Date:   Wed, 28 Apr 2021 23:25:05 +0000
Message-ID: <04126a67-136d-41ee-dc21-b46eaeb7ba19@synopsys.com>
References: <20210423102738.GD6975@pengutronix.de> <87y2d9l0a2.fsf@kernel.org>
 <20210423131807.GE6975@pengutronix.de> <87k0osksgo.fsf@kernel.org>
 <20210424091206.GF6975@pengutronix.de> <87eeezlrvm.fsf@kernel.org>
 <68ae9066-b349-ba70-59c6-c2388b386b66@synopsys.com>
 <50e13b71-bdc1-6279-a224-bfc99cf10dc8@synopsys.com>
 <20210427201232.GG6975@pengutronix.de>
 <144ed647-86f3-3aee-8ea5-2c8e4d02e2f9@synopsys.com>
 <20210428073756.GH6975@pengutronix.de>
In-Reply-To: <20210428073756.GH6975@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6fd52f38-804f-4528-0b46-08d90a9cdb63
x-ms-traffictypediagnostic: BY5PR12MB4209:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB4209B0BB846CFF33E2E64A97AA409@BY5PR12MB4209.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vP8gQq8tlIqQcM5gtEvNd0avcy0riWQDn7i5EA9ypjGE+a6BVdpYM8Wt1kdMHqhh80YN/seoIQRPOKSc/oITqNRmU0xfiqUa2fD2BQ41ky1riTKHnFVs0NokjxNsU1Nk1qxusAlGQ5EgboNAoeA7SAmxW5U7RMxLR3Idt2WYIVzGsXfF/Sw3h4W/vwlMhshmiNN9lbOWvs6oK25+qNl671w35ufccqHV82YxURhECN4X6scjEHOdFYwjOns+QC9DVT4cMiwysuqCiAg5t6Yjw67N84UTjSgCNLS2s/u9Hdh91viIrGoubfzYQsAKyzXnAKmWss30U9R+AhQETMxs5WyyR0CJQYRNXAHs9sYk28qU0iSIbanyhPA+Fc1qfxxIyXfaHynj3/CTYxDjTxTiQsP7HXEDdSLFBMDhCmkyXowme4YDuV40slst0qM3mLAMeLkcQlbKDWhPHFkXYw/41xYtMFu6bp2S2ebz0aPm7xA+YIPVz0BchozISaSWQwyrS0xTTVwo4rSG6VtgqxMPLj6T4LfvTT+uNM3Qpyl/99V29LMyZucyt+uyKeyOL/ogX+AVZyjMyFech0aItprDpyxZB7/3gexezo9wDmPEbZN0dL+fAZTaQTUfHnWD/FKZlHFrCZUDUT37lxRhyTYlmxNqK8ly1AQj16+Lcq+zNzRGINs6/zvZHtFOmiqCBC14
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(39850400004)(346002)(376002)(366004)(36756003)(6506007)(8676002)(186003)(26005)(31696002)(122000001)(38100700002)(6486002)(31686004)(64756008)(2906002)(6512007)(54906003)(316002)(4326008)(2616005)(71200400001)(110136005)(76116006)(5660300002)(86362001)(8936002)(83380400001)(478600001)(66946007)(66556008)(66476007)(66446008)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?iso-8859-15?Q?JLWgepK1OEfq8HmnfGBklgF9jM/zRhYDcugf0gX1/G7SHiiJK9/ijI+JC?=
 =?iso-8859-15?Q?INGSBjiU43HAosRFmulKSEeI7P0hMtPwp6fRH7nr91Hy3Ls1TqezYpERN?=
 =?iso-8859-15?Q?goQ2INxFyT404sGVUYF32bhs+V2SsLEzBdXFWif2UsS7TEjAvBnVcyyIh?=
 =?iso-8859-15?Q?s7Oa1+fag3jV9IFRMqWojJE1+MBEJcFBiYsHDgPVnaLDPv8xiC6zmSsxP?=
 =?iso-8859-15?Q?Ez4V0dx/smbK64iCgd2dqF3e4BD5Ufw1EpuMzksRGzyVYffCAex5lKG+Q?=
 =?iso-8859-15?Q?qGl5v2wmnM56wUjfU0mx99xojrrdkGnN0PoVJAsJzOIAmjAF2V9BQbYfG?=
 =?iso-8859-15?Q?zcM/YkHKtJNfPstDgEA/3HnwLg09wc32cGcUGXrziL2SqMifX/7+HcFfG?=
 =?iso-8859-15?Q?7Lq2iqflIXfho4KNmTyUS8eGdojr9IjFIR4JR19RTyGiLSLZjVkPc7HiA?=
 =?iso-8859-15?Q?Qd1o87tfHAyQccjuE0JKNoM6bP+V6oDPNjGAMhc4FwRnMi1ozGjM0J24u?=
 =?iso-8859-15?Q?1Od+Fk+EEnVFHGFcDVUiTM8QMEH17IW0E72IJ2gPfSJ/a5M14XvQI45sT?=
 =?iso-8859-15?Q?ExDjRzTHIkhFvf0tl2hc4IvM83ZzA9cr4RREbtfqCb+rTqOiRF6ubIz1b?=
 =?iso-8859-15?Q?Qn5m7OApsvZJNiNYXcUJJAy53mCjd3FLY+wsvkFaUlF1a1FLpMrBbn/s8?=
 =?iso-8859-15?Q?+VyMTrt1AnrxQknPDpr8XRudyjfAUb0B7wDbxcBuUkYZ4yaXnhvBFewyl?=
 =?iso-8859-15?Q?iI4a57gTAO0E1sCPeIDEiXsTUqgiGPsdmZY5mSnEdqstATMPyGksDQQqY?=
 =?iso-8859-15?Q?k794Sw/I273vvYPbgcrlqnFV4v7Wwjs/H1jckF3nYYxmi+7EKvi3HZbzN?=
 =?iso-8859-15?Q?Zn6yZA7dwvGB2mo9rAwuw5aO/7TSaxQhlR6xJh0OEW9e6jpnfKekM/0iH?=
 =?iso-8859-15?Q?XvQ6mtF2M019nSaROs63DzqSiDjnXY/7meQuMqY212SqauxCajhWqDfKL?=
 =?iso-8859-15?Q?YptBkMKkpNgCWRkTFh3jrHM6eRlmKXA1XRj5YDCa7WTfwXI4hFEwB0kTb?=
 =?iso-8859-15?Q?0E4ZyhzkL5/dFxqN5+z5qd1Y68wgi6hQ/n39JxvTNxznJe28GqfRzsFrQ?=
 =?iso-8859-15?Q?niUV1DEYXasW5YK/gZ5MkA6zxbYVrQzfRrcAD9wlEk6YwGx7zr1L/YRzf?=
 =?iso-8859-15?Q?eC1tWE65qfxaF3wsJnqeBIa/zYeGEnuNUIo7U1d9JQZWOQiir6BNZUlFr?=
 =?iso-8859-15?Q?Py/H4UfemXWyF6slp4+i/wOmbIiMIrJTaa2p1I54OP2DWF2Tdvmj2+eZ4?=
 =?iso-8859-15?Q?GOcYQ7f+c4+dq/VYUxYJuvEZy9ux2SiWfweUaRTziEh3TJ6Lip9E6EFPM?=
 =?iso-8859-15?Q?3LnE9ol5ewDhxjiDv4Eobheu8NaC1vV+H?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <78956B2938D55D4CB751A0C8362CFA57@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd52f38-804f-4528-0b46-08d90a9cdb63
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2021 23:25:05.9704
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ogMX7ei5h3UgJOdASkPhd/9gAD5mxate40xJaWIOxiQJLFsHkhz19UTXPEEnYi8g50PfZvNos3WljhY7nebGbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4209
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Michael Grzeschik wrote:
> Hi Thinh,
>=20
> On Wed, Apr 28, 2021 at 01:45:11AM +0000, Thinh Nguyen wrote:
>> Michael Grzeschik wrote:
>>> On Tue, Apr 27, 2021 at 03:18:57AM +0000, Thinh Nguyen wrote:
>>>> Hi Michael,
>>>>
>>>> Thinh Nguyen wrote:
>>>>> Felipe Balbi wrote:
>>>>>>
>>>>>> HI,
>>>>>>
>>>>>> Michael Grzeschik <mgr@pengutronix.de> writes:
>>>>>>
>>>>>> <big snip>
>>>>>>
>>>>
>>>>
>>>> <bigger snip>
>>>>
>>>>
>>>>> I think I see the issue that Michael reported.
>>>>>
>>>>> The problem is that we're using num_pending_sgs to track both
>>>>> pending SG
>>>>> entries and queued SG entries. num_pending_sgs doesn't get updated
>>>>> until
>>>>> TRB completion interrupt (ie XferInProgress). Before the driver queue=
s
>>>>> more SG requests, it will check if there's any pending SG in the
>>>>> started
>>>>> request list before it prepares more. Since the num_pending_sgs
>>>>> doesn't
>>>>> get updated until the request is completed, the driver doesn't proces=
s
>>>>> more until the request is completed.
>>>>>
>>>>> I need to review more on Michael's patches next week, but I think wha=
t
>>>>> he suggested makes sense (in term of properly usage of queued sgs vs
>>>>> pending sgs). BTW, please correct me if I'm wrong, but we do modify
>>>>> num_queued_sgs.
>>>>>
>>>>
>>>> There's still some issue with your patch. I think this should cover it=
.
>>>> Let me know if it works for you.
>>>
>>> This works for me! Will you spin a proper patch from that?
>>
>> Sure. I can do that after 5.13-rc1 is released
>=20
> Great!
>=20
>>>
>>>> Note: this however probably needs more "Tested-by" and reviews
>>>> to make sure I'm not missing anything. I only ran some basic tests,
>>>> and will need to run more.
>>>
>>> You may already have mine:
>>>
>>> Tested-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>>
>>>> Let me know if this makes sense.
>>>
>>> From what I understand about the issue and the purpose of all
>>> variables this makes total sense to me. So thanks for taking over
>>> and make a proper solution.
>>>
>>> Thanks,
>>> Michael
>>>
>>
>> Thanks for the Tested-by.
>>
>> Btw, any reason for using SG with transfer less than PAGE_SIZE? I assume
>> your platform is 4KB, but you're splitting your 3KB transfer to smaller.
>> Was it like this before? Note that DWC3 has a limited number of internal
>> TRB cache. But what you're doing now is fine and doesn't impact
>> performance.
>=20
> It all comes from the limitation of the uvc_video gadget. Look into the
> patches I send to support sg in uvc_video driver. It just maps entries
> from an sg list comming from videobuf2 to an req->sg list. In
> uvc_video_alloc_requests the req->length will be set to req_size which
> is calculated with:
>=20
> =A0ep->maxpacket(1024) * maxburst(1-15) * mult(1-3)
>=20
> With maxburst =3D 1 and mult =3D 3 it currently reults in an req->length =
of:
>=20
> =A01024 * 1 * 3 =3D 3072

I wasn't referring to this, I was just wondering why uvc uses SG.
Correct me if I'm wrong, but isn't uvc allocates and uses contiguous
buffer? Depend on the setup, normal request may show better performance.

>=20
> This request will use one extra sg created from the uvc driver adding
> a header of 2 bytes per request and then has 3070 bytes left for the
> payload which will look into the vb2 sg list and increment every sg
> entrie with the the used offset until it reaches sg page boundaries
> and in that case will have to add one extra sg.
>=20
> So this results in the funny patterns you see.
>=20
> We can increase the req->length to 46080 with a maxburst of 15 for usb3
> but I did not try that out yet.
>=20

I wouldn't recommend that. Unless you know you're using both DWC3x
device and host, most other controllers we know cannot handle high isoc
throughput, especially at bInterval=3D1.

BR,
Thinh
