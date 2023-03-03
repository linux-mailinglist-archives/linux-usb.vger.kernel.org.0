Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EADB66A8DCA
	for <lists+linux-usb@lfdr.de>; Fri,  3 Mar 2023 01:17:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbjCCARm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Mar 2023 19:17:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjCCARl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Mar 2023 19:17:41 -0500
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B0ED19684
        for <linux-usb@vger.kernel.org>; Thu,  2 Mar 2023 16:17:36 -0800 (PST)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 322MUwwu008216;
        Thu, 2 Mar 2023 16:17:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=dUtb0OcNmq2yUSk4og4/wjwpjbG7ad51ndDRMIh0FMg=;
 b=XiN6SUJg4uBD/cG1aR7MZRtPTTFEyzDkdoeyqHDPmoNzOgLrBHTsxJyRQMJQbcHyaUIE
 DHfHX9lAU042O/PU9sq5R9zZK5TX4c492UlmxwKZkEeEc7VZQPK5mdhPHRcXTc3T/9/x
 zPSQaJrPhlhj8l9CKJnYjRZ0g4Zn9er9t33jCUIBFhRdFnUdtX2oHy9HBD+rk9R1TEax
 DPcC3481y9iH5pVgUCGt6RjgCHf5LgsYlFpa3RRRJh7j8Vuk+2vInhMvC+PdDI5pjlbG
 dteHxnaowbB2ij8MU/AN8hodnRg6Cn+ziPeqhKK7QydfR40MHFSSTGPe4ygUvXQetoEf Fg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3nyj7uyafe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 02 Mar 2023 16:17:34 -0800
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1D55C400E7;
        Fri,  3 Mar 2023 00:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1677802654; bh=dUtb0OcNmq2yUSk4og4/wjwpjbG7ad51ndDRMIh0FMg=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=S6MfFMY64EBySsKvmkCqaGRjUGuCsXaHznFmEG4G86kIqR8M4oKKUfYeqkAl/WbN2
         aIAd4daJtjnRi/BdtRMo+HY1wxlOcdqtRL0rI5jvYdMMPuLJ8da4J20ZmRy8zWVegB
         L+wVhwzbYWcbw42dw2RtE/+53tHebaVYQ0XoAdcmi8Hxmi0mqD/qT26r1KYvMVgCHT
         qGT8ojGVHHFuic7MWTW3VCR5djAcXCQ6uFe1TwwhFdRXvbm2/QPCJJekbpQIRYZ7LG
         g73jrSL0+FM1o7oHcxxbTzw0SJRJjyMIsSsvdQGyFx3/LhVbC74SZ0iHp9z3ig+C1U
         j0r42tHNK+vWA==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id BF29DA005F;
        Fri,  3 Mar 2023 00:17:33 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 32D03800B3;
        Fri,  3 Mar 2023 00:17:33 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="IUQFUMy6";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mj/wNcmk/NO2KWRygsELM5mM6inkexURnqnqXEH67KXSqfmpa80ijzMl6a2Dmrt6aPebewV6pxyK6RMHa/epSAFmr+A7SKQiQhWMk1xWUMReqDHFoH7iss2TAoJWt4exSfa6LTMPk24vCjSe2bcemEyAKLMvPUzdQe86YZDd4DMZBih1b+sCQd/eQ7FU5wxKvFrzvgMtQEJXWh0KlpYgs7CvLbniUmpaxK7VLBx4z0CAN1XjsRltp2NolK7fDDhH2UhF4ExjuE4B4oOp8RJLUaMGEJil/Awkslg8jtYxvXORqMw2657qv2eYnCezM+NkuWYqw5z0ypCMAnsMfRqBzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUtb0OcNmq2yUSk4og4/wjwpjbG7ad51ndDRMIh0FMg=;
 b=Bz7LEPAshR3d56wvk9PKF1o//CucM2XDoHjeG5HWn/AM0epzBISbUa/ppvuMM1uD6mkgbJAFbu8GnywzZTD3Fe+BjgrCW3KJnH1JG6vLzCOs3AANp4pF0aSnnJ975ejOINJffi2ZKUZXm038zLNbWd2Lx/w4xtswvi8G0elZ1Ya09ulMXlo0WvBgfTSxuOAL+291t1W/ALOswvuDyfPU3r2G+wwZrcJpRzK2hdLRxdm5Nc6Qo3iB7ma9zoJtEI+5SJ5RCFsIW+OyFmzO4in6umb17ZXcCf+B7xdPkF747PjELkxjpw+JkLGhXB7gpUNsU84OzPlMELYL0RkEaXt0sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUtb0OcNmq2yUSk4og4/wjwpjbG7ad51ndDRMIh0FMg=;
 b=IUQFUMy6E75CCHBlx55rZheV904gY/szKcqYpi9jkeSWLC1z0QfeneQ8V0/yNg+cUqXiZmIWvOkfJCCRH+aCXWez1TwnmS/JxQPYaVtRFc3Y/UXcKDJTkiyfht3od/g/mDW/DiT9XXUP2s6+12oM2Aa+iDFae3akkJ2MhlxtRZc=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4084.namprd12.prod.outlook.com (2603:10b6:a03:205::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Fri, 3 Mar
 2023 00:17:30 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3161:c44d:8bb3:423f]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3161:c44d:8bb3:423f%3]) with mapi id 15.20.6156.018; Fri, 3 Mar 2023
 00:17:30 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: Re: [PATCH v2] usb: dwc3: Fix a typo in field name
