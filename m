Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1494E531F2F
	for <lists+linux-usb@lfdr.de>; Tue, 24 May 2022 01:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbiEWXXg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 May 2022 19:23:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbiEWXXf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 May 2022 19:23:35 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 411CE6C56A
        for <linux-usb@vger.kernel.org>; Mon, 23 May 2022 16:23:31 -0700 (PDT)
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E62E7C08B9;
        Mon, 23 May 2022 23:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1653348211; bh=lPMjLQkZ15NupRS7ehcKB02l534APnVEscrYfYx2h28=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=QFQYs3LhHvvq/M82DauSMT51QJR3fVV9y5yvxAXEsO3G9H+HtQuWD0AgY2yesnsjK
         VbZFqPUhWtHYY0TE5BIIlUF+Wk5UI7l9mjop7FFSbs1NpQlvP3M76kU25XvOAkavGp
         +aAP7Xi/4+fbRi+sSilUqLlMmRu0IGg+IfyRZffuX0s44gW/Cv6Y272gpvjvdZjVI7
         M/2KEEKENtqiMAydosTainrvWrWgPCh21CNKu2FNd00bqSL5FSYFB539dK+aLM7uoW
         lqqOK0/XvRwRNnplwrOg3NzTewKvpRQGozs7Z8SBXQdoHQUuHCQxOZOAC7W/eQ6qRg
         uO9s7VRVgPGfQ==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 4FC84A006F;
        Mon, 23 May 2022 23:23:29 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id AE1B7800CA;
        Mon, 23 May 2022 23:23:29 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="vw4/Na5/";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7ZlEaASPZkMHO/KnNnq7h++5Z+nmpdiIzQtJl+2wFI90ZPVwIaucpaiDyCXQgZGTOdJYfyxdequ/ljqArZNHrXV79q77WjCC2gqNO3aZym/XdaangmTcdZpxVNIntSFINNaspktJJHbPY7VN6xB6wOhWRIBaWYNBpc9nWzINO0sfLHaGuuXiGCePAt7n520bmObgbi9dU65GbfUCIdo4VmmRalivsEI3+uu67k7qqVpU4NytuMLYbE9W6cepiOsn7aohL2NzwQRMU1TePScACmPwq+kvnLoVudtHWu3fpJzmF/QO83eYYJmgU+CmJ9MxbPgcHSbgFG2cVpjHxTB+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPMjLQkZ15NupRS7ehcKB02l534APnVEscrYfYx2h28=;
 b=QEEflSakmSGk6Yd6zxV7gMUcoqw+MiC77R9odjEFbuSS+vXgHQgScWLbd3EMQYYtf+psc+qktpVz6s2Iy9u50ukGS/eQ9vL44GhNZRaZf6N7XJjIS5iG6Z9J3XIgSHjlOHgoqLDvTlwsoKvRaQYCVzV6SIwQFWQERog7qS1mTDJQon3vmGDkLpd/RsTU8sa/OvzEdNx9uaf05WNZfWzWNVh9FOCLrBFpLZwdlnPjOmaiIW2C2g7NWXPJ0zLLbdprxACDNIM3GfSAon7h4P6nSI93XHIPqytfmup/qglFXn6uTSHt0B4Q8zOWy/8aRPQC1W1PmXU5MNa/mNH19Dsn3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPMjLQkZ15NupRS7ehcKB02l534APnVEscrYfYx2h28=;
 b=vw4/Na5/8jLzeXyibZi3W9G7U6hFvLkJnHRjFwdodHRd9qYQJ+MePtZzvIa/RTrmXpDvNVOVdl1o4mNt/XnDtF3zF5VM3sUHLufoRYsaTVPVBWlIkmW3nkVGka8KZUigJ9L1WYntaXEzllTgR/iIqKbnZwxWBeedystP6Jyq9Ts=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB3223.namprd12.prod.outlook.com (2603:10b6:a03:138::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.18; Mon, 23 May
 2022 23:23:27 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::91c7:7e6b:d663:a349]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::91c7:7e6b:d663:a349%7]) with mapi id 15.20.5273.023; Mon, 23 May 2022
 23:23:27 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Pavan Kondeti <quic_pkondeti@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH 6/6] usb: dwc3: gadget: Delay issuing End Transfer
