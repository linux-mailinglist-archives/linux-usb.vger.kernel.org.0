Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E36EE14B
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 13:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbfD2L35 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 07:29:57 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.47.102]:34234 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727710AbfD2L35 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 07:29:57 -0400
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com [10.12.135.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 89946C008E;
        Mon, 29 Apr 2019 11:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1556537397; bh=Wm2E205PW6hAPsrsv8A1yulqDX1XHvbhb3yt+Qde81Q=;
        h=From:To:CC:Subject:Date:References:From;
        b=b5J4aiPdcXBO272byxDKQ1LiAbSrvpIWS8cuIcQEkEaEfyrTCPUmN4yB0aeCj2ecg
         rRxCMJGCKanCK8/dXIvl/ZcGtEEiQQMYy7VnprMPRj/Psoox9wPhxlCc+s2cQN6a52
         6Ye/hXoIObIyEt6319PYHc3KqMo91l4BD7NnEwUA3iobmDJ7YrJF3I71M+ItG3HFC/
         DMyw/YNzMzdZYo+LtG39q97ro5+L7/u8uKCaCyoNI5rI+YBiVYwAeCdofMGraDaaYp
         97KOe/LJKuh2eBjEJDzFaW9XD+O1nJiP9/BrPtOZhL8HxiW+vydkgyrNhKHGnaI/+2
         zusz2DKx2LEdQ==
Received: from US01WXQAHTC1.internal.synopsys.com (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 50BC6A0098;
        Mon, 29 Apr 2019 11:29:56 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 29 Apr 2019 04:29:55 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 29 Apr 2019 04:29:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/2Us+Ndnmq3Zj+reVzcpe8HrXBhbsWqPCqSUWdD0t0=;
 b=wyPX7L2EDEGL4HR6FTPQ2wZHBBmA3b7vlam6cYRgYtMn32d+5IJZh2eJnJlwg33CON6ElmTKpRkN/WVg6uhNPiQgJ/PzsGHpksxWgzHkETH3tz1gHZgpQ4t+ORnb3rpVpLvxQsOwEuJjr66mPjsyHMKINTWzel4QDF3RZkB+gJE=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB2510.namprd12.prod.outlook.com (52.132.196.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Mon, 29 Apr 2019 11:29:53 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::1982:4b45:2adf:9a1f]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::1982:4b45:2adf:9a1f%4]) with mapi id 15.20.1835.010; Mon, 29 Apr 2019
 11:29:53 +0000
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Doug Anderson <dianders@chromium.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v1 08/14] usb: dwc2: Add default param to control power
 optimization.
Thread-Topic: [PATCH v1 08/14] usb: dwc2: Add default param to control power
 optimization.
