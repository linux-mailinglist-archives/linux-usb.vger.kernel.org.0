Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D96D76B2B0D
	for <lists+linux-usb@lfdr.de>; Thu,  9 Mar 2023 17:43:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbjCIQnd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Mar 2023 11:43:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbjCIQnA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Mar 2023 11:43:00 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BCA9F4006
        for <linux-usb@vger.kernel.org>; Thu,  9 Mar 2023 08:32:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DM73zU2GO575Z7PC2wTaihZPzscssMQHY1qxTbBEvn+D56p1Vi3n/KB4BFkh/M9XdUTqamKDvyWbaR6H5GBcT6bF8uUfiux230UuUTwPsQKf+ck70EdNl9LxyoWXzjw76PCOEHIITO6m+BkG2SaEKwIqUeZREKxahfsJgefR4OJH+NNEKIxaXp6Nzl3vINvG8PXXHpjbH9FJqJT5HckP7bUivAI2u37HohSGnsQ/Xaa0ammYS72o9W258qKKL4oO4BlYkdBJuSiXPIW3jhEGR5fcA60ZTvxUw6KYwuu9GgB6L9ftZRP9O3ryLmMiSsznGvpYNDUSasLBPqJCIcgchg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ixOTxWrsJlJJttjkW/rUh3FjPqOKQSaUVEo7ZRC6jA=;
 b=CpQV6Ny9pCFYKZF9IBoITYu7YgQzIu0XvlLSWOWGbUYE0C7XX1oVm2eFlNfoCHnPWOFWe27UE3IBVUb2mpiN/VToF5RuhwAF74PKCJV0Dth4qmcgk3SszaCfcl50Zpe403SONxCEv9ZrRy2UJEEgOVH8HjKvqL+BJpyoeDsklxMoLQya5PMIBxvzjCAsG40Bol37NBgt4eh1KeXqFIDVGOzZgi5LjkbCmKwh6d0tdrNREUhk5XIi1L+U05tc59h18V4c3SPYgWLLVxqkFXjwbGOJeC83mPinLR01CpDhrAQkhhWjwPbAo1nnu23QfDmmrvMTUOQ6v2cd26ajRS1CJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ixOTxWrsJlJJttjkW/rUh3FjPqOKQSaUVEo7ZRC6jA=;
 b=T/5kuYVk1/7LcXIyoZDOBYXR7K7gHqW8tINa6xZYI0jSKP7+vG3Duxb4/q+CUJB4Wz5z+Un/d072PjMMykDFV7V7KO73CVy83lGoQ4LghbkRZbmOhk2ZD8DY+kLgLgcRllg6GeVCFHPwhAY2o/9dxWHYPnsJWWq8BdT5erGIiRBxZxIbsayEJL3xQtM2hudkwGAYRN8x7uj8FWHwr0P+z9OY0pDyhcbg3pdFh49UIKHDkiOjvP2erDIF5/GCW2MjOtSue/0h7DAXgY5kfrmUxEiwF8LOlfw9p67tXC86REpf7bfJjnDXRI0JQr4FAJljnlONazQWjkPb8IMvs/ifsA==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by DS0PR10MB6823.namprd10.prod.outlook.com (2603:10b6:8:11e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Thu, 9 Mar
 2023 16:32:08 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171%5]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 16:32:08 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "Thinh.Nguyen@synopsys.com" <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Subject: Re: dwc3 gadget and USB3
Thread-Topic: dwc3 gadget and USB3
Thread-Index: AQHZUeDbzC3YzvbOF0edn6Gh7r6tPa7xIiEAgAANS4CAAAy+gIAAKXUAgAE//gA=
Date:   Thu, 9 Mar 2023 16:32:07 +0000
Message-ID: <14bebac5f1e046c4fcdedc540bcdddc83cdd2b47.camel@infinera.com>
References: <c604031d4e3aa215b90f73e9a2dd55e7e116186f.camel@infinera.com>
         <ZAjE+p4IoXk/kvXu@kroah.com>
         <d4be672670da6b06456b5a82624e3db0128fdae8.camel@infinera.com>
         <ZAja0So7EDH5FfI0@kroah.com>
         <e31b7802f0b33f66338b009de898526b8eb936f6.camel@infinera.com>
