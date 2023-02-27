Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03D0D6A4B39
	for <lists+linux-usb@lfdr.de>; Mon, 27 Feb 2023 20:37:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbjB0ThV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Feb 2023 14:37:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbjB0ThH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Feb 2023 14:37:07 -0500
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C17A26862
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 11:36:42 -0800 (PST)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31RHKRee009573;
        Mon, 27 Feb 2023 11:36:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=XfQzctJs1vus5eXipIxP/6E5tIQcU7T2IVGG3pvHm0g=;
 b=fUx4R7jmcqRCAM0Nwr7eBILCRE94vL5/4A2x3M1XGNtrNKDYzPxGNTFFezdmwM3MRLPQ
 6VMEJ9aGClY8nUJvHjiSR83EuqPXu1+sjkSMhUngRJW0FDGPaFxZef3C0sJdS5BJ8SI5
 PPyOkYI0giRDwUSKw2cla7UukP2Oh2vlhttHhWRdyMAZVJLmykWmNiPSqpIR/23osRrp
 GPM33OxiSHboGsg7ksqec2gATJe7jtzbzmYAI+Fo5lPn+TcTWjVNL22yCX00ZqfL9gWE
 dqk0apdfGN6uyLFY9FbKUoA4kZhTGR/PnhlPuAuZDiOurmp+rKgS8qmaT8eXYiza504Y 9Q== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3nyjfcy37t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Feb 2023 11:36:18 -0800
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8D587401BE;
        Mon, 27 Feb 2023 19:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1677526578; bh=XfQzctJs1vus5eXipIxP/6E5tIQcU7T2IVGG3pvHm0g=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=mBJLXOJW1ahmbYxtGvPjkDRats/D2FMjfclpDza2L8e/af9ALjCNc6frTYcfoyk/w
         8VISLdEXbk668KQB+uPq9fbM5dvgEhRkAdPVtLPIDN9d20hL5ZTbIvLigdAozAz2zg
         7+yIGaPCJIWaQkdxHs6hVW6WIlJ+hojhtAAJMFIQZORkA90oCW8iKEPMvIwx4EFyu8
         WUCZBXrode5mIw6qTFEkhUAd9d6Nyzn9h8GAqXpXoIwBJUTyYHDu9FoUIusAMQyEEQ
         0yjQbOhdfiOohRBe65ZK+fU5j6CHQOHtrhZlTE9oxbDz792zS1edQgYcJDSIAGz0zV
         OPVh8U5KMuXFg==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 73638A005A;
        Mon, 27 Feb 2023 19:36:18 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 091934006B;
        Mon, 27 Feb 2023 19:36:18 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="O7gihWMS";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NaCS2pPjsfeLN2yqiIm9mhEkRKWVeaTXy9yjcqmRzdBnzd3SFKzd1K4G7YxxNW7X84YIaWIXJaAg/feAec53/5IKs+QoqUZFzD3XnUpzqYZmadNGroUuAppHBrDhqv1tukRQOvhq4LLKN4D0cRk44PJYYb1BKJgW9i6EuIjFSXPo400HOnbwOZHAYGSj5Jn2iwWe8y7UrN6/4EyB1Ue6aYd/S8tVqIksVrhE+UP2FZjFj8YoImcLkcjDZS5t8Vrtq0H9SP/8k1RQPaMRdGhohMMvpTDeNTrIds4PBSZmcgFravMQe6WKZ1BspXs0zSMGisrlIcQk9HtfMQtmlscZnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XfQzctJs1vus5eXipIxP/6E5tIQcU7T2IVGG3pvHm0g=;
 b=Ng4e2TFf6iBl//o83Q07eMpeOYe+qkz7eYUurZLF6H0JXdme+NK3E0RUi405BlljaWp3GwBfx1Al7kiNzYkSTjQnthjxHHKDn6sMiORmmzoVlqSnJ7+Cg+UMfkUVbjnWhWUm0+WUX/SzfDV2CxooY9TcxNoEd/1BvNGh2u9fUfj+TQ582fjINqxAFk8xHejhfrD5b3LcxGC8n9oz9/Hbgh+uoBnbAq0pftwcUPElRdX0K8Pqs2rTYREPmep+P8wwxVl0pgROHVeJc3fbdaVPIjushV3VV5eyE6BOPcRhPdMr3qhaQCadVGATVGWBWWdvdRBWirLaWmY/+yS5TzpdrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfQzctJs1vus5eXipIxP/6E5tIQcU7T2IVGG3pvHm0g=;
 b=O7gihWMSiWcSqTJbiCxahJoafvw4B5m0IbjoTKn9PmjlkQj6fQ6JWNRTu4rg7aTmeMldxTfZxusqAKXcIII/d1voSo8YYo7Wv+b6Wgutnd4TBrJINSlRP4e4OrwOuTgANEDN0et6QQzfAbeD40WlCKPV6O/gjzUAH6rIxUZWVNo=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by CY8PR12MB7340.namprd12.prod.outlook.com (2603:10b6:930:50::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.25; Mon, 27 Feb
 2023 19:36:15 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::6f3c:bd8e:8461:c28c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::6f3c:bd8e:8461:c28c%7]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 19:36:15 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: Re: [PATCH 1/1] usb: dwc3: fixes a typo in field name
