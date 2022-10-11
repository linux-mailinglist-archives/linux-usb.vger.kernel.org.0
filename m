Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC3325FBCBC
	for <lists+linux-usb@lfdr.de>; Tue, 11 Oct 2022 23:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbiJKVTP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Oct 2022 17:19:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiJKVTN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Oct 2022 17:19:13 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA9775F7FC
        for <linux-usb@vger.kernel.org>; Tue, 11 Oct 2022 14:19:12 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29BKwo3Y020992;
        Tue, 11 Oct 2022 14:19:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=aBElNzOyfJ6047LdBgfHGgZOQ1NHvokGogKZPeYQCEk=;
 b=VfHiT1uRn5uYbqM0SUONTnirZE3yFciKEKy5NvLyMaPplCpsqOPcB4u0wiqX+s08iDfC
 /LP86t3iIYzLYcXa49xtCxuWfBKp0naV0x573QEAoMh5tSrUYzTCnUFycit56SG3Dh9f
 V9AKzhDSm7ofKHOV051ns4JbR5uM2iOLAgtMOQE1DU/0Epfo6prAH7JWTE9UAzPiK+ac
 QU3RR7Qy6PyTFmHVkFq4rPpwT7KQnZa71n3mE/CcuO+hsJYvgyauVf7+fEFz+236D7VV
 W9zrAvk9z3IaXBtPdE9DZw5R0CI3Cu8H80fpPY6UkMYUdZU2MzHIoK5x9uVVUA1a4+T+ eQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3k38f51mfg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 11 Oct 2022 14:19:09 -0700
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9B186C098C;
        Tue, 11 Oct 2022 21:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1665523148; bh=aBElNzOyfJ6047LdBgfHGgZOQ1NHvokGogKZPeYQCEk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=L42fjgpowcp/qxlJ9H44I5r5tb0d4LcUXQmwFexHHcY5XDDWIkK0hCbCm0PYLNMRv
         UCTMaD9FOPl9hMmN0Pevcgg7n3kejL4HXcNirkah64U5cVj9rJaaEOKFDKOLSQcIaJ
         Te1BjAopvE+wkBRF06+uOrLisWZB27B6Qp8PZr8RKILVF+hvjJpkmeEUcQF4Q9EAvD
         727isefn51ACSlLL3O7Vcf3xI7CXndS3CVysVPrE4tsQ7586v60Ur+Aioj1QTbbOup
         Pm5fK2gI1EWBipEckrTA2LyPncaDGf9BjsuWSue7TLaC2v6BbcWdDdG6MivYQSyFqN
         2VuOsiUg4ijOA==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id C0F68A0068;
        Tue, 11 Oct 2022 21:19:07 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1AF98400CB;
        Tue, 11 Oct 2022 21:19:06 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="VyyWTzsS";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e6IYeoH33HjScQoCDQeCmP5rvkvZJLS+nDoA504FzR05O0T931wnbv5iBL79urZzAkpcdjc81nyIJp0QbtIk/XEcxU1VLzpkblhtUTGqhK/jsGx5QdOnsE2eNVar+hYTU8bTnE+UeEeCvTdc2okjh97lFA3OpoiBnTOwqcPkJhBsDXRUG1dbTNze/o/LQ/xrfpZIKO3h9UlAa0xF6XzhN54badFM8yM6qz9RExrYbWrh1tEimE2dVLUHiMxQO+B4tH/ZgYusntlGjUMdC38r0G2rBC4hucGmNZTi9X4Wd3I6oJ7tjLB1xZ/rfCUNWI+08D0VD27KutLmMjAAbP9gXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBElNzOyfJ6047LdBgfHGgZOQ1NHvokGogKZPeYQCEk=;
 b=cixBRJRL/wOpYCuZG9zsfFke9O8ZQ8F7iYO08iSRAf+dToDp6AD7T+QYjb7dv1KgAdVMGtKJZQpXUVO4/UX+79IKjVhj1XZCP6GhcOkEcfeN4K6K/ht6fXTVcx+QQRm0SwJUIh6pCJEHff9g1hvYiBx6xOdIEavTbwT4QB3eLfSYcm/KzNASrQEMh7tKIIIVyncLqadmaVRmimAoT6tVAN98zdHAMmv7nVB2kSPb1c4ZAo/rWJ3JpsY8FK6tFCkqOpodSeUKClHINcRdh+B3gLHWESsuzppAud6h47DVLKg6E8Aag1v0Wk4x03VyH7hWAfPqom5FlwDJF8bevOlbAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBElNzOyfJ6047LdBgfHGgZOQ1NHvokGogKZPeYQCEk=;
 b=VyyWTzsSozxkPSdIXoXZq4i7fHlVqEYWhdZetPbp5paIJIvM5XopQF+WltkyvlXQKtZ5o5a6D2/fULJBMaxAlIC245eGvUd29y9fVzDXqNITxD958ADIgDCgdfeIvh16dzBTzlrVOzDj23p4oa1p0G013ukQJgVdD8G7kgsRzVY=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by MW4PR12MB6922.namprd12.prod.outlook.com (2603:10b6:303:207::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Tue, 11 Oct
 2022 21:19:04 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::525b:92b6:eafc:8629]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::525b:92b6:eafc:8629%7]) with mapi id 15.20.5676.031; Tue, 11 Oct 2022
 21:19:04 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Dan Scally <dan.scally@ideasonboard.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Fwd: DWC3 Gadget SS enumeration
