Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2B6179DB9
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2020 03:12:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbgCECM2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Mar 2020 21:12:28 -0500
Received: from mail-eopbgr70059.outbound.protection.outlook.com ([40.107.7.59]:35313
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725797AbgCECM2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Mar 2020 21:12:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EF6iBVpSRddO3O8wIJxgTNvpEjgxCLgw0ba5qlHOKtEUhtbbgW7B+LLtWJat1K+N3vzkvpnYb1WeEZQGtJpWpNx+RtKpV6An2CnhkLZCd+FgB/s3T4OnN2FY6PEP904xRg7JjS5nn8L0OLTfHCTpv6zs4dvJJmCVNNrpzR/zobviSJw4660xPLgFNZP7gvYsUfPwJ70HN6c172m9llzOhlNO7uUQwZlW1U6I0gXUhnBNnedtxxDLDtE2Vv5s7yjqOLqsaej4/rVNxpHjCaPPvaAjRa9gOAJlCetR5SPYLRG0kKjGEAgxDXBMVDVY2V/zg67/Zrk61kql1vqltiHxeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20zDzrw7GPZXs81ubWCgdM3f0Fl6W5LHvtV28Umph+w=;
 b=LMYm/URjyvHZNtNFH9ok+9hw38QRB9Gg+QJpQsycUOWFbVuk4T8bCbeF7yUr4w0eTYMdApKqic3g/DyBlFExyNFy2IKeijasU4UF5+HBxNDqHhKPmDhEHMuAhHiYWhvh71sg5z5MF3zZ1stvcA0lz2unZouSvlx7Gaam2BZYWB8ytI9Xn8evXPciDS8NECT0mKVJAht4YpEbMVLfZ6rBNT6l6Y9Tyl3SD4tyHhcwRxN1pFzh9p2fSrCsBd3jzLeByYYmtxYjbN2zO3Vi06WKpolXJ8yqIo0yzkiSruo3u1IBoUCWbFJqCcXrgQI2JfbvMwQ2FNpP3dKXldLuisUlew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20zDzrw7GPZXs81ubWCgdM3f0Fl6W5LHvtV28Umph+w=;
 b=hjDWthT9y/5V99yLLjqTu5k8oOA2hPx6GTwytpRJBaOFSIjW1YahPTMoZOiupf5FJrtThZ1r923AT4BMSYJEzDQSk5cWAijPC+tyWrh97r9ZrXP+ms8hG/QtpCl78suu+hx9xbjgCSyLn/EctVEvIwnRlyG7vD4xhPa0IgU1Ook=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB4381.eurprd04.prod.outlook.com (20.177.55.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.18; Thu, 5 Mar 2020 02:12:24 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1%7]) with mapi id 15.20.2772.019; Thu, 5 Mar 2020
 02:12:24 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: usb: chipidea: udc: BUG: sleeping function called from invalid
 context
Thread-Topic: usb: chipidea: udc: BUG: sleeping function called from invalid
 context
