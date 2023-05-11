Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20CA16FF81B
	for <lists+linux-usb@lfdr.de>; Thu, 11 May 2023 19:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238810AbjEKRHk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 May 2023 13:07:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbjEKRHi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 May 2023 13:07:38 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4F88729F
        for <linux-usb@vger.kernel.org>; Thu, 11 May 2023 10:07:28 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34BGOFHW008118;
        Thu, 11 May 2023 10:07:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=oK+PYO3yUVlsm8JROMfvczlmjMBqJCv2wxHRNANzaW0=;
 b=YI/oyxwDHk/nR5SZI+oIz+UDHWkpHsVepiGKiK3ki99LO6ZF/QRduzoYA08LzSvuvyqs
 zw79bsptm+RUaZI6tC0EmZ7jMz+COzSpPTGzCOGZlysRNqndxaS/y0wLTLOiY4n+BChH
 b2Yb7poCb38rXqx4ZPNEi86Z27wITrQ44vslbOgxf2Zc/MyoiQSnkzjFPCpXNNS4Shxf
 5I5xPHwPNXdkcmiJrCSiyFbBER42hEFv+w5fgJHn6x4x+i69ufwfEiILrcgEdYYYssQ4
 pteKCqAauqzDwAMAhR7NHkY8JQoXmRGoC631Yj5tfR5g1SvQyKxJwv4AcNSQi0B8wYrd GQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3qf770g7vx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 May 2023 10:07:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1683824844; bh=oK+PYO3yUVlsm8JROMfvczlmjMBqJCv2wxHRNANzaW0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=cXWUU1IYU9cxoPK0eUOfoWL8fzxc1i6PtrfBnM6ew7NUoG/U2Hj21+gOrifDIrVH2
         S3fjnR+ThqPX3Ijx+ke7wWSnMLbLNALdx2jzD6K85++odA8J5qW5EwuHlvVGPfu7lL
         cdHY1+6kBtvq1JHmG03F8eqSI/GZpIcIMJvwEEA6qJj3aBuOB7Je9p7pg6TaiElrHB
         zg1QSPKXkuuS2HS4kFR8XQhUs/Rwk79jiy5Wa8OxgZYfvZ/TIVCWCgR67DHKDMpKkQ
         6fxyrJwPNcVkTMpnsu68tSZq3VNWanfHz9KAyQ3l9APrmRM9vGFjuXtUvPLBe+nkRp
         nTVWxE2KU/KVg==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 27F6140407;
        Thu, 11 May 2023 17:07:23 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 9603AA006E;
        Thu, 11 May 2023 17:07:23 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ottW8oE4;
        dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7959F40493;
        Thu, 11 May 2023 17:07:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGTV4o8BNKsjdunCF68PbIaZbAh5ogsAm87PMROU4DE1xDrDEZeQNeN0NgOS78i1ssbG5FqLXQQp5RNbeN55g0anUQi75a7+7c6f5g9MgEWx5iYXZRWtl7NtcLNDQO1gdAeyYAEfkoWG9cqC7ioGv7aqTv1jiNmKatRIqbCZj7Igttee9sRDJJO88C3p1isECHcfxnLlsr606cXzZyWNZxb3sBYkICCIjkROIXGs3TfznKO0Jddo2VZBzySyjBHeHmYYYaz+UfQI+KrPtqMrM4kchq/sPsDLntHKvj+pWp/Z4engo3MpqhJMuwSDjk0uHUx1Xa+0D2yPRZHRVmheTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oK+PYO3yUVlsm8JROMfvczlmjMBqJCv2wxHRNANzaW0=;
 b=J/uSQnxYKOS+p54AWt5+oKmU2pSj1X4Al50NM8RS6ful8to+NBXZ+LAGMW+u2w/xIEJpGhJXdQLCphqXDN2ZyI04SVWl1/wy+Vp8jWmp/ZYjOrrPLnrJwsMIAXfyj2KEhJ1m1gDJZrpOtnDsdN7Cue2kcEInXIVNGIDKppDJ86mg+1gr9qdlGzNeSUEX+suIvodXtATMlhCsGfwnSkV9fDn05V8NV7eW57tqR5Mvjtr5Cm9TzPKJxLVLBGkz9tRM4Pr73iueBImHR151vYsS9RTqOp57cT9Nm0suHvPVfPGRwFvVvOeAI1hZSA+x1ZNTag8Zo7dyyKPQzlXtdj3uMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oK+PYO3yUVlsm8JROMfvczlmjMBqJCv2wxHRNANzaW0=;
 b=ottW8oE4nuz5EXD15RjQJCLSHsElt8C5VqTdGzY8yZLoe7rAfWGZ66p6YMtnSM2KnbiSUCVwlQpHmtZr5cGh3fsB9lQCLwuRX6I4K4ZIMksCi/u+gRJgA/AirI4yGp1Gb+S2BEGdDVyT7/Ll/WiqwibQ59/XBEE+uW/b8YOkvKQ=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by PH0PR12MB5679.namprd12.prod.outlook.com (2603:10b6:510:14f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Thu, 11 May
 2023 17:07:12 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3400:81ff:f191:b312]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3400:81ff:f191:b312%5]) with mapi id 15.20.6387.019; Thu, 11 May 2023
 17:07:11 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v9] usb: dwc3: fix gadget mode suspend interrupt handler
 issue
