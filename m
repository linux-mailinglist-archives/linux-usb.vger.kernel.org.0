Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDD73569C2
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2019 14:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbfFZMxy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jun 2019 08:53:54 -0400
Received: from mail-eopbgr20120.outbound.protection.outlook.com ([40.107.2.120]:3478
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726484AbfFZMxy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Jun 2019 08:53:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=targetsg.onmicrosoft.com; s=selector1-targetsg-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xEUaqHwHLum/JzKF3yyrvXr1zZFvRL98vB7sBzU7vo=;
 b=fKMXZdpF6soWz96I0XU8I1N2PHishMvH2PIV9smT/FY4BbiaHXxoqsBVkeaL5vsZMMSH3Y/BN45ZQD10RpcWrPOTAnqJie4G9AquO9Z/O0lIMMd/JkOKxzbyiDdqQFB7sUTrHRaUXcJZ/XMRgYuwyonwhEoUw9AKgC3JjmFWa7U=
Received: from AM0PR02MB3841.eurprd02.prod.outlook.com (52.134.87.30) by
 AM0PR02MB5937.eurprd02.prod.outlook.com (52.132.214.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.13; Wed, 26 Jun 2019 12:53:50 +0000
Received: from AM0PR02MB3841.eurprd02.prod.outlook.com
 ([fe80::31ee:1319:473f:66e3]) by AM0PR02MB3841.eurprd02.prod.outlook.com
 ([fe80::31ee:1319:473f:66e3%3]) with mapi id 15.20.2008.014; Wed, 26 Jun 2019
 12:53:50 +0000
From:   Kai Ruhnau <kai.ruhnau@target-sg.com>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: No carrier lost information with gadget RNDIS/ECM
Thread-Topic: No carrier lost information with gadget RNDIS/ECM
Thread-Index: AdUsFPmU+UglLYdrSGuD1S1toRlligAA5T8AAAEwZfA=
Date:   Wed, 26 Jun 2019 12:53:50 +0000
Message-ID: <AM0PR02MB384108B692229DF41816A363C5E20@AM0PR02MB3841.eurprd02.prod.outlook.com>
References: <AM0PR02MB3841F110F7B6931A087DF566C5E20@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <87o92kk0ih.fsf@linux.intel.com>
In-Reply-To: <87o92kk0ih.fsf@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=kai.ruhnau@target-sg.com; 
x-originating-ip: [2003:c5:174d:e100:25a7:3c39:a66b:ad15]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 507e0935-f810-49b4-d5a8-08d6fa355661
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM0PR02MB5937;
x-ms-traffictypediagnostic: AM0PR02MB5937:
x-microsoft-antispam-prvs: <AM0PR02MB59378B75E838C6A1D8CDFF34C5E20@AM0PR02MB5937.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39830400003)(376002)(396003)(366004)(346002)(136003)(199004)(189003)(186003)(86362001)(44832011)(68736007)(53936002)(6436002)(6506007)(11346002)(102836004)(446003)(55016002)(486006)(6116002)(71200400001)(71190400001)(110136005)(316002)(476003)(2906002)(46003)(5660300002)(229853002)(14454004)(52536014)(76176011)(81166006)(73956011)(8676002)(256004)(8936002)(5024004)(81156014)(25786009)(508600001)(74316002)(99286004)(6246003)(33656002)(66476007)(66556008)(64756008)(66446008)(7696005)(9686003)(2501003)(7736002)(66946007)(305945005)(76116006);DIR:OUT;SFP:1102;SCL:1;SRVR:AM0PR02MB5937;H:AM0PR02MB3841.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: target-sg.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MSQSygGpWVPBiQ9amcKnVTgK8V7mfnDwGkpMs6XeEUhYcHYSD2Wkm69B+sJ5s/Z7qyaXuZQrXNpVLTyzXh0xRp+U79Ebmb3iZQEa3RuEfso7tkQvadNvAuoupX1809lk5fP8WGD55uv9ULu6Yo2gTjlVwxTdQKGadFHyB/3VtMlAIwfSTRkMrv/rqTNM53yZuSQITqpQrjtrDwCCsnRN8gQjLLHWvIwEnu7aE7Rm/ByeR9O7c/cpdP56U/3I6LBSaJcSn5xGzCSjWBJzAOkQjUkxaZLrrJ8xRdZ+rAwOFJ3ovHoluwZ8w5jdTJ3yWKmG02+RqSGtAPaPkZTXKcIBwJLULU4hU964X298JrMlO9aJnIYpSL1kHMHZdqPIyvn8MLKm2K+wZdi8PEcywpDE28nMZiz8/+VmeVHyCrwMIw4=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: target-sg.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 507e0935-f810-49b4-d5a8-08d6fa355661
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 12:53:50.7357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 52a4fe2f-f30a-452d-90b1-03ecc8ab0c0d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kai.ruhnau@target-sg.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5937
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Felipe Balbi writes:
> Kai Ruhnau <kai.ruhnau@target-sg.com> writes:
>> On my i.MX6 SoloX, I have configured one of the OTG ports for a=20
>> combined RNDIS/ECM gadget. After boot, I have two network interfaces
>> (usb0 and usb1) which are managed by systemd-networkd.
>>
>> With kernel 4.9.153, systemd-networkd reports an immediate carrier=20
>> loss when I pull the USB cable from a Windows or macOS host. With
>> 4.19.53 or 5.1.15 that carrier loss is only reported when I re-attach=20
>> the cable, meaning there is a "Lost carrier" for the last used=20
>> interface immediately followed by a "Gained carrier" for the newly=20
>> connected interface.
>
> First of all, thanks for actually testing the most recent stable kernels.=
 Much appreciated :-)

Sure. Having so much support for the i.MX6 in mainline helps a lot :)

>> I have activated CONFIG_USB_GADGET_DEBUG_FILES, and the contents of
>> /proc/driver/rndis-000 don't change when I pull the cable:
>>
>> Config Nr. 0
>> used      : y
>> state     : RNDIS_DATA_INITIALIZED
>> medium    : 0x00000000
>> speed     : 425984000
>> cable     : connected
>> vendor ID : 0x00000000
>> vendor    : (null)
>>
>> Only when changing the host to a Mac, it's different:
>> Config Nr. 0
>> used      : y
>> state     : RNDIS_UNINITIALIZED
>> medium    : 0x00000000
>> speed     : 425984000
>> cable     : connected
>> vendor ID : 0x00000000
>> vendor    : (null)
>>
>> Thanks for any help.
>
> Which peripheral controller is this board using? Is it chipidea? dwc2?
> dwc3? High Speed or Super Speed?

According to the device tree it's 'fsl,imx6sx-usb' driven by chipidea/ci_hd=
rc_imx.c
When connecting to Windows, the dmesg shows:
 configfs-gadget gadget: high-speed config #2: c

Cheers,
Kai
