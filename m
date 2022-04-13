Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66A6F4FF560
	for <lists+linux-usb@lfdr.de>; Wed, 13 Apr 2022 13:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231431AbiDMLEK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Apr 2022 07:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiDMLEI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Apr 2022 07:04:08 -0400
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com [216.71.142.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7607349F14
        for <linux-usb@vger.kernel.org>; Wed, 13 Apr 2022 04:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1649847707; x=1650452507;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2bPOt/9P1wI3UGQ6CsYHDNFYqGGzBZwdVsTLozPaSWQ=;
  b=QV/Yp19tRvDL927eQcOMOQo2HAmliphcMrTMCmDfoRC+dEyOeJk9f8Ed
   r13bUOTioAgPcNAe2Fq7tvff0XGSe47hZA/tbwmvVfg5o2lfp51bboiek
   H1VVqfrb4vRokMQyWPyZLjsIjkTpJHGmK1VBedKB6G9YhB9csh/aZjZiW
   8=;
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 11:01:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNzGu5ZPqqbe/pBusEqsio3a3eylIAhtqzOI/20HQakAZD+PO6fd2nJ20uc7iI+twMg15TmHjUDzANZJLdzy7T3lTWiNhIHtLAHVPLJQMYrcdL6TEPT4mfaPb7pFNMoxDtzoKg9LRO/6si5a3cQjHqx+Zqd/oJ8CXSt74o5TrjzznPfBYhbeR8lT7eqJx8p4HIFesUgN71T4GREJe3UZcxDZNl1uPDKg/V9Yfj4sYLezWiR2Hax3s/PYmJgU2ZQSchc4paJR/XDUhByV6c9ZBGAIQcm9q2616a1PxeJXRU4pfU9pbVd5Dohqfyoafw5gMZHhDa3d4FllrEu9h8Xkww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bPOt/9P1wI3UGQ6CsYHDNFYqGGzBZwdVsTLozPaSWQ=;
 b=f7bXUdYV0C8JMyM2ZaGSAxaRWMPCcUsnmzlcUfSAEC5q4FI19ugm4drlFTj3W5iuDDwcTS9knbauN0KYkOHvxzzPsQrNYfJ/Dr5aScUN7bnFGhtAbSAvw+nqhj2xdE/IEej0qNKkO8Wrn9JEqaaxtIwJALTY4MmYavTaJuAphEl6NnS0Ic96PPsutBW5gMgMa6982YOIXz0aoHizTStdrDW0FrugVGmLt6QjJ3EnvV2oneo4uNab2nGHSSD7I5Y3KMFP6oqNv1LEz4vpYvmLqegNQIw221WvgPYlKllqlpMuy3o8TS1ANAD23ZU/E+vz7UTPsUvIjFIXIffx8q97+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 BL0PR02MB4290.namprd02.prod.outlook.com (2603:10b6:208:40::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.29; Wed, 13 Apr 2022 11:01:23 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::15d6:317e:e736:e9ad]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::15d6:317e:e736:e9ad%5]) with mapi id 15.20.5164.018; Wed, 13 Apr 2022
 11:01:23 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Jack Pham (QUIC)" <quic_jackp@quicinc.com>
Subject: RE: [PATCH 3/3] usb: typec: ucsi: retry find role swithch when module
 load late
Thread-Topic: [PATCH 3/3] usb: typec: ucsi: retry find role swithch when
 module load late
Thread-Index: AQHYTlhOBGmy0G1uSU2sGWcLEt44Mazt7b0A//+OfGCAAHgpgP//i5qggACZ84D//5J1UA==
Date:   Wed, 13 Apr 2022 11:01:23 +0000
Message-ID: <DM8PR02MB81987D9C894698FF63B7B27AE3EC9@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1649759407-24049-1-git-send-email-quic_linyyuan@quicinc.com>
 <1649759407-24049-4-git-send-email-quic_linyyuan@quicinc.com>
 <YlZ/wrIRUD7HpMDB@kuha.fi.intel.com>
 <DM8PR02MB819850DA69CED34F1B31B6EBE3EC9@DM8PR02MB8198.namprd02.prod.outlook.com>
 <YlaFVUyJPkKJpi2D@kuha.fi.intel.com>
 <DM8PR02MB8198536D2D5962F6FB5DB789E3EC9@DM8PR02MB8198.namprd02.prod.outlook.com>
 <Ylak1cJylsOrzwL7@kuha.fi.intel.com>