In-Reply-To: <e31b7802f0b33f66338b009de898526b8eb936f6.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|DS0PR10MB6823:EE_
x-ms-office365-filtering-correlation-id: 297f6f2c-7423-4c90-e963-08db20bbd356
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EZKaR+YerkVus9YG92hoBp2bPxSyhyJgsEY3Vk5ER0SEOqo4LShGfYfqeHmo9UvtrF7WxyMcNJdMqfBBzKqckyHP+OlDruLfLy0KqeyD44i+JDsjdtkFXhViWThGnIa8zK6lM4ID/XWl77LbnTXeXNGVVjlWYeGJRc1RZ8OlcinVs/jBIdNjkLgx9cX+kgWCbcWwDHv/m4T62trXyB+7O4grXahGUrWlW1t5w3PzHew61+fr7pzEs3DtQ+648+gUzzXwZ18NqxLFWkrfg4XJINk4DsFx1ledCOmJZ2kozU/9L8Wr2PCOfah9gSB383L43oPzIr0E5q3wM+Jc0hvs2OWe366OTO7nTqGvSJcfHCsZmyUXm3wMud0dhZNWUgXUWe2DpplmBlrCOBCZih6uCwiIe26BDTciXx23rsUHYmD6a2lOTospIlXQvRl68eZkZHX5PpttmfKATQWTJGtYMDvExU8zJrH6dyeB8gmTeK956L7/wBspx3gHH8mu3FPENU25T5dqpOGcL6lPFAwDuR//0sBiRmO7vRAhJtjXM8ST20htZLf/6/eyJQCNNhnEf7SRyMVzhy/GEJJuUQOzHm8N3W2Vl6zmxCmP0iuRgRiIaU0C9QGE5qWEaNB+vnQwYp93CCZ5JmZpc+qy/e5FE//Bhnqgg1oYRwuRbzTlHNbYIpcKeoBW+h8ArDZ7RTwJBA7KwKMI1RzVaRI41BhK1w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(451199018)(6486002)(91956017)(6506007)(6512007)(36756003)(83380400001)(38070700005)(122000001)(86362001)(38100700002)(186003)(2616005)(41300700001)(76116006)(66946007)(66556008)(66446008)(4326008)(6916009)(8676002)(64756008)(66476007)(2906002)(8936002)(5660300002)(71200400001)(316002)(54906003)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RktVdC9qNFhuNXI4Q3JRSTlxY25PRkFIbGxYMTc3WGxGSHo4UFpUb2NMOUZm?=
 =?utf-8?B?S1FhdjhvcFVQb2Y1aVAyWXczaks1K1Q4Z05zTXIzWHNLdVFxakNrR1A4WFhW?=
 =?utf-8?B?SjNYUEdMMlFnWW4vVDdRcHV6b2owcE5TSXY3cmtkQ0hXMjg0U08yNkVsajBW?=
 =?utf-8?B?M090VmhOcUNPUldwaUlaQjhhbHlpb1hCU2RYUkk0bXdCZTUwRGJhN25HQW4y?=
 =?utf-8?B?TDdjaS9QMHJyTFgycjdleW13alJUeS9pWXFhNVRtSitoUVlLdFpWcFMvbmZO?=
 =?utf-8?B?WkZoUVR1Y3E2eWhGMDJCcFYrQzlNQUZaMUpPYnBEbG9ueWZuQmhScVVXY1lj?=
 =?utf-8?B?dmk5Q1dJaUVXakdvWkJWVU1HcGtvNUxENFFUZGhtT3hxaHRSUlVLaGw0aW9J?=
 =?utf-8?B?N0lsSis5eWtYRVVjU2U2ZE83NWJqcHhVVU5ISlJNUjcxYWRUeldWZmxXT2xC?=
 =?utf-8?B?RlNPRHRUQm5NZUFkWGZSWnNUL01nWWtJd1VlYk1wU1I1Y1ljdGFhc0tXa01K?=
 =?utf-8?B?SnRPS0NsZlRuV3ZvYlZHTXNZOG9rajhTREMwYSs0ZG1BYkJ5R0xlanFTcUU4?=
 =?utf-8?B?UVFJeGg5NmRZVDEwaUVTcVBjMnFPMUNNWXJGRDUrYXNmY0FXTlM2QkVReDFY?=
 =?utf-8?B?K0pJems5YlE1Ym03SitzbGZVL05xQjBMaTJ4NzNQd1VDa042Q3RjcW9VZ0Ex?=
 =?utf-8?B?WmcybldqdURoZjRiNU5KRWJYMGxwL3pQYlZYQ3VaNDdXYXRoWEtaMk92c0J0?=
 =?utf-8?B?M1dYSklqdktXL0p5enNTOERaZlRsSytpRjhqZFBqcXlNWFc5ZlZyOTZ1N2Fz?=
 =?utf-8?B?N3RWZ2FKdGlUbWxDY0plWGN2cmgzaVhISk9sNmtmUjFxSXhqTGkxWjB1My85?=
 =?utf-8?B?S1pDMkpKWTE1WnQyaStqdjBlMXJJOGZHc0NTNmVhYWUyemJZcjRvajc0TTVk?=
 =?utf-8?B?b2UxM0pBbzJTWUgrSU1wcGtzU0JBby8zTmZtSUMvcjh4ZzgzWmsrVzFURmhi?=
 =?utf-8?B?NE01eE53RDNvTWMvUVZQWks2b3RWK1pkSVg1NVY4dGhGcW9xMGdLT2hxSzhT?=
 =?utf-8?B?WVkwaC9PK2NsOVVTaERBZW1Wb3E5TUYvK0x1Rlgrd2t4aFF1UlFmQVhtempZ?=
 =?utf-8?B?Q2FMSDE0L3Y4WkVyT2JZNzdtd3A4a2RSYXp2Q2FIcC83bzFBL05CbDJKSXF0?=
 =?utf-8?B?dlpBaGdJeG1VaGZnZ2dOS1l0Njd3SUowLysxZzFRVEgwWGJNOS9UNmg2T2VG?=
 =?utf-8?B?ZTkyTzYxMU5LS1drNjRIWjJQZDhqdEFLT29HcDYvUmNKZXY0SUJvdy9uVEdu?=
 =?utf-8?B?eXd1TFJBeEMwZTBZWm01anEzbVh2dFF5UUhFaWdHcnBJbzhIdUtDVElrRElT?=
 =?utf-8?B?Y3M0eG5MUUh2T21LeTBra3gxK0Y2MjdkTFFLWHZRcms4bXE3OWNjaG5yVGYz?=
 =?utf-8?B?cGpaN24xTi91S1Uwb2E3WmVKcWhJckVtVVRwdnJvczNpeDJoeGptQXRFaFU5?=
 =?utf-8?B?NlJDTk0zaWZCSHp2NEd2YUY3a2ZUUW9GQms0TkF0elVuRExQM1N5bDljU0dR?=
 =?utf-8?B?MXozMVJNQmtkcEExTUhtUVFxeXJhbFMrZFRvd1p1VWhtbDF1S1FmQ0ljMDFR?=
 =?utf-8?B?bEVDNkJnTmJrWklpaURtbXk3Z0licEpWOXVXWEdSb0krRTNvV0wyMXhrZVF5?=
 =?utf-8?B?enV1RjZYL0NEeHdEMllub2dESGlEb3YyU3Y3TmNWVkE3MEd5b3hUTkdJMEVn?=
 =?utf-8?B?Q3VJRmJ3d091RXZQOHdsY3YxZGFqL2dDelpUL3JKU2J3U3kreDNqWUZVN2FS?=
 =?utf-8?B?UEZ1WHZjczIwcE9ORE1rRy9JZDVXdEpRbm03QVJyOHhBNFdoQmZIYXZXOGMz?=
 =?utf-8?B?WjYxWEowZVFXMnVNUmRrYy92TW1hMTlkUjdkSzIvdy96d2hJS1hEdkZlTVNZ?=
 =?utf-8?B?dGV0T212ekRKdWJEeEQxbWNzT2EzUWFmQXk2ZTI4QzZDeC9IR1NMY0RyeFhD?=
 =?utf-8?B?Qmc0ejB5NlNDTENYVkw4TkJWMGtOYmFsV2poZEEyV21XaVJJdWo0ajkwMm52?=
 =?utf-8?B?TE5HcldaTlJkUm1hcHk5TUVMV3ZaSGdwVW9XRFN4REtxdCtibXRlZlNNcEtS?=
 =?utf-8?B?eFJOVis0ZmZTOGpCRWZiUmpXMkptcXMwTlRMTmV6eG03ME5jdWhnakVrWk9y?=
 =?utf-8?Q?N0eA4oBd/MpW7Mt01khOgrFD3t93uMGdljB+qDgTlkG7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <89EA69BD8259C74EB1C72DBE1A0D2FA4@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 297f6f2c-7423-4c90-e963-08db20bbd356
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 16:32:07.9562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9g8sQI0Dpg8h2ICwNs/zgAob+mpNbvZzMSv6/01zQtxixqTW+dB7RfkdehOgXTubvWbJyJUNQle4hxSrvcI/QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6823
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCAyMDIzLTAzLTA4IGF0IDIyOjI2ICswMTAwLCBKb2FraW0gVGplcm5sdW5kIHdyb3Rl
Og0KPiBPbiBXZWQsIDIwMjMtMDMtMDggYXQgMTk6NTggKzAxMDAsIGdyZWdraEBsaW51eGZvdW5k
YXRpb24ub3JnIHdyb3RlOg0KPiA+IE9uIFdlZCwgTWFyIDA4LCAyMDIzIGF0IDA2OjEyOjUxUE0g
KzAwMDAsIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6DQo+ID4gPiBPbiBXZWQsIDIwMjMtMDMtMDgg
YXQgMTg6MjUgKzAxMDAsIEdyZWcgS0ggd3JvdGU6DQo+ID4gPiA+IE9uIFdlZCwgTWFyIDA4LCAy
MDIzIGF0IDA1OjEwOjE3UE0gKzAwMDAsIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6DQo+ID4gPiA+
ID4gd2UgYXJlIHVzaW5nIGZzbC1sczEwNDNhLXJkYiBiYXNlZCBkZXNpZ24gYnV0IHdpdGggYSBs
czEwMjNhIFNPQyBhbmQNCj4gPiA+ID4gPiB1c2UgVVNCMCBpbiBnYWRnZXQgbW9kZSBydW5uaW5n
IGVpdGhlciBOQ00gb3IgUk5ESVMgZXRoZXJuZXQgb24gdG9wLg0KPiA+ID4gPiA+IA0KPiA+ID4g
PiA+IFdoZW4gd2UgY29ubmVjdCB0aGUgZ2FkZ2V0IHRvIGEgUEMoTGludXggb2YgV2luZG93cykg
b3ZlciBhbiBVU0IyIGh1YiwNCj4gPiA+ID4gPiBuZXR3b3JraW5nKE5DTSBvciBSTkRJUykgd29y
a3Mgd2VsbC4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBIb3dldmVyLCB3aGVuIHdlIGNvbm5lY3Qg
dGhlIGdhZGdldCBkaXJlY3RseSB0byB0aGUgUEMvbGFwdG9wIHdoaWNoIHVzZXMgVVNCMw0KPiA+
ID4gPiA+IHdlIHNlZSBzb21ldGhpbmcgb2RkOg0KPiA+ID4gPiA+ICAgUGluZyBmcm9tIFBDIHRv
IGdhZGdldCB3b3Jrcy4NCj4gPiA+ID4gPiAgIFBpbmcgZnJvbSBnYWRnZXQgdG8gbGFwdG9wIGRv
ZXMgbm90LiBIb3dldmVyIGlmIHdlIGFsc28gcGluZyBmcm9tIFBDIGF0IHRoZSBzYW1lIHRpbWUg
d2UNCj4gPiA+ID4gPiAgIHNlZSBnYWRnZXQgdG8gUEMgc3RhcnQgd29ya2luZy4NCj4gPiA+ID4g
PiBTZWVtcyBsaWtlIHBpbmcgZnJvbSB0aGUgUEMgdGlnZ2VycyB0aGUgZ2FkZ2V0IHRvIHNlZSBp
bmNvbWluZyBwa2dzIHNvbWVob3cuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gQW55IGlkZWEgd2hh
dCBtaWdodCBiZSB3cm9uZyBvciBob3cgdG8gZGVidWcgdGhpcz8NCj4gPiA+ID4gPiBLZXJuZWwg
NS4xNS44Nw0KPiA+ID4gPiANCj4gPiA+ID4gNS4xNS55IGlzIHZlcnkgb2xkLCBkb2VzIHRoaXMg
YWxzbyBoYXBwZW4gb24gNi4yPw0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4gSSBqdXN0IHRyaWVk
IDYuMS4xNSBhbmQgdGhlIHByb2JsZW0gcmVtYWlucywgSSBob3BlIHRoYXQgaXMgY2xvc2UgZW5v
dWdoID8NCj4gPiANCj4gPiBJdCdzIGdvb2QgZW5vdWdoIDopDQo+ID4gDQo+ID4gSGF2ZSBhbnkg
bG9ncyBhdCBhbGwgdGhhdCBzaG93IGFueSBwcm9ibGVtcz8NCj4gPiANCj4gTm8sIGRvbid0IGtu
b3cgd2hlcmUgdG8gc3RhcnQuIFRoZXJlIGFyZSBubyBlcnJvcnMgbG9nZ2VkLg0KPiANCj4gPiAg
IEFsc28sIHlvdSBtaWdodCB3YW50IHRvDQo+ID4gIGNjOiAgdGhlIGR3YzMgbWFpbnRhaW5lci4u
Lg0KPiANCj4gSSB0aG91Z2h0IEkgZGlkIGJ1dCB0aGF0IGxvb2sgbGlrZSBvbGQgaW5mbywgYWRk
ZWQgVGhpbmggTmd1eWVuIG5vdywgdGhhbmtzDQo+IA0KPiAgSm9ja2UNCj4gDQo+ID4gDQo+ID4g
IHRoYW5rcywNCj4gPiANCj4gPiAgZ3JlZyBrLWhqDQo+IA0KDQpGb3VuZCBhbmQgVVNCQyBEb2Nr
IGFuZCBjb25uZWN0ZWQgdGhhdCBiZXR3ZWVuIGdhZGdldCBhbiBQQyBhbmQgdGhpcyBhbHNvIHdv
cmtzIHdlbGwuDQpTZWVtcyBsaWtlIGEgaHViLCByZWdhcmRsZXNzIG9mIFVTQjIvVVNCMywgbWFr
ZSB0aGUgdXNiIG5ldHdvcmsgZnVuY3Rpb24gaW4gYm90aCBkaXJlY3Rpb25zLg0KDQpGb3VuZCBv
dXQgc29tZXRoaW5nIGludGVyZXN0aW5nLCBvbiBQQzoNCmNkIC9zeXMvZGV2aWNlcy9wY2kwMDAw
OjAwLzAwMDA6MDA6MTQuMC91c2IxLzEtMS9wb3dlciAgIyBXaGVyZSBteSBnYWRnZXQgaXMgY29u
bmVjdGVkDQplY2hvIDAgPiB1c2IyX2hhcmR3YXJlX2xwbQ0KDQpOb3cgcGluZyB3b3JrcyBub3Jt
YWxseS4NCg0KU28gTFBNIGRvZXMgbm90IHNlZW0gdG8gd29yayBwcm9wZXJseSBvbiBnYWRnZXQu
IENhbiBJIGRpc2FibGUgTFBNIHNvbWVob3cNCm9uIGdhZGdldCBzaWRlPyANCg0KIEpvY2tlDQoN
Cg0K
