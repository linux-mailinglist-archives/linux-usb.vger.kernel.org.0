Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A48B552D36
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jun 2022 10:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348105AbiFUIkH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jun 2022 04:40:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbiFUIkG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jun 2022 04:40:06 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2139.outbound.protection.outlook.com [40.107.113.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 183D12316D
        for <linux-usb@vger.kernel.org>; Tue, 21 Jun 2022 01:40:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+dT4qBiRprGFBsw1FhB2VUW1cE/73xmvQcI9HWvOXxFU8LRF+tLDVmtrFUlvVbrvhdKvjOQdwaCPxV1yWUG7bX/yQJAz0tfCtGseUxQV8AD/HsdsE7wJbEBht1cjCcvFFLkVEAaIFKyjPBIF9gsnvuFekhGW3HFY89lvxdxnR3ibScexFmj2Ue/Ni76a7gy3dn98RUDOmZGEI4olYwSDbp0weAN/dHFa5RJDTpGGkQ33dmGZer/xDUqwILAw/4U76Fu2Jj5Uqfgi3L8oNTuiSsJgFlG+xt8TY/+u30diKZsMeBMLqb69fo2WtEaLUmJTN/gwDwxk13nJ/liZsu6Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbvQyidb7eYlatscUSb/0EmthQFTAmhIDpGEjzjGp34=;
 b=T4H0Ejo+6EKdgJIEV9PGhCwUS1/60ErnHdKrX5GEYypLJxSqo2Ra4YCdwNuoSOAffoKzT/LbzsH6K+BUIskilHn6vZgKhhmXtymTn0yVTGLJ0mY+CAP+BgNy7Kj83D+ZJ23NsG3NEoPMltqP66mcSv5Pp1zzE+wDcK6HvmZBz+KBUEVB5qmk9pDHX/kRXiUkGgnUFVaW27kEP43vNdXUBXU4FknCR4dmyPUPKqENELyCUYl0djGvIaFF4tODK4kTvvywxcXBk6d6YiOJ+Q0VqCMcumb8Aep8mVf6kWN9GPyAG0JmAIwQFMSvIWFJ9BQ4mV6xggLBw20Ct1/EW06ufg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbvQyidb7eYlatscUSb/0EmthQFTAmhIDpGEjzjGp34=;
 b=ongqcFCmsoRrkkeSdSFL6qoV/EAOagcMS4Kh1e2XGXI8TfW1KuHiBDoDpqT+N6CSiHTESpKmRNBaduF3wTDncNLk4k7/t0ZcMTIZxSn9PJo9E6sJkCc8Ol3xUgPc6M2e6cXEuxLn+YJTe5INsppRkOE7GK2fId37BPSucyym+OQ=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by OSAPR01MB2785.jpnprd01.prod.outlook.com (2603:1096:603:39::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Tue, 21 Jun
 2022 08:40:02 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::51a:bf36:d36f:c043]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::51a:bf36:d36f:c043%4]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 08:40:01 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Phil Edworthy <phil.edworthy@renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Aswath Govindraju <a-govindraju@ti.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: usb: typec: driver for TI HD3SS3220 USB Type-C DRP port
 controller question
Thread-Topic: usb: typec: driver for TI HD3SS3220 USB Type-C DRP port
 controller question
Thread-Index: AdiEhAzZltzmXO17RG6ECtRMxS4cIgAu8D6AAAH9XqAAAFU9UA==
Date:   Tue, 21 Jun 2022 08:40:01 +0000
Message-ID: <TYCPR01MB59333B58174461B2F414D74E86B39@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <TYYPR01MB70867A4B8CEBD6450A239D45F5B09@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <YrFx8RFYgF6RWckE@kuha.fi.intel.com>
 <TYYPR01MB7086A377DAC14011066C239BF5B39@TYYPR01MB7086.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB7086A377DAC14011066C239BF5B39@TYYPR01MB7086.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a696e27-d9cc-4be6-6760-08da5361a1e4
