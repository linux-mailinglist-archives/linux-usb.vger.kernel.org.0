Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4F46608DA
	for <lists+linux-usb@lfdr.de>; Fri,  6 Jan 2023 22:37:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236037AbjAFVhM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Jan 2023 16:37:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbjAFVhK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Jan 2023 16:37:10 -0500
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2126.outbound.protection.outlook.com [40.107.6.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A1EA82F43
        for <linux-usb@vger.kernel.org>; Fri,  6 Jan 2023 13:37:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tb0u7+Oe+tR/yZqB+9Llw4Phv8d0id1XKJusW2J1zAmgjXFapDJoYvGAodLoGZU+LFiQ4nhHODlADn8FLIIooHZumJFEDLD4ykEgOo75c5uO5EPWwYfVsXLqVgL5doSCDSvuPWwho6T+En4kcy3O9H8SHabLzzrXqNgtYnl7bC2hn08qXE3zrpmOt4SgQI47OMj8mC5jmOBtrkVbgt0DjSSuSOIzCm7xvIvcrmnKj8CBbR+bULrOL4afZdwJ/OI01TTf8yL6l03rXtsdJHL6gpWiNX+/XHnz6OGu9+IKgZQMjVx6LiFkMjfDSS2u+QR9QL06AH+SSDZvipbwmdmNQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yn3NTVHhESzOF16jibaS0fzpB4pRLrvc3qtFfA0n8A0=;
 b=WCGAS0rGnJUkz4NotJXg2lbQSnwA/bQ39Jy3q3O+m/cNdKQAprc9tg3+WWI64qJEzlfb0hoHcUqD9pJWkVkDg76Nb3u13QMPcCqO4yr7cEBHqwC9w6jBf6xY/dReJTG+4vSOUpl8CMcrLAkplINXnVwoYfyKDhQl0kfq2W0K1b3D1NMLgQytcEEwzdSMH6NdSzTAS2BO3eytaNR5hg/59SzihJJoH7Y8qoNaRAtenDbzW32tSl2akhf6zWoFqwGXlkx4RTipC5XN9QDPfLOekILlV2O+XePisidKjOyIlJ5fMQRNYX3rwfJXHvobXACOru415jXOckG9Gv6X4W9O6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=raritan.com; dmarc=pass action=none header.from=raritan.com;
 dkim=pass header.d=raritan.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grpleg.onmicrosoft.com; s=selector1-grpleg-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yn3NTVHhESzOF16jibaS0fzpB4pRLrvc3qtFfA0n8A0=;
 b=EmkRmo5neHf7LXyuXNuyc6rjQ7AVB6nO83HDbw0cNPbuqX7H1/7Cc8cOO4IOsj7an/vF6IMhUTnDFoM5FrEs56N7gAzhzGzywCx52i2QdaZm5UeYrp+xTkjLQXc+TWSU4roTYWoTLxdPLC4rOxhZXKl7AgjaquwHXvI8wol3YAo=
Received: from HE1PR0601MB2586.eurprd06.prod.outlook.com (2603:10a6:3:4a::21)
 by DB7PR06MB5260.eurprd06.prod.outlook.com (2603:10a6:10:7f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 21:37:05 +0000
Received: from HE1PR0601MB2586.eurprd06.prod.outlook.com
 ([fe80::f277:8e0a:b05:34d]) by HE1PR0601MB2586.eurprd06.prod.outlook.com
 ([fe80::f277:8e0a:b05:34d%6]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 21:37:05 +0000
From:   Palak SHAH <palak.shah@raritan.com>
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Maynard CABIENTE <maynard.cabiente@raritan.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: usb: gadget: dwc2: not getting audio data
Thread-Topic: usb: gadget: dwc2: not getting audio data
Thread-Index: AQHZCyJuT6/zbM1MKESZNNevjGResq5lbayAgABXvJCABG6MAIAFSmtQgACkS4CAIe7s4A==
Date:   Fri, 6 Jan 2023 21:37:04 +0000
Message-ID: <HE1PR0601MB25868D1181F1B2D7F92550DE8DFB9@HE1PR0601MB2586.eurprd06.prod.outlook.com>
References: <HE1PR0601MB2586962582F222B5B889416A8D1B9@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <AS8PR06MB7976A91E44D7DCDAACC723F7971B9@AS8PR06MB7976.eurprd06.prod.outlook.com>
 <HE1PR0601MB258625B74749B2DB1242E0048D1B9@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <HE1PR0601MB2586E4A641ECA0D0D043A3798D1D9@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <HE1PR0601MB258685C64D46C08C978C37EB8D1D9@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <00381dbb-3f0d-a384-35a8-d81175ee162a@synopsys.com>
 <HE1PR0601MB25861FC1248FF0A61DDBC8F58D1C9@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <BYAPR12MB339959924B478413599ACD5DA7E29@BYAPR12MB3399.namprd12.prod.outlook.com>
 <HE1PR0601MB2586C29BD05330A87124562A8DE19@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <BYAPR12MB33997EFD01B3F698AF0FBCFFA7E69@BYAPR12MB3399.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB33997EFD01B3F698AF0FBCFFA7E69@BYAPR12MB3399.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=raritan.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: HE1PR0601MB2586:EE_|DB7PR06MB5260:EE_
x-ms-office365-filtering-correlation-id: f93a3f8e-4c5e-468b-4970-08daf02e279b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lVXWtil7dNsy9a2dZ6qP9BLA5iLp8tIZwNFLoxy/vzBLX780B152/wKTWwMeQ/3Pjltm7egcTZMs/tjZrYOEZv62R81u4PCaB8vuPZFfu/FrtyLXaH6e0cKhbRabNM2FPpdw03KPpsPbFUL9j+utIuj3uY8iW/Vmazm3kF5ubmo6gi5TejaC/Txw0j3W8r+CI2eAEd5xgnTxUYdxs63HMwotPs5OnANAaVpGADgSsdYWiYkYFwjLEFxXnfJIm+CyO3mLMjfe0Chz7THwbt888UmAl7+k7XfG4kZb3o+W22fcQh2YVHkeKxqSPvVqgRjzXXpZhomegZWEzbObAurPeVD1DF7Oi1zny3M+mbRZ3ooU/xWGW7hvbrZUFnUxJ/Wv2TYJmilJoYK9AgmFIxWx+wMABFSFc30uVjHCy6poQgDgPKmQpmN5KWnnI5JHq1d6CQ7QYfoiKu8fqUUYus7TPZ6PZHzOttWWaT35xIGALovS/9bJlwx1H2yYE33G+T7G7BW8stG+mz2qjsBPXE3XJltQXF2XURx5f+H97MZSbFofaeWxzfVyrsYT0dKc8mLWD7Wy+LaPyHsxs850l4RlQmhIzjajBM6GoeUlyaUUlgZoVQJmb4R11Ob1BiOJ/hqVI8jcHr+rDkEQoPKBoZu1AdlSJmhYD4oIrR7BDvjitfUpDDZwxF+MKz9l9rcrePku4IqrAFpzSFGWrfz+1ImCa6cUf8hzKBTfdfm5niiTuk5URQc00kgFd+TQokEpngXu
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0601MB2586.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199015)(2906002)(38100700002)(71200400001)(6636002)(316002)(8936002)(66446008)(66556008)(83380400001)(66946007)(76116006)(66476007)(53546011)(26005)(4326008)(8676002)(9686003)(52536014)(66574015)(186003)(7696005)(110136005)(64756008)(6506007)(41300700001)(5660300002)(33656002)(478600001)(122000001)(86362001)(38070700005)(55016003)(414714003)(473944003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFJvRXc2WmRBQlVYT2htSGFpbDFxaFlaZU5VSUxQdkxBOGNvRkdMVXR1Wk8z?=
 =?utf-8?B?RU1OUHBYdFI4bThXSU5HTFNxODZIVTd1Uno2MUhNamIrRTl1TUJiZXI2QVZS?=
 =?utf-8?B?WHk5WStWVUtseVFPcUxBK0EwUFUrb1Nmb3c2RDBRSGpzcDJ4UjhwaEF6MmNC?=
 =?utf-8?B?dngvSE9oOEZValhYYngvMHRBaWd4K0xLdWxtV1B0RTJhVXJlZzh3VGFmbjJj?=
 =?utf-8?B?WWJuQXJNZWxkZm5ucmVBWUNteXp5U1NWQXBiZFlTSkFUZEVndTVoNVhPWWZ6?=
 =?utf-8?B?QjFPb29YR250L0pBTTlHQWJyQk1tT1dEdGZxUDhJVmtDeGZEUUgzMEtHZ1ow?=
 =?utf-8?B?dEtnWVQyVU1RYnVZbWg3NWtzVGlOYXBGRGZ0dXRNVjYxbUxwVlZFR0ZXVmVJ?=
 =?utf-8?B?a01JbFdrUVBKNVgrUWJWZ3d3b0todWhrTWNkYjNlQlduT2dkWmZQWjNmekZz?=
 =?utf-8?B?bDlvbExlMFZDWWhjNmtlVGdyTzlCU29vaTkyazJHU1lxVG9wZDE2UDlISDNh?=
 =?utf-8?B?OHRHRk1WdTRGdzBmRVFlUU1VbERZaDB5MWdJWi8zUjZmVExWbjZQVG5pV1d4?=
 =?utf-8?B?R2RzWGNKUjlyTExRb1RmRHF3K3JsRWJ5SVA5dWY4TUcvM2lnSnJLSm5WT3JI?=
 =?utf-8?B?KzMvOFlraHF4NGk4akFab0h0Uk1iRDY4RWVQOXVoNnpGRVZrZnFScy9FQzRW?=
 =?utf-8?B?TkI2enhQcGpFdHBiU0ZKaTZLSjdyYzhOelVwNGtQNC9QRXliYUMzbHc3TmZa?=
 =?utf-8?B?ZVBIYUlpR1dON0RaRVBJVkhqZlE4S2d2Rjd1RmcraWNiK2wzdEVXeFBHQjdK?=
 =?utf-8?B?YmFkbmE2cEw1WFNsbW5CeE5oUm85VWErMEQwL1plODFDU1R0bTFDdzF1eHov?=
 =?utf-8?B?ZVVza3h2QU9tZXRRYXFaZWJORTgvODdQNDV2ZWQ0ZXhJcjFrUW9qSG1lbTBm?=
 =?utf-8?B?QUs5WGVUaXVlVno1VWQ5cWpvelVXS3NBT2VyQUtyaEg3bXR5eDY2OUU5K3pP?=
 =?utf-8?B?SER1Mzk0Vnp1eE85V1VyZ3ZyYkhjd1JkOXNIWVdtejFqMTRvYXhHR0FGeklQ?=
 =?utf-8?B?WXVHTFU0TVFxSXhqMUVqZ3pnQzhqUTFQdXhBbm5zc0tEaVJlV1ZtaitoTGx1?=
 =?utf-8?B?QThVdEpHYVRDZEU5U1hOYTFJaVV4RzdnM3RIM2w2T0FHTkNqWHBSRUlTZHBo?=
 =?utf-8?B?TE5tSXZXNWpZL3czT2QyNUtCVEo1aGNTU2Q1cWhVWlRTS3NaMEhRaFhEaDhz?=
 =?utf-8?B?SFJoUHhsZVBRSDFlenlleDViajFkejVmbVlIN2U5UnRvYWdIODJuNHpYNzhj?=
 =?utf-8?B?dE40ZzVLSzdqUDdOMkVQVzMxcmk3a1VaS2Nvc1RweCtwZzk1RW95SW1JcHc1?=
 =?utf-8?B?UU1UdkthcVc1UStmOTRTZXMvSFBvMncremZhazYvKzNlMDZTbjE5WEc3aHpk?=
 =?utf-8?B?aHNYUDZxbzJzdFJPTHp3QUFnRjRKQ3FNWDFteU9FdHJhSkJVaFV5Rm43b3Jj?=
 =?utf-8?B?V2ErZThLNFZsVExDRXQrWHJ4R2VQcFNhcEZBK3ZFd3VjZlVaZGIxNFVyZWtB?=
 =?utf-8?B?QkR5NUt2bTNRU3FOeWVpVFl6aHpmY2tBTk5OZEx4OUJjZG9adUhJMzVTTElT?=
 =?utf-8?B?TDVsVjZjb1l4MjAxc3VNeS9PMnk4cGtzblpzVzUwZzE3alNGTFNyRi9yOWJ6?=
 =?utf-8?B?K0lMbWc5QURkZnVCTVJKNktJZDgxVE5TL0FvZStmODFNWWQxOTJwT0pBSTd2?=
 =?utf-8?B?elFNSWV4WGQzcERoU3k1WHA3RXpvUm5aTGhDM3JyUk56aG5RSW1Tc2ppdVk0?=
 =?utf-8?B?ejY1SUpmdXNVamdwdUhxUWtkU0ZBblRCYXpOK0xZSlFSUG5aa0hhb0xTYitX?=
 =?utf-8?B?MmR3YUxjSk4xUit0WjlvUGd3cy9rSVdiRTI0YzVlcDRzSkpsWGQ4N2Uybmtk?=
 =?utf-8?B?VEVkYXI0UHU0bjBqK3pGUklyYngrZHFBb2pVMXF1ZXlaQ0J3Tk84d0RkekVI?=
 =?utf-8?B?WUdoZTdBT0ZCTit3MU9UbU1aZlBJR01QS2RDa0VGWnJYVXBsRWJvM203UENn?=
 =?utf-8?B?WUp3NEtUODJKUjU1VXVYK2tDb0NsZERLOHRWQzJSL0hLN2tXZlFUb1dtTWNE?=
 =?utf-8?Q?ymYIifRVRn2lbq2eAD8e7zIjX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: raritan.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0601MB2586.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f93a3f8e-4c5e-468b-4970-08daf02e279b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2023 21:37:04.9840
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 199686b5-bef4-4960-8786-7a6b1888fee3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KNXD8/JDHZxF5z1wkHMzjLgPvWkK6xAbNXpkZ6BH0gG2DdPWybcBCswv0wp0aiAjOR969bKwrZzqtpO3v7Gggw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR06MB5260
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgTWluYXMsDQpTb3JyeSBmb3IgdGhlIGRlbGF5IGluIHJlcGx5aW5nIHRvIHRoZSBsYXN0IHBv
c3QuDQoNClRvIGFuc3dlciB5b3VyIHF1ZXN0aW9uLCBJIGRvIG5vdCBzdG9wIHRoZSBob3N0IGZy
b20gcGxheWluZyB0aGUgYXVkaW8uDQoNCkluIHRlcm1zIG9mIGRlYnVnIG1lc3NhZ2VzLCB3aGF0
IG1lc3NhZ2VzIHNob3VsZCBJIGxvb2sgaW50bywgdG8gc2VlIHRoZSB0aW1lIGdhcHM/IFdlIHdh
bnQgdG8gZGlnIGRpcHBlciBpbnRvIHRoaXMgYW5kIG5lZWQgbW9yZSBjbGFyaWZpY2F0aW9uIG9u
IHdoYXQgSSBzaG91bGQgYmUgbG9va2luZyBhdD8NCg0KVGhhbmtzLA0KUGFsYWsNCg0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE1pbmFzIEhhcnV0eXVueWFuIDxNaW5hcy5IYXJ1
dHl1bnlhbkBzeW5vcHN5cy5jb20+DQpTZW50OiBGcmlkYXksIERlY2VtYmVyIDE2LCAyMDIyIDI6
MDMgQU0NClRvOiBQYWxhayBTSEFIIDxwYWxhay5zaGFoQHJhcml0YW4uY29tPjsgTWF5bmFyZCBD
QUJJRU5URSA8bWF5bmFyZC5jYWJpZW50ZUByYXJpdGFuLmNvbT4NCkNjOiBsaW51eC11c2JAdmdl
ci5rZXJuZWwub3JnDQpTdWJqZWN0OiBSRTogdXNiOiBnYWRnZXQ6IGR3YzI6IG5vdCBnZXR0aW5n
IGF1ZGlvIGRhdGENCg0KSGkgUGFsYWssDQoNCk9uIDEyLzE2LzIwMjIgMToxNiBBTSwgUGFsYWsg
U0hBSCB3cm90ZToNCj5Gcm9tOiBQYWxhayBTSEFIIDxwYWxhay5zaGFoQHJhcml0YW4uY29tPg0K
PlNlbnQ6IEZyaWRheSwgRGVjZW1iZXIgMTYsIDIwMjIgMToxNiBBTQ0KPlRvOiBNaW5hcyBIYXJ1
dHl1bnlhbiA8aG1pbmFzQHN5bm9wc3lzLmNvbT47IE1heW5hcmQgQ0FCSUVOVEUNCj48bWF5bmFy
ZC5jYWJpZW50ZUByYXJpdGFuLmNvbT4NCj5DYzogbGludXgtdXNiQHZnZXIua2VybmVsLm9yZw0K
PlN1YmplY3Q6IFJFOiB1c2I6IGdhZGdldDogZHdjMjogbm90IGdldHRpbmcgYXVkaW8gZGF0YQ0K
Pg0KPkhpIE1pbmFzLA0KPlBsZWFzZSBmaW5kIGF0dGFjaGVkIHRoZSBsb2dzIEkgZ290IGFmdGVy
IEkgYXBwbGllZCB5b3VyIGxhdGVzdCBwYXRjaC4NCj4NCj5UaGFua3MsDQo+UGFsYWsNCj4NCg0K
SW4gbGFzdCBsb2cgSSBkb24ndCBzZWUgYW55IG9idmlvdXMgaXNzdWUgYmVzaWRlcyBzdXNwaWNp
b3VzIDYgc2Vjb25kIHRpbWUgZ2FwIGFmdGVyIGxhc3QgZXAxb3V0IHRyYW5zZmVyIGNvbXBsZXRl
IGFuZCBjb250cm9sIHJlcXVlc3RzIGZyb20gaG9zdCBvbiBnZXR0aW5nIHN0cmluZyBkZXZpY2Ug
ZGVzY3JpcHRvcnMuIENvdWxkIHlvdSBwbGVhc2UgZXhwbGFpbiB3aHkgdGhpcyB0aW1lIGdhcCBo
YXBwZW4/IERvIHlvdSBzdG9wIHBsYXlpbmcgZnJvbSBob3N0IHNpZGU/IElmIG5vLCB0aGVuIGl0
J3MgbG9va3MgbGlrZSB5b3VyIHBsYXRmb3JtIGlzc3VlIC0gaW50ZXJydXB0cyBmcm9tIGNvcmUg
ZG9lc24ndCBhY2hpZXZlIGRyaXZlci4NCkRyaXZlciBpcyBpbnRlcnJ1cHQgZHJpdmVuIFNXIGFu
ZCBjYW4ndCB3b3JrIGNvcnJlY3RseSBpZiBpbnRlcnJ1cHRzIG5vdCBhc3NlcnRlZCBvciBub3Qg
cGFzc2VkIHRvIGRyaXZlci4NCg0KU2FtZSB0eXBlIG9mIHRpbWUgZ2FwcyAobm90IGFzc2VydGVk
IGludGVycnVwdHMpIHNlZW4gaW4gcHJldmlvdXMgbG9ncyB0b286DQoxLiBLWDQtMTAxXzIwMjIt
MTItMDZUMTZfMDBfMzguMDM5Wi50eHQsIDIgc2Vjb25kczoNCg0KWyAgMTgyLjE1NDc5OV0gZHdj
MiBmZmI0MDAwMC51c2I6IHVyZXEtPmxlbmd0aDo2IHVyZXEtPmFjdHVhbDowIFsgIDE4NC45NDAz
NTddIGR3YzIgZmZiNDAwMDAudXNiOiBkd2MyX2hzb3RnX2lycTogZGFpbnQ9MDAwMjAwMDANCg0K
Mi4gS1g0LTEwMV8yMDIyLTEyLTA5VDE2XzQxXzQ1LjU3OVoudHh0LCAzIHNlY29uZHM6DQoNClsg
Mjg0Ny42ODE2MzBdIGR3YzIgZmZiNDAwMDAudXNiOiBlcDFvdXQ6IHJlcSAzMDdkMzc1ZjogMjAw
QDNhNTYzOGFhLCBub2k9MCwgemVybz0wLCBzbm9rPTAgWyAyODUwLjQ0MjQ0MF0gZHdjMiBmZmI0
MDAwMC51c2I6IGR3YzJfaHNvdGdfaXJxOiAwNDI4YzBiOCAwMDA4MDAwMCAoZDA4YzNjNDQpIHJl
dHJ5IDgNCg0KMy4gS1g0LTEwMV8yMDIyLTEyLTEyVDE2XzQ2XzE2LjM2NVoudHh0LCA3IHNlY29u
ZHM6DQoNClsgIDUwNC4zMzU0MDhdIGR3YzIgZmZiNDAwMDAudXNiOiBkd2MyX2dhZGdldF9jb21w
bGV0ZV9pc29jX3JlcXVlc3RfZGRtYTogY29tcGxfZGVzYyAjIDE4IFsgIDUxMS4wNjgzNjhdIGR3
YzIgZmZiNDAwMDAudXNiOiBkd2MyX2hzb3RnX2lycTogMDQyOGMwMzggMDAwODAwMDAgKGQwOGMz
Y2M0KSByZXRyeSA4DQoNCjQuIEtYNC0xMDFfMjAyMi0xMi0xNVQyMV8xNF8zNS45NjRaLnR4dCwg
NiBzZWNvbmRzOg0KDQpbICAgODMuNzk2MTk1XSBkd2MyIGZmYjQwMDAwLnVzYjogZHdjMl9nYWRn
ZXRfY29tcGxldGVfaXNvY19yZXF1ZXN0X2RkbWE6IGNvbXBsX2Rlc2MgIyAxMg0KWyAgIDg5Ljgx
NzcwMF0gZHdjMiBmZmI0MDAwMC51c2I6IGR3YzJfaHNvdGdfc3RhcnRfcmVxOiAwZWQ4NDAwMCBw
YWQgPT4gMHgwMDAwMGIxNA0KDQpJIHdvdWxkIHJlY29tbWVuZCB5b3UgdG8gaW52ZXN0aWdhdGUg
eW91ciBwbGF0Zm9ybSB0byBmaW5kIG91dCByZWFzb24gb2YgdGhlc2UgdGltZSBnYXBzLg0KDQpU
aGFua3MsDQpNaW5hcw0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQoNCkNl
IG1lc3NhZ2UsIGFpbnNpIHF1ZSB0b3VzIGxlcyBmaWNoaWVycyBqb2ludHMgw6AgY2UgbWVzc2Fn
ZSwgcGV1dmVudCBjb250ZW5pciBkZXMgaW5mb3JtYXRpb25zIHNlbnNpYmxlcyBldC8gb3UgY29u
ZmlkZW50aWVsbGVzIG5lIGRldmFudCBwYXMgw6p0cmUgZGl2dWxndcOpZXMuIFNpIHZvdXMgbifD
qnRlcyBwYXMgbGUgZGVzdGluYXRhaXJlIGRlIGNlIG1lc3NhZ2UgKG91IHF1ZSB2b3VzIHJlY2V2
ZXogY2UgbWVzc2FnZSBwYXIgZXJyZXVyKSwgbm91cyB2b3VzIHJlbWVyY2lvbnMgZGUgbGUgbm90
aWZpZXIgaW1tw6lkaWF0ZW1lbnQgw6Agc29uIGV4cMOpZGl0ZXVyLCBldCBkZSBkw6l0cnVpcmUg
Y2UgbWVzc2FnZS4gVG91dGUgY29waWUsIGRpdnVsZ2F0aW9uLCBtb2RpZmljYXRpb24sIHV0aWxp
c2F0aW9uIG91IGRpZmZ1c2lvbiwgbm9uIGF1dG9yaXPDqWUsIGRpcmVjdGUgb3UgaW5kaXJlY3Rl
LCBkZSB0b3V0IG91IHBhcnRpZSBkZSBjZSBtZXNzYWdlLCBlc3Qgc3RyaWN0ZW1lbnQgaW50ZXJk
aXRlLg0KDQoNClRoaXMgZS1tYWlsLCBhbmQgYW55IGRvY3VtZW50IGF0dGFjaGVkIGhlcmVieSwg
bWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIGFuZC9vciBwcml2aWxlZ2VkIGluZm9ybWF0aW9uLiBJ
ZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50IChvciBoYXZlIHJlY2VpdmVkIHRo
aXMgZS1tYWlsIGluIGVycm9yKSBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkg
YW5kIGRlc3Ryb3kgdGhpcyBlLW1haWwuIEFueSB1bmF1dGhvcml6ZWQsIGRpcmVjdCBvciBpbmRp
cmVjdCwgY29weWluZywgZGlzY2xvc3VyZSwgZGlzdHJpYnV0aW9uIG9yIG90aGVyIHVzZSBvZiB0
aGUgbWF0ZXJpYWwgb3IgcGFydHMgdGhlcmVvZiBpcyBzdHJpY3RseSBmb3JiaWRkZW4uDQo=