Thread-Topic: Fwd: DWC3 Gadget SS enumeration
Thread-Index: AQHY3YGmnS5LS5hduUOWjkEPUGkdrq4Jsx2A
Date:   Tue, 11 Oct 2022 21:19:03 +0000
Message-ID: <20221011211853.ukmk6cslngghx2mu@synopsys.com>
References: <336d8597-ad17-6fe8-824f-a7ea63a9b140@ideasonboard.com>
 <7d402274-a7fe-1254-c662-657188db5a84@ideasonboard.com>
In-Reply-To: <7d402274-a7fe-1254-c662-657188db5a84@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|MW4PR12MB6922:EE_
x-ms-office365-filtering-correlation-id: 0eeabbef-d40a-4703-9565-08daabce3969
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yeQEZHguX142E0vr6HRYRi9tYOmiYfoXlpZ/ikgDUytgY3u6jcKPIE8EA3ISj/Wnc4ML+VVvyWleEVK6mJ2EQ/y4ip/m7NYSVSiY/QeQ1ZH4kTkV4HlV2BqdtSsycsNn+mwtTOxs2rahiZrnXbH9SfpEZ+Lche1ePIFp5irZcXFuTa0RFpfvsbH0DQB4O94gSxgkgOa+MAcaYrb9d6xVngaN6eR28Octdgpsu14NZOUCnle5SEdGMWtCSZAOjUG22UHaptaXJxzGvemE7j7ZxGI4czgMdeuajLJ4L6qyj7sSmKpPwy60ah1QZuqphJfopDF8cIn3K9701yDSw4zulb68F37rzlPW60MfPp/mYCeJ6NimKyBAlYuVhRZ8PN2cav2fJyWWEUyBXDcFrjXrRpKz3Qdj9MxiUpLK4oHOlZXSC79pg5pqF8EfJ9VjlLG89Oip1yk/Rd/AZ1mykjq4VI9bt9i3MN51gcs/99ouEbPDNa1KePOfa7iZLs9l4Vj26uwEJYGRePjHEjg+rDhHgPMZjQp9LeVvsFQH5SCOFnd2w+B4RdS9azjpDEOg3Ltf/BLxU1cEn/0cHFrPLlvc5B+hul6Tn89RzflcU4BgvnIe0AlzNHjv0COCfqySff8g+feJ9ZV+7Z98dyJr3cJe8MQuU+q+GvKowu47FNujzuVtZTiEw8chG3eADtpi6S+CKkya1vhWlW1CMcjLFp4Idap0V0UQY/ep8z1ZkrNodjQwKY9NzjYlCqnpkd4dhPdNzdXUhZp3lH0jvLz2KLnqzw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(346002)(366004)(39860400002)(396003)(451199015)(1076003)(66556008)(4326008)(38070700005)(76116006)(6512007)(2906002)(41300700001)(66476007)(64756008)(8676002)(66946007)(66446008)(2616005)(86362001)(186003)(83380400001)(36756003)(8936002)(5660300002)(6506007)(38100700002)(6486002)(478600001)(71200400001)(122000001)(316002)(6916009)(54906003)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVJGWW9JL2l6dUlnS25MbE1rbTdTVTByQkhlMmI2L3Z2Rnl5Uzh3TnBFVCt6?=
 =?utf-8?B?d05uT3NmNXdaRDNJMUdHMGkvT2tjK1hmSW55UzdselRwT3ZuK04waGhjSEEr?=
 =?utf-8?B?ejBHMlRCVEhVOUFoNGE4Zm9pZWFnYWJNQlpEZ2kwNFZha1dVVmMxSVAwcnlZ?=
 =?utf-8?B?QnZLSDFRUG5QcGxsOXJraldZUTlSR0YwZVNUUHBVNmNiZFAwRGRBbTFnb3Ro?=
 =?utf-8?B?RE1RYVFzVXIzUTlJV0UzeEVVL080S2Yvd2JMLzZ3OGc0enJ6ZTFBVGsxRnZX?=
 =?utf-8?B?NU15aWhuTjBJbWRreU8yMTlENkdCTW96dk5OUnZYVGFaQlluNEN1Q2hFM2pQ?=
 =?utf-8?B?UlBQQkZ2QjRoN3dkWGlUR0g2UEIweDhnUTYrQjY5TE5uZnlxVm9vclBSdy8y?=
 =?utf-8?B?WWFkckZ2SmdMNmVmaDJKOHRpK0lFeEszTllrYml4TkU3TzExZlhBVkRFM0xY?=
 =?utf-8?B?amFaNUsvZTdhclVqVjBiakhPMyt0eDJILzEzNElxRzVTNThkTW1vUkd6eS8x?=
 =?utf-8?B?TEhVZ0ZVSkFYUHFSQnR2V1hqWjFFVTdYUXo5SFhWWEgwL1BJakZuUnRxWEpZ?=
 =?utf-8?B?TWwxU2NaM0x1Zkh2Q0tqV2Q1d3YxQ3QwTXozQy90TEIzZlY0N0R5c0ovbFg3?=
 =?utf-8?B?cll3MjV4dEE3WGlwbmIxWFg4Tk4xT3lhOVZOVUQ0UXZVRFZNZG5KTFovZ09M?=
 =?utf-8?B?U3h3dHJ1VFJ4TW5FWU50aWIwRU1MaVpKdTNXRG5QODhmaHViNVpqVktMd0dE?=
 =?utf-8?B?K3ZqSS8vR0lXamYrWVMvZzN0U2dtWE5QLzZFU1JBUnFLbjVLTmlzSmZXWDJX?=
 =?utf-8?B?Ukt6dWVTV0hORVYxeGJFcFBIQ1hkRXEvcHc1enVyaDZkVThXdnpKaFlwaUVC?=
 =?utf-8?B?L3VoRC9KaG80bEhHak5CdEFXdzJoMDRNR01MR3VWcWJ2SGplZCtNbEdhRkQr?=
 =?utf-8?B?NW1tU3gyem0ycmZTNXlKVFJrUnZJY1pIUFFFUER5Y3ljYXVpTS9iaHZQSndv?=
 =?utf-8?B?RXd3aGlzM2tOcVNyanBLR24vcHhveTBlUkg1ejdNNEU4c3djZHZiWk5kODM1?=
 =?utf-8?B?QlRKd0lkNmhZZ3JLdnd2eVRzSjFncDFYUHZkNVh5bFVRZVE4NGRSTWNCd3Na?=
 =?utf-8?B?VjJXZUNXM1NtdTZMK3NsbDVnU1hLMG45dnE5T0M4cjZZb3pjclZPWDJVakwx?=
 =?utf-8?B?cWhiNUxMRGpOMHN0TGlRTitoakhNSndrZnMxT3gzUTcyWUc4azZrQlhIY3JU?=
 =?utf-8?B?UlhhSUNLOXZZYnIyNGYrV2tlRzVValRmME92WFoxVnliQ3dLNDY1ck5zVmVZ?=
 =?utf-8?B?S3pTa256WktPN1NmZkc2Nm1RVk9SSjZVODUvSGVHSnNtV0t3TmFoc1RKZEVV?=
 =?utf-8?B?d2dxK01zeDBmSFdMYk5pekFVcmtXWlN5NFV6ZkI4UTh0NzBrNUp5M1NPeWlp?=
 =?utf-8?B?QkxRcjB2bE1yQlB1Sit2ZmVNNjdhS2ovOTRCMU5VckNIQ1lyd3VLdTFZeDZ4?=
 =?utf-8?B?VVBxMzk3T3YzM1JxcDlKZ1lad0pBRldLYW9hc3dLTDROMFh1NTZIS2xzUnVO?=
 =?utf-8?B?b2FnamF5NERSMkNNcGpVK2JpNGFFTll6bjArakNSRitlOFpXTnBCZGxtSDZk?=
 =?utf-8?B?QS93ZXM2TTJGVER0emdtQmpJRlpCT044YlQ1aGVIeURndWlPa2ZUWTIrS1Iv?=
 =?utf-8?B?Z3g4bDFWeGI2cEZLaVhpdDY5K0ZuZ1lRWHIrQ2R5a1hWV1VKS1dKVWFkVGNs?=
 =?utf-8?B?U2J3dm5ndGQyeDFVL0R2czk2SXFrV0RnRTdLOFZMZWMrdFZ0Nld6OEpyWVRl?=
 =?utf-8?B?RGRrQnhBK1A1czRFWmZoWUIzSWxLUk1CN01yNHJ1eDlrMlA0dlc0c1RVYjd5?=
 =?utf-8?B?ZStGTlh6RnVqVGRHdS81WXRreDN1d2p2VVYxT2tVRW50NGx0V0MzRmV4V3c4?=
 =?utf-8?B?bmZOcEEvVlBOL2JqRG5LZEJpN2NiWUN1WnV4NVB1OGg0MGxyUFJCZ1c3ODcx?=
 =?utf-8?B?Z01saXUvVXhrN2ZSaERKeUx0NDBCeTRJSzN4WXdhd3BBcU0rQUhmN3R0cklt?=
 =?utf-8?B?Y2NxTTRTZ3BXbHcxb0RnbkdHSERseGFDYzdzdDFGdEhGTDZ2bGlrNHRWTmlm?=
 =?utf-8?Q?OIXyzAnProL01ly2V5ZkNlt5D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <68182814150FFE4CA4D4A9EEE6F38280@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eeabbef-d40a-4703-9565-08daabce3969
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2022 21:19:04.0555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OyMKsb3gXyygtq/IBN0y2adFxbVWKZSl3Wz95j1yMcY8PR90C/1B4Rgsk9zLc56+kCBJg2VYCGy2Fupr5APOHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6922
X-Proofpoint-GUID: 07TXG_8EOkFJd5h_fbZJIVKOkchlEprJ
X-Proofpoint-ORIG-GUID: 07TXG_8EOkFJd5h_fbZJIVKOkchlEprJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-11_08,2022-10-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0
 mlxlogscore=479 priorityscore=1501 adultscore=0 phishscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210110122
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVHVlLCBPY3QgMTEsIDIwMjIsIERhbiBTY2FsbHkgd3JvdGU6DQo+IEhpIFRoaW5oIC0gSSB1
bmRlcnN0YW5kIHlvdSB0b29rIG92ZXIgbWFpbnRlbmFuY2Ugb2YgdGhlIERXQzMgcmVjZW50bHks
IGhvcGUNCj4gdGhlIGRpcmVjdCBtYWlsIGlzIG9rOyBJJ20gYSBiaXQgc3R1Y2sgd2l0aCB0aGUg
ZHdjMyBhbmQgaG9waW5nIGZvciBzb21lDQo+IHN1Z2dlc3Rpb25zLg0KPiANCg0KSWYgaXQncyBy
ZWxhdGVkIHRvIGR3YzMsIHlvdSBjYW4gZW1haWwgbWUgYW5kIENjIHRoZSBsaW51eC11c2IgYXMg
eW91IGRpZC4NCg0KPiANCj4gDQo+IEJhc2ljYWxseSBJIGFtIHRyeWluZyB0byBnZXQgYSB1c2Ig
Z2FkZ2V0IHRvIGVudW1lcmF0ZSBpbiBTdXBlclNwZWVkIG1vZGUuDQo+IFRoZSBib2FyZCBmb3Ig
dGhlIGdhZGdldCBpcyBhbiBpbXg4bXAtZXZrIHdpdGggYSBkd2MzLiBJJ3ZlIHRlc3RlZA0KPiBj
b25uZWN0aW5nIHRvIGEgY291cGxlIG9mIGRpZmZlcmVudCBob3N0cywgYnV0IEkgY2FuJ3QgZ2V0
IHRoZSBnYWRnZXQgdG8NCj4gZW51bWVyYXRlIG9uIGVpdGhlciBob3N0IGF0IHN1cGVyc3BlZWQu
IFRyYWNpbmcgdGhyb3VnaCB0aGUgY29kZSBpdCBzZWVtcyB0bw0KPiB1bmRlcnN0YW5kIHRoYXQg
aXQgaXMgaW50ZW5kZWQgdG8gb3BlcmF0ZSBpbiBTdXBlclNwZWVkIC0gY2FsbHMgdG8NCj4gZHdj
M19nYWRnZXRfc2V0X3NwZWVkKCkgYXJlIHRyeWluZyB0byBzZXQgU3VwZXJTcGVlZCBmb3IgZXhh
bXBsZSAtIGhvd2V2ZXINCj4gd2hlbiB0aGUgZHdjMyBpbnRlcnJ1cHQgcm91dGUgcnVucyBkd2Mz
X2dhZGdldF9jb25uZG9uZV9pbnRlcnJ1cHQoKSBhdCB0aGF0DQo+IHBvaW50IGl0IHNldHMgaGln
aC1zcGVlZCBpbnN0ZWFkLiBUaGF0IHNldHRpbmcgY29tZXMgZnJvbSB0aGUgcmVnaXN0ZXIgYXQN
Cj4gb2Zmc2V0IDB4YzcwYywgYnV0IHdoZW4gSSBlbmFibGUgdHJhY2UgcG9pbnRzIGZvciBkd2Mz
X3JlYWRsKCkgYW5kDQo+IGR3YzNfd3JpdGVsKCkgSSBkb24ndCBzZWUgYW55IGV2ZW50cyB0aGF0
IHdyaXRlIHRvIHRoYXQsIG9ubHkgcmVhZHMuIEkNCj4gYXNzdW1lIHRoYXQgbWVhbnMgdGhhdCB0
aGUgaGFyZHdhcmUgaXRzZWxmIGlzIG5lZ290aWF0aW5nIGhpZ2gtc3BlZWQgbW9kZSwNCj4gYW5k
IEknbSBob3BpbmcgeW91IG1pZ2h0IGJlIGFibGUgdG8gc3VnZ2VzdCByZWFzb25zIHRoYXQgbWln
aHQgaW5mbHVlbmNlDQo+IHRoYXQgdG8gaGFwcGVuLg0KPiANCj4gDQo+IEkgYXR0YWNoZWQgYSBk
dW1wIG9mIHRoZSB0cmFjZXBvaW50cyBhbmQgcmVnaXN0ZXJzLiBJIHRoaW5rIGZyb20NCj4gRENG
Rz0weDAwZDgwODFjIHRoYXQgaXQncyBzZXR0aW5nIG1heCBzcGVlZCB0byBzdXBlcnNwZWVkIGJ1
dCBmcm9tDQo+IERTVFM9MHgwMDhlZGI2OCB0aGF0IHRoZSBhY3R1YWwgc3BlZWQgaXMgc2V0IHRv
IGhpZ2ggc3BlZWQsIGJ1dCBJIGNvdWxkIGJlDQo+IHdyb25nIHRoZXJlLiBBcyBJIHNheSBJIHN1
c3BlY3QgdGhhdCB0aGlzIGlzbid0IGEgInNvZnR3YXJlIiAob3IgYXQgbGVhc3QNCj4ga2VybmVs
KSBkZWNpc2lvbiAtIGlmIHRoYXQncyBib3JuZSBvdXQgYnkgdGhlIHRyYWNlcyBjb3VsZCB5b3Ug
c3VnZ2VzdA0KPiBwb3NzaWJsZSBjYXVzZXMgZm9yIHRoZSBoYXJkd2FyZSB0byBjaG9vc2UgdG8g
ZmFsbCBiYWNrIHRvIGhpZ2ggc3BlZWQ/DQo+IA0KDQpJZiB0aGUgc2lnbmFsIGlzIG5vdCBzdGFi
bGUsIHRoZW4gdGhlIGxpbmsgY2FuIGRvd25ncmFkZSB0byBsb3dlcg0Kc3BlZWRzLiBUaGUgc2V0
dGluZyBpbiBEQ0ZHIHNldHMgdGhlIG1heGltdW0gc3BlZWQgdGhlIGNvbnRyb2xsZXIgd291bGQN
Cm9wZXJhdGUgaW4sIGJ1dCBvdGhlciBmYWN0b3JzIGFmZmVjdCB0aGUgY29ubmVjdGVkIHNwZWVk
LiBEaWQgeW91IHZlcmlmeQ0KdGhhdCB0aGUgY2FibGUgeW91J3JlIHVzaW5nIGlzIGdvb2Q/IERp
ZCB5b3UgdHJ5IGNvbm5lY3RpbmcgYW5vdGhlciBlU1MNCmRldmljZSB0aGUgc2FtZSBob3N0IHRv
IGVsaW1pYXRlIGFueSBzZXR1cCBpc3N1ZSBvdXRzaWRlIG9mIGR3YzMNCmNvbnRyb2xsZXIvZHJp
dmVyPw0KDQpXaGF0J3MgdGhlIHRvcG9sb2d5PyBJcyB0aGUgZGV2aWNlIGRpcmVjdGx5IGNvbm5l
Y3RlZCB0byB0aGUgcm9vdGh1Yj8NCg0KQlIsDQpUaGluaA==
