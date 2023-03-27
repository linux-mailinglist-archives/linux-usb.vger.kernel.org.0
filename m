Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE3816CA2BA
	for <lists+linux-usb@lfdr.de>; Mon, 27 Mar 2023 13:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232191AbjC0Lqc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Mar 2023 07:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjC0Lqb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Mar 2023 07:46:31 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2112.outbound.protection.outlook.com [40.107.20.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 544FC2121
        for <linux-usb@vger.kernel.org>; Mon, 27 Mar 2023 04:46:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9yBDS0XqxNNABvnjERmmCgCHSS3bslfv7YbVX8XYM/k2cM1Z1yaZ5Ek1bH3ASiy/O1BNkgU48jESUi+Ly2fXidmACUAFXy6YteaqMkhv8a0pcB+H9q5fXHrlpo0UB/WDzStrkXYFfUmbQn/e0oWqvbxaMtgiM1TteVFo7PUGQ5YdsO/qrCu7IyrGHsbKDlHDJiTrmGgr5qg1zVQkCJb/a1ybEbkzj5owxgjlSVqRGKdGFW8LWZbVtrAfWSThnTxMdEmajWsvziPRl+xkSIEevTxeNQOl2YL2WA/t8lYWhthbfeVL2HUTuNvopbLbX4/NuIW1erV/yMydS2Nsx51aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocNDmJEgcSVQNKzGElueQuOPLY0BmKaXDX1Iad7GBEw=;
 b=V9y3soyHs7TMrTXDQkvjjqYM+Cp29wIRaLjS8JMNN+hLBxNt1caL1ovJ3Mqyakpm686A4VaByBiYMLHAmFLMm62dTdo9oao15EK1EgIq+uESgyRQ+Ou7YywtaHGerXYiQHxwpIaC5dRVVnjKV4Rr3ZFcHx2Ifg4RDWgtlozyJngZrUDQU8O65fCNEFrvaohVNo0en7Ha7tEcxloOpJH0gNRAKYqzqcvffIYwHHAEuMYUrqtNRcYqkoZje24s/Z3ywO/aTV5CUrf5FaP4szf5EFyLuWArFw0Ctr1kXpN7tDe+rTE99tInhn20OrE8pk6l68B9cCRXJhaax9rmd65SPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kramerav.com; dmarc=pass action=none header.from=kramerav.com;
 dkim=pass header.d=kramerav.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kramerav.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocNDmJEgcSVQNKzGElueQuOPLY0BmKaXDX1Iad7GBEw=;
 b=Ijnb0B5hw060LUNMFngeIeqY8QfvUgW995pvUlYuDfPGlmZOxIT90MNh/sLoxDnl59ZFf0JrVMF6i/fXFG1oRA6Hxvc6NJTnQPWOPqpIbAWI6q+c/kW5NqoLi4IUHxewsulvxlhFtOEPqP7yp79ph/IEKz/kmmE4wI/jWNiQ6DM=
Received: from PA4PR05MB9282.eurprd05.prod.outlook.com (2603:10a6:102:2ad::22)
 by AS8PR05MB10131.eurprd05.prod.outlook.com (2603:10a6:20b:611::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 11:46:27 +0000
Received: from PA4PR05MB9282.eurprd05.prod.outlook.com
 ([fe80::4b50:48ee:75ac:6d3e]) by PA4PR05MB9282.eurprd05.prod.outlook.com
 ([fe80::4b50:48ee:75ac:6d3e%8]) with mapi id 15.20.6178.038; Mon, 27 Mar 2023
 11:46:27 +0000
From:   Lidor Elkais <lelkais@kramerav.com>
To:     Dan Scally <dan.scally@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [EXT] Re: UVC-GADGET ISSUE
Thread-Topic: [EXT] Re: UVC-GADGET ISSUE
Thread-Index: Adlel2kbFg87L5PDTyOuCcCPrul24AB4uP8AAAnMTEA=
Date:   Mon, 27 Mar 2023 11:46:27 +0000
Message-ID: <PA4PR05MB92823053156C070FCBEC2B51D58B9@PA4PR05MB9282.eurprd05.prod.outlook.com>
References: <PA4PR05MB9282681AE7CF4F8ADD039FEFD5849@PA4PR05MB9282.eurprd05.prod.outlook.com>
 <0fe9b711-689e-d9ce-992b-79f128e5efe6@ideasonboard.com>
In-Reply-To: <0fe9b711-689e-d9ce-992b-79f128e5efe6@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kramerav.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR05MB9282:EE_|AS8PR05MB10131:EE_
x-ms-office365-filtering-correlation-id: 3c705396-d54a-456e-dfb5-08db2eb8e636
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0CVgJWFrSHLa6DKqVAS5bBX5vxFZx3WlMVOXyZuth+bifFuM8Mm/iiEyvkn8iYMxbV1KQDABPHBbES8ltXoSL07UX7PBsToQOL2MVtOta0Cw6fGuBZ/1dmt7lQTamDK0m1OmPMaWpBQG6NdC5uVbmu+O7tk3vMHD/y9jx7R5Ilv99mhWuE9oyYkJJuIIRBMsuI61NsRD9OleDNedw8PMFAkFrezvBf0H82Macfygkza7YxpE7WnGx9JnDHlcDCWmwfSNhKXOiekRFIan1ViWkyypcVA0+vCyL4nJNAdQWD7nd4cHnrj8h9RbHXu1+qyT6dOjKOI6N48TBAN5D1PVQsOutdfosJOZZCI6y9rMXq8Z+RiI34LpGwoBkgcQmihWIAhCmkQsl5NIQQdNtbV8OUAI1Y/zd2Tcd72Q1lDyB1KE2+aISbfruka+T/oJYtLscPzgzuxPsw4CQD4+IzBEgUqAMBm5oFHzT7R34gyLqfP/fv9b7/I5k1NVWm/RUhkHTxQTEKS5QEBY9AwOQsGe+EYkJ1Vnfn6v0HsmoTDKTTZ/aAplgbXY1kF+Kb/Y0OvZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR05MB9282.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39850400004)(396003)(366004)(346002)(136003)(451199021)(9686003)(26005)(186003)(7696005)(71200400001)(966005)(76116006)(53546011)(6506007)(316002)(66476007)(8676002)(4326008)(66446008)(64756008)(66946007)(66556008)(54906003)(110136005)(478600001)(41300700001)(8936002)(5660300002)(52536014)(2906002)(83380400001)(122000001)(55016003)(86362001)(38100700002)(38070700005)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2tUUkRYOTNDT2d4SFlTQlpSODgxd2RPT0N6NnR0VVh0SmU1NGc3NjNWcVhm?=
 =?utf-8?B?VWFTdDJOK0xMeXVpVmRBZWUyS1B5SnN6TzJwWDcxTXJxQ0N5WmVaeDNxZkFh?=
 =?utf-8?B?WCs4VTMzazF5clpvWlR4azMrNXA5SC96WDA5bUw4NTdHbFZkTXJqb1ZZQ0tL?=
 =?utf-8?B?dC9vMDhvNkw5UitlKy9TcElnbFBwVXphWUUyUTRKRkh2Z0VQRC9MUXdRT3hp?=
 =?utf-8?B?OFdxWWJNQzZzRi9KMEV1OGxlT25GdmxPbE1PT3JsMUxPaktXYkFKVHRpMldN?=
 =?utf-8?B?QVpTR0k4bEF6SG1Gamd3SExOcTQvQSt6Y3d4TitWc2hLN29QVUJrUng4cXZH?=
 =?utf-8?B?a05ESGNacU1zMi9EdGJjUDBiVTk3a2RQWm5RSlZlR1dBbXRZWW5jY0RGVzdP?=
 =?utf-8?B?KzFiYk11UzVacXdRSnEwSjJQUWNDR2RYR2hZbExGQk9mcWVzWUs5djRlY2Jl?=
 =?utf-8?B?Z0Q1ZERydnRYOEM2c0xnQ1kzYk91MWxVUGYxeTJ2TitQNTBWN2NNWkNMS0Vo?=
 =?utf-8?B?WlI0czZxV1Z2eTJvQWFtQmdLK0ttRWlRRFJWOGYrcFRHb1NXKzk2bFpRTHYy?=
 =?utf-8?B?cjJ5VW90S3QwbndRZDZFaWljc1RGQWxSK051WFJyQjY5L3ZibzZvTVprdDYx?=
 =?utf-8?B?aE9Ba3RkeGFXSXdTNlQwUzlBV0hwL3VNdFdxTyszVDZycFVWUmN5NjUzMEEv?=
 =?utf-8?B?TnFiaE1xbHNVRGxlRkYvN0tNaFA2d0E0ZVRVRnBjdUJHUDdUbXdUMG1abk1p?=
 =?utf-8?B?d1FUVldkNGNEazdtRWhPSDVUWDJySlQxeVM5R0FDVVhvVWhBWVN4ZUwza3VX?=
 =?utf-8?B?dG1SdjlFQUZmNmVXcU9Hb2tIT0o4UDlqd21lbUd6d3hjY3FzMXN5Uk9aTmV3?=
 =?utf-8?B?amtzdkxlOERYSkQwaS93NmM4MEExSlh2L3ZEbXJ1TWIxSE4xRmhmQytjOHgx?=
 =?utf-8?B?bDdzdTFEazFweGZaWlFmb24zWjd5SnJnZkJKNnZPTmx4MDB6RkNPTWZXMWVO?=
 =?utf-8?B?TGRmWnJsV0dKVGh4VGxRNFdnRUxHOVpzdzRCbWZ4eENnaXNNd1NMellXZEpN?=
 =?utf-8?B?NDhDdEVqYUttK0FqYnU5ZVE3Qzk1a2NsM2owQVJIN1JoQ1ZDMStRZG5JVllw?=
 =?utf-8?B?bXpFOGp5Skd2cGZ1eGljQ0pMUHlubit0dEVuaDVUNzJYWlliR25PdEVPeDE5?=
 =?utf-8?B?bVRTMDNCWFpXZkNRQm90RzV1T0dURDBDcFpkanRxQmtVNTdiS3MrSFhmQ0pE?=
 =?utf-8?B?WnZKTXlCTkQ1RVhPL1JBSm5LU0NhR1U4MEtyTUEzOW42NkdJV3NQdUpEWW5i?=
 =?utf-8?B?UWZPejVnNlhjMWtYT210bFRQNTlEZ2pqRy9FRFBYM1RnUFozOU10dHMvb0xK?=
 =?utf-8?B?aUVuNlJ0WldhMkRXQys0cDg0aUZ5RElHcjkvSTVuZEtwOXNLT1RZYS9KelIv?=
 =?utf-8?B?T3Rnb0ZaQkRXNnNldkIwSVlyb2FwR3hESlJCU2kyaURvdTE5K3J4NXdta2V1?=
 =?utf-8?B?RHhndkxGSEJjTkJBeVRlWFRHQS9KdW5XOTNuU2dmYjRHSDBsRjR4OG5GMmo1?=
 =?utf-8?B?RzZCa1kwQjBQNHZPM2VkRm12eVRsTTN0V0tqclhyK1Ewbm4wZVdNbThqQktz?=
 =?utf-8?B?WU13RUNHbHMxNHEzb1BTS241YUNUVlBYOHdNK1VSTG8xMWNralFucGw0di82?=
 =?utf-8?B?cDBoa2NHeFB3cTNDdHkwUEwyRDZsNEdSclB0Rm5tQ3dYOEZwVTlWcmxrZFkw?=
 =?utf-8?B?RGxyQnpLclcrVVlUYVhjQmh5YVROQVNFeGdXRmRtMkQxVXlGWGNwRFJqbWpK?=
 =?utf-8?B?bDRZUVF2RkpPaHljb3ArL3FwZWdlUmpJeGZHODVpSG45UHdlSFNUZXNkT3ZN?=
 =?utf-8?B?QVlJYzVYYnh2NDBtcFFydzFSaTFJVzVRNWRMSzhBbFRZTmV2dHdqcXJHeTlD?=
 =?utf-8?B?cDRUYUgrMERnOVJkRjV2Y2oraHZIVCszUWcyVG1qM2N3ZmRZZDNCRkF5TSsr?=
 =?utf-8?B?dnBkMmFmSWpFT3RobTNYcDdpZEZwSkZGMHl1ZzJ0dS9YQ2l1cE1jTlh3NVM4?=
 =?utf-8?B?TEZrWnRpUGFHeitnSTZHWUlWYnk4OUgrWGd4c3FqMlQyVnV0THE3KzZORE5s?=
 =?utf-8?Q?eI+Yu4NWg2D8UiSoZKRSF0iAD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: kramerav.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR05MB9282.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c705396-d54a-456e-dfb5-08db2eb8e636
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2023 11:46:27.3804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3db4ad3c-2be0-4d8b-9101-e2e8b5f234a8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vvvzBL7nwNEECmOmBrITHKRrqke3lMJJ/jRK17+VwQ9B4XD3gQf3Vgkb+wElcyNYJs2ivEi53Y78IZjDcoOpxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR05MB10131
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgLA0KDQpUaGFuayB5b3UgYSBsb3QhDQoNCkhlcmUgaXMgdGhlIG91dHB1dCBmcm9tIHN0ZG91
dDoNClVWQzogSU8gbWV0aG9kIHJlcXVlc3RlZCBpcyBVU0VSX1BUUg0KdXZjIGRldmljZSBpcyBk
d2MzLWdhZGdldCBvbiBidXMgZ2FkZ2V0DQp1dmMgb3BlbiBzdWNjZWVkZWQsIGZpbGUgZGVzY3Jp
cHRvciA9IDMNCg0KSSBhbSB1c2luZyBYSUxJTklYIFVsdHJhIFNjYWxlKy4NCg0KRG8geW91IGFu
eSBzdWdnZXN0Pw0KDQpUaGFuayB5b3UsDQpMaWRvciANCg0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogRGFuIFNjYWxseSA8ZGFuLnNjYWxseUBpZGVhc29uYm9hcmQuY29tPiAN
ClNlbnQ6IE1vbmRheSwgTWFyY2ggMjcsIDIwMjMgMTA6MDQgQU0NClRvOiBMaWRvciBFbGthaXMg
PGxlbGthaXNAa3JhbWVyYXYuY29tPjsgbGludXgtdXNiQHZnZXIua2VybmVsLm9yZw0KQ2M6IEtp
ZXJhbiBCaW5naGFtIDxraWVyYW4uYmluZ2hhbUBpZGVhc29uYm9hcmQuY29tPjsgTGF1cmVudCBQ
aW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KU3ViamVjdDogW0VY
VF0gUmU6IFVWQy1HQURHRVQgSVNTVUUNCg0KSGVsbG8gTGlkb3INCg0KT24gMjQvMDMvMjAyMyAy
MTozMCwgTGlkb3IgRWxrYWlzIHdyb3RlOg0KPiBIaSwNCj4NCj4gaSBhbSB1c2luZyB5b3VyIHV2
Yy1nYWRnZXQgYXBwbGljYXRpb24oZnJvbSB5b3VyIGdpdC1odWIpLg0KDQoNCkFueXRoaW5nIGZy
b20gR2l0aHViIHdpbGwgYmUgYSBmb3JrLCB3ZSBoYXZlbid0IGhvc3RlZCB0aGUgcHJvamVjdCB0
aGVyZS4gSW4gdGhhdCBjYXNlIChkZXBlbmRpbmcgb24gdGhlIHNwZWNpZmljIGZvcmspIGl0IG1h
eSBiZSBlaXRoZXIgb3V0IG9mIGRhdGUgKGJlY2F1c2Ugd2UgZGlkIHF1aXRlIHNvbWUgd29yayBy
ZWNlbnRseSkgb3IgZWxzZSBjb250YWluIGEgbG90IG9mIHdvcmsgdGhhdCB3YXNuJ3QgZG9uZSBi
eSB1cy4gSSdsbCBzdGlsbCB0cnkgdG8gaGVscCwgYnV0IGl0J2xsIGJlIGVhc2llciBpZiB5b3Un
cmUgdXNpbmcgdGhlIG1haW4gcmVwbyBzaW5jZSB0aGF0J3MgdGhlIG9uZSBJJ20gZmFtaWxpYXIg
d2l0aCwgY291bGQgeW91IGdpdmUgaXQgYSB0cnkgcGxlYXNlOg0KaHR0cHM6Ly9naXRsYWIuZnJl
ZWRlc2t0b3Aub3JnL2NhbWVyYS91dmMtZ2FkZ2V0Lw0KDQo+IGkgaGF2ZSBhbiBpc3N1ZSwgaWYg
eW91IGNhbiBoZWxwIGl0IHdpbGwgYmUgZ3JlYXQuDQo+DQo+IGkgZGlkIHNoZWxsIHNjcmlwdCBp
biBvcmRlciB0byBjb25maWd1cmUgdGhlIGdhZGdldChhdHRhY2hlZCksIHdoZW4gaSBhbSBydW5u
aW5nIHlvdXIgdXZjIGFwcCwgdGhlIGNvbXB1dGVyKHdpbmRvd3MgLSBJIGNvbm5lY3RlZCB2aWEg
VVNCLUhvc3QpIHNheXMgInVzYiBub3QgcmVjb2duaXplZChzZXQgYWRkcmVzcyBmYWlsZWQpIg0K
Pg0KVGhlIHNjcmlwdCBsb29rcyBvaywgY2FuIHlvdSBzaGFyZSB0aGUgb3V0cHV0IGZyb20gc3Rk
b3V0IG9uIHRoZSBkZXZpY2Ugd2hlbiB5b3UgcnVuIHRoZSBhcHBsaWNhdGlvbiBwbGVhc2U/IFdo
YXQncyB0aGUgaGFyZHdhcmUgdGhhdCB5b3UncmUgcnVubmluZyB0aGUgdXZjLWdhZGdldCBwcm9n
cmFtIG9uPw0KPg0KPiB0aGUgb3B0aW9uIGZvciB5b3VyIGFwcCBhcmUgYmVsb3c6DQo+IC4vdXZj
LmVsZiAtZCAtaSBQNzIwLmpwZyAtdSAvZGV2L3ZpZGVvMSAtciAwIC1mIDEgLW8gMQ0KPg0KPiBV
dmMuZWxmIC0gaXMgeW91ciB1dmMtZ2FkZ2V0IGFwcGxpY2F0aW9uLCBJIGp1c3QgY29tcGlsZWQg
dGhlIGZpbGVzIA0KPiB3aXRoIG15IGVudmlyb25tZW50KFZpdGlzKQ0KDQoNCkFuZCBpbmRlZWQg
dGhlIG9wdGlvbnMgaGVyZSBsb29rIGxpa2UgdGhleSdyZSBmcm9tIHdsaGUncyBmb3JrLg0KDQoN
ClRoYW5rcw0KDQpEYW4NCg0KPg0KPg0KPiBwbGVhc2UgaGVscCBtZSwNCj4NCj4gdGhhbmtzLA0K
PiBMaWRvcg0KPg0KPiBMaWRvciBFbGthaXMNCj4gUiZEIEdyb3VwLCBWJlYgRW5naW5lZXINCj4N
Cj4gMiBOZWdldiBTdC4sIEFpcnBvcnQgQ2l0eQ0KPiA5NTQ2MzAzLCBJc3JhZWwNCj4gTW9iaWxl
OiArOTcyLjUyLjU0Ny40MjExDQo+IGxlbGthaXNAa3JhbWVyYXYuY29tDQo+DQo+DQo+DQpDQVVU
SU9OOlRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlv
bi4NCkRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVj
b2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCg0K
