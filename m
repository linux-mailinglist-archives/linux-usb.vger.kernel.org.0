Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE2570D96A
	for <lists+linux-usb@lfdr.de>; Tue, 23 May 2023 11:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235434AbjEWJqY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 May 2023 05:46:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233035AbjEWJqW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 May 2023 05:46:22 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2070.outbound.protection.outlook.com [40.107.105.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54336121
        for <linux-usb@vger.kernel.org>; Tue, 23 May 2023 02:45:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKZFSz1uK9qXYXpp9mYbClW8QWOab7n1PAPTIMAdFaWRALmvzCKyKB70d0eS3RAv4eCPCdqptb2W+UwsS0eqmOR5zYZD7d1zeHsPgn999hrGhNp99PMXOgOBec4iPkz+LRGBI1kUYrP3YHOGO6VynwZ6BS2K7AdAjpynlfwJcCG5TahRfcUwBV7fH2b1A1vZxqfRGytko1oKd+Vt2uANiOun1fm99mdFVvRIV5s+t1AzjzCZxtDLnKaWtVPjfnBy8n03xrPUkS1opXL2lAg6YiSMn1MAnkusHyCyCpGCSYDP6jRqEcuRs3BBQJQ4ha1N74Y/gvObuzdGO+CTJm0czg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7+GjrLdV4mGJW2gtlcdVy63itS2nuckKFmD+kVuO9M=;
 b=G3TNsL1zu7PHpeZdzLvAEUptkENv/Js6/uAoH5gIP2zaCVPq85IAVrvQp+l/WBQGWWKmFia+CkVdEmEMEUnIPlAthe4TOK7L1h1PCDy/5pNAawBZoIvygsYlqAQeV3aJbyvKyx09NtmFn7zQNNsi6pmI0VyKDMFjyt9MbRSjMGKaKFE1fHrWQNBdIWczLcMDC59PuLUjeVtob+sr5tGdHJz8+Vn4OZ9LVzMsrAkuFkfneNanuVd6UIiLNd1HtrLVfbzr/ZsDF6kdaEGYt3BNFgKEkGKVoOQvUqEygWPA36P6HvzjNsiI9PAe2V82exJPxRYSTdY7du4xyhuwSfKz4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nordicsemi.no; dmarc=pass action=none
 header.from=nordicsemi.no; dkim=pass header.d=nordicsemi.no; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nordicsemi.no;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7+GjrLdV4mGJW2gtlcdVy63itS2nuckKFmD+kVuO9M=;
 b=nNKCgb1nRD3u7vrqYVDiF/aprqrkK+nwXeEoVEWRXqtKPgHOHmeh7auVHhJXf9wD3DyZNTFzFskzKfC6gFMA5Lxd+s/043/0U9ucnXv3rzQxd3HB8EzFIvbx1UtLAX/3mdTGF1q/ysmFJQgxtZCv813Z81tVA3XeF9QbbmYc5e10/W/bDIlceaENIZRZz3lfiuajUkDHPrz8iTNGKSHZO0nxsRDo5JY8DQUPOU/YmQ0kSvw4tnEB/tsw9+9QWHI2bj5pGaf8yH/sK3D9NBJLcF0/oSubgBHMqBzckXnNtc0AR/pqndhEk/w3QbdRhGOsnSy3ZWIs+hnQozLEjqdOWw==
Received: from AS8PR05MB8149.eurprd05.prod.outlook.com (2603:10a6:20b:31a::7)
 by PAXPR05MB8955.eurprd05.prod.outlook.com (2603:10a6:102:2b7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 09:45:49 +0000
Received: from AS8PR05MB8149.eurprd05.prod.outlook.com
 ([fe80::4fb5:8a89:3ae3:96e2]) by AS8PR05MB8149.eurprd05.prod.outlook.com
 ([fe80::4fb5:8a89:3ae3:96e2%3]) with mapi id 15.20.6411.029; Tue, 23 May 2023
 09:45:49 +0000
From:   =?utf-8?B?TW/FhCwgVG9tYXN6?= <tomasz.mon@nordicsemi.no>
To:     "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
CC:     "YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
        "andreas.noever@gmail.com" <andreas.noever@gmail.com>,
        "michael.jamet@intel.com" <michael.jamet@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: USB 2.0 host controller for Thunderbolt 4
Thread-Topic: USB 2.0 host controller for Thunderbolt 4
Thread-Index: AQHZjVQMztybc2SJW0m88m0XCPIwka9nj64AgAAMXgA=
Date:   Tue, 23 May 2023 09:45:49 +0000
Message-ID: <551c6ce270bac239fbcebd5280e426851b84ee0e.camel@nordicsemi.no>
References: <bd807b391dec726401e36a25f8c8987571d771be.camel@nordicsemi.no>
         <20230523090132.GO45886@black.fi.intel.com>
In-Reply-To: <20230523090132.GO45886@black.fi.intel.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nordicsemi.no;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR05MB8149:EE_|PAXPR05MB8955:EE_
x-ms-office365-filtering-correlation-id: 9b1724aa-bb7d-4ba8-7220-08db5b727db9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aRsyEQsVMfGrEya1ahMJ/6t2MqKA1g93JZKeG1W0v4fzWpS3kiWKuTtuRQeQIc/NM/WBAb9wtCNDoOODgiIEr1k9HSmi+PV1NtuaWJmb4oZVzt0tD5FMP8GWsAxFsxpJXjECsHE27vnzvdwXdyGOPOAPIFAWBELhY5tkKsIV1w0XyiVT48Fv5/1DrlV5GROTuEENvpmrPpL++xtr2Xjvo641R2e4bhRXfIUI4mqUBQ6nLlcMJvNdw+U9aXVd3sn6bOFq6fdNpIAwOCRY8fVrRNYPKwBuazeFTZ+9spFWFmfeJ3yRTzPt05/gGXjsAQRzSivmI6buHn8dJT8kx6fCxA8/UjlusL46tIol2cCU9bgjtMvCEXZox0NOeG8lMnlbGTE0x6JAj4d6PFe3zmmME0M1pLJLaQoacF7lGFV7kY6ppTw5zSsEaNjD2BhNia56Qek2ELoi7May7WqLirsVL2U4tfYpdmnTtyw0T3fGHecinW/VZwrG8eb3TDks7TEJ6xKUQDtiINZZXP3Rigrwo2JcSaGTTlBEzOAW9VbJX6SKAk/buhBZcGr88nIJc6myBMlsO56SvVJD8nUzlb50V9viIP5l+jrIruvJS1M/zELLAMKfSJJNJgTA+5DKsVLVR7gI+eFUHlvmx8EFML/utw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR05MB8149.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(1590799018)(451199021)(71200400001)(1580799015)(8676002)(8936002)(5660300002)(186003)(26005)(6512007)(6506007)(41300700001)(38100700002)(38070700005)(54906003)(122000001)(66946007)(478600001)(86362001)(66556008)(66476007)(66446008)(64756008)(91956017)(76116006)(316002)(4326008)(6916009)(2616005)(36756003)(2906002)(85182001)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0h4cUwxR2RBa00vWVVYZzVsNVRmdk1kVDZQZmRkY2lXZUZRRkpxdk5sOWdE?=
 =?utf-8?B?N0lUVVJDK2p6Y2o3cEN6Z1pndmFIaGhJWjJxdlBqbXljaGZWWXVnUTRVeFg3?=
 =?utf-8?B?TVMreWhONmFDMUFPZW0zSnRhTDEzRHNWdEF3YVQyRVVicHBNVW5udHJrR1Rm?=
 =?utf-8?B?NjFXS0hDc09MenJ0OTZRc0NrUFcyUStsb1BLSVdoQ2VuMDBQWXN2Ky84b1Nv?=
 =?utf-8?B?c01SdEgvUUZOY0ZvTUhiYm9Zb1djbyszZ3YrUkVWUEluRUNmSG5PZmVQbTNP?=
 =?utf-8?B?Z25oSFpPNzc4S2xTTUdreStVRCtSRWsvcWxoNGtoTmRhS1F3UmQxTU1DN2Nj?=
 =?utf-8?B?MjFMV0YzbHhkYVZLQ3BYUHNhM1phTklVaXpLenJNTE50dGQ2dGhtQytGZlNR?=
 =?utf-8?B?UlBrMGpwN3piNzJDZkQ5VnVqUXc5R3V0UkczdWlRMGJ6Qy9PRXp2aHFHVUFG?=
 =?utf-8?B?TnRVNDhJNnZvYjQ3Z0V6QjU5MVpyYzdyRllTKzZLcEQyZHRUdjN0ZEp5Ri80?=
 =?utf-8?B?ZWJwMWhjejVaZ01mejc4N0VwWFFWUmZuQmhqazZLQlBkTmJQblRCNG9oNklm?=
 =?utf-8?B?MmpsazJ1U0xDN0NacitQMkRUN3pMcVpmUzJYVWNxa0hiYVdQU29WWkVDWFRI?=
 =?utf-8?B?aGpYSldaYVFPSFdMaHpiREE4VTVvK3QwNWdCYVJWZVFMZ1daYmpWWWZPTU1K?=
 =?utf-8?B?Qk5DYnZKU1hkblhkQWh3YWtacVZOcGk1YWp3c3d2bHhMRTBIQ25rdlV1Szda?=
 =?utf-8?B?N2pldmQ5R2lTTU41bHAxNEpmdXFaMUFKK3pENDExS1Bkak5hQW5DaFh4cEJn?=
 =?utf-8?B?UHE3VGYzNGd3aUc0M2xQQVJCMVJ0RDhsYTFYQkEwYmNlTkR3QkRIaHg2dmlx?=
 =?utf-8?B?aFhJVDFwM05LbjA5ZFRlZ3M4QWhZRW9zL1o3dGg2OUNzK0EwT052dXFtTzF6?=
 =?utf-8?B?THB5ajc0ZWRHOE9MdzljWTdyemhNU3R4QWhVUTN2bTdZeXF2dGhWQTcrb01R?=
 =?utf-8?B?Q0pyQkxmYjdxaExLZHlPTDllYkNRMlJVY2kycWhwSjhxY0Q0NTF2Zy9WQkdv?=
 =?utf-8?B?aXJkUmlIM2o0YjN1OW0xTUU1WVhhV0ZwWnVPWG9rT1plTC9zNThyTUFFblFu?=
 =?utf-8?B?Ykoxelh1Z3ExcDlWY1J1ZnQ1ZVpGUERsZkxqN29NVG9vQjZ4MFQ1V0ZtbSta?=
 =?utf-8?B?bVFEZ2dvL2pBYmlGeGo1M2RwUXhWa0ZTSGVoSGtHMGs5K2dNTUJ5bmlDMDBx?=
 =?utf-8?B?d1U0QVcyRndoaXNrSlg1ZXMwNFJHaXpvelFkU3U3T3JNTFdKSlRuSXVuTW42?=
 =?utf-8?B?dnFxc1haUE5XMy9qa0EwS1lHT0wrUHU0a25jYVdiTUM4R2RuQ1E0OHo3QU4w?=
 =?utf-8?B?ZzBIb0FmMEIrNStWYldic05rVVFVWDUxWDc0YlcvTU1ESnFNb3JLRXk4bkhk?=
 =?utf-8?B?cXVHK0VLNlN4Y2xWZVplTGdRcCs3YkVFRjZSdk1Lcnphb2xDamRrS3VXUkdO?=
 =?utf-8?B?M2xBVThFV29uMG5ONnBDaVZSbnBrcVQzaEN6czFJTHFFMTI2VVA1WFpKdmww?=
 =?utf-8?B?K1FUN3VId3lETUVjZFZBWXRkUEpobC9wb3BDbnlwS1lEVEZ0eHhtUlVIdXY5?=
 =?utf-8?B?YXdUd01QM1hPc1VFbTdwUjloUS90QnNYRjJRenFzdU93TGIyTGl2M0tJVENE?=
 =?utf-8?B?RjMrdHBZTnZ4eUdwWDRBVDZRc3RsYjZwelYzNzFtT3Rrc2dIS2IwTTFKTzRN?=
 =?utf-8?B?NzVKd0xNZ1JyU0REaWVnRzQxYml2c0NnMVkzc1haUTZ1S1psMlQrM0Q0TWdv?=
 =?utf-8?B?bzdIM0t1VVhrT3JsTk9LZ2ZUeU14dTdJaDJacHhSOEUybWtkVlAzTmxOUFdL?=
 =?utf-8?B?bCt0TDZMakJaREFwL1VWOStaYUpZdVZPZmFLM2hGZHdYbGpEYk9mQk5ETndS?=
 =?utf-8?B?NVFEOWNWOFM4UlpIZmZaNXVuejd5MVoxZDM2cDlQblB6ck13amVUM3VjdHlO?=
 =?utf-8?B?OUJCcmhzSndnbmh5QzJuU0JEeWc2bjdYRUM5S1A0QTdBQ0gvK0lJaUptaU90?=
 =?utf-8?B?aS8va2hTV2Fjc01veDBZZXpCUENnaXFyZkdHRGtOdjUvSDc3eUFUQXZWNU9y?=
 =?utf-8?B?TjdaL24reTJDcnVsOVVZcG01R0NsRUNMWncvd0xjcjg5Vm1LVFlDRDE2cG45?=
 =?utf-8?B?a2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1FEFA1211DABB2468274617AA3A54532@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nordicsemi.no
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR05MB8149.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b1724aa-bb7d-4ba8-7220-08db5b727db9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2023 09:45:49.6675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 28e5afa2-bf6f-419a-8cf6-b31c6e9e5e8d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 00NOVIK9IHddc6x+GlqkzQ1k2qui7r1qCbWSahrtb+oRcyKenk17kgK6G7eDUmKro4TuBZPpiTcgOwtxttgc7gOtczv5k4CChXexSZj7pQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR05MB8955
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVHVlLCAyMDIzLTA1LTIzIGF0IDEyOjAxICswMzAwLCBNaWthIFdlc3RlcmJlcmcgd3JvdGU6
DQo+IE9uIFR1ZSwgTWF5IDIzLCAyMDIzIGF0IDEwOjUzOjE3QU0gKzAyMDAsIFRvbWFzeiBNb8WE
IHdyb3RlOg0KPiA+IFdoZW4gSSBjb25uZWN0IFRodW5kZXJib2x0IDMgZG9jaywgdHdvIG5ldyBo
b3N0IGNvbnRyb2xsZXJzIHNob3cgdXA6DQo+ID4gICAqIHVzYjUgLSBVU0IgMi4wIEhpZ2gtU3Bl
ZWQNCj4gPiAgICogdXNiNiAtIFVTQiAzLjAgU3VwZXJTcGVlZA0KPiA+IA0KPiA+IERldmljZXMg
Y29ubmVjdGVkIHRocm91Z2ggVGh1bmRlcmJvbHQgMyBkb2NrIGVuZCB1cCBvbiBleHBlY3RlZCBo
b3N0DQo+ID4gY29udHJvbGxlcnMsIGkuZS4gTG93L0Z1bGwvSGlnaC1TcGVlZCBkZXZpY2VzIGNv
bm5lY3QgdG8gdXNiNSBhbmQNCj4gPiBTdXBlclNwZWVkIGRldmljZXMgZW5kIHVwIG9uIHVzYjYu
DQo+ID4gDQo+ID4gSXMgVGh1bmRlcmJvbHQgMyBlc3NlbnRpYWxseSB0dW5uZWxsaW5nIHRoZSBV
U0IgMi4wIHRyYWZmaWMgKGJ5DQo+ID4gdHVubmVsbGluZyBQQ0llIHhIQ0kgaG9zdCBjb250cm9s
bGVyIHRyYWZmaWMpIG9uIHRoZSBzdXBlcnNwZWVkDQo+ID4gZGlmZmVyZW50aWFsIHBhaXJzIChv
cGVyYXRpbmcgaW4gYWx0ZXJuYXRlIFRCVDMgbW9kZSk/DQo+IA0KPiBJdCBpcyBub3QuIFRoZSBV
U0IgMi54IHdpcmVzIGFyZSBzZXBhcmF0ZSBvbiB0eXBlLUMgY2FibGVzLg0KDQpZZXMsIHRoZSBV
U0IgMi54IHdpcmVzIGFyZSBzZXBhcmF0ZSBvbiB0eXBlLUMgY2FibGVzLiBCdXQgdGhpcyBkb2Vz
IG5vdA0KYW5zd2VyIHRoZSBxdWVzdGlvbiB3aHkgdGhlcmUgaXMgbmV3IFVTQiAyLjAgSGlnaC1T
cGVlZCBjb250cm9sbGVyDQpzaG93aW5nIHVwIHRoYXQgdGhlIGRldmljZXMgZG8gY29ubmVjdCB0
by4NCg0KV291bGRuJ3QgdGhlIExvdy9GdWxsL0hpZ2gtU3BlZWQgZGV2aWNlcyB0cmFmZmljIGFw
cGVhciBvbiB1c2IzIChQQ0gNCmNvbnRyb2xsZXIpIGlmIHRoZSBVU0IgMi54IHdpcmVzIGluIHR5
cGUtQyBjYWJsZSB3ZXJlIHJlYWxseSB1c2VkIGluDQp0aGlzIGNhc2UgKGluc3RlYWQgb2YgdGhl
IHVzYjUgd2hpY2ggYXBwZWFyZWQgb25seSBhZnRlciBUaHVuZGVyYm9sdCAzDQp3YXMgY29ubmVj
dGVkKT8NCg0KSSBmb3Jnb3QgdG8gbWVudGlvbiB0aGF0IHRoZSBUaHVuZGVyYm9sdCAzIGRvY2tp
bmcgc3RhdGlvbiBpbiBxdWVzdGlvbg0KaGFzIEludGVsIENvcnBvcmF0aW9uIERTTDY1NDAgVGh1
bmRlcmJvbHQgMyBCcmlkZ2UgW0FscGluZSBSaWRnZSA0Qw0KMjAxNV0gYW5kIEFTTWVkaWEgVGVj
aG5vbG9neSBJbmMuIEFTTTEwNDJBIFVTQiAzLjAgSG9zdCBDb250cm9sbGVyLg0KDQpUaGUgd2F5
IEkgdW5kZXJzdGFuZCBpdCwgdGhhdCB0aGUgdXNiNSBhbmQgdXNiNiBjb21lIGZyb20gQVNNMTA0
MkENCih3aGljaCBpbXBsZW1lbnRzIHhIQ0kpLiBUaGUgY29tbXVuaWNhdGlvbiB3b3VsZCB0aGVu
IGJlOg0KICAqIERlbGwgTGF0aXR1ZGUgPC0+IFRodW5kZXJib2x0IDMgZG9jayAoVEJUMyB0dW5u
ZWxsaW5nIFBDSWUgeEhDSSkNCiAgKiBBU00xMDQyIChpbiBUaHVuZGVyYm9sdCAzIGRvY2spIDwt
PiBVU0IgMi54IGRldmljZXMgY29ubmVjdGVkIHRvDQp0aGUgZG9jayAoZGF0YSBuZXZlciBtYWtl
cyBpdCB0byB0eXBlLUMgRCsvRC0gd2lyZXMsIGJlY2F1c2UgaXQgaXMNCkFTTTEwNDIgdGhhdCBn
ZW5lcmF0ZXMgdGhlIHRva2VucykNCg0KSXMgdGhlcmUgYSBmbGF3IGluIG15IHVuZGVyc3RhbmRp
bmc/DQoNCj4gPiBXaGVuIEkgY29ubmVjdCBUaHVuZGVyYm9sdCA0IGRvY2ssIHRoZSBTdXBlclNw
ZWVkIGRldmljZXMgY29ubmVjdGVkIHRvDQo+ID4gZG9jayBwb3J0cyBlbmQgdXAgb24gdXNiMiBo
b3N0IGNvbnRyb2xsZXIuIEhvd2V2ZXIsIExvdy9GdWxsL0hpZ2gtU3BlZWQNCj4gPiBkZXZpY2Vz
IGRvIGVuZCB1cCBvbiB1c2IzIChVU0IgMy4yIHhIQ0kpIGFuZCBub3Qgb24gdXNiMSAoQWxkZXIg
TGFrZS1QDQo+ID4gVGh1bmRlcmJvbHQgNCBVU0IgQ29udHJvbGxlcikuDQo+IA0KPiBZZXMsIHRo
YXQncyBleHBlY3RlZCB0aGUgVEJUIFVTQiBjb250cm9sbGVyIChvbiB0aGUgaG9zdCkgZG9lcyBu
b3QNCj4gc3VwcG9ydCBVU0IgMi54IHNvIGl0IGlzIHJvdXRlZCB0byB0aGUgUENIIG9uZS4NCg0K
U2hvdWxkIHRoZSBkcml2ZXIgYmUgY2hhbmdlZCB0byBub3QgZXZlbiByZWdpc3RlciB0aGUgZHVt
bXkgVVNCIDIuMA0KaW50ZXJmYWNlIGluIHN1Y2ggY2FzZT8NCg0KLS0gDQpUb21hc3ogTW/FhCAg
ICAgICAgfCBTZW5pb3IgRmlybXdhcmUgRW5naW5lZXINClAgKzQ4IDg4MiA4MjYgMTExIHwgV3Jv
Y8WCYXcsIFBvbGFuZA0Kbm9yZGljc2VtaS5jb20gICAgfCBkZXZ6b25lLm5vcmRpY3NlbWkuY29t
DQo=
