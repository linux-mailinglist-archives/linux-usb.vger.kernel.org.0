Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62A676D9F7A
	for <lists+linux-usb@lfdr.de>; Thu,  6 Apr 2023 20:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239490AbjDFSGn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Apr 2023 14:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjDFSGm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Apr 2023 14:06:42 -0400
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2129.outbound.protection.outlook.com [40.107.241.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2C6610CB
        for <linux-usb@vger.kernel.org>; Thu,  6 Apr 2023 11:06:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DA3morZtQOdWNI3+EF9Qjz5SecaYKHq9zK4vlsWV0DHWHWDI/h5418v+XcCZz6x4m6XsBrqhzD2v31LtYi/vs4QSi2iqYgP8bUZKld2c155478DXxq3+Eyry2x6f2gYaU68huem2imvnK9V0otprNdQOUtqZ/CRTbhclMb2C09MB9+iL3RnmfO43O+wnqCfdSHv1yWh/9AFoSWGo1x/tQ3w/8ExZQE0DAyLboxoJ8a8Zeu1CkSfNLoHft8hMxL+aa5YEzAXgM8/wB3tUmi5lA58xQePTIKBeEtrEhgL6R4q2HRHkrPy63xmDGF0Bw/95o7U+1QCePM2xzSoqwPgMxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YAxphKtS8+zlKCirL6zX1XQnkKOwy1FZDWibJvfQLJM=;
 b=APe6+uk/17NZVHXe4ZCOPLeDolp9DmOMkN2NqTtqSK/7nxFo5TPdga8+QHhlksIjrpzXTNYSlxiDFfNh29NFKlKd+TKneBB8LDRWYALTAFjI6tg4DeRr2RJXMZ1gNP6b50Il2SeaMcafeyXEuZ0wxPJePuj2/3EAgfOn3ofAkdYTTp0f24nyIww1GMnaaD6NvEMzbx1eLBSjIjTNGQ71i/EF4UPdvj31JsJx8Bu1C8QnlWIL0iHkqBq89t/FvWTv1EFpz18e4u/WYLGoR/ajC412H5TqAilgDjviH+vdTxjRANAqR4ZWkoDzv88DCgAWhj8sjMYsB1m10F6t3l4wcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=raritan.com; dmarc=pass action=none header.from=raritan.com;
 dkim=pass header.d=raritan.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grpleg.onmicrosoft.com; s=selector1-grpleg-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YAxphKtS8+zlKCirL6zX1XQnkKOwy1FZDWibJvfQLJM=;
 b=ErhWjl6sTEADO1x2w4QLGYv4Z7QNsSJr+ySG9UBktPw2Sjh7DRUN2rl/Mn7okFcvZrsLAmM8nt0WCJbQG7VCuQHGgVAq0pHECwR42IJreR0+X9YPVOo+z9P04HtaatshqoslnIJcJcz9/RWgjXGmfsOXlS8oo2FqzZTE5zep9WA=
Received: from PAXPR06MB8531.eurprd06.prod.outlook.com (2603:10a6:102:2b6::14)
 by VI1PR06MB5965.eurprd06.prod.outlook.com (2603:10a6:803:91::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 18:06:33 +0000
Received: from PAXPR06MB8531.eurprd06.prod.outlook.com
 ([fe80::924c:fe2a:59a5:6023]) by PAXPR06MB8531.eurprd06.prod.outlook.com
 ([fe80::924c:fe2a:59a5:6023%5]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 18:06:33 +0000
From:   PALAK SHAH <palak.shah@raritan.com>
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: usb: gadget: dwc2: not getting audio data
Thread-Topic: usb: gadget: dwc2: not getting audio data
Thread-Index: AQHZRohi1FGE81YVE0iozG6O6EPfb67bcCYwgACjvICAARL2gIAAwscAgAQn7VCAAIsPgIAAnGgggAVNCQCABXzZ4IAAyyMAgAKwvbCAANDigIAAZ33wgAEaNoCAKe/LEIAAOjeAgADIYpA=
Date:   Thu, 6 Apr 2023 18:06:33 +0000
Message-ID: <PAXPR06MB85310B5BBC7BD96158510F658D919@PAXPR06MB8531.eurprd06.prod.outlook.com>
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
 <PAXPR06MB8531486338B7D2E4289324878D919@PAXPR06MB8531.eurprd06.prod.outlook.com>
 <BYAPR12MB33995212D56D06ECC0F4B3D2A7919@BYAPR12MB3399.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB33995212D56D06ECC0F4B3D2A7919@BYAPR12MB3399.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=raritan.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR06MB8531:EE_|VI1PR06MB5965:EE_
x-ms-office365-filtering-correlation-id: ebee451c-ab7f-4ec8-08a5-08db36c9a7e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Tyxq20x7DErWkMTSwtCGnU3VNBFhS1FwuBd/w6Ons8WgX2TYXaREgOoLX13nBnsDLDdZK+QeIs2zqX0tMk3H1U+Y51lnyS59OP3XHJHNbTvWrN3pOMC+i+i8qBojp1Ii4ivTt7CNUunoNmivHH9fc7lh56FTQ6p67zjO5aXy4POo3rKEUXbSyS6zf+BUaRmWrcwnzcxbdRq2P/60XfViy+o3GWGFssI3w9Oo+oPhTsCc7DjnBqq93Z5eHkcj4RDyyg+oEEhrXkJLvWe05ZdxiZ8jBeh5x4fqHAtl0qasmwNEzH1DAD0fRDZQFvF3j1TSxWtMzIFoat+t6aGlUhx/JXKJ4OPdRMfbq6vnK2kM2zPQH+cX1xfhrhjsEO7hxKSAe4Y7RXXO659osyV7JClK/3qnbIbOGoCzqvbvE+oNmv2q7hODCqaFJBHm75uLuB0mHm17YO9bXBaW1pfBzr4L06tK9Lvpi8hWc1RYBdJEuFe/IHN67m8ln/gPYOpmIWD0vcsrDJ1XxDfaSO4v1nYlb3lfQCSy4YQ+vVsKucv9Z5EJaa+fTHi/cXZoSdo0gbfqB3f+stN1Ti+osPBkySZVVYXKx5L+ynBh3yZOXQwgdNoK+uRny3HYcfWUDFdvqX8nTXeDKMNFOn3DTo+sZYDO7JW23tX1vUw9puxV6+LI6pkzc7PNNA5LvCAqpWNvkHo/
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB8531.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(136003)(366004)(39860400002)(451199021)(33656002)(38100700002)(2906002)(30864003)(4326008)(5660300002)(38070700005)(52536014)(8936002)(55016003)(66476007)(66446008)(122000001)(6916009)(64756008)(66556008)(86362001)(76116006)(41300700001)(8676002)(66946007)(83380400001)(66574015)(186003)(6506007)(26005)(9686003)(53546011)(71200400001)(45080400002)(316002)(7696005)(19627235002)(478600001)(579004)(414714003)(473944003)(44824005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?QhSubcabG2MQkG9z/Q2W7FUDi7+rwvyab8r6KlxmzCCGiZF3jiINjoVduQ?=
 =?iso-8859-1?Q?9MVAePwE8Kibrrdh+1kqT74MsPXALDvyhZitbHUTK1bDFydCcemS8z51Z5?=
 =?iso-8859-1?Q?kd1WRj4gPoWFuHPWvnBZ8rky/Wyq8EIxsh4CuPEwsuaNO7xrqDwbuqf0vb?=
 =?iso-8859-1?Q?GFae1549o3CvySnbzBBS4mQi67TJ0qvgI+s9ZNoDlBtteFiPMmX38t+KIP?=
 =?iso-8859-1?Q?gpqof+ukpKsvvf7vs+fZyq/EVuD9wHx3GcYf7u41IO89MUeJpi/PWtpb5Y?=
 =?iso-8859-1?Q?ERKNFSIVL3K3FBLnX3a1m9xZHMksmx6m0lc5d0Ezbl7At0vyTgi2ybPGnT?=
 =?iso-8859-1?Q?tQ4C8wvG5+EecUdlR+ZybOKWweBIC02g1Ocky0NOSUqInkgLmmPKxXVylH?=
 =?iso-8859-1?Q?EnjvKQ9xnpCyAICyhH5VEmn5v3MCvBRzc78/UqhsJYv0SWQRb2qBQQkhgz?=
 =?iso-8859-1?Q?rMRngAA1sj1DFszwEBtoEBqBKf5EMAGPYzyknG6yLQlVvt5DlUv7rWhTgS?=
 =?iso-8859-1?Q?zAhFKMj4tWc31wHZKOirfjqQoNXgGVvL4Pq3ry0e3EAKIrbZP4NiqMEXQw?=
 =?iso-8859-1?Q?N9ji4XujWMaYIl0deVFVrXT/WNgKgslNxzAYqrCCnB/FaFOGKFgec6lKlM?=
 =?iso-8859-1?Q?anRAJYQfgVicNwjT6+ssrqSS+LdDIVfyeJZEHLDrLuERlVl34ZCOaYyaYt?=
 =?iso-8859-1?Q?CtSolE2xmwjsGzcJStWny/Kovbgu5znafwONI1udjJ98fYNScDEW7/f2r4?=
 =?iso-8859-1?Q?DUTrk3CuAhdefQ2kzvBU4/RMdMegTbfAVOZvzJvGhY2L1CFMqRGKhtVL6i?=
 =?iso-8859-1?Q?vkLXxxAbhPRTkozDoKoyZYSI4KM0+zPkNZoi6oHAVa+qCAZjdHr5IeRIAV?=
 =?iso-8859-1?Q?4VwmTjUr2f1lwY1U5X0ZHrAPnTfvJaWCujv2/Ji8BN0P9rzt4JHlXBxjuD?=
 =?iso-8859-1?Q?hQSYkL1co2OGdbmM5q8/AV6sp78lzUjU1GFDXn+qPW69/LoMa3aW9AvsLo?=
 =?iso-8859-1?Q?BznJdGN3pGHxRQwbLUAnuzGVrc0+GIQYnSU1Eo4J5ASgKsfRg0bhiVZ3eq?=
 =?iso-8859-1?Q?VWW4QBTmcUJUa7K7URiMv0TmYS7CCkAvSiaH9rgS2o14vkEkN16Wrj7LFJ?=
 =?iso-8859-1?Q?Oee660uHEw5ZO54O4kTgUR/unTUfHSOdNAZCxCHwH6erAjaQtshHGa5hsx?=
 =?iso-8859-1?Q?Xs32pMDTTGzUyIb7cGjYlvG1xwtLpI3/6zA06TAkddmaWL8tSFYxEZ2Szh?=
 =?iso-8859-1?Q?yd8UjDcxHWjCMiHHxKyNcvYKPNij3nt9A88f8fmrphfm+N+ZBXgSJCEKs8?=
 =?iso-8859-1?Q?iLcM9wssymUqEsRw/H8951VqDABLKRV8mzx4PrhyttivfyHb4ge/bM+B5N?=
 =?iso-8859-1?Q?i3bsEcybsv51XoklBqH+nzPOj5ap2ei6rCP4x3GPTtOwUZNTaQJqCInjbl?=
 =?iso-8859-1?Q?dhNCG2/jJ9qWp9SCglVB7l3sU70t53D5pWl3PouZSvboYS7DVea0GuquSV?=
 =?iso-8859-1?Q?sc4JDF9DHIK0isZbhju5Ht0Sk/PPQjDFlUTPgJjq6xWcBVL1xRpntBSCb2?=
 =?iso-8859-1?Q?WJo67kt9iS6SwuH0ZgQW78SPubHUH3kTm6cEuQyCNVXsV18jKDTtlJ5579?=
 =?iso-8859-1?Q?HXKG5dlteJHcf0ymNHarqDJ4UNVwfBNaZu?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: raritan.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8531.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebee451c-ab7f-4ec8-08a5-08db36c9a7e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2023 18:06:33.5984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 199686b5-bef4-4960-8786-7a6b1888fee3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TurKcDmjMnu4BGC4RazwY99EgAheiix/g1MqfLdcPTtnzsSxmeF/xEKAAfnfk2z81LZWeqmRKLlB/vQ9cqPpJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB5965
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Minas,
Thank you for the patch. I was able to run the test 15 and 16.
[palakshah@localhost usb]$ sudo ./testusb -D /dev/bus/usb/003/002 -t15
unknown speed   /dev/bus/usb/003/002    0
/dev/bus/usb/003/002 test 15,   32.000889 secs

[palakshah@localhost usb]$ sudo ./testusb -D /dev/bus/usb/003/002 -t16
unknown speed   /dev/bus/usb/003/002    0
/dev/bus/usb/003/002 test 16,   32.000911 secs

Thanks,
Palak

-----Original Message-----
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Sent: Thursday, April 6, 2023 12:57 AM
To: PALAK SHAH <palak.shah@raritan.com>
Cc: linux-usb@vger.kernel.org
Subject: RE: usb: gadget: dwc2: not getting audio data

Hi Palak,

>On 4/6/2023 5:43 AM, Palak SHAH wrote:
>From: PALAK SHAH <palak.shah@raritan.com>
>Sent: Thursday, April 6, 2023 5:43 AM
>To: Minas Harutyunyan <hminas@synopsys.com>
>Cc: linux-usb@vger.kernel.org
>Subject: RE: usb: gadget: dwc2: not getting audio data
>
>Hi Minas,
>Last week I was able to install g_zero driver on the device side. And I
>installed usbtest.ko as a static driver on the linux host kernel
>running kernel version 5.0.9.
>
>On the host I see -
>[palakshah@localhost usb]$ lsusb
>Bus 002 Device 002: ID 8087:8000 Intel Corp.
>Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub Bus 001
>Device 002: ID 8087:8008 Intel Corp.
>Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub Bus 004
>Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub Bus 003 Device 006:
>ID 0525:a4a0 Netchip Technology, Inc. Linux-USB "Gadget Zero" // g_zero
>driver Bus 003 Device 002: ID 04b4:0101 Cypress Semiconductor Corp.
>Keyboard/Hub Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root
>hub
>
>I ran the test
>[palakshah@localhost usb]$ sudo ./testusb -a
>unknown speed   /dev/bus/usb/003/006    0
>/dev/bus/usb/003/006 test 0,    0.000013 secs
>/dev/bus/usb/003/006 test 1,    0.216270 secs
>/dev/bus/usb/003/006 test 2,    0.096186 secs
>/dev/bus/usb/003/006 test 3,    0.216282 secs
>/dev/bus/usb/003/006 test 4,    0.096046 secs
>/dev/bus/usb/003/006 test 5,    2.870960 secs
>/dev/bus/usb/003/006 test 6,    3.055972 secs
>/dev/bus/usb/003/006 test 7,    2.872110 secs
>/dev/bus/usb/003/006 test 8,    3.059713 secs
>/dev/bus/usb/003/006 test 9,    8.601377 secs
>/dev/bus/usb/003/006 test 10,   26.794975 secs
>/dev/bus/usb/003/006 test 11,    4.006801 secs
>/dev/bus/usb/003/006 test 12,    4.002395 secs
>/dev/bus/usb/003/006 test 13,    4.874480 secs
>/dev/bus/usb/003/006 test 14 --> 22 (Invalid argument)
>/dev/bus/usb/003/006 test 17,    0.185385 secs
>/dev/bus/usb/003/006 test 18,    0.098154 secs
>/dev/bus/usb/003/006 test 19,    0.197473 secs
>/dev/bus/usb/003/006 test 20,    0.098188 secs
>/dev/bus/usb/003/006 test 21 --> 22 (Invalid argument)
>
>Atleast now I can run some of the tests, however I am interested in the
>ISOC transfer, which is tested using t15 and t16. But test 15 and 16 did n=
ot run.
>
>I put more messages in the code and I found that, it exits both the tests =
-
>                if (dev->out_iso_pipe =3D=3D 0 || param->sglen =3D=3D 0){
>                    pr_info("TEST 15: dev->out_iso_pipe =3D=3D 0 ||
>param->sglen =3D=3D 0 Error condition!!\n");
>                    break;
>                }
>
>I put more messages in the code, and I realize that dev->out_iso_pipe is n=
ull.
>
>                if (dev->in_pipe){
>                        printk("dev->in_pipe is true\n"); this gets printe=
d
>                        rtest =3D " bulk-in";
>                }
>                if (dev->out_pipe){
>                        printk("dev->out_pipe is true\n"); this gets print=
ed
>                        wtest =3D " bulk-out";
>                }
>                if (dev->in_iso_pipe){
>                    printk("dev->in_iso_pipe is true\n"); // this doesn't =
get printed.
>                    irtest =3D " iso-in";
>                }
>                if (dev->out_iso_pipe){
>                        printk("dev->out_iso_pipe is true\n"); // not prin=
ted
>                        iwtest =3D " iso-out";
>                }
>
>Some dmesg messages that I printed, it prints in_pipe and out_pipe is
>true for BULK transfer, but ISOC transfer is not set.
>
>[    2.051466] usb 3-8: New USB device found, idVendor=3D0525,
>idProduct=3Da4a0, bcdDevice=3D 5.04
>[    2.051468] usb 3-8: New USB device strings: Mfr=3D1, Product=3D2,
>SerialNumber=3D3
>[    2.051469] usb 3-8: Product: Gadget Zero
>[    2.051470] usb 3-8: Manufacturer: Linux 5.4.80-kx4 with ffb40000.usb
>[    2.051471] usb 3-8: SerialNumber: 0123456789.0123456789.0123456789
>[    2.053199] USBTEST.ko usbtest_probe!!!
>[    2.053200] dev->in_pipe is true
>[    2.053200] dev->out_pipe is true
>[    2.053201] USBTEST : Linux gadget zero
>[    2.053202] USBTEST high-speed {control in/out bulk-in bulk-out} tests =
(+alt)
>[    2.166449] usb 3-10: new low-speed USB device number 3 using xhci_hcd
>
>Any idea how I can test ISOC test?

To run isoc tests test 15/16 apply follow patch:

diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c index =
ac0d75ac2d2f..7736b0a98cab 100644
--- a/drivers/usb/misc/usbtest.c
+++ b/drivers/usb/misc/usbtest.c
@@ -187,9 +187,11 @@ get_endpoints(struct usbtest_dev *dev, struct usb_inte=
rface *intf)
                                continue;
                        }
                }
-               if ((in && out)  ||  iso_in || iso_out || int_in || int_out=
)
-                       goto found;
        }
+
+       if ((in && out)  ||  iso_in || iso_out || int_in || int_out)
+               goto found;
+
        return -EINVAL;

 found:

Thanks,
Minas

>
>Thanks,
>Palak
>
>-----Original Message-----
>From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
>Sent: Friday, March 10, 2023 4:04 AM
>To: Palak SHAH <palak.shah@raritan.com>; Maynard CABIENTE
><maynard.cabiente@raritan.com>
>Cc: linux-usb@vger.kernel.org
>Subject: RE: usb: gadget: dwc2: not getting audio data
>
>Hi Palak,
>
>>On 3/9/2023 8:21 PM, Palak SHAH wrote:
>>From: Palak SHAH <palak.shah@raritan.com>
>>Sent: Thursday, March 9, 2023 8:21 PM
>>To: Minas Harutyunyan <hminas@synopsys.com>; Maynard CABIENTE
>><maynard.cabiente@raritan.com>
>>Cc: linux-usb@vger.kernel.org
>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>
>>Hi Minas,
>>Yes I do have g_audio module loaded.
>>
>>This dmesg logs are from my device -
>>[ 1151.517385] g_audio gadget: Linux USB Audio Gadget, version: Feb 2,
>>2012 [ 1151.517401] g_audio gadget: g_audio ready [ 1151.517418] dwc2
>>ffb00000.usb: bound driver g_audio [ 1151.640143] dwc2 ffb40000.usb:
>>bound driver configfs-gadget [ 1151.808188] dwc2 ffb40000.usb: new
>>device is high- speed [ 1151.922374] dwc2 ffb40000.usb: new device is
>>high-speed [ 1151.982406] dwc2 ffb40000.usb: new address 24 [
>>1151.996762] configfs- gadget gadget: high-speed config #1: c
>>
>># lsmod
>>Module                  Size  Used by
>>usb_f_uac1             20480  3
>>u_audio                20480  1 usb_f_uac1
>>snd_pcm                94208  1 u_audio
>>snd_timer              36864  1 snd_pcm
>>g_audio                16384  0
>>usb_f_hid              20480  9
>>libcomposite           61440 16 usb_f_uac1,u_audio,g_audio,usb_f_hid
>>
>>This is my host -
>>[palakshah@fedora ~]$ lsusb
>>Bus 002 Device 002: ID 0bda:0328 Realtek Semiconductor Corp.
>>USB3.0-CRW Bus
>>002 Device 003: ID 0bda:0411 Realtek Semiconductor Corp. Hub Bus 002
>>Device
>>001: ID 1d6b:0003 Linux Foundation 3.0 root hub Bus 001 Device 023: ID
>>14dd:1010 Raritan Computer, Inc. KX4-101 // this is my device that I
>>am connected to.
>>Bus 001 Device 002: ID 14dd:1007 Raritan Computer, Inc. D2CIM-VUSB KVM
>>connector Bus 001 Device 005: ID 8087:0a2b Intel Corp. Bluetooth
>>wireless interface Bus 001 Device 004: ID 0bda:5411 Realtek
>>Semiconductor
>Corp.
>>RTS5411 Hub Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root
>>hub
>>
>>[palakshah@fedora ~]$ sudo ./testusb -D /dev/bus/usb/001/023 -t15
>>[sudo] password for palakshah:
>>./testusb: /dev/bus/usb/001/023 may see only control tests
>>/dev/bus/usb/001/023 test 15 --> 25 (Inappropriate ioctl for device)
>>
>>[palakshah@fedora ~]$ sudo ./testusb -D /dev/bus/usb/001/023 -t16
>>./testusb: /dev/bus/usb/001/023 may see only control tests
>>/dev/bus/usb/001/023 test 16 --> 25 (Inappropriate ioctl for device)
>>
>>But still host cannot talk to the device.
>>
>
>On host side should be loaded module usbtest.ko On device side remove
>your
>function(gadget) driver, instead load g_zero (not g_audio) function.
>
>Thanks,
>Minas
>
>
>>Thanks,
>>Palak
>>
>>-----Original Message-----
>>From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
>>Sent: Thursday, March 9, 2023 5:03 AM
>>To: Palak SHAH <palak.shah@raritan.com>; Maynard CABIENTE
>><maynard.cabiente@raritan.com>
>>Cc: linux-usb@vger.kernel.org
>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>
>>Hi Palak,
>>
>>>On 3/9/2023 1:42 AM, Palak SHAH wrote:
>>>From: Palak SHAH <palak.shah@raritan.com>
>>>Sent: Thursday, March 9, 2023 1:42 AM
>>>To: Minas Harutyunyan <hminas@synopsys.com>; Maynard CABIENTE
>>><maynard.cabiente@raritan.com>
>>>Cc: linux-usb@vger.kernel.org
>>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>>
>>>Hi Minas,
>>>A while ago, I asked you if I can run a usb test, to test IP core,
>>>without doing audio test.
>>>
>>>You had suggested that to test usbtest program (see
>>>https://urldefense.com/v3/__https://eur01.safelinks.protection.outlook.
>>>com/?url=3Dhttps*3A*2F*2Furldefense.com*2Fv3*2F__https*3A*2F*2Feur01
>.saf
>>>e
>>>links.protection.outlook.com*2F&data=3D05*7C01*7Cpalak.shah*40raritan.c
>o
>>>m
>>>*7Ce899edf3108b4733963408db2085841d*7C199686b5bef4496087867a6b
>1888fee3
>>>*
>>>7C1*7C0*7C638139530054005175*7CUnknown*7CTWFpbGZsb3d8eyJWIjoi
>MC4wLjAwM
>>>D
>>>AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0*3D*7C3000*7C*7C*7C&
>sdata
>>>=3D
>>>efRKGkGDjq5OhK347*2B6r2*2FaXjZy4wysBzzl5XezhEZo*3D&reserved=3D0*__
>;JSUlJ
>>>S
>>>UlJSUlJSUlJSUlJSUlJSUlJSUlJSUlPw!!A4F2R9G_pg!fXoTRt1krMtYNUcU033cc_C
>Yw
>>>9 YrC_nUj99EXR4vAwT-
>hb3T78zqvyakXvx4elweFNfmoHxwarh2RDYX7L7rJqCcWz9z$
>>>url=3Dhttp*3A*2F*2Fwww.linux-
>>>usb.org*2Fusbtest*2F&data=3D05*7C01*7Cpalak.shah*40raritan.com*7Ccdc9
>cf1
>>>8
>>>d5c54
>>>b2c74fc08daf53d681e*7C199686b5bef4496087867a6b1888fee3*7C1*7C0*7
>C63809
>>>1
>>>94134
>>>5558693*7CUnknown*7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV
>2luMzIiLC
>>>J
>>>BTiI6
>>>Ik1haWwiLCJXVCI6Mn0*3D*7C3000*7C*7C*7C&sdata=3DOIiLXl6dlCHlfACx6Zx
>pLhQkp
>>>0
>>>7xIwb
>>>qAR3CtnqfsFU*3D&reserved=3D0__;JSUlJSUlJSUlJSUlJSUlJSUlJSUl!!A4F2R9G_pg
>!
>>>f
>>>3GN6S
>>>P6NM--pKekkA-jG4RICPguFvb3DNeRO6jFDEhovrY3IEC2-
>>>aL0ay4g95j7BsdRM6JRGwjL6kPzTS8z13tShKOe$ )
>>>
>>>So I tried this program. I compiled it on my linux host, and run it
>>>on the host, which is connected to the Linux device acting as USB gadget=
.
>>>
>>>I am running test t15 and t16 which is for ISOC. Infact I tried
>>>running
>>all.
>>>I ran it on the host device. And I get this error -
>>>
>>>[palakshah@fedora ~]$ sudo ./testusb -D /dev/bus/usb/001/019 -t15
>>>./testusb: /dev/bus/usb/001/019 may see only control tests
>>>/dev/bus/usb/001/019 test 15 --> 25 (Inappropriate ioctl for device)
>>>
>>>Either I get error 25 (Inappropriate ioctl for device) or error 38
>>>(Function Not Implemented).
>>>
>>>If I do, [palakshah@fedora ~]$ sudo ./testusb -a no test devices
>>>recognized
>>>
>>>I tried to google, why these tests don't work, but did not find
>>>anything useful. Do you have any idea?
>>>
>>
>>Did you modprobe g_zero module on device side?
>>lsusb command should show that connected device:
>>...
>>Bus 001 Device 002: ID 0525:a4a0 Netchip Technology, Inc. Linux-USB
>>"Gadget Zero"
>>...
>>
>>Thanks,
>>Minas
>>
>>>Thanks,
>>>Palak
>>>
>>>-----Original Message-----
>>>From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
>>>Sent: Monday, March 6, 2023 11:31 PM
>>>To: Palak SHAH <palak.shah@raritan.com>; Maynard CABIENTE
>>><maynard.cabiente@raritan.com>
>>>Cc: linux-usb@vger.kernel.org
>>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>>
>>>Hi Palak,
>>>
>>>>On 3/6/2023 8:26 AM, Palak SHAH wrote:
>>>>From: Palak SHAH <palak.shah@raritan.com>
>>>>Sent: Monday, March 6, 2023 8:26 PM
>>>>To: Minas Harutyunyan <hminas@synopsys.com>; Maynard CABIENTE
>>>><maynard.cabiente@raritan.com>
>>>>Cc: linux-usb@vger.kernel.org
>>>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>>>
>>>>Hi Minas,
>>>>
>>>>>I can recommend you:
>>>>>1. disable debug prints to minimize platform loading
>>>>
>>>>[Palak] I am working on this
>>>>
>>>>>2. change Descriptor DMA mode to Buffer DMA
>>>>
>>>>[Palak] Can you please explain this more, what does this mean?
>>>
>>>Core can work in 3 different modes to transferring data between FIFO
>>>and
>>>RAM: Slave, Buffer DMA and Descriptor DMA.
>>>
>>>To switch from DDMA to BDMA in file params.c file in function
>>>dwc2_set_default_params()
>>>        ...
>>>        if ((hsotg->dr_mode =3D=3D USB_DR_MODE_PERIPHERAL) ||
>>>            (hsotg->dr_mode =3D=3D USB_DR_MODE_OTG)) {
>>>                p->g_dma =3D dma_capable;
>>>                p->g_dma_desc =3D hw->dma_desc_enable;
>>>        ...
>>>Update last line to
>>>                p->g_dma_desc =3D 0;
>>>
>>>Thanks,
>>>Minas
>>>
>>>>
>>>>Thanks,
>>>>Palak
>>>>
>>>>-----Original Message-----
>>>>From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
>>>>Sent: Thursday, March 2, 2023 11:35 PM
>>>>To: Palak SHAH <palak.shah@raritan.com>; Maynard CABIENTE
>>>><maynard.cabiente@raritan.com>
>>>>Cc: linux-usb@vger.kernel.org
>>>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>>>
>>>>Hi Palak,
>>>>
>>>>>On 2/28/2023 12:21 AM, Palak SHAH wrote:
>>>>>From: Palak SHAH <palak.shah@raritan.com>
>>>>>Sent: Tuesday, February 28, 2023 12:21 AM
>>>>>To: Minas Harutyunyan <hminas@synopsys.com>; Maynard CABIENTE
>>>>><maynard.cabiente@raritan.com>
>>>>>Cc: linux-usb@vger.kernel.org
>>>>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>>>>
>>>>>Hi Minas,
>>>>>I have attached the following USB traces and debug log.
>>>>>1) dmesg and usb sniffer logs during driver loading.
>>>>>
>>>>>2) EP1(OUT) - I play AUDIO on the HOST. And I do arecord on the
>>>>>linux device that acts as USB gadget. So the audio is going OUT
>>>>>from the host. So you will see EP1 OUT.
>>>>>I have attached logs and USB sniffer data, during arecord.
>>>>>
>>>>>I am not testing ISOC EP1(IN) yet. I am still seeing and debugging
>>>>>issues with Ep1(out).
>>>>>
>>>>>3) When I change UAC1_DEF_REQ_NUM 2 changed to 32, the problem
>STILL
>>>>>exist with EP1(OUT). ONLY log behaivor is different. In the log I
>>>>>see XferCompl, but I don't get any data in the arecord.
>>>>>I have attached 2 files. Arecord_command.txt shows what I run.
>>>>>Arecord_output shows what I get after I run the command.
>>>>>
>>>>>4) I sent you regdump, hw_params, params and fifo in the previous
>email.
>>>>>
>>>>
>>>>I'm not find any issue based on the '_arecord.txt', just again 7
>>>>second time
>>>>gap:
>>>>
>>>>[  228.173271] dwc2 ffb40000.usb: dwc2_hsotg_epint: At the end of
>>>>the function, dwc2_hsotg_epint() [  228.173271] [  235.536299] dwc2
>>>>ffb40000.usb: dwc2_hsotg_ep_queue, ep1out: req 777cd34b: req
>>>>len(200)@req buf(af65750d), # of int=3D0, req zero=3D0, snok(short not
>>>>ok)=3D0
>>>>
>>>>I can recommend you:
>>>>1. disable debug prints to minimize platform loading 2. change
>>>>Descriptor DMA mode to Buffer DMA
>>>>
>>>>Thanks,
>>>>Minas
>>>>
>>>>
>>>>>Thanks,
>>>>>Palak
>>>>>
>>>>>-----Original Message-----
>>>>>From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
>>>>>Sent: Monday, February 27, 2023 5:18 AM
>>>>>To: Palak SHAH <palak.shah@raritan.com>; Maynard CABIENTE
>>>>><maynard.cabiente@raritan.com>
>>>>>Cc: linux-usb@vger.kernel.org
>>>>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>>>>
>>>>>Hi Palak,
>>>>>
>>>>>>On 2/27/2023 6:02 AM, Palak SHAH wrote:
>>>>>>From: Palak SHAH <palak.shah@raritan.com>
>>>>>>Sent: Monday, February 27, 2023 6:02 AM
>>>>>>To: Minas Harutyunyan <hminas@synopsys.com>; Maynard CABIENTE
>>>>>><maynard.cabiente@raritan.com>
>>>>>>Cc: linux-usb@vger.kernel.org
>>>>>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>>>>>
>>>>>>Hi Minas,
>>>>>>Please find attached the logs - regdump, hw_params, params and
>>>>>>fifo, taken when the driver is loaded.
>>>>>>
>>>>>>I will send the USB traces tomorrow.
>>>>>
>>>>>
>>>>>USB trace for arecord (EP1IN ISOC) and debug log.
>>>>>
>>>>>
>>>>>Could you please confirm that after defining UAC1_DEF_REQ_NUM to 32
>>>>>playing audio (EP1OUT ISOC) no any issue seen?
>>>>>
>>>>>Thanks,
>>>>>Minas
>>>>>
>>>>>>
>>>>>>Thanks,
>>>>>>Palak
>>>>>>
>>>>>>-----Original Message-----
>>>>>>From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
>>>>>>Sent: Friday, February 24, 2023 5:33 AM
>>>>>>To: Palak SHAH <palak.shah@raritan.com>; Maynard CABIENTE
>>>>>><maynard.cabiente@raritan.com>
>>>>>>Cc: linux-usb@vger.kernel.org
>>>>>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>>>>>
>>>>>>Hi Polak,
>>>>>>
>>>>>>>On 2/24/2023 3:04 AM, Palak SHAH wrote:
>>>>>>>From: Palak SHAH <palak.shah@raritan.com>
>>>>>>>Sent: Friday, February 24, 2023 3:04 AM
>>>>>>>To: Minas Harutyunyan <hminas@synopsys.com>; Maynard CABIENTE
>>>>>>><maynard.cabiente@raritan.com>
>>>>>>>Cc: linux-usb@vger.kernel.org
>>>>>>>Subject: RE: usb: gadget: dwc2: not getting audio data
>>>>>>>
>>>>>>>Hi Minas,
>>>>>>>I have attached the log where I connect to the audio gadget (and
>>>>>>>therefore, load the driver). We can do it using command line on a
>>>>>>>serial prompt or using GUI and connecting to Audio gadget.
>>>>>>>
>>>>>>>However, in both cases, I don't see any EP1(out) data and the
>>>>>>>register
>>>>>>dump.
>>>>>>>Ep1out comes out only when I play a you tube video and I do
>>>>>>>arecord to capture data.
>>>>>>
>>>>>>According your device configuration EP1(out) using when you play
>>>>>>audio, and
>>>>>>EP1(in) using when you record audio by arecord.
>>>>>>So, after driver loading these both ISOC EP's will not seen in log
>>>>>>until aplay/arecord will not run.
>>>>>>
>>>>>>>
>>>>>>>Please let me know if the log doesn't have the information you need.
>>>>>>
>>>>>>No, it's again dmesg. I asked for core all register dump which
>>>>>>available under debugfs's. dwc2 debugfs's under follow directory:
>>>>>>/sys/kernel/debug/usb/dwc2.2.auto/
>>>>>>In your case 'dwc2.2.auto' can be little bit different. In this
>>>>>>directory there are files regdump, hw_params, params, fifo, etc.
>>>>>>Just use 'cat regdump'
>>>>>>to get register dump. Please also provide me cat of hw_params,
>>>>>>params and fifo. These last 3 files need to cat just once after
>>>>>>driver
>>loading.
>>>>>>
>>>>>>>
>>>>>>>Also, I tried changing UAC1_DEF_REQ_NUM 2 changed to 32. I saw a
>>>>>>>change in the behaivor of logs, I got XferCompl all the time, and
>>>>>>>not
>>>>>ep_disabled.
>>>>>>
>>>>>>So, after defining UAC1_DEF_REQ_NUM to 32 playing audio (ep1out)
>>>>>>work without any issue? And increasing req number to 32 fixed
>>>>>>issue which we debug till now?
>>>>>>
>>>>>>>However, arecord behaivor did not change, meaning I still did not
>>>>>>>get the data. It only changed the logging behaivor.
>>>>>>
>>>>>>If you still see issues with arecord (ep1in) then please provide
>>>>>>me debug log for this case and USB trace by Ellisys.
>>>>>>
>>>>>>Thanks,
>>>>>>Minas
>>>>>>
>>>>>>
>>
>>
>>________________________________
>>
>>Ce message, ainsi que tous les fichiers joints =E0 ce message, peuvent
>>contenir des informations sensibles et/ ou confidentielles ne devant
>>pas =EAtre divulgu=E9es. Si vous n'=EAtes pas le destinataire de ce messa=
ge
>>(ou que vous recevez ce message par erreur), nous vous remercions de
>>le notifier imm=E9diatement =E0 son exp=E9diteur, et de d=E9truire ce mes=
sage.
>>Toute copie, divulgation, modification, utilisation ou diffusion, non
>>autoris=E9e, directe ou indirecte, de tout ou partie de ce message, est
>strictement interdite.
>>
>>
>>This e-mail, and any document attached hereby, may contain
>>confidential and/or privileged information. If you are not the
>>intended recipient (or have received this e-mail in error) please
>>notify the sender immediately and destroy this e-mail. Any
>>unauthorized, direct or indirect, copying, disclosure, distribution or
>>other use of the material or parts thereof is strictly forbidden.
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
>indirect, copying, disclosure, distribution or other use of the material o=
r parts thereof is strictly forbidden.

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
