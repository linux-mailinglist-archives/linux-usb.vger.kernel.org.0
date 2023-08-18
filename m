Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACF977803AB
	for <lists+linux-usb@lfdr.de>; Fri, 18 Aug 2023 04:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357177AbjHRCKV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Aug 2023 22:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357234AbjHRCKJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Aug 2023 22:10:09 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 272DA3589
        for <linux-usb@vger.kernel.org>; Thu, 17 Aug 2023 19:10:02 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37HKUarP004176;
        Thu, 17 Aug 2023 18:25:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=9RSCcdtVVJYb4uFR9i3jM6jle9vHHIwepMClFrRdPU4=;
 b=JuI53PzgYyrFoKRl6GWO/01/UFJb2bBftlnzQtN8hvx1sh5Iu41tKj2n7okaF1lZVyfp
 q1zM9JYw8AcReHkIjLCe5gIBLNl+B/PW23FQG3/k4X5K2iVvIcsUL+pgAX8HZDAiN+T6
 046i2+ahiQAnmrH7BiDNORyCYSO2sdx6a0L5MHoBlueTs7rFSWkGXTDAyxdTJH7xyjAw
 M9GQubW5g1iwnbwgWO23C5FgptnB9FHBg+ep3fk4hfCZmxWUN4JDD8GvIcuHxMktFuNq
 J1ivN+BDYvLUPYDu0u4fDPvSniCpE2ddgx/5UTvxxP5I7LRrLyJ83qhTKPNQ5d74/A9a +Q== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3se8qdpj91-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 17 Aug 2023 18:25:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1692321913; bh=9RSCcdtVVJYb4uFR9i3jM6jle9vHHIwepMClFrRdPU4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=GJsK2RYTyRVZGl1Tpas0JisFWskbsz846W4P99A/tNd8i4ByfDMqo7cAE3XAM44tc
         RulS9ehJzp2gIOjz9ruEi5SKKmfMYSJL+FnSLQ3pLpSQ6sZYPS38aZzXiY1OBPBeRH
         1rZ1dMQBlF95C3EtuPRKaOkFomUXVpVhLP9lFjqBxS0uZPD8IhtqPAc0sc3lFgaZvZ
         JJDeoClKb/hyUweMTfB3nbfOSUURZ+wbDmZp+50xcVfEnyZmlO1BbxrpaPqwmXdnM7
         GPNYvGzkkbOTl0yICo436NgmGUHcPs6yAb16vojdPC1hksLEl12x0adwPhMBceP6j5
         VNalR7E+ORXFA==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3CC2A4024D;
        Fri, 18 Aug 2023 01:25:12 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 27395A005C;
        Fri, 18 Aug 2023 01:25:10 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=jqTMn8N5;
        dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 66FC040359;
        Fri, 18 Aug 2023 01:25:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZCu9YdC2J1L9QH7bWRFSoqRVAUrrMeqto+pnziB1nBcQfmViKKTWqLcPA47Xu8tgBgoW97uGq0vLe9cp8G8wul1gHKgXZLWlPfsMIzs2tA4rsZ/Wofj8chByo62JPCpOWNJM0JX+k/QGlvQMdNa/4mfIu7ZBosGZOqlat4Ai49tnN6eEJLlnCCWgrpS7Uj+DsZoCa5+pRCjYWf1b0ysGxpOcETVz02Sn7oe/YiNtmh6EHMMjKYIGlysq4o45h2eucEf/VcKBJQODJRDHIBNEbJnyrLcWNuSlh9ucACvtXX+F7J/J314bqkF1mKmkLgGbDLobL4dMfNFm7Keu+T67w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RSCcdtVVJYb4uFR9i3jM6jle9vHHIwepMClFrRdPU4=;
 b=MfAaZQpLI38bo0Mbu2BgYZbQ9upzXk4wQy5s0CwVMgAkCYZEFhxep2imqP15/M/vn4ZnG7WZVApRBEkC0ojzXkr1GccmLXqJDQhVGrVYrJS+8FMKtOCCCl/DGcqoJWrB4CseIfHd1LhGkE4DIERxSR3zXcVoE5Ij/Ch2Xt8SgN1ayAQEzTNmtKkhUduhsJLc/qjp3gw+Se5zZRNh6XE6s0HshZV01ADMnlQ5LNckOu8FHppMfiyZ1kBrwei+UG6FH1Pe5+O4j7M0y4KZl+DSRTIin8mEBqFkI+vrjX9vWzBxO99odJ/q//X/uIjniYjVcYbODAhChKxJe+elzibQxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RSCcdtVVJYb4uFR9i3jM6jle9vHHIwepMClFrRdPU4=;
 b=jqTMn8N5w1dzm6x4fpV7grmNaBr5N+o37xjTfYk+O9Ei4QzTgNaYrZMwQQsZQM6mxZiQOESsRhw3N6FIwoi3O1PCuUAckGwIvWnCdVW4IE9K7vmUycmyemwOznmUAUjtUlqGJdX6T7dKI6bZYzWn2gbrB/xaGyKdMoyscTtdmZE=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4225.namprd12.prod.outlook.com (2603:10b6:a03:211::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 01:25:06 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b18d:912e:908a:5952]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b18d:912e:908a:5952%4]) with mapi id 15.20.6678.031; Fri, 18 Aug 2023
 01:25:05 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "oss-lists@triops.cz" <oss-lists@triops.cz>
