Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11C91368890
	for <lists+linux-usb@lfdr.de>; Thu, 22 Apr 2021 23:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237048AbhDVV3i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Apr 2021 17:29:38 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:38036 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236851AbhDVV3h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Apr 2021 17:29:37 -0400
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E73CE406A9;
        Thu, 22 Apr 2021 21:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1619126942; bh=kLLefFZXZ39oTmPbH5VkZtMZPKVPXnIFE1AwQnxAmi4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=S2tEofc4MlvJOfqCo6xS+2xGNTObSc8Z0HdJkoq05vHNkYsqALy4DJrXygkr+UNog
         AYdjUHF/KHJuSJCScN7Mueid3FzSckbQ3ILc7SQ3StpdrXWE8b/cD7LtdEwImwqrMQ
         fkBSxDJYZtP30ajGUj4XvEWbfktFKu5A4wbJRxpFPRyDpMloeNI7diqnvxJh69rxzW
         gB9bHQIn/L/i1kDYJs/X7suHYWk7BNDImBEX3+1PGiYMH9CftUk0Xu/7CWV1aRlq1n
         0mdnZjA/2/67f42JEEd6pwiUr8uPJo+9QtSVL2zA/kCib/x+yZhCvNchyBAEmbSBJn
         iTFA6eimGiadg==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id B5D71A0084;
        Thu, 22 Apr 2021 21:29:00 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id D96A74018E;
        Thu, 22 Apr 2021 21:28:59 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="hhVnLZaS";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=euHiWGHspEBiDZl+Or5Alc1laZD3bWF4zo/UYY7y64o5PtIY3CDY1eqrwr2zp+Le5SpLq1GZa7iDWaVBYkiKzTTglSdZyFEnZKp/2EVjQjEA238C37PZbkHxdd+arbtJp4zdzQ1FQsZJ/UEbDmF+w5vUXhgKCB3nmDb3Oy6WTl8OKY4fzbsV9uUce+nw8a+L8/dBVx3+LXaxrX167nrOZkGYpXtQIES17kndVTIC0OFcjn+x50BqRALnYSx29JRxtpt29tyak4lDdmNC6K6AKMIZyF/IYvqe7VMEeZM+4AXldR+cOQo6DOhKuWJqeHyb7SiAXU6YOCiYn1e+PxlrbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLLefFZXZ39oTmPbH5VkZtMZPKVPXnIFE1AwQnxAmi4=;
 b=n3j3IAj62qPFEt2JWNR5x49vivfamxAUav+tHBIYx90StWEPaq/PeHeEVuCCN8jrlu6kzhaB8T650C08N5qrtqhUbDa2WZLS8QnkX9QxRVcOSM3z9Du7JN9IL+7WBe83F5xRSXFuPLoDLU02xDFFhqjgaK9k/XwAX75UxBcxI0mIS+hnTLhSJ9RrWbZyY5T2liHFgOmSXTkpBGasJ6QGd5q9JQbDYy3p5MShjOq13kQnLZxN0stIEbdt7zvlG1fEoa1nznZ2Ym3x1Y53lhHcJjCyNFYr67TP455mJELvhREGnBjDBpfmQM3OTv32TbiuEosTpmM1mGyjl0Y0WXXD8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLLefFZXZ39oTmPbH5VkZtMZPKVPXnIFE1AwQnxAmi4=;
 b=hhVnLZaSG4EQxpJrmkAcT67sVU6BuenUf/3ruoOfJAwucvoHCQzebTh1OgBL7yX1fjzPGE16+2ukxsIxquliphRxoCjb9NxtQRdgdJGb4FK+ofqOOJbKx4QL9Wn+qXAtYw+YxkV+xX5KD1qveL4Ex63mcvqbZMNHNRiIb4lgd20=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4211.namprd12.prod.outlook.com (2603:10b6:a03:20f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Thu, 22 Apr
 2021 21:28:57 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c%6]) with mapi id 15.20.4042.024; Thu, 22 Apr 2021
 21:28:57 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Michael Grzeschik <mgr@pengutronix.de>,
        Felipe Balbi <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 2/2] dwc3: gadget: fix tracking of used sgs in request
Thread-Topic: [PATCH 2/2] dwc3: gadget: fix tracking of used sgs in request
Thread-Index: AQHXNu+9eF7qglWLLkOrzqiL1Cef+6rAXlSAgACdCQCAABPDAA==
Date:   Thu, 22 Apr 2021 21:28:57 +0000
Message-ID: <82af3751-b8dc-2309-0c9b-a3caf97a4379@synopsys.com>
References: <20210421204837.4185-1-m.grzeschik@pengutronix.de>
 <20210421204837.4185-3-m.grzeschik@pengutronix.de>
 <87o8e6mvue.fsf@kernel.org> <20210422201812.GC6975@pengutronix.de>
