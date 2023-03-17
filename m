Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 295B26BE0FF
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 07:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbjCQGHN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 02:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbjCQGHM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 02:07:12 -0400
X-Greylist: delayed 13320 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 16 Mar 2023 23:07:10 PDT
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com [148.163.133.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C8E91A978
        for <linux-usb@vger.kernel.org>; Thu, 16 Mar 2023 23:07:10 -0700 (PDT)
Received: from pps.filterd (m0170391.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32GLnNYQ025251;
        Thu, 16 Mar 2023 22:25:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=smtpout1; bh=SfNNVCzJV2eeT3CQ6Cdy5vfr59MRtlQRHppB2OH49Vg=;
 b=nfltxdmyL4aDeCZL02GcauwlocW7C+Is8JY+erobDvVkVjIjyX41sgDryO/F+D2ozbys
 t6dwVeQ3szf+UKVs6Sh2KgwTET77ip7nd0mtT+0OotUJb6mN1tfmzcsWx1vN3/B3tbHF
 ukF8FaKjR9KTB+WbX3iEc5WJ0zZJi2Mk6AI6bn0X3E/LGzFD2OQZMVm4paDrE1zy3Ool
 6rqKEQ59S3uIQx3X/qEPwV2TY6at4MUjRrEceBy//eXe8FnyHcoxqfgfdRx+MlgHmCzP
 cJC24g2Y6zqKy0F1O5V1xuWFbvL5fwv7Knpz/inx4a4C0wCQ9lON70V8TDvB4M9gUm5K jw== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0a-00154904.pphosted.com (PPS) with ESMTPS id 3pcbc8gs7t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 16 Mar 2023 22:25:05 -0400
Received: from pps.filterd (m0144102.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32H2DTtK032433;
        Thu, 16 Mar 2023 22:24:57 -0400
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
        by mx0b-00154901.pphosted.com (PPS) with ESMTPS id 3pcb65thvt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 16 Mar 2023 22:24:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBOwiROYnYzBxw9M+xmTbU6jFFsPCAd3tXs3gD1VjuJM1OkqQvrRBu9kbE3xDKSihFk791hPd6tC+Ybzpu0wa4wBDbFLu0Ovk2HT/GZZ5wrH/XSXNGCDNcR3Q3g3Q46Io6nh8UtqsWAKj/E+hdDYYojNQYR67yZNJYxD9ha+jNg8nPo324n2ZfzDi7kQvbgY8FIDWRVEyOzGNmAzhYM76NDc8EgAIn9I32foAG0ovGLhDA1zSPl81PZHeLG0yMm1wgBbVlG75WjXDXHJ5IylfwPGNaVaEwhYAwyTAI1e3B4otlbVRZOm4Fs6G7f0qFVmCYvLwyEgJc8PaJ1bS3wHsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SfNNVCzJV2eeT3CQ6Cdy5vfr59MRtlQRHppB2OH49Vg=;
 b=Oki7cY+LHFA+Rkg1o0PRbd2ZugunDsYBRORIejKe5Zc/cD+8x6MYBfT8wsuUQWVM/b/jx7QP7XcI1uGBqcJRAZDUloHhXRB1kUC71885OwtuUBJPSayrERK5+1aEAS2UsaMh8FVh0J+WRTaxWZs0DfF0ev1HkyuS6dVkJVlOTxo1oIdpD7+Vklphq5gMYda7KS6eqbY2Yx7mkEdzclCSUWRQzMnuEX8b/7v8sALQFibkk3fB/nrVSDlL63buJWoZoqZXmw3dRGoQeDfI5Up18RTZivnQYE/a0KkCkrhrdYqzn2JWWlwj+AqgM/OBF7HjG61eaw49U0U51iQG1zwkEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from MW4PR19MB5630.namprd19.prod.outlook.com (2603:10b6:303:189::12)
 by SJ2PR19MB8095.namprd19.prod.outlook.com (2603:10b6:a03:544::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Fri, 17 Mar
 2023 02:24:33 +0000
Received: from MW4PR19MB5630.namprd19.prod.outlook.com
 ([fe80::8831:8323:bed8:25d4]) by MW4PR19MB5630.namprd19.prod.outlook.com
 ([fe80::8831:8323:bed8:25d4%9]) with mapi id 15.20.6086.024; Fri, 17 Mar 2023
 02:24:33 +0000
From:   "Lou, Kangzhen" <Kangzhen.Lou@dell.com>
To:     "Lou, Kangzhen" <Kangzhen.Lou@dell.com>
CC:     Greg KH <gregkh@linuxfoundation.org>,
        "oliver@neukum.org" <oliver@neukum.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: =?gb2312?B?s7e72DogW1BBVENIXSBuZXQ6IGNkY19uY206IHN1cHBvcnQgQUNQSSBNQUMg?=
 =?gb2312?Q?address_pass_through_functionality?=
Thread-Topic: [PATCH] net: cdc_ncm: support ACPI MAC address pass through
 functionality
Thread-Index: AQHZWHecqp6+ToQuTkW3iwlqU7Ns7Q==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 35
X-FaxNumberOfPages: 0
Date:   Fri, 17 Mar 2023 02:24:33 +0000
Message-ID: <MW4PR19MB5630B830B6DF07F716932DCC87BD9@MW4PR19MB5630.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR19MB5630:EE_|SJ2PR19MB8095:EE_
x-ms-office365-filtering-correlation-id: 44f6dbc1-7840-42d5-72f4-08db268ebef9
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n2vwvCdgEIQ/wMpp5MjrN0K6nS7vfNV1Av2SyATZnkFHqoDJY9fHsaTeNraxJ5ZREGyPnz9Iak7GX/cGnXWe5x7kJk2uKbwYP8pESyLQid2si4zBje1x+08iEYf77WUqFTEVoZfzd144JneUJ2NyWH0rTxckIuYl+ciVvpsydHjrzi4EGGAVmV1qDa8n06eQ9nbDFMobNXKOKO841I+TMkRhAXVQQLyQmk1/QTv7djQsSL6/7g4u3CoJCBCnPEh1kSa2TW5mpHnXQ6rmwRuR6YPqMon5rxGWlLSIJ7V9/FM5o28Aehq3Bb1D6Uy6nrfkxRXQnSsMaA/QWmGlXpGh3vUzhkt/KJihkS3eup8maAYzqPl+OM/tE5Kdv+tAkuTNmi9otYJ8o3x5tkW9w8gfCVFggPQMz6RIKwuQNWF5uCXtAn2pDDOOgmdF4uIqZxSsvfcftxrAgwelTBJCJEoZabKQtHNUIYqwOQ2MhnmtENY2jiMpobGnt2N3+ev4yeORXKHrtB1i+64XUX4ljY3hYzqiGHi9G5a49kpt6wC+L6aU7HcoB3n63xGrVpk4ZxqGyJo1paEuvXvScN2x5rMbxKUq4twIHmdgC+X890y0uKMLPU94snI3cktVCjm+71IRkqn5WtDv5Gkg0MrhE0QUNGrNw2E1f/TiokfmC1DU2C8coIv3KIW/9GpHhXJtXolO
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR19MB5630.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(451199018)(186003)(55016003)(478600001)(224303003)(54906003)(5660300002)(7696005)(41300700001)(6862004)(52536014)(66946007)(71200400001)(8936002)(66476007)(66556008)(76116006)(38070700005)(66446008)(558084003)(33656002)(86362001)(64756008)(9686003)(4326008)(26005)(316002)(122000001)(2906002)(82960400001)(6200100001)(786003)(38100700002)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?bVcwOUdGc2phcjM0TjUxU0cwSnRxQ2xtL3dQbGovTWFoLzg3Ri95U2ltUzJJ?=
 =?gb2312?B?ZkpvY3lRUkkzRTEwV3BjMTFXUzB4bkFQWE0xT0x6TFBpSlhkZXlaUERVWXhj?=
 =?gb2312?B?azUxeVQ1SkloSzJacGpZVzA5WFBpdDhFVnZHV2xZWm8yMUVmRDJURVRpWEpr?=
 =?gb2312?B?TVIwZk44K2hqdU1xNGc4dHlBZUZWWmRvRWZKMTRXUUtsZUtscWtaZCthQkdY?=
 =?gb2312?B?aTBIdUw0M2MwcXNFUDd3K25iZ1czbURiRjAydnFnWW40VURVWk14TDdDRzc5?=
 =?gb2312?B?K3RING9Cblg3QWxjbVFXcjUzUkdxaXdRUzlNWXg4Z0ZVR1ZNZEZHcHhUdExa?=
 =?gb2312?B?TmZteVRvMjNndU5wd2Q1K2VyNkRMZ2lKZDF5MkxrclhwM09YV25IQUR4NkVJ?=
 =?gb2312?B?V0d4U1ZyekFVcWNvWU9OYmROVTJrN1FhNEVnRkxIZ3RrQTJxeFBsdGx4Q2tx?=
 =?gb2312?B?dkFRZVVvTWt6cExKWFhsYVY2TGVxVnhiZ1pKcU9LaHZWN2tmRnZ1MmRPNHFx?=
 =?gb2312?B?ZHduV3VaNnU2THlmRlloYkJMWG95b0t4Y1l4ZmpPWE9aS3VYWm5TZlNjMExW?=
 =?gb2312?B?aktsdHlNVFdRNGlUbURxK1FtUGFQYzRMSVJYNk1Wc3kwKzd0bVFiUkFZczRW?=
 =?gb2312?B?Q2pSdnlRVTRrTng1Q3UvS3B6SWtzK1liU3pNNUJYcWFGbUFKTUxHRE9OMVpo?=
 =?gb2312?B?VnZ0MnZWeGdpRDZPN0RreGVURVM2Y0R1OVZ1dmVxTDdUY1N6ZWV0NzRBNGpD?=
 =?gb2312?B?djRFTHlkekVMY2UzRGhMaUlqc3ZwL3hoUFppdENJbFUxRUlMempQUWpYVkpa?=
 =?gb2312?B?MmRhQ3RScm9aYktOQTJMSk5wQTdzUUVPVG5SNWhMSG8xVnVjZmxWZ2FiWUc1?=
 =?gb2312?B?R2hBN2lwdXdjazc3TUs3VERDZndHMSs4c0h5VmF1NDh3T0lMRGRQSE54MDVt?=
 =?gb2312?B?TzRLdFllb0paTUdwMEtiL3lCS0hNWDlDY2NzOE05U1IzUWUwS2VTajk2cFRJ?=
 =?gb2312?B?bzlZT1V1NHhDVG5oY2I0RDVlSFpFaWZZVGVwdUJvdWRuQjFpbTlBYXQ2djM4?=
 =?gb2312?B?d3N4eDdLZlhCNFNlbTVEWDIwOHcrS1hqVHBlZmVUMFMvcGRmTllPd0U0U3hs?=
 =?gb2312?B?djlUcTZUcHRGRnhzajBxcnlZYmJJaENTQVNydEc0Zklva3pUQU56b2lMcDc4?=
 =?gb2312?B?dnAwL2c3bVFIZ2ZBOERFQ2ZWOXpqQzdveDF3bm93TTBCbSs0OGRYamFUNzVB?=
 =?gb2312?B?R0U2WWo2bU9oWUhTR1RFRVNTMW1kUWVZMkIxV3VFaUZTa3pDWTZQdHhLWWhi?=
 =?gb2312?B?ZERhY2M0dWlBNldJV1RIbzFRUG1MbWNQL09XdXRhRkZnVTlPRG9SV3JmQmJw?=
 =?gb2312?B?SDNUSzhLZlIwSVdOVkxtdTYzQmRveWZ3bzJWdnFldm5ySTRqSFB4T0g1OUMv?=
 =?gb2312?B?VnZUb3FPOGNhUDlWRURBQkg1VitBd2dseVlMeWZ2TjJQYUNLb3ZkTzFCVDVs?=
 =?gb2312?B?ekIzdi8xdFVYWXlyTXEyQlErU0hlS1Q0R0U5aVo4RklYa1N0RytjTFNJcnJG?=
 =?gb2312?B?SzRvakNQM0JGMlFZb2VYM0xycUxORnJIQm5IVVEvMzBoc1huckZEbWNPcW1R?=
 =?gb2312?B?REIvanU5Rytob3ZFa1g3STRKbmxHREFzNWpzRkJNazNXVWtaRTJRRUQyRHVN?=
 =?gb2312?B?b21IS2ljL0psbGlKY0lCc1dzQVY4eXhSVW9SL1oyb3NZT2tmNGNrejJNV2kw?=
 =?gb2312?B?MjJML0hzTFlKYkNTd0JwNTVVZHNJMzlDWnpTQjVZVXFBM2piWEJCdzUzNmdS?=
 =?gb2312?B?UnliWVZ5aXFYdTh3ZVZYUnJEc0JWZUI1OTRHRndlbzZmZXArTmkvb2ZaT095?=
 =?gb2312?B?azNrU3hhWmxlbmd3dEZHSGFucGk5eGRhZk1jdGNHQVNhRlVDTlNTTDB6QzZM?=
 =?gb2312?B?WGZyYXBDVlN2NGxzSTd4TjFycVYrSTFhRlFUcFFEM3pLZGpxV1k4bWdiUEpW?=
 =?gb2312?B?QWpaZzVBbUsvenNBUFI2QlM5Ylo1dVN1L1lNd0ZBS0tWVFhrQVhVamVOMVFm?=
 =?gb2312?B?VjJqZERLNHpjSkVDdktOc255MVZZbFp3dEVOK2xia1JERmZSRTVmYk4vM1k3?=
 =?gb2312?Q?GqW7o0WG+u5i0ZwRdYy/+fSNg?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR19MB5630.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f6dbc1-7840-42d5-72f4-08db268ebef9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2023 02:24:33.3975
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VeS1lHECx5hJ166h9oNDNJRxCYlhOftyUh6A6nh9Z1RXfjuJ83NhxxrWCWq0bF4ICDoLFSpR6iftCkxrKKx7vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB8095
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_16,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1011
 bulkscore=0 mlxlogscore=402 mlxscore=0 adultscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303170013
X-Proofpoint-ORIG-GUID: yjo1YoPXd4wKUq9l-Rqsvl5CO0_NdfhD
X-Proofpoint-GUID: yjo1YoPXd4wKUq9l-Rqsvl5CO0_NdfhD
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 mlxscore=0 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=486 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303170013
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

TG91LCBLYW5nemhlbiC9q7O3u9jTyrz+obBbUEFUQ0hdIG5ldDogY2RjX25jbTogc3VwcG9ydCBB
Q1BJIE1BQyBhZGRyZXNzIHBhc3MgdGhyb3VnaCBmdW5jdGlvbmFsaXR5obGhow==
