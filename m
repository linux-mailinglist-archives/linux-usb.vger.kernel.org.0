Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 507316FD185
	for <lists+linux-usb@lfdr.de>; Tue,  9 May 2023 23:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235902AbjEIVhs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 May 2023 17:37:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235721AbjEIVhp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 May 2023 17:37:45 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EB3B185
        for <linux-usb@vger.kernel.org>; Tue,  9 May 2023 14:37:20 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 349Hg2GU030133;
        Tue, 9 May 2023 14:37:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=YRqIGG+qaWp9FWcEEbTd9d7R+al67NE6oH7GMXkkrak=;
 b=TnJBjzJJTWe1bcx9vPhSgLRWiy4l/i6Ik7UqrCaavZU19LNtIGJUk2nt4A4fbusKDEec
 GBXa9FAFOI1KnggOog9aVEkktLTjczyept9pR8QgvVFExMBbk4vvXNetAWWVYO8COjsG
 i4F/Ol0sNoe51IagXrHuKju1RNJQrFaDTb9WhJ/rzC7N+LNobdTYj4QvcCMZI1CjuemR
 MkPkBSoIYxNGWIjXodYrMP9OtL53G+pSc6SiSbYmhYAxcmxGF5wnTuOR9SHQu8pPuDW/
 /GL2nYeTqhQK6s2bjVBQTRRTTW44xFdCfYdrPy7FZxiYXnHVSRhBfaQY/Vl3z93Wf0CW 3A== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3qf7725xn3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 May 2023 14:37:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1683668221; bh=YRqIGG+qaWp9FWcEEbTd9d7R+al67NE6oH7GMXkkrak=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=VFiPpiH20fKCOPIO93YsAUE2QM3iMmnT+wlXdVAR5H9qhN2hwBnQPf+YBvwTinF79
         kSHhrbuk3ohK4eydnsfVyHj3oB/Ku13e1Um3V+l0FxD/IDEewu2OMturjKnKnwBssE
         5Dpjcav9mAJqZh9GW2TDrsHZxGlB4FCBJ+Io5OcTVOzR6plCMqW6/aNaUWaXZCWMo3
         gKRJ75eWUgm5YRB2lMJG/x8Sbq/Vr1+n4lNnYT1g7e9SBOUqiMuvx0XCm4cE/Yi6+i
         Td/yuL8U/2V9KfBKxBI28wf4I3eyuDommKvcWdy1apXlyNSMqrv9A9XAIlz5Ng11On
         ZjfydkNo63mMw==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 25C814074E;
        Tue,  9 May 2023 21:37:00 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 6C42AA005A;
        Tue,  9 May 2023 21:37:00 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=JEtxrJic;
        dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 59AA540360;
        Tue,  9 May 2023 21:36:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YTGNaIfe6+tT4geCuNLoNJKEdW5Ad7IRQzA7oEJm2/LxQ+rBJIxDk7bnx6ClP2FRoKTIf3Q/xuCvqWKEo0ZpBzGDHgGgGmdmUUljJsRlP2vPcfSrjSf2IEjBKhDQsXp2xecxbvklNIpYubkWPDQ9MZrSLBwuM0bAeUH8SYq67Sjk5NFAn3qs/S13GH+IzCwDjQXBxYzbWyoF8Mt3+P6FW/lkKbfKEnTZn2LfwaPC08rRcw10YTZnYIddRcN/QavjXENgz/ONz7qiCtj4Icjs3VpC4nKbjeQodo90gE1Py/nC46z4/c4de0X4X9WOZntVdxZ8tu4lAGYbPqLW0J213A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRqIGG+qaWp9FWcEEbTd9d7R+al67NE6oH7GMXkkrak=;
 b=j78h7gCXm0SP0xY0zZ/UpeA9V/6vSAqU4iVUOzJYNcYmHRB0u24GYMjrqsT62fQUE5vZBO2GQda0Guw7lE+8rgBAp84BX6wvfyG7B37EAlb7Py5WMkTYcdevDa6pJ5HKsm88mnwukFWfLGji4X42drrCtfD952hVMmWuoXNGPX9LM7ztW+AchO9OWDXDOm+E5lcHxk9zuzurFKgX5RWZXdiXO3VUTX/8Dd0DUbw3yyt3uQMr1bmdvXvO6f3I7hvgEYmD+FSLzY0szYZ0xzO949ZaMtVA6Azc12XsRWGb1Tu1cP8VoPAMIB5IuzN3g8u0k3yZ3Xc8Uk6Kj7jTbiKiiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRqIGG+qaWp9FWcEEbTd9d7R+al67NE6oH7GMXkkrak=;
 b=JEtxrJic5zqQYypdFMcd80dSRLfAVJztyOeR1XuD3VOw2xXjCTYpO5Ug37eOD0RKzzFBfMZYybjXV/Ti9/EgBKYp/sLlxuz6RXdDTC0bOfoRBaexAMgj9Yt+TB0X8KaQNpyG7Oj8U6vqecyNKSMANl1q/IkEHEgaM1aGmnZGRwI=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SJ0PR12MB6941.namprd12.prod.outlook.com (2603:10b6:a03:448::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 21:36:54 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::bb79:9aea:e237:688c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::bb79:9aea:e237:688c%7]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 21:36:53 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v7] usb: dwc3: fix gadget mode suspend interrupt handler
 issue
