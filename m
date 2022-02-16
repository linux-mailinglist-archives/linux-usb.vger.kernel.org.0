Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B98454B8501
	for <lists+linux-usb@lfdr.de>; Wed, 16 Feb 2022 10:57:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232525AbiBPJ51 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Feb 2022 04:57:27 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:42036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231767AbiBPJ50 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Feb 2022 04:57:26 -0500
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com [216.71.142.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BBCD27AFE3
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 01:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1645005429; x=1645610229;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FD3RfIvK6WQqjKx0CyxaEmxh4gfA9faw7BQeo8Pafvk=;
  b=xRuBnuP70M8+e+b2p/pSYdWsUWLRGnnmbJYrQjR0RHtATsQ/n2j7rUn7
   0zN+EFsCYMAYc4HROOjw8ey+HSBPdb3Jc0zNpcJ2b1KtpmD5ftFOwkVO0
   2CFYlHEEb1yHnQ6M/5/4ksLtVvTO6zYtDGyTipB7dr7lvHJ/lIxv0v2to
   c=;
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 09:57:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QErF3hsIqmoQ8KKk5HGRTTnULm+Vyb/ZbhpKoBgFx5+vGbqokHF/2nik3RcVSyvRTLlcv8aEMWPVOtgzrWI+6W/OSdxeF+ovhACBM9TaK1jMhPw/t7rwobLFcZaxzgLvde0U+zdffyDdvOCEstMAUYoLPPcy6BIHgJHDaB6OfzunI6guoW/jvIch5m4OAzLIWNZFSiRKofG7MsAadr2TI2vZ//HuSELdpRqcwtrJP0otw0cN/IOfLC9eS3u7GehTIDp08bYbZfU+ZwLB5Yvf1oDr827wqxaKZLX/cNf3wP9FhWT/7u0Xmh4sUgak3KSxkmxtLbgZbvntApTBIBbE0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FD3RfIvK6WQqjKx0CyxaEmxh4gfA9faw7BQeo8Pafvk=;
 b=fINf+0faF2AHsTMOGfodtVODL92wsaYUJ+vYBRPZ9F8t9L1nINoLFDnydQ4u7hOcEF25yyrs09zWYF0nBUtf0Thk0H/n1qG7BEju+0ky+KtuuXcbBXRDh1LCMUGhey+NA/M3w0WXkVE1WBiizVVVjKkBADGmkqGPyRc0Xfabq6+aRlExhrfdUNn2q817WFCfAzPEYUW9dnSx7dYYpwmLHR+sdkJsaiM3//b53x0r4bA8sBZtmnCCfg+PLDRu9FtnYcPNDHxZwqCoC78V7N3yYtFZ/QO9rv3OeuytocrNioj4UI3AMqBLkwEpMJoq1RXBjr3Y3HT6hfto9eMlbsBn9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 SN6PR02MB5423.namprd02.prod.outlook.com (2603:10b6:805:e1::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.18; Wed, 16 Feb 2022 09:57:04 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::4436:2dce:bdd5:f36b]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::4436:2dce:bdd5:f36b%6]) with mapi id 15.20.4975.019; Wed, 16 Feb 2022
 09:57:04 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Jack Pham (QUIC)" <quic_jackp@quicinc.com>
Subject: RE: [PATCH 1/5] usb: host: xhci: use ffs() in xhci_mem_init()
Thread-Topic: [PATCH 1/5] usb: host: xhci: use ffs() in xhci_mem_init()
Thread-Index: AQHYIwK9k1QFHIs6WkKkI3ydjpIoXKyWcu2A//97FUCAAIgUAP//epuA
Date:   Wed, 16 Feb 2022 09:57:04 +0000
Message-ID: <DM8PR02MB819806B3CE8EB69B516E893AE3359@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1644994755-12975-1-git-send-email-quic_linyyuan@quicinc.com>
 <1644994755-12975-2-git-send-email-quic_linyyuan@quicinc.com>
 <4688f5bb-c0fd-bbce-de1f-a554d543ed03@gmail.com>
 <DM8PR02MB819861F71713D5539EF66D12E3359@DM8PR02MB8198.namprd02.prod.outlook.com>
 <c6cf661b-b3df-281f-3cb0-8899c95f9ce2@gmail.com>
In-Reply-To: <c6cf661b-b3df-281f-3cb0-8899c95f9ce2@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2c99c91-2087-4d6c-f5d0-08d9f132afa8
x-ms-traffictypediagnostic: SN6PR02MB5423:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <SN6PR02MB54236514F4C8688E967611909F359@SN6PR02MB5423.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oSKQeZ/gQ60wTNhFFW0xwLy3505Z25MML/BXoRhg3oQQngjJHRnnLTUZ4fO+W7Wvs17B0V3SgeJMl0D4ULvDUuVO0b3NLlSXk0LKhgnniMcDsiboQl63xYAE9YRosCw22SInyA/BS4rekEMF4I8BbQk+18WjosaU6F0eK3w5A4KgR70NCt4p1IzO/2RE8NS/K+30y0a05sDvCYm92ATVUm8ljXSM7I2jdPoujxXXUwSWDACOvHeITK4HU0u4bVEu+FpJHPTbCrNPsVL63ZykDY/79BZL0F8LbszLG7vWZqQQUR7NliluKNB28XbiZ2YWkCOsV7ZYrV3UgE0F3Vb8Y+RAhRf6huP8rk1hRqVgtw551iElWK2U4iD4J9U3B3eiVQLfzD46ABpD0E7rAhEsgSBhp3DNUnFEdcnoVoYnTFnww0N5h2fWx6sw9Glidycd6yM4DqxoJN9KdbqWOD+1UYwOL/ccN/G5+0S/wtQBibKnGcQ2GFMCUoL7yEZhW1CqXQxv9FIe1CEKWPkmCNaCzhM433b9j7wFYog6zx8A9fJ//Ip0RijhOZZPil6ICTMzr9EcY4ka7aRVb+UewkwGrRtkt9PFX89agEEsiW56/YoPfCc4gJ132ZL1jBozL8/znfWRHFUzT89ZykI6N+1bI1C8vvZDw640Rcp0OxVekLnBAdMQInmPZdAy6UND1IH5ZpxLoM2Jo9f9gxRtp0iHLQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52536014)(7696005)(6506007)(8936002)(53546011)(38070700005)(5660300002)(71200400001)(86362001)(66446008)(66556008)(64756008)(66476007)(76116006)(66946007)(508600001)(9686003)(122000001)(8676002)(316002)(38100700002)(4326008)(107886003)(110136005)(54906003)(55016003)(33656002)(2906002)(4744005)(186003)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0wxM0lVVDg1a3JZUjYwdzdJTG9vcFJaOEF4SEUwR3M5amJURkdRK3pheFhn?=
 =?utf-8?B?K2MvaUlnVUorNlRtWDFWOVFqUGlwb3BGUDBGY3hyWXRrQ0F4UUxaU1pMUzFC?=
 =?utf-8?B?NW5nOGR5N2xrNjllM2pQdHlTOWx4VU1XRTNORGFnbjIzR1UyQkhkTll1RjRW?=
 =?utf-8?B?dmxxbWw4TTBLaUhDWDk3dFNtSWRkL2VpSUhTYVZPaGczcTV3WjdTMzBxVkdK?=
 =?utf-8?B?NkFoOGYrakVZVnlCeS9HazBlYWVjYi9aZGlyRkxlYXUxc3VsUnl0NEN4dkZv?=
 =?utf-8?B?UnM5ckN2SFNKekdFWFl3ZDRlUlZvaWZJeDFQeXFpeHM5aWZVdHEvNnkxVHZo?=
 =?utf-8?B?YjlIZ1l1OG5HbHdVaE45dVVLcnlRenl6SXRnaVorZjRGZG5nVGN5K2VwWUtu?=
 =?utf-8?B?Um9zbmt0cExZemQrSWxSR29YYVROb3BNMUltaHhrWGJhcUF5L1diY1N0UlBm?=
 =?utf-8?B?eGFaK1A3VHlzMDVPaEhSZmZ6bkR5cjF2ZytMWG9XUmRucnlSSW9zRitYdHFX?=
 =?utf-8?B?ODFPSFZ4Y3o2aDBsL1pvdGd4TVhWS3hFTE5SUzdMRURKQXQrUEM0c0wrc0lx?=
 =?utf-8?B?QWU3MFNodkxQN1ZTNUJQU3k5VDF6QXQ2V1diODNGMUNDOFplcWZ0T2JEVFEz?=
 =?utf-8?B?U2hWUktTMUxPRlI5YkxJZFVpM0U5WmpicVZkc2N5Mzg4SjBlcFU4RUZvTlZk?=
 =?utf-8?B?akVwdFJLa0pUN3dDY3UrMkdiVmhGVU5KY1FZSm9zV2UyZjhBbGFTODNTenkv?=
 =?utf-8?B?d3pSUkxEbmZQeENrQ2dxTmlLQkhEVzA5d3FJdXo5ZWhYcVZIS0hUdXFHa3pW?=
 =?utf-8?B?ZzZuc2RUd2dkb0hEODNnWjJ0aDVsRkhFQ1dKVmRSNmRYa3VhM0hrbXk0OVJ0?=
 =?utf-8?B?a2NadHFSbWpKZFI5b0VuaW1Va0puNjM3NE1iQTF0NGZtNmR3UTFXT2JKOS9V?=
 =?utf-8?B?dWlBNmhmYXp0ang3UnplNHZuUWJSczI0QUpMbmQ4OXhobTdma0ltWjVYdlkz?=
 =?utf-8?B?T1hTdFZHQmNyTTlzaWs0L2lneWg5K1VLclNabDcvN0d6Mk9YYWRTRmN0cEU0?=
 =?utf-8?B?WnloaDJUcW9RTnNMRkh2cUc3amhXZXM1anY5bXhtNWlJTnc0RUk5bFpiSHNC?=
 =?utf-8?B?VTYrTGFjdS8rYzU2aEJ4QUw4a0dtZnFFbUQvQzVDcE1jRDZXSnIxUU9FaWhK?=
 =?utf-8?B?MG96clhvb1BLc3ppZk9xRXY2dGQ1RW84VklXUTQ2aHAvOGdOU2dOWlQ1WU1q?=
 =?utf-8?B?eTdLeTlkV2NxMXZKVUx2bU11QTRaOXF3cjZvQWFqNmhGbFU4QmE3U2ZVZm1Y?=
 =?utf-8?B?b3JWOEE3UFpKdXhEcjJEaVFubVEvTEM0LytwY2RYcnF6UHJyaHIrTGx3M3Ry?=
 =?utf-8?B?SWZFdWU2czJJQjBWOUVLaVp3RGVVS09NZXFsRDl0V1YvdkhxQTZlSXFvR3Nv?=
 =?utf-8?B?N0UzTFovSG5OMEMwTGErTGtRaVBuaTFnbjUwTFA4ZFRrdy9OekFhVDdKd3Ew?=
 =?utf-8?B?aUQ3eHI0MmtIa2lud1JkYUFnOXZ3ekxnRzJZdnBOc005eUVDVVR5MWpOb2ly?=
 =?utf-8?B?NG43L0JaVE1ldDNjQm9id3pFMWd3bDNBdTBPcGtYaTI3YXZmTmNUNFkzUjIr?=
 =?utf-8?B?UXJpaWNJZDhqME9TT2pUMzZyVlJhMkE1ZEh6cWt2N083KzZQSHdoTUR0eVJE?=
 =?utf-8?B?Z3lWRkN6Rm1VeVd5Zk5obm9URVlmb0k1TC95Q0IzUnpaQlJaRzdlbjRMdHhO?=
 =?utf-8?B?WmoxbENvOW1mbWpxZW4vSTVackVGTG1WWEpPY2RVUlRpMDhmSHhlZU5Sc1hO?=
 =?utf-8?B?YlZFTkRFblBqd3VXVGRscWVrU256eFYva09XZHB3aU9RMDAydVZncU5VYmtD?=
 =?utf-8?B?VHdLVTc1cXNENno0czhjZkJsUUlLcFVnbE1XK1pOUTV1TjMvNWVQN0l2QWkx?=
 =?utf-8?B?TWc4aHp3QWxha0ZqR1hHR0VKU09iNFVlRE42RHJyWDhPd3RzMkppYnhGbUE2?=
 =?utf-8?B?cWpwUHVUcDhjS0o5elJDY2VUSGV0ZXZPRjZMeVhTWVo0WnAzM1ZxeTgvTnZK?=
 =?utf-8?B?SW13VmJYTE9uclZFTXFkZXhtdE5YYkR0cWo2Sm5zNHFsVEpRUlZCQmMzYXh1?=
 =?utf-8?B?RE9XVTNVUW40cjBPRFhMZnI3dVZyS1FWdG5tM2l5SGpyUTdCemVZNlhwWVQv?=
 =?utf-8?B?blBiQmVRNFVFSkNxbWs0bVAzQ1N1cExPMHVKMmtHK0pBMWh6b1RBNklsY2J5?=
 =?utf-8?B?Vnd5U1ZSanRRMmJYUXZtYzI5NUN3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c99c91-2087-4d6c-f5d0-08d9f132afa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2022 09:57:04.6118
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CMTpyatzFwq4EZ1RwRnJ3YRnM9QBj/F6lKx3JKX+x1ZpgJKJoiFuvFuB9jPih5s1a4DpijeBMDDpnNXoU0M+4A/nf5aTP9+dTrWOSCkN7Ts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5423
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PiBGcm9tOiBTZXJnZWkgU2h0eWx5b3YgPHNlcmdlaS5zaHR5bHlvdkBnbWFpbC5jb20+DQo+IFNl
bnQ6IFdlZG5lc2RheSwgRmVicnVhcnkgMTYsIDIwMjIgNTo1MyBQTQ0KPiBUbzogTGlueXUgWXVh
biAoUVVJQykgPHF1aWNfbGlueXl1YW5AcXVpY2luYy5jb20+OyBNYXRoaWFzIE55bWFuDQo+IDxt
YXRoaWFzLm55bWFuQGludGVsLmNvbT47IEdyZWcgS3JvYWgtSGFydG1hbg0KPiA8Z3JlZ2toQGxp
bnV4Zm91bmRhdGlvbi5vcmc+DQo+IENjOiBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnOyBKYWNr
IFBoYW0gKFFVSUMpIDxxdWljX2phY2twQHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIDEvNV0gdXNiOiBob3N0OiB4aGNpOiB1c2UgZmZzKCkgaW4geGhjaV9tZW1faW5pdCgpDQo+
IA0KPiBPbiAyLzE2LzIyIDEyOjQ3IFBNLCBMaW55dSBZdWFuIChRVUlDKSB3cm90ZToNCj4gDQo+
ID4gdGhhdCdzIGNvcnJlY3QsICBmcm9tIG15IHZpZXcsIG9uZSBsaW5lIGlzIGdvb2QsDQo+ID4N
Cj4gPiBXaGF0J3MgeW91ciBzdWdnZXN0aW9uID8gdHdvIGxpbmVzID8NCj4gDQo+ICAgIFllcywg
YW5kIGl0IGlzIG5vdCBqdXN0IG15IHN1Z2dlc3Rpb24gLS0gaXQncyB0aGUga2VybmVsIGNvZGlu
ZyBzdHlsZS4NCkkgdGhpbmsgaW4gbGludXgsIHRoZXJlIGFyZSBtYW55IGNvZGUgbGlrZSB0aGlz
LA0KDQphcmNoL202OGsvc3VuM3gvZHZtYS5jOiAgICAgICAgIGlmKChwbWQgPSBwbWRfYWxsb2Mo
JmluaXRfbW0sIHB1ZCwgdmFkZHIpKSA9PSBOVUxMKSB7DQouLi4NCg0KVHdvIGxpbmVzIGhlcmUg
aXMgbm90IGdvb2QuDQo+IA0KPiBbLi4uXQ0KPiANCj4gTUJSLCBTZXJnZXkNCg==
