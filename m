Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA08336D05E
	for <lists+linux-usb@lfdr.de>; Wed, 28 Apr 2021 03:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235869AbhD1BqB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Apr 2021 21:46:01 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:52066 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229888AbhD1BqA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Apr 2021 21:46:00 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DE9DEC051A;
        Wed, 28 Apr 2021 01:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1619574316; bh=Mma4655eKzEiQBBfl8Hz70ZJBzzLNv4XPSxasreQxgo=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=SSJ+R7gOVbAIFX/qMLo4Ju/COmZTcHeqNnMgdZOeM+6JsrzgLkmN7Oc5ANpBo3jFC
         RPXAS9d8ewd8BPAiT+0NNYE5xgMkYVVNR5jhzgeyTDGx1+Yx0KEAWYzoDLmGya5QTz
         2M8VFM1LLOVfJpAj6ClXKVZA1lIdNpkTMT5qsCrJClqFWKBVlPmauJBPZgUyTzXtZv
         pHLT8qkbVh08VPcx3gm/EglS+N4F5/I44eXhbqqgp30U0Hxx5S7cGrF4X5K+DTAHqF
         y4YaQyp50dasWttw9a3PuXXs3KEck8PnPBpF7tSYA9Le6zwDCfcT+tjo213t1zoWC+
         6AtspRN8ycmvw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 28864A0115;
        Wed, 28 Apr 2021 01:45:14 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2040.outbound.protection.outlook.com [104.47.73.40])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 30E0B80292;
        Wed, 28 Apr 2021 01:45:13 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="GJkQPUuQ";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNYANmOdn7N0H7ASUTr3+TsjVkYMi1VGUnsKPYrjmVPWRsoHH0kncyqTdB3wkzxmouWK3tJROy4UjCTIcCA4Exn0YglnmEt1PJp2oOosJt1ogf9uvITOOsA/f7tE+K5JU1PJrqDXwsIMFFi3IaUrvqQtul3QS873gxR4HYupc9PRfzpW52uLBt6KA4gTOIq4a4hhIwWfHwADBrjPZpHF7Y4NLZv6HcWMcA+sWO6+/FAG96Vbw4tJmfn8f7YBYrRdtA3eBvkKt0tA/nu+M2WmfloMAWrrXrzms3C9I3W52jIhbd3cAbCK6Lc2vXcyw2EsUi8JySC8gShSsD02QHXbUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mma4655eKzEiQBBfl8Hz70ZJBzzLNv4XPSxasreQxgo=;
 b=T+w0oPxbp5WkAhdaMRzn5L9KUGBAJikLO3nLCojsHEISGsWfCZMErMEyjriF4RFu9SKjy9hBh5Ot6Ni3EVzOT8+PejSgK7/k+mv0230XE2Ga/AtElNkWmye9iFwr2l2HtuUVfL5LHCD7xDcPdwbM4cTj6+eCgYEI0XsouT7ko6DH7fsUGhf+2A806b+8YnC+kV/OTPsW2XFm2yC47an3JFCwtih0dRv3bKJS5x+agOfZwEt4dZw/fnX+c257beUNtStf1YG9/6cnjIR9vFL+1HOWUPoPfKiYOuRuPDMGtjqJTG4nBAOupIeno7msNW9vPlo8ph/mOhLQkVD8EDazsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mma4655eKzEiQBBfl8Hz70ZJBzzLNv4XPSxasreQxgo=;
 b=GJkQPUuQSTOh27GAKUXGK5+oeyXdHcsUm+bv31CxuDGNetAPituXdIGxtk6W/1pPD2Ar1UuXdV8sOC4tHJQUvr2fea3xfL+vXvbCZhP40W4YUV7nQAQuoaunhfGdrOKQmMNEWRNNOoFp+V8eoJKFveTiGSKAJFYQWv5Z6E7Aixw=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4642.namprd12.prod.outlook.com (2603:10b6:a03:1f6::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.26; Wed, 28 Apr
 2021 01:45:11 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c%6]) with mapi id 15.20.4087.025; Wed, 28 Apr 2021
 01:45:11 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Michael Grzeschik <mgr@pengutronix.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 2/2] dwc3: gadget: fix tracking of used sgs in request