Thread-Topic: [PATCH v7] usb: dwc3: fix gadget mode suspend interrupt handler
 issue
Thread-Index: AQHZgjRF6XnNKS2fRkG0SgF7LbFASq9SeFMA
Date:   Tue, 9 May 2023 21:36:52 +0000
Message-ID: <20230509213652.iexejngdlnrxixrm@synopsys.com>
References: <20230509050743.5781-1-quic_linyyuan@quicinc.com>
In-Reply-To: <20230509050743.5781-1-quic_linyyuan@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SJ0PR12MB6941:EE_
x-ms-office365-filtering-correlation-id: 584b2d90-5398-4f0e-508e-08db50d58124
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iEXgOLiSajRzg/kBz6NhE1CeTz8+tWEfDbIrn8o6uyuBHncGGtzve5Nskq/MOm6MAPH2wUCPvqcIhbFjiGrOhPzt1FJwcXZHYV/XVXsq/w78eLIpc23TdNmJF/C2fBs8NWNM9YFalwKJL3vOJ3yIDLrKScTSSPU/bnVEm0PhWmTdqRgVw0Uy4X9oBbVP9gxESRG6Dv4Dvcvb/cjIfo1RChdl5TC5MvNXCJox6Al3Cvbwjl9gBlvRahPLAibXMxyeak0VUiag79zE79YcbyS7cfeeGxU/DTY5/8zeUcKi0GFKrKT6M+NZw5TmWTzksdxK5BLUzxcKyu90+7Lh43qH5VRTVkqL+xIELlGSYmxyQDXpzwDAcpx5OHolWC6+dJI+u0o9TL0vEVAD6vImst2ksNygtLxkG64WoSFdMJayTQutTVB0gLxIlsroTV3QvwMsnye+6v0Im9BqF2xjP+LsmHV4RjY56Pt0qIMyh9s25uXRjUw+1ruO+lAnxfXR/xiaxMjfn58ThFjNM+ejYCNkOys46t1ZwllDEV0Lsnn5pze5Qshj99t2M3pGpxa9S7XUwgXGl4jfYBnk4gal26KsxIhyupTVooCED6Io8J0ULVMWc05CgzXKjkFsAHmL7k+m+y9+TKrd00S+tnm5c0Z3MQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(346002)(136003)(39860400002)(376002)(451199021)(966005)(6916009)(4326008)(86362001)(478600001)(76116006)(316002)(66946007)(66556008)(6486002)(64756008)(54906003)(66446008)(66476007)(36756003)(2616005)(83380400001)(6506007)(1076003)(26005)(6512007)(71200400001)(8936002)(5660300002)(41300700001)(8676002)(3716004)(15650500001)(38100700002)(122000001)(2906002)(38070700005)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWRCeklJVkd4eUpoeE9odjkrSXMzV1VCTEVZd2RVOWdQcVU4L0R5ZXV1T1I1?=
 =?utf-8?B?dHNrczdSOXVkTTFaOW16Yi9PWTZrMmJscVVubEVDMGk3dUFXdUFkUHViemFY?=
 =?utf-8?B?ZVBHSy9BVXlCWE1TWng2YzF0ZTNRb1U3dVJOcXJHR3dtWE1COXZTdkV5b0V4?=
 =?utf-8?B?S3pDc3JoM2dwSjhLeHBmd2pZSnVjYWhvNzhWdFZhTmR5NGRuTE96RWhRRG0y?=
 =?utf-8?B?VUt1cSt6RWZVaTV2M1lVNWhmaVZja2tFUmIxUEdoR2tyOWhraE1KNTRVR3Fq?=
 =?utf-8?B?dldFWUFvNDFMR2xBdGFQSVgvUkJxZmhlN1hSdDl1d1JMOTN5dVF6bTN0emE1?=
 =?utf-8?B?cE94ZDUyOGpwY256Z3k0aTdQbVBOVGt5cy9BdXN0NDlFcmVYUndYYjlYUWhF?=
 =?utf-8?B?OTBLNnpZb0trUmRZYW92UkR0WmtKSHZ4cEkwelJOcGRSckIwNlFaS3BMQUFw?=
 =?utf-8?B?N1JBS3NPQkxUWG4vbnVVVFB2TVZsSWloSW1tU3dRWEREeVY0WFlGQ1VCOSt3?=
 =?utf-8?B?d28xTEo2TjZaYjkrcnYvUlFmOFN2aVZJVEpWb3ZGRnNxc3A1KzZYVEl2aGxD?=
 =?utf-8?B?eW9ZNUxkUzF2Q216aG9uZlRjNjFsZWZrVW1RMTUyU0FVOUtYb0hNOXMrd1Bv?=
 =?utf-8?B?WEtrQktjbGRZems2ZEhCZEhVcUNNZXk3RjZISVNieHVKZnl5L09RMndJc1d5?=
 =?utf-8?B?TGxKYmxoWXBvWkUyMUlXUkdZekpZQ3RnNC9oVlArWWp4RDRycTFxeGhUa3ZK?=
 =?utf-8?B?cUdqOG44eUNWcGdzVTkzY2xkTXFGWVRNSFZmT3NGWS90UVplbTZTVlZ0bjRS?=
 =?utf-8?B?MTJlMi8rVHR5SEgya0c0cS9LU3kvOHhvbmVVVFMyTld2dEh5QVJWK3VZR3Ft?=
 =?utf-8?B?cXQwR1lJZ0pYYzF2V0l2bU4xSFAySWkwMjJRNVNoMEt0SUV5QlZML3gyZExO?=
 =?utf-8?B?Wll6K3c1dXJpUVZZWGlsQTl3WGxmN0t2K1FtQzhOZGtrQTIyMGU1SXFNRXdV?=
 =?utf-8?B?ekxULzNPWkRYWGNab0R6ZThWOUxZeFJMbHB0VGo5U0orQll6ZW9LeHF5R3Zr?=
 =?utf-8?B?dmRwOTVWSjhKeGdrc29kU0p0KzNSNThDUGxsZ09Db0d0T2hoeS9qcXdzOGdi?=
 =?utf-8?B?M2JpelpKRnNyMjh3WFV5RXN6NVdCMWIvcGUvR3NFN2x3ajJpQkVEYWw5S3Qy?=
 =?utf-8?B?c2szcnJLVDRvZ0VScVFMdmlsWEhmdzIxQTU4UkZGU05laExabDJyTWhBSzhY?=
 =?utf-8?B?VFBCdG4wODlPMUtucWVna1NpdUFjKytTd0dsWlhUYmhMYmlVMmN6UmRGR3o0?=
 =?utf-8?B?bDR5dVNtQVhzbWdHY1pyY1B3QWVhN0FvNm9sQ3R1RDJkNDdudmY1QW0zeGVu?=
 =?utf-8?B?SEl4YnF1NUowSHF1d0hsQytmRnJsUEJ5M2dLK1N6bU1qSE51L2pJeTJ1THZP?=
 =?utf-8?B?TFR5OFNCb0krMEh3SzRzYUZ1dWVmOWpGdmVvL3JJWlRndG1PZVJ0WU5tUUZ0?=
 =?utf-8?B?NHRoaU5HQlFad00vSmkyRC84YmdNYlREd1hxMkNGM3FqNTZaS1R5VjMyWkdY?=
 =?utf-8?B?OFRvZnBMV0pNcmtJVUdHUW9yQWwvWU9vUzhpeXBkemorZEprZ0NkYnIyeFhG?=
 =?utf-8?B?Y2FxcUliNldXQzh3WG41U3k5MnN4MEE5bkF5c0gvL3I5QnBwdzJwUEFibkhE?=
 =?utf-8?B?NHYvNS80cDZzNjNwZVJ2WXk4eW9QOWVqTnh1bzg2UGQrYitnSkduOWJySmJV?=
 =?utf-8?B?aVNlT0twSVBoRlJMNHRwRlJWTjk2eGNLUS9TVndPeCs0ckFiOWw2L0FiK0RF?=
 =?utf-8?B?aVdWY1J6N251UzJ4V0dWY3haS3cvRVhTUTk5cC9YcUd2REdDdHlDSVV5U0Ja?=
 =?utf-8?B?QTlQejRnNXM1NHlERzlnSDJxWS9FSzlGQWlMK1dZUXJYdGlJbGZQTFJKd0Y3?=
 =?utf-8?B?eFJabUpCUEQ1eUpCaVExU2ZnVFJ6WkdFcU94d2ZGS1dqcytkaE5EODFwaVEv?=
 =?utf-8?B?RlFUM2JjQ3JLL0xyZVoxWjExbTBZSEdiYTBkYXBWdDZoSllkc0NCczZ1clpJ?=
 =?utf-8?B?WnpkUFYzNCtYOEdNMDE1VTBpSHd2R083UXlicWl3dDd2KzMzaUo4RlN4Vmdl?=
 =?utf-8?Q?6CyT6mZV7SuJrEKLrApdkeLRi?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A77ACD6B2656114E97EA769A63C9BC32@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: YUKx4EB2BJoVkn2/BClIjARI7lEqHWsI/bLHNqWuIHXF3SBioNDEssRPvYElPMiPAnxj69FB5XGBWtyIxuYdf/qlKVjZfMB80ihPV/qFKgW/+gWKvLPzghazA+46/B3z0TD9Az4FwdUvHfwNrukCtqvigkUaH2NGZMLCWOzFtbhF0jhwJvMSXAwYFxZqxDqpmIPFtLoaCtoKQMpo0Es9SR+fqqOXXBZgdITQo29yAO5vMVjWMKyDgB86X9Pn1zDs+nQCbslIbvPcpzBBObGBBOZjI70poeDhDAJXUxePVLCFCtOeLqoit5y1SGWnlqA6ZGFv5jk6J3Dj3sp3n0vCdAlM5mYqpfLLxr/j1zLu0fqVjn1OZrEC6FvQHiKvVXnSZTlpEK57TQFh/cbpqOWQf6uhRAAUhyykImTOlnc385DQMR8ixIhE+Wtj2wr004rVMVX2CN8RnyC8H6zWXzsJPblFKW60YCoTUGEyWxToFjllZFvx2xAkrli/IUAg/VUCi4YNrzdiuEIJkJBqQcUCmCwz/glfML5vnQFoxvsC/Lbg0+vspYeJkTv6XI9o/6j5zYOKwTptObWUnCJDg1cl/iFpYCcEUVM6SjzsN9lL0lNEpnLeGHjWQEiFhZDhYKdyKzAWx4osHwYgtefiud7n9Z+klxgx4IOUb6SRHug/dY4/XsQ8jOxrwTp3aa5xnzjrqQtoM87Jg3CsYk9ccMA3e0G5vddSudBnA6BpNTBusdJdzj5s9vjAfpAWEELBZD1Fw/ZSOMKiWx+H94Rni3ULHcvHxlXsWmGEFcUUM8kmH0MCJ0FMWwZiCTyBDoEtl01OyiVbWRLG8hiADEOU3Ims9ijCr7lGZkWbMxu7rfQbdc1AaiYgP/+Z8/tAP/QWCM8K
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 584b2d90-5398-4f0e-508e-08db50d58124
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 21:36:52.7672
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zIUhC6xpp41d0Urc20o7vNzaSUd0WYHbCOLoH0M3mUV3JTH7DEPO+3ll73i4B/4SAD8a/sAT27r2EG6m8EOVNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6941
X-Proofpoint-GUID: ov1t9i8v-y7k1S0Bhz95NLG4HYJU7LSi
X-Proofpoint-ORIG-GUID: ov1t9i8v-y7k1S0Bhz95NLG4HYJU7LSi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_14,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305090176
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgTGlueXUsDQoNCk9uIFR1ZSwgTWF5IDA5LCAyMDIzLCBMaW55dSBZdWFuIHdyb3RlOg0KPiBX
aGVuIHdvcmsgaW4gZ2FkZ2V0IG1vZGUsIGN1cnJlbnRseSBkcml2ZXIgZG9lc24ndCB1cGRhdGUg
c29mdHdhcmUgbGV2ZWwNCj4gbGlua19zdGF0ZSBjb3JyZWN0bHkgYXMgbGluayBzdGF0ZSBjaGFu
Z2UgZXZlbnQgaXMgbm90IGVuYWJsZWQgZm9yIG1vc3QNCj4gZGV2aWNlcywgaW4gZnVuY3Rpb24g
ZHdjM19nYWRnZXRfc3VzcGVuZF9pbnRlcnJ1cHQoKSwgaXQgd2lsbCBvbmx5IHBhc3MNCj4gc3Vz
cGVuZCBldmVudCB0byBVREMgY29yZSB3aGVuIHNvZnR3YXJlIGxldmVsIGxpbmsgc3RhdGUgY2hh
bmdlcywgc28gd2hlbg0KPiBpbnRlcnJ1cHQgZ2VuZXJhdGVkIGluIHNlcXVlbmNlcyBvZiBzdXNw
ZW5kIC0+IHJlc2V0IC0+IGNvbm5kb25lIC0+DQo+IHN1c3BlbmQsIGxpbmsgc3RhdGUgaXMgbm90
IHVwZGF0ZWQgZHVyaW5nIHJlc2V0IGFuZCBjb25uZG9uZSwgc28gc2Vjb25kDQo+IHN1c3BlbmQg
aW50ZXJydXB0IGV2ZW50IHdpbGwgbm90IHBhc3MgdG8gVURDIGNvcmUuDQo+IA0KPiBSZW1vdmUg
bGlua19zdGF0ZSBjb21wYXJlIGluIGR3YzNfZ2FkZ2V0X3N1c3BlbmRfaW50ZXJydXB0KCkgYW5k
IGFkZCBhDQo+IHN1c3BlbmRlZCBmbGFnIHRvIHJlcGxhY2UgdGhlIGNvbXBhcmUgZnVuY3Rpb24u
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMaW55dSBZdWFuIDxxdWljX2xpbnl5dWFuQHF1aWNpbmMu
Y29tPg0KPiAtLS0NCj4gDQo+IHY3OiAocmVmZXIgdjYgaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92
My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi8yMDIzMDUwNTAxNDkwMi4yNzMx
My0xLXF1aWNfbGlueXl1YW5AcXVpY2luYy5jb20vX187ISFBNEYyUjlHX3BnIWRjdVlYZTF0Wm1B
TU5kTVJWNS1RZEFTa2hGTUs1RC1XWkxXRUNQMS1HYkRYZzBYUlZqdUplSUpnYzdreV9XaXRKN29F
UEpCRVF3Y3Q1aVNtQUtNRzNJNUFKRG5jZ0EkICkNCj4gMSkgcmV3b3JkIHN1c3BlbmRlZCBmbGFn
IGNvbW1lbnQNCj4gMikgcmVtb3ZlIG9uZSBleHRyYSBzcGFjZSBpbiBpZiBvcGVyYXRpb24NCj4g
NCkgY2xlYXIgc3VzcGVuZGVkIGZsYWcgZm9yIHdha2V1cC9yZXNldC9kaXNjb25uZWN0IGludGVy
cnVwdA0KPiAzKSBjbGVhciBzdXNwZW5kZWQgZmxhZyBmb3IgcmVtb3RlIHdha2V1cCByZWxhdGVk
IGNhc2UuDQo+IA0KPiB2NjogKHJlZmVyIHY1IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19o
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC11c2IvMTY4MjQ3Njc4MC0yMzY3LTEtZ2l0LXNl
bmQtZW1haWwtcXVpY19saW55eXVhbkBxdWljaW5jLmNvbS9fXzshIUE0RjJSOUdfcGchZGN1WVhl
MXRabUFNTmRNUlY1LVFkQVNraEZNSzVELVdaTFdFQ1AxLUdiRFhnMFhSVmp1SmVJSmdjN2t5X1dp
dEo3b0VQSkJFUXdjdDVpU21BS01HM0k1VGZ3aEN0ZyQgKQ0KPiAxKSBjaGFuZ2Ugc3ViamVjdA0K
PiAyKSBvbmx5IGtlZXAgc3VzcGVuZGVkIGZsYWcgcmVsYXRlZCBjaGFuZ2UNCj4gDQo+IHY1OiAo
cmVmZXIgdjQgaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LXVzYi8xNjgyMzkzMjU2LTE1NTcyLTEtZ2l0LXNlbmQtZW1haWwtcXVpY19saW55
eXVhbkBxdWljaW5jLmNvbS9fXzshIUE0RjJSOUdfcGchZGN1WVhlMXRabUFNTmRNUlY1LVFkQVNr
aEZNSzVELVdaTFdFQ1AxLUdiRFhnMFhSVmp1SmVJSmdjN2t5X1dpdEo3b0VQSkJFUXdjdDVpU21B
S01HM0k0aW15ZUotdyQgKQ0KPiAxKSByZW5hbWUgc3VzcGVuZF9pcnFfaGFwcGVuIHRvIHN1c3Bl
bmRlZCBhbmQgZG9jdW1lbnQgaXQNCj4gMikgYWRkIG9sZF9saW5rX3N0YXRlIGZvciBsaW5rIGNo
YW5nZSBpbnRlcnJ1cHQgdXNhZ2UgYW5kIGNoYW5nZSBhY2NvcmRpbmdseQ0KPiANCj4gdjQ6IChy
ZWZlciB2MyBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtdXNiLzE2ODIwNTM4NjEtMjE3MzctMS1naXQtc2VuZC1lbWFpbC1xdWljX2xpbnl5
dWFuQHF1aWNpbmMuY29tL19fOyEhQTRGMlI5R19wZyFkY3VZWGUxdFptQU1OZE1SVjUtUWRBU2to
Rk1LNUQtV1pMV0VDUDEtR2JEWGcwWFJWanVKZUlKZ2M3a3lfV2l0SjdvRVBKQkVRd2N0NWlTbUFL
TUczSTUwUnBzRW1BJCApDQo+IDEpIHJlbW92ZSBsaW5rIHN0YXRlIGNoZWNraW5nIGluIGR3YzNf
Z2FkZ2V0X3dha2V1cF9pbnRlcnJ1cHQoKQ0KPiAyKSByZW1vdmUgdHdvIHN3aXRjaC9jYXNlIHRv
IGlmIG9wZWFydGlvbg0KPiANCj4gdjM6IChyZWZlciB2MiBodHRwczovL3VybGRlZmVuc2UuY29t
L3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNiLzE2ODIwNDI0NzItMjEyMjIt
MS1naXQtc2VuZC1lbWFpbC1xdWljX2xpbnl5dWFuQHF1aWNpbmMuY29tL19fOyEhQTRGMlI5R19w
ZyFkY3VZWGUxdFptQU1OZE1SVjUtUWRBU2toRk1LNUQtV1pMV0VDUDEtR2JEWGcwWFJWanVKZUlK
Z2M3a3lfV2l0SjdvRVBKQkVRd2N0NWlTbUFLTUczSTdnSkVsNmdRJCApDQo+IG5vIGNvZGUgY2hh
bmdlIHNpbmNlIHYyLCBjaGFuZ2VzIGNvbXBhcmUgdjEgYXMgYmVsb3csDQo+IDEpIGFkZCBhIGZs
YWcgc3VzcGVuZF9pcnFfaGFwcGVuIHRvIHNpbXBsaWZ5IGR3YzNfZ2FkZ2V0X3N1c3BlbmRfaW50
ZXJydXB0KCksDQo+ICAgIGl0IHdpbGwgYXZvaWQgcmVmZXIgdG8gc29mdHdhcmUgbGV2ZWwgbGlu
a19zdGF0ZSwgZmluYWxseSBsaW5rX3N0YXRlIHdpbGwNCj4gICAgb25seSB1c2VkIGluIGR3YzNf
Z2FkZ2V0X2xpbmtzdHNfY2hhbmdlX2ludGVycnVwdCgpLg0KPiAyKSByZW1vdmUgc3cgc2V0dGlu
ZyBvZiBsaW5rX3N0YXRlIGluIGR3YzNfZ2FkZ2V0X2Z1bmNfd2FrZXVwKCkNCj4gMykgYWRkIGR3
YzNfZ2FkZ2V0X2ludGVycnVwdF9lYXJseSgpIHRvIGNvcnJlY3Qgc2V0dGluZyBvZiBsaW5rX3N0
YXRlDQo+ICAgIGFuZCBzdXNwZW5kX2lycV9oYXBwZW4uDQo+IA0KPiB2MjogdXBkYXRlIGFjY29y
ZGluZyB2MSBkaXNjdXNzaW9uDQo+IHYxOiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNiLzE2NzUyMjEyODYtMjM4MzMtMS1naXQtc2Vu
ZC1lbWFpbC1xdWljX2xpbnl5dWFuQHF1aWNpbmMuY29tL19fOyEhQTRGMlI5R19wZyFkY3VZWGUx
dFptQU1OZE1SVjUtUWRBU2toRk1LNUQtV1pMV0VDUDEtR2JEWGcwWFJWanVKZUlKZ2M3a3lfV2l0
SjdvRVBKQkVRd2N0NWlTbUFLTUczSTdHS3RqZUZRJCANCj4gDQo+ICBkcml2ZXJzL3VzYi9kd2Mz
L2NvcmUuaCAgIHwgIDIgKysNCj4gIGRyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgfCAxMSArKysr
KysrKysrLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmggYi9kcml2ZXJz
L3VzYi9kd2MzL2NvcmUuaA0KPiBpbmRleCBkNTY0NTdjMDI5OTYuLjFmMDQzYzMxYTA5NiAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gKysrIGIvZHJpdmVycy91c2Iv
ZHdjMy9jb3JlLmgNCj4gQEAgLTExMTYsNiArMTExNiw3IEBAIHN0cnVjdCBkd2MzX3NjcmF0Y2hw
YWRfYXJyYXkgew0KPiAgICogQGRpc19tZXRhc3RhYmlsaXR5X3F1aXJrOiBzZXQgdG8gZGlzYWJs
ZSBtZXRhc3RhYmlsaXR5IHF1aXJrLg0KPiAgICogQGRpc19zcGxpdF9xdWlyazogc2V0IHRvIGRp
c2FibGUgc3BsaXQgYm91bmRhcnkuDQo+ICAgKiBAd2FrZXVwX2NvbmZpZ3VyZWQ6IHNldCBpZiB0
aGUgZGV2aWNlIGlzIGNvbmZpZ3VyZWQgZm9yIHJlbW90ZSB3YWtldXAuDQo+ICsgKiBAc3VzcGVu
ZGVkOiBzZXQgdG8gdHJhY2sgc3VzcGVuZCBldmVudCBkdWUgdG8gVTMvTDIuDQo+ICAgKiBAaW1v
ZF9pbnRlcnZhbDogc2V0IHRoZSBpbnRlcnJ1cHQgbW9kZXJhdGlvbiBpbnRlcnZhbCBpbiAyNTBu
cw0KPiAgICoJCQlpbmNyZW1lbnRzIG9yIDAgdG8gZGlzYWJsZS4NCj4gICAqIEBtYXhfY2ZnX2Vw
czogY3VycmVudCBtYXggbnVtYmVyIG9mIElOIGVwcyB1c2VkIGFjcm9zcyBhbGwgVVNCIGNvbmZp
Z3MuDQo+IEBAIC0xMzMyLDYgKzEzMzMsNyBAQCBzdHJ1Y3QgZHdjMyB7DQo+ICAJdW5zaWduZWQJ
CWRpc19zcGxpdF9xdWlyazoxOw0KPiAgCXVuc2lnbmVkCQlhc3luY19jYWxsYmFja3M6MTsNCj4g
IAl1bnNpZ25lZAkJd2FrZXVwX2NvbmZpZ3VyZWQ6MTsNCj4gKwl1bnNpZ25lZAkJc3VzcGVuZGVk
OjE7DQo+ICANCj4gIAl1MTYJCQlpbW9kX2ludGVydmFsOw0KPiAgDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiBp
bmRleCBjMGNhNGQxMmY5NWQuLmIyY2U5NjcxNmQwNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91
c2IvZHdjMy9nYWRnZXQuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+IEBA
IC0yNDQwLDYgKzI0NDAsNyBAQCBzdGF0aWMgaW50IGR3YzNfZ2FkZ2V0X2Z1bmNfd2FrZXVwKHN0
cnVjdCB1c2JfZ2FkZ2V0ICpnLCBpbnQgaW50Zl9pZCkNCj4gIAkJCXJldHVybiAtRUlOVkFMOw0K
PiAgCQl9DQo+ICAJCWR3YzNfcmVzdW1lX2dhZGdldChkd2MpOw0KPiArCQlkd2MtPnN1c3BlbmRl
ZCA9IGZhbHNlOw0KPiAgCQlkd2MtPmxpbmtfc3RhdGUgPSBEV0MzX0xJTktfU1RBVEVfVTA7DQo+
ICAJfQ0KPiAgDQo+IEBAIC00Mjc3LDYgKzQyNzgsNyBAQCBzdGF0aWMgdm9pZCBkd2MzX2dhZGdl
dF9saW5rc3RzX2NoYW5nZV9pbnRlcnJ1cHQoc3RydWN0IGR3YzMgKmR3YywNCj4gIAkJaWYgKGR3
Yy0+Z2FkZ2V0LT53YWtldXBfYXJtZWQpIHsNCj4gIAkJCWR3YzNfZ2FkZ2V0X2VuYWJsZV9saW5r
c3RzX2V2dHMoZHdjLCBmYWxzZSk7DQo+ICAJCQlkd2MzX3Jlc3VtZV9nYWRnZXQoZHdjKTsNCj4g
KwkJCWR3Yy0+c3VzcGVuZGVkID0gZmFsc2U7DQo+ICAJCX0NCj4gIAkJYnJlYWs7DQo+ICAJY2Fz
ZSBEV0MzX0xJTktfU1RBVEVfVTE6DQo+IEBAIC00MzAzLDggKzQzMDUsMTAgQEAgc3RhdGljIHZv
aWQgZHdjM19nYWRnZXRfc3VzcGVuZF9pbnRlcnJ1cHQoc3RydWN0IGR3YzMgKmR3YywNCj4gIHsN
Cj4gIAllbnVtIGR3YzNfbGlua19zdGF0ZSBuZXh0ID0gZXZ0aW5mbyAmIERXQzNfTElOS19TVEFU
RV9NQVNLOw0KPiAgDQo+IC0JaWYgKGR3Yy0+bGlua19zdGF0ZSAhPSBuZXh0ICYmIG5leHQgPT0g
RFdDM19MSU5LX1NUQVRFX1UzKQ0KPiArCWlmICghZHdjLT5zdXNwZW5kZWQgJiYgbmV4dCA9PSBE
V0MzX0xJTktfU1RBVEVfVTMpIHsNCj4gKwkJZHdjLT5zdXNwZW5kZWQgPSB0cnVlOw0KPiAgCQlk
d2MzX3N1c3BlbmRfZ2FkZ2V0KGR3Yyk7DQo+ICsJfQ0KPiAgDQo+ICAJZHdjLT5saW5rX3N0YXRl
ID0gbmV4dDsNCj4gIH0NCj4gQEAgLTQzMTIsNiArNDMxNiwxMSBAQCBzdGF0aWMgdm9pZCBkd2Mz
X2dhZGdldF9zdXNwZW5kX2ludGVycnVwdChzdHJ1Y3QgZHdjMyAqZHdjLA0KPiAgc3RhdGljIHZv
aWQgZHdjM19nYWRnZXRfaW50ZXJydXB0KHN0cnVjdCBkd2MzICpkd2MsDQo+ICAJCWNvbnN0IHN0
cnVjdCBkd2MzX2V2ZW50X2RldnQgKmV2ZW50KQ0KPiAgew0KPiArCWlmIChldmVudC0+dHlwZSA9
PSBEV0MzX0RFVklDRV9FVkVOVF9ESVNDT05ORUNUIHx8DQo+ICsJICAgIGV2ZW50LT50eXBlID09
IERXQzNfREVWSUNFX0VWRU5UX1JFU0VUIHx8DQo+ICsJICAgIGV2ZW50LT50eXBlID09IERXQzNf
REVWSUNFX0VWRU5UX1dBS0VVUCkNCj4gKwkJZHdjLT5zdXNwZW5kZWQgPSBmYWxzZTsNCj4gKw0K
DQpDYW4gd2UgdXBkYXRlIHRoaXMgZnJvbSB0aGUgcmVzcGVjdGl2ZSBldmVudCBoYW5kbGVyIGZ1
bmN0aW9uPw0KVGhlIHJlc3QgbG9va3MgZ29vZCB0byBtZS4NCg0KVGhhbmtzIQ0KVGhpbmgNCg0K
PiAgCXN3aXRjaCAoZXZlbnQtPnR5cGUpIHsNCj4gIAljYXNlIERXQzNfREVWSUNFX0VWRU5UX0RJ
U0NPTk5FQ1Q6DQo+ICAJCWR3YzNfZ2FkZ2V0X2Rpc2Nvbm5lY3RfaW50ZXJydXB0KGR3Yyk7DQo+
IC0tIA0KPiAyLjE3LjENCj4g
