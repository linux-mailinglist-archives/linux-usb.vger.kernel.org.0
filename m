Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3D920E026
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jun 2020 23:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732181AbgF2UnQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Jun 2020 16:43:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730941AbgF2TOC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Jun 2020 15:14:02 -0400
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-am5eur02on0604.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe07::604])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1D7EC00695F
        for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2020 04:38:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGWDby71jHRN1S/TIP7U4HucwMcKR3oR8g2Tmjl7MSnllqj9t2enUWLWxEzMFbaw2IbiZ7qeK17drDMnKLPicZUI3MkFuxvj9d/HNVGDkiLGYqNrSxwSG7B+pNol54Rri/rZY5ocv6DEKAUGwzGP9DAFjofpfGveJnl1ZbS1rLlgOnrS0MUNUaiJk0iVk/j2xq2YLSoVlufuq0517VT5/eM0GpNaoqfwaywpl4u1urdphKO0IFFMm19JhNg9NrpcgrQkjCCl0GFObs23JSzWxQb/hzCRz1j56miaH+OShKKuZtdxn34z7YahwqFVWEtFxfnx7vjyW2AT9JbRUcYiyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=haSOOQvf1aDmSioJjzKabnVHzfTn7iT1FgRKBwTciWg=;
 b=gDU8zPc3fO3YJ+4t0xt5pCNGKR28c1lUIMNhMF5pKT8ZEa43NmfZv1RPNJxuEiEnsFtt2EFjgrxJosQS3GaE8STVDegiJ+C5T7FVwjsNenIuOiLZhnyCU5RsBddjQrieffd1gYRlTVhMjwsS7ocyKQm4UDnbQLrlccpPPtJMKasmPfdukGmLeVtjk4MY/yWCsuhkEmU71Fq9/uFotlORLJ7xAcuSZoXMEMbvp2VR6UQRM0yIGbVZMAChHLuKHJ7sJy9KlsFOgvpWAnEx9ClZG84obcuFJvvncoBThBplzhmOwAwJ2J7VGCwRpJweRSypno5b1KGsVPAZabSyCamDMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=haSOOQvf1aDmSioJjzKabnVHzfTn7iT1FgRKBwTciWg=;
 b=sAwfD0A5Rf01neyG5IU98uWZLlleiOZpqLfUeN/DDdfAh06BOCWEIjLINpZE4AKHbvyKddYqpTfD+0azeySaYrFN7ZPw1PuyGmUPFdMuSFWANJV3QE/cPFaQKbSw6R5WEKJ38WubDV5uCRzfG/eb9LQEKiaKx1jvqICX8h859dg=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5910.eurprd04.prod.outlook.com (2603:10a6:20b:af::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Mon, 29 Jun
 2020 11:37:58 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3131.027; Mon, 29 Jun 2020
 11:37:58 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "jocke@infinera.com" <joakim.tjernlund@infinera.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: "usb: gadget: core: sync interrupt before unbind the udc"
 question
Thread-Topic: "usb: gadget: core: sync interrupt before unbind the udc"
 question
Thread-Index: AQHWTfxUURogi5P0F06kOiJScuWkHajvdzDQ
Date:   Mon, 29 Jun 2020 11:37:58 +0000
Message-ID: <AM7PR04MB7157E127429188EFDF829EAC8B6E0@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <3cbe4bf7fd4a152e600ecb1b85b8a24ad5aacc55.camel@infinera.com>
In-Reply-To: <3cbe4bf7fd4a152e600ecb1b85b8a24ad5aacc55.camel@infinera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: infinera.com; dkim=none (message not signed)
 header.d=none;infinera.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [222.67.222.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 48be27da-6cd5-4dc3-2355-08d81c20df28
x-ms-traffictypediagnostic: AM6PR04MB5910:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <AM6PR04MB591053726DDA0AD4E2FA57098B6E0@AM6PR04MB5910.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:67;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S7gIB/6j+f9Am3RtBuLHOxVoJweZNW+cqPMpHWmKom9hyW9XDUTFdHvqCnJH3LLVXwWOUUvmtp6ry6ksanop/GQTjTMzBifQx4dmjMovcQ4nA66uTYDaZQ5aK4OMf07x+JoeK2VvOQpXbBeZv44yrU/RtxKPkgB4sX7bxeWBdjl6BfSvKm6b+IjsAYXtoM9iXGr1zXi3RAG4mxXw2bmw0EtTuKB2q0zl5omywp/dWHLWGW3NclCstPhorSMRvVw51IAlfqwurBjO5294OWLdWj+b4tJXFtq/EsLgFDN2m5tQrY917rHfymE9hAe9yMqXaZMoj7dFtfsdSDBdTDlsig3EPqZBHpnNx5YOr+ffm4lD/4IReNs1D6QDKivTDdqpQ/cLhFgW+ZBBfNgMabO5xvWt7k13Cn8lKXZ4eafYwSEddPGn/h2KpVAMGetxgxsO
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(26005)(2906002)(4326008)(316002)(52536014)(71200400001)(86362001)(4744005)(5660300002)(66946007)(45080400002)(66446008)(64756008)(66556008)(66476007)(9686003)(8936002)(8676002)(6916009)(478600001)(966005)(33656002)(44832011)(6506007)(76116006)(55016002)(186003)(7696005)(491001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 1EQTJmTpRMdlKU8KV321HbtQ3L9pNWsdAjYDsMUpVZ+IuPKkh//iuua6aYg37bhpEtH0xntfn/a42u3SO21HiTFK9E4fvCc6avOzfmkzosEv1n7ENVd8hwjkiL7r0dlIIDzTxPddT9c0R05RUDaGbPhuyKFnM8HFERwkGJEdXsbI7xvqzE1YJg240RaPk5yHKvYIWaphTpP+qQ+UP11Du0r59xW/OBH4Qye+lRHytyUbIQSAV/I5EpjahQgGS5h+WbAanQ+gi43xHuwpQjhVCCPDkSyYhPwpNRBL+n9ge8CdikrKlLKSwQ/aBYPhjOoWiwfSQPDJubUFf592/IEGgedII5DCewholGaKmPoADv2QhZFv4GTqaE5DO6tgfosKjBQbgjdEY5bukQ7B+0NtT+yISCS90CZI4pLWSWOSVT8ml8uyybuR0mNWjkTTXVlOj7p7KMD1rO83kKfnAzIwDbfiMhV41SSIq7BFkJJdRl30yVZDcQ63c5essizlh29j
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48be27da-6cd5-4dc3-2355-08d81c20df28
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 11:37:58.1082
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XjNY5TyAC86WB8HOdavrzTz/k/RoewpxjyigQvlN1i86mBH6mGolXvmmhBtSvHehgWDI5roiTAf0YBR58pzWtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5910
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiANCj4gSW4NCj4gaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29r
LmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0Lmtlcm5lbC5vcmcNCj4gJTJGcHViJTJGc2NtJTJG
bGludXglMkZrZXJuZWwlMkZnaXQlMkZzdGFibGUlMkZsaW51eC5naXQlMkZjb21taXQlMkYNCj4g
JTNGaCUzRGxpbnV4LQ0KPiA1LjQueSUyNmlkJTNEODA1YmFlNzU5MmZhMmNmZWRlODk4YjI0ZTJh
OGQ4NWZkZDYzMTdlZSZhbXA7ZGF0YT0wMiU3Qw0KPiAwMSU3Q3BldGVyLmNoZW4lNDBueHAuY29t
JTdDNzU1MTY0YWY0YzBkNDQ3Y2JmNzkwOGQ4MWMxMzc5MDQlN0M2ODZlDQo+IGExZDNiYzJiNGM2
ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzNzI5MDIxNzI0MDczNDc0NiZhbXA7c2RhdA0K
PiBhPVNMTkhSQ2dod0lZRk94TTZROVFlY3lNdlg5QXpVTmZoZmtNR0dNUkszNFElM0QmYW1wO3Jl
c2VydmVkDQo+ID0wDQo+IA0KPiBZb3UgYWRkIGFuICJpbnQgaXJxIiBmaWVsZCBidXQgSSBkb24n
dCBzZWUgYW55dGhpbmcgc2V0dGluZyB0aGlzIGZpZWxkLCBzb21ldGhpbmcNCj4gbWlzc2luZz8N
Cj4gDQoNCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25l
eHQvbGludXgtbmV4dC5naXQvY29tbWl0Lz9pZD03N2YzMGZmNDk3NjFhY2JiM2Q5MGFjYTAwMDRm
MzkzZmQ4MWI2M2E4DQoNClBldGVyDQo=
