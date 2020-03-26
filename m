Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A90AE193DC5
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 12:19:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727697AbgCZLTQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 07:19:16 -0400
Received: from mail-eopbgr60080.outbound.protection.outlook.com ([40.107.6.80]:50565
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727560AbgCZLTP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Mar 2020 07:19:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3glVwx7dBFE9dwOGNx/sUrvT0qXTDAt9FHvLlsHufZW4MnG26YtnFuOmbgH9BhQrdpARzViHHAZqfLSDBBow+C7Oz5MhsmCCTWeJQaLjQlfKho1WK+yXs1P6SKgdBcszeChfNKx6Xw+xN9Y6+/jY40SpTicW2X0OyVBOj0igNUhy4C1Te8mCkdpt5H/RQKkXRB8RpHlCFm4tfKZBBbtDyUoYDa5N7SdVZqPMoJFAsJIk5ISXV902wS0ptSElYMgMIMNLwwx/+ZD2uQifpH3tkPVAnfrjuTgJnvGt0sPDQr3cKPo5936bSl3OVI7yz2uC3kdFxliKhTe5e/CXrwwpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61Y/KWbPshwukBYwunwa7RLLa+NR/yxOTNwUa4C3fb0=;
 b=e488SSuk0fZSoGoXfrWUw+CWT4HJX/+/9JBhY6tRMFqaMWJFaev95pQznegd3bhWKzsF+cSJKKzR2gBAdbhq1g+H5OrwyOBO/kzizJOM9UxKqKbJCN+YTQg3oPHvnFoPKBnV56iTsSueD1r0244FJiyoIrSehkqiER3rekP0KB+astMEgWXl5aDRpKyiqOFaQRnch6/pIXEE/ebAkCfPv/hwen1oskS0kvW+a+6GyVUgx0hjREbP4Uh98gX46xEp2ZM4hA+E5alRjF1wqI9jwnLMNH7P573q+onNHux2zWqNSyLtjxfLaMHkgiQd5tXil6UYrXVOzYtOyuu1ae1gnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61Y/KWbPshwukBYwunwa7RLLa+NR/yxOTNwUa4C3fb0=;
 b=B3nsSvOuyKBCiezGsUSXxsLvNTctgahDBZ57/2oAFMTJO5hKvFvCNmDbMY6AuFVD2nsBqCZjc4zKZC38wA/tVlxm79ffMr6/+nV4wXvB918w8MK+fG4mNideXzLKeK+hIWgskIupVlhC7FRrq10yuXQ75x/GdwLcgDIyOryXxqM=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (52.135.57.84) by
 AM7PR04MB7109.eurprd04.prod.outlook.com (52.135.57.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Thu, 26 Mar 2020 11:19:12 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273%5]) with mapi id 15.20.2835.023; Thu, 26 Mar 2020
 11:19:12 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Sriharsha Allenki <sallenki@codeaurora.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "mgautam@codeaurora.org" <mgautam@codeaurora.org>,
        "jackp@codeaurora.org" <jackp@codeaurora.org>
Subject: Re: [PATCH] usb: gadget: f_fs: Fix use after free issue as part of
 queue failure
Thread-Topic: [PATCH] usb: gadget: f_fs: Fix use after free issue as part of
 queue failure
Thread-Index: AQHWAzP8onijjrsBNUCC7ekIvBVpvKhaunGA
Date:   Thu, 26 Mar 2020 11:19:12 +0000
Message-ID: <20200326111933.GA23632@b29397-desktop>
References: <20200326060033.14550-1-sallenki@codeaurora.org>
In-Reply-To: <20200326060033.14550-1-sallenki@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 96323d2e-266f-493e-3e4a-08d7d1778302
x-ms-traffictypediagnostic: AM7PR04MB7109:
x-microsoft-antispam-prvs: <AM7PR04MB7109350E7C508698DD6C8D658BCF0@AM7PR04MB7109.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0354B4BED2
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(39860400002)(366004)(346002)(136003)(396003)(376002)(4326008)(91956017)(6512007)(1076003)(66476007)(66556008)(64756008)(66446008)(76116006)(9686003)(66946007)(86362001)(71200400001)(316002)(81166006)(186003)(81156014)(6486002)(33716001)(33656002)(53546011)(54906003)(5660300002)(6506007)(478600001)(26005)(6916009)(2906002)(44832011)(8936002)(8676002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM7PR04MB7109;H:AM7PR04MB7157.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KZg+mrXy7WPQbg03gHkXOPZLc5GuerJlVWbu3gHBN3lwwmM4DDBkezk7vrm8+dd5p6D6LdRzwGk/S2GOSZBi5OWIIwseQIns/oQ+RjNnrTrC3gpNlmTSSO+IodPhfx94mSvTmxFdqYNm6T3BRfr9pZdhhkxSJxGuUEEK+7B5ueNZNL9orSWwvwHNGVOXJiwMMPhBCjHVMyvmZ6ZOIkIi+RBXq4s5LFiBQHFh/BgQnDqKvTJ5OoKnGNXXYue6NgTjvSb5nZu2Vc+e08zT1GdvjcIZ90bYKOH5sByzbRn7qN38CPY/utZqLb3/nUqX0Yn7rgfm3uha9YYZYN+KMte/iK8beAPKsF22BG9FB5ZtVO+gJaZCpzIqcBfzgKhOqQUinJFewlfd8LibXy3dAIuZe8Y90ZOKo9YMRzEoFGtakHlAaghqbS9Vg1uTsAfsUldh
x-ms-exchange-antispam-messagedata: MhvsHDk6UKSUPn54Z2h571eSEtmp2FLkD1t5OctQJzraQh7Q5ldFt0iTZdGDDmH8MUEpd+bl9PG+xDcFz0ctEAgM71YLlte8eh3S+eKlrQoFT7thsbF0hBwJ4NcoeAB8Fe2Sy5tCLxRN5rpBBt7Uzw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7DE9C3651451FE4F85002585D00032C0@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96323d2e-266f-493e-3e4a-08d7d1778302
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2020 11:19:12.5171
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QBrqTmxPw9UrXsUfNk1wUw8xJbWEadkYpOYkYwq2kb2lln0Si7NijiLn6wwCKsocC6AqN6TC3zT/RRHR13iaNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7109
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-03-26 11:30:33, Sriharsha Allenki wrote:
> In AIO case, the request is freed up if ep_queue fails.
> However, io_data->req still has the reference to this freed
> request. In the case of this failure if there is aio_cancel
> call on this io_data it will lead to an invalid dequeue
> operation and a potential use after free issue.
> Fix this by setting the io_data->req to NULL when the request
> is freed as part of queue failure.
>=20
> Signed-off-by: Sriharsha Allenki <sallenki@codeaurora.org>

Reviewed-by: Peter Chen <peter.chen@nxp.com>

Peter
> ---
>  drivers/usb/gadget/function/f_fs.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/func=
tion/f_fs.c
> index 571917677d35..767f30b86645 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -1120,6 +1120,7 @@ static ssize_t ffs_epfile_io(struct file *file, str=
uct ffs_io_data *io_data)
> =20
>  		ret =3D usb_ep_queue(ep->ep, req, GFP_ATOMIC);
>  		if (unlikely(ret)) {
> +			io_data->req =3D NULL;
>  			usb_ep_free_request(ep->ep, req);
>  			goto error_lock;
>  		}
> --=20
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum=
, a Linux Foundation Collaborative Project

--=20

Thanks,
Peter Chen=
