Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF85539B26
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jun 2022 04:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349075AbiFACOT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 May 2022 22:14:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231168AbiFACOS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 May 2022 22:14:18 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2063.outbound.protection.outlook.com [40.107.104.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39BED4ECCE
        for <linux-usb@vger.kernel.org>; Tue, 31 May 2022 19:14:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FstXey1zfPz1MDINXeVgcndWLsanc1E71LPxPPMRQJiXv2cI2Uox1eVQfW6I5sDxXWuaRdV3xdUXCYTVvKzFUzf26AdLgrbjmtb6S4hjxC0KiCsJJWxr00jBQVdsY0nnPFJuzYkEmCayUyUJ0fjQ10E58xLyc5sE0Huh1GEtCRYCuxhKLRQERVM4sDVwxWlHZBt/CtM/JeQbHS73vLRndv6MOAXFGuuHgwYqvDk21IwoT0rpCdK6rgloC5R9OpoNupQSXJL7KtZAWA9OmpJPpKTs/pf/u+HDuD7lgF33xr1kRA97soikwx8oKmBhnG6yaB1q0coOtNPpcGwDx6T8jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9PRJk/Ahx7Y0Svr+M9ef/PnsyiWXLTdbX+jr69JRcXY=;
 b=QYnheVaBsMfIsxv1O4bYyksDOdsbRIm/3M/I5wimgmsCaG6sdDQfE5h95izf1Z8qZ04SdXnSh19ga5YuWBnifJOYJZZlQmPEsNGj0dYvdUbqYLCz7yVCYY8Ly0kt9wPnD46YvKMrCgBY9t7xJ3AGVFQWZmzxRiHqVzUEA1w6/LKNC1r6D5IADoeOxuViPWaBy4QkFBknyfJNgfOYvUUuuZ+4HbX/MQMJx2nYO1+iy6x9c0FuEsv4xYkJ988IVuYLPTrfuCzgSMPNMLNIqrJH6DlJpNFbJCV3poPbC26K/OBVKRH5My1Tst68C35uZCR+gnkRFUXjsoGWNYtk1ZK/ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9PRJk/Ahx7Y0Svr+M9ef/PnsyiWXLTdbX+jr69JRcXY=;
 b=TXkzXymu+Vowefhl2sA1Bj3j/regWEMJ3/eYoPM/ICkYJnSSEtKQ8XWCJ5OwGgpQIisLR8Lpuk38I6zZJIWq1sZNpklcmqf985ccOXvyYXbHWGflKrvqVdXLygS74QnWW23N34yG5TZnvn0dfKgNpaYRy7Cs2wjiaR9Vyc3gddM=
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by AM8PR04MB7939.eurprd04.prod.outlook.com (2603:10a6:20b:241::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 02:14:14 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::10c:56e5:4208:3c4f]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::10c:56e5:4208:3c4f%5]) with mapi id 15.20.5293.019; Wed, 1 Jun 2022
 02:14:14 +0000
From:   "Jun Li (OSS)" <jun.li@oss.nxp.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "Jun Li (OSS)" <jun.li@oss.nxp.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "J.D. Yue" <jindong.yue@nxp.com>
Subject: RE: [PATCH] usb: dwc3: add power down scale setting
Thread-Topic: [PATCH] usb: dwc3: add power down scale setting
Thread-Index: AQHYcaptAJTG14qTZkGTUfNT6DIUL60zeteAgAALK4CAA6oqAIACCNIAgACZRvA=
Date:   Wed, 1 Jun 2022 02:14:14 +0000
Message-ID: <PA4PR04MB9640D219F6992324938D593189DF9@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <1653642195-23889-1-git-send-email-jun.li@nxp.com>
 <7d4ad852-3781-2fde-1496-b80813fe505f@synopsys.com>
 <a0573de8-fb99-797d-bd49-e1aab7223c12@synopsys.com>
 <PA4PR04MB964065D4D3ED6DF8009A4EDB89DD9@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <f935ca2a-9b24-99d7-106e-77b95abeeefc@synopsys.com>
