Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A711F558D16
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jun 2022 04:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbiFXCB1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jun 2022 22:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbiFXCB0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jun 2022 22:01:26 -0400
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2139.outbound.protection.outlook.com [40.107.255.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F88A60F04;
        Thu, 23 Jun 2022 19:01:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QUiOxZFNiI0zw3tJqiB03vMUF5NUKrIzfgiqFLLAJ6TwqVzrtRbkCXzuBl1Sc9Be3ij4udtMpK59ygsSeJGp7KGiG1tvKRrVuWHuv3aEXB2U2ctNbho6Sv9WXWaMzqQNOh8P9PBwz9h2LOa3XPrPZ+IW7JBStU+W3XaNFzFmQZO+eWA90OB7Uh+ST5m+PPOkvoyDHUqAXz6YCr52XPXQSrWcZnRjetK/RZQUYUw4mGA54MyDMGGAVLqf2l9dYGcRDP2ZdnT+XfBAhjGFBtWbBaqCojGuedYasOGDIKQ0kT86B2BOeMhSL6MqDaQQ5SggRLf+fBo9P1dvcKIPEHEVCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FH7zUDPbS/IGGPj/uHSPcGR8nBM56Np71q1R75v+VoE=;
 b=iv77MvJeZKqaKyDmc+NQ1AFKjxh/7MHrhqmNxQt37KBf7PcyQNtC6I6W/jhlJ0O/66Ho0Pasg9UNG1CkOsIZ51N23WV44NEQ1H/4o+ehdRX7nqbXXz7NAotUNHytQSRYIPGyN3tbGbWd1eYIyoG/sihokZO3VshiKognM8sYhBp63SH2yC/QMcClMd3VqjryYTa+Nbou8lWRIyyuvdIZDkB9kY/gFZ20iIcVVYEAk9sOsMIacKh/9NxQfgYCCc82ez6aEACd6V0b+oL39vuLI9BNsUFflV5uvF+OR+uuHUVAjIj+4jYD6hx0S6osAP0BLIcN7qdn4KCXuuTPRBYK4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FH7zUDPbS/IGGPj/uHSPcGR8nBM56Np71q1R75v+VoE=;
 b=pXVEpm4LyKaoGimSkoliO+xbfYhABLGOAuV8KSYT4bNilqTvJilH1VBFBk1mw4jhFwJ4fNyrMYeN7bP5PRSTTM4Awpa6RAnceL4ulP/nPIxRd2RNu3K4YDZ0OS6cbQQKfa9xhzGvbiROZ0d4+DcbTqmS/deXfcHnEwFq1DtXqvoSbdk3wnxVMzFFxqwKUWi/sqd/KQ32G7B236OAMgsUUOTcl5Hig747Wgg0C3coPbpdJ7l7Wse1PnAeuSFl/5p6hJ/ZxybJwKwgkj11/V3G7XO+LkFFYOgVGjnOFr0W5Qf5lr+/HYSXwttR60YTVImBIUwFLusxMtZjyL7DiB/pHw==
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com (2603:1096:203:87::17)
 by TYZPR06MB4286.apcprd06.prod.outlook.com (2603:1096:400:64::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Fri, 24 Jun
 2022 02:01:18 +0000
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::46d:a7a:f047:e9bf]) by HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::46d:a7a:f047:e9bf%5]) with mapi id 15.20.5353.022; Fri, 24 Jun 2022
 02:01:18 +0000
