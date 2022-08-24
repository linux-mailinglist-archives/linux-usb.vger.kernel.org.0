Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D05A59F2D3
	for <lists+linux-usb@lfdr.de>; Wed, 24 Aug 2022 06:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232421AbiHXEuf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Aug 2022 00:50:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234949AbiHXEuP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Aug 2022 00:50:15 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 976758E991
        for <linux-usb@vger.kernel.org>; Tue, 23 Aug 2022 21:50:13 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27O45pbB025126;
        Tue, 23 Aug 2022 21:50:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=PKqh4/bVbq0MLdEROzDTiCaC62N6PhHjiBtiF/sQ+c4=;
 b=KNoRNgsjXGeG0fmll/xQ4GNLPyi7dk2ST5kESsaqE5v1a0hNd0H9FpMEasSi5B3khHzW
 vsYquRVEvG6fKfQr+YyhWkCwrV+nHaB5nspyv/t3Cu7fbbuLmS6KfyadyUz8lYuvJUsw
 gazJaW7OOlsMjY4YWUs2TQn1xCuCIsk+BxgvbTiFmivq5dTsCrwj2duwxzU9fFXb5n2y
 IncEkwHHK8mXXVXw3/nnkbzHlE6NlATT5UslajO0NWJQpmcprXMBeHClsdS6IFoDqb5n
 VedmPipeVEcmu7J55qt1nyNfnll1vrYZlgkrGuNdcdd9ylap8XwwPYqjF9SSZpx+SS25 5A== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3j51wv3mtv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 23 Aug 2022 21:50:08 -0700
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D69BD40052;
        Wed, 24 Aug 2022 04:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1661316608; bh=PKqh4/bVbq0MLdEROzDTiCaC62N6PhHjiBtiF/sQ+c4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=YNyvaF5qf8aFo4eeiXaeRMwX9+sYpJxWXfe48+VMYTR0cPTv4GGJjKM1dBnQgE4pb
         BuzpR2In1SX12BijrVSHmXkbjOrjLzRp1qtHjCXMpruOb2QnzbWe7ZFQU8/9B67z3S
         nyj+Zhy92R8geclslegH1GDanTkdQ04l+SMX5c5arVyQaFkwhgEodH2W1tqhAsHAp5
         n8nl9xOkpkN9TyHhtYWP/vxhQvyj2tQjzsUyoBk8Pbxhr+CMdfjnFCx0aKlPkwgoLR
         lvt8k2Dr/ktZ8WH6uA6XRZUgTCySbeQeTR6/4C93GNJq138BNOimkrjSqjEsynLEv3
         Hp8HhtCVvYAOA==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 19B05A0287;
        Wed, 24 Aug 2022 04:50:07 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 30ED840073;
        Wed, 24 Aug 2022 04:50:06 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="sQ3KAF08";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y32tqKcJ+yAhUB07ASXCnQCyisT/aj92Xb7BkDKLhsOlUkWhEbFGk0Lf8CRTk4N6uXRd8Hga/t2gOnGLxNc+WgP53f2MB8FL2ThzLCdxCLH/0cpEOHFU1vfntYw7gYAygmWTx2Dp9LGBJFLf4noTI9UAbIZkqL/w4mFc/KZgVypI58WqWnOHBiy8aYBRKqYQKmU4N2wecXQF8SRbLu0HTQ+l0cGY/JHXLI7VEkDNNcENU5baIvVuIXX6uT0FUtNXzEWSrq57aAk39mQhxsKldAV9MBrqkq7BVdojufspIGqR5FqdFD4CHYWtkIjm77os9WAIsobKvsa3jb8xgVAV+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKqh4/bVbq0MLdEROzDTiCaC62N6PhHjiBtiF/sQ+c4=;
 b=eKIJJ7B9WZKko2uOdAwL3o5tkqHgRmTHamlmIaJ//J+ko/ibW9GUAKi5P9TwvrmG4Sn4zeGw4BgH4lunZeFOEBXldt7FrJQR49Qp/FHOp655wsBexuD8imtM5iN1lYRAPynDcVg8j9JGivyXdRWp92g45+Ti82/OQLHte6BofHF/nDGxKnaODXGYkSpGww2/7whEAVTxPqJgQYJK6YSEwT76pd2SX9djeIWQzTLCwdlET802/twt0YPyV84y1+6a51dFjjpZwbun1VrB94QhQd4jVJlz+YKI8dRJRgVw6k+euyD2Le3mL+FcaCBK6hHuXULUUfvrrYNOdwSfP68xzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKqh4/bVbq0MLdEROzDTiCaC62N6PhHjiBtiF/sQ+c4=;
 b=sQ3KAF08HhSiIepSCxATNXbTf5c2eI6S9DFfoY91cXsVFvCEZO9LFC3KZ1x8p9/YYI8AlXWZIFJZn4UNx1VhXwmQ3vFvLTKqG+vJDp/AtJeT2GKukityV7gW4JaRoqv8KSj6WrbesZjrkr/vrmGguDywvlZL1LBd0KJb1fTc8qw=
