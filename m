Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C14DA6E5797
	for <lists+linux-usb@lfdr.de>; Tue, 18 Apr 2023 04:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjDRCuH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Apr 2023 22:50:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjDRCuF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Apr 2023 22:50:05 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99B8B40D2
        for <linux-usb@vger.kernel.org>; Mon, 17 Apr 2023 19:50:03 -0700 (PDT)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33I16n4h000966;
        Mon, 17 Apr 2023 19:49:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=PMctyTQDedT5EMgBPotz5YSW2JE8MOMHxHNLWoTMLD4=;
 b=GHVz7GorYnfBTgcLtjVNvBckE4Pe1ffb9Cnzp21F9nao7sW1o4eUF08JK3WHrmTPQrXn
 2E0M1BulTmHeOpCwcCfjGH4xPTXlFe5rG/nolqMKiHUyWE2PPU+s6qyEfjOCHm8R+/LH
 jFDQ/5x/Pu0vUPueKZdg26QL+OFpvNfXQDW+DkmXEmupc5lL729aFI7O/WzEdEOyXZjz
 Hu1kXcPTRUudCAuUkN331vK6aC+zIW/MfqH1twax68z9JUuXBukUSHCvLq8vSKvfrGKh
 Oq1fXJUtaUqrL0UvLN7aZgHEVubu0rpjWtrE4Z2E/b0Gpkg1+pAC/NkHU8Szl4rvq/vN 4w== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3pytuvhxth-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Apr 2023 19:49:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1681786196; bh=PMctyTQDedT5EMgBPotz5YSW2JE8MOMHxHNLWoTMLD4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=hnXgNBcBvvlQUDAfmJpXEbb7gzdf7xWCF4IXxRWgmfzU05VopAh3Nv8YnMhBVzrp8
         GzXXFIm0D94GCo3CXsU+eXzKoMs8/IwFG+ywyD68UEyStg2jlfXIgTF2bWpadk+DBw
         g5jjeWPdRQf0ERVrChWLjxlsgG0DdAZ6rZRSalv/1s/sLreZVYFABaohK0F22tLip0
         tbMScjRKJJXP01fLWwd+pvItWpt+hIouquAY6qqtklhNBmdcJTFN5fmXEzrB35vF9x
         +1QU5qGxglt5uj4BHI2CAKvd/qb8utV7S+YJNAPy8DP0ramYfuahkjNLm/uK/j/S4+
         A+adcpyUjAf2A==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4773D40D97;
        Tue, 18 Apr 2023 02:49:55 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id ADBF7A007A;
        Tue, 18 Apr 2023 02:49:54 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=DXrsuOk0;
        dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2042.outbound.protection.outlook.com [104.47.73.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0967640DDB;
        Tue, 18 Apr 2023 02:49:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTX89g2hSq5XaWzMNDQp35jWRGwk+TpDy0bkwIYalRqdod+kOK0l/x+5WGJMRaUjTbw11rDr5Z6WYzGuYYo4i1fBaGTb8I+hVilSIbjbuMRKVUV4oekIDwTK5k0DLl1bFGb2Z8Gvrb5QxiK47jXikgMXdZa7ZkBckI7IN0aQJY9AXVq3Y4A1E4EfVO8FsFoRM18p2khrxtkR5oE5AFhQRnxsmnO5EG1mIEZbeeoIrZNQQsTeTjP17vNIWaaXBH8vVAgEka8F8Q1v8JC+Nw3UW8blznht6XW4MgHMub3KtFHArZEohNDl5QpGPV8HAvg2GeIBfqns39tTonp6a+YpKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMctyTQDedT5EMgBPotz5YSW2JE8MOMHxHNLWoTMLD4=;
 b=FkRiarGhOBgU8NQI+4SA1p8ICSNL4IiSy8dxzAoSzv0MLNLtJooh0kALD/Vw7zVBoeSFp4Rlr2R+PMFbFWjBVvCvH+SBhiz+9MB33JR0F/0W/K78kLFT0775Md725dyex+IYwq09jp+nspmKVKK4RcNKDNN7hT9SezswMk7Rj3yHdMk/aJr2MdqoOCj1px6lCeE5z6QvVQGnckaVhspmgb76anPl1wXOLJC1ikyMTiCR1Yx5KBD+ZXwLUjzMZiLsHudDR6L0i/5fJeXrSufU9IgZys/UGpdZ+AtZfS2oILWHFzcvjUsGuxVNgEBJlKT2oKoo7r4M7POfz+t6c9Pmuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMctyTQDedT5EMgBPotz5YSW2JE8MOMHxHNLWoTMLD4=;
 b=DXrsuOk08jMTak65Me/CSmC8SHxfJaUZ+kG0dKTk4RitwYLBGylZbnR3ECbUm0QY88pyKDAQtE5zK1legNPGq/dNduCxknYXScAVjJuLLtuwjPDXWEEWgv6WqXCwhpFAs9jsqSx1+ClTNAYdgjySr5zVS1A2vShbBlAC/cOb7Ho=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM4PR12MB6039.namprd12.prod.outlook.com (2603:10b6:8:aa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28; Tue, 18 Apr
 2023 02:49:50 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3103:ba85:b667:315d]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3103:ba85:b667:315d%6]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 02:49:50 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Avichal Rakesh <arakesh@google.com>