Thread-Topic: [PATCH 1/1] usb: dwc3: fixes a typo in field name
Thread-Index: AQHZSEaH1nF5YnI9lUadckywparhAq7jNPEA
Date:   Mon, 27 Feb 2023 19:36:14 +0000
Message-ID: <20230227193612.fe3hqwdjnc4e3pax@synopsys.com>
References: <20230224115224.2838636-1-vincenzopalazzodev@gmail.com>
In-Reply-To: <20230224115224.2838636-1-vincenzopalazzodev@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|CY8PR12MB7340:EE_
x-ms-office365-filtering-correlation-id: 684696ac-eb24-485c-1bd1-08db18f9e3a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1EHcwUcAtLmnwjKOMmQ+WhjHHBDfGTF772XaMmn0CvyFc0FbqVqxBNTL60LA9tRULe7qCKxcrvv5HuualQH6dFEZoreIL64QrluJVUuAfYWJbuaWqv5nxEHtsn0QmDaqAvbRCwMHEeccfghNt9pG4GvJAoftE8HPCV4DeJo+I5gy+LME1A7gzcHjeRwEjZP0EEFQy0abn6UQb6y3QtgXGWVzHsYvCt3fBlF9TjcwHF/Op07DOBMhbUenI3aItDeWPX7ZxhDUj4mVqsFDrVY3z2c1CN1KZ+j572YDWjkFb0k0TZm3xgjSVKK2oE4ripQ3X1BEs6x17QVDOL6YlawicUwjqdl3o0tPy8A3/63ku/+ZClfighCwD8qzIKrpQ0ZLC1S6sxtiCfdHx65+hqFkqJGd2tYdZ8yAF414CIpqE0rJ5Y5FfWzP4kQg5ES0fbqwinR06DpYsZFXDmunrvfOMcWGt0r/0xzvKCNFXcy5lEmj9+yZdVUpz2FKO9bbD+zVabZfOgKLCPoAL6+7cXX4x+kiG0plGZCDQQlA5uuey0erde3P8PliNbJ76iFOlwuscY/4gD9dESEHBWzojCH/dd0YsvOXzGYs70iSN7kuyWVXOS3iEn5StMkCwxNF6uuPyf8yofQ5xhb1Porgmd2q0lAGnYgYHaVbejEZwp68MFaPhbtrJN/vUs+lpCtzmY5Sf08/jAdvFpt3En5f3TzX2w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(376002)(136003)(396003)(346002)(366004)(451199018)(186003)(38100700002)(83380400001)(38070700005)(122000001)(41300700001)(66556008)(6916009)(66946007)(71200400001)(8936002)(76116006)(4326008)(66446008)(8676002)(2906002)(66476007)(64756008)(6506007)(6512007)(1076003)(2616005)(107886003)(478600001)(26005)(36756003)(54906003)(5660300002)(86362001)(316002)(6486002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UU1kbU1KMmdaVWNseVNFaldIaUdMcllMOE5JQ085WENrVTlITzBIK1NOeHph?=
 =?utf-8?B?T3l2aXJhLytBR21tMDVWdFNWZDFBVXFKTEpFVTZCQTVILzVXRFVtYnhHTHBL?=
 =?utf-8?B?Nkc1b2JqS1RmcFFudzlaMEt2V1hJWm1HMUVMV2RvSXptUGY2S0FLN3lrcWVX?=
 =?utf-8?B?aVI1UFgzanFPMzlkWXFUOGtObVVROEJmc1ZJZTJLUGwxVTkvTVEyM0M5ZmVa?=
 =?utf-8?B?c2p5aEl4QnpnQThpYkk1a0Y3R1VhRWdHY2dmTFl6Y1N6TnZ1TTVCWVNVaFd3?=
 =?utf-8?B?dWhzVGtEbHBEL3pRNXNWVmdKUkhyOGZNMTNROTVzV2V1R3pOeDU1aFVPR1Fq?=
 =?utf-8?B?cTlKUncySzFRamY4UUJ4VWFEQjhzRDMwZTU0dEdIMDNaK0tPTFRSTTA1K2l2?=
 =?utf-8?B?RUhsbjVocjk5Vm1rUnhFMFYrNzhrdVUyb29DNWZKcU5jQ2hKS1MzZkViZEly?=
 =?utf-8?B?UEhHUXNpbnVicDU3TzRVRklhcXFCWUdQQTdBOFBySTBGQVp6cnlqY1gxUTNv?=
 =?utf-8?B?S2I3anFxdk9CV3kwNlljZWdCWVBnb1Y1L1lyQlJZQUFST3p0RFF3aDhMZFlB?=
 =?utf-8?B?aGViMWtMTlcyZlFMKzlCbFFuTHpVVmM1dGxFZWhEWFZLUjczMUMranVud1pG?=
 =?utf-8?B?a2MyaEF0YjcyaTJoOXVaUVppdVhIK1d0ZUdvOUphZ3gzYktvRHJVWjV3Z2Jp?=
 =?utf-8?B?cEVONEI2M1hYdWFNdEVZbEFkV0dxZVUvanRFU1ZvYWJVUkErczg3WXltOXVE?=
 =?utf-8?B?TEJHSWc0U2RrcWFheXVWYldnTFd5andoa252dWFReStKY0gvbDJBSkJCUDZ3?=
 =?utf-8?B?UUJjWE1NSEdEQ3Z6OTBYaTQ0RUtpTUpYOUUwbGcxRlhTQmI5NlRidHo4aXky?=
 =?utf-8?B?cFlRYzRkQnkyVmVqNXY2MS9kYlQrUmJmYUNLdkd1dXhwYmZJTmRaQU15MUJk?=
 =?utf-8?B?MDBTNm0wQnBtSEliTDJvZzV5YkZRZys4RmVONDdicDRYTXlIeTN2a0dWR1NC?=
 =?utf-8?B?Z0Fic05UNjcrWjhlVjhEVFpUbVNaYllwdWIwM1ErcG1NVXdycWNVd0pQNDg5?=
 =?utf-8?B?OW8xVmpmQ0ludFdLWEszU0RRay93OG40WHQwbHQ0VmdUdk95ZWM0MTB0d0hn?=
 =?utf-8?B?dEF6STZSclVRMnVOTjVUeGhkTk9kSVJFd3p5dzIxOTZYRzFGcytENEhZbXJV?=
 =?utf-8?B?SXRWMWZESjlWTEdxbWwrVDVHVGpBSURDd0VzazhnQ3BKR0kyVk1rQ0VrRHdD?=
 =?utf-8?B?eGtZQ1F2SWd0enNwSU9ZR29lT2dsUW5ud25paDhPOFI1VWFPaW9pbUJ3WUVn?=
 =?utf-8?B?QnJ6dHVHcHhXMVFWQk9EY0NJSlFlVzJSMWdxVjYzbXZLQVFkSThSOEZNVmZW?=
 =?utf-8?B?SHBoakt5VFN5VnhzbExmemdDdzNIMjdZa2FVaVQ1UDdzY1c3Qjd0ZGQwcDJv?=
 =?utf-8?B?THVSSW5Xd1Uvdi8rR000VTR1WEloQzdTMzdvLzVudVgzM0kzMlUvT1lNOW5z?=
 =?utf-8?B?UHJQam1ZOGUyblFldlpMbWwrMkZOa3V6VDlCQVUweWFUVVBLSjhzS1VGd0x6?=
 =?utf-8?B?VEpsb3NTVm81M3R1bWZQVkxyZkZSREFpMWErMm8vYVVUN0VJNmx0aFBFZEI3?=
 =?utf-8?B?aUpzNHpVL1VBalFBSCtCTGtBWlNoVFNZN2dxbVJmVzM4Wmt3d2s1empkWmU1?=
 =?utf-8?B?Q0xoWFJONDhJWXhUaEVZUUxOYktkZmxuUlhldXhUNE1PZkZ5eDIvREhlVkN4?=
 =?utf-8?B?Mjd3UkI4WmZkWkZQMXkxZ1pYZEpscWlTMFNBYTBjVytvaGtTcytZNUh5RHg4?=
 =?utf-8?B?NzFuZHBvWlJEU29yTVJDaFBoV2p0MGFCYjJWdE9ib0Zpa0U4bUx0WkJTT2RU?=
 =?utf-8?B?N3VJaFZibGJxTzhyN2RlbWcxTmdnbTQrVHNxZEJNSnNBcXFWZnNnSVNzNkFG?=
 =?utf-8?B?Y0NKaUljYmZXMU1jMCtQWEhzVGVRemZNTE5iSkFpSC9mV3BXRnRFYzlseHVF?=
 =?utf-8?B?K0FTb3VwU1pxQWMrSnZKck5EYzhCVkRqQ0lPQUJsUFJGMlFPRERPcHVZWGJh?=
 =?utf-8?B?YlkxRGNZV1NPRmJDZVdEMk9TbnhuZTgvNnVnanBJRlJWdXkxaElXWmYzd1dv?=
 =?utf-8?Q?b8TtPzOXU8xB8wEFt/2Ly2jK3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <40779641EC7C9049BDF9912AB2E9FFBB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 6ucd9DsZgud7prKA2e2VpWmzV1+4lCtUn/svUFNf65Tf49OuU8eIakKYyN3zsGswlcRBlCM8J8dM6rkXu7QDyAsmX9GmfEDBgRQ1j89tnghfuDHA2TgxXNe4iHvGKw3vbOIFVrOqgesK/R/8f0w6H0D02v9OuOcVGNxRC19NSJ7a1ZmL7oi87Ws96i0XRtE+CXP82nrJ+kYuIp0xvk0NOd3tFkt7TTm1NgFdWdp7C+9BqrcVkfq3jO4/EuyZJ3Yp/3Bbxso3pRiuMHMmYUM0VyiZKwp2ebXT4kOEmT2nxBIjMDPdZFiKeV1ZJwPRleeiGh1a1EGa7+J2yScWbkFCDIa1+qbOlxYZKwGKr85DZ8EiWs7NxbZctEMrBXgqnLSWTnD/GmVAVxPwRwapu+htNs860VsDo8xtU5n0woXZ1uOJ61a8/Nry2adm9oqYY+KfaTAVFwJVQtdXyGdb8BFRmY2McbzaKc0LBuAy3WM+O1uEUiBGBi5S/wdT23tmPLzZHqx3IMioKI43Wr9D/ZAfqVLmfJd7sa/+vnko1iUdDgEkvjNOJo8ioRfXtpEsA6boWMc38z97gZpKBZGP5vJ1P/5r+knylyRsgQsPxtZSffxJLA0aiYiKUtn+QA9995DUdIKzDc8hneOfR7WU06btKcYr9Ygh8hAnFAOhnak7vbG8p89W9duEgsl7kME636+Sy0Yhklm6C61eOX4WYbshUnM6gHZl06kc1EIUZMXJfba16EXqWoDreHjr4lB2W7ZQa6/4M5ZWKL/iCq5nsNmZXzt+7qtm8kveUXoSuih2tp2cVjHDqu6QRtZ57GOBr9lvuYaBkcwJR24aVjcaULAkDg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 684696ac-eb24-485c-1bd1-08db18f9e3a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 19:36:14.8334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M2lc5Upo3qCfbcLBmOqPFge2K3texjdeNZLBDlcDClvwPyXEo3flDspHjOnRexDXt7t/jtj3Ax+JTFCyaq6sCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7340
X-Proofpoint-GUID: 7erNzutf3sYt3pdmxtzIpfpg5w-YFkD2
X-Proofpoint-ORIG-GUID: 7erNzutf3sYt3pdmxtzIpfpg5w-YFkD2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_16,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 mlxlogscore=682
 impostorscore=0 bulkscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302270155
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gRnJpLCBGZWIgMjQsIDIwMjMsIFZpbmNlbnpvIFBhbGF6em8gd3JvdGU6DQo+IGZpeGVzIGEg
dHlwbyBpbnNpZGUgdGhlIGR3YzMgc3RydWN0IGRvY3MuDQoNCk1pbm9yIG5pdDogY2FuIHlvdSBj
aGFuZ2UgImZpeGVzIiB0byAiRml4IiBmb3IgYm90aCBoZXJlIGFuZCBpbiB0aGUNCiRzdWJqZWN0
Lg0KDQo+IA0KDQpDYW4geW91IGFsc28gYWRkIGEgIkZpeGVzIiB0YWcgd2l0aCB0aGUgY29tbWl0
IHRoaXMgZml4ZWQ/DQoNClRoYW5rcywNClRoaW5oDQoNCj4gU2lnbmVkLW9mZi1ieTogVmluY2Vu
em8gUGFsYXp6byA8dmluY2Vuem9wYWxhenpvZGV2QGdtYWlsLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL3VzYi9kd2MzL2NvcmUuaCB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMv
Y29yZS5oIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gaW5kZXggOGY5OTU5YmE5ZmQ0Li5h
YzgxZDUyMzcxMGQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+ICsr
KyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+IEBAIC0xMDk4LDcgKzEwOTgsNyBAQCBzdHJ1
Y3QgZHdjM19zY3JhdGNocGFkX2FycmF5IHsNCj4gICAqCQkJY2hhbmdlIHF1aXJrLg0KPiAgICog
QGRpc190eF9pcGdhcF9saW5lY2hlY2tfcXVpcms6IHNldCBpZiB3ZSBkaXNhYmxlIHUybWFjIGxp
bmVzdGF0ZQ0KPiAgICoJCQljaGVjayBkdXJpbmcgSFMgdHJhbnNtaXQuDQo+IC0gKiBAcmVzdW1l
LWhzLXRlcm1pbmF0aW9uczogU2V0IGlmIHdlIGVuYWJsZSBxdWlyayBmb3IgZml4aW5nIGltcHJv
cGVyIGNyYw0KPiArICogQHJlc3VtZV9oc190ZXJtaW5hdGlvbnM6IFNldCBpZiB3ZSBlbmFibGUg
cXVpcmsgZm9yIGZpeGluZyBpbXByb3BlciBjcmMNCj4gICAqCQkJZ2VuZXJhdGlvbiBhZnRlciBy
ZXN1bWUgZnJvbSBzdXNwZW5kLg0KPiAgICogQHBhcmttb2RlX2Rpc2FibGVfc3NfcXVpcms6IHNl
dCBpZiB3ZSBuZWVkIHRvIGRpc2FibGUgYWxsIFN1cGVyU3BlZWQNCj4gICAqCQkJaW5zdGFuY2Vz
IGluIHBhcmsgbW9kZS4NCj4gLS0gDQo+IDIuMzkuMg0KPiA=
