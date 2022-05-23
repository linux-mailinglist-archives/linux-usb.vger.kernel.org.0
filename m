Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46C80531F2E
	for <lists+linux-usb@lfdr.de>; Tue, 24 May 2022 01:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbiEWXXH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 May 2022 19:23:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbiEWXXG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 May 2022 19:23:06 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81FF46C56A
        for <linux-usb@vger.kernel.org>; Mon, 23 May 2022 16:23:05 -0700 (PDT)
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B56C8C08B9;
        Mon, 23 May 2022 23:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1653348185; bh=cstOo6yzVuEeEdglo1vLr3o5iMOvd0ih28ttnkebz6M=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=T9THnpiJoSROUg8RV2GtxccbksfOlBAKv7IUo9RegFzLkLTN7dQQne2R0sbKS8BZT
         rC7ymaiuMyyi3bpr8TP1pWgEjV6r2XxLLiubYCmAqxLLDzAgOrzRe/h/8VCusudxWo
         miTAJoT86WWHEqsgBMwyUrOqRFUKFjNRgdFt+YvbI+AktK09xVNByAlrOBBc+0GERk
         Q8KCddePZQEiW9rXDujDlstgPi/pt9PclNZI+uDKRVNNaCnwYTp1+KU8epy59DAFEc
         t4TdGFCjZnr6zSXokbDaj2odRL3T18XBP5KIvQyBUhmytraQAvc1X3w4tBtD7XjRkU
         WS6vCTuuiXAbg==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id B73D9A008D;
        Mon, 23 May 2022 23:23:03 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2D94E800CA;
        Mon, 23 May 2022 23:23:02 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Wet2GsBK";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PsxvsjpStw3S2eQL5E+wlbTOWhgR8BCiF+bgmzGiRKuvM9AVhn2PPnxSljYPMU9MNxehzzeafxGVLwdIk1RWJrAax98oKIPX2jGLqpS3JyedRm7KHWGJMZzTvzbyCnS7Xg1Bnhthar/89FXfL26UhhpX/gvMO6//L2PkiUqjNNoMZwGsnifXyL69FRd/EYwbbcc5E0hkqc2tRRuk9my4fD3ewXI0hokUKFuHUxCgY1xefmw57iuSF/nl7k8UJFz1w3CF6T0NXhOcpFVt0tcEteut6fTj0xZBJB2g/kE+K/pWJhnfY6R9R05JBizhnaZ8eQDeYI04wwTWcy0B3g50bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cstOo6yzVuEeEdglo1vLr3o5iMOvd0ih28ttnkebz6M=;
 b=b5kVK3rqKU7g0A/KOoNQHhDXHt728DfYQ2P7up006MNPom1d5Uk18IhpT0/TA1+Gun1its6n4MLH2BtYMobALge6qiUtHTvyQUKp6b1J8Dv0V30hw97W/V6DY+iI4TzUqts1rgEEbnAD5vTenAEZIdZduuRq02sBTC2cXWUGHYZas4Ke9oxfesG1tytc0NupiGNr33091xlc3BYQLoCIRqw3MYZtTE4QBPafYPXxWR83X2LAeYC8it8xHCYbi1SSsPDPK6WBuMUiMLUmASW7OAhCKaMZB2wVVKYccU7YHdlcataRGvxJRswZpGJQ1uR8c3r6LGsGjUu1SIQx+Noqeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cstOo6yzVuEeEdglo1vLr3o5iMOvd0ih28ttnkebz6M=;
 b=Wet2GsBKoKgjCNQPs05avrF6hmeQHWpCQEDivjd05khLJlRm+azxylQUQtfxnJD8Tsaj3duEAdZGU0T0qb7XJ2MiGQoZ2kz7PUV8bAusb73/+W9+hoQFyTHOdp/3bJtQgnOrOT4mcGY9X1yO1PyPABOavIJ4XcagoMjTbT/DCrk=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB3223.namprd12.prod.outlook.com (2603:10b6:a03:138::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.18; Mon, 23 May
 2022 23:23:00 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::91c7:7e6b:d663:a349]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::91c7:7e6b:d663:a349%7]) with mapi id 15.20.5273.023; Mon, 23 May 2022
 23:22:59 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Pavan Kondeti <quic_pkondeti@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH 4/6] usb: dwc3: ep0: Don't prepare beyond Setup stage
