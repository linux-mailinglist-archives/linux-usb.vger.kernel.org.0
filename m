Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF776AD7B1
	for <lists+linux-usb@lfdr.de>; Tue,  7 Mar 2023 07:54:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230397AbjCGGyQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Mar 2023 01:54:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbjCGGyM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Mar 2023 01:54:12 -0500
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2114.outbound.protection.outlook.com [40.107.103.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68F623B0DD
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 22:54:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iP7HW1U8GrUs9GZBQNjOolBregsXPvVTJq8FR4Epy0O564CRtHGjncg/z++ZgwD5NVb2sigxZSvf8GZg+d6Mj7zTkC70t6nnALBFsp+qGTFsrP+nhYgJFszZW/8OMpNqTa1FZWkmbJBc6ucUI0adZmunNbGmkhitSEnpz2AEvb/iImz5HG5IQoAWgMq9xmxIJ1ZYUEDZnAtjCkobElqR8LdTN3N81T1E2VTDhkA7sOVwlK7ZIVIwBIzFtRgg4aFXxeIU7cxUw5YdiJeIqVrD2mdmk5LOcyqum5d+26A+tHdn0bTI/DwNE4yJGKL4JLsnOiQZUIk9hWgjVJ7ljWKcZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYj18BvDkC0fz8cPSIkD4lZqGJwT32kaSV804j3XU6Y=;
 b=UCTRVXVT9odo/F9eMeI6WhxbMPOKnEuLzk65HejfyZ7jBduvc/KA3T5jZvfJl+EsmlfJoBUOAxhSzDZqbL0J9gs4pWEKMckrtY02Ub/RhCph9UTL83Icx80VnbF7rDRHr6uLbELU9GF1Np+NugYumWPptvLZtq8RlK1BReEOd8AzylAj66TuYiMxjVCUNsmrZGPk4Bg1fxlwwEJwDAK8LqKt5mdg+yunRoA26vBR6iy2xuPWpzAffle/nXd56sampljEeStdGpQPG3ZQ4xvJCHKxiMMi3SFXK0HbcRVkkMK6P8X0jPdDYzUiQMY+oIs9yI+UHqLiawiZsSpC4mvjOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=se.com; dmarc=pass action=none header.from=se.com; dkim=pass
 header.d=se.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=se.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYj18BvDkC0fz8cPSIkD4lZqGJwT32kaSV804j3XU6Y=;
 b=aQeKKUxnsB5YPxfZi9RwX357MlGMcNd4kdrbYh4Xo8MQarz1y1VdTKrnt8HdrqHPq8ZGa7AWJdPD5mP2AqnPR2/QXrotlizN6dQLEfzJdFoJC1MJKC915fFb0r7On3JUuG+5F8UbfJdiCD46as5c828PYf33CYwkHYHkdFfz4f3O88Uee9QD9IN9F1iR1vs5fr8IUS3XeWjTg3H+AdjI+CsIYbObu8YJDfhqC2jPiMVrq6EsmDbgfmFiLMWDYS4sMUosfySd+zdYS3Qe1DUNOF/L/9aS4uhtrpvmjg52g7pCZQDicvB5z/9QGv3nBUrkMPNVQ2TxiKJYdKHSrz2gXg==
Received: from DB7PR04MB4012.eurprd04.prod.outlook.com (2603:10a6:5:1a::22) by
 PA4PR04MB9437.eurprd04.prod.outlook.com (2603:10a6:102:2a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27; Tue, 7 Mar
 2023 06:54:04 +0000
Received: from DB7PR04MB4012.eurprd04.prod.outlook.com
 ([fe80::eee7:ad41:2f7:f28f]) by DB7PR04MB4012.eurprd04.prod.outlook.com
 ([fe80::eee7:ad41:2f7:f28f%6]) with mapi id 15.20.6156.028; Tue, 7 Mar 2023
 06:54:04 +0000
From:   Fengyi WU <fengyi.wu@se.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "peter.chen@nxp.com" <peter.chen@nxp.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Peter Chen <peter.chen@kernel.org>
Subject: RE: USB transaction errors causing ERROR unknown event type 37
Thread-Topic: USB transaction errors causing ERROR unknown event type 37
Thread-Index: AdlKYZ4E1yiQoFZZQKy/QYhvkMBcuAALZ1IAACJeLfAABUhMQAAPedMAAVVhiCA=
Date:   Tue, 7 Mar 2023 06:54:03 +0000
Message-ID: <DB7PR04MB4012FF81A6277688A3D0284895B79@DB7PR04MB4012.eurprd04.prod.outlook.com>
References: <DB7PR04MB40129A44420006C5048D8F7095AF9@DB7PR04MB4012.eurprd04.prod.outlook.com>
 <a1871c3c-d2a0-72e9-e96c-f0791b4663be@intel.com>
 <VI1PR04MB401592DD04F6BE20FE7F5EE895AC9@VI1PR04MB4015.eurprd04.prod.outlook.com>
 <DB7PR04MB401234A7AC2028D1E0A15A9F95AC9@DB7PR04MB4012.eurprd04.prod.outlook.com>
 <65506fa7-9c49-2b80-5a29-c8e619f02894@linux.intel.com>
In-Reply-To: <65506fa7-9c49-2b80-5a29-c8e619f02894@linux.intel.com>
Accept-Language: ja-JP, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_23f93e5f-d3c2-49a7-ba94-15405423c204_Enabled=true;
 MSIP_Label_23f93e5f-d3c2-49a7-ba94-15405423c204_SetDate=2023-03-07T06:54:00Z;
 MSIP_Label_23f93e5f-d3c2-49a7-ba94-15405423c204_Method=Standard;
 MSIP_Label_23f93e5f-d3c2-49a7-ba94-15405423c204_Name=SE Internal;
 MSIP_Label_23f93e5f-d3c2-49a7-ba94-15405423c204_SiteId=6e51e1ad-c54b-4b39-b598-0ffe9ae68fef;
 MSIP_Label_23f93e5f-d3c2-49a7-ba94-15405423c204_ActionId=6a00d1f7-2657-4f1f-9745-0f4b81e6004b;
 MSIP_Label_23f93e5f-d3c2-49a7-ba94-15405423c204_ContentBits=2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=se.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4012:EE_|PA4PR04MB9437:EE_
x-ms-office365-filtering-correlation-id: 04899066-e72c-4e9a-f289-08db1ed8bce0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B+fKm6j2ZFroFrUjwuw6s/QkBVt9aa/ouUwZIBtWj7r0NFEwiGpNyRr1ZysExlnSWSXUA6QIphQ9CoP9SLDkeilRwPDtNQauUTskyXWi7s0kiDACd436h/FHz9I5FVLgL8aV6ac5n3wu9u8eAWXJlsUyVhggneYOFD2fV6mRQ973NuM7o0NFANAh+/sGohimrmwhYMkE7DlriuhcoJC77+oNgNcC4xKrmSnDx7DSxLBKGpYs1tVgj0MaWPH1Uka1Uf9uppuKbPEpsuCBkAwWWvS3gDkYWyKf50uVQCBpwrP9ksFlvxu1esnZzQiVXral++MYdgjfWtsj8RHInSYVgwkBdEnJlbCSKWxcN1alOM7fKNrkwt5pVhwFweLFQawb9+D+uqbADFEFU+MuryVpbF59ylpcJ9y8jUmeJ7LAobjD1XqrF8eRVOBHsNVBxUNntm+J48M/fdl4ZW0mR3lpUweuXb+/JBFBHa/cu/xuNtkQdyfxUvTgBEFP4DYQFSwCA4c/qAOBANQ4Fm4mSITxRTyN4/ZIwZptY9w4v2tQqipZHoZDkal2COuEfwC3NFA5v80qxI6niTaZwkBZOokWP+mOY96APLery7qresldAHetFefoG3lhfj0jKXBntEUwEWlgzQf0Sk67BZgSBr7FeYkRJ5VjJLEFO42Et/C5SgwKXmHp18j7lTCsEjc95AtumxU/C0amXyY/u17d9mqFBA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4012.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(451199018)(33656002)(7696005)(83380400001)(478600001)(71200400001)(53546011)(52536014)(6506007)(186003)(9686003)(26005)(86362001)(66446008)(66946007)(8936002)(8676002)(41300700001)(64756008)(66556008)(2906002)(38100700002)(5660300002)(76116006)(4326008)(66476007)(54906003)(110136005)(122000001)(82960400001)(316002)(55016003)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NEY3TUVESmdRcEdURWtFWDBFeVhNbjVHazY0R2xVZHRUanc0ZWQwQ1ZScFN1?=
 =?utf-8?B?S29ZTTFjMU5DdS91RkxDblYxblNxNXd2UFRRVXh1Q0hEN3l4YjZnNzJpUkhG?=
 =?utf-8?B?Q0hNYzZXaklYVGlvTkh4V2hKYjNHc242SVBQVlZxUk5NU1pQbXUwNXY5MTB4?=
 =?utf-8?B?WTFVT3NJU3NOSFhIWTF6WHpIU01BNEJEeFZrb3ozNFI2cGpXaFRQUHIvdzcr?=
 =?utf-8?B?QUN4YktiY21OZkxNSXVpNjZDUXV0L2djMWxCaWlDSWNXckVRLzlJUEVyWXJ3?=
 =?utf-8?B?R1lBU1ovVUVZQ1ZZTkF3LzY3Y2NUTzdvUVdka0I1UTVHS3k4Q04zOVhabTd1?=
 =?utf-8?B?aXN1aVpMRzR1Uy90K1VqT1dua2RBeWVXaWZqa1NTcVVDWWxnY3IzenFHMVdi?=
 =?utf-8?B?a2pUSjBjTTVKM1QxR3VTUUVNZkVNRFRSaVBJbC9QS3hZMURubklCeUl1UUF4?=
 =?utf-8?B?TGs0TXJDb0xIenNsRTdkcDRydWFLNHN4dExadjNFaXRNdExqMlZpZzNOTFA3?=
 =?utf-8?B?QUZhN0sxZlJiRmFVd2NoTERFSk56L0ZJRFBDNGFsWHhpT25CdUdVL1pxMDlL?=
 =?utf-8?B?SjA1VFA0cGFKVzNiWnhtTVBpVTJwRi9BWU1HMVBqL3FReHdKTDlaWEJMNUdT?=
 =?utf-8?B?OHBxdWtKV01kQmcxZmlkZnJLaW93eEo0NzFYdlpZVlVBTCt5U0pocFR6Vm5C?=
 =?utf-8?B?blF2NFY2Mjl2S1d4SjU2czNCMmtSS2Z2OWxFQjlJTTdDYlBvTG92RDR3Zitx?=
 =?utf-8?B?c21TRlNJVUdVd2JxcEszRFFFU3BBK2Q3TEFTOEVhc3B4LzJnbjV5aWVod0xZ?=
 =?utf-8?B?ZllTYXFQNmlWeTNqbjJFZXNjWFJ6L0xOOXlrU05UREpSdU1Ebzg5QnFaaVFn?=
 =?utf-8?B?QmRqR2ZkV0VENk9jeHpweENydml1cm9hRzRYQlRCOVdObGxLVmhJdUxSRXNY?=
 =?utf-8?B?YnROTGhNTjJZWEprdzVUSC9UTzloUTdNQkZBZW95cEhxVmVsL3pJMm8yS29v?=
 =?utf-8?B?VkdNem1hUFhlTnBwSXlYSzRSdkZXMStQekV0Qk9NcHA1cU9qd0EzRlZzL2tZ?=
 =?utf-8?B?WWdCSGovNWovZ0k1RXU4dGlrMlkxMW5qbWFqUnV4ek9iV29DRWRkMW45VTU3?=
 =?utf-8?B?T0tTZVRHcXh6czZmT095ZEljd2RjdXFXRFZmUDhkZjdZWG1ROXkwaWVyeFhj?=
 =?utf-8?B?Q3V6bUpDbjc2SEpzcGJmMENMNER4aFdBcEdzNTFmeGhrbTlqS0VVQnZ0ZkRI?=
 =?utf-8?B?M2tYZEJacTcybVdwM29TUndPYlVLd0lELzZ4R1RPS08yNElTalJIRjhyek4w?=
 =?utf-8?B?ZlpjK3I2MGdlKzlBcXI3TXlpa1ZlWWIxVGIvZ0ZiUy8yN0hYbmI3azdHTjJp?=
 =?utf-8?B?cFJHUUU2M3JIYTZoTENpTEZZTk5INnBycThzY3ZxMjJjM1BRaEJUaENkUjF1?=
 =?utf-8?B?WG1hZS9COHdLYXhVSUNRZzVHSmNxd1E5S05NcmttM2p6SmI2Qm9wa2JZZkRT?=
 =?utf-8?B?WG1aaFp1RFJiYjc5K0hOdlFqZHlSY29ya0hVUUdvZTZ4bk9oaDZsNXBWSFF1?=
 =?utf-8?B?ZVg3bk85UlpsejdUNzFjbWw5VEQwUzRZQTNndmJpdTVsVUxBRkJrdlBVM0ox?=
 =?utf-8?B?eG54K2pSMW1uR3N4R05HOXB2bUVuTVdrSjNXUCtqUWw4Yk1uSG9ianRrcXhm?=
 =?utf-8?B?c3VVYVZFYjg3cTcrTW95K1NRMlYxUXp2RHBzNXdNMk9XWTdTN25zMEw3RFZG?=
 =?utf-8?B?YkpsZkRPa2NpaTZLbFVMZVV0N0JiejhPRWFpNWorWlZTQ1U3b2tSdEJEQnVh?=
 =?utf-8?B?RlRkVnJ0bDVsNThNTkhKZlJZSnFjN3UvSEYwcWRZcFVtK3kzQXRqcmY2UmRy?=
 =?utf-8?B?cW96c1pXQnNGZmVQMmRNUWNXYWU5bERYUzI5bmpmWmhWVmdyNWw5by84eFpj?=
 =?utf-8?B?TTNhZkF4WEVuZ2xMOWdvb1YxZmVoUCtkTlJLVW1GejFSa290bW1NOGFzbkRB?=
 =?utf-8?B?Tm9PNklPMnB3SFJvN0EwNzlzam11VmJsd3NYbFlWd0IwcFI2L1dMaUdhR1VZ?=
 =?utf-8?B?d0tSWTdsR3VqUTJKdWk2MmVCOWtQUFVnRUNqMXBYL3JRYnR3bzBTOFg0U2xo?=
 =?utf-8?Q?s2oHkMeke5/Q5m2sJi01b2qqV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: se.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4012.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04899066-e72c-4e9a-f289-08db1ed8bce0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2023 06:54:03.3060
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6e51e1ad-c54b-4b39-b598-0ffe9ae68fef
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ZVi/zwRpFsR7dnJlp/RKFBm+Jl+EgQNxsQK2hDwkH1oQeFgA+H8fdLx5riziacz5KEF0xW3sZv71r51rLwxKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9437
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksTWF0aGlhcw0KDQpXZSBkbyB0cmllZCB0aGUga2VybmVsIDUuMTUsIGFuZCBhZGRlZCBzb21l
IGxhdGVzdCBwYXRjaGVzIG9uIFVTQiBkcml2ZXIgYXMgeW91IHN1Z2dlc3RlZC5pdCBpcyBiZWNv
bWluZyB3b3JzZS4NCk5vdCBzdXJlIHdoYXQgdGhlIHByb2JsZW0gaXMgYW5kIHdlIGFyZSB0cnlp
bmcgdG8gY29udGFjdCB3aXRoIE5YUA0KDQpUaGFua3MuDQoNCg0KSW50ZXJuYWwNCg0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE1hdGhpYXMgTnltYW4gPG1hdGhpYXMubnltYW5A
bGludXguaW50ZWwuY29tPiANClNlbnQ6IFR1ZXNkYXksIEZlYnJ1YXJ5IDI4LCAyMDIzIDg6NTcg
UE0NClRvOiBGZW5neWkgV1UgPGZlbmd5aS53dUBzZS5jb20+OyBNYXRoaWFzIE55bWFuIDxtYXRo
aWFzLm55bWFuQGludGVsLmNvbT47IHBldGVyLmNoZW5AbnhwLmNvbQ0KQ2M6IGxpbnV4LXVzYkB2
Z2VyLmtlcm5lbC5vcmc7IFBldGVyIENoZW4gPHBldGVyLmNoZW5Aa2VybmVsLm9yZz4NClN1Ympl
Y3Q6IFJlOiBVU0IgdHJhbnNhY3Rpb24gZXJyb3JzIGNhdXNpbmcgRVJST1IgdW5rbm93biBldmVu
dCB0eXBlIDM3DQoNCltFeHRlcm5hbCBlbWFpbDogVXNlIGNhdXRpb24gd2l0aCBsaW5rcyBhbmQg
YXR0YWNobWVudHNdDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQoNCg0KDQpI
aQ0KDQooc3F1YXNoaW5nIGFuZCBtb2RpZnlpbmcgdGhlIHR3byB0b3AgcG9zdGVkIGVtYWlscyBh
IGJpdCB0byBtYWtlIHRoaXMgbW9yZSByZWFkYWJsZSkNCg0KT24gMjguMi4yMDIzIDYuMzcsIEZl
bmd5aSBXVSB3cm90ZToNCg0KPiBXZSBmb2xsb3dlZCB5b3VyIHN1Z2dlc3Rpb24gYW5kIHRyaWVk
IHRvIGFkZCB0aGlzIHBhdGNoIHRvIHRoZSA1LjQga2VybmVsLG5vdGhpbmcgaGFzIGNoYW5nZWQu
DQo+IDM2ZGMwMTY1N2I0OSB1c2I6IGhvc3Q6IHhoY2k6IFN1cHBvcnQgcnVubmluZyB1cmIgZ2l2
ZWJhY2sgaW4gdGFza2xldCANCj4gY29udGV4dA0KPg0KPiBXZSBhbHNvIGFkanVzdGVkIHRoZSB4
aGNpIGludGVycnVwdCBtb2RlcmF0aW9uIGludGVydmFsIChJTU9ESSkgZnJvbSA0MDAwMCB0byAx
MDAwMC4NCj4gTm90aGluZyBjaGFuZ2VkIGVpdGhlci4NCj4NCj4gQW5kIHdlIGFyZSB0aGlua2lu
ZyB0byB0cnkgdGhlIDUuNSBrZXJuZWwgbmV4dCwgYnV0IG5vdCBzdXJlIGlmIHRoaXMgd2lsbCBt
YWtlIGFueSBkaWZmZXJlbmNlIG9yIG5vdC4NCj4NCg0KSSdkIHJlY29tbWVuZCB0cnlpbmcgYSBt
b3JlIHJlY2VudCB1cHN0cmVhbSA2LjEgb3IgNi4yIGtlcm5lbA0KDQo+IFdlIGRvIHRyaWVkIHRo
ZSB1YnVudHUga2VybmVsIDUuNCwgaXQgd2FzIHdvcmtpbmcgd2l0aG91dCBhbnkgcHJvYmxlbSBh
cyBJIG1lbnRpb25lZC4NCg0KSWYgdGhlIHByb2JsZW0gaXMgb25seSB2aXNpYmxlIHdpdGggYSBj
dXN0b20gTlhQIGtlcm5lbCB0aGVuIHRoZXJlIGlzbid0IG11Y2ggSSBjYW4gZG8uDQoNCj4gTGV0
IG1lIGdpdmUgeW91IG1vcmUgaW5mbywgc28gd2UgY2FuIGRlYnVnIGFuZCBhbmFseXNpcyB0b2dl
dGhlci4NCj4gSSBkaWQgYSB0cmFjZSB1c2luZyB0aGUgY29tbWFuZCBiZWxvdywgY2FuIHlvdSBj
aGVjayB0aGUgYXR0dGFjaGVkIHRyYWNlIGZpbGU/DQo+IGVjaG8gODE5MjAgPiAvc3lzL2tlcm5l
bC9kZWJ1Zy90cmFjaW5nL2J1ZmZlcl9zaXplX2tiDQo+IGVjaG8gMSA+IC9zeXMva2VybmVsL2Rl
YnVnL3RyYWNpbmcvZXZlbnRzL3hoY2ktaGNkL2VuYWJsZQ0KPg0KPiBJIGRvIGZvdW5kIEV2ZW50
IFJpbmcgRnVsbCBFcnJvciBpbnNpZGUgdGhlIHRyYWNlIGZpbGUuDQoNClRyYWNlIHNob3dzIHRo
ZXJlIGFyZSBhIGxvdCBvZiBpc29jIFRSQnMgd2l0aCBCRUkgKEJsb2NrIEV2ZW50IEludGVycnVw
dCkgZmxhZyBxdWV1ZWQuDQpUaGVzZSB3aWxsIGZpbGwgdGhlIGV2ZW50IHJpbmcgd2l0aCB0cmFu
c2ZlciBldmVudHMgd2l0aG91dCBpc3N1aW5nIGludGVycnVwdHMuDQoNCkRpZCBzZXR0aW5nIHRo
ZSBYSENJX0FWT0lEX0JFSSBmbGFnIGZvciB0aGlzIGhvc3QgaGVscD8NCg0KQW4gbW9yZSByZWFz
b25hYmxlIGludGVycnVwdCByYXRlIGNhbiBiZSBhY2hpZXZlZCBieSBzZXR0aW5nIGJvdGggWEhD
SV9BVk9JRF9CRUkgZmxhZywgYW5kIGFkZGluZzoNCiJlZGM2NDlhODIzNDEgeGhjaTogVHVuZSBp
bnRlcnJ1cHQgYmxvY2tpbmcgZm9yIGlzb2Nocm9ub3VzIHRyYW5zZmVycyINCmZyb20gNS4xMCBr
ZXJuZWwuDQoNClRoaXMgaW4gYWRkaXRpb24gdG8gIjM2ZGMwMTY1N2I0OSB1c2I6IGhvc3Q6IHho
Y2k6IFN1cHBvcnQgcnVubmluZyB1cmIgZ2l2ZWJhY2sgaW4gdGFza2xldCBjb250ZXh0Ig0KYW5k
IHRoZSBwYXRjaCBieSBQZXRlciBDaGVuIG1lbnRpb25lZCBlYXJsaWVyDQoNClRoYW5rcw0KTWF0
aGlhcw0K
