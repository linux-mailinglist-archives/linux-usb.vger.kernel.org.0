Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8AF607527
	for <lists+linux-usb@lfdr.de>; Fri, 21 Oct 2022 12:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbiJUKlW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Oct 2022 06:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbiJUKlS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Oct 2022 06:41:18 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CFFA24B334
        for <linux-usb@vger.kernel.org>; Fri, 21 Oct 2022 03:41:16 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29L9ZcrX014515;
        Fri, 21 Oct 2022 03:41:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=nSsK9taPhZmxzX6eJj7WhSFuaQ8+u8bIzDuc+nbTwr4=;
 b=U6IjNMpvJE2K96yp8S1ny0H+ev1JMYall4v19OM7tQP15/k0MgOUewGn01dL96s+Xhxy
 w6wuCvRcsarVJkf5sbCfjVbfypl+x55goXmFr0alxKLg/ZOTO2ZBF3nUPrsRXjunxvxc
 yf7Tx52WUZv9sJ7+nvBrWMqCfAQELJeWFGtkuZAVB1DAUsrq2gvCtHWL5ZUqh2x4q8bA
 6BkFlO+UvVdJmcs7eBCJ9mg4EgCNvFCJ5V45gcQxrCHAGYfpP30pvxQfJoc+kfUQhiUo
 XHunIsT3fUH+HnHMKIHzlv3cQl7xZQqXyKSp5VnFkTI9MthqWak+pi+mNNJZS1IO3BRT gg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3k7ugj5pbr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Oct 2022 03:41:10 -0700
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 96443C00FA;
        Fri, 21 Oct 2022 10:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1666348869; bh=nSsK9taPhZmxzX6eJj7WhSFuaQ8+u8bIzDuc+nbTwr4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=f1jdOS5Nm2GEZYgns+wmWGh3h8cbxa/DCs4rOJk6Kxd2Z+WL1K6v71+Gl3gEcQsgZ
         4W5I0QsnsUDq9EVCXycj69csFzObWavI7by+tkCJJvqSMozE0eWcZYHw4Un775w7Hj
         B2GURuD/jIkr5KVjYueGcTsvS6aEuviB2zKaoknH8zhgiujAbOmuTuzt+d6s/JcZyt
         H+S7JH0Ok4H21TcuwdVLRg2+QWsti4LO4K2uaTQvkco2eo/0cHg1QwWtzCP+t/9j5q
         T0Dqq5L0yrP+8kbaStFf/WhEQed781V08xTjmtYCwymKD5+imnvoL4lwwb/dsebf4B
         /fw2z5WZqS3sg==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 652A3A00BC;
        Fri, 21 Oct 2022 10:41:07 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id CC0394004E;
        Fri, 21 Oct 2022 10:41:06 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ONQAcG1P";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z79IPmIm6Bkw5MDHu6P0MHxiE7xSjKqm2lAvfj7qmajTcEffNQ1S9AW7NkWTduCNfxqBtlE6AZGnLexXQvjTmK+wk9gc1/mtKtyLIQX6BZVKR0gC/Q6QH/kka2QOMHzxL2M0aR2LB/++wpHb44do/sXdKkcwIthBoHuL7jcmlg+QeXhn1BS+TSv5sUEwatDLBnn4Co1HlWEDFSwO8EdG0H3Y36Qs9uXgeAAQCTcietrAF/roEEqLwzRbtHrbORBVC7jQT9PJd5PqaFg2eEirXs6OOwoO7PQPGDl3ATec3IyO5AULaURmAGi9s8lCjm5Zkr1ftOY9N/fNZdP2HZpbhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSsK9taPhZmxzX6eJj7WhSFuaQ8+u8bIzDuc+nbTwr4=;
 b=egXgLnvHkzpfT8A2Fux3DE22mA9u/oReTJIqu+u++8wAzPlWSQiRcm73vtmQ3/OUPlmv2GiBWr2Jme3l2FNJMZbPrXmsTdhXMAGr2WRK5nf+N8Yjznoi8jf9zlL6pSwUKrJv/ljRJd9Rfh50MFyiGCPToiHRlETqeUbM0Ju0Tm6Dp74qadoq9GdixeEls6LX+yVHmM/ah1jmGxh7GCSWuDoRzxlBPbyEPDXZgxYMubPWt7gMb6DWwggK243igXNlrSpoE2byyPxB5pGbPlZ6OY3CiUUg898eEt2KhVMkG2dIVjlAhd9UiItLt9QsKevaNngbK8G9QSZZhUPFqQcEHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSsK9taPhZmxzX6eJj7WhSFuaQ8+u8bIzDuc+nbTwr4=;
 b=ONQAcG1Prkiug8044uAFyapouwVKgpaffHxzYcQNLfoQ4pNG48akFa5iJ2pPbNfY53Sea6WgJmMKjI0GLFqSdMZmcGnjqwj9TVh1JLSv4RlAJ1GukOrxJ/8NTZcE7of1TSELeaGhKT+OSNU3UUnyN30cVlkx18I7nj0JKE7auOc=
