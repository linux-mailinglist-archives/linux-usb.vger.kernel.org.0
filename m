Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12ECF6D8CE1
	for <lists+linux-usb@lfdr.de>; Thu,  6 Apr 2023 03:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232271AbjDFBmt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Apr 2023 21:42:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbjDFBms (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Apr 2023 21:42:48 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2118.outbound.protection.outlook.com [40.107.21.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C73C26A45
        for <linux-usb@vger.kernel.org>; Wed,  5 Apr 2023 18:42:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbKFuA9rC6NvrreMKy+q5Oty4Uv7PWiM0xbsll9WaDWlgpe1So7YDOfSQ9tS0eBAXca2R26fA/KyAJStm6MC2LUvE/iYZx2LrUqoadciWAWqWWGnQruGjWmP59ohOogjZbEo+KKDPKtNIcbaErmjfmAsdahJLuj7IIz24znKIkOP5ygJW25sYFxVTFJBzUzRrDE1IaS8JgukFH6wcqUp3lQbjX80RAncU9qEu0uSpLboWdr4LpAdgM2Nse3Apik9FXxYlmKCIuvor6e8UPd5KRcQ/tU7pv9CqiFQIPJuJ4+77DDsQlmYL+ESZZ2AugOG/6XgUXPJzKi67SOuFWOrIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ow2KVV+ozT7WVDlgKPqcO8r0WAm5RmqRHsDn5+R2uvA=;
 b=I3wyDXHSvNWRfCzE+hhHtJky7BoJKvAlzmCQfKerNfW5kVv5+Z8toeahNHwmztA0qPMQdQqlGAlbSvjQ1KM611VNNTmNfzCyh8W+ML7BX/VS/sppUWhqXcUAkaaiW0gnoIjSVUQ9FxE6KTQKYdYak3NYKNOoAylkPYAQGcEkz0kD9lX6hWMtE6A4O046EbXAn7raJxP3Ou9DRcg/3YmtmpgkrsJ3rxYTywlFjwJpzpDYBqSP5D8LXflYjwQKQEN4TcXHJWsq4PIy1gpIFSUmjOTwPRJe1ZdSp5O0wpnRT32QGmqSUYviVnBX5yl+qqj+TTA1vYpsNqKWh9hQyQKx7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=raritan.com; dmarc=pass action=none header.from=raritan.com;
 dkim=pass header.d=raritan.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grpleg.onmicrosoft.com; s=selector1-grpleg-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ow2KVV+ozT7WVDlgKPqcO8r0WAm5RmqRHsDn5+R2uvA=;
 b=f6cw5JsnUcbr1wlMlTKmVQdKBLCcVXv3o7dxlkhkexUTcParsGl01IMFd3wPBAtj61eS88vlqR60Mv8ac4iFpzGfCmPZ/XLH6CGnONri4l+wh0WGSYBc8j5T21RKEn8wHbY89rquHKDV1nIGREEnw6utFIrK/JQ83rhbmR5766M=
Received: from PAXPR06MB8531.eurprd06.prod.outlook.com (2603:10a6:102:2b6::14)
 by DB7PR06MB4758.eurprd06.prod.outlook.com (2603:10a6:10:5f::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 01:42:41 +0000
Received: from PAXPR06MB8531.eurprd06.prod.outlook.com
 ([fe80::924c:fe2a:59a5:6023]) by PAXPR06MB8531.eurprd06.prod.outlook.com
 ([fe80::924c:fe2a:59a5:6023%5]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 01:42:40 +0000
From:   PALAK SHAH <palak.shah@raritan.com>
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: usb: gadget: dwc2: not getting audio data
Thread-Topic: usb: gadget: dwc2: not getting audio data
Thread-Index: AQHZRohi1FGE81YVE0iozG6O6EPfb67bcCYwgACjvICAARL2gIAAwscAgAQn7VCAAIsPgIAAnGgggAVNCQCABXzZ4IAAyyMAgAKwvbCAANDigIAAZ33wgAEaNoCAKe/LEA==
Date:   Thu, 6 Apr 2023 01:42:40 +0000
Message-ID: <PAXPR06MB8531486338B7D2E4289324878D919@PAXPR06MB8531.eurprd06.prod.outlook.com>
References: <HE1PR0601MB25868E34AF4BA6CEAFE06F5F8DA39@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <BYAPR12MB339948C507588E0E68556ADBA7AA9@BYAPR12MB3399.namprd12.prod.outlook.com>
 <HE1PR0601MB2586BFAE94813BA86BAB12708DAA9@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <BN8PR12MB3395053B96DF2333794DBBEDA7AB9@BN8PR12MB3395.namprd12.prod.outlook.com>
 <HE1PR0601MB25868FC836C3CD2D07B342958DAB9@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <BYAPR12MB33990B69E647DC5128417573A7A89@BYAPR12MB3399.namprd12.prod.outlook.com>
 <HE1PR0601MB25867DACFD232748FD194CEB8DAF9@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <BYAPR12MB339985F59077F180D10412D3A7AF9@BYAPR12MB3399.namprd12.prod.outlook.com>
 <HE1PR0601MB2586DB1CA3D0B4B45E7720A68DAF9@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <BYAPR12MB33993D83145BFE17DB53BF1CA7B39@BYAPR12MB3399.namprd12.prod.outlook.com>
 <HE1PR0601MB2586C22FC9F24A7101E476728DB69@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <BYAPR12MB3399505268C0FE1AECDD9C8CA7B79@BYAPR12MB3399.namprd12.prod.outlook.com>
 <HE1PR0601MB2586EC156A9A7AB4B268DC2E8DB49@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <BYAPR12MB33998FFE1D1B011A18DD3A31A7B59@BYAPR12MB3399.namprd12.prod.outlook.com>
 <HE1PR0601MB2586E21D0863851DC011BD3C8DB59@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <BYAPR12MB33992177D65F76E4C2BA9516A7BA9@BYAPR12MB3399.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB33992177D65F76E4C2BA9516A7BA9@BYAPR12MB3399.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=raritan.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR06MB8531:EE_|DB7PR06MB4758:EE_
x-ms-office365-filtering-correlation-id: 77d36df1-efc8-4ba8-3024-08db36403599
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t7ru6LToH3Vq/PMXuII2tUXoFhNO8OnZnI4ivjQY8XhN5kiQmfjs/nU8l3je+adlGNvCOI/23lss8+FbqidbtcU6BwLoJ9xvR3xOmKkIlekDT+SMNcGzHVsJIkp2gJLTzYtHWz4V3cBki7SCRIZliUPneXuVWZixaXdh9zubI+QQnECQ+UOoxaceERfoLqyRuU6sdDNDm5onAkRHJgnN1pH/nzV55VfnKRtc0cAtHB+SogLCX1kHkLA6dVMUL4wVL5JnitWfRzvPavSmgdDfia7jXx7uV/ZJYH28rbAxZtm83Tkj+OfJjJ1zvQewKSIKrhgZxBzmi2fpzK6BFTAYiwC7/tzZnv76YWA3nCtt3I9Mdq0nmwUvQSsuTIgPPgVh73rcTKdzo6qA7AaW+pc6mttGDHkq+f0P1ZaXCgtBHcXQyvnwly6g7B9Yds1hb9QQnIusLWf3EWEk4Hu/xQz3K/dXzoKixdAvC7WiAUJLp8E9mOQidrqtnbG5E8SHTuEnYKbFk4z6uwUT6GE7xl6fLGlhmgjweLDFGWVcumouPxPfdMW3VizTYtPqk+QRcOI9+7i7BU9bgVnkYDLuXEXLisKzqFixsQ/M8a1pYVFwrLYEoi0wjGBp2fazVSZ1EfGkqygDsDddQw89/FiRMStLROlExxh6OQvDtVbiLOhXVJLGfukQYwoIDFXw/rpiPPQD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB8531.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(346002)(39860400002)(376002)(396003)(451199021)(66574015)(83380400001)(45080400002)(478600001)(71200400001)(7696005)(316002)(26005)(6506007)(9686003)(186003)(53546011)(30864003)(5660300002)(2906002)(33656002)(38100700002)(4326008)(6916009)(64756008)(66946007)(76116006)(66476007)(66446008)(8676002)(122000001)(41300700001)(86362001)(66556008)(52536014)(38070700005)(8936002)(55016003)(414714003)(473944003)(44824005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?q6sZmpU1wDVl2SrpSLw945OW84dzbXobwU/7de2i4MBKGRmdO/89Mn61iX?=
 =?iso-8859-1?Q?BZo2U0LxLSyMVb5U6NJJ+ovDe1uq0Y60xBQIL4OyEglfIpbvrQH2jNIuKN?=
 =?iso-8859-1?Q?WPMhMH/hjOzbBCyIa2ebbpzjpFqOWQtBku6EyL8ukAJD4SlFma/1FL+JtC?=
 =?iso-8859-1?Q?FCcJzPx4v92S/0HA3PycE3bh56LI+Tsxya94qdpemOl7nstczFy/hSTkDY?=
 =?iso-8859-1?Q?9H/JxHxzGbQsQxNPjqs+hBujN7DLQtUpsrGxUxW5VCIbvYv8onQ8gSVlfC?=
 =?iso-8859-1?Q?dHT3bysXGVvl9xZ7ZWY/FwsjklY92ANLr4Vd41S/hEwiIOWTVKxquo/VhU?=
 =?iso-8859-1?Q?/g1X51FBnQUz07Q4aWI0m+HrUyIJG/UYXkcXoujLDHFjx6T6lv5FmNbVsW?=
 =?iso-8859-1?Q?F4GMCX1QEN14ddrnZ42i7h1qPHoXUku5E0ZkYx/pzn4C5R6+f6SStavwqz?=
 =?iso-8859-1?Q?KdsSHETW+9H7QrclMOjJ7oOP5XvUQMtPOKkPHXOw0uoRm8CAlInUKizwGC?=
 =?iso-8859-1?Q?3pg+VKgdwzYCLekBOgzGOUZFLPl6gncWli73O9K2Ot6tQ7sFEe9ywuA17y?=
 =?iso-8859-1?Q?PJYG87871EzywBwW5qGySaFPJVht+euRWtUEcuvb1DLjP16wf3P7YZlUMT?=
 =?iso-8859-1?Q?enEVya/KKi8s14HQuX6KHCo+saVeJqSnUBoWmASsUmFVPVR+pkVEZ5j0xU?=
 =?iso-8859-1?Q?nfTWUwUOJjqBusXmb7c+YwaGKrCnQYJu0g2k1PXCgzY+gBKB/DMPZJVf/T?=
 =?iso-8859-1?Q?qrfPwoqwckCaqhOAliQ0o8pqX+i29iOrzkU44mA3Aq77OO3gYrNmACWUWB?=
 =?iso-8859-1?Q?kps8LiPmMu7Ks8CiO9CUoCqPJNnloRcHM41dW/QBv/i5RK3o04YNr9OGKc?=
 =?iso-8859-1?Q?K0b0D4BYRFUQPbatAq1LHsuqWqA6m0y1ya7SOgIOtWdwqzJxUsYyCHUKOE?=
 =?iso-8859-1?Q?GuyF+FOe6wuYBG6JuuSpw/LPa2TXCyH1gG7dSdu7xnd7l2/vWzJ2MWxwcM?=
 =?iso-8859-1?Q?b/655iig7rptPK2CBPbyd4gvKxRXguAPvZbKw7edpmDlXT7XG6GE7ERmGw?=
 =?iso-8859-1?Q?NQlUmG1WXK/tKryuB7Fq9Len9yJi11eYqSCfoeF/pZh7nRcRWLvQBDgqj5?=
 =?iso-8859-1?Q?S/hZlKkX+faUuz0WUopfaL+aKwVXp4U/R1cCoKMhG6/HbiankTqVFdxZhE?=
 =?iso-8859-1?Q?xMaJ26SBjf5qyqrep9fIy5YdcxWLtt8siqLQwEf8MzBUbIC0SMdlIM6iLU?=
 =?iso-8859-1?Q?ymPeO5kS/X6qhbLHLlxe1BMPM3aQd5AnzT/XLAKekI5WhNhb6xpvnEXcg5?=
 =?iso-8859-1?Q?+afaX+ZPNf7PYyBbxtYQWIKKCUnmKanEnWp2XfaZNr7MmH5E6QV2gHbsxh?=
 =?iso-8859-1?Q?pvx9jhp5+a8EV/7b2N3uLoCIn+2pRIwkhwc8pHtwKXEoWohDTkCXZvJCUX?=
 =?iso-8859-1?Q?gBDZKY/wTKqTbDAMBzUrMLz8bK7z+Ku8o7wBUAj62veYGkSPr5UvyHQooZ?=
 =?iso-8859-1?Q?wHoeYFWqzPPapkyZG5ddEsWSa0cjQ9Ord1oHQDwjG2HfiYcsX5tlH/MowX?=
 =?iso-8859-1?Q?mDMcRw52AkUaS7nUMDwiKCrjkd+BFL3eYxokZ1iDTEmIygn8uV+M8PyTyf?=
 =?iso-8859-1?Q?QzchBeHVfCZ16tDAXunU/5Io9zrQ/GHg6V?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: raritan.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8531.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77d36df1-efc8-4ba8-3024-08db36403599
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2023 01:42:40.7626
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 199686b5-bef4-4960-8786-7a6b1888fee3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MjEWyp4l8ExVCJ00RbtInf0bF/HPlFVYoKy6idCV3Xi5bCf+u9VN4qB4GI4CvDziO5xoggm8HEQWKspCSeDrzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR06MB4758
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Minas,
Last week I was able to install g_zero driver on the device side. And I ins=
talled usbtest.ko as a static driver on the linux host kernel running kerne=
l version 5.0.9.

On the host I see -
[palakshah@localhost usb]$ lsusb
Bus 002 Device 002: ID 8087:8000 Intel Corp.
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 8087:8008 Intel Corp.
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 006: ID 0525:a4a0 Netchip Technology, Inc. Linux-USB "Gadget=
 Zero" // g_zero driver
Bus 003 Device 002: ID 04b4:0101 Cypress Semiconductor Corp. Keyboard/Hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

I ran the test
[palakshah@localhost usb]$ sudo ./testusb -a
unknown speed   /dev/bus/usb/003/006    0
/dev/bus/usb/003/006 test 0,    0.000013 secs
/dev/bus/usb/003/006 test 1,    0.216270 secs
/dev/bus/usb/003/006 test 2,    0.096186 secs
/dev/bus/usb/003/006 test 3,    0.216282 secs
/dev/bus/usb/003/006 test 4,    0.096046 secs
/dev/bus/usb/003/006 test 5,    2.870960 secs
/dev/bus/usb/003/006 test 6,    3.055972 secs
/dev/bus/usb/003/006 test 7,    2.872110 secs
/dev/bus/usb/003/006 test 8,    3.059713 secs
/dev/bus/usb/003/006 test 9,    8.601377 secs
/dev/bus/usb/003/006 test 10,   26.794975 secs
/dev/bus/usb/003/006 test 11,    4.006801 secs
/dev/bus/usb/003/006 test 12,    4.002395 secs
/dev/bus/usb/003/006 test 13,    4.874480 secs
/dev/bus/usb/003/006 test 14 --> 22 (Invalid argument)
/dev/bus/usb/003/006 test 17,    0.185385 secs
/dev/bus/usb/003/006 test 18,    0.098154 secs
/dev/bus/usb/003/006 test 19,    0.197473 secs
/dev/bus/usb/003/006 test 20,    0.098188 secs
/dev/bus/usb/003/006 test 21 --> 22 (Invalid argument)

Atleast now I can run some of the tests, however I am interested in the ISO=
C transfer, which is tested using t15 and t16. But test 15 and 16 did not r=
un.

I put more messages in the code and I found that, it exits both the tests -
                if (dev->out_iso_pipe =3D=3D 0 || param->sglen =3D=3D 0){
                    pr_info("TEST 15: dev->out_iso_pipe =3D=3D 0 || param->=
sglen =3D=3D 0 Error condition!!\n");
                    break;
                }

I put more messages in the code, and I realize that dev->out_iso_pipe is nu=
ll.

                if (dev->in_pipe){
                        printk("dev->in_pipe is true\n"); this gets printed
                        rtest =3D " bulk-in";
                }
                if (dev->out_pipe){
                        printk("dev->out_pipe is true\n"); this gets printe=
d
                        wtest =3D " bulk-out";
                }
                if (dev->in_iso_pipe){
                    printk("dev->in_iso_pipe is true\n"); // this doesn't g=
et printed.
                    irtest =3D " iso-in";
                }
                if (dev->out_iso_pipe){
                        printk("dev->out_iso_pipe is true\n"); // not print=
ed
                        iwtest =3D " iso-out";
                }

Some dmesg messages that I printed, it prints in_pipe and out_pipe is true =
for BULK transfer, but ISOC transfer is not set.

[    2.051466] usb 3-8: New USB device found, idVendor=3D0525, idProduct=3D=
a4a0, bcdDevice=3D 5.04
[    2.051468] usb 3-8: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[    2.051469] usb 3-8: Product: Gadget Zero
[    2.051470] usb 3-8: Manufacturer: Linux 5.4.80-kx4 with ffb40000.usb
[    2.051471] usb 3-8: SerialNumber: 0123456789.0123456789.0123456789
[    2.053199] USBTEST.ko usbtest_probe!!!
[    2.053200] dev->in_pipe is true
[    2.053200] dev->out_pipe is true
[    2.053201] USBTEST : Linux gadget zero
[    2.053202] USBTEST high-speed {control in/out bulk-in bulk-out} tests (=
+alt)
[    2.166449] usb 3-10: new low-speed USB device number 3 using xhci_hcd

Any idea how I can test ISOC test?

Thanks,
Palak

-----Original Message-----
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Sent: Friday, March 10, 2023 4:04 AM
To: Palak SHAH <palak.shah@raritan.com>; Maynard CABIENTE <maynard.cabiente=
@raritan.com>
Cc: linux-usb@vger.kernel.org
Subject: RE: usb: gadget: dwc2: not getting audio data

Hi Palak,

>On 3/9/2023 8:21 PM, Palak SHAH wrote:
>From: Palak SHAH <palak.shah@raritan.com>
>Sent: Thursday, March 9, 2023 8:21 PM
>To: Minas Harutyunyan <hminas@synopsys.com>; Maynard CABIENTE
><maynard.cabiente@raritan.com>
>Cc: linux-usb@vger.kernel.org
>Subject: RE: usb: gadget: dwc2: not getting audio data
>
>Hi Minas,
>Yes I do have g_audio module loaded.
>
>This dmesg logs are from my device -
>[ 1151.517385] g_audio gadget: Linux USB Audio Gadget, version: Feb 2,
>2012 [ 1151.517401] g_audio gadget: g_audio ready [ 1151.517418] dwc2
>ffb00000.usb: bound driver g_audio [ 1151.640143] dwc2 ffb40000.usb:
>bound driver configfs-gadget [ 1151.808188] dwc2 ffb40000.usb: new
>device is high- speed [ 1151.922374] dwc2 ffb40000.usb: new device is
>high-speed [ 1151.982406] dwc2 ffb40000.usb: new address 24 [
>1151.996762] configfs- gadget gadget: high-speed config #1: c
>
># lsmod
>Module                  Size  Used by
>usb_f_uac1             20480  3
>u_audio                20480  1 usb_f_uac1
>snd_pcm                94208  1 u_audio
>snd_timer              36864  1 snd_pcm
>g_audio                16384  0
>usb_f_hid              20480  9
>libcomposite           61440 16 usb_f_uac1,u_audio,g_audio,usb_f_hid
>
>This is my host -
>[palakshah@fedora ~]$ lsusb
>Bus 002 Device 002: ID 0bda:0328 Realtek Semiconductor Corp. USB3.0-CRW
>Bus
>002 Device 003: ID 0bda:0411 Realtek Semiconductor Corp. Hub Bus 002
>Device
>001: ID 1d6b:0003 Linux Foundation 3.0 root hub Bus 001 Device 023: ID
>14dd:1010 Raritan Computer, Inc. KX4-101 // this is my device that I am
>connected to.
>Bus 001 Device 002: ID 14dd:1007 Raritan Computer, Inc. D2CIM-VUSB KVM
>connector Bus 001 Device 005: ID 8087:0a2b Intel Corp. Bluetooth
>wireless interface Bus 001 Device 004: ID 0bda:5411 Realtek Semiconductor =
Corp.
>RTS5411 Hub Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root
>hub
>
>[palakshah@fedora ~]$ sudo ./testusb -D /dev/bus/usb/001/023 -t15
>[sudo] password for palakshah:
>./testusb: /dev/bus/usb/001/023 may see only control tests
>/dev/bus/usb/001/023 test 15 --> 25 (Inappropriate ioctl for device)
>
>[palakshah@fedora ~]$ sudo ./testusb -D /dev/bus/usb/001/023 -t16
>./testusb: /dev/bus/usb/001/023 may see only control tests
>/dev/bus/usb/001/023 test 16 --> 25 (Inappropriate ioctl for device)
>
>But still host cannot talk to the device.
>

On host side should be loaded module usbtest.ko On device side remove your =
function(gadget) driver, instead load g_zero (not g_audio) function.

Thanks,
Minas


>Thanks,
>Palak
>
>-----Original Message-----
>From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
>Sent: Thursday, March 9, 2023 5:03 AM
>To: Palak SHAH <palak.shah@raritan.com>; Maynard CABIENTE
><maynard.cabiente@raritan.com>
>Cc: linux-usb@vger.kernel.org
>Subject: RE: usb: gadget: dwc2: not getting audio data
>
>Hi Palak,
>
>>On 3/9/2023 1:42 AM, Palak SHAH wrote:
>>From: Palak SHAH <palak.shah@raritan.com>
>>Sent: Thursday, March 9, 2023 1:42 AM
>>To: Minas Harutyunyan <hminas@synopsys.com>; Maynard CABIENTE
>><maynard.cabiente@raritan.com>
>>Cc: linux-usb@vger.kernel.org
>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>
>>Hi Minas,
>>A while ago, I asked you if I can run a usb test, to test IP core,
>>without doing audio test.
>>
>>You had suggested that to test usbtest program (see
>>https://urldefense.com/v3/__https://eur01.safelinks.protection.outlook.
>>com/?url=3Dhttps*3A*2F*2Furldefense.com*2Fv3*2F__https*3A*2F*2Feur01.saf
>>e
>>links.protection.outlook.com*2F&data=3D05*7C01*7Cpalak.shah*40raritan.co
>>m
>>*7Ce899edf3108b4733963408db2085841d*7C199686b5bef4496087867a6b1888fee3
>>*
>>7C1*7C0*7C638139530054005175*7CUnknown*7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM
>>D
>>AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0*3D*7C3000*7C*7C*7C&sdata
>>=3D
>>efRKGkGDjq5OhK347*2B6r2*2FaXjZy4wysBzzl5XezhEZo*3D&reserved=3D0*__;JSUlJ
>>S
>>UlJSUlJSUlJSUlJSUlJSUlJSUlJSUlPw!!A4F2R9G_pg!fXoTRt1krMtYNUcU033cc_CYw
>>9 YrC_nUj99EXR4vAwT-hb3T78zqvyakXvx4elweFNfmoHxwarh2RDYX7L7rJqCcWz9z$
>>url=3Dhttp*3A*2F*2Fwww.linux-
>>usb.org*2Fusbtest*2F&data=3D05*7C01*7Cpalak.shah*40raritan.com*7Ccdc9cf1
>>8
>>d5c54
>>b2c74fc08daf53d681e*7C199686b5bef4496087867a6b1888fee3*7C1*7C0*7C63809
>>1
>>94134
>>5558693*7CUnknown*7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC
>>J
>>BTiI6
>>Ik1haWwiLCJXVCI6Mn0*3D*7C3000*7C*7C*7C&sdata=3DOIiLXl6dlCHlfACx6ZxpLhQkp
>>0
>>7xIwb
>>qAR3CtnqfsFU*3D&reserved=3D0__;JSUlJSUlJSUlJSUlJSUlJSUlJSUl!!A4F2R9G_pg!
>>f
>>3GN6S
>>P6NM--pKekkA-jG4RICPguFvb3DNeRO6jFDEhovrY3IEC2-
>>aL0ay4g95j7BsdRM6JRGwjL6kPzTS8z13tShKOe$ )
>>
>>So I tried this program. I compiled it on my linux host, and run it on
>>the host, which is connected to the Linux device acting as USB gadget.
>>
>>I am running test t15 and t16 which is for ISOC. Infact I tried
>>running
>all.
>>I ran it on the host device. And I get this error -
>>
>>[palakshah@fedora ~]$ sudo ./testusb -D /dev/bus/usb/001/019 -t15
>>./testusb: /dev/bus/usb/001/019 may see only control tests
>>/dev/bus/usb/001/019 test 15 --> 25 (Inappropriate ioctl for device)
>>
>>Either I get error 25 (Inappropriate ioctl for device) or error 38
>>(Function Not Implemented).
>>
>>If I do, [palakshah@fedora ~]$ sudo ./testusb -a no test devices
>>recognized
>>
>>I tried to google, why these tests don't work, but did not find
>>anything useful. Do you have any idea?
>>
>
>Did you modprobe g_zero module on device side?
>lsusb command should show that connected device:
>...
>Bus 001 Device 002: ID 0525:a4a0 Netchip Technology, Inc. Linux-USB
>"Gadget Zero"
>...
>
>Thanks,
>Minas
>
>>Thanks,
>>Palak
>>
>>-----Original Message-----
>>From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
>>Sent: Monday, March 6, 2023 11:31 PM
>>To: Palak SHAH <palak.shah@raritan.com>; Maynard CABIENTE
>><maynard.cabiente@raritan.com>
>>Cc: linux-usb@vger.kernel.org
>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>
>>Hi Palak,
>>
>>>On 3/6/2023 8:26 AM, Palak SHAH wrote:
>>>From: Palak SHAH <palak.shah@raritan.com>
>>>Sent: Monday, March 6, 2023 8:26 PM
>>>To: Minas Harutyunyan <hminas@synopsys.com>; Maynard CABIENTE
>>><maynard.cabiente@raritan.com>
>>>Cc: linux-usb@vger.kernel.org
>>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>>
>>>Hi Minas,
>>>
>>>>I can recommend you:
>>>>1. disable debug prints to minimize platform loading
>>>
>>>[Palak] I am working on this
>>>
>>>>2. change Descriptor DMA mode to Buffer DMA
>>>
>>>[Palak] Can you please explain this more, what does this mean?
>>
>>Core can work in 3 different modes to transferring data between FIFO
>>and
>>RAM: Slave, Buffer DMA and Descriptor DMA.
>>
>>To switch from DDMA to BDMA in file params.c file in function
>>dwc2_set_default_params()
>>        ...
>>        if ((hsotg->dr_mode =3D=3D USB_DR_MODE_PERIPHERAL) ||
>>            (hsotg->dr_mode =3D=3D USB_DR_MODE_OTG)) {
>>                p->g_dma =3D dma_capable;
>>                p->g_dma_desc =3D hw->dma_desc_enable;
>>        ...
>>Update last line to
>>                p->g_dma_desc =3D 0;
>>
>>Thanks,
>>Minas
>>
>>>
>>>Thanks,
>>>Palak
>>>
>>>-----Original Message-----
>>>From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
>>>Sent: Thursday, March 2, 2023 11:35 PM
>>>To: Palak SHAH <palak.shah@raritan.com>; Maynard CABIENTE
>>><maynard.cabiente@raritan.com>
>>>Cc: linux-usb@vger.kernel.org
>>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>>
>>>Hi Palak,
>>>
>>>>On 2/28/2023 12:21 AM, Palak SHAH wrote:
>>>>From: Palak SHAH <palak.shah@raritan.com>
>>>>Sent: Tuesday, February 28, 2023 12:21 AM
>>>>To: Minas Harutyunyan <hminas@synopsys.com>; Maynard CABIENTE
>>>><maynard.cabiente@raritan.com>
>>>>Cc: linux-usb@vger.kernel.org
>>>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>>>
>>>>Hi Minas,
>>>>I have attached the following USB traces and debug log.
>>>>1) dmesg and usb sniffer logs during driver loading.
>>>>
>>>>2) EP1(OUT) - I play AUDIO on the HOST. And I do arecord on the
>>>>linux device that acts as USB gadget. So the audio is going OUT from
>>>>the host. So you will see EP1 OUT.
>>>>I have attached logs and USB sniffer data, during arecord.
>>>>
>>>>I am not testing ISOC EP1(IN) yet. I am still seeing and debugging
>>>>issues with Ep1(out).
>>>>
>>>>3) When I change UAC1_DEF_REQ_NUM 2 changed to 32, the problem STILL
>>>>exist with EP1(OUT). ONLY log behaivor is different. In the log I
>>>>see XferCompl, but I don't get any data in the arecord.
>>>>I have attached 2 files. Arecord_command.txt shows what I run.
>>>>Arecord_output shows what I get after I run the command.
>>>>
>>>>4) I sent you regdump, hw_params, params and fifo in the previous email=
.
>>>>
>>>
>>>I'm not find any issue based on the '_arecord.txt', just again 7
>>>second time
>>>gap:
>>>
>>>[  228.173271] dwc2 ffb40000.usb: dwc2_hsotg_epint: At the end of the
>>>function, dwc2_hsotg_epint() [  228.173271] [  235.536299] dwc2
>>>ffb40000.usb: dwc2_hsotg_ep_queue, ep1out: req 777cd34b: req
>>>len(200)@req buf(af65750d), # of int=3D0, req zero=3D0, snok(short not
>>>ok)=3D0
>>>
>>>I can recommend you:
>>>1. disable debug prints to minimize platform loading 2. change
>>>Descriptor DMA mode to Buffer DMA
>>>
>>>Thanks,
>>>Minas
>>>
>>>
>>>>Thanks,
>>>>Palak
>>>>
>>>>-----Original Message-----
>>>>From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
>>>>Sent: Monday, February 27, 2023 5:18 AM
>>>>To: Palak SHAH <palak.shah@raritan.com>; Maynard CABIENTE
>>>><maynard.cabiente@raritan.com>
>>>>Cc: linux-usb@vger.kernel.org
>>>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>>>
>>>>Hi Palak,
>>>>
>>>>>On 2/27/2023 6:02 AM, Palak SHAH wrote:
>>>>>From: Palak SHAH <palak.shah@raritan.com>
>>>>>Sent: Monday, February 27, 2023 6:02 AM
>>>>>To: Minas Harutyunyan <hminas@synopsys.com>; Maynard CABIENTE
>>>>><maynard.cabiente@raritan.com>
>>>>>Cc: linux-usb@vger.kernel.org
>>>>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>>>>
>>>>>Hi Minas,
>>>>>Please find attached the logs - regdump, hw_params, params and
>>>>>fifo, taken when the driver is loaded.
>>>>>
>>>>>I will send the USB traces tomorrow.
>>>>
>>>>
>>>>USB trace for arecord (EP1IN ISOC) and debug log.
>>>>
>>>>
>>>>Could you please confirm that after defining UAC1_DEF_REQ_NUM to 32
>>>>playing audio (EP1OUT ISOC) no any issue seen?
>>>>
>>>>Thanks,
>>>>Minas
>>>>
>>>>>
>>>>>Thanks,
>>>>>Palak
>>>>>
>>>>>-----Original Message-----
>>>>>From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
>>>>>Sent: Friday, February 24, 2023 5:33 AM
>>>>>To: Palak SHAH <palak.shah@raritan.com>; Maynard CABIENTE
>>>>><maynard.cabiente@raritan.com>
>>>>>Cc: linux-usb@vger.kernel.org
>>>>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>>>>
>>>>>Hi Polak,
>>>>>
>>>>>>On 2/24/2023 3:04 AM, Palak SHAH wrote:
>>>>>>From: Palak SHAH <palak.shah@raritan.com>
>>>>>>Sent: Friday, February 24, 2023 3:04 AM
>>>>>>To: Minas Harutyunyan <hminas@synopsys.com>; Maynard CABIENTE
>>>>>><maynard.cabiente@raritan.com>
>>>>>>Cc: linux-usb@vger.kernel.org
>>>>>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>>>>>
>>>>>>Hi Minas,
>>>>>>I have attached the log where I connect to the audio gadget (and
>>>>>>therefore, load the driver). We can do it using command line on a
>>>>>>serial prompt or using GUI and connecting to Audio gadget.
>>>>>>
>>>>>>However, in both cases, I don't see any EP1(out) data and the
>>>>>>register
>>>>>dump.
>>>>>>Ep1out comes out only when I play a you tube video and I do
>>>>>>arecord to capture data.
>>>>>
>>>>>According your device configuration EP1(out) using when you play
>>>>>audio, and
>>>>>EP1(in) using when you record audio by arecord.
>>>>>So, after driver loading these both ISOC EP's will not seen in log
>>>>>until aplay/arecord will not run.
>>>>>
>>>>>>
>>>>>>Please let me know if the log doesn't have the information you need.
>>>>>
>>>>>No, it's again dmesg. I asked for core all register dump which
>>>>>available under debugfs's. dwc2 debugfs's under follow directory:
>>>>>/sys/kernel/debug/usb/dwc2.2.auto/
>>>>>In your case 'dwc2.2.auto' can be little bit different. In this
>>>>>directory there are files regdump, hw_params, params, fifo, etc.
>>>>>Just use 'cat regdump'
>>>>>to get register dump. Please also provide me cat of hw_params,
>>>>>params and fifo. These last 3 files need to cat just once after
>>>>>driver
>loading.
>>>>>
>>>>>>
>>>>>>Also, I tried changing UAC1_DEF_REQ_NUM 2 changed to 32. I saw a
>>>>>>change in the behaivor of logs, I got XferCompl all the time, and
>>>>>>not
>>>>ep_disabled.
>>>>>
>>>>>So, after defining UAC1_DEF_REQ_NUM to 32 playing audio (ep1out)
>>>>>work without any issue? And increasing req number to 32 fixed issue
>>>>>which we debug till now?
>>>>>
>>>>>>However, arecord behaivor did not change, meaning I still did not
>>>>>>get the data. It only changed the logging behaivor.
>>>>>
>>>>>If you still see issues with arecord (ep1in) then please provide me
>>>>>debug log for this case and USB trace by Ellisys.
>>>>>
>>>>>Thanks,
>>>>>Minas
>>>>>
>>>>>
>
>
>________________________________
>
>Ce message, ainsi que tous les fichiers joints =E0 ce message, peuvent
>contenir des informations sensibles et/ ou confidentielles ne devant
>pas =EAtre divulgu=E9es. Si vous n'=EAtes pas le destinataire de ce messag=
e
>(ou que vous recevez ce message par erreur), nous vous remercions de le
>notifier imm=E9diatement =E0 son exp=E9diteur, et de d=E9truire ce message=
.
>Toute copie, divulgation, modification, utilisation ou diffusion, non
>autoris=E9e, directe ou indirecte, de tout ou partie de ce message, est st=
rictement interdite.
>
>
>This e-mail, and any document attached hereby, may contain confidential
>and/or privileged information. If you are not the intended recipient
>(or have received this e-mail in error) please notify the sender
>immediately and destroy this e-mail. Any unauthorized, direct or
>indirect, copying, disclosure, distribution or other use of the
>material or parts thereof is strictly forbidden.

________________________________

Ce message, ainsi que tous les fichiers joints =E0 ce message, peuvent cont=
enir des informations sensibles et/ ou confidentielles ne devant pas =EAtre=
 divulgu=E9es. Si vous n'=EAtes pas le destinataire de ce message (ou que v=
ous recevez ce message par erreur), nous vous remercions de le notifier imm=
=E9diatement =E0 son exp=E9diteur, et de d=E9truire ce message. Toute copie=
, divulgation, modification, utilisation ou diffusion, non autoris=E9e, dir=
ecte ou indirecte, de tout ou partie de ce message, est strictement interdi=
te.


This e-mail, and any document attached hereby, may contain confidential and=
/or privileged information. If you are not the intended recipient (or have =
received this e-mail in error) please notify the sender immediately and des=
troy this e-mail. Any unauthorized, direct or indirect, copying, disclosure=
, distribution or other use of the material or parts thereof is strictly fo=
rbidden.