In-Reply-To: <20210422201812.GC6975@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 16b37640-d21e-4533-c69a-08d905d5a35a
x-ms-traffictypediagnostic: BY5PR12MB4211:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB421193FD388C449DF7098B0CAA469@BY5PR12MB4211.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PGqMd9Wr5XLjEEh/QujbcidaLgNMh+qBY/5IPzhUHPJ8O5bdwCd4vNGqXsCf7XgRmSH2xPdVKUBmDN/A29Mb8MyJOIMqKKwwYAGlm5cRb56df+po9QBHfvpaav7+qliHPRYOpbUhZ3hZTewpiTBjc/zY52QhUUA2Y8lpV+huKAz+wOOtX7WI6XchLfKKA+wSxcr0yEyhjkSslRYXM+TwFZdxPqCYAZGYSvtV7m31WW8oQ1slBSYnLqxl0HgTzJUJCxLefXonuGFE4ObDjd5h8eUb+t0M1Y4FEgA9ihAH7+szCsqekvRqqWVo5nNqxtFY5oM9MbITxEV0vPuNf8GUN6RWayJVIo1rHS0hUoL+wv3/Iz8nZapzJEF7YOS6UzqHwq34Z6qoo0BUjlRWchKQi1fObELlOKD+FNxcexD9k3aoJrWAJijf/kGcVZxPe0INKcy8FJ4z70Q1U2/IYgWhjx6QpKFrrv5IjQ4uYeocE4i/PG22gEZIknsojzJS7lZOFw9F5XMa+ZcNh6OooLdrlYt2JG7wfdgrZSXe2Pz+i78tarVsLmkQWAyGw002iwkNDa3m+s/5jKipn6UDPx15SYofLEB24VkULW2V++8ToBgjL2VuY+F6S3gZ4qJ1RfhANx3ZLIIV4eYVJS8hpyG5w8ZsIxqKyp4BgrsM8uyfJkYEEpdGg40BdmEoC79fw2b9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(346002)(39850400004)(366004)(376002)(76116006)(66946007)(84040400003)(66476007)(64756008)(66556008)(66446008)(6506007)(71200400001)(54906003)(8936002)(8676002)(2906002)(36756003)(31686004)(38100700002)(6486002)(26005)(186003)(5660300002)(83380400001)(31696002)(316002)(110136005)(4326008)(86362001)(6512007)(2616005)(122000001)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?ERJNLc3GhOyw1UVjHZTYnRkKk1ravl1JkJGBMQCsJlNaH7UImd053Vec?=
 =?Windows-1252?Q?1oYkKUldH/K0J9jYr8wTOCNx4tppqNlj65AARlGwWSFlptYzZ/Tr8Kyg?=
 =?Windows-1252?Q?1r6gOqjSPJLyHR56lSpSHQzItOL1tT5ptbutNSU3oGKWpS5PPtVvvmlw?=
 =?Windows-1252?Q?kgqpdPaVcTorj5jr3DRSqWEW05bhe/W1j+wzZrvMHiWuHhkEfJWFkLxp?=
 =?Windows-1252?Q?1gVYPmRtm449zTm2V6V3udAuOgc5YiDXq9jPuVYPCm1p2XIqhA0cqcj1?=
 =?Windows-1252?Q?1t4OJ3T/7lMOO4zMQxWYFg5iInkuNbUJyFBsq+eVrR+oyz8TigZJpKts?=
 =?Windows-1252?Q?JAu0SdDci3xX0WHtmrWoHPWYHcjNbyU5Be/xF5ClNAgyhFA3yLiy+Ccn?=
 =?Windows-1252?Q?5218J8M+Ck1yzs08hsTGkZNRrRaHigIAKkWXgb3Dli8SF65IJo5IWAMh?=
 =?Windows-1252?Q?KrplnsJ2E1hxwgPP7DkZ44V1rpGrTd72BhCrM2Ud8vyPN7Tyy8GAvciA?=
 =?Windows-1252?Q?P7aBUOkmfszSAFruktMddcLajAGMp7p+US7HsAXJVB0ARf1vIh5z7sPA?=
 =?Windows-1252?Q?zyT7dxhue47x80ETsjA7aOp10Hm4VZ4Ft+N4WfDFfFe3GEV0nfEq0e/8?=
 =?Windows-1252?Q?C3WxmtztJJSxWyue1opq2Z6egUCfltNn9Y8CN2+Nzal1MP7moT3b6fxq?=
 =?Windows-1252?Q?JnaYLGO9CjBm64ZqhfmxKaRDjwEka0A6VJWy/wXK7hYCqYCArgRfAxOT?=
 =?Windows-1252?Q?mnXRmzKfl4b3HVDHV2vVACOmQgzEN27Ms3PBrNUqHSLOlwrYeYx6//QE?=
 =?Windows-1252?Q?Y43YUHrP7aOhIBxSqbS4V3eNWqt3XLzkgYvejAwiBJllwWlPlszEnBtW?=
 =?Windows-1252?Q?Lm0G9qFpJpIZQslBmE0/Xqh1vPAbbgJlBw7LT/soI/KHtrnvNzi4yS1v?=
 =?Windows-1252?Q?fFUBhOkubTe1ADOORfI3feNJSeASMvEY5jBHvygKl+N37foCKuQep4vs?=
 =?Windows-1252?Q?8UM+VhyEsTN0L53Bf0CVT7mlr9XFof4ZDND3JsicR3cmYv1DXFHGY7VQ?=
 =?Windows-1252?Q?axzERFLg87V5gyKXkHjQQ4kaL5YWWc/dVORVPrS73To4nOCRYfD/Zpn2?=
 =?Windows-1252?Q?TcL1/FlegaIFMak5ccBL2pmWFNkc38QJQeP075QNNE79h7rLV4++Qarb?=
 =?Windows-1252?Q?bFM5S0ZPx0NkLOa6xruXJWqoTxO0eLLKsP7X8i21W3lXl+POUYUmr+DX?=
 =?Windows-1252?Q?dlog9x8ezopLlmF2YQ5sWE0lENeFoDu0myZBcCmSFBCPoeIUCabQpoja?=
 =?Windows-1252?Q?mkcStisEkOgMlcR9Zls1pMT72QtQ7g3VSyabokHTpXHqkgWlbDDi+ahc?=
 =?Windows-1252?Q?IkukB/Wd6RVVtBf50+VD4cE+hb6rXrv2HZpo+6WDVnsTHFJ89pvotLJ/?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <E72B03A3AE9DCC4880298BB1B5896749@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b37640-d21e-4533-c69a-08d905d5a35a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2021 21:28:57.5444
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Er9mdVxw8d6cYsU8mK9jkJEKAsOpgvi6bjzAX9YtMuBLB6IzX+TDClU1FRhdVX9+5wOFVH6dUrPGfEkkB4i+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4211
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Michael Grzeschik wrote:
> On Thu, Apr 22, 2021 at 01:56:09PM +0300, Felipe Balbi wrote:
>>
>> Hi,
>>
>> (subject format as well)
>>
>> Michael Grzeschik <m.grzeschik@pengutronix.de> writes:
>>> The variable pending_sgs was used to keep track of handled
>>> sgs in one request. But instead queued_sgs is being decremented
>>
>> no, it wasn't. If the total number of entries in the scatter list is 'x'
>> and we have transferred (completed) 'y' entries, then pending_sgs should
>> be (x - y).
>>
>>> on every handled sg. This patch fixes the usage of the variable
>>> to use queued_sgs instead as intended.
>>>
>>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>> ---
>>> =A0drivers/usb/dwc3/gadget.c | 8 ++++----
>>> =A01 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>> index 118b5bcc565d6..2d7d861b13b31 100644
>>> --- a/drivers/usb/dwc3/gadget.c
>>> +++ b/drivers/usb/dwc3/gadget.c
>>> @@ -2856,7 +2856,7 @@ static int dwc3_gadget_ep_reclaim_trb_sg(struct
>>> dwc3_ep *dep,
>>> =A0=A0=A0=A0 struct dwc3_trb *trb =3D &dep->trb_pool[dep->trb_dequeue];
>>> =A0=A0=A0=A0 struct scatterlist *sg =3D req->sg;
>>> =A0=A0=A0=A0 struct scatterlist *s;
>>> -=A0=A0=A0 unsigned int pending =3D req->num_pending_sgs;
>>> +=A0=A0=A0 unsigned int pending =3D req->num_queued_sgs;
>>> =A0=A0=A0=A0 unsigned int i;
>>> =A0=A0=A0=A0 int ret =3D 0;
>>>
>>> @@ -2864,7 +2864,7 @@ static int dwc3_gadget_ep_reclaim_trb_sg(struct
>>> dwc3_ep *dep,
>>> =A0=A0=A0=A0=A0=A0=A0=A0 trb =3D &dep->trb_pool[dep->trb_dequeue];
>>>
>>> =A0=A0=A0=A0=A0=A0=A0=A0 req->sg =3D sg_next(s);
>>> -=A0=A0=A0=A0=A0=A0=A0 req->num_pending_sgs--;
>>> +=A0=A0=A0=A0=A0=A0=A0 req->num_queued_sgs--;
>>
>> no, this is wrong. queued shouldn't be modified as it comes straight
>> from the gadget driver. This is the number of entries in the request
>> that the gadget driver gave us. We don't want to modify it.
>=20
> Right, but pending_sgs than has two use cases. One to track the mapped
> sgs that got not queued. And one here to to track the "queued sgs" that
> got dequeued.
>=20
>>>
>>> =A0=A0=A0=A0=A0=A0=A0=A0 ret =3D dwc3_gadget_ep_reclaim_completed_trb(d=
ep, req,
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 trb, event, status, tr=
ue);
>>> @@ -2887,7 +2887,7 @@ static int
>>> dwc3_gadget_ep_reclaim_trb_linear(struct dwc3_ep *dep,
>>>
>>> =A0static bool dwc3_gadget_ep_request_completed(struct dwc3_request *re=
q)
>>> =A0{
>>> -=A0=A0=A0 return req->num_pending_sgs =3D=3D 0;
>>> +=A0=A0=A0 return req->num_queued_sgs =3D=3D 0;
>>
>> nope, request is, indeed, completed when there no more pending entries
>> to be consumed.
>>
>> What sort of problem are you dealing with? Got any way of reproducing
>> it? Got some trace output showing the issue?
>=20
> I digged a little bit deeper to fully understand the issue here. What
> I found is that in dwc3_prepare_trbs will make two assumptions on
> num_pending_sgs.
>=20
> When the real purpose of the variable is to track the dequeued trbs.
> Than we have to fix the started list handling in the dwc3_prepare_trbs.
>=20
> The comment in the function says:
>=20
> =A0=A0=A0=A0=A0=A0=A0 /*
> =A0=A0=A0=A0=A0=A0=A0=A0 * We can get in a situation where there's a requ=
est in the
> started list
> =A0=A0=A0=A0=A0=A0=A0=A0 * but there weren't enough TRBs to fully kick it=
 in the first time
> =A0=A0=A0=A0=A0=A0=A0=A0 * around, so it has been waiting for more TRBs t=
o be freed up.
> =A0=A0=A0=A0=A0=A0=A0=A0 *
> =A0=A0=A0=A0=A0=A0=A0=A0 * In that case, we should check if we have a req=
uest with
> pending_sgs
> =A0=A0=A0=A0=A0=A0=A0=A0 * in the started list and prepare TRBs for that =
request first,
> =A0=A0=A0=A0=A0=A0=A0=A0 * otherwise we will prepare TRBs completely out =
of order and
> that will
> =A0=A0=A0=A0=A0=A0=A0=A0 * break things.
> =A0=A0=A0=A0=A0=A0=A0=A0 */
> =A0=A0=A0=A0=A0=A0=A0 list_for_each_entry(req, &dep->started_list, list) =
{
> =A0=A0=A0=A0=A0=A0=A0 if (req->num_pending_sgs > 0) {
> =A0=A0=A0=A0=A0=A0=A0 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>=20
> This condition seems to be made on a wrong assumption, thinking the
> num_pending_sgs was decremented after dwc3_prepare_one_trb was called on
> parts
> of that requests sgs but not all.
>=20
> But the completion path can not also depend on that variable to be
> decremented
> after parts of that sgs get handled. Therefor I came up with this second
> patch.
>=20
> What do you think, would be the right way to solve this?
>=20
>=20
> The second issue I see in dwc3_prepare_trbs is the bail out of
> iterations over
> the pending and starting lists. Whenever one case of
> (req->num_pending_sgs > 0)
> will be true after calling dwc3_prepare_trbs_sg, the function returns
> immediately.
>=20
> In my case, where my uvc_video now enqueues up to 64 requests, every sing=
le
> kick_transfer called from one ep_queue will ensure only one call of
> dwc3_prepare_trbs_sg on one entry of the pending list. This bottleneck
> makes
> the hardware refill to slow and the hardware will drain fast even though
> enough
> pending buffers are there.
>=20
> I suggest to remove those returns.
>=20

Are you referring to the early returns in the dwc3_prepare_trbs()? Then
no, you should not remove them. They only return early if the request is
completely prepared or the TRB ring is full and we can only prepare the
request partially.

Can you help clarify the bottleneck more as I'm still not clear of the
issue here.

The way it's implemented now keeps track of the all the available TRBs
and ensure the TRB ring is filled as soon as a request is completed.

Thanks,
Thinh
