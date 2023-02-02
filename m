Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EED66887C1
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 20:48:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232209AbjBBTsz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 14:48:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbjBBTsv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 14:48:51 -0500
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85C0A6AC99
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 11:48:50 -0800 (PST)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 312GX2Er015514;
        Thu, 2 Feb 2023 11:48:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=KSFio5lL92oUzT1fN8j3pSXK2LmvJFuAhguaavrNGhU=;
 b=AVpgEh5/9bjHS64QKvWdEsAuvQ8TcVJnKcO7G+ik318MUq/RWJ1RshsK2Gf2qhHQzZwG
 GN83W83EAvI3Bnq62ki7NZaAV6IPOSLRmQQEGilN/EWViMSA8d5dq8ZZ+yRQF6Mz9tIS
 BlkDynRyVWrxXqssXDvYZEqGcsobTb0tynUTUjoMcZgujmrnTFVxTVC7ia2z+t/0ymgX
 60y3doZgo9glxW/2HjXXgSRHgAI7eGjJV9MlUNOH+wdHCirF5uqIbi7UeyHw1jFzaQHJ
 skbbcxJpYzZtqPZNWkmRxoQDcIrAsrkm4kOEkI0NNlo43FA3u/n152pG5oJUFNhUsGGb 0g== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3nfp8kt2h7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 02 Feb 2023 11:48:34 -0800
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 53D9B400CE;
        Thu,  2 Feb 2023 19:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1675367313; bh=KSFio5lL92oUzT1fN8j3pSXK2LmvJFuAhguaavrNGhU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=HBRuwg/ScGKNxwChg1D0jHo/U/8l1OAu4jzwg/ms8/BwnqhegQUUz3q+JRxWpqZ6B
         Xp9ddP9KJdx8aL0Vlpvd2B8QH7mcAP8r22hHnoyPDY3a+U891UTFBklX6FJVjxhYnQ
         KsdxFdGUyuWQI2L/cnWCCY+SnlOuq32PLWwgFVpwBaH0qdM9WgwQmQjnQKfJj99M9A
         RhG5Gh3b1TPKkcx2jlTD4+qWjtikiNr/J5viKt1r64Ui9+FZnJuyh4dOYi6OqGCj6b
         8DEY/9dIeeRiYspr3v1Si1Ty4u/B8FfZEFYcAqU7/GfoQYN1sWP4nqL73oclzvAMF4
         cm7W1LhH9v9Hw==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id D3438A006E;
        Thu,  2 Feb 2023 19:48:32 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0752D40106;
        Thu,  2 Feb 2023 19:48:31 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="h0VfD0AH";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOx92rruX9GpSIQoOCyjWlRB14Cob6abz2g6tAhmaHGch7Asws/lmtnncAjNrScIlNpNrZ8wNur/nsypiJIRZqZ8SWbiHYsfgqdioY0leNawQRflAnMRkL2Vkba6j4fUSpiMqi1T04dfwpowga/Jjt3Hkhnmw9RmFhK9ByfmCOpffCFTetjilHie5Bv4doCt2cWCAZSE7TYAMm38bPVdpP2mPxoRDi/GJC8Y+I+KxrNd3QBfQkRzv8n/S4/EF/PgC4vlFnARwiVqbZzmO4PmgbKs849Hn5cIfLHLDxHm+OEpL8B5zoTMJv5xskDvHPZtjekAk775PdWyF+8RiD9ViA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSFio5lL92oUzT1fN8j3pSXK2LmvJFuAhguaavrNGhU=;
 b=Y9Yni/ZhbNw+lEd52TTmOvEeW/aZ8zkUWT4kNYeRMqXkMqtUK6B6TbNHYHpmGL5GhI1LAjj2bAau/iNfjMcllFzE+mUNmb/k7vhsrhbgF7YQx5mQ34Joqum8n+yacWA9n6CuhotLVhXqHhsolUGGiss3zbwF3REmXxOvsdPoxCiM+N3kzbEE1ZFrhi3NcV2NEGMwnMtonFpWjdEQpXbgUsJj9EDg9D1cwrg1GUFT/esohpL1/NwQ2Dy79esaJOKpi6XyHRCn/AtWboTVzJADPe1A1V9J8/iI18HAgDOn7x9xPLB8JDhgys1kzj3Tbiyz9rMhOwuhbW54DXcbt8281w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSFio5lL92oUzT1fN8j3pSXK2LmvJFuAhguaavrNGhU=;
 b=h0VfD0AHf8/bXlfrV3QKJqNDbz+06nq0HeEBuB30NgmTMpU6DnJ83UFS130avkSlRF6O5ofUGbtPsh0QDH8OxCRFOjvc3b6oY/Nh3dE4whe1+6yMD5IJrKo5T4K5acYRAeJva0A6wMMyDENmfrvyo/7MyllUqAH2vjb5W+36jBU=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by CH0PR12MB5204.namprd12.prod.outlook.com (2603:10b6:610:bb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Thu, 2 Feb
 2023 19:48:29 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::6f3c:bd8e:8461:c28c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::6f3c:bd8e:8461:c28c%7]) with mapi id 15.20.6043.038; Thu, 2 Feb 2023
 19:48:29 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Dan Scally <dan.scally@ideasonboard.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "rogerq@kernel.org" <rogerq@kernel.org>
