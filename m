Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0007F66378F
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jan 2023 03:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbjAJC5k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Jan 2023 21:57:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbjAJC5i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Jan 2023 21:57:38 -0500
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 694B21010
        for <linux-usb@vger.kernel.org>; Mon,  9 Jan 2023 18:57:37 -0800 (PST)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 309L2jSV025613;
        Mon, 9 Jan 2023 18:57:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=V9X4ujN4GN7guC2yUTakLjjKOHDGoDPA8M+kCL/toIg=;
 b=hEN0JipnHOuJ7pTSIidBqfhvPbhE7WTEmfuOBz3E78p6/W/KDCp5OatZ72C6V3XD/8GC
 XBWHkGtI5sOkb/AVsvKlnk0eEdiTq+p7sQy7NhhQVvg16R/Oj4bYkv7zOVyedo0whqUP
 I69V8/0iJOpj9P8s5sueh+nxxTi+kr6CHd6BzpPK24nqOvnsIlSGtE7CFk+pbKWSRF/R
 Hhyp1RVhy4tHPGY9dm7Ryr3Oj4V39j606Qsxs0nAHER8qorxSMfx/SxkWSlUpNaweH4I
 XS2hGHUQxLOic1SCLdpVnR2eWOd+vZ8dHv4UVvpn/9+O3pLI81eNUqW+Rm2vifS12HgS FA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3my88nb881-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Jan 2023 18:57:33 -0800
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9D5D7C0906;
        Tue, 10 Jan 2023 02:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1673319452; bh=V9X4ujN4GN7guC2yUTakLjjKOHDGoDPA8M+kCL/toIg=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=LWBBvWYrXbxrHRtELbML+EKv47tM4y67+O9bqTKyrJNA+7rE5jShECPBj76XNQzPZ
         QVZQFmYt2FF+jkqbK4Bk8V5/os/uXexvRLCP4uf79DoDD1fdf1vLv0glGs6MtMNRun
         NrWPukMsorm19nMTqddity2noXH/jJ9bJhU9Pchu61iwMVcGvT5cFycUO85L4/n6tJ
         IF9xOJ1ynebUdF4oilBalMvzcMGI1UooJRu0hSARp3mkSUAGELPDd5uM+NVztNQMdR
         aNqQ3loMyNFYA4XN4DBb1FGsgGe7iWk3Rtip5+/nhWZrj5nehNsyGsfVFq0KnlD/78
         m83Cmgf08POxA==
Received: from o365relay-in.synopsys.com (unknown [10.4.161.141])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id C3640A0081;
        Tue, 10 Jan 2023 02:57:30 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id DF3B980169;
        Tue, 10 Jan 2023 02:57:29 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="KK/iPIBN";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=an0SXZCULJUCa6RY2Q8WO6BCPEpuvbEGrkVCKk1QPTTWdmWaMzJN0jtUyC+KcuWmoyu1rNcmexWjnHSj9j3Lyk1fXQV1LOq4em0YU1LmrvNAwH+M8oUFtYrfb1kok2kb+CZ5spQhm772npgEiyBqi4AKcwl9WWaaZjnpGOc0FRksA4dveSU9cKAYoisMwnt5Gd94GJhLtZKNb+o4R169urv3nAJc7zX2slN99uYNM9zPZ5UD/ZRf/ghSHnXqo92O7ivwnuLnY/EvVlbW0RpcvJCQl9Odp2/igeuGeKUj190gah1eeds73MQYp0LwsUYPPGp2uijo1twKXlo5L2Mr2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9X4ujN4GN7guC2yUTakLjjKOHDGoDPA8M+kCL/toIg=;
 b=CgI2XauqXVzHFf2OxZR3dknrDJ1cs4xai/sKGBeaihpuP73k5Eihd6TsbvZhOGZGLHppgoyhF7ZzvWMqtU/Y/z7TrohOOft/198mF4kvKGXvfZGLALVxGwMRQw9alkd5TF+mmsPZ7fMZajLeUtB5b+zP9o62pThLC8bquPC5Y1E1sLF1nLwgkPwAuGX3fpTMmCcSCiJ2QYq+D+4f+nJL6ZyNr9mPxSeGVuUHyyrSvWbkN0Tl4cSzCNcSRLBMOD+un3Sh1Q4jCsx5qadxNG/FNbcRAyJ1pI0BLmruyjyzdkh90rzZcWrR2a+aD3pzOE34mcR4wgL8EfXashGlikjxbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9X4ujN4GN7guC2yUTakLjjKOHDGoDPA8M+kCL/toIg=;
 b=KK/iPIBNxkBBwrDeRjFU7u8EQVnt9n76vh+e2+1cgquDjHBfn5RS+DRE6/w72GHkXKftib6nQBBrwAl/aBUiBmJtzeIealHpRElOvwMx+ke2gacp+dIykfxfPF/3UMqdTGLlF4UoVMtbXPJh1PcHXrIjFRQxSrLAplUnvwZj6RQ=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BL1PR12MB5922.namprd12.prod.outlook.com (2603:10b6:208:399::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 02:57:26 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::e395:902b:2e90:b7ee]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::e395:902b:2e90:b7ee%4]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 02:57:26 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH 3/3] usb: dwc3: remove base parameter of event class
 dwc3_log_io
