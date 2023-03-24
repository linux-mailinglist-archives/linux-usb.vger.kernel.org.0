Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F23FC6C877D
	for <lists+linux-usb@lfdr.de>; Fri, 24 Mar 2023 22:30:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231856AbjCXVaS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Mar 2023 17:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231841AbjCXVaQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Mar 2023 17:30:16 -0400
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2123.outbound.protection.outlook.com [40.107.247.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CCFC19C52
        for <linux-usb@vger.kernel.org>; Fri, 24 Mar 2023 14:30:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DtIUbwBMb5Pxn2UkUQtbxcLrcA5tG1KfTImTi99omM+0b9FYVBUix+/ICJnpzndt8vHdgll+yrU+le09MA9hqfmvVll8wgGFO//V6PpQSYcaB7zhSuw3IiMwSONt1zLKsQiWwmgd40O8hAdHz/LbDH3DAMQCyR39ktjrdjIFeoj7kf9XIWe+msqiKDFd/019a0/EVOq1dmMbd5g/kt346unqPItmwFR16whETGxfUBYOM30bwur4fCr0VdrFLIBYi2qmJ/dtnUG9OMpvjmANuZzAJARixVYs3Uoqkq0OSn8TMN1MbMPiQNphGqrKYMORuiS7kgXQMh75cFd5Ji+ppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xV3QjRS2qH6qEoro8Ju43We8uXubJHz6BBnmeJ2X9ok=;
 b=LC0PSKQJrzcdk0B0Sj8nsuGnSg9GrQpqoVQ28fACvHoifqo+uD8p8pPdjHdo+Bn5/fYKbwErZmsZlJMuJ8yNDaCwMmoaZSbH4B8cAQycc36G/boTDk/uqByBTndUnup8ctOgC93emEJjdyVmwY2TYxyWE3uhCaGV1GA7PsaiJwQfMWftZVSTccDdLKC0zOfStEQsIs05QEzlJyLefRHQE9YsO5AO3yH5y7zAFA7kU2CwGJ5oLfcx7k3WdtNQgcYlS1QXmKFi3/h2LhIYfz6ogEvh4YoY7W9pWFqZcQtpkf6TgaRVDcbu5WJzoszqj0rRehP9EyQWgR3zZtQQ60+7Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kramerav.com; dmarc=pass action=none header.from=kramerav.com;
 dkim=pass header.d=kramerav.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kramerav.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xV3QjRS2qH6qEoro8Ju43We8uXubJHz6BBnmeJ2X9ok=;
 b=Yzbrn6/bSKFwoX3Kk4pSxaYyFBCG7urVx2EDxHFWvXHI+g4QnM+CoOL6GLh0ISWqv5/HQfSKabSb51JO8VEkzAEcD3kScdS1e93ZQzhtLQqtU8SEk4Ji18Juw/k9rL2d8o5yYYCwZMlgl8TiCmKvckQfoZQx9hefdBWNKYe2NmE=
Received: from PA4PR05MB9282.eurprd05.prod.outlook.com (2603:10a6:102:2ad::22)
 by DB8PR05MB6665.eurprd05.prod.outlook.com (2603:10a6:10:142::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 21:30:12 +0000
Received: from PA4PR05MB9282.eurprd05.prod.outlook.com
 ([fe80::4b50:48ee:75ac:6d3e]) by PA4PR05MB9282.eurprd05.prod.outlook.com
 ([fe80::4b50:48ee:75ac:6d3e%8]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 21:30:12 +0000
From:   Lidor Elkais <lelkais@kramerav.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: UVC-GADGET ISSUE
Thread-Topic: UVC-GADGET ISSUE
Thread-Index: Adlel2kbFg87L5PDTyOuCcCPrul24A==
Date:   Fri, 24 Mar 2023 21:30:11 +0000
Message-ID: <PA4PR05MB9282681AE7CF4F8ADD039FEFD5849@PA4PR05MB9282.eurprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kramerav.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR05MB9282:EE_|DB8PR05MB6665:EE_
x-ms-office365-filtering-correlation-id: 8b98ce41-654f-4d54-ccef-08db2caef331
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +8macaa6G24b87qpYIP9qCvuN7Rv5IY3WWDsmcCGZ9E4iZxt08AYeJuED/EhlgoQFJLFpxlzxyPONb5DtwH9n9NFk+FVLhQHT5882PAEZCAczv2EQgr+cUULl0sqAT7Mm8IQ14Oz6iQQh4M67PH52CpwSHliIn3BPolV23LZKeCP1VcSZHg805+MjemEJTZNmWQmlMV3B44W8q5Sph4HSeOAXbSThRyyk3/D8VnkbVo94UF1qtDZia/nuPQt285a5l0fz57zoxeS4r4CT7ZAxgAqR35jxxln2oMPMRcYYtHkEkytkYjzilB8kFW0Fg4U4MYfPamTp/KPR7k7Iq6Fn3oMwySCGOGJpJnIcXGUFP814MNnTcB5QSv+QSg+YeIGWSt3niOjSZ+5qEXxJK1ptMuw/HWi6ucOuKKgWgceap5pa8HC1SzlrgU4kNFLbwGPISawhqcq6n/MlB5JQsC8XZvF3z5TmAysGn3Se6OZ+TXtCVJfVhj4uVZYNb57ZtjntIXT8/cRZGaTgaCc8L/vGawNxuTDFiYfjL5zXvKzEE5ABJiW32474r7ysFYtw7gCRukmt44AQDbr1/U8RcbczeURwy8diZ8LD6ge6DEVgwOdFEV6nUw0IqYf5F6frWC+2J9sNnvWx6vjlgRx8w0iEW7jYP19SjajS+vxst+gPEgghq86E4r1awkLPSOoEu3sySFp5rjxBYugh3pbGGotwg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR05MB9282.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(39850400004)(366004)(451199021)(186003)(6506007)(41300700001)(4744005)(66446008)(99936003)(8936002)(38100700002)(7696005)(9686003)(2906002)(71200400001)(26005)(316002)(54906003)(478600001)(6916009)(66946007)(33656002)(4326008)(8676002)(83380400001)(66476007)(66556008)(64756008)(86362001)(122000001)(5660300002)(55016003)(76116006)(52536014)(38070700005)(3480700007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OBmjqkGLtnVn6wcegM//yWpNjzD9d4rU60IE67LJpwyusE+oDlKg9jb0Rt5U?=
 =?us-ascii?Q?RHZkHsLEOd0grJSgAhoqD5mv0xNwIhJhPCFEAFY0MFG+dhJ++SgeGXNf8zNp?=
 =?us-ascii?Q?RGxNxlLOMZh9HalmIngsU1phGyEQh4CIHG4A/GLcJC3iFm/jD6FSVgIzc9O6?=
 =?us-ascii?Q?Aler9Sn29QdxBbexsSy95/sf/zKfMHCvDalLZQJPVkAbu0yRuU9A7qUky+P6?=
 =?us-ascii?Q?pejXz3+hqAC2a4k+4mWi5UYD8NAd8bPi/h093Ba9PVXBKnG1pzxE6ZcCzHFb?=
 =?us-ascii?Q?YGmGH0Vad1nLOqz2ySgviJvRGzP013n8hI7rOzk8oTrhq0o5BLjN8OdZpWAt?=
 =?us-ascii?Q?gxG+mHuWjZ5oNqxhNakDtPSmY0eNSdeyDU+Cn0XCoovAdkkyn2cy+IhNYB5l?=
 =?us-ascii?Q?Rp+RWKTVX6YtBf9/kZTGLHPqffqOM5z+ShV1PG0HqjxRr9EpjJxu7edo1PlT?=
 =?us-ascii?Q?bOQne+HC6IU/62Iez3ECKLjCL98IIL2ukZX6kqPWu9OacROV+nRZu7XMHRRV?=
 =?us-ascii?Q?Z0dFuUTHQIrPKwMCTf0S8+d3BICfnVljudKNWcz8bSbEFwW+wok+Thvb6PXc?=
 =?us-ascii?Q?x8lJSFYp43B8jquSA71l2rLZMFdrODTe7brb5mIg0pCvFbRGFSo/c5dCt/iu?=
 =?us-ascii?Q?ChuEbnI3VK0SzkKhadQujZubDr3Dr/NfshP+L2Z2ryaNxAzdG7g6qndSQjUF?=
 =?us-ascii?Q?OzHUxfV6TI0HjQ4RGzg2foxf5WFg3jM4Wbn+RMV0glT2PTakdvM+ehjbhZuv?=
 =?us-ascii?Q?8wC2I6hoU+oPZ9ubzc97IufwgU4d6BXnhjgDSHfyXzAYvrGCP7JZ2rG0Tu4r?=
 =?us-ascii?Q?N6dmEw3QzVeuQYh4GGYDgWj/LcA90nwi4VTlvFkIqDkDhtlpzefhLAMwqAP+?=
 =?us-ascii?Q?ZCGBFLqCCLxbjvKR1KNfZFwswIsn6+QhqXlCkqPL5GfDU+8HyvojdZKEx63n?=
 =?us-ascii?Q?i42GIGVCf09PA+nX44tymrSXIcNPvvqrC5+DmvsDkQsv5H0sTxY7Z+lOFFew?=
 =?us-ascii?Q?nPyg9ZTacJw9k5TqYwFXXzLYoDL+c1o1n0jurbvsrYkvRZ6hdF0pmJV/nFMq?=
 =?us-ascii?Q?Na3sr6DzBYqwNluLe27Dc9FZCeC+LN2zCRZ/nRFtv3CUDYdVlByFE0tfCrgK?=
 =?us-ascii?Q?3uc98/ENXlGM/W/uxBc6NZ/OyT0BvJ6/PtrgmIyZ69/bv7IZ6aDCO0zr07xg?=
 =?us-ascii?Q?0SqJmQbgf7ykh+edsvU2BxXHBeka1IkaJObWMq7yKp16R0L5yGmdNH3IV2HJ?=
 =?us-ascii?Q?8ZtmgJ2q2nOSwdbR0STPZR4KcLrPWxuSsgjnJ2EXZwFobG1IKTqjKpW1VDVb?=
 =?us-ascii?Q?2N3GrRGDOOuOyZ2Qai7a3j1gIK3PhI7IXK/VTqluLGSuhIFd2GmwpY0oi16z?=
 =?us-ascii?Q?3MQ3y/tC0ICcdHowDScMhkc+OgvhMmw0hGJTAkBuXYDMoUCrQrUdbewfrd9Q?=
 =?us-ascii?Q?Y2nguPn/MdPyeme+3siidvo/JB1BXTq8ZjPrvWft0IY5HIN6iaz86S7LgCeM?=
 =?us-ascii?Q?wE4ZTlbz08n8FJbo3sD3zgoHyJBLp5k/yi/upAzitPcHc/JocTxrxYNc+GpV?=
 =?us-ascii?Q?xnyuHDfQspqab80rOcFWV9WnKWehibXCB9zroOIM?=
Content-Type: multipart/mixed;
        boundary="_002_PA4PR05MB9282681AE7CF4F8ADD039FEFD5849PA4PR05MB9282eurp_"
MIME-Version: 1.0
X-OriginatorOrg: kramerav.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR05MB9282.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b98ce41-654f-4d54-ccef-08db2caef331
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2023 21:30:11.8647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3db4ad3c-2be0-4d8b-9101-e2e8b5f234a8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dcIKXi70crPLVWEX8zH2fvC1RNLJuf+YErxQSh+yb+CAW1VSvN4PUaTFDyYRYxOHF2AaYEJhUBpBJABKsFin2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR05MB6665
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,SUBJ_ALL_CAPS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--_002_PA4PR05MB9282681AE7CF4F8ADD039FEFD5849PA4PR05MB9282eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,=20

i am using your uvc-gadget application(from your git-hub).
i have an issue, if you can help it will be great.

i did shell script in order to configure the gadget(attached), when i am ru=
nning your uvc app, the computer(windows - I connected via USB-Host) says "=
usb not recognized(set address failed)"



the option for your app are below:=20
./uvc.elf -d -i P720.jpg -u /dev/video1 -r 0 -f 1 -o 1

Uvc.elf - is your uvc-gadget application, I just compiled the files with my=
 environment(Vitis)


please help me,

thanks,
Lidor

Lidor Elkais
R&D Group, V&V Engineer

2 Negev St., Airport City=20
9546303, Israel=20
Mobile: +972.52.547.4211
lelkais@kramerav.com




--_002_PA4PR05MB9282681AE7CF4F8ADD039FEFD5849PA4PR05MB9282eurp_
Content-Type: application/octet-stream; name="uvc_v2.sh"
Content-Description: uvc_v2.sh
Content-Disposition: attachment; filename="uvc_v2.sh"; size=1358;
	creation-date="Fri, 24 Mar 2023 21:30:08 GMT";
	modification-date="Fri, 24 Mar 2023 21:30:11 GMT"
Content-Transfer-Encoding: base64

IyEvdXNyL2Jpbi9lbnYgYmFzaAoKbW9kcHJvYmUgbGliY29tcG9zaXRlCiNtb2Rwcm9iZSB1c2Jf
Zl9mcwojbW9kcHJvYmUgZy13ZWJjYW0gc3RyZWFtaW5nX21heGJ1cnN0PTE1CgpVREM9ZmUzMDAw
MDAuZHdjMwpVRENfUk9MRT0vc3lzL2RldmljZXMvcGxhdGZvcm0vc29jLzc4ZDkwMDAudXNiL2Np
X2hkcmMuMC9yb2xlCkNPTkZJR0ZTPSIvc3lzL2tlcm5lbC9jb25maWciCkdBREdFVD0iJENPTkZJ
R0ZTL3VzYl9nYWRnZXQiClZJRD0iMHgwNTI1IgpQSUQ9IjB4MDEwMiIKU0VSSUFMPSIwMTIzNDU2
Nzg5IgpNQU5VRj0kKGhvc3RuYW1lKQpQUk9EVUNUPSJVVkMgR2FkZ2V0IgoKbWtkaXIgLXAgJEdB
REdFVC9nMQpjZCAkR0FER0VUL2cxCmVjaG8gJFZJRCA+IGlkVmVuZG9yCmVjaG8gJFBJRCA+IGlk
UHJvZHVjdAoKbWtkaXIgLXAgc3RyaW5ncy8weDQwOQoKZWNobyAkU0VSSUFMID4gc3RyaW5ncy8w
eDQwOS9zZXJpYWxudW1iZXIKZWNobyAkTUFOVUYgPiBzdHJpbmdzLzB4NDA5L21hbnVmYWN0dXJl
cgplY2hvICRQUk9EVUNUID4gc3RyaW5ncy8weDQwOS9wcm9kdWN0CmVjaG8gIjB4MDIwMCIgPiBi
Y2RVU0IKCm1rZGlyIGNvbmZpZ3MvYy4xCm1rZGlyIGNvbmZpZ3MvYy4xL3N0cmluZ3MvMHg0MDkK
CkNPTkZJRz0iY29uZmlncy9jLjEiCkZVTkNUSU9OPSJ1dmMuMCIKbWtkaXIgZnVuY3Rpb25zLyRG
VU5DVElPTgoKbWtkaXIgLXAgZnVuY3Rpb25zLyRGVU5DVElPTi9zdHJlYW1pbmcvdW5jb21wcmVz
c2VkL3UvMzYwcAoKY2F0IDw8RU9GID4gZnVuY3Rpb25zLyRGVU5DVElPTi9zdHJlYW1pbmcvdW5j
b21wcmVzc2VkL3UvMzYwcC9kd0ZyYW1lSW50ZXJ2YWwKNjY2NjY2CjEwMDAwMDAKNTAwMDAwMApF
T0YKCm1rZGlyIGZ1bmN0aW9ucy8kRlVOQ1RJT04vc3RyZWFtaW5nL2hlYWRlci9oCmNkIGZ1bmN0
aW9ucy8kRlVOQ1RJT04vc3RyZWFtaW5nL2hlYWRlci9oCmxuIC1zIC4uLy4uL3VuY29tcHJlc3Nl
ZC91CmNkIC4uLy4uL2NsYXNzL2ZzCmxuIC1zIC4uLy4uL2hlYWRlci9oCmNkIC4uLy4uL2NsYXNz
L2hzCmxuIC1zIC4uLy4uL2hlYWRlci9oCmNkIC4uLy4uL2NsYXNzL3NzCmxuIC1zIC4uLy4uL2hl
YWRlci9oCmNkIC4uLy4uLy4uL2NvbnRyb2wKbWtkaXIgLXAgaGVhZGVyL2gKbG4gLXMgaGVhZGVy
L2ggY2xhc3MvZnMKbG4gLXMgaGVhZGVyL2ggY2xhc3Mvc3MKY2QgLi4vLi4vLi4vCgplY2hvIDIw
NDggPiBmdW5jdGlvbnMvJEZVTkNUSU9OL3N0cmVhbWluZ19tYXhwYWNrZXQKCmxuIC1zIGZ1bmN0
aW9ucy8kRlVOQ1RJT04gY29uZmlncy9jLjEKCmVjaG8gJFVEQyA+IC9zeXMva2VybmVsL2NvbmZp
Zy91c2JfZ2FkZ2V0L2cxL1VEQwoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgo=

--_002_PA4PR05MB9282681AE7CF4F8ADD039FEFD5849PA4PR05MB9282eurp_--
