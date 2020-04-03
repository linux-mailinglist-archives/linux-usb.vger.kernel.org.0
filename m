Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA9319CE7B
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2020 04:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389574AbgDCCJJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Apr 2020 22:09:09 -0400
Received: from mail-eopbgr80044.outbound.protection.outlook.com ([40.107.8.44]:65328
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389108AbgDCCJJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 2 Apr 2020 22:09:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBFZTVixJ5VH2SyafH0Zeb/CpAsBNequOIey4OrnaPTUSU95/H6VD48DL1rrD0zc97IiaEwu+arHC4bBbfaqFetFJD1WxDkVx9so+tN5ur5yBKOybTOhuA0m6N7dgd6FcEq+wN5Qp9vGIV7QbHHn0eugBA7b6QaNCNoEtu42lSm+L+CcQd4FlvFM8lPUACU5rhJ7hfrgfzrgDKfpGsIdIcnU13kMbUYldBksWtwnFvEjwzcJ0d9bHC3GcX69pUoWI7bG6a2638IqsXuXr78P40A0gRx/wZxQWb2Vhe/FzOGGR7htpbrKsPg5iB6pfxqwwtpu2Vbw8/CfKMxSpFKDow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6TptA9JC26/w0p3sDA9+o6q2SJU12D5wZcZHRNQA6w=;
 b=JtEE53hmvIziKYNXuLfoEUxlAExBTj7zJCBGVw9CX/vqLPtsnLhHh22rIXs+1bTq66DnWW5EKKkDNA6b+98UTEEhGE1u8kFtORJ2fAq1TVsZjter4RUUInQSOoCp7znZZfgEnWw98ff4mU79TQmbOPJEh3Ts7krJpv8/a5jBKy/0AvolETSevxCkLQg3gkAu/GtqEV8HXXgRHxCnvnRuksH2ZEro6B0nVx7jqYco9KaTpm2cPRwBi+JYICdl7SESzZa6Shxe4jaNbVTMAHXvYuHNMRZkhXouq++N8Ed7yNktM3HnHUi9sgQtoBI5YQBTgKGcXL5qcGxJlv5+7/OYkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6TptA9JC26/w0p3sDA9+o6q2SJU12D5wZcZHRNQA6w=;
 b=q9Ffxi3cx7uA+urHPpPfFBPhLHWsOKfZuC3rAaZ9cyq/hdsAf9i529CPqudCH/37KT480J07TsCpYn5l70Ey3EIQidizSgFUM4CUvMfFlV19R8f1YrCqbMSLwu5cLUZ3FK+L7YfkA9+5DulInFli2C35Q+7zQZT5IPH/Pu9skjY=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6837.eurprd04.prod.outlook.com (2603:10a6:20b:10b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Fri, 3 Apr
 2020 02:09:04 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273%5]) with mapi id 15.20.2878.016; Fri, 3 Apr 2020
 02:09:04 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jason Yan <yanaijie@huawei.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: cdns3: gadget: make a bunch of functions static