Thread-Topic: [PATCH 3/3] usb: dwc3: remove base parameter of event class
 dwc3_log_io
Thread-Index: AQHZIbBQGoRC7VXStUqZBfaDuyBSN66Wch+AgACARgCAAAiygA==
Date:   Tue, 10 Jan 2023 02:57:26 +0000
Message-ID: <20230110025711.ei6c3nftujf46czv@synopsys.com>
References: <1672996895-22762-1-git-send-email-quic_linyyuan@quicinc.com>
 <1672996895-22762-3-git-send-email-quic_linyyuan@quicinc.com>
 <20230109184657.kgvp7pq54hnzvaet@synopsys.com>
 <6cb3be51-b1af-89a5-dc19-b4a9d03eb8d3@quicinc.com>
In-Reply-To: <6cb3be51-b1af-89a5-dc19-b4a9d03eb8d3@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|BL1PR12MB5922:EE_
x-ms-office365-filtering-correlation-id: d9ee108b-39f2-42bc-2222-08daf2b667b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZnvbpitZcLH5fy9E9xU6iD4W1umieRKtMbOsFq1oSFAGWifVqpTK8wbdp+nn0omnYHf7u8VLj2nrOiFzg78JhHILiwYA4TQSvBlvWRNiVQKtxaWaJJzgdKVTJD5LdP9xBbAVDrI2RnzS3iJ5j3p3v/NG3LmBolxXMD79Y37cXWOCjKhG/HHu8roNLaKEYAS45jqU4ZkHTzhF7tWj5QS3IP4VG4EpDwAbZVgZxfbVaqNN9sDZGmH7TxE2H4Z5761I0Ww4M7XgC2oiFkXVCPab3rI+PMWiuwcLhutDaot633w5j3U1H45XCIA2l6fBvfwbfxe4Ge2BKLd08TH2hR5t95jIy43IoDjr21xgQ90gkZXj5Mo8SV+46tGchK9UDkCMV4E0Y18ZP+e98P6TFVEKDlbalCk1Ta57FTwHp95LEoWlcdBiHJ9PRurqxTQ/F4ziIrmdByCca1Heg0CjSywz05FCLKdzKJv8ueKGam8wKzCHR4at4dw9s5NKA9qVBdJ2Qyc8VwwxKQueH6Bs0rMJgvyE6fbG4TNdIEpGwYpsdjIvaO6eqb8Hz9UXGFWcGHvyB1xwFmKruj+2UZQpdY4ztQ2duFeSuydUe769W5cB1S/S4gcE0SmOffrGRfDekR184GGtKJ4U8xjD+Ox4MuYkkCyRBdDCaoSDC4sfFErGvhTC+tUKayTF17QD7tyBalxq+hIUkcerq6Dc0LnSIPDCeQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199015)(8936002)(2906002)(5660300002)(41300700001)(71200400001)(38070700005)(66446008)(4326008)(76116006)(6916009)(8676002)(64756008)(66556008)(316002)(66946007)(66476007)(54906003)(26005)(6512007)(1076003)(122000001)(2616005)(38100700002)(86362001)(186003)(83380400001)(36756003)(478600001)(6506007)(6486002)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFB6bVZoaVhaZmVYV1Y2TkFad2wxK1RmRDNjdkhLeEhXVW5Hdi9rWlAwLzl5?=
 =?utf-8?B?Mnh3QTRWd1ZnbFNKdmh2VzZiUVpPR1N4ZjVJdExHenlpNEVmMUVhV3pVOGNw?=
 =?utf-8?B?bU4rM0wyVGh3RHQzdWx6TTVLcEl2R3BmWm9jR3BCYjBHWmp5VEtDNmpCUk5F?=
 =?utf-8?B?Sitwd1ZWNzljRXYwN2tvK1pNcUJ5bTI1Yzc1YlB3SDhxc1FhQzZtbzRMU29o?=
 =?utf-8?B?UnE2eWpTSnBhQlR0VndzSlg2WVFhRWYwRjZLSHI1YVFuNFFrNHZKNTBNdUlU?=
 =?utf-8?B?eHZJaXRlZXp6enF6MC8wMUkzNHVzRGJ3NEpoQktxdnUzenFPZUJmc2FZTU1z?=
 =?utf-8?B?TjMvbUh4M2UrWFJ2bnVuazhGNkZzZzM3NkRVM05DZHJhK1grL2xCWndER2tE?=
 =?utf-8?B?RHgwSEZ0SUxMV1BWY2ExYi9oNndKVkdiMTBCZjBZYWp2Vjh3WHo3dnk1c25r?=
 =?utf-8?B?MldVdzMvdWpKb3E0dHFmdVIrNWg4TFRWblZnQlNVYmY5cTZUYkxXUW1EN1Zo?=
 =?utf-8?B?YVR4T3BLYm5JNlp4anEyTUFXb3JEYi80MGt3bEl6R20vVEpzMlhNY3NNUEJa?=
 =?utf-8?B?SnoxTjF4aXhzaEl5N0o2dGJ6WDFMOEIzUHNQazVPQUlsWjRmcGNsZ05kaUF4?=
 =?utf-8?B?NVlNNGM0ek5UUktuN2lKN0tUWEZjZFBUTFQ2MWdqTFI4d3d2MDVXeHQrVkZL?=
 =?utf-8?B?S3RZbzRpblBybkpRVnZJQVpMQzNVYk9QL0lna05ENlNkeUdpaXorTjhaYnpR?=
 =?utf-8?B?NkZ0TllhUVg5b3NOV3JYb0xabG0yMFZ1TTJGQmVkR3dVUW5DSTJpUENKNldQ?=
 =?utf-8?B?VEFKVnF2VlJVS2VXQnQ0cFhDMyt2bWhWbGNQam5YcTZFWnpReGVaeVh2NzJH?=
 =?utf-8?B?VkRFS01LOXlmL2d4RW1uY3Bna3hjTUxRN1ZqTUN4Z3VRK1RUbGFsY0lOZjVk?=
 =?utf-8?B?MmlXeWNJNnI2WnV6NHVmTjh5ZU9YREVYZUVNNi9lQURkdy9xbklhLzNWRWY2?=
 =?utf-8?B?ZG9PT0dreWtUZjF6dzFUeG1aM2lTUHF6MjZCelh2WWdPaUhLWjQxQi9RL2ZK?=
 =?utf-8?B?V3h0ZTJKcUVXR2g5Q0VJWkRHM0dIM09TSjAvWFJnL0tWQUVaVk5tckRxTjMr?=
 =?utf-8?B?Qk5iMlViN2huUjR0QXJOTjBybjdWSXhvTmhCQW83ZHhKUEVmVTBEMjdmVVpV?=
 =?utf-8?B?MXRCakFHUGdRQmQ5N0Z3T3lOcDU4MzJwbTN1a1YvWXFFdHlXdXFTOFBrZHFP?=
 =?utf-8?B?ckRiTUJCbkJWSXNieFJIUG4wNU1MN1FORG5heVRESyttb2dORjRua2hKZnVn?=
 =?utf-8?B?aEpvRnQrcEMrWUQ2ZkVxay9ocUZvNG5JVVI3ZkhydU9YM09PeU1ER1I5L2lO?=
 =?utf-8?B?V1BCVGgreDRSQ3IyMXFNUEVqZVZiYTR1dUVHK2dSZDM0VENRN1ZpVWdXcjlr?=
 =?utf-8?B?WkpsSTQyaE5mUnplRGoyWDdyZEwyaGFJWGJRd2JKRzBXclgvaFNDRkZjb0M2?=
 =?utf-8?B?bkVXemdVa2RQWWFBcCs4ckFmSDE4NU9TdnZ6ZFZoWlhGTTl3ZWFZMnlEYURI?=
 =?utf-8?B?WnhtUW05Y3ArZkhJVHE4Z1Jrd1E2cm9wOFBiRkdYSzhGVDNobTBON080QnlP?=
 =?utf-8?B?WFF4TDNUVzFlWnpLakgyRGJOTXBwNW9WK09hamQvd3dmYUVIUVc5VnkrbWJL?=
 =?utf-8?B?d3oxemYyTGpJZklQOG5WSFdBMXFWRnIrTUMvcVZZbm1pWUcvVGRCQnVOU2Fy?=
 =?utf-8?B?bzU0OUlISkMxTjF0U1JtMGVkcjEvS2VOQlE3TjBWQ2VvMXJ0bW1IM0dVWUJQ?=
 =?utf-8?B?dXE5ZlhFZGZ3MTd5b2FCVGVKekNJcEdlb2s2N1k4ZVJyWUUreVFRZ3V1TGVU?=
 =?utf-8?B?K0RERVQyeE5Sb1d4Qk5WNVFLYUh3b3BLek5oL1JoYzl3Qjhab3pETE45NG9i?=
 =?utf-8?B?ZXRvMFdMMEV2bWIvUkhOK051OTZNUTF6L1Z3aUxDeGF3b2VJTUcyZGkxb0Y0?=
 =?utf-8?B?SVFkNGh6Nm1FZmt0L1h3dWFLZjVqMlN2STJsQmQzL3I1K3RvOUVNTi9KK0JJ?=
 =?utf-8?B?eFM1d2NFeVNTMUxMN0c0TzZiRFJNVmx1UmlFR2MyR0xNdTZOY01VZ3IzOGhP?=
 =?utf-8?B?OEJqR2cwMHpRdFpWajUrUGRRWVhIU2ZicUxDejlwc2xBbFRNWVA3ais3QTUv?=
 =?utf-8?B?OHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FBF72C880A9EE847BDD925C4C049B461@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: JPRerXkdR9A31F4QDRRmxJHXuGCmFxHXiBoZglxALet967eIcyTWmXKk+qmPQ5RIg6Ewo5gREvtRPZt3SP7ug5LmOj/TfWnz3l0M72xabQrHdIHYrfJgdmyhg6+pR/MogrVlPQaJwdtXTncZ7jXoTJwMpnfMYZNaaHRXfHl4G6tQP/hZgxJCOBx17LYob+X07MMDJfudaqIbpPlJ79MA2fWPFrFTeVw+nprsijrzKT8+eYka2PtjTGIyAdaBrdCD5gTQHjKFvJkbnjfWhayWTzQ4sxOQaMM62vrBrw3LOdSItYwRWlGXUzb74I5v2PeyWZ2182HvITBMYmhdB/lSgCbEanEDEQEkBv612GJ8lwY9PVUe8zOWyH5bcdBFS3+YX1Ubp7VKoZZbxPN2yuzaJ48jLD0PGFTxSh8sKogfrzFX67Hbl5XeEmniieoJtQ4FygVnjJcqvoV9SzAS/E3njuKCKfD7JRmVwL5JzbjCtZWVZkp6MU6EOZX5TotEg9yUxl5aJ/m3JQSbbNPw/qgm6DgGdoOws5Ja2I4SqrbVKz/LMskKCIOU6g8c5xm9iAXkf1Ge6JzCU0kh1L+3hWNv9SN41SpLwZJhp1el3qQhB9NvXmGVkb31Q0iy/eTUub4VwRDi0b7dGinm7J29PBKwTH93lL7OFTNXkurf/NYFLsAQxjaU6YBESHK8d01eZlbF6SSbEtuAlVUpj7nxHPqtse57baCfqWdManPrXYX6tAM6wyuNHgzn7sTIzEqomy1xeVh9PNY7xgLUHhGeZgiFMF4zKW0OCRdxHx0YnQO4cnZ6yfRHI642yRZXJ3VfADLGwgzqeD8LWI8sG1upcooXGBxeajcw8+A4x9nEzjhL5+JeBk93FduA0cep/bENkXC6uB+IgJeP8vFa/ATLFC3tJw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ee108b-39f2-42bc-2222-08daf2b667b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2023 02:57:26.4280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i18lacCmaJpziZDMGK0Hj7zEkrb+OWe1PaM75JbY44+xincHIsmIQCEbrbWG57iUDsLsgDLGfuE0jR+5ryymqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5922
