Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F34E836EF5F
	for <lists+linux-usb@lfdr.de>; Thu, 29 Apr 2021 20:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241126AbhD2SQh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Apr 2021 14:16:37 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:57146 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233706AbhD2SQg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Apr 2021 14:16:36 -0400
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1545E405C3;
        Thu, 29 Apr 2021 18:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1619720149; bh=H7ccHP5QOc+Eo5cwsEyoe0KQLFhEnSQN+j//E049lZM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=HjmBVq5HBcUVhT7vsLfCGGK9iJaCv0W3E/8liQhizFiUJkhNgQQu3V03hCtIHtFVr
         9VILxuJREvtonQ0N0gjOrVg1fywub8R1iLdgm81TsAnD/FFcznNZWk3CR58wwcPnwM
         Ez/EkNML3/Dj97x4rjIiBrnZIC5JoxNckQCVlJU6KHte0KQrgrxjFEcsfY65xhdYZI
         u1IuI5qqRzVPe+kf/pNbQ2hy7kc4n3ObF3lhHoPZcQM7surtj42Pv9B2kPr2WyBsQk
         pX473o/AYYYrm4ymktHSJjHdRD8VG7lWi4BiL3x3y5Pq5pzk3Umbg3dNobR9+qwZdl
         u5XsrO2Dz9vIA==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 6BCFAA006E;
        Thu, 29 Apr 2021 18:15:48 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3E4BE400F7;
        Thu, 29 Apr 2021 18:15:47 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Bv3kI0tc";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASG3T2q+Px6ERv+I7sWIkaceW3bHWHoSBJJsGnonY3hixuOoDlSdP65ZmLzkjLKUDfSTCo5TC6RQ/0XTSHCqhsbsKEOuhTuhubmjIiuiWge5dQrY/BgLAYR7hGVVwwcB2R+cxk16Erd3B7M6HMcvANqHXw/vasS97ObstYoUGsLK16V8v6T5Q973G9jbagYlUor9UdMVarj+uSMvsfgls0obil7OOROywWPr/fnpdUGCnxDK1Qr2aBP385cjiK4Wvmq+LzYdWFaq9JkH7bcASHjzrSaGS0/PqEmboO1cmqtL08y1eI6aVL7eDanRsNzXYG7lNBJxE8/J2q1KG03zrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7ccHP5QOc+Eo5cwsEyoe0KQLFhEnSQN+j//E049lZM=;
 b=TLk7uEpdV52st8RHn4a3hq7HgHYqdMD7T11AQm4Tiq8IKhcCrUKxnAy8C4NrlEbRdgskDoAIvgE7w26zjDxbaSTft7Am7M8dKZx9VUcAy5R6a0fflNZd9Ca4AsdKgcHqumBTxmncSfNqhgEQLbUdbZN9MWQu7Y8Tb5r3K6xAE46RR8Qg6ZM1j9acQk40I1Q+J7g67rhgE0eF5JfbSV4/yOi233hGsf5M9PMLqAaNkX9foXuPppBG+n9xGznm+b/z+UMiFPvwcgJaD/azZ7oYVHx1EKL8K3AvIp6v9IGCqplLsVKOfSeH/6m8BMRFnKVn8Oa4Uq93OgMY0Z42OULf5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7ccHP5QOc+Eo5cwsEyoe0KQLFhEnSQN+j//E049lZM=;
 b=Bv3kI0tcve+Qv56klhXmBYaD2MKfCbPBapV9ipZLGtuGf6wrZtRYohSuJpPVqvg6SXNRhuCNFujO66ekhiNSfsGgnzbQbs0GlP/odrAoYJfESNzAeIOaB+HS/LaUZW3gFqHafg1tZN6YP3GzTWoGa9dYKnE67Ys0y8mCTiVXz04=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB4726.namprd12.prod.outlook.com (2603:10b6:a03:98::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25; Thu, 29 Apr
 2021 18:15:46 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c%6]) with mapi id 15.20.4087.025; Thu, 29 Apr 2021
 18:15:46 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Michael Grzeschik <mgr@pengutronix.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 2/2] dwc3: gadget: fix tracking of used sgs in request
