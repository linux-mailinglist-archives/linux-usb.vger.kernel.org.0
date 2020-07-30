Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21B3C232990
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jul 2020 03:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726519AbgG3Bbw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jul 2020 21:31:52 -0400
Received: from mail-eopbgr150073.outbound.protection.outlook.com ([40.107.15.73]:44022
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726194AbgG3Bbv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 29 Jul 2020 21:31:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grY/v4bD6DyyH7NVJkGzUmoqYDkstAd5UxE8GBrwFFQ461JyVfWS2tv7CKsT1DMGpDF4F6Gi5JYavye545+2CQlm0Su39EK+0YuJYZLaHWp7R106Hof90dKodKTZYJZhJzqQO9loDZUJL+d7Aos8L5mg/1pi1hNYQMtOJKYmKdLZPOxZzPGLONRyHb2supw/PpqGMFaytpdSnQhy62mbwvA6gqJ+AfykdyCD4QzRygl+nfUbEAnCb3gYwXRQXPCoCqvYKns4R6hiVbS+ffuqHwJxq7w3UHDjVlXUv/+GqNtof5dJXlksTMk46mOVFldoiYu/XUbtnxEY9qnoFkascQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsU9fz9L0kU9vOfx/K1IHtGkCMzHvhbB2Za4GkRi5kI=;
 b=OiCtlodr6V900xfycgkgZLdNYR/4/kVg04bkzPVLhwiD7a++a4mXKOVVREJctxFRMQXVIwfslykP5c6kmc2XWuH/6fKyC7hksYALHoylGGjrxBIklVZpmorNUmd3v+HkQM9niz0Ms2gH7nRkM6Ud5V5ieg+SZRIavbqxRjUs7E03hT4Pxlpm7wyQ0MAyNIF0BrYZFQWWBTCgKSSCPyVStR5z0BLtG6T9exqlNj/yfdYFlrbhuoiCfyV3Nz2PVAu1MV384gXUEsLaExg1OPIN0BMlSxDJuV7eqSEHsMgEBbSngJ/NGquWHvNC/JpTpougVXXRltuBzUNS5k2BmOpbjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsU9fz9L0kU9vOfx/K1IHtGkCMzHvhbB2Za4GkRi5kI=;
 b=nUV41vAMmpwkl9GNpXQnMnRuZiMLFLnoxLgy6SMm7sQjGuuATo2NvaHIQchj+By9A/CYnwqBQyak1bYsuHULMH72MXE8qpusXfATY4x8H0YxA/jOtnzDDb8nMze84zai00mMOZmGdaJtTaxo+XRbjcwry/n7G2qdm0APfEHqYXE=
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DB8PR04MB6842.eurprd04.prod.outlook.com (2603:10a6:10:11c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Thu, 30 Jul
 2020 01:31:47 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::8a7:786f:91a3:1e1f]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::8a7:786f:91a3:1e1f%7]) with mapi id 15.20.3239.017; Thu, 30 Jul 2020
 01:31:47 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [GIT PULL] usb: chipidea changes for v5.9-rc1
Thread-Topic: [GIT PULL] usb: chipidea changes for v5.9-rc1
Thread-Index: AdZlTbkWYn50r544STiJPG47Vm8gZQAUdaoAABxko4A=
Date:   Thu, 30 Jul 2020 01:31:47 +0000
Message-ID: <20200730013123.GA26224@b29397-desktop>
References: <AM7PR04MB7157A59D46B7E843DF7645018B700@AM7PR04MB7157.eurprd04.prod.outlook.com>
 <20200729115824.GA2813582@kroah.com>
