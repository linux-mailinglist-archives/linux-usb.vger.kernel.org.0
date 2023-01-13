Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A26566689FC
	for <lists+linux-usb@lfdr.de>; Fri, 13 Jan 2023 04:18:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbjAMDS4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Jan 2023 22:18:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbjAMDSr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Jan 2023 22:18:47 -0500
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BE35559C5
        for <linux-usb@vger.kernel.org>; Thu, 12 Jan 2023 19:18:29 -0800 (PST)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30CK2tE1010986;
        Thu, 12 Jan 2023 19:18:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=j5NrASgDbLVWFQ/VvUKUVTR/ogc5YGQlsQY2cZMVNVg=;
 b=g0gP8fRzIErpjJJnHOIh7LzlKbC8SHuMaXHSHmIzKzZrCLij3pLyL3KaNYV9F70BHNmC
 q/VZK8oho5MT6kkFUh74y7orZoQnnMbQGNXQh9ycn2yaQJimRC57JLYSvX+YppG8VaHW
 34mC9fsdsNon0FET8TFxeF5ga3KrsGp+7vVrppDi0WnTyKPFaubVqKC6F8v5soNl9/CA
 oJYgAQfGLpXQ/kzpnbstgYDz37jL6GEH8zq2AexxOrxyjvu9TwC5TgehsatinCqskzkE
 YZI0vQq5KItObyFjay4WrkkAHm93xhjAm2nbwH2wzWDKPcAmbx/EmzCOrAgMfKB8kcRO Uw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3n1k4tquy4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 12 Jan 2023 19:18:21 -0800
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1A7D1C00F3;
        Fri, 13 Jan 2023 03:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1673579900; bh=j5NrASgDbLVWFQ/VvUKUVTR/ogc5YGQlsQY2cZMVNVg=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=L0kLn8EcLu1W6Y+t0RqNgMqpdmD7oN0NIM5TWPk3CD24C29on8mUylqtGKVlDrZbe
         LZ575aeY3jDLbXJRZrH4lUwzhw1vvdF7TwNihIN0sOu//CkM4TeufcpUo2Epa439j0
         IiCbND2OQfEc6Wmh7d3yTCLTGiDpyE+PypsmK9wVIXCgN8kVe7XIyFph/AmL0B6gZ2
         BjmviKtHFd2hIC4S4YA3ijvtpv2dRr7K9Qi8Ur8MTXgRbz4sTAfVksFm+zp/a42M/e
         qFu7t8u4SE2i+nzdCtvcyGSj4AIQ46GQ4h0eRMmUeS1gSKr+eI3uyQDFsx2FU7sIsM
         66Jy5svBPB/Zw==
Received: from o365relay-in.synopsys.com (unknown [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 67B13A005C;
        Fri, 13 Jan 2023 03:18:18 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id C4F3B40042;
        Fri, 13 Jan 2023 03:18:17 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="bp7Dl9Fj";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KEJUrY+1MH/f8+kGYGLZKXXGKSAfWVgRN83PPKxhWYdFdECG7XdtOhBth6uSNMxMWvhPDS6eibS8SZ44UN8ZmTfF5wDQZ3nXLdScP3ilf6ePLfGg/6aorc52etspXXpnnw9MI6vFnSKM8KH3WdKzi/edn8Aly5bF5WvqF85b+58QO7dMdQ20G8oVNtu6WrtIBMlMemhI/NrP7oYvcci6pXxdaQq8xFF0ZQYAbp4zheXpZafcs37fgiKLJsmYYUml0uULmA1BwH7nOQalAm33azDLLD485kS/PWzkvHynnviCszcHAYcntqxjhDolSe44Bcfnlr03QATCapQAWkenkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5NrASgDbLVWFQ/VvUKUVTR/ogc5YGQlsQY2cZMVNVg=;
 b=M5yBXuLkcCvWk1Aj7Is47Dg4H44J2YKj6lEY1Abtt3I4Vj65uoH8ftpb1tYNuAoQJ0joDuK8yI8Ueg3olFd/PVRnAsC+g2xAk4bLQz7pOeeNuYNy4xAtNj33UtVjYS/Efz+mBcJAVuKD3TjyZ+dYhCPA/vfaAo3FQZS1ZfIrMavvcGMEfSqoCHi+HjH0VMtXbL3eAtZC859Od2kCxMBuzvq7BbM10p3AaHJkMTNhY9QIZf525znT/d9ODMgXyjTeKs2D7JRxBVoVQ3dgLik70ZG1VhXAT9O9ug6WOwV3jPFHaXLJdEboEH4ACFd3x1bumn0BajcuFdblFJ2P5V/NaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5NrASgDbLVWFQ/VvUKUVTR/ogc5YGQlsQY2cZMVNVg=;
 b=bp7Dl9Fj+ye3SgwUq6KZ54yM9giXnAxoGYLglk2H+QTX9y1VFWwDSGLfEWGliLwMOXD6OeeEdmUzkf3Yv9eCHCGLH1XLMM4dYRNZWSxWwVmZlDLPQKnKb3x0+47Fbd4tDvp+b2u9ECHfwPB3FJxEr0je8kiT5E/tSl+wGfVL6M0=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SJ1PR12MB6074.namprd12.prod.outlook.com (2603:10b6:a03:45f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 03:18:15 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::e395:902b:2e90:b7ee]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::e395:902b:2e90:b7ee%4]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 03:18:15 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "Jun Li (OSS)" <jun.li@oss.nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH 2/3] usb: dwc3: add dwc3_readl_notrace() function