Thread-Topic: [PATCH v2] usb: dwc3: Fix a typo in field name
Thread-Index: AQHZTRixTlBhgaMEBUCJaECgdhnRsq7oLzsA
Date:   Fri, 3 Mar 2023 00:17:29 +0000
Message-ID: <20230303001134.rvavxt4li6rxcaga@synopsys.com>
References: <20230302150706.229008-1-vincenzopalazzodev@gmail.com>
In-Reply-To: <20230302150706.229008-1-vincenzopalazzodev@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|BY5PR12MB4084:EE_
x-ms-office365-filtering-correlation-id: 7d7ed937-2ca4-46ea-c0e6-08db1b7cad33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QY3UnhQt+E+hFwrvbqZBWVRgAp0Oi/Sg0XZUUwTGWXevJYb7ualF9urkVOQB5gBzok5urFIc76R0tX+p9DG3gYWn9I4OsFsJ33spk8yYL5CVtTkv4BcIOSz2YLXzkV5vU7Eg5WWOWcyhwwKA3M1OmMKtd3BjnESygCSVC3rKGzLyzhMTK/9ATaxiaqihSALznlUEycIrr7lPDaSD9CqcSEmOSyoKcKFwdWaRj76H/BhGroPYssHUvvLkE9Fhy1mGOG6/mTYC1LV7eYvor8GUyS1jTqRwD52sDq6whaoIJpMq505OvCnAHAf2YfjWkwYo0CzDBxn9ku3sbNqKleRBo8nmNo6aEZQcKSjYygEsujAS+H8HwISL4CQ3eRC7VjpLz8iy+vfS0gXLQIV0P+r7KxtsDfKHRZ/3hnF2rsct1cFzyZh6mXjBSYPXGlx0IeFiOtk/CYCgMZgsmkt9NQSBiHpa1gmKZntv4vG66TEQMOFT5MHY4yQ8jhGdSfw4NO+i4BrwqAk2PkLuKzHm1RBgYDcMzflYA+SWj4eNnOAhQgelFB1s6sSwutWHJzmRILdNCyoQ0eREkEtdTY6DmPaBuMbPYLGbyCr/TeGTH3+iqtuY35RZCCQj9PbMxdpUJDQCPukZjBDkh03nkrLS6y8zPTpVsn16bewDpCSdnlfPao6CDxhj6NzkJidv2El6CqPex2v0UapYceDuKnuiSJ3XWg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(396003)(366004)(39850400004)(346002)(376002)(451199018)(8936002)(122000001)(4326008)(41300700001)(8676002)(6916009)(5660300002)(38100700002)(6486002)(6506007)(2616005)(54906003)(36756003)(107886003)(2906002)(83380400001)(66476007)(71200400001)(64756008)(66946007)(478600001)(66446008)(66556008)(76116006)(6512007)(1076003)(86362001)(38070700005)(316002)(26005)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlFUbFNWWkJVNnl1dXZKT2M1Rm9pb2QrbFNMNStrQytFTUFueTU3TlNPQis4?=
 =?utf-8?B?dVFQT0swNlE0Ymk5NGpXNmxKeFRVMmRyZDV5cGg3VDAzOXFKNzBTZjNpMHE3?=
 =?utf-8?B?WEx3R09TQVgxVjloTGQyUGkxYW5CK0dpUFVtZGFPTXh0ZTdxNjBXN0dOT1Mv?=
 =?utf-8?B?c1NlNnVWQ2FTR1FVTDdEMEFqM0NGbmtiQi9mcWJERzNSWnFQYmg2cXlldm1X?=
 =?utf-8?B?djc0d2YzQTFnSTFXZjlXQWhTTlloR0kvSUJzN2hTUllmNDVQanI2eXlRNngz?=
 =?utf-8?B?MTZvaE1zYjd5Wmo2L1RSaGxyUmpPbjVNUEE4K2Vwc3JvNDNKaWdabTUzOVBv?=
 =?utf-8?B?VTdUMS9qdE5hK3E3QTgyOHZDb0JpRFJ0K2hSZlNvQldaWlp1UlpkcU5icW1m?=
 =?utf-8?B?VTVYcjBmREVwMnB6QnRGakNaRnQwT29vY2FXNFlCYXIwYjd6c05ZYUI1V3Fz?=
 =?utf-8?B?YmtnUDZaakNMbkFMeERwejU5SE0xUEk0OG50QWlwWU1CNzhpUWk0S0R5ajFV?=
 =?utf-8?B?Y1JEUCtCcDM0bVFsK1NsQ1U3OEJnbnpZOVdoOWROeGVGbTBRTHZrckRQaGd3?=
 =?utf-8?B?WHh1ZFp2TmMwaW9wZkxkY0JZMFRMZXNkcDJZallHb1lUb3N1RkNZT3RRTFlI?=
 =?utf-8?B?OU1ZenNNaklCQ1ZrMGhIeXJCUFhyZ1lhamNuckhuSmZEZlEzemczcjZxSHl1?=
 =?utf-8?B?eWZacmJYM3lmNm1zd3dlQjNWZ2xpclNTYmZvamRjYUxrYjRNUi9xSEplMTds?=
 =?utf-8?B?dzFDN2N1NXdqMDlTSE4rQm5xM24wVGxHQ0ZkdTVBcTVKZ3JiTi8zdmZOdmwx?=
 =?utf-8?B?ck5HKyt5bS8wa1ZycW1pL0pHYUtyejJwd3ovRmE1dTNmZFhjS0RlVXQwMGNj?=
 =?utf-8?B?YVVYWDVJVXZPaEp6SlFzckpxUnA1ZmxKUy9xOXRMU3N5TXdIMzJwQjlMZGQ2?=
 =?utf-8?B?ZU5zWmQzYzZXcTNpeTVmODAvNUtBMVRqNENjUmN1cUdKRUo3eVNVRS9CZkhs?=
 =?utf-8?B?NE8yTjAxVEtvV3hoRXZKQ3hTMVdRc3lmVmppb2NpN05TQ3BWcmVmK3p3V09J?=
 =?utf-8?B?NGJuOHBWcUFmbUJaZHBxbU5pRzJlV05naEh5Y2h1ZE9PUGVtRVBCYUdjZk4y?=
 =?utf-8?B?K2hqSkFDc1lvQVZQYVI3MDJUOFBkbTVzdUtYNzh2NVN6eTVWaFdGUUs4NGJX?=
 =?utf-8?B?bHNQcjkvbmt4cDQ3UVI5Zlg0dzNLKzhVUkZoQ3BVK1BYek82TmtRMko2VEQr?=
 =?utf-8?B?SjgxZXAxYURreHVza3VEZ21SbTNyTk9FQ29PaWZGWklEQ2ZIK0V5R0RuU09z?=
 =?utf-8?B?eXp2T21idG5PK2s2djIzTUl5OTQ0elN2Tkp0MzdyOXdZK2xOaThEbEk0NzFk?=
 =?utf-8?B?RUVrNzVDdUp5ZFlsalJIaWdiQy9acnVHbzA0MWNkcFErQTFkTGwrV3ZHMGkr?=
 =?utf-8?B?NlhXbnpvc2VlRXdNQWxHeGN1TVRkOW9hSDcxa2Jsc3o2citVZmtaM2NZWS9w?=
 =?utf-8?B?a0VXTlJFN0dFbWdWcjNIaEZvTWlJZmpMTWxadzFGdEZpR25kalJvYjdFcVhk?=
 =?utf-8?B?Vkk2QVVjdk05THdPblRXMG0zWCswOThkT0hTaXNzdlRMMVB1SlBGTkpCNVFZ?=
 =?utf-8?B?eVZXMG44TUYxMDcxSzVrSXREeDBUenNFUzhwdWt3OEVyRVRpcndQWmQ2R04w?=
 =?utf-8?B?czJBSUlZcHhBNzZJSFpIdU9PTTRaWU12Y1FlcnBMaGVCL0JNelVaUkd5NjRE?=
 =?utf-8?B?UUlXS0ErdFUrQ2NMeWtkZklQV3BTZkxkT0hNT24ybkFKVkZDTE1wd21HejZt?=
 =?utf-8?B?cVl3RDdrcEgrdG5iS05LczZCWm1NT2RPcjc5UGkrM2JYbVNENGI5a05qeUp6?=
 =?utf-8?B?T3I2N3dsUWRmUzgzdC9tKzMvR0tlKzYwU3J1Mm9sRTNTdTMxVFZ2cmNXbmJM?=
 =?utf-8?B?aW1aa08rSG5qOEhiRzR6YTBGZTBnVXlpa2MwTVpQTUF2ekdzVXVTT1k4M0I2?=
 =?utf-8?B?K2JLeGhqNVJzaWEzbjhiYzJHNTVoRmZkYi9tTHI0STl2QWpIa25JclpJSUVB?=
 =?utf-8?B?cWhGbVVrYlcyd2RITE9BYnBFMFJVeWVGUzhsbzJsTXFUNE56WnNBSWlxUExm?=
 =?utf-8?B?MHcyNmdkODlNcm9BUlJHK3hBUS9nVFZ5b2VESEhjS0xKZExXcG00Y05zTjBX?=
 =?utf-8?B?SGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB86D12CC86BDB4A95B7300F32191B32@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 8bS0dpHxEmmUKl0R6r3I2uzasEY3SXODYuDuRwmbImEjP87uuHB8NgpvvYNliYlh4jviS2A1inypzzeBrwzgqbG4g0yx3sMlVagQxWm1POJNS7H3E/kfc9YTgrYZnUsIjz3iVqKZGKUpuSl8PKt02tLkIIoCNLb3AbyUYy0d09LpSEEjYd6qmHPdpxWuH77klgYuP4xF7hKV/t4WUNAZSHuxqhIG6TmR6lr6KXLPyMMc9MZXiOpPDrvwBcvWITl+hp+xIilbMv9pWBt5RxBX7CMR9xenfJXcwg7tdsmb8EhDGSgSK9/26CGQfxQrJ3JK6vBkCpnSyf2H/CXmTEyah69mEPheySwLbWxekI9FcgalUyTSkl/zaBfi4tQ7SoUDY4eQ0j2NIuIGC4XaD9BhxF8TD8Kft9AV44Rj1I4Pi7yJWJAjZUKKVBVRRP75CsxZJhaajIhR8t4rrlq0F+ZzXuFPvdSEA3s/18iyzgQiwyZiF4bNxeRWT5Lc+6d4mZ7GnZhN0QTaEKX0tKhpUgUZundK6hNfxeNt67mIz0j/fTaSXzYaXIPwFtuSRAbnS7/IpcUsjqq2DD8uXXngn8wMAsiPlTj2S9KQ+tMKuMCsgZtzriUuUd3UwMt8kGm26a2jylax7kRTUVc1U3jjdvY9n2fX81VkXnVhdo7hJrzMVFXariUNvo6oDKuWjdtHZzqAefHLbE6ufAdnT7WSDsobCglK508Qlaggyee+JxeVJj7QrviaHIZs2I3I73WCcKjBlaZjtypdF+CC/cEHARat+GA9fItiG7SS3+mqhbRzijW29KGlqDuTHg3ejza4zNOd9CNc+snIwzl8g80zhhurFA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7ed937-2ca4-46ea-c0e6-08db1b7cad33
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2023 00:17:29.4739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4sNxcs9tlSycIlXG0kxDcJeaZVfWrbvzQHetpp9O8UrcQsfRhleeOMLFOWYcdMsp/jNjjqO/pvf8EPsNRSlMSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4084
X-Proofpoint-GUID: yzsd4PnYFjBoOQ4qcMUz-X_Va6gvwl2I
X-Proofpoint-ORIG-GUID: yzsd4PnYFjBoOQ4qcMUz-X_Va6gvwl2I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_15,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=598
 clxscore=1015 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303030000
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCBNYXIgMDIsIDIwMjMsIFZpbmNlbnpvIFBhbGF6em8gd3JvdGU6DQo+IEZpeCBhIHR5
cG8gaW5zaWRlIHRoZSBkd2MzIHN0cnVjdCBkb2NzLg0KPiANCj4gRml4ZXM6IDYzZDdmOTgxMGEz
OCAoInVzYjogZHdjMzogY29yZTogRW5hYmxlIEdVQ1RMMSBiaXQgMTAgZm9yIGZpeGluZyB0ZXJt
aW5hdGlvbiBlcnJvciBhZnRlciByZXN1bWUgYnVnIikNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFZp
bmNlbnpvIFBhbGF6em8gPHZpbmNlbnpvcGFsYXp6b2RldkBnbWFpbC5jb20+DQo+IC0tLQ0KPiAg
ZHJpdmVycy91c2IvZHdjMy9jb3JlLmggfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9k
d2MzL2NvcmUuaCBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+IGluZGV4IDhmOTk1OWJhOWZk
NC4uYWM4MWQ1MjM3MTBkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0K
PiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiBAQCAtMTA5OCw3ICsxMDk4LDcgQEAg
c3RydWN0IGR3YzNfc2NyYXRjaHBhZF9hcnJheSB7DQo+ICAgKgkJCWNoYW5nZSBxdWlyay4NCj4g
ICAqIEBkaXNfdHhfaXBnYXBfbGluZWNoZWNrX3F1aXJrOiBzZXQgaWYgd2UgZGlzYWJsZSB1Mm1h
YyBsaW5lc3RhdGUNCj4gICAqCQkJY2hlY2sgZHVyaW5nIEhTIHRyYW5zbWl0Lg0KPiAtICogQHJl
c3VtZS1ocy10ZXJtaW5hdGlvbnM6IFNldCBpZiB3ZSBlbmFibGUgcXVpcmsgZm9yIGZpeGluZyBp
bXByb3BlciBjcmMNCj4gKyAqIEByZXN1bWVfaHNfdGVybWluYXRpb25zOiBTZXQgaWYgd2UgZW5h
YmxlIHF1aXJrIGZvciBmaXhpbmcgaW1wcm9wZXIgY3JjDQo+ICAgKgkJCWdlbmVyYXRpb24gYWZ0
ZXIgcmVzdW1lIGZyb20gc3VzcGVuZC4NCj4gICAqIEBwYXJrbW9kZV9kaXNhYmxlX3NzX3F1aXJr
OiBzZXQgaWYgd2UgbmVlZCB0byBkaXNhYmxlIGFsbCBTdXBlclNwZWVkDQo+ICAgKgkJCWluc3Rh
bmNlcyBpbiBwYXJrIG1vZGUuDQo+IC0tIA0KPiAyLjM5LjINCj4gDQoNCkFja2VkLWJ5OiBUaGlu
aCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoNClRoYW5rcywNClRoaW5o