Thread-Topic: [PATCH v9] usb: dwc3: fix gadget mode suspend interrupt handler
 issue
Thread-Index: AQHZg8vdhRuJp1Tf7kKYuL5LF7Do7K9VTm2A
Date:   Thu, 11 May 2023 17:07:11 +0000
Message-ID: <20230511170705.2hpzbedxqgn3n343@synopsys.com>
References: <20230511054540.28239-1-quic_linyyuan@quicinc.com>
In-Reply-To: <20230511054540.28239-1-quic_linyyuan@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|PH0PR12MB5679:EE_
x-ms-office365-filtering-correlation-id: 2d3aee7d-5392-4cfe-d414-08db52422941
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CLPJNauI7GDdvtyT3N9xoi7jjsK2HSe1Z7E/Vf+AZ6DkAHix/nDz2ylnnw0FGJ7jeobDa6hc0APPt6w33JD9/om5r3KyepvcGPt3dn9uqIEVLEKgaXQs53Pi+p9zDDrjhf16VTb/461M2Ez7gpa1riJt8Yj9pOcwrJ5G3oR0MbKth9zORhjaXiYC7dUmFfHMRJoh7DYuZmiI4PrA9l9/cC+lCoQ/8M8uC25bUkhbqgvZO1UNziNoYZAEWBzCGm/sIBL2dw33GvlLnDteyy3iFar5NbYV7mhpQZO1PhXXtOx26zY6fXvDaphkuBO3l5x/0rcoNxEEAY6ozg0CkXxOxtS+bM531C/l8ENF82pHOGUGq2e1sjSCASejr90YbK2GZC3MDQVIMLfwGSj6pfiv6SxVSVrErwYoUbwQt8z+akISREukRv/ZsXjnXputaNvSMD8IQovvJaXmdMDEjalmJLgtXrVw1xfW0ZEFigCVwzXsnwAu5zl7UiTgDD0OxY7gPjlF15kEVt6ooaNxUXcwO6iMDUovSY4GXfzmb+cMuhQj7hZjdMZ7xkghMkc/p89SM3pnzwRkZZ8XAB7O2nChqf3+KyTafbpblYwprOOwHadRpbSFv9phf/k3F8VTuVM4elSkQ5oVL8r76LLVTRNUog==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(39860400002)(396003)(376002)(346002)(451199021)(83380400001)(54906003)(15650500001)(5660300002)(2906002)(122000001)(6916009)(66476007)(64756008)(66556008)(66446008)(316002)(76116006)(41300700001)(4326008)(66946007)(6486002)(86362001)(966005)(38100700002)(66899021)(6506007)(1076003)(6512007)(8676002)(26005)(8936002)(71200400001)(2616005)(186003)(36756003)(38070700005)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEp2ZFVjZlFGSkFTUkR1TnBEQXpXRDdsb2FlL1N3RDM5NVdyUVhqZHRGNVpi?=
 =?utf-8?B?VTZCSmhMWDRqK2x5SjNMYWNZazZxbVlKMHVKSXo3ZWlqUDljZFNBdDFmN3FP?=
 =?utf-8?B?MkhVUVlGcWc5K2xMZ3pJcXZhM00rZUw1UmdWL1JjVHlETnM5c2JaVm1GSXEw?=
 =?utf-8?B?eEo0Q1VHK0lFY05JZXhpaWhBR1FsYlI5a0poVkV0aldIQUNGc0x3aU9NSUdB?=
 =?utf-8?B?Skg2Q3pEUXBvYlhiemlSZVJTOGZqRVpxTGxYblFlcktoa3ZjN2F0cVRjOHNN?=
 =?utf-8?B?dklBOVVLaVV4STNDT1YydUtIVTc2enByaUVYSUl1MW54NW94dWp1eWRTS0cy?=
 =?utf-8?B?WWVIVlZNOURNTnFYODdkRnMzRDJRSDhvVzRQUStnTVRUdEFKaFZsMUhSTmdr?=
 =?utf-8?B?QUNLV3c5M1Q4SzF5TG5PZGxaR0VqYXhzWkdycUhBNHJnZGlRQnZvazM1cVE1?=
 =?utf-8?B?S040dzVmQWxnUEhmeEJob2tnN3V4VUNJK3Z6RXhva0tUcWRQa21talFFWXI4?=
 =?utf-8?B?ZU0zZ05NalYxb01wU0RiUm15OUF0a2FZcnR1R25VOENGanBxdXZ5YWpEalBU?=
 =?utf-8?B?RVUzWmlyaUdJd04xbllhSlhUajNlMmVFZExIZ0FUQnVGbkNLSExpZ3JuMG12?=
 =?utf-8?B?UU5BOEphUTgzNEt0bnhLV3NEUlZuQTNHRGZEWkgwNzlaUDIzRjJ5RnRsMU45?=
 =?utf-8?B?VDEraldUOXorS0tuWlB3SEJPRGZqYndQTzZiQnZOUHlGKzVkcGoxRkU4UEVN?=
 =?utf-8?B?WWVoTmcyL1loRE1adWtqdVllelRoMHVFSVhQMlpBVVRtYnU2b0NWeUhqaURi?=
 =?utf-8?B?RnNrSFFOWFZRZEU2NzVCRmpXSkNKbk5rcEFuNmNsU1plVlM1dENRc1pnUyto?=
 =?utf-8?B?cGg5SFhxOHpPbGJQbFh0bU9ERjFIdVYrd1RRcVRqcXUvU2gzTmZPS1RpVjZo?=
 =?utf-8?B?VEk4bngzSnh6b2RJMkFCdDRFNFE1ZUg4T3dDSUdHeDR2RXh5UkxpWTZzbUJq?=
 =?utf-8?B?YVJhWEhnYmc5TnRpSGtpNkJBeHVKd3ZzRlFJeGxUcy85bDJGSERHc29oU21N?=
 =?utf-8?B?Tis2WmMrNHVPMnd3Lzd3MlFqa0N1NXNveU5RZk1ydHZWMkQyY0JaeEoySjdI?=
 =?utf-8?B?ZU11M0piRGlQcFZteWxmNHVLWWJ2UDBac1h1QU5MZkFIVXFIUmttL0J3d29h?=
 =?utf-8?B?dW82SVVVY2NnQmc0emZ6ZFBRbURQd3VHcmpsNFlWREJLenptSWd2WjlzeEIr?=
 =?utf-8?B?YlhpWmJYa0dGNTVoNFl3V28xZkp4NXhFdGdiSzNjRExGTzkvdDVhOHNpRmpH?=
 =?utf-8?B?VG9LVThlVVAyOU1Wc0pscC81Tm1rN21PY1dUckE1R0JDc1RtemlRUjBJSlZ6?=
 =?utf-8?B?RWVpYlJpK3NXQTdtdmI4NkFYdklqREhWSzR2K3dXd2lRVEJqT3Y3QTFKY3Qv?=
 =?utf-8?B?WjFKZ3p2L0VRcjZVTXdISVI2a3ZUM1grb2JodjhCSFU4d3EwYUZvWnZBQStz?=
 =?utf-8?B?UGpabm5jankxN3lhWjA3NkE3MzNsaXI2amxjSEgyVys1U0Uxdnh1TjZVL2VR?=
 =?utf-8?B?aVNKb0xiZm80NWh5NmR3RDBEOUV3LzFEZnE0R0hOSk5PVVRpb091YUMzc2Rz?=
 =?utf-8?B?ZUhEcUM2TXREamJlbUlMOVhyZjVhditPZGw3d2kwTjZndVM1L0p0dVQ5d3gx?=
 =?utf-8?B?N1dZQ3RuUFdsU1d5U252Sm5wN010WHk5NVdxT2REcGg5N08rQnl6YnlDcEh0?=
 =?utf-8?B?QUt3RSs4VTJiY2FnblZ6UUFhMW5uTnFwRzJheWFhN2Y0WVk5YjNnWFNNNjFr?=
 =?utf-8?B?cU80N0FxMWlyYXB5NXRDOWtLeC9KN1NXd1BIMWF3V1B1bmNReklkdGxwdVpO?=
 =?utf-8?B?SjRBMTJTenJzTHUvd3JkMVYwYTE0SHU4MHNFVm5GSFAwYUJ1eXB4M2JiNG0z?=
 =?utf-8?B?cWhMZGRzcjhQYzVuZ0QzTGU4dC91d3dkVXlJd2wrMUZ4aDVIOWUyd3daVjRN?=
 =?utf-8?B?LzZKM0F1Z3VTR3FCeEJaVDFGVW9SOWoreDNSQkxBcVdmdVk0UFluTGJlbG42?=
 =?utf-8?B?QWJIQnlFY3RpOWxpSm8zQW9PRkZKV1FFbVB4WVg2cWxWd2V6cGdtanorQUll?=
 =?utf-8?B?VDRpMGZ6STBGUXB0cUdwSm5PbEhUQlVBRVNza1RtTkRjMHhDaSthMWpIN2xV?=
 =?utf-8?B?Q3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <33EDA8B57593C749A5668BC29D017B2C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: YfjtzS+EswJyqeRFkJ9YjeJ5bapHogCD0gJ6sfYw984eWaqqaTTQUSpHwonGA2Cy5ZTv8RcUYiTKSqJSaDlwAVIN10vfC2nesV4AYAv1Yxm4bX2ZYcB1uE8MNLSZ8XJyxwUfR5gh9F4sXw1oIGDRR5VhtoM/0SY7+rfEeaQGgLNiMyHN9pHHvZxqxSoMKkU2pGQ/kIvG5MlrcaTDIzv1Fr+YoIecf0ALrF6qG8aRBw9AlZzIyBYUpvlyu//qEn9I3ZNoFPGjzUzTZtahS6f3YjrGZmWK90ai43YI7hMGfBRHuaj1XLBgBormVB1uCgNvLnVLhzLqwXHro0beu1ZyD3dbaieXcFjghBOfhMs7kRhN8fEzLJmzT+0seHtVcAFJBVg7q0wmpDNyUVcpRltdBY7FxJXZlCQhJLqcwApCds3FuBtmpTU94HuhbpDQaJ9jWKT1Q/rV8EMJIiM0HzAobKyEwYPtRyu1X8IxZXYqgAYPOw+xcCuKB3CLhTL3a37+ddK8zsXfQ4fSZX6QkyD+Bd7LSFdKvfSPf3Vo48b5/UYNIcyX9/vtWbxAGcRb9MC8tC0Fk9OM2gkQppCDCa6F8Qd0v+j2hjo2ghSfSyqf6D1Br3m068SKzy1WzjKi0ugXxfNB0b9y1dURHBCjH8ML/mBRtidrZre/xnVrzBVY5K/rWBHsrbSiHLQrWTu8gccnUjh1D7J+aq8xzqsY+MmviNTb4tA2izO/7VCEvMNBPitgTms+mZdEKlFRSgYNHAHh7wjWtuMzot7vGbd+6St6mpkyPhrREkfC9Bsj+bkmgxwKc7mwpGGnWeujLX7AtApe3+/pVVtgWXwqlyc8js4psK1eYWyeFI9FhGVCqPUJImqN9GyfeRc88vw+0W1QP5929Zxk0AWuyz9M7dPPMG4swQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d3aee7d-5392-4cfe-d414-08db52422941
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2023 17:07:11.6095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LIMoAk+m5HV7kGilBnUDDHORtGsqi7dUr0vjDJJwDeUy0yRVyZ+KvPZch9GlIVMfxS2L7IYSzm3R0io9pZPW4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5679
X-Proofpoint-GUID: NEYF3uoRS44JcxSyVdue8-lEF5sIM6wh
X-Proofpoint-ORIG-GUID: NEYF3uoRS44JcxSyVdue8-lEF5sIM6wh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_13,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 suspectscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305110147
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCBNYXkgMTEsIDIwMjMsIExpbnl1IFl1YW4gd3JvdGU6DQo+IFdoZW4gd29yayBpbiBn
YWRnZXQgbW9kZSwgY3VycmVudGx5IGRyaXZlciBkb2Vzbid0IHVwZGF0ZSBzb2Z0d2FyZSBsZXZl
bA0KPiBsaW5rX3N0YXRlIGNvcnJlY3RseSBhcyBsaW5rIHN0YXRlIGNoYW5nZSBldmVudCBpcyBu
b3QgZW5hYmxlZCBmb3IgbW9zdA0KPiBkZXZpY2VzLCBpbiBmdW5jdGlvbiBkd2MzX2dhZGdldF9z
dXNwZW5kX2ludGVycnVwdCgpLCBpdCB3aWxsIG9ubHkgcGFzcw0KPiBzdXNwZW5kIGV2ZW50IHRv
IFVEQyBjb3JlIHdoZW4gc29mdHdhcmUgbGV2ZWwgbGluayBzdGF0ZSBjaGFuZ2VzLCBzbyB3aGVu
DQo+IGludGVycnVwdCBnZW5lcmF0ZWQgaW4gc2VxdWVuY2VzIG9mIHN1c3BlbmQgLT4gcmVzZXQg
LT4gY29ubmRvbmUgLT4NCj4gc3VzcGVuZCwgbGluayBzdGF0ZSBpcyBub3QgdXBkYXRlZCBkdXJp
bmcgcmVzZXQgYW5kIGNvbm5kb25lLCBzbyBzZWNvbmQNCj4gc3VzcGVuZCBpbnRlcnJ1cHQgZXZl
bnQgd2lsbCBub3QgcGFzcyB0byBVREMgY29yZS4NCj4gDQo+IFJlbW92ZSBsaW5rX3N0YXRlIGNv
bXBhcmUgaW4gZHdjM19nYWRnZXRfc3VzcGVuZF9pbnRlcnJ1cHQoKSBhbmQgYWRkIGENCj4gc3Vz
cGVuZGVkIGZsYWcgdG8gcmVwbGFjZSB0aGUgY29tcGFyZSBmdW5jdGlvbi4NCj4gDQo+IEZpeGVz
OiA2ZjI2ZWJiNzlhODQgKCJ1c2I6IGR3YzM6IGdhZGdldDogUmVuYW1lIEVPUEYgZXZlbnQgbWFj
cm9zIHRvIFN1c3BlbmQiKQ0KDQpUaGF0IGNoYW5nZSBpcyB1bnJlbGF0ZWQgdG8gd2hhdCB0aGlz
IGZpeGVzLiBDaGFuZ2UgdG8gdGhpczoNCg0KRml4ZXM6IDc5OWU5ZGM4Mjk2OCAoInVzYjogZHdj
MzogZ2FkZ2V0OiBjb25kaXRpb25hbGx5IGRpc2FibGUgTGluayBTdGF0ZSBjaGFuZ2UgZXZlbnRz
IikNCg0KVGhhbmtzLA0KVGhpbmgNCg0KPiBBY2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5O
Z3V5ZW5Ac3lub3BzeXMuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBMaW55dSBZdWFuIDxxdWljX2xp
bnl5dWFuQHF1aWNpbmMuY29tPg0KPiAtLS0NCj4gDQo+IHY5OiAocmVmZXIgdjggaHR0cHM6Ly91
cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi8yMDIz
MDUxMDAxNDcxOC4xMzg3Mi0xLXF1aWNfbGlueXl1YW5AcXVpY2luYy5jb20vX187ISFBNEYyUjlH
X3BnIWZYRkxQQXBMMkM0SGhyeHBxVHhjb0FITzF6ZTh6Zk5FNEF1endlTy1LSnc5RWJlUDFjQmJI
SUk4eExVZGNwQ2dJSGl2Q3BfR0FpRk55UlZRU1lOcEpjenBBdUlmb0EkICkNCj4gMSkgYWRkIGEg
Rml4ZXMgdGFnDQo+IDIpIGFkZCBBY2tlZC1ieSB0YWcgZnJvbSBUaGluaA0KPiANCj4gdjg6IChy
ZWZlciB2NyBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtdXNiLzIwMjMwNTA5MDUwNzQzLjU3ODEtMS1xdWljX2xpbnl5dWFuQHF1aWNpbmMu
Y29tL19fOyEhQTRGMlI5R19wZyFmWEZMUEFwTDJDNEhocnhwcVR4Y29BSE8xemU4emZORTRBdXp3
ZU8tS0p3OUViZVAxY0JiSElJOHhMVWRjcENnSUhpdkNwX0dBaUZOeVJWUVNZTnBKY3p5M0tydkdn
JCApDQo+IDEpIG1vdmUgc29tZSBzdXNwZW5kZWQgZmxhZyBjbGVhciB0byBzcGVjaWZpYyBldmVu
dCBoYW5kbGVyDQo+IA0KPiB2NzogKHJlZmVyIHY2IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMv
X19odHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC11c2IvMjAyMzA1MDUwMTQ5MDIuMjczMTMt
MS1xdWljX2xpbnl5dWFuQHF1aWNpbmMuY29tL19fOyEhQTRGMlI5R19wZyFmWEZMUEFwTDJDNEho
cnhwcVR4Y29BSE8xemU4emZORTRBdXp3ZU8tS0p3OUViZVAxY0JiSElJOHhMVWRjcENnSUhpdkNw
X0dBaUZOeVJWUVNZTnBKY3hwWVVpNkVBJCApDQo+IDEpIHJld29yZCBzdXNwZW5kZWQgZmxhZyBj
b21tZW50DQo+IDIpIHJlbW92ZSBvbmUgZXh0cmEgc3BhY2UgaW4gaWYgb3BlcmF0aW9uDQo+IDQp
IGNsZWFyIHN1c3BlbmRlZCBmbGFnIGZvciB3YWtldXAvcmVzZXQvZGlzY29ubmVjdCBpbnRlcnJ1
cHQNCj4gMykgY2xlYXIgc3VzcGVuZGVkIGZsYWcgZm9yIHJlbW90ZSB3YWtldXAgcmVsYXRlZCBj
YXNlLg0KPiANCj4gdjY6IChyZWZlciB2NSBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNiLzE2ODI0NzY3ODAtMjM2Ny0xLWdpdC1zZW5k
LWVtYWlsLXF1aWNfbGlueXl1YW5AcXVpY2luYy5jb20vX187ISFBNEYyUjlHX3BnIWZYRkxQQXBM
MkM0SGhyeHBxVHhjb0FITzF6ZTh6Zk5FNEF1endlTy1LSnc5RWJlUDFjQmJISUk4eExVZGNwQ2dJ
SGl2Q3BfR0FpRk55UlZRU1lOcEpjeDRzU2JzY0EkICkNCj4gMSkgY2hhbmdlIHN1YmplY3QNCj4g
Mikgb25seSBrZWVwIHN1c3BlbmRlZCBmbGFnIHJlbGF0ZWQgY2hhbmdlDQo+IA0KPiB2NTogKHJl
ZmVyIHY0IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC11c2IvMTY4MjM5MzI1Ni0xNTU3Mi0xLWdpdC1zZW5kLWVtYWlsLXF1aWNfbGlueXl1
YW5AcXVpY2luYy5jb20vX187ISFBNEYyUjlHX3BnIWZYRkxQQXBMMkM0SGhyeHBxVHhjb0FITzF6
ZTh6Zk5FNEF1endlTy1LSnc5RWJlUDFjQmJISUk4eExVZGNwQ2dJSGl2Q3BfR0FpRk55UlZRU1lO
cEpjemxqU0FBWFEkICkNCj4gMSkgcmVuYW1lIHN1c3BlbmRfaXJxX2hhcHBlbiB0byBzdXNwZW5k
ZWQgYW5kIGRvY3VtZW50IGl0DQo+IDIpIGFkZCBvbGRfbGlua19zdGF0ZSBmb3IgbGluayBjaGFu
Z2UgaW50ZXJydXB0IHVzYWdlIGFuZCBjaGFuZ2UgYWNjb3JkaW5nbHkNCj4gDQo+IHY0OiAocmVm
ZXIgdjMgaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LXVzYi8xNjgyMDUzODYxLTIxNzM3LTEtZ2l0LXNlbmQtZW1haWwtcXVpY19saW55eXVh
bkBxdWljaW5jLmNvbS9fXzshIUE0RjJSOUdfcGchZlhGTFBBcEwyQzRIaHJ4cHFUeGNvQUhPMXpl
OHpmTkU0QXV6d2VPLUtKdzlFYmVQMWNCYkhJSTh4TFVkY3BDZ0lIaXZDcF9HQWlGTnlSVlFTWU5w
SmN4Z0cwMExUQSQgKQ0KPiAxKSByZW1vdmUgbGluayBzdGF0ZSBjaGVja2luZyBpbiBkd2MzX2dh
ZGdldF93YWtldXBfaW50ZXJydXB0KCkNCj4gMikgcmVtb3ZlIHR3byBzd2l0Y2gvY2FzZSB0byBp
ZiBvcGVhcnRpb24NCj4gDQo+IHYzOiAocmVmZXIgdjIgaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92
My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi8xNjgyMDQyNDcyLTIxMjIyLTEt
Z2l0LXNlbmQtZW1haWwtcXVpY19saW55eXVhbkBxdWljaW5jLmNvbS9fXzshIUE0RjJSOUdfcGch
ZlhGTFBBcEwyQzRIaHJ4cHFUeGNvQUhPMXplOHpmTkU0QXV6d2VPLUtKdzlFYmVQMWNCYkhJSTh4
TFVkY3BDZ0lIaXZDcF9HQWlGTnlSVlFTWU5wSmN5WTA0VF82dyQgKQ0KPiBubyBjb2RlIGNoYW5n
ZSBzaW5jZSB2MiwgY2hhbmdlcyBjb21wYXJlIHYxIGFzIGJlbG93LA0KPiAxKSBhZGQgYSBmbGFn
IHN1c3BlbmRfaXJxX2hhcHBlbiB0byBzaW1wbGlmeSBkd2MzX2dhZGdldF9zdXNwZW5kX2ludGVy
cnVwdCgpLA0KPiAgICBpdCB3aWxsIGF2b2lkIHJlZmVyIHRvIHNvZnR3YXJlIGxldmVsIGxpbmtf
c3RhdGUsIGZpbmFsbHkgbGlua19zdGF0ZSB3aWxsDQo+ICAgIG9ubHkgdXNlZCBpbiBkd2MzX2dh
ZGdldF9saW5rc3RzX2NoYW5nZV9pbnRlcnJ1cHQoKS4NCj4gMikgcmVtb3ZlIHN3IHNldHRpbmcg
b2YgbGlua19zdGF0ZSBpbiBkd2MzX2dhZGdldF9mdW5jX3dha2V1cCgpDQo+IDMpIGFkZCBkd2Mz
X2dhZGdldF9pbnRlcnJ1cHRfZWFybHkoKSB0byBjb3JyZWN0IHNldHRpbmcgb2YgbGlua19zdGF0
ZQ0KPiAgICBhbmQgc3VzcGVuZF9pcnFfaGFwcGVuLg0KPiANCj4gdjI6IHVwZGF0ZSBhY2NvcmRp
bmcgdjEgZGlzY3Vzc2lvbg0KPiB2MTogaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi8xNjc1MjIxMjg2LTIzODMzLTEtZ2l0LXNlbmQt
ZW1haWwtcXVpY19saW55eXVhbkBxdWljaW5jLmNvbS9fXzshIUE0RjJSOUdfcGchZlhGTFBBcEwy
QzRIaHJ4cHFUeGNvQUhPMXplOHpmTkU0QXV6d2VPLUtKdzlFYmVQMWNCYkhJSTh4TFVkY3BDZ0lI
aXZDcF9HQWlGTnlSVlFTWU5wSmN3bDUyVXhkZyQgDQo+IA0KPiAgZHJpdmVycy91c2IvZHdjMy9j
b3JlLmggICB8ICAyICsrDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIHwgMTIgKysrKysr
KysrKystDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCBiL2RyaXZlcnMv
dXNiL2R3YzMvY29yZS5oDQo+IGluZGV4IGQ1NjQ1N2MwMjk5Ni4uMWYwNDNjMzFhMDk2IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiArKysgYi9kcml2ZXJzL3VzYi9k
d2MzL2NvcmUuaA0KPiBAQCAtMTExNiw2ICsxMTE2LDcgQEAgc3RydWN0IGR3YzNfc2NyYXRjaHBh
ZF9hcnJheSB7DQo+ICAgKiBAZGlzX21ldGFzdGFiaWxpdHlfcXVpcms6IHNldCB0byBkaXNhYmxl
IG1ldGFzdGFiaWxpdHkgcXVpcmsuDQo+ICAgKiBAZGlzX3NwbGl0X3F1aXJrOiBzZXQgdG8gZGlz
YWJsZSBzcGxpdCBib3VuZGFyeS4NCj4gICAqIEB3YWtldXBfY29uZmlndXJlZDogc2V0IGlmIHRo
ZSBkZXZpY2UgaXMgY29uZmlndXJlZCBmb3IgcmVtb3RlIHdha2V1cC4NCj4gKyAqIEBzdXNwZW5k
ZWQ6IHNldCB0byB0cmFjayBzdXNwZW5kIGV2ZW50IGR1ZSB0byBVMy9MMi4NCj4gICAqIEBpbW9k
X2ludGVydmFsOiBzZXQgdGhlIGludGVycnVwdCBtb2RlcmF0aW9uIGludGVydmFsIGluIDI1MG5z
DQo+ICAgKgkJCWluY3JlbWVudHMgb3IgMCB0byBkaXNhYmxlLg0KPiAgICogQG1heF9jZmdfZXBz
OiBjdXJyZW50IG1heCBudW1iZXIgb2YgSU4gZXBzIHVzZWQgYWNyb3NzIGFsbCBVU0IgY29uZmln
cy4NCj4gQEAgLTEzMzIsNiArMTMzMyw3IEBAIHN0cnVjdCBkd2MzIHsNCj4gIAl1bnNpZ25lZAkJ
ZGlzX3NwbGl0X3F1aXJrOjE7DQo+ICAJdW5zaWduZWQJCWFzeW5jX2NhbGxiYWNrczoxOw0KPiAg
CXVuc2lnbmVkCQl3YWtldXBfY29uZmlndXJlZDoxOw0KPiArCXVuc2lnbmVkCQlzdXNwZW5kZWQ6
MTsNCj4gIA0KPiAgCXUxNgkJCWltb2RfaW50ZXJ2YWw7DQo+ICANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+IGlu
ZGV4IGMwY2E0ZDEyZjk1ZC4uZjI0NGJlYmYxZWEwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3Vz
Yi9kd2MzL2dhZGdldC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gQEAg
LTI0NDAsNiArMjQ0MCw3IEBAIHN0YXRpYyBpbnQgZHdjM19nYWRnZXRfZnVuY193YWtldXAoc3Ry
dWN0IHVzYl9nYWRnZXQgKmcsIGludCBpbnRmX2lkKQ0KPiAgCQkJcmV0dXJuIC1FSU5WQUw7DQo+
ICAJCX0NCj4gIAkJZHdjM19yZXN1bWVfZ2FkZ2V0KGR3Yyk7DQo+ICsJCWR3Yy0+c3VzcGVuZGVk
ID0gZmFsc2U7DQo+ICAJCWR3Yy0+bGlua19zdGF0ZSA9IERXQzNfTElOS19TVEFURV9VMDsNCj4g
IAl9DQo+ICANCj4gQEAgLTM5MzgsNiArMzkzOSw4IEBAIHN0YXRpYyB2b2lkIGR3YzNfZ2FkZ2V0
X2Rpc2Nvbm5lY3RfaW50ZXJydXB0KHN0cnVjdCBkd2MzICpkd2MpDQo+ICB7DQo+ICAJaW50CQkJ
cmVnOw0KPiAgDQo+ICsJZHdjLT5zdXNwZW5kZWQgPSBmYWxzZTsNCj4gKw0KPiAgCWR3YzNfZ2Fk
Z2V0X3NldF9saW5rX3N0YXRlKGR3YywgRFdDM19MSU5LX1NUQVRFX1JYX0RFVCk7DQo+ICANCj4g
IAlyZWcgPSBkd2MzX3JlYWRsKGR3Yy0+cmVncywgRFdDM19EQ1RMKTsNCj4gQEAgLTM5NjIsNiAr
Mzk2NSw4IEBAIHN0YXRpYyB2b2lkIGR3YzNfZ2FkZ2V0X3Jlc2V0X2ludGVycnVwdChzdHJ1Y3Qg
ZHdjMyAqZHdjKQ0KPiAgew0KPiAgCXUzMgkJCXJlZzsNCj4gIA0KPiArCWR3Yy0+c3VzcGVuZGVk
ID0gZmFsc2U7DQo+ICsNCj4gIAkvKg0KPiAgCSAqIElkZWFsbHksIGR3YzNfcmVzZXRfZ2FkZ2V0
KCkgd291bGQgdHJpZ2dlciB0aGUgZnVuY3Rpb24NCj4gIAkgKiBkcml2ZXJzIHRvIHN0b3AgYW55
IGFjdGl2ZSB0cmFuc2ZlcnMgdGhyb3VnaCBlcCBkaXNhYmxlLg0KPiBAQCAtNDE4MCw2ICs0MTg1
LDggQEAgc3RhdGljIHZvaWQgZHdjM19nYWRnZXRfY29ubmRvbmVfaW50ZXJydXB0KHN0cnVjdCBk
d2MzICpkd2MpDQo+ICANCj4gIHN0YXRpYyB2b2lkIGR3YzNfZ2FkZ2V0X3dha2V1cF9pbnRlcnJ1
cHQoc3RydWN0IGR3YzMgKmR3YywgdW5zaWduZWQgaW50IGV2dGluZm8pDQo+ICB7DQo+ICsJZHdj
LT5zdXNwZW5kZWQgPSBmYWxzZTsNCj4gKw0KPiAgCS8qDQo+ICAJICogVE9ETyB0YWtlIGNvcmUg
b3V0IG9mIGxvdyBwb3dlciBtb2RlIHdoZW4gdGhhdCdzDQo+ICAJICogaW1wbGVtZW50ZWQuDQo+
IEBAIC00Mjc3LDYgKzQyODQsNyBAQCBzdGF0aWMgdm9pZCBkd2MzX2dhZGdldF9saW5rc3RzX2No
YW5nZV9pbnRlcnJ1cHQoc3RydWN0IGR3YzMgKmR3YywNCj4gIAkJaWYgKGR3Yy0+Z2FkZ2V0LT53
YWtldXBfYXJtZWQpIHsNCj4gIAkJCWR3YzNfZ2FkZ2V0X2VuYWJsZV9saW5rc3RzX2V2dHMoZHdj
LCBmYWxzZSk7DQo+ICAJCQlkd2MzX3Jlc3VtZV9nYWRnZXQoZHdjKTsNCj4gKwkJCWR3Yy0+c3Vz
cGVuZGVkID0gZmFsc2U7DQo+ICAJCX0NCj4gIAkJYnJlYWs7DQo+ICAJY2FzZSBEV0MzX0xJTktf
U1RBVEVfVTE6DQo+IEBAIC00MzAzLDggKzQzMTEsMTAgQEAgc3RhdGljIHZvaWQgZHdjM19nYWRn
ZXRfc3VzcGVuZF9pbnRlcnJ1cHQoc3RydWN0IGR3YzMgKmR3YywNCj4gIHsNCj4gIAllbnVtIGR3
YzNfbGlua19zdGF0ZSBuZXh0ID0gZXZ0aW5mbyAmIERXQzNfTElOS19TVEFURV9NQVNLOw0KPiAg
DQo+IC0JaWYgKGR3Yy0+bGlua19zdGF0ZSAhPSBuZXh0ICYmIG5leHQgPT0gRFdDM19MSU5LX1NU
QVRFX1UzKQ0KPiArCWlmICghZHdjLT5zdXNwZW5kZWQgJiYgbmV4dCA9PSBEV0MzX0xJTktfU1RB
VEVfVTMpIHsNCj4gKwkJZHdjLT5zdXNwZW5kZWQgPSB0cnVlOw0KPiAgCQlkd2MzX3N1c3BlbmRf
Z2FkZ2V0KGR3Yyk7DQo+ICsJfQ0KPiAgDQo+ICAJZHdjLT5saW5rX3N0YXRlID0gbmV4dDsNCj4g
IH0NCj4gLS0gDQo+IDIuMTcuMQ0KPiA=
