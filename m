Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 441F2662F7C
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jan 2023 19:47:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237072AbjAISrY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Jan 2023 13:47:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237228AbjAISrJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Jan 2023 13:47:09 -0500
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8BFE1A058
        for <linux-usb@vger.kernel.org>; Mon,  9 Jan 2023 10:47:08 -0800 (PST)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 309Ieu6H015584;
        Mon, 9 Jan 2023 10:47:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=t/5/6qOeHaF9MSTAMm0JbKtY2ol68poxz6yAIHYaOnE=;
 b=Gef0XiN97yh2V8lFtNMKNlNQpbzTmPq5AgeZKp3+E3kzrQwEjkGJ0iWpqNUsYJrbmxMm
 OBuLIAyHlpFfUKdA3yk4SNgM3n4S0V1jhBf+gOA834OnrxCNdoQhWK4RVv5yqw59fltU
 eqWPh4yvyDcETh2hNy+2OeECDMmdOosNBoGR1KPIMW+Z7FeVr/J+6+1jS6AUC76KKKnL
 u/iHmaoEhw7uH2r1PErpTdS6dgJ+wDgvoyiDsCJc/5TxVzQ/X4IeTRXsb22f5T8RIFL/
 w8640SyYP+RhbiDszBHAxmPvZOnpp2oTicstVXVoGqADWmaXK8sAt925cDiusiIf6eib Pg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3my88n996m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Jan 2023 10:47:05 -0800
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 694694008A;
        Mon,  9 Jan 2023 18:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1673290024; bh=t/5/6qOeHaF9MSTAMm0JbKtY2ol68poxz6yAIHYaOnE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=dhV5MG+XwAv4e67z+U6ML5yoMR5otQqmzj7qIncZPs0NtG2C1xfpqz0CBnQQaHZM3
         DRMWr/YaDxwJ8b4X//eiK68G7X9T/E8KVyr+mcvB9oiTdhyykzLdsOktqaKPaN4uoY
         coWoO4sXH0ALBR99GeRlNF5LH+nxUaHw+8O2tUpBoRZSAyf1+rCWGIjYEb8iXbWOqd
         SNCaQpVbl0egKaQZ3Ub2PIkQm8+WW8W65BXnxNYnBb0gR3i/CY4UepqToxObc9JBsC
         eAcoOhYTIGuyMqPYBcWjUTn8/ieg5I82MxbXY4oKXqYZNTMYPSwffsp0mGtxbWnV3Q
         CAYauZIslKWwg==
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 48AF1A0085;
        Mon,  9 Jan 2023 18:47:04 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2049.outbound.protection.outlook.com [104.47.73.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 82BF5A0974;
        Mon,  9 Jan 2023 18:47:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXHKfuET++gaNEwfJFarILQ/BZONQgFM+I0/nywZJYxtUl/9nbISy0iNBvu7r3F8Yk0DdcRTy8Hwxbismq72Xy9Xrl4hqck8JYjL+gzdD79+6B6z1ul1neAeK1ZJWHxtXfagjkZOYKlQh9ZjUpkGVMWyVnxx+w0/GV44KXtbk9oT4QmqwTdW56FVCkQcOb/krLifFza716eNVc+511gs2bB9S2svDJZsFpy9gSADYWzQaV3zQlJgPkyCVyPwWV2x2o5MxFcsw5esrM1rW/CqkEW+PBoXywujv/zBiWlp8AErGKcwn/cYcoqCcYKR1c2/mg1RYOV3yVrW33/wzis5YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/5/6qOeHaF9MSTAMm0JbKtY2ol68poxz6yAIHYaOnE=;
 b=E7drEZOrUtvWJRG6ztvW75NmswYM5ReilpsOVpBimNTbiAATpGSkv8Qy9hDR6M4kncYPiFyvUx9xLs85jyRQv5DSppfnaQmeHcai5fRxa6lsMbCZizjzeBfgA5Y9qkIJqBxse938jTQOf173P61qCiz9yhHVXshRnJEBSo4J3tFvQ9jH7GzZrGpozncRFLpg83+BOsAbl0DIqefsSJKddndZ9NF3Gyo6Gd25UHUdEEettKeWS3eazQK1K1UuNT6MEXfOAjP+6M1ZF7N7EswJ4o/bemMX1L+0w/I31rBRnudiJI6vy0roHro0Q3SE693ez4AQcdBC3he+QMQHsABPjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/5/6qOeHaF9MSTAMm0JbKtY2ol68poxz6yAIHYaOnE=;
 b=kOw0mcmQ8RDZNeXXC6ok/f2kBOthquVH2/nhU54WmH6ojohh9t2XY889oFKNnP/Sakfd9XcFJ+bT9v3ZbDQ5HBAw9Ndp+vxkh3JNhPpA7LS9Pu2lXR7lZfSYjPvUXAvnLAY3HKKKUzUWjbA2NYjnB3JimX+V3JfXeyyrQluYHp0=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by MW4PR12MB6729.namprd12.prod.outlook.com (2603:10b6:303:1ed::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 18:47:01 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::e395:902b:2e90:b7ee]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::e395:902b:2e90:b7ee%4]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 18:47:01 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH 3/3] usb: dwc3: remove base parameter of event class
 dwc3_log_io