From:   Neal Liu <neal_liu@aspeedtech.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH v2] usb: gadget: aspeed_udc: fix handling of tx_len == 0
Thread-Topic: [PATCH v2] usb: gadget: aspeed_udc: fix handling of tx_len == 0
Thread-Index: AQHYhwFDotvNHoTltkGrBcSk9lSRr61dzizA
Date:   Fri, 24 Jun 2022 02:01:18 +0000
Message-ID: <HK0PR06MB3202A24ACAA94B6525ECA7DF80B49@HK0PR06MB3202.apcprd06.prod.outlook.com>
References: <YrRj38cU1nV4gsUX@kili>
In-Reply-To: <YrRj38cU1nV4gsUX@kili>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21730ab2-7d6c-46b8-1bdf-08da55856d6c
x-ms-traffictypediagnostic: TYZPR06MB4286:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cE6oecyobzgfz1ppHRFCKPCUM6tP5UNovhfSlJu7pI87noJQl15h3uuv0ZMbgFJXyyovQWVYGE/wI9Ls4UcJulyxFAurGa1S2s/9bvhOYLs4IZMMv2fFVk/UVjwdlIF59kXzKLvN1C08rtFiFDJZKBtpYTgNohQPmrzRQo6jypAeWc7U67059pw+k4tV6yV8FTOKELeATqDiAyloCgKQ+4CZcAcWWs+L4bOL+4j6DnkeD6A8lc8q7X8jQ1LAw153kWlrVSw2bZ4maGTVPZhutvoIoLnZtCTdDVcAMTghEzNferPWTZXf3gtLZQH7GNXch+q9+Uoc/BKoDaNqqz/ms5wCbwytpb3+pLGS8AiBAMsPVIs7opnqJLgRFSQqK8yTlaFnO+PkWHvqQiuLBWHYPAc2MCp3zq7stAh7YBAbkGc7ZqW12qaD9VXIAWTf8rmLN0MWZ4zl4NFM30p4bChDsSbBnfNnOTL3ruNbvnrC2ZqkjFcw6LiAlfnsJXrmhrx/uhuJAAiYy9HIPd0Rl0dwiwqxl5wUAx5QdGdY4ih8O0kSPoTP+uo4MSY/SShu/x0j/Kf/QiEWnh9yCNK+ZtKTWefwSHZK1ipp0e9GdaaYcfEQCmP32ZeBYpLJYm5A/xqBrpjBW3SEYovzqRXysYpOd7i9uIfkKWKp1riNKtYp3p+zF8bITqVk8jGXnbR97FWais/oHRMqZhIN9LbwbXMuUKkqgwqeqnaJIRzPk8JR6SGCLJxBwbgy11isBQj9bOV5aYs27SOBtypWxvHxzvcaWM3sutJxf4ZwxckzNNvPmU0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR06MB3202.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(346002)(376002)(136003)(39840400004)(38100700002)(86362001)(55016003)(316002)(122000001)(38070700005)(41300700001)(478600001)(9686003)(8936002)(186003)(6506007)(5660300002)(2906002)(83380400001)(8676002)(52536014)(64756008)(54906003)(4326008)(76116006)(66946007)(33656002)(26005)(71200400001)(66476007)(66556008)(7696005)(66446008)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KmhWEhRZf4p5jOWaQbrkpG+gf5RrQF6Aatwhb/epbzav5bjrQ1FnfQbuBwTg?=
 =?us-ascii?Q?OgVXpL2TwPdf+MWKa1H5/iEW98g4Iqi1V0UlpLIYr3b8kp3JBh1fJcuvvq32?=
 =?us-ascii?Q?7GAzSRh1FiEI5vI5LX7fszyJ5qeDSx94spjUk3WCuJYW+u6QjvUK8bkwqyeW?=
 =?us-ascii?Q?PkQggKkYwWlit4wO1fgcRxqlJNlxljESX3MZnvaK2gpTKg5vNpHMEiZJmljS?=
 =?us-ascii?Q?hj5syITu+d91bVsSAD1/DaBKd2AScS6P2e8dFqqWwiG+WAXodXqRTHNWzqNu?=
 =?us-ascii?Q?r3I6EWRktCF3j9CmDdNhMBF1jdlHP8Ht/O+3IXF6nrHmqLJoQyHKg4UwwKLX?=
 =?us-ascii?Q?7JOUQS5tqEq0Q3vu2tloPNvsNqGsHGchs04nOaKGrLitfi4sU/LSrxNRCRg3?=
 =?us-ascii?Q?0ZvTh/VNou2jA/0LPP9NYBfj6WqLgqy0sagANgs6L0eQz3A9F1UhYNQNlpoz?=
 =?us-ascii?Q?oI16ItuIn5k7kqSb4Ofgmi8nf8VICYDq4/5vWOKCrRawAbmlY/rRsh0z0XNx?=
 =?us-ascii?Q?J1FJdBwte51siI7Iu6IlNWWf/Euz0CFxjGvpBSbeiv08ryvRiVXOoM9up46r?=
 =?us-ascii?Q?J4QWacZlpq0nKsmZxPkF7jkUNzpzksNvBei4DYqmg8bbPdQbfXPt7DKaxGFo?=
 =?us-ascii?Q?tECvEU15twkqL7GEqLkYKVrWbYhkclB/mINGVBSfXkRcopOkUzg/VzR5+Ixp?=
 =?us-ascii?Q?la/8W9ukErM9EYL8r0b/9oGnzLJVhlm9eJjTtY8kkQfemlloNnFQzhlnpW9r?=
 =?us-ascii?Q?lLqOgVPwOyd2bS72K3QXk9jgIW6zemZb2qbSi+OpivAWbYCP7VP84kqEVcpS?=
 =?us-ascii?Q?R6idd05ZUUzucMdaKBjgqTlDi6jUOii5/A2gj+b5REt6cuFl7V4upXqUXcm+?=
 =?us-ascii?Q?mD7aWUR3CPosZ+JRRT//W9KzsarUkr1hhcQ6xEMvS1I0c+bUBW1Azwc04E0z?=
 =?us-ascii?Q?F8c3tx7nXm06u6bCyd75ZGLvYQQOD9Ylgljgbmuj8ABKzfTlTGFlFTXSb69U?=
 =?us-ascii?Q?44QSdLAE+a9MO7sf899wAjj0DPdBo1jbBk0ygCqrHVwQlFJfeAekg6dVgoFF?=
 =?us-ascii?Q?ywPFYv4GFhS0T1Y0yXMEUtFs4Rm9UF4fC2hMHr+9aNqlLa2qHhBLDRLv21Nj?=
 =?us-ascii?Q?Jkbc+vJ1Kw0zPOWK1G1hALj2aRJNktc/hqfQA/B+yLcLTD+ZfaS82sQnKYw7?=
 =?us-ascii?Q?WQdLxwbwIa5QcRURP99jlqjW6gP+PRifXirOLhN4UKsFkDAAjpoD93ttfmg2?=
 =?us-ascii?Q?BYGEcNzsaJmdUmMYsfhf7hhTcF8p2we4fZ4xnRi3A9N0Y/qkIRPBV0E17mZE?=
 =?us-ascii?Q?C4S+UEQTEyNbf8n0Gehp75bqn/7JUBTD/UE1PDZ/PUj9Il3HsAzCiogvwLdM?=
 =?us-ascii?Q?FsIbXMAvkSJJCa3CdFEQ9Du0j/km8Ri80tbQiA5BTj52l1ijFmj3CSusUc21?=
 =?us-ascii?Q?H7QxKrYY0iNhCr0EmCI7pQRb3taFp1vF1pgx3Eeooqq1uyddl014qoS9ZebZ?=
 =?us-ascii?Q?NV0bhCt4IEXumFmO2WdJZTF6cgmpxUdOkCkIXhPcv7XkFf/SfQ7o5WFXKF8L?=
 =?us-ascii?Q?cOFeK58bvg3ABFiW4FWbDrP6IxY9ZIO7JW/uspoA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3202.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21730ab2-7d6c-46b8-1bdf-08da55856d6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 02:01:18.0690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6FGfGnjEOc6w2IPrTrsx5+757wKiXKQOqiw6rQQlZKeA8h4Y7eeTy1orPLEo3FVDZZbFcUz91no3JBkpNN+uZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4286
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> The bug is that we should still enter this loop if "tx_len" is zero.
>=20
> Reported-by: Neal Liu <neal_liu@aspeedtech.com>
> Fixes: c09b1f372e74 ("usb: gadget: aspeed_udc: cleanup loop in
> ast_dma_descriptor_setup()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: Remove the unnecessary "chunk >=3D 0" condition

I mean v1 looks good to me.
Sorry if you are misunderstanding.

>=20
>  drivers/usb/gadget/udc/aspeed_udc.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/usb/gadget/udc/aspeed_udc.c
> b/drivers/usb/gadget/udc/aspeed_udc.c
> index d75a4e070bf7..6ff02acc5662 100644
> --- a/drivers/usb/gadget/udc/aspeed_udc.c
> +++ b/drivers/usb/gadget/udc/aspeed_udc.c
> @@ -476,6 +476,7 @@ static int ast_dma_descriptor_setup(struct ast_udc_ep
> *ep, u32 dma_buf,  {
>  	struct ast_udc_dev *udc =3D ep->udc;
>  	struct device *dev =3D &udc->pdev->dev;
> +	bool last =3D false;
>  	int chunk, count;
>  	u32 offset;
>=20
> @@ -493,14 +494,16 @@ static int ast_dma_descriptor_setup(struct
> ast_udc_ep *ep, u32 dma_buf,
>  	       "tx_len", tx_len);
>=20
>  	/* Create Descriptor Lists */
> -	while (chunk > 0 && count < AST_UDC_DESCS_COUNT) {
> +	while (!last && count < AST_UDC_DESCS_COUNT) {
>=20
>  		ep->descs[ep->descs_wptr].des_0 =3D dma_buf + offset;
>=20
> -		if (chunk > ep->chunk_max)
> +		if (chunk > ep->chunk_max) {
>  			ep->descs[ep->descs_wptr].des_1 =3D ep->chunk_max;
> -		else
> +		} else {
>  			ep->descs[ep->descs_wptr].des_1 =3D chunk;
> +			last =3D true;
> +		}
>=20
>  		chunk -=3D ep->chunk_max;
>=20
> --
> 2.35.1

