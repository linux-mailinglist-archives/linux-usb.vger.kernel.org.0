Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 179D32529C1
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 11:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727930AbgHZJJm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 05:09:42 -0400
Received: from thsbbfxrt02p.thalesgroup.com ([192.93.158.29]:33258 "EHLO
        thsbbfxrt02p.thalesgroup.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727122AbgHZJJl (ORCPT
        <rfc822;Linux-usb@vger.kernel.org>); Wed, 26 Aug 2020 05:09:41 -0400
Received: from thsbbfxrt02p.thalesgroup.com (localhost [127.0.0.1])
        by localhost (Postfix) with SMTP id 4Bc0Rj5ycqzK090;
        Wed, 26 Aug 2020 11:09:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thalesgroup.com;
        s=xrt20181201; t=1598432977;
        bh=3T/Y4bftgZIK/Ew545ZXB8vIO2MCzZ3UlZqFqLisfv0=;
        h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
         Content-Transfer-Encoding:MIME-Version:From;
        b=MiczNWNlbJto7Rbd81S8ZRywueK3dO2PIEBgDhxS4J26wCusughv1LVm8IwSguUDV
         XkOH2bLwLNNKnzaHT6SFJRHqQfF/ZlLTa0TVTjh4ve5tB/6pbvWoTPc+93I3gb3Gux
         t0haFnTlG4wxwAwbXRbQo93tVCs+nCLOVfFMBilUHQ1ZKkNmqTBWf1vJE6aKKupjH/
         dYR5cwGmF2tGDmpkSdqXa6KI3usCjm1d/L2bqDpoQfx5kS8vdRr6qNPuOPrxsvbW7G
         IuWQkVr8zOaGgVsCGZ4849E4bhgBWdDKv+z5+M0W5XtUKyYyR/3GegVpER7p03OR4I
         WWHDT8FLRsqAA==
X-MTA-CheckPoint: {5F4626CA-0-C72F090A-4E71}
Authentication-Results: thsbbfxss02p.thalesgroup.com;
        dkim=pass (1024-bit key; unprotected) header.d=thalesgroup.onmicrosoft.com header.i=@thalesgroup.onmicrosoft.com header.b="bX8HBlgI";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Me/9GPua2s3fqlTxsq0jAmYGakBEqNElKcWUFUMs45b4W/ZFy+u1t+eSD2RRtl5apuZ/WotuaznYGBpt3ag2f48w/liBMdCyGW4o7hZiqdFNv3IOIvPPHlMhF5ALCLbKe7H26AjZBcOdWr2DQuCTwYkPMSMqwqH2rAtYHyTBEGbITKGboywUBlI1J0wqk5TBUbLzeTlwAyoUOUN6x0XnCxly8QMdAuGIU3FxMXTeUq6pibVCLagdMFiFQNmQv/MC5LUnu6dpVt5PxjF+1LrS3p5Le/7Q1NPpziRsTqsn9UMz2zKfmbTzcJlaKs08oP4mb6R3aav9bgJKLIaATQ84MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3T/Y4bftgZIK/Ew545ZXB8vIO2MCzZ3UlZqFqLisfv0=;
 b=GGhYkNKeLmTgoHgcVraXu2XqVk7K4QZWk6IZcajLNSbv5Tl6In9fKXb+n14DH7CaHeanUrzCe6yd8rxMx7uEedy33LNnl00KZQhwGX4dJuuWBblWTBw4953xCmHurc+1Obc9DTpaIo/NJPb5r1NkvHeNyr/z+6ulzXDvOrj2z9EyyFCwdA/XLgzgoRbt+2kqLnQC1CjjjHSzAZtzhU6QhnbEtNbRrPOwb2Axl8qeR8ijGnHPgRLSZNV6xEq4H2Xtd2FQFy/DHJ5ZYCetwBRt8/Iaa82fBRjmg0jULFFcqTOrCsO9VwqhBDIu91WYHqgpmhbxf2bMg0PA2HZlP83lyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=thalesgroup.com; dmarc=pass action=none
 header.from=thalesgroup.com; dkim=pass header.d=thalesgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thalesgroup.onmicrosoft.com; s=selector2-thalesgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3T/Y4bftgZIK/Ew545ZXB8vIO2MCzZ3UlZqFqLisfv0=;
 b=bX8HBlgIz9thDkUpYdbKekRdEpjrE5E0MoB4IX1WxS9NT257bOPtO4IxGV325vngGDo4YdskJe38Ut/XkzudNjR5sbyyMfykXWx6FYsoo4iJaOTeB0xl6NCS67Imuzh2JGaiJTkzu0HEIq6hN1pjRwuB2qiOV4iO4MWjlpF18Ns=
From:   GARG Shivam <shivam.garg@thalesgroup.com>
To:     Peter Chen <hzpeterchen@gmail.com>
CC:     "Linux-usb@vger.kernel.org" <Linux-usb@vger.kernel.org>
Subject: RE: Linux Crash with Gadget serial driver
Thread-Topic: Linux Crash with Gadget serial driver
Thread-Index: AdZ7Aw+onVx5vBMuRyOE8DOq7nQmHAAAc6OAABHIIAAADx4bQA==
Date:   Wed, 26 Aug 2020 09:09:32 +0000
Message-ID: <MRXP264MB09048712EAB615DD8CF7AF5BF8540@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
References: <MRXP264MB0904FFAD5E50E6A6F4AB6419F8570@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
 <CAL411-oBThK1PqKWhbdUSEsCuApi6CWT5wzxye6P6RXsQuXhfg@mail.gmail.com>
In-Reply-To: <CAL411-oBThK1PqKWhbdUSEsCuApi6CWT5wzxye6P6RXsQuXhfg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=thalesgroup.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: becb0bf4-1ef7-49e4-3060-08d8499fbeee
x-ms-traffictypediagnostic: MRXP264MB0150:
x-microsoft-antispam-prvs: <MRXP264MB0150181CCE7536D2D8D77CC8F8540@MRXP264MB0150.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HYSbdvc8D/eEbmM5aV3Nal1YlILKjORQUxnFF0vmPq3v7Pwmpvq75NrmLVBQzPPo66CQLV00TD7jB0uHLXmejgRtugME7Dp/74YXEn6UAq3hJnJqI8ff3iV1TdrUAsfrE6GMwdWRZqW1OpTlQzPq2JrKogEQJBlmyNRB2aiAy7DidzmnSdGiZQZNIRPAvl0c54AOOWgemoAJplcG3dYpx0b4N7tdu5lCqRdrKbGs7fgddVaJok1UQvMbZ1aX+LgWdNrYrYUis60PNfLeZc5KLDw0rEv8/C7UHWsoYKFTaRi26noV32N/BgzJrIo+S28Z
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(8936002)(8676002)(6916009)(316002)(4326008)(83380400001)(86362001)(4744005)(33656002)(52536014)(5660300002)(2906002)(478600001)(9686003)(71200400001)(55016002)(7696005)(66446008)(64756008)(26005)(186003)(55236004)(53546011)(6506007)(66476007)(66556008)(66946007)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 1k73ETaQ8FV3eF6tNHvyV4np+AHHR5IaY2G2/vL3fIjSUCN+G17J93zXlsGRhgy9YGJxBVsVksiaN/JUpqz/cl9K1qSo3XXzLz7qThkYJRcpQJi3gB2xM18UfHwIIV2U45Zw7r7n6g9cik/JDzWAKL4ypxHpvdDqvBu/oM3kvhv/BIfM28zjPgzLXPVmQ3N/nu0dXV8dmBGDbEJVM2MRNvg6ZXxKHEUhSD/+D4FmO47Ti3eEtOlX4ibKdpqNw9YSYzVwDPb8+SrVWp+pOhIcjyN09a7AV3lcDSFlL5Z2lyVGeqR/Ii6qyGopgtZNH7UNypNyVMZwWqp1/K51WjCmRmV8phgCrhQJXmIGnXZXomKmqCxF9tsmXEhFvHLXAX4s++V4Zd83WzgsovzQWYflY9bcIaVLdMJn/CjlLrBeRXvagUFNdHBdEjOS5V45poqmCBnEvQ+qBnpCUOY16lejDnW2K8rcx9HsGQeC+ciC623qjdvb/mOYSQ0c3mssPyT8xv6paRgNcwOnhWiJO7ul5o7osXUh1i8tPRPfcFyUAIqam/IkBUjrBk1dyle5dR4vyqx6Hz2WLFVt9zSsOa/PS2/VY2S9Etbj2FqZ0IlEgg6zTFEIavG7xoxhizEz3HR8kLIrUnZxE3aq63lSmkhygA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Thalesgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: becb0bf4-1ef7-49e4-3060-08d8499fbeee
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2020 09:09:32.3514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6e603289-5e46-4e26-ac7c-03a85420a9a5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kUyv0+ia6/Icfjr6vudH9wvab5wVKSAwN0+stNmhpyFytHTJ1ZfKbFhLiUYsd4JRcNYGExr9i7NCnId9gTUbIvqGPxtU3cl+tiGDx2PX/CQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0150
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2020.8.26.90317, AntiVirus-Engine: 5.75.0, AntiVirus-Data: 2020.8.25.5750003
X-Sophos-SenderHistory: ip=104.47.25.100,fs=464842,da=47147504,mc=7261,sc=0,hc=7261,sp=0,fso=46053247,re=50,sd=0,hd=30
X-PMX-Spam: Gauge=IIIIIIIII, Probability=9%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, SUPERLONG_LINE 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1100_1199 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_BASE64 0, DKIM_SIGNATURE 0, DQ_S_H 0, IN_REP_TO 0, KNOWN_MTA_TFX 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, NO_CTA_URI_FOUND 0, NO_URI_HTTPS 0, REFERENCES 0, SPF_SOFTFAIL 0, SXL_IP_TFX_WM 0, WEBMAIL_SOURCE 0, WEBMAIL_XOIP 0, WEBMAIL_X_IP_HDR 0, __ANY_URI 0, __ARCAUTH_DKIM_PASSED 0, __ARCAUTH_DMARC_PASSED 0, __ARCAUTH_PASSED 0, __AUTH_RES_DKIM_PASS 0, __BODY_NO_MAILTO 0, __BOUNCE_CHALLENGE_SUBJ 0, __BOUNCE_NDR_SUBJ_EXEMPT 0, __CC_NAME 0, __CT 0, __CTE 0, __CT_TEXT_PLAIN 0, __DQ_IP_FSO_LARGE 0, __DQ_NEG_HEUR 0, __DQ_NEG_IP 0, __DQ_S_HIST_1 0, __DQ_S_HIST_2 0, __DQ_S_IP_MC_100_P 0, __DQ_S_IP_MC_10_P 0, __DQ_S_IP_MC_1K_P 0, __DQ_S_IP_MC_1_P 0, __DQ_S_IP_MC_5_P 0, __FORWARDED_MSG 0,
 __FRAUD_BODY_WEBMAIL 0, __FRAUD_WEBMAIL 0, __FUR_RDNS_OUTLOOK 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_XOIP 0, __IN_REP_TO 0, __MAIL_CHAIN 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __RDNS_WEBMAIL 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_ALPHA_NEGATE 0, __SUBJ_REPLY 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SSBhbSB3aXRoIEtlcm5lbCB2ZXJzaW9uIDQuMS4NCg0KVW5hYmxlIHRvIGdldCB0aGUgcGFuaWMg
bG9nIChCYWNrdHJhY2UpLg0KDQpUaGFua3MNClNoaXZhbQ0KDQoNCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBQZXRlciBDaGVuIDxoenBldGVyY2hlbkBnbWFpbC5jb20+IA0KU2Vu
dDogV2VkbmVzZGF5LCBBdWd1c3QgMjYsIDIwMjAgNzoyNiBBTQ0KVG86IEdBUkcgU2hpdmFtIDxz
aGl2YW0uZ2FyZ0B0aGFsZXNncm91cC5jb20+DQpDYzogTGludXgtdXNiQHZnZXIua2VybmVsLm9y
Zw0KU3ViamVjdDogUmU6IExpbnV4IENyYXNoIHdpdGggR2FkZ2V0IHNlcmlhbCBkcml2ZXINCg0K
T24gV2VkLCBBdWcgMjYsIDIwMjAgYXQgMTozNiBBTSBHQVJHIFNoaXZhbSA8c2hpdmFtLmdhcmdA
dGhhbGVzZ3JvdXAuY29tPiB3cm90ZToNCj4NCj4gSGkgQWxsLA0KPg0KPiBNeSBEZXZpY2UgaXMg
YSBMaW51eCBtYWNoaW5lIHRoYXQgaXMgaGF2aW5nIGEgR2FkZ2V0IFNlcmlhbCBkcml2ZXIuIFBo
eXNpY2FsbHkgZGV2aWNlIHNpZGUgd2UgaGF2ZSBVU0ItQyBwb3J0IHdoaWxlIGF0IGhvc3Qgc2lk
ZSB3ZSBoYXZlIFVTQiBwb3J0LiBUaGlzIGRldmljZSBpcyB1c2VkIGFzIENPTSBwb3J0IHRvIGFj
Y2VzcyB0aGUgc2VyaWFsIHBvcnQuDQo+DQo+IE15IERldmljZSBzaWRlIExpbnV4IGlzIGdldHRp
bmcgcGFuaWMgYXMgc29vbiBhcyBJIGF0dGFjaGVkIHRoZSBVU0IgdG8gRnJlZUJTRC4gQW55IHZp
ZXcgb24gdGhpcz8NCj4NCg0KWW91IG1heSBwb3N0IHlvdXIgcGFuaWMgbG9nIGFuZCBrZXJuZWwg
dmVyc2lvbiBpbmZvIGFzIHdlbGwuDQoNClBldGVyDQo=