Thread-Topic: [PATCH 3/3] usb: dwc3: remove base parameter of event class
 dwc3_log_io
Thread-Index: AQHZIbBQGoRC7VXStUqZBfaDuyBSN66Wch+A
Date:   Mon, 9 Jan 2023 18:47:01 +0000
Message-ID: <20230109184657.kgvp7pq54hnzvaet@synopsys.com>
References: <1672996895-22762-1-git-send-email-quic_linyyuan@quicinc.com>
 <1672996895-22762-3-git-send-email-quic_linyyuan@quicinc.com>
In-Reply-To: <1672996895-22762-3-git-send-email-quic_linyyuan@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|MW4PR12MB6729:EE_
x-ms-office365-filtering-correlation-id: 12dd4d21-f81a-4359-ebd9-08daf271e4e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iGSGGBgR75auQ33EvLYpJn8t6KSVBqqGxqivEiFz9RBOmXu6F5H5DGjrVBQ9WQMWKM1itAo4LBKCXlllmdQjYk+Ytp5QENePK6aEPFE9LCAZefx8buZQyYloVY1v9Bd61Y1J2uIHecHCe2oukNdndDSj005myVsMKlWYEIHK4SAIMTuHzOOOPG4CUVyV2GDpuJlO7rAjq9acqD906B7Eq6nk9xHQMnAJtecT/sLVjZVf2h/gtcpP+y8KXGFpPtrhaFy2YcPkjHYIsqQkIR0F8FfkSQBBtaUeW6fjiUTlHyItbU4e8KkIBJAhzf+khLwGLfXNBOxTcNYGw1NBjbfr4xjaimtbtxFn8hwEEdFlc2AMC9kllPAkG79Tl3nGlg6/xUuvlwPgz1OJCroFcR4SkXZMDWJochjYqlKgEUzO/GeY95H/LJOO3n6q3ii/w9KgpMUvbP2NfwT7KsA2DRn0ejBF3eL518qg9P9Kn9qfZ4uHmK8Bpac658dHXKrtfSOX3xJsLyFIsRiC8DIfyFkTSosFIQ7diyiBtTqfPUZe+Rn0BoExnC2IlreYeUv4/5RIXMK8PRAvZSMQx1Tm+L8QuRDkJQwaSK8u5PwYI6cu0fIJ1vIp2Yq83InvrTyhBh9gNsPOqcA93TLspSIaehqclDbiDmKX+EWNYJ0CwM7z5bh42mqWMeQsaqcTpuOQanwZ/+xNqk6itVTQFbj7TozTNg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(39860400002)(366004)(376002)(346002)(451199015)(38100700002)(122000001)(83380400001)(6916009)(38070700005)(86362001)(66446008)(66476007)(64756008)(8676002)(76116006)(4326008)(41300700001)(66556008)(66946007)(54906003)(316002)(2906002)(5660300002)(8936002)(6512007)(1076003)(2616005)(71200400001)(6506007)(26005)(186003)(6486002)(478600001)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aytON1g0bit4eXNwcmQ0dCtzRTE4aDhONUtHRVZxTi9Ma3NaUkh2N2VxbWRa?=
 =?utf-8?B?eGI1RlVDVjhQR0JLK2NoQnBTbDFWWlorYm53QTU0SUFZOVFyWGx6YnVtNWdp?=
 =?utf-8?B?MmxPQ1FNSzM2MDR1UHdISDJEcm1HaVpyc2xiM3dScjU2SEhEZVpxR2ZyTXh4?=
 =?utf-8?B?VGo2VEhMSVl5Ung0MEMrc0M5ZHlod2crd3Fja0VYNE9paHpES2lEaTlLU2k1?=
 =?utf-8?B?a3ZTdlRKcGdXeHNyMzFpRGNPS3FnbmluZEpzRXE5R1ZMUXB4QldrdGpHTHFF?=
 =?utf-8?B?N1l0NGJzV1k2UEpmRDNLZ0NXajR6WDZqS3dBQmFXblY1VEhPK1lTRXhSSFor?=
 =?utf-8?B?NkJzVXVTWmpxbzNyNU1zbEh4MW5SN3lwRkZrcDM5VDYwYXY1ajE0Z3djYzNR?=
 =?utf-8?B?LzBlcG9PMm1lVzZXTVZyWDJDNFJzZGVQL1A3MGYxb01za1liLzJxckpnT2w3?=
 =?utf-8?B?MkFXL3h1eUpWWlVNdUZFWHlQZGx5SkRxZWZaOSttWndpcHN6d2ZMS3ZzTVVH?=
 =?utf-8?B?WVdialNwTm5WL1FmZ1VyUGduZ3prZzQwRFBQeE92aXVCQVhzNmI0NGtFY3J0?=
 =?utf-8?B?WFJMbDF2QlJIbU9JQXdNR3RZNFBzQzVpQU5Xdm54UXJzT0pvYng0WWdRdVp1?=
 =?utf-8?B?aTI1Z2ZhcUZQVGxlWDBXcGd3NFlWaGRWRVhiTVBiMy81OW1nUHFYUmRsZkxs?=
 =?utf-8?B?VFVRVU9NeTlaa0RCd09nT2ZVdk1qbHZxUU13NEswWU03eDkvMjZBMGN4d2xx?=
 =?utf-8?B?Z0ZjRGdac0N4SEtJSkxkMGNXV2hJd1FIS3p5dDl6RXloc0lKamVRZWdJdFox?=
 =?utf-8?B?Y0dSM1oxdWUwNGRKNXhOM0M1QXpHcUxxdmlxT3VnQ3NDZE9CNm1TdSsyVnIr?=
 =?utf-8?B?VDZZc2l0V3Zpc01iZ2lYWjMvQ0Q5bG5xYmltdS9YUGdodGRJZVdvRWE2ZEJ1?=
 =?utf-8?B?SDFPTXBqWVQxREQ3VFlkd2NwQ1R1NXdjRzhOWjdxY2p3NDJlTVh4dFUvVENM?=
 =?utf-8?B?dlNud2FzTEN4TUI0Y2RHRGpFeXdsdjZ5ZXJESXN4U0I4Zk1oVEh3d1dMNmk2?=
 =?utf-8?B?UEpzK29qTEEzcFk3MUVuOW1Pc2xoV2Y3ODk4cjBxRkVBZVpmdG9oNEhKeFk1?=
 =?utf-8?B?QTduNlFPeVd4WElxMnJFTGVZU2xIU3cyRU5Cc0kyaUpHMTRWSmZvb0toVVls?=
 =?utf-8?B?NDRzcmFCdDdURFBMTHU3VlAxcEVJcGhraUZQa1VmZExkOSt1dW5EWjFyWWFB?=
 =?utf-8?B?aDRWR0NydllocW9OUXNqeEdndW5ZN04rbCsrRTBkNGVtNDVCYjVBMlBCMnZa?=
 =?utf-8?B?TmxCMFZKYUQxT21XTlVONXBVMWtzeUFHYzk5UTZYREJNYzY3d2NobWcyZTFq?=
 =?utf-8?B?NXEwMi9mbDdkVlN4U3Y4ZHhDNi9ablN3cWhTYmtGc01Ic25OM2ZGRlkvb1lM?=
 =?utf-8?B?QTFObXYvV3l2TEZuVDZVZndON0JEdGp5aHRhNGpRMzhkUFJCU3BvL0RHRzdu?=
 =?utf-8?B?bmhTYlFoMmNiWEtRSjBpVTBRR2xNNnBpcjIwNXJFaVFKWll6OWg1TWF2TnhE?=
 =?utf-8?B?SFFGM3puZUFIcm81RzlXbGh2bWgrNVNKQ3ZaMFU5RTAzVHRxVUxUazludkJX?=
 =?utf-8?B?VnQvY3U1bkY0MDQ5RktyNzJva0pmL3pIYWJnYXduajFUVUxnVGtSSzBVTUQw?=
 =?utf-8?B?SFBOTGYyNFIydUZEMjd3WTFOdkdCRHdKQUVPQXRuNjJubC9wUXA5UVBUTGhY?=
 =?utf-8?B?RFN4NmdrbkZPYWl0enlPKytiY1FMTU9ONWpwZUVMY01oaTJwSkRGRTVBZjNG?=
 =?utf-8?B?dkhUWkkyWUJ1NzByL2N6N1RQOXAxZlBubm93SDRlTGxOUEZrb0RjQjcwamp6?=
 =?utf-8?B?NlFudUdFZ3g1a1JJZXdRK3M2S2Jad0wvcHZ5eXdpMU02M0lwMGpCZmlJcjFx?=
 =?utf-8?B?Wlp6WDRpL0w1cmY2S0ZVWnliUGNhaTdxT0FWMUZYTFduWUEwN2k1VkJNeFBv?=
 =?utf-8?B?L25MVGt0NTY4OWRNdUt5VGhlN0VONjRvcXAxL3Y5WWg1VDFGTUMrWElzcmhP?=
 =?utf-8?B?Z1NxY2ZFWmR6WEc0UkhDa2o4VmprRmpGdWp4Y3V0MWJBMU9rVVJaZW4rWndW?=
 =?utf-8?B?QnZjOWx2U0VZWVZIbkZ4cFhKdDJpVkd2eE5MYjd6UkdxdkRLdDJDdHVRSE9v?=
 =?utf-8?B?dXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB8CC3E34F341E4F9635C6A4484A71B3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: boHiFV+/JkeOkGR0FTzu/o3us/rn91MGY3uNbQaoMOUBKgirLS0aapk63t5n/54wBKw+EYKUww+LwW04iJSwHLXst1E+a6HCPDzFqHHJHMYAbognFDZrRxUROf1Saf5B6jR1AGlPq/DMfZHBQtVfnYBtkufDqherAPLJdI+lp+jbEGYcQjpKryoul6Pbtgfm5eywPSK4d7ok4s29ad/ZnqOsktYHZsFc5WD2uBzWOHAKt92hcz9DufapWP1uAE27B5UEJMc1hVUczjY1Fcsj4s8KRfYlErCo1MwEXFGAJm3mI2aUUGZ/glxHtEtrk1tOSZtmcwB5HFsH/J+7M9Hglr4IfRDm+/r8yW3Kkuy7VDoSzHdcmGQGYg9ttYtGWHoIPXVYP5PZJE1opLlsQchqlpIp4kfzGllQkoLtjUqk2JTd6sHoGEsUQn99+oUh2TEh0BRbwGfEYys+WlPFA5fdnGY7IJZwfMX5tpVbQJVt92KvPM+HB/R5ix9o5zYCK73zdPZfw78i9RDYcGmk2f0MMG/bRUzK1cuoLDH/I2/kaeBqvEIQrHzk4+5mqeUbRvGvHt8bAM5YqmfPoGdrT0ZJ/BCotA7wIVRIojyrPtJkCNIIKmvq0MtG0ZGOTomz7kk0s517MQXeio91zdxAtqB+BU9CZYu6T839rzGBZgv3KBoh3prlJuSfYgePJ9JcU+flOA50Z3Q9qk+uLTqfFdyS2v+oSJY2XdldGvcv1FaBZzqZdqC2NllOKt9ninjG6KQPkjeSr0WwRH+DdZ13GAdGDhzgW3zZ7zK0t//fO9o8chgp8iHUNITnfxE0EGe3GBuQJpW8xqStNi+AJyywvXaL/ZvCdraS25Zs4VwN/XN/4fdGLo53ILa2GGdlgp+VvCoU
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12dd4d21-f81a-4359-ebd9-08daf271e4e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 18:47:01.1155
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iz9VIJukBo6/WOw0D+qqXCbuqQIa/3KhY+5WLT1O5P9/M0PShuCrxLJKBrlPlBwcQ6RM4XDnr1E4s3f6mO8zKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6729
X-Proofpoint-ORIG-GUID: qKv_s0Fe1bs49iQ8kRacEUCehe2pTUhW
X-Proofpoint-GUID: qKv_s0Fe1bs49iQ8kRacEUCehe2pTUhW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_12,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=882 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1011 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301090133
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gRnJpLCBKYW4gMDYsIDIwMjMsIExpbnl1IFl1YW4gd3JvdGU6DQo+IHdoZW4gdHJhY2UgcmVn
aXN0ZXIgcmVhZC93cml0ZSBvcGVyYXRpb24sIGl0IGlzIG5vdCBuZWNlc3NhcnkgdG8gc2hvdw0K
PiB2aXJ0dWFsIGFkZHJlc3MgY2FjYXVsYXRlIGZyb20gYmFzZSBhbmQgb2Zmc2V0Lg0KPiANCj4g
cmVtb3ZlIHRoZSBiYXNlIHJlZ2lzdGVyIHZhbHVlLCBpdCB3aWxsIHNhdmUgdHJhY2UgYnVmZmVy
Lg0KPiBpdCBpcyBlbm91Z2ggb25seSBzYXZlIGFuZCBzaG93IHRoZSBvZmZzZXQuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBMaW55dSBZdWFuIDxxdWljX2xpbnl5dWFuQHF1aWNpbmMuY29tPg0KPiAt
LS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvaW8uaCAgICB8ICA0ICsrLS0NCj4gIGRyaXZlcnMvdXNi
L2R3YzMvdHJhY2UuaCB8IDE3ICsrKysrKystLS0tLS0tLS0tDQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDkgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy91c2IvZHdjMy9pby5oIGIvZHJpdmVycy91c2IvZHdjMy9pby5oDQo+IGluZGV4IGQyNDUx
M2UuLmZjYjU3MjYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvaW8uaA0KPiArKysg
Yi9kcml2ZXJzL3VzYi9kd2MzL2lvLmgNCj4gQEAgLTMyLDcgKzMyLDcgQEAgc3RhdGljIGlubGlu
ZSB1MzIgZHdjM19yZWFkbCh2b2lkIF9faW9tZW0gKmJhc2UsIHUzMiBvZmZzZXQpDQo+ICAJICog
ZG9jdW1lbnRhdGlvbiwgc28gd2UgcmV2ZXJ0IGl0IGJhY2sgdG8gdGhlIHByb3BlciBhZGRyZXNz
ZXMsIHRoZQ0KPiAgCSAqIHNhbWUgd2F5IHRoZXkgYXJlIGRlc2NyaWJlZCBvbiBTTlBTIGRvY3Vt
ZW50YXRpb24NCj4gIAkgKi8NCj4gLQl0cmFjZV9kd2MzX3JlYWRsKGJhc2UsIG9mZnNldCwgdmFs
dWUpOw0KPiArCXRyYWNlX2R3YzNfcmVhZGwob2Zmc2V0LCB2YWx1ZSk7DQo+ICANCj4gIAlyZXR1
cm4gdmFsdWU7DQo+ICB9DQo+IEBAIC02MSw3ICs2MSw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBk
d2MzX3dyaXRlbCh2b2lkIF9faW9tZW0gKmJhc2UsIHUzMiBvZmZzZXQsIHUzMiB2YWx1ZSkNCj4g
IAkgKiBkb2N1bWVudGF0aW9uLCBzbyB3ZSByZXZlcnQgaXQgYmFjayB0byB0aGUgcHJvcGVyIGFk
ZHJlc3NlcywgdGhlDQo+ICAJICogc2FtZSB3YXkgdGhleSBhcmUgZGVzY3JpYmVkIG9uIFNOUFMg
ZG9jdW1lbnRhdGlvbg0KPiAgCSAqLw0KPiAtCXRyYWNlX2R3YzNfd3JpdGVsKGJhc2UsIG9mZnNl
dCwgdmFsdWUpOw0KPiArCXRyYWNlX2R3YzNfd3JpdGVsKG9mZnNldCwgdmFsdWUpOw0KPiAgfQ0K
PiAgDQo+ICAjZW5kaWYgLyogX19EUklWRVJTX1VTQl9EV0MzX0lPX0ggKi8NCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdXNiL2R3YzMvdHJhY2UuaCBiL2RyaXZlcnMvdXNiL2R3YzMvdHJhY2UuaA0K
PiBpbmRleCAxOTc1YWVjLi41MzZiOWExIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2Mz
L3RyYWNlLmgNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy90cmFjZS5oDQo+IEBAIC0yMCwzMiAr
MjAsMjkgQEANCj4gICNpbmNsdWRlICJkZWJ1Zy5oIg0KPiAgDQo+ICBERUNMQVJFX0VWRU5UX0NM
QVNTKGR3YzNfbG9nX2lvLA0KPiAtCVRQX1BST1RPKHZvaWQgKmJhc2UsIHUzMiBvZmZzZXQsIHUz
MiB2YWx1ZSksDQo+IC0JVFBfQVJHUyhiYXNlLCBvZmZzZXQsIHZhbHVlKSwNCj4gKwlUUF9QUk9U
Tyh1MzIgb2Zmc2V0LCB1MzIgdmFsdWUpLA0KPiArCVRQX0FSR1Mob2Zmc2V0LCB2YWx1ZSksDQo+
ICAJVFBfU1RSVUNUX19lbnRyeSgNCj4gLQkJX19maWVsZCh2b2lkICosIGJhc2UpDQo+ICAJCV9f
ZmllbGQodTMyLCBvZmZzZXQpDQo+ICAJCV9fZmllbGQodTMyLCB2YWx1ZSkNCj4gIAkpLA0KPiAg
CVRQX2Zhc3RfYXNzaWduKA0KPiAtCQlfX2VudHJ5LT5iYXNlID0gYmFzZTsNCj4gIAkJX19lbnRy
eS0+b2Zmc2V0ID0gb2Zmc2V0Ow0KPiAgCQlfX2VudHJ5LT52YWx1ZSA9IHZhbHVlOw0KPiAgCSks
DQo+IC0JVFBfcHJpbnRrKCJhZGRyICVwIG9mZnNldCAlMDR4IHZhbHVlICUwOHgiLA0KPiAtCQlf
X2VudHJ5LT5iYXNlICsgX19lbnRyeS0+b2Zmc2V0LA0KDQpQbGVhc2UgZG9uJ3QgcmVtb3ZlIHRo
aXMuIFNvbWV0aW1lIHdlIG5lZWQgdG8gY2hlY2sgdGhlIGJhc2UgYWRkcmVzcyBmb3INCmRpZmZl
cmVudCByZWdpc3RlciBvZmZzZXQuIEN1cnJlbnRseSBzb21lIG9mZnNldHMgbmVlZCB0aGlzIHRv
IGJlIGFibGUNCnRvIGRpZmZlcmllbnRpYXRlIGJldHdlZW4gZGlmZmVyZW50IHJlZ2lzdGVycyAo
ZS5nLiBkaWZmZXJlbnQgZW5kcG9pbnQNCnJlZ2lzdGVycyBERVBDTVAgYW5kIHBhcmFtZXRlcnMp
DQoNClRoYW5rcywNClRoaW5oDQoNCj4gKwlUUF9wcmludGsoIm9mZnNldCAlMDR4IHZhbHVlICUw
OHgiLA0KPiAgCQlfX2VudHJ5LT5vZmZzZXQsDQo+ICAJCV9fZW50cnktPnZhbHVlKQ0KPiAgKTsN
Cj4gIA0KPiAgREVGSU5FX0VWRU5UKGR3YzNfbG9nX2lvLCBkd2MzX3JlYWRsLA0KPiAtCVRQX1BS
T1RPKHZvaWQgX19pb21lbSAqYmFzZSwgdTMyIG9mZnNldCwgdTMyIHZhbHVlKSwNCj4gLQlUUF9B
UkdTKGJhc2UsIG9mZnNldCwgdmFsdWUpDQo+ICsJVFBfUFJPVE8odTMyIG9mZnNldCwgdTMyIHZh
bHVlKSwNCj4gKwlUUF9BUkdTKG9mZnNldCwgdmFsdWUpDQo+ICApOw0KPiAgDQo+ICBERUZJTkVf
RVZFTlQoZHdjM19sb2dfaW8sIGR3YzNfd3JpdGVsLA0KPiAtCVRQX1BST1RPKHZvaWQgX19pb21l
bSAqYmFzZSwgdTMyIG9mZnNldCwgdTMyIHZhbHVlKSwNCj4gLQlUUF9BUkdTKGJhc2UsIG9mZnNl
dCwgdmFsdWUpDQo+ICsJVFBfUFJPVE8odTMyIG9mZnNldCwgdTMyIHZhbHVlKSwNCj4gKwlUUF9B
UkdTKG9mZnNldCwgdmFsdWUpDQo+ICApOw0KPiAgDQo+ICBERUNMQVJFX0VWRU5UX0NMQVNTKGR3
YzNfbG9nX2V2ZW50LA0KPiAtLSANCj4gMi43LjQNCj4g
