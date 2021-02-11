Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68A67319208
	for <lists+linux-usb@lfdr.de>; Thu, 11 Feb 2021 19:17:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231898AbhBKSP4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Feb 2021 13:15:56 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:51092 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230418AbhBKSNv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Feb 2021 13:13:51 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 301E8C00F1;
        Thu, 11 Feb 2021 18:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1613067162; bh=BYr6MC5Uf/tXf7VUtzVTaYwJB3HVGcfZLJrJevXSEto=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=T3KGq6Joh4wVEcuxvq44RTVJB79hnQYg5DP7+337zwaJgfeK0JIfj0+ZT/sXeLTQ9
         fsNP7a1ea/BWhlLY19+KRxK4cnAeXCzQ7bKgs+ZGAeaLPAot2W/bFHtBp9XEwsN30m
         S3vDE8yn7ljWdtcgg8jEx5uBHD/opFpXR9Ovpv7NCa5Y4hRhPJc+NNoCgi6IKuMCim
         SsucXws48i9XkFcAppQYDfEA0wc7OmBDjzEmFDeugpiEX756Hkm9sx53zreg2js4iQ
         p3cLKCEO2sHkuVDxtYDtx8vO0H3OvwOmfmWm1AdmgBSedxvdQsgDaFCEsD9mDrNrZk
         CwMdg3vk2p6mw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id CE63AA007B;
        Thu, 11 Feb 2021 18:12:41 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 31C59800BF;
        Thu, 11 Feb 2021 18:12:41 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="YfzKAA+5";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3GRVK5eNlieY3ONoFTK6GAWOwGhl7gQ6CWyEtEE0E8Ysq2ncSzQTBo7iBRlJTNF0xZYPQyaOh0vxAq14Dk8gbbVxGNMq3hPGiIn+YDfw7Mrhd/ZJblLWAi01HY0TC1Epg75jBlvZfkAeztLU9BdPtbl4dK4yDDAWxV1ymxXJSJRTiJsk3+YtGNAuEVPpnS7UnMzkmeQsMABuMhZkEqTpIbDovKjx2hvBJhuRD1nxE1kVyoapKw36N6GobEOb6ZI8PQ7ZLRKgoskfDLF+/d8vkAHvyT8sy/qt5rIsEZBU4JwamGFxkqrs0w5QpCClp8jRYmhcxbKC+OgWbcdu5nwMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYr6MC5Uf/tXf7VUtzVTaYwJB3HVGcfZLJrJevXSEto=;
 b=dCCmxBboRTCwfZZSuhku5Kk7DY6764Fz1JJr7RnjVt3tJ+KQKG2fuCcaSdQYEH/Cvl0jeMEg4quMXTlo6cRM+rqIr+QwE/MJryanDCd7ULd3MAW3guhFn3wRMYtHQKZ/mvLZo4EhI9flL6zy/L2l2cE889lU82pBW4zM+wYgsaYXXKZ1/fGmDuIOPol7eFI2aVp9TKSWa7XUEzLXJeStf3ar/iPw83kDy9v8IS9j1p3VNa+9nblrS5FsfmtHrHO9hnoFs7A/o6C8e8wTCN9S93FPRqVbq469oNUPLTIqTCHn5MNx44gIAEu4ChMa07yg7disygjq/LXpKCF87pYFWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYr6MC5Uf/tXf7VUtzVTaYwJB3HVGcfZLJrJevXSEto=;
 b=YfzKAA+536cyyjFacQkI25kqZZ8n9nSazzjLbzUZp1J8mHWk2VaiNvSwz2LJUTOmOaU/hIu7fQ3uzlE+eUft+w6YyC5GMSEKf11hM8FNyI5LvU2/L+yy20weVDlq6FR4JrOHqU3U0WhiLPvma7Zs6p96CyZ6lPRxCuq1aV3AFYE=
