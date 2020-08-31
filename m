Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8A99257833
	for <lists+linux-usb@lfdr.de>; Mon, 31 Aug 2020 13:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgHaLFN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 07:05:13 -0400
Received: from mail-db8eur05on2060.outbound.protection.outlook.com ([40.107.20.60]:3764
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726252AbgHaLBT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 Aug 2020 07:01:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TF4XtQ0J3eICNKFigMgv1ciF7yLAThHetFti3D7OFfS1KitWfNo8rFDI+CfdiN/tingdrRpI5vQmNiA74YSxPtF8f4BTSlq9hhKcb4TjEvQGIydc9FfmW4mSGSXrN5dP8JBtIX1OXX5S4RQKjWzVilasHN2g89Cu289dmbynGqI01vDRF3wo81OP3HtIf3RwOFNe0LyUgqFGunhEiFnYhfSYC5dXMpoWoro2x4+ThJO3kGtZvTMQNNn96u5+UTYJDG889ggPoAzEZmcrbNLzfGAJfYOpONjZbtk3/fuRH8T2vsG5tapuIqF9Cl6G14TUfZ9DFwfkNvf1FFRnMcRekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ua/rfCNIOSrJm1obd6XP2M+GCQqum27HEf0zhX5uYMo=;
 b=JCmzopyKR0AuQ11Db8LlpQyUhVkadN8b5euodKvEzI/eyF62HJPp7TFUD5psQiH1VqgJTcW70NnSpFtksTLef5QoF4i6/KjGvJx8X216IZJbPJiC/VOraJXIrjRjDtTcpepj1INDurMZsZ8+9WOkEIwrjnvpvGYL8th+gwncwMsMaGM+rxv6nTckzXT/afGdwCtmoz38Qw9jsfkEl2NDrd8a8aagiUVIX+DcSQaaDeUkvx3cU+bkv2HVmB1TKQqZ3RibyVrdiqZ2BeLU3CBbLCFH0TpHwc+M9m4sRrL99nfuiWTCF2dHr3fzMKyVTDIQlmMI5sGTOwQ1+Gg6jgSlZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ua/rfCNIOSrJm1obd6XP2M+GCQqum27HEf0zhX5uYMo=;
 b=cy+qevvi+cpj2Y20c/TEILljvIbS/3RPQXl3xjuCQRkkAGZ80LtKFkExT5PdacXS3CxYtJFZugH6ueZ4QWZ4t6+ZEEoXS2iIydqCsGFH5gxIJqWsoi8auP9Kme+7y/eGuXlR2QhE5cqe6XLbS6ZJb6fYvJ5xJG0bs9uHxJ+t934=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB6149.eurprd04.prod.outlook.com (2603:10a6:20b:b5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.22; Mon, 31 Aug
 2020 11:00:44 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 11:00:44 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH 4/8] usb: host: xhci-plat: add .suspend_quirk for struct
 xhci_plat_priv
Thread-Topic: [PATCH 4/8] usb: host: xhci-plat: add .suspend_quirk for struct
 xhci_plat_priv
Thread-Index: AQHWMCRbdg1lrgT4nEqhJe7F1Tze76lSnGaAgAAPIAA=
Date:   Mon, 31 Aug 2020 11:00:44 +0000
Message-ID: <AM7PR04MB7157A964A5F0D67E218AC8798B510@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <20200522103256.16322-1-peter.chen@nxp.com>
 <20200522103256.16322-5-peter.chen@nxp.com> <87lfhv9lkg.fsf@kernel.org>
In-Reply-To: <87lfhv9lkg.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [180.164.158.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c36b6128-5901-42e7-00ee-08d84d9d1bfd
x-ms-traffictypediagnostic: AM6PR04MB6149:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB614985DC760EE99F5A74551B8B510@AM6PR04MB6149.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SGy4xgeDmMtQmKIzLkAdGvCTMVhRc1ypoXvqpM+sfSpHvF6kfN+Ncsu0sWQuYTLdHm9dlanMI556hBDoGv2esS+C7BmyWhh3jxIDoDDukaEc2DestOvngf5rUwn5/ocPUQAF9VU9vhNBlI1WLxNV4WQi90n1VGtEestADhn+0vkC6We2kyD2IXkRdBUYyhfgakLpaMrwz9hUiH3odsr4PmzxrVURIoQX2GU9aiaCEMfI8ZEt3IurUNaKiZyUzj3t00H8lRi9yoCbNsZzhYkQ5snxZ3+62HFBCxb9ywjL8BkndK74mq39/mWRA9oylOze91YkNVMALhOakJAlGzE+oIAK+gx8Gggzr191DyDof5uPPIlvgsQ9KiOHSN2pWNJ8
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(8676002)(5660300002)(66556008)(8936002)(66476007)(55016002)(64756008)(6506007)(7696005)(33656002)(66446008)(9686003)(558084003)(110136005)(52536014)(4326008)(71200400001)(15650500001)(54906003)(83380400001)(86362001)(44832011)(26005)(2906002)(66946007)(186003)(316002)(76116006)(478600001)(142923001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: xVRBnOY8QDsRdqc1+BOYK++jp2V7KqfwMhI13x+t9d/I2A+dPNi2VRz/MbwCW1r+onafYQ+IIdSxcmPPobampixYjfHmUiWWW51YAkoZaSZGmyB1W4g7t7US8pXnaY+oeTd2LzdzZYc9b0rZTvZwQOcmE4YgbWb4C2Z5p9W1YPf+tUcfNwDmK1qkkBy61R35/dtXfzRp3FtVDxEmelFQ/F+RsI7W+6aAfILHsFRYRrKO/f7kHJEvshNp+MMcKmiBZb4pC+2QkhJvXQes5WHC7nHjsg+dXwID7jeRZgeJbY36WkUlV9WaJmLHxduNMiUVi3E3dSDt5U/gRUIXZVWLuyrunkdOXZIIxARD08KpyVCuvSqwHJw1vPke+JydJwYYWuDGXhas/D/C8/TvwWN16HleGhMPxkfdJFCOGJxy66tX2zwR+ovGf3IrxGjTpQQc6V/ik+a0ljKd54ysDzK4ZClbIfnscVqUw00Q0Y9Mbmo+qURLEpuYMWfclBxoGDu/DhTeNYIMU0Ht8A7i98HoKgUXUAP6unN0+dqcuq+dFZwT97FwkrGHfh5ChSh9Be1pdjUrJ/YqidKwrbXMAt5mSnFfJFfONhd7j1xWJBSG9TthNDkYP32hv+KbmA04ZV9TMGyeBZ9Pf5yEyDroFA5+Ig==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c36b6128-5901-42e7-00ee-08d84d9d1bfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2020 11:00:44.6480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YR/Df248FGXDXMFV/S3sG3iylzrnEcJhIIjPIXpdG5EF7z8gdaxKuxzgFGYx+7jfyhHWWfq+aur8aCoF2qd7WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6149
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
> Subject: Re: [PATCH 4/8] usb: host: xhci-plat: add .suspend_quirk for str=
uct
> xhci_plat_priv
>=20
> Peter Chen <peter.chen@nxp.com> writes:
>=20
> > Some platforms (eg cdns3) may have special sequences between
> > xhci_bus_suspend and xhci_suspend, add .suspend_quick for it.
>                                                   ^^^^^
>                                                   quirk?
>=20

Thanks, will change.

Peter
