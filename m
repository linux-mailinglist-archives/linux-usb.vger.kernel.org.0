Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3791F6BBDA4
	for <lists+linux-usb@lfdr.de>; Wed, 15 Mar 2023 20:53:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232704AbjCOTxh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Mar 2023 15:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232934AbjCOTxe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Mar 2023 15:53:34 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02ED03B3E7
        for <linux-usb@vger.kernel.org>; Wed, 15 Mar 2023 12:53:27 -0700 (PDT)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32FGP589029479;
        Wed, 15 Mar 2023 12:53:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=T351mwiB5jfnWk44daBryET4gPaBEUsmjWsO1djcLf0=;
 b=aYmJXJMpfS0bYhJS3FoVf6UFYoyHDVZ3pTzWN3CXboAc1Q8UecKeP2YIQTGo34h9QHy/
 tSfwHL5xhaRTBja6MzVuBHXNZi1kF0aO41WlBVbDIPvP79RIFOrZ0HV4YW+j0gzMx9fK
 c3QYdYcmf6oonZKUtOnWsHKOZp1vkJACWg8DhL07ZC1wt/diRURcc75iLvK7V2KWVVnA
 0p2zJOlP7CB1N+08dC3k1DpD9WZe8aLlPVhRYNjRyvTMTbYy2ot7St+wFpTJDcBW5Bm8
 RYzQJyLShShoulmMn5UpCjhvMKaDYzaetjBZATc2T5BVBuYfrpVaTJxg+h6+lqvgkT75 Sg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3pb2rqn616-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 15 Mar 2023 12:53:23 -0700
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8AE71C05AF;
        Wed, 15 Mar 2023 19:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1678910002; bh=T351mwiB5jfnWk44daBryET4gPaBEUsmjWsO1djcLf0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=BSWFlF2bHo+H23gvs+lWa4fSJzCpjoRFSRdqx9Ydeo30Z18/s9ZJAXVup6CHAzxLx
         EQovuD/zlb/ujMgpTkcu4fnZfZAOB65dWXMmueEi78E8tGlquaz9TBg+1uHcrF/jQK
         nT2/yqpWIrEp128CZtlaNuUMjDXjSe57cSOjQPV4h7idVJyvb8zbxy0FeTcfWjBe7O
         LVyFI30NuE545OIQqzPDUARBvOtpCcubxDl3WnHl16TdIcz7/g/a1MiLe3wPn9V+Mk
         JyDri1BLeAupviqXuiTMxtm62XU9qcM2Z8UgXMCnhS8uxb1QPKdTg0H8eMQaatH3tu
         KR+cuyWkpr0+w==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id E1922A006F;
        Wed, 15 Mar 2023 19:53:21 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 512B1400B6;
        Wed, 15 Mar 2023 19:53:21 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="UoH0LPNt";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwuNmSUEB20sFPjMgP47/Mg43Y7kayuu0RcxZ/c6XXnqxM3mgJczKk13SCBrQUM61Xav2eu+MA0LDg2AveqbjZcjtWtIvVgcgRNM6faWk4CDSKbXKdKO/qtzuFlV3Y0vqnPuV+kHEchx2aN+90gBqXHes0txHHXOBqje5M3LYlfXke136z3VCVrXXVaIMmld2aqquz+5rtpaCqGIcsshaU6P6i4YmH0QsQ0t9DZmyrmkO0J4cNBXxZs5TRYHEM1X6rsq8gM0HQT+TcPOAOKAC0kl5sv5EwODtdws32z2uvZBS8EsWnqENBJavM+TzC3s7osPFj6BHXo00hYl3fXm3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T351mwiB5jfnWk44daBryET4gPaBEUsmjWsO1djcLf0=;
 b=lMQwBP5T/yYofyFMy45JWMQ91fGTLYreAy5/a9fJRO7Y9IsvS6ivUx9yHsYYmmxqorykehIa3YgX3hDSoBQOg3TeonPFvuQe2cPLMIUUfB1tuiKVQw58OHooCtazqAbnd7DMeqGaD3q2SCwI+ua0Dk4KBBm94TirUMejZUl02VKNk9yTOd3wqKDDN9OGAvWHbN2oGeojlHpVBC1L2iK/yvtXjkMzyN6boPpYNWPKA/7kI5hMCiO8VIAFDRU0DMh1xMJlp4LhBH5LWVFUcV9n+SM6gbgXMDna+4t7Py4sVNGS6VuGtln/yaygDUKWvNMozJ6Sw5ozvxpLAsaHoIGBWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T351mwiB5jfnWk44daBryET4gPaBEUsmjWsO1djcLf0=;
 b=UoH0LPNtOSLJaeP4L25YVTk7+cxXaNo8NA0UPWYBQqmiAYVZBJEZ6Xx08ueFkBt6KWHsjPvhV7GBpmqUpEsRtl+qtfyWRI0yG9kyDpR5Aenx3k+j/pmiT70c/vgSGq8NJZS1GcbAzmouOGO2uA4ifYTiSAIIwltyK3FNQP61Cdg=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by CH3PR12MB8712.namprd12.prod.outlook.com (2603:10b6:610:171::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Wed, 15 Mar
 2023 19:53:18 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3161:c44d:8bb3:423f]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3161:c44d:8bb3:423f%3]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 19:53:18 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Li Jun <jun.li@nxp.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: add 2 registers dump for debugfs