Received: from BYAPR12MB3399.namprd12.prod.outlook.com (2603:10b6:a03:ad::22)
 by DM8PR12MB5478.namprd12.prod.outlook.com (2603:10b6:8:29::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 21 Oct
 2022 10:41:03 +0000
Received: from BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::728:786d:a657:692f]) by BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::728:786d:a657:692f%7]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 10:41:03 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH] usb: dwc2: platform: Improve error reporting for problems
 during .remove()
Thread-Topic: [PATCH] usb: dwc2: platform: Improve error reporting for
 problems during .remove()
Thread-Index: AQHY4mL0QmItvBbIjkKLNoJfgV14FK4YrnQA
Date:   Fri, 21 Oct 2022 10:41:03 +0000
Message-ID: <49f4299c-0944-b7b6-aa65-e4d1985a8993@synopsys.com>
References: <20221017195914.1426297-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20221017195914.1426297-1-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB3399:EE_|DM8PR12MB5478:EE_
x-ms-office365-filtering-correlation-id: 76fb35b8-bab2-43ac-3e3e-08dab350c04d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ffXv/3IyV2a11Q+MIX6rn4BYUVH7Z3hFw71Cz8MT5BYEOt2uGPCOisR3eWeflMfnN31KnuvmNRUQIb0yMQ3gxh6XbDMjzXrvJbTmQCYAZSvGlieX+AbDuozBUpfNv0sDRV5Z0jCkOj62IXz5iyO4f8J+wzGyLHCWmRyuXjDoA0vEAHFl4Ui9CLphuP2CZHjyYGM2QiwoSTRnrGpnUJKI/ChC8eI4gfdbqnGQPO2YiJv+35XUN8OoYOcZYIiSZP37svUC3oDKvjghG81uECcZJ8HV2a1gOm4C/N865XSa9fMAIGDR0BLFuN17vwq/YciadapckrXN6U+0rPM4MeueNgiSYk9fcxng8N5DLjPQaZOf4gu1m4U9tr/m3wCDUuexftqYG75WW4vDXOrz74G/0zhaN3Xwu4UIYdW1DGN3B9F4YYOKnNjKajMCYUxlgWewWa9rR6qxk372p6C2TaBa6/w7GqxsbQTvTmzZ0WBpNCQZuJxMuEyWs+oYwl2nE5lVA43IZX2y1N5r0bk05EwXu2euh/brJ1sbKAuQKY3XPA+KhpPbZl66JWflMk3Mgh5YpW8Ju9TCMXD9psVSVZKKmDKGqaaEpI4Z9A8RdQSy8CfxnwUEN1VQ1zwAOMI13Lj8K+52hW2Minshx4MTVL5PAYBTnTK2LjjmeA/suEjTJwL/R8HZgZv6m/ZjN/t9p65ntn8y7+QcdcLiY8FClnUrzZVnP56NfYkFk8H2LZ+xPeFv5WlJjdEQQW/k7ECeteXUXTZWvhbpwTzHzd2sIi7zs7exW86WQhO84pzNsPO9Z14NLPWy2vk1ZhY3vixmnAPKzx65zpdQPPuZG3cGNtep9yTLpAs359kyYkCVp53VwRY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3399.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(136003)(39860400002)(346002)(396003)(451199015)(6916009)(86362001)(54906003)(83380400001)(31696002)(5660300002)(66574015)(91956017)(64756008)(4326008)(8676002)(66446008)(66476007)(66946007)(76116006)(2616005)(66556008)(186003)(53546011)(26005)(41300700001)(36756003)(6506007)(8936002)(6512007)(316002)(2906002)(6486002)(122000001)(71200400001)(38070700005)(31686004)(38100700002)(478600001)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXVBeVJJTU9iVDBqdEQxMEFycDJSdytKbjFDTUR2V0dKT0plVUZBSUNVZTAz?=
 =?utf-8?B?c2dEUDg2anQrdDBSZjUwcS96cXZ0RHV2RUgvcTFBV2ZaelJ1dzAyVUlvVEha?=
 =?utf-8?B?WmlaaG9IYXVSNG4vb0VZeHlJdHNxZjRJRklvbjQ3eUIrVEZocTlYTU5hcWJm?=
 =?utf-8?B?K2pJZS9PcWVPWWtBSWNablJMWThUd2xCeEtuWjhRMjRqdlVPSlA5NEpOdFZF?=
 =?utf-8?B?VVM2NzdPRHdIeCt0SENSOVJ3NHh6R1BSQWtCMmVyWVlWU1p1b0IzQitwVHhr?=
 =?utf-8?B?bjVCdk5nTnJsOXlwQldYWDBZWG1uOWhZVXhFbXNwNmdydE1ST2JRUGhBczYw?=
 =?utf-8?B?a3d6cWhwTmtmNW0wbEpHSUI0VHJMY0VzOVhqWG1peVFsckJLdEQyWGVyMUl0?=
 =?utf-8?B?T2R3S2lhRHc5MjRiMmhSNERBUks4UVZ6N29IY2V0ZEE1ZGRoTkwxTXk4Znl4?=
 =?utf-8?B?dTIvWVhEa0JCMDlEMTdMbzV4SzBNNEhHNDJPVkt5c0FDWWtMT2p0V0NzOWRN?=
 =?utf-8?B?eWZncmN6MkUvNWdMUDd4czU1YWpMTVdNdHU4VFBnL1p5SHBhckRKcGJmMGRs?=
 =?utf-8?B?eE5wUzlDWllmNXJCeHE2SE03blNzMlVycFdzSFVKNUtmandYb3E1L0UxMUls?=
 =?utf-8?B?b0I1VzVHZTFzekdtSU40ajgrWWpUc0lwUkxsNExObElQd0dwY2lDbHRpeFFo?=
 =?utf-8?B?em1NVzRNbzVOVm5YcWxNTjdQQ2U0TmZlc21mM0EzaklGM1hzeTZrVUh0bWx0?=
 =?utf-8?B?YnE4eEJHRmwyTTBVZVZndjNPdUNRTWJtaDlOY3VndWI2cW01QVZpM01Wekxx?=
 =?utf-8?B?Y21WL0F0ZEUvSWFRU2k1bk1BdmNJWStXT0FwMysydjlBb0JJYlhDTjBaTFdq?=
 =?utf-8?B?MFNqbHpoNFJTcmJZcC9ybmZNb3JXZzVqUE92WklxcUltbWkvcjQ3OFJtUGFr?=
 =?utf-8?B?OHNkVFlWeC9OZVZacGFKRisrYXpQQ3pNbGl4b0hsQXhKcG9nTVlyY3NvV0x0?=
 =?utf-8?B?S0NPWGhrVjh3d1EzTVFXd3lDRzdrMzdDejdsTG9QTU1CaHVvVWlKT0tqOStu?=
 =?utf-8?B?MC8xQkRtZTl3MEhCeEE0VmtvbWl0YmpTMnZ1NTJHaTluT283bkhQaU1SdElm?=
 =?utf-8?B?OXZlS01JYTk1Nnhlc294ODNXMnpyWU5GY1Q0MkZ2MzhFWm5XM3pFanRTdnQ5?=
 =?utf-8?B?NzZOMVdVU1N5N0EwV0tabFQxVGZGRXdKNmlFR3hCRXZpY3oxc0R4alVGeUl2?=
 =?utf-8?B?dE82MmxXK3RFcWRFZ2lJUFZ0Z2JCSHZxNTdsb0pEeVJJYWwrZUFzMytlZTdN?=
 =?utf-8?B?NFlpK25MNllXaEgySGN3N0t5YmlKT2dYQzAxRS9XcVhvVXZqZkM4Y3VMdDN2?=
 =?utf-8?B?SC9ScTBtdU1BT0tZY3FEMENIMjFPbG9jY0gyOFJQZWFteGVjK3hvb0hJRFN6?=
 =?utf-8?B?a3FWL05Pa3FabjhiUnlrYkJXZml0ckJEYjZza3dHQWRWSVYvRjdFZXh6ODds?=
 =?utf-8?B?cHQvTFkyMFpjcDF1dnZQb3N6eWU2MEZnNDlWYmNyRzZGZDNvMEdDQUJZZ3lx?=
 =?utf-8?B?V2Rsd3o0YkEvc21JUmVwd2k1OHpIejh4UVo3OFU4R2tsOUpUbXJNVWxXbDBU?=
 =?utf-8?B?NG1qUzZXcjZ4RFgyVzVzL00zRFA0NjE2T2xRZFpkUUV1QnUyVzFKcDNJSlpk?=
 =?utf-8?B?MUYwMjM1R2xpZGZobGlhMk4zUEExaUxqdSswVHFZQkMvUitKMFp1eVh4R2NI?=
 =?utf-8?B?MG5YcHVoQUZyMXAyQkx0bGRQWU9oK21PcE14S2ZEbTJHR09mUThFeE9QdHFS?=
 =?utf-8?B?QXFwN2ZjS25wOGd5SGxDRk5pU0xrc2t0bkgxZ2x1d3AvRkFvZ0N5VmptbVRL?=
 =?utf-8?B?YnJCdEM4WEthdVlZb0FWODlyT1hkaUtYK3FlMXN3d0llaitncUhvRmFqMkpy?=
 =?utf-8?B?ZGZGK2pGTDJ0NzhxS3BsbERUUmUzRkdrQysxbGFCeTVJMm9RMTBnaFlSSW13?=
 =?utf-8?B?RkVpWXlSemhYNmVucFNSQk5RalN5TFlZNi9mYVp5Znh3VnZib25oVGwzUVZQ?=
 =?utf-8?B?azBUVjlxWTBpbE9KMEhxb0NJYmZibFFPbUNQZ0JsenVIUzZueEErenpOcFZJ?=
 =?utf-8?Q?Jqnc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3567B49C72E724A8E174860F43FF1D3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76fb35b8-bab2-43ac-3e3e-08dab350c04d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2022 10:41:03.1233
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wRaHKoE+iG4+NYLelX2OzSRokVBn75TbsWItIHqgp3XcU4NnkHgANELGcvvo+DOBMLwPi+8ykkRZhrvPA8R+DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5478
X-Proofpoint-GUID: satOnLfW2aKhOvAWvekLHTNKOFSQOGa2
X-Proofpoint-ORIG-GUID: satOnLfW2aKhOvAWvekLHTNKOFSQOGa2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-21_04,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 malwarescore=0 mlxlogscore=797 suspectscore=0 bulkscore=0
 adultscore=0 clxscore=1011 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210210061
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gMTAvMTcvMjAyMiAxMTo1OSBQTSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+IFJldHVy
bmluZyBhbiBlcnJvciB2YWx1ZSBpbiBhIHBsYXRmb3JtIGRyaXZlcidzIHJlbW92ZSBjYWxsYmFj
ayByZXN1bHRzIGluDQo+IGEgZ2VuZXJpYyBlcnJvciBtZXNzYWdlIGJlaW5nIGVtaXR0ZWQgYnkg
dGhlIGRyaXZlciBjb3JlLCBidXQgb3RoZXJ3aXNlIGl0DQo+IGRvZXNuJ3QgbWFrZSBhIGRpZmZl
cmVuY2UuIFRoZSBkZXZpY2UgZ29lcyBhd2F5IGFueWhvdy4NCj4gDQo+IEZvciBlYWNoIGNhc2Ug
d2hlcmUgcmV0IGlzIG5vbi16ZXJvIHRoZSBkcml2ZXIgYWxyZWFkeSBlbWl0cyBhbiBlcnJvcg0K
PiBtZXNzYWdlLCBzbyBzdXBwcmVzcyB0aGUgZ2VuZXJpYyBlcnJvciBtZXNzYWdlIGJ5IHJldHVy
bmluZyB6ZXJvDQo+IHVuY29uZGl0aW9uYWxseS4gKFNpZGUgbm90ZTogVGhlIHJldHVybiB2YWx1
ZSBoYW5kbGluZyB3YXMgdW5yZWxpYWJsZQ0KPiBhbnlob3cgYXMgdGhlIHZhbHVlIHJldHVybmVk
IGJ5IGR3YzJfZXhpdF9oaWJlcm5hdGlvbigpIHdhcyBvdmVyd3JpdHRlbg0KPiBhbnlob3cgaWYg
aHNvdGctPmluX3BwZCB3YXMgbm9uLXplcm8uKQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogVXdlIEts
ZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4NCg0KQWNrZWQtYnk6
IE1pbmFzIEhhcnV0eXVueWFuIDxobWluYXNAc3lub3BzeXMuY29tPg0KDQo+IC0tLQ0KPiAgIGRy
aXZlcnMvdXNiL2R3YzIvcGxhdGZvcm0uYyB8IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Vz
Yi9kd2MyL3BsYXRmb3JtLmMgYi9kcml2ZXJzL3VzYi9kd2MyL3BsYXRmb3JtLmMNCj4gaW5kZXgg
ZWM0YWNlMDEwN2Y1Li4yNjJjMTNiNjM2MmEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3
YzIvcGxhdGZvcm0uYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MyL3BsYXRmb3JtLmMNCj4gQEAg
LTMyMSw3ICszMjEsNyBAQCBzdGF0aWMgaW50IGR3YzJfZHJpdmVyX3JlbW92ZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpkZXYpDQo+ICAgCXJlc2V0X2NvbnRyb2xfYXNzZXJ0KGhzb3RnLT5yZXNl
dCk7DQo+ICAgCXJlc2V0X2NvbnRyb2xfYXNzZXJ0KGhzb3RnLT5yZXNldF9lY2MpOw0KPiAgIA0K
PiAtCXJldHVybiByZXQ7DQo+ICsJcmV0dXJuIDA7DQo+ICAgfQ0KPiAgIA0KPiAgIC8qKg0KPiAN
Cj4gYmFzZS1jb21taXQ6IDlhYmYyMzEzYWRjMWNhMWI2MTgwYzUwOGMyNWYyMmY5Mzk1Y2M3ODAN
Cg0K