X-Proofpoint-ORIG-GUID: MX6Ds64mnSrral_UoAyetyRAJKFeDUK-
X-Proofpoint-GUID: MX6Ds64mnSrral_UoAyetyRAJKFeDUK-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_16,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301100017
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVHVlLCBKYW4gMTAsIDIwMjMsIExpbnl1IFl1YW4gd3JvdGU6DQo+IA0KPiBPbiAxLzEwLzIw
MjMgMjo0NyBBTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IE9uIEZyaSwgSmFuIDA2LCAyMDIz
LCBMaW55dSBZdWFuIHdyb3RlOg0KPiA+ID4gd2hlbiB0cmFjZSByZWdpc3RlciByZWFkL3dyaXRl
IG9wZXJhdGlvbiwgaXQgaXMgbm90IG5lY2Vzc2FyeSB0byBzaG93DQo+ID4gPiB2aXJ0dWFsIGFk
ZHJlc3MgY2FjYXVsYXRlIGZyb20gYmFzZSBhbmQgb2Zmc2V0Lg0KPiA+ID4gDQo+ID4gPiByZW1v
dmUgdGhlIGJhc2UgcmVnaXN0ZXIgdmFsdWUsIGl0IHdpbGwgc2F2ZSB0cmFjZSBidWZmZXIuDQo+
ID4gPiBpdCBpcyBlbm91Z2ggb25seSBzYXZlIGFuZCBzaG93IHRoZSBvZmZzZXQuDQo+ID4gPiAN
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IExpbnl1IFl1YW4gPHF1aWNfbGlueXl1YW5AcXVpY2luYy5j
b20+DQo+ID4gPiAtLS0NCj4gPiA+ICAgZHJpdmVycy91c2IvZHdjMy9pby5oICAgIHwgIDQgKyst
LQ0KPiA+ID4gICBkcml2ZXJzL3VzYi9kd2MzL3RyYWNlLmggfCAxNyArKysrKysrLS0tLS0tLS0t
LQ0KPiA+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25z
KC0pDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2lvLmggYi9k
cml2ZXJzL3VzYi9kd2MzL2lvLmgNCj4gPiA+IGluZGV4IGQyNDUxM2UuLmZjYjU3MjYgMTAwNjQ0
DQo+ID4gPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2lvLmgNCj4gPiA+ICsrKyBiL2RyaXZlcnMv
dXNiL2R3YzMvaW8uaA0KPiA+ID4gQEAgLTMyLDcgKzMyLDcgQEAgc3RhdGljIGlubGluZSB1MzIg
ZHdjM19yZWFkbCh2b2lkIF9faW9tZW0gKmJhc2UsIHUzMiBvZmZzZXQpDQo+ID4gPiAgIAkgKiBk
b2N1bWVudGF0aW9uLCBzbyB3ZSByZXZlcnQgaXQgYmFjayB0byB0aGUgcHJvcGVyIGFkZHJlc3Nl
cywgdGhlDQo+ID4gPiAgIAkgKiBzYW1lIHdheSB0aGV5IGFyZSBkZXNjcmliZWQgb24gU05QUyBk
b2N1bWVudGF0aW9uDQo+ID4gPiAgIAkgKi8NCj4gPiA+IC0JdHJhY2VfZHdjM19yZWFkbChiYXNl
LCBvZmZzZXQsIHZhbHVlKTsNCj4gPiA+ICsJdHJhY2VfZHdjM19yZWFkbChvZmZzZXQsIHZhbHVl
KTsNCj4gPiA+ICAgCXJldHVybiB2YWx1ZTsNCj4gPiA+ICAgfQ0KPiA+ID4gQEAgLTYxLDcgKzYx
LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIGR3YzNfd3JpdGVsKHZvaWQgX19pb21lbSAqYmFzZSwg
dTMyIG9mZnNldCwgdTMyIHZhbHVlKQ0KPiA+ID4gICAJICogZG9jdW1lbnRhdGlvbiwgc28gd2Ug
cmV2ZXJ0IGl0IGJhY2sgdG8gdGhlIHByb3BlciBhZGRyZXNzZXMsIHRoZQ0KPiA+ID4gICAJICog
c2FtZSB3YXkgdGhleSBhcmUgZGVzY3JpYmVkIG9uIFNOUFMgZG9jdW1lbnRhdGlvbg0KPiA+ID4g
ICAJICovDQo+ID4gPiAtCXRyYWNlX2R3YzNfd3JpdGVsKGJhc2UsIG9mZnNldCwgdmFsdWUpOw0K
PiA+ID4gKwl0cmFjZV9kd2MzX3dyaXRlbChvZmZzZXQsIHZhbHVlKTsNCj4gPiA+ICAgfQ0KPiA+
ID4gICAjZW5kaWYgLyogX19EUklWRVJTX1VTQl9EV0MzX0lPX0ggKi8NCj4gPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3VzYi9kd2MzL3RyYWNlLmggYi9kcml2ZXJzL3VzYi9kd2MzL3RyYWNlLmgN
Cj4gPiA+IGluZGV4IDE5NzVhZWMuLjUzNmI5YTEgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJz
L3VzYi9kd2MzL3RyYWNlLmgNCj4gPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvdHJhY2UuaA0K
PiA+ID4gQEAgLTIwLDMyICsyMCwyOSBAQA0KPiA+ID4gICAjaW5jbHVkZSAiZGVidWcuaCINCj4g
PiA+ICAgREVDTEFSRV9FVkVOVF9DTEFTUyhkd2MzX2xvZ19pbywNCj4gPiA+IC0JVFBfUFJPVE8o
dm9pZCAqYmFzZSwgdTMyIG9mZnNldCwgdTMyIHZhbHVlKSwNCj4gPiA+IC0JVFBfQVJHUyhiYXNl
LCBvZmZzZXQsIHZhbHVlKSwNCj4gPiA+ICsJVFBfUFJPVE8odTMyIG9mZnNldCwgdTMyIHZhbHVl
KSwNCj4gPiA+ICsJVFBfQVJHUyhvZmZzZXQsIHZhbHVlKSwNCj4gPiA+ICAgCVRQX1NUUlVDVF9f
ZW50cnkoDQo+ID4gPiAtCQlfX2ZpZWxkKHZvaWQgKiwgYmFzZSkNCj4gPiA+ICAgCQlfX2ZpZWxk
KHUzMiwgb2Zmc2V0KQ0KPiA+ID4gICAJCV9fZmllbGQodTMyLCB2YWx1ZSkNCj4gPiA+ICAgCSks
DQo+ID4gPiAgIAlUUF9mYXN0X2Fzc2lnbigNCj4gPiA+IC0JCV9fZW50cnktPmJhc2UgPSBiYXNl
Ow0KPiA+ID4gICAJCV9fZW50cnktPm9mZnNldCA9IG9mZnNldDsNCj4gPiA+ICAgCQlfX2VudHJ5
LT52YWx1ZSA9IHZhbHVlOw0KPiA+ID4gICAJKSwNCj4gPiA+IC0JVFBfcHJpbnRrKCJhZGRyICVw
IG9mZnNldCAlMDR4IHZhbHVlICUwOHgiLA0KPiA+ID4gLQkJX19lbnRyeS0+YmFzZSArIF9fZW50
cnktPm9mZnNldCwNCj4gPiBQbGVhc2UgZG9uJ3QgcmVtb3ZlIHRoaXMuIFNvbWV0aW1lIHdlIG5l
ZWQgdG8gY2hlY2sgdGhlIGJhc2UgYWRkcmVzcyBmb3INCj4gPiBkaWZmZXJlbnQgcmVnaXN0ZXIg
b2Zmc2V0LiBDdXJyZW50bHkgc29tZSBvZmZzZXRzIG5lZWQgdGhpcyB0byBiZSBhYmxlDQo+ID4g
dG8gZGlmZmVyaWVudGlhdGUgYmV0d2VlbiBkaWZmZXJlbnQgcmVnaXN0ZXJzIChlLmcuIGRpZmZl
cmVudCBlbmRwb2ludA0KPiA+IHJlZ2lzdGVycyBERVBDTVAgYW5kIHBhcmFtZXRlcnMpDQoNCkRF
UENNUCAtPiBERVBDTUQqDQoNCj4gDQo+IHRoYW5rcywgd2lsbCBkcm9wIHRoaXMgcGF0Y2guDQo+
IA0KDQpJZiB3ZSBmaXggaXQgc28gdGhhdCBhbGwgdGhlIG9mZnNldCBwcmludHMgcmVwcmVzZW50
IHRoZSBjb3JyZWN0IG9mZnNldA0Kb2YgYWxsIHRoZSByZWdpc3RlcnMsIHRoZW4gd2UgY2FuIGRy
b3AgdGhpcyBiYXNlIGFkZHJlc3MgcHJpbnQuIFRoYXQNCndvdWxkIGJlIGdyZWF0Lg0KDQpUaGFu
a3MsDQpUaGluaA==