Thread-Topic: [PATCH 2/2] dwc3: gadget: fix tracking of used sgs in request
Thread-Index: AQHXNu+9eF7qglWLLkOrzqiL1Cef+6rAXlSAgACdCQCAAKd/AIAARdUAgAANY4CAACI/gIABPhqAgAAPfgCAAEv0gIAAY/OAgAOkbICAARsxAIAAXO+A
Date:   Wed, 28 Apr 2021 01:45:11 +0000
Message-ID: <144ed647-86f3-3aee-8ea5-2c8e4d02e2f9@synopsys.com>
References: <20210422201812.GC6975@pengutronix.de> <871rb1msmx.fsf@kernel.org>
 <20210423102738.GD6975@pengutronix.de> <87y2d9l0a2.fsf@kernel.org>
 <20210423131807.GE6975@pengutronix.de> <87k0osksgo.fsf@kernel.org>
 <20210424091206.GF6975@pengutronix.de> <87eeezlrvm.fsf@kernel.org>
 <68ae9066-b349-ba70-59c6-c2388b386b66@synopsys.com>
 <50e13b71-bdc1-6279-a224-bfc99cf10dc8@synopsys.com>
 <20210427201232.GG6975@pengutronix.de>
In-Reply-To: <20210427201232.GG6975@pengutronix.de>
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
x-ms-office365-filtering-correlation-id: 79820607-aee4-40c0-8716-08d909e742e3
x-ms-traffictypediagnostic: BY5PR12MB4642:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB4642CCDD87FEA92F2986EFB8AA409@BY5PR12MB4642.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iHKIantcPyWJC19U2H6nArdJOyKNM/rnBqY4omZppWCGO3T/lNwkLtlfCQgmlpIZ7fAiuWNIinuvq7KDccUc99r11LzhWMrdHLaWvRvNim4tDtK5Oijl7UdrNGm1UG4Z1kGzcsgOQrAp4j1HjFE/8CelscQhMgbE7ePWKIkyMSqkHDfEOcKV56T5EtL/n2uTIROi7a8HnGvpnxYuCUfqFlD1Dxqti078SO1fPzSPGHNVnQrTTScRYR876Qe+GdbyVO8pAF6YaLsCV0c58LpQ969PXbrunly2BetvFxw5LMhgctSWIEDxo36nBhEEoearZVCxIcJpYWnhTFFmuh//i4OBpSOIDk73Vk5bEFxyfYFGHM7EPPIFsr4Uc3UCepsOG+/IbbWXzkkIk3aenmRRi851eQeQO6g4PncKYurMvkXKlsbheXOB18F5tc5XFjVjC8xH6c3IHiRltv2TDlNRP86lw9fDhjqrL4f04CF195pV2Qm7msdtNxNQIKAR2VmXFbjfCvOAkhWP9b2zJdbxFEKEE8Sh4XCGXDhmzMFrFub8PBy0u8yPvpGcyyYLLBtmll8Sxk8OLb5gGM3AuXvGoSecP7ulayYXEXnnwq+xguYJJKujpreVghBKUoRe1J5c57Y7jwIXEBIWUXscdvZBIM/UPn4piGbzoyuuf8B/u6vaSCnT/trxDhiMPddwkE0h
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(376002)(366004)(39850400004)(396003)(36756003)(4326008)(2906002)(66446008)(6506007)(478600001)(110136005)(31686004)(54906003)(316002)(38100700002)(86362001)(76116006)(6486002)(186003)(31696002)(122000001)(71200400001)(83380400001)(66946007)(26005)(8676002)(6512007)(66476007)(2616005)(64756008)(8936002)(66556008)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?xSkB/you0ccD8qm+Wb2fvJGHjaq/CGlKVbbF999UNwmlemvSZfD7JwAD?=
 =?Windows-1252?Q?0izJXMGU6QNpthvS9Vw0Ki1or/ioM1t13LiUzQ5nGmlrJ4m/lZufz61b?=
 =?Windows-1252?Q?R/gLTP0KyumoR9hEE1l+/0b4sIaVWlRpx3sujQcldmUBoA7ACCoP8i1w?=
 =?Windows-1252?Q?eLrHgwdJbyOVFQiju6blb58njI0mW8NuIU5GuIlpnhsF9t5Zdct98nca?=
 =?Windows-1252?Q?2OxPp7GNRMy1kRTHCdz7DDsBQZseVaiSCCtBwSGwXDR+7ugYIamDEvXC?=
 =?Windows-1252?Q?K9qv82+l1xb5iL0mqZkca0rw4vifnnXGCmYjyLL20z/UTt81I7LLsLwJ?=
 =?Windows-1252?Q?5L27NAKBR2vC/Znmaz4JFSH1kLYrOO6IIG+KecDpqtjsunBGyRIiFyNY?=
 =?Windows-1252?Q?+hQZzTzxPnThKIBMDliiZuxWn8g7TYu14se/FkqKyhsfMgHC+4U/FIjS?=
 =?Windows-1252?Q?RiYGpYDMfoIun64pUSzSYfnB3WrB2gBZkgbZBDT2UTBNxDOqyiEcwy7D?=
 =?Windows-1252?Q?0mcWX0omOIXhsYko1047xuRuQO2uBnLK80G2VwivzXQJ3kjaGjz0yn3F?=
 =?Windows-1252?Q?Cly0XPQyRBi3AqDgN6Lzyk+xxPhEJXm5LwIzqcpxRrk+5Pppbg4MJQ72?=
 =?Windows-1252?Q?2/iy8NXAZXnrGhfcteIUhzJcMeLdn0x8BvYV/7FYuGvgde21sAZbzTNW?=
 =?Windows-1252?Q?MUcU5HueGYaMPC0zKk9lzy59A1eKcXXOSFzi/rb8F9rvzAUp/Y53I014?=
 =?Windows-1252?Q?fyz15zKDfpXlkji2oQIw09eX6lS0x0g+skXicekueLv2EwmiUjuxRsPV?=
 =?Windows-1252?Q?d3e/doS4jJECMWAUmFsKLzgq96P5CGR+VwxwEU5Swq2Q0vMDlsc8TRaV?=
 =?Windows-1252?Q?bvk2aEU1GZOYGIcURvCDTfdfTRoTdKI3njCrwyI0CLFxxlHNw3bKmosC?=
 =?Windows-1252?Q?jhbs8VYRBWPoXZMAl+Yq0DeeJt3eaw1LJB6SdaVMMsR9E4OqubDo5yU7?=
 =?Windows-1252?Q?x+mPB2tnn1QG4hHmdodxc4fATlMUTBmzsGrNp4oSBQVTj6lscPzuVda0?=
 =?Windows-1252?Q?CGVlM6CxTmyjrboQY0sqbtYLiWY2oNnLIWE7lM75q6S7z9U3YaE1awt3?=
 =?Windows-1252?Q?N4heI9snnJ6Vj//4F4y14J650VLuaxaJkRH9t7V0CvJ//e6PZQTX7hx1?=
 =?Windows-1252?Q?W8MxzjGebJIYTHaaxrE8D7TD2gTi9b/U+1IYp08P1ujceY0BoPAU+o8Y?=
 =?Windows-1252?Q?GI31VcyDVlsZG0n6PEKNy145YL6ulzRikj/C06ZEdGBrKGrVOm7DSfAS?=
 =?Windows-1252?Q?k7+91vWv8mj2ql2vR5wQ7N9v5FnKli/lbcL/4CpSFY9UOT/TYgNezucf?=
 =?Windows-1252?Q?me2nSf9IER2r5IydRkLOFY1kMZo+cSpI8AOkKinptKXt8wAXzwR5R2P6?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <DDD8CDF87785BC41B8CE08D894741AFC@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79820607-aee4-40c0-8716-08d909e742e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2021 01:45:11.3159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O1rTonrtcK3kc8Ht+gIEM06kPd04AmnaMyqpLRTTm8cPWT3qEbiad1AsjRqlzuV2ov25Ur46IhZkwLBUH5yFmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4642
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Michael Grzeschik wrote:
> On Tue, Apr 27, 2021 at 03:18:57AM +0000, Thinh Nguyen wrote:
>> Hi Michael,
>>
>> Thinh Nguyen wrote:
>>> Felipe Balbi wrote:
>>>>
>>>> HI,
>>>>
>>>> Michael Grzeschik <mgr@pengutronix.de> writes:
>>>>
>>>> <big snip>
>>>>
>>
>>
>> <bigger snip>
>>
>>
>>> I think I see the issue that Michael reported.
>>>
>>> The problem is that we're using num_pending_sgs to track both pending S=
G
>>> entries and queued SG entries. num_pending_sgs doesn't get updated unti=
l
>>> TRB completion interrupt (ie XferInProgress). Before the driver queues
>>> more SG requests, it will check if there's any pending SG in the starte=
d
>>> request list before it prepares more. Since the num_pending_sgs doesn't
>>> get updated until the request is completed, the driver doesn't process
>>> more until the request is completed.
>>>
>>> I need to review more on Michael's patches next week, but I think what
>>> he suggested makes sense (in term of properly usage of queued sgs vs
>>> pending sgs). BTW, please correct me if I'm wrong, but we do modify
>>> num_queued_sgs.
>>>
>>
>> There's still some issue with your patch. I think this should cover it.
>> Let me know if it works for you.
>=20
> This works for me! Will you spin a proper patch from that?