Thread-Topic: [PATCH 6/6] usb: dwc3: gadget: Delay issuing End Transfer
Thread-Index: AQHYVe/n8VwiImGRQkCcSNY32gMIGq0NEX+AgCA61QA=
Date:   Mon, 23 May 2022 23:23:27 +0000
Message-ID: <9eca657f-02a3-346c-f070-1d111d484515@synopsys.com>
References: <cover.1650593829.git.Thinh.Nguyen@synopsys.com>
 <2fcf3b5d90068d549589a57a27a79f76c6769b04.1650593829.git.Thinh.Nguyen@synopsys.com>
 <20220503111233.GB21427@hu-pkondeti-hyd.qualcomm.com>
In-Reply-To: <20220503111233.GB21427@hu-pkondeti-hyd.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09c26923-491f-48e2-e24f-08da3d133da7
x-ms-traffictypediagnostic: BYAPR12MB3223:EE_
x-microsoft-antispam-prvs: <BYAPR12MB32231833FC72FB53D7747213AAD49@BYAPR12MB3223.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sVbBohPZttMg5pK0revT0JtBILoNcFHD/Y3sbkt+bKfy28cEvozTRLOLK5shvtxMDnb7wIjS+L3Y7ZKtboZDL51w9y06Ad3G4oU6J+rwIlfxqcEaj5nVKcuO4cUFN9CyjfDLM9vUoUcZpFZw0+7N7iZ16yqv/ilDSYGkHSqiQT8nuEHfUZW28wPVx6if+AjGPfVgUqssXMj3o2CsrgmFZqEFxlPyct/ICbVEUIpnRUGo9TiH4nHCBca+Vyj0vSxodbaiPt3QKmTUyYUIAxO/fUhI75Bp5IQuE/GbEWiHGeiIo/txk/POArX+QWMrkXeEEd45wfDJFGyp/CcdKTnvHWnZ7y1h5EPyB0r4sEQEsEsjwhmNSTWBsAXUZR8Jz2wI9snFpoBBKWLcuJR5KvgcDAw4YpsqfvxHL406dj2UTNHgVI/ANqOXvqbAfsEa60rex+a5z/quE5kxyrxLVdxlL1Bl00hAgoFmBZcPGVf8ksuO38Kj9Hhd7WFp+bJFz1L/KYFiPFQtmVp3xUE3qZP5EsitLdv+zQZ2fGPSQRUUH2vUWycLp4+EBuVtlx+JT9BrEexH/XgEnZ1J691fVql1U0F/mLBmhnQ3kA2C8hRN7lyhgfvAuujcUL+73DU26Aq1tFlHQ+jqhMk0PHeAAY/dvlxG2SU6qSgXbFUG8gvfAHcslXD/s3Uy0c125bxTlNiVjYAjObXiFQ38MQ7GU/YaqAfW7eAdCAreamNQiYxpYh2hY85NlewUQ8EJvMvXSGCSPvy91csXGqDWho08AgtNOQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(8936002)(2906002)(6486002)(71200400001)(5660300002)(38070700005)(122000001)(508600001)(31696002)(86362001)(186003)(6512007)(316002)(26005)(2616005)(83380400001)(8676002)(6506007)(4326008)(110136005)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(54906003)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFo2VkNCYmFCcFo3b1J5ampMWGNmanFEbG1GYW1iTVpmQlBOL1I2MldnVjh5?=
 =?utf-8?B?YkJhampDOFFXWGF1M244eThacVF0UDYrbUQ1QUUvM0lSNEVLOVlnNVN2NjBG?=
 =?utf-8?B?RlZ1TFhkOXZ4eWpKOS9UemlkaFRmLzRJcVVEOHhidXA2M0pJZWl1clhHeVJO?=
 =?utf-8?B?NUhRK0F3SWh3NXl4dnJma3NhNVFmY1JzamtQU2FpZFNUbXI3OG1WNzFSdWFL?=
 =?utf-8?B?aUlOV1c2N2EvVXJCSHdjeHdDYWFlTzQ3TEJqQU5leVNvMHN0YUJKYkNkOTRM?=
 =?utf-8?B?M08xc0k2NUZDeTB4VldUZW9TbXMwSHJLY1A0Sld5Y05SRWw5SVZ6VVZlQUtL?=
 =?utf-8?B?SHJYMzloVWVaMHhvRGJ4bU5NTW9pSGU5aVNYSjVuamFrSnFmbExKVGpJQ1Qx?=
 =?utf-8?B?THdSWWJKcEgwOVBmdHBMVnVNYjJDZkNuV2ppK3Z3dHM5V2k2ZTQraDlyNzNV?=
 =?utf-8?B?NXFDMXdxbDYyNXpCSjNoU0ZDY0JRMnBPbFlJZFNEM1E3bmJKOHhTL1lpYUpY?=
 =?utf-8?B?eXpkYnV0R0lkc09oalExMEw0Y0pveGJDM1gwTTZXelBMcVc3RUJkU2VZcjB3?=
 =?utf-8?B?c3Q4b3pnWktadmNBa3JYY2tjbTZrS1JCTFhKSDRnTllsNEhaM1NZeEVJUUpO?=
 =?utf-8?B?eGVtcUg1UFRNS01NMGNyRXRqWW9pUTFyYXNHd0dSUUlSajJLSFVDLzVrM1VM?=
 =?utf-8?B?YU85VzIvaUg2WHVrN2JkMDBJQmlSYVJkV2tSL2M4eHI4OW91VTVnUUwxdmxQ?=
 =?utf-8?B?eDNteUd3enhyQk80NUNmUHdwa2NjVWFKYVB4dFhNZGsrWDNoejFGbTNKci83?=
 =?utf-8?B?M3VubEgzTlIvbnJydUh1dXpJMVZ1c3QvaTlpZEZLUHFKK2JncWZsMktWUW52?=
 =?utf-8?B?d05tUE8rTEYrSWtnVmxONnFLMzdySFlucVJRMzBBbFM2b0tzUTZtTXh1RGdx?=
 =?utf-8?B?aFZDdkVOc1gvYXVsaXU5VXprd08xK0JrZjF0U3RpRC9JeWV5YkVBYng1ZGVL?=
 =?utf-8?B?dnkvWDlRclVaMld4ZUEyS3FHR28rbXNkOGtXRXRiMjFueFNGT3JvS0F3cFBu?=
 =?utf-8?B?c212bm1CVnV0ZU0wZ3VFVUNCZDQyY0VvRUxIOGtCZFNiUWhqR1dWRXEzUE4x?=
 =?utf-8?B?RkhJckNQaUgwSlJGV1Rlc2hWLzNCMEZCSDNtT1pHaDJHcFZrQk5EVHdETUln?=
 =?utf-8?B?MUorQVZLV3lzWjNlWVNQQlRGVmZYajdyVGVTUHUvdFkreUcvdk9wdWRSMUJq?=
 =?utf-8?B?YXpCVTliRW5DdlY4N1ZxeDBlamdJQ3JqVHNBV0x3T1ltQUQ0NkxLT1BYVlRp?=
 =?utf-8?B?aHd0d09LNGRQVWQ3emV5WGk2dlpGRit5MXRzNUJQWDFqMXhjZC9SSVovaklP?=
 =?utf-8?B?NDNvMEN5bTlEbWRmNW1XakJ1Q25rVVVueG5kSHpCbVZqUnlBNkFwSE9qZGNP?=
 =?utf-8?B?U2FaQzIreDh6TER6TFNaK3JqU2NnbTNXeGlHUVNQWDdwS011eG9HcGI4Vi95?=
 =?utf-8?B?MUUvb2VsdXRaM0czd3dHS3oxWW16M0h0VnpLWm04ZnYrcVNZcUVBeWN2aGRU?=
 =?utf-8?B?bEVzWURYbzNxN241Yy9SZ1JwT2pwTlJ6VVdNU29hb2ROUlNXbE9HWkhaNnBM?=
 =?utf-8?B?Mys5R2tSR3ZMSS9FZU1TKzJVSE9sS1hkZEl0M0ltVWNpN29zQWJuS0FpOUJU?=
 =?utf-8?B?QldYVUVKTkRhY2pZRHR2MHRKRVRpVzJwQjllajA1S1BLZnVoNUZhcmUrSDVo?=
 =?utf-8?B?TW05ekt5Ky9TUkVORnF5RE54MUs5bjkyQ3hoSDkyczFqT1UzSzNUa0RHdENI?=
 =?utf-8?B?RXZ1anBtb2xwMzJBRGRQVWppU21oSkR3c05CVExUUFpBQUh6eW9rYU1Dc3ov?=
 =?utf-8?B?VnVQSFRrWURCbldsNy93M2ZSRFBmVkpNNjQ5cVd3d1JpcG9yQmVKcmVXd2ZC?=
 =?utf-8?B?NWp2anFsdWR0THhrdTd3d0phSzhaQ1MzRDZrb2E4a0xMekxuc1laY3NJNkho?=
 =?utf-8?B?Z3l6b3Z3Um9EN3lLM0czaTU0cm5xWmFKY3oxWnU0TUJFRDBQU1Z1R0hhaUxy?=
 =?utf-8?B?Y25TYXdGWTNEc3hOU3lJY3NwK1dTUWJEYWNDVnVtMmdkT21Kb1lwakNaSDND?=
 =?utf-8?B?QmtRYm5wREtGK2I2WVRIZ2FJQWZnbFFaRExtOHl2M3NEcXJpR2oyeXNucTlo?=
 =?utf-8?B?T0JneXZDVVJ5L1BKVWNpVjI1RWZDL1dNcU54SXlua3VWRmZZM2FuL0hTTjRT?=
 =?utf-8?B?a3J5YlU0MHgrcGZTK0YyelBGdEFiZERiMWpGK01ZekdBRlp0bS9XdlU2WmJQ?=
 =?utf-8?B?MUZJc0tZUUFRV1I0NUhiNjN1c0VBM2JEN1JwSHQzVC9IQVArc3NIQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0825834B3192743B8E7B34EE74FC9D9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c26923-491f-48e2-e24f-08da3d133da7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2022 23:23:27.3963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1SeJbyxqMGVi149/IiBkToAnBVMlAfAcfYjDOEzDj36osFxFy9GFu8Tt548tt0sZT5IUAMfH09CB/5KA7wEWAQ==
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

