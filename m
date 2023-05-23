Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6660570CF80
	for <lists+linux-usb@lfdr.de>; Tue, 23 May 2023 02:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235427AbjEWAjU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 May 2023 20:39:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235465AbjEWAa6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 May 2023 20:30:58 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0623E41
        for <linux-usb@vger.kernel.org>; Mon, 22 May 2023 17:21:18 -0700 (PDT)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34MKo7f3025612;
        Mon, 22 May 2023 17:21:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=q2Ya7Z12h7GXYR5uR+wGyWbU2pvzF42xWs2apchxzTc=;
 b=YmKwJBrRDv42QPv/MIcRonhR0MxHQe/dYSSO4nzIPbnSjm+V7mqt4ouue/jpC4kt58Rk
 3m6brt6CNgxL4bXcAQPKDD6fy1XhGWT+wtCo/K21k7d6LCAmz+mgXuYnpltMbK+10CsK
 an6g4PG+gmK74WNThZDedmaXKeuZ6m9xd6XvhnhK2ieRqEidSOTqC6nMEy9W2YYRY0ND
 MV0D2iyVfYJAGD6HWHEX1txr2fcZr5r89fx3c2cDzXC1qiG7V3yOwMOlbCgOJJjQIA0A
 QNBOTOnOgqAumJi9mhbtFpsxYDmBIRBUFLzwLj6C+DgaxeduPSVJLAcdtCemge17HNYG WQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3qq11k94t4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 May 2023 17:21:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1684801259; bh=q2Ya7Z12h7GXYR5uR+wGyWbU2pvzF42xWs2apchxzTc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=l6sosKYK9KF2eoGfy4hFQDc01/nnXKQQx93ChDaaaXQyl5/+YYxXNQCOR8Siarmor
         +eUnwmCGUPiqKAF4I1jli/9KM8KeIqrw67G4aCuvFHuS96khbk3spbxnfJhEoguUhz
         8NtIFU04IqzlPZNVpmXN+ZQYItp/BkV1Nyin5QL8AN68YdcCa2ZPvoynuWaozD10k0
         AJMuGmrtxqD+JLYjiseBl2XGLIciQu/PDriHwKovo8+jn5m4piI0ENzLDa/95SMjS/
         KXdeFzpTyW3ZN0DbvbeBtVxXEkIY9i4O49YI0568EURwjQ/CT5Y9jgbPbNBKupI3tq
         77OxC3o426P3w==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A338E40523;
        Tue, 23 May 2023 00:20:58 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 3D76DA00AA;
        Tue, 23 May 2023 00:20:57 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=S3C5nGpk;
        dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2048.outbound.protection.outlook.com [104.47.57.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id B57B04048F;
        Tue, 23 May 2023 00:20:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZkhD8loUzkaOj6VMmhZ3/0gl8NQAbBOugGWA3LH8Zk2y/ZT5JJsAqO0VCrympEzH+2oAOyTxOBCuQ4QdiSS6KBPHpqyuxTbmg7GQxDbI5P9dA4Gw9WCt8aprttSH9gIOyebrczGORbAU+PSe0jWNQ3wvtmghmC2Y7IjNUTzdNVTm26cmxY9DR+3Y77J24+gYwaeynaZv4Nv2uN/oOxseYvTyHonqcTtMiK9rljGX0kcvI4W/edlkP7n1ARqagTfASBeAk1g70PWn+MNXhe6KC4o1KHIpWJTBgxUH8KAR5WU+X0qJvzmSFGYnRMlQ8jpOiLM/hWQidnKcGNQ6AMKlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2Ya7Z12h7GXYR5uR+wGyWbU2pvzF42xWs2apchxzTc=;
 b=KMHkprjDyRUfI9QeVHBarG5oMLzoku+KkA3UnfFGh/3Z/6iC58RaQD9pzdfig7gbCmU6di2eMMQ8RfhduPWO+lsY/X/xxJi34X12L1ZfgBkUbuR1XHLzx50/Ui1MLMIBFmTF4HLdPgAmDp3G3oIWJIBoLGKQDWGUWiFJRGUes9u5JipoC51AfFVTAnIBmv8wRden5cTvO+kHGH8V4Dj2uJafqRDVdVwD+iwZffuzJxYiH9oX/25q9XEponJ4yPbKkSAkONDb4B580/7aJskLsd96NJVKq0+QLq7IKb9i1fouS69e1SoIF0mbeS+ccaFkTrHdq+KuO9IuDjd8J/yAYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2Ya7Z12h7GXYR5uR+wGyWbU2pvzF42xWs2apchxzTc=;
 b=S3C5nGpk+MrbPJUQ/ya9CcMnoxFUsV3SUZdXC34tp0e6BMMeOd7GGQLMRsbqqh/ljwD12c5uofXoMiJv8OFPcrw4MCG3AH99DmB/qMstG+PV3K71peKC5YFrqVsADR7fmK8RuK0XXKxAT1cdO54P1LQsy57Ywp347m5ogVd/2r8=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SJ0PR12MB6808.namprd12.prod.outlook.com (2603:10b6:a03:47a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 00:20:53 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3400:81ff:f191:b312]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3400:81ff:f191:b312%6]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 00:20:53 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 15/97] usb: dwc3-imx8mp: Convert to platform remove
 callback returning void
