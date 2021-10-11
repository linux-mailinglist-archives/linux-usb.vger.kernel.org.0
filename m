Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52BC2429457
	for <lists+linux-usb@lfdr.de>; Mon, 11 Oct 2021 18:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbhJKQS2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Oct 2021 12:18:28 -0400
Received: from mail-dm6nam08on2072.outbound.protection.outlook.com ([40.107.102.72]:55392
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231508AbhJKQSY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Oct 2021 12:18:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PgYdG9xpxJ8poyutHItKnlYc7AcUm6b1plH4KNJ31vJvenzQgXoUT0X0n7DFXdI2x2lFem2ESnjo7Soxq1LPrOcg6ExBK+DTArmpMjGc/zaS8ahQFiFInFTsFZWIXg/T3lqOqgdBm1PaKKNyWX4TUngt/gRKDhAV3beGHOGNXy70qfpmaE2kJmGnq+JtNC2mEKWIGj5vI//K748yYjjSo4dyFJ5V/JYKhTP+vVee2PDCf0GC1lmf/a6++kMeGqvg9Dllo08Ybj8bM4nwL33aRNnxFpodDMQolAeNrKRMrI/YsZcfZrcY3ql0jH18ar+lwbBPjVP+WS2KeceqgHlBHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YE2L0eDe36bebWdC3phsO2QhwKwljAtT2+j6qF3Av/Y=;
 b=cO9Vt0zKhYQeMT+dGvxq5FQVJg0FOBWM3tKtRY4TwpzX3CzxDGOPPI3X1NODvfZ3qrpGHYOJ6WPS/IN14ViHmTw8TpdmtRWSl7nVkM2VGEl0cpH56DsWClf3NJjRdYLVmaTeVDoWj7TAhSUZ3ywRPXt/iPnykQ7SAqGN4Z7W0neO/cva+chw/MeSCbNavlOm8i8NKzUPSSbKjEashgrcb825RjLFoNLpnihaTBaQmGkhpLkczCW06/jIyAvs2h53eLPLbXYHRt4+l/xReV30C8pofVGJor5czTicUjOh9UamO4wcKGNu4NKAAc06lqAIf71TMPftlTbYH1wchserWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=avidyne.com; dmarc=pass action=none header.from=avidyne.com;
 dkim=pass header.d=avidyne.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=avidyne.onmicrosoft.com; s=selector1-avidyne-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YE2L0eDe36bebWdC3phsO2QhwKwljAtT2+j6qF3Av/Y=;
 b=O3tUz+/Qh5u2Dxyqa3cY2fXk9txTk8DUoRljFzi/PqC8aJbQBUSfgqXNUN6CVx4F5qqvX+spLlr6y0Npm8T9lvyiDCi1t0RWoeACK36kgfh3rMWcTn6VQ/0NNvYYVJ2/d0Fzj3Zn1j9Oj1McCA4JzNju6M9DhkolzoWxz+PetWU=
Received: from MW4PR03MB6443.namprd03.prod.outlook.com (2603:10b6:303:122::5)
 by MW4PR03MB6555.namprd03.prod.outlook.com (2603:10b6:303:126::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Mon, 11 Oct
 2021 16:16:20 +0000
Received: from MW4PR03MB6443.namprd03.prod.outlook.com
 ([fe80::f11b:cc54:5c2d:7161]) by MW4PR03MB6443.namprd03.prod.outlook.com
 ([fe80::f11b:cc54:5c2d:7161%5]) with mapi id 15.20.4478.022; Mon, 11 Oct 2021
 16:16:20 +0000
From:   Mohammed Eleffendi <meleffendi@avidyne.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Updated xHCI Specification Document
Thread-Topic: Updated xHCI Specification Document
Thread-Index: AQHXvrtDC2txv+Av3kG7c1mfjHwmUw==
Date:   Mon, 11 Oct 2021 16:16:20 +0000
Message-ID: <MW4PR03MB644372563D57A25130321234DAB59@MW4PR03MB6443.namprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: affa7e84-9855-49cd-2402-29c2dede692e
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=avidyne.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 025e4d35-0bf4-4428-131b-08d98cd27671
x-ms-traffictypediagnostic: MW4PR03MB6555:
x-microsoft-antispam-prvs: <MW4PR03MB6555408B3764240B8F05B72EDAB59@MW4PR03MB6555.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qX1O+ID1xfLtT5a9s402NR0U6/xFNUMmjlai1MZni3h2+4jGfebHWG/t2ZEafFkk36+G4p+HnQzYQ3ZNZesbH3hocjOptiTwv4lbrUZx4/Ub/Fs5DdUjLa6w3zm88Eoj4tezfs8mUReDrpKDKKoL35sLtkyupQPtfgGPcv1OS258goFPGw5zp4wZ9LjhJoGv18Rgs2bJ1mgyIwfCqcYRMBs/ttLk3FQz6z4TcX9Zv0uCsRL0SMK2fpN3R/J82/dXDC1qFEQ/TdP2Scj7JJq/Oxa5nYrPlF0eYQrGhbFCOPTgoVUc4ERAPKW42yVwsBgVh3tFEUBUCYSxLZ+V9Qg7LkQyUAXPoAA6zxfsUeusLjskmmAwF8Cxv2lo0nX8fVLdWh9hKiXnNYQY1nNkx9d73U9U3Bwt6LmFkh8evcPZq0yTmVutTsoANquKz1jIgLBxUi8nb6WMBFaY3JED+DKmL2zBQ0b3STCgRF9TeWYbyc42cBZtmGxcYfyr46V3X8kwsvAjkF/F1gc7PfPCNHFQ7fjSs2Xa+zcZ7xyxITEdMTJiWnbgpFOxAvAAgv7OH4HwqttBLkPRQJ7n2J2d9URBJ9rRllnd8vYX/WkEL2Q5bnraknm0qswOZ6CAZP7uqrq1vTGZq8rK6AqDLEsDxHTwvSfzXBMK5G+cG5/ZvdVM6mC2A+vJ+TAaUL52rwjLZgpxm0JaIvfFSncJd9upoVCfOQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6443.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(396003)(39840400004)(136003)(376002)(7696005)(3480700007)(508600001)(71200400001)(186003)(55016002)(6916009)(52536014)(122000001)(9686003)(6506007)(33656002)(26005)(5660300002)(4744005)(91956017)(76116006)(66446008)(8676002)(66946007)(64756008)(66476007)(66556008)(2906002)(38070700005)(86362001)(83380400001)(38100700002)(316002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?rnGM/LHQcdTa6lSrqO/IqYsMXx0/uFHL2eIK1Lm4zA+Ecd7otYdkVvl5/h?=
 =?iso-8859-1?Q?HcwweW22NEaviqd3wHSl6XO31uXcFyqK17+Dn33uVPwV4cdHvWo80IxdFt?=
 =?iso-8859-1?Q?6Q1ZeeIS/wKnGcLmHgqFIDLBFapKYeykZwrWltlGWinUT3pTfQBAEn0P9x?=
 =?iso-8859-1?Q?7BJx6d40ppQju0XVlw2j11TMnbgrEr5meZtRV/9zp1HzhcuNJGQ9ti4xhl?=
 =?iso-8859-1?Q?MDrPAyxx8wuLtSNhN/hmxxPIRO1vyfgBWRSuqGrTqjRRZBDSP2TUwGqnKV?=
 =?iso-8859-1?Q?NkRGKUXlg6dPzXopKvkZru5LYbSYgTExy2b48JdRGcCRgjkQxt+f4SBRiW?=
 =?iso-8859-1?Q?yL6ASB7Q+KqziL8JXOl0aw/vFuSLTqyXv33ONB/Lkvkmy+Dy5CpIvBKyLk?=
 =?iso-8859-1?Q?qPpwgotj869wzdpUpa2gDLLxtDA6UA5BcdwTOF6Dmk4idJpGH7q4vXGgtW?=
 =?iso-8859-1?Q?7Lz81dHbgt56Je0t3RtjOIS+E3oreRH5vti1g5Z8nHUH474VXMXtofkdsr?=
 =?iso-8859-1?Q?RQkRqgYdH/wYbcgchhdox6O3cU0gfE3Ck8hrfXVqU7P0Ht566chKo+vh+A?=
 =?iso-8859-1?Q?aVghyoFwJqdPZ5+70xmSgamr5MHBGj3W0uLF//ilAMVtBVFdM5iEAJwjTh?=
 =?iso-8859-1?Q?tXorm+voyV7brHRCs74ZofQyqZJMFh50MSmyQlOV3L9d7pvzOFAsBOYe8q?=
 =?iso-8859-1?Q?dn7bTA1hRlKrVkRq/1agNl+rHMR6T28Kb6ELcUI6H/igsjXUMZ2Pia/RE8?=
 =?iso-8859-1?Q?C0QhwyRMGUb1V6ccYE7cGr24NN8+E8trWEWMl0ty7VC+oK7JTxzkSrMI7k?=
 =?iso-8859-1?Q?BrTzS/zzqxG4Crb3EYmFQOJfiON3X5qLOWkchppW5HpcPPPH/9M8K8x6bU?=
 =?iso-8859-1?Q?52r2usLc30odWG8mi2u12hGBXSiO+/S/exGr1AQGV4/WP9YuxXUu0sqwH0?=
 =?iso-8859-1?Q?qS+MCn+sD65dvaEByVJHiFrnUHrMntvbw+rneZidzeXk6SPjtmWymSFRZT?=
 =?iso-8859-1?Q?qgzKWPmvvCHBtwx0fsW/YPVBpm4vsutqDj2tdPO2wqCqd54N7GegoFjxHz?=
 =?iso-8859-1?Q?F/Y6Z+UxU7QaZPvQztCDB4l5hhNAOGTtKzA3RC1NEkcCw5WXAIsBNIQf/4?=
 =?iso-8859-1?Q?HG6V9Fm+YTBTyI/oozAohGP/NXrso0c+2hyZXRquBnXihDZXHWWuSa1FP6?=
 =?iso-8859-1?Q?iVespDSI4dGUV2jtH34AlV+OWVcGolE8iY0=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: avidyne.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6443.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 025e4d35-0bf4-4428-131b-08d98cd27671
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2021 16:16:20.5707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ef0eaab0-e9eb-415a-96bc-1a35fadec553
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: al5oznCFR9qU7xpu0bCrCKSOOJ46Nq3/3zpn8VhhqqE41LQ1Is1zByN1CiMd/qFjPSwxJzQOkDDLvFIkl3/SSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6555
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi, We are implementing a bare-metal driver for the USB xHCI controller on =
Tiger Lake UP3 and need a programming guide/Requirement Reference document.=
 The one publicly available, which has Rev 1.2 is outdated.=0A=
=0A=
We already have access to the EDS documents vol. 1&2 (576591, 631120) and e=
verything in the RDC library, but nothing in there applies to driver develo=
pment support.=0A=
=0A=
Does anyone have something that could be useful?=0A=
=0A=
Thanks in advance.=0A=
=0A=
Mohammed Eleffendi=
