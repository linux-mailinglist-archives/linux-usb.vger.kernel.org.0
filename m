Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED19A21EC2D
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jul 2020 11:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbgGNJGN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jul 2020 05:06:13 -0400
Received: from mail-bn7nam10on2074.outbound.protection.outlook.com ([40.107.92.74]:6132
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725816AbgGNJGN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 Jul 2020 05:06:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECWR+RfxyN9KwQG2YP84+x+X3/+DwWSeNmlz3c57SPWFNEvGlNyN8v7WmLaySCQWcjRMzk83771PsEPIXOdx/vFB0isd3qn8VIEr1PHugUoWh0BLFNrBBZ4VDWHjLrACw14m8QwCL8WQRiBjM0Ib0abPEGxMFkEnN5rs3At7efp7yQ6Iup2eJQhSSAmH003jngoyJz2zONdNqKdLhq5bCsQeFuGbmc47AcqFpwySIdj6WLq+QnQyUZQ9FCsjnBY9QyfyYNMmN+XHmaJ4hZMeLM7mSdhfXv3URjbK2y3+Cv+JVNabfgdc8uyhS7WCurzhAg5aFt0aWNERVxSUP15mYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISjUhK1070IWsEpM1eEEIW93yW6XdknkKXnNS1gSJcQ=;
 b=WvRkMcGGz9UQmZ4uYhTYHPLtBdniwO5j1SvGklXeHJX48co5hOQa2IcY0ybTkE3M4Fma7bxwZAtXCDNu+lT90rTTAE6VAjeMIn8WFZnD4OHZV+MfhJE39BY9LKyN46/NhJS7TIKH2JiEehk1pd9sVAMQ3ZaNwXTOWXzWd8b5G0Hgm++VBGVXjr34G8HYSMll++Um5yAqFxvih6ydgmddID7SZp1RCG9cQCsFqmPL2l+5Sa1EyfWI1SABp6k46tTC8XqHeBf/gjG+vljk04qA8/wDZsp8hx2xpO3oC5p13E++xtzeziVliHUC55DCbhW1bIN5eUMS3XvVlMeYnH5ZjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISjUhK1070IWsEpM1eEEIW93yW6XdknkKXnNS1gSJcQ=;
 b=eB45Qh0aQcOtBhoNMniNaQ0wtONr2uuzvPe/9ond+Xee5yB00Bee/zfL4hBapGEld64sngDyKPdmS+9SdUU7Tm0yghtrmUtxlmT1W1cnm6QInITmJBPkwsreBj/7RC8XzZvhFUccL764NeYB9SWwHwVGi0/APg+lZkQUETHn1mg=
Received: from MWHPR1001MB2190.namprd10.prod.outlook.com
 (2603:10b6:301:2e::20) by MWHPR1001MB2079.namprd10.prod.outlook.com
 (2603:10b6:301:2b::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Tue, 14 Jul
 2020 09:06:10 +0000
Received: from MWHPR1001MB2190.namprd10.prod.outlook.com
 ([fe80::b439:ba0:98d6:c2d1]) by MWHPR1001MB2190.namprd10.prod.outlook.com
 ([fe80::b439:ba0:98d6:c2d1%5]) with mapi id 15.20.3174.025; Tue, 14 Jul 2020
 09:06:10 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "oneukum@suse.de" <oneukum@suse.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] cdc-acm: acm_init: Set initial BAUD to B0
Thread-Topic: [PATCH] cdc-acm: acm_init: Set initial BAUD to B0
Thread-Index: AQHWVp10AvhYW+hsHEuT/7Zwfc2fs6kFTgWAgACsk4CAALGOgIAAIqQA
Date:   Tue, 14 Jul 2020 09:06:09 +0000
Message-ID: <3063a6b95bd1556050082993f76a269d3c5e62f2.camel@infinera.com>
References: <20200710093518.22272-1-joakim.tjernlund@infinera.com>
         <1594634939.2541.3.camel@suse.de>
         <0180a0cae3ff2772df0f6cea93739ae2deb52b24.camel@infinera.com>
         <1594710129.2541.15.camel@suse.de>
In-Reply-To: <1594710129.2541.15.camel@suse.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.37.3 
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [62.109.37.155]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 29bbf804-f97a-4c0a-9d7d-08d827d52683
x-ms-traffictypediagnostic: MWHPR1001MB2079:
x-microsoft-antispam-prvs: <MWHPR1001MB2079840A8BFF003662F30CF4F4610@MWHPR1001MB2079.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LNI4TRDFgTU7nzz/QAakLedULOsAhVnqHvj0JLeRtrbi3/xfug3Th832p/3HjVaE3u7pfr9AGDh18KGV6WXn87Ps08HBsLPCoe1/kWZfl8E2NQALDSROF3KGuTA2yOH8OFI0F7d0gAzb2wAkPlKiuW+BjfofrE9BOsg8GgNSnJRfTOS/LnZREG9kPBCbBFBT497JRtx6hrBbuBoFp0L9suXgvy1y/8WPBGwHSpmyJWFqL/L2BvB4XUYdedQ9jgvYEZ2adv86jo3NW7T1bU542wiuLBeIETR10eRfzCvfW9IzF20JtneVAl7zceNkKdt+HBNAWhNhE9PECwaT+eScdg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2190.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(66446008)(26005)(316002)(71200400001)(6512007)(64756008)(8936002)(186003)(83380400001)(8676002)(6486002)(86362001)(2616005)(478600001)(66946007)(76116006)(6506007)(66556008)(66476007)(110136005)(91956017)(36756003)(2906002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: O5c7OnRLJhI8NgJW6rqOkYNHPuuea4P+M8pOdvpGMbpOYXaNgglsVQnzHCdjTNYRYoQj0/Y2fdPZEwmQtIQEfcNyIZldSVOe2umCCfR3xRWsASeWBXkvFsIm1+XY6C3+GSdyaUr+dQaF8cKxmrdNLsEvBWKKGD90HmRcOLd796gsVjufc7SdEWfgnDs1T9fILwnks3TwlWylt0yyJfG/kPNum4VRdGpehakBL8La9UGZV95yrzHWd4TwNnxCbgacvcsggm1COuXcSR5SUJoEwGFC8oz5fVBl5oSxIy0wmjHXIk6ymF1QwdTZklWyN30YbkQElxSDOAVkHEAY8W9/HLXrLU76jfvNPaoC1PIvVNaFfW36YOpuIbLqJT9fY2aCsPGi/heJ+Aj52hd0qPISClTy53NuLOqMKPjCLD3Qi8qquKOp5sFO1FWHQhmn5BLOPniHTO5kw8IlekVQ5bqJRVIuOQEXfr6Gm9dJYId7Zq4=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <2013765E27259A4BB23247F25A4B408F@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2190.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29bbf804-f97a-4c0a-9d7d-08d827d52683
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2020 09:06:09.9312
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YrSXvcNu7HsggnJqhfTLPXqiH+JQkpE6eNZuiWQNGLhp7ni6A/vH+WfN3pNwc3LfZ/tunIwUaon2bbFEQ3FMxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2079
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 2020-07-14 at 09:02 +0200, Oliver Neukum wrote:
>=20
> Am Montag, den 13.07.2020, 20:26 +0000 schrieb Joakim Tjernlund:
>=20
> Good morning,
>=20
> >=20
> > OK, but it is strange that init_termios.c_cflag does not take/do
> > anything unless I change order. Perhaps termios should move to
> > probe
> > instead?
>=20
> Are you saying that the tty layer does not set termios when a new
> tty is created? This looks strange to me and I do not want to paper
> over a wider issue.

Not sure. all I can say that when I was playing with B0 baud, I had
to change order to see any effects of B0.=20

>=20
> > Also, the handling of DTR came up. It seems to me that ACM
> > deassert DTR until open time which is fine/good.
>=20
> ACM does not really control DTR by itself. The earliest time
> we can touch it would be probe. And again setting sane defaults
> for DTR looks like a job for the tty layer.
> acm_set_control() AFAICT does its job correctly.

Yes, so it seems.

>=20
> > !DTR signals to the other end that ACM is not ready and don't
> > want input but ACM still accepts input if received.
> >=20
> > Would it make sense to actually enforce DTR locally too?
> > If input is unwanted, don't accept any either.
>=20
> This looks difficult. Basically we can call acm_set_control()
> which will execute a control request. Yet there is inevitably
> a race between setting such a control line and data getting in
> and between clearing a control signal and data getting into the
> buffer.
> We could stop reading once we are sure the control signal is
> effective, but we have no operation for clearing the buffers
> in the device. We cannot tell whether data in them is stale
> in the sense of being accepted without DTR or newly arrived.

Does this race really matter? There will always be a race, even when
DTR is HW driven. I guess what is really missing is way
to control/clear input buffers.
Some sort of flag to the tty layer would be best/minimize race I think,
maybe DTR_NO_INPUT which could be set at init time.

> Could you make a concrete proposal of how to achieve this
> short of a device reset? The mapping between CDC-ACM and
> a physical RS-232 is only as good as the device makes it.

I am just getting started with USB/ACM and I got here due to odd
USB chip we just started to use so a concrete proposal is a bit too
much for me ATM

> CDC-ACM is only secondarily a serial driver. The common
> association between modems and serial devices is historical,
> not technical.

Yes, ttyUSB seems better suited for this but ATM I don't
have that choice.

  Regards
          Joakim