x-ms-traffictypediagnostic: OSAPR01MB2785:EE_
x-microsoft-antispam-prvs: <OSAPR01MB27857E545F6E5340CB24D76F86B39@OSAPR01MB2785.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rVSB8TdIaZcO7F7tRqhTBTRW49r20PAgdYAAtK8F6H6Ids5ZUtDrb9ifo0Gew2lnLvmpr9BZN1+quvDtGC58+/CHUK2E5EuJFQ7boGwGXs/sTeCU1788WTq/gYJ3s9nHIz9iiuiI+uag3Q0huSL4XfLnvV8DuRk/ZSU5XBqrw48d4C91E/y38MLj+l4BEwed888bPH3kwaeLACPwGa59S/J59pSLadU/LSRNb+/XFlZJ9mX65sM3ALu8vkgfdIuH/vTVutO9v0+vAYFHYc0wACob2OwUuMAreX1BKOdi39BuXp9nuE5DH9iVcBraf4F6BXkhuU9zhSgP1/41yYgqn9+VqtCc8YVzMgya1J+s8+JfwLm1qlJqeMe9lrLayxcTsiZply+MBl9EJ3hiqdviiUzTgp19ECanTZJY/KK86LwlUZfhKKrxAXtDBx/geYfVHFq0jyjcV09C0GPWcX5OqUSbsVdq8pxB8AFd/pW7uTgrydye0Xw7+BSudnsuiLG6rlrPauQCIAn+2129HjJbXi63ggXRCDUMTLSTzCsULmoxKXUzlSCQDDB91VEC2z+7z8yJoS71zWp8yYgi6qFyRFYGr2CVOOCO22GU8XwQxK+VJfVLrL/2METPB3DT0+R8l5CcqhBUQeIXWViZxDf/Lz1/xCaWiGzbt3+1GK9lCQr4ueekcB/w0ZLGpD3ztFhUbtYNKS3K87h2itrbm7jqzSUk3X1Kx20BX80AowUZUI+DYeJr3e7rMo9JjhjZhzw6232WBsRVLuq8KJTktaxdAg2YmgcFlHP5kO4zpNcsPM8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(76116006)(66446008)(64756008)(122000001)(54906003)(66556008)(66476007)(8676002)(83380400001)(4326008)(33656002)(66946007)(38100700002)(316002)(110136005)(71200400001)(38070700005)(8936002)(186003)(53546011)(86362001)(55016003)(966005)(478600001)(9686003)(26005)(5660300002)(52536014)(2906002)(7696005)(41300700001)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MunWKESCWX7wRkVUmB1Sw/uwDp1PbKUTHayGBXMTEIpBshcm0V0V+fArH7D5?=
 =?us-ascii?Q?oh29W6O9XUSM9QpzThQ6WoPloItUmResE2rdno+v7/x/bYfNDRL9H8+4M9Rr?=
 =?us-ascii?Q?040HaLEh0akPV8xhBnCHuBNkp6SS4Ce0Fy0nFjOVb5fxYP34XqFgLwn1G6I3?=
 =?us-ascii?Q?P94O1cRwmEjSCO85uzF497EM1qnDuxAmZvWXMYX/nmYCwYLYQBD058FCq+S8?=
 =?us-ascii?Q?A0FNI5ZLPjP8o87rZzWyvIJlAjqkRLJ0F7hQqyecojy00GqZqaOL7AWhsXlD?=
 =?us-ascii?Q?5BfoH3t2vjks/74pTXsaRvRwi2YihSrsDjuWfi4Sez9GIrNfYLJKJubO0AK7?=
 =?us-ascii?Q?s3BAG5qZIDednfiOSbmZqxPzzzE/gRU9PLcHnxWf5R/sVxvca1JTwRH8Rr1G?=
 =?us-ascii?Q?XBYGpSgwu+LBdJ80CQXKOQ7Q+797jjhFrDiAYqhHGrisk1Twjt5oVC3XzwLX?=
 =?us-ascii?Q?GNlGtyjkDXFyqNuDTsAMLivLD6tnVMvwgc7kfj3K3tdAu/1cQGEf66oGqd9b?=
 =?us-ascii?Q?l7DysLLEefjUOrsG4+iBE/83FRaN5qMor8t9klxFZV9IJHv4WwnFccZc1exy?=
 =?us-ascii?Q?A3P91KFOIJEI8VEorHjUhxTjVGg+9cVBkuLyUxnaME6p63X9IuH582m/cYT0?=
 =?us-ascii?Q?0g6GIjBLs0j4+76pnFJlhSapeT68phWJEphejnkPGSvC3l2bVWRrw/L6nI23?=
 =?us-ascii?Q?CG0MO4yfFqBIRF08rZbfgxxrwZ9hp50KOghj4k/lD9rz9p4vufUEcDXR7/dH?=
 =?us-ascii?Q?0199h0LyXcmBmXsomtVlRb87bV9P/BRbole+399anC66JU3tuLBnP0x++cl6?=
 =?us-ascii?Q?1FuWJgvx68wNneGzZf3lVY1gw3JI0+mfoMWE/61pXmOpjRyQYr7NewypL+NQ?=
 =?us-ascii?Q?zExoxF+IstpwjLBGyBRqkNYHRvcOT00+Y6GWwbojBG7VQB4cjE0j6QiUZg4O?=
 =?us-ascii?Q?gtLJY5gFZuLBf05LiunV4y9yN0mlamqYoNutl/sjCgpFh+csAYT68/mYR6EZ?=
 =?us-ascii?Q?ttW4cnQKM2ajr6KvARMlZWFxcjB1uDT6oebMlfryko1pe566q6uBKuCpkeo9?=
 =?us-ascii?Q?s9kmO+Nd0lhitysUx6+w3RQ8jbGGP2RWOa5WdjCPEnZdYqb2q/C1R0PVh3nC?=
 =?us-ascii?Q?vxoC1m2hhkOWhTNHkEaLg6OXRxuA9GBZhtF5c4xo+pwgA64xM4CZ1c+sPX9G?=
 =?us-ascii?Q?VAJ1Qvdjv2IXZyUptnoH16kqBctCSuR/3w+6DN8EKrSnhdXkAUR+NYgpxeQT?=
 =?us-ascii?Q?Csv0HtFTTVS1kLCpBYbmi4zBB1CjYIOgvk7EOoTmTYP1NzQpYS996NTM7gfv?=
 =?us-ascii?Q?lOmomsKNPyzWFITSRez5O/oYMLzNMH+HaklQodKw6R5IXyJ5hI+Q9uBbYBZD?=
 =?us-ascii?Q?5w4equTEnG2GARNA0bRWmXuAPnGHxqFi0VJftctGrtVKu9/r96moRZPMu3m4?=
 =?us-ascii?Q?u9qOn1b9L39doQAoQSW1w7jrC9pBT5O5uwtOocLC1REGJLM6MiES+afdnr7J?=
 =?us-ascii?Q?AASg98e/Ddu2pGp8tmdzAa+SFaJdyfbQYcicxBQItnaSJxPgPVeT6DqD4z8M?=
 =?us-ascii?Q?863oJsackT9MiqT85pMh4JRQ7QCfUA+enk6R91Cr0RkpieXQ4uDYeyC54wJc?=
 =?us-ascii?Q?SAiFRkTbqt9cbNY/xWL4D3pc8w6FBwlPpzW4uB9/qdKjJjbw5k1MRGGRIptm?=
 =?us-ascii?Q?gYdNGejvacK7oeNybWuXGHLcP3PE6Mb/zLdUIU5wTu1SVK/zXyHfAlJKK+lQ?=
 =?us-ascii?Q?rWQunPd9SOtly81OgwpC9iTviIq5SQM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a696e27-d9cc-4be6-6760-08da5361a1e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2022 08:40:01.9224
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yi7/Ql2itqgZzq5815p+C1rfEHqHHB123XxfK5DsrbaVr4Sf+uA81VidcfDuhkFsPtSbxvbEVuoEqoVshkIyB5t4tMafCrv7CF1Nu7RKL48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2785
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Phil,

