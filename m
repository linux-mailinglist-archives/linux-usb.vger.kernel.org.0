Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23C035528A6
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jun 2022 02:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231667AbiFUAic (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jun 2022 20:38:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243292AbiFUAi0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jun 2022 20:38:26 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2116.outbound.protection.outlook.com [40.107.113.116])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BFAA101C6
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 17:38:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBGmiXpULS8TRvb9xToVaMajvCFk169WBrzoSqk2Vq9QVaJFejYPpODK5tZcuaq1Xpssm7WbccyUhUZYWO3JP9isltAHJF8pvKmYOt10ByENWCj3wAxDgG6E4IoKeClqvmolk2lFsMkV7vwzWmexzDlUOGrjTsAqvgnrkPpA8G3QS7gJvuN8fZn26YYaXjyz4nmZQF/C/E1eNz4iFdgtNNf0ZQckbx8g8qp088HRY8Ng/nIVZ+AgC7Qd93LuwDnNBduQra200a3iZ5dBeilcS77MNuDbE58W5thDKzcCqBHjc0zj6O2WS8zel3KDjaOH7vnXgz+drkYjc4P3F5TxYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0k8EhfBXNpuqt9WI9KrizG91Y/Vi4f1z85AYKA4HlaY=;
 b=BFpSHB0QCWUHYbAqgUG0K06MaQ9CRAdl7x9cbfz+Ba3gB+TS1Fr/ewYzeSafc+8qMtfrCj/ssFoPy6arTVF7JSTZiO44UulVrp+0xYflNgLkKj2t/K9fyMNBYCH0cUdBGtbOxSqNp2Sg2i0FoPdvhxRoS5kj4sUPKUfMqvAc9aEK7xexePYCaxAYJHKuXP2jjY0s5vy4mLS6rJdsfvYuxw29FPfM9NwOX9ZpjEOtEZPj0eQHUUh37WC+cU9z6iW+zTsrVjnlHxRqwqG7bsRheh0pamlavLLWbVy1QcJK/U2wQ9NA4PU2WqEy/+ggE0nduDzZXVR5m3BqMgciGydGJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=omron.com; dmarc=pass action=none header.from=omron.com;
 dkim=pass header.d=omron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=omrongroup.onmicrosoft.com; s=selector2-omrongroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0k8EhfBXNpuqt9WI9KrizG91Y/Vi4f1z85AYKA4HlaY=;
 b=hzs4HDgs1IUztC2NSuAd4B9PXmFlJLN8FbeAM15TQhrW1q8jPoYwrC8Bulz06TOXtTdnQVMV63EGj5O5vizq57QFsPiB1n3A6OlnPj4l+sYtzQkDbOD0ZelptK5qCEU0nEEVU0UZYKKRDlZBtweEEwNiIJNLV99Evbp0/4x7OrI=
Received: from OSZP286MB1776.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1bc::9)
 by TYCP286MB0813.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:7f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Tue, 21 Jun
 2022 00:38:22 +0000