Subject: Re: Explicit status phase for DWC3
Thread-Topic: Explicit status phase for DWC3
Thread-Index: AQHZL//6d6BOk0ADk0qR28S95Y3SOq6v1++AgACqcgCAAJc0gIAAENSAgAA5XgCAChoCgIAATjAAgAAOwQCAAA5tAIAANXaA
Date:   Thu, 2 Feb 2023 19:48:29 +0000
Message-ID: <20230202194823.jqhyevhbjw3x7sen@synopsys.com>
References: <9ce226b4-90c6-94c4-a5ad-bd623409bc51@ideasonboard.com>
 <20230126002017.tbxc3j6xdgplncfs@synopsys.com>
 <dda24f8e-8d74-c6c1-ae7c-e423bc50a143@ideasonboard.com>
 <20230126193131.ifaj7arsrrgesjh5@synopsys.com>
 <Y9LjMcO/7/VUNld3@rowland.harvard.edu>
 <20230126235704.62d32y7y4sa4mmry@synopsys.com>
 <43b077ad-c8cd-bb49-134d-1bd66bed0b84@ideasonboard.com>
 <Y9vONL8ZyQdEVkr0@rowland.harvard.edu>
 <9da07e03-7cd2-cfeb-8c67-4562948aa948@ideasonboard.com>
 <Y9vmrgeblXC7zeQj@rowland.harvard.edu>