In-Reply-To: <20200729115824.GA2813582@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 28c06ac5-c113-48b4-366b-08d834285390
x-ms-traffictypediagnostic: DB8PR04MB6842:
x-microsoft-antispam-prvs: <DB8PR04MB68426DCB4C456815560BC6418B710@DB8PR04MB6842.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1051;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4s87f9ZTeHem5h3bsddXuxbM3utMGzlIwQTCSqb2EzEbZ7VrizRxGb3pEdlLzTKy21jOc7dvnCcqQJ8WXJ1ZGI+PEb+MMEhcdax+WULOLwohsmjVBdqTSkW3TmUnMjescoIBmuVMpaYPCuq1OMVEATs7fLej1EuQlxdBJ00KISaYgiW6NH5N1AZkVnlJwbv3wSmVu2fSzyEcWRDZz9nQa/IIYlFiYnYE3jpZpm1kf3+NdxoRCV0LZ+MG3aeYFYfrRg94fjDSow0uMEEh3hbY4Ig8ZLgdXeL2u2Z4Lbzr6CnOy7yzDDzQDOfHYjGsIMWy
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(7916004)(366004)(376002)(396003)(136003)(39860400002)(346002)(2906002)(186003)(26005)(4326008)(6486002)(5660300002)(64756008)(66556008)(6506007)(76116006)(71200400001)(66446008)(44832011)(53546011)(66476007)(91956017)(66946007)(1076003)(6916009)(83380400001)(86362001)(33656002)(9686003)(8936002)(6512007)(316002)(8676002)(478600001)(33716001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: AnRhNLwCzEqKY1V00NbJZ0XDu+DqP+Hk3wnnKmBLziyQTyHlYuUDTZHexhhspsvY0W49hEVC9K11thLkpOamsAuzTSoMwYLHy3LXGfisskgh1ygZe4SVrI4VZicBZK9jUbNVoFd0BDROSLCaFuT8BE/N/LZIq4Us3vqv6SsoPZWdGrm2vFtLpkvi3sJZ5y+hWaDwrAeGAMRzxRdBffXkWjZwBFe1zJQcUFImkXBNB1FAD6WO2RZ4NP/Xyc44BUUeV4fpWxN8MXTic0WlRv8ZtqHQ/6otEReIadot5hcIbrJN6x6qwYdtNFXVu/rmUmZMKHhNOt2PI1t0sALZkOKPr88b5CURhfBAvfvHBogAqpiNOUJtSQahOipisDK2ze7fR3dV+E6JkaCN4Kt+gvYA+ozE/2xcjfZ1jPlVhFKERCKdcstpo1AH1giI+Sq2AQQZam0ASB0mIDhqeZRhMtYjMbXcJyQsZrydRVcmKVWd6+s=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <29866211197EDA40809D1E4030328510@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7162.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c06ac5-c113-48b4-366b-08d834285390
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 01:31:47.7614
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IKzxr6bp8MOCFYfJuOsnDQC+o/0eOp0Z1zh4RxNqMQYpFkJaAwipZqKBhlHhFxqYCdjfebRgJJeRh/mOUSYQBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6842
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-07-29 13:58:24, Greg Kroah-Hartman wrote:
> On Wed, Jul 29, 2020 at 02:12:37AM +0000, Peter Chen wrote:
> > The following changes since commit af7b4801030c07637840191c69eb666917e4=
135d:
> >=20
> >   Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2020-=
06-07 17:27:45 -0700)
> >=20
> > are available in the Git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tag=
s/usb-ci-v5.9-rc1
> >=20
> > for you to fetch changes up to d6f93d21001e4388a25b0b922e02e64bc6004d2f=
:
> >=20
> >   usb: chipidea: imx: get available runtime dr mode for wakeup setting =
(2020-07-28 14:12:11 +0800)
> >=20
> > ----------------------------------------------------------------
> > ENDIAN issue fix and one query controller role API is introduced.
> >=20
>=20
> Can you provide a bit more information in here in the future?  This is
> what shows up in the changelog, and it says nothing about chipidea
> stuff.

Oh, I thought all my pull-request patches are chipidea related, but
the reader may not know it. I will add it in future, thanks.

--=20

Thanks,
Peter Chen=
