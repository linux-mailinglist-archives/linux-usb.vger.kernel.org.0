Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA3C72751D5
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 08:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbgIWGrs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 02:47:48 -0400
Received: from thsbbfxrt02p.thalesgroup.com ([192.93.158.29]:43818 "EHLO
        thsbbfxrt02p.thalesgroup.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726179AbgIWGrs (ORCPT
        <rfc822;Linux-usb@vger.kernel.org>); Wed, 23 Sep 2020 02:47:48 -0400
X-Greylist: delayed 307 seconds by postgrey-1.27 at vger.kernel.org; Wed, 23 Sep 2020 02:47:46 EDT
Received: from thsbbfxrt02p.thalesgroup.com (localhost [127.0.0.1])
        by localhost (Postfix) with SMTP id 4Bx7sB2T8mzJyxR;
        Wed, 23 Sep 2020 08:42:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thalesgroup.com;
        s=xrt20181201; t=1600843358;
        bh=dGEYv1kyZoifDJ3AgIJlKlLDGVl4azhVpcF0hLh/67o=;
        h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
         Content-Transfer-Encoding:MIME-Version:From;
        b=bZUAe4gkvE0O7ujdULdkmAVimG1F4JuLbENl8EgE3zir/jeX1V7adPjD6OajDxpzR
         a5fNtuUNVaJbQFBXnAF5CVmLWuyjG7lmy1yzdg5hVNk9mx13M5eXPQkD4rGWPCNN19
         ILwEzPCM+S9Dcr4TNmbhe6Ah66rdqGm5lSaBHoEJJYjsaG+JaKMPLyK3mzwwMpsCSd
         p0NV4GkXy8nBex7snVDVtfl4g09YFtjLSag9v3AEJ9pzIUzWbOMivPekau7CHKMo/B
         Wefgx9wkm9xX3qFQ1K1CzrreZ1M6E9SfUK4zGRWatU+c6MG1h+dQcBvNGFQCmGgevt
         U6xNrzfTPP1cQ==
X-MTA-CheckPoint: {5F6AEE59-1-C42F090A-662F}
Authentication-Results: thsbbfxss01p.thalesgroup.com;
        dkim=pass (1024-bit key; unprotected) header.d=thalesgroup.onmicrosoft.com header.i=@thalesgroup.onmicrosoft.com header.b="LqfzGTDf";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpXt8aBxB/hF3EaWrf98oZQHhbYeI/h6u2GiLDX/l0HAPpHo6pjot9OBA8f8Ny2+ibKIeT1qgd6LEOyuhRFRB/t4SLbt3DM6ynASr+yokeu1jtas8+knxHZ+CDyTK1XqubanmbAcXiMLt1UMF37cnUE+ay6gqTC+jylN60zBRo0Be2HZHdukf7hdH/Lq25qzDsgWxqFUBhAQWUqascaviv96a4N5STjDjElNOxzDijHBDCpoLkfoOoyMgR0RdQVGTkk4uR0MNn62TW/iM0CyGlSwlCHC0MN/Vh8AksbSE0ngLwScp5doYdXooh+XSbGzLM/kgOUe06am3n6Xw/Mf4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGEYv1kyZoifDJ3AgIJlKlLDGVl4azhVpcF0hLh/67o=;
 b=cCdn8g60WBZkU9sgMw1CiNHjyEcQmdR5104RWuloJ1DenQfiSV4z7J6y+8Vte3n0Ivmra3miSuo7uE8CGQggi+XzxlBPVCuxnSjBV08C5/75HZZN///jOq+wdWTDOYigc+hDHuPeRk4BisF2px2sre1M+6eOpwvzZ2YwxCiZdRPVl6BdoEAa3Mar/i3dDEZa829DO0B8mJsMAhhJwN9+vca59Zr9s0o33/o4EPCqmo4NqxEMWhdiHoL8SBoY7EuQ9rCybmUHaqinU0Uwod/MDovhWPpfMaNTPHCZyiG5MmnwA2Re66Hr2OL9MdlwJoYMb39kxcvmHNuDPTmEid/V7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=thalesgroup.com; dmarc=pass action=none
 header.from=thalesgroup.com; dkim=pass header.d=thalesgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thalesgroup.onmicrosoft.com; s=selector2-thalesgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGEYv1kyZoifDJ3AgIJlKlLDGVl4azhVpcF0hLh/67o=;
 b=LqfzGTDfVPGrDzE7+nqNL76wVt4Xcirx7DnVnT6TpG5NIgxnDQOdBuPawiN/+23t2VUW78GYMSMH9Xc+hIhdzV7HL7hZdQhSQYgCiJ43xR206Qw5svDEdJAwUt2zCC8EiOQxKSeDpXbmtGWiYvn/qjiNbnf2KPAl1eyAHgU+fk4=
From:   GARG Shivam <shivam.garg@thalesgroup.com>
To:     "Linux-usb@vger.kernel.org" <Linux-usb@vger.kernel.org>
CC:     Peter Chen <hzpeterchen@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: RE: Linux Crash with Gadget serial driver
Thread-Topic: Linux Crash with Gadget serial driver
Thread-Index: AdZ7Aw+onVx5vBMuRyOE8DOq7nQmHAAAc6OAABHIIAAADx4bQAAA8gQABXlXoRAAALsGgA==
Date:   Wed, 23 Sep 2020 06:42:36 +0000
Message-ID: <MRXP264MB0904F9E7E2DA10CA3BB60028F8380@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
References: <MRXP264MB0904FFAD5E50E6A6F4AB6419F8570@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
 <CAL411-oBThK1PqKWhbdUSEsCuApi6CWT5wzxye6P6RXsQuXhfg@mail.gmail.com>
 <MRXP264MB09048712EAB615DD8CF7AF5BF8540@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
 <20200826093534.GA2474406@kroah.com>
 <MRXP264MB09044A6FBB51DFFB273EA6B1F8380@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
In-Reply-To: <MRXP264MB09044A6FBB51DFFB273EA6B1F8380@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=thalesgroup.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d74ecde-8e3e-47bc-49cf-08d85f8bdb9b
x-ms-traffictypediagnostic: MRXP264MB0774:
x-microsoft-antispam-prvs: <MRXP264MB077401BC1E272590E6678A91F8380@MRXP264MB0774.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 54ZtwCs/8mDuouOxFyJ+h77riBuDyKNlhrdGFGEiX2Thf/jJA8lT1f+wkDpH3vEST+hodWo0B6K6IMT6UylGEXD+J/lJ0O/0Val5iS3jD6lb+tCa0PIViV7s9KDUc4eUnB7p7DsVFEKWuZocb27tYY4QaNUzeddczQ+uIw6yQszxue3vXZsPwrcZ3yEUw6ilzxOpxJlzLq03P1+VFEn2G2WUXd48LSC3m9IPta9f0lcmE3CEI8M17g1AMocIiwblNkJLYUMcdpwodI7MuiQNuNi0wCCS0jlbz5W3eEjPmxG14RamSkOebEYQtGRwOhVZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(366004)(396003)(376002)(33656002)(2906002)(83380400001)(6916009)(2940100002)(86362001)(54906003)(26005)(55016002)(186003)(66946007)(6506007)(7696005)(76116006)(4326008)(71200400001)(52536014)(478600001)(8936002)(5660300002)(53546011)(66476007)(66556008)(8676002)(9686003)(66446008)(64756008)(316002)(55236004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: h1+7xv1gWeckN/gMbIwAiwSKVIbUAqjKeKz1VKW7IVT7wJa4W64JP0gjfvvVH67Fl4HoBmngWjEV39jc6Y4DGHYyRS59Z5z+IqhWiqaZYBbFc57Hn69ZdTJAoQlU+6CtLHCH6IihF9lTbGHJMXOGcOP2ZS/ER3YJIPy8cZcoovtqQcV843W/pYqpAYh0zF0PRGloMWVgUQKFWfchWsDx8fIHCPJbJDzN27Q13Mr/oorfJT7O6lOMOjYlu37Y6//N7R4wA6gwS55apWv0bynnKlOkJVIUYkL/GiEG6OuNeeKhVM7AmfXdejmy4rMsmdXSe5vJtN+LdywwcUr+DpmL9RdOfPd892bCBYsG7D/w0AXwCI+dkzxq9ca/w2Wn2rAOWyG2pNXLvGPkKyHQXY0SzBuNR23vZPFOcW2sLm3DBWn1yNQQunH/tP2DjiC3Q1+e4ICNdxp2I9ASE57cJInSxmRloqvRvqVm+SjAqjBJsm/YhsFu25HdWTSH9XxpzhIg7ykPEw7wuDYLJI+/DXEqVvA25Cv6xee3uVMyUD+z5yG9MRnD2mGWWOqboVRRJ3HCYIrD2cg8JfgCoteM7rUQaEoATQQqKb53XH1mDOo2msDOOx9H00hbSvzHycQ45xY53KObdxMLiWnEfDv2B4+HJw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Thalesgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d74ecde-8e3e-47bc-49cf-08d85f8bdb9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2020 06:42:36.1765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6e603289-5e46-4e26-ac7c-03a85420a9a5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ewuCaqBisKHecxyQVM9tTe2GOIuSeK3X9TCmattHVQsf5anBuoa8iBSzG6DOwrSoH/apiqpX+xXlHlIV/h60qs5AOXEGFuFxZDFM7HrXwS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0774
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2020.9.23.63317, AntiVirus-Engine: 5.77.0, AntiVirus-Data: 2020.9.23.5770000
X-Sophos-SenderHistory: ip=104.47.25.101,fs=196069,da=49557887,mc=5093,sc=0,hc=5093,sp=0,fso=48352399,re=147,sd=0,hd=30
X-PMX-Spam: Gauge=IIIIIIIII, Probability=9%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, SUPERLONG_LINE 0.05, BODY_SIZE_5000_5999 0, BODY_SIZE_7000_LESS 0, DKIM_SIGNATURE 0, DQ_S_H 0, IN_REP_TO 0, KNOWN_MTA_TFX 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, NO_CTA_URI_FOUND 0, NO_URI_HTTPS 0, REFERENCES 0, SPF_SOFTFAIL 0, SXL_IP_TFX_WM 0, WEBMAIL_SOURCE 0, WEBMAIL_XOIP 0, WEBMAIL_X_IP_HDR 0, __ANY_URI 0, __ARCAUTH_DKIM_PASSED 0, __ARCAUTH_DMARC_PASSED 0, __ARCAUTH_PASSED 0, __ARC_SEAL_MICROSOFT 0, __ARC_SIGNATURE_MICROSOFT 0, __AUTH_RES_DKIM_PASS 0, __BODY_NO_MAILTO 0, __BOUNCE_CHALLENGE_SUBJ 0, __BOUNCE_NDR_SUBJ_EXEMPT 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_AGE_BODY 0, __CT 0, __CTE 0, __CT_TEXT_PLAIN 0, __DQ_IP_FSO_LARGE 0, __DQ_NEG_HEUR 0, __DQ_NEG_IP 0, __DQ_S_HIST_1 0, __DQ_S_HIST_2 0, __DQ_S_IP_MC_100_P 0, __DQ_S_IP_MC_10_P 0, __DQ_S_IP_MC_1K_P 0, __DQ_S_IP_MC_1_P 0, __DQ_S_IP_MC_5_P 0,
 __FORWARDED_MSG 0, __FRAUD_BODY_WEBMAIL 0, __FRAUD_MONEY_BIG_COIN 0, __FRAUD_MONEY_BIG_COIN_DIG 0, __FRAUD_WEBMAIL 0, __FUR_RDNS_OUTLOOK 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_XOIP 0, __INT_PROD_GPS 0, __IN_REP_TO 0, __MAIL_CHAIN 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __MULTIPLE_RCPTS_TO_X2 0, __NO_HTML_TAG_RAW 0, __RDNS_WEBMAIL 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_ALPHA_NEGATE 0, __SUBJ_REPLY 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi All,

I think backtrace info get messed up due to email configuration. Let me pos=
t again.

root@(none):~# INFO: rcu_sched detected stalls on CPUs/tasks:
6: (39 GPs behind) idle=3D83d/1/0 softirq=3D0/0 fqs=3D5228
(detected by 4, t=3D5254 jiffies, g=3D8752, c=3D8751, q=3D75869)
Task dump for CPU 6:
swapper/6 R running task 0 0 1 0x00000804
Call Trace:
[c0000001f01379f0] [c000000000005e18] .do_IRQ+0x84/0x118 (unreliable)
[c0000001f0137a80] [c00000000001793c] exc_0x500_common+0xfc/0x100
- interrupt: 501 at .book3e_idle+0x24/0x4c
LR =3D .book3e_idle+0x24/0x4c
[c0000001f0137d70] [c0000000000094a8] .arch_cpu_idle+0x34/0xa0 (unreliable)
[c0000001f0137de0] [c000000000086bd0] .cpu_startup_entry+0x204/0x2ac
[c0000001f0137ee0] [c00000000001edf8] .start_secondary+0x2b0/0x2d4
[c0000001f0137f90] [c00000000000046c] start_secondary_prolog+0x10/0x14


This is also seen sometimes:

INFO: task udhcpc:3285 blocked for more than 120 seconds.
Tainted: G O 4.1.8-rt8+gbd51baffc04e #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
udhcpc D 00003fff87215f78 0 3285 3245 0x00000000
Call Trace:
[c0000001c42ef710] [c000000000008878] .__switch_to+0x8c/0xc4
[c0000001c42ef790] [c0000000009604cc] .__schedule+0x230/0x53c
[c0000001c42ef840] [c00000000096081c] .schedule+0x44/0xe4
[c0000001c42ef8c0] [c000000000963de4] .schedule_timeout+0x194/0x210
[c0000001c42ef9a0] [c0000000009616c4] .wait_for_common+0x170/0x1d0
[c0000001c42efa60] [c00000000009d4ec] .wait_rcu_gp+0x5c/0x74
[c0000001c42efb10] [c00000000009ee7c] .synchronize_sched+0x4c/0x70
[c0000001c42efb80] [c0000000007df974] .synchronize_net+0x20/0x4c
[c0000001c42efbf0] [c000000000906874] .__unregister_prot_hook+0x124/0x1c8
[c0000001c42efc80] [c000000000907014] .packet_do_bind+0x184/0x1e4
[c0000001c42efd10] [c0000000007c2d8c] .SyS_bind+0xf4/0x110
[c0000001c42efe30] [c000000000000698] system_call+0x38/0xc4

Thanks
Shivam
-----Original Message-----
From: GARG Shivam=20
Sent: Wednesday, September 23, 2020 12:07 PM
To: Linux-usb@vger.kernel.org
Cc: Peter Chen <hzpeterchen@gmail.com>; Greg KH <gregkh@linuxfoundation.org=
>
Subject: RE: Linux Crash with Gadget serial driver

Hi All,

I agree it is an old kernel but still can you look into the backtrace and g=
uide me how I can proceed to stop the host crash.

Below is the backtrace info that is coming as soon as I connect my gadget s=
erial driver supported device(USB) to FreeBSD.

Backtrace #1

root@(none):~# INFO: rcu_sched detected stalls on CPUs/tasks:
6: (39 GPs behind) idle=3D83d/1/0 softirq=3D0/0 fqs=3D5228 (detected by 4, =
t=3D5254 jiffies, g=3D8752, c=3D8751, q=3D75869) Task dump for CPU 6:
swapper/6 R running task 0 0 1 0x00000804 Call Trace:
[c0000001f01379f0] [c000000000005e18] .do_IRQ+0x84/0x118 (unreliable) [c000=
0001f0137a80] [c00000000001793c] exc_0x500_common+0xfc/0x100 - interrupt: 5=
01 at .book3e_idle+0x24/0x4c LR =3D .book3e_idle+0x24/0x4c [c0000001f0137d7=
0] [c0000000000094a8] .arch_cpu_idle+0x34/0xa0 (unreliable) [c0000001f0137d=
e0] [c000000000086bd0] .cpu_startup_entry+0x204/0x2ac [c0000001f0137ee0] [c=
00000000001edf8] .start_secondary+0x2b0/0x2d4 [c0000001f0137f90] [c00000000=
000046c] start_secondary_prolog+0x10/0x14

This is also seen sometimes:

INFO: task udhcpc:3285 blocked for more than 120 seconds.
Tainted: G O 4.1.8-rt8+gbd51baffc04e #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
udhcpc D 00003fff87215f78 0 3285 3245 0x00000000 Call Trace:
[c0000001c42ef710] [c000000000008878] .__switch_to+0x8c/0xc4 [c0000001c42ef=
790] [c0000000009604cc] .__schedule+0x230/0x53c [c0000001c42ef840] [c000000=
00096081c] .schedule+0x44/0xe4 [c0000001c42ef8c0] [c000000000963de4] .sched=
ule_timeout+0x194/0x210 [c0000001c42ef9a0] [c0000000009616c4] .wait_for_com=
mon+0x170/0x1d0 [c0000001c42efa60] [c00000000009d4ec] .wait_rcu_gp+0x5c/0x7=
4 [c0000001c42efb10] [c00000000009ee7c] .synchronize_sched+0x4c/0x70 [c0000=
001c42efb80] [c0000000007df974] .synchronize_net+0x20/0x4c [c0000001c42efbf=
0] [c000000000906874] .__unregister_prot_hook+0x124/0x1c8
[c0000001c42efc80] [c000000000907014] .packet_do_bind+0x184/0x1e4 [c0000001=
c42efd10] [c0000000007c2d8c] .SyS_bind+0xf4/0x110 [c0000001c42efe30] [c0000=
00000000698] system_call+0x38/0xc4


Thanks
Shivam



-----Original Message-----
From: Greg KH <gregkh@linuxfoundation.org>
Sent: Wednesday, August 26, 2020 3:06 PM
To: GARG Shivam <shivam.garg@thalesgroup.com>
Cc: Peter Chen <hzpeterchen@gmail.com>; Linux-usb@vger.kernel.org
Subject: Re: Linux Crash with Gadget serial driver

On Wed, Aug 26, 2020 at 09:09:32AM +0000, GARG Shivam wrote:
> I am with Kernel version 4.1.

4.1 is over 6 years old and over 500 thousand changes and fixes behind what=
 we are all working with now.

Please work with your vendor who is forcing you to remain on an obsolete ke=
rnel version like this, as you are paying them for that type of support, th=
ere is nothing that we can do here with this, sorry.

good luck!

greg k-h