Thread-Topic: [PATCH 2/2] dwc3: gadget: fix tracking of used sgs in request
Thread-Index: AQHXNu+9eF7qglWLLkOrzqiL1Cef+6rAXlSAgACdCQCAAKd/AIAARdUAgAANY4CAACI/gIABPhqAgAAPfgCAAEv0gIAAY/OAgAOkbICAARsxAIAAXO+AgABikQCAAQihgIAAfM+AgAC/GYA=
Date:   Thu, 29 Apr 2021 18:15:46 +0000
Message-ID: <de7a2b8f-9ab2-2bba-60bc-e9a943bf09c5@synopsys.com>
References: <20210423131807.GE6975@pengutronix.de> <87k0osksgo.fsf@kernel.org>
 <20210424091206.GF6975@pengutronix.de> <87eeezlrvm.fsf@kernel.org>
 <68ae9066-b349-ba70-59c6-c2388b386b66@synopsys.com>
 <50e13b71-bdc1-6279-a224-bfc99cf10dc8@synopsys.com>
 <20210427201232.GG6975@pengutronix.de>
 <144ed647-86f3-3aee-8ea5-2c8e4d02e2f9@synopsys.com>
 <20210428073756.GH6975@pengutronix.de>
 <04126a67-136d-41ee-dc21-b46eaeb7ba19@synopsys.com>
 <20210429065147.GA31996@pengutronix.de>
