Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A93F6FD2C3
	for <lists+linux-usb@lfdr.de>; Wed, 10 May 2023 00:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbjEIWgg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 May 2023 18:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbjEIWge (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 May 2023 18:36:34 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35C6B6582
        for <linux-usb@vger.kernel.org>; Tue,  9 May 2023 15:35:57 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 349JdogV029357;
        Tue, 9 May 2023 15:35:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=8ZZ5W7NM2jZpqwI0wGOX+iCoWGpwVLfAZPR6shZE2WU=;
 b=iKZ2vmWtxp4qxHdtUexgkLMqAG3QZ9qpO0SwuTTdAEvc3WrVDe/PlB+EW9kD3/qN7Ibt
 Vf95tnRXFqvMd//2vsQe6gKKR7dg/5MnByYp/+0WJPAW4ZNHFGv0YsyLSbwAwOJ1i8ft
 FxgSPvL7aotLvM11P98TjvzBRQFdMmU0lPZsV387JgUhS+XNr+V8gO38hEhmuBCalzbs
 pOHit+BB5BAsDxr/OsxdoMRosHbvP2My8evV7qk5oOk2uvQLwbFKoRn5H128OE4/hftL
 627wEaAGbtrY6ubNtyCAJI/i9hrltQUolvf9IKPUVtXyFYkP81I1y8aszMPZRerNsplG fQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3qf77uegx5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 May 2023 15:35:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1683671749; bh=8ZZ5W7NM2jZpqwI0wGOX+iCoWGpwVLfAZPR6shZE2WU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=T9ygbb/iPlPlP0B3DEbevF0zLFTcQnMmzRxlKuaDHAUIILhlFVrg0mb2I/BI/QySS
         6rPFrzmvEZCkRz5cVBH6GE6xGmXqvx2Nm4PezvPdL2LPwll3FLg9i7m54erDnd/CTI
         iOEzL2RDMEhWPcUAggjakjmhFeWddoPEkjyoH55r+Qmoxmtl6E35USbVGQP9lndQpY
         ESvVfJaHxJMSAg/G7yubQ02Phg+cgKMd9klHBmq88x3yjqlgUB1dtSNPwPphCJw7pQ
         EwbqtywWtRrV3EF0TovytCS342ddOxVgbrwHGPwmHHo/78UxI75osZPCdb1xozBj7J
         fTqIrLO7MAXPQ==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CC3A040407;
        Tue,  9 May 2023 22:35:48 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 12103A005A;
        Tue,  9 May 2023 22:35:48 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=k4nyUwQA;
        dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 351CC40525;
        Tue,  9 May 2023 22:35:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TjgeqKYwLPzBxfCA4oWT2AuSwRjQxMI+zUgRi8c4S7Ke4Sa88mJaL/ZuJtmBvDOc9GiNEHNw3UbFuB4FKBQOKRZcK0y+luNFeU2XVRlKsKt81MKMBE5NdNeZ6IBkTZOVcG3R6bc8j4h92bjlDE+EIdVMDEJHx2gCyr+aFNcaKrsLqU2A6BWMfQLeD1Bo7d7wzhqa9io/ZakF4XQcl2hSLOjRa38K8+4XPf/2QTgOjc2Km9BwXimE2xTuTSL6/KqK+TT1QD0dd9HBmiG1erqpffUTAEpt9taF/gEpVzCra8t5EhRGAfSP3lYd83oRPGP2RQp7fnSN8FqFqhy143SN6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZZ5W7NM2jZpqwI0wGOX+iCoWGpwVLfAZPR6shZE2WU=;
 b=QNbHNIPq6+UIttCYeoQOl8knAnVsaooT9zH6cv2WL/xof/uj5kPuas124ZrZk8g74CSLMjdvamnRBttLqAm8j0d4r/UlSyLBrk7F0JuFzckONmJl9YPkKxieE0KryqjhtOGyqdVze2KHS/KJ0XuBRcPx7WLmPr3EJQCvHlLoATI1EJzFs0Bnqyp6IZeeDMWLka1WpDPkg4vwQW2pa78tSDmO6m3xEs7k3+K7KZNb1hEp1Jl7jalxPwzi5tCuj8AuUXSNP7OHQTv7EuVPbY9M78nWFM1Qghhv0YWZUo2hCJh5kHVSHl6WC7AqgrxfwN9ShNN8ltv+U5VTyKXXQVLQKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZZ5W7NM2jZpqwI0wGOX+iCoWGpwVLfAZPR6shZE2WU=;
 b=k4nyUwQAjMY38X1scTUEYC84lCPQ9lwOrIP1qDX6zsXLzRrR+qwqhKaExHKj4x8kSgwnHelnsaN+GwKAR8BXS5CO7XhBFOGpeQAPoEcUQRSzJ6w9m92nipa8Zpkek7Y4kwOYfF5fY3HAYJBts40fmmIqznDOaJSor2hFfPT+ZVI=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by CY8PR12MB7193.namprd12.prod.outlook.com (2603:10b6:930:5b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.31; Tue, 9 May
 2023 22:35:43 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::bb79:9aea:e237:688c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::bb79:9aea:e237:688c%7]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 22:35:36 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Avichal Rakesh <arakesh@google.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dan Scally <dan.scally@ideasonboard.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Topic: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Index: AQHZbxSLVlNfn9UhSEmoQu3rfa9UjK8viLiAgADE34CAABUTgIAARO8AgADVU4CAADP6gIAAJ4KAgABIVoCAAlnSgIAX7D2AgADufoCAA9vnAIAACRuAgAEw7gCAAEO1AA==
Date:   Tue, 9 May 2023 22:35:36 +0000
Message-ID: <20230509223526.5e6oqqri3mhwc34l@synopsys.com>
References: <20230418193951.zjwgg25cyhg3lsay@synopsys.com>
 <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
 <47244f7e-feb5-4958-be14-7fd9f0814566@rowland.harvard.edu>
 <CAMHf4WL9dOWiw-+V2DQeQ=3jxmk3LHg5ONdWSwcp3Gx0AD17yg@mail.gmail.com>
 <20230420172011.GF21943@pendragon.ideasonboard.com>
 <0610f776-44c8-4372-975b-52c2a1f0af8d@google.com>
 <20230506125317.GD17474@pendragon.ideasonboard.com>
 <CAMHf4WLMAjigKypYho24TqeuWx6Y9-LWjq2cj_5ad31pqsKDzg@mail.gmail.com>
 <20230509002143.7x5zo6bohvn5dyb2@synopsys.com>
 <CAMHf4WLzx3Bj-TR1ZrqsW1tfY+WUtgTt8TVObOFnkNcx2Pc9kw@mail.gmail.com>
In-Reply-To: <CAMHf4WLzx3Bj-TR1ZrqsW1tfY+WUtgTt8TVObOFnkNcx2Pc9kw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|CY8PR12MB7193:EE_
x-ms-office365-filtering-correlation-id: 95f2c0fb-6acf-4f6b-eca7-08db50ddb56e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Olz0ndKVUcYhEBJWbZSPUVzwqRNon8NAhAmNSiCX16QQztwtOHRyQROxjtWypM1z/H9boDqZji3lOfa46htqtRZ1bOQNRTpdFLhSgnDtnJaofc+auGIRh+cjvhRwgbsxtKkoyrIAqEpDUzhWvb/tqwgB03ND+YG6RDPZbq9EBkuFG1l0msIJg8GcRjB/xtv5+vZ0jYoxHjvHThsqCQeuoXR10xIvDHiwBq6EK7eCew2qfdIA5aEWgFC8Ar46TLFs4HMHKCalO2bqIcGpo+QuWMk9J7iZu/jFN0PdY2q/CdoyJxYcKV2DXZdxRwxvTeFKZesdzC9AappybSRAjRD7kZupD8HDigXIth1HVFDVTvSPIVraDo1LMaoN9A43Jr+bQ5+MoU1MKHb2ClM6gsMDaRHxqPxKpC/r0RGMofikY5RR58H39Q/0Un4vNfHjPwybs9uKO0YpjW3mQJ+EXDjUIQ7rqwgRLoSPelMKd6jLwh8s+mileP2Awb5anN7pysq6u5aVclpJV1udPRlrWrdvClnYl1suBij0P3eTCaQDRFfO5eh0oVuVfir3LW/Xi0BOyER40N18aHEfea/N7VjD8DSoh0sud8q6+C45hIbnQP/br15yMET4ja4KxpbP0d7A
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(39860400002)(396003)(346002)(376002)(451199021)(83380400001)(2616005)(186003)(2906002)(36756003)(38070700005)(38100700002)(86362001)(122000001)(6486002)(8676002)(8936002)(316002)(41300700001)(71200400001)(5660300002)(478600001)(54906003)(66946007)(66556008)(6916009)(76116006)(66446008)(66476007)(64756008)(66899021)(1076003)(6506007)(26005)(6512007)(53546011)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SU5hSW0ydDRDZjVYd2E5am9xT0JnSlI4cU5MM1NXQ1dFMGU5TUxnZGpJanJl?=
 =?utf-8?B?NXloeUh6Tm5zZHE5ZmtQanA2UFRpTFh0b041Qld1Rkp1b0NYRlFTaWJaZkk2?=
 =?utf-8?B?ZTZ2K0ZFbktiTlloSmRDcDJEcVhnYkpMSTU5NTYweHJjM29rcCtUcEw3Sm4v?=
 =?utf-8?B?RDYzM0RoSC8vTW54RHdYUnloY3ZwQjJUcHJmUklFZnJ5UnY5WDRUcVVPd21R?=
 =?utf-8?B?VUJVZ1lrWXhGYTd4R2RTNkFFMG9kTFFGenZ5SzFobXg0ZmpzMi9zbnNMZjNv?=
 =?utf-8?B?WSt4czhzd0JsTk1aMXczYUlKZkRubURCbjJUbzgxTlEvZ29hNkNvcDkzSlI2?=
 =?utf-8?B?dmh6NWoxY2VhMGJxUTBiMGdLTU9jTklSU3M2KzdMdkVWbCtkanhhMHZ3NXNT?=
 =?utf-8?B?SkVQTS8vRlgveW0vNEl0UC9KNjN5VzdjSGFsZm03eC9pVGY3cWw0ZkI3ekpz?=
 =?utf-8?B?dytrR0NyRjVaYjhuNEU1WWxtQ0JRQXBCTklnSDZ1USswRE1vY2ZKMUNFUWtt?=
 =?utf-8?B?bkxhbWxMS1dpeGtHd1pWZXF6TXg5bTIvTVN0SkE0SldrMUxEcUs4MVhvWTMr?=
 =?utf-8?B?VGVJczVKRExOTXpXNGxFTFV5UEE4emFQZGh0M1hVZUtYdmlvWTQvMS9WTWJW?=
 =?utf-8?B?WHFmeVVOSzJLZDZ5UUFXTVFoRUliZHgyRmtSYVVQUmNlVEZpUXJqT3p5Z09a?=
 =?utf-8?B?bTZONzBYKzc3bk5tMWxrVEZOM2hXOU40b0hHeVhWNmZkMXlrUmJETFk4UVpU?=
 =?utf-8?B?N1lMQU81cEdiU2RoVGIwaEF4VWxDanoyeis3WEtUaU5tZVBrTjRUbW9sZk5E?=
 =?utf-8?B?cjRRc0dVaFJVcm1iMFJPcnlZRnhXaWpBazU2KzM2bUFnVjNYZnRCOXF4WGVz?=
 =?utf-8?B?MUpnL256bWxkRmZZNHN0OERESUw2NFhpd21VbFRONmVpcEJpOG85Q0ZtSDB1?=
 =?utf-8?B?RnNpNFFtOCt3eldTVEJVMXFKZmlVYkRac0tiZytHZldYTStUandzRXJGMlFZ?=
 =?utf-8?B?QzlnaGU4aDlqUHd3elBaWFFDemx1UTEwMWJZaTV0NVpuZ2k5a0VCMkx3SlJm?=
 =?utf-8?B?eXNxdjd0cVgzQjZOOTAzWTUrdGN3YVR4OTBnQWl6TWR1ZlpRTEFPQ29talFu?=
 =?utf-8?B?bVhqcmQrTWdtczRtcGcwOUE5RTA4MHVGeDBWQjFnZFNnNEM4L0ZDV0pNVFpl?=
 =?utf-8?B?dkJLcFRpRW4wMWhydEwzaVZwNWZDVHAwaE0wWGN1MGI5RlNJSDNvRWxnN2Np?=
 =?utf-8?B?KzV1cDM1WWhZY0E2U2hjYlM2cGxVTExPV2hjbWJCSWs2SFY4dHEwRmJjZThR?=
 =?utf-8?B?Ym5oUklqTDlNMzFDSXZrdEJaT1A2MlBEUlZNMFFLckNMYzl3Rkh0UllSQWV0?=
 =?utf-8?B?OFJVcEV2ZkhLTW9vcHkzS2IrWUkyNWdJVTN1RWl0ZitBZTY1bW5oZzcxQkJL?=
 =?utf-8?B?YkRubjFxM2FmbGxKSU8wVHpQZGJ2aWNZWDEyZHVKUW5haHdXb2xDZmF6YVVI?=
 =?utf-8?B?ZEc1L0dJSklTb3JHaVlXUFBYYllXYWtiZ255NTJkRXJNK3ZNNjJSTU5ZYmJP?=
 =?utf-8?B?aUZqWXRIcFEwdXFmMExiVzRwZVJSd0c0S2tQdCtEN3hnZFNlOFFqYTdpY1Aw?=
 =?utf-8?B?QktyMktCWGVSbHAwZXZTdkhQb3hQbTJlQmphVDZwV29COXNOQk84ekh3dDJ5?=
 =?utf-8?B?blRBaFdEVEUyblhWZXBJRlp1RVFLOEZOUHNnV0ttZm5vUDRkUmljUERGeFFy?=
 =?utf-8?B?bmpCVzVuc21ycTQvdGVOQWk5Tk4xcG5UejVaSUdicVRmOXhNMDZZcE1uQ0tY?=
 =?utf-8?B?azRXUC9JbC9yYmY4RjAxczR1WUFSRzFCcjVrNUlYYzg5a3B2WnRqL1BLQk1j?=
 =?utf-8?B?TWFtL3FqMDIzbVJvTjlLR0NDZWNFeHYyQ0Y1em83V0x0RnVQd0ZlZW80WXp5?=
 =?utf-8?B?R3FXNmQ3VWM4Yk44Zm14cmMramJsYmNGZW8rSDlQb2NoUXA0ZzdnYTB5M21z?=
 =?utf-8?B?ZW5FWkNZS2s1SmNGTW1raGgxRjhFUXRPV1lrYXgweGs0a0RJenFoQW83YWJi?=
 =?utf-8?B?anZCNTBJb0lEbExBSVZKWFJ5SVFGaW9TNjF3ekZUTzBYZEZnKzE3a3psY0ZI?=
 =?utf-8?Q?RJ0w4FPJvGL/0RJqlIGgmT7JI?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F143C8818535B943A212819542F1B533@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?ZTljdWxEckp6dTR3RFJ3MG0ySGtXTGJFZk9jbmxyODFWd252aWQvaEpySDJT?=
 =?utf-8?B?bzROK2lQeCtuYStKQitpUmhYbjN3YWZBSEIySFFwdEg5QkZXaU1pVzFJbzlC?=
 =?utf-8?B?UjBBR1Q2ZmluRjduLzhGN2NoQkwreDhxZHBwbVNDamNLWWtkZklrK0hSYm1F?=
 =?utf-8?B?YVBnOUZCZVl2MnFQU0hvakRscFkzVzdBL2I1blBlbjFWODAxdGI0ckpJU2t6?=
 =?utf-8?B?YU9UbVZHQ25KZUZIeXI4T2dGaHNJWlR6N3hnN1ZIMHpFT1M3UkZTWldMaTc4?=
 =?utf-8?B?RVNYMG1hNDE4VTlBNDRwc0J0RmpmS0QrNExwYlUvUWVFcW1SWUJZVzBkVDBh?=
 =?utf-8?B?Zi9RdjNueGhlNnEvYjFWZ1Y1VFE1dkJzbThLejFLVG8xUzY2b0xiRlZnZ1ZZ?=
 =?utf-8?B?QmZ3cVgyUWxoeHJSRnpPaE4vNSsrTjdpcVFJamgxK204OFFhdDlIWDk3S3ZQ?=
 =?utf-8?B?OXlCMVRmc0ZZSUxZdXd6ZGZvUWIrRGZtcmRwcDNzTFFyS3pMSTUvYU9ZeHYz?=
 =?utf-8?B?c080dndmQ24rWVlIWjIzNjIwTmN1MFQ3L1N6QzhOYkxSaFN3TUZwNG0zdHdE?=
 =?utf-8?B?ZVZNMityM2NjVlczYjhGVEJzWTZTMHE5L0xVdmhJYTgxNU5TUlV3N3lPdVFn?=
 =?utf-8?B?bXZaSDVsTmdGaEtXc200UEtwN0ZWNW9DMW93VmJQdWJzS0lXeUNnWEM1SXhy?=
 =?utf-8?B?c2REU1U1NzlaOHpCaUNORnowSUtFekZ2cjh4a0dhcFVoTlhZK1B4V3JpQnhM?=
 =?utf-8?B?NjFlQ0xRKzdOZy90Q2FTbUh5d0ZiQ3E1bXNYYyt5UWJUYXJXOVVVUFJUcTAx?=
 =?utf-8?B?QnZEUnFaUmxJRS9HWXBuUHVlY0VMYUUreWRJaXkrbWdhZkptRy95VDV4RXVD?=
 =?utf-8?B?WkcvVWh4c0hwNzc0TEMyM1Q5VXNUVXduV21Ld3VIajRxbDc2SUtFNEw0VWdn?=
 =?utf-8?B?NHhLOWY5cHphY2JzalZaWWZ2RGhKdGVYQUk1UWt0b2RqMjJJZWEyNkVsUXF6?=
 =?utf-8?B?QW9hMWZBb1hLZ3B0S0hPU0VSc3prdzJpUjUvVmtncjVlMGxQSFlKZWNzMEo4?=
 =?utf-8?B?cUxWaVVob25wdnNlQ2ZKbUFtakVTRE85NUZMMVoyYXoybHRUbWFFRUU5RmxP?=
 =?utf-8?B?dXoxRmRzUVFYdXVJTGErYkhHWkMxM0FJSGJoOHZmdVp3c1ZtRkd3WHBrYjNi?=
 =?utf-8?B?eHJrRStudU1UUWx2d21yWkQvSWxnSW54OGFKSEx1K29hUlJSSmFXYkdMOG40?=
 =?utf-8?B?Z0hVQmplZ2Mvc3BCVXVLT1BkV3NrLzB4Z3hBaWYrbVlKY05qMXN1eW5EK3pD?=
 =?utf-8?Q?p4wHlM3E7P9FA=3D?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95f2c0fb-6acf-4f6b-eca7-08db50ddb56e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 22:35:36.4798
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XgGOm3f5BqudZ2fSxehLcFW5/IhypwVTbgVSszkIq8+Mjc+Dtg3akwaMvOAy33hRKue4kCQV+sElEmc7jM43Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7193
X-Proofpoint-GUID: 50XM2JlcYInCHlToZ-fXSlKsBn2Zj_hi
X-Proofpoint-ORIG-GUID: 50XM2JlcYInCHlToZ-fXSlKsBn2Zj_hi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_14,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=839 adultscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305090184
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVHVlLCBNYXkgMDksIDIwMjMsIEF2aWNoYWwgUmFrZXNoIHdyb3RlOg0KPiBPbiBNb24sIE1h
eSA4LCAyMDIzIGF0IDU6MjHigK9QTSBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5
cy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gT24gTW9uLCBNYXkgMDgsIDIwMjMsIEF2aWNoYWwgUmFr
ZXNoIHdyb3RlOg0KPiA+ID4gT24gU2F0LCBNYXkgNiwgMjAyMyBhdCA1OjUz4oCvQU0gTGF1cmVu
dCBQaW5jaGFydA0KPiA+ID4gPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4gd3Jv
dGU6DQo+ID4gPg0KPiA+ID4gPiA+IFRoZSBmaXJzdCB0aGluZyBJIHRyaWVkIHdhcyB0byBzcGxp
dCBvbmUgdmlkZW8gZnJhbWUgb3ZlciAyNjYgZnJhbWVzLCB3aXRob3V0DQo+ID4gPiA+ID4gY2hh
bmdpbmcgdGhlIG51bWJlciBvZiByZXF1ZXN0cyBhbGxvY2F0ZWQuIEFuZCBpdCB3b3JrcyEgSG93
ZXZlciwgYXMgTGF1cmVudA0KPiA+ID4gPiA+IG1lbnRpb25lZCwgaXQgZG9lcyBhZGQgYSBmYWly
IGFtb3VudCBvZiBib29ra2VlcGluZyB0byBzcGxpdCBhIHZpZGVvIGZyYW1lIGludG8NCj4gPiA+
ID4gPiB0aGUgcmVxdWlyZWQgbnVtYmVyIG9mIHJlcXVlc3RzLiBJIGFsc28gaGFyZGNvZGVkIHRo
ZSBudW1iZXIgMjY2IGZyb20gb3VyDQo+ID4gPiA+ID4gZGlzY3Vzc2lvbiwgYnV0IEkgYW0gbm90
IHN1cmUgaG93IHRvIGZpZ3VyZSBvdXQgdGhhdCBudW1iZXIgZHluYW1pY2FsbHkuIDI2Ng0KPiA+
ID4gPiA+IGFsc28gZGlkbid0IHdvcmsgaWYgdGhlIGhvc3Qgc3RhcnRlZCBzZW5kaW5nIGZyYW1l
cyBhdCBtb3JlIHRoYW4gMzBmcHMgOi8sIHNvDQo+ID4gPiA+ID4gb3VyIGR5bmFtaWMgY2FsY3Vs
YXRpb24gd291bGQgbmVlZCB0byB0YWtlIGNhbWVyYSdzIHJlYWwgb3V0cHV0IGZwcyBpbnRvDQo+
ID4gPiA+ID4gYWNjb3VudCwgd2hpY2ggYXMgZmFyIGFzIEkgY2FuIHRlbGwgaXMgbm90IGtub3du
IHRvIHRoZSBVVkMgZHJpdmVyLg0KPiA+ID4gPg0KPiA+ID4gPiBJdCB3b3VsZCBwcm9iYWJseSBu
ZWVkIHRvIG1vbml0b3IgaG93IGZ1bGwgdGhlIHJlcXVlc3QgcXVldWUgaXMsIGFuZA0KPiA+ID4g
PiBhZGFwdCB0aGUgbnVtYmVyIG9mIGJ5dGVzIGl0IHF1ZXVlcyBpbiBlYWNoIHJlcXVlc3QgYWNj
b3JkaW5nbHkuIFRoYXQncw0KPiA+ID4gPiBpbmRlZWQgcXVpdGUgYSBiaXQgb2Ygd29yaywgZm9y
IGxpdHRsZSBnYWluIGNvbXBhcmVkIHRvIHRoZSBvcHRpb24geW91DQo+ID4gPiA+IGRlc2NyaWJl
IGJlbG93Lg0KPiA+ID4gPg0KPiA+ID4gQWdyZWVkLCBlc3BlY2lhbGx5IGlmIHRoZSBob3N0cyBh
bHJlYWR5IGhhbmRsZSAwIGxlbmd0aCBwYWNrZXRzLg0KPiA+ID4gQXMgbG9uZyBhcyB0aGUgdXNi
IGNvbnRyb2xsZXJzIGNhbiBrZWVwIHVwLCB0aGUgYnVyc3QgYXBwcm9hY2ggc2VlbXMNCj4gPiA+
IG1vcmUgcmVhc29uYWJsZS4NCj4gPiA+DQo+ID4gPiA+ID4gV2l0aCB0aG9zZSBpc3N1ZXMgSSB0
cmllZCB3aGF0IExhdXJlbnQgY2FsbGVkIHRoZSAiYnVyc3QiIGFwcHJvYWNoDQo+ID4gPiA+ID4g
KGF0dGFjaGVkIGJlbG93KSwgaS5lLiBzZW5kIHRoZSB2aWRlbyBmcmFtZXMgaW4gYXMgZmV3IHBh
Y2tldHMgYXMgcG9zc2libGUsDQo+ID4gPiA+ID4gYW5kIHRoZW4gcXVldWUgdXAgMCBsZW5ndGgg
cGFja2V0cyB0byBrZWVwIHRoZSBJU09DIHF1ZXVlIGhhcHB5LiBUaGlzIGFwcHJvYWNoDQo+ID4g
PiA+ID4gd29ya3MgcGVyZmVjdGx5IGFzIGZhciBhcyBJIGNhbiB0ZWxsLiBMb2NhbGx5IEkgdHJp
ZWQgd2l0aCBhIExpbnV4LCBXaW5kb3csDQo+ID4gPiA+ID4gYW5kIE1hY09TIGhvc3Qgd2l0aCBu
byBmcmFtZSBkcm9wcyBvciBJU09DIGZhaWx1cmVzIG9uIGFueSBvZiB0aGVtIQ0KPiA+ID4gPiA+
DQo+ID4gPiA+ID4gSW4gdGhlIGN1cnJlbnQgcGF0Y2gsIFVWQyBnYWRnZXQgZHJpdmVyIGtlZXBz
IHRoZSBJU09DIGNhZGVuY2UgYnkgZWZmZWN0aXZlbHkNCj4gPiA+ID4gPiBtYWludGFpbmluZyBh
IGJhY2stcHJlc3N1cmUgb24gdGhlIFVTQiBjb250cm9sbGVyIChhdCBsZWFzdCB0byB0aGUgYmVz
dCBvZiBpdHMNCj4gPiA+ID4gPiBjYXBhYmlsaXRpZXMpLiBBbnkgdXNiX3JlcXVlc3QgYXZhaWxh
YmxlIHRvIHRoZSBVVkMgZ2FkZ2V0IGdldHMgaW1tZWRpYXRlbHkNCj4gPiA+ID4gPiBxdWV1ZWQg
YmFjayB0byB0aGUgVVNCIGNvbnRyb2xsZXIuIElmIGEgdmlkZW8gZnJhbWUgaXMgYXZhaWxhYmxl
LCB0aGUgZnJhbWUgaXMNCj4gPiA+ID4gPiBlbmNvZGVkLCBpZiBub3QsIHRoZSBsZW5ndGggaXMg
c2V0IHRvIDAuIFRoZSBpZGVhIGJlaW5nIHRoYXQgdGhlIGhvc3QncyBwb2xsaW5nDQo+ID4gPiA+
ID4gYW5kIHRoZSBjb250cm9sbGVyJ3MgJ2NvbXBsZXRlJyBjYWxsYmFjayB3aWxsIHJlc3VsdCBp
biBhIHNvbWV3aGF0IGNvbnNpc3RlbnQNCj4gPiA+ID4gPiBjYWRlbmNlIGZvciB0aGUgdXZjIGRy
aXZlciBhZnRlciB0aGUgaW5pdGlhbCBidXJzdCBvZiBwYWNrZXRzLg0KPiA+ID4gPiA+DQo+ID4g
PiA+ID4gSG93ZXZlciB0aGlzIGRvZXMgbWVhbiB0aGF0IGF0IHdvcnN0LCB0aGUgbmV3IHZpZGVv
IGZyYW1lcyBhcmUgdXAgdG8gNjMNCj4gPiA+ID4gPiB1c2JfcmVxdWVzdHMgYmVoaW5kLCBidXQg
YXNzdW1pbmcgYSAxMjV1cyBwZXIgdXNiX3JlcXVlc3QsIHRoYXQgYW1vdW50cyB0byB+OG1zDQo+
ID4gPiA+ID4gbGF0ZW5jeSBhdCB0aGUgd29yc3QsIHdoaWNoIHNlZW1zIGFjY2VwdGFibGU/DQo+
ID4gPiA+DQo+ID4gPiA+IFRoZXJlJ3MgYSB0cmFkZSBvZmYgYmV0d2VlbiBsYXRlbmN5IGFuZCB0
aGUgcmlzayBvZiB1bmRlcnJ1bnMuIFdlIGNvdWxkDQo+ID4gPiA+IGRlY3JlYXNlIHRoZSBudW1i
ZXIgb2YgcXVldWVkIHJlcXVlc3RzIHRvIGxvd2VyIHRoZSBsYXRlbmN5LCBhcyBsb25nIGFzDQo+
ID4gPiA+IHdlIGVuc3VyZSB0aGUgbWFyZ2luIGlzIGhpZ2ggZW5vdWdoIHRvIGF2b2lkIHVuZGVy
cnVucyBpbiBoaWdoZXIgbG9hZA0KPiA+ID4gPiBjb25kaXRpb25zLiBXZSBjb3VsZCBhbHNvIGRv
IHNvIG9ubHkgd2hlbiBxdWV1aW5nIDAtc2l6ZSByZXF1ZXN0cywgYW5kDQo+ID4gPiA+IHF1ZXVl
IHRoZSBkYXRhIGluIGJ1cnN0IG1vZGUgd2l0aCBhIGhpZ2hlciBudW1iZXIgb2YgcmVxdWVzdHMu
DQo+ID4gPg0KPiA+ID4gV291bGQgOG1zIG9mIGxhdGVuY3kgYmUgY29uc2lkZXJlZCBzaWduaWZp
Y2FudD8gVW5sZXNzIHRoZSBob3N0IGFza3MNCj4gPiA+IGZvciA+MTI1ZnBzLA0KPiA+ID4gdGhh
dCBhbW91bnRzIHRvIGxlc3MgdGhhbiBhIGZyYW1lIG9mIGxhdGVuY3ksIHNvIGZyYW1lcyBzaG91
bGQgbm90IGJlIGRyb3BwZWQNCj4gPiA+IGJ5IHRoZSBob3N0IGZvciBiZWluZyAibGF0ZSIuIEFk
bWl0dGVkbHksIEkgZG9uJ3Qga25vdyBlbm91Z2ggYWJvdXQgVVZDIHVzYWdlIHRvDQo+ID4gPiBz
YXkgaWYgOG1zIChhdCB3b3JzdCkgd2lsbCBiZSBwcm9ibGVtYXRpYyBmb3IgY2VydGFpbiB1c2Fn
ZXMuIFRoZQ0KPiA+ID4gaG9zdHMgZG9uJ3Qgc2VlbSB0bw0KPiA+ID4gaGF2ZSBhbnkgaXNzdWVz
IHdoZW4gc3RyZWFtaW5nIGF0IDw9NjBmcHMuDQo+ID4gPg0KPiA+DQo+ID4gRG8geW91IG9ubHkg
cXVldWUgYSBzaW5nbGUgYnVyc3QgYXQgYSB0aW1lPyBXZSBkb24ndCBoYXZlIHRvIHF1ZXVlIGFs
bA0KPiA+IDYzIDAtbGVuZ3RoIHJlcXVlc3RzIGFzIGEgc2luZ2xlICJidXJzdCIgcmlnaHQ/IFdl
IGNhbiBxdWV1ZSBtdWx0aXBsZQ0KPiA+IHNtYWxsZXIgYnVyc3RzIG9mIDAtbGVuZ3RoIHJlcXVl
c3RzLiBUaGlzIHdheSwgdGhlIFVWQyBkcml2ZXIgY2FuIGJlDQo+ID4gaW50ZXJydXB0ZWQgbW9y
ZSBvZnRlbiwgcmVkdWNpbmcgdGhlIHZpZGVvIGRhdGEgbGF0ZW5jeSBpZiBpdCBhcnJpdmVzDQo+
ID4gZWFybGllci4gVGhpcyBrZWVwcyB0aGUgdG90YWwgbnVtYmVyIG9mIHF1ZXVlZCByZXF1ZXN0
cyBzbWFsbGVyIHdoaWxlDQo+ID4gZW5zdXJpbmcgdGhhdCB0aGUgY29udHJvbGxlciBpc24ndCBz
dGFydmVkIG9mIHJlcXVlc3RzIChhcyBsb25nIGFzIHRoaXMNCj4gPiBzbWFsbGVyIGJ1cnN0IGFj
Y291bnRzIGZvciB0aGUgc3lzdGVtIGxhdGVuY3kpLiBUaGUgdHJhZGVvZmYgaGVyZSBpcw0KPiA+
IGp1c3QgdGhlIFVWQyBnYWRnZXQgZHJpdmVyIG5lZWRzIHRvIGhhbmRsZSByZXF1ZXN0IGNvbXBs
ZXRpb24gYSBsaXR0bGUNCj4gPiBtb3JlIG9mdGVuLiBIb3dldmVyLCB3ZSBhcmUgbGVzcyBsaWtl
bHkgdG8gYmUgdW5kZXJydW4gbm8gbWF0dGVyIHRoZQ0KPiA+IHZpZGVvJ3MgZnBzLg0KPiANCj4g
VGhlIHBhdGNoIGRvZXMgY3VycmVudGx5IHF1ZXVlIGFsbCA2NCAwLWxlbmd0aCBwYWNrZXRzIGZy
b20gdGhlIHN0YXJ0LA0KPiBhbmQgdGhlbiByZWxpZXMgb24gY29tcGxldGlvbiBjYWxsYmFja3Mg
dG8gbWFpbnRhaW4gYSBzdGVhZHkgc3RhdGUuIEl0DQo+IHN0aWxsIHNldHMgdGhlIGBub19pbnRl
cnJ1cHRgIGZsYWcsIHNvIHRoZSBjb21wbGV0aW9uIGNhbGxiYWNrDQo+IGludGVycnVwdHMgZXZl
cnkgfjE2dGggcmVxdWVzdCAoYXQgd29yc3QpIHdoaWNoIGlzIHRoZSBzYW1lIGFzIGJlZm9yZS4N
Cg0KSSBzZWUsIHRoYXQncyBnb29kLiBJIHRob3VnaHQgdGhlcmUncyBvbmx5IDEgb3V0IG9mIDY0
IHJlcXVlc3RzIHdpbGwNCmhhdmUgY29tcGxldGlvbiBpbnRlcnJ1cHQuDQoNCj4gSWRlYWxseSwg
dGhlIFVWQyBkcml2ZXIgbmV2ZXIgc2l0cyBvbiBhIHZpZGVvIGZyYW1lIGZvciBsb25nZXIgdGhh
biAxNg0KPiByZXF1ZXN0cywgYnV0IGl0IGRvZXMga2VlcCB0aGUgY29udHJvbGxlciBxdWV1ZSBh
cyBmdWxsIGFzIGl0IGNhbiwNCj4gd2hpY2ggbWVhbnMgdGhlIHZpZGVvIGZyYW1lIGNvdWxkIGJl
IHN0dWNrIGJlaGluZCBhIGJ1bmNoIG9mIDAtbGVuZ3RoDQo+IHBhY2tldHMgYW5kIGNvdWxkIGh5
cG90aGV0aWNhbGx5IGJlIHNlbnQgZmFzdGVyIGlmIHdlIHdlcmUgdG8gYmUNCj4gc21hcnRlciB3
aXRoIHF1ZXVpbmcgdGhlIDAtbGVuZ3RoIHJlcXVlc3RzLiBJIHNheSBoeXBvdGhldGljYWxseSwN
Cj4gYmVjYXVzZSBJIGhhdmUgYmVlbiB1bmFibGUgdG8gY2FwdHVyZSBhbnkgbGF0ZW5jeSBkaWZm
ZXJlbmNlcyB3aXRoIGFuZA0KPiB3aXRob3V0IHRoZSBwYXRjaC4NCj4gDQo+IEkndmUgYmVlbiB0
cnlpbmcgdG8gdGhpbmsgb2Ygc29tZSB3YXkgdG8gYWNjb3VudCBmb3Igc3lzdGVtIGxhdGVuY3kN
Cj4gYW5kIG9ubHkgcXVldWUgYSBzbWFsbGVyIHNldCBvZiAwIGxlbmd0aCBwYWNrZXRzLCBidXQg
bW9zdCBvZiB0aGVtDQo+IGJvaWwgZG93biB0byAiaG9wZSB3ZSBoYXZlIGVub3VnaCByZXF1ZXN0
cyBxdWV1ZWQiLiBJdCB3b3VsZCBiZQ0KPiBoZWxwZnVsIGlmIHdlIGNvdWxkIHBpbiBzb21lIG51
bWJlcnMgZG93biB0aGF0IGNhbiBiZSByZWxpZWQgb24gYnkgdGhlDQo+IGdhZGdldCBkcml2ZXIu
IEZvciBleGFtcGxlOiBDYW4gMTI1dXMgcGVyIHJlcXVlc3QgYmUgc2FmZWx5IGFzc3VtZWQ7DQo+
IG9yIGlzIHRoZXJlIGEgd2F5IHRvIGdldCBpbmZvcm1hdGlvbiBhYm91dCBob3cgbG9uZyBhIHVz
Yl9yZXF1ZXN0IHdpbGwNCj4gbGFzdCBmb3I/IEl0IHdvdWxkIGJlIHZlcnkgaGVscGZ1bCBpZiB0
aGVyZSB3YXMgYSB3YXkgdG8gcXVlcnkgdGhlDQo+IGNvbnRyb2xsZXIncyBhY3RpdmUgcXVldWUs
IGJ1dCBJIGNvdWxkbid0IHJlYWxseSBmaW5kIGFueXRoaW5nIGluIHRoZQ0KPiBBUElzLiBXZSBj
YW4ndCByZWFsbHkgcmVseSBvbiB0aGUgY29tcGxldGUgY2FsbGJhY2tzIGJlY2F1c2Ugb2YgdGhl
DQo+ICJub19pbnRlcnJ1cHQiIGZsYWcuIEknbGwgdHJ5IG91dCBzb21lIHRoaW5ncywgYW5kIGdl
dCBiYWNrLiBJZiB5b3UNCj4gaGF2ZSBhbnkgaWRlYXMsIEkgd291bGQgbG92ZSB0byBoZWFyIHRo
ZW0gdG9vIQ0KPiANCg0KSWYgIm5vX2ludGVycnVwdCIgaXMgc2V0LCBpdCBqdXN0IG1lYW5zIHRo
ZSBnYWRnZXQgZHJpdmVyIHdpbGwgbm90IGdldCBhDQpub3RpZmljYXRpb24gb2YgdGhlIHJlcXVl
c3QgY29tcGxldGlvbi4gSXQgbWF5IGhlbHAgdG8gdGhpbmsgaW4gdGVybSBvZg0KdGhlIG1vdmlu
ZyBjdXJyZW50IHVmcmFtZSBzaW5jZSBpdCdzIHByZWRpY3RhYmxlIGFuZCBzdGVhZGlseQ0KcHJv
Z3Jlc3NpbmcuIEVhY2ggcXVldWVkIHJlcXVlc3QgaXMgZWFybWFya2VkIGZvciBhIGZ1dHVyZSB1
ZnJhbWUuIE9uY2UNCnRoZSBjdXJyZW50IHVmcmFtZSBtYXRjaGVzIHRoZSBzY2hlZHVsZWQgdWZy
YW1lIG9mIHRoZSByZXF1ZXN0LCB0aGUNCnJlcXVlc3QgaXMgY29tcGxldGVkIHJlZ2FyZGxlc3Mg
dGhlcmUncyBhIG1pc3NlZCBpc29jIG9yIHdoZXRoZXIgdGhlDQpub19pbnRlcnJ1cHQgaXMgc2V0
IChncmFudGVkIGl0J3Mgbm90IHN0YWxlKS4NCg0KVGhlIHN5c3RlbSBsYXRlbmN5IGludHJvZHVj
ZXMgZGVsYXkgaW4gdGhlIGludGVycnVwdCBoYW5kbGVyIGFuZCB0aGUNCmhhbmRsaW5nIG9mIGl0
LiBJbiBvdGhlciB3b3Jkcywgd2UgKmtub3cqIHRoZSBtaW5pbXVtIHRpbWUgZm9yIHRoZQ0KcmVx
dWVzdCBjb21wbGV0aW9uLCBidXQgd2UgY2FuJ3QgZ3VhcmFudGVlIHRoZSB0aW1lIHRoZSBnYWRn
ZXQgZHJpdmVyDQp3b3VsZCByZWNlaXZlIGFuZCBmaW5pc2ggaGFuZGxpbmcgdGhlIHJlcXVlc3Qg
Y29tcGxldGlvbiBpbnRlcnJ1cHQuIFRoaXMNCnZhcmllcyBiZXR3ZWVuIGRpZmZlcmVudCBzZXR1
cHMuIEFuIGVycm9yIGR1ZSB0byBzeXN0ZW0gbGF0ZW5jeSBzaG91bGQNCm5vdCBiZSBhIGZyZXF1
ZW50IG9jY3VycmVuY2UuIEFzIGxvbmcgYXMgaXQncyB3aXRoaW4gYW4gYWNjZXB0YWJsZQ0KdGhy
ZXNob2xkLCBpdCBzaG91bGQgYmUgZmluZS4gSSB0aGluayB5b3VyIDhtcyBkZWxheSBpcyBmaW5l
LCBwb3NzaWJseQ0KNG1zIG1heSBiZSBtb3JlIHRoYW4gZW5vdWdoLiBJIGhhdmVuJ3QgaGFkIHRv
IGRlYWwgd2l0aCBtb3JlIHRoYW4gM21zDQpkZWxheSBpbiBvdXIgaGFyZHdhcmUgdGVzdGluZ3Mg
KHdpdGggbXVsdGlwbGUgZW5kcG9pbnRzIGFuZCBkZXZpY2VzKS4NCg0KSSBob3BlIHRoaXMgaW5m
byBpcyBuZXcgYW5kIHVzZWZ1bCwgb3RoZXJ3aXNlIEkgbWF5IHNvdW5kIGxpa2UgYSBicm9rZW4N
CnJlY29yZC4NCg0KTm90ZTogd2UgY2FuIGFsd2F5cyBlbmhhbmNlIFVWQyBhZ2FpbiBzaG91bGQg
YW55b25lIHJlcG9ydCBuZXcgaXNzdWUNCmluIHRoZWlyIHRlc3Rpbmcgb25jZSB5b3VyIGNoYW5n
ZSBpcyB1cHN0cmVhbWVkLg0KDQpCUiwNClRoaW5oDQo=