Thread-Topic: [PATCH 2/3] usb: dwc3: add dwc3_readl_notrace() function
Thread-Index: AQHZIbBPDcqFUUga/0S7en4fefnHfa6Vct4AgAACR4CAA2I5gIABN2uAgAGE/ICAABi+AIAAC3OA
Date:   Fri, 13 Jan 2023 03:18:15 +0000
Message-ID: <20230113031813.zozc3v4m2m3jybrb@synopsys.com>
References: <1672996895-22762-1-git-send-email-quic_linyyuan@quicinc.com>
 <1672996895-22762-2-git-send-email-quic_linyyuan@quicinc.com>
 <PA4PR04MB9640E527BFC0CDA519DD3BF989FE9@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <e8ab0a98-c53b-5db0-d9c2-04258eabd945@quicinc.com>
 <PA4PR04MB964044E1882A24A5EC122B6D89FC9@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <3706dc91-9126-bef2-4926-ee184002e889@quicinc.com>
 <20230113010841.ougwmotzlm56nciz@synopsys.com>
 <68d3e800-afe6-9e27-e4e4-3670696abd9a@quicinc.com>
In-Reply-To: <68d3e800-afe6-9e27-e4e4-3670696abd9a@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SJ1PR12MB6074:EE_
x-ms-office365-filtering-correlation-id: b6a4f952-ecdc-4185-65ab-08daf514cf51
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zgIij4gHYchun6mr/tEu8ekKvYo3w8Suq/Fjqe+UrQej1M1p522A/MMzQD16I9yA0HFl7MwWsBM7htsPNRXRaYKsl60C+FFC4ySsuRF4BjPfSL6ACGC0cnJzBNZ9827DyumICJvPM9fmbvDtOh1TDOayMBcivbPXcY4ktGZW49FNjnpm9r/fnTh07OhpDabatoG+KE4Ze9Zler0jLsnCZuajzpdoDvbf3Kh8KmhmGOICDEjn/GepbjSwcPu+4a+ZbVFW/2OJbQHHbhgH5C05Fdjo+r5Dw7blTrH4P6lhVYrgr61GK4iOfrEV85Dib/Kjy3Nj/YdDr9IA3FCSHKAj6ZtznCg6i9/z71ywgLB9kSBsEPzZ0r4bEH3/g1MSEbqev7cGtuLVlqoM/c8ZTmWm6WkQ9j9fSf6EiGnUyslYc1uquuekKLDZuWg44SEP6Nl9LoVyK4W994XiyAZM8ODfAugKYS4G1LpPsyuyXjuJy0HQcx3XdlnKjIFpY7O7rw8UA9HVjzC9KSK1qfpdsr0u9aZOJg/BxD9MyfDgfc8MFycl5la0htoMJuFH3N7lHPbr2edhbC+HiRILwnClStfFV/yUHTunyMGWYpIF2ZQpNU9Jm0d1+dJLQnaophixeIRVz4QT2jp4rdVEQMZ/rMW3E+Dq5q3jV6//REMH5CxUbCCImZl1p/TRV7qc4BEGffwywL+DnRDczbm+9e612N8xztqJdalaL8tcn8gOhIx2Xm8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199015)(122000001)(38100700002)(6916009)(4326008)(66556008)(76116006)(66946007)(64756008)(66446008)(8676002)(66476007)(6512007)(86362001)(186003)(71200400001)(36756003)(316002)(38070700005)(1076003)(26005)(54906003)(478600001)(2616005)(966005)(6486002)(2906002)(6506007)(53546011)(8936002)(41300700001)(5660300002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFVKUlZMbFhjUWgrbGMvd0FhSHRMTm0xR29wWkNCTjZkanN1VW5sc0pNVVk0?=
 =?utf-8?B?dlVONE8xQU9vRXpsdjhFUXBQek4va0oybTBDQzdvNVVrMXlaUjc2ZnMyZ2Qr?=
 =?utf-8?B?U3A3SVVqcU1QT0NmZE1KZ0RFVThCRUwzRU9tT045ckR2UUR0TXNiMG9XNWd0?=
 =?utf-8?B?bWlZNVRmTjhraUJraHByTDN3NmNIbnZNcFgzZ292OU9yWVQyWEszdmliaFQw?=
 =?utf-8?B?S3ZoLytEckZBRC9kVThGQzA0OGNnWDlaa2NvTTA5RDdNaS95TzNuQnNzYjJL?=
 =?utf-8?B?MDdzdHlsWTd5VHpYTCt1czJ6R3hPQmMvclk1TmFRdkdlY0RPbndXdmtZRkhG?=
 =?utf-8?B?ai9zck1RcVpZY0lRdnpKYTFTMW5zRXQ2aDRNd21LRFpiQzhxRGJBRmZENmd3?=
 =?utf-8?B?ekdOSFNFYlRiTnJOVVphVVRFNm9YWEY0Z3lSNHR4QXI4NjhSY2NZNHkwUFRx?=
 =?utf-8?B?MVV3Q2VqSkZRNHFPdUtkcURHMkFXUzdTeGtaTWl5TGhRL3c0WmVIbDFEbHRT?=
 =?utf-8?B?MWQ3WURVSzVXaVh3MjVKQWRJay9LT3dCcjZoOWZhMCsxeU9rbmpWODJMc2M3?=
 =?utf-8?B?b1FHYzNEOWhabDI3OTR6VU1mRlVRSlpJWUJDc2ZxcWt6QXdlWWRYUWVTbGNt?=
 =?utf-8?B?eE5uWkdlcEVKcFlqM0p6QVgxU3lyK0dYc2F3Mk5pOEVrTFlRTTdmSndjb2sr?=
 =?utf-8?B?aXNpcWU4eU9KVUVyMGZHb09GR3RkSUVyT0NuVFllbE9QT2JLb2FtNFRENmZa?=
 =?utf-8?B?bHZQQkFUM0JWdngrblYwc0c2WSszTjVsRHNNWktpL0dIRHAvT3BQTWR6dWJE?=
 =?utf-8?B?NFhxc3U4QW5ON2k2TmV6ZngyMW9aVDlQSm9iSnF5SWd2T1RjUTRtelVvTVl3?=
 =?utf-8?B?Rk15YXJBYTUxRTJGcDhDbVNpNitJaHZId0xBeDdObUZ5bWZkYlRhYzBMaUZV?=
 =?utf-8?B?bU9HeVkzTnF0NzUxT2lmdWxqNTZJNWtJK2NsNy81U01YS25VRzR5UThzTFE1?=
 =?utf-8?B?RFFsVXdCdldJVllGMUIwb3RBRkZ2dzBVaFQyOHBMZFVmWU1qTVZwb2dFNFA4?=
 =?utf-8?B?TzhZc1hMR3pZZ0VOaXR1Y1BUSnJRMDBnUHlnOU9ZdTMwVXhwa09KUVdPMTZx?=
 =?utf-8?B?S25vMlgyR3o0bWMzenlVZENWeWdqMGFRSk1Fa3pPTGlPZExYTWh2NU9vVGdV?=
 =?utf-8?B?MDNTZVNvUDVIaVg2Yk1OOUQ5M3l1Y21WWENEbXd0MHNQN3B5RUVVQTNteFN1?=
 =?utf-8?B?ZlVKOVg1QUg5WWs0VWN6V2hPRzl0WmhoYk9WNEZJMEE1RGQ5eFgzUGpFdXRa?=
 =?utf-8?B?S1ZtNUhpZWlBRzFmWlpyM0hFcWJ5OXFjbEtsUlUrYU1Kbk1pcGJwTUtQR1E2?=
 =?utf-8?B?Ym1va3hjZGZ6dUkvdFZxSTRjNnVNNFNXdTJzRjNOeGVxeEtQM2xsK3dtRG1K?=
 =?utf-8?B?dG1RZGpIR01LekdaKzhObExhS3dLSHBJRnBFTFJoTFV0T2VuSm1zaHQzNFFN?=
 =?utf-8?B?ZmVrcnVYMDdvNHBuY2VsYUVNQ2V6ajdoajR1Rko4L2w5LzBQNzJvNmVVcGdM?=
 =?utf-8?B?WU9jNmtCb0lxVTV3SG1OakxBd20zVnQvaG1KOGpha2dtME1GZnNSMWJLWHM5?=
 =?utf-8?B?MS9PbERUYVExaG9qQXFSM1EyTXRsZ29ERENCSG0xUHhNUjlPb2NZZko5cEJh?=
 =?utf-8?B?azF1UHo4SjNXTGM4R0RScnAwdkQzZldiUjFkaVlJbVEwYnFYTFFRMFhqeTFu?=
 =?utf-8?B?TEhad0VLdUtqd3oxK0JXT1NTaUVxcUNHR0pOb0E5bVRkU05xUjJLbHI0ZzU1?=
 =?utf-8?B?YU9nc2kxUTJUSHJHbVNFUWlGM1h3UE9nUWNTbHV0bTNMa2RHdGZMQTdwNEdz?=
 =?utf-8?B?ajlaT2NJeno3a0dZUENFazluS3A1RGtsakZmOE9ZcE9PNTc3NnZSZzdsQ1ZF?=
 =?utf-8?B?WlhGSmZHQjdxalZZT0FBUUlmZFl3WkJnb3EvU21lN0dmNTRRYzhFTVNlQ3ov?=
 =?utf-8?B?dTRXUFBGemdOc3lCOWlPNHQyU3FVcVVmM3VjQVZQbFVsOEp5anM4Slc4MzJs?=
 =?utf-8?B?NFhnRld6UXQrWkE3QkVMUWYwdTFXRkRybVRtZ1g4TzBIWkVnNlZwM0hkWXA2?=
 =?utf-8?B?QkdITXdCVTJRVWh2ZWlWZk11R1NoRkRBNlNYL25FajJ3VGVNRWV5WEpUZldu?=
 =?utf-8?B?VXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B0B08CECFBD4914EBCBC4A114A5BA114@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: xtX0zdQt+g7bAWu7O7pozqjQvNinaVMVSkLuODY0BTffFYfTxqjudzBHXSYs9UBXJpmgogEV4XD0mfMQBaJ3yPE58a39OlLYv9YDrHOsCVDNHdtPM8Qjmhneo2M0LoaKA842I44cOlTQEv7g5GDtswabpSOk+hhbAdMhz52rdS3o+JsEIjV/DxssFUGiJwD3E1ec7zNPt3BWIfVZNEW+OBPLb3n44mJSszp1DLMKHMJD/bGCWE8Cwm0JGfqpj6dDOsLerMnQzCWXp7quipMiT8XiU6+4tXhfgDgxMTUPnlT3CTqfkAqtuOIE7gQL0fv6P9XuGX0DJGc0LOtmyIuIRDS++643cwQ/7JhO/E902AhXfEb2FvvwHh/SMcFiVOttvqM/PU7IaYr1NI1YtoFBDmTjjQGfetQFLqfQmkGGkPyLmwZdUVDuXQ6OBg0xcZLhZyE834+VBuocQKKmquY4hFy33qOtKVjC0fpSNwRp0+vWT43s9KqZzPDcLr00RetnqO9YC8BFslrrMPtT9lIMjlxlEXgx4SOb/OaQdsVOlLLIq/wKw8poliMb15TmYAKSINy3pSKGkql8S7DCC7laiyhV/6Ypdo+3Zv3uI75yJZW7Jk7N3bStgY4qpMT52uqB9bKjkhxkacUq8IAoS1CfY1Zsk7iQlzGhRHPDw24gtvSaa8iOqgs330vgymEVylarnkLZlm8yQIPXmqVuErzkjnz2FgcmySnIKy0AlMgWploKiWdrordNoKRDq4xShgGU8WmvXbTqC7Xh5pR+TvVU9wKN5KQfC1Calnie1IrVJ6mjD32tOxXdoGV0aWBG+t1Deu+71sdoUNLgmXPFkU5XQDZFt22DndQ4lbhQhSe1g1ilXTQz8arhLTEoL+sRWeWLIlt2CNxWfTYOx5ABG4ski2dDvLbOkgji5qSoxtUraVA=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a4f952-ecdc-4185-65ab-08daf514cf51
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2023 03:18:15.2403
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FniNv11mhTX4eOxOZZ11HbMpGUuhvSx9CCZn2XxHjM3V10iDdbmz6Ri7PT+25sD3lzgCvKgCe0LISFTTTCOCSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6074
X-Proofpoint-GUID: GwMxMp5Y_B6UCFd2mOBbWPhNtX1Mr7qy
X-Proofpoint-ORIG-GUID: GwMxMp5Y_B6UCFd2mOBbWPhNtX1Mr7qy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_14,2023-01-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 mlxlogscore=692 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301130019
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gRnJpLCBKYW4gMTMsIDIwMjMsIExpbnl1IFl1YW4gd3JvdGU6DQo+IA0KPiBPbiAxLzEzLzIw
MjMgOTowOCBBTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IEhpLA0KPiA+IA0KPiA+IE9uIFRo
dSwgSmFuIDEyLCAyMDIzLCBMaW55dSBZdWFuIHdyb3RlOg0KPiA+ID4gT24gMS8xMS8yMDIzIDM6
MjEgUE0sIEp1biBMaSAoT1NTKSB3cm90ZToNCj4gPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+ID4gPiA+IEZyb206IExpbnl1IFl1YW4gPHF1aWNfbGlueXl1YW5AcXVpY2lu
Yy5jb20+DQo+ID4gPiA+ID4gU2VudDogTW9uZGF5LCBKYW51YXJ5IDksIDIwMjMgMTE6NDIgQU0N
Cj4gPiA+ID4gPiBUbzogSnVuIExpIChPU1MpIDxqdW4ubGlAb3NzLm54cC5jb20+OyBHcmVnIEty
b2FoLUhhcnRtYW4NCj4gPiA+ID4gPiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBUaGlu
aCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQo+ID4gPiA+ID4gQ2M6IGxpbnV4
LXVzYkB2Z2VyLmtlcm5lbC5vcmc7IEphY2sgUGhhbSA8cXVpY19qYWNrcEBxdWljaW5jLmNvbT47
IFdlc2xleQ0KPiA+ID4gPiA+IENoZW5nIDxxdWljX3djaGVuZ0BxdWljaW5jLmNvbT4NCj4gPiA+
ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvM10gdXNiOiBkd2MzOiBhZGQgZHdjM19yZWFkbF9u
b3RyYWNlKCkgZnVuY3Rpb24NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBPbiAx
LzkvMjAyMyAxMTozMyBBTSwgSnVuIExpIChPU1MpIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPiA+ID4gPiBGcm9tOiBMaW55dSBZdWFuIDxx
dWljX2xpbnl5dWFuQHF1aWNpbmMuY29tPg0KPiA+ID4gPiA+ID4gPiBTZW50OiBGcmlkYXksIEph
bnVhcnkgNiwgMjAyMyA1OjIyIFBNDQo+ID4gPiA+ID4gPiA+IFRvOiBHcmVnIEtyb2FoLUhhcnRt
YW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPjsgVGhpbmggTmd1eWVuDQo+ID4gPiA+ID4g
PiA+IDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KPiA+ID4gPiA+ID4gPiBDYzogbGludXgt
dXNiQHZnZXIua2VybmVsLm9yZzsgSmFjayBQaGFtIDxxdWljX2phY2twQHF1aWNpbmMuY29tPjsN
Cj4gPiA+ID4gPiA+ID4gV2VzbGV5IENoZW5nIDxxdWljX3djaGVuZ0BxdWljaW5jLmNvbT47IExp
bnl1IFl1YW4NCj4gPiA+ID4gPiA+ID4gPHF1aWNfbGlueXl1YW5AcXVpY2luYy5jb20+DQo+ID4g
PiA+ID4gPiA+IFN1YmplY3Q6IFtQQVRDSCAyLzNdIHVzYjogZHdjMzogYWRkIGR3YzNfcmVhZGxf
bm90cmFjZSgpIGZ1bmN0aW9uDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBUaGVyZSBh
cmUgbXVsdGlwbGUgcGxhY2VzIHdoaWNoIHdpbGwgcmV0cnkgdXAgdG8gMTAwMDAgdGltZXMgdG8g
cmVhZA0KPiA+ID4gPiA+ID4gPiBhIHJlZ2lzdGVyLA0KPiA+ID4gPiA+ID4gSXQncyAidXAgdG8i
LCBJIHRoaW5rIGF0IG5vcm1hbCBjYXNlLCBpdCdzIGEgc21hbGwgbnVtYmVyLCBpZiBhIGxhcmdl
DQo+ID4gPiA+ID4gPiBJdGVyYXRpb24gbnVtYmVyIGlzIG9ic2VydmVkLCBwcm9iYWJseSB0aGVy
ZSBpcyBzb21ldGhpbmcgd3Jvbmcgc2hvdWxkDQo+ID4gPiA+ID4gPiBiZSBjaGVja2VkPw0KPiA+
ID4gPiA+IGRvIHlvdSBtZWFuIHRoZSBvcmlnaW5hbCBsb29wIGNvdW50IGNhbiBiZSByZWR1Y2Vk
ID8NCj4gPiA+ID4gTm8uIEkgbWVhbiB0aGUgbWF4IGxvb3AgbnVtYmVyIGlzIG5vdCBhIHByb2Js
ZW0gYXQgZ29vZCBIVy4NCj4gPiA+ID4gV2hhdCdzIHRoZSBhY3R1YWwgbG9vcCBudW1iZXIgb24g
eW91IEhXPw0KPiA+ID4gDQo+ID4gPiBpIGRpZG4ndCBjaGVjayBpdC4gaG93IGFib3V0IHlvdSA/
IG5vIG1hdHRlciB3aGF0IGlzIGdvb2QgSFcgb3IgYmFkIEhXLA0KPiA+ID4gY3VycmVudCBjb2Rl
IGRlZmluZSBhIGJpZyBudW1iZXIuDQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gYWN0dWFsbHkgaSB0
aGluayB3ZSBzaG91bGQgbm90IGRpc2N1c3MgaXMgaXQgYSBnb29kIG51bWJlciBvciBub3QuDQo+
ID4gPiANCj4gPiA+IHdoYXQgaXMgcHVycG9zZSB0byB1c2Ugc3RhdHVzIHJlZ2lzdGVyIHJlY29y
ZCA/IGRvIGl0IGdpdmUgeW91IGFueQ0KPiA+ID4gaW5mb3JtYXRpb24gdG8gdW5kZXJzdGFuZCB0
aGUgSVAgYmVoYXZpb3IgPw0KPiA+ID4gDQo+ID4gV2hpbGUgc29tZSBwb2xsaW5nIG51bWJlcnMg
c2VlbSBsYXJnZSwgd2Ugc2hvdWxkIG5vdCByZW1vdmUgdGhlIHRyYWNpbmcNCj4gPiBldmVudHMg
ZHVyaW5nIHBvbGxpbmcuIFRoZXJlIGFyZSB1c2VmdWwgaW5mbyBpbiB0aGUgc3RhdHVzIHJlZ2lz
dGVyIHdoZW4NCj4gPiB0aGVyZSdzIGEgdGltZW91dC4gQWxzbywgdGhlIG51bWJlciBvZiBwb2xs
cyBuZWVkZWQgZm9yIGNlcnRhaW4gc3RhdGUNCj4gPiBjaGFuZ2UgaXMgdXNlZnVsIGRhdGEgcG9p
bnQgZm9yIGRlYnVnLg0KPiA+IA0KPiA+IFdoYXQgd2UgbWF5IHdhbnQgdG8gdXBkYXRlIGlzIG5v
dCBkZXBlbmQgb24gdGhlIHJlZ2lzdGVyIHJlYWQgZGVsYXkgZm9yDQo+ID4gdGhlIHBvbGxpbmcg
ZHVyYXRpb24uIERpZmZlcmVudCBzZXR1cCB3aWxsIGhhdmUgZGlmZmVyZW50IGRlbGF5Lg0KPiA+
IA0KPiA+IElmIHdlIHdhbnQgdG8gZGlzYWJsZSBpdCBmb3IgZGVidWdnaW5nIHB1cnBvc2UsIG1h
a2Ugc3VyZSB0byBoYXZlIHRoZQ0KPiA+IGRlZmF1bHQgb3B0aW9uIGFzIGVuYWJsZWQuDQo+IA0K
PiANCj4gaWYgc28sIGRvIHlvdSBhY2NlcHQgZGVmaW5lIGEgbmV3IGZ1bmN0aW9uIGFuZCBuZXcg
dHJhY2UgZXZlbnQgbGlrZSwNCj4gDQo+IHN0YXRpYyBpbmxpbmUgdTMyIGR3YzNfcmVhZGxfdGlt
ZW91dCh2b2lkIF9faW9tZW0gKmJhc2UsIHUzMiBvZmZzZXQpDQo+IA0KPiBERUZJTkVfRVZFTlQo
ZHdjM19sb2dfaW8sIGR3YzNfcmVhZGxfdGltZW91dCwNCj4gwqDCoCDCoFRQX1BST1RPKHZvaWQg
X19pb21lbSAqYmFzZSwgdTMyIG9mZnNldCwgdTMyIHZhbHVlKSwNCj4gwqDCoCDCoFRQX0FSR1Mo
YmFzZSwgb2Zmc2V0LCB2YWx1ZSkNCj4gKTsNCj4gDQo+IGxldCB1c2VyIGVuYWJsZSBpdCBhY2Nv
cmRpbmdseS4NCj4gDQoNCldlIGNhbiBqdXN0IHJlZGVmaW5lIHRoZSBldmVudCB3aXRoIGFuIGFk
ZGl0aW9uYWwgcGFyYW1ldGVyIGZvciBldmVudA0KZmlsdGVyaW5nIG9wdGlvbi4NCg0KTWFrZSBz
dXJlIG5vdCB0byBjaGFuZ2UgZHdjM19yZWFkbCgpIGRlY2xhcmF0aW9uIHNvIHRoYXQgdGhlIHBh
dGNoDQpkb2Vzbid0IHRvdWNoIGV2ZXJ5IHBhcnQgb2YgdGhlIGRyaXZlci4NCg0KQlIsDQpUaGlu
aA0KDQo+IA0KPiA+IA0KPiA+IEFzIGZvciB0aGUgaW5jb25zaXN0ZW50L2xhcmdlIHBvbGxpbmcg
Y291bnQsIHdlIGNhbiByZXZpZXcgYW5kIHJldmlzaXQNCj4gPiB0aGUgY2hhbmdlIExpIEp1biBk
aWQgYSB3aGlsZSBhZ28gdG8gdXNlIHJlYWRsX3BvbGxfdGltZW91dF9hdG9taWMNCj4gPiBpbnN0
ZWFkOg0KPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC11c2IvODdibG15bXdsei5mc2ZAa2VybmVsLm9yZy9ULyp0X187SXchIUE0RjJS
OUdfcGchZVpCY1c3OHpMTWtPdGZQSWh4TnZJR2pJdHZfVzJJVnZwTHlPVi0zZUNyV1JrN1QxUFZF
UlNtejAzN0hMeDFuTE9IZ09zUlRLMUN6OERIRmVCWFoyMVd3WTVPa0psdyQNCj4gPiANCj4gPiBU
aGFua3MsDQo+ID4gVGhpbmgNCj4gPiA=