In-Reply-To: <Y9vmrgeblXC7zeQj@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|CH0PR12MB5204:EE_
x-ms-office365-filtering-correlation-id: 5c5ec7cd-1ca1-4d0f-8b1b-08db05567500
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rf17JgFF/p4XHa5m5WgWZr2DsHGXEgkImf46O30uiuuy6ajfTxMZiuIeuJFFjej3KgNI2Y1w/iJ8BqyHzal67coH1lDowqwWGowCCJhzQZ+7cWLtMGJLl9i/xc1fAALyHEACZJGSDlIgVLBaf3G7514cKPRZIbkWeuxrjaUoTiojyn2vXRr3LgU7fJa48DbH0YVIIs9Gu+e5EGbLHrqg7mQEmOljLF5oDveqCcBO8F2kEXT7FtcwckAY3Sg+7iMBxdpn8aRHfRhJZ9iFgfpePDhTyNONI1Lp5vqlzk9/KNnVqi8v1JYpIH/3SBBtH7n2wMWZohjfPI6zxLdHEXK/oGZjBvjJ2K0y82w+3qXnQOIj1PM9nUU8lWSaEgTJ1ejWUpgkl8hMz1TTCbYcOkjRwfgdOmiQCCQhtgaPdBiVHo7Okr/uhIBIBvv48891xdWGDvH2RD1k3/CfPAkUCMddtElx4yfKBCkdbbnBubtTfVQGKx8CesAHJYNmTSA8mE22dXa+8BurWOzWtROffQRtpMoHp09LyjOt0oNE422fTwEZt+xZRLBaMBkudvDgGSbktsT3tcx/6Y3x18cE/JgL7pemDP+B5aeIRIgzBeB7KB3K76pWNi8bHP3ncUMBTBHThue+8sqM8d59lWFV3rm21zidbtAD2otSuO18hZoVq0Fwo+j7ZijGG4Ug7+p1gYCTX/B59sMm6HiiFZWoRnLppFjCUtml1Lzpm76+WINkAPM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(396003)(136003)(39860400002)(376002)(451199018)(36756003)(478600001)(66556008)(76116006)(122000001)(38100700002)(4326008)(8676002)(64756008)(66476007)(83380400001)(6916009)(54906003)(316002)(66446008)(1076003)(6506007)(6512007)(26005)(71200400001)(186003)(53546011)(966005)(66946007)(41300700001)(5660300002)(6486002)(86362001)(2616005)(38070700005)(8936002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aCtHcVZaNXUyZ0xYUDk5eG1NYU1jK1pUSnNtU1dQSVdpSjl0Lzk0R3M4WFg5?=
 =?utf-8?B?KzJoc25wNFdjdnR0enludWJnQ3RaM1Mva1JickVQYzc2RFdmM0hZR0tIb1FI?=
 =?utf-8?B?VUhQR3lNc2thU0dTQnkydm9qQXJGUnAvWVhOcmYveE1JdXg0ODFiOXhta0w2?=
 =?utf-8?B?ckpLVFhTWnN6NFVhUlZERjdiSTNqbnBLcW85WHpQa2NYSExLNWhsQTZ5dzkr?=
 =?utf-8?B?L0R5QkdNY3N1eEdQTjZueG5GQWZrdCsvbk5iR2RCc2FicHpuWm55dDk5Szg0?=
 =?utf-8?B?M25DcE0xY3J4OHgyT01zZ3RLMUJ2NU9Nb3l2MVRHWGp5MzA4Sjh6elR2WmtX?=
 =?utf-8?B?TkJpcHVmdzVFditOQVE5MlJIUmFaZnNLUDhwRHhCejdhV2hYYStFbWtCNTZn?=
 =?utf-8?B?TkdaNFhZbVk4WnBjYmFxZE1DR0ZYVWpsajJtemRMaFJORVovWWR2T29GWE5H?=
 =?utf-8?B?U2l1cmtKNUJNWm13R3FtMFFtQ0c2T0RWWHRZTXdRZ2YydHNKajRsekI1bmp1?=
 =?utf-8?B?L2YyazRGemh3cklrL1FrSEQzUVdmcFA1VC80K1VoaXBWYWR4U2VWQVhPWXk3?=
 =?utf-8?B?ZGYzalNzU3Q2elFxMGducERLMlJsdmZXVW1MWldNSEtwL0lkTHZydmxXS0FZ?=
 =?utf-8?B?R0Zrd3VIVzk0dlowOFlzcDZDalBXZzdYWkdwWHMvYkxaUkhYQklxdFRZRlJ0?=
 =?utf-8?B?ZXMva1ZPV3lMclV4WDRVZHhHcXRTUFFETy9hbkRWUDkvR04rdkVQenU2YmV1?=
 =?utf-8?B?MHg2dzdWUDQwVVlXVVY1Y0J2ZEFsdGwwSzdrRFZ0Q1JtLzV5bGsxbWMrOEE3?=
 =?utf-8?B?Q0ZjKzNaL1Y2bVJtaUhMS3Q1VXRObERUN09qSWh6NHVYWlVORDJhbmlRM2sv?=
 =?utf-8?B?SnV6MmROLzZwWU1GS0poYjJtenV6bUxxMmc0RjJRbVRGSlVYV05ZKzV1VnJs?=
 =?utf-8?B?RjFEZ2pCYmtYT1FPS1RjTUZEVHlsQW13QUNKUXViaTdyVER6NTZBSEZQOStH?=
 =?utf-8?B?MjBPQ2pyaFA3YUR3dVAxNHVGU2thUm1FMVlsdjhoaWl3T1JFK0tzL01hV0dz?=
 =?utf-8?B?R3crbzEyMXBEbkhoRVQ3NHNlcU9WMzI3ckZjd3h4UzhTMnBmN240UFI3Y01z?=
 =?utf-8?B?Yjk4ZDAzaWhhcHJZL29YK1FxWlpjbUZQWDVHV0J2OGpNYXhsbzM4dDI5VUY4?=
 =?utf-8?B?elp1TzdkRGprclNjYXdSN2pRTUJpOXZDWCtJU0x2QmVIRHQzNElvMWV0d25F?=
 =?utf-8?B?K3JXb3ZTUmpLLzA1UnB1MVlBc1FzNThxaDBCQmZVM0xFWjhVUElianlWdjhk?=
 =?utf-8?B?eDArV0FQMmJicjJlNWxLZit3bTEyVUNnVnJGTHU3T2h1dTY0SW1UTnFUWGhk?=
 =?utf-8?B?OTloamx0QWxkWkNmU0FSQ1BQRWtMaVQ2ZUNUcUtUbmdoTzc2UFFERXltRGY4?=
 =?utf-8?B?NjF3S1hNdUg5QWdZdUJXRUh4dG1KNFkzQU12V3VVbEw0L0lwVDVqY0NkMVYx?=
 =?utf-8?B?bDBtWFZoK05kc2dEcFFiYlcxTnBJUVBIMXRuRmc1a01XZ1Y0RHB5UWM2aFFm?=
 =?utf-8?B?T1E2VHNkb1FCcEZoRitCV1VvZi9MZUJuRWxhdS9jTGpVVzFmMlZnNXU4YWVQ?=
 =?utf-8?B?ZkRES0VjN0o0REpXY2FrYzhRWFdiOHVPWHpOSXV1ZmtiVk80UmJ1TnNkUllZ?=
 =?utf-8?B?MmNNbXFGQ2JWdzlkRWhiaVdJWWoxT1d3aC9OZGE2ckRycmxBYU9NSjBRMGRY?=
 =?utf-8?B?V2hwN2djVzFmSE5TVWM2eW9IK3E4NmEwazJVbkdibk1zVjFxQ05DNmJwN0hp?=
 =?utf-8?B?aGQzMDFQbzF3Rk1vdXhranVPQ1ZyR1JRVlluR1llMEhkbWYwRTRCeGFFdnNv?=
 =?utf-8?B?dmlrWFZndnBPaEt5aE56UWJQVUcyWWZGQTJ2MHhodDhrZDVqc25DeXYvcFRx?=
 =?utf-8?B?Y0N4RGd2M0hGcEVwcytmcWhndDgzN2MvYllOdVIyQ0hYSFZ1ZDNBV2g1MDJC?=
 =?utf-8?B?K0tZWHh0d0JRTG5kYjN0Y0kyUUhCMmZjdW9DOUgxMXdVSkRHSFF2Y3lyMVFn?=
 =?utf-8?B?QWc0aU8rL2tZSWhiWjdaK0t6VU5PNHBCdmxxTHFLejJsK2xMdm9ScGJ3cldK?=
 =?utf-8?B?SkNQbTVUNFBEbnA2OFVCQ0YwbDh3eFRGTk1UYXV5VnkyOVBPTWxaZGoxWWlE?=
 =?utf-8?B?TVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C358816600A2F42857AA837F18DB7F6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: DV3IwQnd8YFJbhY9IX/uV4bQU541zANzM+brEurcQDw6V6Fr0bq2tnvJFSA2gdXCnBVQtWNqKb+MCL+Q3cCOynHaDAbNgotj6yEf7Txw2J9spVCKrrOUcNgfxaZU7O03hdgB3FxSctmGzwclGBt3/KaBC3DwwAhHZZcCXG/6YnjQwL9N9/HvN5N7mazEHvrsugGPCkV5vfpj8SBJ+DnFur5P+eW7BiUp1/WdCwzgD0CM0KzFja3+5MlEl5RgjJ7KqjEl3aaiHbS3kmw7qdexHzfD9HiankO/v4mBuWy7afYUL63z3fIfg09rq1HQVix2vPwAzgyq9YcLNOk4YAm6B/+NIRWo6+3VPIjFRhePb2eS6g4n9a3/oT757Tj9QIeA4HfySLp4wegJwzY7NH3KUoBT3ustzW1lKkI3xU8bxraYtmaiiS9AM7Jzr76XSLrmTTYPPI0svR0UkFH028sGzVvyc//kYEOCtdlFERBFUP1RrKEleL35/tCX1rRbv0zT/rFogWs7SbJWnYDjc/hwodNwkTLY1WyjureD80F9J/0r73opuTmypx2SUUdN+T9C7cFfUT90ER57I1CpIw3ixZgFN5ky5Rbd8deeTP4Sormo0YTu0iGFVf+fe7lxiYmqPdPHdSOExmFTPlzDzDOWq0cQm+ByeBGd4pP/nYigi3JOjaspf3/lsJ06IxsXPnqwDKY7IScZ9/Xv4XJqvBNkMKvE9xAwYzXTzt3uV8Xexdr2V9X/tnG+yk2YMCRflgwIhVzPi3axiGOfWzJn1N4KIaiFQMs3g9kf5NP6tSmgXxptPcAd5UaCSbYHEKNWEvj1PulMMd5pyvtaWlo04z9y+zMhck8wo2qw85CTMOIO5QMhaCtBh1Vd5j6K3az9MEtt4vGkssZEkkc2D2OaG8V4afFF4c65aT21OsGkd+vMnhQ=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c5ec7cd-1ca1-4d0f-8b1b-08db05567500
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 19:48:29.0884
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rgc87feuP3XMWaoYx9daFY7O361yb0SKK88ze5eAjEurk+xSiyPgrHuMu/u5IvvZ3KANiax7gKgBgN7zMZJz8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5204
X-Proofpoint-ORIG-GUID: uavlnYJSMGXgyDBI7CWAU3ZWGU0LAv6J
X-Proofpoint-GUID: uavlnYJSMGXgyDBI7CWAU3ZWGU0LAv6J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_14,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 priorityscore=1501 spamscore=0 clxscore=1011 suspectscore=0
 impostorscore=0 mlxlogscore=990 lowpriorityscore=0 phishscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302020176
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCBGZWIgMDIsIDIwMjMsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+IE9uIFRodSwgRmViIDAy
LCAyMDIzIGF0IDAzOjQ1OjI0UE0gKzAwMDAsIERhbiBTY2FsbHkgd3JvdGU6DQo+ID4gDQo+ID4g
T24gMDIvMDIvMjAyMyAxNDo1MiwgQWxhbiBTdGVybiB3cm90ZToNCj4gPiA+IE9uIFRodSwgRmVi
IDAyLCAyMDIzIGF0IDEwOjEyOjQ1QU0gKzAwMDAsIERhbiBTY2FsbHkgd3JvdGU6DQo+ID4gPiA+
ICgrQ0Mgcm9nZXIgYXMgdGhlIGF1dGhvciBvZiB0aGUgVVNCX0dBREdFVF9ERUxBWUVEX1NUQVRV
UyBtZWNoYW5pc20pDQo+ID4gPiA+IA0KPiA+ID4gPiBPbiAyNi8wMS8yMDIzIDIzOjU3LCBUaGlu
aCBOZ3V5ZW4gd3JvdGU6DQo+ID4gPiA+ID4gV2Ugc2hvdWxkIGFscmVhZHkgaGF2ZSB0aGlzIG1l
Y2hhbmlzbSBpbiBwbGFjZSB0byBkbyBwcm90b2NvbCBTVEFMTC4NCj4gPiA+ID4gPiBQbGVhc2Ug
bG9vayBpbnRvIGRlbGF5ZWRfc3RhdHVzIGFuZCBzZXQgaGFsdC4NCj4gPiA+ID4gDQo+ID4gPiA+
IFRoYW5rczsgSSB0cmllZCB0aGlzIGJ5IHJldHVybmluZyBVU0JfR0FER0VUX0RFTEFZRURfU1RB
VFVTIGZyb20gdGhlDQo+ID4gPiA+IGZ1bmN0aW9uJ3MgLnNldHVwKCkgY2FsbGJhY2sgYW5kIGxh
dGVyIChhZnRlciB1c2Vyc3BhY2UgY2hlY2tzIHRoZSBkYXRhDQo+ID4gPiA+IHBhY2tldCkgZWl0
aGVyIGNhbGxpbmcgdXNiX2VwX3F1ZXVlKCkgb3IgdXNiX2VwX3NldF9oYWx0KCkgYW5kIGl0IGRv
ZXMgc2VlbQ0KPiA+ID4gPiB0byBiZSB3b3JraW5nLiBUaGlzIHN1cnByaXNlcyBtZSwgYXMgbXkg
dW5kZXJzdGFuZGluZyB3YXMgdGhhdCB0aGUgcHVycG9zZQ0KPiA+ID4gPiBvZiBVU0JfR0FER0VU
X0RFTEFZRURfU1RBVFVTwqAgaXMgdG8gcGF1c2UgYWxsIGNvbnRyb2wgdHJhbnNmZXJzIGluY2x1
ZGluZw0KPiA+ID4gPiB0aGUgZGF0YSBwaGFzZSB0byBnaXZlIHRoZSBmdW5jdGlvbiBkcml2ZXIg
ZW5vdWdoIHRpbWUgdG8gcXVldWUgYSByZXF1ZXN0DQo+ID4gPiA+IChhbmQgcG9zc2libHkgb25s
eSBmb3Igc3BlY2lmaWMgcmVxdWVzdHMpLiBSZWdhcmRsZXNzIHRob3VnaCBJIHRoaW5rIHRoZQ0K
PiA+ID4gPiBjb25jbHVzaW9uIGZyb20gcHJldmlvdXMgZGlzY3Vzc2lvbnMgb24gdGhpcyB0b3Bp
YyAoc2VlIFsxXSBmb3IgZXhhbXBsZSkgd2FzDQo+ID4gPiA+IHRoYXQgd2UgZG9uJ3Qgd2FudCB0
byByZWx5IG9uIFVTQl9HQURHRVRfREVMQVlFRF9TVEFUVVMgdG8gZG8gdGhpcyB3aGljaCBpcw0K
PiA+ID4gPiB3aHkgSSBoYWQgYXZvaWRlZCBpdCBpbiB0aGUgZmlyc3QgcGxhY2UuIEEgY29sbGVh
Z3VlIG1hZGUgYSBzZXJpZXMgWzJdIHNvbWUNCj4gPiA+ID4gdGltZSBhZ28gdGhhdCBhZGRzIGEg
ZmxhZyB0byB1c2JfcmVxdWVzdCB3aGljaCBmdW5jdGlvbiBkcml2ZXJzIGNhbiBzZXQgd2hlbg0K
PiA+ID4gPiBxdWV1aW5nIHRoZSBkYXRhIHBoYXNlIHJlcXVlc3QuIFVEQyBkcml2ZXJzIHRoZW4g
cmVhZCB0aGF0IGZsYWcgdG8gZGVjaWRlDQo+ID4gPiA+IHdoZXRoZXIgdG8gZGVsYXkgdGhlIHN0
YXR1cyBwaGFzZSB1bnRpbCBhZnRlciBhbm90aGVyIHVzYl9lcF9xdWV1ZSgpLCBhbmQNCj4gPiA+
ID4gdGhhdCdzIHdoYXQgSSdtIHRyeWluZyB0byBpbXBsZW1lbnQgaGVyZS4NCj4gPiA+ID4gDQo+
ID4gPiA+IA0KPiA+ID4gPiBbMV0gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8v
bGttbC5vcmcvbGttbC8yMDE4LzEwLzEwLzEzOF9fOyEhQTRGMlI5R19wZyFlZ0M1N0V4eTJXc2Y1
bFJ6bFVMdTZEM0UzZmM4U3ZneDVUbkZzbUIzRW0xS1g3T29hRW5tRDZkV19sOF9HNHB6eWJyUFlo
RHFYZlo2ZjdYb0VaVlhLcVVnNGs1diQgDQo+ID4gPiA+IA0KPiA+ID4gPiBbMl0gaHR0cHM6Ly91
cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9s
aW51eC11c2IvcGF0Y2gvMjAxOTAxMjQwMzAyMjguMTk4NDAtNS1wYXVsLmVsZGVyQGlkZWFzb25i
b2FyZC5jb20vX187ISFBNEYyUjlHX3BnIWVnQzU3RXh5MldzZjVsUnpsVUx1NkQzRTNmYzhTdmd4
NVRuRnNtQjNFbTFLWDdPb2FFbm1ENmRXX2w4X0c0cHp5YnJQWWhEcVhmWjZmN1hvRVpWWEtyQy1F
U1NrJCANCj4gPiA+IEknbSBpbiBmYXZvciBvZiB0aGUgZXhwbGljaXRfc3RhdHVzIGFwcHJvYWNo
IGZyb20gWzJdLiAgSW4gZmFjdCwgdGhlcmUNCj4gPiA+IHdhcyBhIHdob2xlIHNlcmllcyBvZiBw
YXRjaGVzIGltcGVtZW50aW5nIHRoaXMsIGFuZCBJIGRvbid0IHRoaW5rIGFueSBvZg0KPiA+ID4g
dGhlbSB3ZXJlIG1lcmdlZC4NCj4gPiANCj4gPiANCj4gPiBZZXAsIEknbSBwaWNraW5nIHRoYXQg
c2VyaWVzIHVwIGFuZCB3YW50IHRvIGdldCBpdCBtZXJnZWQuDQo+ID4gDQo+ID4gPiBLZWVwIGlu
IG1pbmQgdGhhdCB0aGVyZSBhcmUgdHdvIHNlcGFyYXRlIGlzc3VlcyBoZXJlOg0KPiA+ID4gDQo+
ID4gPiAJU3RhdHVzL2RhdGEgc3RhZ2UgZm9yIGEgY29udHJvbC1JTiBvciAwLWxlbmd0aCBjb250
cm9sLU9VVA0KPiA+ID4gCXRyYW5zZmVyLg0KPiA+ID4gDQo+ID4gPiAJU3RhdHVzIHN0YWdlIGZv
ciBhIG5vbi0wLWxlbmd0aCBjb250cm9sLU9VVCB0cmFuc2Zlci4NCj4gPiA+IA0KPiA+ID4gVGhl
IFVTQl9HQURHRVRfREVMQVlFRF9TVEFUVVMgbWVjaGFuaXNtIHdhcyBtZWFudCB0byBoZWxwIHdp
dGggdGhlDQo+ID4gPiBmaXJzdCwgbm90IHRoZSBzZWNvbmQuICBleHBsaWNpdF9zdGF0dXMgd2Fz
IG1lYW50IHRvIGhlbHAgd2l0aCB0aGUNCj4gPiA+IHNlY29uZDsgaXQgbWF5IGJlIGFibGUgdG8g
aGVscCB3aXRoIGJvdGguDQoNCldoaWxlIHdlIG1heSBub3QgaGF2ZSBhIGNvbnZlbmllbnQgZnVu
Y3Rpb24gdG8gZG8gdGhlIHN0YXR1cyBjb21wbGV0aW9uLA0KdGhlIGdhZGdldCBkcml2ZXIgY2Fu
IGFsd2F5cyB1c2UgdGhlIHNhbWUgbWVjaGFuaXNtIGZvciBkZWxheWVkIHN0YXR1cw0KYW5kIGV4
cGxpY2l0bHkgcXVldWUgdGhlIHN0YXR1cyBzdGFnZSBvbiB0aGUgT1VUIGRhdGEgY29tcGxldGlv
bi4gVGhlDQpkd2MzIGRyaXZlciBzaG91bGQgYWxyZWFkeSBiZSBhYmxlIHRvIGhhbmRsZSB0aGF0
LiBIb3dldmVyLCBpdCdzIGJldHRlcg0KdG8gaGF2ZSBhIGNvbnZlbmllbnQgZnVuY3Rpb24gZm9y
IHRoYXQsIGFuZCBwcm9iYWJseSByZW1vdmUgYW55IHdhcm5pbmcNCndlIGhhdmUgaW4gdGhlIGNv
bXBvc2l0ZSBsYXllci4NCg0KPiA+IA0KPiA+IEFjayAtIHRoYW5rcy4gVGhhdCB0aHJlYWQgSSBs
aW5rZWQgd2FzIHZlcnkgaW5mb3JtYXRpdmUsIEkgd2lzaCBJJ2QgZm91bmQgaXQNCj4gPiBzb29u
ZXIhDQo+IA0KPiBUaGVyZSBpcyBzdGlsbCBhIHJhY2UgaW4gdGhlIGdhZGdldCBsYXllcidzIGhh
bmRsaW5nIG9mIGNvbnRyb2wgDQo+IHJlcXVlc3RzLiAgVGhlIGhvc3QgY2FuIHNlbmQgYSBTRVRV
UCBwYWNrZXQgYXQgYW55IHRpbWUuICBTbyB3aGVuIGEgDQo+IGZ1bmN0aW9uIGRyaXZlciBxdWV1
ZXMgYSB1c2JfcmVxdWVzdCBmb3IgZXAwLCBob3cgZG9lcyB0aGUgVURDIGRyaXZlciANCj4ga25v
dyB3aGV0aGVyIGl0IGlzIGluIHJlc3BvbnNlIHRvIHRoZSBTRVRVUCBwYWNrZXQgdGhhdCBqdXN0
IG5vdyBhcnJpdmVkIA0KPiBvciBpbiByZXNwb25zZSB0byBvbmUgdGhhdCBhcnJpdmVkIGVhcmxp
ZXIgKGFuZCBpcyBub3cgc3VwZXJzZWRlZCk/DQoNCkRpZmZlcmVudCBzdGFnZXMgb2YgZGlmZmVy
ZW50IHRoZSBjb250cm9sIHRyYW5zZmVycyBzaG91bGRuJ3QNCmludGVybGVhdmUuIElmIGEgbmV3
IFNFVFVQIHBhY2tldCBpcyByZWNlaXZlZCBiZWZvcmUgY29tcGxldGluZyB0aGUNCnByZXZpb3Vz
IGNvbnRyb2wgdHJhbnNmZXIsIHRoZSBwcmV2aW91cyBjb250cm9sIHRyYW5zZmVyIGlzIGNhbmNl
bGVkLg0KQ29udHJvbCB0cmFuc2ZlciBkb2Vzbid0IGhhdmUgc29tZXRoaW5nIGxpa2UgYnVsayBz
dHJlYW0taWQgdG8gYWxsb3cgZm9yDQppbnRlcmxlYXZpbmcuDQoNClRoZSBnYWRnZXQgZHJpdmVy
IHNob3VsZCBoYW5kbGUgdGhlIGRpZmZlcmVudCBjb250cm9sIHRyYW5zZmVycw0Kc3luY2hyb25v
dXNseS4NCg0KPiANCj4gVGhpcyByYWNlIGV4aXN0cyBldmVuIGF0IHRoZSBoYXJkd2FyZSBsZXZl
bCwgYW5kIEknbSBwcmV0dHkgc3VyZSB0aGF0IGEgDQo+IGxvdCBvZiBVREMgY29udHJvbGxlcnMg
ZG9uJ3QgaGFuZGxlIGl0IHByb3Blcmx5LiAgQnV0IHRoZXJlJ3Mgbm90aGluZyB3ZSANCj4gY2Fu
IGRvIGFib3V0IHRoYXQuLi4NCg0KSSBjYW4ndCBzcGVhayBmb3Igb3RoZXIgY29udHJvbGxlcnMs
IGJ1dCB0aGlzIGlzIGZvciBkd2MzIGNvbnRyb2xsZXJzOg0KDQpJZiB0aGUgaG9zdCBzZW5kcyBh
IG5ldyBTRVRVUCBwYWNrZXQgd2l0aG91dCBmaW5pc2hpbmcgd2l0aCB0aGUgcHJldmlvdXMNCmNv
bnRyb2wgdHJhbnNmZXIgZGF0YS9zdGF0dXMsIHRoZSBkYXRhL3N0YXR1cyBUUkIgd291bGQgYmUg
Y29tcGxldGVkDQp3aXRoICJTRVRVUF9QRU5ESU5HIiBzdGF0dXMuIFRoaXMgaW5kaWNhdGVzIHRo
YXQgdGhlIGhvc3QgY2FuY2VsZWQgdGhlDQpwcmV2aW91cyBjb250cm9sIHRyYW5zZmVyIGFuZCB0
aGUgVURDIGRyaXZlciBuZWVkcyB0byBzZXR1cCBhIFNFVFVQIFRSQg0KdG8gc2VydmljZSB0aGUg
bmV3IFNFVFVQIHBhY2tldC4gVGhlIHByZXZpb3VzIGNvbnRyb2wgdHJhbnNmZXIgd291bGQgYmUN
CnJldHVybmVkIHdpdGggYSBjYW5jZWxlZCBzdGF0dXMuDQoNCkJSLA0KVGhpbmgNCg0KPiANCj4g
TXkgdGhvdWdodCAoYW5kIHRoaXMgZ29lcyBiYWNrIGFsbW9zdCAyMCB5ZWFycyEpIHdhcyB0aGF0
IGEgVURDIGRyaXZlciANCj4gc2hvdWxkIGFzc29jaWF0ZSBhIGRpZmZlcmVudCB0YWcgdmFsdWUg
d2l0aCBlYWNoIGluY29taW5nIFNFVFVQIHBhY2tldC4gIA0KPiBUaGlzIHRhZyB3b3VsZCBnZXQg
cGFzc2VkIHRvIHRoZSBmdW5jdGlvbiBkcml2ZXIgaW4gaXRzIC0+c2V0dXAoKSANCj4gY2FsbGJh
Y2ssIGFuZCB0aGUgZnVuY3Rpb24gZHJpdmVyIHdvdWxkIGNvcHkgdGhlIHZhbHVlIGludG8gYSBu
ZXcgDQo+IC5jb250cm9sX3RhZyBmaWVsZCBvZiB0aGUgdXNiX3JlcXVlc3Qgc3RydWN0dXJlIGl0
IHF1ZXVlcyBhcyBwYXJ0IG9mIHRoZSANCj4gY29udHJvbCB0cmFuc2Zlci4NCj4gDQo+IFRoZW4g
dGhlIFVEQyBkcml2ZXIgY291bGQgaW5zcGVjdCB0aGUgY29udHJvbF90YWcgdmFsdWUgd2hlbiBp
dCBpcyBhc2tlZCANCj4gdG8gcXVldWUgYSByZXF1ZXN0IGZvciBlcDAsIGFuZCBpdCBjb3VsZCBy
ZXR1cm4gZmFpbHVyZSBpZiB0aGUgdmFsdWUgDQo+IGRvZXNuJ3QgbWF0Y2ggdGhlIFVEQydzIGN1
cnJlbnQgdGFnLiAgVGhpcyBjYW4gYmUgZG9uZSB3aGlsZSBob2xkaW5nIHRoZSANCj4gVURDJ3Mg
c3BpbmxvY2ssIHNvIGl0IHdpbGwgYmUgZnJlZSBvZiByYWNlcy4NCj4gDQo+IFRoZSByaWdodCB3
YXkgdG8gZG8gdGhpcyB3b3VsZCBiZSB0byBhZGQgYSBuZXcgYXJndW1lbnQgdG8gdGhlIC0+c2V0
dXAoKSANCj4gY2FsbGJhY2ssIGZvciB0aGUgdGFnIHZhbHVlLiAgQnV0IHRoaXMgd291bGQgbWVh
biBjaGFuZ2luZyB0aGUgZ2FkZ2V0IA0KPiBBUEksIGFuZCBpdCB3b3VsZCByZXF1aXJlIHNpbXVs
dGFuZW91c2x5IHVwZGF0aW5nIGV2ZXJ5IFVEQyBkcml2ZXIgYW5kIA0KPiBldmVyeSBnYWRnZXQv
ZnVuY3Rpb24gZHJpdmVyLg0KPiANCj4gQWx0ZXJuYXRpdmVseSwgdGhlcmUgY291bGQgYmUgYSAu
Y3VycmVudF90YWcgZmllbGQgYWRkZWQgdG8gdGhlIA0KPiB1c2JfZ2FkZ2V0IHN0cnVjdHVyZSwg
d2hpY2ggaXMgYWxzbyBwYXNzZWQgdG8gLT5zZXR1cCgpLiAgSXQgd291bGQgYmUgDQo+IG1vcmUg
YXdrd2FyZCwgYnV0IGRyaXZlcnMgbm90IGNvbnZlcnRlZCB0byB0aGUgbmV3IG1lY2hhbmlzbSB3
b3VsZCANCj4gc2ltcGx5IGxlYXZlIHRoZSBmaWVsZCBwZXJtYW5lbnRseSBzZXQgdG8gMC4gIFBy
b3ZpZGVkIGFsbCBnZW51aW5lIHRhZ3MgDQo+IGFyZSBub256ZXJvLCB0aGUgbWVjaGFuaXNtIHdv
dWxkIGJlIGJhY2t3YXJkIGNvbXBhdGlibGUgd2l0aCBleGlzdGluZyANCj4gY29kZS4NCj4gDQo+
IE9mIGNvdXJzZSwgdGhpcyBpcyBhbGwgaW5kZXBlbmRlbnQgb2YgdGhlIGV4cGxpY2l0X3N0YXR1
cyBjaGFuZ2VzLg0KPiANCj4gQWxhbiBTdGVybg==