Sure. I can do that after 5.13-rc1 is released

>=20
>> Note: this however probably needs more "Tested-by" and reviews
>> to make sure I'm not missing anything. I only ran some basic tests,
>> and will need to run more.
>=20
> You may already have mine:
>=20
> Tested-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>=20
>> Let me know if this makes sense.
>=20
> From what I understand about the issue and the purpose of all
> variables this makes total sense to me. So thanks for taking over
> and make a proper solution.
>=20
> Thanks,
> Michael
>=20

Thanks for the Tested-by.

Btw, any reason for using SG with transfer less than PAGE_SIZE? I assume
your platform is 4KB, but you're splitting your 3KB transfer to smaller.
Was it like this before? Note that DWC3 has a limited number of internal
TRB cache. But what you're doing now is fine and doesn't impact performance=
.

BR,
Thinh


>>
>>
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index dd80e5ca8c78..040cc67b3361 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -1244,6 +1244,7 @@ static int dwc3_prepare_trbs_sg(struct dwc3_ep
>> *dep,
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 req->=
start_sg =3D sg_next(s);
>>
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 req->num_queued_sgs++;
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 req->num_pending_sgs--;
>>
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /*
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * The number of pending SG=
 entries may not correspond
>> to the
>> @@ -1251,7 +1252,7 @@ static int dwc3_prepare_trbs_sg(struct dwc3_ep
>> *dep,
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * don't include unused SG =
entries.
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 */
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (length =3D=3D 0) {
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 req-=
>num_pending_sgs -=3D
>> req->request.num_mapped_sgs - req->num_queued_sgs;
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 req-=
>num_pending_sgs =3D 0;
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break=
;
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
>>
>> @@ -2867,15 +2868,15 @@ static int
>> dwc3_gadget_ep_reclaim_trb_sg(struct dwc3_ep *dep,
>> =A0=A0=A0=A0=A0=A0 struct dwc3_trb *trb =3D &dep->trb_pool[dep->trb_dequ=
eue];
>> =A0=A0=A0=A0=A0=A0 struct scatterlist *sg =3D req->sg;
>> =A0=A0=A0=A0=A0=A0 struct scatterlist *s;
>> -=A0=A0=A0=A0=A0=A0 unsigned int pending =3D req->num_pending_sgs;
>> +=A0=A0=A0=A0=A0=A0 unsigned int num_queued =3D req->num_queued_sgs;
>> =A0=A0=A0=A0=A0=A0 unsigned int i;
>> =A0=A0=A0=A0=A0=A0 int ret =3D 0;
>>
>> -=A0=A0=A0=A0=A0=A0 for_each_sg(sg, s, pending, i) {
>> +=A0=A0=A0=A0=A0=A0 for_each_sg(sg, s, num_queued, i) {
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 trb =3D &dep->trb_pool[dep->t=
rb_dequeue];
>>
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 req->sg =3D sg_next(s);
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 req->num_pending_sgs--;
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 req->num_queued_sgs--;
>>
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D dwc3_gadget_ep_reclai=
m_completed_trb(dep, req,
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 trb, event, status, true);
>> @@ -2898,7 +2899,7 @@ static int
>> dwc3_gadget_ep_reclaim_trb_linear(struct dwc3_ep *dep,
>>
>> static bool dwc3_gadget_ep_request_completed(struct dwc3_request *req)
>> {
>> -=A0=A0=A0=A0=A0=A0 return req->num_pending_sgs =3D=3D 0;
>> +=A0=A0=A0=A0=A0=A0 return req->num_pending_sgs =3D=3D 0 && req->num_que=
ued_sgs =3D=3D 0;
>> }
>>
>> static int dwc3_gadget_ep_cleanup_completed_request(struct dwc3_ep *dep,
>> @@ -2907,7 +2908,7 @@ static int
>> dwc3_gadget_ep_cleanup_completed_request(struct dwc3_ep *dep,
>> {
>> =A0=A0=A0=A0=A0=A0 int ret;
>>
>> -=A0=A0=A0=A0=A0=A0 if (req->num_pending_sgs)
>> +=A0=A0=A0=A0=A0=A0 if (req->request.num_mapped_sgs)
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D dwc3_gadget_ep_reclai=
m_trb_sg(dep, req, event,
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 status);
>> =A0=A0=A0=A0=A0=A0 else
>=20

