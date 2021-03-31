Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 463C93476E7
	for <lists+linux-usb@lfdr.de>; Wed, 24 Mar 2021 12:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234540AbhCXLQR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 07:16:17 -0400
Received: from mail-mw2nam10on2063.outbound.protection.outlook.com ([40.107.94.63]:49057
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230307AbhCXLQR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 24 Mar 2021 07:16:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uqozw2z1I2pWE83sonkhvRR0tdrIJGDx5V1WcrW3nw7VCyeKYU8THbvI/qE+xGWeVdYUkgHcGb1FysYsRzA/c6OGartZYbnnYyaWLHe55bSIqlN9LB1Rbd3IMT8o1hJGSB2ThlSem26JcUgGaAxLS3sd9av+NpMY4nrVLccTBbFiPXP/6d4TszlN8rxuikzit/ix0Jdm8I9Nk2x2etvlYV4T2vUxGQKiGEPyukio06KMWYGFnIaOuiVrJPQ1YHUVH3zyKulpZejYzeDaVuIJA3kmccEc6ah9FrQk3SA5ov2MRezytOqBXsxa5N6xqOXt56NlQkEwwdfcL6JybGelyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZAY0MdwfzELZ56oTWufNoSs6hDmqque8T8XCEU9vdM=;
 b=RndzEOSF8yC6fz9MJRRp0Ef1CTUT1fc55VzjgZkFvpDxEOqz2EVZnqr8+lxrKIezyPjBhbVqv52Z/Plnlo5/Mbr3pnk441gRvF7OR9ehHlNUeKd0io7titNsjVE/0irDRWltB0IQIpghHl2yaIE4911JRBRkpvLOvdy0ZiuBQwrLAAAD3kHMsszfGG+TS+Ghm+RL/dQ2JziAkGyc+QNBcJyzXsgnWIOdP6GuapcsroVwvyjdkDpVGAqFY0Sll8/OQXfTwuikbM+iknjEonUb/BAr0RO4ZxkUZfle+VcyoQ9sXFzrqjRLCSmA31AYaIy/aRa65jK/iFue1yrnNtoxiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZAY0MdwfzELZ56oTWufNoSs6hDmqque8T8XCEU9vdM=;
 b=RVrE564FpztpB1MBQ/RNDCu/xnpOLKxIiMsYPPvdxAOzgSI/XrfYRwT3KQ6N4Le9MMtBRlOiFTU15LV9GpBLeVsnsAaoGSNpbSUcpCJsUvyGkuxpuNSJwK9LVBfOBBgArEwcOMAq4Bozkq9okmfo0OEPIcG5hR6+21fEUmWvI5Y=
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 (2603:10b6:910:45::21) by CY4PR1001MB2392.namprd10.prod.outlook.com
 (2603:10b6:910:43::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 11:16:12 +0000
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::fcfe:f4e4:1d73:6d79]) by CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::fcfe:f4e4:1d73:6d79%5]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 11:16:12 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "ikjn@chromium.org" <ikjn@chromium.org>,
        "perex@perex.cz" <perex@perex.cz>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "tiwai@suse.com" <tiwai@suse.com>
CC:     "grpintar@gmail.com" <grpintar@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel" <linux-kernel@vger.kernel>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "dylan_robinson@motu.com" <dylan_robinson@motu.com>,
        "kai.heng.feng@canonical.com" <kai.heng.feng@canonical.com>,
        "dmitry@d-systems.ee" <dmitry@d-systems.ee>,
        "livvy@base.nu" <livvy@base.nu>,
        "alexander@tsoy.me" <alexander@tsoy.me>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: usb-audio: Apply sample rate quirk to Logitech
 Connect
Thread-Topic: [PATCH] ALSA: usb-audio: Apply sample rate quirk to Logitech
 Connect