In-Reply-To: <20210429065147.GA31996@pengutronix.de>
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
x-ms-office365-filtering-correlation-id: 70bdcb69-9cf2-423d-aeea-08d90b3acf38
x-ms-traffictypediagnostic: BYAPR12MB4726:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB47266947509FBF4242F913A9AA5F9@BYAPR12MB4726.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gogKYBW9AvA4cUQ6SiGm0eRWr+lEHakw+ikfjs33RXhjhT0oU85QwBo/mcX28HAhH2uO/akXRTx3FXL5MKWEtI52Hi6UUwVUR3JZDuSXsW8/ibK9n00P7i3iKKLu/n4PAq8V1JYs1FyJG6MUJhijr1jK+X4X0ZRls386ekZ1ZKhgdrHa2aQHqDaNR0l+RFO6SiCQ4KmqTss01guma+ODii+LL2hPIZu7SkhzgDeqpwJ67NuXnXbFF6RPyQ5Nk3oKzuslDJLz+ukKvcAX2i9JGpraipl0gqaNIT2+wYLqp0w5bprgHqkScn0u437hzmQzuAQpqyE3q2/oYR9w36FDZ4KWgornp+s88eadCQXDh/Ww8pkm33eaGuO7+lCKhrTpsBgQsEhrvoURivBH7VcFbgx64GKigre07dvA4r+7H03XJkRv2O67oxMopRl6fBMr3g8ogWtiIWBylrfXNiNseyVyDfRyGDpQMrkFhfudDmfxyQLCKYHEvdNu/ljobIZFE6a2GBwWTUNxh2fYNvjrADsOcIN4Rj7xLWDpFC47mjcGBC47Gv3ALRPMhwX6U8IVh1YPWYzBuNkROJAAFmh1XC++7DnLMdd/bgLR0bBxshdPaED+PiIIwi75lk5YokP4MwqOMFGukkTxDPgQP8Sj2sCEhW9Sdb/9lqzj9kHPuZtwydHhu5Pu2vP+zs4MMIoH
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(376002)(39860400002)(136003)(366004)(8936002)(478600001)(8676002)(66476007)(83380400001)(31686004)(86362001)(6486002)(76116006)(66556008)(71200400001)(64756008)(6512007)(2616005)(5660300002)(26005)(66446008)(316002)(122000001)(2906002)(66946007)(38100700002)(36756003)(110136005)(186003)(4326008)(31696002)(54906003)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?iso-8859-15?Q?HK7XTy6WFjV2JOjP/uRVdX+Kv6fXt2rp/NviSJIAB85S3pCNSPJIpx06t?=
 =?iso-8859-15?Q?9hR5IC5LV8srurzq9CyNrnqMof2IEci2VSpd5TerVb9rTBreS30/rtyL8?=
 =?iso-8859-15?Q?hNmnq0DakvnC5uYVwtpzKcAa1DyDBO1VHNq7AEaSFxd4NpcPiQvV/an4H?=
 =?iso-8859-15?Q?Gyn+ffLeDU9fLLCpigvrogFm5uGuyGAUXo8kZQhgNJFI8fXas2bcs0X4P?=
 =?iso-8859-15?Q?wnbrsBNtymghYNfCW0njx0BGKynUGCgMpuay/qGtnh1DWnygCmv3FIElB?=
 =?iso-8859-15?Q?kwWcFNIiNfAtQejF5Fz3Il92OS/0ODYXQedfSu46Cb8aAnncJGhYRx98p?=
 =?iso-8859-15?Q?Y8MBaRs814hfr2o/MCMC/KUXy60oooYwF7ZsQYZws4oGW4fMVPh2z0UtX?=
 =?iso-8859-15?Q?rkVhsu0rYaGnxu1N3hkjKgK7vmD5K50cv0Udx0gZani+h4FalT3AvA1jZ?=
 =?iso-8859-15?Q?fGoeiaxjb8iaPayvDbozTReubccs/ssLkZJJC20KwR/IRY8N7co+jUiII?=
 =?iso-8859-15?Q?mLI19FSOuJ0Gen7grz4CPqoJfV2mFj0NwCKgeCSxGV+kwZhOzj5rnSeeA?=
 =?iso-8859-15?Q?slWniH3wTu99IM1UBeWY20vLm45TUtOTqKVjKZCsZnhm+sSZ/sibtfrMc?=
 =?iso-8859-15?Q?5+2Yt5umFne2rDID6m9+jWsoPiDh0PUarRCLFYe4JlABwnFzNdY2Gr1xK?=
 =?iso-8859-15?Q?dDrWzaBmqe/m3lYVJXkYpMI0v+lg4XNZPrfuvaF2CsgSwjJASvmC5Rw7n?=
 =?iso-8859-15?Q?1WRHTffsH57jVhD9TOv9Yk0+jJjd78XzkHjOQRN0UabGs7R8IWy9rHre0?=
 =?iso-8859-15?Q?xV5rNc8fonmVKfYbs/U114rHER4J3akQVUr9nmXIhktnIvxT9mp6yU0jH?=
 =?iso-8859-15?Q?+sb+2o3huoeokIwnQb24VucOZ+As5oQOCmdiKHri4OPtmW8WSCkWy4k44?=
 =?iso-8859-15?Q?Ewli7iEs6k9iSLQSnsUOYf7BkbPI8ug52a47DvTHZMbhAUKKZbqm03FNT?=
 =?iso-8859-15?Q?kxQLJxkYt9JjGCzTonHPW6/VRs55uiZEuEasvn+aDpqBrrqHCuRK9jUQ3?=
 =?iso-8859-15?Q?9B16KYlH9hfaaphB8SOeANL27b7n4vwkZMXFF5pU64FEHdjk/l3tZmKFd?=
 =?iso-8859-15?Q?A8JwbmVh4D+UcY1EzAjllQVlyLI90RcRhG2KW2dPeB0RXwxPJe3zCwR/U?=
 =?iso-8859-15?Q?utm/vj/lCqypR3wKniAqoPpFCMGZLYsrjbqQFWKeWZKWBTw2mgQqSwCH2?=
 =?iso-8859-15?Q?TdRZ8ZJe5EKqmNHDFdNpt8wssIhGW/otZU8m66ASjzEyIdXGO58rje42A?=
 =?iso-8859-15?Q?3zdUdgu5oTZvYBZB6WJl3tezmZjkOwBp5vyIXCnngh6etNUg6maOcAlLF?=
 =?iso-8859-15?Q?woYMMXqGUKVooaxlPzOyMLwEuB+0vyv2o?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <DF6199F05AC1C74EB34AA2D6E0270593@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70bdcb69-9cf2-423d-aeea-08d90b3acf38
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2021 18:15:46.0564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: svsd7GLcn7s+Laqqx7CrqXTv1S7YhJN/FQQTosIn6miwg5zkRcADWpIr+pK7CqMyjx3v+UAJfQ+D+Xo16herng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4726
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Michael Grzeschik wrote:
> On Wed, Apr 28, 2021 at 11:25:05PM +0000, Thinh Nguyen wrote:
>> Michael Grzeschik wrote:
>>> Hi Thinh,
>>>
>>> On Wed, Apr 28, 2021 at 01:45:11AM +0000, Thinh Nguyen wrote:
>>>> Michael Grzeschik wrote:
>>>>> On Tue, Apr 27, 2021 at 03:18:57AM +0000, Thinh Nguyen wrote:
>>>>>> Hi Michael,
>>>>>>
>>>>>> Thinh Nguyen wrote:
>>>>>>> Felipe Balbi wrote:
>>>>>>>>
>>>>>>>> HI,
>>>>>>>>
>>>>>>>> Michael Grzeschik <mgr@pengutronix.de> writes:
>>>>>>>>
>>>>>>>> <big snip>
>>>>>>>>
>>>>>>
>>>>>>
>>>>>> <bigger snip>
>>>>>>
>>>>>>
>>>>>>> I think I see the issue that Michael reported.
>>>>>>>
>>>>>>> The problem is that we're using num_pending_sgs to track both
>>>>>>> pending SG
>>>>>>> entries and queued SG entries. num_pending_sgs doesn't get updated
>>>>>>> until
>>>>>>> TRB completion interrupt (ie XferInProgress). Before the driver
>>>>>>> queues
>>>>>>> more SG requests, it will check if there's any pending SG in the
>>>>>>> started
>>>>>>> request list before it prepares more. Since the num_pending_sgs
>>>>>>> doesn't
>>>>>>> get updated until the request is completed, the driver doesn't
>>>>>>> process
>>>>>>> more until the request is completed.
>>>>>>>
>>>>>>> I need to review more on Michael's patches next week, but I think
>>>>>>> what
>>>>>>> he suggested makes sense (in term of properly usage of queued sgs v=
s
>>>>>>> pending sgs). BTW, please correct me if I'm wrong, but we do modify
>>>>>>> num_queued_sgs.
>>>>>>>
>>>>>>
>>>>>> There's still some issue with your patch. I think this should
>>>>>> cover it.
>>>>>> Let me know if it works for you.
>>>>>
>>>>> This works for me! Will you spin a proper patch from that?
>>>>
>>>> Sure. I can do that after 5.13-rc1 is released
>>>
>>> Great!
>>>
>>>>>
>>>>>> Note: this however probably needs more "Tested-by" and reviews
>>>>>> to make sure I'm not missing anything. I only ran some basic tests,
>>>>>> and will need to run more.
>>>>>
>>>>> You may already have mine:
>>>>>
>>>>> Tested-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>>>>
>>>>>> Let me know if this makes sense.
>>>>>
>>>>> From what I understand about the issue and the purpose of all
>>>>> variables this makes total sense to me. So thanks for taking over
>>>>> and make a proper solution.
>>>>>
>>>>> Thanks,
>>>>> Michael
>>>>>
>>>>
>>>> Thanks for the Tested-by.
>>>>
>>>> Btw, any reason for using SG with transfer less than PAGE_SIZE? I
>>>> assume
>>>> your platform is 4KB, but you're splitting your 3KB transfer to
>>>> smaller.
>>>> Was it like this before? Note that DWC3 has a limited number of
>>>> internal
>>>> TRB cache. But what you're doing now is fine and doesn't impact
>>>> performance.
>>>
>>> It all comes from the limitation of the uvc_video gadget. Look into the
>>> patches I send to support sg in uvc_video driver. It just maps entries
>>> from an sg list comming from videobuf2 to an req->sg list. In
>>> uvc_video_alloc_requests the req->length will be set to req_size which
>>> is calculated with:
>>>
>>> =A0ep->maxpacket(1024) * maxburst(1-15) * mult(1-3)
>>>
>>> With maxburst =3D 1 and mult =3D 3 it currently reults in an req->lengt=
h of:
>>>
>>> =A01024 * 1 * 3 =3D 3072
>>
>> I wasn't referring to this, I was just wondering why uvc uses SG.
>> Correct me if I'm wrong, but isn't uvc allocates and uses contiguous
>> buffer?
>=20
> Not necessarily. Depending on the source creating vb2 buffers with mmu
> enabled or directly you may get different patterns. The patches I send
> are able to also handle contiguous buffers. In that case vb2 would just
> hand over a scatter list with one big entry, which would be totally fine.
> In that case we would not have to scatter it for the gadget controller.
>=20
>> Depend on the setup, normal request may show better performance.
>=20
> Right. In my setup the data is coming from an mmu.
>=20

I see. Thanks for the clarification.

Thinh