Subject: Re: [PATCH -next] usb: dwc3: remove unnecessary
 platform_set_drvdata()
Thread-Topic: [PATCH -next] usb: dwc3: remove unnecessary
 platform_set_drvdata()
Thread-Index: AQHZy5GXFxAURCpiy0CRsqYQ3zhHga/vTnqA
Date:   Fri, 18 Aug 2023 01:25:05 +0000
Message-ID: <20230818012501.bwnxmnt4iaa25km7@synopsys.com>
References: <20230810134710.114356-1-yangyingliang@huawei.com>
In-Reply-To: <20230810134710.114356-1-yangyingliang@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|BY5PR12MB4225:EE_
x-ms-office365-filtering-correlation-id: 82f1e97b-1c8f-4dfb-8596-08db9f89f427
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kNZD8jNelgHqRAqM4h/PpPu638CRraxul+LI0SCbCvw+E3AaFNz/fsRUk/9xtZxYhAKz0i9OtCmk/eGTzFkWARIC9uCuGDlLGh4tXNY3zyNU8eNmBxdRrgKctN44cA4UuBsY7NEhku5QagM0y9F3fIpktnf+4XhxH+bdY+H/OhuP4OVwQd9nSB1E7pSPRQrb/LPO9EWsqZzAs2YFHnTmnCvb+gxT3e03ZLfiLewQYE+UewOb4sc6wa7uq/4rTxXJ6obLd6r2vsYOePmwWDb07Q3DiqFGbQo1PP1AMlXPSQQAv+01U+liDDvUosQlTMkHCtfAtRp4g321Q1xDtYZFIZV91rnuQOfBV+hr4p0mrC1aikBcoyiv2UFyUMyocvJGcUOLa1AyrVmWRn95pRP8n1jruJkSaeoW6ZZiOZnhbB6XYdjbH3QiOVg4mKRU0r9RpciQVIivmZsZYmpaVLz69NgplA03JF/CgPflpgU1eXbSmn9ts1g+dbOPOiJcJSSshxxtqe8NJlHAyQbBAfwPBtedmQmMQlkKEnDL+L0oF7yYaHGHIeA53R/GSlOKX2ubJ9N3SrjChXORpr9loZtw7cGaNxvb32D8M9vrTt6qvlSh9SiFuJQGA8uBlOJbYzZr
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(346002)(366004)(136003)(396003)(451199024)(186009)(1800799009)(2616005)(1076003)(26005)(71200400001)(6486002)(6506007)(6512007)(83380400001)(5660300002)(8936002)(4326008)(8676002)(2906002)(478600001)(41300700001)(76116006)(66946007)(6916009)(54906003)(64756008)(316002)(66446008)(66476007)(66556008)(91956017)(38100700002)(38070700005)(122000001)(36756003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3dLdlByMlFTd2paeFhTL0ZNaWJBb05iNlRKWXRpNUw1RzZzbXl4bXNVanlS?=
 =?utf-8?B?TzU5T0M1eXBTbHhMMUlKaExZbU5RZlhrV2tuVGFPczhhcWN3RVZrNG01U1Rt?=
 =?utf-8?B?cnlZb1FiUzBCYzJBeWdzdGc5UHJrd2NFeW8rRjVjMTg0aloxaUY2YzA3NU1S?=
 =?utf-8?B?QXpkc2U4azVXNmVmSTNHb2RHVmVGbTk4OXdYOWJYVTRFS0dsNzUxaHlpZTVI?=
 =?utf-8?B?SXZJZ2ZXT1NDdktrTXN3Q20xai9TYlJKWXhYWFhSWnlCVWRjUE0wMElKUit6?=
 =?utf-8?B?QW1MU1dNOE1IMVJsODR5Mnp4RUZsUThRVDh1a0F5YWZQYWI5RmVKbkNhMVpI?=
 =?utf-8?B?dGI5OU5RY00vZGFxSWJjYnQzTDh0NjZUcUEzNktESVY2alRSeHdnalhiOWh1?=
 =?utf-8?B?R1hzbngzUVFvOHc0cHIvejhSL05qUHhnWGttVy9HQ0UvL0RRbFEyVUU0bFdD?=
 =?utf-8?B?OTdXQkNuaWJrZVU1Vkc2QnBHV3JTbW1pU0ZhT08xMlRwaDc0NVl3aDBEcEY4?=
 =?utf-8?B?dDQwRmU1UmQrb2Ryc2sreE56aHh6ejM4MDYxa3U0bGhyc0trdDczZ3pxNEdQ?=
 =?utf-8?B?alZ4dGo5WXEweTllV0YwUDV0UWlrMWQxY1c5dm9FR1NKZWd2RG0zNXJyOWRj?=
 =?utf-8?B?dmVWZ2lMTjRadU5hWTRxM3F6dGduQ1JtS1p1SHN2azdWOHE3dDdwQkVZNmpz?=
 =?utf-8?B?cUx2aEl3Sm9HdjQ2RWpqUUJsY2Q2ZnF0V3hSa045OHZBcEpFd085MXJPelNH?=
 =?utf-8?B?M0RocFBxK1MzM1NaRWRaZ2dNbG5GRW1FZXFndUI2YXI1RkdlbFhtS0M3N0hZ?=
 =?utf-8?B?U2UrR01OL2VrcXgzMVdBZnByTThRUmorMU1xcVREWVUzMlJnemZHOGNDaE1x?=
 =?utf-8?B?c3hFQzg4cUhzU2VSYzN2Wm5YZ1pjbWhCbElsT3VEZ3ZHRHQ1TXBnVXRDQjU2?=
 =?utf-8?B?Z2I3YXJCUldQWGtYemc4aDdFR2pUVnFkeWQzU0ZEOXBtbUFXazYyUlJPZE8z?=
 =?utf-8?B?M0dkTUtMN1pQdW5vSW5aTWVmTHQ2VkNxWVJIbU4rZ0tkRmw0dlM2ZFl5aXYy?=
 =?utf-8?B?VVBxYzFKUUp0TmV4Q1NpK2d2ZGxKZmVJR0NJdFRJVUk3R0d2QmpLSXlZc2Y2?=
 =?utf-8?B?WXByZHJqTUJVNVRyNTRWZkUzNHJONlREejNmWjdqUHZYV1JiZ0tJd0tpQmtG?=
 =?utf-8?B?MnYrWXZ6dlpVUENVMnFQK0JEWmJmZFZnWUNkWG90VnNmQ2tnVGV3SEhGK0Qr?=
 =?utf-8?B?eDh6NnROYlF1YUxYajlBVHdZMmxGVy9oOXVUYVBubWorYnhtbzlGZHU0dkJq?=
 =?utf-8?B?elFnZThhTVhRcFNGb1dpTzlLREc4ZVFxWGNOQldtblpmSjRqVk1ibXAwQkF3?=
 =?utf-8?B?Z1VlS0hyQVdrRU05L0dSU2hTL2lkRmxvUFFDNkNPbWVPVytNQVFqUWhXVHlZ?=
 =?utf-8?B?RXllM1FsbHg3NnN0Zzl2NEh1VGpQSGNKK1d1U1hOODRLWGpHSmtqaXloUWIr?=
 =?utf-8?B?TU5RWTFIZkY1c2hhQ2hiZDFmWmRCVko4UHdIMmNVajIzRElhSUoralZtWlQz?=
 =?utf-8?B?SGRENm5EaTlTbmZxaXo3dzd2cE0relYycVRQZ2xNSmgySlhnQUV0THA0blVo?=
 =?utf-8?B?V2MzS0EzTTQ2ZGN0MW1LU0dYNFlOSjk2bnFHN1YxWkVOMEVCd05MQXNrRGNS?=
 =?utf-8?B?amRTR0s3SnFRN2FiZ2FtWkxhYTA0RUJtZTcvcC9XMFMvY0dZZVdmejVXWlBW?=
 =?utf-8?B?WDdtcmhad0t5L1c3NlllT0R3cm5acFZVaklwNkZudjdVc2kxN042dlBnOTNo?=
 =?utf-8?B?YURuSk1KL2J0UmtVSGlpZEVzVXRjci9VZklscExocnRQcmgzM3Y0N1dWMFJn?=
 =?utf-8?B?T05KU3Y0WXlQdzV2aUZQeDFobW5hWVVDNkhCL0UrKzBvUHJmbWdVc2Faaml4?=
 =?utf-8?B?dW44c3hxbkI4VTQ5WXh6UURuODZDalVNMWZNdlgxb0N4eXBmdmFZem9PS3Zo?=
 =?utf-8?B?TFhBRDkzSXk1dWU3MFVZY2dkYU1jSWJxZjQrb2t5M1psWFcwdHFwUENiSXRW?=
 =?utf-8?B?dVB1M01QNnhHQW41REVzNDBlWEVscHl5Uk9YQkFxYjNnNTVNU3lqY01GOGN3?=
 =?utf-8?Q?nPpj88pVqgO2hqJ/4Fd2i4tzt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <63241F9EC8CC474FAA184ABE839BFE4C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: u+3gDKC+NDJ8LF06XfI3UH9N8G7DFUA3ussfFmSDFE2iq7DtokcfpYNHla7HXyM0lx4LoIuDQ1sG2P1JgVLMa0tlOGTozSzl8LChFXz9U5nZj++WfJjvt/PQk4RCcR2ufwiqeaLokUycyVJZm+gqJuYK6au/7a9hrUfFJ81SOqV8RTEiI0vdMTGoZPJxvAYtd2Y4KJHrQED8u0QhPfPHdeMfRXblkjEQmcXX7m3RpKO6RYi4c0hSFpRp5pS+TuuEhB/6mh3ZcHhfEAS2jWis1kdS5n/ObSVVUJrpmA3DLwObHcFM+gPQM28cQNKczjryMQWToKSd6T9g/UKsobUpx+uZFyCB29aNilOAqqL64GqW3qipbcvKhU4nK5hTqdlUVRJYxv8quzfxcqtyWJVJsL64JX0NPLiDfvWa33SHg6kis0WTbbABrHi1In8KXjd5SCW0fxDbjVFTpDBqkF0w6rRYStShDA2GekhOpr6PUsRar1nGuoL1epiCTHxEPiDY/0lGCWiV9hreC5+BCLskPv0R+2TpXfZzi8d4KOn5nW2ImhRLZUzcABymD3tBSMFzIpwrEhuiWvAiC0XPblSj4LZs+Y9JExiXNo0tH0vYShRW8cpR2aaUVKbMwQLc6A2Us8nqYStDC6K4+MiJREdHbmBz+MjwrOZPBQQLcgRHw8L2p1sedtXF4ILtbnEqBGnjADBmmF+9eDvT7mI1h8VOoPKHJSi/Sxhnh6lR+lQNThsAmopeNEvdhZxOTd9/us3tpZqEHfXwrb7MoqbZCHB8Os/J6J5a6LeydJ1foHaaelWUBNWsrEwRUKxKdc6ClmAEG47otgxzwWFPqZ6u86QEAp9zFROWLZBjQq1hXtilzUybbX2TFmUnDNY7NvaM00ntTbrlRintIB176eJg1cVpD5jkyKmoFhemsr/TZKdXW6g=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f1e97b-1c8f-4dfb-8596-08db9f89f427
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2023 01:25:05.8158
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XWllNHKVzdHvuuvRIr/3BFq/zpnYtZBrglGGooMZZXvyg/wChQ9w6tk2CVtvlaqUQvFZdUihOJ+o8jdQmE5M3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4225
X-Proofpoint-ORIG-GUID: -wTW_RIeNbMALUWNm3-54Dn5iBS6jhMO
X-Proofpoint-GUID: -wTW_RIeNbMALUWNm3-54Dn5iBS6jhMO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-18_01,2023-08-17_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 suspectscore=0 mlxlogscore=999 spamscore=0 adultscore=0 mlxscore=0
 malwarescore=0 clxscore=1011 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308180011
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCBBdWcgMTAsIDIwMjMsIFlhbmcgWWluZ2xpYW5nIHdyb3RlOg0KPiBSZW1vdmUgdW5u
ZWNlc3NhcnkgcGxhdGZvcm1fc2V0X2RydmRhdGEoLi4uLCBOVUxMKSBpbiAtPnJlbW92ZSgpLA0K
PiB0aGUgZHJpdmVyX2RhdGEgd2lsbCBiZSBjbGVhcmVkIGluIGRldmljZV91bmJpbmRfY2xlYW51
cCgpIGFmdGVyDQo+IGNhbGxpbmcgLT5yZW1vdmUoKSBpbiBkcml2ZXIgY2FsbCBjb2RlLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogWWFuZyBZaW5nbGlhbmcgPHlhbmd5aW5nbGlhbmdAaHVhd2VpLmNv
bT4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtYW02Mi5jICAgICB8IDIgLS0NCj4g
IGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1pbXg4bXAuYyAgIHwgMSAtDQo+ICBkcml2ZXJzL3VzYi9k
d2MzL2R3YzMta2V5c3RvbmUuYyB8IDIgLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1vY3Rl
b24uYyAgIHwgMSAtDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLWFtNjIuYyBiL2RyaXZlcnMvdXNiL2R3
YzMvZHdjMy1hbTYyLmMNCj4gaW5kZXggOTRkY2JjNDQzY2YyLi45MGE1ODdiYzI5YjcgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1hbTYyLmMNCj4gKysrIGIvZHJpdmVycy91
c2IvZHdjMy9kd2MzLWFtNjIuYw0KPiBAQCAtMjkyLDggKzI5Miw2IEBAIHN0YXRpYyB2b2lkIGR3
YzNfdGlfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJY2xrX2Rpc2Fi
bGVfdW5wcmVwYXJlKGFtNjItPnVzYjJfcmVmY2xrKTsNCj4gIAlwbV9ydW50aW1lX2Rpc2FibGUo
ZGV2KTsNCj4gIAlwbV9ydW50aW1lX3NldF9zdXNwZW5kZWQoZGV2KTsNCj4gLQ0KPiAtCXBsYXRm
b3JtX3NldF9kcnZkYXRhKHBkZXYsIE5VTEwpOw0KPiAgfQ0KPiAgDQo+ICAjaWZkZWYgQ09ORklH
X1BNDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtaW14OG1wLmMgYi9kcml2
ZXJzL3VzYi9kd2MzL2R3YzMtaW14OG1wLmMNCj4gaW5kZXggNDI4NWJkZTU4ZDJlLi5hMWUxNWYy
ZmZmZGIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1pbXg4bXAuYw0KPiAr
KysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtaW14OG1wLmMNCj4gQEAgLTI4MCw3ICsyODAsNiBA
QCBzdGF0aWMgdm9pZCBkd2MzX2lteDhtcF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCj4gIA0KPiAgCXBtX3J1bnRpbWVfZGlzYWJsZShkZXYpOw0KPiAgCXBtX3J1bnRpbWVf
cHV0X25vaWRsZShkZXYpOw0KPiAtCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIE5VTEwpOw0K
PiAgfQ0KPiAgDQo+ICBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGR3YzNfaW14OG1wX3N1c3Bl
bmQoc3RydWN0IGR3YzNfaW14OG1wICpkd2MzX2lteCwNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dXNiL2R3YzMvZHdjMy1rZXlzdG9uZS5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLWtleXN0b25l
LmMNCj4gaW5kZXggNDE1NWU4ZDVhNTU5Li44ODk5MzQ4YjYyNzYgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvdXNiL2R3YzMvZHdjMy1rZXlzdG9uZS5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMv
ZHdjMy1rZXlzdG9uZS5jDQo+IEBAIC0xOTcsOCArMTk3LDYgQEAgc3RhdGljIHZvaWQga2R3YzNf
cmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJcGh5X3Bvd2VyX29mZihr
ZHdjLT51c2IzX3BoeSk7DQo+ICAJcGh5X2V4aXQoa2R3Yy0+dXNiM19waHkpOw0KPiAgCXBoeV9w
bV9ydW50aW1lX3B1dF9zeW5jKGtkd2MtPnVzYjNfcGh5KTsNCj4gLQ0KPiAtCXBsYXRmb3JtX3Nl
dF9kcnZkYXRhKHBkZXYsIE5VTEwpOw0KPiAgfQ0KPiAgDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCBrZHdjM19vZl9tYXRjaFtdID0gew0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy91c2IvZHdjMy9kd2MzLW9jdGVvbi5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLW9jdGVvbi5j
DQo+IGluZGV4IDZiNjU4MTA1NzM0NS4uMzU2MzQ3NzgwYzE1IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL3VzYi9kd2MzL2R3YzMtb2N0ZW9uLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2Mz
LW9jdGVvbi5jDQo+IEBAIC01MTcsNyArNTE3LDYgQEAgc3RhdGljIHZvaWQgZHdjM19vY3Rlb25f
cmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJc3RydWN0IGR3YzNfb2N0
ZW9uICpvY3Rlb24gPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gIA0KPiAgCW9mX3Bs
YXRmb3JtX2RlcG9wdWxhdGUob2N0ZW9uLT5kZXYpOw0KPiAtCXBsYXRmb3JtX3NldF9kcnZkYXRh
KHBkZXYsIE5VTEwpOw0KPiAgfQ0KPiAgDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZCBkd2MzX29jdGVvbl9vZl9tYXRjaFtdID0gew0KPiAtLSANCj4gMi4yNS4xDQo+IA0KDQpB
Y2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFu
a3MsDQpUaGluaA==
