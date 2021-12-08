Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49C3D46CB92
	for <lists+linux-usb@lfdr.de>; Wed,  8 Dec 2021 04:32:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243886AbhLHDgB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Dec 2021 22:36:01 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:53986 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243900AbhLHDgA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Dec 2021 22:36:00 -0500
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1E2EBC15EC;
        Wed,  8 Dec 2021 03:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1638934349; bh=XVxQsa3uFTAWmYhfQX/BtJhcqV+ojJsbWnHhxmd0Uhw=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=eJoJFQTYA3E3Kj9Rpxukw792J3hwwAVhjBGjswtQ2bj29f/ZKogiYCiXV81jwky5r
         6sI3vp9OaVKqxAhHvJ97y2ut468oLNciyYpkepf/XcLFdFVbSERo+pjikzKcpPi2HH
         AxJ8cEpFsvB6kh8cYj78vsbw7Ieawf4XqAFIMM9Kr6WDzv7Cg5HUCNzvZhi5yOnF8l
         MG2M71Ee6yRwJrhFuYFq0HHzNKnH2m5xfJhjJBxALCLk1TT+SpOpp6QNEUqKkItse6
         pl8yk8KQBnbTjdAOHKxoUGM/5waAEowLyMXNandeVV3f/MWgxs8/O2VItheIvsprkm
         J0WTv8BSO9RsQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 1A2E2A0063;
        Wed,  8 Dec 2021 03:32:27 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id C479A80072;
        Wed,  8 Dec 2021 03:32:26 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="D104NI4J";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRQTq6sm0OMAbRVSzF/hCreAAdJgTF8H9iRl/CAZ3UcR+blpSZs5YQbnWaHl3yb+92cKQoZ/NL1IuzxJCJcJMC58qt5co1xEM+g5oyYmuSg7lwmFs/udr9rfepCOexbB2TI2tyUaktqAjfncWGlXLs2UIUZFoQ5xgI6OHenDllNJEJFNCEcHbjgX82Od3cfNwy79JeDw5dd7uasGDNZeUQvRMeMoN48T457WKIE9pNgYPJrwRsR4N77nthDSu5KEUAl39lq17nhyk1PGlyPBiCf4bAjADrXf1Ew67p/4nlMQchJzYCpucqFzh0IswRVG6i1tXSCrB2THtpXp3O7MKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVxQsa3uFTAWmYhfQX/BtJhcqV+ojJsbWnHhxmd0Uhw=;
 b=IrLltdy8bzkL66kLwt2+yO4jKNv2CG/oSDlwGxtu294JvVmoyE6vouLacsG14n4QfEj2Y5IyuieJACnGrTYZWuWHuW3KRYLHkYWpUEhPPLaFYV0DJS/WYGEnytJxAq2Oql6UrjR2y9D1ygbNIltLmSQasUHKbd2eS05gt8MAxg2yDFFVU5zquFvtCpY/wLedUjkZ4CDQ8A5ymx82Lg1sz0cxUTj2i0omZYRTHjWIFJpAX9ov/fe48mONpe3gev1uHjYD+GX0Xb5s5wpCvzaFnci3EVQC8mHRTmURNBJTyC5DQQkGMTS4subqeIFz1udWzcRCoitHOAnBHyHNYVWCBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVxQsa3uFTAWmYhfQX/BtJhcqV+ojJsbWnHhxmd0Uhw=;
 b=D104NI4J9sdPo7ylHYo92B4U3P/q/1iiabzqBBweQKKORBWKoXbEeD3ZZIPoodyuCyvfZ8aujAxSwNugBLDEqUd5Ws8sgPWVOy2R7ohHHjeK7G5JRv6BJ2BB0HWB9hklzVq0wa60CPRrKJ0RXrUx8iSRxOwxW6qiMYQAknAu4YY=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB3922.namprd12.prod.outlook.com (2603:10b6:a03:195::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Wed, 8 Dec
 2021 03:32:24 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::65:9861:75c5:8e08]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::65:9861:75c5:8e08%6]) with mapi id 15.20.4778.012; Wed, 8 Dec 2021
 03:32:23 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: Why no SG support for isoc
Thread-Topic: Why no SG support for isoc
Thread-Index: AQHX67k6aI6sKxdPp02VSs26kURSFawn5dSAgAALJoA=
Date:   Wed, 8 Dec 2021 03:32:23 +0000
Message-ID: <1e6a4fba-d1b6-51b0-65f4-3d19c9a964f8@synopsys.com>
References: <e58d3323-eb21-5c59-daa8-230b91082748@synopsys.com>
 <YbAd7eLQZVxptLDN@rowland.harvard.edu>
