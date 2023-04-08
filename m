Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E3006DB812
	for <lists+linux-usb@lfdr.de>; Sat,  8 Apr 2023 04:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjDHCAa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Apr 2023 22:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbjDHCA2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Apr 2023 22:00:28 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECC02CC01
        for <linux-usb@vger.kernel.org>; Fri,  7 Apr 2023 19:00:27 -0700 (PDT)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 337MxHSY023708;
        Fri, 7 Apr 2023 19:00:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=zSlwyog9sSX+p/jloX//3k4190hRbHRMzn2kHsR339w=;
 b=eUu4zRiRT61qCPbZUMs5dPVMX6I3wZ8waOcnpnINkYUJdJURTPoBu8x1jwOwiDZZzBBI
 fSWwHsvDQ5XmvNpa3LcrI1SMDWDbTXh79WelG5GUoVsFcv3qV4jIwA9kriduq0YOLjZh
 3trhTvutXjWr/AvX2rJ+Zc8caenIzFp9hUBej4fshmOi/Ao0H7zhpRRPwLfJDqPSmIt2
 N1SeMJoIveETGsYGxUzZyA4QQJviZhFzcQ9M0BnJOOxKExVMvL3KRWavYSDu7uqz4oU/
 rU4LFt3/46kNFqRZOcz1+SK7M44kLrY4phNyE0e4IJC8xfSsyoBJ0DXcS2snGFaRUDoh 4w== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3ppkhy7w3k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 07 Apr 2023 19:00:22 -0700
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F3CDBC04C0;
        Sat,  8 Apr 2023 02:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1680919221; bh=zSlwyog9sSX+p/jloX//3k4190hRbHRMzn2kHsR339w=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=E6len11GLEPv2AzzaebrI3RSzvpK/q7B384+V7oQPGoPag+3ZKIxn9EX4tKGxajOG
         HPCyjn7cZNihQFbQfLxradgn7rXxrNlCaTswUkZSIYc+upZxYkKwlWa2ciAyKOSxCp
         ssHF5DlRqKczsYEl9WaQSrlfVOUVm41tYc0E+NnxU7TNuArD/vohl8ASK2ghdMeb8N
         x3mk+CEz/0galEhAl0K00Yn8QudAulygozYB3kzz6flLYkpbI75uABLQVWgXT2rez4
         5nw3LXmTfoy/WQl/fm+z1jBUvoRCajuNCC6ttQ3bIqbXPreX0+KS/Er79lxoZv/FYS
         Mz0QYTIUugUug==
Received: from o365relayqa-in.synopsys.com (unknown [10.202.1.141])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relayqa-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id C731EA007A;
        Sat,  8 Apr 2023 02:00:20 +0000 (UTC)
