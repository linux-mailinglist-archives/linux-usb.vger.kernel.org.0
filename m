Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 677352751E4
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 08:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgIWGwE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 02:52:04 -0400
Received: from thsbbfxrt01p.thalesgroup.com ([192.54.144.131]:52214 "EHLO
        thsbbfxrt01p.thalesgroup.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726448AbgIWGwE (ORCPT
        <rfc822;Linux-usb@vger.kernel.org>); Wed, 23 Sep 2020 02:52:04 -0400
Received: from thsbbfxrt01p.thalesgroup.com (localhost [127.0.0.1])
        by localhost (Postfix) with SMTP id 4Bx8420kgZz45QQ;
        Wed, 23 Sep 2020 08:52:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thalesgroup.com;
        s=xrt20181201; t=1600843922;
        bh=ts/se3TOKrDIpKrO/bEIgKteUG8lS7F6nRnrLu5ZVQw=;
        h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
         Content-Transfer-Encoding:MIME-Version:From;
        b=LFRam3oS9MfQTuMX1amaWkioItYaC/DiHYlUs+F2PhVOh+qXxRO/RT8uC6WtZFi4m
         jkRQ3FClarNh/MO6WZHC/qNeWrRB+DbkcUpRlguaiGC4fTkgMTQo9EmIl/jG1/2RDW
         5FxPJem0qgZOFHUL+iNkQk+OYfBFGYGwquqzPHbsUwNpVGJNsnWtOABI1lxvG3tjgj
         NBFBrkyCArnc/f3wEymZ+YCe3ywWlrA1eRjdzbTsINP1OvBGS72AZ9oThZkeBhS7eF
         i145FUJGJuqSy8I9HGObrIe2i+DKv8C81BQHQ7K5HoeAzaOy1jOIW5Ar72c1Y1WlGR
         WO7pwWT8g6GUQ==
X-MTA-CheckPoint: {5F6AF01C-2-C32F090A-3B07}
Authentication-Results: thsbbfxss02p.thalesgroup.com;
        dkim=pass (1024-bit key; unprotected) header.d=thalesgroup.onmicrosoft.com header.i=@thalesgroup.onmicrosoft.com header.b="MmCa5YoD";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUM4jJOtmP88zCA8iOA9e1MohhosLlN1D0PT3S0u/HMZIobbS4Py/EVGytwKIC5v+/dN6DVSIbesSvXcY34oGtG5fccJZ0PVPxsWBT9Hkvdr0nTQ6yCioikNQm8rdq+yU7oO1+rEddY7iMX4NCExSnQ7Ws8gwfix5lqvPwgoiltBbVr+z7Yd7+zf/4p/8wwMqwVTS3UEKQhjD8+Mwcoc42K8PrQuxirJmgSKE5lXkcciwIvFFeUWveBsESs0cEtSexSmGS1kJ7MGmnndusQ56tiITnk3se4eoVR8N3P/6NofjpFVi2pzySKSJ+6Y1xMhxoGG80yGDlLHrPX/wYTGfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ts/se3TOKrDIpKrO/bEIgKteUG8lS7F6nRnrLu5ZVQw=;
 b=c+22HgIB4EmJpQCgzH+OH7ZrRbPD9UL0wMLKouLBF4bklwf+Y5ziTVk17NyoNisUNehTjLqye2uaigUzDWSZrOHt6MzNQjThbcGEc4qrYpGizDJOjnByaRC7y/Bjxhby2ly3+SYXV2zZBIibYSO2PMAjW0vhJ4BnS/7R+HPlfE/4s4fvzqDYlqgM/Ssi7k/oYypaEAzY//dVlfcYWW6CMLCyBUyziHpGTxLFKy4iGlgwHxJemXCyQbkn7suBzZbrgGwkaqvoqzxrQ4dF3AQfNe5USfAZ0RRZIU9FD2EYSWYuhvQvY/myOVoTA/2A/oA1Ik+Vw+9++YC3S7HHEYNzeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=thalesgroup.com; dmarc=pass action=none
 header.from=thalesgroup.com; dkim=pass header.d=thalesgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thalesgroup.onmicrosoft.com; s=selector2-thalesgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ts/se3TOKrDIpKrO/bEIgKteUG8lS7F6nRnrLu5ZVQw=;
 b=MmCa5YoDU8ROyPFpH13SQNFt6tQpJDMG5sArMgCNWfZnhjVxvaiR5LXmSQNzTEZBKVGg7ei50TZZaLN+Lf3zivbIArDiwoNE5XcFyL35Rigm7yMxogyY9aDmO/gQEicduRviQSte/jduXCU7BK19zx6h0K2QSjzmgOuYDypnDJI=
From:   GARG Shivam <shivam.garg@thalesgroup.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "Linux-usb@vger.kernel.org" <Linux-usb@vger.kernel.org>,
        Peter Chen <hzpeterchen@gmail.com>
Subject: RE: Linux Crash with Gadget serial driver
Thread-Topic: Linux Crash with Gadget serial driver
Thread-Index: AdZ7Aw+onVx5vBMuRyOE8DOq7nQmHAAAc6OAABHIIAAADx4bQAAA8gQABXlXoRAAANOjAAAAJALQ
Date:   Wed, 23 Sep 2020 06:51:52 +0000
Message-ID: <MRXP264MB0904FE7CD168F36F476A877EF8380@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
References: <MRXP264MB0904FFAD5E50E6A6F4AB6419F8570@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
 <CAL411-oBThK1PqKWhbdUSEsCuApi6CWT5wzxye6P6RXsQuXhfg@mail.gmail.com>
 <MRXP264MB09048712EAB615DD8CF7AF5BF8540@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
 <20200826093534.GA2474406@kroah.com>
 <MRXP264MB09044A6FBB51DFFB273EA6B1F8380@MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM>
 <20200923064402.GA2732582@kroah.com>
In-Reply-To: <20200923064402.GA2732582@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=thalesgroup.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56bd4783-a6ef-47bd-b41a-08d85f8d2737
x-ms-traffictypediagnostic: MR2P264MB0769:
x-microsoft-antispam-prvs: <MR2P264MB07693E10D9696CF0832E4ABDF8380@MR2P264MB0769.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A5/HNbxTLXG7APzy9ipqxIlY+wErysY4tASp0vhGZZzjRoLfyDo14h36mf+q58VraTmH79GDRhZFuZKMYa08+doICQsKkR/UJFU+nEsFHG1Cjhws1pTpGVbfsvodVyuZHQh6m+FiwMka/9kDkHFNklUVW2m/VAFp290rJlymh+Eqxa9pCCs4bv/cKhfz8rELKIATiVoGXGMrvhYlZI4kU6drR9Iuzc2tSBf3NtNplFQNu28uJCjgN8o8RzS0f9W6pBzspNr/XGAXBlZsWnJ+kodkDxoXGKJnCX4CK2U/2rqeFjWwq4h8oYnNvwHz40GJE5L6hqRqo19ruvraLnmIAiUFwJduD6g4ALIBEK1CPene1q5AH9lRrt1n/CNZBy3w
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(8676002)(2906002)(66476007)(66556008)(66946007)(55016002)(66446008)(64756008)(26005)(4744005)(71200400001)(186003)(6916009)(76116006)(316002)(5660300002)(9686003)(83380400001)(478600001)(54906003)(4326008)(6506007)(53546011)(8936002)(86362001)(7696005)(33656002)(52536014)(55236004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: uIrbsGerZEhgaGXBXtIwd0pMXpg8YjZ8W5loFSv34drcJhjJP0zPZmnB1bccVp4BRSE4U5yTJNd1siu71oUi83eWU96xAXq0xgaSmG8xZUD97Kqv2psilcJl22aJEGUsoA7xEzje5LGGSqVBVRdiIk8WdpGqq2op8v85WTgpV+rIFiq+OXrF5sbWa5HkKqfGhLXW9tFhaSqPP8rDvxN8JPj3p2nLpBFcMuwn8msg/Y5wXHTWk/vd141i4gV0q2uSB8f49tvT5hqRNMOzFHevmqR4iYeT0UxwjxHCjDsQnhUblPE15a+mXwBuQahIb33nRfkggxaw5ypjM9/nXXUPcH76DHh+W3+3qjPrZLdNFag19d7/14c67HVBlwbhHTICbi2RWmapGvj8LbfdCs+LgBCYdZcgPebvsG5CHE4aFZro1ZE7/AEFvZHUQStJAIndmAiJyx0gRVFjH9uJ7+HL9SIUaScL3WZAunVOqtIl9WlVTGgsv+seziHx0zN/ysj5eYX0TdudeVDhCHJSd1mle8Ny0pj6LuZ0C6BA5J020xA6gswtd4pQp9g9chIZOaGqoBhH2yd/T9C0BePrqYyrZuEZwQtjxUQukZc57XWSkKUNWlPqs93dQoWxRFJwpUd/4GeofXv+rtdxMik1BbVo3w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Thalesgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRXP264MB0904.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 56bd4783-a6ef-47bd-b41a-08d85f8d2737
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2020 06:51:52.4725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6e603289-5e46-4e26-ac7c-03a85420a9a5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e1m6HQM90U9qpnjD8VG4dqiN0so+eY7kk6eEB7tKLD2rjcQXRhGzmB/pp3Hzu6JPKqsLdc9yaV26nXsZKZTKKcOSK51nHJuS9iX4bJ6mAOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0769
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2020.9.23.64519, AntiVirus-Engine: 5.77.0, AntiVirus-Data: 2020.9.23.5770000
X-Sophos-SenderHistory: ip=104.47.25.105,fs=715839,da=49558444,mc=14492,sc=1,hc=14491,sp=0,fso=49050958,re=64,sd=0,hd=30
X-PMX-Spam: Gauge=IIIIIIIII, Probability=9%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, SUPERLONG_LINE 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1000_1099 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, DKIM_SIGNATURE 0, DQ_S_H 0, IN_REP_TO 0, KNOWN_MTA_TFX 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, NO_CTA_URI_FOUND 0, NO_URI_HTTPS 0, REFERENCES 0, SPF_SOFTFAIL 0, SXL_IP_TFX_WM 0, WEBMAIL_SOURCE 0, WEBMAIL_XOIP 0, WEBMAIL_X_IP_HDR 0, __ANY_URI 0, __ARCAUTH_DKIM_PASSED 0, __ARCAUTH_DMARC_PASSED 0, __ARCAUTH_PASSED 0, __ARC_SEAL_MICROSOFT 0, __ARC_SIGNATURE_MICROSOFT 0, __AUTH_RES_DKIM_PASS 0, __BODY_NO_MAILTO 0, __BOUNCE_CHALLENGE_SUBJ 0, __BOUNCE_NDR_SUBJ_EXEMPT 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CT 0, __CTE 0, __CT_TEXT_PLAIN 0, __DQ_IP_FSO_LARGE 0, __DQ_NEG_HEUR 0, __DQ_NEG_IP 0, __DQ_S_HIST_1 0, __DQ_S_HIST_2 0, __DQ_S_IP_MC_100_P 0, __DQ_S_IP_MC_10_P 0,
 __DQ_S_IP_MC_1K_P 0, __DQ_S_IP_MC_1_P 0, __DQ_S_IP_MC_5_P 0, __DQ_S_IP_SC_1_P 0, __FORWARDED_MSG 0, __FRAUD_BODY_WEBMAIL 0, __FRAUD_WEBMAIL 0, __FUR_RDNS_OUTLOOK 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_XOIP 0, __IN_REP_TO 0, __MAIL_CHAIN 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __RDNS_WEBMAIL 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_ALPHA_NEGATE 0, __SUBJ_REPLY 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Actually, we are using USB-C port at my host but vendor does not support US=
B-C. It is a customization that we did at our end in the hardware.

That is the reason, we are stuck a between Yacto and freebsd. If just, want=
 to stop the kernel crash.

Thanks
Shivam

-----Original Message-----
From: Greg KH <gregkh@linuxfoundation.org>=20
Sent: Wednesday, September 23, 2020 12:14 PM
To: GARG Shivam <shivam.garg@thalesgroup.com>
Cc: Linux-usb@vger.kernel.org; Peter Chen <hzpeterchen@gmail.com>
Subject: Re: Linux Crash with Gadget serial driver

On Wed, Sep 23, 2020 at 06:36:40AM +0000, GARG Shivam wrote:
> Hi All,
>=20
> I agree it is an old kernel but still can you look into the backtrace and=
 guide me how I can proceed to stop the host crash.

You are on your own here, sorry.  Please work with the company that you are=
 paying to give you support for such an old and obsolete and insecure kerne=
l tree.  You don't want that money to go to waste, right?  :)

good luck!

greg k-h
