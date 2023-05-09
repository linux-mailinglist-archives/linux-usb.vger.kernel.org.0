Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2EB46FBBF2
	for <lists+linux-usb@lfdr.de>; Tue,  9 May 2023 02:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbjEIAWI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 May 2023 20:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjEIAWH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 May 2023 20:22:07 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A27849C2
        for <linux-usb@vger.kernel.org>; Mon,  8 May 2023 17:22:05 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 348JnYRA025441;
        Mon, 8 May 2023 17:21:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=QZTaws5AUfwZZBT5cWL4A7Sqp8KPCfkOprrLxlbe2AE=;
 b=jJKjNU2O07q3SXt+b314JOi5QBLWu8PtM92hFkpHDliFJKqrzUYbxE2S+XqFoGxwBbod
 LKfsgwKBQ5xxEd7PGPXP4Qceb/0z+zkILufBQjaXC5X2MH3pRT2satJdOQW+E/jsPyin
 s2m/h9IzdJdWppb0zpi1k2Ivo4OFcMhEtopWhy21Zu1X5R79lZxeA6ATADY0mPId/M5Q
 M0czdiRl8D0ac5Vn/ixr4hh9jdd2am9lrGmuUpZnD+dQBBjhepGsuVTPh7brzu8JI32p
 4oy6fuKOCfAtSV9u07ZcWfMsKIyKngO5kl5NEzhbHYzscAn0tUqPj+W/ix0Zky2ub6w7 Hw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3qf770136e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 08 May 2023 17:21:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1683591718; bh=QZTaws5AUfwZZBT5cWL4A7Sqp8KPCfkOprrLxlbe2AE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=dR/KQ1vYjIJn2yxaKHZ6pS7F9FvegI4zF0L40VZ2SykayFVVogvHpFq/j8XqOLtnJ
         hM8LBuNWqWQEd99s/95hjsGaMBmCNwFrcO9cZykbBAi2h+Huydrmxiukp6KPxVmzdc
         YDDuvMNEA7ix2FyOPeKptZm44BTLtMBcuKx4TMgrRIY+QiDleQK+vPzcshlJR9/X1U
         JHTTpnRrXq1vxV5jxqtMdrC5nJHzyc4dY/dqPDDVIjsBS3b+c6rC9i8ScG2RpmBC/4
         OoQmy0xq900tKpenq2opjeSNL40cFPYzJHxFFnQZCDE9F/sI+pxms49UMDKv3ToUgu
         MSWDtaFS7QW1w==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4B477404D1;
        Tue,  9 May 2023 00:21:57 +0000 (UTC)
