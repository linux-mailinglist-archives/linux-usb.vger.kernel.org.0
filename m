Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5CE4F9989
	for <lists+linux-usb@lfdr.de>; Fri,  8 Apr 2022 17:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237613AbiDHPeB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Apr 2022 11:34:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234227AbiDHPd6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Apr 2022 11:33:58 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2085.outbound.protection.outlook.com [40.107.20.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91C57316285
        for <linux-usb@vger.kernel.org>; Fri,  8 Apr 2022 08:31:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxuGCydNwg77jMe70j0sl2Nt6vrITh1zJiyWZ9kNW+/9KyXRkxx7qnnZ/BbWXncIi26UF1RMaWrpsx0kyrLLe6OQ2W6zYHQrpjpw5DzYC00xuRvlBSg3CZEoEeoZzI+Yd13yfy6PxSBvQFHrn+FZ2WLDM8HHuSr6na5yDzXdBsb+U9uMdwYIp/AhNqakCryrSMfblu8fkixIUUDz1na9OKmLQvK+W6mG5Bk7sa4ujM/qb46J6JdQiclSGTA5ORwODa9f9afS3IU66xuFMYv2Yc4TyTvUZU0+7cCdg5CJww3TXZ+GwmXHRHz4CZa/ewnNf+6eM5G8gojohgFjIP88TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gk/9L3jld23K/yptJPL2zCDK6nuf+UX6A3xqtJTnaTE=;
 b=hmn0gJlPkCuCr+P4uh+DW0QulVudVYSdx8GH3Eh2XIJkC5V1viekF76OhqPnOeVdbR6AVpnLmo3sY93VdDKX+kasN8AtWav2gQhAkOTPgfZpX6SCu7aGp7l8ws35N3dRu7+vQVI09WGzqOUu/GpGysSQFJ2IqRsDNbWOpcXzfdxXCL5uF65/cETTgiWNIv5qhXMWfd9yRQj05egFnu/v1g7ArD73paWs8jDTIbDL75erjYNUf4TBxiuJPJ8MrYQ19wzQsmd3oSf4z6jZMSDDm7zSKoqKOHJiUchLAiTo/JDqVOKwKvDG69yOx3vF6hh37cBxZysyn2vBVvGYzqZOsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ares-ci.com; dmarc=pass action=none header.from=ares-ci.com;
 dkim=pass header.d=ares-ci.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ARESCyberIntelligence.onmicrosoft.com;
 s=selector1-ARESCyberIntelligence-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gk/9L3jld23K/yptJPL2zCDK6nuf+UX6A3xqtJTnaTE=;
 b=nfO1lgP+3vAZscSkkxQ1VO52XHFLo3ZYRzbwUlDLMWql7VnYeBzCiaWt2lsxpYK+8lTtN7rt+QMJ36TconYarY7QnanGubRQ5xM0UxdmxluEMuE6b28WGp+VN4Y8g+wx7A2yYJsDoPW2q99+MZTwjLo2GcnFfUpdB7xjpBy8f0o=
Received: from DB6PR08MB2646.eurprd08.prod.outlook.com (2603:10a6:6:20::26) by
 VI1PR08MB2688.eurprd08.prod.outlook.com (2603:10a6:802:19::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.25; Fri, 8 Apr 2022 15:31:52 +0000
Received: from DB6PR08MB2646.eurprd08.prod.outlook.com
 ([fe80::416c:74ad:97de:f179]) by DB6PR08MB2646.eurprd08.prod.outlook.com
 ([fe80::416c:74ad:97de:f179%7]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 15:31:52 +0000
From:   Florian Eichelberger ARES <fe@ares-ci.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Issue using PL2303GS device on Kali Linux
Thread-Topic: Issue using PL2303GS device on Kali Linux
Thread-Index: AdhLXcKQLmhHPAa4QMiWQIWB4qJVNQ==
Date:   Fri, 8 Apr 2022 15:31:52 +0000
Message-ID: <DB6PR08MB2646980562ADC78EA613E8A694E99@DB6PR08MB2646.eurprd08.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: =?utf-8?B?TVNJUF9MYWJlbF81YmM3ZTJkMC0yNjNjLTQxMjQtOTM3Ny0yOGFjMzg5ZjE0?=
 =?utf-8?B?ZTJfQWN0aW9uSWQ9OGE3NDJmMTgtYjUyOC00NjFiLWI0NzAtZDgxMjhlOWI1?=
 =?utf-8?B?MTBkO01TSVBfTGFiZWxfNWJjN2UyZDAtMjYzYy00MTI0LTkzNzctMjhhYzM4?=
 =?utf-8?B?OWYxNGUyX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF81YmM3ZTJkMC0yNjNj?=
 =?utf-8?B?LTQxMjQtOTM3Ny0yOGFjMzg5ZjE0ZTJfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfNWJjN2UyZDAtMjYzYy00MTI0LTkzNzctMjhhYzM4OWYxNGUyX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsXzViYzdlMmQwLTI2M2MtNDEyNC05Mzc3?=
 =?utf-8?B?LTI4YWMzODlmMTRlMl9OYW1lPe+/g+++lmZmZW50bGljaCBBUkVTO01TSVBf?=
 =?utf-8?B?TGFiZWxfNWJjN2UyZDAtMjYzYy00MTI0LTkzNzctMjhhYzM4OWYxNGUyX1Nl?=
 =?utf-8?B?dERhdGU9MjAyMi0wNC0wOFQxNTozMDoyMVo7TVNJUF9MYWJlbF81YmM3ZTJk?=
 =?utf-8?B?MC0yNjNjLTQxMjQtOTM3Ny0yOGFjMzg5ZjE0ZTJfU2l0ZUlkPThiMjI0ZDUw?=
 =?utf-8?Q?-9cc7-4136-98b5-6c830cfdb422;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ares-ci.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7495a9f-16e2-4484-8afb-08da1974e7ca
x-ms-traffictypediagnostic: VI1PR08MB2688:EE_
x-microsoft-antispam-prvs: <VI1PR08MB2688870EC55943D57CA029EC94E99@VI1PR08MB2688.eurprd08.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UoVkd9w+Zxj7T3rh/DxHVKmG8h/Qfd9seALhCRmty8Kj9C5EG+xd4u7AIshyekPsonbo+p2z2NwVcO4m4tFqOY0dffae16b7YF6Y2qE5O4TAZseaUEOmpXiz+P/ot7UaLG4QRRgIkirelRFG8VdCP/Ztr0NSLQI+cbf9+jEh2sjNLul0JUea6UE3jyI8zAW5ob9u0DpiolCLiBOtc+tXLLTaYELcKKEfX0BA7byDPXbqSjLlfgBfWLe2WKxlOO1qHucxpzJRwFY1DkSNKVzy2b0A9RNnwFsoYQTXn6pHcD1l7tRk8Pw+b6LfEkw5Y+QDZFIVPNQQ1VYyqwDXR++VhEbdHr9cBaAr4tgLBuNUnCaQNlwrX38Y0QFOb05apeFhrhFHDhcJ1jXhoFGp/odvVNLH9+v3qiSonQp76V4ODlvN5M1ig1DXAsVtygI7P5OIZ8heAO3BP6X+FOsMdPiA8eZBRozr8nnlm9qVaCvw6ieSXsF4Ev+WWwr6IDVuzVW+39Vd3ZKikIIVChbEQ4OKf9zYyYIkJod7sdvU2Wtr6Jeknc/QVG+vlxrKjS2QSJrB+yUPdm1/Ms8Va3FQXmFa72WS0moSnXfZXpRFYr690InqZ7CCHQkdLSEMtrwvIEEFucgaBPgQoegHx8QourUP2WGge2f2AbCzv9cjFwa+6o/j9VQmbe4qdmHY1EbNObA0uKLR6VAehj5TDcSqf3CkhphWWiENdQtgZDylGCmoR06Ls9DKbV5RWIT/N6tai48ZFWOppt8FOUtGJ9Hd0o+tGahacKvaFSUZTvHpCQsUChI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR08MB2646.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(396003)(136003)(376002)(366004)(346002)(39830400003)(71200400001)(66476007)(66556008)(52536014)(186003)(8936002)(66946007)(76116006)(38070700005)(33656002)(83380400001)(966005)(508600001)(38100700002)(9686003)(86362001)(6916009)(7696005)(6506007)(122000001)(5660300002)(316002)(64756008)(8676002)(66446008)(55016003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tzk3cEd6d0VQOUFvZDZqRm9qQmtOQ2ZQVFNtaTdsRFA4emo4bTR2VjQzdVUw?=
 =?utf-8?B?VmlaTXlUOUpuUnBqd0U4QTYwRTJuVklhWWREbWlydUUzQm5FWm9tdHQ5Nmd5?=
 =?utf-8?B?K3l2a2xQN0tFT2R4NGJIVXhxRzl3SjU0a0JpRHR0RlUzaHJlSUJWeGk4TnFh?=
 =?utf-8?B?cDBXYjRUVWJjTVFERHhjbFJURWY5MjJJa3hsZzlLZUcybDZLWVhsd2VSczJT?=
 =?utf-8?B?dUlGU3dwYkNFanN6cktsRktGMUNDK2UrL1B1L3BTMzVVSzVLRDV5SzZFU1Zt?=
 =?utf-8?B?VVpzUUlZY01NNDNhY2hLanBqb1lVQVRMZzdXOVIwcnhCNjJRWXJNSngwbTdp?=
 =?utf-8?B?Y3BwZTZ1WDh2bzdiRnpuVU94bFRJbjJ6ZWpUQjdaRVdCS3dGSDkvczB4bXNV?=
 =?utf-8?B?V0FNUzB0TWRuVmIzbmhhaldMSjYzU0Z2cWE2Nmk0eWJrWFpEUzZVSkNhdytU?=
 =?utf-8?B?N0pPcDFMVnRUUjhEU1g5R01vMFNrSStjNHFxcXpGMktEV0Rvai9IT3dWNnJT?=
 =?utf-8?B?bnUyOXV3R0ZtQXVSQnVnWEIxc1d0SUhmUmppOE5YYlBVSmZQdTQvOFpjZHJT?=
 =?utf-8?B?K1lHRm1ZYkdmbm10dEE2TUpXY3VRbVg0Q25oblJORUxzdUphd2RXaDFneGQy?=
 =?utf-8?B?UXR6azBrNFVHL1hYTmNhY0tsZE5yeWpMcjRQclJxcDg4dTgwMW8yRDRKVnQ5?=
 =?utf-8?B?SUNJaUU0dXV3T3Z4RlZtSFNUdDIwRHVIVE5STzJyZUMvemcyNzFtSDZaTG5Z?=
 =?utf-8?B?K0M0enBkWnh5bTBvcklWS3hyWjkwYkJPZVg3d2NUZmhrRWxGZnptZGwyditN?=
 =?utf-8?B?VDNGVHZzNVpZYUlGbXZoY1R3ZnoxL1QvL0NXUUpWb0ViMTgxQ1JWQ0p4QWRT?=
 =?utf-8?B?Y0k1SThkQVY2WjR2NStydlJMazFUYkdFRGNUOXppWEl5UW43ZE9FREFmMEVQ?=
 =?utf-8?B?aXR5bzhCb2xkYVpEZDczcWhqRmprQk50Qmw3NmMyOER4NFBiNFJULzI4MGtr?=
 =?utf-8?B?NXdSOUd1QkV3NzFmRzVHVDlmdEhVV2Y2Nnh5RlFraVI3QVJQUFZmRFFLT29L?=
 =?utf-8?B?b0xrMDdmczJ6am1wTGRlbVJ4SEJhcTNxMi9zLzFkdFJudWlsdHNVWVE4ZFFO?=
 =?utf-8?B?TGh6cnM0YXdhdWUwRmt6SEk3SDlvMm5NZ2lGMmgyUHpRZTE3Qm9wWmo2V3Nw?=
 =?utf-8?B?dmNzU3V4SlRvaUxGZHFXWVVYM2NuR3lPTGJSYUtBTHBFL1BlQ1V6bUxpMExX?=
 =?utf-8?B?dXlHcTBXMEtVaUoxTzBZdklnWlVLZXhKd3VPOHdYOHZYQUwwUFNYRUlXMi9K?=
 =?utf-8?B?ZUlOOXBrcWY0WndPYUZJbGNaaUNQKzhVSlhSekJ3VGtpT2dUekdxUGREQlNE?=
 =?utf-8?B?VUc0VkZLd3NUWlI5RWp3N0xYZ0lhUmd2V2tNSDFsbEpyRExCT0pwYi9CM1RF?=
 =?utf-8?B?SWNTb1BkcG5majIvNzJqS2FSVkdybmRtREMzcEk3Ump3c0p0ck1MZmxJOXcw?=
 =?utf-8?B?aDhLN0pOd3cwb2hIOFRYWEtuemZBL3Z6RDNMME5Qa08wME1ZZ1dwNlBXQ0Js?=
 =?utf-8?B?MGZuMGwzMllXRFg4RENWaE1wb2h0eVRpamdGSDRRR0w2SGlBSHdYWHZscVFx?=
 =?utf-8?B?aUs2VGtmQ1N3blhLb2xYWjlKNlg4dlpzdHJkQ3FOb3VoOWlFNWZFWVlNU2ZY?=
 =?utf-8?B?KzVUQmh3K2pXUnpSYitXTkd6emUwa1Z6Ym0wQ1JDeU8zcEt0M2pDLzIvRHZB?=
 =?utf-8?B?R3J5eXFsOUNDd0R3Y1Eyakl6dGRMZTRNelN2K2lxbFpMS3Bld1hnMHRYckhn?=
 =?utf-8?B?OEFZek9VcVBnNUc4c2VOc0t5aVV3a0tIcUhPR2JLLzZwWFZaQXlaV1JGYmVU?=
 =?utf-8?B?NGZ6ZnZhQzlpcjB6a1NESXo1d1FpMUdBZXh3b2J6K0RJR01SSU04aXpFcUNi?=
 =?utf-8?B?Uk03aXFPUTZmNVR0NzBDbzVYUEFteFRUVjlsZWF1UnFQQ1NNSWgvemRCTTQ3?=
 =?utf-8?B?Z2VGbyt0YmtRRjdYWG16bFBVYjh6VmpZRTRSZjNwWU9xSWx4cGdUTEZJS3RW?=
 =?utf-8?B?MEcybS9JeWRpQno5d3I0M08ydW42VWZrdjErak9wdkZ1RGl5VCtQMlZYUHly?=
 =?utf-8?B?L0E1eWE3K3N1TEhsM1NFQktmK01FZk1FRWd1b1pJZTQyUTlRdStlSm5xa1R2?=
 =?utf-8?B?dVA2VkdobnBOcC90dEVnQ2lIUlNsajFYcVN6cTYxZCs3S1RHdXNZUlZaM0xE?=
 =?utf-8?B?MlY3bnVXQ1BSaU9aOXp6Q1VEMFRNZGRGdFhva2E2Uk4zRUhUN2hTSit1aUpn?=
 =?utf-8?B?THppMlRNTDJGOHhXKzJmR1lSZko3RDg0aXo4V0NPNkx0aGd2VDcyVWtiK2JT?=
 =?utf-8?Q?Yi/o7eri3vzhuTDsEeiAWAgf5vfzQ+WV+6P+7?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ares-ci.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR08MB2646.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7495a9f-16e2-4484-8afb-08da1974e7ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 15:31:52.1276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b224d50-9cc7-4136-98b5-6c830cfdb422
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VHEa9d/cbTLIVVU5jihsMMSDVLMmz0nt92ggr9XMDz+K8sRkTUzADsK2jc6rXCyy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2688
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgDQoNCkkganVzdCB3YW50ZWQgdG8gdXNlIGEgVVNCL3NlcmlhbCBUVEwgQ29udmVydGVyIHRo
YXQgaXMgdXNpbmcgdGhlICBQcm9saWZpYyBQTDIzMDNHUyBDaGlwc2V0IG9uIEthbGkgTGludXgg
MjAyMi4xLXZpcnR1YWxib3gtYW1kNjQuDQpUaGUgZGV2aWNlIGlzIGEgd2F2ZXNoYXJlIFBMMjMw
MyBVU0IgVUFSVCBCb2FyZCAoVHlwZSBDKQ0KKHNlZSBoZXJlOiBodHRwczovL3d3dy53YXZlc2hh
cmUuY29tL3BsMjMwMy11c2ItdWFydC1ib2FyZC10eXBlLWMuaHRtICkNCg0KVW5hbWUgLWEgc2hv
d3MNCkxpbnV4IGthbGkgNS4xNS4wLWthbGkzLWFtZDY0ICMxIFNNUCBEZWJpYW4gNS4xNS4xNS0y
a2FsaTEgKDIwMjItMDEtMzEpIHg4Nl82NCBHTlUvTGludXgNCg0KSXQgZG9lcyBub3Qgc2VlbSB0
byB3b3JrIC8gYmUgcmVjb2duaXplZCBhbmQgdGh1cyB1c2VhYmxlIHVuZGVyIGxpbnV4IGFuZCB0
aGlzIGlzIHdoYXQgSSBnZXQgdXNpbmcgZG1lc2cgYWZ0ZXIgcGx1Z2dpbmcgaW4gdGhlIGRldmlj
ZSBhbmQgY29ubmVjdGluZyBpdCB0byBteSBWaXJ0dWFsYm94IGFuZCB0aHVzIEkgYW0gc2VuZGlu
ZyB0aGlzIG1lc3NhZ2UgYXMgaW5zdHJ1Y3RlZCDwn5iKDQooSSBhbSB1c2luZyBWaXJ0dWFsYm94
IFZlcnNpb24gNi4xLjMyIHIxNDkyOTAgKFF0NS42LjIpICB3aXRoIFVTQiAyLjAgKE9IQ0krRUhD
SSkgZW5hYmxlZCApDQoNClsgODc4NC4wNDE5MDVdIHVzYiAyLTI6IFVTQiBkaXNjb25uZWN0LCBk
ZXZpY2UgbnVtYmVyIDUNClsxMDA1NS40ODk1MzZdIHVzYiAyLTI6IG5ldyBmdWxsLXNwZWVkIFVT
QiBkZXZpY2UgbnVtYmVyIDYgdXNpbmcgb2hjaS1wY2kNClsxMDA1Ni4wNDgzMDddIHVzYiAyLTI6
IE5ldyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZlbmRvcj0wNjdiLCBpZFByb2R1Y3Q9MjNmMywgYmNk
RGV2aWNlPSA2LjA1DQpbMTAwNTYuMDQ4MzM0XSB1c2IgMi0yOiBOZXcgVVNCIGRldmljZSBzdHJp
bmdzOiBNZnI9MSwgUHJvZHVjdD0yLCBTZXJpYWxOdW1iZXI9Mw0KWzEwMDU2LjA0ODM3Nl0gdXNi
IDItMjogUHJvZHVjdDogVVNCLVNlcmlhbCBDb250cm9sbGVyIA0KWzEwMDU2LjA0ODM3OF0gdXNi
IDItMjogTWFudWZhY3R1cmVyOiBQcm9saWZpYyBUZWNobm9sb2d5IEluYy4gDQpbMTAwNTYuMDQ4
Mzc5XSB1c2IgMi0yOiBTZXJpYWxOdW1iZXI6IERMQVVqMTlCNjE2DQpbMTAwNTYuMDg0NzcwXSB1
c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRlcmZhY2UgZHJpdmVyIHVzYnNlcmlhbF9nZW5lcmlj
DQpbMTAwNTYuMDg0Nzc3XSB1c2JzZXJpYWw6IFVTQiBTZXJpYWwgc3VwcG9ydCByZWdpc3RlcmVk
IGZvciBnZW5lcmljDQpbMTAwNTYuMDg4OTkwXSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRl
cmZhY2UgZHJpdmVyIHBsMjMwMw0KWzEwMDU2LjA4OTAwMV0gdXNic2VyaWFsOiBVU0IgU2VyaWFs
IHN1cHBvcnQgcmVnaXN0ZXJlZCBmb3IgcGwyMzAzDQpbMTAwNTYuMDg5MDE1XSBwbDIzMDMgMi0y
OjEuMDogcGwyMzAzIGNvbnZlcnRlciBkZXRlY3RlZA0KWzEwMDU2LjA4OTAyMF0gcGwyMzAzIDIt
MjoxLjA6IHVua25vd24gZGV2aWNlIHR5cGUsIHBsZWFzZSByZXBvcnQgdG8gbGludXgtdXNiQHZn
ZXIua2VybmVsLm9yZw0KDQpCZXN0IHJlZ2FyZHMgZnJvbSBBdXN0cmlhDQoNCkZsb3JpYW4gRWlj
aGVsYmVyZ2VyDQo=
