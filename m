Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE1B77932F8
	for <lists+linux-usb@lfdr.de>; Wed,  6 Sep 2023 02:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238251AbjIFAoU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Sep 2023 20:44:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232283AbjIFAoU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Sep 2023 20:44:20 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5F089E
        for <linux-usb@vger.kernel.org>; Tue,  5 Sep 2023 17:44:16 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 385IP8Sb013902;
        Tue, 5 Sep 2023 17:44:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=5UTgao6Fyamo244OlkxXGBG9VXa2Ssz35DBQcZNgvoE=;
 b=uPrNvhH26GyKwH5YBLjE/i6Arzb9snjhPyxgIM+MyvpJu4DuE9yWO7Le53bFTgt53+p6
 YRrMpIKXz4BoesxFtrwq4M9kN3kOuvC0uHZiIZAAcs89/X8nsJbhV38qMjYiaYFji1iw
 /2iKUIIAYwHEmfWb+QRTrfq6uL7Y4RBu4fGWtdFd5JjENXDA4PW+6MNfw1Eb3OhKMPUp
 DnGZRbgBLTTRSgB6wrz8zpZWzviCTkyEB2jf6+nApsgEg6y2oncItFkNwQViz8lnGR35
 AV/2Rt8YwBZBJ63AUx1yYDexTdtboz+OgUlHJRCQr05fvQTplZEo2FFC7SAhOrO0Gvb0 8g== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3sv4a5ds9g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 05 Sep 2023 17:44:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1693961047; bh=5UTgao6Fyamo244OlkxXGBG9VXa2Ssz35DBQcZNgvoE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=IY9XdCgkYDrl3lof3WmPbDjbjoem1j6bovupaFJOYRBkCJpZIGlK0g0XtjqD7vRZ0
         7BtjdDwD+bDW8X5kjb/bIN37hXC69A7TuVQ34pKdFZp2KHhW5OXHcc0f+xLRduNwXy
         ikmbQ+xEr5u2Zb25L97YyndppdJRKWzht1pLHR8Q4D1laHq39dTYFZgHLV5AzdoCj1
         /u1KqftnrNig77lnT3U5tZ9myTeG+2YOv+Ipwgd8ccAec9zsyE1oRhCFB9nzlz0dRk
         9uwfK98NNHeU83SqVTdTbF7zuq48ANo9UzEG8IsOTBGQ3c6mnZEt6bX4oDoosikn0b
         qfznwP/Raf7Ug==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9283D401B8;
        Wed,  6 Sep 2023 00:44:07 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 3784AA007B;
        Wed,  6 Sep 2023 00:44:07 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ZtyDXIEf;
        dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 895264058E;
        Wed,  6 Sep 2023 00:44:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zp7nSaSx6LWVwtpsys6/4cgR1fQ1GCtSmW177/DNNWyKt56pHkXkAkp9q88HFagg2A4vGvH4KP25NWvuFmqQshMVk0YphlgJCU4RWk1H2aJxFUzGuvnoSXi74vGY4Mx4/lDGEhpw1pmnyMpoERcrzkZC7ZwDMovAvj83zcSbPDMuTGIEACAuf59p9GV68rcY8MIv1qMFryL8g8HdSaWSZGIgYxE0bjWGSwyRFMhlKcqZQuS4MAU15HFIA19Y2FY2hX8W1paB8mDYn8K7mZsTI8/I99STGewGZDKikDNRKkoboLqL/jsEcy9/J1eS1uDmuaZ4fEyrq2A/4TjEj5dkow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UTgao6Fyamo244OlkxXGBG9VXa2Ssz35DBQcZNgvoE=;
 b=BBDTZ2wsM7Xk4er2ElikneuSqmOoJgkvtWzr/SXoqBwUBPO3ck8+e9RP7GAoCl5T9Qco/2LzjrdexG5y9kG19teE4gQUR0gxCgGkXZD91+pB/hLSpFC0MC58acAFgjCPpP2H+VwSESoFOb0p3s0taxJgjSmGDUy1DBuzNXlz1fX1DJ4QoqqAr+7nmu7kQoLXkqv9iqgfZYyXkDF3dGBvVtNRPszY1FHfI8vq20t01lEt3W2RXiYpTRRSeNqgnHy8ZGumvWwUK81748isC5Phh+9b5n9qbaRQOrO7SfulnlQnU5ZKWrJDMFhqhmRL5EAjyK80iqug+vsVQa3Lv96GMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UTgao6Fyamo244OlkxXGBG9VXa2Ssz35DBQcZNgvoE=;
 b=ZtyDXIEfLNGf9JqlSG/fQPi4DIR0nbz6BBOcvdCABP/C379ioHpM3/8Zz/FLGcCzSZw3c2IW8/MeoiI3JJi46YS0nCuBbxm0Lk8c5OJi9qDwsQXwfeCKBp+qPgfY+b+NtDiP3rLQ/8YYVKFsmAS1WyAsvDdR6cldyzWABvvPImI=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by PH7PR12MB8106.namprd12.prod.outlook.com (2603:10b6:510:2ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 00:44:02 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::548c:ae3:537f:ca2f]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::548c:ae3:537f:ca2f%5]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 00:44:02 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Michael Grzeschik <mgr@pengutronix.de>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "stanley_chang@realtek.com" <stanley_chang@realtek.com>