Received: from OSZP286MB1776.JPNP286.PROD.OUTLOOK.COM
 ([fe80::f8f4:f6c1:9121:c7bf]) by OSZP286MB1776.JPNP286.PROD.OUTLOOK.COM
 ([fe80::f8f4:f6c1:9121:c7bf%7]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 00:38:22 +0000
From:   "michael.lee@omron.com" <michael.lee@omron.com>
To:     Chris Ruehl <chris.ruehl@gtsys.com.hk>,
        Lars Melin <larsm17@gmail.com>,
        USB list <linux-usb@vger.kernel.org>
CC:     Oliver Neukum <oneukum@suse.com>
Subject: RE: serial: usb: cdc-acm: OMRON B5L ToF, device probe failed
Thread-Topic: serial: usb: cdc-acm: OMRON B5L ToF, device probe failed
Thread-Index: AQHYhG3cEtwOtTbg8UyqyHxxQGRYs61ZBUuw
Date:   Tue, 21 Jun 2022 00:38:22 +0000
Message-ID: <OSZP286MB1776CCBCBFE38B25C7DB9978E1B39@OSZP286MB1776.JPNP286.PROD.OUTLOOK.COM>
References: <85ebf554-effd-c89e-6eb8-c149442b931c@gtsys.com.hk>
 <fc9986a6-0b11-d949-2196-1ad35d3f4d98@gtsys.com.hk>
 <1af7ff05-8558-9162-a0cd-ac140ddaf2e1@gmail.com>
 <cbcc2071-5b56-025e-cae6-5af0210e2363@gtsys.com.hk>
In-Reply-To: <cbcc2071-5b56-025e-cae6-5af0210e2363@gtsys.com.hk>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=omron.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: faf8137b-9e5e-430d-4b99-08da531e5851
x-ms-traffictypediagnostic: TYCP286MB0813:EE_
x-microsoft-antispam-prvs: <TYCP286MB0813DBC3F9B1EC8957A6779FE1B39@TYCP286MB0813.JPNP286.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PNegZsFWZQS3rQnq4KIUzXMShj2DBGOnIM/Kt3mLsfkgXfoyQ86kvHW0hfixOa03Whr8mUthp6PMFsjXToleIqOHK/4JdQKPrpBJOT5P9oAYKEDpsf9iFcDqhxMfTG9W6OaNH32WoJE9sYHdb1xUdm0oc4fZGXP5W+Xbn2MSfGSltxd/ORtZOz6cohjgVcio+y4Pd2s3vA3nnGP1oDSb75pNxgIqCh17Fcl5s6zC5kCXPpD6TQG6rkHBFzT0eMOqtkF03dO4gcLPNvYphgBCFJZTRlmIVcbyl8Tz45JfasZ8fmbhaXGAU3ekuh2WlW5Lz6SAdfewg78hwzCkIwWav512sdxH76vC3pFX45lUv5Nss2WcWX/bEz4sxqX+OapdWoHnW/3NcOJ58+V9eG5bpeR5XkMUXUg+u1HLlZSwotBTzceL5iOrQnifUsgMFM1vuc37h1UlWDu0MI0LaIP0usNu6e5wKy8D6ebOASSxPdz1SnQu/pqPPjhsvuDifpeWCCDQZ95rp0wcZKI+eNYkq6XsQ/j8g2zOULTKALQcPyGm4by0+Y69weZGGqCay8pi0VIT6mr5OjJykli85HpxLvWzyjQT70D9fg4UeD+JbGhZdKTZUHdNxIQ8E0iclvTO7U597NxcO35pyT19NkH+G+jagLLGA4B8tgDoZPI+2dgDho0SSly4Urn6xMhKEF5IRhKPr9JhRuReMMfiguef03+UzaB0NRwy8nN3mMZRY+8uVtj9Jph6GctDmcPXfzZvRx5VT93yfFVYtyl0PNDJVJouIcuyI6lK9zaZ2QWNcJg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZP286MB1776.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(39860400002)(366004)(346002)(376002)(19627235002)(186003)(66476007)(64756008)(76116006)(66556008)(478600001)(71200400001)(33656002)(66446008)(52536014)(966005)(316002)(7696005)(5660300002)(66946007)(53546011)(83380400001)(6506007)(8676002)(86362001)(41300700001)(26005)(122000001)(110136005)(38100700002)(8936002)(4326008)(55016003)(9686003)(2906002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWhKNWxycWY1QnVIMVQ2MmhtMVE2MXRwQUJuZ0RFWHBqOGllWUNOWk43L1FF?=
 =?utf-8?B?WG5uSk5UVzNXNndLakRDQWNMYXRTN1Q3LzY2U0l1T3U5d1RDeXM2WVZzWkVj?=
 =?utf-8?B?S0hNdEZvbkM2K0UxUVA1Tm1NSUhyTEVsU0ZFTmo4NEtCZWphQ3FBbEJmL3kr?=
 =?utf-8?B?NDNWVkppdWttTXIxd1J3ZXRreFlldFNPOGRQVzhkeXVjMHEwZ3dkQzlWSnVi?=
 =?utf-8?B?WTJLSUlaRDdpa3U5eCtVVE9HMUJnYllVVit1cGFCQjdvUm9rYnhMMkd0RmlN?=
 =?utf-8?B?bGptSlBsTTlmVzJEMytPRGgxOTNyMkcxSEdtcXczTXpBMDkvSm05a2VlMFhw?=
 =?utf-8?B?S0FZc1k0Nk9aQzVmYkJGMjdOekhiMzlmanFSVlBCK2dHQXltL2drYVJNRkEy?=
 =?utf-8?B?ZGlNR2lHUjgrMXloMmNtaUZUNHN3akxGbTFlVXAvUkJnQU1Uc25uTTFTUWk0?=
 =?utf-8?B?RnFQazJ1MXhBS2ExTWhJdUhvTlhvSVc4aTU3SkJ4Tzg5dmMwaTloM1J5b0lK?=
 =?utf-8?B?NDh4MTNSUzBubGxxaWVDOGlZeUxyYytNenNpOTBFTmVVc3NpN3JJTXp3bVZz?=
 =?utf-8?B?MjhuZHBsQktKQkRvTXg4MVF1UW5oT29TKzhaakFjbVlnS29lLzZJZFZaaFVn?=
 =?utf-8?B?NUdkcFpkS0owbTQ5NE14cHhkZFF1TDFuazg5aWJHMlVMRXpmOGFtWUFaQktN?=
 =?utf-8?B?dVpTMEJmV0k5Tm92TTlWaG5VQ3Fsa29EbnZpS05hUVYreW8vQ1c1elBDYUt5?=
 =?utf-8?B?QVdGUlJLR0k0RmN3NllUU0hVSTAwWlpxQTFlMHpQWGE0dmlKUG15V0pnOUZE?=
 =?utf-8?B?aE8xMnBRRGlQelkxT2RNMVBQbEx6SEhZRC94YXlBK3htTmZTeWxCaWVSS2ox?=
 =?utf-8?B?dkl1Y2RNN1VkamVjT0liYXRQNnNKZHRHelVMQWlGcFc0cUM0MGVHMld6OWZv?=
 =?utf-8?B?c2poRldaQTh4ZFAxR29maE9BR1d5OVQ0NmltUis3ZS9QYS93dS9Yd2lGMzJ4?=
 =?utf-8?B?bUloSHdDSjBlY2dMQTIyVmJpL2dXTHZvNlVEbXJxSlhzclg2Q1UxVTVZcyta?=
 =?utf-8?B?VTg5WTZsc3BHR0xRMmxvV0d1bExBY3dnQVcwUEk5a1R2Y0F0eXQwSll6YnpE?=
 =?utf-8?B?VEJvdXpadVlJSUdqdDRiQkowRjZDNWdvS0FlSkkyMWlJSFBNTFFiZXpvbzEr?=
 =?utf-8?B?aDh5U25vcnpKaCtWUlRYTkhnWTJQSzAvVjAvVzZEckZDa1ZBVkdpWWtHc3JT?=
 =?utf-8?B?RmNQdVFSY3hQUVZmNkpySHJLcXRlMmVoTk9nS2dkM3JUeStpZWpWY1dMSzVX?=
 =?utf-8?B?TEhlMThxbWl4T1FJcVNCL0NtbExua0JsSDBtY0s3L2NFenUyZSt4RDQ3RXh3?=
 =?utf-8?B?cTNmRi9PY2QwdjF6NWFwYzBKMkNmL0xpZ1NEV0pSVllmRlNsdi82UDRXa1R2?=
 =?utf-8?B?aE1rcDdFbEw5Q3JybVFmV1k2bHMwZ2J5Wm9NWU43V0ptQjV1amIzM3Vxcmhy?=
 =?utf-8?B?Vk51OFNPb2VsNFRrMEYzZkxaM0tuZlBOQitHM0Z4dTU0dElBVko4NTBoZWwx?=
 =?utf-8?B?Q2krZGpLRGc1bDF5QnlPUHl1blpqTXIwSURkbXpCQ2JxS2NUdWpRQy9aelpR?=
 =?utf-8?B?M2Z1VjNnOXlUQVVRSm1SZG9rRmc4cndVODVsZlpaQUhXa2hGZWNhWHU4bmpp?=
 =?utf-8?B?eUs5RDVXVkVmZXRyd2RZU29kZk15Y3BMQjZLeEs3djhFUGNVVG0zeVYvV1ZT?=
 =?utf-8?B?ZTluRy9lVTFSSStESHNRcnhMdHlta3lFeXBuYlgwdlBQbW9MMGd2eWlvc1k0?=
 =?utf-8?B?N0QrRGdTWEtpK0oyZi9pWDJGQytHSWJ3Z0lpeXdYSWZHVlk4QTBOQkJScEZP?=
 =?utf-8?B?RnRva09jMlNyMUhmV3NHM2hORTVtay9RVFVlanVuUXRSbFBpRVNBNEI4RU1I?=
 =?utf-8?B?OUlWSVg3RFZBZ1B2SGhIUFp0M0JyQUhXSHNXTnpkdURobmxmZjgxeWMrYnZK?=
 =?utf-8?B?OEJpZWVUYkp5UnFxc2hINWlkTE93WllCVzJHSkpjUXBWa2hVeG5mT3pyYnpZ?=
 =?utf-8?B?cldlNTBuOEY5aEhyT3Iwcys2dEJVUHpvNFZVa0FsT20vRkxObzc5UHVlT2dV?=
 =?utf-8?B?ME9jZW01VFRoMjZEaDI0WGRnb1gyTHA4VW83UGpGSDJlN2EwbHgzZlNUcmtH?=
 =?utf-8?B?OWN2UVJvK1U1aTJaNHE2MmZkZFc4dlVDM3B5WHM1M1o2Sng3ZWJTdUtQS0dM?=
 =?utf-8?B?T1BFVnMxWVFHeU9lUUg3cGdxQkpGQ3VOc3h5ZnFUbkdrRWZ0N3hyZlpTeWlS?=
 =?utf-8?B?dzJINDI5bSs3Z29yRTcrYlZxU1JCc1ZscGpUV1hsbjJhVzUxSjRrQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: omron.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZP286MB1776.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: faf8137b-9e5e-430d-4b99-08da531e5851
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2022 00:38:22.1881
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ecff5a9-4bef-4a7b-96ec-a96579b4ac37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HJkIzhD7tgV5li2vXQmkJ9bB5Ot9BhjE7Wu3VPBa+g6byzeBbap/JhpFQBXeEoWqDj4J+xNfbhDeM7Tttx7NKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB0813
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RGVhciBDaHJpcywNCg0KVGhlIGJlbG93IGlzIHRoZSByZXBseSBmcm9tIEphcGFuLg0KDQpEb3Nl
IHRoZXkgZG8gdGhlIGJlbG93IGNvbW1uYWQgYWZ0ZXIgY29ubmVjdCBCNUwgdG8gVVNCPw0KDQpz
dWRvIG1vZHByb2JlIHVzYnNlcmlhbCB2ZW5kb3I9MHgwNTkwIHByb2R1Y3Q9MHgwMGNhDQpzdWRv
IGNobW9kIG8rd3IgL2Rldi90dHlVU0IwDQoNCkZvciBsaW51eCBlbnZpcm9ubWVudCAsdGhpcyBj
b21tbmFkIGlzIG5lZWRlZCB0byBjb25uZWN0IEI1TCB0byBVU0IuDQpXZSBwcmVhcHJlIHRoZSBi
ZWxvdyBzaCBmaWxlIHdpdGggYysrIHNhbXBsZSBjb2Rlcy4NCmNvbm5lY3RfdG9mLnNoDQpodHRw
czovL2dpdGh1Yi5jb20vb21yb24tZGV2aHViL2I1bF9UT0ZzZW5zb3JfU2FtcGxlX2NwcA0KLS0t
LS0tLS0tLS0tLS0tLQ0KUmVhZE1lX0UudHh0DQoxLiBGaWxlIGRlc2NyaXB0aW9uICYgSG93IHRv
IGJ1aWxkDQpUaGUgZm9sbG93aW5nIGZpbGVzIGFyZSBpbmNsdWRlZCBpbiB0aGUgU2FtcGxlIENv
ZGUgcGFja2FnZS4NCiAgYnVpbGQuc2ggICAgICAgICAgICAgWyAgIExpbnV4ICAgXSBTaGVsbCBz
Y3JpcHQgZm9yIGNvbXBpbGF0aW9uDQogY29ubmVjdF90b2Yuc2ggICAgICAgWyAgIExpbnV4ICAg
XSBTaGVsbCBzY3JpcHQgZm9yIGNvbm5lY3Rpb24gQjVMIChVc2Ugd2hlbiBUb0ZfU2FtcGxlIGV4
ZWN1dGlvbiBkb2VzIG5vdCB3b3JrKQ0KIERldGVjdGlvbkN1Ym9pZC5wZGYgIFsgV2luL0xpbnV4
IF0gRXhwbGFuYXRvcnkgZHJhd2luZyBvZiBEZXRlY3Rpb24gQ3Vib2lkIHNldHRpbmcNCiBpbml0
X2dwaW83LnNoICAgICAgICBbUmFzcGJlcnJ5UGldIFNoZWxsIHNjcmlwdCBmb3Igc2V0dGluZyBH
UElPICM3IHBpbiBhcyBvdXRwdXQNCiBUb0ZfU2FtcGxlLmNwcCAgICAgICBbIFdpbi9MaW51eCBd
IFNhbXBsZSBDb2RlIE1haW4NCi4uLi4uLi4uLi4NCg0KQmVzdCBSZWdhcmRzDQoNCk1pY2hhZWwg
TGVlDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IENocmlzIFJ1ZWhsIDxj
aHJpcy5ydWVobEBndHN5cy5jb20uaGs+IA0KU2VudDogTW9uZGF5LCBKdW5lIDIwLCAyMDIyIDI6
MjEgUE0NClRvOiBMYXJzIE1lbGluIDxsYXJzbTE3QGdtYWlsLmNvbT47IFVTQiBsaXN0IDxsaW51
eC11c2JAdmdlci5rZXJuZWwub3JnPg0KQ2M6IE9saXZlciBOZXVrdW0gPG9uZXVrdW1Ac3VzZS5j
b20+DQpTdWJqZWN0OiBSZTogc2VyaWFsOiB1c2I6IGNkYy1hY206IE9NUk9OIEI1TCBUb0YsIGRl
dmljZSBwcm9iZSBmYWlsZWQNCg0KDQoNCk9uIDIwLzYvMjAyMiAxMTozNSBhbSwgTGFycyBNZWxp
biB3cm90ZToNCj4gT24gNi8yMC8yMDIyIDA5OjQ0LCBDaHJpcyBSdWVobCB3cm90ZToNCj4+IEVu
YWJsZWQgdGhlIGRlYnVnZnMgYW5kIGNoZWNrZWQgL3N5cy9rZXJuZWwvZGVidWcvdXNiL2Rldmlj
ZXMgZm9yIHRoZSANCj4+IEI1TA0KPj4NCj4+IFQ6wqAgQnVzPTAyIExldj0wMyBQcm50PTA0IFBv
cnQ9MDEgQ250PTAxIERldiM9IDE3IFNwZD00ODDCoCBNeENoPSAwDQo+PiBEOsKgIFZlcj0gMi4w
MCBDbHM9MDIoY29tbS4pIFN1Yj0wMiBQcm90PTAwIE14UFM9NjQgI0NmZ3M9wqAgMQ0KPj4gUDrC
oCBWZW5kb3I9MDU5MCBQcm9kSUQ9MDBjYSBSZXY9IDIuMDANCj4+IFM6wqAgTWFudWZhY3R1cmVy
PU9NUk9OIENvcnBvcmF0aW9uDQo+PiBTOsKgIFByb2R1Y3Q9T01ST04gQjVMLTAwMTAxMQ0KPj4g
UzrCoCBTZXJpYWxOdW1iZXI9MDEwMDAwMzE5QTENCj4+IEM6KiAjSWZzPSAxIENmZyM9IDEgQXRy
PTgwIE14UHdyPcKgIDRtQQ0KPj4gSToqIElmIz0gMCBBbHQ9IDAgI0VQcz0gNCBDbHM9MDIoY29t
bS4pIFN1Yj0wMiBQcm90PTAwIERyaXZlcj0obm9uZSkNCj4+IEU6wqAgQWQ9MDEoTykgQXRyPTAy
KEJ1bGspIE14UFM9IDUxMiBJdmw9MG1zDQo+PiBFOsKgIEFkPTgyKEkpIEF0cj0wMihCdWxrKSBN
eFBTPSA1MTIgSXZsPTBtcw0KPj4gRTrCoCBBZD0wMyhPKSBBdHI9MDMoSW50LikgTXhQUz3CoCA2
NCBJdmw9NDA5Nm1zDQo+PiBFOsKgIEFkPTg0KEkpIEF0cj0wMyhJbnQuKSBNeFBTPcKgIDY0IEl2
bD00MDk2bXMNCj4+DQo+PiBEcml2ZXIgaXMgbm90IGFzc2lnbmVkLg0KPg0KPg0KPiBUaGVyZSBp
cyBub3RoaW5nIENEQy1BQ00gaW4gdGhhdCBpbnRlcmZhY2UgZXhjZXB0IGZvciB0aGUgaW50ZXJm
YWNlIA0KPiBhdHRyaWJ1dGVzLCB0aGUgaW50ZXJmYWNlIGxhY2tzIGV2ZXJ5dGhpbmcgZWxzZSBu
ZWVkZWQgZm9yIGl0IHRvIGJlIENEQy1BQ00uDQo+IENoZWNrIGlmIE9tcm9uIGhhcyBhbiB1cGRh
dGVkIGZpcm13YXJlIGZpeGluZyB0aGUgcHJvYmxlbXMgb3IgaWYgdGhleSANCj4gaGF2ZSB0aGVp
ciBvd24gcHJvcHJpZXRhcnkgZHJpdmVyIGZvciB0aGUgZGV2aWNlLg0KPg0KPg0KPiAvTGFycw0K
DQpIaSBMYXJzLA0KDQp0aGF0J3Mgd2hhdCBJIGhvbGQgdGhlIEhrIGhlYWRxdWFydGVyLCB0aGV5
IGZvcndhcmQgdGhlIHJlcXVlc3QgYmFjayB0byB0aGUgZGV2ZWxvcGVycyBpbiBKYXBhbi4NCg0K
VGhhbmtzDQpDaHJpcw0K