Received: from BYAPR12MB3399.namprd12.prod.outlook.com (2603:10b6:a03:ad::22)
 by IA1PR12MB6092.namprd12.prod.outlook.com (2603:10b6:208:3ec::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Wed, 24 Aug
 2022 04:50:04 +0000
Received: from BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::6d63:11b4:5275:4ee1]) by BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::6d63:11b4:5275:4ee1%7]) with mapi id 15.20.5546.022; Wed, 24 Aug 2022
 04:50:04 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2] usb: dwc2: fix wrong order of phy_power_on and
 phy_init
Thread-Topic: [PATCH v2] usb: dwc2: fix wrong order of phy_power_on and
 phy_init
Thread-Index: AQHYtxoEkjk4ZqH1tk6nC+MEbUPuG629e76A
Date:   Wed, 24 Aug 2022 04:50:03 +0000
Message-ID: <57ae49c8-cc07-e2e0-4e72-33d456fd885b@synopsys.com>
References: <dfcc6b40-2274-4e86-e73c-5c5e6aa3e046@gmail.com>
In-Reply-To: <dfcc6b40-2274-4e86-e73c-5c5e6aa3e046@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac7ea7b7-618d-4394-72a4-08da858c1c1e
x-ms-traffictypediagnostic: IA1PR12MB6092:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mbaZ89b+nsv/U8iM1OeSLM+c9ScRbFtopyCF/qvPXBl5lV+YPUlE4H3Kav/LDG03FvVSQbUOw2v+mT/mWj3/7J5jr+LfThAanX2ONvqyDKsGY6GH9w23QNHsuPxbFRP/g4TGgVxfmMStisqyC9t8u0ipn8ssw30svv76gdYGAmv3hLx1GM8cAnI5p/sC2xHdXS4fEsg5Ns7HEna+4KNdOCcQJm0BZHUXpEeBdDntc4YJGFULQAFLK854zgz8bHB6v0ywBheBM5kAewFnmhPh+7Q1DX3B6+I711JuG0Lc5mRWTWiJwJdtTMqW40xjcQNoEbEegQbv+NkEGoYcV0UTBIrOgETc1OyDD1Rl34LdvzW/PH9FUyte1cvM0ivhUC9gUFpf3+7qNzRuSIIhX8h3Hay5eP0+Lowde+ooXHbdV3E1mT9CcsVZ/DAyMS7lBjcJRHXr/IGk58HzfimGnQFp4WSUTSGv2E9pdUWK17cDTVV+qBOvj6ysG20XlokCkPJxwd+0ZL1/b25JKigxhtwkUiL1TdKLNkQwG4x4EFjMkHcDZq/gP9nxy/G30TXKr4VQWzXV9xtWXEovLXwioHie/SC6iXcxAk8sw9afySNqXOJUh+DSvz3g8kxkLuXY7JmK3z1+MAIlkhF6Q+7DbPqH3RheiX9GTnzDOvzZ7VS+F8RQX9F09hZ8YG9lGFLrv9gaYfIOA4TUBNKm71+ov2wwJCvdQSKwEW4+JU6afEptl2JLh/XizLTZJrVEj0Ti0etccm+6CH9q3dYUkgyo3a9pj7cwYYeja7IPT73/WS3kZbX7Fndzp702w4v1zVheeYFqhVeWkCg3EAKpGnXmj3s1WQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3399.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(136003)(346002)(366004)(396003)(83380400001)(41300700001)(71200400001)(478600001)(6486002)(26005)(8936002)(6512007)(186003)(53546011)(6506007)(2616005)(2906002)(5660300002)(316002)(54906003)(110136005)(91956017)(66446008)(66476007)(64756008)(66556008)(8676002)(76116006)(122000001)(31696002)(66946007)(31686004)(4326008)(86362001)(38100700002)(36756003)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ekljRGlxMmpodlhQNTExYUZMclVZb0owekd1Sy9reGtqTVA2N2xEcGUraHFN?=
 =?utf-8?B?N05Iam5FV1MrZXkybHgvbzFSNnA5Qjk3Y3VEMm5CSWVIYXpUelltSUpQSHp4?=
 =?utf-8?B?OUJpWnU4dHhVZHlReE9JaGV3eUNyZDhIa2JSRVF5OFN1bUJxejVuUXhGMEdY?=
 =?utf-8?B?TzBCWDRqUmdSSWNZU3kzQmx1MDY3KzdrNG8xNm1wYm5XMzBrYXNlS2hJdjFO?=
 =?utf-8?B?MXdRQXd3RVc0aTUzMjJ0NEY2c1pXenRZVXJuYUFBK1J2emVxNjhxMU5tNFZ5?=
 =?utf-8?B?TDBBbTZSamZUeFJpZjF6VHFvMWkrR25aVlBFZWhiZ0s5MUozOUFhMWU4d1o4?=
 =?utf-8?B?czBNR3VueTZlUVpSM3M5UEtxenBIME1zLzkvS1JrNWszS1lidjE4MTJrUzYv?=
 =?utf-8?B?eVhLMHprYnlaY0JlR3IwU1plZm1uNGZXdnFzMmI5VE05YkdkL0EvTit0SXBz?=
 =?utf-8?B?emNqalV0TFJrVXNjOWMzWkkwZTNvL0w1c2pnVVFJYUc2Q3Vxa1FzOVAwcWdF?=
 =?utf-8?B?S0xHRFg3bitQVTVoS25oUVJXVkhpVlZPY3ZVbzJVVmx3RHhtd0VxWVNyMkc1?=
 =?utf-8?B?dERiRmJVa01YWlFHaEJ1OVZIMjdieGxyUDNPT0JaZG1yYmNJZkNJVlRmRkU4?=
 =?utf-8?B?Y1o4YUdJZWM4RG5rWTAxZWhKUGRxeTM5RjFyZU1US1gvWnYvaHN0RktWRG1U?=
 =?utf-8?B?ZHgyVnpmRG5uQUI2TjZ1YjFlNXU2dFF2Z0NmNDhaakxxSkhRcFJ0dk5mQW1z?=
 =?utf-8?B?TSt1Qk4xYVI0NHF2R2NmTFBML0lyekZPS0QyZW0yMDJoRURzNU1sUE9HVnpZ?=
 =?utf-8?B?U1F5bW8rbVVkclh5TVEwTnhvYVI5UVkyd2Z3bVdldGFpandoempLTWJFMDdi?=
 =?utf-8?B?akJUZEVyT3ltRzJocWtMeGk5N2JBRWNnOHJFcmZBcUpHQ3Nqa09kSFAxRUpi?=
 =?utf-8?B?Q1ZySHNFTnd3TmFzM2puOVpHRjlGMkMvT1pyazBnS2pGbDR0MGdZTmhqYy9l?=
 =?utf-8?B?ZEg3ZmZhcnRCRXFTR1NsL1hsS2R1Q1ZLaG44QzFGcUF4TmlnMTIyMkxxZUhQ?=
 =?utf-8?B?aG5KVElkNFJkUm5HZjFqQUF4cU4zTitGYmw2L3VSNTlnZTR3dWV2K0IrZk1G?=
 =?utf-8?B?aHB6VnNGYmhvZTBhU3BKRGdCamFGRzFrSUdTcHY4UTR1elJHL3R4Uy83bXky?=
 =?utf-8?B?UWdxaHlZQUVqYkhiVFpEZThBNnJCN0tRZ0pHbkcrWitSbnJ6Wmt6d0krenFJ?=
 =?utf-8?B?bEpJbjRmOEZBcUVmT0pjcDhHQi85QmNhQ2ZzTTQ5T2xReHNPZU1hemlGSFdu?=
 =?utf-8?B?NGZlUEtyRzZ1ak05UFAwcG5MWVQwSlRyY0VWNHlKVlBtMHVyeHJEVnFkMCt0?=
 =?utf-8?B?cUFxSm1NMG96alpaaWYxalcvWTRRZVlkZ3N3MHdPem5OSHJwenRQOHJhZ0hs?=
 =?utf-8?B?bnBGWHpaMWxCd1IxaHorSHZhNEhmT0RHOHo4ZFFHZ0NsTy9VaDl1RHpPNjE1?=
 =?utf-8?B?TWtKeWZpOFg1c2xUeW1FK2F5b3BCM2FteTR6Kzc5OEtVeHo2aWxNTkt0amxF?=
 =?utf-8?B?Tm9VeDNDRTdEWk1RdlZnZVNBQ3B1K1NRRU5RclR5MUtzTXM2V3NZTWQ0Sm9t?=
 =?utf-8?B?V3lMQXdRekViV2wvZ1lTWW5Xbko4WG1BdlJCeEhZMEZOMDk2Rzl2K1hIcUZn?=
 =?utf-8?B?dUJBWVdNYjNiMTgvcHRGWnFRaE5sNXorbzdYcFhyR2l3OWFScXhlYWZ6Y21U?=
 =?utf-8?B?MC91TTNQUDI1czBtZ200eUUrT040aEpzUjl1T2FDNEtDTnl5dGR4bDQzeFhw?=
 =?utf-8?B?S1ZLNG1SY29OS2x2OS9UUmttQ2pqTVpVVFZQaU1acmVJNGRramdDbG9HV2Zh?=
 =?utf-8?B?ZWdxUDhrNGpkdkhRUHhRWGJGbFlRcm1vc21aRitLN3BQQXVwa3V0S0VDOEg3?=
 =?utf-8?B?Y0RZNU5VMlltd1BQMlBzWU5xWHZvbjBseDZxaTYvRXA1Y0V5Y0dkM0pqbWV3?=
 =?utf-8?B?WmtXTS9CaXZoQ1ZpSlhlenJQZkpvRzE2LzhWenBGNE5GbWtBaCt2Z3hFUW1U?=
 =?utf-8?B?eklHaUhxdTVhbHBic25tNVE3NHRaOXc1SG83ZlFSRzhlSWxVT2FyRFlFN3Fl?=
 =?utf-8?Q?EQ1A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9350DAE9F956FA41B7AD32F92428F39A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac7ea7b7-618d-4394-72a4-08da858c1c1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2022 04:50:03.9707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 50XNQsoQDQIa/I2FPaF3NbtO8CjJMGpp4ymWu82B1DhMggyyRI56Zqx7Pl8mzbt+pQHi1RzuAgqGAZf8fDq3yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6092