Thread-Topic: [PATCH] usb: cdns3: gadget: make a bunch of functions static
Thread-Index: AQHWCOvi36N3kzGEqEyk8HfpBN+Mkahmp/QA
Date:   Fri, 3 Apr 2020 02:09:03 +0000
Message-ID: <20200403020926.GB17219@b29397-desktop>
References: <20200402123837.5850-1-yanaijie@huawei.com>
In-Reply-To: <20200402123837.5850-1-yanaijie@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 89a71a36-aed1-4250-2bb9-08d7d773fbb9
x-ms-traffictypediagnostic: AM7PR04MB6837:
x-microsoft-antispam-prvs: <AM7PR04MB683734C0847E9C9E515BFD9D8BC70@AM7PR04MB6837.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0362BF9FDB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(7916004)(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(316002)(66556008)(186003)(71200400001)(44832011)(33716001)(26005)(6916009)(33656002)(4326008)(6512007)(2906002)(9686003)(6486002)(81156014)(53546011)(8936002)(91956017)(76116006)(66946007)(1076003)(86362001)(54906003)(66446008)(66476007)(64756008)(478600001)(6506007)(8676002)(81166006)(5660300002);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BaWOwjZKHH5vLdbDwCBihyhj1/GlsGAaYlHA1LqRSXSreOw6cFkaVcGQ7hUQ2/g5dPnYFpj37KyYdkMlIA2OiJz4T65QNVIa8riKwjxsGvjOLA4zbjtCKHFnQaQu9vX3mXRKdrQIMX9+Uq/X197wfDOjx8UgiQw+4njZfZi6iafD4wv5B2Za5zEN/gRsUOeyNYkAPyUgRQlEh/TsTtcvpEVoWEBz83PFg1SYSGxgTIDnyIgxIeuh4/DBW8CiS/WoicpNzsWViOS8HkARyS8g8bDSaIm02HyeRiEI4wD8eCdv4Tp4b3DCtUn/pq0t4XO/tjZY1bq2WQuxf9ZgZYsTFo2um4lKeKClFJm9Ts+m3oKzfD/oZRoc6PCipQp17CxSWslrdRcEiP1YTQ1IYnmYu+N6KeqltLz7kknSidUApRoApLmCBow248S1aBEZK0XL
x-ms-exchange-antispam-messagedata: FcOsA/hF5x8q2p+QKl14dgWgcQA/dUMw69PWNjBuTyIeB+8KyE0PlJV3Uwh/zkqpmgdPCWTgX4BsXARC+ICM73xSp+LfKwWYhEgcqUK1gtRQ26jfgjm/qlDoz9UKN8gzytqKjYg7p7TG6pG0Fj/5Mg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <51A7ABCEDEBD414983C66A051EA199F5@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89a71a36-aed1-4250-2bb9-08d7d773fbb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2020 02:09:03.9397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1zWootILZD0RubHQVSBukU1O91/3ZsdEcQdQG/qXF8vDUlBt5qBTYE+/ZjIQWyrSP5EKvNVpp3JuVG0q/6tF5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6837
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-04-02 20:38:37, Jason Yan wrote:
> Fix the following sparse warning:
>=20
> drivers/usb/cdns3/gadget.c:85:6: warning: symbol
> 'cdns3_clear_register_bit' was not declared. Should it be static?
> drivers/usb/cdns3/gadget.c:140:26: warning: symbol
> 'cdns3_next_align_buf' was not declared. Should it be static?
> drivers/usb/cdns3/gadget.c:151:22: warning: symbol
> 'cdns3_next_priv_request' was not declared. Should it be static?
> drivers/usb/cdns3/gadget.c:193:5: warning: symbol 'cdns3_ring_size' was
> not declared. Should it be static?
> drivers/usb/cdns3/gadget.c:348:6: warning: symbol
> 'cdns3_move_deq_to_next_trb' was not declared. Should it be static?
> drivers/usb/cdns3/gadget.c:514:20: warning: symbol
> 'cdns3_wa2_gadget_giveback' was not declared. Should it be static?
> drivers/usb/cdns3/gadget.c:554:5: warning: symbol
> 'cdns3_wa2_gadget_ep_queue' was not declared. Should it be static?
> drivers/usb/cdns3/gadget.c:839:6: warning: symbol
> 'cdns3_wa1_restore_cycle_bit' was not declared. Should it be static?
> drivers/usb/cdns3/gadget.c:1907:6: warning: symbol
> 'cdns3_stream_ep_reconfig' was not declared. Should it be static?
> drivers/usb/cdns3/gadget.c:1928:6: warning: symbol
> 'cdns3_configure_dmult' was not declared. Should it be static?
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Reviewed-by: Peter Chen <peter.chen@nxp.com>

> ---
>  drivers/usb/cdns3/gadget.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
> index 372460ea4df9..62f585c55846 100644
> --- a/drivers/usb/cdns3/gadget.c
> +++ b/drivers/usb/cdns3/gadget.c
> @@ -82,7 +82,7 @@ static int cdns3_ep_run_stream_transfer(struct cdns3_en=
dpoint *priv_ep,
>   * @ptr: address of device controller register to be read and changed
>   * @mask: bits requested to clar
>   */
> -void cdns3_clear_register_bit(void __iomem *ptr, u32 mask)
> +static void cdns3_clear_register_bit(void __iomem *ptr, u32 mask)
>  {
>  	mask =3D readl(ptr) & ~mask;
>  	writel(mask, ptr);
> @@ -137,7 +137,7 @@ struct usb_request *cdns3_next_request(struct list_he=
ad *list)
>   *
>   * Returns buffer or NULL if no buffers in list
>   */
> -struct cdns3_aligned_buf *cdns3_next_align_buf(struct list_head *list)
> +static struct cdns3_aligned_buf *cdns3_next_align_buf(struct list_head *=
list)
>  {
>  	return list_first_entry_or_null(list, struct cdns3_aligned_buf, list);
>  }
> @@ -148,7 +148,7 @@ struct cdns3_aligned_buf *cdns3_next_align_buf(struct=
 list_head *list)
>   *
>   * Returns request or NULL if no requests in list
>   */
> -struct cdns3_request *cdns3_next_priv_request(struct list_head *list)
> +static struct cdns3_request *cdns3_next_priv_request(struct list_head *l=
ist)
>  {
>  	return list_first_entry_or_null(list, struct cdns3_request, list);
>  }
> @@ -190,7 +190,7 @@ dma_addr_t cdns3_trb_virt_to_dma(struct cdns3_endpoin=
t *priv_ep,
>  	return priv_ep->trb_pool_dma + offset;
>  }
> =20
> -int cdns3_ring_size(struct cdns3_endpoint *priv_ep)
> +static int cdns3_ring_size(struct cdns3_endpoint *priv_ep)
>  {
>  	switch (priv_ep->type) {
>  	case USB_ENDPOINT_XFER_ISOC:
> @@ -345,7 +345,7 @@ static void cdns3_ep_inc_deq(struct cdns3_endpoint *p=
riv_ep)
>  	cdns3_ep_inc_trb(&priv_ep->dequeue, &priv_ep->ccs, priv_ep->num_trbs);
>  }
> =20
> -void cdns3_move_deq_to_next_trb(struct cdns3_request *priv_req)
> +static void cdns3_move_deq_to_next_trb(struct cdns3_request *priv_req)
>  {
>  	struct cdns3_endpoint *priv_ep =3D priv_req->priv_ep;
>  	int current_trb =3D priv_req->start_trb;
> @@ -511,7 +511,7 @@ static void cdns3_wa2_descmiss_copy_data(struct cdns3=
_endpoint *priv_ep,
>  	}
>  }
> =20
> -struct usb_request *cdns3_wa2_gadget_giveback(struct cdns3_device *priv_=
dev,
> +static struct usb_request *cdns3_wa2_gadget_giveback(struct cdns3_device=
 *priv_dev,
>  					      struct cdns3_endpoint *priv_ep,
>  					      struct cdns3_request *priv_req)
>  {
> @@ -551,7 +551,7 @@ struct usb_request *cdns3_wa2_gadget_giveback(struct =
cdns3_device *priv_dev,
>  	return &priv_req->request;
>  }
> =20
> -int cdns3_wa2_gadget_ep_queue(struct cdns3_device *priv_dev,
> +static int cdns3_wa2_gadget_ep_queue(struct cdns3_device *priv_dev,
>  			      struct cdns3_endpoint *priv_ep,
>  			      struct cdns3_request *priv_req)
>  {
> @@ -836,7 +836,7 @@ void cdns3_gadget_giveback(struct cdns3_endpoint *pri=
v_ep,
>  		cdns3_gadget_ep_free_request(&priv_ep->endpoint, request);
>  }
> =20
> -void cdns3_wa1_restore_cycle_bit(struct cdns3_endpoint *priv_ep)
> +static void cdns3_wa1_restore_cycle_bit(struct cdns3_endpoint *priv_ep)
>  {
>  	/* Work around for stale data address in TRB*/
>  	if (priv_ep->wa1_set) {
> @@ -1904,7 +1904,7 @@ static int cdns3_ep_onchip_buffer_reserve(struct cd=
ns3_device *priv_dev,
>  	return 0;
>  }
> =20
> -void cdns3_stream_ep_reconfig(struct cdns3_device *priv_dev,
> +static void cdns3_stream_ep_reconfig(struct cdns3_device *priv_dev,
>  			      struct cdns3_endpoint *priv_ep)
>  {
>  	if (!priv_ep->use_streams || priv_dev->gadget.speed < USB_SPEED_SUPER)
> @@ -1925,7 +1925,7 @@ void cdns3_stream_ep_reconfig(struct cdns3_device *=
priv_dev,
>  			       EP_CFG_TDL_CHK | EP_CFG_SID_CHK);
>  }
> =20
> -void cdns3_configure_dmult(struct cdns3_device *priv_dev,
> +static void cdns3_configure_dmult(struct cdns3_device *priv_dev,
>  			   struct cdns3_endpoint *priv_ep)
>  {
>  	struct cdns3_usb_regs __iomem *regs =3D priv_dev->regs;
> --=20
> 2.17.2
>=20



--=20

Thanks,
Peter Chen=
