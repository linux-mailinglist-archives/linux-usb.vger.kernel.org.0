Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA24665CD0
	for <lists+linux-usb@lfdr.de>; Wed, 11 Jan 2023 14:41:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237682AbjAKNlX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Jan 2023 08:41:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238397AbjAKNkv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Jan 2023 08:40:51 -0500
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2055.outbound.protection.outlook.com [40.107.241.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E50A51B1F6
        for <linux-usb@vger.kernel.org>; Wed, 11 Jan 2023 05:39:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGhMXyShzyHR8ky6QxDm0snDLyg33g9il9hUAdXvjwW6midLpLXTiOn5EkB25UPJH9Ykoci7FC3mGgXzqFglgCrWpGzmYoPmvLbl1fK+hlLZEd1NarPOD8+C/xiIm92C2W4TqbOKsrCjqYccRK6ov44NyYh3y0Cq2ApiJJZvhr07AqU9JK2PVxz1YFXEhH+or6wsO67EwJSx95YCv0hIXNICgtX8qM+2ZxPaR/rmPBeLo3hXaVeZQX1BYZbbQbSWPeMpsjEucaaplYP3nppFgYBt1oOLKsNTPtpGVNHHX+EEadVcbjBGRg/RJgwOaCXLA4BO4D/oKSCFjvbgeDOG4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BAjrSro0v1p6sc7zaJX/vBMrX3oHF6uwTWS2suTiooA=;
 b=gdLISoSVPieqrfKehU9glBD+e1g6GC0OjGF8U0gb3+gBvUovUe9gOeYnvb2nXEVA75Gx6qNNdHFyMAqZATRHHBT0lMMfrscojmWuHBNcqvbK9fjTZ+nTA3edj/nD85K/TYmxGLzWx8h/vTW+NyKL3nnQgAgbkkbNvnxSBbmlNuQvOBAPANeNEdUeMWxvtWUKaOJMToR35sU7+HeSWUg7wMY9y0Cw1MHx6eFKbPPfdCsjLtuIVO7OHI+HeZu0LopUKy54M7BZ65v5jTk+hH+7JHYWoyMpPWOecXPfTLHUr2pplY0csOzCsrR1EAx3cYQR/+dqa7t14IdK67T0Td6DVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BAjrSro0v1p6sc7zaJX/vBMrX3oHF6uwTWS2suTiooA=;
 b=ZvfKzyfJTyoc96Q1GFBn1evAXvFLFFQHQ3QchgUR5fM5mHRCm1eWGgz6K1KeNCyNantByODNQrVw2v5iZ1K0vkn7CugtvPwfJ75pLox2+0yx1lXD4cKiB/E4yb/AyrjT+WfpB5GeYVuUfBx6yqpgPHTRDtEdL4HC/I5WF/Vu0vE=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AS8PR04MB8964.eurprd04.prod.outlook.com (2603:10a6:20b:42f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 13:39:42 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f874:ee07:56fb:cbe0]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f874:ee07:56fb:cbe0%6]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 13:39:42 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH] usb: typec: tcpm: fix create duplicate
 source/sink-capabilities file
Thread-Topic: [EXT] Re: [PATCH] usb: typec: tcpm: fix create duplicate
 source/sink-capabilities file
Thread-Index: AQHZEP7hbKNmhhpCvEyFs9PZaT80zK5v+DIAgAAKJQCAJV9aMIAChUUAgAF0qtA=
Date:   Wed, 11 Jan 2023 13:39:42 +0000
Message-ID: <DB7PR04MB45054764DF733F1CA1EA99558CFC9@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20221216033150.2683718-1-xu.yang_2@nxp.com>
 <acf0485c-8061-ef12-83d9-c3b22dc235ad@roeck-us.net>
 <PA4PR04MB959190B619279B290630D8018CE69@PA4PR04MB9591.eurprd04.prod.outlook.com>
 <DB7PR04MB4505A0A29918EC71FDF5C8BC8CFE9@DB7PR04MB4505.eurprd04.prod.outlook.com>
 <c69a0f75-f8ca-4a91-f363-eb74bc961895@roeck-us.net>