Subject: Re: DWC3-Gadget: Flickering with ISOC Streaming (UVC) while
 multiplier set on Superspeed
Thread-Topic: DWC3-Gadget: Flickering with ISOC Streaming (UVC) while
 multiplier set on Superspeed
Thread-Index: AQHZ3FhJKJr5gUY68kuSvYhFApjTyLAFL1EAgASHkoCAACG1AIADJSKA
Date:   Wed, 6 Sep 2023 00:44:02 +0000
Message-ID: <20230906004353.ksxjazs4iaejnynk@synopsys.com>
References: <20230831221242.GC20651@pengutronix.de>
 <20230901013118.iqpegkklfswdkoqc@synopsys.com>
 <ZPULnRSVgd5S3Cao@pengutronix.de> <ZPUn5H0L/M7aBTZI@pengutronix.de>
In-Reply-To: <ZPUn5H0L/M7aBTZI@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|PH7PR12MB8106:EE_
x-ms-office365-filtering-correlation-id: b610b996-a54b-4028-0fae-08dbae725dcf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2XG4x3MofyRTFB6SjiGvjVoXkH+yO+rWlo5DHXzYVSLShDVSlU+iXbkih+SkneLmK9f5xEaB2NhcSbiU6gsfKHkLOgqg0bp5+8SFzfOwdg7sIu4uf52Yg40zN0AyCqvAgYVHgZb5p4dh9d2HkPQtFmlXm4bi097QGq1UJlnWwkhRkt8FfP37hz7TFicvmU5zrvQGrLHsiG+G47wWDrWPQEUO2PLTef6PVduo0Cf9mrtF5bedzr62VKUMEL2b3mDVBR1gG3uQwl6Q7jp/jvCFspHFFE4H0xtmzpBjDIaDU5bC8XK+XezZpeASjeozJ2Ym7s47/r/Uv2pLjndAwJ+I5nByXuf8+Gk/tX1PcAWzlaeqBLWig9qLmKTjCjOuoHdEveHOALTwTNJ5nAkzMJqXCl7o28JdVQQrkg7UW1AOFeM+FVi/jMGhOuISa7p+qckjgDPCiAf8fYmw1dqeBgH6W3okXCqDexHncgzUjdqza3K6eZaJqutFufp+YcvMnYv+hpnUrMCRpiskvEAs9WX7uLWf8vuq0nkyJ9oAGWUVGGHDCadXBNvMxRcI0nQbm+ngoBTQj5R9sNQmrpEzPMmjnTzopCtQSKezGBHmv18em5E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(396003)(366004)(136003)(186009)(451199024)(1800799009)(41300700001)(38100700002)(122000001)(71200400001)(86362001)(83380400001)(478600001)(38070700005)(966005)(2616005)(26005)(1076003)(6512007)(6506007)(6486002)(66946007)(76116006)(66476007)(6916009)(36756003)(64756008)(2906002)(316002)(66556008)(66446008)(54906003)(8936002)(5660300002)(8676002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?emlERVBBWkVkS0xXa08zYjY2TFEwcU45cU1MWWlVZTRTcFN4ckxGdUZqMEIr?=
 =?utf-8?B?cVd0bGVIcDhpb3FFSUFlWHpDSEdrdXYvR2ZEVkVNM1Y0R3p0eEtRelZTQXZ3?=
 =?utf-8?B?cWtvNzVXL2FSbndwVFE1N1BQc2R1eGR6ZU1mYnZCUENmdzNUd3N4NkhFNnN5?=
 =?utf-8?B?dVpBSE4rbG50WGZLLzhzOFdHNFpWQ0hiRzlwVC9RU04wZGlLY0I4dC9iTXp2?=
 =?utf-8?B?NGRETzZKNnVnVkJpSlM1OUxXVjlVcTRSSEQ5TTN5SlhDVy95LytpNFhNdUNN?=
 =?utf-8?B?UzM5azZPUmk0UFlNTnRWejByRytYSXowcmgwM1pZWFpQK050YmlweU9mVVJy?=
 =?utf-8?B?bDhjc3Y1c21LMEJKYnlUMVBZTzY5QXhlQXZ1NDYyUkRUTStsOEZxRER3ZUxu?=
 =?utf-8?B?SFVHRVV3dHR3a3RXNWFRaFQ1NnpoTThPWms2T1ovTEFYdk1IRkdZSjk3K2xT?=
 =?utf-8?B?cmk5aVZkZ3FhYmEwSjhlYmsxM3BQdWthaU56R3ZDV3VBbnV5ZForRklRcXhq?=
 =?utf-8?B?WWZwUExucWhsaTFCWEhpWVRiQzNKRURLTWEyWEFXWW1KYjhQQU94aEN0Y0M0?=
 =?utf-8?B?d3FMbDZjRkNRV2VzdmtIZ3g2SEUrVUN3dk90Z1hJRUYwNXlDNUw3QWFOeHA5?=
 =?utf-8?B?ZE1neTNBUzNrVmNGS3BYREZSVHBJUkpxLzJyZGlOL3l2cmdRbC9JOFpvamNY?=
 =?utf-8?B?QUl2Q00vWmM5YmltV09ZekUraHoybE9qS1NlcGRKaDBkcTZGNys5eDJlN2hX?=
 =?utf-8?B?M0p5RlcvbnY4bTI1cTJNNWVsNVpvZ05sb05ISUxMQVNxRnF3dEsrbmRxMWlU?=
 =?utf-8?B?Y0FoSVAvVzFPSFdRY1dNam9BM1lFeDBYeWJGMUUxTkJLMVV0VFJkelFCTy85?=
 =?utf-8?B?NkdYZy92Mjhoc0NCWVNMK2hVRzBoN3VFL0oxRFQycHFuTGNyNFo3aHN4OVFs?=
 =?utf-8?B?c0hnemRjSWgycUxMS1lKRlBwZUpLZ3lSalovY25CTDBpZU02WWU3ZlJta1Rr?=
 =?utf-8?B?OWgzRXRYcEpQVE1jcSt3SG12RGZMcE5SVG9FL3c2TG95YkUyQUVWOHJXLzhG?=
 =?utf-8?B?YmRrSkhtMzJ3L2hOKzlQZERnc3hOYjdoVjZ6eS9NVEo5WmQ5QWgwOGlaOGZi?=
 =?utf-8?B?aENNSEZXSDJpMUpGVjE0L05EVHcwTHZuYnV2M1J6REo0WG5MLzV0M21lbCta?=
 =?utf-8?B?WnQzOHl6NHArWE10bnRmcWNBRldWTjY2eWEzb0dTbEVESWNHWW0yMVNvZEZz?=
 =?utf-8?B?dTNsdFdzVDFSQTZGV2VwSzU3c2RQQ0JKRGhoenFTRFF3eExGY05PYXZ4TXBj?=
 =?utf-8?B?TDM2YVVkR05YYTdqRVpXU0ZTUEVBeUs0Vlo4OVZtQjZPQTEvM3hnV0hDRDdC?=
 =?utf-8?B?K2tyNExYWVlQWWtXQnlHS2RBS1pOZXY5VjV4cDFibmV4Z1YrKzN3MVQxMElj?=
 =?utf-8?B?aVFwenB4Yk15NUJWaXV1V3F5MGxKZjZ6d2QrY1lNMWRVeTZxNVJ2Q2lFNjVy?=
 =?utf-8?B?alh2ekVFS3FxelExeGFOTXd1TXBWQzZQZUxaNlppRWpiK1JmWWxTNGNROW92?=
 =?utf-8?B?NlJxWGg0Yld2TDhvMWlVR2ltdENEdjFGNDhabEUrMUNkRkRZY3FWMHU5RWtP?=
 =?utf-8?B?NlZSZ0F3Mm51SUtoOWRncjk0SCt6USsxM1dFbGk4SHZ2M0dqcTFPbk1SOEJr?=
 =?utf-8?B?WTUzektkN2tMUS9hMU1CakYrcVRSTTNKaVFFUSs5QXZHaytqZWtDd21IZUZG?=
 =?utf-8?B?aWxqeDVHVlpnTCtBQ2FQb2N3RWc5Z291bUxLdlhXQU03dytDL1JLTmh3Z01t?=
 =?utf-8?B?Q1ViS3NYOEdQcy8xTVFYMG10dThxL1hDUVYyc29GYVhKdEJKUHFrNnBJVUVY?=
 =?utf-8?B?YWpsTXFHSTJBT3BLSWpYMVF3MHhwU0FwVndPWnRuTTZPTWJZaWdPSGMxUDB1?=
 =?utf-8?B?MmpFTElSQjBuaUI0enNHbngvODU0akhNbkhvVzBDZ1VGVnVLOHlUQmo0UkFi?=
 =?utf-8?B?U2k3d1dzSzI2K1E4dWQrckVTd1lZVUJCWTd0S2dWWHNPZGtKNUIxWFZXd09t?=
 =?utf-8?B?S3ZKdDloNVpQanhkc1pHRTFSSi9hbnQ1aUR2ckNoR29JRUtpS1J0RXFieUJT?=
 =?utf-8?Q?WxnMoPK1hri7jo4dPJiNVzCfh?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A57B397885F17B41A596EE35CDC84473@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: +6hAVte9+y6s7/HMjiQ0KceKBmTt+OzNwtqYySvhPsTbHmuYWsLUb1C1J+qOIzauJ71SlW/3bP8sZ+9hYMphesCBF9902kKs6UywzcN5jCUHXnGw4L2z3q7e/As+6KSADvZxY9+PoZ3QqtBkQyV0XaWmQcHaSP4lRsleFvAhB3N4qQBujJ5vrjQ4XPRVu1Apq98HSnBCK7PylAAvEKdw3iWOWXm8DM904+1tAXMtjTNMbzkDAHbvf+Kb+buwQ2b5awcKYfzsjGEuj45man32j9WVJgL4s8C3jQUC0LFWHbp1YuLE2/pcKPo4zOz5D1vk5f6LAlLdOEJFpRt6F3nMJ60XgYZFinceAmVtHjTXPPXHIx+2vGVYKKBRbu9c0ICKCQ5/dkeUbocyvHZseyvX3AW/7heuib3g2FQcVqjWPzb0X3YA9UYxC6gGy1yOzTJwdXiwOikHfVlqA030+paZRdMMt2wRjv7N//0tZm6n37OPModhzfSp8yAuCYr7/89KdnAaMSISVq0Bcb4f6p3m39BkdzU8CH0jcCBzaA4j7b8LzYx78XiKdsReKg9lN8P4mwmdMf2KnATizsnADI9O2gwuIzEiTu/c74f184V4+PA15WfG3SWW+6pSs6eASvXq8bTgGxe5l2Pnfmob9ARdIyqspitmwmhFp3P3jN00iIPABpfTmF6u0YcTVjcFU2uzvWfj0YTsPwQhWVxxHQGMkOdqpZCU4Qf1eK8/qZBXWBtQhsTLOF5VyOa4n/U/q/iUHIq9KpUmhwXMCC8EOSH+mV6/Rsiy3paL9OUUQpGAsS1gNgGL4vRH/okeqx7HzzrWH6I7U+gwSOW/rkLmneO8JcByz1r0oOHKlqJ69ZOJ+vygvFmiujQ1jUsJsfxx2Nt7
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b610b996-a54b-4028-0fae-08dbae725dcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2023 00:44:02.6257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bmi3uBwl+izJXOgKXir0TNs+IqREvPeMbPcCKaD8MCf5/Ahh0nTNuMOXWtp0b5R48O6gz2YxhS5MJan946txsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8106
X-Proofpoint-GUID: lJFQRKZYAoMK6ZeYp22BTFLaT1lrBbXH
X-Proofpoint-ORIG-GUID: lJFQRKZYAoMK6ZeYp22BTFLaT1lrBbXH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_13,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=822 clxscore=1015 impostorscore=0 adultscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309060005
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gTW9uLCBTZXAgMDQsIDIwMjMsIE1pY2hhZWwgR3J6ZXNjaGlrIHdyb3RlOg0KPiBDYydpbmc6
IFN0YW5sZXkgQ2hhbmcgPHN0YW5sZXlfY2hhbmdAcmVhbHRlay5jb20+DQo+IA0KPiBPbiBNb24s
IFNlcCAwNCwgMjAyMyBhdCAxMjo0MTozM0FNICswMjAwLCBNaWNoYWVsIEdyemVzY2hpayB3cm90
ZToNCj4gPiBIaSBUaGluaA0KPiA+IA0KPiA+IE9uIEZyaSwgU2VwIDAxLCAyMDIzIGF0IDAxOjM1
OjE2QU0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiA+IE9uIEZyaSwgU2VwIDAxLCAy
MDIzLCBNaWNoYWVsIEdyemVzY2hpayB3cm90ZToNCj4gPiA+ID4gSSBqdXN0IHN0dW1ibGVkIG92
ZXIgYSBzaW1pbGFyIGlzc3VlIHdlIGFscmVhZHkgc29sdmVkIGZvciB0aGUgSGlnaA0KPiA+ID4g
PiBTcGVlZCBDYXNlIHdoZW4gc3RyZWFtaW5nIElTT0MgcGFja2FnZXMgYW5kIHVzaW5nIGEgbXVs
dGlwbGllciBoaWdoZXINCj4gPiA+ID4gdGhlbiBvbmUuIExhc3QgdGltZSB3ZSBzYXcgc29tZSBi
YWQgZnJhbWUgYXJ0ZWZhY3RzIHdoZW4gdXNpbmcgdGhlDQo+ID4gPiA+IGhpZ2hlciBtdWx0aXBs
aWVyIHZhbHVlLiBUaGUgRnJhbWVzIHdlcmUgZGlzdG9ydGVkIGR1ZSB0byB0cnVuY2F0ZWQNCj4g
PiA+ID4gdHJhbnNmZXJzLg0KPiA+ID4gPiANCj4gPiA+ID4gU2luY2UgdGhlIGxhc3QgY2FzZSB3
ZSBoYXZlIHBhdGNoDQo+ID4gPiA+IA0KPiA+ID4gPiA4YWZmZTM3YzUyNWQgKCJ1c2I6IGR3YzM6
IGdhZGdldDogZml4IGhpZ2ggc3BlZWQgbXVsdGlwbGllciBzZXR0aW5nIikNCj4gPiA+ID4gDQo+
ID4gPiA+IHRoYXQgZml4ZXMgdGhlIGNhbGN1bGF0aW9uIG9mIHRoZSBtdWx0IFBDTTEgcGFyYW1l
dGVyIHdoZW4gdXNpbmcgaGlnaA0KPiA+ID4gPiBzcGVlZCB0cmFuc2ZlcnMuIEFmdGVyIHRoYXQg
bm8gdHJ1bmNhdGlvbnMgd2VyZSByZXBvcnRlZCBhZ2Fpbi4NCj4gPiA+ID4gDQo+ID4gPiA+IEhv
d2V2ZXIgSSBjYW1lIGFjcm9zcyBhIHNpbWlsYXIgaXNzdWUgd2hpY2ggaXMganVzdCBhIGxpdHRs
ZSBsZXNzIGVhc3kNCj4gPiA+ID4gdG8gdHJpZ2dlciBhbmQgb25seSBvY2N1cnMgd2l0aCBTdXBl
cnNwZWVkLiBOb3csIHdoaWxlIHRoZSBtZW1vcnkNCj4gPiA+ID4gYmFuZHdpZHRoIG9mIHRoZSBt
YWNoaW5lIHJ1bnMgb24gaGlnaGVyIGxvYWQsIHRoZSBVVkMgZnJhbWVzIGFyZQ0KPiA+ID4gPiBz
aW1pbGFybHkgZGlzdG9ydGVkIHdoZW4gd2UgdXNlIGEgbXVsdGlwbGllciBoaWdoZXIgdGhlbiBv
bmUuDQo+ID4gPiA+IA0KPiA+ID4gPiBJIGxvb2tlZCBvdmVyIHRoZSBpbXBsaWNhdGlvbnMgdGhl
IG11bHRpcGxpZXIgaGFzIG9uIHRoZSBTdXBlcnNwZWVkIGNhc2UNCj4gPiA+ID4gaW4gdGhlIGR3
YzMgZ2FkZ2V0IGRyaXZlciwgYnV0IGNvdWxkIG9ubHkgZmluZCBzb21lIFRYRklGTyBhZGp1c3Rt
ZW50cw0KPiA+ID4gPiBhbmQgbm8gb3RoZXIgZXh0cmEgYml0cyBlLmcuIGluIHRoZSB0cmFuc2Zl
ciBkZXNjcmlwdG9ycy4gRG8geW91IGhhdmUNCj4gPiA+ID4gc29tZSBwb2ludGVycyBob3cgdGhl
IG11bHRpcGxpZXIgcGFyYW1ldGVyIG9mIHRoZSBlbmRwb2ludCBpcyB1c2VkIGluDQo+ID4gPiA+
IGhhcmR3YXJlPw0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4gQXMgeW91IGFscmVhZHkga25vdywg
UENNMSBpcyBvbmx5IGZvciBoaWdoc3BlZWQgbm90IFN1cGVyc3BlZWQuIFdoYXQNCj4gPiA+IGZh
aWx1cmUgZGlkIHRoZSBkd2MzIGRyaXZlciByZXBvcnRlZD8gTWlzc2VkIGlzb2M/IFdoYXQncyB0
aGUgcmVxdWVzdA0KPiA+ID4gdHJhbnNmZXIgc2l6ZT8NCj4gPiANCj4gPiBZZXMsIEkgc2VlIG1p
c3NlZCBpc29jIGVycm9ycy4gQnV0IHRoaXMgaXMganVzdCBhIHN5bXB0b20gaW4gdGhpcyBjYXNl
Lg0KPiA+IA0KPiA+IEkgY2FuIGluY3JlYXNlIHRoZSBtYXhidXJzdCBvciBtYXhwYWNrZXQgcGFy
YW1ldGVycyBzdGVwd2lzZSBhbmQgb24NCj4gPiBvbmUgcG9pbnQgc2VlIHRoZSBmbGlja2VyaW5n
IGFwcGVhci4gQnV0IHdoZW4gSSBpbmNyZWFzZSB0aGUgVFhGSUZPU0laRQ0KPiA+IGZvciB0aGUg
ZW5kcG9pbnQgdGhlIGZsaWNrZXJpbmcgaXMgZ29uZSBhZ2Fpbi4gVW50aWwgSSBpbmNyZWFzZSBv
bmUgb2YNCj4gPiB0aGUgcGFyYW1ldGVycyBtYXhwYWNrZXQgb3IgbWF4YnVyc3QgdG8gbXVjaCBh
Z2Fpbi4NCj4gPiANCj4gPiBTbyBkdWUgdG8gdGhlIG1lbW9yeSBiYW5kd2lkdGggaXMgdW5kZXIg
cHJlc3N1cmUsIGl0IHNlZW1zIGxpa2UgdGhlDQo+ID4gaGFyZHdhcmUgaXMgbm90IGZhc3QgZW5v
dWdoIHdpdGggc2VuZGluZyB0aGUgZXhwZWN0ZWQgZGF0YSBwZXIgdHJhbnNmZXIsDQo+ID4gZHVl
IHRvIHRoZSB0eGZpZm8gaXMgbm90IGxvbmcgZW5vdWdoIGFuZCBuZWVkcyB0byBiZSByZWZpbGxl
ZCBtb3JlDQo+ID4gb2Z0ZW4uDQo+ID4gDQo+ID4gVGhpcyBzb3VuZHMgbGlrZSBhIGZpZm8gdW5k
ZXJydW4gaXNzdWUgaW4gdGhlIGhhcmR3YXJlLg0KPiANCj4gVGhpcyB3aG9sZSBpc3N1ZSBzb3Vu
ZCBsaWtlIGEgY2FzZSBvZiBzdGFubGV5cyBwYXRjaGVzOg0KPiANCj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjMwODI4MDU1MjEyLjU2MDAtMS1zdGFubGV5X2NoYW5nQHJlYWx0ZWsu
Y29tLw0KPiANCj4gRm9yIG5vdyBJIHdhcyB1bmx1a3kgd2hpbGUgYWRqdXN0aW5nIHRoZSBwYXJh
bWF0ZXJzLiBBcmUgdGhvc2UgcmVnaXN0ZXJzDQo+IGFueXdoZXJlIGRvY3VtZW50ZWQ/DQo+IA0K
DQpIb3cgZG9lcyBoaXMgY2hhbmdlIGltcGFjdCBpc29jIGVuZHBvaW50PyBIaXMgY2hhbmdlIHNo
b3VsZCBvbmx5IGFmZmVjdA0Kbm9uLXBlcmlvZGljIGVuZHBvaW50LiBBbHNvIHBlcmlvZGljIHNl
dHRpbmdzIGlzIG9ubHkgZm9yIGhvc3QuDQoNClRoYW5rcywNClRoaW5o