Thread-Index: AQHU9qJ/tHbivSmPyUKJBC/Mf5HbVQ==
Date:   Mon, 29 Apr 2019 11:29:53 +0000
Message-ID: <SN1PR12MB2431B8BC296AF49152702868A7390@SN1PR12MB2431.namprd12.prod.outlook.com>
References: <cover.1555672441.git.arturp@synopsys.com>
 <15bba89b920e29e27de4cfaac546834fba5d1a76.1555672441.git.arturp@synopsys.com>
 <CAD=FV=U4BXuT1rM--UBo6vTfCHpm=qsWydoO_bNXYRDxu22twA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-originating-ip: [84.53.141.183]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3345704-372c-4ab3-d05a-08d6cc95ffef
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:SN1PR12MB2510;
x-ms-traffictypediagnostic: SN1PR12MB2510:
x-microsoft-antispam-prvs: <SN1PR12MB2510E6AA95ACDCBA2C31D3EAA7390@SN1PR12MB2510.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(396003)(39850400004)(376002)(366004)(346002)(189003)(199004)(7736002)(14454004)(305945005)(76176011)(74316002)(256004)(478600001)(25786009)(6436002)(6916009)(5660300002)(73956011)(66946007)(91956017)(71190400001)(71200400001)(76116006)(66066001)(4326008)(66556008)(66476007)(86362001)(229853002)(52536014)(64756008)(66446008)(446003)(54906003)(6246003)(33656002)(107886003)(7696005)(316002)(486006)(476003)(186003)(26005)(68736007)(53546011)(6506007)(81166006)(102836004)(8676002)(81156014)(55016002)(99286004)(8936002)(53936002)(97736004)(2906002)(6116002)(3846002)(9686003);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB2510;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OoNq8SkrrtJS3miSsi5vXdfwLkNzjPvxV+dGe6Wr820qWwypF5CaqcHfmJAS+Xq95C0DCbhrsNcUQ+47NH0MAMYDb+/fAcy4FX+gUm87QttjbOUFIcoLHtmjV2U50s4UK2rhbo2a/dUtgPojYLPQ3j8pd3UaqSGPPcUxp87zTBlnmMYV0b9cwXRqdaL3XAxvkhjLwDdWq4nqDW4x5aC2/1YRPv07Nve1QacmQ+G1VFsii78H0qaToWGMsueFlobLs48SNB97gLyzeIo7AOjmUGeFGwogVBYoPg8iv47kosZOl3GeB6E7Ho88ayTj6pvm+LkkAUFVbdu8cXeNxUjV3WI5nLJglanVHFf0EYUGqO3PpcaS4DjuVjxQtrTDGgw8I/8FYpDWLi6Nt2Lgy/5DrGGdcTi/WaBWUtm/iN0M1LU=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d3345704-372c-4ab3-d05a-08d6cc95ffef
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 11:29:53.4412
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2510
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,=0A=
=0A=
On 4/27/2019 00:46, Doug Anderson wrote:=0A=
> Hi,=0A=
> =0A=
> On Fri, Apr 19, 2019 at 11:53 AM Artur Petrosyan=0A=
> <Arthur.Petrosyan@synopsys.com> wrote:=0A=
>>=0A=
>> - Added a default param "power_saving" to enable or=0A=
>>    disable hibernation or partial power down features.=0A=
>>=0A=
>> - Printed hibernation param in hw_params_show and=0A=
>>    power_saving param in params_show.=0A=
>>=0A=
>> Signed-off-by: Artur Petrosyan <arturp@synopsys.com>=0A=
>> Signed-off-by: Minas Harutyunyan <hminas@synopsys.com>=0A=
>> ---=0A=
>>   drivers/usb/dwc2/core.h    |  3 +++=0A=
>>   drivers/usb/dwc2/debugfs.c |  2 ++=0A=
>>   drivers/usb/dwc2/params.c  | 19 +++++++++++++------=0A=
>>   3 files changed, 18 insertions(+), 6 deletions(-)=0A=
>>=0A=
>> diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h=0A=
>> index 30bab8463c96..9221933ab64e 100644=0A=
>> --- a/drivers/usb/dwc2/core.h=0A=
>> +++ b/drivers/usb/dwc2/core.h=0A=
>> @@ -373,6 +373,8 @@ enum dwc2_ep0_state {=0A=
>>    *                      case.=0A=
>>    *                      0 - No (default)=0A=
>>    *                      1 - Yes=0A=
>> + * @power_saving:      Specifies if power saving is enabled or not. If =
it is=0A=
>> + *                     enabled power_down functionality will be enabled=
.=0A=
>>    * @power_down:         Specifies whether the controller support power=
_down.=0A=
>>    *                     If power_down is enabled, the controller will e=
nter=0A=
>>    *                     power_down in both peripheral and host mode whe=
n=0A=
> =0A=
> Why are you adding a new parameter?  power_saving should be exactly=0A=
> the same as "power_down !=3D DWC2_POWER_DOWN_PARAM_NONE".  Just use that=
=0A=
> anywhere you need it.=0A=
Customers should have a parameter using which they will disable entire =0A=
power saving hibernation and Partial Power Down support.=0A=
=0A=
power_down is used to see which power saving mode we got =0A=
(hibernation/partial power down).=0A=
=0A=
> =0A=
> Having two parameters like you're doing is just asking for them to get=0A=
> out of sync.  ...and, in fact, I think they will get out of sync.  On=0A=
> rk3288, for instance:=0A=
> =0A=
> -> dwc2_set_default_params()=0A=
> ---> power_saving =3D true=0A=
> ---> dwc2_set_param_power_down()=0A=
> -----> power_down =3D DWC2_POWER_DOWN_PARAM_PARTIAL=0A=
> -> set_params(), which is actually dwc2_set_rk_params()=0A=
> ---> power_down =3D 0=0A=
Setting power_down =3D 0  is a wrong and old option of disabling power =0A=
saving feature because if we set power_down =3D 0 then it shows that there =
=0A=
is no support for any power saving mode. That is why this patch is =0A=
introduced to provide an easier way of disabling power saving modes.=0A=
> =0A=
> =0A=
> ...so at the end of dwc2_init_params() you will have power_saving =3D=0A=
> true but power_down set to DWC2_POWER_DOWN_PARAM_NONE.  That seems=0A=
> bad.  ...and, in fact:=0A=
> =0A=
> # grep '^power' /sys/kernel/debug/*.usb/params=0A=
> /sys/kernel/debug/ff540000.usb/params:power_saving                  : 1=
=0A=
> /sys/kernel/debug/ff540000.usb/params:power_down                    : 0=
=0A=
> /sys/kernel/debug/ff580000.usb/params:power_saving                  : 1=
=0A=
> /sys/kernel/debug/ff580000.usb/params:power_down                    : 0=
=0A=
> =0A=
> =0A=
> ...so while you could fix all of the various set_params() functions,=0A=
> it seems better to just drop this patch since I don't think it buys=0A=
> anything.=0A=
I don't think we should drop this patch. Because, it is introducing the =0A=
correct way of disabling power saving (hibernation/partial power down =0A=
modes). Explanation is listed above.=0A=
=0A=
> =0A=
> -Doug=0A=
> =0A=
=0A=
=0A=
-- =0A=
Regards,=0A=
Artur=0A=
