Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E852B4D613D
	for <lists+linux-usb@lfdr.de>; Fri, 11 Mar 2022 13:09:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239223AbiCKMKt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Mar 2022 07:10:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbiCKMKs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Mar 2022 07:10:48 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2126.outbound.protection.outlook.com [40.107.93.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BE17CA71A
        for <linux-usb@vger.kernel.org>; Fri, 11 Mar 2022 04:09:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJ1hCegx07XG8C7B8eDzLVOA3+j8wzrnPfU7ikgyPmUnmHYTTt4VTU8rW/JVMeVcL/q6Ov6KGVbOB1NRFOHWq+JC+q5HvJw8lMQdci6r+IMnC0aJoDdd0t3jrDVCmi1gk30Fyq0uUj/OEp+u7mB6TUOrbfTaXyI2+Kj8ssocHtaWxKj8uYwJpMgXwQx9qGSz9Z1FxtgKF5Ci5T+rKzp8ktHfqxRfyoR6hd+mhwOqAzg74omwSCBd+d0a1SlWtb6CgUDkKoYGbNEusHV9M7pqXGOobAsVsgpYIBRdnetru9h1nprgkC/luXpqTDvQVAqstZDp0TOZ6NYT7lTxzmjH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+mDQHC6paS+wXN3/TyFE+RoPfTiGwyZLX2P3ZrWVd0=;
 b=PD02AB1jgO7QvtXSQHs29BnFHRQ25lDEFB8y75KguZ0xw4FQtcUbR0WjjNIlfv0OfEYvh2Psp0ktuoYjS81fRbJB+o4t5roCLbgvbYQCB8QXiV3PL5M4orqflIk3o1tgaNL8qFriYyTUu8XIAjYsVlaYiUP8KdM3pABaQvD/h0rrS3nf+7rZxqbakfKhuRhYkJ/00zta9peGdy+ArfOglHsw+QgkAugSTGTVeNSnE76xdm85q4bigX8RlruXkX93nXrkkEon6AbNzeCWYQ58cagF8n075+hrvvTsZPKmW7i8+Gf7C4BS6H7o8pj/J5LRTf1dzB3v/+PKXN1zGuIWLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dentsplysirona.com; dmarc=pass action=none
 header.from=dentsplysirona.com; dkim=pass header.d=dentsplysirona.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dentsplysirona.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+mDQHC6paS+wXN3/TyFE+RoPfTiGwyZLX2P3ZrWVd0=;
 b=G+yPrFAHSrx9fjXLrfXMHWVQL/cDkZaccb0WMILdUkUbfVXu+h4PIf18D/Pj1orIYxRFL0lMrSS6tqg12YkqwFnOMC9npMeU/WfR/tLT8xXcDyybFdWTwSDJLDV7gi4Ra8m/BzlKKNazTD1WQK57tKf9D7MhTKZUBbC3bbrM1DA=
Received: from PH0PR17MB4848.namprd17.prod.outlook.com (2603:10b6:510:8d::12)
 by DM6PR17MB3532.namprd17.prod.outlook.com (2603:10b6:5:1db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 12:09:40 +0000
Received: from PH0PR17MB4848.namprd17.prod.outlook.com
 ([fe80::6860:7a7f:9314:1f3c]) by PH0PR17MB4848.namprd17.prod.outlook.com
 ([fe80::6860:7a7f:9314:1f3c%5]) with mapi id 15.20.5038.027; Fri, 11 Mar 2022
 12:09:40 +0000
From:   "Neumann, Bastian" <Bastian.Neumann@dentsplysirona.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH 1/2] usb: usb251xb: Set boost value for up- and downstream
 ports
Thread-Topic: [PATCH 1/2] usb: usb251xb: Set boost value for up- and
 downstream ports
Thread-Index: Adg1P3+d1mdMJerkSO6Pc5AovAZ8QA==
Date:   Fri, 11 Mar 2022 12:09:40 +0000
Message-ID: <PH0PR17MB48482AD591AFD471637B16E28E0C9@PH0PR17MB4848.namprd17.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dentsplysirona.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2702e2b9-5473-4a28-084c-08da03580548
x-ms-traffictypediagnostic: DM6PR17MB3532:EE_
x-microsoft-antispam-prvs: <DM6PR17MB3532EB6AF6DFEC77B0F5BFAA8E0C9@DM6PR17MB3532.namprd17.prod.outlook.com>
x-disclaimer: Applied
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j6MKaua5vx3slPpHJoMYc+nNMXtT55BmJxOaaayJbMxO96skrOc1zS1sG8H5MyLt76r7Pdec6Qmf41JW89Vc3/Oe4+4Xkx8i9jKZELpPBUt6S0kkKnvV1u2flkFmCA1HV9bxiDD2KE/s1rXXsGe6ei+MT5eJDCdvnr2Bi09IjAVoeLTRqtgJdWdtIezij6H3YkgQ0BMJ9TiTO3AOy3MwTHKz4+otNU1Pfs2fW5+KyAzncyAoCudn1QMVZIFTNxqccA8+B7rRafS51Nt2FJ9puUTUCO+wmYRYZzVr8ovCFL55lXWFH+e3RB4qtUWv6WzxlT3ohfIwjfs0DVEEW8y8Rb1qPBqcBCBrCZ/c9PY2Zb/FhTOPUk1t7gEcrugHW5RMdcbIW4dgJ8N1ayD8PyvQ/QqVz+UJb7QafriDsA69uIwkY4LbOLZhHp0yB59kkc769696CRKiW/qv1YREXq2NVefMdjebXqJDdeWNBHD7P87CSCyPfDMfT5j5KJWy37+R9WCx77Fxk4/PSvlJW1bOpYtKMWKydNTd9aLfx6rGeRF6pJaYlxrUe/P/AWIPi7T41N+QDLEVzJ5xFsUAHLfgKzSKG+s/Zp9UjLXckLCDAK62DRYiQnfFtjsrRszqX6bqC5/l948QqFt69jVcIvqjgo2ALJz3F6hW8or8+l3TCjKxenbiVlo7hE8uRk4oIG+dJtvvKoQ0wDJkftq5DFs0tA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR17MB4848.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(508600001)(38070700005)(76116006)(71200400001)(66556008)(66476007)(66446008)(86362001)(8676002)(4326008)(6916009)(316002)(66574015)(64756008)(26005)(186003)(9686003)(6506007)(122000001)(38100700002)(7696005)(83380400001)(2906002)(33656002)(8936002)(55016003)(5660300002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVM0a29iMmsydzc2N3NDa3BpbVJtMWNxb2p5SERNUXJXcUp4K24zVjkvZmNY?=
 =?utf-8?B?dnFienlIeUIrMEpPWWpNaCt0ZmZYMFZ1NDViTVYxZDdlZ3VBR1FDbVpYK3hq?=
 =?utf-8?B?eUdKclgxUnB4RWN0NnhUaFhMQVo3UHJjbTE3K0FHWnBucWZibU8vM0k1M3Rz?=
 =?utf-8?B?YkQ3WDU5NkYxQmpOR0ZOTTcyaml3TkRPME41bE5vall0czlsNUVTUytXMkpJ?=
 =?utf-8?B?bGxqbkF4ZWNxeDZVd3psWHFRMFBUS0NVWGJKQktkTjBkWVJSZTh2RGxyTkow?=
 =?utf-8?B?VnU1T2dyVW16bk5oN2pmRHZxYW1IVFp2WXltR0grSy91TVUvaDl2R1FJbTdi?=
 =?utf-8?B?dE1GUGhpanpOMFUyK1hEUWpDT2ViQWRDblczbkFuemZKZFE1WG40Y0YvNVBK?=
 =?utf-8?B?M0RnSk85V0NjcytoZVJ0dVUyaEw1MHJNZXpzclV0THpMRmQ5NHN4eFQ2VWY2?=
 =?utf-8?B?RENvb3BJU2dNY21tb2tHZVRUdnVMaVZ0dUpGRld6UmdmQi9mRkp1M0czMVpr?=
 =?utf-8?B?alJVYUhKVXZTc0orVlU1bVkvUHpNNEdoSWhJaldZZG5RejlsUWZseExEanpw?=
 =?utf-8?B?b3dTWjFadDRlUmM1RWthcnJkNWo3VUdrbFUvUGdTa3pOWUUvWi81Q2ExT2F1?=
 =?utf-8?B?bGwwVmU4bGlxMlJSejhvMjU1S2NQNzFndkVId28rUHU1WXBUUFFFZnJQMTZr?=
 =?utf-8?B?bEQxcWxqemxxdVVZQUpBamVKTkhUZXp3VDlUUmVrSFlNUTlvTnRzTjhXT0Rh?=
 =?utf-8?B?bURQMmg4UjUyanZZMEpNeUhVamhnaUtySXc0a0gvN1lnZThvdmxlTXgwMmZv?=
 =?utf-8?B?Um5JL2RJTVZEeUZvNDR5QjQwcHlhNnY4UWduTUF4RS9ybS93VzFPbTBJS3hy?=
 =?utf-8?B?T2NmaUhQNnF3a3hFWGN4d3Jla3NFdDhKSUNuSWV6b2JqM3FmUXlEQk5Kd2c3?=
 =?utf-8?B?S2hRdkZpSXFjYlBUdE9Md3FQQk5Sa3RKeHR5S0tSeC9TYXdLV1BFQjRkeG1j?=
 =?utf-8?B?eXk2T3BiTm5JdjI3aTc2WTJkSytFbFl2UkJSL2hKank3d2ExYitXTzRIb1RK?=
 =?utf-8?B?YW1ISjlWT3NvT0tZY3V5ZmFHSXFnMjc0S010RFY1WDVVekpsY0VvQ3Y4UGZx?=
 =?utf-8?B?elp3Vmd0THVOZ25qTklKTjAzK1hrTGROSDlPdTlkb1ZpM1VHQ0MySC9DR2pt?=
 =?utf-8?B?aUtJNGJHa29CSzhuZEE1RG8xaUlJWlBKN202SGhFdElScGFkRS9seTVxbXhx?=
 =?utf-8?B?eWc2WmJPTFZ5d1VJSWp4eG5DdGsvOERyV0ZlakFrcDk4eWtuQ1VFSTZjVlpS?=
 =?utf-8?B?NlFudDl1dDBrY0szQ2taVTVYb0o5ckNIWG5vQnR5RlhGd2JYemR5N3lERzJy?=
 =?utf-8?B?cHhtK20yMVVjaDEyMC9FVzM1M3h3cEdOZlZ1aWplK0VDNjM4eCtPVjd1N0FG?=
 =?utf-8?B?MHU3OVNYUGxTU0tURkxmbGVXRFpqbmtwdHdEMHBwWHFhV1I4YlZPR3o2U0xx?=
 =?utf-8?B?QzRPZU5yRTZna3VGaXphdkNCYiszdEduMHIzQTRGNHB5MlJTQmRLWEZkd3FX?=
 =?utf-8?B?aitJdCtCY1NPbjZqQm90RWd5bkFRdUU0azBzelB2YmkvSmRIQk9jQ1NPSy9H?=
 =?utf-8?B?aEMrSXJxdnlpdXVLK1RnNnVsNFFEQnJicnRHZEt0NWhaem9FSUFUaXgyYmF5?=
 =?utf-8?B?eERWZk1jZlZWbEkxaW9WV3FTQ1BzeGozdFNMQWNMejVpcldReW94ZmtucjVo?=
 =?utf-8?B?d0Iwa2pUY29uUS8zeEQ5Zm9qWUN1aFNPMGRxdk15eVF6R3doVGJWY1NQc0xP?=
 =?utf-8?B?TlUrSEpMcVRQcitFc1h4S1FuL0EvTkRQejJlNG5YVFB6bVF3Y2FYeXFZRU9G?=
 =?utf-8?B?Zm1ubkEzUHR6eFUzRlRuRk00amJsSTMxTGZqZHdkQ2FINVRYVlRxNkhlTVI4?=
 =?utf-8?B?bW5odDRXNldYbUpvZ0VmS3J1YlhNaWlhcitlS25mcXBYUksrWmR2Yi9sZHcy?=
 =?utf-8?Q?b2uNL7LfodfoiefCDu7ntYor0Ivnr0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: dentsplysirona.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR17MB4848.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2702e2b9-5473-4a28-084c-08da03580548
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2022 12:09:40.5552
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bc74e59c-5fa3-4157-9c37-6e5063d11a62
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sL90zVK5T1ZDjxHdKb1Oi9Ls7gGI8Xq6pFBfwAh5ghipcfvpqNOYE/A9F/A8507nXyK/3h5Z4FEWMK8Opp+FSWkY+arrTpABoXxoruD/Ff6r6Rm3thPs5IN0uSsLVqx5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR17MB3532
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

VGhpcyBwYXRjaCBhZGRzIGRldmljZXRyZWUgcHJvcGVydGllcyB0byBlbmFibGUgc2lnbmFsIGJv
b3N0aW5nIG9uIFVTQiBwb3J0cy4NCg0KU2lnbmVkLW9mZi1ieTogQmFzdGlhbiBOZXVtYW5uIDxi
YXN0aWFuLm5ldW1hbm5AZGVudHNwbHlzaXJvbmEuY29tPg0KLS0tDQogZHJpdmVycy91c2IvbWlz
Yy91c2IyNTF4Yi5jIHwgMzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0NCiAxIGZp
bGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdXNiL21pc2MvdXNiMjUxeGIuYyBiL2RyaXZlcnMvdXNiL21pc2MvdXNiMjUx
eGIuYw0KaW5kZXggMDRjNGUzZmVkMDk0Li42MjUxMDYzNDNkMTIgMTAwNjQ0DQotLS0gYS9kcml2
ZXJzL3VzYi9taXNjL3VzYjI1MXhiLmMNCisrKyBiL2RyaXZlcnMvdXNiL21pc2MvdXNiMjUxeGIu
Yw0KQEAgLTU3NSw2ICs1NzUsMzYgQEAgc3RhdGljIGludCB1c2IyNTF4Yl9nZXRfb2ZkYXRhKHN0
cnVjdCB1c2IyNTF4YiAqaHViLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHdjaGFy
X3QgKilodWItPnNlcmlhbCwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFVTQjI1MVhC
X1NUUklOR19CVUZTSVpFKTsNCg0KKyAgICAgICBodWItPmJvb3N0X3VwID0gVVNCMjUxWEJfREVG
X0JPT1NUX1VQOw0KKyAgICAgICBpZiAoIW9mX3Byb3BlcnR5X3JlYWRfdTMyKG5wLCAiYm9vc3Qt
dXAiLA0KKyAgICAgICAgICAgJnByb3BlcnR5X3UzMikpDQorICAgICAgICAgICAgICAgaHViLT5i
b29zdF91cCB8PSAocHJvcGVydHlfdTMyIDw8IDApOw0KKw0KKyAgICAgICBodWItPmJvb3N0XzE0
ID0gVVNCMjUxWEJfREVGX0JPT1NUXzE0Ow0KKyAgICAgICBpZiAoIW9mX3Byb3BlcnR5X3JlYWRf
dTMyKG5wLCAiYm9vc3QtMSIsDQorICAgICAgICAgICAmcHJvcGVydHlfdTMyKSkNCisgICAgICAg
ICAgICAgICBodWItPmJvb3N0XzE0IHw9IChwcm9wZXJ0eV91MzIgPDwgMCk7DQorICAgICAgIGlm
ICghb2ZfcHJvcGVydHlfcmVhZF91MzIobnAsICJib29zdC0yIiwNCisgICAgICAgICAgICZwcm9w
ZXJ0eV91MzIpKQ0KKyAgICAgICAgICAgICAgIGh1Yi0+Ym9vc3RfMTQgfD0gKHByb3BlcnR5X3Uz
MiA8PCAyKTsNCisgICAgICAgaWYgKCFvZl9wcm9wZXJ0eV9yZWFkX3UzMihucCwgImJvb3N0LTMi
LA0KKyAgICAgICAgICAgJnByb3BlcnR5X3UzMikpDQorICAgICAgICAgICAgICAgaHViLT5ib29z
dF8xNCB8PSAocHJvcGVydHlfdTMyIDw8IDQpOw0KKyAgICAgICBpZiAoIW9mX3Byb3BlcnR5X3Jl
YWRfdTMyKG5wLCAiYm9vc3QtNCIsDQorICAgICAgICAgICAmcHJvcGVydHlfdTMyKSkNCisgICAg
ICAgICAgICAgICBodWItPmJvb3N0XzE0IHw9IChwcm9wZXJ0eV91MzIgPDwgNik7DQorICAgICAg
IGh1Yi0+Ym9vc3RfNTcgPSBVU0IyNTFYQl9ERUZfQk9PU1RfNTc7DQorICAgICAgIGlmICghb2Zf
cHJvcGVydHlfcmVhZF91MzIobnAsICJib29zdC01IiwNCisgICAgICAgICAgICZwcm9wZXJ0eV91
MzIpKQ0KKyAgICAgICAgICAgICAgIGh1Yi0+Ym9vc3RfNTcgfD0gKHByb3BlcnR5X3UzMiA8PCAw
KTsNCisgICAgICAgaWYgKCFvZl9wcm9wZXJ0eV9yZWFkX3UzMihucCwgImJvb3N0LTYiLA0KKyAg
ICAgICAgICAgJnByb3BlcnR5X3UzMikpDQorICAgICAgICAgICAgICAgaHViLT5ib29zdF81NyB8
PSAocHJvcGVydHlfdTMyIDw8IDIpOw0KKyAgICAgICBpZiAoIW9mX3Byb3BlcnR5X3JlYWRfdTMy
KG5wLCAiYm9vc3QtNyIsDQorICAgICAgICAgICAmcHJvcGVydHlfdTMyKSkNCisgICAgICAgICAg
ICAgICBodWItPmJvb3N0XzU3IHw9IChwcm9wZXJ0eV91MzIgPDwgNCk7DQorDQorDQogICAgICAg
IC8qDQogICAgICAgICAqIFRoZSBkYXRhc2hlZXQgZG9jdW1lbnRzIHRoZSByZWdpc3RlciBhcyAn
UG9ydCBTd2FwJyBidXQgaW4gcmVhbCB0aGUNCiAgICAgICAgICogcmVnaXN0ZXIgY29udHJvbHMg
dGhlIFVTQiBEUC9ETSBzaWduYWwgc3dhcHBpbmcgZm9yIGVhY2ggcG9ydC4NCkBAIC01ODcsOCAr
NjE3LDYgQEAgc3RhdGljIGludCB1c2IyNTF4Yl9nZXRfb2ZkYXRhKHN0cnVjdCB1c2IyNTF4YiAq
aHViLA0KICAgICAgICAgKiBtYXkgYmUgYXMgc29vbiBhcyBuZWVkZWQuDQogICAgICAgICAqLw0K
ICAgICAgICBodWItPmJhdF9jaGFyZ2VfZW4gPSBVU0IyNTFYQl9ERUZfQkFUVEVSWV9DSEFSR0lO
R19FTkFCTEU7DQotICAgICAgIGh1Yi0+Ym9vc3RfNTcgPSBVU0IyNTFYQl9ERUZfQk9PU1RfNTc7
DQotICAgICAgIGh1Yi0+Ym9vc3RfMTQgPSBVU0IyNTFYQl9ERUZfQk9PU1RfMTQ7DQogICAgICAg
IGh1Yi0+cG9ydF9tYXAxMiA9IFVTQjI1MVhCX0RFRl9QT1JUX01BUF8xMjsNCiAgICAgICAgaHVi
LT5wb3J0X21hcDM0ID0gVVNCMjUxWEJfREVGX1BPUlRfTUFQXzM0Ow0KICAgICAgICBodWItPnBv
cnRfbWFwNTYgPSBVU0IyNTFYQl9ERUZfUE9SVF9NQVBfNTY7DQotLQ0KMi4zMC4yDQoNCg0KLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NClNpcm9uYSBE
ZW50YWwgU3lzdGVtcyBHbWJIDQpTaXR6IGRlciBHZXNlbGxzY2hhZnQgLyByZWdpc3RlcmVkIGFk
ZHJlc3M6IEZhYnJpa3N0cmHDn2UgMzEsIDY0NjI1IEJlbnNoZWltDQpSZWdpc3RlcmdlcmljaHQg
LyBjb3VydCBvZiByZWdpc3RyeTogQW10c2dlcmljaHQgRGFybXN0YWR0LCBIUkIgMjQ5NDgNCkdl
c2Now6RmdHNmw7xocmVyIC8gTWFuYWdpbmcgRGlyZWN0b3I6IERyLiBDb3JkIFN0w6RobGVyLCBK
YW4gU2llZmVydCwgUmFpbmVyIFJhc2Noa2UNCkF1ZnNpY2h0c3JhdHN2b3JzaXR6ZW5kZXIgLyBD
aGFpcm1hbiBvZiB0aGUgU3VwZXJ2aXNvcnkgQm9hcmQ6IERyLiBBbGV4YW5kZXIgVm9lbGNrZXIN
Cg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg0K
DQpEaWVzZSBFLU1haWwgaXN0IGF1c3NjaGxpZXNzbGljaCBmdWVyIGRlbiBhbmdlc3Byb2NoZW5l
biBBZHJlc3NhdGVuDQpiZXN0aW1tdCB1bmQga2FubiB2ZXJ0cmF1bGljaGUgSW5mb3JtYXRpb25l
biBiZWluaGFsdGVuLg0KLS0NClRoaXMgZS1tYWlsIGlzIGludGVuZGVkIG9ubHkgZm9yIHRoZSBk
ZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gSXQgbWF5DQpjb250YWluIGNvbmZpZGVudGlhbCBvciBw
cm9wcmlldGFyeSBpbmZvcm1hdGlvbi4NCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQ0K
