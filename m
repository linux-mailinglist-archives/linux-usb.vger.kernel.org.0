Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55DD9728DAF
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jun 2023 04:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbjFICPT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Jun 2023 22:15:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238385AbjFICO7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Jun 2023 22:14:59 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2057.outbound.protection.outlook.com [40.107.105.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76858C2
        for <linux-usb@vger.kernel.org>; Thu,  8 Jun 2023 19:14:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3xlcVB7iG6Fl9YfHeJs6QEyEjLv6cOl/swzrMMumsk6rHPz7X02FJzwNO8djBq3a61bSDvQjg5gvGj+RPjqnugxV6CNStsn3efjr/Tu9iAKk/PXOtERfWBZ8+aZ0iEf1P9LiqwAZ7ftdKLQ4icRV/etWAU3xdfyRU6K6jeg3i3CuLa493NQ8v4FyEDxsMy+mpLx8BvXqjeftBHs7HENXvcj1Cjz6tv4qXTBv4OjfTJ/aP7LxpUXYCTZ+sgg5Aj0OEcs/IN5P7WL9kXtA+2VlRaNIJEDmFL4MvArQ2lceYzhtZzapEgv8oTeIMNIJYUIKY+XVo2/G6+ya0nahG64rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IG30V1MbtcpvIfVZhiMhh5xcwe8MDvSYVl/6TJWPg0w=;
 b=aU8UGP+Nw+j38Nx1FXc5dzHn/nwPB18mKPjMXukXxwenkdYP1twTNDPODG6HWxGJTTHh6jyqf+Axe1gtzmR7LXkq5TFKy+mNMK2x7yLHl8HDUoOi/yZHOd1ZL5YsidgBzEY0oB/I3QyQwGLCTclWpoHboGEH/EZVD0gxwIXzkC0bk53sBBPnPEbKsPamaxaChfeAPKYt/TnTP4I0W9AhARW5hf/AUFIsJgUczg8UJR3ya4c83zBvV5xC7Ji5oElpblYi+nfafb2s2kuJEyeonNbKqb0ix5T4a26EMxf3kj27Gr1X1n42dPKlO32VaPaeOpfkvoI6TB6dITdrxVD37Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IG30V1MbtcpvIfVZhiMhh5xcwe8MDvSYVl/6TJWPg0w=;
 b=HZIHsOjeHx8qU2LaU8mw3brmyV9+M4ogxZ5qAWzJtijmqvrfMDG3f4P/wqnmpzmfzQDpc/HAOXIpHDnL8uAYLiRCTa0XwaYPtH2BzhU6XdvE6vO2B5qzHU1BSICKTMCheGqygM50pXiPmtFBl054yfPHv735y1V1ALiJKZ7DXW8=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AS8PR04MB7496.eurprd04.prod.outlook.com (2603:10a6:20b:29d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 02:14:55 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 02:14:55 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>, Zhipeng Wang <zhipeng.wang_1@nxp.com>,
        Faqiang Zhu <faqiang.zhu@nxp.com>
Subject: RE: [EXT] Re: [PATCH] usb: typec: tcpci: allow drp toggling for
 non-drp port
Thread-Topic: [EXT] Re: [PATCH] usb: typec: tcpci: allow drp toggling for
 non-drp port
Thread-Index: AQHZmfv2XcNX5Iuf6UWaOH7ssz4VQq+A5P+AgADPfnA=
Date:   Fri, 9 Jun 2023 02:14:55 +0000
Message-ID: <DB7PR04MB450545D417BC401B92335F7C8C51A@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230608112858.4405-1-xu.yang_2@nxp.com>
 <0330ffea-d258-8fb8-ff89-5ebb0388f1ff@roeck-us.net>
In-Reply-To: <0330ffea-d258-8fb8-ff89-5ebb0388f1ff@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|AS8PR04MB7496:EE_
x-ms-office365-filtering-correlation-id: 216a05cc-e714-4cda-da97-08db688f5167
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1H8MjvPXHMY5zCTi7Z0XaikZq923f5HYwHBAocJ1FaDDNMBa3sRQN2bK4zhNs4933SXw9gLhgApzOVSPnacOujnIs99isMRQ1mcGQfrm5snUXAiMzDXt4/zWhkqg9R7uC8PLzICKcESOz+QmftVo473kBfzQc+sgvHS5aES8yFJtJAEdjFGQX0jY0lbWn6J4YnKdh0tEEVc/Bw4YbpC80MzwQEeALokXm0maYRvzLThKM8nvHe8cWNYp2iLL+pFk79KaWR4GEyBZqprHBntgeL3K+zTFEKM86EswFtJBGbJolk2CY+XrpAlajQGOMOMEyE9tNJ0xYQXR6nktRLbo32iV3vl9roOcWBiHfhu5FYVAHO9T8zMPeXXXXsQu1irDX2tZAyOYUSf2kZmolElr33BIE29ybNL8quoWV8zBcSLoB8R+POVBgOorux05m3tAY1y0dNxRsuFJnQtolLwD5zBtqDwS5OzkUjRGZggQVucUvEx5yNBoX7SVxNUQOiwfbdhRq83WGRlRRT6yOnoJZ+TWVJfwah6Q/WC7RIZo9I3llCWCrWLATwY7znJjt77r5hKfmAfRHd5O2nK7G1OPZD22aQGyUs2pnN+y8+uG/7FQ8l9TyOUI6pc/4EIkD/H6
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(451199021)(41300700001)(71200400001)(5660300002)(52536014)(8936002)(8676002)(110136005)(4326008)(66946007)(66556008)(76116006)(64756008)(316002)(66476007)(54906003)(66446008)(478600001)(2906002)(7696005)(38100700002)(55016003)(53546011)(9686003)(186003)(6506007)(83380400001)(33656002)(38070700005)(26005)(122000001)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXFIUEhPK3I2VTNkdWNjd0sxRWJwWWt3bWhJVGthZDNIdlBnYmhBODVxZXFl?=
 =?utf-8?B?STNrbHdWRlZhTDBIVGpQcC9wVjJCSU1CUWgybFRIRytZby85MnUrc2gxVmFQ?=
 =?utf-8?B?Y1hCajJkL0tjUEJwelpvN2hTS3oyWDlnclh6c0NZUE9qb21kYURhSjhtNklw?=
 =?utf-8?B?QUxVNFYzbzRYSG1Nby95N3BZSmJ1ZXJBVjByZHNIUkFyV3ZVZlZ2UDh5dTlE?=
 =?utf-8?B?cjkxSmVZWWlOdjV4L2didmZwcEdZa1gvczIvanFXQlNOaDYwYzZRYmtyc0dC?=
 =?utf-8?B?YXp2YkZQVHdjY1B0QzVyU1p0TXFaREx4OWlyRDlMSFZVU0Q1dFZNc2U1OFJK?=
 =?utf-8?B?R213QmN4SnlDVzM0WHMzZUxid1puQkVFOUoxRnQwaVBYS1BLbmdTbytrZ1ZC?=
 =?utf-8?B?ZUhYTHdEL3dLdkY3Z3BreWwyZGJRbkZ0b3gwdWJtMExKRmt0WmVGTEx0YjVB?=
 =?utf-8?B?Mkhpblh6OEVkUkRQVnRXb3oxMFUvWFByV2tvUmVvWEx1cmg1TC9YcmhnSHkv?=
 =?utf-8?B?Zzl1cjVETllkZHJnM3NGMlhySDZmUDJCdTVKMFhzU0ZlVjNoNXJ2VWhxQlAy?=
 =?utf-8?B?TTFlVG9GQkVUWnZZbGdTT3FVcXZyaWxtUzlHWXlVRTRGT0Y0OVg0LzR0cW4r?=
 =?utf-8?B?cmgvajBPRFMvR21Ra1ZzMndTNXh4MWhLN0Q1cUJ4dVRiWncyeE05OTFwU1c4?=
 =?utf-8?B?VGkxM0hVaG1PMS9IRGVCMTllZDNBWHMwWkNPN2FsZVowRjZpeERPMGw3WjMr?=
 =?utf-8?B?V0tpenlwMWxjYVpqM25ITDRyMnBrSEtjanhiVGJMampvMHlhUGVZZklqYUUy?=
 =?utf-8?B?L25GaW5wSGoyajhCd3Y2d2wvNVFBY2c3NUVNTGxmS3NtcytSNXJOUXhNOWgx?=
 =?utf-8?B?dkJ3ckNubnEzcFZhWDVzQzA4ZkFBWjJXTUNMdE1wMU96SC9iK05TUjVMd05a?=
 =?utf-8?B?V3JnMkEzd3NacDJtbnBwemZ1N25Ma0xzaHpjeTZMSElDUk56UUtIdVRuQ28w?=
 =?utf-8?B?d3BsWUdUSjlpVGc4bHBuY2JNV3JZR00rbTVCb0RHdURPUTZqV2NQNkVjWG5Y?=
 =?utf-8?B?K08zZEtvOGtNRzlrUFZ5NDE4bm5BZ1grRkYrR0ljdnRycndIa1lIK1NUZ2JB?=
 =?utf-8?B?NUZ3SU9yM1Y0M2E2b1pYaE44WFlZVE44aXo2YUppemt4NmZVZnl1UVhVY0pO?=
 =?utf-8?B?V0lsZU1WdkJLRXNSQVQyWlBwMmhxdDVBcVhxVDJLZm9JY0R0V2d1NlJHZ0Fa?=
 =?utf-8?B?UklxQnhwWklKKyt6M2p0QXBLLzg4ZURyclhaSHlLTHhPWCtHdDA0Rkl0RFVD?=
 =?utf-8?B?ekx1U0NmREtwUzZ4bUhlL1RDVzhDTjA1TWlKc1FmV0sxS3dQbmNkUlJXUUpN?=
 =?utf-8?B?d0k2Zm12SzFFWkI0ajBEWitzRlZPVndzTFNidjlrOUt4ZGpOanpDSlNXQXhY?=
 =?utf-8?B?SDNpSURwK3VNclMrV3Avb0hXQmVmK1g3N29uOW9EeEdlWHBFZ2JFQWJLRThx?=
 =?utf-8?B?WTNjWGFCS0dEMzBtZlloVkZJTTFnaTAxNkdIMDQzaWZtdGpBQTY4Tktmd3pT?=
 =?utf-8?B?SlhncXNvNWIyOVlzR2ZHNmk3U1hsRCtrY2ordkJkTjAwTkorTWk4TzZyaHU1?=
 =?utf-8?B?Ly9zN2k4NFFrMzdKUzQ3aFJTSGZ4WDkzOG9FdHVTZVFXK05FaGdLb1l4RTBX?=
 =?utf-8?B?VWV6VHU4bExPekZEaGVSMy84dWg1aDBxRnFVRUtoMk1qTkdoZTB0bEJZNDNN?=
 =?utf-8?B?di9nWXpQSjAvODF3eFBUMGx3UHpUK0dHdFFSK0tmOU9JK21WK08zVCs0aXBx?=
 =?utf-8?B?clJmLzBETllnR3VkUmlJMlRzdXZmckdYRzhXWjRWd2x6R2tlYmVsTW1xbjNG?=
 =?utf-8?B?RTM3TEk5VU9ic3lYV1FHM09mSWg5djNvTlBGc2ZYaUJHTFdjNVAwcitUc3F5?=
 =?utf-8?B?QkoyT3YxVE9OaDJUelgwVXVBQ1huZXNSNExVaGF2V3FQUnhJcWNtUmJKVmF3?=
 =?utf-8?B?bkpHci85U0FxU3VEVFR0OFN5YUZMZ0ZEOW1WWVdadmlvRTFURzJBTUl3MG9F?=
 =?utf-8?B?S2NEa0lFYnBQSWNqTk1mRjdxalBMRmxHRWNNTE1Cb0hBVndVUFVWOU1LVkxq?=
 =?utf-8?Q?2XLw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 216a05cc-e714-4cda-da97-08db688f5167
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2023 02:14:55.7918
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vnt/ZM1kj6j1PUvPIeNUFJXfiCTsX9kgV2cSgcCL/NsAOKBf1O3nGrr7TZw4LT0Qh13e3oQ8V3Ara6EVhaHFOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7496
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgR3VlbnRlciwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHdWVu
dGVyIFJvZWNrIDxncm9lY2s3QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIEd1ZW50ZXIgUm9lY2sN
Cj4gU2VudDogVGh1cnNkYXksIEp1bmUgOCwgMjAyMyA5OjI0IFBNDQo+IFRvOiBYdSBZYW5nIDx4
dS55YW5nXzJAbnhwLmNvbT47IGhlaWtraS5rcm9nZXJ1c0BsaW51eC5pbnRlbC5jb20NCj4gQ2M6
IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAu
Y29tPjsgbGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsgSnVuIExpIDxqdW4ubGlAbnhwLmNvbT47
DQo+IFpoaXBlbmcgV2FuZyA8emhpcGVuZy53YW5nXzFAbnhwLmNvbT47IEZhcWlhbmcgWmh1IDxm
YXFpYW5nLnpodUBueHAuY29tPg0KPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENIXSB1c2I6IHR5
cGVjOiB0Y3BjaTogYWxsb3cgZHJwIHRvZ2dsaW5nIGZvciBub24tZHJwIHBvcnQNCj4gDQo+IENh
dXRpb246IFRoaXMgaXMgYW4gZXh0ZXJuYWwgZW1haWwuIFBsZWFzZSB0YWtlIGNhcmUgd2hlbiBj
bGlja2luZyBsaW5rcyBvciBvcGVuaW5nIGF0dGFjaG1lbnRzLiBXaGVuIGluIGRvdWJ0LCByZXBv
cnQgdGhlDQo+IG1lc3NhZ2UgdXNpbmcgdGhlICdSZXBvcnQgdGhpcyBlbWFpbCcgYnV0dG9uDQo+
IA0KPiANCj4gT24gNi84LzIzIDA0OjI4LCBYdSBZYW5nIHdyb3RlOg0KPiA+IFNvbWUgc2luZ2xl
IHBvd2VyIHJvbGUgVHlwZS1DIHBvcnQgd2l0aCBkdWFsIGRhdGEgcm9sZSwgdGhpcyBraW5kIG9m
DQo+ID4gcG9ydCBjb25uZWN0cyBub24gVHlwZS1DIHBvcnQgZm9yIHVzYiBkYXRhIHdpbGwgbmVl
ZCB0Y3BtIHRvIHdvcmsgdG8NCj4gPiBnZXQgcG9sYXJpdHkgZm9yIG9yaWVudGF0aW9uIGNoYW5n
ZSBhbmQgbGV0IFR5cGUtQyBwb3J0IGtlZXAgYXQgZmFrZQ0KPiA+IHBvd2VyIHJvbGUgdG8gcHJv
dmlkZSBhbm90aGVyIG5vbi1kZWZhdWx0IGRhdGEgcm9sZSwgc28gcmVtb3ZlIHRoZSBkcnANCj4g
PiBwb3J0IGNvbmRpdGlvbiBmb3Igbm93Lg0KPiA+DQo+ID4gSGFzIGFueW9uZSBlbmNvdW50ZXJl
ZCB0aGlzIHVzZSBjYXNlPyBIb3cgZG8geW91IGhhbmRsZSB0aGlzIGxpbWl0YXRpb24NCj4gPiBp
biBjdXJyZW50IHRjcG0gd2l0aCBhIGJldHRlciB3YXk/IFBsZWFzZSBraW5kbHkgc2hhcmUgeW91
ciB0aG91Z2h0cy4NCj4gPg0KPiANCj4gSGF2ZSB5b3UgPyBUaGlzIGlzIGFuIG9kZCBjb21tZW50
IHRvIG1ha2UgaW4gdGhlIHBhdGNoIGRlc2NyaXB0aW9uLg0KDQpTb3JyeSBmb3IgdGhpcy4gSXQn
cyBub3QgYSBmb3JtYWwgcGF0Y2guDQoNCj4gDQo+IEVpdGhlciBjYXNlLCBJIGRvbid0IHVuZGVy
c3RhbmQgd2h5IG9uZSB3b3VsZCBuZWVkIHRvIGVuYWJsZSB0b2dnbGluZw0KPiB1bmRlciBhbnkg
Y2lyY3Vtc3RhbmNlcyBpZiB0aGUgcG9ydCBpcyBub3QgRFJQLiBUaGUgZGVzY3JpcHRpb24gZG9l
cw0KPiBub3QgZXhwbGFpbiBob3cgIm5lZWQgdGNwbSB0byB3b3JrIiBjb3JyZWxhdGVzIHRvIGVu
YWJsaW5nIHRvZ2dsaW5nIG9uDQo+IG5vbi1EUlAgcG9ydHMuDQoNCk15IGNhc2UgaXMgYSBzb3Vy
Y2Utb25seSBQRCBjYXBhYmxlIHBvcnQgd2l0aCBkdWFsIGRhdGEgcm9sZSwgY29ubmVjdCB0bw0K
bGVnYWN5IFBDIGhvc3QgdmlhIEEtdG8tQyB0byB3b3JrIGFzIFVTQiBkZXZpY2UgbW9kZS4gVW5k
ZXIgY3VycmVudCB0Y3BtDQptZWNoYW5pc20sIHRoZSBQQyB3aWxsIG5vdCByZWNvZ25pemUgdGhl
IHNvdXJjZS1vbmx5IFBEIGNhcGFibGUgcG9ydCBhbmQNCnRoZSB1c2IgY29udHJvbGxlciBoYXMg
bm8gY2hhbmNlIHRvIHdvcmsgYXMgZGV2aWNlIG1vZGUuIA0KDQpIb3dldmVyLCBpZiBJIGVuYWJs
ZSBDQyB0b2dnbGluZywgdGhlIFBEIHBvcnQgY2FuIHJlLXdvcmsgYXMgc2luayByb2xlIGFuZA0K
dGhlIFVTQiBjb250cm9sbGVyIGNhbiBmdW5jdGlvbiBhcyBkZXZpY2UgbW9kZSB0b28uIFNpbmNl
IGl0J3MgVVNCMyBwb3J0LA0KaXQgY2FuIHdvcmsgb25seSBhZnRlciB0aGUgU1MgbGluayBoYXMg
Y29ycmVjdGx5IGVzdGFibGlzaGVkLiBUaHVzLCB3ZSBhbHNvDQpuZWVkIHRjcG0gdG8gc2V0IGNv
cnJlY3Qgb3JpZW50YXRpb24uDQoNClNvLCBpdCBzZWVtcyBhIGxpbWl0YXRpb24gdG8gbGV0IHNp
bmdsZSBwb3dlciByb2xlIFR5cGUtQyBwb3J0IHdpdGggZHVhbA0KZGF0YSByb2xlIHRvIHdvcmsg
YXMgbm9uLWRlZmF1bHQgZGF0YSByb2xlIHdoZW4gY29ubmVjdGVkIHRvIG5vbiBUeXBlLUMNCnBv
cnQuDQoNClRoYW5rcywNClh1IFlhbmcNCg0KPiANCj4gR3VlbnRlcg0KPiANCj4gPiBTaWduZWQt
b2ZmLWJ5OiBYdSBZYW5nIDx4dS55YW5nXzJAbnhwLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBM
aSBKdW4gPGp1bi5saUBueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy91c2IvdHlwZWMv
dGNwbS90Y3BjaS5jIHwgMyAtLS0NCj4gPiAgIGRyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNwbS5j
ICB8IDYgKysrKystDQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi90eXBlYy90Y3Bt
L3RjcGNpLmMgYi9kcml2ZXJzL3VzYi90eXBlYy90Y3BtL3RjcGNpLmMNCj4gPiBpbmRleCBmYzcw
OGMyODlhNzMuLjg4NTU5ZTc0OTEyMCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3VzYi90eXBl
Yy90Y3BtL3RjcGNpLmMNCj4gPiArKysgYi9kcml2ZXJzL3VzYi90eXBlYy90Y3BtL3RjcGNpLmMN
Cj4gPiBAQCAtMTc1LDkgKzE3NSw2IEBAIHN0YXRpYyBpbnQgdGNwY2lfc3RhcnRfdG9nZ2xpbmco
c3RydWN0IHRjcGNfZGV2ICp0Y3BjLA0KPiA+ICAgICAgIHN0cnVjdCB0Y3BjaSAqdGNwY2kgPSB0
Y3BjX3RvX3RjcGNpKHRjcGMpOw0KPiA+ICAgICAgIHVuc2lnbmVkIGludCByZWcgPSBUQ1BDX1JP
TEVfQ1RSTF9EUlA7DQo+ID4NCj4gPiAtICAgICBpZiAocG9ydF90eXBlICE9IFRZUEVDX1BPUlRf
RFJQKQ0KPiA+IC0gICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOw0KPiA+IC0NCj4gPiAg
ICAgICAvKiBIYW5kbGUgdmVuZG9yIGRycCB0b2dnbGluZyAqLw0KPiA+ICAgICAgIGlmICh0Y3Bj
aS0+ZGF0YS0+c3RhcnRfZHJwX3RvZ2dsaW5nKSB7DQo+ID4gICAgICAgICAgICAgICByZXQgPSB0
Y3BjaS0+ZGF0YS0+c3RhcnRfZHJwX3RvZ2dsaW5nKHRjcGNpLCB0Y3BjaS0+ZGF0YSwgY2MpOw0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi90eXBlYy90Y3BtL3RjcG0uYyBiL2RyaXZlcnMv
dXNiL3R5cGVjL3RjcG0vdGNwbS5jDQo+ID4gaW5kZXggM2M2YjBjOGUyZDNhLi42YWE2MjEzMmU2
OWEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy91c2IvdHlwZWMvdGNwbS90Y3BtLmMNCj4gPiAr
KysgYi9kcml2ZXJzL3VzYi90eXBlYy90Y3BtL3RjcG0uYw0KPiA+IEBAIC00Mjc0LDcgKzQyNzQs
MTEgQEAgc3RhdGljIHZvaWQgcnVuX3N0YXRlX21hY2hpbmUoc3RydWN0IHRjcG1fcG9ydCAqcG9y
dCkNCj4gPiAgICAgICAgICAgICAgIHJldCA9IHRjcG1fc25rX2F0dGFjaChwb3J0KTsNCj4gPiAg
ICAgICAgICAgICAgIGlmIChyZXQgPCAwKQ0KPiA+ICAgICAgICAgICAgICAgICAgICAgICB0Y3Bt
X3NldF9zdGF0ZShwb3J0LCBTTktfVU5BVFRBQ0hFRCwgMCk7DQo+ID4gLSAgICAgICAgICAgICBl
bHNlDQo+ID4gKyAgICAgICAgICAgICBlbHNlIGlmIChwb3J0LT5wb3J0X3R5cGUgPT0gVFlQRUNf
UE9SVF9TUkMgJiYNCj4gPiArICAgICAgICAgICAgICAgICAgICAgIHBvcnQtPnR5cGVjX2NhcHMu
ZGF0YSA9PSBUWVBFQ19QT1JUX0RSRCkgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICB0Y3Bt
X3R5cGVjX2Nvbm5lY3QocG9ydCk7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHRjcG1fbG9n
KHBvcnQsICJLZWVwIGF0IFNOS19BVFRBQ0hFRCBmb3IgVVNCIGRhdGEuIik7DQo+ID4gKyAgICAg
ICAgICAgICB9IGVsc2UNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgdGNwbV9zZXRfc3RhdGUo
cG9ydCwgU05LX1NUQVJUVVAsIDApOw0KPiA+ICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gICAg
ICAgY2FzZSBTTktfU1RBUlRVUDoNCg0K
