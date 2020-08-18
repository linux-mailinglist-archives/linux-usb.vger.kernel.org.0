Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D088248289
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 12:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgHRKF4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 06:05:56 -0400
Received: from mail-eopbgr50077.outbound.protection.outlook.com ([40.107.5.77]:16417
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726043AbgHRKFz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Aug 2020 06:05:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQBBMAxSoZTF7y35doZNcNeUHrQ0E462CeS4RRpaxsN2u1xJ27F/uZhdCK5uvP2IRA01DKhy+d73IfNJSC96K6kY7BO73PE4I0BQfN4Y+bGQhnMfQTgPvo/je7zXf6mbOFihKtKXajzoIlfTtvViN02PJED2CYxcyC0cQcy0Jsw2ijkfpegiHqAbEJcUWGfismxyAh2iHSzqa/kTQjQCrSOlC+lSKvalMxiYAoUEh7haSmn6CkhuQpMJBsQ4Nmje8hdJUJ6LUMaz4uJP+s5vjLLyHdzn8McqjXROov5/7W+ayDm0Svgfs2//QB0u77dN8Vg/Ue89zDwSlwYf8+tzEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXxWDy2s9rnZqTivYlVWbphROn9SNoeTjZp26k8lTRo=;
 b=aL28J+Nh8fz3TzQNc9k4bjQcPMgDo5vHzx1w/RT/4ZgBgr7pal9tvCe8WwB+vBhja/SECz3Zf967YXdRjdSzy70uP2MPmXla29pMHVhswfEAyRvO1DLp8I2TJsV2USBBA3qryAJ5e6wk75qnbT+mJ43ATeqxvUKFVLEZidG6M8QLBCMq0IMPCcvtSDUPSV5iPq4DzuiNLwQn1rH51pyh2o9N8ufNNTNCl4A5hotZtekgSv05VHFvyAbjFrPuL97SzP8tKwQUiT3q1Y3n4FIeoa6QioZfwLt0+Zpc7M+GbvSju9ZzmB65Pq8S0En4IG7EsJW0NB7Aw59fpIA2mFSvQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXxWDy2s9rnZqTivYlVWbphROn9SNoeTjZp26k8lTRo=;
 b=syY6rB4bCC/xTrJ79bcS9H8ytQQk/Ofej6JsFaMREUocD9BPRI6FRKJzULlIHIUUuEzEPpDLkcVv+5SzPSMhQcyJswugGDm2yNWjTRPMft+0AaA5+OlYGveHxZGdMBXl6hA+/AZJh49eXMWOedy3/MA5nZZt6DjSdGdACd/feXI=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR0402MB3429.eurprd04.prod.outlook.com (2603:10a6:209:6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Tue, 18 Aug
 2020 10:05:51 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 10:05:51 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
Subject: RE: [PATCH v2 6/6] Revert "usb: udc: allow adding and removing the
 same gadget device"
Thread-Topic: [PATCH v2 6/6] Revert "usb: udc: allow adding and removing the
 same gadget device"
Thread-Index: AQHWbr2o/fJ02AbWoEyqinkW1JML5ak9p6qAgAAIBWA=
Date:   Tue, 18 Aug 2020 10:05:51 +0000
Message-ID: <AM7PR04MB7157182367D7EEE2BDAD53318B5C0@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <20200810022510.6516-1-peter.chen@nxp.com>
 <20200810022510.6516-7-peter.chen@nxp.com> <20200818093305.GA34785@kroah.com>
In-Reply-To: <20200818093305.GA34785@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [218.82.62.103]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8eddb782-5538-442c-8514-08d8435e49c8
x-ms-traffictypediagnostic: AM6PR0402MB3429:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR0402MB34296F12720F14C6973D61BB8B5C0@AM6PR0402MB3429.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kpzhakZ7dPJNBHoYJQw7RRcqmOw1ocCCR6fG4Hav7bvSapTuJ5GdLb6IWMX3gexUl7MQ37K0AxTlpavuYzcqRxeJxOO/4PFNdjuufLHO8BK7NEfNuZgRYyJw4dCZhAyCVIecx37i8z8w6FFm6G88YuhX39oeAGKtrFKpqKeNdE4qYu6miXZgb5pxbx/o904Fgbhog8TnpHu0vgrbDLVPw8fOyuzVD3pmP/CQzUoZ5hvUnM3JhqTsDH1k6hAK5sTHr0tD7qIJr2gqkFL5hW9CqxdbocyVEcDCQObJkvmQanMhCK7tBmm1/3xr39s7JXe3
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(55016002)(71200400001)(4326008)(54906003)(6916009)(478600001)(66946007)(8936002)(8676002)(9686003)(5660300002)(316002)(66556008)(7696005)(66476007)(66446008)(86362001)(64756008)(33656002)(4744005)(44832011)(186003)(6506007)(76116006)(52536014)(26005)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: rGqYq7hsB/U+cQJ/8XDeD05dc2+9HbbdJuxGI9SbtEkXKVoIk87UvW3ZNC0KLd9+IhZ87jT2TG10LeIreyzfqdJq1RNg/qcgaJD4cYUE74FsnbB4TW0Lu77uQ6COIZtWN6KvIQXHmlXNRwUj6ggM0L8tJ3twM2+8KRiEASp7P+kiYTGERZ8NRpqJUm2IzVH9r3Mq2uLWR9tU/LKqZFQubEOywF49yucVHjIXJZ2md+DiE/T0rZxREN2AommPJ+wCoSzYfyZsUc1DuKWG0Khq4wVMLjIk6RRwHa7RORV+69WUoVe2c/XqZ9NLG92XLlaAITsQhnkI5AKqKNshmlwYtNckY+IxsQvKBqPV+Ca88A0H6DB/DqqoAOzYaErqWJMU/nNPwmTZ53jcINgIQrK+Fw2LgysG0TFEERyf7FoAGOFxY9sE2a1J4Ac0SjFMH6TFCwkZUpfj53eMx33Zprn/Ahh/X6GIbjdSA4IehuN4UZISQtHTQ6DE2Dhc9Kh+EsnFnEUVcXGAThd7l8jp3hUoXwxn0o1l1IUig5xopPzkXWiB90byvXuToS4m7zR0Yv+YPDyOtM0qroBH5yj2BoBbG4LNFyud/JOpwQYU3tjxbtKyboi/V6m5cMWWfGHorP7HsgkrnCFN87NHArcU4cZVTQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eddb782-5538-442c-8514-08d8435e49c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2020 10:05:51.6361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sX6yf4pCefFHDvybOq2r/jDe6uNqoF77tW1weZtxCFVm2LExmwG3rsx1DXTDtxXtYjR/p03oEG3WjIkWB5CrFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3429
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
> >
> > diff --git a/drivers/usb/gadget/udc/core.c
> > b/drivers/usb/gadget/udc/core.c index 473e74088b1f..43351b0af569
> > 100644
> > --- a/drivers/usb/gadget/udc/core.c
> > +++ b/drivers/usb/gadget/udc/core.c
> > @@ -1386,7 +1386,6 @@ void usb_del_gadget_udc(struct usb_gadget
> > *gadget)  {
> >  	usb_del_gadget(gadget);
> >  	usb_put_gadget(gadget);
> > -	memset(&gadget->dev, 0x00, sizeof(gadget->dev));
>=20
> Shouldn't you do this patch earlier in the series, as the
> usb_put_gadget() call could have freed the memory that is being cleared h=
ere?
>=20

If I did it earlier, it would cause dwc3 break if people do 'git bisect', d=
wc3 issue is
fixed at patch 5.

Peter

> Otherwise, this series looks good, thanks for doing it.
>=20
> greg k-h