Thread-Topic: [PATCH 15/97] usb: dwc3-imx8mp: Convert to platform remove
 callback returning void
Thread-Index: AQHZiRO5c61fU03fBUSo0iaQ7IT7iK9nBq4A
Date:   Tue, 23 May 2023 00:20:52 +0000
Message-ID: <20230523002046.csr67pbawhjev2td@synopsys.com>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-16-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230517230239.187727-16-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SJ0PR12MB6808:EE_
x-ms-office365-filtering-correlation-id: d0c26c59-786a-4b93-4fdd-08db5b2391c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m6k9qn4U87k/gatkrAn+MQBJ8aLXWZ3NJGvSGW3Iyebuf6jsOCe5CoCJNsunEiOuzEKxil3GPDGA9MCWkB3kHhhCuuJIt+Xw239awVaOsjajZjy26FFQaGk6nQtqtDIU96V4vWyuIH+qetP6p//G08+sEQBqRZDoiMPMtBeNx4Hgiz5wvAHcGv/+t1GIS4RzadAieGCdskEaetr/Xuvo237ekkrXcNJTaRbDwsJfaYo8amDuYE1incjLdwHx7vHV3zG49suupJe+72xshxPsdOvkzYKBGnNmXxVB07Zys17gAusDtbXOsV+v1FEgkf9oVGEC/Ltl0eAtpJz+fYaVyeF5quf9cpOLwuhPyFPyKMb0z6qctQxh04W7GwM7MNb0Z0oJINKipTgH72IYyLcqEQKH+LIwwBdtYGaL42GPpQjf2naxgtc6TdcdvPtFJIWK/UaKi5NO9rRaqr+B0+TjsZbKPkZ6rbvhqAfOkhGLJnG8OwXNFDxvTNrc8983cOt5DvzIFZerEkSiV99wthjfoPZ+QdmlLNC5nJan5eAzND6qDn7TlRGRDWz6berUoWXOLXw7VFfVtAjzmFiNJdaV2Hq+lOaV+tSzl7zjXBFw8XYBzIiBp0e/S7RQJz22kY5k
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199021)(5660300002)(8936002)(8676002)(66574015)(83380400001)(2906002)(36756003)(186003)(2616005)(122000001)(38100700002)(38070700005)(86362001)(6512007)(6506007)(1076003)(26005)(54906003)(71200400001)(316002)(478600001)(66446008)(64756008)(66476007)(6916009)(4326008)(66556008)(76116006)(66946007)(6486002)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TE92UjZNMmVGbUxRT1FhYWZyUVVqcnQ1TjJvWTlXNnhyWWVrNUdqc0xLNkx6?=
 =?utf-8?B?SE5lclhoZUNzSDMzdlJ6SG43UTJ2VjBiTklCRUQxRkxpOE5GUFhrVTRuRG5K?=
 =?utf-8?B?Yzc3NUhnblVGWm5XZGJMc1lCV1BWRVJrdjZLT0FNUzRNa3NqYkMxZzFHaW0x?=
 =?utf-8?B?MXBhK0VUQ3Z0S211ZnNXeC9aVGZDT3pSVllaZWZaSXZ1Zy9GRUxIdC8rVjFw?=
 =?utf-8?B?UGQwODEwZnVualJnc0NwdmJxcmpKWStrYTNmcGg3ZlVvQkVYMWRBZ1Nrd0ky?=
 =?utf-8?B?RTgyR1lKVVFrYlU2MWMwMTk5dkpVYUZzeXVwVkZaZG9aSGNoK0c4UWtTTHEv?=
 =?utf-8?B?MjdNNTA3MHJoaEgvT1dKdVpVMk11TjFieXZ0VWdDamNYVDZQS2hXOEtWbW85?=
 =?utf-8?B?ajVhcFlrMG8xcFA0a0NLSDdJVERHSjFIVVdDcU1ZdnlmbENQS0J6T0NDcjJI?=
 =?utf-8?B?M3pVTTZmdUxQSmRabDVTQXR1aEtqMEtEa3k3d3RETGxEZG5mRzZFSFZXdkdu?=
 =?utf-8?B?d0hYQXlDVWhMU0JIazM0SDZQblpWRmdBblF3MmhDZ0lDSVVNV0UxSURsNDJz?=
 =?utf-8?B?Q2phZzJidjlLUkZVTis2bGZCeXVmc0k2UG5meHlFdUlrckFjeGVta2xKeWo4?=
 =?utf-8?B?ZnpKT3ZyQjdLK3B3bDNhWnh6VEJ2cVN3SXNXemZpNjJSNzlCYzhpUzBib0Rq?=
 =?utf-8?B?Wmt6MmE5MkRsU0I2cS9USXhJOWs4TGNwOC8yMVh2d01SVzBCazVMdWpWWThn?=
 =?utf-8?B?UHNwMlVqMVM2RG9SY1k4ejAzMU1vQjkrdmpNZ1dvbElQdTlVRkEzZ3NsVjlx?=
 =?utf-8?B?aGtXd0dWOHd6K3FURitaMHlkNjg3WDlPbDlBcE5yTVlTVG9iT3JrUE9JSkNY?=
 =?utf-8?B?Sjc5T0F3WkQwTDh2ZzFoVTZPR2ZoT3MvVGpYYUhic05LbU1MUTlyR1RaVEJO?=
 =?utf-8?B?QkdXUWlhVWxIV09OSmJvejJDQXNhQ05vZFhMZzdEdDQ4a1QvNE9JQ2tqemNt?=
 =?utf-8?B?eGxUMEtqTnNXRlJPd2t5ek5ZeDYxRzRBODZZU3g4RWd1MlJUeXdBMGVuZ1lT?=
 =?utf-8?B?U3hYeEhabTM2dnZiL2xUV2dyWlQ4bllkUWVTcW40SWU5LzFDOTlEakFXK3dD?=
 =?utf-8?B?UmdEMFVNNm1aM2R3L0VQQldsL0daQTFpMnpIRm1TNytyOTZRSDJvUHVYcVZh?=
 =?utf-8?B?SnYyTFh3SFE1Y3EwRy9wSjJXM1Rtd1BXQ1FVZ2RYQyttZkdVRSs1blNpOVVD?=
 =?utf-8?B?ZmRoNFI2dXF2aDgySkZZbGY0cUUrL0lER1djZXJJYjFOY0V0SXNybG54LzNh?=
 =?utf-8?B?YzdqYWk3YTdVbWRrUHl5RXU5Tnp3Q2NiMWI4ZzVSVGRNaGFZRFo5Ukc2MDBo?=
 =?utf-8?B?ckwxalBxUHBRRDJRajM1SjRtdHF6Q1Z3S3BuY0t1YlhyUUgvNXlsQjQ0TWd0?=
 =?utf-8?B?UHEya1UzV2FnVnJHcGtma3F6bnc0S1pBNkx5eURRZ3R2MjFsOE1PaXBYSjZO?=
 =?utf-8?B?ck1DbU9YRWtDb2I4em9Hc2NQM2lTRStOalhOREs2QjdCSk1uT0lYTDlVOUJ5?=
 =?utf-8?B?UHFwZ05WSEZSZUdvalRVMGd0alg1UkxZZVEyNGxnWjNMK29tZ01qaDNGdk9D?=
 =?utf-8?B?RTFVWVJQNjNxdnVQV3hud243V241cnNERzQyanNNZDBiZDdKYzRnOXMvd3FJ?=
 =?utf-8?B?Z0I0R092MDVlUE84czVYazVneHYzMU5YQTlLSnZSSmRRakFzeGpMcldtMWh4?=
 =?utf-8?B?cE9yTEdlSXBGMnBoTW9lTWJxRFk2bnhJYjRQYVNkMUlFVE9mTFplY0ZsU0JP?=
 =?utf-8?B?ODlLdDZjcHFsSDE0Z2c2cEptU0hrcWNya1krR0EzR0g1S2ZjaWpkaFF2WS9y?=
 =?utf-8?B?K3B6blNwTWFjVGJKSjVidmJYQlZGWU1pbnVTcWFrSEwyZDZUSDJwaGd5TWl4?=
 =?utf-8?B?STFUdEJWZFFGd2k0cmFwcG5NVHo1OXBLZjdwWjFXZHFudkg4NGRQWkZxQnZ6?=
 =?utf-8?B?dWtLc2t5bG1iZ1NYVU43UmpMSEdBR3lCbzRrSmQ4aTBramRBc25BZlY3Y2t1?=
 =?utf-8?B?RExvaW9aakUzVFVuRjV1R3Y4dit0alRTdWcvOWhyOTN4UkczNEJiMUZZWUZ0?=
 =?utf-8?Q?KRuOcjw+L9YfHlsSvOnvglevx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <093BC6698B942044824AF842E069C55D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?SDNzSXJ0Q3BWcE9rSTVmOWVOTkRMZDBPUjlpdG5ZVzZ6a0llUFo5cGdJSUl6?=
 =?utf-8?B?NUxnMVJEOWl6TlBJZ2R3dnc3RkM4bEQrTGRCWXh2R3V2dkN2emtaTDEyMXhC?=
 =?utf-8?B?dTJqdXVkU2UrNkkycmsrTVo0aFlXSm5PS3lnc2VkYjR0eWxNUEp2NVhTRjFo?=
 =?utf-8?B?Qkc1enJMMG52dGdxN1g4aVR1c24wMmd6M3V5TTFVL2hDQ2tXdUtvdXBjQURs?=
 =?utf-8?B?TWIvME1IREV3bHZIeVBwcTV4cTFhQzZzblNzN1NDQXN0M3JhS0FRTSthUnNz?=
 =?utf-8?B?TndKN1R6UTVyenk2bWpEWnFsOUp5NitMMHZpS0h5dDVoVlRVTEFGZmJFaUM2?=
 =?utf-8?B?emtmMmVRSjNJSlBETVA2TkRZMXI4ZTV1Rjl1NFlId3VjUUp6MTlyMGFuMG83?=
 =?utf-8?B?YTM5bjM5ZWhjS3RTY0xYOWlDMm5vZ21Vb2lMeDdLNW44c05SS1JVVTBaUU54?=
 =?utf-8?B?YmpVQWFNMnlPcG1oTjcrdVU4cmE0MTl2NWU5bGhMMFNqL3ZvSHRJRWpjVmxV?=
 =?utf-8?B?MG1zNndGUm9DVm43Y3pxb3hVR3JaQnZpdzJzbms2KzZpMXRPMUFVUXFKYzg1?=
 =?utf-8?B?NzRhV3EzUkYzdzFDenA5YWxmZ0IrbVVFTUMwVzJjazVGVTRtaEZWRXNuYmlY?=
 =?utf-8?B?SHh6alhpeWFUQ3E5NDBpaldaNlF1SDBuYU0wZG9zZlVqYXB5cGpmbkhLYXdC?=
 =?utf-8?B?OW0rYXRzZ3N0VmVmWFViT21VZEd3T0dLOWI2VHdNK0ZmVXRVWlUraGhWWjZ3?=
 =?utf-8?B?S1RhYnJmakxZY3FGNitNSnNSU2FBTkVLQXRLVFcxUDZkQkFVcmV5SmxaNk5F?=
 =?utf-8?B?dXl4SkM5R1lKdWNoZEpKK2w5RjBGSHAvUFYrbHBrVE5keVlOWUkvNDZIK2JO?=
 =?utf-8?B?ZTJaekprSzBnOVI5VklCUFM5NDF2b3gvOGF2WjdaTHk1a0g1ZmQ5SnlNSGl2?=
 =?utf-8?B?eTFlb1ZZVWJSQnN5S2lKd3V5M1VEWVJwdW5YeG1xS0kvbVowT0QvK213bzE1?=
 =?utf-8?B?TmxVb1hjYWtqZmo4bnBDNzZCWi84M1ljWVJVbjBxcVpnOVArWFFZNTJ3citV?=
 =?utf-8?B?cTllOUNqdmxrcGZhU01ncVc2NHVlMTNaYmR5dlRraHZPZ2hNR2tCRFFwTllV?=
 =?utf-8?B?RFFVVFNKRDN4K1ZMVFVOSHVVNnVod3hKUUtVTTNOVlJwa1Q5N0tvM0VGL1dn?=
 =?utf-8?B?ZlNDMXhhTDFRQ0ErM2lETHlqdkRMNzEyVlRVbkFESVFURE5ZOTRzUXQ0WDFF?=
 =?utf-8?B?Y2VTdDMzVlg2Y0E0VXM3TzBwamZUSzh5VUlGL3ZSY0kzRHhqS0I0Uk96dWFE?=
 =?utf-8?B?cnplUExHUXhlNzdCRzFrL2J6d2hMSjhEUjBSUFlGUkVZbmdqSzcrSVhuVis1?=
 =?utf-8?B?QnN3cVRnVFhDY2c9PQ==?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c26c59-786a-4b93-4fdd-08db5b2391c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2023 00:20:52.9977
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fg4sdXMMm3G7BOS3dQgjdf2VL7fdmDHvVqqhzP2OZpzvgDQ6RTDkyLonpxEOHc4gJ2Z7lMjJ3ax1bxXRhnTimg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6808
X-Proofpoint-GUID: 04yarVMCN0mS_v48z1Vn_r5NSYR31z3p
X-Proofpoint-ORIG-GUID: 04yarVMCN0mS_v48z1Vn_r5NSYR31z3p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_18,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 adultscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 impostorscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305230000
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCBNYXkgMTgsIDIwMjMsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOg0KPiBUaGUgLnJl
bW92ZSgpIGNhbGxiYWNrIGZvciBhIHBsYXRmb3JtIGRyaXZlciByZXR1cm5zIGFuIGludCB3aGlj
aCBtYWtlcw0KPiBtYW55IGRyaXZlciBhdXRob3JzIHdyb25nbHkgYXNzdW1lIGl0J3MgcG9zc2li
bGUgdG8gZG8gZXJyb3IgaGFuZGxpbmcgYnkNCj4gcmV0dXJuaW5nIGFuIGVycm9yIGNvZGUuIEhv
d2V2ZXIgdGhlIHZhbHVlIHJldHVybmVkIGlzIGlnbm9yZWQgKGFwYXJ0IGZyb20NCj4gZW1pdHRp
bmcgYSB3YXJuaW5nKSBhbmQgdGhpcyB0eXBpY2FsbHkgcmVzdWx0cyBpbiByZXNvdXJjZSBsZWFr
cy4gVG8gaW1wcm92ZQ0KPiBoZXJlIHRoZXJlIGlzIGEgcXVlc3QgdG8gbWFrZSB0aGUgcmVtb3Zl
IGNhbGxiYWNrIHJldHVybiB2b2lkLiBJbiB0aGUgZmlyc3QNCj4gc3RlcCBvZiB0aGlzIHF1ZXN0
IGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQgdG8gLnJlbW92ZV9uZXcoKSB3aGljaCBhbHJlYWR5
DQo+IHJldHVybnMgdm9pZC4gRXZlbnR1YWxseSBhZnRlciBhbGwgZHJpdmVycyBhcmUgY29udmVy
dGVkLCAucmVtb3ZlX25ldygpIGlzDQo+IHJlbmFtZWQgdG8gLnJlbW92ZSgpLg0KPiANCj4gVHJp
dmlhbGx5IGNvbnZlcnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4g
dGhlIHJlbW92ZQ0KPiBjYWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVu
Z3V0cm9uaXguZGU+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLWlteDhtcC5jIHwg
NiArKy0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLWlteDhtcC5jIGIv
ZHJpdmVycy91c2IvZHdjMy9kd2MzLWlteDhtcC5jDQo+IGluZGV4IDE3NGYwNzYxNDMxOC4uOGI5
YTNiYjU4N2JmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtaW14OG1wLmMN
Cj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLWlteDhtcC5jDQo+IEBAIC0yNjYsNyArMjY2
LDcgQEAgc3RhdGljIGludCBkd2MzX2lteDhtcF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KPiAgCXJldHVybiBlcnI7DQo+ICB9DQo+ICANCj4gLXN0YXRpYyBpbnQgZHdjM19p
bXg4bXBfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICtzdGF0aWMgdm9p
ZCBkd2MzX2lteDhtcF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIHsN
Cj4gIAlzdHJ1Y3QgZHdjM19pbXg4bXAgKmR3YzNfaW14ID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEo
cGRldik7DQo+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsNCj4gQEAgLTI4MCw4
ICsyODAsNiBAQCBzdGF0aWMgaW50IGR3YzNfaW14OG1wX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQ0KPiAgCXBtX3J1bnRpbWVfZGlzYWJsZShkZXYpOw0KPiAgCXBtX3J1bnRp
bWVfcHV0X25vaWRsZShkZXYpOw0KPiAgCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIE5VTEwp
Ow0KPiAtDQo+IC0JcmV0dXJuIDA7DQo+ICB9DQo+ICANCj4gIHN0YXRpYyBpbnQgX19tYXliZV91
bnVzZWQgZHdjM19pbXg4bXBfc3VzcGVuZChzdHJ1Y3QgZHdjM19pbXg4bXAgKmR3YzNfaW14LA0K
PiBAQCAtNDExLDcgKzQwOSw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIGR3YzNfaW14OG1w
X29mX21hdGNoKTsNCj4gIA0KPiAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgZHdjM19p
bXg4bXBfZHJpdmVyID0gew0KPiAgCS5wcm9iZQkJPSBkd2MzX2lteDhtcF9wcm9iZSwNCj4gLQku
cmVtb3ZlCQk9IGR3YzNfaW14OG1wX3JlbW92ZSwNCj4gKwkucmVtb3ZlX25ldwk9IGR3YzNfaW14
OG1wX3JlbW92ZSwNCj4gIAkuZHJpdmVyCQk9IHsNCj4gIAkJLm5hbWUJPSAiaW14OG1wLWR3YzMi
LA0KPiAgCQkucG0JPSAmZHdjM19pbXg4bXBfZGV2X3BtX29wcywNCj4gLS0gDQo+IDIuMzkuMg0K
PiANCg0KQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4N
Cg0KVGhhbmtzLA0KVGhpbmg=