In-Reply-To: <f935ca2a-9b24-99d7-106e-77b95abeeefc@synopsys.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f84db55a-ffbb-4b95-936d-08da43746cb2
x-ms-traffictypediagnostic: AM8PR04MB7939:EE_
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-microsoft-antispam-prvs: <AM8PR04MB793982769D361E6C78FBD511C8DF9@AM8PR04MB7939.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DD5OR1u6ixghZv33XF+rXG35Nv6sJN7Ve8Q5dBG3DD/PzdeUF7OKYNlaIx+7ziaKmhB2KLnKa9Trl4bKGmgUu3yqYV7UFIxtngti2WXDBsqKAq4oK+pOtPvGpkuMoIaWVL9O5iyXXybswVRv3K8Tc/w5wLsw0VjmXGrDuG5xu7KmsxwDHFs41BqV1Unf3pC6KyB3Rs2I0N3dZ6wuuBJmB5dcYBo4rggdK+0a+xY46HKxwK/CNCXTsDIGA1mNer1axsOEioysK4wrxaiEQjVrmMvXpXdtuikdEs0Sq0/beMizYQQVyWp5TbDjtcfvElRePnXrOF3n7Tso+b/jQBn8eKFePP2LchtUH+TkSgf/yaehzewjcJ0qkymzH2mC/auRvdq+CJxPprJXROMQbVqcQQSHDIaORys09DXlIend4b5jKsXD4fx9qaT1NpcHO/BCH8GJlxQXtLvAiEvS/FOfFRHNrVP2A1S+RvjO/BSweiMdUDgBD4Y1CfnE346JIhML7xGIb1wpT617SHM91J4oicA8F5iqNMFVvHWUR9U0gfhxV9FsUJzOMW6B77pfZXbt37Y9EG3Cx0FBcjXV1Zpg5MOMUVb8c6oxeWLhXY2QYBIm0NCh4L1C5TVwMB1GWLnv4nSreBAVCKygS2UW7y4X6TWKlHoRdCz5Xj23cwKI5+B/4LipBSsZV2EySZR+prFfX00PNDvL8twUnj3QemlqOA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(66476007)(76116006)(66946007)(66556008)(316002)(54906003)(52536014)(110136005)(33656002)(4326008)(71200400001)(2906002)(8676002)(5660300002)(64756008)(7696005)(66446008)(508600001)(53546011)(55016003)(6506007)(122000001)(38070700005)(9686003)(38100700002)(83380400001)(26005)(86362001)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L24wYzgrbGJsa2c5VnpWbVBBdGUyQ09rU3pYM0xpNmhwcGd3ZXJLN0pMTmk2?=
 =?utf-8?B?a0U2WkllYkhWUFZPRFphNjZDdW81eWFPNXVYQkZUcTZONzRQaDFmdDlxaWVS?=
 =?utf-8?B?Ri9kWk1iL1R4MW51WndKTHdLQTlhVDdENDJRSUdzNWZpUVduYW83aWxvd2ZS?=
 =?utf-8?B?WmRHZ0VadnNTZUVZM1JqM2JNWXBnOXpiRllFWTdNczBNZWJqWWR6WTc0NUc5?=
 =?utf-8?B?NjBVZzRuNHhFTG9wcmNTNi9wUkFhOGhBTU5nMmZqdEpNQXpXMVlJN3o0eG5V?=
 =?utf-8?B?N3R0Z2JiWUFZTmtZTHBWbmtGamZYclQxd1dIS0NLVWVEMi9HTFpYbXR4MEpC?=
 =?utf-8?B?S0xHeTBRcW8wMVB1MlhlWk5ySHBnNzJlWGJVelUvelhTNzRaWlFjOUo4Zkg1?=
 =?utf-8?B?c2RyWHdUeEdwUk5Sdnp4ZSs4bTNBOElEY1BUQkJmdWxpcFFlRGNQTlMwU21M?=
 =?utf-8?B?M3RKbzJLcUlnbCtnU3RFSXBQSW1yK3p4RWJ3c2VqWDQ4ZEltYVVlWWduWllU?=
 =?utf-8?B?SnA4YWJZY1M0eURCeEY0UXpzWlUzcmpnbHRYYjRpMTJFL2RhMXlSaWpGb3Vz?=
 =?utf-8?B?L1VrL250bW1KMGNPYW9zOEhUaldBeTFGdWoyRnhoUEloZnhTektEK1NKeklk?=
 =?utf-8?B?dGxhMjdaeFFLOTBZLzJqbGVUaTNjWlZDaGFZRWRwUW9FMTE0WjZLV2dBeDYv?=
 =?utf-8?B?dEd4OG1xK2VyYldwSEFsQjJoODEvWkFNVlYvUmN2Mzh3WDUyUVNHN1c1UGxT?=
 =?utf-8?B?UEVSN0pnby9XUFhDb1J5N1JUMzZ0Zy9sL0tuRWFvKzZyclpyQUMvTlFxLzlY?=
 =?utf-8?B?VW1NeXluWGF0S0RaaTIzLzFIQjM3UFRqaGpHOFFZdTlzaytuYWhGUmJYcjM1?=
 =?utf-8?B?UkNaWU9zb29yNWFsaVpUSFNKMDBreDhSZ0VZaXJ2NXJiWnkwQ3V1K2c4RThi?=
 =?utf-8?B?QW53ZUNKWHlaTnBJVGRXSkFmU0dpZDZOaXFCQlNkOGdyZDdJdUs1WFRCc2VY?=
 =?utf-8?B?cFdnTXQ0RklDWW81L2YyN0Nhc1ZnZVVDeFdJVXhuaUpWQm1XTDhFY3VVOFo1?=
 =?utf-8?B?Q1ZpaGNLNGMwR0JmaEgrK2h3OUNKek5PYlQ1T1UrMk03YmpMTkdnOUpNOThV?=
 =?utf-8?B?WlZWV0MzaTMxVGlESXlOUCtSUUl0eEdzUHErV1BLTUl6Y3d6a2tPUGRDZStk?=
 =?utf-8?B?MFdja0dIWGJnQVBhaXpMYklXL09uRnVWeXR2ZkJCTk4rSkVKUHY3a2tYMXhw?=
 =?utf-8?B?RDRmb3pnUGpsUm5lbGdjQlpJVjFrS1ZqQzZ3WnV2YnZCdXpORHNKRkFNSmkz?=
 =?utf-8?B?alp2akFNOWVQTWlMVEVKcWpaVnRFZ0NzWE9iYWMyNHVNVFZsTzhINmkyYnVh?=
 =?utf-8?B?THIyOUY2K1lyamMrRVUxQjlRVVNOZFg1enVKVW9TNFMzNnhVMzZQU2NWQUZ2?=
 =?utf-8?B?ek5KMDc0UVlHdE9jbnNaUzQvSnNFQjRGL3RXUDF2aWc1U2NPa2lRdzZZUytN?=
 =?utf-8?B?WThSRXJkWXlwSTJjNDVsVVVrVFlaT0xlMDN1enVLcW5MWWsrUnpoL0E4ckJK?=
 =?utf-8?B?Y1FtU2RuZ3h5SnhET1B3ejllbDNuWmJWcjAxMXBIM0dqb3JOOEYwMWNjU3hZ?=
 =?utf-8?B?L2NuU0hDc0ptR2tTSzBNNmJVUzdKR2VaUnM5bFI4UjhwR1RHRDlXNUdZS2VM?=
 =?utf-8?B?cnNrRTA3TW9nbDJTQ3JqQ3NzRCsvWkl5eDhhSGI5cThoMGQzOEp6cWpYeGEz?=
 =?utf-8?B?OUgvVWRyMzlSNSt6dnZadWRldWlNTEd5Q2VlZlFpaUV1MWh4aGhmbkFkck1r?=
 =?utf-8?B?eGpHVzVObWx1Q0JaREVBV3Vnb0NKSHE5UEhtWXZmTHh0UWE0cGpqemRnbHE5?=
 =?utf-8?B?YkdXYk5xekVabkh3czVEd0RsNEVCSlBmaHVlWnV1QmgvLzN1b0ZqekpMdVFB?=
 =?utf-8?B?SGlPS2llZlV4eWh0TjRCUEs2SEpCOXBadGVWb0RZNTVzZTR4allXenQrRm91?=
 =?utf-8?B?MXBsT1ZUbVVlak9vOTZWTG5oL3labWhxRWtTVi9qeFNlK3JKRC9MQnRRMEIv?=
 =?utf-8?B?S1BoejJHL1ROWnczZlBUUTk1NTlaTUNLWnlkVG5Qc0VZemZzWGpyQVVMV0Jw?=
 =?utf-8?B?RWhoWnNqMFBWNi96VzlLbFVDZnVJdXcxSmtpbFpsQXFQV0xjcDVTRHVucVBy?=
 =?utf-8?B?TEc2eEtxRnFJb1VDSnlrUlRPUUZTb2g5UTVaNW5nMllpZGJwU2p1UXdTV1Nj?=
 =?utf-8?B?NENPOVE3N0dJVHY3TlRUR1htU2JyYjBpQ1dmNEh5RnBhMTN3dkdaLzlKZ1A3?=
 =?utf-8?Q?mJ4njv5u3qaG9l8ary?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f84db55a-ffbb-4b95-936d-08da43746cb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2022 02:14:14.4787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bwf6xSh2uOrpczuKmD+YyugAgc+TrcSAdbNlDxXHS3R5nxwVe3NCa4Cu10iAzxH9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7939
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGhpbmggTmd1eWVu
IDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMSwg
MjAyMiAxMjo0OCBBTQ0KPiBUbzogSnVuIExpIChPU1MpIDxqdW4ubGlAb3NzLm54cC5jb20+OyBU
aGluaCBOZ3V5ZW4NCj4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+OyBncmVna2hAbGludXhm
b3VuZGF0aW9uLm9yZzsNCj4gYmFsYmlAa2VybmVsLm9yZw0KPiBDYzogbGludXgtdXNiQHZnZXIu
a2VybmVsLm9yZzsgSi5ELiBZdWUgPGppbmRvbmcueXVlQG54cC5jb20+DQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0hdIHVzYjogZHdjMzogYWRkIHBvd2VyIGRvd24gc2NhbGUgc2V0dGluZw0KPiANCj4g
SnVuIExpIChPU1MpIHdyb3RlOg0KPiA+DQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPj4gRnJvbTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29t
Pg0KPiA+PiBTZW50OiBTYXR1cmRheSwgTWF5IDI4LCAyMDIyIDk6NDYgQU0NCj4gPj4gVG86IEp1
biBMaSA8anVuLmxpQG54cC5jb20+OyBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsNCj4gPj4g
YmFsYmlAa2VybmVsLm9yZw0KPiA+PiBDYzogbGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsgSi5E
LiBZdWUgPGppbmRvbmcueXVlQG54cC5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHVz
YjogZHdjMzogYWRkIHBvd2VyIGRvd24gc2NhbGUgc2V0dGluZw0KPiA+Pg0KPiA+PiBUaGluaCBO
Z3V5ZW4gd3JvdGU6DQo+ID4+PiBMaSBKdW4gd3JvdGU6DQo+ID4+Pj4gU29tZSBTb0MoZS5nIE5Y
UCBpbXg4TVEpIG1heSBoYXZlIGEgd3JvbmcgZGVmYXVsdCBwb3dlciBkb3duIHNjYWxlDQo+ID4+
Pj4gc2V0dGluZyBzbyBuZWVkIGluaXQgaXQgdG8gYmUgdGhlIGNvcnJlY3QgdmFsdWUsIHRoZSBw
b3dlciBkb3duDQo+ID4+Pj4gc2NhbGUgc2V0dGluZyBkZXNjcmlwdGlvbiBpbiBEV0MzIGRhdGFi
b29rOg0KPiA+Pj4+DQo+ID4+Pj4gUG93ZXIgRG93biBTY2FsZSAoUHdyRG5TY2FsZSkNCj4gPj4+
PiBUaGUgVVNCMyBzdXNwZW5kX2NsayBpbnB1dCByZXBsYWNlcyBwaXBlM19yeF9wY2xrIGFzIGEg
Y2xvY2sgc291cmNlDQo+ID4+Pj4gdG8gYSBzbWFsbCBwYXJ0IG9mIHRoZSBVU0IzIGNvcmUgdGhh
dCBvcGVyYXRlcyB3aGVuIHRoZSBTUyBQSFkgaXMNCj4gPj4+PiBpbiBpdHMgbG93ZXN0IHBvd2Vy
IChQMykgc3RhdGUsIGFuZCB0aGVyZWZvcmUgZG9lcyBub3QgcHJvdmlkZSBhIGNsb2NrLg0KPiA+
Pj4+IFRoZSBQb3dlciBEb3duIFNjYWxlIGZpZWxkIHNwZWNpZmllcyBob3cgbWFueSBzdXNwZW5k
X2NsayBwZXJpb2RzDQo+ID4+Pj4gZml0IGludG8gYSAxNiBrSHogY2xvY2sgcGVyaW9kLiBXaGVu
IHBlcmZvcm1pbmcgdGhlIGRpdmlzaW9uLCByb3VuZA0KPiA+Pj4+IHVwIHRoZSByZW1haW5kZXIu
DQo+ID4+Pj4gRm9yIGV4YW1wbGUsIHdoZW4gdXNpbmcgYW4gOC1iaXQvMTYtYml0LzMyLWJpdCBQ
SFkgYW5kIDI1LU1Ieg0KPiA+Pj4+IFN1c3BlbmQgY2xvY2ssIFBvd2VyIERvd24gU2NhbGUgPSAy
NTAwMCBrSHovMTYga0h6ID0gMTMnZDE1NjMNCj4gPj4+PiAocm91bmRlciB1cCkNCj4gPj4+Pg0K
PiA+Pj4+IFNvIHVzZSB0aGUgc3VzcGVuZCBjbG9jayByYXRlIHRvIGNhbGN1bGF0ZSBpdC4NCj4g
Pj4NCj4gPj4gQWxzbywgc2hvdWxkbid0IHRoZSB2YWx1ZSBzZWxlY3RlZCBiZSB0aGUgbWF4X3Jh
dGUgb2YgdGhlIHN1c3BlbmQNCj4gPj4gY2xvY2sgYW5kIG5vdCBqdXN0IHRoZSB2YWx1ZSBmcm9t
IGNsa19nZXRfcmF0ZSgpPw0KPiA+DQo+ID4gSW4gbXkgY2FzZSwgdGhlIHN1c3BlbmRfY2xrIGlz
IGZpeGVkLCBzZWVtcyBtYXggcmF0ZSBpcyBvbmx5IFVzZWQgYnkNCj4gPiBjbG9jayBwcm92aWRl
ciBhbmQgdGhlcmUgaXMgbm8gQVBJIHRvIGdldCBtYXhfcmF0ZSBmb3IgY2xvY2sgdXNlcnMuDQo+
ID4NCj4gDQo+IFNlZW1zIGxpa2Ugb25seSB0aGUgdXNlci9kZXNpZ25lciBvZiB0aGUgZGV2aWNl
IGtub3dzIHRoZSBtYXggcmF0ZSBmb3INCj4gdGhlIHN1c3BlbmRfY2xrIGlmIHRoZSBjbG9jayBm
cmVxdWVuY3kgdmFyaWVzLiBXZSBtYXkgbm90IHdhbnQgdG8NCj4gaW5hZHZlcnRlbnRseSBvdmVy
d3JpdGUgdGhlIGNvcnJlY3QvdGVzdGVkIGRlZmF1bHQgdmFsdWUgZm9yIGFsbA0KPiBkZXZpY2Vz
LiBNYXliZSB3ZSBhbHNvIG5lZWQgYSBuZXcgZGV2aWNlIHByb3BlcnR5IHRvIGluZm9ybSB0aGUN
Cj4gY29udHJvbGxlciBvZiB0aGUgcG93ZXIgZG93biBzY2FsZSB2YWx1ZSBhbmQgZ2l2ZSB0aGUg
dXNlciBhbiBvcHRpb24gdG8NCj4gb3ZlcnJpZGUgdGhlIGNhbGN1bGF0ZWQgdmFsdWUgaGVyZS4N
Cg0KVW5kZXJzdG9vZCwgY29uc2lkZXJpbmcgdGhpcyBpcyBhIHJhcmUgY2FzZSh3cm9uZyBkZWZh
dWx0IHZhbHVlKSwgYW5kDQpEVCBtYWludGFpbmVyIFJvYiBkb2VzIG5vdCBsaWtlIGNvbnRpbnVl
IGV4cGFuZCBkd2MzIGh1Z2UgcHJvcGVydHkgbGlzdA0KZm9yIHRoaXMga2luZCBvZiBzb2MgbGV2
ZWwgdGhpbmcsIGluc3RlYWQsIHByb3Bvc2UgaW1wbGllcyBieSBjb21wYXRpYmxlLA0KZG8geW91
IHRoaW5rIGlzIGl0IGFjY2VwdGFibGUgdG8gdXNlIGNvbXBhdGlibGUgY2hlY2sgbGlrZSBiZWxv
dyBmb3IgdGhpcz8NCg0KaWYgKG9mX2RldmljZV9pc19jb21wYXRpYmxlKG5vZGUsICJmc2wsaW14
OG1xLWR3YzMiKSkNCg0KdGhhbmtzDQpMaSBKdW4NCg0KPiANCj4gVGhhbmtzLA0KPiBUaGluaA0K
