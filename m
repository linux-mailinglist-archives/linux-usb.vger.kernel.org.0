Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CADC94D591
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2019 19:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbfFTR7A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jun 2019 13:59:00 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:48490 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726384AbfFTR7A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jun 2019 13:59:00 -0400
Received: from mailhost.synopsys.com (dc8-mailhost2.synopsys.com [10.13.135.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 26E8CC1D5F;
        Thu, 20 Jun 2019 17:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1561053539; bh=RP/7JBL/WTv9/+qCVMuNaTVLm7840SPUyO3BM1fl+eE=;
        h=From:To:CC:Subject:Date:References:From;
        b=CFB29wZxyt2MTf0JgI7lFlBOOY901RwrOnaEYIcv9YYX6j99y20v+Jz7ypCmSM+La
         EmoqDiZdMfFEDt1xTIA4NetYo54pFoHcbCSKSMeT3sheQhueL98D3dEp9jEyoH/Nub
         8sMS2+NSJatlbwyDrM5gMAaLwrVJsFYXDTN4x402Y39i6NE4EBegOlv+sVRFPRhw5f
         Q8a8xrHzg+mNsADgeCxWm+bz0wnAac/gBBZ7I1p6q2h5ESNdNiNFmfp+11o2SRyKXk
         O/IeT6HDSgPLNWT4dC4Kn1dblU3L3+UwYi3zxqXvNbJ1Q4kKIYqsgO7SieXAg2KTJZ
         5FUYIhQcvq72Q==
Received: from us01wehtc1.internal.synopsys.com (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id B95D0A0065;
        Thu, 20 Jun 2019 17:58:58 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 us01wehtc1.internal.synopsys.com (10.12.239.231) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 20 Jun 2019 10:58:58 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 20 Jun 2019 10:58:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RP/7JBL/WTv9/+qCVMuNaTVLm7840SPUyO3BM1fl+eE=;
 b=pxdvoG2tzv/Ox/YcFAHjIK5bfGEiIMW/0suGkXc6S19dWLkzATcarzRZqh6GbtPkPCPCiihRUoJjl7UX6XgDm8Bz7/X/vI5hNDVm5FqA35ySrHguQrn8I1uibDphSVIjYDJbM0r7YqJ5jsdTUi/qKFZcllSImHF5YA+G8fU5b/I=
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com (10.172.78.22) by
 CY4PR1201MB0150.namprd12.prod.outlook.com (10.174.53.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Thu, 20 Jun 2019 17:58:55 +0000
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::d02c:35a1:b254:41da]) by CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::d02c:35a1:b254:41da%2]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 17:58:55 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        John Youn <John.Youn@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [RFC] Sorting out dwc3 ISOC endpoints once and for all
Thread-Topic: [RFC] Sorting out dwc3 ISOC endpoints once and for all
Thread-Index: AQHVHRZlsWV0TH3kp0u96EW7I6xXQg==
Date:   Thu, 20 Jun 2019 17:58:55 +0000
Message-ID: <CY4PR1201MB003758421C6E7B59560BEE8FAAE40@CY4PR1201MB0037.namprd12.prod.outlook.com>
References: <87a7etd8s7.fsf@linux.intel.com>
 <2B3535C5ECE8B5419E3ECBE30077290902E78AF3D7@us01wembx1.internal.synopsys.com>
 <30102591E157244384E984126FC3CB4F63A11B8A@us01wembx1.internal.synopsys.com>
 <87fto7gy1o.fsf@linux.intel.com>
 <30102591E157244384E984126FC3CB4F63A1230F@us01wembx1.internal.synopsys.com>
 <87a7eef5rl.fsf@linux.intel.com>
 <CY4PR1201MB0037018EDE2C83C27124CADBAAE50@CY4PR1201MB0037.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [198.182.56.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e329c34d-5c23-44b5-d9ad-08d6f5a8f677
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY4PR1201MB0150;
x-ms-traffictypediagnostic: CY4PR1201MB0150:
x-microsoft-antispam-prvs: <CY4PR1201MB0150CACB667E777297183F9DAAE40@CY4PR1201MB0150.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(136003)(366004)(396003)(39850400004)(189003)(199004)(68736007)(316002)(476003)(99286004)(74316002)(3846002)(229853002)(33656002)(486006)(446003)(8676002)(478600001)(102836004)(76176011)(110136005)(14444005)(14454004)(7736002)(8936002)(81156014)(66476007)(4326008)(7696005)(6116002)(256004)(186003)(305945005)(6636002)(91956017)(86362001)(2906002)(81166006)(25786009)(6506007)(9686003)(52536014)(5660300002)(26005)(66446008)(53936002)(76116006)(64756008)(6246003)(71190400001)(73956011)(66556008)(66066001)(55016002)(71200400001)(66946007)(6436002);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR1201MB0150;H:CY4PR1201MB0037.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: j4j1n54wHRr2mRrEiwCx6r9FwojHUx8cOWIk28kyo58H99b85DrzV5ZVSCyr3gTfaue02JTpYgVGVbiXoL/Qn+qFs7qQE5ja0uQ+l5kCOeIeJPdT9ej9PIxw1rBqrNVhm1yzhj8+fknI2RnxaXASP4DJpdIQtKZ10FxsYLv0Y3zqiLzMWXwwPCsSrz1IXZ6v6g+kxng/uRwQqsUOpVU2ucRjbaBM5QoiZUiD0bGVYpTLKlMbYwtQBfeyTJITNYxHnHX5ATeT/FneXee3GrKM239lYQ/njiM4IQhwX8OGQ485b5zvU7+vuo7lyJW4dePxBnFStSICAhPEHeEfhn3MUsM+orap0OavJLvebiAE3QmOKC+aGee51l8wljN5LbTh+x/Kb7tWGdRPmT6tbUxFnX3CLw5e7oYvtfmL3VYn+vg=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e329c34d-5c23-44b5-d9ad-08d6f5a8f677
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 17:58:55.7033
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thinhn@synopsys.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0150
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,=0A=
=0A=
Thinh Nguyen wrote:=0A=
> Felipe Balbi wrote:=0A=
>> Hi,=0A=
>>=0A=
>> Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:=0A=
>>>>>>> Would there be any obvious draw-back to going down this route? The =
thing=0A=
>>>>>>> is that, as it is, it seems like we will *always* have some corner =
case=0A=
>>>>>>> where we can't guarantee that we can even start a transfer since th=
ere's=0A=
>>>>>>> no upper-bound between XferNotReady and gadget driver finally queue=
ing a=0A=
>>>>>>> request. Also, I can't simply read DSTS for the frame number becaus=
e of=0A=
>>>>>>> top-most 2 bits.=0A=
>>>>>>>=0A=
>>>>>> For non-affected version of the IP, the xfernotready -> starttransfe=
r=0A=
>>>>>> time will have to be off by more than a couple seconds for the drive=
r=0A=
>>>>>> to produce an incorrect 16-bit frame number. If you're seeing errors=
=0A=
>>>>>> here, maybe we just need to code review the relevant sections to mak=
e=0A=
>>>>>> sure the 14/16-bit and rollover conditions are all handled correctly=
.=0A=
>>>>> I think what Felipe may see is some delay in the system that causes t=
he=0A=
>>>>> SW to not handle XferNotReady event in time. We already have the "ret=
ry"=0A=
>>>>> method handle that to a certain extend.=0A=
>>>>>=0A=
>>>>>> But I can't think of any obvious drawbacks of the quirk, other than=
=0A=
>>>>>> doing some unnecessary work, which shouldn't produce any bad=0A=
>>>>>> side-effects. But we haven't really tested that.=0A=
>>>>>>=0A=
>>>>> The workaround for the isoc_quirk requires 2 tries sending=0A=
>>>>> START_TRANSFER command. This means that you have to account the delay=
 of=0A=
>>>>> that command completion plus potentially 1 more END_TRANSFER completi=
on.=0A=
>>>>> That's why the quirk gives a buffer of at least 4 uframes of the=0A=
>>>>> scheduled isoc frame. So, it cannot schedule immediately on the next=
=0A=
>>>>> uframe, that's one of the drawbacks.=0A=
>>>>>=0A=
>>>>>=0A=
>>>>> Hi Felipe,=0A=
>>>>>=0A=
>>>>> Since you're asking this, it means you're still seeing issue with you=
r=0A=
>>>>> setup despite retrying to send START_TRANSFER command 5 times. What's=
=0A=
>>>>> the worse delay responding to XferNotReady you're seeing in your setu=
p?=0A=
>>>> There's no upper-bound on how long the gadget will take to enqueue a=
=0A=
>>>> request. We see problems with UVC gadget all the time. It can take a l=
ot=0A=
>>>> of time to decide to enqueue data.=0A=
>>> That's why there's a mechanism in the controller to return bus-expiry=
=0A=
>>> status to let the SW know if it had scheduled isoc too late. SW can do =
2=0A=
>>> things: 1) re-schedule at a later timer or 2) send END_TRANSFER command=
=0A=
>>> to wait for the next XferNotReady to try again.=0A=
>> All of this is still rather flakey. Can I send consecutive END_TRANSFER=
=0A=
>> commands and get new XferNotReady at any moment? Consider this=0A=
>> situation:=0A=
>>=0A=
>> . transfer started=0A=
>> . transfer completes with status Missed ISOC=0A=
>> . driver issues END_TRANSFER (as required by docs)=0A=
>> . XferNotReady fires=0A=
>> . driver updates current frame number=0A=
>> . several mS of nothing=0A=
>> . finally gadget enqueues a transfer=0A=
>> . Start Transfer command=0A=
>> . completes with Bus Expiry=0A=
>>=0A=
>> Can I issue *another* END_TRANSFER at this point? I don't even have a=0A=
>> valid transfer resource since transfer wasn't started.=0A=
> Yes you can. If the START_TRANSFER command completes, you will get the=0A=
> transfer resource index to use for END_TRANSFER command (regardless of=0A=
> bus-expiry status).=0A=
>=0A=
> However, there's a chance if the SW somehow keeps handling the=0A=
> XferNotReady event late over and over and the isoc transfer never get=0A=
> started. That's where you can create a quirk and use frame number from=0A=
> DSTS instead.=0A=
>=0A=
=0A=
I thought about this again. I think the best way to handle this is the=0A=
followings:=0A=
* For service interval less than 2 seconds, use DSTS and XferNotReady=0A=
frame number to calculate and schedule isoc.=0A=
* For service interval of 2 second or larger, just use XferNotReady=0A=
frame number.=0A=
* If START_TRANSFER command still fails with bus-expiry, then send=0A=
END_TRANSFER command to restart on a new XferNotReady. This should only=0A=
happen if the SW is too slow to handle XferNotReady event for over 2=0A=
seconds. This case should not happen often.=0A=
=0A=
Note: bus-expiry happens when |current frame - scheduled frame| > 4 seconds=
.=0A=
=0A=
This guarantees that the DWC3 will retry to schedule the isoc transfer=0A=
again. There's no need to create a quirk for the controller.=0A=
=0A=
What do you think?=0A=
=0A=
BR,=0A=
Thinh=0A=
=0A=