Authentication-Results: o365relayqa-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relayqa-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relayqa-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=r9yYDqJ3;
        dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2170.outbound.protection.outlook.com [104.47.73.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relayqa-in.synopsys.com (Postfix) with ESMTPS id 6EC6D220D71;
        Sat,  8 Apr 2023 02:00:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JsXCUx3KcQfGGw+hXjebBGjr5GauCiM27GTK8UYSYJKYTygeuMC2jM/2CiUV4LTTmV+SJnuEOpYKrCyhkt++6JvyK3f0DlyhMBE0cpoP7v4HGNL7iCgqGDcDnAdVZ7DG9V3jNcQSBgcND2fCqYZHG9IB1dQq8P6B2Ob1HdEs3MdPWflY7BLIbmLdaixDO8r++QqzM2AE4PBX+XAqU9M7CIJD0tFit0gQS4vYCcR/e4f2AHVlN+IZQdwYF7nccGLOKH29mHjPnr/c+h1s4VpCpUGGGc29smS23MvIhEBE3dTqqD3t5XiIZ4x/yC2kg3M+xkJNOBC9D9TKUi26+jzbIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSlwyog9sSX+p/jloX//3k4190hRbHRMzn2kHsR339w=;
 b=eHEngTyuL+HUIoAaULl8LjKVkE923Cp7Xe9LU4DPNY5WfUpgYDX+7L+wIJ0/sOZS1Pom/szQmfQZHgfdMB/TdNHG36uNDuzdKrb52bMB94njK08SH5IFfcQBADgZmTby+5NWGJk51P3b+0EkwcP+KN4YuLLb5jEr0H/CEb3X2C5pFM7bQ9olrEpuZLBfMZ2G6YBEGSdFB+IdKB0hG2mrSHfGxRCpM3hnt3467ylB5xzm7quzvTW1hG5C9qs0ncbnKkENfKXQWoext2nIFOTm0f77RC27MRc4VH7joLH7AlxDfgS6fsgAmitXdIPJntxL8jGnnwqaCXmLLcfp7RFGjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSlwyog9sSX+p/jloX//3k4190hRbHRMzn2kHsR339w=;
 b=r9yYDqJ3ncGAhpQIZjO2LPeSxTQirXDEvv6p35FWDKaz5itxoOHRkM0B2Zfx3LHejcSCIt7bPooDKP8i0mE/zPOogLHhFq8nh7w/pXtE/nDWVTXEf937zl3RnhT7AhERNt6ozXBDgvsen4z8lpTAZSN1HKOt5ZxVZCDGGrF/9Jw=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by MN2PR12MB4407.namprd12.prod.outlook.com (2603:10b6:208:260::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Sat, 8 Apr
 2023 02:00:15 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c22b:eb27:6df3:8d25]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c22b:eb27:6df3:8d25%4]) with mapi id 15.20.6277.034; Sat, 8 Apr 2023
 02:00:15 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Stanley Chang <stanley_chang@realtek.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] usb: dwc3: core: add support for disabling
 High-speed park mode
Thread-Topic: [PATCH v1 1/2] usb: dwc3: core: add support for disabling
 High-speed park mode