Received: from BY5PR12MB3777.namprd12.prod.outlook.com (2603:10b6:a03:1a9::14)
 by BYAPR12MB3189.namprd12.prod.outlook.com (2603:10b6:a03:134::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Thu, 11 Feb
 2021 18:12:40 +0000
Received: from BY5PR12MB3777.namprd12.prod.outlook.com
 ([fe80::e9e5:66f2:5a15:8c1c]) by BY5PR12MB3777.namprd12.prod.outlook.com
 ([fe80::e9e5:66f2:5a15:8c1c%7]) with mapi id 15.20.3846.027; Thu, 11 Feb 2021
 18:12:39 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Christopher Morgan <macromorgan@hotmail.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: dwc2 Resume From Suspend Devices Not Working
Thread-Topic: dwc2 Resume From Suspend Devices Not Working
Thread-Index: AQHW/8G5S/5Vy/RWk0CnibCOl0UnxapSztwAgABMACCAACiWAA==
Date:   Thu, 11 Feb 2021 18:12:39 +0000
Message-ID: <33cf1dbf-5e0e-a936-9c89-1f05774de979@synopsys.com>
References: <SN6PR06MB53423E9042B01FFF2531D47FA58D9@SN6PR06MB5342.namprd06.prod.outlook.com>
 <5b0b7237-1bd3-d712-5e76-c877b2a2a91c@synopsys.com>
 <SN6PR06MB5342386D6344C41076C0B119A58C9@SN6PR06MB5342.namprd06.prod.outlook.com>
In-Reply-To: <SN6PR06MB5342386D6344C41076C0B119A58C9@SN6PR06MB5342.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
authentication-results: hotmail.com; dkim=none (message not signed)
 header.d=none;hotmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [37.252.95.223]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45028c15-a66d-4c8e-de4d-08d8ceb89e66
x-ms-traffictypediagnostic: BYAPR12MB3189:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3189D5F790E15E213CE19FFDA78C9@BYAPR12MB3189.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bjXOsXxUiaksu+mSTYd+m/Ih7GKbxYZ9i/3y9ibMOeqrDEo6oNOR2RudX3mQsPbLjM76DNJg2KaX3JO0e0iG/vkNs/jBfVJPnYfAnwZ7xogYj0cuX6jTb4+khNoWTDPzpB94yvRgWUqOHRb06iAgTZSLVY8MC1fJ8em2m2DIIRnFPU0uunhGGMoJbYa9sSF77tg84gHqxWTkdF/Dh5vWFY6kNa35tzV3p5pYjpyc3Wrq3/QwUiVGFD8gtC3mpv5GC+dMoIcnJwEQiQA5lBoyKgZlx/OQDp6EuOuadrdfz2ocojrboPAjY9OLnjYKTt441X1rJgDjkhBo8U/leLRSIq38tr/nnZhgONvNkC8XRVLzjE5K7173c3wyeW8oSOjTrtYfkHLsOFXO8BkBWzdkeWLutiwqN0/peHSw/Kztde4Ul5sJ2sCsjbEUnLlox6Is6KNwpjR97BJ6Hr6LJYAr1AbB8ObgvvNkgIRNGFkunEc8xL+2AirTj/sN47s3oLjyZDACfxfQMa6MoloVgmuJXm6TmzXs4QIfWsPc8+Ncx+PPlybesj1HMpeGyI81KO5dtyVlVRqzHgAFNq0amz7eyu4hWHKM4s3NMNsLpTNxRGM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB3777.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(39860400002)(136003)(376002)(366004)(5660300002)(66476007)(31686004)(86362001)(186003)(316002)(110136005)(36756003)(2616005)(76116006)(64756008)(66446008)(66556008)(91956017)(66946007)(6506007)(6486002)(6512007)(15650500001)(83380400001)(8676002)(2906002)(53546011)(478600001)(71200400001)(31696002)(26005)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?M0ZnS3d5ZnpTT0hseStJaVd6M3hXM0s2dnRqUW9lWWRqWVhTVFc2VlowUUdU?=
 =?utf-8?B?VDFKWkV3c21SRkhORmpmeGk5bHVxNWNLZEVTbjI5b1NBY2FaRjNpQkc3WEhK?=
 =?utf-8?B?cXhsSi9RRWtXbE5XRHlTR2xNcFhkSjhMTjVja1JIeU55amkxWWJLSGVEZXE4?=
 =?utf-8?B?WWlURWVMNkdzSWtJOU91WndEcW9ublEzdU9saU1FU2xPNmtjZXJIVCsxMTdX?=
 =?utf-8?B?bU9TeTVpMlIzeEp1dHEydDd3bUFoL01TbEVSdkJNZzcwZlpTQ2sxRTFNZnBi?=
 =?utf-8?B?OURhVmNGZ1ZhUmVrSlFPd0l3YVg0bEFoRHlXdzg4aklPb2Zxd2UzaTEyRjJT?=
 =?utf-8?B?WUQ0L1Ixc0VRL3hEdEVqZWhQTFlHYUFSdllyS2poNDRldm5QMjlTTXRxQ1gr?=
 =?utf-8?B?OTVsaFRYaWxqUG1nMFphR3VGTCtUSU9zdnJXT2krUTR2MXVhNENkbFB1bUNQ?=
 =?utf-8?B?YWhTQUJ3L1oyeXliemFPSDhGb1hrYXJlckdHSy9MbFVIck15dmx0dXVqeUNs?=
 =?utf-8?B?Mml6c05ZYm91bER5MHlUWXYyUDhWNVhVTUlNeVhGUDhxUTlmeFBNdGVWMUxI?=
 =?utf-8?B?QnlWd3VIYlM5TWNUNUlyaGtYMlhRQmtZZkFaQ214RzNqMHMwaGtTZjRPMUV5?=
 =?utf-8?B?eFhyM2tZQTBJeDVzVzFucHdOQUQvMG9SZ2YranhodnRwTEVsSmNnOFc5OXBy?=
 =?utf-8?B?WU44QmlFVGJqZ0tEWjJrbW01UU5CUTNzNW5iVkhLdW96eGt3Ny9uR0Y0ZzVU?=
 =?utf-8?B?U2ZpMkpNYXFlc2I3MCtZNzJtQnNIbFhpdzhlOW5aMXdUU0tvWUJnU3pDUzFo?=
 =?utf-8?B?aGk3emUwTFN0UmFKdWJSRDByZTZxMDBRaTFFNTN5NDA2QndVY0I5NzVLUmRF?=
 =?utf-8?B?ZUxrVWJ5cEV6OHovRHF3QllETHRTeStWbi83dkFqeFdBTXFFQWZvNG5RWVhR?=
 =?utf-8?B?SWtJVTU3QlZzVVhMSHd6UURlbkNOQXVCdFBsNW03TGtIN0J6TXhuY1lzd2VM?=
 =?utf-8?B?QVZsUDZLTEdRK2lhMkFLL1BQMjlWU1hMVEFSbyt5OWxPZFczTGZlOEhCQ1ZT?=
 =?utf-8?B?TUlYLzdPaXFZNWtFMlVnaXFoaFByKzhQWGhTMjZOTWlnM3ZRckdkM1F4czFE?=
 =?utf-8?B?Q2VSNE5Oa3k0Qlc4bUVWT2ZId2plUEtDd3lhSlUwMlVTZkNYeVZONzdpdW9k?=
 =?utf-8?B?Y3E1MSthU1IxeEpwKzhnRjBXWHZKMG9sdHZvQkpHTU4zZURmZVJKRmV3clJx?=
 =?utf-8?B?Qm9WSHB4RXZMZWd4NU96RVdXZXdsQzdGTzc3RUNXZ2RwaXNTRytoN2o0ZmV4?=
 =?utf-8?B?ZmVjZDB0RlNFdmpKeDRqZmJ2TkV5K3ZwUTdWZkxRTnJqSGMvRGFKTHk1N1RG?=
 =?utf-8?B?VEJNUXlna0FZK1MwajgyT01sWEZPcFptbmMwRXFXL21nMU5KSjRZancvNE8z?=
 =?utf-8?B?SzYyZEFWV3NUWXB0eGgyWjZsMGpmMXZiNXNhbEJPNVpUV1FCbEhDVVp2VHJQ?=
 =?utf-8?B?WHJJZ0kvdlBpOEhVVGZDTldqVU5NKzV5VmtFSVNPUmJkMmlKQUMwa0c3dFAy?=
 =?utf-8?B?TXB5a0tkbnJHTC9ySkhvUEUwaTEwbUpCNmt4WTRza1R5ZnJIUU9QUUc2WmpH?=
 =?utf-8?B?cHUvRFNBY0ZjUjVyczN5MGt3S3dDRUlwLytCbC9wWUJOQkdPUzE5RlVpaXdK?=
 =?utf-8?B?MTdSMWRMNklzQVpUOVZUK1BaUDRCSDhOR1lXQy9wQmo4RzRTK1RxN0ljL0Fp?=
 =?utf-8?Q?WF3etMJFoYNCwp3n5k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D5CE5BA7DE8A543818BD21E4D5F1285@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3777.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45028c15-a66d-4c8e-de4d-08d8ceb89e66
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2021 18:12:39.9271
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pf6jHwtHg7r9weMzb0tpq9032m32lV0YUdtWLt3eXlqTKlmvQ38m7FSdljL/E7ddlffNgVNidHV9Qk5ha1Kaww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3189
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCk9uIDIvMTEvMjAyMSA3OjQ4IFBNLCBDaHJpc3RvcGhlciBNb3JnYW4gd3JvdGU6DQo+
IFVuZm9ydHVuYXRlbHkgdGhhdCBhcHBlYXJzIHRvIGhhdmUgbWFkZSBubyBkaWZmZXJlbmNlIGlu
IHRoZSBpc3N1ZS4gIERvIHlvdSBuZWVkIG1lIHRvIHNlbmQgeW91IHRoZSBrZXJuZWwgbG9ncy9y
ZWdpc3RlcnMvZXRjIGFmdGVyIHRoaXMgY2hhbmdlIGFzIHdlbGw/DQoNClBsZWFzZSBwcm92aWRl
IGxvZ3MvcmVnaXN0ZXJzL2RlYnVnZnMncw0KDQpUaGFua3MNCk1pbmFzDQoNCj4gDQo+IFRoYW5r
IHlvdS4NCj4gDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pbmFzIEhh
cnV0eXVueWFuIDxNaW5hcy5IYXJ1dHl1bnlhbkBzeW5vcHN5cy5jb20+DQo+IFNlbnQ6IFRodXJz
ZGF5LCBGZWJydWFyeSAxMSwgMjAyMSA1OjE1IEFNDQo+IFRvOiBDaHJpc3RvcGhlciBNb3JnYW4g
PG1hY3JvbW9yZ2FuQGhvdG1haWwuY29tPjsgbGludXgtdXNiQHZnZXIua2VybmVsLm9yZw0KPiBT
dWJqZWN0OiBSZTogZHdjMiBSZXN1bWUgRnJvbSBTdXNwZW5kIERldmljZXMgTm90IFdvcmtpbmcN
Cj4gDQo+IEhpIENocmlzdG9waGVyLA0KPiANCj4gT24gMi8xMC8yMDIxIDc6NTUgUE0sIENocmlz
dG9waGVyIE1vcmdhbiB3cm90ZToNCj4+IEkgd2FzIGhvcGluZyB0byBzZWUgaWYgSSBjb3VsZCBn
ZXQgc29tZSBpbnB1dCBvbiBhIHBvdGVudGlhbCBidWcuDQo+PiBXaGVuIEkgcmVzdW1lIGZyb20g
c3VzcGVuZCBkZXZpY2VzIGF0dGFjaGVkIHRvIFVTQiBubyBsb25nZXIgZnVuY3Rpb24uDQo+PiBU
aGUgbWFjaGluZSBJIGFtIHRlc3RpbmcgaW4gcXVlc3Rpb24gaXMgYW4gT2Ryb2lkIEdvIEFkdmFu
Y2UgcnVubmluZw0KPj4gb24gdGhlIFJvY2tjaGlwIFJLMzMyNiAoZXNzZW50aWFsbHkgYSBSb2Nr
Y2hpcCBQWDMwKS4NCj4+DQo+IA0KPiBDb3VsZCB5b3UgcGxlYXNlIGZvcmNlIHNldHRpbmcgJ3Bv
d2VyX2Rvd24nIHZhcmlhYmxlIHRvIDAgYW5kIHRlc3QgYWdhaW4uDQo+IEluIGZ1bmN0aW9uIGR3
YzJfc2V0X3BhcmFtX3Bvd2VyX2Rvd24oKSAoZmlsZTogcGFyYW1zLmMpLCByZXBsYWNlDQo+IAlo
c290Zy0+cGFyYW1zLnBvd2VyX2Rvd24gPSB2YWw7DQo+IHRvDQo+IAloc290Zy0+cGFyYW1zLnBv
d2VyX2Rvd24gPSAwOw0KPiANCj4gDQo+IFRoYW5rcywNCj4gTWluYXMNCj4gDQo+IA0KDQo=