In-Reply-To: <c69a0f75-f8ca-4a91-f363-eb74bc961895@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|AS8PR04MB8964:EE_
x-ms-office365-filtering-correlation-id: c7b27c0b-7b81-4e03-c53d-08daf3d94b2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6qebECrO2lSZo9YMrUfJZZnvv2LoBDvbvXq/8qcQ8VEmU5HT13+ykuEltHZbKLce/UkJEtJfD2mdTg2+cXAhPSXOAYCCy92IgwZRyVImweg4PfEhAZaX+oXofGkexD2bGw/bBCLirqXB7YAilNlcg3U3Sh8laMvxdZ6UfOK4Pp50RDZeAs6anFylX3zPxBTmKo7+ws4hQE9f7bZjRrPth8KK6dCeLAr0HCWcyB+AnxtEiOUPDRP3kjzfUnvNQ8laDPblblkGEFTeT5ZDFRysL1UlA8guKFa6SIwOzmdVjBd3pXA9ALioWZrsmgf4W+GzoZ8EpcoAFYCgqDsPJtRNvQ74m6Khs/9u2cf86xFNAYinJQtw2oARfx2r7sIPq01C2eOtf8sHWGUoOzwN5k7Q6pvOhqec1JkA4mK8KZamAlIK2T8ijsyrgHqndIYixLheUQNZt+iNL6p6678GQMH5NidL59duGU1P44733qlIKU/7+HrHLdiuYAr/3IFv3PUzSeqNtBozaGFIBZlOiYEe+gEzjRiA2CPzCLsBgtlMhKmkdMgPdET7NbpcUhk17HTcLcChJzyg+PjhoJ0w897c2t9tawuRdORnExmsQCfDheEtiyg8DpJcq9N+hiyJYSJsufbUx0v8aDR+KoJ+0XJhqUBLbzJEveNRjO9/eYPTHdTFQCH+/Br0rz++QFYAKWoRCGJpXBv9OkYE3FezlzgAAwGoV0CgtzYjVNYPQcqpB44=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(451199015)(2906002)(83380400001)(9686003)(66446008)(66556008)(66476007)(64756008)(66946007)(33656002)(55016003)(5660300002)(122000001)(52536014)(8936002)(53546011)(186003)(26005)(6506007)(7696005)(478600001)(38100700002)(76116006)(41300700001)(8676002)(54906003)(110136005)(86362001)(38070700005)(316002)(4326008)(71200400001)(8406004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MTRqN3BucHNuZkw4Z1QvRUtBUXpmeDh3bUxzUm9nQ1E3TkFCbWk5Ni9KK1Q1?=
 =?utf-8?B?NDhBN3hSTUk5Ulk0WUFTZ3RUci81c2R2a2dKU0xxUWNqNktNZ1J3WElxRDJv?=
 =?utf-8?B?Rk5WQUh2aFU0dmhDcnJUY25IaUJFdThnRzdYMVNRWmFqMzhBaVBmV1RCZFMx?=
 =?utf-8?B?U1duRXd0cm55VjJlL0J3OUloMkY2RXRFbkJqQitkU3hmR0xYUGVLNnJsQWVM?=
 =?utf-8?B?YzZEUTdZdUdYTzRRWksrVkFLc0NJTmVZMHc3RU1uUTdVU0ZTdXd2Q0w1a3Zn?=
 =?utf-8?B?QTg2V0Y1QmZwTkI2QjZyd3pOQ3l3OEtUUk9CUm5seGJINVdiL29HakUyeFNN?=
 =?utf-8?B?dE5YaDdoaTJwZTljdDlqVDhrVWZ5RlVIUXptVWNlTjJJYTJ4MnRKVm5QdVBX?=
 =?utf-8?B?ZWRvMExmNGFTb2pvQ1luVDAyYUdDZkl1YWVLdnJpWTl6VlRDVjNmZzJ4cGMx?=
 =?utf-8?B?TFowRUVwSDA4ZlZoUldOdkJ6RitSVE5RcGx4NUsvaTFrVkxzNFVMSEFHaUVr?=
 =?utf-8?B?eXp0RHZwREFvaEUxSTNRbXVpWGlWMHdMVE1rNU0yTTdWekFjRGVXVEVhUFpj?=
 =?utf-8?B?ZnVLc1VEcC9tZUdiVklRcVFtTXRPbVI4b1IxUW03S2VOcDJJUTBwVWJCYzdT?=
 =?utf-8?B?WGI2YTVlRVNtYlNoU05BNUdWbkFCQi9JeTM5dFZQZlB3QzVUclVoNzJBUkVt?=
 =?utf-8?B?MkZma0M0Q1JZU0RZQStJcjlkL09PazFwWXR4R2xtRk9xczRhZ0pIQWhRdDh3?=
 =?utf-8?B?aCtvcmI4em8zYTEvNWZOYTVhYmtlTnNSZUlxMDRGT3EzMDhmR3ZGRlduUGsr?=
 =?utf-8?B?UU1pMmtHakkveEN6M2J4Y1ZLekZDeFNwMHdBNXlvdnpNd2VyM0J6SGRnQXcv?=
 =?utf-8?B?MnhkenUxN3lzLzFyOWFhTHBqSG1hajNoalV5SHd2eDE2ZTJsNlZ0NWRBdDl3?=
 =?utf-8?B?NkdTMUY4RTZlZnRhYytCRnUwTVg4R0I0djc4Q2k1T05scDBUbGo3OEo0WGd0?=
 =?utf-8?B?UFVuOUtRS0lwamQ4dFVmeU12NTZSZWJpeGtZWHEwdWYveW5YM25rTm90aDYv?=
 =?utf-8?B?cHBNMDBwaHdRdW50WEdSRUl6c21CMmdTS1MrTmtvU09RYmNOdWRPRkFjZzlu?=
 =?utf-8?B?MGttelowOGxwS1YyaTNndnJHSWlraDdjVlR2T203eWh1UDcrbGt6MUlKREtw?=
 =?utf-8?B?RjhGeXJsNEtZSnFoY3Jlc2t2VzY4RVBhOU1qR25OWVJNUWY3OWkyTTl5bEpK?=
 =?utf-8?B?dnZmZldPanNNZ20welNyNVl3b1dXK2VSYnZGZ2V6bjE2elBQQXJzWVA5WWxM?=
 =?utf-8?B?V0R1ak9vRi9hWVhlSHNYODNCVXFpNFpNUmpiWTA3bmxKRm5DVnExa1JUZzA5?=
 =?utf-8?B?emR4MG8rZ2lHR2k5Q2ZCVE1mTmF2YlA4VEtscjRvWDI5VmtJcU9FLzVHencx?=
 =?utf-8?B?WHlkd0puQWxGc0o4akN5aGwwd0tQWmsrZlA4cTEzd2swSFBlN2JiakcwSmw5?=
 =?utf-8?B?RTRMaWY1b21DZEY2SnFEQ1BjVlVaRkcveEZMSVZNczd5ai9QSmEzYjROOHRn?=
 =?utf-8?B?dkRiOG9IZGFGQWtid0wzVEllUU54dTF2Tm5NVjhFTUhIenZlV096VldpVE93?=
 =?utf-8?B?K2pMd1FhUjdOMUZtNUR6cFFPZHhNQUxpREdwRFlNUnV3MzVsQUREWEU0OE84?=
 =?utf-8?B?Qjljcno5SEE1aWZVdzhtYmdpaFlDd3BuUEpoVUNRMVlQV3NLM011MXNCMVA4?=
 =?utf-8?B?M20ra3I4ZDRWSFBqS0RYYXY3MVlTNzl2Q0E2cm12RWU4ditzK2JjUUpUbUlV?=
 =?utf-8?B?M3NaTXhzSjVGZ2lLWm5xZHJrYXg4THVTQ0x1STBkZjUvV3JFT0MwOENKcTU4?=
 =?utf-8?B?OWx2ZHNvdEJGYVlYK1VKR0JUWER1U2t2MWR3bE93b0lhNlUzaHA2dlhIZENv?=
 =?utf-8?B?SlBSaEp3ek10dXdzOVdjWkpyZnB3MXM5OW12UUFlbUJyb1FSNEg2OU94eTFY?=
 =?utf-8?B?VHpFZmVWdGF3K1JHaHpYVFVxVkg1T2llT1hBZW1SdnVLcmhMNHhIMENCNm1Y?=
 =?utf-8?B?WTV1UWp0UmdpMVpZYUVwSmtQSGFVQnRJRitxWDZlcUxjdDgvdDl3VU9NampJ?=
 =?utf-8?Q?7CyU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b27c0b-7b81-4e03-c53d-08daf3d94b2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2023 13:39:42.0777
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lF9e0QVoHPCvHGSMumtyujBy72+L5xqcfbJQpCiI5V0PTqetv2MudzRF+1yIhYBG9F0NwMfhlb3P61LfhGHRrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8964
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHdWVudGVyIFJvZWNrIDxncm9l
Y2s3QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIEd1ZW50ZXIgUm9lY2sNCj4gU2VudDogVHVlc2Rh
eSwgSmFudWFyeSAxMCwgMjAyMyAxMTowMiBQTQ0KPiBUbzogWHUgWWFuZyA8eHUueWFuZ18yQG54
cC5jb20+OyBoZWlra2kua3JvZ2VydXNAbGludXguaW50ZWwuY29tDQo+IENjOiBncmVna2hAbGlu
dXhmb3VuZGF0aW9uLm9yZzsgbGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsgZGwtbGludXgtaW14
IDxsaW51eC1pbXhAbnhwLmNvbT47IEp1biBMaSA8anVuLmxpQG54cC5jb20+DQo+IFN1YmplY3Q6
IFJlOiBbRVhUXSBSZTogW1BBVENIXSB1c2I6IHR5cGVjOiB0Y3BtOiBmaXggY3JlYXRlIGR1cGxp
Y2F0ZSBzb3VyY2Uvc2luay1jYXBhYmlsaXRpZXMgZmlsZQ0KPiANCj4gQ2F1dGlvbjogRVhUIEVt
YWlsDQo+IA0KPiBPbiAxLzgvMjMgMTY6MzUsIFh1IFlhbmcgd3JvdGU6DQo+ID4gSGksDQo+ID4N
Cj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogWHUgWWFuZw0KPiA+
PiBTZW50OiBGcmlkYXksIERlY2VtYmVyIDE2LCAyMDIyIDI6NDEgUE0NCj4gPj4gVG86IEd1ZW50
ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD47IGhlaWtraS5rcm9nZXJ1c0BsaW51eC5pbnRl
bC5jb20NCj4gPj4gQ2M6IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOyBsaW51eC11c2JAdmdl
ci5rZXJuZWwub3JnOyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPjsgSnVuIExpIDxq
dW4ubGlAbnhwLmNvbT4NCj4gPj4gU3ViamVjdDogUkU6IFtFWFRdIFJlOiBbUEFUQ0hdIHVzYjog
dHlwZWM6IHRjcG06IGZpeCBjcmVhdGUgZHVwbGljYXRlIHNvdXJjZS9zaW5rLWNhcGFiaWxpdGll
cyBmaWxlDQo+ID4+DQo+ID4+IEhpIEd1ZW50ZXIsDQo+ID4+DQo+ID4+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+Pj4gRnJvbTogR3VlbnRlciBSb2VjayA8Z3JvZWNrN0BnbWFpbC5j
b20+IE9uIEJlaGFsZiBPZiBHdWVudGVyIFJvZWNrDQo+ID4+PiBTZW50OiBGcmlkYXksIERlY2Vt
YmVyIDE2LCAyMDIyIDE6MTMgUE0NCj4gPj4+IFRvOiBYdSBZYW5nIDx4dS55YW5nXzJAbnhwLmNv
bT47IGhlaWtraS5rcm9nZXJ1c0BsaW51eC5pbnRlbC5jb20NCj4gPj4+IENjOiBncmVna2hAbGlu
dXhmb3VuZGF0aW9uLm9yZzsgbGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsgZGwtbGludXgtaW14
IDxsaW51eC1pbXhAbnhwLmNvbT47IEp1biBMaSA8anVuLmxpQG54cC5jb20+DQo+ID4+PiBTdWJq
ZWN0OiBbRVhUXSBSZTogW1BBVENIXSB1c2I6IHR5cGVjOiB0Y3BtOiBmaXggY3JlYXRlIGR1cGxp
Y2F0ZSBzb3VyY2Uvc2luay1jYXBhYmlsaXRpZXMgZmlsZQ0KPiA+Pj4NCj4gPj4+IENhdXRpb246
IEVYVCBFbWFpbA0KPiA+Pj4NCj4gPj4+IE9uIDEyLzE1LzIyIDE5OjMxLCBYdSBZYW5nIHdyb3Rl
Og0KPiA+Pj4+IEFmdGVyIHNvZnQgcmVzZXQgaGFzIGNvbXBsZXRlZCwgYW4gRXhwbGljaXQgQ29u
dHJhY3QgbmVnb3RpYXRpb24gb2NjdXJzLg0KPiA+Pj4+IFRoZSBzaW5rIGRldmljZSB3aWxsIHJl
Y2VpdmUgc291cmNlIGNhcGFiaWxpdHlzIGFnYWluLiBUaGlzIHdpbGwgY2F1c2UNCj4gPj4+PiBh
IGR1cGxpY2F0ZSBzb3VyY2UtY2FwYWJpbGl0aWVzIGZpbGUgYmUgY3JlYXRlZC4NCj4gPj4+Pg0K
PiA+Pj4+IEFuZCB0aGUga2VybmVsIHdpbGwgZHVtcDoNCj4gPj4+PiBzeXNmczogY2Fubm90IGNy
ZWF0ZSBkdXBsaWNhdGUgZmlsZW5hbWUgJy9kZXZpY2VzL3ZpcnR1YWwvdXNiX3Bvd2VyX2RlbGl2
ZXJ5L3BkMS9zb3VyY2UtY2FwYWJpbGl0aWVzJw0KPiA+Pj4+DQo+ID4+Pj4gVGhpcyB3aWxsIHVu
cmVnaXN0ZXIgZXhpc3RpbmcgY2FwYWJpbGl0aWVzIGJlZm9yZSByZWdpc3RlciBuZXcgb25lLg0K
PiA+Pj4+DQo+ID4+Pj4gRml4ZXM6IDgyMDNkMjY5MDVlZSAoInVzYjogdHlwZWM6IHRjcG06IFJl
Z2lzdGVyIFVTQiBQb3dlciBEZWxpdmVyeSBDYXBhYmlsaXRpZXMiKQ0KPiA+Pj4+IGNjOiA8c3Rh
YmxlQHZnZXIua2VybmVsLm9yZz4NCj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBYdSBZYW5nIDx4dS55
YW5nXzJAbnhwLmNvbT4NCj4gPj4+PiAtLS0NCj4gPj4+PiAgICBkcml2ZXJzL3VzYi90eXBlYy90
Y3BtL3RjcG0uYyB8IDYgKysrKysrDQo+ID4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKQ0KPiA+Pj4+DQo+ID4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL3R5cGVjL3Rj
cG0vdGNwbS5jIGIvZHJpdmVycy91c2IvdHlwZWMvdGNwbS90Y3BtLmMNCj4gPj4+PiBpbmRleCA5
MDRjN2I0Y2UyZjAuLjAyZDhhNzA0ZGI5NSAxMDA2NDQNCj4gPj4+PiAtLS0gYS9kcml2ZXJzL3Vz
Yi90eXBlYy90Y3BtL3RjcG0uYw0KPiA+Pj4+ICsrKyBiL2RyaXZlcnMvdXNiL3R5cGVjL3RjcG0v
dGNwbS5jDQo+ID4+Pj4gQEAgLTIzNzEsNiArMjM3MSw5IEBAIHN0YXRpYyBpbnQgdGNwbV9yZWdp
c3Rlcl9zb3VyY2VfY2FwcyhzdHJ1Y3QgdGNwbV9wb3J0ICpwb3J0KQ0KPiA+Pj4+ICAgICAgICBp
ZiAoSVNfRVJSKHBvcnQtPnBhcnRuZXJfcGQpKQ0KPiA+Pj4+ICAgICAgICAgICAgICAgIHJldHVy
biBQVFJfRVJSKHBvcnQtPnBhcnRuZXJfcGQpOw0KPiA+Pj4+DQo+ID4+Pj4gKyAgICAgLyogcmVt
b3ZlIGV4aXN0aW5nIGNhcGFiaWxpdGllcyBzaW5jZSBnb3QgbmV3IG9uZSAqLw0KPiA+Pj4+ICsg
ICAgIHVzYl9wb3dlcl9kZWxpdmVyeV91bnJlZ2lzdGVyX2NhcGFiaWxpdGllcyhwb3J0LT5wYXJ0
bmVyX3NvdXJjZV9jYXBzKTsNCj4gPj4+PiArDQo+ID4+Pj4gICAgICAgIG1lbWNweShjYXBzLnBk
bywgcG9ydC0+c291cmNlX2NhcHMsIHNpemVvZih1MzIpICogcG9ydC0+bnJfc291cmNlX2NhcHMp
Ow0KPiA+Pj4+ICAgICAgICBjYXBzLnJvbGUgPSBUWVBFQ19TT1VSQ0U7DQo+ID4+Pj4NCj4gPj4+
PiBAQCAtMjM5NCw2ICsyMzk3LDkgQEAgc3RhdGljIGludCB0Y3BtX3JlZ2lzdGVyX3NpbmtfY2Fw
cyhzdHJ1Y3QgdGNwbV9wb3J0ICpwb3J0KQ0KPiA+Pj4+ICAgICAgICBpZiAoSVNfRVJSKHBvcnQt
PnBhcnRuZXJfcGQpKQ0KPiA+Pj4+ICAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHBvcnQt
PnBhcnRuZXJfcGQpOw0KPiA+Pj4+DQo+ID4+Pj4gKyAgICAgLyogcmVtb3ZlIGV4aXN0aW5nIGNh
cGFiaWxpdGllcyBzaW5jZSBnb3QgbmV3IG9uZSAqLw0KPiA+Pj4+ICsgICAgIHVzYl9wb3dlcl9k
ZWxpdmVyeV91bnJlZ2lzdGVyX2NhcGFiaWxpdGllcyhwb3J0LT5wYXJ0bmVyX3NpbmtfY2Fwcyk7
DQo+ID4+Pj4gKw0KPiA+Pj4+ICAgICAgICBtZW1jcHkoY2Fwcy5wZG8sIHBvcnQtPnNpbmtfY2Fw
cywgc2l6ZW9mKHUzMikgKiBwb3J0LT5ucl9zaW5rX2NhcHMpOw0KPiA+Pj4+ICAgICAgICBjYXBz
LnJvbGUgPSBUWVBFQ19TSU5LOw0KPiA+Pj4+DQo+ID4+Pg0KPiA+Pj4gU2hvdWxkbid0IHVzYl9w
b3dlcl9kZWxpdmVyeV91bnJlZ2lzdGVyX2NhcGFiaWxpdGllcygpIGJlIGNhbGxlZCBmcm9tDQo+
ID4+PiB0aGUgU09GVF9SRVNFVCBzdGF0ZSBoYW5kbGVyID8NCj4gPj4NCj4gPj4gQWx0aG91Z2gg
dGhpcyBpc3N1ZSBpcyB0cmlnZ2VyZWQgYnkgc29mdCByZXNldCBldmVudCwgdGhlcmUgaXMgYWxz
bw0KPiA+PiBvdGhlciBwb3NzaWJpbGl0aWVzIHdoaWNoIG1heSBwcm9kdWNlIHRoaXMgYmVoYXZp
b3IuIFN1Y2ggYXMgcmVjZWl2ZWQNCj4gPj4gMnJkIHNvdXJjZSBjYXBhYmlsaXR5IG9yIHVzZSBH
ZXRfU291cmNlX0NhcCBtZXNzYWdlLiBJdCdzIGEgZHluYW1pYw0KPiA+PiBwcm9jZXNzIGV2ZW4g
YWZ0ZXIgc291cmNlL3NpbmsgaXMgcmVhZHkuIFNvIEkgdGhpbmsgaXQncyBiZXR0ZXIgdG8gaGFu
ZGxlDQo+ID4+IGl0IGluIHRjcG1fcmVnaXN0ZXJfc291cmNlL3NpbmtfY2FwcygpLiBOb3Qgc3Vy
ZSBpZiB0aGlzIGlzIHJlYXNvbmFibGUuDQo+ID4+DQo+ID4+IFRoYW5rcywNCj4gPj4gWHUgWWFu
Zw0KPiA+DQo+ID4gRG8geW91IGhhdmUgYW55IG90aGVyIGNvbW1lbnRzIG9yIHN1Z2dlc3Rpb25z
IHdpdGggdGhpcyBwYXRjaD8NCj4gPg0KPiANCj4gRmlyc3Qgb2YgYWxsLCB0aGUgY3VycmVudCBj
b2RlIGlzIG9idmlvdXNseSB3cm9uZy4gSWYgc29mdCByZXNldCByZXN1bHRzIGluDQo+IHBkIGNh
cGFiaWxpdGllcyB0byBiZSBpbnZhbGlkLCB0aGF0IHNob3VsZCBiZSBoYW5kbGVkIGluIHNvZnQg
cmVzZXQsDQo+IGp1c3QgbGlrZSBpdCBpcyBoYW5kbGVkIGluIGhhcmQgcmVzZXQuIE90aGVyd2lz
ZSB0aGVyZSB3b3VsZCBiZSBzdGFsZSBwZA0KPiBkZXZpY2VzIGFyb3VuZCB3aGljaCBhcmUgbm8g
bG9uZ2VyIHZhbGlkLg0KPiANCj4gU2Vjb25kLCBpZiBpdCBjYW4gaW5kZWVkIGhhcHBlbiB0aGF0
IG11bHRpcGxlIHNvdXJjZSBjYXBhYmlsaXRpZXMNCj4gbWVzc2FnZXMgYXJlIHJlY2VpdmVkLCB0
aGlzIHNob3VsZCBiZSBoYW5kbGVkIGFzIGRlZmluZWQgYnkgdGhlIHByb3RvY29sLg0KPiBFaXRo
ZXIgdGhlIHNlY29uZCBzZXQgb2YgbWVzc2FnZXMgaXMgZXhwZWN0ZWQgdG8gYmUgaWdub3JlZCwg
b3IgaXQgaXMNCj4gZXhwZWN0ZWQgdG8gcmVwbGFjZSBleGlzdGluZyBjYXBhYmlsaXRpZXMuIEVp
dGhlciBjYXNlLCB0aGF0IHNpdHVhdGlvbg0KPiBzaG91bGQgYmUgaGFuZGxlZCBjb25zY2lvdXNs
eTogdW5yZWdpc3RlcmluZyBhbmQgcmUtcmVnaXN0ZXJpbmcNCj4gY2FwYWJpbGl0aWVzIHJlc3Vs
dHMgaW4gcmVtb3ZhbCBhbmQgcmUtY3JlYXRpb24gb2YgZGV2aWNlcy4gSnVzdCBkb2luZw0KPiB0
aGF0IHVuY29uZGl0aW9uYWxseSBldmVuIGlmIHVubmVjZXNzYXJ5IChpZiBjYXBhYmlsaXRpZXMg
YXJlIHRoZSBzYW1lKQ0KPiBuZWVkcyBtb3JlIGRpc2N1c3Npb24sIGFuZCBzaG91bGQgbm90IGJl
IGhpZGRlbiBpbiBhbm90aGVyIHBhdGNoIHdoaWNoDQo+IGlzIHN1cHBvc2VkIHRvIGFkZHJlc3Mg
YSBkaWZmZXJlbnQgcHJvYmxlbS4NCg0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLiBBY2NvcmRp
bmcgdG8gdGhlIHByb3RvY29sICwgaXQncyBub3QgcG9zc2libGUNCmZvciB0aGUgc291cmNlIHRv
IHNlbmQgbXVsdGlwbGUgY2FwYWJpbGl0aWVzLiBVbmxlc3MgdGhlIHNvdXJjZSBkb2Vzbid0DQpm
b2xsb3cgdGhlIHJ1bGUuIFRoYXQgaXMgaW5kZWVkIGFub3RoZXIgcHJvYmxlbS4gSSBhZ3JlZSB3
aXRoIHlvdSB0aGF0DQppdCBzaG91bGQgYmUgaGFuZGxlZCBpbiBzb2Z0IHJlc2V0IGhhbmRsZXIg
aWYgc29mdCByZXNldCByZXN1bHRzIGluIHBkDQpjYXBhYmlsaXRpZXMgdG8gYmUgaW52YWlsZC4g
SSB3aWxsIHByZXBhcmUgYSB2MiBmb3IgdGhpcyBjYXNlLg0KDQpUaGFua3MsDQpYdSBZYW5nDQoN
Cj4gDQo+IEd1ZW50ZXINCg0K
