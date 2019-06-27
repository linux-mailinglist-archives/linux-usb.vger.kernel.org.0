Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4A558648
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2019 17:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbfF0PuW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jun 2019 11:50:22 -0400
Received: from mail-eopbgr130105.outbound.protection.outlook.com ([40.107.13.105]:29155
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726405AbfF0PuW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Jun 2019 11:50:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=targetsg.onmicrosoft.com; s=selector1-targetsg-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jh65JT27h7mihav+NLJbw1DwvcXdXymGlqMG9+6Zp6k=;
 b=YbyM09hxUz2sr6NOYIwjAkg1uuHKaz1/nYhLP2xYtJQ0yxiY4wHqkgP58xSaZKLowsbU/9WzEVc43W1RUNpH6uBQJ7QqAYaRW0XoM0NRNhIeX1ZrrSZYEfQR04jzyDhDTjiZZLW0FqfPfIbhX6WoPi8dB9yLj6R0OZJ+gXUJCj8=
Received: from AM0PR02MB3841.eurprd02.prod.outlook.com (52.134.87.30) by
 AM0PR02MB4386.eurprd02.prod.outlook.com (20.178.17.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Thu, 27 Jun 2019 15:50:17 +0000
Received: from AM0PR02MB3841.eurprd02.prod.outlook.com
 ([fe80::31ee:1319:473f:66e3]) by AM0PR02MB3841.eurprd02.prod.outlook.com
 ([fe80::31ee:1319:473f:66e3%3]) with mapi id 15.20.2008.014; Thu, 27 Jun 2019
 15:50:17 +0000
From:   Kai Ruhnau <kai.ruhnau@target-sg.com>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Peter Chen <peter.chen@nxp.com>
Subject: RE: No carrier lost information with gadget RNDIS/ECM
Thread-Topic: No carrier lost information with gadget RNDIS/ECM
Thread-Index: AdUsFPmU+UglLYdrSGuD1S1toRlligAA5T8AAAEwZfAAJNKCgAAS92iQ
Date:   Thu, 27 Jun 2019 15:50:17 +0000
Message-ID: <AM0PR02MB38418BFC9965F044B307B13CC5FD0@AM0PR02MB3841.eurprd02.prod.outlook.com>
References: <AM0PR02MB3841F110F7B6931A087DF566C5E20@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <87o92kk0ih.fsf@linux.intel.com>
 <AM0PR02MB384108B692229DF41816A363C5E20@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <871rzffszm.fsf@linux.intel.com>
In-Reply-To: <871rzffszm.fsf@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=kai.ruhnau@target-sg.com; 
x-originating-ip: [2003:c5:174d:e100:3da8:e296:2c6e:2570]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd2d51af-5f02-49ac-61b8-08d6fb1726e0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM0PR02MB4386;
x-ms-traffictypediagnostic: AM0PR02MB4386:
x-microsoft-antispam-prvs: <AM0PR02MB4386AC33D9E42AD46BB8C0DBC5FD0@AM0PR02MB4386.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39830400003)(136003)(366004)(376002)(346002)(396003)(189003)(199004)(9686003)(68736007)(14444005)(55016002)(256004)(11346002)(446003)(476003)(486006)(6116002)(46003)(2501003)(99286004)(5660300002)(25786009)(4744005)(66476007)(66556008)(64756008)(73956011)(66946007)(66446008)(14454004)(33656002)(76116006)(44832011)(52536014)(53936002)(102836004)(316002)(76176011)(305945005)(508600001)(7736002)(6506007)(2906002)(6436002)(74316002)(110136005)(8676002)(81156014)(81166006)(8936002)(86362001)(6246003)(186003)(229853002)(71190400001)(71200400001)(7696005);DIR:OUT;SFP:1102;SCL:1;SRVR:AM0PR02MB4386;H:AM0PR02MB3841.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: target-sg.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hxtFuJ/izIjspzUsDCNTbwVpCSSxJruamfF1yWWDd5rt8V8hArM2j+zr+5kDI3rFcWf3gi4IB4d+H59W67cok00IkPkJAV05P9D0teG9dKnbKiIq5SjkT4ltxbHCQAohNadS/lzerkEij/sznVvqED7cerzJFJpYiMUEkq//XOVUyLxkmh3DoE5ePDlGp/fBAdmjdMyIvOJV2TANm+fLiBw0BTzbVTXnPS7s3JoxEGfhVmJzgj6aydyIJxZ8+19fryM16C7dY0wt7wTzV4icFW84kT7qEEQWaoDCYtu/Ac3C2gLl7/D9RYm38TWFWELF7yyrSS3LM6/ZW+y4gM6BVFfroK6sMU8wHmfpJh9vAkqNMeE3YVMZ3J7hFdlTo+KgI36RVZT4DK8keMJDBQs9o7EF1zd58PliHzoRfTc2ZmQ=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: target-sg.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2d51af-5f02-49ac-61b8-08d6fb1726e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 15:50:17.3483
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 52a4fe2f-f30a-452d-90b1-03ecc8ab0c0d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kai.ruhnau@target-sg.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB4386
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Felipe Balbi writes:
> Kai Ruhnau <kai.ruhnau@target-sg.com> writes:
>>> Which peripheral controller is this board using? Is it chipidea? dwc2?
>>> dwc3? High Speed or Super Speed?
>>
>> According to the device tree it's 'fsl,imx6sx-usb' driven by chipidea/ci=
_hdrc_imx.c
>> When connecting to Windows, the dmesg shows:
>>  configfs-gadget gadget: high-speed config #2: c
>
> Okay, adding Peter (chipidea maintainer) to the loop here. There are a
> few changes on UDC side of chipidea between 4.9 and 5.1:
>
> Peter, have you seen the problem described before?

Findings today:

The "Lost carrier" message comes when the 4.9 kernel enters runtime suspend=
 (ci_runtime_suspend).

With kernel 4.19, that function is called once during boot with a matching =
ci_controller_resume when I activate the configfs configuration. After that=
, the chip does not enter runtime suspend when I pull the USB cable, but do=
es with 4.9.

Cheers,
Kai
