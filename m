Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D32D131F508
	for <lists+linux-usb@lfdr.de>; Fri, 19 Feb 2021 07:14:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbhBSGNQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Feb 2021 01:13:16 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:56404 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229689AbhBSGNO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Feb 2021 01:13:14 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 358144004D;
        Fri, 19 Feb 2021 06:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1613715133; bh=BOJvWSVg9VOpfMJ96LhQUhrE/9ErJWlvIQoMjR3MKX8=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=DMjSaXJvL3qEWHvHLHz3UvFOOsk4MgLomrNmkTknmE6wZpghPxPFOeLXIPeWXqKuh
         gLEJIEBAyePIPBivr0W3GoUr5ESK5ZnHfdaGmHl5YLz3E16nzO4OlPqTO33fJDAtpJ
         DXxi/VGuCJwFxQkypBoNBkNGK/mO8Mhmc6cyV0JV+wGvXtZHhjSm2Pwo5WKr7vB8dL
         5F0ArKxmk/hQ0EGPHQAGXdfqSx66/d0zVp0W5hXwurJzQntdXu0zzcB613xSUaYPTg
         46MfpmjmG0H+OY9gVV8ApRiY4RyBfiUkLUXVHnSC69jIVTWji10VPRt3ZH8kUpK59r
         pXZRhsTM7L5xQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id F1F2DA0069;
        Fri, 19 Feb 2021 06:12:12 +0000 (UTC)
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (mail-cys01nam02lp2052.outbound.protection.outlook.com [104.47.37.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7FDBA800C6;
        Fri, 19 Feb 2021 06:12:12 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="docDafwP";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YS6EXamwzETH//EMll10/UofpHPtMQDksqzEP5GAavS2hazmA6k9ywsoxe90K1e+nemftQIaE2MHAI7IdhM+Jl4emlPvpe1/+GLyvPKBf/a/DYNU77zlLgV0IKptE5ZqlYcIRKloSRqstm/CGwIGGd2fCVXItTa6f0BCgUsYoHTxIHcSHr4/uqs7Jg0pLNLluoGdkDbHSLZ09dMLNn/bjjyhQLgPRfaYSeAQmpfruNGutUKdPTOKybOUfH8I0MsLvQIHG4uo65P6RqpIrLvZgWdBNk/J6RH6K8kUh/PHbf1op5sOCZFgOmrnVErelyQcZoZlwJQMCKcwwaIG3jEXng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOJvWSVg9VOpfMJ96LhQUhrE/9ErJWlvIQoMjR3MKX8=;
 b=nMIFYvNkkZf80Lig2yfTMh/B5nZjuqm/DKpS+AXpoCtRO8KgrB2uZ+nKasYJ7Dwe12/ilO5ULjABYHi98t1wbQ1oO++mKQF+8R1EcT7U82pYyzYrMs8TfeeV6ZjZAxLPyfrLvj88unYFMebXLlPDsqpVzYQ1Cfa2Z3bxHzAEZCci3Lfr0uecYJistogJYW3NjAE4sLbiGuKbMHkdQv8xL8ooURoeLJFPDwlF+hib4ufnPTzxE/N+1YvRcl7S1EcKZ76OzmEqCPktN5Cd+wnMsJ9a8Y5VhSVSrPE8Ox4etpRmkUSi1nmz4NhM3NKT3z9deb7ljyXRdnrpBbSBTApylg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOJvWSVg9VOpfMJ96LhQUhrE/9ErJWlvIQoMjR3MKX8=;
 b=docDafwPCkhXMjdXrVZCSVAcBmeg2RsXCPZ9U+dlV7vcVmuhHJ4K7fDmt2kmsifuDAkOzBJSjEFTHfQjmtD0SG49rq0A8NfQ10FUok8jt3fLHho/OUV2dKnhlHjqRBqgiY5DWf5MnczaE3GgxMuxSnLnPaELCaGaJG6bAvw7gdg=
Received: from BY5PR12MB3777.namprd12.prod.outlook.com (2603:10b6:a03:1a9::14)
 by BY5PR12MB3796.namprd12.prod.outlook.com (2603:10b6:a03:1ae::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Fri, 19 Feb
 2021 06:12:10 +0000
Received: from BY5PR12MB3777.namprd12.prod.outlook.com
 ([fe80::e9e5:66f2:5a15:8c1c]) by BY5PR12MB3777.namprd12.prod.outlook.com
 ([fe80::e9e5:66f2:5a15:8c1c%7]) with mapi id 15.20.3846.039; Fri, 19 Feb 2021
 06:12:10 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Christopher Morgan <macromorgan@hotmail.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: Re: dwc2 Resume From Suspend Devices Not Working
Thread-Topic: dwc2 Resume From Suspend Devices Not Working
Thread-Index: AQHW/8G5S/5Vy/RWk0CnibCOl0UnxapSztwAgABMACCAACiWAIAAMR5AgArHnd+AANCfAA==
Date:   Fri, 19 Feb 2021 06:12:10 +0000
Message-ID: <9f251e7a-4072-05fd-da58-082cbb056e97@synopsys.com>
References: <SN6PR06MB53423E9042B01FFF2531D47FA58D9@SN6PR06MB5342.namprd06.prod.outlook.com>
 <5b0b7237-1bd3-d712-5e76-c877b2a2a91c@synopsys.com>
 <SN6PR06MB5342386D6344C41076C0B119A58C9@SN6PR06MB5342.namprd06.prod.outlook.com>
 <33cf1dbf-5e0e-a936-9c89-1f05774de979@synopsys.com>
 <SN6PR06MB5342E45F59EA7E94B9DE82DFA58C9@SN6PR06MB5342.namprd06.prod.outlook.com>
 <SN6PR06MB5342730D33FF3BBF0DD5ED79A5859@SN6PR06MB5342.namprd06.prod.outlook.com>
In-Reply-To: <SN6PR06MB5342730D33FF3BBF0DD5ED79A5859@SN6PR06MB5342.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
authentication-results: hotmail.com; dkim=none (message not signed)
 header.d=none;hotmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [37.252.95.223]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6241e8d-1a26-444c-f7d0-08d8d49d4b2e
x-ms-traffictypediagnostic: BY5PR12MB3796:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB379657CBA70D2E5858F09E89A7849@BY5PR12MB3796.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4ATolMNyxDJFmsTu1zQu4ybzobjPaXTP5i+MLyfq3aFUJ0RD94CozEy5mGBdO4fa91lFjzZ4H5INahMxHuQRO5O3DXCsHWKKCSmFOFdvuvHh/rOOoKLY5xRlrKt9SUQJ+8jBrEUOqPs0S8CuJdMcUO4Y2+MMyVyeJauXbQn7Av2/SF2HHZvkA6vrCxthXoi7RldKhnUEAudIq2sQgnDg7E379WGRf203jz2ggr+oLs+JdiyoE1jq43P/gMoSESgeTRe9/59sUhFQgHmnE0pmARgdNv3CLkTNCRM2w7SpCnROWwgCUBFS8NGY3ES6GjbcSojFmcX9rAg3KL60gfd5OOq9RRrERO5wtMKaZNaP5bI1Ntf68zIC1iY4vldF+b0k/dw/nmBIBQwc+sNk4SdeIrOTLURFxMmdffqrk1uA3veyPknERpNyb06uMVtSVL6Ni9oNhf30zrZMBHIvXpVEIG1ks/JEyqm9QKBkWbfs5qc4fbqeuEGfzQlgFF6LYJaOal6Cxf1PMCicumUpSvfNr07DalTyJXe6PWCG9M4Evck3H3AxANVFjU65+kI0AFD28X2Z9LePjIdHFjs6LAaVOGRCBMxXQgsbbkiSOeBmt7Fad06/mAxhB9TOmJyZ+Z59lKUHrNKLOOsXmrvWAn1rmYBT9vNYreFTZbZud+J427gJYbsCr/oFXHZGfUW5aNQp
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB3777.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(136003)(39860400002)(376002)(366004)(8676002)(31686004)(66446008)(36756003)(31696002)(15650500001)(86362001)(66556008)(2906002)(110136005)(83380400001)(71200400001)(6636002)(26005)(76116006)(8936002)(66476007)(6512007)(91956017)(2616005)(64756008)(53546011)(6486002)(6506007)(478600001)(316002)(5660300002)(66946007)(4744005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?nuzwJnpdwNZHnXENja69MeFaK6NC6jDA2wzAgxAN3i2JsB8IK9HQzsj+?=
 =?Windows-1252?Q?9mOC6PMMoQORTRfTqPnCSHkfL0G7HJ0CmrJh+aYW0W46NR8x92U0h1YE?=
 =?Windows-1252?Q?QityoMi4SlS3FBw45CDvae6i10qZspmVaRPCndttW12RDJh2yCVUmJ1z?=
 =?Windows-1252?Q?I6MBqk2lMyng1G9aojXklzXHFA9nRzjBJDAYACgz8QybNwXlS5LPVaeX?=
 =?Windows-1252?Q?JuMgXkzS0PxnUT9l/QdoCmid+jzpjEuDGdm8zxG1OwSC/Iph+T9n4K5P?=
 =?Windows-1252?Q?TEPJgHT6ZlOj7KBH3UnXKiUXxcZGRJybsXDy2py5AKoj9x5j9nSrgM4n?=
 =?Windows-1252?Q?o1qkpRkFy2JQGD/8kULkzoAzdN9sB1XBDbf2D7EKxMYNPd3rbqGu6Ih0?=
 =?Windows-1252?Q?p6GGcWb9F+D35Fqjd2FUXH3zXrdR5TQSSjZ5BKWPEJcfVn+mcLA5D7aj?=
 =?Windows-1252?Q?yGL0wRVl4YWAa6Bug+oXsDC6tWt33BlJdYXuPGQC9fI8n/XkzJkSH1Wy?=
 =?Windows-1252?Q?mcPSaxmFj+BjzN/D+V07xO3tBQp/i7SOgZdfioUxVrI9JoR9PlfK2aSQ?=
 =?Windows-1252?Q?UtuJB0CTGUvkfKL7vsUEe6ZkXTzBiFwtL8Xo44JPP8cRYZHzSnDbylla?=
 =?Windows-1252?Q?Nn9apIWaDtIJmPtMEZlr0KN8Z7s8JBXxOS89mvILrvaf7CdeL3XWX61L?=
 =?Windows-1252?Q?TJXOJ/Nmp2Ck80ngfVmW43wJpT5uoX4wthS9+wvnRTdC9lpZtD8dWjNr?=
 =?Windows-1252?Q?rOEVdSm1zR5UX/U/gNOJIbDsRZU7N/PcjlXbjqW6AzONY7apGr+IClD4?=
 =?Windows-1252?Q?DIMejsWtWQfZWN+O1VX1gNtEl6p+C0Q8fxi00vzJLNoREwEkqeGq6Fht?=
 =?Windows-1252?Q?SJGIBSwpJInT1boE3e+MH3ON2+VrOkGq8vHa6qQapS/TNPLGEwAN+21a?=
 =?Windows-1252?Q?WthOWbzIQ6yj9Zj6M9Z8It8hlJ/XBhCYXQodJ5fSnkTS2f9U9WjnT6N6?=
 =?Windows-1252?Q?L+6YLywqfEdLxX4ewgFc2wtxDbkA49tKtAntc32scnU/cb3bcJBZhINT?=
 =?Windows-1252?Q?ECe5CEUxbCA8KNoKdan+mCDHgIKI55x3/vYJ3vnXzplsBLd8egO7xOKt?=
 =?Windows-1252?Q?xLugwNqHWnru4u4BmAZ9XeFXWUgSOeN2tbeFQDW/bk8DhYjnmjtC2AaJ?=
 =?Windows-1252?Q?wFFkNo1t3M6bG/o+LMdJ7feY0CnRWC9YCDy7tyTYDry9/mH/Vigw1sP0?=
 =?Windows-1252?Q?BdVEqGM2qNuXwGl5AtOq4ujViL9NU/VHXKKd4EBYkokiXrRdkxRmE2KP?=
 =?Windows-1252?Q?azzmOQD14LvpVnmIuF/BxfYgZJK6zTaocQm+mksw4ghRR5j2u49MKZ0a?=
 =?Windows-1252?Q?T0WkO8CLlZ2/FsfOxtqAmuqWXsMkKgzVNNc=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <575CBB82D4F55D4CBB4298D7DDB9DCA4@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3777.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6241e8d-1a26-444c-f7d0-08d8d49d4b2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2021 06:12:10.8878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bQNf8h1MRSFwis686O6tXvfk0PMWSHfrh4ojL8kMJrB5uQLWJaUjyZmKIKHpVuHclm2007RUTwYJeRwyf5aE6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3796
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We was able to repoduce issue on our side and prepare fix. Currently it=20
passing internal review and testing. Soon Artur will submit it to lkml.

Thanks,
Minas


On 2/18/2021 9:46 PM, Christopher Morgan wrote:
> I found this patch (a hack) and applied it to my local branch.=A0 For=20
> whatever reason suspend/resume works now.=A0 I don=92t fully understand w=
hy=20
> though, but it looks like maybe it disconnects the device before=20
> suspend/reconnects the device after suspend?
>=20
> Original Patch Found: dwc2 suspend fix =B7 valadaa48/linux@8548753=20
> (github.com)=20
> <https://urldefense.com/v3/__https://github.com/valadaa48/linux/commit/85=
4875353930acbeed806b289e3933d38f436807__;!!A4F2R9G_pg!KPXHhAI2GMs2_WpEWgkxB=
U-ZtW0qIckCagmXZwKSLxOuaSIar5CQtht4Z7i4F3rvvlKw7iUY$>
>=20
> My application against 5.10: Fix suspend issues for USB. =B7=20
> macromorgan/odroid_go_advance_linux_android@f780117 (github.com)=20
> <https://urldefense.com/v3/__https://github.com/macromorgan/odroid_go_adv=
ance_linux_android/commit/f7801176f76bdb140b24605c9f19419a31c9d348__;!!A4F2=
R9G_pg!KPXHhAI2GMs2_WpEWgkxBU-ZtW0qIckCagmXZwKSLxOuaSIar5CQtht4Z7i4F3rvvhjC=
qmi5$>
>=20
> *From: *Christopher Morgan <mailto:macromorgan@hotmail.com>
> *Sent: *Thursday, February 11, 2021 3:31 PM
> *To: *Minas Harutyunyan <mailto:Minas.Harutyunyan@synopsys.com>;=20
> linux-usb@vger.kernel.org <mailto:linux-usb@vger.kernel.org>
> *Subject: *RE: dwc2 Resume From Suspend Devices Not Working
>=20