Received: from o365relay-in.synopsys.com (unknown [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id E1E7EA0068;
        Tue,  9 May 2023 00:21:56 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=uv24ynpD;
        dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id E1BFB4061E;
        Tue,  9 May 2023 00:21:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOnYikng/P+l8rUEAWWmbeV6h+NFbFpsE+94Iaak8cKDIgP+1WhNNvz1H3t5ISMqk4TyN7pC5+JjTRLewkMwtBgrgUk0pmkTRqhyOL/NacnDFAU49w9cQQnTc72bFV7pqnifh8AB+l84XwwmKtAOHSsQTBC6tgFiJBrfel3EyeMeMgIIpjVjA5Z9A6H2mPA9koFvNUSnG2I2jQZd4zgEuF4CluBgztNI5S8wuidjt89NKjjjRC+7tYgu23DnQn2De2y4SYe1W6laQWAG+7GYK3P681lW28t40tHaLVneRtgBIYBQ9ULZHWBsYxwg0fQz8UeVKEFy9ZkJqSTeJS5Ueg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZTaws5AUfwZZBT5cWL4A7Sqp8KPCfkOprrLxlbe2AE=;
 b=R8pFXIl/fYrO62nxKx0RrHxGTssqART8dbLZzjhJEWoC8ZApMOi8ZUwxQDJqUuDfJBU4Pj9emKX1QW/Nhf3mFONYbwYyFa9c4OpGXRzRvssTX32OWb1MeGb4RsHaSKDAeUr3Ronz1t69ixKvcD9TJU6UK8qESYbaMfvFpz+vRwMGtDDmwRnegeBwfMWD1zxfca6nAHfZ/5OkvJxfvDXh2oUboVx6SZRMTHI3CxhWmBe7D8fkMmwUTQTOLtdBqnggOfeAAxFUPEkWiOFZ/ghY/CrEzD3YkTHILkUOe/BTxsSMwbDcMoJdeVlzRTd58s1hny0ULGnqUEJySBowdEXwSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZTaws5AUfwZZBT5cWL4A7Sqp8KPCfkOprrLxlbe2AE=;
 b=uv24ynpD4agXEFAaNBlB3z8fuFJ7mho7SaRhI026tZYihJLTr36dpxs/wbIjPymlX/a+RFgUzToA2hAdlnew6LCaiBJciUXyBy+rOFJvU/ig88M6pUQbWO3fnvUf9GamyQJePLC5YxwUYvcMW7KZ5FRD99ES0EZhTWNcv+de3dg=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by CH2PR12MB4889.namprd12.prod.outlook.com (2603:10b6:610:68::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Tue, 9 May
 2023 00:21:52 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::bb79:9aea:e237:688c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::bb79:9aea:e237:688c%7]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 00:21:52 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Avichal Rakesh <arakesh@google.com>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dan Scally <dan.scally@ideasonboard.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Topic: UVC Gadget Driver shows glitched frames with a Linux host
Thread-Index: AQHZbxSLVlNfn9UhSEmoQu3rfa9UjK8viLiAgADE34CAABUTgIAARO8AgADVU4CAADP6gIAAJ4KAgABIVoCAAlnSgIAX7D2AgADufoCAA9vnAIAACRuA
Date:   Tue, 9 May 2023 00:21:52 +0000
Message-ID: <20230509002143.7x5zo6bohvn5dyb2@synopsys.com>
References: <20230418024937.h6mipfdvdqomtz36@synopsys.com>
 <CAMHf4WKzU7uWj5HVHdcBnJ2ugK5cfkk=-38dn7=z1fCwXtegLw@mail.gmail.com>
 <20230418193951.zjwgg25cyhg3lsay@synopsys.com>
 <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
 <47244f7e-feb5-4958-be14-7fd9f0814566@rowland.harvard.edu>
 <CAMHf4WL9dOWiw-+V2DQeQ=3jxmk3LHg5ONdWSwcp3Gx0AD17yg@mail.gmail.com>
 <20230420172011.GF21943@pendragon.ideasonboard.com>
 <0610f776-44c8-4372-975b-52c2a1f0af8d@google.com>
 <20230506125317.GD17474@pendragon.ideasonboard.com>
 <CAMHf4WLMAjigKypYho24TqeuWx6Y9-LWjq2cj_5ad31pqsKDzg@mail.gmail.com>
In-Reply-To: <CAMHf4WLMAjigKypYho24TqeuWx6Y9-LWjq2cj_5ad31pqsKDzg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|CH2PR12MB4889:EE_
x-ms-office365-filtering-correlation-id: dd12c322-4667-4cea-48a5-08db50236330
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0JKLCB0yTrVicoL3PP6ZiylzOobzpKdZBGFchluHnu17qPpzzVvOrh3Ht54GuXawVel2EJz/gVCoMMj+jO17zc/+4H/43uI67J+5xlHikbXfOebSATH7N3Cwfy/I7eXFVLffUOqXOoqrtRdFGRafV4XinboKRmVbmXhvw2GNCSBxjOechgkVBa3Gdj0IZJMxpooAx3o5jyUd8yrIvBs5u0nwY1l56Oa6M9peAsuyvm5TxhE5Tjs3RKvGiaDFK5BwoW3DRNTAt3QsU1qh5ZiQl+HDM7/y9Bu904Ekesjzgr6goF3fyNkAnANPnXBH8GZahhCw8+1dhT8hvAyotCWqCN2Y/sypseswyP0dlHvkGDFc/sajR47X9BiSw+KstMvoKxpFHvFJIi61ONz6qX0oprnGTULZpGIK/dViYoRWDZuN9L9Z8ZoYbc5TC0ibeRcsDRxcqjZ4vh/xyXq3R6XL+X0wBhyBlsOCwINHtthcGH7LN+k1QKbdX5rXRL7gcAwf4tBl8bDRfpuaxG/C6TjbMWTcarvC1cwFM6v+sNlY6PpY0d0S96jwKeI7xS0R6iTINLxho03rmlBFERQ/F8FB66xo4tn5Yr4d0JqaiseL9FdIRsyu0dGKOvkQMNQF1p9I
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199021)(6916009)(8676002)(66446008)(8936002)(76116006)(64756008)(66556008)(66476007)(66946007)(316002)(4326008)(54906003)(2906002)(41300700001)(478600001)(83380400001)(6506007)(71200400001)(5660300002)(6512007)(6486002)(53546011)(1076003)(26005)(2616005)(186003)(36756003)(38070700005)(86362001)(122000001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QThHdmEyamxZRlJ3dzhGUXZQZzl1VVhhM0d1QitwWjFDRDVBNWJFTEY2aXJq?=
 =?utf-8?B?djBhK2NVL3lvVjVPaGd5bjhzNCsyR1ZGV1kxMUplSVJ2bXdXK3Z4dHZENktX?=
 =?utf-8?B?c1Q1WVpRR0ZOdmkreVFTaTVhZFMyanFOZ0dSeHNCNDVERXp3djlSRUh4cGs0?=
 =?utf-8?B?RlRnZTJOTVpyS25rQ2E2QzcxU05EclM5MDN4WDZjdERHdjFrSUZVOEtPSjdE?=
 =?utf-8?B?SGlGUDIrQ29ObTl4YUhmUlRyYktMd0swYmd4aTZ5Q1lSOEtzM0xlb1d6RjdT?=
 =?utf-8?B?aXh3VGdnRG1Ca21BMStualZnY3BHNlpOS0RqN25iMk1pWWRpTWRxUU5rWXVM?=
 =?utf-8?B?VFNIVVNKTzRaWTVzazJ6ZlMxelZ4MENUd2phblUyZUJDYUpNRU5pOFgyM1Mv?=
 =?utf-8?B?V2ZRY1R2amI0aEtkRVFmVDVWYzYrZVpid0gycXdKY0ljd09UWEtIM0xyTUhK?=
 =?utf-8?B?ZlRSSHhYUzJPZUFqNlpFTll0eFFNUTJrMjZIYjk1NW5velNIWTMyYXF6MDha?=
 =?utf-8?B?WnRiQWZkZFVLZ3NtYUtFczg3YUpaR3VBTVBqV2R3TFZmRjkyYVJVU2Y2VkVK?=
 =?utf-8?B?c0ZGdEVZN2FwdlNOeFRXYXhBM1FBSFluaTRMUEREMG84dmtmNjA3WEJCNWxx?=
 =?utf-8?B?ZEU3MVY2QnVWbGt1ZUczUW1Ia0ZvWnRNV2l5bHFJRm1kQWxLaXBobFdKeUk1?=
 =?utf-8?B?Rmo4TDNsK2k2STNMSlRkRzl0VnNoOHJ0VVZ2RGVPUkRjNDdCZTI0Wm94NDNy?=
 =?utf-8?B?eWN4a1hWVVlJWThIYzduVjdHelRvQTlncHhCK2VaTWl3OGxGcFBkaDZhNUUy?=
 =?utf-8?B?YkY4NVN0emNSSnNCaXpsZ3BZdmxJZnZhY3laOVJTTDJEU091a2EvamZWcnRo?=
 =?utf-8?B?SUxPMmEydFB5bFBXNHlwT2JFZHJUdlppbW9qQVhJaXhJLzJLY0NHbVZKK1Z3?=
 =?utf-8?B?RWU2aTZJY1RFNUtDT1gwcWRlakRlZGdnOHYvTHY4TnJnVDFtSnUyT09rUHdW?=
 =?utf-8?B?UWFnNjlXTTdLNzBnbDExVnEydVFqbzM1ZEx4U05peWJkMWNFRUZ6UzJDMFpS?=
 =?utf-8?B?TlVqblJVRE1DVEk4Z1NWV1IrWmozWFd4RzNtVEtTQnNna1NKdnl4eVZRU3p1?=
 =?utf-8?B?WUxEbzcvRUh3VkRZSnVqUkwzZC9pSUJqb0Q2UmpEVHJ3WmRQaktEelVaanFs?=
 =?utf-8?B?SStLTGUzNmJjVHUvTjBIZlpBSVlqU1BKTTFZbXFzM0hVTzVGdmFpYVlpV2pk?=
 =?utf-8?B?Z05tbHp1aXdxOXZLNmlvc1JoTXFSVXJXMnI2bzBxcUFmNExVcU93TU5seTRZ?=
 =?utf-8?B?NkhJOFFoOXZIeWJIV3hkaFdDN2d3YStYbW82MmhWSEZKRDhab3FHcXh1ajZJ?=
 =?utf-8?B?bjJyOXNMdnViTTMwcGQvOTFBdXdwSnIrMXhydThtck5JcEt0ODhUQmo2V1lr?=
 =?utf-8?B?dUVGdWE2MHlyT01KUFkyTXJwRUpGc3ZsdjVXN3RsWEpNOENyOU5WclRMYkZk?=
 =?utf-8?B?SDVlQSs2dW1qVGdiMnVkd1pwMmpzKzJSQkxianoxbkIzSGY1ci83ejFhVzFh?=
 =?utf-8?B?eTBmUGQrcVhYalBvaXRucWNNL3llaGMzaGJ6UG1EcnhBZXFoQm5WOUtwNlho?=
 =?utf-8?B?Lyt4YXNnSWd1L2FrNkhuVDZYWFRnZE8zRVhHRkEwajV4Nmc0R0oyb0pwalht?=
 =?utf-8?B?Zll0Z09EN2FGTk4rL0pVMHAzdXFzamVudWl2TjM2NWZtSkRhdE1YM3dJdHBJ?=
 =?utf-8?B?NW1zMkl0Lzk2M0hCbk40ZzJaVnFaREdWL0FhejhkZC9rWG5hR1A3SmtNZmFj?=
 =?utf-8?B?WjA4UTBrekNMQ01YRmNhOEhOdFcxb3FHZDJQUmpudHJxSFNtc2E4UllMVXlI?=
 =?utf-8?B?M0lnOFljRFhGcjVQT1Ava0xYbGxQL0RidlZOdWsyWTF4bmFsamhDTGNxUURu?=
 =?utf-8?B?RHorMGE5R3FQRHJQbTR3bXVKUU11WlBwRE53WFJpWnZXN2lMSGl3dHJNMkNI?=
 =?utf-8?B?YWt5elVVRy9BamFGOVhmQ3JvZEtNOVUvZUNEM3ZqKzhCQ0REL0JwM2R4em9Z?=
 =?utf-8?B?SzVpaEVYMGpPMXkySjNhNXd6TllReGhUUFQ0Q2VJY0k0T2UwM3JhWG1tenpY?=
 =?utf-8?Q?TCoBsnh+mi/6KE2vaLWmOq+J8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BEA7CA42E58F9144BDD977C2E01B1E5D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?MVVjMlc1ZENIekZ5REM5VWRYN0h1NGlLVWpKNDJDMjNXdFBsd0NmTEF3WUVR?=
 =?utf-8?B?Z1ZPWXFYVysxQ3c1bGY1bUU5NXppYkEyaDEvUXBPNDY5cVUzZ3h1YStXck9t?=
 =?utf-8?B?VjRoZjNneWd0VnY4cmxBM0cxSGFOTmI5WXlqd0lWdTFwYm9wbHZKdlRGMzRl?=
 =?utf-8?B?RWdqcVlXRXFjSkwwamJVYTRtSHMvcFYwcmZVTFdUQmJqUWk3Rk1SWkNiQ3dI?=
 =?utf-8?B?ZG40N05mdENnUDVUZE5abUo0QU1FNFc0aDVyM1kxM2tXQllPUUk2dng0U2Uw?=
 =?utf-8?B?Unl0eVJ0RFY3WnBYRlVoVlBBZGZ1NnZRT2wrSjVubVFIb0txRjZXRy9oNGdW?=
 =?utf-8?B?d3V3ekl5aU1lSVVBbFNINlFZTXU5M2xiMldQRGxRdE1VYmV6blh5aUZvL2Fj?=
 =?utf-8?B?bGtsdzZ6WS9KNWJSSmVYNGE3WmRGc0V5RDluTWh0Z0Nta3ZKYURYR1NqMk94?=
 =?utf-8?B?dkYxdk16ZkdVVUI2SytCcDhmZTdtV2ZOOFJpUTIvMEZuL3M1R0p6eUszU1RZ?=
 =?utf-8?B?cEhFSmNKOEw4TExrWjhNMG54R0tFY3VHRTYrdjVydksvMWNrMHlmOUdkU2VC?=
 =?utf-8?B?ZnB4SU1iT2xxMFNlWk1mK1lCMGJvN21pNytIdG9yeVdKUS9WR0dPMmE5U1hy?=
 =?utf-8?B?cG1tL2tJaFZXWkxoZVM2NVlZbm5TR21KVGgrVDJTRzFDalRTY3VabnFtSzRO?=
 =?utf-8?B?cGdzMms0VExiOGRiUzR3YmVpS2hXK2dPckVpUDVoMVNTQ1NONGFnSHo3aWNv?=
 =?utf-8?B?SGJUSWlhR25vN1BjNzdSU05PRmVRNTJsRE0xYWFXL0J0WFZXL0lveE45ZnBL?=
 =?utf-8?B?WXZaSHdZMjI0b2ZOQ3g3N1pFWnRUWGx2R21pYzc5dUNPZ3Biei9XVlM1M3px?=
 =?utf-8?B?SjRXSUtNWE1mcXZnOVFzUDF4TjVRNWRrQVRwdS9TSVNISVZuTTcvMXdUNVpS?=
 =?utf-8?B?Wk9seE55Zk1pUVFMR0hXRWI0VTgrMVdUVDlEUDVURkc2ZkZoZzZtN0xHZ3h2?=
 =?utf-8?B?cTdraU9peTJtYkxrSVZudzJHMUJsVnVVQWpDajhPWURHZWRSYUlsUUpFOWs3?=
 =?utf-8?B?UGdWU0k5amJDRms3Y3VFVG03Wk5UQjRlN25qZHNGKzZnUUZZeHdUNWdXTVJ6?=
 =?utf-8?B?bHZXWGE5TGFDUTFkb2I0NzNjeElXR0RqOE5HU2VZTm9UTkF6SHVaN2lCVk5C?=
 =?utf-8?B?MXJDM1JoM3JWS1RvOC9EYzRPdTZsK0dIUmNHdjdmUGxhcFFvNHY4UEtWcjUz?=
 =?utf-8?B?TmN1VGhNSitsZlNzR2VRaHUxQnFJUHZBZVJlb2pvM2lLY25oWG90VDRpbUY5?=
 =?utf-8?Q?r0S3oGD8A2/nw=3D?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd12c322-4667-4cea-48a5-08db50236330
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 00:21:52.0670
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oTG3VeXTDxWD+zGC4uX69e1fCA1C6b59k7lI4gNNWw0OKinTUACq8Pb5PbDeSnS5XBTV3rnH0DTBrodLfv5u1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4889
X-Proofpoint-GUID: yFdxPWo4FVIwde0C2BwkZsD_fffeHUBX
X-Proofpoint-ORIG-GUID: yFdxPWo4FVIwde0C2BwkZsD_fffeHUBX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_18,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 mlxlogscore=750 clxscore=1015 phishscore=0 suspectscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305090001
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gTW9uLCBNYXkgMDgsIDIwMjMsIEF2aWNoYWwgUmFrZXNoIHdyb3RlOg0KPiBPbiBTYXQsIE1h
eSA2LCAyMDIzIGF0IDU6NTPigK9BTSBMYXVyZW50IFBpbmNoYXJ0DQo+IDxsYXVyZW50LnBpbmNo
YXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOg0KPiANCj4gPiA+IFRoZSBmaXJzdCB0aGluZyBJ
IHRyaWVkIHdhcyB0byBzcGxpdCBvbmUgdmlkZW8gZnJhbWUgb3ZlciAyNjYgZnJhbWVzLCB3aXRo
b3V0DQo+ID4gPiBjaGFuZ2luZyB0aGUgbnVtYmVyIG9mIHJlcXVlc3RzIGFsbG9jYXRlZC4gQW5k
IGl0IHdvcmtzISBIb3dldmVyLCBhcyBMYXVyZW50DQo+ID4gPiBtZW50aW9uZWQsIGl0IGRvZXMg
YWRkIGEgZmFpciBhbW91bnQgb2YgYm9va2tlZXBpbmcgdG8gc3BsaXQgYSB2aWRlbyBmcmFtZSBp
bnRvDQo+ID4gPiB0aGUgcmVxdWlyZWQgbnVtYmVyIG9mIHJlcXVlc3RzLiBJIGFsc28gaGFyZGNv
ZGVkIHRoZSBudW1iZXIgMjY2IGZyb20gb3VyDQo+ID4gPiBkaXNjdXNzaW9uLCBidXQgSSBhbSBu
b3Qgc3VyZSBob3cgdG8gZmlndXJlIG91dCB0aGF0IG51bWJlciBkeW5hbWljYWxseS4gMjY2DQo+
ID4gPiBhbHNvIGRpZG4ndCB3b3JrIGlmIHRoZSBob3N0IHN0YXJ0ZWQgc2VuZGluZyBmcmFtZXMg
YXQgbW9yZSB0aGFuIDMwZnBzIDovLCBzbw0KPiA+ID4gb3VyIGR5bmFtaWMgY2FsY3VsYXRpb24g
d291bGQgbmVlZCB0byB0YWtlIGNhbWVyYSdzIHJlYWwgb3V0cHV0IGZwcyBpbnRvDQo+ID4gPiBh
Y2NvdW50LCB3aGljaCBhcyBmYXIgYXMgSSBjYW4gdGVsbCBpcyBub3Qga25vd24gdG8gdGhlIFVW
QyBkcml2ZXIuDQo+ID4NCj4gPiBJdCB3b3VsZCBwcm9iYWJseSBuZWVkIHRvIG1vbml0b3IgaG93
IGZ1bGwgdGhlIHJlcXVlc3QgcXVldWUgaXMsIGFuZA0KPiA+IGFkYXB0IHRoZSBudW1iZXIgb2Yg
Ynl0ZXMgaXQgcXVldWVzIGluIGVhY2ggcmVxdWVzdCBhY2NvcmRpbmdseS4gVGhhdCdzDQo+ID4g
aW5kZWVkIHF1aXRlIGEgYml0IG9mIHdvcmssIGZvciBsaXR0bGUgZ2FpbiBjb21wYXJlZCB0byB0
aGUgb3B0aW9uIHlvdQ0KPiA+IGRlc2NyaWJlIGJlbG93Lg0KPiA+DQo+IEFncmVlZCwgZXNwZWNp
YWxseSBpZiB0aGUgaG9zdHMgYWxyZWFkeSBoYW5kbGUgMCBsZW5ndGggcGFja2V0cy4NCj4gQXMg
bG9uZyBhcyB0aGUgdXNiIGNvbnRyb2xsZXJzIGNhbiBrZWVwIHVwLCB0aGUgYnVyc3QgYXBwcm9h
Y2ggc2VlbXMNCj4gbW9yZSByZWFzb25hYmxlLg0KPiANCj4gPiA+IFdpdGggdGhvc2UgaXNzdWVz
IEkgdHJpZWQgd2hhdCBMYXVyZW50IGNhbGxlZCB0aGUgImJ1cnN0IiBhcHByb2FjaA0KPiA+ID4g
KGF0dGFjaGVkIGJlbG93KSwgaS5lLiBzZW5kIHRoZSB2aWRlbyBmcmFtZXMgaW4gYXMgZmV3IHBh
Y2tldHMgYXMgcG9zc2libGUsDQo+ID4gPiBhbmQgdGhlbiBxdWV1ZSB1cCAwIGxlbmd0aCBwYWNr
ZXRzIHRvIGtlZXAgdGhlIElTT0MgcXVldWUgaGFwcHkuIFRoaXMgYXBwcm9hY2gNCj4gPiA+IHdv
cmtzIHBlcmZlY3RseSBhcyBmYXIgYXMgSSBjYW4gdGVsbC4gTG9jYWxseSBJIHRyaWVkIHdpdGgg
YSBMaW51eCwgV2luZG93LA0KPiA+ID4gYW5kIE1hY09TIGhvc3Qgd2l0aCBubyBmcmFtZSBkcm9w
cyBvciBJU09DIGZhaWx1cmVzIG9uIGFueSBvZiB0aGVtIQ0KPiA+ID4NCj4gPiA+IEluIHRoZSBj
dXJyZW50IHBhdGNoLCBVVkMgZ2FkZ2V0IGRyaXZlciBrZWVwcyB0aGUgSVNPQyBjYWRlbmNlIGJ5
IGVmZmVjdGl2ZWx5DQo+ID4gPiBtYWludGFpbmluZyBhIGJhY2stcHJlc3N1cmUgb24gdGhlIFVT
QiBjb250cm9sbGVyIChhdCBsZWFzdCB0byB0aGUgYmVzdCBvZiBpdHMNCj4gPiA+IGNhcGFiaWxp
dGllcykuIEFueSB1c2JfcmVxdWVzdCBhdmFpbGFibGUgdG8gdGhlIFVWQyBnYWRnZXQgZ2V0cyBp
bW1lZGlhdGVseQ0KPiA+ID4gcXVldWVkIGJhY2sgdG8gdGhlIFVTQiBjb250cm9sbGVyLiBJZiBh
IHZpZGVvIGZyYW1lIGlzIGF2YWlsYWJsZSwgdGhlIGZyYW1lIGlzDQo+ID4gPiBlbmNvZGVkLCBp
ZiBub3QsIHRoZSBsZW5ndGggaXMgc2V0IHRvIDAuIFRoZSBpZGVhIGJlaW5nIHRoYXQgdGhlIGhv
c3QncyBwb2xsaW5nDQo+ID4gPiBhbmQgdGhlIGNvbnRyb2xsZXIncyAnY29tcGxldGUnIGNhbGxi
YWNrIHdpbGwgcmVzdWx0IGluIGEgc29tZXdoYXQgY29uc2lzdGVudA0KPiA+ID4gY2FkZW5jZSBm
b3IgdGhlIHV2YyBkcml2ZXIgYWZ0ZXIgdGhlIGluaXRpYWwgYnVyc3Qgb2YgcGFja2V0cy4NCj4g
PiA+DQo+ID4gPiBIb3dldmVyIHRoaXMgZG9lcyBtZWFuIHRoYXQgYXQgd29yc3QsIHRoZSBuZXcg
dmlkZW8gZnJhbWVzIGFyZSB1cCB0byA2Mw0KPiA+ID4gdXNiX3JlcXVlc3RzIGJlaGluZCwgYnV0
IGFzc3VtaW5nIGEgMTI1dXMgcGVyIHVzYl9yZXF1ZXN0LCB0aGF0IGFtb3VudHMgdG8gfjhtcw0K
PiA+ID4gbGF0ZW5jeSBhdCB0aGUgd29yc3QsIHdoaWNoIHNlZW1zIGFjY2VwdGFibGU/DQo+ID4N
Cj4gPiBUaGVyZSdzIGEgdHJhZGUgb2ZmIGJldHdlZW4gbGF0ZW5jeSBhbmQgdGhlIHJpc2sgb2Yg
dW5kZXJydW5zLiBXZSBjb3VsZA0KPiA+IGRlY3JlYXNlIHRoZSBudW1iZXIgb2YgcXVldWVkIHJl
cXVlc3RzIHRvIGxvd2VyIHRoZSBsYXRlbmN5LCBhcyBsb25nIGFzDQo+ID4gd2UgZW5zdXJlIHRo
ZSBtYXJnaW4gaXMgaGlnaCBlbm91Z2ggdG8gYXZvaWQgdW5kZXJydW5zIGluIGhpZ2hlciBsb2Fk
DQo+ID4gY29uZGl0aW9ucy4gV2UgY291bGQgYWxzbyBkbyBzbyBvbmx5IHdoZW4gcXVldWluZyAw
LXNpemUgcmVxdWVzdHMsIGFuZA0KPiA+IHF1ZXVlIHRoZSBkYXRhIGluIGJ1cnN0IG1vZGUgd2l0
aCBhIGhpZ2hlciBudW1iZXIgb2YgcmVxdWVzdHMuDQo+IA0KPiBXb3VsZCA4bXMgb2YgbGF0ZW5j
eSBiZSBjb25zaWRlcmVkIHNpZ25pZmljYW50PyBVbmxlc3MgdGhlIGhvc3QgYXNrcw0KPiBmb3Ig
PjEyNWZwcywNCj4gdGhhdCBhbW91bnRzIHRvIGxlc3MgdGhhbiBhIGZyYW1lIG9mIGxhdGVuY3ks
IHNvIGZyYW1lcyBzaG91bGQgbm90IGJlIGRyb3BwZWQNCj4gYnkgdGhlIGhvc3QgZm9yIGJlaW5n
ICJsYXRlIi4gQWRtaXR0ZWRseSwgSSBkb24ndCBrbm93IGVub3VnaCBhYm91dCBVVkMgdXNhZ2Ug
dG8NCj4gc2F5IGlmIDhtcyAoYXQgd29yc3QpIHdpbGwgYmUgcHJvYmxlbWF0aWMgZm9yIGNlcnRh
aW4gdXNhZ2VzLiBUaGUNCj4gaG9zdHMgZG9uJ3Qgc2VlbSB0bw0KPiBoYXZlIGFueSBpc3N1ZXMg
d2hlbiBzdHJlYW1pbmcgYXQgPD02MGZwcy4NCj4gDQoNCkRvIHlvdSBvbmx5IHF1ZXVlIGEgc2lu
Z2xlIGJ1cnN0IGF0IGEgdGltZT8gV2UgZG9uJ3QgaGF2ZSB0byBxdWV1ZSBhbGwNCjYzIDAtbGVu
Z3RoIHJlcXVlc3RzIGFzIGEgc2luZ2xlICJidXJzdCIgcmlnaHQ/IFdlIGNhbiBxdWV1ZSBtdWx0
aXBsZQ0Kc21hbGxlciBidXJzdHMgb2YgMC1sZW5ndGggcmVxdWVzdHMuIFRoaXMgd2F5LCB0aGUg
VVZDIGRyaXZlciBjYW4gYmUNCmludGVycnVwdGVkIG1vcmUgb2Z0ZW4sIHJlZHVjaW5nIHRoZSB2
aWRlbyBkYXRhIGxhdGVuY3kgaWYgaXQgYXJyaXZlcw0KZWFybGllci4gVGhpcyBrZWVwcyB0aGUg
dG90YWwgbnVtYmVyIG9mIHF1ZXVlZCByZXF1ZXN0cyBzbWFsbGVyIHdoaWxlDQplbnN1cmluZyB0
aGF0IHRoZSBjb250cm9sbGVyIGlzbid0IHN0YXJ2ZWQgb2YgcmVxdWVzdHMgKGFzIGxvbmcgYXMg
dGhpcw0Kc21hbGxlciBidXJzdCBhY2NvdW50cyBmb3IgdGhlIHN5c3RlbSBsYXRlbmN5KS4gVGhl
IHRyYWRlb2ZmIGhlcmUgaXMNCmp1c3QgdGhlIFVWQyBnYWRnZXQgZHJpdmVyIG5lZWRzIHRvIGhh
bmRsZSByZXF1ZXN0IGNvbXBsZXRpb24gYSBsaXR0bGUNCm1vcmUgb2Z0ZW4uIEhvd2V2ZXIsIHdl
IGFyZSBsZXNzIGxpa2VseSB0byBiZSB1bmRlcnJ1biBubyBtYXR0ZXIgdGhlDQp2aWRlbydzIGZw
cy4NCg0KVGhhbmtzLA0KVGhpbmg=