> Subject: RE: usb: typec: driver for TI HD3SS3220 USB Type-C DRP port
> controller question
>=20
> Hi Heikki,
>=20
> On 21 June 2022 08:23 Heikki Krogerus wrote:
> > On Mon, Jun 20, 2022 at 09:04:10AM +0000, Phil Edworthy wrote:
> > > Hi Heikki,
> > >
> > > I have a board that uses the TI HD3SS3220 USB Type-C DRP port
> > > controller [1], however it doesn't have the interrupt line
> > > connected. How would you recommend I handle this? Should I get the
> > > driver to poll the i2c registers?
> > >
> > > [1]
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t
> > > ree/drivers/usb/typec/hd3ss3220.c?h=3Dv5.19-rc3
> >
> > If you have some other way of detecting connections on your system,
> > then we probable could consider some kind of notifier, but as a
> > general solution for the lack of interrupt, I think polling is the
> > only way.
> Thanks for your comments.
>=20
> I wonder if this is a problem that affects quite a few drivers, where a
> generic polling solution can be used instead of interrupts. This would
> require a driver-specific function that can detect when an interrupt
> would have occurred, e.g. by reading a register via i2c.
> This is already done like that for ethernet PHY interrupts.

You mean like PHY at subsystem level, check IRQ is present in dt or not?, i=
f present use IRQ otherwise
Use polling.


>=20
> > I'll add the list, and Aswath and Roger. Aswath and Roger were looking
> > at the same problem with the tps6598x (tipd) driver.
>=20
> Thanks
> Phil