CC:     Greg KH <gregkh@linuxfoundation.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Topic: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Index: AQHZbxSLVlNfn9UhSEmoQu3rfa9UjK8viLiAgADE34CAABUTgA==
Date:   Tue, 18 Apr 2023 02:49:50 +0000
Message-ID: <20230418024937.h6mipfdvdqomtz36@synopsys.com>
References: <CAMHf4WKbi6KBPQztj9FA4kPvESc1fVKrC8G73-cs6tTeQby9=w@mail.gmail.com>
 <ZD1ObUuy8deAvupf@kroah.com>
 <3a9ee93a-b0ec-ac92-77ab-2956c1c4f434@google.com>
In-Reply-To: <3a9ee93a-b0ec-ac92-77ab-2956c1c4f434@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|DM4PR12MB6039:EE_
x-ms-office365-filtering-correlation-id: f4451a2d-4240-467e-8cde-08db3fb79459
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GSFYEA7JDPksxLTxw6TGqzJocHxqFzIJ1bRX1plt9H0ZETskmsU6pwLk1qrcmbGPKruhjkppQZyfqK3Hdc8nhX9Uv0JfB6EP2ULxsbh9NSnDBKAti6NcKGjDzxEpm4Zs5DkehRk292pYEQ0DzEi9CgqaHsy2s16i0Z+UYq/Ac3DgmCYQTYlz4i32w/C+Vu3Nvx58i2VSSr2wnuYICVjM1DWGxHY9XDorB78ssoInVXUIgAVVrhwtsosHxe/q+1uJ/gqrJ1j6kwj/i3tEG6ULvDalSStF7Sn/SIG2+Mv5XIZpvAVRF3fsQw2vJUfA28lV4s/CH9gM6bD6u65kDOvIr9ebMHyffbSolh1FYfN2Y8dPW/jl9eMHHLb2xmuoUqXR6OBdDfY9BzqOqPGTF2OtYkvid/RwopgMKCSsvt7h+ohpn8i/K+qGmdyIWfXOcscizDEhezNiENeYt0My/WMSmXkD0m/SBBXYkyKSz2lO0Ey658VJ1rOKYWpk0XvsDHcaAR3wazvZbQYqApdxunmLi3ioBj0DMqYQ88k6EZvSPlRPX8U3WGlp5c3qyYuX7xTdtRBmGjjbCFj8PW552M8ZbZyrNajeo1sM7ItKr/MvDapuNJYI/Zabc0Qlk28e+OMClU+7/j+UA4LiG16+XMq51g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199021)(6486002)(66556008)(83380400001)(966005)(54906003)(76116006)(71200400001)(6506007)(2616005)(53546011)(26005)(6512007)(1076003)(186003)(5660300002)(36756003)(38100700002)(316002)(2906002)(8676002)(66946007)(86362001)(64756008)(66446008)(122000001)(4326008)(66476007)(41300700001)(38070700005)(6916009)(8936002)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aENYMXhEa3oxK2hkWHBSV0ozTlV1TWt1Yzd0d0RZY1RBQ2JrL3dzV0V2QTYx?=
 =?utf-8?B?eXNMTmpvcTNjeVU0UkZNejVuU0U5d0RFbDFTS2R2YWczT2R2V25LLzBibnNX?=
 =?utf-8?B?U0pJMDAvcitNd2kvZkhGOXpCdE51VWlhdGFVR2xObTJXTVgyWmRONFord2Nq?=
 =?utf-8?B?NVVscG9ENTR5SGJjSlFpM0RobGlIYTJ6c214dFdpVnFtWDdDMnlldmhyeXQ3?=
 =?utf-8?B?QTE4aXIrNTRUM0JkN2RkQ3hiZW1Bd082VFp4ZUl1OXNkanpJV21ZOXpxbGR5?=
 =?utf-8?B?eEVjQ0VLR0t3dmw0Q3Rnb1E4MXBxTVRQeEdQRy9tNVhEVUV1VDNEamJQT2ty?=
 =?utf-8?B?QXJHa2tZU2x6a05KQTNHUVZxTG5IankrNUV4K0t5Y09sV0YrV1VsUElOWTJp?=
 =?utf-8?B?WVgwVWMrQXk3N2taSWs2YlloVzBsQU8zZGx1WnpnS0lqbFdIT0xGZG5DcjFZ?=
 =?utf-8?B?eUVIenhxK29YaVJZUzFaN2NhTmR6ZnpWR0h3M0dyVlczNFFLN0p0SFVpbGY1?=
 =?utf-8?B?QnlRVXdWZUFWSUNtRXRMdk9iOEdaTVdaTmRwdnNsRkVKbW5DelNKbXUrbGNI?=
 =?utf-8?B?Q3p4RklKc0cwbjZMWFpFVlhLV3crMFRaQ3ZKY0NoT2h3bzJwb3d1YXROVVhn?=
 =?utf-8?B?dWpPd2pXUTRwSjJXZy9yOFBVcE45bkNzOTA4R0RVMUhDeHBvTE9FNEIrRlJL?=
 =?utf-8?B?SnRiNFFXZnFTc2dMUm11VGpVZVVQM3ZXREw3QUVBd0hlNHFpOHRaenUySEhF?=
 =?utf-8?B?UnVDbENwV3pBTG9SVHpUVHRuand2ckMxM1RkbHpkNERYRFVieXl6SysySXV4?=
 =?utf-8?B?WVI1Rjd6UTZRNGlQa05qSU8vT2pXYng0Zkt2YmVhblJyU080cE9yVTNIZElx?=
 =?utf-8?B?VXQxd1VRQzdpc1NPSDVJM3pDc2U1M2V2d1BjdHdVN2loL1BZZlQ3VVRGZEdH?=
 =?utf-8?B?REhTZzVaZG5ITlpyamVuWGtPbml5Vy9PNzJSLy8xdHowcXZ5RzdNSEViQlVo?=
 =?utf-8?B?VnNOQmZBQ2VBWFFKWVdzTVVNWm1XVzBvdHoweVVlWjFSSWZnV2RSdmYzVTdp?=
 =?utf-8?B?R0o1ZnBIbTRFMnNqQ0JlTmtrcSt2YzB3bHFyVmhqYWxFMkhaQVBFOVlMbzV3?=
 =?utf-8?B?NXdFZzF1MjAwZG9RbWRkeElOYkhaY0lZdC9aVTZoV21UYjFkMVR4UkhNakg0?=
 =?utf-8?B?RHZKbGRvbXpCTHBGNjZOZzZ0NUVnSVFaQndlWnFMbWN6UWhYWG9IMGphZWZn?=
 =?utf-8?B?dWNFcXBVWjFIQ0Vra2o0Q3gwMlc3Z1BOS2VpSXpuMkFQaEI0a2M4NUhXaVo4?=
 =?utf-8?B?cS84VnR2Ym1sM0VIZTNObU5BWUxYKzRJY0Q3bUZnYmE0SmtXaFROQnd6RnNi?=
 =?utf-8?B?cmdiMXhvZEdNQkxLMlVMOHh1UmtpYStobGpia3FiYVlTcDNmYUtsZ1JpTmxO?=
 =?utf-8?B?N01Xb0wyeWlMM21tZk5EdFdDaTkxcUJGbG83dU1HRU5ZNmUzMFh5OWFvZ3hO?=
 =?utf-8?B?SkZ0THhkblNydWRqNnUxTWI2Zy8rK3pPK1lEc2NWWU5yTENWM2JkaEFXWUxi?=
 =?utf-8?B?Wk54NE93emNoMHZsWXZYc004bDFjRk95bE9CeU1FUnpxeVlNRHFRYVlSWk5k?=
 =?utf-8?B?d0xiRXlkSEZMeVp1Q0lNZ0EzZ3FZR0kwaTFPZHc5K1hHayt4UUVMNTVZbjIr?=
 =?utf-8?B?d2kwa0svZFBHYWh0Ti9aM3BKQWd0UjlXNVFia1RzNzFiQXd3L3VxUWZxNlVU?=
 =?utf-8?B?b0ZFYW9pSm05bVJDVEtsMURxNmRQaDJGSFpWdWhWNThDZCtXNm8rTzI4bHI3?=
 =?utf-8?B?U2IxdFZXc3I5Nnh3TWF6K3Y4MzArSmZheGsrWklINWlLNEF1RnFONjVweDNU?=
 =?utf-8?B?WnVuREdLRS84VEtlTEZvVnYrd1I4bHh1TTdFTUI4bXcrR05IL2k0Qk1oUXQ4?=
 =?utf-8?B?UlQxS05JYTB2VUZTMDNzTy94Z3cweUptekhoWE4xQmdtc2lSL1dkdHBTV1BE?=
 =?utf-8?B?aWRGTGpMVWF3OG1va0tYMFZTeCtaaVFLQTdCUkgwWVRzdHB4enM5QjJ5NHEz?=
 =?utf-8?B?cWNPY1NuSEtCTWVvckJ5Nm04VHNBS29rY1lZSGp5U1ZJdXZIdytkT3ArSzNT?=
 =?utf-8?Q?YXf/aPuSqm4F1PccFlt/v8wE3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E3A3914DE89884FBF0DD4C10AD3CF0E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?UG5MQjNPMjFUV09tdmJvTCtaY3ArU1JiWktPVkxQOEdpVm96c0M5ZmxkV0lV?=
 =?utf-8?B?L3hmRFUwdk5KZThteEVTOVVKVjFjQlJZYzRORFd4b2pUVGdqSUYvdDBYeERw?=
 =?utf-8?B?MFBuTFdSVmRZUjgwQ2p4MDN2S1BkTW1Cd2lXOUF0a3I5YXRCdTVDYm9yeStN?=
 =?utf-8?B?dUd0MWVONDdSWjFpK0tzcjRKQWErSU85RFlhYkNIRGVHZTNydkVRSlpabVRV?=
 =?utf-8?B?ZFN6Q3FzdHFQcm9LenY2Q2wyRVFrRDBZcTVDOE5sWGhzWFRxeSsyMWRURWhr?=
 =?utf-8?B?N0hFL1AzU1NPRm0xWG1BSEsxam5DQTFjanB4V0hvWmNTd3JwVUJDNnVaQjJN?=
 =?utf-8?B?SzY4bEdtZ0ZzTEx3VUxlSnpyNG9pRDFKalpsdTZrbVQ2UjA1SnR0dzhGWmEz?=
 =?utf-8?B?NEFZYlZ2OE11ZzhVRmFkQkcxblc2KzdTU2xiSE4wbjZiNC9talZRY2hKY0JD?=
 =?utf-8?B?b0drUWI5ak5Zd2RBeGJuSWxZZGVHQmZqQUdXODkyOFVEU3NLcW5sak1BeHU2?=
 =?utf-8?B?aWlOa2dZeHhxejh5MDIvbzBlcG43N1pKV3ZiU0pSUnpTSXNVcGhzaUdDbEZ2?=
 =?utf-8?B?SEdLSmkreTBtWUhXeGJCMjd6QnNSMEJ6Y3hTUEplTi9sMUoxemFuR2dqS2FY?=
 =?utf-8?B?dnh6akdDNHd3UUtEVU1MYWZXZGMrS3pFWDB1VlNTc3JEMnV3RnpLTDNqRndy?=
 =?utf-8?B?R1JIbzRYbUtwMDlubS92bEZvMDRHdmNhTTRUOGJVK0grL3lwQVMvSHk4WDFk?=
 =?utf-8?B?WXU2bng1elhPY0VmRkd6RzkvRmxWQVNqMWlmbUhBSkNRUUg4b0xhcEFNclVs?=
 =?utf-8?B?d0VsNW53eEZKeGhlR1BkL1pGaXdjcUo0akZGQ2FydnlZcktCYzA3di8yNVFU?=
 =?utf-8?B?elNscmVhN1VNSTYrenU5bVFWdmFUc1A2L1d3c01TMkhMVEFPU0hNWFZ4SHhu?=
 =?utf-8?B?YnNIODBtTXhtR05udGw2UE9EcW50Y1BqSTZjWFpkRGgxZXJ2VDE0YXAxMUho?=
 =?utf-8?B?dUlDNEEvMXo5d1lDSWRKTnNOa1diVnBEM0lvU25UZURoN1liSjdDaWl1bis4?=
 =?utf-8?B?Kzg3N1JEKzRxYUh1QXJuMU9uT0RwSGxEeEVOdU9PRDlqSU52VnRzUWRkTWpx?=
 =?utf-8?B?S21FZTFibVlUanVHbmsvYVRqRXR2eENlRU9QVm1CaUxQS3RQMC9rYitkNVJ3?=
 =?utf-8?B?c3owM2dRek8rSXYvY3JIanpJM2FlaDM0UE11NUt0Y016azZFQjRtT2FCNTFh?=
 =?utf-8?Q?/gezKKFXAPTlWFl?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4451a2d-4240-467e-8cde-08db3fb79459
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2023 02:49:50.3093
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kswnwef49H9DLDKuhxuyY1YbEvz3P+dgvC5gHtYHe6D3dRN5uN5S5QObiO3s2RLjX89Q23bl6008nuextqIp3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6039
X-Proofpoint-ORIG-GUID: Rh3UW2vvN1tX8ei4xo8NJG3ZznkOj5e3
X-Proofpoint-GUID: Rh3UW2vvN1tX8ei4xo8NJG3ZznkOj5e3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_14,2023-04-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1011 lowpriorityscore=0 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=800 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304180025
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gTW9uLCBBcHIgMTcsIDIwMjMsIEF2aWNoYWwgUmFrZXNoIHdyb3RlOg0KPiANCj4gT24gNC8x
Ny8yMyAwNjo0OSwgR3JlZyBLSCB3cm90ZToNCj4gPiBPbiBGcmksIEFwciAxNCwgMjAyMyBhdCAw
MjowMzowMlBNIC0wNzAwLCBBdmljaGFsIFJha2VzaCB3cm90ZToNCj4gPiANCj4gPj4gVGhpcyBw
cm9ibGVtIG1heSBiZSBmdXJ0aGVyIGV4YWdnZXJhdGVkIGJ5IHRoZSBEV0MzIGNvbnRyb2xsZXIg
ZHJpdmVyDQo+ID4+ICh3aGljaCBpcyB3aGF0IG15IGRldmljZSBoYXMpIG5vdCBzZXR0aW5nIHRo
ZSBJTUkgZmxhZyB3aGVuDQo+ID4+IG5vX2ludGVycnVwdCBmbGFnIGlzIHNldA0KPiA+PiAoaHR0
cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9jZWQz
MzZjODQ0MzQ1NzEzNDBjMDc5OTRlMzY2N2EwZWUyODRmZWZlLjE2NjY3MzU0NTEuZ2l0LlRoaW5o
Lk5ndXllbkBzeW5vcHN5cy5jb20vKT9fXzshIUE0RjJSOUdfcGchZkIwa3JVWDZxc09YckJzT0h6
THN0VkZXcVRMTDluY3dHRlh4bHhLMGVlZExZXzI5WGR3alhSdGJPLUVXdjFlWDVva04xck9lQlpz
cFoyMUtTYjViJCANCj4gPj4gVVZDIEdhZGdldCBEcml2ZXIgc2V0cyB0aGUgbm9faW50ZXJydXB0
IGZsYWcgZm9yIH4zLzQgb2YgaXRzIHF1ZXVlZA0KPiA+PiB1c2JfcmVxdWVzdCwgc28gYW4gSVNP
QyBmYWlsdXJlIG1heSBub3QgaW1tZWRpYXRlbHkgaW50ZXJydXB0IHRoZSBVVkMNCj4gPj4gZ2Fk
Z2V0IGRyaXZlciwgbGVhdmluZyBtb3JlIHRpbWUgZm9yIHRoZSBmcmFtZSB0byBmaW5pc2ggZW5j
b2RpbmcuDQo+ID4+DQo+ID4+IEkgY291bGRuJ3QgZmluZCBhbnkgY29uY3JldGUgZXJyb3IgaGFu
ZGxpbmcgcnVsZXMgaW4gdGhlIFVWQyBzcGVjcywgc28NCj4gPj4gSSBhbSBub3Qgc3VyZSB3aGF0
IHRoZSBwcm9wZXIgc29sdXRpb24gaGVyZSBpcy4gVG8gdHJ5IG91dCwgSSBjcmVhdGVkDQo+ID4+
IGEgcGF0Y2ggKGF0dGFjaGVkIGJlbG93KSB0aGF0IGRlcXVldWVzIGFsbCBxdWV1ZWQgdXNiX3Jl
cXVlc3RzIGZyb20NCj4gPj4gdGhlIGVuZHBvaW50IGluIGNhc2Ugb2YgYW4gSVNPQyBmYWlsdXJl
IGFuZCBjbGVhcnMgdGhlIHV2YyBidWZmZXINCj4gPj4gcXVldWUuIFRoaXMgZWxpbWluYXRlZCB0
aGUgcGFydGlhbCBmcmFtZXMgd2l0aCBubyBwZXJjZWl2YWJsZSBmcmFtZQ0KPiA+PiBkcm9wcy4N
Cj4gPj4NCj4gPj4gU28gbXkgcXVlc3Rpb25zIGhlcmUgYXJlOg0KPiA+PiAxLiBJcyB0aGlzIGEg
a25vd24gaXNzdWUsIGFuZCBpZiBzbyBhcmUgdGhlcmUgd29ya2Fyb3VuZHMgZm9yIGl0Pw0KPiA+
PiAyLiBJZiB0aGUgYW5zd2VyIHRvIGFib3ZlIGlzICJObyIsIGRvZXMgdGhlIGV4cGxhbmF0aW9u
IGFuZCBtaXRpZ2F0aW9uDQo+ID4+IHNlZW0gcmVhc29uYWJsZT8NCj4gPj4NCj4gPj4gUGF0Y2gg
Zm9sbG93cyAobW9zdGx5IGZvciBpbGx1c3RyYXRpb24sIEkgY2FuIGZvcm1hbGl6ZSBpdCBpZg0K
PiA+PiBuZWVkZWQhKS4gSXQgYWRkcyBhIG5ldyAncmVxX2luZmxpZ2h0JyBsaXN0IHRvIHRyYWNr
IHF1ZXVlZA0KPiA+PiB1c2JfcmVxdWVzdHMgdGhhdCBoYXZlIG5vdCBiZWVuIGdpdmVuIGJhY2sg
dG8gdGhlIGdhZGdldCBkcml2ZXIgYW5kDQo+ID4+IGRyb3BzIGFsbCB0aGUgcXVldWVkIHJlcXVl
c3RzIGluIGNhc2Ugb2YgYW4gSVNPQyBmYWlsdXJlLiBUaGUgb3RoZXINCj4gPj4gY2hhbmdlcyBh
cmUgZm9yIHRoZSBleHRyYSBib29ra2VlcGluZyByZXF1aXJlZCB0byBoYW5kbGUgZHJvcHBpbmcg
YWxsDQo+ID4+IGZyYW1lcy4gSSBoYXZlbid0IGJlZW4gYWJsZSB0byBjb25maXJtIGl0LCBidXQg
YXMgZmFyIGFzIEkgY2FuIHRlbGwNCj4gPj4gdGhlIGlzc3VlIGV4aXN0cyBhdCBUb1QgYXMgd2Vs
bC4NCj4gPj4NCg0KUGVyaGFwcyB0aGlzIGNvbnZlcnNhdGlvbiB3aXRoIEplZmYgbWF5IGV4cGxh
aW4gdGhlIGlzc3VlcyB5b3Ugb2JzZXJ2ZWQ6DQpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
MjAyMjEwMjExNjQzNDkuZmZ0NHlxbnh1enRzcWRldUBzeW5vcHN5cy5jb20vDQoNClRvIHN1bW1h
cml6ZWQgdGhlIGxvbmcgY29udmVyc2F0aW9uLCB0aGUgVVZDIG5lZWRzIHRvIG1haW50YWluIGEN
CmNvbnN0YW50IHF1ZXVlIG9mIHVzYiByZXF1ZXN0cy4gRWFjaCByZXF1ZXN0IGlzIHNjaGVkdWxl
ZCBmb3IgYSBzcGVjaWZpYw0KaW50ZXJ2YWwuIElmIHRoZSBVVkMgY291bGRuJ3Qga2VlcCB1cCBm
ZWVkaW5nIHJlcXVlc3RzIHRvIHRoZQ0KY29udHJvbGxlciwgdGhlbiB3ZSB3aWxsIGhhdmUgc3Rh
bGUgcmVxdWVzdHMgYW5kIG1pc3NlZCBpc29jLg0KDQpGcm9tIHRoZSBkaXNjdXNzaW9uIGFuZCBy
ZXZpZXcsIHRoZSBVVkMgY291bGRuJ3QgcXVldWUgcmVxdWVzdHMgZmFzdA0KZW5vdWdoLiBUaGUg
cHJvYmxlbSBpcyBleGFjZXJiYXRlZCB3aGVuIHlvdSByZWR1Y2UgdGhlIGludGVycnVwdA0KZnJl
cXVlbmN5IHdpdGggbm9faW50ZXJydXB0IHNldHRpbmcuIFRoZSBkd2MzIGRyaXZlciBoYXMgc29t
ZSBiYXNpYw0KbWVjaGFuaXNtIHRvIGRldGVjdCBmb3IgdW5kZXJydW4gYnkgY2hlY2tpbmcgaWYg
dGhlIHF1ZXVlIGlzIGVtcHR5LCBidXQNCnRoYXQncyBub3QgZW5vdWdoIHRvIHdvcmthcm91bmQg
aXQuDQoNCllvdXIgc3VnZ2VzdGlvbiB0byBkZXF1ZXVlIHRoZSByZXF1ZXN0IHdvdWxkIG1lYW4g
dGhlIGNvbnRyb2xsZXIgZHJpdmVyDQp3aWxsIHJlc2NoZWR1bGUgdGhlIGlzb2MgdHJhbnNmZXIg
YWdhaW4sIHdoaWNoIHJlc2NoZWR1bGUgdGhlIG5leHQNCnJlcXVlc3QgZm9yIGEgbmV3IGludGVy
dmFsIChwb3RlbnRpYWxseSBhdm9pZCBiZWluZyBzdGFsZSkuIFRoYXQncyBmaW5lLA0KYnV0IHRo
YXQgbWF5IG5vdCBiZSBhIGdyZWF0IHNvbHV0aW9uIGJlY2F1c2Ugd2UncmUgc3RpbGwgcGxheWlu
ZyBjYXRjaA0KdXAgYW5kIHRoZSBtaXNzZWQgaXNvYyBhbHJlYWR5IGhhcHBlbmVkLg0KDQpZb3Ug
bWF5IHRyeSB0byBkbyB0aGUgZm9sbG93aW5ncyB0byBtaXRpZ2F0ZSB0aGlzIGlzc3VlOg0KMSkg
TWFrZSBzdXJlIFVWQyB0byBvbmx5IHF1ZXVpbmcgcmF0ZSBpcyBjb25zdGFudC4gUGVyaGFwcyBx
dWV1ZSBkdW1teQ0KICAgcmVxdWVzdHMgaW4gYmV0d2VlbiB0aW1lIGdhcHMgaWYgbmVlZCBiZT8N
Cg0KMikgRW5oYW5jZSBkd2MzIHRvIGRldGVjdCB1bmRlcnJ1biBmcm9tIFVWQyBvbiByZXF1ZXN0
IHF1ZXVlLiBpZS4gSWYgdGhlDQogICBxdWV1ZSBpcyBlbXB0eSBhbmQgYSBuZXcgcmVxdWVzdCBp
cyBxdWV1ZSwgcmVzY2hlZHVsZSB0aGUgaXNvYyB0cmFuc2Zlci4NCiAgIFRoaXMgd2lsbCBicmVh
ayBzb21lIG90aGVyIGRldmljZXMgaWYgdGltZSBndWFyYW50ZWUgaXMgcmVxdWlyZWQuIFNvDQog
ICBwZXJoYXBzIGFuIGFkZGl0aW9uYWwgZmxhZyBpcyBuZWVkZWQgZm9yIHRoaXMgY2hhbmdlIG9m
IGJlaGF2aW9yLg0KDQpCUiwNClRoaW5oDQo=