UGF2YW4gS29uZGV0aSB3cm90ZToNCj4gT24gVGh1LCBBcHIgMjEsIDIwMjIgYXQgMDc6MjM6MDNQ
TSAtMDcwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPj4gSWYgdGhlIGNvbnRyb2xsZXIgaGFzbid0
IERNQSdlZCB0aGUgU2V0dXAgZGF0YSBmcm9tIGl0cyBmaWZvLCBpdCB3b24ndA0KPj4gcHJvY2Vz
cyB0aGUgRW5kIFRyYW5zZmVyIGNvbW1hbmQuIFBvbGxpbmcgZm9yIHRoZSBjb21tYW5kIGNvbXBs
ZXRpb24gbWF5DQo+PiBibG9jayB0aGUgZHJpdmVyIGZyb20gc2VydmljaW5nIHRoZSBTZXR1cCBw
aGFzZSBhbmQgY2F1c2UgYSB0aW1lb3V0Lg0KPj4gUHJldmlvdXNseSB3ZSBvbmx5IGNoZWNrIGFu
ZCBkZWxheSBpc3N1aW5nIEVuZCBUcmFuc2ZlciBpbiB0aGUgY2FzZSBvZg0KPj4gZW5kcG9pbnQg
ZGVxdWV1ZS4gTGV0J3MgZG8gdGhhdCBmb3IgYWxsIEVuZCBUcmFuc2ZlciBzY2VuYXJpb3MuDQo+
Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMu
Y29tPg0KPj4gLS0tDQo+PiAgZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyB8IDIyICsrKysrKysr
KysrKy0tLS0tLS0tLS0NCj4+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTAg
ZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0
LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+PiBpbmRleCA3YzRkNWY2NzE2ODcuLmYw
ZmQ3YzMyODI4YiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4+
ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4+IEBAIC0yMDU2LDE2ICsyMDU2LDYg
QEAgc3RhdGljIGludCBkd2MzX2dhZGdldF9lcF9kZXF1ZXVlKHN0cnVjdCB1c2JfZXAgKmVwLA0K
Pj4gIAkJaWYgKHIgPT0gcmVxKSB7DQo+PiAgCQkJc3RydWN0IGR3YzNfcmVxdWVzdCAqdDsNCj4+
ICANCj4+IC0JCQkvKg0KPj4gLQkJCSAqIElmIGEgU2V0dXAgcGFja2V0IGlzIHJlY2VpdmVkIGJ1
dCB5ZXQgdG8gRE1BIG91dCwgdGhlIGNvbnRyb2xsZXIgd2lsbA0KPj4gLQkJCSAqIG5vdCBwcm9j
ZXNzIHRoZSBFbmQgVHJhbnNmZXIgY29tbWFuZCBvZiBhbnkgZW5kcG9pbnQuIFBvbGxpbmcgb2Yg
aXRzDQo+PiAtCQkJICogREVQQ01ELkNtZEFjdCBtYXkgYmxvY2sgc2V0dGluZyB1cCBUUkIgZm9y
IFNldHVwIHBhY2tldCwgY2F1c2luZyBhDQo+PiAtCQkJICogdGltZW91dC4gRGVsYXkgaXNzdWlu
ZyB0aGUgRW5kIFRyYW5zZmVyIGNvbW1hbmQgdW50aWwgdGhlIFNldHVwIFRSQiBpcw0KPj4gLQkJ
CSAqIHByZXBhcmVkLg0KPj4gLQkJCSAqLw0KPj4gLQkJCWlmIChkd2MtPmVwMHN0YXRlICE9IEVQ
MF9TRVRVUF9QSEFTRSAmJiAhZHdjLT5kZWxheWVkX3N0YXR1cykNCj4+IC0JCQkJZGVwLT5mbGFn
cyB8PSBEV0MzX0VQX0RFTEFZX1NUT1A7DQo+PiAtDQo+PiAgCQkJLyogd2FpdCB1bnRpbCBpdCBp
cyBwcm9jZXNzZWQgKi8NCj4+ICAJCQlkd2MzX3N0b3BfYWN0aXZlX3RyYW5zZmVyKGRlcCwgdHJ1
ZSwgdHJ1ZSk7DQo+PiAgDQo+PiBAQCAtMzY1Nyw2ICszNjQ3LDE4IEBAIHZvaWQgZHdjM19zdG9w
X2FjdGl2ZV90cmFuc2ZlcihzdHJ1Y3QgZHdjM19lcCAqZGVwLCBib29sIGZvcmNlLA0KPj4gIAkg
ICAgKGRlcC0+ZmxhZ3MgJiBEV0MzX0VQX0VORF9UUkFOU0ZFUl9QRU5ESU5HKSkNCj4+ICAJCXJl
dHVybjsNCj4+ICANCj4+ICsJLyoNCj4+ICsJICogSWYgYSBTZXR1cCBwYWNrZXQgaXMgcmVjZWl2
ZWQgYnV0IHlldCB0byBETUEgb3V0LCB0aGUgY29udHJvbGxlciB3aWxsDQo+PiArCSAqIG5vdCBw
cm9jZXNzIHRoZSBFbmQgVHJhbnNmZXIgY29tbWFuZCBvZiBhbnkgZW5kcG9pbnQuIFBvbGxpbmcg
b2YgaXRzDQo+PiArCSAqIERFUENNRC5DbWRBY3QgbWF5IGJsb2NrIHNldHRpbmcgdXAgVFJCIGZv
ciBTZXR1cCBwYWNrZXQsIGNhdXNpbmcgYQ0KPj4gKwkgKiB0aW1lb3V0LiBEZWxheSBpc3N1aW5n
IHRoZSBFbmQgVHJhbnNmZXIgY29tbWFuZCB1bnRpbCB0aGUgU2V0dXAgVFJCIGlzDQo+PiArCSAq
IHByZXBhcmVkLg0KPj4gKwkgKi8NCj4+ICsJaWYgKGR3Yy0+ZXAwc3RhdGUgIT0gRVAwX1NFVFVQ
X1BIQVNFICYmICFkd2MtPmRlbGF5ZWRfc3RhdHVzKSB7DQo+PiArCQlkZXAtPmZsYWdzIHw9IERX
QzNfRVBfREVMQVlfU1RPUDsNCj4+ICsJCXJldHVybjsNCj4+ICsJfQ0KPj4gKw0KPiANCj4gZHdj
M19yZW1vdmVfcmVxdWVzdHMoKSBjYWxscyBkd2MzX3N0b3BfYWN0aXZlX3RyYW5zZmVyKCkgYnV0
IGRvZXMgbm90IGNoZWNrDQo+IGFueSBmbGFncyBiZWZvcmUgcmV0aXJpbmcgYWxsIHRoZSByZXF1
ZXN0cy4gc2hvdWxkIHdlIGFkZCBzb21lIGFzc2VydC9XQVJOX09ODQo+IHRvIG1ha2Ugc3VyZSB0
aGF0IHdlIGFyZSBub3QgcmV0aXJpbmcgdGhlIHJlcXVlc3RzIGJlZm9yZSBzdG9wcGluZyB0aGUg
YWN0aXZlDQo+IHRyYW5zZmVycz8NCj4gDQoNCldoeT8gRG8geW91IHNlZSBhIHByb2JsZW0gd2l0
aCBpdD8NCg0KSWRlYWxseSB3ZSBzaG91bGQgd2FpdCBmb3IgdGhlIGNvbnRyb2xsZXIgdG8gcmVs
ZWFzZSB0aGUgVFJCcyBiZWZvcmUNCnJldHVybmluZyB0aGUgcmVxdWVzdHMgdG8gdGhlIHVwcGVy
bGF5ZXIsIGFuZCBvbmx5IGZvcmNlIHJldGlyZSB0aGUNCnJlcXVlc3RzIG9uIHRpbWVvdXQuIEhv
d2V2ZXIsIGluIHRoZSBjYXNlIG9mIGR3YzNfcmVtb3ZlX3JlcXVlc3RzKCksIGl0DQpzaG91bGQg
b25seSBiZSBjYWxsZWQgd2hlbiB0aGVyZSdzIGEgZGlzY29ubmVjdCBvciBkZS1pbml0aWFsaXph
dGlvbiBvZg0KdGhlIGNvbnRyb2xsZXIuIFRoZSBkd2MzIGRyaXZlciByZXBvcnRzIC1FU0hVVERP
V04gZXJyb3IgaW4gdGhlIHJlcXVlc3RzDQp0byB0aGUgZnVuY3Rpb24gZHJpdmVyLiBUaGUgZnVu
Y3Rpb24gZHJpdmVyIHNob3VsZG4ndCBiZSB1c2luZy9yZXVzaW5nDQp0aGUgcmVxdWVzdCBidWZm
ZXIgYXMgaXQgc2hvdWxkIGJlIGRvaW5nIGRyaXZlciB0ZWFyIGRvd24vY2xlYW51cCBhdA0KdGhp
cyBwb2ludC4NCg0KSSBoYXZlbid0IHNlZW4gYSBwcm9ibGVtIGhhbmRsaW5nIGl0IHRoaXMgd2F5
IHlldC4NCg0KRnJvbSB3aGF0IEkgcmVjYWxsLCBwcmV2aW91c2x5LCB0aGUgcmVhc29uIHdlIGhh
ZCBpdCB0aGlzIHdheSBpcyBiZWNhdXNlDQp0aGUgZXZlbnRzIGdlbmVyYXRlZCBmcm9tIEVuZCBU
cmFuc2ZlciBjb21wbGV0aW9uIHByZXZlbnRzIHRoZQ0KY29udHJvbGxlciBmcm9tIGhhbHRpbmcu
IEhvd2V2ZXIsIHdpdGggdGhpcyByZXdvcmsgb2YgcHVsbHVwKCksIGl0DQpzaG91bGQgYmUgYWJs
ZSB0byBoYW5kbGUgdGhhdCBjYXNlIG5vdy4gU28gd2UgY2FuIGNyZWF0ZSBhIHBhdGNoIHRvIG1h
a2UNCnN1cmUgdGhhdCB3ZSBoYW5kbGUgYWxsIEVuZCBUcmFuc2ZlciBjb21wbGV0aW9uIGNhc2Vz
Lg0KDQpUaGFua3MsDQpUaGluaA0K
