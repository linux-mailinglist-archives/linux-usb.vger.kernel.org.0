Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9E314CCB65
	for <lists+linux-usb@lfdr.de>; Fri,  4 Mar 2022 02:44:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232731AbiCDBn4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Mar 2022 20:43:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232050AbiCDBn4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Mar 2022 20:43:56 -0500
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65EED4A927
        for <linux-usb@vger.kernel.org>; Thu,  3 Mar 2022 17:43:09 -0800 (PST)
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4506941D41;
        Fri,  4 Mar 2022 01:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1646358189; bh=lFqdnxYI+O0ttz6Ii+rrSF3p9915Ma9mAaJvofDisUE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=CZs58QGgcKQrjv52B2BH8PS+EPxWYa+Bcry6kv/stronO2kQow2RZwvCUqFqKPMT8
         yC9V9m0WGTzkpOsPJmM+1fbH+Q7R7gupHBXjoRzZekEql1nuh6dEKWW3FSdnrOnr7p
         wVBAM61HcV4xFTOUcuXskK3RsD8TsAkoRSQ9onfvJOvcJkMh1S4SPTF7aJKg0cQjV7
         HCd5YPD8BDg0ld3BO8yTwmrGol8t3cK86+oSjMjDdxYLMKsiSiRIx/G4lcQM75qneR
         pipPbg6gzNiTnzEm8Qerb0AS3FFB9TfigroMrrrmpiLQlITsVPN3wi852EK1AJTpUh
         loXAzkXsRrKeg==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id D6D19A005C;
        Fri,  4 Mar 2022 01:43:06 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7C21A40094;
        Fri,  4 Mar 2022 01:43:05 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="NiyRsYDo";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mq7T6i6Mx61feX7ykCuvLXiKor+bDPQdht0wxMUQmN4HMrJHtxyH2vZyCM5fnfQfVhk4LLekFPLQJX/DZ9eSca66D5sSOu2gxUxkAq+VnfmRBn+OJvceN+PwV/8RWMg0wDkeHX8NnYRDDAVum+KBhn1WLhfDI7TVE+PRl+UzbBY5bm688+0REda2AWA3U1Z7jDceQ038rYCZl0UPYL6Fxqqq4Sg6fesCHBINhkkw5V2Aip8VEYDcq+41tBALn06NisDYnCZnmlF8AJeJdh8pdDJHU8sLGVM/cWHlrJn1EhYfno2DVaWaA0qXFRHLKW+6Tg1qxpMz4OLODnHLeGQ36g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFqdnxYI+O0ttz6Ii+rrSF3p9915Ma9mAaJvofDisUE=;
 b=LeoFKhyoJjwn43Lsv+JXgQjvSA+w9MIacFHo360T8Jo4Y82aA988v1AuIOBb0C7N7xU7+7nYfxckLjWbUXPUZvzsQmFv06/li9b2O36zu4cyEU3wCIcjgmcZjUHI9WbbGaoDJluw9uXGedFachukwlsUxh9Ww6sFNyCNRLzb/KkIto9b4gKqivEcAvOhprciLbiAkrKTQbVtPjbCys1UIxSO9aoZyG3nvqOFzcatAxZsE7ZnwFiGCxQr5fgauAA8V9ffAINXYL5KosC9dhDkgOrZQkqbQ1DSFVu7HWAIoSwsDyMR6PVuDu6ECf4H7TBR43+astwctavf1/Kb6s2eoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFqdnxYI+O0ttz6Ii+rrSF3p9915Ma9mAaJvofDisUE=;
 b=NiyRsYDoK3tQhczafoQW07oVykkjxIOxMLaTOeMzsEnqIqmnFPyoIYCpLXGoJS/8mzaMo3GeFwQmEmCoYZsQeqW6nQZ7UXHeoAm/WkY95YNQ2fUgxX0g/WG1trtGNPOkl081hXEip7WMLmKR0JHON0b3qMyWlDdg8VBxdq7+XZg=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM6PR12MB4418.namprd12.prod.outlook.com (2603:10b6:5:28e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 01:43:02 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::141:3edf:164a:857b]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::141:3edf:164a:857b%4]) with mapi id 15.20.5017.029; Fri, 4 Mar 2022
 01:43:01 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Michael Grzeschik <mgr@pengutronix.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: DWC3 Isoc Gadget Missed Interrupts on Start Transfer
