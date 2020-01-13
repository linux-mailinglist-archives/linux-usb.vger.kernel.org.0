Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13F26138DB4
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2020 10:25:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726127AbgAMJZc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jan 2020 04:25:32 -0500
Received: from mail-eopbgr70077.outbound.protection.outlook.com ([40.107.7.77]:33217
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725832AbgAMJZb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 13 Jan 2020 04:25:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JrsI3/mVsKR3zAvAevZFGf1WTmXqljLJHlxtS5R60RnUZEDz2pcU75SahkoLT/q/4K2zN1YG6Yn8p9IVWudEIUGke02rRQo6OxSQQX2jjkG5cGQeKMIif8g3u+kVVZ05QccFh/yFml1Z0psME+KBAhNLQsKjJvdgx/h1v7L4PTmA+CbuRFY5d6Tm7izFcqmK/cg3QtpLlb9/xSVUOHuL0XhId2APWBk1Af4IikJfSgtXAgmL8T7QgkoAl9GX8QnN5mxRIMlYUPb/zDwE4j/m69yH3Z5ZOR0cCWkBT3ezdmSTrwIf4QICbC0Sp0pUf+y9mcmTaPIkaesJVj71kesJ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHcsU7y+2ahJUz1LjicQxOeexPf2mjWdGPg0hAGFr7c=;
 b=jRwRNNcTXAX1QcgkNeAiFb9nPEMCELLZ4O9PwKLUXgC7G13nTF3ElM5T14MEvzXeGAf5kEOrfhT44MjXThUCjqmJLJ24d//+KIoUehp3vSw/ow2KQ/o8AGLJuUYYTBtzInyrfiL0TENbdUv2GspIkOkp7h8NudIAdfO6bsMVnG8fDXRBH7QoDW7YOWdjkfNQgIR4pFAGyEx0VK3cb1SS6nlKTIqx0DqeMj81Nf8MwkzQZLJ9ad7DJx3n3TN/K3KNYQIMdH4HVcgMbgRP1U3eyGpRosyaURM6xa8KlHAWonuCFz8EYsfuqG3bFHX52gGPoN2Wocd8MPLtBIVATiiUuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHcsU7y+2ahJUz1LjicQxOeexPf2mjWdGPg0hAGFr7c=;
 b=QnNOKWyxDNMW8tBx74o1OOmlAYy7iF5GyqK2fFhAjMqybhTjUsVdu6HAzyu4TRuU0AcBZIaFzcqUAAO5sxMMHToeimLN12ZaU93OBHfMUMmSedPBrb97189MXsLYsLnHHEtcnH4iNF5zQhhmIHGmFWZ4QweAQm+CpNnnVQITc9k=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB4365.eurprd04.prod.outlook.com (52.134.122.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Mon, 13 Jan 2020 09:25:28 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 09:25:28 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Fabio Estevam <festevam@gmail.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        Roger Quadros <rogerq@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH v2 1/1] usb: cdns3: add NXP imx8qm glue layer
Thread-Topic: [PATCH v2 1/1] usb: cdns3: add NXP imx8qm glue layer
Thread-Index: AQHVxtDDYQC8DMUxY0O1pFYdKmO/zqfl9XQAgAJjsIA=
Date:   Mon, 13 Jan 2020 09:25:28 +0000
Message-ID: <20200113092525.GL17599@b29397-desktop>
References: <1578562558-32462-1-git-send-email-peter.chen@nxp.com>
 <CAOMZO5CTB_TdW8G8RW41_t-sLhQyZ1Xy9rQW1Pu_BbOcJwe-Kg@mail.gmail.com>
In-Reply-To: <CAOMZO5CTB_TdW8G8RW41_t-sLhQyZ1Xy9rQW1Pu_BbOcJwe-Kg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 865289fa-2780-4249-b48e-08d7980a8767
x-ms-traffictypediagnostic: VI1PR04MB4365:|VI1PR04MB4365:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB436575E9F7C7B39AE770E6708B350@VI1PR04MB4365.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 028166BF91
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(39860400002)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(81166006)(8676002)(54906003)(44832011)(316002)(66446008)(64756008)(66556008)(66476007)(9686003)(6512007)(6486002)(2906002)(86362001)(81156014)(66946007)(478600001)(8936002)(76116006)(91956017)(33656002)(26005)(33716001)(1076003)(186003)(6916009)(5660300002)(4744005)(53546011)(6506007)(4326008)(71200400001)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4365;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2MNqnoeTtCyFpZNaDSqw8qdWMx11h3p1E/YXC4OVp7rTVK6uAzu4X/1lFQO9jTOcj9WsySiW8zWIsKkDCv/YGTCxg4zZu5CA/ghvyhWGFxC6NjKp0j0teouZnGNE2+MzXUwd+kDx0p9BbxxOTqvnWE+J/h1K5rEXDcTYW9wyrvUm95FSmRAdwfpA8E7D3clr+lMAy7hX+JOTSvYqxnlU3QmjZpHnJ2hM/rNUqA7t2HOjpWONs7En1G2dSlRsS3u+FyciCTEoCbt8CbUqQrX2xZa/gSY3l0vAKh6mI2KMh7HHRWWiGoV1HhIeJorpRKmJBQ4cegBBUJOR+h7IERbRRUc8DiAFs0bknDACENW0CuoH5qxIqK0+YrsACSp3Yzq6KRf7EP3bSMwALojv/rd4YHAl+E35Tgm3npC+KoUjDuFd2rrx840y5IRUfNx1dhtGq4+DwOl6v5gLdQ/pR8wYH9T2F/5l6BufR6amKcwwEDPVzdnF710JrYSRgXGMIUn7
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D3CA6838A376F045BC3BFC51B5128122@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 865289fa-2780-4249-b48e-08d7980a8767
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2020 09:25:28.3380
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H48JIVrmUJtMBNEHejIuZCI4iZdkS/CE1auY0DmZdBwE/w0XgBgrtsTBigu51s+vZzrQnLYxG1tnIcfWa8oBlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4365
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-01-11 17:56:06, Fabio Estevam wrote:
> Hi Peter,
>=20
> On Thu, Jan 9, 2020 at 7:55 AM Peter Chen <peter.chen@nxp.com> wrote:
>=20
> > +static const struct of_device_id cdns_imx_of_match[] =3D {
> > +       { .compatible =3D "fsl,imx8qm-usb3", },
>=20
> Please also send a separate patch for documenting this compatible string.

I had wanted to add it, but the working version is based on some
other basic dts patches, eg clock changes, which has still not
in mainline, so some properties in the example at this dt binding=20
file may not be found at mainline kernel, is it ok?

--=20

Thanks,
Peter Chen=
