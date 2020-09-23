Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6FA2751BD
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 08:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgIWGlz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 02:41:55 -0400
Received: from thsbbfxrt01p.thalesgroup.com ([192.54.144.131]:44976 "EHLO
        thsbbfxrt01p.thalesgroup.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726179AbgIWGly (ORCPT
        <rfc822;Linux-usb@vger.kernel.org>); Wed, 23 Sep 2020 02:41:54 -0400
X-Greylist: delayed 301 seconds by postgrey-1.27 at vger.kernel.org; Wed, 23 Sep 2020 02:41:51 EDT
Received: from thsbbfxrt01p.thalesgroup.com (localhost [127.0.0.1])
        by localhost (Postfix) with SMTP id 4Bx7kT2qg8z45QG;
        Wed, 23 Sep 2020 08:36:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thalesgroup.com;
        s=xrt20181201; t=1600843009;
        bh=bY/AJ+8L5SI8hL8Gfg8qI8VKKezBOKQfYvdQxuiUs6M=;
        h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
         Content-Transfer-Encoding:MIME-Version:From;
        b=zRyZ5kTE3hHa35zQgxOcIThVfI8T6yHVc9z52hOrnK6cCHSzdHyPYq/JOP5x5RkfR
         TZ+W3lpdhXVDP6f75UWe9pBumBBSlVZiteFKiHgB6ABY9YEALWRBWuwLaz4FtlZP1h
         htDIG2mVZody3WANbfb9J8Xq/8ihOSw/4AVfgKXpEgOcyFZFo/C/mvVItfutIl+Y5P
         U2y9Qp9nyjKcqUxZCTmTVuGT829/1NLAKdBJo5C8Q+h6Lu31p1gWC7w9qcP9IFl43T
         CrQIEx+fgUS6yT9bhqT9pNZhYeP8oOXYYQOYKDuRbrUAttE+l/mPH393xLUOgLIspm
         3g8nWZqKBJ+9w==
X-MTA-CheckPoint: {5F6AECF9-0-C52F090A-6656}
Authentication-Results: thsbbfxss01p.thalesgroup.com;
        dkim=pass (1024-bit key; unprotected) header.d=thalesgroup.onmicrosoft.com header.i=@thalesgroup.onmicrosoft.com header.b="5AZLdpcz";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8oiE18JIO2fy4/Hnkt+DMsZehQFBv7H8yPhIABObmIA69a16kq4Xl9WZ8DhaaVCOgiNb8ggAiH+6T7vpASGlF17V4YMIb+3SO9bc6Q74KNyCPZdX4Yx5/TEeF4RAhzB/qpYDOfEPOVGMr3Nv2YW5W57Pj4tCnDl4Yfxbl2F/vpsvQMibD4bhPesXOHNI901/tDTGEBIBLxi5OvCe38FBy8VvRjZx5cPhu11KuJyIpXYWuUaBHAaNcecRTR/90ChTymJ5E23+H0WuVmlUiCkSR4a38wNi6d50OB4emW3qN1WVSq+U4VSC5xqPO8kBUecYED5ZDmch8NiufIPdkGU9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bY/AJ+8L5SI8hL8Gfg8qI8VKKezBOKQfYvdQxuiUs6M=;
 b=fMDccQRBRXYkG+vvFEg3HUnD/kItr/SyjRECJj8gvTYrCMZabecUtHmMbg/Mk12euam7Xsic+1if3giE1eYAZLEVGFB92G+bFMskai3lhNwqd/Cit5Rb4tS0ACkJqdwvgqZs7cMNfHQxLJBUHAPHK6//lc37SGMAir53qas8/j03GEsZDqNmMHrtbBwgtoUVOqa6i+VDFdBPaaadEl9qnWIIlmHHdMgIf0LhkCVUKpY43O1f/WpE5dIuf/lC23X0LyHRCTkglnB/yJTfoblrbcnJOTCyRmlHjE4L2D3yg0U3+feI6uNyIo7gDyYiD8g+lanwnqCLUpY2SBiJJSjzkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=thalesgroup.com; dmarc=pass action=none
 header.from=thalesgroup.com; dkim=pass header.d=thalesgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thalesgroup.onmicrosoft.com; s=selector2-thalesgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bY/AJ+8L5SI8hL8Gfg8qI8VKKezBOKQfYvdQxuiUs6M=;
 b=5AZLdpczQgb+FBsDGDFqitgUB6f+Pps/125i8Ec+1AcrQwZDj+s8SOH9/vma/qghBMUBRm4PsRE3jXrSfNN4S66b0D2pYyEYu3w80hqDiMcxjLQ0YtOCFhyZE2uS0VvEvCf8EmgW+ZjwZxcNo/Cz0b5Djl9ZGKo52OWpyMuV6Sw=
From:   GARG Shivam <shivam.garg@thalesgroup.com>
To:     "Linux-usb@vger.kernel.org" <Linux-usb@vger.kernel.org>
CC:     Peter Chen <hzpeterchen@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: RE: Linux Crash with Gadget serial driver
Thread-Topic: Linux Crash with Gadget serial driver
Thread-Index: AdZ7Aw+onVx5vBMuRyOE8DOq7nQmHAAAc6OAABHIIAAADx4bQAAA8gQABXlXoRA=
Date:   Wed, 23 Sep 2020 06:36:40 +0000
Message-ID: <MRXP264MB09044A6FBB51DFFB273EA6B1F8380@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
References: <MRXP264MB0904FFAD5E50E6A6F4AB6419F8570@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
 <CAL411-oBThK1PqKWhbdUSEsCuApi6CWT5wzxye6P6RXsQuXhfg@mail.gmail.com>
 <MRXP264MB09048712EAB615DD8CF7AF5BF8540@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
 <20200826093534.GA2474406@kroah.com>
In-Reply-To: <20200826093534.GA2474406@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=thalesgroup.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c83448ba-3122-4cc1-5a34-08d85f8b0796
x-ms-traffictypediagnostic: MR2P264MB0801:
x-microsoft-antispam-prvs: <MR2P264MB0801BB69DE45BD280689B0F9F8380@MR2P264MB0801.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T40MfcsJ/wbqZp0usgF2Z4Z+jHo2udAqTyvnG26GWh8MlanpiuID+mHR8ivnRxKsZk2qRfsTA/zWjOz5TJJPhmk1yEplH4rKps+rf8ChWPF2hTtXWfDO44BAEM9SSEiJieF7LP7l0Q12jCvuACl3GSJ0X5dlevGavL5FTabyaDr4cAuHK3MZsl6zmXlSk6zVoKgmsB5spsWBnnEOsXdUODsbVskdqqCEeFgBONIJe42lYrN4dEbDKmM3N9fmmRlCEcy4UuM6WqoNWTY6uBsg8MkKGkWhLgReUVTOuAe5eUIEDzyZGwWYnDvVJYsMuOuu
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(7696005)(86362001)(186003)(26005)(6506007)(55236004)(83380400001)(8676002)(6916009)(53546011)(8936002)(9686003)(71200400001)(478600001)(64756008)(33656002)(55016002)(76116006)(2906002)(66476007)(4326008)(66946007)(66556008)(66446008)(5660300002)(316002)(52536014)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: I9RR/r1Yz3Q8cYQjakJa71qu3VH9Oy0t5wgxpJx4fT1mu2PU6TicLeAiivPqZxbf1J1GI5l/bsEEcMFSCo4QPLp+t0JRrxcdJVFSOPMr0vC3kot/HqfBP4DeGw0KvXVHdPwAQVpY3WR4J5IlhLhPKcP8+vtvXmshtpH7yRvm0Y9z/A8ppgNyYBJH1WPISE40pc3gDPGGiaBPxrHqI6kanNYNiIQm1uCudxVpbUJHjQ/uXOknjBkYNOniv6DnIDU050WXVRfT8taFEsHaJ4otQ/EDmP0zNbrSo1Rvd6K6Plas0vjgKhMuI3XKdrSFrLqEUHS0HOSYqkmvsFwTDVvaZ4uxUzJ6BefDslPe9H2KI6FzuninS3Ook0nhSsmdC1aXmgu0LxG8p5/X0yAQ1QHg9b4/EZsfNejCF1bdWpPDai1OqNtXw2WnDXfkN35LxwNP97Iu5x60+0f+jD2WzrY2+iBQnkLzsY8UhhIgO7S78qPv/TS3TRy0JyzjJADWSp5Te48L7M7hqKgja9dHMKO1D7x/KP2VIH8NQ05NEdW7wiEcKaiFU3nXtGJtFVUhJB05Q60ra2h3ayMf98onkitxrCeo++8j8dO4XOrOEmMtzrJmc55n39NZdtf+HhGo3OiYMp1zjc5VBBYtOTDn6W97yg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Thalesgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c83448ba-3122-4cc1-5a34-08d85f8b0796
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2020 06:36:40.4122
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6e603289-5e46-4e26-ac7c-03a85420a9a5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ABSBL3XC1nIT5we5CLCXNreKT+rgXjKdDguITL44h4bGUg0beug3f9GEKKCMlaYf/N9tIxkKGjjBi9Qdc1kcWAOHmdhxBXOpNI04bA3yoh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0801
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2020.9.23.63018, AntiVirus-Engine: 5.77.0, AntiVirus-Data: 2020.9.23.5770000
X-Sophos-SenderHistory: ip=104.47.24.109,fs=369142,da=49557532,mc=5517,sc=0,hc=5517,sp=0,fso=48184434,re=64,sd=0,hd=30
X-PMX-Spam: Gauge=IIIIIIIII, Probability=9%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, SUPERLONG_LINE 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, DKIM_SIGNATURE 0, DQ_S_H 0, IN_REP_TO 0, KNOWN_MTA_TFX 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, NO_CTA_URI_FOUND 0, NO_URI_HTTPS 0, REFERENCES 0, SPF_SOFTFAIL 0, SXL_IP_TFX_WM 0, WEBMAIL_SOURCE 0, WEBMAIL_XOIP 0, WEBMAIL_X_IP_HDR 0, __ANY_URI 0, __ARCAUTH_DKIM_PASSED 0, __ARCAUTH_DMARC_PASSED 0, __ARCAUTH_PASSED 0, __ARC_SEAL_MICROSOFT 0, __ARC_SIGNATURE_MICROSOFT 0, __AUTH_RES_DKIM_PASS 0, __BODY_NO_MAILTO 0, __BOUNCE_CHALLENGE_SUBJ 0, __BOUNCE_NDR_SUBJ_EXEMPT 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_AGE_BODY 0, __CT 0, __CTE 0, __CT_TEXT_PLAIN 0, __DQ_IP_FSO_LARGE 0, __DQ_NEG_HEUR 0, __DQ_NEG_IP 0, __DQ_S_HIST_1 0, __DQ_S_HIST_2 0, __DQ_S_IP_MC_100_P 0, __DQ_S_IP_MC_10_P 0,
 __DQ_S_IP_MC_1K_P 0, __DQ_S_IP_MC_1_P 0, __DQ_S_IP_MC_5_P 0, __FORWARDED_MSG 0, __FRAUD_BODY_WEBMAIL 0, __FRAUD_MONEY_BIG_COIN 0, __FRAUD_MONEY_BIG_COIN_DIG 0, __FRAUD_WEBMAIL 0, __FUR_RDNS_OUTLOOK 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_XOIP 0, __INT_PROD_GPS 0, __IN_REP_TO 0, __MAIL_CHAIN 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __MULTIPLE_RCPTS_TO_X2 0, __NO_HTML_TAG_RAW 0, __RDNS_WEBMAIL 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_ALPHA_NEGATE 0, __SUBJ_REPLY 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi All,

I agree it is an old kernel but still can you look into the backtrace and g=
uide me how I can proceed to stop the host crash.

Below is the backtrace info that is coming as soon as I connect my gadget s=
erial driver supported device(USB) to FreeBSD.

Backtrace #1

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
From: Greg KH <gregkh@linuxfoundation.org>=20
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