Thread-Topic: DWC3 Isoc Gadget Missed Interrupts on Start Transfer
Thread-Index: AQHYLkLRQwCpjMRYn0W3qK3i4sHgEKysq5kAgADX2ACAAPJlAA==
Date:   Fri, 4 Mar 2022 01:43:00 +0000
Message-ID: <53d6666e-0a1e-08e9-9fe7-d73decf70fd6@synopsys.com>
References: <20220302143539.GI11577@pengutronix.de>
 <73c5e6b4-8f68-9a6e-33e4-0c49c291ad94@synopsys.com>
 <20220303111526.GJ11577@pengutronix.de>
In-Reply-To: <20220303111526.GJ11577@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7dfebaaa-ff0c-4d51-67c4-08d9fd8051c7
x-ms-traffictypediagnostic: DM6PR12MB4418:EE_
x-microsoft-antispam-prvs: <DM6PR12MB44182C234B4911CBF6DACCCDAA059@DM6PR12MB4418.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vxBb1KKB8S3sM6hffTqPMijE6AGfA1kXHLLaZRYQvFZPdHknupPVRbMCxuZmzGaXtqsk1MP+4EWaY65AQvdDqqddofH4B+ETNv0lV25c7518jGqNatn9nYRAq/feAzg3VPq4xyLIjydCjFBEZ6uZk1XlpYmAnZ2a2EqjZFkLC4WUv4wJ7MhP4CNJ0coaEl86xQ+DYBQf/Q3BOH8M6AzZqagmPBrB3Sm0qE4a5M4PRa0f01NQxrsCVhnXZOvgfIzdPYZvUcz4m6ymSHn4VqgQ5cUBSiDUnQElmEfSW7UlgAS4sSpakEqV+FPWUhZqRZ1Z6UF+pmOAT1nCsaL8qu0i8QetcUqc9jgWexZ/NtP2vMqlXmd+jlTYa8FDTxuIk/IGsiwua9vmN5mj0Z5HCMKXaI1kILib9E88GxXdeh0tyz+0UTXXKg311CDYxehijQ4Ii23gEwUWpKNjwo8cInhNJ6f/2RjxMM3n5xA+n3GCaOkHfbPDOnbJP6iFihHjiVdzqmY06GzC8OM31rNHJ2q+H/58kPltLC6YhgbsCDQREagftgrDyFjpdoL+Z5m1LA/wf0qpOlp917BPIpU5iDbMX4IT/iQA3Mc6nLSptFfuMPCcw1KQMy6ws/zxmCBEc09a/QoOblzsXcJJM/kU5CFGkXuP54mMep6mbzlf1DrJW0bippk/3tuRFsUYmk8zH2WZviIfL52wpGsRqHAnSZUwmhzWoODaojeye+q8heZPYntgTqIYaeBjwu7THzwPsn6x2E0PDvQWUMuSWi8wWaD0vQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(71200400001)(6506007)(31686004)(8936002)(316002)(26005)(86362001)(186003)(38070700005)(6512007)(83380400001)(5660300002)(36756003)(54906003)(6486002)(2906002)(508600001)(110136005)(38100700002)(122000001)(76116006)(31696002)(2616005)(66946007)(66556008)(66476007)(64756008)(4326008)(66446008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TExSOVFHeWpQUkNOV0tuUWphWVBuS0VNeGQ5N2FRa25oNXhHMlJBMkNrRnJ3?=
 =?utf-8?B?bElIRWRaQ1FtSmUvOElZckVvWHpaY3FoOEdTTTkrNlA3YzE1SCtYVkZrQzdp?=
 =?utf-8?B?Uytnekp1OVJUVW5qcWZwTVRCUG5QaHhvVXBiNkhBbktMNi94Qjh6Q1p2RzJJ?=
 =?utf-8?B?WFhhZVB6ZU5GS3BBTHgrTUhkZmZhOHYxejAyWlJWV0kzeDhwNDl2aGVacjg1?=
 =?utf-8?B?MXA4YjRsS0tBRkk5VWlwTXZYaDVPYW5zeE56cU41N3gzMndlWFBMbFQxeTlM?=
 =?utf-8?B?S3Y2NE5jWGpja3hMeFBXa3hkb1psWmJ4ZTRDSW1Na3RHSm1tZjIzOGN1eXpU?=
 =?utf-8?B?N01Sd0d2RFRFeXd5SjNFdFhkUVZ3dlRpUzJKY2ZGeEdTdm5CdDROR05ZcXRU?=
 =?utf-8?B?TGpJd2p5YnVLTEMzYzkxOFZZcThRQ2pVSUhtVEFHVGF4bzh4TWp0Rm1BM1E4?=
 =?utf-8?B?dTZjUWkyNUhxQ0xNcHBnaDdnZGwvQW1IT0xLTzNyWW5UdVZaOHhzK2hHN2s0?=
 =?utf-8?B?UmpQekZ4K2NyT05WU0IzRFZlRVNDRXpRdFJDVUMvVjFMTDlzd2ZxMHo1dC93?=
 =?utf-8?B?K0JIVGlGZXM5b29ZMlA2QXVpaGxtUEhTQjJWOHZxNDZXTkluVVFaVVZ2b2U2?=
 =?utf-8?B?cXQ2UVlQdTA4enpZMUg4SG12bVRNQlNrRThCemF1QmhuVFNwZ1FWT2h3Vm1k?=
 =?utf-8?B?Rlp4RGQvTG9FSWllU0VmeDlrVnJkenNWYjRxcE01VFFKWERiZTd5UGw4VklH?=
 =?utf-8?B?R2FicWlqdGhZU056em5UOGNPeGJ5QWYvd3JRemdUM3I1U0x5alpLcnZVLy9s?=
 =?utf-8?B?ZXJsTm5XeHRBVkpqMUpnVjI3cENLWWN3VDNLQ1NhcGtCazkwMFlXZzRHRWE2?=
 =?utf-8?B?dHJyZlp6cVgxRW5DUU9tRmZEZXBIL2E1SGNqRlRqeGcxa3VlOGJxNnFodHlk?=
 =?utf-8?B?TExqYVRqTUsySnVrazBONUQ0aDJPSnUyZTg4TEtXZkdBL2V1RDFJeXBxYlcy?=
 =?utf-8?B?c3pqMkRHRnVUcjZFc2g1MlNBbXZESjFJNHE0akRwVHBuQzlVVnlzeUdaMnJR?=
 =?utf-8?B?L3VnU1pNZjk0Q3YwQTIzRStJMmtuYi9YSU1ZUm5YV2N6R3FpYzZzZjFxYUZC?=
 =?utf-8?B?Nm1IbDFJMVQrWVhqdzJ2Q1RaaUFGajVPTnZUeWorL21ldjJDdkpEYlFMa2xB?=
 =?utf-8?B?NGh5U2xubTU5L2xlQXA4Mmd4NGpXWWZoUFFEenVDa2NyV3VsS2hEUS9ST1pY?=
 =?utf-8?B?ZVYwRHdPdi9Db1EyNjd0WW9CcVlrSGkwbTFDQ2h3Q0xNMmJjd2JOZ2dOOTJF?=
 =?utf-8?B?a2FXVm9rWTkvWEh2V29lL2FXdVF4MDRocXVydkwyQXdvakR6Z3NtSWovRStq?=
 =?utf-8?B?aGxTSW5wYVU1RjRiNkR3QkdPMWpWRG1FQnpZTytFQnZBMUc2cEZrVXhEY1dm?=
 =?utf-8?B?RUdRb29FejE4SHQwK2d3YlBFSFg5SXFtYkRWZ0VBWlFva0lqMzdoMDZyMi9q?=
 =?utf-8?B?bUhsSkZzaVhQOVI1OTR0V3psVkRTcDZNSm1mRzJ6NEJYeE1DN2ZlZ05Jc3Zy?=
 =?utf-8?B?Tmc2KzZBYy9kMWdsajlzcll3T3BYRkJFMHlzeVJCZEd1QTR2dmxySVRkcS92?=
 =?utf-8?B?YjRFV2NCbmdJa2tqU2lPVUhUMm1oNnAxdDFtWXViVE1lVzhvS0V0TkhjNDdZ?=
 =?utf-8?B?ck1vVTFXMzBDUWhjZHZyT0NyeXorUURqd3VJTkFMenZ2d3JUZzVDOWFrYUd4?=
 =?utf-8?B?OUdLSUJoSHBGcGdDcm5iTVIvaVNHelJaclRKazJHTjdIWkNGLzRJMVlzRHd6?=
 =?utf-8?B?MHgzRGxuRzB4V1NoWlNWMmd2VkZZeElMaDRRL1pEaHpHYm90RzQ0Z29lbVhS?=
 =?utf-8?B?bzBJUXJmelFGSzJxOWRUdkR1a3h1c1h5UW45MVB6TE5MaTVxUm93YkVvWG4w?=
 =?utf-8?B?amxGbUNQc0dxZnFnTWtTdTUwZDl3ZUwxT3kvVndCU3JSY2FHRmdma0NQOTZB?=
 =?utf-8?B?MmlZaW05MVc4R0hDUU1Gd2pjb1lQcDVUOTY3ZzNXeVZnMzFHWUN4UVh4SDRl?=
 =?utf-8?B?aHBscEFaT2szenEyTDlUN29sb3VBcjd3RXJRdDJMSVRDcHcwdUpFZXZKS1g4?=
 =?utf-8?B?OEFDQjlVR1V2eGRDRkNGcEZUUm0wRG8zZ1RVTkpiRWs3aTRIc2l1YTFWUUFN?=
 =?utf-8?B?NEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A9BC87C9F122B84E8CF9E33C7FE8F533@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dfebaaa-ff0c-4d51-67c4-08d9fd8051c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2022 01:43:00.9925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b3YxG5jW/+6DWa+peFbzEmw90eY5+gkjPqvUqYprmEB23D4aH2Zo3M2Z811Lhc5rjLpxIVHMA0kGWjSzMrD0ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4418
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

TWljaGFlbCBHcnplc2NoaWsgd3JvdGU6DQo+IE9uIFdlZCwgTWFyIDAyLCAyMDIyIGF0IDEwOjIy
OjU1UE0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4+IE1pY2hhZWwgR3J6ZXNjaGlrIHdy
b3RlOg0KPj4+IEkgYW0gY3VycmVudGx5IGRlYnVnZ2luZyBhIHN0cmFuZ2UgZXJyb3Igd2l0aCB0
cmFuc2ZlcnJpbmcgaXNvYyByZXF1ZXN0cw0KPj4+IHdpdGgNCj4+PiB0aGUgY3VycmVudCBtYWlu
bGluZSBkcml2ZXIuDQo+Pj4NCj4+PiBXaGVuIHRoZSBwZW5kaW5nIGFuZCBzdGFydGVkIGxpc3Qg
aXMgZW1wdHkgdGhlIGNvbXBsZXRlIGludGVycnVwdA0KPj4+IGhhbmRsZXIgaXMNCj4+PiBzZW5k
aW5nIGFuIEVuZCBUcmFuc2ZlciB0byB0aGUgY29udHJvbGxlci4gVGhpcyBFbmQgVHJhbnNmZXIg
d2lsbA0KPj4+IHRoZW4gZ2V0DQo+Pj4gc3VjY2Vzc2Z1bGx5IGNvbXBsZXRlZC4NCj4+Pg0KPj4+
IMKgwqDCoCBpcnEvNTAtZHdjMy0zMDXCoMKgwqDCoCBbMDAwXSBkLi4xLsKgwqAgMTY2LjY2MTg0
NTogZHdjM19nYWRnZXRfZXBfY21kOg0KPj4+IGVwNWluOiBjbWQgJ0VuZCBUcmFuc2ZlcicgW2Iw
ZDA4XSBwYXJhbXMgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgLS0+DQo+Pj4gc3RhdHVzOiBT
dWNjZXNzZnVsDQo+Pj4gwqDCoMKgIGlycS81MC1kd2MzLTMwNcKgwqDCoMKgIFswMDBdIGQuLjEu
wqDCoCAxNjYuNjYxODc3OiBkd2MzX2V2ZW50OiBldmVudA0KPj4+ICgwODBiMDFkNik6IGVwNWlu
OiBFbmRwb2ludCBDb21tYW5kIENvbXBsZXRlDQo+Pj4gwqDCoMKgIGlycS81MC1kd2MzLTMwNcKg
wqDCoMKgIFswMDBdIGQuLjEuwqDCoCAxNjYuNjYxOTc5OiBkd2MzX2V2ZW50OiBldmVudA0KPj4+
ICg0ODJhMTBkNik6IGVwNWluOiBUcmFuc2ZlciBOb3QgUmVhZHkgWzAwMDA0ODJhXSAoTm90IEFj
dGl2ZSkNCj4+Pg0KPj4+DQo+Pj4gQWZ0ZXIgdGhpcyB0aGUgVHJhbnNmZXIgbmVlZHMgdG8gc3Rh
cnQgYWdhaW4uIEJ1dCB1bmZvcnR1bmF0ZWx5IHRoaXMNCj4+PiBzb21ldGltZXMNCj4+PiBkb2Vz
IG5vdCBzdWNjZWVkLiBZb3Ugc2VlIGluIHRoZSBmb2xsb3dpbmcgdHJhY2UgdGhhdCB0aGUgU3Rh
cnQgb2YNCj4+PiB0aGUganVzdA0KPj4+IHByZXBhcmVkIHRyYnMgZGlkIGNvbXBsZXRlIHdpdGgg
YW4gLTE4Lg0KPj4+DQo+Pj4gwqDCoCBrd29ya2VyL3U1OjItMzQ3wqDCoMKgwqAgWzAwMV0gZC4u
Mi7CoMKgIDE2Ni42OTEyODg6IGR3YzNfcHJlcGFyZV90cmI6DQo+Pj4gZXA1aW46IHRyYiAwMDAw
MDAwMDdmZjk1YTEyIChFMjMzOkQyMzIpIGJ1ZiAwMDAwZmZmZmZmYjFjMmE4IHNpemUgMXggMTIN
Cj4+PiBjdHJsIDAwMDAwNDY1OjAwMDAwMDAwIChIbENzOlNjOmlzb2MtZmlyc3QpDQo+Pj4gwqDC
oCBrd29ya2VyL3U1OjItMzQ3wqDCoMKgwqAgWzAwMV0gZC4uMi7CoMKgIDE2Ni42OTEyOTM6IGR3
YzNfcHJlcGFyZV90cmI6DQo+Pj4gZXA1aW46IHRyYiAwMDAwMDAwMGY5Y2QxNzVlIChFMjM0OkQy
MzIpIGJ1ZiAwMDAwZmZmZmZmYjFkMDAwIHNpemUgMXgNCj4+PiA3MTU2IGN0cmwgMDAwMDA0NzE6
MDAwMDAwMDAgKEhsY3M6U2M6aXNvYykNCj4gDQo+IFtzbmlwXQ0KPiANCj4+Pg0KPj4+IFRoZSBp
bnRlcm1lZGlhdGUgQnVzIEV4cGlyeSBpcyBub3QgYWx3YXlzIHByZXNlbnQgaW4gdGhhdCBjYXNl
LCBidXQgYWxzbw0KPj4+IGNvbXBsZXRlbHkgYWNjZXB0YWJsZSBhcyB3ZSBsb29wDQo+Pj4gb3Zl
ciB0aGUgU3RhcnQgVHJhbnNmZXIgdW50aWwgdGhpcyBzdWNjZWVkcy4NCj4+Pg0KPj4+IERvIHlv
dSBoYXZlIGFueSBJZGVhIHdoeSB0aGlzIHN1Y2NlZWRlZCBTdGFydCBTdHJlYW1pbmcgZG9lcyBj
b21lIGJhY2sNCj4+PiB3aXRoIGFuDQo+Pj4gTWlzc2VkIFRyYW5zZmVyIG9uIHRoZSBmaXJzdCB0
cmI/DQo+Pj4NCj4+DQo+PiBIaSBNaWNoYWVsLA0KPj4NCj4+IFdoZW4gc2VuZGluZyB0aGUgdHJh
Y2UsIHBsZWFzZSBsZWF2ZSBpdCB1bmZpbHRlcmVkLiBJdCdzIG1pc3Npbmcgc29tZQ0KPj4gdHJh
Y2UgZXZlbnRzIHRoYXQgSSB3YW50IHRvIGNoZWNrLg0KPiANCj4gUmlnaHQsIGl0IHdhcyBhIG1p
eCBvZiB0cmFjZV9ldmVudDpkd2MzOiogYW5kIGZ0cmFjZV9maWx0ZXI9ZHdjKi4gU28gSQ0KPiBr
aW5kIG9mIGZlbHQgZmlsdGVyaW5nIG91dCB0aGUgaW50ZXJlc3RpbmcgcGFydCB3b3VsZCBoZWxw
Lg0KPiANCj4gQW55d2F5LiBIZXJlIGlzIHRoZSBzYW1lIHNpdHVhdGlvbiBpbiBhbm90aGVyIHRy
YWNlLCB3aXRoIGFsbA0KPiB0cmFjZV9ldmVudHMgZnJvbSBkd2MzOg0KPiANCg0KPHNuaXA+DQoN
Cj4gDQo+PiBQbGVhc2UgY2hlY2sgaWYgdGhlIGhvc3QgaXMgYWN0dWFsbHkgcG9sbGluZyBmb3Ig
ZGF0YSBhdCB0aGF0IHVmcmFtZS4NCj4+IEVhY2ggVFJCIGlzIHNjaGVkdWxlZCBmb3IgYSBwYXJ0
aWN1bGFyIGludGVydmFsLiBJZiB0aGUgaG9zdCBkb2Vzbid0DQo+PiByZXF1ZXN0IGZvciBkYXRh
IGF0IHRoYXQgcGFydGljdWxhciBpbnRlcnZhbCwgdGhlbiBpdCdzIGEgbWlzc2VkIGlzb2MNCj4+
IGFsc28gKGVyciAtMTgpLiBTbywgaWYgeW91IGhhdmUgYSB1c2IgdHJhZmZpYyBhbmFseXplciwg
cGxlYXNlIHZlcmlmeQ0KPj4gdGhpcy4gQWxzbywgbWF5YmUgdHJ5IHdpdGggYSBkaWZmZXJlbnQg
aG9zdCB2ZW5kb3IgdG8gc2VlIGlmIHRoZQ0KPj4gYmVoYXZpb3IgaXMgdGhlIHNhbWUuDQo+IA0K
PiBUaGUgYmVoYXZpb3Igc2VlbXMgdG8gZGlmZmVyIGlmIEkgYXR0YWNoIGRpZmZlcmVudCBob3N0
cy4gSSBoYXZlIG5vDQo+IHRyYWZmaWMgYW5hbHl6ZXIuIFdvdWxkIHVzYm1vbiB1bmRlciBsaW51
eCBob3N0IHdvcmsgZm9yIHRoYXQ/IEhvdyB3b3VsZA0KDQp1c2Jtb24gZG9lc24ndCBzZWUgdXNi
IHBhY2tldCBsZXZlbC4gU28gbm8sIHVzYm1vbiBkb2Vzbid0IHdvcmsuDQoNCj4gSSBzeW5jaHJv
bml6ZSB0aGUgZ2FkZ2V0IHJlcXVlc3QgYW5kIGhvc3QgdXJicyB0byBrbm93IHdoaWNoIGZyYW1l
DQo+IGludGVydmFsIHdvdWxkIGhhdmUgYmVlbiB0aGUgb25lIHRoYXQgd2FzIG1pc3NlZCBpbiBt
eSBsb2dzPw0KDQpJdCB3aWxsIGJlIGRpZmZpY3VsdC4gWW91J2QgaGF2ZSB0byBjaGVjayB0aGUg
ZXhwZWN0ZWQgaW50ZXJ2YWwgdGhlIHVyYg0Kd2FzIHNjaGVkdWxlZCBmb3IgZnJvbSB4aGNpIGRy
aXZlciwgYW5kIHlvdSBtYXkgaGF2ZSB0byBjaGVjayB0aGUNCk1GSU5ERVguIFlvdSdkIGFsc28g
bmVlZCB0byBkZXRlcm1pbmUgYSBwb2ludCBvZiByZWZlcmVuY2UgdGhhdCB0aGUgZGF0YQ0KcmVj
ZWl2ZWQgZnJvbSBkZXZpY2UgaXMgZm9yIGEgcGFydGljdWxhciBpbnRlcnZhbC4gRXZlbiBpZiB5
b3UgaGF2ZSBhbGwNCnRoaXMgaW5mbywgeW91J2QgaGF2ZSB0byBhc3N1bWUgZXZlcnl0aGluZyB0
aGUgaG9zdCBjb250cm9sbGVyIHJlcG9ydGVkDQppcyBhY2N1cmF0ZSBhbmQgbm90IG1pc3Npbmcg
YW55dGhpbmcuDQoNCj4gDQo+IElzIHRoZXJlIGFueSB3YXkgdGhlIGdhZGdldCBkcml2ZXIgY291
bGQgc2VlIGlmIGZvciB0aGF0IGludGVydmFsIHRoZQ0KPiBob3N0IGRpZCBub3QgcG9sbCBmb3Ig
ZGF0YT8gT1IgYXJlIHRoZXJlIGJpdHMgdG8gZ2V0IHRoaXMgYmVoYXZpb3VyDQo+IHByZWRpY3Rh
YmxlIGFuZCB0aGUgZHJpdmVyIHRvIHJlYWN0IG9uPw0KPiANCg0KWW91IGNhbiBjaGVjayBpZiB0
aGVyZSBhbnkgIm1pc3NlZCBzZXJ2aWNlIGVycm9yIiBmcm9tIGhvc3QsIGl0IG1heSBnaXZlDQpz
b21lIGNsdWVzLCBidXQgbm90IHRoZSB3aG9sZSBwaWN0dXJlLg0KDQo+IE90aGVyd2lzZSwgd2h5
IHNob3VsZCBvbiBhbiBvbmdvaW5nIHN0cmVhbSB0aGUgaG9zdCBub3QgcG9sbA0KPiBmb3IgZGF0
YSBpbiBhbnkgaW50ZXJ2YWwuIFdoYXQgd291bGQgYmUgdGhlIGNvbnN0cmFpbnRzIHRvDQo+IGln
bm9yZSBvbmUgaW50ZXJ2YWwuDQoNClRoZSBob3N0IGRyaXZlciBtYXkgbm90IGludGVudGlvbmFs
bHkgZG9lcyBpdC4gVGhlcmUgYXJlIG1hbnkgcmVhc29ucw0Kd2hlcmUgdGhlIGhvc3QgY29udHJv
bGxlciBub3QgcG9sbCBmb3IgZGF0YSwgYW5kIEkndmUgc2VlbiBpdCBvZnRlbi4gSXQNCmNhbiBi
ZSBiZWNhdXNlIG9mIHRoZSBkcml2ZXIgaGFuZGxpbmcgaW50ZXJydXB0IGxhdGVuY3kvZGVsYXkg
dGhhdA0KcHJldmVudHMgdGhlIGRyaXZlciBmcm9tIGZlZWRpbmcgaXNvYyBURC9UUkJzIHRvIHRo
ZSBjb250cm9sbGVyIGluIHRpbWUsDQpjYXVzaW5nIHVuZGVyZmxvdyBhbmQgc3RhcnZlIHRoZSBj
b250cm9sbGVyLiBTb21lIG90aGVyIHRpbWUgaXQncyB0aGUNCmNvbnRyb2xsZXIgdGhhdCBkZWNp
ZGVkIHRoZSBiYW5kd2lkdGggaXMgbm90IHN1ZmZpY2llbnQgZm9yIGlzb2MNCnRyYW5zZmVyIG9y
IHBoeSBzaWduYWwgaW5zdGFiaWxpdHkgYW5kIGNhdXNlIGEgbWlzc2VkIHNlcnZpY2UgZXJyb3Ig
ZXRjLg0KDQpBbnl3YXksIGluIHRoaXMgcGFydGljdWxhciBjYXNlLCBmcm9tIG15IGV4cGVyaWVu
Y2UsIEkgZG9uJ3QgdGhpbmsgaXQncw0KdGhlIGhvc3QgdGhhdCdzIG1pc3NpbmcgYSBwb2xsLiBJ
dCdzIHByb2JhYmx5IGJlY2F1c2UgdGhlIGRldmljZQ0Kc2NoZWR1bGluZyBpdCB0b28gYWdncmVz
c2l2ZWx5IGVhcmx5LiBDYW4geW91IHRyeSB0byBzY2hlZHVsZSBvbiB0aGUgMm5kDQppbnRlcnZh
bCBpbnN0ZWFkIGFuZCBzZWUgaWYgaXQgaGVscHMgaW4geW91ciBjYXNlLg0KDQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMN
CmluZGV4IDNlNzVlYWExM2FiYy4uYjllYzc2MjZiMDgwIDEwMDY0NA0KLS0tIGEvZHJpdmVycy91
c2IvZHdjMy9nYWRnZXQuYw0KKysrIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KQEAgLTIx
MDQsNyArMjEwNCw3IEBAIHN0YXRpYyBpbnQgX19kd2MzX2dhZGdldF9zdGFydF9pc29jKHN0cnVj
dCBkd2MzX2VwDQoqZGVwKQ0KICAgICAgICB9DQoNCiAgICAgICAgZm9yIChpID0gMDsgaSA8IERX
QzNfSVNPQ19NQVhfUkVUUklFUzsgaSsrKSB7DQotICAgICAgICAgICAgICAgZGVwLT5mcmFtZV9u
dW1iZXIgPSBEV0MzX0FMSUdOX0ZSQU1FKGRlcCwgaSArIDEpOw0KKyAgICAgICAgICAgICAgIGRl
cC0+ZnJhbWVfbnVtYmVyID0gRFdDM19BTElHTl9GUkFNRShkZXAsIGkgKyAyKTsNCg0KICAgICAg
ICAgICAgICAgIHJldCA9IF9fZHdjM19nYWRnZXRfa2lja190cmFuc2ZlcihkZXApOw0KICAgICAg
ICAgICAgICAgIGlmIChyZXQgIT0gLUVBR0FJTikNCg0KDQoNCkFsc28sIHRoZXJlJ3MgYW5vdGhl
ciBpc3N1ZSBpbiB0aGUgZHdjMyBkcml2ZXIuIEN1cnJlbnRseSBpdCBjaGVja3MgdGhlDQpldmVu
dCBzdGF0dXMgYW5kIHJlcG9ydGVkIGl0IHRvIGFsbCB0aGUgcmVxdWVzdHMuIEkgbm90aWNlIHRo
YXQgeW91IChvcg0KdGhlIGRldmljZSBVVkMpIGRvbid0IHNldCBpbnRlcnJ1cHQgZm9yIGV2ZXJ5
IHJlcXVlc3QgYnV0IGFib3V0IGV2ZXJ5DQoxMHRoIHJlcXVlc3Q/IE5vdCBhbGwgb2YgdGhlIGNv
bXBsZXRlZCByZXF1ZXN0cyBmYWlsZWQgd2l0aCBtaXNzZWQgaXNvYywNCmJ1dCB0aGUgaW50ZXJy
dXB0IGV2ZW50IHN0YXR1cyBpbmNvcnJlY3RseSBzZXQgLTE4IGZvciBhbGwgb2YgdGhlbS4gVGhl
DQpkd2MzIGRyaXZlciBzaG91bGQgY2hlY2sgdGhlIFRSQiBzdGF0dXMgZm9yIGVhY2ggaW5kaXZp
ZHVhbCBUUkIgYW5kDQpyZXR1cm4gdGhlIHByb3BlciBzdGF0dXMgdG8gdGhlIGFzc29jaWF0ZWQg
cmVxdWVzdC4NCg0KVGhhbmtzLA0KVGhpbmgNCg==