Thread-Index: AQHXIJu5KknmGOLeWU+zwJhqGFj8lKqS/PcA
Date:   Wed, 24 Mar 2021 11:16:12 +0000
Message-ID: <c21de867cf4ccbfcc8cf555c78dc70dd3a47dfe8.camel@infinera.com>
References: <20210324105153.2322881-1-ikjn@chromium.org>
In-Reply-To: <20210324105153.2322881-1-ikjn@chromium.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.39.3 
authentication-results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 964065bb-0e1e-43ca-b9ef-08d8eeb63b95
x-ms-traffictypediagnostic: CY4PR1001MB2392:
x-microsoft-antispam-prvs: <CY4PR1001MB23921F092030D8EBB7C3D841F4639@CY4PR1001MB2392.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CBxqBktL1y8SrfGpswbNsDXX3TM4K7DvXV8G1rsDy9Ywt07EP5mDVjunYRD0eaEWdBatMXGXJ2lpvlMzMziOUolIusfPmDXxUnvDLOIIfxmru7rr7d4b84wqhIDXNtKyKd69ZjSV6nt7bZSfBMGU53hHPon5tlIlDQaJ9ZyJaEENb4gfYFUJBzA2pYrAAPDjQpnCjqcHkjFK310SljRrKiBw/FytMeDPNZPOa95JTpjlTUVCXGrXEE/I56QkmBPbiJyFaYSutRl3dZyeC3/0yYc4Tx1Rr2WOsTPnyXHiyPE8l/wUvWCenFuk/us1xhB3XYw1+YztTDkyGvycLoXQu0SFozzelrzJulfaB6sZf/M0nOKOwx7EAgVuAnFE9hZYGKSPtzzthaFJ8gjgThJlUBZp3zwIDQXkEn2nSRar4g7LWFp40gYJ3eRnU8TJHB3Lp0GL0+2ZWOTlf5FCbSbzzkwVlf9GglGGZrf82iytDzFOQ3v88NnK1gUC/aNfQQW48HslzeOkdHVD63FeHKVPF1YGPsE6/i8Fhjc6i1jOJgZ1V+oB4NMcg8HxYz71IXIuabDouY0qjEoNW4ZOQ0uXeTwjvnlgDByUwpBdAp2UnajyfYFYDcsD5KXdtr9s3vCAdrspUa6FtreGO+m0fodcWxWhdvvXSQtFv8enZ+PAVt6DdsV/6adHTjSkTJJpbO7D9G+T518DG22AUWu0fEQSi2ircZbuUYTQ5JfNtglqjiw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1001MB2389.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(39860400002)(346002)(136003)(71200400001)(6512007)(83380400001)(4744005)(8676002)(478600001)(110136005)(76116006)(4326008)(54906003)(6506007)(966005)(2906002)(316002)(8936002)(38100700001)(7416002)(36756003)(26005)(86362001)(91956017)(66476007)(66556008)(5660300002)(64756008)(66446008)(66946007)(6486002)(2616005)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?SG1uUHZXWFJWMnc0UU5MRUxwaERkMDhRWUpFNzg0ZU1kczhEU2VMUFg5MXBJ?=
 =?utf-8?B?KzFXc3Z5ck11d3YzS1hZRDhCM2hyNEt2cG5uTVZ0OEdNYllrU0g4dEl0RVRk?=
 =?utf-8?B?YUpNYnhBMXZNN3RJSnJjbWxmTk9IeFFnUU1ONi9wbDVYNzNCNnFwZkJ0VFY1?=
 =?utf-8?B?N0xaYTJDSy92aWFKdEJyRVd0M3ltT2RVK25FTEc2NHJlQ25DeU1JMktzdXdM?=
 =?utf-8?B?OUpiNDVNREsrcHJwR2xvN21NT01DRWhEQmJUTVZtUkFMRmRRQ0lyVTRDaVJU?=
 =?utf-8?B?M1VUL0pURWhsSW1JdUlNZStWUmJlNEJ4UWd5VnNuUFlPc3phdEJjVmZhbVBz?=
 =?utf-8?B?T3FZc0tZQnYzU1d1NXpWVC9oSlNCVUVlOG9rTU1BSGdnMW9nd2tQbk5uWTVr?=
 =?utf-8?B?eDB5YmtXcjczUjlXVGdWRmxTNndITG12L1ZBQ0F2VElwY08rRzBqblY2Vjgz?=
 =?utf-8?B?MlQxL1E4YjBidXgra05OaldVVEcyaitoL2owNzdJUGhTTzhHK21ES1dyenNB?=
 =?utf-8?B?VmtNQmpRK3ZhSWVkcSt5R0l4UDBHS3NTSStLNzRaWmVxSUNYbXppK1RtbFhn?=
 =?utf-8?B?K1VrNVE5V05KeWRJZ0lOUWhPRWdDdHpnSmdscFVPSkVUdUozMkx4RFFjN0Fi?=
 =?utf-8?B?MUw1UzV5aERxY2gzYTB2TUxrV2pzbkNicU9jMkE5STNick1VRkRHQ1g4NXdz?=
 =?utf-8?B?bVZtQ0c0WHcrcGJoZWIwSGx5ZFFNdlhKYStnN0ZkYnQ0RktTVEtpZkEyN0xj?=
 =?utf-8?B?eDY3UTMzc0ZBdDlvYk8rblIyNFJ6ekxhTngydzdoNlVVTkJidmMwOFZCUzVn?=
 =?utf-8?B?VXhtYlI5OHp5S1JWVE54WlJLdjk0bnBJQ0IxaU5iU1JrS0hpQ2x1NjhKMkx4?=
 =?utf-8?B?WUJhSXpLbzdpeTlCdXUvWERsaHJwR1lzNklUQ0JLdnV4Rzd3VEhES05GRGpR?=
 =?utf-8?B?UE9hcG95ZjBOY2ZqSFFmL0MwZjUxTnNpNmhFWGZMQjhGRU12QTNSMmlVNWhC?=
 =?utf-8?B?VnFLL2xOdldEcFZacHRnV1k0OUswaE0xcHgzQmFXL2UvUDRlVm44aUgvVTV1?=
 =?utf-8?B?UEFuaEpZMllQYU9SdWg3WlBpWmRreVNRK2VSRjlieHdOR2I0VmRoLy9iK0sz?=
 =?utf-8?B?WW9FaEtaVGI0MGh2dWE1eEtOT2x4NmUyWGNnVFdNK21uRmF5RmdSb0NBQ1ZJ?=
 =?utf-8?B?ZlRJbS9hY3Bwc2ZUdEltT3JrczhWWThHQnZITUQzSG5OTWxDSUFob0xocTBK?=
 =?utf-8?B?MWVFZnZxU1RhLzJqMDVvUXBaaWVPUnBxaHFYcmdjRkJ1SnlMeSttWThpWHlS?=
 =?utf-8?B?cmluVDNTNjgwN28vdDRZTDZCbDJhTDdiZ1dZdi8rL3VDMWVBN253REFiNVNG?=
 =?utf-8?B?VGZaSkxwQ05LVU5TRkl6ejZnRXVzRVhKN1lqMCtFRXdVRnJnRFQxRUx6Zi9R?=
 =?utf-8?B?NlU5WVBrR2NjaFBYVCtWV2x6d3Y4M2dYdFg0YUZuSmxqc1BXV3h1NEhmSm5E?=
 =?utf-8?B?cHJyTVZXWGFoL0phc1NPU2Z2NlhYMEdjd0xtMUdrcjRlSGRkR25ZaTRMZVpi?=
 =?utf-8?B?RkFLWjdoelZxM3VXL1lPc2pDQVcwNHRvbHJJQTk0S0I2cHlNTnBPMG5BbmVm?=
 =?utf-8?B?RlRwNmhMZUh0b2dQUTBHM0ZvQzgwTmZ0a0ljNlhwK21wSjE0eHVudmtwbC9Y?=
 =?utf-8?B?dFZob0FRREZIa3NWWGFteHdBb1Mrb05wYkZCTTJ6WmxTOVBoUFJ1SnpPNDVm?=
 =?utf-8?Q?Au644AThlxKOfeDVVuaj9eKQ5PmVFXwWiGHY4NX?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D7EDB0973A9737449E149A4E14253906@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2389.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 964065bb-0e1e-43ca-b9ef-08d8eeb63b95
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2021 11:16:12.2819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y0iXgm8vPGeicGF+SEzGlZ8w+ZYx13mSfx5e1Sxya7KWr09zm6zCH7yPTN35S+i7W7ltfM8XYMEiJlImiTAd+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2392
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCAyMDIxLTAzLTI0IGF0IDE4OjUxICswODAwLCBJa2pvb24gSmFuZyB3cm90ZToNCj4g
TG9naXRlY2ggQ29uZmVyZW5jZUNhbSBDb25uZWN0IGlzIGEgY29tcG91bmQgVVNCIGRldmljZSB3
aXRoIFVWQyBhbmQNCj4gVUFDLiBOb3QgMTAwJSByZXByb2R1Y2libGUgYnV0IHNvbWV0aW1lcyBp
dCBrZWVwcyByZXNwb25kaW5nIFNUQUxMIHRvDQo+IGV2ZXJ5IGNvbnRyb2wgdHJhbnNmZXIgb25j
ZSBpdCByZWNlaXZlcyBnZXRfZnJlcSByZXF1ZXN0Lg0KPiANCj4gVGhpcyBwYXRjaCBhZGRzIDA0
NmQ6MHgwODRjIHRvIGEgc25kX3VzYl9nZXRfc2FtcGxlX3JhdGVfcXVpcmsgbGlzdC4NCj4gDQo+
IEJ1Z3ppbGxhOiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIw
MzQxOQ0KPiBTaWduZWQtb2ZmLWJ5OiBJa2pvb24gSmFuZyA8aWtqbkBjaHJvbWl1bS5vcmc+DQoN
Ck1vc3QgTG9naXRlY2ggVVNCIGhlYWRzZXQgSSBnb3QgbmVlZHMgYSBkZWxheSBpbiBzbmRfdXNi
X2N0bF9tc2dfcXVpcmsoKQ0KSGF2ZSB5b3UgdHJpZWQgdG8gYWRkIHNheSAyMCBtcyBkZWxheSBp
biB0aGVyZT8NCg0KIEpvY2tlDQoNCg==
