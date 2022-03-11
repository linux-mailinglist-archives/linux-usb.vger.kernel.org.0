Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 651D84D613F
	for <lists+linux-usb@lfdr.de>; Fri, 11 Mar 2022 13:09:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236074AbiCKMKu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Mar 2022 07:10:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238418AbiCKMKt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Mar 2022 07:10:49 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2126.outbound.protection.outlook.com [40.107.93.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91483107809;
        Fri, 11 Mar 2022 04:09:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HOH+nIYY/2oSsH3JQEIN1sIa5tg9nYHmAGLkxST0LboP8eBx0nw9QiPXMGy3SzFfiRtiY06UEjh/prKC6xcOgXpi7yQ8L41cOSGNj4WoQYnQApZozXGCbYOBuFIcZ4zYdP7ClEb3I8wKzwHapS58PWsQ6lRAulPAzB+sNhPJAX4N74x316CXy0hE9RC+WWudUPGG6TYAJJcM/QZYl+BeM6Q/TuCDaOdjLbUK1Ku2AtFteL2mHGHOCaU/n0ShuZxfGQKZq2CXNBg5xm+CkRvnIeFWAUEJpG5AXY5oS8y0dtHBVBpy0sLTeM4cRj5RxsorHHhsaTCqv/ULFi+woKWpSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHdGkGwbmbPIM8FnAdD3nbyN0G7Y9DNjX50rrXmiBwI=;
 b=f1OdNwGDFZri6uVSP0WNgDuTkdfMMVZGJKWe+Y/WI2Ts6Z344Sek1fyw5sSx1vdI0V1O3x5qKpmSyobfAvV7jZoaOOaiHSNmmv4AAkk0o7EZJPxh5CuYf9Jg1kJx3g5ebC5Mq6z/pd5aKKzf+XOC3+S1nRbDzsQTmFZWRwNWy7hojHNutHj4nYw9BZf6euJ6tRgS/nqxzMTbnhvX8gzDPzmpNAzDXu7abUo8FV7fY3NFzxuDtK0DNsIL4vlSglC91HCNjsZcTuzXYBxBbe5qoeXQWnMLd5VEvRE4+TyBUkLbcEB8SuFB9aJ/OJZjjDdj+2KOCPyI2JiJjBgCtzA4Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dentsplysirona.com; dmarc=pass action=none
 header.from=dentsplysirona.com; dkim=pass header.d=dentsplysirona.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dentsplysirona.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHdGkGwbmbPIM8FnAdD3nbyN0G7Y9DNjX50rrXmiBwI=;
 b=UapXs9SKl2eDyYuGsAn/LffDpAR669mlCpEzz4ixxbVNtBMrTEanoUWbbeIF8WFRNRaVxhh1UnQYu7NTD43m6sZEXI9B0g/Ul9z3WPCrz3oYOquCqkcOWqlmbw9TVinInJUNb40h2tL/4+Gch5fWmR3fn7tMLebuMW+0eHhpk1c=
Received: from PH0PR17MB4848.namprd17.prod.outlook.com (2603:10b6:510:8d::12)
 by DM6PR17MB3532.namprd17.prod.outlook.com (2603:10b6:5:1db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 12:09:42 +0000
Received: from PH0PR17MB4848.namprd17.prod.outlook.com
 ([fe80::6860:7a7f:9314:1f3c]) by PH0PR17MB4848.namprd17.prod.outlook.com
 ([fe80::6860:7a7f:9314:1f3c%5]) with mapi id 15.20.5038.027; Fri, 11 Mar 2022
 12:09:42 +0000
From:   "Neumann, Bastian" <Bastian.Neumann@dentsplysirona.com>
To:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Richard Leitner <richard.leitner@skidata.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [PATCH 2/2] dt-bindings: usb: USB2512x boost value for up- and
 downstream ports
Thread-Topic: [PATCH 2/2] dt-bindings: usb: USB2512x boost value for up- and
 downstream ports
Thread-Index: Adg1QLZBqIghzPOES/23Zge133fbUw==
Date:   Fri, 11 Mar 2022 12:09:42 +0000
Message-ID: <PH0PR17MB48481AC6D6B808D2C106C4AA8E0C9@PH0PR17MB4848.namprd17.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dentsplysirona.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b0fcca0-af3f-4cbc-2ee2-08da0358065a
x-ms-traffictypediagnostic: DM6PR17MB3532:EE_
x-microsoft-antispam-prvs: <DM6PR17MB353265A6BED6F68DF955050B8E0C9@DM6PR17MB3532.namprd17.prod.outlook.com>
x-disclaimer: Applied
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1tqWl0QzmuTJcTDUPm6KexUN/SjkvmLIJqA4nj7z7o1hbJ+SAwuIBdtqNNOLBEDFrUgfCEJ2xbp06lcXY6ZepPP6XT9q3m7hg6aHJ8Ruq64piXhic0+whjbw96hN/xW3LX/tSsKC4lTyJ20KuI7yTmPt/mh6ewcccCiiKa1FW0WzeCdNECyKyj9ay9FLbX4PqzfS1aPbgUfsCWeO50tP2NdrfXIUNBe+XkUTI+3UkfdUzjpoKKCmsN6s0S7Dx4NKBpzBVy32J9qwZ2P6FB87tjU92sLvKvasQrPkWCY8bGKq3zpjN+79tGXlapECqz0LQPkblrgM0klJuSL0/E0U2KWfRBp3zaqoYSMhecD2sA3TBVGm++maBHeMlT9Mp3kHzXRy+GHksbnbHSNrLfxFLdpg9IzsCFKX9YdkKhd+D2hZifZwnWpNQpKcJEtfWR6ARhEjh8tA/4pd4/mP5dzxV4UV3FnAlTBsYQiUUuadcFVke3IXrBsukQ+T3HV2gUtLnJHhZnPkKc8hCMf+3KsYpumxYEbiGAypm1MjqQ17g+adDbJn7jyAHAIhqGhO3Fjey2jyNuBG9rA8hA+F0YkEmK65XP33Xk8M4qY0kvRtvRvnsUf4sdiWVq0CjG3C16lBuCA/+BDcWbVxYZxqEpm1w6fr8S0NXM38sefb9QMadDaSYzXzKFV0Htu/xagGyDkZQndHjUHoRCxTiDoErsetqA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR17MB4848.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(508600001)(38070700005)(76116006)(71200400001)(66556008)(66476007)(66446008)(86362001)(8676002)(4326008)(54906003)(6916009)(316002)(66574015)(64756008)(26005)(186003)(9686003)(6506007)(122000001)(38100700002)(7696005)(2906002)(33656002)(8936002)(55016003)(5660300002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVVCMlhoY01qK2d0UnVLWWhGMVp0WG5PeG9rNmUyb01KMFNDaFh0V21vekgx?=
 =?utf-8?B?TzR0ck9xS2czRDBGdTdlVDF0TTNQQTlhenZzemhRb2svaEVjWFZLcGYzOGJa?=
 =?utf-8?B?MHZRbWNxa25pcW9vVy9Nd3g5aHk5WkY5cXBMak9Kc09FYnFvWmFsN05odXhW?=
 =?utf-8?B?SnFoWE9HNUU2a1lCazJqUS9MK1l0Q0oyQndBMVlWRXNneVJ5eHlQTFk5SHd0?=
 =?utf-8?B?djF2UERMZVFwT0YzdnovOWxHVTlGOFBVWVZ0MzRLWHl1Q0wyc0tjQWNyQ0Vt?=
 =?utf-8?B?MDcrS0xpVTcxNWtsN0t0M2hqbUM1MFlpUXFTQmJJOG1sZHBmZndxR1Zsd2pW?=
 =?utf-8?B?bVRKTWlYZ1MwOXdCNVVub2tUcHRVQ29iU25OU1hwOEZWMWQvWXBXUHBRdXgr?=
 =?utf-8?B?R2k0ZzN1MUlCaFhVdVFlS3ZpRFlhK21BNnRTdTdIVWhPQXdleE9NNTE4azls?=
 =?utf-8?B?M3hsTnIxcmpyc0d5bjZmcUhIcHBuclRZdHRObm9ISFNBVm95YW1FRkFaRDVM?=
 =?utf-8?B?WS8yMENPbzlSdWJaa2FqZ1k3aVlyUCs2SWZZclEzSUlpNDB1RFRGcmFVYXBQ?=
 =?utf-8?B?TjRybEd1bHZubmpTTzN6WDB1UHMraFFRanVLdEQyNzR2YkNCanJqTXNOZy8w?=
 =?utf-8?B?c3lDeFhLa0ZWT1BNalArTkZ1K1RpbERDMmZtV2s2dWFrZXg3UkY3bklzOFc0?=
 =?utf-8?B?RUU2WWVObTVzamlHMmhEdWZ3RERybFFabk1KOVNac2h3UkljekxsTUYxK2lU?=
 =?utf-8?B?RUd1Qmg5QmRaYlhPTlk1bFY1RzAxb09OeXkvc0VzeElrYVRYUTdiVEpUcEVr?=
 =?utf-8?B?c2V6bGdBV1JhWDNjcG9PVUZFMHo0dHBES2dDUjZITU1NZUtHVGZmWDZVVmJu?=
 =?utf-8?B?RlkraGl3VGc0c0RBK2dQU3BxeElGL1RFcDhUNVp5SmNmMUoxTmdOdnBCdWZu?=
 =?utf-8?B?S3ZrSmgrc094TlF5dmJDb3o4dGdoMS9XRzhsY3JrUUZ1R2lHWkZTWm1UVnVn?=
 =?utf-8?B?ZUs0SndmSnU5TnliY29Xc096VEZCVEQ5SzVBUldTU1JMeDZuZHd4KzFyd3Na?=
 =?utf-8?B?Z1pTbnJaVm5NcVRXU0hjSk1MOERLNDhyMXl2WXFOS3NYN001bWdseFY5Z0I0?=
 =?utf-8?B?ZEV0TEdFdURNU20yR0xMQjFnR1FHODludzB2YTBsN0JvUnY3dVVZQjJZS3I1?=
 =?utf-8?B?aFFVM3hncUZNSDRhRmZyZzIzZW4zMXBWMVJQaWs5QWpCWkRzOE1kT2NpOHds?=
 =?utf-8?B?bUxEeDJDWEZBM1lpV1puSU9TcVBhVThQd09rVTMxcFZxRllWNW0vdm1SMjlB?=
 =?utf-8?B?eEpITDhJdnFKeXNJbCtaRWpmZTViNzF1amtLUVYzVUpubTQ3eVF5MFRKcGho?=
 =?utf-8?B?eVpKRm51WVNlRWlNWUhSYXI4bm05c1kxelpOam9nT0JyQStRcFZ1dHpUdDhq?=
 =?utf-8?B?UFdoTC9Udjh3SG04NG5VdHJBRVNINStuOWhMNEx3Wk5jMEd0bTdibytSYnQw?=
 =?utf-8?B?Njdsa3ZpYUZnVUwrKzVLcHdWSyt6enViK2trYVQzS3FFYjFMcmNyN2s4ek9O?=
 =?utf-8?B?SnRUMWpQOGhSQkRZUFUwdWpsRWxqRkVXbm4xRTlOS00yNWJwb3MyT3U0ODQ0?=
 =?utf-8?B?bnlCTUN4S0ZqWUVoYjYrN0ZDZlBNZmNiTTNQU080OUlVQjZOclpJREh0dDF6?=
 =?utf-8?B?TWF3N05OdWxNOHBXV0NZSHBHNmxOaHhhMytsamdHT1VRK0pOdXF5QXRRRlFr?=
 =?utf-8?B?di9BUzVrWU1qWGJEQ3hYUi8rY05rU25xdXRTVDZRbmJxUkEvMWh0SzNrSjJM?=
 =?utf-8?B?ZkVYYVlrR25zQlNxUUg1S1NLYmxveWFTeGtwZVFWN1FUaGhVMVArR0RWL2NH?=
 =?utf-8?B?aEk5Yy9RZTM3NHZpOXJyK044OE54U0hyM002RVJlelRkaThrbCtOU1VPN3du?=
 =?utf-8?B?eGFnMWg1NkIyZGMvVFRlWWs0TWpEZTRtMXJad2loTnJsaDRaZ2F4bWpEbCtX?=
 =?utf-8?Q?PGhxFfVkl9HRu7JqYiplvYa4t9952Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: dentsplysirona.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR17MB4848.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b0fcca0-af3f-4cbc-2ee2-08da0358065a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2022 12:09:42.3675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bc74e59c-5fa3-4157-9c37-6e5063d11a62
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YvyygDvY381g2QagntqQ/DlWY48WuxIuSZ69Q6hAoQkre79uCGPczbJYqCeTUF3/XxaEKkft3mVAHV82xeErCEbC5K+yv5BBbiH16ZM7aZKY9CpBCF35FBSWr6cznw2/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR17MB3532
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

VGhpcyBwYXRjaCBhZGRzIGRldmljZXRyZWUgZG9jdW1lbnRhdGlvbiBmb3Igc2lnbmFsIGJvb3N0
aW5nIHByb3BlcnRpZXMuDQoNClNpZ25lZC1vZmYtYnk6IEJhc3RpYW4gTmV1bWFubiA8YmFzdGlh
bi5uZXVtYW5uQGRlbnRzcGx5c2lyb25hLmNvbT4NCi0tLQ0KIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3VzYi91c2IyNTF4Yi50eHQgICAgICB8IDIyICsrKysrKysrKysrKysrKysrKysNCiAxIGZp
bGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi91c2IyNTF4Yi50eHQgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdXNiL3VzYjI1MXhiLnR4dA0KaW5kZXggMWE5MzRlYWIxNzVlLi41
MzhhZTQ5ZmMzMWQgMTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvdXNiL3VzYjI1MXhiLnR4dA0KKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3VzYi91c2IyNTF4Yi50eHQNCkBAIC02OCw2ICs2OCwyNiBAQCBPcHRpb25hbCBwcm9wZXJ0
aWVzIDoNCiAgLSBzd2FwLWR4LWxhbmVzIDogU3BlY2lmaWVzIHRoZSBwb3J0cyB3aGljaCB3aWxs
IHN3YXAgdGhlIGRpZmZlcmVudGlhbC1wYWlyDQogICAgICAgIChEKy9ELSksIGRlZmF1bHQgaXMg
bm90LXN3YXBwZWQuDQoNCitFbGVjdHJpY2FsIHNpZ25hbCBib29zdGluZw0KK1RoZSBjb250cm9s
bGVyIHN1cHBsaWVzIGEgImJvb3N0aW5nIiBmdW5jdGlvbmFsaXR5IHRvIGRyaXZlIHVwIHRoZSBV
U0INCitlbGVjdHJpY2FsIHNpZ25hbHMuIFRoaXMgY291bGQgcmVzdWx0IGluIG5vbi1VU0IgY29t
cGxpYW50IHBhcmFtZXRlcnMNCisob25lIGV4YW1wbGUgd291bGQgYmUgSi9LIGxldmVsIHRlc3Qp
LiBUaGlzIHNob3VsZCBiZSA8MHgwMD4gdW5sZXNzIHNwZWNpZmljDQoraW1wbGVtZW50YXRpb24g
aXNzdWVzIHJlcXVpZXcgYWRkaXRpb25hbCBzaWduYWwgYm9vc3RpbmcgdG8gY29ycmVjdCBmb3Ig
ZGVyYWRlZA0KK1VTQiBzaWduYWxpbmcgbGV2ZWxzOg0KKyAtIDwweDAwPiA6IE5vcm1hbCBlbGVj
dHJpY2FsIGRyaXZlIHN0cmVuZ3RoIChubyBib29zdCkNCisgLSA8MHgwMT4gOiBFbGV2YXRlZCBk
cml2ZSBzdHJlbmd0aCBsb3cgKH40JSBib29zdCkNCisgLSA8MHgwMj4gOiBFbGV2YXRlZCBkcml2
ZSBzdHJlbmd0aCBtZWRpdW0gKH44JSBib29zdCkNCisgLSA8MHgwMz4gOiBFbGV2YXRlZCBkcml2
ZSBzdHJlbmd0aCBoaWdoICh+MTIlIGJvb3N0KQ0KKw0KKyAtIGJvb3N0LXVwIDogVVNCIGVsZWN0
cmljYWwgc2lnbmFsaW5nIGRyaXZlIHN0cmVuZ3RoIGJvb3N0IGZvciB1cHN0cmVhbSBwb3J0Lg0K
KyAtIGJvb3N0LTEgOiAgVVNCIGVsZWN0cmljYWwgc2lnbmFsaW5nIGRyaXZlIHN0cmVuZ3RoIGJv
b3N0IGZvciBwb3J0IDEuDQorIC0gYm9vc3QtMiA6ICBVU0IgZWxlY3RyaWNhbCBzaWduYWxpbmcg
ZHJpdmUgc3RyZW5ndGggYm9vc3QgZm9yIHBvcnQgMi4NCisgLSBib29zdC0zIDogIFVTQiBlbGVj
dHJpY2FsIHNpZ25hbGluZyBkcml2ZSBzdHJlbmd0aCBib29zdCBmb3IgcG9ydCAzLg0KKyAtIGJv
b3N0LTQgOiAgVVNCIGVsZWN0cmljYWwgc2lnbmFsaW5nIGRyaXZlIHN0cmVuZ3RoIGJvb3N0IGZv
ciBwb3J0IDQuDQorIC0gYm9vc3QtNSA6ICBVU0IgZWxlY3RyaWNhbCBzaWduYWxpbmcgZHJpdmUg
c3RyZW5ndGggYm9vc3QgZm9yIHBvcnQgNS4NCisgLSBib29zdC02IDogIFVTQiBlbGVjdHJpY2Fs
IHNpZ25hbGluZyBkcml2ZSBzdHJlbmd0aCBib29zdCBmb3IgcG9ydCA2Lg0KKyAtIGJvb3N0LTcg
OiAgVVNCIGVsZWN0cmljYWwgc2lnbmFsaW5nIGRyaXZlIHN0cmVuZ3RoIGJvb3N0IGZvciBwb3J0
IDcuDQorDQogRXhhbXBsZXM6DQogICAgICAgIHVzYjI1MTJiQDJjIHsNCiAgICAgICAgICAgICAg
ICBjb21wYXRpYmxlID0gIm1pY3JvY2hpcCx1c2IyNTEyYiI7DQpAQCAtODYsNCArMTA2LDYgQEAg
RXhhbXBsZXM6DQogICAgICAgICAgICAgICAgc2VyaWFsID0gIjEyMzQ1Njc4OTBBIjsNCiAgICAg
ICAgICAgICAgICAvKiBjb3JyZWN0IG1pc3BsYWNlZCB1c2IgY29ubmVjdG9ycyBvbiBwb3J0IDEs
MiAqLw0KICAgICAgICAgICAgICAgIHN3YXAtZHgtbGFuZXMgPSA8MSAyPjsNCisgICAgICAgICAg
ICAgICBib29zdC11cCA9IDwweDAwPjsgLyogbm8gYm9vc3QgZm9yIHVwc3RyZWFtIHBvcnQgKi8N
CisgICAgICAgICAgICAgICBib29zdC0xID0gPDB4MDI+OyAvKiBtZWRpdW0gYm9vc3Qgb24gcG9y
dCAxICovDQogICAgICAgIH07DQotLQ0KMi4zMC4yDQoNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NClNpcm9uYSBEZW50YWwgU3lzdGVtcyBHbWJI
DQpTaXR6IGRlciBHZXNlbGxzY2hhZnQgLyByZWdpc3RlcmVkIGFkZHJlc3M6IEZhYnJpa3N0cmHD
n2UgMzEsIDY0NjI1IEJlbnNoZWltDQpSZWdpc3RlcmdlcmljaHQgLyBjb3VydCBvZiByZWdpc3Ry
eTogQW10c2dlcmljaHQgRGFybXN0YWR0LCBIUkIgMjQ5NDgNCkdlc2Now6RmdHNmw7xocmVyIC8g
TWFuYWdpbmcgRGlyZWN0b3I6IERyLiBDb3JkIFN0w6RobGVyLCBKYW4gU2llZmVydCwgUmFpbmVy
IFJhc2Noa2UNCkF1ZnNpY2h0c3JhdHN2b3JzaXR6ZW5kZXIgLyBDaGFpcm1hbiBvZiB0aGUgU3Vw
ZXJ2aXNvcnkgQm9hcmQ6IERyLiBBbGV4YW5kZXIgVm9lbGNrZXINCg0KLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg0KDQpEaWVzZSBFLU1haWwgaXN0
IGF1c3NjaGxpZXNzbGljaCBmdWVyIGRlbiBhbmdlc3Byb2NoZW5lbiBBZHJlc3NhdGVuDQpiZXN0
aW1tdCB1bmQga2FubiB2ZXJ0cmF1bGljaGUgSW5mb3JtYXRpb25lbiBiZWluaGFsdGVuLg0KLS0N
ClRoaXMgZS1tYWlsIGlzIGludGVuZGVkIG9ubHkgZm9yIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVu
dChzKS4gSXQgbWF5DQpjb250YWluIGNvbmZpZGVudGlhbCBvciBwcm9wcmlldGFyeSBpbmZvcm1h
dGlvbi4NCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQ0K