Thread-Topic: [PATCH 4/6] usb: dwc3: ep0: Don't prepare beyond Setup stage
Thread-Index: AQHYVe/g7PJ21hsO6kaLCfxoE3S18K0NDleAgCA93YA=
Date:   Mon, 23 May 2022 23:22:59 +0000
Message-ID: <c4aefadb-80a3-1a4b-9e33-14f9340b597e@synopsys.com>
References: <cover.1650593829.git.Thinh.Nguyen@synopsys.com>
 <6bacec56ecabb2c6e49a09cedfcac281fdc97de0.1650593829.git.Thinh.Nguyen@synopsys.com>
 <20220503110115.GA21427@hu-pkondeti-hyd.qualcomm.com>
In-Reply-To: <20220503110115.GA21427@hu-pkondeti-hyd.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7e128cb-4302-4f11-01a1-08da3d132d25
x-ms-traffictypediagnostic: BYAPR12MB3223:EE_
x-microsoft-antispam-prvs: <BYAPR12MB322353A725B4F70B1BEE2649AAD49@BYAPR12MB3223.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: npM3AqCk6g9lQ86Q+IreMKBbBjKNokb91FKg6COlfDAFDkVie0FlqIbh3Mt3plqPETur8u1w8vSAvHJEYEaAR14ktWKg/GfyF83i4Du/4cjWPyp4pMssEEtofiFYUgBAedrR0OBEzcXhBZsJ7xEuEgnQMzTbiK+Teu2W2vlUi9ue6nJ/xligskI4iiCAhkeEQKZQkUUB/7UA7BOpLMtftP20cAC8Q5/XzKrJdAoERJ1Yctt0TkiL01xfIHxkIjpaZMsfwyexkv+twNA9VKYfYY/PfMhWgGN15ESzQ5QPbRcJKzop9Sp2YZ46Oec6yZpsPmtpdldMY+btQ+N60JEhVZT1hSihKhQ6GWbnqwjMXCIPNEr7zBKO3fGqOIG1U7QkXkJven5LPwjkv3sR8Pn4x8UZRzYJEvQ2CFJ+Ck4cZNtUIts1Zco7gC7NFPZsurH1CsVDxCBaImRIzjHS8OzJDwH2s6v5puBmu+4mozA9D9+2v+9lDRUTICyrDSbqI+r/AW4ZdNNe4RqK+jEz7LQYQ39nBOnxL3bKWbxCeyi3xlI8VzMEzuUTWXZxX/wDtqs/gPpR+P5mvWnKouxd0GMRa61joB0s+lMjaWe1TVsmDEmOLpbzY2TRZxUQRwrBfOSZNARXrgstppi7jwpVi910eR9dgL/I2JIsLVEQrtKMyDaeRFoJ6AUKjisk+4aRAVt5Q0uY/MrlzhNnuGmCKZXiVk04ubRw5bCRHTLRZsD9au5Tg87n+2BR/2XSP4khjNG8N5H7bChMIKZWGTA5ZTaBTw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(8936002)(2906002)(6486002)(71200400001)(5660300002)(38070700005)(122000001)(508600001)(31696002)(86362001)(186003)(6512007)(316002)(26005)(2616005)(83380400001)(8676002)(6506007)(4326008)(110136005)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(54906003)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MUF0SnF1azVXYWNVYTBXblBqYmhzNy9RMkpjdlhndjNkcHBiTkF0VkdHTk9o?=
 =?utf-8?B?NnZvREhUZkRsdzNHZWs0R3paSjNNY1dyQW8wUzBpNHo5eDhhS2xudTRmNmVu?=
 =?utf-8?B?Q25SN2pFZFllOGFoTVhxTjZKNjkrcmVjSzVIMmk1aTQ2cWdFLzFFdE5WUElx?=
 =?utf-8?B?UGNaeXNuZTFOdXZrWkNKSFVqempuYnVsUmtOTk9TbVpXRWlrSm5JSGI2ZnQr?=
 =?utf-8?B?SFlUV2hCejN2Z2F0bytnRWo5ODJSb3o5d2tHNW4rSlR4QU5jUmJVd2xlMkls?=
 =?utf-8?B?WmJWVHlTQXo1OGxISG5yMEc4L0hHdHVmS3lzRC9vTVJ2UTN6eFpUY3pnSDkz?=
 =?utf-8?B?eFp3S3hsclIzR0FRNE1ZR240WGxobzdQazRkL25qKzN2eUFndVRFY1JLVnMr?=
 =?utf-8?B?eE8rOS9KZlNVZTA5NjlJOXQ1d1h0clJ0R1pLR0lra3N4UlFqSE51N0FCUDJl?=
 =?utf-8?B?RXhUWlQ4Wk1HVERaK084TG82Y0thdm5IY0J2QXgrUlZHNlJoV05OSkF1WTd2?=
 =?utf-8?B?UzZzRzBMVnljOWVPYjAwK280NGpJSWRvNHNBb2NhbHdEUFkyazVYWVoydGs3?=
 =?utf-8?B?WStSbEErQzkxdUlOejFtTktKMXBzQkIyY1BRczNGMVJUdkI2R2dqL2IycmNx?=
 =?utf-8?B?VDdJR3EvdnkwcmZFQm9IM21yZkVEWVZZSDRWa0d6czZQNm1WNWdIcXk4ZVox?=
 =?utf-8?B?L0lJdUVhK0EyL2ZnMHdJTVRLQ0dTQmU0eWk4RjJuSSs5azY4cS9ZbEtyeXFY?=
 =?utf-8?B?SG9yUzBCWU1pcnVteDBLbUxtOWR1bFRYQzhQcHJoOFN6MmhBS210S0pDejdC?=
 =?utf-8?B?SzlwUU1YN1c2dThrc3lCenZhYlFvMmliVmNaQThTV2p0dk9GNzFYdDVZUnRJ?=
 =?utf-8?B?bWQzdE5teGFlcXpPTTNyZGQ1Rjg4T1hKN3pHU2U5STYzS0IrTXNJc0MrdG1z?=
 =?utf-8?B?STRHdVpSTzBuS0lDSjVDUnZ4RjlTWTdQcEZrSDZ2Z0lPc1F0QjRCTndaODFI?=
 =?utf-8?B?TnNHTXV2N3ArN0FNRk5hZ2NpU242RlpOYll2K0JicmlNVmpia2IvVTdUd3JT?=
 =?utf-8?B?akkxcDZmcWRucWRjV1hIeVcrUEZUS05iam9ESUxEYnJPbVNtNWZpREp4VmI0?=
 =?utf-8?B?eWVPazVMNnlsN21sdUpibFZRZmljWFVIWlVDalhRdWhqV3BWV2tNd0UzMlJX?=
 =?utf-8?B?eS9kZnNJR01kVkZsYUw0M1VObFUwS25VV1h0Sno5MUszQVpjaEJDUG9JVnhm?=
 =?utf-8?B?MXlrNGkwTjRxdnhvcHk0bzNqQ2Y2SDNxRlkzclFLM1hybEZlSzRsYVdIRnNE?=
 =?utf-8?B?bmVDWndiUXVqT0NDcVRacVUxbHRobXFpdWxQWTZ0cmdTc3pMZC9XdVVRVjlj?=
 =?utf-8?B?ZnJKVjBDVE9ySnZ2Witld2xzYUNKd0ptL0dJT0FvMXpwbnJTbHdSeFhkZGgv?=
 =?utf-8?B?cU5OdEJWaCs1NWNwS3daUnJ2S29PU1VDbVJ2R21iQnZSUElKbWFjQmI2UXNr?=
 =?utf-8?B?c0d1enVyQkhkWlVISnZUSzdEQzRoUklOaWdwaXc5MjFZM0hSb1VmN3h2elBt?=
 =?utf-8?B?NzZiRXJNbHozalRySURwanVqYlc3d0dHVitlSlcxakRWd0h3MEZsV0kzWjgr?=
 =?utf-8?B?d0NYYWpHUlFzelcrZ0FrQVZhMXowMERJc3FZNlpoc2Jsd1FBTnVpc2VIMmpp?=
 =?utf-8?B?ZzRuUTBjWlRKS2loekdwenEvdjExeGswU3BxeVpxQVVvU1g2bUhPaWFvNWdV?=
 =?utf-8?B?VzhLbFhScHBqNUR4MnlXOEZqZktZaGgzUUdiU0k0L1k2Q3BwMWJRSnFBcjBM?=
 =?utf-8?B?K0NyWSt3ZmFYeEhVUlpyMDdSN1A0UXh1eUVLaFhjbEhwY09LL0diY3N2QklP?=
 =?utf-8?B?TUJWZndieGpwVXhUNzdqSDJWTjlXdFBHU1ova3BMRldUZkd5cWxSTDRoRkQ4?=
 =?utf-8?B?N3MrVWdHMkpVd0NMY2VITU5EOHBTVzRzazFzeDVoVmc0ZDdTS0VKd1doYVNP?=
 =?utf-8?B?QXgrR29JM2plUUNnb1d0NmNxTmlhUm1wcGpYcXpxQzFsdnlLaTgydVdiVFlG?=
 =?utf-8?B?MUdBWE4yNkozSWhsSXE0bitNUGVKQ09SRTdHK1hFMndPUjM5RVppOXZJZzEr?=
 =?utf-8?B?QnVIYVJZcCtyNXM3cTZPQ3A2bXNkY1VLZGhXREZHd3crYmk2Z1dxL1pwSU5H?=
 =?utf-8?B?bDNMeU5CL1BiVWhIdGxPSTdUTG1VMFdWcUtiM0xtOWdlaExYQWxRWU9zVERm?=
 =?utf-8?B?djF6UkRkdzdoSWwwK1RHa0pMb0dPOWhRR3VSOEhNY2pvcktXRDhiZmRNYjFa?=
 =?utf-8?B?VEdpMktmQ3dTMHQxcUFaOW1nT1RlRklBUWxkTmVTV2FoMWx1TEJkZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D3C63A50744AF45BC08880AF1C14C5A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e128cb-4302-4f11-01a1-08da3d132d25
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2022 23:22:59.7263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z6FiCyfAjUV1I9ZMaY2LXQAHXdrRmDBrN4Ok2wMCuwTBwBsBJi4/otXrKtdTMA+EClE3MtHAQjsN8hR9RoliVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3223
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNClBhdmFuIEtvbmRldGkgd3JvdGU6DQo+IE9uIFRodSwgQXByIDIxLCAyMDIyIGF0IDA3
OjIyOjUwUE0gLTA3MDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4+IFNpbmNlIHdlIGNhbid0IGd1
YXJhbnRlZSB0aGF0IHRoZSBob3N0IHdvbid0IHNlbmQgbmV3IFNldHVwIHBhY2tldA0KPj4gYmVm
b3JlIGdvaW5nIHRocm91Z2ggdGhlIGRldmljZS1pbml0aWF0ZWQgZGlzY29ubmVjdCwgZG9uJ3Qg
cHJlcGFyZQ0KPj4gYmV5b25kIHRoZSBTZXR1cCBzdGFnZSBhbmQga2VlcCB0aGUgZGV2aWNlIGlu
IEVQMF9TRVRVUF9QSEFTRS4gVGhpcw0KPj4gZW5zdXJlcyB0aGF0IHRoZSBkZXZpY2UtaW5pdGF0
ZWQgZGlzY29ubmVjdCBzZXF1ZW5jZSBjYW4gZ28gdGhyb3VnaA0KPj4gZ3JhY2VmdWxseS4gTm90
ZSB0aGF0IHRoZSBjb250cm9sbGVyIHdvbid0IHNlcnZpY2UgdGhlIEVuZCBUcmFuc2Zlcg0KPj4g
Y29tbWFuZCBpZiBpdCBjYW4ndCBETUEgb3V0IHRoZSBTZXR1cCBwYWNrZXQuDQo+Pg0KPj4gU2ln
bmVkLW9mZi1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KPj4g
LS0tDQo+PiAgZHJpdmVycy91c2IvZHdjMy9lcDAuYyAgICB8ICAyICstDQo+PiAgZHJpdmVycy91
c2IvZHdjMy9nYWRnZXQuYyB8IDI5ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+PiAg
MiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkNCj4+DQo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9lcDAuYyBiL2RyaXZlcnMvdXNiL2R3YzMv
ZXAwLmMNCj4+IGluZGV4IDEwNjRiZTU1MThmNi4uYzQ3YzY5NjMxNmRkIDEwMDY0NA0KPj4gLS0t
IGEvZHJpdmVycy91c2IvZHdjMy9lcDAuYw0KPj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9lcDAu
Yw0KPj4gQEAgLTgxMyw3ICs4MTMsNyBAQCBzdGF0aWMgdm9pZCBkd2MzX2VwMF9pbnNwZWN0X3Nl
dHVwKHN0cnVjdCBkd2MzICpkd2MsDQo+PiAgCWludCByZXQgPSAtRUlOVkFMOw0KPj4gIAl1MzIg
bGVuOw0KPj4gIA0KPj4gLQlpZiAoIWR3Yy0+Z2FkZ2V0X2RyaXZlcikNCj4+ICsJaWYgKCFkd2Mt
PmdhZGdldF9kcml2ZXIgfHwgIWR3Yy0+Y29ubmVjdGVkKQ0KPj4gIAkJZ290byBvdXQ7DQo+PiAg
DQo+PiAgCXRyYWNlX2R3YzNfY3RybF9yZXEoY3RybCk7DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy91c2IvZHdjMy9nYWRnZXQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4+IGluZGV4
IGE4NjIyNWRiYWEyYy4uZTVmMDdjMGU4YWQ5IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy91c2Iv
ZHdjMy9nYWRnZXQuYw0KPj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPj4gQEAg
LTI1MDUsNiArMjUwNSwyMyBAQCBzdGF0aWMgaW50IGR3YzNfZ2FkZ2V0X3NvZnRfZGlzY29ubmVj
dChzdHJ1Y3QgZHdjMyAqZHdjKQ0KPj4gIAlzcGluX2xvY2tfaXJxc2F2ZSgmZHdjLT5sb2NrLCBm
bGFncyk7DQo+PiAgCWR3Yy0+Y29ubmVjdGVkID0gZmFsc2U7DQo+PiAgDQo+PiArCS8qDQo+PiAr
CSAqIFBlciBkYXRhYm9vaywgd2hlbiB3ZSB3YW50IHRvIHN0b3AgdGhlIGdhZGdldCwgaWYgYSBj
b250cm9sIHRyYW5zZmVyDQo+PiArCSAqIGlzIHN0aWxsIGluIHByb2Nlc3MsIGNvbXBsZXRlIGl0
IGFuZCBnZXQgdGhlIGNvcmUgaW50byBzZXR1cCBwaGFzZS4NCj4+ICsJICovDQo+PiArCWlmIChk
d2MtPmVwMHN0YXRlICE9IEVQMF9TRVRVUF9QSEFTRSkgew0KPj4gKwkJaW50IHJldDsNCj4+ICsN
Cj4+ICsJCXJlaW5pdF9jb21wbGV0aW9uKCZkd2MtPmVwMF9pbl9zZXR1cCk7DQo+PiArDQo+PiAr
CQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZkd2MtPmxvY2ssIGZsYWdzKTsNCj4+ICsJCXJldCA9
IHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgmZHdjLT5lcDBfaW5fc2V0dXAsDQo+PiArCQkJ
CW1zZWNzX3RvX2ppZmZpZXMoRFdDM19QVUxMX1VQX1RJTUVPVVQpKTsNCj4+ICsJCXNwaW5fbG9j
a19pcnFzYXZlKCZkd2MtPmxvY2ssIGZsYWdzKTsNCj4+ICsJCWlmIChyZXQgPT0gMCkNCj4+ICsJ
CQlkZXZfd2Fybihkd2MtPmRldiwgInRpbWVkIG91dCB3YWl0aW5nIGZvciBTRVRVUCBwaGFzZVxu
Iik7DQo+IA0KPiBEV0MzX1BVTExfVVBfVElNRU9VVCBpcyA1MDAgbXNlYy4gSWYgdGhlIG9uZ29p
bmcgY29udHJvbCB0cmFuc2ZlciBpcyBkZWxheWVkDQo+IChkd2MzOjpkZWxheWVkX3N0YXR1cyks
IGZvciB3aGF0ZXZlciByZWFzb24sIHdvdWxkIHRoZXJlIGJlIGEgcHJvYmxlbT8NCj4gDQoNClNv
cnJ5IGZvciB0aGUgZGVsYXllZCByZXNwb25zZS4gSSB3YXMgYXdheS4NCg0KSWYgdGhlIGNvbnRy
b2wgdHJhbnNmZXIgdGFrZXMgbG9uZ2VyIHRoYW4gNTAwbXMsIHRoZW4gd2UnZCBnZXQgdGhpcw0K
dGltZWQgb3V0IHdhcm5pbmcuIEhvd2V2ZXIsIGl0IHNob3VsZCBiZSBmaW5lIGJlY2F1c2UNCg0K
MSkgSWYgdGhlIGZ1bmN0aW9uIGRyaXZlciBoYXNuJ3Qgc2VudCB0aGUgc3RhdHVzLCB0aGVuIHRo
ZSBob3N0IHdvbid0IGJlDQpzZW5kaW5nIGEgbmV3IFNFVFVQIHBhY2tldC4NCg0KMikgSWYgdGhl
IGRlbGF5ZWQgc3RhdHVzIHdhcyBzZW50IGFuZCBjb21wbGV0ZWQgaW1tZWRpYXRlbHkgYWZ0ZXIg
dGhlDQp0aW1lb3V0IGJ1dCBiZWZvcmUgdGhlIGR3YzNfZ2FkZ2V0X3NvZnRfZGlzY29ubmVjdCBo
b2xkaW5nIHRoZQ0Kc3Bpbl9sb2NrLCB0aGVuIHdlIG1heSBzZWUgRW5kIFRyYW5zZmVyIGNvbW1h
bmQgdGltZW91dC4gSXQgbWF5IG5vdCBsb29rDQpsaWtlIHRoZSBjbGVhbnVwIHdhcyBkb25lIGdy
YWNlZnVsbHksIGJ1dCB0aGF0IHNob3VsZCBiZSBmaW5lLiBUaGUNCmNvbW1hbmQgc2hvdWxkIGJl
IGFibGUgdG8gY29tcGxldGUgb25jZSB0aGUgc3Bpbl9sb2NrIGlzIHJlbGVhc2VkIGFuZA0KU2V0
dXAgcGFja2V0IGhhbmRsZWQuIFRoZSBjb250cm9sbGVyIHNob3VsZCBoYWx0IHdpdGhpbiB0aGUg
cG9sbGluZyBwZXJpb2QuDQoNCjMpIElmIHRoZSBob3N0IG1pc2JlaGF2ZXMgYW5kIGlnbm9yZXMg
dGhlIHN0YXR1cyBzdGFnZS9hYm9ydCB0aGUgY29udHJvbA0KdHJhbnNmZXIgdG8gc2VuZCBhIG5l
dyBzZXR1cCBwYWNrZXQsIEkgZG9uJ3QgdGhpbmsgdGhlIGN1cnJlbnQgZHdjMw0KZHJpdmVyIGhh
bmRsZXMgdGhhdCBjYXNlIHByb3Blcmx5LiBCdXQgdGhhdCBzaG91bGQgYmUgZm9yIGEgc2VwYXJh
dGUNCnBhdGNoIGZpeC4NCg0KQlIsDQpUaGluaA0K