Thread-Index: AQHV8j9hwL99AdJQ30udm+i8fapgTKg5QogA
Date:   Thu, 5 Mar 2020 02:12:24 +0000
Message-ID: <20200305021226.GA12837@b29397-desktop>
References: <bfa5b2f7-cf52-0055-ffb2-2cb8278a1181@gmail.com>
In-Reply-To: <bfa5b2f7-cf52-0055-ffb2-2cb8278a1181@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 91554b0d-afaa-4a2d-f81c-08d7c0aaa517
x-ms-traffictypediagnostic: VI1PR04MB4381:
x-microsoft-antispam-prvs: <VI1PR04MB438159DFB1726A3B7E13D3948BE20@VI1PR04MB4381.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03333C607F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(7916004)(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(189003)(199004)(66446008)(44832011)(26005)(64756008)(66556008)(53546011)(6916009)(6486002)(86362001)(66476007)(81156014)(8676002)(4326008)(6506007)(66946007)(76116006)(6512007)(81166006)(91956017)(9686003)(8936002)(33716001)(316002)(478600001)(186003)(33656002)(1076003)(2906002)(54906003)(71200400001)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4381;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2kP/YZxsSO1x4Akfqmg7Svjr+UMfQngJEnXbsgSzI1xpCy8zk2mVns7jykWn1Xhmb7s99vRFNt+bnLREcczSQzeMeCKnFdZpQH83SLebAUfLFL/nLXotcTHb6j+fYyPhFMZNEf7x0FxC8f5cUN4oLvE0Uvy7y0gr2cuLPVbyi4+Zd6/VpSAKIDU8W5VKKub8Mq/NZD8f3yMV3GpMQVU3KSvZS1WEt6shVzYG1QsiIz7XLVZQ8vkecqui7n2MR6syJCH+hSgov9G2CU0IgPCLVOpVo2NfdMP5HQz5lP40HZhZtVCG2fn+e7tZ+EYPiZ1h8vFi0B9L6vv+/hLdvr1INqZfPH8KkAVQC4Yx1AOiRiXWWGlulMOxM46atvOrqqo5a055ThGx4UXdJMuyVNQ23RCY0da2CSWnkwoojptM8TWgvMxOVw1vt1oP4g3KmUZf
x-ms-exchange-antispam-messagedata: bY/shmRx9l+NajJoM3+Vd+YZuotW3q9Va347/9rySFeQsXh0PmArDMXSgbr6oHWx7w2vFlL2EL3c2MqW51s6Q9N66YST99FFKninO2vj6ukFLG3oMry5PR2ej4LnyxzTueNA+rKDpUZV5G3F654x1w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F0C8F5F98247604D897003DAF000762B@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91554b0d-afaa-4a2d-f81c-08d7c0aaa517
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2020 02:12:24.1730
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZorPmVqvA+LSQPrnoeXU7JfHY/28UVp5y6bZRODLh0x3Gt6Xxv/jCsqExCfnRMO/pCfGRkZuG95fSZwq2rm3LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4381
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-03-04 19:10:08, Dmitry Osipenko wrote:
> Hello,
>=20
> I was trying out today's linux-next-20200304 and noticed this splat in KM=
SG:
>=20
> [    1.161244] BUG: sleeping function called from invalid context at
> drivers/base/power/runtime.c:1075
> [    1.161393] in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid:
> 37, name: kworker/u8:1
> [    1.161481] CPU: 1 PID: 37 Comm: kworker/u8:1 Not tainted
> 5.6.0-rc4-next-20200304-00181-gbebfd2a5be98 #1588
> [    1.161616] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> [    1.161769] Workqueue: ci_otg ci_otg_work
> [    1.161882] [<c010e8bd>] (unwind_backtrace) from [<c010a315>]
> (show_stack+0x11/0x14)
> [    1.162035] [<c010a315>] (show_stack) from [<c0987d29>]
> (dump_stack+0x85/0x94)
> [    1.162132] [<c0987d29>] (dump_stack) from [<c013e77f>]
> (___might_sleep+0xeb/0x118)
> [    1.162281] [<c013e77f>] (___might_sleep) from [<c052fa1d>]
> (__pm_runtime_resume+0x75/0x78)
> [    1.162427] [<c052fa1d>] (__pm_runtime_resume) from [<c0627a33>]
> (ci_udc_pullup+0x23/0x74)
> [    1.162575] [<c0627a33>] (ci_udc_pullup) from [<c062fb93>]
> (usb_gadget_connect+0x2b/0xcc)
> [    1.162665] [<c062fb93>] (usb_gadget_connect) from [<c062769d>]
> (ci_hdrc_gadget_connect+0x59/0x104)
> [    1.162807] [<c062769d>] (ci_hdrc_gadget_connect) from [<c062778b>]
> (ci_udc_vbus_session+0x43/0x48)
> [    1.162949] [<c062778b>] (ci_udc_vbus_session) from [<c062f997>]
> (usb_gadget_vbus_connect+0x17/0x9c)
> [    1.163089] [<c062f997>] (usb_gadget_vbus_connect) from [<c062634d>]
> (ci_otg_work+0xbd/0x128)
> [    1.163245] [<c062634d>] (ci_otg_work) from [<c0134719>]
> (process_one_work+0x149/0x404)
> [    1.163335] [<c0134719>] (process_one_work) from [<c0134acb>]
> (worker_thread+0xf7/0x3bc)
> [    1.163479] [<c0134acb>] (worker_thread) from [<c0139433>]
> (kthread+0xf3/0x118)
> [    1.163621] [<c0139433>] (kthread) from [<c01010bd>]
> (ret_from_fork+0x11/0x34)
>=20
> I haven't tried to figure out what change causes this problem, it didn't
> happen using next-20200218. Please take a look, thanks in advance.

Dmitry, thanks for reporting. I haven't met that issue, it maybe I
enable runtime pm, but you have not? So I don't trigger
"dev->power.runtime_status !=3D RPM_ACTIVE" condition below

	might_sleep_if(!(rpmflags & RPM_ASYNC) && !dev->power.irq_safe &&
			dev->power.runtime_status !=3D RPM_ACTIVE);

I send the fix patch, but git send-email seems doesn't add auto cc
according to reported-by tag, so you are not at cc list. Would you
please have a test?

--=20

Thanks,
Peter Chen=
