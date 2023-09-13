Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C91B279DD4B
	for <lists+linux-usb@lfdr.de>; Wed, 13 Sep 2023 02:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233258AbjIMA5q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Sep 2023 20:57:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbjIMA5q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Sep 2023 20:57:46 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12B0510CC
        for <linux-usb@vger.kernel.org>; Tue, 12 Sep 2023 17:57:41 -0700 (PDT)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38CKj6Fm030129;
        Tue, 12 Sep 2023 17:57:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=J4SbkAR2XMg+6v5XRRjI5jYixo1r8ddM9avujk4G19o=;
 b=bOnpjkzQNdJmmx+L9DKxNITxTjNBNaroLoPSRhP8wZ4bfu4JRlxlpmSmYJdkeAH7h2pw
 zmYW2MzWyXWg3JSuQwpyGXavJTW+hb6yyn0L6JS9MEqCeWoThOmavb3Hvx70zJWTH0zL
 U6Zy19OJbZCG7TOj5UeDs8A0eAs9JT30+mhZ8rE+YC1KaDC3vrHsKYxQfaG7MxzGA0zS
 4Pznq3LKVgbj755TFcgF0HtvROKF4cU6Zbswp4/ozdzjoSIhF8miRvQIYj/nFqhZ+/Bu
 cbC54yLhcMEy765FtOG3TiASx48MBOI9vZSJtdKcvtAH+H5Lp4Z+g8GHNv+rh6DbyM+L tw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3t2ya3ryc5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Sep 2023 17:57:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1694566647; bh=J4SbkAR2XMg+6v5XRRjI5jYixo1r8ddM9avujk4G19o=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=YCnqjvTfD/4FoCJp4u19FqyUPrUla/FDRqYyC8FybFEatk744nfJ6yQqrN0oDqKe5
         1ozWLtaV+DkxbKW0I4e3hpaH9gGmAYqPVKGG7fPIyMvR1nG08hEoIrcjtzS2FCRdUl
         I83wMPhNSDAZ3zFKtBgpu2vWQCFRzTOPlfJsilpw98CbTYd/tYvxCCO5MAJa786EJN
         OfY8aGEz1R1+1LADYHhoIu4iM60Uq1qRuUI69QFWLmCsgYV4ZqAb8arveZIGG0RZeC
         ikOazIyzZa2EtxK7uA2zpUE2xdqOB7H8GjfDnSXTkW0mpAaMeiBCX4nyX5nZWcxHmT
         o0o4xcvITkYAA==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E941940127;
        Wed, 13 Sep 2023 00:57:26 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 23185A005E;
        Wed, 13 Sep 2023 00:57:26 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=iTwZOupV;
        dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 007F840586;
        Wed, 13 Sep 2023 00:57:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cdZeiD3pHiDb+wSc2G7eLnDpMuMpatHkuEm6oeWrwehg2s58aE4NdaWiHNrKQgu3AByWEY8qqZfOlHVLdYEs2DHz6Z8HE5T7abMArn61T+EwPyP+ZAwu95307BQ/1XIbGE+iF6AEBsTsxRfcZIDMlL1ZcvbgFikOqjo129g9VBcxNG3rzOXFX2YjRwxPPn0KLcs1X+GHXZ+bgBAjirX0I1VjBZLRfQ902g5vi4uMJUUK7gw6GtVPE4aTfIkTbyUgAKqVGpe9lJJQAjMQIwdohMUjbuDD+4K52d32nY7Cd3fyjTz4He9Te5f3wZTqdjH9duH7cIUR8kG4GNfqn9ePAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4SbkAR2XMg+6v5XRRjI5jYixo1r8ddM9avujk4G19o=;
 b=L5NJP7Tw+44Js/9YTDR6HSipnncfcMibENoIZS9711DC6GAr3Om/dxY5dVBBtNvYejsjNMqTF2Ft4w0nC2N8UvGoECP772TdJR21Fl5boZNuWL56lGL4RjeUWqlKgmSe78Ktr6R9OOy+roBaK+XbL6mHwL5qixBybsxbF9aoxp9MX8SB7ASi1hwo5zWt9u/gHnA0CcsHMvfmCxindfuApg+IV3qHgHgvnBKA1Pj9I8Gimo50f4jU1ZoyynnJuGz5Y6VPKT21wZsYyIRqRszVoohYnHBnPAacj/D1C4s7w2h1+hmSGBEbV31H5xtCePvA/RKH/oGIEViTqGgRuzD6ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4SbkAR2XMg+6v5XRRjI5jYixo1r8ddM9avujk4G19o=;
 b=iTwZOupV3R4Uo5BwxPlLV6uUFv++Mxa2xeEsNLqCjrREqF9bLjZc/JOjvH92UhbWySWIhXTWfXOFo/Z8ghDkW+NtvAqAfmZV/QxEvpP9VuHaZ8PTUy213IIYywFp8iFylcf80io1eBTREgh0p5FyRucHr/JKq0g0Awg1s8mgp5I=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BN9PR12MB5291.namprd12.prod.outlook.com (2603:10b6:408:104::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.38; Wed, 13 Sep
 2023 00:57:19 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::548c:ae3:537f:ca2f]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::548c:ae3:537f:ca2f%5]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 00:57:17 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Kenta Sato <tosainu.maple@gmail.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jisheng Zhang <jszhang@kernel.org>,
        John Youn <John.Youn@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        stable <stable@kernel.org>, Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH] usb: dwc3: Soft reset phy on probe for host