X-Proofpoint-ORIG-GUID: G4jgL6XfWV7ocj3rM2CvAoZZq2fHf5FZ
X-Proofpoint-GUID: G4jgL6XfWV7ocj3rM2CvAoZZq2fHf5FZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-24_02,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=974 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208240020
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gOC8yMy8yMDIyIDk6NTggUE0sIEhlaW5lciBLYWxsd2VpdCB3cm90ZToNCj4gU2luY2UgMTU5
OTA2OWE2MmM2ICgicGh5OiBjb3JlOiBXYXJuIHdoZW4gcGh5X3Bvd2VyX29uIGlzIGNhbGxlZCBi
ZWZvcmUNCj4gcGh5X2luaXQiKSB0aGUgZHJpdmVyIGNvbXBsYWlucy4gSW4gbXkgY2FzZSAoQW1s
b2dpYyBTb0MpIHRoZSB3YXJuaW5nDQo+IGlzOiBwaHkgcGh5LWZlMDNlMDAwLnBoeS4yOiBwaHlf
cG93ZXJfb24gd2FzIGNhbGxlZCBiZWZvcmUgcGh5X2luaXQNCj4gU28gY2hhbmdlIHRoZSBvcmRl
ciBvZiB0aGUgdHdvIGNhbGxzLiBUaGUgc2FtZSBjaGFuZ2UgaGFzIHRvIGJlIGRvbmUNCj4gdG8g
dGhlIG9yZGVyIG9mIHBoeV9leGl0KCkgYW5kIHBoeV9wb3dlcl9vZmYoKS4NCj4gDQo+IEZpeGVz
OiAwOWE3NWU4NTc3OTAgKCJ1c2I6IGR3YzI6IHJlZmFjdG9yIGNvbW1vbiBsb3ctbGV2ZWwgaHcg
Y29kZSB0byBwbGF0Zm9ybS5jIikNCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gU2ln
bmVkLW9mZi1ieTogSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4NCg0KQWNr
ZWQtYnk6IE1pbmFzIEhhcnV0eXVueWFuIDxobWluYXNAc3lub3BzeXMuY29tPg0KDQo+IC0tLQ0K
PiB2MjoNCj4gLSBzd2l0Y2ggdGhlIG9yZGVyIG9mIHBoeV9wb3dlcl9vZmYoKSBhbmQgcGh5X2V4
aXQoKSB0b28NCj4gLS0tDQo+ICAgZHJpdmVycy91c2IvZHdjMi9wbGF0Zm9ybS5jIHwgOCArKysr
LS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMi9wbGF0Zm9ybS5jIGIvZHJpdmVy
cy91c2IvZHdjMi9wbGF0Zm9ybS5jDQo+IGluZGV4IGM4YmE4N2RmNy4uOTFmZWJmMGUxIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MyL3BsYXRmb3JtLmMNCj4gKysrIGIvZHJpdmVycy91
c2IvZHdjMi9wbGF0Zm9ybS5jDQo+IEBAIC0xNTQsOSArMTU0LDkgQEAgc3RhdGljIGludCBfX2R3
YzJfbG93bGV2ZWxfaHdfZW5hYmxlKHN0cnVjdCBkd2MyX2hzb3RnICpoc290ZykNCj4gICAJfSBl
bHNlIGlmIChoc290Zy0+cGxhdCAmJiBoc290Zy0+cGxhdC0+cGh5X2luaXQpIHsNCj4gICAJCXJl
dCA9IGhzb3RnLT5wbGF0LT5waHlfaW5pdChwZGV2LCBoc290Zy0+cGxhdC0+cGh5X3R5cGUpOw0K
PiAgIAl9IGVsc2Ugew0KPiAtCQlyZXQgPSBwaHlfcG93ZXJfb24oaHNvdGctPnBoeSk7DQo+ICsJ
CXJldCA9IHBoeV9pbml0KGhzb3RnLT5waHkpOw0KPiAgIAkJaWYgKHJldCA9PSAwKQ0KPiAtCQkJ
cmV0ID0gcGh5X2luaXQoaHNvdGctPnBoeSk7DQo+ICsJCQlyZXQgPSBwaHlfcG93ZXJfb24oaHNv
dGctPnBoeSk7DQo+ICAgCX0NCj4gICANCj4gICAJcmV0dXJuIHJldDsNCj4gQEAgLTE4OCw5ICsx
ODgsOSBAQCBzdGF0aWMgaW50IF9fZHdjMl9sb3dsZXZlbF9od19kaXNhYmxlKHN0cnVjdCBkd2My
X2hzb3RnICpoc290ZykNCj4gICAJfSBlbHNlIGlmIChoc290Zy0+cGxhdCAmJiBoc290Zy0+cGxh
dC0+cGh5X2V4aXQpIHsNCj4gICAJCXJldCA9IGhzb3RnLT5wbGF0LT5waHlfZXhpdChwZGV2LCBo
c290Zy0+cGxhdC0+cGh5X3R5cGUpOw0KPiAgIAl9IGVsc2Ugew0KPiAtCQlyZXQgPSBwaHlfZXhp
dChoc290Zy0+cGh5KTsNCj4gKwkJcmV0ID0gcGh5X3Bvd2VyX29mZihoc290Zy0+cGh5KTsNCj4g
ICAJCWlmIChyZXQgPT0gMCkNCj4gLQkJCXJldCA9IHBoeV9wb3dlcl9vZmYoaHNvdGctPnBoeSk7
DQo+ICsJCQlyZXQgPSBwaHlfZXhpdChoc290Zy0+cGh5KTsNCj4gICAJfQ0KPiAgIAlpZiAocmV0
KQ0KPiAgIAkJcmV0dXJuIHJldDsNCg0K