Thread-Index: AQHZaRcwulkVsqC5UEeUDVjDczA2Xq8gqYOA
Date:   Sat, 8 Apr 2023 02:00:15 +0000
Message-ID: <20230408020009.i7bwu2oiivqklolh@synopsys.com>
References: <20230407060649.19126-1-stanley_chang@realtek.com>
In-Reply-To: <20230407060649.19126-1-stanley_chang@realtek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|MN2PR12MB4407:EE_
x-ms-office365-filtering-correlation-id: 7aef0e29-6430-4716-67ad-08db37d4fee7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RznAW1jWljd2nwfC1NGGvYNTncR0XFosvsCQb8Zo2yS8MHKvq6uq3VN9h0WCCmGy0DYEi+R8cUYyr8Nv7cN4NjyQ+VXXXvpt2ceFDkwiVwb3aeF5n5O53mlKom0Y8fNiPf4PDzA/iTCvCTX8oZsMqQWZ6TMpE321iwiWSfrkrD475Ky9SBVRLQFH05QJqEemy/NUMxrjb++2wq9Ye7K6crbD4L0+Bszrw0hrH6Lp6ErOkuanhdeDTklHqskbxOOZuj7+YdhtPD0a54jD0P2suhltmuCJVOeUfh9ANXOoELBi1ZsRPpPR/ZjAqt9jb/zL5/kdb2P9UgBgRpY6MH0QSJJ4+0GiVg12ME8fN4RK7UogiLd7WXtn1KA3wDMLHZOYus2KwJkBMMU3orEZ7zHN0x6EZXkJS3YWoDZiW0zfbQFdWeJfLnYDeWBPZ6jyplich0n3Tn390LyFxOQBhTh8JoQn1gkOmK3K2ZENKcKlfSz46Uy2aLpsu+ELH5YZwVcCUCZFRR+UvNO5HsbHKer954k4ZcmgjnNDW5yWowvhx5GdYZ3TbzfybMUFCBRnJBApYYdzxP9MXsCBFzCqzBuo6FKiQOlUUSyGG1Kux43NO0SCDaGsj+pqxvCCWDlRO/91
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(396003)(346002)(39860400002)(376002)(451199021)(478600001)(71200400001)(54906003)(316002)(6512007)(6506007)(1076003)(26005)(186003)(6486002)(2906002)(4326008)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(8676002)(6916009)(41300700001)(8936002)(5660300002)(38070700005)(122000001)(38100700002)(86362001)(36756003)(83380400001)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGp2dXFibmJTV1lhN1JLdkE5cGM4elhWd29qdSs2M2NOaTlPZ3lSOWlEZ3BD?=
 =?utf-8?B?c1grL3lqZ3NRZFhVb2Jqd002YlJOYmo5TWdydzdTaUg5Yk9QYjE3eStpSlFk?=
 =?utf-8?B?Sy9PRE9WN2V4a0xpOUxzZnF0MnlDVXVqNXZvd3QxT2I3TW9samtoL3FrVzJC?=
 =?utf-8?B?dmNOVm1SOWE5VkVpRUlaUHhsUzc0dnA5YmpSSWZZeUdSSnlGRDdBUW9LK3VI?=
 =?utf-8?B?OTJlNktlaHRibkhZcmI0T1RNVDNDYkQrVFR0M3pHREMreEZiaEhzMFdnTDhI?=
 =?utf-8?B?NHFxd3NkWUgxS21KS3krRloxdXAzZGVrNmJiN3h0MUhoZWs1ZnpwMm52eHV4?=
 =?utf-8?B?ZUlsaW9zOVlFcUZ4cmI2UFZPaVI0MUpYRkMyZUNyNStHb3ZiRGxFRXhUNWt3?=
 =?utf-8?B?di9uVHo2RVdVSFNaaHFvclpraTdOTENSdjNjZFdjVC9Va0kyNjNVVmdTZ2d6?=
 =?utf-8?B?ZERsYXJpV05BTlJmS3hla21tOVZnK2J5Z2VxSWhPMG54ckZJUVBCNzkxRk16?=
 =?utf-8?B?RWFhSHFjL3F1RFZCMVZrTmZnNjNlL1lIam1tUTNmRUY0THRPYjVQZGptQjJ1?=
 =?utf-8?B?Q0NEbHhHQkhsc1FIMWwwNW1laFVuZzVkc1kwRUFJYkduczk5WlloZDBiMTV5?=
 =?utf-8?B?YWEyV0pjWXRnV0tLOWtseEVHNzgxdDJFWTA2T3RoVzI1ZEhIYndyZ2p4TE54?=
 =?utf-8?B?bUpzOWJTVlZLSCtrUWw4dVVWRDZBekhReFlXbXpsbVZFRTVjMlA1QXYzcmgx?=
 =?utf-8?B?NUdOMTB1Um1EUjZDNEJCQittblA1QTZzbTl1R1RNZVZkdlFqMU1aQ2xvVnA2?=
 =?utf-8?B?dEE5Qy83aUl6ZFRZYTYvd0FmVkIyclpGQ2RWcGFiNEdJYmo0RWtLQ0MyNURy?=
 =?utf-8?B?R2RHckN0enpiTGtORVg5Mjc5enU0U2dNdG9aUEswNE9ZYWVGYmtzWnpQM1d1?=
 =?utf-8?B?MjRhNnFYK3IwSXlrK1pkbHpXTnVNdmNNQml1Wk1COHl2K1lMUVJuV3llbHVT?=
 =?utf-8?B?MmlNNHVrbDFSY0J5VTJYQXdyYXB2NTJMQmIwcjVDVHAvWDh2WlQrYnFRaXkv?=
 =?utf-8?B?RHFYZmNub3NjckYyWFlZSUYwbSthVmIrTllzTkFTUnVXYVRMbXVNTmVFNTNr?=
 =?utf-8?B?N3ZjeEpDa1h2WHVXS3ZkSkZIYlh6b0pBVFppWUdFYjFwYS9tMy9OVk85VzNS?=
 =?utf-8?B?MmNTTkw4V1daanVHb013N3ZnNUhQcjVqNWdNa2RGSkJzdnlqUk5wdzdSaDJL?=
 =?utf-8?B?MlhGN1VqcnYzbHFSRHM3VVZGUmxsMVp1aGRDVkNjdHo1TlczaXpyTW9qMWgv?=
 =?utf-8?B?TEYvRVRwQ0Z5TlUvM21NRXRFWFlmQmFpak9xaThRQWplb1Nxdm9sdWQ2L1RV?=
 =?utf-8?B?SVlZVXhRS1ZyQ2huNmZiR1hXY3hqY056M0ViZmZuUDlrN1Fvem5yK0JmQ29j?=
 =?utf-8?B?SExJSXhSQVFCOGZZM3k1YmhRYXdwc0xnRDNvWW1KVk8zSjB5Sko5ZGlKdFIr?=
 =?utf-8?B?bStGeURycVdoRDJWTFg3eDdqK2Z2eFR3dmtDUXF0Mzh2K25VOEFGRzVUbVZQ?=
 =?utf-8?B?eEE2eFpPNVF4RmJ1U3diZXNLZURQcW8rYURCcytoMjVvenFWSnpHZytXSHRH?=
 =?utf-8?B?cXFaV2RndEV6bjlGZHZoUmd3c1I1VkpXMHRxU05LemdHRXlqN3ByUU54U2FZ?=
 =?utf-8?B?ZWtta3BSMytHR0VDL2hRemVQbjZiZnBjN2lBYjZzN1doSXJ0UTZxTDlFMTNJ?=
 =?utf-8?B?SlpTYTlsTXUrQ2xvbFhzaGFXelBIY1BTNzVTcys1K0RqQ1lCZFZiRm80Si92?=
 =?utf-8?B?ZVRwclZpem9yNHZVek5NcTdHWjhTRlJvYi9vOUxWb240OWFqVENOd0tOOVpu?=
 =?utf-8?B?OTZOR1FlYkw4VUEvQ0dUREFJSzFMT3RIaWV5NE9XK2xud2FhVlI1WmZwcVRC?=
 =?utf-8?B?MmZqYXNLTEpsWUJGUDR5M0x1ZUtFcC9NcExwYTZSUzJyRkkwN1lZd09HaHlH?=
 =?utf-8?B?MGhmbGhTMVRrR1BVYW5xdUhxUGdNTFVrN1RTa3FvOEF2RTd2K0Vxa2NITGV4?=
 =?utf-8?B?SUQrYUlZQ1BWS3JESjdnQ0dQeHZhNE9xL05oZFNlNHkzekNSWS9lc05KcFpR?=
 =?utf-8?Q?HVACBkI0eLlGVDUIilHe1Oyev?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <54FFC6DDA6826C4CA3D715EE5039E465@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: w7CYRHJM+4yPRA+ctGd6k6lmzc1k1HiVl2sw2BgG0vnaUTWM1ldL19XbgfHZN8I7hE32Gzj+XxbXKCDPQ15MGFsSV8DywY7wMhpfo+kI/x2vYKPIN102cCknqossxvG4QY2KHh+HkZRNwNW6eJoAfiGFdoJvqf0igYgh9EgN2wOGKEAE9IZkC9BVsQ0N0xFzr284wNnzi8qAXw9g25DpTM6xjkqdxat4pmQlrDGbspfPj+6C8YLUof1ncYDfWMxEut8CDEuY8X3nUa2ZjjAFcbeT/D/7/C0mrPWWWy302mzSsuOMwiUCk5ejMX1M4BZZixwARfSfv5JnBD52OEmdEz987guKkL3QlPMlXAM1gM+dQTfBP/QRuV+83uC2vd8GGXhjeBaNJ/nmq1W5+1H3hzjTFBFauIOdTag16uK5F6u+8cf67+Ds9vTcaIdRtYJFn7jjkw+o9iD8HxG7NYAQVj24ywsLPOOW2l7Mh2E5g+BoWcFBBM+vhxhY4IoKACFwlM81j7FEVFcD6GibLhUKTuTRwYVAc3Qi+Elhr8/0xrTBv6zYiy8mMQp2orVa9aUIPXtigY54oOqUVlZrnKA36HR7mThV4Ue0VHRDIvIYNA4ty9KahwSjoBSoFqxWiOX081UFVpusf3mdMgcnYxYNix2L0xvV/XB2iKR+eQxCsfMfgp41MqV+cHlIpojnMi7tNnFBjvM8LVCUMexyBxvlSBRleR4SO4eU7IKsJ4jShY1hFZ+GY8TibbfgYzVHoJEXTQT5xWjZqRJo28/XkL/3xkWOzPMz5oaBQIQHSOJ8rHjBqrchTpcp1kClr2VjkoHOmopITmq6zqB1B/n3AQRuXA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aef0e29-6430-4716-67ad-08db37d4fee7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2023 02:00:15.2076
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nElz2FA/lICZHuPqsh8ouI8Njfcu6O79g53yRjOaV/Rl/XXt64qknAFrn14Rm+R7xBRAWA9/qDCzY6JtGraJ7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4407
X-Proofpoint-GUID: glXO8fK-Hy-AXtFnLVwQ8hJsczsDOR4O
X-Proofpoint-ORIG-GUID: glXO8fK-Hy-AXtFnLVwQ8hJsczsDOR4O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-07_16,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 phishscore=0 adultscore=0 clxscore=1011 priorityscore=1501 malwarescore=0
 spamscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304080016
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gRnJpLCBBcHIgMDcsIDIwMjMsIFN0YW5sZXkgQ2hhbmcgd3JvdGU6DQo+IFNldHRpbmcgdGhl
IFBBUktNT0RFX0RJU0FCTEVfSFMgYml0IGluIHRoZSBEV0MzX1VTQjNfR1VDVEwxLg0KPiBXaGVu
IHRoaXMgYml0IGlzIHNldCB0byAnMScgYWxsIEhTIGJ1cyBpbnN0YW5jZXMgaW4gcGFyayBtb2Rl
IGFyZSBkaXNhYmxlZA0KPiANCj4gRm9yIHNvbWUgVVNCIHdpZmkgZGV2aWNlcywgaWYgZW5hYmxl
IHRoaXMgZmVhdHVyZSBpdCB3aWxsIHJlZHVjZSB0aGUNCj4gcGVyZm9ybWFuY2UuIFRoZXJlZm9y
ZSwgYWRkIGFuIG9wdGlvbiBmb3IgZGlzYWJsaW5nIEhTIHBhcmsgbW9kZSBieSBkZXZpY2UtdHJl
ZS4NCj4gDQo+IEluIFN5bm9wc3lzJ3MgZHdjMyBkYXRhIGJvb2s6DQo+IEluIGEgZmV3IGhpZ2gg
c3BlZWQgZGV2aWNlcyB3aGVuIGFuIElOIHJlcXVlc3QgaXMgc2VudCB3aXRoaW4gOTAwbnMgb2Yg
dGhlIEFDSw0KPiBvZiB0aGUgcHJldmlvdXMgcGFja2V0LCB0aGVzZSBkZXZpY2VzIHNlbmQgYSBO
QUsuIFdoZW4gY29ubmVjdGVkIHRvIHRoZXNlDQo+IGRldmljZXMsIGlmIHJlcXVpcmVkLCB0aGUg
c29mdHdhcmUgY2FuIGRpc2FibGUgdGhlIHBhcmsgbW9kZSBpZiB5b3Ugc2VlDQo+IHBlcmZvcm1h
bmNlIGRyb3AgaW4geW91ciBzeXN0ZW0uIFdoZW4gcGFyayBtb2RlIGlzIGRpc2FibGVkLCBwaXBl
bGluaW5nIG9mDQo+IG11bHRpcGxlIHBhY2tldCBpcyBkaXNhYmxlZCBhbmQgaW5zdGVhZCBvbmUg
cGFja2V0IGF0IGEgdGltZSBpcyByZXF1ZXN0ZWQgYnkNCj4gdGhlIHNjaGVkdWxlci4gVGhpcyBh
bGxvd3MgdXAgdG8gMTIgTkFLcyBpbiBhIG1pY3JvLWZyYW1lIGFuZCBpbXByb3Zlcw0KPiBwZXJm
b3JtYW5jZSBvZiB0aGVzZSBzbG93IGRldmljZXMuDQo+IA0KDQpDYW4gd2Ugd3JhcCB3aXRoaW4g
NzUgY2hhciBmb3IgY29tbWl0IG1lc3NhZ2VzLg0KDQpUaGFua3MsDQpUaGluaA0KDQo+IFNpZ25l
ZC1vZmYtYnk6IFN0YW5sZXkgQ2hhbmcgPHN0YW5sZXlfY2hhbmdAcmVhbHRlay5jb20+DQo+IC0t
LQ0KPiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgfCA1ICsrKysrDQo+ICBkcml2ZXJzL3VzYi9k
d2MzL2NvcmUuaCB8IDQgKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyBiL2RyaXZlcnMvdXNi
L2R3YzMvY29yZS5jDQo+IGluZGV4IDQ3NmI2MzYxODUxMS4uOGZiYzkyYTVmMmNiIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2Mz
L2NvcmUuYw0KPiBAQCAtMTIzMyw2ICsxMjMzLDkgQEAgc3RhdGljIGludCBkd2MzX2NvcmVfaW5p
dChzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiAgCQlpZiAoZHdjLT5wYXJrbW9kZV9kaXNhYmxlX3NzX3F1
aXJrKQ0KPiAgCQkJcmVnIHw9IERXQzNfR1VDVEwxX1BBUktNT0RFX0RJU0FCTEVfU1M7DQo+ICAN
Cj4gKwkJaWYgKGR3Yy0+cGFya21vZGVfZGlzYWJsZV9oc19xdWlyaykNCj4gKwkJCXJlZyB8PSBE
V0MzX0dVQ1RMMV9QQVJLTU9ERV9ESVNBQkxFX0hTOw0KPiArDQo+ICAJCWlmIChEV0MzX1ZFUl9J
U19XSVRISU4oRFdDMywgMjkwQSwgQU5ZKSAmJg0KPiAgCQkgICAgKGR3Yy0+bWF4aW11bV9zcGVl
ZCA9PSBVU0JfU1BFRURfSElHSCB8fA0KPiAgCQkgICAgIGR3Yy0+bWF4aW11bV9zcGVlZCA9PSBV
U0JfU1BFRURfRlVMTCkpDQo+IEBAIC0xNTU1LDYgKzE1NTgsOCBAQCBzdGF0aWMgdm9pZCBkd2Mz
X2dldF9wcm9wZXJ0aWVzKHN0cnVjdCBkd2MzICpkd2MpDQo+ICAJCQkJInNucHMscmVzdW1lLWhz
LXRlcm1pbmF0aW9ucyIpOw0KPiAgCWR3Yy0+cGFya21vZGVfZGlzYWJsZV9zc19xdWlyayA9IGRl
dmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woZGV2LA0KPiAgCQkJCSJzbnBzLHBhcmttb2RlLWRpc2Fi
bGUtc3MtcXVpcmsiKTsNCj4gKwlkd2MtPnBhcmttb2RlX2Rpc2FibGVfaHNfcXVpcmsgPSBkZXZp
Y2VfcHJvcGVydHlfcmVhZF9ib29sKGRldiwNCj4gKwkJCQkic25wcyxwYXJrbW9kZS1kaXNhYmxl
LWhzLXF1aXJrIik7DQo+ICAJZHdjLT5nZmxhZGpfcmVmY2xrX2xwbV9zZWwgPSBkZXZpY2VfcHJv
cGVydHlfcmVhZF9ib29sKGRldiwNCj4gIAkJCQkic25wcyxnZmxhZGotcmVmY2xrLWxwbS1zZWwt
cXVpcmsiKTsNCj4gIA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmggYi9k
cml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiBpbmRleCA0NzQzZTkxOGRjYWYuLjMwOTA3ZmZjYjNl
YyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gKysrIGIvZHJpdmVy
cy91c2IvZHdjMy9jb3JlLmgNCj4gQEAgLTI2Myw2ICsyNjMsNyBAQA0KPiAgI2RlZmluZSBEV0Mz
X0dVQ1RMMV9ERVZfRk9SQ0VfMjBfQ0xLX0ZPUl8zMF9DTEsJQklUKDI2KQ0KPiAgI2RlZmluZSBE
V0MzX0dVQ1RMMV9ERVZfTDFfRVhJVF9CWV9IVwkJQklUKDI0KQ0KPiAgI2RlZmluZSBEV0MzX0dV
Q1RMMV9QQVJLTU9ERV9ESVNBQkxFX1NTCQlCSVQoMTcpDQo+ICsjZGVmaW5lIERXQzNfR1VDVEwx
X1BBUktNT0RFX0RJU0FCTEVfSFMJCUJJVCgxNikNCj4gICNkZWZpbmUgRFdDM19HVUNUTDFfUkVT
VU1FX09QTU9ERV9IU19IT1NUCUJJVCgxMCkNCj4gIA0KPiAgLyogR2xvYmFsIFN0YXR1cyBSZWdp
c3RlciAqLw0KPiBAQCAtMTEwMiw2ICsxMTAzLDggQEAgc3RydWN0IGR3YzNfc2NyYXRjaHBhZF9h
cnJheSB7DQo+ICAgKgkJCWdlbmVyYXRpb24gYWZ0ZXIgcmVzdW1lIGZyb20gc3VzcGVuZC4NCj4g
ICAqIEBwYXJrbW9kZV9kaXNhYmxlX3NzX3F1aXJrOiBzZXQgaWYgd2UgbmVlZCB0byBkaXNhYmxl
IGFsbCBTdXBlclNwZWVkDQo+ICAgKgkJCWluc3RhbmNlcyBpbiBwYXJrIG1vZGUuDQo+ICsgKiBA
cGFya21vZGVfZGlzYWJsZV9oc19xdWlyazogc2V0IGlmIHdlIG5lZWQgdG8gZGlzYWJsZSBhbGwg
SGlzaFNwZWVkDQo+ICsgKgkJCWluc3RhbmNlcyBpbiBwYXJrIG1vZGUuDQo+ICAgKiBAdHhfZGVf
ZW1waGFzaXNfcXVpcms6IHNldCBpZiB3ZSBlbmFibGUgVHggZGUtZW1waGFzaXMgcXVpcmsNCj4g
ICAqIEB0eF9kZV9lbXBoYXNpczogVHggZGUtZW1waGFzaXMgdmFsdWUNCj4gICAqCTAJLSAtNmRC
IGRlLWVtcGhhc2lzDQo+IEBAIC0xMzE4LDYgKzEzMjEsNyBAQCBzdHJ1Y3QgZHdjMyB7DQo+ICAJ
dW5zaWduZWQJCWRpc190eF9pcGdhcF9saW5lY2hlY2tfcXVpcms6MTsNCj4gIAl1bnNpZ25lZAkJ
cmVzdW1lX2hzX3Rlcm1pbmF0aW9uczoxOw0KPiAgCXVuc2lnbmVkCQlwYXJrbW9kZV9kaXNhYmxl
X3NzX3F1aXJrOjE7DQo+ICsJdW5zaWduZWQJCXBhcmttb2RlX2Rpc2FibGVfaHNfcXVpcms6MTsN
Cj4gIAl1bnNpZ25lZAkJZ2ZsYWRqX3JlZmNsa19scG1fc2VsOjE7DQo+ICANCj4gIAl1bnNpZ25l
ZAkJdHhfZGVfZW1waGFzaXNfcXVpcms6MTsNCj4gLS0gDQo+IDIuMzQuMQ0KPiA=