In-Reply-To: <YbAd7eLQZVxptLDN@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af1bc925-5b72-46f0-d3ce-08d9b9fb597a
x-ms-traffictypediagnostic: BY5PR12MB3922:EE_
x-microsoft-antispam-prvs: <BY5PR12MB3922B4631614A2168609BDF8AA6F9@BY5PR12MB3922.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wEldTmljwPDiR2zs/vfO+LB/FXYn9SOQ9Yg0ZFquX5K+bFVdrKjUSIRRruG5UFlY6Jx53MVDL+eTcy7PJ5Edf9/Oy3tfzhvlhTQ9JGKL1lHH2cykYjXIuzWbBKznGRt3Fj91/8tDoLzKI3XqJ4rrOZLvH2B2/N0DK4NA69zfHZIX0JPZgbfbcURbkQGKTLFUf8C4ETEI4pQeyphLPu/+JnjlaFHkzJuYhKbK/FU5B/5Dgqf1DV3kW9/u1PuqXG3EaeStuws+a3WlBFHgIXfyETShAUpyOj8EVboRfc8AIbenlR4/B6h7+LshhjYXq4y/w2evp0tuKuo4fQyGY5sH4jHMpSeYrIG4O2WsJC03FYiaynHgQSWYCJqqXZsJKr/SVaqcpvzDXkNL9G0jYMVNn4Oicr968N0TjW4vkjz3ifaMZwkukSjtRDHFKpMUmD862GaBBT+OA/n2DMLDNzncLCIX1t7uMCZNHb+QD6XtsABeXk7kM1TchgNFn61qji8M0+MNMznqASuLsCrxPtKBc/Gxbn6a/36nn+97hMwAHHmvk2VsclG4d0ZsMVgTylqwfdeGDpJOawc0m3Nwwnwa+bgXELLIErJT3Hnwo9RAjIB3ljDI9+hvAp3OFIVjtyfG2QWIr4AZOFcAwr/0c1JsxB9mQVMNFCs3rKCj0ZJ9c5jjsaWkskrzcHjqazz/BK/xp5HBwl9Eq0nd0LJzi1XAxK9Wv6+pzjkknogZx07iNZgVZrIk71yWnmIxWigyjYrcO703nF8Adrz35WRwKUaymivr6QIuHr83XQBwqG/voyEDWrBtlrLK6tc0VdKRnJF7gd/5CfX/nVuj5fQb7aT0iil11W7c1pZywdi6gNe+DmQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(36756003)(186003)(26005)(66556008)(66946007)(76116006)(4326008)(6512007)(64756008)(71200400001)(6486002)(66446008)(8676002)(6506007)(31686004)(966005)(2906002)(2616005)(508600001)(316002)(38070700005)(31696002)(110136005)(54906003)(5660300002)(8936002)(122000001)(38100700002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUZCVDNGKzBQbXRKclJiemNGT1FacTF3U1Z4TFVndUtOYlpZTHVwc2w2RnhV?=
 =?utf-8?B?ZTUrRExwVnY2emlpUC9RWXNoQnBaUkRGVWtsNWt6QlRQbEp0c3ZCbTVCWEd3?=
 =?utf-8?B?TDRnUDY0NWZ2N3YxQmJGd3BYQ25YWFhXdXdrUStJRmJNNUlFcjZsZnNMMzEv?=
 =?utf-8?B?anJmTk41RURPQU8rQXdYbnlSZDZqNE5YREZXckNWZXpqR3N1aUlxRVJzWm84?=
 =?utf-8?B?NTd1WVhyUHpQL2VJWG5CY0x5VlZ2aVNQd0RXVktnaE1RQmQxdHFNc0lzM0Nk?=
 =?utf-8?B?V241TUFiczRWZHp3R3d6Tk42MGdRSzZER2pudnFRQk04NTVzYVdjdFFyTGdG?=
 =?utf-8?B?N0NnTUdoRUlDaXJxRVF0VERBc2poa3QrS1JVYkhHb0J5K0NzOXN3WUx1b2gy?=
 =?utf-8?B?SFpvTEVPSWo1OGx6RW1uMnlmdzE4bWR6dFpBTlJiajlhZFZQTmw3U1dtUndQ?=
 =?utf-8?B?N1lSbkZHQVZYY1pKWFdndlFGZUZTMGozQjRLdXBQalR2b3JWK2x0dHpmc2o0?=
 =?utf-8?B?VHp5b3l2SzFkTUdUaVpqem5jQ04yUnlUajcwdlQxMUtENGM4VkxvOGdqenNQ?=
 =?utf-8?B?NFptUDVyTTU0eUdtaXNYS3VUa1FEUkt3cU1yTmtWVXlkd2FrVnVld3VjdUwx?=
 =?utf-8?B?amNEbHZoZ1dILzBFSE8zcnJxSVRHSytxQ0tZaFhEMDR6STN3Z3VTckh6ZlFv?=
 =?utf-8?B?a01WV0Y1Q0MwYnZncjliYnFMby9lV3ZMaTJmWkFseGV6SjAzbmFxeFZnM3FV?=
 =?utf-8?B?Kzl6Tk1PWTdsRzVvbmgxS2JQMlJPT1VKSmUvMHhBcnNJWFExdlFBOFgwSVNx?=
 =?utf-8?B?SDlmb3l5SnpEYkFuSGVtcUR2QXBjeGxwbUNUNUZ2Q2ljUVQxUkp5TG9TREV0?=
 =?utf-8?B?dXdSWFRhYkUxSklTUnp4Um9meVdTZTJBR3FzTklhalBMQkxBSzdwTTNDaHln?=
 =?utf-8?B?OFNlcGs2VWdocWkwdlMyWmN3WnZPY3FOVi9Db0VoWUFwdU5ndVV4UlNtK1Z3?=
 =?utf-8?B?L3cyL2pncis4YUJBNFcyUzhoNWw1L2JMT0N2SHpCeU5jNzFiU29aaXZFaTFu?=
 =?utf-8?B?Rjl5Qnc5dkFOQVorVEo5SDY3WW5OUTJ5c1BhZXNQclE4bWUrSEZRUmNyekRX?=
 =?utf-8?B?UmdWZTU2OXhVTG92NHc1R2oraWcrZzhPV29GSUhWWVUvaE9RakFuL3BEb0Fh?=
 =?utf-8?B?MVptamt4RWVuZ2hYUlppWUlkK2w2ZThMeWNRQ28vVlpkMDJjcFJQZXF4UUxo?=
 =?utf-8?B?VXhaMGZPZmRseDYzMWpoN3B3SHYrR3AvUlFLM2pnaVJ3QUQ2enlNd24xMlh3?=
 =?utf-8?B?Q0hTQjhZVXM1OGlyVmk5TFNBSmc4bVMxT2tmVTNCMTBPcU1WK3FpRzdHV1Rs?=
 =?utf-8?B?VlJIbkhzWFcrOUhWQjI5dndPYmc2ZHE4RXk2T0FiYTFmS1NkUkxWSGtnYUNP?=
 =?utf-8?B?ME1iTEw1eWFNbXdpZDU0ZUp0cStrS1BoVTJjb0paRXB1d3l2bXR4RFk0dDBS?=
 =?utf-8?B?c1ZkZVdaWTk0VGpVeGJCU0t2YTIxYWxJa2FQeTJtYUhJd3J2YWdkZ1FVcHpW?=
 =?utf-8?B?UWFTS3gwNjlFczB6bVkwTndxZGF3c0ZjL01FaVhHWjVHSkxVRnNXMmFmMTNz?=
 =?utf-8?B?eWpOcmh3NmVLTExQYkxqMGFtSm0waXlIMWdzdDBSYzFZbS96R3h5ZkFHdmc3?=
 =?utf-8?B?TDVmTlBreVQrbXoxeXdnSGNrTVlJR0VNcGJJV2U0c3g4cnBmL0NhWDZWVlBS?=
 =?utf-8?B?UWh1UTUwNTViKzhENGFKVnVXSTUycUl1N2ZRTGhnRHhMdkpwOGsxVElRcU9P?=
 =?utf-8?B?dTNraFEyaUpzSjN4eTZzQVVHSHRMVjlxTjZ5NEZPc3JRTTd3RitMT1VRQzNZ?=
 =?utf-8?B?NGxqTDV6VUdlUm1xV2tKakNNMGhRa24wL0x0RGJWeGUxamJFYjdhZ05IRDk4?=
 =?utf-8?B?ZmhXamtudUo5cEpTaFhpa0tud1N4OGs5eFhSdENiZUoxRXlRNEp2TGVBeENh?=
 =?utf-8?B?M3pKeE83SmlBdGloYWRJSnZ6TW9MZ2kyTmp0ZmpLbXlib2xXZUpNbGZlMThN?=
 =?utf-8?B?UGJUdU9JUkpnUUt2V1dlVElUTXlEZGQ4azhFME0zaDEwdlBEU1V4YVNKV2U2?=
 =?utf-8?B?U0RSL1NRblhZNUI2UnZydTR4U1BXMVFPYTlSL21ZUlYzN0dyVkhuY2wyeTFx?=
 =?utf-8?B?RFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A5290FD23AAC44F9A68BC603D2F949B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af1bc925-5b72-46f0-d3ce-08d9b9fb597a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2021 03:32:23.7693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hxghPWH2w46CcxAM9kxaazB6UhMz8zJIB0VPs0ArfF0MGIwAJZTjY8l2k2oqZgVgn2dT58g2uVMFa/UmOn3l1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3922
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

QWxhbiBTdGVybiB3cm90ZToNCj4gT24gVHVlLCBEZWMgMDcsIDIwMjEgYXQgMTA6MjQ6NDFQTSAr
MDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPj4gSGksDQo+Pg0KPj4gSSBjYW1lIGFjcm9zcyB0
aGlzIGNoYW5nZSBmZTIwNzJjYzE3NjggKCJ1c2IvaGNkOiBFbnN1cmUgc2NhdHRlci1nYXRoZXIN
Cj4+IGlzIG5vdCB1c2VkIGZvciBpc29jIHRyYW5zZmVycyIpIGFuZCB3b25kZXIgd2h5IGl0IHdh
cyBtYWRlLiBUaGUNCj4+IGRlc2NyaXB0aW9uIGRvZXNuJ3QgZXhwbGFpbiBtdWNoLiBJIHdhcyB0
cnlpbmcgdG8gbG9vayBmb3IgdGhlIGFyY2hpdmVkDQo+PiBjb252ZXJzYXRpb24gYWJvdXQgdGhp
cyBidXQgY291bGRuJ3QgZmluZCBpdC4NCj4+DQo+PiBDYW4gc29tZW9uZSBoZWxwIGV4cGxhaW4g
d2h5IHdlIGVuZm9yY2UgdGhpcyB0byBhbGwgaG9zdHM/IE9yIGhlbHAgcG9pbnQNCj4+IHRvIHRo
ZSBhcmNoaXZlZCBjb252ZXJzYXRpb24gd2l0aCB0aGUgZnVsbCBleHBsYW5hdGlvbj8NCj4gDQo+
IEkgZG9uJ3QgcmVtZW1iZXIgdGhlIGRldGFpbHM7IGl0IHdhcyBuaW5lIHllYXJzIGFnby4gIEhv
d2V2ZXIsIHlvdSBjYW4gZmluZCB0aGUgDQo+IGVtYWlsIHRocmVhZCBmb3IgdGhlIG9yaWdpbmFs
IHBhdGNoIHN1Ym1pc3Npb24gaGVyZToNCj4gDQo+IAlodHRwczovL3VybGRlZmVuc2UuY29tL3Yz
L19faHR0cHM6Ly9tYXJjLmluZm8vP3Q9MTM0MTIyMDUxNjAwMDA2JnI9MSZ3PTJfXzshIUE0RjJS
OUdfcGchUGFPSFM5eXdTbHM0NFhPVW40WkVkZDl0dEp0VE9KbnJZX2tLa1FOZjZFdFZPelFzSjVs
UTdQRnE0QnV6MVBtalNnVnokIA0KPiANCj4gVGhlIGRpc2N1c3Npb24gbGVhZGluZyB1cCB0byBp
dCBhcHBhcmVudGx5IHN0YXJ0ZWQgaGVyZToNCj4gDQo+IAlodHRwczovL3VybGRlZmVuc2UuY29t
L3YzL19faHR0cHM6Ly9tYXJjLmluZm8vP2w9bGludXgtdXNiJm09MTM0MDk4NTA5NjI4NzY4Jnc9
Ml9fOyEhQTRGMlI5R19wZyFQYU9IUzl5d1NsczQ0WE9VbjRaRWRkOXR0SnRUT0pucllfa0trUU5m
NkV0Vk96UXNKNWxRN1BGcTRCdXoxQnhPajVZVSQgDQo+IA0KPiBBbGFuIFN0ZXJuDQo+IA0KDQpP
ay4gRnJvbSB0aGUgZGlzY3Vzc2lvbiBhYm92ZSBhbmQgbG9va2luZyBhdCB0aGUgY29kZSwgdGhl
IG1haW4gcmVhc29ucw0KYXJlIGJlY2F1c2UgZWhjaSBhbmQgeGhjaSBkcml2ZXJzIGRvbid0IHN1
cHBvcnQgU0cgZm9yIGlzb2MgYW5kIG5vIGNsYXNzDQpkcml2ZXIgaW4gdGhlIGtlcm5lbCBuZWVk
cyB0byB1c2UgU0cgZm9yIGlzb2MuDQoNClRoYW5rcyBmb3IgdGhlIGxpbmtzIEFsYW4uDQpUaGlu
aA0K