Thread-Topic: [PATCH] usb: dwc3: Soft reset phy on probe for host
Thread-Index: AQHZ5dyKoaCEdJ+w5UO4Jaesr32Vr7AX7r+A
Date:   Wed, 13 Sep 2023 00:57:17 +0000
Message-ID: <20230913005715.aa3e4r4pu652lj5q@synopsys.com>
References: <70aea513215d273669152696cc02b20ddcdb6f1a.1694564261.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <70aea513215d273669152696cc02b20ddcdb6f1a.1694564261.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|BN9PR12MB5291:EE_
x-ms-office365-filtering-correlation-id: 8bb2a372-2599-4b74-31c0-08dbb3f46059
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F4dDrUSN82LiSdeZkkcj/K4MRilbZ7WAKZiOODwFhzH9XGiFOiDeZhu3hgJXYEg/6Qve1PVEbMSTq1vL4EbxyLnE91olXqYcAmUWpFbcX6rI8pbyDn51aL49rTt53H0zF/bR7/oFkMfM35ErQo2Woy4a2L4H9rSzwwDp07iwjMYZnnPbxcxDKcbYP6Jx/0zHA1S+1eQesNZSvGhMKXT2f9TmIcyS2W9YA7H6v0q4Zdkw5/0PGZNeNdA8Ef5VpIvD19Vrtd8AWga2wjUNDz7xcHlpPKXe2tku3Rfbnje9641eoM6weC1ExJyzWbBsG0t16K8KiMLSRQVfXkTRSrjcIjaZZPDZ4TJ9au4ASyF0HccKHdVr/21oLuKpEPXUsvI9R532VImK4gpEBYbCmmj7DaDGpDoALSIn1itQOl4Ob8+YJQwsshB7c+U0vaaZZ+Xtct0BRUxoPacnAuHnuX2blA4uiP21vKiwlREeWpUJyTrcclqbzhj7IHmRYJLfbJ6LOUTAlfp4bRYNzSnvFWu//SfYx9XmNyICF8tOmmmVVldO5v7ttduQAeSMty1axAO/uI0CXvSInjqcQ9Ail99PraVucMmZ4DaNZJjCXyV3X00=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(346002)(136003)(366004)(186009)(1800799009)(451199024)(38070700005)(6486002)(71200400001)(6512007)(122000001)(6506007)(36756003)(38100700002)(83380400001)(41300700001)(478600001)(1076003)(2616005)(26005)(966005)(66476007)(64756008)(6916009)(66556008)(54906003)(66446008)(66946007)(316002)(76116006)(5660300002)(4326008)(8676002)(86362001)(8936002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEFTOEY2WTVBUEZUK1VDSlA4WW5LQVR2blFTV2FaeUFjWlVFZFEzQnFWajQr?=
 =?utf-8?B?NkJjbVRMTkl4RTNZaXNFWWhpbmhLNmFJWi80bkRtUUsyUFcvVlA0MGJyRFNT?=
 =?utf-8?B?S0kyRFJzMTRBbnhRVFBuUDBHWElYYUhnRU1aV3FTSkhUL2p3VnBCQlUwUnJL?=
 =?utf-8?B?QUxIcVFFOGJMV0RBNEhPbTRPNWFHaGtqbVlDNmdJclpjaXJDcVdncFZ1WVg0?=
 =?utf-8?B?MDZBM0xVM29KSjBLV1g1ZzloV0FPTmlBYmhMdmE3U2FodThlUG9oRnVRdnl0?=
 =?utf-8?B?blNuTVNhTFNCZVdHbENZdGtuNDNYdFdtck54OWx6ZThXVGNBTjE5NzBjNTZo?=
 =?utf-8?B?dDBEKzdoQXlqM0tsaDVVeG1pcEc2bkV6Zkx2blhsMFVxYjZYN2c1RU5JMzBx?=
 =?utf-8?B?VnB5NkNLU1U1T3p5U3d6a05LTnZBbFZZNXZ1TnFVaGR6d0ZnMGNLMjNVRVJa?=
 =?utf-8?B?bWx4Uk5OZE9QWVcvcUlaUWdXWnJxalNpMG1VMlZtMXRuNlh2WTBzdS85MUdR?=
 =?utf-8?B?QUhvZXVHZHBuT0NjYnFVWjlzQU1GT01GUVd2Z0IzYWZFZ3o0SlNzT0ZKZ0VJ?=
 =?utf-8?B?RnJXUlZvT0p5N09hblZMemZjRk55YmorQjZNaFdnNDViMGZzYjVNeENHbVJq?=
 =?utf-8?B?SHV0eFpSRmNBWDR2elI4cUsrZ1o2NFVGd1lCWXQ3NWE2V3J5NnlMa0pxOXhk?=
 =?utf-8?B?S1FoTm0rS1M0YnN0bUVZdTRCNnJNQnJkWDdQeHY5WW9GcDZLOTJUVDhoeVNY?=
 =?utf-8?B?Y1RhVEtYZ3lvZnlWbjhobGRkT3BpeWFLd09rbkRxblFiQ1Q5SEJZRysvNTQx?=
 =?utf-8?B?Mk9rdmZwU2F5NHdUUHl1TTV4OER0TEhnK3ZlQXZ1MGk5eEhyaTlyWGNSYjhS?=
 =?utf-8?B?WkZPZ082WGxwbVpWdWIyMzNGT1pVendMVFhodEE4R0dKalc2RTFZdnBqSEJk?=
 =?utf-8?B?QWhCZUhIaUh6aUJLRE5sTGhGRkhUMVUxUCtnSE95ZjdDV3JJeUR6M0p5Z2Qv?=
 =?utf-8?B?SnFPUktkWno4WFNxOExFN1NsT3YvdHZjdTFYbHhYZ0JEUU55VnBNN25USHNa?=
 =?utf-8?B?dnFrTHdwcEpXdTdHOXFQSVZhZ2NEMFZ3ZjV2ZnQwUi9VN3dHZVk5K04rYW9z?=
 =?utf-8?B?QXhXK3RoT05zakJ3OUMwMFdxWnRvMlZhei9NVDQxcTZDS1l4dlkxeGk2aDNi?=
 =?utf-8?B?Vzl5SGkxN2ppZWs4WkRGK1NvZnp1WFc2SStoTDhGVXlkdDZFcTYwQnkrTUVN?=
 =?utf-8?B?WGpwbEQxUVN6enpNUk9TblVmSXo0RGxHZkxZaGI2OXorckxaSXN3WVBSd0R5?=
 =?utf-8?B?enZrMjRES2YvZTRsVlVWNlZNTjM2UUtud25ZMDl5ODFBZ0hiQ3VENGdHeGRl?=
 =?utf-8?B?SlBNRHFybWtROHloMm1wZ0wzNm9aTzAveTRPaG41ZSt1ekFxQ2taU3ZqRHQx?=
 =?utf-8?B?QktReVozbUx4bm0yN3ZOQzR4d1Nkc003ZGlybGlYekNKMUduSlluU2pQRldX?=
 =?utf-8?B?NVRsRTllb3Y4U2NEcG5OZ1pKTVpldHBlVGlTSEc3cXdVak9EcHBiUzMrUXo2?=
 =?utf-8?B?cUh2Vm1DMGs1SlcwOUlUd0VBRzQ3bVVuRG9uQ1R4a3A4L2p5N205emJyaTli?=
 =?utf-8?B?MUVtU2NuTTI5Y2lsV2lSSWpVdU44RGlycnFHNnlaV05ncGdIWGdlbFpSSXRC?=
 =?utf-8?B?YjN6Sk1ZdHFVQkFyZ1dVQndDcHQ2TWxXZE1pbGRzMUxvZGVuSE5RQnFrNHk3?=
 =?utf-8?B?ZE1PY1FnRTZOQjRHUkJzSkF1NXVZVThJbGVzN3JZTFZleWxQa1dERFYwZmh1?=
 =?utf-8?B?VFpoQUo4UWI5blVDR2MrT214RlFqUS9WNHk5MTVXeHV6cG9hYUhMb0NIcDFp?=
 =?utf-8?B?QnJoa3RsVU91aUZ1R0YzLzF1ejZSZW1sU1lLbUkwQ0ZHbkx3RXpPL01VUmxJ?=
 =?utf-8?B?RmJOdUlrN3RvUEFFSSt3QTlsUmFKWmU1RFc0dnVpS0luVjhDMVY1d0d0Y2lX?=
 =?utf-8?B?VklZaG95c2JqNWhCZW5tSDlkUFFTTDVuRUhESEY1Z1dQRS9aTUc0VEZqYlU3?=
 =?utf-8?B?VFBNcXhRZDFaT1dkZitpRWRhNFF4NlRWMVJSMzFKK3prelM0NTY4bWsvQnEr?=
 =?utf-8?Q?74hkZcpLbGO/YLBMgurmLBMag?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CA88902E5613084AA90AB08452F9BE8F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?ejdXNXhQV0w2R1hSOHZLOExjMjMvOS82UDJzdFFydklBaUJYS2pUZWlwLzZC?=
 =?utf-8?B?OUduQ2gwbjh2ZExCTXl3ZkpwY1ZybEJXY2VRdjlDMlk5V0pDbGkyaTYvWTF1?=
 =?utf-8?B?d2ttUk90WFVHc3kvR25USXdNTEpoekNwU3dDMzFweWt6eVYwYXQ4N21FeENY?=
 =?utf-8?B?RXJLOHNWeE5mY0ZURmJyV0V5MXJJZmdVSGw4Z3A3YUlIbVpjTWdjb09DSzZH?=
 =?utf-8?B?U2t0MEFKMlpxK1lGOXBmeTNMeC9HWmJjRmZMOEpUWGxEaTRnQm4reUROSjJj?=
 =?utf-8?B?QzVYZnBJcm5Hd0RaK2ZRRkIyN0xtdGErb0I0NitkbTIwWC9rMGdXSzBqdno4?=
 =?utf-8?B?R1ZYVDNWaFFLdk1VSUFybm95RExSbTQxNUdGSG9LcWg5WmpESnAydjVncU5Y?=
 =?utf-8?B?bUQ4RW5wQlVadFRUQnU1aG1INkxLZjE0NTUrVXEyYmd3Vmd1aitLWElnQWpV?=
 =?utf-8?B?U2xWLzgvcW1lVk4vUUQ4djdNSnljSXhOQ1JNbmdVZHlEUXdlNlErU0lxVExV?=
 =?utf-8?B?ZytYa3k0OE5ESXBIZkxnNFk5MXBHdmtrVGVRT05lQ3hnQWNtbWM3T1A1WE12?=
 =?utf-8?B?VngxM1ZrNThnODNtbjgza3ZHc1F6RGRKN0dyc0xjbmNORUhiZUQ2NUpBc3V1?=
 =?utf-8?B?Wkgrek5lWlcxQWhNNWEzTWtKTVRSWFc3QzZwNkI3VHd4RmdjdDBwSUlybUZh?=
 =?utf-8?B?OGY4QTFYMG5MQjhLcGppSFROZ3VKaGpsYzdEUm9EUTZuTm9ZSis1NE00T3Ba?=
 =?utf-8?B?ZWNEL3UvcmFvVitpSTVncEZkZUFqUFN1WkZNRFJvYmE4RTh3Ym9MN3QvcUJx?=
 =?utf-8?B?cGtRSnlLNkhETzdYSDZ0WW54bXJTK0ZGcWl6MVNZazMrUzFXSWFwM2swYnQx?=
 =?utf-8?B?d3dJMGxoNTZLNzNhY3N4VXgvL0F1Ky9kRlMvNjN3VGt5OTRqZWdWZ0p5dFFa?=
 =?utf-8?B?WHF2dUc1bnpaK29jNkRrM3NjaVdrZ1I0WmpVN1MvSzd1Ny9BQklDOTd4Q09l?=
 =?utf-8?B?eThTU1BybFRES3dsZ3Z0SThWZ3gyZ3BqNjR4U3pEdGlsTXNyM3gwRG11V1pD?=
 =?utf-8?B?MXA4Yys0OGZ1WDNpRFhNOHpON2NoL1MreC8wNks0eUpOMDNQSEFjdHVPcWNt?=
 =?utf-8?B?UEp1TEVzcUlJdWxyRnNncjFDclc0eVZ4ZnhTaFFpNGMzRGUrOHFhQW8xNXI5?=
 =?utf-8?B?aCsyenEzaWkxQ2hVZ0kxSHh1anF5cTlwVlVlMEtPOWNuSkUzMFNEbFpEbXND?=
 =?utf-8?Q?fF91eI2TSkKLHwe?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb2a372-2599-4b74-31c0-08dbb3f46059
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2023 00:57:17.2751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WEbLDT7tAhPcHcOYseBLnMK8eOYu/QYmPfk32GqYElq0ecJSTVcz/QuIE9+NdaiAMnjFe2ng1H0XjqPrbHXTew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5291
X-Proofpoint-GUID: TkUXIQq5t3JDIXZ7B5HZJtR5EZR4j2Tf
X-Proofpoint-ORIG-GUID: TkUXIQq5t3JDIXZ7B5HZJtR5EZR4j2Tf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_24,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 adultscore=0 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 mlxscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309130005
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgS2VudGEsDQoNCk9uIFdlZCwgU2VwIDEzLCAyMDIzLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+
IFdoZW4gdGhlcmUncyBwaHkgaW5pdGlhbGl6YXRpb24sIHdlIG5lZWQgdG8gaW5pdGlhdGUgYSBz
b2Z0LXJlc2V0DQo+IHNlcXVlbmNlLiBUaGF0J3MgZG9uZSB0aHJvdWdoIFVTQkNNRC5IQ1JTVCBp
biB0aGUgeEhDSSBkcml2ZXIgYW5kIGl0cw0KPiBpbml0aWFsaXphdGlvbiwgSG93ZXZlciwgdGhl
IGR3YzMgZHJpdmVyIG1heSBtb2RpZnkgY29yZSBjb25maWdzIGJlZm9yZQ0KPiB0aGUgc29mdC1y
ZXNldC4gVGhpcyBtYXkgcmVzdWx0IGluIHNvbWUgY29ubmVjdGlvbiBpbnN0YWJpbGl0eS4gU28s
DQo+IGVuc3VyZSB0aGUgcGh5IGlzIHJlYWR5IGJlZm9yZSB0aGUgY29udHJvbGxlciB1cGRhdGVz
IHRoZSBHQ1RMLlBSVENBUERJUg0KPiBvciBvdGhlciBzZXR0aW5ncyBieSBpc3N1aW5nIHBoeSBz
b2Z0LXJlc2V0Lg0KPiANCj4gTm90ZSB0aGF0IHNvbWUgaG9zdC1tb2RlIGNvbmZpZ3VyYXRpb25z
IG1heSBub3QgZXhwb3NlIGRldmljZSByZWdpc3RlcnMNCj4gdG8gaW5pdGlhdGUgdGhlIGNvbnRy
b2xsZXIgc29mdC1yZXNldCAodmlhIERDVEwuQ29yZVNmdFJzdCkuIFNvIHdlIHJlc2V0DQo+IHRo
cm91Z2ggR1VTQjNQSVBFQ1RMIGFuZCBHVVNCMlBIWUNGRyBpbnN0ZWFkLg0KPiANCj4gQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gRml4ZXM6IGU4MzVjMGE0ZTIzYyAoInVzYjogZHdjMzog
ZG9uJ3QgcmVzZXQgZGV2aWNlIHNpZGUgaWYgZHdjMyB3YXMgY29uZmlndXJlZCBhcyBob3N0LW9u
bHkiKQ0KPiBSZXBvcnRlZC1ieTogS2VudGEgU2F0byA8dG9zYWludS5tYXBsZUBnbWFpbC5jb20+
DQo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNiL1pQVWNpUkxVY2pE
eXdNVlNAZGViaWFuLm1lLw0KPiBTaWduZWQtb2ZmLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5n
dXllbkBzeW5vcHN5cy5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgfCAz
OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCAzOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiBpbmRl
eCA5YzZiZjA1NGYxNWQuLjM0M2QyNTcwMTg5ZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2Iv
ZHdjMy9jb3JlLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gQEAgLTI3OSw5
ICsyNzksNDYgQEAgaW50IGR3YzNfY29yZV9zb2Z0X3Jlc2V0KHN0cnVjdCBkd2MzICpkd2MpDQo+
ICAJICogWEhDSSBkcml2ZXIgd2lsbCByZXNldCB0aGUgaG9zdCBibG9jay4gSWYgZHdjMyB3YXMg
Y29uZmlndXJlZCBmb3INCj4gIAkgKiBob3N0LW9ubHkgbW9kZSBvciBjdXJyZW50IHJvbGUgaXMg
aG9zdCwgdGhlbiB3ZSBjYW4gcmV0dXJuIGVhcmx5Lg0KPiAgCSAqLw0KPiAtCWlmIChkd2MtPmRy
X21vZGUgPT0gVVNCX0RSX01PREVfSE9TVCB8fCBkd2MtPmN1cnJlbnRfZHJfcm9sZSA9PSBEV0Mz
X0dDVExfUFJUQ0FQX0hPU1QpDQo+ICsJaWYgKGR3Yy0+Y3VycmVudF9kcl9yb2xlID09IERXQzNf
R0NUTF9QUlRDQVBfSE9TVCkNCj4gIAkJcmV0dXJuIDA7DQo+ICANCj4gKwkvKg0KPiArCSAqIElm
IHRoZSBkcl9tb2RlIGlzIGhvc3QgYW5kIHRoZSBkd2MtPmN1cnJlbnRfZHJfcm9sZSBpcyBub3Qg
dGhlDQo+ICsJICogY29ycmVzcG9uZGluZyBEV0MzX0dDVExfUFJUQ0FQX0hPU1QsIHRoZW4gdGhl
IGR3YzNfY29yZV9pbml0X21vZGUNCj4gKwkgKiBpc24ndCBleGVjdXRlZCB5ZXQuIEVuc3VyZSB0
aGUgcGh5IGlzIHJlYWR5IGJlZm9yZSB0aGUgY29udHJvbGxlcg0KPiArCSAqIHVwZGF0ZXMgdGhl
IEdDVEwuUFJUQ0FQRElSIG9yIG90aGVyIHNldHRpbmdzIGJ5IHNvZnQtcmVzZXR0aW5nDQo+ICsJ
ICogdGhlIHBoeS4NCj4gKwkgKg0KPiArCSAqIE5vdGU6IEdVU0IzUElQRUNUTFtuXSBhbmQgR1VT
QjJQSFlDRkdbbl0gYXJlIHBvcnQgc2V0dGluZ3Mgd2hlcmUgbg0KPiArCSAqIGlzIHBvcnQgaW5k
ZXguIElmIHRoaXMgaXMgYSBtdWx0aXBvcnQgaG9zdCwgdGhlbiB3ZSBuZWVkIHRvIHJlc2V0DQo+
ICsJICogYWxsIGFjdGl2ZSBwb3J0cy4NCj4gKwkgKi8NCj4gKwlpZiAoZHdjLT5kcl9tb2RlID09
IFVTQl9EUl9NT0RFX0hPU1QpIHsNCj4gKwkJdTMyIHVzYjNfcG9ydDsNCj4gKwkJdTMyIHVzYjJf
cG9ydDsNCj4gKw0KPiArCQl1c2IzX3BvcnQgPSBkd2MzX3JlYWRsKGR3Yy0+cmVncywgRFdDM19H
VVNCM1BJUEVDVEwoMCkpOw0KPiArCQl1c2IzX3BvcnQgfD0gRFdDM19HVVNCM1BJUEVDVExfUEhZ
U09GVFJTVDsNCj4gKwkJZHdjM193cml0ZWwoZHdjLT5yZWdzLCBEV0MzX0dVU0IzUElQRUNUTCgw
KSwgdXNiM19wb3J0KTsNCj4gKw0KPiArCQl1c2IyX3BvcnQgPSBkd2MzX3JlYWRsKGR3Yy0+cmVn
cywgRFdDM19HVVNCMlBIWUNGRygwKSk7DQo+ICsJCXVzYjJfcG9ydCB8PSBEV0MzX0dVU0IyUEhZ
Q0ZHX1BIWVNPRlRSU1Q7DQo+ICsJCWR3YzNfd3JpdGVsKGR3Yy0+cmVncywgRFdDM19HVVNCMlBI
WUNGRygwKSwgdXNiMl9wb3J0KTsNCj4gKw0KPiArCQkvKiBTbWFsbCBkZWxheSBmb3IgcGh5IHJl
c2V0IGFzc2VydGlvbiAqLw0KPiArCQl1c2xlZXBfcmFuZ2UoMTAwMCwgMjAwMCk7DQo+ICsNCj4g
KwkJdXNiM19wb3J0ICY9IH5EV0MzX0dVU0IzUElQRUNUTF9QSFlTT0ZUUlNUOw0KPiArCQlkd2Mz
X3dyaXRlbChkd2MtPnJlZ3MsIERXQzNfR1VTQjNQSVBFQ1RMKDApLCB1c2IzX3BvcnQpOw0KPiAr
DQo+ICsJCXVzYjJfcG9ydCAmPSB+RFdDM19HVVNCMlBIWUNGR19QSFlTT0ZUUlNUOw0KPiArCQlk
d2MzX3dyaXRlbChkd2MtPnJlZ3MsIERXQzNfR1VTQjJQSFlDRkcoMCksIHVzYjJfcG9ydCk7DQo+
ICsNCj4gKwkJLyogV2FpdCBmb3IgY2xvY2sgc3luY2hyb25pemF0aW9uICovDQo+ICsJCW1zbGVl
cCg1MCk7DQo+ICsJCXJldHVybiAwOw0KPiArCX0NCj4gKw0KPiAgCXJlZyA9IGR3YzNfcmVhZGwo
ZHdjLT5yZWdzLCBEV0MzX0RDVEwpOw0KPiAgCXJlZyB8PSBEV0MzX0RDVExfQ1NGVFJTVDsNCj4g
IAlyZWcgJj0gfkRXQzNfRENUTF9SVU5fU1RPUDsNCj4gDQo+IGJhc2UtY29tbWl0OiAwYmI4MGVj
YzMzYThmYjVhNjgyMjM2NDQzYzFlNzQwZDVjOTE3ZDFkDQo+IC0tIA0KPiAyLjM4LjENCg0KQ2Fu
IHlvdSB2ZXJpZnkgYWdhaW4gdXNpbmcgdGhpcyB1cGRhdGVkIHBhdGNoPyBJZiBpdCB3b3Jrcywg
Y2FuIHlvdSBhZGQNCmEgVGVzdGVkLWJ5IHRhZz8NCg0KVGhhbmtzIQ0KVGhpbmg=