Thread-Topic: [PATCH] usb: dwc3: add 2 registers dump for debugfs
Thread-Index: AQHZVy5I1md36booeEK6sUdv55ku7a78QS8A
Date:   Wed, 15 Mar 2023 19:53:18 +0000
Message-ID: <20230315195312.4a5x3ziolft6fvaa@synopsys.com>
References: <1678876758-11272-1-git-send-email-jun.li@nxp.com>
In-Reply-To: <1678876758-11272-1-git-send-email-jun.li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|CH3PR12MB8712:EE_
x-ms-office365-filtering-correlation-id: 93e5e7e4-67ab-4737-450c-08db258eec83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jW075h4uzgViK9lUpx7w/XbbrQUkXawzw1RjVM1nBN8IvGCkYfdBp+JFUYepotxGnAkF6GcZ3ZWbgmrVGe20HE3XOSw8feMsUa8RA/ZYPdszJ2n41s5A+iX1Zi+EJ+hzZYr3BpNFDQqfiXqIz6zvPzh+4dKkAeQO98Ts9le1Sh8tLLyTxPUgG+D9P7j1G112R9B2FYMhAs4PoiNDuoETETqa2HuuJKF7bBS0I0aU8CfW0Rvo47SzdC7njKamWv2FhLKBkwGb9wqOO+b7K61Lz54qY6XJlsZQXYJS/dD8sVBhaSHnZnHldlizoR8zGH91ZjQ3cuwmIcAbojQ+rZ8HYE6TnjtM14IwFWCiLeqocu0SUiXXO7QvCbzeJYSfrTU5lonFJ3p7Q0Td2Y0uAaQ74Uok9ZEhZJyR+wmNEuQHaDmCzEoz6erACjysz89cqaCeDLPPi/inJIjI1fvTE3POAZzpjwIHOnzgdUfNqNTIn+eKeJoIO7xZTBl+rIjctRhc2dyCNNneGqLUO46aBZmrsZj1Oz84IBLD3umWI4ybMIuOcx5NOV/hrqHxKdD7DI48WvBU2LMiHCGGZOtEEXwHVl821JHjbqllypFeWGEn9c84oapraz7lIjGbnBxEgOSMFj24q8u1szzIm3jjCHvjd75fYR6+H9VYdJ8vX8vmLkNs+m0ygvY5N6Ll+TciKwINgDlX2KHqjvFR+yo63m40qg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(376002)(346002)(396003)(136003)(39860400002)(451199018)(2906002)(38100700002)(122000001)(38070700005)(6506007)(478600001)(316002)(1076003)(86362001)(66946007)(54906003)(6512007)(36756003)(41300700001)(8676002)(66556008)(66476007)(66446008)(4326008)(26005)(64756008)(6916009)(2616005)(6486002)(186003)(4744005)(8936002)(71200400001)(76116006)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0ZKSy9ONkNtaUJ0R1VqNWdpeTZxUDgweEgxV0VDMER5NVNtQzRYYnpUVFl3?=
 =?utf-8?B?RGh6TjN5ajcvWEVJOUlaWDVSVGFtdEVWcVpZUHBHUXNSYkRjbnRTUHBMWWN0?=
 =?utf-8?B?b1BMNGNBNU94Z2tUd3ZXaUxOU3VKbkgxQTgreFF6dmNBQWVGeVdyUDNzMFc5?=
 =?utf-8?B?dTFyQTFUemw2T2dxWnNRcVV1ZC9MdmdZeVkzcFRFV1FQK2M0czRsb0ZFZWg2?=
 =?utf-8?B?QmRlOCsvVUswL1V5SE8zd28wbG5Gc1pjWkRxcFpGQXErM0VxbHJJL0hHQlBP?=
 =?utf-8?B?MDZ2NHhOWEdlc3ZiRWFBRGF4U3dZSUZHaGZnKzVsUTRGVHNoYWJlVk01aWt2?=
 =?utf-8?B?NGZQSmdRQnBGODlZOElod0p0TGFzaWR4YWpETFVLdlpZQS9YeFUrV0lsKzEx?=
 =?utf-8?B?YmdyUUl4V1RFK3A0NzRwTHcrbFpueW1YM0g0RTEyRWdoY25rNzhScHNGMWhW?=
 =?utf-8?B?WFA3QVNQMWtpTGpqQ3AzeWVsWUZQWTR6SEFYYUE1SGpiNW5mYWJGTVFBZlVM?=
 =?utf-8?B?dXc1Y3p1ZDAwMjIzTWtoVTFTWUZOcHpZQVpYOEljRjlrYmEyblJ0SmNrTDNn?=
 =?utf-8?B?ZzdGZ0ZWdU5mOWtyL0IvSk91cG96R3VrOEVZU0pQSzRHVUluRFB2b0RMaDNU?=
 =?utf-8?B?Z0FZWmNxMW1nMThvSGg4YVBVR1M2Tklrdmx4SXo2ZlRhSTJvTVFLSm9jZkpl?=
 =?utf-8?B?TDViTmg3N1AybzJjbm5IUWNJa1BPZTlkMElhTmtSQlI5eXZjUDRZWm1qRUUw?=
 =?utf-8?B?ckFra1czV1V4NHhCUi9mWG1MOUpUVzQ0WE52UVkwT2N2Y3IrV2ovK2RwSzU4?=
 =?utf-8?B?RFYrY0FqdWxBTGZXdXAwQ0ZaVDlpTGpIV2V0MHJBYnZBRnlKWm1rZ2tqWk0w?=
 =?utf-8?B?eml1cCtKV0IzWTZ4Um05S0FET0R5WG4wWDFWRmJBMW0wRUNWRXVFSmY5OWph?=
 =?utf-8?B?UG1LRWM4dno5MzhRdXpkcVBpa3UzVE9lVFlpa2d5aVRnV1RSVDUzUG5HOTBQ?=
 =?utf-8?B?Q2sydE4yR2Z3SXlYRFd0SGs4bGFJcjJsb2NCZGNpUEJoaUF0eXJSY3UxeThr?=
 =?utf-8?B?cEJxVm1aK1ZnUTVUNC9HSGFGQi8xMDFMRm52RDFPNE5NT1VzckxaY0VtQlBs?=
 =?utf-8?B?cXVUejJ4bEZtcWhObjdINTVQOHBZbzhydVliN044ellXcmRBZkFpREVVa3RN?=
 =?utf-8?B?ZjRoYkp3MVQ0RjdGVGR2RXRCR2Q1NHRteXZaN1JVZTMwUEVBMDFDY3NsS0RW?=
 =?utf-8?B?L2xkMnNOOE14dlZjbXBBRTB0MlpxWVZucFRCQmdnZnYrMXVKNnhhM3BOQU1q?=
 =?utf-8?B?YkZuUy9YZFBxQXh0bTVKY1pwOGVPWVRQc3l2WEFpSEYxcWkzVnBkbm1kaFRZ?=
 =?utf-8?B?ZVZFNFlPblJHVlBuNkVnS1NzUzZxajB0eXdCRkZPWVJGVTUwdzRJbmF1bUtV?=
 =?utf-8?B?U2VKWEJPaGdEUTBUZU5hM05CZU4vZFdBOGNLOHVXWTVWR0ovcm9XcGRoNXla?=
 =?utf-8?B?YlFUQTM0WjNvYnZGUjdLRjZwYXBRb2JtUVY4TFNpcForM0VZSUFKby9hMWV2?=
 =?utf-8?B?WDBod3FqUUd5bmUxOStLZ2hFcHR6ZFlXbjgrRTFocUlVRUhrQmhQblptdE0v?=
 =?utf-8?B?eTNYSHl6VDRNVlpvS3BwOVFmbFA2ZE9PV0lzUi9FaHNBaDBueWs0R253QTN6?=
 =?utf-8?B?YUd1NTVJVk1GQUhNeTNOVE5KaXUzdnA3UEo0enA0T2xqeTA1Z0ZuMjdvd2pn?=
 =?utf-8?B?THI3Uy9kYnlhNGV6R0RJanczS3pRdEZlalJaV0dsMHNaRnRUZk9LMXBuVzJU?=
 =?utf-8?B?L1BXNEFwS0ZxVlQxT1VEV1VEQWJ3VFV6eEpmQldibXpGTXA4VlpiTXBVQkNF?=
 =?utf-8?B?MU1JQXQvemZDaUxDUTE5ZmlQcnVwbTJ4T1F1dE1ZY3BaUEpseDIzdHhPRWRr?=
 =?utf-8?B?d3QxQ25xdlEyQUtxbmtiQUFDeGkvOEwrUHNucFdMVzZQSkIrLzFuZTNrem1S?=
 =?utf-8?B?M3lUOW1GZTVEVS8xallJLzM5WEQ2RlBqQWpRbjZQbkdpNlRicksvNURGaVZU?=
 =?utf-8?B?dEVhTzNOTzNrQTVLZWNuS1pzS0IvdGFEeTNITnZ5TCtpTmtLUll1dGJCSWRu?=
 =?utf-8?B?ME5DekJ4WWh0SHV2cHRITzljVUsvZmEzamYwZkMxdGRhYWIveVVCcEZxSUxs?=
 =?utf-8?B?T1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E92C742005AA8047B28685E1BF4C89B8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: cOwT3xHlee/c6Sosp+zCjGUGKfZJDD2Uq30DMpyuLROgEiqd7FAVONn6S73fUWfmlTJhsf715V5mYJa2I7bBkJIakuQ8Nx6HibLMJesdB90OnOIguhiYEEiAakuxNla5tlteuVywB8WR5KBmHXd5XScayrdMn8pVwnLjG2KmTlGpv9zyWGklu29XGQ32/ynQ8z7GRCNhDagVVC5aSPXscq3XNPRxxAprJViwNZSfzwArAmnsROFRDNlUUy5OF4f1+13TMQPS+koXrMWykY3yRtIPuTjTONjoyUNF06Opifbgt0DxO/yaTmVb7dkgUXMKfd8AwfXRVDpF6c5odIIawudSvGpDQAPM7Li33sCK+yffToToaHyYDKkLTrIzPCBiUFN3+8RbAgFsJO+XaJMwogn5NoSIngShQHp8dQMvtKXI7tkMVIbhSNx38TfSYcV/mRbfF+KLEMhfrqWphON2Q9YJg4aweeQchietiwHCQzCrh0Vmj7focqt+ajEQpdy/GMEz1V2p5dcNtVN6hpv0ysIgZeGwLEcofRDgpu+CqkghUcbPYhOSF/SoB7iFqJn2WbGMblSHM9OSd39bTFEoTScMNKbJ6b9A2C+rig2Se8no+rvZ2ZhaXy3/JlJdU23fer/sGi8NLJ9pC9HCswa789QLixRXv+6qm2aa9r2oHR6srzj7mialPUFALIPr1BTiGToG/jemf+v5pWEthr0BbBtw6zK6yV5MxYaEf+PB9A+ikSQCQjQ12AHc7rde4gTHxqgGsshNIoeMxjXM/jPSAuvkRB3zYUQzyqmG3I4LY/pIk1r2bkGMNWOi3VCz7DGzJVMwPuimKmyjN9CFG8hHjPTRHip8te1vwj35PSZ/a1a3hdMVrLBlks2NhRPXrY9G
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93e5e7e4-67ab-4737-450c-08db258eec83
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2023 19:53:18.6041
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rtRueUB9WqqBin8qjHE33kMHdw5Bf8SKZXH00sahpQkG1irH8F7aAaf3k0zKfui0RVEwTQJVkUCn5h9zlRWDYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8712
X-Proofpoint-ORIG-GUID: 1-b8kP4IgirC-zLX9VRsarce-ofRlYIm
X-Proofpoint-GUID: 1-b8kP4IgirC-zLX9VRsarce-ofRlYIm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_10,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 impostorscore=0 mlxlogscore=702 priorityscore=1501
 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1011 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2302240000 definitions=main-2303150166
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCk9uIFdlZCwgTWFyIDE1LCAyMDIzLCBMaSBKdW4gd3JvdGU6DQo+IEFkZCBHVUNUTDMg
YW5kIEdGTEFESiByZWdpc3RlciBkdW1wIGZvciBkZWJ1Z2ZzIGFzIHRoZXkNCj4gYXJlIGluIHVz
ZSBub3cuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMaSBKdW4gPGp1bi5saUBueHAuY29tPg0KPiAt
LS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvZGVidWdmcy5jIHwgMiArKw0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMv
ZGVidWdmcy5jIGIvZHJpdmVycy91c2IvZHdjMy9kZWJ1Z2ZzLmMNCj4gaW5kZXggODUwZGYwZTZi
Y2FiLi41NGQ0Njc4ZTYyMzIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZGVidWdm
cy5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZGVidWdmcy5jDQo+IEBAIC0yMjksNiArMjI5
LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkZWJ1Z2ZzX3JlZzMyIGR3YzNfcmVnc1tdID0gew0K
PiAgCWR1bXBfcmVnaXN0ZXIoR0VWTlRDT1VOVCgwKSksDQo+ICANCj4gIAlkdW1wX3JlZ2lzdGVy
KEdIV1BBUkFNUzgpLA0KPiArCWR1bXBfcmVnaXN0ZXIoR1VDVEwzKSwNCj4gKwlkdW1wX3JlZ2lz
dGVyKEdGTEFESiksDQo+ICAJZHVtcF9yZWdpc3RlcihEQ0ZHKSwNCj4gIAlkdW1wX3JlZ2lzdGVy
KERDVEwpLA0KPiAgCWR1bXBfcmVnaXN0ZXIoREVWVEVOKSwNCj4gLS0gDQo+IDIuMzQuMQ0KPiAN
Cg0KRG8geW91IG1pbmQgdG8gYWxzbyBhZGQgVkVSX05VTUJFUiBhbmQgVkVSX1RZUEU/IFRoZXJl
IGFyZSBvdGhlcg0KcmVnaXN0ZXJzIHRvbywgYnV0IGZvciBub3cgdGhvc2UgMiBhcmUgaW1wb3J0
YW50Lg0KDQpUaGFua3MsDQpUaGluaA==