In-Reply-To: <Ylak1cJylsOrzwL7@kuha.fi.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c9ddd7a-43e8-4fc2-fe78-08da1d3cf2ad
x-ms-traffictypediagnostic: BL0PR02MB4290:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <BL0PR02MB4290D7B75F569D9DB94D051C9FEC9@BL0PR02MB4290.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kMAjcQsTH8VU8vtGkDVuvuHdppNMk4pmRwTTJQsrMYaRaUmDfvFySOHi7t+lfBLdN81sDbJqlVTtv8EqmE/X4sXtQHpwNSIEOIs2FCkt8roP2qpuocPFKcc5VbBjbRvccTnVEXXlRorIssq1ppOyX1uY7lHyDTNye3FvRMOfvtSX7Y/oRoHY6fhJf0NCdUBa5PHpOi9LvwwpE5a8gr76URR2CAAJdRZL8s+6xvdOOQmZgddeBwGTcJk8dtwbbf55+Q5R5yxLXfoCn/jO75lTkPjpXHMwTa3qKHu+xfokxkDVBxMv77n1s0+ytJIGcsUOIdRP7uwg3NE4d/fiAA60V2TRxMT+C1rwuGYNkj21taBb41Q+IrrmcgREzkhiyuckDFHN2mQfhaEw9snmvYFzfUoOIjVDmtNIfWVrODVh/jRDRBiv77HdXTM7w4T/Km7gE9kE0F5Nqi4nsv0COFv8xzRwpPuusyr+J7dYKwnea1eKlKf9sqzNsXVFrO9DzcJL1P8bGvWSvXx2DIX+AM2DGagUKePU4XY0KVPUD48CuMdNyVin4Ucwmj9xIO9w2XR1iyp9uj3Muj5sDbuYvz1RBDKR6YqrELTvG62R5k6682fZHReymACu2/mKN4rAEQEjuSHj7iuZutl9u5wPNlmMCfcMf/pkjmpdnVupqrmOOh9B0m3HvZeJeSbqPwClE2VYaAUVeJtqN6XZUiYV+9HaDw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(86362001)(5660300002)(38100700002)(107886003)(55016003)(52536014)(7696005)(66946007)(76116006)(110136005)(66446008)(66476007)(64756008)(8676002)(4326008)(66556008)(26005)(186003)(54906003)(71200400001)(316002)(508600001)(33656002)(6506007)(38070700005)(2906002)(9686003)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2pzW8NH7MwlHR8KlIBi9wgrAelV68PkdZyC5jj5vdnklBIPIqxQBz3OYZlxx?=
 =?us-ascii?Q?yqouXEbPhpiu0gTm4xgA0G35qqOOezrYSn+DUShEJS4l2ux6XT6mYU3cZy9B?=
 =?us-ascii?Q?bptGTNd8DKQ6/V8MhN02dw4aRT/Zdx9sjZZLTfWIn0PB4/kShLvdQKeUgMls?=
 =?us-ascii?Q?5wIUnj5KYmgpsMcCmv1AnDu2gvR9j/7d156xa410yEWdrd3TGUwOykbv4PvB?=
 =?us-ascii?Q?oMISiz7sQ0bbyn0RjPcbQtj2LyqTccCfZiIWs7AaKnaiFQ8xdOj3FG7nl2j+?=
 =?us-ascii?Q?dfUkQXgHHGDOpjWIfJrlGflWt1U7GcAOoVUuAbfp52lJ8AKkh62/DbQGFcEr?=
 =?us-ascii?Q?fr+YOFJnJC5Qae3qPPJNJCnz3oWYE0YrrODbUkKW/HVZXwvJGjga64VGQ5zM?=
 =?us-ascii?Q?5rPaLQH38eCp4V6kYmHygC6vhJalKAU7jFAO2PBtUntA7wuTVUIuAsy7hEHB?=
 =?us-ascii?Q?sqDtqSYcjp/s9hPIbDW3RcWhW63AbHsiAEYZrqBePEpg58EJ/8EnIZbpXqtQ?=
 =?us-ascii?Q?Vyd8bVUefyMzR2Dizm8E0efOp78+UTcxkt8gd6rz6prU8JCqYAEoQfhiG8ia?=
 =?us-ascii?Q?t2zA8OoHXbl//08WPVSkoSOhPe64cCl6uV9TKSHVr3lgtPcr75X1cp1prINQ?=
 =?us-ascii?Q?gvSTyVXKQPDyd7dntVxBwxo8aTeGF1uypEugcAJIH9HPr2Hc02TIN7ekitE+?=
 =?us-ascii?Q?rF/5lsYeHNk39zXDwSTRfS4xzOHBPzYRMYY02PyGBoAc27xYB6mDwbl9SyKp?=
 =?us-ascii?Q?FrfDKtEzyWqnG4k4fDoOQahBep+qHnE9AF6husx5A2Ej9aQeWIv5getLGh7U?=
 =?us-ascii?Q?Xkwe0n3DP7cqgH2e58LEQR53/2N0dXo4cCysA9j7WbbLVpoX9otwuyNjq0VY?=
 =?us-ascii?Q?xK1/Vv+sU+u2+tMGVQewk3fJv1YAaj7neLlj3Wrfa4bfKP2bsOt6vMB8OKAQ?=
 =?us-ascii?Q?qqBElyhR0j0rwd+ESu+jtBfT2u0x3w2TqpPzWp5Pu4yi8zTshA1UTbpG6i8U?=
 =?us-ascii?Q?tjVJvS2Vch2l/s211XjP9lu/wnai306clVEjwbA2UEDo6G/AEoDwvVB7Myrs?=
 =?us-ascii?Q?y1gTxgWP76VCSBvxWRJHgkevbVjb0sKYhi0N2HVzH+m81M6BLaX5P6A0CV5/?=
 =?us-ascii?Q?ZF45TC9oUBO4L2sKqF9BhNiXOZCVhLwKpwbb4bRKhcHsWgQuI+R37WlyDnLX?=
 =?us-ascii?Q?nMcQKpHihE3zds7qJN/IBozyva0GGC2MhXV9Fr8DRl25zxeTALzrtRziSmqE?=
 =?us-ascii?Q?PKgDeq7xN+oa0YdUYgluVm9oRS5MWEcCdS/+kGDCl2eiYA0lo2QRa4fivHCt?=
 =?us-ascii?Q?yu8rrwhJ5N2wskaEQ3us5clw+FctO71XpZ6+8LHTzKHQ3wskJ02RvGTjPFNV?=
 =?us-ascii?Q?1bAK34EPRi7O4S0dDnL+pcmZ0cyC5l1vQvq61j20QXTa+d+TMNEIP/3sgznN?=
 =?us-ascii?Q?bOnZyGM3hO+c0ys3/3vNx3aUt5R5/mVipUwZu2OKMruEUEaA5gHw98kVvcuX?=
 =?us-ascii?Q?QmJlwzO+U7rlAeXWnhK7xFhmnLe+U5LpkPkqsd6NXjg/WJpDksPtb17cf2cR?=
 =?us-ascii?Q?8DppsPJ7JkntFm9dn79x8pAZL55qm/v5b7ivJ6+SfMcQowoE9r4jWR/LExDV?=
 =?us-ascii?Q?CBXDSyLwoQ14gLfo6RfYXEIIcbRYB0Gm6iQaaPa+vWvj6b+GZ3Q9iv2OvFZq?=
 =?us-ascii?Q?e2eTqFO8zusXVVa5uXlorwDhQ8tESK/IhQQjIGuHpebwhxG4pV85zjFDEB4J?=
 =?us-ascii?Q?e44Q8bpm9Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c9ddd7a-43e8-4fc2-fe78-08da1d3cf2ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2022 11:01:23.1985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cc/eS0iHZOoLiaVl7uPMVJgCnpUzAVwEk+c6jPlAy9ygZfAxAtCRGXBeSszG24titGf95LGRqdo5iQuk8qOhHdqmmB+wjci/iRvEi5zAK8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4290
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Sent: Wednesday, April 13, 2022 6:24 PM
> > > No, you don't check that, you just return that.
> > Yes, I do like it.
> > >
> > > So you don't need that crazy polling mechanism where you queue a work
> > > until you get the resource. Just let the driver core handle the
> > > situation.
> > The issue is when a UCSI implementation driver probe, it call ucsi_regi=
ster(),
> > But this function will not return -EPROBE_DEFER,
> > It just queue a work to start connector discovery.
>=20
> Ah, right right. This is a library. But we should be able use
> wait_for_device_probe().
>=20
> So if fwnode_usb_role_switch_get() returns -EPROBE_DEFER, you call
> wait_for_device_probe() and try again.
Do you mean do as below,

find_role_switch:
	con->usb_role_sw =3D fwnode_usb_role_switch_get(cap->fwnode);
	if (IS_ERR(con->usb_role_sw)) {
		dev_err(ucsi->dev, "con%d: failed to get usb role switch\n",
			con->num);
		if (con->usb_role_sw =3D=3D -EPROBE_DEFER) {
			wait_for_device_probe();
			goto find_role_switch;
		}

		return PTR_ERR(con->usb_role_sw);
	}

Seem wait_for_device_probe() will wait all drivers probe,
Can we accept it ?
>=20
> Br,
>=20
> --
> heikki
